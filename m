Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DEB607454
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 11:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427501.676625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloWj-0003cx-0i; Fri, 21 Oct 2022 09:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427501.676625; Fri, 21 Oct 2022 09:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloWi-0003aa-Tq; Fri, 21 Oct 2022 09:41:16 +0000
Received: by outflank-mailman (input) for mailman id 427501;
 Fri, 21 Oct 2022 09:41:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i13X=2W=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1oloWi-0003aU-18
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 09:41:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d6b4faa-5124-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 11:40:15 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-3FGA5yS9Nvm9-naxw_QUsA-1; Fri, 21 Oct 2022 05:41:07 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF596185A7AE;
 Fri, 21 Oct 2022 09:41:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A437540F156;
 Fri, 21 Oct 2022 09:41:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8F84E21E675B; Fri, 21 Oct 2022 11:41:05 +0200 (CEST)
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
X-Inumbo-ID: 5d6b4faa-5124-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666345274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tnyF06QSYZDYFQcAMt2EoCOKDh9Ezhx8aWqcenWAlts=;
	b=hXOuMdHRiALieEJIeR6Evr/7bIhWEkHzikM1zVl/n3QkQ0NF6qRGZRMjerQLq3aiNiKLXd
	VAAsNlq50UtdsSzlpEMDmUrd6LBV+9R0AtoaYPo5p2RDZIz75tNNqV9K4jxuKDHxpBK40v
	M7kP1dGaqhOhAlObm4zTBzKCQUg8yrw=
X-MC-Unique: 3FGA5yS9Nvm9-naxw_QUsA-1
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,  qemu-devel@nongnu.org,  Paul Durrant
 <paul@xen.org>,  Thomas Huth <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Ber?=
 =?utf-8?Q?rang=C3=A9?=
 <berrange@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
  Greg Kurz <groug@kaod.org>,  Stefano Stabellini <sstabellini@kernel.org>,
  David Gibson <david@gibson.dropbear.id.au>,  Eric Blake
 <eblake@redhat.com>,  xen-devel@lists.xenproject.org,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Samuel Thibault <samuel.thibault@ens-lyon.org>,
  Anthony Perard <anthony.perard@citrix.com>,  Stefano Brivio
 <sbrivio@redhat.com>
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
References: <20221020162558.123284-1-lvivier@redhat.com>
	<20221020162558.123284-18-lvivier@redhat.com>
	<87pmel4th4.fsf@pond.sub.org>
	<52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
	<87lep935hn.fsf@pond.sub.org>
	<30b445bb-a268-d2c9-209f-3b2390746749@redhat.com>
Date: Fri, 21 Oct 2022 11:41:05 +0200
In-Reply-To: <30b445bb-a268-d2c9-209f-3b2390746749@redhat.com> (Laurent
	Vivier's message of "Fri, 21 Oct 2022 11:36:24 +0200")
Message-ID: <87bkq5345q.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

Laurent Vivier <lvivier@redhat.com> writes:

> On 10/21/22 11:12, Markus Armbruster wrote:
>> Cc: Stefano Brivio
>> 
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>>> On 10/21/22 07:48, Markus Armbruster wrote:
>>>> Laurent Vivier <lvivier@redhat.com> writes:
>>>>
>>>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>>>>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
>>>>
>>>> Use cases?
>>>
>>> This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.
>> 
>> Let's add something like this to the commit message:
>> 
>>      This lets libvirt notice when the connection is lost somehow, and
>>      restart the peer (such as passt).
>> 
>> Who's working on the libvirt part?
>> 
>>> I have also a patch to add a "reconnect=seconds" option, but I didn't want to add it to this series.
>> 
>> It's okay to mention future work in commit messages, but not required.
>> 
>>>> Could similar event signalling be useful for other kinds of netdev
>>>> backends?
>>>
>>> I was wondering, but it becomes more complicated to be generic.
>> 
>> Making something complicated and generic where a simpler special
>> solution would do is the worst.
>> 
>> Not quite as bad (but still plenty bad) is making a few special
>> solutions first, then replace them all with a generic solution.
>> 
>> I believe we should have a good, hard think on possible applications of
>> a generic solution now.
>> 
>> There is no need to hold back this series for that.
>> 
>> If we conclude a generic solution is called for, we better replace this
>> special solution before it becomes ABI.  Either by replacing it before
>> we release it, or by keeping it unstable until we replace it.
>> 
>
> I sent the v14 few minutes before this email.
>
> Jason, perhaps we can remove PATCH 17 from the series and only merge PATCH 1 to 16?
>
> I will resend PATCH 17 in a new series with the reconnect option patch once this series is 
> merged.

Certainly works for me.  Thanks for your patience!


