Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9B18D2252
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 19:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731269.1136695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC0U8-0006Pp-9u; Tue, 28 May 2024 17:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731269.1136695; Tue, 28 May 2024 17:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC0U8-0006No-7G; Tue, 28 May 2024 17:19:40 +0000
Received: by outflank-mailman (input) for mailman id 731269;
 Tue, 28 May 2024 17:19:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bNtp=M7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sC0U6-0006MV-P7
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 17:19:38 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74ac3f19-1d16-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 19:19:36 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-79305314956so79016585a.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 10:19:36 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac07100a89sm45661156d6.68.2024.05.28.10.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 10:19:34 -0700 (PDT)
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
X-Inumbo-ID: 74ac3f19-1d16-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716916775; x=1717521575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TPDO1mb7r21QsV8AV9LX1kCPFbWEzhggozge8QMrGBY=;
        b=ZcS0HHaCra+SMPc2ylkz2CCgkEPyBp2Ycf9HttMq/bUlhqNqwyPBIQX50fdomrQg4f
         vy5dbp3V5nTU7bFIXWi2hXGgRi9hZ8XVWok3u3VDhwuHhpO10q9dHthqPDQ4lX4XA7Bf
         qfseyJvtapiRLmEXTNE7vc0Ywg1euDisAw0ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716916775; x=1717521575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPDO1mb7r21QsV8AV9LX1kCPFbWEzhggozge8QMrGBY=;
        b=GRYCqXZmi5HlhEpPKjCZ1HdRo2nV3+9k+Pyavc8BbjbS8GVvfKpdaHWzW+USHX6cwc
         pAua9xvrJBhvrPpohQQ4nspbV+PCtfcmZpsD0hPqXPtt7NsyTZfx4cSUvf9+gz9wbKGo
         LQ7c/t6Immg1B1wnBFa1trtg91Z7tRWqVFXd51tcDxC+dQHVS0y0+gqQVboUJvziOlBL
         PZHif4h1o3F9yfW8kmOJtOPsEPYUL8XhduEqZy4vjf5hV+F4DTh40D8b1tOlr31+xa0S
         77ES+xLjKrV7BPgF0ji+vnOkMqJqk5hx2/HoCkY5wxOvH4lNE+UENPOScv9x+Hg+iR14
         dQ3g==
X-Forwarded-Encrypted: i=1; AJvYcCUJPLwrsbDX3UpZPlQiEaLnF4gRTByVkNk2EcIRvABVg0r9RhWkD6gNoKlflN1sg5uFt38ick3FmZ6HN5HxkdXv9ztaWGb30PPpL1HLNDU=
X-Gm-Message-State: AOJu0YwR9ZTvwCfUgXMetS/8bavI4onxMgFnNZH1PVqNNd7tUqeRg5CR
	Fit0Ykw2/WzDdfueNyCgO9nIymU7wGOgZdc5cS9LeS+aVvpk1g8/5NmUsZLYJZE=
X-Google-Smtp-Source: AGHT+IFqTiPCLeyEZbfisNnGoazSQe4xweRRZ+7QCr6O3UR25XxhV/sswJu/nwAGQEl8C4HmetC/5w==
X-Received: by 2002:a05:6214:4345:b0:6a8:f00e:cfb0 with SMTP id 6a1803df08f44-6abcd0de75fmr168451756d6.47.1716916774817;
        Tue, 28 May 2024 10:19:34 -0700 (PDT)
Message-ID: <3319c42c-3eb5-47ae-b722-952583829cce@citrix.com>
Date: Tue, 28 May 2024 18:19:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] x86/ucode: Utilize ucode_force and remove
 opt_ucode_allow_same
To: Fouad Hilly <fouad.hilly@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240528152943.3915760-1-fouad.hilly@cloud.com>
 <20240528152943.3915760-5-fouad.hilly@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240528152943.3915760-5-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2024 4:29 pm, Fouad Hilly wrote:
