Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EAB8452E9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 09:40:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674256.1049088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVSbz-0005AC-Oo; Thu, 01 Feb 2024 08:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674256.1049088; Thu, 01 Feb 2024 08:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVSbz-00056z-Ls; Thu, 01 Feb 2024 08:39:55 +0000
Received: by outflank-mailman (input) for mailman id 674256;
 Thu, 01 Feb 2024 08:39:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAD+=JK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rVSby-00056t-4C
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 08:39:54 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76f01adc-c0dd-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 09:39:53 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e80046246so3010285e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 00:39:51 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c4eca00b0040fbba734f3sm1082225wmq.34.2024.02.01.00.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 00:39:50 -0800 (PST)
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
X-Inumbo-ID: 76f01adc-c0dd-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706776790; x=1707381590; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mmx7Ge44ylq+xRaE54Mmi5lsueMZNlgqIRQYM/UNpUU=;
        b=OmNEBETwYjdQ78BY2VOaVyxirQZhsePrn9jIlvhcHMLq3qHpua71BUUKK9TolNJaIM
         ICUePWoYJ+sten497EIQhayU6+HzPM7RICgEDsW4dnkflBGpmjI0L98/8OM5R9RpzWOp
         b91TgB3ekalm0wqP8YgixA02jfs0HOW1UyL+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706776790; x=1707381590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mmx7Ge44ylq+xRaE54Mmi5lsueMZNlgqIRQYM/UNpUU=;
        b=tp5nUovhg8hSheHR5aULhHepI1RkXg0+w1u9R0XWbIT3ObJCbZTMD19kYjfWYMC7PH
         GPQYZkx/36C5+AvHs+I537C67RkfTa+YyHBZ/HJip22L/PaR0YawnSXfujdReOpnDb0Y
         yUHCA1G3gJHbuboJd0rQGsyBJI0xPWxf3ZeNZs+3fk9RZqWPf8qur6Qm7DmyVbTFVFWV
         qX06nNDYcSZRD5Bg93gmakJ9XUMbU58ZFaJb8jBY98lQxyXlMKeQrE7hgEpmeE+xQrUL
         UxwpWBbmtgAhpiM39y+YIch72cdlQnHYrnJqPK4Ro/gzQfY3p42CrpBLMozgOyMnSO3B
         tJjA==
X-Gm-Message-State: AOJu0Yx1Iuvv8F+cBwLosI7Z5gyqSPHt1gZ7DBrOVLNwfO0vkFGpXaVT
	rIELNccLVJDzAXL9wdk3+Hy0sdkWl9hoVkjsUQ8WGk1Bq86ciZiJSMqjcWkUMXE=
X-Google-Smtp-Source: AGHT+IGW7bgbJkTrR4Yza/IRXj8QJZwTE7Cr91T4ok2nKqWk8e0wQ2sciL8gpCHIKiRmLekUEHkNew==
X-Received: by 2002:a05:600c:1c9a:b0:40e:f972:9901 with SMTP id k26-20020a05600c1c9a00b0040ef9729901mr3736599wms.4.1706776790540;
        Thu, 01 Feb 2024 00:39:50 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXDCVhgfb0o24SN4Wqn/FgnWkJYm9QCYpD/ESYbFl4VjZTFA1lzb2EecVom9k5fEwfP12Y/uppYGzcffTRrzp/icQGv3HjGZpMbEHP1O0bmMpkENMmh/i5WpK5zIezuae0Uf4YZJFj/GIIpi8YgFkSb+ve1+U2VK0dRTY3tLYI0EKqJsftwJxoWx8X1Knfb8tnC76BuOBql1srwLsN7vGSl2wcbMkEqp6rlaRVuZC9dj8g2KKow5t0/nsSr8nJZlls/92TMW3QXD5Uc/pJNuCeeBPj2+nM9/cIi4ZkYdMgG2c7Y3W/85xx3atQ7NFnga1NjCNQMDhJbuqruZaGAYHg7aAFbNfLKQC7xPnI5wPmFp1E3D2qFqwlvqSIyLUOZrN5YudkUPsFIPL0Qk1faQOXY4FjKqsnSsDMGI58pczPV4freLpRkOBnJ+zblZe0frUgjrALk1NdUEoPj3Y9vKQ+JxYOJfr1AnKZs/vkDbp6joC8yuId8ZmXn+YeGnhlWwAZhccdcXntd3R0=
Date: Thu, 1 Feb 2024 09:39:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>
Subject: Re: [RFC KERNEL PATCH v4 3/3] PCI/sysfs: Add gsi sysfs for pci_dev
Message-ID: <ZbtY1R15pYZz3F3B@macbook>
References: <ZboLq6kZhwpUC_c3@macbook>
 <20240131190014.GA593286@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240131190014.GA593286@bhelgaas>

