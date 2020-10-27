Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E21E29AA55
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 12:12:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12798.33165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMty-0004sN-2l; Tue, 27 Oct 2020 11:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12798.33165; Tue, 27 Oct 2020 11:12:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMtx-0004ry-Vm; Tue, 27 Oct 2020 11:12:29 +0000
Received: by outflank-mailman (input) for mailman id 12798;
 Tue, 27 Oct 2020 11:07:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kXMpL-00046I-L3
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 11:07:43 +0000
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2ef190e-2cbf-4c37-b705-1e0ce4afbe85;
 Tue, 27 Oct 2020 11:07:42 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id 33so953289edq.13
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2020 04:07:42 -0700 (PDT)
Received: from C02ZJ1BNLVDN.emea.arm.com (52-67-201-31.ftth.glasoperator.nl.
 [31.201.67.52])
 by smtp.gmail.com with ESMTPSA id h8sm735126eds.51.2020.10.27.04.07.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 04:07:41 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kXMpL-00046I-L3
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 11:07:43 +0000
X-Inumbo-ID: d2ef190e-2cbf-4c37-b705-1e0ce4afbe85
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d2ef190e-2cbf-4c37-b705-1e0ce4afbe85;
	Tue, 27 Oct 2020 11:07:42 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id 33so953289edq.13
        for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2020 04:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QhOFNmdP+x17aFRPk5F31RIidLvDON2O5YUEDajIylk=;
        b=Or1c3Yo+7Q0waEUXKiaP75uP7sdPNmRMvgO/O14pbHx0CiQ2i6ktSORNDhV/+fYKHA
         XajEjcSKB66aLLdOICupx/IKk/XbAd2ovNf65UzbwtMHAaw2Wkjtsb41FhbpuiqjMi5Q
         z3x8ZujPak0nIrYG2McCGWCD0Kl11lWwnGa2y51RGBqHsnFUauu7KTpzrJEI7TXqu0nW
         aSbI2Y0uPvhLQMxSJnsozrzDTlxovB9koHl+qxGdmAUQk3bU/2NO/Toc4jQ7ldSlaznA
         mv7W1jndoGArtuSE7tDv4b/bgrYwhywz++mheEWeapysBVa3nPqaJkKDLjZp3t1UDkyA
         kvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QhOFNmdP+x17aFRPk5F31RIidLvDON2O5YUEDajIylk=;
        b=PLHqk74f9/9FKacFv9i0sdrQHwOOY5kRlVGMjaD2B/IFcpB9cVlA30HMxkyW4PQXIB
         ClPHkt2JA8q5OKd4+lhhJJLCTo1H7myHYefndLJmQAcdYb0v7LaAPXw/vSZLidvnYViU
         5wDb4vaOPWhUM97pVNne6PL7sBVgottkhK2noWBfL3xm2udxoucGP9RCe7lBqADpHea2
         931ngECoUInACKLai00wXzy5aw7uRFKaNUNfNh77KM3WTixGIQ9mdpfZoQrISJjF0mAb
         bZ7iX20LeXtLJtRieQ50Vve7/OrRv7KeJEQvVD4cuHODMedXzkHJRex7BQU0canvWY74
         YIow==
X-Gm-Message-State: AOAM530/4borXjP7/G/JnVFS5Z6HumdDQVvpDges6BwfpF19fb66/yLh
	u+euCl4FNzPvXQXHFduMPOI=
X-Google-Smtp-Source: ABdhPJxv5B6i49ryFRqBgOtlU6TEizhzggiZggFruVog7eU/9F39FpxkWSTkRPTquDqsFQnPBTDnSQ==
X-Received: by 2002:aa7:c7cf:: with SMTP id o15mr1543834eds.15.1603796861867;
        Tue, 27 Oct 2020 04:07:41 -0700 (PDT)
Received: from C02ZJ1BNLVDN.emea.arm.com (52-67-201-31.ftth.glasoperator.nl. [31.201.67.52])
        by smtp.gmail.com with ESMTPSA id h8sm735126eds.51.2020.10.27.04.07.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 04:07:41 -0700 (PDT)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: julien@xen.org
Cc: Ash.Wilding@arm.com,
	Bertrand.Marquis@arm.com,
	Rahul.Singh@arm.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	paul@xen.org,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Date: Tue, 27 Oct 2020 12:07:40 +0100
Message-Id: <20201027110740.79646-1-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <9cf9f8d3-b699-de3c-781f-f7ad1b498899@xen.org>
References: <9cf9f8d3-b699-de3c-781f-f7ad1b498899@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Julien,


> Would Arm be willing to add support for LSE before merging the
> SMMUv3?

(( Taking my Arm hat off for a second and speaking independently... ))

I've been toying with doing this in my own personal time but unsure how
long it would take (unable to commit much time on it right now). I'll
let the Arm folks speak for themselves as to whether they're able and
willing do it.

If not, I don't necessarily think pulling in Linux's LL/SC and LSE
atomics helpers should block merging the SMMUv3 driver if everything
else is OK after review; we could use Rahul's versions in the driver
for now and then merge Linux's helpers later.


> I would prefer to follow the same approach as Linux and allow Xen to 
> select at boot time which implementations to use. This would enable 
> distro to provide a single binary that boot on all Armv8 and still
> allow Xen to select the best set of instructions.

Yep good idea, agreed.

Note that while Linux uses the alternatives framework for LL/SC vs LSE,
it's still controlled by CONFIG_ARM64_LSE_ATOMICS, see [3]. This would
give us the best of both worlds - distros can build with the Kconfig =y
to enable single image with runtime detection, while expert users can
still build a custom image to force use of LL/SC on v8.1+ systems should
they wish.


> I asked Jan to add this line in the commit message :). My concern was 
> that even if we provided a runtime switch (or sanity check for
> XSA-295), the GCC helpers would not be able to take advantage (the
> code is not written by Xen community).

Ahh yes, makes sense - all the more reason for us to get explicit
implementations into Xen sooner rather than later :-)


Thanks,
Ash.

> [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=5d45ecabe3
> [2] https://xenbits.xen.org/xsa/advisory-295.html
[3] https://elixir.bootlin.com/linux/latest/source/arch/arm64/include/asm/lse.h#L7

