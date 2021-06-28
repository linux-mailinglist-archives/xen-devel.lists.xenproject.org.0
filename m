Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FAA3B65F2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 17:43:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147908.273062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxtPa-0003o2-Np; Mon, 28 Jun 2021 15:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147908.273062; Mon, 28 Jun 2021 15:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxtPa-0003lO-K4; Mon, 28 Jun 2021 15:43:02 +0000
Received: by outflank-mailman (input) for mailman id 147908;
 Mon, 28 Jun 2021 15:43:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/HW7=LW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lxtPZ-0003lH-5A
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 15:43:01 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 820a6f3c-2fd8-4fd9-b15e-92c09787fc07;
 Mon, 28 Jun 2021 15:43:00 +0000 (UTC)
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
X-Inumbo-ID: 820a6f3c-2fd8-4fd9-b15e-92c09787fc07
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624894980;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rL07fJcyD0f4sLEVHpsjaNe1y8DD0QBR32MSuR5IHyo=;
  b=acEGsUsc1ZVJGQtJ7BPdtQnaRUznmQbkVkaE4KwlQwkp6eVPRT7s5Min
   BhDxp7m3ioAtFsrecqkgNnf7fUnYUkP+Z/m4nftx+FfAUeJws0cZr4H9l
   sV2vcb9noiSUKvkiU5qYsO0hQmkdxcnef4mmBrYetbsKJv27QdzJQ8d9v
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xTP84Sw6YhutYAXXiwS7ZY3bTOGJhQxUxUvKR6z2xR9i6wGeyIFFpQso/dZDi7a8WzeyK74QUD
 qTKSkzwEEr9EigNOiiXFQrrhCfYBvaxviey3nSWMN+Mnpf0ZQRQiv9M78XS1xCTdWoYmKxMJe1
 aHLTWMOWwyO8I0VzN6+CQ201Q6lyVCVlx1dFUpp74EoCrS1mGuHrxc8oT2M4xvdQCVS5O6Um4b
 GO5voTfXzN+32iKnDUrU3p6kkkGXYxGlQQE9TZ8ZsW5sPEhSbvPj/Z2GS9gXoEh1XwAFiIuj+x
 +LA=
X-SBRS: 5.1
X-MesageID: 47111395
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rhL2qaNtdSFZDcBcTyX155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/uxoS5PwP080kqQFnrX5XI3SIDUO3VHIEGgM1/qY/9SNIVyGygcZ79
 YcT0EcMqyDMbEZt7eD3ODQKb9Jq7PrgcPY55ar854ud3ANV0gJ1XYLNu/xKDwSeOApP+tcKH
 PR3Ls8m9L2Ek5nHvhTS0N1EdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJppmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O84isIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsFuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59Qs5Vma/pYVFZtl/1YwKsMe61wRR4SqbpXU9
 WGNfusoMq/KjihHijkVgAF+q3YYpwxdi32D3Tq9PbliAS/MRhCvgMlLfck7wE9HaQGOtN5Dt
 T/Q9NVfY51P4YrhIJGdas8qJiMeyPwqSylChPYHb2xLtB3B5uKke+s3IkI
X-IronPort-AV: E=Sophos;i="5.83,306,1616472000"; 
   d="scan'208";a="47111395"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bH1lvMs4iG34ajPmrEzjISFlVaW8jOlueTyu/B4V2ZTWHkIQsLNXdDWGnC7uSftL/GO7mkt4GQ4CSBNKGt5g1mO4IlS0UxHMTeTgerKto+Qj4FtwhvbrRqzqsvs1GwpCDUUS1y5r3qR4v47XeMFlyNje9sS4Z7DUQtiq9n7EaF7idZfh8X3q+FOzuMFDvbfXhTwQtfJkdnnDeUm6RrVmw6CAgtelreIAqy/vnispUogBRUG/1zs4NxLCTGaPy5FEWAWVMTuEpBOJgXBiIVp8faHFGT33COeExDACIx5iaGvueyJMrBDgPCW9zN1ybUd9H5Rb390YIXv1E/Sdc0dBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzsyPWRkH/AuOxaHf9zOdo6QAdP0gtCntHQtxnq4QMw=;
 b=J7odn7z900X6rLU7bDcwu8x5hknlxGUwZfq2ObQC8qEevC20qRlUC653AXOzMUvlL1S6M109Zgobe/LuZUWwPu9ZXaqfFlnVd+VYRkDZVm3ZxdXSOMHX4iZvEP1X/FZkQ/PFz/qdmidQGRB1WXXOzHFg2prTd4YgSO4jeDf1dzu4wbt2q4Jmb3BBHy6XgIuKmwNISTMpQGqJSOzezshd/2KTWbFV77Cf/BFUVI3HFevC2Di8Ag9gn+EsCmMSrETC1irZ83IhfAp6PqIO1YuSgtWeUVo7oIwVl/ADIYBflwITMl3QknpOD1M9zZFbawk7OT6fR9KPVIOO8O3QP1YmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzsyPWRkH/AuOxaHf9zOdo6QAdP0gtCntHQtxnq4QMw=;
 b=KXrV1Rv3G/WLJpiuvtkor0yX/I5T7h/WVaJUfLAgn5aMYKbeghBwKrKkUlqnCQ5yhgHNHWMi2Zz82r1x3XG2S/JPB9MV+1V1vwOVmHmAX4GgxNV03NdwwI5qJHq1V8uN1oEq9shTqTCV93rGPbz4qW3zbOVtyHntudzIMFFmeSA=
