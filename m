Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14684F1D5
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 10:01:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678579.1055983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYMki-0005zV-Nv; Fri, 09 Feb 2024 09:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678579.1055983; Fri, 09 Feb 2024 09:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYMki-0005wp-Kn; Fri, 09 Feb 2024 09:00:56 +0000
Received: by outflank-mailman (input) for mailman id 678579;
 Fri, 09 Feb 2024 09:00:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSO/=JS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rYMkg-0005wi-Tr
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 09:00:54 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba2c5091-c729-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 10:00:53 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a38392b9917so89384166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 01:00:52 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 m9-20020a1709061ec900b00a3bb6de59b0sm552094ejj.95.2024.02.09.01.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 01:00:51 -0800 (PST)
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
X-Inumbo-ID: ba2c5091-c729-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707469252; x=1708074052; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qj6FdNIXA1BjepOCfn21bqPPzP2VkvH25TTBSp2baOo=;
        b=rFE4S9esGUwSS9t3d8I6fnethwPV+PPELosjuYUxqsKsB4oQ5xrTR7eGyLmD7DGEU8
         eN+IYlaF1J0Xyx1rffMR+A+r2IZwM7vbmuxh+/Y48RPD1MU2UuwgVWb4uZ/tW8/gQPeT
         XbCBR4EumfTS13uXwncDrF4zTsfyu6fVBhl0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707469252; x=1708074052;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qj6FdNIXA1BjepOCfn21bqPPzP2VkvH25TTBSp2baOo=;
        b=QVb61kUhmGNBwS34U8DU9qsnOt9CWlV3c7XewT+bqT+h7dJcW/B+kDV1bSm+oa+QRX
         oV+OAklPhT/jlflZYIlaS6m+3ZBkC3UNQhvclm6sD0aGPz3PNgbAyaqIRBgYpYpkKEaa
         GJIZyeRPpF8Gu8M3jBetNXxmsebfxdXppV+yPOsBYCTMl4sVhnm362Q3qXdSJ4mpigaf
         xBYY36VI3k2rvIU6SguJjT65hcvyLAuzLHROamuCNbipjglMlDXBNZPKRX6XHtXc6oKr
         OZLEfp6N7HbSmc6Gj9jc5wi/hrbdNTYhXeT4wwXwlc8rplw3fgFo9rCtH03x8Y55SC77
         NhlA==
X-Gm-Message-State: AOJu0YyCp+SYfx/y4UpUdy/4r11ro4kuSqMEQX455LhJk1ZmCG8HI3rL
	HSN+cQJgUfqlh34DvxGLCI3SmVz6MMMhdz1RfkyI2OubdeXR1ujvPqQtY0JEFQJ/5B3ehiC0QNm
	C
X-Google-Smtp-Source: AGHT+IGg8m7xhtES74BzUhWIq2bHc3n3L+eV/1P9cIxLX49F2jgQzblJ/3kqh+ei1VcL2me3hktlfg==
X-Received: by 2002:a17:906:2657:b0:a38:3282:baf0 with SMTP id i23-20020a170906265700b00a383282baf0mr669401ejc.75.1707469252095;
        Fri, 09 Feb 2024 01:00:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZo9ujKjFzdHM3zOvmA2BwAfIP8wwKBYYIbcl0Jpkr18V4kN3jXvjco1b/zw7VUmg2a0AkK3XtK8j0PG0CEAOA/U5EAiFyQK78bzf73gxrkTup
Date: Fri, 9 Feb 2024 10:00:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 1/7] VT-d: parse ACPI "SoC Integrated Address Translation
 Cache Reporting Structure"s
Message-ID: <ZcXpwtIDZ5RobRtw@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <b5a58dee-9a4c-4833-be59-b52c62f7137d@suse.com>
 <ZcScJvAhI7CRJhAZ@macbook>
 <a96fe270-15f1-492e-92d6-2a7ceda11dec@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a96fe270-15f1-492e-92d6-2a7ceda11dec@suse.com>

On Thu, Feb 08, 2024 at 04:29:34PM +0100, Jan Beulich wrote:
> On 08.02.2024 10:17, Roger Pau Monné wrote:
> > On Mon, Feb 05, 2024 at 02:55:17PM +0100, Jan Beulich wrote:
> >> This is a prereq to us, in particular, respecting the "ATC required"
> >> flag.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Should we check scope entries for appropriate types? (If so, then also
> >> for e.g. ATSR.)
> > 
> > Hm, I guess we could do so in acpi_parse_dev_scope() since that
> > function already gets passed a 'type' argument.
> 
> Right, I transiently had it there, but then dropped it again for being
> inconsistent with what we have right now. I'll try to remember to add
> another patch.

No strict requirement - but since it's on the spec we might as well
try to honor it.

