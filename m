Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F26E9527
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 14:59:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524271.815082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTs1-0001nv-5j; Thu, 20 Apr 2023 12:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524271.815082; Thu, 20 Apr 2023 12:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppTs1-0001kc-2e; Thu, 20 Apr 2023 12:58:41 +0000
Received: by outflank-mailman (input) for mailman id 524271;
 Thu, 20 Apr 2023 12:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppTs0-0001kW-51
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 12:58:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11a37e8d-df7b-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 14:58:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Thu, 20 Apr
 2023 12:58:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 12:58:36 +0000
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
X-Inumbo-ID: 11a37e8d-df7b-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKKZ/QOQHLXSpyRS/pdeUvv1vYDPuL+e3ogo0nTzervEKrq89yXzxk5wiLogHzNn0LJvTwGBD1OJPNau7ncOhNTHpxfC6uTr/zSMXtvpZXw+x1SPJtUwFZ+yk3pKVGqsURuHG3dGF3QHvUL3M6easqHTJjVt8X3WMnO6XJGiDTFaV6I+B9lOAhAG80h9rfuM4zcJHF5/WqX7ahGTK/vtwxasXjrll81dwamR7K4DzCEnKcAt7Zl2oVN5F9m7XB6rBMTnVBASzBEaKFFkRHBmHx9aUBKtXI4YbdxBDAllZ945GD6UM1NQlBwvvLF6n/1KTdyvmXYFOiHXoTeDTFHeFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCfGgZl4X27b9QoV88wafyiR3/oTe67CNBLXpNbzCMI=;
 b=FlCU3eBr4TGvMMen44EXLqt8KvOF1bRcQiUE6psZWKx3bradMEf9z3Si7/Dj8kKhffYb3ID3KY4ZsezUoJeYupgfrdw4Ck6bieBoEm4Ug9k48NW8e+WUZjPK5GmoSXXoy1kteRTLiNdg32SJo4VPV58mJ6bP6BOX1qSYqRFm2kClFIsRNWJVwplcWfuZn0gk1On1pqi+4u1s4dGVWnCNy/BHqiTMP2oyS4qgQyRTtOBK0eiHTh0SHTpC26H460tgdox6D+fzXds8lL/h7CqPTaSz0vRfOVO24c2u1H3iqUOWSEWE5IeEAnsPaL6kj89T3zdzS6YPs/Sp0yi3shEz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCfGgZl4X27b9QoV88wafyiR3/oTe67CNBLXpNbzCMI=;
 b=BmIgFe/LYF0w0EiIX0Am8ipfXpXnL+neoGOimri+SCA/FymmioQUpK3LtGE5/sDcKo22qa6YKOPan+7TOCyPyY87R7WLQErVbCMURwIPgs6JBDP6gG7abrXvR1XEFolnt5zqRcHcpPaSsW5pbGTFwdyDV44zSUDv2ElyZkcbItWY0aCOuAucy+e6KsvE9LtNHbUKK7XLHr+XAVVTzyANHu87xGqe3asFw5uVPl7ZRvjojo+A6E/73KeU4Brwj6eoasZHQk90QNdrQAnf5VYMvvJSCwOSpMEQgnQMFMmBWX0RUf5RjHUXCHwkNzJx9iUkk8CkztfSh5/cWuMsL/fyzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
