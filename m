Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE28189FE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:32:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656929.1025439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFb8u-0007jN-Qw; Tue, 19 Dec 2023 14:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656929.1025439; Tue, 19 Dec 2023 14:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFb8u-0007hY-MQ; Tue, 19 Dec 2023 14:32:20 +0000
Received: by outflank-mailman (input) for mailman id 656929;
 Tue, 19 Dec 2023 14:32:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFb8s-0007hC-LO
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:32:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFb8s-0002sr-2k; Tue, 19 Dec 2023 14:32:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFb8r-0000wP-TL; Tue, 19 Dec 2023 14:32:18 +0000
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
	bh=U+MRPhwtPdJ13wp9CITdkqfdE115Nz/U/22r1f2xmHk=; b=dgSuixFKwPM6+TmIR0St/zfzqw
	7AkJPbTEG6Q5eEizrrVKe7hv/ds3+8cPn0Eys1/cnq9WrCDr/oPzhs3An16aheukXAEdIlMMoNtJW
	cWuwSQc4TWqiESbw1RD8CPMdG80NLB90nUdF0dfrqZblW+0boyYoLhGpQEhBvkf6bj2M=;
Message-ID: <13b218b5-2d37-48de-9baa-cf2b99211bde@xen.org>
Date: Tue, 19 Dec 2023 14:32:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
 <cacbff18-f37d-42dc-ab8c-79409aa1d237@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cacbff18-f37d-42dc-ab8c-79409aa1d237@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/12/2023 14:18, Mykyta Poturai wrote:
> Following up with relevant QEMU patch link.
> 
> https://patchwork.kernel.org/project/qemu-devel/patch/c7a180a5874f036c246fc39f921eefafecbc8c76.1702994649.git.mykyta_poturai@epam.com/

I don't seem to have the patch in my inbox. I guess you didn't CC xen-devel?

Anyway, I will reply here. I think this is a mistake for QEMU to assume 
that Xen will expose a GICv3 ITS to the guest (we may decide to 
implement another MSI controller).

But QEMU should really not need to implement a full ITS. What it needs 
is a way to forward the MSI to Xen. That's it.

Stefano, do you have any suggestion how to do this in QEMU?

Cheers,

-- 
Julien Grall

