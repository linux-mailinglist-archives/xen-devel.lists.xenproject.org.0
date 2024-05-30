Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F070D8D5053
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 18:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732860.1138895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCj5T-0007rj-17; Thu, 30 May 2024 16:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732860.1138895; Thu, 30 May 2024 16:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCj5S-0007pE-Uc; Thu, 30 May 2024 16:57:10 +0000
Received: by outflank-mailman (input) for mailman id 732860;
 Thu, 30 May 2024 16:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA40=NB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCj5R-0007if-G7
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 16:57:09 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6dd481c-1ea5-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 18:57:09 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52ad8230bb9so1251578e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 09:57:09 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d89490sm13652e87.247.2024.05.30.09.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 09:57:08 -0700 (PDT)
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
X-Inumbo-ID: a6dd481c-1ea5-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717088228; x=1717693028; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OE0fnyDYoxBJGk4RvrZhMNcCSm1o0tvSnGpWEbaKIPE=;
        b=PZn8J9uG80yvpfCiw5iAs/7WkmclJS/Yx3z5OH2kZypePP+z9eHUunKEsDd2YrTAfB
         cJjYak4EjdV4bHl4MKhDNyD+3ZOvPWFau/4uiU57sW8BQffxeCA9lRTmUbB9R8b7P+AX
         u3SZ/UrUbMnAoHEg7JG0RddZ3gSkE/wZg544HSMaOKsrd9KsQvVuoLLkEJVjg0B68eGN
         5Iw77+csJjzOpKnmlpFNsn1rMejhUrVH8XwEthFnT5ip4VeliwYxtJKyCOXos6im4Ne/
         Imq9k8HYJ+Q1TCXcK9ObqI7FF8uqrk89cJ3Zxwy7mkDHNOjGrzgzDCWdtJrR2PEZEUig
         /F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717088228; x=1717693028;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OE0fnyDYoxBJGk4RvrZhMNcCSm1o0tvSnGpWEbaKIPE=;
        b=DMLDGfdBrfHkN7VgK19HeVCPXdVHCd7N3qL6ZiakYssOqNWuC/8EKWsbIZrAFUe7NP
         SCbajOc9k6vGRe958R+EC1UW5N/PayTCiAB3pMYNYLwITmJ4F0BCkWJ0dRq8SqfcGKCc
         kUJd3LwgSFTCN8w5kX0ae3em/+QR0ZctwfWzf1WlKDEo0QCqduoQ7GPQWYEB2FzMGRDh
         2VA7ddFXQlXFRgmu5Bqn8sh9Fs5d+fWujJzLBSfvT7oJDQ0wgJX1CaW4FZa48mIEhGmB
         hfOfFlQcB0FzS1fqVYZ5uTVuSN8QF5Wdgql0OD531hrJbBKu8g2724BvTntTvG9/ZKMz
         7x9A==
X-Gm-Message-State: AOJu0YzufBW8rIM9FOYprARM7QTPwW2+VgugLu/ArgaLd80z6BuLidTp
	37WGlaReGZff7IvNDndVNSxVfN/zQDOKEURSfLxxCR4l0Tn5h0Qs
X-Google-Smtp-Source: AGHT+IHIxvth94CNUYqycPZFdRPatiagN4A/J8O3o9wp0JPvvwFXwvwmtwwwCVkqQ/d8JtUEVSzUDw==
X-Received: by 2002:a05:6512:32b5:b0:51e:150e:2c45 with SMTP id 2adb3069b0e04-52b7d489296mr1750482e87.63.1717088228276;
        Thu, 30 May 2024 09:57:08 -0700 (PDT)
Message-ID: <2d8785a6f44e3877ee198683f55022eed2599224.camel@gmail.com>
Subject: Re: [PATCH] x86/hvm: allow XENMEM_machine_memory_map
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Andrew Cooper
	 <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Date: Thu, 30 May 2024 18:57:07 +0200
In-Reply-To: <Zlg1XiUFR0sF3KCg@macbook>
References: <20240530075318.67491-1-roger.pau@citrix.com>
	 <0768b842-719e-4736-a941-dfa4d50c173d@citrix.com>
	 <Zlg1XiUFR0sF3KCg@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 10:14 +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, May 30, 2024 at 09:04:08AM +0100, Andrew Cooper wrote:
> > On 30/05/2024 8:53 am, Roger Pau Monne wrote:
> > > For HVM based control domains XENMEM_machine_memory_map must be
> > > available so
> > > that the `e820_host` xl.cfg option can be used.
> > >=20
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >=20
> > Seems safe enough to allow.
> >=20
> > Does this want a reported-by, or some further discussion about how
> > it
> > was found?
>=20
> I've found it while attempting to repro an issue with e820_host
> reported by Marek, but the issue he reported is not related to this.
> It's just that I have most of my test systems set as PVH dom0.
>=20
> > Also, as it's mostly PVH Dom0 bugfixing, shouldn't we want it in
> > 4.19?
>=20
> Yeah, forgot to add the for-4.19 line and Oleksii, adding him now for
> consideration for 4.19.
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

