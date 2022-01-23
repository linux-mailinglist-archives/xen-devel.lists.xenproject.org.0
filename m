Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66474975D0
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jan 2022 22:53:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259691.448155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBkmr-0005aP-FY; Sun, 23 Jan 2022 21:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259691.448155; Sun, 23 Jan 2022 21:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBkmr-0005XM-Ba; Sun, 23 Jan 2022 21:52:37 +0000
Received: by outflank-mailman (input) for mailman id 259691;
 Sun, 23 Jan 2022 21:52:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lPRm=SH=knorrie.org=hans@srs-se1.protection.inumbo.net>)
 id 1nBkmp-0005XG-Oo
 for xen-devel@lists.xenproject.org; Sun, 23 Jan 2022 21:52:35 +0000
Received: from syrinx.knorrie.org (syrinx.knorrie.org [82.94.188.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5268027-7c96-11ec-8fa7-f31e035a9116;
 Sun, 23 Jan 2022 22:52:33 +0100 (CET)
Received: from [IPV6:2a02:a213:2b80:4c00::12] (unknown
 [IPv6:2a02:a213:2b80:4c00::12])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by syrinx.knorrie.org (Postfix) with ESMTPSA id 64104610AF88B;
 Sun, 23 Jan 2022 22:52:33 +0100 (CET)
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
X-Inumbo-ID: c5268027-7c96-11ec-8fa7-f31e035a9116
Message-ID: <798c8459-7f28-c081-15bf-04ea94e8b711@knorrie.org>
Date: Sun, 23 Jan 2022 22:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
From: Hans van Kranenburg <hans@knorrie.org>
To: 1004269@bugs.debian.org, xen-devel <xen-devel@lists.xenproject.org>
References: <2a095341-a727-23d1-2dce-dd9caa72c920@knorrie.org>
Subject: Debian Bug#1004269: Linker segfault while building src:xen
In-Reply-To: <2a095341-a727-23d1-2dce-dd9caa72c920@knorrie.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(To both the Debian bug # and xen-devel list, reply-all is fine)
Hi Xen people,

I just filed a bug at Debian on the binutils package, because since the 
latest binutils package update (Debian 2.37.50.20220106-2), Xen (both 
4.14 and 4.16) fails to build with a segfault at the following point:

x86_64-linux-gnu-ld -mi386pep --subsystem=10 
--image-base=0xffff82d040000000 --stack=0,0 --heap=0,0 
--section-alignment=0x200000 --file-alignment=0x20 
--major-image-version=4 --minor-image-version=16 --major-os-version=2 
--minor-os-version=0 --major-subsystem-version=2 
--minor-subsystem-version=0 --no-insert-timestamp --build-id=sha1 -T 
efi.lds -N prelink.o 
/builds/xen-team/debian-xen/debian/output/source_dir/xen/common/symbols-dummy.o 
-b pe-x86-64 efi/buildid.o -o 
/builds/xen-team/debian-xen/debian/output/source_dir/xen/.xen.efi.0xffff82d040000000.0 
&& :
Segmentation fault (core dumped)

Full message and links to build logs etc are in the initial bug message, 
to be seen at https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1004269

We (Debian Xen Team) are awaiting response, but I thought to also let 
you know already.

* Does the above error 'ring a bell'?
* Can you maybe also reproduce this in a development environment with 
very latest binutils?
* Maybe someone has a useful comment for the Debian binutils maintainer 
about what's happening in this step of the build?
* Any suggestions about what we can do to help figure this out?
* We'll try to help debug, but will surely appreciate upstream help if 
things get too technical. It's simply the case that I did not have to 
look into a very similar issue before, so it's new.

Thanks!
Hans

