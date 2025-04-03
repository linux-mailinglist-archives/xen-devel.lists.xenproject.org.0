Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A72FA7B27A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 01:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937524.1338471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0UFp-0003yN-2B; Thu, 03 Apr 2025 23:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937524.1338471; Thu, 03 Apr 2025 23:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0UFo-0003vs-VE; Thu, 03 Apr 2025 23:45:48 +0000
Received: by outflank-mailman (input) for mailman id 937524;
 Thu, 03 Apr 2025 23:45:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu4W=WV=edera.dev=alexander@srs-se1.protection.inumbo.net>)
 id 1u0UFn-0003vm-FA
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 23:45:47 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c30d7956-10e5-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 01:45:46 +0200 (CEST)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-4774ce422easo15192081cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 16:45:46 -0700 (PDT)
Received: from localhost ([64.201.234.99]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4791b07140csm13847171cf.25.2025.04.03.16.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 16:45:44 -0700 (PDT)
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
X-Inumbo-ID: c30d7956-10e5-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1743723945; x=1744328745; darn=lists.xenproject.org;
        h=content-transfer-encoding:organization:message-id:references
         :in-reply-to:subject:cc:to:from:date:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y3wEE9msgohyvUhQ0wd+SPQ+rLudI9iRBc56T7zUgrw=;
        b=dy0MhIg3Gm6/x1E90lLq9TFsrL0iQQr4yA7U0FL1+arIoamLzTJfCVbxpGZi2UBJxe
         kSNWlLWTqx+IzqGnBWKWz8/gMsLbKif21fsLecpMvO8AoQxnvl3/ftPZGFpIodv4hKBb
         LD7tTq80nzhntGPJEgbm1+RfK+9PUDwH9X/1SB90K3T1XSLOaoKP99d5h75yUZhYvG0A
         A7BGZUBthsiK4xVzih7+Zb0Abbb+d7qFBhltZgGTY5Aiw84o/6y9e4JEWTqmSFqPQpWK
         BJIdLFse7oESIserXKl3PfkeCguqCWM417+KWGz/dtrmSwf/so45V1xjbgbLoDzjq3Ni
         233w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743723945; x=1744328745;
        h=content-transfer-encoding:organization:message-id:references
         :in-reply-to:subject:cc:to:from:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y3wEE9msgohyvUhQ0wd+SPQ+rLudI9iRBc56T7zUgrw=;
        b=Uf0UYpIgA99C+C/0Az4smQZOFIUaa5UKiJchoNGLTA/cYcb9/QYTa8bh2eh5fR3TQZ
         7TNUOo8dnVNMRFVGQ7BO26EKpjxNIs87V5FEFXSCSF8CM/mfgQ0FLMivf2UuHGeYnQkx
         jLgrFOG4nY0oxfY6ic8pNcZO/tMgZQfB1vs3yWtHOtdvxIcJKPIo0vdQO+hANzyKUfsI
         Lv03QuqDM/xz8F0cFZT2ubWuzoyDne+iIHqKKcyMD+V6FraUSON9ocU4/Iy3ufPFSe19
         pELcJve4suB7LyzjDv8kW7mlfvVEiUH+/LAzgWNxKUcs6QZ4rdI/VT/dsq50q1ej/1jd
         TmUg==
X-Gm-Message-State: AOJu0YwB8eRZDmLSWIIf9ZHH8s5JOklP7HGduX8UAllw/RaLeFarjEXO
	KKdqFV/3eHK5AX9NKy+94C/zHWt7KDHqO0whnzQeHzp9Wz9ukJspMsZdXddIh20=
X-Gm-Gg: ASbGncuDAICsEtxhC/T5bmQcK/2mJ9Q5Vp7RU7V6UOR1QN5u2PvQKokV4wr1bHOBGor
	6DDEZfu93cIVxK3+xMuseJDfW3ZIj2TFzedJUoxqmME76+qNKOyGtKoinsCyqQMBFSbd933mqzc
	6tzoYSDpNk0TtD81Xeapqw+oQJjzwbxwqPdxUEs3wIwE7VB0b32lERqcZ4JA18yst2e5Sp+YgZI
	5wctfDNZ+Vei1sJ8brp2ojL8udO7o27Z1Ddfue3Uvw4gIiU72En7rw5n6zpHziKMq2Z84/mI2sn
	0H89sE/3wrqvwNj3zzo+top4D271DpolmtPWq0dFA8sPtXPapUnxSACJ9tQa8Q==
X-Google-Smtp-Source: AGHT+IHMwFdi1r1IRdEX1Dkb0gKUDHCZ1rFAVPkY856nmsZ8HiQqLnA7ymhgmFpIB1rAEe0Lhe0pkg==
X-Received: by 2002:a05:622a:120d:b0:476:7f5c:e302 with SMTP id d75a77b69052e-47924903698mr20499151cf.11.1743723945034;
        Thu, 03 Apr 2025 16:45:45 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 03 Apr 2025 19:45:42 -0400
From: Alexander Merritt <alexander@edera.dev>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: drop XSAVEOPT and CLWB build flags
In-Reply-To: <c07ec835-3c69-4cf9-ba6a-39d6152393bf@citrix.com>
References: <3de09e4e2a3320e0f314803e349fbe6520d04b12.1743719892.git.alexander@edera.dev>
 <c07ec835-3c69-4cf9-ba6a-39d6152393bf@citrix.com>
Message-ID: <da37364213f4cec576400ce089e02a8e@edera.dev>
X-Sender: alexander@edera.dev
Organization: Edera
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-03 19:28, Andrew Cooper wrote:
> On 04/04/2025 12:22 am, Alexander M. Merritt wrote:
>> The new toolchain baseline knows both the XSAVEOPT and CLWB 
>> instructions.
> 
> I know that's what I wrote on the ticket, but what I'd forgotten was
> that we only use XSAVEOPT for it's operand.
> 
> Really what we're doing here is knowing CLWB, and also getting rid of
> the XSAVEOPT workaround for somewhat-more-old toolchains.

Will try to be more detailed in the commit message next time, thanks for 
pointing out.

>> +        asm volatile ("clwb %[p]" :: [p] "m" (*(const char 
>> *)(addr)));
> 
> One minor note about whitespace.  We typically have spaces inside the
> outermost brackets on asm statements, as per the clwb() example below.

Makes sense. I had searched for existing examples of this and saw a mix 
with and without spaces.

> Also, given the expression is so simple, I'd just use %0 and drop the
> [p].  It's just line-verbosity here.

Yes, agreed.

> Can fix both on commit if you're happy.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Yes please do. Thanks for the review!

