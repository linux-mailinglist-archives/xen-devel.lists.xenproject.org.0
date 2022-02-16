Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A214B8355
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 09:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273778.469034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKG0V-0003Bk-6b; Wed, 16 Feb 2022 08:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273778.469034; Wed, 16 Feb 2022 08:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKG0V-00038u-3O; Wed, 16 Feb 2022 08:49:51 +0000
Received: by outflank-mailman (input) for mailman id 273778;
 Wed, 16 Feb 2022 08:49:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKG0U-00038o-1R
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 08:49:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6550103d-8f05-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 09:49:49 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-_VrOifNbOEiZc1aBBO5g0g-1; Wed, 16 Feb 2022 09:49:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7985.eurprd04.prod.outlook.com (2603:10a6:20b:234::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 08:49:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 08:49:45 +0000
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
X-Inumbo-ID: 6550103d-8f05-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645001387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUXdphll59OTG+Uy4/FRwf9KSE+cmbXLeSYJ6dESNVI=;
	b=C/Yk6BC1idBgiGxC+T9daPpRLZ9m5cmuQOVBLPL30xeec5A0Cn+Z7zov5OfaZrNukdgMR9
	+ZhW+DLbVVKZzJKJeX2Q8uZbqbxmHOLyihya8KvPzC/iq/2UkzUZoQr71+9oGsbeuI3kP5
	CtnHv/Z7t/dsdFRuljOyQTmI1aYl/Y0=
X-MC-Unique: _VrOifNbOEiZc1aBBO5g0g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EL0cm5otvBhqpspECtvM0YKjnPmoBslj0Es6Cj+Og3Bsb7F2/Kq/x56UzsN7sIiE1Q0B83ItEY+2YOV4KP/dWsv8B3E/uC1zlZTAj9Yu4cgfcB3QeGwTtNkvve4WMAsEalM3vLSMEra2hnNCnLkCWelF0XjwJIzs2uwbW8DwPqmrZzHf3RezcVNu+96erl2+3+b3aPO1+Oq8ayRU76l8naZd/SsKjfdeJpEn1Da47iMWpgTFTy+F6w0ZyT06eg/QMdDZ4f8KOyWjS6dPbrdNutLzp7+XJUkiG0Mi6RXscAzYDusEn12ifAvf21QW1I48A/Qn2euhja5A2rYdlS8WDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt0WqcjgodoNc9JCiCyXPdsLIcJAN19KQjqt4nQGX5Y=;
 b=IHDw4g60vu+hM8qwO1J/pl8F9uIuVQNAhnne3GC7bhWT57oP8zTBxgwNlb4k4jWPSsVxOJkW1SdehMTXdNtAJZfWxeVemU5amnOK+CzS7FtcDsu8Tsu0OYYvoiXw6e7tS6IlAk6pt6TjF9S1jBcOCPJNV1uhQSJXgbOh2tExqZIPAo9vaQHyRtr1pULYY2YUKHTxVhUDn2N4CjPaV6ZB+IloTrwwo4im+4m/CubGrrOBZl4ExibMKYJfeSC9nNku7HubaXbG69AdalvvK7wKYyPloriV8eIVYqC95qvTg1JfQgT3UWdd3ahHj8Al2JHd3Y3bL6EY1iD4f3UenAlQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41b56a02-fbd4-bb43-3e94-329dda5785f0@suse.com>
Date: Wed, 16 Feb 2022 09:49:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 68/70] x86/setup: Rework MSR_S_CET handling for CET-IBT
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-69-andrew.cooper3@citrix.com>
 <79617697-307e-b19b-71a9-7c8554aec481@suse.com>
 <029ee818-6cdd-6027-59f9-6ddf07ed01d0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <029ee818-6cdd-6027-59f9-6ddf07ed01d0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0021.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c19b57de-e0b2-42eb-b9b7-08d9f1294800
