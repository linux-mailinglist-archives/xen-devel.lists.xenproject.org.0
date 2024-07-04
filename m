Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0414B9274B3
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 13:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753710.1161916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPKPO-0003aW-H9; Thu, 04 Jul 2024 11:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753710.1161916; Thu, 04 Jul 2024 11:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPKPO-0003Xs-EF; Thu, 04 Jul 2024 11:13:50 +0000
Received: by outflank-mailman (input) for mailman id 753710;
 Thu, 04 Jul 2024 11:13:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPo+=OE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sPKPN-0003Xk-2R
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 11:13:49 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b2e4018-39f6-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 13:13:47 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a729d9d7086so289481466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 04:13:47 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58d0bfeec43sm1981651a12.48.2024.07.04.04.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 04:13:45 -0700 (PDT)
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
X-Inumbo-ID: 7b2e4018-39f6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720091626; x=1720696426; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RqV4LrVwqGGyv4Sy1obfjHlYLsLcYJ4PG7/pxwbR+QM=;
        b=JWzY3arjrOTPrJvcefOVA6mafpasvGMbhp2yuCFwLlqaXCdMCsm7GIRHWrLgz08IIN
         UNu3cY+iEv313dPwoLw+jG1XWIluywqZ5Pk/DTCx9XpL6V7r5b6R3gEpGbI2iLO16Rly
         HGyRhusp7XTIatMpV+tbS0YaYGHTScf/UVebWjGcUYQCQD1fFSnqHTMG8J0hWvI/nqmN
         baB2vRXmNQ/7QIfVrc8Ax/o10zTClnjnq9D+Xqe1FMbvIhQ3I0Cj0NmZK73u5o1AXK+z
         spkPp/jfRSYDp8pOzUaVY2bdI+//wJjO/TMvS+ZYnit9pA5oMA39IpOF0o5Z/scMx105
         pXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091626; x=1720696426;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RqV4LrVwqGGyv4Sy1obfjHlYLsLcYJ4PG7/pxwbR+QM=;
        b=jkyauhIo2gwWUAVxUE4EUEPX3PZk1kVNcCbCYU8OCzEmDnSNAzwBjD1c5Koibtnmf7
         EQIZGjxOB8QzvnRcwEmT2PeNlvZT+UVW5GJSLSjYl7c13g/m6b5MqviRfs1XiMbJ40IZ
         Pz25UxkKoKjW6O2p4hZtViDigiKkuqt7YWyGT8gp6d8EApzyV716PBNpFgD+v011ns2g
         FPVQljsms3cfyiNAS9hYxNifkiv2TMm4s++WFseSoKcY5KgXfLGEIxP+2mEEbcygRl1z
         rpl92Z5RCnqbWFuL42mO8PiY6q3riBVXK/twM/TALz8mDaTLTvjGRvAnAosR9PMpxGQX
         z1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUB/uykUwdl9p7DQo5qapZ9k5VFDK/rczn0uPtylGeEULCEZKd2g9MIAb5gJayw2aGTpJC6scANgUUktt4aBRZPi51o0U6//vZ0W8mshgw=
X-Gm-Message-State: AOJu0YyPQr8RoqB+hRxFFDQbW4AIhFbeKQN49O1Yh6Siaudsqhwww+Jb
	/QpqViEguQr/7pN4bLtlh4JCRaquSlieFSslxlxP9b3J7mhkPyQTJjgIxtKc
X-Google-Smtp-Source: AGHT+IFkUeN3EVz/da44gGaynP/citiSIhMdON/oyy6EDwYCNC/ukHYaJ+EcuuVTZ/6YppkOsWU8Og==
X-Received: by 2002:a17:906:414:b0:a6f:dcb6:223d with SMTP id a640c23a62f3a-a77bd99f39cmr99441266b.8.1720091625729;
        Thu, 04 Jul 2024 04:13:45 -0700 (PDT)
Message-ID: <6d4e4ecff57195c2832f874f5b3b7f5634e03ecf.camel@gmail.com>
Subject: Re: [PATCH for-4.19 0/4] CI: Fixes, part 1
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	 <sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Thu, 04 Jul 2024 13:13:44 +0200
In-Reply-To: <627365c7-83b8-4b33-aefc-a8c0e4301c7a@citrix.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
	 <2a6a3697a9896107a8f317686fb2e2572d0ba332.camel@gmail.com>
	 <627365c7-83b8-4b33-aefc-a8c0e4301c7a@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-07-04 at 11:51 +0100, Andrew Cooper wrote:
> On 04/07/2024 11:37 am, Oleksii wrote:
> > On Wed, 2024-07-03 at 15:19 +0100, Andrew Cooper wrote:
> > > Minimum fixes to rebuild the containers, following the HEREDOC
> > > problems.
> > >=20
> > > Unrelated to the HEREDOC problems, Archlinux and CentOS 7 need
> > > aditional
> > > chagnes to rebuild.
> > >=20
> > > There will be subsequent work to make some improvements to CI for
> > > 4.19, so in
> > > particular we're testing with up-to-date LTS distros.
> > If we really want to test with up-to-date LTS distros in 4.19 then
> > it
> > probably make sense to postpone release date to July 29 to be sure
> > that
> > everything is okay. July 29 is still fit in our 2 times release
> > cycle
> > per year.
>=20
> Testing with up-to-date distros is trivial, when I can rebuild the
> containers.
>=20
> I've already got "CI: Fixes, part 2" and "part 3" in progress, hoping
> to
> post today, all for 4.19.
>=20
> What matters, specifically for 4.19 at this point, is that we put in
> place testing such that {staging,stable}-4.19 branches are tested
> suitably after release.
>=20
> It would be really embarrassing for the Xen 4.19 release if it didn't
> work with e.g. Ubuntu Noble.
Agree, it makes sense.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


