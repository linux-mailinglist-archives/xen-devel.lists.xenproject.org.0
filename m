Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22CF3FC962
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 16:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175806.320156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL4Qs-000561-Q0; Tue, 31 Aug 2021 14:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175806.320156; Tue, 31 Aug 2021 14:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL4Qs-00053w-Mq; Tue, 31 Aug 2021 14:08:10 +0000
Received: by outflank-mailman (input) for mailman id 175806;
 Tue, 31 Aug 2021 14:08:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH2E=NW=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mL4Qq-00053q-VW
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 14:08:09 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3778c3b4-6506-4989-a03c-5c3e720a796b;
 Tue, 31 Aug 2021 14:08:07 +0000 (UTC)
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
X-Inumbo-ID: 3778c3b4-6506-4989-a03c-5c3e720a796b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630418887;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2gMcTVZtoMEo2qljJXV+CoDpGA6YMQCTivgTU4Qox5M=;
  b=fdwKJbNllk5dHanVjD1uggqizAN8nJBYjW0Gh9KeV0xcgLkIF/p1B3K3
   oUjyNq3Wy9JjJUW2kENb2/lDRFLoJH/KG4U2IPtaF0pJGVAcTtWl7pY/4
   0p/n0nHwOedvR9UAX7uCVAox41dd26e0Kl271uBJXR1GB3I0zxiLur1Md
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ENLt0WLIFuMjcYXBySPZsSuPILhu+wGJQbVN8Czjl2c1Zvc0Tu6IHcCQYt4aPfbKoEmAOJAvfU
 /P87ojQO4jVWU4twiRNEV6BiwP53qSvi2AIhPe7q7o4d/lza/EwmEjnvmdhaMOGWNku2c6egRL
 9git0nIZx0Bm4KzHkHDvMAwTTQaZa36EatJk/rM0Rlvq4Ni7JVF8rveyPVthjIeAETlbwD7m0U
 BHmZC30/X48HkZW+Ko2TbBgY49Z+Q+2bh084EQCr8+TI9HVUi2qsuza+3OK6Ywn71jji+l4Nzi
 TKcF/CFE9SSEE6Vi9q4Xn2m7
X-SBRS: 5.1
X-MesageID: 52086493
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5lgTK6+GyUBAwgB4fJluk+Fddb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQkdcKO7SdK9qBLnhNRICOwqUYtKMzOW3FdAQLsC0WKm+UyYJ8SczJ8R6U
 4DSdkYNDSYNzET4qjHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCajqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOoXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6T64aT1eUWpDLS8KoBOCW+sLlWFtwqsHfsWG1VYczDgNnympDq1L9lqq
 iKn/5qBbUI15qYRBDJnfKq4Xit7N9m0Q6f9XaIxXTkusD3XzQ8Fo5Igp9YaALQ7w46sMh7y7
 8j5RPui3N7N2K1oM3G3am+a/iqrDvFnVMy1eoIy3BPW4oXb7Fc6YQZ4UNOCZ8FWCb38pouHu
 ViBNzVoK8+SyLTU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsJg9V55H7e
 LZNbkArsAGcuYGKaZmQOsRS8q+DWLABRrKLWKJOFziULoKPnrcwqSHlYndJNvaCqDg6aFC06
 gpfGkoy1LaSnieevFmhqc7jSwlaF/NLAjQ9g==
