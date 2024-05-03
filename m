Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AC38BB192
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 19:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716621.1118757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2wVI-0004bP-Gi; Fri, 03 May 2024 17:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716621.1118757; Fri, 03 May 2024 17:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2wVI-0004ZE-EC; Fri, 03 May 2024 17:15:24 +0000
Received: by outflank-mailman (input) for mailman id 716621;
 Fri, 03 May 2024 17:15:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrlW=MG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s2wVG-0004Z8-S1
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 17:15:22 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8bfa968-0970-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 19:15:22 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-792639cf4faso271558085a.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 10:15:21 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 bp10-20020a05620a458a00b00790f7c28019sm1392913qkb.83.2024.05.03.10.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 10:15:20 -0700 (PDT)
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
X-Inumbo-ID: b8bfa968-0970-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714756520; x=1715361320; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nHhDPQFODDTSRPzwFDqZrnLgjpslzU8jT3iE1YAlVrg=;
        b=A/0qTA8ged8P3qVzYxwpKF8S7e8jj4xyUBX3NVpaeIfe5uzqTEyHWobTCDRaCSe6tN
         jtCrPJcibth6OM/e9/Gzrb2RgS+WWt8aqAs+ffoTwnbVXJ8ypbpQSl+2vHnqUprSMhNc
         Y0eCgHyPfsondVYDZWkvu649rV6mL5C/7AZlqhGsG4jLUzBZsZnnCZU4jbhDgEOPcFE5
         qU3r8Opn0o4dKeVDKVH0PVEZ+inbXYScGdby2wNSvJZmCPuj3OJ+PvuI1++lShOPkUC6
         m+nvgWsTaF+eIjGBmn+lF1l7FcPm95fOJ/+psd27UQPSci8aPt26nhY9pM4lypmBsKet
         s+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714756520; x=1715361320;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHhDPQFODDTSRPzwFDqZrnLgjpslzU8jT3iE1YAlVrg=;
        b=aXs6aMDRFIWcQWilZsxV/fQEHTPs+ECMyy+djzhLqR05+5Ef7eYWsM8XGgW95bh7rW
         1TfOUZGSAz5Edy462mInDdBQoTyTwyf2PmW3Tk0eNf4syUSLcXWq5iLZkpAMTKj3kRUV
         oH5Q0BfEB4EFJTtpMRp9S76aot7mewNWYM4ATDShtF2lAIM+rxTeho3YNTRmn3nT7lWR
         tpt1foZBUhxn2s/iiDqK0Uu23ZutmZePxPJQXehH4wT3lSekmdbn4hjUU6/2buXQC+WO
         J5V3RC4mOoWxgg3ARhB7eGxBxzYshu3u/W32Wh2o2OCqBE00uY/WpkM03LCjCCs5R+NS
         BUWg==
X-Forwarded-Encrypted: i=1; AJvYcCVpjlOiGQn0nrT3Sk1JnbKhJeqEjgGMf7WhD5ot2pfSMhr6ugD6377WvB/aq0vCjfd4Cx9TuyvKR9wV80UhpxDu3JRmnMEyZ0THWWY+5D4=
X-Gm-Message-State: AOJu0Ywf9s5ulDUAug0is09nXIueal1fLy7Yk6RKFOfSPOTl8qbsyQxu
	+KmMmDl/dZDiZOFHoSrRoE9/d26DI8K/K+VcaNxahR8Lo8sxGIoF
X-Google-Smtp-Source: AGHT+IHgB1ff01//xX1SHLUX6dnh+sR6UhOUAYbvSHppPFKINWQXkW2DrdL8DfuFC1M5nIGHpMC1hA==
X-Received: by 2002:a05:620a:40c3:b0:790:9688:4450 with SMTP id g3-20020a05620a40c300b0079096884450mr3736814qko.53.1714756520585;
        Fri, 03 May 2024 10:15:20 -0700 (PDT)
Message-ID: <940f11ee23b43ada1dba50bc0236c4764eb13d71.camel@gmail.com>
Subject: Re: [PATCH v8 02/17] xen: introduce generic non-atomic test_*bit()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,  Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Date: Fri, 03 May 2024 19:15:16 +0200
In-Reply-To: <3827c11c-6d47-411d-a356-871def4e5b30@suse.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
	 <1a0977e3cf5a2de9f760ca5ec89a0d096894a9e3.1713347222.git.oleksii.kurochko@gmail.com>
	 <3827c11c-6d47-411d-a356-871def4e5b30@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-25 at 17:35 +0200, Jan Beulich wrote:
> > =C2=A0 #include <asm/bitops.h>
> > =C2=A0=20
> > +#ifndef arch_check_bitop_size
> > +#define arch_check_bitop_size(addr)
>=20
> Can this really do nothing? Passing the address of an object smaller
> than
> bitop_uint_t will read past the object in the generic__*_bit()
> functions.
It seems RISC-V isn' happy with the following generic definition:
   extern void __bitop_bad_size(void);
  =20
   /* --------------------- Please tidy above here --------------------
   - */
  =20
   #include <asm/bitops.h>
  =20
   #ifndef arch_check_bitop_size
  =20
   #define bitop_bad_size(addr) sizeof(*(addr)) < sizeof(bitop_uint_t)
  =20
   #define arch_check_bitop_size(addr) \
       if ( bitop_bad_size(addr) ) __bitop_bad_size();
  =20
   #endif /* arch_check_bitop_size */

The following errors occurs. bitop_uint_t for RISC-V is defined as
unsigned long for now:
    ./common/symbols-dummy.o -o ./.xen-syms.0
riscv64-linux-gnu-ld: prelink.o: in function `atomic_sub':
/build/xen/./arch/riscv/include/asm/atomic.h:152: undefined reference
to `__bitop_bad_size'
riscv64-linux-gnu-ld: prelink.o: in function `evtchn_check_pollers':
/build/xen/common/event_channel.c:1531: undefined reference to
`__bitop_bad_size'
riscv64-linux-gnu-ld: /build/xen/common/event_channel.c:1521: undefined
reference to `__bitop_bad_size'
riscv64-linux-gnu-ld: prelink.o: in function `evtchn_init':
/build/xen/common/event_channel.c:1541: undefined reference to
`__bitop_bad_size'
riscv64-linux-gnu-ld: prelink.o: in function `_read_lock':
/build/xen/./include/xen/rwlock.h:94: undefined reference to
`__bitop_bad_size'
riscv64-linux-gnu-ld:
prelink.o:/build/xen/./arch/riscv/include/asm/atomic.h:195: more
undefined references to `__bitop_bad_size' follow
riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `__bitop_bad_size'
isn't defined
riscv64-linux-gnu-ld: final link failed: bad value
make[2]: *** [arch/riscv/Makefile:15: xen-syms] Error 1

~ Oleksii

