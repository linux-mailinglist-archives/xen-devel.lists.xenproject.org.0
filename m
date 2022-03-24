Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C894E6488
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 14:57:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294324.500402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXNxq-0006kw-GF; Thu, 24 Mar 2022 13:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294324.500402; Thu, 24 Mar 2022 13:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXNxq-0006iA-Cv; Thu, 24 Mar 2022 13:57:22 +0000
Received: by outflank-mailman (input) for mailman id 294324;
 Thu, 24 Mar 2022 13:57:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nXNxp-0006CR-8h
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 13:57:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52896160-ab7a-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 14:57:20 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-xvVa1J_BNB2-xfRb9hlc5Q-1; Thu, 24 Mar 2022 14:57:18 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB6080.eurprd04.prod.outlook.com (2603:10a6:803:f6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Thu, 24 Mar
 2022 13:57:14 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::fc39:fd17:1086:307a%6]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 13:57:14 +0000
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
X-Inumbo-ID: 52896160-ab7a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648130240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZQweW+I+pgt+FcfWnbZaBe6HbyN6BVC7Jlb0Seu79k=;
	b=D891Zczcb787wFpDZmhyeMmoRfLWTLVVrc3Ova1AkhlLW8nT2B3toV6GffwT00YGElU0XC
	Fx1X/inBI+ktr38qFMIzEBtvb5VbidfAwq61GQG0HzuE+Ds0MfoPyOvMuyBnMVY8uu9P5M
	tDfS2WuaOJUFeF8fSsdCA2bStpcVn+Q=
X-MC-Unique: xvVa1J_BNB2-xfRb9hlc5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9aRfU5ijh59Rxjuv7w/Evt06sxCV1GLSp6cKHQXJ9PmMW3lsRTJXH7kGsHqRSz1vlW/7Bw1lFOMitTgl7khHOpnT+hUBjARQMxVGZ6UpDT0ISgxFdqec9Ys6A/IW4MSN2eHUqjB4xJ3CaCt1WOdstT4/wo8N+SvWWQczDcWwDfwdZ9UdrF0EgFyEA0alPQVGjMHL7r8JdVqpNiqO6nflt4ozJJFsJnyMcmc6ZgfW0QbeMyw61+k0eoMh8fqKZVo11vHMSLXwaqFpUVcy9xOFuL8L+27/SwNWhqJgFRzpkwPQ5jft/+7iZ6QAVFa3Zz2trMbSh/5kX2XRkvU8oucqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZQweW+I+pgt+FcfWnbZaBe6HbyN6BVC7Jlb0Seu79k=;
 b=Uodsl6vFC39b39q4WZSCVg9GUEwBNFD83hhkHHxZGm2xrHNX55ArBC5nobisnRquGd6cXJIhU3F3tOFyQ1lY2puXGtP7Mo814XcaaSNnrOIaK0j/g7jDIzW55gpQQlR+Ta2LwSq3nHJ0I7T2mbWuipxa+PtHONtJneBsSKcEQTj0ARdkfllHK7MuZAONERSlP2oD6XQhxSjz5p7woELxjqLVQXr2zWxpypfK8MW5Nfkj6n4SXXOSOnpTKXdxdnUVAxFq+fHpjNJf81Xb/vl/PcISezWpgLVbX7+tyhoIF47/C+Egf/SyoEATNsvjOFN0GpwBilhkLd7FOGYlAPXBKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49de1f24-e72a-69ea-f9d6-3c17cd0fc162@suse.com>
Date: Thu, 24 Mar 2022 14:57:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 03/10] xen: harmonize return types of hypercall
 handlers
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20220324081312.18222-1-jgross@suse.com>
 <20220324081312.18222-4-jgross@suse.com>
 <c53e65d5-82fa-2cbd-c49e-94a3935c2b7e@suse.com>
 <84010992-34ed-3e40-f70d-da91cbb0d210@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <84010992-34ed-3e40-f70d-da91cbb0d210@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0114.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a660bf2-e1d0-49a5-3ae1-08da0d9e3367
