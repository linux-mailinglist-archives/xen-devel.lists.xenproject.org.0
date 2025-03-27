Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D337A72DB8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 11:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928914.1331553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txkQT-00030I-Iw; Thu, 27 Mar 2025 10:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928914.1331553; Thu, 27 Mar 2025 10:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txkQT-0002xC-Fg; Thu, 27 Mar 2025 10:25:29 +0000
Received: by outflank-mailman (input) for mailman id 928914;
 Thu, 27 Mar 2025 10:25:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txkQR-0002x6-P5
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 10:25:27 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca12bb2f-0af5-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 11:25:22 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5eb92df4fcbso1387580a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 03:25:22 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebcd0df994sm10746530a12.70.2025.03.27.03.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 03:25:21 -0700 (PDT)
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
X-Inumbo-ID: ca12bb2f-0af5-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743071122; x=1743675922; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cOblaAinAwUTS3whlvXkse25OYESNZuk5XIOJjq5/E=;
        b=I+y05K0rj6mICTF4udmRymxtzkcnvdKqcV7AjPZ8OhjFnLc+JIsfPapcN8Sza2b8lg
         diU78HcliIBboHqwX2Ev7TpfpuBpC+CyVFhMevRZ1go1qQ3zkIZ6+qB84jPXIwLz0SgZ
         t6SDmXqAX4JWezuZewUt9yypkiYuhd+lg5ddg6/kzCwxAJRaLemfMAIJtr9OAMxWZ+1s
         T3GqK94N8nWlFfVDqVJBvpCExojyjIOUAeaBoGizAm3AgnSeUwnVjH4Us11ZMKVXzsZk
         O1Bkn3vohrPvF0J8LXeCrC86GMez2gcDd5OS9/xIfF5rU7uMWuzXb1JMYQ71G+gia2Es
         NWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743071122; x=1743675922;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cOblaAinAwUTS3whlvXkse25OYESNZuk5XIOJjq5/E=;
        b=Jx33WKDAjV56YfL2pPAz0tOOgqUVmebA+OyTTg/nMNeXJtHLQjFLrBBENyyD8jKt6p
         yYYXFGG8nUKwtGgc5X/angn+SQl7343JIHuiUctRcByotFGSsLTwjSbu/edDO7UBb6OH
         zRH0PqdeBPX3h9w/tnhY4c0UBUgxpfMGvvF9B9jUJL+igzywhhRs2svy9QW3Dv2I8DJt
         ZsRj3WYlPi2E8fG5ksxomgE54dSxMIcu67dWUlk4lyCMmEH0k2FmBSt501EP/i8O0HM5
         MQBRZ6JMVQvUROoFPaKFf01/kQYYFjdbBo9+pNeWxhdLJAMP/rs8ba65JmrvMmqSP2Vg
         8EPw==
X-Forwarded-Encrypted: i=1; AJvYcCVxChlzH4CtRXyJqgVjBhHRp+45vOoJ9SM36DdE1mpwctpZYM17dmFSNvSg+/HqFcmbZMr4YOp62vM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIrdeNDurS1WDwJL1Lp3qp5ylYCMfdGoaqVi1P4OJVKf1uZi76
	XgROqzj1E9ZkWYr+v02vVTTGBGXlYktTxymqFweFvSv1XksAOHtF
X-Gm-Gg: ASbGncuFt8ux6crkEJFeLs4EjGCXZ4o2KZAU1Jb+dDhmp4lyLF/GrPn+H0NScUSslTh
	62+gQThigtH5bulpmHTyp5yS6EKUCTn9b2z3dq9YHfmh5kw/d+u/x5vZTOkAR20p1eHrVOBF2n3
	tjjJsawAeFge05bjags3dleBrlFFfVEOubD/EEVo6GAlNCkKfpXfcP9gwDfpYIpgRmKw1d5xIMT
	jl82V2UpJgYyokS29TtMnSsUmJ3GfCh0e5shz7yFg28mZrO9NL16jVmV84SBSGzSLFBLNTjfD+j
	BPPA6AwEWyi39nRVtIJxNqYCb1Bt/yhkmOxGshYMtDRfB15jtDLsapVzgDy1euOD7xRyy3q4LpN
	HXdUKNAXGQWDna+dBp0VC
X-Google-Smtp-Source: AGHT+IFS707lrpBUE1Lec7vwpplQUROwJBl8OPBqI26UeLgAcceGtMUbA/PNbubmGS0H7S15u/775g==
X-Received: by 2002:a05:6402:26d0:b0:5e6:23c:a242 with SMTP id 4fb4d7f45d1cf-5ed8e59f048mr3403644a12.18.1743071121333;
        Thu, 27 Mar 2025 03:25:21 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------j3d7Fx8iv205Dq68dVblHxVB"
Message-ID: <0ffb0c7d-4ecf-4172-82dc-0f5368808591@gmail.com>
Date: Thu, 27 Mar 2025 11:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/19] xen/sysctl: wrap around XEN_SYSCTL_physinfo
To: Jan Beulich <jbeulich@suse.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Penny Zheng <Penny.Zheng@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-16-Penny.Zheng@amd.com>
 <87fe5ebc-4bbd-4941-814b-5447be06a201@gmail.com>
 <45e7368b-9aef-4e72-934c-3fa8846a8d5f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <45e7368b-9aef-4e72-934c-3fa8846a8d5f@suse.com>

