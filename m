Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B419CBD2BBE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 13:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142231.1476417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8GSC-0002OQ-K9; Mon, 13 Oct 2025 11:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142231.1476417; Mon, 13 Oct 2025 11:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8GSC-0002Mc-Gb; Mon, 13 Oct 2025 11:11:00 +0000
Received: by outflank-mailman (input) for mailman id 1142231;
 Mon, 13 Oct 2025 11:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7+wn=4W=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1v8GSA-0002MU-UG
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 11:10:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47ea89d6-a825-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 13:10:53 +0200 (CEST)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-252-Qnji2KRmPtGMliE5tch9Hg-1; Mon,
 13 Oct 2025 07:10:50 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B1B6D180028C; Mon, 13 Oct 2025 11:10:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.19])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4D16D1954102; Mon, 13 Oct 2025 11:10:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E2B7E21E6A27; Mon, 13 Oct 2025 13:10:45 +0200 (CEST)
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
X-Inumbo-ID: 47ea89d6-a825-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760353852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wTXHtL7x9n8pBFTn/HV8u3bXuDvcA7YfgwtGE1bNnJQ=;
	b=OhC0QsDa2KmgQiabwidiVHKxzfbENNVzZaSc3lPqWPOqng1K9GenyHoQq12qSOQox4uG70
	vhvP0A3PfsW5MKB0hEWkuCP364SCpLgH+vufqhiWcdMqLNjdkXBNIvvQS/xC1ZM2NzLnuE
	eN5ZalvOb6p0HQYkD/xmWqy4jDaMIiU=
X-MC-Unique: Qnji2KRmPtGMliE5tch9Hg-1
X-Mimecast-MFC-AGG-ID: Qnji2KRmPtGMliE5tch9Hg_1760353849
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,  anthony@xenproject.org,  paul@xen.org,
  edgar.iglesias@gmail.com,  xen-devel@lists.xenproject.org,
  qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
In-Reply-To: <20250729111226.3627499-1-armbru@redhat.com> (Markus Armbruster's
	message of "Tue, 29 Jul 2025 13:12:26 +0200")
References: <20250729111226.3627499-1-armbru@redhat.com>
Date: Mon, 13 Oct 2025 13:10:45 +0200
Message-ID: <877bwz6oqy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Ping?

Markus Armbruster <armbru@redhat.com> writes:

> xenfb_mouse_event() has a switch statement whose controlling
> expression move->axis is an enum InputAxis.  The enum values are
> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
> case for both axes.  In addition, it has an unreachable default label.
> This convinces Coverity that move->axis can be greater than 1.  It
> duly reports a buffer overrun when it is used to subscript an array
> with two elements.
>
> Replace the unreachable code by abort().
>
> Resolves: Coverity CID 1613906
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/display/xenfb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
> index 22822fecea..5e6c691779 100644
> --- a/hw/display/xenfb.c
> +++ b/hw/display/xenfb.c
> @@ -283,8 +283,7 @@ static void xenfb_mouse_event(DeviceState *dev, QemuConsole *src,
>                  scale = surface_height(surface) - 1;
>                  break;
>              default:
> -                scale = 0x8000;
> -                break;
> +                abort();
>              }
>              xenfb->axis[move->axis] = move->value * scale / 0x7fff;
>          }


