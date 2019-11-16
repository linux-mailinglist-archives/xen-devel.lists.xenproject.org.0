Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A956FEA48
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2019 03:48:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVo5E-0005EM-1z; Sat, 16 Nov 2019 02:45:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4Jn3=ZI=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iVo5C-0005EH-2L
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2019 02:45:06 +0000
X-Inumbo-ID: 16b32b38-081b-11ea-b678-bc764e2007e4
Received: from mail-vs1-xe42.google.com (unknown [2607:f8b0:4864:20::e42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16b32b38-081b-11ea-b678-bc764e2007e4;
 Sat, 16 Nov 2019 02:45:02 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id m9so7678258vsq.7
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 18:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cS002K+JmoTzOM8JHTK0Sq2pBdW6I4m2FLXM0qidpQI=;
 b=g7IJQj9nCtzuWlLxqe4rnwmd0Yf6eL5Ods+yQ2/8BIRSKIqDWzkpZA7ezRI124QJ/8
 7hrRkk+zJIvJRSwlyXXkWcC0IFA+LNLBRNN9KA/LpciCXGqyCZkCVHJ+O+MJKFYO6cUs
 P8j/Px83cqKU3jC5Z8jVSpmVpmH1NHL4QBYKfOrLhwESia051mtYGkmaG00SNIZebxpX
 CFoKYYxzyrnv8Kkbb3YYUO6EaHo26xnl9qdgzABaeO87nXrK1XN17k+d6um4lPYWoC83
 /JO/hqWXha8oAcuZxhs/qsvaZKYIMo1DHYBTVIgorl/LFhCmBF2qqW/0gyxAr/bbrYLw
 eF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cS002K+JmoTzOM8JHTK0Sq2pBdW6I4m2FLXM0qidpQI=;
 b=WmULyNetg70mBhRbsBR2qP/fYRCDLkh1LlrPlumG6gsXyjQw9CH2yUCaBULkEZINpT
 EVE7TXy/uY1K+rmk9tPdVL/qXOA4svkQVj0ZGehNgMtXmf6RQFcvy+h1YzGmEIh0B+Qf
 nCtLeaEHob6sxHyaEAaBkil/GyQ15FB9A9mvbZIcGiSX/AyIljuIBuQQPQDGD39SXqzo
 ZeziO7/xhxQoP4pdbMl3RQnF4/0NeT7lYk53txXioFWyFexsr+OVs3PVHWBbEu5M4KkH
 L7AjRdVPR4YiCMm2upil0FYjsFEWYt46cgub3W9FqndKgSqh+fewfuI8tKoac4etH8V8
 a8Qg==
X-Gm-Message-State: APjAAAU+BHH09dwrlu6NIKok2Rdl31sObtiXLO9oIg/RQzSJw3d+VlQg
 pD+UWVaXKclKdR3fDNmumEEAYnJzDM9+cx60fdE=
X-Google-Smtp-Source: APXvYqziThdLlEhWKt9qrurL/08JI1ftkGRou+Dm792CkLUr6EevW2gv+VrdALfkXoboOS1/X7KXwzEpdbECsbzqaus=
X-Received: by 2002:a67:fd70:: with SMTP id h16mr7024631vsa.160.1573872302159; 
 Fri, 15 Nov 2019 18:45:02 -0800 (PST)
MIME-Version: 1.0
References: <20191114045543.6759-1-julian.tuminaro@gmail.com>
In-Reply-To: <20191114045543.6759-1-julian.tuminaro@gmail.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Sat, 16 Nov 2019 05:44:49 +0300
Message-ID: <CAF3u54CcL-WSFdNUdu+xYT80XiNXoonp-fWqwWy+E-ZxWPDeZg@mail.gmail.com>
To: Julian Tuminaro <julian.tuminaro@gmail.com>
Subject: Re: [Xen-devel] [PATCH V2] kdd.c: Add support for initial handshake
 in KD protocol for Win 7, 8 and 10 (64 bit)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Paul Durrant <paul@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Jenish Rakholiya <rjenish@cmu.edu>, Tim Deegan <tim@xen.org>,
 Julian Tuminaro <jtuminar@andrew.cmu.edu>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============9005328900347569389=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============9005328900347569389==
Content-Type: multipart/alternative; boundary="0000000000007dffad05976db356"

--0000000000007dffad05976db356
Content-Type: text/plain; charset="UTF-8"

Hi,

I am not commenting on the code itself but the process.

On Thu, 14 Nov 2019, 07:59 Julian Tuminaro, <julian.tuminaro@gmail.com>
wrote:

> From: Julian Tuminaro and Jenish Rakholiya <julian.tuminaro@gmail.com and
> rakholiyajenish.07@gmail.com>
>

AFAICT this is the first time we have such format for "From".

We usually have one person listed per tag and I think we should stick with
it.

Otherwise this is possibly going to break tools like get_maintainers.pl
that tends to also output the list of contributors (depending on the
option) and stat tools.

Although, I am not entirely sure how to encode 2 authors here. Maybe 2 From
tag?


> Current implementation of find_os is based on the hard-coded values for
> different Windows version. It uses the value for get the address to
> start looking for DOS header in the given specified range. However, this
> is not scalable to all version of Windows as it will require us to keep
> adding new entries and also due to KASLR, chances of not hitting the PE
> header is significant. We implement a way for 64-bit systems to use IDT
> entry to get a valid exception/interrupt handler and then move back into
> the memory to find the valid DOS header. Since IDT entries are protected
> by PatchGuard, we think our assumption that IDT entries will not be
> corrupted is valid for our purpose. Once we have the image base, we
> search for the DBGKD_GET_VERSION64 structure type in .data section to
> get information required for handshake.
>
> Currently, this is a work in progress feature and current patch only
> supports the handshake and memory read/write on 64-bit systems.
>
> NOTE: This is the Updated version of the previous patch submitted


This paragraph is not useful after committing. We tend to add them after
"---" so it get stripped by git am.

NOTE: This has currently been only tested when debugging was not enabled
> on the guest Windows.


This one is arguable, I think someone should have done the testing in most
of the configurations before committing. So it can be put after "---" to
inform the reviewer the state if the patch.

Cheers,


> Signed-off-by: Jenish Rakholiya <rjenish@cmu.edu>
> Signed-off-by: Julian Tuminaro <jtuminar@andrew.cmu.edu>
> ---
>  tools/debugger/kdd/kdd.c | 392 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 366 insertions(+), 26 deletions(-)
>
> diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
> index fb8c645355..6d3febefda 100644
> --- a/tools/debugger/kdd/kdd.c
> +++ b/tools/debugger/kdd/kdd.c
> @@ -41,6 +41,7 @@
>  #include <errno.h>
>  #include <inttypes.h>
>  #include <netdb.h>
> +#include <stddef.h>
>
>  #include <sys/socket.h>
>  #include <sys/types.h>
> @@ -51,6 +52,16 @@
>
>  #include "kdd.h"
>
> +/*
> + * TODO: kdd_os is a type which is used to represent os array. Adding a
> + * variable here would result in adding a new field to each element in
> array.
> + * However, since most of the fields are part of the same struct that we
> are
> + * trying to read from memory, we have added kddl to this structure. If
> + * required, we can possibly separate the kddl value to someplace else
> + *
> + * We also use kddl of size uint32_t which is actually used to represent
> the
> + * offset from image base rather than actual address
> + */
>  /* Windows version details */
>  typedef struct {
>      uint32_t build;
> @@ -62,6 +73,7 @@ typedef struct {
>      uint32_t version;           /* +-> NtBuildNumber */
>      uint32_t modules;           /* +-> PsLoadedModuleList */
>      uint32_t prcbs;             /* +-> KiProcessorBlock */
> +    uint32_t kddl;              /* +-> KdDebuggerList */
>  } kdd_os;
>
>  /* State of the debugger stub */
> @@ -85,6 +97,117 @@ typedef struct {
>      kdd_os os;                                 /* OS-specific magic
> numbers */
>  } kdd_state;
>
> +/**
> + * @brief Structure to represent DBGKD_GET_VERSION64
> + *
> + * reference:
> https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/wdbgexts/ns-wdbgexts-_dbgkd_get_version64
> + */
> +typedef struct {
> +    uint16_t MajorVersion;                     /* usually 0xf for free
> build */
> +    uint16_t MinorVersion;                      /* build number of target
> OS */
> +    uint8_t ProtocolVersion;             /* version of the debugger
> protocol */
> +    uint8_t KdSecondaryVersion;                  /* secondary version
> number */
> +    uint16_t Flags;    /* set of bit flags for the current debugging
> session */
> +    uint16_t MachineType;                  /* type of the target's
> processor */
> +    uint8_t MaxPacketType;     /* one plus the highest number for a
> debugger */
> +                                     /* packet type recognized by the
> target */
> +    uint8_t MaxStateChagne;       /* one plus the highest number for a
> state */
> +                                           /* change generated by the
> target */
> +    uint8_t MaxManipulate;   /* one more that the highest number,
> recognized */
> +                    /* by the target, for a command to manipulate the
> target */
> +    uint8_t Simulation;    /* indication if target is in simulated
> execution */
> +    uint16_t Unused[1];
> +    uint64_t KernBase;                   /* base address of the kernel
> image */
> +    uint64_t PsLoadedModuleList;             /* value of the kernel
> variable */
> +                                                       /*
> PsLoadedModuleList */
> +    uint64_t DebuggerDataList;               /* value of the kernel
> variable */
> +                                                      /*
> KdDebuggerDataBlock */
> +} PACKED DBGKD_GET_VERSION64;
> +
> +/**
> + * @brief Structure to represent the section in PE headers
> + *
> + * reference:
> https://docs.microsoft.com/en-us/windows/win32/debug/pe-format#section-table-section-headers
> + */
> +typedef struct {
> +    uint8_t Name[8];                /* name of section */
> +    uint32_t VirtualSize;           /* total size of section in memory */
> +    uint32_t VirtualAddr;           /* offset from image base */
> +    uint32_t SizeOfRawData;         /* size of section in for object
> files */
> +    uint32_t PointerToRawData;      /* file pointer to first page in COFF
> */
> +    uint32_t PointerToRelocations;  /* file pointer to beginning of
> relocation entry */
> +    uint32_t PointerToLinenumbers;  /* file pointer to the beginning of
> line-number entries */
> +    uint16_t NumberOfRelocations;   /* number of relocation entries for
> the section */
> +    uint16_t NumberOfLinenumbers;   /* number of line-number entries for
> the section */
> +    uint32_t Characteristics;       /* flags that describe the
> characteristics of the section */
> +} PACKED PE_SECTION_ENTRY;
> +
> +/**
> + * @brief Size of pointer on 64 machine
> + */
> +#define SIZE_PTR64 8
> +
> +/**
> + * @brief Size of pointer on 32 machine
> + */
> +#define SIZE_PTR32 4
> +
> +
>
> +/*****************************************************************************
> + * PE and DOS Header related offsets
> + */
> +
> +/**
> + * @brief Offset in DOS header to look for PE header
> + */
> +#define DOS_HDR_PE_OFF 0x3c
> +
> +/**
> + * @brief Size of PE header offset field in DOS header
> + */
> +#define DOS_HDR_PE_SZ 4
> +
> +/**
> + * @brief Offset of number of sections field in PE header
> + */
> +#define PE_NUM_SECTION_OFF 0x6
> +
> +/**
> + * @brief Size of number of sections field in PE header
> + */
> +#define PE_NUM_SECTION_SZ 2
> +
> +/**
> + * @brief Offset of optional header size field in PE header
> + */
> +#define PE_OPT_HDR_SZ_OFF 0x14
> +
> +/**
> + * @brief Size of optional header size field in PE header
> + */
> +#define PE_OPT_HDR_SZ_SZ 2
> +
> +/**
> + * @brief Size of PE header
> + */
> +#define PE_HDR_SZ 0x18
> +
> +/**
> + * @brief MZ header
> + */
> +#define MZ_HEADER 0x5a4d
> +
> +/**
> + * @brief Limit on the number of sections to look for while iterating
> through
> + * PE sections
> + */
> +#define NUM_SECT_LIMIT 100
> +
> +/**
> + * @brief Major Version for the DBGKD_GET_VERSION64 structure
> + */
> +#define NT_MAJOR_VERSION 0xf
> +
>
>  /*****************************************************************************
>   *  Utility functions
>   */
> @@ -293,41 +416,41 @@ static uint32_t kdd_write_virtual(kdd_state *s, int
> cpuid, uint64_t addr,
>   */
>
>  static kdd_os os[] = {
> - /* Build  64 MP Name                 &Kernel search base    Range
>  +Version    +Modules    +PRCBs (64b) */
> -    {2195, 0, 0, "w2k sp4 x32 UP",    0xffffffff80400000ULL, 0x00000000,
> 0x0006d57c, 0x0006e1b8, 0x0},
> -    {2195, 0, 1, "w2k sp4 x32 SMP",   0xffffffff80400000ULL, 0x00000000,
> 0x0006fa1c, 0x00084520, 0x0},
> + /* Build  64 MP Name                 &Kernel search base    Range
>  +Version    +Modules    +PRCBs (64b)  +KDDL */
> +    {2195, 0, 0, "w2k sp4 x32 UP",    0xffffffff80400000ULL, 0x00000000,
> 0x0006d57c, 0x0006e1b8, 0x0,          0},
> +    {2195, 0, 1, "w2k sp4 x32 SMP",   0xffffffff80400000ULL, 0x00000000,
> 0x0006fa1c, 0x00084520, 0x0,          0},
>      // PAE/UP, PAE/SMP
>
> -    {2600, 0, 0, "xp sp2 x32 UP",     0xffffffff804d7000ULL, 0x00000000,
> 0x00075568, 0x00083b20, 0x0},
> -    {2600, 0, 1, "xp sp2 x32 SMP",    0xffffffff804d7000ULL, 0x00000000,
> 0x0007d0e8, 0x0008d4a0, 0x0},
> +    {2600, 0, 0, "xp sp2 x32 UP",     0xffffffff804d7000ULL, 0x00000000,
> 0x00075568, 0x00083b20, 0x0,          0},
> +    {2600, 0, 1, "xp sp2 x32 SMP",    0xffffffff804d7000ULL, 0x00000000,
> 0x0007d0e8, 0x0008d4a0, 0x0,          0},
>      // PAE/UP, PAE/SMP
>
> -    {2600, 0, 0, "xp sp3 x32 UP",     0xffffffff804d7000ULL, 0x00000000,
> 0x00075be8, 0x000841c0, 0x0},
> -    {2600, 0, 1, "xp sp3 x32 SMP",    0xffffffff804d7000ULL, 0x00000000,
> 0x0007c0e8, 0x0008c4c0, 0x0},
> -    {2600, 0, 0, "xp sp3 x32p UP",    0xffffffff804d7000ULL, 0x00000000,
> 0x0006e8e8, 0x0007cfc0, 0x0},
> -    {2600, 0, 1, "xp sp3 x32p SMP",   0xffffffff804d7000ULL, 0x00000000,
> 0x000760e8, 0x00086720, 0x0},
> +    {2600, 0, 0, "xp sp3 x32 UP",     0xffffffff804d7000ULL, 0x00000000,
> 0x00075be8, 0x000841c0, 0x0,          0},
> +    {2600, 0, 1, "xp sp3 x32 SMP",    0xffffffff804d7000ULL, 0x00000000,
> 0x0007c0e8, 0x0008c4c0, 0x0,          0},
> +    {2600, 0, 0, "xp sp3 x32p UP",    0xffffffff804d7000ULL, 0x00000000,
> 0x0006e8e8, 0x0007cfc0, 0x0,          0},
> +    {2600, 0, 1, "xp sp3 x32p SMP",   0xffffffff804d7000ULL, 0x00000000,
> 0x000760e8, 0x00086720, 0x0,          0},
>
> -    {3790, 0, 0, "w2k3 sp2 x32 UP",   0xffffffff80800000ULL, 0x00000000,
> 0x00097128, 0x000a8e48, 0x0},
> -    {3790, 0, 1, "w2k3 sp2 x32 SMP",  0xffffffff80800000ULL, 0x00000000,
> 0x0009d128, 0x000af9c8, 0x0},
> -    {3790, 0, 0, "w2k3 sp2 x32p UP",  0xffffffff80800000ULL, 0x00000000,
> 0x0008e128, 0x0009ffa8, 0x0},
> -    {3790, 0, 1, "w2k3 sp2 x32p SMP", 0xffffffff80800000ULL, 0x00000000,
> 0x00094128, 0x000a6ea8, 0x0},
> -    {3790, 1, 0, "w2k3 sp2 x64 UP",   0xfffff80001000000ULL, 0x00000000,
> 0x001765d0, 0x0019aae0, 0x0017b100},
> -    {3790, 1, 1, "w2k3 sp2 x64 SMP",  0xfffff80001000000ULL, 0x00000000,
> 0x001b05e0, 0x001d5100, 0x001b5300},
> +    {3790, 0, 0, "w2k3 sp2 x32 UP",   0xffffffff80800000ULL, 0x00000000,
> 0x00097128, 0x000a8e48, 0x0,          0},
> +    {3790, 0, 1, "w2k3 sp2 x32 SMP",  0xffffffff80800000ULL, 0x00000000,
> 0x0009d128, 0x000af9c8, 0x0,          0},
> +    {3790, 0, 0, "w2k3 sp2 x32p UP",  0xffffffff80800000ULL, 0x00000000,
> 0x0008e128, 0x0009ffa8, 0x0,          0},
> +    {3790, 0, 1, "w2k3 sp2 x32p SMP", 0xffffffff80800000ULL, 0x00000000,
> 0x00094128, 0x000a6ea8, 0x0,          0},
> +    {3790, 1, 0, "w2k3 sp2 x64 UP",   0xfffff80001000000ULL, 0x00000000,
> 0x001765d0, 0x0019aae0, 0x0017b100,   0},
> +    {3790, 1, 1, "w2k3 sp2 x64 SMP",  0xfffff80001000000ULL, 0x00000000,
> 0x001b05e0, 0x001d5100, 0x001b5300,   0},
>
> -    {6000, 0, 1, "vista sp0 x32p",    0xffffffff81800000ULL, 0x00000000,
> 0x000a4de4, 0x00111db0, 0x0},
> -    {6001, 0, 1, "vista sp1 x32p",    0xffffffff81000000ULL, 0x0f000000,
> 0x000af0c4, 0x00117c70, 0x0},
> +    {6000, 0, 1, "vista sp0 x32p",    0xffffffff81800000ULL, 0x00000000,
> 0x000a4de4, 0x00111db0, 0x0,          0},
> +    {6001, 0, 1, "vista sp1 x32p",    0xffffffff81000000ULL, 0x0f000000,
> 0x000af0c4, 0x00117c70, 0x0,          0},
>
> -    {6001, 1, 1, "w2k8 sp0 x64",      0xfffff80001000000ULL, 0x0f000000,
> 0x00140bf0, 0x001c5db0, 0x00229640},
> +    {6001, 1, 1, "w2k8 sp0 x64",      0xfffff80001000000ULL, 0x0f000000,
> 0x00140bf0, 0x001c5db0, 0x00229640,   0},
>
> -    {7600, 1, 1, "win7 sp0 x64",      0xfffff80001000000ULL, 0x0f000000,
> 0x001af770, 0x0023de50, 0x002a8900},
> +    {7600, 1, 1, "win7 sp0 x64",      0xfffff80001000000ULL, 0x0f000000,
> 0x001af770, 0x0023de50, 0x002a8900,   0},
>
> -    {7601, 0, 1, "win7 sp1 x32p",     0xffffffff81800000ULL, 0x0f000000,
> 0x000524c4, 0x00149850, 0x0},
> -    {7601, 1, 1, "win7 sp1 x64",      0xfffff80001000000ULL, 0x0f000000,
> 0x001b2770, 0x00240e90, 0x002ab900},
> +    {7601, 0, 1, "win7 sp1 x32p",     0xffffffff81800000ULL, 0x0f000000,
> 0x000524c4, 0x00149850, 0x0,          0},
> +    {7601, 1, 1, "win7 sp1 x64",      0xfffff80001000000ULL, 0x0f000000,
> 0x001b2770, 0x00240e90, 0x002ab900,   0},
>  };
>
>  // 1381, 0, 0, "NT4 sp?", 0xffffffff80100000, ?, ?
>
> -static kdd_os unknown_os = {0, 0, 0, "unknown OS", 0, 0, 0, 0, 0};
> +static kdd_os unknown_os = {0, 0, 0, "unknown OS", 0, 0, 0, 0, 0, 0};
>
>  static int check_os(kdd_state *s)
>  {
> @@ -367,11 +490,226 @@ static int check_os(kdd_state *s)
>      return 1;
>  }
>
> +/**
> + * @brief Parse the memory at \a filebase as a valid DOS header and get
> virtual
> + * address offset and size for any given section name (if it exists)
> + *
> + * @param s Pointer to the kdd_state structure
> + * @param filebase Base address of the file structure
> + * @param sectname Pointer to the section name c-string to look for
> + * @param vaddr Pointer to write the virtual address of section start to
> + * (if found)
> + * @param visze Pointer to write the section size to (if found)
> + *
> + * @return -1 on failure to find the section name
> + * @return 0 on success
> + */
> +static int get_pe64_sections(kdd_state *s, uint64_t filebase, char
> *sectname,
> +        uint64_t *vaddr, uint32_t *vsize)
> +{
> +    uint64_t pe_hdr = 0;
> +    uint64_t sect_start = 0;
> +    uint16_t num_sections = 0;
> +    uint16_t opt_hdr_sz = 0;
> +    PE_SECTION_ENTRY pe_sect;
> +
> +    if (!s->os.w64)
> +        return -1;
> +
> +    /* read PE header offset */
> +    if (kdd_read_virtual(s, s->cpuid, filebase + DOS_HDR_PE_OFF,
> DOS_HDR_PE_SZ,
> +                &pe_hdr) != DOS_HDR_PE_SZ)
> +        return -1;
> +
> +    pe_hdr += filebase;
> +
> +    /* read number of sections */
> +    if (kdd_read_virtual(s, s->cpuid, pe_hdr + PE_NUM_SECTION_OFF,
> +                PE_NUM_SECTION_SZ, &num_sections) != PE_NUM_SECTION_SZ)
> +        return -1;
> +
> +    /* read number of section upto a limit */
> +    if (num_sections > NUM_SECT_LIMIT)
> +        num_sections = NUM_SECT_LIMIT;
> +
> +    /* read size of optional header */
> +    if (kdd_read_virtual(s, s->cpuid, pe_hdr + PE_OPT_HDR_SZ_OFF,
> +                PE_OPT_HDR_SZ_SZ, &opt_hdr_sz) != PE_OPT_HDR_SZ_SZ)
> +        return -1;
> +
> +    /* 0x18 is the size of PE header */
> +    sect_start = pe_hdr + PE_HDR_SZ + opt_hdr_sz;
> +
> +    for (int i = 0; i < num_sections; i++) {
> +        if (kdd_read_virtual(s, s->cpuid, sect_start + (i *
> sizeof(pe_sect)),
> +                    sizeof(pe_sect), &pe_sect) != sizeof(pe_sect))
> +            return -1;
> +
> +        if (!strncmp(sectname, (char *)pe_sect.Name,
> sizeof(pe_sect.Name))) {
> +            *vaddr = filebase + pe_sect.VirtualAddr;
> +            *vsize = pe_sect.VirtualSize;
> +            return 0;
> +        }
> +    }
> +
> +    return -1;
> +}
> +
> +/**
> + * @brief Get the OS information like base address, minor version,
> + * PsLoadedModuleList and DebuggerDataList (basically the fields of
> + * DBGKD_GET_VERSION64 struture required to do handshake?).
> + *
> + * This is done by reading the IDT entry for divide-by-zero exception and
> + * searching back into the memory for DOS header (which is our kernel
> base).
> + * Once we have the kernel base, we parse the PE header and look for
> kernel
> + * base address in the .data section. Once we have possible values, we
> look for
> + * DBGKD_GET_VERSION64 block by using following heuristics on the address
> which
> + * has the kernel base:
> + *
> + *  - at address [-0x10], it should have 0xf as the MajorVersion
> + *  - at address [+0x8], it should have a valid kernel memory address
> pointing
> + *  in .data
> + *  - at address [+0x10], it should have a valid kernel memory address
> pointing
> + *  in .data
> + *
> + * @param s Pointer to the kdd state
> + */
> +static void get_os_info_64(kdd_state *s)
> +{
> +    kdd_ctrl ctrl;
> +    int ret;
> +    uint64_t buf;
> +    uint64_t idt0_addr;
> +    uint64_t base;
> +    uint64_t caddr;
> +    uint64_t data_base;
> +    uint32_t data_size;
> +    uint64_t modptr = 0;
> +    uint64_t kddl = 0;
> +    uint16_t minor = 0;
> +    uint64_t dbgkd_addr;
> +    DBGKD_GET_VERSION64 dbgkd_get_version64;
> +    /* Maybe 1GB is too big for the limit to search? */
> +    uint32_t search_limit = (1024 * 1024 * 1024) / PAGE_SIZE;
> /*1GB/PageSize*/
> +    uint64_t efer;
> +
> +    /* if we are not in 64-bit mode, fail */
> +    if (kdd_rdmsr(s->guest, s->cpuid, 0xc0000080, &efer) || !(efer & (1
> << 8)))
> +        goto fail;
> +
> +    s->os.w64 = 1;
> +
> +    /* get control registers for our os */
> +    ret = kdd_get_ctrl(s->guest, s->cpuid, &ctrl, s->os.w64);
> +    if (ret)
> +        goto fail;
> +
> +    /* read the div-by-zero handler function address */
> +    kdd_read_virtual(s, s->cpuid, ctrl.c64.idt_base + 8, 8, &buf);
> +    idt0_addr = ((uint64_t)buf << 32) & 0xffffffff00000000;
> +
> +    kdd_read_virtual(s, s->cpuid, ctrl.c64.idt_base, 8, &buf);
> +    idt0_addr |= ((buf >> 32) & 0xffff0000);
> +    idt0_addr |= (buf & 0xffff);
> +
> +    KDD_LOG(s, "idt0 addr: %p\n", (void *)idt0_addr);
> +
> +    /*
> +     * get the page start and look for "MZ" file header - we limit the
> search
> +     * in 1GB range above the current page base address
> +     */
> +
> +    base = idt0_addr & ~(PAGE_SIZE - 1);
> +    KDD_LOG(s, "%p\n", (void *)base);
> +
> +    while (search_limit) {
> +        uint16_t val;
> +        if (kdd_read_virtual(s, s->cpuid, base, 2, &val) != 2) {
> +            /* just move going back?? this is bad though */
> +            KDD_LOG(s, "ran into unmapped region without finding PE
> header\n");
> +            goto fail;
> +        }
> +
> +        if (val == MZ_HEADER) // MZ
> +            break;
> +
> +        base -= PAGE_SIZE;
> +        search_limit -= 1;
> +    }
> +
> +    KDD_LOG(s, "base: %p\n", (void *)base);
> +
> +    /* found the data section start */
> +    if (get_pe64_sections(s, base, ".data", &data_base, &data_size))
> +        goto fail;
> +
> +    /* look for addresses which has kernel base written into it */
> +    caddr = data_base;
> +
> +    search_limit = (1024 * 1024 * 512) / SIZE_PTR64;
> +    while (caddr < data_base + data_size && search_limit) {
> +        if (kdd_read_virtual(s, s->cpuid, caddr, SIZE_PTR64, &buf) !=
> +                SIZE_PTR64)
> +            goto fail;     /* reached end and found nothing */
> +
> +        /* if we found base in the memory addresses */
> +        if (buf == base) {
> +            /* read the DBGKD_GET_VERSION64 struct */
> +            dbgkd_addr = caddr - offsetof(DBGKD_GET_VERSION64, KernBase);
> +            if (kdd_read_virtual(s, s->cpuid, dbgkd_addr,
> +                        sizeof(DBGKD_GET_VERSION64),
> &dbgkd_get_version64) ==
> +                    sizeof(DBGKD_GET_VERSION64)) {
> +                /* check if major version is 0xf */
> +                if (dbgkd_get_version64.MajorVersion == NT_MAJOR_VERSION)
> {
> +
> +                    /* read minor version, PsLoadedModuleList pointer and
> +                     * DebuggerDataList
> +                     */
> +                    modptr = dbgkd_get_version64.PsLoadedModuleList;
> +                    kddl = dbgkd_get_version64.DebuggerDataList;
> +                    minor = dbgkd_get_version64.MinorVersion;
> +
> +                    /* do heuristic check */
> +                    if (modptr && kddl && modptr != kddl && kddl != base
> &&
> +                            base != modptr && modptr >= data_base &&
> +                            modptr < (data_base + data_size) &&
> +                            kddl >= data_base &&
> +                            kddl < (data_base + data_size))
> +                        break;
> +                }
> +            }
> +
> +        }
> +
> +        caddr += SIZE_PTR64;
> +        search_limit -= 1;
> +    }
> +
> +    if (caddr < data_base + data_size) {
> +        /* if found, set the field and return */
> +
> +        KDD_LOG(s, "base: %p\n", (void *)base);
> +        KDD_LOG(s, "modules list: %p\n", (void *)modptr);
> +        KDD_LOG(s, "kddl: %p\n", (void *)kddl);
> +        KDD_LOG(s, "minor version: 0x%hx\n", minor);
> +
> +        s->os.base = base;
> +        s->os.modules = modptr - base;
> +        s->os.kddl = kddl - base;
> +        s->os.build = (uint32_t) minor;
> +        return;
> +    }
> +
> +fail:
> +    s->os = unknown_os;
> +}
> +
>  /* Figure out what OS we're dealing with */
>  static void find_os(kdd_state *s)
>  {
>      int i;
> -    uint64_t limit;
> +    uint64_t limit;
>
>      /* We may already have the right one */
>      if (check_os(s))
> @@ -387,7 +725,8 @@ static void find_os(kdd_state *s)
>              if (check_os(s))
>                  return;
>      }
> -    s->os = unknown_os;
> +
> +    get_os_info_64(s);
>  }
>
>
> @@ -534,13 +873,14 @@ static void kdd_handle_handshake(kdd_state *s)
>  {
>      /* Figure out what we're looking at */
>      find_os(s);
> +
>      kdd_send_string(s, "[kdd: %s @0x%"PRIx64"]\r\n", s->os.name,
> s->os.base);
>
>      /* Respond with some details about the debugger stub we simulate */
>      s->txp.cmd.shake.u1        = 0x01010101;
>      s->txp.cmd.shake.status    = KDD_STATUS_SUCCESS;
>      s->txp.cmd.shake.u2        = 0x02020202;
> -    s->txp.cmd.shake.v_major   = 0xf;
> +    s->txp.cmd.shake.v_major   = NT_MAJOR_VERSION;
>      s->txp.cmd.shake.v_minor   = s->os.build;
>      s->txp.cmd.shake.proto     = 6;
>      s->txp.cmd.shake.flags     = (0x02 /* ??? */
> @@ -555,7 +895,7 @@ static void kdd_handle_handshake(kdd_state *s)
>      s->txp.cmd.shake.u3[2]     = 0x55;
>      s->txp.cmd.shake.kern_addr = s->os.base;
>      s->txp.cmd.shake.mods_addr = s->os.base + s->os.modules;
> -    s->txp.cmd.shake.data_addr = 0; /* Debugger data probably doesn't
> exist */
> +    s->txp.cmd.shake.data_addr = s->os.kddl ? s->os.base + s->os.kddl : 0;
>
>      KDD_LOG(s, "Client initial handshake: %s\n", s->os.name);
>      kdd_send_cmd(s, KDD_CMD_SHAKE, 0);
> --
> 2.17.1
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000007dffad05976db356
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">I a=
m not commenting on the code itself but the process.</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 14 Nov 2019, 07=
:59 Julian Tuminaro, &lt;<a href=3D"mailto:julian.tuminaro@gmail.com">julia=
n.tuminaro@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>From: Julian Tuminaro and Jenish Rakholiya &lt;<a href=3D"mailto:julian.tu=
minaro@gmail.com" target=3D"_blank" rel=3D"noreferrer">julian.tuminaro@gmai=
l.com</a> and <a href=3D"mailto:rakholiyajenish.07@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">rakholiyajenish.07@gmail.com</a>&gt;<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">AFAICT this is =
the first time we have such format for &quot;From&quot;.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">We =
usually have one person listed per tag and I think we should stick with it.=
</span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif"><br><=
/span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">Otherw=
ise this is possibly going</span>=C2=A0to break tools like <a href=3D"http:=
//get_maintainers.pl">get_maintainers.pl</a> that tends to also output the =
list of contributors (depending on the option) and stat tools.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Although, I am not entirely sure how=
 to encode 2 authors here. Maybe 2 From tag?</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
Current implementation of find_os is based on the hard-coded values for<br>
different Windows version. It uses the value for get the address to<br>
start looking for DOS header in the given specified range. However, this<br=
>
is not scalable to all version of Windows as it will require us to keep<br>
adding new entries and also due to KASLR, chances of not hitting the PE<br>
header is significant. We implement a way for 64-bit systems to use IDT<br>
entry to get a valid exception/interrupt handler and then move back into<br=
>
the memory to find the valid DOS header. Since IDT entries are protected<br=
>
by PatchGuard, we think our assumption that IDT entries will not be<br>
corrupted is valid for our purpose. Once we have the image base, we<br>
search for the DBGKD_GET_VERSION64 structure type in .data section to<br>
get information required for handshake.<br>
<br>
Currently, this is a work in progress feature and current patch only<br>
supports the handshake and memory read/write on 64-bit systems.<br>
<br>
NOTE: This is the Updated version of the previous patch submitted</blockquo=
te></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><div dir=
=3D"auto">This paragraph is not useful after committing. We tend to add the=
m after &quot;---&quot; so it get stripped by git am.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
NOTE: This has currently been only tested when debugging was not enabled<br=
>
on the guest Windows.</blockquote></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">This one is arguable, I think someone should have done the=
 testing in most of the configurations before committing. So it can be put =
after &quot;---&quot; to inform the reviewer the state if the patch.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"></div><div dir=3D"auto"></div><div dir=3D"auto=
"></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
Signed-off-by: Jenish Rakholiya &lt;<a href=3D"mailto:rjenish@cmu.edu" targ=
et=3D"_blank" rel=3D"noreferrer">rjenish@cmu.edu</a>&gt;<br>
Signed-off-by: Julian Tuminaro &lt;<a href=3D"mailto:jtuminar@andrew.cmu.ed=
u" target=3D"_blank" rel=3D"noreferrer">jtuminar@andrew.cmu.edu</a>&gt;<br>
---<br>
=C2=A0tools/debugger/kdd/kdd.c | 392 ++++++++++++++++++++++++++++++++++++--=
-<br>
=C2=A01 file changed, 366 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c<br>
index fb8c645355..6d3febefda 100644<br>
--- a/tools/debugger/kdd/kdd.c<br>
+++ b/tools/debugger/kdd/kdd.c<br>
@@ -41,6 +41,7 @@<br>
=C2=A0#include &lt;errno.h&gt;<br>
=C2=A0#include &lt;inttypes.h&gt;<br>
=C2=A0#include &lt;netdb.h&gt;<br>
+#include &lt;stddef.h&gt;<br>
<br>
=C2=A0#include &lt;sys/socket.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
@@ -51,6 +52,16 @@<br>
<br>
=C2=A0#include &quot;kdd.h&quot;<br>
<br>
+/*<br>
+ * TODO: kdd_os is a type which is used to represent os array. Adding a<br=
>
+ * variable here would result in adding a new field to each element in arr=
ay.<br>
+ * However, since most of the fields are part of the same struct that we a=
re<br>
+ * trying to read from memory, we have added kddl to this structure. If<br=
>
+ * required, we can possibly separate the kddl value to someplace else<br>
+ *<br>
+ * We also use kddl of size uint32_t which is actually used to represent t=
he<br>
+ * offset from image base rather than actual address<br>
+ */<br>
=C2=A0/* Windows version details */<br>
=C2=A0typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t build;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>
@@ -62,6 +73,7 @@ typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t version;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* +-&gt; NtBuildNumber */<br>
=C2=A0 =C2=A0 =C2=A0uint32_t modules;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* +-&gt; PsLoadedModuleList */<br>
=C2=A0 =C2=A0 =C2=A0uint32_t prcbs;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* +-&gt; KiProcessorBlock */<br>
+=C2=A0 =C2=A0 uint32_t kddl;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* +-&gt; KdDebuggerList */<br>
=C2=A0} kdd_os;<br>
<br>
=C2=A0/* State of the debugger stub */<br>
@@ -85,6 +97,117 @@ typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0kdd_os os;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 OS-specific magic numbers */<br>
=C2=A0} kdd_state;<br>
<br>
+/**<br>
+ * @brief Structure to represent DBGKD_GET_VERSION64<br>
+ *<br>
+ * reference: <a href=3D"https://docs.microsoft.com/en-us/windows-hardware=
/drivers/ddi/wdbgexts/ns-wdbgexts-_dbgkd_get_version64" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://docs.microsoft.com/en-us/windows-hardw=
are/drivers/ddi/wdbgexts/ns-wdbgexts-_dbgkd_get_version64</a><br>
+ */<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 uint16_t MajorVersion;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* usually 0xf for free build */<br>
+=C2=A0 =C2=A0 uint16_t MinorVersion;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* build number of target OS */<br>
+=C2=A0 =C2=A0 uint8_t ProtocolVersion;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* version of the debugger protocol */<br>
+=C2=A0 =C2=A0 uint8_t KdSecondaryVersion;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* secondary version number */<br>
+=C2=A0 =C2=A0 uint16_t Flags;=C2=A0 =C2=A0 /* set of bit flags for the cur=
rent debugging session */<br>
+=C2=A0 =C2=A0 uint16_t MachineType;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* type of the target&#39;s processor */<br>
+=C2=A0 =C2=A0 uint8_t MaxPacketType;=C2=A0 =C2=A0 =C2=A0/* one plus the hi=
ghest number for a debugger */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* packet type r=
ecognized by the target */<br>
+=C2=A0 =C2=A0 uint8_t MaxStateChagne;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* one plu=
s the highest number for a state */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* change generated by the target */<br>
+=C2=A0 =C2=A0 uint8_t MaxManipulate;=C2=A0 =C2=A0/* one more that the high=
est number, recognized */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* b=
y the target, for a command to manipulate the target */<br>
+=C2=A0 =C2=A0 uint8_t Simulation;=C2=A0 =C2=A0 /* indication if target is =
in simulated execution */<br>
+=C2=A0 =C2=A0 uint16_t Unused[1];<br>
+=C2=A0 =C2=A0 uint64_t KernBase;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* base address of the kernel image */<br>
+=C2=A0 =C2=A0 uint64_t PsLoadedModuleList;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* value of the kernel variable */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* PsLoadedModuleList */<br=
>
+=C2=A0 =C2=A0 uint64_t DebuggerDataList;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0/* value of the kernel variable */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* KdDebuggerDataBlock */<br>
+} PACKED DBGKD_GET_VERSION64;<br>
+<br>
+/**<br>
+ * @brief Structure to represent the section in PE headers<br>
+ *<br>
+ * reference: <a href=3D"https://docs.microsoft.com/en-us/windows/win32/de=
bug/pe-format#section-table-section-headers" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://docs.microsoft.com/en-us/windows/win32/debug/pe-f=
ormat#section-table-section-headers</a><br>
+ */<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 uint8_t Name[8];=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* name of section */<br>
+=C2=A0 =C2=A0 uint32_t VirtualSize;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* total size of section in memory */<br>
+=C2=A0 =C2=A0 uint32_t VirtualAddr;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* offset from image base */<br>
+=C2=A0 =C2=A0 uint32_t SizeOfRawData;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
size of section in for object files */<br>
+=C2=A0 =C2=A0 uint32_t PointerToRawData;=C2=A0 =C2=A0 =C2=A0 /* file point=
er to first page in COFF */<br>
+=C2=A0 =C2=A0 uint32_t PointerToRelocations;=C2=A0 /* file pointer to begi=
nning of relocation entry */<br>
+=C2=A0 =C2=A0 uint32_t PointerToLinenumbers;=C2=A0 /* file pointer to the =
beginning of line-number entries */<br>
+=C2=A0 =C2=A0 uint16_t NumberOfRelocations;=C2=A0 =C2=A0/* number of reloc=
ation entries for the section */<br>
+=C2=A0 =C2=A0 uint16_t NumberOfLinenumbers;=C2=A0 =C2=A0/* number of line-=
number entries for the section */<br>
+=C2=A0 =C2=A0 uint32_t Characteristics;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* flags=
 that describe the characteristics of the section */<br>
+} PACKED PE_SECTION_ENTRY;<br>
+<br>
+/**<br>
+ * @brief Size of pointer on 64 machine<br>
+ */<br>
+#define SIZE_PTR64 8<br>
+<br>
+/**<br>
+ * @brief Size of pointer on 32 machine<br>
+ */<br>
+#define SIZE_PTR32 4<br>
+<br>
+<br>
+/*************************************************************************=
****<br>
+ * PE and DOS Header related offsets<br>
+ */<br>
+<br>
+/**<br>
+ * @brief Offset in DOS header to look for PE header<br>
+ */<br>
+#define DOS_HDR_PE_OFF 0x3c<br>
+<br>
+/**<br>
+ * @brief Size of PE header offset field in DOS header<br>
+ */<br>
+#define DOS_HDR_PE_SZ 4<br>
+<br>
+/**<br>
+ * @brief Offset of number of sections field in PE header<br>
+ */<br>
+#define PE_NUM_SECTION_OFF 0x6<br>
+<br>
+/**<br>
+ * @brief Size of number of sections field in PE header<br>
+ */<br>
+#define PE_NUM_SECTION_SZ 2<br>
+<br>
+/**<br>
+ * @brief Offset of optional header size field in PE header<br>
+ */<br>
+#define PE_OPT_HDR_SZ_OFF 0x14<br>
+<br>
+/**<br>
+ * @brief Size of optional header size field in PE header<br>
+ */<br>
+#define PE_OPT_HDR_SZ_SZ 2<br>
+<br>
+/**<br>
+ * @brief Size of PE header<br>
+ */<br>
+#define PE_HDR_SZ 0x18<br>
+<br>
+/**<br>
+ * @brief MZ header<br>
+ */<br>
+#define MZ_HEADER 0x5a4d<br>
+<br>
+/**<br>
+ * @brief Limit on the number of sections to look for while iterating thro=
ugh<br>
+ * PE sections<br>
+ */<br>
+#define NUM_SECT_LIMIT 100<br>
+<br>
+/**<br>
+ * @brief Major Version for the DBGKD_GET_VERSION64 structure<br>
+ */<br>
+#define NT_MAJOR_VERSION 0xf<br>
+<br>
=C2=A0/********************************************************************=
*********<br>
=C2=A0 *=C2=A0 Utility functions<br>
=C2=A0 */<br>
@@ -293,41 +416,41 @@ static uint32_t kdd_write_virtual(kdd_state *s, int c=
puid, uint64_t addr,<br>
=C2=A0 */<br>
<br>
=C2=A0static kdd_os os[] =3D {<br>
- /* Build=C2=A0 64 MP Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;Kernel search base=C2=A0 =C2=A0 Range=C2=A0 =C2=A0 =C2=
=A0 =C2=A0+Version=C2=A0 =C2=A0 +Modules=C2=A0 =C2=A0 +PRCBs (64b) */<br>
-=C2=A0 =C2=A0 {2195, 0, 0, &quot;w2k sp4 x32 UP&quot;,=C2=A0 =C2=A0 0xffff=
ffff80400000ULL, 0x00000000, 0x0006d57c, 0x0006e1b8, 0x0},<br>
-=C2=A0 =C2=A0 {2195, 0, 1, &quot;w2k sp4 x32 SMP&quot;,=C2=A0 =C2=A00xffff=
ffff80400000ULL, 0x00000000, 0x0006fa1c, 0x00084520, 0x0},<br>
+ /* Build=C2=A0 64 MP Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&amp;Kernel search base=C2=A0 =C2=A0 Range=C2=A0 =C2=A0 =C2=
=A0 =C2=A0+Version=C2=A0 =C2=A0 +Modules=C2=A0 =C2=A0 +PRCBs (64b)=C2=A0 +K=
DDL */<br>
+=C2=A0 =C2=A0 {2195, 0, 0, &quot;w2k sp4 x32 UP&quot;,=C2=A0 =C2=A0 0xffff=
ffff80400000ULL, 0x00000000, 0x0006d57c, 0x0006e1b8, 0x0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0},<br>
+=C2=A0 =C2=A0 {2195, 0, 1, &quot;w2k sp4 x32 SMP&quot;,=C2=A0 =C2=A00xffff=
ffff80400000ULL, 0x00000000, 0x0006fa1c, 0x00084520, 0x0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0},<br>
=C2=A0 =C2=A0 =C2=A0// PAE/UP, PAE/SMP<br>
<br>
-=C2=A0 =C2=A0 {2600, 0, 0, &quot;xp sp2 x32 UP&quot;,=C2=A0 =C2=A0 =C2=A00=
xffffffff804d7000ULL, 0x00000000, 0x00075568, 0x00083b20, 0x0},<br>
-=C2=A0 =C2=A0 {2600, 0, 1, &quot;xp sp2 x32 SMP&quot;,=C2=A0 =C2=A0 0xffff=
ffff804d7000ULL, 0x00000000, 0x0007d0e8, 0x0008d4a0, 0x0},<br>
+=C2=A0 =C2=A0 {2600, 0, 0, &quot;xp sp2 x32 UP&quot;,=C2=A0 =C2=A0 =C2=A00=
xffffffff804d7000ULL, 0x00000000, 0x00075568, 0x00083b20, 0x0,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0},<br>
+=C2=A0 =C2=A0 {2600, 0, 1, &quot;xp sp2 x32 SMP&quot;,=C2=A0 =C2=A0 0xffff=
ffff804d7000ULL, 0x00000000, 0x0007d0e8, 0x0008d4a0, 0x0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0},<br>
=C2=A0 =C2=A0 =C2=A0// PAE/UP, PAE/SMP<br>
<br>
-=C2=A0 =C2=A0 {2600, 0, 0, &quot;xp sp3 x32 UP&quot;,=C2=A0 =C2=A0 =C2=A00=
xffffffff804d7000ULL, 0x00000000, 0x00075be8, 0x000841c0, 0x0},<br>
-=C2=A0 =C2=A0 {2600, 0, 1, &quot;xp sp3 x32 SMP&quot;,=C2=A0 =C2=A0 0xffff=
ffff804d7000ULL, 0x00000000, 0x0007c0e8, 0x0008c4c0, 0x0},<br>
-=C2=A0 =C2=A0 {2600, 0, 0, &quot;xp sp3 x32p UP&quot;,=C2=A0 =C2=A0 0xffff=
ffff804d7000ULL, 0x00000000, 0x0006e8e8, 0x0007cfc0, 0x0},<br>
-=C2=A0 =C2=A0 {2600, 0, 1, &quot;xp sp3 x32p SMP&quot;,=C2=A0 =C2=A00xffff=
ffff804d7000ULL, 0x00000000, 0x000760e8, 0x00086720, 0x0},<br>
+=C2=A0 =C2=A0 {2600, 0, 0, &quot;xp sp3 x32 UP&quot;,=C2=A0 =C2=A0 =C2=A00=
xffffffff804d7000ULL, 0x00000000, 0x00075be8, 0x000841c0, 0x0,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0},<br>
+=C2=A0 =C2=A0 {2600, 0, 1, &quot;xp sp3 x32 SMP&quot;,=C2=A0 =C2=A0 0xffff=
ffff804d7000ULL, 0x00000000, 0x0007c0e8, 0x0008c4c0, 0x0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0},<br>
+=C2=A0 =C2=A0 {2600, 0, 0, &quot;xp sp3 x32p UP&quot;,=C2=A0 =C2=A0 0xffff=
ffff804d7000ULL, 0x00000000, 0x0006e8e8, 0x0007cfc0, 0x0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0},<br>
+=C2=A0 =C2=A0 {2600, 0, 1, &quot;xp sp3 x32p SMP&quot;,=C2=A0 =C2=A00xffff=
ffff804d7000ULL, 0x00000000, 0x000760e8, 0x00086720, 0x0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0},<br>
<br>
-=C2=A0 =C2=A0 {3790, 0, 0, &quot;w2k3 sp2 x32 UP&quot;,=C2=A0 =C2=A00xffff=
ffff80800000ULL, 0x00000000, 0x00097128, 0x000a8e48, 0x0},<br>
-=C2=A0 =C2=A0 {3790, 0, 1, &quot;w2k3 sp2 x32 SMP&quot;,=C2=A0 0xffffffff8=
0800000ULL, 0x00000000, 0x0009d128, 0x000af9c8, 0x0},<br>
-=C2=A0 =C2=A0 {3790, 0, 0, &quot;w2k3 sp2 x32p UP&quot;,=C2=A0 0xffffffff8=
0800000ULL, 0x00000000, 0x0008e128, 0x0009ffa8, 0x0},<br>
-=C2=A0 =C2=A0 {3790, 0, 1, &quot;w2k3 sp2 x32p SMP&quot;, 0xffffffff808000=
00ULL, 0x00000000, 0x00094128, 0x000a6ea8, 0x0},<br>
-=C2=A0 =C2=A0 {3790, 1, 0, &quot;w2k3 sp2 x64 UP&quot;,=C2=A0 =C2=A00xffff=
f80001000000ULL, 0x00000000, 0x001765d0, 0x0019aae0, 0x0017b100},<br>
-=C2=A0 =C2=A0 {3790, 1, 1, &quot;w2k3 sp2 x64 SMP&quot;,=C2=A0 0xfffff8000=
1000000ULL, 0x00000000, 0x001b05e0, 0x001d5100, 0x001b5300},<br>
+=C2=A0 =C2=A0 {3790, 0, 0, &quot;w2k3 sp2 x32 UP&quot;,=C2=A0 =C2=A00xffff=
ffff80800000ULL, 0x00000000, 0x00097128, 0x000a8e48, 0x0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0},<br>
+=C2=A0 =C2=A0 {3790, 0, 1, &quot;w2k3 sp2 x32 SMP&quot;,=C2=A0 0xffffffff8=
0800000ULL, 0x00000000, 0x0009d128, 0x000af9c8, 0x0,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0},<br>
+=C2=A0 =C2=A0 {3790, 0, 0, &quot;w2k3 sp2 x32p UP&quot;,=C2=A0 0xffffffff8=
0800000ULL, 0x00000000, 0x0008e128, 0x0009ffa8, 0x0,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0},<br>
+=C2=A0 =C2=A0 {3790, 0, 1, &quot;w2k3 sp2 x32p SMP&quot;, 0xffffffff808000=
00ULL, 0x00000000, 0x00094128, 0x000a6ea8, 0x0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0},<br>
+=C2=A0 =C2=A0 {3790, 1, 0, &quot;w2k3 sp2 x64 UP&quot;,=C2=A0 =C2=A00xffff=
f80001000000ULL, 0x00000000, 0x001765d0, 0x0019aae0, 0x0017b100,=C2=A0 =C2=
=A00},<br>
+=C2=A0 =C2=A0 {3790, 1, 1, &quot;w2k3 sp2 x64 SMP&quot;,=C2=A0 0xfffff8000=
1000000ULL, 0x00000000, 0x001b05e0, 0x001d5100, 0x001b5300,=C2=A0 =C2=A00},=
<br>
<br>
-=C2=A0 =C2=A0 {6000, 0, 1, &quot;vista sp0 x32p&quot;,=C2=A0 =C2=A0 0xffff=
ffff81800000ULL, 0x00000000, 0x000a4de4, 0x00111db0, 0x0},<br>
-=C2=A0 =C2=A0 {6001, 0, 1, &quot;vista sp1 x32p&quot;,=C2=A0 =C2=A0 0xffff=
ffff81000000ULL, 0x0f000000, 0x000af0c4, 0x00117c70, 0x0},<br>
+=C2=A0 =C2=A0 {6000, 0, 1, &quot;vista sp0 x32p&quot;,=C2=A0 =C2=A0 0xffff=
ffff81800000ULL, 0x00000000, 0x000a4de4, 0x00111db0, 0x0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0},<br>
+=C2=A0 =C2=A0 {6001, 0, 1, &quot;vista sp1 x32p&quot;,=C2=A0 =C2=A0 0xffff=
ffff81000000ULL, 0x0f000000, 0x000af0c4, 0x00117c70, 0x0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0},<br>
<br>
-=C2=A0 =C2=A0 {6001, 1, 1, &quot;w2k8 sp0 x64&quot;,=C2=A0 =C2=A0 =C2=A0 0=
xfffff80001000000ULL, 0x0f000000, 0x00140bf0, 0x001c5db0, 0x00229640},<br>
+=C2=A0 =C2=A0 {6001, 1, 1, &quot;w2k8 sp0 x64&quot;,=C2=A0 =C2=A0 =C2=A0 0=
xfffff80001000000ULL, 0x0f000000, 0x00140bf0, 0x001c5db0, 0x00229640,=C2=A0=
 =C2=A00},<br>
<br>
-=C2=A0 =C2=A0 {7600, 1, 1, &quot;win7 sp0 x64&quot;,=C2=A0 =C2=A0 =C2=A0 0=
xfffff80001000000ULL, 0x0f000000, 0x001af770, 0x0023de50, 0x002a8900},<br>
+=C2=A0 =C2=A0 {7600, 1, 1, &quot;win7 sp0 x64&quot;,=C2=A0 =C2=A0 =C2=A0 0=
xfffff80001000000ULL, 0x0f000000, 0x001af770, 0x0023de50, 0x002a8900,=C2=A0=
 =C2=A00},<br>
<br>
-=C2=A0 =C2=A0 {7601, 0, 1, &quot;win7 sp1 x32p&quot;,=C2=A0 =C2=A0 =C2=A00=
xffffffff81800000ULL, 0x0f000000, 0x000524c4, 0x00149850, 0x0},<br>
-=C2=A0 =C2=A0 {7601, 1, 1, &quot;win7 sp1 x64&quot;,=C2=A0 =C2=A0 =C2=A0 0=
xfffff80001000000ULL, 0x0f000000, 0x001b2770, 0x00240e90, 0x002ab900},<br>
+=C2=A0 =C2=A0 {7601, 0, 1, &quot;win7 sp1 x32p&quot;,=C2=A0 =C2=A0 =C2=A00=
xffffffff81800000ULL, 0x0f000000, 0x000524c4, 0x00149850, 0x0,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0},<br>
+=C2=A0 =C2=A0 {7601, 1, 1, &quot;win7 sp1 x64&quot;,=C2=A0 =C2=A0 =C2=A0 0=
xfffff80001000000ULL, 0x0f000000, 0x001b2770, 0x00240e90, 0x002ab900,=C2=A0=
 =C2=A00},<br>
=C2=A0};<br>
<br>
=C2=A0// 1381, 0, 0, &quot;NT4 sp?&quot;, 0xffffffff80100000, ?, ?<br>
<br>
-static kdd_os unknown_os =3D {0, 0, 0, &quot;unknown OS&quot;, 0, 0, 0, 0,=
 0};<br>
+static kdd_os unknown_os =3D {0, 0, 0, &quot;unknown OS&quot;, 0, 0, 0, 0,=
 0, 0};<br>
<br>
=C2=A0static int check_os(kdd_state *s)<br>
=C2=A0{<br>
@@ -367,11 +490,226 @@ static int check_os(kdd_state *s)<br>
=C2=A0 =C2=A0 =C2=A0return 1;<br>
=C2=A0}<br>
<br>
+/**<br>
+ * @brief Parse the memory at \a filebase as a valid DOS header and get vi=
rtual<br>
+ * address offset and size for any given section name (if it exists)<br>
+ *<br>
+ * @param s Pointer to the kdd_state structure<br>
+ * @param filebase Base address of the file structure<br>
+ * @param sectname Pointer to the section name c-string to look for<br>
+ * @param vaddr Pointer to write the virtual address of section start to<b=
r>
+ * (if found)<br>
+ * @param visze Pointer to write the section size to (if found)<br>
+ *<br>
+ * @return -1 on failure to find the section name<br>
+ * @return 0 on success<br>
+ */<br>
+static int get_pe64_sections(kdd_state *s, uint64_t filebase, char *sectna=
me,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t *vaddr, uint32_t *vsize)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t pe_hdr =3D 0;<br>
+=C2=A0 =C2=A0 uint64_t sect_start =3D 0;<br>
+=C2=A0 =C2=A0 uint16_t num_sections =3D 0;<br>
+=C2=A0 =C2=A0 uint16_t opt_hdr_sz =3D 0;<br>
+=C2=A0 =C2=A0 PE_SECTION_ENTRY pe_sect;<br>
+<br>
+=C2=A0 =C2=A0 if (!s-&gt;os.w64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+<br>
+=C2=A0 =C2=A0 /* read PE header offset */<br>
+=C2=A0 =C2=A0 if (kdd_read_virtual(s, s-&gt;cpuid, filebase + DOS_HDR_PE_O=
FF, DOS_HDR_PE_SZ,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pe_hdr) !=3D =
DOS_HDR_PE_SZ)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+<br>
+=C2=A0 =C2=A0 pe_hdr +=3D filebase;<br>
+<br>
+=C2=A0 =C2=A0 /* read number of sections */<br>
+=C2=A0 =C2=A0 if (kdd_read_virtual(s, s-&gt;cpuid, pe_hdr + PE_NUM_SECTION=
_OFF,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PE_NUM_SECTION_SZ,=
 &amp;num_sections) !=3D PE_NUM_SECTION_SZ)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+<br>
+=C2=A0 =C2=A0 /* read number of section upto a limit */<br>
+=C2=A0 =C2=A0 if (num_sections &gt; NUM_SECT_LIMIT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 num_sections =3D NUM_SECT_LIMIT;<br>
+<br>
+=C2=A0 =C2=A0 /* read size of optional header */<br>
+=C2=A0 =C2=A0 if (kdd_read_virtual(s, s-&gt;cpuid, pe_hdr + PE_OPT_HDR_SZ_=
OFF,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PE_OPT_HDR_SZ_SZ, =
&amp;opt_hdr_sz) !=3D PE_OPT_HDR_SZ_SZ)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+<br>
+=C2=A0 =C2=A0 /* 0x18 is the size of PE header */<br>
+=C2=A0 =C2=A0 sect_start =3D pe_hdr + PE_HDR_SZ + opt_hdr_sz;<br>
+<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; num_sections; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (kdd_read_virtual(s, s-&gt;cpuid, sect_star=
t + (i * sizeof(pe_sect)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=
of(pe_sect), &amp;pe_sect) !=3D sizeof(pe_sect))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strncmp(sectname, (char *)pe_sect.Name, s=
izeof(pe_sect.Name))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *vaddr =3D filebase + pe_sect.Vi=
rtualAddr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *vsize =3D pe_sect.VirtualSize;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return -1;<br>
+}<br>
+<br>
+/**<br>
+ * @brief Get the OS information like base address, minor version,<br>
+ * PsLoadedModuleList and DebuggerDataList (basically the fields of<br>
+ * DBGKD_GET_VERSION64 struture required to do handshake?).<br>
+ *<br>
+ * This is done by reading the IDT entry for divide-by-zero exception and<=
br>
+ * searching back into the memory for DOS header (which is our kernel base=
).<br>
+ * Once we have the kernel base, we parse the PE header and look for kerne=
l<br>
+ * base address in the .data section. Once we have possible values, we loo=
k for<br>
+ * DBGKD_GET_VERSION64 block by using following heuristics on the address =
which<br>
+ * has the kernel base:<br>
+ *<br>
+ *=C2=A0 - at address [-0x10], it should have 0xf as the MajorVersion<br>
+ *=C2=A0 - at address [+0x8], it should have a valid kernel memory address=
 pointing<br>
+ *=C2=A0 in .data<br>
+ *=C2=A0 - at address [+0x10], it should have a valid kernel memory addres=
s pointing<br>
+ *=C2=A0 in .data<br>
+ *<br>
+ * @param s Pointer to the kdd state<br>
+ */<br>
+static void get_os_info_64(kdd_state *s)<br>
+{<br>
+=C2=A0 =C2=A0 kdd_ctrl ctrl;<br>
+=C2=A0 =C2=A0 int ret;<br>
+=C2=A0 =C2=A0 uint64_t buf;<br>
+=C2=A0 =C2=A0 uint64_t idt0_addr;<br>
+=C2=A0 =C2=A0 uint64_t base;<br>
+=C2=A0 =C2=A0 uint64_t caddr;<br>
+=C2=A0 =C2=A0 uint64_t data_base;<br>
+=C2=A0 =C2=A0 uint32_t data_size;<br>
+=C2=A0 =C2=A0 uint64_t modptr =3D 0;<br>
+=C2=A0 =C2=A0 uint64_t kddl =3D 0;<br>
+=C2=A0 =C2=A0 uint16_t minor =3D 0;<br>
+=C2=A0 =C2=A0 uint64_t dbgkd_addr;<br>
+=C2=A0 =C2=A0 DBGKD_GET_VERSION64 dbgkd_get_version64;<br>
+=C2=A0 =C2=A0 /* Maybe 1GB is too big for the limit to search? */<br>
+=C2=A0 =C2=A0 uint32_t search_limit =3D (1024 * 1024 * 1024) / PAGE_SIZE; =
/*1GB/PageSize*/<br>
+=C2=A0 =C2=A0 uint64_t efer;<br>
+<br>
+=C2=A0 =C2=A0 /* if we are not in 64-bit mode, fail */<br>
+=C2=A0 =C2=A0 if (kdd_rdmsr(s-&gt;guest, s-&gt;cpuid, 0xc0000080, &amp;efe=
r) || !(efer &amp; (1 &lt;&lt; 8)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;os.w64 =3D 1;<br>
+<br>
+=C2=A0 =C2=A0 /* get control registers for our os */<br>
+=C2=A0 =C2=A0 ret =3D kdd_get_ctrl(s-&gt;guest, s-&gt;cpuid, &amp;ctrl, s-=
&gt;os.w64);<br>
+=C2=A0 =C2=A0 if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+<br>
+=C2=A0 =C2=A0 /* read the div-by-zero handler function address */<br>
+=C2=A0 =C2=A0 kdd_read_virtual(s, s-&gt;cpuid, ctrl.c64.idt_base + 8, 8, &=
amp;buf);<br>
+=C2=A0 =C2=A0 idt0_addr =3D ((uint64_t)buf &lt;&lt; 32) &amp; 0xffffffff00=
000000;<br>
+<br>
+=C2=A0 =C2=A0 kdd_read_virtual(s, s-&gt;cpuid, ctrl.c64.idt_base, 8, &amp;=
buf);<br>
+=C2=A0 =C2=A0 idt0_addr |=3D ((buf &gt;&gt; 32) &amp; 0xffff0000);<br>
+=C2=A0 =C2=A0 idt0_addr |=3D (buf &amp; 0xffff);<br>
+<br>
+=C2=A0 =C2=A0 KDD_LOG(s, &quot;idt0 addr: %p\n&quot;, (void *)idt0_addr);<=
br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* get the page start and look for &quot;MZ&quot; file =
header - we limit the search<br>
+=C2=A0 =C2=A0 =C2=A0* in 1GB range above the current page base address<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+<br>
+=C2=A0 =C2=A0 base =3D idt0_addr &amp; ~(PAGE_SIZE - 1);<br>
+=C2=A0 =C2=A0 KDD_LOG(s, &quot;%p\n&quot;, (void *)base);<br>
+<br>
+=C2=A0 =C2=A0 while (search_limit) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (kdd_read_virtual(s, s-&gt;cpuid, base, 2, =
&amp;val) !=3D 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* just move going back?? this i=
s bad though */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KDD_LOG(s, &quot;ran into unmapp=
ed region without finding PE header\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val =3D=3D MZ_HEADER) // MZ<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 base -=3D PAGE_SIZE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 search_limit -=3D 1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 KDD_LOG(s, &quot;base: %p\n&quot;, (void *)base);<br>
+<br>
+=C2=A0 =C2=A0 /* found the data section start */<br>
+=C2=A0 =C2=A0 if (get_pe64_sections(s, base, &quot;.data&quot;, &amp;data_=
base, &amp;data_size))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+<br>
+=C2=A0 =C2=A0 /* look for addresses which has kernel base written into it =
*/<br>
+=C2=A0 =C2=A0 caddr =3D data_base;<br>
+<br>
+=C2=A0 =C2=A0 search_limit =3D (1024 * 1024 * 512) / SIZE_PTR64;<br>
+=C2=A0 =C2=A0 while (caddr &lt; data_base + data_size &amp;&amp; search_li=
mit) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (kdd_read_virtual(s, s-&gt;cpuid, caddr, SI=
ZE_PTR64, &amp;buf) !=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SIZE_PTR64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;=C2=A0 =C2=A0 =C2=A0/*=
 reached end and found nothing */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if we found base in the memory addresses */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buf =3D=3D base) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* read the DBGKD_GET_VERSION64 =
struct */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgkd_addr =3D caddr - offsetof(=
DBGKD_GET_VERSION64, KernBase);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (kdd_read_virtual(s, s-&gt;cp=
uid, dbgkd_addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sizeof(DBGKD_GET_VERSION64), &amp;dbgkd_get_version64) =3D=3D<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size=
of(DBGKD_GET_VERSION64)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* check if major =
version is 0xf */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dbgkd_get_vers=
ion64.MajorVersion =3D=3D NT_MAJOR_VERSION) {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* r=
ead minor version, PsLoadedModuleList pointer and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0* DebuggerDataList<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 modp=
tr =3D dbgkd_get_version64.PsLoadedModuleList;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kddl=
 =3D dbgkd_get_version64.DebuggerDataList;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mino=
r =3D dbgkd_get_version64.MinorVersion;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* d=
o heuristic check */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
modptr &amp;&amp; kddl &amp;&amp; modptr !=3D kddl &amp;&amp; kddl !=3D bas=
e &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 base !=3D modptr &amp;&amp; modptr &gt;=3D data_ba=
se &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 modptr &lt; (data_base + data_size) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 kddl &gt;=3D data_base &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 kddl &lt; (data_base + data_size))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 caddr +=3D SIZE_PTR64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 search_limit -=3D 1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (caddr &lt; data_base + data_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if found, set the field and return */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 KDD_LOG(s, &quot;base: %p\n&quot;, (void *)bas=
e);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 KDD_LOG(s, &quot;modules list: %p\n&quot;, (vo=
id *)modptr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 KDD_LOG(s, &quot;kddl: %p\n&quot;, (void *)kdd=
l);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 KDD_LOG(s, &quot;minor version: 0x%hx\n&quot;,=
 minor);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;os.base =3D base;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;os.modules =3D modptr - base;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;os.kddl =3D kddl - base;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;os.build =3D (uint32_t) minor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+fail:<br>
+=C2=A0 =C2=A0 s-&gt;os =3D unknown_os;<br>
+}<br>
+<br>
=C2=A0/* Figure out what OS we&#39;re dealing with */<br>
=C2=A0static void find_os(kdd_state *s)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
-=C2=A0 =C2=A0 uint64_t limit; <br>
+=C2=A0 =C2=A0 uint64_t limit;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* We may already have the right one */<br>
=C2=A0 =C2=A0 =C2=A0if (check_os(s))<br>
@@ -387,7 +725,8 @@ static void find_os(kdd_state *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (check_os(s))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 s-&gt;os =3D unknown_os;<br>
+<br>
+=C2=A0 =C2=A0 get_os_info_64(s);<br>
=C2=A0}<br>
<br>
<br>
@@ -534,13 +873,14 @@ static void kdd_handle_handshake(kdd_state *s)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* Figure out what we&#39;re looking at */<br>
=C2=A0 =C2=A0 =C2=A0find_os(s);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0kdd_send_string(s, &quot;[kdd: %s @0x%&quot;PRIx64&quot=
;]\r\n&quot;, s-&gt;<a href=3D"http://os.name" rel=3D"noreferrer noreferrer=
" target=3D"_blank">os.name</a>, s-&gt;os.base);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Respond with some details about the debugger stub we=
 simulate */<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;txp.cmd.shake.u1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0=
x01010101;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;txp.cmd.shake.status=C2=A0 =C2=A0 =3D KDD_STATUS_=
SUCCESS;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;txp.cmd.shake.u2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0=
x02020202;<br>
-=C2=A0 =C2=A0 s-&gt;txp.cmd.shake.v_major=C2=A0 =C2=A0=3D 0xf;<br>
+=C2=A0 =C2=A0 s-&gt;txp.cmd.shake.v_major=C2=A0 =C2=A0=3D NT_MAJOR_VERSION=
;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;txp.cmd.shake.v_minor=C2=A0 =C2=A0=3D s-&gt;os.bu=
ild;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;txp.cmd.shake.proto=C2=A0 =C2=A0 =C2=A0=3D 6;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;txp.cmd.shake.flags=C2=A0 =C2=A0 =C2=A0=3D (0x02 =
/* ??? */<br>
@@ -555,7 +895,7 @@ static void kdd_handle_handshake(kdd_state *s)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;txp.cmd.shake.u3[2]=C2=A0 =C2=A0 =C2=A0=3D 0x55;<=
br>
=C2=A0 =C2=A0 =C2=A0s-&gt;txp.cmd.shake.kern_addr =3D s-&gt;os.base;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;txp.cmd.shake.mods_addr =3D s-&gt;os.base + s-&gt=
;os.modules;<br>
-=C2=A0 =C2=A0 s-&gt;txp.cmd.shake.data_addr =3D 0; /* Debugger data probab=
ly doesn&#39;t exist */<br>
+=C2=A0 =C2=A0 s-&gt;txp.cmd.shake.data_addr =3D s-&gt;os.kddl ? s-&gt;os.b=
ase + s-&gt;os.kddl : 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0KDD_LOG(s, &quot;Client initial handshake: %s\n&quot;, =
s-&gt;<a href=3D"http://os.name" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">os.name</a>);<br>
=C2=A0 =C2=A0 =C2=A0kdd_send_cmd(s, KDD_CMD_SHAKE, 0);<br>
-- <br>
2.17.1<br>
<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank" rel=3D"=
noreferrer">Xen-devel@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.xenproject.org/mailm=
an/listinfo/xen-devel</a></blockquote></div></div></div>

--0000000000007dffad05976db356--


--===============9005328900347569389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9005328900347569389==--

