Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508F14F6402
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300017.511473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7zI-0008PU-DK; Wed, 06 Apr 2022 15:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300017.511473; Wed, 06 Apr 2022 15:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7zI-0008ME-A4; Wed, 06 Apr 2022 15:54:28 +0000
Received: by outflank-mailman (input) for mailman id 300017;
 Wed, 06 Apr 2022 15:54:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc7zG-0008M8-Pk
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:54:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d55fb50e-b5c1-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 17:54:25 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-DLKrpDQ_Pyuz1fM_a8Y9YQ-1; Wed, 06 Apr 2022 17:54:22 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8067.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 15:54:21 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 15:54:21 +0000
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
X-Inumbo-ID: d55fb50e-b5c1-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649260465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mi3EXkuNbgleNf48ohoJc4HHvsGzUhmjATPK8MDlSMw=;
	b=NtGmAyrvtT+5DXG7xiKy7N5oxNBNe96FZ4nCN/NP19D1t6SmuvnhUJVKC/aPKPNc4cpRfw
	YTc6Iv44hAGE3Hz7LKKGyJpFqpzlygLBRC85Nv8WPamD2ePTzS4P5yu9yMi0CIomrBO2YD
	PyQPfwSX5dx3U663CP5OUO4hIpoZcy8=
X-MC-Unique: DLKrpDQ_Pyuz1fM_a8Y9YQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4z1ob4J6ZmDBycUscHH2CCnFR0r1KUGTWS5Qb270VGhOIiTIqmoA5GuyshN6r5hyO5EQ9xmOMpd4K0jYQbHdoOcm1igqvxJ8Gsowm+iKVMxv30PjgfE0Y1C3V3PBNG33GvsMKgsWOVqmnFupjdz9KcjWVhPc9ck3DLwI7oviKdlkhIWU/KpPCRW88LmIOg1F5QYKvw898wUKSrMZ1hx1eBbgJshKuf+cvDrZ+KsMFf8B36k9gCfdaJCK8RcZ32ZESw4PfYoP0btMdqCXyR5RrmpimWdqsyHP3oaFt5WZEx+wEj8w+8ziuNBHdhzmWQf8v+/trYdgSlmhrNkvjxDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4u3NPZpEajzisC3g0rVxRAkrG+CWew5OjjzP3q1X1g=;
 b=X1LTo2G8lUYAjSHWjVLboXkuV4IpknA8whESp/CT7DJyg8zQoFkp+dhs0jm9r8HgasZ8NAl+cX+Ws1znnnjcSqpWm6oBClYskphn6H5Xw6hGxgfbHXw3+YzVYAieID3RUY1SGz6g3bQ1bqedxkTzfpqTx5CNOrTPEtI7rY+cxgM734CceKId+6xFP8r5TaIwzuJ3IUEw7YooXIY1VYOB0y+MxBJfHvCLbmk+RzL0hFvoZnPyENLflmGV+O1Qm2tzw/p+9crQQ7Zzm/PD80cILlqj/0c8lwRNrpO745deccjSvKPmUJpsLQUvoaV3khjKjVlxdJkrLijpo9F/Z2D/bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8bfacd47-d7a3-594e-7bcd-dc16c208f12b@suse.com>
Date: Wed, 6 Apr 2022 17:54:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] platform/cpufreq: add public defines for
 CPUFREQ_SHARED_TYPE_
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220406151645.32827-1-roger.pau@citrix.com>
 <3ebd90da-f7f7-fb14-4809-25202f200d77@suse.com>
 <Yk229J2GMnoAUZsZ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk229J2GMnoAUZsZ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0052.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02db5803-fee4-49fc-a954-08da17e5b6eb
