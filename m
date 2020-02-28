Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB49174058
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 20:36:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7lNe-0007rS-M9; Fri, 28 Feb 2020 19:33:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XnOO=4Q=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j7lNd-0007rN-IM
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 19:33:01 +0000
X-Inumbo-ID: 20fc94ec-5a61-11ea-ad76-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20fc94ec-5a61-11ea-ad76-bc764e2007e4;
 Fri, 28 Feb 2020 19:33:00 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id j17so4694521edp.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2020 11:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cqietMsilGerxgVhBzf5OKRIImxU8l3leZ4zULnE79I=;
 b=w8E6xvq3V12jbOSUeC01bZ/MczRGFFfO1uMb27h/KeorJimg2g8UgamXhn2IBPjZyD
 FYaWu65nW+zhyMMxTIj5Y4YbygfEILAt9M5hMZboaFPZe/G2wDdhHWDa+KMpi+hvW7oP
 4iyudAcqXLNaH1xAjnuBHbgF8WQqap5Hg48D4Wyn+DkbCQTUVwYeVa9R11AZ1IjuF/wc
 DnTc28qsfPB1KmJmFhQHDprrAt6+8t7EWlY2yQ9l+jSluY+/0w43E7bm+xOr3vIdtqIm
 NaJGxuyoIwgnOgLBJA6VpiWg2gQwpVYzkc6QXoaqbUQDDO1HGtStZ+U7yI+djd91fi7P
 ElAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cqietMsilGerxgVhBzf5OKRIImxU8l3leZ4zULnE79I=;
 b=Y+DXZWSmhaO3SnXTD0eapTYMg573Va6QQYf7yrg/Z2EG2SszX8rg66c7vcPXWuIGbs
 QtJ9qOMVhfef8DEfri3/rh0hUrUAD0J/UGidFbPxUbbF4e59CLt+4+B3TbRBCR89lqSW
 ujiraY+qAm5K7weg/oAgBiZP19x+kyk8v3TiehXcSpMO1cpp5mt14oYGQGwicI6mG05Z
 Of14ffis6YJvgJ1aGk72GX93Zi/5zuyQ2t3PdXG0PVbwGjj804pN4RKsDGGOZEciB085
 rVihMaxED5XaikhBBx/1/62Q+Me6mjFWr3VzsZ0nuecUxOh4qF9T8P62uWC8jyFzHMcF
 eRVw==
X-Gm-Message-State: APjAAAVA9vB3al+4X2s9laSkVTq4St648rX+EKVrun2yclYZ0anJO/Ym
 473VUuhXHUZSuprgbjiRrJBFRem8ucs=
X-Google-Smtp-Source: APXvYqzdBbMeM75W7u1SHwvQBaDBLsJGcNDVmzS7SrNWcEXZQtP9A5OWajYW5+vnDxztEU55gRKJ4g==
X-Received: by 2002:a50:d703:: with SMTP id t3mr5630780edi.250.1582918379036; 
 Fri, 28 Feb 2020 11:32:59 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id m5sm595006ede.10.2020.02.28.11.32.56
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 11:32:56 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id z15so4369234wrl.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2020 11:32:56 -0800 (PST)
X-Received: by 2002:a5d:4902:: with SMTP id x2mr6534451wrq.301.1582918375842; 
 Fri, 28 Feb 2020 11:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20200228132749.2929-1-pdurrant@amazon.com>
 <20200228132749.2929-6-pdurrant@amazon.com>
In-Reply-To: <20200228132749.2929-6-pdurrant@amazon.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 28 Feb 2020 12:32:19 -0700
X-Gmail-Original-Message-ID: <CABfawhkYHX3Z_x8yhbchnOX=s3bBwjNWoBFTQW1R2sEZLJk=4g@mail.gmail.com>
Message-ID: <CABfawhkYHX3Z_x8yhbchnOX=s3bBwjNWoBFTQW1R2sEZLJk=4g@mail.gmail.com>
To: Paul Durrant <pdurrant@amazon.com>
Subject: Re: [Xen-devel] [PATCH 5/6] mm: add 'is_special_page' macro...
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYwo+IGluZGV4IDM4MzViYzkyOGYuLmMxNGE3MjRjNmQgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYwo+IEBAIC04NDIsNyArODQyLDcgQEAgc3RhdGljIGludCBub21p
bmF0ZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwKPgo+ICAgICAgLyogU2tpcCB4
ZW4gaGVhcCBwYWdlcyAqLwoKUGVyaGFwcyBhZGp1c3QgKG9yIHJlbW92ZSkgdGhlIGNvbW1lbnQ/
Cgo+ICAgICAgcGFnZSA9IG1mbl90b19wYWdlKG1mbik7Cj4gLSAgICBpZiAoICFwYWdlIHx8IGlz
X3hlbl9oZWFwX3BhZ2UocGFnZSkgKQo+ICsgICAgaWYgKCAhcGFnZSB8fCBpc19zcGVjaWFsX3Bh
Z2UocGFnZSkgKQo+ICAgICAgICAgIGdvdG8gb3V0OwoKVGhhbmtzLApUYW1hcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
