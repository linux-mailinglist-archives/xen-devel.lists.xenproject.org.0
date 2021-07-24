Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69D03D49BE
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jul 2021 22:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160497.295090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7Nvu-0004ly-Ar; Sat, 24 Jul 2021 20:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160497.295090; Sat, 24 Jul 2021 20:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7Nvu-0004j5-75; Sat, 24 Jul 2021 20:07:38 +0000
Received: by outflank-mailman (input) for mailman id 160497;
 Sat, 24 Jul 2021 20:07:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYYX=MQ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m7Nvs-0004iz-4U
 for xen-devel@lists.xenproject.org; Sat, 24 Jul 2021 20:07:36 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c85cf08c-ecba-11eb-955d-12813bfff9fa;
 Sat, 24 Jul 2021 20:07:34 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1627157248999314.5502574414819;
 Sat, 24 Jul 2021 13:07:28 -0700 (PDT)
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
X-Inumbo-ID: c85cf08c-ecba-11eb-955d-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1627157251; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A1GPZlPK1lwD0fdf/STb5XdFLWt8KnH18vcp59gXU5L8lpuXZ37P3o+qMXCc5jsiryES84MvwjVkvi8955u+5LIurJnM0J7MZcVDFksiTXjCnPew01aUpzPNI2BW0z1mklFbUgpziGbvuCCFPkSfx6mkj52F7Mm8rjM1Gs0ESfo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627157251; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=sMyL52ngESrAeHbnk3UHc7t7QxjbnTa7tbz4U17eyBU=; 
	b=PcqyafkprxQnwcyqkILa8dg7kWHs4k5N6O3qnvZnYQJ+ayq/nWIJOuBBkh1p+zLTckeFKsmvnhkPZxTXX6TXC5s4Q4jC+ks69SP0TdOO90X5EahSwq8rIy2bw0aiD7Vl4nLwEGxH/wJVTEDBzljdBqYPnTlZWLl+ImIefHA+0aA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627157251;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=sMyL52ngESrAeHbnk3UHc7t7QxjbnTa7tbz4U17eyBU=;
	b=LodJJ94dzxkzsIu2mMTjpaIbNJkjx+Dyc+l6VnmkmFy1gseg5rBhsiWUxHA7TM4G
	vktJu0VHiAqrT8MH8r2U6/KJc7yqFfg2WVEr6P0fPNYH8Rj0XZve5Rpb/pJPeRKNBdf
	zNAAo/WktF+07riOXTBkYqZ4OXdw1lJFRnSQU9Gs=
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-10-dpsmith@apertussolutions.com>
 <34c71bc9-18e8-08cd-d55f-9f5f97bde91e@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 09/10] xsm: expand the function related macros in
 dummy.h
Message-ID: <0c944d5f-cc79-4df9-9531-cb918aef8fe8@apertussolutions.com>
Date: Sat, 24 Jul 2021 16:07:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <34c71bc9-18e8-08cd-d55f-9f5f97bde91e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 7/16/21 3:34 AM, Jan Beulich wrote:
> On 12.07.2021 22:32, Daniel P. Smith wrote:
>> With the elimination of switching how dummy.h gets included, the function
>> declaration macros are no longer necessary. This commit expands them out to the
>> only value for which they will ever be set. This results in function
>> declaration lengths changing and since some definitions did not even follow the
>> 80 column wrapping style, all function definitions were aligned with the
>> predominate style found in core hypervisor code.
> 
> I'm afraid this last half sentence is quite far from true:

I would disagree since I know I went through the frustration of trying
to find a discernible consistency in the files in common/ in the end I
settled on following common/memory.c since it seemed to have the most
uniform, it had only a couple of anomalies, as opposed to other files
where indentation was varied throughout.

>> @@ -82,43 +79,43 @@ static always_inline int xsm_default_action(
>>      }
>>  }
>>  
>> -static XSM_INLINE void dummy_security_domaininfo(struct domain *d,
>> +static inline void dummy_security_domaininfo(struct domain *d,
>>                                      struct xen_domctl_getdomaininfo *info)
> 
> Padding wasn't good here before, but you clearly do not change it to
> either of the forms we agreed on as being the goal for consistency:

Then that agreement should be document as CODING_STYLE only states:


Line Length
-----------

Lines should be less than 80 characters in length.  Long lines should
be split at sensible places and the trailing portions indented.


I found that in common/memory.c the predominate style was to align
parameters with the first parameter when wrapping, which is what I
followed. In this specific case when I wrapped the second parameter to
make the line less than 80 chars (an explicit rule in CODING_STYLE) and
attempted to align with the first paramter resulted in the line
exceeding 80 chars. Since the only hard rule is lines must be less than
80, I decreased the indent by enough characters for the line to be less
than 80 to be in line with CODING_STYLE since it only calls for sensible
splits that are indented.

> static inline void dummy_security_domaininfo(struct domain *d,
>                                              struct xen_domctl_getdomaininfo *info)
> 
> or
> 
> static inline void dummy_security_domaininfo(
>     struct domain *d,
>     struct xen_domctl_getdomaininfo *info)
> 

I will align to the second, even though I find it annoying to switch
alignment styles, since the first would be in violation of CODING_STYLE
sine the second line would exceed 80 chars

>> -static XSM_INLINE int dummy_domain_create(XSM_DEFAULT_ARG struct domain *d, u32 ssidref)
>> +static inline int dummy_domain_create(struct domain *d, u32 ssidref)
> 
> When you have to touch lines anyway, may I suggest that you also take
> the opportunity and convert u<N> to uint<N>_t, to bring this file
> better in line with ./CODING_STYLE?

Sure.

v/r,
dps



