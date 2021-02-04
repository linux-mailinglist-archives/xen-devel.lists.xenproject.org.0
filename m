Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D576830F680
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 16:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81351.150213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7gip-0007dJ-U6; Thu, 04 Feb 2021 15:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81351.150213; Thu, 04 Feb 2021 15:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7gip-0007cu-Qq; Thu, 04 Feb 2021 15:39:07 +0000
Received: by outflank-mailman (input) for mailman id 81351;
 Thu, 04 Feb 2021 15:39:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gi2U=HG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l7gio-0007cp-3c
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:39:06 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70e6e63b-5451-4866-9868-0bb571b55a35;
 Thu, 04 Feb 2021 15:39:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q7so3974661wre.13
 for <xen-devel@lists.xenproject.org>; Thu, 04 Feb 2021 07:39:01 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id f14sm6645819wmj.30.2021.02.04.07.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 07:39:00 -0800 (PST)
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
X-Inumbo-ID: 70e6e63b-5451-4866-9868-0bb571b55a35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=V//P/BTJwE4NM4HkK8XBmiRM5OYYsUkZOzMEeyQomXs=;
        b=Ln5qJ3MJ5Vrh56VQksMixEDY7RD2HgK8CavR3gxo2pncXMQ1E614BQyxk15KTY0lid
         L31W9hJFbMn72n4ivj3L6i4qKAJ+HMvSEqbIaCPFOW0jo9cWk3rnIFtLym6oGItU0mVV
         1yz8oj+bMPLBi70NKS/KijdZdXg2rQiZ28Esp0a7ffmnqVZEk7TK52Skud52YUJdNYbd
         wKtNo/Uu4wk2VYS6btv9v5WQePOle+UCmPaORJwUveYG4/d36DhQn5li/PNM/qB6gnU5
         vwdsYFJYidcot/4KhCVw8Fn7hXUpENpOU8AyDF302BSZurAvBeXeHJtVcLtFN287IhQ/
         gPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=V//P/BTJwE4NM4HkK8XBmiRM5OYYsUkZOzMEeyQomXs=;
        b=SOAkAsWXOYy/FCTSa1BW1taZ1DDlmJtcMU6jwnIoYhxa23V6Y2l/1fQcLW297Q6sx0
         zc70tUu6W+e2i834IoeEyHHkJqmgOxvQsMowiElivrna4YwZEmJ80O4iQMYdaZJio/c2
         qrVFlxz87BM6AbHfscTRF1SXGVXVhhU7kBD3S87K/KY2lLSU2VCBkpowQIWUxffVqfpl
         2qR0ht9ocuoFwRmsBC2KSlNsuUg/VsPi0tqTui2RH0lUR4rgZo6e+omjaxcrQvGkzxcf
         jgSDBgahWMeX6O2fxdM6MZIsyFIy+QxivCrSGPz49N9Bc0HAdUuUoVEwae/V9Dva/Aoa
         grkg==
X-Gm-Message-State: AOAM5304PhPqe1DLD5X/MnfFM3fXZyCXA0lb+oERjzmCsSxu6fVn8Uws
	NzzC1SYo7RrFLbC0YMHiiZI=
X-Google-Smtp-Source: ABdhPJyI1/aGInkU5Bqyx0cGgOYsFTsTtX8fX8YBWy589EbqtizcDFePWob9RgoCCsNT+xd7dwfeSw==
X-Received: by 2002:a5d:4d4c:: with SMTP id a12mr10225834wru.154.1612453141158;
        Thu, 04 Feb 2021 07:39:01 -0800 (PST)
Subject: Re: [PATCH for-4.15] tools/tests: Introduce a test for
 acquire_resource
From: Oleksandr <olekstysh@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210202190937.30206-1-andrew.cooper3@citrix.com>
 <CAPD2p-nPr_OD7cMT-Ny6vyGsY4nMXuENgrqv0pfYRYtE5srnkQ@mail.gmail.com>
Message-ID: <6586dd8a-8596-0226-f3d3-02cd9e361a52@gmail.com>
Date: Thu, 4 Feb 2021 17:38:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPD2p-nPr_OD7cMT-Ny6vyGsY4nMXuENgrqv0pfYRYtE5srnkQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------A29EFBA36C0D85FB73FD573F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A29EFBA36C0D85FB73FD573F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 04.02.21 15:29, Oleksandr Tyshchenko wrote:

