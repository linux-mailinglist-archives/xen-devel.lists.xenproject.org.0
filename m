Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5365B3673
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 13:35:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404220.646591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWcHn-0007vt-Ni; Fri, 09 Sep 2022 11:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404220.646591; Fri, 09 Sep 2022 11:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWcHn-0007t3-KY; Fri, 09 Sep 2022 11:35:03 +0000
Received: by outflank-mailman (input) for mailman id 404220;
 Fri, 09 Sep 2022 11:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F1lU=ZM=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oWcHm-0007sx-BS
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 11:35:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c5246cc-3033-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 13:34:55 +0200 (CEST)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 166272329547024.854489984245333;
 Fri, 9 Sep 2022 04:34:55 -0700 (PDT)
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
X-Inumbo-ID: 6c5246cc-3033-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; t=1662723297; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ExxboEDXqRHhC0ZTFXzFQJIhdCcPBTepPGKp4qPRKJOd/ebfFzScjdpPkAlTvXEZ707hVr7BXNhPOrxADv+gvLsKvmN9N8euo1Ny8rSWmshCowM3YbZeGI635rlRw11T6NeHpFZqYvx5qRBrgS1xeWJFpOvr42srA5Ra6N68Jt4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1662723297; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=smoq3UFsJfa3jrjKUR5TUdYfFsv2j3mxZx/xfiWbjhM=; 
	b=NuLsAhvsYSslj/ARxtnOTBsBb7j0OefkLjx9A1N6g8PlF2afn+u4OhIk1jA5BV3SiSGXkL/WyyFrFFWPyEXDBtwuCdA70qILiGeTBfgf08cgeKg8qH6vryaiaElJDzbIQ8UtBew+iHUfXY9EwbCgc3SnaFzPdLEfl065DI42DJ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662723297;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=smoq3UFsJfa3jrjKUR5TUdYfFsv2j3mxZx/xfiWbjhM=;
	b=AmVcR6Fhle97F3ZsEYTRhjIQPXtv4cAaPyALfYuCKOSlOgWsgfFuoRV3VRbbsBMd
	r+uludpA6l8lz74lyVChhLyfU8ugl2IYQ3ZNnEBEFYHlZnveBJK6Mos9rVOed7ap9zh
	A1rZItnkUpGbbtw/ew4+WX5OO6asHfPwmxxZWniI=
Message-ID: <e6568867-3296-58b2-8744-d1644e401528@apertussolutions.com>
Date: Fri, 9 Sep 2022 07:34:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] xsm/flask: adjust print messages to use %pd
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: jandryuk@gmail.com, xen-devel@lists.xenproject.org
References: <20220909095012.4251-1-dpsmith@apertussolutions.com>
 <3da17c12-1cbe-165e-94f4-44face9a181f@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <3da17c12-1cbe-165e-94f4-44face9a181f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/9/22 06:04, Jan Beulich wrote:
> On 09.09.2022 11:50, Daniel P. Smith wrote:
>> --- a/xen/xsm/flask/avc.c
>> +++ b/xen/xsm/flask/avc.c
>> @@ -566,14 +566,14 @@ void avc_audit(u32 ssid, u32 tsid, u16 tclass, u32 requested,
>>       if ( a && (a->sdom || a->tdom) )
>>       {
>>           if ( a->sdom && a->tdom && a->sdom != a->tdom )
>> -            avc_printk(&buf, "domid=%d target=%d ", a->sdom->domain_id, a->tdom->domain_id);
>> +            avc_printk(&buf, "source=%pd target=%dp ", a->sdom, a->tdom);
>>           else if ( a->sdom )
>> -            avc_printk(&buf, "domid=%d ", a->sdom->domain_id);
>> +            avc_printk(&buf, "source=%pd ", a->sdom);
>>           else
>> -            avc_printk(&buf, "target=%d ", a->tdom->domain_id);
>> +            avc_printk(&buf, "target=%pd ", a->tdom);
> 
> Apart from switching to %pd to also replace "domid" by "source". That's
> fine in the first case (where both domain IDs are logged), but in the
> second case it's a little questionable. Wouldn't it be better to be
> able to distinguish the tdom == NULL case from the tdom == sdom one,
> perhaps by using "source" in the former case but "domid" in the latter
> one?

Apologies as I am not quite following your question. Let me provide my 
reasoning and if it doesn't address your question, then please help me 
understand your concern.

The function avc_printk() allows for the incremental build up of an AVC 
message. In this section, it is attempting to include the applicable 
source and target that was used to render the AVC. With the switch to 
%pd, the first and second lines would become "domid=d{id}". I personally 
find that a bit redundant. Adding to that, in the context of this 
function there is "sdom" which is source domain, "cdom" which is current 
domain, and tdom which is target domain. The print statements using cdom 
or tdom already denoted them with "current=" and "target=" respectively. 
Whereas, sdom was prefixed with "domid=" in the print statements. To me, 
it makes more sense to change the prefixes of sdom with "source=" to 
accurately reflect the context of that domid.

v/r,
dps


