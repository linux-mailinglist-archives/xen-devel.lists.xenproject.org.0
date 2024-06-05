Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE48FD780
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 22:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735827.1141946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sExEr-000134-Tb; Wed, 05 Jun 2024 20:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735827.1141946; Wed, 05 Jun 2024 20:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sExEr-00010u-Pi; Wed, 05 Jun 2024 20:28:05 +0000
Received: by outflank-mailman (input) for mailman id 735827;
 Wed, 05 Jun 2024 20:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHzc=NH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1sExEq-00010k-45
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 20:28:04 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ad934c6-237a-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 22:28:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4F7AA8285ACC;
 Wed,  5 Jun 2024 15:28:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id La4VdzBDQAWB; Wed,  5 Jun 2024 15:28:00 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BF0F482869FE;
 Wed,  5 Jun 2024 15:28:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MobF6J5eMZOq; Wed,  5 Jun 2024 15:28:00 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 4F11C8285ACC;
 Wed,  5 Jun 2024 15:28:00 -0500 (CDT)
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
X-Inumbo-ID: 1ad934c6-237a-11ef-b4bb-af5377834399
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com BF0F482869FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1717619280; bh=nT0TSE96TWclU2WO/Nun9iRIbaynReohYzDwTveB5w8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=OTotUUfEX1113DzgA844keWo/YBUmGCy76/cgIB5LJHEo5onFmzkNLS1ELu0jtxkx
	 gy01assCrVHjis4HXv84J4jAZtqlUH+qN1LYzFj/63XTD2n7YNaTZAUZrbnk91tCEW
	 Y+ArBspS8YYVL/AvqDoI2vnetQ3dYfF99VCLG6J4=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <c4482613-35b5-48df-9154-0caab5c47b6d@raptorengineering.com>
Date: Wed, 5 Jun 2024 15:27:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arch/irq: Centralise no_irq_type
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240530184027.44609-1-andrew.cooper3@citrix.com>
 <20240530184027.44609-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240530184027.44609-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 5/30/24 1:40 PM, Andrew Cooper wrote:
> Having no_irq_type defined per arch, but using common callbacks is a mess, and
> particualrly hard to bootstrap a new architecture with.
> 
> Now that the ack()/end() hooks have been exported suitably, move the
> definition of no_irq_type into common/irq.c, and into .rodata for good
> measure.
> 
> No functional change, but a whole lot less tangled.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

