Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216958D3525
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 13:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731806.1137520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCHAv-0005np-QT; Wed, 29 May 2024 11:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731806.1137520; Wed, 29 May 2024 11:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCHAv-0005lN-N5; Wed, 29 May 2024 11:08:57 +0000
Received: by outflank-mailman (input) for mailman id 731806;
 Wed, 29 May 2024 11:08:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCHAu-0005lH-Jz
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 11:08:56 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6da2eb8-1dab-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 13:08:55 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a626777f74eso228889366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 04:08:55 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6357bf05f6sm115536666b.206.2024.05.29.04.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 04:08:54 -0700 (PDT)
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
X-Inumbo-ID: d6da2eb8-1dab-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716980935; x=1717585735; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CwnYHq/a9hUpOD704HVTgol18BEIUqDzbT4ME56HY+4=;
        b=R2Dwtfz0FmRl37JLi8vP/PVVzsiVm2TqxfXNSs+qqOz67/5e4KvclThFrY1CNUdVdn
         ciim+yzMrvWPLGtH2kkH10aeRNRQBghFyKbv/yIFla1q4P7lE/vNwaYq3Ma7JWat2Q31
         VixUXwZ5LVwnyuPM7bKr33ffKwIgwKx6RSVWB0O5VopbL2OYgeAjsxXeZHOCUc65vUmf
         XKk+nLPiuo0jMbytZXhZslGV8Hklq9sANiOScQdQ1w6W9dy2bAtxUyKsH4UHJgFk+aql
         ibY6jnqmTJ1HpAgSKtjjYWePuFbBsaoL8BQ3IwyStIqKG26HvS6whgYoXIvjaQX7EJsh
         08Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716980935; x=1717585735;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwnYHq/a9hUpOD704HVTgol18BEIUqDzbT4ME56HY+4=;
        b=JY4K5dIsmdUSwo8dr/9SQzhrEE5jurvxbIoaiuWznBbAzWxsDHkNxpejt/H4/GY/6t
         q6U98xSpUYpqVUC1s+kMCbPm01LlzcS435WcMu4q/yOKFwIWkXH39WTRBKfDJsGGYF56
         tX/6evOr6msXbnIU4XZetzDize65C3MTXOG2fJ6IPOScTRB9AhkYQ4ZWP91UFBJlaZ0u
         9o6RoygzERXHbDu/ko/h34ibWLqzBoKYesJh0Ck98129NEQ+ugUzP2njoC12ywBScK9k
         qeIOlWe9zHb+UOxgRm8erGrkKt/YnJsM5UxaqHYJMRJnUvMd9v37i37SA2BqNf3e0FTN
         Aiww==
X-Forwarded-Encrypted: i=1; AJvYcCV9+uGFBb1kOJYraumrecXyh27LeAVeVEn45/7HB66qzTfavUdvUlLjJmOEbZvt2B19USxIbWCSH9AUpWlJAgRe46WFb85zrldOihEdBA0=
X-Gm-Message-State: AOJu0YxYlZ0yBn35k8fSxLPWKKTMQcQpCZHdWxDfKQjGHvibyV2xFtB6
	PFKbFpQE92JLURziRfPiF4mNi978G5I5QwDFEkMC5MHqBcDUyBHP
X-Google-Smtp-Source: AGHT+IEsA1eA3bkTDlQFLjpY0AZGbLds3lg1hTIj+3Fcw1pHqZNlwXC0bnQC3q/ADFvnRFdjmmtC9w==
X-Received: by 2002:a17:906:1547:b0:a65:c143:b3d3 with SMTP id a640c23a62f3a-a65c143caa4mr25062166b.3.1716980934654;
        Wed, 29 May 2024 04:08:54 -0700 (PDT)
Message-ID: <1dde31ff838637bbe414ccf5860f21bfdd8450cd.camel@gmail.com>
Subject: Re: Updated Xen 4.19 schedule
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, community.manager@xenproject.org, Kelly Choi
	 <kelly.choi@cloud.com>
Date: Wed, 29 May 2024 13:08:53 +0200
In-Reply-To: <495de773-bbd6-4a05-b6a4-e00cda301a96@suse.com>
References: <e9514fa9fc0a0ea9eae2f0c4accf9b3060e95f9e.camel@gmail.com>
	 <495de773-bbd6-4a05-b6a4-e00cda301a96@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-29 at 10:19 +0200, Jan Beulich wrote:
> On 29.05.2024 10:03, Oleksii K. wrote:
> > Hello everyone,
> >=20
> > I would like to announce that I have decided to update the Xen 4.19
> > schedule due to the extended feature freeze period and the upcoming
> > Xen
> > Summit next week.
> >=20
> > I propose the following updates:
> > =C2=A0=C2=A0 Code Freeze: from May 31 to June 7
>=20
> This is almost fully the week of the summit. With ...
>=20
> > =C2=A0=C2=A0 Hard Code Freeze: from June 21 to June 28
>=20
> ... this, did you perhaps mean May 31 to June 20 there?
>=20
> > =C2=A0=C2=A0 Final commits: from July 5 to July 12
>=20
> Somewhat similarly, what's between June 28 and July 5?
It should be RCx ( IIUC how it was done previously ) +  bugfixes for
serious bugs (including regressions), and probably low-risk fixes only

Let me share the updated schedule as I made incorrect calculations:

Code Freeze: Fri, June 14 (+2 weeks from Feature Freeze, considering
the week of the summit)

Hard Freeze: Fri, June 28 (+2 weeks from Code Freeze, usually it is +3
weeks, but I think we can go with +2 and extend ( to 3 weeks ) if
necessary)

Final Commits: Fri, July 12 (+2 weeks from Hard Freeze)
Release: Wed, July 17

~ Oleksii
>=20
> Jan
>=20
> > =C2=A0=C2=A0 Release: July 17
> > The release date is shifted, but it still remains in July, which
> > seems
> > acceptable to me.
> >=20
> > One more thing:
> > No release ack is needed before Rc1. Please commit bug fixes at
> > will.
> >=20
> > Have a nice day.
> >=20
> > Best regards,
> > Oleksii
>=20


