Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B16A4189
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 13:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502483.774324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcRR-0006oy-Gx; Mon, 27 Feb 2023 12:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502483.774324; Mon, 27 Feb 2023 12:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcRR-0006mi-EK; Mon, 27 Feb 2023 12:17:17 +0000
Received: by outflank-mailman (input) for mailman id 502483;
 Mon, 27 Feb 2023 12:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWcRQ-0006mc-5Q
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 12:17:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab7e4347-b698-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 13:17:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8074.eurprd04.prod.outlook.com (2603:10a6:10:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 12:17:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 12:17:12 +0000
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
X-Inumbo-ID: ab7e4347-b698-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ln+1PI7CHLob1AflkE8/AmVVQGrBqDvmNFpPvmPekmoorLJ3FTBQb9rvXMEjr7QXgnhdSTX4pGifW0a+p7by/kdOahQulhaZulXm1RLN5LN212dTOR4BfQ10wC7TIcISQ4/lE4OQXFm3eNBxj65qfXhLAI2Seae/fqjlw+f2xtFaZ771CqY4qPCmSti0mH6ZSb4kopgR6IyarclUBAd5Hzw9Wvii/rvtD7X4Zs1L2/S1fNrCevEhO+QWZCEMfCIPkhbE0solszUhQQqNlmj75bE54guKNl6+OfZdKgF4ayEUdXv3y8PfodvlGQM+MGJSVsWJEsEYVffwhwF3dRdC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4y1Fdn6C5vngabLpwtHHHEOotk460qslV729UxlBs0=;
 b=K3wGcEzLqa31YNo4zAFCwZKFlgMJZxQktA6dbTzszwalVxWR4dFJYugsXtpG0FUbiRubgmRgApQRsmsYObb5ygjVbOAzvYMRiV+6AhDLq5MshyD4BSii++sh/6eYbH6ew9fjdttAL8e2gFUtjf3dgeNo6SIgDY1KM05Uh41DOcrY2/ZIvLHHXXWWEg0D5kHivppx8yPfJvLRXe5ciwqaZIJMS4G3wC3fLNCe91BUxhZQZWF3prgT6L9k+DGLS61bLGbs8qI9m4HvizMSj/4Hq4EkNpnMubg7RB7BSlsNrMtnkqlbIXf51ClZ2Llg34BT6Y5XryZAS8ngX99xQaa0Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4y1Fdn6C5vngabLpwtHHHEOotk460qslV729UxlBs0=;
 b=v/P0z24xNv2cIZQx4qFVBlzR5wvJK7k4a/88VUsmwzZXtDw2owJWN73R6x4zUxwR24+qIYyAxIugFxgiJMZD0S/tar5gA6UtLWbm8clwMm6JZqQEASeI43+knh2lj56Gtja7+gy1v8BMxwqnFPYczZiIVN5OM4VRJgBpo4fl1o57x7Wt1CXR6U5F8+mCrEji44acqe9/nc/X/Pezs6G2COkU22Ks1061eiKtEENuY07MjcRf8lG+otV/91dor7D4J6bhsak3ogKNJxQs+zfd+61s3yGcQeuM2Fj7UWuQJkDd0Nz+64zNCUz7FQ7sfjA5ft2LuaEW2SgBm0+PTBgIVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60252bef-c732-b061-8ec0-c4022eb41255@suse.com>
Date: Mon, 27 Feb 2023 13:17:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
 <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
 <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
 <aa326f9a-94ca-75b9-6d4a-ab6fdf992c29@suse.com>
 <2fec6c39-f73c-719b-7bc9-02e1ec3f195b@citrix.com>
 <5e623eaa-ce32-e3ac-2089-68bf8125b5db@suse.com>
 <18b9b99e-1d93-73d8-f9b8-873f44287c5c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <18b9b99e-1d93-73d8-f9b8-873f44287c5c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a839ac-5ed1-41c9-c7f0-08db18bc8dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Up318CLvM0Da25FBX5etIqnCqV1u34Hb9ShpjhSf3XVI+xZ8PKwYmVcHuKVf0s+cXT4d+RRu1TcAJwCOBK5UGnRAXOWQiGX4rlbYG2AymrqWag/qyuc/2hN6AS4MgVLM7ozsHco8HLPuAlzlyYvA/6o7VxrJo7mI8UDqY54aiPORGUgU4abb3AnW9hrSn2WTRAKkSEW+nFhHOZObCylCJ3XUhdMbx1FfyDetMeSloxxJMkBSFizbBuo2z4jfPe/t5xjeLs21GmiTHtAeVxpa6IB84OycPv4zmhyV809KQibqY0Ux0d7U7DxKkmrg7pf7wF7iXwgw8HGJxzr4krMB7Jb2YUhVKfHSiwxtHRmWi7ut/S2Jw99Xka8yMdcS2661UjP6C1md2bc76q8cyBm+pCMDn5Hp1k+cWrT6wkkt19FMeoKxB79Ktb5G9bU8EPT17HUe2G1CAPQ+/atk6g9rxtjs0H5gijK5axbUbXnYvIBbUA/hXONYpYhFUiJhvx0MULdmRKWaAPi+tYYUho1v13RwgNrWgJrsZ92FO0cWo+uxvPS1T60LN0zWd0GL7X9Ak/HsQB4e0xDcRmLX376/M6/U2+12jWg3qYc06+bMuVR0y6/FZmkFDQNPjuD+/8TFgUBiG0Ka4qThJn275sdjsOZ3aJhykqkIFazt7OuFBIy9nJFnHWYUlIFFa+VMIV7Y611RtpmVRgXa+XKp7vMByPs8xZOBIEyqCt7fhewthq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(31686004)(316002)(36756003)(54906003)(86362001)(31696002)(38100700002)(83380400001)(6506007)(53546011)(26005)(6512007)(186003)(2616005)(8936002)(2906002)(6486002)(5660300002)(478600001)(41300700001)(6916009)(4326008)(8676002)(66556008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkNQOFJPUGN3eWpGMW5Wc0V2d0kwaks3SjNTbHo4cVRnNkhhYXROVGQwck1X?=
 =?utf-8?B?eXF6WDJHYWhXb29QbDJwZDRHOWJ4VXB6ZHZzbnZTV2J5OE1ZczZDL2FLdFow?=
 =?utf-8?B?VktOSnFTckxkTTNraEtRZEJ0Wmc2QVllRDl2VWNBd3hVQzVUbFBrVVZjWmJi?=
 =?utf-8?B?SjFac1hGa29OYWZybGN0YllRcVduRXJJUG02S2tRZnEyU0tUQkxNR1puMjNW?=
 =?utf-8?B?T1BzWmlhb0o3bWpnb2ZhVEg4aDVRMEdOcmRyYVhUUWtmbDZ6UXhaOTQzVm9x?=
 =?utf-8?B?UTFTeWozNDlMM1NEVHRqcncxNjJBYlBqM05hT1liVHN6c2RNQXJBNUM2dlVN?=
 =?utf-8?B?eVgwY3hpcVEvL3lWVk42bnl2aGhYdDFIOFFaVjA0N2NYcHpQMTZwdlpiSm5V?=
 =?utf-8?B?b0JZU2k1TWZqaUZTQ0xpWWZETjUzTUlWK1QzbFlEenMwVkdiYkpwTE55YXVj?=
 =?utf-8?B?ZzFGT25VdTh4QnBkTm95RXovVWhJbHd5elJWWmpCaDRER0xLemJsNEczOE8v?=
 =?utf-8?B?UFRWcjgzOWNHYUxPMlpFeERaOW4vTVhudFVZTm4xdm9COTFUWk5DanlQc01a?=
 =?utf-8?B?VTcxL1JKT0xsV0hab1djTjd4M1lOM0oySlJPT0xYMG1sU3p6R1RETWFGSzhL?=
 =?utf-8?B?RWlocHdmK3p5MFU1WmZqazR5Q29nVmF6M3JuQXJ5bXM4cFpoRldxb2tXQm1h?=
 =?utf-8?B?ZWtNaHJRdEkwc0NNcEgrbGE0WC9yeWt0bXZsU21aS3lBYkpuV0s1NXJkUFJa?=
 =?utf-8?B?S1FpVW1SRVN3T3E5NWNGU2tSVGZYdEZSUkphekVlaXY3OHNldG9hTGtSV09L?=
 =?utf-8?B?SFdmeFpFQi9POTJYOWMvM1ZobDFSSktZd3FhVkVKMlVrQjNObWNkZ0FkYlZu?=
 =?utf-8?B?N29sNlcwSFA4MnNCbG1ETWMvOU9VRVE4MHo1V3IyenZpc2szVkJYRDYvZitU?=
 =?utf-8?B?SGJ3ZDdYamkyWnNPY0hiMHFGcWJlTnRpQzU5Zjlxd0JEbUV5RGJPdEZvMmlp?=
 =?utf-8?B?VjdvZ2IxWkt3TFQwRVh6YkVOWkQ0aUdPaDk0aDdTVmVENDIrOS9pR0Q2NFZG?=
 =?utf-8?B?bEJ0aGg1NHdQaXFwS3ZMLzBFWjZzZ2ZpYzFRQXpqMFZtU0hqQTdWendyVTZw?=
 =?utf-8?B?SXQzOWFxWEtRb1ZEN0ZXdkpIT21aa3FrbkFwRXZiZWhUc0tjOWdWOXlBT04z?=
 =?utf-8?B?dXR5cjZ2aTNhQnJSSEgwaE5sVWNBd0IxWFJLNkV2WVBFWncrNG11N051U1Ev?=
 =?utf-8?B?blMwZGFGT09nQU5IWmRLUVQ0YzZOeFJOTXJYL2dIdHFvS2o1dG5QNVhBbzFU?=
 =?utf-8?B?MXc1eTJkekM1eGMxMlVhS2ZMblJ4SURCUjErWXFna1p3SnhUa3orWEwrYTdF?=
 =?utf-8?B?aE1QOWlodGtNVCt3YU9zbmtwd0pqZnhRKytjejNXZFl3eDQ4Wm5PQWRPdkRX?=
 =?utf-8?B?YStwaEh6cWtySU5vWUpkWExCVEEyL0U2TUwrYnlmUm9ydFcrenhRN2hJc1ln?=
 =?utf-8?B?RXdGM3R2L0JIRU5FSmJZUmp1bk1qN25QakRMSHNOeHJYZTlodEJVb0ZjMDYx?=
 =?utf-8?B?VExzZjgxWk5lV3h3TEtpSG1SdnJYczlDbGl5cjV5VGZlcW84djhmMGdKTGdF?=
 =?utf-8?B?Q3MyVkFKL2poKzJ3Rlc4cnlGVGU4ZG1aSzI5QVFSUDhPbE9qOE5zSFozR2Ja?=
 =?utf-8?B?TDczVmlDNDlnNmVyZmRUZGJ6WXV3U2p4Q3hHNERWMERVaEc5WEJ3R0VQOFRo?=
 =?utf-8?B?blNVZzZhUjhwM3hDR0hQMGJReDIyeitQcmNncUtOSzI4dEdGa0tuNTJrR0Zp?=
 =?utf-8?B?S3RXVEszQzRSemhlNU9Bb0NDWjNFRE9pU2gxNWJZWGtFQ29DcG1QRWxmeDBr?=
 =?utf-8?B?YTJSbXpWK0VOY1pQRkNCbUJmU0RmOHVJMGtWQmxlcXBmYkZyUktjS05JN2Zy?=
 =?utf-8?B?WW5KbldVQzRaSlpsY1JhdUFjSFUxdGtjczY3dEZWTGVaMnQ5Q3BXcDk2UDdI?=
 =?utf-8?B?K09MVHJhSUJQWDBuNUFwNDF5Z1dtVUQwZGZYSUI4ZDRUYWRPY1NwZDZzZnpt?=
 =?utf-8?B?ZHU2a3VVTzV6Wmp3OUt2OE5LMkxhNWlaaEZaWGtxSFhFOWgwRkJFSFltRVAy?=
 =?utf-8?Q?XJqwDCUxD09N6GQrRNu9U8NTs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a839ac-5ed1-41c9-c7f0-08db18bc8dcf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 12:17:11.8929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTBluK9QvONMpJpHDFNYIMHQ4bBFasZbEWJk31nkQpaRBdHijyUdQtzdHi8qHeQ7J5aUWvpLRuFCrrlv+5hnIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8074

On 27.02.2023 13:06, Andrew Cooper wrote:
> On 27/02/2023 11:33 am, Jan Beulich wrote:
>> On 27.02.2023 12:15, Andrew Cooper wrote:
>>> On 27/02/2023 10:46 am, Jan Beulich wrote:
>>>> On 24.02.2023 22:33, Andrew Cooper wrote:
>>>>> But I think we want to change tact slightly at this point, so I'm not
>>>>> going to do any further tweaking on commit.
>>>>>
>>>>> Next, I think we want to rename asm/hvm/svm/svm.h to asm/hvm/svm.h,
>>>>> updating the non-SVM include paths as we go.  Probably best to
>>>>> chain-include the other svm/hvm/svm/*.h headers temporarily, so we've
>>>>> only got one tree-wide cleanup of the external include paths.
>>>>>
>>>>> Quick tangent - I will be making all of that cpu_has_svm_*
>>>>> infrastructure disappear by moving it into the normal CPUID handling,
>>>>> but I've not had sufficient time to finish that yet.
>>>>>
>>>>> Next, hvm/svm/nestedsvm.h can merge straight into hvm/svm.h, and
>>>>> disappear (after my decoupling patch has gone in).
>>>> Why would you want to fold hvm/svm/nestedsvm.h into hvm/svm/svm.h?
>>>> The latter doesn't use anything from the former, does it?
>>> It's about what else uses them.
>>>
>>> hvm_vcpu needs both svm_vcpu and nestedsvm, so both headers are always
>>> included in tandem.
>> Well, yes, that's how things are today. But can you explain to me why
>> hvm_vcpu has to know nestedsvm's layout?
> 
> Because it's part of the same single memory allocation.

Which keeps growing, and sooner or later we'll need to find something
again to split off, so we won't exceed a page in size. The nested
structures would, to me, look to be prime candidates for such.

>> If the field was a pointer,
>> a forward decl of that struct would suffice, and any entity in the
>> rest of Xen not caring about struct nestedsvm would no longer see it
>> (and hence also no longer be re-built if a change is made there).
> 
> Yes, you could hide it as a pointer.  The cost of doing so is an
> unnecessary extra memory allocation, and extra pointer handling on
> create/destroy, not to mention extra pointer chasing in memory during use.
> 
>>> nestedsvm is literally just one struct now, and no subsystem ought to
>>> have multiple headers when one will do.
>> When one will do, yes. Removing build dependencies is a good reason
>> to have separate headers, though.
> 
> Its not the only only option, and an #ifdef CONFIG_NESTED_VIRT inside
> the struct would be an equally acceptable way of doing this which
> wouldn't involve making an extra memory allocation.

That would make it a build-time decision, but then on NESTED_VIRT=y
hypervisors there might still be guests not meaning to use that
functionality, and for quite some time that may actually be a majority.

> Everything you've posed here is way out of scope for Xenia's series. 

There was never an intention to extend the scope of the work she's doing.
Instead I was trying to limit the scope by suggesting to avoid a piece
of rework which later may want undoing.

Jan

