Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81FD93F004
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 10:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766439.1176914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLu3-0002pI-Eo; Mon, 29 Jul 2024 08:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766439.1176914; Mon, 29 Jul 2024 08:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLu3-0002m5-AO; Mon, 29 Jul 2024 08:38:47 +0000
Received: by outflank-mailman (input) for mailman id 766439;
 Mon, 29 Jul 2024 08:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfTU=O5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYLu1-0002lz-45
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 08:38:45 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f66c8715-4d85-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 10:38:43 +0200 (CEST)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-44ff6dd158cso19043781cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 01:38:43 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe814c2bbsm39878511cf.35.2024.07.29.01.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 01:38:42 -0700 (PDT)
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
X-Inumbo-ID: f66c8715-4d85-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722242322; x=1722847122; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yksyStlcpCKPHCR2lpoH4mXGfQBNBTxFjbm/2lizJuI=;
        b=JU9J23YvBUcLuD4FrvueiAYEurxW6U+afrbo3Oc+bnGCwgGj/pKGiEhyzReiipA1o1
         upoKWL0XWkEdcUZb727C5vAsVtsMsuf84RXFn72Te7JwPLdMOcnThO0RS51QGPZT5jNG
         hbb4qk9VO7IwGM9AoywQp2TJ4gGMvhGms2xKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722242322; x=1722847122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yksyStlcpCKPHCR2lpoH4mXGfQBNBTxFjbm/2lizJuI=;
        b=lj4MNT+U8WpqI5dtOUh9iFEn6LyezYPD3ZyhGQVDWedtbeaiLkWjT4GM/2ah0yEj0k
         29YizuArWvOD4I/SeC+axzAQbQaM9D/I97N6+5VsJRvoVP6mkovrU17j0EPrB9ZKr1EP
         h7fQzZMwMBGtUtdkJcRE4DIsPmZo8LiFl1WvG8YFimokUCfZ2k2Cuk5edgP3sk5DNF47
         yo3/7K1+wHW7uHvf1P5AW0U+ZvEXzGDs3vXKbEF0djcfM8V8Py6NR2QlSVs8dpHway1a
         nH7QDfEzvyOWgUYZPtmM6Q3KiJiGU1iBV4suRdwdn47lOnijYjRRThpzCGDoY5NB9oOZ
         193w==
X-Forwarded-Encrypted: i=1; AJvYcCVq20WyZw05MMcnF4y78YdiqO2uPuE5VUSiNA2KJbgOndZB9Dx4pKW1DRp9NFl+OkkEhPwGJCYsSUkVPQxN5RQ4Y99KKzx21HQCybj9/3k=
X-Gm-Message-State: AOJu0Yw5nf+s/ELvJJIBT94b3gSaqjDmJqiY8Aw2qH9IJyLjigaUkmFx
	6vw/tHHE5Mh5ZJ4AkXcixdD5as2RXzdE7rI7FkMTeiw2HIR+Tki9c6n0bbP6nVc=
X-Google-Smtp-Source: AGHT+IF54BaRbwvUbu6aqAXUbcCRTREORUj+xk1kO3hdhPt6asghppOM5RYZ5Usi8/S5trV7aI4K6w==
X-Received: by 2002:a05:622a:1888:b0:446:4b81:807d with SMTP id d75a77b69052e-45004d68f98mr100381161cf.1.1722242322613;
        Mon, 29 Jul 2024 01:38:42 -0700 (PDT)
Date: Mon, 29 Jul 2024 10:38:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	"committers @ xenproject . org" <committers@xenproject.org>,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for 4.19] CHANGELOG.md: Finalize changes in 4.19 release
 cycle
Message-ID: <ZqdVEDNZDxhAXb_p@macbook>
References: <0c93b49ac00fa92721035b4f9eb2ae76175fe886.1722237887.git.oleksii.kurochko@gmail.com>
 <f2450b46-3542-4e1c-b7d7-8735b1839791@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2450b46-3542-4e1c-b7d7-8735b1839791@suse.com>

On Mon, Jul 29, 2024 at 10:11:23AM +0200, Jan Beulich wrote:
> On 29.07.2024 09:31, Oleksii Kurochko wrote:
> > @@ -23,6 +34,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >     using a standalone library implementation.
> >   - xenalyze no longer requires `--svm-mode` when analyzing traces
> >     generated on AMD CPUs
> > + - CI updates:
> > +   - Minimum fixes to rebuild the containers, following the HEREDOC problems.
> > +   - Rebuild containers to have testing with up-to-date LTS distros.
> > +   - Few build system checks, and strip the obsolete contents of
> > +     the build containers.
> 
> This again doesn't concern people using Xen, does it?

I think the CHANGELOG was for both users consuming Xen, but also for
developers (or more technical consumers) to know what changed between
releases.

The PR notes should indeed be more user-focused, but in that case I
still think mentioning something about increased efforts to improve
Gitlab CI is worth having in the release notes, so people know
improvements are being done wrt testing.

Thanks, Roger.

