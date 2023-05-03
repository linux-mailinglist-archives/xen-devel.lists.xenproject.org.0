Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078AF6F50B9
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 09:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528968.822789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu6bR-0005N8-TP; Wed, 03 May 2023 07:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528968.822789; Wed, 03 May 2023 07:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu6bR-0005KK-Pk; Wed, 03 May 2023 07:08:41 +0000
Received: by outflank-mailman (input) for mailman id 528968;
 Wed, 03 May 2023 07:08:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu6bP-0005KE-P1
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 07:08:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52cf0d40-e981-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 09:08:37 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DUZPR04MB9967.eurprd04.prod.outlook.com (2603:10a6:10:4dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 07:08:35 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 07:08:34 +0000
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
X-Inumbo-ID: 52cf0d40-e981-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jonfv+56iCepjnplQOTpQC1sb/vsZZNPYpco53+O1LLm1se8t5n1//JF2kKOYY06Amz7F1tkEEWGHwawegiaMCcyNS1850gYO4gqUXuuksLx6D+ajDS/A/OhLRXkBI4p/HE7D3sG+PhMkGuaNUIHO8NROg6Nz8IXcX4iJr3mcb9KU+Io8XrrObwQWjNZHovgtKyyswgTsOPKlzr8r0peGDXBC973EXmJ2FDgPf551doE8M35Wy3gLCEdenrz+wK2F7JhWLH0kDvBpED9v/RL5u+ln8758sE64lPaH2j94I5gaVk28uHG1wwagAjdniweWVPwHwi7s9uFHOMuo9QABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXcIHP4+HOvaIqGF7aCScNCByN18B1j4dRBfMEacL2A=;
 b=BwWCOiblj89GykKEQ5z5Xm7VKnXVNbac7bOQjzjqfwHMxpMsrEg034IOT02SP3Gx66hzFdqrQTlplV73YPwBYK+u54vLEY0uAXUM/RW52Nvm/SaheplQElVE5YN4ceXwgaBIIHboRg7wVvy28RDQUcp+qIinVlzdW31z4R5TLscjC3PUZJhwc9qafkpFmlUSziNnSr/7v6Y0BqoBoUJ4mZPwtdS4cgd7wf9D4GZKDDkzAXkq5BuaWZJvC2pVE4Q9LUcdJZqpVkfHlM5tlenwn4kLSmvI2HomwRO6nTMsS/maFjaqYB3yyz3XZpl8MX6k31M1aPHOoWEWqahQ3Jy3nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXcIHP4+HOvaIqGF7aCScNCByN18B1j4dRBfMEacL2A=;
 b=K8pTth6oXr0g+dcDCO78ogfIs6sKiHGaattx0PXm5viopVL610FgoUvAU6SIPdnwiKmNS0fn9B+jTbQQHz9UK9bUpHuhKZag9OGocZ3AKZy0e+l8vbIKm2ZK1qT4xv30PDjtkpQFWpLdc/rE8ZNQUZDGwJPtLCnvRvr1CfQi3Uw9/Lvl7X1gv9q+teOIV03DbPtMDQTNdIDquuHM1y6LWpatlPna4sE6yVXZAVC2qYS60UmeRgv+dpVofS+inAELjUSHaMzdMfG62wrMQxU1+tj3kn9azUHdatVmbT05Y7GhlcG5H8dG8RfjmtPbyLQNK/Cgk2lMZINM0LD7fU/9NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9c25ce5-12fa-6271-f61f-eb67404c2011@suse.com>
Date: Wed, 3 May 2023 09:08:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/2] acpi: Make TPM version configurable.
Content-Language: en-US
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230425174733.795961-1-jennifer.herbert@citrix.com>
 <20230425174733.795961-2-jennifer.herbert@citrix.com>
 <5516fbf5-dbfc-dcd5-0465-e4757fdc16de@suse.com>
 <5e877d50-de2d-0af4-9fa0-d4529a97ee2f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5e877d50-de2d-0af4-9fa0-d4529a97ee2f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DUZPR04MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: 583b9408-7ce4-49e0-8867-08db4ba5359b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NbXzl1RMvkvvB0wgYJx6ysTb6i1E5XdpEb+8Xquwzq5gIcoJhxvbDoNEM+H/8moq32t7ZuHXEW++q7EXo5Te9e5Da+dfJbPcPxw/U9I7n+y8d2WEKh7zCNVfCPJ0z/s1grpzMXizlvJr68ev8uDFSNP58tIt9P610m24xsc2TrWrieDOQxNI1oaIrzz0x3XVFMfKA7bZwRswlEUYztS2mpI0cgByLE8U7wZWo5ABgyBdCNpTlQSOaBBCCxUz5lkkmFyE4o0qTLD0tpiDY+cLH6wRsLEWrUf06co37i8DiKasDxE396GSYqv+rf9kkZfZ4L7b+juXrmrDJkRLNNPnO/S2OwphkPSMtErjsuwT2XPzjBTuY+GRrUzlmvgXbW4t5ibAvjAoetJEZkIVQtLVEA+0wwU992X2KBrJu9KvygiQ4EqmNNT4Jnpt3HNQBelwuZ099O3CAgJXbNAUJU62HnGojaCndzSuBsagAOtROGbxouevVaKEGLYeEJ/VHZIw1ChkWNCPH1x7xyZrpQwAsmpMyRrkw5zK6c7t+RjXqa28yAKKVQ+yuTDfGdNNzM89MHHhDtDzi3CqUepANikHOpRQwRBH2zs89wJWY7TxhY8RpVAxNDUoI59gwh+30zmZfUPG11z/AE3h3AfBPMo+zQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(31686004)(83380400001)(4326008)(6916009)(38100700002)(41300700001)(8936002)(316002)(6512007)(6506007)(26005)(6486002)(53546011)(478600001)(66946007)(66476007)(66556008)(2616005)(86362001)(31696002)(5660300002)(36756003)(8676002)(186003)(54906003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkNJQ0hiUFM3ZFdMK1Y2WHUzQWRjc3d0N1NFclRsNlpmYmZoS0RlcWN2WW5x?=
 =?utf-8?B?SjcxaTBiUHF0MTNtRFZnbUJtSTR2REVxWkpIbmJNcXI1K2d5akF3ekRoZGtW?=
 =?utf-8?B?dm9iT1Fud0VLeUtvaFA1akt2cmthTUQ3SG56U2lxS0RUd2Zpd0dhZzJCOVJq?=
 =?utf-8?B?U2xPY0hla1RyWHRYS2d3UEVWVUJZSXQ5REJCM2o3RTVhazBweG8wZTBXN1lk?=
 =?utf-8?B?R2Q5dm1kQzBISVNwem53dDlScWJ5bnRUS1lkVWRXdTdzY0tvMmVHMys2RnFn?=
 =?utf-8?B?WjNERksrU3hDQnZCS3REaGl4YmFiUHBGTVhBMGg3N1duK09aZTRwWjBScjdU?=
 =?utf-8?B?S1NWQTU5b0tIelk2eFdhYWFXaW9kVjAzTEpDb2FZdUdhTWdkamxCUjBxa0RF?=
 =?utf-8?B?YlNBbTdSVGh4b1lkWldOSDRDSmEyQnhpejQyL3Q4cEpvUUE5RW0wRW56WHZL?=
 =?utf-8?B?RWJ3YjZGaFd3UWMzY2pXb3k5b1NoT2Y3UEczQ1gyUDR5d3gwS3pORkpSbGVr?=
 =?utf-8?B?MnJ3YUorbS9hNWw3ODVEeU9RekRpVkFqQzRmd3ZhQmFXRkYrTkRUbzJjd1hi?=
 =?utf-8?B?cUIrY1RHeC9wcS9lSGRIdXhPQnUvbEdIVmRXQnQ3N3ZDWmRZWndmUXY2K1RN?=
 =?utf-8?B?c3BUbnFWRkdDay9rRkZPWE85eWkwOVY0ci9BVVlqWWJGOUhvcFoxNmNuWTcr?=
 =?utf-8?B?L0ZTS2hGR2RjZjd1RTlKWVRDcGQ4cWVlUVdtS0d3aXFyNjN5TElCdkg4eXI5?=
 =?utf-8?B?c3BiS2VaTUJsNytqTzFTSGpWbTVQcFM3bEhaSmVyaE9WcXAvaVROc2ZieWNY?=
 =?utf-8?B?WFplMTh5ZThJaVV1cFNJTkRPQ1lWUzRNTVlGM0dGaUVVU1dWQ3ljZDVHMXM2?=
 =?utf-8?B?a1V0cEswQitFdmJaQnVabEYybXRnT3dKQzJMWDZFZys5Y3Q3ZDB6MFlUMDFm?=
 =?utf-8?B?a2gxamlIN2RMVE5lRHFidWthNDEzMVF3UDhGb01GN2JuTnhmb3ExMkFMRGxW?=
 =?utf-8?B?Zi9MazNIQWZsd0pIT1duRDZjek91cEZJVjdFUTJQbWJybVZHSnN6MWFpYW9N?=
 =?utf-8?B?Y0ZDaU5INWdRZ0grWGJ2blczYTVJa0hjWGpjK2VTSFpaZGMxZjF6T3IzeitH?=
 =?utf-8?B?QWVrWmNEK3JkMEZEMkJoaEdKZDRMNjdkREZaUTF0M1FmNmgyRTR0eTJqRENR?=
 =?utf-8?B?QWEwUlVUY29GNUlFYWFPZlk5T0xjQWt2cmNhVjA0R1NwcmVyd2Uvc0thMnJ1?=
 =?utf-8?B?SGdsK2NKVHVyVnoxUERxUE5zbU1jVXFBNWpISHU0Tnp6ZC8rbEJlVGtsS0dq?=
 =?utf-8?B?amRhVW9FQjVQNHFUMVNsYW1nTHo0L3E0cHNOZUdwM1Vad3Z4ZnV1MlJLajRW?=
 =?utf-8?B?MWZRUXNYNE9UK050R01XTzMyV09FN29KVThscXFMZlBZMEdYdGxOWDI0NXY0?=
 =?utf-8?B?eGw4VVRCbnhNRGhDbksrZlBMMmloN0NLdGxFUmdBRHAzNG9Jb29Yc2pkd2t3?=
 =?utf-8?B?aURhSWM3UEw4QmVxUUVYdi8rWWtCMDJGK2NpdnFBdk9sZzdYa2NzdndHTWk4?=
 =?utf-8?B?ek12dm4rMzJZUkxNb00wNHFXUzVZMmNJSDNHbEFLQzFHV2YyKzB4VEN5Rm4w?=
 =?utf-8?B?aE1HbkJYcW9Qa0d5czZzQVNmVTdNUWVsaHdGWnpZUjMxdkoxNkxzbElxaDFB?=
 =?utf-8?B?Ri9adk1rK0xjTHpSRGhJS2RvM1dOaVpQdWl0ZGlkVGJseEJXZzZpVXpzWk9p?=
 =?utf-8?B?dHNWZHU1TlZtV1paNlN4V1lpYnZGSWV5aUxsMWhKRldjYlZOU0RmSTNLYjB1?=
 =?utf-8?B?TkVyY3Nua0RGbWVOT1lhTVF1TkpGTFBkSE0xeXFPWnBiamNQZlZOWlZDRDBp?=
 =?utf-8?B?TGxMZFlSK2hQb3IwT3BSbERRdTVERlY1VG5HRG5hT2V5akQ0T0hQV0p6WDM1?=
 =?utf-8?B?WXRIWHlkVVJBdzhpRS9rZU1QZ1VtM01UcnJSNmwyaVJUZ2hwMndRbFAxcFFO?=
 =?utf-8?B?aksyK0swRjFUUVNhbWt4Y1ZSekllTDVFTStVbHV4a1hTRVprZXBsWkRlRVBM?=
 =?utf-8?B?b2hhaklpRzExQThlY2lodFFuQng5Z0dEQUliSE51VjJ6enJTSTlpN1BoQmRn?=
 =?utf-8?Q?JKyy3LHSlEmcHleFOR4vlC76h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583b9408-7ce4-49e0-8867-08db4ba5359b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 07:08:34.9031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daZ7ji40hnxsjgg6+6fqpEHd3tevjB60KIg8ZC5XwCBzDXgWuPkVVmBgMFoiiW4gKUOAENdaly4DKog6Ddse1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9967

On 03.05.2023 00:40, Jennifer Herbert wrote:
> On 02/05/2023 12:54, Jan Beulich wrote:
>> On 25.04.2023 19:47, Jennifer Herbert wrote:
>>> --- a/tools/firmware/hvmloader/util.c
>>> +++ b/tools/firmware/hvmloader/util.c
>>> @@ -994,13 +994,22 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>>>       if ( !strncmp(xenstore_read("platform/acpi_laptop_slate", "0"), "1", 1)  )
>>>           config->table_flags |= ACPI_HAS_SSDT_LAPTOP_SLATE;
>>>   
>>> -    config->table_flags |= (ACPI_HAS_TCPA | ACPI_HAS_IOAPIC |
>>> -                            ACPI_HAS_WAET | ACPI_HAS_PMTIMER |
>>> -                            ACPI_HAS_BUTTONS | ACPI_HAS_VGA |
>>> -                            ACPI_HAS_8042 | ACPI_HAS_CMOS_RTC);
>>> +    config->table_flags |= (ACPI_HAS_IOAPIC | ACPI_HAS_WAET |
>>> +                            ACPI_HAS_PMTIMER | ACPI_HAS_BUTTONS |
>>> +                            ACPI_HAS_VGA | ACPI_HAS_8042 |
>>> +                            ACPI_HAS_CMOS_RTC);
>>>       config->acpi_revision = 4;
>>>   
>>> -    config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
>>> +    s = xenstore_read("platform/tpm_version", "1");
>>> +    config->tpm_version = strtoll(s, NULL, 0);
>> Due to field width, someone specifying 257 will also get a 1.2 TPM,
>> if I'm not mistaken.
> 
> Seems likely.   And i few other wacky values would give you 1.2 as well 
> I'd think.   There could also be trailing junk on the version number.
> 
> I was a bit phased by the lack of any real error cases in 
> hvmloader_acpi_build_tables.  It seemed the approch was if you put in 
> junk, you'll get something, but possibly not what your expecting.
> 
> Do I take it you'd prefer it to only accept a strict '1' for 1.2 and any 
> other value would result in no TPM being probed?  Or is it only the 
> overflow cases your concerned about?

Iirc xs convention is that numeric values can be spelled out in arbitrary
ways. So limiting to strictly "1" may be too restrictive. Anything that
evaluates to 1 without overflow nor trailing junk ought to be taken to
mean 1, I think.

>>> --- a/tools/libacpi/build.c
>>> +++ b/tools/libacpi/build.c
>>> @@ -409,38 +409,47 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>>>           memcpy(ssdt, ssdt_laptop_slate, sizeof(ssdt_laptop_slate));
>>>           table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
>>>       }
>>> -
>>> -    /* TPM TCPA and SSDT. */
>>> -    if ( (config->table_flags & ACPI_HAS_TCPA) &&
>>> -         (config->tis_hdr[0] != 0 && config->tis_hdr[0] != 0xffff) &&
>>> -         (config->tis_hdr[1] != 0 && config->tis_hdr[1] != 0xffff) )
>>> +    /* TPM and its SSDT. */
>>> +    if ( config->table_flags & ACPI_HAS_TPM )
>>>       {
>>> -        ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm), 16);
>>> -        if (!ssdt) return -1;
>>> -        memcpy(ssdt, ssdt_tpm, sizeof(ssdt_tpm));
>>> -        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
>>> -
>>> -        tcpa = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tcpa), 16);
>>> -        if (!tcpa) return -1;
>>> -        memset(tcpa, 0, sizeof(*tcpa));
>>> -        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, tcpa);
>>> -
>>> -        tcpa->header.signature = ACPI_2_0_TCPA_SIGNATURE;
>>> -        tcpa->header.length    = sizeof(*tcpa);
>>> -        tcpa->header.revision  = ACPI_2_0_TCPA_REVISION;
>>> -        fixed_strcpy(tcpa->header.oem_id, ACPI_OEM_ID);
>>> -        fixed_strcpy(tcpa->header.oem_table_id, ACPI_OEM_TABLE_ID);
>>> -        tcpa->header.oem_revision = ACPI_OEM_REVISION;
>>> -        tcpa->header.creator_id   = ACPI_CREATOR_ID;
>>> -        tcpa->header.creator_revision = ACPI_CREATOR_REVISION;
>>> -        if ( (lasa = ctxt->mem_ops.alloc(ctxt, ACPI_2_0_TCPA_LAML_SIZE, 16)) != NULL )
>>> +        switch ( config->tpm_version )
>>>           {
>>> -            tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
>>> -            tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
>>> -            memset(lasa, 0, tcpa->laml);
>>> -            set_checksum(tcpa,
>>> -                         offsetof(struct acpi_header, checksum),
>>> -                         tcpa->header.length);
>>> +        case 0: /* Assume legacy code wanted tpm 1.2 */
>> Along the lines of what Jason said: Unless this is known to be needed for
>> anything, I'd prefer if it was omitted.
> 
> I'm not awair of anything, but your comment 2 lines down  from version 2 
> made me think you knew of some.  So if your happy with me removing this 
> line, I am!

I'm afraid I can't make the connection to that comment (assuming I fished
out the right one). In any event, especially with Jason's observation that
ACPI_HAS_TPM won't be set alongside ->tpm_version being zero, I see no
use for keeping the "case 0:".

Jan

