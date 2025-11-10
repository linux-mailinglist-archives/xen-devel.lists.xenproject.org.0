Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FE5C48107
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 17:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158595.1486926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUzd-00086Q-S1; Mon, 10 Nov 2025 16:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158595.1486926; Mon, 10 Nov 2025 16:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUzd-000847-PP; Mon, 10 Nov 2025 16:43:49 +0000
Received: by outflank-mailman (input) for mailman id 1158595;
 Mon, 10 Nov 2025 16:43:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpW6=5S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vIUzc-000841-Mk
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 16:43:48 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d6a3fc3-be54-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 17:43:47 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b72b495aa81so365533866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 08:43:47 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9be184sm1115880066b.56.2025.11.10.08.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 08:43:45 -0800 (PST)
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
X-Inumbo-ID: 6d6a3fc3-be54-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762793027; x=1763397827; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRniwjdc0UfaBLxkygqufg0mM1L6TlFxiMGSTb/bxmQ=;
        b=khVyWxdarrSTnD8hNziHPF/vot/mrjbKzJOSqSdxdDoYbf2GwDzdA9Z9j8WULvLy1E
         aOKsXgdbdBjH38MV0e8dsaWLqzUazV7SHKVaEYqZoqdTr56TMzetjoQtOZrsqvMfxZPB
         vDRCm8UGTGbEcs7AL5NFFdHHhGGC/6+KiLKh5fNJWAvxxhIgQXEXFVKtxGlkD7kowSdx
         boMrgCaVdaicNevaluuEKx8pm+PX8YuMSXmb/Qfo2tjslIoERAY9scGYvloa82R+rPS4
         hFsXzVV21SURqrDuYi6WL+v1EPZMuHHoKP8MrAe5KsaOkRMJ3DBmSAjrxpc8dKKKfzmQ
         rsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762793027; x=1763397827;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zRniwjdc0UfaBLxkygqufg0mM1L6TlFxiMGSTb/bxmQ=;
        b=dkWzMYKiOOMzb2h3I+7ngPT6y8CdUuPIl7mhC5EPRGASv65V2EAhpHmV7sFpVPWYqj
         17LnUwXOChVAxBWGlVdCmDZ46lNKOsHYpi/iImzZJuwkzQk/zlHT/HeFL+pyvXdhAsqM
         TspcCmR/TVgRnylKKxFEmDCtqBvAtGzgYVAzNaQndoP3dOwmcVMV19z0aLC9JQISQB8G
         +K8PG7NgBz3oHRqoMa3EbaqxGL3AKMcG0bzLMM3mI86VoLep6QE/BG6bvztRPwDBjbp1
         Uc64+vwl8txovTzlGI3hOxegJPI0lwDSYhjdUnAxE1olpKT2kwEubNCLB06Rp/52cWDK
         Bhbg==
X-Forwarded-Encrypted: i=1; AJvYcCXKrEJTMzlPnuRvzTW8LWoX2zaa4Gku1v0tVlrIyxYDkDIjq7muPSRAbcbUgdkTLMyaNYRyHfnSCC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLVpa7LS1rhny9Aa6/YtC67cP9NbjEXU2xqFNh2GefaG9HB2Ie
	n68yUXkyM1FkxhQA5iQsPSvs7Dnuy3DaYo4g/EDDiiq7OgFpZSkAV7Kb
X-Gm-Gg: ASbGnctnSM3qI/e1vSlACOWDFjcr/92PuPSrN6JP8ZfA95YR2jhC2v7u4hCZfzQAiNn
	2FKrY11Fa9s2fBnh+kDaBySeZsj3TxmstyvphgVQGVb3/gY0sVAtOqaRDEIGoeiKpFX0Kn/rxTT
	jP5GefUacpBxqmimwi0FDLBwo1wQEOZ+qFan9DlpyuLTtFFrnD5/CZP5eEY4wU55KjJv+DVWNEI
	f7ancZ9jY0YHhS3au+MXuNOwsOt9Tn5wuED4mswqQU5+bedowxvmIH7kLMZ3aO6e5NcyYbGBQq9
	HCFBqCLl424E+9fkn/YlE58hZy5d9kNUy7PPJCF6YfDSGBe9/QqxsL3vG3Utuy+x4V6eXL70VTt
	mmNCos5KRxU+uvf6/YZvpMIBUkjY6fRULFmhNlmLzijBkaLh9P99EUFcKVtHn4tWDr79N1fhnrF
	gJJ5dNPz0KuN2jNnmRKJV+KAZ/mmtWa0cC/OJkfu0d/o6s46/xEVnXwN6Fg34BcozQgAREkHU=
