Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 067D176C169
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 02:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574628.900093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzUA-00064O-AO; Wed, 02 Aug 2023 00:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574628.900093; Wed, 02 Aug 2023 00:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzUA-00062O-7c; Wed, 02 Aug 2023 00:13:06 +0000
Received: by outflank-mailman (input) for mailman id 574628;
 Wed, 02 Aug 2023 00:13:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOIS=DT=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQzU8-00062C-Un
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 00:13:04 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59017bab-30c9-11ee-b25c-6b7b168915f2;
 Wed, 02 Aug 2023 02:13:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4393B8285491;
 Tue,  1 Aug 2023 19:13:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8FFkcEg6oGCh; Tue,  1 Aug 2023 19:13:02 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 29C28828573A;
 Tue,  1 Aug 2023 19:13:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3I6xQspQvnn6; Tue,  1 Aug 2023 19:13:02 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id BB5188285491;
 Tue,  1 Aug 2023 19:13:01 -0500 (CDT)
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
X-Inumbo-ID: 59017bab-30c9-11ee-b25c-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 29C28828573A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690935182; bh=ZlK/EaXWdc0s8a3b4yh4TLuSDzNdwGh+7w7fL5yZcNk=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=JoAKtIXP4hVsvk85RzyftPBFQYDxslf8hMlipuuU8F7RoEL46OhDLAM6pv/jChX7a
	 Fp4a49wyOeIUqcXuyYriKXeI9jiCT37j7riDJV0YxbJPdK/qS9W21IMkE9ZB6evVh5
	 vxyOl4hzeIlJENxyjTIOJMyGPYsFb9fYHJ6gWVX8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <70d8e49c-df00-6243-f5f7-066dd56312f2@raptorengineering.com>
Date: Tue, 1 Aug 2023 19:13:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] xen/ppc: Add PowerNV bare metal support
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1690934409.git.sanastasio@raptorengineering.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <cover.1690934409.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/1/23 7:11 PM, Shawn Anastasio wrote:
> Hello all,

Apologies, the subject should indicate that this is a v2 but I forgot to
pass the appropriate argument to git-send-email.

Thanks,
Shawn

