Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615022613D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 15:45:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxW6M-0002ua-R1; Mon, 20 Jul 2020 13:45:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jxW6L-0002uB-Jn
 for xen-devel@lists.xen.org; Mon, 20 Jul 2020 13:45:05 +0000
X-Inumbo-ID: 2ff209ac-ca8f-11ea-9fa7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ff209ac-ca8f-11ea-9fa7-12813bfff9fa;
 Mon, 20 Jul 2020 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595252693;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OuiEP3D65JBIDm2R1AzKgKM4VFlaTnShCJIfjbHA2Dg=;
 b=LkgaOjcLyiChOPc4jVy8esxPqsRJmHJ7LKxIsxxh6DKd1II1cn6kUVdA
 kC4xN0czVrluqNGZd/1URpkMpnVY5PzcYplqL62qyKR+osQVFVTDLh/+S
 RRGFO5WK8KoQnczx1Yb6uqX1lKmsDBa6rrPrndOAQ7pYwPAc/Jtk9TSX/ Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sNyUv7VO9pjGKXyswLM1TpeV6PWBf4YBhqlfyQbFFMeziSp3EwpWsVcfqABUCpw1FTCaHzUAiw
 ij+9alrRXwiPyLEBu6RgqkIuhM2WIGLbZSOWCqIIbO68a5oGUBt368oGDD0ovD2gTxmpgexUKM
 IxtU0mpQjgJv2B64F5+kc99RKPJavAYpwe3+EpvVgVOYKPcCJjIYnxqg0a86mOx6MBgv01FDqk
 pSc2vBe4DWoIs8K1Aw7NS9AJkkc8+b9OvYFvBzQr6fG4PvAmAMDLFn1LLnSNvZarYUi58i0etn
 H6c=
X-SBRS: 2.7
X-MesageID: 22950362
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,375,1589256000"; d="scan'208";a="22950362"
Subject: Re: [oss-security] Xen Security Advisory 329 v2 - Linux ioperm bitmap
 context switching issues
To: Mauro Matteo Cascella <mcascell@redhat.com>,
 <oss-security@lists.openwall.com>
References: <E1jw3ms-0006i6-Se@xenbits.xenproject.org>
 <CAA8xKjVib9UERsMrAy3nNdVssNxLciXTmmhmXqq1gvhO16URew@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <57e20b43-53cb-acc6-2634-4fc3b29e2312@citrix.com>
Date: Mon, 20 Jul 2020 14:44:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAA8xKjVib9UERsMrAy3nNdVssNxLciXTmmhmXqq1gvhO16URew@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-users@lists.xen.org, xen-announce@lists.xen.org,
 "Xen.org security team" <security-team-members@xen.org>,
 xen-devel@lists.xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

/sigh - it seems that stuff like this doesn't get done when I'm on holiday.

I'll get one sorted.

~Andrew

On 17/07/2020 08:54, Mauro Matteo Cascella wrote:
> Hello,
>
> Will a CVE be assigned to this flaw?
>
> Thanks,
>
> On Thu, Jul 16, 2020 at 3:21 PM Xen.org security team
<security@xen.org <mailto:security@xen.org>> wrote:
>
>                     Xen Security Advisory XSA-329
>                               version 2
>
>              Linux ioperm bitmap context switching issues
>
> UPDATES IN VERSION 2
> ====================
>
> Public release.
>
> ISSUE DESCRIPTION
> =================
>
> Linux 5.5 overhauled the internal state handling for the iopl() and
> ioperm()
> system calls.  Unfortunately, one aspect on context switch wasn't wired up
> correctly for the Xen PVOps case.
>
> IMPACT
> ======
>
> IO port permissions don't get rescinded when context switching to an
> unprivileged task.  Therefore, all userspace can use the IO ports
> granted to
> the most recently scheduled task with IO port permissions.
>
> VULNERABLE SYSTEMS
> ==================
>
> Only x86 guests are vulnerable.
>
> All versions of Linux from 5.5 are potentially vulnerable.
>
> Linux is only vulnerable when running as x86 PV guest.  Linux is not
> vulnerable when running as an x86 HVM/PVH guests.
>
> The vulnerability can only be exploited in domains which have been granted
> access to IO ports by Xen.  This is typically only the hardware
> domain, and
> guests configured with PCI Passthrough.
>
> MITIGATION
> ==========
>
> Running only HVM/PVH guests avoids the vulnerability.
>
> CREDITS
> =======
>
> This issue was discovered by Andy Lutomirski.
>
> RESOLUTION
> ==========
>
> Applying the appropriate attached patch resolves this issue.
>
> xsa329.patch           Linux 5.5 and later
>
> $ sha256sum xsa329*
> cdb5ac9bfd21192b5965e8ec0a1c4fcf12d0a94a962a8158cd27810e6aa362f0 
> xsa329.patch
> $
>
> DEPLOYMENT DURING EMBARGO
> =========================
>
> Deployment of the patches and/or mitigations described above (or
> others which are substantially similar) is permitted during the
> embargo, even on public-facing systems with untrusted guest users and
> administrators.
>
> But: Distribution of updated software is prohibited (except to other
> members of the predisclosure list).
>
> Predisclosure list members who wish to deploy significantly different
> patches and/or mitigations, please contact the Xen Project Security
> Team.
>
>
> (Note: this during-embargo deployment notice is retained in
> post-embargo publicly released Xen Project advisories, even though it
> is then no longer applicable.  This is to enable the community to have
> oversight of the Xen Project Security Team's decisionmaking.)
>
> For more information about permissible uses of embargoed information,
> consult the Xen Project community's agreed Security Policy:
>   http://www.xenproject.org/security-policy.html
>
>
>
> --
> Mauro Matteo Cascella, Red Hat Product Security
> 6F78 E20B 5935 928C F0A8  1A9D 4E55 23B8 BB34 10B0



