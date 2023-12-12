Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915080F1C3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 17:02:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653255.1019708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5DL-0007so-AG; Tue, 12 Dec 2023 16:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653255.1019708; Tue, 12 Dec 2023 16:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5DL-0007r1-6J; Tue, 12 Dec 2023 16:02:31 +0000
Received: by outflank-mailman (input) for mailman id 653255;
 Tue, 12 Dec 2023 16:02:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ekcj=HX=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rD5DJ-0007qd-FC
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 16:02:29 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d924ca6e-9907-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 17:02:28 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c4846847eso22016685e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 08:02:28 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 w18-20020a5d5452000000b00336367631efsm276868wrv.65.2023.12.12.08.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 08:02:27 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 01BFD5F7D4;
 Tue, 12 Dec 2023 16:02:27 +0000 (GMT)
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
X-Inumbo-ID: d924ca6e-9907-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702396948; x=1703001748; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhVnGCK45xBhXjKQjzeUrEBYyzIXyX39Thxixr9iuWQ=;
        b=fKQjbVvG9KpgydnUKqDRtyjJh2cscKEMBV3Y0uXCvEVYyXncDdfKtqKCJ75JXUpiPd
         Tgh0vEtDm++4fnIgJarUmcL0WajvhGouVL11Dy8vYMPRCY7cR7ZMeUGzVB1tpuCiHOhe
         ZMk9TBh9af1A5aG3omsG/cs70iyHodnOtIQCNrnA1pxZ0vhWXTeFrWXgo76K+mimBFUc
         tDZzGL7OtQxK8drI+cLIniS1ETzYBDkUbhKowTKMa3voHqS30peGYEVrH/ryRHUypnEf
         jhHr4Tx+VaUGS6I50YPl6VdTi2pcHqbvd51dBwk+jGkMqnonxXyWbSYX07f2WBN1s8VK
         VXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702396948; x=1703001748;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AhVnGCK45xBhXjKQjzeUrEBYyzIXyX39Thxixr9iuWQ=;
        b=weW6gD/JcKFRg2azFRublgS0RM43GBp0UFYJVL1a8Wi7WYkLNauVA7N7ku9Ze/NeMa
         aKM1GbnFPjv2xt2gN+cXCB3m2+cSc1kMi1xVed2OKPoQVHooCpt0d4t3fGechJjuqCvM
         agUk+2qa6jE66RMcON27Z6adcDSxDVAx3JwMh07WeKaw2qGNQzuZFBrXSDZ0GXmtq56o
         yU9J58oJzQeU+kZYd0hJR3S3pgcfMbp/PFC8jUBw07IZ7MYXxEFH8XHgkFFOvvMYNZRm
         kWgLHTEFWU+L2ceFujGHQ8t3a/ZzX3troNQuBK0ed/NRAvRcr3IM3GQtaUuWnft2SgBA
         LK8Q==
X-Gm-Message-State: AOJu0Yz4DQlN5EH30jbh0gMrl+Op37KpP37o4DIFS+o+vuHXIPyfPPPs
	ZIoUmeuaacuPljTPYDb+AWHHsg==
X-Google-Smtp-Source: AGHT+IEvL5rP0CFCQuL3bg8awKx85yIGG94DtKaPDO094KuG0JQvZPwHnzoFdcp4qzZ7pF74W2BJ4Q==
X-Received: by 2002:a05:600c:4897:b0:40c:a9d:fa1d with SMTP id j23-20020a05600c489700b0040c0a9dfa1dmr3366466wmp.142.1702396947793;
        Tue, 12 Dec 2023 08:02:27 -0800 (PST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Mykyta Poturai <Mykyta_Poturai@epam.com>,  "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>,  David Woodhouse <dwmw@amazon.co.uk>,  Julien
 Grall <julien@xen.org>,  Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
  "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
  Vikram Garhwal <vikram.garhwal@amd.com>,  Oleksandr Tyshchenko
 <Oleksandr_Tyshchenko@epam.com>,  stewart.hildebrand@amd.com
Subject: Re: Adding MSI support for virtio-pci to QEMU as Xen backend on ARM
In-Reply-To: <alpine.DEB.2.22.394.2312081407250.1703076@ubuntu-linux-20-04-desktop>
	(Stefano Stabellini's message of "Fri, 8 Dec 2023 14:15:16 -0800
	(PST)")
References: <PAVPR03MB10102178A70BF72984FFAF8CD848AA@PAVPR03MB10102.eurprd03.prod.outlook.com>
	<alpine.DEB.2.22.394.2312081407250.1703076@ubuntu-linux-20-04-desktop>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Tue, 12 Dec 2023 16:02:26 +0000
Message-ID: <87wmtjbe99.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Stefano Stabellini <sstabellini@kernel.org> writes:

> +Stewart
>
> On Fri, 8 Dec 2023, Mykyta Poturai wrote:
>> Hello everyone,
>>=20
>> I am currently working on adding MSI support to virtio-pci on ARM with X=
en.
>
> Excellent!
>
>
>> As far as I understand QEMU Xen ARM machine that is used for
>> virtio-pci device emulation does not initialize any interrupt
>> controllers. And that makes it somewhat unclear what is the best
>> approach to adding the MSI support. So, I would appreciate some
>> thoughts on this.
>> To trigger the MSI interrupt in Xen guests we basically need to call a s=
ingle DMOP, which I am also implementing.
>
> You should be able to call xen_inject_msi
>
>
>> So far, I have come up with 3 possible approaches:
>> 1. Hooking up the existing GIC code to the Xen Arm machine and extending=
 it with the DMOP call.
>
> No, I would rather avoid this for a couple of reasons. In reality, the
> GIC is emulated by Xen, not QEMU. So letting QEMU think that QEMU is
> emulating a GIC is more error prone than the alternatives and also it
> would allocate resources needlessly.
>
>
>> 2. Writing some new barebones GIC implementation with only the required =
methods (something similar to xen_apic.c).
>> 3. Just hooking up the DMOP call to the existing PCI code based on xen_e=
nabled() check.
>
> I would rather not introduce any more if (xen_enabled()) checks beyond
> the ones we already have unless it is the only option. So I would go
> with option 2). Even better if we could reuse xen_apic.c. xen_apic.c is
> just a stub, which is basically the same thing that we need here.

I guess the APIC part of the name is part of the historical baggage of
x86 - really it's just a xenpv-irq controller?

Anyway yeah I think just move it from hw/i386/xen to hw/xen and maybe
give it a new name with an alias to the old one we can deprecate over
time?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

