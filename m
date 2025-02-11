Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB21A30727
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:31:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885227.1295014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmcM-0000Yh-8R; Tue, 11 Feb 2025 09:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885227.1295014; Tue, 11 Feb 2025 09:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmcM-0000Vw-50; Tue, 11 Feb 2025 09:31:46 +0000
Received: by outflank-mailman (input) for mailman id 885227;
 Tue, 11 Feb 2025 09:31:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thmcL-0000Vo-Cm
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:31:45 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 014d740e-e85b-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 10:31:43 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ab7c81b8681so272658466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 01:31:43 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f8436dsm1026593766b.54.2025.02.11.01.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 01:31:42 -0800 (PST)
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
X-Inumbo-ID: 014d740e-e85b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739266303; x=1739871103; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A0iPFCM0x7xmTxXtvL/l0nwRIUqjVM6Y/Kts2UgshhE=;
        b=UFJztw8m0e/0Khd4qese05gvUikMc19b0tIE9DXHvKpl7/ydJ8UTbEAw7/RVe9t+XP
         SkRQrvfj+uMjaT7m79ZtWA4NCxdDnTKqptqRuLwk4huqQNf8Uio7lwSmOF2ah/+ZI7RN
         LnYoMiGvNA2X15zhSEwT6rHxyTGTc9xN/g7YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266303; x=1739871103;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0iPFCM0x7xmTxXtvL/l0nwRIUqjVM6Y/Kts2UgshhE=;
        b=Bitgixb46t7yDscLsAUQWbDpJ4BWERuvXfwTPbrrAM8Xjq874IQmkq9tEDKZyx+04K
         zS4otq6Iw/4Z4ieLRN4Vy6YC/9EDT3YA7zoR8+IxiYdMJLygNDL9x54CGbya7XYMHIPu
         nzbBjgrNjQSvSimd4leGJgCkYzRuof20Fha4H6XZrbhHgLJbyJ6mb5LGO7TW7ep51iGH
         yAl5RqDsXvJuPac2Cfah5rVaDphWhvrmy/dTERm8cKAJPECGthcMpzPhrvlDvlIa/1B6
         iP0qTp5MqTBs0QjHTPQdoRj3h80CN8GDFi193Lcv+JA8pDqrL3tTOCnUKwLTPe7jpjHA
         0GIA==
X-Forwarded-Encrypted: i=1; AJvYcCVnjZjsLiFUubcgKKHFBj9bO3I4/MdJwpmizgmB4nrvjAVJT3lYB4O5hdKCSMwUfi5/CLg6xuhcfKE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0dSNpG3vPf83LMloXYKkQz9avez6fwc3IObOqorxOgLdA68sl
	Gq92AHc3BaNtBtKBtclbNrnotc1d1KQU3gEvoe0pgQSqdUvvE98tgpcLEmseLws=
X-Gm-Gg: ASbGncujC0GqZDOouTPXchvNTnYH+uvwvm8wOUZOms3n+FgmcBvQDX/9OVep1dktwTq
	Br/PSOkOMnaaou2ZVmj/EAOrrTyksTVrDVJ0ngJmC/ey40X8rR/YVsjPZbvm9VMWSTzQHwpQOn0
	iNyOM7NfuHTNQD+pbbuZ0Wjsbl7SJXJrwle/JSLY5ufwcVaxPbHj8nvy8z/ei+iAezcd4Jh7HF/
	S4Kz6RERph3gMVu4c2dhXIdzv4y4rmeR51jlxd2s+re8+eDKMupRK0hMiZ9BCqCeiY+Irnek08/
	L6g4JtGE5zjMZxqYE7Og
X-Google-Smtp-Source: AGHT+IFY1cjOoEpa2la5u8Dn8ahixy5Qo1ysjdrvnADffw/vNOs5J4AANDOoxL/zok9w6jWZIb7kGw==
X-Received: by 2002:a17:906:280e:b0:ab7:db70:6f1d with SMTP id a640c23a62f3a-ab7db706fb7mr199631466b.57.1739266302860;
        Tue, 11 Feb 2025 01:31:42 -0800 (PST)
Date: Tue, 11 Feb 2025 10:31:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Oleksandr Andrushchenko <andr2000@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: Coding Style Review and Automation
Message-ID: <Z6sY_YsjJ6rGi8zS@macbook.local>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <Z6sR87FrKcOhgEqX@macbook.local>
 <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com>

On Tue, Feb 11, 2025 at 09:10:38AM +0000, Luca Fancellu wrote:
> Hi Roger,
> 
> >> 
> >> 3) The size of the patch after applying clang-format is huge. Really. Something
> >> like 9 MB. Even if everyone agrees that the approach is good and we can proceed
> >> with it, it is highly unlikely anyone will be able to review it. Considering
> >> that new patches are being added to the upstream during such a review, it may
> >> also lead to new code style violations or require a new review of that huge
> >> patch.
> > 
> > I think this approach is difficult.  It would likely introduce a lot
> > of noise when using `git blame` (I know, it's just one extra jump,
> > but...), plus would likely break every patch that we currently have
> > in-flight.
> 
> I think we already discussed this in the past and having some churn was accepted,
> also about breaking existing patches, every change merged has the potential to do
> that, this one is more likely but it’s the game I guess?

Hm, maybe, I don't get rebasing issues very often TBH.  Not sure how
intrusive such patch would be.

> > 
> >> 4) Which clang-format version should we set as the one used by Xen, so it is
> >> easy for everyone to use it on their hosts?
> >> 
> >> 5) You name it. I think many people in the community can name their points for
> >> and against clang-format.
> > 
> > What are the parts of our coding style that clang-format cannot
> > correctly represent?  Could you make a list of what would need to
> > change in Xen coding style for it to match perfectly what clang-format
> > will check?
> 
> we already went through that route, there is no checker anywhere that matches
> the Xen coding style perfectly, so it’s either we change the coding style or we
> don’t proceed further with any automatic check

I'm probably fine with changing coding style, that's why I'm asking
for a list of what needs to be changed (unless we switch to a
completely different coding style).

> > 
> > Ideally the first step would be to prepare a patch to adjust the
> > coding style so it's in line with what clang-format will do.
> 
> It’s easy to say that, but difficult to implement, if we could accept the clang-format
> rules it would be easier to adopt the configuration itself as coding style, maybe
> enhanced with some comments.

I'm kind of lost, why is it difficult to implement?  What I'm asking
for is a patch to CODING_STYLE that modifies it in a way that we could
use clang-format.  In any case we need to do that if we want to use
clang-format.

One question that seems to have been dropped from my previous email:
would it be feasible to apply the updated style to newly added chunks
of code only, but not to the (unmodified) surrounding context?

Thanks, Roger.