Date: Thu, 20 Apr 2023 14:58:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 1/4] xen/riscv: add VM space layout
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
 <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: b81071cd-cc4a-4252-895c-08db419ef43c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yzKzCBQ5trFT4F2zRRwg4U/zVRMQ2piQxQznwFsloScPA/M+YetTXZVeJMahslzoUgUc84M6GsQ8O5+I5YJIThxDOf5Nmm9MAIuZEBbvv8ro4IHIe6GOZVLTRk6z5pi53xcLdqEam071evVKzdYqdCOBofb42Tfti9RRzqujUsOVA+rgY1l+S2uQ91OkEaaWTqDzjyYDJmZ0igGKmr4//eUGByA82G292jL/EwUFub7w8n0RP7C7kiNSHeMdaicD0olM0vG5aCf30GBs/yF+Ev1E0PeT9JXh3gZ/FSp5irvfXrIBVBXWMJnweOG0Iw+Oqq40nbeKVHvXrU8c5untbQn3qOLSacuir2qCkWrmhgx8V4HpjiVaydOP4SmJCTdWYnqiScuCVhPxt/uGclr58I0R4yMZPk39itBfur1X+R/luGFu1tQ6qCihYP057RTF20gxZj6cDHZq5c+16Qd3S6Ncb/OVJ5/kE+jOBQYf4EjwMzr+MMp0wwhhcSwd1lMXMRQ5WwvJCrd5eZt0LyZsiVYjfE1T+16VJocVIqtR/qH4qKBGLQc400RjtyMq0bRrQeLNsJVJnmmddKrDOtEn7lqCQCXDzTjup0PN8U7Kf2kaCDMXsY1+Tv5fdCFuzH/18tzeGXeVqMs9S5zuQmf4rw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(31686004)(6916009)(4326008)(6512007)(316002)(26005)(186003)(6506007)(53546011)(8936002)(31696002)(36756003)(86362001)(2906002)(8676002)(5660300002)(478600001)(54906003)(41300700001)(2616005)(38100700002)(66476007)(66556008)(66946007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3l1MmUrQXBkM3dzZ2p1UGNtWDJJVTUwd0tONmtOYjF5em9WTG0vK0pwOFBk?=
 =?utf-8?B?UDN3UHZ6TEhNZnZiMUNFMXdGa2VFK1ZEYVpILzdxSEtaREFZd05mamxCQ3ZB?=
 =?utf-8?B?T1h6alJBMC9vbWxseHZvMGI3czUwWEUrcHR6Mi8yVFMyank3M1JVZko4Q0p0?=
 =?utf-8?B?UFZaRTJSZkVHNWxybWI2Y3Z3WmZKMmZwSWxNaU9qb0t2L0pld2FlbnZpQU9j?=
 =?utf-8?B?cTJNelhJOWZZNzBKZUlhcTNyK04xNTRoUGVZK0d4SzUxZ21XRHJxRW51TWtj?=
 =?utf-8?B?aTBGaERaU3RFWm5YYmptVHVxK3BBWXZsTEZFUW9qNGpwbTZ3ZWxFMWxYWkZO?=
 =?utf-8?B?VERldzhIdlArR3NuWkhpL1JXMFpoQUtFUFQxWUNleHppdFV4VnFnZk1wRTNh?=
 =?utf-8?B?NG1SdUVJanJEVW1EVUFYSXJ0N3VCN3dmeW1NcVBTc2dWV1pLdTV4NFVKQW9H?=
 =?utf-8?B?aWVSUWg4UUZaL3h1YlVXdFg2NFBCNm51QllyNElsajJaeUYyOWd4d25KS0k0?=
 =?utf-8?B?SGpnVmtTeDlmWlkwVDNHTzh2eTUydXowVVdJWFV5ZGdWcUx0YW5NQ3lxdmVz?=
 =?utf-8?B?TFE3NXdKcWhnR1haZldoK2xkcCs1YU96QWtsVnI3MXBTbUhwTDZua2Y5bGpz?=
 =?utf-8?B?L082RTYzeUgxMW44bVRoOXBjekZpZksrbXBCMXg3RDdxMkZsQXFBd2VsQzRG?=
 =?utf-8?B?V2NrQ1ZER1FWQjFsdUxyQjgwOHo3T3NmS2ZsNVVMaWZmNVdHTVc0ekhGMktL?=
 =?utf-8?B?V2pTT2UxLzExbXpWWnpyMkcyb3E0Y1hHY05mQkhFeGRpV3RvOGlUNUJyUEZR?=
 =?utf-8?B?d2c1ZlRpRVRFQThrNHVnQXdyWjl0YktzMlowRXRJMndwUWtWM1RvRnVTWWt4?=
 =?utf-8?B?bkhXaGdzcmd3TnU1ejdpeTZsUDduejg4WUhNdVp0Z25Ndk4zVTF0TVl1WmFs?=
 =?utf-8?B?aW01M2lCUUN3eHYwOVFvbnpURlVQMStzR01ZMjJPTHpUOUQyWmY5MDFTaXVs?=
 =?utf-8?B?WWQxWnc1UFp2NG4yaWFkRW54eDd2WHdmaFMwbjlnZldiYytRNkN4RDV1ZFp2?=
 =?utf-8?B?UloxWEEyMU0ydHA1WTJEQVgzSjA5ck5MN2J6bXp4dVhMblNkcEpSMkl2ZmY4?=
 =?utf-8?B?Ky83K3VMRFB1K3F1Q1gwTlV3QlRKQm1JeSs2M0RobENnTWxnQjQ3eUVzNG82?=
 =?utf-8?B?T1RzVkpwNDArTTNpREtZRjhDTU0wMWxGc1dCY2p6Umo5RWpVbHJVMGJ1TVM5?=
 =?utf-8?B?NWFtd2lJMGV4dVF5U1pYa0ZEWk9WS016SjgzUUhvaldwNWNFYzFlVmVIb0RD?=
 =?utf-8?B?aFN1SExZVy9EUEVObFBhdWpCWkNqV2huWXIvM09KSU1WMnB1M3ZKTmpQNVEv?=
 =?utf-8?B?NGdFK1NvNzFRMy83ak1kRXNVMEJSbTdaVGhISHVkV2h3eXlEcGp5K1dEK1F5?=
 =?utf-8?B?bnFSTEw0TGFnSVIxL0dabFE3UkZLeXdsalRGOERqNnFJaGRXcHBucnlMRERw?=
 =?utf-8?B?RUtlL3FDYkN3L2pUb0FQREdjczNLME41T3Q5ZGZCN21uczU0M1ByNVMzemlR?=
 =?utf-8?B?UkUwdDhMdjg5UW5DWTFDcXVRV0J4UkxnU0tPdmxhWHRUQVUzRklodEdkUEZz?=
 =?utf-8?B?blB0SkZjYkZoYmtFQTlZdml3ektqQUlXRWpiRmI5RGVNcGF2Qi9HSm4zRVd4?=
 =?utf-8?B?cittNWpWdU5IUzFRek5OVVZ4NXlUd2VpK2xjYU5idDVQaXpmam02TFY3NVQ2?=
 =?utf-8?B?S2h0Ym16cVdkcElVRVExWjErSUo5cDhkM3h4c1JDSmc3ZkpobVI3Y1lVY1BG?=
 =?utf-8?B?QnhDUm1BZDN4Z1E3dlNxWE16eWNoWXM5aVdxWmdzRlprSndVS1R4UWw0NkVX?=
 =?utf-8?B?elkrV2lPdFR0SElMN2xCKzZNdGNHZzMzMWhseDc4NlRnMHhJVWZ1aitvNElJ?=
 =?utf-8?B?aVlzZnBEd2tLOExHYzhJdnBDSS8wNUVSVWhJSnBsYWtSV01pd2YxWEJFNkRE?=
 =?utf-8?B?cmNLVlpYNis1a1M3bS81cFZJYkkwcGI2ajNEa2lpVDI5U1RmZHEvKzdGVVVF?=
 =?utf-8?B?Y3ArV3BwS0pkdFJOcmVOVlo4bU1tSEdGdHlIK09QSExibFBwRi9hdHdhRnc0?=
 =?utf-8?Q?9NGmfSDIkuTsaFT/sH9SdvscT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b81071cd-cc4a-4252-895c-08db419ef43c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 12:58:36.2524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KquLQquu9L2IAdM2TSA3u522yDToaGWsNsQrhlK9yiQ4lCm7nAtDot+2fX7U6XOohREFBhuaPzPDznbqwDsLtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7366

