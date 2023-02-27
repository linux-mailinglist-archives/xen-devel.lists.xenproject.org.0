Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE146A436A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 14:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502572.774425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWdxo-0008Df-7j; Mon, 27 Feb 2023 13:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502572.774425; Mon, 27 Feb 2023 13:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWdxo-0008Am-4X; Mon, 27 Feb 2023 13:54:48 +0000
Received: by outflank-mailman (input) for mailman id 502572;
 Mon, 27 Feb 2023 13:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWdxn-0008AL-6B
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 13:54:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b069aab-b6a6-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 14:54:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8373.eurprd04.prod.outlook.com (2603:10a6:102:1bc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 13:54:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 13:54:44 +0000
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
X-Inumbo-ID: 4b069aab-b6a6-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ff+0nUxswsJEASUn/QdVmotprJ18bObfU6v+EVGQotkd48LjpmE/KZfISw9CjFAKNpGuiLheQzSBSexkiqyJA4fgT/uBM86k0R/hDVnnpsmQAt3loNeirV4BhrYFbLeHigH7lKJgi6SAmCP/Bfcdv+5TDxXVICTo8Nu4FQcb85TLagRaLbjr2sfa4dqibulNE3Y9VoFRq6nYLAlnkKDyxGwc9t3b979bcFUjfWGKMvnhSTLEp5SP1j7AK4jxX9MenNGcpByMiAsCZIKjzKH0HX5djxbRJtIkXyuZp6V5hspq3nslk+GgObdB2jTTp9O+No2EvJtWYBgVC2NenCJB+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKnJh1XNJx81r6I1ikiYJP7tar3NQtoGAyJ9KWkExhg=;
 b=XldyR8hGfZKfeMAkl5Ph8sZm8a8HZTZUKlTXvNByF1GL+8KPhZDqQb4Jm/GkZVCGApaQ4GhVAqHByKaan/H7CwXvXTBYtsMSkzWlWcBhygeIzMqnxetmfZwAPjiMPJxe7xdgZJNEufzRvd/hWVZ44ZdstLqL5KHJ7sUY/dSrGLvsYdQLix+g9bx7riC3zgsVM5VYgRaURBMpo6ZSMhezwvCAV1BOwO7ehzkjbzrLgglBOTnZ2v3t+Goz0VGRAQdXY+Mh9rcxvSTi39DKUmQwtTHQWiDXZMSNLgj53jKw5HCa1ZX7yHKyRjQe/JKrum9OOW3JQHo/T1GSw7vbyNyCTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKnJh1XNJx81r6I1ikiYJP7tar3NQtoGAyJ9KWkExhg=;
 b=XOSTa4ePFECVfsffBjfaQULti5kgbtpOsD3BnXKCzEs3U1GJfX3KZ243SP/zZBRINMQBvdsPqMWcSwQuqZxyPWVlt8fjZ6m/BUY686OrjxP8POaPuwEh9icRRarQynE+q925ju/HQVk90hb1+MgM/p+PDgLzRKzzu1HHTjyEdJN8Ny3ZPp47YKQQuR2F4sPK3OvqY5H6QLSD2UmN2GSW8w0xfcj7TdzfUNgfH+uM55+dLlH3jBdFYrDJTmrCaaqgLZZ6B4JJ+v52937p03L1X6Ef3OwGEEaR3AHZDeSlk5t6lDooDaCwIHE9Q3rtXuld39ew41Vh1UKXdZLnuYEzMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bbf3edac-d992-28b0-91b2-ca97159fbce2@suse.com>
Date: Mon, 27 Feb 2023 14:54:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] build: add crypto/ to SUBDIRS
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230227095315.6483-1-michal.orzel@amd.com>
 <c16cbd72-9a5d-cea7-dd17-c9521328fffa@suse.com>
 <113d8d74-19a6-85da-8b89-1a21bf95960e@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <113d8d74-19a6-85da-8b89-1a21bf95960e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: a145a581-4bfb-44b1-99c8-08db18ca2e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AwlZdYKKIr+h2nvP72E78NoRni3YrkZO6RBH4IQI84svqL+Fw0pChOXZS6THq70XDt9QtY1psP/K6bbX46Hxq0uKson3AZTv6b5N9diYAqSXdb37Lc88RoYNqLRp6h7gvABi1ECr0nGxqvfzvWduRRucURLDk0JMehkAB0uu+cyQXjLRc5lxyuyrOS+rsx1YYH6heu0QslqRU6nUVWH2O/dmHX0mI1RiWnvOnHpJ9LyW39zNDn1VVKptvHU3z/jFMRZYzEWPnKFwha+n77KC5HjuhRJwCQrVVShQ6LNNaYcBEEV7NwhuXoOKsGo6JgI4a40Mj49th8Plm+tXhCl1qN3xSZZ7KuZKawBEleYhboqc5RAtRji9UY4Nbc4gO0mUrmhXMHSohPer191ZYF1ah4qa2S3e4D9FBkLMM9ZpDusIS4hkXfprd3up7htxups4LtRkbBpTvhY+OZ5vpSRdJtuzTyKr4cxxPZYZb015glXmilS4BKD9ZdAjMWGwXTG957Nsa8101zNiLab1NZwWsi2Q1TUaxBLpJHfD6fDCfXWfVin7Mpxp+Mg6p0kappa2wG3FyVRUSA3XsYuMWacdF81QkgZ/Y5Qx4ewEDUE0UxL/C+iPr8+/zdiphhToObzolvJoBk4/IjSvW8nOvwvE9V6SP/EScrbygWtYqCo0v2m82FMyK5UBGWCLhETMCiKuEFzIqa3G4B/4k7PemcSwnU8g3t+V3TXFq9JybVwcNFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199018)(31686004)(83380400001)(2906002)(2616005)(66946007)(478600001)(6916009)(8676002)(66476007)(66556008)(53546011)(4326008)(186003)(26005)(5660300002)(8936002)(36756003)(41300700001)(38100700002)(86362001)(6486002)(54906003)(6506007)(6512007)(316002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDFDTmJUeWJkZjM5dUowSEt4Qk5MOG4xTGJkT1FIc2F1T3NUS3dWbHI3U2lS?=
 =?utf-8?B?cUJYL2QrUzR6bThYbk1vQ2V3ZFowbE1pdTNRZmJBSkcreDFlaE43VUNGeXRp?=
 =?utf-8?B?cm04MU43eGVQdWVWR3dJOER6b05GRlVJTEpSUVNvYlpPVSsrRHVJWnBIWnlo?=
 =?utf-8?B?OVM0L2VpYzEzbGlnWS9SYjNQbG1LNUUyUWNBUVBzb3lTN3ZsU1dGMTZyNzUx?=
 =?utf-8?B?ZThHZGhnRUF6dnhEb3luajF0dUUvRUFUSzhJZ2xROVJYV0dGTWpxcnNhUHlN?=
 =?utf-8?B?SDlOcEtrUndwN0xleHJTUTRibXpzZlFBNmRiZGEvV2RweHQ2bnJqcWJtVDEz?=
 =?utf-8?B?TCtlb0dWOUpkSElnbjNCNEw2YlNmRitwcHZUSlZVU0lEYURRRjR0MkE5Z1lz?=
 =?utf-8?B?bEdINEYxanpjbXNLQjZ3UHhrcnlGdHYza2JocHpQOFdod0s0andYR014dkpU?=
 =?utf-8?B?V3d3dEVMUkhtcE5OTmdHTmxKUlAySy81UkgxNi96a2xRdWFvaTdUb3gwUy96?=
 =?utf-8?B?WGFkWW0rN3pFR1QzYVNldHVBYzBhK0JUdStUSE4veS9zRk90U0dubkpTMnov?=
 =?utf-8?B?TXBJbHc2T1kzazU2NDBLaEd5VnBwbkJSS0lVSUM2bzU4Nm9BTjExVUtrNFJl?=
 =?utf-8?B?Z1JqOGoxTDQwSS8vcUZDRGxHcGZTMGxuR1pKenU2SU9zZmFaVVE0Wnh2dnlQ?=
 =?utf-8?B?Q2E3TkU0M1dvYThKTmNscndnd2FrU0pwbmUxTVlQa1A5c2F3a0pGYXdNd3Nu?=
 =?utf-8?B?WmxUNE5RbmpQblQ1UTBIelZhTnBiVzd2L1p4NW5MeWQ1aWgxK2ErL2RzUUhK?=
 =?utf-8?B?UG9aeU1TRnVEUjRnRlhQY2NKNHQ0alp3UzlIRHcxZ1NPQ0w4Ky9ZVWRJd2RD?=
 =?utf-8?B?YUpRUDJKY2lRR2tHbzNLelJ1UHlscXZaNi9Mck9RTW5nVWV2WkROM01uR1dm?=
 =?utf-8?B?KzhySlJkR25DdFNBOHhzYVFvbmF5QzhoU0czU3lROTRrWk5LOTkxMElMbFQz?=
 =?utf-8?B?aWMzNEI0TVcyREFJQmZ2TDJVSzN2eC9VRGh4eFE1dEVNRnhFNlN6NGJBRXlF?=
 =?utf-8?B?ZzB0aW1rOGhveUFUajkrN2U0RmoxWlVjc0FObFA0T09XYmNEWUxsdE9iSjZV?=
 =?utf-8?B?U1Y0WEdrVHN1SVVFL2drNFRha2h1KzZMekp1aHpJdjhId0U2aCs3OENUSkk3?=
 =?utf-8?B?NmFoM2VzTXNCWXZXWVRMOURucTNqQ1JML2tpNDN1SjlPcTR2cW5YYXhvUlo1?=
 =?utf-8?B?NGQveUVhVWhLaDhKSDNubWs5Z0NhLzhOVU5Pc0RrWjZBcW04M241clhpMnJF?=
 =?utf-8?B?Z1M3S1dHOWxJYUxLYTB5UzYrek5pUDgrSnpPUFcxMncvdDlZVTBwVFZZczY5?=
 =?utf-8?B?WHU1ckVmNEovQVEvS2dOYzRhUmg0WXM1OWpubnlLY3BoTmcydWQ3d1VobmUw?=
 =?utf-8?B?OXZubU5RdVNSckxFUGhrelFRODBDdEJkdnFNRk11T1JVYnF0bExoeG5xcmhC?=
 =?utf-8?B?V3NTTUpDWTltZmFrWStiM1E4YUhxZk9FYmFZS0NMWlljRWFBM09MV1Z5T2dH?=
 =?utf-8?B?UytUVXlIQ01qUDlOcVZsSDBlc2FjNFdpTGxURk9MZVJUSG83UnZmNkNDQnl0?=
 =?utf-8?B?Y05vdUZyckZ4eUd0M05wT01ucFpsZnVTRGtsMEQ5WHF1M21tQ1VRdVVadU5J?=
 =?utf-8?B?M29VZ2J0TmhXVmVxRWI3N25rK1AzUmxxbFR1aG82aU54RmJwUWpDcHRHMEM5?=
 =?utf-8?B?QXRnQ1g0TjhyVHdSSWVNbFVQaCtNbjdEWXRzSGJXUWl6Wk9LUHhOSlQ1eVNT?=
 =?utf-8?B?VmtTQ1h3OVhvN3dGWmVsa3RpM3NKOVNLU29SQk5WYjJYWWJKb2ZOdFVtYkhl?=
 =?utf-8?B?VFNDMC9FMXVvUFpxRnl2bGJEdXhXZGJEckdzNFRRcTJUK05jUUQ0TENYNElz?=
 =?utf-8?B?QWZhRWczWWIrdTgycmt0T3VYUTNmeWh5ckl3SWpSV1REVFUrV09iTVJ5ZldJ?=
 =?utf-8?B?OGR5MnJrZzdndHM4d2Z0dHRxblU1ZERCTXlVcld2U0g3aUJObzlrb0RCazRB?=
 =?utf-8?B?S3RDYlhNTDZDUldQNjJLYzVJb0VvNUxaM1lPVzNmeHV1N0FWSjB0V2pQYTNU?=
 =?utf-8?Q?Our0tFEtX9FwVBT0U6FUh0Klk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a145a581-4bfb-44b1-99c8-08db18ca2e2f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 13:54:44.1795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4kLyHkmS5l8tcYBwqOBpsXLdmXRfdL4M6kJ3PZH/r9UIk9EWkK1z46OYeilAVFQDabM3ZMVK5kThbQWdxvEEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8373

On 27.02.2023 14:41, Michal Orzel wrote:
> Hi Jan,
> 
> On 27/02/2023 11:10, Jan Beulich wrote:
>>
>>
>> On 27.02.2023 10:53, Michal Orzel wrote:
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>
>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common crypto drivers lib test
>>>  define all_sources
>>>      ( find include -type f -name '*.h' -print; \
>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>
>> As long as it's arch/$(TARGET_ARCH) that's used here, crypto should imo
>> also only be included when selected (or at the very least only when an
>> arch might select it, which afaics is possible on x86 only right now).
>>
>> It would also help if in the description you made explicit that SUBDIRS
>> isn't used for anything else (the name, after all, is pretty generic).
>> Which actually points at an issue: I suppose the variable would actually
>> better be used elsewhere as well, e.g. in the _clean: rule and perhaps
>> also in the setting of ALL_OBJS-y. (That'll require splitting the
>> variable, to that e.g. _clean would use $(SUBDIRS), $(SUBDIRS-y), and
>> $(SUBDIRS-) collectively.) It is, imo, that lack of consolidation which
>> has caused crypto to be missing from SUBDIRS.
>>
> I think what you wrote can be split into 2 parts: the part being a goal of this patch
> and the cleanup/improvements that would be beneficial but not related to this patch.
> The second part involves more code and there are parts to be discussed:
> 
> 1) If we decide to create ALL_OBJS-y from SUBDIRS, then we would need to carve out test/ dir
> that is not part of ALL_OBJS-y and add it to SUBDIRS later on. Also, the order of ALL_OBJS-y matters
> for linking, so we would need to transfer the responsibility to SUBDIRS. The natural placement of
> SUBDIRS (including SUBDIRS-y, etc.) would be right above ALL_OBJS-y. However, when doing clean (next point),
> need-config is set to n and SUBDIRS would be empty. This means it would need to be defined somewhere at the
> top of the Makefile (thus harder to make sure the linking order is correct).
> 
> 2) If we deicide to use SUBDIRS for _clean rule, then we would need some foreach loop, right?
> Apart from that, there are other directories that are not part of SUBDIRS i.e. include/, tools/.
> Together with SUBDIRS variable, it would create confusion (these dirs are also sub-directories, so why
> not having them listed in this variable?). Also, I can see that we do clean not only for $(TARGET_ARCH)
> but for all the existing architectures.

