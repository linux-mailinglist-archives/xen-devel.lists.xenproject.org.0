Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673F3A3D71F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 11:45:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893781.1302640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl42X-0007D7-2N; Thu, 20 Feb 2025 10:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893781.1302640; Thu, 20 Feb 2025 10:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl42W-0007Ah-Vp; Thu, 20 Feb 2025 10:44:20 +0000
Received: by outflank-mailman (input) for mailman id 893781;
 Thu, 20 Feb 2025 10:44:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tl42V-0007Aa-FR
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 10:44:19 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a21c69b0-ef77-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 11:44:17 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54622940ef7so863685e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 02:44:17 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461f0d74e6sm1355968e87.170.2025.02.20.02.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 02:44:15 -0800 (PST)
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
X-Inumbo-ID: a21c69b0-ef77-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740048257; x=1740653057; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I58aMsUsGYHh19K18Tpweh/5mdV91tSQx1fWrigxIkY=;
        b=VXCKpPdHt/2kSkUskPVke6Hd3Z01bpcd+yLWI5aHJACBGBEOxvsCUa2J0itYScNfij
         ElYmmjyUkg4mP2I7iCT7lRXoVfGVA4+pjrsVQw7pyMlZbKAX3PEI1UYxM98Lr2DB6F7h
         +RqfR/4NeO6AdF2jSQgcoG50UWhvfk2xSBRSmvpf6E8BKWtBeomtF0MMjf9WfsmAJQn8
         RKenznHTNyR3i6Xm0P4siAlbGGCP75NU1vjAqEd21qyKlwJZ815jurRtSsueZnLPHFY3
         dbUNY71FeKvx+iKpOb2B4nRgjuHSRh5iobXHrl/984bNduNG/LPdAdueZoSleP37SOr6
         Jx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740048257; x=1740653057;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I58aMsUsGYHh19K18Tpweh/5mdV91tSQx1fWrigxIkY=;
        b=eB7EB5J7ctCd6kYmL9Y+YAZLTLmVhBFN/wn9BgGwgFOUTmzteomlbbTjT9uEFp4GUj
         mdj3ORqlrFEdrXUcmzqnhhW6Bp08qpdcZgi205bBQlauarJb+VBtEtYu0MTY7XpxnxXi
         mBRcPH3KAk1pe+StjAVvn35Z9kyAwNg4nxav7SWy8IqBV/JFXh+ssWiIA7bz6McCpkO/
         QE4sn+KKLqyLl2OX9yxLYWL9S1aeLiDHGiShvgpLkD5bxoHa398V3iBZL5oPX7zulFbG
         TuJL5tn2tFNQ7gmvS1GCI3rPLpAgxkOtnZd6ASiK5iDasGsEkLWLmaX0p2qDTDTXFny8
         93ig==
X-Gm-Message-State: AOJu0YwrZ+VhSHkxQSxvQxIwEiFJKLTwWmpnsMfUcWmNL5KB74pjfnLu
	8ZhhXbeA7tfpj2A4gDwCNr7AZEYn/UsLgfE8s046qnjWSNZiqsj8
X-Gm-Gg: ASbGncs5DDr79x1E4Q/apnF3Tl/Nz+khHCp86M9ikjTeJ3j/niyHyacj4zTWwYFAMHH
	hCJnu1VcGTB5gBmlEuzv47XTbeyRWWw1d983/gnToFaWLgwh4fB7NJNpGRewXNesAJe391tREAC
	wEGjMd3IziiIbV+j3m8NBEEYJmcxdZEImct7lyb2WNsGxnISrY9wYyK+GIrzNU/JD+we59Y8jtk
	iCrt5ngD9abQPU23aCVFAnQQK5cfO1uEWF1f8r0LJ2TG4BmdSzLt9pEILHIfNFDoKF1vluP9EYT
	Zh6cmO+ChGDaCA9owMbuK6Y/
X-Google-Smtp-Source: AGHT+IEsA6CldtWAxRY8xd47P/q4bSZCszlPk/vcg0U52mZU022fj2zlDNRxF0M95dMzS7TjE458Qg==
X-Received: by 2002:a05:6512:2251:b0:545:f9c:a80f with SMTP id 2adb3069b0e04-5462eed8656mr2153269e87.1.1740048256265;
        Thu, 20 Feb 2025 02:44:16 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------vwdxhIDGsRdO20ivrxwqCOG2"
Message-ID: <bb652683-d062-4fbe-b0fc-c58358364839@gmail.com>
Date: Thu, 20 Feb 2025 11:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/list: avoid UB in list iterators
To: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>
References: <20250219141818.8789-1-jgross@suse.com>
 <20250219141818.8789-2-jgross@suse.com>
 <ec9c4937-f39f-47cb-a436-ca2250bc7679@citrix.com>
 <alpine.DEB.2.22.394.2502191736270.1791669@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2502191736270.1791669@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------vwdxhIDGsRdO20ivrxwqCOG2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/20/25 2:38 AM, Stefano Stabellini wrote:
