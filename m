Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13E6531183
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 17:14:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336011.560240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9kv-0004WN-HH; Mon, 23 May 2022 15:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336011.560240; Mon, 23 May 2022 15:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9kv-0004Tf-D0; Mon, 23 May 2022 15:14:01 +0000
Received: by outflank-mailman (input) for mailman id 336011;
 Mon, 23 May 2022 15:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nt9kt-0004Rn-EY
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 15:13:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7c4cb45-daaa-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 17:13:58 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-fZSaZS9OPjmlM-B40smmjg-1; Mon, 23 May 2022 17:13:47 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8555.eurprd04.prod.outlook.com (2603:10a6:20b:436::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 15:13:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 15:13:45 +0000
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
X-Inumbo-ID: f7c4cb45-daaa-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653318837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAeXhl9rUP7k5yOLCNPBnDbnaRaBQg8ZExaw776RI7k=;
	b=augNFWIjfqpoFr/Y3NOIES+3q3jeLjc2STOvOopgxSmyLJjNK6ugbIIf8RbHfs2CWu3hR+
	GtWb6Bs6+lsSNuOUJtJ8keqHIaiWidGbwoWOxYOgZLGGugwWfBbzRsMM5ibZ8/ZkYWU5zn
	QwtnEF6G4x7o7TqK8YnVyLtJ6UY0ohM=
X-MC-Unique: fZSaZS9OPjmlM-B40smmjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghbKid/uU1TnCK0cUdBSeJNdPFfz194pqNNePo8mN/6xK/M5RoTL8p7B4iAyH/C0vRTmHtU42Qod+vx2zrZ3nMLbLeDfGLP73IhwC/W56QmpWRvAMKS3mnYa1tN3gWL1J+RkiPszssn92AvroHyPN098zj0C/cFDhDJO3eLbrGlSQsKWLuOqL4jt/4aHnB76EeY57JSOafapTjskip6MxWupFbs18EMPpeV+I/1OVwpJSQWCl5pRQc+kJxcqXUrlmVqDmxhc+L/CfAQcZbjQ/A006zOI7iVc2YNMnNuaJyf/85LJazvJpdrzwjBKFLWck0b/dFKChlziT6loPdIUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TXJmOV+99O6agW/06WIbgw5UHvtfY8m2zwF4rajotc=;
 b=iPYAFPOyafcLhRn15wk8EO4T3LujPS7pbm8wB9biZr4PRNlP27TxGctKR7rKoZ0Sgtc+k9aVQlkyQL6GjYn3EGyAb0FA1X8OkrmmacMR8Kk4M6x4/pQz+LIZQitdrbUfWj2K4JtUeS5tCB1HTBMkeaSmIpA9fan3s0zBlvKuw7tVBpMEpcTzCvWSGfpPjYuHzB879N6WrF7m/OqFDsf+UXgkUWzdGKOJt95h1BxHEdsCzIlJ7nybmRtsMqBfZRVimvGRwREiYqZgKXt8Z3cFpcYIZAdpsFvIns7PTL4rLwbX0njcC23GtAR87DjL+kpbTxUzhc0FXB3ON+SyD6TGDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4b025fee-8f7e-1849-184e-1be8fb99442b@suse.com>
Date: Mon, 23 May 2022 17:13:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] x86/flushtlb: remove flush_area check on system state
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220516143116.28602-1-roger.pau@citrix.com>
 <c7878c92-41e7-4628-34b1-1cb409335bf1@suse.com>
 <YoucK13m0y3CqDl1@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoucK13m0y3CqDl1@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0134.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68accd37-ccb5-4dc7-c080-08da3cced490
