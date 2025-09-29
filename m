Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC634BA9C88
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 17:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132949.1471154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3FhX-0004vC-FP; Mon, 29 Sep 2025 15:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132949.1471154; Mon, 29 Sep 2025 15:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3FhX-0004t4-CS; Mon, 29 Sep 2025 15:22:07 +0000
Received: by outflank-mailman (input) for mailman id 1132949;
 Mon, 29 Sep 2025 15:22:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M4Dr=4I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v3FhV-0004sx-Hm
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 15:22:05 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d31830f-9d48-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 17:22:03 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-636255b92c9so3793803a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 08:22:03 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634c065a67csm5924635a12.36.2025.09.29.08.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 08:22:02 -0700 (PDT)
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
X-Inumbo-ID: 0d31830f-9d48-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759159323; x=1759764123; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIsCU3Cm50J/BipKlMDBnLRM+CdqhNVX1Oigv3bXu20=;
        b=krLF6ZtmydvVDnXGQy1xSef3MSyFXOTb/xRuxHd7kXjvdQyWjVkHWG74cOAt+FzE3Y
         r2NQvt/QPyLXJ7IOWXvG1hYpSVo2nBfeUNKc4R4rv2wteVnqzer0+nBBPPG+bTO/CEk4
         Mb8j4X50gx4ufQ2vzWu5t12jxEMnj5CId6wSKVUJpnzC/Pgz58/3y8kr5nIaMFpDOIjX
         25XLqP9tftn2c+wcnKLFe3wBkyhpRvWmYGvVFlcmWRPwJ8fVlApJWYwpRnCI8vU2TWmb
         0JfGDXtiDIlVKFHnDpMZXRgKu16n/wPvGj+vPMf2byrfubpDjN5WclasfGufu8ShrWKQ
         cq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759159323; x=1759764123;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eIsCU3Cm50J/BipKlMDBnLRM+CdqhNVX1Oigv3bXu20=;
        b=XHE4l9z23mP5uLGPZ2SCuPAi+xlEJHBc9y9T0nEsdjWmpG2rDe8jH1Y/VMx0SqXKad
         H69aKD5qYQk7E3Ph0WTygu0gdCVl641LXe9cQy2an5pKDbRtqQCdMHD1xSrswGeYRwHt
         bsyGcn+0c7s0lZW74Ddh/2ieD8iEq9144MV+yoGiibeq/lKnBuMsE6+e7a/gYcWb/rmO
         fFET4ED0EgHGTd3L/jJnH8tPycPtmi8XCW4PtqmSJ06eZRGzxslP8y7V2GuQC8BDCkCQ
         jihAt+b+7FX5s/R4R+at0mxIVtrtYXazvzYAwMJXs8UcnSegdbZ7mxf/Xp1pJYjrMbEG
         4nbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7JWj9Gr3z4cwJpf2ufj60mWEReAY0gZ63BqBDyUq2RIfJUOEa0YcrKf/npquBo/L7rsorZBdCNAU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzt56O1j3xUAbwQ7LGb0/nqxYI/LE4XEeCTQ7y0NhnVRno8/wpd
	IovHwX7kYePjTdUJjmjFV+392kmhT+a7DfI/W3E43rYD0fnOdcY118Ce
X-Gm-Gg: ASbGnct1SGs+uq/Hga+DTGjOVPOwpel8smiEc4eA82wS7HA9Uxsz0d9Zjt3XkLINW/6
	mUDxuvqXoF1OsgjVHSHnkWaMUYmh5ggdUfEDvQssOLnZNQds8pmluzJnsTxz5DOTaR9zGPcnqT0
	DviLPu9ww92K4HXu54qY21avz30wvDjSZkkZGGVmYtNwnGMJ/Qg5pPK1F7qPTHI5dm3ml+30Sq7
	zzi5rlkvz193gtxPlP29GCOp9QNIowqa/p/qSZtiD2jKKL6AMALmjwTSQzVKv+0+EMtajWJsGX3
	u9WaudnzK36zIW8iKsT3bla/B/iuDIq90saa77Ga372+x8gOe/leuFCJN4UApqHSPgdqX0O2z66
	LWPHV/a3rIi3BmOs7n2aup66aUB64vLM5Ey5oYb0Q4VmxCCOQYI5Ui35hS4bDFogQ/PTcZjbCJj
	oKTbAoiH8=
