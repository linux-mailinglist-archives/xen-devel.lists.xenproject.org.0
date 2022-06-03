Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A638D53CA8F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 15:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341507.566736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx7DJ-0006Nk-9J; Fri, 03 Jun 2022 13:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341507.566736; Fri, 03 Jun 2022 13:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nx7DJ-0006Lj-6V; Fri, 03 Jun 2022 13:19:41 +0000
Received: by outflank-mailman (input) for mailman id 341507;
 Fri, 03 Jun 2022 13:19:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MD4n=WK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nx7DH-0006Ld-TH
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 13:19:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d16cfa5f-e33f-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 15:19:38 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-VNSnLDjaOB60QQMAvBzc1w-1; Fri, 03 Jun 2022 15:19:36 +0200
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB5309.eurprd04.prod.outlook.com (2603:10a6:803:59::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 13:19:35 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::7577:8567:33c7:685b%5]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 13:19:35 +0000
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
X-Inumbo-ID: d16cfa5f-e33f-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654262377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VOXCvtqmBtZIAq4CJH2vDsiKigZEDIZPjycWIf0etV0=;
	b=a0DXQfH/ayh8L08uYKgvUafBTVnT80kABZz1nPQnHr9RzfA3KKBQIGTU44kb3eKuOVMR1F
	nmkEKzJiT/G3+6RlcPXvokG21YcHCbLQv9tAl2YbrYS+jki7fESll4eBrw2sxqJzFeDAAf
	qfNnP1OykuC2sq3QnywNKz00BuFbs18=
X-MC-Unique: VNSnLDjaOB60QQMAvBzc1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXXDN2sidmKop24wFKXERRx9qhLL1bz6vAwVuAPqdV5pGEA93H4b9gyyuEq4IienxiX69RI/PuBk61LVE49pXBCYJ9gEG/1+AM/bcSNs8W4rWote0Nw8ermmcHnwlC8JGwN/fl0ZDSqIwIN8CCyc1OfP8Kr02zlSoRG+aqJvsZ2Rk0kL/8vSmyPEvX1fWOhMmx3VkNuWBBYUWitWrG23FAGwncGFJeV3Bzmw842b45xrKcVAgyrrtqsT2IMvT32OMY0lUmKI91+cNsDNgnEKqKa99z0g2LogTJeMU6GmuNtVLQTRH7hNj6AKxumJFRnwgJzdhVch1KoePKC+ASvH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvziG45W3IYoT6P5Sf/XiRelkbBtO0LL+8k2buESsbs=;
 b=KlRjZ+IJyzR2q1JnNcoWZaJBQ03Iu0KFky0dwAvmOoCgYKvW4ZHeGsbbaGQQkc9yXm58G5WCVGc3Jiu/X8V09FqbmVON8QrPW8QmHcjmelwbhVn7FfULbs2vDp8nQ35Dbr0lzYnflyUW+VAo5aa0nZDbhBb0Zr2zFgEOzeTPCsR5rI2YfGPKpayOjuIlfJifOMl1kfObOnonF/FUKqdtTUFiHlq18xO/RitZ7CThjYUXnMXokwUg/AOT1+PhTMiljGUyTgh9NMyw26nBYC/6QQdHs8vk33eK1EHLRGCVm3d5tWAqUK+k+oVOGKu4jewghkdkp3W4HMAtGLa2g06I/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85dfc48f-3440-1e6a-dc44-4c2bb050184b@suse.com>
