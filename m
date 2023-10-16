Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665EA7CA61B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 12:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617449.960027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLG4-0005pX-JF; Mon, 16 Oct 2023 10:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617449.960027; Mon, 16 Oct 2023 10:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLG4-0005me-GL; Mon, 16 Oct 2023 10:55:36 +0000
Received: by outflank-mailman (input) for mailman id 617449;
 Mon, 16 Oct 2023 10:55:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QGmD=F6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qsLG2-0005m8-DI
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 10:55:34 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87883e80-6c12-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 12:55:33 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53db3811d8fso8991689a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 03:55:33 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n30-20020a50935e000000b0053e775e428csm3442378eda.83.2023.10.16.03.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 03:55:32 -0700 (PDT)
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
X-Inumbo-ID: 87883e80-6c12-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697453733; x=1698058533; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gQnd5p4pporO1GNdO6zGK/IUyS0C6cZCfORt8GWSHEk=;
        b=D++vwrlIKB7ehUXsZ+OId9wiveNHeiVRs8oBsDnBtrEWsKyQf/G489XYvZ9BgPg9bB
         ehg34romdHDJCtgfxqy3bJ09DonOlM6QWbNnqJimQDGJ3tO6v7Put3Wd/SLGFTf4v1gC
         X4XMpCQqI6fTtk/nwhfa3oY5rtTlRYDvUMjm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697453733; x=1698058533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQnd5p4pporO1GNdO6zGK/IUyS0C6cZCfORt8GWSHEk=;
        b=ssJWiOXCawVfqd73n7OQQDq8Gd3vsU47vI7Ev2M4dF+3LALALfVqj9GSDVe/SnatDK
         L67wxPkyanrGxGEqctNiq9JHpBCWA9KBQ391xkJ5r3O1Qg0YJo1+avh2KCi7qlxBwXzT
         FIflPRktujx0trQfawEdp3jurbu7H5mFbp5KPOzUE4KM07T+tMfBVWPLT3MP/30392Gr
         GVO5KOpI6DzOk7KM0j2jWbK7AcnmYsIj/Lb+SgMVf1+0bS5pzanp+OfbRCKs4/PTFt8N
         WvbJNXWuFPP7X/dDH4OzszZiqcZnrveQslNbJSp2Ek6Xxl3G6BnZRhbhRU/HeP+oRvAk
         0Prg==
X-Gm-Message-State: AOJu0YzxIMYlwzKZWDlJ8kXtrcd1DNbvJeMAC8feN8OtvBjd7kcDpmhB
	SMkG/khzWJ1tZYPutwi09u9oiw==
X-Google-Smtp-Source: AGHT+IEIEWTQf2JMCTrpEGPEiiYhooxD/CTNWyB361R8gix5mNqLMg1AgfhVSh/OcHWMgP7UCfEPPw==
X-Received: by 2002:a50:c35c:0:b0:533:ccec:552 with SMTP id q28-20020a50c35c000000b00533ccec0552mr5570024edb.9.1697453732976;
        Mon, 16 Oct 2023 03:55:32 -0700 (PDT)
Date: Mon, 16 Oct 2023 11:55:32 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>,
	Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Anthony Perard <anthony.perard@cloud.com>
Subject: Re: [PATCH for-4.18 2/5] xenalyze: AMD's VMEXIT_VINTR doesn't need a
 trace record
Message-ID: <bba10ab0-7df3-4d86-8f2e-47bedfc02a75@perard>
References: <20231009125137.1329146-1-george.dunlap@cloud.com>
 <20231009125137.1329146-3-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009125137.1329146-3-george.dunlap@cloud.com>

On Mon, Oct 09, 2023 at 01:51:34PM +0100, George Dunlap wrote:
> Just like Intel's PENDING_VIRT_INTR, AMD's VINTR doesn't need an HVM
> trace record.  Expect that.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

