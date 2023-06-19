Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4861A735201
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 12:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550984.860250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBC8M-0006pi-Q2; Mon, 19 Jun 2023 10:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550984.860250; Mon, 19 Jun 2023 10:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBC8M-0006km-MP; Mon, 19 Jun 2023 10:29:18 +0000
Received: by outflank-mailman (input) for mailman id 550984;
 Mon, 19 Jun 2023 10:29:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBC8L-0006eF-2z
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 10:29:17 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22fc6c39-0e8c-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 12:29:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 10:29:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 10:29:11 +0000
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
X-Inumbo-ID: 22fc6c39-0e8c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6LSNOMJqI3tEMaue9Udd9oOwMGncZWUnFyHQon8R5AZVv9vwwF9Ar4H8Rm/sZ/TYyimsBnPFNgjy74IzKza2GLdTFi/5fNf5kFLiaOYbVkwq06mZCAlZxEe7y7cwpqchs3QaSsMzRPq04T/PF/jHibfqCGwxKMoo+YA0C95gjoSFWHzc4gphANlAh4jMsbCwjIvxDWqCa5PhWFjEXp3JLvkwheHRkw1FsYRY6AIltwjZw0Z6bHD8+2nRnRnBXcYEvbOYzuW5IfQx/XcH5BxmUUfbL7xuV1bBbp/OvET/ekY0AAQvgr1cxH7/81sT4JdODckrv93cMc4Ga5c9fVLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOxnPM11Kr+uQ/ZTLcD8VI2cjsEOcTsTfR98ZlNN/60=;
 b=hp7/7a3U+poRk/3YoSXch+R5dLMZgTCLx4SdlroyYTjXhFMCYLPDdcGooiO0wCkizO9WGp5MzoQ5yOIP7Y3YT1b4X06OwLB8ZIwFkw8PYs5iwyDWPUZO4cxfDpDk71TEzPcn7K7Sh5KF/nQ5O5xpVJLNza2Q2pg2pMPAN3sRduGvcmR5PHfQimY93pjiLNnvx0hYCCWWdzaOMBdI/VgzS83GsYutylrYFLPkcYUryIfu3PpWWWmO7vFs7H11Kllj1HpPRd85dkv8qk1uGm+cXDgTrlEjjS9FLu/EQJoSmfT5fMpyEYE/OULZNhkQoRhCJhl0ZFKjT9cH7y7uJiDkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOxnPM11Kr+uQ/ZTLcD8VI2cjsEOcTsTfR98ZlNN/60=;
 b=PoUqEZFpU9BTLteCe8iHlbqbSsQcMJFlTiISjCaLKbqJnmhCVX5JsTPlpnhGpJdmy01n+yeP/QOuXyg2I/Mb9vCgl9EA8XtDhi1LdkuiNB0EBryZJ+UkeTgvpPETnCwBCnlbLaJY7xTTNaTsp/lItfGBSGF8FcdpFY81bLLN1+L4vkMBpnSJWgDxkPjF5bIe7CUHxY8VlMS3CuqBNQnUhR/87BObAgQchXArzA1IRV4Ad78D4kTbkL8S/aF3r1307LWp8K6Dgn3z7fRoNY0zFMDWEb+9IEsQo8erj+oYUOppVcJJQdMjJTLU3/dndcVjLSzGfRDKXOl7PAC2n90G1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6d66407-9777-160f-274e-3f0808cf514b@suse.com>
