Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1BB5087D0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 14:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309203.525231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh9BA-0005qT-N4; Wed, 20 Apr 2022 12:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309203.525231; Wed, 20 Apr 2022 12:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh9BA-0005nC-J5; Wed, 20 Apr 2022 12:11:28 +0000
Received: by outflank-mailman (input) for mailman id 309203;
 Wed, 20 Apr 2022 12:11:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nh9B8-0005n6-OB
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 12:11:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 000c8730-c0a3-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 14:11:25 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-uwfWEGX1NVaOfO9FUaof_A-1; Wed, 20 Apr 2022 14:11:21 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6451.eurprd04.prod.outlook.com (2603:10a6:208:16c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 12:11:19 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 12:11:19 +0000
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
X-Inumbo-ID: 000c8730-c0a3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650456685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A16MhQKcqURxxiTCYMO8bhIkjnzMaBlJC3Y088Jwy3c=;
	b=lw8JrDsXjc1AAJYR4OOjket6lnAoPh1VULe/xakCPhwzsByLe51YWwVemVs5SRXTHlBtfs
	zGNxCMg69LSuN207w9eH3AL+R7tm2+82m/fPz1489LHnsMttiw97Xfq7/SFEQf5QBEhVR8
	tCiwQRs0JZCFVi1I0hceWWsMdFqTrwU=
X-MC-Unique: uwfWEGX1NVaOfO9FUaof_A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnruhpWk5xsIoYcAH6YJ4eoNzGPvlrNrpBvTrxZjuknnAJ9UBNJNNyaT/NMiMrsyaW98Mm4mXZee3+GAbohPUWiqpwHRWM3sdAF9KkkJYLXmzqK28FKQxZN8CHBHRDaFT0Qs/sct2Duac3rZnPdUa1OXFKJM8igKA+XLATjNpv9rlzCpVmt0HoVWc8TBNZT0Vg2WoOgQEx4WBte8skFxd0qkyBTVxs1pcHvkIgjkBCJ8GLoWa0UP9mViPteD/4LQLkJ8jRr2ymdPuUSDYv2xGG6tQZmgEAfa+a1mouLUoqGsl9JUX44zz5aiIZO0O/bqvcuuB3F7ADpKCDoOh49tkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A16MhQKcqURxxiTCYMO8bhIkjnzMaBlJC3Y088Jwy3c=;
 b=CvHHQA8Q07gLKNWBt//t+/xActUuiaTbTjfnJ86QnHop7unaUidJprzMNNHt51QV1iUJP2sL+k1/L2pSd2wPUgenYX4Q9qMttzqRsZuZvt4Zb7RgBXeZYF2qGXlbpkDkry7vwkWpU0zLtxG1GeUCzMh6y/VI5ryA2U5FREzOKDAjkE13qDi1sO16p04azIeA5gjRk7XHydpnfzC9F75nd6G0vjA0MJJfH4NbaOM/ci8k/kp0CM8fGtpH/Jw4ytdXIQGBeIdh2NqDa/SnPyv3ts7gPwcRFiXBL+Tfv7bxnKQ+ZaXQw60ZFQaqTdPMrvmWYIQOMhm0frPLJMrjYRjmTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d2c6196-cf87-dccc-a84b-8ace1c4f1a42@suse.com>
Date: Wed, 20 Apr 2022 14:11:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1.1 2/3] x86/build: Don't convert boot/{cmdline,head}.bin
 back to .S
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220414114708.4788-3-andrew.cooper3@citrix.com>
 <20220414162739.7251-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220414162739.7251-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cdf00e9-f766-4db3-446d-08da22c6e05f
