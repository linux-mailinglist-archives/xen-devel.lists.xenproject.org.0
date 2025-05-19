Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D53AABC8BF
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 22:56:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990301.1374264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH7WE-0000eK-5o; Mon, 19 May 2025 20:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990301.1374264; Mon, 19 May 2025 20:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH7WE-0000bi-2q; Mon, 19 May 2025 20:55:30 +0000
Received: by outflank-mailman (input) for mailman id 990301;
 Mon, 19 May 2025 20:55:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BiGJ=YD=gmail.com=persaur@srs-se1.protection.inumbo.net>)
 id 1uH7WC-0000bW-My
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 20:55:28 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96c4ba0d-34f3-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 22:55:26 +0200 (CEST)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-6f8d663fa22so22097626d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 13:55:26 -0700 (PDT)
Received: from smtpclient.apple (216-131-77-234.ord.as62651.net.
 [216.131.77.234]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b08ac386sm61946206d6.39.2025.05.19.13.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 13:55:24 -0700 (PDT)
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
X-Inumbo-ID: 96c4ba0d-34f3-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747688125; x=1748292925; darn=lists.xenproject.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8Dsf5NQkRj5qoRJxyN4VTtmUFp809jK0+xUddzDTBQ=;
        b=k+YVSB+9FdjaLT2FMuLVyy072mtpsHi0g1fvjGAmZjnMCOOMuESGaMLNGamu+Z0Nvg
         0pnVDmUehNVB0Qnaem8badfEkj61SUXjNvhMKB3p2tMK5vTCx9nDzuEiT3qrti9tiH5l
         2MzqieZc/8opGIIjmh8ueBRmYCNo73trhTD7GsnRu1WF/ChLPhh17ORZQgfk3wAn0am9
         g/ap3najLLdXjGW02yzyuCItJu3jrSN3iiyI3QafVoe93l0C+rOCE+EC8hGw8PExgmvm
         NpWyfeORpa6rfjtP5bD77x+v7TTac3qxqr25Bqb20XC0ph8t2PVPAvDt2hW1fbCF61hU
         XPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747688125; x=1748292925;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8Dsf5NQkRj5qoRJxyN4VTtmUFp809jK0+xUddzDTBQ=;
        b=QChy0P9rARs4elBZq3qb1Smn4Ss1TYxHIUavMfMa/jO9ZMuPj5HrDDlpZETX67j7CW
         uYQaTbCHXsrYEvGVtN8w+JuduTsvcLMJeWntqOA9En/IVZVuJAUrKA+V6iMHNSJPy8g+
         hT4Nz8hgFpc2QV6k9nYTYA9YlbxFL0+vdXpFfyZ0GpzWJY01HDtK2aExFpI34Mjh8XH7
         PEgmG2JeaYM3cNc78D3s04WcgdPV/OyQRBXeMCG6Zl+feb0XSyEvA2mTurVy16WKWQz8
         wDtOVRti66ZN6wa207DulYBBK1N831AGf0B4b7W2YgNGxC3iGBTM560iFtEvxAnWRtze
         ShgA==
X-Forwarded-Encrypted: i=1; AJvYcCXqSEmm3ueyMQPMKRlxLCtjTmEKXpPiSILRsuuguDx8QtH7mYtD8qUsXcpb+sWhMfssjNMxguLJLoo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxD4udH7wQNhH0F9M6+TlVFRPoxesFpWUAr6ZVomm+ZZs+zsSYE
	5X+vz3BYXiXb6CU7bfChxbrofPGpev73nlb6xauP2cGtoRHX2mORurcB
X-Gm-Gg: ASbGncsfONEjj5WGZnui2BdrQXDSiU61DxnV23P2l80XC1jEA2DsxB9uTS53ngop4DG
	uXOZWwzkjm6ljVg767giYbXiWq2y4EpejYIPoCbVqruoD5INlc9VCKkJ6Oa+71FUNN0lR8LnKXC
	cH2QBO7sAwwL0nmzLL4ZyntsfTYNExwU4Kg/ZKnLqerg51BaZNct4S2xbBdnjV6Nw9gPwY2irNI
	r1sz9Q7iIUHHuaNHv3RVKunU1MIlBGbG8ktRrMzCVhBRKZmlwZwDNvVX20Y4SojzdIlF0uXJ1l9
	Z6clZ6qWRGffPUhpA+PzJPqegpUzTq5yLUdQcsY3Zy8dTEpY5H94YkZzPZUzoB+7dEYSxPa0buJ
	mkPrb+La28gsPsE256Zz9J325HrI=
X-Google-Smtp-Source: AGHT+IEWRVaJ99D0vmulsyhWMmEkYePOE8RGbpAE0UQ6wGaA+WJKfE3lrWgEqECq4tiaDQVDH3GtRw==
X-Received: by 2002:a05:6214:1c8c:b0:6ed:1681:4846 with SMTP id 6a1803df08f44-6f8b2c95b84mr204349076d6.24.1747688125284;
        Mon, 19 May 2025 13:55:25 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and accessors for TXT registers and heap
Date: Mon, 19 May 2025 16:55:13 -0400
Message-Id: <AA106976-0221-460C-97E4-BD2C70777127@gmail.com>
References: <aCs1iQp6AH0pNaKH@MjU3Nj>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 =?utf-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 trenchboot-devel@googlegroups.com
In-Reply-To: <aCs1iQp6AH0pNaKH@MjU3Nj>
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
X-Mailer: iPad Mail (22F76)

On May 19, 2025, at 9:43=E2=80=AFAM, Sergii Dmytruk <sergii.dmytruk@3mdeb.co=
m> wrote:
>=20
> =EF=BB=BFOn Sun, May 18, 2025 at 07:31:49PM -0400, Rich Persaud wrote:
>> If there's no stable URL for the TXT spec, can we mirror the relevant
>> doc(s) somewhere in the Xen docs tree? A trusted archive of the spec
>> for trusted execution.
>>=20
>> Rich
>=20
> By "unversioned link to Software Development Guide" I meant
> https://www.intel.com/content/www/us/en/content-details/315168/
> which always provides the latest version.

By "trusted archive of the spec" I meant a server under control of Intel or t=
he Xen community, hosting the specific version(s) of the spec that have been=
 implemented in the Xen tree. =20

Unless Intel reference PDFs are digitally signed by an Intel certificate, we=
 should not be linking to non-Intel mirrors of Intel PDFs, which could be ta=
rgeted by attackers to relay malware onto the workstations of developers of t=
rusted execution software. If Intel reference PDFs are signed, we should inc=
lude instructions for verifying their authenticity, if we are linking to non=
-Intel sources.

Rich=

