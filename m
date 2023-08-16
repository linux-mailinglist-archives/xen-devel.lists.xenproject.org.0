Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2AD77DAA2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 08:48:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584201.914680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWAKH-0005DO-8X; Wed, 16 Aug 2023 06:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584201.914680; Wed, 16 Aug 2023 06:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWAKH-0005Bg-4R; Wed, 16 Aug 2023 06:48:17 +0000
Received: by outflank-mailman (input) for mailman id 584201;
 Wed, 16 Aug 2023 06:48:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWAKF-0005Ba-8W
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 06:48:15 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dec71cb1-3c00-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 08:48:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7472.eurprd04.prod.outlook.com (2603:10a6:800:1b2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 06:48:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 06:48:11 +0000
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
X-Inumbo-ID: dec71cb1-3c00-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chkwCtzDKJcCEsREc730T4iPZRqiXmyNR9KJ6M8FoCfDc3UHNzPGji/CBH7PYcT1SOqkCNSoI/t+htt6pNMljfZQXfWy4U6vwZzEv5xH6b4KBztRxtSEIObg7zl/I2W5iLm0siKLXZ0ZMLrl0gBNexcSR7/J2xuVMQaBQ3cQh+2zWcgRK1crr3Oqlh6zdwwQEiFK2u26/09XeqxWPShZEFLJuQRElllXfsZ3O2kATTVS6G+5HW4vJF7BJDkSXUamSf+NeLV/CdkKjU5fllOE+e5wpkni+x/6X4FUED2CMdSEZfzmz18+R90l7yqLf5BJAPmaeEYxnR6SJasRtbhFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGHNMfFy1kDIWbXKm/Mw83ZPFgVnV1dUZNtPWMS6o1w=;
 b=a+uzSGFD/FlD6kkWGFkwuWznyaBSNwqvq0dy3yppK8jYG5rXq+dkexyyKbN4mxgic1Apgy1eRIHOtUK3A3BThWL9siYACDR7mvOr5hqx4v5gXjwJvYxziLS2T682N6CqbevSq/yFQPjlIRtlwyO8AjjogBJVWqZ32cZI4VNNY9ByDqsrfMnKruuZmdRUHdmBgoS5til4sBxjIkQPk/JBLKjgN9KR5ex+CQ02ER8sw5E7GV6V30aj40JTgxoGJZ3euMGQYCV4iGISU2MxCh+6l5S/WvwbNvWavVOzA5O04Piq4C62ehhRZkcExMZvLxz2LyTYJ9wpdd4B2qrUWuFpqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGHNMfFy1kDIWbXKm/Mw83ZPFgVnV1dUZNtPWMS6o1w=;
 b=Jb2oN7220UtVZ5JK6DW9lTG/uv6CByhFRHGptWwviNsmaLaMS75QgwWlcIh8MCEZZsjGVoZs3IOzxaJyVJc2+10fzW4LJTDOjxBk98y037pb1zoj24klWlth1CeqwwYvPcElf4bvvb5z87c2jxkNOrXX1Xp4s+IFr/8Ai0qpUe69fx/QrS8/LZq+fXvoRfmapRcNOsYDKRh/CW9UlX8qhMknz9T857tEeLqePiO8sXgttrB0Pd1Xf0thbj3bfOOcb9vUD+s8qGrbAWrn8H+HLFYkmRHc+5UHyeWWuYb/1chFIl4Meebhu4FxIVSoY5vtl8y2rppCqVu8jz4R/WbkKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b77f69ab-5ab0-8743-6ab7-ef8f7ac44288@suse.com>
Date: Wed, 16 Aug 2023 08:48:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 01/10] xen/version: Calculate xen_capabilities_info
 once at boot
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Henry Wang <Henry.Wang@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
 <20230815210650.2735671-2-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2308151602500.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308151602500.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: cd5b5717-3a93-4966-0d58-08db9e24c1d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mX/QaI1HQZJ8398oHOwzUfyqsWOqvUgaKRx2h5wXaGBHwDqM7Z1SVwIaChaTfUNQqEQR+5TU1au/MOeGvEEROowGDgIodqxehLotcjC0y9qar0Kr4o2+KtcuKw0tlp5GFkSatY/Gs3lzL8fAPm+UtnJCAUJIObUkV3h6tN4U+N7NoPxXfnUVuuG8KHThEP+qU4h35wKC/V3AokvtUv5iGepW79+f83xdxi+GM/6k0Uv0DdRIIComWyvov5dtUznICAPns2kjGaow/G2cukXuIcwLn4OyhTAzTkzW+5NYkTRqS6FLLlMICVrQ7xURo/VvfPWJ0knu7IBFCIcsx5mC9uHSARM1mIE5Hue1cas44rDzQo5sWRMpA+g1JyyQwTbJuWAv/XE9sQTlGBP9Ywiw55r7Kvx1kBNGaH+7c08FL+bHJa/raOWc/0wgIWbtCvMJnoNXKw2Tvq+SL0UvLsY4mIwmdyatLT4qbIYBPpeNomsbI1NQipLyJzVxMFgxsIj1/IiVDmXei9+NUfaFPUT0EX8hfqcfSMVdu6IBSXh+O7cZjsHoQLRyKHPkVL87HhQcIx3AbExfB/fmWUxcoJu9WAfnonOvtxRhamzZ2GSsJCA3vqVYTRKCy69IeDLscNqpye53g0onoo5IKDuEABnM9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39850400004)(346002)(136003)(1800799009)(451199024)(186009)(6666004)(54906003)(31686004)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(2906002)(478600001)(26005)(6916009)(7416002)(5660300002)(2616005)(41300700001)(316002)(53546011)(8936002)(4326008)(8676002)(38100700002)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3UxVm1uanBQbEV0WDhSMHc5WU1IT1cxa0YxWDIwZ2ZkWkFoS29TRFFsTEd1?=
 =?utf-8?B?dXNYQXhPRFFJOWFyS3Y1bVNRbnBLNmpMS1NaZ3ZLV0RseFFjNWE1T0ZJY0RX?=
 =?utf-8?B?QXdoa2UvUGdmRkZiSUZFc2ozam45bVhxSkNpZ0QwbEJXcHpNNzdvRStST2hy?=
 =?utf-8?B?WjMyVlZvUUpETlk2S0tSVU52STNpb3QvdU9rQy9JbXpPTnZqTTNMM1NaMU1w?=
 =?utf-8?B?akVEd0YyWTRhaFlLZ1BvSlhDcDN6UWpZcE51WFR4VmZSQlZmbEhhM1QzVytY?=
 =?utf-8?B?VzBkanoxL3lwelkvcFRSS2ZEdFFubU0xNzY4b2lWdXAveEY5TDVMYTJlS3Jx?=
 =?utf-8?B?c2E5NG9UYjFmY2ZnaXFQY2R1QUdyY2hUVmpYZGZGNlExNWZMZjlSMkY4aDN3?=
 =?utf-8?B?M29oblVnZzd6TG5Yb2Rua3Q1Q0laaVdVVFJPSll6UTFVTHMwcHVXbjQwSWM4?=
 =?utf-8?B?aS9KcS80ZTA1Ui9PZ2psMnFOeURKQjdYczlsVzNieEtNakQ4c21wYkJ2aFBX?=
 =?utf-8?B?WnJEMXFxWjBuVy9TMWlJKzY5VXhSaVBoVU44YzVrdXVWTVJWVnQrOWNTYXdB?=
 =?utf-8?B?ME11eUp3TitPUENBcnpEbUlCazlGazRoM0hqRThlcEpRdUErRjZkRTIxVnFr?=
 =?utf-8?B?aENtaThpU0hQMW9oN2xoRkMreUQ5a2VYVTI4TmpsWVNFaE1xcXZKb0JhRjh5?=
 =?utf-8?B?Y05WK05IWlhOdlhXMm9tUUFSOFM1VWJLRS8wa3hTdkhhWDYvcHIxdWJkc2RO?=
 =?utf-8?B?dUx1blF4NEVuTGtWT3lMaHBWc1ZFemlmdXhmM1VPZjVJSktoNUs4cytiek81?=
 =?utf-8?B?U2VFRHdiK1pBUXFYTHY1S2UwL0xaS3NONHc1Vm9zY2VhWFh5WEZjdzM5bGtY?=
 =?utf-8?B?c281RzFiQ2R3S003NG9nRmMwRWR4VUZTbGhmT0ZXeGtKbytWeGRBbXdKcnBB?=
 =?utf-8?B?d2JTZEtZK200akJWTzVNU2JwbXlUNDRaMHVNSDYwRFc2N3BZVFNzY2QyRmg3?=
 =?utf-8?B?NkVnaURSMFFMU1FFVzRDbWh0ejY5RUdoRG1DcUwyOFVDamRlNzdnS243Q3Nn?=
 =?utf-8?B?a3dLaGsrSnJVd3dZZG1KZ0hCTWRuTVJ5SEFTMkhtRnFWeW5ybG4xSHpGKytO?=
 =?utf-8?B?bjZtZXNwQVBCNHR1MGJoRldSSXZ0Vk9QSXRzeC9QWnBCb3BteXJEcEpjbXBy?=
 =?utf-8?B?aXJYQU1WTmFvWis3b0dMU09mbERCWWtuVU9tWUVMREdQZm5SWHphc1lXN1dH?=
 =?utf-8?B?Z2dKMGlVS0VHOUxmYnF1VFo3SXN6dTc2bWlDYXRFdDl1eHY3ZXlWYTBvRlpZ?=
 =?utf-8?B?MmV0QVU2TEpFRTBjbWZoR25HSnowSEVtOVNvRWxIU2dUU2lOcUwrQmk5b3hy?=
 =?utf-8?B?VjNRZzV1VjZORFNlQ2h4alNoanVQRWcrVnZURFVudldkeUtGR0tqUXRtMlhB?=
 =?utf-8?B?Qm94RlluaWNONnRZdVd1cURIVzRLelNjUHJmbk4rd2RWUFFRN0tFbnQvb1Nt?=
 =?utf-8?B?anNqT3I1VDRJd3lVd2hwVXdNOVRCUEg1Q0RSOXloSFNyUTJLNFAwQitWdk54?=
 =?utf-8?B?S2VNMWlzdlA1aUFidHZFamZ3VEx4emc4ME54TnhMeTNpenFnYVcyMEdUbnRF?=
 =?utf-8?B?blNDY0ZsV2pYZVFXMXhnYW41T3RvKzZXTmRxS00vcHZ5OVVCVEVicGpxTTZ5?=
 =?utf-8?B?ejFINlJkU2NOMitibjFCcnNMaWtOdnJxWjc4dEppVTJ0N3N5b3ZONGp5Ykdl?=
 =?utf-8?B?U0pJWUpHc2p5bDIxYVY1YWR0cTl6NklMQ1B1TmZ2bzhwZXhFMm1IMXpKZ1Nx?=
 =?utf-8?B?ZXhRR0dUdUJOeFhvb2NYQXFpNGZnREdhZnp3dkk3TUJ4UWE2OExKNHo0UTVu?=
 =?utf-8?B?ZCtJYnl1YURUdDg4VTZxNkVPUncxWVQ2b0hlOUZTdWZhU0lYQU9CMit2aERK?=
 =?utf-8?B?SEduaW5hejRVc21vdDNSMDR5dzZFbnp3NTMvU2dOcHZPUFhjL3dxYmJBVkl0?=
 =?utf-8?B?NTlkUHU4QnZ6cWhjTFYrdlZmb2dja1YvTk9hMXdjd0t0UkVGVExYWHRGMjdP?=
 =?utf-8?B?ZmVHNW9oSG00QTZsQ0RvREkxNDJ6Z0RUUGhkVlY0Ri8vUlV4RVhXODBMcHB4?=
 =?utf-8?Q?zJjspRX0H7MrrhRGo6T9u4O9x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5b5717-3a93-4966-0d58-08db9e24c1d9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 06:48:11.2759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8mnjh1riYWtePMMfGQLoRsTIXk/wfCYZTajGotcRkcMxwABkqciXH+CHVX0bn6MOJu4jVOHFNYaqBkQd0t1GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7472

