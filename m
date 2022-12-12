Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B0A649E77
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 13:12:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459561.717329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4hf7-0004jF-6f; Mon, 12 Dec 2022 12:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459561.717329; Mon, 12 Dec 2022 12:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4hf7-0004gP-3Z; Mon, 12 Dec 2022 12:12:01 +0000
Received: by outflank-mailman (input) for mailman id 459561;
 Mon, 12 Dec 2022 12:12:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4hf6-0004g1-6h
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 12:12:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4hf5-0004oE-Fr; Mon, 12 Dec 2022 12:11:59 +0000
Received: from [54.239.6.188] (helo=[192.168.19.227])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4hf5-0008KT-6s; Mon, 12 Dec 2022 12:11:59 +0000
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
	bh=vqyUqugs7hQA9paiVAho9Ln7KE7hNXBld2RYWuLIbVo=; b=MG+5jtWIJ6ll4KhXngRQgHHHv0
	te83jc/Zp/qKB3VUN9+islNaZTWbxjfAvELT0J9Gi0G9Zp24hJiMWxXBOm4G/VvdHw4Yb5aYTqH3m
	SpeHBJs8lELCUYDCaF5h06sMeZNiMLze/wfypYK1joEm3trOss3mrOTGmQeAhjFRT+QE=;
Message-ID: <64c11d87-454c-54bf-1036-f77318190e75@xen.org>
Date: Mon, 12 Dec 2022 12:11:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 08/20] tools/xenstore: add hashlist for finding struct
 domain by domid
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-9-jgross@suse.com>
 <b0380217-09ff-1fa8-b6b3-1bc98766114b@xen.org>
 <f3657164-2f8e-0cab-7273-d31f10556a38@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f3657164-2f8e-0cab-7273-d31f10556a38@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 12/12/2022 12:08, Juergen Gross wrote:
> On 01.12.22 22:34, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 01/11/2022 15:28, Juergen Gross wrote:
>>> @@ -341,49 +339,56 @@ static bool get_domain_info(unsigned int domid, 
>>> xc_dominfo_t *dominfo)
>>>              dominfo->domid == domid;
>>>   }
>>> -void check_domains(void)
>>> +static int check_domain(void *k, void *v, void *arg)
>>
>> Looking at this callback, shouldn't 'k' be const? If not, wouldn't 
>> this mean a caller could potentially mess up with the hashtable?
> 
> I have modified the previous patch to make k const. I hope you are
> fine with me having kept your "Reviewed-by:".

Yes I am fine with that.

Cheers,

-- 
Julien Grall