On Wed, Jan 31, 2024 at 01:00:14PM -0600, Bjorn Helgaas wrote:
> On Wed, Jan 31, 2024 at 09:58:19AM +0100, Roger Pau Monné wrote:
> > On Tue, Jan 30, 2024 at 02:44:03PM -0600, Bjorn Helgaas wrote:
> > > On Tue, Jan 30, 2024 at 10:07:36AM +0100, Roger Pau Monné wrote:
> > > > On Mon, Jan 29, 2024 at 04:01:13PM -0600, Bjorn Helgaas wrote:
> > > > > On Thu, Jan 25, 2024 at 07:17:24AM +0000, Chen, Jiqian wrote:
> > > > > > On 2024/1/24 00:02, Bjorn Helgaas wrote:
> > > > > > > On Tue, Jan 23, 2024 at 10:13:52AM +0000, Chen, Jiqian wrote:
> > > > > > >> On 2024/1/23 07:37, Bjorn Helgaas wrote:
> > > > > > >>> On Fri, Jan 05, 2024 at 02:22:17PM +0800, Jiqian Chen wrote:
> > > > > > >>>> There is a need for some scenarios to use gsi sysfs.
> > > > > > >>>> For example, when xen passthrough a device to dumU, it will
> > > > > > >>>> use gsi to map pirq, but currently userspace can't get gsi
> > > > > > >>>> number.
> > > > > > >>>> So, add gsi sysfs for that and for other potential scenarios.
> > > > > > >> ...
> > > > > > > 
> > > > > > >>> I don't know enough about Xen to know why it needs the GSI in
> > > > > > >>> userspace.  Is this passthrough brand new functionality that can't be
> > > > > > >>> done today because we don't expose the GSI yet?
> > > > > 
> > > > > I assume this must be new functionality, i.e., this kind of
> > > > > passthrough does not work today, right?
> > > > > 
> > > > > > >> has ACPI support and is responsible for detecting and controlling
> > > > > > >> the hardware, also it performs privileged operations such as the
> > > > > > >> creation of normal (unprivileged) domains DomUs. When we give to a
> > > > > > >> DomU direct access to a device, we need also to route the physical
> > > > > > >> interrupts to the DomU. In order to do so Xen needs to setup and map
> > > > > > >> the interrupts appropriately.
> > > > > > > 
> > > > > > > What kernel interfaces are used for this setup and mapping?
> > > > > >
> > > > > > For passthrough devices, the setup and mapping of routing physical
> > > > > > interrupts to DomU are done on Xen hypervisor side, hypervisor only
> > > > > > need userspace to provide the GSI info, see Xen code:
> > > > > > xc_physdev_map_pirq require GSI and then will call hypercall to pass
> > > > > > GSI into hypervisor and then hypervisor will do the mapping and
> > > > > > routing, kernel doesn't do the setup and mapping.
> > > > > 
> > > > > So we have to expose the GSI to userspace not because userspace itself
> > > > > uses it, but so userspace can turn around and pass it back into the
> > > > > kernel?
> > > > 
> > > > No, the point is to pass it back to Xen, which doesn't know the
> > > > mapping between GSIs and PCI devices because it can't execute the ACPI
> > > > AML resource methods that provide such information.
> > > > 
> > > > The (Linux) kernel is just a proxy that forwards the hypercalls from
> > > > user-space tools into Xen.
> > > 
> > > But I guess Xen knows how to interpret a GSI even though it doesn't
> > > have access to AML?
> > 
> > On x86 Xen does know how to map a GSI into an IO-APIC pin, in order
> > configure the RTE as requested.
> 
> IIUC, mapping a GSI to an IO-APIC pin requires information from the
> MADT.  So I guess Xen does use the static ACPI tables, but not the AML
> _PRT methods that would connect a GSI with a PCI device?

Yes, Xen can parse the static tables, and knows the base GSI of
IO-APICs from the MADT.

> I guess this means Xen would not be able to deal with _MAT methods,
> which also contains MADT entries?  I don't know the implications of
> this -- maybe it means Xen might not be able to use with hot-added
> devices?

It's my understanding _MAT will only be present on some very specific
devices (IO-APIC or CPU objects).  Xen doesn't support hotplug of
IO-APICs, but hotplug of CPUs should in principle be supported with
cooperation from the control domain OS (albeit it's not something that
we tests on our CI).  I don't expect however that a CPU object _MAT
method will return IO APIC entries.

> The tables (including DSDT and SSDTS that contain the AML) are exposed
> to userspace via /sys/firmware/acpi/tables/, but of course that
> doesn't mean Xen knows how to interpret the AML, and even if it did,
> Xen probably wouldn't be able to *evaluate* it since that could
> conflict with the host kernel's use of AML.

Indeed, there can only be a single OSPM, and that's the dom0 OS (Linux
in our context).

Getting back to our context though, what would be a suitable place for
exposing the GSI assigned to each device?

Thanks, Roger.

