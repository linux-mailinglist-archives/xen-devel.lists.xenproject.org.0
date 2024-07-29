Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1176A94010E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 00:32:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767193.1177786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYYuS-0007GH-UA; Mon, 29 Jul 2024 22:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767193.1177786; Mon, 29 Jul 2024 22:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYYuS-0007EN-RK; Mon, 29 Jul 2024 22:32:04 +0000
Received: by outflank-mailman (input) for mailman id 767193;
 Mon, 29 Jul 2024 22:32:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cV/c=O5=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1sYYuR-0007EH-Qd
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 22:32:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f7f620a-4dfa-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 00:32:01 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so13781145e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 15:32:01 -0700 (PDT)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42805730d92sm193065265e9.3.2024.07.29.15.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 15:32:00 -0700 (PDT)
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
X-Inumbo-ID: 5f7f620a-4dfa-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20230601.gappssmtp.com; s=20230601; t=1722292321; x=1722897121; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ayqfIiq+/6WGn7TchExAmRzOwbbAd8qYjwmC5vSoL+A=;
        b=XMQrUP2jtIFhVvVczfIZ+Hqrz95EyQuApoLFjipfsnj42iTB4PUjxRArY7V4Vn5Qsd
         Dmr0OqQeWtxdpxoa+W4njoJyEPAZ2lk96Ln33ew5OYQEu3AFqsUATlB5ioop9CmYNGTX
         7Ec+kVUv9UY8vFbla4sjYmCWMk0Xtg94k0rzs9WZhc9WlnPSDEj2Vp9MDKBP69fYg3ce
         r1qZYHZiPtvH+Cos6vL9PSnPLZymTRY5TKGcYFdoL3EZO8r3IEhpmusHq6vK9XdB8E4x
         9lhhj1FhfwteL3picim4bFzioY9PwCL9gIupfg3qAtVy+A2qrUbngR4v8TK1ybqrXP8p
         WDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722292321; x=1722897121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ayqfIiq+/6WGn7TchExAmRzOwbbAd8qYjwmC5vSoL+A=;
        b=TrCoVwAUB/VUmZp1PubUX8YcHMrDL1Tbe6oraPlLLmfa813ciB0L/RqkP04uereU83
         x0Dvb03shZJ8A1qOeUbvgybiHVjZthxHSiaJJIlZ3nSnfWDZ317m8wBzGURDIyEGmdze
         mpry4D0yYmooNuYD81Ism6LPWugkYI6D8QbKcT+byjYS/7rXTfxihZ0Jmi9ImaFwXKrP
         MPmlDzPG7NoiQxpgqCzhUwaucEE7+ItZ0H2CflxsQ24hwHdsnjXd8aNTacQhJt0pNxrh
         1OZ2sHPa8j05Uyq3toVsI+72puWPjSkA73NVQdmYQB2g9pRYK3OXPOVJOIYMWs3bXToB
         3eqQ==
X-Gm-Message-State: AOJu0YyuUcLJxRnyHsV25fLwwr06bfQ3IfwXlcl9OJwrBXryBVMPOEii
	qq5DZz1ZVM2K+iLCnH9fpk/240eQIxlKQQNI4xG8O6xhBPNrQUQn36EktDUyAcSzAe69FfUwJw7
	cZuE=
X-Google-Smtp-Source: AGHT+IEp5e8/zFHOhoNtRQU4WCOEPFgeVqrizO8CnpYn8yEEOIOlkB0IOdRs7/X9nwqq2Zovxn0OLw==
X-Received: by 2002:a05:600c:a41:b0:428:9c0:2ad with SMTP id 5b1f17b1804b1-4282445d0c0mr496115e9.18.1722292320427;
        Mon, 29 Jul 2024 15:32:00 -0700 (PDT)
Message-ID: <500adb55-4927-4876-aa22-3269538bb4c7@rabbit.lu>
Date: Tue, 30 Jul 2024 00:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: add suspend-to-ram and resume subcommands
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <4e9f3590be9f19edb87e05c7b7c2efeae8863109.1709190010.git.slack@rabbit.lu>
From: zithro <slack@rabbit.lu>
In-Reply-To: <4e9f3590be9f19edb87e05c7b7c2efeae8863109.1709190010.git.slack@rabbit.lu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Added my S-o-B (no other change).

PS: re-sent to account for Anthony mail address change