X-MS-TrafficTypeDiagnostic: AM8PR04MB7985:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB798540DE505CB5BF0426CC9BB3359@AM8PR04MB7985.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	suy12AGPerUSbd61MQ0IN7ZwEKyOMmHwqM4FX6aKi0dU9Q9iwk18HQ+/hSJc5mON405vvmDwmGhr20A6uH00tDOL3ORKZjhmOniqtko7coLAJVFHjNVEaCQY+ZpKr0va4L81izq6yyNBJasi/XA6YE66y5ErS41vbWpRSi2QsgYI4MHWPzt4vim2Fu6JJvRLZWhUu8vT+F78O5DuRhQUvkwZuVuo3Y9YDQQziduvxQXPel8m9A+u2ZcYz4B91Ryng0kMmapoR85R48RPxQudkR0iCKoNZmiWs1uaAIU/onsf18EoLkQGY8VluCKBx2/t9pWdh988esuNalbwJihuXyvrRS9jYC/X8xy60w6Ap5b8TpMeMazisb195CX+8TyBxGHZo7puOl/zEpVzEN95X34C6tzX0fpt/6VLm14FKdIxfPaTjgY2J4yO8/rFj+CM9zzo+ND9rC5pa3pRsN0vNX7Ebe4ET99m1wRg0AWw0G4YH8tK8/nFDAVwOFZ78wlRnOBWDuuFwvWmsGt3jUiez5ULik/kt7gVLmfTfGdTGpAMid/ngyUGWib1AjgrONBOdHUJYvay7UlaVswNtgjEDyLQ9sDZnH0BBiOpsM3nQTodnXgzyo6tpb+H+otkT5cu6UA3PmuX1QkRlDrxyA+xVCh8lPYvd9eR5ccFkWwjfv9mM7nIBd0k7/oCWwe5bZPvLGY1a9dJQMSosGPQb1Ip4mDSo3AVZ1MLa61Mv8GshtJXhJpK1Sn7j3zHAvkpOXsj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(53546011)(26005)(54906003)(186003)(6512007)(6506007)(2616005)(316002)(83380400001)(38100700002)(31696002)(6916009)(6486002)(86362001)(508600001)(36756003)(5660300002)(66556008)(66946007)(66476007)(8936002)(31686004)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b+wn36gU3nNtzJJ7BboevuPFe99yG/ElDdJ2FII20Berd3/vTvzReSk5A5I3?=
 =?us-ascii?Q?fm0Nc6aY92KvIs1BsVGLVTHSdb1Hl3bGiVconhNVQB2RpmptIbv/qmLmJcPR?=
 =?us-ascii?Q?FUgJT0+j6uiIg/nMrMEhuE2IovI7rHsj0c/UU6y32cJYtaqzxjo90YKVKrOZ?=
 =?us-ascii?Q?a8greXKgJCX0UkZC2SL4fZ/tqX84UYpmJWsgB3NYHduWQw6QKCV5vbvDkKSz?=
 =?us-ascii?Q?iVqSDe7sl4tDVVxCzKT2K04a/uKjAtmJUscPYsckelIZJrBEFKOgBat2/KhU?=
 =?us-ascii?Q?w/s+zzwA1QgiMBC7Xq0o0HSW1Be3KQkWBx/VVcaVNftodTmI34mfJW7M4Bs3?=
 =?us-ascii?Q?ujRPK796r5lzmG5HvVQGGkNGV3UpPd4BKOp5SBnYNQQH+xIlw1/JSCwLtbGj?=
 =?us-ascii?Q?5kFPi6Q5YxqqwfanNDCCJFwfBduLF+M1dEg+ZKAcCMLUi3WqkAsX/575r2Ij?=
 =?us-ascii?Q?8I8sM33RrF//Q8BSihjbI2dE+G9iU2PR3hYJ9LqJfz0gZG/9lWYROavWkGIk?=
 =?us-ascii?Q?HsaxbvrtPyZDPD9Q7jESEt2ec71DlnsEXs3ovO6y8k9/B0N0KHEG4ICv93nm?=
 =?us-ascii?Q?vSzjXbEOgP2h+9GHDAwyRFYhFAdziBT2G8TqufibXn01Cq6E2Wx1XOlXOySu?=
 =?us-ascii?Q?mCA1kOaIryylwKJFWNV8AE0jCsfG9S2d1GDAKKgC5AdCAqzccPA73+Xie4+B?=
 =?us-ascii?Q?O6vZcz3ZkvucDYpxOPvMZXhPpi8felgHD7l5guzkK3+PPa+2mIzQ4mLxaxtF?=
 =?us-ascii?Q?5YcW2+MvuCGuE8fFiab69LPpQmOOWScsJWB8kqyKirTvmx9kY0OrGBhEOmgI?=
 =?us-ascii?Q?7srfwlLLiUdfvHCbr6CZE26zZAOV3gow8aHMazY3OEUfVt1JUgPnv9KHb0u2?=
 =?us-ascii?Q?6PB0gaOxpG6iz6whBWlzACMntZLfXeLLh2ZELyZRCStP46QOegaCH6J90W5Q?=
 =?us-ascii?Q?Rw94aamviZfPZWNkViAmpN0YePfrOy3nqzqUlSHeU/w4GEEJ9e1ZG4+R7RB1?=
 =?us-ascii?Q?hllKGXIUa0ilabwCNBB5v/706ZqFgk3iEbSDp5o+JSeomtw/4o9favJ6QH3y?=
 =?us-ascii?Q?XmhUuLg2BMQcYtb2te4Oc1dNG0hkJ4VSkwJph9WIUmTF3GHPN7xoQu4QxRCs?=
 =?us-ascii?Q?6pw90xatzXezWv3lTCvtdP346qZI4/VWKF3gz9dxml2BUESnTtbjDRje2cyi?=
 =?us-ascii?Q?NRZNAPcxgg1wAC5tucl5GL/2ymYkaW0j9nfy0PSSlcv3+nQ/yynSUKf2ExQV?=
 =?us-ascii?Q?eoaJhXSD6GkVXSkTj6UFJqCkdH4vDWnELzZJIC+mt0Ow3dlgMwbOALMqPOWA?=
 =?us-ascii?Q?SM4MmNi2b0jS/PKZm6+/5c81S5aB2grnpfpYLWu9zEDNyf/DLZRrnIzZBGhQ?=
 =?us-ascii?Q?9FlFgQE4eR7J1+JwYiFRhNhirwU26DKrCnkqZQrAD3LOjCdtJQjH4RzL0whE?=
 =?us-ascii?Q?8nruITA2LfONqE+5rT0B9O7Hw/YR1TDjNuzMJDruEbLHZEmRDYhuCy3Ez88p?=
 =?us-ascii?Q?QSi9E7oiPyUOretGqkbWRF7myiVtM7ZhcvEeRqOWIj3KwdZGdU2UTo4SW8u1?=
 =?us-ascii?Q?lh3Nd50msP4DmHE0214T82R7BAqH0M25YXKR7AzwxBD6UB13qoQ9m8H0pK2E?=
 =?us-ascii?Q?DTuCxpfqZI1L91v261Yj9gU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19b57de-e0b2-42eb-b9b7-08d9f1294800
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 08:49:45.5314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pd/ASjmbiMEWxRjIxszlhQChUWNuNlGLQT9IXVdXYT+m2EQ74g98xjCAoBWdL7DJc/QdvIuKOej4JU8CXIv3EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7985

