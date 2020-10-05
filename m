Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13310283440
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 12:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2970.8530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPO9R-0007iM-4q; Mon, 05 Oct 2020 10:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2970.8530; Mon, 05 Oct 2020 10:55:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPO9R-0007hx-1T; Mon, 05 Oct 2020 10:55:29 +0000
Received: by outflank-mailman (input) for mailman id 2970;
 Mon, 05 Oct 2020 10:55:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=37d/=DM=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1kPO9P-0007hs-8Z
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 10:55:27 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8b537bd0-898d-4aa4-ab30-dee5db5f350f;
 Mon, 05 Oct 2020 10:55:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-uIq1M_HTMOC1le8a4VRyEA-1; Mon, 05 Oct 2020 06:55:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A549918C89C1;
 Mon,  5 Oct 2020 10:55:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2B85D9CC;
 Mon,  5 Oct 2020 10:55:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1A6C911329C1; Mon,  5 Oct 2020 12:55:15 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=37d/=DM=redhat.com=armbru@srs-us1.protection.inumbo.net>)
	id 1kPO9P-0007hs-8Z
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 10:55:27 +0000
X-Inumbo-ID: 8b537bd0-898d-4aa4-ab30-dee5db5f350f
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 8b537bd0-898d-4aa4-ab30-dee5db5f350f;
	Mon, 05 Oct 2020 10:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601895325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yALnMSr1yJuue5E4AjGZKDmMg2aydLrPW9CxjD73UMw=;
	b=VU53fZrADP6BVPncsCYYu26Ejlv1XEoP2CTKb0Hbz2U+QYvvci0H9k+4SwloOf8+nKotpz
	i9JrdNzBlVeU/bnf1JLK+hbciWY0x5RTuRh+PYALvrNmnUlWPnNUzqgqRboyoFe23N4nxs
	5pr8VOGLOoKI1x/GkeOKoH/3Ek8EtlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-uIq1M_HTMOC1le8a4VRyEA-1; Mon, 05 Oct 2020 06:55:24 -0400
X-MC-Unique: uIq1M_HTMOC1le8a4VRyEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A549918C89C1;
	Mon,  5 Oct 2020 10:55:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com [10.36.112.182])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2B85D9CC;
	Mon,  5 Oct 2020 10:55:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1A6C911329C1; Mon,  5 Oct 2020 12:55:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Peter
 Maydell
 <peter.maydell@linaro.org>,  Stefano Stabellini <sstabellini@kernel.org>,
  Eduardo Habkost <ehabkost@redhat.com>,  Paul Durrant <paul@xen.org>,
  Juan Quintela <quintela@redhat.com>,  qemu-devel@nongnu.org,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Anthony Perard
 <anthony.perard@citrix.com>,  xen-devel@lists.xenproject.org,  Richard
 Henderson <rth@twiddle.net>
Subject: Re: [PATCH 0/5] qapi: Restrict machine (and migration) specific
 commands
References: <20201002133923.1716645-1-philmd@redhat.com>
	<87wo05aypg.fsf@dusky.pond.sub.org>
	<0c54aa06-372c-ab81-0974-34340adb7b55@redhat.com>
Date: Mon, 05 Oct 2020 12:55:14 +0200
In-Reply-To: <0c54aa06-372c-ab81-0974-34340adb7b55@redhat.com> (Paolo
	Bonzini's message of "Mon, 5 Oct 2020 10:46:02 +0200")
Message-ID: <877ds5djsd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 05/10/20 10:01, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Reduce the machine code pulled into qemu-storage-daemon.
>> I'm leaving review to Eduardo and Marcel for PATCH 1-4, and to David and
>> Juan for PATCH 5.  David already ACKed.
>>=20
>> Can do the pull request.
>>=20
>
> If it counts, :) for patch 1-4:
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Generally these patches to remove code from user-mode emulators
> fall into the "if it builds it's fine" bucket, since I assume
> we want the "misc" subschema to be as small as possible.

Moving stuff out of qapi/misc.json is good as long as the new home makes
sense.  So, if it builds *and* the maintainers of the new home think it
makes sense to have it there, it's fine.

I don't think we should aim for eliminating every last bit of unused
generated code from every program.  We should aim for a sensible split
into sub-modules.  Unused generated code in a program can be a sign for
a less than sensible split.


