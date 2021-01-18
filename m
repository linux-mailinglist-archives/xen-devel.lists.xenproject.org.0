Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4531C2F9B80
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 09:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69449.124283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QDT-0000is-OL; Mon, 18 Jan 2021 08:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69449.124283; Mon, 18 Jan 2021 08:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QDT-0000iT-L9; Mon, 18 Jan 2021 08:48:51 +0000
Received: by outflank-mailman (input) for mailman id 69449;
 Mon, 18 Jan 2021 08:48:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1QDR-0000iO-JY
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 08:48:49 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1abd4e44-37b2-4f07-89fc-e9c1747ae400;
 Mon, 18 Jan 2021 08:48:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a12so15572485wrv.8
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 00:48:48 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id u83sm25528109wmu.12.2021.01.18.00.48.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 00:48:47 -0800 (PST)
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
X-Inumbo-ID: 1abd4e44-37b2-4f07-89fc-e9c1747ae400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=uocGW/JdZwYwL1hHSvkCPEkYfjEOWGtYFAY1A86RfjM=;
        b=kih1StH2EW0n+ce2XEM2SGkuhp+HnW/+16iLsHFjD3N/x0vH0mUTsNLKHrJ8jSbLxD
         9Xgg3h+B00QRAkrL8Hw5f5+zzrTwTyjy/NuQkpuqtXGoU37tAtobBI3rxe855HZ9bidK
         jQO5+ciaQbKbPsAfx8TUor73vr2rwKPwfSFAZsm5JfkAGuUfsPpS/zWDk4EF38X3ct3s
         1O+IbltYRVSfDEOzpis8W8hXNby3t9F0ZwzRw+Apo4UOvcdk1tQuv/ysK7kwMIPcu10m
         Fq0v3H8ZPeJ1SF0dTSAkVJYifjtmeIujAQS72jzOOB1ASqoQbQ6mwyAKlQnxQu3SnaVA
         wkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=uocGW/JdZwYwL1hHSvkCPEkYfjEOWGtYFAY1A86RfjM=;
        b=DTq3fTZJ/yX1cyPhFj63iFdaz7JMOJuCR/QUmDkjQQketMzPpJwCBz/z6yZ+60MqGj
         btHT/36GrWr8rUWKYPspnvf8rjx7fgbkpj/iFIx1nvMF/PeqJ5mGuxlbcGlqpAhPXQ3k
         B0DLa2Wl9PDxZc23ly8JIwk+ZMJ3SNi0KiD0/IcUFzTiZ0dSA9qNT5o4FzH0GB/+JdsR
         61H2s7pil9ITWcebrnj3gtMfJHB5uWCsJAxPkwSQ73OQWVwuyiWOO2gt+XCTy878DPF1
         AlREK1Ju9NhbvhUvZCntBrOLyAZp9swr5FwMNA6iRhr2hD3GYBjv74atXPwN5FXfe//w
         om6A==
X-Gm-Message-State: AOAM532I32loL4sevZCS6msC6E2Om+qGrIezrS2+wdNeU/+x9PKO/6Sa
	jwkAP/6ulafE2QFmXkMG7oE=
X-Google-Smtp-Source: ABdhPJwXNFM8fsuoB6POJphw3f3XnfDbtC2g9z66cpWkyv7iNjh6ay9r5EypCF4XTOndEvNNSiJsJg==
X-Received: by 2002:adf:f081:: with SMTP id n1mr14200517wro.228.1610959727977;
        Mon, 18 Jan 2021 00:48:47 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Jun Nakajima'" <jun.nakajima@intel.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>,
	"'Tim Deegan'" <tim@xen.org>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-5-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-5-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 04/24] xen/ioreq: Make x86's IOREQ feature common
Date: Mon, 18 Jan 2021 08:48:46 -0000
Message-ID: <00bd01d6ed76$bc3a27a0$34ae76e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQGKqDpYqPQDwMA=
Content-Language: en-gb

> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew =
Cooper <andrew.cooper3@citrix.com>;
> George Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<iwj@xenproject.org>; Jan Beulich
> <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei
> Liu <wl@xen.org>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; Paul =
Durrant <paul@xen.org>; Jun Nakajima
> <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>; Tim =
Deegan <tim@xen.org>; Julien Grall
> <julien.grall@arm.com>
> Subject: [PATCH V4 04/24] xen/ioreq: Make x86's IOREQ feature common
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> As a lot of x86 code can be re-used on Arm later on, this patch
> moves previously prepared IOREQ support to the common code
> (the code movement is verbatim copy).
>=20
> The "legacy" mechanism of mapping magic pages for the IOREQ servers
> remains x86 specific and not exposed to the common code.
>=20
> The common IOREQ feature is supposed to be built with IOREQ_SERVER
> option enabled, which is selected for x86's config HVM for now.
>=20
> In order to avoid having a gigantic patch here, the subsequent
> patches will update remaining bits in the common code step by step:
> - Make IOREQ related structs/materials common
> - Drop the "hvm" prefixes and infixes
> - Remove layering violation by moving corresponding fields
>   out of *arch.hvm* or abstracting away accesses to them
>=20
> Also include <xen/domain_page.h> which will be needed on Arm
> to avoid touch the common code again when introducing Arm specific =
bits.
>=20
> This support is going to be used on Arm to be able run device
> emulator outside of Xen hypervisor.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Paul Durrant <paul@xen.org>


