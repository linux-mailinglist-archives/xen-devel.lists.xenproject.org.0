Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7102C2F7E75
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:44:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68189.122037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QL2-0003nK-Sp; Fri, 15 Jan 2021 14:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68189.122037; Fri, 15 Jan 2021 14:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QL2-0003mv-Pq; Fri, 15 Jan 2021 14:44:32 +0000
Received: by outflank-mailman (input) for mailman id 68189;
 Fri, 15 Jan 2021 14:44:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0QL1-0003mn-71
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:44:31 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9740dd82-27ff-481a-be22-c435400d684a;
 Fri, 15 Jan 2021 14:44:29 +0000 (UTC)
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
X-Inumbo-ID: 9740dd82-27ff-481a-be22-c435400d684a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610721869;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=a6oy4LYl7nckcxvBvy7t2wD04/ZXs7YKnEJYAq1eaW0=;
  b=AA/TVELQDdSMaAaUQjLZ8F29CtMOyJmMRZYntfjLeK6gxXQmrILT1850
   swlx84Wp/LVLK4Q+kuwNLeAZ51kPgLt++qg95qq0Zq//iRQvl/ucV2rf8
   gxm+cmvDilfe8AWQMgINnQnnDey/yVqQJXE9kNryagRTf3h8QA/SBnatM
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Q1SVD+uHkm4e/e/jXYgZEtMutNbqDUUIB9EkytamFYc2lxaewUIsUTXBfpQNyTjha7nS25MvnD
 oTCG2dvvIcE0Qakyxkk7GSU/daFwaRVzX6xqAdy9bZrKYxNYnl7GQORj+LzF7xF7Nqv6HH5BJQ
 KhwgZ2By1HErUf2MC3XIYBwO2W35ILVRAADl5uo6yYPFMhMVX4I7TAbkQYGqyreGIChMh2oECR
 OvH6F0/lT1jN9MH9pUc37wt3+d8xna/+drUBgvEy+eNc6zzO9ztVU3BEMWxPkZRIKalk+OxlTb
 IuA=
X-SBRS: 5.2
X-MesageID: 36471054
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="36471054"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bz6TJyeEgJeaQ33w6NUXtnKcJUM7OgjdoSoxonoCXlV9QpbU1WyaqUBhV0iSYx9n4LajLUdDOk7FrfGPrEV3gYbORNN8tRaFEmymqaREW6S8Wevcc4MyhxNVDDCMa9aJ7Fq48zYqqUP/RTMhYE+k2Nuds0KPhbm3YK2KfdlE7V+ypJG1vZkGSELo8eX29nlb+bHxL/FVpxgF/d3U1DXNdIjh4n4ZvtrZ0SeOW6xqemv+NBjSe/L7cX9KxdUCNhr+mv4SyiztPpOl7Hj4qTIHEoOX83UvHFh401XRQdifXVqFJm23z4gFm+lTIwcarZVIA+khOildBh07+U1OjkN+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bbQhR6YzVwSKrJm+LuxmgY9h6W5Ng6OgoocsaITNrU=;
 b=BhtfYWBq0tDTxW5tliJHaiPq5aWfjzV4ADUmGNb5yDnS9ZLc86gBYu183/JMk1v3wrfjxEg7gb9f5wqzUncd5O77Sq4DJQAvLFKhMVCvjjaY9AJ9hhGC+qsWegiB6dpRc1cKrwH/wOboaP6a7eC2Vk46iFTWMMpUwltNShrb8huN1b097rhypQppMiq3oU+KVwCIPL05Rg/xTGZAXgyq8M6i4EZGEYzw6a3mUb3zBlzF4WDeU0ehk6tHwMQSbdKVHSuxLRQOijz12HynIrLqbpa7TinHAIh/EUdrga7bdIoAPMWG9D007UQx0zgtT2QApKPtKQ6wAKDKtO6lF7uzug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bbQhR6YzVwSKrJm+LuxmgY9h6W5Ng6OgoocsaITNrU=;
 b=dExUubxkH7BXEbRPw8R7ODMr/SvEp+I0mvOuucACLkBIhV0aXJ6EpKoEokRbbXMyBOzuqQkxA73paUeJ3OKau16d6p38jruoVrmZQIQXy4rEEJ3PurjCx/81wM+DuM0MYcMCyZfmGIUUW2QjpQwPxAHIrQYkmtlwmfZVVIu7H7M=
