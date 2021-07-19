Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D67A3CCE26
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 08:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158076.291218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5NDS-0005hj-Vg; Mon, 19 Jul 2021 06:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158076.291218; Mon, 19 Jul 2021 06:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5NDS-0005fD-Sg; Mon, 19 Jul 2021 06:57:26 +0000
Received: by outflank-mailman (input) for mailman id 158076;
 Mon, 19 Jul 2021 06:57:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5NDS-0005f7-0R
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 06:57:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfb15152-ff48-4bf3-b62c-6f2b49aba3f3;
 Mon, 19 Jul 2021 06:57:24 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-tpQwcJvZNtmZNvdQmIm_Jw-1; Mon, 19 Jul 2021 08:57:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 06:57:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:57:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0103.eurprd04.prod.outlook.com (2603:10a6:208:be::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 06:57:20 +0000
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
X-Inumbo-ID: bfb15152-ff48-4bf3-b62c-6f2b49aba3f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626677843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fsOJPk43X+/SkGFLXa5zYu8a4ypDo/757j3yAEj0ocI=;
	b=MIvE8ig5w2mgmuqqqvoT31iuBH3wo3fcMPpY5DEJVGP3cio4YkFSMKI5YfdhofsoaKvSKo
	gCY6kxf/pymZsmGjzPkzk2XT/waSuix3B6mWlzy5TGpCNZD2thkKlrfW8xBmqcUIB4A+mW
	M+k+u//7Mas7x3K0U8PzRaPHN9AVcqA=
X-MC-Unique: tpQwcJvZNtmZNvdQmIm_Jw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhIDPtIHK5E4MIq+Hl3ksn34A/bbvcx7BJM5zms4hK7aagINv9YxWD4TRlwoBsvdrM4U+1XEId6ppMT7tspWl++N8RDF7DU9FhRrJ8uRfgvzkbe9JPxIymkj+C4xK0EIZt+09+ne9csJaN9SPtnE/vdODdx27cPdkSVJi/ZITrY3dK6PfR2soQ5TetPwWZQRv34kAGr1BpQH6Fky89WwCH89MlZzXdSWUt31FlZW11lmHQzu2MbVc1uG6evy9fLDE8fEpWH8fxPmIhd4JGsj7BgZ1fGTqe3xy1PaWTbOp+n2Gbu/J0I72XZFhETGpJyvf54I33Qpa3jdqna0kHUg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsOJPk43X+/SkGFLXa5zYu8a4ypDo/757j3yAEj0ocI=;
 b=mqG8URYZVQ4Y1hq+sfRPnEB+5KMTKx/5EIHhLSbt0kGEi9BkjvPSJkVR8Gnmlsg/cAAiHeFtBK3FvYKa6vLL4qhiVTknrtMrJtAwlvrD5xuEqBP6n69yK/wrAgL8L7fOPl07rkFUt03M4LBBnW7DwDB9F2H91GX+A4dQkI7ANvn/6rvn9JNM3hXtXFE/mAAxt1vKOQ9Av1CYzzUCaS8pzwZ5GiHIszOkbwHdI/TkNM86+lNiH25ZaUjdYE4ZISHdiN/wqwr8Q/dIFnXcAlWle5vB3hulIwXnPf02HH4hmLlG437Eb++oLgoKf7azZDEvx4/7YGji943YONeVbgy4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2] SUPPORT.md: add Dom0less as Supported
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, iwj@xenproject.org, wl@xen.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien@xen.org>
References: <20210714234809.30483-1-sstabellini@kernel.org>
 <04d06f53-4489-1a08-e744-fa36679a2287@xen.org>
 <alpine.DEB.2.21.2107161326040.3916@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e511019-e9cf-dbf3-3c76-0391b8e4d2ed@suse.com>
