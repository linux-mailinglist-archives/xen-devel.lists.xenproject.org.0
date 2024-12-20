Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE019F96A9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 17:36:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861875.1273906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOfxZ-0005OA-V5; Fri, 20 Dec 2024 16:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861875.1273906; Fri, 20 Dec 2024 16:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOfxZ-0005M4-Ra; Fri, 20 Dec 2024 16:34:41 +0000
Received: by outflank-mailman (input) for mailman id 861875;
 Fri, 20 Dec 2024 16:34:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2YMA=TN=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1tOfxY-0005Ly-Bv
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 16:34:40 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cbf1d52-bef0-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 17:34:36 +0100 (CET)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3eb96351ba1so172580b6e.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2024 08:34:36 -0800 (PST)
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
X-Inumbo-ID: 4cbf1d52-bef0-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734712475; x=1735317275; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0Pq3MeH68M1UvmnuofFPSaKmyzx82nizriI91/fVz8=;
        b=Ug/qZC6NxfAehI4MuAgYs+BGFmFnSqj/ov4azlZjVx3NexjQilqCjxqIuY1XAUB5VO
         qfKIoWvnojdiyqpLUWdm1Cvn5joCllj6ETcG4+dgD9nMsmZZnLCh3m8zN6ImVYYJlSzA
         TE+NqbVtsZWFEOaEJwsp6ZxYJNDXZoqb/SH6+qvPN7GgzXgs9tmIqzp87Kj+OYqtyCpU
         qNSKw29ATx0EWqcUEINO66PaE26hcW6t3IaoVHJqjIPI5LcdijUjkDmpJI2grYT1Odta
         HpspvlKQYWVV8BYdrgb7xrbYpKbKbrn4pSWD3ElV4FWHCMT0Kxx80xE1CZDg7Wv09O0K
         8v1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734712475; x=1735317275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0Pq3MeH68M1UvmnuofFPSaKmyzx82nizriI91/fVz8=;
        b=XelNc/AUSKoJiu8ORU6zyFdULzI2rSs9F60qq5A2NLpb9UvfY30tvT7nMYSasbPLwA
         nJnUC7nBl9RVXmx+7qO/7FQcGHLMfIi9gxx8EzODZBrZ0kgmrRxx3gsNzZoT0+Im9GuE
         Ozsl9M9jYkc5AGFckYTdzg4GJzxb3eSp1j65ijlw7WvppGy/eK4F0S1j3LEN+3nsk85X
         amKxA9LQnP2XlwwxpZyCZQbFAjboCvfbeJBY/NHPdr8KkuiKn3atFWxZsFnIfjncm87+
         ftvJm4e2IKrLsLnAbbw3eHakHxSqLAA2ZUf0z9cTP5bhnqy1vSr2gcECPbV5jrUVGH9m
         JarA==
X-Forwarded-Encrypted: i=1; AJvYcCXa0BJVuAwh7/irCg1U3HZ6fwLfncQpb20/9oNs58vR05COmMpS/DHrZrTDwg9cdQ46ep/cLmSGAg0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUPUEBugyzqrSLgACr+8PgSMzybr5uhw5OCEykwRDazHCbMbhM
	xaOFrcmdexUS3VhWe491qxVYTGPFT3VVkEkpA8uM0sGM+chrKxI9zO+j13Ov70VEZvP9JfDNrWh
	R3SyXD/Dj/ap++yQSgNcYfymbiTM=
X-Gm-Gg: ASbGncue3vgjCK1BhFGjytF5PO52GVNWgS1mRRrFxo0+ythZeEP+0FV0UxR4JUpYySh
	+w5j5dngvd4CRpAGxQDaQ+7+lnj86YU7Hq0qrqyLsqtdJKIS0nA+ZpHPlUOKxvHuKB+PMqYV6
X-Google-Smtp-Source: AGHT+IF7T3v9F20EhB0c5dTGDsFetVEVgBnpzgiCQxXsPUZfuz5TOqJzJZ+NpYnUfsyUZTWAMwpYzE8q7yBAg80xQyY=
X-Received: by 2002:a05:6871:d10a:b0:29e:5f79:21b4 with SMTP id
 586e51a60fabf-2a7fb423b4fmr725224fac.13.1734712475453; Fri, 20 Dec 2024
 08:34:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1734652343.git.w1benny@gmail.com> <f381634bd45c647d145a81c0076211ea044febc8.1734652343.git.w1benny@gmail.com>
 <258c4e83-4379-4212-b80a-4fe909849e66@suse.com>
In-Reply-To: <258c4e83-4379-4212-b80a-4fe909849e66@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Fri, 20 Dec 2024 17:34:22 +0100
Message-ID: <CAKBKdXhru499ZcF50TroCn39kxHdPVBGtBQaECoryBMd29JGxg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86: Add Support for Paging-Write Feature
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 2:09=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> To avoid the flag becoming "sticky", I think you need to clear it ahead o=
f
> this switch() (or right at the start of the function).
>
> Jan

When thinking about it now, wouldn't it make sense to only reset it in
the p2m_ram_rw case above? I mean, where else would be guest
page-tables located.

P.

