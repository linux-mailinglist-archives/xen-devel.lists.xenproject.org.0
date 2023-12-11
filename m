Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BEA80D350
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 18:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652421.1018243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCjoZ-0002w7-A9; Mon, 11 Dec 2023 17:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652421.1018243; Mon, 11 Dec 2023 17:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCjoZ-0002uS-7E; Mon, 11 Dec 2023 17:11:31 +0000
Received: by outflank-mailman (input) for mailman id 652421;
 Mon, 11 Dec 2023 17:11:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o7SW=HW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rCjoX-0002t5-7f
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 17:11:29 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51a2e66d-9848-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 18:11:27 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c3984f0cdso30375215e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 09:11:27 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b0040b45282f88sm15765023wmq.36.2023.12.11.09.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 09:11:26 -0800 (PST)
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
X-Inumbo-ID: 51a2e66d-9848-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702314686; x=1702919486; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PBi9RoG7GrYJVhJ238mTXZgVSQnygV0KBbXwbLs6I/w=;
        b=eJ9yfZMk/r3XjOXSUQ0DavbCHRK/IqLhaJNC+3MV/G4au143U6xild0iPp1pmdt4Hc
         SgE9P52/2DMJcgErrpAPxzNKi/Yhwpa/RidZRzN7JouUQE4UQmUYMoAL9gF9pkBZvZh+
         Sbj9th8kb49R/u9NfdNrKJxAUn1R3mjTW0Drg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702314686; x=1702919486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBi9RoG7GrYJVhJ238mTXZgVSQnygV0KBbXwbLs6I/w=;
        b=eeDUt6QYz0WsGBgsIvrIsp1HWBFJBliubMl7fTi0BqkjPmqWXSIK7/sHOZI5QN384b
         uE222PSUzY7psvFOyOfovLL436M3KF2YyixjNDilk1nRpe4WfJjM9NRi7/xwZyx49Vcf
         34xiMGapVekTa5aqPDhNqEf/toq3Dp/cNiI7V2yoxz1x9z3EO0mBhxPmXkRQauPOVZTS
         0PUBw/Ru2okoARU9/PdCPP52P89NadDyqYSPqQ1g6nyvl1C9lPqoY4ghC8rd2LNkuDNz
         9Us1UIIb5t+f1JAbVeB8tD9DxKDG5OuKT2WEdH68UV9LXqqtTYYmElnDH5Azc6JfTrPE
         KbQQ==
X-Gm-Message-State: AOJu0YzhIXLevE9Y9QZ26popchnMY0HYSTIhY+fg2jwAnKYw3evtD0yk
	nNOj1kVG7Fotr/xOcDBKZ8EjGw==
X-Google-Smtp-Source: AGHT+IFxa28KcVWgnunpPeNsbIpAGfRSzUfhQUgMJmbukz+o+v3aiXykQ6QVc7XKmJ3ZJqvt59HdmA==
X-Received: by 2002:a7b:c8c8:0:b0:40b:5e21:dd44 with SMTP id f8-20020a7bc8c8000000b0040b5e21dd44mr2677240wml.114.1702314686563;
        Mon, 11 Dec 2023 09:11:26 -0800 (PST)
Date: Mon, 11 Dec 2023 17:11:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/pygrub: Drop compatibility symlink
Message-ID: <054ff206-4510-4d52-b1b8-b80adc25b4e1@perard>
References: <20231123163023.2158134-1-andrew.cooper3@citrix.com>
 <232da84f-08d0-4bec-9eca-0bef023dae37@citrix.com>
 <b0133fa8-a774-4587-a1ed-4059f97970f9@xen.org>
 <CA+zSX=aHisr_MKEqXpe2DH9PGF=sTpqZrOQhkss623ttfRWZXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+zSX=aHisr_MKEqXpe2DH9PGF=sTpqZrOQhkss623ttfRWZXg@mail.gmail.com>

On Fri, Dec 08, 2023 at 03:43:16PM +0000, George Dunlap wrote:
> On Fri, Dec 8, 2023 at 3:36 PM Julien Grall <julien@xen.org> wrote:
> 
> > See above, I think this code is under the remit of Anthony. You haven't
> > CCed him so no surprise no-one answered.
> 
> Additionally, my old citrix address *was* cc'd, but I only have the
> 'ping', not the original email in my work mailbox.
> 
> I'm tempted to suggest adding a hack to libxl, so that /usr/bin/pygrub
> automatically falls back to the libexec directory if /usr/bin/pygrub
> doesn't exist.  (I'd be happy to code something up if we decided to go
> that route.). OTOH, I can see the argument that 11 years and the
> CHANGELOG entry is enough.

Well, at least you have printed a warning log message to all of those
whom still use the full old path to pygrub, with
    c31d6a7ee2ea ("libxl: Warn that /usr/bin/pygrub is deprecated")
So, I don't think more than that is needed. At least, now they would
also get an error saying /usr/bin/pygrub wasn't found, I think.

Cheers,

-- 
Anthony PERARD

