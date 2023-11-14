Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0347A7EB3F9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632841.987319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vZ5-0008Kx-BZ; Tue, 14 Nov 2023 15:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632841.987319; Tue, 14 Nov 2023 15:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vZ5-0008Hq-8z; Tue, 14 Nov 2023 15:42:59 +0000
Received: by outflank-mailman (input) for mailman id 632841;
 Tue, 14 Nov 2023 15:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2vZ3-0008Hi-Sg
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:42:57 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b47fef6-8304-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:42:56 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9e623356e59so638287766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 07:42:56 -0800 (PST)
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 dx5-20020a170906a84500b0099bd1a78ef5sm5691278ejb.74.2023.11.14.07.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 07:42:55 -0800 (PST)
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
X-Inumbo-ID: 7b47fef6-8304-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699976576; x=1700581376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gCFoXhGCZFhwzHOt1ECCBxHdb8kGrjYPklFidAhJw58=;
        b=msG0dhSbk/XigAvPPwjGDCxzZjHFUK0QPSn4jbuJs2cUCP8Fv2elRUbZf+yICjFK7Z
         XlRPEbT8RkYwW/1ynuqfLozzbVZf70kUA46EeVakOM7m7heK2k324emOdToUffQz29Hd
         zdjir8Rz8tc/g74CS3cxMOuJd6fqWLQ/OOLyR0DuM+JzL+AfQ5M2n7oQgfu/yFZTd+ga
         Y5k24deSTw8B84YZ5IO5JW/8NoBYTQ+5fldl3Dp8uiiN+adLvk24OcEo328YoYVOOLBd
         KbEuk3/Xg7s7pfKATX7i7cscms2AKUAHe5PSFGg5aCeHfH5Rj43cU5JRHK7cslz31pl6
         q4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699976576; x=1700581376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCFoXhGCZFhwzHOt1ECCBxHdb8kGrjYPklFidAhJw58=;
        b=UeDZubchj1In1X9DRY1WoA58GnWK+tfDt1/ebXFJArEr0U+6e/Jlyw6zZk/8VfeHCK
         Rhx6XZnnej9w/RUE0tH+WQdO83E9xb8eBZ82jknNhMaXA+t9BR679grdMg9oxpdYciSI
         lXmE/B0NfjuuQ32ZKnMzUX/7MVAAOMBscez+qeavHsnOO5WMaQae1MtEwBD5z7kse8R9
         5oaDxjYa/9NszZNNEAjm6IYzxDqcozQTK+Ot+GV2/lteLCagXfbDIYj5E596LwB/wS+v
         ObrkNrVUlIECCFD9hBeWKAKYYjPMcnoHl5JPRODn1UMRPupKtoYCDn+ZhAvTwarRZJvM
         kIGg==
X-Gm-Message-State: AOJu0YwYzokgMMhKLGsy5okEca2aainMB6xtW+PyKjpzvVuofUJOoLzo
	KF1CSDXgqxknblwLhZl6t9nGtA==
X-Google-Smtp-Source: AGHT+IHp79TSN3T1f0iR/8hTGuWsFNTOnvRmliGhAL1mNCFX7w4yOvOUPmAnOLIhILS3nzzmhv8aFA==
X-Received: by 2002:a17:906:1919:b0:9e4:121c:b9fd with SMTP id a25-20020a170906191900b009e4121cb9fdmr7690326eje.12.1699976576191;
        Tue, 14 Nov 2023 07:42:56 -0800 (PST)
Message-ID: <e298292d-fc40-44ca-9de2-1b159519836b@linaro.org>
Date: Tue, 14 Nov 2023 16:42:52 +0100
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
 <04917b57-d778-41a2-b320-c8c0afbe9ffb@linaro.org>
 <37D11113-662D-49FD-B1F1-757217EAFEEA@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <37D11113-662D-49FD-B1F1-757217EAFEEA@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/11/23 16:19, David Woodhouse wrote:
> On 14 November 2023 10:13:14 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> On 14/11/23 16:08, David Woodhouse wrote:
>>> On 14 November 2023 10:00:09 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>>>> On 14/11/23 15:50, David Woodhouse wrote:
>>>>> On 14 November 2023 09:37:57 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>>>>>> Add a tag to run all Xen-specific tests using:
>>>>>>
>>>>>>     $ make check-avocado AVOCADO_TAGS='guest:xen'
>>>>>>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>> ---
>>>>>> tests/avocado/boot_xen.py      | 3 +++
>>>>>> tests/avocado/kvm_xen_guest.py | 1 +
>>>>>> 2 files changed, 4 insertions(+)
>>>>>
>>>>> Those two are very different. One runs on Xen, the other on KVM. Do we want to use the same tag for both?
>>>>
>>>> My understanding is,
>>>> - boot_xen.py runs Xen on TCG
>>>> - kvm_xen_guest.py runs Xen on KVM
>>>> so both runs Xen guests.
>>>
>>> Does boot_xen.py actually boot *Xen*? And presumably at least one Xen guest *within* Xen?
>>
>> I'll let Alex confirm, but yes, I expect Xen guest within Xen guest within TCG. So the tags "accel:tcg" (already present) and "guest:xen".
>>
>>> kvm_xen_guest.py boots a "Xen guest" under KVM directly without any real Xen being present. It's *emulating* Xen.
>>
>> Yes, so the tag "guest:xen" is correct.
>>
>>> They do both run Xen guests (or at least guests which use Xen hypercalls and *think* they're running under Xen). But is that the important classification for lumping them together?
>>
>> The idea of AVOCADO_TAGS is to restrict testing to what you want to cover. So here this allow running 'anything that can run Xen guest'
>> in a single command, for example it is handy on my macOS aarch64 host.
> 
> Ok, that makes sense then. Thanks for your patience.

No problem, I'll add a better description in v3.

> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>

Thanks!


