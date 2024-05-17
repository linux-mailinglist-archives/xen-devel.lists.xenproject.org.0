Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A748C82A7
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 10:43:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723924.1129076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7tAr-0005ul-8c; Fri, 17 May 2024 08:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723924.1129076; Fri, 17 May 2024 08:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7tAr-0005sg-5b; Fri, 17 May 2024 08:42:45 +0000
Received: by outflank-mailman (input) for mailman id 723924;
 Fri, 17 May 2024 08:42:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7tAq-0005sa-8y
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 08:42:44 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d547940-1429-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 10:42:43 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e538a264f7so4655951fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 01:42:43 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce30e1sm26430461fa.38.2024.05.17.01.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 01:42:41 -0700 (PDT)
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
X-Inumbo-ID: 6d547940-1429-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715935363; x=1716540163; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k/og926+VA8QfuRf/6fE44ANqz0xu3nonJ6pZThkEz4=;
        b=MV22jNf0F0AxCC4hjnXAFbH73lOH25Vq7ZY+s/evSOt8ENInsYwqD6W7mGyRkAF1Tj
         2uFGRllTZBsguhyV6VZwOKEDi7YJbNmy+ZPcOnCZoWi3RZUuQisa1vMnzyouNJNV/9ys
         OFI1ujIAe4f6PaexY4j4xz7F5lKjo5W+Fcas3h4vbpCFm2iuUqAf28p7YPGDRs1aXg1M
         LE8g0e8jsVHVPud8Bgsb6pHdnXN6YE/jIgizKinemE37YoQ5x1+EEfUQoRV2RcNzXIMU
         vtYvEL9Y3aP2SITTOfuEOEb8rcaOma+yApYVNHU2iP2GUTNCJhwHR6qd0lmC8rHkgES9
         hAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715935363; x=1716540163;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/og926+VA8QfuRf/6fE44ANqz0xu3nonJ6pZThkEz4=;
        b=co+vQIXpEpJaTl1klqza2wv7ODzNbEM69aVWQbDg/eQUkqOgoZqnQpl6zdHJ34SHVM
         oHw4RV++njfroqlzdJFgiJfRjLoG1LbgZzEm6hzNk/RgjhOMfwJcHYZW2wRaRwJLB+jv
         uDKybF9HuKqNMRQ3UtseY36QHRxPJOCXsnvQw+fo0Mb2VsULCHzDpc6YDm3zjSaiHTtK
         sPKYS1RZxwz79J/gP0mSbyvekGTX6tlwB2/VP1TwY8MR98vUB1WGtfgWa4nj3+NnsoPe
         z+SrFnRT/SirkqOKtQ7OfTOK7mlKOiIfVhsaLycYWa8Xb/2bQUIO+fJFTSkjiFg03K9K
         EKkw==
X-Forwarded-Encrypted: i=1; AJvYcCUtAZxs4HDbEaudhZaGWsLzbEoj3+vnsHIPH/+wWFmYieB6xYOjy7Nmu8iCJEvp0q/Q5zfeHSUFuEnRyhBVL47I0G2DgsNobTPUeogaXWM=
X-Gm-Message-State: AOJu0YzKzp2Hfoh8LSKiC/6aW0KmNzZ4A+5q25o0PWxLGziCeZUQougy
	oWaqCK+0ATYauLxllX1o/L17keJHYbVyO/qYmY+xkIZuJHLawYP5
X-Google-Smtp-Source: AGHT+IFeGpw6tKWnJnQiJQG1rbX1/2C3Z/yzv1oPX8qOjvz1sGGdSz7yaYUhUyu9ge7ws/jpoAaq0w==
X-Received: by 2002:a2e:8907:0:b0:2e6:f1d3:9e7a with SMTP id 38308e7fff4ca-2e6f253dbc2mr58854271fa.19.1715935362421;
        Fri, 17 May 2024 01:42:42 -0700 (PDT)
Message-ID: <e13316f78234e92ac0b3a1a0d6fb9ba8c6c9bc0f.camel@gmail.com>
Subject: Re: [PATCH v9 02/15] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,  Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Date: Fri, 17 May 2024 10:42:41 +0200
In-Reply-To: <5a121770-9bf3-40c6-ae91-8dc70174dad5@suse.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
	 <616e8be09f217a766b96c4f9060f6658636a4338.1714988096.git.oleksii.kurochko@gmail.com>
	 <2ac0ca46-6957-4d31-95cb-3016de7b11b8@suse.com>
	 <76a84e9e239e1338fc6f86d243b74fa239d8091d.camel@gmail.com>
	 <5174d73f-677d-4c5c-9d4c-e651a29e4366@suse.com>
	 <588867d6e054264551e0e27b534955fce9b6d6d5.camel@gmail.com>
	 <77c6e497-631d-4f92-bd38-8ab7dba4841d@suse.com>
	 <c8bd47e8f8558d88b4d5a4a09ea10728006fd4d3.camel@gmail.com>
	 <5a121770-9bf3-40c6-ae91-8dc70174dad5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-16 at 12:49 +0200, Jan Beulich wrote:
> > Anyway, I am not sure I understand which approach I should use in
> > this
> > patch. You mentioned that possibly test_and_() can't have a generic
> > form, meaning it won't be a set of arch_test_and_() functions.
> >=20
> > So, can I rename arch__test_() and generic__test_() to arch_test_()
> > and
> > generic_test_(), respectively, and use the renamed functions in
> > _test_and*() in xen/bitops.h? Is my understanding correct?
>=20
> You could. You could also stick to what you have now - as said, I can
> accept that with the worked out explanation. Or you could switch to
> using arch__test_bit() and generic__test_bit(), thus having the
> double
> inner underscores identify "internal to the implementation"
> functions.
> My preference would be in backwards order of what I have just
> enumerated
> as possible options. I wonder whether really no-one else has any
> opinion
> here ...

I see that __test_bit() doesn't exist now and perhaps won't exist at
all, but in this patch we are providing the generic for test_bit(), not
__test_bit(). Thereby according to provided by me naming for test_bit()
should be defined using {generic, arch}_test_bit().

~ Oleksii



