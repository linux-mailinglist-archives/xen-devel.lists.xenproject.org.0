Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB1B4D1737
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 13:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286783.486420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRYtE-0005vo-3I; Tue, 08 Mar 2022 12:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286783.486420; Tue, 08 Mar 2022 12:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRYtD-0005tN-W1; Tue, 08 Mar 2022 12:24:31 +0000
Received: by outflank-mailman (input) for mailman id 286783;
 Tue, 08 Mar 2022 12:24:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRYtC-0005tH-Lc
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 12:24:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b345e43c-9eda-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 13:24:29 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-Ca8O6UlrPZmd45MEsSELXw-1; Tue, 08 Mar 2022 13:24:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7476.eurprd04.prod.outlook.com (2603:10a6:20b:1d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 12:24:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 12:24:25 +0000
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
X-Inumbo-ID: b345e43c-9eda-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646742268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0LL8PMLRbKF+XTB52/yKyvFWshAaeLbt0/KuJDKP3pg=;
	b=Fy7X2e7EnoohSU4VM48kJeonZueKCfFbLBtNf71qryRYrTHRc30z9GCiNSVyers5x7Kajk
	zMJQvEdhQwqPT834DWuapA/mSJ9EbRNnDfoehDmSVTYF3gTsS14WzryXEUtcFTgqPDE3wL
	vYR4LLT++7G67DrwXPapkdQet7zLVZQ=
X-MC-Unique: Ca8O6UlrPZmd45MEsSELXw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iB7xqxg8ZOxUhm5vUsRgNEQSkfprWW/uO5UPXn1asFi2wG81D9pNvjp1Wpm/cz49Np8sxvbQKZ95HLEOTtg5ZiJdmdyYEOQvCdKMSgwMNhm3KdSkFfmZZ6kokEOkc/MX2O354Xy8yudbeRSuQ2bEG8Mm/9jnavTEH5KKPTH98nfznO7QS5rjJD163BlE6mFrbQTN+gxPuxesVgMDyRNxeb8ZmNojdcTQfPpkaBrgwdTTmhMPtGUgMaUBfjwQINxVCFiQI7S/OXsroXVU0TxtOQvFFeFHd2fLqrIggkNcL+/XoUTK9t52TejH93j07vkNoADzPKS/sw7R/nfQRG5zrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REOBaqC8Z6Bo9aQ9/1S6EGs+ehrv4TdB7erO7x5Q6Og=;
 b=Hhq6teKqQM4V3V7+oXialz43/WLsepeAL41R9kHWlGdVPBj25yYY6Jq5OxKCO/hI9oNWHEfxxnpQRdMJ9AJ5tTwdS/HvvW00vvWfJI4MHJW/wH6l0GIjuEPmuSDptH1LRoqiOpVNltQMkzrVPcWYtNjkyS/16vHjBs2urr2ieVDxOJS79Lk0ucphMZKGtC9MGhCWj3TqtjoS4X6lnj/PeGMPU356Fz3dJ6AXjNkHsphBFDDIUA0P9k9Eb495ObgkZk1n+KlT6uTBEephFjENI13kAPA7/xuSj5lWuejKNyEWs35rgJcarK3gaHAIBopUbKbPmN/PClIsUgE3IEQETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b633f92a-151f-c7ca-0d91-cfad8d2edcbe@suse.com>
Date: Tue, 8 Mar 2022 13:24:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
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
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
 <YidAU63TsVO/X1Q+@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YidAU63TsVO/X1Q+@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0158.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 681b30cc-8fb8-4de7-559b-08da00fe956b
X-MS-TrafficTypeDiagnostic: AM8PR04MB7476:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB74760DC54C84358324536986B3099@AM8PR04MB7476.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	De9odljiUsu69slcQTCon2hhhNSwGHKVwVo4IClcll1N0z9+eo7I9iTLCI+pV+fHt7xLJgO0t4HpXuZyIg/puN1P2UZLGmMkzgj8z7+Rn9svZ9AAQ+812qdivnsFsw0fey5DjhvmAxke1JfUUprJgmJUOGUeg0d8RGUfePCAgstUgFB0vu3bspPCYnRQH7TzVpVv5lEaadOIfqaxhQK+vvBICPiLyNbVGCy5FAn/Bf33hefhSAz/d5wgnALQ9HMATduPTnKPIQmvI7M4Xqxjb2aghJG00bLtDlBLBXTZt1N0eifNHHoxTQvlin3vq7ovE97QNeNTC5a9Y97Vtb/yH4/LYt2rDrgLgKqowfuX9+ho3wcuDJM6JR+cnPHmFfaGcooWLvSaM3Wm/+ITWWB0uhjqh9U8+s6swuUOR+S7Sl11oB0bI07Qm/TtphmRCAp1/C1WTwDLwzgAi3O8lY37w7WyKc2odGKhdLzGxQsN7H70mEou7i6pCAjoDwM9lbR0OEdFVPN6bYXJmvGA6J0rYiRX+Ohq6JNyQVclDHs91iKp/DdijYUpS7YhBWQL9MHlft4+xWkyFQ/vGE0UGwLkw6Nf275EuoYJK4jbaEdK/+Qy3U92eHLKFRgCICuRwuIvYWUMAVgeDbQQwHlbZwtcsXMAP8vJDHRVWYm9X8FLZa5GYP3i2Fy7rpuGc5/om2/r/xqXJRjrEk1ZwGWnEHY2NeXGEzeNs0QjjPmC3m4wglE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(86362001)(186003)(31696002)(2906002)(26005)(8676002)(66476007)(66946007)(2616005)(4326008)(38100700002)(6506007)(36756003)(6512007)(66556008)(31686004)(6486002)(316002)(110136005)(508600001)(83380400001)(7416002)(54906003)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pVgvtiHoxzEwwb62MAQHLZMYhpsNfJ8P4rBJdNXFoW9Yfapk9HJjPWSVrSU2?=
 =?us-ascii?Q?ovzB9tWkVeKTSGowoURE/Az5w6T/VKIAwHc/spb8uc38cjo/2ocxubP3fNda?=
 =?us-ascii?Q?L912gu4Q7ude8q2vXLS1twLVYi310CeWSzEGSMm6LPh/UZb7dpAauwpb3Oy5?=
 =?us-ascii?Q?DxvmHB+OYTwblUVkuO17jqDutTcXR/p1jPllvD4G2vlp08iANdXvwzKP+8hQ?=
 =?us-ascii?Q?uw5VOKnn0wqlGVlmTJ0iU3+L58WuGDFtNDzwoFN+DqQKvWAxAFVjPBjR+fM/?=
 =?us-ascii?Q?2nJp8jSM7F1jRXTCLma+5whhL1u0gFsK/krlxmijntPXq7cvRX1qpuLmoPJT?=
 =?us-ascii?Q?KELQ3AU1cAvzmO7jgBleEcbPLkl/BOu1inOquGHfDKmvCK5nxL18ZuBtDSPk?=
 =?us-ascii?Q?xU6NUPRj8Kr0GAQBo+2x0+iKzbEoxYi072Nde3FxzYxUBYSZPz/pU6OIiatx?=
 =?us-ascii?Q?QsCRdNlUJWuK11w2ljLXUPqNyD3H8jHOrtmiXIMx5ALc7aBITUusz5z+eBPV?=
 =?us-ascii?Q?WrO+ebAwc/5bz7e/1nLA9jyTgh5KxNKKZRaXNZ3uEtyIBRE9JILCtq3At3Dh?=
 =?us-ascii?Q?mjWQkdH5tQyKUEdSUI0E1tLsEap9E7QJ0aisirj46CY+zZfBfn/ph0Nlb6x1?=
 =?us-ascii?Q?3ZLNTRlmFu6enc0qb23ginwanxlfGCF4W7H0DZHa/Q4xM20blcppjzwAUBf9?=
 =?us-ascii?Q?4qQgxYMf1dwWVtwbJFMvVLKY6nowt0TLX7a9bbQzKSvKbgVYL8g9Sf+/4+La?=
 =?us-ascii?Q?+Xj6MP0cj+CgYGialYRPZBHyd7MMR8tQG2jiT6B+gi+LE6dySXDci9T5n3IJ?=
 =?us-ascii?Q?5YLOS10yTOvyp9B+X9aamrq3iGxHXbBaxi5bY8zdOfLzp1K9Jnabw/gAlwf4?=
 =?us-ascii?Q?mn2v5FGIXu3XUQkvOQyRgQ2nULFIvFon1HQcTzETFgSlirPHtbluYtgwTQGu?=
 =?us-ascii?Q?eLP0hIq5XIaQvxvkPBWEKctvW76G89ZZvjDA6SWN3KDZwr1DQakYby/HhZ7v?=
 =?us-ascii?Q?Vncrn3q0BeZDwN9wiUmsiTPKQ4VSRCe25qeY/CQgclJfYWawfIubJSuob5WC?=
 =?us-ascii?Q?PqfK7iB/+stzWyrAFI3lnCBCZpc/W6GjqbLvrtoHn+Ta7m10lfpu17pHU1mL?=
 =?us-ascii?Q?I2zwN44czLE/9M3eqTBlXciSDUqa+YGqtQaYGjZmFvKm2CZ1uzH8KknK53s6?=
 =?us-ascii?Q?dTQK9iFFdOjunALpCHq1VIGY9E8XDvzn4apwoz61O0bZW3458Jp1xGtDM/+0?=
 =?us-ascii?Q?ogkBhLDhwiFSNUQmQPyJsR2/Pk+uqdihYvun/qSM8nbXzZ4mcI7fb0ovPkOw?=
 =?us-ascii?Q?FeyKwf2ABj8BlgXY2LeFw54f6KkuFzERiCPN22MVFUqcLmLbn6xHcVfpyXqJ?=
 =?us-ascii?Q?tkLJour3ltYy2HHXOTaoNwUOWLom7SXaRDUWcsmKypUZWXLyVIA8+QwbzbX4?=
 =?us-ascii?Q?kJ6k9TJ9X0R0tyhzg6JijbCCa0c15qf3s069zDn5Y45kMAmoV/ff8JZmtjTy?=
 =?us-ascii?Q?y7eHm7K23nnZ9COL15kkox2bHM/kLAP7KdwY6JLhJcRaInhte5dJZFtd8uc3?=
 =?us-ascii?Q?DYN64ercGHZ8l3OHd/+alpiU4Ke8oEefkNSX2Pitgpvm0Qzqt/nLYMekM506?=
 =?us-ascii?Q?sjfV73h7kUp57JF+/RPmHbc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681b30cc-8fb8-4de7-559b-08da00fe956b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 12:24:25.7222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQWI0Pzx92SgwF7EakjtzzZGSmwP5EaPzkLtbJaUlOm/irvF205Z27Azjm31HnOipbyJyxUXtNjO+TjchL12Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7476

On 08.03.2022 12:38, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 07, 2022 at 03:06:09PM +0000, Jane Malalane wrote:
>> @@ -685,13 +687,31 @@ int arch_sanitise_domain_config(struct xen_domctl_=
createdomain *config)
>>          }
>>      }
>> =20
>> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
>> +    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
>> +                                     XEN_X86_ASSISTED_XAPIC |
>> +                                     XEN_X86_ASSISTED_X2APIC) )
>>      {
>>          dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
>>                  config->arch.misc_flags);
>>          return -EINVAL;
>>      }
>> =20
>> +    if ( (assisted_xapic || assisted_x2apic) && !hvm )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +                "Interrupt Controller Virtualization not supported for =
PV\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( (assisted_xapic && !assisted_xapic_available) ||
>> +         (assisted_x2apic && !assisted_x2apic_available) )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +                "Hardware assisted x%sAPIC requested but not available\=
n",
>> +                assisted_xapic && !assisted_xapic_available ? "" : "2")=
;
>> +        return -EINVAL;
>=20
> I think for those two you could return -ENODEV if others agree.

If by "two" you mean the xAPIC and x2APIC aspects here (and not e.g. this
and the earlier if()), then I agree. I'm always in favor of using distinct
error codes when possible and at least halfway sensible.

Jan


