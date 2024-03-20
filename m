Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75958816AF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 18:40:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696073.1086669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzus-00077R-3f; Wed, 20 Mar 2024 17:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696073.1086669; Wed, 20 Mar 2024 17:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzus-000756-0z; Wed, 20 Mar 2024 17:39:54 +0000
Received: by outflank-mailman (input) for mailman id 696073;
 Wed, 20 Mar 2024 17:39:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z2Qb=K2=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1rmzuq-00074i-FW
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 17:39:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9a04aab-e6e0-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 18:39:50 +0100 (CET)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-lT-piUw6Oym9JcGnVqj80A-1; Wed, 20 Mar 2024 13:39:45 -0400
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-690c19ee50bso188526d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 10:39:45 -0700 (PDT)
Received: from x1n ([99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 jn10-20020ad45dea000000b00690dd47a41csm8107560qvb.86.2024.03.20.10.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 10:39:43 -0700 (PDT)
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
X-Inumbo-ID: d9a04aab-e6e0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710956389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LadTrEs32q6JuiUng9QgE0IesXnTjqGpv9qfMYEDVbA=;
	b=a5zRqAUfCmKNEazpk4etbOhASu7XmFuKj1DkCSaE+/+wiYCXIFkxN2g7+xA/a9aXTQOA2B
	2YkYPdl/UrDHRkiqm3/K4nZn2JvKza0b+jSnE2LIFzYKBQHj3Nbudsuj1Y0ATdSwyteqpP
	z5JEF23rVsdxkpv7prsbFKDVX2t1nVg=
X-MC-Unique: lT-piUw6Oym9JcGnVqj80A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710956385; x=1711561185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LadTrEs32q6JuiUng9QgE0IesXnTjqGpv9qfMYEDVbA=;
        b=BhTIr3Bm7xpeZ416C8q/Cs+6vIjwwwpDZH9BU/0yIl03CSONBovmq2UH4JZnl6CkLi
         MY+JEFsgkqLzjOjkghMnFB/GZ/izJcyvLdt9D0baNaTBME8Og1r5B8xNg2uB8Y/ontT5
         tzPJwH61p46BYhLf9eorncYhWv5DN/7wiY7XhsPQb3saGtv//bdmfPyh5WtQKygpGZX3
         ufXOZxYC3MhgyQ8PrEozTqDtVOIw9rLVuaWxMIJFXmumuk4p2Z8E7nyYj4ZxoxTC4GMe
         kDH1z/wHGSgKMCY3b1KbaYMLgb8mukJMDWFrSYXS+bqWpRDr804Ahs1cYvsQNu9JTm2o
         nVfw==
X-Forwarded-Encrypted: i=1; AJvYcCWuw6MAmFb56hazRDDgDhjLZG5SgBAXl84pMWPmux8ZpaYXILvHEzqQh0PInfJ6/Blwk5v+M6Ff+nLOcgskO9tmW77244DTGDz3jgciq24=
X-Gm-Message-State: AOJu0YzEBRwSPhbyX1DPSFXGoxN9xU6q6ufaWm7BTEfMPbK+NWkUeNCL
	Yt/+IKexkLWxNxYVmvCrBNU9op3V9y8p7aqRAeYLExUUuTnndz1noUZEpGPnoFd1dltIqhwZXEB
	o/wrIVQcY+EdSKfCawLpWWK7uV/d6ZrFYGNPNM0WpU8g4V6J7Z0MsrSH/RyppDpjW
X-Received: by 2002:a05:6214:3f85:b0:690:9db6:f410 with SMTP id ow5-20020a0562143f8500b006909db6f410mr6764867qvb.3.1710956384655;
        Wed, 20 Mar 2024 10:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLZ2jRy2HZB5vFRERmbsQfn7UkuWfj7vRUfuSEG/rE4h7BJgEFptrr/T99J5Y/I3ZjhMxHSg==
X-Received: by 2002:a05:6214:3f85:b0:690:9db6:f410 with SMTP id ow5-20020a0562143f8500b006909db6f410mr6764835qvb.3.1710956384209;
        Wed, 20 Mar 2024 10:39:44 -0700 (PDT)
Date: Wed, 20 Mar 2024 13:39:41 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>, Avihai Horon <avihaih@nvidia.com>,
	Markus Armbruster <armbru@redhat.com>,
	Prasad Pandit <pjp@fedoraproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-9.1 v5 09/14] memory: Add Error** argument to
 .log_global_start() handler
Message-ID: <ZfsfXX48CEV5IfiJ@x1n>
References: <20240320064911.545001-1-clg@redhat.com>
 <20240320064911.545001-10-clg@redhat.com>
 <Zfr10JG2dTChsLVj@x1n>
 <d58d5134-dbfb-4c07-956a-5e8f3e230798@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d58d5134-dbfb-4c07-956a-5e8f3e230798@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 20, 2024 at 05:15:06PM +0100, Cédric Le Goater wrote:
> Sure, or I will in a v6. Markus had a comment on 8/14.

Yeah, I can handle both if they're the only ones.  Thanks,

-- 
Peter Xu


