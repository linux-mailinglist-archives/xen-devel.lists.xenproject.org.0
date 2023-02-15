Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA96980D7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 17:29:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496120.766691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSKeN-0003ZU-Be; Wed, 15 Feb 2023 16:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496120.766691; Wed, 15 Feb 2023 16:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSKeN-0003X6-8Z; Wed, 15 Feb 2023 16:28:55 +0000
Received: by outflank-mailman (input) for mailman id 496120;
 Wed, 15 Feb 2023 16:28:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LhbV=6L=citrix.com=prvs=4037f5ffb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSKeL-0003SQ-6y
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 16:28:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d43bbac3-ad4d-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 17:28:51 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d43bbac3-ad4d-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676478531;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   mime-version:in-reply-to;
  bh=ueYuF6PuNsKhD9Fqrikn9VQj9pIuX1bNFBJHa7aHTCo=;
  b=XgetsisCbWRbjSKwkzYBKsLg6PBogoFhwI2tO4gOP9toV10qCFMONVQf
   HiPBeI9oWkfI/MO2g9hD2JFrHxszy1yACQP3PLgjsDP5oVD809ZlG0FBK
   dTJscrkiXl8xpNruxPcGovmtuEl91jrQIawrcuF4y+I+nqloY13n+VI9S
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96557526
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:qX82Da4Eajx7lvVOUKAPywxRtAHHchMFZxGqfqrLsTDasY5as4F+v
 jQfUWyPPfeKa2GgfNx/bd/l90sHuZaGyN82GQo4+S1mHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoS4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 uRBLQgnNhu5xPuI6p3lYdAv2M4hBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zxjF+
 z2bpTqR7hcyBOGa92GvrVSWnOr0gBj0W7kzGP6K+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9FZCeE95SmGw7DY5AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqU7rqOpCm+ETQUJ2QFIyQDSGM4D8LL+d9pyEiVF5A6TfDz14eucd3t/
 9yUhA8m3rArp5YA7eaiw3ro3RmV5cbDTCdgs207QVmZxg9+YYekYamh5l7a8etMIe6lc7WRg
 JQXs5PAtb5TVPlhgATIGbxQR+/xu55pJRWG2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgarrUKzGLoC6T7wJs8w4iPIUOvCdkyfZlByCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1mX5llDKNH8Ghn07PPV+iiJi9E+9t3LymNL1R0U95iF+Nr
 4Y32zWilX2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/SwJwClMOJY3VMNeImelJU9U8z8xoehLgo
 inVtrlwlACu2hUq6GyiNhheVV8Ydccv8SNqYXV8ZT5FGRELOO6S0UvWTLNvFZFPyQCp5acco
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:KbfuzKp9VhDdgPNo6KNA9kcaV5rdeYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VAssRQb8+xoV5PufZqxz/BICMwqTNWftWrdyQyVxeNZnOjfKlTbckWTygce79
 YET0EXMrbN5DNB/KLHCWeDcurJwLO8gd+VbeW19QYScem9AZsQnjuQCWygYz1LrBEtP+tBKH
 IFjPA32gZJfx4sH7yGL0hAZcfvjfvRmqnrZBYXbiRXlDVn3VuTmcXH+wHz5GZlbw9y
X-IronPort-AV: E=Sophos;i="5.97,300,1669093200"; 
   d="scan'208";a="96557526"
Date: Wed, 15 Feb 2023 16:28:30 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/4] automation: Remove clang-8 from Debian unstable
 container
Message-ID: <Y+0ILtUb+yrVWKxf@l14>
Reply-To: <anthony.perard@gmail.com>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
 <20230215120208.35807-2-anthony.perard@citrix.com>
 <6fa7fa56-d30a-e66e-b46f-5e7daffeb487@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6fa7fa56-d30a-e66e-b46f-5e7daffeb487@citrix.com>

On Wed, Feb 15, 2023 at 12:26:40PM +0000, Andrew Cooper wrote:
> On 15/02/2023 12:02 pm, Anthony PERARD wrote:
> > First, apt complain that it isn't the right way to add keys anymore,
> > but hopefully that's just a warning.
> >
> > Second, we can't install clang-8:
> > The following packages have unmet dependencies:
> >  clang-8 : Depends: libstdc++-8-dev but it is not installable
> >            Depends: libgcc-8-dev but it is not installable
> >            Depends: libobjc-8-dev but it is not installable
> >            Recommends: llvm-8-dev but it is not going to be installed
> >            Recommends: libomp-8-dev but it is not going to be installed
> >  libllvm8 : Depends: libffi7 (>= 3.3~20180313) but it is not installable
> > E: Unable to correct problems, you have held broken packages.
> >
> > clang on Debian unstable is now version 14.0.6.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Yeah that's because clang 8 is way obsolete, and http://apt.llvm.org
> only supports Clang 15 and later now.
> 
> In hindsight, it was a mistake to take unstable-llvm-8.list in the first
> place.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I just realize that this change is going to break gitlab testing in the
staging-4* branches. So I guess this mean that we will have to backport
this patch, or at least the gitlab-ci part.

-- 
Anthony PERARD

