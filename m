Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA511CF9F8
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 17:58:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYXIQ-0001Ef-4v; Tue, 12 May 2020 15:58:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9uWS=62=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYXIO-0001ET-Tk
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 15:58:16 +0000
X-Inumbo-ID: 63dc07ec-9469-11ea-b9cf-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63dc07ec-9469-11ea-b9cf-bc764e2007e4;
 Tue, 12 May 2020 15:58:16 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d22so4965291lfm.11
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6I2U4Zp1WU1URlas1ELBN65ErA5DxK5M5EbOQI4eRJg=;
 b=YosAvIxKZrx+gdjP8L8pZcMkP4r9ygtODG1sfhuYLV2fkj9GF5vA6XzC0zSB5CX17D
 H4Hvnpwhzn2g6LqhaLdb1ns21mMZrb19NPSmlp0wKvoK58j04NJmQPQd04S+mrUNpJLu
 Fmatq7os0iBmf64rLkby+kDsMwObs9KwE7tJ6vXu8EXFHhsifggzOy85HPuz26D2hOb5
 BHMLw4dPyR2zeTU+ngkpufLGEmJJEYhR2OamDnbhZo6vGmYdsRGXW36jYkBFWjL/F5fz
 iU7LcPa1lOWKcV9ZaR7QqX/Ai7j6lcXlYPGMyurTPDbIKcJ9M4vqS7o7LAAGC+rzJiFz
 ywxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6I2U4Zp1WU1URlas1ELBN65ErA5DxK5M5EbOQI4eRJg=;
 b=Qm0nBvzLnDBG6iqNYUxdkajrUDaHI7jbh8EwfhWKDE1jhvLxdVgznZx/8j5ZM6/v+W
 VggpxlT3hGeQIHd4Wg9b0ccErC1RYX5yt22cZ3Xmt7Hx7I5EMo4MrKwRQB2mbDRcwxGm
 ODe3ForgnHQzeD22WWBXbK2tgk6U5qKmCgDJRcz30+oMfpKcXCVQD5sU7MArkwSoBS48
 jG61OPICEq78FyiUFgw9FjXPrvAb0D6bQ1Whs/bL8pCJPHoOC6u5tkwT8lxlelvWkW7r
 CWOdhhQ/ZILwDHdq3JsOLeVp+fKVLYzDSXSVETrFFKVwr9aIQBbuOx1TMB1hRz/2JMXs
 A33g==
X-Gm-Message-State: AOAM5316wInYLFHpNHah28zP/r0e+vFR28SwM0JcICJ9QshHd8qaiyDN
 bpL7a2SHcuVJK5h/r6AFe2HMC4GS8/50wiyE7pw=
X-Google-Smtp-Source: ABdhPJx4ezPcb0722JZ7HfS00b8/G6UbRYl+xvNzq5s/tBT+M3OzbdB0QfEuwKMfDDM/4/bPXLgqvx5uV+nIy1uUqm0=
X-Received: by 2002:ac2:4da1:: with SMTP id h1mr14624104lfe.152.1589299095160; 
 Tue, 12 May 2020 08:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
 <c38afab85d9fc005edade229896008a4ad5a1929.1588282027.git.rosbrookn@ainfosec.com>
 <3ED0B49D-123C-4925-B3A0-4FA0B44DF9F0@citrix.com>
 <CAEBZRSdWCJo9kBnNv6Jqt76E3fb8DDX6C4zndMtvrhngEzGHxg@mail.gmail.com>
 <AC8F9121-EA81-4461-A963-F195BE2C070A@citrix.com>
In-Reply-To: <AC8F9121-EA81-4461-A963-F195BE2C070A@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Tue, 12 May 2020 11:58:03 -0400
Message-ID: <CAEBZRSe37UZZY23QA55WbNYMohwLVs4k4F4UFwV7iUqOeE=caA@mail.gmail.com>
Subject: Re: [PATCH 2/3] golang/xenlight: init xenlight go module
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> For trademark reasons, when we joined the Linux Foundation, we did a big =
rebranding from =E2=80=9CXen=E2=80=9D to =E2=80=9CXenProject=E2=80=9D.  (Se=
e [1] for more details.)  The xen.org domains are just for backwards compat=
ibility. :-)

Ah, thanks! I'll fix that.

-NR

