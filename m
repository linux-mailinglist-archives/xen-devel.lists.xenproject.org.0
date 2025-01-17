Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5827CA14DD3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 11:40:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873990.1284892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYjly-0005Ar-2Y; Fri, 17 Jan 2025 10:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873990.1284892; Fri, 17 Jan 2025 10:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYjlx-000593-WD; Fri, 17 Jan 2025 10:40:18 +0000
Received: by outflank-mailman (input) for mailman id 873990;
 Fri, 17 Jan 2025 10:40:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wado=UJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYjlx-00058x-6S
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 10:40:17 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7031a7d8-d4bf-11ef-a0e2-8be0dac302b0;
 Fri, 17 Jan 2025 11:40:15 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385e3621518so871965f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 02:40:15 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327e118sm2118050f8f.82.2025.01.17.02.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:40:14 -0800 (PST)
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
X-Inumbo-ID: 7031a7d8-d4bf-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737110415; x=1737715215; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7mwTTuad42S1rQBszQTQ89Dyk+uWIrWT74aPH7+8FQo=;
        b=IOE07+0cHWb+Hpiuuv7WqeiXOQ+FCjHAC2TWHC/4T8YpyCsaL5hE0Ckwicq/ko04Wo
         hib/WggkCrSWvdwR7+4OKpgb8GEddWI6I9vV9ImHY9oK1EFoTplegdzSBQJRXhVF4nlR
         SmiYXQlCEU1hDmthaFBHJdE4aIHUcaJS1zkt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737110415; x=1737715215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mwTTuad42S1rQBszQTQ89Dyk+uWIrWT74aPH7+8FQo=;
        b=Vc8TIQyEomIP6P7OZd1ozAOjx4DzvNkgWZdib00ShBqKQJkfyYcrpv+loWzNH7askv
         lykCfBjiSAjZuqTzTlLOCpLEuL/AIGFWdSxm/hsh6qkguGKOklhzLviBirS6iN6jko2W
         BqHbAUIl6+ey7gCjRLXMLdPKUyCDEcw0qu/yYrZgDDfcSF4EonAgcrYp+eOwX9IlbejP
         WydmSg9xFUCaQ18xKV1DAgEjZTIAs80Ni7Tjv5QUj4h8OmpOte3A49BWOgBSZtsyp5lD
         lP1RzBWRMu0CWfJwkMNzzhmAFp8iP6KhlMY9Vayv/+xcBaTwqppcU0V52bih1yH7uUPj
         0Y0g==
X-Forwarded-Encrypted: i=1; AJvYcCXiFc2fAbe7TvHOeQHm6iVQD4TpoTM0oA5fSat7R5BKbsQSFl39ewbfiEh6giI82fErotKa7VEZ8YQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGqzQSc5CRDprfcDJ5/FLGn4fJtlaHv9gycDNR+ZfYYe4oXKP0
	GoULuwCx9x27SlbhauqCB8m/Z+8qwks3FMaMjG34vg9vBaipXilcW18gh2XqwdM=
X-Gm-Gg: ASbGncv3vU4xTDksKpqVW5rhCzpfMNMUe9ufGhMTk8wkjJ/RkeumfHDMVGn4VNArT77
	ne02XGJj+MbMV6TIUTEP9TLXNtXraqs0G1rOT8QDEVrwFYqKHMzCRpQINAA5z7zY2oI2LSjb2YQ
	A0vwlZY+/rxI0TTpKlGBiL8EKq6orHPi17Kg+Vwm1yhXET21waAsGVV0REyURmwXk33Ph0jqWBT
	llTr7GuwgY1P/44quTFcoCcYN+KjSMcpKCZBJoI6d+0G+fJpLNTe1zqgxELPw==
X-Google-Smtp-Source: AGHT+IEd3Voj97QjUCC8T2mznpMxbTLbRdt6fDN/yV+XnZv4JkSA2HFG4hid+6GiGQ53VtTaISRNYg==
X-Received: by 2002:a05:6000:10cd:b0:385:e429:e591 with SMTP id ffacd0b85a97d-38bf566e433mr1658936f8f.23.1737110415311;
        Fri, 17 Jan 2025 02:40:15 -0800 (PST)
