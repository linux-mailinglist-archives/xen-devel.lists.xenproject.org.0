Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CA32D93B2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 08:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51916.90817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koiZr-00070X-Rb; Mon, 14 Dec 2020 07:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51916.90817; Mon, 14 Dec 2020 07:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koiZr-000707-Nx; Mon, 14 Dec 2020 07:47:27 +0000
Received: by outflank-mailman (input) for mailman id 51916;
 Mon, 14 Dec 2020 07:47:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVEM=FS=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1koiZp-0006zx-Rx
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 07:47:25 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 138eebf9-10a6-48e3-b5c0-3c474a0619b5;
 Mon, 14 Dec 2020 07:47:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id v14so12784677wml.1
 for <xen-devel@lists.xenproject.org>; Sun, 13 Dec 2020 23:47:25 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-221.range109-146.btcentralplus.com. [109.146.187.221])
 by smtp.gmail.com with ESMTPSA id x66sm27844024wmg.26.2020.12.13.23.47.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Dec 2020 23:47:23 -0800 (PST)
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
X-Inumbo-ID: 138eebf9-10a6-48e3-b5c0-3c474a0619b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=q9f0dLrgKME11QwP+Lz1f8G042/xNt7QORwsmse8W30=;
        b=Z8fdp8uibo5J7i6A5eXX0hVDeL/FKch5Y6Uz+fhYFztuVApB2vT3A+AIAZzChqJFLn
         Br84u47JhMVvg4OeLycAsmc4zEXKi4lOhMxbJbb005dTFLs7u1a4e5+PwJQh2jFqiOBY
         22aFebb+8xibP+rQonKnqKDLB6jSK48r7YcDlzZJFLrLdUOB2mVMQLznYW/1swZjE4NP
         tqMfb290URo2+yTH+n6CMeBpO610UsNIPvTifnY76RjBoAC7teDOHURK0r8PjqwRUmfv
         zmooEKMqub62XwLcdV1s91g+zy19S3lqMBRY6q3rgTMEwF2Fc8NrDo/9uwACGqhiHYOh
         VrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=q9f0dLrgKME11QwP+Lz1f8G042/xNt7QORwsmse8W30=;
        b=f4G7cq4obCwQVf6YXy3mmu/m/ffgR3hDDjc6vhEri3/K/2FKiJ3GIKZw1dqetByBmK
         Xd6gA3o4kqtvbGZEms1XHg2vnFfUsuJ/2yIS7lq+9iga1qH4WuXcDmEbI2iPLb9Y44r4
         IkxKxJ9mAVYceS0cP2PVXDw/bboDhdYM/uYKlgHKGpBgwTd5Ak3fmu7y927avTip7eVh
         k92JyCwqeKzpmxXqbSW3Q66XCkhywMugKbhEPDD8ukZ1qkug819wHuxpLDOHkCMjlcx+
         bs5x63o5Kn0hs5UAZnpJyH3ZBJyUD8vQnyiKlGWbG8S0mNjcvEJvPnmUPmMcsAW3Y4Df
         Cipw==
X-Gm-Message-State: AOAM530780EOfAg65FkgINIO8qEfEaL3W2ywNklPVn5N7691ZGl/sOqG
	vM0E1miQBN9AEALkZvB8ALc=
X-Google-Smtp-Source: ABdhPJzu+zNeTRFRPazIHL+E4xY5IryYTfv2xhHMgRDdh02X4K6G7ujVJ7rk339hArcq0uo/hSscZw==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr26334263wmi.164.1607932044358;
        Sun, 13 Dec 2020 23:47:24 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Eduardo Habkost'" <ehabkost@redhat.com>,
	<qemu-devel@nongnu.org>
Cc: "'Markus Armbruster'" <armbru@redhat.com>,
	"'Igor Mammedov'" <imammedo@redhat.com>,
	"'Stefan Berger'" <stefanb@linux.ibm.com>,
	=?UTF-8?Q?'Marc-Andr=C3=A9_Lureau'?= <marcandre.lureau@redhat.com>,
	"'Daniel P. Berrange'" <berrange@redhat.com>,
	=?UTF-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
	"'John Snow'" <jsnow@redhat.com>,
	"'Kevin Wolf'" <kwolf@redhat.com>,
	"'Eric Blake'" <eblake@redhat.com>,
	"'Paolo Bonzini'" <pbonzini@redhat.com>,
	"'Stefan Berger'" <stefanb@linux.vnet.ibm.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Anthony Perard'" <anthony.perard@citrix.com>,
	"'Max Reitz'" <mreitz@redhat.com>,
	"'Cornelia Huck'" <cohuck@redhat.com>,
	"'Halil Pasic'" <pasic@linux.ibm.com>,
	"'Christian Borntraeger'" <borntraeger@de.ibm.com>,
	"'Richard Henderson'" <rth@twiddle.net>,
	"'David Hildenbrand'" <david@redhat.com>,
	"'Thomas Huth'" <thuth@redhat.com>,
	"'Matthew Rosato'" <mjrosato@linux.ibm.com>,
	"'Alex Williamson'" <alex.williamson@redhat.com>,
	<xen-devel@lists.xenproject.org>,
	<qemu-block@nongnu.org>,
	<qemu-s390x@nongnu.org>
References: <20201211220529.2290218-1-ehabkost@redhat.com> <20201211220529.2290218-31-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-31-ehabkost@redhat.com>
Subject: RE: [PATCH v4 30/32] qdev: Rename qdev_get_prop_ptr() to object_field_prop_ptr()
Date: Mon, 14 Dec 2020 07:47:25 -0000
Message-ID: <009d01d6d1ed$5da99ee0$18fcdca0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLXjZRr+qbM/S7ZJ9VMMfP1SWcevwIpMTjHp+N10QA=

> -----Original Message-----
> From: Eduardo Habkost <ehabkost@redhat.com>
> Sent: 11 December 2020 22:05
> To: qemu-devel@nongnu.org
> Cc: Markus Armbruster <armbru@redhat.com>; Igor Mammedov =
<imammedo@redhat.com>; Stefan Berger
> <stefanb@linux.ibm.com>; Marc-Andr=C3=A9 Lureau =
<marcandre.lureau@redhat.com>; Daniel P. Berrange
> <berrange@redhat.com>; Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com>; John Snow <jsnow@redhat.com>; Kevin
> Wolf <kwolf@redhat.com>; Eric Blake <eblake@redhat.com>; Paolo Bonzini =
<pbonzini@redhat.com>; Stefan
> Berger <stefanb@linux.vnet.ibm.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Anthony Perard
> <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; Max Reitz =
<mreitz@redhat.com>; Cornelia Huck
> <cohuck@redhat.com>; Halil Pasic <pasic@linux.ibm.com>; Christian =
Borntraeger
> <borntraeger@de.ibm.com>; Richard Henderson <rth@twiddle.net>; David =
Hildenbrand <david@redhat.com>;
> Thomas Huth <thuth@redhat.com>; Matthew Rosato =
<mjrosato@linux.ibm.com>; Alex Williamson
> <alex.williamson@redhat.com>; xen-devel@lists.xenproject.org; =
qemu-block@nongnu.org; qemu-
> s390x@nongnu.org
> Subject: [PATCH v4 30/32] qdev: Rename qdev_get_prop_ptr() to =
object_field_prop_ptr()
>=20
> The function will be moved to common QOM code, as it is not
> specific to TYPE_DEVICE anymore.
>=20
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Xen parts...

Acked-by: Paul Durrant <paul@xen.org>


