Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC079524D3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 23:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777726.1187810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seLaz-0000Dh-5a; Wed, 14 Aug 2024 21:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777726.1187810; Wed, 14 Aug 2024 21:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seLaz-0000AV-2u; Wed, 14 Aug 2024 21:31:53 +0000
Received: by outflank-mailman (input) for mailman id 777726;
 Wed, 14 Aug 2024 21:31:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2uER=PN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1seLax-0000AO-J0
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 21:31:51 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d1d439f-5a84-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 23:31:49 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso51254966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 14:31:49 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839356besm3569766b.99.2024.08.14.14.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 14:31:47 -0700 (PDT)
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
X-Inumbo-ID: 9d1d439f-5a84-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1723671108; x=1724275908; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cCAs+flEzkMP9uMnoIeWTlCC7oMnvigbN/95tJC6SAg=;
        b=FL40m3valZhOu0Bmj6dNWt5O0Nno+LAf9KAbzn29WuqjYFfp4sDewBBWzTB2wejeoE
         NwOggiOL65mrl1mX/kJWOee+pT+GfXmJTFpkuMoEsNnFI9CyNIfB6xfCgFE84tDYJPk4
         38hw9dcNMA8kU5whubxxu9DT1C4ESZaOFlghc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723671108; x=1724275908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCAs+flEzkMP9uMnoIeWTlCC7oMnvigbN/95tJC6SAg=;
        b=H8zUR0UGAtLRZTIGBSgAWZBffYMGtcUiU2C3qJTf5eWAkC2EbjZ49yeE1wY8W+HhI+
         vNuW2tEIDHsdIdHVetQ81jMwMTmsAC+tGHsiTMGrLY6QBkMqqSQAeeGeWI591TIvpLKo
         owRNyvsFwrM//+9pTUlXmmK20Gh1He+KkcnJgOFtWAxtwtRkB7UtImDSdMAGZytpGCwk
         MgJuWdhuundjh4kMaXjtAouGPh+p8d+7UurrwNZZwLy79FusHL1BJCIzgdfH5Bjq4NOW
         ylO8/SGjHk8dxiXQOTJz1w7WySbezXuuJ2b1GyusNcvtZjK+TC39Z/7rD9JjAYhx08yn
         WuTw==
X-Forwarded-Encrypted: i=1; AJvYcCVllVhQ5xpUqxUwv1WmERSZKYmIpmEnfT2nYUBFeNdJm7Gilgphz7o3cDlD8xY09DA7tly4sff4otq5u86oCrSM005F3G1+1lwHvuwHbkU=
X-Gm-Message-State: AOJu0YxN9VazFB4LtXdsHOEAkjpxmA6hXk7yaNCgtR/t0whd166VY4f+
	epS3t6YUoDDpCGXm9MxtJW57RzKqLtLnbOIf0eW+M+v3a3ch4TxJSKo3crzYVNA=
X-Google-Smtp-Source: AGHT+IFED6irtT9uAvufe9/SeOnEhI+28U4dIRi8bMvuBHjnxZSgj/tvcIDHOgDyhEqBIE2VenO+BA==
X-Received: by 2002:a17:907:7e8e:b0:a77:af6b:d1a8 with SMTP id a640c23a62f3a-a83670889b9mr267591366b.64.1723671108370;
        Wed, 14 Aug 2024 14:31:48 -0700 (PDT)
Message-ID: <2d0f0c05-1ee5-4972-868d-c94e45f71044@citrix.com>
Date: Wed, 14 Aug 2024 22:31:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Support EFI multiboot loading using PE binary
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20240814083428.3012-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240814083428.3012-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2024 9:34 am, Frediano Ziglio wrote:
> Testing this feature in preparation for UEFI CA memory mitigation
> requirements I found some issues causing the loading to fail and
> other minor issues.
> Details in series commit messages.
> This is adding an additional way to boot Xen, using GrUB2+EFI
> (xen.efi:__efi64_mb2_start).
>
> Changes since v1:
> - Changed title, apparently this is a kind of new mode;
> - address lot of comments (see "Changes" in other messages).
>
> Frediano Ziglio (5):
>   x86: Put trampoline in .init.data section
>   x86: Set xen_phys_start and trampoline_xen_phys_start earlier
>   x86: Force proper gdt_boot_base setting
>   x86: Compensate relocation in case of EFI
>   x86: Rollback relocation in case of EFI multiboot

Patch 1 is one part of supporting NX_COMPAT in the PE header, which is a
requirement from Microsoft in order to be signed.

It has nothing to do with the rest of the series, which is about making
the EFI+MB2 entry point work.

It would have helped a lot to not have mixed these together in a series
claiming to only be about the latter.


Now, as indicated in our documentation (yes - this is one of the very
few I have managed to get committed),
https://xenbits.xen.org/docs/latest/hypervisor-guide/x86/how-xen-boots.html#xen-efi

The MB2 tags existing in xen.efi is a known thing but came as a surprise
to some.  It exists because xen.efi is a strict superset of xen.gz,
including head.S which contains the MB1/MB2 tags.

Nevertheless, if we want to make EFI+MB2 work, that's fine, but the
final patch in the series needs to be one updating the docs to reflect
the new behaviour of Xen.

~Andrew

