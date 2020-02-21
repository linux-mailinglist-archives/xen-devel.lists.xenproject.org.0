Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8C167B65
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 11:54:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j55uA-00029Q-WF; Fri, 21 Feb 2020 10:51:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j55u9-00029L-82
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 10:51:33 +0000
X-Inumbo-ID: 1e1f3f82-5498-11ea-8623-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e1f3f82-5498-11ea-8623-12813bfff9fa;
 Fri, 21 Feb 2020 10:51:31 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id r21so1821607edq.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 02:51:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zUs+q2XTJgmZqzi2EcjcLPs/D8n9r+lfPhLqHZHggX8=;
 b=fPRuEV5vOTnefu0YPuL9s42Gpl87Yl/KMAMOvm9TfDC+GR8ejWGpoI/aSq1m8CNkGL
 JXnIEOTKBpF786hHOhj03HUPFnz6RtQUmwSw2z5ubIYqJ2OAauP+cN5P1vMNDUSZ9SDH
 X51wQ6FVsS9P8jO3fDEqv5cIey9KPop2KNv+USOASQDkgVyHDPgIxovKmuCpvGQJV2xO
 PdEzFWVBQCBgrQ8nzx510hcnOfRvN3k9boNYspztgWtZqxW/0bCgu3wCWcf/NqE/At1m
 xBsoDIM7a2SacEPN9UD/Atl0djPJM7x09Xt1oXf8P4W+qLzwOTz1Yu+WNpclKIL16S5n
 OR6Q==
X-Gm-Message-State: APjAAAUHCkUunDMZTB8wlKbLO7NbfwD+I4PFigtq5PiD03N4ErszKAas
 WwkkqOlaymgkd1E+im7xVdM=
X-Google-Smtp-Source: APXvYqy+xFFz5cPNCaLt7lvgI1tU3VcFQg84RwQOmXrW1oEnb9aeBDNR9AkCB/KBhy3CIMAXyx2tEw==
X-Received: by 2002:a17:906:c444:: with SMTP id
 ck4mr32964085ejb.224.1582282290179; 
 Fri, 21 Feb 2020 02:51:30 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id cw10sm176653ejb.56.2020.02.21.02.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 02:51:29 -0800 (PST)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
References: <20200221103851.7855-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e0f82927-919b-e93b-c07f-bfe4d5b85fe9@xen.org>
Date: Fri, 21 Feb 2020 10:51:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221103851.7855-1-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] x86/mm: fix dump_pagetables with Xen PV
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDIxLzAyLzIwMjAgMTA6MzgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4g
Q29tbWl0IDJhZTI3MTM3YjJkYjg5ICgieDg2OiBtbTogY29udmVydCBkdW1wX3BhZ2V0YWJsZXMg
dG8gdXNlCj4gd2Fsa19wYWdlX3JhbmdlIikgYnJva2UgWGVuIFBWIGd1ZXN0cyBhcyB0aGUgaHlw
ZXJ2aXNvciByZXNlcnZlZCBob2xlCj4gaW4gdGhlIG1lbW9yeSBtYXAgd2FzIG5vdCB0YWtlbiBp
bnRvIGFjY291bnQuCj4gCj4gRml4IHRoYXQgYnkgc3RhcnRpbmcgdGhlIGtlcm5lbCByYW5nZSBv
bmx5IGF0IEdVQVJEX0hPTEVfRU5EX0FERFIuCj4gCj4gRml4ZXM6IDJhZTI3MTM3YjJkYjg5ICgi
eDg2OiBtbTogY29udmVydCBkdW1wX3BhZ2V0YWJsZXMgdG8gdXNlIHdhbGtfcGFnZV9yYW5nZSIp
Cj4gUmVwb3J0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gU2lnbmVkLW9m
Zi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKSSBjYW4gY29uZmlybSB0aGUg
Y3Jhc2ggaGFzIG5vdyBkaXNhcHBlYXJlZDoKClRlc3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
