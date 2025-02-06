Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B964AA2ABEC
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 15:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882892.1292971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3IH-0008SX-VE; Thu, 06 Feb 2025 14:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882892.1292971; Thu, 06 Feb 2025 14:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3IH-0008Qs-Sb; Thu, 06 Feb 2025 14:55:53 +0000
Received: by outflank-mailman (input) for mailman id 882892;
 Thu, 06 Feb 2025 14:55:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGv8=U5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tg3IG-0008Qm-3i
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 14:55:52 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 748d986b-e49a-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 15:55:50 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5dce27a72e8so2353247a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 06:55:50 -0800 (PST)
Received: from localhost ([46.149.103.11]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f842a5sm110857466b.43.2025.02.06.06.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 06:55:47 -0800 (PST)
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
X-Inumbo-ID: 748d986b-e49a-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738853750; x=1739458550; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZUO4cJmV0c4pu79bevsz/naJLVWKN9sOmC5aI1s9Aw=;
        b=BZsToMuaFy8DkbHe2FTDSSEanzcLZdJLKhVF6rKjIf8M/vIWLu/2atusgQWGg8BHuT
         xZfmy2z3UsZtyDRH22tyljAT2HvXt8AMeHbbD+DhSrnP3gJg2EYzhjNS/d9adxHRR52+
         wAA2LNsC9pWKeteIA1z972gkYDixjjEsv+U/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738853750; x=1739458550;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fZUO4cJmV0c4pu79bevsz/naJLVWKN9sOmC5aI1s9Aw=;
        b=lwr0WGr7bJQEB/HsuUrRatGFNobM808Ne8wiXIvxbtIJYOPMIH5QAndzImzkc7+tq0
         0eWcUES6m1tpx3tlVgp1bYqfqJh4K6Zr1pODingY774yg3O9b+kAQ6DiBKuW2xM7yHqK
         Fij80DWWuayOdHgaH7Ua8ZnPUUrsBHazSDzB/o4W3EaEl74V5901XURAg5flBjUgMpc9
         hr7F6hdXnYOcVLQLOOu+Yf71EqQ8X/50cTAQU+REeKwpHnjLeHyweAMxXTY/fB+Koye6
         /agoM4gFwagG90wgdhB7JZC8zQ/xeP0qmJSz/9neKQhqGHLy1sQ9YglGjqodItKWYdpV
         u+iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUqqn5P9UpNouxrrLmD/D2rY7cu5wZeGPGX0J2biWXcKUUeHEfPo74/6OmcuKw6nGjC4HZYQnHhOY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yya1JFGZgYbDyqYKuq35pt1diApXzzckwGX++oETqSNYv1a4jyA
	+IGoMZyIZWsnOrTLgQWnluLjmNQ3Vj+AAgD4X5HnfN8o51gs3urbfdS6MaHhDQM=
X-Gm-Gg: ASbGncsVqiDJypqkxCevLrNrfHS4qWq6n4xicC5lhN0EzHRfb4nrxiYdSnvEKwr2U7G
	/rMRwu0n6ffte0+2GDgHZjDKq1oP2/vfAHLDX298OFNhC2vCKqYf7x8xgKNR19fVbmmidujRSqW
	ZLOauctvoAeJaqpL6W+PQjNz6ASCD7FvDkd2YHzywev7FHVtZ03JXO528JO7VVhR1Tx7ImnOFRG
	AJhTRSJgfZVzuRwR9abranKOYCjjvurcN3l2GZzuAzklzLmPKBwwL/F4PGYpdCtN+o3z0/IM2g2
	bOvxAm4tTw0ZBWlsdeNWpA==
X-Google-Smtp-Source: AGHT+IExI0FrrZsKamgcVN3DymcneMdTVScVyfkUv2ZxVFO4DCDjFmz+ncZGIg93FBXGA7UMDX40jw==
X-Received: by 2002:a17:907:3fa4:b0:ab7:4262:6851 with SMTP id a640c23a62f3a-ab75e262775mr833400166b.30.1738853750198;
        Thu, 06 Feb 2025 06:55:50 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Feb 2025 14:55:44 +0000
Message-Id: <D7LG7IBBLR82.3FEHRYE0WJM4R@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis"
 <bertrand.marquis@arm.com>, "Volodymyr Babchuk"
 <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 00/15] Remove the directmap
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>

On Wed Jan 8, 2025 at 3:18 PM GMT, Alejandro Vallejo wrote:
> Hi,
>
> I picked v4 of this series and run it through XenRT extensively, fixing c=
rashes
> and errors as I hit them. Likewise, I've run it through Gitlab, fixing va=
rious
> CI failures. I listed all changes per patch. I fixed ARM to the extent th=
at
> "Gitlab is happy when CONFIG_ONDEMAND_DIRECTMAP=3Dy", but I didn't go muc=
h
> further than that.
>
> I _THINK_ I've covered previously unaddressed feedback, but please speak =
up if
> I missed something. Otherwise, same old same old.
>
> Cheers,
> Alejandro

Ping. Could I get some eyes on this? Or thoughts?

Cheers,
Alejandro

