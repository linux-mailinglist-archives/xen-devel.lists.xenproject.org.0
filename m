Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA29AA48A7F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 22:30:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898428.1306984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnlRf-0006kV-6A; Thu, 27 Feb 2025 21:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898428.1306984; Thu, 27 Feb 2025 21:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnlRf-0006i9-3O; Thu, 27 Feb 2025 21:29:27 +0000
Received: by outflank-mailman (input) for mailman id 898428;
 Thu, 27 Feb 2025 21:29:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R0Xv=VS=redhat.com=vschneid@srs-se1.protection.inumbo.net>)
 id 1tnlRe-0006i3-0P
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 21:29:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6cacf67-f551-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 22:29:19 +0100 (CET)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-Cwkv29pANl6bxja5rx7yIw-1; Thu, 27 Feb 2025 16:29:16 -0500
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38f28a4647eso652655f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 13:29:16 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb
 (213-44-141-166.abo.bbox.fr. [213.44.141.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e485d6dbsm3149393f8f.82.2025.02.27.13.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 13:29:13 -0800 (PST)
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
X-Inumbo-ID: e6cacf67-f551-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740691758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eufceZLJr1I8fdiTEdgsBxpgVgc25hDn/n/ukbEKvAk=;
	b=i3cQbQDOetJAuwCJvv9flcyohNbt9cPhcEkqy/LuArTr4043iBCmc5bkEQZnvcvZkVZidJ
	nqGCmRsUNlf2VIPHrhU2cXsg9S/yZ7CmJSGlfCW5HAi2PULO7zN1kOhXrCdIZd5eoVW29H
	E59zjpaoL5AW6++EpfbwLVXEkXH7EFs=
X-MC-Unique: Cwkv29pANl6bxja5rx7yIw-1
X-Mimecast-MFC-AGG-ID: Cwkv29pANl6bxja5rx7yIw_1740691755
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740691754; x=1741296554;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eufceZLJr1I8fdiTEdgsBxpgVgc25hDn/n/ukbEKvAk=;
        b=LuIzCDnOUOOWTj6J+gxGDTJCmFojNAuHtGjThsxRZOA+g3Q0GigVB7wpEzcrNk6rgP
         rGjwbyiNY7XhynXmFYTDw79jW075w32I8a6FvrINV4e8JObr3IIsv4Bv55lsHZnB3VMd
         47ukw9MX/xML6QtOQ+66bDwWSUWFBXPyDO41IYcwrmlRvztt1fDwMi6kyuKjQFUto/9L
         y+NDcdqVBSC4vchVCKUrSTG6LiF2F0nDSxaZMYWUwtr1PTXSeH3eyttogOkH51HIQXPC
         fZTG38rN4KZwIoHQ3XR9Oi3o5/yQkd7IgbP9/dq5sdzNZWRa3lPORb9jwY5+Roi6Y6zb
         gbPg==
X-Forwarded-Encrypted: i=1; AJvYcCU5eE1ZPhYaxFw3UUXlKxHAEKjtgvhSBlNfVM89JObjzoomKBjXQPsvgZFr++4JS+a6wp5aytZIGkQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXPMMIR2CD3ogqBgJ/flP5vKzP2o9YnX+6rNH6zEQhsVdAkpCg
	Lng7dM5y37xi9qYAI+zePpBcOfSYTOqYdW2Yq2sk5RvwnBCgcd2TXNz+353bsqYBKhAfHoFuHJe
	4Mnn3lvf/JScECx4vKsX3EjujciCT2x7WNUWYm+etVYtDVmBbxIwjAlrGIOkaP2On6vynbjEUbx
	GG0eVoI+m4CgQldlGREC/Ns88AtPc8BBsUrlm4XVZqzx+2rfsj
X-Gm-Gg: ASbGncuPCyGCoe7/m0nuur6aXY67fZyg8oa42W9aWhkZv0S53mqgbzGF7vUH6uGbhsk
	iJCgO94AZdG4O9xn85JSKtKkKobeFamZBTBAxC4k0EW1QteAxWa/vGi/3nhdXjjIcgW5kfKLc2t
	uG2uuxZc/nVA2r5cc02EaQyvdCCPuabDMkoeUjBNPds6YumrEPWhw4dyGrI6G2UBRtwIaE3zdWU
	SUUc0/ZVfpDtgxdRY5o8DPr33Bdu/SF9ZJJhL7cIA0CLmZlk4XzEVuCrw2NTaWen9fzUc8cuviD
	Ei/GW8aybBEqVDTTCcetsV2IxiSV4UPySEVE92yLtXI6oXB+HlWSJiqpuew2z8SevfqyjKLljHb
	d
X-Received: by 2002:a05:6000:2112:b0:38f:6149:9235 with SMTP id ffacd0b85a97d-390ec7cba70mr618452f8f.16.1740691754661;
        Thu, 27 Feb 2025 13:29:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZAYOLvJ8C0YI1cxRbLvJGbMPaIg3Ni2v7psye+SaqGd/PraO+3wDx4Bo3vNp91pLbsuqmMQ==
X-Received: by 2002:a05:6000:2112:b0:38f:6149:9235 with SMTP id ffacd0b85a97d-390ec7cba70mr618394f8f.16.1740691754190;
        Thu, 27 Feb 2025 13:29:14 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, sstabellini@kernel.org,
 tglx@linutronix.de, peterz@infradead.org, luto@kernel.org,
 mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, kees@kernel.org, aliceryhl@google.com, ojeda@kernel.org,
 samitolvanen@google.com, masahiroy@kernel.org, rppt@kernel.org,
 xur@google.com, paulmck@kernel.org, arnd@arndb.de, puranjay@kernel.org,
 broonie@kernel.org, mbenes@suse.cz, sudeep.holla@arm.com,
 guohanjun@huawei.com, prarit@redhat.com, liuwei09@cestc.cn,
 Jonathan.Cameron@huawei.com, dwmw@amazon.co.uk,
 kristina.martsenko@arm.com, liaochang1@huawei.com, ptosi@google.com,
 thiago.bauermann@linaro.org, kevin.brodsky@arm.com, Dave.Martin@arm.com,
 joey.gouly@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v6 8/8] arm64: entry: Switch to generic IRQ entry
In-Reply-To: <Z8CwbmCXguCEfJvx@J2N7QTR9R3>
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
 <20250213130007.1418890-9-ruanjinjie@huawei.com>
 <xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z8CwbmCXguCEfJvx@J2N7QTR9R3>
Date: Thu, 27 Feb 2025 22:29:12 +0100
Message-ID: <xhsmh1pvjkrfb.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GncnHSyyESU5-vAyYnu62AvuOg4IFiY4TFHOqXyz9RU_1740691755
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 27/02/25 18:35, Mark Rutland wrote:
> On Thu, Feb 27, 2025 at 07:08:56PM +0100, Valentin Schneider wrote:
>> On 13/02/25 21:00, Jinjie Ruan wrote:
>> > Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
>> > to use the generic entry infrastructure from kernel/entry/*.
>> > The generic entry makes maintainers' work easier and codes
>> > more elegant.
>> >
>> > Switch arm64 to generic IRQ entry first, which removed duplicate 100+
>> > LOC and make Lazy preemption on arm64 available by adding a
>> > _TIF_NEED_RESCHED_LAZY bit and enabling ARCH_HAS_PREEMPT_LAZY.
>>
>> Just a drive-by comment as I'm interested in lazy preemption for arm64;
>> this series doesn't actually enable lazy preemption, is that for a
>> follow-up with the rest of the generic entry stuff?
>>
>> From a quick glance, it looks like everything is in place for enabling it.
>
> Sorry, there's been some fractured discussion on this on the
> linux-rt-users list:
>
>   https://lore.kernel.org/linux-rt-users/20241216190451.1c61977c@mordecai.tesarici.cz/
>
> The TL;DR is that lazy preemption doesn't actually depend on generic
> entry, and we should be able to enable it on arm64 independently of this
> series. I'd posted a quick hack which Mike Galbraith cleaned up:
>
>   https://lore.kernel.org/linux-rt-users/a198a7dd9076f97b89d8882bb249b3bf303564ef.camel@gmx.de/
>
> ... but that was never posted as a new thread to LAKML.
>

Thanks for the breadcrumbs!

> Would you be happy to take charge and take that patch, test it, and post
> it here (or spin your own working version)? I was happy with the way it
> looks but hadn't had the time for testing and so on.
>

Sure, looks straightforward enough, I'll pick this up.

> I expect that we'll merge the generic entry code too, but having them
> separate is a bit easier for bisection and backporting where people want
> lazy preemption in downstream trees.
>
> Mark.


