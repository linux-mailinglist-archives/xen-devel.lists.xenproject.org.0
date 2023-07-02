Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CB97452EF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 00:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557985.871728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qG5W4-00032V-9A; Sun, 02 Jul 2023 22:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557985.871728; Sun, 02 Jul 2023 22:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qG5W4-000307-6J; Sun, 02 Jul 2023 22:26:00 +0000
Received: by outflank-mailman (input) for mailman id 557985;
 Sun, 02 Jul 2023 22:25:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KS54=CU=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1qG5W2-0002zy-3G
 for xen-devel@lists.xenproject.org; Sun, 02 Jul 2023 22:25:58 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67cdac44-1927-11ee-b237-6b7b168915f2;
 Mon, 03 Jul 2023 00:25:55 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso11000085e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jul 2023 15:25:53 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-031-053.89.14.pool.telefonica.de.
 [89.14.31.53]) by smtp.gmail.com with ESMTPSA id
 d1-20020a5d6dc1000000b00304adbeeabbsm23974422wrz.99.2023.07.02.15.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jul 2023 15:25:52 -0700 (PDT)
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
X-Inumbo-ID: 67cdac44-1927-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688336752; x=1690928752;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brJ53WepNRWQm12rssTXlqHMNSqdSpQ3iotpQXlBldw=;
        b=oFqiyjgCuw2kW5i4vvmVZhxFlTsWp8F5rVJGhXKMmfgN63339ooPR9xS3m/kDP8SfX
         OLuDVL953iL23YmgupptKXaWSzl4RBQsMyAK3WJz5PKjjnmy4n2s+ljEtdKuSuzPwuFW
         IiKPjjm+JWazTicIUT+52zRkm237ipHDrqVC/hXxyJj6ZQbg2Vp79R0ZYIVtdhdrtOyR
         byn/DqsvsFuhpQIzNlpKDupg8y3fqzBMmtI2KyDlNXtfJf/UJzWmYDn7UlDEfOd4pQ0i
         zILn3nJMcFa/nRE6m6JCbc2a/wpYQSo2p4dW87txGhyY9C/2hCiK99ozy7xrdPUcLivU
         aoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688336752; x=1690928752;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brJ53WepNRWQm12rssTXlqHMNSqdSpQ3iotpQXlBldw=;
        b=PUUpzBQC5gc8HSONHTK+FUAKiIKd+ZJ5HHPO2jiSFk8KVyVxVZzvYcY3FUMx/5rY9P
         U3r6aKTHPcZfMAm9FT/ICEwYblVWFjsdyzs76b8vtlCQEJq+lhhJBixZfTK3mPsbbsan
         DrjvfjV7IaHp5Td/fTY8l+iQI3LycJvXsTU7jhW8kU0GHjYujIam4tDbrOANy4wYDRGv
         RTwMXX93mz7d+LxgfNhldGN6TVRM7qDHBZzXbK4WKPWpX2O13KEKMKe3i3UZdN6V6hpU
         w4T4Nuhcp10oGt0rk4uNBnZeh8gn+ViMMiVVcjE0fZF1NZCn/bklp6/9inGvGftIbnnJ
         4Nnw==
X-Gm-Message-State: AC+VfDxLLm0qalMdI95Rm0Iq5u73nxNZxTD/bJaMv8YC3WsTKwe6qgkm
	ijvFPYodN8vCYQrcCA10V3o=
X-Google-Smtp-Source: ACHHUZ5rXCXbjGsIoh5YArs96eCY9/yS9S2QYFz0k3XpXbCvtiSaj9YvSmw1rVnMHxW1fJOK8nsAZA==
X-Received: by 2002:a7b:c847:0:b0:3fa:9348:51a8 with SMTP id c7-20020a7bc847000000b003fa934851a8mr6265209wml.23.1688336752463;
        Sun, 02 Jul 2023 15:25:52 -0700 (PDT)
Date: Sun, 02 Jul 2023 22:25:48 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>
CC: Olaf Hering <olaf@aepfle.de>, qemu-devel <qemu-devel@nongnu.org>,
 John Snow <jsnow@redhat.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
In-Reply-To: <b562eb6f-c7ad-dec9-d92f-266ca8561170@ilande.co.uk>
References: <20210317070046.17860-1-olaf@aepfle.de> <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com> <20210325121219.7b5daf76.olaf@aepfle.de> <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com> <20230509225818.GA16290@aepfle.de> <20230626231901.5b5d11c1.olaf@aepfle.de> <c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com> <5DB37FA5-41DF-4ED6-8C8A-CDDD6F276F42@gmail.com> <20230627140740.2736f6e8.olaf@aepfle.de> <4F5609FD-4A89-4450-89E2-3311CC5A9317@gmail.com> <CABgObfamZEHv0W3B6kPXGTiT1f2G__S=Bi1-_PYeSomsiVFaFg@mail.gmail.com> <3987B0DB-46F2-49F1-AEA5-B88BC61A633F@gmail.com> <b562eb6f-c7ad-dec9-d92f-266ca8561170@ilande.co.uk>
Message-ID: <BD839728-D519-42C7-BFE9-CD15CABF09C4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 1=2E Juli 2023 11:58:57 UTC schrieb Mark Cave-Ayland <mark=2Ecave-aylan=
d@ilande=2Eco=2Euk>:
>On 01/07/2023 10:53, Bernhard Beschow wrote:
>
>> Am 30=2E Juni 2023 08:48:02 UTC schrieb Paolo Bonzini <pbonzini@redhat=
=2Ecom>:
>>> Il mer 28 giu 2023, 13:28 Bernhard Beschow <shentey@gmail=2Ecom> ha sc=
ritto:
>>>=20
>>>>=20
>>>>=20
>>>> Am 27=2E Juni 2023 12:07:40 UTC schrieb Olaf Hering <olaf@aepfle=2Ede=
>:
>>>>> Tue, 27 Jun 2023 10:12:50 +0000 Bernhard Beschow <shentey@gmail=2Eco=
m>:
>>>>>=20
>>>>>> The BAR is a 32 bit register whose default value is 0x00000001=2E I=
 think
>>>> what's supposed to happen here is a pci_set_long() rather than a
>>>> pci_set_byte()=2E
>>>>>=20
>>>>> Indeed, the u32 at that address changes from c121 to c101 with the
>>>> current code=2E
>>>>=20
>>>> Neat! Would you mind sending a patch fixing the BMIBA register to be =
reset
>>>> as 32 bit?
>>>>=20
>>>=20
>>> I think we should also check why writing the command register is not
>>> disabling the BAR as well=2E
>>=20
>> So IIUC the BMIBA register is managed internally by QEMU's PCI code and=
 we shouldn't have to mess with the register at all=2E We should actually r=
emove the explicit reset of BMIBA, correct?
>>=20
>> I've tried debugging the PCI code when working on the VIA IDE controlle=
r to understand it better=2E But despite QEMU being compiled with --enable-=
debug it seemd to be compiled with -O2 still, making debugging quite hard=
=2E I'm not sure if any compile flags leak into my build environment though=
=2E
>
>Certainly --enable-debug normally does the right thing when building QEMU=
=2E If you want to double-check the compiler flags in use to see if anythin=
g from CFLAGS/LDFLAGS is getting picked up, use "make V=3D1" after configur=
e which outputs the full command being used during the build rather than ju=
st the summary=2E

--enable-debug does the right thing indeed=2E The error was on my side=2E =
Solved!

Thanks,
Bernhard
>
>
>ATB,
>
>Mark=2E
>

