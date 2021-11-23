Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F4197459EDB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 10:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229215.396674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpRkF-00079r-GY; Tue, 23 Nov 2021 09:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229215.396674; Tue, 23 Nov 2021 09:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpRkF-00076i-Cv; Tue, 23 Nov 2021 09:05:43 +0000
Received: by outflank-mailman (input) for mailman id 229215;
 Tue, 23 Nov 2021 09:05:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpRkD-00076c-Tz
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 09:05:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81747a07-4c3c-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 10:05:29 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-lJCnXF6INoWdWKa1AVnaoA-1; Tue, 23 Nov 2021 10:05:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5904.eurprd04.prod.outlook.com (2603:10a6:803:e6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Tue, 23 Nov
 2021 09:05:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 09:05:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0039.eurprd03.prod.outlook.com (2603:10a6:20b:469::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Tue, 23 Nov 2021 09:05:33 +0000
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
X-Inumbo-ID: 81747a07-4c3c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637658339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gpGiIk7XQQ/Jt8tQH0bxR8zhEm0WXiioQrFa3PtnkYo=;
	b=buvfdAvB3Tre1vtL4D1A9MBhAPqUDL1i8movtoYmu39Q9EBACy0743DEE2cdLdbRrw4pLx
	EB77rswKScpY6qI1NO1LduXxRsP2qsl302KHhY0e8rC0ZBygNAG/K0RrCd9jzVVoXIdQwj
	nX3xYZw9VB08zF4jMQQV6zLu9b4VhFs=
X-MC-Unique: lJCnXF6INoWdWKa1AVnaoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=La9Xh4v4HIoMRrdqY9IT3PUmsmWHWlmLHTBk7n7pDicxUQEICQ5WYvGvOYBbdOCMPM8nb+Ua58xo6TTs9bozvbZi9QYU7KL5ZoWCQmH0AKdfBqm1taHuGOWvMiYxxEpdEoXAtMEXy9v5C0q6o3KvjK0st0zZbS5vALgJTBJSWfiW9dmWUy15HXfB1L3JJUOUDbsDnadSCaDNDfzmO09OrmSAnuxjjqGipnzrd1Z1Ui8t56ZIqtbFz36wAdSdEgWTayFFktU1JYfzCe9FgiHeEjL6vMQNc8c8Lywtta90+U00AOTBFBa8FUo+LPFNUlI/Gb8XILDVG0LkxwwETK1erA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpGiIk7XQQ/Jt8tQH0bxR8zhEm0WXiioQrFa3PtnkYo=;
 b=OWG+vSUFzOetl47xtdFAzoydCYkN5EZmmnXU3LH2RQi5gzs8WSYm31kHpfa0vuOZsf+E8v8Tb+/399kNzefdazXI6V1ZSyxInKl1U6WhCymzjM+tz5d3BW1QodDjIQYYb/9YMjwC2PMza2JCWURWF75drgfLQunsmiK6IB7Nd1Z/otp8b8bHbnxXYsCJ69KAF5lm3pWM4BtHJ3XzyPzkzekxZljXjLCi8mUjAj76FX/0a4DObevR+W+ZReU7pZBLd8uRso+hnAygUk+OINCIR4aRoLPEccnp1/UXPTaw/CoBYUSBpuO03Ekd4gceHaknRIVGQkfEZSC2ek0DNE/UTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ef9fc5ee-9c91-6963-0cfe-35b7188974c8@suse.com>
Date: Tue, 23 Nov 2021 10:05:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 4/5] x86/traps: Drop exception_table[] and use if/else
 dispatching
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211119182106.14868-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0039.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b83dcd24-dee4-478e-face-08d9ae6067f1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5904:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5904E267780326F68EE03BEDB3609@VI1PR04MB5904.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dusxcx416AbWlGBRNlfkeaI3805kMKy9pB4+qMNoPdhYrieMSGeRVl2mzod3mHNzBN0s8wbij/n3x/WvoKx55mjCls8xNF8v0sEcPdl6ZmzTM2/AKodPb08WgAzcBZYRfXlmedecb6rDamaec4gy98bIvXsaGEzhOGdUR/Se5y+dRtNAO0fLxrKyUYGfJwXw3/laHEvy9POqHD2tMK8iF5B0EmsIUI1GARhT7S8vWlPejZdwk5Pocjqu37YOQcQgJt6MJEMnDG3ISelWFz6pVZ4K+9YbO0VJUpFlxdELiVgp+MP38bWTQ6JKhs5i03osPnDjqBb6cbtGabyenVp2oG4TKpFhAMa1aO4P7jbMSb3Qj0g68F3HYhnKoUEcm82jkMvD7/XW9WZIXT8Tv6b0KHUrsQkHeG6iek2OJuZLsO6cMvDed7hnYMVaEf1oCf9g3qW2yOzLK29ZZsky9OH5RzdLmeMcVG1YkdPb/mR3mdBOq80XZaYodXg88+gOpggcw6HLcp/1nwRLoTeVV0HzSTj5bBAtVvmgMAN7kAVsFsMF7MtOwLxtaZpYxqCXGnqvB5tgFSbEMadEwH85s0WvLs3oHcRjXTkN3J0KsXDB50qJkDmvsOFfGAuldkHtawY90EbJIbTQnPY09IDTFgZY/bQEM8KQd3rp6ygMlAs7Bt59HxetpMFHzFMYCVayjaV96UVWCGDS079ZZr+FxTXw3PGEOiX2cuJgq7/5FMdhiFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(26005)(2616005)(956004)(31686004)(5660300002)(86362001)(6916009)(53546011)(38100700002)(31696002)(8936002)(66946007)(4326008)(66476007)(54906003)(8676002)(186003)(6486002)(508600001)(36756003)(66556008)(2906002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZS9CWDMzNHFCU0RSTmFYM1RXUDE2akd0dWQ1NXdQSC91bzJwY3JtUFhFcHVN?=
 =?utf-8?B?d09YbFJ4Z2QwWUNjbXFJTC9RenQwVFV6UU1qd2tmVG10ekNRYUR3aVBaV1E2?=
 =?utf-8?B?WnZVcll4b3d0Q3BlYnpaWVoxeGZLeUt0Yzd6OHhTQk5ic1RFc2Q2RTdwZkZY?=
 =?utf-8?B?S3FPN2NmRTgxZDlSMS9qTm5qUjBmNFZmZUJEK1FnbC81dW5ybktBc2FzTEo5?=
 =?utf-8?B?WkQrblhzdjdwR3BnVXJoc1lUNHN4WnBwb0VMS01mQkdpVUxhWGpnbFZVbXlT?=
 =?utf-8?B?VkRoTWdtU01VZlhZQllGTkhQL2lQTjgzcWtlamx4ZlBKdm5xTngxNnBzK0M0?=
 =?utf-8?B?ZU1HVUtQQ0VlZTd2d0sxY2Z6UW55ckFoMEhMSmcvalVkSUtSK1pkSWRTQitu?=
 =?utf-8?B?aGdvNVNiZnpKUFRrSURNaUJlaGx6M0cveTRBR3ZPL0xtSWxUczRUUzJEcExx?=
 =?utf-8?B?UjRpdFN4MlIyTHVrM2hxNjBxYmlzd2dKZXZiTytnR2t0M3dhaklQSlRDU01n?=
 =?utf-8?B?WW41OFNFaW5rc2MzZmMvWDNEZHpKYjhwS1puR004Q3phUyttZjJXRWdJdmMx?=
 =?utf-8?B?K09yc0RRdUpLZmswTzk3VmwvWEJyckQrZE5QQ1F0bDRkalJxZDdmNWh3N1VO?=
 =?utf-8?B?N25aT0Voa1M3Vy9zYnNwRHg2d2dMY2xSRTNVOEVBUjhFQkVURzgwWEl2b3BD?=
 =?utf-8?B?NStFelJyNm5DU1Yza3J5WmE0V1A5TUpwZ0ltVkMxc0hXUjNxN2xDU1NtRE5N?=
 =?utf-8?B?UlFtcXV1WGFwaGZUL3hXdldKVmtWYWtiVVJHVzVuc09DU0c2a1owRjlMSWhM?=
 =?utf-8?B?UG1LN1IwRmtsaVdJQ080NU5KOWxBSFlpUnZDUzJLS2kvSHNMWXZURTFaL2Rq?=
 =?utf-8?B?NzdSL0RreWVOeTZHdTE2L25QSWRlbDdTVVN2bCtTakNLcVhIWHArNW0yTU1h?=
 =?utf-8?B?c1N6ZzZkT3pNUHZGTzlkRmJkT1UyWUorcWtiblRTNDRVQkNMa0hvU0I3Vm1E?=
 =?utf-8?B?OWFvN1UwdHI0TmFxcUJPc3BTQjB4WE5RUXRJZ0diTExIdEpLZ252RSs4Yklu?=
 =?utf-8?B?cXJKeEZLOWtqa0VIc2FpK1ErYTZ4NGhqZUxXbEFHRk1EcVdnSU55RnFJYjVF?=
 =?utf-8?B?U3VhOC8rY1Z2Q0JOUDlLUW9TWnhhMEt5aUo1ZXhhTUVOamZ2MTV2TTNtTGp3?=
 =?utf-8?B?bDVHWWdyRWhmQTF2QTY3WlF4aVF2SmJDbFRlNTlXRzNuWmdQaDV2RHdxUVJk?=
 =?utf-8?B?cllDbWpzT2ZRMk1hWU1iWnhZSU1sQzBLelg0NmNMdU1ySDg3SmdvUVRsOTFt?=
 =?utf-8?B?NDM3SXFZMW9uRmRlVjNLQ0J2T3FjWTByanBsMnV0eUw4ZWhYQzMvYmlXMmZu?=
 =?utf-8?B?anJpZXhsajdwekNPT1FIODVQeE1WUmV5NEdrTWNzQnNiczdJYS9oZDljRllV?=
 =?utf-8?B?WUNaR3pMdExhZFVGSFpzeWk1M2diVUFScFYyOWVHaFZoS1l5ejFEeGlaODVH?=
 =?utf-8?B?N0FJbWlab21Jd1dxR2tZQ08ycVBGeWdQcWpUOUZGWEU0eG5oeEdmUGNQVjFE?=
 =?utf-8?B?aStRSXpiUEZtZSsvUTNrZTZDL3RmMlFiOFRsSnFvSlFDNHg1VkdiSnZLZEsr?=
 =?utf-8?B?WVZuRTdFWjJESTBwZzQ4eC9ZcU5vREVweXhmZHhqSWoxZGgzMDg5aXRCRFlv?=
 =?utf-8?B?SGp1WnR5MXBZT1FMWXZzL3BacXJIMnhPbGk2Z24wdTM0OU5VYzdXRFQxcGds?=
 =?utf-8?B?MGNUaGRnTFNLLzcvZkZka0YyWHpsMlNNdi91YmJIZEE2c2N0bGdUN0ZtODBY?=
 =?utf-8?B?dlZGYXZsRVpKWHJXTFU0Y2dvd2U0MURocGZ5RDZJU3lCN0Q0MjlWMEc1NG4y?=
 =?utf-8?B?UGRhMWhwSFBkOW84RlpqYWpiUy9EOEtkdTd0UitlbGVkWWdQckpQYURua3Ra?=
 =?utf-8?B?eUhScVVCSCtva2hkUWRhMmI2b0ZDRExjampHcjlKZG1QWHBSNEIvdWkwSXN3?=
 =?utf-8?B?MWtvelpIY1E2M0xOUzhDenlKSTJyT1VFTDVQR2dpdjhSTWMzUlRHZTU0aXJl?=
 =?utf-8?B?YmVrelJESk5GbHNDbUN1RkVxZlZjbE5SdHlGQ2NCcVdESnFYcTZERjRiMTJq?=
 =?utf-8?B?TEhkblh3czBzS24xa2VnR3BtSzdlVURqZDg1OWR1ekpYN3NCL3NRcmpnQ3Fq?=
 =?utf-8?Q?5p8BDvRaKq5qHhUYmRLVVck=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83dcd24-dee4-478e-face-08d9ae6067f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 09:05:33.5250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLpPbix7PimnNTuNcZrFvL6SBCgXs96sPd+blc/0Sp7teOA3bnQk15u/ANxumO1PQRMNRTSK9kunyt53CvFAQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5904

On 19.11.2021 19:21, Andrew Cooper wrote:
> There is also a lot of redundancy in the table.  8 vectors head to do_trap(),
> 3 are handled in the IST logic, and that only leaves 7 others not heading to
> the do_reserved_trap() catch-all.  This also removes the fragility that any
> accidental NULL entry in the table becomes a ticking timebomb.
> 
> Function pointers are expensive under retpoline, and different vectors have
> wildly different frequences.  Drop the indirect call, and use an if/else chain
> instead, which is a code layout technique used by profile-guided optimsiation.
> 
> Using Xen's own perfcounter infrastructure, we see the following frequences of
> vectors measured from boot until I can SSH into dom0 and collect the stats:
> 
>   vec | CFL-R   | Milan   | Notes
>   ----+---------+---------+
>   NMI |     345 |    3768 | Watchdog.  Milan has many more CPUs.
>   ----+---------+---------+
>   #PF | 1233234 | 2006441 |
>   #GP |   90054 |   96193 |
>   #UD |     848 |     851 |
>   #NM |       0 |     132 | Per-vendor lazy vs eager FPU policy.
>   #DB |      67 |      67 | No clue, but it's something in userspace.
> 
> Bloat-o-meter (after some manual insertion of ELF metadata) reports:
> 
>   add/remove: 0/1 grow/shrink: 2/0 up/down: 102/-256 (-154)
>   Function                                     old     new   delta
>   handle_exception_saved                       148     226     +78
>   handle_ist_exception                         453     477     +24
>   exception_table                              256       -    -256
> 
> showing that the if/else chains are less than half the size that
> exception_table[] was in the first place.
> 
> As part of this change, make two other minor changes.  do_reserved_trap() is
> renamed to do_unhandled_trap() because it is the catchall, and already covers
> things that aren't reserved any more (#VE/#VC/#HV/#SX).
> 
> Furthermore, don't forward #TS to guests.  #TS is specifically for errors
> relating to the Task State Segment, which is a Xen-owned structure, not a
> guest-owned structure.  Even in the 32bit days, we never let guests register
> their own Task State Segments.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

As it feels like we won't be coming to an agreement here, despite
my reservations against the specific form of some of this and on
the basis that the code change itself is certainly an improvement:
Acked-by: Jan Beulich <jbeulich@suse.com>

I'd nevertheless be curious whether in five or ten years time you'd
still agree with your choice of basing a decision on not really
representative data (at least as far as what the description says).

Jan


