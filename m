Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7089CDDA1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:43:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837152.1253075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuip-0003kw-Ib; Fri, 15 Nov 2024 11:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837152.1253075; Fri, 15 Nov 2024 11:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuip-0003jQ-FR; Fri, 15 Nov 2024 11:42:43 +0000
Received: by outflank-mailman (input) for mailman id 837152;
 Fri, 15 Nov 2024 11:42:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNXE=SK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBuio-0003jK-6M
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:42:42 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6af129c-a346-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:42:38 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa3a79d4d59so269045866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:42:38 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0016a7sm171182266b.116.2024.11.15.03.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:42:37 -0800 (PST)
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
X-Inumbo-ID: b6af129c-a346-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI2YWYxMjljLWEzNDYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcwOTU4LjM0ODg3OCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731670957; x=1732275757; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=50t4+z6szZlSAQfAvQIfZEy3Sfim2KUIHMSqhuVG9FI=;
        b=NuR5VVEW+2Tc5EArgag39HNN5+d84T7UMrfm/QiEJ7sGOhBYHMFdyZryKnAALvzEcn
         +dexTrk50meZi+A5wCnrDlkhUtB0HOCmxqVUoWwwJLtyY8Hvz/zPitgSi7WLWTUlQKKo
         6jCCfTeRV4CO+LJIaQci2mPwzsk8Cm5BE1GyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731670957; x=1732275757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=50t4+z6szZlSAQfAvQIfZEy3Sfim2KUIHMSqhuVG9FI=;
        b=dDNXjwwyE+nhbQhMzFksYqMHDMeL61VAfhe5M/lTMv9NPLGZJuaXoSgaUtvjLXF8QY
         UlSgJ94y+fV7jxst+f5xMqUSxnXTEbo8p8Ds46tRIxAo2+lNVyAmRme0+w9mCxb3LNCD
         Uiq9TNhiavBWP9ilO6JNWPXwjpO5OckihY+A2mYjJvo72hsTqwjjaAE6wMwO+sZnHVwt
         +NLFFCZzUfowVsj3sT0Dy9Sh71LAJqcCTIbMLip/yoOIC5xb3DMYTDqe2rXMOnlaj9VR
         SYa5hgJDOkr8aqK4SaAYc33iDtQt+LTaOt4GbaUyy42elb210tjapNna0VUUuNEsyzQZ
         hVAg==
X-Gm-Message-State: AOJu0Yw2l/9LlP7pPyYZGTGZOES6sw3MW3pDKQ9CCWKyrQb8ksvYmQLz
	9YJBuFBxLqVydLeDibc2pcEjTDhIqzUtwkvWBzYfRZ1lpqh25sF9SPpO1CPucyA=
X-Google-Smtp-Source: AGHT+IEo4VUswjCyj2aUniX9ylSkQiWTreQMEOm50N8iAP+5oftnXV8nwV0c141YEuAugxBa8mL2CA==
X-Received: by 2002:a17:907:6e94:b0:a9a:c57f:9634 with SMTP id a640c23a62f3a-aa483525e7dmr212622166b.42.1731670957416;
        Fri, 15 Nov 2024 03:42:37 -0800 (PST)
Date: Fri, 15 Nov 2024 12:42:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzczqznFbixk3Vfu@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook>
 <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzYcskZ-GZ8HsXfU@macbook>
 <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Nov 15, 2024 at 03:04:22AM +0000, Chen, Jiqian wrote:
