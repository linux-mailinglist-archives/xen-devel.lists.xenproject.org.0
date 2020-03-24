Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFFF191AA3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 21:12:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGppy-0004nw-Ez; Tue, 24 Mar 2020 20:07:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pOze=5J=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1jGppx-0004nr-3a
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 20:07:45 +0000
X-Inumbo-ID: 1f801806-6e0b-11ea-92cf-bc764e2007e4
Received: from mail-il1-x131.google.com (unknown [2607:f8b0:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f801806-6e0b-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 20:07:44 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id 7so4624235ill.2;
 Tue, 24 Mar 2020 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=simExZtXbpcP/HSbA30iGcCnECoi1TnGzUHUbci0/gs=;
 b=IqCgen1kb2PLh+cetUkf3OffJC+4jqBJrBpAb286YHAJsYU8Js/6HqsMPxsgM1uGus
 RDaIQV3RcmHJMGJtnaMMSUa7LcTLhUYkweT/Puc0LvjvoS+JiYhJNDXsj3M+DxhCVs63
 u+e6c/fQH01cqguwT+07RcLk3Q36LoknpqP9yDvPpgJ1KtmJXt3L9+uUhCYFxQAgA50n
 G4NbL7ZHrzeKtocCcYt+6n8A5AiR6gTiET3bDnb46knQWDHsAGbBPgi218nfCwIZkz3K
 bEjG1MdcaYTHMrChu8x/6wJVEY1Rtq4B0s1cc+n0S4/qKKZiZMCe4a4C3RiQCFX0Yh2P
 sHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=simExZtXbpcP/HSbA30iGcCnECoi1TnGzUHUbci0/gs=;
 b=AYoQ9AUVtyNoIY5UfEbzhOUJRu/1JqKTtfk/B6gfNp40wwEG2n/TNNpSWmN5kElAN7
 iK9o8u/uzdPESUEYVogiRf79tjL/U0nNEHljO051p+RXAZGuIK6YXl8+VzGwGG6Iuybd
 DtQCQb/Sblg2C4tvrrs/5fAlOhSmA/jjS1jhfm8WkbS/COrTuL/5QTEwWqlo8fd337fc
 ++DCpte9fT3B01yNWu+dJRSt6Gv5E9Xooxi+VW1C1HyROTDtmyeTUcHlcrK7ZAFJ7I2q
 VCytKKLXQazkYaolyejJZv2yB4VAp0C5TMwKHDy1bqruoNQhE/Q2xJobWHZ2U61U7nUU
 Wb1g==
X-Gm-Message-State: ANhLgQ3cunWzyAEw4Q/LHB670W9+Ybus/TmgOebhT2aKX9Axg+ExUVJ2
 pyJUP3h5rMXqzLgpqvN1ut/UUr3N
X-Google-Smtp-Source: ADFU+vsV6eWGm5vXP9qXkg6VjGnCwdnDsM1etr+JCrPdRWCg9GE1jdsDH5FR30WZcfrY4xRcsSm7yA==
X-Received: by 2002:a92:5e14:: with SMTP id s20mr110811ilb.210.1585080463525; 
 Tue, 24 Mar 2020 13:07:43 -0700 (PDT)
Received: from [100.64.72.37] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id k9sm5426448iov.12.2020.03.24.13.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 13:07:42 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 24 Mar 2020 16:07:41 -0400
Message-Id: <38EF1238-32C2-462E-B548-EE1C3A8E7460@gmail.com>
References: <E8383000-6BA6-46A2-AD3C-0B6607CB8107@citrix.com>
In-Reply-To: <E8383000-6BA6-46A2-AD3C-0B6607CB8107@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
X-Mailer: iPhone Mail (17D50)
Subject: Re: [Xen-devel] Moving Forward on XenSummit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mar 24, 2020, at 14:03, George Dunlap <george.dunlap@citrix.com> wrote:
>=20
> =EF=BB=BFI wanted to let everyone know that the XenProject is moving forwa=
rd with plans to hold XenSummit this year, one way or another.
>=20
> There are two basic approaches the Advisory Board has been considering:  P=
ostponing the even until later in the year, or holding a virtual event durin=
g the same timeframe.  Additionally, if we hold a virtual event during the s=
ame timeframe, the Board wants to keep the option open of having a smaller, i=
n-person event later in the year, if circumstances permit.

Due to variation in scope/timing of geo and company restrictions on travel, c=
ould some speakers present remotely for the in-person event? =20

Could the Xen Summit CFP be re-opened for those who can present virtually, w=
ho may not have submitted due to travel restrictions?

Rich


