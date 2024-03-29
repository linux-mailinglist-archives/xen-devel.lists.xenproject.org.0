Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E789234D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 19:25:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699461.1092246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqGt6-0003rS-TU; Fri, 29 Mar 2024 18:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699461.1092246; Fri, 29 Mar 2024 18:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqGt6-0003pU-P8; Fri, 29 Mar 2024 18:23:36 +0000
Received: by outflank-mailman (input) for mailman id 699461;
 Fri, 29 Mar 2024 18:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/B2=LD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rqGt5-0003pO-Sr
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 18:23:35 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73c17b6e-edf9-11ee-afe3-a90da7624cb6;
 Fri, 29 Mar 2024 19:23:34 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d6ee81bc87so20253961fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Mar 2024 11:23:34 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a2e9ec2000000b002d689c6acddsm676845ljk.97.2024.03.29.11.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 11:23:32 -0700 (PDT)
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
X-Inumbo-ID: 73c17b6e-edf9-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711736613; x=1712341413; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m86QU0qZlzhcMK38hfwO8kIIE0b0+pHTkuk0ZdiE9HY=;
        b=blXpe9J3NSQ7KCIQgp57U/QAmfwXLJjfGwxsYp4BQti/0qXYvxGzvJ81vXRSKqUiie
         Pg2h5tzkhFgFepQb+u2GSAmXW+1Pb56FJ+W6szAr9dDf0WI5tQlyY+68RRae5x9/E4mJ
         1mC1wnXyf5d5GcDHxrU/f+V0P09jSL1ORtNbFjqjlLBa7n/XDeIYmg9n4CO0KUkqjOSR
         7HGRGNStYSSOrdp8qPC+rj8zgz7rzfsnOaK6mcfQjWxQSodoEoycVu+XLmKxVIA3KRFG
         W5efNZwXBnzTTqR13cB6VBmqKz2RL6wBOY/+pfXvVK2JgzHQ69WNKrOQ8+nXsdHxhVd/
         N0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711736613; x=1712341413;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m86QU0qZlzhcMK38hfwO8kIIE0b0+pHTkuk0ZdiE9HY=;
        b=BbAlLd5rvvBgYufSaQrcdvCX+f8QXOntzNPeLyJbaQtRX7Fpd+gfBtXgSA3RDKHlLd
         aaiAcgSYrdor3n7Z7GRu3UsdNuuQIW+LAL/TW6uHDUO9zqV/AvkrtPIVHm/CDorJp3T5
         xwi1EZC/aRCPnOFEkubf6JoMwxDnb4hNcGT2g20o7H/HHxHwtq+QkCRN9C0EreuCxRLa
         YKkWdLB3ZFKJ8uqclIYltghMdDdGbLKEivoMKokIaUMgWLzhV3ZW1RFOh+Bvhtb+j/VT
         hNaeS7neeKluHkK2j7EgxRAlVmnzZDRynCC/LTxh0K7ywvu/HtolOW96yZAwWtT3U9vm
         4BZA==
X-Forwarded-Encrypted: i=1; AJvYcCV8GUWTGgeRkFVQWbqq02zCfB3As8n0sqVy1q9v2+ML6QasvSCmb5SxJTkxYJvt7qCmHq4fGkQkVGXSNec26kdhIIJq9xdy/8aChCq9ygE=
X-Gm-Message-State: AOJu0YyzFGlU+tfsUaQ6pnkZ9IruC5yHDsjH8gryHAgwADaQhHyjyu9L
	+zulzdlk2yEb0Io1iBpbUE2r5VRFEJjqNoNyhb+Y3kd8c3WUrKJR
X-Google-Smtp-Source: AGHT+IH4D0cO6yIUo4vod8MyARWg284IZopfX8yW2cDxgLSnStgTdQN6JmI1g2c78mWgMHOrw0tnig==
X-Received: by 2002:a2e:bc06:0:b0:2d7:ae9:b579 with SMTP id b6-20020a2ebc06000000b002d70ae9b579mr2149588ljf.33.1711736613184;
        Fri, 29 Mar 2024 11:23:33 -0700 (PDT)
Message-ID: <827d3d8ee11bd4a3c20dbee936132df231db1e73.camel@gmail.com>
Subject: Re: [PATCH v6 06/20] xen/bitops: put __ffs() and ffz() into linux
 compatible header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, Rahul Singh
 <rahul.singh@arm.com>,  xen-devel@lists.xenproject.org
Date: Fri, 29 Mar 2024 19:23:31 +0100
In-Reply-To: <a4d36c0f-d3a3-4d64-a62e-b631a4ece9a8@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <8bc35da4a9fd44d2dcf9677dcc99334eb7142581.1710517542.git.oleksii.kurochko@gmail.com>
	 <a4d36c0f-d3a3-4d64-a62e-b631a4ece9a8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-03-20 at 16:42 +0100, Jan Beulich wrote:
> On 15.03.2024 19:06, Oleksii Kurochko wrote:
> > --- a/xen/lib/find-next-bit.c
> > +++ b/xen/lib/find-next-bit.c
> > @@ -9,6 +9,7 @@
> > =C2=A0 * 2 of the License, or (at your option) any later version.
> > =C2=A0 */
> > =C2=A0#include <xen/bitops.h>
> > +#include <xen/linux-compat.h>
> > =C2=A0
> > =C2=A0#include <asm/byteorder.h>
>=20
> Hmm, no, a library source would better not include this header.
> Surely
> the ffz() can be taken care of locally here?
Except that __ffs() from xen/linux-compat.h is used in find-next-bit.c,
so it seems that it is still need to include the header.

~ Oleksii

