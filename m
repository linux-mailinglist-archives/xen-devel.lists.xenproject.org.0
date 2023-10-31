Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702C17DC9AD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 10:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625549.974924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxl60-0008Fz-GY; Tue, 31 Oct 2023 09:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625549.974924; Tue, 31 Oct 2023 09:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxl60-0008DS-Dz; Tue, 31 Oct 2023 09:31:36 +0000
Received: by outflank-mailman (input) for mailman id 625549;
 Tue, 31 Oct 2023 09:31:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q6UM=GN=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qxl5y-0008DM-Fq
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 09:31:34 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46bd03a7-77d0-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 10:31:32 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4083cd3917eso42504635e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 02:31:32 -0700 (PDT)
Received: from smtpclient.apple ([90.243.16.33])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a5d6811000000b0032d2f09d991sm1053177wru.33.2023.10.31.02.31.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Oct 2023 02:31:31 -0700 (PDT)
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
X-Inumbo-ID: 46bd03a7-77d0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698744691; x=1699349491; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHKKF3iAKmYWNV7TRjZxqdkO++P0krjMVNcgLiYVS48=;
        b=E90XvBuVCZQCpPPvPdG4gfKaGYwcqDBwBK1qWvcPU2zZ9ReFgDSDvs+UGwbF1vSAvi
         WMhSR1BFkVh4eSR7/jWBnnsUAGqDu+VmiOMIf2CkkSyUO4h9ZL7rnn5jyPq0qNX+6GWp
         FyORIMwDuHaQqmtoOY8fYQk2Ja/8fgBp9uDP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698744691; x=1699349491;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHKKF3iAKmYWNV7TRjZxqdkO++P0krjMVNcgLiYVS48=;
        b=m0ylN9CYqiERpo53l9QUGjdptIUKkLqZIH5bE7gW1lBzz26p+fFlCwGkOtrn3RIHEh
         i59S1A9aQ7qNh8j5ceLemsoyZJMnxbfcMj6xx6RQdnPADVxteN6X0t7l0POLjVRcJEjy
         lcvjY9bcUOI1PSHdwGOUThbeLrmm7LmJ4hXA2TN4T1EU0Hig+rrhTZzb4qQYeXIV6qvs
         dniq1VdN9EQ+wofQpyeVMTkE0qDCAb0tFMpVt9pG0r402KHEO/Yi/26BS6fjCkpVZoCQ
         c6u+nX3mv37kdf/ekVjbG9vFuDszps3I31MVTjYgIgXJmDVnBIKn90LbNCQbWo7Fal5+
         J34Q==
X-Gm-Message-State: AOJu0YyjZpyNr979LZ7TNj5yttUaBFdg6s9xPs0HvJpG4M/nfaAM5K08
	1dXCiUu4Lh6OBjZLaNZMVm3FN02k0pwvvpOHxZI=
X-Google-Smtp-Source: AGHT+IHZLKwN8BfAwUKeHdNQEQMENeUJy/n+1l8MRGK/xLapHLtZ1j8S4vRfvamWBZ9bc5Q2hu/kKQ==
X-Received: by 2002:a7b:cbcb:0:b0:3fe:2b8c:9f0b with SMTP id n11-20020a7bcbcb000000b003fe2b8c9f0bmr9169447wmi.23.1698744691334;
        Tue, 31 Oct 2023 02:31:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [RFC PATCH 03/22] x86/msr: always allow a pinned Dom0 to read any
 unknown MSR
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <ac2eaa4a-36da-9d77-f682-a6bef25e27f0@suse.com>
Date: Tue, 31 Oct 2023 09:31:20 +0000
Cc: =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <46B60857-CC42-45D6-96E5-04F5CB1C7A7B@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <4c04e5661688cf1de3e3fd668b0a78b23b6d7b2e.1698261255.git.edwin.torok@cloud.com>
 <ac2eaa4a-36da-9d77-f682-a6bef25e27f0@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On 30 Oct 2023, at 16:29, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 25.10.2023 21:29, Edwin T=C3=B6r=C3=B6k wrote:
>> This can be useful if you realize you have to inspect the value of an
>> MSR in production, without having to change into a new Xen first that
>> handles the MSR.
>=20
> Yet on a non-pinned Dom0 you'd still be lost. Since iirc we generally
> advise against pinning,

You can temporarily pin while debugging the issue (e.g. pin just 1 CPU =
from Dom0, and "walk" all your physical CPUs with it if you have to,
so that you query them all), e.g. with 'xl vcpu-pin'.
Although that is more invasive than reading a value.
=20
Or alternatively have another (privileged) interface to read the MSR for =
a given core without exposing it to any guests, that way you don't =
affect the running system at all
(which would be preferable in a production environment), i.e. a Xen =
equivalent of 'rdmsr'.

> I wonder of how much use such a change would be,
> when it effectively undoes what we deliberately did a while ago.
>=20
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -1933,6 +1933,9 @@ static int cf_check svm_msr_read_intercept(
>>         break;
>>=20
>>     default:
>> +        if ( is_hwdom_pinned_vcpu(v) && !rdmsr_safe(msr, =
*msr_content) )
>> +            break;
>> +
>>         if ( d->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
>>         {
>>             *msr_content =3D 0;
>=20
> If we went as far as undoing some of what was done, I'd then wonder
> whether instead we should mandate relaxed mode to be enabled on such a
> Dom0. Then, instead of returning fake 0 here, the actual value could
> be returned in the specific case of (pinned?) Dom0.


Can relaxed mode be enabled at runtime? I'd be happy with either =
solution, but it should be something that can be enabled at runtime
(if you have to reboot Xen then you may lose the bug repro that you want =
to gather more information on).
Although changing such a setting in a production environment may still =
be risky, because the guest will then become very confused that it has =
previously read some 0s, now there are some real values, and later when =
you flip the switch off it gets 0s again.

Best regards,
--Edwin=

