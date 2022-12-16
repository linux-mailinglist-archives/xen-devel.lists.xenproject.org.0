Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F14664E832
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 09:39:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464201.722576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p66F8-0006wU-9X; Fri, 16 Dec 2022 08:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464201.722576; Fri, 16 Dec 2022 08:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p66F8-0006u3-6h; Fri, 16 Dec 2022 08:38:58 +0000
Received: by outflank-mailman (input) for mailman id 464201;
 Fri, 16 Dec 2022 08:38:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p66F6-0006tu-He
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 08:38:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p66F4-0005lt-IK; Fri, 16 Dec 2022 08:38:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p66F4-0005YR-Bf; Fri, 16 Dec 2022 08:38:54 +0000
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
	bh=2Rlbhk+6FKycd6UR3fDXebKYvseNfVn6dicf0TCloFw=; b=atf3QzgHrAWjzvON9NEgAyUsEB
	Uk0cPaIuAIg5k8zHlwGwOmLgWlZybtH+uyA0y7EBQD2RcMAsyuv9bZPyGS6yN7PlKCq20Fvs0GPUc
	n6RF/QyuLQzbZ0xy88BaBsaL3LC26xQaiO37eBhqBy6YkY4Amr/wrhDK8e10HApdeMzE=;
Message-ID: <7a7a7156-138d-a53c-fb65-a210e14bd8c1@xen.org>
Date: Fri, 16 Dec 2022 08:38:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Smith, Jackson" <rsmith@RiversideResearch.org>,
 "Brookes, Scott" <sbrookes@RiversideResearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "demi@invisiblethingslab.com" <demi@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
 <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
 <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2212151725090.315094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 16/12/2022 01:46, Stefano Stabellini wrote:
> On Thu, 15 Dec 2022, Julien Grall wrote:
>>>> On 13/12/2022 19:48, Smith, Jackson wrote:
>>> Yes, we are familiar with the "secret-free hypervisor" work. As you
>>> point out, both our work and the secret-free hypervisor remove the
>>> directmap region to mitigate the risk of leaking sensitive guest
>>> secrets. However, our work is slightly different because it additionally
>>> prevents attackers from tricking Xen into remapping a guest.
>>
>> I understand your goal, but I don't think this is achieved (see above). You
>> would need an entity to prevent write to TTBR0_EL2 in order to fully protect
>> it.
> 
> Without a way to stop Xen from reading/writing TTBR0_EL2, we cannot
> claim that the guest's secrets are 100% safe.
> 
> But the attacker would have to follow the sequence you outlines above to
> change Xen's pagetables and remap guest memory before accessing it. It
> is an additional obstacle for attackers that want to steal other guests'
> secrets. The size of the code that the attacker would need to inject in
> Xen would need to be bigger and more complex.

Right, that's why I wrote with a bit more work. However, the nuance you 
mention doesn't seem to be present in the cover letter:

"This creates what we call "Software Enclaves", ensuring that an 
adversary with arbitrary code execution in the hypervisor STILL cannot 
read/write guest memory."

So if the end goal if really to protect against *all* sort of arbitrary 
code, then I think we should have a rough idea how this will look like 
in Xen.

 From a brief look, it doesn't look like it would be possible to prevent 
modification to TTBR0_EL2 (even from EL3). We would need to investigate 
if there are other bits in the architecture to help us.

> 
> Every little helps :-)

I can see how making the life of the attacker more difficult is 
appealing. Yet, the goal needs to be clarified and the risk with the 
approach acknowledged (see above).

Cheers,

-- 
Julien Grall