On 29 Feb 2024 08:00, zithro / Cyril Rébert wrote:
> The xl command doesn't provide suspend/resume, so add them :
>    xl suspend-to-ram <Domain>
>    xl resume <Domain>
> 
> This patch follows a discussion on XenDevel: when you want the
> virtualized equivalent of "sleep"-ing a host, it's better to
> suspend/resume than to pause/unpause a domain.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Suggested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
> 
> ---
> - Tested on v4.17, x86
> - the function "libxl_domain_resume" is called like libvirt does, so
>    using a "co-operative resume", but I don't know what it means (:
> - there may be a problem with the words resume <-> restore, like
>    for "LIBXL_HAVE_NO_SUSPEND_RESUME"
> - for the docs, I only slightly adapted a copy/paste from xl pause ...
> ---
> ---
>   docs/man/xl.1.pod.in    | 10 ++++++++++
>   tools/xl/xl.h           |  2 ++
>   tools/xl/xl_cmdtable.c  | 10 ++++++++++
>   tools/xl/xl_vmcontrol.c | 36 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 58 insertions(+)
> 
> diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
> index bed8393473..63d80f1449 100644
> --- a/docs/man/xl.1.pod.in
> +++ b/docs/man/xl.1.pod.in
> @@ -682,6 +682,10 @@ Pass the VNC password to vncviewer via stdin.
>   
>   =back
>   
> +=item B<resume> I<domain-id>
> +
> +Resume a domain, after having been suspended to RAM.
> +
>   =item B<save> [I<OPTIONS>] I<domain-id> I<checkpointfile> [I<configfile>]
>   
>   Saves a running domain to a state file so that it can be restored
> @@ -760,6 +764,12 @@ in response to this event.
>   
>   =back
>   
> +=item B<suspend-to-ram> I<domain-id>
> +
> +Suspend a domain to RAM.  When in a suspended state the domain will still
> +consume allocated resources (such as memory), but will not be eligible for
> +scheduling by the Xen hypervisor. It is in a shutdown state, but not dying.
> +
>   =item B<sysrq> I<domain-id> I<letter>
>   
>   Send a <Magic System Request> to the domain, each type of request is
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index 9c86bb1d98..716ad32423 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -133,6 +133,8 @@ int main_migrate(int argc, char **argv);
>   int main_dump_core(int argc, char **argv);
>   int main_pause(int argc, char **argv);
>   int main_unpause(int argc, char **argv);
> +int main_suspendtoram(int argc, char **argv);
> +int main_resume(int argc, char **argv);
>   int main_destroy(int argc, char **argv);
>   int main_shutdown(int argc, char **argv);
>   int main_reboot(int argc, char **argv);
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index 62bdb2aeaa..1382282252 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -136,6 +136,16 @@ const struct cmd_spec cmd_table[] = {
>         "Unpause a paused domain",
>         "<Domain>",
>       },
> +    { "suspend-to-ram",
> +      &main_suspendtoram, 0, 1,
> +      "Suspend a domain to RAM",
> +      "<Domain>",
> +    },
> +    { "resume",
> +      &main_resume, 0, 1,
> +      "Resume a domain from RAM",
> +      "<Domain>",
> +    },
>       { "console",
>         &main_console, 0, 0,
>         "Attach to domain's console",
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 98f6bd2e76..ba45f89c5a 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -42,6 +42,16 @@ static void unpause_domain(uint32_t domid)
>       libxl_domain_unpause(ctx, domid, NULL);
>   }
>   
> +static void suspend_domain_toram(uint32_t domid)
> +{
> +    libxl_domain_suspend_only(ctx, domid, NULL);
> +}
> +
> +static void resume_domain(uint32_t domid)
> +{
> +    libxl_domain_resume(ctx, domid, 1, NULL);
> +}
> +
>   static void destroy_domain(uint32_t domid, int force)
>   {
>       int rc;
> @@ -82,6 +92,32 @@ int main_unpause(int argc, char **argv)
>       return EXIT_SUCCESS;
>   }
>   
> +int main_suspendtoram(int argc, char **argv)
> +{
> +    int opt;
> +
> +    SWITCH_FOREACH_OPT(opt, "", NULL, "suspend-to-ram", 1) {
> +        /* No options */
> +    }
> +
> +    suspend_domain_toram(find_domain(argv[optind]));
> +
> +    return EXIT_SUCCESS;
> +}
> +
> +int main_resume(int argc, char **argv)
> +{
> +    int opt;
> +
> +    SWITCH_FOREACH_OPT(opt, "", NULL, "resume", 1) {
> +        /* No options */
> +    }
> +
> +    resume_domain(find_domain(argv[optind]));
> +
> +    return EXIT_SUCCESS;
> +}
> +
>   int main_destroy(int argc, char **argv)
>   {
>       int opt;

-- 
++
zithro / Cyril


