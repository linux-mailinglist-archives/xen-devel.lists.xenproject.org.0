Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CD0C49664
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 22:26:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158721.1487152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIZPB-0003OP-Dm; Mon, 10 Nov 2025 21:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158721.1487152; Mon, 10 Nov 2025 21:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIZPB-0003My-B4; Mon, 10 Nov 2025 21:26:29 +0000
Received: by outflank-mailman (input) for mailman id 1158721;
 Mon, 10 Nov 2025 21:26:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NhZs=5S=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vIZPA-0003Ms-M6
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 21:26:28 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5f16b49-be7b-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 22:26:20 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-298250d7769so8471165ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 13:26:20 -0800 (PST)
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
X-Inumbo-ID: e5f16b49-be7b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762809979; x=1763414779; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFaSpbEeEWlm6saSXKTVet3psxgvT7XoH/HQLrH0hns=;
        b=Ryo69RD2PDoI94Y32RGqpEs0hr+qQ8+Ul0zPccx84oMntST0P+TJJFmPIjEQWie3Qv
         pcXCxiIhauu8froPbUKIzyXqSUqkeAKD8Q9d1RvDqi5HiMeItypE2WVAHzgeKaY5iXMA
         ABQ9GPoxoaOBbBZU0TZOiDwg3/mOoiIQHGZqSCUlUMhL8A3a29ibW2lHbzjil32TFHQQ
         kMNdqsCoeTUvohEFZwdc0cqH3igzGSWL328b0Ziml8pIGUy+pDZ6fluHK3gg93F30etP
         v+XxDojuo1I7zW65meLVus53rYN1JVuxqoet+OGa+5dMJ4z4ZDDCskv9WbvJUM+yqK4H
         ThRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762809979; x=1763414779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFaSpbEeEWlm6saSXKTVet3psxgvT7XoH/HQLrH0hns=;
        b=M0VBa3TdcKpilsBE/rsO4JQjjzB6WAaxNWfuSd4qK1PsK6zlhUpwZhqW4Hg6AnXr6/
         LFbCNUryqhcl9f9TPwwnFXDQ5Ho8xaQLhfqjau90kc9nEdSGrMSRV2BaMvReOBZDmLYx
         HituHEDPjv1IFJHT1n0Gpc+uplMIEiISM84kppGZqTF04Fgc3ztE3DeA6v1MSHplbzUn
         QDex9BruoUc1uAc5UC5lNtOR+q2nw/4xxrY5Kd5IyLWD3cxro+OVn6Dam4rXLkiQNCRm
         /UehRVVsMBFK+/KLWLDKSgm3tGsD+vOAtEakENVY/v5HlEQoFrkZOE2Soj48IARrFsin
         Rokg==
X-Forwarded-Encrypted: i=1; AJvYcCVrKAOUto87esfEK6oBwf3ylCCtVxpTwxqSwi6tjOq/Yct3Kcc3+rohfh7ql7NBv2gAlO0U0eCe2lU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZ1PVHksq3bIoVnCV0jPI2QuOhBXEV9t3GC5ARzDqIotsCzd29
	6RtW25NcgC+pZ8o/FeiuqANMg+7WaGHdl4VQq6GJJh/zRwfIguXFqLdR8xMBSHKrFXfFSwTLdhn
	lzqmAPK5EwupvxmWHYf68IM3//gzLQpVPQE/1CA==
X-Gm-Gg: ASbGncsd0lYROPPOHTEknmOYKNcmjeZt/ummVunRtTCHK5f9tGrkpHUwQvqfNcUDKYH
	QS/YbaLk+WzvnlBh+nr0/re+en6H+YnDi+DdIbpTq9gEmn5tfNVTz28/Anq0LrO6aoUjk666Q9y
	ID8UG2OfHS6JJ1+1U3RzUVvUlM1nknTvJElHXI0Ozkvb0VP5L2ASM2ye5fEJyDNx+ogauD2Kv/0
	Q6Gw6TvkRAzu8C0GjTm7geqykio8HPawS8aBa23K//j62TA+F3ENpc5dQWJOBvZmkq6
X-Google-Smtp-Source: AGHT+IE8i7GQxkWg034R9C/DqIgb7t0E60wx7hRqXAOSHMQOCM+M7ULYjPULGdBlccDi19/asahJrp3Te3C8qtcwWI0=
X-Received: by 2002:a17:903:988:b0:295:9cb5:ae07 with SMTP id
 d9443c01a7336-297e56c9dccmr102362685ad.38.1762809978973; Mon, 10 Nov 2025
 13:26:18 -0800 (PST)
MIME-Version: 1.0
References: <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
 <6f708273afb6de9c5f26f2c71c34c98e957904a0.1761599320.git.samaan.dehghan@gmail.com>
 <b701374d-61b4-4657-bd01-4c6975741fbd@citrix.com> <ed198b16-f15f-40f2-ae38-85292e52dad1@suse.com>
In-Reply-To: <ed198b16-f15f-40f2-ae38-85292e52dad1@suse.com>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Mon, 10 Nov 2025 15:26:08 -0600
X-Gm-Features: AWmQ_blOkyT29G0mOoKssCVTl3j7y9IRCwrMJYfSj_mnCFBBSndXZ0PYGBNd1YY
Message-ID: <CAHFNDNjcUYC2AiU12eifOeqAbveAqCGHX6+=2oE15-bQ8NzjGw@mail.gmail.com>
Subject: Re: [PATCH v4] xen: Support LLVM raw profile versions 5, 6, 7, 8, 9,
 and 10
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Wentao Zhang <wentaoz5@illinois.edu>, Matthew L Weber <matthew.l.weber3@boeing.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 8:03=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 27.10.2025 23:36, Andrew Cooper wrote:
> > On 27/10/2025 9:30 pm, Saman Dehghan wrote:
> >> This change enables compatibility for measuring code coverage
> >> with Clang versions 11 through 20 by supporting their respective raw
> >> profile formats.
> >>
> >> 1- Added support for LLVM raw profile versions 5, 6, 7, 8, 9, and 10.
> >> 2- Initialized llvm_profile_header for all versions based on llvm sour=
ce
> >>    code in compiler-rt/include/profile/InstrProfData.inc for each vers=
ion.
> >> 3- We tested this patch for all Clang versions from 11 through 20
> >>    on x86 platform.
> >> 4- Fixed linking warnings related to LLVM profile sections in x86.
> >>
> >>
> >> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> >> Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >> Tested-by: Wentao Zhang <wentaoz5@illinois.edu>
> >> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> Changes from v3 to v4:
> >>   1- Use LLVM_PROFILE_VERSION in preprocessor conditionals
> >>      instead of __clang_major__.
> >>   2- Use DIV_ROUND_UP helper.
> >>   3- Remove unnecessary zero initialization inside struct.
> >>   4- Remove fallback macro definitions in linker script.
> >> Changes from v2 to v3:
> >>   1- Additionally support raw profile version 5, 6, 7 in clang 11, 12,=
 13.
> >>   2- Fix coverage related linking warnings in x86.
> >>   3- Revert unnecessary type changes, casting, etc.
> >> ---
> >
> > Excellent.  Thankyou.  This all looks in order.  I've committed it.
>
> I thought I would backport this, but I would need a variant that wouldn't
> regress profile version 4 on the older branches

Thanks Jan for offering to backport this. Which target branches do you
have in your mind?

> regress profile version 4 on the older branches

Do you mean some of these branches are still using clang < 11 so that
we need to adapt our patch accordingly? Let me know how we can help.

Thanks
Saman

>
> Jan

