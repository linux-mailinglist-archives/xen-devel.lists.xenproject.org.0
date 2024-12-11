Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA439ED151
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 17:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854987.1268044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPW7-00055N-2I; Wed, 11 Dec 2024 16:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854987.1268044; Wed, 11 Dec 2024 16:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPW6-00052w-Vu; Wed, 11 Dec 2024 16:24:50 +0000
Received: by outflank-mailman (input) for mailman id 854987;
 Wed, 11 Dec 2024 16:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLPW5-00052q-Dx
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 16:24:49 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f442f46-b7dc-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 17:24:47 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733934279475558.1676705814723;
 Wed, 11 Dec 2024 08:24:39 -0800 (PST)
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
X-Inumbo-ID: 6f442f46-b7dc-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733934281; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fMWfA2sfkldlFLZX+4QpMTJBKxXob/l+EggJVuoSWGgT4OuwCB5XGbMTa+R1enN9lN3iaa91V02uZKZkYRMyX3LFgaM5+lXbHbJYTfPmFmAMZHknCDH5zrOAIxXFsQfjcPJJcuLDfjUAE3TnuZ7IGkt7PGA2nxC+I69MuXzaa+U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733934281; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KXHtkkYxwv+cpccP6f5l6OxNxOBBConw8tM135nSlWw=; 
	b=bIjO+hI/+DCoo/UclrkXXyl6Jw81CrFQIAr1tc8ocpzlnFIGHDvkThZUh7UUfhNOADzud2+FiRi9tCzJ1fiS+c8y0/loFAV9pJLSLnHm9Qizu1uZy8jK4S7B1+4ye6IlPfh2LbUgSCOYLBlgyRAhimtQsZZvlnNIoYpUPCo379I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733934281;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KXHtkkYxwv+cpccP6f5l6OxNxOBBConw8tM135nSlWw=;
	b=JkvzHSdUEJPlRhE01ydMwGhgJWJUeZP7tPP4yvs9AKkOeSOMYLtuRtJE4NyRkNHx
	IDbiXys3zqPYP6U7RJox8GSvB0zAWNV5QY8Vzv+r5wpHIW9EWsz5+fR5aWIqThRquLA
	rl62ozyRxUSqraW3WuWcdtCn9e3uguS8jDU80bL0=
Message-ID: <688a2399-d0e9-4f1a-97af-037722dabc98@apertussolutions.com>
Date: Wed, 11 Dec 2024 11:24:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] x86/hyperlaunch: specify dom0 mode with device tree
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-13-dpsmith@apertussolutions.com>
 <d93c041b-7371-46c3-bbe6-e5679ba0c73a@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <d93c041b-7371-46c3-bbe6-e5679ba0c73a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 18:52, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Enable selecting the mode in which the domain will be built and ran. This
>> includes:
>>
>> - whether it will be either a 32/64 bit domain
>> - if it will be run as a PV or HVM domain
>> - and if it will require a device model (not applicable for dom0)
>>
>> In the device tree, this will be represented as a bit map that will be 
>> carried
>> through into struct boot_domain.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks!

> 32/64 is only applicable for PV.  It might be worth mentioning that.

Ack.

v/r,
dps


