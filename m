Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4225C9BFAEA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 01:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831461.1246773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qj4-0007TN-6W; Thu, 07 Nov 2024 00:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831461.1246773; Thu, 07 Nov 2024 00:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8qj4-0007Qx-3K; Thu, 07 Nov 2024 00:50:18 +0000
Received: by outflank-mailman (input) for mailman id 831461;
 Thu, 07 Nov 2024 00:50:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PMW=SC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8qj2-0007Qo-17
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 00:50:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dd3d6d4-9ca2-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 01:50:12 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730940604863144.41014049611738;
 Wed, 6 Nov 2024 16:50:04 -0800 (PST)
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
X-Inumbo-ID: 3dd3d6d4-9ca2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNkZDNkNmQ0LTljYTItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTQwNjEyLjYwMjYzLCJzZW5kZXIiOiJkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; t=1730940606; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lWEn4jlLKkuZ/TKwGETmssq13fMmItqS6JfquUGI40ZtCD/Bf0Y0cVqfECIjqI7SKI6pMtDtrv1pX9ILP3Nc63jeLTb4kVu10FZXOZTpaKpDggqPwfNl+7xrVy7v2Y4CaC866LJo9e6rN40cUMQLlSF9Klp7e189R9rKz2qkMhI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730940606; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CQrUaKQJZyNt/jguIR6wgwku9uegLetjZW2K8LXHTv0=; 
	b=a3fMIGEG/nC8CYczgfTw25exx7jlrJnVGDf1gEXwwtRLdG34blfcX54EqKfSi52tQ83tYQdyIOoqFTUx8UF/PTXjzZxUEE/FB9QQWB0MlqJE6/zdoYUqUCGCmMCIOa+R3NwEQ6MBSJaAWjITiMO4XmiIGMNoqGAKyaSoU1bccbw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730940606;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CQrUaKQJZyNt/jguIR6wgwku9uegLetjZW2K8LXHTv0=;
	b=lW7GqHu4pir5A20XtdGZQ8aNS4gjJJdg50WFdr0Hvx6EBitI521uwMyQM46LmXjH
	ncPM5mfaERNT6ljAhXcgFnhf2rKnWInpwKCzxLWKj51aI0+njuLN1NCJ0PuWJ56UrA3
	Z6lm7rXr4/wSY9h2wc6yHQTNXgrmKiniU16Cq7Zs=
Message-ID: <dec1d18a-dd27-4f52-ba61-5428e906b6e3@apertussolutions.com>
Date: Wed, 6 Nov 2024 19:50:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] x86/boot: move headroom to boot modules
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-6-dpsmith@apertussolutions.com>
 <113c48b9-7cbf-43e0-b351-ab7f14f06e63@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <113c48b9-7cbf-43e0-b351-ab7f14f06e63@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/6/24 18:00, Andrew Cooper wrote:
> On 02/11/2024 5:25 pm, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
>> index b1549d8c8f93..e337baa905f0 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -30,6 +30,28 @@ struct boot_module {
>>   
>>       enum bootmod_type type;
>>   
>> +    /*
>> +     * A boot module may need decompressing by Xen.  Headroom is an estimate of
>> +     * the additional space required to decompress the module.
>> +     *
>> +     * Headroom is accounted for at the start of the module.  Decompressing is
>> +     * done in-place with input=start, output=start-headroom, expecting the
>> +     * pointers to become equal (give or take some rounding) when decompression
>> +     * is complete.
>> +     *
>> +     * Memory layout at boot:
>> +     *
>> +     *               start ----+
>> +     *                         v
>> +     *   |<-----headroom------>|<------size------->|
>> +     *                         +-------------------+
>> +     *                         | Compressed Module |
>> +     *   +---------------------+-------------------+
>> +     *   |           Decompressed Module           |
>> +     *   +-----------------------------------------+
>> +     */
>> +    unsigned long headroom;
>> +
>>       /*
>>        * Module State Flags:
>>        *   relocated: indicates module has been relocated in memory.
> 
> By the end of the series, this ends very poorly laid out.
> 
> It works a whole lot better when putting the bitfields between type and
> headroom.

Ack.

> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

v/r,
dps

