Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E59BCF75
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830256.1245198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kcz-0002My-DI; Tue, 05 Nov 2024 14:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830256.1245198; Tue, 05 Nov 2024 14:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kcz-0002KB-9w; Tue, 05 Nov 2024 14:33:53 +0000
Received: by outflank-mailman (input) for mailman id 830256;
 Tue, 05 Nov 2024 14:33:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8Kcy-0002K5-0Y
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:33:52 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f81c082d-9b82-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 15:33:48 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cec93719ccso4195304a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:33:48 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:33:47 -0800 (PST)
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
X-Inumbo-ID: f81c082d-9b82-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY4MWMwODJkLTliODItMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE3MjI4LjUxMDQzNiwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817227; x=1731422027; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7UehNmm+XdMyNc78IVmVaRzHkpGfHOcJ6pojHJUSgnA=;
        b=PGcRZXijf/q58e+OMP0ktAIGFmpCrFqhhHnhFFo6VrgH2DZ1N4zRGZt4z3uH4aub4O
         HEq3QxXiamLF5f5+LhJWskLTBaKOLIewVU3eae8DuXgSjdhdVGnlovv3F0HbRPinVq7G
         nOBIqVNNND0HkAEKNOlaI18pxBjGQmS1cjQ2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817227; x=1731422027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7UehNmm+XdMyNc78IVmVaRzHkpGfHOcJ6pojHJUSgnA=;
        b=mFqIsmlajXb8RnNX0XuCFjAdGXAgCXIKl+ZpPTnapLnavUZdDw+3aJDTbreNIbthCE
         Scr9Zon7V+JpAYFd0bBHgmkawEKY4y6KgQrcpYEnFl+38uBYGwZrdwFH1zpGvR6p8v0H
         1kZG5ky0VOAK12Wb29u4PX3R55bzkZIANBI42orCq2+yZlk9wzAy06SNqumjoLS+eXDE
         nTMFZdu+vlhh0KuC//K+dNk7QMLWA3Ke2VGmUjt8VsbliN0CS8Vbv3P9MPRAChGUIKK0
         SX7sEDsgV2WFyPN//ni2NxCreoJi+JsvykDjAImVG2OVzT1T2I10tbyknz4tajbvJDyz
         aUCQ==
X-Gm-Message-State: AOJu0Yzbn0heEN49sA3DEfH18tR2Pv5JxFRz1bTGZRPok6yYlpJNtwsi
	sPGEluTELtJd7V7upZbPm8BCpc2xTFTgwZ0zxmNZZ70W0cyEOIGS59J2yQVk/RplCwJbi86Lzcn
	M
X-Google-Smtp-Source: AGHT+IHRAXhExBAO/U3fsvaErEEcsSJeIZdCTocSxGxbccyQTKSg4S40Tvkucw4KZC9SbAfPGXPUkg==
X-Received: by 2002:a05:6402:524c:b0:5ce:d6db:23fa with SMTP id 4fb4d7f45d1cf-5ced6db245dmr6042455a12.20.1730817227479;
        Tue, 05 Nov 2024 06:33:47 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 00/13] x86: Address Space Isolation FPU preparations
Date: Tue,  5 Nov 2024 14:32:57 +0000
Message-ID: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See original cover letter in v1

v1: https://lore.kernel.org/xen-devel/20241028154932.6797-1-alejandro.vallejo@cloud.com/
v1->v2:
  * Turned v1/patch1 into an assert removal
  * Dropped v1/patch11: "x86/mpx: Adjust read_bndcfgu() to clean after itself"
  * Other minor changes out of feedback. Explained in each patch.

Alejandro Vallejo (13):
  x86/xstate: Remove stale assertions in fpu_x{rstor,save}()
  x86/xstate: Create map/unmap primitives for xsave areas
  x86/hvm: Map/unmap xsave area in hvm_save_cpu_ctxt()
  x86/fpu: Map/umap xsave area in vcpu_{reset,setup}_fpu()
  x86/xstate: Map/unmap xsave area in xstate_set_init() and
    handle_setbv()
  x86/hvm: Map/unmap xsave area in hvmemul_{get,put}_fpu()
  x86/domctl: Map/unmap xsave area in arch_get_info_guest()
  x86/xstate: Map/unmap xsave area in {compress,expand}_xsave_states()
  x86/emulator: Refactor FXSAVE_AREA to use wrappers
  x86/mpx: Map/unmap xsave area in in read_bndcfgu()
  x86/fpu: Pass explicit xsave areas to fpu_(f)xsave()
  x86/fpu: Pass explicit xsave areas to fpu_(f)xrstor()
  x86/xstate: Make xstate_all() and vcpu_xsave_mask() take explicit
    xstate

 xen/arch/x86/domctl.c             |  9 +++--
 xen/arch/x86/hvm/emulate.c        | 12 +++++-
 xen/arch/x86/hvm/hvm.c            |  8 ++--
 xen/arch/x86/i387.c               | 65 +++++++++++++++++++------------
 xen/arch/x86/include/asm/xstate.h | 51 ++++++++++++++++++++++--
 xen/arch/x86/x86_emulate/blk.c    | 11 +++++-
 xen/arch/x86/xstate.c             | 47 +++++++++++++++-------
 7 files changed, 150 insertions(+), 53 deletions(-)

-- 
2.47.0


