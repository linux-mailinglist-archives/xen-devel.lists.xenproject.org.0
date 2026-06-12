Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hZXiBK0oLGrhMQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 17:41:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E08A67A93E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 17:41:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="dNng9/MF";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1336845.1598621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY40R-0003qS-DT; Fri, 12 Jun 2026 15:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336845.1598621; Fri, 12 Jun 2026 15:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY40R-0003og-AE; Fri, 12 Jun 2026 15:41:15 +0000
Received: by outflank-mailman (input) for mailman id 1336845;
 Fri, 12 Jun 2026 15:41:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhardkaindl7@gmail.com>) id 1wY40P-0003oY-7H
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 15:41:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY40O-00GbRW-KV
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 17:41:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhardkaindl7@gmail.com>)
 id 6a2c2893-2eae-0a2a0a5409dd-0a2a45068c16-6
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 17:41:12 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhardkaindl7@gmail.com>)
 id 6a2c2898-7371-0a2a45060019-d1558031d92e-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 17:41:12 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so8770505e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 08:41:12 -0700 (PDT)
Received: from ?IPV6:2a02:1748:f7df:8cb1:8428:5f57:cb30:5fcd?
 ([2a02:1748:f7df:8cb1:8428:5f57:cb30:5fcd])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea961f18sm61665845e9.2.2026.06.12.08.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 08:41:11 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781278872; x=1781883672; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35ZiRbHcXFIuTMYGuABY0THVvr5nDzHFAHOY5N4BasU=;
        b=dNng9/MFgJwjNgRq1m0nkhC7sv2gcCqj2deSWALjys9tHYscsPfLrX4B4vwG66TJRl
         Y6lVohLnsWp77ZNPe+tGmA+y5Y8s3ZKMOTUQaeKHgMUAboi/+kuYFS1uiNkAdWbbQ2+/
         n4542tX+9TIg8j65aWz13tM3Fheik35fhqF9RuzQmn5D1+SUIhoMJq/XSx7lNFV9xGzd
         NxlMmaKLrQqTNlSbVgfKWoc3oIonpo/xEJr6Gl9hHcyCfCi2f5hgzruELDXM2uRgYuJb
         +p/a9X8PzVYMOkqXXaAQrutZhc0vfl6IFCkkko7yZ8OqMYwYDfncZImIY4Ws8uWgsUs6
         kzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278872; x=1781883672;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35ZiRbHcXFIuTMYGuABY0THVvr5nDzHFAHOY5N4BasU=;
        b=lKMGYNf2WW8ZsEBcQLNYjj09Pr89zLGVRVy/gP4ejC29AbyKe2jhI2oTMYayZd/qcw
         qVgkAsfcVJkD/fGrRMpm5JD5/1H2y+m0trH14doWOpzlCVPOHb+R+bfAiCaJoKTbm3GT
         H/bY/SNE0TgsxUSQBMFXYpds7aMZhystpZrhhOdJw1DY/XK2uIHfIYO8ITJQ3h99RUB7
         Fd1D3CSviFavgl2I1HLMIf7aN9A5KzVhBTXcZy8XBCh0AhsOJMvuC6mRw33W0WB/0ZZr
         cdQUSAnCA03ECFsaTSrvY5Y5qdmzYb1a3AnD6wWRmpYkvGesm/1F+EU/y5wtAPMy+3Nv
         phbQ==
X-Gm-Message-State: AOJu0Yy2ZRfoADw0u1JaxybJIWo82psAXNeOjYpFKeLL+qN/Gckl1jW+
	2leadpQAMB81+S0Nzgu/9/sUWSVe3xLJk9tKUuVda0PV0ETra81y7yyY95VM0A==
