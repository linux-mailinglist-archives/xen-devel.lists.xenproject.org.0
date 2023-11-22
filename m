Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8277F42D9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:53:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638593.995329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5juf-0003sb-OX; Wed, 22 Nov 2023 09:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638593.995329; Wed, 22 Nov 2023 09:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5juf-0003qG-Kb; Wed, 22 Nov 2023 09:52:53 +0000
Received: by outflank-mailman (input) for mailman id 638593;
 Wed, 22 Nov 2023 09:52:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5jud-0003pm-TL
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:52:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5de0bbc-891c-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 10:52:50 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8258.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 09:52:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 09:52:47 +0000
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
X-Inumbo-ID: e5de0bbc-891c-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzC35nUyp0S0KJ3S1dZqHH62H1yEUXhILMBFOc8KAtKDiNtZapzWLX5unSFnFffhTYffHuWsJdEFoERTXVitFeyJlIPWO82nkxLVdtvkg8MsrJJT50uZETZEA5gQpmmFsGhvCde0q0B5SjAPHgW3p0eejypLa2cIRialx+eNIQynegMbZIgTfT4JdA35YJUVOY1n374PkwaTeKbG94daY2l9n7VdfWFpb659W0ZAY1h/REWDWmOb++VbesmwmtYcM6mZOrN90IsCVPo0ceF/vKB1WsFLVWhEkJ8X/jAZOQ+lx9J3rmFfa2rvDrGwHs0osSZDGoDfqmXALselmQ4/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQ2GRyzhXOwDdQcA+nptB/p5R2IM2RPXxBusJnJs3Uw=;
 b=assm1+ZvmvYv+LHLMhcSExOKHM3AyUD2jHvclLPJ4m4dA9kOg1dIMXyfZwXdvOj6H9bURbR2oEi7lOKg2a5KUOlS/0JwB2csLoupicFX1HI9r/9XSnAsw6BhTLOQ3st9DadG4GBryFA1J2a2fk6ZqrEsHV9i9LM3xZZLsjBX65IBlhajBZy6IWsOacTiYqXi1QZTelScJYIpNcl6+SzlO+86Hv9mU2s2YIXCD8DEj0JSZ0x1Hfr5XP0XjyM4MSXkS2BTxdwihneJBilnsAn2n2T7k7JCv3xZo7Ce86Eitv94CmFzMdbZGl+xDM50VWOryADD6aIGXS7VVwdaRrHC+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ2GRyzhXOwDdQcA+nptB/p5R2IM2RPXxBusJnJs3Uw=;
 b=yP7O8m/jOu3/m/LMSNd2lXqcg9PsqBFkwM5tbaMlECRW+zezu7mPwGSHiEcNStN0t4aCrxCnioBykCmli9EO/rIMppTpyLCRBleFZh74pKwzh8jsc1xhX/Rk31SHDI0UzdyEj2KSd7uz8/7QLzfG/go14kMGdauzq08ubnzR0W2++QJRZrJ4kuw5QzLMGvvZO+q038vBHOKqofurtmVjCHuKUg3Sv7UL5VlYmLdRveU0vP2zITOwsUxAVTnj1glycPJvIuafBBQpYzW1MJcZMgdSQX7zcWZi8Ho0whBST0CtoPjWOxG/C+lKAxdoVpcZQilIfXtIXG1Zt7Z0u7hICQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9aa3b92-6250-4bae-8770-5afb63a17a39@suse.com>
