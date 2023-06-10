Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AD872AA37
	for <lists+xen-devel@lfdr.de>; Sat, 10 Jun 2023 10:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546474.853424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7tg8-0000lo-6i; Sat, 10 Jun 2023 08:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546474.853424; Sat, 10 Jun 2023 08:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7tg8-0000iT-3q; Sat, 10 Jun 2023 08:10:32 +0000
Received: by outflank-mailman (input) for mailman id 546474;
 Sat, 10 Jun 2023 08:10:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yi1Q=B6=nod.at=richard@srs-se1.protection.inumbo.net>)
 id 1q7tg6-0000iN-U0
 for xen-devel@lists.xenproject.org; Sat, 10 Jun 2023 08:10:30 +0000
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42a25165-0766-11ee-8611-37d641c3527e;
 Sat, 10 Jun 2023 10:10:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 84973616B2D6;
 Sat, 10 Jun 2023 10:10:27 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id O087NdUXunvD; Sat, 10 Jun 2023 10:10:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9F88461A7038;
 Sat, 10 Jun 2023 10:10:26 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qFrUs6xy5cnj; Sat, 10 Jun 2023 10:10:26 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 637B4616B2DB;
 Sat, 10 Jun 2023 10:10:26 +0200 (CEST)
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
X-Inumbo-ID: 42a25165-0766-11ee-8611-37d641c3527e
Date: Sat, 10 Jun 2023 10:10:26 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Christoph Hellwig <hch@infradead.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, 
	torvalds <torvalds@linux-foundation.org>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, jgross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Lee Jones <lee@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	tglx <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	senozhatsky <senozhatsky@chromium.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	xen-devel@lists.xenproject.org
Message-ID: <880576435.3707190.1686384626249.JavaMail.zimbra@nod.at>
In-Reply-To: <ZIQrevjNjMn9cBRM@infradead.org>
References: <20230610025759.1813-1-demi@invisiblethingslab.com> <20230610025759.1813-2-demi@invisiblethingslab.com> <ZIQrevjNjMn9cBRM@infradead.org>
Subject: Re: [PATCH 2/4] vsscanf(): Return -ERANGE on integer overflow
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: vsscanf(): Return -ERANGE on integer overflow
Thread-Index: p4ts5uhOrcG+8Y8hROgACAR25NuqQA==

----- Urspr=C3=BCngliche Mail -----
> Von: "Christoph Hellwig" <hch@infradead.org>
> [Adding Richard and Linus as they're having another overflow checking
> discussion and we should probably merge those]

