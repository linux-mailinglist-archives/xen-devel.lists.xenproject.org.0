Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4309979D8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 02:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815331.1229057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhOm-0006g3-9E; Thu, 10 Oct 2024 00:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815331.1229057; Thu, 10 Oct 2024 00:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syhOm-0006dY-60; Thu, 10 Oct 2024 00:51:24 +0000
Received: by outflank-mailman (input) for mailman id 815331;
 Thu, 10 Oct 2024 00:51:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAAn=RG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1syhOl-0006bN-4G
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 00:51:23 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c35c9737-86a1-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 02:51:21 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1728521476050465.139323131785;
 Wed, 9 Oct 2024 17:51:16 -0700 (PDT)
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
X-Inumbo-ID: c35c9737-86a1-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728521476; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X4vFJXHU0Hm6YZUdycpH5FFI6OCMp4auW/2kK9I+8nAAkEo2p497AC17aam5UxGEDV01TBsWEEfe9CNq+QgiWvx6PrU8Anqt7ZZa7LV8oLew6DzsfAq7lxA+RrOXp9qwTYUFB6Lixmb/QaPfufuucZzxXVU4TsqYqORq5Eo3rWY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728521476; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/96HRECIQr3cDVNrj658UI3UOWRbkP5oqGJEAQMhND4=; 
	b=AcL+gei8VeZ//rOiBKUCtrPDZ9iUF2xSqdJCCrvVNb7DYCOjM2R2K6jBpy9TMi9zWaKzHjqe+myNEEp1LZtIy1kW5TbDVSK8JvePSZy/UQGPTF3y3MOUJIB87P2EhDhWhJvjJSZ/DDpReC/6liweWbpSqRXHo9oskcFYcCKW0P8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728521476;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/96HRECIQr3cDVNrj658UI3UOWRbkP5oqGJEAQMhND4=;
	b=W4MgustgpiywZyp5sAYVVkdc1WZO+Do/M45jaDAosJRhTcAhBdib7+D33q6LGB9z
	E561Yk19w35I0edH4Ianq8HuuxBegHUs2K6/RNf8jdq5jzTVhBXFkQMrEDD79016X+/
	UXMWbIzCBs5VONmsROiTNpDHkX23ykUlMkoGYwzc=
Message-ID: <b4266ea0-9ddc-486b-9dcb-1e344aa700d5@apertussolutions.com>
Date: Wed, 9 Oct 2024 20:51:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 44/44] x86/boot: convert dom0_construct_pvh to struct
 boot_domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-45-dpsmith@apertussolutions.com>
 <22c2165b-c2cc-4091-b808-b903fc954757@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <22c2165b-c2cc-4091-b808-b903fc954757@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/8/24 15:56, Jason Andryuk wrote:
> On 2024-10-06 17:49, Daniel P. Smith wrote:
>> With construct_dom0 consuming struct boot_domain, continue passing the
>> structure down to dom0_construct_pvh.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
>> diff --git a/xen/arch/x86/hvm/dom0_build.c 
>> b/xen/arch/x86/hvm/dom0_build.c
>> index a3fd5e762dc4..755e257cdf30 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -1299,25 +1299,23 @@ static void __hwdom_init 
>> pvh_setup_mmcfg(struct domain *d)
>>       }
>>   }
>> -int __init dom0_construct_pvh(
>> -    struct domain *d, const struct boot_module *image,
>> -    struct boot_module *initrd, const char *cmdline)
>> +int __init dom0_construct_pvh(const struct boot_domain *bd)
>>   {
>>       paddr_t entry, start_info;
>>       int rc;
> 
> Again, I recommend using a local struct domain *d to cut down on the churn.

Ack.

v/r,
dps

