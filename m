Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32913CA3DA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 19:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156896.289487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m451y-0002lD-24; Thu, 15 Jul 2021 17:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156896.289487; Thu, 15 Jul 2021 17:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m451x-0002iX-V0; Thu, 15 Jul 2021 17:20:13 +0000
Received: by outflank-mailman (input) for mailman id 156896;
 Thu, 15 Jul 2021 17:20:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Mdo=MH=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m451w-0002i6-HU
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 17:20:12 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98aee7e1-bb9c-49bf-b60a-1e70c2e353cb;
 Thu, 15 Jul 2021 17:20:11 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1626369608504927.7990916487273;
 Thu, 15 Jul 2021 10:20:08 -0700 (PDT)
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
X-Inumbo-ID: 98aee7e1-bb9c-49bf-b60a-1e70c2e353cb
ARC-Seal: i=1; a=rsa-sha256; t=1626369610; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aIbahkPSJsu/3BbAwxBPDQSrCj9Rqtc3Gx4NqLzS1CI3uuxdCWrHW5+bYitsKZUt0DDvFboG/HreGG5Jh20+EaYDHFvxzndWgvrPEkC0BIp/F+X7AVgqXQdBh2Luf70iFry16uv0/aJSJTLTDTIvA7T683Tct9VlnoYx9RyCNyc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626369610; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=GvfA/TmdesAxG38D5yZx/h99NwUqJPeF51Fjnjvl2Tw=; 
	b=eEtqsdtQ9g4nv3Wto0Csf4qziLx2bd/Siy/gLhcUvGqgIQw94eKiqi1iIpuyPUBFPUsakZ3E3iwr7AR9bli3q9OCr0xdVtAMHQdnPVlD4j4SWAQcQrsBjRFBR3JFxOFgFoKOdaMYiQ33+PP9+p++/H/WVWlc+yiAT40B0Otr638=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626369610;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GvfA/TmdesAxG38D5yZx/h99NwUqJPeF51Fjnjvl2Tw=;
	b=WPw5IHwN6DjNQlIkYVcFh142bP+I6fQpYvVa239xQypV8xSvf+ABTR6jilQnEGWV
	ColWBmnyq/GHy4OCbWP2mH9SBCi2H1v89qGly4IpiE45/FUVcjmcS+9TA9+y4p+0Pae
	VhUGHkP2jr/1MRy4DzxuwxqFzhXXwG2Iu90ipni0=
Subject: Re: [PATCH v2 04/10] xsm: convert xsm_ops hook calls to alternative
 call
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-5-dpsmith@apertussolutions.com>
 <be7899b7-aa4b-91f5-76ff-416f25f16d68@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <867c9355-5790-b93f-86eb-16f7997f0179@apertussolutions.com>
Date: Thu, 15 Jul 2021 13:20:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <be7899b7-aa4b-91f5-76ff-416f25f16d68@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/12/21 7:44 PM, Andrew Cooper wrote:
> On 12/07/2021 21:32, Daniel P. Smith wrote:
>> To reduce retpolines convert all the pointer function calls of the
>> xsm_ops hooks over to the alternative_call infrastructure.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>  xen/include/xsm/xsm.h | 195 +++++++++++++++++++++---------------------
>>  1 file changed, 99 insertions(+), 96 deletions(-)
>>
>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>> index a8805f514b..a39b5dc42f 100644
>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -15,6 +15,9 @@
>>  #ifndef __XSM_H__
>>  #define __XSM_H__
>>  
>> +#ifdef CONFIG_XSM
>> +#include <xen/alternative-call.h>
>> +#endif
> 
> This guard needs dropping to fix the build on ARM.

Ack

> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 

v/r,
dps

