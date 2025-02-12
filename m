Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7B1A32573
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 12:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886394.1296058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiBK1-0003yg-E1; Wed, 12 Feb 2025 11:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886394.1296058; Wed, 12 Feb 2025 11:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiBK1-0003wJ-Au; Wed, 12 Feb 2025 11:54:29 +0000
Received: by outflank-mailman (input) for mailman id 886394;
 Wed, 12 Feb 2025 11:54:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r9o/=VD=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1tiBK0-0003wD-4N
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 11:54:28 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c0cf90a-e938-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 12:54:27 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab7cb1154abso386638066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 03:54:27 -0800 (PST)
Received: from smtpclient.apple ([217.155.175.161])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7d9601161sm357368766b.183.2025.02.12.03.54.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:54:26 -0800 (PST)
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
X-Inumbo-ID: 1c0cf90a-e938-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739361266; x=1739966066; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZxZ+luaSKxTZWj3oHWYAhNexkiUh6j9g8peGDMJr80=;
        b=Rl2lWJPWZN/eUC1nOXORHzIE4GG51gDOEJsSSYtCN9ZsIsNEPUAkiD/DVDkKtPWOH9
         DsNGokKy2xC/WPcxkQwkPf1IFOYk1gdU4aRoIePoYCQYxuM6Fncze3Y7biw9P7sy2s/R
         AyZIoPyTWmhD5fUo7VVdaePE1T7BjXluC90QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739361266; x=1739966066;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZxZ+luaSKxTZWj3oHWYAhNexkiUh6j9g8peGDMJr80=;
        b=geVhuHzTq2375rxoVH+XAPHLuQd8iZr6mNaE5CLEQd/yAbyGuqA99NmBIzDt11NT1I
         Pm+lxxXyO3ejeS+EmuJ4A5IkSrY1Fxqaxb7eiUvuQi4I9YH9Y+vlZKprgIgPC7jNnN3a
         X5grFW2BNOBF1WEmXwqNcsfDAQ2q18F/LkkcLbfH1DeDWE8HN5+RGYvBzYt4BeR3hOU/
         3769isiEWiCJ/eU7kJL6sgiSbLIJG3FN2ri2CvdgyPMMosw7kHr75//9PYKnx91PMdpT
         Du4iBwLfwVSMT/XOxabEWy8kAtXgEKSJeNtcyol1sGBnZdhBmp7rtJujyYThOkCyez99
         o1iA==
X-Forwarded-Encrypted: i=1; AJvYcCUG75D0/svk+wdmYWcKqv7kxiNjTC9iNm1sp3dzNc9ttkddsUR71gzyipkqS7zmBZVPKw+/SHMuof0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzE3AlEMDRsIYNOpkKwU8NLwJVHFVdaiVpXIRi+npmesDfz0PrN
	09zmU5PPnWwDYBdhzWtEhhJpS2cJGWtVrxUtl9tcsGFwVAa3gNEhSDz9h18CoVQ=
X-Gm-Gg: ASbGncut7k5UqOdDvQlgRPeV1T5cZEiXiO86htXTzkOVAWUc/mfAzpxrn0Uph/J7+Np
	mtFtDCzzRds8My7oH/i/lxFl/69tFZ4xPKIsTq4ADb+NEiBY/SqjZ7T6UwdqQmjRnPArRvE6+bY
	3diN+7KgYLBnKYVOHXwC7WWNdufPqNwyul/ggQ67wZIwKqS8P1mcaJrkjJhndxrN/0bpi9vzKHV
	T2cGqS5q58vulTgHfgsveXI7bECGkoO2VWbVzL2YPhoJ23mLqE/BpnOXsaeQMmJG20GAtI4x1gt
	JHohi9ZoLR5MEsl9TTAcVYRArmtCWyX0HkH+
