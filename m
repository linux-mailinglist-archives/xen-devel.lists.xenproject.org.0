Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BAF4F16DE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 16:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298372.508277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbNaa-0006m7-5j; Mon, 04 Apr 2022 14:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298372.508277; Mon, 04 Apr 2022 14:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbNaa-0006iy-22; Mon, 04 Apr 2022 14:21:52 +0000
Received: by outflank-mailman (input) for mailman id 298372;
 Mon, 04 Apr 2022 14:21:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DIUK=UO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nbNaY-0006is-G0
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 14:21:50 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ef74af1-b422-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 16:21:48 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1649082102126315.07576523892146;
 Mon, 4 Apr 2022 07:21:42 -0700 (PDT)
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
X-Inumbo-ID: 8ef74af1-b422-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1649082104; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PZsN+E0o4wH9aTOlLcU9+AZoMyS4oZUwNXrTzrZyMe9/Z1mz/2pbuA7032cFbE/UKb/MmSB1P7/CnGpr4o8F4Ntga5WLul7zDoo8kW/H1DviFYA3JjbpxWFwnXqicxxdmTL95uuErE2+EBUmYlekERkQjJlQaM2NmORpn0+7za8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1649082104; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=PuLKQ80buUJx4m098vQQ40PkNsehct9u+BDBwpDU61Q=; 
	b=n99lybPI6ITk5cdsu6XjHGVjL+NE0Ot2BXqE7oWF4cqrTIwHslMPXyuBP62vGt756v3iHRGFMCVUrd9gXslvBDKpn3VaQftsv3zyC8GzzwwY77KslVJEGvEmsItz9tzxDpxU+INkDAiaseAqRQQjRmRjVHHTYKSovVorij67U/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649082104;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PuLKQ80buUJx4m098vQQ40PkNsehct9u+BDBwpDU61Q=;
	b=u9h7selzC5brKm08vsHvmCOKmi8N33wZ2VkznSZ2fclNBF8yfp0gA6kO0R8qxDRA
	GCQO6lXof0yq48jBvqa6YtSXM+/xhfDDNb0fsdzqKEV6e8E+wtqJHzNQko9ysAzLmmW
	GRlUH5elTwvLvLdr82on/tUVDDMn8Jp09O2m/Dm4=
Message-ID: <25c10763-36fa-34d4-05b6-655c08fdfee7@apertussolutions.com>
Date: Mon, 4 Apr 2022 10:21:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, scott.davis@starlab.io,
 jandryuk@gmail.com, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <YkWgXhFVq/fD72CB@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
In-Reply-To: <YkWgXhFVq/fD72CB@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 3/31/22 08:36, Roger Pau Monné wrote:
> On Wed, Mar 30, 2022 at 07:05:48PM -0400, Daniel P. Smith wrote:
>> There are now instances where internal hypervisor logic needs to make resource
>> allocation calls that are protected by XSM checks. The internal hypervisor logic
>> is represented a number of system domains which by designed are represented by
>> non-privileged struct domain instances. To enable these logic blocks to
>> function correctly but in a controlled manner, this commit introduces a pair
>> of privilege escalation and demotion functions that will make a system domain
>> privileged and then remove that privilege.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>  xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
> 
> I'm not sure this needs to be in xsm code, AFAICT it could live in a
> more generic file.

From my perspective this is access control logic, thus why I advocate
for it to be under XSM. A personal goal is to try to get all security,
i.e. access control, centralized to the extent that it doing so does not
make the code base unnecessarily complicated.

>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>> index e22d6160b5..157e57151e 100644
>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -189,6 +189,28 @@ struct xsm_operations {
>>  #endif
>>  };
>>  
>> +static always_inline int xsm_elevate_priv(struct domain *d)
> 
> I don't think it needs to be always_inline, using just inline would be
> fine IMO.
> 
> Also this needs to be __init.

AIUI always_inline is likely the best way to preserve the speculation
safety brought in by the call to is_system_domain().

>> +{
>> +    if ( is_system_domain(d) )
>> +    {
>> +        d->is_privileged = true;
>> +        return 0;
>> +    }
>> +
> 
> I would add an ASSERT_UNREACHABLE(); here, I don't think we have any
> use case for trying to elevate the privileges of a non-system domain.

Ack.

v/r
dps

