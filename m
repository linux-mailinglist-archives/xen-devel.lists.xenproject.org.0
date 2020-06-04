Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2028D1EDF9D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 10:16:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgl38-000416-Gy; Thu, 04 Jun 2020 08:16:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EphU=7R=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jgl36-00040u-Oe
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 08:16:28 +0000
X-Inumbo-ID: b02f3d56-a63b-11ea-81bc-bc764e2007e4
Received: from mail-wm1-x32f.google.com (unknown [2a00:1450:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b02f3d56-a63b-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 08:16:28 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id r9so4306912wmh.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 01:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=0kzTUsAILuup2XHBaZJ9VmrOmJ8KV8vfdvWS4tomuL4=;
 b=PgzxATi+cjGGK+/FErIbu1HM6HKn61VlQj0TJacPUUz6RfZ8LLDvCAeUz0iclQl+Tr
 h83gMH3/O73FpvVmptyRlrEsLgrzAUNk2gK1gAMFvpdpys+oeSoA+wzVw7mlToDamaT9
 7eS2X44qa7degm0q8U/cq8CVfRlazvv5P/Pu+Rwb41SgxvqohSXm1oaZN7HtX62JnoNf
 tM/4YfTzLtpHQaxknIComLPLcku0Wnlb5mrc9trOLGvXcZ9pz/ZghIjS0LNCjC3Mz1xg
 rt4N6X8dP7fk7Q9KTG/nOyzHIeyjw53gkcrBLy6/v38xmdTfJ7Sbre4Nm8VLNve3ZNQr
 satQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:references:in-reply-to:subject
 :date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=0kzTUsAILuup2XHBaZJ9VmrOmJ8KV8vfdvWS4tomuL4=;
 b=bCke1OqdGdyy+7N2mVzqlK0yU617cEWCe11LrC4koIu/P5a43EkKt0H0DNhWIHA8Oy
 4mU3gVZhjSawlFbxJkbKXUf4wiR3uWJIFXCeSLafgNx9jcutCejwf2wX9XkdzgzUsX5v
 pfjl9MNNZvOfmyHrpWpd+CZFVEkyRzO7AImphMhP0kevwQm3XOogmaEyit38euYQF5Re
 5/AXlxvG/H8CJTdHRMAoUCQC2M+i3D72zZFPqqmffVNTiHw5olsq4j0sPJgQvRHBsgma
 iT336xbl5p7uiA66WdwrHJJC54VSLTBnfqJYtw5vd8Fd594j3LyRqzedtGHqzPwptBIk
 S1tg==
X-Gm-Message-State: AOAM532rfo/AdnWvv+EWJ73qR1vQbwgeMQnPucSSgG2GLU7eA0n/XBVh
 Onn6++UVbB1YMm7GiAmVjVg=
X-Google-Smtp-Source: ABdhPJyMLVjwiXBSeTEOpFxIHkG8MPyGNaT5eib3zyfpYoOt6rO4pCG1NoTTiI0hSpKbkTlws4zt2w==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr2801082wmj.5.1591258587409;
 Thu, 04 Jun 2020 01:16:27 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id h12sm6598995wro.80.2020.06.04.01.16.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jun 2020 01:16:26 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <35df958d-eff8-9ca7-fd72-05694f07248d@suse.com>
 <006701d63a47$408511c0$c18f3540$@xen.org>
 <f7fe86f0-f8b0-ebb2-4d01-d3b59bc38d41@suse.com>
In-Reply-To: <f7fe86f0-f8b0-ebb2-4d01-d3b59bc38d41@suse.com>
Subject: RE: Xenstore quota and driver domains
Date: Thu, 4 Jun 2020 09:16:25 +0100
Message-ID: <006801d63a48$7173f750$545be5f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJua4BClDl1csHN5IQ1VoJLzvIqqgHU1vnUAjwCJFOndzHUwA==
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
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 04 June 2020 09:11
> To: paul@xen.org; xen-devel@lists.xenproject.org
> Subject: Re: Xenstore quota and driver domains
>=20
> On 04.06.20 10:07, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf =
Of J=C3=BCrgen Gro=C3=9F
> >> Sent: 04 June 2020 06:03
> >> To: xen-devel@lists.xenproject.org
> >> Subject: Xenstore quota and driver domains
> >>
> >> A recent report on xen-users surfaced a problem we have with driver
> >> domains in medium sized or large configuration: the driver domain =
can
> >> easily hit the default Xenstore quota (in the report it was a =
driver
> >> domain for disks which hit the quota when 15 domUs were active at =
the
> >> same time).
> >
> > Which quota is hit? Node or watch?
>=20
> Node.
>=20

Ok. Since each individual backend is going to watch at least its =
frontend's 'state' node then a watch quota of 128 is still probably =
going to be restrictive for a global driver domain so this ought to be =
settable on a per-domain basis as well as the node quota.

  Paul


