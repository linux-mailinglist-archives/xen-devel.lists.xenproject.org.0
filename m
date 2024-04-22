Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD858AE9C9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710149.1110122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHOY-00075B-El; Tue, 23 Apr 2024 14:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710149.1110122; Tue, 23 Apr 2024 14:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHOY-00072P-Ay; Tue, 23 Apr 2024 14:45:18 +0000
Received: by outflank-mailman (input) for mailman id 710149;
 Mon, 22 Apr 2024 16:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDho=L3=gmail.com=willemdebruijn.kernel@srs-se1.protection.inumbo.net>)
 id 1ryx0s-0000Ls-9c
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 16:59:30 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae6ded0f-00c9-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 18:59:29 +0200 (CEST)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-69b514d3cf4so40443876d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 09:59:29 -0700 (PDT)
Received: from localhost (164.146.150.34.bc.googleusercontent.com.
 [34.150.146.164]) by smtp.gmail.com with ESMTPSA id
 s16-20020a0cdc10000000b006a0426f2bdasm4405853qvk.57.2024.04.22.09.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:59:27 -0700 (PDT)
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
X-Inumbo-ID: ae6ded0f-00c9-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713805168; x=1714409968; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrIzzRd5SEQLFvdzQYqOFzNQkQZWaPc3JGD8u2+BkdA=;
        b=AxVsevf6CqM+ElXLo237LjSLkMWx5SCZK64HaoqFiCThTY3wq5iNl4p5zRkWqnCM3e
         jMZq9p7ki10W/Sni6Wgb81XhZcV5cXywMPjVLroxnbQRfLTf+ru+noinv90XZCtt91+F
         v+0PQ9dazNXhIY2BlD2N0RLWSSVckFXdZnq5yQ0JlHwviTu2Vjdu2fUxSTt2udHm27dB
         zx/akvG88LViiXcA66swsHXy0nKU1LSwV6d4stVl0QbmiavgjSK/bEp+HUiddj/YTC3R
         QFKNwVOk73h3QE98FpnzxG53SBNlYn7Qly2oeAjKYZ69wqCPiB/C0TL89H3TkDwH3wQm
         917w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713805168; x=1714409968;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mrIzzRd5SEQLFvdzQYqOFzNQkQZWaPc3JGD8u2+BkdA=;
        b=XmSTXIU1vrVj7YrMbtPliNV5dI83+qHfEHpDeWBkUYz7u0wYadKUpFiMBP7dXgHqh0
         kuVlhgUd1d7kdnNx2ugRaggjCaL+7N/LvvHLXyW7itJdNx/64MIAtoRNqlWpkdPPSiFG
         EQi2FpyYzt+QWSK7QNZVIUf51Ea3pst4OL5la6/vjbxxnGlpFuDg8PoLT2FMfBrEdFvT
         ViBGSa6lGkhphOZGia2BuCmQca+5mxxJCKOPQ5ZRLXqlORrhY4p8VMKFpOF6nBpTRP3d
         u3WDwSeFDel0PEiIuzgqpX/d7pG58jBy4PjwxF+FVJxlL51Pv1Yn/iY5N2mY/7w5q+hD
         sjqg==
X-Forwarded-Encrypted: i=1; AJvYcCUEQGYPZV0ny3lpnP2sQxYt4ei85ekkKFjtnuBlzs/GZ0qoqn2/IYPlhLAkNTM9JbPoGwECPmBtb12zhigJpEgxF6MEbrhZnsuYPHA+L0I=
X-Gm-Message-State: AOJu0YzGVJRMiVRYcBIoq6jFXcZxwQ8RgwYggKfOJ3Qr1OJXYl1+ehsZ
	9vZztX/+8uhBEm71E3ZdvtVdfhhOaIv4F5awZmq6RA17hmHzanLV
X-Google-Smtp-Source: AGHT+IHHhU+Nvb87eCaQ76wWE1qXHzhzlsCm3OuWWbw2sH1hLhYIGaE9ghQG7Vrg+ndmJ6yOx+FQnA==
X-Received: by 2002:ad4:524f:0:b0:69b:12a0:296f with SMTP id s15-20020ad4524f000000b0069b12a0296fmr10630701qvq.54.1713805168003;
        Mon, 22 Apr 2024 09:59:28 -0700 (PDT)
Date: Mon, 22 Apr 2024 12:59:27 -0400
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
Message-ID: <6626976f4e91a_75392949e@willemb.c.googlers.com.notmuch>
In-Reply-To: <a62015541de49c0e2a8a0377a1d5d0a5aeb07016.1713369317.git.asml.silence@gmail.com>
References: <cover.1713369317.git.asml.silence@gmail.com>
 <a62015541de49c0e2a8a0377a1d5d0a5aeb07016.1713369317.git.asml.silence@gmail.com>
Subject: Re: [PATCH io_uring-next/net-next v2 1/4] net: extend ubuf_info
 callback to ops structure
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Pavel Begunkov wrote:
> We'll need to associate additional callbacks with ubuf_info, introduce
> a structure holding ubuf_info callbacks. Apart from a more smarter
> io_uring notification management introduced in next patches, it can be
> used to generalise msg_zerocopy_put_abort() and also store
> ->sg_from_iter, which is currently passed in struct msghdr.
> 
> Reviewed-by: Jens Axboe <axboe@kernel.dk>
> Reviewed-by: David Ahern <dsahern@kernel.org>
> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