> Pass ucode_force to common micorocde checks and utilize it to allow for microcode downgrade
> or reapply the same version of the microcode.
> Update low level Intel and AMD to check for valid signature only. Any version checks is done
> at core.c.
> While adding ucode_force, opt_ucode_allow_same was removed.
> Remove opt_ucode_allow_same from documentation.
>
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
> ---
> [4]
> 1- As opt_ucode_allow_same is not required anymore, it has been removed while introducing ucode_force.
> 2- Apply the changes for both AMD and Intel.
> 3- Remove the mention of opt_ucode_allow_same from documentation.
> ---
>  docs/misc/xen-command-line.pandoc    | 7 +------
>  xen/arch/x86/cpu/microcode/amd.c     | 7 -------
>  xen/arch/x86/cpu/microcode/core.c    | 9 +++------
>  xen/arch/x86/cpu/microcode/intel.c   | 4 ----
>  xen/arch/x86/cpu/microcode/private.h | 2 --
>  5 files changed, 4 insertions(+), 25 deletions(-)
>
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 1dea7431fab6..a42ce1039fed 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2648,7 +2648,7 @@ performance.
>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>  
>  ### ucode
> -> `= List of [ <integer> | scan=<bool>, nmi=<bool>, allow-same=<bool> ]`
> +> `= List of [ <integer> | scan=<bool>, nmi=<bool> ]`
>  
>      Applicability: x86
>      Default: `nmi`
> @@ -2680,11 +2680,6 @@ precedence over `scan`.
>  stop_machine context. In NMI handler, even NMIs are blocked, which is
>  considered safer. The default value is `true`.
>  
> -'allow-same' alters the default acceptance policy for new microcode to permit
> -trying to reload the same version.  Many CPUs will actually reload microcode
> -of the same version, and this allows for easy testing of the late microcode
> -loading path.
> -
>  ### unrestricted_guest (Intel)
>  > `= <boolean>`
>  
> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
> index f76a563c8b84..4bcc79f1ab2d 100644
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -225,13 +225,6 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
>      if ( result == MIS_UCODE )
>          return -EINVAL;
>  
> -    /*
> -     * Allow application of the same revision to pick up SMT-specific changes
> -     * even if the revision of the other SMT thread is already up-to-date.
> -     */
> -    if ( result == OLD_UCODE )
> -        return -EEXIST;
> -

I'm afraid that because of the observation leading to 977d98e67c2e, I
see no option other than to plumb the force flag down into
apply_microcode().

This check cannot be deleted unconditionally, or we'll try downgrading
microcode even without the force flag being passed.

Unless we can fix the cacheing layer to not treat "I didn't load ucode
at boot" as "no idea of the symmetry of the system".

I'm unsure which of these two is going to be less ugly...

>      if ( check_final_patch_levels(sig) )
>      {
>          printk(XENLOG_ERR
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 8a9e744489b9..fc8ad8cfdd76 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -100,8 +100,6 @@ static bool __initdata ucode_scan;
>  /* By default, ucode loading is done in NMI handler */
>  static bool ucode_in_nmi = true;
>  
> -bool __read_mostly opt_ucode_allow_same;
> -
>  /* Protected by microcode_mutex */
>  static struct microcode_patch *microcode_cache;
>  
> @@ -128,8 +126,6 @@ static int __init cf_check parse_ucode(const char *s)
>  
>          if ( (val = parse_boolean("nmi", s, ss)) >= 0 )
>              ucode_in_nmi = val;
> -        else if ( (val = parse_boolean("allow-same", s, ss)) >= 0 )
> -            opt_ucode_allow_same = val;
>          else if ( !ucode_mod_forced ) /* Not forced by EFI */
>          {
>              if ( (val = parse_boolean("scan", s, ss)) >= 0 )
> @@ -583,6 +579,7 @@ static long cf_check microcode_update_helper(void *data)
>      struct ucode_buf *buffer = data;
>      unsigned int cpu, updated;
>      struct microcode_patch *patch;
> +    bool ucode_force = buffer->flags == XENPF_UCODE_FORCE;
>  
>      /* cpu_online_map must not change during update */
>      if ( !get_cpu_maps() )
> @@ -636,12 +633,12 @@ static long cf_check microcode_update_helper(void *data)
>                                    microcode_cache);
>  
>          if ( result != NEW_UCODE &&
> -             !(opt_ucode_allow_same && result == SAME_UCODE) )
> +             (!ucode_force || (result & ~SAME_UCODE)) )

What is "result & ~SAME_UCODE" trying to do?

~Andrew

