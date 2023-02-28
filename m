Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294E66A585C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 12:34:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503269.775511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWyFb-0001ti-7M; Tue, 28 Feb 2023 11:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503269.775511; Tue, 28 Feb 2023 11:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWyFb-0001rg-4A; Tue, 28 Feb 2023 11:34:31 +0000
Received: by outflank-mailman (input) for mailman id 503269;
 Tue, 28 Feb 2023 11:34:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zwda=6Y=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1pWyFa-0001rZ-4j
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 11:34:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db72f1b2-b75b-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 12:34:27 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-bbFmldvKOiqrsXzc0gvEGA-1; Tue, 28 Feb 2023 06:34:22 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 225A9299E74A;
 Tue, 28 Feb 2023 11:34:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCF83C15BAD;
 Tue, 28 Feb 2023 11:34:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B2C1621E6A1F; Tue, 28 Feb 2023 12:34:19 +0100 (CET)
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
X-Inumbo-ID: db72f1b2-b75b-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677584066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AOcFKXrfEoubHIMAnm01Q+sO2KA1vvwDvQy3bHM/ev4=;
	b=IiwYsLG2Jqhs60Qu5mOj8gqddDPEkEv0fYlV6Vm6lwxI0yu/NoDmM/u+I6gDQc5cI7mHR7
	GYFl1TzjUcQaEM5SewbRdDE5B7RpVNQa9l4LLlG0AK+/6OzDQqc75A0osRjujEgvSx2XO3
	i4F/P+CihSSSatFNPgEUT1SxFXquNTs=
X-MC-Unique: bbFmldvKOiqrsXzc0gvEGA-1
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  libvir-list@redhat.com,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-devel@nongnu.org,
  qemu-arm@nongnu.org,  Reinoud Zandijk <reinoud@netbsd.org>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  xen-devel@lists.xenproject.org,
  Paolo Bonzini <pbonzini@redhat.com>,  Maxim Levitsky
 <mlevitsk@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
References: <Y/yY72L9wyjuv3Yz@redhat.com>
	<20230227150858-mutt-send-email-mst@kernel.org>
	<84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
	<20230228031026-mutt-send-email-mst@kernel.org>
	<Y/3CiEKKoG06t9rr@redhat.com>
	<20230228040115-mutt-send-email-mst@kernel.org>
	<fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
	<Y/3MIUDRBUSNg6C5@redhat.com>
	<20230228050908-mutt-send-email-mst@kernel.org>
	<87cz5uhy50.fsf@pond.sub.org>
	<20230228055016-mutt-send-email-mst@kernel.org>
Date: Tue, 28 Feb 2023 12:34:19 +0100
In-Reply-To: <20230228055016-mutt-send-email-mst@kernel.org> (Michael
	S. Tsirkin's message of "Tue, 28 Feb 2023 05:51:41 -0500")
Message-ID: <87h6v6gh1g.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
>> The question to answer: Is 32 bit x86 worth its upkeep?  Two
>> sub-questions: 1. Is it worth the human attention?  2. Is it worth
>> (scarce!) CI minutes?
>
> 3. Is it worth arguing about?

If it's not worth arguing, then we merge Thomas's patch.


