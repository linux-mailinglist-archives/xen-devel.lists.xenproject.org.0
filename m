Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719FCA784A4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 00:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934827.1336398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjz2-00082n-5u; Tue, 01 Apr 2025 22:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934827.1336398; Tue, 01 Apr 2025 22:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzjz2-00081C-2p; Tue, 01 Apr 2025 22:21:24 +0000
Received: by outflank-mailman (input) for mailman id 934827;
 Tue, 01 Apr 2025 22:21:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dnoa=WT=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzjz0-00080l-1U
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 22:21:22 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1f84a50-0f47-11f0-9ea7-5ba50f476ded;
 Wed, 02 Apr 2025 00:21:18 +0200 (CEST)
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
X-Inumbo-ID: a1f84a50-0f47-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743546077; x=1743805277;
	bh=Lhn4iGVYb8AgrXKdQUot5TI32r7opNEUpEbCe5WqAfo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=KLlrjlAfgFKTaG3xdTWg6/QGG9hq2qJzpV85jTwVght4CZGF3l6qlYYiv7/ilqWtu
	 LRsrLjSygljWBE39ix5edHn+q/y1GH1/I8eyYVEZf1rp/EmesGghc+fi6O4rgGm+Nn
	 WMjl0fDS4TbUY3lQGS7iNZkIumZ0UR06FFDsHQszEP4qBF4HYQxvXFUb5BWxuiJGno
	 kwKv82guKrDI8zNwgiLSKLKEjvxcDXvGG0ljshbFYD0As4GQ6BF9jaPvOlxue+I92b
	 0qub0aHN2svngXUt2KKtM/O3QrH13Wnn9lTZ1VP8Rk01eeozBc+FUFdGNWzBQomeNj
	 Z+Fg8QRZz+bFg==
Date: Tue, 01 Apr 2025 22:21:12 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 0/5] x86/asm: cleanups after toolchain baseline upgrade
Message-ID: <20250401222105.79309-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b874dd11891ee74d839c329dc52cf9654f21a126
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patches 1-4 remove various compiler workarounds in the hypervisor code
for Intel's VMX instructions.

Patch 5 removes compiler workaround for missing clac/stac instructions.

CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/174739487=
5

Denis Mukhin (5):
  x86/vmx: remove HAVE_AS_VMX
  x86/vmx: remove HAVE_AS_EPT
  x86/vmx: remove GAS_VMX_OP()
  x86/vmx: remove *_OPCODE
  x86/asm: remove HAVE_AS_CLAC_STAC

 xen/arch/x86/arch.mk                   |   5 +-
 xen/arch/x86/include/asm/asm-defns.h   |  10 ---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 103 ++++---------------------
 3 files changed, 15 insertions(+), 103 deletions(-)

--=20
2.34.1