Date: Fri, 17 Jan 2025 11:40:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Problems in PV dom0 on recent x86 hardware
Message-ID: <Z4ozjKIrT8tEi_wn@macbook.local>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
 <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
 <89d7b5a6-e971-4cd0-85df-0dd599d0ba1b@suse.com>
 <7d207d6c-d025-4fbb-8649-9c42224097f5@suse.com>
 <88db3cb6-2b7e-48b2-9bf4-d871067325a0@suse.com>
 <3d6d35ea-5044-4249-a277-0e5aa31ed888@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d6d35ea-5044-4249-a277-0e5aa31ed888@amd.com>

On Tue, Jul 09, 2024 at 09:08:11AM -0400, Jason Andryuk wrote:
> On 2024-07-09 06:56, Jürgen Groß wrote:
> > On 09.07.24 09:01, Jan Beulich wrote:
> > > On 09.07.2024 08:36, Jürgen Groß wrote:
> > > > On 09.07.24 08:24, Jan Beulich wrote:
> > > > > On 08.07.2024 23:30, Jason Andryuk wrote:
> > > > > >    From the backtrace, it looks like the immediate case
> > > > > > is just trying to
> > > > > > read a 4-byte version:
> > > > > > 
> > > > > >    >>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
> > > > > >    >>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
> > > > > >    >>>> [   44.575550]  ucsi_register+0x24/0xa0
> > > > > >    >>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
> > > > > > 
> > > > > > int ucsi_register(struct ucsi *ucsi)
> > > > > > {
> > > > > >            int ret;
> > > > > > 
> > > > > >            ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
> > > > > >                                  sizeof(ucsi->version));
> > > > > > 
> > > > > > ->read being ucsi_acpi_read()
> > > > > > 
> > > > > > However, the driver also appears write to adjacent addresses.
> > > > > 
> > > > > There are also corresponding write functions in the driver, yes, but
> > > > > ucsi_acpi_async_write() (used directly or indirectly) similarly calls
> > > > > ucsi_acpi_dsm(), which wires through to acpi_evaluate_dsm(). That's
> > > > > ACPI object evaluation, which isn't obvious without seeing the
> > > > > involved AML whether it might write said memory region.
> > > > 
> > > > I guess an ACPI dump would help here?
> > > 
> > > Perhaps, yes.
> > 
> > It is available in the bug report:
> > 
> > https://bugzilla.opensuse.org/show_bug.cgi?id=1227301
> 
> After acpixtract & iasl:
> 
> $ grep -ir FEEC *
> dsdt.dsl:   OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
> ssdt16.dsl: OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)
> 
> 
> from the DSDT:
>     Scope (\_SB.PCI0.LPC0.EC0)
>     {
>         OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
>         Field (ECMM, AnyAcc, Lock, Preserve)
>         {
>             TWBT,   2048
>         }
> 
>         Name (BTBF, Buffer (0x0100)
>         {
>              0x00                                             // .
>         })
>         Method (BTIF, 0, NotSerialized)
>         {
>             BTBF = TWBT /* \_SB_.PCI0.LPC0.EC0_.TWBT */
>             Return (BTBF) /* \_SB_.PCI0.LPC0.EC0_.BTBF */
>         }
>     }
> 
> From SSDT16:
> DefinitionBlock ("", "SSDT", 2, "LENOVO", "UsbCTabl", 0x00000001)
> {
>     External (_SB_.PCI0.LPC0.EC0_, DeviceObj)
> 
>     Scope (\_SB)
>     {
>         OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)
>         Field (SUSC, ByteAcc, Lock, Preserve)
>         {
> 
> 
> This embedded controller (?) seems to live at 0xfeec2xxx.

I've done some further research on this, and my current hypothesis is
that the region defined in 0xfeec2xxx contains at least the UCSI
shared mailbox, used for communication between ACPI and the OSPM.

This is a regular RAM region (iow: not MMIO), that's used to send and
receive UCSI commands with the mediation of ACPI.

The specification that defines the interface can be found at:

https://www.intel.com/content/dam/www/public/us/en/documents/white-papers/bios-implementation-of-ucsi.pdf

If my suspicion is correct, this is a purely software defined
interface, and hence not related to the chipset or the CPU in any way.

I will attempt to contact Lenovo to figure out which of their systems
place the mailbox in the 0xfeecxxxx range, and how we can detect
this.

I think such memory range should likely be defined in the memory map
with type EfiACPIMemoryNVS, so that we know it's presence and can map
it into the guest.  Otherwise this won't work with PVH dom0.

Regards, Roger.

