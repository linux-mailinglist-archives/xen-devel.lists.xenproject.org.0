Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD77855037
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 18:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681107.1059708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJ34-0007YE-SU; Wed, 14 Feb 2024 17:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681107.1059708; Wed, 14 Feb 2024 17:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJ34-0007Vw-O9; Wed, 14 Feb 2024 17:27:54 +0000
Received: by outflank-mailman (input) for mailman id 681107;
 Wed, 14 Feb 2024 17:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hroU=JX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1raJ33-0007Vq-1l
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 17:27:53 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61a16c62-cb5e-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 18:27:52 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso659065f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 09:27:52 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fm7-20020a05600c0c0700b00411062c123esm2609487wmb.26.2024.02.14.09.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 09:27:51 -0800 (PST)
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
X-Inumbo-ID: 61a16c62-cb5e-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707931671; x=1708536471; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+IxHnV8/9K1qQ9cTZTKCjiDJk/W8DnR94KHlGZYkQ0M=;
        b=sJPW+cImXSJ6f1GprIJj48R08zWg7xoWTuhcQe2Rmzi6PiemiguKJhW7lDzWSewENC
         PzoMV2jl32LphAaFlaGZhe6OoHqafcYD8IQbfst7G4b307qCsaeBuvQ2ySLTSugEVA9o
         nlHvvFjV8p/zbXWRwPBQgYx/QqQo7BEeAioJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707931671; x=1708536471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IxHnV8/9K1qQ9cTZTKCjiDJk/W8DnR94KHlGZYkQ0M=;
        b=CmybW1SbOMtIAKv/J31TGgFK9lsobbEY5771wIN3SmU7icZL1HjEKrjcaml9iqi81u
         NSJC2wodPgNF7N8Tq8T5x4jU3e0TVA4qtqfdiQd5+ELw2XMy1LFBQJjKJ2XPk2mr23rl
         X629vcQUzP5SnalaN+AZ7oVG0jaoOH9aOXboLQMSlkUbWYW0S5rptB34pUcEi1iT7Qra
         rwNfcB2Cc60mT/OMUZYeKrlcI8xWlQbeA+CNkyLTS8b86o2ugLMgGM2M6cY1rYtDH6IO
         4QNPVb9XnZ1bL0aQ+O2MQs4xhGNE2qhnv8RlvcNWOZw7HRrcwLOHwKFVsZuSr8saegV8
         I6XA==
X-Gm-Message-State: AOJu0Yylj0ZzLC3b5+TiLLadE1GKDsZ5eR8qNllrrcVJApjLhiSksQan
	A+VTvndj2KZ+CdG7HWAsGsIvJmPOQsnDeSwPDxWZlrN4Kbi7b5S89/PuSlK8XF4=
X-Google-Smtp-Source: AGHT+IEWpTGUH6XrpQRC5lTcS8bV31/yc5/WTMnxibCgSv+EyL6vBw25kdlGBui518ylwHEhHhVseQ==
X-Received: by 2002:a5d:4048:0:b0:33b:2138:623c with SMTP id w8-20020a5d4048000000b0033b2138623cmr2576466wrp.16.1707931671686;
        Wed, 14 Feb 2024 09:27:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+eRRBXsyqDNpx2sZmEfNi0pFI7QkUWFr5OJ37smIpWL1sUtGWRinygUlMssD8YxzEmjQox3GCq906JRst3S3oqjCC+MoGT832nn0T3FSYvaHr5sKSTkPF0JoDa/1Qn7pPM9OGotAraVby1Yh08+HDQXrXz4jTjpFSWWEBAQ+HCfE/l09qC7huMJ8eKlk6ty6tkvCyzwE=
Date: Wed, 14 Feb 2024 17:27:50 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
	Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@cloud.com>
Subject: Re: [PATCH v5 15/22] tools/libs/light: add backend type for 9pfs PV
 devices
Message-ID: <a3a0d9eb-97ae-4e5d-ad08-cfe5319836d7@perard>
References: <20240208165546.5715-1-jgross@suse.com>
 <20240208165546.5715-16-jgross@suse.com>
 <5e6893dd-5280-4a14-8d00-4ed76e8c8e98@perard>
 <c6af9dd1-01d4-48a2-86b9-ccb2967136f7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6af9dd1-01d4-48a2-86b9-ccb2967136f7@suse.com>

On Wed, Feb 14, 2024 at 11:18:18AM +0100, Jürgen Groß wrote:
> On 13.02.24 19:03, Anthony PERARD wrote:
> > On Thu, Feb 08, 2024 at 05:55:39PM +0100, Juergen Gross wrote:
> > > +struct libxl__aop9_state {
> > > +    libxl__spawn_state spawn;
> > > +    libxl__ao_device *aodev;
> > > +    libxl_device_p9 p9;
> > > +    uint32_t domid;
> > > +    void (*callback)(libxl__egc *, libxl__aop9_state *, int);
> > 
> > This "callback" is never used, right?
> 
> Why do you think so?
> 
> In xen9pfsd_spawn() it is used:
> 
>   aop9->callback = xen9pfsd_spawn_outcome;

By never used, I mean that nothing is reading the value, their is no
"aop9->callback(egc, aop9, rc)" call.
It might have been useful if a caller of xen9pfsd_spawn() was actually
setting this field, but that's not an option here. And callbacks of
xen9pfsd_spawn() knows to call xen9pfsd_spawn_outcome() when done.

Cheers,

-- 
Anthony PERARD

