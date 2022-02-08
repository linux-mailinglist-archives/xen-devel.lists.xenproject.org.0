Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408A04AD5C1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268084.461866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO2G-0001hu-1u; Tue, 08 Feb 2022 10:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268084.461866; Tue, 08 Feb 2022 10:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO2F-0001fu-V0; Tue, 08 Feb 2022 10:47:47 +0000
Received: by outflank-mailman (input) for mailman id 268084;
 Tue, 08 Feb 2022 10:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JWzo=SX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nHO2F-0001fm-3k
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:47:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bea8530-88cc-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 11:47:45 +0100 (CET)
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
X-Inumbo-ID: 8bea8530-88cc-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644317265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uo0NeC6HqA/AJX5NG+TPsnWTZGjHOn5Wquvom1FO+sw=;
  b=TTiIJ0AnTXMviNMLvYW4DCJN3hPh4UCXnh3pLro3MDiO+Lt52COZt3QN
   ifkhG6NqqN7UoJrz7rEFl5DAu4PhA9YLHu30gMjp7Orbj+iQa1qhItN+P
   l7+Fjq7Cyl9KVX9TvmlHMs1c1ZC38ME8p1dFAsLsJmKU1VZB8Fh3Ai5Q0
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: lxS3QB9k4kMpWTaWi0YxuntNWh1AE9WyAK2hScAE5U4aO2Qm75fxG4pINYs1vS1ZAQPs+McBlt
 KJ1t+HEiAdJw2zIpEpeZ1/JJRmuDoF8e7j3mpVPcvInM56VGUQ+T/52PCFABcXv+8CvuuP2qtW
 hAQsxZyXqjvMqiDcCkjEevUA9Xj74+tdZsIwVK3egsEF+sX5V7OKmhTHhTgU9uOGdm3CYn0TLx
 EAHPJVTjd4hRCcezOUqHNdBqnUHP+9qIxP+DoAy5VxnV7kJJ8ZGXQZcUkpyM9VgqkeKfN3hHEn
 +FwEKQ32/eyW2v+i0rd6GbwW
X-SBRS: 5.1
X-MesageID: 65932262
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:b3HeeK89Ep0r+v55HCyiDrUDe3mTJUtcMsCJ2f8bNWPcYEJGY0x3m
 2QZCD+ObqrcMDagLdoiboq39E9VvcOGyN9iHQU9pCs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhh5
 OVCtbyiUD4kAYPCgOAxfjhSCjFXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4TTK2EP
 ZRDAdZpRDfOTUJ0AHU0MpY73+HwqEbeaGR2kF3A8MLb5ECMlVcsgdABKuH9eMGORMhTtlaVo
 CTB5WuRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3uFuqE2ewCoUEhJ+fVm0u/6ikWalRslSb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqdQM0Qgsl8cDarb4dgArLYvtCGrelp4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNvBFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gNulmSx28za67onAMFh
 2eJ6GtsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeon0yPB/Jhj68yhF3+U3aB
 Xt8WZz9ZUv29Iw9lGbmLwvj+eNDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchihJ5oVD79q
 o4FX+PTkk03eLSnPkH/rN5CRXhXfCNTLc2n9KR/KLXZSiI4Qz5JNhMk6e54E2CTt/8OzbmgE
 7DUchIw9WcTclWdcVrTMS04OOq0NXu9xFpiVRER0Z+T8yBLSe6SAG03LvPbpJErq75uy+BaV
 f4Ad5nSC/hDUG2fqT8ccYP8vMppcxHy3VCCOC+sYT4eeZ98RlOWpo+4L1W3rCReXDCqscYeo
 qG70l+JS5Q0WAk/Xt3db+iizg3tsCFFyv5yRUbBPvJaZF7orNpxMyX0g/Jue5MMJBzPyyG0z
 QGTBRtE9+DBr5VsqIvChLyerpfvGOx7RxIIE27e5LewFC/b4mv8ntMQDLfWJWjQDTqm9r+ja
 ONZy+DHHMcGxFsa4ZBhF7tLzL4l44e9rbFt0Qk5Tm7AaE6mC+08LyDej9VPrKBE2pRQpRCyB
 hCU4tBfNLiEZJHlHVoWKFZ3Z+iPz6hJyDzb7PBzK0Tm/i5nurGAVBwKbRWLjSVcKppzMZ8kn
 rh96JJHtVTnh0p4KMuCgwBV63+Ify4JXKgQv50HBJPm11gwwVZYbJ2AUiL77fljsTmX3pXG9
 tNMuJf/ug==
IronPort-HdrOrdr: A9a23:ls0hua+0pkqdSIcBkyJuk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-IronPort-AV: E=Sophos;i="5.88,352,1635220800"; 
   d="scan'208";a="65932262"
Date: Tue, 8 Feb 2022 10:47:40 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/5] tools/libs/toolcore: replace _xentoolcore_list.h
 with _xen_list.h
Message-ID: <YgJKTHjEkBMYgQ31@perard.uk.xensource.com>
References: <20220208070638.5909-1-jgross@suse.com>
 <20220208070638.5909-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220208070638.5909-4-jgross@suse.com>

On Tue, Feb 08, 2022 at 08:06:36AM +0100, Juergen Gross wrote:
> Remove generating _xentoolcore_list.h and use the common _xen_list.h
> instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