> On 2024/11/15 01:36, Roger Pau Monné wrote:
> > On Thu, Nov 14, 2024 at 04:52:18PM +0100, Roger Pau Monné wrote:
> >> On Thu, Nov 14, 2024 at 06:11:46AM +0000, Chen, Jiqian wrote:
> >>> On 2024/11/13 18:30, Roger Pau Monné wrote:
> >>>> On Wed, Nov 13, 2024 at 10:00:33AM +0000, Chen, Jiqian wrote:
> >>>>> On 2024/11/13 17:30, Roger Pau Monné wrote:
> >>>>>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> >>>>>>> Some devices, like discrete GPU of amd, support resizable bar capability,
> >>>>>>> but vpci of Xen doesn't support this feature, so they fail to resize bars
> >>>>>>> and then cause probing failure.
> >>>>>>>
> >>>>>>> According to PCIe spec, each bar that support resizing has two registers,
> >>>>>>> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> >>>>>>> corresponding handler into vpci.
> >>>>>>>
> >>>>>>> PCI_REBAR_CAP is RO, only provide reading.
> >>>>>>>
> >>>>>>> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> >>>>>>> setting the new size.
> >>>>>>
> >>>>>> I think the logic to handle resizable BAR could be much simpler.  Some
> >>>>>> time ago I've made a patch to add support for it, but due to lack of
> >>>>>> hardware on my side to test it I've never submitted it.
> >>>>>>
> >>>>>> My approach would be to detect the presence of the
> >>>>>> PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
> >>>>>> capability is present force the sizing of BARs each time they are
> >>>>>> mapped in modify_bars().  I don't think we need to trap accesses to
> >>>>>> the capability itself, as resizing can only happen when memory
> >>>>>> decoding is not enabled for the device.  It's enough to fetch the size
> >>>>>> of the BARs ahead of each enabling of memory decoding.
> >>>>>>
> >>>>>> Note that memory decoding implies mapping the BARs into the p2m, which
> >>>>>> is already an expensive operation, the extra sizing is unlikely to
> >>>>>> make much of a difference performance wise.
> >>>>>>
> >>>>>> I've found the following on my git tree and rebased on top of staging:
> >>>>> OK.
> >>>>> Do you need me to validate your patch in my environment?
> >>>>
> >>>> Yes please, I have no way to test it.  Let's see what others think
> >>>> about the different approaches.
> >>> There are some errors with your method.
> >>> I attached the dmesg and xl dmesg logs.
> >>> From the dmesg logs, it seems that 0000:03:00.0 has addresse overlap with 0000:03:00.1
> >>
> >> Do you have the output of lspci with the BAR sizes/positions before
> >> and after the resizing?
> >>
> >>>
> >>> I think there is a place that needs to be modified regarding your method,
> >>> although this modification does not help with the above-mentioned errors,
> >>> it is that whether to support resizing is specific to which bar, rather than just determining whether there is a Rebar capability.
> >>
> >> Do we really need such fine-grained information?  It should be
> >> harmless (even if not strictly necessary) to size all BARs on the
> >> device before enabling memory decoding, even if some of them do not
> >> support resizing.
> >>
> >> I might have to provide a patch with additional messages to see what's
> >> going on.
> > 
> > One nit that I've noticed with the patch I gave you previously is that
> > the check for a size change in modify_bars() should be done ahead of
> > pci_check_bar(), otherwise the check is possibly using an outdated
> > size.
> > 
> > I've also added a debug message to notify when a BAR register is
> > written and report the new address.  This is done unconditionally, but
> > if you think it's too chatty you can limit to only printing for the
> > device that has the ReBAR capability.
> Errors are the same.
> Attached the dmesg, xl dmesg, patch and lspci output.
> I will also continue to debug your method on my side to try to get some findings.

Hello,

I've been looking at the output, and it all seems fine, except the
03:00.0 device that becomes broken at some point, note the lspci
output lists [virtual] next to the resource sizes.  This means reading
for the registers returned 0, so the position and sizes are provided
from the internal OS information.

I'm assuming the patch you sent to the list doesn't lead to such
errors, in which case I can only guess that fetching the size of the
BARs in modify_bars() causes issues with the device.

To confirm this, can you try the following patch on top of your
original change?  This adds an extra pci_size_mem_bar() when the BARs
are resized.  From my reading of the PCI specification sizing the BARs
after having changed the size through the ReBAR capability is allowed.

Thanks, Roger.

diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 84dbd84b0745..e371ba0ef92a 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -40,6 +40,15 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
                        PCI_REBAR_CTRL_BAR_UNIT;
 
     pci_conf_write32(pdev->sbdf, reg, val);
+
+{
+    uint64_t addr, size;
+
+    pci_size_mem_bar(pdev->sbdf, PCI_BASE_ADDRESS_0 + index * 4,
+                     &addr, &size, 0);
+
+    ASSERT(size == bars[index].size);
+}
 }
 
 static int cf_check init_rebar(struct pci_dev *pdev)

