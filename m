Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D72A791818
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 15:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595214.928699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd9ci-0004vF-1v; Mon, 04 Sep 2023 13:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595214.928699; Mon, 04 Sep 2023 13:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd9ch-0004t0-VX; Mon, 04 Sep 2023 13:28:11 +0000
Received: by outflank-mailman (input) for mailman id 595214;
 Mon, 04 Sep 2023 13:28:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qd9cf-0004su-Qn
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 13:28:09 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2649263-4b26-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 15:28:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7744.eurprd04.prod.outlook.com (2603:10a6:102:c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 13:28:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 13:28:05 +0000
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
X-Inumbo-ID: e2649263-4b26-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5UUdSQ/ksW/sesBg0bfUaLiEpasugniYBg/GDEfQQSvelPIYrKi97bzg/knwaVKNMHRiI9JSRmxg5LsBvtmlvyheO10rgmincI8G6Z5iwF+4bojqXufko3O/WqvWNRb0izgLOnWhEnJ4pCQaXrbqN9H8L7I7bLM9xQHltGX9UZiJavG899wVGkvG+nC6qd/xCFaBiddm4odcClhp3OVKUB307oymC/vsxi6GOCFwPwazqD+RoaqSGwirVfy38YBoR7dC2KWtucvoZRZhWxcA0ggpLk8yRu4hIo9W78a059kYKwJECIEnd2/cRAK5QXPo1anbWcu5Hi8zwmpfQOj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLZSnbVwolq8C8JlcoJNQrrEjOAt23yMtT6/TJutg4E=;
 b=ZKt/3pwNhun/2CEpyiOhp9emWCJD4+drzJVbuvuzrEEeXWxLZW0esw+asQrJ+p/bD9Gmw0rqX837pKU5dLDe045rqtdvZOXI7sWSyjCZ6QUcKWMeXo2OsMWUISFTG15NDj/QWhZ9LsU0yJUVx4l1vfgoF8ygAyvMupp9CGcENTXFCNkFUFbpyhKXgkVxl+3Rs9hWL717PI5JRR3yFytmY5oHLicz3iolxI45GMGPqz2QBs09D4jmGP3eGmOjrVVYvd85uV1iuPhHjFKnNZTCGVGRffMFN/RMFib0QPxYIsglruf++s4WwXGYCuqGmy9Fb2pyQijDWheRNUlE0vFs9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLZSnbVwolq8C8JlcoJNQrrEjOAt23yMtT6/TJutg4E=;
 b=v3xJvZq5rb3rzRJCmuFZ72JKqAV7gONwnCQd5OfnhMKU6HoJktLcKSUWVjXgsQEXyGA4H3DrlGo4MaBQVLJU6XAsWdRxLB3P/tH2zMHCAowppFmM43qhEzxds3W/dd3s2q9raFscc2ZNAmR90x4vjvBJZm4sPZlYOK0Pq3HIEnhxgWpmTjwXZOmbKkHGMZuO32epHI+ctFkKytAumyqamjqJHhDmu5QC8DzoOU935OCLFh+atJA8IhMSWAft88Sq3W232AB2qCIP5jmnZAeMjK5ME1KQ2NknBWI9gpde7CrmyNTukur7iIMmAeuS+VcaoU9aC4V1JRKIy9dM2pLPAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec00892f-d9e8-1095-fb27-c344caa6aa28@suse.com>
Date: Mon, 4 Sep 2023 15:28:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] xen: Change parameter of generic_fls() to unsigned
 int
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230904091406.942-1-michal.orzel@amd.com>
 <20230904091406.942-3-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230904091406.942-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 6efc8e7f-d07b-47e8-5974-08dbad4ac4f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Le0tehx0EOZfQAzf8QWjL5f9lqDWnPGybYfegC/kmVadVVrYUv4nqAUXNMtzhnk5V5w+K9ohqWDJcqymZ17u7ygeUyyVdS4PPvQtHBjySGhw8gR7Y8xTeRC7jrVggcuaFyftV6uRSoB3VPXazIKGjnIEAbaz8I/GeAJm9NwOL8+NYgo3S9hZ824WgpqGSs8v9qUmvQyc0J8DXxUAD23/AC6A8h4ld/rGDMC4p8X0tsiWBIwFbj6LmuiUBI2tYnyfHzJ298Mi2VtrvZeIiTQPntn66WRZgWZnGUQVC2wm5ibouLUUhoVbJMAcsx6bEn2Rszr7QFXX3TLPZ9XGkDx5seHhrSG8OAcz/DhcNcJcRYLQ8q0uAD91WCpp84WtkMQNAlDxHrPmg2ZJZ5XDNDfTUrkczhfQmTibvdvG4AnhPvT3fjnOr1RDzMuec0MKxtMBsdmI17jyETxgkcoo2dMvYB+uuDGo/C6lxiZjiPRh0qlaIwNK+meX2oZ98ILEEQ9N2KcX7BEXM9WTWO9rZem3bsSA2TyVUdIgaSArn6fpsEYaamSk0kQzBd1CCyXc/OpMQeX9Yi0VPTwbtaKpYkWwgw6ItYTMT2wSAeUvUgbezjLPKvsKDnNdMLov44tmyExrpm1AzseqlFJ/A7BySJVHP/0wI8ac58dD0rNbi7ToATI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(376002)(346002)(136003)(1800799009)(186009)(451199024)(6486002)(53546011)(6506007)(41300700001)(6512007)(54906003)(4744005)(2906002)(36756003)(316002)(31696002)(38100700002)(86362001)(6916009)(66476007)(478600001)(66556008)(66946007)(6666004)(8676002)(4326008)(8936002)(26005)(31686004)(5660300002)(2616005)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUdIRlZVdUFCdHFoTXlLb2FmOW4ycldjOXNzMkFoKzFEdUo4L0IvYzUzdFh4?=
 =?utf-8?B?YUxNcXRNb3RPRnJRNzEvUGxIZ0tqNWF4V2JYRjlGWHNEV0RuV0wvbllIbVZo?=
 =?utf-8?B?V2ptWitvNG9CYXgxK1FvQXpoeDNPNnVHMG9tVitDTXZ3T1BBR0ZUV2lyUFBp?=
 =?utf-8?B?S0NTYVVEdlcwWXBNU2RISFBDdm9kUXFQbGtyUmtLd2xzSmNTZC9QZWx6S3cx?=
 =?utf-8?B?WTdwK25Ja2Fpc2hHT0RUN2hkbGNSNHVOb2dqeWFxdjcvVWN1NWhZT1Ftdnlx?=
 =?utf-8?B?MnYrMWlwNXRBVFR2eExBT1hGck9iMC9acXhoVUFXckhDbTF6dXJYM3NveHB2?=
 =?utf-8?B?V2dZYTVDMldTMHFYTDNjMG5xQ2N6YkxJcnUyNGtvZTJCQkNJcTU2VWRHUUNN?=
 =?utf-8?B?Z1JHZldUSEF6YkRlWFVCSXVoNzU0YS9KdHlFbHZMMm55NUVKUnRvQlZPdXgx?=
 =?utf-8?B?aVBzd3ZOZit4QkNkeklPM25DcVI5aU5abko4RXJPVFNaa1BvRHRsNWhKaGEy?=
 =?utf-8?B?cUlkSXYvZFhieE91UERqVzdncDIxWHpLUkFURThXM0Nac0ZFeHdxUk80YU1q?=
 =?utf-8?B?Z2k3ejg3OXlaZHd6K0tCZlExTERITUpCUDZZK2szSURsRldPRldpTEk2UEMy?=
 =?utf-8?B?djloQURCMlFmc1E3ZzdxaEl2bExxWWo2ZUZvZG9hUEVRUTUwTnc1b1lGZm9v?=
 =?utf-8?B?ek9vT1lmQ1EyNll6azg4eUwzK2xYeUFGSkdHMFpnSUFBc1dlZHJObWtGWnF2?=
 =?utf-8?B?RDdpaFhxVVRHYUxaZldla0pZQjNPNUZ4QkFORjZZVnZqbm1RVTF3Rlc4dDQ4?=
 =?utf-8?B?Z1R1SE03OVU0cEhiMm41WHdLcGdqcWhkNkd1N3FWZDZEalJ3VTRYY3NveXFt?=
 =?utf-8?B?elJrT2NkQml5VXQvWVFBWGRjSmtkUzZ2S2hxd2JiazlKVWpSRFA0K0gxOW9W?=
 =?utf-8?B?ak9nN3g2OXk0RVdiT3EvYXZPNEFxTzdBQThjeEEyRFo4UkJIS3pTQklNK1ZX?=
 =?utf-8?B?RnIvc3B1Mmd1NThDT1NCWGlkeUJkdlVDbjg4VW9lMVN3ZVA2RTJhSkJMdXhV?=
 =?utf-8?B?eGhNQXBRL28xdnpFK2hTMldlNk1zRXlLL21MUnI3cnhQUEx0cHBLQTVrTnVm?=
 =?utf-8?B?eEdTdDJMMnVzVjNPZnRjWVcxaWJqT2lkNnJ5d29vUEtVenpQSlVxN3AyeldB?=
 =?utf-8?B?YXRUbU1mSFdJelRiNExSODhXVVgxdjJwWDl2KzcwNlliUTBBMitZcGZEeE5j?=
 =?utf-8?B?RTdndWtoMWZEUkNOUFRVMWRuQTB2Mldib0lKTTE4YUNnVGdTM1RlQWUwaEFU?=
 =?utf-8?B?aUhZSmRPRFU1azVVWTVxQjhEOGRuUEx5Z0pqRVdzWjNOWE42aEk0RUVJYnVB?=
 =?utf-8?B?bFZIekFDd29mNTcwam1YelRiWnpXaVU0V3hIMy83WmRMVWVTSHhsWHZvNHZT?=
 =?utf-8?B?bjM2UGd0N3ZpU1NXNjhWRGM5ZDJkdnNKVkdFY0dLaVN2UVIwaVFMT1VXUHdV?=
 =?utf-8?B?TnlQaUdLaUk1TU1lUENVaHVKcHJVa3dqKzNvTTJjZDRweHBDS0ZMM1d3OEhl?=
 =?utf-8?B?VVRjdU1ob2w3MFo4aENQVnFTR05qV0VUZ3lSTkZGMlNxeGNwTzFYR0kzUCti?=
 =?utf-8?B?dnJ2SEJGNWVOQlo3ckd3TEg3eS9xTHdHOEs2M09WR1pZQk1RTWFRa29QT0hX?=
 =?utf-8?B?bW5RVHM2N0VkWXpkaEVQYW5DNTVCL3ZlZ1lrdnlQKzFOdTJ3dXdZaFQvT1JD?=
 =?utf-8?B?N1pmUmF1TjhOM1M3ZGZQZWhpWXZtN0VCU29XV2JTblZZNkticUhSTVp0UDBo?=
 =?utf-8?B?SS81akZvazdjQldpaE1KOTNLSldZNUR1c3ZKTDJKOVNOUDZSaXRpek5KdVBj?=
 =?utf-8?B?V1BvemZndllLS0o2d3RrVlhPckRjeWdkejV3M2txUDVoQURuM0IyTVdCZThh?=
 =?utf-8?B?VlBLTmUyU29UNUFxbFJtbzFUQm9lM2VQUVY4UFpzaHFjWU9ZVm9lR093Mmwr?=
 =?utf-8?B?SDQ2M1FIa2FZbTNWT3Q3YytSUnlaSFFGUjBqU0hmYzYzcGtmNVBNd3o4MEdr?=
 =?utf-8?B?azBPajF3RFc2Snp6U296Y1BadDR3alF4RzhyZ3pCOGZvd2lCd2tjNkdKcHlj?=
 =?utf-8?Q?cpC5P4hLyDmYGE8h1rJHHpSi4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efc8e7f-d07b-47e8-5974-08dbad4ac4f1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 13:28:05.5673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24r4NBayT8q9nmHnOjFS2oSgGokFM7fOJ2973uToUY2VtVy4nOYs4F5migmJY5TDT0K11ckVYqh1NcFiF5gYFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7744

On 04.09.2023 11:14, Michal Orzel wrote:
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -51,7 +51,7 @@ static inline int generic_ffs(int x)
>   * fls: find last bit set.
>   */
>  
> -static __inline__ int generic_fls(int x)
> +static __inline__ int generic_fls(unsigned int x)
>  {
>      int r = 32;
>  

Even if perhaps not affected by UBSAN, generic_ffs() then wants taking care
of as well, imo. If additionally you switch __inline__ to inline, things
will become nicely symmetric with generic_f{f,l}sl().

Another aspect that may be nice to take care of at this occasion is their
return values: None of them can return negative values, so return type
would better be unsigned int.

Jan

