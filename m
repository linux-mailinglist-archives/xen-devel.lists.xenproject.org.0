Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 758358165F4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 06:16:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655664.1023361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF5yC-0005jw-L5; Mon, 18 Dec 2023 05:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655664.1023361; Mon, 18 Dec 2023 05:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF5yC-0005hO-HZ; Mon, 18 Dec 2023 05:15:12 +0000
Received: by outflank-mailman (input) for mailman id 655664;
 Mon, 18 Dec 2023 05:15:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fu7n=H5=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1rF5yB-0005hI-QR
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 05:15:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69506933-9d64-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 06:15:09 +0100 (CET)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-uVVNHWs9PYKwdW8oPzCuTg-1; Mon, 18 Dec 2023 00:15:06 -0500
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-6da6577c5ecso401457a34.1
 for <xen-devel@lists.xenproject.org>; Sun, 17 Dec 2023 21:15:06 -0800 (PST)
Received: from x1n ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 l2-20020a6542c2000000b005c621e0de25sm14460466pgp.71.2023.12.17.21.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Dec 2023 21:15:05 -0800 (PST)
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
X-Inumbo-ID: 69506933-9d64-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702876508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=us3d4nmHk3sAoZXoQzVjlol7teSSMXKMmltMJechvww=;
	b=GyhVXPcOMD2t1dNLv5mDM7HCXC/4CzeYXVDlidjbeMnJHEC4AYlVCt1TZ40DquFaL4PZ5r
	qtYmYWRb7MOU4MBGI/4Fytw+7V65FiI8gWnNyNlQIISbgeuY6MEFZQqt251QGWgDrzIk/I
	MpGkvwa/OKcu6tsYperdoFwu4k8lQkw=
X-MC-Unique: uVVNHWs9PYKwdW8oPzCuTg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702876506; x=1703481306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us3d4nmHk3sAoZXoQzVjlol7teSSMXKMmltMJechvww=;
        b=wgTdTx0TQzx3weFNP6cN+k1gp2rvkVXvBJcf5tFR6WkCZRSGxx0ZNMege+CM83ogj1
         WhO20YXa5722TPm2Y4Of94TzVVY2C/Z0twBgslibjdogL1Yo7q/aYzlQCh6Mf+VAZJsj
         JBC0/T/ivqb94tVLpERcPyXEAKNWzH2n7OoHEIaWM4HMhB5pkAdclv3VnM875Eu735GM
         43Jw8DW343vrQBLwk5fXkbv+gFXitxdHWt5mo/GOthJHvqBmaCR3fmTzth6ODVkleDOi
         IW0eYGtjHffn/nDsEzKYWXQp2/fGRMLm1wXun4BiwhscJENAvelqHMRWTYFzwOXr8cuv
         kCDw==
X-Gm-Message-State: AOJu0Yx0V/WVQZ/zVteEykVAU3mjTDWGYSaWjU47xbrZT3i33P4b/9Gt
	1VPlBSZHk+FyQh6G8QIrZOvpXhCI8ma4oUU09T8hVNTbjl5Y+wICuYmqkK4d61MZfceUqBShxUS
	J6WrySd4iy/RTLquTFzF4DkRMwvI=
X-Received: by 2002:a05:6830:907:b0:6d9:d486:be6b with SMTP id v7-20020a056830090700b006d9d486be6bmr30313457ott.2.1702876505791;
        Sun, 17 Dec 2023 21:15:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4QA9KxY4Fn4YCPnsyU89ZFiETt7gugueZXTi477MfazzAvRiHFwSBh2R0w1CA/5uU2dzxlA==
X-Received: by 2002:a05:6830:907:b0:6d9:d486:be6b with SMTP id v7-20020a056830090700b006d9d486be6bmr30313443ott.2.1702876505570;
        Sun, 17 Dec 2023 21:15:05 -0800 (PST)
Date: Mon, 18 Dec 2023 13:14:51 +0800
From: Peter Xu <peterx@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Cc: Juan Quintela <quintela@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>, Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH V8 00/12] fix migration of suspended runstate
Message-ID: <ZX_VS_KDsoiL9T2X@x1n>
References: <1702481421-375368-1-git-send-email-steven.sistare@oracle.com>
 <a9ddc1b2-d4fc-44de-857b-2aeb35fa0925@oracle.com>
MIME-Version: 1.0
In-Reply-To: <a9ddc1b2-d4fc-44de-857b-2aeb35fa0925@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Dec 13, 2023 at 10:35:33AM -0500, Steven Sistare wrote:
> Hi Peter, all have RB's, with all i's dotted and t's crossed - steve

Yes this seems to be more migration related so maybe good candidate for a
pull from migration submodule.

But since this is still solving a generic issue, I'm copying a few more
people from get_maintainers.pl that this series touches, just in case
they'll have something to say before dev cycle starts.

Thanks,

-- 
Peter Xu


