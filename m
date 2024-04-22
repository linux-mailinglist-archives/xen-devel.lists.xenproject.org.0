Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCDF8AE9C8
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710152.1110128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHOY-000799-Md; Tue, 23 Apr 2024 14:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710152.1110128; Tue, 23 Apr 2024 14:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHOY-000755-Id; Tue, 23 Apr 2024 14:45:18 +0000
Received: by outflank-mailman (input) for mailman id 710152;
 Mon, 22 Apr 2024 17:01:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDho=L3=gmail.com=willemdebruijn.kernel@srs-se1.protection.inumbo.net>)
 id 1ryx2P-0001NP-Qw
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 17:01:05 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e76a8fbd-00c9-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 19:01:04 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-78edc0f9636so304242685a.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 10:01:04 -0700 (PDT)
Received: from localhost (164.146.150.34.bc.googleusercontent.com.
 [34.150.146.164]) by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a0a4c00b0078d6120fad0sm4468257qka.108.2024.04.22.10.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 10:01:03 -0700 (PDT)
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
X-Inumbo-ID: e76a8fbd-00c9-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713805264; x=1714410064; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qanenk0rOwdnK1RUZMGAjBSg7F/9gtEp8HpQbOgYLJw=;
        b=hWGmTiZ1/5A3aRkq1NvqEtV7cLcXJ1DzxN2Fx0FcL3Kz5soPi3IpN5iD82AOVucN4U
         T44D3taL7p5bZn+AmSOhKFKKmRyZ/bvxvbdXk2/hZoqzr/6it1NpoUwZzGMwmbjd43E8
         Gc1a+xPHrK+q5d0SVfYHKGzrNTZxbRYBndsn1zmq686xI68lvXWs2Ayb70Ng9pjaz9PP
         Lbl9+Em0ljJ5BBxOaxA8H+6sDYmnCAII+PpJqfkIsyiaXkXAiD/YBYe2W04S60GZNgbw
         BtkcEZrNTxsEHfAWhZMos2N7mj02faUNUKUsvgfKGei1VejL8jcQCVPIxXGFGuPPNWez
         d2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713805264; x=1714410064;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qanenk0rOwdnK1RUZMGAjBSg7F/9gtEp8HpQbOgYLJw=;
        b=j5xIor/7P60flt6rNRLjFB3XkCOBUInDMEtviGdUPxM274V4r5cooJ0Ar4/h7PdsyA
         6QyQslMoISabK6c19MmEd33OmlWadj2t7fnfMKt59HvbQzWvGD9k45gPzTV6Ei4T7TKh
         R2ILG3cSG3nk0dWwgXZZeUXf7ayDW5fTGj4qKBKSceMGrc96UWf0Sn0Wrzfwj2KPnga3
         kR/mZ7K2JZEDDaCWQKeUJoTgOWy6NpTsiDFYiH6fYPFUxT8r9Vy3CQ5bYUnsEVtS+YvC
         qkIGI9k9qiCJ6lAUZHTdY5fSGJe8C7DAnC0N4h3j8K/iN+SdaZuyvHifPqI7xKTCSPkM
         RV6g==
X-Forwarded-Encrypted: i=1; AJvYcCUFFw1PJtz+LuSzQ+nzD7TpYIn7nNY3ngvChk6ETSj6xeNco0XYY8u88KzYySOpicVjeYFwXQ3OLq4RVzDZVxVfs9x2WsMEaZsc9N9HR3w=
X-Gm-Message-State: AOJu0YzDCoZKc64TNKJLoRKe+8LIkYBaROHVfhArrDC9Z5r1YCTgfs8i
	VpihqIdNZu0GXItN0YIRtqILm8Uj3AWKtHHJZLDz70rR9gWf+ZXp
X-Google-Smtp-Source: AGHT+IFCpIo7/SLWyIv8N6OtBqSGdbVdoaFQ0NI9Dz45ssmy5gm1tR1kWrL5XUahomCwRIDa2Lt9fA==
X-Received: by 2002:a05:620a:4ac5:b0:78d:66b6:a786 with SMTP id sq5-20020a05620a4ac500b0078d66b6a786mr12207280qkn.35.1713805263653;
        Mon, 22 Apr 2024 10:01:03 -0700 (PDT)
Date: Mon, 22 Apr 2024 13:01:03 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 io-uring@vger.kernel.org, 
 netdev@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, 
 asml.silence@gmail.com, 
 "David S . Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, 
 David Ahern <dsahern@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, 
 Wei Liu <wei.liu@kernel.org>, 
 Paul Durrant <paul@xen.org>, 
 xen-devel@lists.xenproject.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, 
 virtualization@lists.linux.dev, 
 kvm@vger.kernel.org
Message-ID: <662697cf21177_753929488@willemb.c.googlers.com.notmuch>
In-Reply-To: <b7918aadffeb787c84c9e72e34c729dc04f3a45d.1713369317.git.asml.silence@gmail.com>
References: <cover.1713369317.git.asml.silence@gmail.com>
 <b7918aadffeb787c84c9e72e34c729dc04f3a45d.1713369317.git.asml.silence@gmail.com>
Subject: Re: [PATCH io_uring-next/net-next v2 2/4] net: add callback for
 setting a ubuf_info to skb
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Pavel Begunkov wrote:
> At the moment an skb can only have one ubuf_info associated with it,
> which might be a performance problem for zerocopy sends in cases like
> TCP via io_uring. Add a callback for assigning ubuf_info to skb, this
> way we will implement smarter assignment later like linking ubuf_info
> together.
> 
> Note, it's an optional callback, which should be compatible with
> skb_zcopy_set(), that's because the net stack might potentially decide
> to clone an skb and take another reference to ubuf_info whenever it
> wishes. Also, a correct implementation should always be able to bind to
> an skb without prior ubuf_info, otherwise we could end up in a situation
> when the send would not be able to progress.
> 
> Reviewed-by: Jens Axboe <axboe@kernel.dk>
> Reviewed-by: David Ahern <dsahern@kernel.org>
> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

