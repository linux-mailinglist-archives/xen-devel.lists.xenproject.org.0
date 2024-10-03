Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A4698ED55
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 12:51:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809260.1221498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJQI-0005nV-1O; Thu, 03 Oct 2024 10:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809260.1221498; Thu, 03 Oct 2024 10:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJQH-0005kZ-V4; Thu, 03 Oct 2024 10:51:05 +0000
Received: by outflank-mailman (input) for mailman id 809260;
 Thu, 03 Oct 2024 10:51:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xwa6=Q7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1swJQG-0005kT-9N
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 10:51:04 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61c3acfe-8175-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 12:51:02 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d0d82e76aso128225066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 03:51:02 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102a6244sm68908166b.78.2024.10.03.03.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 03:51:01 -0700 (PDT)
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
X-Inumbo-ID: 61c3acfe-8175-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727952662; x=1728557462; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zg5b05Ze1jZTjiW+VVnm+tC9FAI/w4jAQXl/VMxT3i4=;
        b=shA+xjBkKcADsC+OSwZWJgRR4OZ+6PwAS9ahp8tGDAkIEBmyVne7HoZWfG2UbZdyJv
         reEJlAf0xciCa7qYpC1v+1UOgXgOeFWZZDm6IS9fkv2KTqBwysBdpZxI3M8A8kxntSj4
         4XyVrkOJ4BQ51omm4ch3Wi7FXY2zwqQYlQB9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727952662; x=1728557462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zg5b05Ze1jZTjiW+VVnm+tC9FAI/w4jAQXl/VMxT3i4=;
        b=QBkB+LLyhwih3FM3iquXyE4JS6XodwvqnHhkln7j5OGva4U7H7IfAkVLWpUZs62YDK
         d0j6dapeslwGfhyZeUY7w9tvuE3RCpo1cY2AiAdcA6TKJwt8Zhjbdb+Xol4LSaAz7IQ0
         DiAIaZEhuNFVXrHNZjUR+OgUdlVXlrd/MchPtiMh+eZNErXRED8U1+AMuPCKXV1w4caG
         tvFoWEvLlxCkfmuQIo79Ksgryrd5S9uRbRxfw5q6XOf4JOzedowV6CzAyUILH1bQurBV
         BKL/IbtCjWEwRJL3QZmLMyNvUyMrBmWyZB6X5xnXB/X8Pn1Du1FptPcqRfKGMINISuL5
         vAKA==
X-Gm-Message-State: AOJu0YwSKov07veWRgmiKWPaPLxuJLQOEr+wrkfC4fSkih+H4lHKvts8
	PnYqnORQDa521vgoGUlBL4gZgwEfLZ1tyCh8NPgQjzYafjuqsQK/UMOvaoAm1qA=
X-Google-Smtp-Source: AGHT+IEQVYuiglu3iuQjgpVY131ZdkUPdgRG0y3sbWwwPj2BtxDa7bfV4w8FDk7We6VXobDL1DSWYg==
X-Received: by 2002:a17:907:3f88:b0:a8d:e4b:d7fe with SMTP id a640c23a62f3a-a98f7ffbb2cmr685276266b.0.1727952661917;
        Thu, 03 Oct 2024 03:51:01 -0700 (PDT)
Date: Thu, 3 Oct 2024 12:51:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/APIC: Switch flat driver to use phys dst for ext
 ints
Message-ID: <Zv53FGD0ju5XsVjz@macbook.local>
References: <cover.1727880621.git.matthew.barnes@cloud.com>
 <8c6d1fee5261169a9bbc62ed1bafd2c32406fb4c.1727880621.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8c6d1fee5261169a9bbc62ed1bafd2c32406fb4c.1727880621.git.matthew.barnes@cloud.com>

On Wed, Oct 02, 2024 at 04:17:24PM +0100, Matthew Barnes wrote:

The commit needs a log, doesn't need to be extremely long, but it's
important to note the reasoning behind using physical delivery for
external interrupts vs logial mode.

Take a look at the x2APIC one for inspiration, the motivation should
be similar.

Thanks, Roger.

