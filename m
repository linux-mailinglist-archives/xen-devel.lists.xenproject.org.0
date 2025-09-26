Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF262BA2AD8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 09:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131165.1470360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22id-00067C-2G; Fri, 26 Sep 2025 07:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131165.1470360; Fri, 26 Sep 2025 07:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v22ic-00064S-Vy; Fri, 26 Sep 2025 07:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1131165;
 Fri, 26 Sep 2025 07:18:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sfwB=4F=gmail.com=igor.korkin@srs-se1.protection.inumbo.net>)
 id 1v22ib-00064M-Pe
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 07:18:13 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5bb4875-9aa8-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 09:18:12 +0200 (CEST)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-b4f9d61e7deso1328196a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 00:18:12 -0700 (PDT)
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
X-Inumbo-ID: f5bb4875-9aa8-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758871090; x=1759475890; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FDT+m8A/96uy+EHTKMHVogsXak3+W4RoK/TV/Hdaj/U=;
        b=LwSw/RoVDaPUqFNUYk1gJHLkVH/zTbCl2wg2oVlZspP6HtWdoXtg2JQQuXI6M+nwbz
         nJFIY6vyZZq3mRuMsxvMTpOKr/2Sr5rpjrbbWzmCVqsNkIaafwoQ8GYeFBAMxCQEzgSl
         a9H1obHGQq5rcDrSNXvZWhneMbmFPWEfUWTzSDIJS5WPn6dK7VBAdpn2tgL+XJXBEmi8
         s9XiXZQQwzNZynVii6DwnC/wE8uKL06RD7bKI4pwWeVfXgnYZPJQYVUjL78wcCi1aadP
         KR0DTWjKrxXiPmsxSPadRI5sLkpB9bbf1TEg0zdotBL3NJHroxV9dXtviLlmEfs7DpLl
         nLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871090; x=1759475890;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDT+m8A/96uy+EHTKMHVogsXak3+W4RoK/TV/Hdaj/U=;
        b=qTTrgtEt+Y+yimpAiW5nIWHyPW3WR2L2b/UwgLfJxOS/D4/DRz/fzNYNdDTbUTUE7B
         fwgcGRbVmXmSFR29EljLkWUjpww5clo4QOjbK0ckjxUqkhJkVTq9aZ6a2go+wDL+gmKE
         yuXPaHHM9FPyfmamussaDn33nLqYxj+EnzH9NQYga1A3Rp/b+1zPj/fCcxBx2VW0fNlv
         +RTbDIcPbzgx/IfVGyiTTKQGYYtH02QUo4h9NkXS4e5Qwpmd3lfCk9HN7hp8fklX7RFP
         TT1GHiBQTmL0RaA8SZGmW4a9T+ArU0EW6yNctSbz1FK1zwhVOMdh3GznQGCHddZcQa0x
         A9rg==
X-Gm-Message-State: AOJu0YynOteUG0H+wa762Onk1+XdxDlsBLNS3s5Es88KIcepdenXX3vH
	fdDbiirKHM/7vcSKVSXTqtZ61o1fpVEt6IClPCPKmkXOR6cX1lLhBBGkROG2XTJtILSpCt5gqX9
	gso4k8xoKiqeBQBvhCmM3A/weBUlYDY25JllfV3Sn7GTy
X-Gm-Gg: ASbGncuhHIkrpdrSIvsQV6Qqh2K9tlSUKjE1CqWl1em8GqJibz63JK8DM1eBp7mziSh
	LGohQ1z1bK2xIjBr6/FpyfapecHJLBqI+5iAj1XsQImoe/tvS2BoFSnsIG0NXpWu5lR2OU9MDYK
	Bni8BKundjXAN6/QNYt9tiwIeqaq37OT6oOXgzxQHo0rumIiXVgm6yYQuB9mC6f0avopeAFACAu
	Hd0
X-Google-Smtp-Source: AGHT+IH6G1Qfts+Eup9LUP00KZH7cduDW7LI9JDyMxbMS09gzMQijMsO+fjsAecy89tJT/NokZ7veYtFfJGlzv1gYa4=
X-Received: by 2002:a17:903:32c3:b0:27c:3a0f:f066 with SMTP id
 d9443c01a7336-27ed49d0a47mr60362045ad.22.1758871090436; Fri, 26 Sep 2025
 00:18:10 -0700 (PDT)
MIME-Version: 1.0
From: Igor Korkin <igor.korkin@gmail.com>
Date: Fri, 26 Sep 2025 10:17:59 +0300
X-Gm-Features: AS18NWBzv6tM-WwilUsX2piuTa0kb817jZtG6bX9GimDTH2NElOGBXzcHWESaCU
Message-ID: <CAC8oKvry6UFOE6B9dkfWFPEkehc3o4w+xJPZJe-sUpks6WmzNA@mail.gmail.com>
Subject: [Question] Unexpected growth of nr_cpu in `credit` Xen scheduler?
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm observing a steady and abnormal increase in the `nr_cpu` value
reported by the `credit` Xen scheduler
(visible via `sudo xl dmesg; sudo xl debug-keys r`).


This behavior occurs consistently when the system is subjected to
heavy synthetic load (e.g., multiple VMs running stress workloads that
fully saturate vCPUs).
Over time, `nr_cpu` grows far beyond the actual number of physical or
logical CPUs (48 in our case), and this correlates with noticeable
performance degradation, especially under high VM density.

We=E2=80=99re running on a dual-socket x86_64 server (2 =C3=97 12-core Inte=
l Xeon
Silver 4310 CPUs with Hyper-Threading, total 48 logical CPUs) under
Xen 4.19.

Is this growth of `nr_cpu` expected in the credit scheduler?
If not, it may indicate a bug in CPU accounting or runqueue management
that warrants further investigation.


Environment details:
- xen_version            : 4.19.0-5.25.0.38431
- xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32
hvm-3.0-x86_32p hvm-3.0-x86_641
- xen_scheduler          : credit
- Hardware : Dual-socket Intel Xeon Silver 4310 @ 2.10GHz (12
cores/socket, HT enabled, 48 logical CPUs)
- NUMA nodes : 2
- Dom0 kernel : Debian 6.1.147-1 (6.1.0-38-amd64, SMP PREEMPT_DYNAMIC)
- nr_cpus                : 48
- nr_nodes               : 2
- release                : 6.1.0-38-amd64
- version                : #1 SMP PREEMPT_DYNAMIC Debian 6.1.147-1 (2025-08=
-02)
- machine                : x86_64
- nr_nodes               : 2
- cores_per_socket       : 12
- threads_per_core       : 2
- cpu_mhz                : 2100.000
- virt_caps              : pv hvm hvm_directio pv_directio hap shadow
iommu_hap_pt_share vmtrace gnttab-v1 gnttab-v2
- total_memory           : 130724
- free_memory            : 54064


I=E2=80=99d appreciate any insight=E2=80=94whether this is known behavior, =
a
configuration issue, or a potential bug in the scheduler.

Thanks in advance,

Igor Korkin

