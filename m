Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFDD4D5FAF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 11:35:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288935.490152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSccO-000773-JC; Fri, 11 Mar 2022 10:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288935.490152; Fri, 11 Mar 2022 10:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSccO-00074s-FI; Fri, 11 Mar 2022 10:35:32 +0000
Received: by outflank-mailman (input) for mailman id 288935;
 Fri, 11 Mar 2022 10:35:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nSccN-0006ob-4x
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 10:35:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSccM-0006Qs-TS; Fri, 11 Mar 2022 10:35:30 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.95.172.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSccM-0007u1-Ng; Fri, 11 Mar 2022 10:35:30 +0000
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
	bh=IG98Swik7wXbsek33e22yfMk0sIk2wuzdyxMp439xz4=; b=Js/QoM0PGuF9sdn5HB9IkYSkgt
	wSVqRnSPBP07CdtOOWw4+gKp+d5FT7X72jqBznMeadSjpAV1vK9C75cEfQsyCCRjx8gJ17yaNUPpc
	ii4OI9m/fTibM3GhYTu9bqaoJ91U4l93vrdj+X4OQxj7d9obs0jWqq03mTJhmblJtW6Y=;
Message-ID: <fe99c7b5-d897-d413-cc64-ee36eb578182@xen.org>
Date: Fri, 11 Mar 2022 10:35:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Subject: Re: [PATCH v6 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
To: Bjoern Doebel <doebel@amazon.de>, xen-devel@lists.xenproject.org
Cc: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <03798b67ec3a892a302e6be5d87ea676e6376036.1646897292.git.doebel@amazon.de>
 <81b800e254019ac3031e57307eea0ec422dc792f.1646897292.git.doebel@amazon.de>
From: Julien Grall <julien@xen.org>
In-Reply-To: <81b800e254019ac3031e57307eea0ec422dc792f.1646897292.git.doebel@amazon.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bjoern,

On 10/03/2022 07:35, Bjoern Doebel wrote:
> Xen enabled CET for supporting architectures. The control flow aspect of
> CET expects functions that can be called indirectly (i.e., via function
> pointers) to start with an ENDBR64 instruction. Otherwise a control flow
> exception is raised.
> 
> This expectation breaks livepatching flows because we patch functions by
> overwriting their first 5 bytes with a JMP + <offset>, thus breaking the
> ENDBR64. We fix this by checking the start of a patched function for
> being ENDBR64. In the positive case we move the livepatch JMP to start
> behind the ENDBR64 instruction.
> 
> To avoid having to guess the ENDBR64 offset again on patch reversal
> (which might race with other mechanisms adding/removing ENDBR
> dynamically), use the livepatch metadata to store the computed offset
> along with the saved bytes of the overwritten function.
> 
> Signed-off-by: Bjoern Doebel <doebel@amazon.de>
> Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ----
> Changes since r1:
> * (v2) use sizeof_field() to avoid unused variable warning
> * (v3) make metadata variable const in arch_livepatch_revert
> * (v4) rebase on top and make use of Andrew Cooper's was_endbr64() patch
> * (v5) use padding byte to store offset rather than reducing opaque area
> * (v6) style fixes

For the record, this patch depends on 
https://lore.kernel.org/xen-devel/20220308140126.8815-1-andrew.cooper3@citrix.com/.

Your patch will be merged once the prereq has been merged.

Cheers,

-- 
Julien Grall

