Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E1F9EC308
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 04:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853738.1267116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLDAk-0000rb-3b; Wed, 11 Dec 2024 03:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853738.1267116; Wed, 11 Dec 2024 03:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLDAk-0000pg-0w; Wed, 11 Dec 2024 03:13:58 +0000
Received: by outflank-mailman (input) for mailman id 853738;
 Wed, 11 Dec 2024 03:13:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLDAi-0000mA-OJ
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 03:13:56 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f29b0b79-b76d-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 04:13:53 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733886827398706.3806840203956;
 Tue, 10 Dec 2024 19:13:47 -0800 (PST)
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
X-Inumbo-ID: f29b0b79-b76d-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733886829; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N7hBbLL3inN7mqF1mJV69T0pAk6Rp9rYqZTXxZkefpUGLCSdss6lf7pUUzwcJDq3Nb7IzXWu3h2bjMjuKH66dJlWkOHDxHqphfRDUIuRxXhOIkV8NOTIKCRX5+VVcLJC9I8YPcf/+wYP8iWbkrZex0LUPHtIl/YuMiAG42URBNk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733886829; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+ZV6I/NgstiBhyVEqKTX60i171W5W3XGpeYJhsvctzE=; 
	b=IbDTAWa5ERfxu5KLgwF5yMZi4XqfXJwQUsN1cKhDRwT0DDIhzImQWw2lg15o37I0XOQwHR3YZ4Mlfos5e99QAhF9mjsVjP8oYkPu7tM2aJKU4vENuiItgy3Nl1voNGGwfmP0pjFIZKXw03fxzHPrkfYlaUSGepNuL24/1gBY5Q8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733886828;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+ZV6I/NgstiBhyVEqKTX60i171W5W3XGpeYJhsvctzE=;
	b=PJLeMl8z9bd1ZnIUGFDUSwJEMELVzGN7nBJ+EX58awzVrl61Fcg3EdvUaY0D12Mn
	//pz4J8+Clrf0ttoYtbyLwizfBQRFzfkddFe/8mvyFLP7RcF25Vr67lBdKg01IfdNxg
	3NwXoKYsUTMDiTeVw6cC8OVnhgvcUb3QKevMSANo=
Message-ID: <cd195c2f-2f4c-4a5f-8cb3-a68ffd50df09@apertussolutions.com>
Date: Tue, 10 Dec 2024 22:13:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] kconfig: introduce domain builder config option
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-6-dpsmith@apertussolutions.com>
 <45787e79-87e3-4583-aecb-4155195ab230@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <45787e79-87e3-4583-aecb-4155195ab230@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/25/24 12:55, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Hyperlaunch domain builder will be the consolidated boot time domain 
>> building
>> logic framework. Introduces the config option to enable this domain 
>> builder to
>> and turn on the ability to load the domain configuration via a 
>> flattened device
> 
> "to and"?
> 
>> tree.
> 
> Maybe:
> "Hyperlaunch is the boot time domain building framework where domain 
> configuration is loaded via a flattened device tree.  Introduce a 
> kconfig variable to control the feature."

Sure.

>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
>> diff --git a/xen/arch/x86/domain_builder/Kconfig b/xen/arch/x86/ 
>> domain_builder/Kconfig
>> new file mode 100644
>> index 000000000000..7be2ec3ed00f
>> --- /dev/null
>> +++ b/xen/arch/x86/domain_builder/Kconfig
>> @@ -0,0 +1,15 @@
>> +
>> +menu "Domain Builder Features"
>> +
>> +config DOMAIN_BUILDER
>> +    bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
>> +    select LIB_DEVICE_TREE
>> +    help
>> +      Enables the domain builder capability to configure boot domain
> 
> Indent is off.

ack

>> +      construction using a flattened device tree.
>> +
>> +      This feature is currently experimental.
> 
> Does this need to be unsupported and experimental?  What makes this more 
> experimental and/or unsupported than any other new feature?

I don't believe it is a unilateral decision I get to make. In fact, with 
the directory introduction, a new HYPERLAUNCH section in MAINTAINERS 
might be warranted with this commit. If so, I would think myself, 
Christopher, and the x86 maintainers would all be set as maintainers for 
the feature.

> At least with the commit message and indent fixes:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

thanks!

v/r,
dps