Hi Andrew

>
> Hi Andrew.
> [Sorry for the possible format issues]
>
> On Tue, Feb 2, 2021 at 9:10 PM Andrew Cooper 
> <andrew.cooper3@citrix.com <mailto:andrew.cooper3@citrix.com>> wrote:
>
>     For now, simply try to map 40 frames of grant table.  This catches
>     most of the
>     basic errors with resource sizes found and fixed through the 4.15
>     dev window.
>
>     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com
>     <mailto:andrew.cooper3@citrix.com>>
>     ---
>     CC: Ian Jackson <iwj@xenproject.org <mailto:iwj@xenproject.org>>
>     CC: Wei Liu <wl@xen.org <mailto:wl@xen.org>>
>     CC: Jan Beulich <JBeulich@suse.com <mailto:JBeulich@suse.com>>
>     CC: Roger Pau Monné <roger.pau@citrix.com
>     <mailto:roger.pau@citrix.com>>
>     CC: Wei Liu <wl@xen.org <mailto:wl@xen.org>>
>     CC: Stefano Stabellini <sstabellini@kernel.org
>     <mailto:sstabellini@kernel.org>>
>     CC: Julien Grall <julien@xen.org <mailto:julien@xen.org>>
>     CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com
>     <mailto:Volodymyr_Babchuk@epam.com>>
>     CC: Oleksandr <olekstysh@gmail.com <mailto:olekstysh@gmail.com>>
>
>     Fails against current staging:
>
>       XENMEM_acquire_resource tests
>       Test x86 PV
>         d7: grant table
>           Fail: Map 7 - Argument list too long
>       Test x86 PVH
>         d8: grant table
>           Fail: Map 7 - Argument list too long
>
>     The fix has already been posted:
>       [PATCH v9 01/11] xen/memory: Fix mapping grant tables with
>     XENMEM_acquire_resource
>
>     and the fixed run is:
>
>       XENMEM_acquire_resource tests
>       Test x86 PV
>         d7: grant table
>       Test x86 PVH
>         d8: grant table
>
>     ARM folk: would you mind testing this?  I'm pretty sure the create
>     parameters
>     are suitable, but I don't have any way to test this.
>
> Yes, as it was agreed on IRC, I will test this today's evening and 
> inform about the results)


OK, well, I decided to test right away because going to be busy in the 
evening)

I am based on:
9dc687f x86/debug: fix page-overflow bug in dbg_rw_guest_mem

I noticed the error during building this test in my Yocto environment on 
Arm:


/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld: 
test-resource.o: undefined reference to symbol 
'xendevicemodel_open@@VERS_1.0'
/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld: 
/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/git/tools/tests/resource/../../../tools/libs/devicemodel/libxendevicemodel.so.1: 
error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status
Makefile:38: recipe for target 'test-resource' failed


I didn't investigate whether it is related or not. I just added as 
following:

diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
index 8a3373e..03b19ef 100644
--- a/tools/tests/resource/Makefile
+++ b/tools/tests/resource/Makefile
@@ -32,6 +32,7 @@ CFLAGS += $(APPEND_CFLAGS)

  LDFLAGS += $(LDLIBS_libxenctrl)
  LDFLAGS += $(LDLIBS_libxenforeignmemory)
+LDFLAGS += $(LDLIBS_libxendevicemodel)
  LDFLAGS += $(APPEND_LDFLAGS)

  test-resource: test-resource.o


I got the following result without and with "[PATCH v9 01/11] 
xen/memory: Fix mapping grant tables with XENMEM_acquire_resource"

root@generic-armv8-xt-dom0:~# test-resource
XENMEM_acquire_resource tests
Test ARM
   d3: grant table
xenforeignmemory: error: ioctl failed: Invalid argument
     Fail: Get size: 22 - Invalid argument


