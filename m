Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF83771C4B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 10:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577832.904884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvdy-00022x-0e; Mon, 07 Aug 2023 08:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577832.904884; Mon, 07 Aug 2023 08:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvdx-000218-TM; Mon, 07 Aug 2023 08:31:13 +0000
Received: by outflank-mailman (input) for mailman id 577832;
 Mon, 07 Aug 2023 08:31:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSvdw-000212-6T
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 08:31:12 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c13fc92e-34fc-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 10:31:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9929.eurprd04.prod.outlook.com (2603:10a6:800:1dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 08:31:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 08:31:05 +0000
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
X-Inumbo-ID: c13fc92e-34fc-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCn+5t2wdcsAY1LLOenfGZiaG/wQX/mDFfudlolduC+Fvm6OzqQO3lh4tBHMcPDVoEOWeypvzQPDGm0UkVtBCC577lhUViyDo1LyFA3szhPjXx/E84seu3QnjM+sOVTQOmUrP4piu3c+OcMhAIK9FQ3ABeeHuvxrGc4cnoT6O/V9MSOLDY3YNQYq5IvxnHAc0C/5gO02K9EBjrKoXf2f3a+4cjfxo7kOmdCWKrxRUFS8qMvl+Zs+6qA9YwzjsFt2YhTgz9asX4Q9rXn2sD3hGVuVu+h2ZgCFsfSuIctBkFBi1kWMIgcoV+/IvCtK7MJAVxpU0+Lstvjbg9JD7vl0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sulIWApr+vlwF7fTQnl9a3uBjMHOZlcD0zz7tG6//KM=;
 b=KUsAdHhROrRDgdj8+RVlWJI9lXCFGcQVbJTJtc/4tXFkWrivUtkwSKLsINzNRSMkug/OHWaqFud0cGw90NVR88FXgA3Ych2xsWu586qzjw+j9Sq5952LrLSuLE2WX71EH95TsueGv9v/IiGIsLQvItNbC9w/IyyyFvQrbCVXwwq1oD9ZESaZfKO5AybEZR18k9FOaY/BeuSQozVix561E0hpSgz2zlqBOvBBvvwM2h2lkls70T981U1KYSAQoVKCAYJwU1+0GmrZ0moMTjdYypyY85i4fvGY3iWyhcSdcFsolVK3IY/RPxC3WjsrAIr+cM/SzMwooreOutFXkXdduw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sulIWApr+vlwF7fTQnl9a3uBjMHOZlcD0zz7tG6//KM=;
 b=Ky2Pxb7/Pgr7AB9ZYzmS/R13Z8EtyBmDr2GIZg6T7A1CoPZmOqz28jSJezQADFAY61O1OLPXTW/lMzn+gD/heforIpsBCOeLOyWN+Hb9u9XdLVJZMbbWPXq4qK2SEU5QNrSD/tOPVEwQKbebTBh4uoE1/Pdw7XNh3d9R1L60PqOuafMalI2MB7A/rtO0sPtx+8lSxZVI0v6YXElUVwJIIeT28fWNyqqKGwn7vKzBQFKbrQ6q3TTU96N2ocQXcXUa7cj1XWvkoxXsEDHKFd3oD4MUgkDahISs5YR9Vy8lkvb1Q7MZJKcq/bjuJe+haaVAwID4kOKSEvZ+VMPM6g88HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b575aad0-9c04-2037-b568-b2bc1fdc33d0@suse.com>
Date: Mon, 7 Aug 2023 10:31:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 6/6] x86: refactor macros in 'xen-mca.h' to address
 MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <9d89a58ef016d96da7c3f329fb367f99d169cae6.1691162261.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9d89a58ef016d96da7c3f329fb367f99d169cae6.1691162261.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9929:EE_
