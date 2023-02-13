Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1426694394
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 11:56:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494353.764392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWUp-0007yz-5u; Mon, 13 Feb 2023 10:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494353.764392; Mon, 13 Feb 2023 10:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWUp-0007vc-2Y; Mon, 13 Feb 2023 10:55:43 +0000
Received: by outflank-mailman (input) for mailman id 494353;
 Mon, 13 Feb 2023 10:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRWUn-0007vU-K3
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 10:55:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3bfd6ee-ab8c-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 11:55:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 10:55:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 10:55:10 +0000
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
X-Inumbo-ID: f3bfd6ee-ab8c-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh9UaLaLxYbaYoqVLGt6mSxKHZNUa8T0T8THiBT8PZYauGWQ3vgORfoXk6TJAWAJNBKmlbt83m6uZFSZK5H87p/l1hwUVCZFgguw5MJJi+ili36Kkm5GzG5lJwaYtLsLw0aemHj1sCByX4Ovb0VsAg5IVicOP2qmvNjThjavjiNmfIAuIoRdcLwbG34VlcaobUoJTgEQ8+Yh4uMVMQGzLngFOdDvsvTxgsrOXSqmVajrCp4ksCiUxf48G27eHe4bo5N97nDjOZtSxPVdXO6erJ8GCzmnRFthWidEC0BXwkuLe97auwGrDTYO+v0Mq+4Z0XUmwWGSuI9/m5hc7hAA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3iKdFNPxYhhVdd3DtbkCxa+1wmF8o+QpB/l21Dqtx4=;
 b=QtvKjgXpCUupy+T62thztxv0KXsr5jtYLLr7BRan/60ibMDqZn/tDEfLyWQE3GxZnM7bw9xjeonF44x/Y7RqZVXS4MDfkvvTi0LIAhFx8xDSbsK+360La463YEkzx2LBJBsD2un/duJmxwQjOmlKFKQvLTCOY3BCK8qfCYMwFebNB1I3ntYFgWJIaQFPUPiGwfN8XYTgsHcdj2rOSDtw5yjBYfrIS3+TK/ctsMkUC1IhjPQ0vIwKOgmHXtskQggWTZ1PZS+erPXSbM4yba6SUU6j3Jzfl5le1EIvC5XVELnKsQ9Eg+WWCwiOGZtgR5qLvHCh5ogktm+5nry8qZJgFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3iKdFNPxYhhVdd3DtbkCxa+1wmF8o+QpB/l21Dqtx4=;
 b=Ka7kKuO9Q6eF4qMojIEsyXTgrWMkQ6JpB1JIBi10HEehK9mRhcSFfzmqpmxUdrWB0tHZXIsGSz0UWL88QCUh0qCkrJ5oUgGGy+PsJ8wkqqProEvdCINVi1K8AnPaZOFmGd6eWxiUtIc9aKGghkK1XVzyBjahT57xftiI2SM/oSoQG9Ic0YOGa6wmV73rcBLyOEQoj6YavVp20+U3mn6esKxGBYm3K4IhiIlGKIe+u/RDsPfX7p2fl31QITsnDu/lbW12RY7e0pFdQ7sqyPO/F3ai45ybUyBMxCyxVqmsV0+ZnIKYaXKDU4K3T+kufmLpH5C1RUYTzEIgti3+7fv6Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ba2d7d5f-fea0-b267-c1ef-2988e3c6990d@suse.com>
Date: Mon, 13 Feb 2023 11:55:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Ping: [PATCH] Argo: don't obtain excess page references
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f9cd7b84-6f51-d797-cd2a-b9c9bc62b0f6@suse.com>
 <d03dc8b3-4c1f-2db0-4d97-944972dc6e06@suse.com>
 <CACMJ4GbUjLczb9ru_QUERGaNCModspnqgGwAgCqUN+oZ_90NDA@mail.gmail.com>
 <44118a7a-3ef6-e984-babb-f5b75e5e53a2@suse.com>
