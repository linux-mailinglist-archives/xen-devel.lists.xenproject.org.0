Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B58DBA2DE7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 09:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131264.1470431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23Lc-0006lp-K4; Fri, 26 Sep 2025 07:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131264.1470431; Fri, 26 Sep 2025 07:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23Lc-0006js-H9; Fri, 26 Sep 2025 07:58:32 +0000
Received: by outflank-mailman (input) for mailman id 1131264;
 Fri, 26 Sep 2025 07:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ys6F=4F=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1v23Lb-0006jm-43
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 07:58:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 971aee1a-9aae-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 09:58:30 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id E95264EEBC4D;
 Fri, 26 Sep 2025 09:58:28 +0200 (CEST)
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
X-Inumbo-ID: 971aee1a-9aae-11f0-9d14-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1758873509;
	b=iPccSyZWojS+W56+gd/B+janPrQ9ZUlj5+1f6BUJuTH89PPoxT7U8eCEjIa7BNH1o5iF
	 8mUrauwUkiq/0S2RdK2wJqzfyhL2IjSslFv3Uro99Iqx+KQ1hfSFk0+Y2NeBKqqtOpIEn
	 UoGg2GaAKK2uN2VAStod5XfMS+TknYMO2VvWP3FhyNtX0DRCMGrKlIk9rmae5kEQ0KQrG
	 7xrxu2zMuAVD+pXJWwWf0JjKqXR0h9tOZhRJ8jiwOtqj/YSVMI4mQtLOAmKbDgeakfUv+
	 gYijQzlr4FEkawaV1Cipl6m3q5+QpqAPIP2gIx8v40p9ql6dNMncMRh4gA3QmR6INOMYW
	 LKSv5dv7FMpAq3mFAOwHJKRGphYEoBNhIOz4WvJHpGKhfIX8Tfszy+o3IoyEipLa4VTw5
	 +g0MPxRUqmBJXixY8Mid0FpwcQtjCmK3qcxTXuc29phH0q7yB/ismOJqmTKBtwgGeAcxb
	 ySWMtnSRfVKOZgkqeUZ+QFB7Qy9UZdApznXaQQZGU87RkWPRFgScLu+LP5W1cdkz9L1p3
	 DQZmliqFxkZspOCHBhg9+79JehcCwXnfhIgRpf6SZV37fiaSpyWKpI92y8s9VD9iVmYB3
	 FrkKxsg8lLRxiwyjY0kehymG4qqIfRujj/9CiKuQVtoepAD1fM4wSWyBhqszK08=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1758873509;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=mM1vYtKxLsTOkPWlKHfseeZ/b++Q5ticVBzhPq2YdsA=;
	b=uo3eqjuJkRIhQUVf5f83OkJU8Dtp9QquYC29NQHugfycliArZkaF07WCwqLW5rlPxZmC
	 byCZS17iL01ARorqUPc8GkrGXjetlcTgCswLcYyxoVnH++jkZgOzmHl4Zxp3oqqh1ICbj
	 uDgLz2YBbpene55teRdifnH5AMP8DZTUe1iUoEbkzbTdoGgEKXqCZ3JRdIb7ecTlvthOb
	 0v1bASdDVl4pZIIZNrNYw7z3XSLIRFh5a5uD2pYp9ey+bhvmM52ExBBwcOr8sYkLZGlBm
	 A4jdL58KFB/ocOhH4tRMQx38JuvxPqJGc8683Q2GdUnvtgfhzQO6Yutf8wK+lQRrqCN00
	 omnsDpCVUisRv7qW5ddTXQx6GncCaE5Zt+KxhJZMR6W0g4C/vbopxhT6RMJ3BLwWc5VuE
	 MxwNln1LgDTjgql9QMKUMzbFIoWsPnHDTItQOsibPgTMtEGqTIw2NJ/i9p1tChEnqZZXD
	 t5FhWv8xy0r1CF73aQzsUfduu01cVcipU5PChXsfijv6XbVJzHETnVnENkxxFyqZo4g8+
	 HzrYKHa8AkXuueCZU81qP1NoVS4/lEA8OhhkWWkgU1KbrYAsA6lm2Slrd4h3/BlOW/+8k
	 ZZ+4cfvStxZV5lqAd7eTpwZ9KjnZSGXKbsjZYCTDvMWAQQs1MY6dQgYVqg4mEIs=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1758873509; bh=/moFs4Tb6+CfXCTLNjYtX5YtI/NGoevVaImGhrOIhhw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ikTEQS06sVRFXB5gxZ4csyZJkZlKncOzkwFB20zlsgLuQJTQYC687JZy90HsgwAA1
	 RlYwpf6mD2vWaEjhF7ZIIU6foIJEmUgf0SdBAt052vQPclkkqNO4pY9aB/W55lCzq9
	 kyPmMbuvwcJ6sb5dKPzWAgypdOFugo/yh/PcEld7pVVLSKQfiBeKRNFSNsYRqP3Rhl
	 TJtuUjou/Ys9yEJ8jwtD2iSwY+IsqvMG5JIrdboRyKcgzLoX+5eUE5JEMsXEv1xOJG
	 gETaBEzpJPQsenmbO1PWrVee9/QNj9lS2QrbgnySmQKeFS1uNZ6vEnAkoDkzbv7Wdz
	 KqnY9yVbEuD3A==
MIME-Version: 1.0
Date: Fri, 26 Sep 2025 09:58:28 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] misra: consider conversion from UL or (void*) to
 function pointer as safe
