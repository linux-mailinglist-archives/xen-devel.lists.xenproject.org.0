Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2901F6C9E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 19:12:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjQk7-0004Zi-Gb; Thu, 11 Jun 2020 17:11:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XPau=7Y=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jjQk5-0004Zd-Kv
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 17:11:53 +0000
X-Inumbo-ID: a4e279ec-ac06-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4e279ec-ac06-11ea-b7bb-bc764e2007e4;
 Thu, 11 Jun 2020 17:11:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y20so5773958wmi.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2020 10:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=l+S8SsSfyLQKzrOFZh3L67P54q5wd2LgM9TcQbt4WrI=;
 b=D5DhT082LXak95d2gNck/lMXd515iInIDpgR6QTetwgXPc3l559U3ytQHKxzgWqJYD
 MgLeWQxBrurf9vL9lJW0v16CG6ziZ/4+JJekTsnDGMcI4QJINNRrr5V5UfmFQ/4gd64t
 AMTuBgcioXInjscZVkgFG34rSF9HcFE/fMOsTem8lylkdFsgfcrVcPmIoh54dUErcXLd
 zoWAmA/S6sp17YX30G1+lVYPsqGrKcy9ZxpDDwSAn6OvIGdqUDah1qYPugYgufm6QmAP
 pa6nCBQtwUvY570NR+Qn5pBTaL4QgEIzCzxk1gDnaa+rw4zyR6lKBJbVCxuTfnvTvp8o
 +EHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=l+S8SsSfyLQKzrOFZh3L67P54q5wd2LgM9TcQbt4WrI=;
 b=fmbXgQKXKoRAz9C7mGXFwiKR72EduyVu1fZQ84FNXmArASLi/KCbUv0qFAcKWYCBm/
 Z4XB40Iaki2F20tJGNiypSISeYG3zUq1vcBIdvAv/hI2+PXfbYRVm9gQkfeBslecCiXV
 sL/tnLBWXHiHISPw0D0nTaMvB/lpMcO4IEzurtxgLcrA2gh6ueW/Mq/hg9rl0qtXfyQq
 lBmw8jYDjscWaqJv9lIbap6hNkNho65n15ppWu1W4UxSU2fu2S/WX6+j8I0uVSFXl/Ba
 GvnS+t7ydxZSnE69hvabjk5P+bBVk4k1qTWK+j5vWw0DJ46hf9ycGEpnpkxm0BHf4o5r
 zOCg==
X-Gm-Message-State: AOAM531Vc2QiBSPN08F6aiWA44bSJGjDuOFW9iEGPiamF7po4M3PL8AT
 f6ZnitVgLMlEOzV3C/UD4ek=
X-Google-Smtp-Source: ABdhPJzTCb4AeYzQtdi+MVerwrADdF9H+g2u5zJujVuDoV7iGyvLipWZk4N1AAfNxc4rMdMnHIGIpQ==
X-Received: by 2002:a1c:ddc1:: with SMTP id u184mr8633774wmg.115.1591895512066; 
 Thu, 11 Jun 2020 10:11:52 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.177])
 by smtp.gmail.com with ESMTPSA id u7sm6020345wrm.23.2020.06.11.10.11.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jun 2020 10:11:51 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-3-roger.pau@citrix.com>
 <6de3a582-d9a8-60b5-9525-c9223932e4ed@citrix.com>
In-Reply-To: <6de3a582-d9a8-60b5-9525-c9223932e4ed@citrix.com>
Subject: RE: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for
 GSIs not requiring an EOI or unmask
Date: Thu, 11 Jun 2020 18:11:50 +0100
Message-ID: <00f901d64013$6615a860$3240f920$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHx2+DDRjLQssRal4XfU2f+2Pe7FQIj4hRNAekcXgOofAaiQA==
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
Cc: 'Wei Liu' <wl@xen.org>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 11 June 2020 17:26
> To: Roger Pau Monne <roger.pau@citrix.com>; =
xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Jan Beulich <jbeulich@suse.com>; Wei Liu =
<wl@xen.org>
> Subject: Re: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag =
for GSIs not requiring an EOI
> or unmask
>=20
> On 10/06/2020 15:29, Roger Pau Monne wrote:
> > There's no need to setup a timer for GSIs that are edge triggered,
> > since those don't require any EIO or unmask, and hence couldn't =
block
> > other interrupts.
> >
> > Note this is only used by PVH dom0, that can setup the passthrough =
of
> > edge triggered interrupts from the vIO-APIC. One example of such =
kind
> > of interrupt that can be used by a PVH dom0 would be the RTC timer.
> >
> > While there introduce an out label to do the unlock and reduce code
> > duplication.
> >
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Paul Durrant <paul@xen.org>


