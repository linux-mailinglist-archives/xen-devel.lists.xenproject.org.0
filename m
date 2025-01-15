Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397F3A129D3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 18:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872940.1283940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY79n-0006j7-Vi; Wed, 15 Jan 2025 17:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872940.1283940; Wed, 15 Jan 2025 17:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY79n-0006h1-S6; Wed, 15 Jan 2025 17:26:19 +0000
Received: by outflank-mailman (input) for mailman id 872940;
 Wed, 15 Jan 2025 17:26:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3mb0=UH=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tY79n-0006gq-5m
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 17:26:19 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce1e5407-d365-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 18:26:16 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736961951913170.49136125974746;
 Wed, 15 Jan 2025 09:25:51 -0800 (PST)
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
X-Inumbo-ID: ce1e5407-d365-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1736961955; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JWo/AL4MILPlxOfA67ddLaVtzGN2xgxVdUqCzYBoK9eYpE65JiykH+/9DtPs67wFIykw3vFkjatLZhsFIkEWsPMvXtmet7jxr7wR7tVUxJNkZ0IMdzehL/WvIPy8bWz1vNvG26F2bRfp9+ioLIS4QBdN4j5vwME+FTECI83gZz8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736961955; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fy+DIUmUOKoZIHNqVEZaQ3xT6N2YzcU+DcPNi2zQD3E=; 
	b=Ut/HneLEffkByqQx15V28BqBojGcNjs4NQLBy+GjsCwO8jVGIZAcFSti9EXxhysA98gcirZNB8JSd9T2OiwXGhnkMn6KeqIZnP3ftb3K7loJsojk8DAG8e2P3aqChua73D/YmsxyD0YKz3UOrQOnGrpdqYf6zn8jpbjvFhHF9b0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736961955;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fy+DIUmUOKoZIHNqVEZaQ3xT6N2YzcU+DcPNi2zQD3E=;
	b=M73pzxBu7I5TtquNzxd9g2oPnwGGwqo/QO4IzVhnQTXi57f0X4FCTAUIaDg05QN2
	0U5+iEtbouECMxRJMYFxWZCsAMt8zMSpqHgz4ruyPsBniD4sRWyi2aOPoKCwJsjkdAD
	GnlYtkFSfBHH5L8MN35rRaeCO8hYaqTVnpUe6euY=
Message-ID: <6e22a62a-cf33-4d44-b646-947bf8edab61@apertussolutions.com>
Date: Wed, 15 Jan 2025 12:25:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] x86/hyperlaunch: introduce the domain builder
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-7-dpsmith@apertussolutions.com>
 <c39d6c7b-0cd8-4b71-965f-1fd0d49b5221@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <c39d6c7b-0cd8-4b71-965f-1fd0d49b5221@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/8/25 16:54, Jason Andryuk wrote:
> On 2024-12-26 11:57, Daniel P. Smith wrote:
>> Introduce the domain builder which is capable of consuming a device 
>> tree as the
>> first boot module. If it finds a device tree as the first boot module, 
>> it will
>> set its type to BOOTMOD_FDT. This change only detects the boot module and
>> continues to boot with slight change to the boot convention that the dom0
>> kernel is no longer first boot module but is the second.
>>
>> No functional change intended.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
>> diff --git a/xen/arch/x86/domain-builder/Makefile b/xen/arch/x86/ 
>> domain-builder/Makefile
>> new file mode 100644
>> index 000000000000..309a0c4bdd9e
>> --- /dev/null
>> +++ b/xen/arch/x86/domain-builder/Makefile
>> @@ -0,0 +1,3 @@
>> +obj-$(CONFIG_DOMAIN_BUILDER) += fdt.init.o
>> +obj-y += core.init.o
>> +
> 
> When I git am-ed this series, git warned:
> Applying: x86/hyperlaunch: introduce the domain builder
> .git/rebase-apply/patch:59: new blank line at EOF.
> +
> warning: 1 line adds whitespace errors.
> 
> I think that is here.

Ack.

v/r,
dps


