Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290578CF65
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 00:13:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592462.925176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb6x0-000515-0d; Tue, 29 Aug 2023 22:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592462.925176; Tue, 29 Aug 2023 22:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb6wz-0004yz-U5; Tue, 29 Aug 2023 22:12:41 +0000
Received: by outflank-mailman (input) for mailman id 592462;
 Tue, 29 Aug 2023 22:12:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jw1q=EO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qb6wy-0004yo-FN
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 22:12:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28646cad-46b9-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 00:12:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AA17628B9;
 Tue, 29 Aug 2023 22:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57394C433C8;
 Tue, 29 Aug 2023 22:12:33 +0000 (UTC)
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
X-Inumbo-ID: 28646cad-46b9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693347154;
	bh=sfTFmqPAK8/2t3BbY/pUrNhRVL+tb4h2eBQsKoRfVBs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gOGZgVCWVD4qSaCI1xBa8vb+HFS/PkIhASX9spUrBeHw5dWlhkqJvHiUbSyTyZCFR
	 TEePZsLuWQNmiRPB8p9dC4yGvu6ubFMqbEKBvLV5rlTa9fR/z0wRfqWx55Xhn/vlsg
	 baY80jQ3aQr2v/Xy4QuWZ5p3Y6EWUOZeIDGx4VlCba+ZXwyhX4VNt83hOgmWYc+Wvy
	 WWR3OiAixR2zCExC/4cKTI3I7lD3WYz/iIHYVEZV9ZvPxVPfz1+uJn/STztdhNQkBx
	 nzxFHmGuw9ynXHEfSQFfOon1zl1TQ2ROQ5FDIY3Bm0Ed4+pUpA3DyZ3mcm5Uq8IDxS
	 deEvo9jd0oDbQ==
Date: Tue, 29 Aug 2023 15:12:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony Chan <anthonychan@nureva.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    bertrand.marquis@arm.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    michal.orzel@amd.com, danwaqar@nureva.com, sstabellini@kernel.org
Subject: Re: xen arm64 low power sleep support
In-Reply-To: <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop>
References: <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1896914501-1693346801=:6458"
Content-ID: <alpine.DEB.2.22.394.2308291508260.6458@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1896914501-1693346801=:6458
Content-Type: text/plain; CHARSET=US-ASCII
Content-ID: <alpine.DEB.2.22.394.2308291508261.6458@ubuntu-linux-20-04-desktop>

On Tue, 29 Aug 2023, Anthony Chan wrote:
> Hi all,
> 
> My name is Tony and I've been researching/developing using Xen for potential upcoming uses in our embedded systems.  I started with Xen using Xilinx tools about a year ago and still have lots to learn about what it can to do in the embedded space.  So far, I've managed to integrate Xen and Linux into an existing product that exclusively runs bare-metal code on a ZynqMP SoC and migrate some of the functionality into custom Linux driver/userspace.
> 
> I'm now looking at low power support, for now at least between Xen (4.16) and Linux (5.15) dom0.  I've tried a few different Linux kernel configs around power management and each time I try to suspend from linux dom0 (via sysfs or systemctl), Xen will watchdog on dom0 guest.  AFAIK, Xen should trap on a 'WFI' from guests, but from what I can tell debugging through the linux suspend process is it's spinning in a 'suspend-to-idle' loop before it can get to issuing a 'WFI' or using PSCI interface to notify Xen.  I'm beginning to suspect that 'low power' support for embedded arm64 just isn't quite there yet, or am I missing something in the configs?
> 
> I realize this could very well be a Linux 'issue' but checking here first.  I know Xen presents a flattened device tree to Linux without CPU idle-state nodes and maybe this is causing the linux guest to only do the suspend-to-idle mode?  I should mention that I'm booting up using dom0less feature if that matters.


Hi Anthony,

Assuming you are using the default Xen command line parameters for
Xilinx boards: sched=null vwfi=native, then if the guest uses WFI, the
CPU will execute WFI directly and go into low power mode.

Given the issue you are describing, I am suspecting the guest is not
issuing WFI: that is simple and known to work. Instead, I suspect that
Linux might be trying to use PSCI_suspend in a way that is not supported
or well-implemented by Xen.

Can you check? You can add a printk in Linux
drivers/firmware/psci/psci.c:__psci_cpu_suspend or in Xen
xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend

If that is the case, the attached patch might work because it disables
PSCI_suspend support in Xen and Linux should fall back to WFI. (There is
no power saving in using PSCI_suspend versus WFI.)

Cheers,

