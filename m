Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180482F9C5A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 11:31:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69553.124561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Ros-00050e-Bt; Mon, 18 Jan 2021 10:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69553.124561; Mon, 18 Jan 2021 10:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Ros-00050I-8t; Mon, 18 Jan 2021 10:31:34 +0000
Received: by outflank-mailman (input) for mailman id 69553;
 Mon, 18 Jan 2021 10:31:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1Ror-00050D-4r
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:31:33 +0000
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d53234af-20de-434e-8bb2-ec3c16a464e7;
 Mon, 18 Jan 2021 10:31:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y187so13326190wmd.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 02:31:32 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id a184sm13453305wme.35.2021.01.18.02.31.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 02:31:31 -0800 (PST)
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
X-Inumbo-ID: d53234af-20de-434e-8bb2-ec3c16a464e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=GDz9PDnL+S+6mnzKw7uiKJO2KsO1AdP7lI0xuYmxQ2I=;
        b=nrTpdxZ06e/wMl+4yCiQiNKLjgjz0XpPgyVV4BEruel6M432BL2OoyabwyV4MpIlqW
         IGHodpOLH3VX101w28A06mbpIGwtDnH11rzNClv7n7qq30DQfvGb2KboJ5KlSUK6FgeE
         zvZDB6uxFH7DZr9llyBXfsYVIdOk3jmaYXt1APgCK77SErqFokhxGiZXCoV5cbDN1/PG
         Ph9Tna4y4gLPwq2Vjk8m57cabB+v9WXJs7vpQFTPN2COQt/PVIw/NFdqNUFT3xQM0czp
         +VAwQRyyx1I3QlcLnHD+eamLdWhMYvw71qfy4T3Iea09tEV2MMuoo2JmQ9XsesY37YKw
         lSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=GDz9PDnL+S+6mnzKw7uiKJO2KsO1AdP7lI0xuYmxQ2I=;
        b=Z/Fi7L53b5dNJkXVGn4CDztPA5qNDGnVrUJJSiLoqh1wJXPBoyR4gfKVMmKEA8kr9/
         oLtpkfMfPqw3eBWnyxppGysLFjq4J5iDXcSAYQYQvedauMA+WCu/287lGG2QZ4tQoR65
         O9YQ0sy0WNbiNt7QRZOR5ZNHW9yzk6xaxqW6RDTxSjUZzhR5HJ950a9NXNKUViip0P3U
         fZFnVEVcA14raYioMdbS8Iv68ZYqAvQPjFqvPFS14uDDHJOnUGTtPCrVzr+VKLDBx+Md
         37yx67h+IxpZ85sPtZxccII5S0PFUJea08lFbWVFi6VvYZiuSqz5myUI+tBqNmyAFYq6
         mjqg==
X-Gm-Message-State: AOAM532RT1+mjWOQU5jpBq8Xy2ho4+jmIZp90f9rNQ9Jc1Byr1HNaTPg
	qf6QI1I2xQnA5PsfyIaxtig=
X-Google-Smtp-Source: ABdhPJz/Sj5K3BAe2vVgSLjFhM0oODhBSxwwj+DMvg7qJWjUQi61LOoclXpuFRpDHqGyi8oSlVEucw==
X-Received: by 2002:a1c:4107:: with SMTP id o7mr19967984wma.33.1610965891533;
        Mon, 18 Jan 2021 02:31:31 -0800 (PST)
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
	"'Julien Grall'" <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-22-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-22-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 21/24] xen/ioreq: Make x86's send_invalidate_req() common
Date: Mon, 18 Jan 2021 10:31:30 -0000
Message-ID: <00d401d6ed85$160a10c0$421e3240$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQIaMsBRqO+ocbA=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Oleksandr Tyshchenko
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>; Wei Liu <wl@xen.org>;
> George Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<iwj@xenproject.org>; Julien Grall
> <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Paul =
Durrant <paul@xen.org>; Julien
> Grall <julien.grall@arm.com>
> Subject: [PATCH V4 21/24] xen/ioreq: Make x86's send_invalidate_req() =
common
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> As the IOREQ is a common feature now and we also need to
> invalidate qemu/demu mapcache on Arm when the required condition
> occurs this patch moves this function to the common code
> (and remames it to ioreq_signal_mapcache_invalidate).
> This patch also moves per-domain qemu_mapcache_invalidate
> variable out of the arch sub-struct (and drops "qemu" prefix).
>=20
> We don't put this variable inside the #ifdef CONFIG_IOREQ_SERVER
> at the end of struct domain, but in the hole next to the group
> of 5 bools further up which is more efficient.
>=20
> The subsequent patch will add mapcache invalidation handling on Arm.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Reviewed-by: Paul Durrant <paul@xen.org>


