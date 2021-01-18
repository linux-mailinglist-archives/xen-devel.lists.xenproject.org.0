Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398762F9C0E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 10:55:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69523.124478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1RFl-0000XG-Kh; Mon, 18 Jan 2021 09:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69523.124478; Mon, 18 Jan 2021 09:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1RFl-0000Wr-HW; Mon, 18 Jan 2021 09:55:17 +0000
Received: by outflank-mailman (input) for mailman id 69523;
 Mon, 18 Jan 2021 09:55:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1RFk-0000Wm-GZ
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 09:55:16 +0000
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 823e0041-9d92-4ee4-9673-8530c2b8324e;
 Mon, 18 Jan 2021 09:55:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id j18so2003140wmi.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 01:55:14 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id r20sm32607252wrg.66.2021.01.18.01.55.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:55:13 -0800 (PST)
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
X-Inumbo-ID: 823e0041-9d92-4ee4-9673-8530c2b8324e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=pI6PgO0ZcqKjyDSQ8MWe/vlbErzUQMn2tKpUxi9YWvo=;
        b=GL0xhN0ch++jxrHOVeFG5dVpaNsg2L8Ebd7brap+k0F9TqHOSGjkz5bA5YwbAos20K
         CXpIkMbX59Hw3R7UaHz6TDpFV2toC3Qc/fv2ZObx9OEnUVNrFER4kFl40Evr54Z6Niw2
         rG4K1y7UJHiXcXFFB9jJEQTy3L7AJ8It45I6onagjTZbR/r/9c1gRkD7MCOE1IFbCl/u
         wrmeysyb8F0GI1t/IqyDEi0VKKp0gGNDo53CL7sajzatiA2dLhWfb/Gami/5brbYseHA
         Zf1RmoK4g655i3jMtvp8hYohZQI4noAedz1q5MYMtZ+uWm8SD2s14u6ef/L9QsGGQrAr
         gZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=pI6PgO0ZcqKjyDSQ8MWe/vlbErzUQMn2tKpUxi9YWvo=;
        b=pouB6xR2RmykU2MdU4sFLzNFLCghJOGLYq8PTsxFYLBOuec/wvyvM1ljifcqIuKXMO
         r1WVCnAQpHJq9FCrVMOPobDcXT0gZfRLtNqwD8rIEeXoP00if8dMaUO/sWr+VSUlm4Cr
         nMHdTDiE5F2mjJDTfZqqBtmxUyOxRA5GT9+euN7ihf0YynY9SX3Pu2YabEy6PtS7KQ+L
         idsu8FVesbVf/DDLGYfOyIzWpSvpSnMK+UoLDSmU7zZy/wd9ZfJiU8ZrXbKa3nCzkKkx
         M0QZX3QPWylMF8AjUgOOvAsB6rMX1XhoMOjg0tBpcBTuP4TcIbjjlBF6UJevBguORH0K
         bvfQ==
X-Gm-Message-State: AOAM530CNYqxpNWbKSjenbZwdhlyONyVwcptnlU08eNSj0yfuz/4i9TG
	QfrDCAwTn+eftswoDEe6xlY=
X-Google-Smtp-Source: ABdhPJxph5jiB4MtJjvhRWXgS3LvDK0HLxmGPt/Fgwe6ZpNzBkAwe8G8Dmh+Qg41ZEEmPPmTCnOg7w==
X-Received: by 2002:a7b:c24c:: with SMTP id b12mr5086838wmj.167.1610963714145;
        Mon, 18 Jan 2021 01:55:14 -0800 (PST)
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
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-13-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-13-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 12/24] xen/ioreq: Remove "hvm" prefixes from involved function names
Date: Mon, 18 Jan 2021 09:55:12 -0000
Message-ID: <00cb01d6ed80$04350a30$0c9f1e90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQHKX/B9qPIZCBA=
Content-Language: en-gb

> -----Original Message-----
> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Wei Liu <wl@xen.org>;
> George Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<iwj@xenproject.org>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Paul =
Durrant <paul@xen.org>; Jun
> Nakajima <jun.nakajima@intel.com>; Kevin Tian <kevin.tian@intel.com>; =
Julien Grall
> <julien.grall@arm.com>
> Subject: [PATCH V4 12/24] xen/ioreq: Remove "hvm" prefixes from =
involved function names
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> This patch removes "hvm" prefixes and infixes from IOREQ related
> function names in the common code and performs a renaming where
> appropriate according to the more consistent new naming scheme:
> - IOREQ server functions should start with "ioreq_server_"
> - IOREQ functions should start with "ioreq_"
>=20
> A few function names are clarified to better fit into their purposes:
> handle_hvm_io_completion -> vcpu_ioreq_handle_completion
> hvm_io_pending           -> vcpu_ioreq_pending
> hvm_ioreq_init           -> ioreq_domain_init
> hvm_alloc_ioreq_mfn      -> ioreq_server_alloc_mfn
> hvm_free_ioreq_mfn       -> ioreq_server_free_mfn
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
>=20

Reviewed-by: Paul Durrant <paul@xen.org>



