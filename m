Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63C7651FD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 13:08:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571030.893871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyqh-00056z-6e; Thu, 27 Jul 2023 11:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571030.893871; Thu, 27 Jul 2023 11:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyqh-00054B-3v; Thu, 27 Jul 2023 11:08:03 +0000
Received: by outflank-mailman (input) for mailman id 571030;
 Thu, 27 Jul 2023 11:08:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RfsC=DN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qOyqf-000542-3c
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 11:08:01 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7baf831-2c6d-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 13:07:59 +0200 (CEST)
Received: from [10.10.1.94] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1690456069410632.3201078848144;
 Thu, 27 Jul 2023 04:07:49 -0700 (PDT)
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
X-Inumbo-ID: d7baf831-2c6d-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1690456072; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cqZ9HDVq8rctYo2627CbbrKdDZdThT5NAa+ZwxyxNxsaNJBJlP8RcARyFA3BZpFZ+PUMkYQ4c681YIwujGuoAYB9spM3iuCa58XdAAXNtbm63i30d0hjWPBCHWmDdorma5WwKjDsj4Lyex/tNk2+cgO5Zrv+YbuuUlp1R77Yn4Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1690456072; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=lpKA5PHRg3WWL504PILmYBYaZ5GD8vX74mjfOTcAdGQ=; 
	b=YAvA8/J48pgHcLArErgPtZAAYXJ6Wlybjim/4y2a4/jbdYXnIWZGwZgUpvEZhijGLSfLzftJ1VFAuk7E0NUshx1ENibwTIfbi25DP36EAOc3x1xnVqmWi2niCp7siNtjJooP3UPkC/vIKqu37uKaxCPWw/CqaULFBt/2cfNhPww=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1690456072;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lpKA5PHRg3WWL504PILmYBYaZ5GD8vX74mjfOTcAdGQ=;
	b=StC/ZIY7L4MpKu66Y7MYqgspKpqC3rVcvoks4b+RGOtcmd1Sv2v28Gyt3QbdtWW9
	ObEfUpjnwKqYN2UDS+zLIbv05O2nkbmq1kQ84Ha/x/aR/vW1e6inxc9MzqiIzB8kMT8
	VycNpjvEKZ0BAtGCYb5d7vnFPoY7m2sdKWh3taGE=
Message-ID: <d46a1bf9-2f66-542a-9e7f-3d298ad1adb2@apertussolutions.com>
Date: Thu, 27 Jul 2023 07:07:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] vpci: add permission checks to map_range()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230726140132.80151-1-roger.pau@citrix.com>
 <a277dacd-56f6-a5ab-6982-b5cc4f9d507c@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <a277dacd-56f6-a5ab-6982-b5cc4f9d507c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External



On 7/27/23 03:56, Jan Beulich wrote:
> On 26.07.2023 16:01, Roger Pau Monne wrote:
>> Just like it's done for the XEN_DOMCTL_memory_mapping hypercall, add
>> the permissions checks to vPCI map_range(), which is used to map the
>> BARs into the domain p2m.
>>
>> Adding those checks requires that for x86 PVH hardware domain builder
>> the permissions are set before initializing the IOMMU, or else
>> attempts to initialize vPCI done as part of IOMMU device setup will
>> fail due to missing permissions to create the BAR mappings.
>>
>> While moving the call to dom0_setup_permissions() convert the panic()
>> used for error handling to a printk, the caller will already panic if
>> required.
>>
>> Fixes: 9c244fdef7e7 ('vpci: add header handlers')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I've committed this, but despite the Fixes: tag I'm not sure this
> wants backporting. Thoughts?
> 
> Jan

 From a cursory review thus far, since this introduced a new XSM hook 
site, shouldn't this have at least had an Rb by an XSM 
reviewer/maintainer? I would have replied sooner, but have been on 
holiday for last two weeks.

V/r,
Daniel P. Smith

