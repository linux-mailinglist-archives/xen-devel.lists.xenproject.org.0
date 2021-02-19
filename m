Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2C031FCF4
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 17:17:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86968.163722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8Sf-0007M0-T8; Fri, 19 Feb 2021 16:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86968.163722; Fri, 19 Feb 2021 16:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD8Sf-0007Lh-Pi; Fri, 19 Feb 2021 16:16:57 +0000
Received: by outflank-mailman (input) for mailman id 86968;
 Fri, 19 Feb 2021 16:16:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD8Se-0007Lc-Ev
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 16:16:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a12b14bb-5534-4e53-a73a-2a9c777b8bd3;
 Fri, 19 Feb 2021 16:16:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E89E7AC6E;
 Fri, 19 Feb 2021 16:16:54 +0000 (UTC)
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
X-Inumbo-ID: a12b14bb-5534-4e53-a73a-2a9c777b8bd3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613751415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tBkMQYeVZQwzEvmOaxxs4K2wmCKetPkqRG4QRy5Q4tw=;
	b=Sd2O2v66TsNXNIAYSZ/Bbs6qxaJxvAFIOc6Eck9YbUz30UDmYTYtRC+WRk3xbAlxhc+aoH
	5t9qEmvLITpdodIoxUxbNOr4wO/CCJs4DPeOfuxHX0McDeprrq43KuZPvEypyht9auH+zS
	wlPPSc5Hezt4DLFNh/K0m7Ce4A3qMUw=
Subject: Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest
 accessors
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <24623.56913.290437.499946@mariner.uk.xensource.com>
 <381560e0-e108-c77a-7c43-ae6eb559bba9@suse.com>
 <24623.58260.98531.223090@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fbac488e-383c-c5a9-585a-6609b81e7acc@suse.com>
Date: Fri, 19 Feb 2021 17:16:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24623.58260.98531.223090@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.02.2021 17:13, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest accessors"):
>> On 19.02.2021 16:50, Ian Jackson wrote:
>>> You say "consistency" but in practical terms, what will happen if the
>>> code is not "conxistent" in this sense ?
>>
>> Patches 4-6: The code is harder to understand with the mix of names.
>> Backports from future versions to 4.15 may require more attention to
>> get right (and then again the same level of attention when moving to
>> 4.14).
>>
>> Patches 7 is simply a minor improvement. Patch 8 is an equivalent
>> of the one patch of the earlier version which has already gone in.
>> Just like that other one it's more to avoid a latent issue than any
>> active one.
> 
> Thank you for this clear explanation.
> 
> I think 4-6 and 8 are good candidates for the reasons you give, and
> because they seem low risk to me.  Have you used any automatic
> techniques to check that there is no unintentional codegen change ?
> (Eg, binary diffs, diffing sedderied versions, or something.)

I did some manual inspection at the time of putting together that
work, but nothing further to be honest.

> To my naive eye patch 7 looks scary because it might be moving the
> scope of a critical section.  Am I wrong about that ?

At the source level it moves things, yes. Generated code, again as
per manual inspection, doesn't change, due to the pieces that the
compiler is able to eliminate. So I guess it's not as scary as it
may look.

Jan

