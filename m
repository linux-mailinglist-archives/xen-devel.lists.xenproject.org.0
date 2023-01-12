Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5E2666BB6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 08:43:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475854.737718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsEP-0008S9-Fd; Thu, 12 Jan 2023 07:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475854.737718; Thu, 12 Jan 2023 07:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsEP-0008P9-C8; Thu, 12 Jan 2023 07:42:37 +0000
Received: by outflank-mailman (input) for mailman id 475854;
 Thu, 12 Jan 2023 07:42:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFsEN-0008P3-Uz
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 07:42:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2084.outbound.protection.outlook.com [40.107.14.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac896ff4-924c-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 08:42:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8936.eurprd04.prod.outlook.com (2603:10a6:10:2e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 07:42:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 07:42:31 +0000
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
X-Inumbo-ID: ac896ff4-924c-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkMgOd0XJmfbjlMJ8p7VTxFagW30Y6OKXGXHMz5HqA/SMJLGPqBjVxjgRr7GNkDxu3+ZlqfPyPPuNGjwNZvuMuLiaQVgM7AzfXnJRWKlW4xIC83dHK8bSmy9Qma6/oTvMz7bBz87ZMFYsyK50LGlA56VC+1RV50HU11DY5TTJi3e3RtKNFRq3KxSRl/UXcfc2Lrx1VaEdE1oPHuLz7ttazinwAe1dYWHzsg3lIUqgpEgHy/x4RE/GKDVHZbbwHHDXw8fOvVXXEsRPAhEwqR9WQciiMSKaI9o1YOSRk+ARBb1G5cXw5TReUnKXy1sqc3rGVTqb6Qz1gxW+29pKAH8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynWFmUUDTwFMF3VF0PVzuuKnBb1tVw4O41z9x4c9Hmg=;
 b=ED13Bm7XDb6/7fhGMEnjUbVMim+8EyQiHY5J+s35rF9nyB3eyuR5UMHXFfi3g+3miQYvJ0S1TN8tD4yIZ32ZFpNxPFwPU9At6RYX/3VC5ENMw7rQ5N7mR2Yf1bz/EDDGFJ6KabQNK+XgEwlaUI9qLAkLtrJzmxOig6oTOZJEcmPNjwfnclHfwclM2Ij6EnDMozBZYQay2S2o1Z3IOHQwmtqpxQSUTD0QMnh76/6AN6qj2wz/GWfuefMwkwRKHWJJyqyg/pwf4rn1z+D2AU3qCY2lzPxEBL0/45a/FJFmshDocX2ya+Wlj7+F+QXVdwy0e4SqCyis0Y4kpStI6RKTSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynWFmUUDTwFMF3VF0PVzuuKnBb1tVw4O41z9x4c9Hmg=;
 b=onhVBgryRSrb89w2hqXDOSU0nqEUIFxCqqNkQ6blp2CNBHdpbvtDVe0wCLjNZ1NAbV9O00Km/WqVEqgV+N/GWEyfsXq2jMW0RADrsgGMguxP/Qkr5ao+q95IsbegcGS8J8BxP390UusaSfNKsjj2jPvJ4V9Ip2qdAA7X9g3Hime1OxpQDooK1X0Xd8SIKVHOjifQF5MKyrQLc2IjsbeahgIc4HQY9/cXbRWDFSTof2jTEH6R/cPQdAdd04BL2Di8gBdOgbXE8Bb2RZpCuAqT2kbTmkFdqCcuS72FRq5B11ccNQ47vyLw1eCuV9LUal4nm+POETL2oNYNKeGNJV2g0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <70d620c9-7fd7-e442-15f6-af75eff33669@suse.com>
Date: Thu, 12 Jan 2023 08:42:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 3/3] x86/vmx: implement Notify VM Exit
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20221213163104.19066-1-roger.pau@citrix.com>
 <20221213163104.19066-4-roger.pau@citrix.com>
 <553cbd97-f667-1549-4374-9385d3d53710@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <553cbd97-f667-1549-4374-9385d3d53710@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ebb17b6-404e-4087-52a3-08daf4708fb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YUx+9Ac9957gBE0rKUEha7dn3rnhvmFURw4LODWz1G+8yjy/co7cMP746Zq0WiJEprUIbWv1yGCAtf1kFLrLokTV2Qa3WZTeqOBOA8HshTbnnJo+0HWJgBpXsduqRs4AXozBDv9vL6+UWuPyq2tofigUy7sILHHnPXvpkx4M16dbxIILHfdGA3IsOW1j3lFAD5JBcxBNLAAIwPk2keFzQtgo1ruxXx5l12/HHl95bO2A8SrD9odDc3093fzA+gCIBCfQ+j5M7D0bvq0IEwqdp47tu8dFcZoYmxsByeTVaISVU2lgIziwLxdAjcfKwQAT8lF6mEKPrk44kaMIazdp8f0/fyTzJJjtlwC9m+mLsfSMc4xMCOMPupMj/0PeCMy729La2pinpGT/vRwcxIKX4MNI/3z+TOHDTZIytND9WoMTG8FhD0w4YQbG0R/zvWxja2YjfsTsMGl0yDwi9bbQ6/mP4rW8ouxuBVVRmoaDeCDOVrDBr+SslmIuUMyQdznwVasbG48ClbKeRaa7NGxOQ/EpUK533u2/RCG2jHC2nA49pQp7Tquw1zJlA2C8ZSAIFNIu5+W/swF58AwQYFVl4wArkXIJ6Qh3Zm3/AJEcWV3Dal3oWuFS3nken1CPtNm7fXmF8NMFMnwxRNFh0NiOGM+iitNCOcQzlM2xoZCDmB88OK9slbh/C6+q6U3OURK3a9G0kTUY1PCgWaYYfj3soxwVzEQGLZJx/wHq6cpbGPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199015)(26005)(36756003)(186003)(6916009)(8936002)(53546011)(6512007)(31686004)(6486002)(6506007)(478600001)(66946007)(66556008)(5660300002)(66476007)(2616005)(316002)(4326008)(31696002)(41300700001)(38100700002)(54906003)(86362001)(8676002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mjk1VnFQS3FBWlJwUnp3WCttckNaVFRvbGNYRlRzSXRXZmhnK3h0b3J1WGxJ?=
 =?utf-8?B?KytXUzVTNVF1S2h1cERxcTRzSThzU01IZE1WKzlwMDBhdmJBK3E4OUJDZzZv?=
 =?utf-8?B?RFErNDJYWkVkMXFEM1prb2JYQ0l2NXIwY0g2UWViUEw3L2E5NEgrNDk3REZO?=
 =?utf-8?B?U3ExUzdKY3VQZjBLdTI3UndXSnV4Z0ZBLzBlaGVBOEUxeDVucXF3aWJSMEhh?=
 =?utf-8?B?ZFpncE9CR0wzUTJzNjhaMm9JUFh4T2pPT05SSE5FNFVQRzNQNmsrL0p3Y1Ez?=
 =?utf-8?B?ZU1YUksxSEdFbklKeTJBaTRSSE8rRGplWnIvNnYrMzFrbmxYL0Fxblp2OEUw?=
 =?utf-8?B?bnVySUVPTWJzWVg4a0hmTDJLMkFTRWlMV0lkUDRhT0VUclQ0dWdScnZjYmZu?=
 =?utf-8?B?T1JNZGFpTnJKdXFjWERNRlBjdnlRZVlQaWtnZEhEdVZwS0wvcmNhVmhGRUo1?=
 =?utf-8?B?cEgwbVIvT3F3dmxCa1ZqWjB6emVqcmtZbW9oUVdnQllZL1gwQkNlemNzSm9m?=
 =?utf-8?B?S0RSWHBIVVZpM0lRSVlyOS8vYVBxWDlGZG5xREVFamZGVUl3ZVFQV0RFUUht?=
 =?utf-8?B?NHpHV1RyUEI4SDYvVnBpMVVMb1EzaStOdGR4dU9JT1ZpQkRiUVVvdE1kNkF4?=
 =?utf-8?B?azVPWWlrczVSV3JXTlhIaGZWSTBweit6OG1LMGV6ejdwUHZGRUFFeUgrSUFh?=
 =?utf-8?B?UFFPaWo5c1pXaHRoSExZQmUyYTJpRGEzZlhtS3lnWHFyUUNnWVFrbThuRUt2?=
 =?utf-8?B?YVJrUGpSVWJ5NHYvZ0NSdmlMQ0xwRG1sMXVzeHYxbkhlWERuRVBLSCt1aDNV?=
 =?utf-8?B?aGcxd2hLaDZjVDU2Smg0dlgxU1l1bGVYQlJYb2FRSVBaQWh1dStkenVDdU1i?=
 =?utf-8?B?bDBGaVRWN25nelo2RGVWSFBvcHJQdXNoWDV0QVZVbzVjQURndWE2RVVyRnp3?=
 =?utf-8?B?WEJrcDVQa1dOQVdPS0I5bXJSb3ptTkZFcGVzMXF3Wi9UWlRHRU5uNjlTV2tp?=
 =?utf-8?B?TVhNR2VzODJNMTc5OXlDbzIvRDMyS2gwL0FKaUZGUjRINlNUZ2JCdm9YN1My?=
 =?utf-8?B?WlNOeGs1bXk5VXJpYWJxdHNUbnRBWmhsT2tRNStITmsxUnZOQ01PQWxzTzVO?=
 =?utf-8?B?a1JLM0FRTS9MZkVFUnVNSFh3cHh4WndqU2dyYjV3OTBxTlhLR1J5dVprclQw?=
 =?utf-8?B?L2VCK0NyTG9WbXJJaFhiRERoaU9DT0ZVampCblVJZzFZVDBlRktvcnJjNjB2?=
 =?utf-8?B?NS9hQ2I4Y21aOUtWZzFRZ1RlRnZicm1yMS9nZFU5a0FtN0JycXh1d2NRRHdw?=
 =?utf-8?B?ZGZLSWwyUllnR0ZQWFFRRzZsUjdWcFJkVDl5SFNrSlpmSCs0eHlJNTRDbzNF?=
 =?utf-8?B?TkIyeVJtYXpHTW8rK0s3UDdtTnVrc2p6UUV4RERCOWxmUUJaOFZDaEo3azYr?=
 =?utf-8?B?UmFVS0ZjbStlSkJHckNnZWFPZmJyYXV4UFRUc0wxdEhSMUNadzZrVkZVVjNt?=
 =?utf-8?B?REM3R1pFbURKdXhaL2EreDk5eEw5YTRKY3E3ays1bm1talN5MmpLNnQxcXlO?=
 =?utf-8?B?V0lyMWthZUprNTY2YlBlYjl4L1l6bmJ5T2RRZ3N3U0N3bGFTOU5lUWthZ2Q0?=
 =?utf-8?B?WnlKTUlrVFVZSGJjeHY0dldwc1U1ZXJtNDBQZG01cUhMOEtDeU8vbnhIVjBO?=
 =?utf-8?B?eGREc01ZVTBvOURId1Z0UlJEMzRPQjJFendiNkxyNTYyTkNoZXdPdk1KNGlL?=
 =?utf-8?B?aExNWVZkUnQzODAzRXNzbDdtQXJyQmJPbGFQOFlSRmhEYm03Znp0RVRTZkZV?=
 =?utf-8?B?OFdEWDhtZFFaVk9wckozS01NSjFiUjFTdGpMbnJsQTFRdlMyTmhncFQ3Ry9M?=
 =?utf-8?B?K2N5NWFJVTJFaHJoR3djUU1zRk40b3NtWjBoMHJyZjh4TGg5b2JlbXI2Y3Bv?=
 =?utf-8?B?S2xDTlpMeXlMU1JHTkYycldVUnpYTVJvZHlEenZhRHVneW5GYmRxemJJUXI3?=
 =?utf-8?B?eVhFdnB3N0lVM1dLV0F3MkdOYWdJaVpqcmJwZlUydEZMa3E0bHEyeE9OdHVC?=
 =?utf-8?B?TEg3L0p5QXpLekpFVXVjTGt2cVBXL0puSENueTVtWmNleFVlK3lTQWx2S3Jq?=
 =?utf-8?Q?Bq/6jabdE06F87+7GME7g6jrE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebb17b6-404e-4087-52a3-08daf4708fb8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 07:42:31.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCXIpTFGsUBO5JkVSBpQCA3MHDmBRADZZKgC2kY5VOs8YnMwHmaD+e7bVNg+JSCsEnkV4pJ1swVAyetyMWW+Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8936

On 11.01.2023 22:05, Andrew Cooper wrote:
> On 13/12/2022 4:31 pm, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -1428,10 +1428,19 @@ static void cf_check vmx_update_host_cr3(struct vcpu *v)
>>  
>>  void vmx_update_debug_state(struct vcpu *v)
>>  {
>> +    unsigned int mask = 1u << TRAP_int3;
>> +
>> +    if ( !cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
>> +        /*
>> +         * Only allow toggling TRAP_debug if notify VM exit is enabled, as
>> +         * unconditionally setting TRAP_debug is part of the XSA-156 fix.
>> +         */
>> +        mask |= 1u << TRAP_debug;
>> +
>>      if ( v->arch.hvm.debug_state_latch )
>> -        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
>> +        v->arch.hvm.vmx.exception_bitmap |= mask;
>>      else
>> -        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
>> +        v->arch.hvm.vmx.exception_bitmap &= ~mask;
>>  
>>      vmx_vmcs_enter(v);
>>      vmx_update_exception_bitmap(v);
>> @@ -4180,6 +4189,9 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>          switch ( vector )
>>          {
>>          case TRAP_debug:
>> +            if ( cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
>> +                goto exit_and_crash;
> 
> This breaks GDBSX and introspection.
> 
> For XSA-156, we were forced to intercept #DB unilaterally for safety,
> but both GDBSX and Introspection can optionally intercepting #DB for
> logical reasons too.
> 
> i.e. we can legitimately end up here even on an system with VM Notify.
> 
> 
> What I can't figure out is why made any reference to MTF.  MTF has
> absolutely nothing to do with TRAP_debug.

Looking back I see that the two seemingly asymmetric conditions puzzled
me during review, but for some reason I didn't question the MTF part
as a whole; I think I simply wasn't sure and hence left it to the
VMX maintainers. I think you're right and that part of the condition
wants deleting from vmx_update_debug_state() (on top of deleting the
entire if() above).

> Furthermore, there's no CPU in practice that has VM Notify but lacks
> MTF, so the head of vmx_update_debug_state() looks like dead code...

"No CPU in practice" is not an applicable argument as long as the spec
doesn't spell out a connection. When running virtualized ourselves, any
valid feature combination may be found (seeing that we similarly
may ourselves surface feature combinations to guests which no real
hardware equivalent exists for).

Jan

