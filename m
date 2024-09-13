Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F12D978307
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 16:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798263.1208418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7jJ-0006J0-Np; Fri, 13 Sep 2024 14:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798263.1208418; Fri, 13 Sep 2024 14:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7jJ-0006G0-L2; Fri, 13 Sep 2024 14:57:01 +0000
Received: by outflank-mailman (input) for mailman id 798263;
 Fri, 13 Sep 2024 14:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NjI=QL=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1sp7jI-0006Eg-OG
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 14:57:00 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c912fa7-71e0-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 16:56:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 636B08286805;
 Fri, 13 Sep 2024 09:56:57 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Rdvt9GqFln2w; Fri, 13 Sep 2024 09:56:56 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9D8F8828570D;
 Fri, 13 Sep 2024 09:56:56 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PMyGDivUkHzK; Fri, 13 Sep 2024 09:56:56 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C12B482856E5;
 Fri, 13 Sep 2024 09:56:55 -0500 (CDT)
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
X-Inumbo-ID: 6c912fa7-71e0-11ef-99a2-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 9D8F8828570D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1726239416; bh=0HpECOm+w1am0fRscRuL87NutJZR1CrTwuUzc9VR1c8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=bc959BGQJANO2aVjfcOqVtdQe/en2j4JDb26Onjh/VAK8TYG9RsjwUoioto1nldWe
	 1w8EBqULYcRdbyTRShBzFv/3IDNCkPeKMbJxQDfJUwAx491ra1GRhYf4gNiw/1NezM
	 tj9u/O+P/z0xJtCWUDuqWmB6jaq42JW9Vz5EUMQQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <64bc1f64-6145-407a-ab3d-13d21abd5ef0@raptorengineering.com>
Date: Fri, 13 Sep 2024 09:56:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/bitops: Drop the remnants of hweight{8,16}()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
 <20240904225530.3888315-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240904225530.3888315-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 9/4/24 5:55 PM, Andrew Cooper wrote:
> They are no more.  No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

For the PPC parts:

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