In-Reply-To: <44118a7a-3ef6-e984-babb-f5b75e5e53a2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 942dca22-fd0c-4fed-77a7-08db0db0c6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KTmBfepsYxohbnnsT0QPnGxWa6PhplbQmNMydWte0tjM2twsa7Iq29xmDJ/ewSrToDEC829p1C7JYMkAuUACCtOEM8t8tVfAFClxo77fUk/IYSZl/cPvTBAulqwkCBnVakoMmal9fHrSYsUYFuFKjqzY5Kg3rrjJJur7umcS0peQfUT1cx3xE9UMfdGzOwJZ40OVzmgaCgEjWNbhEWcTsHhQdmS2l3QnHb2Qn/rm4AJ9C8SOZbdhwnIgxStgOd80Wh9aAYznQp81tjDiBelA11j7RoLvFw1gTAYTuKxn9SfVnYtGu3xq2xi2XwhYbLeRO89FMBnXLAqDyc0h/SR5gDZhzYzAi0jbL72WqMs1Cdj24kq3SofPLm7rNLzCVmZTR2F0hGcKFNVSrFTt0b/KIpkHAlyllNywMBn1NRPy/OOk+tRrXIwJt5UlugE0wk6juoQYZRY1pN6znCD9AWOO1x7XZ0oEo70+vOZjmtw1IDWfOi3S8/g7N5rzTm0Vg9xnQM6gF2Bw194OLNvvVkTUnOC4MqluY0aydNnmFtErc6vzXbTTHnBTQ4+m5R/tsjKpx4VP8qzi5s8ShdgNRIdnt5tv4gqfutWZL1Q3yuP7ukiVRoU+9wB/Ox6ImiYrfI/DnRU7+wxEknQ9eywcqZwvHyYYAjyYHLUfTNwxYll17I3TGERzXn2Jm06/qyVIKys4gO2zzXH6dJGH5obPNx86IuDsI5wklf9k4joTFldPOdY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39850400004)(136003)(396003)(376002)(366004)(451199018)(8936002)(41300700001)(36756003)(2906002)(38100700002)(5660300002)(83380400001)(26005)(66556008)(86362001)(6512007)(186003)(478600001)(31686004)(6506007)(53546011)(6486002)(31696002)(66946007)(66476007)(2616005)(8676002)(6916009)(316002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzNScllsMmwvcURlbU5qaXhGMUpGeGNBY0RKOWlBTkNwaDl4K0JaWkd6Q3ln?=
 =?utf-8?B?clVUUjJwc3p4YytvTVNlV2VwUzRzOGhERTRzYW8ya1JmR3ZmNVlISHh6a01y?=
 =?utf-8?B?aXZ6L0RXL0RpTGFSVjJYaWd1UWlWR0FycW0wL1l6ZndqWHNjRkM4cUZaYzUz?=
 =?utf-8?B?ZXRpVXprVWYwdTRqQ1laRVI0dWdFM0Fod2dJMHAxNkRZWnM3RWxjYkRxVUJl?=
 =?utf-8?B?aXMwQXRhVVFXUzFudlg3MG12ZDQwd0JNSUZKMm5xMVlsTUkrYWlqQXd5RXc0?=
 =?utf-8?B?WFJ6R3VaVHE0Ry8rYStVME82ZE5EVHNjZkdMWWtjYlo5Ynd1b00yQ3dOWDZ5?=
 =?utf-8?B?d2pvd3hNakJIT3NhaW54YjVDQWtpa095ajNxcStpMUJkcmdVRlVTenY3Ri9M?=
 =?utf-8?B?d2Z2aGZ4ci9iaU40cFhtemZ3UWNhdXlYWWNDMnR4YUZxRlVFYUdPcGt6VjJS?=
 =?utf-8?B?NEpQbzJYN2c3dFYxN3dMRVgyYmczR041MmdnbEQvRXBQSURrYmRWNFF4b3pK?=
 =?utf-8?B?SDZ6ZEpCNGJuZVBmTzR3QWQ4eHV5eTZBZHJVK1dHUWdjNmlFeHFYMTcxTnBn?=
 =?utf-8?B?aFZBb2JzN1pwQUxzMkxHNVhQTEppVGdsN1NSckxMMjJkQ3B6YmkwL2dnanpq?=
 =?utf-8?B?dUp3SGpyTXR5QmZkayt0TkZUMFJ4RFZUcThEZzRDS2h0V3BMKzRjUEFLM3ZB?=
 =?utf-8?B?OHd4aEU0NXVHcjU1Q215V1JRa1piMWhsSHp3OW9VV1JpM2wyOU1TRGhpSXI1?=
 =?utf-8?B?SnlyRFoyY0Z6SDBFZG1wMUUrZmtucDY4cEtSeUd4ekpoNUxxVERESTZJdVZs?=
 =?utf-8?B?aFhMYlg2UEUvZEVZamg2a3NEeEJxc2lrTDVQdzBFbGVSV1ZpMUUwUWxSckNn?=
 =?utf-8?B?akF6Y1c4Y1A2d3JwTno4VnJ1anMvWkpjMDYzQ2NWdDY4WFIwa1V1dStoRzBL?=
 =?utf-8?B?bWhWZ296b2FYTWI2SVcvY2V3YU1ncDkwTXpIWFBZLzhnaTBlUERwK2kxUEtK?=
 =?utf-8?B?S2V5S0ZxUlZwTE1uYmI4ZXdiSTNidzEwYnlGQzNjck5Od3ZYTW16YldGL1hi?=
 =?utf-8?B?akR6ZFhhaGtSVTBjT1V5MUI1YU9POXJOMTNBZmZOUGc2eGYrbGYwZWRVMks4?=
 =?utf-8?B?Qm9vbmNEVlN3cVhURmovYW1xbDBJSjk1Rlh3Wm1kNUc3UU5OUjBOb2wxbndN?=
 =?utf-8?B?YkJxTENiQTk1dmpQcE1yTkcwZW9QNUFnVFZPbTNDajR4VnlMNEZqV0lmVE0v?=
 =?utf-8?B?UlZsOCtrbDB2cElkUFdtSnJDYlczc01IZUxpZGFuczhsYnluUE9waWxzQk1O?=
 =?utf-8?B?VTNyYUZVUFZKM2doeGYvRGY5ditSNFNBcUpwTXI2eHhFS05Wam9mK3hXMDI3?=
 =?utf-8?B?SXRFV3VEOWV1Y0czTmNLMzJvcVFGY0wra1dNMEJTVWZsTUFpMWJXd2hSd3M5?=
 =?utf-8?B?NzBrNXpiWDQzZTAvejVoUkdWR3pQcWVpcEoyemtIakRCOEh2UkMrWDJUWk1K?=
 =?utf-8?B?ZFhVMUxEM2FzaEE5M1pyUEtZL01nYVhWc0FuMHN2UjJIMXpZaHNtOUExZExx?=
 =?utf-8?B?YjdLZ1o2UEVtNjRXS1RkdkUzUktCYkRUai9ZYmVjSEtNcGk4VzkxSmFLVXho?=
 =?utf-8?B?eUZQNXo5ZklGS2lwanRJUndZV2Q1NVh3cnFYdWtCTWgyTWlSL3FLVndaM2pO?=
 =?utf-8?B?VFkvQTltL2VJVE9sZ0NWaGZ4ZDVISkVnOURLWWNPdzRTQW5aMkE4VGFvOXk1?=
 =?utf-8?B?Nno3T1dsbkgzbG92YXlvVXBaL2dSS3lqWGpPUkl0Ky9wY0ovcjBlNmJOYkpV?=
 =?utf-8?B?bkQ2VDZlOGJtUDR4MmpsdkJ5Y200VXBPQytVWDgyWXc3ZXZKOExiajArOEYv?=
 =?utf-8?B?bzFISVpPSmJoMEpneWdHa1FUWkFhc1NNT001U3hhS1prdnVjdlNZR3FGcXlT?=
 =?utf-8?B?dno0QlZaYjhuNEQyZXpNQ21FNCs4V0xWanN0blJYSXZPRXl4Vjk0aDIwVGNx?=
 =?utf-8?B?azVHOUZuNEpQSDlPK2w1cXhGeHI2V0NENEJxR0haU2dzaUxPVk03MjdUSlVK?=
 =?utf-8?B?TlNpWXd0aTNDVjNIM3FOamxucXhidGpOck5CTzN4d1oyeFZoNzBXSEhiWkd2?=
 =?utf-8?Q?1a3WVhJ5m0f3XmoZXMSDM90Zu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942dca22-fd0c-4fed-77a7-08db0db0c6ac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 10:55:10.2903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seyaQ/0YeAALkAM7Mue6JdV0zRq1b80I0VqFNYQdhP822exQRtYYuo2f/5UcYommOdAAIQaBgBpta5LokrII2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077

On 30.01.2023 09:03, Jan Beulich wrote:
> On 30.01.2023 05:35, Christopher Clark wrote:
>> On Mon, Nov 21, 2022 at 4:41 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>>> On 11.10.2022 11:28, Jan Beulich wrote:
>>>> find_ring_mfn() already holds a page reference when trying to obtain a
>>>> writable type reference. We shouldn't make assumptions on the general
>>>> reference count limit being effectively "infinity". Obtain merely a type
>>>> ref, re-using the general ref by only dropping the previously acquired
>>>> one in the case of an error.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Ping?
>>
>> Sorry it has taken me so long to review this patch and thank-you for
>> posting it. The points raised are helpful.
>>
>> Wrt to the patch - I can't ack because:
>> the general ref that is already held is from the page owner, and it may
>> actually be foreign; so the second ref acquire is currently ensuring that
>> it is a match for the owner of the ring. That needs addressing.
> 
> I'm afraid I may not understand your reply: Are you saying there's something
> wrong with the change? Or are you saying there's something wrong that merely
> becomes apparent due to the change? Or yet something else?

And to extend on the questions: What notion of "foreign" are you referring
to here? The earlier check_get_page_from_gfn() is passed the very same
domain. And anyway, get_page() wouldn't allow to acquire a ref with a
domain other than the page owner. Plus the sole caller of find_ring_mfns()
passes currd.

Jan

