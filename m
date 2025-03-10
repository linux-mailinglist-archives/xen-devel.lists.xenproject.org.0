Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A25A59148
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 11:34:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906392.1313840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1traS6-0000Yf-7c; Mon, 10 Mar 2025 10:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906392.1313840; Mon, 10 Mar 2025 10:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1traS6-0000W0-4a; Mon, 10 Mar 2025 10:33:42 +0000
Received: by outflank-mailman (input) for mailman id 906392;
 Mon, 10 Mar 2025 10:33:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1traS4-0000Va-25
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 10:33:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1traS2-00CcTB-2b;
 Mon, 10 Mar 2025 10:33:38 +0000
Received: from [2a02:8012:3a1:0:f9cf:8834:13d9:5b3]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1traS2-001LD3-0P;
 Mon, 10 Mar 2025 10:33:38 +0000
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
	bh=II7IGNZsyPxgOzZ4c+h+XyTaC4qq+sjtSfQHfeRBrg4=; b=TCVrYtH1qLrQ4iLnkMfD+/OvWh
	bqB64ULF1H0VgDDFRnMrJsRNXEjoXQblama9eBQ5nhiAV5eCzBybRFU1NEfgM0mLGCQ0EAF/qAYEI
	ZnhMSgGa6PRXwqbeOIg8Oi6q1pRBXa1CeCb1y8vRD4AnbR92RBsWxvPajW6DWmpX3/1k=;
Message-ID: <8cddfc99-391a-4500-a1af-6e5f4d2d18da@xen.org>
Date: Mon, 10 Mar 2025 10:33:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: drop pci_segments_init()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony@xenproject.org>
References: <4ada4343-c65b-456d-b0c2-9ae59937aaff@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4ada4343-c65b-456d-b0c2-9ae59937aaff@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/02/2025 11:38, Jan Beulich wrote:
> Have callers invoke pci_add_segment() directly instead: With radix tree
> initialization moved out of the function, its name isn't quite
> describing anymore what it actually does.
> 
> On x86 move the logic into __start_xen() itself, to reduce the risk of
> re-introducing ordering issues like the one which was addressed by
> 26fe09e34566 ("radix-tree: introduce RADIX_TREE{,_INIT}()").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is entirely optional and up for discussion. There certainly also is
> an argument towards keeping the function. Otoh on Arm there is the still
> open question whether segment 0 really is kind of special there (as it
> is on x86, largely for historical reasons), or whether the code can be
> dropped there altogether.

Looking at the discussion between you and Stewart, it looks like we need 
to keep the call for now. Once we have the downstream patches merged, we 
can remove it. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


