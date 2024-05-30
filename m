Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350CE8D4E5F
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 16:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732782.1138815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCh5M-0004N4-RV; Thu, 30 May 2024 14:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732782.1138815; Thu, 30 May 2024 14:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCh5M-0004LY-On; Thu, 30 May 2024 14:48:56 +0000
Received: by outflank-mailman (input) for mailman id 732782;
 Thu, 30 May 2024 14:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LA40=NB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCh5K-0004LS-KA
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 14:48:54 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc05ecd6-1e93-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 16:48:53 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52ad8230bb9so1092241e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 07:48:53 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b7d42911fsm243645e87.281.2024.05.30.07.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 07:48:52 -0700 (PDT)
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
X-Inumbo-ID: bc05ecd6-1e93-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717080533; x=1717685333; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/aH8GhKdYYOAQ9pcnE2jsIowDMws/vgnHyfVWQgneqM=;
        b=M/JHjPzUK5bfRnBYSWKNu8Xsh8xwl0aliEdml3fztqzFmKTlGgI5EtC7k2TerrgOQh
         gVLp1SezHDF9uWkD2h1LoGxXzet7xa2CxhjBFZ8D7ZZqMBlobVmz/talbAGKYrnJyBsn
         T3EVI2jkVrcG4jIZds0roUZ10X+DfA3wspQrN2/OnZCIUvnccLyElqn0dihw0+RJSl9X
         ajt3SF8nVmWKz8hRGnsqSlLw7L5tZEsBjwQyBaF+FPXflNqCU7fYuPV1cQTjDxtUkIc5
         O2fXpu172Lvj3ChYduf0RFVP0Op9ijV5pVSWGkR4LIjjPZssvyVaNQCUf7i/4IDZsI1P
         On9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717080533; x=1717685333;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/aH8GhKdYYOAQ9pcnE2jsIowDMws/vgnHyfVWQgneqM=;
        b=EsNg2evrjPnbsaKCAgFDRZ+sDZc1VTW42V3wKG022oGeagfdt7ZfH5aqPYObT1b1AR
         fDIhArlcuBVtHCe7iAme7MCyGlzG6rjyt2JB/mfmJzRiA2CYd/rIHakeK+LpmQ4SKDss
         JaLH70ykoeR1F59XXg45Ks/5mAOesP4x9SDs/0q77fugjYZc8dDz/Dt+k2ZP5CnbIJo1
         zxHQSOPcafIGRYalES6NyB5Vy+Cj3TlFBBUIwnahNIna4PDTEPjXk3fhfL8XwXpD+hBd
         S86r1tWL4VS4O5is3TVEkGLPzJt7UM+f3XIMyRPKPtPkpkzcw2N/ZbYRuUTcKK93ND+Z
         ss8A==
X-Forwarded-Encrypted: i=1; AJvYcCVKaZha1oySIXu1As5HR3lyxsvUDirG48n2klOknlPyxPppvCyunfGxXmjQ/6mrVFL4RFEj2/x3v47ar2+m49U3z1C8k6dptOv4wwYWU+o=
X-Gm-Message-State: AOJu0YxPohQ8BbtuY3u1ZYT14ho9GrLhNhhornhOMVfvD/QXBMfyr/2Q
	DI8pHOnuUEk/Srmh4O6sk6DZ595xWVvznoinKNlAeTJ4Xw/gIXRy
X-Google-Smtp-Source: AGHT+IGTwvIJwrmRudii8xHUhVchPDfTGVMguqLBG2sasuFKwsn9a3grBAP9ICOAk+Vg6RP3hZhfbA==
X-Received: by 2002:a05:6512:701:b0:516:d219:3779 with SMTP id 2adb3069b0e04-52b7d48922bmr1449038e87.58.1717080532696;
        Thu, 30 May 2024 07:48:52 -0700 (PDT)
Message-ID: <ce7409498d3e8620e873d854caf3c61828e34d15.camel@gmail.com>
Subject: Re: [PATCH v4 0/2] Clean the policy manipulation path in domain
 creation
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Alejandro Vallejo
	 <alejandro.vallejo@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross
 <jgross@suse.com>,  Jan Beulich <jbeulich@suse.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Thu, 30 May 2024 16:48:51 +0200
In-Reply-To: <19e240ca-6606-482c-9c0b-3c0a6c2c4e89@citrix.com>
References: <cover.1716992707.git.alejandro.vallejo@cloud.com>
	 <19e240ca-6606-482c-9c0b-3c0a6c2c4e89@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-30 at 10:44 +0100, Andrew Cooper wrote:
> On 29/05/2024 3:30 pm, Alejandro Vallejo wrote:
> > Alejandro Vallejo (2):
> > =C2=A0 tools/xg: Streamline cpu policy serialise/deserialise calls
> > =C2=A0 tools/xg: Clean up xend-style overrides for CPU policies
>=20
> Oleksii: Please consider for 4.19.
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
>=20
> This is internal clean-up to CPUID handling which has been trying
> (one
> way or another) to land for more than 3 years now.
>=20
> ~Andrew


