Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC5540A93C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 10:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186268.334990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3r6-00013s-AH; Tue, 14 Sep 2021 08:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186268.334990; Tue, 14 Sep 2021 08:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3r6-000119-72; Tue, 14 Sep 2021 08:31:52 +0000
Received: by outflank-mailman (input) for mailman id 186268;
 Tue, 14 Sep 2021 08:31:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQ3r5-000112-I4
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 08:31:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b63575e9-a921-4937-b210-41388abd894b;
 Tue, 14 Sep 2021 08:31:50 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-ZBfO--oEPHC6hRiAsiZb9A-1; Tue, 14 Sep 2021 10:31:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 08:31:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 08:31:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0142.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 08:31:44 +0000
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
X-Inumbo-ID: b63575e9-a921-4937-b210-41388abd894b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631608309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M09F3jpJ2XrXXO2NKOicKlAkmmQYFljFuPYwTdMbazE=;
	b=ZkmCsLm7JwECIiU/4Y95l+fvBAPy9v043AwxaBqNJsyCKGFkBSo1JJw08JG+GVXnUU99Zr
	NHdU5x3CROxKEUNoAd/Ubh+B531GRM2uh0FVZdtFeY4U+z5suWj10mThKqry+ongfKSiQF
	BC/91qLNL5ExyA9KC9NfqxT1tetKIhw=
X-MC-Unique: ZBfO--oEPHC6hRiAsiZb9A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9Tg3SO0ALScl1ojgXIVd4nbp8CY8B6Pj5owYYLMg/lsUK6YUdpn0q+cU5S6/eoiuLF0gpUVHa/l6M1ogW/MIdvy36tKTghfM3e6M8ar+ATF6//1G1DGj74Pc1cE8MeFfVW4Ok2GkTgcNIUuDqXVm5nNbImknaLNdGs9xdu9CSmwh4voGid1gzBkbdcP2aFzHYaPvgcueJtfpMXyHjjD7GMtW/h7bjxf1Kz5TvIdOss6Uap5MwjcPzGJMvQKwS26PJu1uWRXZz2zJIHd8Ciauobygnyb03rcT3uPNvwKNLb9J490f/8q5Pns89Eo6Xa/7732kkkiGiAFMPGJFaqkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=c1PgFZ/1KSPVZt+CxDUU17pwkTnnxg+QY9W8NaCFS90=;
 b=DYiRDSmCvbae79ugt8nzpWmvy9SoM/urrGSWbm2BX7bEf3ciiEMSSDnHHJ5Nm2bg+Bzdys2iToOkDjgHNZHTqNoEmgbPp61KRjuL/rBuMnODb5xs0NZbKKntyPnCeJPZSzS2wyHvQbm9SjpIGKPWhFjiOOpcP5+MgxWvXfCqDRY1pOq/jEg2plsRDkRX5+W0p/rk2UoqjsoRIPNk29HTkBS/pQAu3+g/+zxGOzF9WqH2mkUFa8osLSWiXyzp7m+soxOcHZtNWsY4EctSB2fFNN9CxHqX2/W29t3TCKiFiE4ATLgntVInIn39v2JXlQb9oiKBRqZY8/9c+4trLMxCOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [RFC PATCH] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Oleksandr <olekstysh@gmail.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <1631228688-30347-1-git-send-email-olekstysh@gmail.com>
 <398b436a-984a-d6b2-bf88-33e994c95c55@suse.com>
 <c286febc-b7b4-5aa4-5331-f0c2f6a17000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0ad861c-d8a8-82f0-023b-26c3fd4d50cb@suse.com>
