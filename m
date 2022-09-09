Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D195B3A98
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 16:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404411.646874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWetF-00005t-Qw; Fri, 09 Sep 2022 14:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404411.646874; Fri, 09 Sep 2022 14:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWetF-0008Un-Nh; Fri, 09 Sep 2022 14:21:53 +0000
Received: by outflank-mailman (input) for mailman id 404411;
 Fri, 09 Sep 2022 14:21:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWetE-0008Uh-Ld
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 14:21:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2042.outbound.protection.outlook.com [40.107.104.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id becf62cb-304a-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 16:21:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8312.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 14:21:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 14:21:48 +0000
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
X-Inumbo-ID: becf62cb-304a-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0kbDQ4bb2W7oEF3aXRmd/GGSAEnNyYnlvS11vGvZ8CPFU9oj9Bu8mUM2OV08TgVv8GEQnLgO9YtNiHrwwdwxEkP6vGsJOMy4MICuRbuWgbfsm6v3tBrL2Q/IFZlYwktf7IsEpgpBpPFrP6xhzYbw7vsdx+HsQALFuL4Y7jr02EU/P825hn6sKLMSWEE8aiGZpC/ntNoE6lqxIi5Wi5+3iTzI6mxN+7nlOjHU4/eohQEpCcKEYig7tRzXQ6b0YGAITgPWUbPVjYbNkYhn+vkMfzbcs6EIwm/tyrqTINaPxO5QH8jizH1WjjRaWz5lFCf1cWhd1bs+piE+WHa7VC6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRke+5frwSExLZEbhuphMT4E8VuOaqwzkQoVriMaJQU=;
 b=mF630snR9VqlVg+/KOsCMj+LE6I1QoFKB/VaNyQhm5WqPnB2Y3rsJIesfF+PD8IT4p+NOQHAtPRMSzhK3qLNkLGErv/3U8FZs7j3v9gvPmMY9fai/ubPhGgu0Ix8w+eakT8umJqAC+ig3RoCjZayWjXkmeZ4+wfDChf++0MGtwcKpDhm5/ySCYlVZwsxAcJ4voKSk9MddVbMXV/WbF4R/VdQ5eVQAbKiCBMZeOFo/yblcuB4rXnxqQrHLOHnlx8L52It/wOQTPSAftW0WJ3CvPu6z3gXokJKbXt1ywAk2WVRRvDmcMUyoV01PMt1fWAbihymEeiddB5KmHKyxUkadg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRke+5frwSExLZEbhuphMT4E8VuOaqwzkQoVriMaJQU=;
 b=PB1tlHi3zI3MePwtGkaVnDA3NgTezSiOyLfIw9AB7dWK7f7KELEmIw+lgNCmLcGpIa4QM9UzO+8C18YFVjo7AtBYFIlBU+AQ0P2wHpVG77PU5/rNXvMNnDcT2M8bd8dIidurWriOom2iNEKN2ryKOLw2eUreFsib9+a7voqbB0X3824LgDVwjOrSx7e3yYKjbNdYlqUmhbVqPMPSZ7mO+3kLOmzfMEqEVluwDr04N+AVZP2DGvXA2rM5nU6LpYd+0qJIEcLW/w4raM/G5rkMHPtorzJGgJaQfSyZQr0b+QRgtTYFzTlKviWNI/Eg7lt7lKvUmX2k5xACW5cb5Mvhpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5fb1d3c0-e06d-ad57-0ce5-cb9f906ace99@suse.com>
Date: Fri, 9 Sep 2022 16:21:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] core-parking: fix build with gcc12 and NR_CPUS=1
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1c23930f-e809-d623-18ec-599a0e983b7a@suse.com>
 <bf0d5470-efce-c7f7-d429-78d7fb9517d1@xen.org>
 <6da822fb-e900-156b-334d-8bc573b74aee@suse.com>
 <7eebd88b-f7a5-5dd3-7482-5086cd745940@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7eebd88b-f7a5-5dd3-7482-5086cd745940@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 374efc52-bd34-46fb-4257-08da926ea1e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CecVGnkMZreS2XuM9ZvBywC3+6EZ8TBQcwjm3JPGahsQzF5bVePybzyt/n1HV8TDfFXy9uG4+aC6WZgHCdejHC0h9pAU4SQGNJ3f0kT+gaPjV9xlQwac/9jTvPGrc4bLbJcxXFE5vAaJrI2558AcGDPq7TWAdmXIVaYfBlc7fijNsvm4D9iNk0LkT1DWNprdC2ylKeKXE6smbEcFyunqkaLidQ+LPcqmGYnmuBxhSUJAC1MqvFxsHE59nJDy2o3EM8x9e7Nv9Z07S95/ixx/VclMJbKOyvBo5rjPmdDAvrQ8n5JlojO25gbHTpGS6+Z737VyXrwKh1i4hAuSK402i4NiVPkj287+CoGidEYEmUNJAY952VZV01Q0dFkCji8G12+ZeLAJ0pGIVM1olpbW1zOlj7cIpx+8AaGnPhjh/SASdvENMZNE0y3l8OSUb4DQvQ15FvLHKmPMK/Z6pqAuDn8+6HN6DrXzNgGg2TwzzeDfuZcnlhnaWAF6UvByP1Q1kLXrGT/z4iEGo13mEiS1DK/QduOhNcoFVpHBu6Zpg3eoUJAW4xBiBZqcjs//VLORdH4oIIpoq6fHU5dj58HQpXqO66/x6PL1iAXn1km64y6j6U3TVfqyN8scNiWtiG7wDrc64NAGGiZr/yhoKge5kixxYNwoqgeTDru/XwlCLOtn/KP8SLeHURq1R/n5nYtPEwpdw2hkOAb5IEMUGoymp3wrO6AqUCGuemNUyJJ4PsOcaiHUiCs5L9UJh32ErXXARqgC4WHpn2Ed3P6qjEBFbVQeeX+1B0G4aFm/dZfim4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(396003)(366004)(136003)(376002)(26005)(186003)(5660300002)(2616005)(6512007)(41300700001)(2906002)(6506007)(8936002)(86362001)(31696002)(31686004)(53546011)(83380400001)(6486002)(478600001)(36756003)(316002)(66556008)(66476007)(8676002)(66946007)(6916009)(54906003)(38100700002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXQ3dDM5RU1veitwRk5QVU85QWdZUHZaZlV6eTNuMkgvaGwyVFUyTTAyeFBS?=
 =?utf-8?B?VmlXc0EwemEwY0hVK3FsRXlRM09QTW5IUlNVWGFDT0pMT1BCZVYwY3JTZHpk?=
 =?utf-8?B?VEE5bXNJRDluMDE5M3J5dlliRDI3ZEJhcEJqbEk5TDB1Y0hkRkVaMUhXTmRM?=
 =?utf-8?B?U25qUkxxOFdZczBWeCttb2pZWkNDVHZhb0d1Z3dvdU9ZR0lOZ1NCcXg0S3V0?=
 =?utf-8?B?eUl5S2lNL08xcjRVOFE1WVY3Ulp1amRIVkJzTDU3dldpbUNXMTBCQlQ3SDc0?=
 =?utf-8?B?SndWbWhqSWdQYW13VU81eWQ5Nnd2K3h0NkUwVURZNW9oN05TWFZSMkNQTTlQ?=
 =?utf-8?B?bWl0NE9DcERSTFNpRG02M3VaNmRDODljQ0kwbldNYjNlNFZXRi9hSmpBY1Bn?=
 =?utf-8?B?b2l6TDBSU3htcFBQdWxyL2cvWUIwWHpud0JFQWRpSWxZYmpuN01oZGRrZnV2?=
 =?utf-8?B?bWFZcnJjZGZqZVJObGhnVjZ4NFEvd002bzdIMGtScUI0SkRrWDlyQ0Mza2lQ?=
 =?utf-8?B?dFNpMWFleVgwMU9hdGtQb3NsWTFtNzBlYUllSUNsUDFteUFaQnNGRTFja3A3?=
 =?utf-8?B?U0lKbUg5anpSNDZhbVhBZEdNMGFXV2NONmwxeVp2bXB1NHlnYjVZUHdjS2RQ?=
 =?utf-8?B?SktpdjBGSDlmM1M2aWlRbU0vOU1sUGVOYUZQdGNSV3dZK2I2SjNRckR2dlA5?=
 =?utf-8?B?VTZ1aWpxMXFadUQ3TVZRbGxLVkZOVFAwWHlUSXR5RjBIY0lXakh4cWgrcGl4?=
 =?utf-8?B?K2E1bml3SXhCVlRlMnF0cEIyTkJIWlkrSjhZQmd2Zi9oakhWMW9WRWVRYU5m?=
 =?utf-8?B?eUhsUHJwZ3dJRXNFZ1kwR3VHMkVoQS9vZjlTaXg5UkJyRzNGcHQwOW5JVVJV?=
 =?utf-8?B?UTFMamVDdE9mNXllMWZ0SUJONUowdWNjeGxZQlJYTDBWYk5XdS9MamlQR3FF?=
 =?utf-8?B?YXl4Z1dIc1VUSjhFaDdzN3dyS3owcjFaa3l2QktwZFlMUjA0TFVpNHR1b3E0?=
 =?utf-8?B?UmI2b2dNM2NYQm5EVUtEVzhnRjYzTkJjRXcyQXlSQkxPeXhldERPUUJqR0tq?=
 =?utf-8?B?U2JvRzU5Ni9ySzZoL0J6UTJSSUJIOWp0ZkdTcVJ3T216cC9sWDRRbGhNYjlh?=
 =?utf-8?B?aWRkUHFvaFZ2emVuZ2tYL2M0TnRQcGlGV3IyalVtbmtsZndZOVpsN0dFbFdv?=
 =?utf-8?B?N0k5cExERjgrdXlNYWtPcTE2cGgwMjJIMXp1a1VhSU1IQWhNblFWY0tiajNT?=
 =?utf-8?B?MWxic3R0YjNMS2Jjc1oxczJPRWg4dDZtVjdlT3FMSzBNV2VDLzE4OENNdXpB?=
 =?utf-8?B?ZFpicG8rNzR4VVozTXB2OUhWMzJiSmMzRDVTWCtJQ1o3TnZKNDc4OXc5eVpP?=
 =?utf-8?B?SWZaRGovRUtPNUxtcmx2UTlIbzBacW05MVkzRTg0Vkp0WUtHK0dLdUs5aUVW?=
 =?utf-8?B?Zk5CVGt1RFAyamR6U2ZFeU9mUHh4TFZKRnRNQmVraFU5NzJIbW94Zm9zYzJl?=
 =?utf-8?B?dE1FVExvNnAveHFkd2NVb01DNEptbVRvSUdScTVPRkVheVQ1bldlZnJpRWpP?=
 =?utf-8?B?SkhTUFA1ME9GSmF2cUVNS2VRTDZ2ckhjd25uR1h3WVh1cnREdzVTVkljeW5E?=
 =?utf-8?B?MUdKVnFidEoxbXRKNzd1a1Iyc0ZBT01xWnFicEhmRytSTXpOaG5OUUVkQi9F?=
 =?utf-8?B?dlJKSlZsQ0IweE9la1VmMTBIM0QySk9DOTdUU3EvczN3bjArZ2o2QWpDQmFF?=
 =?utf-8?B?NXk3NDdqcXl6czUwbXNKdVRUakc3VkdMWFd2SUN5Z3JTakVTQ3JGNVUyNm1N?=
 =?utf-8?B?Vkg1Q2d5aXhSSUZRT0xKNzJWVzRIWUZ6ZnhBOXNkNjRjTWluRTZWdkx1bktG?=
 =?utf-8?B?WUVSWnlrd1hsWFJKekhJVEZSaUU4NzFWbEtDL2JNak1HZGlkOFZMR2FNYzNz?=
 =?utf-8?B?WG5PZW41N2dkc3lpeTg3MjRBRk9XUlB3VXhiNHFoVWxlU3RGTk1XMHA5bTMy?=
 =?utf-8?B?VXlScWxKSFZhaUpXelRveHJhdmsreE9pdi9YUVRtdzBKSHlQYitFclN2anVU?=
 =?utf-8?B?b3hPTG5RMzNZc2xLMi9qQnNzSkhabm1kbEJLZWxoNkprS254dXdlVU9Ycmt6?=
 =?utf-8?Q?PQ2bN1o0wWx3v6E4O8BF1v0v9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374efc52-bd34-46fb-4257-08da926ea1e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 14:21:48.8541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUR+rv8XMa2VJG6137APHOPAMTvwQupJsHZWcL2kzugVXFnSYi+21egOaQI8sFdhZCn8JpBRztP5Xn5zwgZ72w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8312

