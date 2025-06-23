Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE5AE3A93
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 11:35:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022231.1398006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTdZX-0001z5-NQ; Mon, 23 Jun 2025 09:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022231.1398006; Mon, 23 Jun 2025 09:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTdZX-0001wa-Ka; Mon, 23 Jun 2025 09:34:39 +0000
Received: by outflank-mailman (input) for mailman id 1022231;
 Mon, 23 Jun 2025 09:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pCbt=ZG=bounce.vates.tech=bounce-md_30504962.68591faa.v1-86199166e7834da7b4ec58d0830bf01d@srs-se1.protection.inumbo.net>)
 id 1uTdZW-0001wU-9o
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 09:34:38 +0000
Received: from mail134-21.atl141.mandrillapp.com
 (mail134-21.atl141.mandrillapp.com [198.2.134.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46566fe8-5015-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 11:34:36 +0200 (CEST)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-21.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4bQjbG4c41z1XLKX6
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 09:34:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 86199166e7834da7b4ec58d0830bf01d; Mon, 23 Jun 2025 09:34:34 +0000
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
X-Inumbo-ID: 46566fe8-5015-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1750671274; x=1750941274;
	bh=P4fhwE3VYXnDsfELkjXjUkb3uj5MC1QamYNAuLU3HiI=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xa/bEEPlcjcIiWZ2ygq3E+4bw6Jc+NPgJdwOnradV3NdAvHJMaYYS8cagNexuOQAX
	 i0fguebEoGaOHuyYihXQKDP6Y2C+DLhPnDGpeQbHLySoV6fZk2Wg8USycq7SRSx/li
	 fYLvqT2rZNdNPccXI4JnkH9VjXL52Z4nra82msAEGw9cc2OkB+RT7k1v2V+cyZUMqx
	 od52VvTYcxZG6HYogiCEqjqZfxyBX+doLX+4PFY8wm3We0QUghFux8BE7WOl6L1vRJ
	 3X6zhkwPeDys5GmS3C1jx0ogym+utI6Oqmdc1fHvK4LUe1nrpIrGrbeOPTyWg0hDjk
	 HQHzmQUaC7jLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1750671274; x=1750931774; i=yann.sionneau@vates.tech;
	bh=P4fhwE3VYXnDsfELkjXjUkb3uj5MC1QamYNAuLU3HiI=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FGBD35AtflttdwUbCcusgIvo5Hva5sdUYQ2zzBkXDv0GIvO7Vod9nBfyMboUj1DZ3
	 WYggiS761sFZD+YnANl55o3PLxLuEoZWwB6UGv3PcjhJW/Yj0P1lxn74AMy07Oa1D1
	 bXNv7yuufE6RNX9clvG6Vn9LhqVpa8fnVM8KJJXvBNZx/xUlEvfhAs5GO5RJ6jqaQd
	 /dNbJEQ0WiHtEhCNgLzKt9zHQB++GpSpqdA1phG5PY7Hpwhc0XK0rHlowbJIbPhP4K
	 pKEFB6PMAGf9uVxAStdDgj7v0Cx6+WneqbNARJtqg0RHpoHt6unHcjA0c7wXkxTgXo
	 6+byRUJi8YZrA==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1]=20xen:=20fusa:=20arch=5Fspecs:=20Definition=20of=20the=20Virtual=20Machines'=20roles?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1750671273964
Message-Id: <c4e67301-22e4-464a-ae95-cd49f6df47f5@vates.tech>
To: xen-devel@lists.xenproject.org
References: <20250304183115.2509666-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20250304183115.2509666-1-ayan.kumar.halder@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.86199166e7834da7b4ec58d0830bf01d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250623:md
Date: Mon, 23 Jun 2025 09:34:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Ayan, Stefano,

This doc looks nice overall!

However I do think that maybe the role part should be separate from all 
the explanations about virtio.

I would say virtio deserves its own page.

Also, I'm curious what "FFI" is.

Thanks!

Regards,

Yann

On 3/4/25 19:31, Ayan Kumar Halder wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> Define "Hardware Domain", "Control Domain", "DomUs", "SafeVMs" and
> "UnsafeVMs".
>
> Explain the limitations that VirtIO introduces and the way they affect
> the defined roles.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   docs/fusa/arch_specs/roles.rst | 200 +++++++++++++++++++++++++++++++++
>   docs/fusa/index.rst            |   1 +
>   2 files changed, 201 insertions(+)
>   create mode 100644 docs/fusa/arch_specs/roles.rst
>
> diff --git a/docs/fusa/arch_specs/roles.rst b/docs/fusa/arch_specs/roles.rst
> new file mode 100644
> index 0000000000..0b3fe821c3
> --- /dev/null
> +++ b/docs/fusa/arch_specs/roles.rst
> @@ -0,0 +1,200 @@
> +===============================
> +Xen Domain Roles and Privileges
> +===============================
> +
> +Roles
> +=====
> +
> +We define the following roles that Xen domains can have:
> +- Hardware Domain
> +- Control Domain
> +- DomU
> +
> +In addition, we classify domains based on the criticality of the tasks
> +they perform:
> +- SafeVM
> +- UnSafeVM
> +
> +DomU
> +----
> +
> +A DomU is a regular domain without extra privileges to perform
> +operations that affect other domains or the entire platform. A DomU is
> +therefore unprivileged and can only affect itself.
> +
> +Hardware Domain
> +---------------
> +
> +The Hardware Domain is a domain that has direct access to all hardware
> +peripherals by default, except for those controlled by Xen (CPU, MMU,
> +IOMMU, Interrupt Controller, Timers, UART). Hardware resources can be
> +directly assigned to other domains ("passthrough"), but the default is
> +that they get assigned to the Hardware Domain. As such, there can only
> +be one Hardware Domain in the system. The Hardware Domain is not
> +privileged: it cannot perform operations that affect other domains or
> +the entire platform.
> +
> +In cases where VirtIO is used to share access to physical devices among
> +multiple domains, the Hardware Domain requires some limited privileges
> +to run the VirtIO backends.
> +
> +Control Domain
> +--------------
> +
> +The Control Domain has full privileges over the system. As such, it can
> +perform privileged operations, typically implemented as hypercalls, that
> +affect other domains and even the entire platform, such as platform
> +reboot. There can only be one Control Domain in the system. A
> +non-exhaustive list of these operations follows:
> +
> +- Reboot other domains
> +- Reboot and shutdown the platform
> +- Suspend/resume other domains
> +- Pause/unpause other domains
> +
> +The Control Domain is optional.
> +
> +SafeVMs and UnSafeVMs
> +---------------------
> +
> +A SafeVM is a domain running a safety-critical task. An UnsafeVM is a
> +domain running non-safety-critical software only. No safety-critical
> +tasks are running in the UnsafeVM.
> +
> +The Control Domain must be a SafeVM because the Control Domain has
> +enough privileges to affect the entire system.
> +
> +Without VirtIO (see below), both the Hardware Domain and DomUs can be
> +SafeVMs or UnsafeVMs. There are no restrictions. For example, the
> +following configuration is compatible with safety:
> +
> +- Hardware Domain: UnsafeVM
> +- 2x DomU: SafeVMs
> +- 2x DomU: UnsafeVMs
> +
> +Privileges
> +==========
> +
> +Full Privileges
> +---------------
> +
> +A domain with full privileges has unrestricted access to all services
> +provided by Xen, including the ability to perform operations that impact
> +other VMs and the entire platform. Only one domain holds these full
> +privileges: the Control Domain.
> +
> +Unprivileged
> +------------
> +
> +An Unprivileged domain lacks special access rights, allowing it to
> +perform only operations that affect itself without impacting other
> +domains. For example, an Unprivileged domain cannot map the memory of
> +another domain.
> +
> +VirtIO Privileges
> +-----------------
> +
> +Domains running VirtIO backends, such as QEMU, require specific
> +privileges over domains with VirtIO frontends to enable proper
> +functionality. For instance, they need permission to map the memory of
> +the domain with the VirtIO frontend. These additional privileges are
> +necessary for standard VirtIO operation but can be removed when using
> +the VirtIO extensions described in the VirtIO chapter. This is the list
> +of VirtIO privileges:
> +- mapping memory of VirtIO frontend domains (foreign map hypercall)
> +- device model hypercalls targeting VirtIO frontend domains
> +
> +VirtIO
> +======
> +
> +VirtIO is a specification and set of drivers to share a physical device
> +among multiple domains. For example, assuming the Hardware Domain has
> +access to an Ethernet device, VirtIO provides a way for the Hardware
> +Domain to allow one or more DomUs to access the Ethernet device.
> +
> +VirtIO is based on a frontend/backend architecture: the frontend is a
> +driver similar to a regular Ethernet device driver (using Ethernet as an
> +example), running in the DomU. The backend is a "proxy" driver running
> +in the same domain as the device driver and have direct access to the
> +device. That domain is typically the Hardware Domain because it is the
> +default domain for hardware assignment, but it is also possible to run
> +VirtIO backends in other domains, provided they have been configured with
> +passthrough access to a physical device. These other domains are called
> +"Driver Domains," and the limitations discussed in the context of VirtIO
> +for the Hardware Domain also apply to Driver Domains.
> +
> +There are multiple issues in VirtIO that affect freedom from
> +interference, so deploying VirtIO introduces limits on the configuration
> +regarding what domains can run safety-critical workloads.
> +
> +It is important to note that VirtIO is not the only way for domains to
> +communicate with each other. Specifically, there are other protocols
> +such as Argo and plain shared memory that do not have the same
> +interference concerns.
> +
> +FFI: Shared Memory and Interrupts
> +---------------------------------
> +
> +All VirtIO protocols are based on ring buffers over shared memory,
> +called "VirtQueues." Although there are well-known methods to set up
> +ring buffers over shared memory that are free from interference, in
> +practice, the existing VirtIO specification and current frontend/backend
> +driver implementations do not follow these best practices. Thus, the
> +ring buffers over shared memory can be a source of interference.
> +
> +Given the current state of the VirtIO specification and drivers, it is
> +recommended that both VirtIO frontends and backends run in UnsafeVMs
> +only. This way, SafeVMs will not be affected by interference caused by
> +VirtIO protocols.
> +
> +As ring buffers exist over memory shared between domains, it is the
> +domains' responsibility to ensure they are safe. This is outside of
> +Xen's responsibility, and out of scope for this document.
> +
> +FFI: Memory Mappings
> +--------------------
> +
> +VirtIO expects the backend to access ("map") arbitrary memory addresses
> +passed by the frontend. In other words, the backend needs to map any
> +memory of the frontend, which is a privileged operation in Xen.
> +
> +Xen implements a Xen-specific extension to VirtIO to address this issue:
> +"VirtIO with Grants."
> +
> +Xen has a feature called the "grant table" that guests can use to
> +voluntarily share individual memory pages with other domains. This way,
> +the backend does not need the privilege to map any memory page of the
> +domain running the frontend, as the frontend whitelists pages for the
> +backend to access.
> +
> +Unless "VirtIO with Grants" is used, to enable VirtIO, a domain with
> +VirtIO backends (the Hardware Domain or a Driver Domain) is given the
> +extra privilege of being able to map any memory of domains with VirtIO
> +frontends.  As this is a source of interference, only UnsafeVMs can run
> +VirtIO frontends without "VirtIO with Grants".
> +
> +FFI: Synchronous Emulation
> +--------------------------
> +
> +VirtIO expects certain operations to be synchronous: the frontend
> +virtual CPU requesting the operation is fully blocked until the backend
> +completes the operation. If the backend does nothing, the frontend vCPU
> +remains blocked. This is a source of interference.
> +
> +When VirtIO is enabled, the domain with the backends (Hardware Domain or
> +Driver Domain) implements these synchronous operations for domains
> +running VirtIO frontends.
> +
> +Xen implements a Xen-specific extensions to VirtIO to address this
> +issue: "non-blocking VirtIO." Two extra virtio-pci registers are
> +provided, allowing the frontend to perform non-blocking operations. By
> +using the two Xen-specific non-blocking registers, the frontend virtual
> +CPU doesn't have to block while waiting for the backend to complete the
> +operations.
> +
> +Unless "non-blocking VirtIO" is used, to enable VirtIO, a domain with
> +VirtIO backends (the Hardware Domain or a Driver Domain) is given the
> +extra privilege of being able to implement these synchronous operations
> +for domains running VirtIO frontends. As this is a source of
> +interference, only UnsafeVMs can run VirtIO frontends without
> +"non-blocking VirtIO."
> diff --git a/docs/fusa/index.rst b/docs/fusa/index.rst
> index 5f1e8acfc4..9d989f5105 100644
> --- a/docs/fusa/index.rst
> +++ b/docs/fusa/index.rst
> @@ -7,3 +7,4 @@ Functional Safety documentation
>      :maxdepth: 2
>   
>      reqs/index
> +   arch_specs/roles


Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


