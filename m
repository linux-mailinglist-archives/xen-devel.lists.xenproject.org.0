Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00E6A56DF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 11:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503228.775430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxL7-0006W2-2w; Tue, 28 Feb 2023 10:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503228.775430; Tue, 28 Feb 2023 10:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxL7-0006UK-0H; Tue, 28 Feb 2023 10:36:09 +0000
Received: by outflank-mailman (input) for mailman id 503228;
 Tue, 28 Feb 2023 10:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iFD=6Y=tibco.com=clindig@srs-se1.protection.inumbo.net>)
 id 1pWxL4-0006UB-RD
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 10:36:06 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2d48e1f-b753-11ed-9693-2f268f93b82a;
 Tue, 28 Feb 2023 11:36:03 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id az36so6072119wmb.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 02:36:02 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z14-20020a05600c220e00b003e11f280b8bsm15403749wml.44.2023.02.28.02.36.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Feb 2023 02:36:01 -0800 (PST)
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
X-Inumbo-ID: b2d48e1f-b753-11ed-9693-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGLeblcmBGk6y9bwTMPY/mk+Czph7mN7rCy0DyVYDaE=;
        b=i03uKIFbFYWJvXc2k4z/o10JO/BiIoq6vgfPGXO6QVcGD/MVt91WalMRNj3HVlThRL
         ijNhvJfGhihKdF/gUkBKU5c23zCcab5v31ZWfuYl2ekCCWx78VSsg/SmF/dP645usu/Q
         QrMNNUvstfBRtCW2A24YiHbjohs5+o66y32UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGLeblcmBGk6y9bwTMPY/mk+Czph7mN7rCy0DyVYDaE=;
        b=VssJLxKzo/N+baJFmsAFxcjuuhisJ3Fey1xJjn2KB3Sr5w+KFL4swTCjpQ6/dxdRxZ
         tOzEjjuvpXT7liPBs0xy+oY8bwGc1i9vIUr8HG+PnNFD3H0h/YHm0sakG/awoHzpfwzY
         LqZ1wyUqxwtwS9/FJTS9c3RWf0NTbn3ZmwBTXGTaM3vOFBIJkprOzyLgKE/FXtiThz+Z
         oGFE+vLh82ndzABTyGTMV2sDqWrRorT3HvhAsmXYx40Heg55LWUnAhp2CkVLAtwzqdHZ
         v0BIFSX6Mn/t5nIAKYAABRYdgl3sufRKLpseaui+L0Q61bIB1NDSHrsmTc44mG1OpIMP
         wcGg==
X-Gm-Message-State: AO0yUKWfhdgUfRVAfCxDbRv1S3QVi4aOWirPHCRiZ+x3kiu8Sq1uDZ7G
	/vNUJXeNHUZSFGbHXp3NEyTuyQ==
X-Google-Smtp-Source: AK7set/++YXjnoLEdpNkP63TFAJbWOuJARn1sXAItRDt640/wHjWUMN/85rQox53hLw1g41p/05VJg==
X-Received: by 2002:a05:600c:1652:b0:3eb:399d:ab18 with SMTP id o18-20020a05600c165200b003eb399dab18mr1682758wmn.35.1677580562277;
        Tue, 28 Feb 2023 02:36:02 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 0/4] tools: use xen-tools/libs.h for common definitions
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20230227154153.31080-1-jgross@suse.com>
Date: Tue, 28 Feb 2023 10:36:00 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
Content-Transfer-Encoding: 7bit
Message-Id: <D0EEECEC-1BBB-4723-80B7-2D12769F29FC@cloud.com>
References: <20230227154153.31080-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)



> On 27 Feb 2023, at 15:41, Juergen Gross <jgross@suse.com> wrote:
> 
> There are some macros defined multiple times in tools. Use only
> a single header file for defining those macros and drop the copies.
> 
> V2:
> - add patch 1 (Andrew Cooper)
> 
> Juergen Gross (4):
>  tools: rename xen-tools/libs.h file to common-macros.h
>  tools: add container_of() macro to xen-tools/common-macros.h
>  tools: get rid of additional min() and max() definitions
>  tools: add offsetof() to xen-tools/common-macros.h
> 
> tools/console/daemon/io.c                     |  2 +-
> tools/firmware/hvmloader/util.h               | 11 ++--------
> tools/firmware/include/stddef.h               |  4 ++--
> tools/fuzz/cpu-policy/afl-policy-fuzzer.c     |  2 +-
> .../xen-tools/{libs.h => common-macros.h}     | 22 ++++++++++++++++---
> tools/libfsimage/Rules.mk                     |  2 ++
> tools/libfsimage/xfs/fsys_xfs.c               |  4 +---
> tools/libs/call/buffer.c                      |  2 +-
> tools/libs/ctrl/xc_pm.c                       |  2 +-
> tools/libs/ctrl/xc_private.h                  |  2 +-
> tools/libs/foreignmemory/linux.c              |  2 +-
> tools/libs/gnttab/freebsd.c                   |  2 +-
> tools/libs/gnttab/linux.c                     |  2 +-
> tools/libs/guest/xg_core_arm.c                |  2 +-
> tools/libs/guest/xg_cpuid_x86.c               |  2 +-
> tools/libs/guest/xg_dom_arm.c                 |  2 +-
> tools/libs/guest/xg_dom_bzimageloader.c       |  2 +-
> tools/libs/guest/xg_dom_x86.c                 |  2 +-
> tools/libs/guest/xg_sr_common.c               |  2 +-
> tools/libs/light/libxl_internal.h             |  2 +-
> tools/libs/light/libxl_psr.c                  |  2 +-
> tools/libs/stat/xenstat_linux.c               |  2 +-
> tools/libs/vchan/init.c                       |  7 +-----
> tools/misc/xen-access.c                       |  2 +-
> tools/misc/xen-cpuid.c                        |  2 +-
> tools/misc/xen-diag.c                         |  2 +-
> tools/misc/xen-hptool.c                       |  2 +-
> tools/misc/xen-livepatch.c                    |  2 +-
> tools/misc/xen-mfndump.c                      |  2 +-
> tools/misc/xenpm.c                            |  2 +-
> tools/ocaml/libs/mmap/xenmmap_stubs.c         |  2 +-
> tools/ocaml/libs/xc/xenctrl_stubs.c           |  2 +-
> tools/python/xen/lowlevel/xc/xc.c             |  2 +-
> tools/tests/cpu-policy/test-cpu-policy.c      |  2 +-
> .../paging-mempool/test-paging-mempool.c      |  2 +-
> tools/tests/resource/test-resource.c          |  2 +-
> tools/tests/tsx/test-tsx.c                    |  2 +-
> tools/tests/vhpet/emul.h                      | 16 +-------------
> tools/tests/vpci/emul.h                       | 22 +------------------
> tools/tests/x86_emulator/x86-emulate.h        |  7 +-----
> tools/tests/xenstore/test-xenstore.c          |  2 +-
> tools/xenstore/list.h                         |  6 ++---
> tools/xenstore/utils.h                        |  2 +-
> tools/xentrace/analyze.h                      |  2 +-
> tools/xl/xl_cmdtable.c                        |  2 +-
> xen/lib/x86/private.h                         |  2 +-
> 46 files changed, 68 insertions(+), 105 deletions(-)
> rename tools/include/xen-tools/{libs.h => common-macros.h} (74%)
> 
> -- 
> 2.35.3
> 

Acked-by: Christian Lindig <christian.lindig@cloud.com>



