Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DE7E0B8E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 20:39:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMz0L-0007Ib-DN; Tue, 22 Oct 2019 18:35:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C0wU=YP=netronome.com=jakub.kicinski@srs-us1.protection.inumbo.net>)
 id 1iMz0J-0007IU-My
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 18:35:35 +0000
X-Inumbo-ID: bbee0d0e-f4fa-11e9-8aca-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbee0d0e-f4fa-11e9-8aca-bc764e2007e4;
 Tue, 22 Oct 2019 18:35:35 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id f5so6198711lfp.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=dPjuP+VmWSvLVAg6NKGM3Tn3kuQc1C/B6A+vpJASWdY=;
 b=ZY+eGwNS1QBTYwz/CjaNPAO/9O6VCd5l8HjrB1XlkYYK1I9HAT/tr9qxWAVDZnIMy3
 COZ1QAjvsk8hTeflE3BH/PlnIhFWEn/Rm6UySdg7QOhbGZcI6UtNAlydLnRE3SYphZ3V
 e7xZE7D9WZgmpmyfNmfVyDDcGPQIgkJNcrz4W5d2Kx4N4p2uO/u+QZoOjCPM2KDwx/cH
 YsaH3ADlMAlnRjTgo/J11f8iei1l162PDU+pCBuUNceTD6X+xwUs0ggc/pNjRES05xYX
 GVeOFockjWvAoMSD6NiUKuqkK0JhQCf7YwXZK1sjvGhmiUnrHtx0Ts064NF8RtXeXOGH
 2nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=dPjuP+VmWSvLVAg6NKGM3Tn3kuQc1C/B6A+vpJASWdY=;
 b=cYE6HShyLSRQIxAXc6y7jG2sDO2RBDsW7FtgUcIDUioCHRCWqW5B9aJhwlTUC+sP/h
 jTTIRl6MOFA0eqSgLudaWHLqDzaTySZ5vb80KPHk3TsPPC++9gC/gZ/w/g4lKcdkJLQ4
 4g53Gpw5QZj7Asp7Sd/XqMHn7jeL3PZvcr8QhHuQzLnXxagW3JQrwvi5/U0VueU4eALI
 RfPA3zHLco9XzJarj433ODbdeIpQfXFKrr0j+ZZBH0el/eRmqoOFqARbmkA5///gzpz6
 FA0LOMM4wAU8H6/hRT1kevV+o23hPyg6avtvH39wQCddexPB9lbxzj1CWOeM4Lt6Ui7U
 0FHQ==
X-Gm-Message-State: APjAAAWf/iwtObZgA3Cr5d0eTu1Xf9K+bS695yXt0KUjem1+SveGoaLl
 Czg7hltBx60ZjdqMllElbUJAWQ==
X-Google-Smtp-Source: APXvYqzhCd56Nx8O4+lldDDoiyHjvdnSJlA1XNHIMqwmMg9D7RLGjAvgsrRnfY16rQphZvyzjEjxXw==
X-Received: by 2002:a19:7516:: with SMTP id y22mr19388885lfe.57.1571769333823; 
 Tue, 22 Oct 2019 11:35:33 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id t8sm15056191ljd.18.2019.10.22.11.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 11:35:33 -0700 (PDT)
Date: Tue, 22 Oct 2019 11:35:27 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20191022113527.6b6bf615@cakuba.netronome.com>
In-Reply-To: <20191021053052.31690-1-jgross@suse.com>
References: <20191021053052.31690-1-jgross@suse.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/netback: cleanup init and deinit code
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
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMSBPY3QgMjAxOSAwNzozMDo1MiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
PiBEbyBzb21lIGNsZWFudXAgb2YgdGhlIG5ldGJhY2sgaW5pdCBhbmQgZGVpbml0IGNvZGU6Cj4g
Cj4gLSBhZGQgYW4gb21uaXBvdGVudCBxdWV1ZSBkZWluaXQgZnVuY3Rpb24gdXNhYmxlIGZyb20K
PiAgIHhlbnZpZl9kaXNjb25uZWN0X2RhdGEoKSBhbmQgdGhlIGVycm9yIHBhdGggb2YgeGVudmlm
X2Nvbm5lY3RfZGF0YSgpCj4gLSBvbmx5IGluc3RhbGwgdGhlIGlycSBoYW5kbGVycyBhZnRlciBp
bml0aWFsaXppbmcgYWxsIHJlbGV2YW50IGl0ZW1zCj4gICAoZXNwZWNpYWxseSB0aGUga3RocmVh
ZHMgcmVsYXRlZCB0byB0aGUgcXVldWUpCj4gLSB0aGVyZSBpcyBubyBuZWVkIHRvIHVzZSBnZXRf
dGFza19zdHJ1Y3QoKSBhZnRlciBjcmVhdGluZyBhIGt0aHJlYWQKPiAgIGFuZCB1c2luZyBwdXRf
dGFza19zdHJ1Y3QoKSBhZ2FpbiBhZnRlciBoYXZpbmcgc3RvcHBlZCBpdC4KPiAtIHVzZSBrdGhy
ZWFkX3J1bigpIGluc3RlYWQgb2Yga3RocmVhZF9jcmVhdGUoKSB0byBzcGFyZSB0aGUgY2FsbCBv
Zgo+ICAgd2FrZV91cF9wcm9jZXNzKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50
QGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbmV0LW5leHQsIHRoYW5rcyEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
