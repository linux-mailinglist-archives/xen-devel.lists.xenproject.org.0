Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAE0667186
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 13:02:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476081.738058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwHT-0001tD-Kg; Thu, 12 Jan 2023 12:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476081.738058; Thu, 12 Jan 2023 12:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwHT-0001qs-Hj; Thu, 12 Jan 2023 12:02:03 +0000
Received: by outflank-mailman (input) for mailman id 476081;
 Thu, 12 Jan 2023 12:02:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFwHS-0001qm-0w
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 12:02:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea233db1-9270-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 13:01:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 12 Jan
 2023 12:01:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 12:01:56 +0000
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
X-Inumbo-ID: ea233db1-9270-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUKktZSxN0XogMcel4W4RqwZNc8E5YPKahgi0z7g1bEpmrjViS7R80xY+uPVXCVFxJJuuIZBfOvzhZ89TeZxzLxxAjp7VPnlVNf3lAMgHhEq8nRuKEGhaiPfGTtGNH4JvhekXtPkpGZPapoMq2PjLveJiseAnNlhWg4Ht+t9EBEVG5S1bbLQMxUrBo8+8/b/i0KNlOMm54a/xJSCZESo9CJU50m98zgA6fgoQhhE3FnpBov6GydgE4c045e1rA020Ghkxw134dkOwY7mPmVBIrh6foQ0ghOarD9boiYArGTv9mxlXHDFgXBwRrRcJx9BLpTGQYatl1Lp0Vit79OiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5xqAFELM6aeYRPpdl2iJ0uN5YRwxvbcSRYvU8IYJrA=;
 b=dy1RfBJUlMAii7gQ0y8Vet9+1T2XriaOj0PETE4ecuahZWWGb9uwe2NKe3z+GOTnIj0QVsgopIECC30/AMraaZz9UzPKmhz8PtdVf0xGv3Hkd2EInm2WUaxd+eDEx+jzmscmjDpcfdwUjSMz/Myf88gt4znLQLzW5MrsXF9JDaappILjkZnVfj7PS7MIYJ0VUK1ViWqIZ0TxhW/5wejIdQmhSoDQm8sgj3WS6uP8fpixggWDJWeqknvF4gbz4n9qb5y3dPZp7TDEjDC1ZsjCTV8UX3OOMFMqRHi+x90NQ9khMtQXgI2htxDIbyzmYsNHksGprSYT6/IpDtEByXC/XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5xqAFELM6aeYRPpdl2iJ0uN5YRwxvbcSRYvU8IYJrA=;
 b=guJ2ePpDvdZP3D8gJbIk+BCBais8+K7AlH4HcpzE00zNo9pYt+46e4ARKVNJ/0dD9xJU2rDZRVXuGvNBzBwVcxkJmaoqZ9Lspi7iLRdbnZ5fTaCPabwvtLRYBETJ/gUXWp+TeozXDFTcsOQWvKPnn7nVJWnzLOmAmZ0f+MLZiHh0ilH/L5Hc9t6eYilggO7CxRy0iyn7JrezKp8aHV6K408nRuz+9RIcZO3bT6r6PTRLgI/rmlp04YgDARcZKhGGREBFHpiEaU51apQF5lmv17LMVkdPvYNUW4XEqxfFY/lgPUv9W/7hw7s0gN3gyP4oa1WykaQUZ9xkBs0d2fG4Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a71e7cc5-3f86-0397-613f-a796a0309d42@suse.com>
