Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D038783D938
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 12:21:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671950.1045514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTKGc-0006AK-Jg; Fri, 26 Jan 2024 11:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671950.1045514; Fri, 26 Jan 2024 11:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTKGc-00067A-Fs; Fri, 26 Jan 2024 11:21:02 +0000
Received: by outflank-mailman (input) for mailman id 671950;
 Fri, 26 Jan 2024 11:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UtOA=JE=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1rTKGa-000674-Ld
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 11:21:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9931854-bc3c-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 12:20:57 +0100 (CET)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-iB7BsvkQPVKw3TIEQj0KKQ-1; Fri, 26 Jan 2024 06:20:55 -0500
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6854ad24a0cso3652596d6.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 03:20:55 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 fc16-20020ad44f30000000b006845032c973sm429852qvb.124.2024.01.26.03.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 03:20:54 -0800 (PST)
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
X-Inumbo-ID: f9931854-bc3c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706268057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fJ5FeqP2XKfj6svBB0cNkZlZTEhA0qeNru0y2SwAZq8=;
	b=NRvyy1KfWkSdmrdVla5F7OMvtwNfFnVsa3u2uI4jGyoFgc1q6sANbPbrh94m94KjrNOWja
	1lbl+RUCSVhfbZTdkeV7g2RqyHVtqufwO6BlN7i3E2fkFHckg5ggku42dDIOTg/SvJTw1I
	JLW22FRf9QeI9/bAlxx/ddrWQWUnWOQ=
X-MC-Unique: iB7BsvkQPVKw3TIEQj0KKQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706268055; x=1706872855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJ5FeqP2XKfj6svBB0cNkZlZTEhA0qeNru0y2SwAZq8=;
        b=eBPPBLKQDtM4cY/vxt8P+TsQWzsR2K77sewXfOQnAysCRhf/tpwvhlFWPC2PQjrhU8
         aQW5dIe/fGzcXSW4NkESwYim/BJhj0Pth8fKaK3OpL+DbBLLETkheKkHpdyALSPYAm80
         m1Xccp6fyAUQnCfuPZnI+9qXzmwwOKerMh/VNfNKb4xCU2682ls/o4DARHkgS6i92V0b
         BIgdvTV8tUqtmvP+wXJly2BP2p6r1iR/iQKfVEG4Yf4+7N+L3gL7vfZuxVU6qoWclp7q
         FFyHLWs1Nkw9MAMRPncz9BJpKu0XACPEEI8HoRWmbUkvrbSSjW51VtQmozuS7Pqm0Chx
         cjHA==
X-Gm-Message-State: AOJu0Yy9C0yDY9Ssu+9irNjvLSj1gfH8wrqI6jtzA4lJmyy0k4oMeUNV
	gA/Oey7hAIfE1T0nlyD1tzQtSyaMTAcAWx6guyL5AEBbQOZzhDHNQ9s6gh1Sh6VksECnqxeyPAc
	F/SV1U7FUy8z0wOEXwYyr9Xh1/Js9+h3CZ4clZfdsgRL1HUMgJlYtUP/qxiC1WNL9
X-Received: by 2002:ad4:5f89:0:b0:686:9e87:a0d4 with SMTP id jp9-20020ad45f89000000b006869e87a0d4mr1477600qvb.23.1706268055200;
        Fri, 26 Jan 2024 03:20:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHppLBe/1tsc9YBAOM4Adh/A4rcqZv2YHMC7gUpJu+11IJqxvYgKYiel6IUtmTgJOPU5q1xig==
X-Received: by 2002:ad4:5f89:0:b0:686:9e87:a0d4 with SMTP id jp9-20020ad45f89000000b006869e87a0d4mr1477571qvb.23.1706268054851;
        Fri, 26 Jan 2024 03:20:54 -0800 (PST)
Message-ID: <da5f845f-dfee-48de-9fc2-af27b83a615b@redhat.com>
Date: Fri, 26 Jan 2024 12:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/46] hw/i386/pc: use qemu_get_nic_info() and
 pci_init_nic_devices()
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao
 <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-6-dwmw2@infradead.org>
 <d6b0fd22-92ef-4873-a19a-e7752bfddd2d@redhat.com>
 <b618c5e3163a3407c413464edd5f638f1c8563fa.camel@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <b618c5e3163a3407c413464edd5f638f1c8563fa.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/01/2024 12.13, David Woodhouse wrote:
> On Fri, 2024-01-26 at 11:43 +0100, Thomas Huth wrote:
>> On 08/01/2024 21.26, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> Eliminate direct access to nd_table[] and nb_nics by processing the the
>>> Xen and ISA NICs first and then calling pci_init_nic_devices() for the
>>> rest.
>>>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>> Reviewed-by: Paul Durrant <paul@xen.org>
>>> ---
>>>    hw/i386/pc.c                | 26 ++++++++++++++++----------
>>>    include/hw/net/ne2000-isa.h |  2 --
>>>    2 files changed, 16 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>> index 496498df3a..d80c536d88 100644
>>> --- a/hw/i386/pc.c
>>> +++ b/hw/i386/pc.c
>>> @@ -658,8 +658,11 @@ static void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
>>>    {
>>>        static int nb_ne2k = 0;
>>>    
>>> -    if (nb_ne2k == NE2000_NB_MAX)
>>> +    if (nb_ne2k == NE2000_NB_MAX) {
>>> +        error_setg(&error_fatal,
>>> +                   "maximum number of ISA NE2000 devices exceeded");
>>>            return;
>>> +    }
>>
>> error_setg(&error_fatal, ...) quits QEMU, so the "return;" does not make
>> much sense anymore.
>> Now, according to include/qapi/error.h :
>>
>>    * Please don't error_setg(&error_fatal, ...), use error_report() and
>>    * exit(), because that's more obvious.
>>
>> So I'd suggest to do that instead.
> 
> It's going slightly in the opposite direction to what's requested in
> https://lore.kernel.org/qemu-devel/34e2c0c6-4e04-486a-8e1f-4afdc461a5d4@linaro.org/
> 
> I was thinking that a future patch would let the &error_fatal be an
> Error** passed in by the caller, and not actually hard-coded to be
> fatal at all.
> 
> But sure, unless Philippe objects I'm happy to do it as you show above.

Now that you mention it, I'd also prefer having an Error** parameter to the 
function instead, that's certainly cleaner. So if you don't mind, please 
follow Philippe's suggestion instead!

  Thanks,
   Thomas


