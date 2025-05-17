Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8209AABA8AD
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 09:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988075.1373172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGBwz-0004cj-GZ; Sat, 17 May 2025 07:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988075.1373172; Sat, 17 May 2025 07:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGBwz-0004aD-DT; Sat, 17 May 2025 07:27:17 +0000
Received: by outflank-mailman (input) for mailman id 988075;
 Sat, 17 May 2025 07:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JLOd=YB=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1uGBwy-0004a7-0y
 for xen-devel@lists.xenproject.org; Sat, 17 May 2025 07:27:16 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59399558-32f0-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 09:27:13 +0200 (CEST)
Received: from smtpclient.apple ([71.202.166.45]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54H7QhLm591490
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sat, 17 May 2025 00:26:45 -0700
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
X-Inumbo-ID: 59399558-32f0-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54H7QhLm591490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747466805;
	bh=CZtkP3WrpMIGbhySH/khDRYEg3tCdemTLMORia2zrho=;
	h=From:Subject:Date:References:Cc:In-Reply-To:To:From;
	b=JfigqQZ5Lh/TeQEqqyQKd8QM/ozskiXWWzhEwAaEP/NSDAXzGTuveYCYLruvOh24f
	 Rx6isU+2S9BV3OGP1yK3L2fuZj8zKu0SI6I+SJrNAW4ow77BAKijsLpIBQfeaq7Tgo
	 JebNnI7RC7C0XefauAe3O64YSAbfJmCq8Zvw+ZekHJDAsaFoFJhNnKX89u+GKXJ5xy
	 HTDU4z0X5rSsRI/k1lX6GojOxbeWx3oFn/1nwGYgKkIh5EPikQePMIsnv0vT75sMwn
	 RbykR0FK5XFvenmDV6tfJnOVKc5dzk3SrKNq3P4mImuX8O75ABonq4k35ChRoQGXTJ
	 x5kuQ40RpC+rA==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Xin Li <xin@zytor.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v1 3/3] x86/msr: Convert a native_wrmsr() use to native_wrmsrq()
Date: Sat, 17 May 2025 00:26:32 -0700
Message-Id: <EAEB5A61-F19B-481C-B6F0-49B3D509B70A@zytor.com>
References: <aCg27zLhBM5d0dAI@gmail.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org, tglx@linutronix.de, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        peterz@infradead.org, jgross@suse.com, boris.ostrovsky@oracle.com,
        rafael@kernel.org, lenb@kernel.org
In-Reply-To: <aCg27zLhBM5d0dAI@gmail.com>
To: Molnar Ingo <mingo@kernel.org>
X-Mailer: iPhone Mail (22F76)


>>> On 5/15/2025 10:54 AM, Xin Li wrote:
>>> On 5/15/2025 8:27 AM, Ingo Molnar wrote:
>>>> 
>>>> * Xin Li (Intel) <xin@zytor.com> wrote:
>>>> 
>>>>> Convert a native_wrmsr() use to native_wrmsrq() to zap meaningless type
>>>>> conversions when a u64 MSR value is splitted into two u32.
>>>>> 
>>>> 
>>>> BTW., at this point we should probably just replace
>>>> sev_es_wr_ghcb_msr() calls with direct calls to:
>>>> 
>>>>     native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, ...);
>>>> 
>>>> as sev_es_wr_ghcb_msr() is now basically an open-coded native_wrmsrq().
>>>> 
>>> 
>>> I thought about it, however it looks to me that current code prefers not
>>> to spread MSR_AMD64_SEV_ES_GHCB in 17 callsites.  And anyway it's a
>>> __always_inline function.
>>> 
>>> But as you have asked, I will make the change unless someone objects.
>> 
>> Hi Ingo,
>> 
>> I took a further look and found that we can't simply replace
>> sev_es_wr_ghcb_msr() with native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, ...).
>> 
>> There are two sev_es_wr_ghcb_msr() definitions.  One is defined in
>> arch/x86/boot/compressed/sev.h and it references boot_wrmsr() defined in
>> arch/x86/boot/msr.h to do MSR write.
> 
> Ah, indeed, it's also a startup code wrapper, which wrmsrq() doesn't
> have at the moment. Fair enough.

So you want me to drop this patch then?

Thanks!
    Xin

