Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAD760F248
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 10:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430919.683212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyCN-0006De-O7; Thu, 27 Oct 2022 08:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430919.683212; Thu, 27 Oct 2022 08:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyCN-0006BP-K9; Thu, 27 Oct 2022 08:25:11 +0000
Received: by outflank-mailman (input) for mailman id 430919;
 Thu, 27 Oct 2022 08:25:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cef=24=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1onyCM-0006BJ-6A
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 08:25:10 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd3835da-55d0-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 10:25:08 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH3PR12MB7761.namprd12.prod.outlook.com (2603:10b6:610:14e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 08:25:04 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 08:25:03 +0000
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
X-Inumbo-ID: dd3835da-55d0-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0tI6jApO5LhX/qOC5HjlxeTQw9VBwqEfwlmk0VTyiZN+GwQVfOL5+jMp0y92vUe5k0+fP1JL9tkoUwUZjdnOizYuytiro+5jff2KHVHbzRkpLr523xDd9pnve+TlZZSAQeDf9uVZM55+yT1ECeFmiubEfEfEuPWtWOP5iMQMXuf8EV65w1taNXuUk/d6r48bsFJq0zNntV5XJlzEAns2M8AC9VaPr9FKj/9OFqXNv2pV3ZLBoG3MsfzzJVgvdUdyKj+/EAQqLUyI8Ri74LGmcervuTIZM/ECBF+IK8itiKMKcKr6XzLk2wkGM5b4+fqn3f9u14Wp/3wLIwD9+UuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OH7IXZw1AMVPEQ5w6E9UYFsjfRKvPnGCpMJ4+VuD9/g=;
 b=gAKLXDjT186qlUKQaMFzHhjXdQGmf1wcb+ZVrDhNoLNwgsqzfThBFtUV4JHZ9VzLT8cSYdFucT96cd0/YB8+gI7CguNgqS3R0TwcPVqBTEz1UFCN0Pe0Hpx+dsvk+b2A6jC5UBLqIGWld19RzOApBbxfS9Q9daCeNHdfi4hj2h0bi+32B/v/oyvD4/FBo4dRxzilwtwZHkpt2Ds50xLp6rL7RVUhewrczY4dV4KrpDEQMq3vafUM9z/Pi0XS2qEPCHGinRaQafmoMgcJalDol8QyfgAaglAiiPyVwaaCGCxlo0LhdOKgESltH4QExsqTUf8UsXe0k21uy3Z25Keibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH7IXZw1AMVPEQ5w6E9UYFsjfRKvPnGCpMJ4+VuD9/g=;
 b=myo4tjOjaHaGgSI5zOX/myPkYDU31LeL8WMoIdmlkzTv63MaR5xlv6HF+8PAqRhze7q4HYHtaFqiU3tSAL8MIBDL/J4JofKcQNOWgOkap9xlzgvyfzwSLMtTDTDeZE0BAXv2NZaV3r4gdfQYfA3KrY5zYe48h8GuluOCMK8bbEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5367cdc9-3dc1-75a5-ed99-09cf24570705@amd.com>
Date: Thu, 27 Oct 2022 09:24:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v4] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Henry.Wang@arm.com
References: <20221026183004.7293-1-ayankuma@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20221026183004.7293-1-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0431.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::35) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH3PR12MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: eadfa6a5-a801-4a9a-2981-08dab7f4beef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oDeAKROVJMI2YDGoYlCLy9T0HL5lZgDCAuoP6WUj3jAu3xc/YQS/bYyx82ThoXJ4WdfnZcpzlE35Mw3/upN2n6nLscduyxRgk4Q9gTZQIeg/V2oeRZBc85Jidzo77ValrTWRZqzFYwlMhVgihUz2AH4DrnNDH1XpuXRMLyqP+OIZzGyotXKXdVroYTN8UMXhVQR5LWwInuNqA/iv2kCFi/u+ytTdxOy3R8Z7lBdtcu2U6O34zK1mpLWNWqV44Trif4rPh6DY9ibrLjvs3mlk3uCVpPvp/n2Oj3pXIue/nlhG6JcTy2Nn+b0Zd9SLXUOFv2dboHepbUHd+pomOgF4nU5te9Jj6XzdYE7S1gjsnebFhE4HaWO2BXvt9FRAnwXjBGhu0x3Cka32SvZThnvpAAFJibwe551SMWmZub2uVyDzXDjXNkxB0EkiZyhwBU1iWu+zxX2lG27TRVBO3iAl8wL3v93vJETUKxaDfNwyplyLS429z0MY6EM8Kp2DNQQUP9ltBEKWrc4ZgQ8nxuPjo7eaR6ZyMKEg13PP+4KH5b5pm9YkOdikjPXwLQJmY2UhIhij/mKD5grp9h/a029fzO3wX8cTR+dyf2RXsVreJUW/f0u2AWX4n2gyHu79Ka2FHX12kbfPfxw26kpV0hdZnaREVDvUWS+qcZQ7mBTswvWY3SKftpY4ozzEyBgOVSTGl/9mDY0uz0YL9+0cogKqjLKLht2S+50hFjYr3rVlcI9LFsgBl9DUSLh9gR3hemZakE1u3btVpCOo0hsLLRiz84LSibIQkXM7xRATWZUDKN0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199015)(4326008)(36756003)(53546011)(6666004)(66556008)(8676002)(66946007)(6506007)(66476007)(316002)(38100700002)(6916009)(2906002)(186003)(83380400001)(31696002)(26005)(6512007)(41300700001)(5660300002)(2616005)(8936002)(6486002)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1VQWkFMZ0hOTWlDcGluQURPVloxakVocmJOU3MwNktSdXFuUU85c1gwQVVh?=
 =?utf-8?B?R01URU00WkJPKys2YzVvMDIyM0VhVm1ZZjBzTGY1VE15Nlp6TDdRdE5DSVQ4?=
 =?utf-8?B?Mmk1RU9sV0V0UENCQ1B6MVhkQnFSUm1KQ1dDU0grQUtOdXhYaFFET2ozemNm?=
 =?utf-8?B?bUtqTVR2YWNWL1dQWmhpNHEyaUhhZldxNGx3R1VodkdONm5tRDUxc3B4QTNo?=
 =?utf-8?B?aUI0OHB0Z2ZMaFpFVHN3eUFWYnhLNHUzNGFWWWtUak5xR2pBSVJYMGFSS2U0?=
 =?utf-8?B?YlJUQTdLRzZXcVg0RCs1alcvVkFEVHI2S0VFSW9OY2k1U0JOUXBPbFRPSjhI?=
 =?utf-8?B?alVmUGUxRGc0UU1ZN05zUExVVWUwTmZ5U0ZUMDhlRWhpYU9hZitVRHRmdVMz?=
 =?utf-8?B?UTRlNm5UbFExaDBacDFaUzFKdmFlRFJqNk9lY1IrYVQ3L205dlhQWUdRQ1RO?=
 =?utf-8?B?bmFWWTh2bzlZQi9wREtXZm5PRFc5cURQb3ZGRXY4NWVDZzVVK09nTlp4UXlV?=
 =?utf-8?B?UDNSdCtVd0RqSktpRUhFR1hUZlVjTngxcnliR1hLUmNmT2lwUWhSUkpUQ0s0?=
 =?utf-8?B?QlFvRGtSSm05Qm5iWmRJQU1hb0NweURCL0pjci9qVEhZeEt3ZXNFZ0NVQkFF?=
 =?utf-8?B?TmRDQ1o1SnJaWXJkTXhuSFo2NGo3SmtUYmlkOXRUVXU0ek0zU2RSQXE1ZlZQ?=
 =?utf-8?B?Q1ZlVThqZ0U4RFRPeUtrWVFWQmhyRVNqeEtUZmFrOCtwMC9OTG1SR09KVTVF?=
 =?utf-8?B?a2lVM0RXLzBqK1NoMDg1aDFKdEFheWhNNTkrTkdELzQzaHk3REdROTZRa0lV?=
 =?utf-8?B?dUNlYURPcHU4NExsYktYWHpXQjVEUXRsdzl5MnlLZTd1OU1EMjAzRENvR3NO?=
 =?utf-8?B?MnZFK2xHUHBEVW5jamVOTlZlTTdQQk5TYjB0TjVGTStya0FLR244M29nYW9w?=
 =?utf-8?B?Z0FjdnBPcy9KeWhrSUNzcklCbXR4ZUZYQXI3R3czWk9GK2hvN2tXaXVMNHM0?=
 =?utf-8?B?OEVVRUZDTnU2YzkyMy9KVi8zd0dLRjNsZDVHTzVJQmFUUW5rUndGVWpKWVBo?=
 =?utf-8?B?L0J6UGYrb1FDb0NrTnl5NEg0MENMTFNLeWhmTXpWQW5tekhsZnVFUHZSMFlo?=
 =?utf-8?B?Q2VjOERlM05qNjYxUERJcm0vaE0vTFl1bi9VYlhMb3pPWmxjQ0xma0hramx1?=
 =?utf-8?B?aGdoaitqNVFDd0hhcEIzVy9JNVZjL21yTHlISTNIUFVjRTFYRWFqN2tiV2dR?=
 =?utf-8?B?VXB1aUp0c3ZuaVIzZllwL0k2dnZTSFVBWVppWWlrTHZrdW1BWEZLTC81c0I0?=
 =?utf-8?B?a0Q0anhGeU9qSVdwcTJ1WUlWTzFodUVpZ0hmRS9KRUF6bmFjVHk4SmdydXlS?=
 =?utf-8?B?UDZ0RTRrZzI4L25WNnhwU2Q0TzFYNnh4WWFsTWIyV0JpT29nNmQxa2YvZEli?=
 =?utf-8?B?T1RzVXM1U3dOS21MK1ZmRitma1lEVUhsZEZiUVNmc3FCeU1PSFc3YllQcEY5?=
 =?utf-8?B?bXFHbExacUJtUmRiMXJZSHRqVloyRmpDNDN4SDg0RjhwZUc4MDJIV092bTNV?=
 =?utf-8?B?RUNvbmpDaExpZzZ3Zm5WSlF6SjR2eEFkVUdmdnBsT205blVpTzFzRWhkNGp6?=
 =?utf-8?B?SkdhYkRDQXlqZHJFcmhCb0dNUUhXUGVyV2tPVUVia093bFk3aGZtejlFYlFz?=
 =?utf-8?B?ak4vMmE5a3NMS0t0cys0MWZLUXpBN1B0MS9aeitDWWhNRmRMcEQ4SXNYQndK?=
 =?utf-8?B?S1ZVQld0dVI3Z3JnTnJOaHhyK0xrbjdjRVNnMkwrOE4vVDVPdHc5bTQxRE1C?=
 =?utf-8?B?RjIrSXhxSXhib0FuK1h1K0t5aTAxK0NIUnNtMkpPQmx6b2I0c29RazNiTktG?=
 =?utf-8?B?ekUvZldzU1lNbW5jdnBYYUNhS0d3OTl3MEVBQWl3L0JQNVB1SzBRQUJEUnMx?=
 =?utf-8?B?ck5adk44VXZPWEFSc3AyTE9WcDJRWG1ERURSblpSOUhVZXRJQnF2L0tFQmFT?=
 =?utf-8?B?RStSWUNyeWZkR3BIeFBPZWJlUVd5WjR0cUhYZE5SUFk5ZC9rVTM1U1ZKVDV5?=
 =?utf-8?B?OFhiZDRITXFDTFdVODc3aG4wVEJkUVQzR2RyYXNTQWJZKzZOeVNwQ2JEU3lu?=
 =?utf-8?Q?g+lgQ9VWzua6PUJEk+HmzZFvb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eadfa6a5-a801-4a9a-2981-08dab7f4beef
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 08:25:03.2875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYA/ksGpXcZsgoA93gg9zZCSiXaM+WTa0zrgdkLsmepM0tI6Ag+o7deHxzt6d8hPYnAenKIFpRCfpDNNBKwjlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7761


