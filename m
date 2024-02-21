Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CDC85D70D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 12:34:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683974.1063607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rckr1-00034L-A2; Wed, 21 Feb 2024 11:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683974.1063607; Wed, 21 Feb 2024 11:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rckr1-000323-6c; Wed, 21 Feb 2024 11:33:35 +0000
Received: by outflank-mailman (input) for mailman id 683974;
 Wed, 21 Feb 2024 11:33:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i+Ye=J6=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rckqz-00031v-RM
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 11:33:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09ae7f58-d0ad-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 12:33:31 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.17; Wed, 21 Feb
 2024 11:33:27 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::22eb:b0b:62c0:f3e5]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::22eb:b0b:62c0:f3e5%6]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 11:33:27 +0000
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
X-Inumbo-ID: 09ae7f58-d0ad-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxRhdwy5Xq2euSxVx5Vt4ANXCB9HPfAAJl7ymv9dRR/mkZWuAcPgAKYVdQvw1EiBHMdZ94bwPJZC+fuXI/ynz30TEmmhLtQjLIUWqd4YgdpYB/RazFA9yWQwKTqhEXkboNz4+mSZP1/qQmJJCZE4c1ezKhPkJ7+FKg+fc0RBWQLsg++ZevOiYJCZ1O53KRJCbsS70MPmtuHX7TzsFgAVustaML/atXKQn9W03/5klHC+y3SRR9neDviRlDaIGcUolXnSp59mXhPa49Q4qJIawJRAXn6YqpkrxkYnmgX5osY5GOQqnJntXvLHqa8lhDRlJcjXYkSNUCQTYR4FyyWweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuYUIaR3PwI91XYPj4p6fO0tb69+oRj4kDID5JeBdm8=;
 b=K55rtfeVmWpY6wMuRvXHitKZdoALUG+rBEQpFMAIhmBe+ZIz0ELl3/i0KJiacSHlT97UYfCfTfgMGgPmMu+N96VGTiYoQpLN3AJNYSjgHr2Pl64ja42bLWEvoAL/heeZPBqG6a6aRtgOPTLOpsGzuk6ExMgk1BWPaFTB6Dq4KPrRCJReipWncM7+0lc0DXxGxd16Jq2jHxCdPK49BQ+NU4yIn9+ykcjaUncg9asSzVkKdrUK3Oje9XjXHuow0KoHbTlEp9XUjsdURMdnicQ3pfNLJ2INIClgaO3atCEUnX4e1EE18w5sxpzvy45f9IDSMmvwRE77+qd7BQCttZqLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuYUIaR3PwI91XYPj4p6fO0tb69+oRj4kDID5JeBdm8=;
 b=11G34yo+/OyVOoZPuh+IG0SVVhgKBsFepByMxNTpr2O3CiujT1me8OMttAnwqqjjXZ07I9coSYpgN62+DhcnZMsZs+ks+Q2fE5icNcY5CmQrCQHzR+R+7lomVvoDW8Ohx7KYTzcwDPShav/ScoAfOsEEpShCahu6k8hHODlg9W4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <62e047c5-a913-410d-9b24-e9a26d555d78@amd.com>
