Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BFB706B58
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 16:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535939.834012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIIr-0008Lq-8H; Wed, 17 May 2023 14:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535939.834012; Wed, 17 May 2023 14:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIIr-0008L4-4n; Wed, 17 May 2023 14:38:57 +0000
Received: by outflank-mailman (input) for mailman id 535939;
 Wed, 17 May 2023 14:38:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzIIq-0008K7-CI
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 14:38:56 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c4ec659-f4c0-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 16:38:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8556.eurprd04.prod.outlook.com (2603:10a6:20b:437::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 14:38:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 14:38:53 +0000
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
X-Inumbo-ID: 8c4ec659-f4c0-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tq1b8VZeZRe6B71MxNbXTpdBDR1wyvVLCpVQYeZ9c7K2JEcXn6UUh5v370SMy9d5lEpggqovYeoeSFY3x5BOfHJ1eSMjWxlPFHLO3VgraWUqDayom2Bgl68g1pie/Sij3sLG6hPkg1Wue/igVWvRhoCCtdMr55slzOd+pTm0ow9ZUaKG1Il8b9Lx+hwILLbnSNlzshZtCJ7kBDPy/hiV08RYrxd0nA2m6g439p/NSb9738OjgmOyv948+yct3OVnv1o2FRFQWri5F1QKJfbRiL7r1PCILsb77gD69BjKk7kPv47ENmwj5NBaYtBOxs4fYbHZmYGHkMh/gpZoIJA3MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDYEZTAhs+K6wtbgMMY1tDeB20mU/i2j/518ttZD/Ek=;
 b=Bt0UEUwqxT8tlTLW7jszcEhlYz1Y16QIvTUvj0cJSjNqpED3HVIbN35pm3ivWDU/a4LlZD+aEHJnyWXcJ+lEaLCAWdoHQJWL8Fid6+nXWLK6XRT/3j/z2rFfDzGfUfuTdHqFdDfd0ptMU+SMI+jMsopFZuq7kotswUNxRYY+e+Zf6BKaFgyIVD+8Ig9ghUjIGL4y+T4DpwiSDXgZT7zRCioyoTsPI9nYiTOD9lFVpt/VBsHzaGmS6HTpfxXI4+GI6jiVYj/3jBNhvjQaIEHNYMVUs/ELT6Gk0itdOxFjWzU8RiZY88F1tXzssMxL7l6QfAmJipMZHGD/tT4cg3qUYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDYEZTAhs+K6wtbgMMY1tDeB20mU/i2j/518ttZD/Ek=;
 b=rhjbPcA/F+G77AB1NPpRSsnYGa0l1HqDJizEG7m5XtryimMOfEo7EnbFjStjK5dlpA4qkDRA8M90CmKIfk7fuSSQzi9QWrcxi5LsExUaAPaJpQZs4+L4fKaWKf0GZ6kq7W3VdRX4H0g4lNxIfBAVhKI7IR+yx2uqp96ax2tCE5RWNcRqBaTvjnkgpXOXhdgYPjAQsjxOZonYkSXGUxitm2fDIOTaATtaKu6iRSbs9ejPNhBXws1N4Ys+Qx4u6WLn9/qMm4UBdZ3yzvQRwMREyP9zKmF2Ct3LPMsRJsMDt9Gi28m9Rz0nFNb6lmNSCEQSAwNyngOziYfMknD02aB2tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f3a3e0d-74de-de19-2d87-b24574297356@suse.com>
Date: Wed, 17 May 2023 16:38:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] x86/vtx: Remove opencoded MSR_ARCH_CAPS check
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-3-andrew.cooper3@citrix.com>
 <54560de4-1c55-c7f0-61ad-84d1e71e47f5@suse.com>
