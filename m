Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C8B2A504
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 15:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086102.1444333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzv5-0004Dr-OB; Mon, 18 Aug 2025 13:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086102.1444333; Mon, 18 Aug 2025 13:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzv5-0004BN-LD; Mon, 18 Aug 2025 13:29:03 +0000
Received: by outflank-mailman (input) for mailman id 1086102;
 Mon, 18 Aug 2025 13:29:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQjc=26=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1unzv4-0004BH-Ny
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 13:29:02 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4db04641-7c37-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 15:29:01 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb78da8a7so674428666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 06:29:01 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce9edbesm798075466b.58.2025.08.18.06.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 06:29:00 -0700 (PDT)
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
X-Inumbo-ID: 4db04641-7c37-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755523741; x=1756128541; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgLUV9qqPgpJr/VGJyMAbCDazaP0yA/nC3W94MfGf5c=;
        b=Yyw0Z13ygav+eN/ca6quK+SYPaYsTl+3pq84TMhviVg8NcA721ZWM2r1n0VeRi7Vvu
         toOKfFxFjWfv7v/e8shuPkZz5r8LIq5H+T1B93z5mBsFfgXl2VCTlitMM+kbZWihR4MO
         LOPqAyPlwyWneYcAh/aTLD4IlaxalBTD2JmmYGA52p1gJ3BAaO+deg4So50RAnnu3Xlh
         XrPVzJfWkHR9fFSI4FTusX2NGWwkMiE0QHs9EIqm8jFfrfOEHLpX23ZczOoeeVmCJWLw
         rLe4ORSwsIqeq+N2rDvYE4upa7ohPGPF2WVd4bEdGmfVFeNThurXBV1KnNYZbxd1iomB
         MIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755523741; x=1756128541;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LgLUV9qqPgpJr/VGJyMAbCDazaP0yA/nC3W94MfGf5c=;
        b=dgAxBtLEpXZuvck4r2Unvwm/AHlJnCkIf90lZXfXQGdeRmWXgi7bL90/mC+QuXth8A
         JG4DmxM5bGvxoLcblnDOjkJhpJoJnejcIbPFkelO7pnrwYGlHOotXdpMUZkYJ/rBvGXJ
         QVaoJap5PDVW5EBIEyQiqyvMphlPTRFOEw0uVZj4khUUmnPnRsFzNeCIw28vmnuvlgyC
         u+ifhwhVONzYDfeUybW40/Cd66lMHNYAFDLY1xzyKBXXfIg/xflccg1OOn4dNqiFfqeZ
         ozmF6X+EvFh+N0vNtukQoxF/CkTQ4kiV4q4JVZqFYZ6os9+g7zW28Y+VxLu515+EW0kc
         inDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFhBq61X5zamxKFfK+3PcC1CI/kOP2WBKfso/ONDtLIjt9sfUmXfGtmJUxpsbwWgtGhCjJQuL2B3Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1oiKs7qNbi5+etz6TcWnO+c+LkuSv9edcZGQI/abcU2QpckEj
	oqqTfBkc3gwYMs81HKVk3WWXiIu9BwbMBXf64Smg3oXsDhE+o8SkTad9
X-Gm-Gg: ASbGnctcdd1QCpYUfnmv2axcxj2/qtj0MUozJ9ePhWEa1RG3vmd+P6Yi6Z+01iM2S/w
	8DWpaeZPCbfkzxIE695GrngMUko4Il2u61w65tz2PMSEEcTL+EYL7eDu1A2h1tvCxUXl/l328mV
	/vvOzfrv02bAM4Q93VNi/Gv3sf3c2mSRKyslHnuOfzWNO9qKtdbAjfAlL8hJopwcj5X3G5PKpcZ
	u43aEEELKXt0MgIZ8PB1NM6oHXV1rmyaZJPptonRyRQSqIq+h0DjKDmC3c8v6nivbwXtmv+kKAe
	DfQlwdgu7l2MF9vZur7n6f6AOnQvZfKvwX44zxelSD54LEPSPGE2haq+HMItfX6VSVcOvdDdtgt
	1/+ie9LVgGHE813MYVZwuvvSaaT7Rrd5K2oahySvO2doBInAO+VqWE02MzimC2d9/W4m6vRg=
X-Google-Smtp-Source: AGHT+IFjhwcTHcT46jvQJP0UQkdWWViMHzd5njczFWav1FFBUSgctVClbf+Sr709BlzRBeS+iFMf/g==
X-Received: by 2002:a17:907:7fa9:b0:af9:d705:9f19 with SMTP id a640c23a62f3a-afcdc28bb9fmr1206458666b.17.1755523740820;
        Mon, 18 Aug 2025 06:29:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------s2ykdF5OBL13o3ZOvpkj09nB"