X-MS-TrafficTypeDiagnostic: AM0PR04MB6451:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB64510D0C5F9CBEB916265ACEB3F59@AM0PR04MB6451.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mrq2j8qpSo6M+2e74MnYZUsoSFGwziuzCHk583GRD4FQBewZX635CEUODjRbvSHJtIOPS/CxhSJgCeSkSLy+hAE91ZM65V1VQZmurlptwaHemjdgfGTwZZaXtfTV49Ux064/eyoqdIKORx2HwNU+XX/T1zu5L9XkfkcFvKainRD+y0Nszq2GQeetuQHkt8+nSS3iZCd39n5eGvCc0byWs0LL73weD13ljhHZ8PXTFS54uHyZMTAc+BP86cDmlUSWFJSE/dwYT/nhWYYu+UBDICp83vf+3+b1/NRSSt9nPsR6mQaT5W/4KgfHQ7wU9lrC4nRLilM8b+4wREGQ0PXsKzkvI9ZPbaukF/Hj88RJHDnP8wsc9uda+5jjbjNz9ixqwvvwcyONojXUhREE4IiA2hN2rcgoU+TrEUXejwG0zQ+ILDC/W+ZRoSsnDPMHeI3gkHg5Tw1Z0Vk0kM6WrWr7zwbbweBaDV1se8hbThfBM7jchtrIYyQgs90M8ElYsC8fE7bGUmj6Y39w/EzckeQT6Yd4w8Wd+M4wa8u/rB1+r0PHvwvRuAICaIEc2KrkoI3IS5mmXtAW8m/Clpggvvjp5PMY3h+Ot6jj/IgfwhetWy6NbGMY8C5Y8EN/3ypGjiqT97/YiFe1y5yJIbE7K2ST3PfV02KktuHEWINK6e4XHYAn945ty/iBUkf+ddQkbFTY8fO4qXPXElCgvrFoLgddgAYWzGhbFeKQJCssEqR6Nio1UhCk/mzjiwP2l+rF5zKm7W5adYhrWZZbReCF2YinKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(5660300002)(6506007)(4744005)(6512007)(6486002)(316002)(38100700002)(86362001)(2906002)(31696002)(53546011)(8936002)(66556008)(4326008)(26005)(186003)(2616005)(8676002)(66946007)(66476007)(36756003)(6916009)(54906003)(31686004)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW1FQVg3U2xsZFJyOXVIRXVnVEpqdUZCS3BHTWZGajFWK25uTVJCRUYrS1Bs?=
 =?utf-8?B?MWh6cExaemk1d0pQQ3djSldBeFNJQTlDVWJ1SytEa3RCbEx6ZHhrQllDTWxR?=
 =?utf-8?B?Y1hXYWhndjZmL3RRZUI4QWhIcGVqU0dEdVNSWkJCenNxSFBDY3JyY2pEZUlj?=
 =?utf-8?B?S1BqNU9zbnBDTm0rV1hGdlZoQmZkK2s4d2ZzYWpUdm1MTG15RFlodVdwV0Zr?=
 =?utf-8?B?NDZ0ODVTczFqb085RVFwaGZyWDZvcGpBYzBybk81ZjFTMVIvdVJvZGxBa0lU?=
 =?utf-8?B?TUNrTlFtUm5mL2NPOEgwV1JraHlxQ3VZdEd1TnorNFNtSjFpSW8wUDFjTDVq?=
 =?utf-8?B?Z210aFc3Nmg1T1kzZUgvTERJK0g0LzUvU1BRaGlFVDRNb3B0ZnUza0paQ0xO?=
 =?utf-8?B?cVhjOHdMMTdBMThOY1NLbWwvQXJ0SW1XbmdHTVplSk1YN1lXazR4RVprVTNM?=
 =?utf-8?B?OGEyWWdDOUNtdWVOd2ZFUXZNQ21jeWp1eHRDcnFyeEpUeDR5K2tQcXpXbHBW?=
 =?utf-8?B?ZHkyaktKTjQ4ZWNYeG0rUXY4OHh1SUhXRjZlSW1ncUZ1aWtDOUJtaWZyb0xz?=
 =?utf-8?B?N2dNNU5RT3lGcVFyeTExbUZqTHFITDVzMW02M2t6RnN5WFBvdTRNMkc1R1Rt?=
 =?utf-8?B?M0M4UkpTZnNKcmI5djdhSFVtUmlubzIwaU0xN0NHNldVd3BDcnVIK090YUNF?=
 =?utf-8?B?RmxEOG9FUUdyTnNxUGdEcGZ5UkxKM0VyU2VNM0RpZ1RVZjBBQkR1NStSRHVq?=
 =?utf-8?B?K0Z1MU9PT2ZTWXlPVHVYbEx0cWZRYTRHb3FIS1U1ei8vTWU2akFrSU5sZ2ht?=
 =?utf-8?B?OHQwK1NrZ0NYc096Mzl1QzN5WDlZN3pybFd2Vk1RNk5IdGZsYzBLbXVnbmZQ?=
 =?utf-8?B?MnFqQ3VVbnZLNGNNVG53aVI1YVd4QmYyWDlqdUFxK1NnVnh2YTdBUjVyUUFr?=
 =?utf-8?B?L3BXRXJJaGlZdGFUY0l1b3lkRXlyWk1hMXpicXhhaUsrSUEyb1NzRmZxR0JK?=
 =?utf-8?B?NElsS1lWVFdwYUNSOURIRlpTNUFyL1Z6SGVtMVBKK0VDYkpNWVRPRzIzODlL?=
 =?utf-8?B?cFhzbnJUVXlhMGFzR2VaTThiTkF3bnBLaHdPeExrR3pWMnpSZE5xcE1TaDEx?=
 =?utf-8?B?eExNLzlhRU56ME1ncjE1cnhZOWs1MVVxbkdLcEIybnRnWXNyUW9ZSmptais1?=
 =?utf-8?B?NTNGb3I4TVJFWFozSm9oRE5yZzNSaFhRdmNrR0UrQ2dHZG1rZEpBalRKQjlh?=
 =?utf-8?B?OEszNklOdm81VGU4eXh5dVFQZ0c1WU40ampkNGhIS2RiQno3MVVwRS9TMGhk?=
 =?utf-8?B?R2M4KzNKaWRVdHo3b1VzTnNhaW1iTVZsaDA3TmpNeHV6VTFJcHB6YjRHVVV4?=
 =?utf-8?B?QUVPTWI1OEFleHpEc3c0cDZuNlFqMWlralgxUktzb1pCZTZDb0RQUStEdk1U?=
 =?utf-8?B?REtXazVITEtzVXdQWWNvWlZ1THlGMXJOd25VbXZXK2tadm4wUCtIdHI5M0lj?=
 =?utf-8?B?RkFWVHp3OWpxNGR6UG5JM0lqclJMclRsTUVNNlBuK2tKUHE2YkR5bGk2VnYv?=
 =?utf-8?B?QjNaZWM0TUgvU0NFZmpNRUw4NDd6clgzT1VtOUU2Zkk3WnJ0U3J2ZG85NHRI?=
 =?utf-8?B?dnBxRlk2OGdDbCtSaTIrcEVNSVdva3NLOEV5WU03QTE0bytjaTNzWGE4emlG?=
 =?utf-8?B?THlQcXl1eVNQOWdwaHR4UHpDTFBETEZ1SVBTYy9tN0N5cmcwdGpRTGRJakZt?=
 =?utf-8?B?dWRtV1pWUS9hdjlNRGliVHZ0Y09BS0ZPeDRuTm1BbjhOVDZzWHVZanZkcDhp?=
 =?utf-8?B?MTF6eGZQZGZEVStnU2RVM01tYjhTSzRLZVZoMmdTYlFmZEY2OUpaSEJQUk5U?=
 =?utf-8?B?dnE1TGxBcHRoZTlwZzhiaFJ1SUVZNVJOd2xyZk5HdnQydXJnSTlxai9yZkhL?=
 =?utf-8?B?MzRaSEdpMnU0Q3V4UFYvOHlxb0NqSGZkQ2xnWmtvUW92Q2dOeWhONFh3VUp3?=
 =?utf-8?B?dUVxZVkydGFMVG5IMzlqQnprcVUwbkxJSG16ZWhQUzd2NTFldVBSZnlGcGI0?=
 =?utf-8?B?aUx3anJ6eHAyWk43U0kzUjdQMnB3bThRbU9kWHRKTzRqRXhxNEpwNi9jeEtN?=
 =?utf-8?B?VFpySmtITTFUZ3puUGFoZlhhZHNQeXNubGtnZjRoVnZuRHgybGc0cmxpUFZ4?=
 =?utf-8?B?L1lpcnd3YnZUTnJ6NUg0SzF3ekJ1MUVRQXhJbzJUaDhpU29PNlIzTnhhVTRx?=
 =?utf-8?B?MUt6b3NQb3ZkblNTYVFueW5USGtSWHowM1EweldHWnR4TDQvUnpacys0YkFI?=
 =?utf-8?B?M2Z1aXoyNlI3dUl2ajgwUjlrdnJ5b1BkZkt3ZjF5ckFMMDRmekEwZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdf00e9-f766-4db3-446d-08da22c6e05f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 12:11:19.0805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2z4w9bvIwH0nuYlt3bMqNs8tYKLOUsdNk9Ws6odGZEBaprKr4Fc4s3X46Jsk/srbo6UjHHuV0fhok/wy9zjMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6451

On 14.04.2022 18:27, Andrew Cooper wrote:
> There's no point wasting time converting binaries back to asm source.  Just
> use .incbin directly.  Explain in head.S what these binaries are.

Hmm, yes. Why in the world did we do this all these years?

> Also, align the blobs.  While there's very little static data in the blobs,
> they should have at least 4 byte alignment.  There was previously no guarantee
> that cmdline_parse_early was aligned, and there is no longer an implicit
> 4-byte alignment between cmdline_parse_early and reloc caused by the use of
> .long.

There's no alignment associated with using .long, so I think you
want to re-word this.

Jan


