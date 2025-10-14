Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57BBD7FA2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 09:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142549.1476670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8ZgF-0008EQ-A2; Tue, 14 Oct 2025 07:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142549.1476670; Tue, 14 Oct 2025 07:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8ZgF-0008CL-7U; Tue, 14 Oct 2025 07:42:47 +0000
Received: by outflank-mailman (input) for mailman id 1142549;
 Tue, 14 Oct 2025 07:42:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+hc=4X=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1v8ZgD-0008CE-Hx
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 07:42:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e82a9eb-a8d1-11f0-9d15-b5c5bf9af7f9;
 Tue, 14 Oct 2025 09:42:44 +0200 (CEST)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-forSofwjOGKuPF4o34xyag-1; Tue,
 14 Oct 2025 03:42:37 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 02D341800366; Tue, 14 Oct 2025 07:42:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.19])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4F1D71800447; Tue, 14 Oct 2025 07:42:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CF36621E6A27; Tue, 14 Oct 2025 09:42:32 +0200 (CEST)
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
X-Inumbo-ID: 5e82a9eb-a8d1-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760427763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SHUotR2nJ/K6X1C0pnOd/lK6tY2NnaYZKDc/xGnWPuI=;
	b=DolBCx8ocLqKyr8wV6hj9yN6zj2F9AriyDzVzgeIyZNUHgoAJNs9IETg+dOUKONyk2AcvA
	qkx2WyTgSGP4HXy6/CvnVtZpeAsPDqnOkEoiL0NxDTTBwDEqH5ThMZ6DkpVUY/IqYJUJ5N
	XTRW2uabVmUW/s5a53NWG8sX33scb2o=
X-MC-Unique: forSofwjOGKuPF4o34xyag-1
X-Mimecast-MFC-AGG-ID: forSofwjOGKuPF4o34xyag_1760427756
From: Markus Armbruster <armbru@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,  sstabellini@kernel.org,  anthony@xenproject.org,
  paul@xen.org,  edgar.iglesias@gmail.com,  xen-devel@lists.xenproject.org,
  qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
In-Reply-To: <20C81C5B-912C-49B3-B50A-867C06C134B1@gmail.com> (Bernhard
	Beschow's message of "Mon, 13 Oct 2025 19:17:28 +0000")
References: <20250729111226.3627499-1-armbru@redhat.com>
	<877bwz6oqy.fsf@pond.sub.org>
	<20C81C5B-912C-49B3-B50A-867C06C134B1@gmail.com>
Date: Tue, 14 Oct 2025 09:42:32 +0200
Message-ID: <87tt02ylnb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Bernhard Beschow <shentey@gmail.com> writes:

> Am 13. Oktober 2025 11:10:45 UTC schrieb Markus Armbruster <armbru@redhat.com>:
>>Ping?
>>
>>Markus Armbruster <armbru@redhat.com> writes:
>>
>>> xenfb_mouse_event() has a switch statement whose controlling
>>> expression move->axis is an enum InputAxis.  The enum values are
>>> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
>>> case for both axes.  In addition, it has an unreachable default label.
>>> This convinces Coverity that move->axis can be greater than 1.  It
>>> duly reports a buffer overrun when it is used to subscript an array
>>> with two elements.
>>>
>>> Replace the unreachable code by abort().
>>>
>>> Resolves: Coverity CID 1613906
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>  hw/display/xenfb.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
>>> index 22822fecea..5e6c691779 100644
>>> --- a/hw/display/xenfb.c
>>> +++ b/hw/display/xenfb.c
>>> @@ -283,8 +283,7 @@ static void xenfb_mouse_event(DeviceState *dev, QemuConsole *src,
>>>                  scale = surface_height(surface) - 1;
>>>                  break;
>>>              default:
>>> -                scale = 0x8000;
>>> -                break;
>>> +                abort();
>
> Don't we prefer g_assert_not_reached() these days, for more expressiveness?

See https://lore.kernel.org/qemu-devel/87v7nbdwfx.fsf@pond.sub.org/

[...]


