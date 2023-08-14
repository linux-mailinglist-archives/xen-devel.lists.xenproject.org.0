Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A5377BCE2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 17:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583700.913988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVZOF-00082s-C8; Mon, 14 Aug 2023 15:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583700.913988; Mon, 14 Aug 2023 15:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVZOF-00081C-98; Mon, 14 Aug 2023 15:21:55 +0000
Received: by outflank-mailman (input) for mailman id 583700;
 Mon, 14 Aug 2023 15:21:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVZOD-000813-Mr
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 15:21:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b7912db-3ab6-11ee-b289-6b7b168915f2;
 Mon, 14 Aug 2023 17:21:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 15:21:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 15:21:23 +0000
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
X-Inumbo-ID: 4b7912db-3ab6-11ee-b289-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2n9i/CIPa6pmBYhqOAAX69nPHhxKRmxQslOEtfW8RwjgZVYccoL6srnmOFhBX0htT5bjWogURNvmDSCUUOuiJTPfhN4ah3v1SKM8usGXBjHInqHa+cjBuooJM9UUSVTyJh8HHsFJC9LPBh4i8gbkK5C6+MtIcxVta/F9J2tXoR87lZEvOLh3VHXk6RUpwTg+6j2deo0sdtwAEOx2WYQzX3nXDkgfwbtwQGRTDUkbeu62pNGueqo25W3nHz+/FNL8Ja2vrBSQD/HITS2h6EBzAj/QHHncz73IFVg7AtavbhXmLlif6SsC/W65Mx0sun/W/ZNC5Q1OU8+KuEBPZwC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMuCYPjsq/uoaxkV5cQCo+ZFI//TVApCj/i8xWKO1bg=;
 b=Ve/pGRqxRoISxlMex4q/7o+IQaQ22Fsj64c0PcORWvK0E/lPPRi5SHCIOllJjf1ipJP+Xr0de46DSzzPZvKwAFeJp3ga+r5kfnxtCed/HlFTleoXYy266kcun3U9Gy9MA9SpdO67pT1xUcSq+TJ1nRWITFASdC/uTlZW07isbZLNCCV8KaMZa7g0ddF3Ciq8N5iUwrAcxJIVTwdp/v8wtrKUxdfODe3wxjDD26LdKW5uOnAsmryNoMrnjju7ZYXFQFWp+crpwZ/qHWvFcZOMzpOmmlq9gsDaoOOmFBbMheyc8D8htPdJ0w0yj7KqtZwbdHfx6UmmDUXwJQv+OxC5gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMuCYPjsq/uoaxkV5cQCo+ZFI//TVApCj/i8xWKO1bg=;
 b=sXQJY2/xAniuf5cm5hzPKkcy6X2eR/56q3AI0s7T7TpbX/UIZeLrArcYW3zrc22LqAonjSX6eC4TMlJr/FAiYPqyOZxvQ2tN7nfJsMMjsinPP622qVQc1yrHh9KWXKD2jqqnNbIUbcMbj/0xewoSHuu9JAemSvlSb8HHikqKLSzGT/slIKuk9N+Uf1PW2VC8Sqp0rleMAiJ8/8rXKotKKW2kaLDBlRzOKdhwbQ6bFyDKrUBQYrrmpyEwt41+mGuIh5x0nDbnR0H18N/0lSNfWfRIbW9jzgtbV1EhGmNz5NGieq1W1fCx7m/9KCS+qRp5Re8ooY30UsXUtaEeRQ5LHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c99ef09-cde3-e35c-f9f0-00c06b754786@suse.com>
