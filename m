Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7FB464981
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 09:21:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235649.408769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKrj-0002zn-N2; Wed, 01 Dec 2021 08:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235649.408769; Wed, 01 Dec 2021 08:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msKrj-0002xS-JX; Wed, 01 Dec 2021 08:21:23 +0000
Received: by outflank-mailman (input) for mailman id 235649;
 Wed, 01 Dec 2021 08:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msKri-0002xK-Lb
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 08:21:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa50c9f0-527f-11ec-b941-1df2895da90e;
 Wed, 01 Dec 2021 09:21:21 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-21-13smKxOYPtSj-lnCq3JbqQ-1; Wed, 01 Dec 2021 09:21:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 08:21:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 08:21:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.21 via Frontend Transport; Wed, 1 Dec 2021 08:21:17 +0000
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
X-Inumbo-ID: aa50c9f0-527f-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638346881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZu4PDmecZX7QRKHNDxESsRak5rcbyRea+cbNBa2B6U=;
	b=Q27AedOnDcLa2PMojZkEOYIeGyXkaLyBOo85CQ0x1LTWqmp6YVHKm6uQ9RMHDa0nYA9BYJ
	FyWogrRZT329WtucZlyu6RISvgqiTYFavk8/r+BXaLA2tiMbHGFlGbHlE9MtE+kHvmAsiL
	VcdUk107A4AIyraI9d3TZK3T2i81trQ=
X-MC-Unique: 13smKxOYPtSj-lnCq3JbqQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKc67BxGlCfrpAV7IHkP3KPExaNDp1loCn92AdVLYDuuu7hxIk+BRcjTZJrCYFP1e+RQah+9JWZJbvOrKMSBKXhlESPHsuU6oHPrAuobxKpbo8skwvAkiUS/ExNLvYV1uZek/ch+rKd3h0UTsnjBqYT8pcmbvWdrM5pKP6MgBT/xgC+V4KAgfROscM3IGrNkJ5OhlZiGW2IaeiBMsVrDqI0VTw0r2hofV8M8TgLCaXXPlCsZFhziO24/ZlnheOtLn9VoDGqm2tAIJlU1d9jfMJ8YhLu0G82XlF7cISvbSH2g1wiE2qmD5GYcfzB+hdOdYjWa32piC8smkncXQx003A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZu4PDmecZX7QRKHNDxESsRak5rcbyRea+cbNBa2B6U=;
 b=dL/gU8wVRgTq0rc/1BVeucqsIzRFL9wOYvNNDvmuOGeGbrmCTzvID3TCE8ok849eqN7a6EK3HLfBsAF4UND8u3lXQxatNky7G9NXbI4qQKVhNuy2ukU+6E/Xe/NUn/7UWTFUeltNH+MmMg9tOCSIhFx+sdkIZ4RibaMFn1I6yoE9wqRA9lNTDPGd2Y/c5RAv+7SjEsYZz/WZ2iD2CqZnRsXf8kK4i/RPem23NXvNwCIbQpzvBO7xFkN8PjyWiDNfPVbEW/riZXRGE/fSNgnQaI1cLzcpXg40YYmj0Gluh1pCYn/yZ3nR7Q5Sl3pYssHiczic/m1geCguQPpjT7gpOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0738cd0b-0914-b94d-f07d-68cf7bcbc8bf@suse.com>
