Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44B5A9D8FA
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 09:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968970.1358350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Zwb-00073L-1w; Sat, 26 Apr 2025 07:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968970.1358350; Sat, 26 Apr 2025 07:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Zwa-00071l-Ui; Sat, 26 Apr 2025 07:27:24 +0000
Received: by outflank-mailman (input) for mailman id 968970;
 Sat, 26 Apr 2025 07:27:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ssvg=XM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u8ZwY-00071f-IN
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 07:27:23 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e37b38f8-226f-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 09:27:20 +0200 (CEST)
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
X-Inumbo-ID: e37b38f8-226f-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745652438; x=1745911638;
	bh=VjAyQNIjtxK99AxpiwiswOvxpQEu4dQDUxS4qpU493s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=NTip1YwnTSs2DsekIYBYWGWs0S+GGXzxbETrFJ4lSOk2JEe44D8/6v9pGZ1T3pDQD
	 uTE7kaVkcpCK+i8JAr1wkT9LHRkciZ1xYPGjKcLNOdEGLkYR8/wdcJnp59neJg1b2X
	 FgA7qp6N295ORbrTlJ8mHt7g+gXK5zRPKZYOhgyOyTY6ICJeqyDD8qsWfXkV7hUTqD
	 SBbWLxDgv1T274oEsMIJYHpPaxlazz0T8kl5iUEITdwJULyqF14d5panXkBrK2Ux95
	 ZNgvDu9wQWoOIKwrFRHL0BgQTayxFP5vSbyWRKxZvkAWfSJWwYUcffjNkTlFvnFilx
	 Ot+gtktbb7RBg==
Date: Sat, 26 Apr 2025 07:27:12 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: [PATCH v4 0/3] x86/vmx: Update __vmread()
Message-ID: <20250426072656.39259-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8f0626220fdd2a9a758cd9019b9e1a281d9e25fa
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series reworks __vmread() by introducing a new cleaner API.

Patch 1 introduces a new vmread() call which will be a replacement for
__vmcall().
Patch 2 updates the type of arch_vcpu->dr7 field.
Patch 3 replaces __vmread() with vmread().

Link to v3: https://lore.kernel.org/xen-devel/20250422215833.522007-1-dmukh=
in@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
787132005

Denis Mukhin (3):
  x86/vmx: Introduce vmread()
  x86/vmx: Update arch_vcpu->dr7 type
  x86/vmx: Replace __vmread() with vmread()

 docs/misra/function-macro-properties.json |   9 -
 xen/arch/x86/cpu/vpmu_intel.c             |   3 +-
 xen/arch/x86/hvm/vmx/intr.c               |  26 +--
 xen/arch/x86/hvm/vmx/realmode.c           |   2 +-
 xen/arch/x86/hvm/vmx/vmcs.c               |  11 +-
 xen/arch/x86/hvm/vmx/vmx.c                | 210 ++++++++++------------
 xen/arch/x86/hvm/vmx/vvmx.c               |  43 ++---
 xen/arch/x86/include/asm/domain.h         |   2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h    |  19 +-
 9 files changed, 134 insertions(+), 191 deletions(-)

--=20
2.34.1



