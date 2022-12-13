Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63664B2A3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 10:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460347.718243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51sr-0003aj-NJ; Tue, 13 Dec 2022 09:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460347.718243; Tue, 13 Dec 2022 09:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p51sr-0003YI-JE; Tue, 13 Dec 2022 09:47:33 +0000
Received: by outflank-mailman (input) for mailman id 460347;
 Tue, 13 Dec 2022 09:47:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p51sq-0003Y9-3f
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 09:47:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ab82995-7acb-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 10:47:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8823.eurprd04.prod.outlook.com (2603:10a6:10:2e2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 13 Dec
 2022 09:47:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 09:47:04 +0000
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
X-Inumbo-ID: 1ab82995-7acb-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVXQTvkRB7XD059WaB7PlApA5TGmF5MBhuvawcf4wuJOeK7qRlpd4+V9q4way/a3XTxHpFslCtTD5RyEIltBUVl9LqRbGq+1bWrWa+aDeVNr4eX4uQgT2p26bpaUK6Rc1eUjct36V9LifHLkC7y9vsQUQJHSieDrblkjPXCFfItlb6xSvA7xEY2tG2SIBtWPYAVrZFoLTxOlHUEnSc6GtyZ4LZv24xZTKISv75AETRPKpngVnK4ZgOhBXcarobVNWU8gv4NjQQXCDBVCsYMd0dH6nFgUsdvc0GjZc3e1Qc2aHQgYiBwLtp0P/XoJWeOtAIhRQiP9wydW/c9dRxOycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KA4YTDdTQ1CTJU6glAlVJFH6RXBlghU9l+pqgF7PwO0=;
 b=bOGt4/6InMqmKM8Erkos1E+NEtsm+ra6pLBOW2DJWdb5ieIPGs4nfpcEz4lmIMbFyanJxIshk0PFlaDinXaBJswPoswZoMbav9Bd4vx2kVT0E96TOIyOH87cep9OZO9BJfaJnFGGC4ELTdL6xKMrGosCho76uB21zh2DF80gBt7xcmdP5Kj5lELwXb21RReTv3MHWz7Vo/Ydzzr8rWdDdcc0XfeoBxoExhunWd5uTBNZVbHoEFA2+W1yCKTMSpQq5RiD/kuJKwvnCBaomSgWG6sU+FY2k4QppXGW/sYZQJgX/ClT9vY/dooCX+qAyrYyyZtSZvzkpYkx9z3PU73mjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA4YTDdTQ1CTJU6glAlVJFH6RXBlghU9l+pqgF7PwO0=;
 b=1pxsgW0e5b3N23X9Ue7+0hqv/qIDtC5qn7hQ09N5/Hg4WJVqg34XEhHDUBIedPjQ0mWF81lpi4l31S9jX/hH56a/wP1y84lP1lrq1k9miRkMlXkpKGU+cS3up1rp4XR60gwbYUcI6JRRWDm7FhWx6kK6Nv+NbjVzFY0+LKZZ/47ijITBSpMU5MgdDozDh+MsPAjDZLVrmcr+ifxX8otO7r7s1A+D35ruEMns3Lxku+ub+aB5qDoaxE5LG9xfkV10bYF5FHRA0D5ygtYs1sx9v1vnw1c2byr2r2EUpoOITwrURC5ciYcX9LHrAI93oY/rsCdUEo5bkTCq31WWvu4uWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f04f1e7-4fd9-8ab5-0ea0-b6cf5925ca29@suse.com>
Date: Tue, 13 Dec 2022 10:47:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
 phys_to_nid
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20221118104508.768274-1-wei.chen@arm.com>
 <20221118104508.768274-4-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221118104508.768274-4-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1017ce-bb6d-4248-a9d5-08dadceefd9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o/470LcqprIOZRQGzUArX2dAbzJ7KcQuJ9MmJ5L2GP4Tjxp4wK1jAWGAQnKct1UP2g0iilyIxBKgP/9iAVt9+nPMIVEOsypSyRVv7edSUIlfC8EEaORUtt0eFyTDZaGVJup7/4/fd7rmOoEDRd79WfD6tOoQpNotfjfQwlPgO/tx4guQ/lFMEiUk4kDgNQ3qGBWEL8uth0+tN/pZBQCmvt1t+2apoMNDTO2q7tjqaZ5YURxXobXi55uOmWAdkJvQDFiXEcfDE7N+CYi/9AiWToASH86ojxVjs7mCvZ/4680HTpiFyHJuWvTZuISM+uPsTQstcCBb6D+eB3xRTv5sFSzOrmoIiCOcfhWzUVWdW4m9gL1+veWGlcWFOAWHyvqMhXI7gGw4obXshG9MFfgIYNBV9etx/Qh6moOA/qyEnaBVihm10HZE3zGSbJa4hIcrALxn8tDZPvdCM0caf+xocLqOnXWSW/jUmUaX+V0KVJCh/rbXRFZKsvJO3L8jefnngpOsVmXoyoZPmvPX+lU5myOIbvjy5XtBRK5CfzP+YLaNX5s0pDf1a/6CAaGCrg/4wfi+QOguDAIgsy5b0fKAqBtEVOmBK9+OgPiAR0fIs075gpRJIN6ZVDwfcB6qYNdaCzFGQW6j01UKMLCNDAn14qN5MSq8pe8UncS7j8anIRayFkOFkIBWOSiN58QaRg2uULGAocd8jX8lENbpXWReqaxTIrhHUjoWkFzXyeGLTV8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199015)(41300700001)(38100700002)(66556008)(31686004)(8936002)(66476007)(8676002)(5660300002)(4326008)(7416002)(186003)(2906002)(316002)(6916009)(66946007)(54906003)(36756003)(6506007)(53546011)(478600001)(26005)(6486002)(31696002)(86362001)(2616005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUFoZDZMelJmem5oTTJDL1BmTnYyRnUyTXQ2TjRKOUp0YXhwTlRrZEhZTHFK?=
 =?utf-8?B?SXpUbWdBN3dDeURXMlVSM0hYWGlraSt3NkJvRkNOa21lMFMxeEZYeEZuNC9U?=
 =?utf-8?B?YWxVb1hqN3hIdld6K1poYUtkV1hZQklhRVBQaE5NVG9ZMGJrZDN2VFZlMjhJ?=
 =?utf-8?B?SWNhRmt3bXU4a3JrM0JpZGU5ZWNjR05qdjA2VVJCSmE1K0VjN0E0UlBKdE9m?=
 =?utf-8?B?aWZoWWxwbE03b1p1NEdSS0ZSOFdHRHQ5YytMMjI4TDJwWXBpMzhJZnFXOGFr?=
 =?utf-8?B?dkFXMmNnRm1vTFpQQWEyaG9iOC9ERytmZXJoS2FzUWovNU9ScDdJV0xJeldM?=
 =?utf-8?B?bTYvYkxkekNUMEozZkFURUxFOHI3UXZQUXBXWms2TXJQUWk4Zkw3UHp3aHla?=
 =?utf-8?B?MHRKVTVoNEUyZ09NZk4vN29IcXlwSUNDcVl2WEZyNFpTaS9IU0p0UDV2eXJj?=
 =?utf-8?B?azZ5dFBTUmVEeEpkWGRCNnpmTmdKRWtESzdZWTNVZXlqU3Bab3pTNTlUK3li?=
 =?utf-8?B?Rk5NYTNNV2xmQTVQMHFBQ2ZQcjVSZVdkNFVBaEkxbXpPbVpOQ1dSbmFhU0xO?=
 =?utf-8?B?MGt0VjZHb3c3ZTM2eUR5VXhFd2RUcUVGNmt0TjcwWkx5OENFL1FSaFJGTVY1?=
 =?utf-8?B?aDBnd3FCcnNmK2UzZGN5cU5qVFdiUktlQnN2V09pSVhKOG5LMmsvZWRybXpy?=
 =?utf-8?B?cnQvRXB5S0E1QUtsbmF3dkdnNzY2ck1MTjdXSEtudXZyaTErYzBzOUtTcThX?=
 =?utf-8?B?V3hqSTc1QndoUzZ2UTErRVk3YW4wSEwrWkxBNHN6MjRDYzk2KzhaWlN0RnF6?=
 =?utf-8?B?V0dVdmJ2d0s3OUdZVUFUd0RSdlZZdUVab1RhSHpnRmFCZmNHTWRmaTRtbjdG?=
 =?utf-8?B?ZnlabWpLREh3b0RGT0Q5V2hjSG1ycjd3UHFyQjFzN0VldnhQYkN5Z1ptbkxN?=
 =?utf-8?B?QkZUQ3JmTE1aZ05DVG9pbGNPNVJId3pRNmZVakpKY3dYek1CSkJGaHhRNHhr?=
 =?utf-8?B?a0VvSk5wM29sNU5nNHFQci9UQnlZNlJNWkpseTh3M1hPalZJbkNDMnp2WC9D?=
 =?utf-8?B?NU5rSzdUaGN4RTZtYlRtV2xvTy9GSk5ZcjlCNUJWUHFhZysybTFVK3BFS0gr?=
 =?utf-8?B?ZzFtdDNiN01jUUVaVnNORVc4R0VDTUFHU2VaUmlMdGowQldEUFpPNXJGUzdo?=
 =?utf-8?B?c2VpTTBTWlBTamhZMUZFSUxEci81MnYrNEFoeWFFZ2NZRjR4T3dXZGRhdzlJ?=
 =?utf-8?B?dWZVdG11MkJVS1ptN0wvMGxTNUxNODdYRHhxeEpobkdtcDZpN0pxV3RabGd6?=
 =?utf-8?B?QWszaHhSSDdrc0tkUG96VTBPeTBhN0NOeFBwaHhVa29ERWtpaUtNeWNya09N?=
 =?utf-8?B?aDdHSVk2bk5SUUdDTnQycWVUQ2ZlRWhzZjVQN21jemxSblhqYmZGYjlYYlBB?=
 =?utf-8?B?RC95WUlLTFhRYmJaVFI1RTZMUWlvNHZjaEZtUXk4MkRJMjNsK05pK0JGR1NR?=
 =?utf-8?B?ZXpDazRFVzhlV1kvU2hZTE94S1RCUURSaWtVWHdWMEF1dkpLbGJLbjZva25h?=
 =?utf-8?B?cHpnOFpiakhkU0xUNXU1Rm5uWTBrVW1adGRUZkJta05CYjJrNWdaeWhpWWY0?=
 =?utf-8?B?QjE5M0NyYkZ0d2ZVclpiN2RTNEFObmV4QmkraGZlc21KNDFPWXhWUC8vRW1v?=
 =?utf-8?B?RkVmaWV2K09yZHZXbGR5ZWFDSWk3UER5RHpzbFEySDcrQzVWOFhVZ3NNeS80?=
 =?utf-8?B?NWE3c3lESUZKS3l1M1pkK2I4WXRQcEdFWU1pdlhCcnlNQys1Qk53WHRvekxw?=
 =?utf-8?B?MzdFeGVFWFc2WU5VK1ByQ3l3T0FZc3VKR1FsUDNXTlh5QWVrT0lvMk5HeFV2?=
 =?utf-8?B?Y0lEWWxCWXcvWlVScXk2WWd2a0ExYjU4a0ZkdU1MOUNtRUhtM0N3cGF0M2FQ?=
 =?utf-8?B?ejdpWkgrOW9KenhLRjJtWUlZb05PMVlCRGRLSHlSM2FEUDJDdXZGUmE4Y0xz?=
 =?utf-8?B?eC90NVVrdGRLckdHeTFqYUVYZkI2SGFtSk8vZWR4MDNoYm82OGlDeFZGcU9u?=
 =?utf-8?B?dXUxaGlGdzJTOXpXQ0JqN2ZkR2tuY29FOUVoTFNtVkNpcWNhT2pwN2NaajRy?=
 =?utf-8?Q?Q8dKqF6FK+4rcAJZcXIEB1k3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1017ce-bb6d-4248-a9d5-08dadceefd9d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 09:47:04.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMKz2ajHbXYyeJTpd9D1HSONAxLAK20KFV3dWsHza9BRteZo2AE/WiMg/yN7JG6vHs4ptdA6KBgZwSvpjoJniA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8823

On 18.11.2022 11:45, Wei Chen wrote:
> VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
> results in two lines of error-checking code in phys_to_nid
> that is not actually working and causing two compilation
> errors:
> 1. error: "MAX_NUMNODES" undeclared (first use in this function).
>    This is because in the common header file, "MAX_NUMNODES" is
>    defined after the common header file includes the ARCH header
>    file, where phys_to_nid has attempted to use "MAX_NUMNODES".
>    This error was resolved after we moved the phys_to_nid from
>    x86 ARCH header file to common header file.
> 2. error: wrong type argument to unary exclamation mark.
>    This is because, the error-checking code contains !node_data[nid].
>    But node_data is a data structure variable, it's not a pointer.
> 
> So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
> enable the two lines of error-checking code. And fix the left
> compilation errors by replacing !node_data[nid] to
> !node_data[nid].node_spanned_pages. Although NUMA allows one node
> can only have CPUs but without any memory. And node with 0 bytes
> of memory might have an entry in memnodemap[] theoretically. But
> that doesn't mean phys_to_nid can find any valid address from a
> node with 0 bytes memory.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Tested-by: Jiamei Xie <jiamei.xie@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

This patch is what is causing the regression found by osstest. The
previously silent (dead) checks no trigger when paging_init()
encounters a hole in SRAT-described space, as is the case e.g. on
the himrods:

(XEN) NUMA: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
(XEN) NUMA: Node 0 PXM 0 [0000000100000000, 000000087fffffff]
(XEN) NUMA: Node 1 PXM 1 [0000000880000000, 000000107fffffff]
(XEN) NUMA: Using 19 for the hash shift

The node ID for 0x80000000 (slot 1 of memnodemap[]) is NUMA_NO_NODE,
which of course fails the left side of ...

> @@ -69,9 +67,9 @@ extern struct node_data node_data[];
>  static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
>  {
>      nodeid_t nid;
> -    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
> +    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
>      nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
> -    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
> +    ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);

... the && here. As I don't think the use of phys_to_nid() by
paging_init() is outright invalid, I would conclude that the
condition needs to be relaxed to permit for NUMA_NO_NODE. Otoh it's
possible that the function was really intended to never return
NUMA_NO_NODE (and only ever be used on valid memory ranges), in
which case paging_init() would need to use something else (or
make the call conditional): According to my audit all uses except
the two in paging_init() are on (supposedly) valid addresses only
(commonly when already holding in hands a valid struct page_info).

Then again us having phys_to_nid() in the first place is somewhat
bogus: No caller really starts from a physical address. It would
be quite a bit more sensible to have page_to_nid() and mfn_to_nid(),
the more that what phys_to_nid() does is pass the address to
paddr_to_pdx() (undoing every caller's to-addr conversion). At which
point the former could do strict checking (disallowing NUMA_NO_NODE
output) while the latter could be more relaxed. I guess I'll make a
patch along these lines.

Jan

