Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0FF64534D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 06:12:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455765.713384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2mi7-0005a5-QU; Wed, 07 Dec 2022 05:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455765.713384; Wed, 07 Dec 2022 05:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2mi7-0005Y1-Mn; Wed, 07 Dec 2022 05:11:11 +0000
Received: by outflank-mailman (input) for mailman id 455765;
 Wed, 07 Dec 2022 02:09:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sspr=4F=zlw.email=sisyphean@srs-se1.protection.inumbo.net>)
 id 1p2jsY-0002zO-0K
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 02:09:46 +0000
Received: from mail.zlw.email (unknown [112.49.95.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30dd74a5-75d4-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 03:09:41 +0100 (CET)
Received: from localhost (unknown [127.0.0.1])
 by mail.zlw.email (Postfix) with ESMTP id 272E314D334
 for <xen-devel@lists.xenproject.org>; Wed,  7 Dec 2022 02:04:26 +0000 (UTC)
Received: from mail.zlw.email ([127.0.0.1])
 by localhost (mail.zlw.email [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vIm5IYE4yEUS for <xen-devel@lists.xenproject.org>;
 Wed,  7 Dec 2022 10:04:23 +0800 (CST)
Received: from [192.168.66.233] (OpenWrt.lan [192.168.66.1])
 by mail.zlw.email (Postfix) with ESMTPSA id 5549214D324
 for <xen-devel@lists.xenproject.org>; Wed,  7 Dec 2022 10:04:23 +0800 (CST)
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
X-Inumbo-ID: 30dd74a5-75d4-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlw.email; h=
	content-transfer-encoding:content-type:content-type:subject
	:subject:from:from:to:content-language:user-agent:mime-version
	:date:date:message-id; s=dkim; t=1670378663; x=1672970664; bh=pP
	E4vNWbukArjwuN3BDMvZv0YIse63lD0PSReJ6VxuI=; b=EU08Pw2D8HHzwvK5Ji
	00DXJ8r1JY1XqShmubRI6ajmNHSHUBr2AQKtPNeyePYMUNqENS3GN7UWLEXUBwQP
	iioppLLD1pMGB66MHbovgSwP8lsoPHebYxKQE2MXOsTRv/xztnddDlLjfjNnatIo
	ZG5bczZaKARy5b9LiLlpf3ndw=
X-Virus-Scanned: amavisd-new at zlw.email
Message-ID: <e1e0e347-6530-7b68-92f7-ef52defa55ac@zlw.email>
Date: Wed, 7 Dec 2022 10:04:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: xen-devel@lists.xenproject.org
From: sisyphean <sisyphean@zlw.email>
Subject: [BUG]SMMU-V3 queue need no-cache memory
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

     I try to run XEN on my ARM board(Sorry, for some commercial 
reasons, I can't tell you
     on which platform I run XEN)  and enable SMMU-V3, but all cmds in 
cmdq failed when XEN started.

     After using the debugger to track debugging, the reason for this 
problem is that
     the queue in the smmu-v3 driver is not no-cache, so after the 
function arm_smmu_cmdq_build_cmd
     is executed, the cmd is still in cache.Therefore, the SMMU-V3 
hardware cannot obtain the correct cmd
     from the memory for execution.

     The temporary solution I use is to execute function clean_dcache 
every time cmd is copied to cmdq
     in function queue_write. But it is obvious that this will seriously 
affect the efficiency.
     I have not found the method of malloc no-cache memory in XEN. Is 
this method not implemented?

     The XEN version I am running is RELEASE-4.16.2.

     English is not my native language; please excuse typing errors.

Cheers,

-- 
Sisyphean


