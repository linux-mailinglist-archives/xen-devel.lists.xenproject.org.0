Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A1D831E89
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 18:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668852.1041350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQWL8-0002SG-2e; Thu, 18 Jan 2024 17:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668852.1041350; Thu, 18 Jan 2024 17:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQWL7-0002QL-VM; Thu, 18 Jan 2024 17:38:05 +0000
Received: by outflank-mailman (input) for mailman id 668852;
 Thu, 18 Jan 2024 17:38:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsoE=I4=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rQWL5-0002QF-TO
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 17:38:03 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 526ea0d2-b628-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 18:37:59 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e959b1867so5918885e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 09:37:59 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c1d8900b0040e95632357sm1768493wms.26.2024.01.18.09.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 09:37:58 -0800 (PST)
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
X-Inumbo-ID: 526ea0d2-b628-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705599479; x=1706204279; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Odkw6lBmhr0HNRPsHIor/laqkbwOgrGwsu5YxKAVXMI=;
        b=t6Yzjt3M9nS4AGkN2/OIdXGO1MjU5CCt4OiSPVr3vIQJZp6YaXQ/2C4n2WL6NoTr2v
         ipR49fMHOHChoRvJ2t6tlCtGZ87UghUyYrcuYisFSma2/xkeEWbGUaofONqTiOJEi/Tm
         uD+Yq+MSfhqk9BCk+0gyTFXFzTn9Xb407jYNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705599479; x=1706204279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Odkw6lBmhr0HNRPsHIor/laqkbwOgrGwsu5YxKAVXMI=;
        b=MzbHsakW68aINxBdPqKVmGl7Pjvab1azUX1c6Fs7KaMDqwMtlLIirSGMEDdGHx+K0j
         O+f2ptleMABjk/i93AxkUCLIfxGs934Rw7Y/6bj0aZjW8bMQmdTqiWkhoQ9iKkvm4jSQ
         JpdvVd0bq51xjkYy2/P0VNjz/GvbFq/ns0gqMADT+IEjCqvJbUIfdK6E9Wh7utxNyyt9
         dIZp4oOw81S5lD9OomrXJYOry4JTN1FdwZPeHPa6O6/Iz3y2yDhd9fcZ+86cuQTdjtVp
         iZfQ7ty8OcO4rorsSBvcYaDs9dhALej9UnQ+gjglakkKGbnJciWJTjBQtObM7/wPRcaG
         UGKA==
X-Gm-Message-State: AOJu0Yww0/JEeopgo+9BTSUVk+a8G6akANUWZvQ1yompjqaCf/wewLhy
	cgpEx4i1p3IfQkPkYtHwhRwglCA/t1baExKNwyxMq7+tv6hU6g1wjebTtn9cqbk=
X-Google-Smtp-Source: AGHT+IGVU8q4FcjPAiTchxnTCtSZdh1D0y4So0T2vM0KKNX+VpDFugRPqOLvIFUeEoYJobPw+ayQqQ==
X-Received: by 2002:a05:600c:3ca1:b0:40e:532d:50c4 with SMTP id bg33-20020a05600c3ca100b0040e532d50c4mr723641wmb.130.1705599478933;
        Thu, 18 Jan 2024 09:37:58 -0800 (PST)
Date: Thu, 18 Jan 2024 17:37:58 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
Message-ID: <e399890c-0299-4ec5-884e-0637ae6cb5b0@perard>
References: <20240118120641.24824-1-michal.orzel@amd.com>
 <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>

On Thu, Jan 18, 2024 at 02:12:21PM +0100, Jan Beulich wrote:
> On 18.01.2024 13:06, Michal Orzel wrote:
> > At the moment, trying to run xencov read/reset (calling SYSCTL_coverage_op
> > under the hood) results in a crash. This is due to an attempt to
> > access code in the .init.* sections (libfdt for Arm and libelf for x86)
> > that are stripped after boot. Normally, the build system compiles any
> > *.init.o file without COV_FLAGS. However, these two libraries are
> > handled differently as sections will be renamed to init after linking.
> > 
> > This worked until e321576f4047 ("xen/build: start using if_changed")
> > that added lib{fdt,elf}-temp.o to extra-y. Any file listed there without
> > *.init.o suffix will be part of non-init-objects for which COV_FLAGS
> > will be appended.
> 
> While this is true, aiui COV_FLAGS would be empty for anything listed
> in nocov-y and all of the prerequisites of those objects (iirc target-
> specific variable settings propagate to prerequisites). Therefore ...
> 
> > In such case, the solution is to add a file to nocov-y.
> 
> ... libelf.o / libfdt.o already being listed there ought to suffice.
> Alternatively listing only libelf-temp.o / libfdt-temp.o ought to
> suffice as well.
> 
> Since you apparently observed things not working, I must be missing
> something.

Yes, $(extra-y) is like $(obj-y), but objects there will not be added
"built_in.o". So, make is likely building "libelf-temp.o" and deps
because it's in $(extra-y) rather than because it's a prerequisite of
"libelf.o". We could ask make to process prerequisite in a reverse
order, and suddenly, the command line to make all "libelf-*.o" is
different: `make --shuffle=reverse V=2`.

So, adding extra object to $(nocov-y) is a workaround, but I think a
better fix would be to add those objects to $(targets) instead of
$(extra-y). I think I've made a mistake by using $(extra-y) instead of
$(targets) in that original commit.

Cheers,

-- 
Anthony PERARD

