Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E86C52B696
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331860.555471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGZj-0002Ux-47; Wed, 18 May 2022 10:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331860.555471; Wed, 18 May 2022 10:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGZj-0002RT-0D; Wed, 18 May 2022 10:06:39 +0000
Received: by outflank-mailman (input) for mailman id 331860;
 Wed, 18 May 2022 10:06:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrGZh-0002RK-By
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:06:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3362c0bc-d692-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 12:06:35 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-cm6aBcIwNfuowiyQc9eFKA-2; Wed, 18 May 2022 12:06:34 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4018.eurprd04.prod.outlook.com (2603:10a6:208:57::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 10:06:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 10:06:32 +0000
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
X-Inumbo-ID: 3362c0bc-d692-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652868395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ZqUn5MEY1N+3Yu+HhtPw9nOEFIALZ6u6SYJer5eMJA=;
	b=l/qbQ5aVCgsJ20TAmgdZfRVnnClHQ+8Ft31t6cbIQolXyC5u/VaYLAGBvqGwCdWfLi99Ul
	GXo5l7rNwAfZMwoBcCGbm1rISdIM1QnWI0ApvOAkEkyzUhmX6BSMI9xpsb1TNA0ZjF1j4C
	X/IY8/NhuIX4fAV7ttsft75B6sKUsww=
X-MC-Unique: cm6aBcIwNfuowiyQc9eFKA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECd1cm7Ub2lLO1tVuzqgTJIXmCLVSps2MzePAUFxFJwvGdGy53XaJta4F5HphxentgEnvIQBhiZlc736qPEHBBl+Uz11jBHksJBOScYaGJELtmyw2M4fl6Zp/y/SEa6cXSeqqCmDbqLaQ3v2WeIkTdnjKwdqhLtO+HGfOskroPp8EyuXyhgISFxBhbNyd8jdhAnG8Gb7MosVM19iY+Qc/vC2HFWedDSFMEm0+bTXOJp2YYK1XBzygsml6UY2uRbIavFG9sycD/5eZbRpek2J1VFAYrl43QyyOUDNC0YQ8LYyMmmivqeQKEYwswZA6DSd9aE4h76P9LM8IpuCoWn7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MIoE4F+YawzN1HinJ+m5r7g+dvKmgWA6WAMxPKzu9c=;
 b=ZOPmCUjmMA4QskkBrWkpzSVsaOfO9DdJQp23VTDJHT+BLST4hDpqw05DbeQENp25x2Aqhd0X4ZCI/khe3iMhJnzn/0HYpsjfH+Y/raShq/ohVJwUaXjVXTCNafy6R2TEh8F8pK1S6FCsfhy186buTD9z4gTo8CdJtf/xbaDdqLKtJnQ/Rc/dhFr9EXVxGoAXFnhoCsHJ6cB21UUyM8/cqvJvvaohtZHgpLjONF2iQ8Xjisb3UtbBUoKETs66saVzrzJeoMs3VKVoWiCP1vtUJZPRF+rcAEDOK84PtNNUsMtE+pyyxKV1Spcft/XOl409eAbGQVwkdizl6n2OzUKtow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <80487976-5d72-5388-139c-422210bca73b@suse.com>
Date: Wed, 18 May 2022 12:06:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 14/21] x86: introduce helper for recording degree of
 contiguity in page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <fedf7224-8023-275a-843c-1a5753c20ded@suse.com>
 <YnUh4ZbDMZZdCw9w@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnUh4ZbDMZZdCw9w@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5638b79-1bcf-4f56-e231-08da38b61555
