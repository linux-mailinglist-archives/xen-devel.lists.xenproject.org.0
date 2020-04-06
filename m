Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7297B19FAC8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 18:51:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLUxX-0005qu-3W; Mon, 06 Apr 2020 16:50:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oxme=5W=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jLUxV-0005qp-PR
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 16:50:49 +0000
X-Inumbo-ID: c49d4294-7826-11ea-8009-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c49d4294-7826-11ea-8009-12813bfff9fa;
 Mon, 06 Apr 2020 16:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586191848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orytk2Y2xJ8Iin2kpqW6vpjbDaz8+RpHVBd36rCh+ls=;
 b=Yu8rT/I6H85EkZlC+UsRG7E7sd5RfT45MprPegzbyRew1mMnIBfMvEAF2wmUqTqiZDRoW4
 KmmMQxxMDP90gI78fZUxqiHdbqDrqOHK1hVMG0BwDW8TmoW6jROqGH656ZsSCJ+31aiwUI
 XCsTP+uSChs1yd15qZFvLLU50wA8kL0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-xzCExvTfPnW00nkoSHP3zg-1; Mon, 06 Apr 2020 12:50:44 -0400
X-MC-Unique: xzCExvTfPnW00nkoSHP3zg-1
Received: by mail-wr1-f72.google.com with SMTP id w12so80584wrl.23
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2020 09:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=orytk2Y2xJ8Iin2kpqW6vpjbDaz8+RpHVBd36rCh+ls=;
 b=diWof5/mpZkNF+/EpfQ9gxho2jJGMEjcdBzcONGLe2K0Mat8XUI6EByUmHbufLw1Jn
 52NOig7Q9hg2wEXixQZz7z5GofDM5WVm6WV5/XAUe/ci94lEszGQtVB052xdCG33Xoxa
 lsR7Mvjtlu9cTSyF2J/kC/pDFFXPD2P62gH9lCrB/hlfG/ZqrXin0VtP5Wb1+imXqBYl
 vZVVzYRAN05r2wYT8bIPn9XO2LmrTlY8usV1IA0fidBqLE8lmtRlTqGEwiqQQp4e3Xh7
 DCZgP6xtoBxrazcip5ReT/wsryZVtO+8r6lyYFS7tAmjT9HZ7tLjK4DcpbLDUHN+9DGW
 l/gQ==
X-Gm-Message-State: AGi0PuYgJgxYafp7LDZsfuCABEeKMb0F589zyZ6u2OGBz/W9KiXttvBK
 NGUYfpGtVM30Dn5OXGKtDodIWtzdyv32D4BD5t5OjXfKpizf2zIIyHx9Dxij0NAi30RbQpFkjVI
 TpXZaVovrGebNKUWuXCKSS7EsjEU=
X-Received: by 2002:a05:600c:2112:: with SMTP id
 u18mr90558wml.112.1586191843565; 
 Mon, 06 Apr 2020 09:50:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypIagRZGzpqiXca97dqed7Bqei3oXsmnxZYsP6eT1lEFxcv0AXz4A/MsQHGOCzuPNiPyb2Dwqg==
X-Received: by 2002:a05:600c:2112:: with SMTP id
 u18mr90541wml.112.1586191843333; 
 Mon, 06 Apr 2020 09:50:43 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id i97sm22827109wri.1.2020.04.06.09.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 09:50:42 -0700 (PDT)
Subject: Re: [PATCH for-5.0] xen-block: Fix uninitialized variable
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20200406164207.1446817-1-anthony.perard@citrix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <325e0ffb-2f1b-cbfd-6b24-0d912a9aabe2@redhat.com>
Date: Mon, 6 Apr 2020 18:50:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200406164207.1446817-1-anthony.perard@citrix.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 4/6/20 6:42 PM, Anthony PERARD wrote:
> Since 7f5d9b206d1e ("object-add: don't create return value if
> failed"), qmp_object_add() don't write any value in 'ret_data', thus
> has random data. Then qobject_unref() fails and abort().
> 
> Fix by initialising 'ret_data' properly.

Or move qobject_unref() after the error check?

-- >8 --
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 07bb32e22b..f3f1cbef65 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -869,7 +869,6 @@ static XenBlockIOThread 
*xen_block_iothread_create(const char *id,
      qdict_put_str(opts, "id", id);
      qmp_object_add(opts, &ret_data, &local_err);
      qobject_unref(opts);
-    qobject_unref(ret_data);

      if (local_err) {
          error_propagate(errp, local_err);
@@ -878,6 +877,7 @@ static XenBlockIOThread 
*xen_block_iothread_create(const char *id,
          g_free(iothread);
          return NULL;
      }
+    qobject_unref(ret_data);

      return iothread;
  }
---

> 
> Fixes: 5f07c4d60d09 ("qapi: Flatten object-add")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>   hw/block/xen-block.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 07bb32e22b51..99cb4c67cb09 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -860,7 +860,7 @@ static XenBlockIOThread *xen_block_iothread_create(const char *id,
>       XenBlockIOThread *iothread = g_new(XenBlockIOThread, 1);
>       Error *local_err = NULL;
>       QDict *opts;
> -    QObject *ret_data;
> +    QObject *ret_data = NULL;
>   
>       iothread->id = g_strdup(id);
>   
> 


