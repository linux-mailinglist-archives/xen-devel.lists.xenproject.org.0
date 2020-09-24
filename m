Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EAD2779FC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 22:13:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLXbU-0004Gl-RL; Thu, 24 Sep 2020 20:12:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oT5B=DB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kLXbT-0004Gg-1A
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 20:12:31 +0000
X-Inumbo-ID: d81b798d-beb0-42b2-8b87-43d82b6bf2d5
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d81b798d-beb0-42b2-8b87-43d82b6bf2d5;
 Thu, 24 Sep 2020 20:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600978349;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=WoQZrQ2l6TjS9Bk8ZH97gqP5o7DPCZrwWTSxTVMUM4E=;
 b=HuZJzrpyWOiIW3L6x+aKh0K8DJqZ89qDOCGHeslJ6YdpLAS6MbiA5a3w
 UHFUJUThqPMq6EclE8tEqIbWrdKrmSV0vkAhwaTW/FWTL2KjyiTxpUrsU
 DToCvrT/wD+bNBG/+n/UDB/YmC03o0PuZU8g8D4SuCBtJUqMc+lwuISKz U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CnwPBH9+dIagOHXb2aNwUQ9NoiZs/eKTX6arEa7aGXWpqHnrN3UGW1mfklaS1sFnvQgrKwbfcw
 43qoQauELsz25DR8JqXbSUvXf9hEEj8MC7zk4rCXNVwRwkIKGiqcJSxwSJ5EpvtpkaxHQy+jJM
 mbg3bSRgNizWdDYX7zFisGYy1zEGMPjNouenwOOQ0NjCGft+VzqKrb/5xqpjFHEpm0B33bnkgF
 s5nwpBhYKDyuiuwBZTqoel+vaK1022eC1BCmym/dd+pu4CDTZHG/1AyLJSBnefU5l1kcUIFGfa
 pwM=
X-SBRS: None
X-MesageID: 28524920
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,299,1596513600"; d="scan'208";a="28524920"
Subject: Re: [PATCH v1] libxc/bitops: increase potential size of bitmaps
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200924180843.30452-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bcece876-948a-fb1d-e0ed-acf55a6e3c04@citrix.com>
Date: Thu, 24 Sep 2020 21:12:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924180843.30452-1-olaf@aepfle.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/09/2020 19:08, Olaf Hering wrote:
> If the bitmap is used to represent domU pages, the amount of memory is
> limited to 8TB due to the 32bit value. Adjust the code to use 64bit
> values as input. All callers already use some form of 64bit as input,
> so no further adjustment is required.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I definitely should have pushed harder to do this the first time around...

