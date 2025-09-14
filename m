Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9550AB56AB4
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 19:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123957.1466602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxq4X-0002PD-7o; Sun, 14 Sep 2025 16:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123957.1466602; Sun, 14 Sep 2025 16:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxq4X-0002N7-25; Sun, 14 Sep 2025 16:59:29 +0000
Received: by outflank-mailman (input) for mailman id 1123957;
 Sun, 14 Sep 2025 16:59:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLjW=3Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uxq4V-0002N1-FL
 for xen-devel@lists.xenproject.org; Sun, 14 Sep 2025 16:59:27 +0000
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b2009d7-918c-11f0-9d13-b5c5bf9af7f9;
 Sun, 14 Sep 2025 18:59:26 +0200 (CEST)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-777ea9fa8fdso196224b3a.0
 for <xen-devel@lists.xenproject.org>; Sun, 14 Sep 2025 09:59:26 -0700 (PDT)
Received: from ?IPV6:2601:646:9e00:b920::2bf4? ([2601:646:9e00:b920::2bf4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-776ad32de79sm3968603b3a.63.2025.09.14.09.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Sep 2025 09:59:23 -0700 (PDT)
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
X-Inumbo-ID: 2b2009d7-918c-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757869165; x=1758473965; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAqmMOu1BH7n12vnVRqeSfPqzwKV3ZVtFtGYBvTCHQ4=;
        b=IIcbR3jmUUjjsZB4pSLnFusIshReAd4o5jJIWIS0uRnKE4Ivo2/OHeEq7AWF3Og2B9
         Hc6vKQoKUtobs7QF1p0rgFWOfO3dD7nrC/BXd/oAmMzETy2VoJVvGTacHDOZtZqVt3aD
         s1VQgoNH7hFCw/48/9feMSvGq+MWE4H70rAiMyEE5svgxsRUfzYp2trEJDbFofWg2cbr
         XakOLL8K4CXQleGtOkViHBO5VAw7AIfUFRFS8jMjr9Vd61aefbvMm2EmQCJV/Kgwi2Nr
         UxpRXvYT2npiFXYDzsowUVNM7EwPAd8iQrO7cbtcX2kKFrOaw5xeYRjElrG9s0AwG/GK
         +Log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757869165; x=1758473965;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MAqmMOu1BH7n12vnVRqeSfPqzwKV3ZVtFtGYBvTCHQ4=;
        b=AR0/Fbm5f1DZO9Ngw7odTb+nvn6heU92OuVZSwGjQTU/z40f0LkUtw/P7kjcgH7+eS
         oshfAQilqKdMRTjlgvoFkuD4pXxz/S6a5ladMMkPYCO3Ml92+qsnINAvZZ4dR8GmZdeB
         yLQrr0pLc2D3NUGiSli00qK0z489BVuqObVwMFShEXJwKTzBbU8Gk8q7LVLVY6JBOFJO
         HqIBZRXzRBSFr2Z/lHsy8OKiI4jEMPq1xkM3PLsLQqwFxZ8yAEkkwPXe3DdkdKi9rsR6
         iNQGJ+GdCNvSwQMJK4sAw9ADJqCuYaANKy18m+R015NcoRDdVSFT38okeWoMWeeed8ef
         AIjA==
X-Forwarded-Encrypted: i=1; AJvYcCUzcMa7eqVB8sV/YI7Hrc3QnrG1WiuSpHUDamb4g+f8zZG4JFG/jDhoCVTLfNNeg/xSJwk1VIQXSxk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywq7IQOvbGQl1N7CYTh47fCND33LJeL2Ou55SL3v0OEkXe1eezT
	YBexnV/EL1Qs8+oxQ+D4vO4Vla6YnybYHlucLYrbLSXbLTL+2nggYUf7
X-Gm-Gg: ASbGnctYmnGsp7keVElh1G9e9jUuB0TcSM/h195OH8JBlawz8YBejbDabCtP0VIw70F
	mh0gArXIa7bX4+wifYXZC3z3grd7twEII12LnyzU1DaXQ/eiGROw8GvOaiz6ZIqMpTfqvnQbrYk
	qh/dXwwBp3RYYUUTJ9AxK4AipCCXiDI4CBxDHpzucrFhHEvy+x/3Tm/0uzUgQuM4xRu5QQHEMQz
	GSNRd4QH46slzjdd3CTrwqVw7H2XN43fbpcdyYwEw9QdVy53zeRkJC0SL8Pmqj/bYUknrKf5PS4
	PzTznUlYDeWRjQ2tOholuRvc3LW3emGVLTJ3UFI4RlhYG9qKtrqA0sVqkUTFOf7WAmyCG1iQxRm
	fWam91+/ML+niNg9XDizHWdLswjrRszoPp4TLcWWKID6MZ80fHoxNCg==
X-Google-Smtp-Source: AGHT+IHxEbB31XLUPk/YbhKXYG4jGeWF3F80cfkz+/PVRvEfldxizqTDfSEE66o5/XsxftmralkRqQ==
X-Received: by 2002:a05:6a00:7583:b0:772:348b:8883 with SMTP id d2e1a72fcca58-7760332ba31mr11782190b3a.13.1757869164634;
        Sun, 14 Sep 2025 09:59:24 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ytewXNeJqlkI5UHe9sSa9p4A"
Message-ID: <7c017dec-91e6-4637-842e-8210ae8022d7@gmail.com>
Date: Sun, 14 Sep 2025 18:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] releases: use newer compression methods for tarballs
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a9b52101-c332-4791-8034-2d3043f82356@suse.com>
 <53d760ad-c58d-4d3f-bd66-598b4a95a8ff@xen.org>
 <b031118e-8949-4c8a-8894-f70b89ae2b5a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b031118e-8949-4c8a-8894-f70b89ae2b5a@suse.com>

This is a multi-part message in MIME format.
--------------ytewXNeJqlkI5UHe9sSa9p4A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/25 3:43 PM, Jan Beulich wrote:
> On 12.09.2025 23:23, Julien Grall wrote:
>> On 11/09/2025 09:14, Jan Beulich wrote:
>>> Other projects have long switched to xz and/or lzip.
>>>
>>> Tidy things some as well: With the removal of qemu from the tarball,
>>> intermediately extracting the tarball again has become wasteful. Drop
>>> that. Invoke compressors using asynchronous lists, to reduce overall
>>> latency. Drop the -v option from the (previously implicit) gzip
>>> invocation.
>>>
>>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>> I have tested manually the steps and the correct tarballs have been
>> produced. I will update my scripts to copy & sign all the tarballs once
>> this is merged.
>>
>> Acked-by: Julien Grall<jgrall@amazon.com>
>> Tested-by: Julien Grall<jgrall@amazon.com>
> Thanks.
>
>> Is this intended for Xen 4.21?

IMO, it would be nice to have that in Xen 4.21.

> So far it was, but I'm increasingly unsure, seeing that it still hasn't
> gone in. Cc-ing Oleksii too now. Andrew had voiced concern towards the
> rm use, but hasn't come back as to his argument towards the uncompressed
> tarball previously not having been removed (when I can't see that one
> would have been created in the first place), hence why I couldn't make
> use of his (conditional) R-b.

There is not too much sense in the uncompressed tarball. I prefer to not
generate it at all.

Also I have regarding .gz. If other projects switched to xz and/or
lzip (as it is mentioned in the commit message) what is the purpose of
having .gz tarball then?

~ Oleksii

--------------ytewXNeJqlkI5UHe9sSa9p4A
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
    <div class="moz-cite-prefix">On 9/14/25 3:43 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b031118e-8949-4c8a-8894-f70b89ae2b5a@suse.com">
      <pre wrap="" class="moz-quote-pre">On 12.09.2025 23:23, Julien Grall wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 11/09/2025 09:14, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Other projects have long switched to xz and/or lzip.

Tidy things some as well: With the removal of qemu from the tarball,
intermediately extracting the tarball again has become wasteful. Drop
that. Invoke compressors using asynchronous lists, to reduce overall
latency. Drop the -v option from the (previously implicit) gzip
invocation.

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I have tested manually the steps and the correct tarballs have been 
produced. I will update my scripts to copy &amp; sign all the tarballs once 
this is merged.

Acked-by: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:jgrall@amazon.com">&lt;jgrall@amazon.com&gt;</a>
Tested-by: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:jgrall@amazon.com">&lt;jgrall@amazon.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Is this intended for Xen 4.21?
</pre>
      </blockquote>
    </blockquote>
    <pre>IMO, it would be nice to have that in Xen 4.21.

</pre>
    <blockquote type="cite"
      cite="mid:b031118e-8949-4c8a-8894-f70b89ae2b5a@suse.com">
      <pre wrap="" class="moz-quote-pre">
So far it was, but I'm increasingly unsure, seeing that it still hasn't
gone in. Cc-ing Oleksii too now. Andrew had voiced concern towards the
rm use, but hasn't come back as to his argument towards the uncompressed
tarball previously not having been removed (when I can't see that one
would have been created in the first place), hence why I couldn't make
use of his (conditional) R-b.</pre>
    </blockquote>
    <pre>There is not too much sense in the uncompressed tarball. I prefer to not
generate it at all.

Also I have regarding .gz. If other projects switched to xz and/or
lzip (as it is mentioned in the commit message) what is the purpose of
having .gz tarball then?

~ Oleksii</pre>
  </body>
</html>

--------------ytewXNeJqlkI5UHe9sSa9p4A--

