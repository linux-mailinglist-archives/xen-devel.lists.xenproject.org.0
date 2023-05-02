Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C65D6F3D35
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 08:09:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528348.821368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptjCm-0000PU-R0; Tue, 02 May 2023 06:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528348.821368; Tue, 02 May 2023 06:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptjCm-0000Mj-Nn; Tue, 02 May 2023 06:09:40 +0000
Received: by outflank-mailman (input) for mailman id 528348;
 Tue, 02 May 2023 06:09:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptjCl-0000Md-Hm
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 06:09:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea8afc85-e8af-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 08:09:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6980.eurprd04.prod.outlook.com (2603:10a6:208:17e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 06:09:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 06:09:34 +0000
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
X-Inumbo-ID: ea8afc85-e8af-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpgS0IdSxkR6dJoK6CWdJbwlLbRN/cwMh37o44u/t5+p4fDHfW8BrOc3XdFDHv1QQPlAO5tA1NgkXHaVk9nPXvlNy4WzIe+us1vsUBjHd1fle6HtwV9qbIHGnujBKBY+Q7ZV5aPmJSxJ3VYTpjG+jOAbHox5JcmQ/KOga4qLgLEHVjZmANM/4uLyCdtn32sNMWNHA2HyeVlvoVxA5Y65wnjhDDOey469tbBFHyOTdRsh3TlkKckYE9STJsScbucAl70gRYFVrDMFF8fl3MkySn/9s6fCk9ZYo85DMh35kB4iTTN4JZjZy2RZGWBrc8Mls44xKc3h8Qa6oG8jxL76Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdlqNXxo5ZGgTvs/sF34dAjMHKHhoq8d9qTIJr7mB+4=;
 b=jIMF5SR1qM4S1N5pJbjHNNZIxHY0zTj57AxOUI7Oc07T0njG8Ssx6zlrrVvdDngb2EO0HjpLy5NtA9pcEyXVYprVCj4AHNjyuw4/gyjB9SdX/vPip/fhCe2XChTcy5fuSc+ebNH2eFHEHgiuVKVDsCPu0XZJE8K0dkG1J793MGh04AcKg1FWk4GoSROcbZQ8tR5zWegZKD1VpQatsipAJli4vtIREHzGq38pvtc1gGAlqBjKizH1RUyhdAzB3gt1JjL0UtnpS4Ww2oSSwdBKhgP4qtKLW8nBDKvW6aABGFhy0hF4wWHWQQwhST/51GhOBX2TqVt6gv2IrAoiBUGDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdlqNXxo5ZGgTvs/sF34dAjMHKHhoq8d9qTIJr7mB+4=;
 b=saZRC4PGRXEOhQDCqtJENtdzPJcG+A16tlEzmZyvctIyVVXCKn5KoeVcya3kU7URnlMM7AtrKsTFVuHZGrVKlZFYPizMRLD1cAJrFeg0mXuz6226lKPXbkNR8AV2xWFGCWhiWw/PYCvqv+alRFPEmPKwVeTmgdjYUkckX/tsVjM8guxu+Pi+gKqpE1oWkjCPJcQ9RV7bB2BZ+4Wr3KBBfJf4eGgVCmBLlVwpYNseV5v8UWhzoCWGlCyc5QgPLFm3rqTtmQHAJ0DZciTEhp+1+zvRDTv/0DK7V+yinG3ubfCugJibvv7ML1FGuXQaP0wbr8DbZDRZ/l7/zJYnEd5RjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <322276ce-2586-4b26-cf1e-ee1b467d3ebc@suse.com>
Date: Tue, 2 May 2023 08:09:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 1/4] xen/riscv: add VM space layout
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
 <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
 <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
 <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
 <509ba3a2-0b85-d758-6915-7975d31a3437@suse.com>
 <db3a9b3b-63db-89d1-5386-57eb7044b317@xen.org>
 <d157b1e2-cfc5-f7b7-9443-16d1db9a4311@suse.com>
 <5176b0bc-3727-e939-9776-ee4bfd732e32@xen.org>
 <016a95e8cc1be45ce1821aba0570ff87973c4c35.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <016a95e8cc1be45ce1821aba0570ff87973c4c35.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: cf742a4a-5952-4f14-c154-08db4ad3ccdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L+On3FYj2wlTuzcDAKKLmvJNWuhEvpqHdroQw+a0f5T0dKMesYXFFO5kmf7Vv1zlPsH4cOBZdyWgkyiAejPOy3+YSOnDt7FCZmr/HH1t9tZW8a8tdSPhMSxvKw5xDMLOI6SdJsYIj/kpmTJCIkLXSrJcWKKerV7ekCkG4o+h2DKZ/PWuk/FcPwtbO1OQ/CxX5HXQ5BXqsHisYM30ZTM8MewuHD8ovbvZZpeSFcTOeDc9jYPHYFMeJMeuLJMXtgwIpJ+jXgsbaQNLo/LOJrAGzagEJ2j8rRCsDvAjlHjzcV4pj8ipb0au/E4uYs/eBb80HBV2zfG4bb/+5mHzDBzMJTHRlrc8P6Tbgx/B7mZV5+HlqIH2qMJrw7RfE6pcsmBa7iw+CN8ZavJgxPwWOfLPEJZb8uYtt+X10MXAqvDYd2B3eZ7WdUui2/FPpp+KVa65QjT1tL9nFjh5Z6OchNH5zSDPtrJ53gtOh9xZKPyQ3q2uDxfqichbm4vWSKndsrFROvMt6nk8Yj8E0cNXoP8KW8zefUhKY7sedBzkDWQWgdGbt0uUXNzB3Imu6ybGuGOfwUr0VXuoJik/lFf7NI1V8aq7ihRIqr9ZmLEv2dCEKTmgo4tbgx7Shd7qEkjADZ8qUlLNnSxTnTsCjNRSB8P52A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199021)(4326008)(6916009)(66556008)(5660300002)(66476007)(66946007)(31686004)(2906002)(4744005)(316002)(41300700001)(8936002)(8676002)(478600001)(54906003)(6486002)(53546011)(36756003)(6512007)(186003)(2616005)(26005)(6506007)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2djK2dXWi90OTY3N0trT1pGdFVNRlZXV0l0bGJHaHJkdktDRmZRcGlGaUZH?=
 =?utf-8?B?dFFNdDZQQ095VzBFeGhjbXE2ODIrWTlhUU0weldyU3pYMkdBZTQ2M1cxQWt1?=
 =?utf-8?B?cThkZGxvaXJaYWIvbXNGRHFSVExNdTd3YWlYcGdNT25ialMyRFBkVjZmdXdK?=
 =?utf-8?B?WXV5a0l6Z0gxajRjQ2tqOEplak5aZU14NXJNZGdnaldRVlBoTDYzNWF5SDQ3?=
 =?utf-8?B?am51azhDTE5PN3g0aHVWSTg3Z2VHNzlRTS8wV25ZMkF0SGJFdGRLL2RlbXp2?=
 =?utf-8?B?WlNRNjE3OGFwVUJlNnMxa2dGWXZSSnovZmxJc0pHOUtGN3U5U2dZcFMxZlFz?=
 =?utf-8?B?K0U1OXYvdFpHcUpqQVdNMTQ2anpqNGR6WmVYSDZMTFd4QjZrQzVGaTgxZTVP?=
 =?utf-8?B?VUxnYnhUWVBSK2pXVHVGNkwxdytVc2VMV3BmM2dGaU9NT09Ec0JtNDUzTmM1?=
 =?utf-8?B?M0pMYUoxeEZpSFVqZEZPeTVqaUZYME91Y2V6ZHNmck5Nd0hWT0lGbzVXWGYv?=
 =?utf-8?B?d1I1WkFWL0U2R0ZLYWVzbzFqTjJWVm80U2hoUFJGWWYzRlBIOVRhL1lqdExN?=
 =?utf-8?B?SkNzdnlpeVY0aXkzcGJxeWxrbENnU0o4V3NrcHlnMGFGQ0QrRnVwVmJEM0ZN?=
 =?utf-8?B?RGI4Y2hTems1bkNpR24zdG9xZ1J1eWxpWDJBN0JkTXdub1pQQVYyMEVTLzFq?=
 =?utf-8?B?ZFA2KzgrSCtXZk5sWVVydnZ4Z0tjb09UZmFhdStyaVROWWxZcFNZOCtLeFdC?=
 =?utf-8?B?YnhzTmFwemx5aU1tM1VLbEIraFVmSHlhUnVBTEtCc2IxaG5yUmF5WTBHbW9q?=
 =?utf-8?B?OUROdlRVZE1wd0R1S3lSaTR4cTRDRWpvUjNUcTBOeHFpeGJXb0lkeE1WbjA2?=
 =?utf-8?B?bGxMOGw4UDVtMHc0SDdPcEJnSFBXN0V6UGFXeXJwYjhBNzZIS0UyRXJucnZ5?=
 =?utf-8?B?QUlhTzRDWkt4L1c3Vkk5eldGN1lydVZ6MEhkNDJueXBYWWxkN0wwcUFhTTBk?=
 =?utf-8?B?ay9RQmlJWkFuSkQrQ2hXY2cvQjEwWTVENGNkaFBpQy9kM3poN1dYQ1pyVjMx?=
 =?utf-8?B?aUZUaWZTRFdhSTNrekJaLzliTGdGSllOSk1qM0xrNnhTTUtsU1lHb241bGdJ?=
 =?utf-8?B?bFZTZVZLbHVBZmxuZTVZbCtwa3RrbVJCYTRNVEZXNEhDMmJOOUdNSmthZFMr?=
 =?utf-8?B?OHN3NVBwb0MrQ0hZSjQ1NkIzWitlR0FFTzZ0OWRVY201VkYzV0tPZWo3eFQr?=
 =?utf-8?B?K0tTNnRjNTRkT2I3REtpWVc4cWhOMGNsM3ZvSzBhSnlZVCtMRHU2VnFMV3dL?=
 =?utf-8?B?WGp5clhXRnlkRUFSVXNnSENWVzNoOFhBemJpRndGRmNMUWNSL1NJUkM1TDNT?=
 =?utf-8?B?UU5BMHVxM1lhaGs1RUFBUGxIdEkwenpNNmxFRHpJNU5RTjc5SkREcVJPQXlP?=
 =?utf-8?B?bXRRaU53UHVnY04xTWI3VDN5Q0RvdEgrRkhxUU1FL1RkWFVraFV2T3JqaTNO?=
 =?utf-8?B?Q1NLQTcvRVdJaWNlWmZvYTcvZFRkR001SEhuMU8rTk1GQWR6MGFzWkN6ZnVl?=
 =?utf-8?B?Ykl6cDRSRklUbzlVMjN4NnFzdHIwOTFMM2JSZkcwVVhBM01MTXBoUjNtOHJn?=
 =?utf-8?B?OTVuUkJxUjBHbUpwNzBlTkxNTzNYTTVnZGRWL3FUY0c4bVkwTy9ZNGc3Z2hO?=
 =?utf-8?B?YjdOb2gyeEMzVEhUb09DYlpiM29KWE5pRW0wNEI2bkxSbHNFdG5TUUZ2UHlT?=
 =?utf-8?B?YlJMSHJuTTMxekczNlFTR2VtU1FlbFluUk5KR0hBZ3cvaDZ1R1N4Q1ZJVVZ2?=
 =?utf-8?B?amtmbDFoT3o2Tm1OazVXMXVVSkVqcHdqN3NnTG5ENmhMWkJyR0ZQajVBZndO?=
 =?utf-8?B?dllNZ3dzZE9CYnZUY3BnQUxrMUlIbm53OVdjZHduNGZTV2xvUUNUMHF5Zm1i?=
 =?utf-8?B?Um5wRjVnR1hzRUk0aktGV01udDZrMnk0bmo3ODh6LzNzWU5lWGsvUmZJdm9Q?=
 =?utf-8?B?S0tuT09YYkp1enJ2OERpcGhVSUZhNnBCOVdUTWw3dkYvRTNnVDB5R1UrZHpX?=
 =?utf-8?B?ZnlxMkFDODZQaUxUa2tTaW9Uek9Ia3BvNU1YZFJBS1VZOFAxK3BzSVZaSit5?=
 =?utf-8?Q?KhfplRuEJHUyVYlw5AFpT/FfD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf742a4a-5952-4f14-c154-08db4ad3ccdb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 06:09:34.0106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wF8F//uxxDFB7Q15Ad5+AIgncd4BE2lW2TgdAF7714JR99w4bqNAg7pRfIfKClV6g9RvLs+AlwTyp1mkIAmV/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6980

On 29.04.2023 12:05, Oleksii wrote:
>>>> For
>>>> RISC-V, I would recommend to make sure the struct page_info will
>>>> never
>>>> cross a cache boundary.
> Do you mean that size(struct page_info) <= cache line size?

I don't think that's what was meant. Instead I expect the goal is for no
struct page_info instance to ever cross a cache line boundary. IOW one
of sizeof(struct page_info) % cachelinesize == 0 or
cachelinesize % sizeof(struct page_info) == 0, or in yet different terms
(with the expectation that cache lines are always a power of two in size)
sizeof(struct page_info) == 2**n. Yet unless you're able to fit everything
in 32 bytes, that'll mean more overhead than strictly necessary.

Jan

