Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2356260A8DF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 15:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429113.679946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxF7-0004xM-4h; Mon, 24 Oct 2022 13:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429113.679946; Mon, 24 Oct 2022 13:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omxF7-0004vR-0v; Mon, 24 Oct 2022 13:11:49 +0000
Received: by outflank-mailman (input) for mailman id 429113;
 Mon, 24 Oct 2022 13:11:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1omxF5-0004vJ-Dc
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 13:11:47 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 683bf440-539d-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 15:11:45 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS7PR12MB6023.namprd12.prod.outlook.com (2603:10b6:8:85::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Mon, 24 Oct 2022 13:11:41 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 13:11:41 +0000
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
X-Inumbo-ID: 683bf440-539d-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5d1VlAymniBN9mKVDJBbS5V+tCH+mMI/C3fJkVptyOm8dXFUj089I3HHXGF6yqVkkrXrvkc4epH68R//0SXxMkQvvKoFwYXMx8ZY9RTxGQjIoPuY4psNLXg4E2X/rwg2OfVG0Rj5NnNxMVbwkaWM+KuXySx0rDEzOqL9o86pyj60l1nu5FnYhRq2kADUUwVNXH7WkgKws5IOtBRzg7Epb80cSD/ixcu5lFTOK/7pJWCIZmgN3qoSVkUPf72xXq/OzvGLsqXk1OWh3pYtJckAkfY5unt7QO83aaI+rebv/KlS69wYEtCpaQneoFhlejHp97NZw+23YeWVI0WAXjyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBItgm1w+sMKoFUqkZV+1XlL9+Y668dBbVjjrOuktUc=;
 b=ULfefAMP9L4RFAVuYy7WqSxzdqalJtJtoEiaZYawRF6WrTWHa14MqFOap4a96EYE4f5TdfbNEzT7xxN473Ov0/MpxiIeJKweJv9NcukBDMqAL+tquBdMeMnE0ak1Qr4gkF0DIBoA1ufxhmkulAUpdcMnyuRzJW6C/R6BAoORZmU/wl6sGM2feHfCjm8KV/swxxrJlJqmJPWoEsXzPLhy1KMGr+wOLrM7R4QV3mWmieO17H7tmK/fERKigk/IJTnl4xbc+6/WgeyYMgC0MfWNAZgeM8jyhqXBmkQeHIKzCTIP0wvsDPxniahD1UjB9AwnndTi9h94Fwz0cmKfbnlQRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBItgm1w+sMKoFUqkZV+1XlL9+Y668dBbVjjrOuktUc=;
 b=mqSLbKPOA7ucWAOzNkQQWx1UKuO6MWPE0RPEaFSZnp8OUhMIGcG523lysE6EnAc/MibE1HqB4vcdMSmnnXfFughy1aia7lrwNvE2LS3oMgMJtyTP3ODfVDFrO0EaEOAYxmiGuRTHZrZRCGzpO2Du60M6c2mpKIcFPN/dH9E/aw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ba43677f-903b-f30c-76e4-1668cdab2cc2@amd.com>
Date: Mon, 24 Oct 2022 14:11:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v2] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "stefanos@xilinx.com" <stefanos@xilinx.com>, "julien@xen.org"
 <julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <20221020104146.29841-1-ayankuma@amd.com>
 <AE2C68A9-4276-444C-B227-F079D330EB8A@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <AE2C68A9-4276-444C-B227-F079D330EB8A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::9) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS7PR12MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 779faba5-8a43-425d-316e-08dab5c14a9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	plWqi1NiMF8Y9httFs89QqS8T17N7278FCMZhOM2h+/w0Pl8wfir3Khons6N6qcjpA0c0Ef6dAmJ1zg4vbQ2PuB0FnPxnPi+1urI2ft52jkNdnHWPpJF/xOF/Vpv1Lui+cs0zqP7Sun4vgh9tL7Y9hgwFK+IEkK9D5eDATyKhCFH59An+A245opmtY87pGfKpokfbmBbWF1mo0x/jeqPLhmGX9PiHQFth7++OpcQr9jwgHqGVmztPT203SEGTjJMclwP6VW2MtRYCvR76Ewd2RgTbZ66VyqozLtWC9m+dU8NJz1zf5ykCd+c0uGkUsHrHvhXpolGQ9tvYVObsfsseRf0mTViCb5SHMwBSlAHIhUell8h+2xxeeQf1BMVR/max7y/Ay3LadPdS5JPjJVhOfAk/JWwqvsI+ajiUKfRyDzFLTASgW8sxXmODkGlh2OlY7y2IjRpcdlfK/i6PtCMfLZjX7KIhnrYix39a0B/USKX6ddfg8evTpF14OADLu5Vx1AUJmcS7HM4KCO3qug/qQxZUbUPgd+IeG/Sy5nc9Vdl39VjmxORqujRcL1kUJtF+GHlnTPd/kZDBsI2z4hy5zjZmtsKbzqdV5LZOO6Kwc3sekIPtUDbrCIjdN+gK1epwdTTBgocpIvrnyCJgmsW3RntwU7iO5wiwwrinztZqPEq6IEYouKve7XHEjFHWprv8c8HbXO2DVWagRea3o4CBvxNHXhI3TXBLNYBiz9bX79di1sT17plKr+AddlD5bIWFPwfIe9HmTeVN9hRMTfypQadCcF9F/7wnXjPbYLZj/jb+MrPW0r+T4lZvQPXlrRx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199015)(4326008)(31686004)(966005)(6486002)(478600001)(38100700002)(2616005)(6506007)(6916009)(36756003)(83380400001)(186003)(316002)(54906003)(66946007)(8676002)(6666004)(66556008)(66476007)(31696002)(26005)(41300700001)(6512007)(53546011)(2906002)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUN4YWd4bFFaek5ZVXpnMGtsQ2N0STc3cXJWY3FuNlhFVllXMVp3MFR5NEc2?=
 =?utf-8?B?b0JubzBPUzdydVhvbGFDZ3UyU09mZms4bXdqaGZielVZeS9yVEVnK3FnYjJi?=
 =?utf-8?B?bFI5cWxmL3RhcnZ1NWRoMU9MT2gvcXBjL1ZlUlVUR3FLRmdUd21uVmxMeXcx?=
 =?utf-8?B?ZG9aeWJkeTBDcHkxUE1SeHZEdFk5ZS9CcCtURDhyVnVjcjhaVC9KUlRvVWFF?=
 =?utf-8?B?N0JpYnlwSWJ2aUNFRGJTa2N3eFFKRWlTczdDZk90NVlTbVFQWnBpOTRUaU10?=
 =?utf-8?B?VFBpekF6SnRac21DWHpMc1dUYVZibld0NDdDNXVzTnFnaU9GeEZoYlU0aEpt?=
 =?utf-8?B?Ly9yeEEzYVRLaE95OXF5T2hDZm41QkdHZml2bXdZaE1yaUVGMVErck9LMzIw?=
 =?utf-8?B?M0NzSVBhNytSSVA1WmU4bG5KS215amVNV1NjNVVpT21tcWtRMTlYM3pPVkFS?=
 =?utf-8?B?Q29aUUZJc1laTHVhaE82VDgrenlwaFZIWWpMcU9UNStmMC82VWJOMFNMbDVX?=
 =?utf-8?B?QUFJdGs4d1dHTkpkRm81QmhLUzluWnBDV1FHcG9ONFlLWWxZazFBZTRVdklD?=
 =?utf-8?B?QjA2MVlMSjdURUZITFVuL2ZidTJaYU1qc0c3SWttQWplajdISUVQdGhXclV5?=
 =?utf-8?B?V2crS0JwVW50R0ozdnZWWWxyaE9GVjlvNzlXTHhKenIyS25uYnZqcnlQb1Iv?=
 =?utf-8?B?djNZeE4yRUFCSUx0UWZ4VTRyMEFHWXcwQ0FGYnJYODdJaysrbE9tOUN5a1d1?=
 =?utf-8?B?YU9SYXhJcjZzbHhpVDRnd2RnVmFLcTZUQTdrWGJmN1RaZElDSzMwNkRSTzVC?=
 =?utf-8?B?WGpkWTZvZWxNNEpEakNTQTZrRkVlTWU0dVRVR1dxVG10Nk1Nd3JMWkwvdEhw?=
 =?utf-8?B?QnpoSUJ6T0xlenNtZWFxMDJXS0JSWHNmVGNZRWlQVEZrVEV0MVJLdW1OYzJh?=
 =?utf-8?B?N2NqOG55TkFhSVVzbkFXTEZ3ZVdaUmtzNGlrc1hObThUQXhJR09kT3NYR1hB?=
 =?utf-8?B?RFJRMU1sK05HM3BaK0MzQkNZU0dpOHA0VVVKUnFydGFVNlhCditjWW51UHpm?=
 =?utf-8?B?NUlvMUpBdm83Z2pmSTUvcjMvOXFFeEFPTU55aGdwdllMWkhyQ0tmai9ZY2JU?=
 =?utf-8?B?SkFBZ2Uvd2VEVkhneTl2QVhoWGh6ejR1NTZRMHdBaXFISnJrVjVBdFA0Y2d5?=
 =?utf-8?B?cWJkRDUzOTNZTURMSjJEZk9qUzlhYkVicXo1TlVVeWRqOUdjcmM3ZUVpb0Jk?=
 =?utf-8?B?VG9HWHU4ZkV1M2hyOEdvOExwM2J3QnJocnkyanNNU240NlBlRk9RY0doZ2d0?=
 =?utf-8?B?M1ROdlZTVjdacjIzeWR1NStwbDFLZFVjRGZCcGNLQmp3djFwbVk0SnJRWXdN?=
 =?utf-8?B?RStmTDExaDM2d2pJb3dpaFNBRldkNWF5Ymd5Q3hnb1E5ZE9XeEdnVDZRb1pi?=
 =?utf-8?B?WWpxZlJ2ckwwN01rZVhpZGkwWXI4aU9IT00vc0prOWFRZEhJb0hBalBBWFhq?=
 =?utf-8?B?ZGk3SE9GRGp4bElvUEZJMWZMc3Y1a3AwZ3JUWng1eVM2dWpFL0hTMitaZEhy?=
 =?utf-8?B?UThiVEpqSERLQldVUkx0eTlpTWc2SWt0VWV4QzZDYmd1Z0prcHMyTlF2MTlR?=
 =?utf-8?B?N0ZRQngxNjRMU0w0eUpMS2I1Y3ZpWks0WHlUMS9vRitqUGFIbmh0cWcvS0ZO?=
 =?utf-8?B?UnpWKzQxUTc4Z09VdElaalh4YTJVYkF1VCswTWlvdFlIRXRmanh1YW42YVl3?=
 =?utf-8?B?RUFMUzZ6Y3NDSllGTlh3T3NaYlFhR3kwaUJKVG5sd1g2RDRFRUFXUFMyc2Vw?=
 =?utf-8?B?Z3pMZzY4MjhQeWU0Y3FYMkRLSFRzRS9tOW9kVGI0QkRWUXlMcEsrc3Y0U0FC?=
 =?utf-8?B?MExaT0dIcXdyaWdkOHp0djJOb2Q5VXpLQVdyS3E2QlZ0Q2dFbHAzYjJ0aVhQ?=
 =?utf-8?B?bHcyd1ZEZHBEUFFPdDZUQUkvNUlraFZ3Yk5IYk9oQ2ZMK01VWk1mNGxXNTVX?=
 =?utf-8?B?ZjJHRm5QeXhkeUdEaHBrY1VsSmxHTVAwSndxQ0pLcE8xaXhkNXRMQzZHdFcz?=
 =?utf-8?B?S3N4bHh3Q3RLUW9ldWo0ZW9Dc3VINkRnQkNSUEt6QUh3eU1nUm00cDdDZ05o?=
 =?utf-8?Q?tx0UIrbmTvroPzwVUPORK9zqk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779faba5-8a43-425d-316e-08dab5c14a9b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 13:11:41.3846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAkpxaoojxPsU5Biw45f7rHPsVsepdYrAEP917zcgqcgSE8507Bhdz/md75SEZUl4eUdfu2uP5xhF3sPGrJrIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6023