Date: Tue, 14 Sep 2021 10:31:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c286febc-b7b4-5aa4-5331-f0c2f6a17000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0142.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04ef6c99-1fae-4fcf-1eb9-08d9775a163a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445070EAF0E55A11FF60D35B3DA9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YgV+wAsvqKAAIPeAV3FMoYas33lOvrWrdOlEicB1pDFShzguXdpXbE9VinE6C5GgbQrG5BGRVwV7pqpFzCcrNu+yRFSWiZqG0DBsDsNBgghqzDTs9Qdp0nPLv870OziDgvQ+CCiEh6YACS9V+r06YhALWFMEi93cowKu4uMjQ8Re8/5KypTD41Sq4hiWy85OIwxdmjXEOkafCTmzPqS5+qeBDi6k2xkMFvuuE7dUD/maXDRhuwQNEi91S9atLAbXRJfKwmo78UhdnhMv1InH+cEq54pEHEYZfyUZjMW6gmbk5NyjjQQGvdbyjmz1IrpJPf1JfKQpS1v2l0wOLThmx/7mH+dQMq60KUzBDg/yVZGwrk8AQ79dw3mJWKA++AYiAbBmYvqhrIi3cGLnlyeFuPNsVtYhW3GzLK53/Yf2gsVl/BosnPKHWY3YD0wp0qJIjjsJuPHhOzDBtgdgo2mTTN4pXiLYUAAKnJpwKl6xZA7a9wgPoVEymYvZHMODMxgBbN9PoyOS67Q14KoMqyWxRVC54UHADsQJvbN3mMNGdqzTo0XIDt870uYS7H0GyRW7DM85drooGpxbw/LzkLaGEWHnXg+Kgr4KrjtncwKpkBTHnj6Pom6P3WiMBDYRckpBvGJzNQ4fNPndfS2KqdBARqeCyBvlB10ON1Xr5Itpd4lN6GZCaSn3li3F6EQ+gQNCty0NRk1eEbZjBiqQcLTvm4cRt4d4srt/d0aT0MMdM0PJtBRN4EW52IJcRfPbXSLNlGzztnVq8Ev0CdenhJzyAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(396003)(136003)(346002)(36756003)(31686004)(5660300002)(66946007)(2906002)(66556008)(38100700002)(7416002)(2616005)(956004)(66476007)(6486002)(86362001)(4326008)(16576012)(54906003)(31696002)(8936002)(316002)(83380400001)(6916009)(26005)(478600001)(186003)(8676002)(53546011)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LjT3xM41PbJWTGxVDlm9cCaS3tsngm9SM5OtnFsVdye3+Rr925AXJQ937XYv?=
 =?us-ascii?Q?y6xUrllr/fJakx/dixJAf5nv1ThqVF1q+H/9Xavlv2iJkuZFegS7R/40xr5s?=
 =?us-ascii?Q?FM0WnbI5Ohfqp+7TYRWJW6iUVDP0q/KA+h5QViCYAKRA0fhENvyucbW6IQvu?=
 =?us-ascii?Q?oUXUxYkGNWGZQbtTk6ufserEAJDFKwkKa4VlNl9S4hPVi4LkS5maxl5PFUoY?=
 =?us-ascii?Q?3o1BT/tU147B0Ya5DIU8w+p3o74aR3zBslmjN0CaNSEgKSUEAEM9iobtkF5p?=
 =?us-ascii?Q?3z5JtmVi5CBM3w+cOXaYEp2010p6wmsDu7GFqedcRX+hOd0ZQ8pZYtOXOOjv?=
 =?us-ascii?Q?r/uax22vbWNgdJ84XmwIn8W/ol5Xfpa4OjOY/GT05W0GrdZDW5VOsGH3fDud?=
 =?us-ascii?Q?U8LzMcpdlU8MmKdw8M9kOnSp3A1N8eWVw7FIQVY0EwAQa+bYMocLCCzG2S7x?=
 =?us-ascii?Q?4Nforq0dVY0DXD71DLGSZWK34OlYpzsZRTQ+O/ETEu7uEFtKN02LTTaVKeQC?=
 =?us-ascii?Q?t1RPQ0+Gcjra+WaDcJudCYep/ao9RxbSh2YTtUgKK5bkrrmy25iqy7lOZaiN?=
 =?us-ascii?Q?VoTnhAieZLyF5ygPmtyCEGrRNsZf3jPCpcVpaWFCF4G1jQjM5npybL4ywK6W?=
 =?us-ascii?Q?cmaT0cFc2+9T87JN8MsSULQxJ1E1MtELwWKNq/nkXEydd9iQJX8OnnY5/Il5?=
 =?us-ascii?Q?heh+sALKKec9F+cWfBz9Chib7f2DuEdyxKxNarQ7/7GdfelEddoPPXVQJIyr?=
 =?us-ascii?Q?wBa/sEyldtMy1UV/9x75Vw1YHagZxbjxlRPcHTmKDVWFUKWZ7dOrw9XoIBpj?=
 =?us-ascii?Q?G/ERTSfnyaRCmtIk9h8VHumO/fUxrTUuXQ88FoIMA4lWs4V6QJ4aKAYahRZ9?=
 =?us-ascii?Q?54L7GI8o3R53jLsupBT8nv/n/EwxKitkRHorYlnBph7VUkX8LcTGHF/XyhJM?=
 =?us-ascii?Q?kd3oia5WvLC8OdXDzkQpBWH5WdFaDPt+9eBYVqVbSE+CdOSFUi0yjK9CoXYs?=
 =?us-ascii?Q?bD8JprTb/NjhcbPMCmAJD4RYfrNe3EPqR7NSoypWytErNDjP5v6LbIQQYPvT?=
 =?us-ascii?Q?uQGR7wU7Vjwws++AYeS9syTuTKJCuxhX3is+MP9CTXNGACDdDhGOaiA/O9Sy?=
 =?us-ascii?Q?NZV7bDGtTBEpD5daadtGsiOsEyr94uO66E5n6dVskV5p5xteEyPXs7qbMWUp?=
 =?us-ascii?Q?9Ng9Hl76hdpC+sKUCB/ZY8pQ0o9WGBH681pi0BSTRLY1Ytr4n2NwNfBevnMk?=
 =?us-ascii?Q?YgrmpIPwZusYpFfoMD195TLgywnhq1doQNEc7jLsFwyxQsUpPD7ZxYx3RZDM?=
 =?us-ascii?Q?3UjhlihrU5eS/jRJ0CW8Qj/6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ef6c99-1fae-4fcf-1eb9-08d9775a163a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 08:31:45.4454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dHAuFlbXdsm7K43r4sJFSUWuLZovGglJxpy5R8Ujzyep0+V/DyGA6wS5MsUzLGFHxjylGOvwuXmlPhVAm7bQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 13.09.2021 19:09, Oleksandr wrote:
