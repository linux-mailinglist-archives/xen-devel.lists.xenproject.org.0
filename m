Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1816A667150
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 12:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476061.738036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFw8w-0007yT-4B; Thu, 12 Jan 2023 11:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476061.738036; Thu, 12 Jan 2023 11:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFw8w-0007vd-0x; Thu, 12 Jan 2023 11:53:14 +0000
Received: by outflank-mailman (input) for mailman id 476061;
 Thu, 12 Jan 2023 11:53:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFw8t-0007vX-Ob
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 11:53:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2089.outbound.protection.outlook.com [40.107.8.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aee1dec5-926f-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 12:53:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7440.eurprd04.prod.outlook.com (2603:10a6:800:1b2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 11:53:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 11:53:06 +0000
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
X-Inumbo-ID: aee1dec5-926f-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deUE0beiV6s4dBqSeL21H81a7whbJOZEWoq8W+HMOyhcq+8P9MUrGxebEfYrlHibPjCk83Flv5ZukozzSIUbsdHPbqebdcDiBj3qbXpAdSNrq9LbxB+KT3pLaEMToj3aTpJkFyCekcCZuxJvbzo4hV2dkFxz4aB0W9svF45HIH0RcvRWhRKbT8fO0iqdWU0UFEbjgaLXKw509ORdAaH68aXHdw3iE+xri4uHz+YJ1FXW5ZiQetXRjm3XQm1+13SSPGnAyBrRbRPRef0DPK3ZT3C+j0KcwLzf09OZuU6HOL7sVaEq/sS0j7M2/nr0VLwmKCsg23Lb8QTjyiSDcTTlBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjdNKbn2xVptyjw2QC5CMi6NcNrZEWVWFKNRxHh4GR4=;
 b=QD7hAIlN2hp7ks+QVIERPtjRfhHAl9xP5aoVzYUFv+KG53jSaLIf+5/QeCb+eq+146YGtxZRZ4UZxiMhZ84X4fn9Fo+IeaiHJd65ahj4M+CvjKksRcLs4cza7QnmqDbjFWCxjpiwC2OoCEzS7RagdTDHJeHAa4ZampCEovgxwzZNxq8YUWnH3FlJr2Okbnm1N4SaANtYZaogb4B5z69x6442v3I33v78Fn7iNI0rKEOgvoB22rhfQVBgiqL1TGcF4ZDP/+qx1zBi4JV1r0rPHfx1tRXIBARbSfSjuKIedsEsSLwOapr36AOxABp9BqhU4yq0BdWT0NQ9R1IlMga8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjdNKbn2xVptyjw2QC5CMi6NcNrZEWVWFKNRxHh4GR4=;
 b=MlVoGdGTKA+4Sep7XLk/lbmJnRhxQsfr4brPbO7st4vejpfOOCi4D9b01k04rTHG4krmjXMaN8O+uNHynZTppSKHNCeiUbNDCyP8hQ/bJrGmnPCA9r+WfKGrFxzewwH23s/wb6/RILIfHzkmU2+OGoHF5bo6xGuxMxh0gmZ502Bg43BHLlAneBPnAz0qE+mbOHrHTp6tY+MBw1yGWQYNKM0qFoKskLN1L0nnjmPQmfTbbfQ1JU4Dv/5tVJaZJ+s88NI9kKASFbWs8tcZKcpKTqGxK83iyMVUK8B05+Ixd+ftGRM+XCOXXbjDHG8/o4BO+jew+uWNl1Nl/jRGzsRZIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa7e38e2-2a44-6792-ea81-472a4d2b2100@suse.com>
Date: Thu, 12 Jan 2023 12:53:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 5/7] x86/iommu: the code addressing CVE-2011-1898 is VT-d
 specific
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-6-burzalodowa@gmail.com>
 <5a78ab9f-ce3a-a4f5-9768-725bd9f8a745@citrix.com>
 <13b1c5a5-35c3-a413-3458-ce39c7799a10@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <13b1c5a5-35c3-a413-3458-ce39c7799a10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: cde16e8b-caa7-4064-9d4b-08daf4939182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8NQtk6IyJZg3oh27fFPagSRJ8MIJU3NRAK2fqbJNtpyLt4PpCuooXD63b7dyDFEChI9AIMIY/ui3cotdlF5Ppnrlflvg7rJhYMbuosN/Yedh5JyQIDrlDSnyfUZgy0qaFZUucKyLQKwVCFxndGPxlwZDE0461UL+bvayvsJ2CphVImZDEx5ZeMh0NxkKuF90OHheL72gXZRWIw7iU0VBK3NV69awrFeMv7ppHomLyBNyGUphO7BqTT4BXt3Cddly9G6L6lmCtNfC/zrKsDeUG5/fKfW9eWWzSkW9ShqqDgZWoTYs9tjgSzlO/QczRfSFSSOX5GuhTMU/2FMrvWq1JcpKpOmRLXwcbwVMQI9BlWF0s0D+JX7ZHFcCXd6Ir8+2Vh2QIooiwgHtjRqFuUS8+F4mFHhDTBPdVWBy5mREeKYyikGRPEfPguay7oJT7k8CHfQeNvnlAB93idOs582QNxcT9GWytmROZhcoU/EAqzs3lmfTIABSbaj1nh8eXaEHAa+vQZVx8c124L9tFcA4Shcmepr2ouiF0vcdGvC94A25lFeGAuJgpnOriIg5CTmf8xVnYsmunmFldbPPMPpvefpe3CuDaxJ3EMRTFaSPXMzkan+rKm5i/8qpBY6mZ+z7/Ahin4wQBlQR+IE3n4FwnULYFmdv20I3xPuTuwNGgIBriEjjIfbk2ZwKR/d/OLFeq1naT3U3EQJ+EU640chubO4WVIV96QdJadkRpG9zNUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199015)(26005)(186003)(36756003)(8936002)(53546011)(6512007)(31686004)(2616005)(6486002)(6506007)(478600001)(66946007)(66556008)(5660300002)(66476007)(316002)(4326008)(31696002)(41300700001)(38100700002)(110136005)(54906003)(86362001)(8676002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzNTaGxSQnRLbmtwcEw5YUJjYXlUUllzRE10V3dLNGlubTZ3NFRreUhyZmho?=
 =?utf-8?B?RStKSHFlc3hkMDVkazZlc1F6QnRPYWJKZzczcU1IOFMyeXloNFF0VXM2S0Vi?=
 =?utf-8?B?WTk3Z09CWXc4alJNcDZqMlJtczFzb1dNc3c5ZlkwMWdWRmF6YnprWDNsRlJF?=
 =?utf-8?B?NTFBeGZCeDl0QVBOcnZUMUZwL1dLZEFTWm9NOHI4TURnYTRBOTM4bHYwSkta?=
 =?utf-8?B?RmpKWVQxcTd6WkJxengyMTRmYyswRG1EVXZQVjFuTUdnZ3lpMk5SRWlBdVJW?=
 =?utf-8?B?b0dMK1NLTjVBQkNrcUFISGoxSW5JRS9QTFZWYWJBSmdMalM2Q20yVUlUeHRD?=
 =?utf-8?B?TXdsZ25HUHIzTTNCVHFHYS9VVUxPQit3WTdmekVobUxtTy9MaCs5ckFFTDN0?=
 =?utf-8?B?M3hOMkVSQVdodm5uWk5Vdmw1V3ZGQVB2T2lnczdoL0pTQUtoaG10VGxHS3VX?=
 =?utf-8?B?eXhjUGlUcUZMamlRU0pGaXdIVFYwNHA0NWl6NlVHRm9Xc0Z5UEhoN3R2WjYw?=
 =?utf-8?B?TmJjK1JmeDJnTnJmbGRhb2lTRTVnUnRHNDc0U1JhVU5nZG9jUFVTM0FHSmgz?=
 =?utf-8?B?TzIvcjd3U3lFRUs0YmhQTWxmYnVQZ0V2VzhxVk90dmFTSDZDOEd5NzVacjdG?=
 =?utf-8?B?S1RoZWQrSXRDcHVhdXYzZFIxRmdqRzQzYkhSclVlV2MzZlhjZ1ZFaEdSK045?=
 =?utf-8?B?bW9qZ1E2Q1c1VFh1eWlFUnhqS1Q1aWtBcEVBWWlaZExmb3p5cnBhNHAxeW9i?=
 =?utf-8?B?aTQ3R2ZPejBnK0lrVVdmV3FQTjZKZ2IyUS94ZXc2OFg2RVRvUWtpa3dCYnJm?=
 =?utf-8?B?NDVtUllLbkliN3ZpV2ZXYk1MVlIrR2lFNHgxN04rbkZrdnFISWhOTDdtZXVq?=
 =?utf-8?B?WlN2UGk5U3dpV1VnV2pOQ1ZoRmFSZFVpbnNNK0lmaExzSnl0cVVhZ2dGUi8y?=
 =?utf-8?B?SEJJL1dFMnZuTm9GOWlxN2pyQi90czhicGJ5SnpORnN5K2VJdzVtd3RlcGY3?=
 =?utf-8?B?MnpuQzZJenRMTjRLTHZjZ0doSmtDV0pid3FpYW5uS2FKcDZtd0t0TEh2eTZh?=
 =?utf-8?B?YTZ6czdYd2pTdTJMVm51U2dmL2ZoRUoxd2phRTR6VWU2SDJzbndlYXBoTzVD?=
 =?utf-8?B?ZVZuaitoT2lKb3I2SktrU3ZDcHluNXNxdERGZWtZdWR1V0RYN2paK253eXBr?=
 =?utf-8?B?dDlxbjdwK1FVTUc3NUdJc1R0YVZ6TTRoMDJoajhTK2Q3aHQwSFZnb2VvUzk0?=
 =?utf-8?B?eVFEQlc2VnZXcmRSSCsyQTR5dW5kKzVmY2IydjRRTXMvOGtIUkdHd3AwRW45?=
 =?utf-8?B?OUcwRDZoWTIwWTZkZ1FkdDhGNUVldExoMHV0cktBdG1kS3NDd0l6MHI2NWJ0?=
 =?utf-8?B?T0JzbkxvVXpEaUhMKzJtRERMb3VlOUY1d1NtWm1aM1N2dkRWUWZNU1NNSEwx?=
 =?utf-8?B?UGdGZS9RNjc1SkFGUVJzczhMZGJPVHFiQ2kvbWpiQ0dmZTFjcmlENEpPVEx1?=
 =?utf-8?B?cnJFOUNLSzluWUordEkwU0tnMFdIaGYyYzVObGZhczIzaFFES3RWVTZYT2ZV?=
 =?utf-8?B?RC9wTm84aC9xczdUQ2UzT3FqV0VXeDlPUVhOaEFGY0lGYjBkSi84NElQeVdm?=
 =?utf-8?B?VC8rMlhycmlsajNKUHgwMFAxTjdrbGI4ZkhwZ0NSZkNrVlc4Lyt6RUdXZjNi?=
 =?utf-8?B?NzJCWUd4SnBQSHR0RmpDSnBjNXUxdkVac0NEbVcrZFV0ZlNkWlNEbWRENDM0?=
 =?utf-8?B?UFZTTmFqV3J2T3dEbWlkS084c2NXN0t4b3dHS21Md1d6KzVFeXJpTmhVK2Qx?=
 =?utf-8?B?Z01aUWhabTdxeVY4em1aaHZwdTZKb1RXbXpoczdGVjJrTmJjT0ZUTU5lR2lv?=
 =?utf-8?B?K2JvQmkwOXBxdjgxeG1YbGpoa0lXTXRYSjhnSFhFdkhRQWozOTlrMllTWGYw?=
 =?utf-8?B?OEdBbENCb1ZqVitSQ0RpaU10c2ExZGhqM0s0Z0VPSFhtOUxHdXUvWXN1Y3BO?=
 =?utf-8?B?dEZFOU9ZMVZMWjR0bk1hNFRYK3p2OXdqbVdrYWlzR0hMODdIYnFLcDRDK29y?=
 =?utf-8?B?b1p1Y0FDcFRuRG5HcHUzWEdGNlVNWU5NdDhTelB3RlBsU2dIekY1bHFDelpO?=
 =?utf-8?Q?Av9/nSy5QKxildrD5lriwqZM2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde16e8b-caa7-4064-9d4b-08daf4939182
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 11:53:06.6847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubN3oshNbdXO5GANCBV427504NqdoKSO9GXiIOLfsqWpW3MuoTDL7FKYQ1wQChDrdm1o4LNYLRd9WiTmwEWmKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7440

On 21.12.2022 16:22, Xenia Ragiadakou wrote:
> 
> On 12/20/22 13:09, Andrew Cooper wrote:
>> On 19/12/2022 6:34 am, Xenia Ragiadakou wrote:
>>> The variable untrusted_msi indicates whether the system is vulnerable to
>>> CVE-2011-1898. This vulnerablity is VT-d specific.
>>> Place the code that addresses the issue under CONFIG_INTEL_VTD.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>
>> Actually, this variable is pretty bogus.  I think I'd like to delete it
>> entirely.

The important difference between Intel and AMD was that Intel initially
supplied DMA-remap-only IOMMUs, while AMD had intremap from the beginning.
Hence Intel hardware could be unsafe by default, whereas on AMD an admin
would need to come and turn off intremap. Deleting the variable would be
okay only if we declared Xen security-unsupported on inremap-less Intel
hardware. Extending coverage to AMD wouldn't seem unreasonable to me, if
we knew that there were people turning off intremap _and_ caring about
this particular class of attack. With no-one having complained in over
10 years, perhaps there's no-one of this kind ...

> Nevertheless, I don't think that it would be appropriate to be done as 
> part of this series.

I agree, but I'll want to comment on v2 nevertheless, rather than simply
ack-ing it.

Jan

