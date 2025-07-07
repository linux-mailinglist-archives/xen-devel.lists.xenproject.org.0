Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4DCAFB292
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 13:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035531.1407843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYkM9-0008Ic-5g; Mon, 07 Jul 2025 11:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035531.1407843; Mon, 07 Jul 2025 11:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYkM9-0008GX-34; Mon, 07 Jul 2025 11:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1035531;
 Mon, 07 Jul 2025 11:49:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RIg0=ZU=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uYkM8-0008GR-KS
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 11:49:56 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d75c266-5b28-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 13:49:51 +0200 (CEST)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2eaeb27fa45so655231fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 04:49:51 -0700 (PDT)
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
X-Inumbo-ID: 7d75c266-5b28-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751888990; x=1752493790; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDsn/0qYCKBSX7QM0rQyH0xo/IRZcir5Mbp4ZnXOdxo=;
        b=a2ZCQQSIxtA/le3yIjMXZOaHtlW7KBzSB10G10BIrHJy08aI+upPtt8KZRWHrgDpTu
         /RPBpwKGKEbrmlgFZdAGuVusr6L7apNfIBD6Xfz0Kw055Ppi8JTrWix6UFwMZM2FSVNv
         TolbyYxzJTLhZKjo//9Xnw2OBnQUFy/AUSaOflF0R+bmZSGlAakwrmSyRxdaMCZp1cen
         XRheMvd3ln4avcwWn9YZ9lodwz4IpAuSOoebaQsXHs03DOVIEANVorT/TGgxxKy+desD
         3iv+pw5oxIdmDRRA7b7f9azKRwT3vg8E0SwKshTL2hqLbJN2pNJNlqZhAZmk+CeBL8tW
         Zl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888990; x=1752493790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDsn/0qYCKBSX7QM0rQyH0xo/IRZcir5Mbp4ZnXOdxo=;
        b=hBVvTSzZphZpv0IPiaFWz20AEqvXIQMM1O9B5ujS6yf/KtWW4uZC4neJMl4gjRQBKr
         7sByUBPgLyrBVgUtLdCpbxmyb0S4G0/be7Y1lLbk0Bq41Pfx3wr3EA9PqAdWIJXW7CIe
         Kcguj6HCu+zw69jBC+9lhNL/8Pbltcj4/qHN07ZgM9ei4ujMwh1FiMlDVt3peMDO2pFv
         hxEeBapr97qCie32HiZeHHnN24dcnO+hBU2ht3OeX6uu7V0XQsVBTmUU7HNgFmsDFc7h
         jA11SAQGUVEheY64c7vUhJcAWfyjDX6ozqzNcdd9n1bMRXmSPCCi7nebMefrSH6T1hsG
         pxmg==
X-Forwarded-Encrypted: i=1; AJvYcCXtXH6NkDvjc5V2Bw8PSbbDZMvnLjn3JTuthyZaoctRBWtc5D9juMV5varZ/WtWGtl3pP6BsKFuU4U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuwUqeKH/P/Efnse2m6BsxWpl8Y8ZGZk9IlrYY5sLn9saHJD6I
	baqVNe/MpEZpfVTfM5QQ2yeYwL6Gm3Wz/1h5pkbp9oK/mQWVzPXyD33dfB+FtSn5PdOIaNN5vt2
	++K/wE1h9qNxYt8WjjiIvSoBZFGsO444=
X-Gm-Gg: ASbGncux/HAwTm+EqPI4BqJ2d/LkUpWC0B/QLq1DduCFLMDFiGC1NmMacDl/kT/QWbe
	ogJxh1xAWfr8BL6kzaNacsmf+q5pMW5KIoAFpwI1l7oh4Ij13a1vzZnpY6BoGbzKQZrTFj/ke4l
	rR4Wgu04tFyIexM///j1BGk9vJwWheogkyr5pJEMWurlunV5xajUSx
X-Google-Smtp-Source: AGHT+IFc5xDNZbRQuHbFI1VQOKHQ3NcBHus60jXwkLsK/JrIYgtkqboWjl0AElpZwDubXgtNX3NpXlGE9DB8FB7hpv8=
X-Received: by 2002:a05:6808:1703:b0:406:682b:881b with SMTP id
 5614622812f47-40d05b70cddmr2694744b6e.8.1751888990402; Mon, 07 Jul 2025
 04:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751412735.git.w1benny@gmail.com> <99e281ad05537d2384eaffe95155a03382493c96.1751412735.git.w1benny@gmail.com>
 <8143b492-6e3a-48bb-b564-52b2623a78f7@suse.com> <CAKBKdXhOdMqPFO5GZpm5p=6PQf8G3Ho0+UG5rZjku6QESCeJtA@mail.gmail.com>
 <9299a995-21ad-4b9c-8c82-8662f70b447f@suse.com>
In-Reply-To: <9299a995-21ad-4b9c-8c82-8662f70b447f@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Mon, 7 Jul 2025 13:49:38 +0200
X-Gm-Features: Ac12FXxKu_TNn8l7foZkFkHq7MTfoT7OfsLnH1THMPrZgJTTJcCOuy3TCGP03uI
Message-ID: <CAKBKdXja6UB+1pO7EhywM0xC7Bi1KXehH8MC7qaTF7KF6duhRg@mail.gmail.com>
Subject: Re: [PATCH 3/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Anton Belousov <blsvntn@outlook.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 8:56=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> Well, in the common case the original author would never change, and it w=
ould
> be their S-o-b that remains first forever. Anything else would need expla=
ining.

So, I should swap the two S-o-b lines, gotcha.

P.

