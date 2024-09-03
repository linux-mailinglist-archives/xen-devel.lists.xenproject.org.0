Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162FC9696BB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 10:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788772.1198259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOiE-0001Zt-7Q; Tue, 03 Sep 2024 08:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788772.1198259; Tue, 03 Sep 2024 08:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOiE-0001YJ-4r; Tue, 03 Sep 2024 08:16:30 +0000
Received: by outflank-mailman (input) for mailman id 788772;
 Tue, 03 Sep 2024 08:16:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9XU=QB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1slOiC-0001YD-Kq
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 08:16:28 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0c2d07a-69cc-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 10:16:26 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-533488ffaddso6271182e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 01:16:26 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408417e5sm1926632e87.223.2024.09.03.01.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 01:16:25 -0700 (PDT)
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
X-Inumbo-ID: d0c2d07a-69cc-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725351386; x=1725956186; darn=lists.xenproject.org;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2k/ot04Qy7TGXM45vPI52im7E9j5uuj+E6GrKMLOvwo=;
        b=SLqLH+vWnj+RKsZ6ZAR9rEb3jlXiaMigZkWs8+vnmxM1o/rOHRJXHUR9Qx1rmH0el+
         Q562Yg/AJH6XJMtCDwRuGWXOunk7Ar8tfaCTYLERSFZgR1Rxsb92Frgruj+mUwem/cQp
         EuBsyEB5/zvSg9pCSnfDFpBMQWnBGdEu19vNpphZutKr7sKvE9fF71kESyOuadGEBu5/
         KAL9aO/WciDkugDX0bLuKl6S3T8WBxXm5J0nYw/YiKpQXfWGn4UVQptSQJhtShQXlOWx
         y2sOQ4dhxUikPqnmgxD2isovh1AJB9JrukkM4kidULvQVvduZprCezaCIL9FQ4OFh3Ud
         QYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725351386; x=1725956186;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2k/ot04Qy7TGXM45vPI52im7E9j5uuj+E6GrKMLOvwo=;
        b=qJAuymEmgF1IHkZ4K2fBg/Huh/ydwAX+5ayesdISNzabk5lu9CgB6y+/qAVnK5Tvmd
         nq/OSV7EDzNaOMlUgHZzbx2qqf9I+GjTVloyabMjtfe6WmRHMZfAUdkPcyi9+vrXhsRN
         69/2dnAlvT7cw+d4iCQSoRv52MzzcZ2aLknboDqLJqoKstk+RpTh1u65MwMSUoC5CMNF
         Z3rDdy6usk/nFk8GJvkXn2ul8Zr5xW+MJxPv74zNCLEytuF9gNF1Palp9KmOZ2p1dPZZ
         S4knsCN92uswJup8pe6W/UO5hWLwVaPGFyKhiJ7rPQKYE+0pBYOCFvN0n9NBCZnoKJmd
         7DxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhSDTdd9xqw+0WBc1Ct6BGSOTA+OXVGurW2zglAaXAuDFkKRZeAibtHALXK0R11XziiMaX96jJvk4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIj52Co2smXOZN2t9Z9sU+KkqiX+iEKie1g2vIC3JXYrg6aVzZ
	5XBaGImJeEs1nuNmuWLsszXTS4N0588Ep/Id84dr4RWUCXL/sTKB
X-Google-Smtp-Source: AGHT+IG511r7t4apbFx/Q4mKlxtR/FBPm4YTjyZ3dWbp5PTYLf0eRu0XW8grSJpMHzgGDEJNt53LvA==
X-Received: by 2002:a05:6512:3054:b0:52c:a5cb:69e4 with SMTP id 2adb3069b0e04-53546baae15mr7547782e87.54.1725351385476;
        Tue, 03 Sep 2024 01:16:25 -0700 (PDT)
Message-ID: <95f1d300de710c568f55669b160d72f6746d4456.camel@gmail.com>
Subject: Re: Call for next release manager
From: oleksii.kurochko@gmail.com
To: Kelly Choi <kelly.choi@cloud.com>, xen-devel
	 <xen-devel@lists.xenproject.org>
Date: Tue, 03 Sep 2024 10:16:24 +0200
In-Reply-To: <CAO-mL=y+AGD7Yw2WNK7GWKBEYvcHXTHFbRSSJLFREHMG_KGwZg@mail.gmail.com>
References: 
	<CAO-mL=y+AGD7Yw2WNK7GWKBEYvcHXTHFbRSSJLFREHMG_KGwZg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=-Ml7P7KSrH62vbQcJ2Epm"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

--=-Ml7P7KSrH62vbQcJ2Epm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

On Thu, 2024-08-29 at 12:05 +0100, Kelly Choi wrote:
> Hi all,
>=20
> I'd like to thank Oleksii for his hard work as the release manager
> for 4.19.
>=20
> As we prepare for our next release, we welcome any interest from the
> community in becoming the next release manager.
>=20
> Feel free to reply directly with your interest, or you can raise this
> in the community call.=C2=A0

I would be happy to continue as the release manager if no one minds.

Have a good day.

Best regards,
=C2=A0 Oleksii

--=-Ml7P7KSrH62vbQcJ2Epm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hello everyone,</div><div><br></div><div>On Thu, =
2024-08-29 at 12:05 +0100, Kelly Choi wrote:</div><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><div dir=3D"ltr">Hi all,<div><br></div><div>I'd like to thank Oleksii for=
 his hard work as the release manager for 4.19.</div><div><br></div><div>As=
 we prepare for our next release, we welcome any interest from the communit=
y in becoming the next release manager.</div><div><br></div><div>Feel free =
to reply directly with your interest, or you can raise this in the communit=
y call.&nbsp;</div></div></blockquote><div><br></div><div>I would be happy =
to continue as the release manager if no one minds.</div><div><br></div><di=
v>Have a good day.</div><div><br></div><div>Best regards,</div><div>&nbsp; =
Oleksii</div><div><span></span></div></body></html>

--=-Ml7P7KSrH62vbQcJ2Epm--