Date: Wed, 1 Dec 2021 09:21:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 3/4] xen/xsm: Use __init_data_cf_clobber for xsm_ops
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126212258.7550-1-andrew.cooper3@citrix.com>
 <20211126212258.7550-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126212258.7550-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d7c191-a2c0-4f4e-2e19-08d9b4a38c51
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61754A69ACD12C8A86351204B3689@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WyTDMuyaHq2L6RtNwc7Y3+Pcznz01jphDVkRQvRXsXWHZVWr/Zdo9alDYD7Efo2j9OzVsGyj8JCMD83CVv8yAUFsRanPxNmMz86xE2+yT9f7cc9BTEoB5xWeSPB9yh2SykgrMHsx92dWzaaPlDQKM5X9GajBfsg9xb4Plc5qIrsqV+KP8waq4ROuY8zfXM5U/M77TxTr19fo6jd/zeKzQwt/F4phKovZsMj4L6GiZ4MyqVb4h09f46NfXQ50QLXO8YWBHJdwin52HpYluw+dOlC3LJNzSRB6dlRiNO3t523zKU1M6JmwxV0YGDdqBeVxHhDb9oWHCLPEFSZVgMP/ePV1+YckP2b19i6S9OPjOGxUcHinuZ4Bg+ydgZqamZc9RvbzouEgJeVaCsresox1xY+C75QstivY/8lNHWtlD9zkiSKJaRXaSO+2Y6UM3S8pOQonNjX0a8Nxd6utL3j+VGvlDekD/04xcp6ztu8p51cdKOn43vcjDWdSwTiKfa44iRoNULdlHdmbTiEuJLRIGJLKGiOrH4ofTFTm2YYc0//jppEiHuUc6ISQJZRZJ+miWmxTjf0BkvYVLMw68pwbih/4LkmLvGHDMg/qt29x0XAcgbxIxnvqrp3/AaR9TA4cTn8ewaNgLmjgP7r3yA0kgn5CDGUbB6PBSRiPIEy1Jlx5kUDK3AxegKWWDKMQoHbnpoUDeR4t+5dJLBXAGy0Y1BwF2fhj3mZ8UOEhByhpjYzsGT7MeTvTwbHW7tfdOGd3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(316002)(16576012)(31686004)(66476007)(66946007)(38100700002)(31696002)(8936002)(8676002)(2616005)(54906003)(956004)(26005)(186003)(6486002)(86362001)(5660300002)(53546011)(6916009)(36756003)(66556008)(508600001)(4744005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0t4TUY3clVzdEcxVGhlNjJCcmtpWlpVcHlaMmxkTFFGb0twMTJhYmhyeWR3?=
 =?utf-8?B?cnUxMnVFd2crZ1Vab1ZHSkZpMDdFSUNvVWlDVWNmemY2WENIeHBmRTkrcHMx?=
 =?utf-8?B?MHo5Y3FhWEFaSHZEcUZsM3ZPQ0pwRERseXM2S2RhZmMvYzNsUjdleURFYVhs?=
 =?utf-8?B?WTdPZ3p2T083V3YwRG00UklIRFJRRjJBMDV2dStXSzNHVHp1Z0RjQjVrZStZ?=
 =?utf-8?B?ckI1NmpKY3N4ZjArVkh1bGVIUEV5WXBWZEJ2dzBQN2RnQjhhTDdycmwvWTVN?=
 =?utf-8?B?eFZYK2l5VXkwazZ2Qitwa0E4MEdxOGZSN3Bqa3ZMdXJRbHdEaDRkTS90d0xR?=
 =?utf-8?B?ejNEU0M4Y3QwQVZMVWR2VUpuWGRmNk15QWR1b0ViYmpRS1NqTEVzZ2F6QzZm?=
 =?utf-8?B?VU9aK0RQSHllZ3p1cE9RTjdUMEkyRjFzY2k4dTlJT0dpYWhsd1RTU3pDdXk4?=
 =?utf-8?B?ak1LSUE1RlZwRW41L0FHNHpUZGw0Zm15WkVZaVZZUUMyekJYUnFUMFdlUzhQ?=
 =?utf-8?B?WVZKaWQ5R3MwWEZrLyt6eStSYXhGa29OMWhGTWpGR2hOU0h0V3Mxb2tLcE1D?=
 =?utf-8?B?MXBoTndyRjVEMDYvQ2J6aFl5NExnMmFuVnBoamVZNllhd1N0OXZJbHBDU3ZO?=
 =?utf-8?B?enVQL3huc0FxK0pxQjFVajJBZ3dSeWRRajhXOXNUU2NvelBQTTdZZHRsRE5y?=
 =?utf-8?B?S3hHd0dSbSs3N1l2VEZXNW1QYXRpVXNYTVRSbGo3Y0Y2ZmJMVGFQZmsxK25S?=
 =?utf-8?B?ejNzRHYveHVoc05MUFV4MUJQZWR1bUlFRXdyVUNnZ3ZMY1owN1VXOWNvMitE?=
 =?utf-8?B?bjFJcDliS0hGbjVSNlJkeGdFaFNJWWZBSUYveWNLdEJOR0JEZS9nZFRhTDFp?=
 =?utf-8?B?OW40Vkd2V29WYW9xQmdPQnIzSXJCbkZ6VUhVZlRjSUZKZ1FJRTZXZGZWOHhw?=
 =?utf-8?B?cG1weW9TYjRhU1d1QzVEbTJ5WlFxb3Z6Y3h1QzRtRzBPY1YxY0hzcXJndDZ6?=
 =?utf-8?B?MnRJUStROU9FZ0VtZHhwSktiVUZQdzYwTXFzMkpnQk1sS1FmQW5mRDBidW1C?=
 =?utf-8?B?SEZnc1ZOK3dNOWZqTjBzZTA4b1cvVGtpWVJ6TVkzbGxWczJ4bi9GZFlVUEhk?=
 =?utf-8?B?Vi92RSt4MnozbGx2R01oRmlIZ2VrRk5Xb1JJZUJucXdsOHFZT3lzYXl1MEtI?=
 =?utf-8?B?Z2VwVjNXeGUwdEcycjg1RjdRMWNBQnYwUFU3QnBzYytzYktSQVA4dEpwUUdq?=
 =?utf-8?B?cTBlaHZQNUlQaU93WWJvQmNOZnpxUnNQV2Nqa2xUZEdpall5TDNJOHA0K1Er?=
 =?utf-8?B?eWJmazZiQVFoUzY2b2lNa1o2bVp0aVAyQnlNWk1zNnVFcDN6cS9wbnpHWWE5?=
 =?utf-8?B?Tmk1MytveEFtY2d1SzdNYzhmdW9pUXE5S3NZYVRHOE1mV0tGR2l3dHlLaFlm?=
 =?utf-8?B?QWNQNFhQSk5VbHYxempIMzRESCs1VlFMMytHemFHeDFMakt6YnlTMWZ2SlU2?=
 =?utf-8?B?dnNKSzY0b04rZWVnVkdiNjEwanhHTm8yNEhHWWk5V2x5V2RtczB1NlZoTFFm?=
 =?utf-8?B?cXNwR2NwWEE5eFFVTjJpUEpIYkJUdWRFRmlkVzBRYWFDdVpUeHlwTGNVbjFL?=
 =?utf-8?B?NHdSRXZXb00zT2NoS29ValdGa0ZZdmJmc2lJRUxkbzY0TW9naWxDVnpHZG1a?=
 =?utf-8?B?em1MYldEbjRLNkkwK3NiU2lScjVTcmVvd2x0OGpQbUFRWDFPR0wwNE5odlBn?=
 =?utf-8?B?c2EvenI0Q3c2QnRpU0Q2c1dpd001R2VTVHV6RTg3ZTY1WkRqa2Ztb3k1dGVm?=
 =?utf-8?B?NFRuRXNhcENCV2xtaG81Z3FwUjNmQ1VPZ0JjMHFNdXdDMERoRkxFUy9obWN3?=
 =?utf-8?B?OW9XVERIeVFXU2duY1R0bnRSN2tZOVAxb3BhZ1labVhLVkh2c3pXUFFpTitL?=
 =?utf-8?B?NTZTaVVzajJNTFVEOHZUYXNuTml2eU8wVjU3RHpaOWU0RlNBbzhRZU1NVFE3?=
 =?utf-8?B?UjZIZnpUNnJYcGpmYjR0NWJ5N215eEE2blQwait2cXlNZ0I2bXN6NnRVN0lt?=
 =?utf-8?B?aG01Q1VEQW5iZ1RwejcrUlZma2tOblJiVFEwVERMSlhZV09mUW96eVViUDdV?=
 =?utf-8?B?SFl4ZDM1ME9VaWZhR0xBSlozWDFYYmtKb3lPL3JOamZZMjNNdHdXeVNZejFm?=
 =?utf-8?Q?N9fJik8oDGpvvvpkYKwbO1k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d7c191-a2c0-4f4e-2e19-08d9b4a38c51
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 08:21:17.8204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHULCZMYrv7x/H8HhYMdqf3leioAxjqhw/t5IGQtJ6PTqV6TEB+WHvFqmoFnBDXx7o51KU4HY1ppyAHK51MrfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

On 26.11.2021 22:22, Andrew Cooper wrote:
> All calls through xsm_ops are fully altcall'd.  Harden all fnptr targets.
> 
> This yields:
> 
>   (XEN) altcall: Optimised away 197 endbr64 instructions
> 
> of 1655 on an everything-enabled build of Xen, which is ~12%.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Subject to the resolution of the const aspect
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