X-MS-TrafficTypeDiagnostic: AM9PR04MB8067:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8067D31AD0FB361C411C173AB3E79@AM9PR04MB8067.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7H0dM+j12O+694looxDZnzuOCoWIeJZdtUsogE2jhcn/T0sIyqVZQ9e6HNlSSKXpSZy/qKGxYA56qNYSg+/iBUTtUKIgavijMsrvm+IAtA1U7kOVi2Q8Ug9mQ5YLrvZDUlV2ya1x+D/kvd7gLvYsNWhTuuQMzRomNb47ykLs8zg4LJge/J+dnFZQoRa/gacS62JVacnCvaXPgTcF9ds6d47dted50BF6Jt7TjD2aGSMMK5npBCFYcVbG5GzRrZKV047+XDxJ+bZ8YliB7sYMVaIry7dNjzmUxZ4h1XykCJUv604Kqd70/Y8KdzItL8bxRNUUtAtGNZdanNgumzqOtQ/klD/k5h9uBGHKagPq4jYVFlIUKmVEJnMOAmc99TX5F2bbu77hDLvl153eJIA3v8At1YglkUhSLpJlSQYssK3g6lhmHsrn0pO26KC6/VKmt7PLf9uqxgNGnUedWb3uttQgl2bKQtP+0NVKOji0PTCai32uHNHG2RzQjuBvFhGeidF2RL52Mj7fvpIChmRadOF0nw6KLWMHCuEbNuHQwza4dc4tG8+QzxGnBGmV/fHgConEnJKxCtGAjxW5DvFBUwLvTWI4aze7+Wqn3hvOv94QC0yF4o8TbXnhxeLyVkEafq3YXEi1uD4Vazt9mXaimfL+NRg1N5d6Ppf+fcQ1UZcsbET1OAHrYJt0WDCItpDkcdZsEdML3c9hvrGg/US1quf2BAV6fokU8l9SU37/7j8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(2616005)(31686004)(31696002)(38100700002)(6916009)(6506007)(36756003)(53546011)(186003)(316002)(6512007)(54906003)(66946007)(4326008)(8676002)(66476007)(66556008)(5660300002)(8936002)(508600001)(83380400001)(2906002)(86362001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CSQ78A+NRaoGSJmgVzIfmPjpme3o4ozSBHEd5W58eugczX7DEUYasBIodpLU?=
 =?us-ascii?Q?/Xf013x2HVIqsO6fosf2S27Exi4JwNw0gJITDMr3ragA2uyHAz//pcxwCWfx?=
 =?us-ascii?Q?dM14aAgIB+WbG1OGty8EzE27o/Q69nMk+ZNZLLLwzRnVvcywW6ZWAtTWbV1F?=
 =?us-ascii?Q?Hd4/bKJjLnk6TVtZVWHMtiYG2s/kShXzBUzUBfJzEynCy0qYRsiTPAGZQ5M/?=
 =?us-ascii?Q?RJRn5RSqzvg/cHbkFoZSsun/MaNh/hxYeAONa3MKzddDCd6bDBUVYEBvMT1b?=
 =?us-ascii?Q?PvJz9QlQI0BUx8dtwJK+hiuTE3btCquFfKRJmDwGvBHUZXUbu9jHbE/G+ulU?=
 =?us-ascii?Q?GP+BC9aEvorhDZhu/5g/x1OqtsMgqZ1EdEqMLUXbD1OgS2WagrfLRrR2E+SU?=
 =?us-ascii?Q?ThHSe3CBshT0cG13pCoC89VI+KM4aIEuLyw9ejT4zl0hgiQQoEdPapAW2NTM?=
 =?us-ascii?Q?FiQwSnMDffAM++FRK1frfcyFJn3znUlwMV6+COctNRv03VD75yiQ6ALH5vKV?=
 =?us-ascii?Q?GP484hXb8YNqYWvLXK1CSh69ObrQtwEuTr/1+Netwuc+vCU2ufVOy8X2qzR8?=
 =?us-ascii?Q?kGa6wwsYhtsZHdcU4yjWLop8hVfZa9qZO3PrJ5ICUkNyKX2TvPhu1W6kV+h6?=
 =?us-ascii?Q?VGWIVhisHtGdFMymkgunWW0m+jAc5HK+TkUPxSLESSWCOxWwGFHkuVZ1zrzB?=
 =?us-ascii?Q?pCvqZb2qNAouAapu+Wux90wT2rZjxwJjqDPn7TXvvFIS8/OIogV+hnd7yT5F?=
 =?us-ascii?Q?IsmjfC6BmmFFUoVfOLrP+f7vtb2SmWCh6VeyRGOwsVaCwvud3Zih1xihHsAT?=
 =?us-ascii?Q?d48vHvmj0/8u28+62iHb9qWsBGRtftcF403Iy2OfmIOzBe5xzRorXHuNohp8?=
 =?us-ascii?Q?7ZTkP1frTQHsVqAPyWaz+t+9TSIzw54OuF0/1rHQhVDwJ6x21xYkVwe0v5HV?=
 =?us-ascii?Q?Q8EIPyw00WFpnkc7sMGynFm0AtiwN5mpaSN74i+8yjSKjrhNbfR0HLzoRds8?=
 =?us-ascii?Q?tKHGvu9Vd8uOvnXmgcWoDNVIzXaqT6NYyr1VBHnTrz8IoItbLA1XoT17FWBR?=
 =?us-ascii?Q?WNiU6SfVIQQvkTkuujX4Q3wITDfXrdlnn9al1KQiCTvPsun59qIqw4+4GOwy?=
 =?us-ascii?Q?kwQwf3GZSOFWO7qmYiKhU4Qi9140z/DWobH2i5M8zzH01iFb8VY7ScEQhaey?=
 =?us-ascii?Q?ozdTTeT/fTtkS7qyQ6ti7ITkYI6Tedv93gDw+md32rAShUxb0LTjm+kMY2+b?=
 =?us-ascii?Q?WeaufGt44zfNaMmC0ogxIJI+REae/4Nx/N0Nvy6LCzNFHrjLjxhCciv3+zmx?=
 =?us-ascii?Q?FMmiW1n+WVU7UQnp07d6TC0jJMzeAGTAaTYBTyAU2LA2s1rRNZmaWkqqGwAQ?=
 =?us-ascii?Q?HTerYuujoqY6lEG8v6AymXSZwWhsOGyJVZu+ejV7wpZI1ADTO+7uCkOx3U8J?=
 =?us-ascii?Q?xItAUC8f38DBDcbgcE7kaE+qVal/j+sloJb1zZZfiU23A5kQ6wwkZ6OdhmqE?=
 =?us-ascii?Q?6rkjTGtk4lvY/fBMXiWX7ZrwiNaDFUYkn6mA+dXctP7GXWpNqtMFRntK4y/S?=
 =?us-ascii?Q?Rb4QWy8D9zFqdueOyYq2KE9ekJXsupIfwihzcGtCWiWhsDGCL+nKUR1LnD9L?=
 =?us-ascii?Q?XElHhZz0BPLI45dGjPnxzE6vj1Ifk4HlZGjIH7BOOX9X9Y2IVCDHPJx5RWp0?=
 =?us-ascii?Q?DfHNX+Gw+b9lIFCJYCBL/NQTKdAqXrPNh4n3UhBOV4UrvlDh21adjTvlsTmf?=
 =?us-ascii?Q?aUFp95860g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02db5803-fee4-49fc-a954-08da17e5b6eb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 15:54:21.1131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IywVyOzxt2cZJuO2Xw8L7QHPlNFPGmM+lhY+a286lGp8wAmgVWUzu/vuzF5KzIHUztnR0bGQ+6fTgG6+AwljTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8067

On 06.04.2022 17:51, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 06, 2022 at 05:31:22PM +0200, Jan Beulich wrote:
>> On 06.04.2022 17:16, Roger Pau Monne wrote:
>>> The values set in the shared_type field of xen_processor_performance
>>> have so far relied on Xen and Linux having the same
>>> CPUFREQ_SHARED_TYPE_ defines, as those have never been part of the
>>> public interface.
>>>
>>> Formalize by adding the defines for the allowed values in the public
>>> header, while renaming them to use the XEN_PERF_SHARED_TYPE_ prefix
>>> for clarity.
>>>
>>> Fixes: 2fa7bee0a0 ('Get ACPI Px from dom0 and choose Px controller')
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> ---
>>> I wonder if we want to keep the CPUFREQ_SHARED_TYPE_ defines for
>>> internal usage (and define them based on XEN_PERF_SHARED_TYPE_) in
>>> case we need to pick up changes from Linux.
>>
>> I think that would be desirable, also to limit code churn by this change=
.
>>
>>> --- a/xen/include/public/platform.h
>>> +++ b/xen/include/public/platform.h
>>> @@ -465,7 +465,11 @@ struct xen_processor_performance {
>>>      uint32_t state_count;     /* total available performance states */
>>>      XEN_GUEST_HANDLE(xen_processor_px_t) states;
>>>      struct xen_psd_package domain_info;
>>> -    uint32_t shared_type;     /* coordination type of this processor *=
/
>>> +    /* Coordination type of this processor */
>>> +#define XEN_PERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
>>> +#define XEN_PERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set f=
req */
>>> +#define XEN_PERF_SHARED_TYPE_ANY  3 /* Freq can be set from any depend=
ent CPU */
>>
>> While the names may then become a little long, I think it would be
>> relevant to have "processor" (or maybe "CPU") in the names, to have
>> a better match with struct xen_processor_performance. Also I'm not
>> sure you want to define these inside the struct - they're
>> supposedly suitable for Px, Cx, and Tx aiui (just like the underlying
>> ACPI constants are).
>=20
> But those defines are specific to CPUFREQ code, the raw values from
> the ACPI tables for the different 'coordination' fields found in the
> Cx and Px states use different values, ie:
>=20
> #define ACPI_DOMAIN_COORD_TYPE_SW_ALL 0xfc
> #define ACPI_DOMAIN_COORD_TYPE_SW_ANY 0xfd
> #define ACPI_DOMAIN_COORD_TYPE_HW_ALL 0xfe
>=20
> And hence the values exposed here should be limited to the existing
> usage by the xen_processor_performance struct.

Oh, yes, sorry.

>  Otherwise it would be
> preferred to use the native ACPI values, which don't need exposing in
> the Xen headers then because are already part of a different
> specification. IOW I think it was a mistake for the shared_type field
> to use the CPUFREQ defines instead of the ACPI values.

I agree, but we can't do anything about this now.

Jan


