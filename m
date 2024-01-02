Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BA1821FDE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 18:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660800.1030417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKiB2-0001w8-K2; Tue, 02 Jan 2024 17:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660800.1030417; Tue, 02 Jan 2024 17:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKiB2-0001tw-Gi; Tue, 02 Jan 2024 17:03:40 +0000
Received: by outflank-mailman (input) for mailman id 660800;
 Tue, 02 Jan 2024 17:03:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMnO=IM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rKiB1-0001tq-1X
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 17:03:39 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de9b1c1b-a990-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 18:03:37 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e759ece35so7326445e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 09:03:37 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a193859000000b0050e74e5a152sm3103055lfj.258.2024.01.02.09.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 09:03:35 -0800 (PST)
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
X-Inumbo-ID: de9b1c1b-a990-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704215016; x=1704819816; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I+E9cE7AGsw6BkTS1wfoNobXZiyuELP3RDIRTKXpufk=;
        b=SALB2jWIU+CBEvchgF9iviLx28bYzW+0g1hpwfLL/5C6aczQqGUxSotyyrBUrylCEU
         qXqEoddm8KRmySX9HCi87B8dN4FAv4crBUTxiZSHihVAvj2tBDKX7opAL7kgN/rECGqv
         F05cKzQQFL2wXcA4/qx0oHAZPqu8SrOFJ+MMUVwCt3uCC9iZ4lDUZ1oceWS1E8xBr/W9
         qnjNP0KEIgd7dU1PVhbZxVaTYjdG4QKQ05O3nR9akJSnh2W3fRt+zK6nf3ljlECWGL+v
         LRujsgtojE5MGZ206mgsZ8jfqG3OAiPgSzA11lq8ON0LguQOczryWyCCLp370c0V0sVr
         LoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704215016; x=1704819816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+E9cE7AGsw6BkTS1wfoNobXZiyuELP3RDIRTKXpufk=;
        b=C03afZh5YB/wPiJieMjotMh2pqENTjWXNg/f98Y489oQqe/Av3NNx4MDnha7diM/Q1
         AvjuUeLKbwi7c84ZkX64KcGNyJHhXr180WdLKsBNL0kb2TbpqKuQeCX5qIrfE4rPq0ii
         rBgn7h9NL3kij1MaE0tzQSo1yjIiakGOqk3Td0Wi3vfZSGJdSJSSuMflwuYvN4DbZoch
         8qZmA15OqNXHRYStKP/OfyuZTJg3h0z7TVyy12I10Y8M+jmAc0HMg60OS9eLyPbAryrE
         eRaaK8QBOaUhEXR8n2PNTWUaFSV/5tR9Sb+/1B3bS9dFo05fL6FfmPpR30lDU/OLy33s
         RPpQ==
X-Gm-Message-State: AOJu0YyjyDawybD2TRj6hLadlPBAUaaghuUxb+bF87gikl1huunhkUBF
	FQYD+pWATpDyt0a8syHiVDfTV3A1g9s=
X-Google-Smtp-Source: AGHT+IFmaWTYqmw9RAOt+zbo427myMIZOmPOXtcdDlizNDzQg8RcKtNRoyJH2ZgKVw8xLNB/MrDf7g==
X-Received: by 2002:a05:6512:39d2:b0:50e:8102:3ada with SMTP id k18-20020a05651239d200b0050e81023adamr4571893lfu.67.1704215015693;
        Tue, 02 Jan 2024 09:03:35 -0800 (PST)
Message-ID: <78162a7f9d1e38d6e09a53fc4c58edf7b7d5f2bc.camel@gmail.com>
Subject: Re: Xen 4.19 release schedule proposal
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: community.manager@xenproject.org, julien@xen.org,
 sstabellini@kernel.org,  Bertrand.Marquis@arm.com,
 andrew.cooper3@citrix.com, jbeulich@suse.com,  roger.pau@citrix.com,
 anthony.perard@citrix.com, george.dunlap@cloud.com,  jgross@suse.com,
 Wei.Chen@arm.com
Date: Tue, 02 Jan 2024 19:03:32 +0200
In-Reply-To: <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
	 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
	 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
	 <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
	 <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
	 <67bf2be7-53f4-40d0-a856-8ae631a054b0@suse.com>
	 <955e9b02-20bd-4279-9f60-bb757cdf1a03@xen.org>
	 <0f729b61-b839-48f6-89ae-b5570b1eae0b@xen.org>
	 <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Something went wrong, and this email wasn't sent as a separate topic,
so I re-sent it.

Sorry for any inconvenience.

~ Oleksii
On Tue, 2024-01-02 at 18:59 +0200, Oleksii wrote:
> Dear community,
>=20
> Wishing you a Happy New Year!
>=20
> I'd like to propose the release schedule for Xen 4.19.
>=20
> Based on the previous release schedules [1] and [2], it seems the
> next
> release date should be on Wednesday, July 10, 2024:
>=20
> ** Proposed option: Wed Jul 10, 2024 **
> (+9 months from Xen 4.18 release)
>=20
> - Last posting date=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Fri Apr 26, 2024
>=20
> Patches adding new features are expected to be posted to the mailing
> list by this date, although perhaps not in their final version.
>=20
> - Feature freeze=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Fri May 17, 2024 (+3 weeks from Last
> posting date)
>=20
> Patches adding new features should be committed by this date.
> Straightforward bugfixes may continue to be accepted by maintainers.
>=20
> - Code freeze=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fri May 31, 2024 (+2 weeks from Feature
> freeze)
>=20
> Bugfixes only.
>=20
> - Hard code freeze=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Fri Jun 21, 2024 (+3 weeks from Code
> freeze)
>=20
> Bugfixes for serious bugs (including regressions), and low-risk fixes
> only.
>=20
> - Final commits=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Fri Jul 05, 2024 (+2 weeks from Hard
> code
> freeze)
>=20
> Branch off staging-4.19.
>=20
> - Release=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Wed Jul 10, 2024
>=20
> If there are no objections, we will stick to the proposed schedule.
>=20
> One more thing I'd like to discuss is whether to add a file
> (RELEASE.md) with the release schedule to the source code or update
> an
> existing one (xen-release-management.pandoc). I think it will help to
> find the final release schedule for the nearest release. For example,
> for the previous release, there are a lot of emails with proposed
> schedules, polls of Xen release schedules, and I found the final
> release schedule in just one of the replies (but probably I missed
> something).
>=20
> I'll be happy to hear any comments from you. Thanks in advance.
>=20
> Best regards,
> =C2=A0Oleksii
>=20
> [1]
> https://lore.kernel.org/xen-devel/AS8PR08MB7991424A3167C70A9B29530C92929@=
AS8PR08MB7991.eurprd08.prod.outlook.com/
> [2]
> https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html


