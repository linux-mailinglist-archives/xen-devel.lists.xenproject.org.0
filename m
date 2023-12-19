Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169EA818D23
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 18:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657051.1025694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFdSE-0000ZR-FW; Tue, 19 Dec 2023 17:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657051.1025694; Tue, 19 Dec 2023 17:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFdSE-0000Wx-BX; Tue, 19 Dec 2023 17:00:26 +0000
Received: by outflank-mailman (input) for mailman id 657051;
 Tue, 19 Dec 2023 17:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rImv=H6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFdSC-0000Wr-RV
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 17:00:24 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 195ecc8d-9e90-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 18:00:23 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d22d3e751so5933345e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 09:00:23 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f5-20020adff8c5000000b00336485a4cdbsm15554489wrq.70.2023.12.19.09.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 09:00:22 -0800 (PST)
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
X-Inumbo-ID: 195ecc8d-9e90-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703005223; x=1703610023; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rV09zXCDKt8jWh7yHzuSrv+XwGyKg1eYYqRr6qulHQI=;
        b=mD/83/ZODWQJ8WhtP3y6UQ77nQqhCWvgiaOvKZjQXzlswMhKe60SAJsQFD74I/+TX2
         pXdeXW+jijTyMFw4ALHToxx6sY0PYIAf23xRlwPxOKRVl1gcVA1gf9sBtyYquC0R6gtL
         957uKt1/xPcCj6nc1dTOxxgmrmkqyzbzLIrsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703005223; x=1703610023;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rV09zXCDKt8jWh7yHzuSrv+XwGyKg1eYYqRr6qulHQI=;
        b=CRKR5gy7CPIP66WH0lwXpddWcUqUgInrF4WX6Xn6VgnuxwZ0h06Ex2kX2SAedU4Hv2
         muFG/GPiWv01RVAdwunVfG7FbM3swJaS2cbK7KErCfl3p1QURkj5T95NsEd4qINeOaue
         Y2JNUm+5j5ivGc4P0694uLJJsUdYydK6yMgwVBzvDOrVYeVMJg2nEWAGWt1X1AaBs8+4
         J7bSTrPRtVsn4//8csXYpVhBeyxtectcxCOSM1m1mlQBDss3UlDptXyTEJmbXo0CiAQf
         oRKI9Qg0dQ6n4kFaBCv8xnnvHQXnpf9LltWJzoauSSaX3H24XAdZk9JjGt37M3weYLF/
         ATrw==
X-Gm-Message-State: AOJu0Yz0d9E/TSrS77PoskSdRgTlJfoBguDpbdvhCwNGNhImSsDZTAN7
	N1/AtiZPTgNt1VQ01sbR19uaJk/Oc6N4rw==
X-Google-Smtp-Source: AGHT+IEO1m/JB1LTvXCXN7kK7Xmf8H9m1+WyOFushswcCcE5b4DuuzrectS24UiD7AfOH9krLm3JoQ==
X-Received: by 2002:a05:600c:4712:b0:405:2d29:1648 with SMTP id v18-20020a05600c471200b004052d291648mr786466wmo.19.1703005222840;
        Tue, 19 Dec 2023 09:00:22 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------OM0l3WQ0ZAOJy0m1xUrCLxJV"
Message-ID: <1b1116d0-bbda-4fa3-ae41-321e69626641@citrix.com>
Date: Tue, 19 Dec 2023 17:00:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Possible bug in Xen
Content-Language: en-GB
To: Joe Tretter <j.tretter@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <de8b87e2-a4a2-4e49-80f5-97c745f46500@gmail.com>
 <9cc86706-5791-4967-802c-3e665bc97804@citrix.com>
 <a0aa0326-398f-44a1-a5df-fde3e7fea138@gmail.com>
 <cd153225-5cef-4ff5-97e3-44e485c12305@citrix.com>
 <e787b9ba-7a30-4804-b64e-ef56c71f5ed3@gmail.com>
 <caf76de4-89f5-4ce4-b1e3-1de7a21325dc@citrix.com>
 <15ece71b-d1d1-49d8-b937-f697b50fac39@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <15ece71b-d1d1-49d8-b937-f697b50fac39@gmail.com>

This is a multi-part message in MIME format.
--------------OM0l3WQ0ZAOJy0m1xUrCLxJV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/12/2023 4:28 pm, Joe Tretter wrote:
> On 12/19/23 10:05, Andrew Cooper wrote:
>> Is it always the same test which fails, or is it random?
> Which test fails seems to be random (see attached screenshot).
>> Looking at https://github.com/Tarsnap/scrypt it's only a trivial piece
>> of userspace crypto.
>>
>> The fact that running multiple instances makes it fail more easily
>> points towards some kind of register handling issue, but the fact that
>> it repros only under Xen, and even with eager-fpu (which isn't the
>> default on AMD, sadly), is weird.
>>
>> Looking at the scrypt source, it has alternative routines for the AESNI
>> and SHANI instruction groups.  However, because it's a Zen1, we don't
>> have a useful way of filtering visible for PV dom0 userspace.
>>
>> First of all, can you get the exact CPU model and microcode version. 
>> `head /proc/cpuinfo` will be enough.  But while you're at it, can you
>> include `xl dmesg` too just in case there's something obvious showing up
>> there too.
>>
> I have attachted text files with the (full) cpuinfo and the dmesg.

microcode    : 0x8001129

That's 0x08001129 when not rendered brokenly, and the up-to-date version
is 0x08001138 (which itself dates from 2019).

If you can, get a firmware update.  Given that it's a Dell, there's a
good chance it's already on LFVS/fwupd.  This is definitely the
preferred option.

If not, and you're willing to experiment in definitely unsupported
territory, then move /lib/firmware/amd-ucode/microcode_amd_fam17h.bin
sideways in dom0, and replace it with the attached SummitRidge-08001138
file (it's important to still be named microcode_amd_fam17h.bin in the
end), then rebuild the initrd and reboot.

You already have ucode=scan on Xen's command line, so after the reboot
you should see some messages about updating microcode too.

Irritatingly, AMD don't put client microcode into linux-firmware, but
there are various collections of blobs found in the wild online.  I've
picked the one which I think is right for your CPU, and packaged it it
appropriately for Xen.


Anyway, I'm not sure if this will fix anything, but life is too short to
be debugging stuff like this on out-of-date firmware/ucode.

~Andrew
--------------OM0l3WQ0ZAOJy0m1xUrCLxJV
Content-Type: application/octet-stream; name="SummitRidge-08001138"
Content-Disposition: attachment; filename="SummitRidge-08001138"
Content-Transfer-Encoding: base64

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
AAAAAACcfwBWDBIA

--------------OM0l3WQ0ZAOJy0m1xUrCLxJV--