Stefano
--8323329-1896914501-1693346801=:6458
Content-Type: text/x-diff; name=no-vpsci.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2308291512270.6458@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: attachment; filename=no-vpsci.patch

ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92cHNjaS5jIGIveGVuL2FyY2gv
YXJtL3Zwc2NpLmMNCmluZGV4IGQxNjE1YmU4YTYuLjlmNjYwYjhhYjQgMTAw
NjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vdnBzY2kuYw0KKysrIGIveGVuL2Fy
Y2gvYXJtL3Zwc2NpLmMNCkBAIC0xMTYsMjEgKzExNiw2IEBAIHN0YXRpYyB1
aW50MzJfdCBkb19wc2NpXzBfMl92ZXJzaW9uKHZvaWQpDQogICAgIHJldHVy
biBQU0NJX1ZFUlNJT04oMSwgMSk7DQogfQ0KIA0KLXN0YXRpYyByZWdpc3Rl
cl90IGRvX3BzY2lfMF8yX2NwdV9zdXNwZW5kKHVpbnQzMl90IHBvd2VyX3N0
YXRlLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJlZ2lzdGVyX3QgZW50cnlfcG9pbnQsDQotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnaXN0ZXJfdCBjb250ZXh0
X2lkKQ0KLXsNCi0gICAgc3RydWN0IHZjcHUgKnYgPSBjdXJyZW50Ow0KLQ0K
LSAgICAvKg0KLSAgICAgKiBQb3dlciBvZmYgcmVxdWVzdHMgYXJlIHRyZWF0
ZWQgYXMgcGVyZm9ybWluZyBzdGFuZGJ5DQotICAgICAqIGFzIHRoaXMgc2lt
cGxpZmllcyBYZW4gaW1wbGVtZW50YXRpb24uDQotICAgICAqLw0KLQ0KLSAg
ICB2Y3B1X2Jsb2NrX3VubGVzc19ldmVudF9wZW5kaW5nKHYpOw0KLSAgICBy
ZXR1cm4gUFNDSV9TVUNDRVNTOw0KLX0NCi0NCiBzdGF0aWMgaW50MzJfdCBk
b19wc2NpXzBfMl9jcHVfb2ZmKHZvaWQpDQogew0KICAgICByZXR1cm4gZG9f
cHNjaV9jcHVfb2ZmKDApOw0KQEAgLTIwMyw4ICsxODgsNiBAQCBzdGF0aWMg
aW50MzJfdCBkb19wc2NpXzFfMF9mZWF0dXJlcyh1aW50MzJfdCBwc2NpX2Z1
bmNfaWQpDQogICAgIHN3aXRjaCAoIHBzY2lfZnVuY19pZCApDQogICAgIHsN
CiAgICAgY2FzZSBQU0NJXzBfMl9GTjMyX1BTQ0lfVkVSU0lPTjoNCi0gICAg
Y2FzZSBQU0NJXzBfMl9GTjMyX0NQVV9TVVNQRU5EOg0KLSAgICBjYXNlIFBT
Q0lfMF8yX0ZONjRfQ1BVX1NVU1BFTkQ6DQogICAgIGNhc2UgUFNDSV8wXzJf
Rk4zMl9DUFVfT0ZGOg0KICAgICBjYXNlIFBTQ0lfMF8yX0ZOMzJfQ1BVX09O
Og0KICAgICBjYXNlIFBTQ0lfMF8yX0ZONjRfQ1BVX09OOg0KQEAgLTMxMiwx
OCArMjk1LDYgQEAgYm9vbCBkb192cHNjaV8wXzJfY2FsbChzdHJ1Y3QgY3B1
X3VzZXJfcmVncyAqcmVncywgdWludDMyX3QgZmlkKQ0KICAgICAgICAgcmV0
dXJuIHRydWU7DQogICAgIH0NCiANCi0gICAgY2FzZSBQU0NJXzBfMl9GTjMy
X0NQVV9TVVNQRU5EOg0KLSAgICBjYXNlIFBTQ0lfMF8yX0ZONjRfQ1BVX1NV
U1BFTkQ6DQotICAgIHsNCi0gICAgICAgIHVpbnQzMl90IHBzdGF0ZSA9IFBT
Q0lfQVJHMzIocmVncywgMSk7DQotICAgICAgICByZWdpc3Rlcl90IGVwb2lu
dCA9IFBTQ0lfQVJHKHJlZ3MsIDIpOw0KLSAgICAgICAgcmVnaXN0ZXJfdCBj
aWQgPSBQU0NJX0FSRyhyZWdzLCAzKTsNCi0NCi0gICAgICAgIHBlcmZjX2lu
Y3IodnBzY2lfY3B1X3N1c3BlbmQpOw0KLSAgICAgICAgUFNDSV9TRVRfUkVT
VUxUKHJlZ3MsIGRvX3BzY2lfMF8yX2NwdV9zdXNwZW5kKHBzdGF0ZSwgZXBv
aW50LCBjaWQpKTsNCi0gICAgICAgIHJldHVybiB0cnVlOw0KLSAgICB9DQot
DQogICAgIGNhc2UgUFNDSV8wXzJfRk4zMl9BRkZJTklUWV9JTkZPOg0KICAg
ICBjYXNlIFBTQ0lfMF8yX0ZONjRfQUZGSU5JVFlfSU5GTzoNCiAgICAgew0K

--8323329-1896914501-1693346801=:6458--