X-Google-Smtp-Source: AGHT+IHhs5qz6manLw+O3E4ijtWUesBdST/iNxeMvCRIlwBJaZh7IYMrGZz7/UsY8f2c4iRkfYNusg==
X-Received: by 2002:a05:6402:13cc:b0:5dc:caab:9447 with SMTP id 4fb4d7f45d1cf-5deadd9d336mr7204325a12.18.1739361266489;
        Wed, 12 Feb 2025 03:54:26 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: Coding Style Review and Automation
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <Z6uc_eN-LLmgOmxJ@mail-itl>
Date: Wed, 12 Feb 2025 11:54:13 +0000
Cc: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C958B4D5-BCD0-4534-A9F8-E4B06ED7B258@cloud.com>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <Z6sR87FrKcOhgEqX@macbook.local>
 <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com>
 <55c4d9e0-77b2-408b-9bb1-8efed95891c1@suse.com>
 <Z6tZUKiqYARWuk8N@macbook.local> <Z6uc_eN-LLmgOmxJ@mail-itl>
To: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

On 11 Feb 2025, at 18:54, Marek Marczykowski-G=C3=B3recki =
<marmarek@invisiblethingslab.com> wrote:
>=20
> On Tue, Feb 11, 2025 at 03:06:08PM +0100, Roger Pau Monn=C3=A9 wrote:
>> On Tue, Feb 11, 2025 at 11:19:23AM +0100, Jan Beulich wrote:
>>> On 11.02.2025 10:10, Luca Fancellu wrote:
>>>>>> 3) The size of the patch after applying clang-format is huge. =
Really. Something
>>>>>> like 9 MB. Even if everyone agrees that the approach is good and =
we can proceed
>>>>>> with it, it is highly unlikely anyone will be able to review it. =
Considering
>>>>>> that new patches are being added to the upstream during such a =
review, it may
>>>>>> also lead to new code style violations or require a new review of =
that huge
>>>>>> patch.
>>>>>=20
>>>>> I think this approach is difficult.  It would likely introduce a =
lot
>>>>> of noise when using `git blame` (I know, it's just one extra jump,
>>>>> but...), plus would likely break every patch that we currently =
have
>>>>> in-flight.
>>>>=20
>>>> I think we already discussed this in the past and having some churn =
was accepted,
>>>> also about breaking existing patches, every change merged has the =
potential to do
>>>> that, this one is more likely but it=E2=80=99s the game I guess?
>>>=20
>>> That's easy to say if you have just a few patches in flight, yet I'm =
worried
>>> about this when considering the hundreds of mine that are awaiting =
review.
>>=20
>> There are also downstreams (including distros) with varying length of
>> patch queues on top of Xen.  Arguably they have to rebase the queue
>> every time they update, but a wide change in coding style will likely
>> be fairly disruptive to them.
>>=20
>> Don't take this as a reason to reject clang-format.  As mentioned
>> elsewhere I think the format supported by clang-format would need to
>> be fairly similar to the current Xen one (up to the point that chunks
>> of code using the new and the old style could live together).  Then =
we
>> would enforce it only for newly added chunks of code initially IMO.
>=20
> While clang-format surely will force some changes (the earlier 9MB =
patch
> is a data point here...)

Here is an example of how reformatting the OCaml C stubs would look like =
based on an earlier attempt:
=
https://github.com/edwintorok/xen/commit/7ad754fcfb490954f7f01f788893f5c4b=
77fdc9a
=
https://github.com/edwintorok/xen/commit/41155c78cc95fd66fe2ed0d1634b0e59f=
cc3a3b2

In this case switching those files to Linux coding style results in a =
smaller diff, and might help reduce that 9MB a little bit.
Those files didn=E2=80=99t follow either the Xen or Linux coding style =
previously, seems to have been a mix of styles,
which is very confusing because it is not documented anywhere what style =
they are supposed to be, so everyone is left guessing as to
how to best preserve the style of existing code.


> , I generally expect it should match fairly
> close to the current code style, and so the rebase shouldn't be _that_
> painful. In some cases git likely will handle large part of the work
> already.