Date: Thu, 12 Jan 2023 13:01:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/8] x86/iommu: the code addressing CVE-2011-1898 is
 VT-d specific
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-6-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230104084502.61734-6-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ffbd98-65e0-41b3-d127-08daf494cd88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U+hqISi5J+Cp25EunYZUvPG2dnaD7nn/jQ9nBT+ssVXw7fRAQ8+0zNhVwGmCXKU900fwgze23lBs0LDBaA6tKmlIYoRCshAvjw1O/mZVE+IuDr+/qApRG25230AKEyuyHh9Iimlj2xXAr6nOPBM++HhMBVOesvAOe77K1Pm+bKTEKXvmIDmHdrlKCe0iKKANpcqDXLiQvB+n8C/MoDd1BQkIwh84SufUT1tKWlNyYW1qPg85sNUfpBYjqyguISO+VaXHy+DE7v20t2Wm6c8uTEJ8tL2U631VQe475dCCC2gInCfY+fMfqyGLuX6x9y55DUTUBY8Az2C/mYuxcvlnMvDfvt3FWbXO9yPCVJmeQkq4KDyO8uEneVenfnyJhi+JBvMvBFudAyi1Jx+kzbgTgeEC/2S5gInP8uGpCMvJwa8Fd+dAxhMmV5akRFS9rLBgW6aSLRhvClTdLtGA8cjRq06CG+uszmy0j5pNKa1afySVvxsrpnZ+cS0INRuVR4cTOKNNDWNcVWmXqa+GhOlNH2gsdTyFsx28ofLeiNmch3CA+xBqXYrkXbRl7yz/wk5fPrfSWbWA3R6orezENPg3YgnFLs1fDpk3hHludH22/k7vkcKxqjC1mnhIuHdFhysyJn3+2Bn6PXcORyDNkBiBjVLNtYuG1wGytGe3967mNukVAssoub8c/G4cBesxWPJVXTdg9kSGPGY+a3J5pOZgzo7JQ8GEsk7Q4zWdRUqJ+x4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199015)(8936002)(83380400001)(86362001)(31696002)(4326008)(38100700002)(8676002)(41300700001)(2906002)(5660300002)(66556008)(6916009)(186003)(2616005)(26005)(6486002)(6506007)(316002)(66946007)(66476007)(6512007)(478600001)(53546011)(54906003)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzBFa1FRS0VZdVF4V2M4TXhzSENmSnVnVGVUSlJmTWUwWkptODBSVUlhMVh2?=
 =?utf-8?B?WklXdWN1Y3VrZndrMFkrSW8xWGNhdVAxSTY4a3dJUHBNNG9ZSDNPRUxlV2JO?=
 =?utf-8?B?aFcrQjNVakJqY2pRbFZoejJHekN3S3o0RzZ1WlgyZG16QTJRbU42VDRLUEdo?=
 =?utf-8?B?MVNHTnA2Zy9KZ2NuQW1UdzA5bVI5NEdyWEN1dWlkUENKZ2VCR3JPSWU5SnBx?=
 =?utf-8?B?WmMvMlpBOXVIRmpYOWcwVlNrL0tlbmkyNW9wU3h1azdVM20zNGlmSE5SNm5s?=
 =?utf-8?B?U0JEcVpkUS8wUWRnVStqNVZvQ2NDTEwxSnNIaWtIVnkzODM0b09HMUxndUxP?=
 =?utf-8?B?QU8xZ09CcEZ1MVJUSjYzbG1YKzQ5UE4yMEpIVlZzSkV3RlRWVExCZExmZUNw?=
 =?utf-8?B?bEZCeURNNG5tcWpEdHNIdnl3RFZIRnk1RC8wTmxmeWxEUXc2Wm9MNk1YMVlR?=
 =?utf-8?B?dkV5MW95bTBSdGQzc2N4Z2xwcmQyZFo1ejEzU3FRMjVySUQ5cWFwYTFDamVW?=
 =?utf-8?B?Ti9HTk9paEtpTGpxQTJHd2lXQWE2SHlGSFJjMTB1SitYdUxmRXVRdzNKMHVh?=
 =?utf-8?B?QWpZUTU5WVZldENpSU44NndBdU55T256Um81Q2g5QWQyTFFTenphY0svOFdx?=
 =?utf-8?B?L0hoSktqRmU5YXJtQ2hyNEYrRE9tQTJmNjZpTUY5d2tIS1ZJL2hxTllCMlA3?=
 =?utf-8?B?VHhvd0ZGQTVBOEFCQXJaUkNHdkhuOWFxdC9wNEY1eW9GajFBdnFuUGNGSWJP?=
 =?utf-8?B?eitZSDF2dkFtY0xJa2JFMHFxMldUOEpvaVF6N215TTdJNDA2WitwOTc0eXhs?=
 =?utf-8?B?TitWU0MvUGNib0VaN3U0dUJKVzJSb3VjelZvK2k4NGwwd1pvWUdEL0NuVTVR?=
 =?utf-8?B?eURDcXIvOWcwMXUydlBDVW9YcFhPU0ZKM1I0Mkl0bDRlS2hwYUpMK1hPZmJP?=
 =?utf-8?B?R2ZQZktJNzd0SzZYZ3kxNXppdnN6RWJMamFyYXlEdG5TN1VNZTI5ZHFsdm1m?=
 =?utf-8?B?Qk5zL1A4UTAxdGZtbjV4ckdkVEs4REpPVGs1eEV3U291TWNRb0ZpRHhYbUds?=
 =?utf-8?B?WCtzMGs0eHRtamdVNWtxK1pWRlBZdXB6TTlBV3EzWUJvcVNSY0hoN2E1VnNv?=
 =?utf-8?B?VDVwTGNkTFNSckg2WU0xYmd2b0U5YnZDNG56VlpoVFBhQnlFUWYxc05JaGtC?=
 =?utf-8?B?SEpVRkZ4Qy9UZFVRT0trS2NxNFovaTZlZ0k1QjhjZDRJTjJVZnNUYUF2K0xE?=
 =?utf-8?B?U0V0U2JtMmtibVQ0dGxnM2Vqbytia01UTkx4TTg1bFFWYnFqd0lJYTAzZFdz?=
 =?utf-8?B?c2tpSDA2M01YcW00cFRXTnMwOXNPREtGM1NhWDRNQ2tSb21UNUFNN0I4MGFn?=
 =?utf-8?B?YldPY0pMd3FXamplYTl5VGxYWUM3K3hmSy9IUFI1UksyKzhnR3BjRndvTE9n?=
 =?utf-8?B?SXBGbVRUdDdJU1JIM21hbUJER1ZpbEFvVEZkZmhtM1k3ZEU0dDBhc0RXQmRa?=
 =?utf-8?B?cGlhODhJbWlpbWdkb3R6ckJSaGtSU2lFMC96bkdXMnVoeU5mblFtc2c1WFVJ?=
 =?utf-8?B?VmdNVlZJdlZTd3VQWFNhempsR1Z1UG56SE1wUHNjTXRrRnJZd0lkRVUycm9D?=
 =?utf-8?B?eWs3YjUxR08wZnV0azVzRGIzZmVIcXFKMEZUQThYQk5hOVQ5MzNvMVpuZ2ZJ?=
 =?utf-8?B?aVpCOVIzOWNGaUdzMElpYkJjN2JyTjVzM2pPNjdERVdMZlpVMk1Fd0hod0xN?=
 =?utf-8?B?RG5QRWEyM2RQT2tMU281eTlIdlk4L3FTSUJwVzQwUS9QaGl1WVVFUlNpUHUv?=
 =?utf-8?B?L3VSa2lCMS9HZ2RHMmQyUTZxenhVeUd0RUhxc3ZCeUFsaG1Da3RmS01zY0hu?=
 =?utf-8?B?OGlwN29tcVgvTlQ3MjFoNzVnbnorMGZCMFhwTTRnL21qUFUwcy9pN1RlTzF3?=
 =?utf-8?B?SXFuMEV4Tmw4bUtRdHJhL0ViMHA1bXlSeVZkTG1qZnNWclh3WlZKMlhuMDEr?=
 =?utf-8?B?dzlXckNDRHNhak5ERGYzL3BtV3AzYjFsakhwaGZqSlpRVmN5ZE4zYUdrdThM?=
 =?utf-8?B?SkhLSGRaUWM5SjAyWmR3eFQwK2JDK2FDNXRiSzBrRHBpRFJqM1MyUG1jQ1ho?=
 =?utf-8?Q?S13NW2pjbDg2/gS3KweGFJ/3V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ffbd98-65e0-41b3-d127-08daf494cd88
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 12:01:56.8698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9S6XlTnxkrM2Zly01ACsdu94QiTuNyeU7yzoX/vFRYeVVS+yMh6sGRhwVM2ZN3mV1MnInk/vDQiUMMPxkrBhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984