Date: Mon, 19 Jun 2023 12:29:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 3/3] xen: fix violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1687167502.git.nicola.vetrini@bugseng.com>
 <9c3c83c17cb3a4ee9cc1241cefc15840d23d107e.1687167502.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9c3c83c17cb3a4ee9cc1241cefc15840d23d107e.1687167502.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f412cea-5d6c-4ba7-fe40-08db70b005d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J7ZFIA5exGVnwDaw8UUGN/NExvkelEn1kDoIBvuOWHNK+4reMGrggC9ttfwCzXHbPvrSzUoTMThg6wcGGCvrWwW5X5R8b5adKd4bmC3YGVLhbFYE9kMYtw6ZsYM6019u2Q6QaOu/LM8n4cLN9LDaL9sz7/qihVJ3S8UjX9o0PXRhH7fw8OCkK+Hv+npp/DW/HP3wXGY/o9j21zjBE2zGFvzMXXSOOFS0iQhHuEUYYAcD17FozvNaNeJLRq7rcXiSTfs8KBTNhXZDI5I/DSqe/5qMJweF/FlV8iz35xhpKy4gDvCTmcmFfV6p3CViWoogmtpx9ytuyQScTSJq92y2b874Iv0XHoMolrw3hYWPlX6CFjFnPQQZm8m+YqNnYFqCAMAkDVZCKLp1bhH0ud7uosrpP9L2wrAW3UiW9OPa4aXDK4LYgKQsV/qnHjv/v3asoWlQP6kAlo+5RhWlRHxDGVB5Cz2ifW46gujO6tz6AGdZHByK4MqPTorfwR9tZ4xbj9Z7nkeMdisfBY3WU1NxJOIdF8bUV5ihqxK8zPYo+j7rGklnQDXbUqPJo0igSNNfl0e+q2lmCIkvZiw4id7I93SfeFzqoBb/icLTd20zNQVoy/Y49TBdoRPn4CKwpVkXEml954cW8lCFRizuFXRJZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199021)(31696002)(7416002)(31686004)(38100700002)(86362001)(8936002)(41300700001)(8676002)(5660300002)(6916009)(66556008)(66476007)(66946007)(316002)(2616005)(6506007)(53546011)(6512007)(26005)(186003)(6486002)(478600001)(4326008)(54906003)(2906002)(36756003)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkVjOTROeGdNYk15TlFhL21QajhFeUJwZHBRYThZNjU1aUJQcDQydU5lUXhw?=
 =?utf-8?B?VVFMODNxQzRvZ2JzM2xCanFiV3NyTVZnWW9XTW5yK20xdFRKU2F0aGlBWHpG?=
 =?utf-8?B?RGU2YTNqb1RVTjZ4ZDRIdXpJSjhybGN4WHdOZmp6OVdLck1pVGNXWDVqSndm?=
 =?utf-8?B?VEtCTEs4SnV4OFVtRGY4M3czYVhZNnFTelQ4Y3N2YTRmWkR1cllCUktZczlR?=
 =?utf-8?B?QnpDT3AxdzltQ1cwMkNPdzRpYng5bzB5TWFFZlZSUVRzVnBlRllJRDB0OUFV?=
 =?utf-8?B?a1FsMUMxdHBuMVFmTG91UW8wVnVvOGVVVjhyaGViNllCbFFLT1FIRFVnbStR?=
 =?utf-8?B?SXoxWDY2MmFYcUlkTkxTOC9yM0hPaWJiZEZxVmExU3p6ZFFrcWZIL3RYcE1H?=
 =?utf-8?B?cjQySHc5L2xuYm4yamcxNGZVRmhkUTdDR1RoVTVQWjZWWnFuUjU4enhxSWlm?=
 =?utf-8?B?M3h1MndBeExCMi9FOEtUQjc3M0twellDT3NWUFFwM0VtS1ByWGU0Zlh3cVBX?=
 =?utf-8?B?R2ZWNXFEUjlDSFpRZHlaa0RmZS8zcmxYZDk1cHFzdXZqTkRXaUxySjlMVzA3?=
 =?utf-8?B?THkvVWROYU5SVXZJUkowcG5xSEFyWVhHMjBlZFlUQVRBdTh4b3d1b3Zkdm95?=
 =?utf-8?B?WmF5bzQyM2tDMDA3UnpabDI4MC9HZHZReng3NUx5dllTdG9Cb0xnY3ZiSHlU?=
 =?utf-8?B?c0wxNmZMR0E0clJvSzRGUTlTY3czZTc1bHRMUmN2VmhpanhicHBhUy9GcmpK?=
 =?utf-8?B?RS9DSXdkTGkxR3hMc0V0d3laR3RDek1vNTBpZGNmNDRCVjZtK1RGa2tzRExC?=
 =?utf-8?B?d0JhR0JhUHlRK2NjZVo1NlFBVUt4SzMrcEluMFlrMFN6aStSREZzWjdTV0lU?=
 =?utf-8?B?VlJ6WEF3VEk3SWsxeU9Sa1lFeVg1RnMxVDBoTmt2QjdkWXkweUMzc3hxaEow?=
 =?utf-8?B?d25pdlZRcnI2U05xRkZ2eUtaM1JtbWlBdnhmS2Z1cE0veUJRNFl2bDZlTHJ2?=
 =?utf-8?B?Rk1GajRrVm85VVplYTdlSzF5RTVpT2M1RWpRWWlOMmlLWlNsaVhIMG8rMmho?=
 =?utf-8?B?emI5OEdjNjJSRVFoa2QzUTYzWjhIUGs0QTVkSEJxL3JIdnI1RWxpNE9Hb1NP?=
 =?utf-8?B?dEp6eGlBMnZFVnpxK2dDUnpLVXpNWmttTVAxVWl3eFNqMytqRVhTYk9WT3VC?=
 =?utf-8?B?VnVmdXJJeEVHcjBhRmlKWlpwaFpnRTdMZjZEYm5rbkZSUVVMY0FhOVBoSEto?=
 =?utf-8?B?T2dVKy9KNURsRHlsR3B3ejJZRDJITldPYXlFenQ5TGFQTFI0dHdoUVpmeHJJ?=
 =?utf-8?B?S2JhMGlJcmhHTDRIV0twQitnM1NnN3VoOG93TzNQcWhpTlZoemxvTmRwNjd1?=
 =?utf-8?B?S0k1ajVTbG1CcW1VNUw5ekVHdFVDNGdqTGxHK001U1g0aVJHNnFtc2k4U09m?=
 =?utf-8?B?djBOSkNzQVBZY2ZzUTUwRTA3Uml0UHdiRUphNVdTbWlxTkx1VTZNcHBEejg4?=
 =?utf-8?B?UTRmUlU3ME8vbS9telBjbzE4YUl3bFR6UDNKaGl3cWd2Rm15bmJUcFI2R2Zp?=
 =?utf-8?B?UUxCUjhYaUpKa3hsc1NOR2x6eU5ydVlRTTROb3ZIZlpNS0h1cUZFalV6ZnlC?=
 =?utf-8?B?Z1ZBcTZZaER1Mm1JeEc1aTVpVXVOcU1RV2Z5TmFFNmpjRXUwYU96dUxjdE9i?=
 =?utf-8?B?dWdpREU2c2VhY2lWWU5ZRWEzYlVZVXJlL0dEVU14UWJwRlBzZnBQMForSi9x?=
 =?utf-8?B?RWV1em9pczM4NVZua2hSTDNJNU93SXlLSkVzc0pRUXpOTmRoOVlQK3JiOGY0?=
 =?utf-8?B?NWVrM2lGV2FDNTFySDNRdVVrcS9DUEpjeUMvN0FHdkxvU1RSMFgrK3Voelox?=
 =?utf-8?B?Um5HZCtuSldHb25mQ2VGQUpUT2UreFRoaW8vU1hwbDUzYmRVNjhzOXJlajFk?=
 =?utf-8?B?V254OWQ3UEh4UUNpRkpiekpYM1BPNFN3YlZsMjNiTDBJdHJUN3M5eDY1VGpo?=
 =?utf-8?B?SzBWeDVrWDdiVCsxOXFXSEVraWNpZ0pJUU5RaDQzeGxmL2VydFIzSitTdmV2?=
 =?utf-8?B?bUZpd2NoaGI1OE42NnMvazAvZ2RKaHBxSzhRaFU2ekNlZmpGYUNkcDR5cCts?=
 =?utf-8?Q?FvRwyF2TLyLhuvQ8G2d1VnZ3X?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f412cea-5d6c-4ba7-fe40-08db70b005d0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 10:29:11.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bf6LA1yi8KMYj3O4eI0Rrww0ObYqFhwg3zSWRNxJv7gmwkS+hRof8/vNWt73Dj0VdDqRakvzEUGUWHyxMBBuGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179

On 19.06.2023 11:56, Nicola Vetrini wrote:
> --- a/xen/common/xmalloc_tlsf.c
> +++ b/xen/common/xmalloc_tlsf.c
> @@ -140,9 +140,6 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
>          *fl = flsl(*r) - 1;
>          *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>          *fl -= FLI_OFFSET;
> -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
> -         *fl = *sl = 0;
> -         */
>          *r &= ~t;
>      }
>  }

As indicated before, I don't think simply dropping the commented out code
is appropriate here. Personally I'd prefer if it was kept (using #if/#else),
but I'd also be okay with replacing it by a respective assertion. That said,
if other maintainers think this is the way to go, then I don't mean to
stand in the way.

Jan

