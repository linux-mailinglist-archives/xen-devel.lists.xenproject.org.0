Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B7B19845B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 21:25:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIzz6-0005wi-Sr; Mon, 30 Mar 2020 19:22:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZrn=5P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jIzz5-0005wd-MT
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 19:22:07 +0000
X-Inumbo-ID: bea8bcda-72bb-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bea8bcda-72bb-11ea-b58d-bc764e2007e4;
 Mon, 30 Mar 2020 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/m5rkw09wMZM91lGWjJGpITVIPpD1zajgSv5FMfTHw0=; b=mZNZwvUJNcBL7kPQwGhBqm0MEQ
 QcNgESO55RktRMSkC4r6DFkxCZJP7HchDJ4xUSpRRjyRgiI9/50A6vu8VyblAB8Qt8dC9lIHttorL
 brugraKjoG1SeuYHuEm8PoRC0r8x4oMAFSj3Hxuzgj627UOvSdqolw1ctaaBwZOAKfpA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzz4-0003kw-3E; Mon, 30 Mar 2020 19:22:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jIzz3-0007AJ-Jn; Mon, 30 Mar 2020 19:22:06 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 20:21:49 +0100
Message-Id: <20200330192157.1335-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH 0/8] Fix build with using OCaml 4.06.1 and
 -safe-string
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, dfaggioli@suse.com,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

This series is meant to solve the build issue reported by Dario when
using recent version of OCaml and -safe-string.

I took the opportunity to harden a bit more the code by using const more
often.

This series was only build tested.

Cheers,

Julien Grall (8):
  xen/guest_access: Harden copy_to_guest_offset to prevent const dest
    operand
  xen/public: sysctl: set_parameter.params and debug.keys should be
    const
  tools/libxc: misc: Mark const the parameter 'keys' of
    xc_send_debug_keys()
  tools/libxc: misc: Mark const the parameter 'params' of
    xc_set_parameters()
  tools/ocaml: libxc: Check error return in stub_xc_vcpu_context_get()
  tools/ocaml: libxb: Harden stub_header_of_string()
  tools/ocaml: libxb: Avoid to use String_val() when value is bytes
  tools/ocaml: Fix stubs build when OCaml has been compiled with
    -safe-string

 tools/libxc/include/xenctrl.h       |  4 ++--
 tools/libxc/xc_misc.c               |  8 ++++----
 tools/libxc/xc_private.h            |  8 ++++++++
 tools/ocaml/libs/xb/xenbus_stubs.c  |  6 +++---
 tools/ocaml/libs/xb/xs_ring_stubs.c | 12 ++++++++++--
 tools/ocaml/libs/xc/xenctrl_stubs.c |  6 ++++--
 xen/include/asm-arm/guest_access.h  |  2 +-
 xen/include/asm-x86/guest_access.h  |  2 +-
 xen/include/public/sysctl.h         |  4 ++--
 9 files changed, 35 insertions(+), 17 deletions(-)

-- 
2.17.1


