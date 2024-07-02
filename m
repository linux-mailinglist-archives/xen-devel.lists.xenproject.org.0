Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC00923AA3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 11:50:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752163.1160278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOa9T-0004zA-R5; Tue, 02 Jul 2024 09:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752163.1160278; Tue, 02 Jul 2024 09:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOa9T-0004xZ-Ng; Tue, 02 Jul 2024 09:50:19 +0000
Received: by outflank-mailman (input) for mailman id 752163;
 Tue, 02 Jul 2024 09:50:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOa9S-0004xT-1u
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 09:50:18 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c0a1bd0-3858-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 11:50:16 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50cso38956041fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 02:50:16 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5168c73bsm16151411fa.113.2024.07.02.02.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 02:50:15 -0700 (PDT)
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
X-Inumbo-ID: 7c0a1bd0-3858-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719913816; x=1720518616; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LUzOwqpfo6g4gd0h64JKbH28vYKv9WbOfOTaCjENmb4=;
        b=M9uVQmvyq60e2loa8kyNCwdqe6EpafX55fGlGsYEcK/RCGMkJ5T4qoAKq90+DwT00k
         QT9KHJjBqdBmrStNM4BYXhHAo8UI+E+1jWV6nqDiG982k5/agjl2vTPC6Ev7qFnoq6GD
         5Yn6Z0UpmL666P1EjoK9pxcOoeCpTZBJLLVuewTxVBmEq/fRGZ+NAAjoQIv4aJ2+CVCK
         U2dRZlz1tVdm5+v0+7vt0p2GL55ElM116BbcD0GFBpy/pGDnGQYbHf2ybKB24toch9RE
         uFYxSn5A71AiAuV47GuM3xA1aZX8RXOo5X0j15XC5SWzsC4sBxwlfwRSrXSLwR+VCkSO
         L8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719913816; x=1720518616;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LUzOwqpfo6g4gd0h64JKbH28vYKv9WbOfOTaCjENmb4=;
        b=CSrykTnxD5jk9S8GrVkPMoeVAdV2GocmdHvNyF1ulX5QUU9BafON3/PcgsN/Y69fqI
         HttaBMa2y5QCPmDDoPPeoFVA2ccPxCboSIdYvmP8/m860RyNZJ+etIZ2eUoh5PakSdFE
         Q5mhxi6+m+l2XjCF+aWLth3V3DCJLvAvzOhhFf2Fui3XWp+3GOAQgLW3L2dZgyLhXizo
         IEAqMbUeBnmK3qja1wfttp8WrHBGb2msCxqugAlBMW4hd+BGk9C1hK41CTNoHfdebZNm
         3816ScMwmtag1WPxm8Ua4oH/jTOJUqtUJI5qq6zhVw6k6+vsCvnsCCayYekoyVsXDL8c
         yr7g==
X-Gm-Message-State: AOJu0YyU65Z8qyV4/1fUtxi58ZZ31upbJ+XgiJId51qfa/dzqeV2t7K6
	ipGOxitVaTsDhrGg2+gKnpVn5JMPHXxgBWos195L3O1/08w/2bVj
X-Google-Smtp-Source: AGHT+IGY/TuWCLTFSjvAtZ/kB5U66kkENN7Q13ohr7vAAorjQogYYOtRDuCzSdCWJA7+1ZxtJHzk6Q==
X-Received: by 2002:a2e:a7c2:0:b0:2ec:3dd4:75f4 with SMTP id 38308e7fff4ca-2ee5e6e0221mr52769461fa.38.1719913815347;
        Tue, 02 Jul 2024 02:50:15 -0700 (PDT)
Message-ID: <f4ea9d1e7fd17e8ca64461b3df29735c0ee5998c.camel@gmail.com>
Subject: Re: [PATCH v3 for-4.19? 3/3] cmdline: document and enforce
 "extra_guest_irqs" upper bounds
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger
 Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Tue, 02 Jul 2024 11:50:14 +0200
In-Reply-To: <a733033f-e456-4488-a9f8-845a7874268d@suse.com>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
	 <3c3a1d0c-06f2-a392-b2f9-381bed5c5e7b@suse.com> <ZoJ9Bd2kg3IQ0Z28@macbook>
	 <8ab71a85-6056-4c4f-8513-a21c061a176d@suse.com> <ZoKvP6StEbMTgjrY@macbook>
	 <938e5bd1-4523-4b49-80fa-1c3331587972@suse.com> <ZoLIpulcC7dqtxYR@macbook>
	 <a733033f-e456-4488-a9f8-845a7874268d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-02 at 10:26 +0200, Jan Beulich wrote:
> On 01.07.2024 17:17, Roger Pau Monn=C3=A9 wrote:
> > I think we are in agreement about what needs doing.=C2=A0 I can provide=
:
> >=20
> > Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >=20
> > With the changes we have agreed to arch_hwdom_irqs().
>=20
> Yet another request for considering for a release-ack.
It doesn't fix any real issue, does it? It just provides limitation of
how many pIRQs can be used by domain.

Anyway this change is low-risk so:
 Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

