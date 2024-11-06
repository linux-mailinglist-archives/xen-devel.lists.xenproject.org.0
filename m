Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15FC9BEA44
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830919.1246032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fMt-0002CL-4R; Wed, 06 Nov 2024 12:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830919.1246032; Wed, 06 Nov 2024 12:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fMt-0002AU-15; Wed, 06 Nov 2024 12:42:39 +0000
Received: by outflank-mailman (input) for mailman id 830919;
 Wed, 06 Nov 2024 12:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlMZ=SB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8fMs-0002AN-0U
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:42:38 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 985fc5ef-9c3c-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 13:42:34 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2feeb1e8edfso59066971fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 04:42:34 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb1813f2fsm273114166b.192.2024.11.06.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 04:42:33 -0800 (PST)
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
X-Inumbo-ID: 985fc5ef-9c3c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzQiLCJoZWxvIjoibWFpbC1sajEteDIzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk4NWZjNWVmLTljM2MtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODk2OTU0LjE0MDY1Nywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730896953; x=1731501753; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zPyp0UkTCP99QMvF1Hd2D2V2wLDFdR8ptIUgliY9SNw=;
        b=X9UKEud/QhiR90sAIkdpVOKRpZ72vupCwkeWOKRh4wul0nllDe34ERZPXS47y/XUYQ
         xQr8VrDVRMkhKgKtiT1h6a/+15qGZL4sTtxI7hbKFweAwaxVh2KvUZbrX4u0nuAN0xHo
         lodN8a6R1Wdui3TKrwQj4SMda9fq9YeESwA0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730896953; x=1731501753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPyp0UkTCP99QMvF1Hd2D2V2wLDFdR8ptIUgliY9SNw=;
        b=Em+qr3DX2WYm9vGVRFtuhH/eFCrZjsQ8E/W3fUO+V+CutYu9wWjQm0sgaEH4gET+X4
         ohCJebrbkXgFarJqGwp8wa4n6jfcUoJ81TW805PGFkO9UT0LjorfFFrjC4HGHF/vO9OX
         Q9AOQQ5eFOs4CfX+IGtoQ7MQTJ3Y49+dXCm5C1FP6DY5VX+Pb6RZcpR5T0bIDOy+wfLo
         1iWeX86haPVlEqtUSqPi+aSV+9QJ8Amsd445/dSin6vh9zH8Syf/z97etweGa3m8Baiy
         uTxx1rJFAZiSE1l1sr79H33B+v0urJ2EGnYNWSNl/uB2oDh+zbMGDG7FhHOmFxiuebQa
         zTDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6HH0f5Uhklj6Y45zS9v5NFHO++d+yJwCWTfJCgk2mccJJtzfoL4DqibT2BLyDqh52UmTVPATH98c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9ksZQDFbwDZtq9L/nvUoKgdIHGv4CkmmqoNUKfAHIGI5wlBCa
	ITPww23a5VLwVNgsTtOIg3ckDlTADmhRvxQkKwC8Im/zefPKc1KZLSf2tOjmMaI=
X-Google-Smtp-Source: AGHT+IEw7/d2pKpYUEnpQ8E3DoMjMMc3e+XtNIAbq1FFkoHHxf1U+CtdgtoeH3Z0gHSzctEc6zZNIA==
X-Received: by 2002:a2e:a589:0:b0:2fb:3df8:6a8c with SMTP id 38308e7fff4ca-2fedb7c9c38mr143665571fa.23.1730896953476;
        Wed, 06 Nov 2024 04:42:33 -0800 (PST)
Date: Wed, 6 Nov 2024 13:42:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
Message-ID: <ZytkOP_7nmeSVEYH@macbook>
References: <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
 <ZyswF4grJSNcVqY_@macbook>
 <Zysx4ZwCUv62uTBw@macbook>
 <6d3f322f-7047-4033-95b5-86751a58cc70@suse.com>
 <65d2043f-5e6f-4d84-8241-eb28dd94fc45@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65d2043f-5e6f-4d84-8241-eb28dd94fc45@epam.com>

On Wed, Nov 06, 2024 at 12:26:55PM +0000, Mykyta Poturai wrote:
> On 06.11.2024 10:07, Roger Pau Monné wrote:>
> > Wait - how can msi->vectors ever be 0?  AFAICT there's no way in the
> > MSI logic to configure 0 vectors, there will always be at least 1 vector
> > enabled.
> >
> > Maybe what you want, if this fix is for compliance reasons, is an
> > assert unreachable that msi->vectors > 0?
> 
> I did some investigation and figured out that the value of 0 is being
> set by guest writing to msi_control_reg. As far as I understand, the
> control_write() function only checks that vectors are not greater than
> the maximum allowed value, but does not check for 0.

control_write() will set vectors to (1UL << val), so even if user
provides val == 0, vectors will be 1.

Can you provide an example input value of control_write() that will
lead to msi->vectors == 0?

Is maybe msi_maxvec not set correctly in your use case if you indeed
see vectors == 0?

Thanks, Roger.

