Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF433AED2C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 18:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145608.267772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvMWM-00040D-80; Mon, 21 Jun 2021 16:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145608.267772; Mon, 21 Jun 2021 16:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvMWM-0003y8-4S; Mon, 21 Jun 2021 16:11:34 +0000
Received: by outflank-mailman (input) for mailman id 145608;
 Mon, 21 Jun 2021 16:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHMo=LP=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lvMWK-0003xw-9D
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 16:11:32 +0000
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13c5dde4-a379-4324-86e8-893671a03d73;
 Mon, 21 Jun 2021 16:11:31 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id bm25so16928998qkb.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jun 2021 09:11:31 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id t30sm10129212qkm.11.2021.06.21.09.11.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Jun 2021 09:11:30 -0700 (PDT)
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
X-Inumbo-ID: 13c5dde4-a379-4324-86e8-893671a03d73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AKyi6iJ5iPX7DVHeybiBSfN2Gudg4/i02xAoUSMGk70=;
        b=AEG6KKRefrncUFo7JlLKRfr7osC/yZ0WSDrTuWyJlWN9FGaDa6YtZjPctDjHgQ8fUT
         rUdIqNJhkwKJlaAv68aTEr6TkWnuCQ5FuW2Fxl64ewrIPVb20daFyWKQuOCzY1Fmzx7M
         c7zBslbbwD7/EkeCfO9Huqq7X81teilioJFKeqEl8MYh8OAOTPterMvXEKgRgkb9OsrM
         MrwTBIk5ittBzJa8LKPz2Tn+IhapSIE052+K4RYG6uR7gOMReu/DE0JCgG0VN67SvOuG
         +1TEc3tLZt2Lx9Fv1mxlpAMfwXVqsg8XNBPOcGldJzbUSDrG8mNAnv33yIHseTmPThIZ
         Yq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AKyi6iJ5iPX7DVHeybiBSfN2Gudg4/i02xAoUSMGk70=;
        b=LxtIepvLJAUCZDvWp3BzgUz0EmI/jKU3PAjcvVNJS4oIj9fejUevuqVu1CfLERaaSl
         kOFHLBeDlNlkaapD//Lqa3sRpav+VZ7drMHm7liFeOvEc1vPG11ShtewqL5IJ8JYMmXU
         qzNcSiQZ0Ii5JXkC43jbJ9SseNJgsud6Q9XisfcepjaSoUpMGyc9CAS4pp3gBMaU+8cE
         5ZejXy43xepoQtcjWq0U3h9qK4DOiRPKV86Lyln0JL3WrlrYxh4KA6FQVn/CwsfYd2RP
         sUwTDAgvyGSGxtMnmLI9qqf9TZ+PSK68Opl2zbeJ1LMiFi41NVE4STbGiQvytL88WUCW
         KEWw==
X-Gm-Message-State: AOAM5307HrJ9+1d9hdqNZOxQcMUooZl2m7jqVwIEg/8SMZh91e5Dh0bz
	TU3F94gn2gFNFVWd63TkIDw=
X-Google-Smtp-Source: ABdhPJyGsps87WvVsXQ/ydIDuU2vK4OUVkjVK9nn9Z3/RYYWW27YD3SI4WD7M+wF+CmmJ0hC6ISCFg==
X-Received: by 2002:a37:b44:: with SMTP id 65mr23760153qkl.248.1624291890714;
        Mon, 21 Jun 2021 09:11:30 -0700 (PDT)
Date: Mon, 21 Jun 2021 12:11:27 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [RESEND PATCH 03/12] golang/xenlight: fix string conversion in
 generated toC functions
Message-ID: <YNC6LzVHXCcNfg+E@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <06763aceff41167d3d3bbd603f729572c1f55c77.1621887506.git.rosbrookn@ainfosec.com>
 <6BAF6F60-EC63-41AC-A46E-2045E746C7E1@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6BAF6F60-EC63-41AC-A46E-2045E746C7E1@citrix.com>

On Fri, Jun 18, 2021 at 11:00:26AM +0000, George Dunlap wrote:
> 
> 
> > On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> > 
> > In gengotypes.py, the toC functions only set C string fields when
> > the Go strings are non-empty. However, to prevent segfaults in some
> > cases, these fields should always at least be set to nil so that the C
> > memory is zeroed out.
> > 
> > Update gengotypes.py so that the generated code always sets these fields
> > to nil first, and then proceeds to check if the Go string is non-empty.
> > And, commit the new generated code.
> > 
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> 
> So wait — if you do
> 
> var foo C.typename
> 
> Then golang won’t automatically zero out `foo`?
> 
> That seems like a bug really; but assuming this fixes real behavior you’ve encountered:

I would have to dig in again to figure out exactly what Go/cgo is doing
here, and whether or not this is a bug. But, the behavior I observed was
that without these nil assignments, I would sometimes get segfaults in
libxl_string_copy. This patch ensures that libxl__str_dup is not called
in the empty string case, thus avoiding the segfault.
> 
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Thanks,
NR

