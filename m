Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365A758EDE1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 16:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383672.618876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLmMQ-00072M-1b; Wed, 10 Aug 2022 14:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383672.618876; Wed, 10 Aug 2022 14:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLmMP-0006zv-Tl; Wed, 10 Aug 2022 14:07:01 +0000
Received: by outflank-mailman (input) for mailman id 383672;
 Wed, 10 Aug 2022 14:07:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vQbV=YO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLmMO-0006zp-KO
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 14:07:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80043.outbound.protection.outlook.com [40.107.8.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3060467-18b5-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 16:06:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6828.eurprd04.prod.outlook.com (2603:10a6:10:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 14:06:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 10 Aug 2022
 14:06:56 +0000
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
X-Inumbo-ID: b3060467-18b5-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVdBGHSmXDtk1pAE+Sxn0LuElK0YLMXD9q9FMGnGvEolJilWNiu/hsncWu8ie4ECUhPQK/l4wcHVQ2Spumt75OYt+9W/NsribCEarqX5lcd3i3A1ldP7gHCiba0JV/2loX+bvMrUIKSco9mx4iUvXFKpTo03r7X36mj0AtwRYFM89ajZrN9zrohpp23L6YNyd+Vy2IZRzomtOJODhpOlf+e+EhkBIf8pUpaRRDK2ET3SGfokHcu+4uSs/iPFX9BJ0+9zXb1bgocZaZh2e8lehN9IsHZhOJek/547omw9AlQQK+VvisMo1tsApfiXUzMdULrIgUkG+pV2CI2Ngh5EoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkCbFM/D2/rz8tgaTG4ZilBApXaCxtFpSGGlp/ns37M=;
 b=E6DHZmXQbsSbUiCjLp/rhMz2ZW/x4jLBrOpuSDakkwDq0cssI/4GjCfNkKYOcssQleDihDI74XA8uurquYNmCTv3I7nklTNFsM6iPL6mfl0x62zTxe7024E/oQdXLYCYJKVGrvM1v0BLTCYRJo1Q8g2oFB/craQiV+9dk/64nrtKCwMwhQXLEJC8jfrWOsF8vPqA/37/T2sK2bZPZ3KWM0imavmsy2LdgmjokOAVn2augPjTXSGmjf548QNJviRKg9IH1zBu7Lc7v4nZHXq86Y3BgvhFW4VWoIFgu6jCrC3l9Ab0naREzBuTg5dlzqwIN+R/Q5cMROcgP92yf0SBoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkCbFM/D2/rz8tgaTG4ZilBApXaCxtFpSGGlp/ns37M=;
 b=WtQj+C0h+Eyzw0E6FC1tiVdbYvg4lk+JkflWYxsc+ADCAkKDKZ7KB1IwH6fLeUoAkpum6eaKSBK03zBfBOsScVKDQcMSfPTjJwhUaushpscIDKm75nZvTZ8AhensF1N8BdXpt55zB3m+0NT6zahNMNBwBhWB6gopvcfV6Fzf0hUSFFsrZbNF4zUtwfrPEIncuMFDn1PpUPbzW5W/D0ntU2lRAa1pXGa1dekktYQaRNfh+/cRqcC97npvQVT4b1h9v1VWJjzHQ2n0RzAPsJE8CIX3metLeZMqIaryqX58Usy5sT/pPy8XNm7QswmPSBH/jfHY6DEjfSXOQ1bTrLpDOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74d0425a-a206-2bcb-50d6-e5bb4c5e2bf3@suse.com>
Date: Wed, 10 Aug 2022 16:06:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation
 again
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220810133655.18040-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220810133655.18040-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 482feaab-7298-4e60-fbf5-08da7ad995a5
X-MS-TrafficTypeDiagnostic: DB8PR04MB6828:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BL/nSVxBjxO2qNmi3t2fhJIePlWaRdbPigJYMEtftsLleQAONEvSqFp/9tSs3rTfbLtJlRepCSzw0BZ6XXZeuCqkQvQqwTG4vddgzSkai5/4XAxZ8kDXDLZNzxenUPanO0FumCmm9Y+y5R92Gy0k6aQauIB0kgFq/YsW5Mgu0GK1YYjTs1iJ4nplOV9HvYbiwd7sd+oZHA9rizT7K0/6v06LZxFKOoxcy8I3tNrL9aRofX8uu0JlwRNdE7ON8nR7WFKj7UkkFR5VFn3IMqWNvO9oRaVoP26MMYR/6C7miM1tALVy70Lw/VxCydmmuYvolND1LI0rYb8iOeEjpVGW+a1clEB1eKJX7zkKUQy9jSxIHVJoHLlFM0Lopb9YmfZBCSWknyUhJvmQF4w+Nwb5v54Z/IPBO26xiaYgdOTsuHci3oqKTZMQg3SQ0AADJq6k9unQx2ea5AjiC9kCi5XFYJOZ908t934712wdroRAeLZzcLcC4voQyr5ShJ9r4k08sMwV1ZvZxpgoppLzHIw3j/h9VsgekaYFCvEx8hSm+cB8Spx4WSqM5d+oclTRKsMESRvAWL4KGjOQvhZ+1vkZ81cmvDXX4HvlKocxbhHu/PRbBpbv71Ag8z5uzYYJiXJW7kBaVJV5Ohureooabt01YUHQKZhYAYkzFbQh/E5Bw2zVQWVgsq471XEpnk10bt/1cr1CtpOUApzLwXwa7RxwuY1PGz0CZvr3ZtV3T6yZ/jGAFr7W+WI6GnXAL/4QVro3PO1GnPjHS2xD85BhbD18TJE9hk+exFe/JIdI61bkgHfYdg6d4GuZQ597+HfoHiocAvzDgRk/TUomDjrasPjQXJ8Gax2NJanc6rcSpoReQvw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(136003)(39860400002)(376002)(478600001)(41300700001)(966005)(6486002)(36756003)(316002)(38100700002)(110136005)(54906003)(186003)(2616005)(66574015)(26005)(66556008)(6506007)(6512007)(53546011)(4326008)(8676002)(66946007)(66476007)(2906002)(31696002)(8936002)(31686004)(5660300002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFRMSERVYWljbnVKdjU4TmhkbmNwM04zVGt3eGJmRjVCRWNEY01TSlVEZ1Vr?=
 =?utf-8?B?WSt5S2hDRXVuUzhVcFFIeVN5ejdhM3N5N0ZmS3dRVmYvbDM5TU0rUjdXa1B3?=
 =?utf-8?B?VmdqTUxxQ2prQ1lKVkRvS3U5R0ljUlQ5anpxcVc3NVJ2MVhUamhJdEhwakFO?=
 =?utf-8?B?dEhURW1kaDA4VGJKTEZCVWVhMGhRL2IrS3V3TW5oR2MvSzFvNVVrdS9DZlBl?=
 =?utf-8?B?REgvTnV2cFNCS1QxbFFmaFR5WlJzOVF1QmRyYUxseHAwVURwU0ozZlVwUytR?=
 =?utf-8?B?bGFEZ1FoT0lRTzRCMnlhRWZvS3ZTb2t6aVlSOWYrUHR1Zjd3M0hzWURuVWQ0?=
 =?utf-8?B?MzZJY0FmWUE0eFdRSHVUN0k1dWN4eXRTYy9YN3NKOEpUQktYWWN3QXZRY1E3?=
 =?utf-8?B?NUJ1Y0NQTW8zcFBoT1NWZHgyY2x5SkVFb0F1T2pKZjhTSXdtVTN2UlRnc1l0?=
 =?utf-8?B?d1FKSVhYL0FDYWRyeHJ0TW9RdHFTSmFGdUtrZmJBa2kxZStwbUN4MU81bU93?=
 =?utf-8?B?QmFuUlBBM21GRHRvR29iaW0yV1lEUHBMbERDR3ZZSzY1ckhRclFoa2FGOWs2?=
 =?utf-8?B?VFhVbzNhMWhBN2g1bXF5ZkF2Z3hSMndZdmpZQS9LVVduRStGc05TUGhxM0xB?=
 =?utf-8?B?V3NzNGxxVUpMMlZEemhLV0FvSzNPZzlXaWMvTHAwY2U1TGhFME4rd0JVamx5?=
 =?utf-8?B?NmVuYis2THprdjVmREhEZG5YMTR0bHRWbEhRVjgyNFlsWHBNUFhjVEVFbXNX?=
 =?utf-8?B?S0owRHdJanFta3E3SnRsZC92NVdJN0tTS2hPelhocFdmNTBlTzg1S3VSWFp1?=
 =?utf-8?B?dHI4OVVjQUtwY0FUV0lSOW4weVFqQkxpMUpqRFc1VUordHQrR2pGdk52Y2Ux?=
 =?utf-8?B?UkkvOFJsOEtpV2tTNlNtcnNnOFowb21XV2hMQ2l4bGZUa2dPVmtLNG5LVmcz?=
 =?utf-8?B?L1Z0RysraGtqNTlCYmVxTzJra05kL2NTQ25sTnVuM0xRQnhaRjFhS0cva2d6?=
 =?utf-8?B?Y3ZSSmJteXc3dWxVc0RJN2ZZSlN1dW1BaHJLMVFGclFSbFNZUXliY3lGT3d1?=
 =?utf-8?B?UzZqUTJndExvaHZzZXo4TXNGaWJYbU1xbG9QNkpUdlN1OUp0RGVIZWE3NDF5?=
 =?utf-8?B?T2MrS2NFUWM2TU9zU0tybnNMUzIxZTBLekt4U3kra3dsVzMxUkUzZGZ6UVV4?=
 =?utf-8?B?a2xQRkEvNk9MQXhVVHpPVGRHaUNwVnpEQ0V1TnVZbzk5dVZDTWw2eTZzZTN4?=
 =?utf-8?B?U21sb21manR6NmpWSlNPdHY2SFhLL2V1T1dDOW1GK1d0RkpIR3ZJdFpRNXlP?=
 =?utf-8?B?OGUwNmpDc1RxZFJjU1NaWXpSWFdMcWJBQlh2QUtZSGxhUlhpQmpLUkNCVjBq?=
 =?utf-8?B?T2N0OHM3a3B4c1kxYkZ0enNnKzdJaW1oUEd2ZUg2NFZPWWhoVTc1Y3dPWGgx?=
 =?utf-8?B?em5UWFVhMC9aS0RqNXcwRURleGZSWXg1cEFQL0xhVEZQMmVEK0ZiQlR2cDA3?=
 =?utf-8?B?QmJDMmNud25TcytJOTN1RzJ5YkROVnIvVmZpODF4MjYyanF0TUtPL1RRUlJy?=
 =?utf-8?B?MGRZRXk3U2J1RXBBM1ErTVJjc3F0RGNVdmFNc2RDZDVpM243U1hCUmJPZWxY?=
 =?utf-8?B?bFBML0dVTnEzOU9GMEJISzljN1VoNFdTYlM0Y0haQzZuQzFrUSt4ZE8rY0xO?=
 =?utf-8?B?WDU0cTVIeUMyeFZHZFZvZDlrSnNHUkxaRzlsZjBhNjVFbUFNWEJMQUdRTVdz?=
 =?utf-8?B?T2ZLWFUyb0thTGVVSHdZT2FTWjk1SXdvUWRQblVEZWZCRnZGWXJVN0t6eERo?=
 =?utf-8?B?S01Ub3ZjZC9WVUpaU2F3eVVydFdJV3ZNMnYzOEhUUkQwTXpEQVljeHNmQ29y?=
 =?utf-8?B?UFBtV0JaaXFtbmlLYjY3a3F5R1dGYng2YWZWT0Fna2NOa1dDeFB2THcwRmhB?=
 =?utf-8?B?VzZoQjhkTEI5aVF3bXNmYkVCY1ZkT3doYm5NODNlam93SUxOUEJ1L28zSG8r?=
 =?utf-8?B?WlU2NWlSOHhwalZaSlNqaXBCWkdvY0drbnhDcUZkZkpsc2h4WGNWMlZ2d3F6?=
 =?utf-8?B?S0U3WW1nM1hHb1ZrRURPUGcvWFVPaHlzM0czTG5ZTEZpU05idVcrRGNMY1Nq?=
 =?utf-8?Q?yLkwse1ZxfRxIt9XA8qnHdIkj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482feaab-7298-4e60-fbf5-08da7ad995a5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 14:06:56.4927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+97pYB1Po1u14p5l+k7k3XWW+VloVh1CWXpumhrrP68C3MhoD+g3zUR+U1qZ9wgPyayNO4KYXAz6+M6oXjPng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6828

On 10.08.2022 15:36, Andrew Cooper wrote:
> From: Edwin Török <edvin.torok@citrix.com>
> 
> Following on from cset 9ce0a5e207f3 ("x86/hvm: Improve hvm_set_guest_pat()
> code generation"), and the discovery that Clang/LLVM makes some especially
> disastrous code generation for the loop at -O2
> 
>   https://github.com/llvm/llvm-project/issues/54644
> 
> Edvin decided to remove the loop entirely by fully vectorising it.  This is
> substantially more efficient than the loop, and rather harder for a typical
> compiler to mess up.
> 
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

The main downside being that changing the code to fit in a new PAT
type will now be harder. I wonder in particular whether with that
in mind it wouldn't be better to express the check not in terms of
relations, but in terms of set / clear bits ("bits 3-7 clear AND
(bit 2 set OR bit 1 clear)"). The code kind of does so already, but
the variable names don't reflect that (and would hence need to
change in such an event).

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -302,24 +302,43 @@ void hvm_get_guest_pat(struct vcpu *v, u64 *guest_pat)
>          *guest_pat = v->arch.hvm.pat_cr;
>  }
>  
> -int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
> +/*
> + * MSR_PAT takes 8 uniform fields, each of which must be a valid architectural
> + * memory type (0, 1, 4-7).  This is a fully vectorised form of the
> + * 8-iteration loop over bytes looking for PAT_TYPE_* constants.

While grep-ing for PAT_TYPE_ will hit this line, I think we want
every individual type to also be found here when grep-ing for one.
The actual values aren't going to change, but perhaps the beast
way to do so would still be by way of BUILD_BUG_ON()s.

> + */
> +static bool pat_valid(uint64_t val)
>  {
> -    unsigned int i;
> -    uint64_t tmp;
> +    /* Yields a non-zero value in any lane which had value greater than 7. */
> +    uint64_t any_gt_7   =  val & 0xf8f8f8f8f8f8f8f8;

This and the other constant want to gain UL suffixes. (While I'm
open to be convinced otherwise on the earlier two points, this one
I'm going to insist on. Yet in case it would end up being the only
change in need of making, it could of course be done while
committing.)

Jan

