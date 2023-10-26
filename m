Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0C37D8370
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 15:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623809.972013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw0Jm-0008Ie-46; Thu, 26 Oct 2023 13:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623809.972013; Thu, 26 Oct 2023 13:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw0Jm-0008GK-0o; Thu, 26 Oct 2023 13:22:34 +0000
Received: by outflank-mailman (input) for mailman id 623809;
 Thu, 26 Oct 2023 13:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ziZY=GI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qw0Jk-0008GE-D3
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 13:22:32 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6bc623b-7402-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 15:22:30 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9b95622c620so156082466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Oct 2023 06:22:30 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s22-20020a170906221600b009ce03057c48sm2355120ejs.214.2023.10.26.06.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 06:22:29 -0700 (PDT)
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
X-Inumbo-ID: b6bc623b-7402-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698326550; x=1698931350; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AlTVmxyeiq78aEs19nb5ExnKGoUBVb+hH20bqGrX6II=;
        b=wKk8WRJP5cLKJwYqE0Rd8+Q7Kp023fzT+G9N5C4wy/b0OxaBgYFhfY7argvBy/tHnO
         xMnLebUWkTKfmUDPx13bsWHDFcNc38yhRhQhc/qKrqR/7rJkPg2m3HazN1+6XkzTZbmX
         reOlJPDrLuBk47kiobe4E2oF7u1Cf9IETtmfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698326550; x=1698931350;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlTVmxyeiq78aEs19nb5ExnKGoUBVb+hH20bqGrX6II=;
        b=tTaFUpiUdXsjLq8p+85ly9xp2W/6t98dw+rD5Da98C5wAOlr7ToUARt+bf1fIAI6DQ
         istDIf7pFcJZ379FhKf3qdiBGUWjdLkJvb1UlTJ2iuADuqgi5fxh5cjhL2I4zI59vYgz
         H5Bp5jRi7kkxAJO1EpKmuMQYvUNAX8IAPqweYBMcVca0L4s0JWNd/6zHhCYng0ZHPoiQ
         RL9kTCn9v35kozBU9IMXPBmb/WTjyhG0rLgwnfrQ4zvZX+3YbEe4ab4aUggmNKTS05eG
         0VTW6MujHBtyekg/jQ8ygUyIeQku9u3BVsp06Cg/PODDRuti+VL52jZ6E/WxAJHhMCrB
         DdWg==
X-Gm-Message-State: AOJu0Yy00mo4K3ay1IXmirYHt6WCTGgnYlyBTgw6F3Z11rF2LIa7K9MO
	n0wUMdoEM0ilGO9XWrNpJtSrHQ==
X-Google-Smtp-Source: AGHT+IHKZzEkPXfSo8+am3j/6ugS0og+uE1AAX0dTrJodLi9OUkbHFDz6zAolzR0+xCfZAl6TazMLg==
X-Received: by 2002:a17:907:2cc4:b0:9b3:308:d045 with SMTP id hg4-20020a1709072cc400b009b30308d045mr12981136ejc.46.1698326549864;
        Thu, 26 Oct 2023 06:22:29 -0700 (PDT)
Message-ID: <a45bf30e-8be5-4652-a357-887f052af917@citrix.com>
Date: Thu, 26 Oct 2023 14:22:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231025180630.3230010-1-andrew.cooper3@citrix.com>
 <20231025180630.3230010-3-andrew.cooper3@citrix.com>
 <85cddaeb-6b75-2f53-940e-0b06396fd1bb@suse.com>
 <0d67d2c6-1841-4771-9e6e-1a6463c0b443@citrix.com>
 <07fbb9b7-e6d7-9abc-a64a-a7972b93b9ad@suse.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <07fbb9b7-e6d7-9abc-a64a-a7972b93b9ad@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/10/2023 12:35 pm, Jan Beulich wrote:
> On 26.10.2023 13:10, Andrew Cooper wrote:
>> On 26/10/2023 8:55 am, Jan Beulich wrote:
>>> On 25.10.2023 20:06, Andrew Cooper wrote:
>>>> We eventually want to be able to build a stripped down Xen for a single
>>>> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
>>>> available to randconfig), and adjust the microcode logic.
>>> Linux uses different names for the Kconfig symbols. While I'm unconvinced
>>> of the SUP part, I wonder whether we wouldn't better use CPU in the names.
>> I don't see what that gets us, other than a longer name.
> Just to mention the (I think) obvious - on the IOMMU side we already have
> AMD_IOMMU and INTEL_IOMMU. It would be odd to have just AMD and INTEL here,
> yet then ...
>
>>> One immediate question here is how the IOMMU interaction is intended to
>>> end up: Do we want to permit either vendor's CPUs with the other vendor's
>>> IOMMUs to be usable?
>> From a randconfig point of view, yes.  These options are only targetting
>> a specific platform, and we can absolutely make that the end user's
>> responsibility to describe their platform correctly.
> ... <vendor>_IOMMU not depending on <vendor>.

Odd possibly, but not something to worry about.

It's mostly because of asymmetric marketing because while VTD is fine
and recognisable, AMD-Vi has AMD's name in it even for the non-AMD vendors.

Anyone liable to even notice in the first place will probably know
enough to understand why it's like that.

Furthermore, ...

>  Whereas the lack of a
> dependency on <vendor>_CPU would be quite natural, imo.

... this doesn't really work either as IOMMUs are non-really-optional
uncore components these days.


Names are just that - names.  They can be changed if needs be, and it's
the help text which matters to clarify the intent.

~Andrew

