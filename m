Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF90831B15
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 15:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668768.1041189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQT2R-0004Ce-AH; Thu, 18 Jan 2024 14:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668768.1041189; Thu, 18 Jan 2024 14:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQT2R-0004AP-7g; Thu, 18 Jan 2024 14:06:35 +0000
Received: by outflank-mailman (input) for mailman id 668768;
 Thu, 18 Jan 2024 14:06:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rQT2P-0004AJ-PM
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 14:06:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQT2O-0006L7-S3; Thu, 18 Jan 2024 14:06:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQT2O-000216-Mm; Thu, 18 Jan 2024 14:06:32 +0000
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
	bh=4FU1svIlywXHLE8iOGpk/EirDNgiGDS7XZJ2gmcHdso=; b=Ak3aT7ITIggO/9v45xNbDkBKRv
	w8sAfrKRgdynY0cqiup+cV4Cz8nXc3P0xmpu56WbT0iMahTeRzhKJS2WOs9HxKhPmY9aRou1LUVTv
	0HmUIDsoxEv6hSyvs7qxV4q/hKcug+Zr2NdOpZMXZUVoU8Dy1XwAtjucMuqRPqNyrnH4=;
Message-ID: <3fd4bafd-75f8-4352-bee2-1fa6dc64a9d5@xen.org>
Date: Thu, 18 Jan 2024 14:06:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] keyhandler: don't pass cpu_user_regs around
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <dd1c24ec-4054-43e1-b0c9-6c2044b84046@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dd1c24ec-4054-43e1-b0c9-6c2044b84046@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/01/2024 07:31, Jan Beulich wrote:
> There are exactly two handlers which care about the registers. Have
> handle_keypress() make the pointer available via a per-CPU variable,
> thus eliminating the need to pass it to all IRQ key handlers, making
> sure that a console-invoked key's handling can still nest inside a
> sysctl-invoked one's.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

