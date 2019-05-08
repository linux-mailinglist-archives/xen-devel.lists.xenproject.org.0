Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F417B20
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 15:58:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hON1i-0003th-W0; Wed, 08 May 2019 13:54:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+xT=TI=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hON1i-0003tc-7X
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:54:30 +0000
X-Inumbo-ID: cb8acaf9-7198-11e9-843c-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb8acaf9-7198-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 13:54:28 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y10so7939856lfl.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2019 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bdGfT/8ZcR/5i3b4VBSw5aIO+jVwQcxNKJAyfgaw64A=;
 b=sDrh0M5HOJR86Uch8nLXxKkHcb9f4Pvo3TEBCGpuZQigLF2CubHVK5x68aXq93zC/p
 38O4c1RLoxJyvlD8mT55PGbGZjpyxzBIFrvhrwk611kNlHwmwNNHmT+Uoe7gtHCwGEXR
 ymXz3uXOaxfHyERQ/24onQAkHAa2AQnfND5F82PM6P/DoSOQsnxeb3UNYUKplYxGkUAV
 9RyGHDxx81XDBaiEmMMYLrSPNA3SvhdyOqqUfzePIfbAm1VLOYsmlXUwjvARCtAyV3nB
 46fNpr1a83BTwimERAlaxHfKYeTxHjlGUc9U654itk1VESUzso+auEVrLqJMxRl1UzgL
 A/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bdGfT/8ZcR/5i3b4VBSw5aIO+jVwQcxNKJAyfgaw64A=;
 b=E8ktQGEVcv8J2XRgzZdRUzGyrb2exd2tOnfwjj5JQh3vKFw63kU0jmyuR4VMnN3LTb
 9n/oKkIc13pqhF7Dq3bOfYXhNuvN7b0y2ppM8vsJJPgOOhVOn7xuYFlA8VNEcPBxLQwN
 +TVnYSPJNXcwECRQZqn4RlyeqqbqE1tWIuxOn1ZD9lqJYcC1ZIdwHNqRqKZzOmTGNDvu
 5EoO+07a8wK5/qlMCiqBCrbOADn9Kx5808IyJSUqoIMOqr9iNwXU3+ovOIVzs0uoricZ
 36ASfSl5XqGpfdL5KfyDVqs3rjMA7IvXZ3GQ9M0mXAFV0gW2sFEspFErPFPyiYQBQXsd
 Ja3A==
X-Gm-Message-State: APjAAAVq30xWx9+1xFF+6z+sdGBeT0RPuj1kEnKn/ouxJJOsKotPbZ8I
 OzJAn15gdOwE5xaYRK6aEBw=
X-Google-Smtp-Source: APXvYqxFcEwGyslmaezLaCdrwdA2YAdMavyw+Ns/6EPyQuASLFrGmZ8LmYQnCq84vBfoqbsT9/GDzw==
X-Received: by 2002:ac2:54b7:: with SMTP id w23mr4146309lfk.139.1557323666947; 
 Wed, 08 May 2019 06:54:26 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 l15sm3530850lji.5.2019.05.08.06.54.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 May 2019 06:54:26 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <fa126315-31af-854e-817a-8640b431c82b@arm.com>
 <CAC1WxdiMzAq5hRC-mhRQuFDs7z_Hj5w7VAy52ec87SJQOGmp3w@mail.gmail.com>
 <a28f95a1-d9da-2caf-f4b4-013100176b02@arm.com>
 <090ce8cc-f329-fe54-4894-b7f12e3cd5a6@gmail.com>
 <3d5ccdcb-d777-e75b-f4bd-38d2d470a754@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <0bd113db-7851-df02-90d1-2a79bd4bedaf@gmail.com>
Date: Wed, 8 May 2019 16:54:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3d5ccdcb-d777-e75b-f4bd-38d2d470a754@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMDguMDUuMTkgMTY6MzksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGF0J3MgYSB0cmFuc2xhdGlvbiBmYXVsdCBsZXZlbCAwIG9uIGEgc3RhZ2UtMSBwYWdlLXRhYmxl
IHdhbGsuIFRvIGNvbmZpcm0geW91IGhhdmUga3B0aSBkaXNhYmxlZCwgcmlnaHQ/ClllcywgS1BU
SSBpcyBkaXNhYmxlZC4gVGhhdCdzIHdoeSBJJ20gY3VyaW91cyB3aGF0J3Mgd3Jvbmcgd2l0aCB0
aGF0LgoKPiBEb2VzIGl0IGFsd2F5cyBmYWlsLCBvciBvbmx5IHRpbWUgdG8gdGltZT8KSXQgaGFw
cGVucyBvbiBib290LiBBbmQgdGhvc2UgcHJpbnRzIGFyZSBwZXJtYW5lbnQgYW5kIG1ha2VzIGJv
b3QgdGltZSBlbm9ybW91cy4gSSBvbmNlIHdhaXRlZCB0aWxsIHVzZXIgcHJvbXB0IChoYWxmIGFu
IGhvdXIgb3Igc28pLCB0aGV5IGNhbG1lZCBvbiB2aXNpYmxlIGlkbGUsIGJ1dCBwcmludGVkIGZy
b20gdGltZSB0byB0aW1lIChtYXliZSBvbiB1c2Vyc3BhY2UgYWN0aXZpdGllcykuCgo+IENvdWxk
IHlvdSBkdW1wIHRoZSBndWVzdCByZWdpc3RlciB3aGVuIHRoaXMgaGFwcGVuPwpDb3VsZCB5b3Ug
cGxlYXNlIHJlbWVtYmVyIGhvdyB0byBkbyB0aGF0PwoKPiBFdmVuIHdpdGgga3B0aSBkaXNhYmxl
ZCwgeW91IGFyZSBzdGlsbCBwb3RlbnRpYWxseSBmYWNpbmcgaXNzdWUgdXNpbmcgdmlydHVhbCBh
ZGRyZXNzIChhbHRob3VnaCB0aGV5IG1heSBiZSBtb3JlIGRpZmZpY3VsdCB0byB0cmlnZ2VyKS4g
SW5kZWVkLCB5b3UgYXJlIHJlbHlpbmcgb24gdGhlIGd1ZXN0IE9TIHRvIHVubWFwIHRoZSByZWdp
b25zIG9yIHRvdWNoIHRoZSBwYWdlLXRhYmxlcyBlbnRyaWVzIHVzZWQgZm9yIHRoZSB3YWxrLgoK
PiBVbmZvcnR1bmF0ZWx5IHdlIGNhbid0IHByZXZlbnQgYSBndWVzdCBwbGF5aW5nIHdpdGggaXRz
IHBhZ2UtdGFibGUuIFNvIGF0IGJlc3Qgd2UgY2FuIG9ubHkgd29ya2Fyb3VuZCBpdC4KQW5kIHRo
YXQncyB3aHkgd2UgdHVybmVkIHRvIGd1ZXN0IHBoeXMgYWRkcmVzcyB1c2VkIGZvciBydW5zdGF0
ZSBhcmVhLgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
