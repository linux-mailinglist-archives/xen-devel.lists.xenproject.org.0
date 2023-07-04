Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D9B747476
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558449.872557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhNI-0001iW-L3; Tue, 04 Jul 2023 14:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558449.872557; Tue, 04 Jul 2023 14:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhNI-0001fc-IC; Tue, 04 Jul 2023 14:51:28 +0000
Received: by outflank-mailman (input) for mailman id 558449;
 Tue, 04 Jul 2023 14:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGhNH-0001fU-Fh
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:51:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f4e0f88-1a7a-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 16:51:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9480.eurprd04.prod.outlook.com (2603:10a6:20b:4d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:51:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:51:22 +0000
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
X-Inumbo-ID: 3f4e0f88-1a7a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Il4K1W5z5m2wnACDNvA8VtdnXBhb2E5LExQ4ULQ1Z4NNr8lPvmM+RzYum5eHhywN6uuOshNkwi4n1Lkd1f9mQmTsIzt3WvnkOPEl493NBaT+rjsXX4z94u9KNaWKKhTMiYLRDuIUG2PoPp6DpVNqUSw4Q3pD8QzzQ/NAfKHKbNk40TPO5WqA5ieo4y3I+MaI5CPxZkgSP3Sf2e926C1d/yF/SMOYrZa3ZGHqHvkLxrdqRj7SFEAMQuJ+Ox35fV2J++zCopoj/Ce5REhruH0E1Vbg4aDFj8J/jZybsFgXRlhJ2yUr3u5m69A8c/5F4b/pSJFrXmGhOURy54IOtcpPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SswWW9gD5iARnNAjAfHOFpcjojY/wWZgVT6gCXPAXBY=;
 b=hwX1xQXMqNKM1MPjZYfpG7e8pfga5nw/HMBcirw696skvSvTs6/PjFmOcm51iSNWciFVV8ZDkpiPrUcYuMKwbovAcqgZSx7JoT+jTlfa67M6UoGYPVuoGK31DBVqV/XbweiPdMzTR4t6L1MEjcgSCnyo8tHL9wYpEakjo0jPjuORhVrODP1aEVfA4160cDoHdKqlSVtyDjOpy/uGJjsKhmJ3ZypRPs1UldfjS7xLIOjqbdHEi77xC8Kvo3M4GJHJhJoOZqHodf6Qe7PsqNfEyWWMLhPnuNNJPdvP8auVtDd0zEvAlEUwczT63ymeN5tfFag+atdTCuopniXef0RtQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SswWW9gD5iARnNAjAfHOFpcjojY/wWZgVT6gCXPAXBY=;
 b=hNekEtoIPvfgyCcAb0dNgVRXEVo9AWWaAtnBKQthNDY7QX5m8khqthNZCnVAAALzA6EERizwy1nChcWNNH1dblDd67PmvP56HgCalwzi0mnIsS8H+3q4fgRCIK0By90E0JtHFLA5W/Ohs+hMUAnVDWkG4++utT7xCuMrnFjkkSqdb0VQTrcGil9p9p9X2w3AB5ehkGqaLsUVP0hrHaHmtFSy0o/X2aV/sPQgWXB692ouiiQX/qlXI6WSOw4M8FlTl4ARb+oPUfsCHbEF/085EJ2Cr206aq7VTVKXeVGhHzrWRDUuIC/EsB2QnJ7vcGY7a+jNsL52QkUNih1H6WUyKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a16cdb60-1307-636e-1473-e5388e8f79d9@suse.com>
Date: Tue, 4 Jul 2023 16:51:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2] x86: make function declarations consistent with
 definitions
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <1b2d5be30c0e4f335e59dce6e7c001cb0805d702.1688465215.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1b2d5be30c0e4f335e59dce6e7c001cb0805d702.1688465215.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9480:EE_
X-MS-Office365-Filtering-Correlation-Id: a29a7cc7-7a3a-43c7-81b1-08db7c9e222e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HypP/JykcTBghYmpIjB2zjeZf/BnxwYTfjm+5qc3D9aJOcD8hdxGSkGMuIyPBpHreH1vQ7R5GF3Q+CzPVAHSzShR+6XwcbrnsXsCTl3UqM3b7ZFb4uoKiwDf7h9aeAYX/IE21k7kdsnjElN+t5Cr2xDfFLEzKiVVt7vCQ2A+dkptpsRhhiTfFh9e53MnlHEFaUqBTsApkDDA7L4wAjV5kkbdP4sohHtwxnjgjKPGP2qN8Bj3EGZt4oQiFLE5kdRNdxLg1ge3tCbPX4bj7ZWzWs0LrWoJFN6IZEFTsjgq00Xj5BzA98PJN+mLignuTmQI77/U9MQ52Leql2CBRwY/4ZWnHTICQXbdNEl30h2hkLXlsHULXxS1sG7CnSfHMuYMGnJ41fEUKxg+o1tTMoF5iF5ixJ8ilIhaEcLzW46WirsJOuJ9wNOKO9d+6zUGcNzvXx8RqX63jdz6zCgKt+Uk6Mx8NiAA0HIvTJdl16O0v6nUkyFe6M5JBvKsS1mZZk26rWtgbqgzwzhRG9DXURB7b3CulZ4EQwyVcmAFUXtC710woJ5TLn02PyispcwJJ6XCQ4h9Kj/yasKvZW+FffG+P78zZm+HpJ/XPhicADRPi2vbsyx0Mx69oBJTfRKahQcXQq48KsEy3aMV/Y+PiMylFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199021)(2616005)(83380400001)(54906003)(86362001)(36756003)(31696002)(41300700001)(31686004)(8676002)(2906002)(8936002)(5660300002)(7416002)(316002)(66946007)(66556008)(66476007)(6916009)(6486002)(478600001)(38100700002)(4326008)(53546011)(6506007)(26005)(6512007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXR4M1lXSXg5NlcxZUc5M2YwUDQzRVNBTTJmRUxzZVFKVk9McTM5d0s2WXcx?=
 =?utf-8?B?OHFmNFFvWVR4N0F1c3FCL3BkdURCci9lcEl4c05sTTFsVXFNWGJzbTE3OWpy?=
 =?utf-8?B?YUg0QXFpTVVqSGtDN0l1WkhKdEkvVmdWaTM0eUpXVVl4ditxN3B0anFzWkJo?=
 =?utf-8?B?Y3k4UGU2R2o2d1MxcVJ1cDU0MnVnV1ptR2w4ZzMzSkgrQXR2WHVzd2ZtaGNm?=
 =?utf-8?B?aGpqYVhrSWJlbHhOUG1jb0VlVXIwaGptNjN6anMxOUkvMzMxRlZ2NHgwNVoy?=
 =?utf-8?B?TWw1eWlDZ2swMEd6SGsxamtjSCttaEtQdzRnOWk0YmZPcC96R2RwZ0hJQzlk?=
 =?utf-8?B?RGhhVWoxNURycHR5M1A4TURIbmQ1cXVONU5aQVY1clg0bWVsSzBSL3dDUnJR?=
 =?utf-8?B?RHBIZUdhTFdVTlg2M3RZUC9YbU1ITG5od25xR055Z1NmbDB1L0NkRzJDTTlV?=
 =?utf-8?B?UG1xbk41TExJTk9lSzJ4YjBWc1hmbFdoRjNkNU5ackFzNmMwU2hNS1BsQlNO?=
 =?utf-8?B?VkRndTl4REppY3lEQXZ1WFEvVlpiZ3ZZWlNqcUtrVlRHY2JTaGpVOW1sOXlG?=
 =?utf-8?B?dVN0NDY2TXgwTGZwWWRxWURhSG1KTXF1RWgwdmtxUjJzOG5JcitnSGVCNkRL?=
 =?utf-8?B?RThWeEd3ZnNSM3FMT0Nqbmd4cTBVZkc5ZHJNR21vYTJwK21veTM3Y0l6VGIz?=
 =?utf-8?B?QmZFR0kwQVl5cEhXRHpneVBRa3laQ1c0Q3pwVHlxcjF2NVV6TThCWHBGRUlZ?=
 =?utf-8?B?SEx2RXV2Tm5tczFrRUxaczlsOXNtQkFEb0lXa1BaQ1A2SkRTMnRVb0JKSFFM?=
 =?utf-8?B?cEVWSVRWRUlQa2NieG15MTE2Sm1MSFJZd1cwa1ZlTUlVcjhkWFk0UE0rZzBv?=
 =?utf-8?B?Wkk4dDhhYUlOdXd6bzdpYzVyUHMxdEZReXJhMXBHVWZNRFdmdGxJVW5ISlJG?=
 =?utf-8?B?R1cvZkZXdzhYVU81YjdRb0Uyb2NlQlVhSmNBZEppV3J6TXM0NXU2cHAwa3kx?=
 =?utf-8?B?dGM2OW9PNnFCaHBVRE5lL1lXZ1BBeEZkc3lYNVE0R2NWdWU5WENZMEJxWXVq?=
 =?utf-8?B?SnFCVU40OFUzczJVUFhsMWJHcVAwS2FudVgvQ2JRWnJtbnpkT3FNRzlXZjJR?=
 =?utf-8?B?Yy9vdnB2N2FPR05jTzVjR3BrcjRvdFNIOXVOYVptTjR4UjhGVUhIUGV5SkJT?=
 =?utf-8?B?MXF2eS9pT1VMZFFnQ1NUL3dKYlljcUZ5UUxyc0w5VUN5bUNRd0ZPT1YyUlRk?=
 =?utf-8?B?S2RGRjlJVURzbE1QWnE2ZnkxU0QwQ1kvcURpTG11Y0dOM3FvYlMyMStrazgv?=
 =?utf-8?B?NG1wKzlaQXdnVUsrTm1aVk5uUjdXRytEL21DSlJLb3ZXODdGSTFGRDVOMUw2?=
 =?utf-8?B?ZHFCRG5id2krRzBKekd1RDYzTFNiTmtOSnhNbDdPTDRFWVdiZm1wYm5JcHFp?=
 =?utf-8?B?SWs2TU82TUVVTUZYZDZsQXVLb1p0QUc4Uy9VNmdXWWxmakswOTlRRGlobTFy?=
 =?utf-8?B?ZlNSRFBCQWUwOEplZEZhZlRjdmp5cENHVVRFN1dWSE4vMm9uNkdMSmRIc0NK?=
 =?utf-8?B?a3dUYkJDeU1MbmdRb0wwdDJMS25sUnZjRGRwdGVNQ0djRjk1RXVOOGN0UjZS?=
 =?utf-8?B?UlBqdStSQ2lOb1k0VXZzRmJZb21EOXpBVWR4NlJYQUxWQ28zd3ExQXlCZ2sz?=
 =?utf-8?B?RCtBczhjcVYwWlhaQTdvTDRRKy9STDJPQTY4a0xpK0RWWlRxZzNaSVZWNUwy?=
 =?utf-8?B?NjV2M3lyNzBUZVFMcU1BOVBQK2tlWHBHcUJQMjdJN0d0TllSbVZ0NnA1U1RX?=
 =?utf-8?B?MFlMbkhIWWVVOXhud3dYc2lYY0YwWXU5KzBvcngrYkJUazJUSVMzVnhWOFBO?=
 =?utf-8?B?QndrLzJ3QjFHbE5WN212ZlBiVnRsdWZVemhvS2J4QURKa0dML2tjNXVuZzBD?=
 =?utf-8?B?VTlGYWFCaXNCNFAyd3M4WUhQRHBTVUFBcnJPUDdBb0RVZFAxMTNkckRVSStv?=
 =?utf-8?B?YXBSMHhNcVJaem9xZzc4dGNMUEpJdkxWczFtdjk3SzZDTTE0OGlNeFJ0VGtQ?=
 =?utf-8?B?cy82NnF1eEx3RmxqZGdCNE1aSGIvWWcvdjNxeDAyZ2NCbCt3V2ptUnZ5eER6?=
 =?utf-8?Q?pSVeUhIeewe03RCeBIiBX8JdR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a29a7cc7-7a3a-43c7-81b1-08db7c9e222e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:51:22.4173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bz8JZ9cOOkG7yordjBc4/I1MyUbUKgtRjjaF83USXsUw6opzaHLAAm9YthLFafeerF4W35VLLTDcikWV6DRDww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9480

On 04.07.2023 12:23, Federico Serafini wrote:
> Change mechanically the parameter names and types of function
> declarations to be consistent with the ones used in the corresponding
> definitions so as to fix violations of MISRA C:2012 Rule 8.3 ("All
> declarations of an object or function shall use the same names and type
> qualifiers") and MISRA C:2012 Rule 8.2 ("Function types shall be in
> prototype form with named parameters").
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

On top of my earlier remark (when this was part of a series):

> --- a/xen/arch/x86/cpu/mcheck/x86_mca.h
> +++ b/xen/arch/x86/cpu/mcheck/x86_mca.h
> @@ -113,7 +113,7 @@ static inline int mcabanks_test(int bit, struct mca_banks* banks)
>      return test_bit(bit, banks->bank_map);
>  }
>  
> -struct mca_banks *mcabanks_alloc(unsigned int nr);
> +struct mca_banks *mcabanks_alloc(unsigned int nr_mce_banks);

I'm not convinced here.

> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -59,7 +59,7 @@ enum rtc_mode {
>  static void rtc_copy_date(RTCState *s);
>  static void rtc_set_time(RTCState *s);
>  static inline int from_bcd(RTCState *s, int a);
> -static inline int convert_hour(RTCState *s, int hour);
> +static inline int convert_hour(RTCState *s, int raw);

Nor here.

> --- a/xen/arch/x86/include/asm/guest_pt.h
> +++ b/xen/arch/x86/include/asm/guest_pt.h
> @@ -422,7 +422,7 @@ static inline unsigned int guest_walk_to_page_order(const walk_t *gw)
>  
>  bool
>  guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
> -                  unsigned long va, walk_t *gw, uint32_t pfec,
> +                  unsigned long va, walk_t *gw, uint32_t walk,
>                    gfn_t top_gfn, mfn_t top_mfn, void *top_map);

While the definition's use of "walk" makes clear why the variable is
named the way it is despite being used with PFEC_* constants, not
naming it "pfec" here will add confusion, as the connection to those
constants will be lost. One will then be forced to go look at the
definition, when looking at the declaration ought to be sufficient.

I'm not going to look further, but instead repeat my suggestion to
split this patch. Besides reducing the Cc list(s), that'll also
help getting in parts which are uncontroversial (like e.g. the
change to xen/arch/x86/hvm/vioapic.c).

Jan