Date: Mon, 19 Jul 2021 08:57:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <alpine.DEB.2.21.2107161326040.3916@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0103.eurprd04.prod.outlook.com
 (2603:10a6:208:be::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89e138b8-0be5-46fb-ebce-08d94a82747b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5902C07CBF073C58D8A0CB1BB3E19@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QF3r+bnumkmMUEvo9gUFNOFuaTHC/0QfEgDomkdRqJvV62w32fV6O/GemEjOAxsYCI/NhEPRp/12YXCKkPEwNnKW3eE3LpbSA/kyeukmCN4S5HTC7km6WswZDDUOWgOLHlxPcQmWGO1WAoM1AcOPeTzxxZsx+8O8rbppffW16c3HiXm2xdmOkZwRn8I8t6ioXFh468sy0DkUlpkBdi/Ijnd0ONft0WH8HlRyOF5H4Nd/Qbk395QTn9yeQT3wtmmWB51jYSytwUiIbLm5C4ApJwcM0fmDMwOEZO30To9VR4QlXmii7kr+Y7CWtl0w9KXun7ByGDnx5akfj9EObI9UrYVjs9tqfdnOTK7iBggRGfJU1uOhpM73jZ0VQbENuuyaKxcDaoYoLpF5quYm9EFFHiVak51doJ0lWovWzQMqEhZ3ZGdYrCfwQQ+wiPRW8jKZt2YAnkWMldU2gbvmb59Ojsq+W2IzSyXoggKZUza9EDqQpSifrRPjYL1dnpSqwuSXfTOv/njrfAMD7yhVRBGAdx/+bUebk1HxdJPE7n0Lg15COPXKxKaFZMXGvO7mIa5hpCHdU3c2VzswpiHBZ6hQBBbPaI6vBOiKyeQ7i6WaroLrYrUNLde/MMnAIMtDtUOExT36jx4oFUCY1WYnRJCV5+97e6i00tU3ynln/faThnuO7EXMjdukfOIOoUYbah5pUhkw21XPTjPHZYIY6QmWBKURjkZwThZMX1ezoHx/KyuLiRSp5co+Y9VTJ3mz9I0BgAgSVr0HjZl5DVwP0XVjMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(39860400002)(346002)(376002)(31686004)(36756003)(86362001)(5660300002)(53546011)(8676002)(316002)(8936002)(66476007)(31696002)(4326008)(83380400001)(66946007)(66556008)(16576012)(6916009)(38100700002)(956004)(54906003)(6486002)(478600001)(186003)(2906002)(26005)(2616005)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WERWcHJvcXVhajlPYTUyemhMUTlxR0oyemI1YzJqbG5DUUJMdStUVkZGZm5l?=
 =?utf-8?B?Y2ZhZ2dWQ0dXNFhoTHlYN01NV3E2OVlsNTNvV1JPZUUyZlRJTzdhbmJTUFdp?=
 =?utf-8?B?S0RBL1FnYWk1YlZROC9aVlJoeS82dHZLYXJzMWVZMXZpVHlySjhXNjVteDQ1?=
 =?utf-8?B?UEVnMEVSSW1Ec0VKNFBFMFRDanR5NGdRclp4Z0lPdVlaV0FsaHdRbFRGQ1FP?=
 =?utf-8?B?dm43OVVnYVBEMURqZ3hxcW1OQVlyTnJuNUUzdnNTM1EyNG1uZHZGZEg2Z2pI?=
 =?utf-8?B?a3FWQUpsdVBCb2gveDNrYTNzamRtT0E1RHZ0emYybXpIaEl1blkyVEFLcGxI?=
 =?utf-8?B?ZlpxSkQvd1NwVlNqSFBmcE1YL3pGU0Q3UWdreEVkZXpIT3cyRDRicWxWb0tE?=
 =?utf-8?B?bTlsTTFteFVFUW1MVVdzczlWUER2K1R3eUtHRzdIMEcwWFJ3UGJpQkVzV2to?=
 =?utf-8?B?N0dVUEc2dTE1eGlPa1kwZFRIQ1duc1FHeE4zV0RzcGhTcHBsYVNNV3VwNjhF?=
 =?utf-8?B?R3RxM05MT1pQWlRYaFJueDB0Z1ByLzJLMVd5b2pQRThuTG9zVEFVdTJ6M1lu?=
 =?utf-8?B?c3kvclZFZy85SS82TEZRY2dKUnVabTJEdE1mNjNla1ZCbXEvYW9VV0dENXlr?=
 =?utf-8?B?eVVkc2FvYVd0NW1VaE1PNXoxcVp4bGdWYWFaK2ErYlBmeTNrSTdhUE1wNEh5?=
 =?utf-8?B?NUxYTURrS2M5SEFxNi8vbXQ5dWpOZGthMjZWMkFhZ0lHNWo3QlJCZkdoYW55?=
 =?utf-8?B?djFvL3Y5UnlQT25Dcm1mVm5mRHdRQjFnS1VZbnZybXBhS3MxeERCeGxpTWRz?=
 =?utf-8?B?a3JxSlVUSUM0UUxyS1h5c3NxQ3dYTUxXR3orYXQ4d2xWbE44b1ZydUgvVUts?=
 =?utf-8?B?aUpCMXl0QUtEcEdUek1Hd2xYbFk5ejB5Y3FNZmhzTkdNTmM5ZkliVFlLZllN?=
 =?utf-8?B?dDlPU0pQa1A5VDRMZXNmUk1XU3hrMGI0bnhxZDJSTTVHbHJqdE50WkNCVDhD?=
 =?utf-8?B?WjNHTXZTRHdraHJSZnFOMFZXSHFxeUdBenZCZWVWUVN6OUNqdlhaa3lDM1hW?=
 =?utf-8?B?MWd5ODdMVGxuc0dFcHhYeit0L2JpZEZtTENmZWNZQ3ZsM2hwT0NEbCtKaWhR?=
 =?utf-8?B?bEZKNFZxMFBXSm1mQW9KUDUyd1RzNVVMYjBtVXNleGZmWHFWc1E1eVUvMnV4?=
 =?utf-8?B?Q3hSTWJkaUIxeVBwU20wcEhyTnBsR2JvSlNhandqbVZCVUpaZ1BHWVY2RTVi?=
 =?utf-8?B?c3JiaTZiUTU0T3AyVHljL1dNRmhHSUM4bUJiNm84QmhJdWtvNG03Z0R3eVlK?=
 =?utf-8?B?YVBMSW1OOVJIOTlFZlJwOHBSQUxYTUlrZHFYMUN3Q3lEOERLWEN2QVhmSStT?=
 =?utf-8?B?UGxiL1dYNmRWZmxiNGVrSlVCOUxDK3U0U3E1akZ2Y0JwU1V5K1Y2K1UyeUF6?=
 =?utf-8?B?d0lnbkRwTW9oN1liVTF3T3Ixbjh1UExjcVRpN3NuWDZ1dEVqT0t4S2RkZklD?=
 =?utf-8?B?amdXVnRHc2ZFZUJocDFKR3ZyTXVDY1dUUCswYlNyL1B4Z2RIODBmVVIrVmc3?=
 =?utf-8?B?QzVpQURndGhRWWtMTkdCY0JZL1p6a2RCYmpETmZ2Um1NOGtyUjFlV3VtcU9j?=
 =?utf-8?B?OHRrY21PQ1h1V0RMK2p1NUFMQitaTXozZUUyL2M2Qy81bERXYnFOaHFodDVG?=
 =?utf-8?B?THA1M0ptVWxxcFl6UlBGcGpaNEZTWUd2bk13dUNQeWdZMG9JbTBUcEZJZVFh?=
 =?utf-8?Q?+PqC210ZI0vFLblXesWcZMDeENU8aJJzftlKzQQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e138b8-0be5-46fb-ebce-08d94a82747b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:57:21.1587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpwaDzX2C6CQO6/DHBXxcLdm+GNd170XOLNXo/JsjTKz2FzIwc6XiR8CePzRwZBoGWyJByre42Hen2HVpecC5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 16.07.2021 22:29, Stefano Stabellini wrote:
> On Thu, 15 Jul 2021, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 15/07/2021 00:48, Stefano Stabellini wrote:
>>> Add Dom0less to SUPPORT.md to clarify its support status. The feature is
>>> mature enough and small enough to make it security supported.
>>
>> I would suggest to explain the restriction in the commit message (and give a
>> link to XSA-372 commit).
>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> ---
>>> Changes in v2:
>>> - clarify memory scrubbing
>>> ---
>>>   SUPPORT.md | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>> index 317392d8f3..524cab9c8d 100644
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -832,6 +832,15 @@ OVMF firmware implements the UEFI boot protocol.
>>>         Status, qemu-xen: Supported
>>>   +## Dom0less
>>> +
>>> +Guest creation from the hypervisor at boot without Dom0 intervention.
>>> +
>>> +    Status, ARM: Supported
>>> +
>>> +Memory of dom0less DomUs is not scrubbed at boot (even with
>>> +bootscrub=on); no XSAs will be issues due to unscrubbed memory.
>>
>> The memory will not be scrubbed for bootscrub=on and bootscrub=off. However,
>> it should be scrubbed for bootscrub=idle (the default).
> 
> With bootscrub=idle, do you know if it is guaranteed to complete the
> scrubbing before dom0less domUs start? I assumed it wasn't guaranteed,
> but if it is, then we should rephrase the statement.

Idle scrubbing never touches pages already owned by a domain. Hence the
question isn't whether scrubbing happens before these DomU-s start, but
whether they have their memory scrubbed before or while being allocated /
assigned to them. init_heap_pages() has

    if ( system_state < SYS_STATE_active && opt_bootscrub == BOOTSCRUB_IDLE )
        idle_scrub = true;

i.e. all memory given to the page allocator early enough will be _marked_
for scrubbing. If idle scrubbing didn't make it far enough,
alloc_heap_pages() will recognize this and scrub the page(s) synchronously
(of course unless passed MEMF_no_scrub).

Jan


