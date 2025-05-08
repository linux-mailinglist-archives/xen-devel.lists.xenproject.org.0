Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA1DAAF713
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 11:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979150.1365845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxqQ-0000dy-CZ; Thu, 08 May 2025 09:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979150.1365845; Thu, 08 May 2025 09:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxqQ-0000cD-9w; Thu, 08 May 2025 09:47:10 +0000
Received: by outflank-mailman (input) for mailman id 979150;
 Thu, 08 May 2025 09:47:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=326h=XY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCxqO-0000bL-TY
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 09:47:08 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68024267-2bf1-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 11:47:08 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so3457525e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 02:47:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099ae3bc0sm20099131f8f.35.2025.05.08.02.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 02:47:07 -0700 (PDT)
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
X-Inumbo-ID: 68024267-2bf1-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746697627; x=1747302427; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L3xZk/rILM/7PDy0v9j5+YFn7jSJIp7QohOXIDNIcow=;
        b=KwHGSLMWSG/93aVLe+kZkAnnuWpqVwHf++D7CQJBPtyxMb3HewVakbIA1oiylveCRr
         IeJLRLve0xYMeKUYa/4ah0nnzENlKy1hh9hJXiY83Ig9GTjewHMfzi3bqsbb7VAeoyaG
         VheJTK1be/wPo6vSI6ZMiWIBrjAPTNDLE6nKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746697627; x=1747302427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3xZk/rILM/7PDy0v9j5+YFn7jSJIp7QohOXIDNIcow=;
        b=qBaPEK3vozDRiDY/j89QQ8CjycDOOYeq3ycGJHL2l6g5PyWLy4NDtbH4mwHoi1e4oi
         YioufCRPU2CYlPvgbuoK1bKkgiWScutv89xmljcbDTM3CfVZf7MVUtTOhfnJy1hG8Dd+
         0Qt4Ai3OwgGajkKUe1FzHFH+IuwqR/8izauqAFINj0iEuBh9l0YmGazoXXuZbr5hboqI
         ta8m/gSA9DLBv/kUKNxv6axNRMd53mD6tfKY3qEMxxLbbB4Un0nCaOZ1BmbD0cvRQkw7
         Wlz6UNZwz++YlTClt3ltY6plhTiAEZUfgWJix1xBhp0wBPQSUlYnsUw7yiOrP1gTI/Kd
         0hQw==
X-Forwarded-Encrypted: i=1; AJvYcCXwjrNJLY9h9mCX3jujJE6IP0UCVD26ufftpOpUGkE+iL5p97B36pqud4gImgidlmsuN3oqVj6rVDM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3BrpaCu/ExEK9ym37REybJuqql+oVBsozDgkiXl/cJ41OA9HS
	ANCl+HksQTy3MW9s6sWXiG1Ra/RYh+keQyNYlBP7d2q3yX96lMhW2PJuMnVrLtE=
X-Gm-Gg: ASbGncvxj7mUTDPI9dx9dMiVF2m4941TFhrnLlNcr8DvSfnK0MpKF1llQSs5Y1Lk8xn
	cA370iDRb1P410EYQyixnZWPzuXie8VY/n5ygmSOdIeoHwaKfRD10N2LbPjf7yLs2HdgxoAgUYX
	klq/oBc6mhS9ecLOoC6h3Rmg48/Bwh/VC73tSe4eNflmCiX21ekj70PmJF5i8EuRsQ1nApDnKAv
	HqE9raT6D027et7kyyxa8TkWP5Pthw6MlBuovm4uV23r1NYJxseZ8/OIwDZVmzgbkU8mwQ4Vpkh
	MP9nngtZILc+ZfbqRASnuPsaQWaXE2xT8ZcoBgbuejKcbQ==
X-Google-Smtp-Source: AGHT+IEYjWHSrdH6LOH9Ne5hPipacuHqdkm8/QDz/4y6RvMjCwMqVnn/qkHjPOVrqiMJJpgvZATSNw==
X-Received: by 2002:a05:600c:8716:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-441d44bbf09mr58850545e9.2.1746697627636;
        Thu, 08 May 2025 02:47:07 -0700 (PDT)
Date: Thu, 8 May 2025 11:47:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 07/11] vpci: Hide extended capability when it fails to
 initialize
Message-ID: <aBx9mhPzN7_yndig@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-8-Jiqian.Chen@amd.com>
 <af333718-8a7b-4e97-a24e-16699b6dd0bf@suse.com>
 <BL1PR12MB58494C2ACD017CA85802061BE78BA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BL1PR12MB58494C2ACD017CA85802061BE78BA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, May 08, 2025 at 09:16:49AM +0000, Chen, Jiqian wrote:
> On 2025/4/23 00:06, Jan Beulich wrote:
> > On 21.04.2025 08:18, Jiqian Chen wrote:
> >> --- a/xen/include/xen/pci_regs.h
> >> +++ b/xen/include/xen/pci_regs.h
> >> @@ -449,6 +449,7 @@
> >>  #define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
> >>  #define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
> >>  #define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
> >> +#define PCI_EXT_CAP_NEXT_MASK		0xFFC00000U
> > 
> > To avoid introducing redundancy, imo this addition calls for
> > 
> > #define PCI_EXT_CAP_NEXT(header)	MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK)
> When I tested this locally, I encountered errors: every next position address loss two bits zero.
> The next register has 12 bits, according to PCI spec, the bottom two bits are reserved zero,
> so "#define PCI_EXT_CAP_NEXT_MASK 0xFFC00000U" is fine,
> but if change this "#define PCI_EXT_CAP_NEXT(header) MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK)",
> I need to change PCI_EXT_CAP_NEXT_MASK to be 0xFFF00000U, is it fine?

Oh, I see.  You might want to do:

#define PCI_EXT_CAP_NEXT_MASK		0xFFF00000U
/* Bottom two bits of next capability position are reserved. */
#define PCI_EXT_CAP_NEXT(header)	(MASK_EXTR(header,
					           PCI_EXT_CAP_NEXT_MASK)
					 & 0xFFCU)

The spec says:

"The bottom 2 bits of this offset are Reserved and must be implemented
as 00b although software must mask them to allow for future uses of
these bits."

So we need to make sure they are masked.

Thanks, Roger.

