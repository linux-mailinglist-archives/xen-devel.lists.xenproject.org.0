Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E77A1A745
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 16:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876346.1286707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tazPd-0000gy-1H; Thu, 23 Jan 2025 15:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876346.1286707; Thu, 23 Jan 2025 15:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tazPc-0000et-UW; Thu, 23 Jan 2025 15:46:32 +0000
Received: by outflank-mailman (input) for mailman id 876346;
 Thu, 23 Jan 2025 15:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrAP=UP=bounce.vates.tech=bounce-md_30504962.67926454.v1-6f4cd110751f4a0d9dc20ee8aea8c00f@srs-se1.protection.inumbo.net>)
 id 1tazPb-0000en-NL
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 15:46:31 +0000
Received: from mail180-4.suw31.mandrillapp.com
 (mail180-4.suw31.mandrillapp.com [198.2.180.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35bc0b3d-d9a1-11ef-a0e5-8be0dac302b0;
 Thu, 23 Jan 2025 16:46:29 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-4.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4Yf5041JkvzlgWY5
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:46:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6f4cd110751f4a0d9dc20ee8aea8c00f; Thu, 23 Jan 2025 15:46:28 +0000
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
X-Inumbo-ID: 35bc0b3d-d9a1-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1737647188; x=1737917188;
	bh=qZYA7QoYh/1BL2aHwxg5JDHqafw6k32+xHrB0+1VTtY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gmtyhtKMAGb2z6HZ8meI9nwufwSi5GiYAOim+wcDCXiPqLiIj1EqnTmCEhN9HBQ86
	 Ik26KQJ28Mq7QGbCD4umcMGh2wAl//77UA2PT2I4XLl7iJYkrzyZcc6akNIzzVEO9i
	 tmUeukYFf410c9tHIS9xYBt8gejX9R5iMesSTAc7rddxRhwCsitSIXmg0LK4QD3VPm
	 +ZHi85keV8wmNrrfBhbWWiTmH9y+9yTsS5gVse8sI+a93DePIQfZV5xo8RiYKcAkYY
	 AkTiOKq7FdhfDGdrjGHkhvWb3ifnu/4pAEmUlEGrjTX59GALseQHLVxeRXT7DceXdx
	 Qkf/uWTEwpVYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1737647188; x=1737907688; i=teddy.astie@vates.tech;
	bh=qZYA7QoYh/1BL2aHwxg5JDHqafw6k32+xHrB0+1VTtY=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dyClGd/nxuC+0lrygYRAG0p1G+pQqxIOX6B6ACHxfxfyp0uhDQ8BIB9LXCmpu4dHb
	 wE5z09tq48wCF+Nqv1+BMVLxwjI1X378iWcgnrXcuy3KrvXMLomz9XG4SvTsDs3WIU
	 amCoSbPtZj0eWUOQOPt9xb4DxqBe25Bwc6cVd0Btsm2itWIC+x903X8GvzSod+WgTZ
	 Ecjr/nuQ76UPwV0ieSqrt15rqAuUyn/x3vfHKOhRHNlmik0FkDdjrfO3rT3aMfF4SX
	 PnZ/7B2+K3t7ayRzQKUrDd5VAVJVpl0UHlu3dVjPR25Gv6/jxXOm704RMhDhA5VPKB
	 zyplFrcEhiP0A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20RFC=20PATCH=20v5=200/5]=20IOMMU=20subsystem=20redesign=20and=20PV-IOMMU=20interface?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1737647186337
Message-Id: <27cbe4ae-054d-454e-8d8a-3eb2f4af7654@vates.tech>
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Mateusz=20M=C3=B3wka?=" <mateusz.mowka@intel.com>
References: <cover.1737470269.git.teddy.astie@vates.tech> <Z5I59HC77QxpPtJG@mail-itl>
In-Reply-To: <Z5I59HC77QxpPtJG@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6f4cd110751f4a0d9dc20ee8aea8c00f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250123:md
Date: Thu, 23 Jan 2025 15:46:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Marek,
Thanks for your testing.

Le 23/01/2025 =C3=A0 13:45, Marek Marczykowski-G=C3=B3recki a =C3=A9crit=C2=
=A0:
> Thanks for the updated patches. I have run them through gitlab-
ci, and
> here are some observations:
> - I needed to disable CONFIG_AMD_IOMMU (it fails to build, as expected at=
 this point)
> - I needed to disable pvshim (it fails to build)

> - fails to build with clang: https://gitlab.com/xen-project/people/marmar=
ek/xen/-/jobs/8931373789/viewer#L3525> - gcc-ibt build fails: 
https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/8931373785#L1314

Looks like another cf_check related issue that I missed.

> - fails to build for ARM (both 32 and 64) and PPC64

This is expected like for the AMD_IOMMU part.

> - QEMU smoke test panic with PV dom0, looks like it runs on AMD, so it
>    may be related to the disabled CONFIG_AMD_IOMMU, but I wouldn't expect
>    it to panic on _PV_ dom0 boot...

Looks like I broke something when there is no IOMMU detected (removed 
some check that should be there).

This patch should fix it (tested with QEMU without IOMMU).

---
diff --git a/xen/drivers/passthrough/context.c 
b/xen/drivers/passthrough/context.c
index 6e68f840f3..98c84b439b 100644
--- a/xen/drivers/passthrough/context.c
+++ b/xen/drivers/passthrough/context.c
@@ -347,6 +347,10 @@ int iommu_iotlb_flush_all(struct domain *d, u16 
ctx_no, unsigned int flush_flags
      struct iommu_context *ctx;
      int rc;

+    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
+         !flush_flags )
+        return 0;
+
      if ( !(ctx =3D iommu_get_context(d, ctx_no)) )
          return -ENOENT;

---

> - PVH dom0 fails to boot (on real hw) with a lot of VT-d faults: https://=
gitlab.com/xen-project/people/marmarek/xen/-/jobs/8931373875

I guess 00:02.0 is the iGPU. The addresses point to reserved memory in 
E820 (is it the framebuffer ?) which should be reconfigured by the guest.

Is the guest dying (maybe due to the PVH Dom0 issue) before being able
to setup anything, causing the GPU to not be properly set ?
I tested a plain Alpine 3.18 PVH Dom0 and the kernel crashes very early
(6.1.123-0-lts though).

Or there is something else going wrong like with PCI Passthrough.
> - PCI passthrough (with PV dom0) results in a lot of VT-d faults: 
> Note this uses only this series, but plain Linux (appears to be 6.1.19).
> IIUC if one doesn't try to configure PV-IOMMU specifically (non-default
> contexts) it should still work.

Yes, and PV-IOMMU drivers will likely not fix the issues you are facing.

> 
> BTW Linux says it detected "Xen version 4.19." - shouldn't it report
> 4.20 already at this point in release cycle?
> 

It's probably because I mostly tested on Xen 4.19 (for practical reasons 
to make toolstack happy), but I will update it to staging.

> All results:
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1637849303
> 

Thanks

Teddy



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