In-Reply-To: <eff9d532-1908-4584-aed0-25b1d0d2ca50@suse.com>
References: <b0f269822312a442e87ab02c8deff028b6b040a9.1758787340.git.dmytro_prokopchuk1@epam.com>
 <ae0ecbfc-cee0-4035-ba03-e9f9ba2661e4@suse.com>
 <d3b71d3f-77fd-4763-bd01-bc6212cd80f1@epam.com>
 <eff9d532-1908-4584-aed0-25b1d0d2ca50@suse.com>
Message-ID: <f6e49c05a2ed554d81673f10ad1159ca@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-26 08:46, Jan Beulich wrote:
> On 25.09.2025 20:37, Dmytro Prokopchuk1 wrote:
>> On 9/25/25 16:25, Jan Beulich wrote:
>>> On 25.09.2025 10:04, Dmytro Prokopchuk1 wrote:
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -366,11 +366,22 @@ Deviations related to MISRA C:2012 Rules:
>>>>        - Tagged as `safe` for ECLAIR.
>>>> 
>>>>      * - R11.1
>>>> -     - The conversion from a function pointer to unsigned long or 
>>>> (void \*) does
>>>> +     - The conversion from a function pointer to unsigned long or 
>>>> '(void *)' does
>>>>          not lose any information, provided that the target type has 
>>>> enough bits
>>>>          to store it.
>>>>        - Tagged as `safe` for ECLAIR.
>>>> 
>>>> +   * - R11.1
>>>> +     - The conversion from unsigned long or '(void *)' to a 
>>>> function pointer is
>>>> +       safe because it relies on both ABI definitions and compiler 
>>>> implementations
>>>> +       supported by Xen which define consistent and compatible 
>>>> representations
>>>> +       (i.e., having the same size and memory layout) for '(void 
>>>> *)', unsigned
>>>> +       long, and function pointers, enabling safe conversions 
>>>> between these types
>>>> +       without data loss or corruption. The compile-time assertions 
>>>> (BUILD_BUG_ON
>>>> +       macro) is integrated into 'xen/common/version.c' to confirm 
>>>> conversions
>>>> +       compatibility across all target platforms.
>>> 
>>> As you use (and mean) plural, s/is/are/ ? I also think the "The" at 
>>> the start
>>> of the sentence wants dropping.
>> Ok.
>> 
>>> 
>>> Further, why this very dissimilar wording compared to what's said 
>>> about
>>> conversions _from_ function pointer types?
>> Do you mean the following wording should be placed instead (to be
>> similar with previous one)?
>> 
>> "Conversions from unsigned long or (void *) to a function pointer do 
>> not
>> lose any information, provided that the source type has enough bits to
>> restore it."
>> 
>> And wording about "ABI, compiler..." should be only in commit message?
> 
> Perhaps.
> 
>>> And then ...
>>> 
>>>> --- a/xen/common/version.c
>>>> +++ b/xen/common/version.c
>>>> @@ -217,6 +217,17 @@ void __init xen_build_init(void)
>>>>   #endif /* CONFIG_X86 */
>>>>   }
>>>>   #endif /* BUILD_ID */
>>>> +
>>>> +static void __init __maybe_unused build_assertions(void)
>>>> +{
>>>> +    /*
>>>> +     * To confirm conversion compatibility between unsigned long, 
>>>> (void *)
>>>> +     * and function pointers for all supported architectures.
>>>> +     */
>>>> +    BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
>>>> +    BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
>>>> +}
>>> 
>>> ... I'm unconvinced checking merely the sizes is sufficient. On 
>>> architectures
>>> involving function descriptors (e.g. ia64) converting in this 
>>> direction is
>>> safe only if earlier on the value was obtained as the result of a 
>>> conversion
>>> in the opposite direction (and all of this within a single component, 
>>> which
>>> of course is guaranteed for Xen).
>> As I know mainline Xen doesn't support IA-64 currently (this support 
>> was
>> dropped).
>> Why we still need to mention about IA-64 here?
> 
> Because I needed to use an example I know. Aiui there are other 
> architectures
> which use function descriptors (or alike).
> 
>> Anyway...
>> Yes, this deviation wouldn't work with architectures where the
>> representation of a function involves more than just its address (e.g.
>> IA-64). If not proved that such conversion is symmetric.
>> 
>> Probably, additional guard may be added below to exclude such
>> architectures (e.g. IA-64):
>> 
>> static void __init __maybe_unused build_assertions(void)
>> {
>> #if defined (__IA64__) || defined (__ia64__)
>> #error "Conversions to function pointer isn't safe -  architecture 
>> uses
>> function descriptors."
>> #endif
> 
> Well, no, I didn't mean to ask that you add dead code.
> 
>>      BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
>>      BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
>> }
>> 
>> But if someone really will try to run Xen on such platform, the build
>> will fail.
>> 
>> Or just mention explicitly that other architectures (e.g., IA-64) 
>> might
>> not be safe for such conversions?
> 
> My main point really is that once again I wonder how convincing such an
> argument would be to assessors, when it's clearly not generic (yet 
> being
> worded and the checking coded as if it was).
> 
> Jan

Well, it is true that the intended scope of those deviations is for the 
architectures and compilers that are subject to the analysis, because 
adding a new architecture or compiler to the mix would mean that all the 
assumptions need to be re-evaluated for that compiler/arch (this is an 
IDB in the first place, so it is unlikely that a general statement can 
be made). Perhaps the BUILD_BUG_ON should be limited to these 
arch-es/compilers, so that there is little doubt about the intended 
motivation of the check.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