Date: Wed, 22 Nov 2023 10:52:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/HVM: split restore state checking from state
 loading
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
 <822a6328-36d3-43e9-9fc4-36d01a6b9ef2@suse.com>
 <62939263-5492-491b-8077-984ab3707800@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <62939263-5492-491b-8077-984ab3707800@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 64527a7e-22c4-4a49-8365-08dbeb40c890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wtZ10BLedPIgPoZhewNyVAQW5gc8H9QpDuLt/dSeo6A40jCX7ohEuOZEquKL1HKUZ4YCD91NVB/VSieY59KaHX3yDr0FYpSjyLNVFBdVQaxoKuzn1F9e+4LnqdujsmAzXB5ANVKTlRePs+OjlaGAYuAjDmi35nUqkcZOYoS8io0T7EjxVD7GDelb7iJJYL5GYUaYNVUSLIoZh2UbshEKnq3gEG3lqLRklD0iHJ3N0IMeYBZNKLi+c03CseGAuWI5z9q9XiZA9MmyQ3zxo4th1uY9URCPL6nz7+g6wwNyVvR4yDdJskmPglHL6sWaQkYBW1C6fKNrVQr3OVyFiyok3DfTX6RM3LCOKO9W5xNH5zXGsLWtOOXmmoOYurlDpSZQfRFJ1UHDn60veiqhQEPM5d6/WtuzmEcvhqMtx+YqcBiKQhT1uK4e4/wRWNunoRlkrMydSieidydZGitNVgH0daOWsWAhIq9PxLIAWMdynO51FV0Fl818EComO9gz1p2Q9YBa0vgXWuX0Pq530PyYqQCCaRE4mkkJrMug/sJHQMGiDIts5HGjaLa+KLsUzfor+Dz4+v5synvXzCL9hTqjDQWsHWXJB/m2DPTEvTHO/3/1eL4MOr40mTFMv2nQCji1v8ZorN9FFRQ5DGAxdRa2bA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(376002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(31686004)(2616005)(54906003)(2906002)(31696002)(86362001)(5660300002)(41300700001)(36756003)(38100700002)(4326008)(8936002)(8676002)(316002)(83380400001)(478600001)(6512007)(26005)(6916009)(66556008)(66476007)(66946007)(6506007)(6486002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVdLSjMweU5yTlh5elpNSldwQ3N4WWswWEdBdG1hRklDV0llc2dzWkFCK3Jv?=
 =?utf-8?B?WFdSWENMaUxqMjZCMzVvNFFXWld4TnQ4VEtNY2xjS0pEN0U3d1dGMG9EL1Ez?=
 =?utf-8?B?VFM0OTVwV1BocXRXR0dPdStsUDBXR1gwSG9lL1A2Y2lQUUcwNnpQVk43bmVl?=
 =?utf-8?B?YWNYcWtIYll2MWVnT1ZLK2tsNnNYbmYxL2FuZlVyUkRpeWdVMnJlTzRtUDhz?=
 =?utf-8?B?aS8wUjBTaEgzSGFGeklCSlpSYnNFT0t2UCs2N0VaK3B4N0Q1NjNiWDJqSk1i?=
 =?utf-8?B?Ym5MaWJrcWdTcndJVnE1T1YxK0wyeDc5bkJwVytxK094WWcyOWc2RnVUZEsz?=
 =?utf-8?B?OXc1Y2U4Z0U0bnNoMnh1MzRtQVdFSjduemV2MW10M0NSSjZ3RDEwaUNiYkF6?=
 =?utf-8?B?VlpIMFV5dDgzVGdWSUFYcUpIUVA5VCtBeWxTM0U0UXdKWDNuSVZjMmVVcWtq?=
 =?utf-8?B?VG0yOXdVNUswb0k2azVydmNFNWtUTmFYTXlNeVJ4a2RhajErSDhDeVc5dFRD?=
 =?utf-8?B?YzUxNDdmNUxKOWtHcGQ2Tm5BOElSTWVKMURaN0NPRjYxVUs4SkVhUlpDMHZj?=
 =?utf-8?B?Q0tERzZIeHNKYUZmb3FzeW1jZExrcStHM1F4ck91NU9weXR1R3lhYU9Tcnlu?=
 =?utf-8?B?U250aytlTXJUcFFWcGtlYys0MU9NUzJNVUhPV2lPcDJLUzVtQzlIdHhNZy9R?=
 =?utf-8?B?MHczQTgzNFdWR2JKbExTOCt4VGlla1VmZ1dtOWtxRnhuaENWcmFWOFROdWEx?=
 =?utf-8?B?MlZ5SlhRamQzSjIxOVgrV0VablJ4a1d0YWhwdlAra2ZJWC9pMTVqQk9oYnhZ?=
 =?utf-8?B?cXg3bncvdnJ4eE0vdWRyM2VQUFlJYmxXZkIvTjBtS09Sb3NHQ01JcFBrS3Jw?=
 =?utf-8?B?WHduZVBWUjdjRW10U2xJSVRUTFN2OG0zUDkzeXBFaFpjMzJNQTFQMmdFVlhq?=
 =?utf-8?B?YjBBaHd2L3V3aXRDSzFiRE4rTFFCUE5MWGJURUI1OHNkWnVIOVBqOXJHOTA2?=
 =?utf-8?B?NWE4a1MvUytUME9IZzBONjB2WXJ1Wm1CSFpvZC82alVhV1h3MUhpOWwycEVx?=
 =?utf-8?B?d2FxeFplZEo4am92K1dpczVkUURRK0Y5dEdTTmxDblAxRDg0UlVPa2JmdG8w?=
 =?utf-8?B?Z3ZVQ2MwOGw2cEs5bkdVYWVqR1d1SmRqNWlUZHZVS0J3UlZDbzFZSHZsR25n?=
 =?utf-8?B?TklCSWFDTmV5NkFRZ0x4UThnVWg3ZkxleDVJYmEvS09uRWhubVI3TlgxVE5R?=
 =?utf-8?B?QjJrVldpSHRMVWszZkx4NXA1cnNMVjBaQjZ5bFVZYzhTV29DUzBhVkN3dUgv?=
 =?utf-8?B?S2FSN01qUnVqZW56Zk5ZQ0ZnUkNPOTVwRmt2SlkyRU1PQlh0UmE2aUZFQWo0?=
 =?utf-8?B?aUk0aVVJQVBUYTFKbHlVa0d2aVQvMDhKTi9WRUlPZ3ZpTTN6OVNvT1ZOS3lv?=
 =?utf-8?B?YTVsSk8vTkc3N04rci9oTlI3cGQzUGVTTXFPRkMvakZKc3FFbE9sMk5vRHZi?=
 =?utf-8?B?WWhFWGpPRTEraEVvM3NDRDd3dmtJUnVXY3FjWElzTnZ6WGtiZ1dxTkliOGZY?=
 =?utf-8?B?VklkTmsxd0pwN20zOGhtTXIyRnlIcVZieEp3VHp4RytoNmZkT3p2Nm0zMkZU?=
 =?utf-8?B?cWtKSFVia3R1THBaV2hnaW9iUnYzOWwvRmMrZVY1ZzVYdFkzY0NuM3VHbU1v?=
 =?utf-8?B?RDV0YnlQTmpoZU8vZWV6ZDFlcjRaUUU5bFdMM21VRFA1OU5ERFF2aU81bmpN?=
 =?utf-8?B?N1Q0ZEw1RUVJd05KSTZkRUdvTytXZUNzYk0xdnZuL3lkaXJKb1Y4bTlBSUhV?=
 =?utf-8?B?SEhKU2FpQWxqdmgrY00vUnpvREw0Qk9STGxNOEx6QzloTVNQelpDekQrMXZy?=
 =?utf-8?B?QkJpLyt1UFFBYW50MTYrbE9LR2c1QTk0RE1meE90cUhWOUZjQmZyZk9JVEhC?=
 =?utf-8?B?YkRpRDh5aHBDeEZPaExESEkwNkQ2NkducStNZU5OeHZ2VW1pUHVEbmFMZlgv?=
 =?utf-8?B?ZjRPZHpxcFhKWmNiWEUrMmR1UWVtNkZTUUVwYWtaYXN3bi85VTVkYnZLSDV6?=
 =?utf-8?B?T1FpeGNPRUFiUitLK0M0REpzR1RnZ3RsWWpEd1UxbnhJMXJ0d2VicVRzN0lm?=
 =?utf-8?Q?oOUiltDlHPMLvk0LdGjLvk/0d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64527a7e-22c4-4a49-8365-08dbeb40c890
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 09:52:47.9485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlfE4+JNq9ZsP/j+Vh880ZCgK9gLuFgzCyA1fuXND4wuq3FG71U/rm6PijFD/krIhAQFwrZAB506em+jBlcGTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8258

On 21.11.2023 23:08, Andrew Cooper wrote:
> On 16/11/2023 1:46 pm, Jan Beulich wrote:
>> ..., at least as reasonably feasible without making a check hook
>> mandatory (in particular strict vs relaxed/zero-extend length checking
>> can't be done early this way).
>>
>> Note that only one of the two uses of hvm_load() is accompanied with
>> hvm_check(). The other directly consumes hvm_save() output, which ought
>> to be well-formed. This means that while input data related checks don't
>> need repeating in the "load" function when already done by the "check"
>> one (albeit assertions to this effect may be desirable), domain state
>> related checks (e.g. has_xyz(d)) will be required in both places.
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Do we really need all the copying involved in use of _hvm_read_entry()
>> (backing hvm_load_entry()? Zero-extending loads are likely easier to
>> handle that way, but for strict loads all we gain is a reduced risk of
>> unaligned accesses (compared to simply pointing into h->data[]).
> 
> Pointless copying is best avoided, but it would mean that we either need
> to enforce proper alignment within the buffer (hard, but at least it's
> page aligned to start with), or __pack all of the structures so they get
> an alignment of 1.

Ugly, when they're part of the public interface.

> Not that I expect things to break in practice, but UB is UB and in some
> copious free time it might be nice to re-activate the unaligned checking
> in UBSAN on x86.

The C99 standard only ever mentions "alignment appropriate for its type".
I didn't even find any explicit mentioning of UB there. My understanding
is that it's all down to the psABI. That, in turn, allows for unaligned
accesses: "Misaligned data accesses are slower than aligned accesses but
otherwise behave identically. The only exceptions are ..."

>> --- a/xen/arch/x86/hvm/save.c
>> +++ b/xen/arch/x86/hvm/save.c
>> @@ -291,9 +369,8 @@ int hvm_load(struct domain *d, hvm_domai
>>      if ( !hdr )
>>          return -ENODATA;
>>  
>> -    rc = arch_hvm_load(d, hdr);
>> -    if ( rc )
>> -        return rc;
>> +    ASSERT(!arch_hvm_check(d, hdr));
> 
> You're normally the proponent of not having side effects in ASSERT()s
> like this.

The function could be marked pure, if it didn't log a message. I don't
consider this logging a true side effect here. And I truly want the
function call eliminated in release builds (i.e. I wouldn't want this
to become "if() ASSERT_UNREACHABLE();").

> But our caller did this anyway, so why re-assert it here?

One of the callers did, the other (hvm_copy_context_and_params()) didn't
but still ought to meet the assumption.

Jan

