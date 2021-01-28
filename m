Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9319307BE0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 18:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77287.139892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5ArF-0001Mp-6Y; Thu, 28 Jan 2021 17:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77287.139892; Thu, 28 Jan 2021 17:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5ArF-0001MQ-31; Thu, 28 Jan 2021 17:13:25 +0000
Received: by outflank-mailman (input) for mailman id 77287;
 Thu, 28 Jan 2021 17:13:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgTx=G7=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l5ArC-0001MK-Mh
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 17:13:22 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c1569a8-a2fd-4ce5-ba11-b5781c416f8b;
 Thu, 28 Jan 2021 17:13:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c12so6176623wrc.7
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 09:13:21 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id x81sm7022901wmg.40.2021.01.28.09.13.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 09:13:20 -0800 (PST)
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
X-Inumbo-ID: 1c1569a8-a2fd-4ce5-ba11-b5781c416f8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=9488a2P3fJlNgPE67Bm5Bf5hZKojmQ6UAk6SR91FpXg=;
        b=l20VkycDneWvyXDNlwjvtzZTICcXsA7gaZzdUmnO6Ine2fK997yUQr4adxnfyIbkuf
         TBwwDLDOcy1aPvjoYNqSeiUxomN76Vk6BBpou8gLg6hhcnqJUVIy839/81lY+qFsArL3
         JUSPH7raNKSan6/KzfZ9RHjR9S0Kr7E9ZqCcLbKT4xtx1Ew04IPiAzmh4q/0WlEWIm5I
         m5zHPc6b7YPeNdvKVJ5x1GQO/HUNXVYzs7FCAtBKXxE81FC5E9hU8TaEUkx6hrJk1lTR
         TZktU25LMcqyPkG+T5TXGV/AgKODHspFz4Kvefnaf7naQLUdulRvfiivcaIWryuzIk2r
         U9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=9488a2P3fJlNgPE67Bm5Bf5hZKojmQ6UAk6SR91FpXg=;
        b=mTzyPn1qa13c+1avPEXLooLxgqCsFFa2lwgAKHsNcGXqBeleTZXt7k1uwew1aSCyVW
         ja1FyqHx+B3mcmQtzxrlF6To728x9iMTbruJZ7hP14ZFbE1K1+Q9qmCSHQzk9CRiOZZ+
         4DFJcDjmX5pNII+YDqbXidtlY8btxjXj89ilqLs6r+iLo4clVOFBWqTwa6bqQiyUEL+M
         VDnKQixM6xY8r/lS1bje5lCYGtgERLly++0oNkHcXq8I4s2vIhr4qKlKweScI80M0DEW
         Vl7h9/b215czKYH+Trgnn3DxaZHG+rnP9k3m/GWS7SefVhwKbs+/YtJi0NQRk9jLz25L
         sLPQ==
X-Gm-Message-State: AOAM5329Zdds/28K9EEJiCipUkxn1iC3FU0tNy1ZArCpqFK6ewyuL/Tq
	vVOsE8LpmtwNLk+wJ2werVo=
X-Google-Smtp-Source: ABdhPJzR2CHSnBbdTSiHdnD0qat4VVIQL/P+8rSIOh2bDxWEqQbOZcC8QbNPzgXHGXMI1N60izv3Vg==
X-Received: by 2002:adf:e50e:: with SMTP id j14mr102488wrm.162.1611854001023;
        Thu, 28 Jan 2021 09:13:21 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Xen-devel'" <xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <JBeulich@suse.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	"'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>
References: <20210128160616.17608-1-andrew.cooper3@citrix.com>
In-Reply-To: <20210128160616.17608-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH] xen/memory: Reject out-of-range resource 'frame' values
Date: Thu, 28 Jan 2021 17:13:17 -0000
Message-ID: <02b601d6f598$e01d9ec0$a058dc40$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI3XV/tj1LXdZgysUfBsteFhT3rcKl8dfqA
Content-Language: en-gb

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 28 January 2021 16:06
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich =
<JBeulich@suse.com>; Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Julien
> Grall <julien@xen.org>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>; Paul Durrant <paul@xen.org>;
> Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Subject: [PATCH] xen/memory: Reject out-of-range resource 'frame' =
values
>=20
> The ABI is unfortunate, and frame being 64 bits leads to all kinds of =
problems
> performing correct overflow checks.
>=20
> Furthermore, the mixed use of unsigned int and unsigned long in the =
call tree
> is buggy on arm32 where the two are the same size, and certain =
out-of-range
> combinations will truncated and be permitted.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Paul Durrant <paul@xen.org>
> CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Posted ahead of my full v8 series, in the hope that it catches some =
people
> before the end of the day.

Reviewed-by: Paul Durrant <paul@xen.org>


