Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DDF87BA6A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 10:31:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693071.1080811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkhQf-0003Ld-KN; Thu, 14 Mar 2024 09:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693071.1080811; Thu, 14 Mar 2024 09:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkhQf-0003J5-G0; Thu, 14 Mar 2024 09:31:13 +0000
Received: by outflank-mailman (input) for mailman id 693071;
 Thu, 14 Mar 2024 09:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k6je=KU=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkhQd-0003Iz-IA
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 09:31:11 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9576d367-e1e5-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 10:31:07 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-29c722a2e1aso564192a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 02:31:07 -0700 (PDT)
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
X-Inumbo-ID: 9576d367-e1e5-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710408666; x=1711013466; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rwb5oqQFsCQxahi/bVQs5Z69+pPSBgsWMhIQOKz5gw=;
        b=fePrSBxolucvkMtuEmpkY70bY+NVcuKL5pEGAU9M3F27ITiEIuvM6S3Z4SYpeErmRY
         W3xx8s4/+PhOsmZFu75OBY+TDQOuaO8UF2Hu0oxBNQUrhw/WGEwLqkO5L79kLEpYpmzD
         urLCX5GqlhZX0KYHerqPC4T1k7rEy6Ygt7j1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710408666; x=1711013466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rwb5oqQFsCQxahi/bVQs5Z69+pPSBgsWMhIQOKz5gw=;
        b=aONtYE3Ld+6VTGKnpN9emJ+AfbwQEyXYBYazx/EfkBWm4pEomteOorBM1+DxYeDU0k
         GqqQtOG0Xioqa6w3eM06NNKl4V8Fzq/v9BP95Fbry0NHY/8P1FFT+Hk0WYMduGRCSmFR
         J63yMKbq4GxVuF4sZbEhXtBBOBtaVMrnTQPkBAgqomPRk5L6lYJL9BS4MkjLk0SbM6FR
         lVimYmpAB6g1qqRGi1ntGq3zVZ2gQNbbVJXGcsEDI/iFPSCJ5sEPfBl/Pe8rW5wNruGZ
         cXflnwtJtig1E1L5cjVr+YNVCIkWZ/1Oh5q4lMdBOahDdbrIXZYzqc6vMoM5QrK94cjI
         vnUA==
X-Gm-Message-State: AOJu0YzkhBp6q6DHj2EtkMwSrxCCJaW1TtHi7DkVKm26EAWPdXQ+umGQ
	2lNbxQvQesyvfQgSWVKQq60plFNQ1gM4D7YCtvYjT0R3S7qzQGb/nmjEbuzTLTtX18QNz3tlK3R
	1g/JDO0KCQcqethYhpRSwvolwFY2ssg89e6OL
X-Google-Smtp-Source: AGHT+IEUOg1KYg94duL74iAVK63VnYRkbZwhJ59ARuVjLYmHNKeKlhACEdoiZMKrshTTQKcSTakDxiFHS+Eg1Pk67Ag=
X-Received: by 2002:a17:90b:3912:b0:29d:dd40:cdc3 with SMTP id
 ob18-20020a17090b391200b0029ddd40cdc3mr432200pjb.18.1710408665939; Thu, 14
 Mar 2024 02:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-2-ross.lagerwall@citrix.com> <c6e79962-0537-4ed8-b99f-f2614f5a7987@suse.com>
In-Reply-To: <c6e79962-0537-4ed8-b99f-f2614f5a7987@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 14 Mar 2024 09:30:54 +0000
Message-ID: <CAG7k0Ep6fDfjKXj-iwuGh=pF_BS-1EaT9kRm1xJTZ=bmt=3+rA@mail.gmail.com>
Subject: Re: [PATCH 1/7] multiboot2: Add load type header and support for the
 PE binary type
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Daniel Kiper <daniel.kiper@oracle.com>, grub-devel@gnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 7:24=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 13.03.2024 16:07, Ross Lagerwall wrote:
> > In addition to the existing address and ELF load types, specify a new
> > optional PE binary load type. This new type is a useful addition since
> > PE binaries can be signed and verified (i.e. used with Secure Boot).
>
> And the consideration to have ELF signable (by whatever extension to
> the ELF spec) went nowhere?
>

I'm not sure if you're referring to some ongoing work to create signable
ELFs that I'm not aware of.

I didn't choose that route because:

* Signed PE binaries are the current standard for Secure Boot.

* Having signed ELF binaries would mean that code to handle them needs
to be added to Shim which contravenes its goals of being small and
simple to verify.

* I could be wrong on this but to my knowledge, the ELF format is not
being actively updated nor is the standard owned/maintained by a
specific group which makes updating it difficult.

* Tools would need to be updated/developed to add support for signing
ELF binaries and inspecting the signatures.

I am open to suggestions of course but I'm not sure what benefits there
would be to going the ELF route.

Ross

