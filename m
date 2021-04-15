Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7CB360525
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 11:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110948.212002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWxsl-0005iV-Ol; Thu, 15 Apr 2021 09:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110948.212002; Thu, 15 Apr 2021 09:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWxsl-0005i6-Li; Thu, 15 Apr 2021 09:01:51 +0000
Received: by outflank-mailman (input) for mailman id 110948;
 Thu, 15 Apr 2021 09:01:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWxsk-0005i1-4R
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 09:01:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2147e1ec-440b-4527-9fa2-b88d7d6a551f;
 Thu, 15 Apr 2021 09:01:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22FA5B1C8;
 Thu, 15 Apr 2021 09:01:48 +0000 (UTC)
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
X-Inumbo-ID: 2147e1ec-440b-4527-9fa2-b88d7d6a551f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618477308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJhsFj8MoezBXk55AScqMMgujbMia8lGW5o+U8IiPCw=;
	b=n5Xmmz6QogDUpGT3pIjh6zPIN6DncfFIL+cZ2DmVIaAOyrWQeDuG4CoNV1SoJbfSwIA1Fk
	ASCpAm4QfvlzRIuBHf9kl7qo8Qd2hna2rpgQO7XGf9DzCXvTWtKx2UGLVnV6xirc2Z74/i
	zZpJwJYiSU2qxb88VbgmWJrJ6lMwwDI=
Subject: Re: [PATCH v4 1/2] x86/vtx: add LBR_SELECT to the list of LBR MSRs
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 jun.nakajima@intel.com, kevin.tian@intel.com, xen-devel@lists.xenproject.org
References: <1618375222-9283-1-git-send-email-igor.druzhinin@citrix.com>
 <871c259b-487e-4c67-e648-b1aefef55df3@suse.com>
 <45ab2093-f140-1b91-f683-dc0ca17159c5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6acd1b4b-761e-4835-e28c-c1f504113af7@suse.com>
Date: Thu, 15 Apr 2021 11:01:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <45ab2093-f140-1b91-f683-dc0ca17159c5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 01:13, Igor Druzhinin wrote:
> On 14/04/2021 12:41, Jan Beulich wrote:
>> On 14.04.2021 06:40, Igor Druzhinin wrote:
>>> --- a/xen/include/asm-x86/msr-index.h
>>> +++ b/xen/include/asm-x86/msr-index.h
>>> @@ -606,14 +606,18 @@
>>>   #define NUM_MSR_C2_LASTBRANCH_FROM_TO	4
>>>   #define NUM_MSR_ATOM_LASTBRANCH_FROM_TO	8
>>>   
>>> +/* Nehalem (and newer) last-branch recording */
>>> +#define MSR_NHL_LBR_SELECT		0x000001c8
>>> +#define MSR_NHL_LASTBRANCH_TOS		0x000001c9
>>> +
>>>   /* Skylake (and newer) last-branch recording */
>>> -#define MSR_SKL_LASTBRANCH_TOS		0x000001c9
>>>   #define MSR_SKL_LASTBRANCH_0_FROM_IP	0x00000680
>>>   #define MSR_SKL_LASTBRANCH_0_TO_IP	0x000006c0
>>>   #define MSR_SKL_LASTBRANCH_0_INFO	0x00000dc0
>>>   #define NUM_MSR_SKL_LASTBRANCH		32
>>>   
>>>   /* Goldmont last-branch recording */
>>> +#define MSR_GM_LBR_SELECT		0x000001c8
>>>   #define MSR_GM_LASTBRANCH_TOS		0x000001c9
>>
>> Wouldn't it make sense to also re-use the NHL constants, like you
>> do for Skylake?
> 
> I didn't really see GM to be derived from NHL so decided to split those. 

Hmm, yes - fair argument.

Jan

