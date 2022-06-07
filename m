Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6353F7CF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 10:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343021.568153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyUB1-0007Ft-BL; Tue, 07 Jun 2022 08:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343021.568153; Tue, 07 Jun 2022 08:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyUB1-0007Ca-8W; Tue, 07 Jun 2022 08:02:59 +0000
Received: by outflank-mailman (input) for mailman id 343021;
 Tue, 07 Jun 2022 08:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyUB0-0007CU-0Z
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 08:02:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d7e7706-e638-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 10:02:56 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-zgrFwNUeNCOOt0mZzJWK0w-2; Tue, 07 Jun 2022 10:02:55 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7735.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 08:02:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 08:02:52 +0000
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
X-Inumbo-ID: 3d7e7706-e638-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654588976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygwaL7VnH1TwlrUp/oCPl8jfiaqxo4uF7WI0QKrbZ8E=;
	b=P0O1PqnNbCgulQ4F77NFBSboWFko2vnlyfCF6+4aVECHbv3g7t4zcJ6BDbfLNAT9jgSjYl
	7Vvsl40OgW7EBKigKCTfcRaL/Hou2B4iWleZp2W99EZ15UxlTZir70l5QvBiOegfr/g5i7
	IEii0QrJuV3vhknoioM95BZvAd60YNc=
X-MC-Unique: zgrFwNUeNCOOt0mZzJWK0w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8Beee25w8ip32EWgampJ5X8Fh1Qd/k5VxlLGy9BWILExC8zpwfyJmp02FUSeRfu7QH41eWAsF40ipW0yTCb+K0kFTAaYlDEIsmimT2bm8NOZn2kLmrvStasRIw6P98605cEgZTnH+do+ECiYzPhqZtMUoE4q5gV6GY6HwvD7cMgiEJvZCnZS0tOIwrzHIKs3IE1Hug4Lxr/tdOqt29ddCKA1/vSDW7anDKj4/y4HOP1Fu4WkiVCoB7JyEoz2jpYq7jnRsiGNNpnSnpjyEBjstBrq5MrdcxydJzAqwMwXmM1c6LjWfKGUI/u+gpSMp45rpT82TvTTSIuG+Q9+fgdMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+UGL11kf7cinjSaSYFT2bKH4Hc9cdI1wPnU9V4K7v4=;
 b=jpz+blz6EN7Rhb9/hrlWV6mYWD5Mj+l/QmaT3Wz/whldPDM3WYnk8yFOs/qHu27D3SC/eN2zbFyh74l2tmbDi9WWkiXZ4ZeXQehuHwhG0bWWCRl4iGL3HP24dFDXCXIvLau60ON89lTe4694Dz4Cc26BIvupVWc/mWCQsqeum/ZSb5e02Hl2kC1hOAb5p7d8+EOWhu3ywSnE8ziJ+I5wvZve4Pf7q14kttaHr6E8LtzIwIxz71aPyUnzhrncy0kPd9SjUAQs9q7ggA04YwCp4dLBDNELjUgFV8eyqdbVk6XKlCbwM5Nkwo/C+j/pAWrdJ0L/NXic8fvx/g8BtTAFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+UGL11kf7cinjSaSYFT2bKH4Hc9cdI1wPnU9V4K7v4=;
 b=JHbadFJiFZF+m6CISH086rk0SoVHHm1DXLihQi2t7OfOXrfOlKMbGBHnRxqxFnrHaMeMJnBFmr3/OC9kom9875ZEtK11FcBg/Yie6j8D0MR8Rn6XHtGqop7uBMSgdo5g+U/Y2twa69DOa7eKEo4Oc3aHgBO/vG0zSJ3+HOX6Dzwutzs/hkUki3KpJ/IUCW/t3m3WLi/y3NBJDqd/UuuU9lGQ8uruXwKPDSl+xfk1ekqnbyA8dsgxo1pit9f98Il4NJ/OsKQditrP5QTb0RYPHeAE49TwIVrqZtoI0Q0uTIsYrqJPe5jxt1Hv1GvC7oStZjDIji8KytJ7Hl57tyD3UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e951338-6b54-c5c2-1c44-96fff795671a@suse.com>
Date: Tue, 7 Jun 2022 10:02:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RFC 1/6] x86/ioapic: set disable hook for masking edge
 interrupts
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220421132114.35118-1-roger.pau@citrix.com>
 <20220421132114.35118-2-roger.pau@citrix.com>
 <85dfc48f-3440-1e6a-dc44-4c2bb050184b@suse.com>
 <YpogVFqGl1zS3VCU@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YpogVFqGl1zS3VCU@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0089.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28ab3a3a-1f2c-420d-a058-08da485c1f01
