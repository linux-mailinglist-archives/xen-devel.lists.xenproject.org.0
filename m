Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3C8AF8B7A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 10:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033003.1406418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbm9-0001ck-Eh; Fri, 04 Jul 2025 08:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033003.1406418; Fri, 04 Jul 2025 08:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbm9-0001ax-AX; Fri, 04 Jul 2025 08:28:05 +0000
Received: by outflank-mailman (input) for mailman id 1033003;
 Fri, 04 Jul 2025 08:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKfD=ZR=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXbm7-0001ap-TK
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 08:28:03 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc1e0b5b-58b0-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 10:28:02 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so7270805e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 01:28:01 -0700 (PDT)
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1634147sm20034405e9.18.2025.07.04.01.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 01:27:59 -0700 (PDT)
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
X-Inumbo-ID: cc1e0b5b-58b0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751617680; x=1752222480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U0A4usibI7eGbC53g5/4tZrjHX/EOioQsgduZ6qqcEw=;
        b=d9obtFMtxCmVDImfWcBnbfGgDqt+4LWXT2mCT133QLDnWYgk6GjdPhtwu7rgcXiBQi
         eAoHZbX+B9bT28gbjQT6uKs+CxZ2Oi9IDq8c0KmhbVhntbGBz7PH3OjPXEBZJb+59FnE
         WNeAjOyPF714Yk3AOqhZXMIxYKwz7bLcB0tf7wCO9h5Z1MfJDaeDrrvsCsV4xI8st9Is
         LApb0D8y/Iz6sBVJoe/6zRxannKPZcXm/Q6KXKmPz4Vvfbj8N8hQ4S69f9y2eP5d38ep
         qRWk5yoNKRB1HwrCQ0V4w3VthRQeCCt4M0b2fxfkp9oGDfpC7OuuDw6QDrpBO8p4F197
         5Fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617680; x=1752222480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0A4usibI7eGbC53g5/4tZrjHX/EOioQsgduZ6qqcEw=;
        b=S8rvWJ9pOCfqtcHi8MCSqX2H7CQB0u5S1h0v2f9HoidRrcBRqemToy2mTzrwCuGv03
         Y2AvOIsgcJhdpbftiihukY/JY1tIYw5zNnm/bUXIsuZTvXQ4I+bHegEH5sCXsT6yTn/T
         4qACFNyNri4N2QHijRg/fyMDA0Qeo9Mrp2eDb1Dj/fIU6pjNTxIs6qr4HlYNMuUalfLJ
         HUElrF5SpwNj6ZFFAz8qhnhMbc+h0KijTfx7IGRg2QAAFJxxHjbN6nsoUhqqYTB4NJiU
         tTV9TAOasIJZuHAi5pd+EE5W6Yt7XoLDWn6GybcYrX9UUJ7rT6n1mK90UMcvR/iBCbWM
         EiTw==
X-Forwarded-Encrypted: i=1; AJvYcCVpNDBR1COsHz7oF1cyzsSt4XML9G2bHLUMvTYXIG//efmCs6VJ1IcgSeL4bA+U6J8r00tFxfBFijA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFSIIeHUV2MAWDfBGjjMm4pjpftELVPV9RSjebz9daUfGgzCKd
	3weMhYGSHpD9kBDpx20okkoIv8olpW/XbOVQkJ9Cue/E+4keeLvrvb1ylCHOFyFdnl4=
X-Gm-Gg: ASbGnctDI7yWWhuz+OsHhceaJT33VR0Ed8OIKKQl0WLLWoeI9cqEeL4dWR08S6n15F7
	JH3PxuO25/Bx65e67mcy9ugI8hF4JdG+kxauCo4bfd4V/SgbYUbxKgear7gf+WDoha/0hiRkMHO
	Kyj/1slDR5Q9/ngDIkaWjRIArTG+aROQV0/A1BAnDF72y3/fQjijXILTEfDc5ASwT3lsLP/QqeI
	5i940M9O0uvMFN9MIh3m1X6DBnAnawqpddFzJXs8NLnUqkdVQSmtQRTJKynu5TY3S4rD6i615hC
	JpTDw3mP4s79cI4bM7/DaRP5kCejwsTYiDOVZDYeL4n1F4KhBm4IVSTM5H58aJ2GEoWFcusCoh2
	Y2yNjKYF6HB/4ypTyoyzamf8+odOOEQ==
X-Google-Smtp-Source: AGHT+IEJWeuXd5bkocPT1GC2uTHAsrEBbH8Qs+f1xwK7OySX9hPisz7u73RvYfTp/652iJy3CmXBxQ==
X-Received: by 2002:a05:600c:1c94:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-454b4e79819mr10558905e9.11.1751617680441;
        Fri, 04 Jul 2025 01:28:00 -0700 (PDT)
Message-ID: <0bc1e609-88ea-4994-9815-020ae6389475@linaro.org>
Date: Fri, 4 Jul 2025 10:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 28/39] accel: Expose and register
 generic_handle_interrupt()
To: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250703173248.44995-1-philmd@linaro.org>
 <20250703173248.44995-29-philmd@linaro.org>
 <e8d0edca-f79c-4d6c-b1a3-69ad506bf470@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e8d0edca-f79c-4d6c-b1a3-69ad506bf470@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/7/25 08:38, Xiaoyao Li wrote:
> On 7/4/2025 1:32 AM, Philippe Mathieu-Daudé wrote:
>> In order to dispatch over AccelOpsClass::handle_interrupt(),
>> we need it always defined, 
> 
> It seems I can only understand it until I see the code to really require 
> it to be mandatory.

See 
https://lore.kernel.org/qemu-devel/acd1d192-f016-48d3-90e1-39d70eac46f5@linaro.org/

> 
> But anyway, the change itself is correct.
> 
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

Thanks!

