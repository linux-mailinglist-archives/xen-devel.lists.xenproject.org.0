Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E57782B088
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 15:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666309.1036845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvxh-0001qv-DK; Thu, 11 Jan 2024 14:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666309.1036845; Thu, 11 Jan 2024 14:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNvxh-0001oa-AB; Thu, 11 Jan 2024 14:23:13 +0000
Received: by outflank-mailman (input) for mailman id 666309;
 Thu, 11 Jan 2024 14:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Cn=IV=amazon.co.uk=prvs=73372ff43=eliasely@srs-se1.protection.inumbo.net>)
 id 1rNvxf-0001oP-Pd
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 14:23:11 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0ce3b57-b08c-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 15:23:09 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-25ac6bd5.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 14:22:58 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1d-m6i4x-25ac6bd5.us-east-1.amazon.com (Postfix)
 with ESMTPS id B12BD49E36; Thu, 11 Jan 2024 14:22:56 +0000 (UTC)
Received: from EX19MTAEUB001.ant.amazon.com [10.0.17.79:19433]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.8.110:2525]
 with esmtp (Farcaster)
 id 632d1ee3-a123-4d46-9a96-0de918162ce9; Thu, 11 Jan 2024 14:22:55 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Jan 2024 14:22:55 +0000
Received: from [10.95.99.82] (10.95.99.82) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 11 Jan
 2024 14:22:52 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f0ce3b57-b08c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1704982989; x=1736518989;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UxX0msj9qVYm6nkqZ3EN4+ZCgnzvJVmxqtKw5NxCdY0=;
  b=u/w+V5AcN1toP0g7ULMdh6nHPCwE+Ay9ec/h/hxyoB2bWOPNn+RPojls
   6XD3JqkbPW/17PP6dEZudPRwXXyPm5zMnBjqhAx0A+D7tP2irzmZnrrIR
   mb9rmbXpvmfpYpNXVzf8vdYW7f1conzTXGTOcQtGemb07VHZBxErPgo77
   o=;
X-IronPort-AV: E=Sophos;i="6.04,186,1695686400"; 
   d="scan'208";a="389156229"
X-Farcaster-Flow-ID: 632d1ee3-a123-4d46-9a96-0de918162ce9
Message-ID: <686fa772-486b-4878-a605-85b021e06058@amazon.com>
Date: Thu, 11 Jan 2024 14:22:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/22] x86/domain_page: remove the fast paths when mfn is
 not in the directmap
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-15-julien@xen.org>
 <52429554-1559-6bae-f3d9-d32152e763b4@suse.com>
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <52429554-1559-6bae-f3d9-d32152e763b4@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.95.99.82]
X-ClientProxiedBy: EX19D046UWB004.ant.amazon.com (10.13.139.164) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)
Precedence: Bulk

Hi Jan,

On 11/01/2023 14:11, Jan Beulich wrote:
> As to using pmap - assuming you've done an audit and the number of
> simultaneous mappings that can be in use can be proven to not exceed
> the number of slots available, can you please say so in the description?

I don't know if any audit has been made but a similar code has been 
internally used for a few years now without any problem.
Quickly looking at the slots usage, I found that at most only 4 slots 
out of 8 would be used during boot time.

> I have to admit though that I'm wary - this isn't a per-CPU number of
> slots aiui, but a global one. But then you also have a BUG_ON() there
> restricting the use to early boot. The reasoning for this is also
> missing (and might address my concern).


Indeed, this isn't presented as a per-CPU number of slots, but the slots 
can be only used before we reach the state SYS_STATE_smp_boot. So 
effectively, only the BSP would use the PMAP slots.

The PMAP slots are meant to map at most the number of level page-tables.
See the comment on top of NUM_FIX_PMAP definition.

-- 
Elias

