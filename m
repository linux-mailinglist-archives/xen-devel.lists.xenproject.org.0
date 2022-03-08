Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111054D119B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 09:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286578.486140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRUt0-00068S-D4; Tue, 08 Mar 2022 08:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286578.486140; Tue, 08 Mar 2022 08:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRUt0-00066a-9N; Tue, 08 Mar 2022 08:08:02 +0000
Received: by outflank-mailman (input) for mailman id 286578;
 Tue, 08 Mar 2022 08:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRUsy-00066U-FO
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 08:08:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dde10b99-9eb6-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 09:07:59 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-TVLMaOJvM9ScTgCY-95AYQ-1; Tue, 08 Mar 2022 09:07:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5757.eurprd04.prod.outlook.com (2603:10a6:803:e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Tue, 8 Mar
 2022 08:07:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 08:07:55 +0000
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
X-Inumbo-ID: dde10b99-9eb6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646726878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dVsBHgTQhgRYrpY17WjFcdPVjzBQlMdlRS0U1Tvchn0=;
	b=frQivhuuhhv7FsEAz4W5a5Gar5iclJeWjpUpH5pVuNhyRUVdbZizOO+E/wwGkmzwKc504C
	RzX3u6+xKfHJWU4hbosD/hPXjLuXFxlbUpJsTrvne9JmgsQQMKAih7YOpB2ywuprNXhkhT
	r/tB0xMwXAvRYtUt6Nwfn1J7J1YQRlY=
X-MC-Unique: TVLMaOJvM9ScTgCY-95AYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWkkuWTjgvXRQ0XlPFEkCkPsK2Gc5tnSZxqoT+f2ozRKzyVeTItSVzZ6N0+mVl6XnheY88EmJ0QjcdklBrbwXsWheB4VcTOWi24idXs32tWEZf5pogkC0Y+Izr8HXj+3OwdJQOaqmBE5Er1WWswLqwmLtT66yjPtS02da1X/1+buzmgLe3ObObApN0KYQnw4jxFqlDHmRuqbUGKYNsmfF5UM0lEvrbhbEaclM6c2u7jMgp4u3u1ufGskux16hPHlzvBMpfkeY9jmQtcuCWuand6oClVkyxvo6fduvoUQ2MYmUac0wEuizd2iPqO6GebgRU+a6WeddoscMyMhDwPObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVsBHgTQhgRYrpY17WjFcdPVjzBQlMdlRS0U1Tvchn0=;
 b=NOw0ooHMI8OBwoq/MNAJrUomVu+JoVL5xY5Ar/8hIwZGDGhAmU1SuTNq2yyEqKDQ/2g0/5XL8lv85GPUAF8D+w9u1Bg+k5mizsSw0YXcmDZYe9hVjlTMntV1LHiUTDFyp3/hzxcCmirJREdEfpWweUuioYyYxJTluftlMLu2v+0+1vcTXoUvFLNuMtgvo2LFeSP4AO+WlSBwf26i8Kjb3cpeONJXV9y/VsaTJZi06gNVhY2h/LI8vmyCBShaG5e+8kYducViG4mCge31ZJE2AVaLOwH5iSVcNVWWaX/dbrwivXM2UeKkjVFgX6u1mufTIPAp/OKu9NTKFFkyINryMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce1ced4e-b9f7-fadc-9f18-b66445c02cdf@suse.com>
Date: Tue, 8 Mar 2022 09:07:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Content-Language: en-US
To: Bjoern Doebel <doebel@amazon.de>
Cc: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <15b092bb3af6e32f72ee8fca45317687d23b8be4.1646687495.git.doebel@amazon.de>
 <862e888468a1d9923a6e6bef4061ac0caeb9274d.1646687495.git.doebel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <862e888468a1d9923a6e6bef4061ac0caeb9274d.1646687495.git.doebel@amazon.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0108.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0000ea4-20c7-4097-e9f1-08da00dac037
X-MS-TrafficTypeDiagnostic: VI1PR04MB5757:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB575700525A7B0821333EDE25B3099@VI1PR04MB5757.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/eEGoIFMOMDeYeJAF6FJ6rhM2HXv7fUFMaZTd/mMkZZipoqDdRHCXSmEb9MzujIBBcu67XFe064fifAXxD2qsC3ypRs7fVxdn5zJJSpjVns9tdu6KsEpf3AYdWlQ31y00DyjKxBkXc59mIyd62JAxFPy+oRkfE8f3mpxxkQPRxgUm/GEpnk4nI+SbgXPHsu2wE2N+xl0aTymucRma3KVZBgx/8SVgAIWpLeS9orNGDaFVNgLWVlDpDnfwuwnlToUwUu8qaroh2cs28UD5tJJDG7iaTnM1JSiEjh1zMM4CRykkFsUiDHX6D7cWQkF2CENOr4WA1USHX6N3HGkd2eSvfuUA7dpeMuuRyRXrbqbn5HepLRXwWOchqHU5SBdzaqVv1fxnnRrUQwDCy9uI/m0w1nz6Fcu2eYtU62Bb+U8Xasx/RBViQUXuxx9UzYgFERBaEmjJ0BJxUhCmqQweNtlTCCg1Oa06+X7QcAt6gD3sTGhwztY7Nz+kk6bpnrmetmmZAxYcvpCdS+kW89xWMJqZneb/JH+Pw1novsCo/csrexjYtE3LKagaUwY7oNrC3V0UyOtxdMe7sEjuSi9aNRbTjMAL/jVySvEGjX+cM1MuNql2kqLPZu6T4JxELOL5TRZq+fg6cTNQpA2zjG5FRCibPpWhjf96kfMyUGt5bSSpsLa2VjdfCgd5QyTxFwgQSehoE0Jq9qW5sOezHOJsKVrh0J76IKVVYS9L7dCC+oMDLFqbMDvkFc+77Kwkw6O/tof
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(36756003)(53546011)(38100700002)(31686004)(2616005)(2906002)(5660300002)(316002)(26005)(54906003)(6512007)(8936002)(66556008)(66946007)(4744005)(31696002)(6486002)(86362001)(186003)(6916009)(8676002)(4326008)(508600001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWd5SmhRNDY0NnB3aThIci93TUVIeFhvc0gwVmxBY3ZwYStOM0ZJRFVpdHB2?=
 =?utf-8?B?S1Z6WkdCdmpld01LWUE3NUpuVVBwZjA4R0ZGZFlnMHdIWEorbFJyeDhCS1Jr?=
 =?utf-8?B?REVramthei9ZbjFxN0p5YVRMNnlGTGFLRitOWDFlQVJrSUhlWEFRRHZycCtZ?=
 =?utf-8?B?SlpueGY2STU3ZGp1UXd5eU0yQzFaWTVrbXZ0RE04Q2YvUW5YRGxpSFFEMzNC?=
 =?utf-8?B?QTU5ajdqN29LUmNZZE9XaFlHMjBUQjIyaW91TW5GYUZYOEM4RWYrczBpWEQz?=
 =?utf-8?B?WjhnYk5QOE05MXM5TFpUTFZZTUlMc0V6MGlRQk1TdEVNbG12STVmUkZULzlH?=
 =?utf-8?B?Z0Y1WDNHQUFWeU40S21rNTdxOE5uWnJZVzdTS3p5a1ArRExxUS9QdkZ4d3hW?=
 =?utf-8?B?eHJ5bWE2NEFkNnB1TmdYaGVKdmJPWUZ5b0ZHdW5KT2dycFpDQVdSUkhsTWhu?=
 =?utf-8?B?cWVnK3dIT0dDdmo1OUh0N2JPbUd2QTNxaTFTS3JibUU2VVBLV1JJa3lZRkxv?=
 =?utf-8?B?ckVOd0h1Mi9wYUhWTFpGaGdrejBmR3QxRmZJWEpnYjFlOUJ1ZzI4a2hsaVdD?=
 =?utf-8?B?OThpdk01MWF5QUhQV08rT0VXclFIWU5WT1dwZE82b2wzcTlOQVQvTVMwWjJ1?=
 =?utf-8?B?U1ZQYURFdnBEcnUvVStzQW5pWUp6QnM3L2Y3SUwzM1d6c0xBMHhJTU1SSnhI?=
 =?utf-8?B?RWZpbUNuYTg0aDdmT0t5K2lKWTU3d1VyMXRtTjJjVklwYlQrOFgzL3hBUnZw?=
 =?utf-8?B?Mko2NHR5eFY5WHQ0R1JvOU94ZzFLM0ZBRjd0L0xmVW5zOFVSUWNCdDBkVytG?=
 =?utf-8?B?SHYyQ0gxbjZycGo5aFhUYSs2WUlkcTJ3TE1WUmQ4cHFvKzFkYkRoY2ZYSG11?=
 =?utf-8?B?YkFBWlMrQlRUMmE3YUNvZVFOWTJPcDJiOUNKeTQ2TnJsbTJiL0x6MWQ5NjRh?=
 =?utf-8?B?cHdCOVYraU8vRENhblFyQzNUV2x1Q2dhVTRoaW8vYldOamJmamppeENmelFt?=
 =?utf-8?B?bmdWcms3SENpZDJYa3pnQkhlZFhVNFFoYjVPNXcyOEhvRnFqNXdkZXhJM2ow?=
 =?utf-8?B?MEZ2UEcwY0hncVBLazF5cm9HR1BVMTUzb3Y4OSszM3dBRTQ0M1BBaWdIUTJF?=
 =?utf-8?B?RDhWUTREdU93VThOQjRFRHd6K1AxMFdpSENDajBiRzRGUHRoUThPWEFnMW9m?=
 =?utf-8?B?SnQ5WWdSQ2VtV3MySy9XQW9aYlE1bENOMzd0bjBjRFIrTFo1NC90SmMvR3gr?=
 =?utf-8?B?cm1MWlp2clZTMDNvVWlUaE9iT0lKaDJudDlvL0lGKzVVSDRWeUdXb0tNd2Z0?=
 =?utf-8?B?RTBzRjFmcHpiNDRNTmFpaG1RUmEwY0dIS2FqNWMzM2ZvUlNxZXFBRUJkUWh1?=
 =?utf-8?B?U1hZMy83REpJVjZqcTV2WjRxeHE3NjJEUCtCd01pRURpd3MvYVRoVjc4dThl?=
 =?utf-8?B?SnZjUE15ek1hbVhEd0dGbURzWHZSQnFkRWd1Mi9YQ3JaeDZ4SDBySXpIZ2VJ?=
 =?utf-8?B?alpOZFZnSHZsTDFoNWVsUldwY0VOU29EZnRneTd0VG93VVpBd3pFV1NUeWx0?=
 =?utf-8?B?QXY0bWRVTVlyc09rNFNIcmhDUGhzTW9VclBEaDlkM3IyM2hKK1FteDVpYjVN?=
 =?utf-8?B?QnRrUDhUcHA5bVNGT0VNTkVWVjBaT3MwT3IycDA0R2YweEdudmw1aWFmaFZR?=
 =?utf-8?B?Z3NtZ3dxZ2wrdzJlZGRHS0c3ZWFRdEV5SFlDN2FpUVhHOHEyRVo2T1crNTFL?=
 =?utf-8?B?c2ttWGk1UFNwSFZXU0h5UkYwYW9PTkxsU2diSEYzWlV1aXRxVHhybytYNWFU?=
 =?utf-8?B?bi9XUjlRWHlpSEpBa1M4ZGJDUTFGMlVrY2ZsdndNSG9BNjU0UnM4OG9wVEw4?=
 =?utf-8?B?YTUwZEVJZUhJZkMyaXZVMXI2T2FEcWc1blkwZVh0SU1MdzhiRTUyTkFhSVVY?=
 =?utf-8?B?Y1F6bEk5bVRuVWtBaWhXVE0ram1EVUxjclZWNG04ODg1SU1zRy9MTmxaYi9s?=
 =?utf-8?B?QjlpbFQyRlRjQkpESjM1ckJCU2FlWTZLMjVBRWJ1eGZFbTVSaGgxTlF0ckd2?=
 =?utf-8?B?Uk03djRTWWR4N0ZKdndBRGVBdWZJRzBoeC9HTWZYa3JvNEEvU1JBdHNhVk1h?=
 =?utf-8?B?dVNxZzhMK3V6aVlicENyME9ZZUUreVplMUhqcXpSUFYzSDlTOFdLSlQ2RDNZ?=
 =?utf-8?Q?6eWFn3jcXuoFOdtd/wTSeLg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0000ea4-20c7-4097-e9f1-08da00dac037
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 08:07:55.6762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxtcC/kUVCTtPjad+mPOkhw6sdrGfI9CddHdU0enZbd22wMw5dSQpQ3vtn+fSBWB0pZkPBx6mfKG5dYNo4rWXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5757

On 07.03.2022 22:13, Bjoern Doebel wrote:
> @@ -159,7 +200,11 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
>   */
>  void noinline arch_livepatch_revert(const struct livepatch_func *func)
>  {
> -    memcpy(func->old_addr, func->opaque, livepatch_insn_len(func));
> +    struct x86_livepatch_meta *lp;

Repeating my comment here a 3rd time (sorry): const please (and
generally wherever possible).

Jan

> +    lp = (struct x86_livepatch_meta *)func->opaque;
> +
> +    memcpy(func->old_addr + lp->patch_offset, lp->instruction, livepatch_insn_len(func));
>  }
>  
>  /*


