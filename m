Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A13F9A64
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 15:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173676.316858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcAC-0004mR-P8; Fri, 27 Aug 2021 13:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173676.316858; Fri, 27 Aug 2021 13:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcAC-0004ke-Lk; Fri, 27 Aug 2021 13:44:56 +0000
Received: by outflank-mailman (input) for mailman id 173676;
 Fri, 27 Aug 2021 13:44:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBy1=NS=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mJcAB-0004kY-UF
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 13:44:55 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5d0407c-073c-11ec-aac4-12813bfff9fa;
 Fri, 27 Aug 2021 13:44:55 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630071891868483.14622385897735;
 Fri, 27 Aug 2021 06:44:51 -0700 (PDT)
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
X-Inumbo-ID: f5d0407c-073c-11ec-aac4-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1630071893; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NWlQiF2m4rKpaMh/N6ktYW9fjck9MzkdvRT3Wun2rHe0WhdiVuHq33/OrVyXv6DUTLeR0lXN/CRS8fFrXJd4lvbtR6ai25ZJ3zRwtIpfQbfTtIxtB/gefZKk5HQO2jVolJjBVsZafnN50Y0OJbEua2q6vPfGh6jb25aqjXY6q0o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630071893; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=E8x+9mrcYQkfmAkT5gadifYyKGEDWxuo1P25sCJqADo=; 
	b=WhcHKjgcD185iUaRcVBWyG2p04zhDj9sjT9oTJPBJTwUo8hmc+LvhaIG5gZqughRD165xREQoP1BF7AGMe/TUIoblGeQ5hdUEaJ1xVvX3SD4ZKjk7pdZXSyH7fnraZWkEKoTMCIpRfWzDmofXaJJRqd7Y1f5FyVfHjc8BiqEC0w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630071893;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=E8x+9mrcYQkfmAkT5gadifYyKGEDWxuo1P25sCJqADo=;
	b=Gn55OLMHQbUCxBOg+Cz4vSFAUXoSRjrXBlRIbvvboXnMOTz9yNnMuCPcyyrPyum2
	9HWjNmZRl1/tyjA8PZV13MWe/Qg2rcEDaW3mDTMsbf/9RbaAO8yU34iD23HtwxfPNsl
	BO9ThUSZLtMqi3QOisdGYhWgFRU+SUoRSJTgkU08=
Subject: Re: [PATCH v3 3/7] xsm: refactor xsm_ops handling
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-4-dpsmith@apertussolutions.com>
 <572bfa5c-154f-8fe5-7693-75919949835e@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <087b03d8-1fcc-cff1-fe6f-2d982dd341d4@apertussolutions.com>
Date: Fri, 27 Aug 2021 09:44:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <572bfa5c-154f-8fe5-7693-75919949835e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/25/21 11:16 AM, Jan Beulich wrote:
> On 05.08.2021 16:06, Daniel P. Smith wrote:
>> @@ -747,16 +747,16 @@ extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
>>  extern bool has_xsm_magic(paddr_t);
>>  #endif
>>  
>> -extern int register_xsm(struct xsm_operations *ops);
>> -
>> -extern struct xsm_operations dummy_xsm_ops;
>> -extern void xsm_fixup_ops(struct xsm_operations *ops);
>> +extern void xsm_fixup_ops(struct xsm_ops *ops);
>>  
>>  #ifdef CONFIG_XSM_FLASK
>> -extern void flask_init(const void *policy_buffer, size_t policy_size);
>> +extern const struct xsm_ops *flask_init(const void *policy_buffer,
>> +                                        size_t policy_size);
>>  #else
>> -static inline void flask_init(const void *policy_buffer, size_t policy_size)
>> +static inline struct xsm_ops *flask_init(const void *policy_buffer,
> 
> Please use const consistently between real function and stub.

Ack.

>> @@ -766,9 +766,12 @@ extern const unsigned int xsm_flask_init_policy_size;
>>  #endif
>>  
>>  #ifdef CONFIG_XSM_SILO
>> -extern void silo_init(void);
>> +extern const struct xsm_ops *silo_init(void);
>>  #else
>> -static inline void silo_init(void) {}
>> +static inline struct xsm_ops *silo_init(void)
> 
> Same here.

Ack.

>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -1745,7 +1745,7 @@ static int flask_argo_send(const struct domain *d, const struct domain *t)
>>  long do_flask_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) u_flask_op);
>>  int compat_flask_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) u_flask_op);
>>  
>> -static struct xsm_operations flask_ops = {
>> +static const struct xsm_ops __initconst flask_ops = {
> 
> __initconstrel please (I thought I had pointed out the difference
> already during earlier discussion). Same for SILO then of course.

Apologies, yes you did and that is my fault as I had only recorded the
__initconst suggestion in my checklist and did not update with your
__initconstrel suggestion.

>> --- a/xen/xsm/xsm_core.c
>> +++ b/xen/xsm/xsm_core.c
>> @@ -28,9 +28,17 @@
>>  #include <asm/setup.h>
>>  #endif
>>  
>> -#define XSM_FRAMEWORK_VERSION    "1.0.0"
>> +#define XSM_FRAMEWORK_VERSION    "1.0.1"
>>  
>> -struct xsm_operations *xsm_ops;
>> +struct xsm_ops xsm_ops;
> 
> __read_mostly?

Ack.

v/r,
dps