X-MS-TrafficTypeDiagnostic: AS8PR04MB7735:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7735B23CBF3C3B5554DA0CD5B3A59@AS8PR04MB7735.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	++ssjQzDNAzqKzTAgvj2YIxSItx0p20dIbN790ODhhbkMqUB8yKmpzeRbfizT7YeGB6Fz/JfaVCFqr5RBhNF2o1dWT/e2CeMJo7ehByBPPE5F34g66uvECcjkdfr8BGetuIyYTyaoR562FduGHuDSb9KWThMp/3/oaUp5w8m0GflxoDNkStDEtM1iRjdS68KgGzw8g/BpR1tPPM25QheP8mPKOtJ1psZxhTget800s+UsA/dry0Z/z4qb3BFLoVkBukSttBrH72o9jA67sM3jETw2TJsZ5V3iSXxZ7H7bGJ9cRiBgrUTbepJemij9ev0IdJrXajNV5EbQ9HQfaR/j14z6dfx1Ys7Mw+2VwulYPQV7i0uzlJi74MEDbib0Tmm21C1jaC0zv4rn1trcj6sLQorBVI0wsAzC+kppPxpW+15mARTGoOrVvIvyqw3/cZic0+3vDXBV5GDn8PjqdUdLqwthoJMUMn7YZQ60mYUKXEXKrWVGj5z3GyOeICkxoKlRLyKz4ivftPXl5KWYRZ9RveoIztMblK0wYFVYsLofxQF07g9j5OWBn5zuv9Vu6uRMxRk2sloWP9ey3ON2ecFdItLs8KNE1gnCViPykphhGY41bm64WbBm8/oqB1SRZCOO4AzuRxNCBZm21fpsHsOF/gHK0+kvV8V5vPxVTU6OlrmAUorym0XC4CJyg9mshrGVR6ZmLA5nCv7Gue4GXo3HBc4sHY7RATnlbwjTpba/io=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6486002)(508600001)(316002)(83380400001)(31696002)(86362001)(2906002)(2616005)(186003)(53546011)(54906003)(6506007)(26005)(6512007)(6916009)(5660300002)(36756003)(8676002)(8936002)(4326008)(66556008)(66476007)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AaNddRHYtjDLi402jCoOxaCuWN98150ra6yHAfiRHbj3JkMFhuPIM5JZ8Eqf?=
 =?us-ascii?Q?gwzJD75zawlCsTxGg+r7Z670L4ykf8nmyy3NW0gUpY1OFISd7wIHG77cH7YH?=
 =?us-ascii?Q?dcygXpydv3gXcwIsOEKjJiYIES3dHOlsau3Y6mVXs0wa4HCbs1+yZ3AkgXpR?=
 =?us-ascii?Q?k/+P2lynKUvEmcX7BpK8hPP9b/nRAm0YKesmMxnzPVJ0WHZpKCb7RecOxhzI?=
 =?us-ascii?Q?caQfcffcf7OxbMkgGSIODneUax+75PsOQ82rHvy+gHtw1bDS0XYlMYl3cPA/?=
 =?us-ascii?Q?Yn2DZbpZq+R5JNPCjMd9n7PnM5KII0ERFG4auBOQXv/7sdMI1Fz+gTAORN0w?=
 =?us-ascii?Q?C+tOduLjgiJJYbxR2s3eRrWhQM0sHRo0dqb3OP/0tSpITnUBxJbAnTGQLmd0?=
 =?us-ascii?Q?jSJvru97o4WMh6T/dCj8pHTwZbr3m/Mdm2yRMtjuoo5Or/aXv/Ohizh7nm2n?=
 =?us-ascii?Q?V+ileUTUM/4wG1MrePxGjIeS4Mc+RCeN9CHg7Geu9ieES2JHivTt6H358vZE?=
 =?us-ascii?Q?rMRkI0l7oC+TP78YWvdwQBNoOw5OUd37X2s7wB8cCUVxWuTMwt4NJQENAL7F?=
 =?us-ascii?Q?koObvwB1TUSgJwS8xfs6s/lYr+y77lzQ2+Q5U6UvR4TXslF3fzpnRl3aarnS?=
 =?us-ascii?Q?KHqV1b3Mkaem3kMC5/vQAcmoaJuSMTY6VKjas9n9zC8M5Z0ME/BLvsEJ9QOQ?=
 =?us-ascii?Q?4WrfLYeeFk/TC1XXSPG4t3NBXI6fXmegkBdhqaM39HifP1MoIySOmKI/wHWb?=
 =?us-ascii?Q?uNISDnKaZRcabVWyqVpWqMbZhijG6LFBgN3YBQQtJL0UudXo2NgVEkX1THKH?=
 =?us-ascii?Q?/vLfCi7VY0S6vzP4wSwnXME2TpFawZu7Prf0j8/cRGG1z00pxSvP+oEMawtd?=
 =?us-ascii?Q?aMx+sO8e5eRoYIpQDxEm2wSCNVKKjajlFNMoBS5WjMf3JXxPt0bkSLVLIo0y?=
 =?us-ascii?Q?3o8r2YAYsZqvZCu8RvKRuc6GHPLG8imx5iRYbXrVhx9OQDEdhMAwnszcTsXB?=
 =?us-ascii?Q?/DeKirg6PDahHHkx3Uo91NLPo/00xpi6svaIeqlMePxqv7i01/YMvmMECixP?=
 =?us-ascii?Q?6UKtH1UTILqUQu/NKWTh4McXiwaP/VpP/TqThvQtxi8iAq9LhHMgyUYdpGGS?=
 =?us-ascii?Q?OlkS7mxvPs5ZSuFbLXVlmMjToNIMX/jbjmXENkrzOqRIflZQQ9zJ8VmKB7xr?=
 =?us-ascii?Q?NVR+1wiq3PIWovYJudiqpif7IxeR8oKb8SAiH2DjKcvaEVGy3x2STpPomn8/?=
 =?us-ascii?Q?QeQ3vWoa6LW6TEVuj2AxTJctxES1G733ofH3PdfhKAooCb8K3almrNR8IP2D?=
 =?us-ascii?Q?YU465cywLlrkgi+koevJkLA937nD0sViFKWLTsjEWmMewb7USzfndMZ4TZXy?=
 =?us-ascii?Q?EttXs5GeM5OVq7VBOtXD8iqmqMKgbeFNH/YxhAwE8XsIZyEGxkgGKxobYebl?=
 =?us-ascii?Q?kLGTDxPyWmR6N7KqiQDBHoziG0rg7k2WQiRmUGQK6G+WsqsNrS9m7mG3hbb2?=
 =?us-ascii?Q?8O1iEO2qQxtxZlI1igHjNh9itKNn4QgA4BbwiqvHDhnrIbQOOegBWg31CHWS?=
 =?us-ascii?Q?+cOYcjZFVSzm0EBdjV46Fjr2idK/x1Y9zne3KDQkEl9c1lrVlhxKTJp0xKkd?=
 =?us-ascii?Q?v8PYVRMNtH4NnQFQqBBVKuZJy81hNlg+UUhTEUFGk9fw9tzOwo4oHgmZnIiX?=
 =?us-ascii?Q?v5iuSQp45sJSAVpZakskCwMh0Efp9Bn08a8fonMRa0oouHH7kXKjRrtImtHB?=
 =?us-ascii?Q?V2H/HOEJDw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ab3a3a-1f2c-420d-a058-08da485c1f01
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 08:02:52.1831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCSxbwWEFFQCeG7xSMFU2cGd6AwXUfzif9WWAnP/gY79OCWHNQNFANuhkSW+sz3HsHVDBnlZLcV410ctfk0H2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7735

