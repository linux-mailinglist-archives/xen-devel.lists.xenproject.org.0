Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F52C23CE2F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 20:20:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3O0X-0000Lk-RK; Wed, 05 Aug 2020 18:19:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CKEr=BP=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1k3O0W-0000Lf-Ez
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 18:19:20 +0000
X-Inumbo-ID: e040c6ea-82c3-4840-b2f7-3b12398c2c3b
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e040c6ea-82c3-4840-b2f7-3b12398c2c3b;
 Wed, 05 Aug 2020 18:19:18 +0000 (UTC)
Date: Wed, 05 Aug 2020 18:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1596651557;
 bh=RopEZN0t10O0rBRL8XhbCwmqHbm4O7b177x8ArVDv1o=;
 h=Date:To:From:Reply-To:Subject:From;
 b=n1nPO2Be0j5Jy2BdiXFW2EDhuuKmbVOaSAGwkUbiPTC9teGDojtZPg2eW/6N5GH7F
 Tf6lXMClnKoyaDawSMpJO1zscEnX6wnCnFFU4eeQotUqPMJ5iKH483ILgcQK6TwK1u
 S8z/fwhGlor9azpH++u2pGsJDcOfnStnCsBNPa14=
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Trammell Hudson <hudson@trmm.net>
Subject: EFI executable corruption when live patching is turned off
Message-ID: <3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When building xen from head with almost any combination of options, the res=
ulting xen.efi seems properly formed. When CONFIG_LIVEPATCH is turned off, =
however, the resulting xen.efi is corrupted in some way and binutils no lon=
ger wants to work with it:

~/build/xen-clean/xen$ git rev-parse HEAD
81fd0d3ca4b2cd309403c6e8da662c325dd35750
~/build/xen-clean/xen$ diff .config.orig .config
71,72c71
< CONFIG_LIVEPATCH=3Dy
< CONFIG_FAST_SYMBOL_LOOKUP=3Dy
---
> # CONFIG_LIVEPATCH is not set
105a105
> # CONFIG_COVERAGE is not set
~/build/xen-clean/xen$ objcopy xen-orig.efi test.efi
~/build/xen-clean/xen$ objcopy xen.efi test.efi
objcopy: test.efi: Data Directory size (1c) exceeds space left in section (=
18)
objcopy: test.efi: error copying private BFD data: file in wrong format
~/build/xen-clean/xen$ objcopy --version | head -1
GNU objcopy (GNU Binutils for Ubuntu) 2.34


I spent most of today unsuccessfully trying to figure out what was differen=
t between the builds (on multiple build host OS with different binutils), s=
o I'm hoping that perhaps someone else has seen this problem.

--
Trammell