X-Google-Smtp-Source: AGHT+IE+Y1GCJ2WQX77Q3XWTOtt/Lgqy6/kagF35saYNe7k1ssyiOZQ+raISJLiuZ9b2DCVV4jigeA==
X-Received: by 2002:a17:907:3f97:b0:b70:f2c4:bdf2 with SMTP id a640c23a62f3a-b72e02dc592mr827710566b.23.1762793026141;
        Mon, 10 Nov 2025 08:43:46 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------D0bQwLXqUnPjcg6bY6Yul0lb"
Message-ID: <0b90e356-6d70-4a50-a426-d3919be019ec@gmail.com>
Date: Mon, 10 Nov 2025 17:43:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] CHANGELOG.md: Update for 4.21 release cycle
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Cc: Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
References: <1930832802df980a6fe610233265bc238fcfaca4.1758901622.git.oleksii.kurochko@gmail.com>
 <60d1d66e-83cd-47b5-9b94-0325f411ca72@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <60d1d66e-83cd-47b5-9b94-0325f411ca72@citrix.com>

This is a multi-part message in MIME format.
--------------D0bQwLXqUnPjcg6bY6Yul0lb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/10/25 5:29 PM, Andrew Cooper wrote:
> On 26/09/2025 4:47 pm, Oleksii Kurochko wrote:
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Chnages in v2:
>> - Drop the following items:
>>    - Allow to unflatten DTs.
>>    - Basic kexec support to Mini-OS for running in PVH mode.
>> ---
>>   CHANGELOG.md | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index ca1b43b940..0afd2eeb4b 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>    - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
>>      to the baseline change.
>>    - Linux based device model stubdomains are now fully supported.
>> + - Remove libxenctrl usage from xenstored.
> This is about libxenmange.  I think it wants to say:
>
> - Introduce libxenmanage as a stable library, replacing xenstored's
> dependency on unstable libraries.

>
> Otherwise, LGTM.

It is much better, I’ll be glad if this update can be done during the commit.

Thanks!

~ Oleksii


--------------D0bQwLXqUnPjcg6bY6Yul0lb
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
    <div class="moz-cite-prefix">On 11/10/25 5:29 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:60d1d66e-83cd-47b5-9b94-0325f411ca72@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 26/09/2025 4:47 pm, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Chnages in v2:
- Drop the following items:
  - Allow to unflatten DTs.
  - Basic kexec support to Mini-OS for running in PVH mode.
---
 CHANGELOG.md | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ca1b43b940..0afd2eeb4b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
  - Debian Trixie added to CI.  Debian Bullseye retired from CI for RISC-V due
    to the baseline change.
  - Linux based device model stubdomains are now fully supported.
+ - Remove libxenctrl usage from xenstored.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is about libxenmange.  I think it wants to say:

- Introduce libxenmanage as a stable library, replacing xenstored's
dependency on unstable libraries. </pre>
    </blockquote>
    <p></p>
    <blockquote type="cite"
      cite="mid:60d1d66e-83cd-47b5-9b94-0325f411ca72@citrix.com">
      <pre wrap="" class="moz-quote-pre">

Otherwise, LGTM.</pre>
    </blockquote>
    <pre>It is much better, I’ll be glad if this update can be done during the commit.

Thanks!</pre>
    <pre>~ Oleksii</pre>
    <br>
  </body>
</html>

--------------D0bQwLXqUnPjcg6bY6Yul0lb--

