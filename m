Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF775978339
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 17:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798273.1208448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7p4-0000U0-PP; Fri, 13 Sep 2024 15:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798273.1208448; Fri, 13 Sep 2024 15:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7p4-0000SE-LP; Fri, 13 Sep 2024 15:02:58 +0000
Received: by outflank-mailman (input) for mailman id 798273;
 Fri, 13 Sep 2024 15:02:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NjI=QL=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1sp7p3-0000S5-5j
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 15:02:57 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 413fc32d-71e1-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 17:02:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 44EC9828596A;
 Fri, 13 Sep 2024 10:02:54 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2qquTH-w2_PE; Fri, 13 Sep 2024 10:02:53 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8C03B82875BF;
 Fri, 13 Sep 2024 10:02:53 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id q93x6KSwFd7w; Fri, 13 Sep 2024 10:02:53 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 4634A828596A;
 Fri, 13 Sep 2024 10:02:52 -0500 (CDT)
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
X-Inumbo-ID: 413fc32d-71e1-11ef-99a2-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8C03B82875BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1726239773; bh=2UPf8z1PJcktp4puKNhpJclvhEBMDkC73dErzWBCJ6c=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=ubvMzt+yAls0MdiWXHb8cBetFFmwq+jRBBP5lfSnZsXIp/XzIAVNrNI5VBa4p/gh1
	 5IFLJ3D7FNJ7gKuLyGyLkaxsiKvzKa1EpZeM1AAEeiIf+smngYht9JuDOfBgR28hNm
	 FkkF8bEMmupu0hMVy7aysSYIEN8QmE1R+QhLG92A=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <40bf0d62-e711-4e01-8663-d6933070b51b@raptorengineering.com>
Date: Fri, 13 Sep 2024 10:02:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/bitops: Drop the remnants of hweight{8,16}()
From: Shawn Anastasio <sanastasio@raptorengineering.com>
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
 <64bc1f64-6145-407a-ab3d-13d21abd5ef0@raptorengineering.com>
Content-Language: en-US
In-Reply-To: <64bc1f64-6145-407a-ab3d-13d21abd5ef0@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/13/24 9:56 AM, Shawn Anastasio wrote:
> Hi Andrew,
> 
> On 9/4/24 5:55 PM, Andrew Cooper wrote:
>> They are no more.  No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> For the PPC parts:
> 
> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

My apologies, it seems these were already merged. Excuse the noise.

Thanks,
Shawn