X-MS-Office365-Filtering-Correlation-Id: 05832750-b731-4b17-e25f-08db9720a434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eYX2x0F5wxrdCqtEVsNEzMIQaV5gMvUtmzZgGx/S1z9ncVfB5RojP2oxK7GU1UBwmCo5gn18lsSN+ZFyfUemMdB9VwCup79nsF5G8jvbG05Q2szpU4zrMxNUjQ93W2CNzl6B0mMHnFjt+uKKfMfX1FUD6zEzGRz4N9zlH656wCt9wdDxYt9Kcvhy4faTnAdKvGwqCeJ8tRGehusnfZ6GS6HJj06EE6DQkfHQJ6Gb4vd3oaiu6I80AoTwttcc9OM5t8uau4PnTSuadX/rT037QaYEkw91yfIpGlAGdIX/bsx049E47n2wqSwzNap//LwzBreEdDocgwKpQ7uJA8LPnq57v2iDz/DAOm7vOQiAWUNJLNoUQr3TVn9krI3QQHbk8tV8s3X5Dyh9Dr6Em+PvnSQR3/6gBwwMaIpYbws+mONRU/Xadee2tXRDOn4us/VDseFK8HzLNUVkIVh3tKMOBydBya8nCRUmGP8bn218ZjU84Rbgw01w0isvZcbIsmbNdTs4+eb0Aoq8A+EYnZlj8jLu9qvoLOPGDXjrxa9yvxR33XcBsFHnPEoiZ+oP/9ZA6+fSoiwHw/6+vob426g8dxEhKanez2ed6UWHy1fezqZIdl1UqbFww/nGrmPVurRtc/0Kf0MPCRYJ6XiYCkOsiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(366004)(396003)(346002)(376002)(136003)(451199021)(1800799003)(186006)(2906002)(36756003)(5660300002)(2616005)(54906003)(38100700002)(6486002)(66476007)(66556008)(6916009)(66946007)(6512007)(4326008)(316002)(31686004)(66899021)(41300700001)(86362001)(31696002)(8936002)(8676002)(26005)(7416002)(6506007)(478600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWluYzh5ZEFMTmFuVk95TUdpSFVYckZ6ZTRUKytZRTZHT1FrM3lnRDdjTHl6?=
 =?utf-8?B?TjNIRnNmTUVMOVpqanFUOHhZT3J6Wk1RNzJ2anBPUXFzTG1qcmFRYkw5ajU3?=
 =?utf-8?B?bmZ4SnZyMGVtTHo5Sm4rUElIdllSTWVQMmptOWtKcHFoYXFWdUI5eTE0Z0o0?=
 =?utf-8?B?bkthNFJyVXhTYnF2ei9XQVVBL2dFa3h2TVFqOEFETzZjZ2s3M0s1d2RIZlhh?=
 =?utf-8?B?NVdTNU5ZWVNtUldvam1GdFZYbStrZkNlclFrOVBXQjAzcUhVUTQ4S3Z2d0Rz?=
 =?utf-8?B?ZHNnMDBEMXRBNG1STGVLbzV1VFhrWU81UENTSGlNczNzWEUrZXJmTTRCZXRU?=
 =?utf-8?B?UDJmcTlzampoZ0dZVW5pRUJwZktJZGVtemQ5elFTWndNZmNDdTJXSGh3SzJz?=
 =?utf-8?B?WUFaZkdyTThjSEt1ZjZXY0pEVjA2T1BCeEdTdG5vMC9mWGFxOEtKUmM1U0V1?=
 =?utf-8?B?a3pSYWsyY2lEdnJhaGM4YUJmcDNKeVVTM0psYXBYaTFPNVp0UkExQ21pRUZR?=
 =?utf-8?B?bGVhK2E0QlVqNGE0QWRxNGg4Y2FtZnR0ZVpKWHh1bUZvZGxCWjRIa01TUGZs?=
 =?utf-8?B?QThtSmgwNDBCRnY3TDFmR0hGN3JNL2RtdGNibi82L3g2VUdmWDV2OG9lK3Ft?=
 =?utf-8?B?UjF5eW5hZ2IzUmJkUzNsUHduZUZWVFUxb0hIcWtPejdJcWdCaWtRekJudDJK?=
 =?utf-8?B?S2pzREZ5bmQ1VWR6QzJFM25IOC9PTzYyZmhRY1FkcUVkZ2tZQUhSbEZNT0I4?=
 =?utf-8?B?NXJwWFN2RVlSRGQ0K0x6Vi9hNDZXQVN4QUtJa0F2UGdwWWUwSkFRcTNreVZp?=
 =?utf-8?B?RC9hZWJvQlY3K0VNeUVLYjFna0l6amRoSGZ3Wk9HcFcrNlEzajRnc3orRmQy?=
 =?utf-8?B?Z3R4VVl1Z2svMnBzdlhnc2hKTWM5a0QvOTBRY3Z3KzYrTGxOdWwxVmxaeTRK?=
 =?utf-8?B?Z3IvM1IzWVEwQ0ZrZVMzbVhyT2Y3Tkp1cURHczk2bEtCTGRMMVpxczFFTnJt?=
 =?utf-8?B?TURrQWJTSjY3aUdLZlltNEpSWFhKSTZLYk5oVTl5QWhOMHNxb21Rb0VqSEpV?=
 =?utf-8?B?OUlvMEZWSFJlTVowZDNVV2RUSm91V2V6U0lPQzYyTStzaXIwV2h1M3IvdU16?=
 =?utf-8?B?T2dzTVUrZFhpVGhDY3V1bEltM1JiWS9yT3pIVnJmZHY2dURFUXJsY0s1ZTc4?=
 =?utf-8?B?bGQyZ1ZPM1FzNmNxTm53WGZKQmc4UnJoZmdRZ3RiaUNYa3pqUStoQ1pham5a?=
 =?utf-8?B?bUF1bHduaEVGNzNGeFFRSWxvV0MyZngvNHlrakVjSjB3QlFub25DUUxKNGl4?=
 =?utf-8?B?Zzc1VHdhejVZSG80N2lscGdXWEgvam1BU0VRRmdBU0IzTkg0VzMrb2RjaTNF?=
 =?utf-8?B?N2xDaE40SGpuS2s5V0J6VnplbmNyZnFRREk5QThETFk4NXdGS1FhMlkxbzJy?=
 =?utf-8?B?dTVrcFQ1OHpvWGg0ZWdSOEQ4bmQxeXhuTE8rRXZzZGJadzNpbk4vai9QdHhP?=
 =?utf-8?B?TFgvV1dCWE94TjN4NkNrRzErL2pabllPWkZWRTgvSkt2N0svbWFGY1haQkhr?=
 =?utf-8?B?QXplbDd3QXc4QnZWNVJuaTl2dGVzN3dQUktsWFJlQWtXbHFEa3Vmd1loYzU4?=
 =?utf-8?B?aCtZYlVtY2FpRUd0cUNWUWVHUnpCckNaR1VMdmZPSllTeVNqTG1EZVU0dko4?=
 =?utf-8?B?emdQQU5VUnJUTEp0WmZYd2N6TURQV2FHd2FZQ2lQeGNrWGJXNWtvR1ZVWVpH?=
 =?utf-8?B?SzdjcmhhSXdEY3FUS2xhRVBTQjF3NzAyWjhCUFJ1bHRBQkpQRXVsVXlOTFA1?=
 =?utf-8?B?Z2xzeGFkcXRuSDh5WDNNV0FOL3VFSzdGaUhHbnlYVDkzS1BsbzV1MXhRNk5Z?=
 =?utf-8?B?TXdmbDhQVkxxZnlQMi9SaDhsWFhiTXVKdDlqb3YzKzdESnNrTkU5aEIxdXEr?=
 =?utf-8?B?dFZibjBqM0diWlZxOWxOT3RFM3lVd1A2UzJ4d3RKYWVIOXVPVHJlTVhxQXVO?=
 =?utf-8?B?bWJVUGVTTnJhYVZDVHZJenAyVmRHRWQ5dTJTNk9FTU9JYzZwTXYyRVI1WDRU?=
 =?utf-8?B?WEFnMGtnTW5ETC9MMnNwMVY3UG1VbEhHa3NmOERyQ29wMkVUSVNXWXBaRFFa?=
 =?utf-8?Q?M5N8cnOX2l7pla0kHsqBfBhoM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05832750-b731-4b17-e25f-08db9720a434
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 08:31:05.4753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VG+yByL+JzN/1Gv7zehQTzueDzmyVjUILj3Y6BsiOQPX91igY+cjc2Xd68R9fAwf5HwC+a2sGipop/yB0Nz1ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9929

