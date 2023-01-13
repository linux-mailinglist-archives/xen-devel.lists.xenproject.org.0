Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A416692EF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:29:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476949.739412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGMu-00085O-04; Fri, 13 Jan 2023 09:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476949.739412; Fri, 13 Jan 2023 09:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGMt-00082V-SZ; Fri, 13 Jan 2023 09:28:59 +0000
Received: by outflank-mailman (input) for mailman id 476949;
 Fri, 13 Jan 2023 09:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGGMs-00082P-92
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:28:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2052.outbound.protection.outlook.com [40.107.6.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b41db013-9324-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 10:28:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7155.eurprd04.prod.outlook.com (2603:10a6:208:194::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 09:28:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 09:28:55 +0000
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
X-Inumbo-ID: b41db013-9324-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRPDa3ISoGiwOFJlO2rccatHZIPXoOGTfiWkUfSiaK6x3IQDmF7W/l3xUzN+zCbRAdwmLVEEZl1VcNxvzHEYFJzCDEMBhkfFaWY3R6Je74cuq0vRAite3NmD6VDrJMG4ieIgLp819/9BMCfNfDA8CmJuTDvygejHa1VlHOTYGBU54Y+5hxO4veHdfXeYv6XMlsObqrYXlmV+HBcCcg5sLFkFWrUV40Tt2qTlyz5S8KhPEO7RiTc/M/izWSvjNTU8RIQHUKXOctTQ6lfk+JvsQDS1YCQ46zGl12KBf7yIoLruhVC2lP2QvYaD4r3PNSxW1G0Wo3jjlffENt5EshWxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8/yZwUvgzKW7WO3dXhJMiOlt47lC9rB4MQQYCZDUdA=;
 b=WSCqyVsqdDBDjDW/fYWFR/dcIMs+oDIhwsJuDaaAnOXu7QF87aXhEoHz8GcQtgdt24MlhztUuvjTRsVTmO6R5MKLdTEdkOvKVfDxG+0PNwiT1oAiwjc1DjQ9Vu5VN7JL3isbb1hfp4yeaUig/G02CKABvnr80zjT628Rge7m+h0FhCPZbVKQwazqo3NwNMCQdu1cM3iGqJhq6wXjorThZ81722HQBVQ5q//RBCrOkzdwiLKnbVyE+x+maQIpxZsy3xuAa3WvgaWMZE1VoOw1oB9vLupVNGfoXGYrb1ricFWuNAo4xXR8pkjfevkIzc7TP49CqAQtVKZg7jiwEmobug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8/yZwUvgzKW7WO3dXhJMiOlt47lC9rB4MQQYCZDUdA=;
 b=XghSvrbwy5ceTFljK2C4vlLwXziGG9MZtbHdQdqzyn7mpFMdUiKJK6mWsDhWUMjGUap+mkp2B59Rh9qcRjYM9qRXXLrappMpTJPgkBmchwER/wiqeHeZaPahl9PehpwSEkItUKSHEkGnF73Rz9pgXF9oEq6rUVjkBqCa1cvi9P8+fu628bt9CQ/E4OZVbbqVtRFg0L/wTDevd/S28hQGbkTfleagyYMsqpSMJo65MTi7aaLctaMVd2Ew6DZyZvF4IEhoeeEskcvdHowdXbSsOKvSPpNGMXvAjNcToS8ij2R8ydBCT7von44na5JfdtAfpGsAz1ntRaEJGXiG/+r5Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f6ba7a75-993d-e860-1eb6-112c7d8580c4@suse.com>
Date: Fri, 13 Jan 2023 10:28:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 00/41] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <d88834a2-dde3-5438-e5a2-2bdfb25be4c3@suse.com>
 <3e3b8ada-3fb0-2bbf-e6a2-1aea712132e1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3e3b8ada-3fb0-2bbf-e6a2-1aea712132e1@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 943e3125-c8c7-4fb3-898b-08daf548975d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w3Yd9RZMILvvuQE98swOi1TeSwHTo8jzM3M/7RGqK1SrO0kCThPcrEBkBqRsQc02k7TjfpYFd1h7IdSG05jSucmDdQ+h0h9+auntaUQaCCwvTE1AJUhu2malysSeePEs/8f7qLCRiwk6RcdsmT9zshIZcvYuWCwYeOIo8Wh5FKePs166DvMScUcxyI3EF+en5Fv9+Tzdt+crKUP2RtTmGchdrFWG1MEt7/Pvz3ond2K2xFh0CsymxJfQMPrSi6JAPjNQfwY/TiFVgg1PShwDEwZgn/+s/o52ja7ipghINV4i4vJ+/RJ7sAO533kiSD4mqhe58N+iELw4kH/Q5B0rfqftB1mpLmbKngO+yYAVx3IPwZoxdHbs3daRIpVrkEfWEmeRAfGYRZbPFA89C9dlhL1LfWs153UzrIX7B30B0d0BZgUkYxDj/aXShLk8X1K/P61d2Hbwjf4zKPmGGZdFEPw8iKTk3CZTcPpoZIH34Od9CaygGUSLkteBF9GXCa1REzgs76XQwNO03UVjLD4hecR9cGSKJddgW3gI/ky33BvN94B/ajTArLVj7YQtVWmwbFFnZ0nEAS6f6jXHZ9lNMsJv7I5hD9PzfJXTdkibhfjuvvOiSiqpNEvhDSNlEQhgimhK9yb+dpSFOOQfcEDdn/jdhBrOkSzOjsi2TpX0PSvXPz9YgbGe1AOkxN9+I0yj6w2cXILVJ8mM4w9VKNrZZkX0go5N/J4CXFFYxepLRntANKvSSWiUVRlwYgbk0K8B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199015)(31686004)(26005)(6486002)(478600001)(54906003)(53546011)(6512007)(186003)(316002)(2616005)(8936002)(8676002)(4326008)(6916009)(66946007)(66556008)(66476007)(41300700001)(6506007)(83380400001)(2906002)(5660300002)(7416002)(31696002)(38100700002)(86362001)(36756003)(17413003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmp2ZUlHcWJZRDZTZnQxaGM2ZEtsdDhENzBzNHpGWFdBSFgrYUlPUHJNU09t?=
 =?utf-8?B?dEp5amlGZGY3aG9iZzk1THhydHFrN1F6elR4L2dRQWVTSnVtaHl1cnozUDQ1?=
 =?utf-8?B?dkl6OFpGRDlTdzJKMkpvajcwR2FNRnpQSjRxaVcwc1V5Z1JtR3lLaDAvRFlG?=
 =?utf-8?B?VVhyMHNabWtPQlZrVDFlcG1zVVpEUGlWcU8vUlNGbFRyU3V5M2VDK1pxajVD?=
 =?utf-8?B?R2ZVNTk3b1NCTk5iUWJhN0ZoejJHazhJSnpZdnE5V1RLUE1nbmNQMThXMXdF?=
 =?utf-8?B?MUUwaUhrVGhONDFva0toRlVaM0cxRnNPTDRoZFU2MFVxMHR2SUtmOWJML1VD?=
 =?utf-8?B?ZmphUjlnVTNJby8xU2Q4a1dUaFBlVVZWRVRQTHVCL1BTUjdqM1pXTHgraVQr?=
 =?utf-8?B?SjdYYk10UWEvY004OVd3d1lVZVAyUjhMbElyVGlhT1lHSEREV09vTjNGWStZ?=
 =?utf-8?B?KzgybVJ1RTd6eGk5enpQUmYwTGF1TzRtVVdpeGdmUVNrNGVMV3B4U295Ry9M?=
 =?utf-8?B?dDVXbkEvbkJMRHBpeTJNR3ZJWnBLaGliS3ZmM2Y4QnlYZkt6WmVRYXhkSTgx?=
 =?utf-8?B?L2RNTTZRNFZlcGJydHA4T1pqRDJGd3ljNUl6TFFPMXVSNGlxd0NiZXVtZzNN?=
 =?utf-8?B?eElwZFJ6Y0RMVEZpVXRocUZiME9TM2p4Q1IxMU94V3RwSGVJWDJyRFJIMUZT?=
 =?utf-8?B?ci95ajJFWkI4cWJpeWhPcFg3aHpua1RiL2drQzFwYWxDQXJ1UythdFpkenV4?=
 =?utf-8?B?NUY3WVBkRVh3Vzd5dVRGMHNqTGwzYnJSUHZOOXozZGU0VTIxYzhQeEJ0OVov?=
 =?utf-8?B?SmRhS2NCWkFheTQ2MHRISStxYkJTZGlXQVhzcWtESjJneU1JZDVrVmRTSWZq?=
 =?utf-8?B?ZzAvZUdiLzVjcVVqRkJMdjlJa3IreFh3ZjJmM04zZFh4cXFXczlNbFRYL2ow?=
 =?utf-8?B?RXNjOFptQ0VReHYvaTBLLzhxL1IyNjBtdHE3VWE2b3BmOGlCRW5EUkJzSzk1?=
 =?utf-8?B?czBaeUF0SjJWd0xMZnZkSzhPenRwcDNzbk1LSWxNSG12bEpCbXp2QkQyQkk2?=
 =?utf-8?B?RkpMbTNGNVYwRzBCdThmZ0FIanAxQWZiYjhkREpEbXRJQnFCd0ZoWmhVZ1V5?=
 =?utf-8?B?d3docHRpdWdldDlleWYrUFNiMENyaHFNWHdxYUd1Zkh6Z2ROQ1pSNGtFeVI0?=
 =?utf-8?B?SnhZRWVPN1prM1k0UkNkaUlXbkNrejJFV3Iwa25QMDlNeU5NYjh1OEpHL2th?=
 =?utf-8?B?SkJuZWlmWUpaZ1Y2ZkFYNDl4VWZJY3ZBK2gwSVZ1em5Ga2E3eGx0Q1l4MDc0?=
 =?utf-8?B?Z0s5dm1HbWNvSElienV4VXhaKzU4QzZLeEg4dEhUcnJNU1lkY0VaVk1rR2F3?=
 =?utf-8?B?MVcvS1AzNFkvU0ZaS1VUaFQrM2hxRHpVSjZ5NEEzeGVqeXlvQjJmd29hSThW?=
 =?utf-8?B?QVVtK1RjRzRDUFhnbHpnY1BCSndxSWNGR3JYYUpkeitNYjFCRmpzRTE4c0VO?=
 =?utf-8?B?NWRaRG9IVm5qMUpjSXdCcHFRS3N2aEV6Q0Q1OGpTdEtsalVWK05hMytHTEpN?=
 =?utf-8?B?OUJNWENMNENhaS9XblpxT3dRSDU3L0NzL1NGOGFpNHRtY3ZsUTVEUjdGWlg0?=
 =?utf-8?B?UTVPMWljdGQ1Rk9XdDVLMno1UFY4LzZXQmV5RWcvLzREdWpDMVdnRTZ0WjNR?=
 =?utf-8?B?aFlGamprWDJqWDd0WmovQ2FqYVk3bWZTaG56azVudEFtdkhwK25FQWlETk9n?=
 =?utf-8?B?SXdtY01SQkJXRHg5L1ltRjZwTnVwSUxxMlNFWnUxMzlWMW5PZng3enlSR2RX?=
 =?utf-8?B?Q2l2VDN5WDR4RjNYTktSbDBDMlRwUG1NK2JQd252aFFKanpzcmxmQUp5Mzhu?=
 =?utf-8?B?VnBzRlJKN1RmWXhHWlVuTXNLR25XMDUzN3p4SlFlU0lwQkdlM3M5WGU0T3RW?=
 =?utf-8?B?aEZLK1hFODlHRm1qUUVmQmZ0SzlxL09qSHR2cjRCQ2ZmTzR0amQycEExT3pi?=
 =?utf-8?B?aVFGN25GT1hsNVk4WkRJclIvbko1UE1ielZaTmhtYlVYV0QyeUYrUUNSQVl1?=
 =?utf-8?B?VG1oMzJQVjRRMjYxVWdsVmFteGxnRFlsY0VLbzY3R0hYb1owbTRRSjVkRGhr?=
 =?utf-8?Q?uXyMZear+2BwLfdsLWgUabwKk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943e3125-c8c7-4fb3-898b-08daf548975d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:28:55.3849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pN3GRhbfAMkYSp84rKi/iFne+zbFApvDDAIU7U5oY/XvTnxVPG0vc7ns88U8ror8W/CM2aO9ZLk9viAM4Pknaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7155

On 13.01.2023 10:16, Julien Grall wrote:
> On 13/01/2023 08:54, Jan Beulich wrote:
>> On 13.01.2023 06:28, Penny Zheng wrote:
>>>   xen/arch/x86/Kconfig                      |    1 +
>>>   xen/common/Kconfig                        |    6 +
>>>   xen/common/Makefile                       |    2 +-
>>>   xen/include/xen/vmap.h                    |   93 +-
>>
>> I would like to take a look at these non-Arm changes, but I view it as not
>> very reasonable to wade through 40 patches just to find those changes.
> 
> Right, but that's the purpose of the different CC list on each patch. 
> AFAICT, Penny respected that and you should have been CC to the three 
> patches (#30, #31, #32) touching common/x86 code.

Right, but I have no way to immediately see which patches I have been
Cc-ed on. Unlike you (iiuc) I'm subscribed to the list, and hence mails
all look the same whether or not I'm CC-ed. Then again I only now
realize that there are ways to filter what I've got - I'm sorry for
not having thought of this earlier.

>> The
>> titles don't look to help in that either. For such pretty large series,
>> could you please help non-Arm folks by pointing out in some way where the
>> non-Arm changes actually are?
> 
> See above. I am not entirely sure what else you are requested here. Do 
> you want Penny to be explicit and list the patch modified in the cover 
> letter?

For a large series mostly touching Arm code, calling out the
"outliers" (when patch titles don't make this clear) could certainly
help. It's not like I'm asking to do such everywhere.

Jan

