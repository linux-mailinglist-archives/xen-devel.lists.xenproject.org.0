Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75BA645990
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 13:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456242.713991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2t6w-0000fm-DW; Wed, 07 Dec 2022 12:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456242.713991; Wed, 07 Dec 2022 12:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2t6w-0000cx-AU; Wed, 07 Dec 2022 12:01:14 +0000
Received: by outflank-mailman (input) for mailman id 456242;
 Wed, 07 Dec 2022 12:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+KZT=4F=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1p2t6u-0000cp-NE
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 12:01:12 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d51996dd-7626-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 13:01:09 +0100 (CET)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1670414462789518.7643685690938;
 Wed, 7 Dec 2022 04:01:02 -0800 (PST)
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
X-Inumbo-ID: d51996dd-7626-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; t=1670414465; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A7lSo00Ydku8DrTvixBpI/Mj7gCD0rH9I2s46tT0EQu7GwLOXd2ccLr8Mom5r0gsJ4j4jsiNf5wfrmsocipCQhtY/fEoDIlwIZStOSUHlBJtveTrbrbzxbMqEu3NOUI5ktMDbEPweAMGx6cXsca05c66LY4ipgsfJ1G0zn8+Ggs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670414465; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5YotxaEBrKiaJvbD4JVHAtO1OLm+J/w+QEp318twkTY=; 
	b=XaEf+S1LPBfRM/WyyWisxeqp8Hom7/T7hzH5QabvQlv2MSsP6exQWoPHyttupL2X4B56lAtDWF4Zt9lezIM3KLmuxCcRsyO2aGKO569GwMFXISfa1YawD5NkoffeN2kKzlgu06OekJp1/UD6OXtcE8vQHjea9szcUiS0xx6bqTI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670414465;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5YotxaEBrKiaJvbD4JVHAtO1OLm+J/w+QEp318twkTY=;
	b=ud50v5nTd8eRTdnQVIW5djGQw1OIb9gYcPmSFZTDqZoVkydb9vtyeyu3TR1cmWYC
	Bk4Na4v4Oe43fAoLoybDq9bC/xwaMyGNZjsREgP10lN4r+dXQId4C1e8sk/OerY8G9Z
	8l8I1NKbNtMG0xl2FPnYqo32jernWZ592olG9Lvo=
Message-ID: <42d21770-342b-4279-6ebc-c5be4807362f@apertussolutions.com>
Date: Wed, 7 Dec 2022 07:01:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] xsm: misra rule 8.4 fix
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2212061808570.4039@ubuntu-linux-20-04-desktop>
 <e3b7b6e8-55e7-f88e-26d0-7e2052cca1f0@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <e3b7b6e8-55e7-f88e-26d0-7e2052cca1f0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/7/22 04:47, Jan Beulich wrote:
> On 07.12.2022 03:12, Stefano Stabellini wrote:
>> Fix two MISRA Issues Rule 8.4 ("A compatible declaration shall be
>> visible when an object or function with external linkage is defined")
>> found by cppcheck affecting xen/xsm/flask/ss/services.c.
>>
>> Fix the first issue by making policydb_loaded_version static
> 
> This variable is only ever written to afaics, so perhaps better simply
> drop it?

I agree, I would ack a patch with this dropped.

>> and the
>> second issue by declaring ss_initialized in a proper header.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> As to the title: The changes are contained to Flask, so xsm: really
> is too wide a prefix.
> 
>> --- a/xen/xsm/flask/flask_op.c
>> +++ b/xen/xsm/flask/flask_op.c
>> @@ -56,8 +56,6 @@ static int bool_num = 0;
>>   static int *bool_pending_values = NULL;
>>   static int flask_security_make_bools(void);
>>   
>> -extern int ss_initialized;
> 
> What about the 2nd one in flask/ss/policydb.c?
> 
> Jan


dps

