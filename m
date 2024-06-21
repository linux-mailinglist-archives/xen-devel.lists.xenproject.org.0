Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F7E9120C2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 11:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745166.1152322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKagq-0006iv-A0; Fri, 21 Jun 2024 09:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745166.1152322; Fri, 21 Jun 2024 09:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKagq-0006gY-7Q; Fri, 21 Jun 2024 09:36:16 +0000
Received: by outflank-mailman (input) for mailman id 745166;
 Fri, 21 Jun 2024 09:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MgEJ=NX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sKago-0006gS-4z
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 09:36:14 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b041b104-2fb1-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 11:36:08 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec4a35baa7so10085921fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 02:36:08 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d7e7906sm1583581fa.121.2024.06.21.02.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 02:36:07 -0700 (PDT)
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
X-Inumbo-ID: b041b104-2fb1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718962568; x=1719567368; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bWcM+UkH1QZJVe9SfjY7/mAy/7Ki82Qc5EYhPE77GJY=;
        b=V9OA+2ZOtEPARRPeoQtkBXpzNKXIyjml+ZnA4zsCdTRXNb7N3dY49KP9oYbGN3//7j
         Hr0SE9F4SLuFNG+4NpcP0qYzwwGLlkOqCw0QG4J5i9yJ6Cmjkyoee3+s+9GLFMBHJrIO
         1/ccHqBzxA7Ed8CvS2fnaVzgAO3+e+DUIIzzpqV7WIJqbrAdlSkojp83km/VS5danCnW
         78KlYvqrimNEriqZHht7akOldwdPxQzHVQAlbl21Mc7weeuODmhI5n/SfFF4/ZmQlNxi
         yLunvLUixu+hXNOVRNIu0R0aDtg8fzuTSA+mk5JHZgYVSKBpthO5X8LUh+fJaxNVKIyu
         J+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962568; x=1719567368;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWcM+UkH1QZJVe9SfjY7/mAy/7Ki82Qc5EYhPE77GJY=;
        b=smAsNMdVWQkN6RFYmtjzo6MvB2qODeVMc3D6rqzPkd6JjRy84euGMCG2o79WKr762y
         LJoiYFZ4oLOUdds5BMqtAqPEJeeXHGFpBX14BfEoMYbod/R/PYGyjv6+eA5BoF9EAb/U
         PwEMQLzoOWfMX//SErNQSt4D2hnDDsQOeknQsoA7sXURqsB/9F7wBstbcM6s/1unIdIs
         qVP2gv/WQeqFM7uORbZW0CITVDvoHY1NcfpDIgzYhyAqvzFvZOiQWueIbj0iKWShIYGX
         7O27ZGIEmS7+zd9cE9MHGVkCPXipI9H8g6wrJHntjQCA6eGMBPgDKzlJ89ejSuP7YTcV
         T3Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVoNMXBb1H/n0UnjcizEATarqlxiEbBLL2tCGsGJOum5kDerB9z19SsWhMhwyA8eG9FxRZXiUjBAJb8T2YZimp61ivjnN0QeNM0lsvQIC0=
X-Gm-Message-State: AOJu0YyBc4bwz59irAU/u23uGIMcR+2YQMb/oxdlIkNChLl6gsfylo/U
	P4QyipC+QQyhBEoSj/iOwu6KJuRgWu+XidRYOMbg3COC7j/6rNTb
X-Google-Smtp-Source: AGHT+IHVOYG4LMIM8F9GxMCiyWZnN/t1cx95rRcKDlJy9AY96yVa8Un9IG2Jiv5zwYOIQmuv7EEI1A==
X-Received: by 2002:a2e:9e94:0:b0:2ec:4064:18e6 with SMTP id 38308e7fff4ca-2ec40641b04mr20615941fa.5.1718962567486;
        Fri, 21 Jun 2024 02:36:07 -0700 (PDT)
Message-ID: <13a90dee254ed5994dab7454cc744a1b16e34e97.camel@gmail.com>
Subject: Re: [XEN for-4.19 PATCH] x86/apic: Fix signing in left bitshift
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Matthew Barnes
	 <matthew.barnes@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Fri, 21 Jun 2024 11:36:06 +0200
In-Reply-To: <96e8edb4-f9a8-46bf-a99c-cb458b0cb3f0@citrix.com>
References: 
	<6fe6d88c0e07348d3e08fd51863402827126ecb0.1718893590.git.matthew.barnes@cloud.com>
	 <96e8edb4-f9a8-46bf-a99c-cb458b0cb3f0@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-06-20 at 16:16 +0100, Andrew Cooper wrote:
> On 20/06/2024 3:31 pm, Matthew Barnes wrote:
> > There exists a bitshift in the IOAPIC code where a signed integer
> > is
> > shifted to the left by at most 31 bits. This is undefined
> > behaviour,
> > and can cause faults in xtf tests such as pv64-pv-iopl~hypercall.
> >=20
> > This patch fixes this by changing the integer from signed to
> > unsigned.
> >=20
> > Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
>=20
> The code change itself is fine, but I'm going to recommend some
> adjustments to the commit message.
>=20
> Its "x86/ioapic";=C2=A0 apic implies the Local APIC which is apic.c and
> distinct from the IO-APIC.=C2=A0 The subject would be clearer as "Fix
> signed
> shift in end_level_ioapic_irq_new()".
>=20
> The XTF test has nothing to do with this, so shouldn't be mentioned
> like
> this.=C2=A0 The UBSAN failure was in an interrupt handler, and it was
> complete chance that it triggered while pv64-pv-iopl~hypercall was
> the
> test being ran.
>=20
> I'm happy to fix all of that up on commit.
>=20
> CC Oleksii for 4.19.=C2=A0 This is low risk, and found during testing wit=
h
> UBSAN active.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