On 04.01.2023 09:44, Xenia Ragiadakou wrote:
> The variable untrusted_msi indicates whether the system is vulnerable to
> CVE-2011-1898. This vulnerablity is VT-d specific.

As per the reply by Andrew to v1, this vulnerability is generic to intremap-
incapable or intremap-disabled configurations. You want to say so. In turn
I wonder whether instead of the changes you're making you wouldn't want to
move the definition of the variable to xen/drivers/passthrough/x86/iommu.c.
A useful further step might be to guard its definition (not necessarily
its declaration; see replies to earlier patches) by CONFIG_PV instead (of
course I understand that's largely orthogonal to your series here, yet it
would fit easily with moving the definition).

> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -127,7 +127,9 @@ int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
>                             unsigned int flag);
>  void iommu_identity_map_teardown(struct domain *d);
>  
> +#ifdef CONFIG_INTEL_IOMMU
>  extern bool untrusted_msi;
> +#endif

As per above / earlier comments I don't think this part is needed in any
event.

> --- a/xen/arch/x86/pv/hypercall.c
> +++ b/xen/arch/x86/pv/hypercall.c
> @@ -193,8 +193,10 @@ void pv_ring1_init_hypercall_page(void *p)
>  
>  void do_entry_int82(struct cpu_user_regs *regs)
>  {
> +#ifdef CONFIG_INTEL_IOMMU
>      if ( unlikely(untrusted_msi) )
>          check_for_unexpected_msi((uint8_t)regs->entry_vector);
> +#endif
>  
>      _pv_hypercall(regs, true /* compat */);
>  }
> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index ae01285181..8f2fb36770 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -406,11 +406,13 @@ ENTRY(int80_direct_trap)
>  .Lint80_cr3_okay:
>          sti
>  
> +#ifdef CONFIG_INTEL_IOMMU
>          cmpb  $0,untrusted_msi(%rip)
>  UNLIKELY_START(ne, msi_check)
>          movl  $0x80,%edi
>          call  check_for_unexpected_msi
>  UNLIKELY_END(msi_check)
> +#endif
>  
>          movq  STACK_CPUINFO_FIELD(current_vcpu)(%rbx), %rbx
>  


