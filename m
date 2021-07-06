Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E443BD98E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 17:10:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151443.279890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0miL-0003mG-6o; Tue, 06 Jul 2021 15:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151443.279890; Tue, 06 Jul 2021 15:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0miL-0003kL-3Q; Tue, 06 Jul 2021 15:10:21 +0000
Received: by outflank-mailman (input) for mailman id 151443;
 Tue, 06 Jul 2021 15:10:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0miK-0003j4-3i
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 15:10:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 463cfedc-de6c-11eb-84a4-12813bfff9fa;
 Tue, 06 Jul 2021 15:10:18 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-a73sGQ4tPGe0nWUPRMxuuQ-1;
 Tue, 06 Jul 2021 17:10:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 15:10:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 15:10:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0100.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Tue, 6 Jul 2021 15:10:13 +0000
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
X-Inumbo-ID: 463cfedc-de6c-11eb-84a4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625584217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vMTxia+wYFkk0gt7axk38Mr1H+q4GPh0gEg8vPu5r/8=;
	b=TMb7Cymw96kHJRoOkUJAqIUPb9YsPVGIzj8vw1FTpoqxU7WkcMwhARt2UCt3B8vep9ws6X
	+lo8UUOXhv5+TmsvnV20Zvnn17J4K74QfLdvXlh/VHBwVetP30pcjGkC8skqWhtcxMlGCx
	IZyXVWX46v4q5QGxBsxeQ7u6Xg2eZoY=
X-MC-Unique: a73sGQ4tPGe0nWUPRMxuuQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxEHuCZNMQY3nBmKqRCCb1n3/NfLO6cDdLffqCIMc6ftbTtRUKSc0ldj16P9zsKTxI7s9T18yGa0lpEmukghSmvUKR+YDbP+aMVPH1Czg/KZC4yY4F4rguqNv8znNw+NAZxY/NG19Iz4tUjqEkOH5zkEKnEomogY2WsqbWtc2yVzbVpxMVTqCBsw0BMGE7hpvJU27GW5YKn/zRSzNoI83Emnf9pDvdYjtpnSLfCE1kiOj78iWTZLPcs+H1zNCnV4sSZUjI9tbSO+sZjqwYJ/RprBXpf6XSbq6x42E7OUXmPGOWMwpGQEHH9sn2foZiPegE8xd3CtjZaBaA0J3NI/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMTxia+wYFkk0gt7axk38Mr1H+q4GPh0gEg8vPu5r/8=;
 b=hdto3jhsGi94ef4dNK/Y0CHyaiEg/vbABvF5YgBooW1wP7KQdKiPQhjxe2UK/wCP5aFEKXV0XY1RODwbvblbS9T54vAXW6rHCSqBqhTYzv1eIjjd1k9CAN7H2amj4ZG9dOn2UF+hjoXy4ue+xrXCQkNhXZrOIJDcA6ocssUhinZfkDHZTsA+tvg27iwYwUekQqUHc2t68rxTcGc1/MNlO+RGvQ8BZ43dNO51eHKdrgLpK64ooHY/Vvc31Toxzx1eioJlpPaotrQJ3r+cfMHqaQ08C47j6z1lmFHFGk2ql7RrME9PqNEnJdsHI5c33ksMKaalJFZ7Jkca1VqgV+VN/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools/xen-foreign: Update the size for
 vcpu_guest_{core_regs, context}
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, michal.orzel@arm.com, olaf@aepfle.de,
 xen-devel@lists.xenproject.org
References: <20210706132000.29892-1-julien@xen.org>
 <fa29ee07-0231-378b-4f28-07d894b371f5@suse.com>
 <07a19e2c-161c-cb41-1023-f8b6e6a766bc@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <873f5e68-1ff2-1076-1961-a4bc44950fd3@suse.com>
