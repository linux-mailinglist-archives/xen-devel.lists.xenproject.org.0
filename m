Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6994337E
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 17:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768910.1179804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBOu-0003Tt-1x; Wed, 31 Jul 2024 15:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768910.1179804; Wed, 31 Jul 2024 15:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBOt-0003Rd-Un; Wed, 31 Jul 2024 15:38:03 +0000
Received: by outflank-mailman (input) for mailman id 768910;
 Wed, 31 Jul 2024 15:38:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/qb=O7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sZBOs-0003RX-6p
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 15:38:02 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de7c65fb-4f52-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 17:38:01 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52f025ab3a7so9048721e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 08:38:01 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab4de64sm777402766b.48.2024.07.31.08.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 08:37:59 -0700 (PDT)
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
X-Inumbo-ID: de7c65fb-4f52-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722440280; x=1723045080; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SBfzS50dKd+VmOO0lahQTkjnzdhJcM7TL/xugaKDhVs=;
        b=C8h9L5E/2aaJG9Zc5CdlUrXLETLEVxnaRV4dfk3Ruu7k1PuhD6Lsrspv+yiAdWePY7
         cEzl8hHy5u3K3Z6LNu/vZbow6h1kSy9OEKnV3mltf6fgok9VIaQ31lt3l0doEwNo7NCa
         Cl52mb2lxE5rYOTeWA+Vj9r8rmlTzDoEhJdQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722440280; x=1723045080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBfzS50dKd+VmOO0lahQTkjnzdhJcM7TL/xugaKDhVs=;
        b=jlAUQr9xiFofasNF1Vzx1DT+aJMWswYtMkikO+7aoLJCDNWyQbeoII2TczkKfjLzRb
         gw1WgbySrgPPZwQvBJSrhA7YrOP0Uq2FD089DlzfyrKdGi4S0xQPzbruipYHBSCCvWGJ
         YOHBFmuk9sMRbjbKYp1+zs2f44Rg5oqsRvcxihg2RL1mGjpkqfa/lmn6uWvTKE4T1pyM
         34SxM6i3msvHz8rX3RoFR5TxbYy9ug9Sh5y6zNMILYUQDE6OoaCVMovr4oxJ0IGgeXpw
         zmV1VFAKFnV5c3Tl2jB6ZypX39P2POBc70qQ9XP27bvzkRFBkc4zoqiGy5fqOpssUoXA
         xV8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpjEVMx5SMfULV6qo7uN8TBQ4wIr1Gjb724qBY4kor7TVcaUlVmCh0evWJl1TDH//qSSIpSx8B/abQ2UV2hZqYlDVUJInX1viQqkOI1QA=
X-Gm-Message-State: AOJu0YypFEtQk/VWnWYZ1eV5XZ3ux8LvK2oWhPB1tkoGOggC/CseGaIb
	ar/tu4n/BUctmMYi7cBpzwvp/1Z6YMj2Ha9W8B++QbCSkbFFiGXQQ0WhUk+9AW8=
X-Google-Smtp-Source: AGHT+IHHhZoIEmJSaHClje9opgeTsi7ATxS4RI67k6k2apfn6M0HzH3pITZgnDVxhZ5Si7dcCgigCA==
X-Received: by 2002:a05:6512:108b:b0:52c:8a39:83d7 with SMTP id 2adb3069b0e04-5309b2e04e5mr11317840e87.52.1722440280154;
        Wed, 31 Jul 2024 08:38:00 -0700 (PDT)
Message-ID: <46b16a0d-b6f3-4a1c-aae6-c42d7e365e6f@citrix.com>
Date: Wed, 31 Jul 2024 16:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: fix build issue for bullseye-riscv64 container
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240731150708.122778-1-oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240731150708.122778-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/07/2024 4:07 pm, Oleksii Kurochko wrote:
> Address compilation error on bullseye-riscv64 container:
>    undefined reference to `guest_physmap_remove_page`
>
> Since there is no current implementation of `guest_physmap_remove_page()`,
> a stub function has been added.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>

Usually we do Fixes/Reported-by tags first.  (We try to do tags in
chronological/logical order).

I've confirmed this fixes the issue, so Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

Having tried a different approach,

user@3c393ef3b4c0:/build/xen$ make
  UPD     include/xen/compile.h
Xen 4.20-unstable
make[1]: Nothing to be done for 'include'.
make[1]: 'arch/riscv/include/asm/asm-offsets.h' is up to date.
  CC      common/version.o
  LD      common/built_in.o
  CC      arch/riscv/setup.o
  LD      arch/riscv/built_in.o
  LD      prelink.o
  LDS     arch/riscv/xen.lds
riscv64-linux-gnu-ld      -T arch/riscv/xen.lds -N prelink.o \
    ./common/symbols-dummy.o -o ./.xen-syms.0
riscv64-linux-gnu-ld: prelink.o: in function `register_keyhandler':
/build/xen/common/keyhandler.c:106: undefined reference to
`guest_physmap_remove_page'
riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol
`guest_physmap_remove_page' isn't defined
riscv64-linux-gnu-ld: final link failed: bad value
make[2]: *** [arch/riscv/Makefile:15: xen-syms] Error 1
make[1]: *** [build.mk:90: xen] Error 2
make: *** [Makefile:610: xen] Error 2
user@3c393ef3b4c0:/build/xen$ find . -name \*.o | while read F; do nm $F
| grep guest_physmap_remove_page && echo $F; done
                 U guest_physmap_remove_page
./common/memory.o
                 U guest_physmap_remove_page
./common/built_in.o
                 U guest_physmap_remove_page
./prelink.o


despite the linker fingering keyhandler.c (very likely a toolchain bug),
it's memory.o which has the undefined reference.

Looking at memory.i, there are calls in guest_remove_page(),
memory_exchange(), and do_memory_op(), and no obvious way to DCE any of
them.

However, with bookworm, while memory.i does still have the same calls,
the resulting object file has no undefined references, so clearly
something has DCE'd them.


Looking at both memory.o's, bookwork really does have no reference,
while bullseye's reference is in memory_exchange().

So I guess there is something complicated there which bookworm can DCE
but bullseye can't.

Either way, this is the right fix, so lets not worry any more.

~Andrew

