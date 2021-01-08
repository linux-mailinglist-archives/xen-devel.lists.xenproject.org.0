Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A2E2EF05D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 11:03:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63269.112351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxobw-0000rA-T1; Fri, 08 Jan 2021 10:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63269.112351; Fri, 08 Jan 2021 10:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxobw-0000ql-Pg; Fri, 08 Jan 2021 10:03:12 +0000
Received: by outflank-mailman (input) for mailman id 63269;
 Fri, 08 Jan 2021 10:03:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxobu-0000qf-OA
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 10:03:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59898c1c-9778-436a-a8be-6fe107f22aa7;
 Fri, 08 Jan 2021 10:03:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1626FAD87;
 Fri,  8 Jan 2021 10:03:09 +0000 (UTC)
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
X-Inumbo-ID: 59898c1c-9778-436a-a8be-6fe107f22aa7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610100189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ce+mOxYROL6lqj3faNT9muZTacwQAJZAP4zVoigDY4=;
	b=Z72c13Tot34a8j1YUw2cHKhU8pV0ldcifszivdCLZgwvCriCfxGX8sWceT/dR2kA444YHk
	Vm7GSeWRT/kDcNf/cP2x58LNRbG5eBsSfqobxrtZIXG+JR9I4z7pBJWeI+Y9oE5BppumVD
	1oHs6S1YwcIgsr6hddGIvjrRvYYFsg0=
Subject: Re: [PATCH v3] x86/intel: insert Ice Lake-X (server) and Ice Lake-D
 model numbers
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 jun.nakajima@intel.com, kevin.tian@intel.com, xen-devel@lists.xenproject.org
References: <1608755520-1277-1-git-send-email-igor.druzhinin@citrix.com>
 <b0c7ccb7-32b8-a022-72ad-274e0a0c6dca@suse.com>
 <f33f0756-12a3-f20d-52b6-871ba2238b64@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b114e22e-1349-5562-db49-5d35a389f671@suse.com>
Date: Fri, 8 Jan 2021 11:03:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f33f0756-12a3-f20d-52b6-871ba2238b64@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.01.2021 03:17, Igor Druzhinin wrote:
> On 06/01/2021 11:04, Jan Beulich wrote:
>> On 23.12.2020 21:32, Igor Druzhinin wrote:
>>> LBR, C-state MSRs should correspond to Ice Lake desktop according to
>>> External Design Specification vol.2 for both models.
>>>
>>> Ice Lake-X is known to expose IF_PSCHANGE_MC_NO in IA32_ARCH_CAPABILITIES MSR
>>> (confirmed on Whitley SDP) which means the erratum is fixed in hardware for
>>> that model and therefore it shouldn't be present in has_if_pschange_mc list.
>>> Provisionally assume the same to be the case for Ice Lake-D.
>>
>> I did find Ice Lake D EDS, and it confirms the respective additions.
>> In the course I also found the "plain" Ice Lake EDS, and it seems to
>> contradict SDM vol 4 in that it doesn't list CC3_RESIDENCY (0x3FC).
>> For now I guess we can consider this a doc error.
>>
>> I didn't find Ice Lake-X EDS, though.
> 
> You may search "Ice Lake server eds volume 2".

Right, that's one of the many things I had tried. Yields only
Ice Lake-D EDSes ... I can only assume I'm not entitled to see
the server ones.

Jan