Date: Tue, 6 Jul 2021 17:10:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <07a19e2c-161c-cb41-1023-f8b6e6a766bc@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0100.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e3d7c2d-7e1f-47a7-7b97-08d94090282c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5600E9BF314C481129447622B31B9@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2qa7n6JPBk5gF3C1ZdpjS1NX+b7IfepUME4/IedcMKvLKa7f3sHF5v9UOcglSQvjfXH2FV6zalqgvCa1X+49XL03bNOgxWDuXe/kRM+Y1WAdSRtKmaJ6Qc8YFPVj+i6iiGs4VgbgZYuPHO7NCpRvMo6WQStaDJo8jmtORsf/xTcY3l/usYaVLqbBOU2BdOB9VZbtD9X4GNgbmL36JoJXXhCuqaN6VKQrPfyVHFe1XQE7OznVFmdd0cUFvPSfZFsmLqRWFO98c1CRLRjoIKLiqrClGRX91Y+icKQeYR9O7rDn6Ioj6tenk0Xr/w+scmlim0n7MR0JDTQEJviMrdbRXYnF46SnwJuravubNZOiMAKsCjQcj+xeGWWeOiexLiCndx56sBwN4D7kCHE1r0mB7odKf4I1xmvI5Y8z8Bx8EMR3NSEXbZPJ4ptNeLH2U3fbEE7yTiZmwh1g2ZmLRjPl683BowIzBIRxMjbkFye+K88q5fMrTSaWj5lXRqUIWzkPVdSOgAcucrn00x9wGQUSoeFpFuawT6WPsV8e728p8LIDONXfFVDxMvihe/uEfHZQ54d7oH5axA34MXv/tMozW2EEa4fKpUPztV7+8LLzVYbMPDTlPn0DWhRU7iqEUC+yVQDKQtGFLReVHvKEkmcr3nbV5n+00zKho9Ay2ewpj+2NFiPUYsUO3uiprnNrEMVtG4bGyZdkHyGOb3ELxqonAspN+Of49niwvS5JNkt4368=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(136003)(376002)(366004)(346002)(478600001)(38100700002)(66946007)(5660300002)(956004)(66556008)(2616005)(66476007)(15650500001)(186003)(8676002)(31686004)(36756003)(26005)(6486002)(8936002)(2906002)(6916009)(4326008)(31696002)(83380400001)(53546011)(86362001)(54906003)(16576012)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wktsdmp5c3FjRUlWNk5aVlVVR3RGWjBrYmI2R0doY1FzNStGTkdTRnlPNkpu?=
 =?utf-8?B?VjNNRk1ocXNRcXgzcXhSaUEwYUxJckNjSGU0ZzA0dUdEMlFEY2doNnFkSWZ3?=
 =?utf-8?B?Rm9YT2wzR0VoRHhsTkpjQjc2U21wK1JqZEgvUlFFNzFLODNOWWY4UENIQXFa?=
 =?utf-8?B?RGtVeUFFZlR2MDZSK3NjakFTbWlJMy9MdXpzMGJOTTdDK3VZcUxvaFRYa2F1?=
 =?utf-8?B?enBhQnZqQ3pJQTNVV1J4elZnUGNLbEVVY21vUE9DaGRzNmt3L09XbS9TWHdt?=
 =?utf-8?B?ZnpJZGRwbnI0UU1ENWwxL05jamYvWExobnZqc2JvOGx0SVM5SE0zWDJpbyto?=
 =?utf-8?B?dFM1QzVONEZlbnhBRTU1QW44ZTJyR1d3bW9tMDV1bFcwNTcxWDh3VVdjbHdp?=
 =?utf-8?B?MTU5Q0NFeTNxbXlrMzJ5a1ZIa0l3cmFVOWFOMUZZU2l6dTVBSzg5eWYyZEdK?=
 =?utf-8?B?UkNzTUFNZEE4TDVzRk1jVVVka1pLVjNpdGRKU1JUT1BxaTF4eXpuRFdYK3JR?=
 =?utf-8?B?TXhHYUo2Z2VORGUwVHlPYzdFNThoMEtXTHliTlZBckVxSGRzMGRHOG1IMDR5?=
 =?utf-8?B?Q1V4cVpxS2tqRUxJU2xsMC9oMlNmRVhhVlhPeDF1eUIyeFN1K3ZHSGlpQ1FU?=
 =?utf-8?B?NzRxLzhuNVdMYWhuQTFMdms4YWczR3ZONkRkRzFVc053Vk9seVYrKzJiOEs1?=
 =?utf-8?B?a3JBMEg0VWVBK0poYktXUzhjSzl0WVBqTW5YbmhjdVdaNzZhLzczVHlaRmpD?=
 =?utf-8?B?QjVBZzcyT1lKcDN5OER0cEZ5bkVQeUR1b2xla2NuOFZTQy9ranpVQTZDSGI5?=
 =?utf-8?B?RFFHdVRWSFI0cmlKUWhjdlV0bkZuN1VUK3k3SnR6cEFoYk8xRlI2OU1RWjMr?=
 =?utf-8?B?d2hCK2p2ZkRUaGVpb2JYbjhWMHlqOWY3c1FMMHpvcmJTQXRlWDZxUzRadjl2?=
 =?utf-8?B?SG56VzhBYXdhUGNOcFBOSld5eThpYVFoa3M4VHVhTWVhM3hFNFl2Ny9xbzRl?=
 =?utf-8?B?c01hK2pEWGwvN0REa1VaK3JqQUJ4aDZKVENyTFVUVGtwbVJXT0ptc2FjK3Y2?=
 =?utf-8?B?Rzl0OHJXRjlvaGlqMWtvVE5qVm9JR2JmcnRNamI0SVU4VWZsTTdWUEkwNmF2?=
 =?utf-8?B?SWxVRkViSlMvV0JmU2FaMVE0SEVSNVhjck01emdaTkRtelpiY2FNbkhxa2Z2?=
 =?utf-8?B?eGJ6K3Z6cGxiSmFjbXVPZVJyTGtmbStFYlRVMldMcW53RUduN3J4dVhPa0ZG?=
 =?utf-8?B?WWxXQUFBWTRscW1QREFQbkFTeitoWlBYa2VpVkVNZmZLMUNhM2JRWHRQWUlR?=
 =?utf-8?B?bE13a05UMW5BOXYrVDZCb3F5TlcvS1hZckx2ZWZuZTdxeUFUNjJyaVZWSzJi?=
 =?utf-8?B?SFAvb2ZtQzVYYitUSUtzQ3RYdlhvR3V6NkY1UCtJVFBBYlFaOCtIVUJHN2Fo?=
 =?utf-8?B?RERsRzRnUHB3YXFwRTJqbWM4bWhvZjgxVVpqSGEzOWxNcGNvRmhwY3VuUXY2?=
 =?utf-8?B?N3ZBZmNtbldVeEdNenRwRitsZWV5UE41TGVxSG54WitvSDFvenFTMGowQzE0?=
 =?utf-8?B?VW5Vc0ZrdHFSS3NJc2FGRk1SNUk5UkxSTy83cDJ3VndUN3E3RmR5MlNLZDBx?=
 =?utf-8?B?WER2emVGT2VDTk0vUWM1eFJ6eGhpYnhQSTZ4NW5keE94YWpHbk5VaDZJMUxH?=
 =?utf-8?B?NG8wdzJaS25jR1pDVGJOZlRlUnc1dnpwQ0R6eGtLYzAvaTFwVzZIcXprY3Vo?=
 =?utf-8?Q?S3rBHxIJquOVB7GYdm+g/AdjkrzWcEFyLC49UsU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3d7c2d-7e1f-47a7-7b97-08d94090282c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 15:10:14.4457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1p1AmsEYwhI7bhVch61+5yHPOlKZZZaIo+TZ/sDyDAMhzmXhtnXqAm0GGzluz7wx91In4AgSYfuBF+oGxdfaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

