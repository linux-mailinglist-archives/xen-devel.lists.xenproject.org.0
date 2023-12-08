Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD4809EC0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650445.1015973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWnN-0004GJ-C1; Fri, 08 Dec 2023 09:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650445.1015973; Fri, 08 Dec 2023 09:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWnN-0004Du-9V; Fri, 08 Dec 2023 09:05:17 +0000
Received: by outflank-mailman (input) for mailman id 650445;
 Fri, 08 Dec 2023 09:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atw2=HT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBWnM-0004Do-L6
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:05:16 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6f14675-95a8-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 10:05:15 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a1d2f89ddabso223534766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 01:05:15 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 tq24-20020a170907c51800b009ff783d892esm748159ejc.146.2023.12.08.01.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 01:05:14 -0800 (PST)
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
X-Inumbo-ID: e6f14675-95a8-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702026315; x=1702631115; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IVIPgKFpHWU9O5/5GcUxejZ+BoMGSQGvJcxPnAMgKuo=;
        b=EmBuq8uvKXKjrJGOFhEuWO7KqFiiGb3zoeV3nGlhgL9xDQ++bqkVXeYRtUjy7Yy3/a
         HAf//LfbmQwyShJfFAVlqy5nV6sCqdeXgjGULmj/PCIjai1Go1LQ5hp8ydm5iHY7xUPo
         JqAzcZ++RfpvXJkyFVv3bFd7yNZzGI5ENgUMD2OUFjHRnRkuPlAUQwh3h9Ka25g3t2gD
         7xUAE47Mm6kcOZer3TscJn9pLP3VC559slAml7W/kVHSTEOmJUVG7wlyPslaR9WXdGFa
         v/ZnlV1IE5Dma+8vj8Prdqkm5LyCY2YUHpuXcIvHazE1nDtXkgo+nAOxNuxhilImGISy
         n7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702026315; x=1702631115;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVIPgKFpHWU9O5/5GcUxejZ+BoMGSQGvJcxPnAMgKuo=;
        b=XPSiigmAqpvnE9TyLoN2xDNfpPhzfJfw/sH5ZfqL2o/87d5Ok/3tG5YovqKBDajVOw
         uvlV9vwbYs4DCyCgIkvSTAa0k0kSHwZgUzkvt6YW0aHv1YXLT5+Xw2qxmSrqVOdep0qZ
         Iyhc8WSgeINPIr4WbSBr1DPHl7Av17cmsTNsOYmgFH2FnVqCsEyui56x1g7WgQ6+lKWC
         ljB1YrxWkQ7NPMoMaj7wy0H2S3OBHVkbB3e4sHapMQo8lWewRFQvvZyGn7yiZRgHgRgz
         0NPVr2N7MA9q1aq6MZglFrL0h5wIudRzjIsC3jus3IPZl3iFthXyegiushwQIfoGyXac
         Trmg==
X-Gm-Message-State: AOJu0YzdX3Otkv+bh+B0wgkMP6E8de7EJtVVOeZxoUrQPzv/hcu6FxDL
	rgYoOzLV5t71PwKvxKPSgzY=
X-Google-Smtp-Source: AGHT+IFWQ8wmwd2f7XYGTFZcZVlyzQMfMmBw6zJAtyBXguhZdqNWEp4AWfLlwNqjYRCl0sWd0awdog==
X-Received: by 2002:a17:907:1741:b0:a02:609a:5c6c with SMTP id lf1-20020a170907174100b00a02609a5c6cmr1931594ejc.44.1702026314972;
        Fri, 08 Dec 2023 01:05:14 -0800 (PST)
Message-ID: <cb042ef1c0380e23b252365b0a562534b02b1fa5.camel@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Hand over the release manager role to
 Oleksii Kurochko
From: Oleksii <oleksii.kurochko@gmail.com>
To: Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Date: Fri, 08 Dec 2023 11:05:13 +0200
In-Reply-To: <581CA0BA-02BD-4696-A0E3-BE58568C2479@arm.com>
References: <20231207162036.1921323-1-Henry.Wang@arm.com>
	 <90575ebd-4b09-47bd-a4ee-2f081020b2ad@xen.org>
	 <38ed531570ef67b6b1f95ba5fa44bb37821bca9e.camel@gmail.com>
	 <581CA0BA-02BD-4696-A0E3-BE58568C2479@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-07 at 23:59 +0000, Henry Wang wrote:
> Hi Julien, Oleksii,
>=20
> > On Dec 8, 2023, at 05:09, Oleksii <oleksii.kurochko@gmail.com>
> > wrote:
> >=20
> > Hi Julien and Henry,
> >=20
> > On Thu, 2023-12-07 at 18:46 +0000, Julien Grall wrote:
> > > Hi,
> > >=20
> > > On 07/12/2023 16:20, Henry Wang wrote:
> > > > I've finished the opportunity to do two releases (4.17 and
> > > > 4.18)
> > > > and Oleksii Kurochko has volunteered to be the next release
> > > > manager.
> > >=20
> > > Henry, thanks for your time as release manager.
>=20
> Thank you Julien for your kind support as the release technician!
>=20
> > > Oleksii, thanks for stepping up and good luck for the role!
> > Thank you very much.
> >=20
> > Just one question: Is it necessary to provide my ACK?
>=20
> Oleksii: Yes please, your ack means you are happy with taking the
> role.
Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Also, any thing that you need, please don=E2=80=99t hesitate to reach out=
. I
> will stick
> to the community (more as the code contributor though) so I will be
> more
> than happy to help.
Thanks a lot.

>=20
> > > > Hand over the role to him by changing the maintainership of the
> > > > CHANGELOG.md.
> > > >=20
> > > > Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> > >=20
> > > Acked-by: Julien Grall <jgrall@amazon.com>
> > >=20
> > > I didn't hear any objection during the community call. But I will
> > > give=20
> > > until Tuesday morning (UK time) just in case. If there are none,
> > > then
> > > I=20
> > > will commit it.
>=20
>=20
~ Oleksii


