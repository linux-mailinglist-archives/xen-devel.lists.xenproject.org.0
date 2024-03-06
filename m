Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C273D8735F6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 13:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689103.1074103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpwA-0000Ty-Jk; Wed, 06 Mar 2024 11:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689103.1074103; Wed, 06 Mar 2024 11:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhpwA-0000R9-H9; Wed, 06 Mar 2024 11:59:54 +0000
Received: by outflank-mailman (input) for mailman id 689103;
 Wed, 06 Mar 2024 11:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KzOk=KM=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rhpw8-0000Pn-St
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 11:59:52 +0000
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [2607:f8b0:4864:20::d31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 098879a7-dbb1-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 12:59:51 +0100 (CET)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7bf7e37dc60so409024339f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 03:59:52 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d9-20020a0566022be900b007c846141896sm1095305ioy.48.2024.03.06.03.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 03:59:50 -0800 (PST)
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
X-Inumbo-ID: 098879a7-dbb1-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709726390; x=1710331190; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NvtCLWEkDnqIRcLE11fSaP0TSAScu/X/6l3pbT5JiFQ=;
        b=fy/viRlQi3xzlgKaKthG38k0H1ARe1MBvt1u1V8OPilfQ6vLOglEYoWnu8pXlfCtbY
         HQsxChessal1IGyQUtI0nB7+8HYmVOMEEt9V9/cDtTGU+27NWF/4npjf3zUl3TBxkmxa
         4+vHzpjIoT9hvNyjn51cJWanNgI/dz1g9Lpsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709726390; x=1710331190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvtCLWEkDnqIRcLE11fSaP0TSAScu/X/6l3pbT5JiFQ=;
        b=N3D7maYSEdVvcmTm48U1oS389YkUQhU6i1X9upCZJbJxG1R7qqxm7c574nRYOQE+Ao
         GlxKmedDJ6/Hp9ayfKaMkdtXxWg3aJfyZCS8PTr7u+9MEmubVe7T8Ppfn1H1eWpXYi6O
         I5d4nEp/95WYHHhZB4DadJldHwhq/Lbsq7XBPLF4LFJXxTKYFcrLAaLcfhn3XpdtnjuF
         +0AyX0dXw6ZCs1q3a75wJF1pSzrvs0Ijn5IfaRpTmdRa/OR0OtY8i9ZFuZOt+jAmAamn
         Y+uIFxx9PvUg5HDEmsjYKfA4b0jhGrEEAFqW6CeCMIOBJW4q/C4RvNOGbXl8wLZbQr10
         ep3g==
X-Forwarded-Encrypted: i=1; AJvYcCXZzF4J5iBI23g3Jkb6ph6qtzmx/ntLVRH3Aa79MJevaUUQKTq1bHYnjLY/fp3jpOpmGD1DIRAdhiWp6ZLq5cgFDhrgNLX2TCmEjDMzSlo=
X-Gm-Message-State: AOJu0YzGPKMODJwDtntqwkDA5MVkwm3o0CBUKYJV844gBWeQaN2f/zKp
	pBqMVAiQbHlHGWSUXCDZ0vinUoSfZLc6Lw38UdOjGkSbJmJZDsmzlTPtwJ2tn8Q=
X-Google-Smtp-Source: AGHT+IG4dE44lmGq+NiQT2nvR63EU4cTEVoK7b+cjuwpN9C0wE4mGKyAnRNXVuhliERdO6D3Asjn3A==
X-Received: by 2002:a05:6602:53:b0:7c8:395b:3e62 with SMTP id z19-20020a056602005300b007c8395b3e62mr13075071ioz.3.1709726390657;
        Wed, 06 Mar 2024 03:59:50 -0800 (PST)
Date: Wed, 6 Mar 2024 11:59:47 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] 9pfsd: allow building with old glibc
Message-ID: <b454b728-4917-44a3-8022-6ab6d1a9833f@perard>
References: <3aca1707-9eab-4b85-a4ae-e56508b15843@suse.com>
 <0eeab3e6-f4fb-4723-a674-f5bbdb285356@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0eeab3e6-f4fb-4723-a674-f5bbdb285356@suse.com>

On Tue, Mar 05, 2024 at 04:23:23PM +0100, Jürgen Groß wrote:
> On 05.03.24 15:33, Jan Beulich wrote:
> > Neither pread() / pwrite() nor O_DIRECTORY are available from glibc
> > 2.11.3 headers without defining (e.g.) _GNU_SOURCE. Supplying the
> > definition unconditionally shouldn't be a problem, seeing that various
> > other tools/ components do so, too.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Fine with me.
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

