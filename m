Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0043A1F7BD7
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 18:54:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjmw9-0004cg-VZ; Fri, 12 Jun 2020 16:53:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dChH=7Z=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jjmw8-0004cY-NW
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 16:53:48 +0000
X-Inumbo-ID: 48853082-accd-11ea-b5f2-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48853082-accd-11ea-b5f2-12813bfff9fa;
 Fri, 12 Jun 2020 16:53:47 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pxFI2Da+eeTPtFqwFes9rTX92L1uHDhEzTJhKZUPNOFGvUW44xplGVm3YoYIW88itrNhiwgrAY
 ORcduGCSEIWR9SWG/WBujgFl0Zoi/7p3eeYPePM2nPsQNFBTMvY1XDi/WnapFfoFwM+nIA+kKS
 BIq4K8V8wZHQGrY3dhPx389YHu6ugsaDl9w/hHr22hYTiJcM/frYmv7uoHIOiJ1xax+SaWSsRM
 p73HGeynEYCjgUxepli+t6JbTGowjtW53a3OFBQtOXzIPYxZjhCcWjlMXJXvy82h86AfihBQ9E
 jos=
X-SBRS: 2.7
X-MesageID: 19939533
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,504,1583211600"; d="scan'208";a="19939533"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24291.45845.782250.165305@mariner.uk.xensource.com>
Date: Fri, 12 Jun 2020 17:53:41 +0100
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [XEN PATCH for-4.14] tools/xen-ucode: fix error code propagation
 of microcode load operation
In-Reply-To: <1591980255-18811-1-git-send-email-igor.druzhinin@citrix.com>
References: <1591980255-18811-1-git-send-email-igor.druzhinin@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <xadimgnik@gmail.com>, "wl@xen.org" <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Igor Druzhinin writes ("[PATCH] tools/xen-ucode: fix error code propagation of microcode load operation"):
> Otherwise it's impossible to know the reason for a fault or blob rejection
> inside the automation.
...
>          fprintf(stderr, "Failed to update microcode. (err: %s)\n",
>                  strerror(errno));

This part is fine.

> +        ret = errno;
>      xc_interface_close(xch);
...
>      }
>      close(fd);
>  
> -    return 0;
> +    return ret;

Unfortunately I don't think this is right.  errno might not fit into a
return value.  Returning nonzero on microcode loading error would
definitely be right, but ...

... oh I have just read the rest of this file.

I think what is missing here is simply `return errno' (and the braces)
There is no need to call xc_interface_close, or munmap, if we are
about to exit.

I think fixing the lost error return is 4.14 material, so I have
added that to the subject line.

Paul, would you Release-ack a patch that replaced every `return errno'
with (say) exit(12) ?  Otherwise, fixing this program not to try to
fit errno into an exit status is future work.  Also I notice that the
program exits 0 if invoked wrongly.  Unhelpful!  I would want to fix
that too.

Ian.

