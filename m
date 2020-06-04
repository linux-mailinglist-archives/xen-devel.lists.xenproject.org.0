Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DC91EEA4A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 20:30:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgucb-0006f3-7c; Thu, 04 Jun 2020 18:29:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGdv=7R=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jgucY-0006ey-VJ
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 18:29:43 +0000
X-Inumbo-ID: 5b8309f8-a691-11ea-9dbe-bc764e2007e4
Received: from mail-qk1-x72f.google.com (unknown [2607:f8b0:4864:20::72f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b8309f8-a691-11ea-9dbe-bc764e2007e4;
 Thu, 04 Jun 2020 18:29:42 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id w1so7123698qkw.5
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 11:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=CJA+hJ4ec5VLveyR3UagHk4xdzxq7p5jRQtG2F/X6bU=;
 b=vKDu4lQWqCxp1NgCJMEt11L0IHZGi37HECbkTi6hzZ4H54AsQjwCrqUilo+oIJl/MP
 yYfKdQ2DxG7ksAv7Uq0btH9fyG1c9O29fUcPHSqa1BTrmY3HaOiLXkgt1R751Ump0ni4
 aEGq7Ui4jvt6EkF4UMH9VzvpXV+SHnMqOzHATbBSH5x4T49uCq2NraqHktKZoc0KqugH
 7L/7C5TevAO/9ZsfSJpyYTV6Oho8tQKsG0FGcqDt7BrtOBh2XiLEPxWVAZ7UplqAsJx/
 n+EwWXxAvGju4yUsqtmiuYBQamHnQ0Fjp9OLxb/NDydaYLIRYUSuZNxE6hMBRF8kuPPZ
 SxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=CJA+hJ4ec5VLveyR3UagHk4xdzxq7p5jRQtG2F/X6bU=;
 b=T7D3Y8S7oD5UZPbsW4RY1q8gdhgMHlFQuZQOFemd3hTAkkRUpFcuzJZ0sYuFRE/JUr
 j339s9NS0C7ikZrHsF5ftYtBEADtW8j91KebPBdbYqu1nid7ON8iVYFgFdHCemuGNKJB
 2F13tlVFK2rDH5nMTQZDMJHUoNZO4DrAwpkVWq3qavIC94OAJNeFOEW0IMWu/vXjshEV
 HitqMi5rE4NAdVZowmKRuZcDl5RbSgT2d+3BLRu2KTWQEbTNSMxgnGnB6UfTSJbCYVhw
 uExtmY7pMphJeL/Ib41fMYZ+aQMvbiaQZCu+DUNbvqStIv5nfOuVeBYmhnrvhecxcj2C
 dltA==
X-Gm-Message-State: AOAM530Va2PfZLvBiZ5578cxDiwfEAI4ELoBWCdw4q297QnW4GKH1VG8
 wOVNBItmgR7++12VL8+Md2k=
X-Google-Smtp-Source: ABdhPJx2ED58lZs4YjATtbxalaJYUotC9VyC+IQ3SDxiuYWG7Mq914reT3S60ysH/wYEjoGDi7VT+A==
X-Received: by 2002:a37:a0b:: with SMTP id 11mr6018192qkk.501.1591295382043;
 Thu, 04 Jun 2020 11:29:42 -0700 (PDT)
Received: from six (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id b12sm4888250qkk.43.2020.06.04.11.29.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Jun 2020 11:29:41 -0700 (PDT)
Date: Thu, 4 Jun 2020 14:29:38 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Subject: [PATCH v2 1/5] libxl: Generate golang bindings in libxl Makefile
Message-ID: <20200604182938.GA10975@six>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-2-george.dunlap@citrix.com>
 <5CF4AE1D-C80C-4E4C-B4AA-0779E7DC53E7@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5CF4AE1D-C80C-4E4C-B4AA-0779E7DC53E7@citrix.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> The simplest short-term way to fix this would be to remove the `go fmt` call from `gengotypes.py`.  It’s actually relatively unusual for generated code to look pretty (or even be looked at).  We could also consider adding in some “manual” formatting in gengotypes.py, like indentation, so that it doesn’t look too terrible.
> 
> Nick, do you have time to work on a patch like that?

Yes, I have time to work on a quick patch for this. I'll see what it
would take to add a bit of basic manual formatting, but of course the
original purpose of using gofmt was to avoid re-creating formatting
logic. I'll likely just remove the call to go fmt.

Out of curiosity, would it be totally out of the question to require
having gofmt installed (not for 4.14, but in the future)? I ask because
I haven't seen it discussed one way or the other.

Thanks,
-NR

