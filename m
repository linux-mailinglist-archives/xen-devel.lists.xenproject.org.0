Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E095284F264
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 10:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678605.1056043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYNMF-0005sB-OB; Fri, 09 Feb 2024 09:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678605.1056043; Fri, 09 Feb 2024 09:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYNMF-0005ps-Kn; Fri, 09 Feb 2024 09:39:43 +0000
Received: by outflank-mailman (input) for mailman id 678605;
 Fri, 09 Feb 2024 09:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYNMD-0005pm-DW
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 09:39:41 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2575982f-c72f-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 10:39:40 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-511616b73ddso1198497e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 01:39:40 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b005117ac9cd1asm50230lft.88.2024.02.09.01.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 01:39:39 -0800 (PST)
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
X-Inumbo-ID: 2575982f-c72f-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707471580; x=1708076380; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s/Dyv6JD++6g81K++/rhaIf7qr4pDURdgPVxoli3z+Q=;
        b=f+ZzhumdxUhCs7z8vuJcBa7ps6nOoppJmqLpBVwPuMRkPlIriC6MTXbBERIw67Kl+E
         q1bfpY7uxHPmtna/piH5Oaqg1VaVdlah7dqxBb0AmLa5eQq2q6Gx7hdPf4d4Oso2OUQP
         KSw6NSi2h4DLjA3q3lF4OLdCUIjQwykHqv7TW12tabJArkyOhO/QLpUv8ekTKRtTzzDZ
         O1pQ2DOoRWJWhR3RrathipzzqTzis3355OvLmr8ggk7uabjQN+O8ZRnY5M5AHjm7lx19
         TaOIzQfajs8M0bJNzj1ikYiuHXHyq2cV/ynZg/nU5PxdGUSxzxayh5tBySueubSPJCEz
         tVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707471580; x=1708076380;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s/Dyv6JD++6g81K++/rhaIf7qr4pDURdgPVxoli3z+Q=;
        b=JbD3QlAA9ounIX7RgPXecGDuGMlV2acSi3uLYhh3/dY4EH9cZogawCBXu6B+F1jiry
         WOOHeMDFpZQ3V8gEPgFXCuREHLGn35hUfXMZWAj00kFyz+wdRKZLr0zz5pgJtV0VrmBv
         qsv83DROoFRJopuwquqvVKzd0z/MV0VobWztf97EY+aCxEY9WHBMxM6RqmZ+UpELuxsy
         lreJY2S/Nxca61dD//jmYhKwmOf/JmOIxFw6m9kg8IPIxtfr4oLSOFqjP5hSijDgRawH
         WJEHcLG4EQOS/jgaKbofz0oXeEv4lGptC3YRlgmv3JKHAwutiZ2kgf+3fOQMTZUMAc3n
         a/2g==
X-Gm-Message-State: AOJu0YwRZxfY9fc6R4HVcrYjUGbsA3Vmt9Oe2udOZGXLAT+Mw4sXk2Yn
	I5Y8hAAur8fV6Kl6XBlwde/GySPUccFRoXZc62l/gwrGKaDUNH3B
X-Google-Smtp-Source: AGHT+IGPGglg+V/00Jrg55McyLpL1F2ELorstlFLspgxxLXJnTblCWSYFl9w/vecAD44DNktsRIpzg==
X-Received: by 2002:a19:644a:0:b0:511:4eb4:c4ed with SMTP id b10-20020a19644a000000b005114eb4c4edmr750652lfj.45.1707471579745;
        Fri, 09 Feb 2024 01:39:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEvC+GK8BdtojWPmhTZpydXwX0wQPxVQaiIZbKsLQMl5FlkeVpxc4TINBKICwZVBzjekdbN+WxRBwgob9afVbADDzJ1RQUXID4/Jhl8CbnyosNTbA/0+eaF03Pa2AnfNjTz3i3TUFMPuDS6xDf39V0+Fk4s8WEeqvfsVms5HjSyLF+vxryUxqa5OfPFuR2G2hPhbu6xEEShII/uWuAulzQHRaCTsWATxxWCwdzcg1D61OEpQljG3/Ovjryqrh6NstCgDYSSDpsJ+CQq0nxxi7w9TW/lg9kKj8PsZYOZDftg6Zet6RNR+ONShiIyAXAuKaG4E713nnVkbIYKRKjyQxjnTlNu6f3tlyqcrhtW0I2Y529Lhx5tDhXh3Pn5cx/eTN1UB5Is9SDelikGRHtgcX44KnRuNOHT0Q+YSmPLojpFJ/sttVCnd1Rn3jC9kKVb6dW5LoeApAcYdDbiL1gz6eQ/Ry1cvM3ZrtowNtiwMLf4R8Myzc=
Message-ID: <4670386b86a396de7706b3d77dede92992296a92.camel@gmail.com>
Subject: Re: [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(),
 ASSERT_UNREACHABLE() to xen/bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
 <konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 xen-devel@lists.xenproject.org
Date: Fri, 09 Feb 2024 10:39:38 +0100
In-Reply-To: <91e58646-5420-4e1c-a8c5-b6ff7a417d13@suse.com>
References: 
	<4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com>
	 <91e58646-5420-4e1c-a8c5-b6ff7a417d13@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-02-08 at 17:42 +0100, Jan Beulich wrote:
> On 02.02.2024 19:03, Oleksii Kurochko wrote:
> > Move the macros mentioned in the commit subject to their
> > appropriate
> > locations.
> > Additionally, eliminate the dependency of xen/lib.h from xen/bug.h
> > and
> > include "xen/bug.h" in files where xen/bug.h macros are utilized.
> >=20
> > Most of the changes were made because a file requires macros from
> > xen/bug.h,
> > except for some files for Arm which require definitions of
> > BUG_OPCODE,
> > BUG_INSTR, BUG_FN_REG.
> >=20
> > xen/lib.h was added to list-sort.c ( otherwise compilation errors
> > related
> > to {d}printk occur during compilation of list-sort.c. ) as
> > xen/lib.h was
> > removed from xen/list.h. Since nothing in xen/list.h depends on
> > xen/lib.h
> > functionality and only xen/bug.h is needed.
> >=20
> > cpufeature.h requires the inclusion of <xen/cache.h>;
> > otherwise, the following error will occur:
> > ld:
> > common/monitor.o:/build/xen/./arch/x86/include/asm/cpufeature.h:41:
> > multiple definitions of `__cacheline_aligned';
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with one nit:
>=20
> > --- a/xen/include/xen/cpumask.h
> > +++ b/xen/include/xen/cpumask.h
> > @@ -55,6 +55,7 @@
> > =C2=A0 * for_each_present_cpu(cpu)		for-loop cpu over
> > cpu_present_map
> > =C2=A0 */
> > =C2=A0
> > +#include <xen/bug.h>
> > =C2=A0#include <xen/bitmap.h>
> > =C2=A0#include <xen/kernel.h>
> > =C2=A0#include <xen/random.h>
>=20
> I think everywhere else you nicely inserted new #include-s so respect
> alphabetical ordering, just here the insertion would want to move one
> line down. Likely easy to do while committing, if no other reason for
> a v2 arises ...
I'll be happy if it can be done during committing.

Thanks.

