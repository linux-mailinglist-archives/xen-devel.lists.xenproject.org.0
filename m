Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2138C87D45F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 20:11:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694061.1082906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlCwQ-0000oS-F7; Fri, 15 Mar 2024 19:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694061.1082906; Fri, 15 Mar 2024 19:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlCwQ-0000m3-CC; Fri, 15 Mar 2024 19:10:06 +0000
Received: by outflank-mailman (input) for mailman id 694061;
 Fri, 15 Mar 2024 19:10:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rlCwO-0000Xq-Pc
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 19:10:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rlCwG-0001t9-9C; Fri, 15 Mar 2024 19:09:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rlCwF-0002bE-Vt; Fri, 15 Mar 2024 19:09:56 +0000
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
	bh=sgnd/LKnDObv7oG77bNP0S+oSMGArRJNgYRVwHSnbuY=; b=vCMmw7XOwCEXrxij6G56PisUrj
	PlSi4yft4Ez/QfrSNQcEe4H1svO+vd5vp4KYrl0owI9F+NH5jk4mgf6VR/GW6dQRgkPHRzf3qMdT5
	+Nf8KqwMWNKM0W2DACJc5w6EeYSK8N+IA3+HN5pLhRfUHBi0SA+PH/M6QhgO9VR9uIXM=;
Message-ID: <3914ac5b-2088-4b91-bd34-8a2c52c2c816@xen.org>
Date: Fri, 15 Mar 2024 19:09:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] Arm: annotate entry points with type and size
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <7871702a-b5ca-4430-b282-148b46fccc71@suse.com>
 <362fb92c-98a9-4ec8-a715-cebbc5321b36@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <362fb92c-98a9-4ec8-a715-cebbc5321b36@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 22/01/2024 13:22, Jan Beulich wrote:
> On 15.01.2024 15:36, Jan Beulich wrote:
>> Use the generic framework in xen/linkage.h. No change in generated code
>> except for the changed padding value (noticable when config.gz isn't a
>> multiple of 4 in size). Plus of course the converted symbols change to
>> be hidden ones.
>>
>> Note that ASM_INT() is switched to DATA(), not DATA_LOCAL(), as the only
>> use site wants the symbol global anyway.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>> ---
>> Only one each of the assembly files is being converted for now. More
>> could be done right here or as follow-on in separate patches.
> 
> As this was meanwhile committed, I'd like to understand you preference
> for further conversion steps: I can certainly see to find time to make
> some actual progress here, but it might also be that you prefer to do
> so yourself. Please let me know.

Sorry for the late reply. I will have a look.

Cheers,

-- 
Julien Grall

