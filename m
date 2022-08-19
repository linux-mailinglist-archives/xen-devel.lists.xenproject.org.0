Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E3599D06
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 15:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390340.627712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP2FK-0006Cp-RO; Fri, 19 Aug 2022 13:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390340.627712; Fri, 19 Aug 2022 13:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP2FK-0006AI-OM; Fri, 19 Aug 2022 13:41:10 +0000
Received: by outflank-mailman (input) for mailman id 390340;
 Fri, 19 Aug 2022 13:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wa9Z=YX=citrix.com=prvs=223f339b3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oP2FJ-0006AC-0L
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 13:41:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 921e6346-1fc4-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 15:41:06 +0200 (CEST)
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
X-Inumbo-ID: 921e6346-1fc4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660916466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+sYqpKNHGIpfgjyLA68iMEwoPpTIFkQ+UhNZZHS/Uzs=;
  b=XHW/YqVvMUM3Rb+acqaPU0WrmYe1abLJ1Xm0OrMMpNN7JTgc9WONCEM1
   fKNZB1KVvdKXm+lQBXYu27FKfcXlWpX4H92Y7Vdn9tGqwaEuirrrnIkRR
   x/tRsf4f5U6ooYI/58Q4cd6yHORvwRaZf3Gbv9KqqNQOMwFcGxdJBvEVF
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78477499
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OUL8L6oP+Ru4RFwyKXiVNQwtvCZeBmKMZRIvgKrLsJaIsI4StFCzt
 garIBmDa/2JazbzLdFwYIq08B5S78fUxoIxTwVt+Ss0QykU9ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GpJ5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqU+4sB6LkVR0
 cc1DwpdSDmFhd7nxai0H7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIWFJoPVGZQE9qqej
 mif7U7YXTM1CPKw5xi7z1+wv7TRxSyuDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWQMlDI
 kYZ/i4vq6ka90GxSNT5GRqirxasoh8Zc8pdFas98g7l4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9RWqG87aIrRu7ISUPMXIZfigAUBcE5N/45oo0i3rnTMtnEaOzps34H3f32
 T/ihDI5nL8JiskI0Y20+FnGh3SnoZ2hZgw/6xjTX2mlxhhkf4PjbIutgXDW6ftGJcCEQFiEo
 GMJhcG26/oHBpWA0ieKRY0lHr6z4O2eGCbBmlMpFJ4knxyh8mCuVZpd6zZ/IAFuKMlsRNPyS
 BaN40ULvsYVZSb0K/8sC26sNyg05Y74M9nKcu/wVfdpWMhXXQmFwHBrf0HFiggBj3MQfbED1
 YazKJjyVSZFVf03klJaVM9Gj+Z1m3lWKXf7AMmikk/5ief2iGu9E+9tDbeYUgwuAEpoSi3x+
 s0XCcaFwg43vAbWMniOqt57wbznwBEG6XHKRy9/LLfrzvJOQj1JNhMo6epJl3ZZt6pUjPzU2
 Xq2R1VVzlHy7VWed1vSOiw8N+KzA8YkxZ7eAcDLFQfA5pTeSdz3sPd3m2UfJtHLC9CPPdYrF
 qJYKq1s89xESyjd+iR1UKQRWLdKLU3z7SrTbnXNXdTKV8Q/L+A/0oO7I1CHGehnJnbfiPbSV
 JX7iluLGcNdG18+ZCsUAdr2p26MUbEmsLoadyP1zhN7Ii0ALKACx/TNs8IK
IronPort-HdrOrdr: A9a23:SADLIKM57in87MBcTsOjsMiBIKoaSvp037Eqv3oRdfVwSL3+qy
 nOpoV+6faaslossR0b9uxofZPwJ080lqQFhLX5X43SPzUO0VHAROoJgLcKgQeQeREWntQtrJ
 uIGJIfNDSfNzZHsfo=
X-IronPort-AV: E=Sophos;i="5.93,248,1654574400"; 
   d="scan'208";a="78477499"
Date: Fri, 19 Aug 2022 14:40:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nick Rosbrook <rosbrookn@gmail.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, David Scott
	<dave@recoil.org>, George Dunlap <george.dunlap@citrix.com>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Christian Lindig <christian.lindig@citrix.com>,
	"Wei Liu" <wl@xen.org>, Tim Deegan <tim@xen.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v4 00/32] Toolstack build system improvement, toward
 non-recursive makefiles
Message-ID: <Yv+S6TxJnIdNxC9W@perard.uk.xensource.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <d7b84136-d9f7-0bfb-f998-5aebece60b5b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d7b84136-d9f7-0bfb-f998-5aebece60b5b@suse.com>

On Mon, Aug 15, 2022 at 09:01:12AM +0200, Jan Beulich wrote:
> I've committed a non-contiguous initial part of this series, omitting
> patches where acks still look to be missing, and hence only up to a
> point where I could be reasonably certain that the skipped patches
> won't interact with later ones. If you can indicate which further
> sufficiently reviewed/acked parts of the series are independent of
> earlier parts which aren't fully ready yet, I'd be happy to throw in
> more.

Hi Jan,

Thanks. I think the following are ready, they don't depend on
uncommitted patches:

15: tools: Introduce $(xenlibs-rpath,..) to replace $(SHDEPS_lib*)
16: tools: Introduce $(xenlibs-ldlibs, ) macro
18: tools/helper: Cleanup Makefile
19: tools/console: Use $(xenlibs-ldlibs,)


Also, while "tools: Add -Werror by default to all tools/" seems ready,
it's probably better to have committed at the same time as the follow-up
"tools: Remove -Werror everywhere else".

Cheers,

-- 
Anthony PERARD

