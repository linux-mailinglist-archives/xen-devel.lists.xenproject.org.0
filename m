Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D963A6612
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 13:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141351.261125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsl9a-000545-MS; Mon, 14 Jun 2021 11:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141351.261125; Mon, 14 Jun 2021 11:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsl9a-00050i-I1; Mon, 14 Jun 2021 11:53:18 +0000
Received: by outflank-mailman (input) for mailman id 141351;
 Mon, 14 Jun 2021 11:53:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsl9Z-00050c-27
 for xen-devel@lists.xen.org; Mon, 14 Jun 2021 11:53:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57a63d20-8878-4b9c-a310-470d5b72ebc8;
 Mon, 14 Jun 2021 11:53:15 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-3z3uM3oyPU6pw9Tf33767A-1;
 Mon, 14 Jun 2021 13:53:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 11:53:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 11:53:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Mon, 14 Jun 2021 11:53:11 +0000
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
X-Inumbo-ID: 57a63d20-8878-4b9c-a310-470d5b72ebc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623671594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypFJ2bjnskxJSpRs9AnLPofEHdB7DVcudEEVG0dBTZk=;
	b=YTTkSHvTRVSx6Cum49oS/HLXA/SykF6bvH0i8C5cTp7aOlkx6J0vxC4+klVRTR4kVJpwEF
	1kpZu9zKFDFUPIQQnpW1oWLR4rm0VH3GnfJRGKoDdN/MKJUxLNGb6z1xq8tV7RsAkRm50m
	0VebtbHBWcqCqacrYG1pKsbPyErhbrg=
