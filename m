Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1627996C4B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 15:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814519.1228089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWsJ-00023l-9d; Wed, 09 Oct 2024 13:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814519.1228089; Wed, 09 Oct 2024 13:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWsJ-00021o-75; Wed, 09 Oct 2024 13:37:11 +0000
Received: by outflank-mailman (input) for mailman id 814519;
 Wed, 09 Oct 2024 13:37:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQJB=RF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1syWsH-00021i-QC
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 13:37:09 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9416d8f0-8643-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 15:37:07 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42ca4e0299eso61109115e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 06:37:07 -0700 (PDT)
Received: from localhost ([213.195.123.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430ccf4f7aesm20884515e9.12.2024.10.09.06.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 06:37:06 -0700 (PDT)
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
X-Inumbo-ID: 9416d8f0-8643-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728481027; x=1729085827; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6MWwygkPU9u2IMizAUKCfra5CuczdLDgpwXW1vF7BBg=;
        b=FovKoU3nb5G1IIQAswpnWUY1+f+oCo6kUEPdPgyrG71I4t/U63CjkduULVd5sqHj+t
         WSw5zxxZuuOfJdJW3/yyNUK2MedOAPgO9EyquwI9qN9eo7D4zF2wizF7fSTKzHJ1ht0U
         zZu3oLTIpqxVV83JooU7luJl2vWpA+OdVdI9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728481027; x=1729085827;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MWwygkPU9u2IMizAUKCfra5CuczdLDgpwXW1vF7BBg=;
        b=hUKT6hXoa4eAlQh7O2kDBXLaAWHLihUn6R3wt4GTKmDj/ZleSZXI5SugAMHN8pdphp
         /Eq8wnbvXJfXfdbl9wsvI4ttqL6J0k42LI8GdxjlM8VfJU/tICwJhcXArsBY3XQNlEhH
         iEaTLKocRdzscFsqxUMnW3EKgUZKJqRmdoZYo/YYTobb4m5EzvlX0Qcuwm5nRBdExvmM
         Vcbj1knrRj57GumOyTv3fvNC0h9giYa9PgRyDIj0w8mhs/KyRkfSVMccs9zHuaYLJy5w
         fwx8JEN+jZ35YPLo5SKfyTY+FfYd6Jlk1Rtomn5+HK+pb4FbNaBNIu6JPCKEXlKOTl2A
         fqoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCh5EQaDR1h6xN0z6+A6aLY0EWZJRC03fbvTPjfHmeg7kZ7EVo/NoE86vtgyFdCC0TZwGFHC7z7sk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqFUH+RBs2Ra6HzvWpMwO2FOT3HYaHo4gRzHFCV7VIOZeKBRk6
	ITEZEJr3746pIfEVgx36y/6o/9BIoh041QzZcPwt0zhBnLaLS0cnDRqhYrqK2aY=
X-Google-Smtp-Source: AGHT+IGRQlwcMWgNwF6xPKQF+fHzdKtpItc9ahHLYUgefhaAampe03L49yONZzxuWhu46a4h9FWk6w==
X-Received: by 2002:a05:600c:46ce:b0:430:56c1:644c with SMTP id 5b1f17b1804b1-430d7487ad7mr16520105e9.31.1728481027155;
        Wed, 09 Oct 2024 06:37:07 -0700 (PDT)
Date: Wed, 9 Oct 2024 15:37:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/amd-vi: do not error if device referenced in IVMD
 is not behind any IOMMU
Message-ID: <ZwaHAqVGeeJNu4Dp@macbook.local>
References: <20241008104706.74001-1-roger.pau@citrix.com>
 <d6489e43-2cfe-4ad7-824e-a3212367dbca@suse.com>
 <ZwY4ym2Gnlx4tytP@macbook.local>
 <5a2a4ff4-a2c7-46f6-bd18-a4837fe8d4c1@suse.com>
 <ZwZlVlU2nHkBedyo@macbook.local>
 <703fa416-c7d5-4862-a871-5831125c2e25@suse.com>
 <ZwZtR6ZTl2gUWN2T@macbook.local>
 <34f73ec6-0e10-41f4-8894-c367264afefc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34f73ec6-0e10-41f4-8894-c367264afefc@suse.com>

On Wed, Oct 09, 2024 at 02:09:33PM +0200, Jan Beulich wrote:
> On 09.10.2024 13:47, Roger Pau Monné wrote:
> > On Wed, Oct 09, 2024 at 01:28:19PM +0200, Jan Beulich wrote:
> >> On 09.10.2024 13:13, Roger Pau Monné wrote:
> >>> I also think returning an error when no device in the IVMD range is
> >>> covered by an IOMMU is dubious.  Xen will already print warning
> >>> messages about such firmware inconsistencies, but refusing to boot is
> >>> too strict.
> >>
> >> I disagree. We shouldn't enable DMA remapping in such an event. Whereas
> > 
> > I'm not sure I understand why you would go as far as refusing to
> > enable DMA remapping.  How is a IVMD block having references to some
> > devices not assigned to any IOMMU different to all devices referenced
> > not assigned to any IOMMU?  We should deal with both in the same
> > way.
> 
> Precisely because of ...
> 
> > If all devices in the IVMD block are not covered by an IOMMU, the
> > IVMD block is useless.
> 
> ... this. We simply can't judge whether such a useless block really was
> meant to cover something. If it was, we're hosed. Or maybe we screwed up
> and wrongly conclude it's useless.

The same could be stated about devices in a IVMD block that are not
assigned to an IOMMU: it could also be Xen that screwed up and wrongly
concluded they are not assigned to an IOMMU.

> >  But there's nothing for Xen to action, due to
> > the devices not having an IOMMU assigned.  IOW: it would be the same
> > as booting natively without parsing the IVRS in the first place.
> 
> Not really, no. Not parsing IVRS means not turning on any IOMMU. We
> then know we can't pass through any devices. We can't assess the
> security of passing through devices (as far as it's under our control)
> if we enable the IOMMU in perhaps a flawed way.
> 
> A formally valid IVMD we can't make sense of is imo no different from
> a formally invalid IVMD, for which we would return ENODEV as well (and
> hence fail to enable the IOMMU). Whereas what you're suggesting is, if
> I take it further, to basically ignore (almost) all errors in table
> parsing, and enable the IOMMU(s) in a best effort manner, no matter
> whether that leads to a functional (let alone secure [to the degree
> possible]) system.

No, don't take it further: not ignore all errors, I think we should
ignore errors when the device in the IVMD is not behind an IOMMU.  And
I think that should apply globally, regardless of whether all devices
in the IVMD block fall in that category.

That will bring AMD-Vi inline with VT-d RMRR, as from what I can see
acpi_parse_one_rmrr() doesn't care whether the device scope in the
entry is behind an IOMMU or not, or whether the whole RMRR doesn't
effectively apply to any device because none of them is covered by an
IOMMU.

> What I don't really understand is why you want to relax our checking
> beyond what's necessary for the one issue at hand.

This issue has been reported to us and we have been able to debug.
However, I worry what other malformed IVMD blocks might be out there,
for example an IVMD block that applies to a single device (type 21h),
but such single device doesn't exist (or it's not behind an IOMMU).
Maybe next time we simply won't get a report, the user will try Xen,
see it's not working and move to something else.

I've taken a quick look at Linux, and when parsing the IVMD blocks
there's no checking that referred devices are behind an IOMMU, the
regions are just added to a list.

Thanks, Roger.

