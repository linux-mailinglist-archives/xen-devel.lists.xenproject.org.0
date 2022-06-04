Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318D353D648
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jun 2022 11:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341825.567023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxQKd-0000HL-MZ; Sat, 04 Jun 2022 09:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341825.567023; Sat, 04 Jun 2022 09:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxQKd-0000Er-JH; Sat, 04 Jun 2022 09:44:31 +0000
Received: by outflank-mailman (input) for mailman id 341825;
 Sat, 04 Jun 2022 09:44:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aAYa=WL=tls.msk.ru=mjt@srs-se1.protection.inumbo.net>)
 id 1nxQKc-0000ES-NS
 for xen-devel@lists.xenproject.org; Sat, 04 Jun 2022 09:44:30 +0000
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed6b9807-e3ea-11ec-bd2c-47488cf2e6aa;
 Sat, 04 Jun 2022 11:44:29 +0200 (CEST)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0FE9C4012A;
 Sat,  4 Jun 2022 12:44:28 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6BE352A;
 Sat,  4 Jun 2022 12:44:27 +0300 (MSK)
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
X-Inumbo-ID: ed6b9807-e3ea-11ec-bd2c-47488cf2e6aa
Message-ID: <0dd3627b-8f4c-93fd-89e7-3c8c3584994b@msgid.tls.msk.ru>
Date: Sat, 4 Jun 2022 12:44:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: q: incorrect register emulation mask for Xen PCI passthrough?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

There's a debian bugreport open - now against qemu - https://bugs.debian.org/988333 -
which initially said VGA Intel IGD Passthrough to Debian Xen HVM DomUs not working
but worked okay with windows DomUs.

The most interesting comment in there is the last one, https://bugs.debian.org/988333#146 ,
which sums it all up and provides a patch for the issue, at
https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/pull/3/commits/ab2b4c2ad02827a73c52ba561e9a921cc4bb227c
which is from 2017 (!).

I wonder if we should apply this one upstream, or if it is somehow incorrect
fix, should fix this particular issue the right way.  It's 5 years old already
and people are still suffering... :)

Thanks,

/mjt

