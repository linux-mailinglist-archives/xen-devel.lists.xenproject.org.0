Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5DBC7ACE
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 09:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140299.1475223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6kxS-00052f-8e; Thu, 09 Oct 2025 07:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140299.1475223; Thu, 09 Oct 2025 07:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6kxS-0004zx-5r; Thu, 09 Oct 2025 07:21:02 +0000
Received: by outflank-mailman (input) for mailman id 1140299;
 Thu, 09 Oct 2025 07:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDLD=4S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v6kxQ-0004zb-2G
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 07:21:00 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8083191a-a4e0-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 09:20:58 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b457d93c155so92919166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 00:20:58 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869c4f93esm1851477866b.83.2025.10.09.00.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 00:20:57 -0700 (PDT)
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
X-Inumbo-ID: 8083191a-a4e0-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759994458; x=1760599258; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRhPB+SBv+gVf3IoqV9gY0z8jXaR6voQ7qNuqH58cJQ=;
        b=ZElhXaTUBug8gy0PYzZoBvM6umwj3VDB4PAiyd9v7qw3GlUDhYGF5Jl0zkjV4qrOEr
         CO7/eBNp+gBVW/ji1ite8jQ5B5whwWdIySnYTDeInzqpW/IEGtlpWLpRfHRis42rMNkE
         WNWJtP3RSlhHfYR+iOCpu0sOSBV+O3ggHGJk1ta4nVog08O7sY3b30jEC+11kO7XcSCJ
         tGG5MmqOLJO3VSGw8haWPIKGoOmxqcy9LaM6Zkv6zf1Zq5fGHZizUUt/oJ0i2UkTQ391
         Lu2Hr/JDJpbrFHx+vpRu562WLmtmU0SNgxrrs3IFVOoPCKtQlODgpFcSNsY+Zp1tGFbu
         RxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759994458; x=1760599258;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dRhPB+SBv+gVf3IoqV9gY0z8jXaR6voQ7qNuqH58cJQ=;
        b=Gc5OW8kOjTLguMEL3lHeXA9GaldN81Ep+hxIM2byVp6eAPW63i4o9q2d1hQIGAUG8w
         M3ZzFsaL8hWt4/92ZTaxvxxYpOjj2DqeLttbp6JDDjDxv3wfPqmfLzBbsygYQyFtJEVT
         s6jA187h9v8px5JNdaSsaU8XTjQqZbPAIHDTHxYyTUaJfG1iwavOVMj89tWs69l1l6PF
         EeBRwoW0c45140rIHa0bKEtRtmlazhGtGHX1IODwY4HMouACEUhfjsAmstZrzJEVMKUA
         dDfpeutYayPHxjF3A7Me44hoNHL0QyLm+OiX5w9UyHG26Lcu6pdJr5MFS7DLx2Y6cJzk
         UhMA==
X-Gm-Message-State: AOJu0YytLL4CcQRwCGKxCYBphppBXn2sKpL+oKY2NIQtTqlzDLFbFl1Y
	1Ab9PMWm/gmYxWFWzHdminBn7EO++7K47/sK0nohj+j7dJQZ+JW17GJA
X-Gm-Gg: ASbGncvwYG7mTZc+8tBzOUnUbVh9x0C10FxwEmiRSJEB8ardKALvw1P19BE31O5ltdF
	y20UsLb/Sf2CaGkQiNfx9aIW/+NNO2PzU6uqbmhtHLSu1t/7JjirSE8ppLB00jpqqroiSgEg0Nk
	erJfacc8uM6Bg9vrCWwthhEPPPdDQpHq7NeAdjAdTezW1sD2XJtp6sTvZHHggHDrqJ5e/dzhxLg
	X7AIZsZjcvDLs5g45HqGV9+XvSGnVHMtPCA0/+bpOPrUb3orY4zbjwgPfKlLJBCseoKcLAACx1X
	qxk6dMZUc9gQzWyQ3QPKgH/3gMmxbMaVdQJKeJzD2oPM9M7YCAR1CNuEjx5XYCmd+D685H/sZEj
	cmqONckqFIg0fmAPXUrwqv0ATfbpmy7r06NkgMQCB12fpEjgM8M1f+sLkQZ5IphtTkc9un/CorD
	sLvw4op038CJ6mDddArLOq+AeEN8G2UR+rqtHdGw==
