Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E47054CB71
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 16:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350180.576431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1U77-0007x0-E8; Wed, 15 Jun 2022 14:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350180.576431; Wed, 15 Jun 2022 14:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1U77-0007uI-Aq; Wed, 15 Jun 2022 14:35:21 +0000
Received: by outflank-mailman (input) for mailman id 350180;
 Wed, 15 Jun 2022 14:35:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1U76-0007uC-Dr
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 14:35:20 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe06::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 611f9939-ecb8-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 16:35:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7412.eurprd04.prod.outlook.com (2603:10a6:20b:1df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 15 Jun
 2022 14:35:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 14:35:17 +0000
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
X-Inumbo-ID: 611f9939-ecb8-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLqMzH6OssWr9ZKwuiGp5KM0Gh4kZVOB16XYAZ55PShiZ6UaSPV2tqkv9QvIdgj6qobhNEvgwyjC/RY6ty5Cyud7DY5iP00ntXc4Zq+2UzIinu5qgdcUMMgWuj/GmYCc4AB3nl/ai8kF/MH3/rne8LSzcNZ1do1Y62PW3fuVyiv4cu5kPepG8YeWDsaP2or3n1VrY0RL9GAIMCl5eVaTJ3tOOvqeOtzpa/TNah0vFGArBC791QUNULUrpx2jgdT8jpg3pajMIXGr6+zq1O490AJrJk0pzuKFAHxadXgxJDCxP33J36SuIGdP1uqEY33YgOCCWYzuS1CGjAUzK6R7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeHCGjt12bsp6OuqvQHlX0XzDaFGViCx4bAk4abJIQk=;
 b=F9Z2vX//HjOwCKWMZkf9Qr+OqCqdHcizBWW3oO+DS5s2sq4gKnGGpXmwQwwqb3JkWEis+WE7dpVvGkDx271b5y6tbzvQ1IUKcmZtvzQ61R5PjERqLhJ6agvOkAtLOr4E5lcT13RYQ7ICIGyEr1q8mjitOg0yc1H6ZfUEL3Ib2/QRmBkmwATW1wjYVOg1jTpjiX+uBqYY40DTUkWm1GuWB8mw6LerS43Xmxh+60dfm+2Q9WP+jGuFjVlk5L39EBWs9H2q5uPgcvWjDUdhWoVy1HPrFg/pmEuhx2jdqpIqul2NJ8DGJ1HYenXVHDn+0A/tyMf94hlyB3T7IvlcnZc9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeHCGjt12bsp6OuqvQHlX0XzDaFGViCx4bAk4abJIQk=;
 b=gcHmnBaWQuvrHMqBU/YJyE96UTcdO/K2/h/naRxVGPjHmq21QAvXn8K++uc7OmhhLf+Msof7jZhEoPLMtHaa1BrUOr2MW+MreyMJkka6oQfdiazIeRSAdjV67xyD/S0AvQaO7Hwdrbkytz+TQVqZYxBD9Z6ua0VIeDqTYduMil8kw4DjSSyqsxNFGenr5l9C9sYQ7AzPPQZR2RM71DZZ4R1YmT7SDoBRjN2LyohdK3OTm4IjIPeSWBxMwL4wm5vxwajkHlypKvwkzx0UmNXumSI2fJZqxnzSzyZCsjnK8UtoUmTpoXZS0je+TuHBpFbAgMoqLL16SyZ/Optc+q02Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <add476e5-dc49-9bf6-873a-174f6a3a7292@suse.com>
Date: Wed, 15 Jun 2022 16:35:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 02/10] xue: reset XHCI ports when initializing dbc
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
 <f89ad3528e9d57e4598ac450f08a81391538fa69.1654612169.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f89ad3528e9d57e4598ac450f08a81391538fa69.1654612169.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR07CA0033.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faceca25-92a7-4f4c-68d8-08da4edc4402
