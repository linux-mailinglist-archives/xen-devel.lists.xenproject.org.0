Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FCA492766
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 14:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258512.445260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9omz-0002Bc-5n; Tue, 18 Jan 2022 13:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258512.445260; Tue, 18 Jan 2022 13:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9omz-00028p-0p; Tue, 18 Jan 2022 13:44:45 +0000
Received: by outflank-mailman (input) for mailman id 258512;
 Tue, 18 Jan 2022 13:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9omx-00028j-Sk
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 13:44:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca2445a6-7864-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 14:44:42 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-rpYF5XotN9eFTd5YxO8i4w-1; Tue, 18 Jan 2022 14:44:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8240.eurprd04.prod.outlook.com (2603:10a6:102:1c5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 13:44:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 13:44:38 +0000
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
X-Inumbo-ID: ca2445a6-7864-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642513482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YowkjhqgZsRcfRARselDYsf8HqzUDToEU+CM+fbKVsM=;
	b=MmjSMALFqgwk/v2xuGKfIOpcHX5IgTotxBkR+67DpxsaCjuA7bzoi4HUZ3wy5bblHZNQKU
	5e2bIVqUqaIEM+mp2FIEFynW+jkECBoXY1gnqb4yyEOTvXO1pCJ1k2wxD2U6V6RlWmwz8j
	NWI61rz3Axl4w+evQ8VZQTjJ59wgEXE=
X-MC-Unique: rpYF5XotN9eFTd5YxO8i4w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlejXKPnfBCCkcSNcZlLcYwQ++ejsgq8Trrj2ZW/kVfQCvK97NkKbxj6KmTf7VW+C1Ia7C8ntnRm3X7c/EdOi1WCU93cICZSspTpQy6Qd8e0ZnWdLWF4jyrHWWuyi9Mq4xh5lJ8VCbnyMiHQy4e6Q1bMgS+2lmVoWEWQ+F2qfmIkpVEPKAuWzsy5dOLbvw1guHpYuke01EXIwcVMhk4ghjtaJi/e82mH8b7Mz1p4WcPiPGhQf5HC/A5FXnWsMNFtcaPLmzo0x2DRwauz3qLRCZv8xgyykqU545cjnVAPFeKIusPFuAxNtYAkowMKQPwHogmv7ZoS9ld0K/gh3GVnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YowkjhqgZsRcfRARselDYsf8HqzUDToEU+CM+fbKVsM=;
 b=CcSohgQVWdM6qFDDqd+IxxVLaE59OemfyWOFEQRWK1HGlwTPkWAUcMna+4iBqydbYaMY1hEvLI9efbUQpQjfjCOtSHBQ1AKOrpquZ19brQa/ERK3o546TC4nKnI83glCp1ka57yCc6TPbqgAPrBlscYJ99QmFfNUv8H82r6QEp/agrBSbbFfoXFV1XJgTHQeXP81nJaCRM0j9KrKjK1XdYCp4Z7PCpYLNJQmd9ET6C+KoZDfLXt2/tioR6fOAlljkGV8V0lLY9kFo0gKPw3pVOPta5yp4c+kvvTWsLBY1k6TD7du293b2E0WYVuiqQFAn9YngMMqFCcby1LXZi82xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <565915d4-6ff6-4b2c-04fd-8a1f9d46bdac@suse.com>
Date: Tue, 18 Jan 2022 14:44:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v8 26/47] build,x86: remove the need for build32.mk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-27-anthony.perard@citrix.com>
 <8d7694a4-d7aa-200e-d29a-f055909a13ea@suse.com> <YeabhMhQe/+Pfll4@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YeabhMhQe/+Pfll4@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0056.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcf4df6b-0b53-4235-901f-08d9da88abf2
