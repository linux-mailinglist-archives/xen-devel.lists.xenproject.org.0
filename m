Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65327EB36F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632801.987239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vFG-0007VH-Rc; Tue, 14 Nov 2023 15:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632801.987239; Tue, 14 Nov 2023 15:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vFG-0007Sj-OW; Tue, 14 Nov 2023 15:22:30 +0000
Received: by outflank-mailman (input) for mailman id 632801;
 Tue, 14 Nov 2023 15:22:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2vFF-0007RU-B5
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:22:29 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e914fe9-8301-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 16:22:27 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso8810444a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 07:22:27 -0800 (PST)
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 ov3-20020a170906fc0300b00977cad140a8sm5694156ejb.218.2023.11.14.07.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 07:22:26 -0800 (PST)
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
X-Inumbo-ID: 9e914fe9-8301-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699975347; x=1700580147; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUHR/sFEjdzbvDET4onhF+bWIy1sGTTug2OAYdlSeSM=;
        b=ZxWobRl0AhMShrNCY3TA+bG7o93EHBoQ7UehS9is81GDS7Tc+/pteJq0i4X3FAyGWo
         ieJg92ZZ6fseVJOnOicpuxeMGqMBI8qVxCl1mTnBTfyKG1qJEwNxQ6QGyfji4tw/4mDR
         diyxmjQdBQ8VVamYYKtsleht4IBSuIEBpcirbeI2DbRPSsnwdb1I8TDLyLVz2tGwVBQ+
         DaE+fuGKtjVoj7cqV2zJnnYxiMEU+wpszBSn7qZhpQqftMkq4BsT+hVCuT4vfIaGLg76
         MhfbYAHj8oY/5YRXNWWAS1K52CDCVE5luYR+kSXwo7u6i1INxf3VWi1KUUDaNrZ4dSzU
         SFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699975347; x=1700580147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MUHR/sFEjdzbvDET4onhF+bWIy1sGTTug2OAYdlSeSM=;
        b=GurmBqnF0PjmpStfQd+e9hp4wZFMk3JANS3VjQDOcfUr6abhxIJOeBtW7ChPlzJeYC
         /OOmnNS21cEKPi7XV7LSEb5Q9cZs+M9WgaGTJbNmauWnzoC2cmVvp6Kux1WX6GKZuen1
         YyWKvG9kuOTWzmRD9ScLiZjtKgykYqdo6eu4N9PUtvE5PRBGdIs7aHqw676yZrIgPebk
         Nv4zOIPdbXLi1oC2WtvZaPkKZ/N4pfr5H2HVhvniJUsT8g7a2LpTFQmLTXWm/gMTCJDU
         vv8AyYTbfYsMGAltUo03oTkZn1Wu/RDM6m4yBm/wSvKGNoK/3+TXJ+Ao4scyy4NM/nuT
         SdcA==
X-Gm-Message-State: AOJu0Yzqcg+Kg0noI9FO4YqQsJx29Svl11ahbFVqumTEnjjCuhsz3hgu
	9c27w/NoQUrrQT+dFd2gps1E6Q==
X-Google-Smtp-Source: AGHT+IF5d1ESnNl3DW6y2+imScFbz4lvkI6XZHXfhsQrAJwxX/tlICwDYWPVmK4nZgJvWNEuauG4+g==
X-Received: by 2002:a17:906:3615:b0:9be:834a:f80b with SMTP id q21-20020a170906361500b009be834af80bmr7614130ejb.75.1699975346999;
        Tue, 14 Nov 2023 07:22:26 -0800 (PST)
Message-ID: <7fd25b34-6fd9-4f7c-90b4-e44338b2b09e@linaro.org>
Date: Tue, 14 Nov 2023 16:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 v2 06/19] hw/pci/msi: Restrict xen_is_pirq_msi()
 call to Xen
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
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-7-philmd@linaro.org>
 <EEC18CA6-88F2-4F18-BDE5-5E9AAE5778A7@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <EEC18CA6-88F2-4F18-BDE5-5E9AAE5778A7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/11/23 16:13, David Woodhouse wrote:
> On 14 November 2023 09:38:02 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> Similarly to the restriction in hw/pci/msix.c (see commit
>> e1e4bf2252 "msix: fix msix_vector_masked"), restrict the
>> xen_is_pirq_msi() call in msi_is_masked() to Xen.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Hm, we do also support the Xen abomination of snooping on MSI table writes to see if they're targeted at a Xen PIRQ, then actually unmasking the MSI from QEMU when the guest binds the corresponding event channel to that PIRQ.
> 
> I think this is going to break in CI as kvm_xen_guest.py does deliberately exercise that use case, doesn't it?

Hmmm I see what you mean.

So you mentioned these checks:

- host Xen accel
- Xen accel emulated to guest via KVM host accel

Maybe we need here:

- guest expected to run Xen

   Being (
                 Xen accel emulated to guest via KVM host accel
	OR
                 host Xen accel
         )

If so, possibly few places incorrectly check 'xen_enabled()'
instead of this 'xen_guest()'.

"Xen on KVM" is a tricky case...

> I deliberately *didn't* switch to testing the Xen PV net device, with a comment that testing MSI and irqchip permutations was far more entertaining. So I hope it should catch this?

¯\_(ツ)_/¯

