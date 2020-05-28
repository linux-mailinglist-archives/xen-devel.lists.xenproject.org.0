Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E63F1E6E14
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:47:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQMc-0003nO-6c; Thu, 28 May 2020 21:46:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HyPx=7K=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1jeQMa-0003nI-Je
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:46:56 +0000
X-Inumbo-ID: c00db8f6-a12c-11ea-9947-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c00db8f6-a12c-11ea-9947-bc764e2007e4;
 Thu, 28 May 2020 21:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590702415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V0pRPNGUX2oCMzddlIiBI2W3R+cSD6MK8vxPHoVUMtw=;
 b=A/rr5iwV7cw3J4HqCwU6nJwSsEatKlgqL4gVzOpGTOPZWlhGm/3JS9dzETo9uakX7drCsj
 F0CmjZP8YBvi1IbVn+pCsc3x10a6k49vOb+rjJLjFUkmyFlk+7eW2yjNfOEzeOIE8GQedC
 9ObHQcsCmtUsg15myOSrZcJg4PPGDCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-wkXx4XWbP_GhfeGr0WPl_g-1; Thu, 28 May 2020 17:46:54 -0400
X-MC-Unique: wkXx4XWbP_GhfeGr0WPl_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5536835B40;
 Thu, 28 May 2020 21:46:52 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1952D7E467;
 Thu, 28 May 2020 21:46:43 +0000 (UTC)
Subject: Re: [PATCH v7 5/8] qdev-properties: make blocksize accept size
 suffixes
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20200528213946.1636444-1-rvkagan@yandex-team.ru>
 <20200528213946.1636444-6-rvkagan@yandex-team.ru>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a4e3fa72-7ad2-8be0-d714-14505be1373b@redhat.com>
Date: Thu, 28 May 2020 16:46:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200528213946.1636444-6-rvkagan@yandex-team.ru>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
> It appears convenient to be able to specify physical_block_size and
> logical_block_size using common size suffixes.
> 
> Teach the blocksize property setter to interpret them.  Also express the
> upper and lower limits in the respective units.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


