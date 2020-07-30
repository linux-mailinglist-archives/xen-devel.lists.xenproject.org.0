Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C1A233274
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 14:55:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k184g-0005x5-7o; Thu, 30 Jul 2020 12:54:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k184f-0005x0-0w
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 12:54:17 +0000
X-Inumbo-ID: c5eb2534-d263-11ea-aac1-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5eb2534-d263-11ea-aac1-12813bfff9fa;
 Thu, 30 Jul 2020 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nfEsaqFJybXnm2uijpMuL0CFKltBDOFIQNfLG42L75M=; b=sHopNlrLCXtxKL7FqPXeXDkFtN
 5cuzhU8AbAOjvdX+f1vndFMN7JRDfb0gGl1cc+atAPCIobCnvoR9gp66nZMGDO0o9UxrYfntBzYUf
 RkiVF7oxCaT3ECi8KcGK0/fpnvdz/ncdNeVQr6/uoqLcN/oXJmPQSF2xBkPjXNx5cD5w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k184X-0000L2-Pc; Thu, 30 Jul 2020 12:54:09 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k184X-0007JG-EM; Thu, 30 Jul 2020 12:54:09 +0000
Subject: Re: [PATCH 4/5] xen/memory: Fix acquire_resource size semantics
To: paul@xen.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Xen-devel' <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-5-andrew.cooper3@citrix.com>
 <002b01d6664b$c7eb5f40$57c21dc0$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <d0c00a30-2f72-036e-d574-a82e96ea79ea@xen.org>
Date: Thu, 30 Jul 2020 13:54:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <002b01d6664b$c7eb5f40$57c21dc0$@xen.org>
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?= <michal.leszczynski@cert.pl>,
 'Jan Beulich' <JBeulich@suse.com>, 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 30/07/2020 09:31, Paul Durrant wrote:
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index dc3a7248e3..21edabf9cc 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1007,6 +1007,26 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
>>       return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
>>   }
>>
>> +/*
>> + * Return 0 on any kind of error.  Caller converts to -EINVAL.
>> + *
>> + * All nonzero values should be repeatable (i.e. derived from some fixed
>> + * proerty of the domain), and describe the full resource (i.e. mapping the
> 
> s/property/property
> 
>> + * result of this call will be the entire resource).
> 
> This precludes dynamically adding a resource to a running domain. Do we really want to bake in that restriction?

AFAICT, this restriction is not documented in the ABI. In particular, it 
is written:

"
The size of a resource will never be zero, but a nonzero result doesn't
guarentee that a subsequent mapping request will be successful.  There
are further type/id specific constraints which may change between the
two calls.
"

So I think a domain couldn't rely on this behavior. Although, it might 
be good to clarify in the comment on top of resource_max_frames that 
this an implementation decision and not part of the ABI.

Cheers,

-- 
Julien Grall

