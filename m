Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54B748D71A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 13:06:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257162.441811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yra-0005TD-Hy; Thu, 13 Jan 2022 12:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257162.441811; Thu, 13 Jan 2022 12:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yra-0005QO-Et; Thu, 13 Jan 2022 12:05:54 +0000
Received: by outflank-mailman (input) for mailman id 257162;
 Thu, 13 Jan 2022 12:05:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GUHC=R5=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n7yrY-0005QI-Qn
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 12:05:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25cdfa83-7469-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 13:05:51 +0100 (CET)
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
X-Inumbo-ID: 25cdfa83-7469-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642075551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9uObCzDyOHhjYFW7ftrnIdbnpdo5iKe6FGaCQhvR7Lg=;
  b=XPATyEjToSaNDDhQrOiKZ6V872TUVk9fVi8/AncEOMZTMJ/X+81wKP8o
   dolwNGKTv9IFy+xLSEHUYv870euIlOiX4/SflSWYNrpby7RVE6sAANBg5
   pzwoG80Ik6BM2lv1TDm6Wwkk7IO8nPxIpWwMdJxB+JT3TKdQM2e3I4IyS
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TYCMsyy1QkiLnOcW1CUNnkkso464a7l0+h0Vi/OBPH2vbrlMFd9S6IWBN2OlqaEQoOioDEzq7I
 VATkaD4snYOMh+rQGw+TeSECayDlOcVcsXDfBiwMvzb8CecxidDMtmKgZvAyl9nad3IIUn3gkB
 0WO9dVyPZ34eNyBk+JJ8qVPnxF8lsiQZ7I/f4x4Z/WkTuXAdoT6SH7P3FV5p/iBDHL96N1HvWg
 ZNAa8JEcUs1Miqpdj+EKByKAmsyMa4uxHj9vghSghbRSb1TqA2wDEWcn3NenLyojF1k/0DEQzx
 HkCGS2WB6RZ+6gHL8/agxXzB
X-SBRS: 5.2
X-MesageID: 61914428
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:n7vFJK8PWS36OCziQBpqDrUDc3mTJUtcMsCJ2f8bNWPcYEJGY0x3n
 DdLWmjSOPqPYjSkeNwiYIXloBxUsZCHzNBgHQY9r308E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dg2dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh2x
 98cmpWCGT4ZI5bGs/o4V0EGIwxhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4XTK+CO
 5BJAdZpRBD6XSBOKgs1Mr19kfuaj0TfWR54hE3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/WvjBQoBHMeC0jfD+XWp7sfNky77XIMdPKal7fMsi1qWrkQfBhQZWlq8pfiRkVOlVpRUL
 El80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BAjNl4ZKceyKkxqqvpxisHCxNc18venpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzliPBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn1tp5p0xWG2DaD+qXNERz3qxZPmqgKsVlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4i/DqmPNoQSMsMrHONiwM2ITRTAt4wKuBJ9+ZzTx
 L/BKZr8ZZrkIfkPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilksDOMWjPHi/2dNDfDgicClgbbir+pM/SwJ2Clc8cI3XI6WPkepJlk0Mt/k9q9okC
 VnmCxAIkwSu1CSXQehIA1g6AI7SsV9EhSpTFUQR0ZyAgiBLjV+H4PhNep0pU6Mg8eA/n/d4Q
 +NcI5eLA+hVSySB8DMYNMGvoItnfRWtpASPIyv6P2RvI88+H1TEqo3+Yw/i1CgSFS7r58Ewl
 KKti1HASp0ZSgU8UMuPMKCzz0m8tGQ2kf5pWxeaOcFafUjhqdA4KyH4gvItDdsLLBHPmmmT2
 wqMWE9KrujRuY4lttLOgPnc/YuuFuJ/GGtcHnXasunqZXWLoDL7zNYZAuiSfD3bWGflw4mYZ
 L1Yn6PmLfkKvFdWqI4gQbxl+r0zuon0rLhAwwU6QHiSNwa3CqltK2Wt1NVUsvEf3adQvAa7V
 x7d+tRePrnVasrpHERIeVggZ+WHk/oVhiPT/bI+J0CjvH17+7+OUENzORiQiXMCcOspYd19m
 epx6tQL7wGfiwYxNofUhy9ZwG2AM3gcXvh1rZodGoLq1lImx1wqjUYw0cMqDEVjs+lxD3Q=
IronPort-HdrOrdr: A9a23:07ers6jUMEFDv/7qdEvy/JGneHBQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.88,286,1635220800"; 
   d="scan'208";a="61914428"
Date: Thu, 13 Jan 2022 12:05:34 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: <xen-devel@lists.xenproject.org>, James Fehlig <jfehlig@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] tools/libs/light: numa placement: don't try to free
 a NULL list of vcpus
Message-ID: <YeAVjpmuV9LIRFpa@perard>
References: <164200566223.24755.262723784847161301.stgit@work>
 <164200569629.24755.2980883411590685040.stgit@work>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <164200569629.24755.2980883411590685040.stgit@work>

On Wed, Jan 12, 2022 at 05:41:36PM +0100, Dario Faggioli wrote:
> If libxl_vcpu_list() returned NULL, we should not call
> libxl_numainfo_list_free() as:

You mean libxl_vcpuinfo_list_free() ?

> 1) it'll fail trying to (double) free() *list

This isn't really an issue. free(NULL) is legit, can be call as many
time as you want.

> 2) there should be nothing to free anyway

The issue here is that it doesn't appear to be true. Even if "info" is
NULL, "nr" have an other value than 0, so libxl_vcpuinfo_list_free()
will try to access random addresses.

> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> Tested-by: James Fehlig <jfehlig@suse.com>

Can I suggest to make libxl_vcpuinfo_list_free() work a bit better in
case it's "nr" parameter is wrong? It will do nothing if "list" is NULL.
Even if that seems wrong, and the caller should use the correct value.

Also I think it is better to keep the free in the exit path at the end
of the loop.

Thanks,

-- 
Anthony PERARD

