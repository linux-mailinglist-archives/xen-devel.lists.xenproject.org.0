Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86506AA0376
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 08:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971398.1359850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eX8-0007IR-Ni; Tue, 29 Apr 2025 06:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971398.1359850; Tue, 29 Apr 2025 06:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eX8-0007Gu-Ko; Tue, 29 Apr 2025 06:33:34 +0000
Received: by outflank-mailman (input) for mailman id 971398;
 Tue, 29 Apr 2025 04:06:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGTB=XP=kernel.org=devnull+chenlinxuan.uniontech.com@srs-se1.protection.inumbo.net>)
 id 1u9cEg-0003lQ-Ao
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 04:06:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d1f72a8-24af-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 06:06:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 894DBA4BAEE;
 Tue, 29 Apr 2025 04:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE095C4CEF8;
 Tue, 29 Apr 2025 04:06:16 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id E278EC369CB;
 Tue, 29 Apr 2025 04:06:16 +0000 (UTC)
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
X-Inumbo-ID: 4d1f72a8-24af-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745899577;
	bh=/prxRR17A4AUb6KENZNu6wyfYJfvM5OCsGMmrdX+6/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lG9VsAzybNMbTnUEEHKSZoytPudEOxylRsU+yA6SDAHUs3Vk7juqULDjS6C9O5LhB
	 floTcFwObWWgd9Qy9P+MsJCS+3gFOAKzAAOH7m0u/4KWl+qdSjhZU9WQHFKvNXdN8W
	 BSe3ulfFjmdzCAMY/eCXZehkexHdlwS5pZrZjTrqFgqJT72FDN8uZXwL8SBxJ7riwk
	 AI428EO6T1lPUaWRb0VGqUy9vaGQ4WcwBN3SKW2NraiH6KEL9CXGwiRwCQCvt5x0qw
	 YvgmY7X/yDpGTRvRh8Zxgu/GQZGWWwyBUifBfdMWpSe5cOyf5FDSzF4WkOsKwik//K
	 Pr92s9YBYEgyA==
From: Chen Linxuan via B4 Relay <devnull+chenlinxuan.uniontech.com@kernel.org>
Date: Tue, 29 Apr 2025 12:06:07 +0800
Subject: [PATCH RFC v3 3/8] vfio/virtio: add __always_inline for
 virtiovf_get_device_config_size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-noautoinline-v3-3-4c49f28ea5b5@uniontech.com>
References: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
In-Reply-To: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
 Kevin Tian <kevin.tian@intel.com>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Juergen Gross <jgross@suse.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
 linux-integrity@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, Winston Wen <wentao@uniontech.com>, 
 kasan-dev@googlegroups.com, xen-devel@lists.xenproject.org, 
 Chen Linxuan <chenlinxuan@uniontech.com>, 
 Changbin Du <changbin.du@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3264;
 i=chenlinxuan@uniontech.com; h=from:subject:message-id;
 bh=xG7js8JRxRjbFUIGcKi60xVgk95Kd+hLnEeuvHk0cSk=;
 b=owEBbQKS/ZANAwAKAXYe5hQ5ma6LAcsmYgBoEFAwmuPV3ACiHfIboeRqguBq0EhDlCeY2gJxc
 awVBFVX6dWJAjMEAAEKAB0WIQTO1VElAk6xdvy0ZVp2HuYUOZmuiwUCaBBQMAAKCRB2HuYUOZmu
 i/7eD/9hIYexsn7L7GF/snRnakoE8V20CWkBNi/mt9lRdndsCiW2OdR1Ihha5YAXqecwmxRnfIk
 Emq8Rre/zUQpqoY7eJyR2xDIWhTnkwkCyfEyTsfGHJLEwQpKTt6VJJ194lzRgNJrsRGkdhoJgPI
 YVf5pd6n5+4vBUJ/2hfI/Wqt3KqqPR6vu9hUhNnSvGaEfJr67namCj1dKTEwipm+iyXGN7sYjwk
 snpKKFC8f1CyrsuOK1huwKroAFyXxK4bO9wRbSoE6Gt/WzfA3AIzffrZ/aMgOYpKOZs6Ing6PD3
 JJtFMLXppoFpuxaeXTedKMV2BuZ+QBRT8o4qDbJfIlRShfkM7nmkNgwKfyWdeXJVC/xO2NpbaXw
 oP4yE1mGjdBOkSpdcza79ucV0LSYANd8QnYJp5U0wRF5sJzj2Nll37E/9/W1L6yc4KSM3WdsvwP
 RsV1dnU8iFNZu61T95iCwa1GRo9dBbiQkjhkOvrBKEnM4ASeS1O0D2PdUlpWE7vO5rmS4F+3XCa
 Y/P1rp+j9DMaFuEPisA/6hp+L1E2HvBW5Md/Z6qu10+dwT1kPXvMWF0HUIgHhAppENa897twV7b
 6F9KYT4mFmdKNtZU6HSx6NzlGP2GxiJ1qZQP6mSPk+y5h2cOxYVABAdoN0CT/1P2jyc5Gq7LZo4
 ETnYNoxJgZ1iw4Q==
