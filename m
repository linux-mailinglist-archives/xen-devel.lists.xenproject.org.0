Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C34BD948C0D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772602.1183045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGJP-00047b-7J; Tue, 06 Aug 2024 09:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772602.1183045; Tue, 06 Aug 2024 09:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGJP-000467-4a; Tue, 06 Aug 2024 09:16:59 +0000
Received: by outflank-mailman (input) for mailman id 772602;
 Tue, 06 Aug 2024 09:16:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sbGJN-000461-RK
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:16:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbGJN-0001up-81; Tue, 06 Aug 2024 09:16:57 +0000
Received: from [15.248.3.88] (helo=[10.24.67.24])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbGJN-0001jF-0X; Tue, 06 Aug 2024 09:16:57 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=SN3hoKBjMyUWtJllNwW7DnmkEjQwYN22OSSQfPIAx34=; b=dmw//Y9Q0fEPeh7x/4NTVrLeXV
	DWT3IXetFcgpUxNRLAkDluX2M+m+vrFoVNEcBXYZPIUzK63jr1Z++haDc99jUPj5P8YEhqypiQTnU
	KexzJuajeU9uzR7fWDd8C1zFrqrcA6i10UeuKtH7E1Xk8CguaMOFKLdF9gCaqOzU6Rdk=;
Message-ID: <b7ef34fe-f6eb-45e8-8f6a-0e2c4bd0175b@xen.org>
Date: Tue, 6 Aug 2024 10:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: char: omap-uart: add "clock-hz" option
Content-Language: en-GB
To: Amneesh Singh <a-singh21@ti.com>, xen-devel@lists.xenproject.org
References: <20240719113313.145587-1-a-singh21@ti.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240719113313.145587-1-a-singh21@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/07/2024 12:33, Amneesh Singh wrote:
> Quite a few TI K3 devices do not have clock-frequency specified in their
> respective UART nodes.

Can you outline why fixing the device-tree is not solution?

> However hard-coding the frequency is not a
 > solution as the function clock input can differ between SoCs.

Can you provide some details how Linux is handling those SoCs?

> So,
> similar to com1/com2, let the user pass the frequency as a dtuart option
> via the bootargs. If not specified it will fallback to the same DT
> parsing as before. For example, dtuart=serial2:clock-hz=48000000 can be
> a valid bootarg.

Regardless my questions, any change to the command line needs to be 
documented in docs/misc/xen-command-line.pandoc.

Cheers,

-- 
Julien Grall