Thx for letting me know!
=20
> On Fri, Jun 09, 2023 at 10:57:57PM -0400, Demi Marie Obenour wrote:
>> Userspace sets errno to ERANGE, but the kernel can't do that.
>=20
> That seems like a very parse commit log, and also kinda besides
> the point - the kernel always returns error in-line and not through
> errno.  I think you need to document here why we want to do the
> overflow checking (not that I doubt it, but it really needs to be
> in the commit message).
>=20
> Leaving the rest of the quote here for the new arrivals.
>=20
>>=20
>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> ---
>>  include/linux/limits.h          |  1 +
>>  include/linux/mfd/wl1273-core.h |  3 --
>>  include/vdso/limits.h           |  3 ++
>>  lib/vsprintf.c                  | 80 ++++++++++++++++++++++++---------
>>  4 files changed, 63 insertions(+), 24 deletions(-)
>>=20
>> diff --git a/include/linux/limits.h b/include/linux/limits.h
>> index
>> f6bcc936901071f496e3e85bb6e1d93905b12e32..8f7fd85b41fb46e6992d9e5912da00=
424119227a
>> 100644
>> --- a/include/linux/limits.h
>> +++ b/include/linux/limits.h
>> @@ -8,6 +8,7 @@
>> =20
>>  #define SIZE_MAX=09(~(size_t)0)
>>  #define SSIZE_MAX=09((ssize_t)(SIZE_MAX >> 1))
>> +#define SSIZE_MIN=09(-SSIZE_MAX - 1)
>>  #define PHYS_ADDR_MAX=09(~(phys_addr_t)0)
>> =20
>>  #define U8_MAX=09=09((u8)~0U)
>> diff --git a/include/linux/mfd/wl1273-core.h b/include/linux/mfd/wl1273-=
core.h
>> index
>> c28cf76d5c31ee1c94a9319a2e2d318bf00283a6..b81a229135ed9f756c749122a83418=
16031c8311
>> 100644
>> --- a/include/linux/mfd/wl1273-core.h
>> +++ b/include/linux/mfd/wl1273-core.h
>> @@ -204,9 +204,6 @@
>>  =09=09=09=09 WL1273_IS2_TRI_OPT | \
>>  =09=09=09=09 WL1273_IS2_RATE_48K)
>> =20
>> -#define SCHAR_MIN (-128)
>> -#define SCHAR_MAX 127
>> -
>>  #define WL1273_FR_EVENT=09=09=09BIT(0)
>>  #define WL1273_BL_EVENT=09=09=09BIT(1)
>>  #define WL1273_RDS_EVENT=09=09BIT(2)
>> diff --git a/include/vdso/limits.h b/include/vdso/limits.h
>> index
>> 0197888ad0e00b2f853d3f25ffa764f61cca7385..0cad0a2490e5efc194d874025eb3e3=
b846a5c7b4
>> 100644
>> --- a/include/vdso/limits.h
>> +++ b/include/vdso/limits.h
>> @@ -2,6 +2,9 @@
>>  #ifndef __VDSO_LIMITS_H
>>  #define __VDSO_LIMITS_H
>> =20
>> +#define UCHAR_MAX=09((unsigned char)~0U)
>> +#define SCHAR_MAX=09((signed char)(UCHAR_MAX >> 1))
>> +#define SCHAR_MIN=09((signed char)(-SCHAR_MAX - 1))
>>  #define USHRT_MAX=09((unsigned short)~0U)
>>  #define SHRT_MAX=09((short)(USHRT_MAX >> 1))
>>  #define SHRT_MIN=09((short)(-SHRT_MAX - 1))
>> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
>> index
>> a60d348efb276d66ca07fe464883408df7fdab97..9846d2385f5b9e8f3945a5664d8104=
7e97cf10d5
>> 100644
>> --- a/lib/vsprintf.c
>> +++ b/lib/vsprintf.c
>> @@ -59,7 +59,7 @@
>>  bool no_hash_pointers __ro_after_init;
>>  EXPORT_SYMBOL_GPL(no_hash_pointers);
>> =20
>> -static noinline unsigned long long simple_strntoull(const char *startp,=
 size_t
>> max_chars, char **endp, unsigned int base)
>> +static noinline unsigned long long simple_strntoull(const char *startp,=
 size_t
>> max_chars, char **endp, unsigned int base, bool *overflow)
>>  {
>>  =09const char *cp;
>>  =09unsigned long long result =3D 0ULL;
>> @@ -71,6 +71,8 @@ static noinline unsigned long long simple_strntoull(co=
nst char
>> *startp, size_t m
>>  =09if (prefix_chars < max_chars) {
>>  =09=09rv =3D _parse_integer_limit(cp, base, &result, max_chars - prefix=
_chars);
>>  =09=09/* FIXME */
>> +=09=09if (overflow)
>> +=09=09=09*overflow =3D !!(rv & KSTRTOX_OVERFLOW);
>>  =09=09cp +=3D (rv & ~KSTRTOX_OVERFLOW);
>>  =09} else {
>>  =09=09/* Field too short for prefix + digit, skip over without converti=
ng */
>> @@ -94,7 +96,7 @@ static noinline unsigned long long simple_strntoull(co=
nst char
>> *startp, size_t m
>>  noinline
>>  unsigned long long simple_strtoull(const char *cp, char **endp, unsigne=
d int
>>  base)
>>  {
>> -=09return simple_strntoull(cp, INT_MAX, endp, base);
>> +=09return simple_strntoull(cp, INT_MAX, endp, base, NULL);
>>  }
>>  EXPORT_SYMBOL(simple_strtoull);
>> =20
>> @@ -130,18 +132,22 @@ long simple_strtol(const char *cp, char **endp, un=
signed
>> int base)
>>  EXPORT_SYMBOL(simple_strtol);
>> =20
>>  static long long simple_strntoll(const char *cp, size_t max_chars, char=
 **endp,
>> -=09=09=09=09 unsigned int base)
>> +=09=09=09=09 unsigned int base, bool *overflow)
>>  {
>> +=09unsigned long long minand;
>> +=09bool negate;
>> +
>>  =09/*
>>  =09 * simple_strntoull() safely handles receiving max_chars=3D=3D0 in t=
he
>>  =09 * case cp[0] =3D=3D '-' && max_chars =3D=3D 1.
>>  =09 * If max_chars =3D=3D 0 we can drop through and pass it to simple_s=
trntoull()
>>  =09 * and the content of *cp is irrelevant.
>>  =09 */
>> -=09if (*cp =3D=3D '-' && max_chars > 0)
>> -=09=09return -simple_strntoull(cp + 1, max_chars - 1, endp, base);
>> -
>> -=09return simple_strntoull(cp, max_chars, endp, base);
>> +=09negate =3D *cp =3D=3D '-' && max_chars > 0;
>> +=09minand =3D simple_strntoull(cp + negate, max_chars - negate, endp, b=
ase,
>> overflow);
>> +=09if (minand > (unsigned long long)LONG_MAX + negate)
>> +=09=09*overflow =3D true;
>> +=09return negate ? -minand : minand;
>>  }
>> =20
>>  static noinline_for_stack
>> @@ -3427,7 +3433,7 @@ int vsscanf(const char *buf, const char *fmt, va_l=
ist
>> args)
>>  =09=09unsigned long long u;
>>  =09} val;
>>  =09s16 field_width;
>> -=09bool is_sign;
>> +=09bool is_sign, overflow;
>> =20
>>  =09while (*fmt) {
>>  =09=09/* skip any white space in format */
>> @@ -3635,45 +3641,77 @@ int vsscanf(const char *buf, const char *fmt, va=
_list
>> args)
>>  =09=09if (is_sign)
>>  =09=09=09val.s =3D simple_strntoll(str,
>>  =09=09=09=09=09=09field_width >=3D 0 ? field_width : INT_MAX,
>> -=09=09=09=09=09=09&next, base);
>> +=09=09=09=09=09=09&next, base, &overflow);
>>  =09=09else
>>  =09=09=09val.u =3D simple_strntoull(str,
>>  =09=09=09=09=09=09 field_width >=3D 0 ? field_width : INT_MAX,
>> -=09=09=09=09=09=09 &next, base);
>> +=09=09=09=09=09=09 &next, base, &overflow);
>> +=09=09if (unlikely(overflow))
>> +=09=09=09return -ERANGE;
>> =20
>>  =09=09switch (qualifier) {
>>  =09=09case 'H':=09/* that's 'hh' in format */
>> -=09=09=09if (is_sign)
>> +=09=09=09if (is_sign) {
>> +=09=09=09=09if (unlikely(val.s < SCHAR_MIN || val.s > SCHAR_MAX))
>> +=09=09=09=09=09return -ERANGE;
>>  =09=09=09=09*va_arg(args, signed char *) =3D val.s;
>> -=09=09=09else
>> +=09=09=09} else {
>> +=09=09=09=09if (unlikely(val.u > UCHAR_MAX))
>> +=09=09=09=09=09return -ERANGE;
>>  =09=09=09=09*va_arg(args, unsigned char *) =3D val.u;
>> +=09=09=09}
>>  =09=09=09break;
>>  =09=09case 'h':
>> -=09=09=09if (is_sign)
>> +=09=09=09if (is_sign) {
>> +=09=09=09=09if (unlikely(val.s < SHRT_MIN || val.s > SHRT_MAX))
>> +=09=09=09=09=09return -ERANGE;

Returning a negative value here will break many existing in-kernel users.
Most users just check for the number of matched elements.

Linus' idea was returning 0 upon overflow (nothing matched) and allowing
overflows (if really needed) by adding a new format string qualifier "!".
e.g. "%!d".

Thanks,
//richard