> On 10.09.21 10:52, Jan Beulich wrote:
>> On 10.09.2021 01:04, Oleksandr Tyshchenko wrote:
>>> @@ -731,11 +733,19 @@ static void p2m_put_l3_page(const lpae_t pte)
>>>        */
>>>       if ( p2m_is_foreign(pte.p2m.type) )
>>>       {
>>> -        mfn_t mfn =3D lpae_get_mfn(pte);
>>> -
>>>           ASSERT(mfn_valid(mfn));
>>>           put_page(mfn_to_page(mfn));
>>>       }
>>> +
>>> +#ifdef CONFIG_GRANT_TABLE
>>> +    /*
>>> +     * Check whether we deal with grant table page. As the grant table=
 page
>>> +     * is xen_heap page and its entry has known p2m type, detect it an=
d mark
>>> +     * the stored GFN as invalid.
>>> +     */
>>> +    if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
>>> +        page_set_frame_gfn(mfn_to_page(mfn), INVALID_GFN);
>>> +#endif
>> I take it the write done is benign for other Xen heap pages? I suppose
>> this would want making very explicit, as such an assumption is easy to
>> go stale by entirely unrelated changes.
>=20
> Yes, I don't see what bad could happen if we would clear this field for=20
> non grant table pages. Except grant table pages I could detect only one=20
> page passed this check here which is, I assume, shared_info page. All=20
> pages have this field initialized with INVALID_GFN. But *only* grant=20
> table pages have this field in use. So, I think, no one will suffer. I=20
> will add a comment. Or you meant something more than just a comment?

The answer here goes hand in hand with the pending question of whether
you wouldn't better generally introduce recording of the GFN (and hence
effectively an M2P): The less special casing here, the better imo. The
more special casing here, the more justification / explanation is imo
needed in the comment.

