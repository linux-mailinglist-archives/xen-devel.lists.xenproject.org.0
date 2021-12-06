Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4530469BDF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:15:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239225.414637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFiC-0002a1-74; Mon, 06 Dec 2021 15:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239225.414637; Mon, 06 Dec 2021 15:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFiC-0002XB-1c; Mon, 06 Dec 2021 15:15:28 +0000
Received: by outflank-mailman (input) for mailman id 239225;
 Mon, 06 Dec 2021 15:15:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muFiA-0002X5-18
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:15:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56421f89-56a7-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 16:15:25 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-Z3DFPhqRNoOd-WVeIRndFw-1; Mon, 06 Dec 2021 16:15:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Mon, 6 Dec
 2021 15:15:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 15:15:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0057.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Mon, 6 Dec 2021 15:15:22 +0000
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
X-Inumbo-ID: 56421f89-56a7-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638803724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DIFaz3vAvQo/bWdfPBqwGYou86Srb3EiWYTbGAA7w/4=;
	b=MKspDNp4MHeS38hEVF8tVYd/N6r6SVhwfA0XasmupId5Lz5OGy5Rbp6tjvBgNTCqhFq/1a
	u0CTnSZ6uSsmrfE8Ra3iwiYbRBcqce6XfssaHjPNy74kEbWpbo0SriOtWK512519yaJE7H
	MP1qkSeMLc2eaX8aj4Z07hmzA+76NjA=
X-MC-Unique: Z3DFPhqRNoOd-WVeIRndFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Td12/nKndSIL/LLNj+ew2zetkaBvTP1JNmiHoUkvTNRJxsXBo+0S0GcezU6SInGe+LrQ6UBL0vPVFkWLlS4itqLDqdiA/X/Bt2QR4fUSpbpBDurHXfHlju8mLCnsoeNBIq1rhBjaX55W3AifsaFV9FHGIhFXGU0yb1A+jjikM/mJLRqekmdoEG9Sy363GYN8KKwB7B7BuiH+IdV6FfbdBx0P7Ose35c4JtPMlP8lTWyqQK2ton8ptUG3UvJuxoexxTRizXCZp00QAgHPrfahP+wU9fpvQD2oYKhklFEtTE5JRiifv6pMA/3ODBDh0IAQZ4z0mB5EmAUM4FEOHRU3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Xuibp43/JaJ8UQdYMRsGOxHv7rpHvG3g7rC77lZ7Ag=;
 b=J2tAHx4Qp0LyG227+eirwKPtCNGfSWI21a+CZy6tCMIiPbrpiMyM35z/Dt7jwExf8K0ylsHleV5SE6UCVtp7xfPBMwuZjZ/Nn++XJnh7/AI+1WDpUxYoqHeUWGJPfX55O8SIEwGGv9qiLV81Mpq3JkY+EOOGMfGe1kE1q9KkJRWh1Gv0xPSb1TQo8pxJh55wL9ZryrsX/6+B4Cs2qomsdI7p3Kxx3CCG9rd1xypeiZp+OvLEk1gy5no2oSqcp17OZqen917T3V1C42yNC4g0thy6mArAAGBBb6LcI7Zz8R3BTsduv3dyzbT2vGcqpf04Dt/qX/zEhwh7kOpw0xnZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0b3b89f4-caca-a591-13aa-35683b9925e9@suse.com>