X-IronPort-AV: E=Sophos;i="5.84,366,1620705600"; 
   d="scan'208";a="52086493"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQzLTrOUFISskDTtkieFSE6Nexi8DWsZjTVnv7ESCrsgd/4h1Cn9nvIts0XNVW4jXZQ3furitsra3FbhrbOUK1JoYxhvBCsLA5jrpSRtZqlmQGLfxHbV7YpJn42aHPw9Nl6bIqpKgoOQSymP9Zcr6qPTBmKf4dwX8V9hP6irPJFWA4s+oEhW9gRXp2T8lhTM8sph4zrwggpfsKLwYrZdaqE06GcWUgrWxo/0XkdxNFuZU9u3R8Nc1YImGMjMxUjv7hUyrKkmOQxyY/M7pDBlSdULp/61V4MAynlMffD+/vGtGAWdwguYBCSxC4Azpf8dOQ9alt1PjHJIdIxRlVrhKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oMakH3yRVtDpnZ756uJoJ2MWewMYGLo0j3MwOPAPQdM=;
 b=ChQXK+TSUVPFSKUnlw00rLp1TWtjJTYWedF9Af0MclzVvQRkDWzyWjxyWW+6ODuzqCxHKpzOJ7Dx62JfHPWM4YcuINb/nE5rkdTenR3BedEPBTwepQUJN/ouBOKvHyTmntRcWG5XdK4uHDdNuT6bSf9rZrdjufUTfRl9c47Kz3CpulSzumve45reYkLZqEVfYZk+7DZl3ZMb6fac4UcVcWA0Mf/BXfV5MVnBgyrbGwxB2mbelnKkTDoBuXYNauzF8JFl5eWLctmBc5WG/7M1mSDOt9/w6bGrEO1jbnlxa8SkG7z7wYsCD9HSOiRis1fOUIPdjkC5xohUDwb+RZ95lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMakH3yRVtDpnZ756uJoJ2MWewMYGLo0j3MwOPAPQdM=;
 b=jzALmm/IPxyufvNgztMm1d6kEs0KKqj4ccNuQ0V5B6pksLKBYaJIK7rQMofQuxl/I28Y0jHuCH+/S97olJ2iYTy5LLun2qRciLRlk76yZEkyFIfD86D6TPrre7GGD//mmVlllbPnYwHL1CbAjHUmNf6bJYhNRjNGvCR0C4f4ZHY=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <a1c71c0a-8bc7-3f6f-ef5c-a0ef854fab33@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/4] x86/PVH: improve Dom0 memory size calculation
