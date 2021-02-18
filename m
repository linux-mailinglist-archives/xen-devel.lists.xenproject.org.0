Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160FF31E903
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 12:25:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86537.162602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChQ5-0006Qr-HD; Thu, 18 Feb 2021 11:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86537.162602; Thu, 18 Feb 2021 11:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChQ5-0006QR-DQ; Thu, 18 Feb 2021 11:24:29 +0000
Received: by outflank-mailman (input) for mailman id 86537;
 Thu, 18 Feb 2021 11:24:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXm/=HU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lChQ3-0006QL-Cl
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 11:24:27 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c2efd69-254c-4cb3-929c-af622bd04f2d;
 Thu, 18 Feb 2021 11:24:25 +0000 (UTC)
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
X-Inumbo-ID: 3c2efd69-254c-4cb3-929c-af622bd04f2d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613647465;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mgcAdqXdkzRPOMLqgQAP8vrUf7a0M4YwrYg/UkNoXy4=;
  b=EBPR3XQirnKbi/qkmaKGHUYUgAJNVVfmv3nNeLDT/vaSEqmFDjeN9maL
   iRK9fvYUg3i9rbMNDfD0tI3MAfZTVLKcG+yRAPtXcpCDIo9q9htbNfD8l
   o2U3y85ZFZ9vOKu06B5KWG6ahg7HYoP7biXBLB+KZrZ0tUxvwayLVIcSG
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: h6fTCPB80k32DTNHQbdaQqGpFDsyJ1wYhcIPv7kcdGIFCwKgEogHXcHhU1hQtNZ+Y1f03qJkl2
 JVmw8Wp3iyPkbCeW+Z34qZ2+/P9cx6NPXfDL8jQew1NSb9qv2rVro565KAGzT+5Dz38RjrOkYU
 eiGZmWp5r338EPXc27X9gZXeSzEj1YzHvqCF00t5h0toMO+o7IYuiP/KeEF++KrhOC2HhPscH9
 uP5Oq3THpw4PyhARTPhXF6pt7vbthcfU5T3skgIhVF0/ovaioqYATpR+piv6d4MzdPcC3nxxLG
 B4U=
X-SBRS: 5.2
X-MesageID: 37524224
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,187,1610427600"; 
   d="scan'208";a="37524224"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZgJRhg9EpoUgu4RfKAhXZ6Hrw/d2yXje6PP2NR/rOrYBr7yZmobeKlY2yYndxCVRQi6qLB8Mbvyzf4QdBqjxGHrIrYyM60fwMUk3k12zvw3w2uqhvAMN4j1E7Y+DNmmV20jC9eprqNDO+UYCO3bVVHVxvTF15/kJO3V436p3M3gU/BEvybs39lcujoEV0+lZoiAdi/8pnmUUh+IC5J6lKQinXir2CjfTw9CsiCwAUuiGlceNgVj48G19yeKyc6k8NUGW2GMqo9bEar3pZNCY56eP+l31Hp061QRNSZKxnoScFSEX9xglbobQV1Ax929S5mU1F9RKf2dQG0MFpEr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=243NAMITV7mJMRT4NUohsQfhdOtzxg0uW+vW8Q3KYzE=;
 b=NVg5qKWA1eJbOYAHCCLHachEmpm7UUTioxDi5xfFfqB73x1+olHzI6zo3kQygIJEKKg5mq6IEDLYzI4o+1YyGPRGF4W+zERc72erCV+PcDhlAi/+9FLi5fB3NsP1nswAt0b7fDRj8tygpOtsn3Wz8w6f3EiVzHvm+kqXHiOfutOc7LLhMB58luDR3kCVOwoDGqY9PO5IUrIsEOd5U8tIxeyhfiUdB5LwS3Y01VBbSEI91nCzCtaTN/4boRu0xMbbs3Q7OK2Qrwu+cvhuzOeaORBgk70xikBgPGsoe7M3x6G2WR7Z/ZmCl8StL2oUlaWSTkPxSbSMjmdCYLF/59xmaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=243NAMITV7mJMRT4NUohsQfhdOtzxg0uW+vW8Q3KYzE=;
 b=R9zcqfxfzNAwPvfsNeEASf6ax1J5UsCAyLHFNUI6igcv6kaqBDtZ+SuXKwc77LnyVfES+oqrFf7LCqfPtXWaGWdtqN57cKfwGt1MRHJDBZXv0mW1KEyA25UjZpahilXp+SieAjND1o//GtvbKM/Ajtj1YmsIGR6nXNFh8P0EXD4=