On 24/10/2022 11:06, Bertrand Marquis wrote:
> Hi Ayan,
Hi Bertrand,
>
>> On 20 Oct 2022, at 11:41, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>> Refer GIC v3 specification (Arm IHI 0069H ID020922), IGRPMODR (similar to
>> IGROUPR) is relevant only when the guests run in secure/non-secure mode.
> This sentence is a bit misleading as guests are always running in either secure or non-secure.

Oh, my understanding from the comment "We do not implement security 
extensions for guests" is that Xen does not allow guests to run in 
secure mode.

Also, does Xen itself ever run in secure mode ? I thought it was no.

From https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions

"The primary requirement is that the hypervisor must be launched in 
Non-Secure Hypervisor mode only."

> We should just say that we do not want guest to change the group of interrupts so we do as if all guests are running in non-secure.
>
>> As Xen does not implement security extensions for guests, so the registers
>> are emulated as read as zero/write ignore.
> I would rephrase this as “Xen does support to run in secure mode so emulate all registers as the hardware does in non-secure.”

Do you mean ?

" Xen does *not* support *guests* to run in secure mode so emulate all 
registers as the hardware does in non-secure. "

- Ayan

>
> On a side note, the question might come at some point if we support to run from secure mode on hardware supporting it, it could be that dom0 or Xen itself would need to modify those.
>
> The code is ok, just the commit message would need a bit of rework I think.
>
> Cheers
> Bertrand
>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>
>> Observed the issue while running Zephyr on R52.
>> Also, found that KVM has similar behaviour.
>>
>> Changes from:-
>> v1 - Moved the definitions of GICD_IGRPMODR, GICD_IGRPMODRN to gic_v3
>> specific header.
>>
>> xen/arch/arm/include/asm/gic_v3_defs.h | 2 ++
>> xen/arch/arm/vgic-v3.c                 | 4 ++++
>> 2 files changed, 6 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
>> index 34ed5f857d..728e28d5e5 100644
>> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
>> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
>> @@ -30,6 +30,8 @@
>> #define GICD_CLRSPI_NSR              (0x048)
>> #define GICD_SETSPI_SR               (0x050)
>> #define GICD_CLRSPI_SR               (0x058)
>> +#define GICD_IGRPMODR                (0xD00)
>> +#define GICD_IGRPMODRN               (0xD7C)
>> #define GICD_IROUTER                 (0x6000)
>> #define GICD_IROUTER32               (0x6100)
>> #define GICD_IROUTER1019             (0x7FD8)
>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>> index 7fb99a9ff2..0c23f6df9d 100644
>> --- a/xen/arch/arm/vgic-v3.c
>> +++ b/xen/arch/arm/vgic-v3.c
>> @@ -685,6 +685,7 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
>>      switch ( reg )
>>      {
>>      case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>>          /* We do not implement security extensions for guests, read zero */
>>          if ( dabt.size != DABT_WORD ) goto bad_width;
>>          goto read_as_zero;
>> @@ -781,6 +782,7 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>>      switch ( reg )
>>      {
>>      case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
>> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>>          /* We do not implement security extensions for guests, write ignore */
>>          goto write_ignore_32;
>>
>> @@ -1192,6 +1194,7 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mmio_info_t *info,
>>      case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
>>      case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>>      case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>>          /*
>>           * Above all register are common with GICR and GICD
>>           * Manage in common
>> @@ -1379,6 +1382,7 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
>>      case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
>>      case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
>>      case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
>> +    case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
>>          /* Above registers are common with GICR and GICD
>>           * Manage in common */
>>          return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
>> -- 
>> 2.17.1
>>

