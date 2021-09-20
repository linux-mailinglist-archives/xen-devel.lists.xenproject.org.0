Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9C0411E0F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191048.340921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN33-0004FG-Oz; Mon, 20 Sep 2021 17:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191048.340921; Mon, 20 Sep 2021 17:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSN33-0004D6-LC; Mon, 20 Sep 2021 17:25:45 +0000
Received: by outflank-mailman (input) for mailman id 191048;
 Mon, 20 Sep 2021 17:25:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSN32-0003ck-Ip
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:25:44 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86b3c526-b7fb-4aca-b34f-30ec78337ff1;
 Mon, 20 Sep 2021 17:25:38 +0000 (UTC)
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
X-Inumbo-ID: 86b3c526-b7fb-4aca-b34f-30ec78337ff1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632158738;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zbv4TRtvbYbmEr6riLgsvffP+odFSfYHHa0VIndkMik=;
  b=czcX31EqGTGZ3IsHSbQkA8hJFnS9o8lBr4M9FKTRwp2kVz/bH9I6/m/N
   0hy7rjE3067uXX1iO5UkLN1FNG/EIEwUuSPpxpPLkZvjayT9ifiJm9ksA
   aRM3u5gRHVm7HVc4xdLZmCgILOmkHpCjyUgFXQk5K1E306svtwZm8MNiH
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0Ea6ZAnbzQ6qbl6elFK2DEpm081owM6O7Abkn5hvmJwOYOeDTH+CNPorjHTYd6EOQMJ0fZQHE+
 UAeoH5yOlXKzVBZ97qJUwcnKiBd3Tnz/DTmcUKq6Bxb0+YXeY+kHqQBJGv3bL9sewPuNaONJ2z
 8Y9VTsI6lD1rypsBrIlMGMgXfl1qwwNHziUovvPyyNImCCXwVinTOZvqEkuBp5OG08PjTOuRRQ
 CNAnphP92Ln9cLBh1vu5Z5entE58H6vgvs8WdKYeXEEOEBUZ+gK4h8d7MpZeOutO+dknu6dL3K
 8Y0fr8kjSHiR+bWFdTU3Segs
X-SBRS: 5.1
X-MesageID: 53560991
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WsyjXar0QE3yKivrDjUrU7dzjexeBmKtYhIvgKrLsJaIsI4StFCzt
 garIBmAbPvbZjOhLdhyOYy09RhSuZXRz4drQQJpqyE8RXlBopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncw0ILhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZy0TSwIMqqWotQ6TjoFSQ1SAvZUxqCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 pFEN2I+PU2ojxtnanAYKp88hPySglLFWDJzsWOSn5Uxyj2GpOB2+Oe0a4eEEjCQfu1ZkE+Xq
 WPB+2XRGQwBOZqUzj/t2lCGi/LLnCj7cJkPD7D+/flv6HWRyXYUEwY+TkagrL+yjUvWc9dSL
 UME5wIlrLN06VSmSN+7UhGlyFa6uRobV8tVAvcNwgiHwarJ4C6UHmEBCDVGbbQOtdA0bSwn0
 EeTmNHkDiApt6eaIVqN+7HRoT6sNCw9KW4ZeTRCXQYD+8Pkoow4klTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1VLahzOhoLDZQwhz4R/YNkq66itpaYjjYJangWU39t4ZctzfFAPY+
 iFZxY7Ot4jiEK1higSNROEmPb2uvcy1FyD/3ARDM6Z65QqyrivLkZ9r3N1uGKt4Gp9aIma5O
 x6C4Vk5CIx7ZyTxPPQuC26lI4Fzl/GxS469PhzBRocWOvBMmBm7EDaCjKJ691vkllQl2Yo7M
 I2SGSpHJSdHUfk7pNZaquF07FPK+szc7TiILXwY507+uVZ7WJJyYe1eWGZilshjsMu5TPz9q
 r6zzfdmLimzt8WlOEHqHXM7dwhWfRDX+7iv85E/mhG/zvpORzh6Vq65LUIJUI15haVF/tokD
 VnkARQw9bYLvlWecV/iQik6MNvHBM8jxVpmbX1EFQv5gBALPNfwhJrzgrNqJNHLAsQ4lqUqJ
 xTEEu3daslypsPvoWVFMcal89w8K3xGR2umZkKYXdT2RLY4LyShxzMuVlGHGPAmAnXluM0gj
 aen0w+HE5MPSx47VJTdae61zkP3tn8YwbogU0zNK9hVWUPt7Ik1dHCh0q5pe5kBeUfZ2z+X9
 weKGhNE9+PDlJA4rYvSjqeeoob3T+YnRhhGH3PW5KqdPDXB+jbx2pdJVeuFJGiPVG799Ki4S
 /9SyvXwbK8OkFpQ6tIuGLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+YA6wWsW
 0+J9t1LApmzOZvoQAwLOQ4oTuWfzvVIyDPc2us4fRfh7yht8bvZDUgLZ0uQiDZQJadeOZ8+x
 btzo9Yf7gGyh0Z4MtuCiSwIpW2AImZZDvciv5AeRoTqlhAq2hdJZpmFUn3655SGatNtNEg2I
 2DL2Pqe1uoEnkeSIWAuEXXt3PZGgcVcsR9H+1YOOlCVl4eXnfQwxhBQrWw6Qwk9Is+rCA6v1
 ryH73FIGJg=
