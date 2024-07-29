Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D4B93EFAF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 10:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766418.1176898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLZT-0006Je-Le; Mon, 29 Jul 2024 08:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766418.1176898; Mon, 29 Jul 2024 08:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLZT-0006IC-ID; Mon, 29 Jul 2024 08:17:31 +0000
Received: by outflank-mailman (input) for mailman id 766418;
 Mon, 29 Jul 2024 08:17:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfTU=O5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYLZR-0006I6-KQ
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 08:17:29 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe684c91-4d82-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 10:17:28 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-7a1e2ac1ee5so186468985a.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 01:17:28 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8d84e2sm48874876d6.21.2024.07.29.01.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 01:17:26 -0700 (PDT)
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
X-Inumbo-ID: fe684c91-4d82-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722241047; x=1722845847; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cvbs/cxiByXlz9GbAZjIUDAo+YIyO15xk7TjFWjOgNQ=;
        b=P7OXvbTmUXvm1uGITgtJ4+FoYSnG1k/JQSmdJFsB+LVEVmdCyTBbOxJo5I2+x3iRp6
         Jsmxx0wKfkjlfd9hF/xpHUrO7szlL0o3WPEDZKeuDtb8pPbjo0aqyQ2QEiEw3fAYYEHu
         yIZxv4bycghP8tCX+QOd6W+oGdfOvS3EcdeY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722241047; x=1722845847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvbs/cxiByXlz9GbAZjIUDAo+YIyO15xk7TjFWjOgNQ=;
        b=NtuI9mnFYuaE8wjuUaX4J7Z3P4f44Oaey95aVeSib/Qzk5T9NfDafetMYNMNOZGZ2o
         UIVPawAfh0TU1DZD4K0U50tLIlIHcAaBSdLL3j3Tyx+s74ZWH7xQCrkpi5m6SQVvGJ1r
         J6QxLTqvIlPEA8N14sDFlbWjj7uGy2knUyE6v1pbMwsnc5EZ34dT5XHQIDEsR6B9gVor
         ZCmcMMMc/AwvSl8zaXJhn5gnk+z6lrY4Y5S0q9QoeULw1xztr5L4qM81wIpaZ+wwXFbt
         Qvk41kNGBu9iE53GojtnPd8OJbNavLRPJdMy7wjOfHXw089XhJXsAK6+oeMRLzF31gu8
         jCVw==
X-Gm-Message-State: AOJu0YylEIbJvqLTE2Keo85Vcm5m21O9tKd4nPOO2YKL9qWTSaxgb3eE
	UYuRs9ZnQh25t1MZn64Ugs3VR4QDz9PFT4Wm0UBec3ouAbINbJYB+QYlPM6DoVDR2LyUtnewzO2
	Q
X-Google-Smtp-Source: AGHT+IE8T9GwSzCF8QIX1x9Tr/+4qjjaseYfN5PW9t8R6KjknY0V9Urt9tXJUZ9iY1PdEaMGM318ng==
X-Received: by 2002:a05:6214:1245:b0:6b7:b026:fa3 with SMTP id 6a1803df08f44-6bb55aafd35mr76686416d6.46.1722241047091;
        Mon, 29 Jul 2024 01:17:27 -0700 (PDT)
Date: Mon, 29 Jul 2024 10:17:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 03/22] x86/dom0: only disable SMAP for the PV dom0 build
Message-ID: <ZqdQFRyoV6umqO1z@macbook>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240726152206.28411-4-roger.pau@citrix.com>

On Fri, Jul 26, 2024 at 05:21:47PM +0200, Roger Pau Monne wrote:
> The PVH dom0 builder doesn't switch page tables and has no need to run with
> SMAP disabled.

This should be reworded as:

"The PVH dom0 builder doesn't build guest page-tables, because PVH is
started in 32bit protected mode, hence has no need to run with SMAP
disabled."

Thanks, Roger.

