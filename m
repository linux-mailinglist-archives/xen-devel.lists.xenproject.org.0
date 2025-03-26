Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A92A715F2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 12:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927664.1330389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txP7l-00069M-0A; Wed, 26 Mar 2025 11:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927664.1330389; Wed, 26 Mar 2025 11:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txP7k-00067u-SN; Wed, 26 Mar 2025 11:40:44 +0000
Received: by outflank-mailman (input) for mailman id 927664;
 Wed, 26 Mar 2025 11:40:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txP7j-0004Y0-Ea
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 11:40:43 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2643c350-0a37-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 12:40:43 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so46895955e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 04:40:43 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeba1sm230608105e9.32.2025.03.26.04.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 04:40:42 -0700 (PDT)
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
X-Inumbo-ID: 2643c350-0a37-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742989242; x=1743594042; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AZx6DtJCja/IIlnY7u5kkYC/ham9XSFGiPkYdoJBHJc=;
        b=FOXfws29lv4HAXC/m6zHKHmEZDtlIh8JMw/dMWl/eM+xv4WY6mvxr42NuaJOCa2a3c
         e3BsIUyKiUQTlWMOCfLifl4QJAQ9xP54VKrjHg12ejBUqPdo5z4iB6o9ONxpaIJvJxyl
         b+7vCbxDiXNNSMXCGVZ2bX0v3YaYIfCZ7Yzso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742989242; x=1743594042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZx6DtJCja/IIlnY7u5kkYC/ham9XSFGiPkYdoJBHJc=;
        b=I2iZOHSSjJ32lniUlLWFlayEnd1kR+2ojnWgwmKBpyEmNgggcf0C26ZPqsK+GkOofy
         I/QeGSwraKASXZsVo+UnqBrJVjH6xGn2cxbufVtlxFhT8xQ+aiEEC1CzZFCrNEyUFHc4
         sn09jj0Zf0x4UUWxdTmisNYLMeTHDvdX4qDmfk9q6dz61vjLLDGFrJnuixfCckbB9KNK
         FX1T8E2MLrPGT+r5E2TFSvoHA5gtrVN7ZrBWAPgu+nd8f3uTz5Lsm80CxpSVc7HK/r0Q
         bd/f1RAeT4BuiiZVHxxbeXWWYd5SjnTTiFIOwrer1tlbsI+emOOcxNdfFkYo/vcN3uBo
         +aEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXURI0sKFn0KThK3ruVaxSKxYRBBfxJnEWsERDzVC225aOzEbmCBFc/8I0b57fDwWVmxfw5n96F87s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQ1vrGWcNXki8mdKddCUI6WyBbjggnbEEfi2FofgXCXTz9U/qh
	vDp2OTnS4G/3NJ22o7VomL7yKY5/SOYhFu0Jjo+jWZc945GAbYjKu83BOpP7wJNo4m5Xf5HDFGT
	tJqo=
X-Gm-Gg: ASbGncsu6kOLBPRuh6pHanCGqpFRkpUwdmI9UPK3ZCPy60XDcUJgr/SFonSDjzp3u5w
	385SymxxeTpQYe7U5g1qvqiuOT8WWG0PeWpF7vKR90whSwXC3x6dDKcyfeKKv9w1NKipd1fCMCg
	9ImN24UplPWaVQVhbbd45pmU4VyNduOfOLPzAIqHu24aqry7zgn8t3N6eRpudmnWfdKL1R78T8x
	43jU/Cx3HbPnx09+Xi146MJ+EMLtptTLjbrrLoOS2F3yYVEkcAFCKe9s4Z4eQyo/Wswbt20/W/c
	r/1Yv70Tt5nsYC94Ls/DDwVBCkF7giuotzfPB5GhQ4uw10zCnc1ZGEQeyMbcofU5I5L4Tb9Vby3
	9OrQEOD5/vg==
X-Google-Smtp-Source: AGHT+IEygZSt8/EoJGm/4U/WsUDjwn8O1xVGLYc3gcyyTKhs5NcI69ZtBJVvjr2xmfdB7FE7RPp22Q==
X-Received: by 2002:a05:600c:1e07:b0:43c:fdbe:439b with SMTP id 5b1f17b1804b1-43d509e374bmr210525775e9.4.1742989242519;
        Wed, 26 Mar 2025 04:40:42 -0700 (PDT)
Message-ID: <195fc5cb-9af6-4784-a675-48dcea7fb1c4@citrix.com>
Date: Wed, 26 Mar 2025 11:40:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pmstat: correct get_cpufreq_para()'s error return
 value
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <59051630-3843-400d-9127-a6eff15a2b5d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <59051630-3843-400d-9127-a6eff15a2b5d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2025 11:38 am, Jan Beulich wrote:
> copy_to_guest() returns the number of bytes not copied; that's not what
> the function should return to its caller though. Convert to returning
> -EFAULT instead.
>
> Fixes: 7542c4ff00f2 ("Add user PM control interface")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

