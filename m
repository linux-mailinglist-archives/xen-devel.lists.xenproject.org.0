Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A6B0AA4A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 20:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1049111.1419217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucq1s-0001U5-7U; Fri, 18 Jul 2025 18:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1049111.1419217; Fri, 18 Jul 2025 18:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucq1s-0001Rw-3g; Fri, 18 Jul 2025 18:41:56 +0000
Received: by outflank-mailman (input) for mailman id 1049111;
 Fri, 18 Jul 2025 18:41:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7077=Z7=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1ucq1q-0001Ro-UN
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 18:41:55 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ded7c82f-6406-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 20:41:52 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7d5d1feca18so228176685a.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 11:41:52 -0700 (PDT)
Received: from [10.138.10.6] ([89.187.178.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356c44cdesm114094885a.61.2025.07.18.11.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 11:41:50 -0700 (PDT)
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
X-Inumbo-ID: ded7c82f-6406-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752864111; x=1753468911; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RXj+Vet0ohfMVoILmVutjrmTonwV+jMTuA8b6zERRZA=;
        b=LO55GxkjLuRU45cJnoqCF/hKHg65B8+TmhvFGWZPMljN+86OxJvt4gnkbYuYGg2IQB
         MV1Q4Zz54NHs8xHpYWzMptKjuRRgL2HCCQPOAgjl+QRv8bvXMan+x04fGjeQAbDBX3Dn
         DbtpW1SLVNJW0or4eVLuG91pDAd/veLJhB3Ul8prUQydLcvwnGjNO8HYGPKH4YqWcF6z
         EW9bfM9zWbyY+Vz5JFWNtfngJ12mHk8cAyni3tqNG2OtGxsPY6F6omiEc78oIKL20bbn
         mU+C4CLW78cVcN7Fwbe/blrZu2W37/C8OY9IEfuq1FTA7hGnK9vzs70C6JvZKuxtlqPN
         pFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752864111; x=1753468911;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RXj+Vet0ohfMVoILmVutjrmTonwV+jMTuA8b6zERRZA=;
        b=SmAGa0FvLMGl4JgMVmvuxZWbF33AUj5u9SXdFZBke/F+Zs1b3OgHsi8mJHkra2mqOl
         mPh5MkJpnReyG7xoAuIw2sQrRCBLgM0eY2YgJTaC0HsuzYcBM1vHilrXO4T0pnudShKQ
         mCebBzFfv5PtG6E/LefYSk/eFncX8o6UmAkGC11qehjca4WS1Oi7BmIGiGiDfmP8M8QE
         UFsDojxTi17cF998rVDQBgXkvTLh+t7Qt0XHRvPkXDnIy2gN3aAWdTYdfSompmN05dfh
         s29dS4wLJyD7tpn9XBWTA6dnv2+SO5JCXqGYA8R834WW2DtTtgvaor6ffJ8ZSYmep7iL
         zyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVug+XaH8OQD+4TZU7EY/bEu0PkLkc5dzxdaegzND/iY+k//tdL8f4lENXzvISK/4wpZcBUZIyDACs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJzRgCUk+wvSJPF4UHWZ3R5ipE1UMUHqviPvMmdzu61rCHrOW9
	sUwZTWSffW+B5E1qxTDz28gHyhrrns0evl/tUOhjlNAIVMC3FJE3+BQa
X-Gm-Gg: ASbGncul54FQBx9gB4k264YH0zjxdms6kgknaobnpVUBTiFOYixeNNVAzo7JXu9ahuL
	M8Hgj7/+050a299vXlr3SPKT7EtO/D87rI/e/sJRFVbhHWeA5ogr4b3e3TZ1yvdjtXZ2q6mZOop
	sHUqWBsCbHDMGGTZ7TfYpXVL3Atx2LVUNpLmbF0y31R1v0FqjkzPgUnQpWSkgzoOQLhsF05Qp7l
	BTlzVFKHzn2EQ6SuNh6/RzZTeSjcmcP2xQQN9L7VI8sLJo+9ZgvEcFEfQQZCC+XhIE2OP7Sv2OJ
	15Q1ZTUORpmfNp6/o/O3+sttQYZIrzrUcxZZictBOL0wtfBX580JrWXs6Kk8nnRGqQKq3XCc4ZX
	JGMIiFe3xbJOgRALReXs4IiuCI8s=
X-Google-Smtp-Source: AGHT+IGlRf4DdH2cBhZ+Kobxd1tqqREjN9sRdlQ+Iv4AT5vmGVZcliCtGqSbOvzH40EF17aNvb8XQA==
X-Received: by 2002:a05:620a:4088:b0:7e1:538d:5c5e with SMTP id af79cd13be357-7e3436253d2mr1664931485a.46.1752864111018;
        Fri, 18 Jul 2025 11:41:51 -0700 (PDT)
Message-ID: <ece3738d-9e4d-4e3a-875f-f65410538823@gmail.com>
Date: Fri, 18 Jul 2025 14:41:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 victorm.lira@amd.com, Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <f1d1dbe4-5b62-4540-a480-afa6045d9622@epam.com>
 <39114395-5aa0-4c4a-a0b9-f151c6976674@suse.com>
 <078093af-1581-44e8-97f0-82561bfd06a5@epam.com>
 <ca61bfc1-2b22-4c42-b03d-7e05588aac0c@epam.com>
 <f3e56c3fc9bf8351f253bb988138ed57@bugseng.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <f3e56c3fc9bf8351f253bb988138ed57@bugseng.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PEmBQznLyeZ07Hv5AFeaiK5x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PEmBQznLyeZ07Hv5AFeaiK5x
Content-Type: multipart/mixed; boundary="------------zwKcl0O0cO5uAXaQEc0MLCRp";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 victorm.lira@amd.com, Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <ece3738d-9e4d-4e3a-875f-f65410538823@gmail.com>
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <f1d1dbe4-5b62-4540-a480-afa6045d9622@epam.com>
 <39114395-5aa0-4c4a-a0b9-f151c6976674@suse.com>
 <078093af-1581-44e8-97f0-82561bfd06a5@epam.com>
 <ca61bfc1-2b22-4c42-b03d-7e05588aac0c@epam.com>
 <f3e56c3fc9bf8351f253bb988138ed57@bugseng.com>
In-Reply-To: <f3e56c3fc9bf8351f253bb988138ed57@bugseng.com>

--------------zwKcl0O0cO5uAXaQEc0MLCRp
Content-Type: multipart/mixed; boundary="------------P5csdqn0xqPpW87ymernbWBj"

--------------P5csdqn0xqPpW87ymernbWBj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/18/25 07:08, Nicola Vetrini wrote:
> On 2025-07-18 11:28, Dmytro Prokopchuk1 wrote:
>> On 7/18/25 12:17, Dmytro Prokopchuk wrote:
>>>
>>>
>>> On 7/18/25 08:31, Jan Beulich wrote:
>>>> On 17.07.2025 22:47, Dmytro Prokopchuk1 wrote:
>>>>>
>>>>>
>>>>> On 4/23/25 20:54, victorm.lira@amd.com wrote:
>>>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>
>>>>>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>>>>>> reserved identifier or reserved macro name") and R21.2 ("A reserve=
d
>>>>>> identifier or reserved macro name shall not be declared")=20
>>>>>> violations
>>>>>> are not problematic for Xen, as it does not use the C or POSIX
>>>>>> libraries.
>>>>>>
>>>>>> Xen uses -fno-builtin and -nostdinc to ensure this, but there are =

>>>>>> still
>>>>>> __builtin_* functions from the compiler that are available so
>>>>>> a deviation is formulated for all identifiers not starting with
>>>>>> "__builtin_".
>>>>>>
>>>>>> The missing text of a deviation for Rule 21.2 is added to
>>>>>> docs/misra/deviations.rst.
>>>>>>
>>>>>> To avoid regressions, tag both rules as clean and add them to the
>>>>>> monitored set.
>>>>>>
>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>>> ---
>>>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> Cc: Anthony PERARD <anthony.perard@vates.tech>
>>>>>> Cc: Michal Orzel <michal.orzel@amd.com>
>>>>>> Cc: Jan Beulich <jbeulich@suse.com>
>>>>>> Cc: Julien Grall <julien@xen.org>
>>>>>> Cc: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>>>>> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>> Cc: Federico Serafini <federico.serafini@bugseng.com>
>>>>>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>>> ---
>>>>>> =C2=A0=C2=A0 .../eclair_analysis/ECLAIR/deviations.ecl=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 9 ++++++-
>>>>>> =C2=A0=C2=A0 .../eclair_analysis/ECLAIR/monitored.ecl=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>>>>>> =C2=A0=C2=A0 automation/eclair_analysis/ECLAIR/tagging.ecl |=C2=A0=
 2 ++
>>>>>> =C2=A0=C2=A0 docs/misra/deviations.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 26=20
>>>>>> ++++++++++++++
>>>>>> ++++-
>>>>>> =C2=A0=C2=A0 4 files changed, 37 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/
>>>>>> automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>> index 2c8fb92713..ffa23b53b7 100644
>>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>> @@ -639,8 +639,15 @@ in the expansion."
>>>>>> =C2=A0=C2=A0 # Series 21.
>>>>>> =C2=A0=C2=A0 #
>>>>>>
>>>>>> +-doc_begin=3D"Xen does not use C and POSIX libraries:
>>>>>> +identifiers reserved by these libraries can be used safely, excep=
t
>>>>>> for those
>>>>>> +beginning with '__builtin_'."
>>>>>> +-config=3DMC3A2.R21.1,macros=3D{safe, "!^__builtin_.*$"}
>>>>>> +-config=3DMC3A2.R21.2,declarations=3D{safe, "!^__builtin_.*$"}
>>>>>> +-doc_end
>>>>>> +
>>>>>> =C2=A0=C2=A0 -doc_begin=3D"or, and and xor are reserved identifier=
s because=20
>>>>>> they
>>>>>> constitute alternate
>>>>>> -spellings for the corresponding operators (they are defined as
>>>>>> macros by iso646.h).
>>>>>> +spellings for the corresponding logical operators (as defined in
>>>>>> header 'iso646.h').
>>>>>> =C2=A0=C2=A0 However, Xen doesn't use standard library headers, so=
 there is=20
>>>>>> no
>>>>>> risk of overlap."
>>>>>> =C2=A0=C2=A0 -config=3DMC3A2.R21.2,reports+=3D{safe,
>>>>>> "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
>>>>>> =C2=A0=C2=A0 -doc_end
>>>>>> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/
>>>>>> automation/eclair_analysis/ECLAIR/monitored.ecl
>>>>>> index 8351996ec8..da229a0d84 100644
>>>>>> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
>>>>>> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
>>>>>> @@ -79,6 +79,8 @@
>>>>>> =C2=A0=C2=A0 -enable=3DMC3A2.R20.12
>>>>>> =C2=A0=C2=A0 -enable=3DMC3A2.R20.13
>>>>>> =C2=A0=C2=A0 -enable=3DMC3A2.R20.14
>>>>>> +-enable=3DMC3A2.R21.1
>>>>>> +-enable=3DMC3A2.R21.2
>>>>>> =C2=A0=C2=A0 -enable=3DMC3A2.R21.3
>>>>>> =C2=A0=C2=A0 -enable=3DMC3A2.R21.4
>>>>>> =C2=A0=C2=A0 -enable=3DMC3A2.R21.5
>>>>>> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/
>>>>>> automation/eclair_analysis/ECLAIR/tagging.ecl
>>>>>> index 1d078d8905..3292bf751e 100644
>>>>>> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
>>>>>> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
>>>>>> @@ -88,6 +88,8 @@ MC3A2.R20.11||
>>>>>> =C2=A0=C2=A0 MC3A2.R20.12||
>>>>>> =C2=A0=C2=A0 MC3A2.R20.13||
>>>>>> =C2=A0=C2=A0 MC3A2.R20.14||
>>>>>> +MC3A2.R21.1||
>>>>>> +MC3A2.R21.2||
>>>>>> =C2=A0=C2=A0 MC3A2.R21.3||
>>>>>> =C2=A0=C2=A0 MC3A2.R21.4||
>>>>>> =C2=A0=C2=A0 MC3A2.R21.5||
>>>>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst=

>>>>>> index fe0b1e10a2..88328eaa8a 100644
>>>>>> --- a/docs/misra/deviations.rst
>>>>>> +++ b/docs/misra/deviations.rst
>>>>>> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 construct i=
s deviated only in Translation Units that
>>>>>> present a violation
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of the Rule=
 due to uses of this macro.
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `deliberate=
` for ECLAIR.
>>>>>> -
>>>>>> +
>>>>>> +=C2=A0=C2=A0 * - R21.1
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 - Rule 21.1 reports identifiers reserved=
 for the C and POSIX
>>>>>> standard
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libraries. Xen does not use =
such libraries and all
>>>>>> translation units
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 are compiled with option '-n=
ostdinc', therefore there is no
>>>>>> reason to
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 avoid to use `#define` or `#=
undef` on such identifiers
>>>>>> except for those
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 beginning with `__builtin_` =
for which compilers may perform
>>>>>> (wrong)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optimizations.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR.
>>>>>> +
>>>>>> +=C2=A0=C2=A0 * - R21.2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 - Rule 21.2 reports identifiers reserved=
 for the C and POSIX
>>>>>> standard
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libraries. Xen does not use =
such libraries and all
>>>>>> translation units
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 are compiled with option '-n=
ostdinc', therefore there is no
>>>>>> reason to
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 avoid declaring such identif=
iers except for those beginning
>>>>>> with
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 `__builtin_` for which compi=
lers may perform (wrong)
>>>>>> optimizations.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR.
>>>>>> +
>>>>>> +=C2=A0=C2=A0 * - R21.2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 - `or`, `and` and `xor` are reserved ide=
ntifiers because they
>>>>>> constitute
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alternate spellings for the =
corresponding logical operators
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (as defined in Standard Libr=
ary header `\<iso646.h\>`). Xen
>>>>>> does not use
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Standard library headers, so=
 there is no risk of overlap.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 - Tagged as `safe` for ECLAIR.
>>>>>> +
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * - R21.9
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Xen does not use the =
`bsearch` and `qsort` functions
>>>>>> provided by the C
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Standard Li=
brary, but provides in source form its own
>>>>>> implementation,
>>>>>> --
>>>>>> 2.47.0
>>>>>
>>>>> Hello All!
>>>>>
>>>>> I tried to play with Rule 21.1 deviations.
>>>>>
>>>>> After applying the following configurations:
>>>>>
>>>>> -config=3DMC3A2.R21.1,macros+=3D{safe, "^offsetof$ || ^(is|to)[a-z]=
+$ ||
>>>>> name(NULL) || name(bool) || name(true) || name(false)"}
>>>>> -config=3DMC3A2.R21.1,macros+=3D{safe,
>>>>> "loc(file(^xen/include/xen/inttypes\\.h$))"}
>>>>> -config=3DMC3A2.R21.1,macros+=3D{safe, "loc(file(^xen/include/xen/t=
ypes\
>>>>> \.h$))"}
>>>>> -config=3DMC3A2.R21.1,macros+=3D{safe, "^str[a-z]+$ || ^(v)?sprintf=
$ ||
>>>>> ^va_[a-z]+$"}
>>>>
>>>> Can you spell these out in words? I can only vaguely interpret these=

>>>> Eclair
>>>> patterns, sorry.
>>> Yes, sure.
>>>
>>> That means to deviate the following macros:
>>> - offsetof
>>> - begin with either =E2=80=98is=E2=80=99 or =E2=80=98to=E2=80=99 foll=
owed by a lowercase letters
>>> (islower, isdigit, tolower, toupper, etc.)
>>> - NULL
>>> - bool
>>> - true
>>> - false
>>> - all PRI/SCN macros for printing/scanning format specifiers from=20
>>> header
>>> file xen/include/xen/inttypes.h
>>> - all macros from header file xen/include/xen/types.h (limits:
>>> UINT8_MAX, INT_MAX, LONG_MIN, etc.)
>>> - begin with 'str' followed by a lowercase letters (string functions)=

>>> - sprintf/vsprintf
>>> - begin with 'va_' followed by a lowercase letters (va_copy, va_start=
,
>>> va_end, va_arg)
>>>
>>>>
>>>>> Eclair showed 699 remaining violations.
>>>>> All of them were related to names beginning with an underscore (_).=

>>>>>
>>>>> It's possible to resolve the rest of them with help of (all, except=
=20
>>>>> for
>>>>> those beginning with '__builtin_' and '__x86_64__'):
>>>>>
>>>>> -config=3DMC3A2.R21.1,macros+=3D{safe, "^_.*$ && !^__builtin_.*$ &&=

>>>>> !^__x86_64__$"}
>>>>>
>>>>> Probably, the exception list can be extended.
>>>>>
>>>>> Jan,
>>>>> I know you don't want to disallow "_all_" such reserved identifiers=
=2E
>>>>> But how to deal with that?
>>>>
>>>> How do I not want this? I've been arguing for years that we should
>>>> respect
>>>> the reserved name spaces. (Did you perhaps mean "... you don't want =

>>>> to
>>>> deviate ..."?) There are exceptions, yes, e.g. ...
>>>>
>>> Yes, I meant about deviations. Sorry.
>>>
>>>>> Try to cover all macros? Like this, for example (I assume that ther=
e=20
>>>>> are
>>>>> no such reserved macros):
>>>>> -config=3DMC3A2.R21.1,macros+=3D{safe, "^.*XEN.*$ || ^.*HYPERVISOR.=
*$"}
>>>>
>>>> ... anything we may have (wrongly) introduced into the public=20
>>>> headers. We
>>>> can't very well change naming there.
>>> Looks like the only way is to deviate all macros (that are currently
>>> used in Xen), tag rule as "clean" and prohibit using reserved names i=
n
>>> the future.
>>>
>>> Any suggestions?
>>>
>>> Dmytro
>>
>> BTW, not all violations are in public headers.
>> Probably, they could be fixed in code.
>> But the number of them is huge...
>>
>=20
> This is precisely the issue I was pointing out when you offered to=20
> respin this patch. Yes, Xen could fix those rather than deviate, but th=
e=20
> sheer number of violations makes this in my opinion unfeasible.
Time for a sed script?  Only half-joking.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------P5csdqn0xqPpW87ymernbWBj
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------P5csdqn0xqPpW87ymernbWBj--

--------------zwKcl0O0cO5uAXaQEc0MLCRp--

--------------PEmBQznLyeZ07Hv5AFeaiK5x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmh6lWkACgkQszaHOrMp
8lNWkQ//cxFA7DAJDIokKvk1d7FyczDDG8OnGG4QbykbcJps4DzMYGYS3lbvZryw
M93ZtFs4vcdrPEZivKnAmVHYRB8ygXurXOCwuRhuPUGPVm73DpU/dKGderikcFbk
Dzvr1xyYqHHM5FCk66Q9Gf+CTP8BU1SPHmK0kfxT0sevBEITjsYW/WxJ91WX1TY+
GDN8OqvXZVSRPndwCvMqHKr+OzS/FR3PCjQ4A55HEzE5TWGnc2J5KKSXNCEWSkzN
d0e9z/BLRExeCvFuw/iqOeDBlfHk7JPf8OqyzCjQV/UonepWnrXuAt28o2mkLdnT
IjUAjUizEElnnYt+Q1i904jwzi9nojQQC1sYFGG5UUlaYzPt2F2Yxod9rXGMaI28
tD5U8TAUwaLlwedon5wWOuQmK2Vc0p3wECWLWaGT8NECQryMefMKMz2nSMR4D2Dh
EAZGT8i6hRsay1ZaC3Jb2I+3fscECJ4N4EuvE3JiZrYP747yJO2DtUL4bS0sp4n1
okCyjbmy6IJGXXd3wg9GT/5H/R7MQRbXIXHzF7pSvffHBVSTgKNDUPNLZVGuGo6B
2n5hODQlERcuY5dbPGepSF/sYM0rPcvcCOb0ucrmuTLrOEec5dy3LXa6i5FZ46FU
+BqeTIcTXQnShOA8Yg4KhgFU/3zhzTyXrOEgEhHiLTGmO9oey/8=
=V4Fd
-----END PGP SIGNATURE-----

--------------PEmBQznLyeZ07Hv5AFeaiK5x--