On 09.09.2022 14:27, Julien Grall wrote:
> Hi,
> 
> On 09/09/2022 13:14, Jan Beulich wrote:
>> On 09.09.2022 13:00, Julien Grall wrote:
>>> On 09/09/2022 11:18, Jan Beulich wrote:
>>>> Gcc12 takes issue with core_parking_remove()'s
>>>>
>>>>       for ( ; i < cur_idle_nums; ++i )
>>>>           core_parking_cpunum[i] = core_parking_cpunum[i + 1];
>>>>
>>>> complaining that the right hand side array access is past the bounds of
>>>> 1. Clearly the compiler can't know that cur_idle_nums can only ever be
>>>> zero in this case (as the sole CPU cannot be parked).
>>>>
>>>> Beyond addressing the immediate issue also adjust core_parking_init():
>>>> There's no point registering any policy when there's no CPU to park.
>>>> Since this still doesn't result in the compiler spotting that
>>>> core_parking_policy is never written (and hence is continuously NULL),
>>>> also amend core_parking_helper() to avoid eventual similar issues there
>>>> (minimizing generated code at the same time).
>>>
>>> Given that CONFIG_NR_CPUS is a build time option. Wouldn't it be better
>>> to set CONFIG_CORE_PARKING=n and provide dummy helper for any function
>>> that may be called unconditionally?
>>
>> That might be an option, yes; not sure whether that's really better. It's
>> likely a more intrusive change ...
> 
> I quickly try to implement it (see below) and the result is IHMO a lot 
> nicer and make clear the code is not necessary on uni-processor.

