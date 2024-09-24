Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC64984A23
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 19:10:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803246.1213742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st939-00019m-TG; Tue, 24 Sep 2024 17:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803246.1213742; Tue, 24 Sep 2024 17:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st939-000165-Ph; Tue, 24 Sep 2024 17:10:07 +0000
Received: by outflank-mailman (input) for mailman id 803246;
 Tue, 24 Sep 2024 17:10:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZSf=QW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1st938-00010G-2l
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 17:10:06 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6f2e78d-7a97-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 19:10:03 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-536748c7e9aso143440e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 10:10:03 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cb10esm106905666b.104.2024.09.24.10.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 10:10:02 -0700 (PDT)
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
X-Inumbo-ID: d6f2e78d-7a97-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727197803; x=1727802603; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6JMTqfC5s77anEsZoiawQRwreHcFx6IviWQYAc7YBao=;
        b=EPxfDApYNdwFmp2uDQwTW7SO7xxxYA8c8aD0FB6ihObkNWtPro7XD1LZFZp+tq+xAD
         YSrWgMVX9NhzaPKYsVyBFARGFEZD4IKijxsPMM6XN/vtq7yVBGHvq9TQlaVxlTKVeppj
         A7ZSHdihDJ4nju8JlGVV6jRZWknpoY2UM3eFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727197803; x=1727802603;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JMTqfC5s77anEsZoiawQRwreHcFx6IviWQYAc7YBao=;
        b=m54MRo20NuA6JFV2QXVXVvfimwdHHbHk42iRNYuPJK8xs/4LPaKIaHokCscvV77Kjn
         mbtgLf7nN0XTPhjTanNo+FtKjzMkGZcEtBu8m15X0DpxCwwEZWiv1fKkIQBOBWz/iAf9
         w4tBFm6uuPEBDQ8RbeVPftvNI2hT9LY6uD+CTUPliw8FRAZYUWxMAOXUN17uidR1tCnT
         +/QDMh8BPR6mOdQlWMWPl6Co8IEIs2FoNKIyMzFFCdcGZiLxgA2EzaLc5GnAYngDDRnw
         4KqPTD63yTD5hLUJpXwBXTd9pwuULUN+v7Ik9uwsJP+jVDYIIGXUFjIGHXsm+80RElAF
         ZBpA==
X-Gm-Message-State: AOJu0Yy4mJkc0N9fZUxPidNKTqKBoz4+z5Dcaf5aOeL4+FMr3u9qdxUf
	/k//+bmHQ3qvgy43fJsPqbITf7oT2QQJu0HSebfqr4Mm23AEKDV2DXHlMuSMkrI=
X-Google-Smtp-Source: AGHT+IE3Y9x45r8nJLv1yXRWCqDZceZekiRdjp8hOL01taX1Wz9OPr6iY/eGlRgZ8asLCwUWuXgKhA==
X-Received: by 2002:a05:6512:3d22:b0:52e:74f5:d13 with SMTP id 2adb3069b0e04-536ac2f52e9mr8151126e87.30.1727197802971;
        Tue, 24 Sep 2024 10:10:02 -0700 (PDT)
Date: Tue, 24 Sep 2024 19:10:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Matthew Barnes <matthew.barnes@cloud.com>
Subject: Re: [PATCH] x86/APIC: Remove x2APIC pure cluster mode
Message-ID: <ZvLyaSqZegiPyv6B@macbook.local>
References: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
 <ZvLWSEwbdL1kpvC6@macbook.local>
 <4b7a2b84-5c5d-40e2-b20e-5c011eac7b4a@citrix.com>
 <ZvLlYp0L3Ac2O_uG@macbook.local>
 <d77b1df7-5b05-4d54-b66e-ed90a296c091@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d77b1df7-5b05-4d54-b66e-ed90a296c091@suse.com>

On Tue, Sep 24, 2024 at 06:21:47PM +0200, Jan Beulich wrote:
> On 24.09.2024 18:14, Roger Pau Monné wrote:
> > On Tue, Sep 24, 2024 at 04:27:36PM +0100, Andrew Cooper wrote:
> >> On 24/09/2024 4:10 pm, Roger Pau Monné wrote:
> >>> On Mon, Sep 23, 2024 at 03:35:59PM +0100, Matthew Barnes wrote:
> >>>> With the introduction of mixed x2APIC mode (using cluster addressing for
> >>>> IPIs and physical for external interrupts) the use of pure cluster mode
> >>>> doesn't have any benefit.
> >>>>
> >>>> Remove the mode itself, leaving only the code required for logical
> >>>> addressing when sending IPIs.
> >>>>
> >>>> Implements: https://gitlab.com/xen-project/xen/-/issues/189
> >>
> >> We use the Resolves: tag for this.  Can fix on commit.
> >>
> >>> There's at least one extra bit which I would also like to see removed,
> >>> either in this patch, or as following patch.
> >>>
> >>> In struct arch_irq_desc we have 3 cpumasks: cpu_mask, old_cpu_mask and
> >>> pending_mask.  After dropping cluster mode for external interrupts,
> >>> those fields could become integers AFACT, as now interrupts can only
> >>> target a single CPU opposed to a logical CPU set.
> >>
> >> A separate patch for sure, but that sounds like a great improvement.
> > 
> > Oh, there are quite some fields of struct genapic that are not needed
> > anymore, since both implementations set it to the same function.  It
> > would be helpful to prune them.
> 
> Pruning where possible - yes. But "both" won't cover it, as we have 4
> instances of the struct (not just the two x2apic ones).

Yeah, realized that afterwards, we still have the xAPIC flat mode,
which is using logical delivery mode, but target a single CPU.  So
getting rid of the cpumask in arch_irq_desc seem possible, however
there might be nothing to prune in struct genapic.

Regards, Roger.