Date: Fri, 3 Jun 2022 15:19:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RFC 1/6] x86/ioapic: set disable hook for masking edge
 interrupts
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <20220421132114.35118-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220421132114.35118-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR07CA0047.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::23) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34d7b6ee-2bae-4d4b-1e84-08da4563b42a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5309:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5309BAFEBCCCE2866D219335B3A19@VI1PR04MB5309.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yXaNW2mBFK/3uYmyo5yKAIKHC0o8Iwo9PzNkESb5dTkUMFzbsGXuw33sRoGYa2S98S8ps9WgcS6K56Kcle/weSn7nSgvZhZTruTlRRvcjqyXaD0uaKQdP0jehG7XG0RKK/xpam74H/bnVPIHtjG0AM3VtyUb6IAwnSqUYwTPRTIjwPLeGkqY3/bFlV04DQg/c+HriC4IiRNWbhrrs/WscL5bt6KscCpM1bNwrhzQSXULVbWl9Hr95rXiHM8jVs7JElBPEIpp0+CP0MgsaIuNL58K+EPOrsUFtPIfG2jHusdZce7QPqRVx2yhq2nmvA7dDyWnTxkC/XjiCRTHBfWAHKCrNeJDw1ONZBGl9PxeHd90U1GeDve+znA6t5zVStH01YKKrx+fa+3sF3zvv2TiRritJLaOXU1aWvIw+xsOixknSyb/txS/Vdq6bbXsK2R+618WGiblYE/VSbIOClTiaxp932ZTSwA4iQgFx2vvpnltbxO/2PIO6sMzD8wDyBcBUkMoZQjOqWkdXt3UrLt2uIuP4Pihc6M7l4B3r1rK1IXCHBkY9ryWKqDEXQsUmsyqedbbHV3WkMpb4w9Qnyeeuyd14p031lkz1NAmtyVhGzLOetbMr1JINE76/29Na+HNbjbFONXTZfHtkhJZX8Cl738N6mhnO9XeIX4MCJ5PerKp8h0zI6hMINBiRrTvfGq2nqQuNcuwzEHdYsBRyaAgGJIiuyEVClMbFk9AkTjqTyw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(4326008)(316002)(31696002)(53546011)(2906002)(186003)(86362001)(54906003)(83380400001)(6506007)(6512007)(8676002)(6486002)(508600001)(5660300002)(36756003)(31686004)(38100700002)(6916009)(26005)(66556008)(66476007)(8936002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DRYXHKquR9JvTiEjcpOyeNZ7GlkKTvNuEUXrfsBF1VHERZJsByeNEeQDBjD8?=
 =?us-ascii?Q?4P5NJTBKue7msyBLFUCEMA2VsM5/8Ktvz4wWfHxse9W1XWnEE7SElTyUVBXv?=
 =?us-ascii?Q?XHvruxUv33st0mUR2CNJT5Tcx6jvmPXhdSoqzuBpumLk9O1uVbfjPqlvYFpf?=
 =?us-ascii?Q?73pRBZQKKQsriTgT/f9mCc6Ds5133aYi6lVwsFf+hYx4rBEsM1nzgYiVNCuc?=
 =?us-ascii?Q?+GbAeB09o3ZBjPas5sYV1yJC9prQKaDm6p7fkU/CN4HjsU7WUhIISVLfn6j5?=
 =?us-ascii?Q?cwPJMxZg5/EHBwZ6zh5W0EfHRcdbZ2hIEG+VZzqMQyrTjLbYwuOxHwum+02H?=
 =?us-ascii?Q?sVFOcmr/2WZf4KjQyaolNzhq5Gq1mdBwpRvcdajqZWYU77JLEf09Pn0cosSX?=
 =?us-ascii?Q?FouSDqZ6SJ4+uua1ceqUyJfcxD+7X4gluht3U9N1HraGSfxF2rh3J1aDWwx8?=
 =?us-ascii?Q?u/M0fIf7GhQ2hhEcIdTWx2yJkXLzfgIFSoE+GP3zGHDbXLgswTzutqek5egQ?=
 =?us-ascii?Q?11tf36avZkI+I844Ns2a/TKGU8mkKH99HQP2oAZbAEQRPXzQlnKJ87/H2OcH?=
 =?us-ascii?Q?1jcFJP3F7QpW4mB0Q14btzBE8j/kRnV29BLk2HJsW6miBRRr4xTkYvedD+Ut?=
 =?us-ascii?Q?+Oa23Pxl1x26kUT8mGU3CDPKgY+xo2URCSEkFZGmt5ye5mzwxwu89dIno+OQ?=
 =?us-ascii?Q?/uT1k8ty/UY8yrXxItBo2ycI7r/F4QI5VhI7qBKIGoaHGM0xuUAo9Z67cULu?=
 =?us-ascii?Q?ypE06fMXpNgwEUikUdlNWS5dzjOzazcPyVp5wXQTWd/fVHYL01dE9KmF86pQ?=
 =?us-ascii?Q?ek89UfPudxZtI6RFGzMzR7j8IKgUtQvpdANDuU9pCZ3FQq7Ax0j9Iy3rNxe1?=
 =?us-ascii?Q?sq77UWT79og3k6EuQXX/oUEbblY2Y8r/w1GDGDUUNFt45DRiJ0QU9mQ1agHW?=
 =?us-ascii?Q?fgPMcl0tak3QG3yCOeAuzm3gz8TiwPcNMSrarlQv/LFeTm3l2nUHYRsG6J6I?=
 =?us-ascii?Q?f2OhoMesel34eE3s07oKCp+ncd9oIGkLkXeHoxs8+RsXn835Gz3T73ubfgK9?=
 =?us-ascii?Q?9VRvIpdaCcDRurMGgQUTYtTzFp+76lNJrJ4+WgHNw1oo+H6Kf6habzNd6/ER?=
 =?us-ascii?Q?tZZIIc7jdJM+w8qZ2gKVsAQdu5ft4zQANVP0eKP4/ofIm13yhudEhFEuyEst?=
 =?us-ascii?Q?ktWIoApDb7srz+szrM0Vbi1ZbxG3rdMYU2y3Jz+j3TPPzWKam7/7DN22xU4p?=
 =?us-ascii?Q?Kr4tohYFeVQloZENDjHykBHGlGKNetjDSIARLBDRyEzLIGHOyanwW/nHYtEH?=
 =?us-ascii?Q?mXNwAVJ+Cj9HUERa5v5iUjIPUlOstK9aL4/P/erbAKZBoKehHAp+x3H7bdx2?=
 =?us-ascii?Q?csmEFC/9+hdffNRfm5lUvreAZVDqe60guNnAExjFeCF1D72Ml1sgARO9RwZr?=
 =?us-ascii?Q?vLec8kqZKY93Yj236w2VBGiY2MqUbBQlieiQjhWid19JsoCmLKb/u0hEYjua?=
 =?us-ascii?Q?wxdIUed/86DXBUpVie6hWPXytGspxzdAGK8t7Ac+V6m1itDxjpxUCkN5nUG6?=
 =?us-ascii?Q?63MIhgyZqEa5aL7rklc8POsmnTXj0XO3boKH+JI1NfY4maoJnuAneTp8rhHY?=
 =?us-ascii?Q?G4JZm7w1NuZZZAG/XFyI4/W2JjGq+4p4oOGk6viEuKCygHkhdjgmJEquExyZ?=
 =?us-ascii?Q?ZDD06EEZ8hf5SycuszPPZX7u8FcB+plg621gqdxDMFNUpabsMmqGwh1MJeIm?=
 =?us-ascii?Q?6Z62QkE3Kw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d7b6ee-2bae-4d4b-1e84-08da4563b42a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 13:19:35.4490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbmhNMH/WEOl0lKbVYQByIaYmi1lZJvHJtR9SNW0Pxi+FAzaGsRtFuglHAJbbb245cmud2cv1ZqS9CI3Ln/5zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5309

On 21.04.2022 15:21, Roger Pau Monne wrote:
> Allow disabling (masking) IO-APIC pins set to edge trigger mode.  This
> is required in order to safely migrate such interrupts between CPUs,
> as the write to update the IO-APIC RTE (or the IRTE) is not done
> atomically,

For IRTE on VT-d we use cmpxchg16b if available (i.e. virtually always).

> so there's a window where there's a mismatch between the
> destination CPU and the vector:
>=20
> (XEN) CPU1: No irq handler for vector b5 (IRQ -11, LAPIC)
> (XEN) IRQ10 a=3D0002[0002,0008] v=3Dbd[b5] t=3DIO-APIC-edge s=3D00000030

I think this needs some further explanation, as we generally move
edge IRQs only when an un-acked interrupt is in flight (and hence
no further one can arrive).

Jan

> The main risk with masking edge triggered interrupts is losing them,
> but getting them injected while in the process of updating the RTE is
> equally harmful as the interrupts gets lost anyway.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/io_apic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index c086f40f63..2e5964640b 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1782,7 +1782,7 @@ static hw_irq_controller ioapic_edge_type =3D {
>      .startup 	=3D startup_edge_ioapic_irq,
>      .shutdown 	=3D irq_shutdown_none,
>      .enable 	=3D unmask_IO_APIC_irq,
> -    .disable 	=3D irq_disable_none,
> +    .disable 	=3D mask_IO_APIC_irq,
>      .ack 		=3D ack_edge_ioapic_irq,
>      .set_affinity 	=3D set_ioapic_affinity_irq,
>  };


