Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A552A295
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330788.554177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqwsK-00056X-Uw; Tue, 17 May 2022 13:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330788.554177; Tue, 17 May 2022 13:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqwsK-00054R-RW; Tue, 17 May 2022 13:04:32 +0000
Received: by outflank-mailman (input) for mailman id 330788;
 Tue, 17 May 2022 13:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ghfa=VZ=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1nqwsI-00054L-F4
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:04:31 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e20633ec-d5e1-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 15:04:28 +0200 (CEST)
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqwrY-008RNM-0M; Tue, 17 May 2022 15:03:44 +0200
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
X-Inumbo-ID: e20633ec-d5e1-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7k65fdRTQg/wflBs9f0TJRvKoWTammEy4iwKmtzcPs4=; b=OpLRZBE1TUxWd4SJevol7qmbWp
	7cf/63XEfW1McNr9yfxJ/wNA5PzTA6GfEDtrBWeHePG4UP9vT004IKq/Y2n1Wdo9PCU8d40cNtPr7
	evvA1G/GsHzDMrD3kL1RWnjHzehDzDywj5u53TN0tmnpdWb3jYfL8mY4Uh+43rmflK1PctID/9pFc
	ZvUCbSUysCdoW+hfAZNQhZbT4OFisfS/H/quOUTTDHZ+I5zaEEC4729JtousRNxBxXebYRI1Dcqzp
	PvSzoHit05E/cq1DK95qfXV5U60l7efTEeM0sV+06rVod3szWCADFSxvFodt56BQEE6VcTzDLc2Bf
	FOG6Wfyw==;
Message-ID: <53ceb2c7-f2d7-3b92-4efa-a063487585bc@igalia.com>
Date: Tue, 17 May 2022 10:03:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 05/30] misc/pvpanic: Convert regular spinlock into trylock
 on panic path
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 rcu@vger.kernel.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com,
 kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com,
 alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, bp@alien8.de, corbet@lwn.net, d.hatayama@jp.fujitsu.com,
 dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com,
 gregkh@linuxfoundation.org, mikelley@microsoft.com,
 hidehiro.kawai.ez@hitachi.com, jgross@suse.com, john.ogness@linutronix.de,
 keescook@chromium.org, luto@kernel.org, mhiramat@kernel.org,
 mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org,
 rostedt@goodmis.org, senozhatsky@chromium.org, stern@rowland.harvard.edu,
 tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Mihai Carabas <mihai.carabas@oracle.com>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Wang ShaoBo <bobo.shaobowang@huawei.com>,
 zhenwei pi <pizhenwei@bytedance.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-6-gpiccoli@igalia.com> <YnpXGOXicwdy1E6n@alley>
 <0a20dd06-f459-638e-cb4d-8255ab1a1f23@igalia.com> <YoN/x2fpdDU4+nSB@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoN/x2fpdDU4+nSB@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/05/2022 07:58, Petr Mladek wrote:
> [...]
>> Thanks for the review Petr. Patch was already merged - my goal was to be
>> concise, i.e., a patch per driver / module, so the patch kinda fixes
>> whatever I think is wrong with the driver with regards panic handling.
>>
>> Do you think it worth to remove this patch from Greg's branch just to
>> split it in 2? Personally I think it's not worth, but opinions are welcome.
> 
> No problem. It is not worth the effort.
> 

OK, perfect!

Cheers,


Guilherme

