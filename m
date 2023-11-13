Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D51E7E9F72
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631649.985225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YRU-0006Gs-KF; Mon, 13 Nov 2023 15:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631649.985225; Mon, 13 Nov 2023 15:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YRU-0006EI-GU; Mon, 13 Nov 2023 15:01:36 +0000
Received: by outflank-mailman (input) for mailman id 631649;
 Mon, 13 Nov 2023 15:01:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLDR=G2=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1r2YRT-0006EA-Tt
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:01:35 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 898dcc40-8235-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 16:01:34 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40839652b97so35605445e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:01:34 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c451200b004094e565e71sm8311541wmo.23.2023.11.13.07.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 07:01:34 -0800 (PST)
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
X-Inumbo-ID: 898dcc40-8235-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699887694; x=1700492494; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=72/wDZSv3Jwif1e4/97NfbphRmmgwUXf9rueMIn7K08=;
        b=iPkYtoXK0v0+jQHDe6HKW0+bhIGH50VXglle9s+pN5EXTkkX1++C35OJq2XVsT4uiE
         aStmzX3cRrq896UHk4ybDiK5ntr1pkw9hktFKHbIZl4Z3W5n3nx/dSfKe9PohmxcGYlO
         u/8QWQiv7FpEBpwPObBwecRpAbqrrBTNcUIPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699887694; x=1700492494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72/wDZSv3Jwif1e4/97NfbphRmmgwUXf9rueMIn7K08=;
        b=bOYPuIEHcMmEDCxesDDEUCzB1YTNR6xM0wFnt91STWJU1YNxv94bQhRyflwnV51uRz
         iJq2Q7/WJ3vVozpp1I3iN+z5xbWojMwVXzdxzeRBME+DARqOjigHd0Y0ivOVexpx3enw
         e6Ct6u93Obl7wZUTPjcvo3GTrAFQCo46CycKa85vKqbGwka7ipz65tSPDR+N0SVzhXLt
         gunFpcyrAn5WgTi+h79wtWzYLIg9eMvOYF72TTpQP32LDEFUd7P1hvudyLbtoAZB+pES
         xB9c8/xoeSd+KHQ7znH+EL9K9cEYOWHvECLY6oI+QwzaotLADd95+N2/U0V+cfyccRRx
         3B2Q==
X-Gm-Message-State: AOJu0YwWFOI3cHnDskm6jLpLPTMZrk2eRNsoP00PNi1Ne1lD5cDSHQBD
	2IGQdrfRo9OTrLRrCc6E7p0MfW+/nNLQA1/BIhg=
X-Google-Smtp-Source: AGHT+IHbdpxJ+AmjNfWgQfGujzjIwEb0Gow5D7JZcUy/1NVU9zdBYuITzPSkDpQYO3E+NoPY/Px/EQ==
X-Received: by 2002:a05:600c:3b13:b0:40a:4c7e:6f37 with SMTP id m19-20020a05600c3b1300b0040a4c7e6f37mr4998025wms.20.1699887694357;
        Mon, 13 Nov 2023 07:01:34 -0800 (PST)
Date: Mon, 13 Nov 2023 15:01:33 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] CI: Rework RISCV smoke test
Message-ID: <a12642cc-0b2a-42fe-9eff-a5a8642d3373@perard>
References: <20231109154922.49118-1-anthony.perard@citrix.com>
 <7bffd0ff-290f-461c-a0ce-35440b36240a@citrix.com>
 <alpine.DEB.2.22.394.2311091657150.3478774@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2311091657150.3478774@ubuntu-linux-20-04-desktop>

On Thu, Nov 09, 2023 at 05:02:08PM -0800, Stefano Stabellini wrote:
> ### qemu_key.sh is using "expect", see below. I think we should be able
> ### to achieve the same by using expect to close on the expected string
> ### (instead of waiting for eof)

So, `expect` is just a different kind of language than shell is?
Also, `grep -q` doesn't wait for EOF, and just exit as soon as it found
the pattern.

Cheers,

-- 
Anthony PERARD