On 16.08.2023 01:03, Stefano Stabellini wrote:
> On Tue, 15 Aug 2023, Andrew Cooper wrote:
>> The arch_get_xen_caps() infrastructure is horribly inefficient for something
>> that is constant after features have been resolved on boot.
>>
>> Every instance used snprintf() to format constants into a string (which gets
>> shorter when %d gets resolved!), and which get double buffered on the stack.
>>
>> Switch to using string literals with the "3.0" inserted - these numbers
>> haven't changed in 18 years (The Xen 3.0 release was Dec 5th 2005).
>>
>> Use initcalls to format the data into xen_cap_info, which is deliberately not
>> of type xen_capabilities_info_t because a 1k array is a silly overhead for
>> storing a maximum of 77 chars (the x86 version) and isn't liable to need any
>> more space in the forseeable future.
>>
>> This speeds up the the XENVER_capabilities hypercall, but the purpose of the
>> change is to allow us to introduce a better XENVER_* API that doesn't force
>> the use of a 1k buffer on the stack.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit I still think your original concern regarding ...

>> @@ -537,7 +538,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>  
>>          memset(info, 0, sizeof(info));
>>          if ( !deny )
>> -            arch_get_xen_caps(&info);
>> +            safe_strcpy(info, xen_cap_info);
>>  
>>          if ( copy_to_guest(arg, info, ARRAY_SIZE(info)) )
>>              return -EFAULT;

... the unhelpful use of a stack variable here could do with addressing.
But of course that can equally be done in a subsequent patch.

Jan

