Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F4452EA8C
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 13:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333828.557749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0Zc-0004Nr-5L; Fri, 20 May 2022 11:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333828.557749; Fri, 20 May 2022 11:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0Zc-0004LJ-29; Fri, 20 May 2022 11:13:36 +0000
Received: by outflank-mailman (input) for mailman id 333828;
 Fri, 20 May 2022 11:13:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ns0Za-0003zk-5z
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 11:13:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2d444d5-d82d-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 13:13:33 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-OpUeQ2gSOAuhBnwQHvJNEw-1; Fri, 20 May 2022 13:13:31 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6164.eurprd04.prod.outlook.com (2603:10a6:208:13b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 11:13:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 11:13:30 +0000
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
X-Inumbo-ID: e2d444d5-d82d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653045213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqM2RAFRgLy1ulHNW4ILE9U6rrTln1lD78nbV7TfMos=;
	b=B9aHBQ9C68s6Mal5CIvPiRhIgvO3aCmPNTlpMAgY6xqeAPOp83hJgPbu1iUOcXBDq7wp5t
	jCTJw8eCL29BIejH/MovYVZYozFYgkDCRFo19Yrsd4t9uM884mLpoIx6QCA65rxtkP2EnY
	73mlWe87jmVOsBpgcbGVq5dLXPaKyiU=
X-MC-Unique: OpUeQ2gSOAuhBnwQHvJNEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlOLsP0sRKUdswaYY36+5zOxIqkPMN5BECiYoa0iY9gtNqCzdhGDbdyTFAGZcQWL+WdjkEAd5wa3XeAlVvUrbXYvdX2zu2UI8Cxy0BMFwhVvD6Ad6SYuepyZ7uyh7WW2KsyCIW0iqrTKJxkSlh6XgdY0vRGQnRmEU8Q7C0E7eNdD+Fb3CPbIkaJypKMIAqFLgW2zbRjo+pYiaAhWmwE0ICWqALIbN3nE56GKYwg0uOH3AOWWUyHBCqC1nBrEmwbUg40gWob2uukskcmFDM/Aaj1MscV9VSlascrXnOxwaVJNN+V37cXDkSAcJh53Q+l8JyQhz2PJXbiMfBNhuD/4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKSeaHlzp1uOtHYT1aSDSk3o8Q4IC8Sv6L0kCrRoKHY=;
 b=UkRl4nLBVKek9cNeGAEoeFlwJBMnZoXObudOK5YJ28hqUbx40hZm53XKfAztVP5MpznTMlSLtQAaOAQ97tR3JXcjAv4H+XsBvGgZqOB8wEfFsGtwaRoVE7Mbj7b9Aa2v12c9CNvDgP/HJOBtOEuK93mV/7sTvjwUccFZOfxuzj3csIgtGevuK5cYvMOhyM3gF4N7KqP6K1lDJxK1i3nm4Pzh40oGNUYypnrn23r9O1aHfcUcaAQkajrco251EFd5Oe/8zPLJAV7xIaiIfEv5fO8CDz50GQV0BCzfTE5uuUCNYfFapeKxYVN87Rf0epUB5jRHqoYbDr4LP1eZRcoB3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7163fdba-c128-1226-e1cc-d210c5db06ad@suse.com>
Date: Fri, 20 May 2022 13:13:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
 <YnUDeR5feSsmbCVF@Air-de-Roger>
 <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
 <Yodx21zhWtZCV2dY@Air-de-Roger>
 <600c894e-a35b-e27c-898e-8f1cf3ea0ee4@suse.com>
In-Reply-To: <600c894e-a35b-e27c-898e-8f1cf3ea0ee4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0166.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdbb5743-b5ad-4ef3-72b6-08da3a51c567
X-MS-TrafficTypeDiagnostic: AM0PR04MB6164:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6164ED16FAEB7A7F9AC72B8FB3D39@AM0PR04MB6164.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c+ATQFURpUKgWAlpiQ5jfc66NmVccygVkxRWfKjy7UrA5RoTaZIvbfZoq9noAM/ipGosbWfe/QdMrI92c9pX/z76zzknp8ZVg6aaw+g5O99/465S8frM2+jVWNKNIRPNQcLcC8XYl/sUpEsacJ6Y3D1YFUwhJzxl1gNtxHemQFkBiAJavZtO8ZdFqJJ/WQE8i24k7H3rnEqbVi4kKTJAgzv/JtUmwXvV5bwUEb2HSsAjc5yOBoiVGcIjJm5z93/bxeNr3aOWqkihsAnVBGT2QrND24eUhnWewc79t4XLuBtz2YaFrboD/fNkyjTwgJ4nf3Cdwmv2wUU2fZsbHmPBjr/TnhA3uoPhq86gH6fsSbOHQq/xNjsZqf1VP9uHXCZXvGY9r/7DUsTk/oOKEhmXKZX0X7RKMiSOyMjEaq5W/vbSF2hkBSzc/Q9f5BwhPBwDRqh1QOXOKO0EbStdBDc2UP3zCat4wKNCkU2+RhXAhy151iLO1meJD4bm7er7WMRq5Vh+FrTP8Dvdd6E8QJ6PRQsJ/OBGfwxsE3CMBTnygau8fbd0O0UjkYkLgmQtbpwoWI+O+1gfSAlBie32unAryjt5UH8aHFwarYDBDdTXqwyfD6IU8u8wCRrkcBKKk10UJ+epLpdSRC0+UOkzUoXTNAUgNpALQHoQA+VFcsaLC8LUWkuEUcea+CzJDV08moDe+fc1cx0lUKP3VQIrBFihkiOY2P1leBgwptjU55kB85jWyXJjElvD9GjGzbCmCXXX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(53546011)(6506007)(6486002)(26005)(31696002)(508600001)(38100700002)(2616005)(86362001)(83380400001)(186003)(36756003)(66946007)(8676002)(66556008)(316002)(54906003)(31686004)(5660300002)(6916009)(8936002)(66476007)(2906002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wyjcY6CMvW8KVDxFFmJD1AtDmo5PoyODoaJ2r+P3+b0A3wl02oFzIvxZ8Uk1?=
 =?us-ascii?Q?YYn3QjRyhs37S3eP/4SvMBe6H/0Av6FoJ1Qljli3eTrfZ7wzZig71nv/W/O8?=
 =?us-ascii?Q?jxL0bOdQSS+N4K7d10pMvw4+Zkd+42hrph35KcQpfUJa/IKZATq6tXpYwrsu?=
 =?us-ascii?Q?HtGNVZGI9yjwHMrcqZ/Xbo3fRwZbezMonREmhdQnwP+/QEJ9Ai9EJ+6LdVgP?=
 =?us-ascii?Q?yA782rurMotbJ8Xq6W6V7uMgP0iwndXCxfMj9/3VzQse0nFzeC583dOlgJ9N?=
 =?us-ascii?Q?sFTXVVqmdTsmqOx0s9FwF1d3fSlVsz1sp2n1lBuAPFiJW+Cay6AGBLFNrLpN?=
 =?us-ascii?Q?qcxUuhP/y9L0wIQFQo52jso4bw7rnuQlp2di9ke04qSbFwcChrMYiKR8MK21?=
 =?us-ascii?Q?NmCuK3DDGite2/wB+bUgQbKNXNbcfecPv1Fs7WHhbDwStIXSeouZGQ/QUQdS?=
 =?us-ascii?Q?aWyBbHY1Zh5SLRHEBRrzvaoWVAvNaal5/9XZBmRQ95dK34QGWyPIVjqdHGY9?=
 =?us-ascii?Q?fplQu0c8AgAZ2hX9v3sicmhSfbypGgcIsWSGl7BxFnHlzV3FmHuuTarDZXyB?=
 =?us-ascii?Q?6YMnb/UW88ka8xXYCZW2kz0AGAWOQb4eaOSuOsVe8G4SGJL1Jfq5R/eLEbL6?=
 =?us-ascii?Q?JSipVeQzEJUPjz0hN7wS3fvoSqsug8MqGn9EnkTY1bG/U/R/b4dSgefGHQgX?=
 =?us-ascii?Q?yvZ8QuZxj6/Ft7RA4nDKW3R7KAuzJBCKhffZUw9H5XQAUqmfZouHeewphK4W?=
 =?us-ascii?Q?CNcwlziCSLycGuSJbKvitBsMZsHsTb2qDK6vtKuU5wv+JYaScqIZLF9t9dPT?=
 =?us-ascii?Q?No1PT6Ozlj2TQpQgT6bx9Fnb5P7F+KAndM1dRTHqGgHB2yAFDMv+luK6E5cU?=
 =?us-ascii?Q?egUnHvzXljnyaCXQwFj0p6lgeWWC96wMCniTNUTNVMzxsDNsJHa6bC4jsEtM?=
 =?us-ascii?Q?Xob7WS3wdkMJka8GWhHqqxgJeVawrLxXfvz6V8bkGkyZvjLat2iq1FOM4+p/?=
 =?us-ascii?Q?Zhi2xvaLwTE0eQRY0nR5d7z8w4Q0gwNYo1Vs3EOB2I1uK3W+tf87eZJScERl?=
 =?us-ascii?Q?rk+jm9ewBtydfz4h/WT/dDFrtoYC1IETQl8Tr8/g0rDE6kVH4JYYQyjF9sis?=
 =?us-ascii?Q?MsMTclwmJSDu/Zh0sYQEQGpO+U6g+usx+s3KHvjEUzKrByGMsy6KxSaVB5wm?=
 =?us-ascii?Q?Aupd3GSdEiPza09r7O4YILTVvoTRcnwhjJymaFMhP0nukrVePnknFWU5ntUo?=
 =?us-ascii?Q?+01KblgxuQAYhp5PeuS+pTAM/pKgFezVlH+MU0ZSVQv7GB7I/XrGist8ojJK?=
 =?us-ascii?Q?FZdtdyNt/eMWrPMK9ryW9veBgVvI/B3Hi8h7r9wCOoUAdDvb1+9SeEq29xF1?=
 =?us-ascii?Q?wkSc/caMtcz7reTRMLcTNr8dgtHAE7nOZ7H4XiFtGzvDihmdyLlbWkffsCv8?=
 =?us-ascii?Q?mOPLgyE7k6CdHztklQL8ZoJk7gCxaz5ztImlLpSiCIOJ+yL9axNTTJefbwMs?=
 =?us-ascii?Q?QR9APvoi31U1OOr5CkR1J5lr/gfpAh4i5QK9PgVZfQhdTTrGnv/wUidj1A/N?=
 =?us-ascii?Q?mcFuJDm0VJIulXWged4N/FL9enV+hjX4/7FCivV50xH2heTwH73qQKaBds7C?=
 =?us-ascii?Q?Qyy1eJje45gajzPWNJUtwdF+hyutqmWZ7IvsEPCT4iYHV3Jgy0j568VoaBs2?=
 =?us-ascii?Q?dWhsedM4aE5grseQ4C2nRg+Wqp7FoF4SKPBQFzi+vQP8SDfrBFfT1EU98MKq?=
 =?us-ascii?Q?2zDs0TcYfQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbb5743-b5ad-4ef3-72b6-08da3a51c567
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 11:13:30.6405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJ0R4t1BIfvRnCVApED6XjCn63kHMh5DuKXMMDoc19tw1ew8XytrcrgXq3An0/nOrk1w1XxomE6Ra1H1Xax8TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6164

On 20.05.2022 13:11, Jan Beulich wrote:
> On 20.05.2022 12:47, Roger Pau Monn=C3=A9 wrote:
>> On Thu, May 19, 2022 at 02:12:04PM +0200, Jan Beulich wrote:
>>> On 06.05.2022 13:16, Roger Pau Monn=C3=A9 wrote:
>>>> On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
>>>>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>>>>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>>>>> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
>>>>> =20
>>>>>      while ( nr_ptes-- )
>>>>>      {
>>>>> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
>>>>> +        ASSERT(!pde->next_level);
>>>>> +        ASSERT(!pde->u);
>>>>> +
>>>>> +        if ( pde > table )
>>>>> +            ASSERT(pde->ign0 =3D=3D find_first_set_bit(pde - table))=
;
>>>>> +        else
>>>>> +            ASSERT(pde->ign0 =3D=3D PAGE_SHIFT - 3);
>>>>
>>>> I think PAGETABLE_ORDER would be clearer here.
>>>
>>> I disagree - PAGETABLE_ORDER is a CPU-side concept. It's not used anywh=
ere
>>> in IOMMU code afaics.
>>
>> Isn't PAGE_SHIFT also a CPU-side concept in the same way?  I'm not
>> sure what's the rule for declaring that PAGE_SHIFT is fine to use in
>> IOMMU code  but not PAGETABLE_ORDER.
>=20
> Hmm, yes and no. But for consistency with other IOMMU code I may want
> to switch to PAGE_SHIFT_4K.

Except that, with the plan to re-use pt_update_contig_markers() for CPU-
side re-coalescing, there I'd prefer to stick to PAGE_SHIFT.

Jan