Date: Mon, 6 Dec 2021 16:15:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] x86/irq: Improve local_irq_restore() code generation and
 performance
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211206133828.8811-1-andrew.cooper3@citrix.com>
 <b7c3525e-9acb-cef8-56b6-894975eeb530@srcf.net>
 <1884c09b-2583-efd7-bcfa-8413865c53b6@suse.com>
 <bd34ada6-15b2-6720-7669-4247aed536f3@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bd34ada6-15b2-6720-7669-4247aed536f3@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0057.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 851382b2-1347-42bc-39ca-08d9b8cb3934
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5742460257F64DC446A7895AB36D9@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lmjIWJ3Y2V0rxMGGArb+llDusQ5heFrayJ07mzvazLwITi1PvbXUH5SGS4f0AS5vjio+ZHzbuCJU6rjgH5PSnNzLxr07522MSk0EWLEvRDtsh/gfftNNXtykbDNNUIlP7C8qhiKB0PlLUt5DPw1xd/0tLTNf281ajwd3s1uXQVVncNPlf4Ato+76WnHR+m+VBld9MT2QHzmrEqedcV/9cNHH6e+0Gm1DZ9DTkxJ13+YCvNfcnsNlEzqTf1qjh6cdxnfjcywMFT1LcB/yW6xrJ3blSN5rdT8jcPtwrQbpPSQP3rBGzvC/vWOlZvrPcAGT4huwz1WROI8xXovvlSIxVdpkqGjxoM8xYowg9KK/g7f5R9INsZLX2sLSGB5+IPeVHLsa9f+K+L0aRGbPWnzsMhXGdzqC4UrZGXTi2cMZ+4NN135MJJwdXWgSI2o6EkYIHmBEqmn7uMzHLxvSxOxqEgalFgnZ+uSjp8AE3Ed7bCQS6mvMdVgnbh4C2i7C941B0rW6Jq1HBd3pCoCfzFp553jt5FUN/kP0OFG2JTJ/JDAASByNUkU4AI2pUEYn983fiUFSv+MzSlklP604c88f1/xCbCWmgMIrgmoTz5lJj9FN06MUJsVGD1h03Tp6L9mdoOImpjl1Cs69G1DeSWx6noFMcBlJkToixZztlOIKTQFg3LQYJxzDwXTzGJa5HjC2y5mxhaV4BkjpOdEC6jHiDfoeBcGE9KCFTwCaFl3wMho=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(110136005)(54906003)(31696002)(31686004)(86362001)(316002)(16576012)(2906002)(83380400001)(36756003)(8936002)(53546011)(26005)(8676002)(38100700002)(508600001)(186003)(66476007)(66556008)(66946007)(6486002)(956004)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8q0qCrNcURe3vEVTrP8lgjJouUVzYN/v0LWllrz8AP+hB4kwsQtNBOCBmZ0y?=
 =?us-ascii?Q?PbyWNQJkVPgWZnrxtyecgXvzrJeE0DmvNjkGYRvkhZJHwDA7WMEifUAN+hRK?=
 =?us-ascii?Q?3SQfgtoxFAmlGdhnnq4K9rk6eMguJ949CLaiE/k2Y/iRa4xlZet2L/1LEWdr?=
 =?us-ascii?Q?LKvPwcyaYfVUnTJxwjIF6qFVW4pF0cvEqh40QnwuEwKVTjDOVYUR5cTYCRL1?=
 =?us-ascii?Q?BE6EFrWZHCgHDjukc/N+zVVxrJOj0zLmsjmE+K4vpU+GOoXrzS/HigZJ2fyA?=
 =?us-ascii?Q?rXJGiPv0RMzYsOpXG0WJ4QYQhld2d+gMLeN1c80nWoOOpZEsBC1aKeMchsyb?=
 =?us-ascii?Q?iNjpbNFN2uPhr0uH8DifcwDPmecTwX6YRngRnZTDRTZXuh/t7XxToByCVBye?=
 =?us-ascii?Q?kGY3rMyH93TgVGiU99Uop57K6zTm9cIIJLmEnhCAuYit/YEGOxQxFn9XiAs1?=
 =?us-ascii?Q?Mi/hMCYzoH9gQ9Fwc3C4pJ/MwPJaI3udfmlfIjLkwcwy3pMt/MJUIJAkyd6h?=
 =?us-ascii?Q?GXVtcEzy7qSbcbCj6Sxan0DASYd4LBS3xSaXgm/eGESbqJIheLYK0AGAXDng?=
 =?us-ascii?Q?NXTeRcnc/O60QuKpOe2wJOXd1qBFJ3d1gAREUvhPDcqRh5oQcS/rtPvJZ/cE?=
 =?us-ascii?Q?PoSKXA4HdZ8oVGI7LepdFTMItLg+LUB1R8oST/diMwShB16cMi2QaWjYbxyG?=
 =?us-ascii?Q?BbB/r4ruApqdzejrfCJEwEWRfDtFPJSHgptGNvVbZCLqRoBqTqZ+JOavP/3g?=
 =?us-ascii?Q?pmBqSuFWVJkvXVcsyd/9lYFRIi6zULVMY8sPP3F9C9kf3k2MyhjAsBRXiEPr?=
 =?us-ascii?Q?WjIo6pVZ43KMYsMiIsvzoahXJHZCsLhWg4PVxbHpb5ZmDtUloD52h2eNBQoN?=
 =?us-ascii?Q?O6kTaWMRuT0Zq2K4KQEr7CcYWaUUVDe3uuWQ9aZfEeIlheIIqXOSj2Jv1b/U?=
 =?us-ascii?Q?Lwd3MltxYCbOb1bfvuTQUjMMr2TLUOY4NJnriQl1QvcadLU+bsOYi0VjpnFS?=
 =?us-ascii?Q?QPDTVfz52MKn8Xs9X9elgsH41i3uxrHaiy3kBPGWvpOlRyM9SPWg5D8l5qPr?=
 =?us-ascii?Q?xD1CrStpt41s2FPkDhPgYSEmS6ICgQJrfNgc+o5oo3rUnbXQyKBQkTV/Btpr?=
 =?us-ascii?Q?7FFSjgZyClgTupwW6TwVRxFRSgXf0bZuTSOCVfQQG6SU65WEZ+exDf5UHRIw?=
 =?us-ascii?Q?5T6GEgvQb1uvUM+j/HU0ZOLF1ExM3A5CKi92wXl2sMfszCFmlDZjSO7dr9F0?=
 =?us-ascii?Q?gyv2u8RhgM7HelODCn8au531NK98kpqQTjTVM8Kva9/HDE7yf7DSPgxAi5QD?=
 =?us-ascii?Q?re9b3xVRdecKCWTeStN233cZY9APW0iM66IRc7Sw8QLJsxX6SkNlGFcrg3xm?=
 =?us-ascii?Q?rTx4AZHkWpZY64/k5Kd32M9SCbB61ytQwMEj6VkmukUk/euwNj94GXGRlelx?=
 =?us-ascii?Q?Qb3JNGijNQJCNp+0rYM5XbG4LVN+kvRQsXYBPfXfTid7mINAVCGjPsHXKxeB?=
 =?us-ascii?Q?5YVVZ5Ozbgy2IPYR7eeKreWEj6jx+nDe2jPx4oePTW2biNubfr/5gOssEKcv?=
 =?us-ascii?Q?DCDV6X1RM9Msw5fq+jSTcQLML5iHZuKGTIauIakFJs1ZvlkKxz1DoYxauc4c?=
 =?us-ascii?Q?j63Qz5foz08W2MuefmgnBiY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851382b2-1347-42bc-39ca-08d9b8cb3934
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 15:15:22.8480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQWqV6SIoRZUVXAznRVIJerL0e0vEH3Oo3OhgL5umc8yVDbgkuaMXzqOe5j0TGqhI+UHneeH9xLrSIPzeE6m3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 06.12.2021 16:10, Andrew Cooper wrote:
> On 06/12/2021 14:07, Jan Beulich wrote:
>> On 06.12.2021 14:55, Andrew Cooper wrote:
>>> On 06/12/2021 13:38, Andrew Cooper wrote:
>>>> popf is a horribly expensive instruction, while sti is an optimised fa=
stpath.
>>>> Switching popf for a conditional branch and sti caused an 8% perf impr=
ovement
>>>> in various linux measurements.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>> ---
>>>>  xen/include/asm-x86/system.h | 9 ++-------
>>>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/xen/include/asm-x86/system.h b/xen/include/asm-x86/system=
.h
>>>> index 65e63de69a67..4be235472ecd 100644
>>>> --- a/xen/include/asm-x86/system.h
>>>> +++ b/xen/include/asm-x86/system.h
>>>> @@ -267,13 +267,8 @@ static inline unsigned long array_index_mask_nosp=
ec(unsigned long index,
>>>>  })
>>>>  #define local_irq_restore(x)                                     \
>>>>  ({                                                               \
>>>> -    BUILD_BUG_ON(sizeof(x) !=3D sizeof(long));                     \
>>>> -    asm volatile ( "pushfq\n\t"                                  \
>>>> -                   "andq %0, (%%rsp)\n\t"                        \
>>>> -                   "orq  %1, (%%rsp)\n\t"                        \
>>>> -                   "popfq"                                       \
>>>> -                   : : "i?r" ( ~X86_EFLAGS_IF ),                 \
>>>> -                       "ri" ( (x) & X86_EFLAGS_IF ) );           \
>>>> +    if ( (x) & X86_EFLAGS_IF )                                   \
>>>> +        local_irq_enable();                                      \
>>>>  })
>>> Bah.=C2=A0 There's still the one total abuse of local_irq_restore() to
>>> disable interrupts.
>> Question is whether that's really to be considered an abuse:
>=20
> These are Linux's APIs, not ours, and they've spoken on the matter.=C2=A0
> Furthermore, I agree with this being an abuse of the mechanism.
>=20
>>  To me
>> "restore" doesn't mean only "maybe re-enable", but also "maybe
>> re-disable".
>=20
> nor does "save" mean "save and disable", but that's what it does.
>=20
> The naming may not be completely ideal, but the expected usage is very
> much one way.
>=20
>>  And a conditional STI-or-CLI is likely still be better
>> than POPF.
>=20
> It likely is better than popf, but for one single abuse which can be
> written in a better way anyway, it's really not worth it.

Fine with me as long as we can be very certain that's it's really only
one such case.

Jan