Date: Thu, 18 Feb 2021 12:24:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>
Subject: Re: [PATCH v2 3/4] x86: Allow non-faulting accesses to non-emulated
 MSRs if policy permits this
Message-ID: <YC5OYZOAkx+jutJz@Air-de-Roger>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
X-ClientProxiedBy: PR0P264CA0113.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f679fcc6-5cd6-4bb5-8156-08d8d3ffbd4b
X-MS-TrafficTypeDiagnostic: DM6PR03MB5323:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5323330F876F056618D1A6218F859@DM6PR03MB5323.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uO6cGAc7OF2yhl3R5WpmfCXdufIF4t/9apnBkKBVzRIHv7ELntziT0tNSPK8L1l5ZyCAVR2hTSELWqkoGKb32PADIjibOzqdfHn4scACQblwryVMYX7ShPQ2LEPPI1Dl5nNFrxPon65GS1M8svxoz0dH6qQVDoa+PasJP7ATRO2ptneUTwbO6uKorPsVp05Ry6cuWoNU4d+vNoIZV7Z4hVFF44dKqO/hHMmjiJ/zJz9nztf+SNpJZeDP4icQkAJ23IF2QJwKsFdwXE0y9Fka83iUsuZZfvkP8zrrA4+WJmzMI+NaxzmMbxI/suCunKX6PmluyP6AkUoZFtY0aaLyS0PP9MyH/JSNprUpZByee1ckluOYUtjr+TviR/gVgmqYqODJfpqdU29ay/YTYfpXAe681X7fQGy800TOWDvJKlJdHvncrzQoK1heYmx7mvJqju7JE9eVBKakr6etbzy3RidNXWaCvWX0cxV9yfpNSqc1/gYpmTkcZE+ehCeGZxotonJTb0Kd40+P4cQhON+oVU/albXqdeTmzXTkke2h8gAKJKoxPmZ7yjxbg19csJbU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(6666004)(26005)(16526019)(956004)(6486002)(316002)(6496006)(186003)(83380400001)(8676002)(4326008)(33716001)(86362001)(85182001)(9686003)(6916009)(478600001)(5660300002)(66476007)(2906002)(8936002)(66556008)(66946007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MnE0SkR1SnJnZ3AvbVZHTi9vc2dYc0Vncm91b3ZjZ1BBTUtyY1VXdXZ2cjF0?=
 =?utf-8?B?MXA3eGpmSEs0ZWtzYVUzV2xON2UwVXowNHVzdnBKS0hLaTYvdUUzcDVCczVZ?=
 =?utf-8?B?WnRCU1hGSlVOQmZsMFc3c3pXWnFDRW5DMzJUbGFGM2M5VDhwcGllOVlScHdT?=
 =?utf-8?B?MFp6cFdtbXVEL09sakI0ME81WHdVVWRnZFZLOE1XSzhsM0hkS0hpUFkwRkdn?=
 =?utf-8?B?eGV2WSsxT3ptS3JTLzVmZkl1QUo4WVFvZnZVN2Z2c3lVaHh6WXZiNFQ0dkNM?=
 =?utf-8?B?ektxSDVLQ0UydGh1OGlvS0ZTWjF1dzJ2S0g0ZnpGUEVzSk5ud2pRNUxsQVd5?=
 =?utf-8?B?a29xTnpZZzJsRVBHMk16UVhERTI5Vnc1MFQyNStCYVc4cWJnU05QSDEvK3ZB?=
 =?utf-8?B?K3lVWjhOdVo4cVlsQk9KVkYraEFzc2czWFliMW9CdE9DUURTd3BueFd4eW4z?=
 =?utf-8?B?cjRlcjlET1ZFZlNvaGRKMkYwQ1pTeUVmZmxCdVVrWUcyekhES3BldE5MbHRl?=
 =?utf-8?B?VEVqMmdMeWl4T0ZiWDlLOVhEcGYvRm50Z1pxMEZIL3libGVzdmNqM1hzajl0?=
 =?utf-8?B?Q3BNa3oraWN2TkRiNGdkamxYOTdzOVlJcFM0L1RMV1FabndSa0g0cDBHeEcw?=
 =?utf-8?B?NUowNGVDbHpGMFlYanBBZHZMQzY1TXV3azMxdFA2VmJ5Ujl0Z1BTMjFWbFN1?=
 =?utf-8?B?VnJSR1dIais4Y2VFODkzNXVXTzdaWTBLVXZWTU5QWDhLcFQyQlh2TFpJd280?=
 =?utf-8?B?V1Bqa3VWNVlZcVRqVFk5L0ppYnFtclh2a0tmZjdlSXA0RlA3dGt2bHNxRjhm?=
 =?utf-8?B?RHhNTTRlK2loRk00NVJCdTRHUUZ2THgzRUFCamptR3ZsaVUyeXZvMTBNVU5y?=
 =?utf-8?B?OHZ1VkJWKytBRld3eFRmZXpDdmxWc250d1FlTVdua2FqL01zM1BLT3ZTcEd0?=
 =?utf-8?B?YWYzeWdwei8yRmd3dVN3OWxmd2ZQYTljR0pUWTlwOGFRanA0WXYzUk5IY3dO?=
 =?utf-8?B?VlUvNFJoRzl0SDBOT2JJcVlNa0hDVnFPbnJxRWtScUhLZHJkQWhsajZOK3pV?=
 =?utf-8?B?RkhCd25WRzFoNEp4UGdTdFBXQXpxV1NBZ1lKeWVEbEg1YUhwZ1FmSUo0RUFY?=
 =?utf-8?B?WUJsaTNKYTkxR3diZXFOZEo1ZnRKSW9RSXRzZEtsbTlKY1p1ZEtKeE5kREpo?=
 =?utf-8?B?S2p6T0oyM2kzNzRrOFlkMWtZMmhZbzYwNnkwem9sMVpmSFlFNE45cCtYRFJ5?=
 =?utf-8?B?UldUYkFEcnBtcW1RcS9aOEp0RGMydFhsRXhuT0pGUGpNMVVObG1BbjJSQW1o?=
 =?utf-8?B?Y2pkNG84Z1N2ck9OSlZxSGx6ek9UaTlucmZhcWpKckdQZG40RjRVc3U1Rncr?=
 =?utf-8?B?WjE2dUJGeXJCOEEvaXNvMjg4Rm81enJ3N0VqdFFhT1hnODAySFNBQTkweVp6?=
 =?utf-8?B?QnFIc1J3ZDdiazlXTHAyZ2poZWNFOWcxRUNleGdwNWVvUytQeHFvb0Rtc1R4?=
 =?utf-8?B?MnpaQ0xKVURlUGtlSCs2ZG84bGFSMStDZExPNHA1UXBpZnpVdjdnSE1vVS9C?=
 =?utf-8?B?enBENnZ6MkZxYXNBbjZzclZ5ems0b0cwdm50dFlFQ0p2VDdrdW80ajBMZGRT?=
 =?utf-8?B?OGhJa042KzFtd3dQNVQ5ejhYY2dScWJGMG1MOFA1UUI0Z0JJNzBrL3RaUGdX?=
 =?utf-8?B?SzdYS3NoZlNVSVpWTktVMUg2L0dMSnJ1MkVYRk5DWk9oQ3Zram9veTJnN1Bk?=
 =?utf-8?Q?BsLhWyFiLvd1OPatfoBY00HLO3+cgz8Y0pY7mXw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f679fcc6-5cd6-4bb5-8156-08d8d3ffbd4b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 11:24:22.0899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrMqZt5T+z2QqDPy2i8TK1hEMLmMiAuQbjDF5KcDNk76cP7kmcaP8Q2vNDhUAmXue3Mez6FqUaTIHsMbbN7GcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-OriginatorOrg: citrix.com

On Wed, Jan 20, 2021 at 05:49:11PM -0500, Boris Ostrovsky wrote:
> Starting with commit 84e848fd7a16 ("x86/hvm: disallow access to unknown MSRs")
> accesses to unhandled MSRs result in #GP sent to the guest. This caused a
> regression for Solaris who tries to acccess MSR_RAPL_POWER_UNIT and (unlike,
> for example, Linux) does not catch exceptions when accessing MSRs that
> potentially may not be present.
> 
> Instead of special-casing RAPL registers we decide what to do when any
> non-emulated MSR is accessed based on ignore_msrs field of msr_policy.
> 
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
> Changes in v2:
> * define x86_emul_guest_msr_access() and use it to determine whether emulated
>   instruction is rd/wrmsr.
> * Don't use ignore_msrs for MSR accesses that are not guest's rd/wrmsr.
> * Clear @val for writes too in guest_unhandled_msr()
> 
>  xen/arch/x86/hvm/svm/svm.c             | 10 ++++------
>  xen/arch/x86/hvm/vmx/vmx.c             | 10 ++++------
>  xen/arch/x86/msr.c                     | 28 ++++++++++++++++++++++++++++
>  xen/arch/x86/pv/emul-priv-op.c         | 10 ++++++----
>  xen/arch/x86/x86_emulate/x86_emulate.h |  6 ++++++
>  xen/include/asm-x86/msr.h              |  3 +++
>  6 files changed, 51 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index b819897a4a9f..7b59885b2619 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1965,8 +1965,8 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>          break;
>  
>      default:
> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
> -        goto gpf;
> +        if ( guest_unhandled_msr(v, msr, msr_content, false, true) )
> +            goto gpf;
>      }
>  
>      HVM_DBG_LOG(DBG_LEVEL_MSR, "returns: ecx=%x, msr_value=%"PRIx64,
> @@ -2151,10 +2151,8 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>          break;
>  
>      default:
> -        gdprintk(XENLOG_WARNING,
> -                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> -                 msr, msr_content);
> -        goto gpf;
> +        if ( guest_unhandled_msr(v, msr, &msr_content, true, true) )
> +            goto gpf;
>      }
>  
>      return X86EMUL_OKAY;
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 2d4475ee3de2..87baca57d33f 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3017,8 +3017,8 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>              break;
>          }
>  
> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
> -        goto gp_fault;
> +        if ( guest_unhandled_msr(curr, msr, msr_content, false, true) )
> +            goto gp_fault;
>      }
>  
>  done:
> @@ -3319,10 +3319,8 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>               is_last_branch_msr(msr) )
>              break;
>  
> -        gdprintk(XENLOG_WARNING,
> -                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
> -                 msr, msr_content);
> -        goto gp_fault;
> +        if ( guest_unhandled_msr(v, msr, &msr_content, true, true) )
> +            goto gp_fault;
>      }

I think this could be done in hvm_msr_read_intercept instead of having
to call guest_unhandled_msr from each vendor specific handler?

Oh, I see, that's likely done to differentiate between guest MSR
accesses and emulator ones? I'm not sure we really need to make a
difference between guests MSR accesses and emulator ones, surely in
the past they would be treated equally?

Thanks, Roger.

