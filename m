Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF597AB405
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 16:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606914.944999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjhPi-0006Vc-0v; Fri, 22 Sep 2023 14:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606914.944999; Fri, 22 Sep 2023 14:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjhPh-0006Ta-Uc; Fri, 22 Sep 2023 14:45:49 +0000
Received: by outflank-mailman (input) for mailman id 606914;
 Fri, 22 Sep 2023 14:45:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcWe=FG=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qjhPh-0006TU-1e
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 14:45:49 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b662f5d9-5956-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 16:45:45 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso38129361fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Sep 2023 07:45:45 -0700 (PDT)
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
X-Inumbo-ID: b662f5d9-5956-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695393945; x=1695998745; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgB0VlPd21gS/HRsR4iWFum85/IgSU6G3+/ryRVHYjg=;
        b=kwCmf8PixNmzhao1bCBxXORKHDUUP4LZepbPBdpSiJ9w/wZKbH5QRSYXcnXvxVSdP9
         j7CBRWSWTS0RBoTUj5o+s78zDb3lZsSAMDL0jVJzE2W3hGoeiAwZbECZ61PFzNId9AaI
         wHZWrHglt9FVSlcppsttswWT8d4uxWVoDQNI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695393945; x=1695998745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgB0VlPd21gS/HRsR4iWFum85/IgSU6G3+/ryRVHYjg=;
        b=Om9NWt+NcjviW8fw6OVAHH/f9EXK5a7uEk126f+9Rl4V72NS7XBUpqiFJWA0TlYqJ3
         yNNIDdTm1lfbCfR/eTssjQr79nP5a4s/YQ4GVEcTwn490FAITjA+YZ84BECD4T8GQg8T
         hAe6sjDIOcyF92L6igqBYpL2GaxPU+QdJZtKH+NyJqY3hfORyW1l4VD8l9WAcon3puiO
         HDFcfeLf8v2wn5jyKaShKm7bjGPhLVovSwx0uWcDyiQUnRbX7M9ZtdopE6vLEQo7EDoe
         pDzv54J+DPdBkXavk6zYm+OL3MevAO3ZUzSoJJp0izN3coiwKAnFQ6WR2q7Hsu4wgGgr
         oiEA==
X-Gm-Message-State: AOJu0YwlwrbELVissX0XE6pbH8BIc8SUMtGiFL9JcnDDsoBtWhtukrSs
	PAJlGpCJU+SnpeCsY1S4ZchX+DnQPyWiSbiMIVz7Ow==
X-Google-Smtp-Source: AGHT+IGHK2ajz1QSZQwSZNggs2VKzdgrhF+maMllrx74bz+4CD34zAnrhGT3BqL3CkjqWcWMYFNg+nEcpMxDjoWCaE8=
X-Received: by 2002:a2e:9952:0:b0:2b9:3684:165 with SMTP id
 r18-20020a2e9952000000b002b936840165mr7729516ljj.8.1695393944410; Fri, 22 Sep
 2023 07:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 22 Sep 2023 15:45:33 +0100
Message-ID: <CA+zSX=bFh70ekgy=C33h-crLphLH7+8Em5TJ4zi81g-dwtou4A@mail.gmail.com>
Subject: Re: Xen 4.18 release: Reminder about feature/code freeze
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Jan Beulich <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, 
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 2:08=E2=80=AFAM Henry Wang <Henry.Wang@arm.com> wro=
te:
>
> Hi everyone,
>
>
>
> This is the reminder that we are currently in the feature freeze. I apolo=
gise
>
> for the delay.
>
>
>
> I decided to make the code freeze date on Fri Sep 22, 2023, to give peopl=
e more
>
> time to react because of my late reminder about feature freeze. The hard =
code
>
> freeze date will remain unchanged, i.e. Fri Oct 6, 2023. So currently we =
have 2
>
> weeks before code freeze and another 4 weeks before hard code freeze. If
>
> everything goes well, we can cut 4.18 rc1 at Fri Sep 29, 2023.
>
>
>
> Also, below is the critical items on my list for 4.18 release:
[snip]
> 5. [PATCH 1/2] credit: Limit load balancing to once per millisecond
>
> https://lore.kernel.org/xen-devel/20230630113756.672607-1-george.dunlap@c=
loud.com/

This has been checked in, thanks.

 -George