Subject: Re: [PATCH] fully replace mfn_to_gmfn()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <389f5988-4700-da3e-e628-1513e87eb56a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <263f1b30-e33d-711c-ff22-64f8acad230d@citrix.com>
Date: Mon, 28 Jun 2021 16:42:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <389f5988-4700-da3e-e628-1513e87eb56a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6cfe0d9-9fd2-40a9-42d4-08d93a4b6435
X-MS-TrafficTypeDiagnostic: BYAPR03MB4679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB46792607AB1AD862F8A68A5FBA039@BYAPR03MB4679.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yeM8Da/fmHsnfb4bKbc49+20RtDU+OTsPV1j3EZD9fSkQDkzQWX6eKI/p21ob1+Bmpe7FMMRIV4WXJiG+SshjmEyTCbpnU6eMdpsfmaixxDF/ebSY5onoXAF0qVzDGEtlpz8gQl/VrzaU8W/xAsT2a2NjuaGCn2Vynujq/lBD/+nzpvJwiMIA98B9URIgOokBj9o23HY3o0XZk8Cy+3fXrqQWLzMmrIB4oqAmgUXI7cdLxvipW4H61Xk5iSMbelzZm82pEyetPtInF9O/ruze0WZaQS1uMJmeMgUQLNIc/yrX8ayZy9FOIvx67YTvNGVYmEQJPC+5fUhBFWnJ1IOchnm8qX2dontcLYKkQtfRLZtG9p2R+jHnmnpj17alsljJCGHZff0HgPJLfkdDJoXCRT1bwbGnll8NKUFN5Dv5zBlMl2iO8xmWmJkhZBAjkFjW5Aw+0xdtTlHr3p07aKwR+Q4Af6mCm6MlOrL5s8d37j58uxK1jflK1JD/EAWkZqFATwXj+K24NA0I2/mkSmqYPSo9CiPuMwMfAq7LSoxF0l/v31ZsI6vDCqKrCJvxVYzdC6aeLji7LfltLOzyQ8asHd1tUKuG2i2M0BMa96vhK06S2S8wpZiG/mBN6TZ4JlpzMpbeN/u5h/gT+nNZzPrNLMUhp1XKPrbPn2CeDrhDYmxM2O7TZixAln4iX15awt5GmCrfWFxbWnlzGHjlh8AtxrNN+aNnxSZpLVtly7HSkk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(956004)(107886003)(110136005)(53546011)(2906002)(5660300002)(6666004)(66476007)(66946007)(54906003)(16576012)(66556008)(38100700002)(316002)(478600001)(4326008)(8936002)(186003)(16526019)(8676002)(6486002)(4744005)(31686004)(86362001)(26005)(31696002)(36756003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXpxNkJyNWRoRFZkYVpOQnhkVzFGRG0rNGJpY2EzeTlBeUR1cGxTUlRDcUpu?=
 =?utf-8?B?akRBQ1RYNW8rSTBPTGNuWHdIZXR5NExHZmFlS1NQZXNzOW1vOVI0WmovYTcx?=
 =?utf-8?B?SkF5dWJUS0w4OFpBZmRvTG43bUtGMHRZQmVBdDJnTE1VK1dOQ2xhZWJWKzFD?=
 =?utf-8?B?RlV1enZka1RVMGhld3o5NkdIQi9DNEczaXMwd0ZtN0oyRDhDU2NtZEVwTXlz?=
 =?utf-8?B?STRuK2t2cklaL3I2STdIYzZ1bWRsVlV0Wk9wOUozRlpDNFVITmpSNXo5dWE2?=
 =?utf-8?B?QnI0SDM0eWhEandXMTFSZGw4NWFIQ0tIeHdDaHcrM0trU05iQ3h6NDI5SHhW?=
 =?utf-8?B?MkF6WC9JMC9YSGkxNnBZS09yWmh2NE1kRGs0Rjd0MzVlQnMwTEp6dVZ0MHFJ?=
 =?utf-8?B?a3Iva2M3ME9PYnlpaEhGODVhVWFGeHg0alVzRjREZThoMWFuUDJHNVBLYVdx?=
 =?utf-8?B?SDA5R2JVUURJdlh4aG9vNHVFTWdRc0NrVDBqcXpvZGpwZlQzZlBaelV0d084?=
 =?utf-8?B?TjhNc1FuSVlISGRRVmlnSWpPQjVUL0RTSTN2ajZiTVZDMVhtTmVldjBuU24w?=
 =?utf-8?B?UUkzRUs4dUwxNHFxRkdHM1JFYzhYVExFN3JKUWFGZGd2RHpQSUJLT21DZDla?=
 =?utf-8?B?L1lCVjkwUFMzQlhOc05teU93TTExSVNFMjAvWlJkcWhBVlRJUHBBallWSXhY?=
 =?utf-8?B?ZlIxaTIvMElTNmEyaGNuaHdsN0V4Q2FHWnVHS04reUZobEI4bU4wUm9YWmVQ?=
 =?utf-8?B?eHJPUmJ6dlJ6UjB0R3V1ajBwc0owMXYvWmdvRlp0L1lKcGx5cVVvS3I0dVkz?=
 =?utf-8?B?UVA0M0dIQnBhM2k0TW5zOUxaZVgvZE9wemVGZDVlUmlBM3U3NXF6RDQ3WVQr?=
 =?utf-8?B?dDZpT21Ud3dvUnBaR0ZzZ2tQRm02TVB6T2kyRGNzL0wwcE12U3BoVlphOHdP?=
 =?utf-8?B?RXpIQ1NpYWUzbEFFR2NzQjdJbFZSWnFoV1Vad2pRN2VPMlhvM3JtQjFQNEZD?=
 =?utf-8?B?WU5wb3FVdGtGNDdiWVIyMUZiVmFheVpLcndYR1V1TWZ2bTlPaEJzZGozQWVm?=
 =?utf-8?B?VTQzTUJlNFUwNXo4NFBPQU5JQ3d0U0xCaFMveTg2UEVRcytld0lFM1phM3F4?=
 =?utf-8?B?d0pNV1JHaWpIUnZxRjByNEtKandTSzgzbDFSRkhST1N4b2VsWXN4MHlFL0pC?=
 =?utf-8?B?dlE2OWNrZjVUOFVDazJwY2JrYzNtSmlEUmxVRk9yVFNQL3UwNVZERTRvNkQ1?=
 =?utf-8?B?a2ZDMnFyL3M0bGx6akVrS3FsektKekhudlVrTjBhOEFIYk8ycDFQYm9mTmxq?=
 =?utf-8?B?TUZJSnZZc2ovSlhhdDhGM3JneStIV0lOeDY2dW0rdnZ5akdHSGVDQ244ZlhE?=
 =?utf-8?B?Z2kwSHpKYWMzNkIrczdKODlKSm9pMTlrL0VDL3FOV1V2VU5vM09qK0FxeXkz?=
 =?utf-8?B?OFEyWEtDTXlKZkcxT0RkcUswZkxkcVJWUVIwVWRrRFFnRnpwL1pOdWl1WCtQ?=
 =?utf-8?B?eHN2S1VDSGVRRVdneURxRHZlRWE4U0hlQnc1ak5SV0RZbEN2U24vZnZ0dUxu?=
 =?utf-8?B?alV1dzhUNTc5Z0xod2dieGluckxGeENmSnZDV0Y1R0lXb3IwNU1xM3dXMTFV?=
 =?utf-8?B?em5mZEtOc1FIc2Z5dDZJV004V0llZWMrZmpiSWRnaTF5MERDOTRBRnJhSVNs?=
 =?utf-8?B?cXlBdUxCbFNVMHdPdk1aUHozZy92NHpwbnJGWHk3bGtiMHR6aEtpYm1la1FN?=
 =?utf-8?Q?3+MC1j3xjO9ofUqKzt5evvQplScUL0eUov874U2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6cfe0d9-9fd2-40a9-42d4-08d93a4b6435
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 15:42:52.9435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUrCxEjcL/7szcdkbg6PGo246kuXYhVjGDUo18t54fdUxVk0tQiQV7aBnLLVNKkiF/1nioqoBdTDOwRW4A1bk/QmdNUQV8PzTga7PQsoD88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4679
X-OriginatorOrg: citrix.com

On 28/06/2021 12:52, Jan Beulich wrote:
> Convert the two remaining uses as well as Arm's stub to the properly
> named and type-safe mfn_to_gfn(), dropping x86's definition (where we
> already have mfn_to_gfn()).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but ...

> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -328,8 +328,7 @@ struct page_info *get_page_from_gva(stru
>  
>  /* Xen always owns P2M on ARM */
>  #define set_gpfn_from_mfn(mfn, pfn) do { (void) (mfn), (void)(pfn); } while (0)
> -#define mfn_to_gmfn(_d, mfn)  (mfn)
> -
> +#define mfn_to_gfn(d, mfn) _gfn(mfn_x(mfn))

... surely this wants to be ((void)(d), _gfn(mfn_x(mfn))), even if it's
just a latent bug right now?

~Andrew

