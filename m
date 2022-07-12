Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C96571218
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 08:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365475.595643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB90u-0006hV-KW; Tue, 12 Jul 2022 06:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365475.595643; Tue, 12 Jul 2022 06:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB90u-0006el-Gt; Tue, 12 Jul 2022 06:04:52 +0000
Received: by outflank-mailman (input) for mailman id 365475;
 Tue, 12 Jul 2022 06:04:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oB90t-0006ef-7E
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 06:04:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60068.outbound.protection.outlook.com [40.107.6.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89b0216a-01a8-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 08:04:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4119.eurprd04.prod.outlook.com (2603:10a6:209:4e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 06:04:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 06:04:47 +0000
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
X-Inumbo-ID: 89b0216a-01a8-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I++Xyg6+BwPg5Tfe8YLy4t0HgdexwFFJEWPLEbf2TJm8a7OdHzdg4cleV1Pcp5pWsP83D/PIBQD+k0cPP7fnYPU3/CyfD1OxHtZ35gf5rI4JH8NuShPpcw0lGrHVa9nSkbwiLqRUzOaT/Ieg1a4ALoR9x7nHbPyANk/m3TM5KnVU+tyWE63x9DUdFQYKMOz0IyuFrKFx2JFGs6TbHkbMhiQErrvuXX/4i1gI9FkPUMi+5/qwSWZjJp8Gc3YQviPMLqCuQqvYSyNCFoEu6r3uJN9Qwyi7yiM2wJUc1DfJqzZamdbYO8fk375dpJZuwhEI+ywNU+VDiGHGHRK6b6khjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PL3iUGSj/s59UmAxr8hbUAo5ntSKbpo9xVkBUbU8SHc=;
 b=avMKQAWacWZiaVWhbf7OzztWi33KE/cv/m7gzE7mkFaJMPbcDsAWy3gLgtac00ZC4IzJDaYUw2pb9aKYEs47tqH8yXjM4XV0bdD9gTbz2vuhSN0u1ywgZTS+j4erA3NjhP+xNvzZrZ4vNcQZWWt2YVqU+kktI2EwFDuzGgZED+usUSWAEW+UO6lkICF2f4mn4lRk8vr+N/0GmfE/Zn7qdbhT07DdRJ4hl2zeCU2C3c7layHjqBQO0nYLHmWVLjKz/6SxYBWjB88xXLw5rqjuDRP06LJJZNrWhxOmcIpgckREAXYhobf45jAgh3t9loqfRTpqyk61pSI74CACgHbCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL3iUGSj/s59UmAxr8hbUAo5ntSKbpo9xVkBUbU8SHc=;
 b=Pder4MAL9fGA6u0+5fL1d3ODCOfeqHCRBkRO+holtB8tS0PlwjcjjoTUsbdd/btkUnVJJOoDdS++Yg5O7WUjvUM8ewhD5y0bPW8LN3NZ5CX1A6PdIIHJrFI3Tv5GDnT+gRA6xI6Mxz7TdXQJg7YfMa6bPsTiI+aZSmTJ997iy3Gbixbl5V5vZ98Jg+puxE+rqbexLB+1QvEoogjjcAzTtfMw+OMEovi47qS1Me/tccKwMm4Q3xbRDNZYkz0RpQboa/j2nGtvA70HfAE3yM+uikl/o2/gCgmI1sbJkSdO3acq7QhNZyCqLlkcRm24ZZR4y1ORaywoi+Etn/DxG3P2cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6afa42fd-469d-5b08-1688-5af8a3c9d8fa@suse.com>
Date: Tue, 12 Jul 2022 08:04:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86/PAT: have pat_enabled() properly reflect state when
 running on e.g. Xen
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Andrew Lutomirski <luto@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Borislav Petkov <bp@alien8.de>
References: <9385fa60-fa5d-f559-a137-6608408f88b0@suse.com>
 <YsRTAGI2PhfZ5V7M@zn.tnic> <016d281b-7e40-f1bd-66ee-c19c3cc56efe@suse.com>
 <YsRjX/U1XN8rq+8u@zn.tnic>
 <4e099e2d-e429-252b-ceeb-678066d85e61@netscape.net>
 <aa8f99dc-e622-398e-1a68-6b060497e4b3@suse.com>
 <d49e87a0-417d-194d-daa1-952f707f096c@netscape.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d49e87a0-417d-194d-daa1-952f707f096c@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0057.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02286521-e32c-4bfd-bbce-08da63cc6cc4
X-MS-TrafficTypeDiagnostic: AM6PR04MB4119:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rLgObuDKR5FWru0xMTyLnFa7D2hTN1Ho2GhgoplxseAi0v6BGiWVgwzj26vA6Z22/19sbtc1XXDuJiEkoLupwTuG8RCTnPA3CBKU3OoA++dWBwX4Hss3DIF8FTnK2t80VrUl11PzHyu93dW4zanU1kZTYtjHkB43+BJtKHjE9kLSPdwWzWbgUp2d1mNHQpViANcC/+43YcOMbmcr1rS9/YvS+gtSCFU2JNHkM1Q7iDcEIHwAnw7k7IDDag4tLSTM6nACVsFsWQTvgX++eu5zC/VZtSsS+S3I2Y09YUgXhUXQYq7sDddneOcXh9M2iy/rtxKnT47nCoRm1GEmH1SB75Yk63CZDUP/Kwz7iWVut/e6sSShJVGVzwNzuWnuD0jtPCu9IBdu3hE6f/Uh/Gw/xMrZiaa+IR0+DS4G+B+tIIDOCMs+Pmppam8SYq8+pHK+2rlAo/Xe9E7S7K/4RrPkYEXKupLayGvXOduAPU4kVk4bFICShhwo/GJTrXvUbMj31jdrPQNPgRrx/DBIw0fY3DySpAvW2CDGgptxS59jWOfWqnkwHjOGoxLa21sLjz0xuBu1tkI5c+oU2ZpXv1WaB4r1hja4J+a9RpsBHLghR9lGuOEpoXdXdIBU1SmNyso/blvuLOuPp4fs/N6ha05reMdKZDAy7QbiR2sanaiF6j60xqHoM20fB4iRHAuDTIgI1BO4JrPGnlByLUp8cI26nq4rc66qAjdhbylOQ/uMUd6yf9iMGAi5CNMalaKmGs5fsjLyP+XkOYoCmpZW2Q5hPmbKN0eJQY+AVR9EfPnKnhKgYtfL6rOyCKP7zKOa8WjeqTOXDuDFWhO6NWEN9egQXlPW+fueaatSTeh1WLIrxBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(366004)(376002)(136003)(36756003)(2616005)(31686004)(38100700002)(83380400001)(26005)(86362001)(6512007)(186003)(31696002)(6486002)(6916009)(2906002)(316002)(54906003)(41300700001)(478600001)(6506007)(53546011)(8936002)(5660300002)(8676002)(4326008)(66946007)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmdsL3I1WkhNMFFkU2ZxS1FjSFQxcVp5eUlYcGVGR2JCOGJuemNZTDVIaFhQ?=
 =?utf-8?B?Q2lHcXRXa2lEeVRud3VoelpERWFaSmxuZGlTVzNYZHRuaTVGZWRGckx0QVgy?=
 =?utf-8?B?NnBWcFcvZVdMUTRxSVgvZDlaZXBiRjhxK1JlS0svRVNML21LKzZjTjZVTnFu?=
 =?utf-8?B?eVdEOGVnSXVQL054RkZOcjZXYzlKWlkzV0I5ZEdkQXRLUCsvVVlGS0tTdkpS?=
 =?utf-8?B?c3ZtR2pHUWE0cm5BeS85dlNlV1JiY1RXSTc0aWNzSjY4TW5CUXV3OHBZbHor?=
 =?utf-8?B?eDBZNlFNc0R6YzFJdGxPd3ZjdnNkaVVPbXd6TStJckREbzZsV3RoNUFOQ2Fr?=
 =?utf-8?B?akU5dVllUlltWGxyOEpGVjVQbmJhQ2RpWjN2L1Uyam9SdzFZK2gyai9TYUto?=
 =?utf-8?B?WHZpMmdFQ0NSTncvR051bmhNa1p2dWNWMXU2aDUyS1NZVlNKNHZzUU9kbWIr?=
 =?utf-8?B?YnQyNEtTb1A1YnZNRjByQzhMcEQxQ1dqNVZ5cEV6SUJOanNjMXluY1ByZG1Y?=
 =?utf-8?B?NzU0NFlKK3Awcm5aMjB0VnliR3FocUYvTEZRVUJyRzI5ZFNkSUtUTW5tQVNC?=
 =?utf-8?B?VmZvRC9DL2tHbHRhOUVXUmVXdzhYbGtobVVMcERtd0UvR25Yb1B1T090cXFk?=
 =?utf-8?B?M0dzVlgyQzErendhdUNINFh5cExaNlNQWjgzKzdLZS8rdG8vbHFzUlluVVdh?=
 =?utf-8?B?KzR4K2VZMVpyKzBjOUw2b3IyZWc0clNkVEZhd1JCVVdUMjRPWHhkdzdza3Rt?=
 =?utf-8?B?L3pJenIyMFFlZitXb1gydUJXZ0lsaERYaCtyb1N0OFNLQnBSZnBqY1JlWVJo?=
 =?utf-8?B?T3hkZXZxUlc1YmpvZzY1d2VRTGVIc1hLNEgxdDlTV3dQWGx6VFFxMHNQcXVh?=
 =?utf-8?B?QmJva1RMSXJvUGV2a3hkMmdVRDBabHVCaXY5Yi9pUGtwUHZZVURRcStxWUVP?=
 =?utf-8?B?OWEwUzhzUEhDclRFMlozNDZGUjB6S2ROMXJhMGlTVWJkWGJzSzFYY3RuTzc2?=
 =?utf-8?B?Qy85dVcxZUV0SWVMOE5MYWV5VkhORVBjbkN2blpCSUd0OUdyMXJxOFRoVVQ3?=
 =?utf-8?B?cDFxcVBNRUdsNEdpMjRtbTg4cE5neVVjNXB4bkNUNmlPb3AwVGRLMmE4OHBt?=
 =?utf-8?B?VUlmV2g3aEhUcXZ4Y1FEUmtyYlNRUDVGdU1YT0J5NWY3eEJmQ0J1QWp5TDNO?=
 =?utf-8?B?QTlJUE1FYXFUYTlFWGpEaXk5WFdZVFZUUTZVeG5USDFGanl3OTN1TDRndmdS?=
 =?utf-8?B?TkVkSlAyZGw4My9IdW4xd3EzQlJjdGdlaUNlUHg0TFZCYS9nbGJhZVk1ZTlm?=
 =?utf-8?B?em1xbHA2cURva0d4S3BDR0hOY3RUOUZ2T0ZYRkZ0Z3Z3RURtSk9pVnk2WFAx?=
 =?utf-8?B?R1MxWGk2Wk1MeTRmaWFiMUpoRzYwcTBhYjNHdFJ6Rm1VZ0lzbFJlVnN6MDBK?=
 =?utf-8?B?WEoyb3JkSTdWOUZUYVZsTjVNMVBpRWxxTGlRb0s1V0pYbnJNcUdhREcxb0VW?=
 =?utf-8?B?WjlXd0lnSE9zZ2JGdW5FaTZHZVdCRlNwdEFIbjkwYk90TWdLN2VQd1p1emhq?=
 =?utf-8?B?VTF1SzF0K1RZMnZlT1lLOTZqcDlDYXdEbnBiSnlJVFN1Sy95eGd0bUw2OFVo?=
 =?utf-8?B?K0RWRDVDZEYzQUJSeXlOc1FoQlRwMkUxZXdRRzh2azAzOFF3RG9xSEFCdDVR?=
 =?utf-8?B?V2Q2UU81Y3NRUkJQWXFFb3JXMHV6YXpyWVl4aXRKb2xDVnd5bFZqbjltZzFJ?=
 =?utf-8?B?NXJOLzN5TUtNZ1JlWWI1eCtnZi9KSFpuS1hMMC9EK1NnNTFTdWRCYkE3V210?=
 =?utf-8?B?WW45Ti9XeFJyc213MzhvenZUZDZORmtjNkNQTVNsdVVsbHhDbXR1bXpsaGxr?=
 =?utf-8?B?L3VNYmVXQWMzODVOSm5NcnpSa0MvbjYya2NGSFIvUzE5T1h0Qkl1TUJpcVRV?=
 =?utf-8?B?UmN6Zk9LSWlaV0tGSHNYaUFYblhRbWZpZU9lWTNnbjdON2FodEpoNkdEV3R3?=
 =?utf-8?B?QjFZdTVlN2FYejB6eXBNV29LYnNoYlJRYmNzU242WmNZZGUwL25OeERlV29T?=
 =?utf-8?B?d0d3cGVqUlJIQzNiVGhwTnc3VVN6ZE9mUEJwRm9mckJnUG0rd0RVaTN5alBU?=
 =?utf-8?Q?Wu6LPl5I/qf7ly6OV211GuCv1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02286521-e32c-4bfd-bbce-08da63cc6cc4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 06:04:47.7532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIQAQcdZOXTDYTHyW9CW4Dc1c7FgAIl4oMbfWayZxdhmAJ2vwUXfh0e04meSaSxF/eMs3Rywq21vHQorQm9ukA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4119

On 11.07.2022 19:41, Chuck Zmudzinski wrote:
> Moreover... (please move to the bottom of the code snippet
> for more information about my tests in the Xen PV environment...)
> 
> void init_cache_modes(void)
> {
>     u64 pat = 0;
> 
>     if (pat_cm_initialized)
>         return;
> 
>     if (boot_cpu_has(X86_FEATURE_PAT)) {
>         /*
>          * CPU supports PAT. Set PAT table to be consistent with
>          * PAT MSR. This case supports "nopat" boot option, and
>          * virtual machine environments which support PAT without
>          * MTRRs. In specific, Xen has unique setup to PAT MSR.
>          *
>          * If PAT MSR returns 0, it is considered invalid and emulates
>          * as No PAT.
>          */
>         rdmsrl(MSR_IA32_CR_PAT, pat);
>     }
> 
>     if (!pat) {
>         /*
>          * No PAT. Emulate the PAT table that corresponds to the two
>          * cache bits, PWT (Write Through) and PCD (Cache Disable).
>          * This setup is also the same as the BIOS default setup.
>          *
>          * PTE encoding:
>          *
>          *       PCD
>          *       |PWT  PAT
>          *       ||    slot
>          *       00    0    WB : _PAGE_CACHE_MODE_WB
>          *       01    1    WT : _PAGE_CACHE_MODE_WT
>          *       10    2    UC-: _PAGE_CACHE_MODE_UC_MINUS
>          *       11    3    UC : _PAGE_CACHE_MODE_UC
>          *
>          * NOTE: When WC or WP is used, it is redirected to UC- per
>          * the default setup in __cachemode2pte_tbl[].
>          */
>         pat = PAT(0, WB) | PAT(1, WT) | PAT(2, UC_MINUS) | PAT(3, UC) |
>               PAT(4, WB) | PAT(5, WT) | PAT(6, UC_MINUS) | PAT(7, UC);
>     }
> 
>     else if (!pat_bp_enabled) {
>         /*
>          * In some environments, specifically Xen PV, PAT
>          * initialization is skipped because MTRRs are
>          * disabled even though PAT is available. In such
>          * environments, set PAT to initialized and enabled to
>          * correctly indicate to callers of pat_enabled() that
>          * PAT is available and prevent PAT from being disabled.
>          */
>         pat_bp_enabled = true;
>         pr_info("x86/PAT: PAT enabled by init_cache_modes\n");
>     }
> 
>     __init_cache_modes(pat);
> }
> 
> This function, patched with the extra 'else if' block, fixes the
> regression on my Xen worksatation, and the pr_info message
> "x86/PAT: PAT enabled by init_cache_modes" appears in the logs
> when running this patched kernel in my Xen Dom0. This means
> that in the Xen PV environment on my Xen Dom0 workstation,
> rdmsrl(MSR_IA32_CR_PAT, pat) successfully tested for the presence
> of PAT on the virtual CPU that Xen exposed to the Linux kernel on my
> Xen Dom0 workstation. At least that is what I think my tests prove.
> 
> So why is this not a valid way to test for the existence of
> PAT in the Xen PV environment? Are the existing comments
> in init_cache_modes() about supporting both the case when
> the "nopat" boot option is set and the specific case of Xen and
> MTRR disabled wrong? My testing confirms those comments are
> correct.

At the very least this ignores the possible "nopat" an admin may
have passed to the kernel.

Jan

