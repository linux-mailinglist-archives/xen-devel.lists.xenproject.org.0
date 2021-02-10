Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A352E316C4D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 18:16:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83676.156342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9t5y-0004Gm-Qj; Wed, 10 Feb 2021 17:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83676.156342; Wed, 10 Feb 2021 17:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9t5y-0004GN-Ne; Wed, 10 Feb 2021 17:16:06 +0000
Received: by outflank-mailman (input) for mailman id 83676;
 Wed, 10 Feb 2021 17:16:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9t5y-0004GI-1N
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:16:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2731210-5bbb-432c-8478-24331b56d369;
 Wed, 10 Feb 2021 17:16:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC586B151;
 Wed, 10 Feb 2021 17:16:03 +0000 (UTC)
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
X-Inumbo-ID: d2731210-5bbb-432c-8478-24331b56d369
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612977363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=agRYBhrxy++kck7dfeb0DC0QtkzXEFQPjjTaKrqB02Q=;
	b=Px1pEEuyrJqtMuMzmlk6AmnUrjzFRJ79ZYymcvdKMPOnPW3vKNLx7oj+I4pu/BPFklgs2d
	RcGXP+T+37CiLKYmxjPR/5XphU90HFMkotnSkxQI7EYLlNjWFx5Dv7TrtRKbe9h8rpjNJM
	6W3btDcS4P/McAEf8577VYME6qmI53M=
Subject: Re: [PATCH] VMX: use a single, global APIC access page
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <3c7a4cff-3f11-22e1-ed46-e76f62cc08f4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65d2fe51-a7c5-b6f4-ed6a-430b51db6595@suse.com>
Date: Wed, 10 Feb 2021 18:16:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3c7a4cff-3f11-22e1-ed46-e76f62cc08f4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.02.2021 18:00, Andrew Cooper wrote:
> On 10/02/2021 16:48, Jan Beulich wrote:
>> The address of this page is used by the CPU only to recognize when to
>> instead access the virtual APIC page instead. No accesses would ever go
>> to this page. It only needs to be present in the (CPU) page tables so
>> that address translation will produce its address as result for
>> respective accesses.
>>
>> By making this page global, we also eliminate the need to refcount it,
>> or to assign it to any domain in the first place.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> How certain are you about this?
> 
> It's definitely not true on AMD's AVIC - writes very definitely end up
> in the backing page if they miss the APIC registers.

Doesn't this require a per-vCPU page then anyway? With a per-domain
one things can't work correctly in the case you describe.

Jan

