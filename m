Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67558996EEB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814739.1228406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syY8W-0007e8-8O; Wed, 09 Oct 2024 14:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814739.1228406; Wed, 09 Oct 2024 14:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syY8W-0007bT-5S; Wed, 09 Oct 2024 14:58:00 +0000
Received: by outflank-mailman (input) for mailman id 814739;
 Wed, 09 Oct 2024 14:57:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnIC=RF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syY8V-0007K3-B4
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:57:59 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd8405d2-864e-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 16:57:57 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728485870474641.1074185064982;
 Wed, 9 Oct 2024 07:57:50 -0700 (PDT)
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
X-Inumbo-ID: dd8405d2-864e-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728485871; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eF86tbeE50LvyDGjsfAo2cxZWHb2OCh6vQfmWnncqsfnvHppkGb/GkKC+BHxOx9yboehNtfdZGptOcgS8kgJv1zNViNm2uGr5SecgMyt9y28KHFMD6zLd+Yc4x5duK1rVpqlNTmUYqxdIYaYTydbGD1Nz0VhoOC15r9/6G0wXfw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728485871; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yd5LR/WM4MKlk292ehbFESZEYtQGV2oyGSCyoeT4no8=; 
	b=nJ+RgB0NfgmEEeTrMTi521mubYBGaBotaStYFk0BfmccoVW2wrel2l+k7L7tmLQQjb2R+wq9kufG3GgTnNUU+QDD7eHQ/6IaIqnEBmtxgL0m7JHKDhu4gSFRZ7RX968+nr2cifQ1YOtxBVjurpgTggyob1khvCRkpDWH4+aOQtg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728485871;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yd5LR/WM4MKlk292ehbFESZEYtQGV2oyGSCyoeT4no8=;
	b=vYl6zk3p1i5OdmAqNhqHfzOqeFOUhCDGLgM5nkfRLU4cWJnJmQzAQ7EtrohRrxkY
	2zEHv/d4YQakBpGrKyefLlIkX7wfpi0I65hriDDOl5LSwTmZ26ZyZPgRCYzs7QSei5c
	EyMglUYHJKOGMJFDNY/QYIEjNpVsgIqbt7+qV3/8=
Message-ID: <91c5898b-7a8d-4f3d-b230-cbc2c9e0306c@apertussolutions.com>
Date: Wed, 9 Oct 2024 10:57:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/44] x86/boot: convert microcode loading to consume
 struct boot_info
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-18-dpsmith@apertussolutions.com>
 <d0d8e53d-d2a2-4441-86cd-6f50aaa36075@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <d0d8e53d-d2a2-4441-86cd-6f50aaa36075@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/7/24 17:22, Jason Andryuk wrote:
>> @@ -822,8 +819,8 @@ static int __init early_update_cache(const void 
>> *data, size_t len)
>>       return rc;
>>   }
>> -int __init microcode_init_cache(unsigned long *module_map,
>> -                                const struct multiboot_info *mbi)
>> +int __init microcode_init_cache(
>> +    unsigned long *module_map, const struct boot_info *bi)
> 
> Why the indent style change?  I prefer the original indent and it 
> doesn't seem like the line length matters.  And it looks like you 
> restore the indent later.

This is one I missed unrolling earlier version. Originally was applying 
the style requested but then realized it was unnecessary churn as by the
end of the series the only param would be *bi and was waiting until the 
last change to move to requested format.


