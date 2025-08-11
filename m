Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C894B21318
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 19:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077856.1438878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulWGY-00049q-OA; Mon, 11 Aug 2025 17:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077856.1438878; Mon, 11 Aug 2025 17:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulWGY-00047m-LP; Mon, 11 Aug 2025 17:24:58 +0000
Received: by outflank-mailman (input) for mailman id 1077856;
 Mon, 11 Aug 2025 17:24:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ulWGW-00047d-Tv
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 17:24:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulWGW-000Arx-14;
 Mon, 11 Aug 2025 17:24:56 +0000
Received: from [2a02:8012:3a1:0:2562:7575:7df6:8090]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulWGW-000Q1H-1h;
 Mon, 11 Aug 2025 17:24:56 +0000
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
	bh=ZSIi1x+Hq+lgM0MZnSR6HHLEIdwvlGDuTVwfQkmI1Mo=; b=Sex0GFVLrnHIS6yaNryXKJSxEE
	Gd7pL+agAMw7zYQObQwcUkviDHb6/r42zpkKnKThoZ5gU8HWnFbINpQWhkW7WN90H6b44ndwT9YDT
	BbHJZ7Rh6aOpsmsEndZ5k2VWG4PIYcXXiitykKIdACqlAeabZyOKXjHiYhiXZUReNmcs=;
Message-ID: <86faa2fa-9f23-49a9-a909-a3dd3d5a938f@xen.org>
Date: Mon, 11 Aug 2025 18:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: drop assertion from page_is_ram_type()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <804094ae-bb76-4165-9e07-46b775b4b46e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <804094ae-bb76-4165-9e07-46b775b4b46e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/08/2025 14:01, Jan Beulich wrote:
> Its uses in offline_page() and query_page_offline() make it reachable on
> Arm, as long as XEN_SYSCTL_page_offline_op doesn't have any Arm-specific
> code added. It being reachable was even mentioned in the commit
> introducing it, claiming it "clearly shouldn't be called on ARM just
> yet".

So I agree that the function can be reached. But then I don't think the 
function can simply return 0.

The name is too generic enough that someone may end up to use it in 
common code and there will be no signal to the user that the function 
will not properly indicate a RAM page on Arm.

I can think of two possible approaches:

1/ Implement properly page_is_ram_type(). We don't have an e820, but we 
could mimick it using the memory banks we stored.
2/ Rename page_is_ram_type() to page_offlinable() (or similar) so it is 
clear that the common use is for offlining.

The latter might be the simplest.

Cheers,

-- 
Julien Grall


