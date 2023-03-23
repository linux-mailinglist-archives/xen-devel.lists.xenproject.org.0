Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FE76C66AD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 12:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513796.795348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJCS-0003Yz-SU; Thu, 23 Mar 2023 11:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513796.795348; Thu, 23 Mar 2023 11:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJCS-0003WL-PG; Thu, 23 Mar 2023 11:33:44 +0000
Received: by outflank-mailman (input) for mailman id 513796;
 Thu, 23 Mar 2023 11:33:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8edK=7P=citrix.com=prvs=439de8c1e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pfJCQ-0003Vm-W3
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 11:33:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e82ed95-c96e-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 12:33:41 +0100 (CET)
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
X-Inumbo-ID: 8e82ed95-c96e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679571221;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wosF59sWgbr7Az6Tjk6DOG3Oo4zlUoRO77KELuqmX/U=;
  b=gysrU+Q7R+e4pu56eMx/YH3zsVrxGxemxD1cOZlxDEkZLGEHdvbfiDFg
   RCujuzpz1hg4jjUF9qye0p22h8oK6HAwKxoLLcKLeQrLeCHBedU42E9ir
   F5QekGlsEGUjeBanoK3iKOO9qBEMfAgfaeN9kADpwT+2Ey8MHdQL1vW9B
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 102421513
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:m/8/1qJJThTfzfWLFE+RxJUlxSXFcZb7ZxGr2PjKsXjdYENS0GZTm
 2IeUWnXP62IZmqkKo0naNvk9xkHvMLUzNNgSQZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4pKksX+
 vEjOAoMbyKZisSs0oOia7lj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHZ8JxB/F/
 zmuE2LRLSFCatuc8Qi5q02o2f/xxj3KXIIOC+jtnhJtqALKnTFCYPEMbnOkpdGph0j4XMhQQ
 2Qd4ic0pLI+3FCqRNL6GRa/pRasvBEGXMFLO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU331y1uPhWrsY25PdzZEPHJaC1JfuLEPvb3fkDqRZfw6H6OOnuf0GAPqz
 haQvhknpuUc2JtjO7qAwbzXv969jsGXEV9uuFiHBznNAhBRP9D8OdHxgbTPxbMZddvCEAHc1
 JQRs5LGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuKGpxeEdMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QRM8UoLFbdpnExPiZ8OlwBd2By+ZzTx
 L/BKZr8ZZrkIf0PIMWKqxc1juZwm3FWKZL7TpHn1RW3uYejiIquYe5dajOmN7lhhIvd+VW9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8rit9pEKJr/TeVE5cIzjYteIqY4cl0Vet/w9vo/1E
 ruVCxYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:AG6JpapOqdBnBNYZAMwIScUaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="102421513"
Date: Thu, 23 Mar 2023 11:33:05 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 5/5] tools/libs/vchan: remove private offsetof()
 definition
Message-ID: <be0bd264-d563-470e-b3c3-2f648b20f0a8@perard>
References: <20230323090859.25240-1-jgross@suse.com>
 <20230323090859.25240-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230323090859.25240-6-jgross@suse.com>

On Thu, Mar 23, 2023 at 10:08:59AM +0100, Juergen Gross wrote:
> vchan/init.c is defining offsetof privately. Remove that definition
> and just use stddef.h instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

