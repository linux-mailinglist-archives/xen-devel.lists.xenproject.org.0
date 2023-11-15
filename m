Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F19D7EBE95
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 09:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633518.988366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3BIy-0008At-JT; Wed, 15 Nov 2023 08:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633518.988366; Wed, 15 Nov 2023 08:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3BIy-00088B-GM; Wed, 15 Nov 2023 08:31:24 +0000
Received: by outflank-mailman (input) for mailman id 633518;
 Wed, 15 Nov 2023 08:31:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=embj=G4=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1r3BIx-000885-53
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 08:31:23 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b520489-8391-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 09:31:22 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c50fbc218bso86368131fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 00:31:22 -0800 (PST)
Received: from smtpclient.apple ([90.243.16.33])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a1c7703000000b004083729fc14sm19708699wmi.20.2023.11.15.00.31.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Nov 2023 00:31:21 -0800 (PST)
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
X-Inumbo-ID: 5b520489-8391-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700037081; x=1700641881; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELfyUT2hxTOkRPUscBwI2XonMSGo7vTTGeILa8mYQoI=;
        b=AbCRTBKWYPjQS5XUfPtUwmSlgOk5VTwe3wibVNhzLimi2xDm9chwdwcORkYPs2OLSw
         XqpIfe2swaY+mVRH/RDwzU9a+3Z2ICEl3fn1KaJuv8zyEkapC5LaLpU1eiK5aJQM3eKg
         VXxWMAK+EbQap6749MlDHih93x0MN19eW8pDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700037081; x=1700641881;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELfyUT2hxTOkRPUscBwI2XonMSGo7vTTGeILa8mYQoI=;
        b=Hwgsm0wnEGTM5gFxHDahYh1MW6KDHqUcb9padEDFkK/tA5oxCEK1krgeOGns5ejtrD
         MEyTmmKBK9SIRVTEbZO/Mma8lTgHljaJZBZMcFZVwLgzHQ200SDY7hTO79hMOnNQTxr5
         PvoivHr2sLVus+Uvf7kUCJS/O7MhtqAnTcS6cgLZ4sOzrkLEwurhpZZAs1w+zK0i++aT
         G4B/jf+UEvA8j97zRF7+6ZdQxxHrn73vbAaHPdV9aFwDfCB4Z+gML2rbx8D/m2kJ0tru
         3QjdPdI30bUd/tNo9MGSwij8Rd7YwHQ3i67aioWB87mgOhJWxphR3tkPl/d4Tu3Mk89H
         WujA==
X-Gm-Message-State: AOJu0Yxky9jcck/lVZtEwdG0kA/c8PX3rvmbv5fvmyQPEDFMvhpD1dCG
	tsR2EFjV2ypYiXBKlImf+c2ZQQ==
X-Google-Smtp-Source: AGHT+IEEqlzD6AsLVjMUoYqN2M4eUNNnk80niFnCJcx75EFF4VOFkItX4G8g5RdVcKuyog1S/rOzlQ==
X-Received: by 2002:a2e:3318:0:b0:2bc:d5f1:b9cf with SMTP id d24-20020a2e3318000000b002bcd5f1b9cfmr3382781ljc.27.1700037081540;
        Wed, 15 Nov 2023 00:31:21 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [PATCH 4/5] tools/xenstored: remove "-N" command line option
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <dca79398-a793-483a-83da-8dea2b28c49f@citrix.com>
Date: Wed, 15 Nov 2023 08:31:10 +0000
Cc: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>,
 Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3AB123DE-1F6C-4252-BF4C-0AE89FB8508B@cloud.com>
References: <20231113124309.10862-1-jgross@suse.com>
 <20231113124309.10862-5-jgross@suse.com>
 <dca79398-a793-483a-83da-8dea2b28c49f@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On 14 Nov 2023, at 22:11, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 13/11/2023 12:43 pm, Juergen Gross wrote:
>> The "-N" (do not daemonize) command line option is of questionable =
use:
>> its sole purpose seems to be to aid debugging of xenstored by making =
it
>> easier to start xenstored under gdb, or to see any debug messages
>> easily.
>>=20
>> Debug messages can as well be sent to syslog(), while gdb can be
>> attached to the daemon easily. The only not covered case is an error
>> while initializing xenstored, but this could be handled e.g. by =
saving
>> a core dump, which can be analyzed later.
>>=20
>> The call of talloc_enable_leak_report_full() done only with "-N"
>> specified is no longer needed, as the same can be achieved via
>> "xenstore-control memreport".
>>=20
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> CC Edvin.
>=20
> There's a patch out to specifically use this option (under systemd) to
> fix a bug we found.
>=20
> I can't recall the details, but I seem to recall it wasn't specific to
> oxenstored.
>=20


The patch is here =
https://lore.kernel.org/xen-devel/ECFA15A7-9DC8-4476-8D0B-44A6D12192D6@clo=
ud.com/

It is about not losing stderr when run under systemd (well you can use =
syslog but what if your connection to syslog fails or you fail before =
getting to the point of parsing which syslog to use).=20
Alternatively we could have a "don't redirect stderr to /dev/null" flag,
but such redirections are usually expected when daemonizing.

It'd be good if the --no-fork flag could be retained for C xenstored, =
currently there is a CI failure on a non-systemd system that I'm trying =
to fix (a bit blindly because I don't have such a system myself), but =
from my testing the flag does work on a systemd system with C xenstored.

The patch is motivated by having some undebuggable issues in oxenstored =
where it just exits without writing any messages and without dumping =
core, so by retaining the stderr path we should have an output of last =
resort in case something goes so wrong that the syslog error handler =
cannot function.

Best regards,
--Edwin=

