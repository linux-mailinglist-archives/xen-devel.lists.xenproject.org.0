Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881E06C4AD5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513417.794361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexjr-0002PE-9x; Wed, 22 Mar 2023 12:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513417.794361; Wed, 22 Mar 2023 12:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexjr-0002Md-6b; Wed, 22 Mar 2023 12:38:47 +0000
Received: by outflank-mailman (input) for mailman id 513417;
 Wed, 22 Mar 2023 12:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pexjp-0002MX-HL
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:38:45 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b929fb8-c8ae-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 13:38:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7066.eurprd04.prod.outlook.com (2603:10a6:10:12e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 12:38:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 12:38:42 +0000
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
X-Inumbo-ID: 7b929fb8-c8ae-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvyCq0h8YdhDaxkp5lXlTyv4d8oaz/U31pqqvD/oyrlBy0joKKiYBpZ7sYwoZ3u+ttO5khh1nXJJKxF8t+q5AGNz+I3JFe+yYKhVS6FFKVJLF+VpcEVVoy32+ERn/WPPj83GAjW0tK56zEE8x3mPSRSjFUMIqqeWkNlYc6jyAsAXIjvY7zrLQdZWCxQzs9OJNH02nmJxBWAjsvmayZiuMB4xkbtV8tTqBBQgZ7cwtng03Kw8ikKRBVkwldeaLv7WPaeRVRHBaCsSE9D51UztCXIddvpDJITzLE50CL/Ehl3R2B/WhWBp6tkmr2Yy6wdJ51C4GDjW88uXNIx11w0XqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhCfI+UJ6kcIvxOraok5+HnXpJKlc47SPJr6cW2N9JQ=;
 b=lC6mYk5nIp6+Yykm/EvBoBxfX7DJPq86vEbbrUs6XfNvFa54otkaNVfnlKlOPsB+pzJ8vWDdh4xxCCJr2sZV9DRAouGnFQjZDRPTuE/GzEHBUk1kjil5h5B7g6ty2kSulgOP5Xvwbi7+YlzAqkWWuh3XEbRox6UL9NsIfHms76vvkLdtpoLZr1lWbkYLJn5fT2Y5pGleIqlkkunhKZ/RQXPrKX3BSpyflJ2BNcjzHLpr/eBERAIBDRn4w9QD7dGvNCtS1DOLfWeVEtsfap9+iD6zGWLcukTSkmDQW1DDVX0rHA3a5jFOF+bkzvRXrSj9VNwpumLoJP8wJ6ZEZ4mzpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhCfI+UJ6kcIvxOraok5+HnXpJKlc47SPJr6cW2N9JQ=;
 b=iaEGioS/yVuuN2sO0fFIBQI5rtj+pXywL+wsz9b0rfSJW50ljp0NFGFsHKZeY6RmsukIW/klCPSyFj4tKSNYepm3VZkCDJlELehtrFwvV9yFzhirjMRIGzX8hbJ4ItOAclpKOXYJParWeq+hkKKTWMPt76IknXHmu7Qb3tL4Z8NFjxfrcnZC5QA/bW4EeEVZH3SO1vClXBtGOkMqnNpU64pwrwTuafNjOAuRsev13Sclb3/jDLYxpNEa3encPCsdMeEReq9TwLbUgt/q6RyV/iYf8xnsrTeoYuQSLkFH9egH0ezyo0vboKxAprYxWWIRYYjKR8AgABxkxWeIpobuRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd1b5f73-aa57-938d-8453-9c2e7b0895cd@suse.com>
Date: Wed, 22 Mar 2023 13:38:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] tools: get rid of additional min() and max()
 definitions
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230322120844.19657-1-jgross@suse.com>
 <20230322120844.19657-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230322120844.19657-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef62a48-38c9-4ff9-1caa-08db2ad25ea6
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oKNyVwLlldW2suQC/+JxvxMQdtUnbru+dLGvzSwYRach0iH6Vtyvw7e46zXSwBapyC5u5qw8xvhiinuoa8BC/RpoC+zinfnwsA6hPc2FvV3EZK/mgW0iiFhmQcMke115j69zcY/AyClCFxhR3paAcU/kjbvf0OHbHJan1p+N1Hm85TRwmc6RPfh915OJUDX07f3VU+8ELFbrEcFza4m7FJUdiynGFCo0Mdl9CfU6QD8btt1zAs0R2XBI83PZVTWZmP/wSMX5W1GjALIdupH2Wnzpg6EnnH3+mRfUu9GSaX35Ku4hbpyz5rzVDAzJv62TLM2M73lnSZY7CCDpSdrU8gysbw4ZVFVT4ATjy8QKqGkEZHvShvQWdJV0nda4dfrMJBt0dQSkD9Rt5IVtLhmjpnwXog9IElYI/VX0lKiY3JP05pJrridssZzsJwvsCczQOhLdig5GArbFZAp3H0A4eDM/G8qgO+B37kX8etC9zZLZtsiR+COeXi3gfHExmAb+1E9Q04PB19yGcnJalhe40lqRuL/qu3zDMjT7vxwOrqNPA4VbLrxkrhr0EY/sdoAWs9MHz78v6IBlj8Ah1XW6L441VoTKKH6M4D8z5GuAy4C/x2aoQA9adtqUxvVcoxXgqO9oSLSPVYqynOgVMPasmDkeFVGFRVqAdWC/kSmrCmzgpZxNc0k/ZWUyiAtpC96CZM6wbkjkLJu/WFAIFy8l+brH/O5UOZUePasb3HNACWXZmhsDluwvuWP9TRkoPG5W5Zj1AY0NRhe1o22dEu2jSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199018)(38100700002)(31696002)(6506007)(6862004)(4326008)(4744005)(66556008)(6512007)(5660300002)(8936002)(36756003)(86362001)(66476007)(66946007)(2906002)(41300700001)(26005)(6486002)(186003)(2616005)(54906003)(53546011)(316002)(37006003)(478600001)(83380400001)(6636002)(31686004)(8676002)(26583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2NQbFc1Y0I4bXhYRVc0YU8xT0g3Y2xCSDIxTFRlNVdmNW1qSG9mS3dKM3Uz?=
 =?utf-8?B?eGF2aE5maUlWTmJnY2wzc0FTVDY3OW9wV0xHVVhIenR3SUpkbzNxWnl4S3kw?=
 =?utf-8?B?cVRVZ0xGWEdXUzFFUlp4ZDhxWTF6TlhCVnlkWFU3cDJoWk5idjNRRVQ5UzV4?=
 =?utf-8?B?ekdMWlVzWTlzU2psSVdYSGJEQnFqZDhBazFqZVIyaUtCTlU5RXkwZW8zUW5S?=
 =?utf-8?B?L09IbHBRSzRuVmpZU2ZUbUdWTDRPOTRsRjR4TWNaK0ttM0xiZVYzSmNDQWQz?=
 =?utf-8?B?SFRIZGFDb0tObnhWSTZCQ2tyMUdIbHFnV2ljYTlQamZZMnBnaHo4cGc1WGxI?=
 =?utf-8?B?bGg0ZFJEZU16bG5mREhzdnBJRUFkOUwrQkZrclB5OWRDZUx1ZWhBQ0R1Zndy?=
 =?utf-8?B?T2hhcVh5OVczdS95K3QwdXYrZTBkZGp2T0pHTVUrdUlzSW5GS21UVFN6NjJu?=
 =?utf-8?B?UDhaNzVQOFIzRE9EeTFZS2pGLzJkS09kS1ZJUnZOR1owNkhwdTJ6Q29OR2RG?=
 =?utf-8?B?UXJscW9XT1VIbXdQSURSZHJOeEtLa0lJQXpVN1VOVGJiK3JCeTR0eFdwSlVF?=
 =?utf-8?B?cFhRZWRWaElMODBWUHRJRmxXYmNUTEZQa1pqZDl5YlhGN0NnQnIzUjF6VGhR?=
 =?utf-8?B?WmFtL3c1aW9SMlg4ajZHemYxWWNwTDNCMmszSzF6TUlmSW9sMFlqWG1iQWUz?=
 =?utf-8?B?WXg2bEFoOHZaVlZpRDNqYU9EcjRscjRaak5Xb29LUHI1WWluMThVRDhRWHRV?=
 =?utf-8?B?ckdVc1FKV3FNTHp4Tk0zQzNlRldQaTF4Rkd5TG5QSkZBY21YRk5PMWQ3eEFi?=
 =?utf-8?B?VkRpUDFwdFlmUUlwQlZ6ejhhYmxxWmlwVngyNUtHVU9LNGZvcHY2Smk0YnVn?=
 =?utf-8?B?SndmYkc3WTBwQ0dUZ25kQmFVZit1dWxIWWh4OURod1lNWGxkZmhFY1BxaHg2?=
 =?utf-8?B?cHBSMkpjS1ZlZE1SVmRXY2JnOVRYc2xvQnpsM01UbFdaSnJYTXV1RGswcU1O?=
 =?utf-8?B?Njd5N2xaV0lvRmxYTHJlcWhyUGREUy9HUVgxUDd2VGpoUkZ6VnNUbDZNZ2lo?=
 =?utf-8?B?dUJqdGE3WXA2K2FNY3BqbFg2SnBoYTNwWEtBZmRuZHRvelV6dmM1WjM3TXFq?=
 =?utf-8?B?ZjlSMlZJS0xmVHpMZlZmdCszeGxhZk05ZVgwU3RGbjczMmt0cW5rUzkwUGxa?=
 =?utf-8?B?bUUyVUY2dFBQTVU0M0JtWHd2VGluWVNUZFRpRVBERjd2QzQvYmJrb0xMdDhL?=
 =?utf-8?B?SWNvRUVTMWhwUUxpWlMvT3JyQkJlYlRvbkIvVlJGVUhwTFoybzJrdFU3eXhH?=
 =?utf-8?B?RGxSQ2xlY0xhbXdjVnNuemx4NTBYWkFWRWlUSkJqYVM2UTVuUjFSUllzKzl3?=
 =?utf-8?B?OUpiN2twWGQ3bGU3aUJSUmw0QWplK2oxazA3N0xCbUtQYVBzTzZmTkFqZ2hU?=
 =?utf-8?B?NnZlVFFEQUw3d3BsOVJjQjV0NmE1ME9sZmloM08xVWM4Yzl6OEVHenNTZ2h5?=
 =?utf-8?B?OXdMRlUxVDVEeTMvRXNaUDk1ZTJXSlpVN21wUmFVdnI0a2dCZVQrWDh2YnUy?=
 =?utf-8?B?cmovVVNoUTFVOEFsZlgybTZNczloYXgwQkgweVZ3bytDNUFGUHpON1JWY1BC?=
 =?utf-8?B?ZzRtR3lJa1J3SUNwb0E4VDh4TWF6T1VEQnZ3UlhnUlhzdE5tRkxtTTRQRHVP?=
 =?utf-8?B?cUNsVnI4em4rNmZjNmk1T3B3MXVWdkJIUDZYcy9yd1ZpRGM3Qk1HT0NGVUtY?=
 =?utf-8?B?ZzZNN3ZWOGRBR3hJZ1FyTHdCZk1KMFpFZ01LMkFHdGVpTkwxaHdkQXBVVlpH?=
 =?utf-8?B?VWcwMkRML0dlelU4VW8vdGNKVHA5ZkVGTEYrM011enIwWVIvMk56Slo4cEh5?=
 =?utf-8?B?eDMzQ0thaVJ3UzY3N3Evb1VPb2FpNXppVXVuQWowL2t3MkJNUWZGamt0OVV0?=
 =?utf-8?B?WFBYQUpsLzJLYWxlemF0eDBaRFk5UTZwQW5ERzJ4a1N3Tjg4Kys3RTRYdHdh?=
 =?utf-8?B?WEVyc1RJSUtxRjIybGFMaC93ZU5yS2Z5Q2ViOE93cTg1U3F2ZWV0OEQyUk1r?=
 =?utf-8?B?angrQ0tTVXZIRm1LbHBwdWQyTWN5RVBXR2Q2aVJ6RHVzck1kUDh1NUNicHk2?=
 =?utf-8?Q?BKwUClF0x00IipZL7cOXCtvBc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef62a48-38c9-4ff9-1caa-08db2ad25ea6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 12:38:42.4062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85s1OmfCxxDNXr4dLhdcze7RTrGaCZw6tp3ssKuVkFXn3AGLC+THusNI2QW4B2+ZkqgYe1H2dadynK7IYpCLyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7066

On 22.03.2023 13:08, Juergen Gross wrote:
> --- a/tools/tests/vpci/emul.h
> +++ b/tools/tests/vpci/emul.h
> @@ -106,22 +106,6 @@ typedef union {
>  #define BUG() assert(0)
>  #define ASSERT_UNREACHABLE() assert(0)
>  
> -#define min(x, y) ({                    \
> -        const typeof(x) tx = (x);       \
> -        const typeof(y) ty = (y);       \
> -                                        \
> -        (void) (&tx == &ty);            \
> -        tx < ty ? tx : ty;              \
> -})
> -
> -#define max(x, y) ({                    \
> -        const typeof(x) tx = (x);       \
> -        const typeof(y) ty = (y);       \
> -                                        \
> -        (void) (&tx == &ty);            \
> -        tx > ty ? tx : ty;              \
> -})

The new include is added to this file by the first patch. How do things
build warning-free before these macros (functionally compatible but
different in the specific tokens used) are removed, i.e. before this
patch is (also) applied?

Jan

