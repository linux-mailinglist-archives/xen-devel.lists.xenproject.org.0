Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1ADAC26D0
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 17:50:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995913.1377996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIUeO-0006im-Bg; Fri, 23 May 2025 15:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995913.1377996; Fri, 23 May 2025 15:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIUeO-0006gp-96; Fri, 23 May 2025 15:49:36 +0000
Received: by outflank-mailman (input) for mailman id 995913;
 Fri, 23 May 2025 15:49:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bypj=YH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1uIUeM-0006gh-9V
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 15:49:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cb51faa-37ed-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 17:49:18 +0200 (CEST)
Received: from [192.168.1.113] (93-36-220-193.ip62.fastwebnet.it
 [93.36.220.193]) (Authenticated sender: federico)
 by support.bugseng.com (Postfix) with ESMTPSA id F07554EE7BD7;
 Fri, 23 May 2025 17:49:16 +0200 (CEST)
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
X-Inumbo-ID: 7cb51faa-37ed-11f0-b892-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.36.220.193
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1748015358;
	b=WyDj1HBuySEiT3i17PxzAc9WrDx3X7l7YQqEdHQ05RQGTTt2YNQWDcDXHgO9slYIZF4d
	 EG1wu1kUDxGXSAuN3l4Ye9vFA7uW5uDPZx1vBGCe6rQc7KA6zHVLFmgTqcIdzBTJrpt1p
	 1kK6n9ZZ/ilXsfFf3m3o6frR++q2BgreKSq1xwTVfZrrlbxLVliMnB07syr+QedMmx7Sb
	 SUz1KPwsf/4E7Mw1xrEgDNWxc+NE5xIYgD6q55mjDkVETWuVhWf3RQeWMppDxI8Ld45Z7
	 GSf6xhJTcGgMT9zFlrVTJQ9OQYwyNxLO8kPKb9THq87NnMe6y1zhXl5LSvJgpnWaRPo8b
	 reDcysuvEnpWto8jRmkG4vlizzO116byryVuMOGgavtCwQOjbKYrp7IiJo2WwmirPwYLt
	 tjEdf+rKI6X6nHG9SkahFSdgGjCygvtmzTx6gyXZXiK/2hh5LSTTp1zKpPeiqXAATHvUb
	 +pH/zX+Y9UwSFEbSXdhxtx5iVNU44TmLM8XEVrbhPRMAVfSwU5J3WvgmcVpKuWN0jlPM+
	 fajYBSkdS3cMjIVFRWeeQkeOKgB0SCMcy8gwwtJsr8sDz1Gez9Nw3jO1LYz0W7U0CcZym
	 qiYXm2bSHoagcsa+3V/ICAiJCwUxF5MFOntoxk+1uyY8Zv4YHkG7XN6axDqpiZ0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1748015358;
	h=DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DHB7xELPQb6xTpfcv4i+qjGK9XFnqTIs65litDkrJIw=;
	b=WPC+t4/gealOHiCR41pvlHP5cYpEkGuyFZX4p+A9ZvuprPODLTYUhjvDomfYK2rl+AXQ
	 jMGGtaceMzxG376Y+OhWGfLpQ2YM2ONT3pOGlEcobnWgk0Eahx0s6RPzaX5MF3PI6tSNt
	 VaRuxMlzptS3tWEfPt1ZsSFKpUjBH4hHCKkhf/bBJPUCDuoIADBHEuHNFRjFQTDnOXMfn
	 5dU/7IxR5viN85i0GPwgHMpdFZ9el/zRhIgCXCD3vmiQqQX3VMtLpRVMmrphfFfVIPAXW
	 OucCHnXKE5roeviwlimiJ5mOu1oY1bPtKdc7Xi94Z5FgSxI2IW38EhaBcs+85V3w5rePs
	 ezo6/q5+QIL/ZyYY9eFphHWp28n2NJKgbxrP7eNDOyeZI2w7m2/Cab3ecIi3EPDhYADaC
	 Rxo6bp4qW09kuYkB/y7YIUqvdXeQFei0IHYT01Q3mqah85VRQkmu5xfAYPqKAY21mOFmU
	 kt0DmGkoUNnjzMjzG3W0h8gOcsFwaOAJ9Kg8bj/RY+kG7ZCOCDiqnei74bjIdVa0rQc6s
	 qFhTmfTATHQBb6QApJ6S/MOQ3mKnfLvJWbiNdixu9wEGspWiEPGWM6K2PoYN/Rpt2ocvj
	 BZAwy99ipHiK9BOVEs+AsjNW/hbGLZj0shQLfPuJriODFX6nSsrDCBZyXy+vGpQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.36.220.193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1748015358; bh=26v7dN7ZyGhNwwgmpGQ00pfxTGoocFLFJoN48GMDJOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N4NTslKsCPudVLvfWf9AiaYt2CE5ujLXAp/JrAgvJBQMktMPc9HSyTiqgSkyLRzts
	 0fYebHVFu9RZEu2oh/sUzEDzi6+KB4puvAwKnoD5cgCS4BmDtqJOSdcVsbsa0HUG/J
	 a97SK7CJoLAM2ZUwnIcEqmsC8F10diWw+uVgSvuVs8x4MUcfvvZRbfQ0sEVkxn/hs0
	 IBX1uy1vY0HKTE/tfFTzphSTh3VCM1PHLS2mVnC/FW3H3Im9PwiaZzJiZmMjr/TulF
	 6KtSAn8EWmxwQcodg0m53zYlrOFOaKkZcZSMtmBZt1fYdSazZJIGEql1ocJ4xiRLx6
	 R0FyO1/bYyOaA==
Message-ID: <c241a3cf-27ac-4939-a2ea-acd2beebb223@bugseng.com>
Date: Fri, 23 May 2025 17:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] automation/eclair: update configuration of D4.10
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com, jbeulich@suse.com,
 julien@xen.org, roger.pau@citrix.com, bertrand.marquis@arm.com
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
 <20250516232130.835779-6-stefano.stabellini@amd.com>
 <5c2aa885-8877-4708-90cc-d65a76b729b3@citrix.com>
 <ac9179ed-32b5-4b80-9fb2-2f3e8012afe2@bugseng.com>
 <alpine.DEB.2.22.394.2505191436160.145034@ubuntu-linux-20-04-desktop>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2505191436160.145034@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/05/25 23:36, Stefano Stabellini wrote:
> On Mon, 19 May 2025, Federico Serafini wrote:
>> Hi,
>>
>> On 17/05/25 01:57, Andrew Cooper wrote:
>>>
>>>> +-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated
>>>> file, do not edit! \\*/$, begin-2))"}
>>>>    -config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated
>>>> file, do not edit! \\*/$, begin-3))"}
>>>
>>> These seem to only differ by the begin-$N.  Why doesn't the regex work
>>> in both cases?
>>
>> "begin-N" expresses the position of a single line, not a range.
>> For example, begin-2 means "two lines before the first reported area"
>> and deviates:
>>
>> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/X86_64/10063944407/PROJECT.ecd;/sources/xen/include/xen/hypercall-defs.h.html#R174_1{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":false,"selector":{"enabled":true,"negated":false,"kind":2,"children":[]}}}
>>
>> If you prefer, I think we can use ranges and merge the two
>> configurations.
> 
> I think that would be better


The configurations can be merged into a single one:

-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated 
file, do not edit! \\*/$, begin-3...begin-2))"}

-- 
Federico Serafini, MSc
Software Engineer, BUGSENG (https://bugseng.com)
LinkedIn: https://linkedin.com/in/federico-serafini


