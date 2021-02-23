Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE01D322933
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 12:04:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88703.166906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEVUC-0007Cy-FY; Tue, 23 Feb 2021 11:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88703.166906; Tue, 23 Feb 2021 11:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEVUC-0007CZ-Bp; Tue, 23 Feb 2021 11:04:12 +0000
Received: by outflank-mailman (input) for mailman id 88703;
 Tue, 23 Feb 2021 11:04:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEVUA-0007CU-UO
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 11:04:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e528acd-0b0a-4e6f-a602-122798e2dffc;
 Tue, 23 Feb 2021 11:04:10 +0000 (UTC)
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
X-Inumbo-ID: 7e528acd-0b0a-4e6f-a602-122798e2dffc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614078250;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Bq3Ao2qIDInLxkkZCE4fOBHBMwcSdwBNahWQ/0rvNTw=;
  b=BKJO2zrawzy024Mn0lcOij5BDnjzvLQcsDJ75VHbi+BK5hW/EiwBtltp
   0gTPgv/DoNBz7q87iawgnkQXU/O6umsA6Qp/i/Di2tDfcV3Chmn7yQ/aK
   L+obqdSi7dx4+8iE3wojP5t7KKo6SC6J5Cwq2GnNQfFTEktbgPOdlxSUB
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9/if3uqo7pnGBFBsCsjltZqpF6kyA+WybhEyp8BACLOpVsPJZXt55ZrFEkLrYhkSV/D1A8YBWS
 kwxuU1RbE28s+ht0sIBoMG9XlXvH77MPgRB+ecGo1nOFJ48qvU/WIGsZqC1bpXpYWlvLVeVsbu
 b+Alk1EynbbSHlWp8hpQvgtnuYqstrOhCl/IJoZde2vCO1C6QI754V9t7VFNQQwLOirLHxmwnF
 eWvFI62XukDmHDXpzbeRar6a3uiWb5MkjMHfdnUQofokRDkerg106mbSkHXa55ZsGZjNxXVk+j
 edA=
X-SBRS: 5.2
X-MesageID: 39194740
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,199,1610427600"; 
   d="scan'208";a="39194740"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DR0ZWBCzPAPYtFigMEceYjnwRR5mXYMOMtA5DjDOqSGbw7XDqSGiOkPD/zj5S2SrZhzTS1H6Qxt/kUvE2QYj0OicL65diOKO5MJIQSCiyDe6vTCme5a50czImJQFC5NEp48WyarWLGDs6A0kk+fLbPeiqXKXlTam17FsJGcp251AvDpSkV6XIrjYTiXpAlgSwL2UreC5CBB0Q5/I2p+Yi+yzhhooIe28Pg737L8/XfjJMfP8VVCiojed3ctGV/jgrLDsigDEV/7qnzRXP+1KE2RLX76K8CnL8BpCHzxZLnM9MnvLNdxFguiQzVzWiS3eYeU33ODSbelr2MApm6fNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ResH4lssBS4NZCOdLD0/JgmxVqGf48AtG3FpQUPa89Y=;
 b=UqOnM5o70TZ/xgIZwTss+ohuGntJJEtICWoC+G6YCheb3QmzUeF9iIJQJeyOoj2cYHiBInTUuHIyw5/RZ/Vr/XRSxSZ80Av5/bRkR0bPMKMsUSLOkyP+wOMunikNnOXfEGWT1S1ctVatnyOGS4VG3KfP7m9m+PR1hVYzLotl57o+Hm6941BnyR0kA8NWpPM1qWDsycVU1z34EllLcj3q62YvLtXQIdax714cZVvzai3euvHC2HhVvwneD6XWJY37HQpY2V1wZPNNM3eewY+MV1FcEGPSg1RE1KEy9o1VRHqm9QZs0zjUtzjTMrKUfVPlrHMBvR3wXHpMlUVqcOkhQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ResH4lssBS4NZCOdLD0/JgmxVqGf48AtG3FpQUPa89Y=;
 b=UC1arfyxYlsonH0rNw6iKVhvE1+YOQhUJTrbNmJJ2EZ4Q9H0WKpVFzNuOkFFK7otNlY3hF8bE2mSgV3m9H345UuyHiZWDUev5sUBw8YmDMg0RTrvEBRS8+rIpv0/afsFEoNv9esV8tO2mwA5VgVRB5tWTlobrYncPa+940mEyok=
