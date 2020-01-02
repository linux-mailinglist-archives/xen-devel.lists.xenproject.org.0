Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEF112E8EB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 17:49:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in3by-0003KZ-BR; Thu, 02 Jan 2020 16:46:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3gH+=2X=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1in3bw-0003KU-LV
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 16:46:12 +0000
X-Inumbo-ID: 614a1556-2d7f-11ea-a398-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 614a1556-2d7f-11ea-a398-12813bfff9fa;
 Thu, 02 Jan 2020 16:46:10 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so6203506wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2020 08:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z/hOgGyhp7qvJW/OmK7gnv74s+vBT4CU6l2oRQ+8APk=;
 b=av2Rv4UsBbuT/aCpxncfKBLiUTNrBEy1/PkaCIY60UgO6vPnBREX0TIQXQDe6xj2J8
 79V8cDC8oxY4CRvMofLbdJep18QtfrGS3Gi/PQ/8W4rJoYvaCxhgjKAmIR4LzIu1sVFe
 DfRvcx4DOURhOBvGgImDbtNFrwz9JUsvtjlgx4+yRZyvUXI7yPzrMRHYJDAn2t/LxeZO
 NDH0lMXgBcUWNQYti7DYsJlKN6KVF1pWNd9z7aSUso8/Mx4FiGe8YEdQUgBXmQ+27jkC
 Y4b73Z9o4A2Zw98jv1WCvfSn44AY7q+x2X7JYGXqELvoR0bPqrerq9hmdjPUrQWXDL2t
 0Zrg==
X-Gm-Message-State: APjAAAWeLVWqzFsOhvJvN8uMeYGBBvUKhZmzjaCipH5W9QB+7oCF/i8j
 0vYRJ3frOsyGN/f2rtGKCnM=
X-Google-Smtp-Source: APXvYqxNYptk7MXSBgV06sS73vKhz0WEpJxMSGLulkQNziiy8Uh0nJ3Dv3ZggBpGOqnLXZkhLinNpA==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr14718787wmc.168.1577983570062; 
 Thu, 02 Jan 2020 08:46:10 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id t12sm56602130wrs.96.2020.01.02.08.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 08:46:09 -0800 (PST)
Date: Thu, 2 Jan 2020 16:46:07 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200102164607.ichqzymxpwnb4pno@debian>
References: <20200102135624.30787-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102135624.30787-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/efi: Drop infinite loops and use
 unreachable()/noreturn
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDIsIDIwMjAgYXQgMDE6NTY6MjRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CgpQcmVmZXJhYmx5IHdpdGggb25lIGFkZGl0aW9uYWwgYWRqdXN0bWVudCBi
ZWxvdy4KCj4gIAo+ICBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfY2ZnX2ZpbGVfZWFybHko
RUZJX0ZJTEVfSEFORExFIGRpcl9oYW5kbGUsIGNoYXIgKnNlY3Rpb24pCj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZWZpL2Jvb3QuYyBiL3hlbi9jb21tb24vZWZpL2Jvb3QuYwo+IGluZGV4IDNm
MWMzMzBhZmUuLjFiN2RjMTYwNTYgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9lZmkvYm9vdC5j
Cj4gKysrIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCj4gQEAgLTE0MDIsNyArMTQwMiw2IEBAIGVm
aV9zdGFydChFRklfSEFORExFIEltYWdlSGFuZGxlLCBFRklfU1lTVEVNX1RBQkxFICpTeXN0ZW1U
YWJsZSkKPiAgICAgIGVmaV9leGl0X2Jvb3QoSW1hZ2VIYW5kbGUsIFN5c3RlbVRhYmxlKTsKPiAg
CiAgICAgIGVmaV9hcmNoX3Bvc3RfZXhpdF9ib290KCk7IC8qIG5ldmVyIHJldHVybnMgKi8KCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