Message-ID: <abb0e218-d02f-a1f4-2d48-3d3d3c681b06@citrix.com>
Date: Tue, 31 Aug 2021 15:07:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a1c71c0a-8bc7-3f6f-ef5c-a0ef854fab33@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0206.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57cba1f6-0145-4040-4ebd-08d96c88bef5
X-MS-TrafficTypeDiagnostic: BY5PR03MB5029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5029466ABC513D7A0F6F0D41BACC9@BY5PR03MB5029.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2eerG2yeYwa5zqwZvDqZwGrq3ZOW4Q3797uuZ1iz2F1iWgGj4gsrViwWjy1R5d6DiyXY8wAEH/4ofn3DDMC1lBWNBH0GSkPjyBSyFAzGJBK1Hu60TQl7v7idw0nv5MVjo5a6KxJv3WX+I1JaI/d/EIGA1HmafCMmoHZBcjiqa896Z0+NcWvKCSV7QP/IWKLPuw7Tj+H2njKa5Uj+JMAK2ctCoBoiiTCAtHOnk3xeMONkF/bTqVWEb5XwO921I74BEwoFzwItsQcbN4PRpELFpwd0xB8RWTHqHwIy6nxV6a4TlPlgexGkZ9b/K9FqfVxGV5qbU/+z8mPcGfdlpa0mE/YPtIXYQQx2N3gKGSiXysw/5vN/Rs3LQfLnzgH1dQnCwxICClngduMwM2MmH6JfPJ7zrPyQUJNgrPJRWsZF/7r4sIfGnl46jByOZoJ94lEPpLLjJbuhE6kblc6dtImWude/YiywHEDtTZOSzpY6aflke4g5zpaQ3nLGiY+LininX0bpZPOHddOEFtO374SFlOnfNAH7SyOLEnH2GgiRXg7vxDSGvgUxa22hWfk/Pwg7gSKFuiIKLhKPfuV3bQToT8Xd/FUNcb3q1zPyprEQNQyMDhXP8lZvFve5WXfc6vKk84fbAEIEk1AR3sKg/Z+yn+mdYhx8ZEAMvLUqdqvVVjbZ6H2Q//vG4YyCLBj/IU6MJCITIoCNkj0Ih6ynqXRdIkPwdo9ZxqqioJaTmLkQk6q3rxMPk7+6qjdyW4nSYUEN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(83380400001)(36756003)(31696002)(8936002)(86362001)(8676002)(6666004)(38100700002)(53546011)(55236004)(2616005)(956004)(478600001)(316002)(107886003)(16576012)(186003)(2906002)(31686004)(26005)(66946007)(5660300002)(4326008)(66556008)(6486002)(66476007)(54906003)(110136005)(25903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1loR084SzdHT3BoK0hwODJQdzMwTEtWYmFYbjUxS2RVQU9FZEdSWVlVeUEy?=
 =?utf-8?B?UzQ1RkIvVitCRUM5V1dCRHNXNzg0ZTE0c0ZMZ1U1VHNxVGVpMGpDczYzSWZX?=
 =?utf-8?B?eFBQdlBtbGlyOE5pRUkrREg0Y1N2UGVubk51SCt0SFoxQnBOVTdJa2VnTGJt?=
 =?utf-8?B?cDRDRHBOVjRVamt3RmlhbE5EMi9YTkRxT1pWYVhyUzBLVkgwOHZuMTl0ZDlO?=
 =?utf-8?B?OXJNVnUvc3FZMi9CTlBsQ3lnRWVpU2RWRXo1ZWw1OG1VVUVOT0FzbWVOeFZW?=
 =?utf-8?B?SlI3Sys2QlU0bVNyc0dldmFNOWVQa3VETlNxOWVZaW1mb0ZmaWpMcklzS3ZS?=
 =?utf-8?B?TnFmVXBhUlA5S2t1bm1meEtZYjhSSGpTUlpRdlVhNWpOT1F0dFBpM1l2QVJE?=
 =?utf-8?B?WUgyZmdUWkZZa3c2V3BXd0lZYm9xMnB4clRnQUNEbnIyZWEwMVNHcGYzc3da?=
 =?utf-8?B?cnM5NjdDNkJzV0lxTnF4Z1ZsUk9VelAwamxsTFFGRENzMWtuTzRzRW8yY1lm?=
 =?utf-8?B?Qk1qVDVrVzFiSk1nOWRIRVVvaDVXcnRvckZ6dmtRWlpZNFJGN0g3aXlKSExt?=
 =?utf-8?B?aWpYSkNQS3VTU2grcUduNVFNTk15S0R4ZXR1a0xNT2QzdCtUbUVObUcvMVNp?=
 =?utf-8?B?eHhjaDRobU00SFdMNEk3REFJZzl5TW8xVURuN2VIK1FQL2tQbGhHUjVGdEZs?=
 =?utf-8?B?YllSMlhMQ2hwc083YlV0cGc4TEprVXQzc2Z2ZFhFM3FEaGxQWjEzdWVSNVRZ?=
 =?utf-8?B?UWdtcEcxd2NCemgvYi9neXc3NHJTR3dmZGlpc2ZIR0s4TFc5QmhZOFJjT3JI?=
 =?utf-8?B?MFdzTVh6N1NnYmJhZnpqbEk2RHRUNUczOUJqTTZ3eCt6TVVvcTZQSW1PY1Rr?=
 =?utf-8?B?MmNaU21FZmNCUHN5R0EvOFBLditiZDJLK1NaaEo1ZnJQNU93cTNuM3pacjYy?=
 =?utf-8?B?djFHeWhGUmVzcVJxUnVLdmFxWjdaSTRWb3FIVERyMnN2Y1FpTnp0bitpOUxT?=
 =?utf-8?B?Szg4NGVSS2dXb1NndENsM1NBT3dSbjl2OEhwN1BNN2lROU0rQjBlVmcvUTEv?=
 =?utf-8?B?ZitkWUF4L1J5TWhCNEYrL0dQTmV3dVVUdGg2TThPd0dyK1l3Q0tZanpRT1N5?=
 =?utf-8?B?THVNQjFwSmFmYWc2RThsRk1EeXdHKzJIOUU5NXVLYnh0UTFvaEJkSFJTT2xs?=
 =?utf-8?B?VGVWQkVEczJ0NmZWejZNU0dERUJXODJHY0MzS096SnVFNFpjeGdsY3o2Q1Jt?=
 =?utf-8?B?THl2QkFTdHRHUFBLcjkvN1psNjI2QkVSL3kvSk56S0hHRk1tOXd1ekVnVnJr?=
 =?utf-8?B?Y0NLSkhrQkQxa2R6aWhUZnovQ09pbjNKc3Ayb3IwSy9wSm05OSsvUUxDb0p1?=
 =?utf-8?B?OVFqcVBBTUdQZkpaZUNEZ0R2SXNBMW1LaE1nTUhxOTFSSUhYZ29rTGZiNTRs?=
 =?utf-8?B?UUZoYXVZZE9PSzc2OCtJaWplSEFvNUVyZlUyajA1MUx4VWFJODhjSUt1ek55?=
 =?utf-8?B?UFBFclRsVVltNTVvUHNJdW1zTFI1dVoyZFBjU21BcDNjUDhvT1hJN3lmNEdW?=
 =?utf-8?B?c3ExZU1KSnd1MnhSYjFTNmh6L0twZDBwbm5GdklRSHUwclRCdm55bTJXTTRw?=
 =?utf-8?B?d1dLT1paeVJjeFJZbXZnVmV4SVp0SUdPbis0Y2dhRW10SGExQ2NDUkhZSndB?=
 =?utf-8?B?dUNlLzZjY1BsczJWeW5tZzZKQ0VtbWYxK01UZkxDa1MyWG0rTWExRG5zSVc0?=
 =?utf-8?Q?W0sIwXefnUqTXhrDYajENZdb+IeLKGK9FvyJY3n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cba1f6-0145-4040-4ebd-08d96c88bef5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 14:08:02.5734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0bcK9c5mBR1qLrs5u/reL+dBArJOKdXAQKdNRwX8CUUn7uMcMFhCFIe+lBRIw7g3+W/szMmaqxES3RgoL9lhaVaQO+8tpL3UD5nRV9AQck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5029
