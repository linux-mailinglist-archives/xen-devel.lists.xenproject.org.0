Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C456C27A20A
	for <lists+xen-devel@lfdr.de>; Sun, 27 Sep 2020 19:36:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMaaF-0002Oy-To; Sun, 27 Sep 2020 17:35:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WAVw=DE=163.com=sh_def@srs-us1.protection.inumbo.net>)
 id 1kMaU5-0001cq-Cp
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2020 17:29:13 +0000
X-Inumbo-ID: 1910b399-ae24-4478-8eaa-dcbd8774c707
Received: from m12-13.163.com (unknown [220.181.12.13])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1910b399-ae24-4478-8eaa-dcbd8774c707;
 Sun, 27 Sep 2020 17:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=vS6DJ
 k7Fac/tQVawi0riFsNIUDE5hRFE459qzpsGu4w=; b=oKY+rVPCQ5k/vUQUfvaPj
 VLIYA1j1+tsnGz/TMrLzjWXZ5bQjm7ojYySA0j4cYkCTcNx1JXF8rNWh6FTb/xUE
 fTzMWwzp6v76HXXh7TLNuFuDJ0bZTcGkiJzsiwZ2vIRPtIU6945PFS1KtIfhD+m/
 IbrRK6MDIVHMbD6GsvYErs=
Received: from localhost (unknown [101.86.214.224])
 by smtp9 (Coremail) with SMTP id DcCowAA3KozEy3BffA43Ig--.50549S2;
 Mon, 28 Sep 2020 01:28:37 +0800 (CST)
Date: Mon, 28 Sep 2020 01:28:36 +0800
From: Hui Su <sh_def@163.com>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arch/x86: fix some typos in xen_pagetable_p2m_free()
Message-ID: <20200927172836.GA7423@rlk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: DcCowAA3KozEy3BffA43Ig--.50549S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF47XryUAw4DCw4UCrWxZwb_yoWfJwcEga
 17Zw4xCryjq3ySy34a93ySqF4Skw4vv398Jry8Zw4UtFy5Jws8GF10qasxJ34UW3yUWrWf
 G3s3Xr429w47KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnG2NtUUUUU==
X-Originating-IP: [101.86.214.224]
X-CM-SenderInfo: xvkbvvri6rljoofrz/1tbiOQWsX1Xlu0UBGwAAsb
X-Mailman-Approved-At: Sun, 27 Sep 2020 17:35:33 +0000
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

arch/x86: fix some typos in xen_pagetable_p2m_free():
s/Fortunatly/Fortunately

Signed-off-by: Hui Su <sh_def@163.com>
---
 arch/x86/xen/mmu_pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 3273c985d3dd..fbee8f50088b 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -1149,7 +1149,7 @@ static void __init xen_pagetable_p2m_free(void)
 	 * We could be in __ka space.
 	 * We roundup to the PMD, which means that if anybody at this stage is
 	 * using the __ka address of xen_start_info or
-	 * xen_start_info->shared_info they are in going to crash. Fortunatly
+	 * xen_start_info->shared_info they are in going to crash. Fortunately
 	 * we have already revectored in xen_setup_kernel_pagetable.
 	 */
 	size = roundup(size, PMD_SIZE);
-- 
2.25.1