>>> --- a/xen/include/asm-arm/mm.h
>>> +++ b/xen/include/asm-arm/mm.h
>>> @@ -39,7 +39,15 @@ struct page_info
>>>           /* Page is in use: ((count_info & PGC_count_mask) !=3D 0). */
>>>           struct {
>>>               /* Type reference count and various PGT_xxx flags and fie=
lds. */
>>> -            unsigned long type_info;
>>> +            unsigned long type_info:4;
>>> +
>>> +            /*
>>> +             * Stored GFN if page is used for grant table frame
>>> +             * (bits 59(27)-0).
>> Are these bit numbers correct? I thought Arm, like x86, counted bits
>> from low to high (unlike PPC, for example)?
>=20
> I think, these are correct.=C2=A0 Yes, Little Endian is used.

Well, the low 4 bits are used by type_info here. Therefore I'm having
trouble seeing what the 0 refers to.

>>> @@ -94,12 +102,12 @@ struct page_info
>>>   #define PG_shift(idx)   (BITS_PER_LONG - (idx))
>>>   #define PG_mask(x, idx) (x ## UL << PG_shift(idx))
>>>  =20
>>> -#define PGT_none          PG_mask(0, 1)  /* no special uses of this pa=
ge   */
>>> -#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?    =
     */
>>> -#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.            =
     */
>>> +#define PGT_none          (0UL << 3)  /* no special uses of this page =
  */
>>> +#define PGT_writable_page (1UL << 3)  /* has writable mappings?       =
  */
>>> +#define PGT_type_mask     (1UL << 3)
>>>  =20
>>>    /* Count of uses of this frame as its current type. */
>>> -#define PGT_count_width   PG_shift(2)
>>> +#define PGT_count_width   1
>>>   #define PGT_count_mask    ((1UL<<PGT_count_width)-1)
>> Leaving just a single bit seems pretty risky to me, and I can't see
>> why you do so. You need 52 bits on Arm64. Which means you have 12
>> bits left. Why not use them in full? Even on Arm32 you have 3 bits
>> available for the count afaict.
>=20
> Only 1 bit in the type_info field is really used on Arm, but anyway ...
>=20
>=20
>>
>> Also there's a disconnect here: If anyone wanted to change the number
>> of bits used for the various fields, each such change should require
>> an adjustment in as few independent places as possible. That is, there
>> shouldn't be multiple uses of literal 4 further up, and there also
>> shouldn't be a hidden connection between that 4 and the PGT_* values
>> here. I think you'd better express the GFN as such a PGT_* construct
>> as well. And you better would keep using PG_mask() and PG_shift().
>=20
> ... I think, this indeed makes sense. If got your request correctly, we=20
> can avoid disconnect here
> and reserve 3-bit field for count for both Arm32 and Arm64. The struct=20
> page_info's type_info field remains untouched.
>=20
>=20
> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> index ded74d2..8b73e1c 100644
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -99,8 +99,14 @@ struct page_info
>  =C2=A0#define PGT_type_mask=C2=A0=C2=A0=C2=A0=C2=A0 PG_mask(1, 1)=C2=A0 =
/* Bits 31 or=20
> 63.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>=20
>  =C2=A0 /* Count of uses of this frame as its current type. */
> -#define PGT_count_width=C2=A0=C2=A0 PG_shift(2)
> -#define PGT_count_mask=C2=A0=C2=A0=C2=A0 ((1UL<<PGT_count_width)-1)
> +#define PGT_count_base=C2=A0=C2=A0=C2=A0 PG_shift(4)
> +#define PGT_count_mask=C2=A0=C2=A0=C2=A0 PG_mask(7, 4)
> +
> +/* Stored in bits [27:0] or [59:0] GFN if page is used for grant table=20
> frame */
> +#define PGT_gfn_width=C2=A0=C2=A0=C2=A0=C2=A0 PG_shift(4)
> +#define PGT_gfn_mask=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((1UL<<PGT_gfn_width)=
-1)
> +
> +#define PGT_INVALID_FRAME_GFN=C2=A0=C2=A0 _gfn(PGT_gfn_mask)
>=20
>  =C2=A0 /* Cleared when the owning guest 'frees' this page. */
>  =C2=A0#define _PGC_allocated=C2=A0=C2=A0=C2=A0 PG_shift(1)
> @@ -163,6 +169,22 @@ extern unsigned long xenheap_base_pdx;
>=20
>  =C2=A0#define maddr_get_owner(ma) (page_get_owner(maddr_to_page((ma))))
>=20
> +#define page_get_frame_gfn(_p) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 gfn_t gfn_ =3D _gfn((_p)->u.inuse.type_info & PGT_gfn=
_mask);=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 gfn_eq(gfn_, PGT_INVALID_FRAME_GFN) ? INVALID_GFN : g=
fn_;=C2=A0=C2=A0 \
> +})
> +
> +#define page_set_frame_gfn(_p, _gfn) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 gfn_t gfn_ =3D gfn_eq(_gfn, INVALID_GFN) ?=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 PGT_INVALID_FRAME_GFN : _gfn;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 (_p)->u.inuse.type_info &=3D ~PGT_gfn_mask;=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 (_p)->u.inuse.type_info |=3D gfn_x(gfn_);=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> +})
>=20
> [snip]
>=20
> Is it close to what you keep in mind?

Yes. Just to be sure - did you check that moving the count up
from starting at bit 0 is compatible with all present uses? At
least on x86 I think we have uses where it is assumed to occupy
the bottom so many bits (and the same also for PGC_count_mask).

Jan


