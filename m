Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC0EB201E3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 10:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077088.1438178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNxZ-0003qa-E7; Mon, 11 Aug 2025 08:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077088.1438178; Mon, 11 Aug 2025 08:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNxZ-0003p9-BM; Mon, 11 Aug 2025 08:32:49 +0000
Received: by outflank-mailman (input) for mailman id 1077088;
 Mon, 11 Aug 2025 08:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOyo=2X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ulNxY-0003oy-1T
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 08:32:48 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf53877b-768d-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 10:32:42 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-af96fba3b37so765938166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 01:32:42 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8efffa5sm17835287a12.12.2025.08.11.01.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 01:32:41 -0700 (PDT)
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
X-Inumbo-ID: bf53877b-768d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754901162; x=1755505962; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqB1qKOkqrm1zXo8p4CdwqDni3YZEqsSA0MOPs6/vz8=;
        b=VxVZSWmflR6SxNNjRJaoAVuGout0/Mt3y7ohiwoMIujYYNxVCKTzKvW6ps57K01xh9
         AfnM8kaWrks7knkZzAUvl5XY2hfBW7nbEYX6/ulvxsR9K6bgGY4scUcFx1P3L2htyJhT
         OmL7egbiei81uRJZbnZtIm1N/VuZ7SyGKeT0+YYT/C4MQgJze3Egbc+R4MQkbkFv+WIi
         Y2Cnlg17DS8CArkNYqNelSPDPKuKUqmDsNgTIBcJBxcu1KErKjrpDA4oNeyWj3YgH2mc
         LFCc/jeTAqsfFhJNfThckskWD0fN+4U9M5/U+RNQfvA2S4zs/3loy/QtKZ5E2HngbmTB
         377g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754901162; x=1755505962;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KqB1qKOkqrm1zXo8p4CdwqDni3YZEqsSA0MOPs6/vz8=;
        b=fzIgrdEFKaCQWNYbzVrhdyovcvVE5dsPNsavbeY/SgdviCunmw0lbT4Q1YLOCmqB6a
         CHYr4CnLMVybmOgpSUrn7o/sa7FGUvBJIovM8N4Q9VIWj+jL4sym+t+jcRbqmyjysUbV
         aRgOW8uu2un08yGqj+90pvbL3XzqMqXrPXAoFAkk2MUkulRuA3OK+lqqsupRwKh2fWoB
         ABYGLi29HSz1L8dnbZqXKTBo/oefOa4uVKkrYssK45k9gAs3rN8zzrVCzAap2AGNkrrC
         uMo6V60hcd3jdu7anbX+BJTDPDarU8DopbnzYhQmwUdT40bOLSrs1Jc/LNc4DqhLaVI2
         vYIg==
X-Forwarded-Encrypted: i=1; AJvYcCU1LlCbiWmxyBqULeYLAaQRbF+N+Pzut/VH1oivZB92ZyjOzFVf7vSHb67vFLZlfkh5jyro5nXa2J0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxcg7cvLrjgPXT0XrJ65AFnJkKbmfGKEsSVGJnM7ab4lk3Lnt8H
	6TYcmbC2WPCcs28RdR+yCkgfWfc0QqlD3JbwPlXa1BSQZAnV5mHF6a2h
X-Gm-Gg: ASbGnctT6P/HifCcuvPxulS+37RHZzT2AgBN1vHltOfV6Im38AMqJKbbwIm2opTQiU2
	ChRp5+yU3Opbael6SRakQ+m9n31Q5qMjavXq0JNvIQZFBED7eluHbXyT1leEI4tTXoRZP5S+uVN
	+zcN16rTKplvK5O9otkz37vyMARYCVQeij7OPW0z/LJipQ7n3lWJ9Jttw8LywB7t/ctmksT4820
	6jFBYTUp2SQP0bAldSZPxHorMpelgWmMNP1IhpF5KT9G5EyKF89Ai9IoE/09sMbDFFCOLypiWn9
	dnPCdlmpTb11XyVa2ykD1qJmJquelgwnFW8IZ52K+H7qf5d8QW/4tCl+MaNeVBaEfWOmrMoP7dj
	gMyxdr0qzkMkAwdiDoObpufwt17rAYUYmsXr1KppuE+C4TSA58l+Wz83CjEbmx40LcRLAlL0=
