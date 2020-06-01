Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BCB1EA6D3
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 17:24:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfmIG-0003Jn-Nn; Mon, 01 Jun 2020 15:24:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6P3=7O=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jfmIF-0003Ji-W9
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 15:24:04 +0000
X-Inumbo-ID: ecaa9f36-a41b-11ea-9947-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecaa9f36-a41b-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 15:24:03 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g9so7542405edw.10
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 08:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=KDyQ7eRFU+F2sXgfo58fLtKCGQlDoXeTCkcWOQx5ueM=;
 b=GmAqLKuYuEH+JTPDlliNo1Ju/OiRMqY/HPxvIIxX26xDOZl2iDzCf31rbumRV/xWQU
 i4cqFzO8TKJH10+E5nCAXKQ4i5jrIjo05/9UNfHhkbAX7rcAAdrOwnfFUc3wTExRVnTg
 FqrnjRoyikwEYtaqWUWCP4S1uKGd8ySYhi/g0D7VmeeYzefZ2KfS0Dt7/IGNbLsA1b8H
 b5+eiMF5LyzyocSkHLpGPLks6c6VEc6RGQYlxsMccFYWORHsf58N4/pkrrzvUimkS2MO
 5L0T4+GjKpmmbiFZ03ccda5YOd6FawlTx/g+WTG9dv4c3og3IfSswn8M+/v+/x81/EUW
 n7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=KDyQ7eRFU+F2sXgfo58fLtKCGQlDoXeTCkcWOQx5ueM=;
 b=dezSc/3TjF0DjEO3kzsbEkYFYZCDqWWzb2iuojpxREiX/1stVpuQvz0+PWEHLAprlP
 kKht6At0Aup4sL2OqrU+vpR9YAANIVrSMrBen+SUQsVtLGq8mRn4TvzjiTFOIX11WET3
 oHl/pIorWT/892jdvLHq1y3ub01gQLD1EXgv+U/ECmdMGtSmP0DEJHGqjnCCiftFh1k2
 xZDyRTyltlK2srWf2Ir2q03SG6ihJFx8Q/XzMtAbPjFcWRDTKvd+4X6YGxOVTuAqofuk
 GcPsKg0XihQLpvEgIJ8kckNfRS3qQr6I9WbTl9Tjj552+q39J1sfFLRmBrncYj+l9M+z
 xETg==
X-Gm-Message-State: AOAM532yiGXY0eUVS0lMHzeROJq+CmNg0rao3apUeqd9pZPaZbCgCXpe
 gu0hXDboS9e7lrYxGFzbMpk=
X-Google-Smtp-Source: ABdhPJxsN36QKbSB5RIKVHc9VgZ60gV24GKJHrFosR47xVSkRAPUqjMWvhFQ9iUD5qKByqGH3qJLYg==
X-Received: by 2002:a50:e1c9:: with SMTP id m9mr21241697edl.196.1591025042724; 
 Mon, 01 Jun 2020 08:24:02 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id i21sm10769058edr.68.2020.06.01.08.24.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 08:24:02 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200601135325.34156-1-roger.pau@citrix.com>
In-Reply-To: <20200601135325.34156-1-roger.pau@citrix.com>
Subject: RE: [PATCH v3 0/2] clang/llvm: build fixes
Date: Mon, 1 Jun 2020 16:24:01 +0100
Message-ID: <001501d63828$add5de10$09819a30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIVOh9pqoxe/+p3WNwiOV4e0Zxy86hF3LUQ
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 01 June 2020 14:53
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich <jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> Subject: [PATCH v3 0/2] clang/llvm: build fixes
> 
> Hello,
> 
> Two pending bug fixes for clang/llvm toolstacks.

I'm assuming you intend this to be in 4.14. If so,

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> Roger Pau Monne (2):
>   x86/mm: do not attempt to convert _PAGE_GNTTAB to a boolean
>   build32: don't discard .shstrtab in linker script
> 
>  xen/arch/x86/boot/build32.lds | 14 ++++++++++++++
>  xen/arch/x86/mm.c             |  9 ++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> --
> 2.26.2



