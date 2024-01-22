Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788683607F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 12:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669764.1042174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRs7p-0008Cd-Uu; Mon, 22 Jan 2024 11:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669764.1042174; Mon, 22 Jan 2024 11:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRs7p-0008A1-RZ; Mon, 22 Jan 2024 11:05:57 +0000
Received: by outflank-mailman (input) for mailman id 669764;
 Mon, 22 Jan 2024 11:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7P8=JA=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rRs7o-00089d-V2
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 11:05:56 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35ecc139-b916-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 12:05:54 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33934567777so1065162f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 03:05:54 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y14-20020adff6ce000000b00337d85a5b0fsm9648571wrp.114.2024.01.22.03.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 03:05:54 -0800 (PST)
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
X-Inumbo-ID: 35ecc139-b916-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705921554; x=1706526354; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x0XYnqPg3hrQx3qGSrK7fbANNM6gmca3vhl10tKBA1c=;
        b=wRqQL/XyDe2TkN6yLuUspMU9dJtOZbYvsO7b1OaGGA2ym4b/dT5kZ0KKwMsAhKIBQb
         JGHe3N24rcvC8O3Qoy0HUfzVgbbNLSZAmKC1kLHSQhGLBmXKzIj3YeoC7NNDHliI9lS1
         rY41NCuur67jIW3d2HiQ4iONZSQ++uAr/Y8Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921554; x=1706526354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0XYnqPg3hrQx3qGSrK7fbANNM6gmca3vhl10tKBA1c=;
        b=U9yCiY0PgWGAzz5fBwL0Kyf/wTlzIQuQPIgg+4Dpd5sKeyjLdNTAbLNn1Y4Cix7Rji
         is18M2ezRggHZ8rI6v71CJNno6G2D6Sy/QqfYI1WDxCX0VmUUjNnu4qSvMkl+8xkY1JE
         j8kcH9TJZ5NIOTX5cptYMmRpSGXgW0AnB0v6xCzaBto8mLS+Xa28h/vbBVmOaK+S6LJY
         t/jS83EBvUTtoNoIc35qMp9vs9IKNuihjIQ8gxU8ezD6qpUixi67wAJe5I1NQnf2AIql
         Je3TvJRy5TuBd4kLQI4VDTj0b4cWKtEnWx6UVUiQXHjoT6cGlnaL1HtmSDA5qmbj9395
         lnYg==
X-Gm-Message-State: AOJu0YxEqGf3Md3iuG8DSL9UaWW20bcEj7D2PQaXmDIlyi1tA5GEYexw
	8O7C5bhvk38ZETTLb2yHCdkSAYjaD+2zyCE0HhTyXCX7f8XhQzQD+0GTc7N0yHc=
X-Google-Smtp-Source: AGHT+IE2kMkF2Qyo1oqMZG/M4fVEpZhbArJQk9ahTDfZRdSPQtQVG9LwnOhCO56OxiqSX7doldPXxg==
X-Received: by 2002:a5d:5951:0:b0:339:22d2:adf3 with SMTP id e17-20020a5d5951000000b0033922d2adf3mr2243106wri.109.1705921554423;
        Mon, 22 Jan 2024 03:05:54 -0800 (PST)
Date: Mon, 22 Jan 2024 11:05:53 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
Message-ID: <d4842805-7e94-49ce-8f14-78642f469e02@perard>
References: <20240118120641.24824-1-michal.orzel@amd.com>
 <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
 <e399890c-0299-4ec5-884e-0637ae6cb5b0@perard>
 <9d552e6d-eb5d-4ccf-a35d-a359df7c4478@amd.com>
 <0a1c749b-8169-43b5-9921-961096f8570d@perard>
 <0437c4eb-8438-44a8-a749-aef6c4c93ef0@suse.com>
 <01dd5e72-c33c-49c7-838a-4e0eba454c05@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01dd5e72-c33c-49c7-838a-4e0eba454c05@perard>

On Mon, Jan 22, 2024 at 10:54:13AM +0000, Anthony PERARD wrote:
> On Mon, Jan 22, 2024 at 11:04:41AM +0100, Jan Beulich wrote:
> > On 19.01.2024 16:25, Anthony PERARD wrote:
> > > On Fri, Jan 19, 2024 at 09:43:30AM +0100, Michal Orzel wrote:
> > >> Is my understanding correct that by switching from extra-y to targets we are preventing these objects to
> > >> appear in non-init-objects (and thus having COV_FLAGS appended) while retaining the proper if_changed behavior?
> > >>
> > >> According to docs/misc/xen-makefiles/makefiles.rst:
> > >> Any target that utilises if_changed must be listed in $(targets),
> > >> otherwise the command line check will fail, and the target will
> > >> always be built.
> > > 
> > > Indeed, and $(extra-y) is added to $(targets) via
> > > $(targets-for-builtin).
> > > 
> > > While switching from $(extra-y) to $(targets) prevents the objects from
> > > been added to $(non-init-objets), it doesn't matter because "libelf.o"
> > > is in that variable, so $(COV_FLAGS) is added to $(_c_flags) and its
> > > value is used in all the prerequisites of "libelf.o" which includes
> > > "libelf-temp.o" and for example "libelf-dominfo.o". So the only thing
> > > preventing $(COV_FLAGS) from been added when building "libelf-tools.o"
> > > for example is that we set `COV_FLAGS:=` for "libelf.o".
> > 
> > Yet doesn't that (again) mean things should actually work as-is, [...]
> 
> No, because I've explain how it should work, in the hypothetical world
> where we have `targets += libelf-temp.o $(libelf-objs)`.

The problem is that there's currently two "paths" to build libelf-temp.o
(and even three I think for libelf-tools.o libelf-loader.o
libelf-dominfo.o):

Simplified makefile:

    obj-y := libelf.o
    extra-y := libelf-temp.o
    COV_FLAGS := -fcoverage

    __build: $(extra-y) built_in.o
    built_in.o: $(obj-y)
    libelf.o: COV_FLAGS :=
    libelf.o: libelf-temp.o

So, make can build "libelf-temp.o" as prerequisite of "__build" the
default target, or as prerequisite of "libelf.o".
In the first case, COV_FLAGS would have all the flags, and in the second
case, COV_FLAGS would be reset, but that second case is too late as make
is more likely to have already built libelf-temp.o with all the flags.

Cheers,

-- 
Anthony PERARD

