Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1690A702009
	for <lists+xen-devel@lfdr.de>; Sun, 14 May 2023 23:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534535.831648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyJbr-0000AB-Pt; Sun, 14 May 2023 21:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534535.831648; Sun, 14 May 2023 21:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyJbr-00007l-Mf; Sun, 14 May 2023 21:50:31 +0000
Received: by outflank-mailman (input) for mailman id 534535;
 Sun, 14 May 2023 21:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zp1L=BD=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1pyJbp-00007f-Bp
 for xen-devel@lists.xenproject.org; Sun, 14 May 2023 21:50:29 +0000
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 563365ce-f2a1-11ed-b229-6b7b168915f2;
 Sun, 14 May 2023 23:50:27 +0200 (CEST)
Received: from [177.189.3.227] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pyJaT-009SDU-MC; Sun, 14 May 2023 23:49:06 +0200
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
X-Inumbo-ID: 563365ce-f2a1-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zygIhDyV8ht+xJs1lmqnA3sy7ZHDhj2x5W8U9MyDTpM=; b=AtfoJ+yRkuDm9gCWovg7bgbFzv
	zvtG8omqD3Ee2e5vtlK1211bbhN7KzcG9ZOV/p9gXghTUS1HF9EaelwoM4SQo/b4sWNMb2wsJsVAh
	ryLGjfB/dL5jQW5LWnI6h4gq4lKj2LKWt1eQxsKNKi4CYTHPi2D+7G5csc6so1Mr3IZqjzYXfvDre
	Wa2IYRFjoBiG9xBoaM3MR/ceTkMFFWkX6SNnbTUn4IT7Xv2Ef1OD3QTBmf65tsdUdiBBhGBc7WMfJ
	YjLmEKzf9bN3ap+iE91yCmvTRvaupsrf+ACH5S2PsgkJyDm/ZJKotc9YiiD6FM6FqFSv7z1nQGLn3
	n3J6H6Qw==;
Message-ID: <b4733705-7014-49c6-57ab-a67459954f28@igalia.com>
Date: Sun, 14 May 2023 18:48:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [patch V4 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Ross Philipson <ross.philipson@oracle.com>
References: <20230512203426.452963764@linutronix.de>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20230512203426.452963764@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/05/2023 18:06, Thomas Gleixner wrote:
> Hi!
> 
> This is version 4 of the reworked parallel bringup series. Version 3 can be
> found here:
> 
>    https://lore.kernel.org/lkml/20230508181633.089804905@linutronix.de


Hi Thomas, thanks for series! I was able to test it on the Steam Deck
(on top of 6.4-rc2), and everything is working fine; also tested S3
suspend/resume, working as expected.

Some logs from boot time:


Parallel boot
[    0.239764] smp: Bringing up secondary CPUs ...
[...]
[    0.253130] smp: Brought up 1 node, 8 CPUs


Regular boot (with cpuhp.parallel=0)
[    0.240093] smp: Bringing up secondary CPUs ...
[...]
[    0.253475] smp: Brought up 1 node, 8 CPUs


Feel free to add (to the series):

Tested-by: Guilherme G. Piccoli <gpiccoli@igalia.com> # Steam Deck

Cheers,


Guilherme

