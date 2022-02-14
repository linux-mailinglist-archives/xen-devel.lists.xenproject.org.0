Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2841E4B5354
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 15:29:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272353.467163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcLz-0003lU-0r; Mon, 14 Feb 2022 14:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272353.467163; Mon, 14 Feb 2022 14:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcLy-0003je-Sh; Mon, 14 Feb 2022 14:29:22 +0000
Received: by outflank-mailman (input) for mailman id 272353;
 Mon, 14 Feb 2022 14:29:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJcLx-0003jW-0k
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 14:29:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f0660d5-8da2-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 15:29:19 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-VfYtNkhjNmSGPpGLGfsHsA-1; Mon, 14 Feb 2022 15:29:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5459.eurprd04.prod.outlook.com (2603:10a6:208:116::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 14:29:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 14:29:16 +0000
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
X-Inumbo-ID: 7f0660d5-8da2-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644848959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X6c2VvmCjoUnDipzgF/yaesQiubn3pS+lmse4WPKWYc=;
	b=bVTFFhQWRevl42fInWipes0nkQq5dZH55a7lborteLMi66kh6oHp5RFkGz3uJdzpbK0wNz
	SnndXa+fbME3ECTP2k99qhdMP09z8k+6fv3wL0uDWFvcEQBr3KhMyRIKb9aVwT5aBYECyI
	58G0n0SidjHPaXBOYIEFNYVttwtapc4=
X-MC-Unique: VfYtNkhjNmSGPpGLGfsHsA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asbXfbwqwnNaR9QDxNPrtDzF1TLBrXk5UrYpE01kO5OKkSuDgi392zsNWcbvz8HvPrDv/rOgj37Zr0061Z/yKh7Qvknl0Xdce313rAi9Lzisf6MnlbOEWykLDpXbuaqd3sb66Zjqy6z2xHufxnuT1Ba/NWat+tPkh9DWoUmSSnRMYMAIF8nc6QmRwUyQoIyq6ssLqsWrkwlQdwvhZMl2ZKO8M1WqSYUfinupOG1Pfe61jFKK2HSYdULYi1cMTCEvfb7JnYvhnqfbAZ3Apr520Q5m5Lyci+vylP01NlIz1bmT6gpW0L7pIpXMHooRAzTeXRwdHPyNQV35hMQrmJTSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DhAdFIRQ7//ueyN6KriKfgTlylAZvihmnGTOEt9kgU=;
 b=HJkneKkhVppQJm0BZ63/R3F55vpd9i6kGyGZJ3ekE7LTdcbDj/saRYM2acWWVcke3NVPP0a3AwTeMlS2zYje/VpacAev9/y5oh3nzqztgtbLbd5InDIgiP/4okDYOS/DHr1flfkxnP6zMHwBYDHr5j15K6sTv9Ul/c5Db45XZOj0R6XiQWBSJQq/E0Q3jLs5oap5fzWEZ0mFDthKb6/qvQxsaeZ9+cG/SngrE3YcMEgS6vc+GAx4pGhB19TsbtSrt2Wv0MQwvVdoPuImbSIBIJdTBbDuy0T92+WA1ijOVjmjyBxy9gKzfbDB1C/mKIFZ+X3ZRJNdwxcCYB6224lKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09069049-9b9b-2f74-eca3-fd17a766ba15@suse.com>
Date: Mon, 14 Feb 2022 15:29:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-3-jane.malalane@citrix.com>
 <YgKXrZ/U2XuECG3d@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgKXrZ/U2XuECG3d@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0265.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df00c56e-38e1-4ac6-f95b-08d9efc6613d
X-MS-TrafficTypeDiagnostic: AM0PR04MB5459:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5459CF15EFC9E12E251D6CF1B3339@AM0PR04MB5459.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AEnaC7hxGIyTc8H7uF+W3Bue3lvLgG2tV64g8fvO8ThjAV9UPfBQjwxTokGsaKJmCbgBjARNk7EriBwnbrCNuikyTPGM741Z+ZRxRKTGow7NQvtVC1pEDbKkEaAZXgeMZedDVUgjMh1Mk/hwvI5OxwumPFRmBeJCZsYy9PNDzobk8mF4dHGAWclsMVzMBb6rpAhp63kIyseLwAojjXvCswnH3EafGG64peW/OpCnEW4fZypMjLJrJ75UuzGggRowDj90M4y4LJds6DP6FvAR/D06McwcV8Wq8AGYwSKhyhpkjqziNDgoWV5pB192xzoEctIX4joNOLx3qkV75MbddKbzffuipZ1tcO2289wm+d0XiVjNk3/nnA2HE7RjW2rzvKoMrclhkI6w1ODqyqCpOo6UD0S4etspnnJ84rAt7xDCaLE5lcCNIOtcXWOnDxwTvNGnqqaJkJ2K/1E7rl0aNjfaR9LBQqaZIHhX1zUXyqOKWfjsSC4+SAmFdB84IqzIsEFtCyXowzcBDzbIW4/iAAVWl+gcdmIlRMHLLCgIbCxpLy2qNeFIUSUJIck5o817OM8n9jM1oLWi5dEhazjpx3UPIWMVZQL7L9kFwfZ/wbdyXX108lVPrexcNtmXpwV7C9yAfnZTdPJLAaQFp8pKLtZkBNtePSeY9X3H95VT/36EsMepkWEYyYFlr2a2VtGg1BORbuxYkYRtsJrD00SRFkU2fqily2OS4oqRuxIggWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(66946007)(31696002)(38100700002)(86362001)(66476007)(66556008)(8936002)(8676002)(4326008)(508600001)(6512007)(6486002)(6506007)(53546011)(2616005)(26005)(186003)(316002)(5660300002)(7416002)(31686004)(110136005)(2906002)(54906003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eeZcMyKcywstsiH6jWJPZuqCgl25+T05ZScnODYJykJcFtoFQ6bzbUMrAIJe?=
 =?us-ascii?Q?1vR/IQ6Q1rolhlmMyV1wEe2AA9VOLHHzseHT5JNqylHDppnZTFaJD9Z2w7ox?=
 =?us-ascii?Q?vmRnsyFBoLONYuAuPZ2bwTChFTIuszuWa3bMJQYtG8rRO5iONJkmBa1pi91B?=
 =?us-ascii?Q?EcF7EpBtqcCx1rd8vFag/km0cl9EcBDTkVLFywUSzuqI68/VH/wGBhUqicKg?=
 =?us-ascii?Q?3csTtQBks9z2BgLuC/iyymOlADCYJgQI1bVesbO4EA8Ot2AdLpnZbmsKqthg?=
 =?us-ascii?Q?oXrKNUW9Fh/OW+/o8CZWitjhf33hmNuPOXIe6T5I7IqDWwdA6xLAuZ7AfY+r?=
 =?us-ascii?Q?LTMXdc+JX4eSAgRf9JhQTqAscW+UsrpCXLwdXl20O6RXRqNWjPHGIE7xVBjA?=
 =?us-ascii?Q?3OEbhDxEPBG1gnshTzLkgJcaVtu7FryTfeay+K9Sh6tHG+QlPhCRJDkQE2uh?=
 =?us-ascii?Q?VzRYikUCVmYvcHxncpGSf5E0ZMn2OFcL3V7iI88vF5bSAyGNmnAAoFfX1i1B?=
 =?us-ascii?Q?7S4jGrumFgQdpbDUplTuF4aYmQ9tco1saXMOtd3FOQUlkYAwZ/EyohWb/kNb?=
 =?us-ascii?Q?coQFkSAobTIS5rmWFjfRJora45BboAysnRDIrDWKLlYwLUQ9pJb+OzHFrPR+?=
 =?us-ascii?Q?eRj/qP4DWL3cZBO/g/GGdLn77LmNAFGL1XxBN2OMSmhUXoaQjnH6BY9pWXPI?=
 =?us-ascii?Q?6PTOK5UlYuiWes+VlVwGTpOMHdtiENKzyFog7zMbeavG1m1E17RxYzKBRf4e?=
 =?us-ascii?Q?12GHTSZCRUqCQQHZ8SQmCyPtBLTwqpF+Y2xvrsVJPstq7i2LqBdwLxQlbtCs?=
 =?us-ascii?Q?KU4Fa4QZ630eVT1YX6O56vnYk2uZ1zplDFYM07G8Sti9f5laW2pvO8+yg6Ja?=
 =?us-ascii?Q?PmNV9N9Xft6BxeFyrW5jVvHnwo3qTF5pg5GhpNmtZPwaOWY/1A+x2PO2ANly?=
 =?us-ascii?Q?K98Ur4dEYGGShBYtmJ8gaDtLx2LIHXg7eNRaYyQfPcF7O+wNvPCFKLownbKK?=
 =?us-ascii?Q?OGefDeJI5p/IDSOsUoljfigsX8h7/2L8wUxmG3DZOOspJtBQS/Jlov5QWpMe?=
 =?us-ascii?Q?OguYtiHBu0V8jlc4cBwuBV2EkeUP6jZJ4EJWbgxq0PtlDzwlNzkmqTOnsUV5?=
 =?us-ascii?Q?oO/dpks1EI9UcdhiU8p0Nc+t2EUy3hx2sSTFF18B69T3/X4WuuePzamXM47k?=
 =?us-ascii?Q?w4ZHL3be6jAML/ejmEtQKRp6iFOdp/r/ljJFQICv+jPWQ7S3xMBUjAsfyvLY?=
 =?us-ascii?Q?L5x9D1UkjfEJDbf+6XdIN/dIyWJGWPFZpqYf7mJ5+v+MwnXcBVA3ZRB+fZ/u?=
 =?us-ascii?Q?z50x+qrhSUnq1djcqs+C91Wmq4wskx9YrjD/XFY0cArnaNWANchb16H8Wwmm?=
 =?us-ascii?Q?HYGMwC10gTREJVZzs2p0LjLElxkTSUleyv9L73qWAELuWyhdAc1yEPVZLfHp?=
 =?us-ascii?Q?QQoOsst+HVYW2OiZClBHlQz5d7uCvTPdxUJU4HxfRyGfldAkbMoxcG6VZJ4u?=
 =?us-ascii?Q?HfB2sHYie7DAhirzU2zyB5icRd1Mjr6+FN5o0nUNO+o0enxV8Fh2ffr0Pg/p?=
 =?us-ascii?Q?GWhk6y8cfr9BKx5loSaXtI8SVImI5KCe3q1Mjv8JfVC3kp36f7fdF9rJ6qzH?=
 =?us-ascii?Q?R9snaQp36+3/ItTnrmgOaZY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df00c56e-38e1-4ac6-f95b-08d9efc6613d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 14:29:16.5212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+DI/x2cqabCaEOoMz9kf3CLfnTK0+nSntQlklvdZUpTuYdLc9lNyUUKJllfX84ZGBHPPSnjpeCEogEjPNWfwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5459

On 08.02.2022 17:17, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 07, 2022 at 06:21:01PM +0000, Jane Malalane wrote:
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -1115,7 +1115,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v,=
 uint32_t leaf,
>>          if ( !is_hvm_domain(d) || subleaf !=3D 0 )
>>              break;
>> =20
>> -        if ( cpu_has_vmx_apic_reg_virt )
>> +        if ( cpu_has_vmx_apic_reg_virt &&
>=20
> You can drop the cpu_has_vmx_apic_reg_virt check here, if
> cpu_has_vmx_apic_reg_virt is false assisted_xapic won't be set to true.

Along these lines ...

>> +             v->domain->arch.hvm.assisted_xapic )
>>              res->a |=3D XEN_HVM_CPUID_APIC_ACCESS_VIRT;
>> =20
>>          /*
>> @@ -1124,9 +1125,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v,=
 uint32_t leaf,
>>           * and wrmsr in the guest will run without VMEXITs (see
>>           * vmx_vlapic_msr_changed()).
>>           */
>> -        if ( cpu_has_vmx_virtualize_x2apic_mode &&
>> -             cpu_has_vmx_apic_reg_virt &&
>> -             cpu_has_vmx_virtual_intr_delivery )
>> +        if ( (cpu_has_vmx_apic_reg_virt && cpu_has_vmx_virtual_intr_del=
ivery) &&
>                 ^ unneeded parentheses

... this also wants simplifying to just v->domain->arch.hvm.assisted_x2apic=
:
The apparently stray parentheses were, I think, added in reply to me pointi=
ng
out that the check here isn't in line with that put in place by patch 1 in
vmx_init_vmcs_config(). I.e. the inner && really was meant to be || as it
looks. Yet once the two are in line, the same simplification as above is
possible.

Jan


