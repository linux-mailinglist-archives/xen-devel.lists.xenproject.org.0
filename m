Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C55AB55B1
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 15:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982818.1369171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpRK-0006Kl-TR; Tue, 13 May 2025 13:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982818.1369171; Tue, 13 May 2025 13:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEpRK-0006IH-Qk; Tue, 13 May 2025 13:12:58 +0000
Received: by outflank-mailman (input) for mailman id 982818;
 Tue, 13 May 2025 13:12:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0QL=X5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uEpRI-0006IB-W7
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 13:12:56 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc1694e2-2ffb-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 15:12:56 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so40603265e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 06:12:56 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32835dsm212502055e9.6.2025.05.13.06.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 06:12:54 -0700 (PDT)
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
X-Inumbo-ID: fc1694e2-2ffb-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747141976; x=1747746776; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dxbm6FfLxgSxrosKDyA/5smhaagyBlWg54myvnyjRLo=;
        b=fg1K0/pNZcJU0QXlOCnfnoBDcpg1Qix/e2pMdx20K5J+2vza6/ITx3l2H7PATmOONE
         KjHJLslIbwDGsDXh1S++57cOIbTtk+/n22O8JNLiQTNyMqCUoGnTtdRl9Lixx06U4xjK
         z9h0h6H0vyzgnTjmCvO9MTDRvUqHu/zg6GLFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141976; x=1747746776;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxbm6FfLxgSxrosKDyA/5smhaagyBlWg54myvnyjRLo=;
        b=P7qjPcnM2yzDYJBey211ombY5c61DkHQCC2jjh129ciw73/8wG0P8ItT4igRokUHwq
         BDzyCgpc9E3utF+ScnuENH7fcPuiuUcqxMBvyM8fV2Ebb17T0zvh8Ojz4drOxqrHhpnf
         Hkh9Gvmi62ufmebA+8UDj6kUiern3jA04kA7w962Z79QBsP7xvE9WFNDo7HfA32rtVcw
         8yakrjg2WE6sbEJsCGOHdhljPxUbeJback8y0Ib3y0/2QvTMzUckh6viT7hnEGMbaivV
         SqpEMePUUGu5+12p55/kLHOpvxXGvsoYYjMsnRTaCB+38kQmfYH1IEuc2VLfn1A1WVI2
         X+og==
X-Forwarded-Encrypted: i=1; AJvYcCU7nuMoz4H5wN51dz62e4PaDtgmEEtsgk+CHjYKQiR3iIh8ExSzKnxebBWEPrP0mOcWbYiT2SEOaEY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAR/RXA0efuGkiyKhUphwyme9uGRGczK5OtM0p0XEfpVy+oMHm
	g8DyWysM0hmz5Ye6DFcf8z/QXFmoMq/nHLlXQnh2wtqRmJCBt7fAFWXAAQIKVY0=
X-Gm-Gg: ASbGnct+fqJesuw2OrwYi1tqu0z5zwjUV1HIOM32aZX45xe6qF7hrE2TBZvxeghMW2y
	Reyy4funY0h1sjtYl06GQcsNfwmCXomatWLso5miSVrdE/N6Pcd8vrAZ0Nd47rvUh/ZfU5TUKfb
	1CQAL637DAEZapd2CPmMlJ/U0IKiP/cDYXpXiYFYtlgxC5FrMIMtftAUtCJ1VfwzXR8PzMf0X80
	zB5JSy6Mwj2H7ma4RB+UViX8FRgfjFXAi304p4iyC0ySVrHHI3KKbmoRuTg4I28n/7NHsOR9+PM
	BGIVD/d9L7699eHCEPsm3Yz9wJ6RAYiyJBtMW4rOlknpVdxVoUeiE0ldGHU8aiawX8NE93ShIID
	KFa4ykWYY11oQDyTu
X-Google-Smtp-Source: AGHT+IGoUK1HQ9eR00vqS2di41ozphOsdw79AI0JKFx58TF9zGan6LhGXzr+mOn6A7AVhmzal2uHTg==
X-Received: by 2002:a05:600c:6308:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-442d6d44a99mr167653565e9.12.1747141975621;
        Tue, 13 May 2025 06:12:55 -0700 (PDT)
Message-ID: <e42bc3e8-a92c-4c2a-81f4-6557cb97f03c@citrix.com>
Date: Tue, 13 May 2025 14:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] x86/HVM: restrict guest-induced WBINVD to cache
 writeback
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <d55070c0-04c5-70a4-f9f3-3227d42578e6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d55070c0-04c5-70a4-f9f3-3227d42578e6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/05/2023 10:45 am, Jan Beulich wrote:
> We allow its use for writeback purposes only anyway, so let's also carry
> these out that way on capable hardware.
>
> With it now known that WBNOINVD uses the same VM exit code as WBINVD for
> both SVM and VT-x, we can now also expose the feature that way without
> further distinguishing the specific cases of those VM exits. Note that
> on SVM this builds upon INSTR_WBINVD also covering WBNOINVD, as the
> decoder won't set prefix related bits for this encoding in the resulting
> canonicalized opcode.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I realise this is an old series, but this patch is unsafe with AMD
SEV-SNP, and with CLX devices.

Both have cases needing "genuinely evicted from the cache" semantics.

~Andrew

