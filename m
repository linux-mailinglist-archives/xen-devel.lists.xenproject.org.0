Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69CA5994DF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 07:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390011.627163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOuwj-00021d-DT; Fri, 19 Aug 2022 05:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390011.627163; Fri, 19 Aug 2022 05:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOuwj-0001za-9y; Fri, 19 Aug 2022 05:53:29 +0000
Received: by outflank-mailman (input) for mailman id 390011;
 Fri, 19 Aug 2022 05:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOuwh-0001zU-W4
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 05:53:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3df379e8-1f83-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 07:53:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6307.eurprd04.prod.outlook.com (2603:10a6:208:142::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 05:53:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 05:53:23 +0000
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
X-Inumbo-ID: 3df379e8-1f83-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUMgS2bcEYJpcFNeRjOHxUwsMXb1BhsmocxOP20NXm8fCbKmLmi5sG4d+iCNDOiKhQB7/X+xH/abP53W0svpop+OL8eiYu27SwfeLcmOdQWMkbY4xjQOCh3imvN0sPCgDhygxScCPRaEySGDwG9p6hL3NqUutwFu4G50tKd4nSQrpFoeYLd0S2rC/7tWbsTihlji9bjyjee1NHJtELqfcVO42LxDlJddULPx1jyoGWdmaMtRe7cpWwREfEQPbOBkf+DPhqXYM5lmRefyZTn7BLWOmOluE/ncdtOiid/PHWcswqB/2LA2fcpfjUllZMTl/yNOQPuiuE6Gi4cGeeGcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6AAXfDiAxXArGsZ5/ZfYH+rztlsh5AM94IBUfkijVE=;
 b=blKgBBt28B8V7RnyQDX+CchgvHqrnJXZuvGXSOG8XwBx//s6E8cG73FzK6gjke5764x89BJjA25d9PTZcvsX7bW179BMI4o8RpkbVRHryEMEzsPyc4QF/RmIsfI+x3TQaN5kFx5KaADovICsGomhb5O/hOrleOirdswZTOje0DJXz3xCETgFEmg24wSgqNUTItt+IR3NBCol8WlskoNm91Rfp0RRtt6/P1XdP1wmtCPKUoPC9HZSy+LWYi6oDNKMnptsbY2FABg6whNeCB0QkZhHhyJf03l1PSYP0w7JzekmIY9PjbZUTE/eu/4sho94qW853VB7KGHrN3K8LTt7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6AAXfDiAxXArGsZ5/ZfYH+rztlsh5AM94IBUfkijVE=;
 b=dk0UcqGj0AqL8jq0e6sEh1H1zUsyVaCJopHbnWPRcSK4IGgXJMsmReCQPDE85+6chARb1rQl/c0e4Lnf+wMkB9kqrDGP/jOAGEZOWIDgAaNjue21jMVliV+Et3kh9PJ0efA1CNL/0Gy7vrKAvFcyttFwWyNTVecWgbTzhoza7i9k9zmuKGmLgBFHIk1hOeTEJJHnQyRlwo7ddDWR7IF+Uvl84lFm+ERyp745+YSwlSVnoVj4mRqc4JrYHk7reWQwIMtjyhkYuTPyxpRwiaagv5pYXTEsGevrS8P9t+CsZaHly/FypYwssX0U4JyycKLL2AaWiOBZo8G5Zdlra8cnLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a101cc8a-1c59-1890-3575-9891893c1018@suse.com>
Date: Fri, 19 Aug 2022 07:53:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [XEN PATCH] build: Fix x86 build without EFI
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Cc: Wei Chen <wei.chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220816103043.32662-1-anthony.perard@citrix.com>
 <fb2a0fab-3e87-9a2a-a881-31ea7bdeae99@suse.com>
 <Yvu7Dpl5Pq/E8MxA@perard.uk.xensource.com>
 <ff4fbffb-915d-f221-2375-87358b46eee7@suse.com>
 <5d926715-b6af-234f-9798-622cdb53f181@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5d926715-b6af-234f-9798-622cdb53f181@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92605e07-7719-4d2e-44b8-08da81a720c1
X-MS-TrafficTypeDiagnostic: AM0PR04MB6307:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G6/230H4vnn6LW7EPIEIxz6u45stjLwUubJ1zQzCBQlky5Q3Mw9NEzsRg6hVXsgGs42aiXxjnYirH2tvbncaJd3poat7128WpvgwBJinUrzoIGyWxzuzFV8/fW0scfM29lIlHLb4egY9kmV6e8/TfLrn+nlvnrwMZoEc9+3OS4U/AHnnxZgZa6jpQ+N+qPtUansFtQvwyU3bTZGrkSeX3Zg1FObteNAFnz4yza2t7nJZFDtccKZmx2SVWfIGB7wmPbTuf0MXTdPAP0swOdyYONGPbBWAnnjfJ3k0vK8k0MJe7EPhf1Hlfc64Bov6qqj8aZ5D3zJE/aQMR08zXb4lA2yNnaRzHRswVPG1AdGiorADYp9iu7qCpKCO32HX5a1n/3huB8/bTsNuEgFj1Y11qzKvcPzXjaZfvT/JVX/b25Vo8YlVvGrAlforM/1t1tjElDDp8kC38UVZYgA+DuNY15Q4W7QSnHQcGGx9TOz0KBoZjCU8gXl/dGGxRHjNjHmKpUUWFC9JFiOdTI+f1KqM7FvHZL211ZKgTXgKiR56nBO+KIx/OfVRc6WXPe3QeRpHYc+iZJ2EC3Edk8DEcxtLjnn001w0N7uZw2Ps0DjMKr3REIW+uUMTKnAzWR59wiYdORtl8LuUvAiSk8WpXCYIa3fitzI3m/eC/2F09yaYjn4oTAWnW3i2y051Kcno20UpMS+qOw2hrnCP9+yCy2x8VeeRGmuUhEd/Hz8vbfEVfVaCxP5Vx18pEzNDqIA41/PkLvcF5gatwEzBZNPASQKYqHnqxMPi+48bQft0Sc5xSmQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(376002)(39860400002)(366004)(110136005)(8676002)(31686004)(66476007)(4326008)(66556008)(66946007)(5660300002)(36756003)(54906003)(2906002)(8936002)(6486002)(478600001)(41300700001)(2616005)(26005)(53546011)(6512007)(186003)(83380400001)(6506007)(38100700002)(31696002)(86362001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGN0Q0NiR0d3bjJRN29lU2hjL3ZYM0ZGMWlhV0hzUGNKRXpEa0EzakE3YnhF?=
 =?utf-8?B?ZVdhMGZIZEUyOUl0UWJiS25JTTdzdnpxL0dOTk1ONzlQd016S3U1ZVFvUDRq?=
 =?utf-8?B?Y2orb01oVDh3ZHdYbXdEYXl3dmhYS08yQzBrSURXRExMYy9iSmxnSGhnV3lj?=
 =?utf-8?B?VEpUTlFVWElaT1EyZzVzV2Ywa2Q5ZWhQOWVpb0FVNUxQQWZHa2ZFb0JKRHdn?=
 =?utf-8?B?ZmFTRk9TRVRvb3Izckp0Q0R0bW1NTlYzc0ZMUWdJSVB6SUJTaTBETjVZanZF?=
 =?utf-8?B?SHNTQmRRZWNFdFZwdFc4b2ROcDE0VTB3VzF2NWJIeW5CYS9zdlgycW40Wnhz?=
 =?utf-8?B?cTdnc0dva0d4UGpmd3NnNlpPaW5MaGQvNk5yc3JHUTN6MjFQTUw1dlFEUHZB?=
 =?utf-8?B?VW5uOGpYVlJUenhMRUQyNmNwSUVmYXNPRU9wSnQxU0IzY2dxTisycXRZVWxI?=
 =?utf-8?B?N2s3OXFPNjhNVE5ueDkvRWlNNWlXa1dGelA5NjM2MGdBY0NibEZmWU16c2c5?=
 =?utf-8?B?VkZ3cndaK0FwU3F3Ujc2S2ora3VIak9BY24xektrckt1c2ordzB6bHNvczhu?=
 =?utf-8?B?eWVnak5JMGZoWmt4N3lPTmFGRE8rdUdUMWFwODBSKzI5SHZUT09XRFFXZXJn?=
 =?utf-8?B?UVpNQnBJRzVNOURTSEk3ZlB2MlU0RkhVVExvZnlSLyttRHR0ZnAzWGdPUSti?=
 =?utf-8?B?ZmpLNUFBWXY5ZGJWSlVQaUJlNGZtVWxIajhIMk1FbG5Hd0VYQ3Q1QnBZbjNw?=
 =?utf-8?B?VWl0RytEMEhMZEsvZDhSUmJLRmlCbWhtOENxZ2dYK3B1R212TkcwOFVlSFNE?=
 =?utf-8?B?blo4NzZpMjhRaGR5S1FSUUh5cUFBY3BjeVRUb3lmQ0R1dHJiYllvMVFNUDEw?=
 =?utf-8?B?dXBqNk5sblM1QWp6MytvQ1ZYQlJ3bW5YcTRuSkxXVDI0WnJxaEVUYW40Tmw1?=
 =?utf-8?B?SUlRQkhJSXVnN1FKcmg1NXN2bDFCWUhmUEVON2dpbm1Lb2krUGxhNm9ieElC?=
 =?utf-8?B?N3dZcWNhZUI1MTRsb2VuSjNXZFQzV2g3OFA0aWlrMnNDZDhya2FxdnRoZXVy?=
 =?utf-8?B?YllmbVlCdmNieU5MQUdYajc3YW9ydzdoMUROdUpnbE9pM0tIajE4QnJncE1P?=
 =?utf-8?B?MUJGNVFmeWVkOUJNeTBNcklHTkFYY0trWGtIRW1OblNhWmo3a3drWkxyamk2?=
 =?utf-8?B?dHlJVmZNTytKNy91K3pqbEVCQU1sb3IxVGUwMitWbUdHY0Q1RVNHQk9KZWZp?=
 =?utf-8?B?eVhRZW9NekxBRjBpSW5GWGRYRHFwVm8vK0dmNTlRRDZwN05PQkQ5SW9IQ3Ro?=
 =?utf-8?B?OVdHL04wZFNNdUJodklCUHkzb3dZSUVGN21OYW9NYzFnS2g2cGNaZGpLUyt4?=
 =?utf-8?B?ZmdQMGtUdWtoWnNhS1ZpQUpPZnB0NTlYZDRody9hTjYvY0xYTVRuU2hJYThO?=
 =?utf-8?B?MmtLRTRVVTQ1VWNQdm1wTG9aYUJuL3dkTjFXVHd2RjhoNEprRWxTdzRJeThh?=
 =?utf-8?B?QmVPdThWNm5nYVI0SDRUUGtmazNnK0tVdG54OTJWYzgzRlU3Mmp1cXQwMTNH?=
 =?utf-8?B?eWdWQjFXNzRGd3k5UXg3MjhFMHA3QklEaUJCMmRYM2tGcjhXMEFkSDFnOVZU?=
 =?utf-8?B?RGtucDlCNk1iVkozenNHZGlSUEdNaThieXMwZWg4UDZqKzZmcThBQlBLbWVC?=
 =?utf-8?B?aWxyK3NlY3ByK0tibm9UMnhXMDR4ek5BU1JxY1pqeVFHclpsTktzZ2NKUkh4?=
 =?utf-8?B?Y0U2cjAzR3lCQ2FaM1AyWE9RWFlJSnc2cGw5akVkVjNPZFBBWWxHdVFEOENM?=
 =?utf-8?B?R2dEQ0Nmc0hwOHUrMVNuK2t3S1hJRDNkR1BIZldsQ015L1g1dXUxVU5xMHlK?=
 =?utf-8?B?WXNCYzVQdFZCM2lqRTNHY3B4MTFQcHE1M2t0Wk05STNZdjhHR0tsSno1aU1T?=
 =?utf-8?B?a0FPRE4yVGkwbi9HaWh4VEhMQnorazNmNnZtRyt4eCtEUVNPcU16OVp0WDVi?=
 =?utf-8?B?WkpYbVB4bDBMejB2N0JlS0Z6dlIyZ3lYODhTVk9wVTBPdEFVb3l2M1BRVnhX?=
 =?utf-8?B?WTJpRUxJaGQ4ZG5Mb0VsT2dKUVVjRkExVEpiK3NuZHR5OTRnVllNT3I5TlRs?=
 =?utf-8?Q?mVumQyOAD1b6ScGGFpdyjRBKw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92605e07-7719-4d2e-44b8-08da81a720c1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 05:53:23.8686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMfWRjkwALmcwKYfUP7+T2EAytpobdEL+000J6z+l/Xk4EfriYwDHfp/WDDy7P4txAtx9Ia8dW/INTOqgmOLbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6307

On 18.08.2022 19:42, Julien Grall wrote:
> On 16/08/2022 17:29, Jan Beulich wrote:
>> On 16.08.2022 17:43, Anthony PERARD wrote:
>>> On Tue, Aug 16, 2022 at 03:02:10PM +0200, Jan Beulich wrote:
>>>> On 16.08.2022 12:30, Anthony PERARD wrote:
>>>>> We can't have a source file with the same name that exist in both the
>>>>> common code and in the arch specific code for efi/. This can lead to
>>>>> comfusion in make and it can pick up the wrong source file. This issue
>>>>> lead to a failure to build a pv-shim for x86 out-of-tree, as this is
>>>>> one example of an x86 build using the efi/stub.c.
>>>>>
>>>>> The issue is that in out-of-tree, make might find x86/efi/stub.c via
>>>>> VPATH, but as the target needs to be rebuilt due to FORCE, make
>>>>> actually avoid changing the source tree and rebuilt the target with
>>>>> VPATH ignored, so $@ lead to the build tree where "stub.c" dosen't
>>>>> exist yet so a link is made to "common/stub.c".
>>>>>
>>>>> Rework the new common/stub.c file to have a different name than the
>>>>> already existing one. And build both *stub.c as two different objects.
>>>>> This mean we have to move some efi_compat_* aliases which are probably
>>>>> useless for Arm.
>>>>
>>>> These useless aliases want avoiding there imo. Already when the original
>>>> series was discussed, I requested to avoid introduction of a file named
>>>> common-stub.c or alike.
>>>
>>> Yeah, I've notice that. This is why the build is broken under
>>> specific condition.
>>>
>>>> If names need to be different, can't we follow
>>>> boot.c's model and introduce a per-arch efi/stub.h which stub.c would
>>>> include at a suitable position (and which right now would be empty for
>>>> Arm)?
>>>
>>> That seems to be possible. But how is it better than having two
>>> different source file? The only thing is to avoid exporting the
>>> efi_compat_* symbol aliases.
>>
>> As said - I think they're wrong to have in Arm. But if Arm maintainers
>> don't care about them being there, so be it. As long as they don't
>> voice a view, I guess as the EFI maintainer I can sensibly ask for
>> them to be avoided in a reasonably clean way.
> 
> AFAIU, the two aliases are using by the compat code. So how about 
> protecting it with CONFIG_COMPAT (like we do for other compat code in 
> common code)?

Hmm, yes, that ought to work.

Jan

