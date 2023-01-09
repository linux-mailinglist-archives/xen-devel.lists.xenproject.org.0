Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E43E662818
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 15:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473672.734403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsoN-00040m-SY; Mon, 09 Jan 2023 14:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473672.734403; Mon, 09 Jan 2023 14:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsoN-0003xc-Pd; Mon, 09 Jan 2023 14:07:39 +0000
Received: by outflank-mailman (input) for mailman id 473672;
 Mon, 09 Jan 2023 14:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEsoL-0003xW-OD
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 14:07:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f754497c-9026-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 15:07:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8235.eurprd04.prod.outlook.com (2603:10a6:10:243::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 14:07:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 14:07:31 +0000
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
X-Inumbo-ID: f754497c-9026-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwZI4rFMY0PVzOQo1uqO3xH05hO5Vqpk+NbIUBmOHcpU2wZ+4Ix4O7SN8/FcXKRpYT8R7WaaabmIC0ryx0IphKy6aJCFWNMUVXyq/rHWQ6Je3qD8SZub2LwgX3BWhen93ZEDsqmYvfcBRtUMoDPp5/j8DNTCw28ViGCbvqIbmoOIEdzy+9wgX4PzXfl19SJ4uYxPHiqpNNMcsIVV4R2YXjm48lN6hdqlXX1NoaVT4MULf7WNiqupEf3YNbXu445PBVuDYgonM9QxJcKeHWkbC8mfJ+Tk/o7XF3EXClUFxnNN/Lwwe/WKuhIlulXLWcWot/MZl6HzFBxz6D3Hh8+u4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FY854m4Y8kLI3rt7W99QdLxDdx4/YRm4M4xbOMZp9M=;
 b=I7SUOeEVyHhhug+Dn//bs413ewH+qaiF5sFXU9Q+ikwMfQGvSlSmQcJjQEwcoo07xxH57B/+TGnIBVuvFTZYUA2G3xU+bU/G3LxPGDOVg10i/qwHkZAJLY1Vl3rp1/Y2TV/dF1Ozqbt9dEf0KgsMPHRqkU1sHQxdYgAwy+vcoQ9oByTIo5FnCC+XhNtiHt+fVssP0oe/d4KpioeE/g8pXf5OSQlFyTGPdrEbf8qiKROQ2pWZXsUHagBzJK5bI/LJZTmQ7uWTadJNpzK51Rq6mslz5b2eH1gkubKZ1yAICZZLWCUu2+GuIaamv7FzuGUBGFbtgCscV/BV9qwKKNlv4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FY854m4Y8kLI3rt7W99QdLxDdx4/YRm4M4xbOMZp9M=;
 b=oHy/nRgnCxtvvTl8nKA1fMyHpToYIw2HysRNKHPUvdDRRr5crUx6RAeXsyDSWz3wpeebwiiteAqj0IyptCQAap9Y9ZZ4D7No9LlZ7Zoa5fJ1VBwj6gVGE7jmdwcYJoEnoMKRE9Sv55XMbJljWxWjE9V2g+1UHqr/D8FAbHtKpZs++R/nwzcgfkvE0QaDzsva+iOMUDXhWBMFKxwo56QmnNRUj9gpMyyH6xE2qJrUBgYNFJP2sthpnCqAX3Hcda54x2CknEyIBigxWqXDOmbqqW4VapBVrmTufYtsNJ8+9o7++KRVinMT6GACmLm6bSXKY2BWall/Ho9oavT0isZA1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3792c32f-06a9-4fd0-9d7a-c02bb38aa739@suse.com>
Date: Mon, 9 Jan 2023 15:07:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 3/4] x86/mm: make code robust to future PAT changes
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1673123823.git.demi@invisiblethingslab.com>
 <89201c66b0261b2f5ee83e7672830317fde21dfa.1673123823.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <89201c66b0261b2f5ee83e7672830317fde21dfa.1673123823.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd233b5-24d3-4105-fc07-08daf24ad974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	opTRco/sh5p1kYxbYY7mi7Wz/25hcCsYKuln6b6NAdoTOL5J6H0bnH8LQynDLoKc8kVcCeGLn/PvzJ4pq4pUkhti80ZygQ7LtIKesJeju8oraFMFv2i7X3dIbplQh5mD/yGQuUVuVqY2mQU5sDy/uU16u1wtExdnBi9tZaEYkN7spBA+GNC6gGF3va3vcrMC5gtRwOFI5WTCjfKQGjRau6n/fy5iPzJnUorbowMDOA6tXGgwATN589HJD/5KLLhgg92gvk10U2PvPzLa3fpi+xefwYIRWDchVl5gY/Qq5/MmT+HrBPc0LnP+OZMczx+RxNrZV4wm/Qbmnv2Fl3fzDpapH2DnbZ/FHUJCUjFZavMHw9Y2pUNG5kn6ac2fr2HhUU8ehDhc2JKxYb2ddTZdqChiccUIjlC9XnbXuNDRJGkhChzxB8b2xbhtCPQ7i9cPn+wTlxM/4cC6MwrwxUXj1jACpTbZ/m8JuORoyjqV0bGqZxXuph0Aeh+Hzkhr2sUx4kFwGVBkO2VDsnjFO023/ftDIkFPn/EkOQsQEa4RubjyutMdkvfHGR7tiFT32ZKKZVj00ntOfGLs06SghOK+tYX5COr0ayTYKPdhnzwV3s5QJCM+j8UrolEjAxoZ5SpgCbUYeF7Gf0Wy39OuAwJX2F8wJ4h/kI2Z0PsPITDWm3vTVx5Lz1pKvxe+8sEBoFZ629VwsqBqVQRdOjUXiaB+mOhAURkR2s/zZEejFYYbVlU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(136003)(39850400004)(376002)(451199015)(36756003)(53546011)(186003)(8936002)(26005)(6506007)(6512007)(2616005)(54906003)(5660300002)(66946007)(7416002)(66476007)(66556008)(6916009)(4326008)(316002)(86362001)(31696002)(38100700002)(478600001)(41300700001)(6486002)(31686004)(8676002)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THRvVE5tREtpZVprOW85N3FXUSs4N2t5OTB5YWlsSi9QSk5Sc3d0RDFUeW5C?=
 =?utf-8?B?MjdyR3R0a2tOV2prMm1qZWh3aFE2TnZBTGE2cVUyRkE3WUhuZk9NeXpZc0pU?=
 =?utf-8?B?UlBuK041WCtKdUsvMnFWSWZ2eEpkbHdac1pjaXJvRGMxd1c5NXYrQW5FcWEv?=
 =?utf-8?B?LzlvTGVLZnkwdVpNeDZTQW5qUEhiNE53OWlqZ3VHSzBJQkdLcnMySXJtOW9n?=
 =?utf-8?B?TFVZZnJpZXNGSmF4Q3ljT1EwbVJXakVjNi9LcU9oV3FacGRLSThiY29VL0Zo?=
 =?utf-8?B?dkhwQU1SeHVCYVlDd04wZkZsSVFqNDNJNFRnem9RcW5rbFNLcUFQYnQrdEJP?=
 =?utf-8?B?S2tMQmxqWU5QTjVUYmI1MWpNN3h1TE1vUHIwUXBPNzA5ZE9kQjkzV3I0QU51?=
 =?utf-8?B?YVo2RmpZN0dYN1pIeWxMYm1Jd0JrOGN1TjVxUHVtSktRN3ZkU2ZjSThsdWY4?=
 =?utf-8?B?bjZJRDQ1aDVMdDJVN3ZVZXAwckl4cTFScXYyM1FNNTRiWXJvVDlFZXZmb0NH?=
 =?utf-8?B?MHpoanJ5N3pHRGxKOFgrejhmUTlnNDU2dFBnUWJzQ1pmeGxNWUE3MkFiNVZs?=
 =?utf-8?B?aGNTTHZ6ZXllZGpzU0UreGpjay8rdEVOSlRranBVLzR0OGdET3lYekcvQWFj?=
 =?utf-8?B?U3htaUFNOUlhYkFOUFBRMTFqN2RKcTJERkJMbDNzcHo1WDhBNnJlMWtlNXZO?=
 =?utf-8?B?cFNPUmppU3lrak9BalQyUWxITlRlVmd5NE4reWZpMW8yOUpsbDlSclA2aHh2?=
 =?utf-8?B?d3dvNUd2aTNjZGV1N1FuSFpzMTVUaEJid01YN2t1Yno4ZGJseVpseHFOazRH?=
 =?utf-8?B?bVg2U016bWJwRVFOS3Jrc0xPNGxPUmJsSzBFaFVKSnVONEQwdnpEZ0RhMk5K?=
 =?utf-8?B?RGcwZ2hROTI1QTN5V25ONmg3Z05ndE5qOHVlWlNwdFdRSHJJTDI4VmU1MGYr?=
 =?utf-8?B?S1ppYlZsU0d5U2Q1S3NCU2RBNTRURmVaSzQ0eGQ0OEEvSG54VmJYVEpPVDlS?=
 =?utf-8?B?dENvRlpYa2pENHB1aUlmQ1Q3dDdxZytPd2hZYmY4RzRVSmVrYWpoekFPRG9G?=
 =?utf-8?B?d0x6ZnV0cFVVaFhHT3hJbDd3MWpEY2xINk9VMlNEbFBrUmVoVXBQSU5TU2Zw?=
 =?utf-8?B?cUtRLzk0WkRyY0Q5YU9waXp4aSt6dDFFVmhDWFlrTkFQb29JL1I5aHNKNWEy?=
 =?utf-8?B?bTk5WnhOT2xKME5wbUE5TlhYYjh5aW9YenFUeGFqeDdWNDRDR2pTRjNjOVdw?=
 =?utf-8?B?R09WU3NiMlg4RmxtZE5BK2tqNmJNV3VZcmpqR0w2by9kVEdQeEVSRjBBdGk0?=
 =?utf-8?B?ZzgxWlhSRzBlb2h5bDZ6Q1hGSnhibXZaR0NLeEhVRlg2MytvUTkxQUxoOEN1?=
 =?utf-8?B?aG9ZVFRXWW9rZFVZM3h2d294OS9vUERyQkJKWGJocGwxSXorQU1yaGlIajg3?=
 =?utf-8?B?WTBUWXEvY2Z4dzZjcTdRUU1YbEdhbnZUMGQ2bFUxUUhtS1hJLzVSVm5lbndl?=
 =?utf-8?B?TlJkTDdhaTRCWnJCYmRwUzg1UXo1ZTBzbUlRYUtiaVZMT0Y5T1c1TWJUYTRn?=
 =?utf-8?B?RFRJOXV3RUo0S285WjI5WS9uR3BYTWt5QTNnZk1iL0NiclJiU0JXaWlSeW15?=
 =?utf-8?B?Mi9FdHJuazNscUIyaytYY0R4aVl1NXUyeUwwNHByQjJjWnhta2YyOWZtMmgr?=
 =?utf-8?B?WEZjV3dSamV0bFVVUXBCRFlzK1UzSi9weE4rUXFVUXpQSVdyNEFndmxTVjJw?=
 =?utf-8?B?RlIydjBWb1FvZ2g1MkkrZFZqOC9BeVB5RnhaZkQvcEFzSUlLK1JoS0JBclhi?=
 =?utf-8?B?R3JPWHNOVTc3dXQ1dzFuQTdiSWoxWjRtUjNvajl3SUx0VCtoNkxyOEEvOElG?=
 =?utf-8?B?bzI0a0ZMUXBTQis2Tjhwc0V3WVoyTmpRUWs0UDZBdXB4aUFoOEJQOWlTbTla?=
 =?utf-8?B?dFpXNjErMlI5bEMwZVRDTTBzYXQ3VVNWZVl4cUZzNi9CdDloNGd1aVlTTk9C?=
 =?utf-8?B?QmdPeTFNbGpQbnplQkVGNFpGUE1iZmFTbUFzYkc2RVNuYVZLYXZMWmN0WCtJ?=
 =?utf-8?B?aGR4ZUROQ2F1YWVpaVpXZ01OTjgwL1pwQkNaTnJMQWlCRHBmbm56QjdJUEs0?=
 =?utf-8?Q?J7/O5TLILTR9aphETHuwO5pUf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd233b5-24d3-4105-fc07-08daf24ad974
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 14:07:31.8514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OmlMuPmaKVbOT8VyRAO7vE7SJB2ioGb8qpdTEjA8GIc7ngRT+ItY2cEGp5IK9SajLCoky7XMKUg45eMdPX+mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8235

