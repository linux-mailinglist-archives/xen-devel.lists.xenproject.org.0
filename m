Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803837F9B49
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 09:07:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641668.1000421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7WdZ-0000GL-BN; Mon, 27 Nov 2023 08:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641668.1000421; Mon, 27 Nov 2023 08:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7WdZ-0000DQ-8H; Mon, 27 Nov 2023 08:06:37 +0000
Received: by outflank-mailman (input) for mailman id 641668;
 Mon, 27 Nov 2023 08:06:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7WdY-0000DK-A1
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 08:06:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e153479c-8cfb-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 09:06:34 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9326.eurprd04.prod.outlook.com (2603:10a6:102:2b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 08:06:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 08:06:31 +0000
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
X-Inumbo-ID: e153479c-8cfb-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5V79ty/+n4pMtQaCYCVwxIL3VOUEefkHWnkrKKoYxWiXYlrRjLMik8pkGdJm+H7snzMQYRENOgN1fPgGJVZM4c/CHhf+ulb73wNR9ZZqkm+a+lj8rJBRjQDs57JQEs1+i+5lbAwEdxNUMvUpnvC+D2PVmqD74w5ADLi1ZDfGXWvEHwlidPBc6tNrNLas4cHwv45r7qB//bmpl/wSRgHpr9R/XWP1/BuDc8fwD3UhRzn7QM+Rcyrlg/7AvSXsn8bfCZnOtS47g57qiRiecT8uuDirCdxSC09E+8hb/W+zYq2kz0dOx9h+JexcdWnAPDqvhYq0Jxm+GkmD+nlHG7XSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnudBNUQPXqLbnfK4VvMuRihG8KZVtkDTYuZCYL1czI=;
 b=eVKRIMbmPjiiT5SDQxfuqD5+7UF3xkM4n5IuluQw675fjM2NDY5g79YLdY2JnvkuiEooue3+pEbLBs6rHBTDEV+2aS18wQnlFRzPn65d2qVj/32g2FqqbbwWshNWoW7bf0EeObmzNeFssL2a+dlfuV7f7IMd84reC8rWL194g+Ea6XYCCOxLSFwnFDo9uPOimlWt/4Hoqnty80qRmEHJdz3bSZHorX2qR0Gx1XzJlyVzbyTa9kJIQf6KcVk3+i5AgbtPfx3rThAXmhcAJnq82Hn80DTAfTJaYzrT31pKV+wU8egEIy4cKLLgcWlU2tSt7/fCiG56poPXlP0prcWV8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnudBNUQPXqLbnfK4VvMuRihG8KZVtkDTYuZCYL1czI=;
 b=vmgPOgiQdeXogjyVNEZ206kNmPHEduvi3Qf6ZZHok9fUTPopUgZ1IMnbn6aLdS6c/fhSsjssMSx2s6bVlcZUJgNpXRSBasbvq45oNibRfYSNiMpogE4KjYvDpZIsQc/tAZ1/AbGV8GFqE834Q1bHf5Ff3LepJlIHp1ZCxEsHxGc4O8FyBnYiu4ssG2+sjkeAN3hwlZUm6EFfnSgRPJkeL06O4uR/vAJyHO2VMUGpookrU+4hW2dk9RdEOh6JAZrgHV2K0kXO98Fs2IRxdcp9UkChXJ+lI4E6HmDi17OAl6S9VclUXNN53+iru3dhqbTSA4D3SZNn/KlvmCx80mS/VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4ce98c9-cb13-4c2a-aa4f-7cbbf7ca68b0@suse.com>
Date: Mon, 27 Nov 2023 09:06:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] x86: amend cpu_has_xen_[ibt,shstk}
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b63b648f-02d0-4e52-a5e5-94ffd5666a14@suse.com>
 <8f9c3db0-bedb-4b8d-9560-3e5526288b5f@suse.com>
 <2dad26f0-e73c-4d92-9060-fd3771f3f53f@citrix.com>
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
In-Reply-To: <2dad26f0-e73c-4d92-9060-fd3771f3f53f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c56b4a-4824-40f5-73ef-08dbef1fc419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/jYXMHzGj+mhR0MOLnQ2lQL/fRNM0bNgune2mmGS785VAlcJrmPZtOcme61pXUZOrTKvDSjpaL7AJjm7j9KSfi6mIuQOdaOiLznKVHjnGAGFTckBob3WWPtmsmdVTBy1Qrkw+W+fPkvDGc/gfuwOCWk6Fdvm5te//jWId6iWMkIr6t/jTHAhLGZUBDxmrl+6ZQddHHUEFAN3avCrfmqSY2Z8zOaXuizBmEZtpvtAplRiggWyylFg3LXrQguaFf2TdGYIJuHgA0Zd+3bkETySMUhm57xNnnvsoLe4TxReGiNySiei1zuFoLl4pbpwa4+wWmWJpEusPOjKxC1x32aI8wlr8mMbJ0W0h00wnbc1hl7XfqgrL6/2+sutRO2ksPtjnQ1eUUmcSgntgQwaAE5DWObqNXajbeG43d2CrYvwsFE6becjPSfkzP3yEtO8NqKhVgTaxZOlR2bBo8+o8U8LNOPfgh9xVvudzEpoPtb1K+UVArcf/CFxBCNKn7LhnmM3Rmip//crdMYV/M8o+mMxAy18Yb7RLkwP4S6iOMOEteFwdiwaBpe9xTd4JPEsMn2aMmWoP2pBjKvd0MU/mlwIbqDIFRNghfcnE6YuKnKthtN+wJG+nrENlAztV4sBdV3JS47bvUpAc4BuhaQ3VXhpHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(83380400001)(38100700002)(31686004)(4326008)(8936002)(8676002)(6512007)(6506007)(53546011)(316002)(66476007)(6916009)(54906003)(66556008)(31696002)(66946007)(5660300002)(86362001)(6486002)(478600001)(4744005)(2906002)(41300700001)(36756003)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW1LZ2NIcTMreVM4VE55dDMySWV0dno4Mk5uSDArb3pDUkhBSHNJUU56Q0Y5?=
 =?utf-8?B?UEhGenNmdW02UDRrWTJUZXl3S25zOUt6eXJGUElOZ04xUGw1eTBxSDU0UEph?=
 =?utf-8?B?MGxpTUFKdHZOZVhUZ2hVN2phU1lGNDJ6S1Vrc2ZtTEFLWWNDQ0RGVC9Pd3Jw?=
 =?utf-8?B?WUpkWUc3Nk80WHVZbTM1MUh2eVNWeVZTZVpmUUFKeCtaMFM0UzVNOEp3NTFC?=
 =?utf-8?B?bEdEeWJwdnhXMzJPMmo4N2xOYlBXQnE5V2UvNEoyRFkwRjUxczhZcjN3S29y?=
 =?utf-8?B?U0VCVW5QRlhjNndHLzlCZkpycFRhanNWL004SXQvcTZZQWFUaCtyMlE3dURK?=
 =?utf-8?B?UHJpVWJkN1RYbllLTThhOSsvYTBteERLSFd4aSt3TWx6TE5qcllYNXdiZEF5?=
 =?utf-8?B?OWZQTG9CcmFSOUlTNkcxeEoxUEpsdHBhMys4ZjYvbHVkV2wwZEMyWGFNaU1o?=
 =?utf-8?B?cUR1aGVmZFN0bzRiaVNiSjNTcmsyYit4N2ZZenNSdmFwZFJKWDdTWStqL1Nt?=
 =?utf-8?B?aUUwd09iN0xvTHdsUWZWUGt5TzZ1VGZQYzJQZC93b29sSXdkS21HNWJVSHRh?=
 =?utf-8?B?d3AwaVVFNHREK29ucHFqZCttRkdad2Rya2ZsbnIrb1htYkl6M2tDMFdJRHBJ?=
 =?utf-8?B?eXQwWVM0RWg3SWpoeFYrcExZZ2l6ekVwc2xOczdSNFRLMFQ5T2ZBL25QeVkw?=
 =?utf-8?B?TFlSVW1XQUJnb0Z6NkU5VFRHZ0hGZTNxTlVUZ1NXS045ZWIyWDV0Yll4ckJ1?=
 =?utf-8?B?RjFnTkxhVDRCSkQwcm9WUks3RUhZVStCTXJyaWtRU3FXOVhXa2ZobVVldW1Y?=
 =?utf-8?B?MHlxaTMxRXpiaFRqa0VvR1hUeGp2eVJCRmNUV3huajNqbitSOGtOT1ZBR0pw?=
 =?utf-8?B?OHdodi9SbmtiS2NGQW9mRDdObyt1TGYzNFRxcTB3ODRBR2ppc3VFN3Q3ZXA0?=
 =?utf-8?B?eGJFV3BIdEZmUC9FdXpjSVNNVmpKRnNxSHgwdXRDNnBWdmUyODBYcmR1ODVV?=
 =?utf-8?B?NjVkUm5jc3Z2L0cvSHVpYU9lVjVqdEZKeTA5aXlyZlRZYjM0UWdTMkEwUFFa?=
 =?utf-8?B?RDRGTzBkWmMrRElSU1U0ZTh0d1JLNVBGVkdJem1xQzcyOTdtbGVuQ2gzRmxJ?=
 =?utf-8?B?Y0JZeEVVZWQrMVV6dlQ4ZXVmcW9xLzhTeWx5YlBoM0w0Slg3VU0wakM0UXZ5?=
 =?utf-8?B?Q1VzTW9YQ29VVlZoVUVoQWI2Z3VvbjJFYm84d3FwL3B5K280SHdZN1I3b3g1?=
 =?utf-8?B?Q3NTZVR6RlI5QzYvMWhFMHJIWjV3anRpWVBiSTNjdGtZWEtmOVRSb05uRGZ1?=
 =?utf-8?B?dUNVZWZZb21JVFQ5WmtHREpsZGRoam9JWVFyK2lMRVl2OFRMVG9oZjdFQitZ?=
 =?utf-8?B?L1JnREY2NmFoMTBBcTdadHo2Q0wvdWRIRWozWm9jdENqYmYxNWw3UkFWd3lO?=
 =?utf-8?B?ZEI5RnovU0tYdytFb1Z5d0VSMm95Q25WZVZOaUM3cDBjOWoyY2RaRkQ4bVBw?=
 =?utf-8?B?Rk0rMGJRa1dEUEFDR1QxMWUrcDNFMFU5Wm5IUVB6Ym5DSlJ6N1hWb1RaT0dM?=
 =?utf-8?B?Vkp2a2ZRUWJ5d3F2em9aZU5obU8xYzZBcnlsNmlyTXRQUUFOTHJjZm04K28w?=
 =?utf-8?B?UlAxSWRCbDlKekUzdDFkOXdjK3ZHaEsxQTd2NUZIZE1JbFQ2RWh2VXJUMTdh?=
 =?utf-8?B?c3JITktIOCtWc09RVFNQeEZ3MHg5S2JwV1U3bjUzL05DeW5UdWE5TEVpU2hm?=
 =?utf-8?B?dWx4RzU3NUFML0tJZ0crYzNOZ2ZBVmppUTZmaFNuSm50bWhCeTY4VmxMbzQ2?=
 =?utf-8?B?VFNqMmg2NlJ2ckJZVG1xdmtWSHhaT1BpM2lPSG45ZHhGUTNveTdVdTlxYzZ4?=
 =?utf-8?B?RE9GbmVGYTFjMVNvRmNZMVNNS0dkTVdwZVZiUHdPNXB5bzVHZWh3UWF1c01W?=
 =?utf-8?B?TEZNMjJEMmRiQXdGeTgzUXBoYVovVkhMOGdONTNBeGhOWjhNM0pjRHpsSlJw?=
 =?utf-8?B?S2ZCaXk2VHlNbGtLbFIzUkFkSkpVa0tuZU42cXAzMnp5aHN1NTVCR1FORVgy?=
 =?utf-8?B?U2MzTHFoL3ZCTXFXOXdwdlBta3B5bkM1Y3pMSmdYZURtbStvdkxHSVNQemdZ?=
 =?utf-8?Q?qAfxFMxsJeStNQ4BvzKKqjTu6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c56b4a-4824-40f5-73ef-08dbef1fc419
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 08:06:31.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZjc+LG4OveyvAyttCtVxENAKYhlp0p95kGGa0y1rleJZZy/DCHoG3dfXkT5sGSP5ImeFdNkZkDBwfwXJzoQtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9326

On 24.11.2023 14:52, Andrew Cooper wrote:
> In the subject, [ -> {
> 
> ?

Right, noticed (sadly) just after sending, and already corrected locally.

> On 24/11/2023 8:38 am, Jan Beulich wrote:
>> ... to evaluate to false at compile-time when the respective Kconfig
>> control is off, thus allowing the compiler to eliminate then-dead code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

