Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF655963084
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 20:57:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785085.1194501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjNrU-0005rM-Pf; Wed, 28 Aug 2024 18:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785085.1194501; Wed, 28 Aug 2024 18:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjNrU-0005pd-MH; Wed, 28 Aug 2024 18:57:44 +0000
Received: by outflank-mailman (input) for mailman id 785085;
 Wed, 28 Aug 2024 18:57:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjNrT-0005pX-5c
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 18:57:43 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67520b0a-656f-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 20:57:42 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a868b739cd9so851592466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 11:57:42 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54a014csm281039666b.90.2024.08.28.11.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 11:57:41 -0700 (PDT)
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
X-Inumbo-ID: 67520b0a-656f-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724871462; x=1725476262; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zFpkr8WVyhDSjP2s0SKwSBW1ET3nG7QD4yQ8AOxgWEE=;
        b=YIjWxfgBXdgTP3qG3W4TZbs/YZ2awMSIH6Cmz90FYS0uoMNuOTnL+7WJWCICS3CQZs
         C2KdpIOxJAoOmRzcV44W9HgS31Znizkr+KHhFmR9f63L/IrOms/pumH35vRfx4PHELXF
         Sfuc4ouKC4tsdClOnQDPOaWW06W64dtVsIDIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724871462; x=1725476262;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFpkr8WVyhDSjP2s0SKwSBW1ET3nG7QD4yQ8AOxgWEE=;
        b=S43N6sVaSsBMGf6Kkr6Usp3q4KAGHhDocg/ZrE1zmGro6EtERCfoU8zGSBnj8hfwfj
         WMlJWf1QnFJfGbZBDsZmFpFX7Uf/usoFfgPJ13aDrWBq3mVdyP4dgyjfSalyyebU3UW2
         PFbkcqMd3xiIzbzWl+ohhA5lNj39S+gz/DraZlgKoeIPOEElt92BCMoDdiLGfdZEwRsS
         tojgdNCf8wUVQMQXpT+vzkbsew3TVkN2e/u7EnvZWLedBhEg8CZguMAWG4PEU/CMJtkG
         8FJCxBpLSbMRmt+V9kOyFWu6JiMwDF/aHS541n9A9CtSz85+iGxe60vRaqCXGt9OyTWC
         6/jA==
X-Forwarded-Encrypted: i=1; AJvYcCUb7RteshPJbQZ/weryhO9Gyyh8G0N+3aG9og5qil5RGmMEXjmNd/NWo1dZm6VjRgI+DMzcJkegSZM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVS2my9L+igdmdxfEx3yBb10t77xZuidCm2VjEDFNWef2fvFSI
	PRiKaSAt40VS1hc1kJHLv7BvblI4YzrDjrmNjGnbjadAuCBkdA9GfQvnbxwPD94=
X-Google-Smtp-Source: AGHT+IGYmu06g7UtLaBxEUdcDuFahYEh7yVY1Uta0ZSTqky24c/vclhSD3K4Zk9cBbvpLspVkzXbmA==
X-Received: by 2002:a17:907:7e8c:b0:a7a:ab1a:2d71 with SMTP id a640c23a62f3a-a897fad365amr25662566b.59.1724871461531;
        Wed, 28 Aug 2024 11:57:41 -0700 (PDT)
Message-ID: <a5b4ca69-96ea-46d6-ab0d-2be4fd1d9d99@citrix.com>
Date: Wed, 28 Aug 2024 19:57:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] x86/dom0: disable SMAP for PV domain building only
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
References: <20240828113044.35541-1-roger.pau@citrix.com>
 <50658093-8463-4ee3-b308-31be2dd1fd42@suse.com>
 <bd206c4d-8e1d-488c-b428-3f6402a9ae4f@citrix.com>
 <Zs8gAuc5qoVsVkQe@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zs8gAuc5qoVsVkQe@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 2:02 pm, Roger Pau Monné wrote:
> On Wed, Aug 28, 2024 at 12:51:23PM +0100, Andrew Cooper wrote:
>> On 28/08/2024 12:50 pm, Jan Beulich wrote:
>>> On 28.08.2024 13:30, Roger Pau Monne wrote:
>>>> Move the logic that disables SMAP so it's only performed when building a PV
>>>> dom0, PVH dom0 builder doesn't require disabling SMAP.
>>>>
>>>> The fixes tag is to account for the wrong usage of cpu_has_smap in
>>>> create_dom0(), it should instead have used
>>>> boot_cpu_has(X86_FEATURE_XEN_SMAP).  Fix while moving the logic to apply to PV
>>>> only.
>>>>
>>>> While there also make cr4_pv32_mask __ro_after_init.
>>>>
>>>> Fixes: 493ab190e5b1 ('xen/sm{e, a}p: allow disabling sm{e, a}p for Xen itself')
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> preferably with ...
>>>
>>>> @@ -1051,6 +1051,34 @@ out:
>>>>      return rc;
>>>>  }
>>>>  
>>>> +int __init dom0_construct_pv(struct domain *d,
>>>> +                             const module_t *image,
>>>> +                             unsigned long image_headroom,
>>>> +                             module_t *initrd,
>>>> +                             const char *cmdline)
>>>> +{
>>>> +    int rc;
>>>> +
>>>> +    /*
>>>> +     * Temporarily clear SMAP in CR4 to allow user-accesses in
>>>> +     * construct_dom0().  This saves a large number of corner cases
>>> ... the final 's' dropped here and ...
>>>
>>>> +     * interactions with copy_from_user().


Actually, even with this adjustment the comment is still wonky.

The point is that we're clearing SMAP so we *don't* need to rewrite
construct_dom0() in terms of copy_{to,from}_user().

I've adjusted it.

~Andrew

