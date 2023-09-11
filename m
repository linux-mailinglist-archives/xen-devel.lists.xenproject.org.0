Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3651779A85F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 15:53:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599420.934838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhLx-0002NR-42; Mon, 11 Sep 2023 13:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599420.934838; Mon, 11 Sep 2023 13:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhLx-0002KK-0q; Mon, 11 Sep 2023 13:53:25 +0000
Received: by outflank-mailman (input) for mailman id 599420;
 Mon, 11 Sep 2023 13:53:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfhLv-0002KE-UV
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 13:53:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9247fa56-50aa-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 15:53:22 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB7893.eurprd04.prod.outlook.com (2603:10a6:20b:2ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 13:53:19 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 13:53:19 +0000
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
X-Inumbo-ID: 9247fa56-50aa-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKmKFPeIaTJl60wurEILfY4lmnO7ddGGzVIVjhWdL3VEjsumCjYztggWVuoeN7wwJJPg80j/1l6R5cOvF5aPIvAJmT+p8rX2Lhxdr+IimbuYqUdFcSszoE7T8cTJKf9gHgMApyEqHiwT8NT6X4U+asD956GuPXwheQo9WXeZnBggH2jtECdmpP5ZQHDq0pbjLrY2HcTJDGjwRXuhCUbkTlyjyV0hM8jrpWHxPritHRsHYuO5EHIPbypbXEeRZgcSzDCQzqm8b+3YoOKsVHkxMUr4R7HL/ldDEkaz6TnVkUWkgvRET6Bap2MRDbVtcoTEW5PEWHqyY1xffFri19d4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8Rh17gKCOLUHiviCF3CCMlVIWvKkzwrCbIqhxS6hl0=;
 b=Y4E/jhcXuX51um/dVPexdL/DrK7JZ17ygwF71CYG/1kdRSGnIppwFp9tomeVc4wiOECa3ImaY11irIjqGEtUJRaZVCR85gxvR0aZCI13p0/Y4u5p3Izr1A83aqfraIhm9KXrJtSeZjUUilyT/buxb6brlGO93Ga27UfI145YNwVaiNqotaxPF2eVk+TggKkHctMN5Xbw7f1fxeahJYSpDbInsb0FqY55ufdksJF5WkNfx8eYp3DFhVoCmJUpUmp85KGRLntZ3q04A2+588m/yE3Hxk5DrTEjDbxZMs6l7mH4fReqZ9jLfgz7y3ihlunukeqkKnaN0kIVqOEy8sx3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8Rh17gKCOLUHiviCF3CCMlVIWvKkzwrCbIqhxS6hl0=;
 b=gG4kiaQxV2IMSeJo/xmcRDXgElRKVQWoNLXNxWetEgQ0MI4gkdkWGhQI8YpbmpiubIt5D2C/Xpwexys0a89SCSDmeV+vJna2U+KtJYVr3qYahxtodLAYclvMVDI48OwUpVV9Tm7JC1BIY44aP4uWAgZ8a9EIqqNSUyqBGM1NgeiDylLTSR3Ityq/WhFy0wiLsJZtYoggQdZ4H114lIiMajJq7UhzieBlM7d46vIeB/VY1Nqol/29pjM0waw7exPvwsWuyvv2ZY2srHIJ/M1HzBgcukFhdlzJtzfTcNqllCI8gQIkPzF1etS4HdTRiC+rvjF0+Pme6xHBhFGGA+zebg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65b367b2-34b7-0887-6f29-8cb8e77ede7f@suse.com>
Date: Mon, 11 Sep 2023 15:53:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 2/5] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694211900.git.sanastasio@raptorengineering.com>
 <31292b9b259a401045646d50a7237364640bc85b.1694211900.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <31292b9b259a401045646d50a7237364640bc85b.1694211900.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 795c006b-65dc-4cf4-cb17-08dbb2ce74c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0zxGBKnwpnd+NzEUDlVpkapswJ3qZAYY8E1ZZM4xIr+ibp555hOl7bzsRe9R3NbhuXqosay4i8NOeJvnJKUebXrnM4qdoxo9tXawDmVoeCDkJ0iOcuIEsSz4afh+x/yiZPzb075r2d2cnbFeDVY/KzSUVu4Vu7IWADjMYsWQGmeVZak+do2giyW5HLecDwVRw3sPioLwfOIWEnzjh7oW1e4mQPF6jfKZmhNESsA5Qc82UyMdsYIZ6hHf4uYI0K638F8lrqQhwt7KnU8YFCxiSTtO+0uBoq7L9y3ndQsqgRvfz2RsOhED1m6IpUtwweSrBqe6PZ5HKFY3Y5BAIzRlt800RTzS/ggWnceb/3tXaZ0uqCVo8VN9Q7pSD7QY61oRLUJAZ16YlxW4eNSl8V2lm1BNEXTDeWlx1KHmw5hbXRwk1YnP2OpgnwSSkR491GvjQ0Yn5np57gZ55pGNgQU+tWLWEowpMve3wMQGcER2Vd1nxg9Klwpcr/Ug5Stn+TNjxIeRQl0q4h5GED/oFSjUmb1PSGZzIuSbL/9JJUvROhCNZfU8o9OUCdSDK7y7nljSbC1wz+LkxBi4AhcnOT2uhc6AHGVfIPLIB06dNCA/iRIK29Bv1+OY/B32RsJa3yCOnedE4AFzLoyOh/Xk+AzQFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(1800799009)(451199024)(186009)(5660300002)(31686004)(6512007)(6506007)(53546011)(6486002)(31696002)(86362001)(36756003)(38100700002)(2616005)(26005)(83380400001)(478600001)(66476007)(8936002)(4326008)(66946007)(8676002)(41300700001)(2906002)(316002)(6916009)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFc3Q0ZkVkNoVkVGRlloaVNWMUFsb0xWcC9sblBEanFaL1JvOTh1alI2Yjkw?=
 =?utf-8?B?MkZLSFRJSldFVHJQUmV3Mm9mT1VUR2lSNllPNkh5WUlpcStjRmI0WEQ4bHZF?=
 =?utf-8?B?aVQ0M09QZ0prYnNLTzFvbkd5YmNtZ2s0RmpKSDcybkpyYlBxY1owei96TmdE?=
 =?utf-8?B?ZXMrSXVRTjlZdy93bVk3eWRKL1dhbHZYZ28wNTN0K0ZQaVBDRW9OUURuZ0pW?=
 =?utf-8?B?QW9LZkdUUHdZNlBNUUljdy9rWVAwVVFXSHZESlUrZmZMbi9CVlV3WFVpMnlo?=
 =?utf-8?B?TWN1a3R0dkZKZWV0dTN0RFN2c1pKUm9IK1QzdWVzNHZ2ZWczU29sTXB2eEdR?=
 =?utf-8?B?bnB0bmQ0OUdGa1k3WDl0bkdqZVNmaFk1VXIwRTdKOUIvd1lRZ25tUzFXQzdK?=
 =?utf-8?B?T01vK0ZrRDBURFRqVUtsSHEwYzRxcW92cjhCWFh1S2ZINERmc1VZczE1bU9r?=
 =?utf-8?B?TVNjNXdLcHovcmIvZWFienNubEo5bWplV1pkSU05K2NIM3FERjRhVjlCZnNL?=
 =?utf-8?B?M1pTZndqanJJMUdlZkt2STdmdURKcHBuTGp0RkJvVmd4eis3V1NBT21HVWRp?=
 =?utf-8?B?Uk9LckNKaGhNeWV2dXFPVlBpbUJuU1FKbDFLZm02aUpsMlFja1JVM1J0N1ZS?=
 =?utf-8?B?bFVSWGw3L2JBejU5SFFuNlRRbi9kelowbUtVZTBkUUNXMU5QMGkxTkUvN2Yr?=
 =?utf-8?B?Tm5JQnV0NGlLNFNLSFBGMjQ1R2NMT1dHVHU5cVU2UVFyTFhYSnBsd1ViUnVO?=
 =?utf-8?B?b2pvcFQ0TE1OSW1Sclk4eDlQMFRjZ0FPbnlGRzQvS3drTjF3b2t5SFFHTmUr?=
 =?utf-8?B?a3BTUWdFSGVJL3RFU09xZnl3UTdtbnpoVWhKVFF4VmE5Z280ZlZoTkpVRUtM?=
 =?utf-8?B?aHZpZWFoS0JVOENvOTloN3N2VTgrRmszTzhYY1BVWmNxa2padWVRQUduUVE3?=
 =?utf-8?B?bzZHSWJ5eERKVmNnWTJvZFlWOXF5UzMzTjR2MUk2aEk5dGxnZFhIcnJ1SWxi?=
 =?utf-8?B?bVFLblF6TE80NXIwU3k4aFBYbWs2bnpqTHBkZUUrbGNpVnZvSHliYzl5NFVE?=
 =?utf-8?B?aVpxek9PVTlTMjFzbTNHVXZyZWdMNXVSanNCMlM1V1ZOSzczNTl6MGpWU1R2?=
 =?utf-8?B?bTRYeHRURTZhQXY4VVdGNnFnVFRxR3V5Um5CU0I5U2YyVFJwSW5EcGhHaEwy?=
 =?utf-8?B?Y3J5V0doaVZCckVIOCtFY2MxTlM3U0JBaTJnWEFacTlTZllyQ2Zhd2NsZ1Fx?=
 =?utf-8?B?Y3djck8rZHVVRTdTTFNmM0lYZWY0bUVlTzFwRlJnQ0RFekV1cTRBNjkrVU9D?=
 =?utf-8?B?RldEOVc1V3ZPRWRFMWFTbWhjWDRiWFZmbVVZWnZ4aHkycTVjZGM5TEJTOWwy?=
 =?utf-8?B?dWRNSjlCeENOd1VjK1Q4NjJFbUdOMjR2VWdXWFVOcUwzN21icjYxNWhPMnhy?=
 =?utf-8?B?dTZEcXZOMTJhVDBrcENPWDJZWFhZelhybDQxREFGNXV6U1lZeFEvZFQvZGtB?=
 =?utf-8?B?Z09RNTNOeGtJb0poV24xbEptTE1UZjNFaGpzb21VNG04UDQyZTMwaFVuMlV6?=
 =?utf-8?B?ZlR6VHJUWDlTN1dUZDFZd0xPV1pyalovNWgyQjFWUFQ3ZjcxK2tTOThWcXdS?=
 =?utf-8?B?RVVXb21RbVpMa3ltQ0ZKSFRlTXYxNTVweWZrOUhzWjJydHpOSE1JU0kzY2JU?=
 =?utf-8?B?TzVJQXlWdnhOdVhCYnpESzcvOWNQK1dJNm9panlHVENQUW1kT0pHS2FCUmc5?=
 =?utf-8?B?dW82UVZqeGFLeWVMRlgzb3gvL3ZrNkZkRTBYQ203NGF4QVpEbHNxYU82Sm05?=
 =?utf-8?B?NjlMY3VNcXdvSFNjalpGbmFjcVpxZ2VCOVN2cXBpall6eDJ6WmdZd1Y3TmdJ?=
 =?utf-8?B?SERvRVRpTjJ1MmdWM2dCM2tPR0NFdnc2RWVJL09uL0xlYUx2ZHE3T2tKaDl4?=
 =?utf-8?B?VUJkazIzdHEvajVsZ08zNk1hR3Y3dWhXZlU0SW14Yy9jSDhFNHhOS0I1VHFF?=
 =?utf-8?B?RDJZSVBOY24rQU1VTFRsbjBnODZGS1FERXJiTStOaXVIQWs4K3JJaUhseUJL?=
 =?utf-8?B?bUovM3FMMlF2WjE2bnZpeGxnUStGN1E3RmpzY3FGY05HSVlrZ3JIc1g5QStm?=
 =?utf-8?Q?2i36n1yTB6o+N5bQWvXBFLhis?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 795c006b-65dc-4cf4-cb17-08dbb2ce74c8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 13:53:19.6532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jk+XBzlRMcEPoM1sSolK4HUIJFIk7jTnapAxh1DQigci6YCTfBrhHTrobExtV/oZUYHPMbTZI7CcTDdaEBoL6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7893