Message-ID: <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com>
Date: Mon, 18 Aug 2025 15:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250815102728.1340505-1-Penny.Zheng@amd.com>
 <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com>

This is a multi-part message in MIME format.
--------------s2ykdF5OBL13o3ZOvpkj09nB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/18/25 10:31 AM, Jan Beulich wrote:
> On 15.08.2025 12:27, Penny Zheng wrote:
>> In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
>> HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
>> a few functions, like domctl_lock_acquire/release() undefined, causing linking
>> to fail.
>> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
>> /hypercall-defs section, with this adjustment, we also need to release
>> redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
>> to not break compilation
>> Above change will leave dead code in the shim binary temporarily and will be
>> fixed with the introduction of domctl-op wrapping.
> Well, "temporarily" is now getting interesting. While v1 of "Introduce
> CONFIG_DOMCTL" was submitted in time to still be eligible for taking into
> 4.21, that - as indicated elsewhere - is moving us further in an unwanted
> direction.

Do you mean that specifically this patch or the whole patch series is moving us
in unwanted direction? (1)


>   Hence I'm not sure this can even be counted as an in-time
> submission. Plus it looks to be pretty extensive re-work in some areas.

It doesn't clear based on change log why this patch is sent outside "Introduce
CONFIG_DOMCTL" (2) as it looks the same as in (2) and it was reverted once with
the reason "for breaking the x86 build". (I haven't checked what was changed so
it won't lead to build issue again.)

> Hence I'm somewhat weary as to 4.21 here. IOW question, mainly to Oleksii,
> is whether to
> 1) strive to complete that work in time (and hence take the patch here),
> 2) take the patch here, accepting the size regression for the shim, or
> 3) revert what has caused the randconfig issues, and retry the effort in
>     4.22.
>
In the current context, I think I prefer option 3.
However, if option 1 is possible, it could also be considered—except in the
case where the answer to (1) is that the whole patch series is moving us in
an unwanted direction. In that situation, IMO, only option 3 remains viable.

>> Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
>> Reported-by: Jan Beulich<jbeulich@suse.com>
>> Signed-off-by: Penny Zheng<Penny.Zheng@amd.com>
> My earlier question (when the patch still was part of a series) sadly has
> remained unanswered: You've run this through a full round of testing this
> time?
>
> Jan
--------------s2ykdF5OBL13o3ZOvpkj09nB
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
    <div class="moz-cite-prefix">On 8/18/25 10:31 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com">
      <pre wrap="" class="moz-quote-pre">On 15.08.2025 12:27, Penny Zheng wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
a few functions, like domctl_lock_acquire/release() undefined, causing linking
to fail.
To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
/hypercall-defs section, with this adjustment, we also need to release
redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
to not break compilation
Above change will leave dead code in the shim binary temporarily and will be
fixed with the introduction of domctl-op wrapping.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, "temporarily" is now getting interesting. While v1 of "Introduce
CONFIG_DOMCTL" was submitted in time to still be eligible for taking into
4.21, that - as indicated elsewhere - is moving us further in an unwanted
direction.</pre>
    </blockquote>
    <pre>Do you mean that specifically this patch or the whole patch series is moving us
in unwanted direction? (1)


</pre>
    <blockquote type="cite"
      cite="mid:fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com">
      <pre wrap="" class="moz-quote-pre"> Hence I'm not sure this can even be counted as an in-time
submission. Plus it looks to be pretty extensive re-work in some areas.</pre>
    </blockquote>
    <pre>It doesn't clear based on change log why this patch is sent outside "Introduce
CONFIG_DOMCTL" (2) as it looks the same as in (2) and it was reverted once with
the reason "for breaking the x86 build". (I haven't checked what was changed so
it won't lead to build issue again.)

</pre>
    <blockquote type="cite"
      cite="mid:fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com">
      <pre wrap="" class="moz-quote-pre">
Hence I'm somewhat weary as to 4.21 here. IOW question, mainly to Oleksii,
is whether to
1) strive to complete that work in time (and hence take the patch here),
2) take the patch here, accepting the size regression for the shim, or
3) revert what has caused the randconfig issues, and retry the effort in
   4.22.

</pre>
    </blockquote>
    <pre>In the current context, I think I prefer option 3.
However, if option 1 is possible, it could also be considered—except in the
case where the answer to (1) is that the whole patch series is moving us in
an unwanted direction. In that situation, IMO, only option 3 remains viable.

</pre>
    <blockquote type="cite"
      cite="mid:fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
Reported-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
Signed-off-by: Penny Zheng <a class="moz-txt-link-rfc2396E" href="mailto:Penny.Zheng@amd.com">&lt;Penny.Zheng@amd.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
My earlier question (when the patch still was part of a series) sadly has
remained unanswered: You've run this through a full round of testing this
time?

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------s2ykdF5OBL13o3ZOvpkj09nB--

