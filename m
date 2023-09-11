Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ACE79A765
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 12:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599269.934602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfePc-00028X-1r; Mon, 11 Sep 2023 10:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599269.934602; Mon, 11 Sep 2023 10:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfePb-000262-VP; Mon, 11 Sep 2023 10:44:59 +0000
Received: by outflank-mailman (input) for mailman id 599269;
 Mon, 11 Sep 2023 10:44:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5ji=E3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qfePa-00025w-OL
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 10:44:58 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4008df10-5090-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 12:44:57 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31c5cac3ae2so3917673f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 03:44:57 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b11-20020a5d4d8b000000b0031416362e23sm9780636wru.3.2023.09.11.03.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 03:44:57 -0700 (PDT)
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
X-Inumbo-ID: 4008df10-5090-11ee-8784-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694429097; x=1695033897; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XDlF5YI0/CppNpOQ1vN3K+1CKKPjKeo7ClgielEzmv4=;
        b=AjocFoSpFFvqC+LvQFcO9eCQxvAV6eaZFWEJi6eXlni3hiulLwIWHTr9Djfn19cfY0
         iC2yY58aSDvMY8mq4E8WxAMLMeFQOIPYUDgy3aJK6r/5PrDTMW77W3l0Qx+HPy5nB5Q+
         w0EDNNWkTSRR344j/AZ5d8z4VDDl5CEzE/5Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694429097; x=1695033897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDlF5YI0/CppNpOQ1vN3K+1CKKPjKeo7ClgielEzmv4=;
        b=qPBxSZV9YAF+/vatypw0LAMyRphHcBiJhe5GS0yQigXeFeSD9+R6HwMUpQE2BC3QcW
         +Eqv1zbR6+l+ycvyuTC2AjqpDvVN0kK15jYbHK4s7so1GuZdBdRE2cIDPTF5f0OyFHjx
         ZPpKHKx9E0uMuhrJFaxRniKl/Rv3DgK26L/paEr2dS7WI5Z1FQ/m/126zm/UdmaXOJzm
         NzyfkAKCQNEb2aZB2pZ0w6z7ow1/TweQ7+Jam8jFhFUYXWamWkH6TWcRW4YcUZqSV8x7
         lNP21wvoOSxcTSAAqV+s5sC6iveX+dJTmimPh4xsPWV1m18MJh/HnwtbjaWihxVvSpco
         pwjA==
X-Gm-Message-State: AOJu0YwKPmUhJ/GAOORwAFzE8WCKM08efrkNDeoDZgd9w9wBLgE+1CwF
	wXVhbCXn87zuZ6aRT8CQp/E7CQ==
X-Google-Smtp-Source: AGHT+IHWYE67ztxyZbze1YyOlCmW0CfRt9nvzhkVd5pPN5yhcvvIeIk5TBpM4vAVfrlPfFPG6ua9eA==
X-Received: by 2002:a5d:684a:0:b0:314:124f:12be with SMTP id o10-20020a5d684a000000b00314124f12bemr7099055wrw.3.1694429097334;
        Mon, 11 Sep 2023 03:44:57 -0700 (PDT)
Date: Mon, 11 Sep 2023 11:44:56 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
	eblake@redhat.com, vsementsov@yandex-team.ru, jsnow@redhat.com,
	idryomov@gmail.com, pl@kamp.de, sw@weilnetz.de,
	sstabellini@kernel.org, paul@xen.org, pbonzini@redhat.com,
	marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
	philmd@linaro.org, stefanha@redhat.com, fam@euphon.net,
	quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
	kraxel@redhat.com, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: Re: [PATCH 6/7] block: Clean up local variable shadowing
Message-ID: <97895eb8-a44f-4af6-99b1-0075dc68281a@perard>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-7-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831132546.3525721-7-armbru@redhat.com>

On Thu, Aug 31, 2023 at 03:25:45PM +0200, Markus Armbruster wrote:
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 3906b9058b..a07cd7eb5d 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -369,7 +369,7 @@ static void xen_block_get_vdev(Object *obj, Visitor *v, const char *name,
>      case XEN_BLOCK_VDEV_TYPE_XVD:
>      case XEN_BLOCK_VDEV_TYPE_HD:
>      case XEN_BLOCK_VDEV_TYPE_SD: {
> -        char *name = disk_to_vbd_name(vdev->disk);
> +        char *vbd_name = disk_to_vbd_name(vdev->disk);
>  
>          str = g_strdup_printf("%s%s%lu",
>                                (vdev->type == XEN_BLOCK_VDEV_TYPE_XVD) ?
> @@ -377,8 +377,8 @@ static void xen_block_get_vdev(Object *obj, Visitor *v, const char *name,
>                                (vdev->type == XEN_BLOCK_VDEV_TYPE_HD) ?
>                                "hd" :
>                                "sd",
> -                              name, vdev->partition);
> -        g_free(name);
> +                              vbd_name, vdev->partition);
> +        g_free(vbd_name);
>          break;
>      }
>      default:

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

