Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CDD88D9B3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 10:00:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698358.1089969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpP8L-0005PS-TG; Wed, 27 Mar 2024 08:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698358.1089969; Wed, 27 Mar 2024 08:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpP8L-0005NO-PZ; Wed, 27 Mar 2024 08:59:45 +0000
Received: by outflank-mailman (input) for mailman id 698358;
 Wed, 27 Mar 2024 08:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zox+=LB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rpP8K-0005NE-DF
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 08:59:44 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 599c9fc9-ec18-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 09:59:42 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41494c0405eso2033955e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 01:59:42 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 r3-20020a05600c35c300b004147b824b08sm1491346wmq.7.2024.03.27.01.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 01:59:41 -0700 (PDT)
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
X-Inumbo-ID: 599c9fc9-ec18-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711529981; x=1712134781; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F+bA0/25eIV49S9l0uuiMQg7gB/Ls5scBx+vVk8xCtQ=;
        b=CbCn75bBxcy4Mdc/vYacNv24FiHpuPSkvfqUdb7KJCux4FsS1dGqjtsC3x8YFYgT5a
         6CMNAc3fCyXvmnHxUVxZNU1VGpEGd9J5mxwMcn++Yc0bEDI6lYl8tv6UXUKLcPG6RBJn
         AfGHaYNL+d3sEkRueJO7r92PZ3AbtMjplwfw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711529981; x=1712134781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+bA0/25eIV49S9l0uuiMQg7gB/Ls5scBx+vVk8xCtQ=;
        b=fz6FNqILWr96IrMvbYMLfXUH4wVXSr/8RICDjWCMfzHcRl6qfTa/DRjSA+bgTWfm6T
         rkxj40RMx/xXWuH2ul48FielKIEYaCGJBKB04hHZStMUW0FKbzJNNlxrKdAjTrJHjGXN
         dB/Q7mXrXF1dXVQlv2MPxOhFFG2eplNYQxiQoOXQTQJgtHYBZKXVFFvq7z4wjEqT6KNv
         c37Y/H2IJtm0XuwcKgh+0SeT/N6wlTv5n1Fsf9eeBrctBmtXwNR+PMxAg1LuhjdTAIDx
         CQcA/HbnAq3fqoz127yTTplPjaLLnX+y/Z+k74tULXgoXz4AArY7x7Fa1ep9+hSMWgCz
         ifpw==
X-Forwarded-Encrypted: i=1; AJvYcCWASMfczliq0jgpFkNj0GxLo0kD9idPOYCGZRdbFub2Rx9w0yaIOTPG88SKFwDaNZbPl1ihkfNlmJqj7kd4QW46TbCMOi9pz5Gfhe0y9AE=
X-Gm-Message-State: AOJu0Yx5Bs7EX15S1Brv08ZQClHIWLaxMOvtUZDCaQjTXYkWP5db+12A
	34l/Bmhohfr7uGdhqMIIc/HsXYCkhUk8jKQ7NAfOGOH1UHmq2jwrv0BTO4FTTcU=
X-Google-Smtp-Source: AGHT+IEHPAopP+1Vft3DJ0tcDiGW9y8/DBB/1K00V9wUmdfLcN3YUHlSbdSM0eorHGm9uaBIgbi2QA==
X-Received: by 2002:a05:600c:4487:b0:414:729:1189 with SMTP id e7-20020a05600c448700b0041407291189mr3831476wmo.21.1711529981570;
        Wed, 27 Mar 2024 01:59:41 -0700 (PDT)
Date: Wed, 27 Mar 2024 09:59:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/6] Revert "xen/x86: bzImage parse kernel_alignment"
Message-ID: <ZgPf_I2CJ7358jbZ@macbook>
References: <20240326213847.3944-1-jason.andryuk@amd.com>
 <20240326213847.3944-2-jason.andryuk@amd.com>
 <f1940242-0259-4b4c-baff-2fa73435d1b9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f1940242-0259-4b4c-baff-2fa73435d1b9@suse.com>

On Wed, Mar 27, 2024 at 08:22:41AM +0100, Jan Beulich wrote:
> On 26.03.2024 22:38, Jason Andryuk wrote:
> > A new ELF note will specify the alignment for a relocatable PVH kernel.
> > ELF notes are suitable for vmlinux and other ELF files, so this
> > Linux-specific bzImage parsing in unnecessary.
> > 
> > This reverts commit c44cac229067faeec8f49247d1cf281723ac2d40.
> > 
> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Since you keep re-sending this: In private discussion Roger has indicated
> that, like me, he too would prefer falling back to the ELF data, before
> falling back to the arch default (Roger, please correct me if I got it
> wrong). That would make it necessary that the change you're proposing to
> revert here is actually kept.

Sorry, was meaning to reply yesterday but Jason is very fast at
sending new version so I'm always one version behind.

IMO the order: ELF note, PHDR alignment, arch default should be the
preferred one.

> Or wait - what you're reverting is taking the alignment out of the
> bzImage header. I don't expect the BSDs to use that protocol; aiui that's
> entirely Linux-specific.

Yeah, I don't have strong opinions in keeping this, we already do
bzImage parsing, so we might as well attempt to fetch the alignment
from there if correct:

ELF note, bzImage kernel_alignment, ELF PHDR alignment, arch default

> I further meanwhile realized that consulting the ELF phdrs may also be
> ambiguous, as there may be more than one. I guess it would need to be the
> maximum of all of them then.

My suggestion (not sure if I mentioned this before) was to use the
alignment of the first LOAD PHDR, which is the one that defines the
value of the dest_base field used as the image load start address.

Using the maximum of all load PHDRs might be safer.

Thanks, Roger.

