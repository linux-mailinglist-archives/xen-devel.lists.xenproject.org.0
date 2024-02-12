Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B701B851050
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 11:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679508.1056937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTDA-0003MW-JQ; Mon, 12 Feb 2024 10:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679508.1056937; Mon, 12 Feb 2024 10:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTDA-0003K3-Fg; Mon, 12 Feb 2024 10:06:52 +0000
Received: by outflank-mailman (input) for mailman id 679508;
 Mon, 12 Feb 2024 10:06:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IbWo=JV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rZTD9-0003Jw-8C
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 10:06:51 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7033cf91-c98e-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 11:06:50 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-410c804e933so6481855e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 02:06:50 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 u8-20020a056000038800b0033ae50e2c6asm6370248wrf.83.2024.02.12.02.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:06:49 -0800 (PST)
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
X-Inumbo-ID: 7033cf91-c98e-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707732409; x=1708337209; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBAtL6PJR+0fE4z+LXz79KwAgSwje9B6k+Smiv1M6RI=;
        b=PlTGrG+9C2/owH+a0UpvRgQAF6mGjH+sqCJFDwZZJDpfUTXxrROedb6cwlUtKLJtl/
         lFMTKcZ7UM0xcVHGqmkyJPPdCWfBIiIIMo06RLvTcnH8/PtDrpA+1QQOiioX6FU5GKtZ
         LbYgepy4WNZTMzP1MyK6szX5vaaTCbQu0CEE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707732409; x=1708337209;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BBAtL6PJR+0fE4z+LXz79KwAgSwje9B6k+Smiv1M6RI=;
        b=U0/r5pre4ice8+UyWUWkWqzI6ZYpaK1xFUgG4aa/SN1rzWeCu9I3L8WqokzB1qY4Ug
         k3Frib+vv8QWnt2bEmJqO2RfAgV02uyHjfTE3+fbM/OlXTmKCYPv2QzmMc+6ObZEUrx8
         bmwL4RW2uepR7hjMJVihU4pFxl9xnXkcLmKZFlR6z+WDshlkX3K4OsEt7T1o7bbu+QMU
         HobhBpp0IpzcOdvjD87u1UmmKNtDFiXCMcwi0OTFPkIUbA7EZwFAQDfkNwC7DZeJ8g5e
         mFpYV0d5GspgkLVGLUaHJEw2JmkOLzmaoHs21KqTJcRzqgV1mlJVli23cWGpklw/2yUw
         F3fA==
X-Gm-Message-State: AOJu0YwY2lhtSO94TvIAxB6WmHIX+PAMa4zudytd0HmQibrfhlBA5yHE
	FHcC8qHCPROjoLybXoaLLW7RQuluvq/I2RTJLOBxKG38ev8HesPGzX3PhVvFS/Y=
X-Google-Smtp-Source: AGHT+IEKKKFCjRii5wStWyhwJpjWmekFqTQkCxQt4mTmEblJSrWNBSaOWZj/LhgEZvUJDCdCtJ6d+A==
X-Received: by 2002:adf:a19a:0:b0:33b:3cc9:1e6e with SMTP id u26-20020adfa19a000000b0033b3cc91e6emr4732286wru.7.1707732409559;
        Mon, 12 Feb 2024 02:06:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXq9Kk/X13iYCumfzpiVJvVw5wL/nja6Mfk3a1MEP7C7kx5Ipl4H+1xQiZwU6jH82XQdw1ux6uHxJgHOtA7luhcAjOS/3/IXGL64Eix4wbMn98j
Date: Mon, 12 Feb 2024 11:06:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 1/7] VT-d: parse ACPI "SoC Integrated Address Translation
 Cache Reporting Structure"s
