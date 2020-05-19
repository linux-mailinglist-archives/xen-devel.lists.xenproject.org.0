Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4691D9118
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 09:31:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jawiH-0006s1-Hj; Tue, 19 May 2020 07:30:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aMO8=7B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jawiF-0006ru-VJ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 07:30:55 +0000
X-Inumbo-ID: ac7641dc-99a2-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac7641dc-99a2-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 07:30:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E9971ACB8;
 Tue, 19 May 2020 07:30:55 +0000 (UTC)
Subject: Re: [PATCH v10 00/12] Add hypervisor sysfs-like support
To: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20200519072106.26894-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <24935c43-2f2d-83cf-9039-ec0f97498103@suse.com>
Date: Tue, 19 May 2020 09:30:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519072106.26894-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.20 09:20, Juergen Gross wrote:
> On the 2019 Xen developer summit there was agreement that the Xen
> hypervisor should gain support for a hierarchical name-value store
> similar to the Linux kernel's sysfs.
> 
> This is a first implementation of that idea adding the basic
> functionality to hypervisor and tools side. The interface to any
> user program making use of that "xen-hypfs" is a new library
> "libxenhypfs" with a stable interface.
> 
> The series adds read-only nodes with buildinfo data and writable
> nodes with runtime parameters. xl is switched to use the new file
> system for modifying the runtime parameters and the old sysctl
> interface for that purpose is dropped.
> 
> Changes in V10:
> - adressed review comments
> 
> Changes in V9:
> - addressed review comments
> 
> Changes in V8:
> - addressed review comments
> - added CONFIG_HYPFS config option
> 
> Changes in V7:
> - old patch 1 already applied
> - add new patch 1 (carved out and modified from patch 9)
> - addressed review comments
> - modified public interface to have a max write size instead of a
>    writable flag only
> 
> Changes in V6:
> - added new patches 1, 10, 11, 12
> - addressed review comments
> - modified interface for creating nodes for runtime parameters
> 
> Changes in V5:
> - switched to xsm for privilege check
> 
> Changes in V4:
> - former patch 2 removed as already committed
> - addressed review comments
> 
> Changes in V3:
> - major rework, especially by supporting binary contents of entries
> - added several new patches (1, 2, 7)
> - full support of all runtime parameters
> - support of writing entries (especially runtime parameters)
> 
> Changes in V2:
> - all comments to V1 addressed
> - added man-page for xenhypfs tool
> - added runtime parameter read access for string parameters
> 
> Changes in V1:
> - renamed xenfs ->xenhypfs
> - added writable entries support at the interface level and in the
>    xenhypfs tool
> - added runtime parameter read access (integer type only for now)
> - added docs/misc/hypfs-paths.pandoc for path descriptions
> 
> Juergen Gross (12):
>    xen/vmx: let opt_ept_ad always reflect the current setting
>    xen: add a generic way to include binary files as variables
>    docs: add feature document for Xen hypervisor sysfs-like support
>    xen: add basic hypervisor filesystem support
>    libs: add libxenhypfs
>    tools: add xenfs tool
>    xen: provide version information in hypfs
>    xen: add /buildinfo/config entry to hypervisor filesystem
>    xen: add runtime parameter access support to hypfs
>    tools/libxl: use libxenhypfs for setting xen runtime parameters
>    tools/libxc: remove xc_set_parameters()
>    xen: remove XEN_SYSCTL_set_parameter support
> 
>   .gitignore                          |   6 +
>   docs/features/hypervisorfs.pandoc   |  92 +++++
>   docs/man/xenhypfs.1.pod             |  61 ++++
>   docs/misc/hypfs-paths.pandoc        | 165 +++++++++
>   tools/Rules.mk                      |   8 +-
>   tools/flask/policy/modules/dom0.te  |   4 +-
>   tools/libs/Makefile                 |   1 +
>   tools/libs/hypfs/Makefile           |  16 +
>   tools/libs/hypfs/core.c             | 536 ++++++++++++++++++++++++++++
>   tools/libs/hypfs/include/xenhypfs.h |  90 +++++
>   tools/libs/hypfs/libxenhypfs.map    |  10 +
>   tools/libs/hypfs/xenhypfs.pc.in     |  10 +
>   tools/libxc/include/xenctrl.h       |   1 -
>   tools/libxc/xc_misc.c               |  21 --
>   tools/libxl/Makefile                |   3 +-
>   tools/libxl/libxl.c                 |  53 ++-
>   tools/libxl/libxl_internal.h        |   1 +
>   tools/libxl/xenlight.pc.in          |   2 +-
>   tools/misc/Makefile                 |   6 +
>   tools/misc/xenhypfs.c               | 192 ++++++++++
>   tools/xl/xl_misc.c                  |   1 -
>   xen/arch/arm/traps.c                |   3 +
>   xen/arch/arm/xen.lds.S              |  13 +-
>   xen/arch/x86/hvm/hypercall.c        |   3 +
>   xen/arch/x86/hvm/vmx/vmcs.c         |  47 ++-
>   xen/arch/x86/hvm/vmx/vmx.c          |   4 +-
>   xen/arch/x86/hypercall.c            |   3 +
>   xen/arch/x86/pv/domain.c            |  21 +-
>   xen/arch/x86/pv/hypercall.c         |   3 +
>   xen/arch/x86/xen.lds.S              |  12 +-
>   xen/common/Kconfig                  |  23 ++
>   xen/common/Makefile                 |  13 +
>   xen/common/grant_table.c            |  62 +++-
>   xen/common/hypfs.c                  | 452 +++++++++++++++++++++++
>   xen/common/kernel.c                 |  84 ++++-
>   xen/common/sysctl.c                 |  36 --
>   xen/drivers/char/console.c          |  72 +++-
>   xen/include/Makefile                |   1 +
>   xen/include/asm-x86/hvm/vmx/vmcs.h  |   3 +-
>   xen/include/public/hypfs.h          | 129 +++++++
>   xen/include/public/sysctl.h         |  19 +-
>   xen/include/public/xen.h            |   1 +
>   xen/include/xen/hypercall.h         |  10 +
>   xen/include/xen/hypfs.h             | 123 +++++++
>   xen/include/xen/kernel.h            |   3 +
>   xen/include/xen/lib.h               |   1 -
>   xen/include/xen/param.h             | 126 +++++--
>   xen/include/xlat.lst                |   2 +
>   xen/include/xsm/dummy.h             |   6 +
>   xen/include/xsm/xsm.h               |   6 +
>   xen/tools/binfile                   |  43 +++
>   xen/xsm/dummy.c                     |   1 +
>   xen/xsm/flask/Makefile              |   5 +-
>   xen/xsm/flask/flask-policy.S        |  16 -
>   xen/xsm/flask/hooks.c               |   9 +-
>   xen/xsm/flask/policy/access_vectors |   4 +-
>   56 files changed, 2445 insertions(+), 193 deletions(-)
>   create mode 100644 docs/features/hypervisorfs.pandoc
>   create mode 100644 docs/man/xenhypfs.1.pod
>   create mode 100644 docs/misc/hypfs-paths.pandoc
>   create mode 100644 tools/libs/hypfs/Makefile
>   create mode 100644 tools/libs/hypfs/core.c
>   create mode 100644 tools/libs/hypfs/include/xenhypfs.h
>   create mode 100644 tools/libs/hypfs/libxenhypfs.map
>   create mode 100644 tools/libs/hypfs/xenhypfs.pc.in
>   create mode 100644 tools/misc/xenhypfs.c
>   create mode 100644 xen/common/hypfs.c
>   create mode 100644 xen/include/public/hypfs.h
>   create mode 100644 xen/include/xen/hypfs.h
>   create mode 100755 xen/tools/binfile
>   delete mode 100644 xen/xsm/flask/flask-policy.S
> 

There are some Acks missing on this series, so please have a look at the
patches!

There are missing especially:

- Patch 1: VMX maintainers
- Patch 2 + 4: XSM maintainer
- Patch 4 + 9: Arm maintainer
- Patch 10 + 11: tools maintainers

I'd really like the series to go into 4.14 (deadline this Friday).


Juergen

