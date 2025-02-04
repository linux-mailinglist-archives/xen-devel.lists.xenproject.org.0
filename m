Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101E4A26F77
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 11:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881233.1291358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfGQ5-0001gQ-1W; Tue, 04 Feb 2025 10:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881233.1291358; Tue, 04 Feb 2025 10:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfGQ4-0001eT-VH; Tue, 04 Feb 2025 10:44:40 +0000
Received: by outflank-mailman (input) for mailman id 881233;
 Tue, 04 Feb 2025 10:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uBag=U3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tfGQ3-0001eN-N9
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 10:44:39 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07cba812-e2e5-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 11:44:38 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso39930815e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 02:44:37 -0800 (PST)
Received: from [10.53.21.213] (88.171.88.92.rev.sfr.net. [92.88.171.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b547csm15581169f8f.62.2025.02.04.02.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 02:44:36 -0800 (PST)
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
X-Inumbo-ID: 07cba812-e2e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738665877; x=1739270677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5EUMoIVHCS3vQgN/YDOuOuwt4Ov3b7qpf3ilUJq/DA=;
        b=SOrzecFwsmaYtNoIpk2mlsndCQ7hkJ8qS8eP/imyxGtpJ/5Tv/2xgTVrkXd2bI1I/b
         iue+oSzYutWDy0A4RwdzKXtG5evJyJmTOgs2qcpmPQOp6hWgHMLx37f8JloWtJAeFwAs
         RwHO917R6prAvx/BwJhbSNE+N906mly4MJnGweax53MQDu6O2mmJhSCwFvEbzFT+eeeX
         jKEOjH4UINGVQxsHTLZAyEN3RlCjA9UJORHptrAM6G0UwqbGJckKsVuoY0J8mObYTig8
         SWkTu5sVfUjrOdQWqUceBnlLkCH1NZo4ME0QnNU4YEBa1BEBuftd682ZB1aBfzCoWN9y
         2q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738665877; x=1739270677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5EUMoIVHCS3vQgN/YDOuOuwt4Ov3b7qpf3ilUJq/DA=;
        b=iw4TQDzf+aHgyrxJpo6icN1v2RuJTCYbLZPcYyNEjvlb3qoKM+BjNhAwpN4GaC8YHp
         pPzVCuF+ms0pF8f6UM9ij9X63Gn9WcdO2uXJYtziJ2uumnKcp8JBINZS3WMiZz1JchqG
         n4Y8riEi31JbIrs/LCy+4/P5x+CbQqNezaOWceD9MRbp7/djj8WIWgy6p277DQLUXyQ6
         nqyBpW+aAQ+ccr78eZPJDNzJHWAbtRgUuqRHIfB9RZM1ioIZHjYsirbwyFZ4Bln4lvjV
         dkAq+o0g0lu31QplIlL62QdCwbcoZAgfnruAY9gda7j2/1oKbzC2gnG75NzDE/dmrwYY
         mFJw==
X-Forwarded-Encrypted: i=1; AJvYcCVNLW+NAOIJOe2SfEhACzazzgZO/ogd6PPg3AeSFd+c6rSmEPEXAFJdDaLR7VoH6CBPe/+7ryjwaOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUDf99hx6pFew+d3IZ/lNHE8PSYR7xeq5Yn/9Ms7jyvORGM7g2
	F7XN1YdCue79SmrKJn3G0fYCu2yQynmkV1MZv8SgbAjtVRMg0z2h1j/J/aMxE/s=
X-Gm-Gg: ASbGncuPbCpLLHj9Dwm8bWCMlOhv5Gb0rwLRLmeUG9NwDXRx3jag5aMNdIte8ppQFX9
	OzMoVGMpbB9vZ8pUz0tmpo4kaoruHIonVEqUkQ6xaYp1YWr2lnhqz7JF6hEG65khBlgaROD97HQ
	65Tovcsw8gG+Ht2JCof2VUyAorcSVFJRQE57UyRSuT0HvrmHGsUBiaBLSb9aR30oCXiUtzKHE4w
	r7GxmzsoRbqMa8BQyWEtmu5fkrg4MXKqNunbWoMNkzOtT0g4Nl6asCyUsDjuscDnaR/xKGaOMPa
	Jg4m/lfmTQFlXxEmo43yTyz4cg0lTjX0ZYJUjUDznX+6YULE7W/NJg==
X-Google-Smtp-Source: AGHT+IECyT3kjLL2IP8jGp5iNhETRyBtF443agFL3cmw5LXdrgO6uC/CEteXeB9Ebs3gykalTJzOTg==
X-Received: by 2002:a05:600c:5103:b0:434:f131:1e64 with SMTP id 5b1f17b1804b1-438dc3c241emr203976655e9.9.1738665877025;
        Tue, 04 Feb 2025 02:44:37 -0800 (PST)
Message-ID: <c9bc3785-7d0e-493c-99f2-30821dc76b14@linaro.org>
Date: Tue, 4 Feb 2025 11:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] meson: Deprecate 32-bit host support
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 mark.cave-ayland@ilande.co.uk, berrange@redhat.com, thuth@redhat.com,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250203031821.741477-1-richard.henderson@linaro.org>
 <467a5a58-952e-4930-8e91-744eda6d87d9@redhat.com>
 <e40c39d4-425c-4566-af41-373941894045@linaro.org>
 <alpine.DEB.2.22.394.2502031438170.11632@ubuntu-linux-20-04-desktop>
 <e7611136-1e90-4f3a-8f37-68244c22c4cc@suse.com>
 <173d18bf-f68c-4bd5-b822-abb1c1f0c51b@suse.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <173d18bf-f68c-4bd5-b822-abb1c1f0c51b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 4/2/25 10:11, Jan Beulich wrote:
> On 04.02.2025 09:19, Juergen Gross wrote:
>> On 03.02.25 23:43, Stefano Stabellini wrote:
>>> +Xen maintainers
>>>
>>>
>>> On Mon, 3 Feb 2025, Richard Henderson wrote:
>>>> On 2/3/25 04:54, Paolo Bonzini wrote:
>>>>> On 2/3/25 04:18, Richard Henderson wrote:
>>>>>> v1: 20250128004254.33442-1-richard.henderson@linaro.org
>>>>>>
>>>>>> For v2, immediately disable 64-on-32 TCG.
>>>>>>
>>>>>> I *suspect* that we should disable 64-on-32 for *all* accelerators.
>>>>>> The idea that an i686 binary on an x86_64 host may be used to spawn
>>>>>> an x86_64 guest via kvm is silly and a bit more than niche.
>>>>>
>>>>> At least Xen used to be commonly used with 32-bit dom0, because it saved
>>>>> memory and dom0 would map in guest buffers as needed.  I'm not sure how
>>>>> common that is these days, perhaps Stefano knows.
>>>>
>>>> As a data-point, debian does not ship libxen-dev for i686.
>>>> We cannot build-test this configuration at all.
>>>>
>>>> I can build-test Xen for armhf, and I guess it would use i386-softmmu; it's
>>>> unclear whether x86_64-softmmu and aarch64-softmmu are relevant or useful for
>>>> an armhf host, or as an armhf binary running on an aarch64 host.
>>>
>>>
>>> On the Xen side, there are two different use cases: x86 32-bit and ARM
>>> 32-bit.
>>>
>>> For x86 32-bit, while it was a very important use case in the past, I
>>> believe it is far less so now. I will let the x86 maintainers comment on
>>> how important it is today.
>>
>> As dom0 on x86 is a PV guest per default and Linux doesn't support running as a
>> 32-bit PV guest since a few years now, I guess there is no need to support qemu
>> as 32-bit on x86 for Xen.

This community disconnection between QEMU and Xen communities is a bit
unfortunate, as apparently we have been maintaining for some time
something that isn't used.

> Yet then, just to mention it, you can run a 64-bit PV Dom0 kernel underneath
> an otherwise 32-bit distro. I've been doing this successfully for very many
> years (with a very small kernel adjustment, just to work around an apparent
> shortcoming in system init scripts).

This discussion is about what is maintained by the mainstream projects.

We don't want to make fork's life harder. If you believe your use case
is worthwhile, please get it incorporated mainstream so we can test it.
Otherwise it is too much burden to maintain things we can not even test.

Regards,

Phil.

