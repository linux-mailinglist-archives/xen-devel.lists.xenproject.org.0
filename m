Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736F82E9584
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 14:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61174.107392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPXH-000795-BN; Mon, 04 Jan 2021 13:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61174.107392; Mon, 04 Jan 2021 13:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPXH-00078g-7z; Mon, 04 Jan 2021 13:04:35 +0000
Received: by outflank-mailman (input) for mailman id 61174;
 Mon, 04 Jan 2021 13:04:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rg9=GH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwPXF-00078b-WC
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 13:04:34 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5aa65db0-209e-4c8a-a25c-58123592809d;
 Mon, 04 Jan 2021 13:04:32 +0000 (UTC)
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
X-Inumbo-ID: 5aa65db0-209e-4c8a-a25c-58123592809d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609765472;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=CND6jxnJaYJv5nt2FSw1L9xfW1pSToBJX9byiRnGst4=;
  b=D+zJj6hbvHSyxUAsxrOVi3xae5kyAYfK1UGQU3WSv+/Cr2a0VUtGOqwx
   FOS7gQggg0W2voewkvyILhmqp2Kl//txRDJnkB1ASgmR+Voc1GLvy8rBO
   Rur6obsgzROaJN87f4v5NznDCuK/KCnlGDPqJn63VoYhI1gtCq1jdISot
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cxRPBf6yUiLaslgfwlA1emDKk2PbaHa7wOMglopootDNRF776uPwBOTJ4pQA1/GBxVZ4EeGX0d
 JZaMjnbRFiGfRoLabtrsSG76votc2wrE4yujRumyuXPnikD6Ykek/0Vf7fCY90QN2gwtfsJ9Su
 TX+/qxByGy6Q1SocZP7nmqBT/vpg9mkqDxXy84p9VUobc7XQkzvmo/yH2t+4kLLoCSq/cgI7/v
 0fCIhQpaXzlNnu2U4mG3KoOCqh0NxbKdKOLWv57K4n/WeFMg8c2mdm1EZPe1REn6YLvusp4mZG
 yR8=
X-SBRS: 5.2
X-MesageID: 34334461
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="34334461"
Subject: Re: [PATCH] x86/monitor: add option to disable Xen's pagetable
 walking on events
To: Tamas K Lengyel <tamas@tklengyel.com>, <xen-devel@lists.xenproject.org>
CC: Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <992f16e8331363f4bc1eef49763810948ad5fff2.1609700210.git.tamas@tklengyel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fb8bea63-665e-f230-ef39-25f53c8ba0be@citrix.com>
Date: Mon, 4 Jan 2021 13:04:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <992f16e8331363f4bc1eef49763810948ad5fff2.1609700210.git.tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 03/01/2021 19:01, Tamas K Lengyel wrote:
> Add option to the monitor interface to disable walking of the guest pagetable
> on certain events. This is a performance optimization for tools that never
> require that information or prefer to do it themselves. For example LibVMI
> maintains a virtual TLB which is faster to lookup then what Xen does here.

There is no plausible way that a remote agent can do this (correctly)
faster than Xen can.  Even if you foreign map the entire VM up front,
and track every PTE write (to maintain the vTLB properly), the best you
can achieve is the same speed as Xen, but that would also require
intercepting the TLB management instructions which isn't available in
the monitor API.

Also, there is an important side effect of setting A/D bits which libVMI
doesn't handle, but is relevant for gla-not-valid faults.


I accept that "not doing things the agent doesn't care about" is a valid
reason, but this isn't the only place where a pagewalk occurs, and some
cases require pagewalks before we can even generate the event (e.g. LMSW
on AMD for CR0 monitoring).

As such, I don't think "disable pagewalks" is something we can actually
do.  Wouldn't it be better to call this "auto translate rip to gfn" or
similar, seeing as it is ancillary information?

~Andrew

