Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC219F811
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 16:36:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLSq9-0002DF-Fa; Mon, 06 Apr 2020 14:35:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=etk8=5W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLSq7-0002DA-AP
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 14:35:03 +0000
X-Inumbo-ID: cc99845c-7813-11ea-83d8-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc99845c-7813-11ea-83d8-bc764e2007e4;
 Mon, 06 Apr 2020 14:35:02 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id de14so19480283edb.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2020 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=r6CtmB4j4V2k6M3wBOMBHNekQuJS84n0cWUZYh7Xr0s=;
 b=pdkdQ5URjzKugWUK7rOnvbHEaUCOEJXeYvpH3jkGjwv3zAkjCOLid1O5lPDqlfAhrl
 FheawOsD6wLlZI6bgbMmM579MLQqy5eXjkVO8BVXtFKPxagQCTqdg3CptY8ot2vk8CW1
 4yZogXe7f2uIMYGVprtEQZnVmpbqt77vyHw/2jAAcFb6jpRAnsP7Ac6RBhMQ9wxkrsv5
 3Y2okln5rTfDBGrYtxqSdSot+kSxlpUpwBdPAbvRcHxgae2LGVYw0gUbA8Zc1oAcruKZ
 H7WO8SxvltFZbISarudq56eGPMAVasZhrayHHox61ZbYn6dR1CUiGL3PKikWZkNGEAiE
 B17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=r6CtmB4j4V2k6M3wBOMBHNekQuJS84n0cWUZYh7Xr0s=;
 b=DwImrMzPBAwtlXMeOT2g5JRnv94aFtnWQz4ZJZM4rNJvN3MoNeXecDpMvTt0I2Eyhg
 wAg4pLrvi8SoZ74SFmk+BlBeC5eExRtvwyjMVPoNUwxYjKdeUQHphikY4jAy5EFt6qag
 5JHKkKCHtll2PkzR4QLfjHW62DW64VKJGHSIFX3UR27lxCh3L+JzproEGjClhOmGKaM/
 xCgj40Uv47D7/eazJ5Q6IuDzEXdHQckZ4souQPN6sZRw0LnwMo2EvV9UYPk4NGMueydL
 1pLkSgbzxlVM6hCMeshlvBEjKjfLQ7x7eIDbXJt5Nx+08287aBbnWfl2E7UpWbM5PbHi
 AxIw==
X-Gm-Message-State: AGi0PuYTVBINe+NwEPuLRUWmQ0HG6gJa59UQL0OzorBAxXtsLDVMTfbX
 ug8VNIflwYVLINH5F/68WJs=
X-Google-Smtp-Source: APiQypKcJbxoUZFcZkGGrcOhxkkoYgyDyAYDNNzeMEuP8jE+elB+gIFwl7Rnnr6glCfhHrKy1rzmFw==
X-Received: by 2002:aa7:c609:: with SMTP id h9mr19021258edq.93.1586183701711; 
 Mon, 06 Apr 2020 07:35:01 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id t25sm2427160edi.11.2020.04.06.07.35.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Apr 2020 07:35:01 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Anthony PERARD'" <anthony.perard@citrix.com>,
	<qemu-devel@nongnu.org>
References: <20200406105954.GT4088@perard.uk.xensource.com>
 <20200406140217.1441858-1-anthony.perard@citrix.com>
In-Reply-To: <20200406140217.1441858-1-anthony.perard@citrix.com>
Subject: RE: [PATCH v2 for-5.0] xen-block: Fix double qlist remove and request
 leak
Date: Mon, 6 Apr 2020 15:34:59 +0100
Message-ID: <002901d60c20$8dcc94d0$a965be70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQId5Ykq0Zul8aMjLjRNg1HUybzDSQHmJUNIp81CgpA=
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
> Sent: 06 April 2020 15:02
> To: qemu-devel@nongnu.org
> Cc: qemu-stable@nongnu.org; Anthony PERARD <anthony.perard@citrix.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Paul Durrant <paul@xen.org>; Stefan Hajnoczi <stefanha@redhat.com>; Kevin
> Wolf <kwolf@redhat.com>; Max Reitz <mreitz@redhat.com>; xen-devel@lists.xenproject.org; qemu-
> block@nongnu.org
> Subject: [PATCH v2 for-5.0] xen-block: Fix double qlist remove and request leak
> 
> Commit a31ca6801c02 ("qemu/queue.h: clear linked list pointers on
> remove") revealed that a request was removed twice from a list, once
> in xen_block_finish_request() and a second time in
> xen_block_release_request() when both function are called from
> xen_block_complete_aio(). But also, the `requests_inflight' counter is
> decreased twice, and thus became negative.
> 
> This is a bug that was introduced in bfd0d6366043

NIT: I guess you should quote the patch title here as well.

> , where a `finished'
> list was removed.
> 
> That commit also introduced a leak of request in xen_block_do_aio().
> That function calls xen_block_finish_request() but the request is
> never released after that.
> 
> To fix both issue, we do two changes:
> - we squash finish_request() and release_request() together as we want
>   to remove a request from 'inflight' list to add it to 'freelist'.
> - before releasing a request, we need to let now the result to the
>   other end,

"we need to let the other end know the result"

> thus we should call xen_block_send_response() before
>   releasing a request.
> 
> The first change fix the double QLIST_REMOVE() as we remove the extra

s/fix/fixes

> call. The second change makes the leak go away because if we want to
> call finish_request(), we need to call a function that do all of

s/do/does

> finish, send response, and release.
> 
> Fixes: bfd0d6366043 ("xen-block: improve response latency")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

The code looks ok, so with the cosmetic fixes...

Reviewed-by: Paul Durrant <paul@xen.org>


