Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5538C6F66E0
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 10:11:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529615.824177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puU3H-0001PM-S5; Thu, 04 May 2023 08:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529615.824177; Thu, 04 May 2023 08:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puU3H-0001N3-Ne; Thu, 04 May 2023 08:10:59 +0000
Received: by outflank-mailman (input) for mailman id 529615;
 Thu, 04 May 2023 08:10:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puU3G-0001Mx-Im
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 08:10:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7d00::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32c285a6-ea53-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 10:10:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9078.eurprd04.prod.outlook.com (2603:10a6:20b:445::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 08:10:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 08:10:54 +0000
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
X-Inumbo-ID: 32c285a6-ea53-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFoLyuR9hyHT2W5nm8VTPIDjrmNv4CbA15hI38VL2cUiNV3g5vQJZP9+AZSj3zpGYjQKg6fIFTIvzHKAtTPKwBg3uhTnqDBN04gT4TIAZHD+vKOE4r0aR3SssZ0eXCOf0Pi0cdq/u9ELgXzdJqGkx+CX7zSFjsOyO0OVv+VMsAoo/ybu8FwvHjbMdlDp39aj5KeQTLKihI0VnbNWwekplTl/05y+G65SY67HCsXRIGUc39JlpFUWU/suFBPSD2sZNIvJDuZ5y8SuGRS9ZlVCQD8A0uzrd0kXWJNnF1NvG7YEjI7WjcnO7Qjriln7vdOD9Rmg1lW9oz6xcjw09Xrdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8lYMg19hUZpAHP16/2jCnOsXiBiDA/1TpD45NDmil0=;
 b=UQVeJ8fq9plHWzZyGFLpAjVkLEGYaAxrDlKsUDTg6KQjdalxClqL+Y/zgx6TKG8IpPDYpnjlu2toX2eIgePGKFQO6y+NqmXkorQKBBX7DnAPiqMGVo++Fpua2we7uC2BbXJWsWMT5WY0yt1oj2mgG5iKqqVrjBhtGKvjbA36SpmzQTFgKrMkccjCbmXa1ayzZfKg9SDH8Pgm2Gw617Os1rR1hmotUyW603xkHy7Ogwfqrps/TUE9r/VM6hKnbTOKidcLQb8k3aLmi5tJonmssTL6miAejKG9LGWgY6xp82Vl9yx9WxOo1vDCLcRmHiTc4qA1dwT477LYDCN/L9+sSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8lYMg19hUZpAHP16/2jCnOsXiBiDA/1TpD45NDmil0=;
 b=XgMGbX5w8uwjybYzIUXGkIthddMY4OaKqM/iNGjHf6BB4nRE1BAkY6B7pggHhwZ86L1e7/LxHsL9NfsTuU91bnqj78W8XGfz0XJaWyUlPthQ508YXMJUkduit+P6inps2oOBK4iK3SCoJaIIruzlOlOxNbb3PNVhaYt4qcIAo4Oy2AxOJaEHTMdDBdsC1XEGG22Tgf/8k0yQUej3EYSwrhbbw9x6bGqMGQpJIBjGXgGwxIdDn2PrqMh3NbvUQ7snz2YnZ4JAzz3C7p6SUx8HnNHaYw/piRAG01SS3h3KffR3r9FLOHaFa6QBL5CRKEMqe0IpuEXxMqOm+sZOk1a1rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01e1cf98-1c36-37f2-18b3-0994e279e5a1@suse.com>
Date: Thu, 4 May 2023 10:10:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 1/4] xen/riscv: add VM space layout
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1683131359.git.oleksii.kurochko@gmail.com>
 <a4004849c87990e5379acc5d60a52492385cd8e0.1683131359.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a4004849c87990e5379acc5d60a52492385cd8e0.1683131359.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d66c6f6-02b5-40f3-ab4f-08db4c771527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o3PgupvEZmLrWJn1DjCzZ3JrmLqZuAXtaapqgd5lAWMbS5D4hsOacsqaJ9Iwfpn7zcS5dqX1taokX/p5nrp7o3M7tq25jQCLU84zUakm2z5mp+kBUchzbcDt5AEwQwTnHFZUQgKoMusmYrw0RUltq9696bXrh1wTsB2ao7Dl9ingA8Ta2dP3NGsKHvCMxOOun9HtoNUsbvA+/ty7iVZaHbQXqCDRoLOTXylm1SSfdF7/cpAbbBEjn5m6sGROTmk2Poi806StiQAPcAqxQ21oIo+ZUgQAbIGoXcgmeBw+hx7VZQOvEhRiLFunbg3s2HH28mpMKqa0oBNACCRq4lM6G6twSXhjR2Lk7k+5UY8L4B0ZeJIUYwPaqm5ygHnSZIhoa137Y3kKun5JcttkOEXEJf9IfwxmsRFuhMn0ZBVii/yewSGIDnad3gCZAeCiqCysLvNgJyBXYLTKrf8SsYIjFU5EARww4bQUhD9a9lIe1+DTl+w2TfBjn6qtoah7HWtxpp8JVT4N0laxBivVom9NxDoCo/g9A8Rn4tIE3GGYrjJFfmt0yFAGzKjUExLbXwOAdCBwGa0z44eV4e88U5L4Tu6cpLtdtmyP0e55HD3DFpMKwvfj99ZtIhuPakUgp+6pYLR9RTG3fy0NbZctVQOhIg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(41300700001)(2906002)(186003)(53546011)(6512007)(6506007)(26005)(6916009)(31696002)(54906003)(2616005)(86362001)(6486002)(4326008)(83380400001)(66556008)(66476007)(31686004)(66946007)(36756003)(8936002)(8676002)(5660300002)(478600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THF2K2V4MlBuQTdMS0Y4bldiQWlBeTBkYmtDUWVNckZNeEJydHA3eVRRQ05C?=
 =?utf-8?B?OXliVmpGVWlDNys2RVdWTTdhNHJVbHNjbGt0OVNRakxGNXE4RHVrd2RrbHpn?=
 =?utf-8?B?VGw4b3l2WEd2eWp4WUdEYVZLRkZCYW9iNDdTdkkyNW1zN0svekFFZ2ppakRG?=
 =?utf-8?B?cFMrTEMzd2xEUFU4ZURkdXRoVHZuRjdqSlphUkY2T2N6d2JHRnVlamh6d2tZ?=
 =?utf-8?B?WTZITzFqZHZzM01aWHZhZGFvbDdBdnppK0hOYkU0RHhNS0R4MGlxalFFRXky?=
 =?utf-8?B?cUNGWEJpQ0drc3BjS2JpK0pQdXBkaklNL0N1OXptdmdRblR6NzZYd1p6SDJs?=
 =?utf-8?B?VFRSVnRMempGVzRCSjZuYnhHbGxkVTc4eGlOSHlOcUFBQXdROWxGQW9kVUNj?=
 =?utf-8?B?TVl6d3ZnY200eVZGd0pTb3FQaXcrL2RoV3NVT1N1anozZUY0aVBKNVllY2gx?=
 =?utf-8?B?eWVRMzExdElBSENqancyYUQ0WmMrS2JuYXhsanEwRmlObk9oNUVwWmxNOHUr?=
 =?utf-8?B?U3UyeWJEU2J0dk9vd05zWXlhdkZRYVFjMW5ZQVduZDVBcVN0RUtKN3lsd0du?=
 =?utf-8?B?Y3RnVy9Zc3dnVXhMQ0NXb0RpWTlhTDNaODVwRXYrMy9HVWtRVmRxKy9pY1Fm?=
 =?utf-8?B?c01qS3pBeDZweWhXQkc3bXkwRzFhTUFhSVBHWjVDWHd0MDR3Z2R2by9uNWty?=
 =?utf-8?B?S2NTNlVuVHZJejBRclRBSDNKTXVldkErWmNVc2Y2T3A5V09DUVJrMTQyUlNL?=
 =?utf-8?B?VHl1bVB2bHdTanA0TmQ2WnhiSVRZb2JxVzhmTXVyS01hMW92YzB3cmRPQ3Vh?=
 =?utf-8?B?U21wWTlwUGlmYWVjbnhTZUZXdkJMQ1IrMXdocG9zWTg1cXFablp0T0NKYkQ0?=
 =?utf-8?B?cVFqQUh0YlcwTnR0VzNrZnI5Q2o2OFAwcjcxbXU5ak5FSFpDTWdOZUV0bzdL?=
 =?utf-8?B?NytXdTB5N0ZYUmlyTXArUHJhZ01RN3pUeTVyK2lFRlhybUZDcklreVQ3TmRN?=
 =?utf-8?B?RWo0SS9WY3A0QjVGUkFHUVhQZmIycEdrc2EvTlBwQ0hZdFI3OENmWjBUVG94?=
 =?utf-8?B?dGpZd0c5ZDVUTkRaVDJHYWVaazJSNjg3Vk9iVnIyOXczTFFKVzQ4WmQ2c2Mv?=
 =?utf-8?B?TVg4M2lyVFg1VzJIa3I3NXdldW12MCsveU9CdVg1RkQ5bEx3QjZMWmRWWDk5?=
 =?utf-8?B?bnNaSzZjdTFuZkZDNHBkTlB5bSsySEpKMGthV0FiRFJJUGVqV3FlQllmbXBG?=
 =?utf-8?B?QU9lZmlPWmlPOElycHNKeDFzNENxaFh0MGZYZlZ5NDV1V1pPaFRZWlYwZ0VI?=
 =?utf-8?B?eXV5QUxlQXUyYTJwU1VOOGJ6ZmlIUzEzd0o3L3FMSlA2WE9NTTFBOUUrbjc2?=
 =?utf-8?B?eE0vTXdxNDgydFFaMEw1eEk5aHlSbS9vcm9zTXFtS1VlRitGSmxiODU1aEx5?=
 =?utf-8?B?WlExdlRadDBCc2oxZm04RFp5OWF2UHRGam5kbk1hWlEvK1FJTDlrWWpxRWFP?=
 =?utf-8?B?Nzk1bXBXcS9aOVQydHMvMXc2QkcxcU5aZm94TFhmZUVPL3Y0WWZaUHJyRkRV?=
 =?utf-8?B?cDhFRCtVSnFhWUxVcVlqZ0NSeStnQ1Rsa1Qrc25aeE96UnR5Nm4yeG9KdDE2?=
 =?utf-8?B?OVd1MkRYWksrQTRVNkxwY3MwbjVIM01MYUtBTmlQMDVqbzFjSjhJM3VtRjI5?=
 =?utf-8?B?SnhyQkNQMW0xY04rR1JpVWtLWjB6NlNQN1VMa0RaTTBQaXhoeUEzYjFpMjZW?=
 =?utf-8?B?Z1pNNk1wZk5wQ0p1S3ZBSldxQVhsQXgyb0RmZmlXR1FhMmpYY2FTRkJKdEhX?=
 =?utf-8?B?M1RzY2JhRE96a29aZmtsU0N1VDVtdDAvNmNoNHRwOWswUW8rVUFXTlRtZzN3?=
 =?utf-8?B?ZHJkUm1pV2RXQ2g4ZTltQXlTb0syRmhmTWhkVVBIRXZhNE1VaDhCQmx1MmZR?=
 =?utf-8?B?cXpiN1VJY3Z4SldTSE1ubnpXM0RVc0cvdVlmNTlBTmUwTnVzdFVtZ2dkblZG?=
 =?utf-8?B?aVRJTHlneERDZGcyQkFiV0NTV1l0U2ljRFJISjJhYXl4eWNwMUMwNzNFd0Nh?=
 =?utf-8?B?MWdRdHV6dnd5cDJFVXpsem1zdzVEZmgrVzk2U0g2VXMzRXNwWnkzN1doTmht?=
 =?utf-8?Q?healedcNF92Xn7dVKP5rXrppr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d66c6f6-02b5-40f3-ab4f-08db4c771527
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 08:10:54.4597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NddVjoidE3TgwVXRAvf1QiWkw3yRPcbdGyNIRMmn8yWHl5i5A4AhIAEvAvdn1vgRXwcmKK09lphUSY7zhyeWkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9078

On 03.05.2023 18:31, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -4,6 +4,37 @@
>  #include <xen/const.h>
>  #include <xen/page-size.h>
>  
> +/*
> + * RISC-V64 Layout:
> + *
> + * From the riscv-privileged doc:
> + *   When mapping between narrower and wider addresses,
> + *   RISC-V zero-extends a narrower physical address to a wider size.
> + *   The mapping between 64-bit virtual addresses and the 39-bit usable
> + *   address space of Sv39 is not based on zero-extension but instead
> + *   follows an entrenched convention that allows an OS to use one or
> + *   a few of the most-significant bits of a full-size (64-bit) virtual
> + *   address to quickly distinguish user and supervisor address regions.
> + *
> + * It means that:
> + *   top VA bits are simply ignored for the purpose of translating to PA.
> + *
> + * ============================================================================
> + *    Start addr    |   End addr        |  Size  | Slot       |area description
> + * ============================================================================
> + * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | L2 511     | Xen
> + * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | L2 511     | FDT
> + * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | L2 511     | Fixmap
> + *                 ...                  |  1 GB  | L2 510     | Unused
> + * 0000003200000000 |  0000007f40000000 | 331 GB | L2 200-609 | Direct map

I guess the upper value is 509 here?

> + *                 ...                  |  1 GB  | L2 199     | Unused
> + * 0000003100000000 |  0000003140000000 |  3 GB  | L2 196-198 | Frametable

The two leftmost columns cover 1Gb only.

> + *                 ...                  |  1 GB  | L2 195     | Unused
> + * 0000003080000000 |  00000030c0000000 |  1 GB  | L2 194     | VMAP
> + *     .................. unused ..................
> + * ============================================================================
> + */

Two more remarks: This map is, aiui, Sv39-specific. The quotation from the
doc doesn't really imply that, so I'd suggest to add something to make this
explicit. This might be as simple as a suitable #ifdef around or inside
the comment (even inside I think it'll be easily understood what it means;
see e.g. the CONFIG_BIGMEM conditional in x86'es table).

The other oddity here is the sorting of entries: You sort downwards by L2
slot, but upwards within slot 511. Once suitably re-ordered it'll become
apparent that there's another "unused" row missing (or perhaps even two).

Jan

