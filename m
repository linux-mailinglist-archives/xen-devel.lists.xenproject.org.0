Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A539425B5CA
	for <lists+xen-devel@lfdr.de>; Wed,  2 Sep 2020 23:23:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDaDj-00079a-H7; Wed, 02 Sep 2020 21:23:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KHJQ=CL=gmail.com=don.slutz@srs-us1.protection.inumbo.net>)
 id 1kDaDh-00079T-CN
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2020 21:23:05 +0000
X-Inumbo-ID: 4a81301e-c58a-417a-bb83-7da138b76951
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a81301e-c58a-417a-bb83-7da138b76951;
 Wed, 02 Sep 2020 21:23:04 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id u3so1147278qkd.9
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2020 14:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=FA2Q+92KrLAynkYbwhLm38V+xCaDMSN+uVvaab6mjW0=;
 b=hFtvBoBFHCJqCLuvAAaEbOfZP4pi9a0yxJlO8LjNyxnUClJZ1Bv8HDQ8FHVidwuWH+
 jZ6npHVk9XO2FBgQ65CUnr07RS5zh0RfVHqOailQHIjxKd66yp/nBBwsrj9iPWosisAl
 9mbrYpgEC1quWWuxdlnzPqARh5VL6oo/Mf38TXGkUcmrS+MXsgX6IUUeBXu6wUixV0Tl
 4fAf2ndl5y4KKCt2IRYzWi6Y5pjXz5meM/HHZ88x7HaOSw81jaaacTPr86+0BFRX1e/L
 yZcFS9pQzsvz3LLF0sDZLj0mUbS3+iVIeTEmkKneAe1GhAuKY5YHHnIk33/0QiEHnKeO
 pXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FA2Q+92KrLAynkYbwhLm38V+xCaDMSN+uVvaab6mjW0=;
 b=JurXL8nQ9wfpsdh5cLY5NnKfHeaw59Bmpig/6oeKMZCX6KKn27JgkJViKDysWM6LFb
 mIl5lxmTMK9RhtifjxuRZjx04mrWI/Zoonc/5jx6EqKNuINgklIwWkdFKy/l+m75ssIE
 HRmHhJYXp5SZCKJJReoQXCLeHPGxWGqgfObXV3klEXRDsGut68mEQRV2K29Ylt5tydEl
 aeHO6xPL5Sz6NQ+3JwpaFm5qfD87IAwOya9wFCMudzWmqQ4oPFIj4F+wiYZdBPFg9t+2
 w1C5WGlPoS75i0LBv4wbzgB72zkfSoorneiuWrQlGvkYQlY0b8n8wOj5PjMms4/g1r9J
 8wpw==
X-Gm-Message-State: AOAM5315GT87fsIWTEJjq8YNk7Sy/7ESy/noc5xMiMoe1JjvBDDCtcaI
 4RZWDV/xcs+q+gaUhDayvVY=
X-Google-Smtp-Source: ABdhPJxIizdhaO8O9f/EbV12/Dzm7mmwWEjNAFcdgnNCWamlHSwRhoRaYNdhQHhizlLADg/M/dJYBQ==
X-Received: by 2002:a37:a2d2:: with SMTP id l201mr16754qke.454.1599081784211; 
 Wed, 02 Sep 2020 14:23:04 -0700 (PDT)
Received: from [10.87.11.139] (pool-96-230-225-98.bstnma.fios.verizon.net.
 [96.230.225.98])
 by smtp.gmail.com with ESMTPSA id m138sm671078qke.99.2020.09.02.14.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 14:23:03 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com>
Subject: Re: [PATCH v3 1/8] x86: fix compat header generation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
 <c2cb193c-f162-485e-1997-fb74e40c0cc5@suse.com>
 <83dfb28c-bb94-e582-b437-39e37f026741@suse.com>
Message-ID: <d2f0abf4-37f1-7072-64e4-f524fd128551@Gmail.com>
Date: Wed, 2 Sep 2020 17:23:04 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <83dfb28c-bb94-e582-b437-39e37f026741@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 8/31/2020 9:07 AM, Jan Beulich wrote:
> unmatched group

I just got to this today.  The following work for me with python 3.4.6, 
basically add an extra group that is not part of a conditional match:

 From 0ee501b7491cf62e18a454dcebc12b1b6d36e9e9 Mon Sep 17 00:00:00 2001
Message-Id: 
<0ee501b7491cf62e18a454dcebc12b1b6d36e9e9.1599081619.git.don.slutz@gmail.com>
From: Don Slutz <don.slutz@gmail.com>
Date: Wed, 2 Sep 2020 17:18:43 -0400
Subject: [PATCH] Add extra group to avoid python bug 3.4.6 about 'unmatched
  group'

Signed-off-by: Don Slutz <don.slutz@gmail.com>
---
  xen/tools/compat-build-header.py | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/tools/compat-build-header.py 
b/xen/tools/compat-build-header.py
index 54c121b..ca706ce 100755
--- a/xen/tools/compat-build-header.py
+++ b/xen/tools/compat-build-header.py
@@ -11,8 +11,8 @@ pats = [
   [ r"__UnDeF__", r"#undef" ],
   [ r"\"xen-compat.h\"", r"<public/xen-compat.h>" ],
   [ r"(struct|union|enum)\s+(xen_?)?(\w)", r"\1 compat_\3" ],
- [ r"typedef(.*)@KeeP@(xen_?)?([\w]+)([^\w])",
-   r"typedef\1\2\3 
__attribute__((__aligned__(__alignof(\1compat_\3))))\4" ],
+ [ r"typedef(.*)@KeeP@((xen_?)?)([\w]+)([^\w])",
+   r"typedef\1\2\4 
__attribute__((__aligned__(__alignof(\1compat_\4))))\5" ],
   [ r"_t([^\w]|$)", r"_compat_t\1" ],
   [ r"int(8|16|32|64_aligned)_compat_t([^\w]|$)", r"int\1_t\2" ],
   [ r"(\su?int64(_compat)?)_T([^\w]|$)", r"\1_t\3" ],
-- 
1.8.3.1