On 03.06.2022 16:53, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jun 03, 2022 at 03:19:34PM +0200, Jan Beulich wrote:
>> On 21.04.2022 15:21, Roger Pau Monne wrote:
>>> Allow disabling (masking) IO-APIC pins set to edge trigger mode.  This
>>> is required in order to safely migrate such interrupts between CPUs,
>>> as the write to update the IO-APIC RTE (or the IRTE) is not done
>>> atomically,
>>
>> For IRTE on VT-d we use cmpxchg16b if available (i.e. virtually always).
>>
>>> so there's a window where there's a mismatch between the
>>> destination CPU and the vector:
>>>
>>> (XEN) CPU1: No irq handler for vector b5 (IRQ -11, LAPIC)
>>> (XEN) IRQ10 a=3D0002[0002,0008] v=3Dbd[b5] t=3DIO-APIC-edge s=3D0000003=
0
>>
>> I think this needs some further explanation, as we generally move
>> edge IRQs only when an un-acked interrupt is in flight (and hence
>> no further one can arrive).
>=20
> A further one can arrive as soon as you modify either the vector or
> the destination fields of the IO-APIC RTE, as then the non-EOI'ed
> lapic vector is no longer there (because you have moved to a different
> destination or vector).

Right - this is what I'm asking you to spell out in the description.

Jan

> This is the issue with updating the IO-APIC RTE using two separate
> writes: even when using interrupt remapping the IRTE cannot be
> atomically updated and there's a window where the interrupt is not
> masked, but the destination and vector fields are not in sync, because
> they reside in different parts of the RTE (destination is in the high
> 32bits, vector in the low 32bits part of the RTE).
>=20
> Thanks, Roger.
>=20


