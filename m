Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592837CE197
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 17:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618692.962674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8ll-00020w-N6; Wed, 18 Oct 2023 15:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618692.962674; Wed, 18 Oct 2023 15:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt8ll-0001yT-Jq; Wed, 18 Oct 2023 15:47:37 +0000
Received: by outflank-mailman (input) for mailman id 618692;
 Wed, 18 Oct 2023 15:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt8lk-0001yN-Ld
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 15:47:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7875558-6dcd-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 17:47:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7972.eurprd04.prod.outlook.com (2603:10a6:20b:236::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 15:47:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:47:32 +0000
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
X-Inumbo-ID: a7875558-6dcd-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jX2qMofryQ7vCxL4nOScMc+120TY9PFTMIId9NJFb3kpH4OVmUak+X/7Bm5YfDbN7ZP/l2PLFZ6rTZrpzLCnfkSS3ot7wd0QSVpk2mUOxj5cEAvv4BYG1KzZ9OT3qBUSk8rfVQqllB76mI1zxqrfLc7scqM1SK8WM0CPXJG7gTNbkfkrdIYLzXvCpz9F6cUvDRQVVicaEoR1HBiU8hscydOjlG51DtJwhQ2Vr2VVkImfJQMa8CPRZfaGaGqWpFlH1QJGv0h59av9DBlg4ojpSVC0bx7AQWfRI4w78xi8lGyr2aItkExLHdsthaA6C/hFDh/3HTmmi4M0mkQj1zcKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzmgHrTUarUxfoFbbaKRndc6kXk/KvE64RBoKg+dT8E=;
 b=QIGGZgWU3RhwCtA9JvtqxVVXdNatGiW4s3YSIW3goGfRXWmTE8B4Z4jCA/ElDWta+TkTtVn8f8iD6Iy6JM9LpQ8JTqSyVU7OVG4mbQ0o7ec2BLWHdx0DfBy4qLgYPKNPmjbNp3DXJ7xF9oTj4CHYqFfgty5absf/8/7iTrMuReuoqewszBeTux9dG5j61NyQji5dMtSI3Xz3vqY2hnHFglbN1N2G3jBdrTPtF+T/G78MmadGpZCFdAO5PgkFx2168A8njUHMS8ByNME/BxeN8y2vcM7izNYD3EPlGJhw7HKwp5FbUNPU6JnnBLXfRpjNb4P+kkMtGy0+Az08q4Yw5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzmgHrTUarUxfoFbbaKRndc6kXk/KvE64RBoKg+dT8E=;
 b=Rcc1KGzW5ASeBoktkGm0O4H7WSGgNyYSX8INNjcHOpBi1K/gbrfDbLXWP8SIawRx27fdPCLu5KGuQK3G51J1Lq3RmSOm8PZCcHgKmt9HXkvoNvo9xmK7oRFKPWTwyC71pu3sfGqU4FLzgnA5m2J8jeIxB5mCUmD7tj3bWyuSLmV1rmg1gE5/wGYIl7Do8Pcvk3WHpwjbMNZ8fO9t3Xe6vWc40YaGMk7OZKwLqNgZH0ObbT0KDgpkHcU87hFlc6wofNQjzn9Y2+Md5TWtznhIp5j+gAs7Y3Y/qbMiISrj1Yl+y7MAwCpg0v3IxOTAf/YTilp9G1KW6dr+3KIT69HpfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03f6b4e4-adb2-db15-c07f-532d93254fe0@suse.com>
Date: Wed, 18 Oct 2023 17:47:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 01/13] xen/spinlock: fix coding style issues
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: javi.merino@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231013094224.7060-1-jgross@suse.com>
 <20231013094224.7060-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231013094224.7060-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 43187838-5ad8-46cc-f293-08dbcff18a56
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ll07Q1nrmnDHrL6zf0ksoWUhdfRfvr5YVahIpV2MzYZSeN8S2kEez6cxKcsXFflsjjUj1kZvZuSk5gUS7WQrx6ImkJ2tt0L5lgb9eyHpWWhDB/e19+PAboEe/ajbOIhEDcWMEeifHnemwqy4ZVSPlPea6X0PAlSwGe/1e87xFiuknS9cZHZFf4ue9GyUjjcM+pQ5SrZESFVSWrm9PhCSa0s9Io1YoJl4nEU1oT3Z+etPtEqFxL6+R2XXSU9zmOA1R5EEOGDlWsr+pGtQSt6878OfUpKoG2Hvj7Abiyp7vDQwRfNgOunfuqEssigrrlT3iF7GK8R/WvKRJeiFkouq4Gfda1L2oV4H9QjltI17FWp3cuYeLAQUgukjJUWkZ2DY24ov/r/Y4K6IrUqEzjCKAXhQ2l4hdLa/HIfTtqGTFGgUTW9DQuUDh7lm0PvEyGcko8DsuTbO5lkKGxaZG4znZYsyAwPdwhqrTsZ4IJpuLcSUUTIUdmOOzaZN379V8aFBdZi4xCxNWQy2ZrGLudaNVaQHh5yHTT50qrwZzzgUkqg08aDX1fZVc4oAKpDrU64X/qrBeXSAC+r0uorI4tutzYrKuP3uRaP+xIMI7sJD/ul3F8dcCdxxWWvXq36eru1xekFblbbIS7O8DOH9mWDHOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(31686004)(4744005)(53546011)(2906002)(6862004)(36756003)(4326008)(8676002)(8936002)(26005)(2616005)(38100700002)(5660300002)(316002)(6636002)(86362001)(478600001)(6506007)(6486002)(6512007)(6666004)(66556008)(66946007)(54906003)(37006003)(41300700001)(31696002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zldsc0EyQ253eDE4RmYwUTRWdjdkR1FjVytjbGZyK09aZitHZWZBWkMrK1lU?=
 =?utf-8?B?eVVRYXJVN1daSitPODNUSmJFditNN0ZQZkNHT1M3azVtbGJCUVRCVW9iWERq?=
 =?utf-8?B?VHB0WHlBdjhtSjRHdjNYT0puSitDOFZzY1RuNDJSbmtNdFFUMmlGK2k2NWta?=
 =?utf-8?B?eFVYeDh0K2JRWE0zeHFJM0tpZEhwc1k1bURMQUsycTdwWlZMWWxmSnJkbnQz?=
 =?utf-8?B?T1JqVERkU1QweVRlQ2ZUQ0hrVkNnMlRyU0dBb0lPeWVJbkFYdUdBTlJJaC9S?=
 =?utf-8?B?ZjFHV1BTd2ZHQWxkRWZDVFBYakZBUExJMmd5eVlmUzFGY2g0TmVZV0UwdllZ?=
 =?utf-8?B?V004MnBjdkp1N2x1SmV5QytWMXdZODdKM0ZNd1hBaitEMkE0WXBFR1JLNVJi?=
 =?utf-8?B?SXZDZ0dmTXBhSHF6Z3QzK29wN29MYk5KMEJON2hybWxNN0dJWlhVVlR3dmhy?=
 =?utf-8?B?U1RJQzRnNk5QWmgwN3ZTU0VzQ1ZkTHlWeEpHT2ovWlNpVE9DQktNZ0JMUC9k?=
 =?utf-8?B?bmNFb0trUmNsMHlLT3hXNVhOMjgyYTBXUUJhZzRHaHJEeElIcDVSUzRqWllt?=
 =?utf-8?B?TXZBS0xMVTFUcVVQSUJ4UFRVSW1jWFBCYTFCRWpadkc5dHVQSmlORElHWUZT?=
 =?utf-8?B?dmpIa28yT2xMYmU4RzhabDFrblZ3citQT1JuVGlFaGNvUDNLbmVONTVyS2RB?=
 =?utf-8?B?TzQwTUlCRTB4c3ZSLzBnVDY4Mm5YREJvN3Q1U2VNZFpva20xUFdXWEwxa2Fy?=
 =?utf-8?B?QWxSUkVjUWphWEFwb0k4bVo2TkE2clZ0ZkpCRGRMU29kamlKS1dubEVRRHZi?=
 =?utf-8?B?RzdhT3FCWHNTMTNOemIzR2NhT2FrK0YvTnh4ZmVJd0JTTzNIQWJWZUZrY3Vp?=
 =?utf-8?B?dGlwZmlySXRDd3RpQmY1ZkRsZXNES1VtZytQZkw1NEFsOWppZDF3RjJlZmt1?=
 =?utf-8?B?OG5ick5jb1pVZng3UlFVbVJtc1EzMVQwaW1uMENMQ0hGOGFpbGtuU1dnVlRK?=
 =?utf-8?B?YnFJS1lwZHhKTU9SWDZnS0pleTVrMGF4L0hRdkRpU1MraUZqRzRZN2hNTkhC?=
 =?utf-8?B?RXdtTHVrSTNKKys4UUtWYVcwb1hpWDQ0YjlHVXJwbzBZYjVHTlF6cVhYWTBF?=
 =?utf-8?B?bXZUbzVlbDdxMCs0eU1YZDMzc0NGL2xtSkdSMkZQdnlrNlN0cXV3MStVY05Q?=
 =?utf-8?B?N2ZtT3VYWGgxaklQbjdRNTBMKzlXZzJ6SkJ6cW5iSm1wNWpHQXFITTB2UFlO?=
 =?utf-8?B?UFVOcFlxcWhPeG94THNFR2dUVUQvWEx0cms2ejM4ZVd1NFN1WnRVd1JJeDRK?=
 =?utf-8?B?Mzkwc2NONXlCSmx5dGgrUjNyaTJhdEh4dGNPSXRidXo3bCtOeGNBSWtlQzRX?=
 =?utf-8?B?dFQ0cTBnTzdhU3ZhYnYyd0xrKy9ZYUhJVktveDZ6QXZCSG5zdTZkcFdZb2ov?=
 =?utf-8?B?OFdqdTkrNDBqQmtUb0ZUeWdVTXZJaWI2MWUvOFZwdktOK3NuaGF1Y2hYV24x?=
 =?utf-8?B?ano0TTFSNFl0VGcxbUgzU0NmQkUxNm85aS9LSDNVczJsUmsxdDh5U0RQdFZW?=
 =?utf-8?B?VFltdDFaSFBMT25tNHdCTHA4Rlg0NnAyYnJ0WU9lN1VDWWFHQkYzQTRKREFF?=
 =?utf-8?B?eWU1Ny9icW1pUk1pRW9xMHFOUm4reFFCNXRJQmNJeFNDUnJkelZDRlpOc3R1?=
 =?utf-8?B?MkV5aWE0MHF1WGMzOC9SWnlob0RObloxb01UdlZJQStNcUF5TDRqbHdXVEE3?=
 =?utf-8?B?dGlYRDByYUVmeHZvMGx3MDFkdlozcnJiYW96UEFBbktqTXp3RjBBM09GVWFj?=
 =?utf-8?B?ckpRRU1rZTVjRU9TYzBmWFUvVWt0Ykp3S0tyUm01VkQ4clVCeE5heWx5N3Z6?=
 =?utf-8?B?N282b0k4eTNzK0FDREtQU3FGTkhKcW5wYmZPR3g2UGdFbWtRRUpZc2lMNjR1?=
 =?utf-8?B?d0RUWmdNREl5VnR2bmV2QzllbnlVdUJEbytNSTEzTWFLdHA4V2V0ZytWNXVo?=
 =?utf-8?B?dzlHZktPRElUSGRtSFNEMTlBR2JpNUpWUEVZOGZmVjF4UGFMQlJlQmtrNDFv?=
 =?utf-8?B?NlAwcU91cEEvL290OTIvVFBIeVRoZzMya3kzU2JJclREVlRGWjRQUnJKV1Z2?=
 =?utf-8?Q?195ICbsJmNFY/yWYkVleRQkjE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43187838-5ad8-46cc-f293-08dbcff18a56
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:47:31.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dgE8Jh3V04xfDVu8pnjjPHezwJWh1s6hxsMA+PvweYmNJ0c5m5WA3wvzaFAwdcq0BZxdjUlJfIUmG7dIoV/dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7972

On 13.10.2023 11:42, Juergen Gross wrote:
> Fix some coding style issues in spinlock coding:
> 
> - Instead of u64 etc. use the preferred uint64_t etc. types
> - Remove some trailing spaces
> - Add missing spaces in "if" statements
> - Add some missing blank lines
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one possible further request:

> @@ -298,7 +298,7 @@ static always_inline spinlock_tickets_t observe_lock(spinlock_tickets_t *t)
>      return v;
>  }
>  
> -static always_inline u16 observe_head(spinlock_tickets_t *t)
> +static always_inline uint16_t observe_head(spinlock_tickets_t *t)

While there, could you also add const to the pointed-to parameter type?
t, after all, ...

>  {
>      smp_rmb();
>      return read_atomic(&t->head);

... is only read through. (I'd also be happy for this to be adjusted on
commit, so long as you agree.)

Jan