On 04.08.2023 17:27, Nicola Vetrini wrote:
> The macros defined 'xen/include/public/arch-x86/xen-mca.h' have needless
> underscore prefixes for parameter names and variable names that cause
> shadowing with e.g. the variable 'i' in function 'mce_action'.
> Therefore, the renaming aims to resolve present shadowing issues and
> lessen the probability of future ones.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

I'm okay with the code adjustments here, but I'm afraid I don't follow
the description: How is shadowing of "i" connected to the use of
leading underscores in macro parameter names? I think you need to
separate the two aspects in the wording.

> --- a/xen/include/public/arch-x86/xen-mca.h
> +++ b/xen/include/public/arch-x86/xen-mca.h
> @@ -280,39 +280,39 @@ DEFINE_XEN_GUEST_HANDLE(xen_mc_logical_cpu_t);
>  /* Prototype:
>   *    uint32_t x86_mcinfo_nentries(struct mc_info *mi);
>   */
> -#define x86_mcinfo_nentries(_mi)    \
> -    (_mi)->mi_nentries
> +#define x86_mcinfo_nentries(mi)    \
> +    (mi)->mi_nentries

Isn't there another rule demanding parenthization of the whole
construct? If so, adding the then-missing parentheses right here would
be quite desirable. (Personally I'm happy about them not being there on
suffix expressions, as kind of an exception to the general rule.)

