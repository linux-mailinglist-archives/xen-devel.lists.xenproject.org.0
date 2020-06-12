Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A81F7B0F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:44:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjlqh-0005Ii-PW; Fri, 12 Jun 2020 15:44:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dChH=7Z=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jjlqg-0005Ib-5G
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:44:06 +0000
X-Inumbo-ID: 8b9e425a-acc3-11ea-bb8b-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b9e425a-acc3-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 15:44:05 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /4zzphKVAOE+c6m0SyfnltFuDjtRwyrGfrggpTZUCt3W+rhsIH/D7qh35/WSGbC0uht8mHSlLx
 ks8y3BIk33r1Mz23qv+Lcm+CLYAn10xNSTzNlK1094HeNBpsos+Q+0KJaVoT+fm27byRoGnVUU
 N7j9uC1PeMMp8f4Td9Bu/d7sWvioVeS/qbS7D2qrT/ci+5o39V2amLM5NH2kNwzIUdwBbDksWr
 Z7qjXhVtXMOJhpu7VWanifY+QLMFbVslM8qcNJFsfNpAeac3/xEZ3QfwN8BPWxTe9Y4HKKcNj8
 HwQ=
X-SBRS: 2.7
X-MesageID: 20687027
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20687027"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24291.41663.838349.127061@mariner.uk.xensource.com>
Date: Fri, 12 Jun 2020 16:43:59 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()
In-Reply-To: <765b4fed-60d3-9c4a-d6b7-bcd9893c525b@citrix.com>
References: <20200610114004.30023-1-andrew.cooper3@citrix.com>
 <010401d6408a$2c57bba0$850732e0$@xen.org>
 <765b4fed-60d3-9c4a-d6b7-bcd9893c525b@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Juergen Gross' <jgross@suse.com>,
 'Xen-devel' <xen-devel@lists.xenproject.org>, 'Wei Liu' <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Re: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()"):
> There is still the crash described below which needs some form of
> figuring out and fixing.
...
> >> Failure to create the logger will still hit the NULL deference, in all of the
> >> stable libs, not just devicemodel.

Are you sure ?

I think you mean this sequence of events:

  xencall_open(logger=NULL, open_flags=0)
     xcall->logger = NULL; /* from logger */
     xcall->logger_tofree = NULL;
     if (1) {
       xtl_createlogger_stdiostream => NULL
       /* so */ goto err;
     }

   err:
     xentoolcore__deregister_active_handle(&xcall->tc_ah); /* " */
     osdep_xencall_close(xcall);
     xencall_close(dmod->xcall);
     xtl_logger_destroy(xcall->logger_tofree /* NULL */); // <- crash?
     free(xcall);

But xtl_logger_destroy(NULL) is a safe no-op.

However,

> >> Also, unless I'd triple checked the history, I was about to reintroduce the
> >> deadlock from c/s 9976f3874d4

These comments made me look again at 9976f3874d4 "tools:
xentoolcore_restrict_all: Do deregistration before close".

Just now I wrote:

   I notice that the tail of xendevicemodel_open is now identical to
   xendevicemodel_close.  I think this is expected, and that it would be
   better to combine the two sets of code.  If they hadn't been separate
   then we might have avoided this bug...

But in fact this is not true.  xendevicemodel_close has them in the
right order, but xendevicemodel_open's err block has them in the wrong
order.

Now that I look at xencall, I discover tht xencall_open's err block is
not identical to xencall_close.  xencall close calls
buffer_release_cache and xencall_open's err block does not.  Looking
more closely I think this happens not to be a memory leak because
xcall->buffer* don't contain any malloc'd stuff until they are used.

But I think this is poor practice and another example of teardown code
duplication being a bad idea.

> >> because it totally counterintuitive wrong to
> >> expect setup and teardown in opposite orders.

Are you sure you wrote what you meant ?  To my mind it is usual for
setup and teardown to proceed in precisely the opposite order.

The need to call xentoolcore__deregister_active_handle before closing
the fd is to my mind unusual and counterintuitive.  The reasons are
explained in the commit message for 9976f3874d4cca82.

Does that all make sense ?

Perhaps we should at least delete the wrong err path of
xendevicemodel_open with a call to xendevicemodel_close ?

Ian.

