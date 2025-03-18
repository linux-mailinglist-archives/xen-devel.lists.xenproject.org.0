Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53301A677BA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:27:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919295.1323787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYqW-0007CW-23; Tue, 18 Mar 2025 15:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919295.1323787; Tue, 18 Mar 2025 15:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYqV-0007Am-V2; Tue, 18 Mar 2025 15:27:11 +0000
Received: by outflank-mailman (input) for mailman id 919295;
 Tue, 18 Mar 2025 15:27:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuYqU-0006hR-A5
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:27:10 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7405365d-040d-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 16:27:08 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-224191d92e4so112096405ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:27:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c688d93esm95937325ad.45.2025.03.18.08.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 08:27:06 -0700 (PDT)
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
X-Inumbo-ID: 7405365d-040d-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742311627; x=1742916427; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJ6VyVQw4jQLkgbiXbLciWLfPDn0WLXXenO0I4c1t5Q=;
        b=erScnGB2VDu0Rx1f1J8pacy9VtJwaZzeyuphfS2avyZFajvEWrBkgPQJhZf0O5sCf+
         vzANLG5sI0AJseWEQNEl+LTlLa4nlUDc5pOx7Ir4QcJFPdjb69mo6I6ijAQ7Meb/vmnL
         GWWWvYRmv/ofYCKHkYXd364VOu3/JtMF/28Pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311627; x=1742916427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ6VyVQw4jQLkgbiXbLciWLfPDn0WLXXenO0I4c1t5Q=;
        b=pkzcoV4MqkKVz9aNXGc5uhbyKbkDrp01clKDjyceT3Fd6Rzz2wteoWDdHzouap1AGM
         3umFYjkl4wikUnfvzxa+e66I6Ct1Bj6Rw35hibDAKA0zjr0z9rmHot9CUKUXVCVKo8si
         p2+nUAMHtrsKbdvAP98emPSPAYwGWbnLPkEh8ne0j4+DZYX0ezq6bdHLEoho0XqDLdRk
         VFS+PCIH1dlCyZk/4LczkVfVFa4vXycDU3pU8mEwmbtu8qIg+7pOZRjq6sgx75k/2Bpy
         CQw1F8+pro+gdRUNzI7DR4wbs7KURLhkPjm35hgZGLJSd0+DGHCJscgyGq3RwCYTXxwc
         UKWQ==
X-Gm-Message-State: AOJu0YzPjQFZcMrohu5NlW1B1htI8yNShu6aytW+ykHNZyNo2SSlsF2i
	MUsKHJq/58u/AclQZRHMrMD2JaG7zJZMo7VVvYjCrFDGq1mjNSqrtTpChtNV95UtYGBOlOnE4Uf
	U
X-Gm-Gg: ASbGncuRCJ3D5yz0OIext+90X+nx+gGigM0MoTQSVE9JYOV60k2CmIv4NF10wFNd5tB
	NufXNd5iK2u/Ws3jOSPCu3UrzUU3p+DimA7RcW3aKmQIi+JMAFflOwnJPobKhQ0jR4vtvn4xrzB
	x7isGZm7djrKwpczjcsGywISZdx/litx14iYCA6VH50A/USNuoS/wpgDULGVp5vIO2GBzNQ1Ptf
	7+bE/YP4VjH+kS4I4iXzKvTkr+w/QjqzrOSCzgxWbrzqv7/75p7sqyn4bdNvRHJVqL4d+GFxeOd
	gewTlFNxA9iap33OOaUiJwWgSBtTeo5DXO39QzA68OUIxpr4TAlvox0=
X-Google-Smtp-Source: AGHT+IFrVX/WguRRwJky7f02MgAHudVpfmuJ7ETVocjdiWWTelon1KG8LogbyTuUEWGLkxdOQTPY1A==
X-Received: by 2002:a17:903:2f86:b0:224:93e:b5d7 with SMTP id d9443c01a7336-225e0afa057mr249557815ad.34.1742311626955;
        Tue, 18 Mar 2025 08:27:06 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:27:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v2 4/5] x86/shadow: fix UB pointer arithmetic in
 sh_mfn_is_a_page_table()
Message-ID: <Z9mQxW04yGdxGjko@macbook.local>
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-5-roger.pau@citrix.com>
 <1871a0ff-5766-4707-8791-c20279c12fd9@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1871a0ff-5766-4707-8791-c20279c12fd9@citrix.com>

On Tue, Mar 18, 2025 at 12:53:30PM +0000, Andrew Cooper wrote:
> On 18/03/2025 9:19 am, Roger Pau Monne wrote:
> > UBSAN complains with:
> >
> > UBSAN: Undefined behaviour in arch/x86/mm/shadow/private.h:515:30
> > pointer operation overflowed ffff82e000000000 to ffff82dfffffffe0
> > [...]
> > Xen call trace:
> >    [<ffff82d040303882>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xc0
> >    [<ffff82d040304cc3>] F lib/xxhash64.c#__ubsan_handle_pointer_overflow+0xcb/0x100
> >    [<ffff82d040471c5d>] F arch/x86/mm/shadow/guest_2.c#sh_page_fault__guest_2+0x1e350
> >    [<ffff82d0403b216b>] F lib/xxhash64.c#svm_vmexit_handler+0xdf3/0x2450
> >    [<ffff82d0402049c0>] F lib/xxhash64.c#svm_stgi_label+0x5/0x15
> 
> Something is definitely wonky in this backtrace.

Oh, yes, it's a TODO I have pending when using LLVM LD.  I sent a fix
very long time ago, but it was quite ugly.

> >
> > Fix by moving the call to mfn_to_page() after the check of whether the
> > passed gmfn is valid.  This avoid the call to mfn_to_page() with an
> > INVALID_MFN parameter.
> >
> > While there make the page local variable const, it's not modified by the
> > function.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Whatever is wonky in the backtrace isn't related to this patch, so
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but the backtrace
> does want fixing.

I can get the proper backtrace using clang + GNU LD.

Thanks, Roger.

