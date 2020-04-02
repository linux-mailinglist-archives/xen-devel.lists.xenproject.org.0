Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE6919C401
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 16:27:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK0oZ-0005XJ-MF; Thu, 02 Apr 2020 14:27:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/k1p=5S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jK0oY-0005XA-Le
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 14:27:26 +0000
X-Inumbo-ID: 12cd16c4-74ee-11ea-9e09-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12cd16c4-74ee-11ea-9e09-bc764e2007e4;
 Thu, 02 Apr 2020 14:27:25 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id cw6so4348760edb.9
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2020 07:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=Gs5s/AzhrQY0MsAWHGCRh7EB5NuuIAx0gTTvncvqfKE=;
 b=gl/EXqahrI3LZRtHXzm7a3z4YJSAdAf27Dc661ub6stokk89cDWUnY7bjUvrGkf96I
 7i/EpB1jiIhkF67ojeY504MXIylH+M4bqUEgn60r3uZd/Oz2etLzEqQ2IaC1+86fhywE
 397kvjfV7wS+/SB1TCSZA5OceOj9TuDjDv92KhtEOAvUYW7744++uJD2GEkpLZRGnvsA
 WL0WovrXoZrfzthEJNHU5W+ywHscfycTaIWJKuAkBvAl1Bnbjv8QCn9Rc7zMoFFkRQOM
 vrxPAn9E707ugzCon5b4FR8a+rOavXIKCvpqmF5J32A3n0Tn4zS78gC2Rsv6uH8oUBSA
 tfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=Gs5s/AzhrQY0MsAWHGCRh7EB5NuuIAx0gTTvncvqfKE=;
 b=ZcEfBtNuLTxegM9UK28IwKsewNes+bVBWDQD4mQL5FG1uctxkNy/fkJXBSY8uahS1I
 P6RUTYOw086QIzEKyqBcNR8Ja9sICZbGYKC1AZbXdedWSACk2R876+lh3q4+qjk/W7o+
 H7XVAjDDx/Tz7mpMpI6R3lVpvWZPZMswCtFGhGiuSSYc6kd6Y0bhs/7MDOLa0QxdpsTj
 RzIJvPJTYvj3v2dNLSc1epxSBDFq3mIoX30rh80zDMdSH4K7oSW6pkitwi6i9JWwJrVf
 9w8fMYFK9sfq4vPRRQ+Du/AHbIcTsoxsqmMQW6eKq1fRDZhO18XZuwoOk6W9GLP32q18
 04Dg==
X-Gm-Message-State: AGi0PubjvizIc+wXf314vCFIET65Oc9mWhnia3LpZS/c7Gv6O5DJG3W3
 l5h3gRpeWx/+DDT7qsqHreQ=
X-Google-Smtp-Source: APiQypLuaThFpCbWKxMrtN/Q9dMNyMZEUOQLRr9AFvW3LtVMOz1qHh5CqF8QMja/YifoHG5k6yQl8w==
X-Received: by 2002:a17:906:eddb:: with SMTP id
 sb27mr3610618ejb.207.1585837645042; 
 Thu, 02 Apr 2020 07:27:25 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id f18sm1127971ejt.25.2020.04.02.07.27.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 07:27:24 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Anthony PERARD'" <anthony.perard@citrix.com>,
	<qemu-devel@nongnu.org>
References: <20200402130819.1216125-1-anthony.perard@citrix.com>
In-Reply-To: <20200402130819.1216125-1-anthony.perard@citrix.com>
Subject: RE: [PATCH for-5.0] xen-block: Fix double qlist remove
Date: Thu, 2 Apr 2020 15:27:22 +0100
Message-ID: <001801d608fa$d3f0d3f0$7bd27bd0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLmjVOS2S5Ry01+8mL39/r4UrwBIqZE2WIQ
Content-Language: en-gb
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
Reply-To: paul@xen.org
Cc: 'Kevin Wolf' <kwolf@redhat.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, 'Max Reitz' <mreitz@redhat.com>,
 'Stefan Hajnoczi' <stefanha@redhat.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Sent: 02 April 2020 14:08
> To: qemu-devel@nongnu.org
> Cc: qemu-stable@nongnu.org; Anthony PERARD <anthony.perard@citrix.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Paul Durrant <paul@xen.org>; Stefan Hajnoczi <stefanha@redhat.com>; Kevin
> Wolf <kwolf@redhat.com>; Max Reitz <mreitz@redhat.com>; xen-devel@lists.xenproject.org; qemu-
> block@nongnu.org
> Subject: [PATCH for-5.0] xen-block: Fix double qlist remove
> 
> Commit a31ca6801c02 ("qemu/queue.h: clear linked list pointers on
> remove") revealed that a request was removed twice from a list, once
> in xen_block_finish_request() and a second time in
> xen_block_release_request() when both function are called from
> xen_block_complete_aio(). But also, the `requests_inflight' counter is
> decreased twice, and thus became negative.
> 
> This is a bug that was introduced in bfd0d6366043, where a `finished'
> list was removed.
> 
> This patch simply re-add the `finish' parameter of
> xen_block_release_request() so that we can distinguish when we need to
> remove a request from the inflight list and when not.
> 
> Fixes: bfd0d6366043 ("xen-block: improve response latency")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

It looks to me like it would just be more straightforward to simply drop the QLIST_REMOVE and requests_inflight-- from
xen_block_release_request() and simply insist that xen_block_finish_request() is called in all cases (which I think means adding one
extra call to it in xen_block_handle_requests()).

  Paul

> ---
>  hw/block/dataplane/xen-block.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
> index 288a87a814ad..6cc089fc561f 100644
> --- a/hw/block/dataplane/xen-block.c
> +++ b/hw/block/dataplane/xen-block.c
> @@ -123,15 +123,19 @@ static void xen_block_finish_request(XenBlockRequest *request)
>      dataplane->requests_inflight--;
>  }
> 
> -static void xen_block_release_request(XenBlockRequest *request)
> +static void xen_block_release_request(XenBlockRequest *request, bool finish)
>  {
>      XenBlockDataPlane *dataplane = request->dataplane;
> 
> -    QLIST_REMOVE(request, list);
> +    if (!finish) {
> +        QLIST_REMOVE(request, list);
> +    }
>      reset_request(request);
>      request->dataplane = dataplane;
>      QLIST_INSERT_HEAD(&dataplane->freelist, request, list);
> -    dataplane->requests_inflight--;
> +    if (!finish) {
> +        dataplane->requests_inflight--;
> +    }
>  }
> 
>  /*
> @@ -316,7 +320,7 @@ static void xen_block_complete_aio(void *opaque, int ret)
>              error_report_err(local_err);
>          }
>      }
> -    xen_block_release_request(request);
> +    xen_block_release_request(request, true);
> 
>      if (dataplane->more_work) {
>          qemu_bh_schedule(dataplane->bh);
> @@ -585,7 +589,7 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
>                      error_report_err(local_err);
>                  }
>              }
> -            xen_block_release_request(request);
> +            xen_block_release_request(request, false);
>              continue;
>          }
> 
> --
> Anthony PERARD