Date: Tue, 23 Feb 2021 12:04:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2 6/8] x86: rename copy_{from,to}_user() to
 copy_{from,to}_guest_pv()
Message-ID: <YDThIFB7ox6qdfFE@Air-de-Roger>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <5104a32f-e2a1-06a5-a637-9702e4562b81@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5104a32f-e2a1-06a5-a637-9702e4562b81@suse.com>
X-ClientProxiedBy: MR2P264CA0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::28)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a8fff3b-888d-4e48-8203-08d8d7eabcbf
X-MS-TrafficTypeDiagnostic: DM6PR03MB4475:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4475775C9E6F0D115D24D6088F809@DM6PR03MB4475.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wFg/cq+9/5+61dChThUKdeE4r/FStzYxR7z+aeTJrrw8kn+P/kZF1KQV/KPdYPLvG1QCd9mdSNwmbP77o59SwFttBF+S3rmQXLO0kNVMSW6Y6wptHhhABS+f5ey8qVwkEAYT1SvyrLU5XqIN0NwE4rl+/qyyc1WHKai8qs8WVw/i+6Z6GqmV95Y8whZ+gMfiXMSCNGI5CE5GM6GNQw2CK7KhsTx1Lkdd45wO3FMVSL8F30itpSBQOxFeErJSvztxJii/rQH3VpLEr6WDtWAAw/kVPlpLfahqeg7t1qXCJwvapWdhx7f7lAj7g4kbIMpvD3fTvw2h+ssfZLtbZdvtLlTM6Jj4vjJCdKD/5H4a6G9Hv0+cbtkNgsD210z17NFFsymmsCbcLLgJONHG+02OSKJ/u11ELJN8dzcTn8IWGAgjr2XspXUo0qXhBl9iDACQqD1E0iQJbHeYmjIlFBNRRxsX0iegYt/0cZ4D6rRYjCx+++HyABs2u+AuRqvmiMl/ioyRAu8wUT1qLyEqBJpM2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(5660300002)(6916009)(6496006)(2906002)(186003)(4326008)(85182001)(66946007)(8936002)(83380400001)(66556008)(8676002)(16526019)(66476007)(26005)(478600001)(6666004)(956004)(316002)(9686003)(54906003)(6486002)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWRnNS9HSjdHNk5aaE1EZTAzSTVvRUZQTEdPNE5hT1VQL1lYLyt0ZjU3Y01w?=
 =?utf-8?B?Qnpic3UyLzA0cXdmMTJ0N1lPdWwwNDlCdWhBa05iQmp0SzhHSFMveDQ3ME5H?=
 =?utf-8?B?ZEFwWU5yT3ZOOVBrekdnYmdtZW16cmlwelo5Sm1NNGRjbFY2QkI0cm0zVWJS?=
 =?utf-8?B?SGhpNzEraGExUStUODY0SUxmSktrZ2hFaS9VL280My9BRG10SEMxVWl6Sml1?=
 =?utf-8?B?ME5EWVo1eURvaTlmZC9VWnY1Yjh5bDFQVnpsNFJrME1MSDRUTzRDS1kwdWF1?=
 =?utf-8?B?WDFVT3FzOWtmYkNIdzJxMktxbTgrNXNwM3J2NythRk55N2RDMkFoWFJZK0JK?=
 =?utf-8?B?T1JPYTBuNEV4UW1BZC8vanJWOFFtWVVqaStUUStuVHl0NEdzQ0RlYlozNjBj?=
 =?utf-8?B?bVk4NzRsZ1R0ZEEra2ZGQUk3YjF1UXdDc2NqdnlRWW1ncnZRQ2kxQlhZRmZB?=
 =?utf-8?B?eGM3dCtrcU00QWpOempKamNJSmNLQTdzWHJVdnNoVDF2cVBpcUMvZzBzUFN1?=
 =?utf-8?B?Yk5mUy8yU1l0eGlVMGFDcE1PeU9qZVp4TGgyVzlPRFJ6Z0p2N0xhdWFWdndn?=
 =?utf-8?B?cm8zN3NxYXFtR2M5Q2s3emdSMnVVUlgxY0ZwMUsvWkJwNmRrcEpsaTllTmxQ?=
 =?utf-8?B?bTlvWG8rQ3pYZFY1WTYwd0dCQTE5ckJEdXVoVkJMVjFtWnhvRU8xOFBTUnNw?=
 =?utf-8?B?RGdBMlRXc2RralNlT2RacnQxbEdSNXI0aTZZVEdwRXZhQjhPV3A4dUk0UzRP?=
 =?utf-8?B?eTV4U3ZiSEcrS2tBa0pZeVVDR1VTL1RhcmtGeG1nU2lIZjFES0VMUzk3K1hs?=
 =?utf-8?B?YWtvUUFXa3hQZ2xTcVA0RFA0dGhpb09aaWVQSUNsTDEzbWZuVU4rL29HRVlV?=
 =?utf-8?B?ckpuQVRyZEV2WUdndm0xUFNRMVdFNlpCZXNhMStnMDEyRTloVHAzeU9WTHFW?=
 =?utf-8?B?aWwrbkJEU1RMVURrMStoL0JpRlU3endzbnlZSHpvbWV5d2p4eDIwU3E4MUFL?=
 =?utf-8?B?T3BIUXVvZ0d5MW01bUxmMlF2bFBac1RUVmMxQXBBYTJoSEtPV1MrUWtLUmNs?=
 =?utf-8?B?YnFaQmNuRTFUM29UQ3YzL0JwcGhOZWJ1dDhlK2Ric0huMnFwdTBWNDNDeHBl?=
 =?utf-8?B?N0ZqZktkN2dQSHdmYkx6TWNteFU1Qk5OQ3ZGSlhjcmxISVhHWDA1Z2g3eUh3?=
 =?utf-8?B?cjBDcTZuMmhpb1MwZ3Z2dThVOXBMWVdZL0xNTktocVFlc1lPc2p0MEI2OUd4?=
 =?utf-8?B?VVY3a21uY2s2bVVaREhrODdEeU9kVjBsQ0d1aXBsN3Z5Q3MrOWFCdkNsckhz?=
 =?utf-8?B?ZjRFNWFVNy9HWEhkNG1xVkEyRjgzbXcvS0xJQ29veDQrVmhKY3NyejMwQ0w0?=
 =?utf-8?B?SGx4MjB2a0dMMzJrd2NreFdOK0pjUC9ScS84NytZeXpEMTdXeXFJRGtkdis4?=
 =?utf-8?B?Mnoyb0NneGZPU1RRSTJDSm0wSVp4Z3pSWXhvTEVLcEdjSWtaRlpma1dNOHk5?=
 =?utf-8?B?NDJLRjNMYno4R3MzODAwcE5rV2JvS3crUU5jdG95Mmh0L2dFSnU5NjJMOVdX?=
 =?utf-8?B?Tks1YllIRVNCK3RPdWZLVEZLZVk1R2lEV0R4Nm1tYmdET2lXS2Vja1FQZUVE?=
 =?utf-8?B?SlFqd0VNZlY4ZlFzVGpxaXFtM3dEWkhucEFWakZmdzNuRldLdTBWTUhOYldB?=
 =?utf-8?B?Ylk4a2NiQk5GN0JjOWxFNERiNFJBbzJNRjZaampnYWdkV0hkMDdTdFVwZGky?=
 =?utf-8?B?bitWMURWVG90cU1NRm4rNFFZWlo4aGJOWFVhMzFLUkxSOVZaLzJFakdndFJX?=
 =?utf-8?B?Z0E3elViNlVHaU1aZmc5QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8fff3b-888d-4e48-8203-08d8d7eabcbf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 11:04:06.6780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vv+rGeS/NaTuiCqZ0LQF8ozCjg1ebhQP5cCLj+fiLL67RdiRK9MdpMNTCWUcN0tvJFDXqEkkihX7tyRUi9MVog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4475
