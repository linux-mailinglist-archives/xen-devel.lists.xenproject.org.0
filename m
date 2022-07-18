Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F3577F11
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 11:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369467.600895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNRz-0004gw-Ri; Mon, 18 Jul 2022 09:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369467.600895; Mon, 18 Jul 2022 09:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNRz-0004dd-Np; Mon, 18 Jul 2022 09:54:03 +0000
Received: by outflank-mailman (input) for mailman id 369467;
 Mon, 18 Jul 2022 09:54:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDNRy-0004dX-Jn
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 09:54:02 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50079.outbound.protection.outlook.com [40.107.5.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cb15c87-067f-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 11:54:01 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB6218.eurprd04.prod.outlook.com (2603:10a6:10:d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 09:53:59 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:53:59 +0000
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
X-Inumbo-ID: 8cb15c87-067f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ss2VFauA/15yjAKgmEh0cYLqrZL20RzVvDFoA+qmP/S7e1l+TrvEcrA7iBEkX2HfWzkhH8wt8sMbnuAODH8FQElHW9BxAQE75bxBq6DVJev4/wib0bsQuLfDluvX95tlA+8kXDFT9T7rmlPnWzjokMcHrauZxscSR+v0nQmjEuj3So5efOtdQCL0IZ62LYqSm5WigEM0PlRdWjqQ71H12YqelSL1cJV8mi2VKZT5wmm5S/o4WZk1y10j7B0S6U5Sr+soqRgFDOXhp4drfqYxLcQleZkhs7lfB6j2cy4Glbp2JGsXPaWOz6HuWNBzMoNMv+M4g9oHwm+TIRTteTc3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9xodgE5LBf9b1OcI6jGILzYQ/ZOc3DQVDTLo6B3ccM=;
 b=hSoWso2/wdPGS0wJAKB+famTqQhHLIrTgfQ51dF919q6w/Dxlc6zgkxVd1q/FwH/oFEb0FsuT/FtMCr++KsF6dehBPk/Zz6j8JKSSlmQEbyu9jmkUfzeHoPyTbtBXs3vBUa4tHqv1PS7KjBRKIb3gHqGscuk6RQwRuqYK05X/WXl7hXrh/HnGJIEbnDADoo8rxoIRCVaT+jo4h6Ueg8o3kiGjD0Dlh2I7MvTBzNzxNdf/ta76Purj05589q7piikFpLwL4Vsq431/ZAywlgJO7qbEUtEPjphOBslLyVZpfk0kI5G4Bf9ybSC7kH6B5Cg+p/K7ods9yPpiKbMDPpIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9xodgE5LBf9b1OcI6jGILzYQ/ZOc3DQVDTLo6B3ccM=;
 b=jheXQyU2ZLbE188hWtu+Aj6MwFIl0lrQ/FTPwrWnT5dM6IcwCuY/vgBRRs+y2W7HRzoy6EFcgl0QYhe8UBcxtHTeUbqcYKlykkeHgO/XHzumLriFsIHGNFAo/8uY3aK35iRy6dwSocKz9sE7KDKwwguwRtawXNgXM5ZN2W0nmeY0NWZYAxrUdxEDP1CaSa8uFwthuTIeSyM2JKbquM6eczXsDDLMmm9Vnt9KHRr3pQFIUa6U24oATdA5VS9kbueZgrsmGCc3wV7RU3lSTDWb5OWnxzSkQ7Lev68SCwctQvMU+KyAOtpzSRS58c2qQW7mP6Jb+Cfda5KA605BnEyzOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ada4075e-db9f-cf20-92c7-423d5d0f31a0@suse.com>
Date: Mon, 18 Jul 2022 11:53:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/5] xen/wait: Drop vestigial remnants of
 TRAP_regs_partial
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
 <20220718071825.22113-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718071825.22113-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::8) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 275ac16f-4074-4ed6-0a04-08da68a36fea
