Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C819938C0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 23:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812479.1225244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuyN-00086N-PF; Mon, 07 Oct 2024 21:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812479.1225244; Mon, 07 Oct 2024 21:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxuyN-00084s-Mg; Mon, 07 Oct 2024 21:08:55 +0000
Received: by outflank-mailman (input) for mailman id 812479;
 Mon, 07 Oct 2024 21:08:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sxuyM-00084m-38
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 21:08:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sxuyL-0001Tm-VV; Mon, 07 Oct 2024 21:08:53 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sxuyL-0007lJ-OB; Mon, 07 Oct 2024 21:08:53 +0000
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
	bh=YRilv+qYN2k6jN9oEBmLK7DNiBEqfg40170+ZBRSaiE=; b=jhtACPRKoWFBJ0LZUP6TSCvJjP
	lKVN4FkolmqF5kQNV4hV4bHcJn1H6ynOFnpL2Q7OwpEWhvCvVTS8n/SBh570eHYbFd7fWA2ciJawY
	Vho8TQjS0wxHjrwg4HHJo3nvqInB3Ahld+zIP9KEFjaP27Nnna3U1ce1IMdszOtA/TPk=;
Message-ID: <2a4f02ed-d71f-4475-9f9f-60d68991bc3b@xen.org>
Date: Mon, 7 Oct 2024 22:08:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ioreq: don't wrongly claim "success" in
 ioreq_send_buffered()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <3b4a324c-dbe6-4647-a73a-afdb94ff2ecd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3b4a324c-dbe6-4647-a73a-afdb94ff2ecd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/09/2024 11:28, Jan Beulich wrote:
> Returning a literal number is a bad idea anyway when all other returns
> use IOREQ_STATUS_* values. The function is dead on Arm, and mapping to
> X86EMUL_OKAY is surely wrong on x86.
> 
> Fixes: f6bf39f84f82 ("x86/hvm: add support for broadcast of buffered ioreqs...")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