X-OriginatorOrg: citrix.com

On Wed, Feb 17, 2021 at 09:22:32AM +0100, Jan Beulich wrote:
> Bring them (back) in line with __copy_{from,to}_guest_pv(). Since it
> falls in the same group, also convert clear_user(). Instead of adjusting
> __raw_clear_guest(), drop it - it's unused and would require a non-
> checking __clear_guest_pv() which we don't have.
> 
> Add previously missing __user at some call sites and in the function
> declarations.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> 
> --- a/xen/arch/x86/pv/emul-inv-op.c
> +++ b/xen/arch/x86/pv/emul-inv-op.c
> @@ -33,7 +33,7 @@ static int emulate_forced_invalid_op(str
>      eip = regs->rip;
>  
>      /* Check for forced emulation signature: ud2 ; .ascii "xen". */
> -    if ( (rc = copy_from_user(sig, (char *)eip, sizeof(sig))) != 0 )
> +    if ( (rc = copy_from_guest_pv(sig, (char __user *)eip, sizeof(sig))) != 0 )
>      {
>          pv_inject_page_fault(0, eip + sizeof(sig) - rc);
>          return EXCRET_fault_fixed;
> @@ -43,7 +43,8 @@ static int emulate_forced_invalid_op(str
>      eip += sizeof(sig);
>  
>      /* We only emulate CPUID. */
> -    if ( ( rc = copy_from_user(instr, (char *)eip, sizeof(instr))) != 0 )
> +    if ( (rc = copy_from_guest_pv(instr, (char __user *)eip,
> +                                  sizeof(instr))) != 0 )
>      {
>          pv_inject_page_fault(0, eip + sizeof(instr) - rc);
>          return EXCRET_fault_fixed;
> --- a/xen/arch/x86/pv/iret.c
> +++ b/xen/arch/x86/pv/iret.c
> @@ -54,8 +54,8 @@ unsigned long do_iret(void)
>      struct iret_context iret_saved;
>      struct vcpu *v = current;
>  
> -    if ( unlikely(copy_from_user(&iret_saved, (void *)regs->rsp,
> -                                 sizeof(iret_saved))) )
> +    if ( unlikely(copy_from_guest_pv(&iret_saved, (void __user *)regs->rsp,
> +                                     sizeof(iret_saved))) )
>      {
>          gprintk(XENLOG_ERR,
>                  "Fault while reading IRET context from guest stack\n");
> --- a/xen/arch/x86/pv/ro-page-fault.c
> +++ b/xen/arch/x86/pv/ro-page-fault.c
> @@ -90,7 +90,8 @@ static int ptwr_emulated_update(unsigned
>  
>          /* Align address; read full word. */
>          addr &= ~(sizeof(full) - 1);
> -        if ( (rc = copy_from_user(&full, (void *)addr, sizeof(full))) != 0 )
> +        if ( (rc = copy_from_guest_pv(&full, (void __user *)addr,
> +                                      sizeof(full))) != 0 )
>          {
>              x86_emul_pagefault(0, /* Read fault. */
>                                 addr + sizeof(full) - rc,
> --- a/xen/arch/x86/usercopy.c
> +++ b/xen/arch/x86/usercopy.c
> @@ -109,19 +109,17 @@ unsigned int copy_from_guest_ll(void *to
>  #if GUARD(1) + 0
>  
>  /**
> - * copy_to_user: - Copy a block of data into user space.
> - * @to:   Destination address, in user space.
> - * @from: Source address, in kernel space.
> + * copy_to_guest_pv: - Copy a block of data into guest space.

I would expand to 'PV guest' here and below, FAOD.

Thanks, Roger.