IronPort-HdrOrdr: A9a23:7xHaKapl5PDXnqiXUegI6d0aV5rbeYIsimQD101hICG9Evb0qy
 nOpoV96faQslwssR4b9uxoVJPvfZqYz+8X3WBzB8bHYOCFgguVxehZhOOP/9SjIVydygc078
 xdmsNFebjN5DZB7PoT4GODYqodKNvsytHWuQ8JpU0dMz2DaMtbnnZE4h7wKDwReOHfb6BJbq
 Z14KB81kOdUEVSVOuXLF8fUdPOotXa/aiWHCLvV3YcmXGzZSrD0s+ALySl
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="53560991"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Meng Xu <mengxu@cis.upenn.edu>
Subject: [PATCH v2 00/12] xen/trace: Fix leakage of uninitialised stack into the tracebuffer
Date: Mon, 20 Sep 2021 18:25:17 +0100
Message-ID: <20210920172529.24932-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patches 1-3 fix bugs causing uninitialised stack to leak into the trace
buffers.  Xentrace is a developer/debugging activity restricted to fully
privileged entities, so the leaking of uninitialised stack contents is not a
security concern here.

Patches 4 and 5 are cleanup worthy of backporting, because their knock-on
effects in release builds.

Patches 6 and later are cleanup and probably not for backporting.  They
convert all trace records to using fixed types, and move some PV-specifics to
only be built for PV && TRACEBUFFER, and removing stub files from all
architectures.

I have yet more cleanup in progress making most of the macros disappear, but
this series is getting long enough already, (and taking time I don't really
have).

Andrew Cooper (12):
  xen/trace: Don't over-read trace objects
  xen/memory: Remove tail padding from TRC_MEM_* records
  xen/credit2: Remove tail padding from TRC_CSCHED2_* records
  x86/hvm: Reduce stack usage from HVMTRACE_ND()
  x86/hvm: Remove duplicate calls caused by tracing
  xen/credit2: Clean up trace handling
  xen/rt: Clean up trace handling
  xen/sched: Clean up trace handling
  xen/trace: Minor code cleanup
  x86/pv: Move x86/trace.c to x86/pv/trace.c
  xen/arch: Drop asm-*/trace.h
  x86/trace: Clean up trace handling

 tools/xentrace/formats               |   4 +
 tools/xentrace/xenalyze.c            |  12 +-
 xen/arch/x86/Makefile                |   1 -
 xen/arch/x86/hvm/hpet.c              |  15 +-
 xen/arch/x86/hvm/hvm.c               |   5 +-
 xen/arch/x86/hvm/svm/svm.c           |   8 +-
 xen/arch/x86/hvm/vlapic.c            |  23 ++-
 xen/arch/x86/hvm/vmx/vmx.c           |   9 +-
 xen/arch/x86/hvm/vpic.c              |   9 +-
 xen/arch/x86/irq.c                   |   4 +-
 xen/arch/x86/mm/p2m-pod.c            |  17 +-
 xen/arch/x86/mm/p2m-pt.c             |   6 +-
 xen/arch/x86/mm/shadow/multi.c       |   2 +-
 xen/arch/x86/pv/Makefile             |   1 +
 xen/arch/x86/pv/emul-inv-op.c        |   2 +-
 xen/arch/x86/pv/emul-priv-op.c       |   1 +
 xen/arch/x86/pv/ro-page-fault.c      |   2 +-
 xen/arch/x86/pv/trace.c              | 141 ++++++++++++++
 xen/arch/x86/pv/traps.c              |   2 +-
 xen/arch/x86/trace.c                 | 159 ----------------
 xen/arch/x86/traps.c                 |   3 +-
 xen/common/memory.c                  |   4 +-
 xen/common/sched/core.c              |   4 +-
 xen/common/sched/credit.c            |  38 ++--
 xen/common/sched/credit2.c           | 344 +++++++++++++++++------------------
 xen/common/sched/null.c              |  42 +++--
 xen/common/sched/rt.c                | 121 ++++++------
 xen/common/trace.c                   |  60 +++---
 xen/include/asm-arm/trace.h          |  12 --
 xen/include/asm-x86/hvm/trace.h      |  30 ++-
 xen/include/asm-x86/{ => pv}/trace.h |   8 +-
 xen/include/xen/trace.h              |  13 +-
 32 files changed, 537 insertions(+), 565 deletions(-)
 create mode 100644 xen/arch/x86/pv/trace.c
 delete mode 100644 xen/arch/x86/trace.c
 delete mode 100644 xen/include/asm-arm/trace.h
 rename xen/include/asm-x86/{ => pv}/trace.h (92%)

-- 
2.11.0


