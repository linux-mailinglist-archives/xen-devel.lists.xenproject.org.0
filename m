Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A883B80B5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 12:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148175.273784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyXCs-0007M5-Qh; Wed, 30 Jun 2021 10:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148175.273784; Wed, 30 Jun 2021 10:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyXCs-0007KF-NK; Wed, 30 Jun 2021 10:12:34 +0000
Received: by outflank-mailman (input) for mailman id 148175;
 Wed, 30 Jun 2021 10:12:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lyXCr-0007K7-Ii
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 10:12:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyXCq-0002pF-7v; Wed, 30 Jun 2021 10:12:32 +0000
Received: from [54.239.6.179] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyXCq-0004lX-1N; Wed, 30 Jun 2021 10:12:32 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=HZCwDAKbLzZbVr7mwaHy+G9eCxYYF+xmY7QGTSDDT/4=; b=5LvEsLWLParcWrV0KPVRGl6fp/
	LimI21EkHF5w7h9sBgkFmKEC/evFhy28CEClNP3WlnDQJsQquH+uA9IdmHMtbgGuU2RK4D8Dpx86/
	fGntPejyI8FepxcoPbzfVJleufqYTssL6X7l7DUwZRUI1pY6dEKL5/hTIlZrrrLJVEzY=;
Subject: Re: [XEN PATCH v2] libxl/arm: provide guests with random seed
From: Julien Grall <julien@xen.org>
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20210527085233.69917-1-Sergiy_Kibrik@epam.com>
 <78b26e15-a3ca-e218-9afa-9f443e234260@xen.org>
Message-ID: <658a814d-2a99-00ff-8855-134a1e707e97@xen.org>
Date: Wed, 30 Jun 2021 11:12:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <78b26e15-a3ca-e218-9afa-9f443e234260@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 03/06/2021 14:08, Julien Grall wrote:
> Hi,
> 
> On 27/05/2021 09:52, Sergiy Kibrik wrote:
>> Pass 128 bytes of random seed via FDT, so that guests' CRNGs are 
>> better seeded
>> early at boot. This is larger than ChaCha20 key size of 32, so each 
>> byte of
>> CRNG state will be mixed 4 times using this seed. There does not seem 
>> to be
>> advantage in larger seed though.
>>
>> Depending on its configuration Linux can use the seed as device 
>> randomness
>> or to just quickly initialize CRNG.
>> In either case this will provide extra randomness to further harden CRNG.
>>
>> CC: Julien Grall <julien@xen.org>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Ian, Wei, can we get an ack for this patch?

This has been sitting on the ML for quite a while. I was going to commit 
it as this looks uncontroversial but the patch doesn't apply on the 
lastest Xen (tools/libxl was moved in tools/libs/light).

@Sergiy, would you be able to rebase the patch?

Cheers,

-- 
Julien Grall

