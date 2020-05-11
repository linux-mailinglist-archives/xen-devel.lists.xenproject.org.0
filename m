Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4043F1CE7A0
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 23:42:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYGBP-000676-1B; Mon, 11 May 2020 21:41:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+Ik=6Z=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jYGBN-000671-9B
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 21:41:53 +0000
X-Inumbo-ID: 38ec6229-93d0-11ea-a25b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38ec6229-93d0-11ea-a25b-12813bfff9fa;
 Mon, 11 May 2020 21:41:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5FA83206E6;
 Mon, 11 May 2020 21:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589233311;
 bh=/fl3uka4BT5IGqZ+Q4Z4mtPFibQXcT2JNziQkXT1B1Y=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=2YJjy8kxgUoeP+gliRPlKr1nW7XHzo4oL9gHBwx3pAz42LG3n/w4NH/igzJJstIct
 HW4nO1ydZ86YE7re2cLTdml2H2TafeyC+oDL4wo5Mqhxuf/9gDzc8Ci/QsQsQ3UlFR
 LhIZV1ZAwA1Eky4PnR4qG9ZAi+2mr3HhB9+YdsHQ=
Date: Mon, 11 May 2020 14:41:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/pvcalls-back: test for errors when calling
 backend_connect()
In-Reply-To: <20200511074231.19794-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.21.2005111440210.26167@sstabellini-ThinkPad-T480s>
References: <20200511074231.19794-1-jgross@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 11 May 2020, Juergen Gross wrote:
> backend_connect() can fail, so switch the device to connected only if
> no error occurred.
> 
> Fixes: 0a9c75c2c7258f2 ("xen/pvcalls: xenbus state handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/pvcalls-back.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
> index cf4ce3e9358d..41a18ece029a 100644
> --- a/drivers/xen/pvcalls-back.c
> +++ b/drivers/xen/pvcalls-back.c
> @@ -1088,7 +1088,8 @@ static void set_backend_state(struct xenbus_device *dev,
>  		case XenbusStateInitialised:
>  			switch (state) {
>  			case XenbusStateConnected:
> -				backend_connect(dev);
> +				if (backend_connect(dev))
> +					return;

Do you think it would make sense to WARN?

>  				xenbus_switch_state(dev, XenbusStateConnected);
>  				break;
>  			case XenbusStateClosing:
> -- 
> 2.26.1
> 

