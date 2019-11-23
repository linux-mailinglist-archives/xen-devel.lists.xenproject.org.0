Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85A107FBA
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 19:02:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYZhT-0006uu-Po; Sat, 23 Nov 2019 18:00:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/vZ0=ZP=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1iYZhS-0006pl-Sq
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 18:00:02 +0000
X-Inumbo-ID: 125342f2-0e1b-11ea-b4d1-bc764e2007e4
Received: from mail-yb1-xb2c.google.com (unknown [2607:f8b0:4864:20::b2c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 125342f2-0e1b-11ea-b4d1-bc764e2007e4;
 Sat, 23 Nov 2019 18:00:02 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id i3so4081747ybe.12
 for <xen-devel@lists.xenproject.org>; Sat, 23 Nov 2019 10:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=RlYWxrc/5w04+jbCFKdRMqVMacjvEx9WekwaDfDbcac=;
 b=HTkHgYFldR8mKIsvpiq51PqudUTWJOhkI5icwp72dRKGTO2bnGFOit1WB8K6+NvtOn
 JXV3pW0v35/udga4boRQURkttfviElN3bjqr73tn3ucDTbvre9ZYm3FPRQ0N4wbh1qb9
 pnnW6AozTABMLt/2zScK2ScJi9cFR5cGI8PM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=RlYWxrc/5w04+jbCFKdRMqVMacjvEx9WekwaDfDbcac=;
 b=U7eadD70G5bV3yHcWL4U/aNMZjEUVrxob2RL682mbI4wa9rLrqaUKhU5U1DJ4ZVWyz
 U34Oz82iKtkxnnsS7BAfIy8yOysY5IUZZ/vv2aEZN/GAfFjiDXE6EaCudCcwo/pwaddW
 EeZOSD1e2b8LDZUIFqT/j3UJjmHP/WlyP4HUUESXi4+BQ+PpZM6lbvH8YO8D1pSHXzNT
 Wckki4yx8fxsCV9HzrS8CAEiUfRK7vhazZOtE/r0dCfm1J2IKAFBqc1ukv9DScvUyMlQ
 uOe8hZtp0+QDf6rIPw6+LW8Q9DsWUzlcvYjwtxr3+H0pVPRv+sAJKUcRLQACzRvIh9hj
 5H1w==
X-Gm-Message-State: APjAAAUDkwprc+JzQhC1W0G3EuNkgxN7rCkFSwrAHfwaVlBqsZ0bXhB0
 i3/aHZQpZXT6Qp0eMOx3gYzICQ==
X-Google-Smtp-Source: APXvYqxLlVZfRVlVfu5Vf0gLMJFptyQVXj+rdOnXgseEGZ59/JcXA83k3XuevlUqvrEZU8zIKtIwfA==
X-Received: by 2002:a5b:c4b:: with SMTP id d11mr15928932ybr.141.1574532001938; 
 Sat, 23 Nov 2019 10:00:01 -0800 (PST)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:eda2:5960:c986:e4ca])
 by smtp.gmail.com with ESMTPSA id i17sm868761ywg.66.2019.11.23.10.00.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 23 Nov 2019 10:00:01 -0800 (PST)
To: xen-devel@lists.xenproject.org
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <a1f4af5b-65f6-6ebf-37af-828cc7e6fff2@cardoe.com>
Date: Sat, 23 Nov 2019 12:00:00 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] tools/tests/x86_emulator causes build failures with
 older but supported compilers
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpQZXIgUkVBRE1FLCBHQ0MgNC4xLjIgc2hvdWxkIGxlYWQgdG8gYSBzdWNjZXNzZnVs
IGRlZmF1bHQgIm1ha2UgaW5zdGFsbCIgCnBlciBJTlNUQUxMLiBDdXJyZW50bHkgdGhpcyBpcyBm
YWlsaW5nIGR1ZSB0byB0b29scy90ZXN0cy94ODZfZW11bGF0b3IgCmJlaW5nIGluIHRoZSBkZWZh
dWx0IHBhdGggYW5kIHJlcXVpcmluZyBhIGNvbXBpbGVyIHdpdGggQVZYLiBHQ0MgNC40LjcgCm9u
IENlbnRPUyA2IGRvZXMgbm90IGhhdmUgdGhpcyBsZWFkaW5nIHRvIGEgZmFpbHVyZSB0byBidWls
ZC4KCjEyNjUgbWFrZVs1XTogRW50ZXJpbmcgZGlyZWN0b3J5IGAvYnVpbGRzL3hlbi1wcm9qZWN0
L3hlbi90b29scy90ZXN0cycKMTI2NiBtYWtlIC1DIHg4Nl9lbXVsYXRvciBpbnN0YWxsCjEyNjcg
Y2MxOiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQgbGluZSBvcHRpb24gIi1tYXZ4MiIKMTI2
OCBjYzE6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZCBsaW5lIG9wdGlvbiAiLW1hdng1MTJm
IgoxMjY5IGNjMTogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uICItbWF2
eDUxMmJ3IgoxMjcwIGNjMTogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9u
ICItbWF2eDUxMmRxIgoxMjcxIGNjMTogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUg
b3B0aW9uICItbWF2eDUxMmVyIgoxMjcyIGNjMTogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5k
IGxpbmUgb3B0aW9uICItbWF2eDUxMnZibWkiCjEyNzMgL3RtcC9jY01rTHBUVi5zOiBBc3NlbWJs
ZXIgbWVzc2FnZXM6CjEyNzQgL3RtcC9jY01rTHBUVi5zOjM6IEVycm9yOiBqdW5rIGF0IGVuZCBv
ZiBsaW5lLCBmaXJzdCB1bnJlY29nbml6ZWQgCmNoYXJhY3RlciBpcyBgeycKMTI3NSBtYWtlWzZd
OiBFbnRlcmluZyBkaXJlY3RvcnkgCmAvYnVpbGRzL3hlbi1wcm9qZWN0L3hlbi90b29scy90ZXN0
cy94ODZfZW11bGF0b3InCjEyNzYgTWFrZWZpbGU6MTE2OiBUZXN0IGhhcm5lc3Mgbm90IGJ1aWx0
LCB1c2UgbmV3ZXIgY29tcGlsZXIgdGhhbiAiZ2NjIiAKKHZlcnNpb24gNC40LjcpIGFuZCBhbiAi
e2V2ZXh9IiBjYXBhYmxlIGFzc2VtYmxlcgoxMjc3IG1ha2VbNl06IE5vdGhpbmcgdG8gYmUgZG9u
ZSBmb3IgYGluc3RhbGwnLgoKRnVsbCBsb2cgaGVyZTogaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1w
cm9qZWN0L3hlbi8tL2pvYnMvMzU4ODUyOTc4I0wxMjY2CgpXZSBoYXZlIDIgb3B0aW9ucyBmb3Ig
dGhlIG5leHQgcmVsZWFzZToKCjEuIEJ1bXAgdGhlIG1pbmltdW0gR0NDIHJlcXVpcmVtZW50IGZv
ciB0aGUgdHJlZSBhbmQgZHJvcCBhbnkgc3VwcG9ydCAKZm9yIGFueSBkaXN0cm8gbm90IG1hdGNo
aW5nIHRoYXQgcmVxdWlyZW1lbnQuCgoyLiBGaXggdGhlIGRlZmF1bHQgYnVpbGQgdG8gd29yayB3
aXRoIG9sZGVyIEdDQyB2ZXJzaW9ucy4KClRoYW5rcy4KCi0tCgpEb3VnCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
