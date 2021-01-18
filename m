Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD71A2F9BEA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 10:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69506.124429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Qx9-0006gy-C9; Mon, 18 Jan 2021 09:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69506.124429; Mon, 18 Jan 2021 09:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Qx9-0006gd-8q; Mon, 18 Jan 2021 09:36:03 +0000
Received: by outflank-mailman (input) for mailman id 69506;
 Mon, 18 Jan 2021 09:36:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1Qx8-0006gY-Aj
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 09:36:02 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b9fdf89-7a9c-4d58-9c2f-fbac0e527355;
 Mon, 18 Jan 2021 09:36:01 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id u14so8963917wmq.4
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 01:36:01 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id h15sm5959918wmq.3.2021.01.18.01.35.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:36:00 -0800 (PST)
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
X-Inumbo-ID: 6b9fdf89-7a9c-4d58-9c2f-fbac0e527355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=Rh2+o5kktFpwUbL8ioxybBYlpka7QjPDZP7ytZI0ptg=;
        b=sns3zMENpITgd5Kx8lO3SFL6ad/2CVDZgQNo+spNiRHQm4bHCuBhiLahV4m1g7SFi+
         FeVyV1T4PYMV9tB456JEwsv6lzYJofBqQMvUf4Wp9JMgnXFUH7T9GfUIiqZq74kvD38I
         Ps1IzYkIBYj9yg+KPGc7X7hP/ML/a5dIVWsCOFy8VU+ugef9SgZ1shyGB10V6bsFuJ5I
         5MU2j5mWIhK21wNQ0vatG37UFz3FGjz68PPPFvsiVAhgN+Ul6NgUzKBWdPKk8xUgp+ru
         VnreIMRGPtkXvjYSE7al/yfzBwPTD191rVKTNoZtP25ZKEdvEtOoENb45LNvAmpNZAR3
         Dm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=Rh2+o5kktFpwUbL8ioxybBYlpka7QjPDZP7ytZI0ptg=;
        b=YioCK87HeSi+7i8kz784NbZDTfQrhZ3e8p1/9GGECt6Ql4VmrzIOqLBClcdi6tsfxG
         8x4vGW3QttwypoTF4jgLXQfIF/44SnI0hMO9/8QulU1jtHvlnJlsG/zFKG9/MH+I9hNN
         cL29dSLprUKXmEgUv6Cc5QkiKMbJwDzMUpvVmEgRyx7VmKvhJxPd4Hv8iaAUdGpupHrF
         M0raRSpdz6mEwiHtceHCnmrPgseSSiWwvxD9TPk5VZg9PmH/LirhJYflHk4XMA3c2PJt
         oMCJNxQOmugNOb/YxI51mbLHuK9YIymWTu7+Oo6Q04gxfSRAV76UfIDJXpTha0N+j2iQ
         KXtA==
X-Gm-Message-State: AOAM530zc4dJAqBp93O7qxuSxuq/TxBIuANMFkbPju4sfhkI65Cjp8qG
	o7bclcfAoLByomitroJTvR4=
X-Google-Smtp-Source: ABdhPJz8llDXCJJrHlDALyXekbGsj9hraVBTYFgW2pD3p8T96DYLGoa12tiJodGaALT1EDwCHKos8w==
X-Received: by 2002:a05:600c:1549:: with SMTP id f9mr20362804wmg.61.1610962560729;
        Mon, 18 Jan 2021 01:36:00 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	=?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
	"'Wei Liu'" <wl@xen.org>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Jun Nakajima'" <jun.nakajima@intel.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-11-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-11-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 10/24] xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
Date: Mon, 18 Jan 2021 09:35:59 -0000
Message-ID: <00c801d6ed7d$54b4ac70$fe1e0550$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQETivG6qPfKIrA=
Content-Language: en-gb

> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Paul Durrant =
<paul@xen.org>; Jan Beulich
> <jbeulich@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; Roger =
Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>; George Dunlap =
<george.dunlap@citrix.com>; Ian Jackson
> <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Stefano =
Stabellini <sstabellini@kernel.org>; Jun
> Nakajima <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>; =
Julien Grall
> <julien.grall@arm.com>
> Subject: [PATCH V4 10/24] xen/ioreq: Move x86's io_completion/io_req =
fields to struct vcpu
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> The IOREQ is a common feature now and these fields will be used
> on Arm as is. Move them to common struct vcpu as a part of new
> struct vcpu_io and drop duplicating "io" prefixes. Also move
> enum hvm_io_completion to xen/sched.h and remove "hvm" prefixes.
>=20
> This patch completely removes layering violation in the common code.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Paul Durrant <paul@xen.org>