X-Gm-Gg: Acq92OH0ubj0Hy3dv1EhsiakaAUCqH8FEDNywVG1GCjXyyGMI+oWH1FSeR5NbFruVEr
	GAwx09zdfSjBsy/pBzau05TlytrqH/4wPmfofMea6P1Bx47VJ1vQI1cL+pZDJ85kWUvI5Ms5tTj
	mhJoyoDhDtj1AoJ/RAi7m5DmylkAIPVeCRV0pIoAE8OH+eJfMAckagKIheQSOgkXPIU3imVq+hh
	n64W3llCfRmgw8M2rr7XkT9iklqH4LG7YXwcSEWNe2v+ZfeExG8+4t3Olb84qQY50s78f92WB03
	QiuVVbFoTMzZFjz5hhd0ApIwxaF5CP71a0QO99pSf6sJRcUUkUtTCtPZqNI9yjy2JTAbA4z/tGD
	CxBnZ8ND3PaU56wjYE2Ez87VFCSX+7nrbOL/IOgW7fX3zaZfpX0EGkpp4dcnGqxsa3nkthDVeZ9
	mvvjw7YRm0Bf7LK/OJZLq2+PqAJ/7Q2mO6QZ9jL7zHAKKwQxKmQiLF0q1moz63gWtvr9cwRoyjQ
	VV+PxhJ1iC8wbI=
X-Received: by 2002:a05:600c:46c4:b0:490:e60b:5fd6 with SMTP id 5b1f17b1804b1-490ec4e7b61mr47904535e9.29.1781278871792;
        Fri, 12 Jun 2026 08:41:11 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------LCntiB06HltbOa9A5wVnM96m"
Message-ID: <8b51a40e-028a-42aa-a7e4-55a731ebe10e@gmail.com>
Date: Fri, 12 Jun 2026 17:41:07 +0200
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: [PATCH] x86/efi: Skip FPU save/restore for idle vCPU in EFI, runtime
 path
To: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <957a0fea-4099-4470-9b40-3f8b294c44dc@suse.com>
Content-Language: en-US
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
In-Reply-To: <957a0fea-4099-4470-9b40-3f8b294c44dc@suse.com>
X-purgate-ID: tlsNG-16d1c6/1781278872-85F6BD75-3F508F5F/0/0
X-purgate-type: clean
X-purgate-size: 11282
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.18 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jbeulich@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[bernhardkaindl7@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhardkaindl7@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E08A67A93E

This is a multi-part message in MIME format.
--------------LCntiB06HltbOa9A5wVnM96m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Anthony, could you test this patch which exactly applies the changes 
Jan suggested? Summary:
Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/restore
for idle vCPUs, which don't have an FPU context to save/restore,
much like the calls are guarded in __context_switch(),
where save/restore is done only for non-idle vCPUs.
As these simple guards should preferably go into Xen 4.22: Please test 
if there are any further regressions with the 'cmos-rtc-probe' 
workaround you just added removed to check if guarding the assertions as 
Jan suggested is enough to fix the issues triggered on your machine. 
Thanks, Bernhard The patch to test follows: [PATCH] x86/efi: Skip FPU 
save/restore for idle vCPU in EFI, runtime path
Anthony reported a boot-time crash in init_xen_time() via efi_get_time()
on a Broadwell-D system:
   Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
The failing path is an EFI runtime call reached early during boot,
where current may still be the idle vCPU.
This became fragile after the lazy-FPU removal cleanup series.
In 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling"),
efi_rs_enter() was changed from save_fpu_enable() to vcpu_save_fpu(curr),
which unconditionally asserts !is_idle_vcpu(v)
so an EFI runtime call in idle context now asserts.
Likewise, in dba44e051209 ("x86: Remove fully_eager_fpu"),
efi_rs_leave() was changed to call vcpu_restore_fpu(curr),
which has the same assertion and can fail for the same reason.
Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/restore
for idle vCPUs, which don't have an FPU context to save/restore,
much like the calls are guarded in __context_switch(),
where save/restore is done only for non-idle vCPUs.
Fixes: 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling")
Fixes: dba44e051209 ("x86: Remove fully_eager_fpu")
Reported-by: Anthony PERARD <anthony.perard@vates.tech>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
  xen/common/efi/runtime.c | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index a23fa75e37..596f2710fb 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -98,7 +98,8 @@ struct efi_rs_state efi_rs_enter(void)
       */
      sync_local_execstate();
      state.cr3 = read_cr3();
-    vcpu_save_fpu(current);
+    if ( !is_idle_vcpu(current) )
+        vcpu_save_fpu(current);
      asm volatile ( "fnclex; fldcw %0" :: "m" (fcw) );
      asm volatile ( "ldmxcsr %0" :: "m" (mxcsr) );
@@ -159,7 +160,8 @@ void efi_rs_leave(struct efi_rs_state *state)
      }
      irq_exit();
      spin_unlock(&efi_rs_lock);