This is a multi-part message in MIME format.
--------------j3d7Fx8iv205Dq68dVblHxVB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/27/25 10:58 AM, Jan Beulich wrote:
> On 27.03.2025 10:35, Oleksii Kurochko wrote:
>> On 3/26/25 6:50 AM, Penny Zheng wrote:
>>> The following functions are only used to deal with XEN_SYSCTL_physinfo,
>>> then they shall be wrapped:
>>> - arch_do_physinfo
>>> - get_outstanding_claims
>>>
>>> Signed-off-by: Penny Zheng<Penny.Zheng@amd.com>
>>> ---
>>> v1 -> v2:
>>> - no need to wrap declaration
>>> - add transient #ifdef in sysctl.c for correct compilation
>>> ---
>>>    xen/arch/arm/sysctl.c   | 2 ++
>>>    xen/arch/riscv/stubs.c  | 2 ++
>>>    xen/arch/x86/sysctl.c   | 2 ++
>>>    xen/common/page_alloc.c | 2 ++
>>>    xen/common/sysctl.c     | 2 +-
>>>    5 files changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
>>> index 32cab4feff..2d350b700a 100644
>>> --- a/xen/arch/arm/sysctl.c
>>> +++ b/xen/arch/arm/sysctl.c
>>> @@ -15,6 +15,7 @@
>>>    #include <asm/arm64/sve.h>
>>>    #include <public/sysctl.h>
>>>    
>>> +#ifdef CONFIG_SYSCTL
>>>    void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>>    {
>>>        pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
>>> @@ -22,6 +23,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>>        pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>>>                                           XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>>>    }
>>> +#endif
>>>    
>>>    long arch_do_sysctl(struct xen_sysctl *sysctl,
>>>                        XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
>>> index 5951b0ce91..7b3f748886 100644
>>> --- a/xen/arch/riscv/stubs.c
>>> +++ b/xen/arch/riscv/stubs.c
>>> @@ -328,10 +328,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
>>>        BUG_ON("unimplemented");
>>>    }
>>>    
>>> +#ifdef CONFIG_SYSCTL
>>>    void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>>>    {
>>>        BUG_ON("unimplemented");
>>>    }
>>> +#endif /* CONFIG_SYSCTL */
>> Considering that now we will have CONFIG_SYSCTL, I think it would be better just to drop
>> definition of arch_do_physinfo() from riscv/stubs.c as it was added to make common code build
>> for RISC-V happy.
> Wouldn't that require SYSCTL=n then for RISC-V, which better wouldn't be done
> (as it would need undoing later on)?

I missed that SYSCTL=y by default.

Then it will be really better to have #ifdef CONFIG_SYSCTL instead of removing
arch_do_physinfo() from riscv/stub.c. (the same is true then for arch_do_sysctl()
in the next patch)

~ Oleksii

--------------j3d7Fx8iv205Dq68dVblHxVB
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
    <div class="moz-cite-prefix">On 3/27/25 10:58 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:45e7368b-9aef-4e72-934c-3fa8846a8d5f@suse.com">
      <pre wrap="" class="moz-quote-pre">On 27.03.2025 10:35, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 3/26/25 6:50 AM, Penny Zheng wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">The following functions are only used to deal with XEN_SYSCTL_physinfo,
then they shall be wrapped:
- arch_do_physinfo
- get_outstanding_claims

Signed-off-by: Penny Zheng<a class="moz-txt-link-rfc2396E" href="mailto:Penny.Zheng@amd.com">&lt;Penny.Zheng@amd.com&gt;</a>
---
v1 -&gt; v2:
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
  xen/arch/arm/sysctl.c   | 2 ++
  xen/arch/riscv/stubs.c  | 2 ++
  xen/arch/x86/sysctl.c   | 2 ++
  xen/common/page_alloc.c | 2 ++
  xen/common/sysctl.c     | 2 +-
  5 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 32cab4feff..2d350b700a 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,6 +15,7 @@
  #include &lt;asm/arm64/sve.h&gt;
  #include &lt;public/sysctl.h&gt;
  
+#ifdef CONFIG_SYSCTL
  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
  {
      pi-&gt;capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
@@ -22,6 +23,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
      pi-&gt;arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
  }
+#endif
  
  long arch_do_sysctl(struct xen_sysctl *sysctl,
                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 5951b0ce91..7b3f748886 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -328,10 +328,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
      BUG_ON("unimplemented");
  }
  
+#ifdef CONFIG_SYSCTL
  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
  {
      BUG_ON("unimplemented");
  }
+#endif /* CONFIG_SYSCTL */
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Considering that now we will have CONFIG_SYSCTL, I think it would be better just to drop
definition of arch_do_physinfo() from riscv/stubs.c as it was added to make common code build
for RISC-V happy.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Wouldn't that require SYSCTL=n then for RISC-V, which better wouldn't be done
(as it would need undoing later on)?</pre>
    </blockquote>
    <pre>I missed that SYSCTL=y by default.

Then it will be really better to have #ifdef CONFIG_SYSCTL instead of removing 
arch_do_physinfo() from riscv/stub.c. (the same is true then for arch_do_sysctl()
in the next patch)

~ Oleksii</pre>
  </body>
</html>

--------------j3d7Fx8iv205Dq68dVblHxVB--