X-Google-Smtp-Source: AGHT+IG6YEHTN6QJe/iDwYSk7kWQfckza2LegIdjqlIack5JWjG1gk8kWPIN+xHjB2SgyXy2bpZn3g==
X-Received: by 2002:a05:6402:3491:b0:636:2ea0:df62 with SMTP id 4fb4d7f45d1cf-6362ea0e02emr5682885a12.38.1759159322594;
        Mon, 29 Sep 2025 08:22:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ekHcZDyIaLFogqAXAdNV8IOr"
Message-ID: <fdbc09a0-377a-4561-9efa-93d925e308a0@gmail.com>
Date: Mon, 29 Sep 2025 17:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] xenconsole: Add connection flag
To: Anthony PERARD <anthony@xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250822213946.245307-1-jason.andryuk@amd.com>
 <e5382a07-7044-4999-9232-07dcf677fb97@suse.com> <aNqHwGSihJfigmXC@l14>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aNqHwGSihJfigmXC@l14>

This is a multi-part message in MIME format.
--------------ekHcZDyIaLFogqAXAdNV8IOr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/29/25 3:21 PM, Anthony PERARD wrote:
> On Tue, Sep 09, 2025 at 12:18:26PM +0200, Jürgen Groß wrote:
>> On 22.08.25 23:39, Jason Andryuk wrote:
>>> Add a connection flag to the console interface page so a domain can tell
>>> if it is connected or not.  This became a series in v2 to add flag
>>> setting to libxenguest.
>>>
>>> Jason Andryuk (3):
>>>     xenconsole: Add connection flag
>>>     libs/guest: Set console page to disconnected
>>>     libs/guest: Set console as disconnected on resume
>>>
>>>    tools/console/daemon/io.c                |  4 +++
>>>    tools/include/xenguest.h                 |  4 +++
>>>    tools/libs/guest/xg_dom_arm.c            |  2 +-
>>>    tools/libs/guest/xg_dom_boot.c           | 36 ++++++++++++++++++++++++
>>>    tools/libs/guest/xg_dom_x86.c            |  6 ++--
>>>    tools/libs/guest/xg_sr_restore_x86_hvm.c |  2 +-
>>>    tools/libs/guest/xg_sr_restore_x86_pv.c  |  1 +
>>>    xen/include/public/io/console.h          | 13 +++++++++
>>>    8 files changed, 63 insertions(+), 5 deletions(-)
>>>
>> For the series:
>>
>> Reviewed-by: Juergen Gross<jgross@suse.com>
> For the series:
> Acked-by: Anthony PERARD<anthony.perard@vates.tech>
>
> Hi Oleksii,
> I think this series needs your "release-ack" tag.\

It is a little bit too late. But considering that this patch should increase
boot performance (right?) and it is pretty straightforward, I think (IIUC regarding
boot performance) we can consider these patch series to be in 4.21:
  Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

--------------ekHcZDyIaLFogqAXAdNV8IOr
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
    <div class="moz-cite-prefix">On 9/29/25 3:21 PM, Anthony PERARD
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aNqHwGSihJfigmXC@l14">
      <pre wrap="" class="moz-quote-pre">On Tue, Sep 09, 2025 at 12:18:26PM +0200, Jürgen Groß wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 22.08.25 23:39, Jason Andryuk wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Add a connection flag to the console interface page so a domain can tell
if it is connected or not.  This became a series in v2 to add flag
setting to libxenguest.

Jason Andryuk (3):
   xenconsole: Add connection flag
   libs/guest: Set console page to disconnected
   libs/guest: Set console as disconnected on resume

  tools/console/daemon/io.c                |  4 +++
  tools/include/xenguest.h                 |  4 +++
  tools/libs/guest/xg_dom_arm.c            |  2 +-
  tools/libs/guest/xg_dom_boot.c           | 36 ++++++++++++++++++++++++
  tools/libs/guest/xg_dom_x86.c            |  6 ++--
  tools/libs/guest/xg_sr_restore_x86_hvm.c |  2 +-
  tools/libs/guest/xg_sr_restore_x86_pv.c  |  1 +
  xen/include/public/io/console.h          | 13 +++++++++
  8 files changed, 63 insertions(+), 5 deletions(-)

</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
For the series:

Reviewed-by: Juergen Gross <a class="moz-txt-link-rfc2396E" href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For the series:
Acked-by: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>

Hi Oleksii,
I think this series needs your "release-ack" tag.\</pre>
    </blockquote>
    <pre>It is a little bit too late. But considering that this patch should increase
boot performance (right?) and it is pretty straightforward, I think (IIUC regarding
boot performance) we can consider these patch series to be in 4.21:
 Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii</pre>
  </body>
</html>

--------------ekHcZDyIaLFogqAXAdNV8IOr--

