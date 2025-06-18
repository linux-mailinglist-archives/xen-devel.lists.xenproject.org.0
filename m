Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6275AADEEEE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 16:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019206.1396012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtXA-0005Bz-QD; Wed, 18 Jun 2025 14:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019206.1396012; Wed, 18 Jun 2025 14:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtXA-00059X-Ls; Wed, 18 Jun 2025 14:13:00 +0000
Received: by outflank-mailman (input) for mailman id 1019206;
 Wed, 18 Jun 2025 14:12:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKfJ=ZB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uRtX8-00059I-OD
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 14:12:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5525d843-4c4e-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 16:12:57 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so59096875e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 07:12:56 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-453424cbe40sm132939475e9.21.2025.06.18.07.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:12:56 -0700 (PDT)
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
X-Inumbo-ID: 5525d843-4c4e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750255976; x=1750860776; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8e0YMqmnQhgZziqUpEQZoFJcgoBEqaAvlH6FlIkAf+w=;
        b=qzHr2XGEHczYkeIFDuaBuow5H1TDM3mk6YNWerTOgH/X48kr23JRIh1TWw+qdBDc6W
         PyafKXJesvYGfKpguz7dbQyDz1qwXMVLh1sM/UHEf3A7w1RQiswZLem/wqYqBBeprmNV
         tohc/dUxM0QxIkAuZwrScdGC5TbHgZOt+rqMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255976; x=1750860776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8e0YMqmnQhgZziqUpEQZoFJcgoBEqaAvlH6FlIkAf+w=;
        b=MmqPR0qlkLHq4hvt429H84p3az3hjZbs33sW9BY7JD8Jzp/53H7qAxaJuIcNay2LIW
         +s4TyZQp7zioFHWJ3/aiafprYqCDZVHSMyLwhuRzFVRY6zV5yT4S8DPINipIeZKp30v2
         vCMDENh9n71yr5NK9er14OIsJat0OrNvK4cAfafv98bS6/yA9mo7+JbABwW8JDlgdKej
         U5n4cnDjO3ULFiXu3lmJr/RX8/QOXRPx8N830VGypWFgXa99wYreF1wLwcXGjeSXUCEH
         NzTBC7GUYoth50NzGh9al2WaSC6VJaonU4S2hTM5DLgc6xr8TkMzPt4ijS8Szaj8K/kG
         XTug==
X-Forwarded-Encrypted: i=1; AJvYcCXRf7ZT3c3mrUUA9iUN6HKKWJi7bLjECk0VzJmG+/5pkps+k/7PKDfYA9PF9iuBgkKun7POEEKbYco=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+xmtvCMbz2xhjMy8eGjt/CVmL7hetAALi6rvQ9iNkWbfDlYba
	IoVirMG1sP7SXchFZU7QDUe14ztQI6pWqwoDayIsDPMoVJ3kwhctkpyg/+EZXwoVSRE=
X-Gm-Gg: ASbGncudPS3/3ZIUmHbbc0HyW8QeDWbRUhIC0kiMDSK5VcbDYkPX1BfzJzwZJ81GT/a
	sUUt9BGZFMWgeh6W7w1UeEmVttVqPxt17AWObMmbknXTX5gxSztP1mtTHKFvQXxQhmZ4zaTi7yI
	OgQ35D+mmx+XWmEWjeWPEX964z8iRkF51hsFuklJXYvHlueolFrb6G9mg+jHXlfr64QTPp0P238
	nYZGc6znHiCar87l+6WcR1V70xoaUbAXEiw0uOzbv84sJXruyS8tRohb6kPkSHHq9Ujk3TCJ8RF
	AQbPVI2+K56MI3VzHGEu0Dwpelw9Y6g56R2RnWGsiMAj8ymyoAqOS2dj+v84JHvPfX7W78yUXp/
	Zxur2LfcpPDp02Fnc8DUnYfLwx6XEP/9GBXs=
X-Google-Smtp-Source: AGHT+IFKUkV/bCtr1wUwrOzQYoRtjXIta96Nq3d5QKhZmlFGVaFZs91jIJs/qRHybkwWjYE5h49loQ==
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr147021675e9.11.1750255976383;
        Wed, 18 Jun 2025 07:12:56 -0700 (PDT)
Date: Wed, 18 Jun 2025 16:12:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 8/8] pdx: introduce a command line option for offset
 compression
Message-ID: <aFLJZ9OlCahiPvf-@macbook.local>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-9-roger.pau@citrix.com>
 <2d8f85aa-af34-4f4c-b3ce-52640cb207f5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d8f85aa-af34-4f4c-b3ce-52640cb207f5@suse.com>

On Wed, Jun 18, 2025 at 03:36:57PM +0200, Jan Beulich wrote:
> On 11.06.2025 19:16, Roger Pau Monne wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -2072,6 +2072,28 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
> >  those not subject to XPTI (`no-xpti`). The feature is used only in case
> >  INVPCID is supported and not disabled via `invpcid=false`.
> >  
> > +### pdx-compress
> > +> `= <boolean> | auto | fast | slow`
> > +
> > +> Default: `auto`
> > +
> > +Only relevant when hypervisor is build with PFN PDX offset compression
> > +`CONFIG_PDX_OFFSET_COMPRESSION`.
> 
> Which, however, the name of the command line option doesn't reflect at all.
> Question is what your thoughts were towards what if another compression
> method also wanted a command line control.

This will become a boolean option that applies to all PDX
compressions: `pdx-compress = <boolean>` to enabled or disable PDX
compression.

Thanks, Roger.