I understand that the changes would be more involved, but I disagree with
your "two parts" statement: If what I've outlined was already the case,
your patch would not even exist (because crypto/ would already be taken
care of wherever needed).

> I would prefer to stick for now to the goal of this patch which is to add crypto/ so that it is taken
> into account for the tags/csope generation. Would the following change be ok for that purpose?
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 2d55bb9401f4..05bf301bd7ab 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -589,7 +589,9 @@ $(TARGET): outputmakefile FORCE
>  	$(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>  	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>  
> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
> +SUBDIRS-$(CONFIG_CRYPTO) += crypto
> +SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test $(SUBDIRS-y)
> +
>  define all_sources
>      ( find include -type f -name '*.h' -print; \
>        find $(SUBDIRS) -type f -name '*.[chS]' -print )

The fact that, afaict, this won't do is related to the outline I gave.
You've referred yourself to need-config. Most if not all of the goals
SUBDIRS is (currently) relevant for are listed in no-dot-config-targets.
Hence your change above is effectively a no-op, because CONFIG_CRYPTO
will simply be unset in the common case. Therefore if an easy change is
wanted, the original version of it would be it. An intermediate
approach might be to add crypto to SUBDIRS only when TARGET_ARCH=x86.
But neither would preclude the same issue from being introduced again,
when a new subdir appears.

Jan

