Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194DEC8EEF2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 15:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174025.1499004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOdP2-0001zF-0W; Thu, 27 Nov 2025 14:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174025.1499004; Thu, 27 Nov 2025 14:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOdP1-0001xS-U4; Thu, 27 Nov 2025 14:55:23 +0000
Received: by outflank-mailman (input) for mailman id 1174025;
 Thu, 27 Nov 2025 14:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wmoz=6D=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1vOdP0-0001xM-58
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 14:55:22 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 183adad8-cba1-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 15:55:20 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-640b0639dabso1685328a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 06:55:20 -0800 (PST)
Received: from [10.17.72.183] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64750a90d5dsm1822947a12.12.2025.11.27.06.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 06:55:19 -0800 (PST)
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
X-Inumbo-ID: 183adad8-cba1-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764255320; x=1764860120; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HiHkuLwJ/313PjsL1KVlcbsOsdVneQ2WPGRmhpBAggQ=;
        b=b/9AFqafwLRkyYc66ZEZhbaov6yjG9PwdKSckZPoPpjxYvsekTijpZb5Fj7UjgGw4H
         RrbPDeBRvDzIz4/TQ6wH8pG6bgRfLMzp3BFbCZVVxhUCcIBsmE/C0fhNjJHnUUV3jluF
         dbjNWK977EbpCJeKyoSf51YdYInV4g1WKCNDCHHBoZwJCRQ/WeiOdkDWJNss9k4Jl4IB
         RgB7NY7oPo3u/pONEWBpMiuyctIAWBcfa/cf+JOm2WsxHfjh0nsHa3l4QBejZ2FzZYWf
         FYh0W6EwhCUxh58pZecWi2B36J7A2lBMlT9wGHT3sqwdcHDckgJk0uFqQIbi0lyUVTOE
         nTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764255320; x=1764860120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiHkuLwJ/313PjsL1KVlcbsOsdVneQ2WPGRmhpBAggQ=;
        b=MockCAJjEAcidq/Gkyxk5VW+DOT1J73Z6y5Lbgz3ngENYq84kaHq/cAf27mP0A6r/n
         4+1otZGFAa0NhdJaD3wFlGUlrgsk1csQzc26C06fG5+9m15Lesdl+E71tHxkqf5+ZHmr
         Yvf/kBoQsWxsDoRNXGAj7rEu7xwGTc6jcVo135g586IuHJQ98/vj7PVGR5e42MEJHDty
         ZeQWZpkAk1f3ejr8ktD9Qyb+6yjutsfDgpE8nzlWNse23W+iR/ofPMTsw7FWCyTUn7En
         dnU/uvNbaHtA88ZC729Nhrr2vwsYYwveIToCnr0xYRdB/3D1eVkmgjxqjwB4GUVZV52Q
         kjNA==
X-Forwarded-Encrypted: i=1; AJvYcCXRaZfH5ObhMl6aVFQKpsBCwVCu5Tv5cGfJyQjYm3RPhP580DwOmFxqgqMRJKnQVecbCFwt65j4qyg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeGNz3ctDRTxyRHUfN1ZYf9Z6FHQ5YPw+wfM2dtXvZamRrgDAp
	1BmvEAUpHD5V6ryOgNIQ7/xSDULW/6QoPHcEqaZbRGVWW++eVssExQk2
X-Gm-Gg: ASbGncsvYmz7biqlbncuB6Mz2H7WvZMpyWSJph1vwOko0Lfk/s5wJP1FOj2nSW25erx
	Mwwx6zzqgaO+IJgXs5v5oCwAgjCicsZV2+NiiK8SGCv88HvScSQ9+pUgGs8OB94sWzCe7zgZSII
	7tAAbPAbGLJElfGky+yeel/bVDKvF4q7F1mMWsMlyIL0UtGOlNAuyEsWTiJ6MLb27oBhTwdm0tU
	NSte/8ueWipD6nJSMhECtKMSFhwNtH2tuMsjhMnC6+gPTmY+dRKBC+gx1t7ZIj6usv7MO2tMaW3
	SFGfO3cXczZFwlBtd6g4A1u0pQ4Goe87jJhxBFS/bxQKLSmCRKuyL1MTotAWHkodydq5sja2yhy
	uHYVYXRLRJ5HLHWJeok2wlhduA4iqCCZ1Sw5jKYaOsw0/31D62qwSnsuc76Sh2iq6NsJgdG1V+V
	MEo0N0HlQQJsUanr+7Ubj3ty5UhJz9CTNOy813RqrHso9BiVI=