Date: Wed, 21 Feb 2024 11:33:22 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v5 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
 <20240220121743.3680715-2-ayan.kumar.halder@amd.com>
 <e3a8ce5d-841e-4ff1-8d23-48de822972ef@suse.com>
 <5f526deb-7376-4c34-85d1-d22b1b14d90e@amd.com>
 <e7c4b08f-724a-4419-977a-caa1342c47eb@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <e7c4b08f-724a-4419-977a-caa1342c47eb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0118.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::8) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MN6PR12MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb76728-7105-42d0-33a5-08dc32d0ebdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oLfY/29pcIMIM+C3ZwbH1FyB55im6uUFB4HLhSO7CUwJ+t2dKLBCJ1IQ3Cpxx7+KeFZFcww4e7sxo4hYi1Nv/FM/45DFzR3Ynu8ucGdLKN/5dckEgFhIoszub00BjT1fD7N1/CAkqnNgaAXmNPfGwxmB3EatGZze20j3qFj8KV35gjw+b+DFcf5dyqlz3v/8UeyV7ZcWccQ60znjDCrIxdyw+aGWLwVS5hpxsI57iNz61nyCV8UVjIcMeV6ZqErzPbSEY+ypEzskKfOD/CNZ1174gu//F7mswoLAvMjotfEAa0MdvYznvmu0txswDFjBOjaw5UjQ4ykMRHZVzgc21Djj1axC++x9Ub6qzu1POnmhfmNmsJMNGfi7kSsY76bctGzv2UUohQsFpMdo1iob9UfXX7GZYQVH6TJfALUAtPZDM7/keSAEwdZiTeEgueH9lnFIPnwzxctkz2A+Aj/wnUgKujIywn7hRIbGsiocAFGsse+4bviI+9gIbL+VgE09JMivBBiycpwFtmTYdVnvblcA9gthlExna/36hZmskyU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWVNODZSbXZQbU5Qa3Bld3E3SnlGVHhzM2YvRWxvbExaN3JNTW5ncVVNamRk?=
 =?utf-8?B?aTdqWEZHQ3JnYmxkRVVyditmVU1JNlVEQXNPWE1FeVBoMURSRzVKc3VGUFdr?=
 =?utf-8?B?YTFOekRZa3QvbjZ3bU15K29ueUlqUjgwUW9JdlZqTkRLU1NIMDd0QWF2emNh?=
 =?utf-8?B?bTB6WlZwbE1BemVzUDBCVFBXbUlGaWh1NFR2QVE0clh2RTRFZ28xcWFwYmpk?=
 =?utf-8?B?NFpHV3MwRk1HQm1lVHRCVHZuTFdGdTBGWCtpdjNMN09sbzF6Mm1ua01WQ1pr?=
 =?utf-8?B?K2FOMHpaQXIrYS9YTENDWTNrMnRBbzV0VHU1emNzUXV0OExOY3h5S0ZRZGNK?=
 =?utf-8?B?OUFJeXQ0QzFkUVNHQWxXRjVjVWFCSGZCd01DbkNCVGNKRlZCUkRDckROTDN5?=
 =?utf-8?B?WHBUem50akFSN2tpUDI2aldmYzJkbEh3eTYrZjlSa0pjcThEK1piWG1YL0lt?=
 =?utf-8?B?c3FEWUdPZDlvUHBRZUFqM0syRFNSTXZTWHJSL3dLT1BvV0J0VEZCaUk0VW1S?=
 =?utf-8?B?dDJWTE5TWDJoMUpUMlJKQ3lFby91MXpXU2E3SkQ5NUFxMmlPZVlyUHc2bkFy?=
 =?utf-8?B?NEdSS1FiU2pMOE5vbHUvaFZZbUEvbkIxYlNsUWMvQTNaV3E0ekE5NFRUbEpp?=
 =?utf-8?B?cTZFNDkvQ0dKN2hjdnViUGZIODBDNVY5YUExYTErU3JXVWtDbG9USUg4ZS84?=
 =?utf-8?B?Ym1yL2Z3MzFoRUJNVWdsbTFmUitkY2pLaVBVOU85NTkzMlkwZjBLUmZDaGJp?=
 =?utf-8?B?RWtnT0xRQ2hraUpPQlc1ckdJaUppaUEwbnBhL0puTnQ0ajVUZG51UU1RM1No?=
 =?utf-8?B?eFdPSCt2UFY5cEkyTTN6eG9JdmpaamdYaUxSZXg2Q1dOVDg4Z3RTMDM2OXZ2?=
 =?utf-8?B?R1h1alhGNFdDdWVVSjVBWUVPZGM3M3lqaVBaazZCQWFvNDZjWCtVb0RvT2R0?=
 =?utf-8?B?Rmd0dHBDMHB0TVRMR0YxTWhXV0NxNmJhbEdFa0xCcUVqSnhPZmtvcFVjSDdV?=
 =?utf-8?B?Y2E5bm9PejlWMzZVUVhIdi94SE9WVHAxV0J1aXpiTmIwU2k3NitWcVJnamhI?=
 =?utf-8?B?RXhlMW16K1l4dmpRMldNejVRamQ2WGt2YXhyNWo5ZHhNS1BESlNvSmR4Smdt?=
 =?utf-8?B?MWJ6aDFFTkU4dnlkRmRMUmUrU3dsckRpVEpBd0hFdG8rOVVBbXpTelF6Znpr?=
 =?utf-8?B?UThrUGdGaVlEVUJKMUV4K0tIUzhnSXowcXRlWVJxNklzdWhhdGlmZWZyTW5i?=
 =?utf-8?B?OG93UGxxb05pZ1JtaU80RXFoRDhmc2puQU5iNTY1RVRuNElXaHB3ZXEveG5H?=
 =?utf-8?B?UW9Ta2ZGdWVJaVdtd1BVaVBmZzJXOEI4R2xjK05Xbldtdy9ibjZQTzQ3d3pH?=
 =?utf-8?B?T3U2dzRwYzNyUVM1MnBtaHArUUZYdjFCTWJ2NDV0Y1pidm5yemd5cmxtS2lK?=
 =?utf-8?B?QTdOdEx2WFhOaC8vRTJjTTQvekd3a08zWGJxb3JCTFBFWGx1OFNicS9YVnU1?=
 =?utf-8?B?QkpLbFQzczNUSm1JYXU4Q1E1cGpvbS9qUHIzQ1VKbU1VbFRpc3EvdER4M0JX?=
 =?utf-8?B?T0wxVzcrNTlzTlVkNDJnUHFCZ0FDdFJGQUFEdk4wNGlEdnQ3VythSTVlOWFT?=
 =?utf-8?B?d1E3anBhZGlQc1pjM3F2NHY2WWFIZlFOQjJ0V3o0ZSt6U01WSU9SMnRvZFVK?=
 =?utf-8?B?R1F5TDQ3K0w0OEx3ZExUU1gxcUxqV2lycDdRUW9UdXVzRm8wUTFDbWxVeWR3?=
 =?utf-8?B?bEd0VlJGMVpvalAxb3J4RnZ2RUdCd2FLTjNKYkNmaVlwSW9BQTRQaGdjdHJ4?=
 =?utf-8?B?Wi9zYzJ3TmpaMWFWd1ErZ0tha2xZUUpFc0c4OEtmUjBlTnhlNVo0ejBxR0Q4?=
 =?utf-8?B?QWllMGdmYzgrTGE5YmtCT2c0TGwwdmJ6Zk5NaGtzR1c2RDB1RnNOYzVjZVkw?=
 =?utf-8?B?cGFhNjRBdmltaFFpV3ZUUU91bkoraWUrT01RZHJjanA3RnZ0Nm1zbHRsTE9m?=
 =?utf-8?B?NTQ5MEFJQStjOXBYbzNTTFFUNWJjcmhPSWlJd2VGS201bjRNd2xpOE96RmVS?=
 =?utf-8?B?UWFxSWEyOHR3VkRuSzlTTTBMTyt2OE01aDFhcTJJZkVoNUFEdmhXdU55emQ3?=
 =?utf-8?Q?FleBc7yqzNcfAZT5b52tCHCr5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb76728-7105-42d0-33a5-08dc32d0ebdc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 11:33:27.4003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s852zYdR57eO/k1YQhSjxGS8d9fk2Yl8DUhg7jnfpJwY4pKFk5vvBPiI1iYfMMd1AWqcYcKCeRGWJo4HRgDUFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490

