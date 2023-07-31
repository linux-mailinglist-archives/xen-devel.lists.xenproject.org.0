Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3840769BD4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 18:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573184.897661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQVPi-000606-2m; Mon, 31 Jul 2023 16:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573184.897661; Mon, 31 Jul 2023 16:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQVPh-0005x4-VW; Mon, 31 Jul 2023 16:06:29 +0000
Received: by outflank-mailman (input) for mailman id 573184;
 Mon, 31 Jul 2023 16:06:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQVPg-0005wy-CG
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 16:06:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33e2ca7a-2fbc-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 18:06:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7406.eurprd04.prod.outlook.com (2603:10a6:800:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 16:06:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 16:06:24 +0000
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
X-Inumbo-ID: 33e2ca7a-2fbc-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8gfWPujQaoUpxdOO/WEFOgsyxcMxI55o97FR2yuqdpsxFk8Qmzj82joiGYWYjGxDnM4J/Cw0unEW1N+upjOPy8Nqwyg/BM8t/5Jii/tP2ItTWTsJf+92BZz+Wwt+fG78E808YOjBAC8vzCUDHr72LozChs9XpVnN+QVnTHbR4NyQdGM8bTOtCA+ch/EUG3syPvKkr2txw9atehRioGydNmQ/OWRQU+lCEqvdxyY9fARrUh1xe+zDs1WtmggXtZOVZNBJwEx12zvLq77uqXfuIebSTzO/VHEIe9AQMQIHoHS0/nn6abG7L9t+AwABHJUJlu92rpfaHbEELMYgcgOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fxh9v0mrgYFbUK0ELO2Ly+8AEbu5ococKNTQ8RN7v18=;
 b=Ob4sJkHlK/3pB4CDi24UcoN6Lmd5F6h0I3wCd/PEZXq5gVpKEbZktkjMJGiz/B9fZTzgRTcsATSSoXQlTlN5DukfynHTlJ/3RuIfjCTvdSEjxZaP7qzp99fYRCs+scpiYGID9RszfLX7wCBRbEjTm1HwiQfENW4+T6NXB6jPfQLcIz2U+bHif1GZfGYpa7ZfxQhp3zq8n4HzCmGEoGK72qJKz102sb+MWPMHQTi7cM6Tv6shHqEm39Z4DAK/FdYPGWYnjyuEIyHtIjhRHqcC8xYgtPFHGCgjXDnkCiJ5rwE+adn0gIWqgOAArrkKVIIOU8PkxStln/4PtqN6V/nuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fxh9v0mrgYFbUK0ELO2Ly+8AEbu5ococKNTQ8RN7v18=;
 b=yLj3Lxxh0TD0XEfYUpOChJF+g2vqys+S/vllgyKZvYUXxlEC+xc+62YS9UjFnoiTAGYyWRRFS3Rr24QDFSzIXHXc6XzNomjeUCMC5V7l84HtWPfJnMlvRFsUF2bChGDDKYPm8yb+Zi3s9TVJ8MQbHscnmMip3GN02hHuc3IRoLCNEbWrUW8DJ4rJscUNlgWCEqBbNC8qsnVmaB/mKEPu9dtUyd3D5xg7tJCX3oEYYB1mVxCB84zqWaIEUgpMhWjkq9RhpNjxP+0GnOEtDKQ4P7fcz5HDYsDI5ubxE9BHBwO4iZQiwRtwAoDTht/apCiLAmV1zmJnPmFvQj+PPg2r+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc5d6856-03b3-038c-8d9d-fb06309e766f@suse.com>
Date: Mon, 31 Jul 2023 18:06:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 4/5] xen/ppc: Parse device tree for OPAL node on PowerNV
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <fc4011f42ea017ec9ae12c4f1a0c1a09b7bbcfc8.1690579561.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fc4011f42ea017ec9ae12c4f1a0c1a09b7bbcfc8.1690579561.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: b55e09e2-9c5f-4f80-f2b7-08db91e016d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MJqpERB6oN/d17hm4smhEHef6lTTP68DJ3lC1dLV9E6dIPtU3RsC633ehX1vINyvziVkb19r+AdUDonNtw5B/VYeMUr5psTXv+DDN3MbRiAztO7pKcxhEoMbWgPIJL5XE43sHkaB8WfRDgbW/BmHf9TDDdZfvIFRUfIHgOuUzJ0JyehMhyUZ6bhOmwtB+jyALSWu62vhal2WWqA48VX6gmqyi7WRqk31MIfm2uuvCO3VfMIWfDoK/M/fSGTi3SJ4eq6Ss9cz6FOD0WF8xD3h4LmUsZQAyWkjrLCfm8U9pCpihlBmNdSchQZtK7a717iAEodorzmGoYREt+CAMJXWFsYe7Ruy/z8v0uwxkW9IY1mjfYWaZttIMNh0XUjsOwRiJ92wTh8WTWxYzmiotvCL31551U72ndk9tHoUfKet/v7RdOCymwuG+mt4R4Wu/utdVQZxIRyu4P63lWxR3pqXfQX3oGjf8bPCJkhQ3LzE/mPdBfOXjfOyJ9y9dHuFkObk9PoqhNW5a8+1hjpzLd9Lak1YRsOFXroI503gj3umdhu1rkYbQikSgs98VA4b47C2Ewf6SaVyK2KnPp29ZanrZIYLiJQHTloUPU/XzsF/uKxA+IQwBGjWlbg/i77H1kbxXCNaDRGSQdXFlLwnhzRgFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199021)(5660300002)(2616005)(53546011)(8936002)(186003)(8676002)(6506007)(316002)(26005)(478600001)(4326008)(66946007)(66476007)(6916009)(54906003)(66556008)(6486002)(6512007)(41300700001)(86362001)(4744005)(31696002)(36756003)(2906002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUU0emdZK2xwQWpGelhYWVJMQzhNc2w1bXNGd0w2M1dib3RubCt2ejhpYUVs?=
 =?utf-8?B?dmZkODkwMUVQeTY5WG5LczhITXBJVWMvNWlyYWUwdCtMZFB6MW9ZUEt0NnEv?=
 =?utf-8?B?T29SNkg5Y2tLNjR6MUV2YzhiaVgrVjYwaGVHVlpoZFNVeVpSblZGRTJyUmFx?=
 =?utf-8?B?KzdRSXdvRFJJaTRIM1ExcWVrb1YxZTd3eDZxcUlmeWdEVkRzNzRYRlg4bkhJ?=
 =?utf-8?B?WjN2OGw5ZXlpMjIySnFJQU8wNFVDV1E5YTI0UTEyKzQvTUFDQzVlMkpWdmRI?=
 =?utf-8?B?d0IxNWJpb0pYOWNKaUREWmMrakFqaVZIeXVvdjc0ckVkTTQvaFd5VW1ld1p5?=
 =?utf-8?B?aFowVW4wVEFVS0duamdNNkpqdUlnelIzSFdhMVBPRHRjTU1tNUkwZWtJZDJr?=
 =?utf-8?B?WmphV0lxNnY4OEZMMkZUckhSWGFZbkJqNzhPbXFtVXdJNCsxalM4TXZZeVAx?=
 =?utf-8?B?VjFPOG52NHdlenF0RXZ0WWlVeDFWME1aM1lPakI1cldXemQvT1M3enZIRlEv?=
 =?utf-8?B?TVdiT05JS3ZMWkhmT3dMajJOSnY5alU0RU1sWnZYczJMbHpiTDN2dmFSNzFF?=
 =?utf-8?B?eDd5SGVGUXlBNysvUnAwWGlWYjg0dy9MYkRBb0VEWWxVUFdqMGFLK3ZwcnBq?=
 =?utf-8?B?cWozUE5MN3hqS2tuN2FpcXR1S0U4Nkw2SzdhRG5TYWZrUmRTWld3QWxxMkZj?=
 =?utf-8?B?a3JLU0hnR2VMdjJqY0xLZU9OOENlRkhvZ0pteEdWWWJMcTJpSFdRbEdmbkJJ?=
 =?utf-8?B?ZFY3OTA5Wjd4T3BXUjg3TVJ6ZmFnUWh4YVRrQ1VmaXpXdFVMbEc2TTh0T2VC?=
 =?utf-8?B?Nk9ta1MxUUh1L2gzSmoxYUZPY2dnQnlhd25BU0tFNlBOVFIyditaRWdMUmFr?=
 =?utf-8?B?V2JNZEtwMS9Ua2xaeU90WnJadFRNTGp2U2I0Ujd0MjRMejNRRU50UmNUZWEv?=
 =?utf-8?B?K3hPRG82YXJObm0rd2hvWWorMFVQaEZoM1M4cGFxbndrVEx6c0tXaStHK3M2?=
 =?utf-8?B?N3JOaGUzczlGNFgxVHZ2NXpZTTk3UUR3NXNLT01Nd01CdEw1ejZHR3VUd3lD?=
 =?utf-8?B?clQvQVpTa3Z0b1d4d0ZZMWNnbmxiRU5yYW54Mks2eThsVnBYaStqS1FkdFVG?=
 =?utf-8?B?MG9vU2hDR1paak5lem1UVGV5UEpQZHZubTIwQ3NDdUd4ZHZBbjNYNjJhNitj?=
 =?utf-8?B?UElTMFZZbVhrWjB4RXJCakRBUHQ3dlB3cWdtb25uTkQ4dEJXMWNTYllkdllU?=
 =?utf-8?B?YjlVeGMwSGhOWS9DVkhxSWc0TkpDMUFCVmttZ3o1M2ZqanUrL2lqL0ozN3Ro?=
 =?utf-8?B?OXpCbHpzWjVLbEZIRy9EV0Ntbi9idjdMWEd2WTRvMG9kdFkwRWhVaTh4QWp1?=
 =?utf-8?B?WnhXTGNvZEU3OXVlQk1qVk9wbEttcFRxVUR3bW1lRDAvU0RXRUNBb3VLN0Zs?=
 =?utf-8?B?M1dTZmJMK2tNRFJST3RvVHY0aGUxL0kra3BFMnpuNzEvSmlpdGc1WjNmNVlN?=
 =?utf-8?B?SHl5NlYvQ2J0ZUtNNEw3UzBZSUdlSWtEQnVqR3F1SGpiTFRZTndxbVptNkI5?=
 =?utf-8?B?eWc4VlFlN0FlajEvanVMOWZuL0J0L1RIVlJva1phbkt1eVh0dHJjTTZXcCtJ?=
 =?utf-8?B?eEcvYklON3ROWFdoWm1TdVJGdER0RWg4aGU3emlOK3liNG5mSG1ORStoQ3Jh?=
 =?utf-8?B?QkJ2blZyWHpqQ1YzdUdvcEs4ejlpK3k4aEtMMkZlNXlJeVd1L2xiSHFYUmJx?=
 =?utf-8?B?ZzNYaHdaSmZkYlF6VVdRV09IdlNncXViakZ5OUhNVVgrTzR5QlNlZXd4Wk9I?=
 =?utf-8?B?aHJCYlFjZEdKcjltcVlkdnhOd1FOUjV5clh6ejZDaDNIcEVuSXpuUkt0MFoz?=
 =?utf-8?B?a3RGR3E0UHNYNVhsOStEQ2NNMm9MYzIxREtueS9aTWdKRjA1THh1czkyVTJp?=
 =?utf-8?B?T2RpbU9SL2xiTDNHOG5ra24reFNmMHVoMU9MSWlTTFdJYlhtcmxKN1QrWWho?=
 =?utf-8?B?SXdxMXV4OVg3aEpPWHBVZE5na0ZweVdxUjM5Tnh3UGhOZGZkQ0h5ZUo3T1BS?=
 =?utf-8?B?S01XS0YyOHlCd2FxcmlhYy9zQTZjSVZ6cmd5OSt5SWphOTVjbDFWL0JDbitL?=
 =?utf-8?Q?qPUfriMgyZj4FyT+FI9bgV+4a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55e09e2-9c5f-4f80-f2b7-08db91e016d0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 16:06:24.5922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRTEduPa13W77N8Zbnn2996lJLs281I8SmkOZPi26WxXevpJfczMQ+a/0k+r2PUPHC4aZf9dTqcLqBuNtsrhhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7406

On 28.07.2023 23:35, Shawn Anastasio wrote:
> --- a/xen/arch/ppc/arch.mk
> +++ b/xen/arch/ppc/arch.mk
> @@ -10,5 +10,5 @@ CFLAGS += -mstrict-align -mcmodel=medium -mabi=elfv2 -fPIC -mno-altivec -mno-vsx
>  LDFLAGS += -m elf64lppc
>  
>  # TODO: Drop override when more of the build is working
> -override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
> -override ALL_LIBS-y =
> +override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o common/libfdt/built_in.o lib/built_in.o
> +override ALL_LIBS-y = lib/lib.a

Can't you drop the ALL_LIBS-y override right here?

Jan

