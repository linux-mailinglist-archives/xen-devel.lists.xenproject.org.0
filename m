Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EE2836024
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 11:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669753.1042143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrwX-0004kQ-Ki; Mon, 22 Jan 2024 10:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669753.1042143; Mon, 22 Jan 2024 10:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrwX-0004iW-I2; Mon, 22 Jan 2024 10:54:17 +0000
Received: by outflank-mailman (input) for mailman id 669753;
 Mon, 22 Jan 2024 10:54:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7P8=JA=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rRrwW-0004iQ-1D
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 10:54:16 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9536d705-b914-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 11:54:15 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e9ef9853bso15617795e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 02:54:15 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m17-20020adffa11000000b00336c6b77584sm13528270wrr.91.2024.01.22.02.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 02:54:14 -0800 (PST)
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
X-Inumbo-ID: 9536d705-b914-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705920854; x=1706525654; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pJHXtCVEwI7oM3elKyMqiv++MjyGUPKP0vZE21Y8rsE=;
        b=Rh5NtbsYVowWbi62wtzKwyYCQyPIf9rHSJwwHJzk2GCcWWHtXojDQtwEqnoUu6TKoL
         VdegKd9BJEriTEnZ2uKdw1Rj8eIpktLv9A+ACGteSgj7iJEDgPdlCbM7C+f9vWNlEp+R
         JPVxbi2asyhwSwBe0YrSWPRoywtZ0p2cqwfBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920854; x=1706525654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJHXtCVEwI7oM3elKyMqiv++MjyGUPKP0vZE21Y8rsE=;
        b=uaKJM/ph/EKOfw0smQhjoJkmEvIcWmh81QuSVXE1ZOy3TJlWB0rGWD/y+c/oNk1+LB
         fyT4tPzUCF9Hoh8RoYwEp65phHT8gPiewSZB5tKI+8DARQj0lF+z1GD6BpOzb9prIyA6
         ai0sk3BUu/9enuVoF8Fsh//d9wzzGl/61etOkXM1jMvj6hFmn/NVhUCvMRFYtQ9JJ584
         8emN/ZHANzQbrW21TpDR1qg2dlrYFhmNuuuqyUxN+fd+9Uj7WSNZFE2z8Qjl1CKnnCGu
         I0t38m3s4xY4ctCRo1NkrtUHM6SRIDexEu+DJhWzsxpGnWaZMtTcgLW5gqyWBAv9cwD7
         rZ5w==
X-Gm-Message-State: AOJu0YyDCJAhyvxPuh0fLBqpDG+FlidK1wrQ4Kq+lDW5lxHO7yA/XIyD
	lRVBqswdbxyLug8JQcnJb6Haq6o0MKkxDSOAxKxyr0PupCXd72DHgX1QoBz6AZU=
X-Google-Smtp-Source: AGHT+IHrZY4NjLeWT4U15UtK7/cCxx/JWKKrzppWZl1RtGixd5qKGUGekVNH0cuXtL5z/YqWf7nXjQ==
X-Received: by 2002:a7b:c409:0:b0:40e:52fd:7341 with SMTP id k9-20020a7bc409000000b0040e52fd7341mr1881857wmi.141.1705920854487;
        Mon, 22 Jan 2024 02:54:14 -0800 (PST)
Date: Mon, 22 Jan 2024 10:54:13 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
Message-ID: <01dd5e72-c33c-49c7-838a-4e0eba454c05@perard>
References: <20240118120641.24824-1-michal.orzel@amd.com>
 <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
 <e399890c-0299-4ec5-884e-0637ae6cb5b0@perard>
 <9d552e6d-eb5d-4ccf-a35d-a359df7c4478@amd.com>
 <0a1c749b-8169-43b5-9921-961096f8570d@perard>
 <0437c4eb-8438-44a8-a749-aef6c4c93ef0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0437c4eb-8438-44a8-a749-aef6c4c93ef0@suse.com>

On Mon, Jan 22, 2024 at 11:04:41AM +0100, Jan Beulich wrote:
> On 19.01.2024 16:25, Anthony PERARD wrote:
> > On Fri, Jan 19, 2024 at 09:43:30AM +0100, Michal Orzel wrote:
> >> Is my understanding correct that by switching from extra-y to targets we are preventing these objects to
> >> appear in non-init-objects (and thus having COV_FLAGS appended) while retaining the proper if_changed behavior?
> >>
> >> According to docs/misc/xen-makefiles/makefiles.rst:
> >> Any target that utilises if_changed must be listed in $(targets),
> >> otherwise the command line check will fail, and the target will
> >> always be built.
> > 
> > Indeed, and $(extra-y) is added to $(targets) via
> > $(targets-for-builtin).
> > 
> > While switching from $(extra-y) to $(targets) prevents the objects from
> > been added to $(non-init-objets), it doesn't matter because "libelf.o"
> > is in that variable, so $(COV_FLAGS) is added to $(_c_flags) and its
> > value is used in all the prerequisites of "libelf.o" which includes
> > "libelf-temp.o" and for example "libelf-dominfo.o". So the only thing
> > preventing $(COV_FLAGS) from been added when building "libelf-tools.o"
> > for example is that we set `COV_FLAGS:=` for "libelf.o".
> 
> Yet doesn't that (again) mean things should actually work as-is, [...]

No, because I've explain how it should work, in the hypothetical world
where we have `targets += libelf-temp.o $(libelf-objs)`.

-- 
Anthony PERARD

