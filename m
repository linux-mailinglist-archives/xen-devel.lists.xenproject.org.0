Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121919979C1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 02:45:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815303.1229016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhJ6-0001LW-TC; Thu, 10 Oct 2024 00:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815303.1229016; Thu, 10 Oct 2024 00:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhJ6-0001JI-Qd; Thu, 10 Oct 2024 00:45:32 +0000
Received: by outflank-mailman (input) for mailman id 815303;
 Thu, 10 Oct 2024 00:45:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syhJ5-0001JC-Ig
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 00:45:31 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1522004-86a0-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 02:45:29 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728521121837881.6838444291625;
 Wed, 9 Oct 2024 17:45:21 -0700 (PDT)
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
X-Inumbo-ID: f1522004-86a0-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728521124; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f7yjk3EdyN3NE2za1qZxvdaQiZjbG7AkxeTOcKwRGcen6DkGTg/Evm7Xk2SRkq9mZtihz3OY0Lz9I7CTTbPHxToSayjcW3miVMLkS7w1+uTGJh6hk4PLMXhD3Cg+FJ5OZ0S4af67cg5RcgOeBBZ1vjXx0Po2mPnGiGtfOTB14zE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728521124; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PeU09RrBphn0uYPHwAaljcCdpkNjVuQhRTQBfmhzAFo=; 
	b=nf1AStuYmAweO4/JznYyPjkkh6B5vbcUeo34nVMpNzk/WsWy51Eooijyn2Cqiwq9dCzCfCkyf0YcWeFLhuhnLTafCPn3cjcd1rZB7g+vGSsGLXF3Bc1v6NzOR5bj2qdf0WtUtcdAUlk2FEaznFY9j235U2baPrrGpSTKMZFLPQU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728521124;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PeU09RrBphn0uYPHwAaljcCdpkNjVuQhRTQBfmhzAFo=;
	b=FVAFKKvcp8QJfuoYXjOylEMCEk+Dv3mvusehdXBnAI56XNBJfCeaPJChjmCgLUK1
	RzKzFfQBiORhvtjtD368T+wqZlQPbajuVcoPVqK0i19BRYKlYTQsDI+K8HQs4zNzJFl
	TKzlnP9M1cX4Jl1zjFHhwcSgdFxeT0YjghAMWziM=
Message-ID: <12804fa2-68e0-4fd5-aef1-fc3a59730a75@apertussolutions.com>
Date: Wed, 9 Oct 2024 20:45:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 40/44] x86/boot: add cmdline to struct boot_domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-41-dpsmith@apertussolutions.com>
 <1ec34665-36da-44a2-af5b-7b770017ea53@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <1ec34665-36da-44a2-af5b-7b770017ea53@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 16:05, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> Add a container for the "cooked" command line for a domain.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootdomain.h |  4 ++++
>>   xen/arch/x86/setup.c                  | 18 ++++++++----------
>>   2 files changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootdomain.h 
>> b/xen/arch/x86/include/asm/bootdomain.h
>> index d6264d554dba..00f7d9267965 100644
>> --- a/xen/arch/x86/include/asm/bootdomain.h
>> +++ b/xen/arch/x86/include/asm/bootdomain.h
>> @@ -8,9 +8,13 @@
>>   #ifndef __XEN_X86_BOOTDOMAIN_H__
>>   #define __XEN_X86_BOOTDOMAIN_H__
>> +#include <public/xen.h>
>> +
>>   struct boot_module;
>>   struct boot_domain {
>> +    char cmdline[MAX_GUEST_CMDLINE];
>> +
> 
> 1024 bytes for just dom0 isn't too much.  But when hyperlaunch has 64 
> boot_domains, that's a good bit more.  But I suppose it isn't too much 
> RAM for a modern system.  This is __initdata, so it increases the binary 
> size.  I just want to highlight this in case others want to chime in.

I would prefer to leave it in the __initdata for now to avoid dealing 
with dynamic memory at this time. Later, if a need to optimize for 
binary size, then options could be explored.

> The code changes seem fine.

R-b then?

v/r
dps

