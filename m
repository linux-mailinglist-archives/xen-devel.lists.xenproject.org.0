Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C51872939F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 10:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545666.852179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7XnO-0002QH-N5; Fri, 09 Jun 2023 08:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545666.852179; Fri, 09 Jun 2023 08:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7XnO-0002MO-Hx; Fri, 09 Jun 2023 08:48:34 +0000
Received: by outflank-mailman (input) for mailman id 545666;
 Fri, 09 Jun 2023 08:48:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7XnM-0002Ik-QH; Fri, 09 Jun 2023 08:48:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7XnL-0006Nf-Om; Fri, 09 Jun 2023 08:48:31 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[10.95.166.95])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7XnL-0007RR-IX; Fri, 09 Jun 2023 08:48:31 +0000
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
	bh=aqFy0pQ6nOJyxXES3DP4OG1nlgIw/JzaB4f7+GcMv2U=; b=BdrNBqpt747BJZx3Aq0795Fecp
	9p0fP0Kx2dO4Jx2Oj2UJ5eyOD04Ztuym8FA0spobomSfIPubdBQgyFDWPFq+4lCmZPmdpAuc60xy0
	rByVHOBgJh8jQcCZvkRGLxriMl/peaa3cnCD6L/dWkMkttPeyL9X0yogS2kNYdfR995Q=;
Message-ID: <78899eac-9de8-3626-8f40-98f993984f95@xen.org>
Date: Fri, 9 Jun 2023 09:48:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
Content-Language: en-US
To: Jiatong Shen <yshxxsjt715@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
 <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
 <e729d60e-b290-dec3-e35b-65c24ffbfda6@xen.org>
 <CALqm=ddc3BhqRQmPDjnZ3TeMEXPTMUDfj7JCSj0QEDxnMaKLvw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CALqm=ddc3BhqRQmPDjnZ3TeMEXPTMUDfj7JCSj0QEDxnMaKLvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 09/06/2023 03:32, Jiatong Shen wrote:
> Thank you for your answer. Can you teach me how to verify if acpi is
> enabled?

You usually look at the .config. But I am not sure if this is provided 
by the Debian package. If not, then your best option would be to build 
your own Xen. To select ACPI, you want to use the menuconfig and select 
UNSUPPORTED and ACPI.

Cheers,

-- 
Julien Grall

