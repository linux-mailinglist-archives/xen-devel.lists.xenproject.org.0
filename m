Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE4A74860
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 11:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930464.1333094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty72N-0006Og-59; Fri, 28 Mar 2025 10:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930464.1333094; Fri, 28 Mar 2025 10:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty72N-0006N7-2d; Fri, 28 Mar 2025 10:34:07 +0000
Received: by outflank-mailman (input) for mailman id 930464;
 Fri, 28 Mar 2025 10:34:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ty72M-0006N1-0K
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 10:34:06 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2aea97b2-0bc0-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 11:34:03 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so1581065f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 03:34:03 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fba4c29sm23985045e9.5.2025.03.28.03.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 03:34:02 -0700 (PDT)
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
X-Inumbo-ID: 2aea97b2-0bc0-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743158042; x=1743762842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0NS9nfpAufetqP2tPmAke1ZnKvnsQ0Ae1JnsvKi6rBM=;
        b=cxgUQyPRTOD+HQlTo5dPMiEzTU0+4ZYpYExJ3kb/lizVO/B5criPnaBDobT92K9fFI
         jFTcwHH3F0y4ho4ZIfc+ODiDwy5TRwGujbnyQbWh5nMzK1vygnQAOrMOCU+VHf2hejmd
         Kpzj1wVAiwR9A0psRheNo2AIkwp/2nkubEp4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743158042; x=1743762842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NS9nfpAufetqP2tPmAke1ZnKvnsQ0Ae1JnsvKi6rBM=;
        b=g5d7RxQdzgkMXIRMxzFZ+dC5k4PWMzzjVl5C88T4qfQxY2iIHR0rz/0skM7A2icstD
         a9wu1Gt+ANOWH7fy7P+6wyiHdMta5GEx3R4LoS6h9Ryx0ki+C1rkbMekbotZ5WU+DWRD
         /CNzLeXs6s6Xyd5kuqDTldS7JP3vf27jz6k41nuqZDCvnX2yQHzIX76X18ggQqL/DEqu
         mBxLTCgvfN82L4CRmfY0UOmZQTPQb8AvdMXTTUvSsBc156Ptgb/Wkutzs2/YUWeoqSp5
         RtQC5RHqlMeRWmzVV52Snkk3Ff3ABWJCINdbB5FBo/m8+/UApvFVcmE3/dw13WSn+Nd0
         3f1w==
X-Forwarded-Encrypted: i=1; AJvYcCXgP9AZWlcx+sixJHalaW+soqAOXO30iLgsPm1BPdZFZefcrgEs34+KBMWjAahJ8uGV/ImWds9PAwM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfUsWuw1wc+0JX1YXrqpqZnkZC3lPxSEKUQ+O84467cadyaTab
	+oQVvMKSLVATZUqm7TzsBPyp54capTzeevr1WCzjXEdL4SgvTFssjtmUHpJmVpHgtC1iRmhBbkZ
	rVtc=
X-Gm-Gg: ASbGncu+6k4hjgHMf9DewK6nBQCKsFUGr0O/TNaRwSJEDsWj0c3viNCreUNEHFdrGit
	k/naTIkxXZi/Ozu4JQ7Ir8aeYUGCuPDwZrpQo1PVi2M5FlQRDDUj43yJTdAIGWI7/ldXEZBifwI
	nnY6uUV4rFf7jJ5yZizcVVwgbCUWGGlEgBFqB0vPYnq2dHWOIThFv8DVclledIHBWGSiwSaRgq0
	aUjtSk7HxLmlbFTc3r4nSZ74rTk0wDIERf6vSWpSvw5kJdJLQmDRQZUKnU1xe6u2l+QW3pHXO6P
	ZyoQPypvct1omOLAvTeFbtxbIxtBH+5R5sUoGY3/6ElS3Q25FOtJ8hXvFskLv22kd43/tj/RTk0
	jtDVJ13eKYw==
X-Google-Smtp-Source: AGHT+IE4BUCalWax9OCVllI69HW8kN5hqwu+t0br7ETCrS8qqXb+bmFkiSWDmUi+6KyMOBNIncav8A==
X-Received: by 2002:a5d:6d0a:0:b0:390:ea4b:ea9 with SMTP id ffacd0b85a97d-39ad1760636mr6941569f8f.39.1743158042494;
        Fri, 28 Mar 2025 03:34:02 -0700 (PDT)
Message-ID: <7380409b-2eb5-4d52-9574-4cf0fc5c071e@citrix.com>
Date: Fri, 28 Mar 2025 10:34:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <6b21fb046cf1c8ca760f5ad72fa3cc13b59c4069.1743092485.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6b21fb046cf1c8ca760f5ad72fa3cc13b59c4069.1743092485.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 5:33 pm, Oleksii Kurochko wrote:
> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
> index d888b2314d..7d43159efb 100644
> --- a/xen/include/xen/config.h
> +++ b/xen/include/xen/config.h
> @@ -98,4 +98,14 @@
>  #define ZERO_BLOCK_PTR ((void *)-1L)
>  #endif
>  
> +#define BYTES_PER_LONG  __SIZEOF_LONG__
> +
> +#define BITS_PER_BYTE   __CHAR_BIT__
> +#define BITS_PER_INT    (BITS_PER_BYTE * __SIZEOF_INT__)
> +#define BITS_PER_LONG   (BITS_PER_BYTE * BYTES_PER_LONG)
> +#define BITS_PER_LLONG  (BITS_PER_BYTE * __SIZEOF_LONG_LONG__)
> +
> +/* It is assumed that sizeof(void *) == __alignof(void *) */
> +#define POINTER_ALIGN   __SIZEOF_POINTER__
> +
>  #endif /* __XEN_CONFIG_H__ */

As it turns out, this is a prerequisite for the byteswap cleanup.

~Andrew

