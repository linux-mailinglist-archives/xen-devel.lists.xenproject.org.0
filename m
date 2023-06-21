Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2514C739097
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 22:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553132.863511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC4BU-0007nN-Kt; Wed, 21 Jun 2023 20:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553132.863511; Wed, 21 Jun 2023 20:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC4BU-0007l3-HY; Wed, 21 Jun 2023 20:12:08 +0000
Received: by outflank-mailman (input) for mailman id 553132;
 Wed, 21 Jun 2023 20:12:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gfgj=CJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qC4BT-0007kx-Rp
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 20:12:07 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e41955a2-106f-11ee-b237-6b7b168915f2;
 Wed, 21 Jun 2023 22:12:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5D1D58285A31;
 Wed, 21 Jun 2023 15:12:04 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gZCbq_h6QiMZ; Wed, 21 Jun 2023 15:12:03 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BCBF28285AEB;
 Wed, 21 Jun 2023 15:12:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id A6Wa_5J2Ih8x; Wed, 21 Jun 2023 15:12:03 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id EF9D98285A31;
 Wed, 21 Jun 2023 15:12:02 -0500 (CDT)
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
X-Inumbo-ID: e41955a2-106f-11ee-b237-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com BCBF28285AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687378323; bh=El/S7mI/eZT7BPsJJMdD4cpepwcNxa7bIe4e+Dx92ZM=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=KLS6M28W86qpYMY0qEEnU+5NCOlaD0otqW4z8I9YLUJRLFPN1baFmITujb4rC/EQq
	 gtoitXzvDTqiH9C8pMMVac39Lfh6qlXdw1RXs6sfoglFK3J50/+CDUuvpM2I9rT27G
	 mBErkaEYaNAKxJ5LjeHSqHD/SYMCLKUIWoUoL+Nc=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <9085f41f-404b-b1e4-1a48-b79bd0a273fb@raptorengineering.com>
Date: Wed, 21 Jun 2023 15:12:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
 <692e2955-a85d-3c6c-7730-962956f6ebf6@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <692e2955-a85d-3c6c-7730-962956f6ebf6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/21/23 12:54 PM, Andrew Cooper wrote:
> I've noticed a couple of other things.  asm/types.h repeats some
> antipatterns which we're trying to delete for MISRA reasons in other
> architectures.  I was already planning to fix that up xen-wide, and I
> guess now is the better time to do so.

Could you elaborate on the changes you'd like to see in types.h?

Thanks,
Shawn


