Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24648253410
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 17:55:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAxlT-0007Rx-4w; Wed, 26 Aug 2020 15:55:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9GxT=CE=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kAxlR-0007Rq-F6
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 15:55:05 +0000
X-Inumbo-ID: 1d2ee9c1-5cd7-4042-9131-10e029e29037
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1d2ee9c1-5cd7-4042-9131-10e029e29037;
 Wed, 26 Aug 2020 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598457303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ljKtsHBsPbJCq8hdAnIGGslKBWu27Z280vom/GSS2dg=;
 b=c+axYpy5DS/wTCF0ikJGcx9js/URgH1cq2Py0uoW5RSpb9vH4B8bVCQc0GOs4mUinAbmHF
 +ncy8UV4UReH09v1R7Kb56ifYZMNiwQk6TPkgnWwUTv3PFXvm8bSibY73kanls+FZ1YtfY
 sRi4MCFQq5TkJEJTdlq8hIdK/8Qn6tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-RMCnqFGTNkiW8ZMryoSYTg-1; Wed, 26 Aug 2020 11:55:01 -0400
X-MC-Unique: RMCnqFGTNkiW8ZMryoSYTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDB8810082E5;
 Wed, 26 Aug 2020 15:54:56 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1012D7049D;
 Wed, 26 Aug 2020 15:54:42 +0000 (UTC)
Date: Wed, 26 Aug 2020 11:54:41 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Jan Kiszka <jan.kiszka@web.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Fam Zheng <fam@euphon.net>, Beniamino Galvani <b.galvani@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Michael Walle <michael@walle.cc>, Andrzej Zaborowski <balrogg@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v3 72/74] [automated] Remove redundant
 instance_size/class_size fields
Message-ID: <20200826155441.GD642093@habkost.net>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-73-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200825192110.3528606-73-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 25, 2020 at 03:21:08PM -0400, Eduardo Habkost wrote:
> This will remove instance_size/class_size fields from TypeInfo
> variables when the value is exactly the same as the one in the
> parent class.
> 
> Generated by:
> 
>  $ ./scripts/codeconverter/converter.py -i \
>    --pattern=RedundantTypeSizes $(git grep -l TypeInfo -- '*.[ch]')
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

This patch triggers an assert due to code outside QOM core using
TypeInfo.instance_size directly.  Please ignore it by now.

Thanks to Roman Bolshakov for reporting the problem.

-- 
Eduardo