> On Wed, 19 Feb 2025, Andrew Cooper wrote:
>> On 19/02/2025 2:18 pm, Juergen Gross wrote:
>>> The list_for_each_entry*() iterators are testing for having reached the
>>> end of the list in a way which relies on undefined behavior: the
>>> iterator (being a pointer to the struct of a list element) is advanced
>>> and only then tested to have reached not the next element, but the list
>>> head. This results in the list head being addressed via a list element
>>> pointer, which is undefined, in case the list elements have a higher
>>> alignment than the list head.
>>>
>>> Avoid that by testing for the end of the list before advancing the
>>> iterator. In case of having reached the end of the list, set the
>>> iterator to NULL and use that for stopping the loop. This has the
>>> additional advantage of not leaking the iterator pointing to something
>>> which isn't a list element past the loop.
>>>
>>> There is one case in the Xen code where the iterator is used after
>>> the loop: it is tested to be non-NULL to indicate the loop has run
>>> until reaching the end of the list. This case is modified to use the
>>> iterator being NULL for indicating the end of the list has been
>>> reached.
>>>
>>> Reported-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>> Signed-off-by: Juergen Gross<jgross@suse.com>
>>> Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> I agree there's an issue here, but as said before, I do not agree with
>> this patch.
>>
>> For starters, bloat-o-meter on a random top-of-tree build says
>>
>>      add/remove: 8/1 grow/shrink: 112/68 up/down: 4314/-2855 (1459)
>>
>> which is a horrible overhead for a case where the sequence of
>> instructions are correct (only the C level types are a problem) and ...
>>
>>> ---
>>> No proper Fixes: tag, as this bug predates Xen's git and mercurial
>>> history.
>>> V2:
>>> - fix one use case (Jan Beulich)
>>> - let list_is_first() return bool, rename parameter (Jan Beulich)
>>> - paranthesize iterator when used as non-NULL test (Jan Beulich)
>>> - avoid dereferencing NULL in the safe iterators (Jan Beulich)
>>> ---
>>>   xen/drivers/passthrough/x86/hvm.c |   3 +-
>> ... the need for this adjustment being discovered after-the-fact means
>> it's a very risky change at this juncture in the release.
> I have not reviewed the patch in enough detail to form an opinion on the
> approach yet. However, I want to note that I also don't think that this
> series should be committed at this stage of the release process. It
> would be better to wait for the 4.21 release cycle.

Based on the comments above lets consider then this patch to be merged to 4.21.

Thanks.

~ Oleksii

--------------vwdxhIDGsRdO20ivrxwqCOG2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/20/25 2:38 AM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2502191736270.1791669@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">On Wed, 19 Feb 2025, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 19/02/2025 2:18 pm, Juergen Gross wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">The list_for_each_entry*() iterators are testing for having reached the
end of the list in a way which relies on undefined behavior: the
iterator (being a pointer to the struct of a list element) is advanced
and only then tested to have reached not the next element, but the list
head. This results in the list head being addressed via a list element
pointer, which is undefined, in case the list elements have a higher
alignment than the list head.

Avoid that by testing for the end of the list before advancing the
iterator. In case of having reached the end of the list, set the
iterator to NULL and use that for stopping the loop. This has the
additional advantage of not leaking the iterator pointing to something
which isn't a list element past the loop.

There is one case in the Xen code where the iterator is used after
the loop: it is tested to be non-NULL to indicate the loop has run
until reaching the end of the list. This case is modified to use the
iterator being NULL for indicating the end of the list has been
reached.

Reported-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Signed-off-by: Juergen Gross <a class="moz-txt-link-rfc2396E" href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a>
Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I agree there's an issue here, but as said before, I do not agree with
this patch.

For starters, bloat-o-meter on a random top-of-tree build says

    add/remove: 8/1 grow/shrink: 112/68 up/down: 4314/-2855 (1459)

which is a horrible overhead for a case where the sequence of
instructions are correct (only the C level types are a problem) and ...

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">---
No proper Fixes: tag, as this bug predates Xen's git and mercurial
history.
V2:
- fix one use case (Jan Beulich)
- let list_is_first() return bool, rename parameter (Jan Beulich)
- paranthesize iterator when used as non-NULL test (Jan Beulich)
- avoid dereferencing NULL in the safe iterators (Jan Beulich)
---
 xen/drivers/passthrough/x86/hvm.c |   3 +-
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
... the need for this adjustment being discovered after-the-fact means
it's a very risky change at this juncture in the release.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I have not reviewed the patch in enough detail to form an opinion on the
approach yet. However, I want to note that I also don't think that this
series should be committed at this stage of the release process. It
would be better to wait for the 4.21 release cycle.</pre>
    </blockquote>
    <pre>Based on the comments above lets consider then this patch to be merged to 4.21.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------vwdxhIDGsRdO20ivrxwqCOG2--