There are a few tools that might help with this.

This would reformat only diffs/commits:
=
https://github.com/llvm/llvm-project/blob/main/clang/tools/clang-format/gi=
t-clang-format

These are git merge drivers for clang-format that can help automatically =
solve most conflicts that a patch rebase would create:
=
https://github.com/llvm/llvm-project/blob/c174cc48401292e2eb9317128f56fd22=
af2f4848/libcxx/utils/clang-format-merge-driver.sh#L4
https://github.com/emilio/clang-format-merge
As you can see the implementation is very simple: you use clang-format =
on all 3 sides during a conflict, and then attempt to merge again. If =
that has solved the conflict there is nothing more to do, if it hasn=E2=80=
=99t you get the usual conflict markers to solve it, but this time on =
the reformatted code.

If you are looking for something more automated to handle your =
work-in-progress patches, then there are 2 other tools that can help:

Jujutsu=E2=80=99s =E2=80=98fix=E2=80=99 command which goes through all =
(or subset) of your local and mutable commits (not part of upstream =
repo) and reformats each change individually (which is useful if your =
base is already well-formatted, and you=E2=80=99ve made a lot of changes =
to split/reorder/rebase your patches and didn=E2=80=99t use clang-format =
during development): https://jj-vcs.github.io/jj/latest/
(JJ can be used in =E2=80=98git=E2=80=99 colocation/compatibility mode, =
and I=E2=80=99ve actually switched to using it on a daily basis, because =
it enables a mega-merge workflow, where you can create a merge commit of =
all your in-flight branches that gets automatically rebased whenever one =
of your branches gets rebased, and with jj=E2=80=99s way of deferring =
conflict resolution you don=E2=80=99t even need to immediately fix the =
conflicts, which is very useful for =E2=80=9Cparallelising=E2=80=9D =
patches, i.e. splitting out commits that are independent.
And =E2=80=98jj fix=E2=80=99 can keep up with formatting changes during =
that workflow too)

If JJ isn=E2=80=99t your cup of tea, then there are other tools that can =
help too, e.g. =E2=80=98git-branchless=E2=80=99 has a =E2=80=98git test =
run=E2=80=99 command that can be used to run a formatter on all commits, =
see https://github.com/arxanas/git-branchless/discussions/803 (using =
=E2=80=98rustfmt=E2=80=99 as an example, but it should work in similarly =
with =E2=80=98clang-format=E2=80=99)

Also if you are worried about git blame then you can create a list of =
commits to ignore that were due to formatting, here is an example of how =
that looked like in the XAPI project:
=
https://github.com/xapi-project/xen-api/blob/master/.git-blame-ignore-revs=


We went through a similar process in the XAPI project when we introduced =
`ocamlformat`, and had similar concerns over back-portability / =
in-flight work / etc.
But at least for me the equivalent to the above tools for =
=E2=80=98ocamlformat=E2=80=99 made it a fairly smooth process =
(https://ocaml.org/p/merge-fmt/0.3), and even if the coding style may =
not suit everyone=E2=80=99s tastes, it is at least *consistent*,
 which is more important than what the coding style actually is (e.g. it =
prevents many mistakes where incorrect indentation or understanding of =
precedence leads to incorrect code that looks deceptively correct, but =
when run through the formatter the bug is immediately obvious)
It also allows the reviews to focus on the contents of the change, =
rather than nitpicking on style.

Reviewing the initial changes can indeed be difficult, but if the patch =
submitter specifies the exact version and command they used to create =
the re-formatting commit in the commit message itself, then reviewers =
can rerun that command on the parent commit,
and verify that they get the same (or equivalent) outcome.
(This requires the tool to be deterministic of course and always produce =
the same output given the same inputs).



Best regards,
=E2=80=94Edwin

>=20
> It surely is a cost of introducing such a change, but IMO it's a cost
> worth paying.
>=20
> --=20
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab


