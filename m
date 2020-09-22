Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD89B27480B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 20:22:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKmvL-0007yB-5N; Tue, 22 Sep 2020 18:21:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZDRM=C7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKmvI-0007xv-UC
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:21:52 +0000
X-Inumbo-ID: 431a5999-bdb4-41f4-9034-d0f9193a4eaa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 431a5999-bdb4-41f4-9034-d0f9193a4eaa;
 Tue, 22 Sep 2020 18:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=XpjX4Z4nQvJ3LfmsZeasd5pOw42OKnlvO/wax0WD9cQ=; b=c8qSKFVAAdgIqjQ1i9DAGdknhn
 fPE+SJhZ3yL8Ah2AqBrvqZOnVII7ln/9U6XzVpUbWd3f/UMCvrmGWwJr1l/66OOBDd4WIlpIDMDLr
 Af63qNTgRA3Se5ESlYvHQJ+6de6X6c7d3yiIuBQuBaj31ZuVbrAgWdN/j9jfjoTo8SqM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKmvE-0005PG-Fe; Tue, 22 Sep 2020 18:21:48 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKmvE-000529-7G; Tue, 22 Sep 2020 18:21:48 +0000
Subject: Re: [PATCH v4 2/4] xen: Introduce HAS_M2P config and use to protect
 mfn_to_gmfn call
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-3-julien@xen.org>
 <d901dd53-c3fb-7522-8317-a83bed3e383d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3710018a-6da4-c38c-b954-b83309aeb525@xen.org>
Date: Tue, 22 Sep 2020 19:21:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d901dd53-c3fb-7522-8317-a83bed3e383d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 22/09/2020 08:54, Jan Beulich wrote:
> On 21.09.2020 20:02, Julien Grall wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -63,6 +63,9 @@ config HAS_IOPORTS
>>   config HAS_SCHED_GRANULARITY
>>   	bool
>>   
>> +config HAS_M2P
>> +	bool
> 
> Following Andrew's comments I think the need for this addition
> disappears, but in case I'm missing something I'd like to ask for
> this to be added higher up - see the patch I've just sent to
> re-sort the various HAS_* here.

It is required for patch #4.

Cheers,

-- 
Julien Grall

