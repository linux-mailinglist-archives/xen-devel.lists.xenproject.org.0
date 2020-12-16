Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A925B2DBE74
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 11:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55167.96063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpTsI-00022F-F5; Wed, 16 Dec 2020 10:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55167.96063; Wed, 16 Dec 2020 10:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpTsI-00021q-C4; Wed, 16 Dec 2020 10:17:38 +0000
Received: by outflank-mailman (input) for mailman id 55167;
 Wed, 16 Dec 2020 10:17:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cg29=FU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kpTsG-00021l-SL
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 10:17:36 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ef3197e-f381-4105-99cb-93057bee257d;
 Wed, 16 Dec 2020 10:17:35 +0000 (UTC)
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
X-Inumbo-ID: 7ef3197e-f381-4105-99cb-93057bee257d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608113855;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=qll6Wpqk4RFhNWuNJAwRuphR6lrp5io6cBTRKGbeL8A=;
  b=KXvZttbUnkSIWUS8ij3TpyjkgKHGfvOe0Sc4MQlHn63gRWtzdqkO9DlQ
   jKnoTTV6ZJAWZMBj5DPKcXh8UCObMRaAZSLlcHTLKAdrsaYPkJsfavaHF
   oL6Sb4RYkcTuIJNk4PV0oWpjSYqeCNkw6Lg0fvqTeZLBSsYJIrmwVPFA3
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9fxSQSuzMEdzIk68C8lklNKqsDjJURYTiUaqjk00LpOyd8b2KqUevD0Et7mVWM9r7DM9KfRLuk
 IZXz46O/jZUUWG/wkO3PmfTPC+Za3vAJ/pXkf1xRpcTyApuxs7yZ5lCW6fDg/Xm6Bewjh9ucf+
 fdp33JgN8lxf/TPgJyOm0cgaJGfaJ2hFSKUoeZcWFbTzWsZNbCw4YvbHPTpFuyfuFE9/50SiC+
 Gtq1NkHp/QXlQHmSOWd/Ve2SzgTaQyz3xA3uApglcVsuSDk7Bp+fbZ7a7nKfHDSUY0fJdp17h8
 dmU=
X-SBRS: 5.2
X-MesageID: 33338992
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,424,1599537600"; 
   d="scan'208";a="33338992"
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
To: osstest service owner <osstest-admin@xenproject.org>,
	<xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>
References: <E1kpMXk-0006zb-Jk@osstest.test-lab.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <19ed8894-23f7-0f9d-f3c4-1d5ea5bc0c02@citrix.com>
Date: Wed, 16 Dec 2020 10:17:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <E1kpMXk-0006zb-Jk@osstest.test-lab.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 16/12/2020 02:27, osstest service owner wrote:
> branch xen-unstable-smoke
> xenbranch xen-unstable-smoke
> job build-amd64-libvirt
> testid libvirt-build
>
> Tree: libvirt git://xenbits.xen.org/libvirt.git
> Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
> Tree: xen git://xenbits.xen.org/xen.git
>
> *** Found and reproduced problem changeset ***
>
>   Bug is in tree:  xen git://xenbits.xen.org/xen.git
>   Bug introduced:  929f23114061a0089e6d63d109cf6a1d03d35c71
>   Bug not present: 8bc342b043a6838c03cd86039a34e3f8eea1242f
>   Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/157589/
>
>
>   commit 929f23114061a0089e6d63d109cf6a1d03d35c71
>   Author: Paul Durrant <pdurrant@amazon.com>
>   Date:   Tue Dec 8 19:30:26 2020 +0000
>   
>       libxl: introduce 'libxl_pci_bdf' in the idl...
>       
>       ... and use in 'libxl_device_pci'
>       
>       This patch is preparatory work for restricting the type passed to functions
>       that only require BDF information, rather than passing a 'libxl_device_pci'
>       structure which is only partially filled. In this patch only the minimal
>       mechanical changes necessary to deal with the structural changes are made.
>       Subsequent patches will adjust the code to make better use of the new type.
>       
>       Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>       Acked-by: Wei Liu <wl@xen.org>
>       Acked-by: Nick Rosbrook <rosbrookn@ainfosec.com>

This breaks the API.  You can't make the following change in the IDL.

 libxl_device_pci = Struct("device_pci", [
-    ("func",      uint8),
-    ("dev",       uint8),
-    ("bus",       uint8),
-    ("domain",    integer),
-    ("vdevfn",    uint32),
+    ("bdf", libxl_pci_bdf),
+    ("vdevfn", uint32),

~Andrew

