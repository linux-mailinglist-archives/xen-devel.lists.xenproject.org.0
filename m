Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1217FC829
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 22:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643543.1003836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85vV-0002W7-NE; Tue, 28 Nov 2023 21:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643543.1003836; Tue, 28 Nov 2023 21:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85vV-0002UG-Kc; Tue, 28 Nov 2023 21:47:29 +0000
Received: by outflank-mailman (input) for mailman id 643543;
 Tue, 28 Nov 2023 21:47:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r85vU-0002St-4v
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 21:47:28 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7baca9a-8e37-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 22:47:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9C2D4828557E;
 Tue, 28 Nov 2023 15:47:24 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nqVIkFJcR7mq; Tue, 28 Nov 2023 15:47:24 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EC85982857E9;
 Tue, 28 Nov 2023 15:47:23 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xsVYTUBjxhBZ; Tue, 28 Nov 2023 15:47:23 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 725B0828557E;
 Tue, 28 Nov 2023 15:47:23 -0600 (CST)
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
X-Inumbo-ID: b7baca9a-8e37-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com EC85982857E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701208044; bh=FaXMNdyythGojEAb0LkIthqPngbZvJlOSOHE21paz9Q=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Po2hfmhhcebIOp4MSD/iets/cY/3FpWe1dEL/Aibxm1UaHZJHhkUupSdShCFb3EJt
	 v0zOJ3n1v4sWjZ8ht9sFq9p7fS2Aa5lvRXVDu9TlYbNzTf1zmXppExN92q0VOzeLIn
	 1Rfa7sHz2wkc9eKBjD7Xd1IRX833atlMV+5rYvIY=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <9df9317b-868e-4926-b1b8-296f4b1b8f17@raptorengineering.com>
Date: Tue, 28 Nov 2023 15:47:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/14] xen/asm-generic: introduce generic hypercall.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <b08aeb05ae905d8ed0d61f3780e20c576950f96b.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <b08aeb05ae905d8ed0d61f3780e20c576950f96b.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> Introduce an empty generic hypercall.h for archs which don't
> implement it.
> 
> Drop PPC's hypercall.h and switch to generic one instead.

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

