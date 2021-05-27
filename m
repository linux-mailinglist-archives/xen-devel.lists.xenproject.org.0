Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B663392B17
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 11:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132949.247923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmCax-000492-8G; Thu, 27 May 2021 09:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132949.247923; Thu, 27 May 2021 09:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmCax-00046O-4L; Thu, 27 May 2021 09:46:27 +0000
Received: by outflank-mailman (input) for mailman id 132949;
 Thu, 27 May 2021 09:46:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmCav-00041T-LM
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 09:46:25 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9eb8b082-cef8-4f80-97fe-e8d01bdf6b68;
 Thu, 27 May 2021 09:46:24 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8F3341FD2A;
 Thu, 27 May 2021 09:46:23 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 65C3711A98;
 Thu, 27 May 2021 09:46:23 +0000 (UTC)
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
X-Inumbo-ID: 9eb8b082-cef8-4f80-97fe-e8d01bdf6b68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622108783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QId8BT6DxwCBl1FQmEvd9QHkNqykfSxBrDNbOJEgaEc=;
	b=BrJ14tw6LA0TGoEGyrn/LA6JzZwU1ngVfz9ggwQS62E3KAVpxGf+YCP4KNjR2hPM08CUFP
	G1A8JWgaBV3UdOcAvV9/fu7PaurzhLsZH+WbVoBhat+Jsq7wgGH9+ZoEpEoESQk/BkeEbj
	fdXkIgW+u2WMT5C9u36UG+YP6MB9//A=
