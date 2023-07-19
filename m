Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CA47594BD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 14:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565808.884329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5t1-0006eJ-MN; Wed, 19 Jul 2023 12:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565808.884329; Wed, 19 Jul 2023 12:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM5t1-0006bc-Jl; Wed, 19 Jul 2023 12:02:31 +0000
Received: by outflank-mailman (input) for mailman id 565808;
 Wed, 19 Jul 2023 12:02:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qM5t0-0006bT-Gj
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 12:02:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qM5sz-0001EQ-Pe; Wed, 19 Jul 2023 12:02:29 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.5.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qM5sz-0001uF-KD; Wed, 19 Jul 2023 12:02:29 +0000
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
	bh=EbGOpKUe8Js8Xae9bFXseiofzVf+nv5fHYLonKimEJY=; b=Ix5OR0RhS1rq7KY+PWcQx3semM
	hlQywjOltQ92POIx5h1BArWvTKHsKCAynfcWWwi3DIZxMCm1M96ioJ0KhHAdBcwfM2GaMkse0KjaV
	HxmV4QHqUFyaDJOFIkhGorz6NX6FejhllfGp4QKoeRpY/s2Vcg1N6DXC4Qs5mSFrc/hY=;
Message-ID: <eca3cbf7-6747-6631-d0bc-26ec3faea233@xen.org>
Date: Wed, 19 Jul 2023 13:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 18/18] tools/xenstore: add nocopy flag to node read
 functions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-19-jgross@suse.com>
 <64ec2fd3-fcec-6ebf-5924-6b591215e19e@xen.org>
 <32cd8b9f-8afa-2cde-3815-82edc7052535@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <32cd8b9f-8afa-2cde-3815-82edc7052535@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/07/2023 07:49, Juergen Gross wrote:
> On 18.07.23 23:35, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 10/07/2023 07:59, Juergen Gross wrote:
>>> Today when reading a node from the data base through read_node(), the
>>> node data is copied in order to avoid modifying the data base when
>>> preparing a node update, as otherwise an error might result in an
>>> inconsistent state.
>>>
>>> There are, however, many cases where such a copy operation isn't
>>> needed, as the node isn't modified.
>>>
>>> Add a "nocopy" flag to read_node() and get_node*() functions for making
>>> those cases less memory consuming and more performant.
>>
>> Reducing memory consumption and improving performance is good. However 
>> you are now relying on the caller to do the right thing when 'nocopy' 
>> is true. I believe this is a disaster waiting to happen.
>>
>> So as it stands, I don't support this approach. The solution I have in 
>> mind would require that 'struct node' is const for the 'nocopy' case. 
>> I agree this means more work, but that's the price for reduce the the 
>> risk of corruption.
> 
> Fair enough.
> 
> I'll look into splitting read_node() into a direct variant returning a 
> const
> pointer and a variant copying the data. Same will be needed for 
> get_node*().
> 
>>
>>>
>>> Note that there is one modification of the node data left, which is not
>>> problematic: domain_adjust_node_perms() might set the "ignore" flag of
>>> a permission. This does no harm, as such an update of the permissions
>>> doesn't need to be undone in case of a later processing error.
>> Even if this is the "ignore" flag, this is definitely not an ideal 
>> situation. And, AFAICT, this is not even document. I don't to be the 
>> reader trying to figure out why read_node() and db_fetch() returns a 
>> slightly different node content :).
> 
> So would you be fine with the addition of a comment explaining the 
> situation?

I expect that my remark will become moot if we go ahead with splitting 
read_node().

Cheers,

-- 
Julien Grall

