Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6276996EF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 15:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496572.767390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSf3Y-0002DD-CO; Thu, 16 Feb 2023 14:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496572.767390; Thu, 16 Feb 2023 14:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSf3Y-0002A3-90; Thu, 16 Feb 2023 14:16:16 +0000
Received: by outflank-mailman (input) for mailman id 496572;
 Thu, 16 Feb 2023 14:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSf3W-00029x-OF
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 14:16:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76614f7c-ae04-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 15:16:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8921.eurprd04.prod.outlook.com (2603:10a6:20b:408::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 14:16:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 14:16:06 +0000
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
X-Inumbo-ID: 76614f7c-ae04-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfqcKCU6GRdXoSB3/xHVfYHzuBbENkMgjvromwG7VjHNwo3AWPHBM0e/nRZoFlHF6h+mmNmc0086PLUZycpUaxTDQPWrg99JMVgp3yIOKfH3bN1bm4bTUwwlBd4AG1QqT7gKE3xlk5RkVtUaIiqyDVv5mqJo8oenNEGnYpaRFw1ILDcCCiIgLVU9Lp3bWvfkXMTgyNsLeyKXAvgOSM2HwK8cY6cN8uWhibQ0omekRAagEkH13R/HErr68oYJIIqdOaQbs0oo6m18iC+6b/LVbliurUSdXxBCH010XxAszPt59j4/+ywAWB6hF1p1eNfSVAJo08vIzs1aGCTrO5+HXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbxQXv0w8dlb73VGKlLjMTS/1U966hOR+jk6TwplR4I=;
 b=MLABkSw3WAn0Vpkq+IzlFJ658qLyT3AAMxytMgrv9K6dK5qY5EgMMx1R6bjoNmctipd4VwF3qiOxhh9XKWdMLyGN6zT28AgQKFKv6VKiPOXhnnrCfg00skMaL0QV6/UtDyQebHZq88vqO0gklPpma2Bq83DMnu2JepEzc81e9L+Ir9JbEoAk7S7DFBX5XzxsMEBvQKojflQuLJGQAw1ewuKrMCFRCgdVCPTwVLZs0RhfcXObtsTxgGjzxI6VG3t5cKnZ7xXdwDMPJyXmcakgg3dP1cdWGzWOaEiPf013B95CZvSMpnAa1TP4n8/9DUW+nRgAX/sbXJGdz/VAScutTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbxQXv0w8dlb73VGKlLjMTS/1U966hOR+jk6TwplR4I=;
 b=r0/VTYPphDoW3no97L8fD250Whik7WGDcrGOP/rEy4yyAtSBL9q9Ocx4dLsd94vplI0l0c2v9/pAAeH6f2tfcp5rJ7vd07TT0MU1WiaX5L/jUdJHnGEZ1agIi1n/nqnm/wJvzgyWDM36OU+/LILh54P37eKf3CquLroIhe5A3IKX5i+E1YTIZJ69BSA5Q2NOC/lSkkrQYMeJzBezMvpcnouRoZ7Dz1sKunSt1daEnSVKIH6wCHOq4PFXremmOwjK9Kp9jIxFc3/ylx3TRKMqydqI7AgqiPLu0b0iZaT5FmNL1HGHJVurJlQbuftXEm2N91cNzrudeSloILLfmZ9iXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e160b28-ba80-c2bb-fa2a-5d5411c7d22d@suse.com>
Date: Thu, 16 Feb 2023 15:16:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 4/6] x86/MSI: use standard C types in structures/unions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <9f375055-eff2-010b-c904-e4122b834777@suse.com>
 <bdd6e011-78e3-4f5d-9005-d9b385b859ae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bdd6e011-78e3-4f5d-9005-d9b385b859ae@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8921:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7e8ecd-bff4-44a1-5669-08db102857ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/DEE0uZ4+qqpqvhf85LMK7qX04mgwhmry5m7k+GFz56agoGm7wiV5plL73DUSDDJaP4jo5GRzEKUdRi7jy31DUY+1O0FKjWZ6rqsxf+mQqZ9bMG7yL8EfaFNFlXJtD3q9rsRhYPY6fEyIqOQy/os/ThzBup1l3ZiIFAMQsYuRiKnqW4DC3ENK0TCZnt3c1sCC9wJzUEhOIeuT4ofjOylmlE/+cEKRwly1NwLIZyaUMf34CbyxuzyApaKWUr8p6YmNnG8mXmbloCTnbwO4So4GZHs80lTxKczQZ6mRePwafdMiUk+EzuSdiq76KdiHYaPJeKUspOh+5t7bznOsmwgktWuHJPlTV9qxJSnSELkioBJwzp/rlMtsa+DrjD40J+Q7GbunqYFxDaS5iM49KDbv00C0vMeKdYAdEtfMaUHIhtTsP63WsWYjVsGfOIi8lebT1Fdfffb1nO4Z/zflxriwXALdRnDxQSE3cBEmbNbk+H1cV+ULTc3Ok0qJncub98UElItt9oZvOc7yKUTb5d4E3R2fITUIbzY/RK5Y45bfhC0h2gk9Eps9ypO6f8fO5SCuNuQQFSjGx6vAuc1xfQOA0DDnhFkIRZXTjH4C3AHqouo/S3cJMUuje32Vrunfv0UQEco4+2xPqKknHKk7+HTaQCUI6BHhvkYKcnLAPi1MTYiq0GblAF3yfPdBAJw1z4CYBnuoL7p01nTaJMSyh7GiHiVQ89ipdonY8evBXhmChw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199018)(2906002)(31686004)(83380400001)(5660300002)(36756003)(31696002)(8936002)(41300700001)(4326008)(66476007)(6916009)(8676002)(66946007)(86362001)(66556008)(54906003)(316002)(38100700002)(53546011)(6506007)(26005)(2616005)(186003)(6512007)(6486002)(6666004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0djLzJCeUlIUEpWSkZJL3k1ZVR3aWJPN2lTdW45d3Nob2FTajFGa1RvTDhS?=
 =?utf-8?B?OTF2Yi9nUHc4Q21qaDVoU2xOcFF4ZTdoV2VzdGZqcjhCMXZEVEV0RVpIdWYy?=
 =?utf-8?B?OE1BRHBqRWNXdGowdjlEUEtIZmhRUVlFOEVYSjZTL3BmWi9xa2tGT0VIazZY?=
 =?utf-8?B?NHVWNXJjVzBIQTRGZ2VsVnExb3ZqaHlIT2RlZHh5bkhQUlgrOTliemV0MmxG?=
 =?utf-8?B?MGI1dmdINU44VVd4L0UycFNEeHNQUEF2V0ZUNTRNRElhc0lCdnZVdTJnejJa?=
 =?utf-8?B?UmJSdE9vVGZkYm8wUjQvSlMrY3VhTGoybXhISVRVZWhPbFlEMHl2dkZ0QjJS?=
 =?utf-8?B?Ty94R2JNSThjbXFla1N0VENubUVUU3V3VDFndFBjTzlaa3NpcjlBajRGbVNH?=
 =?utf-8?B?QmtqdkNrVzR6bks3dzViMTdRM0k1NDNuNzdmTmM1WU1oWWpnaW1tRDFsMkZB?=
 =?utf-8?B?WUNwK0JwQUYxMVgrVXJ0QnR6eVJXdjh1YXZvbUY3Ukh0QlZxNWZvY3FOM1ZI?=
 =?utf-8?B?c1c5Y2RQWG4zZ1o5RnhPc2M1aFFTWS8rK3VGZm45T1ZqdlkzUFhHV1JObS9h?=
 =?utf-8?B?aXVHbnJGV2ptZHVobHJoLzJwZHVRbSs2RVBIa2dweTVSTVpwT0MwcHV6c2dT?=
 =?utf-8?B?dlk0M245Sk14bGRRR0NpRjZCNjF4cUh0RlFQTXVKcGJETEVVRXFxSUo5RzhU?=
 =?utf-8?B?Nm1JQUFpc2F6dEFuU0c0Rzd6VUJKQm1BbGZxekdaUHR3M3ROUVIrc1gveHpX?=
 =?utf-8?B?WDJ1dGZROE1PTVJLWE0wQmd4VVNjNUNnMjEwaHB6UzhKSVQ4QmorTVRIQlh2?=
 =?utf-8?B?bmtRQm10RmM1aVBGdHJTRzJhd1RwSkhxdGhqNkxOUjl3V0JLWFhHZ2ZSelov?=
 =?utf-8?B?VDdmc0FOQXJJcHFoVDdOd0FOdTFlSkRGK0dZWHl4NnJPYjNNWE5XUFllWUN3?=
 =?utf-8?B?L2tIUFBKM3hQK1JNV1AzSXQ2ZTN3YzdTUFhQMXd5b3U4ZFlMU0RTS2Q3MGlP?=
 =?utf-8?B?c3dxWDZZanFVQUJZNHozUDk2S3U2QTJsek1CaTRySVFWd01oSUVtSHdPMjI0?=
 =?utf-8?B?ejJYdFZDb1hYb2Q4Ri94NmJZdUtmN25xQzVzTHpzVGtXekVNRU8wV0FRWEVi?=
 =?utf-8?B?UXNrMjdwTGNsWlgycGFVdkNEU3JNanNwems1Mmh2bU1sTmNaUTNRbnk1bWM4?=
 =?utf-8?B?T0NYdklpWHFrcjkvUjBPOTE3RDFUZDU0aUhOTEJDK3g2RU5tWGQ2K1RrNTU2?=
 =?utf-8?B?Nnd0TU9Xeld4Uk9NM1pESWNRc3ZPY096RWFVVHVWMGpPczY1WkdiSUtBYm5I?=
 =?utf-8?B?YzVUaklPa2FxejdwQk0yL3NQV284NHJWS2gvcWZIU0xtbklad0R0aGp2bW04?=
 =?utf-8?B?dk9jSGJUYlNmQ2VLU1ZPL1BCTU5nTElnQWtpRVk5aHBmbGpoU0k1K1hoMXIx?=
 =?utf-8?B?VjErdHRzN3hQVzViUEErYS9icXJDQTBVSmY4WHIxLzNtKzVJSkxNRmVlK3NG?=
 =?utf-8?B?dmx6Y1hBdEVGQVlkYkVXSWVOQVhiT1hvN2NROVhrMm51Z3RNU01ZdE1FNExK?=
 =?utf-8?B?SmVRMVNSZUdxazRyOWl1Yjc5dWlPM01FLzFPMEo5dGJIaDBzOElZSmM2QnQ4?=
 =?utf-8?B?Wi83eHhoMGRtaGZ2THVqNDFrL3hUTFhVMGVMaEYyQWhTVURnNlhuQ2FRaWZa?=
 =?utf-8?B?YmVQeXdCZWJaUmZ0V2xtZFpFZmxYNVB0QUZyTUZDODBVajB0ZzdiVnN2djIv?=
 =?utf-8?B?N0ZOUGtQL0lEL1ExcElubFNQNjRSWGwvQ04yd3ZWRUZHSkx1UHBRQUxHUGEx?=
 =?utf-8?B?bXF0RGZJd29Jb2RBQXpmSEdQTzNJYkhCL084OEVnQkZEemNwZHhhNWJSODEr?=
 =?utf-8?B?SmczZkZWRG9CZUpMcERkRi9KbXltVGtDNjBLQnpISmk1VjNoZzdUeGQ3ZHRN?=
 =?utf-8?B?Qm9qVzd3OEtpV1RJL04xN2JZTVEvdzVvbFlXbXFYL1N5c3BLWEdxQXROendU?=
 =?utf-8?B?OXR2U2ptaU92NkpzOXd2QXIzYXdiWXR6enBYOVI4VFRIMzNndDRJbUVnQTdH?=
 =?utf-8?B?cHcxODBYUzhDTVdoc3hOZysrc1dnOXRudVVrajVuR0FvUFZCdEwyTXRqR21u?=
 =?utf-8?Q?vUbge1OYIpF8xNEPT3+YXYmkh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7e8ecd-bff4-44a1-5669-08db102857ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:16:06.1205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+iE3hmCkjVPc/pqhQWvmpn4mrb2SC3fY3ZPzwd8UQVF310KZPWmwx/WVydUFElAfZgPFNF5ZaiRkNwiermabw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8921

On 16.02.2023 11:55, Andrew Cooper wrote:
> On 09/02/2023 10:39 am, Jan Beulich wrote:
>> Consolidate this to use exclusively standard types, and change
>> indentation style to Xen's there at the same time (the file already had
>> a mix of styles).
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> So I suppose Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> because
> this is an improvement on the status quo, but I have quite a few requests.