X-MS-TrafficTypeDiagnostic: AM0PR04MB4018:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB40180DC50E84A0CB968B3D1FB3D19@AM0PR04MB4018.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9BqcEtRRQi1YG5WBiUPpfv/PLQ6iI0/pnmDajU2vNKUqqkke+VNIsLDpz5Xum25GC9i5KA/fveSQxb/El2cRZTkIpZiQdJqTyOqowtHnrc2UY91dXWfu1slR0NK6ynhxY8JKR0ELvbyphbUOjYEviEz7HTtzV3n3AvkGbFfKIyiG2/+jEtFBxRsY9G7Flv25JcYT0Kpw5KeOtML8MF5LMb0J0k7r9Ln0Talps55n8lcFkWA++dYGgw9P3FR84XWdAATfDSLXvNXd1A4aZyXWFPPp1lSBR2UR5wjvHz2smLLjQRutix9QGjYDej8a7mMWt/mQrJz5kDdXz/kA/JOocJA4m6zH6gtJIRPGLqAa0oe4yYDC0I1axnmHkM959viyWfIBeryl9YnEJIjso4oxPhMbURTH4mkbYTvWiQdMjYglexGAWuwUIpvsGi3tLir6MzSX4mC5zxOwtRYxNnL2VbbtY6kxmVDTF5qh0VZKkBnpCtOf9BvA84oluWDieAGSEbafDsAUB7fiQ0uD0ZWKFch5alHovqm/TOKXZH05LW6KtrI8tek3Qhig1PTR7FcT/+4rBR6psHLqH0DAmeQ+eX2NZUZi3xyhOpytukD235fLwTdZeHj5DgTK6Z/c+4ZDKfB6pxpzUn67D0ZoXjr4K4PmYAkiGX7xqDOSlXTgO6kSGXDtw2+8PHYWsAAdlum4/ChLEkOyXVwUpj1+E2HzsbWgYsS0SAX4G5m3W4XL/5jkauqK+kKFQkDR2pAHJCXz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6512007)(53546011)(508600001)(83380400001)(186003)(6916009)(6506007)(31696002)(66946007)(26005)(66556008)(8936002)(66476007)(31686004)(316002)(36756003)(5660300002)(2616005)(6486002)(86362001)(4326008)(2906002)(8676002)(6666004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xL5jU7mnHFK3CvrjfhhuanKx+uTGnjpjKgR18xRKooSQhK4HdfhKEc6HEN6V?=
 =?us-ascii?Q?H4owemn4w2eK3yHBL65bjcU6pvOTfkvb5CfwT6QQP/tzP7AlDgfxMnPH70Nr?=
 =?us-ascii?Q?57VLwVuu786/w2NtJM/xyrqzrAlw06RFbnQTMwkWlseQbPswhSaLSvkO8WSP?=
 =?us-ascii?Q?l1HoJndV1evwLyaUi6wlOROw+BakrwQPYLqj2nvzSxgrKFe63RIqeAdhaYvB?=
 =?us-ascii?Q?okTLPseGSLtb+CrRilTyXNF5PrDs8aOTTBrbhLDPbwcHscxv0vLzbi9j+1it?=
 =?us-ascii?Q?eq6043OzpzEg1UMj9I2CBqghaDILK3ZIjeTZESor+zlSrDgxhJp2rz/CVA5Y?=
 =?us-ascii?Q?a+UXceBEOSianuYCOhDFPzwIN/+J2BcduOEroHsK4m+/wlz0nkcPgy3AzbUm?=
 =?us-ascii?Q?Gr6S9GOorrNBoxtpwrwof75ZVAiCneitwaCrGCyoIfAcUKoksCYOLYpDhtAj?=
 =?us-ascii?Q?deLoKPQUS4u/RpQn79sEhB9h2F6/P5DtFQdEONNAnH6evhZHnSSKLgifr8yO?=
 =?us-ascii?Q?dy9bFbgFSkyUAvoA1VKbEgUGZHE1KBH97qdfHt0uBAs1mtQcahTJihT8wy77?=
 =?us-ascii?Q?cDtQA2eWrO+mI40ByzmGkIGvtJdUUx4xSPSuqely1aD7rGx5Jqsr70JGvklp?=
 =?us-ascii?Q?/n9dncye9Mnc0+d6INKQHgYoMj3XjZEHoNKKpDZ/qBIYOquqrCzA7MFIO3N8?=
 =?us-ascii?Q?b7b63ipdiSjBnVxPtZGx2HmLCNyLKKuOVEtR2B02DIrfEscgwkxvrmOa9TOE?=
 =?us-ascii?Q?0Nr/uNjjWNvznSZb+o0Z7tVV3ON1PKPUvq8RtpakIhuhAISEWIYcEKiSLCbY?=
 =?us-ascii?Q?PX2WvsjVKsq8G1xAMl8VXlA42PqFxAQ10CCfgnQDOAxvBC5Tk4RV5jJjp/2M?=
 =?us-ascii?Q?7jZrW4+6LxSBA6Fg9wJqTVkE6VNe0KR4pFuW+T/3U2wWugLUq/qi8wpU07PJ?=
 =?us-ascii?Q?pUP0Np7FGmxDpMn8DzWY1SO+AzusZFb7H9nbOzgYdIEcjUP2iupGRB9O5EE/?=
 =?us-ascii?Q?V9p3YLfsnXRmaS4EGSknxeWbkpGdap7j0/JCMxcivXkuIo5G2drAkivN52k2?=
 =?us-ascii?Q?+vPCebhHWSBL8TmRi1qtlMBSob1xtSIhzSkriwjktc+j78RLdXijTTPDYhT1?=
 =?us-ascii?Q?WowJsIn0Ik2gN/Uwb/3GtfjTVMOjUK4g3p2f2oS88qS0KwrUw+TvHadON92q?=
 =?us-ascii?Q?Up5+PO3gLvBOgaF1Hg+H5fOZ6niEPMj4Oykxth/8Gosmofu8dWNNKPmf3D0B?=
 =?us-ascii?Q?yQaNVp6MPkQ7t2joIKlW1MWcZKVhffYws1iFh58yjbaNY2cqBbtY420xoPNT?=
 =?us-ascii?Q?nZ5id8E6c+aEkWDINTjzLDUYuUT6Y4BV9DM6daE7r2gMd9kMsTwt0FNcw6Ux?=
 =?us-ascii?Q?kimMGV4Rn+DPXZDLXMixIXFmdbKE7tzO+Q6DzhpstDzplzoSTX86D9vRRt2W?=
 =?us-ascii?Q?RFY5jy6lDe2rS9s0CGT7K23VItSB4FwAOLvutGhBp6FmUvXyFKGf2qvX4ATG?=
 =?us-ascii?Q?1YbO3LPyJN+b9hZevnTHxT1wkYCTbQJggBDAGyIu1BeHPFL22EH1I9/bGnLR?=
 =?us-ascii?Q?hHULd/X5YmWL31kMriQhfHtyLgWiEAqweo0uqz6KfNvZZoCDOWNSzOaJJPti?=
 =?us-ascii?Q?c5nSB9aqI0piOjqPjxOfvcmqzengbotYZOk2nEol8oWYAi82LRv504wRLiv1?=
 =?us-ascii?Q?vL0t8PfeiaODyHYTwduAo/k2HGv2nm0NWo2JszIbF+Dg0ThPGpkqc2wv9g8/?=
 =?us-ascii?Q?2scQSDI2nA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5638b79-1bcf-4f56-e231-08da38b61555
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 10:06:32.0749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhY43hFgijx9HJJoQPAiEoK3otcBFG1lRnsuNpr3a/dY0c1nxlYbmesjo1MfmYw3ByHqdLcTfRfjZfbFvKH5OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4018

On 06.05.2022 15:25, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:41:23AM +0200, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/pt-contig-markers.h
>> @@ -0,0 +1,105 @@
>> +#ifndef __ASM_X86_PT_CONTIG_MARKERS_H
>> +#define __ASM_X86_PT_CONTIG_MARKERS_H
>> +
>> +/*
>> + * Short of having function templates in C, the function defined below =
is
>> + * intended to be used by multiple parties interested in recording the
>> + * degree of contiguity in mappings by a single page table.
>> + *
>> + * Scheme: Every entry records the order of contiguous successive entri=
es,
>> + * up to the maximum order covered by that entry (which is the number o=
f
>> + * clear low bits in its index, with entry 0 being the exception using
>> + * the base-2 logarithm of the number of entries in a single page table=
).
>> + * While a few entries need touching upon update, knowing whether the
>> + * table is fully contiguous (and can hence be replaced by a higher lev=
el
>> + * leaf entry) is then possible by simply looking at entry 0's marker.
>> + *
>> + * Prereqs:
>> + * - CONTIG_MASK needs to be #define-d, to a value having at least 4
>> + *   contiguous bits (ignored by hardware), before including this file,
>> + * - page tables to be passed here need to be initialized with correct
>> + *   markers.
>=20
> Not sure it's very relevant, but might we worth adding that:
>=20
> - Null entries must have the PTE zeroed except for the CONTIG_MASK
>   region in order to be considered as inactive.

NP, I've added an item along these lines.

>> +static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
>> +                                     unsigned int level, enum PTE_kind =
kind)
>> +{
>> +    unsigned int b, i =3D idx;
>> +    unsigned int shift =3D (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SHIF=
T;
>> +
>> +    ASSERT(idx < CONTIG_NR);
>> +    ASSERT(!(pt[idx] & CONTIG_MASK));
>> +
>> +    /* Step 1: Reduce markers in lower numbered entries. */
>> +    while ( i )
>> +    {
>> +        b =3D find_first_set_bit(i);
>> +        i &=3D ~(1U << b);
>> +        if ( GET_MARKER(pt[i]) > b )
>> +            SET_MARKER(pt[i], b);
>=20
> Can't you exit early when you find an entry that already has the
> to-be-set contiguous marker <=3D b, as lower numbered entries will then
> also be <=3D b'?
>=20
> Ie:
>=20
> if ( GET_MARKER(pt[i]) <=3D b )
>     break;
> else
>     SET_MARKER(pt[i], b);

Almost - I think it would need to be=20

        if ( GET_MARKER(pt[i]) < b )
            break;
        if ( GET_MARKER(pt[i]) > b )
            SET_MARKER(pt[i], b);

or, accepting redundant updates,=20

        if ( GET_MARKER(pt[i]) < b )
            break;
        SET_MARKER(pt[i], b);

. Neither the redundant updates nor the extra (easily mis-predicted)
conditional looked very appealing to me, but I guess I could change
this if you are convinced that's better than continuing a loop with
at most 9 (typically less) iterations.

Jan