-    vcpu_restore_fpu(curr);
+    if ( !is_idle_vcpu(curr) )
+        vcpu_restore_fpu(curr);
  }
  unsigned long efi_get_time(void)
-- 
2.43.0
--- PS: The suggestion by Jan to fix this issue: On 12/06/2026 16:17, 
Jan Beulich wrote:
> The thinko looks to be in 4b9851c64522 ("x86: Remove fpu_initialised/fpu_dirty"):
> While vcpu_restore_fpu() indeed unconditionally set the two boolean fields to
> true at that point, idle vCPU-s may never make it through that function, and
> hence ->fpu_dirtied would have remained false, triggering the (original) early
> exit from _vcpu_save_fpu(). Perhaps all we can do now is guard the call to
> vcpu_save_fpu() (and also the one to vcpu_restore_fpu() out of efi_rs_leave())
> by explicit is_idle_vcpu() checks. Much like the calls are guarded in
> __context_switch().
>
> Jan
--------------LCntiB06HltbOa9A5wVnM96m
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div
style="color: #000000;background-color: #ffffff;font-family: Consolas, 'Courier New', monospace;font-weight: normal;font-size: 14px;line-height: 19px;white-space: pre;"><span
    style="color: #000000;">Hi Anthony,

</span>could you test this patch which exactly applies the changes Jan suggested?

Summary:

<div><span style="color: #000000;">Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/restore</span></div><div><span
    style="color: #000000;">for idle vCPUs, which don't have an FPU context to save/restore,</span></div><div><span
    style="color: #000000;">much like the calls are guarded in __context_switch(),</span></div><div><span
    style="color: #000000;">where save/restore is done only for non-idle vCPUs.</span></div>
As these simple guards should preferably go into Xen 4.22:

Please test if there are any further regressions with
<span style="white-space: pre-wrap">the 'cmos-rtc-probe' </span>workaround you just added removed
to check if guarding the assertions as Jan suggested is enough
to fix the issues triggered on your machine.

Thanks,

 Bernhard

The patch to test follows:

[PATCH] x86/efi: Skip FPU save/restore for idle vCPU in EFI, runtime path

<div><span style="color: #000000;">Anthony reported a boot-time crash in init_xen_time() via efi_get_time()</span></div><div><span
    style="color: #000000;">on a Broadwell-D system:</span></div>
<div><span style="color: #000000;">  Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195</span></div>
<div><span style="color: #000000;">The failing path is an EFI runtime call reached early during boot,</span></div><div><span
    style="color: #000000;">where current may still be the idle vCPU.</span></div>
<div><span style="color: #000000;">This became fragile after the lazy-FPU removal cleanup series.</span></div>
<div><span style="color: #000000;">In 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling"),</span></div><div><span
    style="color: #000000;">efi_rs_enter() was changed from save_fpu_enable() to vcpu_save_fpu(curr),</span></div><div><span
    style="color: #000000;">which unconditionally asserts !is_idle_vcpu(v)</span></div><div><span
    style="color: #000000;">so an EFI runtime call in idle context now asserts.</span></div>
<div><span style="color: #000000;">Likewise, in dba44e051209 ("x86: Remove fully_eager_fpu"),</span></div><div><span
    style="color: #000000;">efi_rs_leave() was changed to call vcpu_restore_fpu(curr),</span></div><div><span
    style="color: #000000;">which has the same assertion and can fail for the same reason.</span></div>
<div><span style="color: #000000;">Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/restore</span></div><div><span
    style="color: #000000;">for idle vCPUs, which don't have an FPU context to save/restore,</span></div><div><span
    style="color: #000000;">much like the calls are guarded in __context_switch(),</span></div><div><span
    style="color: #000000;">where save/restore is done only for non-idle vCPUs.</span></div>
