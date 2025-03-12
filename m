Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626FFA5E1E0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 17:37:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910546.1317236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsP44-0005Bv-RM; Wed, 12 Mar 2025 16:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910546.1317236; Wed, 12 Mar 2025 16:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsP44-00059b-OD; Wed, 12 Mar 2025 16:36:16 +0000
Received: by outflank-mailman (input) for mailman id 910546;
 Wed, 12 Mar 2025 16:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3Ag=V7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tsP42-00058Z-Vw
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 16:36:15 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bf8898a-ff60-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 17:36:13 +0100 (CET)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2ff187f027fso168923a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 09:36:13 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-30119265943sm2014196a91.36.2025.03.12.09.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 09:36:11 -0700 (PDT)
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
X-Inumbo-ID: 1bf8898a-ff60-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741797372; x=1742402172; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M9Ip+TLrjNLUnpSlMDUjqctFg+lcOgix2F6wl6STCfM=;
        b=YlAODTrry2ZasBFKQb1Dgs8+jbuRDt8mLOergIP8CL6QcD5PGxZx7ntVoZjKfl8tZ/
         vcuhsO7YQC3DuXEN4gVNlHkk5/OeOZ6ZJ1hdp5L4BG0UGqZu1cZDurbVXfkP17zwlBqc
         R/XfU5Qh0SrNoq7sBJy7Sfh4PdBrfRklyp0ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741797372; x=1742402172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9Ip+TLrjNLUnpSlMDUjqctFg+lcOgix2F6wl6STCfM=;
        b=aZy59i42X53iCnSU0ATm8NGlh3RFpYc5Q20oMHMb/QjDk2NX+vOJjmXbkzLcrtRYY0
         EOJD/YlOsPOg3Fpgo0MVQnlLoCLvnH3C2Fqecv+/fAqp29SJxndBa93kDwZLrIlM+PQg
         MFNM/0hjoP/8EaSMx7BOh98oeMzLAA8mRAzGlE7YmBKoXNlRzsUwSOUF0e1Tokk93gMX
         JCSmXd2d9y6Zd/c5xJt+3kKBY+8LAB+fpFsvhsXu9D0jyh73i3yEDzjWQyLfW+F04uwF
         FAmni3XVnaIBQj5/x8/HVOJQgAE6Dyx2Heuqgyw4pKXvgYlUm1mKe/N6RlDBl4eqWRT/
         D+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVBkit6EAiZJnmmKa2iRcutcZcx/6aDmUToop5rkams4iXxuOvnrEt1w80KG3JfgTLlUAw99OsW2/E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywe9f7ftYiMhq2VNOY6WpQALejxvDPwMiURS1PbRBNDjlxKCd8w
	ms7oPV/+A4T9BexWigOXc8AFzWAb6U02uE4+lqD/A5MKz6Dv6NxO/i9KzuDAnB4=
X-Gm-Gg: ASbGncvj0qhzn9Fh83kAQR3bS0hqehZAAs/iG+ldsiEQhaqF/+r4t3f9kWHeLOgokZq
	3pvgID6E9Rsdb1A9g9EE7wPHAS292wQ2uyRBLcCGoFrJqKvNc6zmLkpVxE6Nx79GQJul0Uc3N1y
	MspRZvjMMmopVsF7o8Wj+4aqPLAq3IeJ7zM4nvHCNchEWZxZPb7xEYYHHgZ3rjlA+sxVlvR2V75
	kl27ErMClg/ECY++DS7BZmAa57JvKHWmISiJxXlW3dFrAKD7FK7rZW0Sq6fl3wC6kilM9Q47zXj
	hl9IdMezhFb3FR/I8Bpnm4K4udhnG1HXiQnV+tnK352fJjZ82g==
X-Google-Smtp-Source: AGHT+IEtNelhitUjRi629pSLf+aeDvl+mztEQBveE61NAVp/14CsRSVGKhxccw6BR63Qhf855cjmnA==
X-Received: by 2002:a17:90b:520e:b0:2fe:93be:7c9d with SMTP id 98e67ed59e1d1-30132d4ea33mr283537a91.7.1741797371570;
        Wed, 12 Mar 2025 09:36:11 -0700 (PDT)
Date: Wed, 12 Mar 2025 17:36:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
	Community Manager <community.manager@xenproject.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] CHANGELOG.md: Mention PCI passthrough for HVM domUs
Message-ID: <Z9G39ULeHr7fp9ur@macbook.local>
References: <20250312040220.2624329-1-Jiqian.Chen@amd.com>
 <a8919be5-020c-47f3-8bfa-02dab2f1e2ca@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a8919be5-020c-47f3-8bfa-02dab2f1e2ca@suse.com>

On Wed, Mar 12, 2025 at 09:51:09AM +0100, Jan Beulich wrote:
> On 12.03.2025 05:02, Jiqian Chen wrote:
> > PCI passthrough is already supported for HVM domUs when dom0 is PVH
> > on x86. The last related patch on Qemu side was merged after Xen4.20
> > release. So mention this feature in Xen4.21 entry.
> > 
> > Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> > ---
> >  CHANGELOG.md | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index 7201c484f899..b6de9b72ea7a 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >   - On x86:
> >     - Option to attempt to fixup p2m page-faults on PVH dom0.
> >     - Resizable BARs is supported for PVH dom0.
> > +   - Support PCI passthrough for HVM domUs when dom0 is PVH.
> 
> Aren't we still in need of SR-IOV support in order to make such an
> unconditional statement?

I view SR-IOV as kind of orthogonal to this: SR-IOV is not
supported at all on PVH dom0, so it's not just pass through, but the
capability itself that won't work as expected when using such devices.

Regards, Roger.

