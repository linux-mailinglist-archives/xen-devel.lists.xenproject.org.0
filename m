Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E58ADB94
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 03:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710275.1109433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz54r-0006Wt-SO; Tue, 23 Apr 2024 01:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710275.1109433; Tue, 23 Apr 2024 01:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz54r-0006UR-Pk; Tue, 23 Apr 2024 01:36:09 +0000
Received: by outflank-mailman (input) for mailman id 710275;
 Tue, 23 Apr 2024 01:36:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dJWU=L4=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1rz54q-0006UL-A9
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 01:36:08 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9bd2174-0111-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 03:36:06 +0200 (CEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2ab48c14332so801515a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 18:36:06 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.194]) by smtp.gmail.com with ESMTPSA id
 f21-20020a170902ab9500b001e5119c1923sm8777775plr.71.2024.04.22.18.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 18:36:03 -0700 (PDT)
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
X-Inumbo-ID: d9bd2174-0111-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1713836164; x=1714440964; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9oPaH/VV1Sgs6JhGxcg9NL/ZQE2v/wkBZW2pxzw1II=;
        b=tj2ya1kYgNKuQBkYfON4Y0TEWKz/hRBEd9glieed76F6zW4/GX//LF9o/jx4cs2aIO
         mc2GTNbsdQHShWWJs49C4C2QCj3BiOPZVa2WBr4cLOni4hkGO1EjuVSDmXrYvkPR3RN0
         zDqiOXj4n4n2XIpCLUE3En7Djh+6W58Ukx5tkSxBk2dly4AiqYDS4t5zWhX2j7wOLsDv
         3iP7oKZTrVolCfOFq+lF9eWgwvOUEgh3uslTzj4HQUER52qmn1+3CWRkaSDTm+1DEDqS
         yXuIYf2llZG9ItrzJ1PbrkxX7nRM4s5+peKAijd+Fbxj/miaD+45x1lgcRfKvjzd0FO3
         +h+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713836164; x=1714440964;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9oPaH/VV1Sgs6JhGxcg9NL/ZQE2v/wkBZW2pxzw1II=;
        b=qbAj6MLgFLslEJwH6NrnYmpVEjCRtzmDSya9IVDY3t3N9DDpBI4++vc/ym0LX2Hg1A
         WHmoe49SS4c4XganT8hxN0xAlR77ilKjMjUeMVspiaAcIUoxzK3jybclZtHnUl39fWBy
         aHb0SiDtixX3dYiWOzChfa1CH9Y/cnfkdRdpRWMSHJ53vhbG1ImYnSju3AMNBWIQCYFw
         SEuW5Wazyh6s/9Io1lw+VZrtv0+tT3kzKMIzFa7HcWE5ZGpVpGX8Tptvje99vGOqR3mi
         vixhOx7Tw6wAaBLoF5juXg3cieA4mJqZL1a6gtoSZNDovOLZXuRJcCbiahbat91h2KKY
         zhQg==
X-Forwarded-Encrypted: i=1; AJvYcCWv4QQ4EsS3biM/ZcDibxi6v9XPTpmP+0/wEuPDKu0AQNKAy1ZJmQyEg4qoUHptYaBe0ykSgqArjJ5PFejTJGstjnikGOlGllHS+CEDrgI=
X-Gm-Message-State: AOJu0YxMzzdUYqHIfyA8MLJethtFVGPb3X3TJcrICGGQK0xJBlDT4XHj
	LC7GeuJwAJLMPOlgMqCqaL9KTjuWYPdD8i3ki1ThW8M9IcNFM1T3Oo/aZAK69xo=
X-Google-Smtp-Source: AGHT+IGzlYpawNDmZcr5CUIaLSVmPzj5i1QCymzAQ8rNfxRGM71jaLD4N1FTIjMDD+MiT7VbGVUzTQ==
X-Received: by 2002:a17:902:ec84:b0:1e8:4063:6ded with SMTP id x4-20020a170902ec8400b001e840636dedmr14042378plg.1.1713836164318;
        Mon, 22 Apr 2024 18:36:04 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, netdev@vger.kernel.org, 
 Pavel Begunkov <asml.silence@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Wei Liu <wei.liu@kernel.org>, 
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, 
 kvm@vger.kernel.org
In-Reply-To: <cover.1713369317.git.asml.silence@gmail.com>
References: <cover.1713369317.git.asml.silence@gmail.com>
Subject: Re: (subset) [PATCH io_uring-next/net-next v2 0/4] implement
 io_uring notification (ubuf_info) stacking
Message-Id: <171383616279.27114.3831538607187347697.b4-ty@kernel.dk>
Date: Mon, 22 Apr 2024 19:36:02 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd


On Fri, 19 Apr 2024 12:08:38 +0100, Pavel Begunkov wrote:
> Please, don't take directly, conflicts with io_uring.
> 
> To have per request buffer notifications each zerocopy io_uring send
> request allocates a new ubuf_info. However, as an skb can carry only
> one uarg, it may force the stack to create many small skbs hurting
> performance in many ways.
> 
> [...]

Applied, thanks!

[3/4] io_uring/notif: simplify io_notif_flush()
      commit: 5a569469b973cb7a6c58192a37dfb8418686e518
[4/4] io_uring/notif: implement notification stacking
      commit: 6fe4220912d19152a26ce19713ab232f4263018d

Best regards,
-- 
Jens Axboe




