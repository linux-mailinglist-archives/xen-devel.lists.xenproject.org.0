Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E109442E8A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 13:55:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220211.381387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhtJA-0008UF-Vs; Tue, 02 Nov 2021 12:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220211.381387; Tue, 02 Nov 2021 12:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhtJA-0008Rq-SH; Tue, 02 Nov 2021 12:54:32 +0000
Received: by outflank-mailman (input) for mailman id 220211;
 Tue, 02 Nov 2021 12:54:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhtJ9-0008Rh-9v
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 12:54:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 046a393e-3bdc-11ec-8556-12813bfff9fa;
 Tue, 02 Nov 2021 12:54:30 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-sAzgxgeqMDa9ZV3KL4NvWA-1; Tue, 02 Nov 2021 13:54:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 12:54:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 12:54:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0229.eurprd06.prod.outlook.com (2603:10a6:20b:45e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 12:54:20 +0000
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
X-Inumbo-ID: 046a393e-3bdc-11ec-8556-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635857669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsAg9WVLRUVM0ca1onBlBcvsawHWo7t99JjAUNtg5/c=;
	b=PuT5Tcd6Svtwb+7VCqCYGwGMWsckrCjfzgPS6dK6x920muVozMc3R3ovb65kHq0T14UtIJ
	IaS0aY0Abilx8u1bdxWhRktlYbhzG/Rnz4fVOQjacDKErSpqOfWvSvSU6lfzTJlQy7KeKi
	dlKNGioWy1GuDkKBX5RXUUQcqGUHUxk=
X-MC-Unique: sAzgxgeqMDa9ZV3KL4NvWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKLQCT5rGSVsINDgWxVbFjDvq5FetlEjV6zxnpJtjHuJkwGkEJjcrGfJTgEN3rJiEM/sP9Bowa3rxY4JbWOR/+EE0UKPjwc+5gAq3gsD0ZsEl7qz7l3n825Spo88bRyg5f0yGMg8uYuyRyJQK72v9nXo9YG6yt8c8kzAuzfzx/OPgxWoOhmMyYPF8ZtDab1ZbImGuTy6dcdapPw9gSWuBy9EMMVlR8AFHEgh8avn6ICj9QanJEhbVB422KLad4YyOvGl0DM2QmoQaptPs+MZi6mo7wtrwzqbslKixrPKKaTr3RtMJ9WRGdK5RnCVOaJrxaBBk6rGclh6oy3lf2jRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsAg9WVLRUVM0ca1onBlBcvsawHWo7t99JjAUNtg5/c=;
 b=kPMinJ37sWJQYTcoV9QrLq6wyQnO2oMBQRfFuUIAy+69cx5+yYohHvZcPQOLWEJYpcxPsmGQSxVipDUQiL7r2wymAQtN1DyatFHH5YVTAaWtE9Q4KFqaIfLss91SwyspnQV+neyERAgVjPM9z1vFLop7JJiuuIlgR+gkeIOKg+HfC+RquSv0i7Q7WTidFmk2xID4KV8HuZB3wVOivw+0a4XhkVGlnNeINHJ4X0kwIVip4tna9QK7IhN1KksULhLABwtvBZDuaFbx5mWtGBjvhZFyAmAl8hjraKfSEcjMVJXokxN97aiCX0Ltzv47riAD0YT7l5wUC5gkL+I9BfsPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <225c0ac3-cc57-d26b-acd1-b62dbcffd002@suse.com>
Date: Tue, 2 Nov 2021 13:54:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] x86/kexec: Fix crash on transition to a 32bit kernel on
 AMD hardware
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211028232658.20637-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211028232658.20637-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0229.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5418ad6c-ec57-4eb4-9a70-08d99dffe343
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5471EDEAA7433F724A1DB12DB38B9@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MKsnIJXoQoMfFoO2O2/JTWmqWBIyczfLQZDxCwdBwYG9LekJhUEHbRjKJpUYBlPQF0/RtkJaOzPH6b9JH3P0bSvxWJN7gnWCdbR0YHJ7bEYlisJbe/NsnXVzfpIBHGTqad6o/4m6WrFTMCDFRglFdcOGQZLhCrdnSbu7q2bABgZ0/NYjvqlhD11s1/bEBw+XdaeDF/72XDoOuuHODDxxp6TDQn/zuyKsYuhUUu37GxtUbk4IL0+OVuuHMOV6/CXNb4eIudKOFwE4FXE6XBUUcu+FiV11ZE6kIWW+KYPlX454Oafz27QDhrQ6u1Uic30SlCc9i0+BgbcUg77NuhFwCs2b372EU8L3ap/aMk5eALR159pwhxG4hNAWrphF8rwAC1BmQg2d/iKzlY83HsAR8hb2yPk/xqeS19oghLlakcwA72Gg2gNevxaKb09hPiuH4vjeveZ1I1gsCDe9MBHYkqg5glgerSmehdi0sZEYvIe3RoDLla0DTGCJQaUIHm7q+4oIfezoqGskKO0MyyebRDVGvMX2/pFMQX+hS+6MQ2bUCIY9jEkZYIeYdqAyPjRs7qdYY95YgFI5LGEZVMQwuvsTUICiDab/xZihPjRDGV8FIF8AgmhFENs0Z+H709IdtBCyfWqtFOapgKTeMiLDbv4Lw76cLAPtiy8d3XbcUAESAd0cpIASamM9Oljcdu6EU9u1rC2yfMDMXmBFzVKYhMpa3fCb7OHLV7FHMuI9fA214DgDNxUU8nyFjDZbUFC3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31696002)(36756003)(8936002)(53546011)(4326008)(5660300002)(316002)(16576012)(956004)(54906003)(38100700002)(66946007)(2616005)(26005)(66476007)(66556008)(186003)(508600001)(8676002)(4744005)(6486002)(2906002)(6916009)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1F0dG9kK0VZMGV0Kyt6YSswMG05WXNNdktsN0I2YnIrM1pJUDZmclZGTGhY?=
 =?utf-8?B?WHE0akk0N0JWUExleThvUkNtS0JkVEtzaGduQjJ5eEUwUW9hQ3Z3Y3ppaDlI?=
 =?utf-8?B?amRvRldBa0pGQWllV2VjY3hNUENQZ25ybTdFTzRxS1U0MWpSbk9uQVRVb0VR?=
 =?utf-8?B?dlJabHRLYXUvRnd3UmNwUTczRFpta3B3WFJzTk01aS9ONFFRK0RYU0xSNnh2?=
 =?utf-8?B?eE9SbFlaeEprNmx0Rmt4aUdRRmRua2liV3JGRDRuRExjZG9wRldhS2duS0JT?=
 =?utf-8?B?MzllbFVWYytnY1UwN1E3WVJYb1dzdlB5OFVDbUdRcUhZMUJrbmszZ0srZGxp?=
 =?utf-8?B?OUo4TlovNmdqU1N4M3VZWTAyVXZsQ2xQS3kwa2hQMDArNzR1YXZKQXpHWExV?=
 =?utf-8?B?L3dqajdtUk10aTdyd1Frb2llVUtWUXJWU1RPcDJJcThMQmVObnRBYmYwbnE4?=
 =?utf-8?B?OTRpQ3ZqaHJ3ZU1nZkhpeGwvbkUyYXF4eEh0QVIwdmNGUHJVQnRqSWJyeVc3?=
 =?utf-8?B?bkErYUtCakR2ZHUzekJCT2VXSEh3Z2s3REErVVU5ZGlYV28wY3BGaW5UZWxD?=
 =?utf-8?B?ZlZQdHhXaDIrWW1ldHExL3ByTEd6REtzMFRjNHFjaS83c0VoNXU2d2RicE12?=
 =?utf-8?B?a0xzQWRzUERDV08wc05OZjR1eTdMWnJLRlljU2RWVmpmNDJZbllza3hKTWoz?=
 =?utf-8?B?b1MzVkJKSVZWZ1UwWk5ZSCs1MFNDL3c0NW52OTIyZ29lWmVURVI3OWFJRHRS?=
 =?utf-8?B?MFBkaUtBZS8xOFZpT3JCd0NCZFUwdzg0dUR5emxoQUhnZGdIRmQ4UE5TOXBK?=
 =?utf-8?B?dWR6d3pRQXA0dFhqMzVVSzE5U3VybkVtamRlc0pXUXhsaTVUSHZDUVFyUmVN?=
 =?utf-8?B?d2ZQc1h6cnQ4SDYvTGFzcWEwQm1OaGNwVzREeDRPOFo5NVRsY1lVTDNoSjdG?=
 =?utf-8?B?bG15Z2JTM0JKSjZkNW1RbWJmQmQ2TjhzVHZDMndxUWc0ck00QTJRekt0WW81?=
 =?utf-8?B?dm1KMDljQTF0VllmWENpSWc1QjBTQ0t4UTlVcm83NnVVK1VPRTBGMTJMUVRV?=
 =?utf-8?B?RVBGMkppL0dYY1A1bm9EM1ArejQ1Y25IZzJ2aE53Z1Zta2FlRzNSQkhpeXZj?=
 =?utf-8?B?SUh4Q1Z1YmIzNzJ1SWdaNVEvK21ZaEwyYjRsTGpCU2RBMGpGdW1jam9Dd2pT?=
 =?utf-8?B?anVvRDFsYVVORzNUZUo0LzlJM20zVWl4Nk1jWFdFL2xKQXlvY0g1UlpFYWpk?=
 =?utf-8?B?bUVFQzJpVkorL3VqYWpVUWg2QzZkelNId0N6RURTQ3NVY0t4QUF2L2RhZjUr?=
 =?utf-8?B?NUQ1bjByM1o3NDFPdS85RklQV1RVKzB0SmlOVFd2Rzd3ajRkTkU1ZkFxUXdJ?=
 =?utf-8?B?OU9tUGUxaDAzOGlkU0h3Uk15dlZ0K2tXTU13WFV3VXpkT2ViQUpBdjRQcVIv?=
 =?utf-8?B?eEVXU3BoMUc4ZUcvQ0tYZGpPbVRKbXJJMi80Q2phTUQrdy9ha1pWRnFRbUlS?=
 =?utf-8?B?dEVZaHFZRHNlOXRDcUx4RHpvY0sxWHJNaHRvOGdrUk9ON2JKU0RsZmpsUDM2?=
 =?utf-8?B?UjA3S0lSYmpkNEN5ZGcyUlZCbGxCS09jMXdoRTNZVk9rLzVFNFlJdVYvNnFk?=
 =?utf-8?B?UHEzUTh4YzJUaW1McG1jL0Z6em1QM0FrL2RITzkzQjRXSEhRYU5TaDA2enI5?=
 =?utf-8?B?cDZUOC9SRGt0cmVSc3hQa3VxRHYyYjNTQXNFOGZ3eFFyN3prdU5JeTFESDlF?=
 =?utf-8?B?bEw1aTZmSzZJblF3ck42SnlHRFNhZmhRVThhb2R4SEo0ZVhpQWVzeGgzTTB0?=
 =?utf-8?B?RE9iampvT0tuRUxyZEE5YWNBQU5TUWU2c1dlL2REMTFsd3k4K2F3RHA5L3ll?=
 =?utf-8?B?NHRuaHU1RXpsTFJkdEJvUFBmS2FVSzdZa3ZFUEQxNW5pdzhqejZ1MXhpaU54?=
 =?utf-8?B?Uy9kdUM5eFkxdlhidlFvL0loWEhPYXNIQW9nTjd5V0ZxYVY0d28vWllhSEhB?=
 =?utf-8?B?bCtQbjYzTzlpU0RKMWN6bmp5d2drRUNQZXcvZWVOTUNEanJPbXRSY21IMW5z?=
 =?utf-8?B?Q0JEci82bjViZWpVMGIyQlFzbjNYSitVVTkxOUc0QjRBYUJETjBlU0xyMFpm?=
 =?utf-8?B?VWszekF2QzR6aUt1VFJlQnQ3NXU1elk0UVVXZUZPTjViNU1aTmRHQXZqRVo3?=
 =?utf-8?Q?n6pct5Sx9eeveREXitam4uc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5418ad6c-ec57-4eb4-9a70-08d99dffe343
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 12:54:20.5994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q88YFJClPMjBy9V9X1TWZLseNOye4oMhPKfmAEuVCdu2VD31hTxmlCfJXTZrXOafcrbfTBGmJdeRm2YIZu8sFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

On 29.10.2021 01:26, Andrew Cooper wrote:
> The `ljmp *mem` instruction is (famously?) not binary compatible between Intel
> and AMD CPUS.  The AMD-compatible version would require .long to be .quad in
> the second hunk.

From all sources I have the incompatibility is only with REX.W: Intel
honors it (allowing a mem64:16) operand, while AMD ignores it (using
the same mem32:16 operand form as without REX.W). All the same as for
L{F,G,S}S. Hence I do not see why the present form of (32-bit) LJMP
would be a problem anywhere.

> Switch to using lretq, which is compatible between Intel and AMD, as well as
> being less logic overall.

I certainly don't mind the switch to LRETQ, but then the reasoning
will imo need to change.

Jan


