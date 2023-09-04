Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B7D79178C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 14:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595154.928660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd90l-000551-CQ; Mon, 04 Sep 2023 12:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595154.928660; Mon, 04 Sep 2023 12:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd90l-00052x-9H; Mon, 04 Sep 2023 12:48:59 +0000
Received: by outflank-mailman (input) for mailman id 595154;
 Mon, 04 Sep 2023 12:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VIGl=EU=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1qd90j-00052g-K2
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 12:48:57 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 687e5b40-4b21-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 14:48:55 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-52a1ce52ef4so1965300a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Sep 2023 05:48:55 -0700 (PDT)
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
X-Inumbo-ID: 687e5b40-4b21-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1693831735; x=1694436535; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P6SuIUeMJ8u02mehYLNuaFrRUsUQroHyAonWStAvrmk=;
        b=ICcLqZdDZXEdDG3eSmQ/3RwrE0tTvt4tBbjQ3KIcBehoGfb2quNAKIHYRYzTIENLRV
         BZJ4FScPoWGDHGFVPpFBifgOgwUZX3UbAjrRjQoNPMJ4lCLxDaa9jegXTD9OdhpJQ9Tk
         AV2OP6Izr5Ezlnc0dYtN+IymAxWh/njBq/Kas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693831735; x=1694436535;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6SuIUeMJ8u02mehYLNuaFrRUsUQroHyAonWStAvrmk=;
        b=liRvpbOuw5vDIHr3V3vS6kM7lzvQtVVGVPA0qQf726JoVC6QFHVA92fibzqJNctytx
         G0Wjz6LG5tYisFGwEF4iKjsja1QJf6Ma1gKGmOjm4DMAxRBrF2WAi5TwBQv8/gv0sfH/
         RyIOczvvvHzIqINcldj/26Mfygv00YkHoNqfcEweTxSQMTEDOMcXCSP0e2gtdPlXnF43
         RTJz0EBY0+ejAJpy1/wPWhRQDZ8Gg9zl9sdYrboSFslKEl3uIxHTpeZ2lKIt18jXtCbf
         vugqmNa2L/mf3GaK1F+ZtuKNaFX6z8GQaZ/KFxIiS6FBt/OeQoaDEPPMV+wHyfdFTX9g
         b10w==
X-Gm-Message-State: AOJu0YwwLMbtr1QXqxICJGqhL4V/ooRsqe7y1mh8UqbaRQdxjCL12bN1
	69zkogbjc1zGbT/LBJ/fe7sTNA1qPOY4T0xwH1L1wg==
X-Google-Smtp-Source: AGHT+IGOHrE9TCNaLsNNnyUR4UqMIUoxRy4E0ZklR9ivvATHeaKUHt2WrQjcxEFKNU6AiMaatfk3e+92UF+d+q1xwVU=
X-Received: by 2002:a17:906:197:b0:99d:dce8:41d6 with SMTP id
 23-20020a170906019700b0099ddce841d6mr6417985ejb.71.1693831734906; Mon, 04 Sep
 2023 05:48:54 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 4 Sep 2023 13:48:19 +0100
Message-ID: <CAO-mL=zvA8WYjPoKM2t961dEC3unb_eHW=GNLhkX3Gra3Hoi4A@mail.gmail.com>
Subject: Documentation survey
To: xen-announce@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000de7127060487eeaf"

--000000000000de7127060487eeaf
Content-Type: text/plain; charset="UTF-8"

Hey everyone,

Hope you've all had a good weekend!

I know that documentation is an important part of The Xen Project, and I
have received feedback from a number of users on this topic. Currently,
there are some barriers to entry and improvements that can be made.

In order to understand further, please could you answer the following
survey (~5-10 mins) on your thoughts around the existing documentation.
This feedback will help achieve a plan of action.

*All responses will be anonymous. *

*https://cryptpad.fr/form/#/2/form/view/aIaNqMdkkV85YkQSzM0+ddwMY36XSTf+Vl3k2APoP-U/
*
<https://cryptpad.fr/form/#/2/form/view/aIaNqMdkkV85YkQSzM0+ddwMY36XSTf+Vl3k2APoP-U/>

Many thanks,
Kelly Choi

Open Source Community Manager, XenServer
Cloud Software Group

--000000000000de7127060487eeaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey everyone,=C2=A0<div><br></div><div>Hope you&#39;ve all=
 had a good weekend!</div><div><br></div><div>I know that documentation=C2=
=A0is an important part of The Xen Project, and I have received feedback fr=
om a number of users on this topic. Currently, there are some barriers to e=
ntry and improvements that can be made.=C2=A0</div><div><br></div><div>In o=
rder to understand further, please could you answer the following survey (~=
5-10 mins) on your thoughts around the existing documentation. This feedbac=
k will help achieve a plan of action.</div><div><br></div><div><b>All respo=
nses will be anonymous.=C2=A0</b></div><div><b><br></b></div><div><a href=
=3D"https://cryptpad.fr/form/#/2/form/view/aIaNqMdkkV85YkQSzM0+ddwMY36XSTf+=
Vl3k2APoP-U/" target=3D"_blank"><b>https://cryptpad.fr/form/#/2/form/view/a=
IaNqMdkkV85YkQSzM0+ddwMY36XSTf+Vl3k2APoP-U/=C2=A0</b><br></a></div><div><br=
 clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly C=
hoi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Open Sou=
rce Community Manager, XenServer</div><div style=3D"color:rgb(136,136,136)"=
>Cloud Software Group</div></div></div></div></div></div></div>

--000000000000de7127060487eeaf--