<div><span style="color: #000000;">Fixes: 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling")</span></div><div><span
    style="color: #000000;">Fixes: dba44e051209 ("x86: Remove fully_eager_fpu")</span></div><div><span
    style="color: #000000;">Reported-by: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a></span></div><div><span
    style="color: #000000;">Suggested-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></span></div><div><span
    style="color: #000000;">Signed-off-by: Bernhard Kaindl <a class="moz-txt-link-rfc2396E" href="mailto:bernhard.kaindl@citrix.com">&lt;bernhard.kaindl@citrix.com&gt;</a></span></div><div><span
    style="color: #000000;">---</span></div><div><span
    style="color: #000000;"> xen/common/efi/runtime.c | 6 ++++--</span></div><div><span
    style="color: #000000;"> 1 file changed, 4 insertions(+), 2 deletions(-)</span></div>
<div><span style="color: #000080;">diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c</span></div><div><span
    style="color: #000000;">index a23fa75e37..596f2710fb 100644</span></div><div><span
    style="color: #000080;">--- a/xen/common/efi/runtime.c</span></div><div><span
    style="color: #000080;">+++ b/xen/common/efi/runtime.c</span></div><div><span
    style="color: #000000;">@@ -98,7 +98,8 @@ struct efi_rs_state efi_rs_enter(void)</span></div><div><span
    style="color: #000000;">      */</span></div><div><span
    style="color: #000000;">     sync_local_execstate();</span></div><div><span
    style="color: #000000;">     state.cr3 = read_cr3();</span></div><div><span
    style="color: #a31515;">-    vcpu_save_fpu(current);</span></div><div><span
    style="color: #098658;">+    if ( !is_idle_vcpu(current) )</span></div><div><span
    style="color: #098658;">+        vcpu_save_fpu(current);</span></div><div><span
    style="color: #000000;">     asm volatile ( "fnclex; fldcw %0" :: "m" (fcw) );</span></div><div><span
    style="color: #000000;">     asm volatile ( "ldmxcsr %0" :: "m" (mxcsr) );</span></div><div><span
    style="color: #000000;"> </span></div><div><span
    style="color: #000000;">@@ -159,7 +160,8 @@ void efi_rs_leave(struct efi_rs_state *state)</span></div><div><span
    style="color: #000000;">     }</span></div><div><span
    style="color: #000000;">     irq_exit();</span></div><div><span
    style="color: #000000;">     spin_unlock(&amp;efi_rs_lock);</span></div><div><span
    style="color: #a31515;">-    vcpu_restore_fpu(curr);</span></div><div><span
    style="color: #098658;">+    if ( !is_idle_vcpu(curr) )</span></div><div><span
    style="color: #098658;">+        vcpu_restore_fpu(curr);</span></div><div><span
    style="color: #000000;"> }</span></div><div><span
    style="color: #000000;"> </span></div><div><span
    style="color: #000000;"> unsigned long efi_get_time(void)</span></div><div><span
    style="color: #a31515;">-- </span></div><div><span
    style="color: #000000;">2.43.0</span></div><span
    style="white-space: normal">
---
PS: The suggestion by Jan to fix this issue:

On 12/06/2026 16:17, Jan Beulich wrote:</span></div>
    <blockquote type="cite"
      cite="mid:957a0fea-4099-4470-9b40-3f8b294c44dc@suse.com">
      <pre wrap="" class="moz-quote-pre">The thinko looks to be in 4b9851c64522 ("x86: Remove fpu_initialised/fpu_dirty"):
While vcpu_restore_fpu() indeed unconditionally set the two boolean fields to
true at that point, idle vCPU-s may never make it through that function, and
hence -&gt;fpu_dirtied would have remained false, triggering the (original) early
exit from _vcpu_save_fpu(). Perhaps all we can do now is guard the call to
vcpu_save_fpu() (and also the one to vcpu_restore_fpu() out of efi_rs_leave())
by explicit is_idle_vcpu() checks. Much like the calls are guarded in
__context_switch().

Jan</pre>
    </blockquote>
  </body>
</html>

--------------LCntiB06HltbOa9A5wVnM96m--