X-Developer-Key: i=chenlinxuan@uniontech.com; a=openpgp;
 fpr=D818ACDD385CAE92D4BAC01A6269794D24791D21
X-Endpoint-Received: by B4 Relay for chenlinxuan@uniontech.com/default with
 auth_id=380
X-Original-From: Chen Linxuan <chenlinxuan@uniontech.com>
Reply-To: chenlinxuan@uniontech.com

From: Winston Wen <wentao@uniontech.com>

Presume that kernel is compiled for x86_64 with gcc version 13.3.0:

  make defconfig
  ./scripts/kconfig/merge_config.sh .config <(
    echo CONFIG_VFIO=m
    echo CONFIG_VIRTIO_PCI=y
    echo CONFIG_VIRTIO_PCI_LIB_LEGACY=y
    echo CONFIG_VIRTIO_VFIO_PCI=m
    echo CONFIG_VIRTIO_VFIO_PCI_ADMIN_LEGACY=y
  )
  make KCFLAGS="-fno-inline-small-functions -fno-inline-functions-called-once" \
    drivers/vfio/pci/virtio/legacy_io.o

This results a compile error:

    CALL    scripts/checksyscalls.sh
    DESCEND objtool
    INSTALL libsubcmd_headers
    CC      drivers/vfio/pci/virtio/legacy_io.o
  In file included from <command-line>:
  drivers/vfio/pci/virtio/legacy_io.c: In function 'virtiovf_init_legacy_io':
  ././include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_889' declared with attribute error: BUILD_BUG_ON failed: !is_power_of_2(virtvdev->bar0_virtual_buf_size)
    557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |                                             ^
  ././include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
    538 |                         prefix ## suffix();                             \
        |                         ^~~~~~
  ././include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
    557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |         ^~~~~~~~~~~~~~~~~~~
  ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
     39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
        |                                     ^~~~~~~~~~~~~~~~~~
  ./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
        |         ^~~~~~~~~~~~~~~~
  drivers/vfio/pci/virtio/legacy_io.c:401:9: note: in expansion of macro 'BUILD_BUG_ON'
    401 |         BUILD_BUG_ON(!is_power_of_2(virtvdev->bar0_virtual_buf_size));
        |         ^~~~~~~~~~~~

BUILD_BUG_ON needs virtvdev->bar0_virtual_buf_size to be computed at
compile time. So we should mark virtiovf_get_device_config_size() with
__always_inline here.

Co-developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Winston Wen <wentao@uniontech.com>
---
 drivers/vfio/pci/virtio/legacy_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/pci/virtio/legacy_io.c b/drivers/vfio/pci/virtio/legacy_io.c
index 832af5ba267c49a079009cfe0fa93c15ba7a490f..b6871d50b9f9e278ef3c49a9cb2baf474b8271c6 100644
--- a/drivers/vfio/pci/virtio/legacy_io.c
+++ b/drivers/vfio/pci/virtio/legacy_io.c
@@ -350,7 +350,7 @@ int virtiovf_open_legacy_io(struct virtiovf_pci_core_device *virtvdev)
 	return virtiovf_set_notify_addr(virtvdev);
 }
 
-static int virtiovf_get_device_config_size(unsigned short device)
+static __always_inline int virtiovf_get_device_config_size(unsigned short device)
 {
 	/* Network card */
 	return offsetofend(struct virtio_net_config, status);

-- 
2.43.0



