Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E22511874
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315088.533451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhvl-0002Zq-Sk; Wed, 27 Apr 2022 13:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315088.533451; Wed, 27 Apr 2022 13:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhvl-0002XT-Pp; Wed, 27 Apr 2022 13:42:09 +0000
Received: by outflank-mailman (input) for mailman id 315088;
 Wed, 27 Apr 2022 13:42:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y66U=VF=citrix.com=prvs=1094d0c61=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1njhvk-0001vd-Hj
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:42:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3d27cee-c62f-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 15:42:07 +0200 (CEST)
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
X-Inumbo-ID: d3d27cee-c62f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651066927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1EftjlPb2D5bL7c8oYZxtZPU4mzZ887UzPNIbQPwjq4=;
  b=Vuqj9yHe8z4ecevIFHOzI3ErcBcqOAUJaAdHAcsVt1RAnHYI6syru7Mk
   C8Pp2AspppJ/PQYyO8PZ6m4MRUWbe4CL2euYcE5nj9G1vkXY0cgPFqKFf
   RYeKGU/clB05kDsfpFWn54A3ICiCxgknSO9K5Fimbyob0wP1cF4aEPHJq
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69441940
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DQCqGapzxtXLq/t4U5DfJiBap9JeBmLMZRIvgKrLsJaIsI4StFCzt
 garIBmDbPqJZWb8etwja4Sx8hhXusLVnYJhSwM/qSo1RnhHoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 4yq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBFJDrw+cSFBpjLiBmLIlY2bzsOleOmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxPUicOkwTYj/7Dro3gtyBqWPddwR0tRXEo/U++G6U0jBuhe2F3N39JYXRGJQ9clyjj
 nrM+GLrAxcbHMaSxTqM7jSngeqntTr2XZ9XCKe56P9jhHWVwWocDgBQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8JZDukS+AyLjK3O7G6xGmgZUj5pctEqtMYqAzct0
 zehht7sGHljvaOYTVqb8bGbqy70PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65uAZAhmpn
 WrM9nJnwexO04hbjM1X4GwrnRqGm7+STQFy5T7qX3q0yh1YZ6W+SL2BvA2zAel7EK6VSVyIv
 X4hkseY7fwTAZzlqBFhUNnhD5nyua/bbWS0bUpHWsB4qm/zoyLLkZV4umkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjhmP8AZmOyvpngGiausM4fFyhVErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr6ievFOCTNFuxeajNii9zVC4ve/m3oH
 yt3bZPWm32zrsWjCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUJfsLUcaU9U9xcx9z76Ql
 lnkAx8w4Aev1BXvdFTRAlg+OeyHYHqKhS9iVcDaFQ3zgCZLjEfGxPp3SqbbipF6qrw+laIkE
 6htlgfpKq0ndwkrMg81NfHVxLGOvjzx7e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:DpnpmamqKWNV1nOW1Z4xPcpiZaLpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="69441940"
Date: Wed, 27 Apr 2022 14:41:52 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Thomas Huth <thuth@redhat.com>
CC: <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	<qemu-trivial@nongnu.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] qemu-options: Limit the -xen options to x86 and arm
Message-ID: <YmlIICWzw0wDBE31@perard.uk.xensource.com>
References: <20220427133156.344418-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220427133156.344418-1-thuth@redhat.com>

On Wed, Apr 27, 2022 at 03:31:56PM +0200, Thomas Huth wrote:
> The Xen hypervisor is only available on x86 and arm - thus let's
> limit the related options to these targets.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