On 09.09.2023 00:50, Shawn Anastasio wrote:
> +/**
> + * test_bit - Determine whether a bit is set
> + * @nr: bit number to test
> + * @addr: Address to start counting from
> + */
> +static inline int test_bit(int nr, const volatile void *addr)
> +{
> +    const volatile unsigned long *p = (const volatile unsigned long *)addr;
> +    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
> +}

Do you really mean unsigned long in here? (As an aside I'd also recommend
to drop the cast; I don't think it's needed for anything.)

> +static inline unsigned long test_and_clear_bits(
> +    unsigned long mask,

While apparently benign here, perhaps also better to use unsigned int.
(Looks like I even missed instances yet further up.)

> +    volatile unsigned int *p)
> +{
> +    unsigned long old, t;

I'm less certain here, because I don't know what exactly "r" permits on
ppc. (Having said that I notice that mask also is used with an "r"
constraint, so restrictions would then apply there as well. But if long
is really needed in various placed, then I would say that a comment is
warranted, perhaps next to the BITOP_* defines.)

> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
> +                   "1: lwarx %0,0,%3,0\n"
> +                   "andc %1,%0,%2\n"
> +                   "stwcx. %1,0,%3\n"
> +                   "bne- 1b\n"
> +                   PPC_ATOMIC_EXIT_BARRIER
> +                   : "=&r" (old), "=&r" (t)
> +                   : "r" (mask), "r" (p)
> +                   : "cc", "memory" );
> +
> +    return (old & mask);
> +}
> +
> +static inline int test_and_clear_bit(unsigned int nr,
> +                                     volatile void *addr)
> +{
> +    return test_and_clear_bits(BITOP_MASK(nr), (volatile unsigned int *)addr +
> +                               BITOP_WORD(nr)) != 0;

I think this is misleading wrapping of arguments. Even if not strictly
mandated, imo if an argument doesn't fit on the rest of a line it should
start on a fresh one.

Jan

