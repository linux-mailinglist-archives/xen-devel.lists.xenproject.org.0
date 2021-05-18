Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463CD387A10
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 15:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129205.242553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lizr7-0003Gf-2V; Tue, 18 May 2021 13:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129205.242553; Tue, 18 May 2021 13:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lizr6-0003EW-Vl; Tue, 18 May 2021 13:33:52 +0000
Received: by outflank-mailman (input) for mailman id 129205;
 Tue, 18 May 2021 13:33:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lizr5-0003EQ-Jx
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 13:33:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lizr3-0003YP-9l; Tue, 18 May 2021 13:33:49 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lizr3-0007pZ-3X; Tue, 18 May 2021 13:33:49 +0000
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
	bh=1lkajqPw+kP8aaSXtpGKkRvkJZSt98OyATyPZb6KLrM=; b=oICMJhN5+6jd8hNoCf/61EVFe0
	JNhwik5TAaLWdHIuE7sTgHuDb1o79a8OBNusfeQqVzp0xmfay69YnNDD3hjXQJOXPfUT30akOpDNc
	OWH/uSxiWkUplVZpUeTtI+bwQtoBHj9JDHbbY6t47EyI1tIpNOT/gjn1xulM+YGs5+JY=;
Subject: Re: [PATCH 05/14] tools/libs: guest: Use const whenever we point to
 literal strings
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-6-julien@xen.org> <YJqbrs482KY23QQE@perard>
From: Julien Grall <julien@xen.org>
Message-ID: <c933099d-c448-a57d-0510-ca8bc7e368ab@xen.org>
Date: Tue, 18 May 2021 14:33:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJqbrs482KY23QQE@perard>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 11/05/2021 15:58, Anthony PERARD wrote:
> On Mon, Apr 05, 2021 at 04:57:04PM +0100, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> literal strings are not meant to be modified. So we should use const
>> *char rather than char * when we want to store a pointer to them.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>> diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
>> index 2953aeb90b35..e379b07f9945 100644
>> --- a/tools/libs/guest/xg_dom_x86.c
>> +++ b/tools/libs/guest/xg_dom_x86.c
>> @@ -1148,11 +1148,12 @@ static int vcpu_hvm(struct xc_dom_image *dom)
>>   
>>   /* ------------------------------------------------------------------------ */
>>   
>> -static int x86_compat(xc_interface *xch, uint32_t domid, char *guest_type)
>> +static int x86_compat(xc_interface *xch, uint32_t domid,
>> +                      const char *guest_type)
>>   {
>>       static const struct {
>> -        char           *guest;
>> -        uint32_t        size;
>> +        const char      *guest;
>> +        uint32_t       size;
> 
> It seems that one space have been removed by mistake just before "size".

Well spotted. I will fix on commit.

> 
> The rest looks good:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thank you!

Cheers,

-- 
Julien Grall