>  /* Prototype:
>   *    struct mcinfo_common *x86_mcinfo_first(struct mc_info *mi);
>   */
> -#define x86_mcinfo_first(_mi)       \
> -    ((struct mcinfo_common *)(_mi)->mi_data)
> +#define x86_mcinfo_first(mi)       \
> +    ((struct mcinfo_common *)(mi)->mi_data)
>  /* Prototype:
>   *    struct mcinfo_common *x86_mcinfo_next(struct mcinfo_common *mic);
>   */
> -#define x86_mcinfo_next(_mic)       \
> -    ((struct mcinfo_common *)((uint8_t *)(_mic) + (_mic)->size))
> +#define x86_mcinfo_next(mic)       \
> +    ((struct mcinfo_common *)((uint8_t *)(mic) + (mic)->size))
> 
>  /* Prototype:
> - *    void x86_mcinfo_lookup(void *ret, struct mc_info *mi, uint16_t type);
> + *    void x86_mcinfo_lookup(void *ret, struct mc_info *mi, uint16_t mc_type);
>   */
> -#define x86_mcinfo_lookup(_ret, _mi, _type)    \
> +#define x86_mcinfo_lookup(ret, mi, mc_type)                     \
>      do {                                                        \
> -        uint32_t found, i;                                      \
> -        struct mcinfo_common *_mic;                             \
> +        uint32_t found_, i_;                                    \
> +        struct mcinfo_common *mic_;                             \
>                                                                  \
> -        found = 0;                                              \
> -        (_ret) = NULL;                                          \
> -        if (_mi == NULL) break;                                 \
> -        _mic = x86_mcinfo_first(_mi);                           \
> -        for (i = 0; i < x86_mcinfo_nentries(_mi); i++) {        \
> -            if (_mic->type == (_type)) {                        \
> -                found = 1;                                      \
> +        found_ = 0;                                             \
> +        (ret) = NULL;                                           \
> +        if (mi == NULL) break;                                  \

The lack of parentheses here definitely wants dealing with right away.

Jan

