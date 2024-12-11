Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC339EC2C5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 04:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853712.1267095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLD26-0004wg-3f; Wed, 11 Dec 2024 03:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853712.1267095; Wed, 11 Dec 2024 03:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLD26-0004vD-14; Wed, 11 Dec 2024 03:05:02 +0000
Received: by outflank-mailman (input) for mailman id 853712;
 Wed, 11 Dec 2024 03:05:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLD24-0004v5-7G
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 03:05:00 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b354f2b5-b76c-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 04:04:58 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 173388629130453.03034218146195;
 Tue, 10 Dec 2024 19:04:51 -0800 (PST)
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
X-Inumbo-ID: b354f2b5-b76c-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733886293; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e5zBj31BpktjizRmwdGGldjnzao9kGakPtYHaG4P2AwtcQeDq2NN5IJi4nLvCrnpWjGQh6N27KyL+x8bR6LG0UbKBEfZps44zSydcX/gSBmZvvg7DnX2q5K6R4RNR1AQ7RwqHVNQoUkDWx0+QJUY7WMpbLMvt27ynKBLolegCZw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733886293; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ePD0rpqMJrzjGMJQhFsfTVZen5FA6VVlGPmJoiSkJBk=; 
	b=fZJToY5wzGDYH/sNWaEwLv/9lczazAIJb1gPJO+3AvDdNJx5iXwhU1T/gaoeAEPJphXme6V3zgQIOz+hoPiWRppJ1044uC86y+tvOuGdMixK/Yt5IyXGjcDH6eqVDkca2AtzdFAe/oG8keP/cqcDfn2MZBgTK2HvmSUGHUhUrOw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733886293;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ePD0rpqMJrzjGMJQhFsfTVZen5FA6VVlGPmJoiSkJBk=;
	b=p1Nbxs/Kb7z6xR6vJjUUolZTr2/OPk5sU0edsSClIC/HkvDlxl/OzVILzm6CUDtS
	eEo9sqNYpS1+iK5ChXbqD+TNDH1Po+pQpI7R8CvePWusVerwwMnV4AhQB80Y6Va2IW5
	lA07ITIvyvbQOOovLouKsbX+LBSDvWeUyY0Sfh1Q=
Message-ID: <9a5625c8-b73e-4b21-8ca7-2f8ef6faedde@apertussolutions.com>
Date: Tue, 10 Dec 2024 22:04:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] kconfig: introduce option to independently enable
 libfdt
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-5-dpsmith@apertussolutions.com>
 <1c920063-efc9-4004-8670-fa3aae1389ef@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <1c920063-efc9-4004-8670-fa3aae1389ef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/26/24 05:03, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -53,8 +53,12 @@ config HAS_ALTERNATIVE
>>   config HAS_COMPAT
>>   	bool
>>   
>> +config LIB_DEVICE_TREE
>> +    bool
> 
> Nit: Indentation is wrong here and ...
> 
>>   config HAS_DEVICE_TREE
>>   	bool
>> +    select LIB_DEVICE_TREE
> 
> ... here.

ack.

v/r,
dps


