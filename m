Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E09948A2DBD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 13:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704576.1101047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvFNC-0003Kp-Ic; Fri, 12 Apr 2024 11:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704576.1101047; Fri, 12 Apr 2024 11:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvFNC-0003I2-EY; Fri, 12 Apr 2024 11:47:14 +0000
Received: by outflank-mailman (input) for mailman id 704576;
 Fri, 12 Apr 2024 11:47:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUrc=LR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rvFNA-0003Ho-U7
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 11:47:12 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64fa877d-f8c2-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 13:47:11 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1712922423530196.07713991845515;
 Fri, 12 Apr 2024 04:47:03 -0700 (PDT)
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
X-Inumbo-ID: 64fa877d-f8c2-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; t=1712922426; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k9CeVTvRq4A2si4GfoamrtlNdSqs9oSCTE+fo7V1snIFqUPup7qGJ4tB51iQognXmoibms8fVPA8DPlV2jYUPDlvktwe+3iXOHEbU9SuBCIXijCI1T70w6/Y0agsOxwP6M9AVOD91CX2HXpXz7nwVKk5XDl7DkHorPwN+n56qBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712922426; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UmGwatd2RFkFR+bnz4CcwqllOhXf8pmquBuOMevZ2G4=; 
	b=eii8b0ugCHVyzQjhQEPhJCvKL6SQEUwPIEPip6wshV2/JmK5lhIz8GtyHYhlQNRjwodzKr+kHoa83KzHQGpCzWGFFOv1UxRqnp2/QIKdcga0hNK/zE/1otbYQYQj2w32eldYgossu7hOhHHHT3qFkyzr8CrD0Cn2yP8Nc6wrrok=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712922426;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UmGwatd2RFkFR+bnz4CcwqllOhXf8pmquBuOMevZ2G4=;
	b=PCKFegdKTpXXFgJf76CIaHvrh+cEE6w0BHQfNKfZLZE0kN5EzRvx2cI0A67w53oQ
	c/NDHys9TcotuOgePhB0UwW6MKiVwio5Yyq/kviC0D1THF2AbeziiGGivv/AvLG0nqA
	GOQL+WetEdsQA+vTj8Ux6GW+x4Kb5vW0ygWatRDY=
Message-ID: <05a427f3-7d19-4a08-9a5f-164bff5c4bf5@apertussolutions.com>
Date: Fri, 12 Apr 2024 07:47:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] gzip: move huffman code table tracking into gzip
 state
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-6-dpsmith@apertussolutions.com>
 <5e822498-cbe1-45e5-806c-1c14aaf76a6d@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <5e822498-cbe1-45e5-806c-1c14aaf76a6d@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/11/24 15:49, Andrew Cooper wrote:
> On 11/04/2024 4:25 pm, Daniel P. Smith wrote:
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/common/gzip/gunzip.c  |  2 ++
>>   xen/common/gzip/inflate.c | 26 ++++++++++++--------------
>>   2 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
>> index a1b516b925c9..79a641263597 100644
>> --- a/xen/common/gzip/gunzip.c
>> +++ b/xen/common/gzip/gunzip.c
>> @@ -31,6 +31,8 @@ struct gzip_data {
>>   
>>       unsigned long crc_32_tab[256];
>>       unsigned long crc;
>> +
>> +    unsigned hufts;        /* track memory usage */
>>   };
>>   
>>   #define OF(args)        args
>> diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
>> index 6c8c7452a31f..53ee1d8ce1e3 100644
>> --- a/xen/common/gzip/inflate.c
>> +++ b/xen/common/gzip/inflate.c
>> @@ -140,7 +140,7 @@ struct huft {
>>   };
>>   
>>   /* Function prototypes */
>> -static int huft_build OF((unsigned *, unsigned, unsigned,
>> +static int huft_build OF((struct gzip_data *, unsigned *, unsigned, unsigned,
>>                             const ush *, const ush *, struct huft **, int *));
>>   static int huft_free OF((struct huft *));
>>   static int inflate_codes OF((struct gzip_data *, struct huft *, struct huft *, int, int));
>> @@ -311,8 +311,6 @@ static const int dbits = 6;          /* bits in base distance lookup table */
>>   #define BMAX 16         /* maximum bit length of any code (16 for explode) */
>>   #define N_MAX 288       /* maximum number of codes in any set */
>>   
>> -static unsigned __initdata hufts;      /* track memory usage */
>> -
>>   /*
>>    * Given a list of code lengths and a maximum table size, make a set of
>>    * tables to decode that set of codes.  Return zero on success, one if
>> @@ -329,8 +327,8 @@ static unsigned __initdata hufts;      /* track memory usage */
>>    * @param m Maximum lookup bits, returns actual
>>    */
>>   static int __init huft_build(
>> -    unsigned *b, unsigned n, unsigned s, const ush *d, const ush *e,
>> -    struct huft **t, int *m)
>> +    struct gzip_data *gd, unsigned *b, unsigned n, unsigned s, const ush *d,
>> +    const ush *e, struct huft **t, int *m)
>>   {
>>       unsigned a;                   /* counter for codes of length k */
>>       unsigned f;                   /* i repeats in table every f entries */
>> @@ -492,7 +490,7 @@ static int __init huft_build(
>>                       goto out;
>>                   }
>>                   DEBG1("4 ");
>> -                hufts += z + 1;         /* track memory usage */
>> +                gd->hufts += z + 1;         /* track memory usage */
>>                   *t = q + 1;             /* link to list for huft_free() */
>>                   *(t = &(q->v.t)) = (struct huft *)NULL;
>>                   u[h] = ++q;             /* table starts after link */
>> @@ -787,7 +785,7 @@ static int noinline __init inflate_fixed(struct gzip_data *gd)
>>       for (; i < 288; i++)          /* make a complete, but wrong code set */
>>           l[i] = 8;
>>       bl = 7;
>> -    if ((i = huft_build(l, 288, 257, cplens, cplext, &tl, &bl)) != 0) {
>> +    if ((i = huft_build(gd, l, 288, 257, cplens, cplext, &tl, &bl)) != 0) {
>>           free(l);
>>           return i;
>>       }
>> @@ -796,7 +794,7 @@ static int noinline __init inflate_fixed(struct gzip_data *gd)
>>       for (i = 0; i < 30; i++)      /* make an incomplete code set */
>>           l[i] = 5;
>>       bd = 5;
>> -    if ((i = huft_build(l, 30, 0, cpdist, cpdext, &td, &bd)) > 1)
>> +    if ((i = huft_build(gd, l, 30, 0, cpdist, cpdext, &td, &bd)) > 1)
>>       {
>>           huft_free(tl);
>>           free(l);
>> @@ -894,7 +892,7 @@ static int noinline __init inflate_dynamic(struct gzip_data *gd)
>>   
>>       /* build decoding table for trees--single level, 7 bit lookup */
>>       bl = 7;
>> -    if ((i = huft_build(ll, 19, 19, NULL, NULL, &tl, &bl)) != 0)
>> +    if ((i = huft_build(gd, ll, 19, 19, NULL, NULL, &tl, &bl)) != 0)
>>       {
>>           if (i == 1)
>>               huft_free(tl);
>> @@ -971,7 +969,7 @@ static int noinline __init inflate_dynamic(struct gzip_data *gd)
>>   
>>       /* build the decoding tables for literal/length and distance codes */
>>       bl = lbits;
>> -    if ((i = huft_build(ll, nl, 257, cplens, cplext, &tl, &bl)) != 0)
>> +    if ((i = huft_build(gd, ll, nl, 257, cplens, cplext, &tl, &bl)) != 0)
>>       {
>>           DEBG("dyn5b ");
>>           if (i == 1) {
>> @@ -983,7 +981,7 @@ static int noinline __init inflate_dynamic(struct gzip_data *gd)
>>       }
>>       DEBG("dyn5c ");
>>       bd = dbits;
>> -    if ((i = huft_build(ll + nl, nd, 0, cpdist, cpdext, &td, &bd)) != 0)
>> +    if ((i = huft_build(gd, ll + nl, nd, 0, cpdist, cpdext, &td, &bd)) != 0)
>>       {
>>           DEBG("dyn5d ");
>>           if (i == 1) {
>> @@ -1090,15 +1088,15 @@ static int __init inflate(struct gzip_data *gd)
>>       /* decompress until the last block */
>>       h = 0;
>>       do {
>> -        hufts = 0;
>> +        gd->hufts = 0;
>>   #ifdef ARCH_HAS_DECOMP_WDOG
>>           arch_decomp_wdog();
>>   #endif
>>           r = inflate_block(gd, &e);
>>           if (r)
>>               return r;
>> -        if (hufts > h)
>> -            h = hufts;
>> +        if (gd->hufts > h)
>> +            h = gd->hufts;
>>       } while (!e);
>>   
>>       /* Undo too much lookahead. The next read will be byte aligned so we
> 
> 
> AFAICT, hothing in inflate() reads h.  So hufts is a write-only variable?

Good question, let me study it to make sure.

> Can't we just delete it, rather than plumb it through into the state
> block?  It would certainly shrink this patch somewhat.

Yes, if I can't find any reads of gd->hufts, directly or indirectly 
intermediate variables like h above, then yes, I can try dropping it and 
testing to see if anything breaks.

v/r,
dps


