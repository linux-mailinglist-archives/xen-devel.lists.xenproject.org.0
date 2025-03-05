Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A330A50394
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 16:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902473.1310440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpqqo-0007bA-2k; Wed, 05 Mar 2025 15:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902473.1310440; Wed, 05 Mar 2025 15:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpqqo-0007Yl-01; Wed, 05 Mar 2025 15:40:02 +0000
Received: by outflank-mailman (input) for mailman id 902473;
 Wed, 05 Mar 2025 15:40:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCKF=VY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tpqqm-0007Yf-LC
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 15:40:00 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17faf347-f9d8-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 16:39:58 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e0573a84fcso9361350a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 07:39:58 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e4c3b6cfd0sm9833805a12.28.2025.03.05.07.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 07:39:57 -0800 (PST)
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
X-Inumbo-ID: 17faf347-f9d8-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741189198; x=1741793998; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OdS/lYUlA9tqMCJO2GTaNiw21MieA9SA9hezZvqCLeU=;
        b=p64BiFJIa7uyc/TJeVOdeo3WrLwxrtoohePEUqELlabao/Uoy0WbH2Jxfb2tR6Ueda
         fmGEiTpKyo6vXXc0TKDw9KfiqvxJbUL51AESK3W6f4N2TlXELZzNBWkgJGAlTu9P1Bzw
         blv4s7Lni6/jPuw2OpZ/jKOJW4IoNc5n54gdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741189198; x=1741793998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OdS/lYUlA9tqMCJO2GTaNiw21MieA9SA9hezZvqCLeU=;
        b=dfGvHKyzCW3lAtgC2+d8WmLPjx37zFVpU4z89rz8ohb5/6EXhD5Mim2f3KY4bgK+oG
         i30BYJoSBsnIvAZTtCGBFXGG/90rGV3Srv0fDfyS44LfhvvD8SvJAZeT2i2OaUF/dezg
         RxksrbG5eHY6VgPX6RIb6hfOyP39SWcG9VdzaR/4mFJAkzUmIJLmA9yAhFJXzzFpV28T
         OKX76GVU8xk+8xvDR05VQMR0lK+RDBwVhkT2KYMqT88QmY2xKsHxSOXC5P5cT9/1dcKc
         oIVZvVKb22ajOMUvoFpzEwqTQ47+WsfvLMIHES7xEd9GnQgVxVtzvOzzMiUfd1jnv01T
         Y+Jg==
X-Gm-Message-State: AOJu0YzRrzVe6juWlIcg5q+1it/LNso5WPLeGq5oEkfJ8NBWvkKg5gyz
	6SuFbWtn/2N4uQ2J50riNYVSW1yWQ/pVc1bF+QTD0N0GkZRlw/UC9MDaAFxnSD0=
X-Gm-Gg: ASbGnctRqZmPth9KXkzZzeyoawwNcuKnVJe9+3MWin5QHwoayN52LJ6OC7xT3GLHaKD
	6xyDYAbVAdnZwT8FJQofF6OB7QTd6zTZTm0Dy17SCOmN4UbPBhgqBuTB6FNnzSfEpBnQzt2FDT3
	Ig2nLYlC5dj6h8MEZ0CzdQzgkbn/XrHPV5PQ9KaXv7gZe3JZaSPF4C9uItalrH5osyEFoaJHc4L
	bl5uYmNrzMrHwF5Vg23OwFXRzdwwvl5lhOeoD1Qw5qmGxSlxNhblpi7ANahFLKscLZOLoXlVEXs
	1e7/S9MG5zEVWYCq1MS9X/1ZEmxGtqE0VWy3mLWvgXba4Hl4cmDLPjw=
X-Google-Smtp-Source: AGHT+IGhjU4U+YOgMymsoGr5VCVTVqUFEQ8lxGhohIMq5ZEqmva9DO+ucz7DK5s6unjIGd0+/M/7dw==
X-Received: by 2002:a05:6402:1ece:b0:5e4:d75a:573e with SMTP id 4fb4d7f45d1cf-5e59f4f8e28mr3595918a12.32.1741189197761;
        Wed, 05 Mar 2025 07:39:57 -0800 (PST)
Date: Wed, 5 Mar 2025 16:39:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 01/11] x86/HVM: improve CET-IBT pruning of ENDBR
Message-ID: <Z8hwTL8bsgjU3fJi@macbook.local>
References: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
 <29cc2974-a1d8-4123-83b0-b44a3151f900@suse.com>
 <Z8hkLjMAQfhBR2Cm@macbook.local>
 <5978ed8d-ecef-41f7-adde-bc52312b483c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5978ed8d-ecef-41f7-adde-bc52312b483c@suse.com>

On Wed, Mar 05, 2025 at 04:02:51PM +0100, Jan Beulich wrote:
> On 05.03.2025 15:48, Roger Pau Monné wrote:
> > On Tue, Feb 25, 2025 at 12:37:00PM +0100, Jan Beulich wrote:
> >> __init{const,data}_cf_clobber can have an effect only for pointers
> >> actually populated in the respective tables. While not the case for SVM
> >> right now, VMX installs a number of pointers only under certain
> >> conditions. Hence the respective functions would have their ENDBR purged
> >> only when those conditions are met. Invoke "pruning" functions after
> >> having copied the respective tables, for them to install any "missing"
> >> pointers.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > However I find this filling slightly ugly, and prone to be forgotten
> > when further hooks are added.
> 
> Indeed. Luckily, while undesirable, that wouldn't be an outright bug.
> 
> > Would it make sense to delay enabling of IBT until after alternatives
> > have been applied, and thus simply not use the cf_clobber attribute on
> > functions that are patched to not be indirectly called?
> > 
> > We could still enable IBT before starting the APs.
> 
> I'd prefer if Andrew answered this. It looks like it might be an option,
> but it also feels as if this would (if only a little) complicate logic
> overall.

It would indeed move the enabling a bit later, but overall (if
possible) it would IMO seem simpler than all this patching and filling
of tables.

Thanks, Roger.

