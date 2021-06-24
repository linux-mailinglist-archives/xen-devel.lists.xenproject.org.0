Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10913B31DC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 16:56:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146868.270399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwQmV-0008QB-AD; Thu, 24 Jun 2021 14:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146868.270399; Thu, 24 Jun 2021 14:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwQmV-0008OM-74; Thu, 24 Jun 2021 14:56:39 +0000
Received: by outflank-mailman (input) for mailman id 146868;
 Thu, 24 Jun 2021 14:56:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwQmT-0008OE-5K
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 14:56:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwQmR-0002OC-Rf; Thu, 24 Jun 2021 14:56:35 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwQmR-0004sa-KS; Thu, 24 Jun 2021 14:56:35 +0000
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
	bh=dEtNWCKVkzqbyFAHE44xMqQTqtJFmSXLWfRMatdkYRc=; b=GfKb858ybWSHPUCTCqrgPRJV75
	CwVvzCZZZeDucmSFRr0enYhyDWQxnsj+MCrjDcPU3l6N4cXSq646VCPiaEjwgbhgW7F96WfMRMLm3
	gNaGQqL5uhYQ+zypTi6C5fm9m7zRhzJWHnkP2dEsW8Gcy+sIrFFkhGbJX6qXbetj11Cc=;
Subject: Re: [PATCH] tools/xenstored: Remove redundant check in
 socket_can_process()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210624144655.12900-1-julien@xen.org>
 <ef5c28e0-989c-2443-f72d-44cf17dc589c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b97249d6-2c97-2bc9-2dbc-db491c814fa1@xen.org>
Date: Thu, 24 Jun 2021 16:56:33 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ef5c28e0-989c-2443-f72d-44cf17dc589c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/06/2021 16:53, Juergen Gross wrote:
> On 24.06.21 16:46, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 3adfb50315d9 ("tools/xenstored: Introduce a wrapper for
>> conn->funcs->can_{read, write}") consolidated the check
>> !conn->is_ignored in two new wrappers.
>>
>> This means the check in socket_can_process() is now redundant. In
>> fact it should have been removed in orignal commit (as it was done
>> for the domain helpers).
>>
>> Reported-by: Raphael Ning <raphning@amazon.com
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks! Committed.

Cheers,

-- 
Julien Grall