>
>
>     I've got more plans for this, but insufficient time right now.
>     ---
>      tools/tests/Makefile                 |   1 +
>      tools/tests/resource/.gitignore      |   1 +
>      tools/tests/resource/Makefile        |  40 ++++++++++
>      tools/tests/resource/test-resource.c | 138
>     +++++++++++++++++++++++++++++++++++
>      4 files changed, 180 insertions(+)
>      create mode 100644 tools/tests/resource/.gitignore
>      create mode 100644 tools/tests/resource/Makefile
>      create mode 100644 tools/tests/resource/test-resource.c
>
>     diff --git a/tools/tests/Makefile b/tools/tests/Makefile
>     index fc9b715951..c45b5fbc1d 100644
>     --- a/tools/tests/Makefile
>     +++ b/tools/tests/Makefile
>     @@ -2,6 +2,7 @@ XEN_ROOT = $(CURDIR)/../..
>      include $(XEN_ROOT)/tools/Rules.mk
>
>      SUBDIRS-y :=
>     +SUBDIRS-y := resource
>      SUBDIRS-$(CONFIG_X86) += cpu-policy
>      SUBDIRS-$(CONFIG_X86) += mce-test
>      ifneq ($(clang),y)
>     diff --git a/tools/tests/resource/.gitignore
>     b/tools/tests/resource/.gitignore
>     new file mode 100644
>     index 0000000000..4872e97d4b
>     --- /dev/null
>     +++ b/tools/tests/resource/.gitignore
>     @@ -0,0 +1 @@
>     +test-resource
>     diff --git a/tools/tests/resource/Makefile
>     b/tools/tests/resource/Makefile
>     new file mode 100644
>     index 0000000000..8a3373e786
>     --- /dev/null
>     +++ b/tools/tests/resource/Makefile
>     @@ -0,0 +1,40 @@
>     +XEN_ROOT = $(CURDIR)/../../..
>     +include $(XEN_ROOT)/tools/Rules.mk
>     +
>     +TARGET := test-resource
>     +
>     +.PHONY: all
>     +all: $(TARGET)
>     +
>     +.PHONY: run
>     +run: $(TARGET)
>     +       ./$(TARGET)
>     +
>     +.PHONY: clean
>     +clean:
>     +       $(RM) -f -- *.o .*.d .*.d2 $(TARGET)
>     +
>     +.PHONY: distclean
>     +distclean: clean
>     +       $(RM) -f -- *~
>     +
>     +.PHONY: install
>     +install: all
>     +
>     +.PHONY: uninstall
>     +uninstall:
>     +
>     +CFLAGS += -Werror -D__XEN_TOOLS__
>     +CFLAGS += $(CFLAGS_xeninclude)
>     +CFLAGS += $(CFLAGS_libxenctrl)
>     +CFLAGS += $(CFLAGS_libxenforeginmemory)
>     +CFLAGS += $(APPEND_CFLAGS)
>     +
>     +LDFLAGS += $(LDLIBS_libxenctrl)
>     +LDFLAGS += $(LDLIBS_libxenforeignmemory)
>     +LDFLAGS += $(APPEND_LDFLAGS)
>     +
>     +test-resource: test-resource.o
>     +       $(CC) $(LDFLAGS) -o $@ $<
>     +
>     +-include $(DEPS_INCLUDE)
>     diff --git a/tools/tests/resource/test-resource.c
>     b/tools/tests/resource/test-resource.c
>     new file mode 100644
>     index 0000000000..81a2a5cd12
>     --- /dev/null
>     +++ b/tools/tests/resource/test-resource.c
>     @@ -0,0 +1,138 @@
>     +#include <err.h>
>     +#include <errno.h>
>     +#include <error.h>
>     +#include <stdio.h>
>     +#include <string.h>
>     +#include <sys/mman.h>
>     +
>     +#include <xenctrl.h>
>     +#include <xenforeignmemory.h>
>     +#include <xendevicemodel.h>
>     +#include <xen-tools/libs.h>
>     +
>     +static unsigned int nr_failures;
>     +#define fail(fmt, ...)                          \
>     +({                                              \
>     +    nr_failures++;                              \
>     +    (void)printf(fmt, ##__VA_ARGS__);           \
>     +})
>     +
>     +static xc_interface *xch;
>     +static xenforeignmemory_handle *fh;
>     +static xendevicemodel_handle *dh;
>     +
>     +static void test_gnttab(uint32_t domid, unsigned int nr_frames)
>     +{
>     +    xenforeignmemory_resource_handle *res;
>     +    void *addr = NULL;
>     +    size_t size;
>     +    int rc;
>     +
>     +    printf("  d%u: grant table\n", domid);
>     +
>     +    rc = xenforeignmemory_resource_size(
>     +        fh, domid, XENMEM_resource_grant_table,
>     +        XENMEM_resource_grant_table_id_shared, &size);
>     +    if ( rc )
>     +        return fail("    Fail: Get size: %d - %s\n", errno,
>     strerror(errno));
>     +
>     +    if ( (size >> XC_PAGE_SHIFT) != nr_frames )
>     +        return fail("    Fail: Get size: expected %u frames, got
>     %zu\n",
>     +                    nr_frames, size >> XC_PAGE_SHIFT);
>     +
>     +    res = xenforeignmemory_map_resource(
>     +        fh, domid, XENMEM_resource_grant_table,
>     +        XENMEM_resource_grant_table_id_shared, 0, size >>
>     XC_PAGE_SHIFT,
>     +        &addr, PROT_READ | PROT_WRITE, 0);
>     +    if ( !res )
>     +        return fail("    Fail: Map %d - %s\n", errno,
>     strerror(errno));
>     +
>     +    rc = xenforeignmemory_unmap_resource(fh, res);
>     +    if ( rc )
>     +        return fail("    Fail: Unmap %d - %s\n", errno,
>     strerror(errno));
>     +}
>     +
>     +static void test_domain_configurations(void)
>     +{
>     +    static struct test {
>     +        const char *name;
>     +        struct xen_domctl_createdomain create;
>     +    } tests[] = {
>     +#if defined(__x86_64__) || defined(__i386__)
>     +        {
>     +            .name = "x86 PV",
>     +            .create = {
>     +                .max_vcpus = 2,
>     +                .max_grant_frames = 40,
>     +            },
>     +        },
>     +        {
>     +            .name = "x86 PVH",
>     +            .create = {
>     +                .flags = XEN_DOMCTL_CDF_hvm,
>     +                .max_vcpus = 2,
>     +                .max_grant_frames = 40,
>     +                .arch = {
>     +                    .emulation_flags = XEN_X86_EMU_LAPIC,
>     +                },
>     +            },
>     +        },
>     +#elif defined(__aarch64__) || defined(__arm__)
>     +        {
>     +            .name = "ARM",
>     +            .create = {
>     +                .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>     +                .max_vcpus = 2,
>     +                .max_grant_frames = 40,
>     +            },
>     +        },
>     +#endif
>     +    };
>     +
>     +    for ( unsigned int i = 0; i < ARRAY_SIZE(tests); ++i )
>     +    {
>     +        struct test *t = &tests[i];
>     +        uint32_t domid = 0;
>     +        int rc;
>     +
>     +        printf("Test %s\n", t->name);
>     +
>     +        rc = xc_domain_create(xch, &domid, &t->create);
>     +        if ( rc )
>     +        {
>     +            if ( errno == EINVAL || errno == EOPNOTSUPP )
>     +                printf("  Skip: %d - %s\n", errno, strerror(errno));
>     +            else
>     +                fail("  Domain create failure: %d - %s\n",
>     +                     errno, strerror(errno));
>     +            continue;
>     +        }
>     +
>     +        test_gnttab(domid, t->create.max_grant_frames);
>     +
>     +        rc = xc_domain_destroy(xch, domid);
>     +        if ( rc )
>     +            fail("  Failed to destroy domain: %d - %s\n",
>     +                 errno, strerror(errno));
>     +    }
>     +}
>     +
>     +int main(int argc, char **argv)
>     +{
>     +    printf("XENMEM_acquire_resource tests\n");
>     +
>     +    xch = xc_interface_open(NULL, NULL, 0);
>     +    fh = xenforeignmemory_open(NULL, 0);
>     +    dh = xendevicemodel_open(NULL, 0);
>     +
>     +    if ( !xch )
>     +        err(1, "xc_interface_open");
>     +    if ( !fh )
>     +        err(1, "xenforeignmemory_open");
>     +    if ( !dh )
>     +        err(1, "xendevicemodel_open");
>     +
>     +    test_domain_configurations();
>     +
>     +    return !!nr_failures;
>     +}
>     -- 
>     2.11.0
>
>
>
> -- 
> Regards,
>
> Oleksandr Tyshchenko

-- 
Regards,

Oleksandr Tyshchenko


--------------A29EFBA36C0D85FB73FD573F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04.02.21 15:29, Oleksandr Tyshchenko
      wrote:</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Hi Andrew<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <blockquote type="cite"
cite="mid:CAPD2p-nPr_OD7cMT-Ny6vyGsY4nMXuENgrqv0pfYRYtE5srnkQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <div>Hi Andrew.</div>
        <div>[Sorry for the possible format issues]</div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Feb 2, 2021 at 9:10
            PM Andrew Cooper &lt;<a
              href="mailto:andrew.cooper3@citrix.com"
              moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">For now, simply try to
            map 40 frames of grant table.  This catches most of the<br>
            basic errors with resource sizes found and fixed through the
            4.15 dev window.<br>
            <br>
            Signed-off-by: Andrew Cooper &lt;<a
              href="mailto:andrew.cooper3@citrix.com" target="_blank"
              moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;<br>
            ---<br>
            CC: Ian Jackson &lt;<a href="mailto:iwj@xenproject.org"
              target="_blank" moz-do-not-send="true">iwj@xenproject.org</a>&gt;<br>
            CC: Wei Liu &lt;<a href="mailto:wl@xen.org" target="_blank"
              moz-do-not-send="true">wl@xen.org</a>&gt;<br>
            CC: Jan Beulich &lt;<a href="mailto:JBeulich@suse.com"
              target="_blank" moz-do-not-send="true">JBeulich@suse.com</a>&gt;<br>
            CC: Roger Pau Monné &lt;<a
              href="mailto:roger.pau@citrix.com" target="_blank"
              moz-do-not-send="true">roger.pau@citrix.com</a>&gt;<br>
            CC: Wei Liu &lt;<a href="mailto:wl@xen.org" target="_blank"
              moz-do-not-send="true">wl@xen.org</a>&gt;<br>
            CC: Stefano Stabellini &lt;<a
              href="mailto:sstabellini@kernel.org" target="_blank"
              moz-do-not-send="true">sstabellini@kernel.org</a>&gt;<br>
            CC: Julien Grall &lt;<a href="mailto:julien@xen.org"
              target="_blank" moz-do-not-send="true">julien@xen.org</a>&gt;<br>
            CC: Volodymyr Babchuk &lt;<a
              href="mailto:Volodymyr_Babchuk@epam.com" target="_blank"
              moz-do-not-send="true">Volodymyr_Babchuk@epam.com</a>&gt;<br>
            CC: Oleksandr &lt;<a href="mailto:olekstysh@gmail.com"
              target="_blank" moz-do-not-send="true">olekstysh@gmail.com</a>&gt;<br>
            <br>
            Fails against current staging:<br>
            <br>
              XENMEM_acquire_resource tests<br>
              Test x86 PV<br>
                d7: grant table<br>
                  Fail: Map 7 - Argument list too long<br>
              Test x86 PVH<br>
                d8: grant table<br>
                  Fail: Map 7 - Argument list too long<br>
            <br>
            The fix has already been posted:<br>
              [PATCH v9 01/11] xen/memory: Fix mapping grant tables with
            XENMEM_acquire_resource<br>
            <br>
            and the fixed run is:<br>
            <br>
              XENMEM_acquire_resource tests<br>
              Test x86 PV<br>
                d7: grant table<br>
              Test x86 PVH<br>
                d8: grant table<br>
            <br>
            ARM folk: would you mind testing this?  I'm pretty sure the
            create parameters<br>
            are suitable, but I don't have any way to test this.<br>
          </blockquote>
          <div>Yes, as it was agreed on IRC, I will test this today's
            evening and inform about the results)</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>OK, well, I decided to test right away because going to be busy
      in the evening)<br>
      <br>
      I am based on:<br>
      9dc687f x86/debug: fix page-overflow bug in dbg_rw_guest_mem</p>
    <p>I noticed the error during building this test in my Yocto
      environment on Arm:<br>
    </p>
    <p><br>
    </p>
    <p>/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld:
      test-resource.o: undefined reference to symbol
      '<a class="moz-txt-link-abbreviated" href="mailto:xendevicemodel_open@@VERS_1.0">xendevicemodel_open@@VERS_1.0</a>'<br>