Date: Fri, 15 Jan 2021 15:44:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
CC: <xen-devel@lists.xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH] x86/vmx: Remove IO bitmap from minimal VMX requirements
Message-ID: <20210115144420.bcz7l52h2zs4ml34@Air-de-Roger>
References: <570e73b83c18cce4dbe4c70cc14b6df7c33f0502.1610720991.git.hubert.jasudowicz@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <570e73b83c18cce4dbe4c70cc14b6df7c33f0502.1610720991.git.hubert.jasudowicz@cert.pl>
X-ClientProxiedBy: MR2P264CA0169.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::8)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1aca08d-4f72-4576-ad90-08d8b9640e10
X-MS-TrafficTypeDiagnostic: DM6PR03MB5337:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB533707774BEC155B05432BC18FA70@DM6PR03MB5337.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cInVGdPGe6lZUA+7XWfhV7Fjg/tODkfM91X8JNjxZumx9pQ4DdEqOCAelQA0wI5vUVomFrWyUjO3cveSl3M2ABsFHFIFdb2NzrwvPLMbeo31fHAeBgA3jIrOr2SpJ0iVzqPsm7xsXqjm818gaNohHfBDrTzsP9qnX09QNaf4W+sQHoj5n/Wq5tGJ+Te2sztDuszXZl8n2y2qMel+2KzlumJZZbjxPjrgtZYXxF3jTJYTQyhcrD1C3g+ySNupMsLwloIFXEiHnsdwkmHRe6LnxmDgAXQEp7UHbH0KuoVarGJgMtlP4vArknUDmgabTozETZfjrxpkiNX5p8HoFaYIun22x5uO39C6BKv2vuRxWNEuaCnTgQiw6axtz4OGENA5m8qMsdOK3qNAmwEcnsGhemEnm5u/eDH77rl2UB8Wyr3b6dlW+l0P+yUWjj6C1q9dtLO8/rpuqtlwqUMFSb3u2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(4326008)(83380400001)(26005)(8676002)(316002)(5660300002)(966005)(6486002)(33716001)(6916009)(186003)(16526019)(956004)(66946007)(478600001)(6666004)(54906003)(66476007)(66556008)(1076003)(2906002)(9686003)(8936002)(85182001)(6496006)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bkpiSTk4SkVhUXc3ck1YZE83bXI4RFNvTVdWNUxqOXplTXBMOTlkc09SaFNB?=
 =?utf-8?B?STF1K0lpYTFnVUtUYjBMY3J4TlN6L3Z4YUFtdFpZQ3ZtQkY3VU92S2pyK0oy?=
 =?utf-8?B?NmdNYkp6ZHdaNCs0S2JxUzlzZC9STWxodXZYRE8xZHRmTzNXREZId3BkcU5D?=
 =?utf-8?B?cDZ1YTJXWUs2aWY4RThtRWNSQ28vcVQ3dFVMQU9meHFRenlNSStTdDdEUXg1?=
 =?utf-8?B?em9qcitQbW9oOW5DL1hBc0krNVZiWkZuSHNST1lwSlJyak1ZRGZ4V0Q4MThI?=
 =?utf-8?B?VUdzNVRoQ3podHgwK0ZycEF5aFNBb2xpK1pndnQzUDdqSzhENWxtS0hnQkVM?=
 =?utf-8?B?dEFkaGhSU2dONDBTV3BoSzdQU0ZqZGkzdlVYMjEwVWV0UXVCMWxDaENaOUw3?=
 =?utf-8?B?eWFCcFEwdTFTN2l4cXliTzRtelBOSHRnNENPWHFrSjdlL0orVTZEQkYxOW1U?=
 =?utf-8?B?SDlXaldBaE9iVFdicTJnNVJvREtpMGgzbEp6ejZJeHZUdVlhSzZsdStnV0Fj?=
 =?utf-8?B?b1BJV0FOaUJYa0EvRDcxWTRXSUVkMVg2NEpXNVh6RmVDRVY5Q3F2QUlMMG9M?=
 =?utf-8?B?STZqMDlFZlJWc1ZmT3VIdENoUHNyaUdPZDJ3UlFwVE1zUFRudkJBck1MQTdC?=
 =?utf-8?B?ZzBlekhrZnJwY0llMkFqWFpTRno3SDFieUxnaFNXZ1gyMFMwR0VYMS9CMnFj?=
 =?utf-8?B?KzdsQ3AreFFUNWI0cllxWmYrYTdaMEJFa0dMYnh4NVlvaHF0ZGF5S05GQUJS?=
 =?utf-8?B?SWxuV1FYVnZBbkh1RnczOVhlMDlFYnE0THB5U3BqTzF3U3FWTCtaYjgyS0xs?=
 =?utf-8?B?Mklsd3dhd0FBZDNJN0tXcENzRW0yK0ZRTFVDbGFWNSs2cXhxS3JpVk1BaWgx?=
 =?utf-8?B?S1grd1poMlMrOWE5bTk5NmNqbmsvemI4SURtTzYzWG44c1dSTkk2cS9UeXN5?=
 =?utf-8?B?R0lnbDlsUXV3dGVKb0dHZzU5MFZ0MEprZXlJMXRrTE5DS2VLbUVyOUZRMi9K?=
 =?utf-8?B?ODJ5dnF5eFVtN0ZUMlhPZWtoM0xHMnhTbkRrYTMwVlg3aXhuMENDQkI3US9F?=
 =?utf-8?B?cE0zQ0szM2lNelQ1bW1pVHBrYzk2SFI5dXZNM1ZzYXdoUWg4YVRpY2pNTXFh?=
 =?utf-8?B?cnU2Q1EzOUFGVXhUZWdWQURuenZZakw4Mk9wb0hzaHB2aFZaREg0SUJPVmhG?=
 =?utf-8?B?cWhhSHkraGc1WExXWVpaM1RjSC9zdkgrOW9nWkxDbGMvR2VHa3kyeng2K3BS?=
 =?utf-8?B?RUE3NkNrK3V1VlJDOUk4Z0EzZjBlVG5zSXFpb0V3UitSZmtPTmFEQWNTN0ly?=
 =?utf-8?Q?JInJIl3ZjKN3Lz437TBR7NdZCTSqQIP/tF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1aca08d-4f72-4576-ad90-08d8b9640e10
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 14:44:25.7802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFWTyz64Cfmq47+4kwXXfbE8vbYZajGbykx4iGyv1lkvcUnESn5l6o0THD8NEtVMcTTyamoWjGjlnoJ+zCyAFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5337
X-OriginatorOrg: citrix.com

