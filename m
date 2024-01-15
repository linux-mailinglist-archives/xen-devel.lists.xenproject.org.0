Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4516582DC85
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 16:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667480.1038783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPP6K-0008RK-Lq; Mon, 15 Jan 2024 15:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667480.1038783; Mon, 15 Jan 2024 15:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPP6K-0008P5-IN; Mon, 15 Jan 2024 15:42:12 +0000
Received: by outflank-mailman (input) for mailman id 667480;
 Mon, 15 Jan 2024 15:42:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tunR=IZ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rPP6J-0008Oz-R6
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 15:42:11 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a572b9eb-b3bc-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 16:42:10 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so987233166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 07:42:10 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 qc21-20020a170906d8b500b00a26ac5e3683sm5396852ejb.100.2024.01.15.07.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 07:42:09 -0800 (PST)
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
X-Inumbo-ID: a572b9eb-b3bc-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705333330; x=1705938130; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w479U4xtwJAf5IuOKVdAk7jshwBn9K1/tolR5ewe7OM=;
        b=s6we3uEqx/zD444QYmhUps77UDMOrRwh2+8ZgohBhIn3cHos7I84KJbxWGIsJs3Ajo
         dmTh7l6w7tem2QHTQdKL0SjKBUYtyZm21Q8oLMCsxZkhYxzStNds+0InbXgLZ1LJc7Vs
         6YI+IS1oZUtECUGwKvyPwYzaPKJPP91SaRXKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705333330; x=1705938130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w479U4xtwJAf5IuOKVdAk7jshwBn9K1/tolR5ewe7OM=;
        b=aPA0vNcI4armSqVfVvkQM9987SSeiohhgSaHp5EXuUbmzCVgxeMEP+Bp9VZ21FVKCw
         r9ABuXnWeVQhgUpsMsYbxvKwzI/GxeX4bMTeofu7K3fns2zSnr9hqLYPoZKzeVDtNT3Q
         t98P3UWI31dpL+EJM+ydUQ22wkCKbqcq5yUSut6GAZRGcMgpmCeUVuGhbjsHhm4zYRtd
         p61OUNmwlzOXCxrvDeqnZmcUyeRglj9+t4fXqSDzgSWancG+htNwO5AbXVFJZB4w/5j0
         zcWloGM1rP9ZhMIf1QEY49xLy+gv1Y/eaXI5CZ9aB3MQK08dWWb1NbF+xwTmf0L1QR5t
         4JqQ==
X-Gm-Message-State: AOJu0YxYqcMzbTyv3Gam7NtqoVs1TpUbgX9aUCesfGf1JqUE4Fe5bPIB
	cz4P4DiGErA/02L7PuNKiI6msX9a/+O85g==
X-Google-Smtp-Source: AGHT+IH7UZUULTz6NPtrpB9XHNRbtdyaVDYfzoppljJB/11dNffDdSMYoh5ZPDa1giAUNd2V9Y1NJw==
X-Received: by 2002:a17:906:3e49:b0:a2d:c66a:feb6 with SMTP id t9-20020a1709063e4900b00a2dc66afeb6mr887168eji.83.1705333330295;
        Mon, 15 Jan 2024 07:42:10 -0800 (PST)
Date: Mon, 15 Jan 2024 15:42:09 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Julien Grall <julien@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v3 00/33] tools: enable xenstore-stubdom to use 9pfs
Message-ID: <ffd345a5-018e-4c42-b5ba-093ffe26e68b@perard>
References: <20240104090055.27323-1-jgross@suse.com>
 <db974c3d-7bd8-4317-8757-e7fd3ebda7b3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db974c3d-7bd8-4317-8757-e7fd3ebda7b3@citrix.com>

On Fri, Jan 05, 2024 at 03:20:11PM +0000, Andrew Cooper wrote:
> On 04/01/2024 9:00 am, Juergen Gross wrote:
> >   tools: add a new xen logging daemon
> >   tools/xenlogd: connect to frontend
> >   tools/xenlogd: add transport layer
> >   tools/xenlogd: add 9pfs response generation support
> >   tools/xenlogd: add 9pfs version request support
> >   tools/xenlogd: add 9pfs attach request support
> >   tools/xenlogd: add 9pfs walk request support
> >   tools/xenlogd: add 9pfs open request support
> >   tools/xenlogd: add 9pfs clunk request support
> >   tools/xenlogd: add 9pfs create request support
> >   tools/xenlogd: add 9pfs stat request support
> >   tools/xenlogd: add 9pfs write request support
> >   tools/xenlogd: add 9pfs read request support
> 
> These all need s/logd/9pfsd/, although I think mostly in the subject only.
> 
> Can be fixed on commit, because some of them look like they're otherwise
> ready to go in.

For all these patch, with the subject fixed:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Cheers,

-- 
Anthony PERARD

