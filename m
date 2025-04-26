Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2A1A9DB0C
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 15:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969174.1358420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8fQO-0001by-BI; Sat, 26 Apr 2025 13:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969174.1358420; Sat, 26 Apr 2025 13:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8fQO-0001Yr-8b; Sat, 26 Apr 2025 13:18:32 +0000
Received: by outflank-mailman (input) for mailman id 969174;
 Sat, 26 Apr 2025 13:18:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dw20=XM=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u8fQM-0001Yl-OH
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 13:18:31 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f096882d-22a0-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 15:18:29 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53QDHpWk258336
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sat, 26 Apr 2025 06:17:51 -0700
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
X-Inumbo-ID: f096882d-22a0-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53QDHpWk258336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745673473;
	bh=Qv3GGTRjeWcaBJIwFfN0RXsQO5eLawdKPmX5aFVR03I=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=V5W0NePqEB+f5hz/U3L86eTDhx7bq5IW0ix9OjeA0rqaCFagn7CgSQnvaYBKQRPR+
	 DRyjQ9n+Pw1DKxTdVmmeYO2fp2FzZSFD5ciM3iszYM0SQnB3FPv+fqHJtlKND+pN99
	 9f4XKCbxluMqfDrmJvOcC5yGKzw21/u4PFS4Y+XlNRpDEwXmexDxAwbnYrf+6PVpcc
	 ovkXUlO6lBk/cBTWwQSnB8JauHZf3O0iiug1d7HdDNK4BiM+eXCL3IPshWwyS/12pF
	 A246qrgnqTKgwSs7odcmxAeZ0SKVkn01loluJEelcymYWBurrZLUhm6DNBOj+Rewp0
	 WSPvnPNQENA+Q==
Date: Sat, 26 Apr 2025 06:17:50 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
User-Agent: K-9 Mail for Android
In-Reply-To: <aAyiganPp_UsNlnZ@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
Message-ID: <E130C6F4-5602-44E6-ABB0-B87B389C0026@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 26, 2025 2:08:17 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* Arnd Bergmann <arnd@kernel=2Eorg> wrote:
>
>> From: Arnd Bergmann <arnd@arndb=2Ede>
>>=20
>> With cx8 and tsc being mandatory features, the only important
>> architectural features are now cmov and pae=2E
>>=20
>> Change the large list of target CPUs to no longer pick the instruction =
set
>> itself but only the mtune=3D optimization level and in-kernel optimizat=
ions
>> that remain compatible with all cores=2E
>>=20
>> The CONFIG_X86_CMOV instead becomes user-selectable and is now how
>> Kconfig picks between 586-class (Pentium, Pentium MMX, K6, C3, GeodeGX)
>> and 686-class (everything else) targets=2E
>>=20
>> In order to allow running on late 32-bit cores (Athlon, Pentium-M,
>> Pentium 4, =2E=2E=2E), the X86_L1_CACHE_SHIFT can no longer be set to a=
nything
>> lower than 6 (i=2Ee=2E 64 byte cache lines)=2E
>>=20
>> The optimization options now depend on X86_CMOV and X86_PAE instead
>> of the other way round, while other compile-time conditionals that
>> checked for MATOM/MGEODEGX1 instead now check for CPU_SUP_* options
>> that enable support for a particular CPU family=2E
>>=20
>> Link: https://lore=2Ekernel=2Eorg/lkml/dd29df0c-0b4f-44e6-b71b-2a358ea7=
6fb4@app=2Efastmail=2Ecom/
>> Signed-off-by: Arnd Bergmann <arnd@arndb=2Ede>
>> ---
>> This is what I had in mind as mentioned in the earlier thread on
>> cx8/tsc removal=2E I based this on top of the Ingo's [RFC 15/15]
>> patch=2E
>> ---
>>  arch/x86/Kconfig                |   2 +-
>>  arch/x86/Kconfig=2Ecpu            | 100 ++++++++++++++----------------=
--
>>  arch/x86/Makefile_32=2Ecpu        |  48 +++++++--------
>>  arch/x86/include/asm/vermagic=2Eh |  36 +-----------
>>  arch/x86/kernel/tsc=2Ec           |   2 +-
>>  arch/x86/xen/Kconfig            |   1 -
>>  drivers/misc/mei/Kconfig        |   2 +-
>>  7 files changed, 74 insertions(+), 117 deletions(-)
>
>While the simplification is nice on its face, this looks messy:
>
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index a9d717558972=2E=2E1e33f88c9b97 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -1438,7 +1438,7 @@ config HIGHMEM
>> =20
>>  config X86_PAE
>>  	bool "PAE (Physical Address Extension) Support"
>> -	depends on X86_32 && X86_HAVE_PAE
>> +	depends on X86_32 && X86_CMOV
>
>Coupling CMOV to PAE =2E=2E=2E :-/
>
>> +config X86_CMOV
>> +	bool "Require 686-class CMOV instructions" if X86_32
>> +	default y
>>  	help
>> -	  This is the processor type of your CPU=2E This information is
>> -	  used for optimizing purposes=2E In order to compile a kernel
>> -	  that can run on all supported x86 CPU types (albeit not
>> -	  optimally fast), you can specify "586" here=2E
>> +	  Most x86-32 processor implementations are compatible with
>> +	  the the CMOV instruction originally added in the Pentium Pro,
>> +	  and they perform much better when using it=2E
>> +
>> +	  Disable this option to build for 586-class CPUs without this
>> +	  instruction=2E This is only required for the original Intel
>> +	  Pentium (P5, P54, P55), AMD K6/K6-II/K6-3D, Geode GX1 and Via
>> +	  CyrixIII/C3 CPUs=2E
>
>Very few users will know anything about CMOV=2E
>
>I'd argue the right path forward is to just bite the bullet and remove=20
>non-CMOV support as well, that would be the outcome *anyway* in a few=20
>years=2E That would allow basically a single 'modern' 32-bit kernel that=
=20
>is supposed to boot on every supported CPU=2E People might even end up=20
>testing it =2E=2E=2E ;-)
>
>Thanks,
>
>	Ingo

Dropping CMOV would mean dropping P5 support=2E 

