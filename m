Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A99167DEA6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 08:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485334.752483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJLm-0001Nt-BU; Fri, 27 Jan 2023 07:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485334.752483; Fri, 27 Jan 2023 07:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLJLm-0001LW-8d; Fri, 27 Jan 2023 07:40:42 +0000
Received: by outflank-mailman (input) for mailman id 485334;
 Fri, 27 Jan 2023 07:40:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N8iV=5Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pLJLk-0001LM-MW
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 07:40:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e479af7e-9e15-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 08:40:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8544.eurprd04.prod.outlook.com (2603:10a6:102:217::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 07:40:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 07:40:36 +0000
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
X-Inumbo-ID: e479af7e-9e15-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbP7TRtSJjN8ysXwfq8aTe6cyoq19iP+wv55DnBWPXw3yy/k0arzhN+q+VQF/uQheFNVl5SNRPGvdHOuE2+N9iy7W67eRXNBvdWO2TuGi3H8MwLGUauq0hg8RJshpGMsxESa2tjPCFBy33Rj7pggCRhJXG8fLcLyCIoIbVNoUvud4YfqroyxqIE5t6DEP/CDHNP0CND0ayZl95pA3PI5mV8jqEiFKuM2QCAhqEJjq9xRD+mYsBOAdnxqdiVHD5NbsIpHbv4ATFZcA5f/XZm0Ze7qSQbDTvEJz9VXYkCGd3YBNhwrhhOb+P8bh17NVxw40l4iHX3GRj9sMFA26HpPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WHPETdbjkGibGJtMUoJe2pcFPW4mC74H/kI77gqb8Q=;
 b=KpC5/ecM/+s/EbV9snWtoS4xaBjjDufaJZHtjUGQc5kIgwZXn6Xe0tYsgdWLEwx09JWTY4G8+viSM+MVAKqvOWa21k/wZPbpDTvbPL2wuGMJr5/17MO5+/Fx11glaQuRNE46n9E8Ie88AYV2w89PEwa4uQxQy9cqKHKSsPVdw+X1VXdj+mxkG7r5wA4YcU0tc23B2FFwPzsMar9cm48/VveSESbAy4nDzE9mCQHDqGqwrLbJgXLBfX50bAUS3F+ph8b2btfHAyq3jk+9MWpowjT1Bl4FxAYAPMBLqdNsxDGetrdWHrLl6JfktqrVXWk/+ozZ0yvGI0W57QryMO5gRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WHPETdbjkGibGJtMUoJe2pcFPW4mC74H/kI77gqb8Q=;
 b=tp1FNNqiR+eS80pFkrsuA0Tdo19tWAMf3Zy+2JsstwYYNQ+tTqkpN6fqZubqxQBRSdAaFUCeX2kXUQuwvttGQeaPDUDU0ZTIr2qDEh1k1wCrlDRpigcaVpeeRV7kY9oYnRVTDzQedDd0WKXfr4YAHZjKq1cSzqctu9C1YJ09K58j1HsQ2Twrb+xz6/+1uWyFdMeMClq1RFQk0oX0nc0UEUL4LthcvKRTOTOFhGX0+hW+7/xZCwCkBWNUKEF1nXgbTuoX6/myXj1a61AYxDwe0iJ0hxiGpC1Y38CogRi6HebYSS67HdenCuJbc6tgQQf+/5448I4lhYJ7oi/joyL/Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ea1c4b9-c02a-f189-f535-bf15d28f57ed@suse.com>
Date: Fri, 27 Jan 2023 08:40:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] tools/helpers: don't log errors when trying to load
 PVH xenstore-stubdom
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230127055421.22945-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230127055421.22945-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd583c8-8d55-4122-472b-08db0039c6af
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XlMHZtdHH9iwy36fOFDOrY98YWiJuApSC5A+wz3i5rXz8H1Sb78d9EaUYCVkxVXA6f8/dyiCnr6VUJN3Sf6yxLnRH55d1C6clnHCzlH4qNiWLovSZ20L3Ft8CL4HwGfb2qLfkOINBVkqM/6XBJgKaWg+quyVEJsyKBTm70zUe25hvX0NhxyoOeOi0caCyQfzpV+rDQ6aGmJJaB+d6SzaMPSFxqxYQMbl7AB5BzyGlWNO9GnkDa906CqleJ59AMAoiRu7zoZ5P1gLXjT9yzv7MaDnE9mw7V59xmvjOui/60zmVs5xWuC8tnk2y3lyZvoXkiYPylMrA0geIPIrxCh+Uo8kXw1bAkEjPFglumRmB9YZACg9M9h24HyZD/jY9tVHJPUZ26tRscbEXIm/EOodBt7/1Leoerw60PvH9YJNjVEvPOAyFsdgAJgxrn0RLjDi5cGVDatURGI+rR9odz+gOLSVori20NhzAVBOMen93APfIEv7XqXEIbTAuMYB+Z37zrTTI2CfckU/BAIkALPGmDTgeKlosIFFcmBjzpec8TUo9kQsSeMqqqTCnouSZyeTHhXJoAtjQhGDHb/4xia3rME/O4OOnR3vmdgn9vVCjINOcxMkEGR15fpb7ONFVqN2ORsBa4TPBCz8D72o/tH7OnHfVa85hXKTaugy3dvt/v1svm2ebZiz9Sh/t9cN9XHW3MmJqz3vEbI7UI3NisyFw8aQeUEVDQKaF6LQJd289Jou/vZpKZSPqtmdrpCuqsgm1YIpoPt6yfM53VKoq15nujwYtmXbrFU9zmpu8wHkKY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199018)(31686004)(6666004)(478600001)(6506007)(53546011)(6512007)(26005)(186003)(5660300002)(8676002)(4326008)(66946007)(2906002)(54906003)(316002)(37006003)(2616005)(6486002)(6636002)(8936002)(6862004)(41300700001)(86362001)(4744005)(31696002)(36756003)(38100700002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXdHVDNxWGlGWThRZmlsWFZNV0tXSEs5RFE3M3ZjOU9pc3lIWTMwa0xBczhL?=
 =?utf-8?B?RUZPelRTdzhIaEJxdk1MMW9GZVhIbnRQdCtwc2x0ZXZtS1krc3UxRmFCUnM2?=
 =?utf-8?B?c0VRUWZHSW5jRUZLZHpma003SHc1OEUwcmtTcGw2Tks0S1h6K2l4a0QzSWtG?=
 =?utf-8?B?ZzFTVGVjRCtYV1V3N2Z1aTdSSEVGbWxPUnBnTFVLM3RUMG8vNnVSOW9pN3Mz?=
 =?utf-8?B?V0IrMjRQU1ZWN2VzNFpXMmFCeTQ0L21RSURtYTNPVXBlWTBsaHZTTlZnRFhO?=
 =?utf-8?B?UTB3NGpzUWEva1ZxdGVSWW40ckZydnltWVJHQWxsYjR1MSs1WGg4cEo1VURX?=
 =?utf-8?B?L3V1M1psZGU0ZkNUTytJb29FempkK1IwUk50bkJ2VVRqOHdSZEc0REcyUFFB?=
 =?utf-8?B?L2JySjdESWlrL3ZmWUhrOGlFUjBQRDlaVU56Y21oMXRzeEkyenE1OHFMekxL?=
 =?utf-8?B?QkZnVFZ2d21CTUpWdDVpYWdQTEVFR3N0Q3dIakF2dTNIUXpLMGtZTURrSGJN?=
 =?utf-8?B?UmdDNGU0ZVNUTUdnODk5TnZ6ZkhsRENMaG9UNnFHTHhheFoxTnlrSmM5dmVh?=
 =?utf-8?B?QXc5V1R2NkZteTFWNStyQnNObXpPS2tOejByWmpEbUtWYlByUUR0dlY2eUUx?=
 =?utf-8?B?alJkVVpJZVRHT0laSEFCTTNZd1RseGtFeG5sR2dpbXM2K1g3L093dVo4NFZT?=
 =?utf-8?B?QUxNOVlZU2FTbG9veGhxRGROdm5VbC9KL0FjVTRXYkp5dWgyTXFaamZZZ3Vn?=
 =?utf-8?B?em9PbVZwS1NvSWcrSm10L2lBNkxEalJQZyszcitmZE5ZVjJ2U05jeWVEdHJm?=
 =?utf-8?B?dUw5WjMxRnBreVpSakxzUWxwUmV4dHU4MGVpcWxuTnZLVmJIdm4wWkJZNnRr?=
 =?utf-8?B?d21OWTMzMGZlUVh3QzV2S0ZDUmtjQm5yL3dNY1VXcWhuR0tESkF2YVlDY0Ji?=
 =?utf-8?B?TUlQV2NMYjhKc2FycFdvd3luTTNsaTdWVGhBZmFkdTNKWWRVZENTaDZQeHNy?=
 =?utf-8?B?WDVzNFdoaVZZend6TXRwTWZVUnRWeEd1SjR3MlZXamNOUjBBZzhrK2VsTytq?=
 =?utf-8?B?bGVFd3ZtbkVWcjNVL3NQQmFRVlVZMVprKzB3YmE4dG9HaXBmVG5Na252NWUx?=
 =?utf-8?B?UzAxQ0NvMkYwOEdFNm5WRmFHQ05BcG16c2o3Lyt3MnI4dDBDbkt2N2NuSGhS?=
 =?utf-8?B?Undqc3pKNU1udzY5V2ZwcFFpTldsTHE0TEwydXNZRFBPUEw5OTdLUzdqcmFS?=
 =?utf-8?B?bUdOekc3MEZzQSsrdWY1OFJCdmp0U2ppRjc2Vkd3UVJOdXd6N1gvbXVOMUtL?=
 =?utf-8?B?azZUUmx1dUpaTjJrSVJBWW5sUUNUa1h0N1ByRDJYZjFrTkZ4Y0Q4aTNUcTJC?=
 =?utf-8?B?TVpjZUJvU1lGL2g2TkZ0WWJCWGQzZTBQdFZublpiRnBQRkR4dC9nTDhMK3hW?=
 =?utf-8?B?UWI4V1BvL3Q0VFo3UFpkVlB0dVpXZ0F0Zk9HYzFLbEZlYWY4dWNVaisraHND?=
 =?utf-8?B?R3pZRmlPRXBkejhOWEtyellya2J3YmwvYjY1a3BRS2VGVDV4LzQ4RCtLQ052?=
 =?utf-8?B?UUZYOG8yWW9teHNYMkpUSFNNazNTOVphdVZxRnZwMjFkNHZWc2IrOGhWOW9N?=
 =?utf-8?B?ZTZ2R05jMGRqTjYzc0lFcUlxZXVnd2dJUXpxSENWOEdzcloxd3ExN0F3VHg5?=
 =?utf-8?B?bUFDYVN6MnhNcWdFWXdNTERrWHE5Q0pDb0p4RGVrb3BLeWRBVW5jT0t1clpY?=
 =?utf-8?B?N1FQaXdhVlc0L0RiTituRHFrME1YSnFQSFp2bW1IcTNVUW83MWVrbmZGYXBI?=
 =?utf-8?B?a0Zrdy9RY2Q1WTk0dzdNbnNEdEFFMDRDWFV3ZVBnOUtYNzZpYnhsNHBkZzlx?=
 =?utf-8?B?ZEFrRDJGV1luMm40cWlZemNrd25PTHB1b1lXY25zUDBPQ3pwV3ZkMmZUMGdG?=
 =?utf-8?B?N0pJdDNLeDZJa1dkK1IwT0NwTENYVGZ1S2dDSmc3Zk5aRVkwTWJoYXlqSkhS?=
 =?utf-8?B?NXMzWVVPajY4N0wwMVlHZ2FoOHZSLzZRZ0lkMGNhT3hLU0MvQkZEN3FZc2I4?=
 =?utf-8?B?dnZvSEowaFlXZUVyVVVYM3YxUHJQNGhPaWtlMWtkQW93ZmFiVytGSG9qajRn?=
 =?utf-8?Q?DSYQ2nuTctwREA+E7HEbdHS7V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd583c8-8d55-4122-472b-08db0039c6af
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 07:40:36.6130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unUFIODMSoDtjV601A5ZD16GAwkA/JFydhhLhSnkW9mAKxdIpoBMXwjAinuz/eYI8oSS9bF4h/AnZhnioHEarw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8544

On 27.01.2023 06:54, Juergen Gross wrote:
> When loading a Xenstore stubdom the loader doesn't know whether the
> lo be loaded kernel is a PVH or a PV one. So it tries to load it as
> a PVH one first, and if this fails it is loading it as a PV kernel.
> 
> This results in errors being logged in case the stubdom is a PV kernel.
> 
> Suppress those errors by setting the minimum logging level to
> "critical" while trying to load the kernel as PVH.
> 
> Fixes: f89955449c5a ("tools/init-xenstore-domain: support xenstore pvh stubdom")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - retry PVH loading with logging if PV fails, too (Jan Beulich)

I'm sorry to be picky, but shouldn't this be reflected in the description?

Jan

