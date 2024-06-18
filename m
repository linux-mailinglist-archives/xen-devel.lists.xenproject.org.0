Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D87B90D5C5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 16:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743144.1150047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJa3x-0006al-Ht; Tue, 18 Jun 2024 14:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743144.1150047; Tue, 18 Jun 2024 14:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJa3x-0006XZ-F7; Tue, 18 Jun 2024 14:43:57 +0000
Received: by outflank-mailman (input) for mailman id 743144;
 Tue, 18 Jun 2024 14:43:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TBP2=NU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJa3w-0006XT-AT
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 14:43:56 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ef8ed43-2d81-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 16:43:54 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-7955af79812so303153585a.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 07:43:54 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc0cf98sm523962485a.80.2024.06.18.07.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:43:52 -0700 (PDT)
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
X-Inumbo-ID: 2ef8ed43-2d81-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718721833; x=1719326633; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1+SS+CgyscfT+wjW8/qeAG6YffPFvdXGu7/EUf5Kw8=;
        b=LGiFohsrFy67YAQKwk1TnA+RIR3StQiu6cgWv0iDAA78s5DySfwCKH/e2Ajf7pe9DF
         7eiFXPl2fvol9UE3yN0itLkeMtR4b5nMbhQ/5NC1ZCOgJSr7vOSUKXXXkPjCHb1NBSBD
         cZ+8KiXbwIIyq7aCmg3Q+PpxI7CbV9LqlJuPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718721833; x=1719326633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1+SS+CgyscfT+wjW8/qeAG6YffPFvdXGu7/EUf5Kw8=;
        b=DNw7VOAnOUx9k0xgiTeYOlt0K6RPXJ3z2a3Fl0ycafJ1GYvflYSCNHFHe7lsTtqhx1
         04w2zUIOC1lytQ0aTCgOaUSoX4CViOCw6Kq7ThH2MgoC3u+ftq9Pt62dyq6d8xtZgWVm
         +iPKIEsu0TJ6OF36KvWkPIUPef/RhP/qzeAaz6u5oV5HOujfS5ld/HHggCwmQ3to02Rw
         DwPK7NGLORSURbnn3Y1s1Z5FMuPNDaXfT/HClRgLPpvJ8HDT38KtAsIn9uSOsF3OliYW
         aoh8fYKO1wDnReGJmyejXyj//ssSn6DEOxqLSKhGfUSg9slbldbqbwPqMMWYeA40UtJZ
         jpkg==
X-Forwarded-Encrypted: i=1; AJvYcCWD+lLHRXa9TjASWuMUwYl4dGH1psolLyAK84+a0PttbWswjXdAeXMOepBR3YDMgeFySEL1emRQ8F/7/+lTd5P4SqFCmkhHgEdgmhCuDV4=
X-Gm-Message-State: AOJu0YwaSsw2KRprEBYgw5Fmo0vUtQHLibse9mRJ9j9XKYKcWHVNKzJM
	gh2f5KJkPXnwajHd4fz4+rxZ8ffDxhlLPQFcE4Tyrnn0srX1NXMuG821HK+W2gk=
X-Google-Smtp-Source: AGHT+IE1YlRuWEi0vQfDOPjPfHR2PbvrEzE38XoxBE6yNs4Wq+SxKec9MZIMG60RC/XOLzcX9esWng==
X-Received: by 2002:a05:620a:2a11:b0:797:ee31:c39d with SMTP id af79cd13be357-798d23f0d1dmr1496021585a.11.1718721832764;
        Tue, 18 Jun 2024 07:43:52 -0700 (PDT)
Date: Tue, 18 Jun 2024 16:43:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Direct Rendering Infrastructure development <dri-devel@lists.freedesktop.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZnGdJoCtbIrf4-dW@macbook>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <ZmwByZnn5vKcVLKI@macbook>
 <Zm-FidjSK3mOieSC@itl-email>
 <Zm_p1QvoZcjQ4gBa@macbook>
 <ZnCglhYlXmRPBZXE@mail-itl>
 <ZnDbaply6KaBUKJb@itl-email>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZnDbaply6KaBUKJb@itl-email>

On Mon, Jun 17, 2024 at 08:57:14PM -0400, Demi Marie Obenour wrote:
> Given the recent progress on PVH dom0, is it reasonable to assume that
> PVH dom0 will be ready in time for R4.3, and that therefore Qubes OS
> doesn't need to worry about this problem on x86?

PVH dom0 will only be ready (whatever ready means in your use-case)
when people test and fix the issues, otherwise it would stay in the
same limbo it's currently in.

I guess the main blocker for Qubes is the lack of PCI passthrough
support in order to test it more aggressively?

Thanks, Roger.

