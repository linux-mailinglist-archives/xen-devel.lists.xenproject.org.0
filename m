Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D279019F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 19:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594720.928133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc8K8-0004w0-11; Fri, 01 Sep 2023 17:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594720.928133; Fri, 01 Sep 2023 17:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc8K7-0004tn-UQ; Fri, 01 Sep 2023 17:52:47 +0000
Received: by outflank-mailman (input) for mailman id 594720;
 Fri, 01 Sep 2023 17:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dN/X=ER=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qc8K6-0004th-0z
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 17:52:46 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 588107ae-48f0-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 19:52:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 65C4682869BC;
 Fri,  1 Sep 2023 12:52:40 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kJz7m8L4079d; Fri,  1 Sep 2023 12:52:39 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AF61582869C3;
 Fri,  1 Sep 2023 12:52:39 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BOqYLJSJWTBC; Fri,  1 Sep 2023 12:52:39 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 4FEF882869BC;
 Fri,  1 Sep 2023 12:52:39 -0500 (CDT)
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
X-Inumbo-ID: 588107ae-48f0-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com AF61582869C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693590759; bh=0XDFDG0Pvv2a9icifvrij9NIn+EyWrsgWkSPj6li4Yk=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=dte33sEVpLOPK3XthDxt5YGLGjce8vJ6t3fZ9qPHe70KWqmgt3wh+/f9aIFgwBCCo
	 AaoQqaRKOm0PIIe55Jh+iS+JaDu0mRwk21k824VbUUgR1IcmU4ILM5Ch2AOFCkDIHW
	 9W4cLwOZd/VNcc+batKD5SQjzD6fdCOHK5sLNgUY=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <cbcf7cff-5832-dcb6-4050-26f5fb10cd02@raptorengineering.com>
Date: Fri, 1 Sep 2023 12:52:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 3/3] xen/ppc: Implement initial Radix MMU support
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1692744718.git.sanastasio@raptorengineering.com>
 <7cebc2962002c36ecfe712bf1bcb251e083910b8.1692744718.git.sanastasio@raptorengineering.com>
 <e942f853-3536-2033-f214-1beccdfc8240@suse.com>
 <8a9c0fba-132b-1245-caf7-d4a3a670e9d9@raptorengineering.com>
In-Reply-To: <8a9c0fba-132b-1245-caf7-d4a3a670e9d9@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/23/23 12:36 PM, Shawn Anastasio wrote:
> On 8/23/23 9:04 AM, Jan Beulich wrote:
>> On 23.08.2023 01:03, Shawn Anastasio wrote:
>>> Add code to construct early identity-mapped page tables as well as the
>>> required process and partition tables to enable the MMU.
>>>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>

Just a quick ping to see if you are still good to merge this patch. If
you'd like me to submit a new revision let me know.