X-MC-Unique: 3z3uM3oyPU6pw9Tf33767A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceHSVXw9lf9oc0BTSdBuCXknBv+Kt2M2FLATRJTOgRvwjDfu/K0ohpWiw+M6AH1QzwgpPVgy79Ok4Ip7htKXrfjQy4qL4ctsQSxX2PdeviLkJNBu76KY0Ez6q1k4ujsKVNqXw2TR3y8i4eJsV82wdhi+27I+VdHHbaOh8nCKSx4OQO3hEya5VMlECJkNUIksIbC0yfFbH4Q4k4qA6OLXX5i2Zeixpa7dvYMAdbzwpNiQ7ZidqgVgumq2Crq1uzOBSQ/m6mSFptTeXRjAoAc+gdbw/dDvZjc2yVsohTzIYyaxcrOAaEq2RlNU0cvMb9FLqa9+R5t2AmIHPwHgLMLRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypFJ2bjnskxJSpRs9AnLPofEHdB7DVcudEEVG0dBTZk=;
 b=Sg3a2gyqmH0LDw+/oLmgsnxrzSQMWx92bWy6EFu53KdPmANq7vqdAHVc57IzIV4GF+U0k9HODG9S/oxm/1ksxYeWF0x+Ze7lNqPoB4VpWJSwQXmqB37EjF7p2/SopVlh+lFaFogki0K50y9I+GVZwAcIKd01SisngHZPG4hpCFtlM2RaqxijERb6DUGr6YaFbROtSIvViTBdg/EJOJYZY5I9fc/AUZUwv5+o54amB1AKK114O59uE45147OVjoZ+481yjtd0nDACRec+wH5oEpe1CG4AbvWhBMDb2gviZ81eOrsA7f+zHcNs8toQG14oydRl5uJ4X1Q0OBg6P4x0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: BUG in 1f3d87c75129 ("x86/vpt: do not take pt_migrate rwlock in
 some cases")
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <0efd0099-49bb-e20c-fe8d-fb97c9de2b63@citrix.com>
Cc: xen-devel@lists.xen.org, boris.ostrovsky@oracle.com,
 stephen.s.brennan@oracle.com, roger.pau@citrix.com
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <74378af9-5d04-f95e-3957-918cf5c81ded@suse.com>
Date: Mon, 14 Jun 2021 13:53:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0efd0099-49bb-e20c-fe8d-fb97c9de2b63@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a32cdd8-a8a6-4dc0-915a-08d92f2afc07
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150904A24E77687D6DB2209B3319@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4/410YQiOPdsn9MQ9p/ci3bibmM19JbYju/7W9hIwNGvkIUBCGtC1YPIDJhlrep7DT9cfORv/0FMm6PG0+WazyV5zlU+KY6ViGtvGyIlksYXb24bMDA536rxMBcyKO1I1/1SyacoZ6a5xEGzCMNL9WkDI1ZoOx1qYaBK551jacVACdVjsDML/6p4q3AmkxtWx2I2Awd7WPrtWsse6MLUe8FV56Lr4bvZYvHXsp2U392/MdkQ2/whVvlZbJRM17RhrCV7B/JfrOLmU7YEQ9AESJ4Od5uIf5O3/2OcIjynlj0mRpVRefmev8F/vL1TgB9g8COdDvEEaRb0kAcxNxnPDInRKM6bqYL/cNqKLIYjjy3014IiWeFtK4n9ba6RCtz/M/X7087/z9ao5vc0gkAUZS+qCnnUYd0LWr27UHoVHrA9rSYfb/4KEI1m4DXpV3t+joMVGF8r09SwBMjLplr7jbWgf6FmVqSqjTmqzHjWPOAvgI88xSSljnBrvRZI0pVINMJuyTnxQe1iFBlbsSwx4kE3/PIzR7i42661nHAqxxbQcjoC3dAbrawa2FGEDnFMO1ryjVQOi2opCP4f6XhT8J+Dn3k/xYhb9tqNP2SK9ZBm4bQjFSpL4Gwij+BjaVN6GBXdsgV/Dfss/OJJ+C4QVzLmqf350UKjU11nxyVdUqo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(6916009)(26005)(2906002)(316002)(86362001)(83380400001)(16576012)(31686004)(8676002)(66946007)(31696002)(8936002)(36756003)(478600001)(53546011)(66476007)(6486002)(2616005)(956004)(16526019)(186003)(38100700002)(66556008)(4326008)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VklJV2NaQm11TGxsTjhQT1hSZE9VS2tJcEh1dlFIdHFUZXRaVUE3cFo0ZVI1?=
 =?utf-8?B?alVOWmFyVXFUZmxJTzEvUUJUUWtLbDRWQ0sva0QxZ2RoNnRscDJVNmZvcUxy?=
 =?utf-8?B?dFdZUis2Q1VMak81R2x1aWRFNThWa1dWZFh0M3VMYnBXcmp5RHUrd1lUNVAx?=
 =?utf-8?B?NTY5SnVIMlJSZmdTcDUyY0pUNk5ZMHNCYkdZQVZabDVxazcvejYvM29wL2I2?=
 =?utf-8?B?WXhoT0NUMHBmTERDY0JMS1VOSktLL1VqaXlYRzB3K1NtSldyRUJSNjRZVzRL?=
 =?utf-8?B?ZGl2WEhrSnVLY0JQQjRHV2Z0U2V1SWJrcGFod0ZJSmZEUTAwNmNXUGluOXN6?=
 =?utf-8?B?eklzWGY5OVlWa1lqU1d6cGdEdGFYL3JoMkplNEdXbVBjeXJmeGhQRzgweFY5?=
 =?utf-8?B?ZzVLak1nOG8ydU02NTBQSTB0cjUyc2FrejZyOWplVG9QanBsUDRwenVBcGxJ?=
 =?utf-8?B?V0JIVEk2cXNRNUY0Q2YzZzBEMFphNDh3NnBOeE5ZYkNFRkNHTHExMEdJd3Nu?=
 =?utf-8?B?a1hxbHE0NlI0VmZhSExCSUN1b3NrcGY1YjR6M2s3ZVZXalpjYTZuZkhvWm0y?=
 =?utf-8?B?WTIzVnZXbnF0NXc3SmRDaGZtbllaWFRPTGxHTW93NkVsb243NC9kWHNsVkZJ?=
 =?utf-8?B?YWxqbm95YkFYRDRmV3hJREZ0cXNOeXRQNmZPL2tSNjZkb3RENkpwbDNwVHp2?=
 =?utf-8?B?azFKSURtaHR6UmprTWtpMGNwR2tTWCt0a0hWdGRGVjBnbVlENkt2Qi9VVlRI?=
 =?utf-8?B?SUg4M3U1M3dTQmg2Rlo3ZmlEUkFVOFBQQm5nclFTdTVXTTlDc3Uwc2w4d0J2?=
 =?utf-8?B?ei8veVVEY2RNK2RVWkQyVHZjMnNQREVDK0M0UytCQ3BHY2xqbStPMk0wYWZq?=
 =?utf-8?B?TmtYV2lIai9SQVZiN2dURHZ2ZTRHa1l6a05uUjJqbitoT0NBUzgrT1BtM2Rx?=
 =?utf-8?B?VHVQNHN0dHhwUUpFcUo0b1RnMEFHeHZraG1tdUtLUXJxZko2TnFJbGpZZFFh?=
 =?utf-8?B?SE9pZTNvRncrM0lRd1dEcUYvM0wxdHRnMnhWejU2NE5rbCtqNGhHWHRNZnIw?=
 =?utf-8?B?WkZrZzM0S2RLMFNadVE5RS9QTUt3ZDd4cVZtdk9GenY3N094aHl5M1J0anBm?=
 =?utf-8?B?emJsbkhFc3I0THo1Und3K0dEaEdpelZOU2pDUE0xME8xYjJ2U3JmSXVGTjUr?=
 =?utf-8?B?YnBJRkc1ODd5ZXJSQnNKbmU4WXh5Q0w2VUp0ZmxJTklEZVBYYnNwdldPbEFD?=
 =?utf-8?B?dytRMzRBYTZEMU95RVpjSkJNRmdWcWZSdXZ6anVvWUFTL1RwejhJTGljRFZI?=
 =?utf-8?B?UzFYY3ZEc1VOVDhjamhFOEhIM1J5WDE4b3VLUXVoQjhFbjc2ODRCdDFjUnRm?=
 =?utf-8?B?cmlOcXdTN0NTMndhUzdwR3ZsbWtyZXZWRVpHNVdQRUNLSThsUkpYNFRvUVBB?=
 =?utf-8?B?YmpRNkhKd1BkRlhUaFhwc2RMZTZYR3lCN1ExVDc0MFMxVlpOaWIvNE44WXIx?=
 =?utf-8?B?S2ZzNUhka0Vxb29ud0J5c1pSdGVieGtTeTBtM0RRcHRvbTN6UVlSSUU1a0lx?=
 =?utf-8?B?WFIvL3dEUktBalhFOVpnaFh0bUFQRTBDbWVlV2J3cjFVRWJpVmx0bStyU28x?=
 =?utf-8?B?QUczeCtYWWdndW5SY2JDU0hwUW5PSXF1YzZlRXpiQk0xNVg2NFJITko0UWZa?=
 =?utf-8?B?eG9jQVNydEF3dFJBWk5HY0ZsN2lqcDVtRHgxd3RjNDhzekF0ajIzLzkrZGtq?=
 =?utf-8?Q?3piUrW2HDDimNvgqJQzVx3gvAtSsMju5PwXYt7L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a32cdd8-a8a6-4dc0-915a-08d92f2afc07
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 11:53:11.5610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GL8MW9jf/jkJ4ex3vGTAeiC8eoc38+Q29j/rQjJSJciOigfTFER+8cHqyeWzYbw6U0wUtVFXiP/E3LVj9kNf7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 14.06.2021 13:15, Igor Druzhinin wrote:
> Hi, Boris, Stephen, Roger,
> 
> We have stress tested recent changes on staging-4.13 which includes a
> backport of the subject. Since the backport is identical to the
> master branch and all of the pre-reqs are in place - we have no reason
> to believe the issue is not the same on master.
> 
> Here is what we got by running heavy stress testing including multiple
> repeated VM lifecycle operations with storage and network load:
> 
> 
> Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
> ----[ Xen-4.13.3-10.7-d  x86_64  debug=y   Not tainted ]----
> CPU:    17
> RIP:    e008:[<ffff82d080246b65>] common/timer.c#active_timer+0xc/0x1b
> RFLAGS: 0000000000010046   CONTEXT: hypervisor (d675v0)
> rax: 0000000000000000   rbx: ffff83137a8ed300   rcx: 0000000000000000
> rdx: ffff83303fff7fff   rsi: ffff83303fff2549   rdi: ffff83137a8ed300
> rbp: ffff83303fff7cf8   rsp: ffff83303fff7cf8   r8:  0000000000000001
> r9:  0000000000000000   r10: 0000000000000011   r11: 0000168b0cc08083
> r12: 0000000000000000   r13: ffff82d0805cf300   r14: ffff82d0805cf300
> r15: 0000000000000292   cr0: 0000000080050033   cr4: 00000000000426e0
> cr3: 00000013c1a32000   cr2: 0000000000000000
> fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> Xen code around <ffff82d080246b65> (common/timer.c#active_timer+0xc/0x1b):
>   0f b6 47 2a 84 c0 75 02 <0f> 0b 3c 04 76 02 0f 0b 3c 02 0f 97 c0 5d c3 55
> Xen stack trace from rsp=ffff83303fff7cf8:
>     ffff83303fff7d48 ffff82d0802479f1 0000168b0192b846 ffff83137a8ed328
>     000000001d0776eb ffff83137a8ed2c0 ffff83133ee47568 ffff83133ee47000
>     ffff83133ee47560 ffff832b1a0cd000 ffff83303fff7d78 ffff82d08031e74e
>     ffff83102d898000 ffff83133ee47000 ffff83102db8d000 0000000000000011
>     ffff83303fff7dc8 ffff82d08027df19 0000000000000000 ffff83133ee47060
>     ffff82d0805d0088 ffff83102d898000 ffff83133ee47000 0000000000000011
>     0000000000000001 0000000000000011 ffff83303fff7e08 ffff82d0802414e0
>     ffff83303fff7df8 0000168b0192b846 ffff83102d8a4660 0000168b0192b846
>     ffff83102d8a4720 0000000000000011 ffff83303fff7ea8 ffff82d080241d6c
>     ffff83133ee47000 ffff831244137a50 ffff83303fff7e48 ffff82d08031b5b8
>     ffff83133ee47000 ffff832b1a0cd000 ffff83303fff7e68 ffff82d080312b65
>     ffff83133ee47000 0000000000000000 ffff83303fff7ee8 ffff83102d8a4678
>     ffff83303fff7ee8 ffff82d0805d6380 ffff82d0805d5b00 ffffffffffffffff
>     ffff83303fff7fff 0000000000000000 ffff83303fff7ed8 ffff82d0802431f5
>     ffff83133ee47000 0000000000000000 0000000000000000 0000000000000000
>     ffff83303fff7ee8 ffff82d08024324a 00007ccfc00080e7 ffff82d08033930b
>     ffffffffb0ebd5a0 000000000000000d 0000000000000062 0000000000000097
>     000000000000001e 000000000000001f ffffffffb0ebd5ad 0000000000000000
>     0000000000000005 000000000003d91d 0000000000000000 0000000000000000
>     00000000000003d5 000000000000001e 0000000000000000 0000beef0000beef
> Xen call trace:
>     [<ffff82d080246b65>] R common/timer.c#active_timer+0xc/0x1b
>     [<ffff82d0802479f1>] F stop_timer+0xf5/0x188
>     [<ffff82d08031e74e>] F pt_save_timer+0x45/0x8a
>     [<ffff82d08027df19>] F context_switch+0xf9/0xee0
>     [<ffff82d0802414e0>] F common/schedule.c#sched_context_switch+0x146/0x151
>     [<ffff82d080241d6c>] F common/schedule.c#schedule+0x28a/0x299
>     [<ffff82d0802431f5>] F common/softirq.c#__do_softirq+0x85/0x90
>     [<ffff82d08024324a>] F do_softirq+0x13/0x15
>     [<ffff82d08033930b>] F vmx_asm_do_vmentry+0x2b/0x30
> 
> ****************************************
> Panic on CPU 17:
> Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
> ****************************************

Since this suggests a timer was found on the list without ever having been
initialized, I've spotted a case where this indeed could now happen. Could
you give the patch below a try?

Jan

x86/vpt: fully init timers before putting onto list

With pt_vcpu_lock() no longer acquiring the pt_migrate lock, parties
iterating the list and acting on the timers of the list entries will no
longer be kept from entering their loops by create_periodic_time()'s
holding of that lock. Therefore at least init_timer() needs calling
ahead of list insertion, but keep this and set_timer() together.

Fixes: 8113b02f0bf8 ("x86/vpt: do not take pt_migrate rwlock in some cases")
Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/xen/arch/x86/hvm/vpt.c
+++ unstable/xen/arch/x86/hvm/vpt.c
@@ -554,14 +554,14 @@ void create_periodic_time(
     pt->cb = cb;
     pt->priv = data;
 
+    init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
+    set_timer(&pt->timer, pt->scheduled);
+
     pt_vcpu_lock(v);
     pt->on_list = 1;
     list_add(&pt->list, &v->arch.hvm.tm_list);
     pt_vcpu_unlock(v);
 
-    init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
-    set_timer(&pt->timer, pt->scheduled);
-
     write_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
 }
 


