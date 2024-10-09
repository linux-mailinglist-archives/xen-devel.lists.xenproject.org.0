Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827969970BB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814914.1228641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZHf-0000rm-B9; Wed, 09 Oct 2024 16:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814914.1228641; Wed, 09 Oct 2024 16:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZHf-0000qH-7C; Wed, 09 Oct 2024 16:11:31 +0000
Received: by outflank-mailman (input) for mailman id 814914;
 Wed, 09 Oct 2024 16:11:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyzk=RF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1syZHd-0000q3-RN
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 16:11:29 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2426ec23-8659-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 18:11:28 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fad784e304so84405401fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 09:11:28 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c92a6e0379sm519061a12.22.2024.10.09.09.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 09:11:27 -0700 (PDT)
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
X-Inumbo-ID: 2426ec23-8659-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728490288; x=1729095088; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubmokswzw3dA3itKMs9BPh/4j+oQdP2zGQboE16V99E=;
        b=NiHl64t82XpQaUppe+vDoRTzfPcwW+KaIKLwRSPwKdAg+VeOrQ10XhtLGzzB6FHuZk
         k8AsLcOU0AgYMOjnRKPszW1YPbnYLEw8QI5Np+RcGzDeYuYe0qbDzQ1JChkSJsq08E70
         VLvt9Rhgmx0M4/82F4jIEfZcm7vJlRxruZsBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490288; x=1729095088;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ubmokswzw3dA3itKMs9BPh/4j+oQdP2zGQboE16V99E=;
        b=it4G478zmGUrQjtItVpVOPLDjcQWwR0+F9/BUeQnkEYj4e29C25Qt7DQy4LL37I3l0
         Br0MJ4DrtfcGD6Pf1RFYcmQorGqSImtPQuwzjCkuDKBb5EPvaCepRQGEzaNyIHTWLQ2w
         8bW4sPVZqx79JpoX26FY1hHXczRA3LNEVGvTSiTIjUyQD4wDrvY3VC4htgqT0s1dG2/W
         T4bDeWPeafBR//HLyXEmLp9s1V+bmOmfe0V2BqHyqeT6CvLIXCNegS0+xfzp7wgav10Y
         7mP+PRsy/ldySg+URx0GqwjQQvTJmz2QAcZPKVsDTe2iwR54TQVcuwXbLh6zbgFYPh36
         GiQA==
X-Forwarded-Encrypted: i=1; AJvYcCVgFOJ+4UGCy2c7eHc2UVtuMCGjSKtPpJS3gsMJt9JzdXlTXIjb16T8R24qatIobtVemYkU/+g3g24=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuDfOAjJDnO5K0/HTUC5Z8e0LiVyXaXBAyANEWdbca/uanR07t
	kCGfQ0ZYBQYu/ICvVtNs65gUcYJ4PDAAVrmdsM5aSB7UbofQfKlmqiylPfOnApw=
X-Google-Smtp-Source: AGHT+IHTP1dkIwtpBDTdhlgLi7UD3PUlBmOkOYMKtxY3DJ01Zrqcky3ER74VL70AtDyl+EispObAhw==
X-Received: by 2002:a05:651c:507:b0:2fa:d772:1009 with SMTP id 38308e7fff4ca-2fb187ac497mr18522011fa.34.1728490288295;
        Wed, 09 Oct 2024 09:11:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 17:11:26 +0100
Message-Id: <D4REO3LZALWB.1665UG1GOFHEA@cloud.com>
Subject: Re: [PATCH v6 02/11] x86/vlapic: Move lapic migration checks to the
 check hooks
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-3-alejandro.vallejo@cloud.com>
 <40034a00-6f1d-4a39-9f00-2daa671a13d1@suse.com>
In-Reply-To: <40034a00-6f1d-4a39-9f00-2daa671a13d1@suse.com>

On Tue Oct 8, 2024 at 4:41 PM BST, Jan Beulich wrote:
> On 01.10.2024 14:37, Alejandro Vallejo wrote:
> > While doing this, factor out checks common to architectural and hidden
> > state.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > --
> > Last reviewed in the topology series v3. Fell under the cracks.
> >=20
> >   https://lore.kernel.org/xen-devel/ZlhP11Vvk6c1Ix36@macbook/
>
> It's not the 1st patch in the series, and I can't spot anywhere that it i=
s
> made clear that this one can go in ahead of patch 1. I may have overlooke=
d
> something in the long-ish cover letter.
>
> Jan

Patch 1 is independent of almost everything. It merely needs to go in befor=
e
the final patch to avoid turning it into a bugfix. I put it on front under =
the
expectation that it wouldn't be very contentious. In retrospect, this one o=
ught
to have taken its place, indeed.

Cheers,
Alejandro