Subject: Re: [PATCH 12/13] xenpm: Add set-cpufreq-hwp subcommand
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-13-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <641bb656-ab47-5125-3660-fb9aa342800c@suse.com>
Date: Thu, 27 May 2021 11:46:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-13-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> @@ -1309,6 +1328,226 @@ void disable_turbo_mode(int argc, char *argv[])
>                  errno, strerror(errno));
>  }
>  
> +/*
> + * Parse activity_window:NNN{us,ms,s} and validate range.
> + *
> + * Activity window is a 7bit mantissa (0-127) with a 3bit exponent (0-7) base
> + * 10 in microseconds.  So the range is 1 microsecond to 1270 seconds.  A value
> + * of 0 lets the hardware autonomously select the window.
> + *
> + * Return 0 on success
> + *       -1 on error
> + *        1 Not activity_window. i.e. try parsing as another argument
> + */
> +static int parse_activity_window(xc_set_hwp_para_t *set_hwp, char *p)
> +{
> +    char *param = NULL, *val = NULL, *suffix = NULL;
> +    unsigned int u;
> +    unsigned int exponent = 0;
> +    unsigned int multiplier = 1;
> +    int ret;
> +
> +    ret = sscanf(p, "%m[a-z_A-Z]:%ms", &param, &val);

I have to confess that I first needed to look up availability of the
m modifier. It looks to be in POSIX.1-2008, but not in C11 and older.
I'm therefore not sure if you can legitimately use it; I've not been
able to spot pre-existing uses throughout tools/.

Also, following the naming of other options of this tool (including
the new set-cpufreq-hwp subcommand you add here), instead of _
options should use - (and the pattern here and in the other similar
sscanf() further down then wants adjusting).

> +    if ( ret != 2 )
> +    {
> +        return -1;

No error message at all in this case?

> +    }
> +
> +    if ( strncasecmp(param, "act", 3) != 0 )
> +    {
> +        ret = 1;
> +
> +        goto out;
> +    }
> +
> +    free(param);
> +    param = NULL;
> +
> +    ret = sscanf(val, "%u%ms", &u, &suffix);

Can't you parse this right in the first sscanf()?

> +    if ( ret != 1 && ret != 2 )
> +    {
> +        fprintf(stderr, "invalid activity window: %s\n", val);
> +
> +        ret = -1;
> +
> +        goto out;
> +    }
> +
> +    if ( ret == 2 && suffix )

The help text doesn't clarify what an omitted suffix means; it's
unambiguous only when the value is zero. (While looking at that I
also started wondering whether the range there starting at 0us is
actually appropriate - the range really starts at 1us afaict, with
0 having special meaning.)

> +    {
> +        if ( strcasecmp(suffix, "s") == 0 )
> +        {
> +            multiplier = 1000 * 1000;
> +            exponent = 6;
> +        }
> +        else if ( strcasecmp(suffix, "ms") == 0 )
> +        {
> +            multiplier = 1000;
> +            exponent = 3;
> +        }
> +        else if ( strcasecmp(suffix, "us") == 0 )
> +        {
> +            multiplier = 1;
> +            exponent = 0;
> +        }
> +        else
> +        {
> +            fprintf(stderr, "invalid activity window units: %s\n", suffix);

I think you want to generally quote %s in such cases, to make clear
what is actually part of a malformed string.

> +            ret = -1;
> +            goto out;
> +        }
> +    }
> +
> +    if ( u > 1270 * 1000 * 1000 / multiplier )
> +    {
> +        fprintf(stderr, "activity window %s too large\n", val);
> +
> +        ret = -1;
> +        goto out;
> +    }
> +
> +    /* looking for 7 bits of mantissa and 3 bits of exponent */
> +    while ( u > 127 )

Prior to this loop, don't you need to multiply by "multiplier"?

> +    {
> +        u /= 10;

Fractions get silently chopped off - may want spelling out in
the help text.

> +        exponent += 1;
> +    }
> +
> +    set_hwp->activity_window = ( exponent & 0x7 ) << 7 | ( u & 0x7f );

Excess blanks inside parentheses again.

> +static int parse_hwp_opts(xc_set_hwp_para_t *set_hwp, int *cpuid,
> +                          int argc, char *argv[])
> +{
> +    int i = 0;
> +
> +    if ( argc < 1 )
> +        return -1;
> +
> +    if ( parse_cpuid_non_fatal(argv[i], cpuid) == 0 )
> +    {
> +        i++;
> +    }

Unnecessary braces again, the more that you ...

> +    if ( i == argc )
> +        return -1;

... don't have any here.

> +    if ( strcasecmp(argv[i], "powersave") == 0 )
> +    {
> +        set_hwp->set_params = XEN_SYSCTL_HWP_SET_PRESET_POWERSAVE;
> +        i++;
> +    }
> +    else if ( strcasecmp(argv[i], "performance") == 0 )
> +    {
> +        set_hwp->set_params = XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE;
> +        i++;
> +    }
> +    else if ( strcasecmp(argv[i], "balance") == 0 )
> +    {
> +        set_hwp->set_params = XEN_SYSCTL_HWP_SET_PRESET_BALANCE;
> +        i++;
> +    }
> +
> +    for ( ; i < argc; i++)
> +    {
> +        unsigned int val;
> +        char *param;
> +        int ret;
> +
> +        ret = parse_activity_window(set_hwp, argv[i]);
> +        switch ( ret )
> +        {
> +        case -1:
> +            return -1;
> +        case 0:
> +            continue;
> +            break;

Why "break" after "continue"? I can see compilers legitimately warning
in such a case.

> +        case 1:

This may better be "default:", or could be omitted altogether. Or
alternatively you may want to have a "default:" with assert().

> +            /* try other parsing */
> +            break;
> +        }
> +
> +        /* sscanf can't handle split on ':' for "%ms:%u'  */
> +        ret = sscanf(argv[i], "%m[a-zA-Z_]:%u", &param, &val);
> +        if ( ret != 2 )
> +        {
> +            fprintf(stderr, "%s is an invalid hwp parameter.\n", argv[i]);

Outside of this function you omit full stops from error messages.
Elsewhere in the tool full stops are also absent except in two or
three deprecation warnings. Hence I think you want to drop them
from messages in this function.

> +            return -1;
> +        }
> +
> +        if ( val > 255 )
> +        {
> +            fprintf(stderr, "%s value %u is out of range.\n", param, val);
> +            return -1;
> +        }
> +
> +        if ( strncasecmp(param, "min", 3) == 0 )
> +        {
> +            set_hwp->minimum = val;
> +            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_MINIMUM;
> +        }
> +        else if ( strncasecmp(param, "max", 3) == 0 )
> +        {
> +            set_hwp->maximum = val;
> +            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_MAXIMUM;
> +        }
> +        else if ( strncasecmp(param, "des", 3) == 0 )
> +        {
> +            set_hwp->desired = val;
> +            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_DESIRED;
> +        }
> +        else if ( strncasecmp(param, "ene", 3) == 0 )
> +        {
> +            set_hwp->energy_perf = val;
> +            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_ENERGY_PERF;
> +        }

While I can see the point of limiting to 3 characters, you would
better not accept longer but e.g. typoed strings.

> +        else
> +        {
> +            fprintf(stderr, "%s is an invalid parameter\n.", param);
> +            return -1;
> +        }
> +
> +        free(param);
> +    }
> +
> +    return 0;

Should you perhaps return an error here if set_hwp->set_params is
still zero?

> +}
> +
> +static void hwp_set_func(int argc, char *argv[])
> +{
> +    xc_set_hwp_para_t set_hwp = {};
> +    int cpuid = -1;
> +    int i = 0;
> +
> +    if ( parse_hwp_opts(&set_hwp, &cpuid, argc, argv) )
> +    {
> +        fprintf(stderr, "Missing, excess, or invalid argument(s)\n");

Isn't this redundant with earlier logged messages, which are also
more specific (with the one exception noted)?

Jan