Message-ID: <ZcntuO3reX_HcYem@macbook>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <b5a58dee-9a4c-4833-be59-b52c62f7137d@suse.com>
 <ZcScJvAhI7CRJhAZ@macbook>
 <a96fe270-15f1-492e-92d6-2a7ceda11dec@suse.com>
 <ZcXpwtIDZ5RobRtw@macbook>
 <8715f268-be7b-43c6-bb55-4839427014f5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8715f268-be7b-43c6-bb55-4839427014f5@suse.com>

On Mon, Feb 12, 2024 at 10:32:00AM +0100, Jan Beulich wrote:
> On 09.02.2024 10:00, Roger Pau Monné wrote:
> > On Thu, Feb 08, 2024 at 04:29:34PM +0100, Jan Beulich wrote:
> >> On 08.02.2024 10:17, Roger Pau Monné wrote:
> >>> On Mon, Feb 05, 2024 at 02:55:17PM +0100, Jan Beulich wrote:
> >>>> +        {
> >>>> +            dprintk(XENLOG_WARNING VTDPREFIX,
> >>>> +                    " Non-existent device (%pp) is reported in SATC scope!\n",
> >>>> +                    &PCI_SBDF(satcu->segment, b, d, f));
> >>>> +            ignore = true;
> >>>
> >>> This is kind of reporting is incomplete: as soon as one device is
> >>> found the loop is exited and no further detection happens.  If we want
> >>> to print such information, we should do the full scan and avoid
> >>> exiting early when a populated device is detected.
> >>
> >> Not sure I follow, but first of all - these are dprintk()s only, so
> >> meant to only help in dev environments. Specifically ...
> >>
> >>>> +        }
> >>>> +        else
> >>>> +        {
> >>>> +            ignore = false;
> >>>> +            break;
> >>>> +        }
> >>>> +    }
> >>>> +
> >>>> +    if ( ignore )
> >>>> +    {
> >>>> +        dprintk(XENLOG_WARNING VTDPREFIX,
> >>>> +                " Ignore SATC for seg %04x as no device under its scope is PCI discoverable!\n",
> >>
> >> ... this message is then issued only bogus entries were found. IOW
> >> when a real device was found, there's no real reason to report N
> >> other bogus ones, I think.
> > 
> > I guess it's a question of taste.  I do find it odd (asymmetric
> > maybe?) that we stop reporting non-existing devices once a valid
> > device is found.  Makes me wonder what's the point of reporting them
> > in the first place, if the list of non-existing devices is not
> > complete?
> 
> Since you look to not be taking this into account, let me re-emphasize
> that these are dprintk() only. In the event of an issue, seeing the
> log messages you at least get a hint of one device that poses a
> problem. That may or may not be enough of an indication for figuring
> what's wrong. Making the loop run for longer than necessary when
> especially in a release build there's not going to be any change (but
> the logic would become [slightly] more complex, as after setting
> "ignore" to true we'd need to avoid clearing it back to false) is just
> pointless imo. IOW I view this 1st message as merely a courtesy for
> the case where the 2nd one would end up also being logged.

I will not insist anymore.

> >>>> +    satcu = xzalloc(struct acpi_satc_unit);
> >>>> +    if ( !satcu )
> >>>> +        return -ENOMEM;
> >>>> +
> >>>> +    satcu->segment = satc->segment;
> >>>> +    satcu->atc_required = satc->flags & 1;
> >>>
> >>> I would add this as a define in actbl2.h:
> >>>
> >>> #define ACPI_DMAR_ATC_REQUIRED (1U << 0)
> >>>
> >>> Or some such (maybe just using plain 1 is also fine).
> >>
> >> I intended to do so, but strictly staying in line with what Linux has.
> >> To my surprise they use a literal number and have no #define. Hence I
> >> didn't add any either.
> > 
> > I would prefer the define unless you have strong objections, even if
> > that means diverging from Linux.
> 
> I could probably accept such a #define living in one of dmar.[ch]. I'd
> rather not see it go into actbl2.h.

Fine.  I think the current open coding of 1 in Linux is wrong.  Other
flag fields in DMAR structures have the related defines.

Thanks, Roger.

