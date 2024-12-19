Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18E19F801C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 17:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861375.1273300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOJaC-0001SZ-72; Thu, 19 Dec 2024 16:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861375.1273300; Thu, 19 Dec 2024 16:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOJaC-0001Pw-3l; Thu, 19 Dec 2024 16:41:04 +0000
Received: by outflank-mailman (input) for mailman id 861375;
 Thu, 19 Dec 2024 16:41:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qB0g=TM=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tOJaB-0001Pq-2G
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 16:41:03 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 070a9ea8-be28-11ef-a0d8-8be0dac302b0;
 Thu, 19 Dec 2024 17:41:01 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1734626451692938.1409941269775;
 Thu, 19 Dec 2024 08:40:51 -0800 (PST)
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
X-Inumbo-ID: 070a9ea8-be28-11ef-a0d8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1734626454; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U5wZMZ0g/SdwI6yvxHda0QHqJbSglH/zuv6+Q1qmiNz5rtp8uQXotyvg5NB67cr/v8ZcHPMfJUtMlSH1Qm7juM1REvwDoI3nShCgwuGvzjqcIwrsvZYYbV+GBCw8fVURnBuDkMog1kgnEpfGU7l/VScm/7KF74lwtwmNdqt2Xdw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734626454; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lxg3CIzptPf8GHQ8oRlHduu2/DUaDOMWS4If8u1uJHA=; 
	b=cYcyucBv9vDG+FJNimq0cBpV87jt7UvhG7PY6601J1pjerTfMj2HZ9Bpdk7MzugYrFwkIYWApm63wvaVryH1UIMwKmA8PY2li+Z//OsEEZj0YB86Mwu7ztOAct2YAsbi+seugUP9K0oj6SzWYPOngh2Ka2EurgQFtFEC52+rFlc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734626454;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:Cc:Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Lxg3CIzptPf8GHQ8oRlHduu2/DUaDOMWS4If8u1uJHA=;
	b=Pjcpd4aU5GLtJeRZBIaAGrVfMORh2VFHgInOku9nLJY8biFvSl5zjzfD1Tha4FfJ
	Q0/K07NBWixkI3YYFDglE1TbW/LO+r7pBMk8bq4g0YVJQHfw02MoF2zJmsTFmqjkxyl
	jobeOPBp9eHX5wip/W7Q64vppB+cHKjqfnvP3axE=
Message-ID: <1dbb232f-2a8d-4152-a9ba-215841307fb6@apertussolutions.com>
Date: Thu, 19 Dec 2024 11:40:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/hyperlaunch: add domain id parsing to domain
 config
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-12-dpsmith@apertussolutions.com>
 <8a492a4d-cc9c-4756-8fb9-721626c295a6@suse.com>
 <f6646a6e-58b5-474f-ba6f-fb9e0243f5b2@apertussolutions.com>
Content-Language: en-US
In-Reply-To: <f6646a6e-58b5-474f-ba6f-fb9e0243f5b2@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 12/11/24 11:21, Daniel P. Smith wrote:
> On 12/2/24 07:02, Jan Beulich wrote:
>> On 23.11.2024 19:20, Daniel P. Smith wrote:
>>> --- a/xen/arch/x86/domain_builder/fdt.h
>>> +++ b/xen/arch/x86/domain_builder/fdt.h
>>> @@ -27,6 +27,24 @@ static inline int __init fdt_cell_as_u64(const 
>>> fdt32_t *cell, uint64_t *val)
>>>       return 0;
>>>   }
>>> +static inline int __init fdt_prop_as_u32(
>>> +    const struct fdt_property *prop, uint32_t *val)
>>> +{
>>> +    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
>>> +        return -EINVAL;
>>> +
>>> +    return fdt_cell_as_u32((fdt32_t *)prop->data, val);
>>> +}
>>> +
>>> +static inline bool __init match_fdt_property(
>>> +    const void *fdt, const struct fdt_property *prop, const char *s)
>>> +{
>>> +    int slen, len = strlen(s);
>>
>> Plain int isn't quite appropriate for strlen()'s return. It doesn't 
>> strictly
>> need to be size_t, but it should be at least unsigned int.
> 
> Ack.

I wanted to reply back on this one before posting the next version. By 
implementing Jason's recommendation to unroll this function, the 
strlen() call goes away and slen becomes name_len. But name_len remains 
plain int to align with the fdt_get_string() parameter type.

v/r,
dps

