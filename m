Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 837D1A6CA2F
	for <lists+xen-devel@lfdr.de>; Sat, 22 Mar 2025 13:52:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924403.1327795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvyJN-00044K-El; Sat, 22 Mar 2025 12:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924403.1327795; Sat, 22 Mar 2025 12:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvyJN-00041m-Ay; Sat, 22 Mar 2025 12:50:49 +0000
Received: by outflank-mailman (input) for mailman id 924403;
 Fri, 21 Mar 2025 19:10:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=su4e=WI=srs.euronap.de=SRS1=HXwZ=home.tangomaris.de==DDDU=WI=sl.nospam.tangomaris.de=xen-mailinglist@srs-se1.protection.inumbo.net>)
 id 1tvhl5-0008Qe-CI
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 19:10:19 +0000
Received: from mail.euronap.de (mail.euronap.de [84.38.78.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fd8b465-0688-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 20:10:17 +0100 (CET)
Received: from home.tangomaris.de
 (ip-130-180-058-238.um40.pools.vodafone-ip.de [130.180.58.238])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.euronap.de (Postfix) with ESMTPSA id 4ZKBpw0lrVz6tcS
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 20:10:16 +0100 (CET)
Received: from [192.168.222.26] (ip-109-091-129-157.um37.pools.vodafone-ip.de
 [109.91.129.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by gw.tangomaris.de (Postfix) with ESMTPSA id 4ZKBpv1NKsz3wrR
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 20:10:15 +0100 (CET)
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
X-Inumbo-ID: 1fd8b465-0688-11f0-9ffa-bf95429c2676
Message-ID: <f06ad622-4bb7-4a7d-9d11-a3c1456a4aa1@sl.nospam.tangomaris.de>
Date: Fri, 21 Mar 2025 20:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xen-devel@lists.xenproject.org
Content-Language: de-CH
From: Shen Long <xen-mailinglist@sl.nospam.tangomaris.de>
Subject: VIF network definition does not work with backend=domnet
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I use XEN on a gentoo home-lab/home-network server. I installed the Dom0 
with gentoo with a dedicated network card. I gave a spare network card 
on the machine to a dedicated network driver domain which also runs gentoo.

Now i discovered an issue with the VIF spec for new domUs.

Following problem. If i start a domu with a vif spec to connect to a 
backend domu it does fail with an error.
If i omit the vif spec, create the domu and immediately attach a network 
card with xl network-attach backend=netbackend it works.

Here's the netbackend.cfg, if i may forgot something:

 > name = "netbackend"
 > builder = "hvm"
 > vcpus = 4
 > memory = 4096
 > pci = [ '03:00.0' ]
 > disk = [ 'phy:/dev/mapper/xenhost-netbackend,xvda,w' ]
 > netif="yes"
 > usbdevice = [ "tablet" ]
 > serial = "pty"
 > on_poweroff = "destroy"
 > on_reboot = "restart"
 > on_crash = "restart"

My backend have several bridge-networks configured with associated 
network-vlans on my physical interface.
- home
- dmz
- foo
- infra

Here the test.cfg domu which "works":

name = "test"
builder = "hvm"
vcpus = 1
memory = 4096
#vif = [ 'backend=netbackend,bridge=dmz' ]
disk = [ 'file:/isos/systemrescue-11.03-amd64.iso,hda:cdrom,r' ]
usbdevice = [ "tablet" ]
serial = "pty"
on_poweroff = "destroy"
on_reboot = "restart"
on_crash = "restart"

It does not have a proper disk yet, because testing.
The Problem is, if i remove the hash from the vif spec, i get this error 
on `xl create test.cfg`:

# xl create /etc/xen/domuconfig/test.cnf
Parsing config from /etc/xen/domuconfig/test.cnf
libxl: error: libxl_dm.c:3157:device_model_spawn_outcome: Domain 
89:domain 89 device model: spawn failed (rc=-3)
libxl: error: libxl_dm.c:3377:device_model_postconfig_done: Domain 
89:Post DM startup configs failed, rc=-3
libxl: error: libxl_create.c:1937:domcreate_devmodel_started: Domain 
89:device model did not start: -3
libxl: error: libxl_aoutils.c:646:libxl__kill_xs_path: Device Model 
already exited
libxl: error: libxl_xshelp.c:206:libxl__xs_read_mandatory: xenstore read 
failed: `/libxl/89/type': No such file or directory
libxl: warning: libxl_dom.c:49:libxl__domain_type: unable to get domain 
type for domid=89, assuming HVM
libxl: error: libxl_domain.c:1616:domain_destroy_domid_cb: Domain 
89:xc_domain_destroy failed: No such process
libxl: error: libxl_domain.c:1133:domain_destroy_callback: Domain 
89:Unable to destroy guest
libxl: error: libxl_domain.c:1060:domain_destroy_cb: Domain 
89:Destruction of domain failed

As mentioned, i can comment out the vif spec and attach a network card 
with `xl network-attach test bridge=dmz backend=netbackend` which works 
perfectly fine. But i dont want to do it manually but instead use the 
auto feature to start my netbackend and have a little wait function in 
my xendomains init which does wait for netbackend to become available. 
To autostart all the systems when something failed.

Do i have an error in my setup or overlooked something?
Do you need more information to help here?
Do we have a proper bug in this scenario?
Or is it not implemented in that way, a missing feature or do i overlook 
something?

Best regards
Shen Long

