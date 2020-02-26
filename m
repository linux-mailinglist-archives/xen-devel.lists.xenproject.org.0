Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA2017027D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:31:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ycZ-0001uK-Ah; Wed, 26 Feb 2020 15:29:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5J6w=4O=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6ycX-0001uF-SC
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:29:09 +0000
X-Inumbo-ID: bb6579ec-58ac-11ea-aba8-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb6579ec-58ac-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 15:29:09 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r21so4283807edq.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 07:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J+sgPEGf19agSnporagNfbz/l1UM3jaRxSn/vXS8ygM=;
 b=vWE3NthJQnErtm5exW7UqqfYnthr+n/+uG1tKl3uzlW2WTptoCDdPEz7+Ih6C/N6dR
 J9yYe3wB8WSp6MhM9soR6Y1z51Xi7v9R2egWk3wem3czZTScic5wZBOWMpkwdE0CNEo1
 vCgioenu9Uthr/n2Badbt6qhVN9pa8NW1zDNHys/StYEP0sAoC0mTih2paI8eT11monJ
 +psjO54C00idypTYQZBhtDYPcDK6WNe+9Qc4iN1pezXQbhxKXwG8iVN02+0xOPvGOds0
 mnEPqxxSrTs3ma550aXfqK2wRNyvwT/0wiKAVHAHWk6oXwVnol2zdNnE+dbwcUTevRB3
 XKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J+sgPEGf19agSnporagNfbz/l1UM3jaRxSn/vXS8ygM=;
 b=kRyRr8lrZAPVLt9HEVYf77DZNw6VyvOJPBRJV5MuN9KaY0/C/gkCP5km2IQjS3TTc3
 KYdk4DTzGN9DbX1YpMDAUliKmEsnxYBeUJovugWpNYOzABcraDrYY8/kDRkVi2v7K2t/
 7BfPjIkZPts8AlqpAnMJ6GTwdKh8R++Z5M4PPLWzgDGbdCxlFET5H9G6u5MX+B0bLRMI
 Tf0L9odH8k2rvsj63a8cne8tM9bDrZBK962idAjGlyHZZIy3D/NH/i//V5Gvh5fY0Z6r
 7ocjUtxxhjeI913PqOx6V6mVQuRYAvDeecy8qRuIz4DGAbvN6IYWGnU1i+UacH3wYXPV
 WWGw==
X-Gm-Message-State: APjAAAVPyl30DxyVJlB4yiR8OsBMdghdPpAYjLW8eG3QJ3T+ChNlJik5
 OnhnsmYZ+DfCXpwHqTW3frWNy43Rrdo=
X-Google-Smtp-Source: APXvYqyP0D+rRBISiVvW6EPAVG0IlsJ4AkPDoPxkWY955NzH+/V4GfGNc5TKgkFdf3809ebxcawPAA==
X-Received: by 2002:a17:906:f28a:: with SMTP id
 gu10mr4985327ejb.169.1582730948249; 
 Wed, 26 Feb 2020 07:29:08 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49])
 by smtp.gmail.com with ESMTPSA id ch8sm107895ejb.9.2020.02.26.07.29.07
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 07:29:07 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id q9so3530549wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 07:29:07 -0800 (PST)
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr6021529wma.84.1582730947038; 
 Wed, 26 Feb 2020 07:29:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582658216.git.tamas.lengyel@intel.com>
 <628c5cdc73c589e45a19cc0ddb5cf972b00eb3dd.1582658216.git.tamas.lengyel@intel.com>
 <20200226152556.GG24458@Air-de-Roger.citrite.net>
In-Reply-To: <20200226152556.GG24458@Air-de-Roger.citrite.net>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 26 Feb 2020 08:28:31 -0700
X-Gmail-Original-Message-ID: <CABfawh=PtWhB_GsjAj1aT0uJ6ayEE1Z9T3MbEa7Ur9vq1yZ2kQ@mail.gmail.com>
Message-ID: <CABfawh=PtWhB_GsjAj1aT0uJ6ayEE1Z9T3MbEa7Ur9vq1yZ2kQ@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v10 2/3] x86/mem_sharing: reset a fork
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBZb3UgYWxzbyBuZWVkIHRvIHJlc2V0IHRoZSBjb250ZW50cyBvZiB0aGUgc3BlY2lhbCBwYWdl
cywgdGhlCj4gdmNwdV9pbmZvIHBhZ2VzIGFuZCB0aGUgc2hhcmVkX2luZm8gcGFnZSBpbiBvcmRl
ciB0byBtYXRjaCB0aGUgc3RhdGUKPiB0aGUgVk0gd2FzIGluIHdoZW4gZm9ya2luZy4KCkFjay4K
Cj4KPiBQViB0aW1lcnMgc2hvdWxkIGFsc28gYmUgcmVzZXQgdG8gcGFyZW50J3Mgc3RhdGUgQUZB
SUNULCBvciBlbHNlIHlvdQo+IHdpbGwgZ2V0IHNwdXJpb3VzIHRpbWVyIGludGVycnVwdHMuCgpD
b3VsZCB5b3UgcG9pbnQgbWUgdG8gdGhlIHJpZ2h0IGRpcmVjdGlvbiBoZXJlIGZvciB3aGVyZSB0
aGUgdGltZXJzCmFyZSBsb2NhdGVkIGluIHRoZSBjb2RlYmFzZT8KCj4gSW4gZmFjdCB5b3Ugc2hv
dWxkIGNoZWNrIGFnYWluc3QgdGhlIHN0YXRlIG9mIHRoZSBwYXJlbnQsIGJlY2F1c2UgdGhlCj4g
Zm9yayBtaWdodCBoYXZlIGNoYW5nZWQgdGhlIHBvc2l0aW9uIG9mIHRoZSBzaGFyZWQgaW5mbyBv
ciBhbnkgb3RoZXIKPiBvZiB0aG9zZSBtYWdpYyBhcmVhcywgYW5kIHRoYXQgc2hvdWxkIGJlIHJl
dmVydGVkIHRvIHRoZSBzdGF0ZSB0aGV5Cj4gYXJlIGluIHRoZSBwYXJlbnQuCgpNYWtlcyBzZW5z
ZS4KClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
