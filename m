Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1512F8FD77D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 22:28:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735823.1141936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sExDo-0000Xn-JM; Wed, 05 Jun 2024 20:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735823.1141936; Wed, 05 Jun 2024 20:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sExDo-0000Vu-Ga; Wed, 05 Jun 2024 20:27:00 +0000
Received: by outflank-mailman (input) for mailman id 735823;
 Wed, 05 Jun 2024 20:26:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHzc=NH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1sExDm-0000Vo-Nh
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 20:26:58 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f23a187c-2379-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 22:26:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CEA7E82869FE;
 Wed,  5 Jun 2024 15:26:52 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1iaxEAGURnUV; Wed,  5 Jun 2024 15:26:52 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EE18E8285ACC;
 Wed,  5 Jun 2024 15:26:51 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id j0uVPfe7oJ36; Wed,  5 Jun 2024 15:26:51 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id F2C6E8285948;
 Wed,  5 Jun 2024 15:26:50 -0500 (CDT)
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
X-Inumbo-ID: f23a187c-2379-11ef-b4bb-af5377834399
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com EE18E8285ACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1717619212; bh=UHQKShSB8KrAmc93V/GRsQC9WMG9iNp7QrHeYLXfRm0=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=aIJudotdqWy+hRpyOqWU4J2p5HmHpx00iIVWAgJb/nkSQtcVo/p6TegLKIinCMpBp
	 GwXR0ohU9XlVLNONJNqQqDzdhveiyN1MAwx8jhjxkduJ1gJkJr50dysOMEo47EY0iE
	 Q9eB/JwLuB0HeXCPrPZeq2Pvn8G4u+FFkolSGUdU=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <72dff69f-2b20-4778-8a20-0f26408dc0dc@raptorengineering.com>
Date: Wed, 5 Jun 2024 15:26:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arch/irq: Make irq_ack_none() mandatory
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240530184027.44609-1-andrew.cooper3@citrix.com>
 <20240530184027.44609-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240530184027.44609-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 5/30/24 1:40 PM, Andrew Cooper wrote:
> Any non-stub implementation of these is going to have to do something here.
> 
> irq_end_none() is more complicated and has arch-specific interactions with
> irq_ack_none(), so make it optional.
> 
> For PPC, introduce a stub irq_ack_none().
> 
> For ARM and x86, export the existing {ack,end}_none() helpers, gaining an irq_
> prefix for consisntency with everything else in no_irq_type.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

For the PPC parts:

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>a

Thanks,
Shawn