X-MS-TrafficTypeDiagnostic: AM8PR04MB7412:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7412610F2779E5C5DCBC25D9B3AD9@AM8PR04MB7412.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FF3rR/IUKQZEeBC6KOvmyN1zfV2wMTr84cQukvCzOatnFAIhNdH6AWTWwNGWB6PhUEt22kZft+lRO5h4hMAhqu9H7dSA+GXe4O3CH/Q3ZObkcJwGr/aIkq3oRq7SqOQhHuwMuGCuc1Y4EQCb4bhv92Wx7AThmn4nlI1pRPBtDQ6rb0GQ3wbvfSgBcI4FEqYOar0Laz6s6+3wiahre2AGNAukPW1xBUw9INcahStSaFN8Q4oZqVzNKRUVkBrv0eCxNmLbGKNWozc9iNOgO5vF08vLHk7/F0z2zbKfJbtyY8ScD0VS+2Ke25sN0EcTeTZp3Gcj4f6YDVUJB2uDkmOmSZmGsEh/+eeIUQ0xFs3HgT33QkxUPspdlQbln+lyUtGF20ID3BdGNYCELDjrpxXHFvdq1cMhkZGu/zhNdH6FytWEBl5tGTJvHanWuf2E9VBbDkIba4Jatqd5fhvQOvoucSCWPTPkE8i46emrLB54isR/SfmW2kZc8o9t94Ky/DsOe2JQEkzrSwhfTyNuRL4daVLD1llQtd6/B023wqUJVHV+9ueZi/AbutMZqg8W+RkvsEjBenPY6M6mB5c2eN6fG7XyceFycURqpe7oIQzVSYXRbekYFgcdPbs8LNqbaCdY9a9uZlS1y077iQwCVADyczQqnnbyGeiYpGrpK+yoxqucVYgXxEIR5pahupSHUprxZQgcYizplmMQ1OyEyPb6Yyv9dGhBCuCNFIvHrz0AIV+GP/c217Xw4SGZpDg8TZrX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(2906002)(6666004)(6512007)(26005)(6486002)(508600001)(8936002)(5660300002)(53546011)(6506007)(66946007)(31696002)(38100700002)(2616005)(186003)(66476007)(31686004)(54906003)(316002)(4326008)(86362001)(6916009)(8676002)(36756003)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sjc2R0x4eTZXSEFmdExtRmIxa0JodkFIVnlmd1NScmxEdFQrbUVWdDhMRkRC?=
 =?utf-8?B?a2V3aVBGUFg1dlBTUFgxZDByaGMvWXF5OGlaSXhBVXBId1NGT0xaVElpZkFU?=
 =?utf-8?B?TXlSZ0pySExxZVN2dzE1TWkrdU5CZi81c2VFZWIvSlZQRTkySnB3UFhLMTJF?=
 =?utf-8?B?RkRPd0lYa2dKTURqeXRHLzNoWEt2UWNsSlNvclgwcU5OaDBLRXpVdmd6T3Vq?=
 =?utf-8?B?OGtxampLYitjbkg2MTFYSlhBMFYzbmhONDFSQXpiNU9waXpjM0dJNzBtWDdp?=
 =?utf-8?B?TWFaWGZPWGpYQWZ0Q0F2SmlCQlI1WUJDZC9vZ2VmWlFVRDBIZXY5R2JyUGMy?=
 =?utf-8?B?UXZ3S2RNVGJqRVI3bzJZYTNhNVNTb1g2bFNhanlJZ2xWRE1zVEQzNVp3NGpq?=
 =?utf-8?B?cDYxbWRpK21xYU5VODlSeVdaYkRsLzM4d2RXaU41WE9UeElyVDFxRjhZL05m?=
 =?utf-8?B?QTRPYjhvS2dyZFVLd0R4YmhYUVNVcklwdlBFRE93YnpqSCtnTGNFN3FzTFRO?=
 =?utf-8?B?bmVGZVVPbGJhaVhmWWIwdjlBM2k2Z2ZtQWh0NEs1OFV4TDIzZnB2UDd3SEZi?=
 =?utf-8?B?YW85eHpGVktleVI2VFp3OXptSE1XMk4yRy9oR0VIZEFiL1hMRy95d3hQOVpz?=
 =?utf-8?B?b2NodG8zTDZGMGtXY2JHYlNUQUdRQkhaZ2ttMFUwNW5OOXpYSk84WGEwTzZp?=
 =?utf-8?B?U3VjbGlhYXNiWXRuMTk3UEU4RjJXTVg3UGtSZ1hlSTRoeU5HM1EvbGRpQW53?=
 =?utf-8?B?TDNWRXdXek9jcGtXS3ZHcTRVaUNUa3h5N0xFRHBGQnViUHNIcTlBc1pDRGQv?=
 =?utf-8?B?ZG1UTERIS3dsWGpJeUY1Z3lhZEo5SWZFWHJ3bEZybzAwdmM0ZmhpYjUvOWo4?=
 =?utf-8?B?aE9mcUprYzYxSXpVdHd3S2pXSk5veS9LUGE3OFhIY09BSTNXNGpOT0hoSFpC?=
 =?utf-8?B?UGJ6MG4wV3RYYlQxVlFsMmZhWW0rTmEvNDVkMnowcUVic24rME1MSFRwQnRm?=
 =?utf-8?B?cW1UMUY0U3VxWVBZN2laNlZPRmhEUUdvSUhTc1lCOEtHemVvSU81NjRZTVhq?=
 =?utf-8?B?Q2hkbDFieG96dFozeUpWVlQ5aU02a3lERUducGJEWUZNSnBOWDI3My9XK2ND?=
 =?utf-8?B?dDYxOURDdm9PazYrT1cwcnpHRFJpYUpSbzArUmtXTXowSFRwVW1ZbmxyZmNx?=
 =?utf-8?B?MWU3NHlSU2ErSnIzNVpGNC9rSTRzOTBFcEV4a2NWMWxWK04rTmdhcEdLOHNF?=
 =?utf-8?B?cHMxeVJuQ3RkTStqTlVUTjdQQ3FOZTFyamlzY3Rvekljc1dITW0vZ00zUUJT?=
 =?utf-8?B?QlpLZmdlN0RpZndValE4Q2NSNUJuQWdlMWUzM3k4V3Eva0FDUDNVY3ZJcjBo?=
 =?utf-8?B?b2xYVVZGZXc4bEx1UTh3bGh2ZVNQVDVuWjRrZkR5Z2xXMEdPa1h1WXpIY1JU?=
 =?utf-8?B?MEd6aG45SHlwcncyR091OTR1UWI1eklkQXlmbkJzdFpWVkVQSEkyaEJIL2sz?=
 =?utf-8?B?YjRVL2FFZWNCcjZveW1sOXN1Q0lTS3FDM3Mxb2ZUMkcwZkJla2FVRUtGa3dm?=
 =?utf-8?B?WVpoV1Bkc1dYQitabzNTckd5Z0xvbWIwSUlBNG9KTjJVQzVvMmM4Nlc2WTBT?=
 =?utf-8?B?RDlIRVBYdVFKUEc4OUxyRlFOQ25UQVJyMWZoRG5tR1AxSUZKbTUwcEx0S1A2?=
 =?utf-8?B?QjVRQkYyQ1VzcFNSN3lFNDBTa1Z6VnVHOTRTLzBneHJYOUR6YmlVa0pMZXl5?=
 =?utf-8?B?d1VZdFpLYWxRODloWFBjS2s3RjRLdkE0bm54Y3JMamNvTVlBczdyY1o4NURn?=
 =?utf-8?B?ZjhuWGNadDJIN25IUzZoazFIczlJTjVRTWkzUnhVMVlReVlTNk1oOWdHTDdi?=
 =?utf-8?B?VHJvOUJXYkt2VDJxSHIwOUpPWmFwZ3Q2ekZ2d2R6ZklZZ3Y5cHp6YnFGY0sy?=
 =?utf-8?B?QmlUajE5cnJsQnprM1ZuZmVlRFV4MmUvQkpUOHlQVzVHMVROdE1WQXE4Y1lM?=
 =?utf-8?B?WjQ5blFnRUZXWWFsR1lTNTFSempOVUJrL0RuQVEvL3hmK3UrbU9EUExDT0JK?=
 =?utf-8?B?VGMwTnlWSGVvalB1cnUxa2tJaEdvTDk5ZElYR3pNc0taRC93dWN6M0hzUWE2?=
 =?utf-8?B?YkNxTFBNSXlmck85Lzc0WnoyNm40RTM3ODU2MSswemQ1VHpGVG5EMWZ0QXBW?=
 =?utf-8?B?OTBSbjIrNzBTdEJEb1Jmd0ZlT0tDQ2E5bVJXTFZMalMwVkdoZHM3cTVTQVU4?=
 =?utf-8?B?cVFreVRveEdlY3hCUWFySjZmTkxNRHIwTm9xaHBjclY3SE9uNXhnTjhzdW1k?=
 =?utf-8?B?Tm04WVRHZkI0Y2JVcnN2WEdRcWdSdEd2UGQyQ1hNdWZPdjdjczNTdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faceca25-92a7-4f4c-68d8-08da4edc4402
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 14:35:16.8845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCwzd9iGZmwzIyOvv8S/C5dZ1dNDcswK1JjjFpanImSCud/pmOkql9EfVf/VJIg0tw4WpYZQlKzObpJs+H3JsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412

