Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF8128314F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 10:02:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2867.8169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPLR6-0006cI-7I; Mon, 05 Oct 2020 08:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2867.8169; Mon, 05 Oct 2020 08:01:32 +0000
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
	id 1kPLR6-0006bw-3m; Mon, 05 Oct 2020 08:01:32 +0000
Received: by outflank-mailman (input) for mailman id 2867;
 Mon, 05 Oct 2020 08:01:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=37d/=DM=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1kPLR4-0006bo-L3
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:01:30 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1b69d07c-75ba-4e74-b628-943968820c68;
 Mon, 05 Oct 2020 08:01:29 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-JsmJSc14P12pSFbh1NIEpg-1; Mon, 05 Oct 2020 04:01:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34FCA8030D2;
 Mon,  5 Oct 2020 08:01:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-101.ams2.redhat.com
 [10.36.112.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E190B5C225;
 Mon,  5 Oct 2020 08:01:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 55FF310C7796; Mon,  5 Oct 2020 10:01:15 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=37d/=DM=redhat.com=armbru@srs-us1.protection.inumbo.net>)
	id 1kPLR4-0006bo-L3
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:01:30 +0000
X-Inumbo-ID: 1b69d07c-75ba-4e74-b628-943968820c68
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 1b69d07c-75ba-4e74-b628-943968820c68;
	Mon, 05 Oct 2020 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601884889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJwznd7k4BYmOPHwcumCxFnElmQZhM9x5nROGs39sU4=;
	b=GlQIPQqxzZKdqAtI7dwkz1XGR4aBnLsjpkZtmoeeHn+nG/qsEa2lSRiBU+6WnGx1bmqJYD
	N4JyFztSQYfkfytA9bkLvtmb9E69mPtDO3F3DdjAalbp4DJzUA5hRxlFtbwfkxh4RtazdY
	bHvNMxj5C2gDSCbXlY4vmkBYAncnRrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-JsmJSc14P12pSFbh1NIEpg-1; Mon, 05 Oct 2020 04:01:25 -0400
X-MC-Unique: JsmJSc14P12pSFbh1NIEpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34FCA8030D2;
	Mon,  5 Oct 2020 08:01:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-101.ams2.redhat.com [10.36.112.101])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E190B5C225;
	Mon,  5 Oct 2020 08:01:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 55FF310C7796; Mon,  5 Oct 2020 10:01:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
  Stefano Stabellini <sstabellini@kernel.org>,  Eduardo Habkost
 <ehabkost@redhat.com>,  Juan Quintela <quintela@redhat.com>,  Paul Durrant
 <paul@xen.org>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  "Michael
 S. Tsirkin" <mst@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Anthony Perard
 <anthony.perard@citrix.com>,  xen-devel@lists.xenproject.org,  Richard
 Henderson <rth@twiddle.net>
Subject: Re: [PATCH 0/5] qapi: Restrict machine (and migration) specific
 commands
References: <20201002133923.1716645-1-philmd@redhat.com>
Date: Mon, 05 Oct 2020 10:01:15 +0200
In-Reply-To: <20201002133923.1716645-1-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 2 Oct 2020 15:39:18
 +0200")
Message-ID: <87wo05aypg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Reduce the machine code pulled into qemu-storage-daemon.

I'm leaving review to Eduardo and Marcel for PATCH 1-4, and to David and
Juan for PATCH 5.  David already ACKed.

Can do the pull request.