X-MS-TrafficTypeDiagnostic: AM9PR04MB8555:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8555A3B8A42E8B7D7C973C1EB3D49@AM9PR04MB8555.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rlBuPofIgDtovP6TCI144bETJpCpjTC7noVQY5eY32QCX78Drqtt7uJZ63wdP9Y9i8lV1jHgjshKA5F2m1m6pwrT85Yu0MNSSaDhbWzYJyJIwnOMefxQSC1qpKPTWs/LLrnhdc3dswYsuQ7t5o7Mhrot9shjq4mDOSlWETavLiMo9GfsTeC7TAb0c+FdNlG3g6kcB4hgHKVBAyAXIw/RePK5LngsjRG6erWJbnTj0ERZwfsozJHXb5WDVxYuNMlt5wWR3MndtCFCQMxvRGtMIEHLn/61R81wiPeFfBPOtarHqPQ/Do8/1w+dfvpbm6qn5MWIHuURciWLte3iwNqVPbU7UMlq+e4+wHn7dOkt4fqEdWOuQh4IXKGlLLh+AmcfdkRTTJYj+gtxYnWXXSMqRYwNpMH18me4eL/f9UCHYQ619kVz/9Fdf6D70SBo+XQqJrINXsBCc6fmidnEkkUisIbqHchKrodSVzrbE3d/TmwTR19k4smWh7qrY3QWhMOnFc8WwVUj8zr6JaOiPOUVOveWEwe7wL0uIjjclyGrjdTtJryMEhxfOQvgVDAIovtVOXr3Q3mTt6KaqLTZeS0/X2j4XAzBd8UEJYeC+jfUzsEV1OBHfMc0s3io+GEC1qErftxhzK/EzIfTnJebpHh9gFEzfSqrlODV7pvJbhLHY+F+URvJETDUiNYvZHZdACPJ6k4WWkZG2UXp/4siW0Ugrvb6qdfKsp/FGyJAJf5/JAY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(66946007)(186003)(53546011)(6506007)(2616005)(6512007)(8676002)(4326008)(316002)(31686004)(6916009)(54906003)(8936002)(83380400001)(5660300002)(26005)(38100700002)(2906002)(6486002)(508600001)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fRcjx6vxOg4xxOyNDaAY/D/PcBBVAxzBknAzTBWZXDDojHGiuGSMn4gLqfRx?=
 =?us-ascii?Q?OxI7PHUP+qL+qsg8e7ntv+nSeLQsg7vpdLq6pwoEywu766DbFoHFyyzbqqox?=
 =?us-ascii?Q?xUNxJjGe2qQCiCKTlJO4LMpsaJbr8Uc9LyB4WScqIpGDYyUVEpXB75C8ACS7?=
 =?us-ascii?Q?ZfwaNZdhKfFrtsCSP/rgpW8AjW40ZS1YShamZXLapB57RF3lpsEaks1XHP73?=
 =?us-ascii?Q?SfdsP3Qg3QZLUU+v/ykqARNeOrbpZg4pP9RPYry/4StTQHZKviGmsVb2d5zk?=
 =?us-ascii?Q?x/2CXIrze1dq//HEkLc3JkXRRlNnrRgNPyH8uHn9VRnO5Wf/xcoyEj/sdzMt?=
 =?us-ascii?Q?jplFeBuxm3J+72Gbh1ElL+9qOsYiSuiyvQh4HIQ5AUfuPZ1AWu1/yEw9W8QV?=
 =?us-ascii?Q?MAkmSsqAX9DgOsOcuzHa+PXJ+tWtk8fAnTEaj1pg0qznb1i74Pk2Scs+8aZc?=
 =?us-ascii?Q?8dXHgx4q7IrUCsB/wsIyfgxB5oROWO/C3klfPuaabJ43mePQenAqoUax3U0M?=
 =?us-ascii?Q?2DCIXFGBFgt4f/V2XyLwoXcQ0eWer8izkn1jmYaYmkMk6A2hBi7b1srXPw3P?=
 =?us-ascii?Q?z/EMLU+WQN5CpnqvAoT/xYSwQ+6EgyvMt8aC3zs0Z0yA2uB8B6aYvczaq4mC?=
 =?us-ascii?Q?jh/1KM/Ux+Gc0VI4e1Wh9q41N2g5WlS7JpNIuULWUjD098pa3VZi/etL0mwp?=
 =?us-ascii?Q?3iM1vpV6KMRgG77DtbBq8x5Hy82QX5yjs9Lb8zik5ECGir5154uTPcFp8O5O?=
 =?us-ascii?Q?ja12Ib+/t7V9OZmZN2GLH+G6YsPzyULiGKEdDSPfbUcv+gbL0HUjpyFaHpGH?=
 =?us-ascii?Q?YF9Ppa/tcxB30ENtr/Wqv8VnMgV+H94ds2dqhWDt5GF/1U37BhUFQTHXKBHa?=
 =?us-ascii?Q?VpYceTScpIgEA0LNwfmtpw3RIezpEbRZnkNR1IAIMa/TsB4VTUi/L865+tsi?=
 =?us-ascii?Q?isLf+9VqoI8OhOxslfo8ypaH8yGxmew0Y8Oq2sbEc/IzkqxrTLitCF7Lw+DA?=
 =?us-ascii?Q?6wjYmk2mFPI837UoaoFxUbYDQryxiiQnI0aslI5Hopu//kJbzKTG2G8YMgMG?=
 =?us-ascii?Q?UjYMwGz667CqbTRPI96qfs2NCkhJdQzZL5Wa/z6zRALKXpV4YU+lWcGGi+lU?=
 =?us-ascii?Q?4j57hsYBF2zokHFlXmtU0M5K0g4g3PDypt4iQYel8u8uSne5h6LoU/TbBDDr?=
 =?us-ascii?Q?016+MgTWiqbXyXEHcNZ1oPHfgi41fRBM1p/gEkleaphm+r8cQ0Xc3bbzyBxu?=
 =?us-ascii?Q?hw/tGAzWP0XjauYhW3J7YfuSW5ZtdxUFdNTGz2vOZXcGh3BLq6D9OlRm+A4S?=
 =?us-ascii?Q?oT6Pdo3lKSAMC4FddP9hHmVW8lonG52QGSp1FhmtJSa6erHjTRXJDrdSHcnV?=
 =?us-ascii?Q?YjzskZiECMpEU1HHtDFbA9q7r5pV//lnsI3T4qTjABovz33wAqWT3Enpr13O?=
 =?us-ascii?Q?mhEJFJJHlVPKlDrpFvVvCiGI9cUbw5BwxUaUt3YrjpVkfV6qRVAQIZrtq06x?=
 =?us-ascii?Q?81q2T9HTRf/4QNWjESTbycqJ3eqPECFBflJZcqaFT2TlWxzLlTnYTwB+u5al?=
 =?us-ascii?Q?bauoFxrJb08clMc/74WexPP1WEmZpPSnGjCYGEtGLBBsotKET+GRBDQlinsI?=
 =?us-ascii?Q?vuN69PRvwBGxIOOPEMwk10crzNOeHzitxBsJFp2Cs/Fnab1BDiuylmcpovNE?=
 =?us-ascii?Q?MOketVctEkO9zVBKOj5MltldXdQoNQlC5WbWzXbEcGWKELD9MyBqpqj6JlmG?=
 =?us-ascii?Q?svp59e9sIw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68accd37-ccb5-4dc7-c080-08da3cced490
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 15:13:45.5875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3i9xy9/KGSgb9a967JIdN2/D1W5uFgrQ70j+g6siA7K0uiMhEbpuFE+GXxnJXleZSzdXuhhe5/PePAkYchL0Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8555