On 26/10/2022 19:30, Ayan Kumar Halder wrote:
> If a guest is running in 32 bit mode and it tries to access
> "GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extract()
> will return the value stored "v->arch.vgic.rdist_pendbase + 4".
> This will be stored in a 64bit cpu register.
> So now we have the top 32 bits of GICR_PENDBASER (a 64 bit MMIO register) stored
> in the lower 32 bits of the 64bit cpu register.
>
> This 64bit cpu register is then modified bitwise with a mask (ie
> GICR_PENDBASER_PTZ, it clears the 62nd bit). But the PTZ (which is bit 30 in the
> 64 bit cpu register) is not cleared as expected by the specification.
>
> The correct thing to do here is to store the value of
> "v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variable is
> then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
> vreg_reg64_extract() which will extract 32 bits from the given offset.
>
> Also, we have removed spin_lock_irqsave()/spin_unlock_irqrestore() to protect
> v->arch.vgic.rdist_pendbase. The reason being v->arch.vgic.rdist_pendbase is
> now being read/written in an atomic manner (using read_atomic()/write_atomic()).
> Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and 
> property tables")
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> ---
>
> Changes from:-
>
> v1 - 1. Extracted this fix from "[RFC PATCH v1 05/12] Arm: GICv3: Emulate
> GICR_PENDBASER and GICR_PROPBASER on AArch32" into a separate patch with an
> appropriate commit message.
>
> v2 - 1. Removed spin_lock_irqsave(). Used read_atomic() to read
> v->arch.vgic.rdist_pendbase in an atomic context.
> 2. Rectified the commit message to state that the cpu register is 64 bit.
> (because currently, GICv3 is supported on Arm64 only). Reworded to make it
> clear.
>
> v3 - 1. Added read_atomic()/write_atomic() for access to v->arch.vgic.rdist_pendbase
> in __vgic_v3_rdistr_rd_mmio_write().
>
>   xen/arch/arm/vgic-v3.c | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 0c23f6df9d..1adbdc0e54 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -249,16 +249,15 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>   
>       case VREG64(GICR_PENDBASER):
>       {
> -        unsigned long flags;
> +        uint64_t val;
>   
>           if ( !v->domain->arch.vgic.has_its )
>               goto read_as_zero_64;
>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>   
> -        spin_lock_irqsave(&v->arch.vgic.lock, flags);
> -        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
> -        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
> -        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
> +        val = read_atomic(&v->arch.vgic.rdist_pendbase);
> +        val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
> +        *r = vreg_reg64_extract(val, info);
>           return 1;
>       }
>   
> @@ -566,25 +565,19 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
>   
>       case VREG64(GICR_PENDBASER):
>       {
> -        unsigned long flags;
> -
>           if ( !v->domain->arch.vgic.has_its )
>               goto write_ignore_64;
>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>   
> -        spin_lock_irqsave(&v->arch.vgic.lock, flags);
> -
>           /* Writing PENDBASER with LPIs enabled is UNPREDICTABLE. */
>           if ( !(v->arch.vgic.flags & VGIC_V3_LPIS_ENABLED) )
>           {
> -            reg = v->arch.vgic.rdist_pendbase;
> +            reg = read_atomic(&v->arch.vgic.rdist_pendbase);
>               vreg_reg64_update(&reg, r, info);
>               reg = sanitize_pendbaser(reg);
> -            v->arch.vgic.rdist_pendbase = reg;
> +            write_atomic(&v->arch.vgic.rdist_pendbase, reg);
>           }
>   
> -        spin_unlock_irqrestore(&v->arch.vgic.lock, false);
> -
>           return 1;
>       }
>   

