Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7479D0E3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 14:18:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600443.936065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg2Kd-0005EV-6r; Tue, 12 Sep 2023 12:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600443.936065; Tue, 12 Sep 2023 12:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg2Kd-0005Bk-3o; Tue, 12 Sep 2023 12:17:27 +0000
Received: by outflank-mailman (input) for mailman id 600443;
 Tue, 12 Sep 2023 12:17:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mt1s=E4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qg2Kb-0005AK-Lg
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 12:17:25 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53e38d34-5166-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 14:17:23 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-401bdff4cb4so59410345e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Sep 2023 05:17:23 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d21-20020a1c7315000000b00400268671c6sm12635375wmb.13.2023.09.12.05.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 05:17:22 -0700 (PDT)
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
X-Inumbo-ID: 53e38d34-5166-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694521042; x=1695125842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TfQbF+10Yr9U5rXDmXrTOP0lHxoo5t96uTGA5j+vw2Q=;
        b=ScUcrTNsxnFtK7TAjYdWcK+cdfOLAcAPtHpJuQg70Tgpl7lRGhaHoKmd2RmYQcOeaX
         JFX54/o4a1ooq73U5YxUxYaGdDsAcQcBsUs94qJ75Xm4SYPGnqqb2gjZSeTKp887s1n6
         HW9Dor2aWBDnWxJlJl+VL6fHNAAHXZqNSe8iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694521042; x=1695125842;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfQbF+10Yr9U5rXDmXrTOP0lHxoo5t96uTGA5j+vw2Q=;
        b=OsPVtQtjheV1hwHvyAG3lpOv8UheDlHC79qRd6IeYf7N1oEyFsPJU8YfJk5fGMGrND
         RNbdHno2VMpX1Wjj4oqZHR/+3ys6XEx4EajhrJdy6J+WibZG+dW4Jn2eqZ8S8+b0dEFU
         8wd9Hp9oNTlkVPLKPOPDjT/4LgbZTNv+p6VBE9SMg38GmUQ/iz1hvjUENCq5m18zb0GK
         ePEjpKqyepuohboDBX/b3Du69my1QT47gyDiCoGoRiI/kkSWaAjkm9Wz4u7oTnXcLYoi
         5LjCxUrgAabo8J87kHgUayO6yEcOy96bxqFX0DlTZXjpOcaWNKiS/aKjNvaq6cXrSn6X
         zCQw==
X-Gm-Message-State: AOJu0YzfKeoKvmxnLVKBl79Q1ww1TYQzqnyg1Cj3GgRQKRAd3fvM4Y2p
	/u+7g86YE72j/Q8Gy/h+8iXu8w==
X-Google-Smtp-Source: AGHT+IH6a393JEKGrtIfvJeW1ErFbsQjYIxBrgOu5sdPjQDky/qknCXphHWFhTETqF6742nOSz/COw==
X-Received: by 2002:adf:f302:0:b0:31a:e6bf:9032 with SMTP id i2-20020adff302000000b0031ae6bf9032mr10024177wro.4.1694521042573;
        Tue, 12 Sep 2023 05:17:22 -0700 (PDT)
Message-ID: <ac894d3f-c0f2-3928-c8f8-15f87573211f@citrix.com>
Date: Tue, 12 Sep 2023 13:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 3/5] tools: don't use distutils in configure nor
 Makefile
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@cloud.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <7b3ecf211f60e0d6f7a4d146b62f9c28eff003f5.1694450145.git.javi.merino@cloud.com>
 <fdf87d82-aa3c-fd2e-6271-848f1a806fb2@citrix.com> <ZQBQnGOU/voT6QcV@mail-itl>
In-Reply-To: <ZQBQnGOU/voT6QcV@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2023 12:50 pm, Marek Marczykowski-Górecki wrote:
> On Tue, Sep 12, 2023 at 11:38:04AM +0100, Andrew Cooper wrote:
>> On 11/09/2023 5:51 pm, Javi Merino wrote:
>>> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>
>>> Python distutils is deprecated and is going to be removed in Python
>>> 3.12. The distutils.sysconfig is available as sysconfig module in
>>> stdlib since Python 3.2, so use that directly.
>>>
>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> This breaks Py2, doesn't it?
> I was thinking that too, but "sysconfig" module seems to be in Python
> 2.7 too.

Oh, so it is.  Lovely that the documentation says this...

It seems to have appeared in Py2.7 and 3.2 together. 
https://docs.python.org/2.7/library/sysconfig.html

I notice that README currently says Py2.6.  We can definitely bump that
to 2.7, and take this patch as-is.

~Andrew

