Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D5D1E6E3D
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:57:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQX0-0004pr-DR; Thu, 28 May 2020 21:57:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HyPx=7K=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1jeQWy-0004pm-8C
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:57:40 +0000
X-Inumbo-ID: 3fd483c0-a12e-11ea-a843-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3fd483c0-a12e-11ea-a843-12813bfff9fa;
 Thu, 28 May 2020 21:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590703059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uy2/hCClOi0N+cvDZXjD2eV1wRJxIY+lbAjkHKJLR28=;
 b=h1V9ZGAuM0IrEHlw959s4QWtMtuxGKjTYbR415i4kmoY8g78MyxzEu7hlIFlUI5C8zjNDL
 jdnPeA5AD/ZNV85sNyGXfUHnQD8M9jUD8S8TAt7kkn8Votz3V2WFgaIoq6Om/BY9X1LYCS
 3vNCsUe0EvwKV/YOW5xfCW513N0Qye4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-r5kJoFc-NyGbktdslDHbpA-1; Thu, 28 May 2020 17:57:33 -0400
X-MC-Unique: r5kJoFc-NyGbktdslDHbpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CC2218FF660;
 Thu, 28 May 2020 21:57:31 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1F689CA0;
 Thu, 28 May 2020 21:57:22 +0000 (UTC)
Subject: Re: [PATCH v7 7/8] qdev-properties: add getter for size32 and
 blocksize
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20200528213946.1636444-1-rvkagan@yandex-team.ru>
 <20200528213946.1636444-8-rvkagan@yandex-team.ru>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d727b621-071e-e061-2c7f-d14798bdf681@redhat.com>
Date: Thu, 28 May 2020 16:57:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200528213946.1636444-8-rvkagan@yandex-team.ru>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/28/20 4:39 PM, Roman Kagan wrote:
> Add getter for size32, and use it for blocksize, too.
> 
> In its human-readable branch, it reports approximate size in
> human-readable units next to the exact byte value, like the getter for
> 64bit size does.
> 
> Adjust the expected test output accordingly.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
> v6 -> v7:
> - split out into separate patch [Eric]

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


