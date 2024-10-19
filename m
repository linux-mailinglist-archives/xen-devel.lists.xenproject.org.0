Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B679A4D20
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 13:34:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822454.1236422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t27hZ-0003EZ-MW; Sat, 19 Oct 2024 11:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822454.1236422; Sat, 19 Oct 2024 11:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t27hZ-0003Bb-JR; Sat, 19 Oct 2024 11:32:57 +0000
Received: by outflank-mailman (input) for mailman id 822454;
 Sat, 19 Oct 2024 11:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdF/=RP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t27hY-0003BV-Ld
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 11:32:56 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e04fdad8-8e0d-11ef-99a3-01e77a169b0f;
 Sat, 19 Oct 2024 13:32:53 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729337566204366.4886802052788;
 Sat, 19 Oct 2024 04:32:46 -0700 (PDT)
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
X-Inumbo-ID: e04fdad8-8e0d-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1729337568; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NSAfYFcjdk/xpSZifwfm29T45632m4wEKe5rqCeUlvb1z49jOpx39v5s5sdjzfM1rrtGCx3FLNV2qfBDVTRokqQXvJpn416PbQ/IvA2OkjcxfS4LAPbwgiu/7QQV0BVEUluAWbPkZ1lYiFS6l42fkJWIekoESuJIC+qZIQEJ0iQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729337568; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5S4ocbMRN/ZDTrHRIpLShwguvEXp7SmgKv9cGlo+DFI=; 
	b=OiWGmtOHZzjAaDsLqO2XeeLPOPbfwb+d6s1eZZER9J009aGnVayaSHHYDd3NBi9vh6CloSJwbsu1pz2cA2xhQGvnC64e5f779bONQhlSFvmYSzLdyDJC51/2B1igCJXbp7J7QPGyJ0Nd+rlHXjEGvdw57pkjIJK2XYfAOlA+OQI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729337568;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5S4ocbMRN/ZDTrHRIpLShwguvEXp7SmgKv9cGlo+DFI=;
	b=h10Bp9uMBIaC0gUYn07wcCs2fyRUo6ziX9hrx1bokijlhPJtL28rA6v4aOcGvEis
	NP2hQTc6qx28pqKNLMxPWgY0cUB8uP5KQzNKAKUUPcKAxhgK60lmJnt6YnEpydkFXg2
	2/mbw44+yqaxsKyxAy2e5sV4wDeDHWUOAFk4SQU0=
Message-ID: <f251c5c7-8904-4dc9-addb-5ce02d53164c@apertussolutions.com>
Date: Sat, 19 Oct 2024 07:32:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/44] x86/boot: add start and size fields to struct
 boot_module
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
 <20241017170325.3842-12-dpsmith@apertussolutions.com>
 <394f8083-a6c9-4ccf-8e01-cdc1e6767214@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <394f8083-a6c9-4ccf-8e01-cdc1e6767214@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/17/24 19:12, Jason Andryuk wrote:
> On 2024-10-17 13:02, Daniel P. Smith wrote:
>> This commit introduces the start and size fields to struct boot_module 
>> and
>> assigns their value during boot_info construction.
>>
>> The EFI entry point special cased itself, and pre-converted mod_start and
>> mod_end to mfn and size respectively. This required an additional test
>> in the coversion loop to not convert mod_start and mod_end when the 
>> conversion
> 
> conversion

Ack.

>> was done for both the multiboot and PVH boot entry points. To simplify 
>> the
>> logic populating the start and size fields, the EFI module population 
>> logic
>> was coverted to using start and end addresses.
> 
> converted

Ack.

>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> with that
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thank you but will hold off since Andy has asked this be split and changed.

> EFI now gains the alignment check, but beforehand it was just silently 
> truncating.  Seems better to check :)

My thinking as well.

v/r,
dps

