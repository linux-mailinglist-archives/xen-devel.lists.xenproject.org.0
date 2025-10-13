Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AC9BD3A23
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 16:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142393.1476588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8JlM-0001yy-1M; Mon, 13 Oct 2025 14:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142393.1476588; Mon, 13 Oct 2025 14:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8JlL-0001vu-UG; Mon, 13 Oct 2025 14:42:59 +0000
Received: by outflank-mailman (input) for mailman id 1142393;
 Mon, 13 Oct 2025 14:42:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hmnp=4W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v8JlK-0001vo-FU
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 14:42:58 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8523dba-a842-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 16:42:57 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b3e7cc84b82so801397566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 07:42:56 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d5cacc21sm945732366b.11.2025.10.13.07.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 07:42:55 -0700 (PDT)
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
X-Inumbo-ID: e8523dba-a842-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760366576; x=1760971376; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkorJ/HNR2e5236ivOZiTexZz6UXlaZKt2buBanibZM=;
        b=RlpoMkfRN1nJJsr9XhQXvg8XkJcKqA+FYll6h9bbeUAtUugl0VF66t240OqqRVH6Z0
         3k9yuiBX7+iirCljMShuVaQDm7UoRpKGcoHsl+hpCZkiJnmUPRnAkoMaV7xb6ZXjAfv3
         5RmlgKNcR4vBRQ4JPgJlSgd8bhwR8DIyddnua12YWKrXgTuQFf48Qf+qsd0ULNjhi6Jj
         Q7+U4tM8Uo4dXXelQ2HEZd3sjOwIq36LLJzL8fmxfOT9ZmhCiNkEes85bSeg4WjeAjzP
         3uFEWeYZP4DxWXY73Q1AMOG+M//IzHxM7JNDEHtYfWPhoNrCwSUYlTyLv8c6RpEDPLqL
         sD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760366576; x=1760971376;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DkorJ/HNR2e5236ivOZiTexZz6UXlaZKt2buBanibZM=;
        b=cf42U8L3J8APqeopNN4plo2qi9qVR1VFPmFO8JqAoBqmm8di6/cvDmoUWwhWLqym4g
         4HpNSBx4snK+r8Q2RvL7wzvVZFrdN953hzsM0CWa8/ZP+lH7aAEbmy9zGSE5+2WXBzeM
         OqnL+BFRortDYNqg1EwuSXFAkuDj96V53VmKFUuE2j55/SBdCi6pWDOU7q2+naj7IfkD
         KjRYiQLJ8vmYS1+eIz8X/8sCZyHEu2S6MLKUfaatFjGDilt6V7QE5xJt3yBPm9RP8b4v
         WgtaH/FaBkDN3kMxecZ0DnOccUapqRck25WdpLqbMyFGQHWhYc1Q5pH1FBHjD+djlunE
         kzFA==
X-Gm-Message-State: AOJu0YydP22PI7dgRkG6pvpkCDoXAKJX1iJyD/4boZK4AoCajxiua6gM
	LV4WxGkejPpATbfeFY/K14DgP3CMZnrKgU6a5TBNXTq0T3PVABHBI3T2
X-Gm-Gg: ASbGncvd4EcXWy/WzD1EF4r67lZBpjatGPkSveAHKWHawHwQvw6E4g9+JpP/ar7xR2Q
	ZWaSpj9m1KEXh5XzcXDEx07Slf7PsJMqPARM/UEgJFVvm6kQhP+xn3L0jTT6TM/rKb5RkpKM4M5
	AdeQON2r6bhaH5oMOJBcjqJrKomzQ5DWTVaDG/2nV57SPqBL3wT5jSQWE+aNKjiJ+hH6NSeEjtA
	l8op/8IJbOA7LBLfZipVh9xlWRj2+rgWA2GBcUG9YAAX/le5hWDXlUjiyJnSF8raV3MRZwxvjPE
	FpDgcfRDvF9PQF3A6YujXJScNLajLz9uFsmBeTj+pugTVwwUzV9m08Q4HNBQit2kBFWb4dntNqi
	w+aovVDpnG1Tv9T6b7kjKCCw+2w4CSI6T+5h8DB3pG6lq80S/4MHH5cPEl2rFSjr+0+l23A0vkK
	57WCVzjF3DuGSFy2382VIfUA==
X-Google-Smtp-Source: AGHT+IFIuyI3gzX7781o9QfYs/BQXpbwRPDtjeSHCZIQvEtP1JqoIcobgDsU+stKscgj0klPgihkCQ==
X-Received: by 2002:a17:907:809:b0:b45:b078:c534 with SMTP id a640c23a62f3a-b50ac5cf768mr2303353066b.45.1760366575945;
        Mon, 13 Oct 2025 07:42:55 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------4ozUMBCF8vkPi1bPcBUdjHf3"
Message-ID: <a76dc8e5-94a5-4827-91ba-e6841cc99be8@gmail.com>
Date: Mon, 13 Oct 2025 16:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] VT-d: check bus_to_context_maddr()'s return value
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f449e23-107b-4fa3-b131-a8134763609a@suse.com>
 <f7aa9bef-f83c-4a10-a005-1acb78e16e67@citrix.com>
 <a7e71598-fefc-4906-a241-08fdaba78614@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a7e71598-fefc-4906-a241-08fdaba78614@suse.com>

This is a multi-part message in MIME format.
--------------4ozUMBCF8vkPi1bPcBUdjHf3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/25 3:12 PM, Jan Beulich wrote:
> On 13.10.2025 14:22, Andrew Cooper wrote:
>> On 29/07/2025 7:35 am, Jan Beulich wrote:
>>> The function returning zero is an error indication; we shouldn't try to
>>> map MFN 0 and then treat that page as a context table.
>>>
>>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>> Acked-by: Andrew Cooper<andrew.cooper3@citrix.com>
> Thanks (albeit you sent this in reply to the older security@ posting, not
> the later public one [1]).
>
> Oleksii, may I ask for a release-ack here please, seeing that the issue
> was considered on the edge of another security issue?

Sure, makes sense to me:
  Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> [1]https://lists.xen.org/archives/html/xen-devel/2025-08/msg00387.html
--------------4ozUMBCF8vkPi1bPcBUdjHf3
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
    <div class="moz-cite-prefix">On 10/13/25 3:12 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a7e71598-fefc-4906-a241-08fdaba78614@suse.com">
      <pre wrap="" class="moz-quote-pre">On 13.10.2025 14:22, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 29/07/2025 7:35 am, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">The function returning zero is an error indication; we shouldn't try to
map MFN 0 and then treat that page as a context table.

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Acked-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks (albeit you sent this in reply to the older security@ posting, not
the later public one [1]).

Oleksii, may I ask for a release-ack here please, seeing that the issue
was considered on the edge of another security issue?</pre>
    </blockquote>
    <pre>Sure, makes sense to me:
 Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:a7e71598-fefc-4906-a241-08fdaba78614@suse.com">
      <pre wrap="" class="moz-quote-pre">
[1] <a class="moz-txt-link-freetext" href="https://lists.xen.org/archives/html/xen-devel/2025-08/msg00387.html">https://lists.xen.org/archives/html/xen-devel/2025-08/msg00387.html</a>
</pre>
    </blockquote>
  </body>
</html>

--------------4ozUMBCF8vkPi1bPcBUdjHf3--

