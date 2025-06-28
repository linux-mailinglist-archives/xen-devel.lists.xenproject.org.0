Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65354AEC95F
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jun 2025 19:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028396.1402391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVZLn-0004jf-4f; Sat, 28 Jun 2025 17:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028396.1402391; Sat, 28 Jun 2025 17:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVZLn-0004iE-1M; Sat, 28 Jun 2025 17:28:27 +0000
Received: by outflank-mailman (input) for mailman id 1028396;
 Sat, 28 Jun 2025 17:28:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uVZLl-0004i4-83
 for xen-devel@lists.xenproject.org; Sat, 28 Jun 2025 17:28:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVZLc-0072gw-09;
 Sat, 28 Jun 2025 17:28:16 +0000
Received: from [2a02:8012:3a1:0:d050:4cf0:af44:4b0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVZLb-002tld-2e;
 Sat, 28 Jun 2025 17:28:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=2v59vgr2YIpf81nIPfJll7O0maQkR3BOiTVV5F60cOk=; b=rkND4eX1ptjppY7x40cbEWfr9s
	D9/9sdzgOZwD9N8g/ukjlpk6U3nXbhIoojLSFQdylmPriRkS9u2e7JGtqzmuKCVAEW9lE9WURDZ49
	MW6BCrhuvaYBjfRDefTPegNiNzyOSlyqi/iVUH9MoYF/QIlgb0yh4ZIt8dVHLAVYMk7U=;
Message-ID: <5169c4ff-5cf2-4130-aa3d-facc1ca94bc5@xen.org>
Date: Sat, 28 Jun 2025 18:28:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART
 emulators
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
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
 <ab1d2b35-2760-436c-8e9d-57f094712012@xen.org>
In-Reply-To: <ab1d2b35-2760-436c-8e9d-57f094712012@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/06/2025 18:26, Julien Grall wrote:
> Hi Stefano,
> 
> On 21/06/2025 01:52, Stefano Stabellini wrote:
>>> Widely used or not - _I_ use it all the time in debug configs where 
>>> serial
>>> is available.
>>
>> Fair enough and your usage is really important for the project. At the
>> same time you know exactly what's going on so you wouldn't be confused
>> by the presence or absence of a (d0) prefix.
>>
>> The main issue is when less familiar users try Xen, or less familiar
>> developers go through the Xen source code to learn from it.
>>
>> I would optimize this choice to make it simpler for users and to make
>> the code simpler. Your use-case is really important as well, but I would
>> trust you to understand what's going on either way, with or without the
>> (d0) prefix.
> 
> Thanks for the clarification. I gave a try with and without the series 
> to understand a bit more the difference. I think there are some 
> imbalance in that setup because when the focus is on Xen, the logs are 
> still prefixed with "(XEN)". So naturally the log with no prefix are the 
> one for Dom0. So I have to agree with Jan here.

I forgot to clarify, this is not an ask to remove (XEN) when the focus 
is on Xen. This is more we should keep the existing behavior.

Cheers,

-- 
Julien Grall


