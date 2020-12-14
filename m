Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2472D93AF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 08:46:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51906.90794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koiYZ-0006nl-83; Mon, 14 Dec 2020 07:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51906.90794; Mon, 14 Dec 2020 07:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koiYZ-0006nM-4R; Mon, 14 Dec 2020 07:46:07 +0000
Received: by outflank-mailman (input) for mailman id 51906;
 Mon, 14 Dec 2020 07:46:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVEM=FS=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1koiYX-0006nH-O5
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 07:46:05 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0c14762-5a1a-4d20-ab84-6b5de9c60426;
 Mon, 14 Dec 2020 07:46:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r7so15397540wrc.5
 for <xen-devel@lists.xenproject.org>; Sun, 13 Dec 2020 23:46:04 -0800 (PST)
Received: from CBGR90WXYV0
 (host109-146-187-221.range109-146.btcentralplus.com. [109.146.187.221])
 by smtp.gmail.com with ESMTPSA id h9sm29004797wre.24.2020.12.13.23.46.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Dec 2020 23:46:02 -0800 (PST)
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
X-Inumbo-ID: e0c14762-5a1a-4d20-ab84-6b5de9c60426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=7CLvZWlJGE9pAbmF1ZeVYqzKa4QzcerK0aitwu3LRYA=;
        b=jLOYyiw7BE4Nml9SAwuHRbX77K8ATp5KM8rg8TWHBoiM6Xcz3Nq42GqrBUgJdHn82c
         q7s/9NFh96P6pnGgmpcBWTo9rDXnCqiwbB97RJjEP11JfqEpzYUV/ioqShXNmrlz/vwo
         xD4SCySmndb6kow6jKi4h+88o+ut3dvlXeXwxRSoggJenIfH7uGAH3O+fibgOEPYUhff
         kqc3so27WcWHDj9I5RNUeNEb5aBn4wDwwA4dhDtKGGybK3/vsai8ZlvMRI9ZnXYPJiKv
         SuEiadp6qV2s6HxLqm6kP/ORdMnoU+PpT2Km8RbLrFEe76cfa4s6trQh23aoYy55+nkr
         SIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=7CLvZWlJGE9pAbmF1ZeVYqzKa4QzcerK0aitwu3LRYA=;
        b=s42AcP8nWUrl5R96Mytn2SA+j/4uwXJ26Jp5TKbv8Mp3EoOgs2CG/jA7ukIYkQAAG2
         7/sYGXwjtYMZl14Y4+j+4VkOfl7pYcADOspV5GPTqBE0WCHk/sCV4TKn2p3IGKZTloEM
         t9cI/bRrdPrelLdAYCGcLwzZT++hrzdc+k2FurygQMw3jasVFrx5hBVfNWMw1SSw8Q8v
         sBh4xPi+jZP1g2t1b0qHWUARi+QK5E8zDpD4Hkx12CHzLg6Wa0Ou147JzAtjTJAXSOIi
         85HmryTguP/b/r+uwcP8k/1HdrWxw9YmfWXOxPyyqfeTRMG/9jZ5yYtd750CF/KeMK+D
         CVRg==
X-Gm-Message-State: AOAM531+cUhOG30l8Luz5FAlBae7IY2k68VmdEnaQPn3sQ6lykdN8v+1
	/99CiDziTgYoEOsliE7y0NM=
X-Google-Smtp-Source: ABdhPJxNeGQl/cu2GYjlWH7t8lH884fbYLCIL+vwErYrctSCVkJrX7E48+6a7CHyHCMcluRZXgBEzg==
X-Received: by 2002:a5d:6607:: with SMTP id n7mr24256141wru.206.1607931963536;
        Sun, 13 Dec 2020 23:46:03 -0800 (PST)
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
	"'Cornelia Huck'" <cohuck@redhat.com>,
	"'Stefan Berger'" <stefanb@linux.vnet.ibm.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Anthony Perard'" <anthony.perard@citrix.com>,
	"'Max Reitz'" <mreitz@redhat.com>,
	"'Thomas Huth'" <thuth@redhat.com>,
	"'Richard Henderson'" <rth@twiddle.net>,
	"'David Hildenbrand'" <david@redhat.com>,
	"'Halil Pasic'" <pasic@linux.ibm.com>,
	"'Christian Borntraeger'" <borntraeger@de.ibm.com>,
	"'Matthew Rosato'" <mjrosato@linux.ibm.com>,
	"'Alex Williamson'" <alex.williamson@redhat.com>,
	<xen-devel@lists.xenproject.org>,
	<qemu-block@nongnu.org>,
	<qemu-s390x@nongnu.org>
References: <20201211220529.2290218-1-ehabkost@redhat.com> <20201211220529.2290218-10-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-10-ehabkost@redhat.com>
Subject: RE: [PATCH v4 09/32] qdev: Make qdev_get_prop_ptr() get Object* arg
Date: Mon, 14 Dec 2020 07:46:03 -0000
Message-ID: <009b01d6d1ed$2d415900$87c40b00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLXjZRr+qbM/S7ZJ9VMMfP1SWcevwM8aMtWp9rbvdA=

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
<pbonzini@redhat.com>; Cornelia
> Huck <cohuck@redhat.com>; Stefan Berger <stefanb@linux.vnet.ibm.com>; =
Stefano Stabellini
> <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; =
Paul Durrant <paul@xen.org>; Max
> Reitz <mreitz@redhat.com>; Thomas Huth <thuth@redhat.com>; Richard =
Henderson <rth@twiddle.net>; David
> Hildenbrand <david@redhat.com>; Halil Pasic <pasic@linux.ibm.com>; =
Christian Borntraeger
> <borntraeger@de.ibm.com>; Matthew Rosato <mjrosato@linux.ibm.com>; =
Alex Williamson
> <alex.williamson@redhat.com>; xen-devel@lists.xenproject.org; =
qemu-block@nongnu.org; qemu-
> s390x@nongnu.org
> Subject: [PATCH v4 09/32] qdev: Make qdev_get_prop_ptr() get Object* =
arg
>=20
> Make the code more generic and not specific to TYPE_DEVICE.
>=20
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com> #s390 parts
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Xen parts...

Acked-by: Paul Durrant <paul@xen.org>