On Fri, Jan 15, 2021 at 03:30:50PM +0100, Hubert Jasudowicz wrote:
> This patch is a result of a downstream bug report[1]. Xen fails to
> create a HVM domain while running under VMware Fusion 12.1.0 on
> a modern Intel Core i9 CPU:
> 
> (XEN) VMX: CPU0 has insufficient CPU-Based Exec Control (b5b9fffe; requires 2299968c)
> (XEN) VMX: failed to initialise.
> 
> It seems that Apple hypervisor API doesn't support this feature[2].
> 
> Move this bit from minimal required features to optional.
> 
> [1] https://github.com/CERT-Polska/drakvuf-sandbox/issues/418
> [2] https://developer.apple.com/documentation/hypervisor/cpu_based_io_bitmaps
> 
> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> ---
>  xen/arch/x86/hvm/vmx/vmcs.c        | 8 +++++---
>  xen/include/asm-x86/hvm/vmx/vmcs.h | 2 ++
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 164535f8f0..bad4d6e206 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -276,10 +276,10 @@ static int vmx_init_vmcs_config(void)
>             CPU_BASED_MONITOR_EXITING |
>             CPU_BASED_MWAIT_EXITING |
>             CPU_BASED_MOV_DR_EXITING |
> -           CPU_BASED_ACTIVATE_IO_BITMAP |
>             CPU_BASED_USE_TSC_OFFSETING |
>             CPU_BASED_RDTSC_EXITING);
>      opt = (CPU_BASED_ACTIVATE_MSR_BITMAP |
> +           CPU_BASED_ACTIVATE_IO_BITMAP |
>             CPU_BASED_TPR_SHADOW |
>             CPU_BASED_MONITOR_TRAP_FLAG |
>             CPU_BASED_ACTIVATE_SECONDARY_CONTROLS);
> @@ -1168,8 +1168,10 @@ static int construct_vmcs(struct vcpu *v)
>      }
>  
>      /* I/O access bitmap. */
> -    __vmwrite(IO_BITMAP_A, __pa(d->arch.hvm.io_bitmap));
> -    __vmwrite(IO_BITMAP_B, __pa(d->arch.hvm.io_bitmap) + PAGE_SIZE);
> +    if ( cpu_has_vmx_io_bitmap ) {
> +        __vmwrite(IO_BITMAP_A, __pa(d->arch.hvm.io_bitmap));
> +        __vmwrite(IO_BITMAP_B, __pa(d->arch.hvm.io_bitmap) + PAGE_SIZE);
> +    }

Maybe I'm missing something, but don't you need to expand
EXIT_REASON_IO_INSTRUCTION in vmx_vmexit_handler when there's no IO
bitmap support so that all the emulation is bypassed and the IO port
access is replayed by Xen?

I think you don't strictly need to modify EXIT_REASON_IO_INSTRUCTION
and can use the existing g2m_ioport_list infrastructure to add the
allowed ports present on the bitmap and prevent them from being
forwarded to the IOREQ server.

Thanks, Roger.

