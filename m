Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196B880C9E4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 13:33:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651746.1017547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfSP-000128-CX; Mon, 11 Dec 2023 12:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651746.1017547; Mon, 11 Dec 2023 12:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfSP-0000zf-9v; Mon, 11 Dec 2023 12:32:21 +0000
Received: by outflank-mailman (input) for mailman id 651746;
 Mon, 11 Dec 2023 12:32:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rCfSN-0000zS-Fp
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 12:32:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCfSM-0003zT-Sl; Mon, 11 Dec 2023 12:32:18 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.158.169]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCfSM-0001Vv-Ml; Mon, 11 Dec 2023 12:32:18 +0000
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
	bh=Xrbc35ijAfgsBfLar5cNbTxS8fJ70VWS4yqrCD7nU6c=; b=J3oEiMb9VHTwqlKMuT9SSvOiqy
	gMFtz0gb7V9uIxo+xceaMuabVORZKX0g+vfSdXVrS9IUxz7ddmNMGmx+1zC8aoI2hX9k6LnLm7bMg
	pWsgCDdTXBLxqhLaJFYkNFEpWje1+FVCn9ayZQH/qUflLOGyXqx/nT4MT+Ufrrr8DZE4=;
Message-ID: <08e3c8f0-772e-4c08-9afc-c623f19c85e3@xen.org>
Date: Mon, 11 Dec 2023 12:32:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: traps: add ASSERT_UNREACHABLE() where
 needed
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <394b69b769f2dc2461d2ddb0c7e037f4794eb244.1702283415.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/12/2023 10:30, Nicola Vetrini wrote:
> The branches of the switch after a call to 'do_unexpected_trap'
> cannot return, but there is one path that may return, hence
> only some clauses are marked with ASSERT_UNREACHABLE().
I don't understand why this is necessary. The code should never be 
reachable because do_unexpected_trap() is a noreturn().

Cheers,

-- 
Julien Grall

