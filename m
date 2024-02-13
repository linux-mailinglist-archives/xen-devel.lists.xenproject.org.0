Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B48E853903
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 18:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680121.1058001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwxs-0001bm-Tu; Tue, 13 Feb 2024 17:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680121.1058001; Tue, 13 Feb 2024 17:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwxs-0001Zc-Qd; Tue, 13 Feb 2024 17:53:04 +0000
Received: by outflank-mailman (input) for mailman id 680121;
 Tue, 13 Feb 2024 17:53:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rZwxq-0001ZW-QC
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 17:53:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZwxq-0004li-1K; Tue, 13 Feb 2024 17:53:02 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZwxp-0001qV-Oy; Tue, 13 Feb 2024 17:53:01 +0000
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
	bh=q6lzQ6MWSQ5gloczL0BcGlo6D8EKQQsfqXwuuhPjESw=; b=HMfsA7mfy5XAz7N3UTuGaPzoiX
	614eZPDWIckCLspw0uuB7t1rpJ7DZzLN0CGQlogRzt/6PEXERRsSrfAvkhKNqNsCZeM+qnlMX0HJg
	Un7zVBbMXAk9LfY5ABzhh9qAuoaHhIs7lgpmnujBywZsIs/195C8fYbeDsuZJhuRaS2s=;
Message-ID: <f3a7613e-0a3d-49f9-ac3a-57c8e51392b1@xen.org>
Date: Tue, 13 Feb 2024 17:52:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/7] xen/asm-generic: ifdef inclusion of
 <asm/mem_access.h>
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
 <e1927bde3fa27a934e8ccaa8969b38e8a5dff52e.1707499278.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e1927bde3fa27a934e8ccaa8969b38e8a5dff52e.1707499278.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 09/02/2024 18:00, Oleksii Kurochko wrote:
> ifdefing inclusion of <asm/mem_access.h> in <xen/mem_access.h>
> allows to avoid generation of empty <asm/mem_access.h> header
> for the case when !CONFIG_MEM_ACCESS.
> 
> For Arm it was explicitly added inclusion of <asm/mem_access.h> for p2m.c
> and traps.c because they require some functions from <asm/mem_access.h> which
> aren't available in case of !CONFIG_MEM_ACCESS.

Ideally we should protect the code relying on <asm/mem_access.h>. But 
that's a separate improvement for the Arm folks to deal with. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

