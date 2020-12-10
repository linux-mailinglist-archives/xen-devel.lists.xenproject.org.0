Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5922D59B4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 12:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49138.86896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knKTc-0002Zu-Au; Thu, 10 Dec 2020 11:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49138.86896; Thu, 10 Dec 2020 11:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knKTc-0002ZY-7L; Thu, 10 Dec 2020 11:51:16 +0000
Received: by outflank-mailman (input) for mailman id 49138;
 Thu, 10 Dec 2020 11:51:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1knKTa-0002ZT-El
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 11:51:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knKTY-0005V3-9p; Thu, 10 Dec 2020 11:51:12 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knKTY-0001Sb-2A; Thu, 10 Dec 2020 11:51:12 +0000
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
	bh=qsz24wjIyr/LTsrdeQgsthxNleWSORfomvrF5AwzyEg=; b=gyCj77biDq6xxryvrlLFKyKjoZ
	AylGJtxskhmZAjB3LI+PbaUWEJ1zd5ri7Ikp4xEqO+4sOgB/kC5Q6qxH94I9xeaTi3JiF9eBSxGbX
	6L7xCGwXfaUMWz3eyG9T5I3ptg+EJDvaWXAlEl4mEYvSCS3DCo8kZYYsS4v2cdyyTMd8=;
Subject: Re: [PATCH RFC 2/3] xen/domain: add domain hypfs directories
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201209161618.309-1-jgross@suse.com>
 <20201209161618.309-3-jgross@suse.com>
 <75232058-4626-80cb-6f71-4ce5253f3ef6@xen.org>
 <8ec5f4f5-4314-9c4d-45f0-1f4686028a82@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e4fde734-b353-d885-95e8-0ea9c2210994@xen.org>
Date: Thu, 10 Dec 2020 11:51:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <8ec5f4f5-4314-9c4d-45f0-1f4686028a82@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/12/2020 07:54, Jürgen Groß wrote:
> On 09.12.20 17:37, Julien Grall wrote:
>>>   only the syntax used in this document):
>>>   * STRING -- an arbitrary 0-delimited byte string.
>>> @@ -191,6 +192,15 @@ The scheduling granularity of a cpupool.
>>>   Writing a value is allowed only for cpupools with no cpu assigned 
>>> and if the
>>>   architecture is supporting different scheduling granularities.
>>
>> [...]
>>
>>> +
>>> +static int domain_dir_read(const struct hypfs_entry *entry,
>>> +                           XEN_GUEST_HANDLE_PARAM(void) uaddr)
>>> +{
>>> +    int ret = 0;
>>> +    const struct domain *d;
>>> +
>>> +    for_each_domain ( d )
>>
>> This is definitely going to be an issue if you have a lot of domain 
>> running as Xen is not preemptible.
> 
> In general this is correct, but in this case I don't think it will
> be a problem. The execution time for each loop iteration should be
> rather short (in the microsecond range?), so even with 32000 guests
> we would stay way below one second.

The scheduling slice are usually in ms and not second (yet this will 
depend on your scheduler). It would be unacceptable to me if another 
vCPU cannot run for a second because dom0 is trying to list the domain 
via HYPFS.

Cheers,

-- 
Julien Grall