X-MS-TrafficTypeDiagnostic: VI1PR04MB6080:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB60800965CC2FB1E95B4F643EB3199@VI1PR04MB6080.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fFGcoNHsfsH8mO3JgdNM0v/k5TKwa5UE84asQWE/NflNr6ggvyKCfmmeK54e0l4zrjBaOD5hX9e36CGh0kTWx9jtk+50FxufVcfvRqM0EL5OFj6J9AYuGGXGPN1X+5urSKQW+5bRiitB5yVYQkPOIWm1EnMpU3XUR8FhLMPmhxsNbVpTlg1jZGbUvux1Zwb116aYP/0K9lHXw4xAHIMV51FgYYF+QZYnk1ceKgQ2qXmCG0L57IJlMdF/YQZnvhmfTCQgL9maiw01SgpSKU0nu57ak0J9GM8gwX21c2sZrJO9us85SUlP6xZD6wTcmP6JO+jf+DAen5TMTx2waoty0DHtyAcKR4x+UUbt99C4QXxKfqeqlQE3yUgFT6EEa8KDUbhzlGsNZ/mBHWG0EdJjuwzsCj9VCkRihXvEl8oebRB74mgQFky9QwjkUfzwRCTdO6mn7JBurjE3qGh8eqCY6aHkH0VGfeoE2sXCJIxDxLvNb8CjFS0HY4qV3mhkKWex2xeonVQwjdr4Bf7D4xoRPuwaCeS8c96rOgdzpzlGIJiatE118TUaaGeYyTDamNR7XYY/qdH8puEqCpU+NSvuXXizwkM7ed8xmEUc0xn04CpdhNX09yqQ3RFi64kBmcLL1MQYj4x2U1ZpH0FhY1NUeOipDjzJqxL+9vQtY3f3MCkYmebvipCpyRUcWWy2PcBZCH4KJiJB1JfPwU1e57IKPZBeOyU5sEEx9zNCTqUJXm4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(6486002)(4744005)(508600001)(316002)(6636002)(86362001)(37006003)(54906003)(2616005)(38100700002)(26005)(186003)(53546011)(6512007)(6506007)(6666004)(66476007)(66946007)(66556008)(31686004)(2906002)(8676002)(6862004)(4326008)(8936002)(5660300002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmNOQmxoMmYrcG9yMzBOa1VOMEo1enB0MndSSEdNYW8ySDhzWlRuQUQ1c2Uw?=
 =?utf-8?B?THZ6QWx3NFc4YVk2bmk5Z3lnNWgwME1icGc1MVBCdnQvQ2t5cjhock1MdVFH?=
 =?utf-8?B?d2Y4c2NxZVdpRVBsUlVEUUxBd2FrL0NnalZGUDJ1VkFXazM1V1pSNlU4NStS?=
 =?utf-8?B?OFpyWm9RUUh2TWlVQjF4VFJZNWtCalF2bTRKQzB5ZnMwWnp6ZCtaS3VXaTY4?=
 =?utf-8?B?OW9LbUU2QUdXc29qb0tXaGMyTEhuQmRuRlMxc1B3QmhYSyt1b3Y4clI0d09t?=
 =?utf-8?B?RFV4NHNGUi9hbSthOFQraG1pTEIxQnExeFVHMDU1Z0FoVEN0R2JXSDBZakZx?=
 =?utf-8?B?TDF5V0xvV01MNHVIOEViN2dybG1lWEQyWWJqSWc1Vi9rbzByeTZtR2ttWUEw?=
 =?utf-8?B?MEsvWEhQMEROVmRJNHByN2x1c2lmU0x3cDNTZnk3RjJSaHNTYklRMTZpYW44?=
 =?utf-8?B?c3N3bkw4UVRRQWorYnJvV2R1WDR6Rmt4QlBXcFhWTGJhVEtabGdkV24xbll1?=
 =?utf-8?B?NUlONXF5RE5nL0tDUDVNUXN5T2JSelJPRG5RdEJiMmk4cW9zZ1dhRDg5c0hz?=
 =?utf-8?B?Ulo3WXBuTW9taDNRc251cExSbGhSbVUvUkk0Qkh4OXJody9Zb1V2RDlxVUVZ?=
 =?utf-8?B?ZWZDaGVjdjlrekxrUDJYNXVuem9RUUpHd0F0aEVwL2lsRDhBa0hxYk9ZYmR0?=
 =?utf-8?B?SmY4dmFLTUhUT0o2dFlBUHpWOWwrc20xYzFTS3lleEZyUE84aEpJbFNWVFhE?=
 =?utf-8?B?L3RhODNCK3B2WkxLRS9PZURqNkdnU2Y0bjNVWWpNaGxaRm1rbE9SYWQyMjNL?=
 =?utf-8?B?UGdiQjl0alhBa1c1d1Z2eEVxR1U2MUdsUENZZEpDTFA3Uk0rQk5RVktUVE1v?=
 =?utf-8?B?OHU0akZSNGwzaVhFcXo2MlJJaXVQOHhEVG8rYkJnblIwWTVBVjNrUDJwcm05?=
 =?utf-8?B?R3pkWFF3bU8vTEkrRGc5WDZFZkJ0akZlS3hIUDJpKzUva2o4TTBONERyb2d2?=
 =?utf-8?B?UHlnbmFtQnVSaFNVS21FSUxmclgvUnpTb2NEOUc4Nm5BRFg2M1dCWHdDblF0?=
 =?utf-8?B?VzNxZ0d5UElYNzRvQmJkNWpIcS91ZHBpdnB2RmFHTDc2T1ZUaGFKcEo4UkhD?=
 =?utf-8?B?WWk0VzFsb0wxR3ppUWx3NUtVdkJoZ0loVG14QS9zOHhKU3hOSThZNTNTM0t6?=
 =?utf-8?B?ZlQ0cVNEdGxubm1hblpCZGZvV2tjS013cFlHQkxOSTVmZ1ZRV2FpdlVqRldV?=
 =?utf-8?B?MVNoMVVHTk9CQmEyQ1IySkFYMnFxSWJ6TVdIY1VQV1ZCYWZOanB0bWM2Y2Rs?=
 =?utf-8?B?YzQwRGJkWklNVko2cllSaytaa090bHJqYU1vNFlZYk5qK0wvT1oxYzVqRGp6?=
 =?utf-8?B?ZGlGdUFFYy9mWWUrZ1hLcXVtMTVJdUFuMlZwL3ZSMzN6Y0pJMDN3QkFEdnVm?=
 =?utf-8?B?SktVbXlRd2JSUVRlbExuekJGZWdOam11ajhDVEdyZFhWb2ZiZTc2VThrWlFn?=
 =?utf-8?B?QVo4a2JOc050dFZJUHFpck9mUVVoeFhPekJtSFNwM2E1aHpyOEtUWUVwZWIz?=
 =?utf-8?B?bGV3UkhOYW9wYlJ3bzRJYk4rdllkMU1aOWZvVnFteHM0Z1NMV3pXay9iQ0x5?=
 =?utf-8?B?R1p2K1lrL2FZWEVMVm9sc0tHRjFEYS9sMnQvR09ra1JoajJaaElQZ1gySE5r?=
 =?utf-8?B?bUYxdmZXY2NObU9yNE01YkJuOWVScTM5TkFwSkdsVzRDMDRzRWx0akUrKzVw?=
 =?utf-8?B?SVRZamdtaXpiUDJVTmE3OHFKbzBadUs2emNwUW1DcGVUbUFWaGRrQ0RnR3J3?=
 =?utf-8?B?YmhjdHZ6K0hxcGlNRU5nekJnYVZRczZBVWNSa3BjYkZhOW9DYVpCejBRRWkw?=
 =?utf-8?B?NmxidVBqTU5EUmM4M2FFNkRqN05XTXR1SE95ak0vZVlqdXJweFAxQ1JBMG9t?=
 =?utf-8?B?R0JFVUNucm9QRHppOFpXVCsvUGlldUl0aGVrS2laK2V6UWNuZm5EcnI5VnJ6?=
 =?utf-8?B?ZE80TlRhQ2JRUTBldXlTbGdpbi9nWDBqWUM2RW5pTUJDY2dIRUdFd3dEVUVj?=
 =?utf-8?B?N0NESmJWa1BjQzFwOEZXNjRUTjV4cnNDUlQ1RVBYeVViUmMvZzRUbmpob0pl?=
 =?utf-8?B?ZjI4YzN6YWRnV0xvL0dCOFAxQVUwbzA1RnlBa0w2b2JlakgvZnlveThNWlZw?=
 =?utf-8?B?bEQ2QnFRemx5MWliMU9lV2VWOHJPQnZlb2kyZjNuYVRhMXB1TVRwTGw2VWVt?=
 =?utf-8?B?OFE1STMxaWNXem1vMFB0TW8yNHlhNlFJSzljVnhMUU03NktSQVNmZzlNaTFQ?=
 =?utf-8?B?T09wdStCWEFpd3BXU0NHZVVIaFpVeHFDMUlOVDVmV0NFZTQ5WEUvZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a660bf2-e1d0-49a5-3ae1-08da0d9e3367
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 13:57:14.6305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfOPb3bJmk8tsQWt0zaAB/chFStEXMaaTHFS16gDSC12nfMs9rHy8/E/QOq4YhgQWw2dxiMoZ8hygoYC1U2BQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6080

On 24.03.2022 12:19, Juergen Gross wrote:
> On 24.03.22 11:57, Jan Beulich wrote:
>> On 24.03.2022 09:13, Juergen Gross wrote:
>>> Today most hypercall handlers have a return type of long, while the
>>> --- a/xen/arch/x86/x86_64/platform_hypercall.c
>>> +++ b/xen/arch/x86/x86_64/platform_hypercall.c
>>> @@ -4,6 +4,7 @@
>>>   
>>>   EMIT_FILE;
>>>   
>>> +#include <xen/hypercall.h>
>>>   #include <xen/lib.h>
>>>   #include <compat/platform.h>
>>>   #include <xen/hypercall.h>
> 
> This seems to be an artifact of the rebase done in V4 of the series, which
> was necessary as Andrew's large series used two patches of my V3 series.
> 
> Do you want me to resend without this hunk?

Well, I'd also be fine if you tell me the proper resolution of the
issue in the next patch. I guess the hunk there than also needs
dropping? And patch 5 adjusting accordingly for context? Overall
it may indeed be better if you resent ...

Jan