On 07.01.2023 23:07, Demi Marie Obenour wrote:
> @@ -6412,6 +6414,100 @@ static void __init __maybe_unused build_assertions(void)
>       * using different PATs will not work.
>       */
>      BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
> +
> +    /*
> +     * _PAGE_WB must be zero.  Linux PV guests assume that _PAGE_WB will be
> +     * zero, and indeed Linux has a BUILD_BUG_ON validating that their version
> +     * of _PAGE_WB *is* zero.  Furthermore, since _PAGE_WB is zero, it is quite
> +     * likely to be omitted from various parts of Xen, and indeed L1 PTE
> +     * validation code checks that ((l1f & PAGE_CACHE_ATTRs) == 0), not
> +     * ((l1f & PAGE_CACHE_ATTRs) == _PAGE_WB).
> +     */
> +    BUILD_BUG_ON(_PAGE_WB);
> +
> +    /* _PAGE_RSVD_1 must be less than _PAGE_RSVD_2 */
> +    BUILD_BUG_ON(_PAGE_RSVD_1 >= _PAGE_RSVD_2);
> +
> +#define PAT_ENTRY(v)                                                           \
> +    (BUILD_BUG_ON_ZERO(((v) < 0) || ((v) > 7)) +                               \
> +     (0xFF & (XEN_MSR_PAT >> (8 * (v)))))
> +
> +    /* Validate at compile-time that v is a valid value for a PAT entry */
> +#define CHECK_PAT_ENTRY_VALUE(v)                                               \
> +    BUILD_BUG_ON((v) > X86_NUM_MT || (v) == X86_MT_RSVD_2 ||                   \
> +                 (v) == X86_MT_RSVD_3)
> +
> +    /* Validate at compile-time that PAT entry v is valid */
> +#define CHECK_PAT_ENTRY(v) CHECK_PAT_ENTRY_VALUE(PAT_ENTRY(v))
> +
> +    /*
> +     * If one of these trips, the corresponding entry in XEN_MSR_PAT is invalid.
> +     * This would cause Xen to crash (with #GP) at startup.
> +     */
> +    CHECK_PAT_ENTRY(0);
> +    CHECK_PAT_ENTRY(1);
> +    CHECK_PAT_ENTRY(2);
> +    CHECK_PAT_ENTRY(3);
> +    CHECK_PAT_ENTRY(4);
> +    CHECK_PAT_ENTRY(5);
> +    CHECK_PAT_ENTRY(6);
> +    CHECK_PAT_ENTRY(7);
> +
> +    /* Macro version of pte_flags_to_cacheattr(), for use in BUILD_BUG_ON()s */
> +#define PTE_FLAGS_TO_CACHEATTR(pte_value)                                      \
> +    /* Check that the _PAGE_* macros only use bits from PAGE_CACHE_ATTRS */    \
> +    (BUILD_BUG_ON_ZERO(((pte_value) & PAGE_CACHE_ATTRS) != (pte_value)) |      \

Slightly cheaper as BUILD_BUG_ON_ZERO((pte_value) & ~PAGE_CACHE_ATTRS)?

> +     (((pte_value) & _PAGE_PAT) >> 5) |                                        \
> +     (((pte_value) & (_PAGE_PCD | _PAGE_PWT)) >> 3))
> +
> +    CHECK_PAT_ENTRY(PTE_FLAGS_TO_CACHEATTR(_PAGE_RSVD_1));
> +    CHECK_PAT_ENTRY(PTE_FLAGS_TO_CACHEATTR(_PAGE_RSVD_2));

