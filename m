Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9087EB334
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632768.987168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v6S-0007dz-EA; Tue, 14 Nov 2023 15:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632768.987168; Tue, 14 Nov 2023 15:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v6S-0007bt-BD; Tue, 14 Nov 2023 15:13:24 +0000
Received: by outflank-mailman (input) for mailman id 632768;
 Tue, 14 Nov 2023 15:13:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2v6R-0007bn-8d
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:13:23 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58850bba-8300-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 16:13:20 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9d216597f64so873701266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 07:13:20 -0800 (PST)
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 fi6-20020a170906da0600b009e6a990a55esm5644531ejb.158.2023.11.14.07.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 07:13:17 -0800 (PST)
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
X-Inumbo-ID: 58850bba-8300-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699974798; x=1700579598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HIHi0yKkQuExrrqaReTTaHyYp9veWL43i8XQ+amSwZ4=;
        b=RYPAC6Oryvie5mhlJj4FFrctnVnNT1+pUoG+hGnxuDKONqYHEO1jL4YMnZoklSc8VL
         wrH5x4NA3oAkM9oSFDDQr9WcZxR8/EbAeewNcSrTu0RxdiWy7Zl4bO7bFjUYQK1fXPCq
         9bSQwrC0dD5EsYG5/K/AOBT581e3Ql5xvgoIXQsdgoLuewLkpW9Ca+84COppQeR/yODu
         2w7BzCCWHlr3CVDWw2PugfSpIhT5ir9ammVimb6/VB2JnjoI7r8C77RFEWzuiGWocPtB
         CcWheeHUXm77jKqN1cixt3eKBljquoM0IogfdE7NzgjQr/XAyaR13jEde5CgRvVgxFxr
         bpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699974798; x=1700579598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HIHi0yKkQuExrrqaReTTaHyYp9veWL43i8XQ+amSwZ4=;
        b=pUuNcKc3rthlbNw/VuksX+36C/kMtLUb88Drj4tJJEsqL8oIw4limSwC7C1rO1Z6l/
         RTTVnL3eR+YdcZsFXDQpLU1ie8fCD2vmMljQzQB6Q+4caY8MfgFx0K4CKGwaKnd4sQnp
         dAqoNkItywB/mGQxfoxsXCX0y+ovhsrF7FsmLgBhIchlldPBaYLil8gitthJy89jw8sM
         v38JjTWyFMgFX9KkH/8z9oCPbpFjIYPqx8r/EJ5AEJKCFBRR/GAuKs7/S1SNn71dXKdR
         oD/mlmOnRgfWXHc2zjlsCoNrM6rKkBkXLCMclVovGBF/dnPUVjJY8mO0pn7osz6/ixXU
         GdEQ==
X-Gm-Message-State: AOJu0Yx/TFG2Dc/J12Sks26L6c4dtOu/lmnkrKFEBC4REv2ouRDqvrgh
	I1uMjksDbvdqK9vvtZmYLup1uQ==
X-Google-Smtp-Source: AGHT+IHGFXgwRm95QaGDvzmEn8xmzfuJoAXM9MDWtXppVWdC9PPQJI2AOwqlfdbCPZx6yH7hHs/ywQ==
X-Received: by 2002:a17:906:c01:b0:9e5:d618:d6c1 with SMTP id s1-20020a1709060c0100b009e5d618d6c1mr8703674ejf.19.1699974797997;
        Tue, 14 Nov 2023 07:13:17 -0800 (PST)
Message-ID: <04917b57-d778-41a2-b320-c8c0afbe9ffb@linaro.org>
Date: Tue, 14 Nov 2023 16:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 v2 01/19] tests/avocado: Add 'guest:xen' tag to
 tests running Xen guest
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, David Woodhouse
 <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-2-philmd@linaro.org>
 <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org>
 <407f32ee-e489-4c05-9c3d-fa6c29bb1d99@linaro.org>
 <074BCACF-C8D0-440A-A805-CDB0DB21C416@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <074BCACF-C8D0-440A-A805-CDB0DB21C416@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/11/23 16:08, David Woodhouse wrote:
> On 14 November 2023 10:00:09 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> On 14/11/23 15:50, David Woodhouse wrote:
>>> On 14 November 2023 09:37:57 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>>>> Add a tag to run all Xen-specific tests using:
>>>>
>>>>    $ make check-avocado AVOCADO_TAGS='guest:xen'
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>> tests/avocado/boot_xen.py      | 3 +++
>>>> tests/avocado/kvm_xen_guest.py | 1 +
>>>> 2 files changed, 4 insertions(+)
>>>
>>> Those two are very different. One runs on Xen, the other on KVM. Do we want to use the same tag for both?
>>
>> My understanding is,
>> - boot_xen.py runs Xen on TCG
>> - kvm_xen_guest.py runs Xen on KVM
>> so both runs Xen guests.
> 
> Does boot_xen.py actually boot *Xen*? And presumably at least one Xen guest *within* Xen?

I'll let Alex confirm, but yes, I expect Xen guest within Xen guest 
within TCG. So the tags "accel:tcg" (already present) and "guest:xen".

> kvm_xen_guest.py boots a "Xen guest" under KVM directly without any real Xen being present. It's *emulating* Xen.

Yes, so the tag "guest:xen" is correct.

> They do both run Xen guests (or at least guests which use Xen hypercalls and *think* they're running under Xen). But is that the important classification for lumping them together?

The idea of AVOCADO_TAGS is to restrict testing to what you want to 
cover. So here this allow running 'anything that can run Xen guest'
in a single command, for example it is handy on my macOS aarch64 host.

