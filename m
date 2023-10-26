Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F9C7D87A4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 19:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623947.972259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw4Jh-0000K0-N0; Thu, 26 Oct 2023 17:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623947.972259; Thu, 26 Oct 2023 17:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw4Jh-0000HS-Jr; Thu, 26 Oct 2023 17:38:45 +0000
Received: by outflank-mailman (input) for mailman id 623947;
 Thu, 26 Oct 2023 17:38:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ivkI=GI=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qw4Jf-0000HM-SG
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 17:38:43 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 813f3f6b-7426-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 19:38:42 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32d9effe314so799468f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Oct 2023 10:38:42 -0700 (PDT)
Received: from smtpclient.apple ([90.243.16.33])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfef10000000b0032d8354fb43sm14779062wro.76.2023.10.26.10.38.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Oct 2023 10:38:41 -0700 (PDT)
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
X-Inumbo-ID: 813f3f6b-7426-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698341922; x=1698946722; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7haMi/oR3rkIxkTSuG/UQEkuXC0vFdY9Oe7FppsCLqU=;
        b=T0SgXyqAYHCR0Xz4XBTZpWezBi1cemE0x2vg0VzNBc3EXmAvy2kvPzIdKBFWjmsHnA
         TaE6lf5tgOZzET1ZHwPHYSOQ7xLWEkc8sOlvubvXodyQR5ht8O9k/EehaKv3YWYRsLOm
         ymN1Ub0TYT8hPQ262pohQFvs44pKE/91bS0GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698341922; x=1698946722;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7haMi/oR3rkIxkTSuG/UQEkuXC0vFdY9Oe7FppsCLqU=;
        b=wP4zaekCVVH6mZXDILINCModu3S8FuBPA0bZgFjB26NWCYglfPvpY/t3kyYxl4ZSgT
         +EUrwZQ0bjWbaKGtTx6BsYw8N3CXxURLdY/hW2q/Cc9yaXFGxu+BFVxZnK2DhCLbhqoG
         EGlbLdhDCMuNSfHwWgL8V6eSoq5FtYmbhbC46Y/jffRdFIXlzod0gI8kCoY5tststmn+
         6RjHVK8L9Aft2hUee1lcYtvc6su36wvKzmpHtkEZaCymhmRnbe+mdv708BK3KLdE55pg
         1D7XJJw281LG3MRBKqCF7JbfFXUJ7RMveflzRDLE/AMWpMOUkGgwUhdR82GKXOiqxoaF
         N0qA==
X-Gm-Message-State: AOJu0YwAaCIqbxcwApQnf988g5aaAM5gcx1ygSazh0OLFwT+qi8/RA7O
	kPKdSLb5xtQZdaF9k9O1PnZbaA==
X-Google-Smtp-Source: AGHT+IG7Csm4CQJoTDK5DhFoGIjDiKi19HU25vEjsq3cU0GeRAZAGeJtHgfSpkhKv2wJ13YNje0JJQ==
X-Received: by 2002:a05:6000:1563:b0:329:6bdc:5a60 with SMTP id 3-20020a056000156300b003296bdc5a60mr370006wrz.12.1698341921732;
        Thu, 26 Oct 2023 10:38:41 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [PATCH] tools/ocaml/Makefile.rules: use correct C flags when
 compiling OCaml C stubs
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <a907d98a-2d0d-cbf0-ae9e-cfa2e3dd37e2@suse.com>
Date: Thu, 26 Oct 2023 18:38:29 +0100
Cc: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3BB711DB-2420-4731-B3C3-A66E3791D039@cloud.com>
References: <fd09742f7c2191be3cdfafbd4c7cccb10eb0e3a2.1698240589.git.edwin.torok@cloud.com>
 <a907d98a-2d0d-cbf0-ae9e-cfa2e3dd37e2@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On 25 Oct 2023, at 15:04, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 25.10.2023 15:52, Edwin T=C3=B6r=C3=B6k wrote:
>> --- a/tools/ocaml/Makefile.rules
>> +++ b/tools/ocaml/Makefile.rules
>> @@ -37,7 +37,7 @@ ALL_OCAML_OBJS ?=3D $(OBJS)
>> $(call quiet-command, $(OCAMLYACC) -q $<,MLYACC,$@)
>>=20
>> %.o: %.c
>> - $(call quiet-command, $(CC) $(CFLAGS) -c -o $@ $<,CC,$@)
>> + $(call quiet-command, $(OCAMLOPT) -verbose $(addprefix -ccopt =
,$(CFLAGS)) -c -o $@ $<,CC,$@)
>=20
> Wouldn't -verbose better be passed only if the build isn't a quiet =
one?

Only the OCaml files (and the hypervisor itself) are compiled in quiet =
mode. It looks like tools/ and the C files in tools/ocaml were not,
so the patch as is preserves the existing behaviour.

I think there were some patches to switch to a non-recursive make, I =
hope that'll make quiet mode more consistent throughout the tree, until =
then I'd keep it as is
instead of complicating the macro more.

Thanks,
--Edwin=