X-MS-TrafficTypeDiagnostic: PAXPR04MB8240:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8240AA116DA82779CE2D4DA1B3589@PAXPR04MB8240.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i7gGJmiIDl1v7AEAvK7MQVRpysYSCrLPg+3q0ZmOZqHBfgQxbCP3wVtRxEq453uVOhEavMsIwHKLREDtPebSsX+Q7CaXFYVNOU9lgJEgoPLt/Bh/tuncfvR9l+DHAplLOXw8ozSs68zVzFE9mvbm2Gs+yO9o0OxAl3VriNjCaZdByD0lrRodxuFpb/cJ4ck1JUZVJiIOpcMgxPXTb259mlz1sXe9CGaHwB9dv0epS0+LWUAzt7vpkLqV8Sj9Gy3+EPNrNhjwL1coEQPfKj2R4g0I8XAqTYuVYCz43zot5Y7qvZcpD+VnRUnnI+6w6jZWZ/JM0bdikqz+D8CFoEF/6VH15SW5LWhsvJW0ziNKTXirLK+AdkBz4qMLNS0pG4CuQ7XXvDBBYrCCyYcOdVXRru0fkDZYJxyUSt48E0Xib1ZmkWIxt/ytCS0g/awA5i3QEJY7E05AVlnljy5XkIEMPvaV46tdDJqI50/1c5Xq33Fr1dDjfi5BlG44GETMqq0fm5x/vt1x2oKAWeZn0IAQY9/NOL2TGvidTSUTuNt/rwPWMMH3oWI9n7ka2vOeaL5bMWtTJhtzXEyz29TN7gBUtLXJfz9eJl440mQlZ+ZO8s4jl0kEa8sEr/U+jIlAIg92EIsjh4FzzK7iupbr2L3997RCQOo0b1dhzWwcaUwOmVSBEjn6wGnl10blINBemQKgopfdPRy6lHjP9H3AXblfNcH1XUwGgU3nf7bwC3iNfPvBr0cViz+t9sF47PS0FvDB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(316002)(186003)(86362001)(31696002)(38100700002)(6506007)(4326008)(508600001)(6512007)(54906003)(66556008)(26005)(8936002)(5660300002)(6916009)(2616005)(6486002)(53546011)(66946007)(66476007)(31686004)(8676002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzNya0VtbXF4aTFiNkNaeGtlbjZyWFVqeGNIUjNGMFJUMHpSdjdPbVRBb29O?=
 =?utf-8?B?czRwdW1mNU52UVlUUEZvME5tcXlwd3EzVGhibHZpWlRlL3ZEUytDaEpoSGh3?=
 =?utf-8?B?MmpVYVhTN0xNajRNOVgzTnpwY3pKb0tQdUhBY3doeG5ZZ00zbHpLK2FoTlNF?=
 =?utf-8?B?VWR0SDhzTnBMY1FwNVU0YWhIR2Rrb2gybHVsYXpjdzVMMktZN3BrLzVpRFZD?=
 =?utf-8?B?VldwSXJyL3lUUjJtc0ozS1FxeVVFdWx3SmlBNzJYZ2RmenVTdWZLSFJSOGpl?=
 =?utf-8?B?aWYyN1R4dGhYNExJME5BK0RYaHRxaHRGREQ2MkZyN1R4SnE5MEhwR200M0hP?=
 =?utf-8?B?OVFrRHJoSjhzMW1KcmlMR1dwdk14L0ljYjlRbG5mNTQ5dmpwVmxPTWFReHhN?=
 =?utf-8?B?Y0xTMjVyK2ZoWFBxTWh5aXBQdkF3VmtVWUpWdmtXWUpGdkg1S2pkVGI1NHNX?=
 =?utf-8?B?MnE5MnlPN2ZGZmxkS0R0YzhEQUF2UW9sT2JZejFXNXJsRkRxYVk3eTMvRXRn?=
 =?utf-8?B?RkgrZU82NSs2Y0RIbGtGNXpzVmxxdExvKzA1YTdSL3lGK0RpaUZrRzhBRHd1?=
 =?utf-8?B?dkdSMmp0Nk91MDlWSjhzNXE0b25pZm5EZGt0L3NEQnlJSitoeUZ6ZlVCbHlF?=
 =?utf-8?B?TWx4a1VRU3hRVk1XbW1BQTF2dXFjNldqRkNOZTgvemVmcmRDelJXRktEcFZL?=
 =?utf-8?B?alhHbHhzQXB2SS95SFRBRXZxQWpmVEZFWk80VUcrSmtYelpHVkVzaDdqTU5t?=
 =?utf-8?B?VnlKZi9idDZ5azc3SENXOTljY2ZHRlVjTnN3SDRVcGVNYTUvY3VDWDFzREFC?=
 =?utf-8?B?OHlPQ2N2VCtsbWdmU2Zpc3ZLcVNZb0l3MldjZzBBMjl0V05JRTh0SUhMd1Vh?=
 =?utf-8?B?YkxmQWF2Zi96WnlKWnF5WFcrd0FVRUNkeVdFRCsxY04vbU9QTVdWbTJUTzAy?=
 =?utf-8?B?MEJJSkE1S2xjNXlaY0ZRQXFYUU4rSWRlTGRHNnJxWE52b21lemFQZFh4Nkc2?=
 =?utf-8?B?a3RVWXNLYklCRGJvWnVUTHU1MWVXTXZhZzBibjZxd0U4QldzNmhLMXRQNVhv?=
 =?utf-8?B?NkxmenQvQ3VFWTJ6V2FkZXdZLzdxWUVZcDN1RmpSNm9ZWUhyMUF6cFBvd2VD?=
 =?utf-8?B?dXp6dUxWNkpaQlVGVnlkK2pOaFpPQmtjZCtRb2RKZG03Q1JZZEdMNzErR08w?=
 =?utf-8?B?WVdYeVhkMVljNUplQzhxS1ZMRnJsbWtzcmN4S1ovM1lvdDJMY1YwcnM0a1VY?=
 =?utf-8?B?dmpIRWJoWWRseitUb3p1NkpVL1MwUHRPVkVXNFQzZ213MXlXQXA1OFNkdjky?=
 =?utf-8?B?NTdCOS80Z3FpbUROTm11VnBIU2ZFNlBiNUZUU0s3UDVNWVZ1MzZ1djBKREVy?=
 =?utf-8?B?T083b1AwMmo4U3YwMFhMRkVSd0E0cUVHM0N1YWV2N3B0aWYzU0VaYWZnSVNI?=
 =?utf-8?B?SWVlOUdNYldWSll6SkJPUjZXMjRjUjZ5MU9FZ3NmbThzSnpQTkhjdnhzek1G?=
 =?utf-8?B?SFpCMlpHTm00dVQ4eE5td3pHano3cG1TVURjVUlZdi9Ya1dCWHRaM3lTK293?=
 =?utf-8?B?aE10eXBRMVFCUXkrLzFiUmRiV3pXOG5KTkhURGJsZmxuKzZST3pzek5NRGdq?=
 =?utf-8?B?clZHaEU1OEh3UW9Zb3VKNTA5UlduMDQzVmZBTmtIM1poTWlWWlNMUXRVa2tx?=
 =?utf-8?B?NzRlMTBYVG5DS28xSnpuU3dTVVM3ZktCOWtZV3IxZEs1ZVRvUEo5SG1oVWdu?=
 =?utf-8?B?NGcwTDB5Q1l3N05DaGRlSzUzUXB0bWpOQUF4NWR2OFFwdkpyZnR5T0tYMG1F?=
 =?utf-8?B?RDZFMW02dnpydGdtQVV1SWhoRUZWZlJwbHJrU1FHZE5BaWt3bXFvWk1DR2I3?=
 =?utf-8?B?QVhkamFYdk9lU3hORUFlYkQ5TmJpL2Y5WVBWMDllZnVjcGtPTERCZlVrN0ho?=
 =?utf-8?B?L0I2T3RldVl2Wk0rQm5LYklnVFpuMWY2YTVCeE1PRDdCeEQyQVMzSSsxTHVa?=
 =?utf-8?B?OGx6ZGluM1BzdGpjNGpYMGFSZ2FPOVgrcDhwU2ZEMVY5TTEvMVY1cUwwbFVn?=
 =?utf-8?B?VUVWb3dsdGpmTkR5Ym1PZ2ptaGRQVEllY1ZBSjRybWxuVEZ6Q1lYTzJEeGEr?=
 =?utf-8?B?bTVZVnI0aCtrSTNjMG5SL0RTRGZlLzFVK0IzRCtLQnQwRkVrajNTVVB2ZVVR?=
 =?utf-8?Q?3wP3/fSavvvW4HA8jxhL85Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf4df6b-0b53-4235-901f-08d9da88abf2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 13:44:38.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oT8QNFox+LM6QgeOIIwDJF+7eiqX7dWX7nf94XUJB85xeZCKIWPfxrlELFUxG71vE7akbIstkwvDgss/pk9Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8240

On 18.01.2022 11:50, Anthony PERARD wrote:
> On Tue, Dec 21, 2021 at 02:33:18PM +0100, Jan Beulich wrote:
>> On 25.11.2021 14:39, Anthony PERARD wrote:
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -171,6 +171,10 @@ export LEX = $(if $(FLEX),$(FLEX),flex)
>>>  # Default file for 'make defconfig'.
>>>  export KBUILD_DEFCONFIG := $(ARCH)_defconfig
>>>  
>>> +# Copy CFLAGS generated by "Config.mk" so they can be reused later without
>>> +# reparsing Config.mk by e.g. arch/x86/boot/.
>>> +export XEN_COMMON_CFLAGS := $(CFLAGS)
>>
>> For my own understanding (it's hard to check being half way through the
>> series): At this point there are no further adjustments expected to
>> CFLAGS?
> 
> I'm not sure what you mean. The comment should be explicit.
> 
> CFLAGS is going to be adjusted after the copy, for the benefit of all
> the 64bit code (when building x86_64). The "renamed" to XEN_CFLAGS to be
> useable by the rest of the tree.

I guess I misread the comment, sorry.

> The name "XEN_COMMON_CFLAGS" might not be the right one, it is only
> common to everything in xen.git, so same flags that the toolstack would
> work with.

XEN_GLOBAL_CFLAGS would come to mind, but is unlikely to be viewed
as significantly better. Maybe XEN_TREEWIDE_CFLAGS?

Jan


