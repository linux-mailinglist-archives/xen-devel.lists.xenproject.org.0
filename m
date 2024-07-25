Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30DD93BDB9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 10:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764799.1175345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtYm-0003rZ-67; Thu, 25 Jul 2024 08:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764799.1175345; Thu, 25 Jul 2024 08:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWtYm-0003q5-3O; Thu, 25 Jul 2024 08:10:48 +0000
Received: by outflank-mailman (input) for mailman id 764799;
 Thu, 25 Jul 2024 08:10:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KwaG=OZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sWtYk-0003pz-IE
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 08:10:46 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64652ede-4a5d-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 10:10:45 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-79ef72bb8c8so24923985a.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 01:10:45 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d73b5b7bsm54038185a.46.2024.07.25.01.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 01:10:43 -0700 (PDT)
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
X-Inumbo-ID: 64652ede-4a5d-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721895044; x=1722499844; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BRzauhp029bfNwoz4LI5DK7BUaVkg/wkvBoPwQYFbbI=;
        b=BYTJICBeMLQoIFufT3eek1SHYiEdldCSRjMbUlj9fyjc3EwO4kvGoK0DARzi1uexco
         D9lw2VowppYLQeXePic657MYFpVFTKNdqltcxoaApgG0XsfYolrrbOnSY/WbOMEMSbWV
         viUxn/yuI8sthGpp+CpDvcEkyFeHTVpY7yA/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721895044; x=1722499844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRzauhp029bfNwoz4LI5DK7BUaVkg/wkvBoPwQYFbbI=;
        b=baDagTv5NKC07EeQ516i2cS11yaW081V7QtAz7m1/opyAOUHtIhah/W4e20idPv+Bz
         zal9Fvp9eYTQbA3dHIe/mOfPmpnrePTLc09LDF3KTyet3Z0QBxIXVg34jP1gnE+R0Pk4
         SWlwX7AMzYgy7ad5kVB0v2qL+pAHBDgTsbVzAgqsT+NVgauYiDFET+BvFp2FYgrGxbKv
         W/GQEvsUl8IyUBwoIUKBHv6g6Ytat1jXTbNKYp9RiJWIDFg2L9qt2xpW/YoeX8dPqwJ1
         cHNrFxJ+ZXCnGJkMgXRbw7OZEUSMDAVvkqID4Og9MhoZLs/dPt0QYbP9B6EM6PzPBrsB
         g6YQ==
X-Gm-Message-State: AOJu0Yzv3KdaOEXFRdiuoK6aFMlQKRVQMe0z7+DR7ygdJn7b0Ac7TvHM
	tzQkzHBNrb/41JzWKlUyK8ZO/RjKBW64rL/mJb/wSHauIx9OUVhYdc/+RF7gF44=
X-Google-Smtp-Source: AGHT+IHMP8aNo2avdNrP4jZnmdyG2J4CN5eFB1+b/ecGVBYY0OwBduL2Js6UAhl6Pr/QYhscQPKKzw==
X-Received: by 2002:a05:620a:468f:b0:79e:ffdb:e32d with SMTP id af79cd13be357-7a1d7ef936amr119261485a.51.1721895044134;
        Thu, 25 Jul 2024 01:10:44 -0700 (PDT)
Date: Thu, 25 Jul 2024 10:10:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 2/2] x86/xen: fix memblock_reserve() usage on PVH
Message-ID: <ZqIIgc9xj6wmDJtE@macbook>
References: <20240725073116.14626-1-roger.pau@citrix.com>
 <20240725073116.14626-3-roger.pau@citrix.com>
 <a249e651-a2a1-4ea9-b262-0d04a8abaf0e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a249e651-a2a1-4ea9-b262-0d04a8abaf0e@suse.com>

On Thu, Jul 25, 2024 at 10:01:17AM +0200, Jürgen Groß wrote:
> On 25.07.24 09:31, Roger Pau Monne wrote:
> > The current usage of memblock_reserve() in init_pvh_bootparams() is done before
> > the .bss is zeroed, and that used to be fine when
> > memblock_reserved_init_regions implicitly ended up in the .meminit.data
> > section.  However after commit 73db3abdca58c memblock_reserved_init_regions
> > ends up in the .bss section, thus breaking it's usage before the .bss is
> > cleared.
> > 
> > Move and rename the call to xen_reserve_extra_memory() so it's done in the
> > x86_init.oem.arch_setup hook, which gets executed after the .bss has been
> > zeroed, but before calling e820__memory_setup().
> > 
> > Fixes: 38620fc4e893 ('x86/xen: attempt to inflate the memory balloon on PVH')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > While the commit that introduced the user-noticeable regression is
> > 73db3abdca58c, I think 38620fc4e893 should have been more careful to not
> > initialize the memblock ranges ahead of the .bss zeroing.
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> I'd prefer using 73db3abdca58c for the fixes tag. Otherwise you'd need to
> add this patch to the stable branches, too, which is technically not really
> needed.
> 
> Additionally I'd like to drop the Fixes: tag from the prereq patch, as this
> one doesn't really fix anything.
> 
> I can do both while committing.

I was unsure myself (as noted in the post-commit notes) about which
"Fixes:" tag to use.

Is there anyway that it can be noted that this commit depends on the
previous change also being present?  For backport reasons, if anyone
ends up backporting 73db3abdca58c it would also need to pick the two
patches here.

Thanks, Roger.

