Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6B46A7D9F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 10:25:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504778.777147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfBa-0002nX-Pp; Thu, 02 Mar 2023 09:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504778.777147; Thu, 02 Mar 2023 09:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfBa-0002kx-M1; Thu, 02 Mar 2023 09:25:14 +0000
Received: by outflank-mailman (input) for mailman id 504778;
 Thu, 02 Mar 2023 09:25:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKVd=62=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pXfBZ-0002k0-CJ
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 09:25:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21800e61-b8dc-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 10:25:11 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so1088475wmq.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 01:25:11 -0800 (PST)
Received: from [192.168.18.179] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 h8-20020adff188000000b002c54241b4fesm14573977wro.80.2023.03.02.01.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 01:25:10 -0800 (PST)
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
X-Inumbo-ID: 21800e61-b8dc-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UgUMEt+prO6c8gKv0UVNWeB2aWOakOZG0Q9kLxhGLG4=;
        b=HyKcX4ZHkkLBYAq3Cg96RXW3o4GQXr3Gdhv6X4bin2xWdwTo9fe4px1QtV1jgjLg2p
         NkX1mGSXsHmeaXQqJLJHBiI+WosGNhMt8sLHrBw9u7MAFp1lAq9vlVQ15m5o7bWv6ct5
         222lY4uSauT0/S53otZEO6UY+o1PPBIMievqtNaCA5umyHeO51Q5IRBNX9YHSttqb+lD
         g/fdLkKFSc5i1/ysQ79PR9XX+jwKTOOpzjAS71yppz+Gt/PQfpylJdrflf755r9iUrAZ
         aveN8pvHx5kwAptAxbbxEXi7pvl9sQZVh+jbXzIXurU/Z8Mg80xbYSSo1SdYvpsj7mVe
         rXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgUMEt+prO6c8gKv0UVNWeB2aWOakOZG0Q9kLxhGLG4=;
        b=qBbRWJV8Uvfx5ojLfOix8VntGtDRkHGkdRsllWbHCOmMT8/122aCi5JOHcbiOWRFtD
         uEjK1Mpu34OXvFpLn3MlqPVS6faXa27z1CLsh7PUo0IAUxsAoGXLqFyBQy8TSrS9vs90
         AWnI0UrS+OI/DtS28WmbWmOXi/TnMlRwpsUo1bsr531Enru+G3st7wg1ZlHULLFBf8D8
         mR2bww2nKgbEgIlRXvvMA07lrX/OmIHXbAw+DKsrPvZDybEdugnt3SVbjTz8BbGzh9wk
         lbYEA2FMc2RAIxg+I6A5qy3cfiGab6G43Ki0AkzF3NwOHYlC0grYxxG+EnDgCcHD0/po
         SPEg==
X-Gm-Message-State: AO0yUKXNBSqVjUxE4TOI2/2N6zErcbQ7R0/qwASWrux1Hvyl3a9cyAsB
	H5O80OgON6x6TAePapaGcY4=
X-Google-Smtp-Source: AK7set8Gs71EI97gGKz//p+SnKtHJExEpiuw4ZbEyGboVmiugqZ+A47ms1BJzSpT+vMCZdmFjXA1fg==
X-Received: by 2002:a05:600c:81e:b0:3e2:201a:5bce with SMTP id k30-20020a05600c081e00b003e2201a5bcemr7299439wmp.40.1677749110852;
        Thu, 02 Mar 2023 01:25:10 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c5ba665d-f385-8ed5-9f4e-acac9b7c6f62@xen.org>
Date: Thu, 2 Mar 2023 09:25:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v6 4/4] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Amit Shah <amit@kernel.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>,
 "open list:Old World (g3beige)" <qemu-ppc@nongnu.org>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-5-alxndr@bu.edu>
 <20230301155442-mutt-send-email-mst@kernel.org>
Organization: Xen Project
In-Reply-To: <20230301155442-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2023 20:54, Michael S. Tsirkin wrote:
> On Sat, Feb 04, 2023 at 11:07:37PM -0500, Alexander Bulekov wrote:
>> This protects devices from bh->mmio reentrancy issues.
>>
>> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 

Xen parts...

Reviewed-by: Paul Durrant <paul@xen.org>