On 06.07.2021 16:24, Julien Grall wrote:
> On 06/07/2021 15:07, Jan Beulich wrote:
>> On 06.07.2021 15:20, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Commit 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to
>>> uint64_t") updated the size of the structure vcpu_guest_core_regs and
>>> indirectly vcpu_guest_context.
>>>
>>> On Arm, the two structures are only accessible to the tools and the
>>> hypervisor (and therefore stable). However, they are still checked
>>
>> I suppose s/stable/not stable/ and ...
>>
>>> by the scripts in tools/include/xen-foreign are not able to understand
>>> that.
>>>
>>> Ideally we should rework the scripts so we don't have to update
>>> the size for non-stable structure. But I don't have limited time
>>
>> ... s/don't/only/ ?
> 
> Yes I will update.
> 
>>
>>> to spend on the issue. So chose the simple solution and update
>>> the size accordingly.
>>>
>>> Note that we need to keep vcpu_guest_core_regs around because
>>> the structure is used by vcpu_guest_context and therefore the
>>> scripts expects the generated header to contain it.
>>
>> If vcpu_guest_context is also tools-only, why does it need keeping
>> (for Arm)? IOW can't you drop vcpu_guest_core_regs from the scripts
>> altogether, and mark vcpu_guest_context with valid sizes for x86
>> only?
> I have tried to use "-" in place of the size but the checker is still 
> not happy. I didn't find another way without modifying the script...
> 
> I don't know the script and I don't have a lot of time to work on the 
> bug fix. So this is not something I could do this week.
> 
> So this leave us to the following options:
>    1) Someone volunteer to fix the script
>    2) Revert the patch that broke the build
>    3) Accept this patch
> 
> I would prefer 3) so we have more time to work on making the script a 
> lot smarter.

Well, if we have no-one who knows the script, and the simple thing
of removing the one obvious line doesn't help, then I agree we want
to go with 3) for now, even if it looks odd to adjust number for
something that's not supposed to be checked in the first place. Of
course I also wouldn't mind 2), as it seems pretty clear that the
patch was insufficiently build-tested.

Jan


