Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62757223AC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 12:38:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543647.848793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67az-0005zV-QH; Mon, 05 Jun 2023 10:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543647.848793; Mon, 05 Jun 2023 10:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67az-0005xY-N4; Mon, 05 Jun 2023 10:37:53 +0000
Received: by outflank-mailman (input) for mailman id 543647;
 Mon, 05 Jun 2023 10:37:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q67ax-0005xS-HP
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 10:37:51 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 040635d7-038d-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 12:37:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7727.eurprd04.prod.outlook.com (2603:10a6:102:e0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 10:37:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 10:37:45 +0000
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
X-Inumbo-ID: 040635d7-038d-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sn3YBMB33yKtRZ6oliZtcp2Ykkw5S1LXCG+dXu4zrUBolVpuQ/BxKl2ICai4PRe+/kIBA4AypIrOPjSDUOe5Av9AT+MVM7FKQZrztpzsPiusWeAsmSofXNBSPJtychZPPwcbSxqeF3aIjh8gya+KxOz+kJ+zITJJPbTgxNqjZo3hnon81AioA8m7+ZV6w6zt/bJj98rUdB2WpkvdCZ76+cdyLcaVtnTOFGjB6FklkZSg7I3/L2BxKXQhWuED3I2UdAfCB++/BugUG3aTS6sBCUbcKabxwN1KkNfJbfGv4gCT/vkgUcaMA46j8kQ0be/RAiOiKjQFEgy1p/PKneTatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLV3dCt8Dlwp6KOL+CBSEms15EEoF0AsjF47DfZ+bo4=;
 b=D7/jf8ULye8qtOl1H0H8FaKqe4SKT9rPREX3w096+IjCb0ED+WdJUenHi586e8ZTqkhA15gehm69U4KV2BNYxq5M+l+C8eeFlVkVGcZqrc5Lk8bXKwPJcp1N8QVQk8EZRVzo4Ylth8rL795lASw0IaPq6Cw8OmH0HA/AsdmILO3c9iaMZpOv4k37waf4OsXE9VyXQLhZhjwrp4fXmGPPJDDitcoaIIsbjnZC8iD9hRXb8lqz896ILtJtwl5o2OZfCNg2n2/50sjQBNck5XW3Mk5UA9Tdc+q7noz1RgfXiScW0CZcZrpws4Ye0bDABnye/39dVgAS7Vh+UFBHB9V3cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLV3dCt8Dlwp6KOL+CBSEms15EEoF0AsjF47DfZ+bo4=;
 b=H/UQl7slEMCpHZpEVmWxngrpygt3XuYworCEUJjGI8fwsncXNT5d4ua8+KS7+3jHyKLpqFK7tSjM4fl8DdiI7e5TemqzorL2ZXOoaH8Rg62SF8XG/c9AWKsy6ffjneFmhwR+s69qZm/mO0U5jnSFYkFMzzMCJrs4Gs2ylZBDuOdgff0tLrQrYer9sIb6XQ7aCgTQt4qtpdWJvtVdgQ3IElPzOh1B0PBlxgy+FgTeCqN7ib0SRMBkkT42Kzp8bH4ByYufQhGZcKC8y1UIwuGSHXQuFAtptWTQNTobeL9HkQKQn3C9orKep/YWtfzk+QJz7S8wSs8JjK0o6eXK5OfFzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d6123dd-1776-e980-5638-0c5dc0755fe1@suse.com>
Date: Mon, 5 Jun 2023 12:37:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] xen: Fix incorrect taint constant
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605100512.1748007-1-andrew.cooper3@citrix.com>
 <6ce6c267-7e9d-d63c-c7f0-3bb7554a3f83@suse.com>
 <525e1b83-fcd1-1b48-3ba6-87843ffdd213@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <525e1b83-fcd1-1b48-3ba6-87843ffdd213@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe69f07-cb29-4b9b-059a-08db65b0e5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Iy/YktFfpTbOWlaywmek3zz+URLpJbsCHfuAXUdPAP/xmEz1s8DhLq1C4n35+89l1y0gh4Llh8tBmEmx+3RACccPXhhr5fojkCG1gnJVUOlkDnzyb9x6JkBw8rYgFb2nF1TCnzghz3qaTd6gU+/A8LIDDii21aDPQPfgLUAjTkQ+LD5ypha5ZXHddp8f1lR6nb2ESSO8XSKO91L/dKQ1RX0RLiDeRsGkruEfZA66ruOK0aLDtcy4AZ99TxHF+dqBAhn/086q4l08vFufhNFowP63mtmPAD1PbSr8OZWNpSY+SECweG2qflk0pZ81oBamUIyb0npgvUQBm69c45x2bzhb09ZkXsAAKjq7Ml1bpm51at14uCIPi79zeIxHBPGoWghqSEdS6LAkDpxQTwEWKmFIrC7tcbGIR2pFHi0TS2SYCzogXFtjmOgk+sEDk8DYtINcK2Cl3YSCqiVYGFbzwyjAWoPIaw+bhO0P1uxEextnRIaWYwh65/1UYlcH+inH0pMbwoosMnKL1oEqXp6oBvW9+qMJvIWJmdR1PADGsKWG8z456h08NEELMJzdrN4l7O+oTOZ2U5y0w62DZsZ2kJ7OoXnlXw3674zlb+UHvJVVnjRmZXoONA8P84Lo/+4/Yix2Nv2P7QWkHYZu4nEEkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(6506007)(53546011)(6512007)(38100700002)(2616005)(41300700001)(31686004)(6486002)(186003)(26005)(478600001)(54906003)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(8936002)(8676002)(5660300002)(2906002)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3U3elNmdmhOREY1c1gwUEZ6WFdScVY1d3VINVYxM1lBWStocFNxMXBoSDlp?=
 =?utf-8?B?QW9VaHlScTd6Mkd4MWVIZjBkR25rbFhUSGVsdVEvVTlYRkxGOTVtN0dZbS9l?=
 =?utf-8?B?eFpsK3NQU3dhL0tuSHRINEVvTVFDTmIwb2twelBxZGJaNDM5ckFRT0NtTXZz?=
 =?utf-8?B?Y0tkN1FJMnFTRGhOd2R2M2R4bFRJdzZ1N0xnTTlVMHA3cFcvTlEvUzdXTEZV?=
 =?utf-8?B?U3ZIRUhqMlBtNmhaaUMvQjliOWNyVWI4Q1MvTUNuek80cGlpSmE0bkxZRlQr?=
 =?utf-8?B?bDZGSzRJQ3BaQ0o5SmgyMGh2Zi8xYnUwVU5LNjQxNmN2T3UxR1VNUTFZRzJv?=
 =?utf-8?B?NGpNczlpcWZsZzMxWFdKNU1LalVXaEFCTDZyWk12QXZlM3BxN3NlRzMrdS9n?=
 =?utf-8?B?a3E3SHNyY21NVmZlVlJtRW9PZzVzZWF1aU85RFF3NlpuNUNHeEhqbVZWNGNq?=
 =?utf-8?B?QVNVK21yeGV3MUF4c2NuWGpvSzhnd3JhVkxVTXlrcHRRc2s2Y3ZrWThqdEFH?=
 =?utf-8?B?OVhJcDIzUGVVb2dhemFrR3IvTXQ4ZG4yUjFJTlFCUGw4NVpCdnBUNzRqdzVz?=
 =?utf-8?B?Y3hjalpodHphMzR6aUZiSmMrdzRmWEFmVWl2TzhsTDNrSVdTa3F1VUFwM294?=
 =?utf-8?B?bEJhT2RVZXRzaFhXZ3E4UVQ1NjVVSFBwQUhRbm02UERTUEdxbEtzYlZXVDNx?=
 =?utf-8?B?aEtyTXlZY1BqdGlPZmJ0VDQxbXFjMzdHaVZEdXdKNGZ4cjArMUpVOGZhcXpB?=
 =?utf-8?B?OGdHdXlNeGpSZ2RJUGo0TkJTQlZweWozTkVkL2hZMmh2NU0yK1VXRW5KS0RM?=
 =?utf-8?B?bXcza0VmVy9xSWxuOTBOUC9KL0tBdDZSaEtGUHhUT0N2ZzEreUswZU5jaXRJ?=
 =?utf-8?B?Vzg4QWdCa0NlVTU3VDBpeS9YOTlpQmp0SkNyMFBUS2pDeXFJdkJML1FXQW1Y?=
 =?utf-8?B?eHpVemF4TkZXVU9NeW9WQ2FHQzBJUzJEVjJISHAzZnVlbnRXWUJYVVQwMXpP?=
 =?utf-8?B?RHlCQk1PaTE4Mmd5Tk1PWnp0V0NIT1J5NE1DSDZZaitvMVZRM0pkOUxqOE9Z?=
 =?utf-8?B?aFlvSzM1d21QUERVRHhkbW41MTVkZHZQOFA4K0pOYkNGNUtVakRIb1IzWElX?=
 =?utf-8?B?ZGg2NnBWS0NyaXVwZW0rd0xtM25ydXNoVVozWFZyejJXbkI5YXQva2xNTXI2?=
 =?utf-8?B?WWlGZ1FpakRzZzAwSHNmd3E2bkhlUjVaL0hhTU5kcGUrMUVRU05kaVZNTHF0?=
 =?utf-8?B?U0xFRVVXUk5oZnBKczZLWGpqS3dPWkg4N0Z5d2dZZkN1WXlEZ0l1MkFqc1Za?=
 =?utf-8?B?ZmpLbllmVEx6TFJsNzJ0QUh6QnBUUE9HZklZUkUxWFNGR3MycFhHSHA3OEEy?=
 =?utf-8?B?bWt3RHVJYngxYVZPUnR3VENXTkR5ZWYzdERJU2d1NG0wQVRIMng3eXgxUEwz?=
 =?utf-8?B?dUFaTEMzajJzWThsOHFXOW01MVQrd1ZyVVNob3FIUFhHblBaTTBXZHp2d1BY?=
 =?utf-8?B?S05vVGMxWVZ5eWMxdk5ET2swUTR6OHVhbU9uYS9LZVYrT1llNmNiOTVhZzhQ?=
 =?utf-8?B?TzZZK3p2M2ROVkpYOElOZEJscXdsNEJSejdYRVJMZTFaR2NjLzg0VXdDWG8y?=
 =?utf-8?B?QWlhQU1VVHNhbEkwcFdGcTRNUGxmTWhVYlFZTlJ4cnp3U3JYR1JreE1CTUp0?=
 =?utf-8?B?ekZacGhFN29PSExrQnVlSVl4ZDJpYUFVMWV1WkZ3eWN5TWxXVFdpNDBnWG10?=
 =?utf-8?B?ekxhSStTeFllUytDaFh0WWJXUktRT0F3eTV4QXRqVUtHeUZRSnByQjltalEv?=
 =?utf-8?B?QVA1UXBnb3M2QTg2dnV6bUVidzh6Q1VHdUNGYXpER1ZsTVovT0tZWDR2Nk93?=
 =?utf-8?B?VVpXdWJwOC9CdmdwUzlXYlBLTlROMlJ1RW9YZmZPNTZGVnhHWGJnN080MDZE?=
 =?utf-8?B?R216S3l0YW96dTBHeVNNTzNHUUovTlZXMERnZnJvMFFwd3FHampnSHRRazd6?=
 =?utf-8?B?d2lSVEMyeWZzNk4zdjYwYzk1d3NyTHhQZXN2YllzNm5mOFhhQTIyYzluRGlC?=
 =?utf-8?B?QnppTlJaS1U5VWtvLzB4WXBTbFNMV2ZlbDlUVEhGK0lMYVBxRVF1SlV5Qllj?=
 =?utf-8?Q?t5l2GPmITGop5BBs8PQgQL1rY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe69f07-cb29-4b9b-059a-08db65b0e5f8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 10:37:45.2521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRD+W1OB8V93cS8xHpt1x2mKBZ+oOY9z7wVqNDhVTQ1U6aJpwpS8MLaRsEcPsouawSnMk5REhPug0BDjq0RKTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7727

