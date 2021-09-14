Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C2540BBC3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 00:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187043.335778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQH6g-0002Qv-1F; Tue, 14 Sep 2021 22:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187043.335778; Tue, 14 Sep 2021 22:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQH6f-0002O0-Tq; Tue, 14 Sep 2021 22:40:49 +0000
Received: by outflank-mailman (input) for mailman id 187043;
 Tue, 14 Sep 2021 22:40:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L61H=OE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQH6d-0002Nu-Md
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 22:40:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd2ce9ee-15ac-11ec-b47c-12813bfff9fa;
 Tue, 14 Sep 2021 22:40:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FD7C6115B;
 Tue, 14 Sep 2021 22:40:45 +0000 (UTC)
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
X-Inumbo-ID: cd2ce9ee-15ac-11ec-b47c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631659245;
	bh=XLwkarAxi2F06UZdHeqR6DMKqo7ziOd96BMK/KLTjBE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UlRmuMm1l6iR4HPyhywQgOXy+jw+NcKRu4FCU+e4zSjk59oh/9RS0kAE04pUHWHRI
	 kko3/dgCGDOmwwNxg/Ur0ghJV+VvQ1o1OCnSbbRi8gQbqiFnE1spoLwjDDTsYrm3nf
	 eNfYTzcO5twYhDTorTWjTRVXxx1z5F+96oBzxJ0YGmqfzWJomEQAAazw2ICDcrp1IX
	 GNcwuvBgT1QbDXsMnnLxGGivwUJcsfx0JDUHJBzfYpdDaqVCL54VxKcyD0Tg8OL3tY
	 JZEKiIHQTcqYBpzFeb742UnT757aJ7B8la8WX/l3qNd6zfg72ECViMmNDYkQPp8Ss3
	 Jomd/QbNZnktw==
Date: Tue, 14 Sep 2021 15:40:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, jbeulich@suse.com
Subject: Re: [PATCH v1 08/14] xen:arm: Implement pci access functions
In-Reply-To: <E37D41BC-1ACB-4779-9A8F-379F0E7BCB1A@arm.com>
Message-ID: <alpine.DEB.2.21.2109141522380.21985@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <c90c3088a592b41c477a0026446294a3b9422f76.1629366665.git.rahul.singh@arm.com> <alpine.DEB.2.21.2109091639360.10523@sstabellini-ThinkPad-T480s> <E37D41BC-1ACB-4779-9A8F-379F0E7BCB1A@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-480397342-1631658371=:21985"
Content-ID: <alpine.DEB.2.21.2109141537470.21985@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-480397342-1631658371=:21985
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109141537471.21985@sstabellini-ThinkPad-T480s>

+Jan for the header include question at the bottom


On Tue, 14 Sep 2021, Rahul Singh wrote:
> Hi Stefano,
> 
> > On 10 Sep 2021, at 12:41 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 19 Aug 2021, Rahul Singh wrote:
> >> Implement generic pci access functions to read/write the configuration
> >> space.
> >> 
> >> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> >> ---
> >> xen/arch/arm/pci/pci-access.c      | 31 +++++++++++++++++++++++++++++-
> >> xen/arch/arm/pci/pci-host-common.c | 19 ++++++++++++++++++
> >> xen/include/asm-arm/pci.h          |  2 ++
> >> 3 files changed, 51 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
> >> index f39f6a3a38..b94de3c3ac 100644
> >> --- a/xen/arch/arm/pci/pci-access.c
> >> +++ b/xen/arch/arm/pci/pci-access.c
> >> @@ -72,12 +72,41 @@ int pci_generic_config_write(struct pci_host_bridge *bridge, uint32_t sbdf,
> >> static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
> >>                                 unsigned int len)
> >> {
> >> -    return ~0U;
> >> +    uint32_t val = GENMASK(0, len * 8);
> > 
> > This seems to be another default error value that it would be better to
> > define with its own macro
> 
> This default error is used once do you want to me define as macro.  

Yes. A macro is good even if you are going to use it once because it
also serves as documentation for the error. For instance:

/* PCI host bridge not found */
#define PCI_ERR_NOTFOUND(len) GENMASK(0, len * 8)

really helps with the explanation of what the error is about.


> >> +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> >> +
> >> +    if ( unlikely(!bridge) )
> >> +    {
> >> +        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
> >> +                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
> > 
> > You are not actually printing sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn ?
> 
> Yes I am printing with “PRI_pci".

Sorry I missed it!


> >> +        return val;
> >> +    }
> >> +
> >> +    if ( unlikely(!bridge->ops->read) )
> >> +        return val;
> >> +
> >> +    bridge->ops->read(bridge, (uint32_t) sbdf.sbdf, reg, len, &val);
> > 
> > Would it make sense to make the interface take a pci_sbdf_t directly
> > instead of casting to uint32_t and back?
> 
> pci_sbdf_t is defined in "xen/pci.h” and "xen/pci.h” includes "asm-arm/pci.h”. 
> If I modify the function argument in "asm-arm/pci.h” to use pci_sbdf_t  I will get compilation error.

This is unfortunate. One way around it is to make the appended change to
xen/include/xen/pci.h and then simply add:

typedef union pci_sbdf pci_sbdf_t;

to xen/include/asm-arm/pci.h.

Jan do you have any better suggestions?


diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 8e3d4d9454..ae8d48135b 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -41,7 +41,7 @@
 #define PCI_SBDF3(s,b,df) \
     ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
 
-typedef union {
+union pci_sbdf {
     uint32_t sbdf;
     struct {
         union {
@@ -60,7 +60,9 @@ typedef union {
         };
         uint16_t                seg;
     };
-} pci_sbdf_t;
+};
+
+typedef union pci_sbdf pci_sbdf_t;
 
 struct pci_dev_info {
     /*
--8323329-480397342-1631658371=:21985--

