Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E98445B5A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 21:56:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221871.383780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mijmS-0003gS-4V; Thu, 04 Nov 2021 20:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221871.383780; Thu, 04 Nov 2021 20:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mijmS-0003du-16; Thu, 04 Nov 2021 20:56:16 +0000
Received: by outflank-mailman (input) for mailman id 221871;
 Thu, 04 Nov 2021 20:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dXG6=PX=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1mijmQ-0003do-Ft
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 20:56:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1ee97f3-3db1-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 21:56:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-E_i9VflPPPOlxP1i9h_oYw-1; Thu, 04 Nov 2021 16:56:06 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A3121006AA3;
 Thu,  4 Nov 2021 20:56:03 +0000 (UTC)
Received: from redhat.com (ovpn-112-104.phx2.redhat.com [10.3.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D6EB1017CF5;
 Thu,  4 Nov 2021 20:54:30 +0000 (UTC)
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
X-Inumbo-ID: a1ee97f3-3db1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636059367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IfcsgPcnlI/5XKJkTvjUo3gZAIv46LvfuSL2K44V28E=;
	b=E+GlgoTrurMjNLoiwiLBJwIJuYPeIDB2ruTvzl0HVcx6KajwxG/564tnS4AjeH6IvvJdpz
	wJBb8E24V0+yMu1jhxOZ0q9LH+b0zJID47Z/U6s07ikeJvCdNLKCGx7PMTeOUYDBp3J64O
	JClb2WVMj7vs4oObf3xdqzSemONGMXY=
X-MC-Unique: E_i9VflPPPOlxP1i9h_oYw-1
Date: Thu, 4 Nov 2021 15:54:28 -0500
From: Eric Blake <eblake@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	kvm@vger.kernel.org, Peter Xu <peterx@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Hyman =?utf-8?B?SHVhbmcow6nCu+KAnsOl4oC54oChKQ==?= <huangy81@chinatelecom.cn>
Subject: Re: [PULL 04/20] migration/dirtyrate: introduce struct and adjust
 DirtyRateStat
Message-ID: <20211104205428.stcjcd54moksfep2@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
 <20211101220912.10039-5-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211101220912.10039-5-quintela@redhat.com>
User-Agent: NeoMutt/20211029-10-fe244a
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

On Mon, Nov 01, 2021 at 11:08:56PM +0100, Juan Quintela wrote:
> From: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
> 
> introduce "DirtyRateMeasureMode" to specify what method should be
> used to calculate dirty rate, introduce "DirtyRateVcpu" to store
> dirty rate for each vcpu.
> 
> use union to store stat data of specific mode
> 
> Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
> Message-Id: <661c98c40f40e163aa58334337af8f3ddf41316a.1624040308.git.huangy81@chinatelecom.cn>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  qapi/migration.json   | 30 +++++++++++++++++++++++++++
>  migration/dirtyrate.h | 21 +++++++++++++++----
>  migration/dirtyrate.c | 48 +++++++++++++++++++++++++------------------
>  3 files changed, 75 insertions(+), 24 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 9aa8bc5759..94eece16e1 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1731,6 +1731,21 @@
>  { 'event': 'UNPLUG_PRIMARY',
>    'data': { 'device-id': 'str' } }
>  
> +##
> +# @DirtyRateVcpu:
> +#
> +# Dirty rate of vcpu.
> +#
> +# @id: vcpu index.
> +#
> +# @dirty-rate: dirty rate.
> +#
> +# Since: 6.1

I'm a bit late on the review, since this pull request is already in.
We'll want a followup patch that changes this to mention 6.2, to
correctly match the release that will first have it.  Such a followup
is safe during freeze, since it is doc-only.

> +#
> +##
> +{ 'struct': 'DirtyRateVcpu',
> +  'data': { 'id': 'int', 'dirty-rate': 'int64' } }
> +
>  ##
>  # @DirtyRateStatus:
>  #

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