> >> +        {
> >> +            dprintk(XENLOG_WARNING VTDPREFIX,
> >> +                    " Non-existent device (%pp) is reported in SATC scope!\n",
> >> +                    &PCI_SBDF(satcu->segment, b, d, f));
> >> +            ignore = true;
> > 
> > This is kind of reporting is incomplete: as soon as one device is
> > found the loop is exited and no further detection happens.  If we want
> > to print such information, we should do the full scan and avoid
> > exiting early when a populated device is detected.
> 
> Not sure I follow, but first of all - these are dprintk()s only, so
> meant to only help in dev environments. Specifically ...
> 
> >> +        }
> >> +        else
> >> +        {
> >> +            ignore = false;
> >> +            break;
> >> +        }
> >> +    }
> >> +
> >> +    if ( ignore )
> >> +    {
> >> +        dprintk(XENLOG_WARNING VTDPREFIX,
> >> +                " Ignore SATC for seg %04x as no device under its scope is PCI discoverable!\n",
> 
> ... this message is then issued only bogus entries were found. IOW
> when a real device was found, there's no real reason to report N
> other bogus ones, I think.

I guess it's a question of taste.  I do find it odd (asymmetric
maybe?) that we stop reporting non-existing devices once a valid
device is found.  Makes me wonder what's the point of reporting them
in the first place, if the list of non-existing devices is not
complete?

> Plus, whatever we change here ought to also / first change in
> register_one_rmrr().

I could live with those looking differently, or register_one_rmrr()
can be adjusted later.  Existing examples shouldn't be an argument to
not make new additions better.

But that's only if you agree the suggested changes make the code
better, if you prefer the current implementation then there's no point
in arguing whether we should keep register_one_rmrr() and the newly
introduce function similar enough.

> >> +    satcu = xzalloc(struct acpi_satc_unit);
> >> +    if ( !satcu )
> >> +        return -ENOMEM;
> >> +
> >> +    satcu->segment = satc->segment;
> >> +    satcu->atc_required = satc->flags & 1;
> > 
> > I would add this as a define in actbl2.h:
> > 
> > #define ACPI_DMAR_ATC_REQUIRED (1U << 0)
> > 
> > Or some such (maybe just using plain 1 is also fine).
> 
> I intended to do so, but strictly staying in line with what Linux has.
> To my surprise they use a literal number and have no #define. Hence I
> didn't add any either.

I would prefer the define unless you have strong objections, even if
that means diverging from Linux.

> >> +
> >> +    dev_scope_start = (const void *)(satc + 1);
> >> +    dev_scope_end   = (const void *)satc + header->length;
> >> +    ret = acpi_parse_dev_scope(dev_scope_start, dev_scope_end,
> >> +                               &satcu->scope, SATC_TYPE, satc->segment);
> >> +
> >> +    if ( !ret && satcu->scope.devices_cnt )
> >> +    {
> >> +        ret = register_one_satc(satcu);
> >> +        /*
> >> +         * register_one_satc() returns greater than 0 when a specified
> >> +         * PCIe device cannot be detected. To prevent VT-d from being
> >> +         * disabled in such cases, reset the return value to 0 here.
> >> +         */
> >> +        if ( ret > 0 )
> >> +            ret = 0;
> >> +    }
> >> +    else
> >> +        xfree(satcu);
> > 
> > You can safely use scope_devices_free() even if acpi_parse_dev_scope()
> > failed, so you could unify the freeing here, instead of doing it in
> > register_one_satc() also.
> 
> Moving that out of acpi_parse_dev_scope() would feel wrong - if a
> function fails, it would better not leave cleanup to its caller(s).

Given that the caller here is the one that did the allocation my
preference would be to also do the cleanup there - register_one_satc()
has no need to know what needs freeing, and allows unifying the
cleanup in a single place.

> > Also why not make register_one_satc() return a boolean instead of 0/1?
> 
> To leave room to also return errors, like register_one_rmrr() does.
> 
> For both of these aspects you raise: I'd really like to avoid these
> sibling functions going too much out of sync.

I could live with those going out-of-sync (or adjusted later), but only
if you think the suggestions are an improvement.

> >> @@ -817,6 +907,11 @@ static int __init cf_check acpi_parse_dm
> >>                  printk(VTDPREFIX "found ACPI_DMAR_RHSA:\n");
> >>              ret = acpi_parse_one_rhsa(entry_header);
> >>              break;
> >> +        case ACPI_DMAR_TYPE_SATC:
> >> +            if ( iommu_verbose )
> >> +                printk(VTDPREFIX "found ACPI_DMAR_SATC:\n");
> >> +            ret = acpi_parse_one_satc(entry_header);
> >> +            break;
> > 
> > I know the surrounding code doesn't use it, but readability would
> > benefit from adding a blank line after the break statement.
> 
> Well, yes, done so. I'm not generally in favor of introducing such
> inconsistencies, but it looks tolerable here. (In cases like this
> I do - and did here - consider this as an option, but in most cases
> I end up valuing uniform look slightly higher.)

 Yeah, overall I think it's an improvement if we go switching those as
 we modify the code for other reasons.

 Thanks, Roger.