X-OriginatorOrg: citrix.com

On 30/08/2021 14:03, Jan Beulich wrote:
> Assuming that the accounting for IOMMU page tables will also take care
> of the P2M needs was wrong: dom0_paging_pages() can determine a far
> higher value, high enough for the system to run out of memory while
> setting up Dom0. Hence in the case of shared page tables the larger of
> the two values needs to be used (without shared page tables the sum of
> both continues to be applicable).

I'm afraid that I can't follow this at all.

What causes the system to run out of RAM while constructing dom0?

>
> While there also account for two further aspects in the PV case: With
> "iommu=3Ddom0-passthrough" no IOMMU page tables would get allocated, so
> none need accounting for. And if shadow mode is to be enabled, setting
> aside a suitable amount for the P2M pool to get populated is also
> necessary (i.e. similar to the non-shared-page-tables case of PVH).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -318,7 +318,7 @@ unsigned long __init dom0_compute_nr_pag
>      struct domain *d, struct elf_dom_parms *parms, unsigned long initrd_=
len)
>  {
>      nodeid_t node;
> -    unsigned long avail =3D 0, nr_pages, min_pages, max_pages;
> +    unsigned long avail =3D 0, nr_pages, min_pages, max_pages, iommu_pag=
es =3D 0;
>      bool need_paging;
> =20
>      /* The ordering of operands is to work around a clang5 issue. */
> @@ -337,18 +337,23 @@ unsigned long __init dom0_compute_nr_pag
>          avail -=3D d->max_vcpus - 1;
> =20
>      /* Reserve memory for iommu_dom0_init() (rough estimate). */
> -    if ( is_iommu_enabled(d) )
> +    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
>      {
>          unsigned int s;
> =20
>          for ( s =3D 9; s < BITS_PER_LONG; s +=3D 9 )
> -            avail -=3D max_pdx >> s;
> +            iommu_pages +=3D max_pdx >> s;
> +
> +        avail -=3D iommu_pages;
>      }
> =20
> -    need_paging =3D is_hvm_domain(d) &&
> -        (!iommu_use_hap_pt(d) || !paging_mode_hap(d));
> +    need_paging =3D is_hvm_domain(d)
> +                  ? !iommu_use_hap_pt(d) || !paging_mode_hap(d)
> +                  : opt_dom0_shadow;

As per patch 4, this condition needs adjusting.

~Andrew

>      for ( ; ; need_paging =3D false )
>      {
> +        unsigned long paging_pages;
> +
>          nr_pages =3D get_memsize(&dom0_size, avail);
>          min_pages =3D get_memsize(&dom0_min_size, avail);
>          max_pages =3D get_memsize(&dom0_max_size, avail);
> @@ -377,11 +382,20 @@ unsigned long __init dom0_compute_nr_pag
>          nr_pages =3D min(nr_pages, max_pages);
>          nr_pages =3D min(nr_pages, avail);
> =20
> -        if ( !need_paging )
> -            break;
> +        paging_pages =3D paging_mode_enabled(d) || need_paging
> +                       ? dom0_paging_pages(d, nr_pages) : 0;
> =20
>          /* Reserve memory for shadow or HAP. */
> -        avail -=3D dom0_paging_pages(d, nr_pages);
> +        if ( !need_paging )
> +        {
> +            if ( paging_pages <=3D iommu_pages )
> +                break;
> +
> +            avail -=3D paging_pages - iommu_pages;
> +        }
> +        else
> +            avail -=3D paging_pages;
> +        iommu_pages =3D paging_pages;
>      }
> =20
>      if ( is_pv_domain(d) &&
>



