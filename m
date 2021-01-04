Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDF22E9902
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 16:42:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61314.107776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRzV-0007EW-Kg; Mon, 04 Jan 2021 15:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61314.107776; Mon, 04 Jan 2021 15:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwRzV-0007E8-H7; Mon, 04 Jan 2021 15:41:53 +0000
Received: by outflank-mailman (input) for mailman id 61314;
 Mon, 04 Jan 2021 15:41:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rg9=GH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwRzT-0007E3-SU
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 15:41:51 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cef77528-f330-4aa6-a5d6-9a9bd13b7e61;
 Mon, 04 Jan 2021 15:41:50 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: cef77528-f330-4aa6-a5d6-9a9bd13b7e61
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609774910;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=QtnFQD9n2uumFuH1GwBC4CBR1DzMfnYt6NeI9pL17I4=;
  b=SHUHG1ZkzLn1/SxUOezGGE/39OIYkf0vww3Ci25FSUFcbjYnadIZ3m/e
   aLrZRqQk5i9osU16HgGhITUAPQey/bafd7UXPVMKRukZuqT7pyexNV/MP
   7P7Uv27kbDnENcjE8Wh9qyoTOxXoYVCyzfdvWKu931FAV5KSqksTbETAz
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: asdrWCAsqc+uF02HY/o+OJxREj3+b6QIDznpfxirGsUZHd57VWW5vIthu3Xjo1x44haIK97smQ
 LGOyYAZIbl8C5EAS1pqWrMrVNl1b2SqhaL5Nidr4TuApJy7IN09HRqw5yCah96vDkhxAwbpDqY
 wu1frbTmv17mucWcCiu8SfDeoOqPsn7rmUcjgOJztFKAbH/PmIxofxepa2E3FISemLdKMPD0UC
 PYKcSdobsSnaz4weWTyLtOvpjK9ZGVGaBM9C9cIgrwyWq3CSroJKuPhJsvBt5pRLE43nXB2NVd
 Lko=
X-SBRS: 5.2
X-MesageID: 34577908
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34577908"
Subject: Re: [PATCH v2] gnttab: defer allocation of status frame tracking
 array
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
 <920f3df3-3343-3947-e318-da3b8dd8a56c@citrix.com>
 <ec21a8d6-744c-0f02-cedd-c35d36097a8a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <25c6efe0-fb29-eb83-badf-70cd2dade0d7@citrix.com>
Date: Mon, 4 Jan 2021 15:41:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ec21a8d6-744c-0f02-cedd-c35d36097a8a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 04/01/2021 15:22, Jan Beulich wrote:
> On 04.01.2021 16:04, Andrew Cooper wrote:
>> On 23/12/2020 15:13, Jan Beulich wrote:
>>> This array can be large when many grant frames are permitted; avoid
>>> allocating it when it's not going to be used anyway, by doing this only
>>> in gnttab_populate_status_frames().
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v2: Defer allocation to when a domain actually switches to the v2 grant
>>>     API.
>> I see this as a backwards step.  It turns a build-time -ENOMEM into a
>> runtime -ENOMEM, and if you recall from one of the XSAs, the Windows PV
>> drivers will BUG() if set_version fails.  (Yes - this is dumb behaviour,
>> but it is in the field now.)
> Well, if this was the only source of -ENOMEM (i.e. none was there
> previously), I'd surely understand the concern. But there have been
> memory allocations before on this path.

... you're literally writing a patch saying "avoid large allocation at
domain create time, and make it at runtime instead" and then trying to
argue that it isn't a concern because there are other memory allocations.

It is very definitely a backwards step irrespective of the size of the
allocation, even if the current behaviour isn't necessarily perfect.

>  In any event, this will
> need settling between you and Julien, as it was him to request the
> change.

Well - that's because gnttab v2 is disabled in general on ARM.

Conditionally avoiding the allocation because of opt_gnttab_max_version
being 1 would be ok, because it doesn't introduce new runtime failures
for guests. 

The correctness of this change does depend on opt_gnttab_max_version
being invariant for the lifetime of a domain.  If it were to become a
runtime parameter, it would need caching per domain, (which is frankly
how it should have been implemented all along, along with a parameter in
XEN_DOMCTL_createdomain).

~Andrew

