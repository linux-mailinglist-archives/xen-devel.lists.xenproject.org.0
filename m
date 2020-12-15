Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E0A2DAFB0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 16:06:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54319.94302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpBuE-0001VZ-Jm; Tue, 15 Dec 2020 15:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54319.94302; Tue, 15 Dec 2020 15:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpBuE-0001VA-Gf; Tue, 15 Dec 2020 15:06:26 +0000
Received: by outflank-mailman (input) for mailman id 54319;
 Tue, 15 Dec 2020 15:06:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ufw=FT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kpBuD-0001Up-AH
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 15:06:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fca7ef58-875b-49d9-8b50-fdf322f7fad6;
 Tue, 15 Dec 2020 15:06:24 +0000 (UTC)
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
X-Inumbo-ID: fca7ef58-875b-49d9-8b50-fdf322f7fad6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608044784;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=OTpugqn7zvt2lSUnB/CR9WtOPwPJgpWceKapczBjzPk=;
  b=LAZrZSK9k5bnVjS5KPy67xBR9xnIUwn8OkbxOmOMUGEute3Jx3wO8U5t
   0Tc3ybKCrt9AXLmbZGV7tx5V2aI9uOXrZqIYy6RVoa9MG5N+AGjswzQPb
   NHnEFB8e+cLU+dMc+ASb6Akv/XMIxT1zhJa+iV1lSy65V6COG5ax1t3kq
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: I3NndTN5xR6bVHc9LXuP0BUuJmsuQnM8W8oK1XFhj8+YlyyzkFFKuoBocVuePlx7vGWzpHdye2
 HIUTLi6k7Z/K66SFxMToP4+GgGapNxmMACLjubUt0rD3KGqWPgW16v0vG7iRB461qfM7AZW8yc
 vhs/Q+tCda809FBenIdk1s5qwZRCwOyMPhihkWiDNiCg4EGSFMh4BFpifSKVszb5xe3TmpC42E
 sd8Um7b1XXJV/Dw8qQHWcSY/3cdFY99ugnCzb/tpB/rQdaYjq7MSOK8hAQIIf84ZVOrDO8q4Zq
 MSs=
X-SBRS: 5.2
X-MesageID: 33240661
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,421,1599537600"; 
   d="scan'208";a="33240661"
Subject: Re: [PATCH] tools/xenstore: rework path length check
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Julien Grall <jgrall@amazon.com>
References: <20201215150411.9987-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f37930e2-10e8-69c4-5e36-4cf563b2f38e@citrix.com>
Date: Tue, 15 Dec 2020 15:06:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215150411.9987-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 15/12/2020 15:04, Juergen Gross wrote:
> The different fixed limits for absolute and relative path lengths of
> Xenstore nodes make it possible to create per-domain nodes via
> absolute paths which are not accessible using relative paths, as the
> two limits differ by 1024 characters.
>
> Instead of this weird limits use only one limit, which applies to the
> relative path length of per-domain nodes and to the absolute path
> length of all other nodes. This means, the path length check is
> applied to the path after removing a possible start of
> "/local/domain/<n>/" with <n> being a domain id.
>
> There has been the request to be able to limit the path lengths even
> more, so an additional quota is added which can be applied to path
> lengths. It is XENSTORE_REL_PATH_MAX (2048) per default, but can be
> set to lower values. This is done via the new "-M" or "--path-max"
> option when invoking xenstored.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> Acked-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

