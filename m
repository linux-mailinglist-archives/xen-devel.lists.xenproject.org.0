Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FCE5DD7F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 06:37:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiWy3-0001WR-Rc; Wed, 03 Jul 2019 04:34:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ilX4=VA=gmail.com=minwoo.im.dev@srs-us1.protection.inumbo.net>)
 id 1hiT0s-0007E7-8d
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 00:20:42 +0000
X-Inumbo-ID: 63ef8d4e-9d28-11e9-8980-bc764e045a96
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 63ef8d4e-9d28-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 00:20:41 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id t16so251707pfe.11
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2019 17:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QHKCluGePZIU+McyVTxFHH0xCNV+DoEpqMdH3e/keAo=;
 b=ObfM7XHImA5a27zt4S10HFUJ96clje++hGYVuQoAy3Hjpnh6j1qvPypP3WUNf5sUZe
 SEL6s0+eviFcMAAHvCDg52Wrei5IfwJmtqa3+/Tp9tsPVdP6yGI3cOR+6i7pk4MDh6Pl
 E8i9pB8c24cYdb3Qyfj3kT9q54j5mnMlAl3OWrhU8EPft5OJYsWceT9dZt34cU2mOmJn
 geHMXLWL2I6x7TPjHxF4lzDQC7PNexP8Iaam6CbZZELKsEwlyyot1B3qNCKBAfc9+mfW
 txdvblUmxuYrpftaKb3QyAZ5OhZlifN3GNL2ZpImsd0/VF1LZhGPgyKcRL7mMnau0Zok
 HTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QHKCluGePZIU+McyVTxFHH0xCNV+DoEpqMdH3e/keAo=;
 b=DcoWar/rluUC6sdgEi3/ZuCPjKj7EXlauCfpcmxw5Zt/W7dWAC5l2EPuYJ5hEVHpNr
 IJ6CNfIppnfXN7g6gY/xAqC3by5TRKN2sxBRP95ywZUVsytsk/K1/BKCpfHkEpd2deTg
 w4td7cnIYLnPue2r38jAffAYWsB5HxLNtt6wSYUhABOG9LVKXVQar05QVf9hi1kyMeyE
 1BIGDNVt7U+9lM0spbBye5gdTQWKqUxDKxjfRm+H0QessJeiskVUiFGci9AD61jAjspH
 Vd331i3S6LJ+CDa+xk23bk718T/uFM4/lPi1JOGW+fr76BFML6ycOcxvhTg1S9+PblAD
 DP7w==
X-Gm-Message-State: APjAAAU8lcRdRYgMyaMw5a83G5EA68EQQwXMVMe4i9/B6Dk7n3ZmoZ5e
 U3o4eVlKa3dw5Y8XTDQ6xcA=
X-Google-Smtp-Source: APXvYqxyEm9SR/EPSZsblA25pKl2hkO2WC3ZeY2itLqHYCR9v9/JId7GV3e1Iud+xb8wF1vB7D38aw==
X-Received: by 2002:a65:404a:: with SMTP id h10mr34263500pgp.262.1562113240917; 
 Tue, 02 Jul 2019 17:20:40 -0700 (PDT)
Received: from localhost ([123.213.206.190])
 by smtp.gmail.com with ESMTPSA id 12sm227706pfi.60.2019.07.02.17.20.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jul 2019 17:20:39 -0700 (PDT)
Date: Wed, 3 Jul 2019 09:20:37 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20190703002037.GC15705@minwoo-desktop>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
 <20190702174236.3332-3-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702174236.3332-3-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Wed, 03 Jul 2019 04:34:02 +0000
Subject: Re: [Xen-devel] [PATCH V3 2/9] blk-zoned: update blkdev_nr_zones()
 with helper
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
Cc: damien.lemoal@wdc.com, linux-btrace@vger.kernel.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, konrad.wilk@oracle.com, yuchao0@huawei.com,
 colyli@suse.de, linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Minwoo Im <minwoo.im.dev@gmail.com>, jaegeuk@kernel.org,
 xen-devel@lists.xenproject.org, kent.overstreet@gmail.com,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTktMDctMDIgMTA6NDI6MjgsIENoYWl0YW55YSBLdWxrYXJuaSB3cm90ZToKPiBUaGlzIHBh
dGNoIHVwZGF0ZXMgdGhlIGJsa2Rldl9ucl96b25lcygpIHdpdGggbmV3bHkgaW50cm9kdWNlZCBo
ZWxwZXIKPiBmdW5jdGlvbiB0byByZWFkIHRoZSBucl9zZWN0cyBmcm9tIGJsb2NrIGRldmljZSdz
IGhkX3BhcnRzIHdpdGggdGhlCj4gaGVscCBpZiBwYXJ0X25yX3NlY3RzX3JlYWQoKS4KCkl0IGxv
b2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogTWlud29vIEltIDxtaW53b28uaW0uZGV2QGdt
YWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