Hi Jan,

On 21/02/2024 07:09, Jan Beulich wrote:
> On 20.02.2024 16:22, Ayan Kumar Halder wrote:
>> On 20/02/2024 12:33, Jan Beulich wrote:
>>> On 20.02.2024 13:17, Ayan Kumar Halder wrote:
>>>> --- a/SUPPORT.md
>>>> +++ b/SUPPORT.md
>>>> @@ -101,6 +101,18 @@ Extension to the GICv3 interrupt controller to support MSI.
>>>>    
>>>>        Status: Experimental
>>>>    
>>>> +### ARM/Partial Emulation
>>>> +
>>>> +Enable partial emulation of registers, otherwise considered unimplemented,
>>>> +that would normally trigger a fault injection.
>>>> +
>>>> +    Status: Supported, with caveats
>>>> +
>>>> +Bugs allowing the userspace to attack the guest OS will not be considered
>>>> +security vulnerabilities.
>>>> +
>>>> +Bugs that could compromise Xen will be considered security vulnerabilities.
>>> ... the odd statement regarding in-guest vulnerabilities that might be
>>> introduced. I see only two ways of treating this as supported: Either
>>> you simply refuse emulation when the access is from user space,
>> I am wondering how do we enforce that.
>>
>> Let me try to understand this with the current implementation of partial
>> emulation for system registers.
>>
>> 1. DBGDTRTX_EL0 :- I understand that EL0 access to this register will
>> cause a trap to EL2. The reason being MDCR_EL2.TDA == 1.
>>
>> In that case, if we refuse emulation then an undef exception is injected
>> to the guest (this is the behavior as of today even without this patch).
>>
>> So, are you saying that the undef exception is to be injected to the
>> user space process. This may be possible for Arm64 guests
>> (inject_undef64_exception() needs to be changed).
> No, injection is always to the guest, not to a specific entity within the
> guest. That ought to be the same on bare hardware: An exception when
> raised has an architecturally defined entry point for handling. That'll
> typically be kernel code. The handler then figures out whether the source
> of the exception was in user or kernel mode. For user mode code, the
> kernel may or may not try to handle the exception and then continue the
> user mode process. If it can't or doesn't want to handle it, it'll raise
> (in UNIX terms) a signal to the process. That signal, in turn, may or may
> not be fatal to the process. But such an exception from user mode should
> never be fatal to the guest as a whole.
Thanks for explaining it so well.
>
>> However for Arm32 guests, this may not be possible as the mode changes
>> to PSR_MODE_UND.
> I'm afraid my Arm foo isn't good enough to understand this. On the surface
> it looks to violate above outlined principle.
>
>> Let me know if I understood you correctly.
>>
>>> or you
>>> support that mode of emulation as much as that of kernel space accesses.
>> Do you mean we support partial emulation only for traps from EL1 mode ?
> Possibly.

Now, I understand you. We will allow partial_emulation only from kernel 
mode.

So we need to do sth :-

if ( 'partial_emulation == true' && '!regs_mode_is_user(regs)' )

{

      /* partial_emulation logic */

}

I am ok with this.

And the updates message will be

### ARM/Partial Emulation

Enable partial emulation of registers, otherwise considered unimplemented,
that would normally trigger a fault injection.

     Status: Supported, with caveats

Partial emulation for traps from userspace is not allowed.

Bugs that could compromise Xen will be considered security vulnerabilities.

Also, want @Julien, @Michal to comment on this.

- Ayan

>
> Jan

