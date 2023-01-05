Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83A765EE23
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 15:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471937.731988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDQo7-00015F-5H; Thu, 05 Jan 2023 14:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471937.731988; Thu, 05 Jan 2023 14:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDQo7-000132-2U; Thu, 05 Jan 2023 14:01:23 +0000
Received: by outflank-mailman (input) for mailman id 471937;
 Thu, 05 Jan 2023 14:01:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDQo5-00012w-Eu
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 14:01:21 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e158459-8d01-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 15:01:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7976.eurprd04.prod.outlook.com (2603:10a6:20b:2af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 14:01:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 14:01:19 +0000
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
X-Inumbo-ID: 6e158459-8d01-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfYAIrI4wcKltuCEO6ZZUOZztEYPJ9+TqSQd+KEVEsL1yXXgX0YFpTTRmV7FO+NWioJ2us6AnLxg4mYUlVq3NxL9IRMYfZXZBrbuEE6ae6lqZMviIFGM4yueRdwz6N4FyJyh4w8X9no2sFX3DLcZUnFPG5jkPVPhsdUrR+9oeOKAjJhwauwqByEQt1AgUEsJJ9j0/REGscDO7qgWia49P03QsbRR/7rxEm17gG/BCqXFwMzDzZ6eVUmhHZ/FccW/FtfbGTRrM2oO0FK/XyvxWjg/JLYL8ZnhSu1gRhH0t3SpNTmdIJxlbESkNoTq9CDWO+WIMv1bhsdm+1Uuh4n7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXqvXHLbXthir5g+J/oME+mWyeNJxBhm5JM/UMSs7BI=;
 b=aRq0J+LJHeKQRhhtHQ3kv5v+85H53IkyBTqTWkpPeov0iX1F/0R2klcrT6IbY1bPJHggqdyokqiUfzJGiVrAHpRIQS5pxlKFgKunen5jBG0xI7lUcMbmYXWvEACc032gnVzvDvCkcg2I4aRChp0wn35lQ1sKO4B4HQM0pjmUlm+WX9OcW+GALQ79KMjog0q4zRsKLO/T7rOqfWNApiWiLNoDnYctQq3ofcPv3q+A1pektjjs0gqTcvce95j2wS828+3l+8r7jnT0V1Be4mzi/xMlMILmvLEsyxRQRSrbmyZrI/tSsEfODZ3DYkEgmoifiEOQ6LZ5LcuZ75l1RVbJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXqvXHLbXthir5g+J/oME+mWyeNJxBhm5JM/UMSs7BI=;
 b=FAq2xY1+TwLbzkWzWeeiyvWauQeT2opAZ9rAQ5vi/eYR0L3YjRhBqO9qIZzwY1tOvXIdquKidts187MiOvoNm3sn6Qbmi/WF9054xvl/LI3nVn+37nYy0CSHTgIAhYj/WILvFauRkgIuUyK7GR28sNXi/34Qf1St19i7l4+y0z68l3OOUfhsWG6DWyEJIu0ueW+MwC/mNI1aLWNMkJ4pQo3YnhvkSw1T3YO6ci/po2WPloo+6Lxa6+tB/6YTVn6WOTcyxnueUHJrf+CJbithowANGiQiUb3YxtbMUCjaom03KmiwsfjOWsTtbXKEYLPRINIwx9k5k4e9eWf6ta52xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad323ad9-28f8-9eac-f6f5-f6b6373e2272@suse.com>
Date: Thu, 5 Jan 2023 15:01:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 3/5] x86/mm: make code robust to future PAT changes
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1671744225.git.demi@invisiblethingslab.com>
 <00505454afa89b759122008852502a5ef7b1b1ee.1671744225.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <00505454afa89b759122008852502a5ef7b1b1ee.1671744225.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 3849455c-823c-494f-5e21-08daef255196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0M4uPT5ioLkgH7QYDT2eUCGT8bd5ladOgH/OaItF8y7Hp93fDWsNJi+MLemG7H33KVl1hi+aHyl0VeIMRhbHvU7DNqN6vld9TDc6dFWujK9MffTFiBDc2AlczPSMpMaTy6AVeVNjEYTBW66t1kj2KivmimpI7WqrQJ01sVCr66U0YCoS6pnnia7CCH6VUpuZe2VcuNXlZZyl/6SEa7FIEhtqOcEsWNpzT6e4Okp+HWZAUx6gmZpy1P31hyCRXuCK7g373Hpq6p9gcDPMmhGUo+qPQLgPDQ2NKiTISkeLlZlcMPUCOjuIKo/y4UcKRnL7zt0FI8Lyot80gObyQElRLvxW6EuRmBPx45jIXaRg9RbtpqVRppU3wqO93PcVUstKRlVL8tKfPyE8od532yND/T+jFqvedmWOtz7Kc3SJD2kAoCU4ao+RUtGkHTGLleZzJWUitwbA7nFmHTZDdWljpv4tHvWrXMbTkAKM4LFkgYo3V1mCLyb7iO5jL3FtjNVQL20h3lDCZp9xoEOzD3xQ8/msftkC4rL56ggGkGR06RO+XxNDea7e1m4+oJJSUuv2PEknXLLS+mWatMnfkUze0342Grqaymn+GEamvEeT1oX7qq3bUrUJIBe9jKYUPr9W+HkY1sHhxX/4tZrjjg+jkRZv2kZQr5ybEKCuB5Oh/84Ynj7H1SuY3fygxUS7d7x8jzTnOb18XNmFSK/rb70tH31EIVFxKreSztT3XvtYDtA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199015)(2616005)(6486002)(316002)(186003)(26005)(6512007)(478600001)(6506007)(36756003)(86362001)(31696002)(54906003)(53546011)(6916009)(41300700001)(8936002)(83380400001)(8676002)(66476007)(5660300002)(4326008)(31686004)(66556008)(2906002)(66946007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWJtOTJ3M2xkK1ZkR1ZKbkZkSk5QcFh2bjAycGUvTXlwejRZdGJ0TjljK29i?=
 =?utf-8?B?K3dhWlBRaFZVYkdJMktFbEh1VTVRTjdQeW93M1FlVm4rdzdWekVZeXViRm16?=
 =?utf-8?B?Ui8yaFBvTHpBNnBFTXJqTXpwazMxc1IybkM5OG9hMmxEYndmczNUZDAveU5Q?=
 =?utf-8?B?T2hqY2JRanhDaFh2V3ZUS2x0YmxqdG15L0lQamx0WnVKUWFVWUlYb3Y1N3ZU?=
 =?utf-8?B?a1Zvb0xwYmViU0NFd1BkczdtTVNPcTlkbllETXNzRmZYci84YUdpOUpiSE1y?=
 =?utf-8?B?a0w2N0xNcCtNZ2sxSnAyVzludGZkeHRiS0E1dGI1QUVKMGpoNGZYbmdxeWw2?=
 =?utf-8?B?V3NseFo0c0Q3QmsyeVFOQ0U0TlRCZjRuY2lacFhWUFljTG0vVDR6VFdNQlNt?=
 =?utf-8?B?M1Y5UmxISXpmT1RmVWhocHdNTlFDUlBWT0hjVUoyUHh4eEFQWnFiQzRMbEI0?=
 =?utf-8?B?cUQ2QmZpbGNtbW1OVER2TkEzQytmeVBMblNZbUo3bU5KZ0pxQTd1cGhxa0JJ?=
 =?utf-8?B?OFJNaVVpamd0OVNsMWNQNTQ1OWpwYUpLNzhVazhWVTJOdGFsSkhmUFZYclpl?=
 =?utf-8?B?TTlMTjhKZlVTeDA1a1VQcWNMNXpvdTI2V0dFdms1ZVJvdlQyREtHdkd2VFFo?=
 =?utf-8?B?b1Vma2pBMlgzWWE2cGdJNUxYdXNlaTRVVGtDY1puZUpMcERhdndUR1lBdDZi?=
 =?utf-8?B?UzFWT2p4dzVwOUN1YjJFb3BOWVQ0eGFCUDdqTCtQQm1lYWtJWm1zSk1TWW96?=
 =?utf-8?B?bTdFTE4xSHNLUHpkYjVzRG9QdTNBdTZQOXVmV0dyeHRGZUZhMlFUZkRCRnV1?=
 =?utf-8?B?UURYSTJxSm5aT0Rlb1M0RUxpMkZNYU1yb0tlejRQTHFFcGxwL0pEVjlTUm1r?=
 =?utf-8?B?RmlkQ0RYTnd3NlFvbEVNcWlBaWptRmphc0Q4M2N2UzNFRkMxRWpBMDB5UkNh?=
 =?utf-8?B?emNhQmk0eVVBZXdYRkNaL29vSmZFRnRyaHQ5ekp6bEJmckJhTmVDQkZoWlVm?=
 =?utf-8?B?R0t3ZjBDN0hlaFYweCswcTFJRzJxNVhMOER4T3NNQUdPQTVUNGhKRmp4TVJM?=
 =?utf-8?B?MjRUdFVQaDRGRjg1NStST3hzdnF4ZWN3WDdBM2FmL295WE1nTGFVL1FEbmk3?=
 =?utf-8?B?ZGt3VzR5cnVnaDdZWUpJS2VDMnJkRTNBdkZreVVCelQrdEdKeHVPTkl5NHhQ?=
 =?utf-8?B?S1Vub0svYlJlQSthMGd6aTUwOW0vVXFBOTVWVU5MU2poajIzYUdtVDFFMTI4?=
 =?utf-8?B?c0c4amE2UWhleXNiNzhVcDRTS2xTd3hCb1pjZ1NINGtMWE9TWWxkNVlxQ201?=
 =?utf-8?B?VlpBVzNQLzhqYzBnYW5hQnNOMXFKTHRkbjhkcEJtaTBHVjh2TXN4Q0VWWGJs?=
 =?utf-8?B?TmZydVl6L09FZ3BWK1pRaFhQd05GR0lQaVNLNVZGTS9pbjZ5RS9yZzcyRXdt?=
 =?utf-8?B?SlRiYU1lTHdsbzV0OFZTY3cxZEdTNXhGcE9yS2s5c0RCWWhpYTc1UjhRRlo2?=
 =?utf-8?B?N2ROenJkZ0JvNzhIRGlOQzRYdUZqZmZlNlNTVU5JNEhzV3Q5ZDJHR3FvL0o4?=
 =?utf-8?B?TkFNNlBtbWlSUm1uZlFXbzBlMlI0YVNFcnY0WXBNOWZLN1ZLTUc4VnVteHlS?=
 =?utf-8?B?ZHFzNFpyOTY2NXE2UURoNFM2cEdtK0FQSms1UHFmNE9xWVB0VnlZeXkrcFBB?=
 =?utf-8?B?NjRRTllWbEVxMy96YTB0UXFPUWlzcVlEc2lQNTYwTHM0b2hZOXFlc0tYU29H?=
 =?utf-8?B?OXgzbmxHMmdDT3dIbG9ROG5Wb0k0QXEwa3d3LzhpdTZkRTRVcVpMb2hYa0RP?=
 =?utf-8?B?SHM2NlVGY2QvODNzQW1yOWxhNi9PWE9KZnluMnhRdGVpL0lVblNxblRkRnRq?=
 =?utf-8?B?OTE3c2JvekV4N0VVWFg1VjMvR20wNkh0RXpmUmRTK1lBRUd6MFNCUlVBSnBY?=
 =?utf-8?B?MFFCdnpzTGtHbGZtbFFmbUxOMk95MlN3M01oMFRnYkhjMGR3WmZBMmN6Yndy?=
 =?utf-8?B?TWV4NkRGbTB5eFEwM0Y2d0E4K0NLMGkvR0ZHYm5XWkMxdGtvektvZzlOSnVE?=
 =?utf-8?B?QlgvZStUVkZaL3NteStXclRUbndaWlpScW11dXZEMW14SVBLZUlucGRidFJK?=
 =?utf-8?Q?MJ54of3L2cCCOnr4KffkqQ07r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3849455c-823c-494f-5e21-08daef255196
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 14:01:19.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ROGeeHtFAGgu4QsrH5XSBSp1MjAUCpFbQWzyvVzTzgLS6/YKKwiX1KAgTTD+1K0xUqaCArE5okmMB8nXFz8fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7976

On 22.12.2022 23:31, Demi Marie Obenour wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6352,6 +6352,11 @@ unsigned long get_upper_mfn_bound(void)
>      return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
>  }
>  
> +
> +/*

Nit: Please avoid introducing double blank lines.

> + * A bunch of static assertions to check that the XEN_MSR_PAT is valid
> + * and consistent with the _PAGE_* macros, and that _PAGE_WB is zero.

This comment is too specific for a function of ...

> + */
>  static void __init __maybe_unused build_assertions(void)

... this name, in this file.

> @@ -6361,6 +6366,71 @@ static void __init __maybe_unused build_assertions(void)
>       * using different PATs will not work.
>       */
>      BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
> +
> +    /*
> +     * _PAGE_WB must be zero for several reasons, not least because Linux
> +     * PV guests assume it.
> +     */
> +    BUILD_BUG_ON(_PAGE_WB);
> +
> +#define PAT_ENTRY(v)                                                           \
> +    (BUILD_BUG_ON_ZERO(((v) < 0) || ((v) > 7)) +                               \
> +     (0xFF & (XEN_MSR_PAT >> (8 * (v)))))
> +
> +    /* Validate at compile-time that v is a valid value for a PAT entry */
> +#define CHECK_PAT_ENTRY_VALUE(v)                                               \
> +    BUILD_BUG_ON((v) < 0 || (v) > 7 ||                                         \

See my v5 comments.

Jan