Date: Mon, 14 Aug 2023 17:21:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Build errors with fuzz/x86_instruction_emulator harness
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d4826ecd-fabc-03e9-2ec3-788877a560b1@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d4826ecd-fabc-03e9-2ec3-788877a560b1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d99e63e-fb3d-45c4-e36e-08db9cda1e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	olc8WzMp0kijkCg9mHSi4e9vPS4hJ6YypUS75kFjqsTdrQ6BXOlVNdVk1bnWru4dG3l1HYUH+e8OQPI9stWuadzT3beSaWyUIFyeRwt+rnaPRSLg9Y3w4ATPkZj8zewRnjD13RgQnlqwRexyxPUybVuPDk3N3Ooo9uN6AkIPL3OvJ0OpOMGPVcdd4Y7ok9xCXKDNRcV6KHPIt1JuC1c6Mpi2rydmF+RcrSQaED8k/Yi0np6GB4mH9sX9IY7HVfjqNDXkC6XNReSmG0uMnAEsJY1vvZkbIQCUBHojsVX5d4sxdznzAcpr3C/OT4onMSnCvjqZeWnFf/m3sudTlt5nrIQTcYFCp38RI7/4w4OnwuXfLI1gzX9xWt1aJcofPoSvxQ0PVmw/e7oUuP5780Z8N2ZEAFFE34RnOOBmJYl+x+BqejUYDq1eBrIZ7m1qyewKHMR1KoXqfLQXGec3m7Tnqq2Sb3j1RsqwjBr8zkXax3iMnOE0ZYeS8Zd8HDf4jMZ74QaPf8+xjaj4cA1/OKnDnnylkEMANh/auFoQCtvg8C1eUvw3eyDQ9lOTXowXE8mcnkUu+6T7hfZJCNaKAs3vm+I2GcK8LJiyEybR+CcXdP6hQHYRSPIeTHuFCXzwp+/RHILVJ1ZwWYFZ8GXpiucUsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(376002)(136003)(396003)(1800799006)(186006)(451199021)(83380400001)(41300700001)(8936002)(66476007)(66556008)(66946007)(8676002)(316002)(6512007)(31686004)(2616005)(53546011)(26005)(6506007)(6486002)(54906003)(478600001)(38100700002)(31696002)(36756003)(86362001)(6916009)(4326008)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tld0aGl5NjN5RFhmcVcvaDZRQTB0dG1QVGdTakMySHdXTkFxU0RPQ3ZDLzhX?=
 =?utf-8?B?QXc1TDRxTnJuWWk1K2NIS2FvNnVuQjd0bDZhR0ZrZXByMFR1SmFoT1B1RG52?=
 =?utf-8?B?Q3p0MnZqbGFMZUl3SjJYODNtQWNFZnlBUDhOZmhpNkxDK3p3VVRFczVmRGJQ?=
 =?utf-8?B?UnM2MDZiNUlyZ2pBdGhKRGtHSFdUWEhGaVNmdXlRQXExcjkyK2xNU0hkQlhT?=
 =?utf-8?B?ZFR0cS95eTZjMUExY0ZBQUtwZlhpdTRpekpDQ0RsMmJxYzl4TnFZTVZqQmpU?=
 =?utf-8?B?YS9sQk1BWUZNc2FtOFRUZ3ZZM3BvRStISDFxT0hwOElpS0E3Zk1wQmpHcE1G?=
 =?utf-8?B?bHgzR1pYY3FEYTFCOHFHMTBmVHZ6d0IwTWFxRFhCMHJrV1dNNDk1TWNZS25u?=
 =?utf-8?B?YUpDRmpyVU5hdGxyNjlTZG84d0R6ZmkvT1dLL3BaMHI5WkRUWmx6YUwreVlL?=
 =?utf-8?B?OXhydnBValFUaTZlcXltcy8xQnhIQm96Ykt3ZGJoOEZMK1JhTTcvUEd1VFY0?=
 =?utf-8?B?Sll1U1pWckhzbFdkQTZPNXNacTdvWG9CZmhER3BkSHBDTWN3NGtUVGk0NDRK?=
 =?utf-8?B?aUdOZ2pJbTNiU1haaUpsVWxaakxTY3FHRHRDQlFRS1RVazk3cHFld1VjWTgr?=
 =?utf-8?B?MjV4RkpTSjBtUTlZUUh3NVh0ZDh0Y2N4Rzh1OHdnbGFHY1BtU2htbWZNVTlK?=
 =?utf-8?B?TnFMRzRtY1RnK3BHb1BYSEw0akxvb1RtT2lHUVdxcERnYWF1QzR1Y3JUYnQ3?=
 =?utf-8?B?WDdna25UTmtESG1naUJpVWNRcWxNNEk1dC9CUW44NXFxTUt2MDAvUGVRZzBI?=
 =?utf-8?B?Q2xWdXNldGFSb3ZXSDBSSW4zZy9icEZqZzRTY0ZlTDdrbTNqcEdHNURrNXNi?=
 =?utf-8?B?WmtDRm92TEd1a0h6Z3NHRFd3enFvVzdiRGlCVWNBbDF3UDdWdHhqRDFRK3A3?=
 =?utf-8?B?dXNZOG5TK1lVMTVZcTBUUU9OWUVOc2xSdkMzMUtGVXVmaGQ3OFlrb0VBQkl2?=
 =?utf-8?B?MTh4dGoxRndBVHBzL0h0dkQyUElqVWlDM3JxMGx2eFVMblNqbXRVQVRYNUky?=
 =?utf-8?B?amlaWHdpTDdVNUNFWDNDdkhtME9ydFBSS081K0FQMUJNWDBodXdvZ3kxSzh6?=
 =?utf-8?B?MDRjbzJuWUVJRDFTTGtPVkxSZFFxUkFqcXduR1R4ejNucmYzem9UaVJ6OXoy?=
 =?utf-8?B?dEpsNWRKTjBwampHUDhZRVFrdGJ4VWo3SXJBZS9wNlhNalFTZWVWdkdCMlVS?=
 =?utf-8?B?M0x2NmdIVCs0MTB5UmxSOUhwNTdlSkdYSjhBcjgwYzBnODNyMm9DYWZLYTNx?=
 =?utf-8?B?WkxCdFEzSnAwcHU2U2psR2JmSG5KQ0ErYjAvWk1iNjIyaDV0Q0tuU2xwcFVG?=
 =?utf-8?B?YW9PN1NHNktQTHpCajVudmZKbGNjNXdqanlFRmpjNWhyeWZnRXNidVNmRVJU?=
 =?utf-8?B?bDJrbk5ERGwyc09uY25jL0I3blFNTmd0WnVkVCsyS3JTRWVqWG5UQUVhRW9u?=
 =?utf-8?B?eE1uQWQ2MWg2RnhiYklnU1YzZ2tKR05idTRYeWFzamFMbVJXWDJyQndubmtZ?=
 =?utf-8?B?ZDlPZEovR2RCc3BNc1NNL3JmdTF1bXNhNE5hK0xhZHloRUw2U0pzOWVnL3BE?=
 =?utf-8?B?aGpEQWlCNnBSZmlKUjlGRmc2R3ZRbTJCcWR5KzVmN0NxbFJFa1V6TXUxaytm?=
 =?utf-8?B?N0FOeVBxaU80UFlINU1VbjdMWldZTGlGb2IzWU9RVW1VV0QrZldlWk02Lytm?=
 =?utf-8?B?ZmlJZm5zV2pzb0QyOFl0ZUIyZDJjdElTRFJwUTFxb3JXZFBBb2Nydng2MXlu?=
 =?utf-8?B?MWNFY2IzYUdXdUdCUUlGRW1IWE5kTkFZL29LTmlWSlpEZnF0ZDk3VWdwMmZS?=
 =?utf-8?B?UG1ieVFvZ3c5ajlDZjJSUjV0di9XZ3ZJRnQ0NklvQitzM2xOMkt3QnV4L0tZ?=
 =?utf-8?B?NXVoZWtDL0hRMGUzM3J6M1FqRlhsbzdkNG1Ub0syelR6U1R3eXJzQjNTMlM5?=
 =?utf-8?B?NEI0akdySEdEV3crUWg4UVp3eVcwVGtJVkpCV3YxN2pRT0NxV05CV0srQWFn?=
 =?utf-8?B?WDY3TEx2ZE56QXNCTVk1emVYVVZnM0NYdmdYMSs4TEJCRGtFd3FqZFluOUtl?=
 =?utf-8?Q?USzAjk55tt1EAH0o+QlN5MdWI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d99e63e-fb3d-45c4-e36e-08db9cda1e46
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 15:21:22.9023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OliZ1JA8TJdxG3W42N/Bq9xo5GkM9oVWXULpu5crJnx/YwKJUKC+GO09OOqcs6b/k9tIHK0xQawDf1JbhQh2dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

