Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1220F599C8F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 14:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390311.627668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP1ZX-0007jS-Q7; Fri, 19 Aug 2022 12:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390311.627668; Fri, 19 Aug 2022 12:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP1ZX-0007gv-NI; Fri, 19 Aug 2022 12:57:59 +0000
Received: by outflank-mailman (input) for mailman id 390311;
 Fri, 19 Aug 2022 12:57:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wa9Z=YX=citrix.com=prvs=223f339b3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oP1ZW-0007gp-97
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 12:57:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a687b23-1fbe-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 14:57:56 +0200 (CEST)
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
X-Inumbo-ID: 8a687b23-1fbe-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660913876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eFhTDmPa6SZiewhDtEkEkA/0/e8V+tjJjyF0ztUNWBA=;
  b=Bi5LBlwxwAB1Ks9j+0OYo6mVeUReLjiqJysA9VlCTd73gHV3ZDVgS7s8
   YfjszkrfAS5dnVKCw317RkORZIEoX+PUuytvgIXkWr/jZ9PX9daNrx8gz
   gPQsew8hKoVJN2sow/SAgHV5yQuO3MUzNUT9yJu5SglPS9sY8+ik2iHwh
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81019905
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Bk/iVqoJGt7RyiHMEMb283lT1hReBmJpZRIvgKrLsJaIsI4StFCzt
 garIBmEaPeIYDOjL9knPNu+8h4GucTQn9NrTQI4/yhhFXgXopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GpI5gdWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUV+uxbDnFnx
 MAHMQ0QcDqxhfCT8I6kH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIqMIoXbFJ0I9qqej
 kXD+yfbMBUUDsKk2CPery2xxbbQujyuDer+E5Xnr6U30TV/3Fc7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzWnpFaUsxhaXMBfe8U37AyLw+zJ7QecGnMJUDdpb8Yvv8s7Azct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqaC8OYQQVyujfv5gOkwzlfNRxNZ6JkYigcd3v+
 AxmvBTSlp1K05BTh/rnpACZ696/jsOXF1Bov207Skrgt1okP9D9OuRE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFBz3ohZPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvVZx6kfe/RIi7Bqu8gj9yjn9ZJWe6ENxGPxbMjwgBbmB3+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcW+8zK/kuKHMiT50n2jtKjiIu9E+ht3K2mMr9kt8tpYWz9r
 75iCid9404DCL2mO3eLqtJ7wJJjBSFTOK0aYvd/LoarSjeK0kl4YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:5JHkxK0RG+N0YP9sEzWACAqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.93,247,1654574400"; 
   d="scan'208";a="81019905"
Date: Fri, 19 Aug 2022 13:57:41 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
CC: Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Ping: [XEN PATCH v4 01/32] tools/debugger/gdbsx: Fix and cleanup
 makefiles
Message-ID: <Yv+IxeVyOji3/pZY@perard.uk.xensource.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-2-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220811164845.38083-2-anthony.perard@citrix.com>

Hi Elena,

Could you give a ack or review this patch?

Thanks,

On Thu, Aug 11, 2022 at 05:48:14PM +0100, Anthony PERARD wrote:
> gdbsx/:
>   - Make use of subdir facility for the "clean" target.
>   - No need to remove the *.a, they aren't in this dir.
>   - Avoid calling "distclean" in subdirs as "distclean" targets do only
>     call "clean", and the "clean" also runs "clean" in subdirs.
>   - Avoid the need to make "gx_all.a" and "xg_all.a" in the "all"
>     recipe by forcing make to check for update of "xg/xg_all.a" and
>     "gx/gx_all.a" by having "FORCE" as prerequisite. Now, when making
>     "gdbsx", make will recurse even when both *.a already exist.
>   - List target in $(TARGETS).
> 
> gdbsx/*/:
>   - Fix dependency on *.h.
>   - Remove some dead code.
>   - List targets in $(TARGETS).
>   - Remove "build" target.
>   - Cleanup "clean" targets.
>   - remove comments about the choice of "ar" instead of "ld"
>   - Use "$(AR)" instead of plain "ar".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

-- 
Anthony PERARD

