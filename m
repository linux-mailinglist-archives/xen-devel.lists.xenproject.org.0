Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80783F4FF6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 19:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170568.311397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIE9T-00034X-K7; Mon, 23 Aug 2021 17:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170568.311397; Mon, 23 Aug 2021 17:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIE9T-00031y-H5; Mon, 23 Aug 2021 17:54:27 +0000
Received: by outflank-mailman (input) for mailman id 170568;
 Mon, 23 Aug 2021 17:54:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIE9S-00031q-CW
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 17:54:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIE9R-0008VD-HE; Mon, 23 Aug 2021 17:54:25 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIE9R-0000qX-B4; Mon, 23 Aug 2021 17:54:25 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=O06dRWBbO4b6yN+EtUVjNvTlsNpspPTofeRcxSNCFWE=; b=fc0Xe8ZPEmNLazj6z0c1VmlDDR
	PbpBVv5ig7umNK7LGelOAR5rTzr2XrrBO4hY/UsgU65s+94Np/o+CsmMWF41DNLrqgg8eqV50J7nE
	3s37mUEZjmNHPJ5czhCibMyIOX88SXjWyNrCfLZ+6cUZrSazDjPy2qephQshDOPZTyy8=;
Subject: Re: [XEN RFC PATCH 09/40] xen/x86: Move numa_add_cpu_node to common
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-10-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b867041b-0b36-c197-a54a-28cb58075c94@xen.org>
Date: Mon, 23 Aug 2021 18:54:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-10-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:23, Wei Chen wrote:
> This function will be reused by Arm later, so we move it
> from arch/x86 to common. But we keep cpu_to_node and
> node_to_cpumask to x86 header file. Because cpu_to_node and
> node_to_cpumask have different implementation for x86 and Arm.
> We will move them to common header file when we change the Arm
> implementation in later patches.

AFAICT, the Arm helpers are gated by !CONFIG_NUMA and the ones in common 
code will be gated by CONFIG_NUMA. So I am not quite too understand why 
they can't be moved now. Can you clarify it?

Cheers,

-- 
Julien Grall

