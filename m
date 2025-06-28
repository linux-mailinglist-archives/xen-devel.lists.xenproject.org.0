Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C7AEC95C
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jun 2025 19:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028390.1402381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVZJu-0004FH-Qh; Sat, 28 Jun 2025 17:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028390.1402381; Sat, 28 Jun 2025 17:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVZJu-0004DF-N7; Sat, 28 Jun 2025 17:26:30 +0000
Received: by outflank-mailman (input) for mailman id 1028390;
 Sat, 28 Jun 2025 17:26:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uVZJt-0004D4-1k
 for xen-devel@lists.xenproject.org; Sat, 28 Jun 2025 17:26:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVZJf-0072fM-2l;
 Sat, 28 Jun 2025 17:26:15 +0000
Received: from [2a02:8012:3a1:0:d050:4cf0:af44:4b0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVZJf-002tUr-1X;
 Sat, 28 Jun 2025 17:26:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ZzJJE6gQ3Zauq+OPNw6A0M1Le3qFdUevYHuIouIp+Ys=; b=o0uWu53NLieNso/eTpYwu7+3Ac
	rlFarHLik6FKFvwA6AaAl/JlxULSpsGCRggtyC6UINfn+0E2UN1EZKgmUHY7YgXgdrih2Y+jDTQqh
	FC1AF0elFg4zO4XVJ4HyuQTxW9xrlHfEdj/GxNn7Qm0bCtKW5bE0cMJGBy8A5vo2Lz/M=;
Message-ID: <ab1d2b35-2760-436c-8e9d-57f094712012@xen.org>
Date: Sat, 28 Jun 2025 18:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART
 emulators
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: dmkhn@proton.me, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250606201102.2414022-1-dmukhin@ford.com>
 <20250606201102.2414022-3-dmukhin@ford.com>
 <bcb3d553-b8aa-42ab-a9c8-7abf6f5d02c3@suse.com> <aEjInVF3zaa+VVd2@kraken>
 <b27f7652-424f-479c-a4bc-ed2ecd46ccc8@suse.com>
 <alpine.DEB.2.22.394.2506111155400.542113@ubuntu-linux-20-04-desktop>
 <b9c263e0-3d8d-4966-8f54-611e58572118@suse.com>
 <alpine.DEB.2.22.394.2506171735440.1780597@ubuntu-linux-20-04-desktop>
 <2f726960-4bdc-4996-b204-722c0253e2ab@suse.com>
 <alpine.DEB.2.22.394.2506181742281.1780597@ubuntu-linux-20-04-desktop>
 <15db8155-3d3d-41e9-92be-957067a34e5f@suse.com>
 <alpine.DEB.2.22.394.2506201747530.2978375@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2506201747530.2978375@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 21/06/2025 01:52, Stefano Stabellini wrote:
>> Widely used or not - _I_ use it all the time in debug configs where serial
>> is available.
> 
> Fair enough and your usage is really important for the project. At the
> same time you know exactly what's going on so you wouldn't be confused
> by the presence or absence of a (d0) prefix.
> 
> The main issue is when less familiar users try Xen, or less familiar
> developers go through the Xen source code to learn from it.
> 
> I would optimize this choice to make it simpler for users and to make
> the code simpler. Your use-case is really important as well, but I would
> trust you to understand what's going on either way, with or without the
> (d0) prefix.

Thanks for the clarification. I gave a try with and without the series 
to understand a bit more the difference. I think there are some 
imbalance in that setup because when the focus is on Xen, the logs are 
still prefixed with "(XEN)". So naturally the log with no prefix are the 
one for Dom0. So I have to agree with Jan here.

I haven't tried the behavior with dom0less. So I am not sure what would 
happen if the focus switch to Xen.

Also, when switching focus, I have noticed a very odd behavior with this 
patch. "(d0)" is printed multiple time per line:

"
(d0) [    1.344020] v(d0) gaarb: loaded
(d0) [    1.352808] c(d0) locksource: Swit(d0) ched to clocksou(d0) rce 
arch_sys_cou(d0) nter
(d0) [    1.367604] V(d0) FS: Disk quotas (d0) dquot_6.6.0
(d0) [    1.369369] V(d0) FS: Dquot-cache (d0) hash table entri(d0) es: 
512 (order 0(d0) , 4096 bytes)
(d0) [    1.376766] p(d0) np: PnP ACPI: di(d0) sabled
(d0) [    1.619730] N(d0) ET: Registered P(d0) F_INET protocol (d0) family
(d0) [    1.623635] I(d0) P idents hash ta(d0) ble entries: 163(d0) 84 
(order: 5, 13(d0) 1072 bytes, line(d0) ar)
(d0) [    1.636915] t(d0) cp_listen_portad(d0) dr_hash hash tab(d0) le 
entries: 512 (d0) (order: 3, 36864(d0)  bytes, linear)
(d0) [    1.638331] T(d0) able-perturb has(d0) h table entries:(d0) 
65536 (order: 6(d0) , 262144 bytes, (d0) linear)
(d0) [    1.639267] T(d0) CP established h(d0) ash table entrie(d0) s: 
8192 (order: (d0) 4, 65536 bytes, (d0) linear)
(d0) [    1.643457] T(d0) CP bind hash tab(d0) le entries: 8192(d0) 
(order: 8, 1179(d0) 648 bytes, linea(d0) r)
(d0) [    1.652078] T(d0) CP: Hash tables (d0) configured (esta(d0) 
blished 8192 bin(d0) d 8192)
(d0) [    1.655824] U(d0) DP hash table en(d0) tries: 512 (orde(d0) r: 
4, 81920 byte(d0) s, linear)
(d0) [    1.657807] U(d0) DP-Lite hash tab(d0) le entries: 512 (d0) 
(order: 4, 81920(d0)  bytes, linear)
(d0) [    1.661993] N(d0) ET: Registered P(d0) F_UNIX/PF_LOCAL (d0) 
protocol family
(d0) [    1.674980] R(d0) PC: Registered n(d0) amed UNIX socket(d0) 
transport modul(d0) e.
(d0) [    1.676034] R(d0) PC: Registered u(d0) dp transport mod(d0) ule.
(d0) [    1.677241] R(d0) PC: Registered t(d0) cp transport mod(d0) ule.
(d0) [    1.677964] R(d0) PC: Registered t(d0) cp-with-tls tran(d0) 
sport module.
(d0) [    1.678615] R(d0) PC: Registered t(d0) cp NFSv4.1 backc(d0) 
hannel transport(d0)  module.
"

Cheers,

-- 
Julien Grall