X-Google-Smtp-Source: AGHT+IEHZudf7zr9VtjzqSHQzU4oOpnmsLv1Dp0ScodEo5yxjSsFO4x7tSJsDptn+yA9l42bA76XvA==
X-Received: by 2002:a17:907:7fac:b0:ae0:d019:dac7 with SMTP id a640c23a62f3a-af9c636eaa2mr1126136166b.23.1754901161321;
        Mon, 11 Aug 2025 01:32:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------q2ZztWGWwEFsyTyk9ZlGEKqq"
Message-ID: <043a8643-ca4f-4102-a6ad-5eaf948f6459@gmail.com>
Date: Mon, 11 Aug 2025 10:32:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 0/5] CI: Add Debian Trixie
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Victor Lira <victorm.lira@amd.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250809221206.1260861-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------q2ZztWGWwEFsyTyk9ZlGEKqq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/10/25 12:12 AM, Andrew Cooper wrote:
> I know it's past the last-post deadline, but Trixie was only released today.

Lets consider it for 4.21:
  Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> In terms of backports, we should at least go back to the bugfix branches.
>
> Andrew Cooper (5):
>    CI: Trixie containers
>    CI: Update ppc64 to use Debian Trixie
>    CI: Update riscv64 to use Debian Trixie
>    stubdom: Fix -Wimplicit-int in newlib
>    CI: Update x86 to use Debian Trixie
>
>   automation/build/debian/13-ppc64le.dockerfile | 37 ++++++++
>   automation/build/debian/13-riscv64.dockerfile | 37 ++++++++
>   automation/build/debian/13-x86_32.dockerfile  | 51 ++++++++++
>   automation/build/debian/13-x86_64.dockerfile  | 74 +++++++++++++++
>   automation/gitlab-ci/build.yaml               | 94 +++++++++++++++----
>   automation/gitlab-ci/test.yaml                | 14 +--
>   stubdom/Makefile                              |  1 +
>   stubdom/newlib-fix-etext.patch                | 23 +++++
>   8 files changed, 306 insertions(+), 25 deletions(-)
>   create mode 100644 automation/build/debian/13-ppc64le.dockerfile
>   create mode 100644 automation/build/debian/13-riscv64.dockerfile
>   create mode 100644 automation/build/debian/13-x86_32.dockerfile
>   create mode 100644 automation/build/debian/13-x86_64.dockerfile
>   create mode 100644 stubdom/newlib-fix-etext.patch
>
--------------q2ZztWGWwEFsyTyk9ZlGEKqq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/10/25 12:12 AM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250809221206.1260861-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">I know it's past the last-post deadline, but Trixie was only released today.</pre>
    </blockquote>
    <pre>Lets consider it for 4.21:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250809221206.1260861-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

In terms of backports, we should at least go back to the bugfix branches.

Andrew Cooper (5):
  CI: Trixie containers
  CI: Update ppc64 to use Debian Trixie
  CI: Update riscv64 to use Debian Trixie
  stubdom: Fix -Wimplicit-int in newlib
  CI: Update x86 to use Debian Trixie

 automation/build/debian/13-ppc64le.dockerfile | 37 ++++++++
 automation/build/debian/13-riscv64.dockerfile | 37 ++++++++
 automation/build/debian/13-x86_32.dockerfile  | 51 ++++++++++
 automation/build/debian/13-x86_64.dockerfile  | 74 +++++++++++++++
 automation/gitlab-ci/build.yaml               | 94 +++++++++++++++----
 automation/gitlab-ci/test.yaml                | 14 +--
 stubdom/Makefile                              |  1 +
 stubdom/newlib-fix-etext.patch                | 23 +++++
 8 files changed, 306 insertions(+), 25 deletions(-)
 create mode 100644 automation/build/debian/13-ppc64le.dockerfile
 create mode 100644 automation/build/debian/13-riscv64.dockerfile
 create mode 100644 automation/build/debian/13-x86_32.dockerfile
 create mode 100644 automation/build/debian/13-x86_64.dockerfile
 create mode 100644 stubdom/newlib-fix-etext.patch

</pre>
    </blockquote>
  </body>
</html>

--------------q2ZztWGWwEFsyTyk9ZlGEKqq--