On 07.06.2022 16:30, Marek Marczykowski-Górecki wrote:
> Reset ports, to force host system to re-enumerate devices. Otheriwse it
> will require the cable to be re-plugged, or will wait in the
> "configuring" state indefinitely.
> 
> Trick and code copied from Linux:
> drivers/usb/early/xhci-dbc.c:xdbc_start()->xdbc_reset_debug_port()
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Just two style nits:

> --- a/xen/drivers/char/xue.c
> +++ b/xen/drivers/char/xue.c
> @@ -60,6 +60,10 @@
>      ((1UL << XUE_PSC_CSC) | (1UL << XUE_PSC_PRC) | (1UL << XUE_PSC_PLC) |      \
>       (1UL << XUE_PSC_CEC))
>  
> +#define     XUE_XHC_EXT_PORT_MAJOR(x)  (((x) >> 24) & 0xff)
> +#define PORT_RESET  (1 << 4)
> +#define PORT_CONNECT  (1 << 0)

Odd multiple blanks on the first of the lines you add.

> @@ -604,6 +608,68 @@ static void xue_init_strings(struct xue *xue, uint32_t *info)
>      info[8] = (4 << 24) | (30 << 16) | (8 << 8) | 6;
>  }
>  
> +static void xue_do_reset_debug_port(struct xue *xue, u32 id, u32 count)
> +{
> +    uint32_t *ops_reg;
> +    uint32_t *portsc;
> +    u32 val, cap_length;
> +    int i;
> +
> +    cap_length = (*(uint32_t*)xue->xhc_mmio) & 0xff;
> +    ops_reg = xue->xhc_mmio + cap_length;
> +
> +    id--;
> +    for ( i = id; i < (id + count); i++ )
> +    {
> +        portsc = ops_reg + 0x100 + i * 0x4;
> +        val = *portsc;
> +        if ( !(val & PORT_CONNECT) )
> +            *portsc = val | PORT_RESET;
> +    }
> +}
> +
> +
> +static void xue_reset_debug_port(struct xue *xue)

Please don't add double blank lines.

Jan

