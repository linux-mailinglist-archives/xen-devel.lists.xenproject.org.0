Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731921D165
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 10:09:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jutWT-0002Lo-8u; Mon, 13 Jul 2020 08:09:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bAa1=AY=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jutWR-0002Le-MW
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 08:09:11 +0000
X-Inumbo-ID: 21cb17ec-c4e0-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21cb17ec-c4e0-11ea-b7bb-bc764e2007e4;
 Mon, 13 Jul 2020 08:09:11 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k6so14803452wrn.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2020 01:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=goZFdv0vYFu2qS+8tgZEgkamqnIThorE/kvTLGKqcjg=;
 b=OmYmHmxuhJhhhadcUjIexz8FybS0Qab1l5YUvnTcwlHRlfPb3o6CxYT7D3lPOTgSY1
 W/KjDgtKjNd/47TU74VaF4LA9NfwpYM5/nEIC1kC5YP70Mu8PQZCF1LEhvccq8evwrSr
 UnGRC0q/pmBw7NVdGDYVD4UOwaGXq/jCDodj/+l5uwYWx6bXOUuNzkbajhL+dOOf4ua9
 gJjnXtXfjCCfqYyQ6Jx7rzHyBO55DdJqT5suU4H/8lYqjJGxnsrlKc6DT/8Cbc7jHSRF
 ccsevynM3q1ZfxqS1eUCWCsljRbbZrAxiyCYmULL3DddmEmI62Li4GgR+JFl3k8VT3oA
 49Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=goZFdv0vYFu2qS+8tgZEgkamqnIThorE/kvTLGKqcjg=;
 b=UeTDYSobwfVtg/pEAL4yBZZNuhVHN4DudGA+r6Egzcp1ssaH5VfwglVFjaHSK3vr9J
 7ilaDn00FMptr/yhhxm8vD8l7v2UEA3DPLjd50H4a+GiBP3oPtJ3HhikJu/1zhwfxbgI
 C5rDqsdQq3SEfrd40pyNKqfV2UXcgCSiKxe+XbL0JOUiGiAsijK138vvHS1ge7cJ4gxB
 mytetLnVFgEiJu7MC+9cUbNAjMz3xibIYArO2Tx0CdcKryZn8omsJdD3aaX9hOQTkIxT
 LvaMnFm3YXIAHAWv7L8ohMG5nBZoIsyM+ZtAFjO+5b9w/K7KKl+ia8gHSBF0Xn3Y4x9P
 dskw==
X-Gm-Message-State: AOAM532yGUELWQbDKwZcGJzJV8ZtIt/2OQAy3qlKDLXENdsFc9gG2tB1
 8QjyY+7cpBC0mLzjeLjLgEc=
X-Google-Smtp-Source: ABdhPJyr5gyI63fyswQfNkAN5vUdZgX+iXjJYkUAcBLa26UIsUoR2kkPYeok06gmIYfdASjUIA1utg==
X-Received: by 2002:adf:fa81:: with SMTP id h1mr79156106wrr.266.1594627750240; 
 Mon, 13 Jul 2020 01:09:10 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id j6sm23357762wro.25.2020.07.13.01.09.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jul 2020 01:09:09 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Souptick Joarder'" <jrdr.linux@gmail.com>, <boris.ostrovsky@oracle.com>,
 <jgross@suse.com>, <sstabellini@kernel.org>
References: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
 <1594525195-28345-3-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1594525195-28345-3-git-send-email-jrdr.linux@gmail.com>
Subject: RE: [PATCH v3 2/3] xen/privcmd: Mark pages as dirty
Date: Mon, 13 Jul 2020 09:09:08 +0100
Message-ID: <003901d658ec$e2d93460$a88b9d20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGQUUjbM0hB7euxJ1kpRMo6FNfk+gF2cfqiqYWDhTA=
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 'Paul Durrant' <xadimgnik@gmail.com>, 'John Hubbard' <jhubbard@nvidia.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Souptick Joarder <jrdr.linux@gmail.com>
> Sent: 12 July 2020 04:40
> To: boris.ostrovsky@oracle.com; jgross@suse.com; sstabellini@kernel.org
> Cc: xen-devel@lists.xenproject.org; linux-kernel@vger.kernel.org; Souptick Joarder
> <jrdr.linux@gmail.com>; John Hubbard <jhubbard@nvidia.com>; Paul Durrant <xadimgnik@gmail.com>
> Subject: [PATCH v3 2/3] xen/privcmd: Mark pages as dirty
> 
> pages need to be marked as dirty before unpinned it in
> unlock_pages() which was oversight. This is fixed now.
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Suggested-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Paul Durrant <xadimgnik@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>  drivers/xen/privcmd.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index b001673..079d35b 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -611,8 +611,11 @@ static void unlock_pages(struct page *pages[], unsigned int nr_pages)
>  {
>  	unsigned int i;
> 
> -	for (i = 0; i < nr_pages; i++)
> +	for (i = 0; i < nr_pages; i++) {
> +		if (!PageDirty(pages[i]))
> +			set_page_dirty_lock(pages[i]);
>  		put_page(pages[i]);
> +	}
>  }
> 
>  static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
> --
> 1.9.1