Thanks. I'll be happy to carry out some of them (but the sheer amount makes
it so I'd rather not apply the A-b to the result). It's always difficult to
judge how much "while doing this" is going to be acceptable ...

>> --- a/xen/arch/x86/include/asm/msi.h
>> +++ b/xen/arch/x86/include/asm/msi.h
>> @@ -66,15 +66,15 @@ struct msi_info {
>>  };
>>  
>>  struct msi_msg {
>> -	union {
>> -		u64	address; /* message address */
>> -		struct {
>> -			u32	address_lo; /* message address low 32 bits */
>> -			u32	address_hi; /* message address high 32 bits */
>> -		};
>> -	};
>> -	u32	data;		/* 16 bits of msi message data */
>> -	u32	dest32;		/* used when Interrupt Remapping with EIM is enabled */
>> +    union {
>> +        uint64_t address; /* message address */
>> +        struct {
>> +            uint32_t address_lo; /* message address low 32 bits */
>> +            uint32_t address_hi; /* message address high 32 bits */
>> +        };
>> +    };
>> +    uint32_t data;        /* 16 bits of msi message data */
>> +    uint32_t dest32;      /* used when Interrupt Remapping with EIM is enabled */
> 
> The 16 is actively wrong for data,

It it? The upper 16 bits aren't used, are they?

> but honestly it's only this dest32
> comment which has any value whatsoever (when it has been de-Intel'd).
> 
> I'd correct dest32 to reference the AMD too, and delete the rest.

I guess I'll simply drop "with EIM".

>> @@ -94,35 +94,35 @@ extern int pci_restore_msi_state(struct
>>  extern int pci_reset_msix_state(struct pci_dev *pdev);
>>  
>>  struct msi_desc {
>> -	struct msi_attrib {
>> -		__u8	type;		/* {0: unused, 5h:MSI, 11h:MSI-X} */
>> -		__u8	pos;		/* Location of the MSI capability */
>> -		__u8	maskbit	: 1;	/* mask/pending bit supported ?   */
>> -		__u8	is_64	: 1;	/* Address size: 0=32bit 1=64bit  */
>> -		__u8	host_masked : 1;
>> -		__u8	guest_masked : 1;
>> -		__u16	entry_nr;	/* specific enabled entry 	  */
>> -	} msi_attrib;
>> -
>> -	bool irte_initialized;
>> -	uint8_t gvec;			/* guest vector. valid when pi_desc isn't NULL */
>> -	const struct pi_desc *pi_desc;	/* pointer to posted descriptor */
>> -
>> -	struct list_head list;
>> -
>> -	union {
>> -		void __iomem *mask_base;/* va for the entry in mask table */
>> -		struct {
>> -			unsigned int nvec;/* number of vectors            */
>> -			unsigned int mpos;/* location of mask register    */
>> -		} msi;
>> -		unsigned int hpet_id;   /* HPET (dev is NULL)             */
>> -	};
>> -	struct pci_dev *dev;
>> -	int irq;
>> -	int remap_index;		/* index in interrupt remapping table */
>> +    struct msi_attrib {
>> +        uint8_t type;        /* {0: unused, 5h:MSI, 11h:MSI-X} */
>> +        uint8_t pos;         /* Location of the MSI capability */
>> +        uint8_t maskbit      : 1; /* mask/pending bit supported ?   */
>> +        uint8_t is_64        : 1; /* Address size: 0=32bit 1=64bit  */
>> +        uint8_t host_masked  : 1;
>> +        uint8_t guest_masked : 1;
>> +        uint16_t entry_nr;   /* specific enabled entry */
> 
> entry_nr wants to move up to between pos and maskbit, and then we shrink
> the total structure by 8 bytes (I think).

The struct is 6 bytes now and will be 6 bytes with the adjustment you
suggest. Plus I'd prefer to not do any re-ordering in this patch.

>> @@ -180,48 +180,48 @@ int msi_free_irq(struct msi_desc *entry)
>>  
>>  struct __packed msg_data {
>>  #if defined(__LITTLE_ENDIAN_BITFIELD)
> 
> There's no such thing as a big endian x86 bitfield.  Just delete this
> ifdefary to simplify the result.

Will do.

> Additionally, the structure doesn't need to be packed - its a single
> uint32_t's worth of bitfield.

Like with re-ordering I would prefer to not touch entirely unrelated
aspects. I'll see if I can motivate myself to make a separate follow-on
change.

> Finally, can we drop the reserved fields and leave them as anonymous
> bitfields?

Perhaps - I can give that a try, hoping that we don't access them
anywhere by their name (even if just to e.g. zero them).

Jan

