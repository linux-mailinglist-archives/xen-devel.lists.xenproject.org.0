Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7DF74367D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 10:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557354.870629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF98V-0004Ep-8m; Fri, 30 Jun 2023 08:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557354.870629; Fri, 30 Jun 2023 08:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF98V-0004Cu-4q; Fri, 30 Jun 2023 08:05:47 +0000
Received: by outflank-mailman (input) for mailman id 557354;
 Fri, 30 Jun 2023 08:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDqp=CS=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1qF98T-0004Co-B0
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 08:05:45 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e624e2-171c-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 10:05:41 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-98e109525d6so277573666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 01:05:41 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-131-254.89.12.pool.telefonica.de.
 [89.12.131.254]) by smtp.gmail.com with ESMTPSA id
 e23-20020a170906045700b00992c92af6f4sm983307eja.144.2023.06.30.01.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 01:05:40 -0700 (PDT)
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
X-Inumbo-ID: e7e624e2-171c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688112341; x=1690704341;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W548W94gIUu0+BCL3qmZZRt6kia8R4D6w9rTpVoB54E=;
        b=rDoRNA8g9LkDkME65XMOtgtbGNa18T3HmmYdeksI4bBRo1zfZV2OBZoKtq708q+FBx
         ioeVq1H/JglA9rCllshVJDnHLvANy/rzN3zOtJxfM/q9tqKGzF98A7CV4G5Xq1j1+fnK
         relzBY8LJC+hiyCApuzJagYVTRQ0VbE5uUf4NhPB66Ly+W10TURpFff08gWiz6y2qdpP
         Glk58ipWgXOx5fsmQLT2zCp4IcsZ/HLj/IcE7DXC1hzBus/YTYod5KX/BZ2jaJvaQXk+
         +whryVEn3Sz8lJZUeOF7yOBp9+LWnRkn6jCqjSLw9qck60ZhouCXhIRgsPad0M0Zr9tW
         mQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688112341; x=1690704341;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W548W94gIUu0+BCL3qmZZRt6kia8R4D6w9rTpVoB54E=;
        b=hhSbEv7DEJ/jF3PhZrCgDMNMrYx/iJ6GJyNNr3muxGmh5iLzP0iSBi6t9TvPpHOFgr
         QMENvv4jV908iyLo/iN1V/AGfMOHdiWzIU4X+nPrAhySIhbRnpeOigUdpnal5RC5RDR1
         8ip2bk7vyWQ9ntpsYBm0RfUIeoCvK1DtoKZWqPKGeXsG2JRgdXOIbqjLny4KWUanKyGU
         iZ3sP/DZ2mzt3TQLCEylGPWDlAQS7SSf0/3DRbhmyYB+EzWMe/Z8qIFVOOIz+aH+s9bp
         IJd6kHHafs0O2TilmmIc5s2F4IIuaRnYMALCbNCla1ol3MQRK1XP1csy24Qqaf2pKr1N
         LgWQ==
X-Gm-Message-State: ABy/qLY4OgVBBeGQEa0zC9ZDbEcp5OwCF6DDUHfRUfiUhA3HIC0oZveB
	Z5Dotz5HYyr9/3ukEiEeAuE=
X-Google-Smtp-Source: APBJJlGQgvHJJleDfcXmbEhxCodIf5NF+jBIVZef5dv1E0voP2B1/gg4F/Ep9yW9haB1kJRVUkSrwQ==
X-Received: by 2002:a17:906:7fc5:b0:991:7874:e882 with SMTP id r5-20020a1709067fc500b009917874e882mr1955534ejs.3.1688112340774;
        Fri, 30 Jun 2023 01:05:40 -0700 (PDT)
Date: Fri, 30 Jun 2023 08:05:29 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Olaf Hering <olaf@aepfle.de>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
In-Reply-To: <20230630092921.392b302d.olaf@aepfle.de>
References: <20210317070046.17860-1-olaf@aepfle.de> <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com> <20210325121219.7b5daf76.olaf@aepfle.de> <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com> <20230509225818.GA16290@aepfle.de> <20230626231901.5b5d11c1.olaf@aepfle.de> <c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com> <5DB37FA5-41DF-4ED6-8C8A-CDDD6F276F42@gmail.com> <20230627140740.2736f6e8.olaf@aepfle.de> <4F5609FD-4A89-4450-89E2-3311CC5A9317@gmail.com> <20230630092921.392b302d.olaf@aepfle.de>
Message-ID: <367317C5-DB65-40EF-B45B-97E0E802A994@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 30=2E Juni 2023 07:29:21 UTC schrieb Olaf Hering <olaf@aepfle=2Ede>:
>Wed, 28 Jun 2023 09:27:16 +0000 Bernhard Beschow <shentey@gmail=2Ecom>:
>
>> Would you mind sending a patch fixing the BMIBA register to be reset as=
 32 bit?
>
>Will do so next week=2E

Great! Perhaps it could then be picked up by maintainers together with my =
other IDE changes=2E

>
>Are the specs for this chipset available,

Yes=2E Have a look for piix3/piix4 here: https://www=2Eintel=2Ecom/design/=
archives/chipsets/440/index=2Ehtm

> does this address really need
>to be accessed in quantities of u32, or is perhaps u16 required? I guess
>for this specific bug pci_set_word may work as well=2E
>
>Either way, commit e6a71ae327a388723182a504bb253777ec36869b was wrong=2E
>Does the comment added in this commit mean, the quantity is really u32?

As per the datasheet (and per the comment in the source code) the BMIBA re=
gister is 32 bit=2E Search the datasheet for the register name and you'll a=
lso find its default value which it holds after reset=2E

Best regards,
Bernhard

>
>
>Olaf