On 14.08.2023 16:52, Andrew Cooper wrote:
> See the attached log snippet.  This is current staging, with a GCC 13
> toolchain.
> 
> First of all, a minor issue.  Counting the number of
> `-D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__`'s, we
> have included CFLAGS on the CC line 4 times.  This is something that
> appears to be in common with all of tools/ and is probably the primary
> contributor to exceeding the Gitlab CI 4M log limit...
> 
> Next the error.  This doesn't build when CFLAGS coming in from the
> packaging environment include `-flto=auto`.
> 
> Clearly our wrapping trick doesn't work with LTO, but it's not obvious why.
> 
> readelf -Wa tools/fuzz/x86_instruction_emulator/wrappers.o | grep emul_
>   [223] .gnu.lto_emul_fwrite.38.43da3a7fd30cc0a1 PROGBITS       
> 0000000000000000 01c2ec 000194 00   E  0   0  1
>   [224] .gnu.lto_emul_memcmp.39.43da3a7fd30cc0a1 PROGBITS       
> 0000000000000000 01c480 0001a7 00   E  0   0  1
>   [225] .gnu.lto_emul_memcpy.40.43da3a7fd30cc0a1 PROGBITS       
> 0000000000000000 01c627 000175 00   E  0   0  1
>   [226] .gnu.lto_emul_memset.41.43da3a7fd30cc0a1 PROGBITS       
> 0000000000000000 01c79c 000186 00   E  0   0  1
>   [227] .gnu.lto_emul_printf.42.43da3a7fd30cc0a1 PROGBITS       
> 0000000000000000 01c922 0002cd 00   E  0   0  1
>   [228] .gnu.lto_emul_putchar.43.43da3a7fd30cc0a1 PROGBITS       
> 0000000000000000 01cbef 000216 00   E  0   0  1
>   [229] .gnu.lto_emul_puts.44.43da3a7fd30cc0a1 PROGBITS       
> 0000000000000000 01ce05 000180 00   E  0   0  1
> 
> shows that there's something relevant in the object file.

But only sections, no symbols. Doing a simple test with a trivial source
file, I observe that no actual code is emitted at all, and hence also no
symbols. Which means our trick - working entirely behind the back of the
compiler by inserting .equ in the assembly output - takes no effect on
our own sources. And really the errors in the log fragment you provided
all point back to standard library headers, where (just a guess)
something may be done that cause _some_ code to be emitted, for which
our overrides then take effect.

> Manual poking about in the build environment indicates that
> tools/tests/x86_instruction_emulator is similarly impacted.
> 
> Any ideas?
> 
> Obviously we can inhibit LTO for the x86_emul userspace, but that ought
> to be a last resort.

To get the build issue addressed, merely suppressing LTO for wrappers.o
may suffice (provided such mixing is permitted in the first place).
However, due to our overrides not taking effect (as per above) I can't
see how the resulting binaries then would work correctly.

Question therefore is whether we can find a way of effecting the needed
overrides (including for compiler generated calls) without resorting to
emitting .equ (or alike), and hence without doing it fully behind the
compiler's back.

Jan

