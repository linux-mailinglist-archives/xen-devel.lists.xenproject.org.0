Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081486D0939
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 17:15:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516774.801428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phtz3-0000Qq-Lt; Thu, 30 Mar 2023 15:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516774.801428; Thu, 30 Mar 2023 15:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phtz3-0000O7-J1; Thu, 30 Mar 2023 15:14:37 +0000
Received: by outflank-mailman (input) for mailman id 516774;
 Thu, 30 Mar 2023 15:14:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phtz2-0000Ni-Hq
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 15:14:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93faeca6-cf0d-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 17:14:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8057.eurprd04.prod.outlook.com (2603:10a6:10:1f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 15:14:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 15:14:33 +0000
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
X-Inumbo-ID: 93faeca6-cf0d-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHlzn2ypmvv3TFAVUBR7caRELki3z+DAsGE/aWUeBejWhpAemQzoW5LoZF+nkspzgsvWwodticRJErzIKlL5BTwf9gux8Ip4bJsFWOfiGWP4kfo48LSDLh8eD2x9fdWzquHREKijn7/CjAcXB3W6zt7Exg2rHVHz4lpqA/LhFqV+n9bmDp8cE97SwSdqBtXlFU+J1ek0V9ZPBpwoAz3Q5eQOb/HeE+bPq6mYPGuZdFCwaFtVg6SqILk7x0fRwSWch17r4zzTe3iKkeEbMGWv4YzyhYcHPwMzD20wUV3w9ER0CVfbU27NAAOIzJAQLZ5KFUGVqCiDZPpnCgu7ozxPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeHIt9ihxT5cOnOpElgxGNfRw0+SH2AhN4CuIc2+a9o=;
 b=FihD1AvaEgBWhpyFNYMu+ZllrzJi265JNzQJ77HyS2mpjs0dgGkwHppvEldkPrcEclZUcmPk/0NDc0TbGNhWQq6H76zzuRLvSsL9T7zSby+fYbN5Lvnb3jhAMspMF3nJ5DReOZmeVyR6bTPgqN/ePDA6DguM2qaLqTtYFPkqHYc2KX0CmF93/Ze4LFDxX2K4wDr5E913S3bb3VTs1hOvjk396QOniifM/4rHpeI9SyotXlewlmsub7324BZmaGhSoePJ0yL6SPmGhcU2wiCbU2KtWwt0vJufeDqCkOVNudMXLcL0FfYbcA0I/ZDICSTzOAJd5QvnheqynLnMIDEqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeHIt9ihxT5cOnOpElgxGNfRw0+SH2AhN4CuIc2+a9o=;
 b=LTaS7FGcl1Xl0D5JVEsvAZb+BNLjjUUYjozfHrIwMzU1ttHs5Png4y/CBUo9qG5z2sS72/ejUTsVE9Gokp3fNbWLwuX2DQN7NSIbEryUxcLCckrJswtdcaDYlv76BmOXF0exS7CkQpfRbeFUsZJgETEVAtb1ZurXJQAdxy2HSMfoTbsWoCvMBZxa+04C9pXJA7rpwB1pR2j0+lxte6S2CaKDHT1noHbV2HGNy3rkeAtGKx8FRBeo4lrbTCLigUHuepr6pUdkCj70hzfdGPq6MFyo1+XAyBD4EizH1+k8YhHh4Kfw0lCqzF+P0Jty4G7E4XWA3xo+mqNpGwnwu4F7yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eabdc3d6-9bd3-1b17-ed2c-27e5bc600b88@suse.com>
Date: Thu, 30 Mar 2023 17:14:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
 <ZCL3W/HrwLANuE/0@Air-de-Roger>
 <40d58ac1-d0bb-afed-c0ae-c545c7bff30c@suse.com>
 <ZCRIbKcfi8hn1m8Z@Air-de-Roger>
 <600f8643-fddb-e9f8-3d73-41eead3d7cfa@suse.com>
 <ZCVcPQNBS3bjVF+W@Air-de-Roger>
 <6591a671-a71e-f669-749f-c36dcd593cde@suse.com>
 <ZCWcTVLcr02LSLoF@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCWcTVLcr02LSLoF@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: 97af0fee-2611-4784-5dee-08db31317701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AlCeYXx/Yb5cgwxT0FZR1aPJczDAPiptGz4g+CamFmHcDFDJtzY2ZoUFumyQ1s+vWcNejFEAOVMhPEWdN7Uhrcc1E4TrzQzKsyoP1EoqNbn0eOXoUrJEI7vP/8vW3vwvFfNSmAg4UrUcH4IuGlhuQs3FonYNOpn9z5HMtiJX1KuKIOb0tFVBKmgFN5oe+yhI+KMdPFPTwaEnKD2P6cQcIhspS5hfx6e14nWzeNIqoEgETbKhASASBfTCBJWLPTi8sxdwinxrDIcK13+O3H1apaXi37lC7FFVJZ5Rig98ZBQiEbk/S26g/4k7vN4tNfPLuq1kr68cJG2mBv5yq+GT3+Q6GlQaTcv5kilv5Vz3STeJdBrNcC1h8a11hBtawZZM0LJRxPDVqbPc8hcIzHchIpmW+jb/t9m7kgX4vwWPRGzQFAtvMUeh25Xfsr/DmymhKwyZrTMPs1rK9os0CgyXuy52HhC4g8fz24UCIVD/HuLoH750cqZUc9yCAYhRcJIY8HCTQ5sC3NEW4GTghRJHFufY9f2g/JFAAMB8ZuSbB7xkpK0eSGhxWTXlaw06RMSCqVB+lf6TTg1Gnsb1FQMCMT4IpmFRpanutoODt6qIPKjz+CufDnrtwho7VjWqPhLfpdi8Q1tEf9xVm+vxzd9rdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(36756003)(86362001)(31696002)(6486002)(66476007)(8676002)(41300700001)(66556008)(6916009)(66946007)(316002)(4326008)(2906002)(478600001)(54906003)(5660300002)(8936002)(186003)(53546011)(6512007)(26005)(6506007)(38100700002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkpLUGxnWE9OeDNLYlBuVUQ1a0JFek5UU2lEL21kQWVtMlVWanNzTXl2SnRM?=
 =?utf-8?B?ZW9DMHRQam1kRm9NSUZmRjFKc1FpdVV5L3JtZ1hzUGFXWHQzdlNaTXh2WVJB?=
 =?utf-8?B?NTBWeUw2UGtLcms2WjJJemtNU0hrU2s0dkVMMUJGZnhMMkVacmxkQ2JuU3Ex?=
 =?utf-8?B?SzgwdFBlWnQrYWlRZjhHM1RBTkd1bHZ0SDhoUFRTNU9iVmpYL0hhUXh1Mk9i?=
 =?utf-8?B?bDQ5RzA5NDYvODBoV2poRWRqWmhENFdhU1U0UWtXR3RaNXU4Z1BkMlhScWtJ?=
 =?utf-8?B?S2Z6SnR5T3BzbDJvUnZoSTdiaHB5Q1E3M2lkbXdYNjRYdVRXZkZMRzNhMnp0?=
 =?utf-8?B?SmV5a0ZlZ2YzU3E1MFpQQzBBdXVIcjRnVklyZHlYQ0JpWmhXeFlmSlBJdG5h?=
 =?utf-8?B?czV0d2JXb0Nsdno4b3M5dUtKYzUySzczeWovQ2lPYWUvam1nQTI5b2x3VFBr?=
 =?utf-8?B?N2NZbkMvVGNuNmJ0QTNtVG1tcUdmZTlHQlo5QjYwRUdUcVlJRG56VXMrYnI5?=
 =?utf-8?B?M202RnBYQldJTVdqU0VreGtxQUppb2h4NXJuMVBKa3FUb3VnR0dpeVlvcFhn?=
 =?utf-8?B?d3lSOHVVNUtOUG8yRWV4NHB1ZVM0eGhFN0pYcnNpaWdjeTE3YVhJTVhTaHZL?=
 =?utf-8?B?N1MwUTNvNzZ0ZlFuMzluQ1laajRLMk16UFdHRHk1U3ByS2VFeVphK2xmYkh4?=
 =?utf-8?B?dVpaUUVHZmM1U09YTmNDbzhzU0p4VVdxWk1vT0lPa202b3dJQXlBSitSZ2dp?=
 =?utf-8?B?bzRvVGdGV0k2VmwrbWRYUTVpT3JmM0dtcEUrcXA1QTZhaFV0Vm0wUW9kcmhP?=
 =?utf-8?B?dWdJTzJrSHRaRjh0am5icTZGdWZiVnROWlVPZGhvY2p4SzRKZkpzV0VVdnVy?=
 =?utf-8?B?WnBmNDkxU2lxeW9qTHRNVExsYm0zVHIzblk1MlBGSnFmUUJxaldZV1NSQ2hB?=
 =?utf-8?B?Ny9YQXhLcDFkRXRMdWtJaklrbnBvQlJ6OEkzT0tHNG1SZVA1MjN3eHY0WWUy?=
 =?utf-8?B?WDZTQ25NcEJHaXdYNm80TGtMOGRkQnRYdmlqNHRmVXJYWndaUTVsTWtYQjky?=
 =?utf-8?B?ZFFuNlZSTUU3VFQxNHZzNFd2UVU0QUF1cHFmZlBCdjUxaXh3N1p4WjN3MFpU?=
 =?utf-8?B?K0M0U0hwUXlBeGMyWFlTS2V5ZThKa3JTb3FDdXhhdVZIRk53SlVjOWRLTVVs?=
 =?utf-8?B?RzZPcmNsN3o5WGFnOUQ5TURjMVJBSk9tVFhXZWd0VW1aMUN1TEdaaDNzRmly?=
 =?utf-8?B?aUx4Ykh6NzkwdEZRc2dmaSsrYmRqQ0pXSDlLcDZ0c0RQTXVUWWhBTkQ2eUtV?=
 =?utf-8?B?a05xeUIyNFFFZzkwUlU4dFVJNS9jb3A0K2gxUjljYUdFdkYvUTZSVU9wWnFE?=
 =?utf-8?B?aTV2eGJKbUxUdXVJMFhveGsvVnpQV0QxN2dJNk9RSU84N2JMNjVPRThRZXh2?=
 =?utf-8?B?djNlWDRWM1FyWjdkSDBEZW9VaXZtZzhBa3pZaXduSjRERmRocC9CU3k2YXlt?=
 =?utf-8?B?WWdtZFlzUjVlUjl6VXB0dHVHTnUvMWNJVllwYVBlb3FuNUdlKzUrV3podHJr?=
 =?utf-8?B?UDc3QlJDbVNqWUQ2blBFNHFPeUM1L3lzaHVJSU5vaFkvTkROcWMxSEI1TnEr?=
 =?utf-8?B?ak1oemVtdFBkaXRHTFFmSzN3cjlHWUlqaHk3UDJYWVArdGw5Zmsrci9abEk4?=
 =?utf-8?B?WGJxNmxGTkRqTDFMeUZSNzJIS3U0b0NtQ0pUQlFOelk3dHEzNnNubDZTdkcv?=
 =?utf-8?B?MEZEUFIwTzhpZm91Vi9jYis5RTNQbWVGOVgwM2VSUW1SRVdoeHVLaVhqZHRY?=
 =?utf-8?B?TTR5ZzQ5eXM4RUptMGFYQWxTSmZoUFg2V2pPUjhrYmUyTWVNS281TTRFSi95?=
 =?utf-8?B?VDZFaTNyckcyVXdwSkxqSzgybU83VUU2Sm9udkg1QVJiODdZS1lodkpYbjBU?=
 =?utf-8?B?OGxNNU9XYkZkMFRnK3FlTGZwVXdlRHlYSWVPZlQwb1VNSDBXODVYUWlPWGI1?=
 =?utf-8?B?YXNOYmpiMU5tMGRCSDI3a2E5V09VaDV1SGJ3SzZNT2RPZFpXYlZpOFg4SU5j?=
 =?utf-8?B?SVRoN21JVGNTaDhtNElUb2g3RTdPd0hEbHZnQVdQUWQ0Yk0yRGM0QjRsVzNv?=
 =?utf-8?Q?4H4lbti+7ruAp+qI03i1ChUaM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97af0fee-2611-4784-5dee-08db31317701
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:14:32.7183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8zs4TP84/tBhqcXNpW/ck7nBdMklCTjUXezY33GRvqDaO6Xtm2KEBic/HIuLB96Lxf3U5UHMaRgvm4S5l9Vjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8057

On 30.03.2023 16:27, Roger Pau Monné wrote:
> On Thu, Mar 30, 2023 at 01:40:43PM +0200, Jan Beulich wrote:
>> On 30.03.2023 11:54, Roger Pau Monné wrote:
>>> On Thu, Mar 30, 2023 at 09:53:23AM +0200, Jan Beulich wrote:
>>>> On 29.03.2023 16:17, Roger Pau Monné wrote:
>>> Patch 8 I'm unsure, I guess it should be up to the user to decide
>>> whether to use -Os or some other optimization?
>>>
>>> I expect introspection users likely care way more about the speed
>>> rather than the size of the generated x86 emulator code?
>>
>> Perhaps. But do we want to introduce another Kconfig control just
>> for that? And wouldn't there likely be other performance concerns,
>> if performance really mattered in the introspection case?
> 
> I don't really have a strong opinion on the usage of -Os or not.  It's
> likely fine as long as we also stay consistent with the flag we use
> when building the test harness and the fuzzer, just in case.

While they might be built with different compilers (and hence things can't
be compared directly anyway), I can certainly make those two use -Os as
well.

Jan