X-Google-Smtp-Source: AGHT+IGkzVao23veRHXKB1kn9GyD/R4JNbCJ3h7Kv1N4zc8e6hdilu0zsLKlIUNU7Fi2SD0uPHRqrg==
X-Received: by 2002:a17:907:7e82:b0:b45:66f6:6a21 with SMTP id a640c23a62f3a-b50abfcd081mr706116866b.46.1759994457674;
        Thu, 09 Oct 2025 00:20:57 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------9O0KnNKyInfmwlzblJbKGynO"
Message-ID: <ecdbcf8e-16b2-476f-b586-e022fdfda560@gmail.com>
Date: Thu, 9 Oct 2025 09:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 1/2] x86/AMD: avoid REP MOVSB for Zen3/4
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <6bcaa5b7-4e34-40c9-85e6-48a0a5869b86@suse.com>
 <485889ed-2820-4bb3-b450-88553dbb719e@vates.tech>
 <f42bb989-c9e5-43d5-82e2-9b6f95c008fa@amd.com> <aOZJDh9vwbcTwBIy@Mac.lan>
 <7c403caf-192a-413b-9b17-d8e02c066727@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7c403caf-192a-413b-9b17-d8e02c066727@suse.com>

This is a multi-part message in MIME format.
--------------9O0KnNKyInfmwlzblJbKGynO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/8/25 6:06 PM, Jan Beulich wrote:
> On 08.10.2025 13:20, Roger Pau Monné wrote:
>> On Mon, Sep 29, 2025 at 07:35:53PM -0400, Jason Andryuk wrote:
>>> On 2025-09-25 08:18, Teddy Astie wrote:
>>>> Le 25/09/2025 à 12:48, Jan Beulich a écrit :
>>>>> Along with Zen2 (which doesn't expose ERMS), both families reportedly
>>>>> suffer from sub-optimal aliasing detection when deciding whether REP MOVSB
>>>>> can actually be carried out the accelerated way. Therefore we want to
>>>>> avoid its use in the common case (memset(), copy_page_hot()).
>>>> s/memset/memcpy (memset probably uses rep stosb which is not affected IIUC)
>>>>
>>>>> Reported-by: Andrew Cooper<andrew.cooper3@citrix.com>
>>>>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
>>> With Teddy's suggested change:
>>>
>>> Reviewed-by: Jason Andryuk<jason.andryuk@amd.com>
>> Acked-by: Roger Pau Monné<roger.pau@citrix.com>
> May I ask for a release-ack here, seeing that it alters behavior that went in
> close before the freeze?

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

--------------9O0KnNKyInfmwlzblJbKGynO
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
    <div class="moz-cite-prefix">On 10/8/25 6:06 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7c403caf-192a-413b-9b17-d8e02c066727@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.10.2025 13:20, Roger Pau Monné wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Mon, Sep 29, 2025 at 07:35:53PM -0400, Jason Andryuk wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 2025-09-25 08:18, Teddy Astie wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Le 25/09/2025 à 12:48, Jan Beulich a écrit :
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Along with Zen2 (which doesn't expose ERMS), both families reportedly
suffer from sub-optimal aliasing detection when deciding whether REP MOVSB
can actually be carried out the accelerated way. Therefore we want to
avoid its use in the common case (memset(), copy_page_hot()).
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
s/memset/memcpy (memset probably uses rep stosb which is not affected IIUC)

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">
Reported-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
With Teddy's suggested change:

Reviewed-by: Jason Andryuk <a class="moz-txt-link-rfc2396E" href="mailto:jason.andryuk@amd.com">&lt;jason.andryuk@amd.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Acked-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
May I ask for a release-ack here, seeing that it alters behavior that went in
close before the freeze?</pre>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii</pre>
  </body>
</html>

--------------9O0KnNKyInfmwlzblJbKGynO--