X-Google-Smtp-Source: AGHT+IEgQH0msCHiVzHV+d8YzyD3HqSCXx1QsPYOXJzvXxz33aUBjirYOiPA40nONYGL+LZM3LTqYA==
X-Received: by 2002:a05:6402:3482:b0:640:c394:5a4 with SMTP id 4fb4d7f45d1cf-64554674c1cmr22514354a12.16.1764255319905;
        Thu, 27 Nov 2025 06:55:19 -0800 (PST)
Message-ID: <3dfd6d2d-fb56-4ecd-a86b-8c6068b2e470@gmail.com>
Date: Thu, 27 Nov 2025 16:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [4.21] REGRESSION: [PATCH] xen/credit2: factor in previous active
 unit's credit in csched2_runtime()
To: Koichiro Den <den@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: dfaggioli@suse.com, jgross@suse.com, gwd@xenproject.org,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>,
 Julien Grall <julien@xen.org>
References: <20250621141411.890250-1-den@valinux.co.jp>
Content-Language: en-US
From: Grygorii S <gragst.linux@gmail.com>
In-Reply-To: <20250621141411.890250-1-den@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

On 21.06.25 17:14, Koichiro Den wrote:
> When a running unit is about to be scheduled out due to a competing unit
> with the highest remaining credit, the residual credit of the previous
> unit is currently ignored in csched2_runtime() because it hasn't yet
> been reinserted into the runqueue.
> 
> As a result, two equally weighted, busy units can often each be granted
> almost the maximum possible runtime (i.e. consuming CSCHED2_CREDIT_INIT
> in one shot) when only those two are active. In broad strokes two units
> switch back and forth every 10ms (CSCHED2_MAX_TIMER). In contrast, when
> more than two busy units are competing, such coarse runtime allocations
> are rarely seen, since at least one active unit remains in the runqueue.
> 
> To ensure consistent behavior, have csched2_runtime() take into account
> the previous unit's latest credit when it still can/wants to run.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> ---
>   xen/common/sched/credit2.c | 28 +++++++++++++++++++++-------
>   1 file changed, 21 insertions(+), 7 deletions(-)
> 

We observe regression on ARM64 with this patch.
commit ae648e9f8013 ("xen/credit2: factor in previous active unit's credit in csched2_runtime()")

general observation:
  This commit causes Linux guest boot time increase  >5 times for some of our the credit2
  specific tests.
  Reverting it makes issue gone.

  - normal log
    (XEN) DOM1: [    6.496166] io scheduler bfq registered
    ...
    (XEN) DOM1: [    9.845108] Freeing unused kernel memory: 9216K
    (XEN) DOM1: [    9.874792] Run /init as init process
    (XEN) sched_smt_power_savings: disabled
    (XEN) NOW=16800131328

  - failed log
    (XEN) DOM1: [   37.281776] io scheduler bfq registered
    (XEN) DOM1: [   61.856512] EINJ: ACPI disabled.
    test: timed out

Run Details:
  Platform: ARM64 (Device Tree)
  Execution platform: qemu 6.0 (2 pCPU, 2G)
  Boot: dom0less, 1 domain (2 vCPU)
  Command line: "console=dtuart guest_loglvl=debug conswitch=ax"

  Dom0less cfg:
     chosen {
         xen,xen-bootargs = "console=dtuart guest_loglvl=debug conswitch=ax";
         #size-cells = <0x00000002>;
         #address-cells = <0x00000002>;
         stdout-path = "/pl011@9000000";
         kaslr-seed = <0x5a7b5649 0x9122e194>;
         cpupool_0 {
             cpupool-sched = "credit2";
             cpupool-cpus = <0x00008001>;
             compatible = "xen,cpupool";
             phandle = <0xfffffffe>;
         };
         domU0 {
             domain-cpupool = <0xfffffffe>;
             vpl011;
             cpus = <0x00000002>;
             memory = <0x00000000 0x00040000>;
             #size-cells = <0x00000002>;
             #address-cells = <0x00000002>;
             compatible = "xen,domain";
             module@42E00000 {
                 reg = <0x00000000 0x42e00000 0x00000000 0x000f1160>;
                 compatible = "multiboot,ramdisk", "multiboot,module";
             };
             module@40400000 {
                 bootargs = "console=ttyAMA0";
                 reg = <0x00000000 0x40400000 0x00000000 0x02920000>;
                 compatible = "multiboot,kernel", "multiboot,module";
             };
         };
     };

Investigation:
  It was narrowed down to a specific configuration with cpupool assigned to the domain (100% reproducible):
  Host has 2 pCPU
  Domain has 2 vCPU
  cpupool_0 has 1 pCPU (cpu@1 credit2)
  domain <- cpupool_0

  if Domain is assigned 1 vCPU - no issues.
  if cpupool_0 is assigned 2 pCPU -  no issues (seems slower a bit, but it is on a error  margin level)

I'd be appreciated for any help with this (or revert :().

-- 
Best regards,
-grygorii

