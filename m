Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C7A17E320
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 16:09:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBJzg-0003Sg-Kk; Mon, 09 Mar 2020 15:07:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1ca=42=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jBJzf-0003SY-0t
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 15:06:59 +0000
X-Inumbo-ID: 9ee10650-6217-11ea-8924-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ee10650-6217-11ea-8924-bc764e2007e4;
 Mon, 09 Mar 2020 15:06:58 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h5so2054470edn.5
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 08:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/6bCODredj4ofYZ4CTL154TNXWmlyYuTbETvU9Hn1Pc=;
 b=qFYVlmgOA9LfrDDE4GAoexsGU4OLPg9SNPjSxuG9eRm9m23CEuGqXXiiKOVNVFQjcn
 FVwDEs+puQR1Ya6dSBNuekRmvSpTODdPyyFM2z8D/N+LBqQGMxdRiEL+5xbauQJPUgYd
 t+gpAhGu49Dz8gJVSUNgeHXC5lExjR36GrfRZaUyV7rn4/HVWx7k+byhn56F0oOgc6FJ
 czP4c9VTzmODoPOuIuc0D5Y1QlkIi4uyAwi9frWSSWyMEw+1AjgmowMpmZp7vCITTMao
 hoYgDe1vfcZqjP0EZx54XoBHyVGVRFigdxQJtyICclv8pDKcMY0hFQYIS9fEEl6mvTzT
 9UGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/6bCODredj4ofYZ4CTL154TNXWmlyYuTbETvU9Hn1Pc=;
 b=cLM0O76bPwyHTTqnrjZ9xaRLimyiQsaU7tvGUwUp32V1R4c4YAjPkq8Aw91i1lskTP
 INfjEgdrcKiBI9sZOdCQPlIZiAzA7/xCmsyAgdrH/wnG9ZyuDFrTC+bPW+UeEU1kMZEa
 AgsvBBoocMqxIxfY+xIuIhlTXkoJrp5uHGfPWYAevaHG7EqL14yXhDdY6C59As6/mlPs
 rNq1IQhirQUqIEZ768MQjQDUwF2wnL76FqmDH5zsFKW/MVsfMizsPc93rX6J2rKyUAm0
 ClTrMuLRk5mFcLOPaNSZJ67Qxm3Gjj5KKGDmuCD743dRMg6+SSxM7OOO3rYbyxjs2uGW
 hV4Q==
X-Gm-Message-State: ANhLgQ1Alonssvspk+uebV7YK1TNuk8Lr5jDdgVZTNuSXB+5rFTkqCff
 WmYVfjx1EkSo7BqwK9AiXHQUQYFlIQU=
X-Google-Smtp-Source: ADFU+vvZ4+NW/o2aCOnwfBsS3FmBxFbv9wdT4Ln5OvzT7yaH1xetdAqLLbxOjTKOFgbNAtVNVU+ikQ==
X-Received: by 2002:a50:d712:: with SMTP id t18mr9927678edi.151.1583766417079; 
 Mon, 09 Mar 2020 08:06:57 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48])
 by smtp.gmail.com with ESMTPSA id aq2sm751081ejc.9.2020.03.09.08.06.56
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 08:06:56 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id 6so11640873wre.4
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 08:06:56 -0700 (PDT)
X-Received: by 2002:a5d:6891:: with SMTP id h17mr21103762wru.259.1583766415712; 
 Mon, 09 Mar 2020 08:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <dbf7d4d5-8df7-b391-30a8-b98bb53bbcb4@suse.com>
In-Reply-To: <dbf7d4d5-8df7-b391-30a8-b98bb53bbcb4@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 9 Mar 2020 09:06:19 -0600
X-Gmail-Original-Message-ID: <CABfawhmyzHBPFQFL7vDa9NWkSh2ZT8AxbSHWqrr-f3wt7ZwZrw@mail.gmail.com>
Message-ID: <CABfawhmyzHBPFQFL7vDa9NWkSh2ZT8AxbSHWqrr-f3wt7ZwZrw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] vmevent: reduce include dependencies
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgOSwgMjAyMCBhdCA1OjUxIEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBUaGVyZSdzIG5vIG5lZWQgZm9yIHZpcnR1YWxseSBldmVyeXRoaW5n
IHRvIGluY2x1ZGUgcHVibGljL3ZtX2V2ZW50LmguCj4gTW92ZSBpdHMgaW5jbHVzaW9uIG91dCBv
ZiBzY2hlZC5oLiBUaGlzIHJlcXVpcmVzIHVzaW5nIHRoZSBub24tdHlwZWRlZgo+IG5hbWUgaW4g
cDJtX21lbV9wYWdpbmdfcmVzdW1lKCkncyBwcm90b3R5cGU7IGJ5IG5vdCBjaGFuZ2luZyB0aGUK
PiBmdW5jdGlvbiBkZWZpbml0aW9uIGF0IHRoZSBzYW1lIHRpbWUgaXQnbGwgcmVtYWluIGNlcnRh
aW4gdGhhdCB0aGUgYnVpbGQKPiB3b3VsZCBmYWlsIGlmIHRoZSB0eXBlZGVmIGl0c2VsZiB3YXMg
Y2hhbmdlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCkFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