On 19.04.2023 17:42, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -4,6 +4,37 @@
>  #include <xen/const.h>
>  #include <xen/page-size.h>
>  
> +/*
> + * RISC-V64 Layout:
> + *
> + * From the riscv-privileged doc:
> + *   When mapping between narrower and wider addresses,
> + *   RISC-V zero-extends a narrower physical address to a wider size.
> + *   The mapping between 64-bit virtual addresses and the 39-bit usable
> + *   address space of Sv39 is not based on zero-extension but instead
> + *   follows an entrenched convention that allows an OS to use one or
> + *   a few of the most-significant bits of a full-size (64-bit) virtual
> + *   address to quickly distinguish user and supervisor address regions.
> + *
> + * It means that:
> + *   top VA bits are simply ignored for the purpose of translating to PA.
> + *
> + * The similar is true for other Sv{32, 39, 48, 57}.

Personally I find it odd that Sv32 is mentioned here (there's no truncation /
aliasing there aiui), and that Sv39 is mentioned here again (when that's what
the earlier paragraph talks about).

> + * ============================================================================
> + *    Start addr    |   End addr        |  Size  | VM area description
> + * ============================================================================
> + * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | Xen
> + * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | FDT
> + * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | Fixmap

These are all L2 slot 511 aiui, which may be worth mentioning especially since
the top bits don't match the top bits further down in the table (because of the
aliasing).

> + *     .................. unused ..................

This is covering slot 510, which again may be worth mentioning.

> + * 0000003200000000 |  0000007f40000000 | 331 GB | Direct map(L2 slot: 200-509)
> + * 0000003100000000 |  0000003140000000 |  1 GB  | Frametable(L2 slot: 196-197)

1Gb is, if I'm not mistaken, a single L2 slot.

Also assuming a 32-byte struct page_info (I don't think you'll get away with
less than that, when even Arm32 requires this much), there's a mismatch
between direct map and frame table size: With 4k pages, the scaling factor
would be 128 if I'm not mistaken. So perhaps you really mean 3Gb here to
cover for (slightly more than) the 331Gb of memory you mean to be able to
map?

> + * 0000003080000000 |  00000030c0000000 |  1 GB  | VMAP (L2 slot: 194-195)
> + *     .................. unused ..................

There are further unused regions between these three entries, while imo will
want making explicit (for the avoidance of doubt, if nothing else).

Jan