In-Reply-To: <54560de4-1c55-c7f0-61ad-84d1e71e47f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da978f1-2abf-466f-cbca-08db56e46fc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ruuFW5hyw07RHosIST2o5GNZJztQVn2Zx0QM+TxsK/l2GfxqmWxFzZ0aH2VBbVlqJqyC/Y/tewgZFQVLOAwuTyZrnI5hVAKMmHVRv04w3R/myl1bmsnY4uNR5x1jtZgpnd13dP2sFTbrga8GcE2Lo8AzLOJWXZ0pAEGINRxDc74Q3kaARjGjXuMIbq6LbRugxwYFNlHG/9DIx3QgZJDJX5yIvdGDiFPuQRy4Y2cY0AFy3AjGM5sJfRmWBEf2+AgMsB4aZi5HyqOCPtfcfP/vceWFXcWraFHt/DyhMHnM2jOBbAloQNKwauWpafr18RjSJ08mxy3x+aI4RaBrZgrMk55HdDjeojIYjKY72x48K9WyZOWwX4lChC/Z6ODtvtUhYiZ9NLlxaHGX2/1h1+jHng2FRGeNa44HXlPeynWJTyAcRNdrSIJ+1R4ChKpv6a/p8KNrFYQqBD7XlxaaxpdwJAvRHedGmuUSpe+J7Ira81zYaroX37yZNFoT4cBViqtHRrQt8LBBtK77EypB0EfFf27Oj7b9uzkYBDL0CXYDLokFCTMixmvtseifgHsc6Mz0X414Yb5HTBUhR/rera3dusqlDb3Ch7JWskxu0wWVjSvgiw0aiSXwr2iEisNT096YLFR3WpYXJ8krI2I4p5hlVw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(31686004)(31696002)(8676002)(8936002)(41300700001)(5660300002)(86362001)(66946007)(66476007)(66556008)(2906002)(38100700002)(478600001)(54906003)(6916009)(6486002)(4326008)(316002)(2616005)(26005)(186003)(36756003)(6506007)(6512007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3kreS8va3VlWXFlRkRaRFVsTVp5WkJvbEJ3YVdTdGd5b0czanFuUkxsSDJL?=
 =?utf-8?B?dWY3WHh4OG1UaW1FZWRnNDM3cjhrS2tmeGZNOUdrclhKa0FNeVNGVHF2SUp6?=
 =?utf-8?B?TE9lUGZ3ajhRZnh1NmVqOWFOOXVzUnRNdXdya0NielZyK0hDRUQ4eWpKRFFt?=
 =?utf-8?B?dkpWdFlIenBhNGl0cUprOGFteURRR081bjYxR2FHd0IrOXNxWmF0dU14ZURj?=
 =?utf-8?B?bGtQNlV2emMyczZnK054RXBvcy9yMXhGWlZBMVhJYmI5ZklPQmpoOUlBSmlR?=
 =?utf-8?B?ZEluSkJXUDRma1RXWWtoNlBHVjRPMTFpanpkdkp2V3E4MUVMTHBQTVUweXkr?=
 =?utf-8?B?eHE1dzdOSmdLL1NoSll5ZmV0MEx3anhaaTN4TCtwWjBFV3I0WksxM05jSTY2?=
 =?utf-8?B?QXdSSzFHVVpNeTdZODg2TFkzc1g5eGVPVmZLM0xKc3JUVlBkSW15bGJBOUZW?=
 =?utf-8?B?RVVLMzg3b3BrZ29xNEllOFZ2ZDFQNnU3YjY2RnY0SGtrYXV5eGFiSmJod0Rr?=
 =?utf-8?B?aXpod21QTHl1bFk1V0wzdHYxU0RoWmpoeXhvbEpwZmM0Rnc3cGRiTVBiQ29a?=
 =?utf-8?B?QVVvUWRZSzI5SDd6eGpiamN4ekU1SUI3cU00MVA2bVlKMDdMMFozTlRTV1pj?=
 =?utf-8?B?Ui9CL2x6Z2lMZVZ4Mm4xMDlmeUxJdEUyZG42aTFKeU5DTytVQ0lmOUh6MzBI?=
 =?utf-8?B?cFF0QVhpVFdqREoxZ28yZ09Da29lVEowczE2NUl3WjdJZTl4YkZBZyswbWk5?=
 =?utf-8?B?Y2JrL3cxUk5RRExySGlXYktQN280Q3dmblFOQTVteFFLeUQxQVp4OUFvcVps?=
 =?utf-8?B?OWw5SE1HcGRRbkVGdFJqNlFCTnZhdXBDQ0NkdkkvcXROZHYwQStjekh1NmlO?=
 =?utf-8?B?OG5SUk5lcXNjTVp0ODh4Y3hrUUNYRmx4aithSmIwSTdvYjdHSUNsZ3MxY1N0?=
 =?utf-8?B?SUtVUzVSTi94WjRiUGF3aExmUmhJdDg2b294RnpaRG5ndW41WHZKajVNWk1G?=
 =?utf-8?B?bVNOeThscDRxMERpWXBBWnpaSEd6MzVmQzlEdU9mbHJXSzVHc2NXQmJRTXVL?=
 =?utf-8?B?YTNzOE1hVnVoVTBJUVFDY3lWWDVoeC83VUJoSHFSMFdHWkNLeElodXVlOHpK?=
 =?utf-8?B?MmovL1NlZy9FbkNZNjNEejVNNDk0bFViODRiTzU3THZqcEVBOEtoZFk3L1BM?=
 =?utf-8?B?Y0JFMkhYVUY3djZSSEd0dzNzcG1VMExleGt0eTRjdThPV0p0T0FXSWllMWx4?=
 =?utf-8?B?Um5XUkMrZkEvTmZvN1Z4dCsrWGFPWkl5Tm5USjBRcVJhSzBZSWlvRkRGcWtS?=
 =?utf-8?B?d1JtdGorcGtGSnp6R2JaTXcyd29kUHZncnRhZUphS21NYm11NnVIYWhrcU52?=
 =?utf-8?B?M3FGTFlybmpIeHh0cGVLWUNpMWlxRmxocmNWWVhXakZ1d2ZUZ1ZtQnVBRjRm?=
 =?utf-8?B?VUZMTVhmODRWSXk1NXZkMXB1RHByYklqM2lweFEvK3BQYlJHWVVZY0F3R25Y?=
 =?utf-8?B?L2R4aWQzU1lkSlpua05BdnFQbjJSamVCODFhSFpoYjFTQlRLTk02ejNYWXE1?=
 =?utf-8?B?c2xFd0Y4ZmRnSSt4YlJxWmhLVHlMTytRZ21pNDNlaFFYQWI2VDdPRDRWb0RK?=
 =?utf-8?B?N29kYXJMZ2lVSkxWY1ZQOVk3alRaQ1ZHZC9aVHNicHBDWkVRY29VVWs2SnRp?=
 =?utf-8?B?NHpwVzNhQmlSdEZQNjJ0NTczMWhSVjQzbll5eXc1WUViRUhnRHlrQUtlYmZm?=
 =?utf-8?B?YnFORjArQzkyd1JSOTB3aExTR2RhN0dOakFDeVA5Q0tmclZla1FlVUJwNVVn?=
 =?utf-8?B?MGdLeWZ4ak0vb3lqR2k0NDA1dTc1QU1wRGJZbTlMdUJ2a2I3LzVCT2VEWEJE?=
 =?utf-8?B?RUVHQ2FjZkdmU2tMS1ZLNHhvcHNsN1YxYVBNZm93R3lMOTJHclgraDhycERI?=
 =?utf-8?B?SVVRdEM2WTl5a0gzSkpkVUJCdjk1dkZRU1N5em5kSC95VzlrSzBsZEtwOXNM?=
 =?utf-8?B?RjJVVE44QldUMEM4N2RzdjYzY2FhVUdQN1h6Wk1tVWlkOUhsU2FjYjdJVHFY?=
 =?utf-8?B?RG02ekIvY3pFODZpM01kd3NNeVRwVDgzdFpVWjhSZDhKM0pZOWhHTk5EaXBO?=
 =?utf-8?Q?aEhS5v0uKHUqfz2xnf7ehHCZ+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da978f1-2abf-466f-cbca-08db56e46fc3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 14:38:53.1994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1u/Z5MPxM6hl00eqcnJQa3tqgnDspDiTDw8lcTQg9vn/RC+CfnqD+34bBTe64fvPfQOytZVkFZ3uBZADDEBMlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8556

On 17.05.2023 16:36, Jan Beulich wrote:
> On 16.05.2023 16:53, Andrew Cooper wrote:
>> MSR_ARCH_CAPS data is now included in featureset information.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Oops - this was really meant to be
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

> albeit, like in one of the patches in the earlier series, ...
> 
>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -183,6 +183,9 @@ static inline bool boot_cpu_has(unsigned int feat)
>>  #define cpu_has_avx_vnni_int8   boot_cpu_has(X86_FEATURE_AVX_VNNI_INT8)
>>  #define cpu_has_avx_ne_convert  boot_cpu_has(X86_FEATURE_AVX_NE_CONVERT)
>>  
>> +/* MSR_ARCH_CAPS 10A */
>> +#define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
> 
> ... I'm not convinced that having the (unadorned) MSR index here
> is really helpful. In particular to people not knowing the indexes
> by heart (possibly most except you) the number may actually look
> odd / misplaced there.
> 
> Jan
> 


