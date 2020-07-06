Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CDE215B4C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 17:56:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsTTg-0007Qm-6X; Mon, 06 Jul 2020 15:56:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUWB=AR=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jsTTe-0007Qg-GV
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 15:56:18 +0000
X-Inumbo-ID: 3a1885b2-bfa1-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x62d.google.com (unknown [2a00:1450:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a1885b2-bfa1-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 15:56:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dp18so43102273ejc.8
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=lzmS/DYvRKOTwpNhxXahP1nSGfDSZFhfmUICA799hbk=;
 b=ePVJw4MA6crsb+kswF7B18G8D53C8daZXDfoVML6DDPN+BoAu8k28NRIo17Mc5hZcK
 p6fLtI/8ySfigwIkYjoWxmZwp5LBddnF4HWQHYl67RX5K8qg2jEybQmQXt+2trgN16hj
 ZYNq/xeB9BJ24UD43fTMYdZplvlmiGI/AMEoFf6EYEhfvvorXMCIx6gj9C05xwnppWv2
 Q1ViYS6tRJLxpYYeS9Q7Hjrd21AJsAn4N+jpjaqWGDmIioC/srnFrpIQ4F7UtloOQMdP
 IvPcHwPwVueKxr7JA3inxy0oX0PNqLoV9n7+f+/uPZ0YC5OEtMcaw0TnrTdyCV7geNKo
 xT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=lzmS/DYvRKOTwpNhxXahP1nSGfDSZFhfmUICA799hbk=;
 b=HGqcsNaVTIi3e+WUi/GWl4Xv88fYX7Sle6vIUsWgWuNU8xY0fh0+0jL8VFJMR9qhQh
 7ty8mfH0nYKZ8YvrumHUZmF4Zzt437f9K0D6r15Q225tmUzYrV6IBzD/bqfOp+3eVTMt
 yKERTu0VIRMWfBoWaC7NyMsx5PeO4u+68s2kCmdTw0or8RLMMPdf6zP5+Iv5YUT+ZqEQ
 UfH6DCMqOnacV+BFQYd/Wt4kBAbdSKjHNR3PLHv8dOgBU2xXhog1OPWZRhJRaNnhamRf
 xNbPDqj592OiG4nxqO2Gor6o46s1cxxWgMlfY8YBoiww3tQlydhlPw8DCzVIGgBn/cPJ
 SarA==
X-Gm-Message-State: AOAM531dOHUybFU3zsnlX8wNp4+hvpv5dHOclBlFXPNFtv2sg49dVEQh
 iOLKT7Ndug9p+wkynSO3BRk=
X-Google-Smtp-Source: ABdhPJyjxaDCh8Thngtc2Y2F/2vQlOMQYsyUey8lzuXQA+2ioovRZcbTBSk0A+RVOpNLSETLsPgHWw==
X-Received: by 2002:a17:906:fa9b:: with SMTP id
 lt27mr41667890ejb.365.1594050976936; 
 Mon, 06 Jul 2020 08:56:16 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id n9sm20940928edr.46.2020.07.06.08.56.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2020 08:56:16 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Jan Beulich'" <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
References: <29986a8f-47bf-43c2-98e9-e08c1c5925af@suse.com>
 <b35fc5f2-4f12-38f2-088c-cee019e8cbad@citrix.com>
In-Reply-To: <b35fc5f2-4f12-38f2-088c-cee019e8cbad@citrix.com>
Subject: RE: [PATCH] x86emul: fix FXRSTOR test for most AMD CPUs
Date: Mon, 6 Jul 2020 16:56:15 +0100
Message-ID: <008101d653ad$fb3dd770$f1b98650$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKG6H/6mYVSMkUlsOmjEEFKANg48gJqZY+gp4Y3qDA=
Content-Language: en-gb
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
Cc: 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 06 July 2020 16:47
> To: Jan Beulich <jbeulich@suse.com>; xen-devel@lists.xenproject.org
> Cc: Wei Liu <wl@xen.org>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>; =
Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH] x86emul: fix FXRSTOR test for most AMD CPUs
>=20
> On 06/07/2020 16:14, Jan Beulich wrote:
> > AMD CPUs that we classify as X86_BUG_FPU_PTRS don't touch the =
selector/
> > offset portion of the save image during FXSAVE unless an unmasked
> > exception is pending. Hence the selector zapping done between the
> > initial FXSAVE and the emulated FXRSTOR needs to be mirrored onto =
the
> > second FXSAVE, output of which gets fed into memcmp() to compare =
with
> > the input image.
> >
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Paul Durrant <paul@xen.org>