X-MS-TrafficTypeDiagnostic: DBBPR04MB6218:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u36OmBtBmTRURsgsKDFeSi17ykcjJPBzGnq2H0hHiE8rVelHfvGI0N7azOq2Vo8HwifqWU+i0oFmtIXqu+HF/oqQ34MXXWEaemZ/Ea/ZJWg1eVqbiQZ0C1FwrHQyTbuQ4fzLngUJEAMPPbHQe3HruTAJB8/t9QOi3A/fhbX+kzuuze0mGlcVD74O5XmmByTlIiHtUAmATZENQb6q4LyCmRj7InGXoAO8IBjqC9AaAFVCiYwRHaLigr/vwVi2hJHFnSSmD5JTin7+i4yhO5yJKfoRcNk1aJ2TBSpLggiXxrKcF2rr4Gw69i3kit9rd0YcQNaOwFJp3KU8x0wuDZ5ackwCcdR5FQViX7DbtNovEcVaoExMYDtceEL1hxDd0N7G7e8RN0CAhQEr6b29hrHvVlcMJGi0QMRjZTRNhJeBtbbGHaqMRoShgvduSSeKsRlkaLozby7A43/Jl8qRwelokoWk9utidId84yyNX2KBD9q7hZq9k4a6RoPCEx29NaZmQg4Q+JTeoG8Z/vhausuMGDWglcjUrqBNaoS7e5g6lrTvgxGWgLYTJu5q/koK3DRBYGLTzmpjMputv9x5x9DoDLCuAkD6N/341uI6fLT7+hYiU3GUJ9/yrFUjHpyzhKyFxc0OrCYf6FW+1IJKJYw0kO9mBrTuDMI5Gn4Lk2B8xKBmy5emGt/g92TUOFGYQAR5nx5PH6D1mhWGHv7T9D2LtShFsyj+euMItqX10tG6X6v7Mmjmvl9V/0dgQK2M+KaTakWgLlRQmj0u1VgCPm9dH4eaaL5JdH3Lz5N1gG6Sye1H1DR3vPm9ivvcTfN2VvSWgqL511yCHL8eVzQKE8cN6+HKm3cd9ixvh/fX+h4GQSw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(396003)(136003)(366004)(83380400001)(4744005)(26005)(186003)(6512007)(41300700001)(2906002)(86362001)(53546011)(6506007)(478600001)(6486002)(5660300002)(2616005)(8936002)(31696002)(38100700002)(316002)(6916009)(4326008)(54906003)(8676002)(66476007)(66946007)(36756003)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEFiM04rRWRidmhFVHZkWkZIc1FWeDlIWi9RZ2tHRUovODJFN1ZLb3ZqVUNv?=
 =?utf-8?B?aUVHdVJiUjdJc0UxTTBCTU9NRjErNWhUcDU1NHFXY2RsUktBTlREWHZHWnRO?=
 =?utf-8?B?OUd1WHFhTkdSTnRPaFk4NFg3elEvKzZiSklSRTlTKy9NQjZMK2hoZThxUFkw?=
 =?utf-8?B?NGRnQVJGOC9UTkVVUzBaYlgvaWQvNHNvUTR5RFdaODBESFFaNWJUTXhvb2JS?=
 =?utf-8?B?QXovUjlncWdseUxyekZhQlMvY3RSVVRYTHJwcGdVa2FhZDRoUDJsSTJieXJm?=
 =?utf-8?B?cWcwVHZCRHFBL0FCVUcwVHRhUldXVGZsSS9tZ3hQdjZCTHF1OUpiSEU5RG56?=
 =?utf-8?B?S3ZLdDFzbHdGanlmalJnN0llL1FiVzVZUFE1MkplZFZoeldQekRSZFhwaDVz?=
 =?utf-8?B?NlZxZ2cva2tkUEE4ZWVHL1hMR2lRMk84a3orZnVSMUhiMjhYNTUwWlhyWE5x?=
 =?utf-8?B?VHJjTmMzZmd2Zm9reXhrNE1vV3Y4QWVpOFRYR0xyUW95bFNtNFg5bFh1V1Zq?=
 =?utf-8?B?cXNnL1FTNUJkRUM1bklHcjdVdXBtVnpvSU02NXJSaU0rWUFrWHhQRXNmQmdO?=
 =?utf-8?B?MEVOUkdxMjlnMlQ0Ym5MS2tZSUtRVFBvZWpEMUhxMzZwcVFJcGcyL1NMWU55?=
 =?utf-8?B?ODcya3hNR3k1c3dtSkN3KzYzRGJGVmt0VXNCMndRU1NtbHJ0SFlya0doMmow?=
 =?utf-8?B?dmdlaU5Cdkp6WSs0WEZYTndpSC9CS2pjMXFEZUE3MEptcUtUNTh6Y1ZXY3JW?=
 =?utf-8?B?K21nWU5SdmRSTVpDM1U0eTJTSnZhZGVQWSt0aFh4L3BhV0ZFa3dmaklNZmZP?=
 =?utf-8?B?aGdiU1BuaW9lUEU0Zzh4c3ZLWFhvdmdPa2ludklIWTJtSUZsUlB1NnZ6SnYr?=
 =?utf-8?B?aTQ3dTZBZFRsNlQwMlZ0L3hsWTh6bGFyYmxuNWNLRm95WG5leTBHUEFrVDBY?=
 =?utf-8?B?dmx1MWVpSTRmWjl6YjdEbmdlaHVaVURYQm5oTFdEUkpaV2t2dG5oNEJubjdK?=
 =?utf-8?B?cVNHaE56Vk1Ya2Zvb04xQkRhcVZlOTB3Wnd1RFpmSEZCWldGUis4N3lkWVM5?=
 =?utf-8?B?Ly9ETVNxZDJ0MTdCdlhYTjJrenVhZ0d6cXFCOGRuNTRsaXVCUHhwVEk1ODd3?=
 =?utf-8?B?U1Y4b21rT0IrUzU2cFBoZjRFMzNhSFdtc1JxSlNnOEZvejNlUzVJc1dzVU94?=
 =?utf-8?B?Z3FiQjNneUJCVmRjeEpHVzMxRE1zcDY2UmR1M3g1eGlYVWpoRzk5dFdjckJ3?=
 =?utf-8?B?TTh6c2Y1YVlNVnBud1I4T0tSbCtOUkVGdk4wOUxHcVE4T0hQR2xmUzUxbHZx?=
 =?utf-8?B?TXZIVGlGMy9KTFA0aWxWZGRBcWJPQmVvOTVUbkZNUzFWM0s2NG41NjlGUEow?=
 =?utf-8?B?QWdBd2dyT2VrOXZaZjdTYlFrSXhXdHk0dHFTNzM5TWN1UHJ6M3Jzd3ppVTJy?=
 =?utf-8?B?MHdQRHg1VTlSYjJHOFl6Q2gxQnE2d0xUektBQ1FXQ1BFUkdvY3hlN01YcVBn?=
 =?utf-8?B?dFUyZytQVlJ5amkrZGlxWVNSaFd4V1llNWlMQkRHb2FYckxMeHVsNzFXK3NT?=
 =?utf-8?B?ejJUcTNPMmE4QUkycnZJYXo4YUVSWmxVUm5tOHdzV3I3Wi9LbUxFUXRrRDlR?=
 =?utf-8?B?L1BsYWZ3dFNRUnNoUzl5dWYxeDd4NVp4RkhNbkliZzJFM3M0OTFLS2xyQ2l3?=
 =?utf-8?B?T0lHMDlQdmc5cytOSlRvaGpkUmpQRndndzQ4QXJFdDI1ckVEOEdYWklrMXNN?=
 =?utf-8?B?dkVaT0xYTlhyQ1RvTXd1SXYzN0NoY0Y0UU5Fc2hsb0o4d1QxUWdiZjZzRXRt?=
 =?utf-8?B?dGNrRUVCYTlCQk8yemF0QnhTY3NlZElhWHAvV0ErdzhJSDBEOG92ZEhJOHRk?=
 =?utf-8?B?L3N0OXViOXY0czc3VVdpdjFNcVVuajAwUGdXclQ2WDlyK0xZbkdHZ1JNMzVB?=
 =?utf-8?B?RUp5WENBd3k2bU8wQmE1K2xXOWRZTURFOWIzOFN3QWkzS21QQ1JnU2NYejA5?=
 =?utf-8?B?QnprS2tLakNWNDdYZmMvVFFoVU9YRWduWHhhSFhyMUtzL0dnNGlGbldSMTVS?=
 =?utf-8?B?SkVuSTdCVzhEdDBqWkJlYW05OVpSb0lqTVdKMkVXM0lPd0ZwSHZzYlN0UVFE?=
 =?utf-8?Q?m7k5YA62mLKjVvZ2311hLKZb1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 275ac16f-4074-4ed6-0a04-08da68a36fea
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:53:59.4319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNfh52N83ImxEn5TD9obj4XLoO5lSHWo9CF1t5RhdaZCGIHwIV8H0HJVvzAVCo0ZshxhRG9VZNrrlxefcURYhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6218

On 18.07.2022 09:18, Andrew Cooper wrote:
> The preservation of entry_vector was introduced with ecf9846a6a20 ("x86:
> save/restore only partial register state where possible") where
> TRAP_regs_partial was introduced, but missed from f9eb74789af7 ("x86/entry:
> Remove support for partial cpu_user_regs frames") where TRAP_regs_partial was
> removed.
> 
> Fixes: f9eb74789af7 ("x86/entry: Remove support for partial cpu_user_regs frames")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


