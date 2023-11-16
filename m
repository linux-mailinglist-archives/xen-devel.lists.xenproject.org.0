Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A497EE53C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 17:33:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634507.990016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3fIV-0000Gi-In; Thu, 16 Nov 2023 16:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634507.990016; Thu, 16 Nov 2023 16:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3fIV-0000Dn-G7; Thu, 16 Nov 2023 16:32:55 +0000
Received: by outflank-mailman (input) for mailman id 634507;
 Thu, 16 Nov 2023 16:32:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/7J=G5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r3fIT-0000Dh-M1
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 16:32:53 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c91d5c62-849d-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 17:32:51 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso1536291a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 08:32:51 -0800 (PST)
Received: from [192.168.107.1] ([31.94.60.174])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a1709061b0900b0099bcf9c2ec6sm8593869ejg.75.2023.11.16.08.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 08:32:50 -0800 (PST)
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
X-Inumbo-ID: c91d5c62-849d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700152371; x=1700757171; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JrlYKMC7hY8P2jTpDF4+NhepjJbucTvp2KGUkCNFWnE=;
        b=shWj0pNEavvvz0CvmLMEJxFhb4S4elK3AA5fuaABhud8s6hrhWHU1VsUTT4q2eFSgO
         Usp7fwt3bTrvVaxHmeSvX6X/C28HhQ5bwtjsTw2SSO5cjQvt51DX1YX358t2oH+Faoak
         oJBTgDkz0frADYjz0JatRgjp3wvGrxbVSt8rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700152371; x=1700757171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JrlYKMC7hY8P2jTpDF4+NhepjJbucTvp2KGUkCNFWnE=;
        b=BvDr1obwb89W6LReC41q3ucPyYSKcPAxeg09jr+Gp/3edkH3BLlp4RVLIlGtyrRdCA
         b7zh4ebqe5BAWSJ63d1OjllhOH7wBc9GGFmBCjJ1Ugy4cCqSkTzLA74g0O+nxMQMkN2N
         KbL4h65j4zUOZhsnLpa/buZj4WDhglXnYf5ExtqQXegvbwqkUWTXcnw17ORW58Q53ur1
         VcxbhpUoczQy8htqMK1UZjXk8p/vIGLsRSXfdacvCUs6QrQ7GSGttIphKbQl9+6NDF+W
         3LW1Oq/AsoV56OY2poVkf8rxOIVK667q955x6NynHx/MaHSdhc29EKnE/tcObrXWb1oT
         Qizw==
X-Gm-Message-State: AOJu0YxG6g25zSEca4m//kpnLe1vJ65PuC6rglBLbFtUyT6pGdDGGzru
	LK2otcqfTb4saGb25XcnB6Dx6R2gcNlDsRzXY1zUMg==
X-Google-Smtp-Source: AGHT+IHDTLKSd0kScWg4b1ilEtwDkiK0ZPx8QAhSbaam8Hf+uwL6cGeTqznTyxi/ZrDyQbkn/K0rPQ==
X-Received: by 2002:a17:906:7cb:b0:9ae:673a:88c8 with SMTP id m11-20020a17090607cb00b009ae673a88c8mr10976851ejc.21.1700152370942;
        Thu, 16 Nov 2023 08:32:50 -0800 (PST)
Message-ID: <aa13be5e-d90c-4074-a16c-d3b051da754d@citrix.com>
Date: Thu, 16 Nov 2023 16:32:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen 4.15.5: msr_relaxed required for MSR 0x1a2
Content-Language: en-GB
To: James Dingwall <james-xen@dingwall.me.uk>, xen-devel@lists.xenproject.org
References: <ZVZAO/W0m/h+IPbi@dingwall.me.uk>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZVZAO/W0m/h+IPbi@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/11/2023 4:15 pm, James Dingwall wrote:
> Hi,
>
> Per the msr_relaxed documentation:
>
>    "If using this option is necessary to fix an issue, please report a bug."
>
> After recently upgrading an environment from Xen 4.14.5 to Xen 4.15.5 we
> started experiencing a BSOD at boot with one of our Windows guests.  We found
> that enabling `msr_relaxed = 1` in the guest configuration has resolved the
> problem.  With a debug build of Xen and `hvm_debug=2048` on the command line
> the following messages were caught as the BSOD happened:
>
> (XEN) [HVM:11.0] <vmx_msr_read_intercept> ecx=0x1a2
> (XEN) vmx.c:3298:d11v0 RDMSR 0x000001a2 unimplemented
> (XEN) d11v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff80b8de81eb5 0 0
>
> I found that MSR 0x1a2 is MSR_TEMPERATURE_TARGET and from that this patch
> series from last month:
>
> https://patchwork.kernel.org/project/xen-devel/list/?series=796550
>
> Picking out just a small part of that fixes the problem for us. Although the
> the patch is against 4.15.5 I think it would be relevant to more recent
> releases too.

Which version of Windows, and what hardware?

The Viridian Crash isn't about the RDMSR itself - it's presumably
collateral damage shortly thereafter.

Does filling in 0 for that MSR also resolve the issue?  It's model
specific and we absolutely cannot pass it through from real hardware
like that.

Thanks,

~Andrew

