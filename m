Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98E44EC4FE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 14:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296308.504329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZXpL-0007xo-Et; Wed, 30 Mar 2022 12:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296308.504329; Wed, 30 Mar 2022 12:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZXpL-0007vU-Bu; Wed, 30 Mar 2022 12:53:31 +0000
Received: by outflank-mailman (input) for mailman id 296308;
 Wed, 30 Mar 2022 12:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZXpK-0007vO-6A
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 12:53:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 651050c9-b028-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 14:53:28 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-Ma_TLbvXMra12xNT0dayFQ-1; Wed, 30 Mar 2022 14:53:26 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6084.eurprd04.prod.outlook.com (2603:10a6:208:13e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 12:53:24 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 12:53:24 +0000
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
X-Inumbo-ID: 651050c9-b028-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648644808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IOmUkeNxIIgohZhz/Gy7/fAY9TJ9E/y/rdRgferuhFc=;
	b=LXn5HyEI3f5MaFSZmg49DfMIESXgvn7OZtcEv0RXgWAVVPyNesXDhfoIEBbSyiRjIbfHJg
	kuEvq8ei/LqX0yzcZZip9unpRzlo9NkSeKRLAn1fZNEqZ790FtXyk1rxk5KtN9EN+dD/kx
	IkxIaP5O1JnALbpQR0wTvsjUAu/A4S0=
X-MC-Unique: Ma_TLbvXMra12xNT0dayFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuGJOeybjQiYHpSjmtI7MXh50gRGjhNFDS72WXXDt48n4x29JrxaIa4V8AqSu5GGZNylt2tsR4QRl7fI8lc8lcP4srtmZqW9po9muSW3bKY6jrQwwJzpztrk4DcB5MH/kzLOOVItO4A6aoQlJ9MW3B4ChOPb12sYwT6eg/orqTH6DPeNdztomoYukE7wJ26aRBZpmScp7TcxIrG7dQyuDCKI2xGP+vSw9xgPOtpB/JmcFn+bqVbMB9bLCKsrdJ7g7GZYpq3Vlnh7p6OIieOJNlyLPZnaN9uIFOe7kcD6DIaUqmXZqyoFg29zqtKP3xRpquey+f/6zLd25ZoVlGNdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOmUkeNxIIgohZhz/Gy7/fAY9TJ9E/y/rdRgferuhFc=;
 b=b3Eovh3rUwg5M0nPpJtg6Aef4Vw50ez27ywRcwOMBQK8I4QBhimDAwk+oN+V+LdMhJpffZV2cuVu9tZvQUgvCQRHHZ/bpQ16133ox50IgR5Sc34M6qqQRkmif0ecRK+on2q+BJjotpXOVB/LkGu1XeqrQAUGDbxfc25IdyplfNaAqeu0VR6iMV5wgUQvtjwu6t+pTq+1kbHDgNQeiThRmk1m4BIOL8MerrwmJY1g6jpZQR121hMjbEp1nyZfBJhhKmgaf8RMA7/FwhdwpS3qEmISFO8kQW6PJL4C0gNJ1cA+K4U7obHRqluTHZurqIcHp1054A72LFpMVBvMeX4dkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55252ad6-021b-b96d-ae91-4ebbe4046dbb@suse.com>
Date: Wed, 30 Mar 2022 14:53:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <d5bccf50-c74a-40e6-843e-3ad682647efb@arm.com>
 <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
 <63a680c6-0086-230b-dbbd-dfe63609f9bc@suse.com>
 <b0b49926-9a70-37f1-43d4-ac4e852198ba@xen.org>
 <1013a14b-a45b-f37f-b2e0-e63b186a2956@suse.com>
 <ffa0e581-6a32-5c3c-7e63-acd5086c6822@arm.com>
 <e3a045d5-34d3-af73-89a7-7c306e7f8de4@suse.com>
 <168143f7-11e3-1acb-2de1-dba1a0db4ad3@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <168143f7-11e3-1acb-2de1-dba1a0db4ad3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0049.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4422bb08-ec0d-4996-98e2-08da124c46e7
X-MS-TrafficTypeDiagnostic: AM0PR04MB6084:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6084C8C63779A8EF61378940B31F9@AM0PR04MB6084.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6jZMTESF2ZZZLErzMyvDmocxBDZz2V7OzBgsR98CIN+/F6B8VpGlHLI7ovWByowRejAGsExWgGnXLWyfVmuiDPOYo4lz7uEP2oPK6SRqZwIL5i89wQi8W1wMuUiiAn5Gp3YsilsclHnM45tqeP316GcfMbIfMn6tUTUDhrURSOsUpv/GewxLeyLcCF4rRuLGX1PDvuxRBy8aeTrZDYxadh/HMZ7Fc48D5TznShAz7F8XMT5osF1nJCU+gheOmLdBNiXrRESFMFpDY/dSHYb03WTpTuX0jBuyOZ6xRZawTuMx1ZCZLohL6JUXvLjQlzEeTd10z/p5fnRfyjnbPoyC78s1IPy5TKdDmx4ju9VpiZXL1BdCBDdFDFjwYF8m4PGbc2t6QNZwX+d9FzZWVfqvNO13fDN4+EAZ+dGSbEZRSsMoNWFf9lPVoHFueO2YE9yzTrmMmUFJMOx3O9hDOL0DR2lechhURMoVHsRIlnlQtA98wjELTjhlFjmIP3i641rseSlUGEjkBeq89nlF1SWqTY+qRmAieG59diHZFxq/MQp4nGoY1ftRQLC7tNSJH/Pu317Cnkb5BmZVfsAX/YUmQzvAza7DawxmbUc+LgZRgKqqsGHiGxAEenn6HJ49FPtNKqlNIU43kgeuUVakkuyYNwSJ7GdPlLspi29qFJa2d1hNDDeA++ekcausJvE8l2thYpue+cB7hM6GKoTBSP6rP92xNM7DgBCtxiW5x2tpakI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(66556008)(66946007)(66476007)(4326008)(8676002)(316002)(54906003)(31686004)(6486002)(36756003)(7416002)(5660300002)(508600001)(6916009)(53546011)(186003)(26005)(6512007)(6506007)(2906002)(86362001)(31696002)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3Y2bjVCeFY3c2JvNmpQaXNtNHU2elJTeTl6NXUxUjF4U3c1UFNGejJCQnJV?=
 =?utf-8?B?TTVlSmYrakt5a0RwWCs4TUdHcnNScDk2RVM5TXhwTlprMUxnUFdFb2dsazd2?=
 =?utf-8?B?ZFJTbmNmY3dzKzdXQmJkQkE2TFpYcHVDTTlXQkR5NnNmL01zOUtpbldwRkxW?=
 =?utf-8?B?OXhENkdUZEtoTDBqd1BLaUI0bTdBYXVXWWs3OUNkQTF4a0loVy84cnNvZlJF?=
 =?utf-8?B?cTVqRkx5V1VwaHY3V20vdGVQSGgwV0g5WWx4NXZ2UEpjTkJFb2V3bG5PWWho?=
 =?utf-8?B?NENVenFlYmUrUUlRcnAzV1hiTzlQWWw1ZE1Hai82bllmWWpTcjI1UXRGMW5V?=
 =?utf-8?B?OTFZRS9WNDdtbUN0TVJsbTBWOENNNmVaVXoydkdoMFdRMUUyVXAyWjB6L2k3?=
 =?utf-8?B?Zk9vS2JucnJ2N1hSeUF5S3o0RlNhbnAzTUU5ZVc3V09Fekt2N0ZXZkZuSU1X?=
 =?utf-8?B?QVRBa3ZnUHVDRHZXVndEWTFHU1FhaldVbTdjY0h4Ukh4YnEzdzFMYkRXRDdk?=
 =?utf-8?B?NTV6Ykgyb2ZsVncvUVVCYW1Ka0d5S1lPdEpvMURaRGNEUGNvZHcxRVZTa0xJ?=
 =?utf-8?B?S3BTWThvcXBiOW1TK21TaXVIWHVXUjJlTEp3ZlFCaW5rMm5IYlVMTklGNXFR?=
 =?utf-8?B?N1pLdVFWb0JNbHFzTVdnYlppMW81OHNVNDRGcExXaVpYcjJTR1k4YXFXRlBR?=
 =?utf-8?B?QTZVZXdSUlk3dUwzSzRvTzh0WXFKTVIvOUVHejhWTld2dEV3MTJ1Tks1elFn?=
 =?utf-8?B?dTdpeGVmTWZjSzhHTGx4Q0dwR1YzeVBUMCs5UWRMWklhY01URldydzk3MlU3?=
 =?utf-8?B?aDhjZzVQWXJLT1F4aCtidUwxd0Qwa1N4aVp0VTh1ZVNlOXRiRW1NSUdmeE13?=
 =?utf-8?B?dlpMV2tRY0hEemhLYkpXY2Z2U3N1elRmdWNpcEtjUmlYRzFLUW9YRCtoa2hh?=
 =?utf-8?B?Q2dBS0p2MG45NkFoWlg5aDFqakJSS2tHVUh0SGZ1eHZFc3hEWkhVYjdQbko3?=
 =?utf-8?B?UktFdG9ReXN5ZDRYb3piTzN4Y0VHTTlZOVVFN1Naby92TW5zQkc1U29ZNFdO?=
 =?utf-8?B?RGdlM0d6T0R5OXNLZVRWMXpVWm1qaXY5RjBmUmNnNlUzMXloNXNPcVdaZDBi?=
 =?utf-8?B?cGRLTVYxTDBuc0FPRDBjUDJmZk9kTmFrRldNNEV0REZKS0ZDeVBRd01xSnZV?=
 =?utf-8?B?elM3TlpZT2pzR2FUWVBydmM1cHozTUpEcWo5aFR1U0habFhzbjJOdzdrMUxG?=
 =?utf-8?B?TXBMVXFDblNUdWdETUFYMUMydlZCVkM4Q2tkdnNYVk41QWkydE9VMVlCNkND?=
 =?utf-8?B?dzVLNEgzREptSmsxY0RjUUVNdG5OdGxweGd2WXc5a0FPbmZKaFoveXEzVlJ2?=
 =?utf-8?B?eVZsRGNjSWFYL2dsL3Fta1JqbW9KZnlPcHUxcXF5L2xudjZMMEJBSGdrd3ZB?=
 =?utf-8?B?NXNPc1hLOE5KOG5CT2NOZ3UxTXdPbWp0SVpoYmQvcE1xcXJuUXhqbllYZy9F?=
 =?utf-8?B?a1JPRTgzbVo3TktkaDhBclUzYkd1dExUdWc2aWhuNTk2cEU1STIyTEs2bW9N?=
 =?utf-8?B?Zk5uT1IzWHNYWnBhUFE1WS92N0VQZTRVQXRWa3hGOHdsNmdDTUdyQnQxVnRy?=
 =?utf-8?B?UHVMMVhWWkUxUm9hK0hmZlc2VUl3dVc3S05vZXlFS2twMUx2Sm13cVlLWmd6?=
 =?utf-8?B?TUdiN0pUcDFTN3dtekpwTTdWa2dmZHRnaWZTTmN6NE5DcGJpVnRCUEd0bVVT?=
 =?utf-8?B?eHZ5dVZxK3dGY0JFRjNiRHNjMkkzdmNmeC9FQ1ZXdlhiU0QvcXpUTDRuT3Zz?=
 =?utf-8?B?dHF3RmY5YzNVeE0welMyZThZNjJobUdGbFkrV1gweUhCMFZCTFM4L1NiUCtj?=
 =?utf-8?B?bk9sc0lKdWVyRS9ramY5YXVkTnY4QWpIaGFRc1JaeUZ1d282ZFcxZnRWMEd3?=
 =?utf-8?B?UDdiVXBYRWx0NHhGd1NEOW1LUjRhT1pyaWxNK3NDSzU2NWxpano3WFg0MzF0?=
 =?utf-8?B?T295OVRrWkZWK2gyOE1PaHJHMjNnT3RZRThUSEQxWlRpd0k4YithTWVoa2Rn?=
 =?utf-8?B?WHVSUWlpaEZ1MEdUQmw3YTlwd1BScW13c29hMmUrK29nOUN0L05NMXBlZ0s0?=
 =?utf-8?B?QXVZV3hyb0dBWksyVUE1OWgxazJZSjZ2L3Z2NDBKTFB2L25iNkhzMnhURHhj?=
 =?utf-8?B?RFNsUnBQNWxCY3IveTYraUVzQk9tNDh4Z0JaNEkraVRjTkJlaGVGNmpGeFFr?=
 =?utf-8?B?MW1Hb1R6dnBqTG5TRDN0Z2NVdGpXY2NlTUQvNlRpZTM2L1YzMDBYeHY1Q2VG?=
 =?utf-8?B?ejBWaWNaWUNJaVI1ZldLZEpIb3JPWWtIUjltM2x0NlJucVNJSFQrZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4422bb08-ec0d-4996-98e2-08da124c46e7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 12:53:24.4306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwNu7eSi4aIVOX2um97GYYNIZRwCgiw6H2E9HgQELGX9Ppd6SkIGHVT4VtOcyFEnCwD5JVBynotGjGdKxfL9Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6084

On 30.03.2022 14:13, Michal Orzel wrote:
> On 30.03.2022 13:57, Jan Beulich wrote:
>> On 30.03.2022 13:04, Michal Orzel wrote:
>>> On 30.03.2022 12:42, Jan Beulich wrote:
>>>> On 30.03.2022 12:32, Julien Grall wrote:
>>>>> Renaming to PE_COFF may help to avoid the confusion with CONFIG_EFI. 
>>>>> That said, it would possibly make more difficult to associate the flag 
>>>>> with "linking an EFI binary".
>>>>
>>>> Indeed. And EFI_PE_COFF is getting a little unwieldy for my taste.
>>>>
>>>>> I think some documentaion about the define EFI would be help so there 
>>>>> are no more confusion between CONFIG_EFI/EFI. But I am not sure where to 
>>>>> put it. Maybe at the top of the header?
>>>>
>>>> That's perhaps the best place, yes.
>>>>
>>> In this case how about the following comment at the top of xen.lds.h:
>>>
>>> "To avoid any confusion about EFI macro used in this header vs EFI support,
>>> the former is used when linking a native EFI (i.e. PE/COFF) binary, whereas
>>> the latter means support for generating EFI binary.
>>
>> No, that's the case on Arm only. As Julien suggested, it is perhaps best
>> to explain the difference between EFI and CONFIG_EFI, without going into
>> arch specifics.
> Could you please tell me what you are reffering to as there is no such identifier
> in Xen (as opposed to Linux) like CONFIG_EFI ?

Let's call it a "virtual" CONFIG_EFI then; I think we really should have
such an option. But yes, if you don't like referring to such a virtual
option, then describing what is meant verbally is certainly going to be
fine.

Jan


