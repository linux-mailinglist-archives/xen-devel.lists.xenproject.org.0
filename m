Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4C7405D20
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 21:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183504.331713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOPMW-0003gN-Px; Thu, 09 Sep 2021 19:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183504.331713; Thu, 09 Sep 2021 19:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOPMW-0003e3-Mc; Thu, 09 Sep 2021 19:05:28 +0000
Received: by outflank-mailman (input) for mailman id 183504;
 Thu, 09 Sep 2021 19:05:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Llr=N7=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1mOPMU-0003dx-S0
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 19:05:26 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e414308c-11a0-11ec-b1ea-12813bfff9fa;
 Thu, 09 Sep 2021 19:05:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-LUX5BKbeOsCm86MKlCjUSg-1; Thu, 09 Sep 2021 15:05:23 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9C581084680;
 Thu,  9 Sep 2021 19:05:21 +0000 (UTC)
Received: from redhat.com (ovpn-112-181.phx2.redhat.com [10.3.112.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D696A100EBBF;
 Thu,  9 Sep 2021 19:05:20 +0000 (UTC)
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
X-Inumbo-ID: e414308c-11a0-11ec-b1ea-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631214325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G51EAgedhr1FxW4ZOe/06ann1cdm4Vk3p7x/R0Gk14c=;
	b=hBjdeHJO7XxtaYty7OZkBsSibgjmiLNueQhMgWSqz8oLfnTa2XPrDMhCIMgHfQ4LRY9OmO
	k4O469p+piehf2kJTgD/MPZrNvn03pNNW/Ud+l5kImJ69F2MFCAAC/YT3bePsAF5q8SLUm
	xCG3Nv8BfA5XiR/MgH872wrshQGUPqA=
X-MC-Unique: LUX5BKbeOsCm86MKlCjUSg-1
Date: Thu, 9 Sep 2021 14:05:19 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 03/10] block: Use qemu_security_policy_taint() API
Message-ID: <20210909190519.il2urwstbivtjktc@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-4-philmd@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 09, 2021 at 01:20:17AM +0200, Philippe Mathieu-Daudé wrote:
> Add the BlockDriver::bdrv_taints_security_policy() handler.
> Drivers implementing it might taint the global QEMU security
> policy.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/block/block_int.h | 6 +++++-
>  block.c                   | 6 ++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index f1a54db0f8c..0ec0a5c06e9 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -169,7 +169,11 @@ struct BlockDriver {
>      int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
>                            Error **errp);
>      void (*bdrv_close)(BlockDriverState *bs);
> -
> +    /*
> +     * Return %true if the driver is withing QEMU security policy boundary,

within

> +     * %false otherwise. See: https://www.qemu.org/contribute/security-process/
> +     */
> +    bool (*bdrv_taints_security_policy)(BlockDriverState *bs);
>  
>      int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
>                                         Error **errp);

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


