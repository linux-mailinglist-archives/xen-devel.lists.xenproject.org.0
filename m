Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C1CCBBE5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 13:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189514.1510278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWCrT-0003iH-EU; Thu, 18 Dec 2025 12:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189514.1510278; Thu, 18 Dec 2025 12:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWCrT-0003gI-BO; Thu, 18 Dec 2025 12:12:03 +0000
Received: by outflank-mailman (input) for mailman id 1189514;
 Thu, 18 Dec 2025 12:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRjX=6Y=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1vWCrS-0003gC-9x
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 12:12:02 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c10e5ba8-dc0a-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 13:12:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C239143D6F;
 Thu, 18 Dec 2025 12:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD324C4CEFB;
 Thu, 18 Dec 2025 12:11:57 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfauth.phl.internal (Postfix) with ESMTP id BD61AF40069;
 Thu, 18 Dec 2025 07:11:56 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-04.internal (MEProxy); Thu, 18 Dec 2025 07:11:56 -0500
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 7DD622CE0072; Thu, 18 Dec 2025 07:11:56 -0500 (EST)
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
X-Inumbo-ID: c10e5ba8-dc0a-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766059918;
	bh=XGQ+7SgEew4iClGYURs+C9L0stXJTBsZbjZ2oG7UIc0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Pbfm1N29OV600qM6UTmHFrWBgKAAPaEIi8H31U8/D7Fy4/yQH7DtTr8fjL1JU2ZGr
	 6nwz3dwH1V2m2ot6sPml3YHiTkco7la+c2nu+l+SxzciJta8kjjah21YI0wd4vAeV1
	 isA2l1yKhqypiDWu4LQeHt4ykcmpaBp/ImSwyvJVre9a3pRs4GXVsIRHvw6x+1fCZ3
	 aTjQTA27ccRELqk9h2L0kraeNtbMTR5EzRmpbnJomxT+NeArdctTyUhXcuNcwN7S86
	 MwPNLvKu3CLTwt2KbzjkGo2I4spjFwLzTY0Numflrkc7wTVrfPPFNtqzCFaA++T+6a
	 inlbyNZVWvrqA==
X-ME-Sender: <xms:jO9DafeY02D3zYoswm455JApvwyXo9N__fUotOJi51wAZtuEx-h72w>
    <xme:jO9DaQDfyGYFoXV11b_RfSRExwBkMCEzZBimiIe7NMQwesYYigYemrJGclZL6-nUN
    5nH6_xmiiK7evyXwi9tI-nHYYwNuyJSE2e3okgtOjc_KJ6UT8WLB40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnvghonhcu
    tfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekgfduveffueffveduleefgfejhfevfeduueeiueetleeugeeivdfhfedv
    geeuhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheplhgvohhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdduvdeftdehfeelkeegqddvjeejleejjedvkedqlhgvohhnpe
    epkhgvrhhnvghlrdhorhhgsehlvghonhdrnhhupdhnsggprhgtphhtthhopeefiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpth
    htohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthho
    pehrohgsihhnrdhmuhhrphhhhiesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigse
    grrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhl
    vghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegurghvvghmsegurghvvghmlh
    hofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhr
    tghpthhtohepohhlvghkshgrnhgurhgpthihshhhtghhvghnkhhosegvphgrmhdrtghomh
    dprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhm
X-ME-Proxy: <xmx:jO9DaW3ei8lQ9gcPxNPUeQZve5kN2H4YDdliFX36bDRD9uMeDsZ4KA>
    <xmx:jO9DaUpMFxuOPj7_hGyyy_s579il17M-kR5TgcqcXniyOzdDRg_9ow>
    <xmx:jO9DaWJBfSyOkp-S-guhU4sCQMQj21t9ZeDTKlB6MTu_eAniobrx8g>
    <xmx:jO9DaQMmPwxjAIxGEGDyRXW1Dza8HIb57oy-5TquwYRW4FNWdPdjfg>
    <xmx:jO9DaU3nohCadRXkzPkJY71Xjbbz3hpclv3AJ-2YED3d89Ht1quCx0PH>
Feedback-ID: i927946fb:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AsrGuGndWMm3
Date: Thu, 18 Dec 2025 14:11:35 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Robin Murphy" <robin.murphy@arm.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Juergen Gross" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Geoff Levand" <geoff@infradead.org>,
 "David Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 "Jason Gunthorpe" <jgg@ziepe.ca>, "Jason Gunthorpe" <jgg@nvidia.com>
Message-Id: <77e73a01-9f7e-475b-a810-278f931910ed@app.fastmail.com>
In-Reply-To: <20251218084002.GD39046@unreal>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
 <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
 <20251218084002.GD39046@unreal>
Subject: Re: [PATCH v5 09/14] parisc: Convert DMA map_page to map_phys interface [qemu
 test failure]
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Dec 18, 2025, at 10:40, Leon Romanovsky wrote:
> On Wed, Dec 17, 2025 at 04:17:38AM -0800, Guenter Roeck wrote:
>> Hi,
>> 
>> On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
>> > From: Leon Romanovsky <leonro@nvidia.com>
>> > 
>> > Perform mechanical conversion from .map_page to .map_phys callback.
>> > 
>> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>> 
>> This patch causes all my 32-bit parisc qemu tests with C3700 machine
>> to fail. Network interface tests fail, and all boot attempts from
>> any kind of hard drive (scsi, usb) fail with this patch in the tree.
>
> Thanks for the report. I have a fix ready; I'll clean it up and send it out
> by EOD.

The fix is available here
https://lore.kernel.org/all/20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com/T/#u

Thanks

>
>> 
>> Guenter

