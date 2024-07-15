Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25B09315B5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 15:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758880.1168400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLkB-0008Tt-Bf; Mon, 15 Jul 2024 13:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758880.1168400; Mon, 15 Jul 2024 13:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLkB-0008Qd-88; Mon, 15 Jul 2024 13:27:55 +0000
Received: by outflank-mailman (input) for mailman id 758880;
 Mon, 15 Jul 2024 13:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/7M=OP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sTLk9-0008QG-HN
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 13:27:53 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07c1553a-42ae-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 15:27:51 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a77cbb5e987so513599866b.3; 
 Mon, 15 Jul 2024 06:27:49 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5b7f16sm211571866b.64.2024.07.15.06.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 06:27:48 -0700 (PDT)
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
X-Inumbo-ID: 07c1553a-42ae-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721050068; x=1721654868; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4xl7fTSuRDzF/uDlVK7TVXULDCM6JRV9CWT9g08FG3E=;
        b=NExaTWcw/Mos0uA43MzxCLz6CFKW86lES4FKD/rCgVO3f4Z/GOZe3omIdZlazgxYUr
         gOytrkwP0eIIkV1PiI5z3l9e3s37vmDuifXm6+K2jAZi54WEPDZXtmFKAI24iYzlmZ0t
         OuWlbDq16pBkqkqmJD/MZZ1xOsjW4MKSh82ubxFydcRnA0GdSBxOxQz5NdwQ75Yd5uWI
         beG93Lf+8npy+KkMd6PmoYyU8B4cCdZe6TUfiFxmCUq70ynsSZyBE7tKLho9VeJOrKKv
         QuoSps2G9mP20W8Zw6NFJJYE8YzH+kYQdkm5kt2uGMOByOR9lDksD9KTxBvnwSo8IJih
         7k0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721050068; x=1721654868;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xl7fTSuRDzF/uDlVK7TVXULDCM6JRV9CWT9g08FG3E=;
        b=jt+UZhNphQ9QS/Cl6lG0dr+LEn5pXtiLtkGTbqqJzqOreO7U04cW/wREA/mc4MlwMg
         ygJ7AAQTjs7HUoZsa+mkyOfm3Xm4Z43Deb5ums7UGTEVlRdWjTwSi3+bytBFGj94Z/gF
         gv6DOM1a2U7hbGb17Ky1uTE1iU04KocZpr12spMAz2PqeebjD5pdCIRJ3h16rFSebJ7+
         2qOXG9UwceBVwy6YUU3H3D14aRRdM44dBVwr4rCTAGwJcARfeewSoIW0feU9oitJQyMK
         /RlrTwbIzAPTCcY96Qh/spdsYs/QGdrRl7lAkuFzhHKu4H6BTwKNNMEd5HHGZA+judth
         Qduw==
X-Forwarded-Encrypted: i=1; AJvYcCXTmYkkcGgrk2vgOPIgPkmTBWHQMtnb39VTIvNwG2YWv6NE+ZbzhNKh7d+ig7Ic98WbGTLbXx76XwYftgn2ACaT7+55jZOwkPR/VimS2xzmZLc=
X-Gm-Message-State: AOJu0Yx1kRhb79CCgklM3iB6y+mM+6w4uhgo0HH7g5pde/qpe+Up+Y61
	kwAnrHnxsl/WjS+Y7HYLOQiWxJjnmgGt6hex+veIgLeCnGaJgP2F+7K/EYmY
X-Google-Smtp-Source: AGHT+IHJh0dAt2n1pljl0eEYFrPb4iQkzUv6WFW/6JB3K0DnUx/uH/YtQx6n2Oltk/PmqXlARZ4TXw==
X-Received: by 2002:a17:907:ea1:b0:a75:110d:fa53 with SMTP id a640c23a62f3a-a780b885565mr1577564766b.49.1721050068254;
        Mon, 15 Jul 2024 06:27:48 -0700 (PDT)
Message-ID: <2ef594109a64433394b2dac845b8c2ea7f23d2b2.camel@gmail.com>
Subject: 
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org
Date: Mon, 15 Jul 2024 15:27:47 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi all,

Xen 4.19-rc3 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.19.0-rc3

For your convenience there is also a tarball and the signature at:
https://downloads.xenproject.org/release/xen/4.19.0-rc3/xen-4.19.0-rc3.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.19.0-rc3/xen-4.19.0-rc3.tar.=
gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>.
When sending bug reports, please CC relevant maintainers and me
(oleskii.kurochko@gmail.com<mailto:oleskii.kurochko@gmail.com).

Best regards,
 Oleksii

