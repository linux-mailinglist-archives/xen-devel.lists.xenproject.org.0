Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AC144C6BA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 19:17:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224371.387663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mks9i-0001yt-Up; Wed, 10 Nov 2021 18:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224371.387663; Wed, 10 Nov 2021 18:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mks9i-0001wT-RR; Wed, 10 Nov 2021 18:17:06 +0000
Received: by outflank-mailman (input) for mailman id 224371;
 Wed, 10 Nov 2021 18:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=76Yc=P5=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mks9i-0001wN-09
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 18:17:06 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 677be753-4252-11ec-a9d2-d9f7a1cc8784;
 Wed, 10 Nov 2021 19:17:04 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:45970)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mks9e-000OIO-iV (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 10 Nov 2021 18:17:02 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 8B3FE1FB51;
 Wed, 10 Nov 2021 18:17:02 +0000 (GMT)
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
X-Inumbo-ID: 677be753-4252-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <20211110174059.64633-1-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH for-4.16] x86/cpuid: prevent shrinking migrated policies
 max leaves
Message-ID: <519775a1-ba90-c5c5-82c1-abcd8c4ebb01@srcf.net>
Date: Wed, 10 Nov 2021 18:17:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211110174059.64633-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 10/11/2021 17:40, Roger Pau Monne wrote:
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpui=
d_x86.c
> index 198892ebdf..3ffd5f683b 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -638,6 +638,13 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint3=
2_t domid, bool restore,
>          }
>      }
> =20
> +    /*
> +     * Do not try to shrink the policy if restoring, as that could cau=
se
> +     * guest visible changes in the maximum leaf fields.
> +     */
> +    if ( !restore )
> +        x86_cpuid_policy_shrink_max_leaves(p);

Nothing in xc_cpuid_apply_policy() changes any of the max leaves, so
this is dead logic.

xc_cpuid_xend_policy() can in principle change max leaves, but that
logic is all horribly broken and I don't recommend touching it.

I'd just drop this hunk entirely, and retain the deletion in the hypervis=
or.

~Andrew