/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld:
/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/git/tools/tests/resource/../../../tools/libs/devicemodel/libxendevicemodel.so.1:
      error adding symbols: DSO missing from command line<br>
      collect2: error: ld returned 1 exit status<br>
      Makefile:38: recipe for target 'test-resource' failed<br>
    </p>
    <p><br>
    </p>
    <p>I didn't investigate whether it is related or not. I just added
      as following:<br>
    </p>
    <p>diff --git a/tools/tests/resource/Makefile
      b/tools/tests/resource/Makefile<br>
      index 8a3373e..03b19ef 100644<br>
      --- a/tools/tests/resource/Makefile<br>
      +++ b/tools/tests/resource/Makefile<br>
      @@ -32,6 +32,7 @@ CFLAGS += $(APPEND_CFLAGS)<br>
       <br>
       LDFLAGS += $(LDLIBS_libxenctrl)<br>
       LDFLAGS += $(LDLIBS_libxenforeignmemory)<br>
      +LDFLAGS += $(LDLIBS_libxendevicemodel)<br>
       LDFLAGS += $(APPEND_LDFLAGS)<br>
       <br>
       test-resource: test-resource.o</p>
    <p><br>
    </p>
    <p>I got the following result without and with "[PATCH v9 01/11]
      xen/memory: Fix mapping grant tables with XENMEM_acquire_resource"<br>
    </p>
    <p>root@generic-armv8-xt-dom0:~# test-resource <br>
      XENMEM_acquire_resource tests<br>
      Test ARM<br>
        d3: grant table<br>
      xenforeignmemory: error: ioctl failed: Invalid argument<br>
          Fail: Get size: 22 - Invalid argument</p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAPD2p-nPr_OD7cMT-Ny6vyGsY4nMXuENgrqv0pfYRYtE5srnkQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            I've got more plans for this, but insufficient time right
            now.<br>
            ---<br>
             tools/tests/Makefile                 |   1 +<br>
             tools/tests/resource/.gitignore      |   1 +<br>
             tools/tests/resource/Makefile        |  40 ++++++++++<br>
             tools/tests/resource/test-resource.c | 138
            +++++++++++++++++++++++++++++++++++<br>
             4 files changed, 180 insertions(+)<br>
             create mode 100644 tools/tests/resource/.gitignore<br>
             create mode 100644 tools/tests/resource/Makefile<br>
             create mode 100644 tools/tests/resource/test-resource.c<br>
            <br>
            diff --git a/tools/tests/Makefile b/tools/tests/Makefile<br>
            index fc9b715951..c45b5fbc1d 100644<br>
            --- a/tools/tests/Makefile<br>
            +++ b/tools/tests/Makefile<br>
            @@ -2,6 +2,7 @@ XEN_ROOT = $(CURDIR)/../..<br>
             include $(XEN_ROOT)/tools/Rules.mk<br>
            <br>
             SUBDIRS-y :=<br>
            +SUBDIRS-y := resource<br>
             SUBDIRS-$(CONFIG_X86) += cpu-policy<br>
             SUBDIRS-$(CONFIG_X86) += mce-test<br>
             ifneq ($(clang),y)<br>
            diff --git a/tools/tests/resource/.gitignore
            b/tools/tests/resource/.gitignore<br>
            new file mode 100644<br>
            index 0000000000..4872e97d4b<br>
            --- /dev/null<br>
            +++ b/tools/tests/resource/.gitignore<br>
            @@ -0,0 +1 @@<br>
            +test-resource<br>
            diff --git a/tools/tests/resource/Makefile
            b/tools/tests/resource/Makefile<br>
            new file mode 100644<br>
            index 0000000000..8a3373e786<br>
            --- /dev/null<br>
            +++ b/tools/tests/resource/Makefile<br>
            @@ -0,0 +1,40 @@<br>
            +XEN_ROOT = $(CURDIR)/../../..<br>
            +include $(XEN_ROOT)/tools/Rules.mk<br>
            +<br>
            +TARGET := test-resource<br>
            +<br>
            +.PHONY: all<br>
            +all: $(TARGET)<br>
            +<br>
            +.PHONY: run<br>
            +run: $(TARGET)<br>
            +       ./$(TARGET)<br>
            +<br>
            +.PHONY: clean<br>
            +clean:<br>
            +       $(RM) -f -- *.o .*.d .*.d2 $(TARGET)<br>
            +<br>
            +.PHONY: distclean<br>
            +distclean: clean<br>
            +       $(RM) -f -- *~<br>
            +<br>
            +.PHONY: install<br>
            +install: all<br>
            +<br>
            +.PHONY: uninstall<br>
            +uninstall:<br>
            +<br>
            +CFLAGS += -Werror -D__XEN_TOOLS__<br>
            +CFLAGS += $(CFLAGS_xeninclude)<br>
            +CFLAGS += $(CFLAGS_libxenctrl)<br>
            +CFLAGS += $(CFLAGS_libxenforeginmemory)<br>
            +CFLAGS += $(APPEND_CFLAGS)<br>
            +<br>
            +LDFLAGS += $(LDLIBS_libxenctrl)<br>
            +LDFLAGS += $(LDLIBS_libxenforeignmemory)<br>
            +LDFLAGS += $(APPEND_LDFLAGS)<br>
            +<br>
            +test-resource: test-resource.o<br>
            +       $(CC) $(LDFLAGS) -o $@ $&lt;<br>
            +<br>
            +-include $(DEPS_INCLUDE)<br>
            diff --git a/tools/tests/resource/test-resource.c
            b/tools/tests/resource/test-resource.c<br>
            new file mode 100644<br>
            index 0000000000..81a2a5cd12<br>
            --- /dev/null<br>
            +++ b/tools/tests/resource/test-resource.c<br>
            @@ -0,0 +1,138 @@<br>
            +#include &lt;err.h&gt;<br>
            +#include &lt;errno.h&gt;<br>
            +#include &lt;error.h&gt;<br>
            +#include &lt;stdio.h&gt;<br>
            +#include &lt;string.h&gt;<br>
            +#include &lt;sys/mman.h&gt;<br>
            +<br>
            +#include &lt;xenctrl.h&gt;<br>
            +#include &lt;xenforeignmemory.h&gt;<br>
            +#include &lt;xendevicemodel.h&gt;<br>
            +#include &lt;xen-tools/libs.h&gt;<br>
            +<br>
            +static unsigned int nr_failures;<br>
            +#define fail(fmt, ...)                          \<br>
            +({                                              \<br>
            +    nr_failures++;                              \<br>
            +    (void)printf(fmt, ##__VA_ARGS__);           \<br>
            +})<br>
            +<br>
            +static xc_interface *xch;<br>
            +static xenforeignmemory_handle *fh;<br>
            +static xendevicemodel_handle *dh;<br>
            +<br>
            +static void test_gnttab(uint32_t domid, unsigned int
            nr_frames)<br>
            +{<br>
            +    xenforeignmemory_resource_handle *res;<br>
            +    void *addr = NULL;<br>
            +    size_t size;<br>
            +    int rc;<br>
            +<br>
            +    printf("  d%u: grant table\n", domid);<br>
            +<br>
            +    rc = xenforeignmemory_resource_size(<br>
            +        fh, domid, XENMEM_resource_grant_table,<br>
            +        XENMEM_resource_grant_table_id_shared, &amp;size);<br>
            +    if ( rc )<br>
            +        return fail("    Fail: Get size: %d - %s\n", errno,
            strerror(errno));<br>
            +<br>
            +    if ( (size &gt;&gt; XC_PAGE_SHIFT) != nr_frames )<br>
            +        return fail("    Fail: Get size: expected %u
            frames, got %zu\n",<br>
            +                    nr_frames, size &gt;&gt;
            XC_PAGE_SHIFT);<br>
            +<br>
            +    res = xenforeignmemory_map_resource(<br>
            +        fh, domid, XENMEM_resource_grant_table,<br>
            +        XENMEM_resource_grant_table_id_shared, 0, size
            &gt;&gt; XC_PAGE_SHIFT,<br>
            +        &amp;addr, PROT_READ | PROT_WRITE, 0);<br>
            +    if ( !res )<br>
            +        return fail("    Fail: Map %d - %s\n", errno,
            strerror(errno));<br>
            +<br>
            +    rc = xenforeignmemory_unmap_resource(fh, res);<br>
            +    if ( rc )<br>
            +        return fail("    Fail: Unmap %d - %s\n", errno,
            strerror(errno));<br>
            +}<br>
            +<br>
            +static void test_domain_configurations(void)<br>
            +{<br>
            +    static struct test {<br>
            +        const char *name;<br>
            +        struct xen_domctl_createdomain create;<br>
            +    } tests[] = {<br>
            +#if defined(__x86_64__) || defined(__i386__)<br>
            +        {<br>
            +            .name = "x86 PV",<br>
            +            .create = {<br>
            +                .max_vcpus = 2,<br>
            +                .max_grant_frames = 40,<br>
            +            },<br>
            +        },<br>
            +        {<br>
            +            .name = "x86 PVH",<br>
            +            .create = {<br>
            +                .flags = XEN_DOMCTL_CDF_hvm,<br>
            +                .max_vcpus = 2,<br>
            +                .max_grant_frames = 40,<br>
            +                .arch = {<br>
            +                    .emulation_flags = XEN_X86_EMU_LAPIC,<br>
            +                },<br>
            +            },<br>
            +        },<br>
            +#elif defined(__aarch64__) || defined(__arm__)<br>
            +        {<br>
            +            .name = "ARM",<br>
            +            .create = {<br>
            +                .flags = XEN_DOMCTL_CDF_hvm |
            XEN_DOMCTL_CDF_hap,<br>
            +                .max_vcpus = 2,<br>
            +                .max_grant_frames = 40,<br>
            +            },<br>
            +        },<br>
            +#endif<br>
            +    };<br>
            +<br>
            +    for ( unsigned int i = 0; i &lt; ARRAY_SIZE(tests); ++i
            )<br>
            +    {<br>
            +        struct test *t = &amp;tests[i];<br>
            +        uint32_t domid = 0;<br>
            +        int rc;<br>
            +<br>
            +        printf("Test %s\n", t-&gt;name);<br>
            +<br>
            +        rc = xc_domain_create(xch, &amp;domid,
            &amp;t-&gt;create);<br>
            +        if ( rc )<br>
            +        {<br>
            +            if ( errno == EINVAL || errno == EOPNOTSUPP )<br>
            +                printf("  Skip: %d - %s\n", errno,
            strerror(errno));<br>
            +            else<br>
            +                fail("  Domain create failure: %d - %s\n",<br>
            +                     errno, strerror(errno));<br>
            +            continue;<br>
            +        }<br>
            +<br>
            +        test_gnttab(domid, t-&gt;create.max_grant_frames);<br>
            +<br>
            +        rc = xc_domain_destroy(xch, domid);<br>
            +        if ( rc )<br>
            +            fail("  Failed to destroy domain: %d - %s\n",<br>
            +                 errno, strerror(errno));<br>
            +    }<br>
            +}<br>
            +<br>
            +int main(int argc, char **argv)<br>
            +{<br>
            +    printf("XENMEM_acquire_resource tests\n");<br>
            +<br>
            +    xch = xc_interface_open(NULL, NULL, 0);<br>
            +    fh = xenforeignmemory_open(NULL, 0);<br>
            +    dh = xendevicemodel_open(NULL, 0);<br>
            +<br>
            +    if ( !xch )<br>
            +        err(1, "xc_interface_open");<br>
            +    if ( !fh )<br>
            +        err(1, "xenforeignmemory_open");<br>
            +    if ( !dh )<br>
            +        err(1, "xendevicemodel_open");<br>
            +<br>
            +    test_domain_configurations();<br>
            +<br>
            +    return !!nr_failures;<br>
            +}<br>
            -- <br>
            2.11.0<br>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">
          <div dir="ltr">
            <div>
              <div dir="ltr">
                <div>
                  <div dir="ltr"><span
                      style="background-color:rgb(255,255,255)"><font
                        size="2"><span
                          style="color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</span></font></span></div>
                  <div dir="ltr"><br>
                  </div>
                  <div dir="ltr">
                    <div><span style="background-color:rgb(255,255,255)"><font
                          size="2">Oleksandr Tyshchenko</font></span></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Regards,

Oleksandr Tyshchenko</pre>
  </body>
</html>

--------------A29EFBA36C0D85FB73FD573F--