What do these two check that the 8 instances above don't already check?

> +#define PAT_ENTRY_FROM_FLAGS(x) PAT_ENTRY(PTE_FLAGS_TO_CACHEATTR(x))
> +
> +    /* Validate at compile time that X does not duplicate a smaller PAT entry */
> +#define CHECK_DUPLICATE_ENTRY(x, y)                                            \
> +    BUILD_BUG_ON((x) >= (y) &&                                                 \
> +                 (PAT_ENTRY_FROM_FLAGS(x) == PAT_ENTRY_FROM_FLAGS(y)))

Imo nothing says that the reserved entries come last. I'm therefore not
convinced of the usefulness of the two uses of this macro.

> +    /* Check that a PAT-related _PAGE_* macro is correct */
> +#define CHECK_PAGE_VALUE(page_value) do {                                      \
> +    /* Check that the _PAGE_* macros only use bits from PAGE_CACHE_ATTRS */    \
> +    BUILD_BUG_ON(((_PAGE_ ## page_value) & PAGE_CACHE_ATTRS) !=                \
> +                 (_PAGE_ ## page_value));                                      \
> +    /* Check that the _PAGE_* are consistent with XEN_MSR_PAT */               \
> +    BUILD_BUG_ON(PAT_ENTRY(PTE_FLAGS_TO_CACHEATTR(_PAGE_ ## page_value)) !=    \
> +                 (X86_MT_ ## page_value));                                     \
> +    case _PAGE_ ## page_value:; /* ensure no duplicate values */               \

Wouldn't this better come first in the macro? The semicolon looks unnecessary
in any event.

> +    /*                                                                         \
> +     * Check that the _PAGE_* entries do not duplicate a smaller reserved      \
> +     * entry.                                                                  \
> +     */                                                                        \
> +    CHECK_DUPLICATE_ENTRY(_PAGE_ ## page_value, _PAGE_RSVD_1);                 \
> +    CHECK_DUPLICATE_ENTRY(_PAGE_ ## page_value, _PAGE_RSVD_2);                 \
> +    CHECK_PAT_ENTRY(PTE_FLAGS_TO_CACHEATTR(_PAGE_ ## page_value));             \
> +} while ( false )
> +
> +    /*
> +     * If one of these trips, the corresponding _PAGE_* macro is inconsistent
> +     * with XEN_MSR_PAT.  This would cause Xen to use incorrect cacheability
> +     * flags, with results that are unknown and possibly harmful.
> +     */
> +    switch (0) {

Nit: Style.

> +    CHECK_PAGE_VALUE(WT);
> +    CHECK_PAGE_VALUE(WB);
> +    CHECK_PAGE_VALUE(WC);
> +    CHECK_PAGE_VALUE(UC);
> +    CHECK_PAGE_VALUE(UCM);
> +    CHECK_PAGE_VALUE(WP);

All of these are lacking "break" and hence are liable to trigger static checker
warnings.

> +    case _PAGE_RSVD_1:
> +    case _PAGE_RSVD_2:
> +        break;
> +    }
> +#undef CHECK_PAT_ENTRY
> +#undef CHECK_PAT_ENTRY_VALUE
> +#undef CHECK_PAGE_VALUE
> +#undef PAGE_FLAGS_TO_CACHEATTR

PTE_FLAGS_TO_CACHEATTR?

> +#undef PAT_ENTRY

You also #define more than these 5 macros now (but as per above e.g.
CHECK_DUPLICATE_ENTRY() may go away again).

Jan

