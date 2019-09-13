Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4514DB23FD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 18:22:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8oIH-00070r-E4; Fri, 13 Sep 2019 16:19:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QaHn=XI=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i8oIF-00070m-Kr
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 16:19:31 +0000
X-Inumbo-ID: 438037c4-d642-11e9-a337-bc764e2007e4
Received: from mail-lj1-x22d.google.com (unknown [2a00:1450:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 438037c4-d642-11e9-a337-bc764e2007e4;
 Fri, 13 Sep 2019 16:19:30 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id e17so27632617ljf.13
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2019 09:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=3QOU4SW3HczReJK9sPpmwa8lC6FvI/pGzxexuXmsXGE=;
 b=m9QlrHIzYou1YVlvroIYN4EE85c61ULbw2oTBBgw3MudaWHK9gIc0g1jIp/X9PR0nt
 660mZx4j9wxrFMtJvE8k+vQU0UkPHnEK2Oh2qMKs9TyH4R3XX+VQzrxVqKBzGiW6rxaD
 SmGAua9dA+eZ5rVbBJD7TpFyCTTa8KmsRalegBioWEC3nI83TM6hSvjrcnzUZ9510DwA
 iEugixGzL3nl2S+BwJ/vcoxnaLz0uvnnUT+jKi66ezdKcHzEoySuoYuL+BVkGjspCwpY
 UtANL7UDVlRW4+156l23VmPSdOgAR3jESewY089OcYGvbT/phHqAfr76ui+MOWAEw312
 rt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3QOU4SW3HczReJK9sPpmwa8lC6FvI/pGzxexuXmsXGE=;
 b=XO8w8Sw7Jae9qHK9m99fqQ8EjSAEjP0MttZCPD87ZZ1Qxj7CjhhFiN1pIIfOxNqQVy
 BJmpr1VmOZvu6g6fJDIhdhirdN42dEwNiairs7/1/dwQdAhw4aoS8F0aqe00vd/MPEo1
 l1GoOcHxtJrFtSshupCn/3hYQUk7Fq8Zh+08IWgJ3lZGyaVIf+6Qkvz4w/MUpm8rfcgv
 Zbj8MNnw3OdWiesaAbJqiRUFS55BKdolm4QogTWF50Ff/Je2CFX3qSudGf/vZERp5mom
 VV8dIBc+5HSbk39BQjIkLbT8C+H7vWNqdNkbuFIO+E5N70FS3hlrF4TE54EsWbG8PYGc
 tscg==
X-Gm-Message-State: APjAAAXikwTkysnNsOdqGnx28DFMs+AVGhus3DiUydrp8Zb567snouF3
 KqGmXYffcEWlgzkZHkZ7D6s2Mto6iWE=
X-Google-Smtp-Source: APXvYqzTmmyPhgfsFx/qHeAXLGUc80yn5DWDPvVBGggmo3kR0nSn5sKfIdN4IXUowSoGEXYnCzQUSA==
X-Received: by 2002:a2e:808e:: with SMTP id i14mr2303662ljg.198.1568391569471; 
 Fri, 13 Sep 2019 09:19:29 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id h10sm5000359ljb.14.2019.09.13.09.19.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Sep 2019 09:19:28 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <20190906074058.21782-1-jgross@suse.com>
 <CAMmSBy_huA=jDwwGfzN1cB8zt3DNP5iJZNSQ_doe1RK-4kzw8Q@mail.gmail.com>
 <d5975dd9-250f-5e8e-e3b2-3728cf652449@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a83870a9-b11f-c868-e602-1b0e52ddd465@gmail.com>
Date: Fri, 13 Sep 2019 19:19:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d5975dd9-250f-5e8e-e3b2-3728cf652449@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpLCBKdWVyZ2VuCgpJIGhhdmUganVzdCBwdXNoZWQgbmV3IHZlcnNpb24sIHNvIHBsZWFzZSB1
cGRhdGUKCgo9PT0gQVJNID09PQoKKsKgIFJlbmVzYXMgSVBNTVUtVk1TQSBzdXBwb3J0ICsgTGlu
dXgncyBpb21tdV9md3NwZWMgKFY0KQogwqDCoCAtwqAgT2xla3NhbmRyIFR5c2hjaGVua28KCgot
LSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
