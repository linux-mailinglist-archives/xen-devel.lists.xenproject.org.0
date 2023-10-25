Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA467D65E9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 10:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622724.969808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZgw-0003HR-NN; Wed, 25 Oct 2023 08:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622724.969808; Wed, 25 Oct 2023 08:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZgw-0003E5-JA; Wed, 25 Oct 2023 08:56:42 +0000
Received: by outflank-mailman (input) for mailman id 622724;
 Wed, 25 Oct 2023 08:56:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvZgv-0003Dv-67
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 08:56:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67034475-7314-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 10:56:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7669.eurprd04.prod.outlook.com (2603:10a6:20b:29b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.18; Wed, 25 Oct
 2023 08:56:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 08:56:33 +0000
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
X-Inumbo-ID: 67034475-7314-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sk/wQMhFJeo4lrDX71u5FMO5ss0q0EGcj+A61AFBuzns6B2O19Cjtrrt8vvF1txkIoJI2rqdbxbY+bsRKf5PXYs+gn7diJp8oJH4aL5uXRS6reMYYKPGIhYSq8X+af1NC6ZvRAt7g1NaYvFw3FyYdY5A3Cm6ytoj6MPF6iZWQ3shAsikX7YkpUYelAdfDimWcQVsxjqm/38ifrEA5oSrnOVsVVvtxpIQohPj9tBQG2ICVkDAnDRNEX0q5osA0MqkpVMZOBrWz92oOqYrag/6HfT/nfCSp0fi4GWm8Jdu61LbQDC/013h7/tcdQECmEWCplgXofhQ8cSJB6+xtXowpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fUTbTbQGJxxRRhrt66KxqM//FooPHHKk7wSHiTN4h4=;
 b=DpS+oEQAIx46oQK6cNfci3jID1aEIbYC25dKzZ05VTuro575glQCDbdmlKmN49DXymWTNP5AN2iHDGxcDhs7tSNMx7n/V91IRADoFVbSRvjGHeiGIdHbbVIlc+b9s4EiYeZRv7b7+ypSGEm2qTgUw5MllDlJb0Jxh5QC+naZDiSy81OfbNdWXCDLW/hM5u2s3Ibq9H+QWTlm+/+cFvU8VlLVIxrfRkKEaFPi1RSLR2093lK8cgzvQm7+WtDfPKcteuyaG5+W8h+Zm3Y9zG5hcy6qrpJiVCf1ASFC5NhiK4wc2BGUvMY7xDN2c+174zAVYZ3GKggTFQJfJNBIRphTiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fUTbTbQGJxxRRhrt66KxqM//FooPHHKk7wSHiTN4h4=;
 b=YNPiZ3x/xnrCL8qjOTn3kXRF8twRVRj5ZE/0CdWrK8lzMeCMBp2MIqhNMmtiwwk0NGoSOdtqOxIUXUHxZyPFQoeN0Ap4ve/jX78MSLTOqN/Zn0JUCMIiG9BkXmxzrCKxYvVTsqNJMDd0ElQq64g+YGTnEdBSm/sThI3VF+KTpc4O4DlbAJCClrvYrUGoWwxMSrg9mWBpCKlxE7Zd16/JrMdY96zDX2fAkTLTwAEM7cR04N4Q8aGoHx4FLS9zHQsLWntEnppmQfAzsJGF5wy4m8CptPB0k3GPpNtXiNRzC6kqbdyubrOwz1+NPTHzZ32QAHmt7Tl04y90Lu4bhg89KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa78ac18-b127-da92-bb04-6cbdaded3bef@suse.com>
Date: Wed, 25 Oct 2023 10:56:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Generalise the usage of exclude-list.json
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <5883E219-2C0C-4809-852B-704C6ED0E736@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5883E219-2C0C-4809-852B-704C6ED0E736@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: a16b14f4-01fe-42a5-77da-08dbd53849de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+30udcST9VruHMmQI81dH/2e4jK3Q98k5lsVb8e7qiiRSW6pfOD0mUw8PmfApb9U1vEZo4jZ3rAtP27gKo8fp20sWcg3cl3nkBaV0Sx7Rg3/+eVGWCeOv3ah0fcyhstiQg3SX5uOkLSUBpGZ9PxPfBbtA/DcxcJWwiBLZ3/An6hr57nqwbUP7wGYfzBvMSclU4XHdyGxiVMLH16aYhTIY9DmLB95fYGv6FU8oaLhH6q9zHlQIkYn8+3jr+cFbwJgOKX8E8wL3Dp/HgtlsDEl4HKstQCAbPuiF4/uwzX5syAthnjH6Xl8ekBtL4HfjSAmTO3zEbbfwCa+J7RJ3OEYYgSRRV/IHS2Lm11ESoQg3foHTyLbws8oPCh0fGiK35ROLRGiE0mNHTtPeV1Dl1JWoX5r1EbZgw6t99aiNFTAmPTj2021FmFRMeD9MoA+LIFhk/eemFTzRAiyrRDVlpldjvrnVKsfPPPAZ8b/NN9qkngNUG9HzmXt+7TPhDUK56ipkkfE1xvlHxw67RmC4w8zuE4Bvv8eWFKbw5Z1O65GZZ48HGMwrc7E7Uhs7GhGQGTMLQTO3dyMlKUu2NtgYpizYI2xUcb8nk4pB7XSsoREzXUk9nRXpOP814rUWppQxPyYipf/OvqNlZDNgn1gYxkzDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(41300700001)(8936002)(31686004)(31696002)(5660300002)(86362001)(4326008)(8676002)(66946007)(54906003)(66476007)(66556008)(6916009)(478600001)(316002)(6486002)(36756003)(2906002)(26005)(2616005)(38100700002)(83380400001)(6506007)(6512007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVkxd3d6c0RoQ0xQMWpoNUFERFpyUzVHaHlDWkJiUzBudDNOMWZRNVBvMnhs?=
 =?utf-8?B?bUsveHI1eml5T1pVTXByMmZwQlc3dEtJRnJUQzZoaUhxUWpvN05xQ1NEVWxs?=
 =?utf-8?B?bTNrdisxckpFMW1jdkZPdVRDUzhEM2VwYnRaWTJIcEVrOUJHWEVlMVgzOVJB?=
 =?utf-8?B?ZFoyV254eGVBeUhERnNLdkZZMVJNVEw4djRaTW5YaDdDZkdWVHlYQkFYN3JQ?=
 =?utf-8?B?bDJmTTBNU1VNNFdlSE8rSTYwWjRadmIxVnNVTityODNJaUF1L2xDYkZ4MjJB?=
 =?utf-8?B?WXV0SVp4NWQvMGFhL0dkcGxHdXIwQVdOUVE0ZDh1NzZOajlHbFpVL3RXcmpR?=
 =?utf-8?B?NVZkczJTQmRCVkJRZGJlM0FnNStUdHhkUDgzTkovSnlXUys1Q1FrZUpzOWxH?=
 =?utf-8?B?ZytkemFMbE4xdXZnQWk0bnEwdk5mTzRMTXZNclNjaGJHODI4YzhpRUlPWWtG?=
 =?utf-8?B?aEJFSHhDNGtGaUY3TVhucUE1SmZ1ZlRpbUNkSDdueDkzNnY1bWVrWWhBUW51?=
 =?utf-8?B?dVdMRUM1Zys0ZXluejI4bXV6S09vQVJaY1E0U2FDTmdXK0FTdlRISS9tajRp?=
 =?utf-8?B?aWVpaVFWZHJya0tmSzFmY1ZjckhvVU56L3ZGR1RwblZaV1BxbU0vNHllcUly?=
 =?utf-8?B?OEdrQ2RtSFM0dGlnRDRsdkpNT2EvTDRXNTcrL1BZT003ZExLblFuT21KTm5H?=
 =?utf-8?B?dndYeTU5ZENwNkszdGs5TnJET2dzWUgrT21ZZU5YblZGaGZNODFLMzh1N3pC?=
 =?utf-8?B?b0h1YzJqYzhzem4rL2xpNlY1bTViRkx3akZHRjZrTUt4RWdIRlBqZlJodGpz?=
 =?utf-8?B?NnZlS2dCZ21PWDBKZDdjd0VPaHBBYWpoUDU1c2h4TDNvRnhqYkRWQ0R3NzJO?=
 =?utf-8?B?UWF5OHZKOHUwcG9nZENCd0YwaTlUbGRkRWRnT1lGQzQ1NkxkeHlMUXBFT2Qy?=
 =?utf-8?B?UFAwUWh0NS81VXFVQUQ1VDExVW1RTHl2aElvL1B3czNSZHhuRjh1NU9xaTJE?=
 =?utf-8?B?dVBqRVgyQTlmN3FveUVCTC8zZUw1OVRuNHhyWTRTc2d0NUgzWjFMdGxWVW5o?=
 =?utf-8?B?N2VjTCtkSnE4ZnVDeEpsN0FnWjRub3FTazBqdzBSN0Fwc2FlbUw1VzMyN3FY?=
 =?utf-8?B?TXgrOHpNU3pFNW80U3dHdG1Rc0J0dHhtendxWENMSmgyTk5CZTJpVGpPckI3?=
 =?utf-8?B?SkpNZThZOThHbWljUHJobERpZVZCZDVaTEdqMHRyVzFHWVdySi9jQVFEbkhz?=
 =?utf-8?B?Y1Bxd0ZkbGplMXZMMGlvalluVE1uOW5zbDdzOUxFZmFoeTdTUGFoaWFDTTlU?=
 =?utf-8?B?OHVjN3doUm9nSENNR0dsOEJ0SnMzM1FYdk9SMkdvbHl4aVBOMENTUXIySENx?=
 =?utf-8?B?TWVBYnlCekt4VGlLVEYwZGpqMVJhKzBRcGFrS29mVmg1TmhuZFA3bE5COG9R?=
 =?utf-8?B?Qm9ucUNTV0dVTkFobHhtRnE5ekJPMEFiWDVOcXNyZ1FWU29HZjA1cW9LdTB6?=
 =?utf-8?B?WEZLZzlhUzNKVnNmQVpvRkJmREJWRFI2SVdKc1ltTU5DS3h5cVNHUmdiNUV4?=
 =?utf-8?B?UHQyb3U4R3QxeGVyeFZoaHVHSlJvSFJEKzlBdjhYUmU1L0RaK0xCWjNjREtE?=
 =?utf-8?B?blVEanBIR29XZzRNVnlERnRIWFFyN2I2b0JNRExvOXZVMGhLUHRZUlRTUmNo?=
 =?utf-8?B?MTRVSTQ5Z25CelBFUzhHWnVDZ2hlQUFQVEVCY2N2M1l5UWd2TmJlcUdxdDdO?=
 =?utf-8?B?VlFXNGZQUk41WncxUVhEeEtnTG1IZEEvNStZWGgwNEZVckxPV29UVko4cmdB?=
 =?utf-8?B?UVAvTU5qc3gxTElhbFk1b1N4ZVZsYWxKY0c4TUtpRzJoUk1Rck1CSWZnTmk3?=
 =?utf-8?B?OGI3NDA0dHB6UVBqYWtWd2ZjRm9WbG9maFA5ZkhJMHJ2NXdhOGxvM09XQnhO?=
 =?utf-8?B?NlhxNlhKbFc3NzlIbnhEbXcwcGhVQ3l3a2s0N2g2K2JteUUxeGJycVhDY2hP?=
 =?utf-8?B?dUNsRnFrVnBNVDRId2t4NnVUUmdOdkRSMWdzUi9HN3MrZC8zNEhUTDVrOVN0?=
 =?utf-8?B?YlhLY2xtQ2tCVlJ4NGlBcTMzNS9kK1FGNUlrcGhmTStBOXlJK2YwdEZ0TVZ4?=
 =?utf-8?Q?VXcB6SFnPAXcpKiNz7CzJSy64?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16b14f4-01fe-42a5-77da-08dbd53849de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 08:56:33.8442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r96hJfw65nQNNNMHjwhuCzwlyYnUNn73W9l3syb8lh5LPrys2nVighpKP9cbCj048Zxq3Gd2FowqJkkogn7YVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7669

On 25.10.2023 10:35, Luca Fancellu wrote:
> I’m sending this mail looking for feedbacks about generalising the exclude-list.json, as suggested (IIRC) by Jan
> this list can be used by multiple users and not only for MISRA, by adding a field to every entry.
> 
> These are the modifications I would like to do to the list, I will implement them if we reach an agreement.

Looks okay to me, thanks. Just one comment on wording:

> --- a/docs/misra/exclude-list.rst
> +++ b/docs/misra/exclude-list.rst
> @@ -1,17 +1,16 @@
>  .. SPDX-License-Identifier: CC-BY-4.0
>  
> -Exclude file list for xen-analysis script
> -=========================================
> +Exclude file list for xen scripts
> +=================================
>  
> -The code analysis is performed on the Xen codebase for both MISRA
> -checkers and static analysis checkers, there are some files however that
> -needs to be removed from the findings report for various reasons (e.g.
> -they are imported from external sources, they generate too many false
> -positive results, etc.).
> +Different Xen scripts can perform operations on the codebase to check its
> +compliance for a set of rules, however Xen contains some files that are taken
> +from other projects (e.g. linux) and they can't be updated to allow backporting
> +fixes from their source, for this reason the file docs/misra/exclude-list.json
> +is kept as a source of all these files that are external to the Xen project.

I'd suggest s/allow/ease/ - backports are always possible, but may end up
needing to be done entirely manually when original formatting was altered.

Jan

> -For this reason the file docs/misra/exclude-list.json is used to exclude every
> -entry listed in that file from the final report.
> -Currently only the cppcheck analysis will use this file.
> +Every entry of the file can be linked to different checkers, so that this list
> +can be used by multiple scripts selecting only the required entries.
>  
>  Here is an example of the exclude-list.json file::
>  
> @@ -21,10 +20,12 @@ Here is an example of the exclude-list.json file::
>  |        {
>  |            "rel_path": "relative/path/from/xen/file",
>  |            "comment": "This file is originated from ..."
> +|            "checkers": "xen-analysis"
>  |        },
>  |        {
>  |            "rel_path": "relative/path/from/xen/folder/*",
>  |            "comment": "This folder is a library"
> +|            "checkers": "xen-analysis some-checker"
>  |        },
>  |        {
>  |            "rel_path": "relative/path/from/xen/mem*.c",
> @@ -39,6 +40,12 @@ Here is an explanation of the fields inside an object of the "content" array:
>     match more than one file/folder at the time. This field is mandatory.
>   - comment: an optional comment to explain why the file is removed from the
>     analysis.
> + - checkers: an optional list of checkers that will exclude this entries from
> +   their results. This field is optional and when not specified, it means every
> +   checker will use that entry.
> +   Current implemented values for this field are:
> +    - xen-analysis: the xen-analysis.py script exclude this entry for both MISRA
> +      and static analysis scan. (Implemented only for Cppcheck tool)
>  
>  To ease the review and the modifications of the entries, they shall be listed in
>  alphabetical order referring to the rel_path field.
> 
> 
> --------------------------------------------------------------------------------------------------------------------------------------
> 
> In this way I could use this list also for the clang-format tool, excluding all the file from external sources
> plus the file we don’t want clang-format to touch.
> 
> Cheers,
> Luca
> 
> 


