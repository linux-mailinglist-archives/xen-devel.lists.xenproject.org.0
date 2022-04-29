Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5928A515EB7
	for <lists+xen-devel@lfdr.de>; Sat, 30 Apr 2022 17:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317062.537792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkp8e-0001eC-JP; Sat, 30 Apr 2022 15:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317062.537792; Sat, 30 Apr 2022 15:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkp8e-0001cK-Fx; Sat, 30 Apr 2022 15:36:04 +0000
Received: by outflank-mailman (input) for mailman id 317062;
 Fri, 29 Apr 2022 09:22:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47nD=VH=gmail.com=sergei.shtylyov@srs-se1.protection.inumbo.net>)
 id 1nkMpv-00046R-D5
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 09:22:51 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb504a23-c79d-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 11:22:42 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id bu29so13029540lfb.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Apr 2022 02:22:49 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.73.25])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a196741000000b0046bc4be1d60sm192072lfj.123.2022.04.29.02.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 02:22:48 -0700 (PDT)
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
X-Inumbo-ID: eb504a23-c79d-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bhPxd6svpKOboxST/6guS4MOSMze/71rIJIgOQA8rZo=;
        b=CcHlI3Au6GCo1UVzpXVov/h1wYElTNB9KLySGMMq2ve/a+TtvK5YlNIE1buiqFG4Nl
         u/yJNPitTZt8sIeOJjB65Ui/1u355v1A2H7rivfKbBLHtHs+twE1aeJijeY6w74gk/C9
         beognAtlmiiMUVoRPY2P2xBjOD5kn8WzXajIeBHjp2IbcVFILkaLGvvcgQymLNFVLX7W
         O2NCAewH21dEqhwgYIy8zCJ1hXEDN8sGRLk/bc4Oj4c5AC8PD4Xjq19cf3SOi69El8Xe
         CE7Bw/RGpPKDZ+W4HqGQMjQxaF5kblB25nziyJo7yUSAzUuWVoHRSngnqULHAZHmFVOo
         K43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bhPxd6svpKOboxST/6guS4MOSMze/71rIJIgOQA8rZo=;
        b=gDO8tT3U8pHr8MiqWpiRkQfzQdKr/FR8DFvuGPq5QR/t6SAe44LiRhv+M7e3D5vhrj
         IBPVqApijizeyyU6EALKPPSK0BgkTrAJGpUgBVhtQOzDsJzoLew05xf7/5MMFNWyO89X
         62f8Bzd1LZHccYdczhUBhTixpPeoJScuO4fGgKcIcUgosgrhbQJjvmBBJcySBXBY47w2
         7QY7Spig3dPjeyxOeiGSLEZ8lJSzs8ANsc+c/1LvnAaT88GiQ269m0B6eFSNAQPdwkcp
         157Msy2TkdXUcZG6fyz9vr8FWDzoUyHMa+JOzLgbFQIOw6mWxWoS5vh4XIS3bn9SF/6g
         D4WA==
X-Gm-Message-State: AOAM532eYctRb4gXAUv8wa6Whuw7DoCWH+JJ+/arYyBOWrhhb3RBTRwe
	2ix+ZMETdaUlyqNKwikcFDo=
X-Google-Smtp-Source: ABdhPJzFja3bmADODH1fdpoqaNJXuuCGiOo+I2PKC036x77KFxdRqfAwbMVEMu8UhB/GID87ZxayFg==
X-Received: by 2002:a05:6512:3ba0:b0:472:49f2:a752 with SMTP id g32-20020a0565123ba000b0047249f2a752mr1049387lfv.374.1651224168844;
        Fri, 29 Apr 2022 02:22:48 -0700 (PDT)
Subject: Re: [PATCH 17/30] tracing: Improve panic/die notifiers
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
 fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
 corbet@lwn.net, d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com,
 dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org,
 mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
 mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
 peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
 vkuznets@redhat.com, will@kernel.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-18-gpiccoli@igalia.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <b8771b37-01f5-f50b-dbb3-9db4ee26e67e@gmail.com>
Date: Fri, 29 Apr 2022 12:22:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220427224924.592546-18-gpiccoli@igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello!

On 4/28/22 1:49 AM, Guilherme G. Piccoli wrote:

> Currently the tracing dump_on_oops feature is implemented
> through separate notifiers, one for die/oops and the other
> for panic. With the addition of panic notifier "id", this
> patch makes use of such "id" to unify both functions.
> 
> It also comments the function and changes the priority of the
> notifier blocks, in order they run early compared to other
> notifiers, to prevent useless trace data (like the callback
> names for the other notifiers). Finally, we also removed an
> unnecessary header inclusion.
> 
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  kernel/trace/trace.c | 57 +++++++++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 25 deletions(-)
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index f4de111fa18f..c1d8a3622ccc 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
[...]
> @@ -9767,38 +9766,46 @@ static __init int tracer_init_tracefs(void)
>  
>  fs_initcall(tracer_init_tracefs);
>  
> -static int trace_panic_handler(struct notifier_block *this,
> -			       unsigned long event, void *unused)
> +/*
> + * The idea is to execute the following die/panic callback early, in order
> + * to avoid showing irrelevant information in the trace (like other panic
> + * notifier functions); we are the 2nd to run, after hung_task/rcu_stall
> + * warnings get disabled (to prevent potential log flooding).
> + */
> +static int trace_die_panic_handler(struct notifier_block *self,
> +				unsigned long ev, void *unused)
>  {
> -	if (ftrace_dump_on_oops)
> +	int do_dump;

   bool?

> +
> +	if (!ftrace_dump_on_oops)
> +		return NOTIFY_DONE;
> +
> +	switch (ev) {
> +	case DIE_OOPS:
> +		do_dump = 1;
> +		break;
> +	case PANIC_NOTIFIER:
> +		do_dump = 1;
> +		break;

   Why not:

	case DIE_OOPS:
	case PANIC_NOTIFIER:
		do_dump = 1;
		break;

> +	default:
> +		do_dump = 0;
> +		break;
> +	}
> +
> +	if (do_dump)
>  		ftrace_dump(ftrace_dump_on_oops);
> -	return NOTIFY_OK;
> +
> +	return NOTIFY_DONE;
>  }
[...]

MBR, Sergey