On 23.05.2022 16:37, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 18, 2022 at 10:49:22AM +0200, Jan Beulich wrote:
>> On 16.05.2022 16:31, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/include/asm/flushtlb.h
>>> +++ b/xen/arch/x86/include/asm/flushtlb.h
>>> @@ -146,7 +146,8 @@ void flush_area_mask(const cpumask_t *, const void =
*va, unsigned int flags);
>>>  #define flush_mask(mask, flags) flush_area_mask(mask, NULL, flags)
>>> =20
>>>  /* Flush all CPUs' TLBs/caches */
>>> -#define flush_area_all(va, flags) flush_area_mask(&cpu_online_map, va,=
 flags)
>>> +#define flush_area(va, flags) \
>>> +    flush_area_mask(&cpu_online_map, (const void *)(va), flags)
>>
>> I have to admit that I would prefer if we kept the "_all" name suffix,
>> to continue to clearly express the scope of the flush. I'm also not
>> really happy to see the cast being added globally now.
>=20
> But there where no direct callers of flush_area_all(), so the name was
> just relevant for it's use in flush_area().  With that now gone I
> don't see a need for a flush_area_all(), as flush_area_mask() is more
> appropriate.

And flush_area_all() is shorthand for flush_area_mask(&cpu_online_map, ...)=
.
That's more clearly distinguished from flush_area_local() than simply
flush_area(); the latter was okay-ish with its mm.c-only exposure, but imo
isn't anymore when put in a header.

>>> --- a/xen/arch/x86/smp.c
>>> +++ b/xen/arch/x86/smp.c
>>> @@ -262,7 +262,8 @@ void flush_area_mask(const cpumask_t *mask, const v=
oid *va, unsigned int flags)
>>>  {
>>>      unsigned int cpu =3D smp_processor_id();
>>> =20
>>> -    ASSERT(local_irq_is_enabled());
>>> +    /* Local flushes can be performed with interrupts disabled. */
>>> +    ASSERT(local_irq_is_enabled() || cpumask_equal(mask, cpumask_of(cp=
u)));
>>
>> Further down we use cpumask_subset(mask, cpumask_of(cpu)),
>> apparently to also cover the case where mask is empty. I think
>> you want to do so here as well.
>=20
> Hm, yes.  I guess that's cheaper than adding an extra:
>=20
> if ( cpumask_empty() )
>     return;
>=20
> check at the start of the function.
>=20
>>>      if ( (flags & ~(FLUSH_VCPU_STATE | FLUSH_ORDER_MASK)) &&
>>>           cpumask_test_cpu(cpu, mask) )
>>
>> I suppose we want a further precaution here: Despite the
>> !cpumask_subset(mask, cpumask_of(cpu)) below I think we want to
>> extend what c64bf2d2a625 ("x86: make CPU state flush requests
>> explicit") and later changes (isolating uses of FLUSH_VCPU_STATE
>> from other FLUSH_*) did and exclude the use of FLUSH_VCPU_STATE
>> for the local CPU altogether.
>=20
> If we really want to exclude the use of FLUSH_VCPU_STATE for the local
> CPU, we might wish to add this as a separate ASSERT, so that such
> checking doesn't depend on !local_irq_is_enabled():
>=20
> ASSERT(local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu));
> ASSERT(!cpumask_subset(mask, cpumask_of(cpu)) ||=C2=A0!(flags & FLUSH_VCP=
U_STATE));
>=20
>=20
>> That's because if such somehow made
>> it into the conditional below here, it would still involve an IPI.
>=20
> Sorry, I'm confused by this: if the mask is empty there should be no
> IPI involved at all?  And we shouldn't even get into the second
> conditional on the function.

Should perhaps have made more explicit that "somehow" means a hypothetical
way, perhaps even as a result of some further breakage somewhere.

Jan


