Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4508D4F65
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 17:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732807.1138824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCi0c-0003NL-L3; Thu, 30 May 2024 15:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732807.1138824; Thu, 30 May 2024 15:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCi0c-0003L6-IF; Thu, 30 May 2024 15:48:06 +0000
Received: by outflank-mailman (input) for mailman id 732807;
 Thu, 30 May 2024 15:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MghO=NB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCi0b-0003L0-1J
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 15:48:05 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id feaa4aed-1e9b-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 17:48:02 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6ae0adfba9cso5624466d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 08:48:02 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ae3747dabfsm1590926d6.80.2024.05.30.08.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 08:48:00 -0700 (PDT)
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
X-Inumbo-ID: feaa4aed-1e9b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717084081; x=1717688881; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oxqf3xs1970Nf5zEjfxi/reh434J2MVMUjSk7tO9XVk=;
        b=grlr1wTWe6rXInwLhhL9i7Q0zAafTYM5pvnYWJf+nglTOMtGQm3i0SAGwmERpyyDqD
         23wNBCIsmPIEcIwXbDl9wnbtKfccvK0UApKV9zzgxp5TaOaCEunFMTZ0Qw3AwFZTWCQM
         rN4IVMzPplfqTK231Th/O9fhjVaBiZTKSOgdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717084081; x=1717688881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxqf3xs1970Nf5zEjfxi/reh434J2MVMUjSk7tO9XVk=;
        b=pvn3seU9MqS91t/rT1D7pnZmQAk1AIGrNQ2zNIjPfh+nyg9LKDn+ZSOThHjhUgLfew
         j5lASdJRG8d0d2siSfKw7fcD5/aoYDpDg/8bE0/J+1zMpkChOKnO0EdC7PybrJzZgrU7
         gZedbkMt+7xVoCHxdWvZcCJN3UnYg2k2trhrEUE6vnGNTOlCYirjBWY8zp4NCr1/hmtM
         B3sdBYqcr/IsIdRWBXWoUxuYi3M64jOc9l7OyacLUhUyKGN6TXPxudXQa1kEZZAiXzAL
         E8wCvkr3qFF4rMkNc/ChspQa1pjfiq5Ddfl2eBTwCCQcQjgPXuj644k/GmgYBjfyB02W
         qPyw==
X-Forwarded-Encrypted: i=1; AJvYcCWx0YeOI8+HjMWmTEpc8e7P0tF2bLN36ZyTc42ZDdt0IzaqjZYbehRLYyeD59HfKFAGz3hxIkPJUVPHXMEq0lUtENCYPjerGedMo1K1bx4=
X-Gm-Message-State: AOJu0YyIaH7VQFwqf6Hm6plVZhGUEEWNq5eSOe3+OzYk9iDUxh7x3cYO
	9/hfTzDPN3+KsJZOrkWPA66RTnIwFQdHo3YMx7eZwUvzi7GHZr/VABbGsqTSwRw=
X-Google-Smtp-Source: AGHT+IHE9QQL0YCf+/J5BYCzknuSYnGYXbQ6CM3je54Kz7kkHtTY+j+Jg+sXGzp1GTOoWYKJVt35Eg==
X-Received: by 2002:a05:6214:3c8a:b0:6ae:20:3723 with SMTP id 6a1803df08f44-6ae0cafc262mr30183836d6.5.1717084080634;
        Thu, 30 May 2024 08:48:00 -0700 (PDT)
Date: Thu, 30 May 2024 17:47:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 2/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
Message-ID: <Zlifrqp5NfKu8xTw@macbook>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
 <9912423b866ed696c375e0a51954d363c3706470.1716976271.git.alejandro.vallejo@cloud.com>
 <0d3101bc-624e-43b0-95e7-cc89de3bb259@citrix.com>
 <e6b9fc65-365b-4a38-8181-a76d576939e4@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e6b9fc65-365b-4a38-8181-a76d576939e4@cloud.com>

On Thu, May 30, 2024 at 02:48:10PM +0100, Alejandro Vallejo wrote:
> I'll try to do that soon-ish. I suspect the pain points are going to be
> making it work nicely as well on 1vCPU systems with no APIC (are
> those expected to work?).

We do not allow creation of PVH/HVM domains without an emulated local
APIC, and I don't think we ever want to allow doing so (see
emulation_flags_ok()).

Thanks, Roger.