On 15.02.2022 21:58, Andrew Cooper wrote:
> On 15/02/2022 16:46, Jan Beulich wrote:
>> On 14.02.2022 13:51, Andrew Cooper wrote:
>>> CET-SS and CET-IBT can be independently controlled, so the configuratio=
n of
>>> MSR_S_CET can't be constant any more.
>>>
>>> Introduce xen_msr_s_cet_value(), mostly because I don't fancy
>>> writing/maintaining that logic in assembly.  Use this in the 3 paths wh=
ich
>>> alter MSR_S_CET when both features are potentially active.
>>>
>>> To active CET-IBT, we only need CR4.CET and MSR_S_CET.ENDBR_EN.  This i=
s
>>> common with the CET-SS setup, so reorder the operations to set up CR4 a=
nd
>>> MSR_S_CET for any nonzero result from xen_msr_s_cet_value(), and set up
>>> MSR_PL0_SSP and SSP if SHSTK_EN was also set.
>>>
>>> Adjust the crash path to disable CET-IBT too.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> Thanks,
>=20
>> albeit with a nit and a remark:
>>
>>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>>> @@ -63,7 +63,26 @@ ENTRY(s3_resume)
>>>          pushq   %rax
>>>          lretq
>>>  1:
>>> -#ifdef CONFIG_XEN_SHSTK
>>> +#if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
>>> +        call    xen_msr_s_cet_value
>>> +        test    %eax, %eax
>>> +        jz      .L_cet_done
>>> +
>>> +        /* Set up MSR_S_CET. */
>>> +        mov     $MSR_S_CET, %ecx
>>> +        xor     %edx, %edx
>>> +        wrmsr
>>> +
>>> +        /* Enable CR4.CET. */
>>> +        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
>>> +        mov     %rcx, %cr4
>>> +
>>> +        /* WARNING! call/ret now fatal (iff SHSTK) until SETSSBSY load=
s SSP */
>>> +
>>> +#if defined(CONFIG_XEN_SHSTK)
>> Just #ifdef, as it was before?
>=20
> I can if you insist, but that's breaking consistency with the other
> ifdefary.

I guess consistent of not depends on the way you look at it. I
generally think simple conditionals should just use #ifdef. As
soon as there's an #elif or a more complex condition, #if
defined() is of course more consistent. But one #ifdef nested
inside another #if imo isn't a reason to use #if in both places.

Nevertheless, ftaod - I'm not going to insist, as I can see this
being a matter of personal preference.

>>> @@ -90,10 +101,6 @@ ENTRY(s3_resume)
>>>          mov     %edi, %eax
>>>          wrmsr
>>> =20
>>> -        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in loa=
d_system_tables(). */
>>> -        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
>>> -        mov     %rbx, %cr4
>> The latter part of this comment could do with retaining.
>=20
> So I tried that in v1, and concluded not for v2.
>=20
> There is nowhere appropriate for it to live, anywhere in this block.=C2=
=A0
> And it is an artefact of me bootstrapping SHSTK to start with.
>=20
> The truth is that nothing about MSR_ISST_TABLE matters until
> load_system_table sets up both this and the TSS IST fields together.=C2=
=A0
> IST exceptions are already fatal at this point for non-SHSTK reasons.

Well, okay. To me, not being as familiar with this code as you
are, the comments was quite helpful ...

Jan


