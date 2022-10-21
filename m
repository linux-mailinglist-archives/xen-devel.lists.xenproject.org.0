Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F237A60757A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427605.676846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpgm-0004Am-U7; Fri, 21 Oct 2022 10:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427605.676846; Fri, 21 Oct 2022 10:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpgm-00048S-RO; Fri, 21 Oct 2022 10:55:44 +0000
Received: by outflank-mailman (input) for mailman id 427605;
 Fri, 21 Oct 2022 10:55:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i13X=2W=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1olpgl-00048L-AD
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:55:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e75d6198-512e-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 12:55:41 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-1VDSkEuqP8Ka01rnX2mVLA-1; Fri, 21 Oct 2022 06:55:37 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A1F4811E75;
 Fri, 21 Oct 2022 10:55:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC052C5FEC0;
 Fri, 21 Oct 2022 10:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A5D6221E6936; Fri, 21 Oct 2022 12:55:35 +0200 (CEST)
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
X-Inumbo-ID: e75d6198-512e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666349740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fL4PnehEm8f13PDLz7kiV4oIdcucSxynau12gJFqJSA=;
	b=CWq4ueXocTojoZ25G8nhze41Rj+G66jv1GjsakP0IZ6ufxgytb/kxkIABhD7YDwZdVmrbp
	m7L//HWpDc93wfAda35ptBYTGbEPRp1j9PNSqJLW3ERNtP0XsuikzuNnlwYtGFxm4noViI
	97uauPpdwUY+D/tRIrF6q9VFhMVCAtE=
X-MC-Unique: 1VDSkEuqP8Ka01rnX2mVLA-1
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,  qemu-devel@nongnu.org,  Paul
 Durrant <paul@xen.org>,  Thomas Huth <thuth@redhat.com>,  =?utf-8?Q?Danie?=
 =?utf-8?Q?l_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David Alan
 Gilbert"
 <dgilbert@redhat.com>,  Greg Kurz <groug@kaod.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  David Gibson <david@gibson.dropbear.id.au>,
  Eric Blake <eblake@redhat.com>,  xen-devel@lists.xenproject.org,
  "Michael S. Tsirkin" <mst@redhat.com>,  Stefan Weil <sw@weilnetz.de>,
  Paolo Bonzini <pbonzini@redhat.com>,  Jason Wang <jasowang@redhat.com>,
  Samuel Thibault <samuel.thibault@ens-lyon.org>,  Anthony Perard
 <anthony.perard@citrix.com>,  Laine Stump <laine@redhat.com>
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
References: <20221020162558.123284-1-lvivier@redhat.com>
	<20221020162558.123284-18-lvivier@redhat.com>
	<87pmel4th4.fsf@pond.sub.org>
	<52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
	<87lep935hn.fsf@pond.sub.org> <20221021114052.339f6aac@elisabeth>
Date: Fri, 21 Oct 2022 12:55:35 +0200
In-Reply-To: <20221021114052.339f6aac@elisabeth> (Stefano Brivio's message of
	"Fri, 21 Oct 2022 11:40:52 +0200")
Message-ID: <87o7u51m54.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

Stefano Brivio <sbrivio@redhat.com> writes:

> [Cc: Laine, full quote]
>
> On Fri, 21 Oct 2022 11:12:20 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Cc: Stefano Brivio
>> 
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>> > On 10/21/22 07:48, Markus Armbruster wrote:  
>> >> Laurent Vivier <lvivier@redhat.com> writes:
>> >>   
>> >>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>> >>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.  
>> >>
>> >> Use cases?  
>> >
>> > This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.  
>> 
>> Let's add something like this to the commit message:
>> 
>>     This lets libvirt notice when the connection is lost somehow, and
>>     restart the peer (such as passt).
>> 
>> Who's working on the libvirt part?
>
> Laine Stump and myself. Nothing to show yet, though.

Good enough for me :)

[...]