Hmm, we can do something like this, but ...

> This is only compile tested.
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 6a7825f4ba3c..f9a3daccdc92 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -10,7 +10,7 @@ config X86
>          select ALTERNATIVE_CALL
>          select ARCH_MAP_DOMAIN_PAGE
>          select ARCH_SUPPORTS_INT128
> -       select CORE_PARKING
> +       select CORE_PARKING if NR_CPUS > 1
>          select HAS_ALTERNATIVE
>          select HAS_COMPAT
>          select HAS_CPUFREQ
> diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
> index 41a3b6a0dadf..7baca00be182 100644
> --- a/xen/arch/x86/include/asm/smp.h
> +++ b/xen/arch/x86/include/asm/smp.h
> @@ -61,7 +61,15 @@ long cf_check cpu_up_helper(void *data);
>   long cf_check cpu_down_helper(void *data);
> 
>   long cf_check core_parking_helper(void *data);
> +
> +#ifdef CONFIG_CORE_PARKING
>   bool core_parking_remove(unsigned int cpu);
> +#else
> +static inline bool core_parking_remove(unsigned int cpu)
> +{
> +    return false;
> +}
> +#endif
>   uint32_t get_cur_idle_nums(void);
> 
>   /*
> diff --git a/xen/arch/x86/platform_hypercall.c 
> b/xen/arch/x86/platform_hypercall.c
> index a7341dc3d7d3..5d13fac41bd4 100644
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -718,6 +718,7 @@ ret_t do_platform_op(
>                         op->u.mem_add.pxm);
>           break;
> 
> +#ifdef CONFIG_CORE_PARKING
>       case XENPF_core_parking:
>       {
>           uint32_t idle_nums;
> @@ -743,6 +744,7 @@ ret_t do_platform_op(
>           }
>       }
>       break;
> +#endif

... this needs doing differently to prevent the hypercall changing
behavior. Will send a v2 in a minute.

Jan

