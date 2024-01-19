Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAAC832C49
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 16:26:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669087.1041701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQqkL-0008Uw-Ck; Fri, 19 Jan 2024 15:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669087.1041701; Fri, 19 Jan 2024 15:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQqkL-0008SZ-9k; Fri, 19 Jan 2024 15:25:29 +0000
Received: by outflank-mailman (input) for mailman id 669087;
 Fri, 19 Jan 2024 15:25:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4r6=I5=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rQqkK-0008ST-A3
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 15:25:28 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f75236ee-b6de-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 16:25:24 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e86a9fc4bso11000135e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 07:25:24 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 je6-20020a05600c1f8600b0040d8d11bf63sm29590142wmb.41.2024.01.19.07.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 07:25:23 -0800 (PST)
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
X-Inumbo-ID: f75236ee-b6de-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705677924; x=1706282724; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fVJXFXMkRp7aAw/JMBSv8qGqP0OKVxflwcH46R8G7q4=;
        b=plZvf8Ff7q5YyQUZhCc2sRbhTwVKXQQPXcErlqzYW4X/KjTcWqAOOjJN4MbHjfgpKH
         Q7JNON5KMrd6R1HpR6UesLamsYJLPZ879w4o1C8z/1PcfDJ4LF3iwhJk89jAl2QJXncR
         WAL2f+T8fFfbN9NMivHaZfld2AMf5wl81Iphk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705677924; x=1706282724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVJXFXMkRp7aAw/JMBSv8qGqP0OKVxflwcH46R8G7q4=;
        b=cv9NyCFbZXQRcJC5PincDdLS2tVvwTBw8Q+GnC4KbOc7tapLLhjcYL8drYJrcOoJEo
         xLnHIBzpf7RBmvSuPU0ryTyLtdD8sTKFxLzUXP46bB2uTgL7b1TIBHo/jMYYVZ3H8Yg1
         Rkqm0/XDPN64aZFkvMPMjgsHjRtynyRgcAPxYnyQaQ4BZ3rNwZbsx2RrkFBg0I6iRB9Y
         pUbqm8xY6qVE/gs4jC8g7RtZKWJ8wNFje64d0gbkCTpuKtrhCDV4kkY5P3deNWso/zE6
         fFjFg5YrDOcw5Awhgn5U/5q9LWHCjXigyh/ehSBw5cQqW840/ZmGqaEcJfNJtKsSmPUy
         TBNg==
X-Gm-Message-State: AOJu0YwiSY0F7yLdDk9EsiHX4ndsVd9Qy7uQ60WGMlmlNLNdJzZ/SDs8
	ku4eX3up3bNsXjNQOycSY8R8odmnYnkGkcxsEhzzq2+6B1ZNMIojaqdQ3euSLNU=
X-Google-Smtp-Source: AGHT+IGz5WRYHi0KnnS1ULtTbgaXLH8b/Omi4N8PJEAJgJuwmEIFv15m9lxQhplSrSmxkeJ6/gczTA==
X-Received: by 2002:a05:600c:4686:b0:40e:52d8:c0c8 with SMTP id p6-20020a05600c468600b0040e52d8c0c8mr1582271wmo.129.1705677923930;
        Fri, 19 Jan 2024 07:25:23 -0800 (PST)
Date: Fri, 19 Jan 2024 15:25:22 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
Message-ID: <0a1c749b-8169-43b5-9921-961096f8570d@perard>
References: <20240118120641.24824-1-michal.orzel@amd.com>
 <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
 <e399890c-0299-4ec5-884e-0637ae6cb5b0@perard>
 <9d552e6d-eb5d-4ccf-a35d-a359df7c4478@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d552e6d-eb5d-4ccf-a35d-a359df7c4478@amd.com>

On Fri, Jan 19, 2024 at 09:43:30AM +0100, Michal Orzel wrote:
> Is my understanding correct that by switching from extra-y to targets we are preventing these objects to
> appear in non-init-objects (and thus having COV_FLAGS appended) while retaining the proper if_changed behavior?
> 
> According to docs/misc/xen-makefiles/makefiles.rst:
> Any target that utilises if_changed must be listed in $(targets),
> otherwise the command line check will fail, and the target will
> always be built.

Indeed, and $(extra-y) is added to $(targets) via
$(targets-for-builtin).

While switching from $(extra-y) to $(targets) prevents the objects from
been added to $(non-init-objets), it doesn't matter because "libelf.o"
is in that variable, so $(COV_FLAGS) is added to $(_c_flags) and its
value is used in all the prerequisites of "libelf.o" which includes
"libelf-temp.o" and for example "libelf-dominfo.o". So the only thing
preventing $(COV_FLAGS) from been added when building "libelf-tools.o"
for example is that we set `COV_FLAGS:=` for "libelf.o".

Cheers,

-- 
Anthony PERARD