On 05.06.2023 12:14, Andrew Cooper wrote:
> On 05/06/2023 11:10 am, Jan Beulich wrote:
>> On 05.06.2023 12:05, Andrew Cooper wrote:
>>> Insecure the word being looked for here.  Especially given the nature of the
>> Nit: Missing "is"?
> 
> Oops yes.
> 
>>
>>> sole caller, and the (correct) comment next to it.
>>>
>>> I've left the taint constant as 'U' as it's a rather more user-visible.
>>>
>>> Fixes: 82c0d3d491cc ("xen: Add an unsecure Taint type")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks, although I've got one extra hunk to add having just done the
> other half of the taint work.
> 
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index 14ce6b40ce06..ff67f00e41bb 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -344,7 +344,7 @@ unsigned int tainted;
>   *  'E' - An error (e.g. a machine check exceptions) has been injected.
>   *  'H' - HVM forced emulation prefix is permitted.
>   *  'M' - Machine had a machine check experience.
> - *  'U' - Platform is unsecure (usually due to an errata on the platform).
> + *  'U' - Platform is insecure (usually due to an errata on the platform).
>   *  'S' - Out of spec CPU (One core has a feature incompatible with
> others).
>   *
>   *      The string is overwritten by the next call to print_taint().

My ack (quite obviously) stands with this further adjustment.

Jan

