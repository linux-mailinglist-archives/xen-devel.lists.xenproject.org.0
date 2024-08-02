Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9D945EAE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 15:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771187.1181759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsLP-0005gG-SM; Fri, 02 Aug 2024 13:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771187.1181759; Fri, 02 Aug 2024 13:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsLP-0005df-PP; Fri, 02 Aug 2024 13:29:19 +0000
Received: by outflank-mailman (input) for mailman id 771187;
 Fri, 02 Aug 2024 13:29:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tTZu=PB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1sZsLO-0005dZ-Bj
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 13:29:18 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 379a8edb-50d3-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 15:29:17 +0200 (CEST)
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
X-Inumbo-ID: 379a8edb-50d3-11ef-bc03-fd08da9f4363
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722605356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGzg2GI52aMVT+D2Uiqc+6QeQHTjRhsZ/Zs1cCBOQtE=;
	b=SiOm2omP/tgfjELJXSOEYlM8oF68VQ0LL30cTKg6qUSPSHf8TIJ2NgjXa5CvcKwpB76uGX
	gcGPx+l9GbUZ5c57Myn+S0vARRsJC3aAv2NFgTLjR0heoWxtnPQ2c14YXaI/rEb3TTYalU
	OaLDwVzpMb+FuELeGkUCbkRlL/uhBr/ApOEiNlvFuTj5fyNRbrhs9oZCIX0NSCyP95DQou
	GdH0dXWJLsh9+RHry7Eh8u2OA1N/9PsUMqyVn0Z0ikRFNHy/uoWXqRbcwcq7dc4UXYv0ha
	kw27E8rw2aDTgeGx+oY2nQQVQjOLK05lqq5THKWk9zBtzde2ovXJZHxFllOM7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722605356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGzg2GI52aMVT+D2Uiqc+6QeQHTjRhsZ/Zs1cCBOQtE=;
	b=3wk4aHblZYZP+DV3l2Bg1qTrEEEdZEIg+aR9vzhFn9qF3Dg5Vg8WZhUjovKl81TtSo6blo
	6DmekKP/L43SC0CQ==
To: Nikolay Borisov <nik.borisov@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/3] x86/cpu: fix unbootable VMs by inlining memcmp in
 hypervisor_cpuid_base
In-Reply-To: <824e522d-c9e2-4e24-8ce6-aca6573db06a@suse.com>
References: <a9f505a6-fd31-4cfa-a193-d21638bb14f1@p183>
 <304592cf-e4a7-4ba1-baa6-4941c60f0e3c@p183>
 <824e522d-c9e2-4e24-8ce6-aca6573db06a@suse.com>
Date: Fri, 02 Aug 2024 15:29:16 +0200
Message-ID: <877ccz12ab.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02 2024 at 16:25, Nikolay Borisov wrote:
> On 2.08.24 =D0=B3. 11:50 =D1=87., Alexey Dobriyan wrote:
>> If this memcmp() is not inlined then PVH early boot code can call
>> into KASAN-instrumented memcmp() which results in unbootable VMs:
>>=20
>> 	pvh_start_xen
>> 	xen_prepare_pvh
>> 	xen_cpuid_base
>> 	hypervisor_cpuid_base
>> 	memcmp
>>=20
>> Ubuntu's gcc version 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.04) inlines
>> memcmp with patch and the bug is partially fixed.
>>=20
>> Leave FIXME just in case someone cares enough to compare 3 pairs of
>> integers like 3 pairs of integers.
>>=20
>> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
>> ---
>>=20
>>   arch/x86/include/asm/cpuid.h | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/x86/include/asm/cpuid.h b/arch/x86/include/asm/cpuid.h
>> index 6b122a31da06..3eca7824430e 100644
>> --- a/arch/x86/include/asm/cpuid.h
>> +++ b/arch/x86/include/asm/cpuid.h
>> @@ -196,7 +196,20 @@ static inline uint32_t hypervisor_cpuid_base(const =
char *sig, uint32_t leaves)
>>   	for_each_possible_hypervisor_cpuid_base(base) {
>>   		cpuid(base, &eax, &signature[0], &signature[1], &signature[2]);
>>=20=20=20
>> -		if (!memcmp(sig, signature, 12) &&
>> +		/*
>> +		 * FIXME rewrite cpuid comparators to accept uint32_t[3].
>> +		 *
>> +		 * This memcmp()
>> +		 * a) is called from PVH early boot code
>> +		 *    before instrumentation is set up,
>> +		 * b) may be compiled to "call memcmp" (not inlined),
>> +		 * c) memcmp() itself may be instrumented.
>> +		 *
>> +		 * Any combination of 2 is fine, but all 3 aren't.
>> +		 *
>> +		 * Force inline this function call.
>> +		 */
>> +		if (!__builtin_memcmp(sig, signature, 12) &&
>
> Instead of putting this giant FIXME, why not simply do the comparison as=
=20
> ints, i.e ((uint32_t)&sig[0]) =3D=3D signature1 && ((uitn32_t)&sig[4]) =
=3D=3D=20
> signature2 && ((uint32_t)&sig[8] =3D=3D signature_3  and be done with it?

Because a smart compiler might turn it into a memcmp() :

