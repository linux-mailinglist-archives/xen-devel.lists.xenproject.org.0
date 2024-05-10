Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364708C261E
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 15:55:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719884.1122739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5QhE-0004Q1-Kz; Fri, 10 May 2024 13:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719884.1122739; Fri, 10 May 2024 13:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5QhE-0004NW-I0; Fri, 10 May 2024 13:54:00 +0000
Received: by outflank-mailman (input) for mailman id 719884;
 Fri, 10 May 2024 13:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tag6=MN=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s5QhD-0004NA-PQ
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 13:53:59 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id becd9878-0ed4-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 15:53:57 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-573137ba8d7so5677960a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 06:53:57 -0700 (PDT)
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
X-Inumbo-ID: becd9878-0ed4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715349236; x=1715954036; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2k5X2b8fVQEMzVfPhF0Bw+AAwKodrKYcFlsJMkzPLzQ=;
        b=baFJFWf172MlBnFqhUncqOsXXQ3r6pVOVgbjZC2JPFpvCriT1B4mTkAKFhUFMvZcML
         Exg0O3T90G6SWCSHYWhAtLMDIZ5omu1LYV0HF4iKDUNNKqvt+On27ZIPmlkKji24YQmx
         7axXNYLU5M0pee1/P0l5uaBKROiGRTA5uKCqEXziqOT8vUvUy385dAvYuWAhEx1U29oJ
         SmTlCrMj4amLy1EIekI0XAWfL0s+WlF/6tuhC8gxXHAeXQnYhcMBuOXT/Uo9MHULJ1hY
         52gYASKnDAk6fyhHlgHjkp661W7HyZT58Xul9byGhjkZK+f/aME2+yY7ade9TFO0CgFi
         cTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715349236; x=1715954036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2k5X2b8fVQEMzVfPhF0Bw+AAwKodrKYcFlsJMkzPLzQ=;
        b=L6pW157RTuBow0OQNlPGrgn2Hs8smw47cozV7erZXsEUtOIQdzuA1M1pDt/7P0B6mv
         CU7+0F/t0oJTLTlRjgpvL6K035a8MeeBYbieSRXMnDKy4mvrKP/QJEcVc+ViGxhF5CoM
         MYO9yOnEXEQjm627svtSmtwoMtU+OgBwJrCU/2ZKgUNUqVIjrX0UO94ZsHQVDJAkZIVN
         gLRfQm4pwKbWLwwt+d54n1weZH7GTMaHhS3oVDi51xwfUTvnLqzBYDh+yPjBqs9kUlqU
         EHH4QC7VRh1LU7xG9HPM8qjPRLKzrh95IPPfTAynpGWOGwKo+Xf9Z7fPQBIRmgy4fmMR
         jJWg==
X-Forwarded-Encrypted: i=1; AJvYcCXkyO+0vVInh7hFbJNA41HMFsL7G4nh1VuuYUpcyain1efVAUEn0cAsQBJNskkf0o8Nc98eSzE2fm7IvSiA6ByB7o2EZ/a9t8UoS+av1s4=
X-Gm-Message-State: AOJu0YwS5xpTD5BycX/zQX773GsDT/NMJWJSSTbgtxfj8cyATmp6xZrb
	6hKeDW4F3yvTKIXENV+gHf9ENXlN+cLc7kwFFvu4h3oEAww+MrkyemJxEpQ46kw2HiIHrqy9/HC
	BJOMH91v2sWElM4HtBgC0PeJsEU4=
X-Google-Smtp-Source: AGHT+IECqtPzKLt+Qs2LGB+mYMQbUATaTPIssKDGvU8AIjnQg1zjSG41jBZnLiN3PKaIy8n1hpzRoXWF7VFT3jat9vM=
X-Received: by 2002:a05:6402:2071:b0:572:aaaf:c349 with SMTP id
 4fb4d7f45d1cf-573327883b9mr4778566a12.11.1715349236261; Fri, 10 May 2024
 06:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240508213824.55824-1-leigh@solinno.co.uk> <f5300cd1-4200-4957-9e4b-9ba0c1f40fa2@citrix.com>
 <2d89f70c625c3abd24bd57f2ee0d2f94@solinno.co.uk>
In-Reply-To: <2d89f70c625c3abd24bd57f2ee0d2f94@solinno.co.uk>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 10 May 2024 09:53:44 -0400
Message-ID: <CAKf6xpvJupdPatge_FLApUeKHMFCUOpzrENX8kpHd-BSpSU3=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] Add bridge VLAN support
To: Leigh Brown <leigh@solinno.co.uk>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 12:10=E2=80=AFPM Leigh Brown <leigh@solinno.co.uk> w=
rote:
>
> Hi Andrew,
>
> On 2024-05-09 16:53, Andrew Cooper wrote:
> > On 08/05/2024 10:38 pm, Leigh Brown wrote:
> > This is past the last-post date, so Oleksii will need to decide whether
> > he's happy to make an exception for it.
>
>  From my own perspective, I know this is an enhancement and am more than
> happy to maintain it locally for the time being, so no problem if it has
> to wait.  Still happy for any feedback though :-)
>
> > Anthony is OoO for a month now, so if this is to get in for 4.19, then
> > it will need reviewing by others.  I've CC'd a few plausible
> > candidates...

I'll try to review them in the next few days.

Regards,
Jason

