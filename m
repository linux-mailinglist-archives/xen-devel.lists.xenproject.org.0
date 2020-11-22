Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2591B2BC630
	for <lists+xen-devel@lfdr.de>; Sun, 22 Nov 2020 15:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33323.64346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgqdm-0004LV-Mh; Sun, 22 Nov 2020 14:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33323.64346; Sun, 22 Nov 2020 14:46:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgqdm-0004L6-Jc; Sun, 22 Nov 2020 14:46:58 +0000
Received: by outflank-mailman (input) for mailman id 33323;
 Sun, 22 Nov 2020 14:46:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=54+R=E4=redhat.com=trix@srs-us1.protection.inumbo.net>)
 id 1kgqdl-0004Ka-71
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 14:46:57 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a290f822-bb6b-47ee-a05f-17abc098a773;
 Sun, 22 Nov 2020 14:46:56 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-e4uQWsE8Onm26TxSK_V78g-1; Sun, 22 Nov 2020 09:46:52 -0500
Received: by mail-qk1-f197.google.com with SMTP id s9so12636390qks.2
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2020 06:46:52 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x72sm6888242qkb.90.2020.11.22.06.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 06:46:51 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=54+R=E4=redhat.com=trix@srs-us1.protection.inumbo.net>)
	id 1kgqdl-0004Ka-71
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 14:46:57 +0000
X-Inumbo-ID: a290f822-bb6b-47ee-a05f-17abc098a773
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id a290f822-bb6b-47ee-a05f-17abc098a773;
	Sun, 22 Nov 2020 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606056416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=apju6gP6XSpkYwp4WdL57a/nFAvNI/QCKhQkuBxc3S8=;
	b=XA3Bdia/xK9rtALsHLhdMXNkl5EWPz83+inaq5KZnxbZp/pqE7ot4cuq9wfEbTWVu1jCkd
	fkI/qAlh4sU3l8dOrlq7C5hNdTdH0le7t+rDrYZ5+jjUTJP5ekv3G25710udgF6Q97joi/
	ih3DR460gM+B9YwlFm0ND3pgcFfhizQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-e4uQWsE8Onm26TxSK_V78g-1; Sun, 22 Nov 2020 09:46:52 -0500
X-MC-Unique: e4uQWsE8Onm26TxSK_V78g-1
Received: by mail-qk1-f197.google.com with SMTP id s9so12636390qks.2
        for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2020 06:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=apju6gP6XSpkYwp4WdL57a/nFAvNI/QCKhQkuBxc3S8=;
        b=F46NCnsny/1zbFQ9jAnm3TE21zoEQeMdKtCgJHmesafGSoCmebeg6frfOmwSeVDzzH
         rOLpBdkaP8CcY6zrZFPZqKqJUGSt3b5iFtQJ5ex3B32hpbiV1VUzkpBX1Lj4H09VEPT1
         y+w+GANJyikW9hyzcqABWoK3e+GLwJ0oX5i7hNgetklUY++/l7HdQiT6ODJgNUcJ5heD
         dF9t9tlLhEOPWc202I4CKtiCBKk2ErVovkg8jwTWRci/xm8RpzaJlAhoLIvFU4A3UZui
         uLW4acUgRXjwLu0DyJlrQllBnpbwUL4jHkcpuumnMciNTxvodLyYqc22gg1j6Bx3m3Ir
         DVzA==
X-Gm-Message-State: AOAM533hjg++bbtjSaCnbwNQR8c8Wnj7jASg87wV+wdlYHxC9Tq7Ncs1
	jZUhrFjveoG6MJvp0vQ9eckxHgNrSeddDl19QAHNqfLXJ2ZSXyDZ5j5C8NqbtqgqESomelCDE02
	OlOWoe1+QObq5Tkxg1dENuCj6QqM=
X-Received: by 2002:ad4:476b:: with SMTP id d11mr26026190qvx.57.1606056412431;
        Sun, 22 Nov 2020 06:46:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPQ8vJIBgyJxmgPlUVzOaStXFRaD0Z+d8VDmnR7kdLyNkvwByAGPov006wc7+pJBCcgj+/zw==
X-Received: by 2002:ad4:476b:: with SMTP id d11mr26026152qvx.57.1606056412222;
        Sun, 22 Nov 2020 06:46:52 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x72sm6888242qkb.90.2020.11.22.06.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2020 06:46:51 -0800 (PST)
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
To: Matthew Wilcox <willy@infradead.org>
Cc: joe@perches.com, clang-built-linux@googlegroups.com,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, tboot-devel@lists.sourceforge.net,
 kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-acpi@vger.kernel.org, devel@acpica.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 linux-wireless@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 cluster-devel@redhat.com, linux-mtd@lists.infradead.org,
 keyrings@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, alsa-devel@alsa-project.org, bpf@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-nfs@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20201121165058.1644182-1-trix@redhat.com>
 <20201122032304.GE4327@casper.infradead.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
Date: Sun, 22 Nov 2020 06:46:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201122032304.GE4327@casper.infradead.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/21/20 7:23 PM, Matthew Wilcox wrote:
> On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com wrote:
>> The fixer review is
>> https://reviews.llvm.org/D91789
>>
>> A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
>> The false positives are caused by macros passed to other macros and by
>> some macro expansions that did not have an extra semicolon.
>>
>> This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
>> warnings in linux-next.
> Are any of them not false-positives?  It's all very well to enable
> stricter warnings, but if they don't fix any bugs, they're just churn.
>
While enabling additional warnings may be a side effect of this effort

the primary goal is to set up a cleaning robot. After that a refactoring robot.

Tom


