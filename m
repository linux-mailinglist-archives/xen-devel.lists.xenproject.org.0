Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D9A8FE049
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 09:58:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736014.1142146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF80O-0006Dw-9O; Thu, 06 Jun 2024 07:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736014.1142146; Thu, 06 Jun 2024 07:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF80O-0006Bt-6c; Thu, 06 Jun 2024 07:57:52 +0000
Received: by outflank-mailman (input) for mailman id 736014;
 Thu, 06 Jun 2024 07:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sF80M-0006Bn-8D
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 07:57:50 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7796abe9-23da-11ef-90a2-e314d9c70b13;
 Thu, 06 Jun 2024 09:57:48 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-35dce610207so767939f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jun 2024 00:57:48 -0700 (PDT)
Received: from [172.20.145.98] ([62.28.225.65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d29e63sm847640f8f.17.2024.06.06.00.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 00:57:48 -0700 (PDT)
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
X-Inumbo-ID: 7796abe9-23da-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717660668; x=1718265468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LiSjfKscAIgkbIh+5/HtmWJ/93xp6nvqOK25vHNy3og=;
        b=gaD1BMrHABOOFCVqT1ZMm2QS9qS9HDemc/fQgo+6yGLynKcJOot/36SQPEoO8I5U9s
         9gOS/lIPldXql8v21nnxejgFBFNKiaHlEONEVxdd/vvLhc3ouXDKqMIirZrlHUhJaA7S
         tAU2L+reCm+dDdPIl8BYSBtQI8RtQ/kKG5ol7+hnkn9osw18iN2FQ+O79nNyk5GD3jde
         uL1zdX2hj7NcGsaL+PhTfvDbRs7fCgUR9upDuHno05O4rP/VHoZUEhKmu2r4KMgn0dgV
         cQFwjscIIbcY65qMNcC0+L3gk8pQjvhgn43nnC7NTIWtN2OLALcg8SjVsNUc/1uXzjPc
         w03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717660668; x=1718265468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LiSjfKscAIgkbIh+5/HtmWJ/93xp6nvqOK25vHNy3og=;
        b=ADABd+xsBgsoGKEdlFY7Q3QPGIWetGxs2nuCYujX62cUF+ehdHmqayF7g0Xiap+lao
         bB11XTXwskgoGUhUBSHeORcLJk88g1EHq2nI5RxutIpg4Z7PZ7s55Tg21mt8THdngSXr
         f+I7sz3JDiR/lnZ/ywuturF30wzw/WwWEEK1o0mxJeB83yp00S1E3s7lnV8ssWN7QE4t
         O+ckLWBNMtlB9/JJmT2usjfN6thmmZVOCbn7OFjN4T8ehqBg9ZnmgdCgVgkdeMo/mkgh
         IxWn+QE+zigiQhb4H5HiSwoXm9FfZ01C9W9m6zaXUV2JJrbOjRIKE9j+fI9WLTiY4AVE
         eKHA==
X-Forwarded-Encrypted: i=1; AJvYcCVgEQznhgHATDgVL3jJkaI8REFfWU5R5giBluWtI9UJntu5cC2hCTd6TID3Ygomk9PkKih/aqHhXdD0UGuJ8LK2Eqnk4G/Qz13DHC2/ZFg=
X-Gm-Message-State: AOJu0YxEWu37QqPxFawQiPWEfdmBVKiSCJm7Bzj4OHaeK4jM+w4/hUkS
	s1AA89b8ScYuL5Vl6R2/tYjtvNwqzTPIRO5BaxkRR+pXovEGkdFJkur+lz+3Oz84Y6JCNXXGmCY
	=
X-Google-Smtp-Source: AGHT+IEc0Jq3aAP8S7dwx87ffsQIZv9tJumymC80qkr4UerYfp5GLyBFA74vfMUPbnDHujvAJpuF8w==
X-Received: by 2002:adf:f601:0:b0:354:f489:faf with SMTP id ffacd0b85a97d-35e8406dd8emr4514038f8f.1.1717660668369;
        Thu, 06 Jun 2024 00:57:48 -0700 (PDT)
Message-ID: <8936b5ef-1ef7-4606-9f19-c75287aa88fa@suse.com>
Date: Thu, 6 Jun 2024 09:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v5 09/10] xen/x86: Disallow creating domains
 with altp2m enabled and altp2m.nr == 0
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1717356829.git.w1benny@gmail.com>
 <d6fd97b66b5f1a974e317c9d3f72fb139b39118f.1717356829.git.w1benny@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d6fd97b66b5f1a974e317c9d3f72fb139b39118f.1717356829.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.06.2024 22:04, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Since libxl finally sends the altp2m.nr value, we can remove the previously
> introduced temporary workaround.
> 
> Creating domain with enabled altp2m while setting altp2m.nr == 0 doesn't
> make sense and it's probably not what user wants.

Yet: Do we need separate count and flag anymore? Can't "nr != 0"
take the place of the flag being true?

Jan

