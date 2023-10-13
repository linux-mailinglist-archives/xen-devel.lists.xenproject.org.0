Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F187C8D5F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 20:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616884.959199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrNLN-0004op-Gl; Fri, 13 Oct 2023 18:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616884.959199; Fri, 13 Oct 2023 18:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrNLN-0004mH-Dl; Fri, 13 Oct 2023 18:57:05 +0000
Received: by outflank-mailman (input) for mailman id 616884;
 Fri, 13 Oct 2023 18:57:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdCY=F3=onlineschubla.de=paul@srs-se1.protection.inumbo.net>)
 id 1qrNLL-0004m9-ER
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 18:57:03 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 493f70f0-69fa-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 20:56:59 +0200 (CEST)
Received: from mail.onlineschubla.de by smtp.strato.de (RZmta 49.8.2 AUTH)
 with ESMTPSA id z04e5az9DIuwHBt
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Fri, 13 Oct 2023 20:56:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.onlineschubla.de (Postfix) with ESMTP id EFC3020201
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 20:56:57 +0200 (CEST)
Received: from mail.onlineschubla.de ([127.0.0.1])
 by localhost (mail.onlineschubla.de [127.0.0.1]) (amavis, port 10024)
 with ESMTP id JtDzbdNnpR9A for <xen-devel@lists.xenproject.org>;
 Fri, 13 Oct 2023 20:56:57 +0200 (CEST)
Received: from [10.0.0.105] (unknown [10.0.0.105])
 by mail.onlineschubla.de (Postfix) with ESMTPA id 23C0F201FE
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 20:56:57 +0200 (CEST)
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
X-Inumbo-ID: 493f70f0-69fa-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1697223418; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=nlnGS27nNLq8G6SfY/Ern3z7NzlFUZPkFyjAV6QeDF3m//+ewDB7E9xtsWvdu4iOqn
    iAKDXOlaSWA1ufgV+Idg+DAgrmrLj3uE4sg+BsVuJQa8efWlNhntgXeCJ7J2qrZWRhUD
    rIx2UFuevJEy7hADEtITCLFe/JNjh6HQ1dFUKJJO2lKE1Swr3kRqsWmQ/Moc5ocvHFkm
    bMnjPyoBr6P2Z1GdBhXVLfg5HaZj4mh6kLueAubzHz1OS5X6q1WiBwQxA0Rz7S8ykFii
    xMdxFqI8ko5+xqObcZIUcwwLmKSPILgFOknZLqwqYLoEjVVbR6C++fWPtOZ1NTlMfFc6
    FICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1697223418;
    s=strato-dkim-0002; d=strato.com;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=rPM9UIu8Z4nu9GZKT6wzyASjm7Mpby5M21hS1pCYVL4=;
    b=ROoFty1pHwqjIplQ2VN7HhKIXqoz/DlODrXJ/un0jx4wIbZV+ngCKiXL96r/DfBtVV
    SsmYI11hbSkDAd8fG7IW/XS8ijQCTOnfnrT9qcKUs7D2bJhI+aVTSOcr8C0l5IGfQk8o
    agGCUL9HescgzeIAele+cKtjD12Jusql34GzkPAY85iOjQ7fa/IUbTMhUU8JrACCyf5h
    Rb7CVSAp5/N+yfsBvFp4+tCsPKYWpWsinNA7dHMjgtsIebHl7vA83C8z4MuuQ0z2CSkD
    6eFv5qtXH7c7oeoRXQ1PFTVIBEC8a/kWnOQyGl5kL71uPVPPgDg//SiR4kgYK72gQj/h
    R7OA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1697223418;
    s=strato-dkim-0002; d=onlineschubla.de;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=rPM9UIu8Z4nu9GZKT6wzyASjm7Mpby5M21hS1pCYVL4=;
    b=cCgfms+ww8yy7TRKor12LMfM90hKXujcDPW9jk4kniNhFyHu+vQoHoSBohEMp9un79
    iR0Tw+DVi7dkehhett4216mLL/Y0c8kLEZIAxWusTB+G8lfxkbNX3WWaEV5adpGg2I+b
    sAM52YL2UqBC3clsVC8kjJabrEhydZF9gbXkzf0TCUTCLSOMbGEId3TWEhkOwvY9E8rm
    K0Aii4wc1okrsChNOJGGYKcirWhhfvRdSnCoDr58/HJzs7ZfPrJLAGwGBVsllZOvpzlu
    nxgzcZ0cBesoay4pybIgiQNEqa+2wQDULqlzGmvLgXrS0WB1CX/4ZRygC0kHFInwqmuk
    LgWg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1697223418;
    s=strato-dkim-0003; d=onlineschubla.de;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=rPM9UIu8Z4nu9GZKT6wzyASjm7Mpby5M21hS1pCYVL4=;
    b=5SIReZDpjI3RLjwayszzZclYUAuQ3Jp8P6JFIppxonYbJ3RIHhKStFW4y6utRmzIXi
    VmZB9wYZ0fzVtHs29KBQ==
X-RZG-AUTH: ":PG0ReWCndfO3rCSML4AvNaDxJ7WJyilEI/NMX3IPsStZLbcZC9mNZx0oO9uVFQeS3s1LjmLQbhqCfT7Y5US59JBuaW7yJI06LvhiTepDbg=="
X-Virus-Scanned: Debian amavis at onlineschubla.de
Message-ID: <838ff75f-1352-4d3c-9bc1-c7a57c828231@onlineschubla.de>
Date: Fri, 13 Oct 2023 20:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paul Leiber <paul@onlineschubla.de>
Subject: Xen 4.18rc/ARM64 on Raspberry Pi 4B: Traffic in DomU crashing Dom0
 when using VLANs
To: xen-devel@lists.xenproject.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xen developers list,

TL;DR:
------

Causing certain web server traffic on a secondary VLAN on Raspberry Pi 
under vanilla Debian/UEFI in combination with Xen leads to complete 
system reboot (watchdog triggering for Dom0). Other strange things are 
happening.

Description:
----------

I recently set up Xen (self compiled, Version 4.18-rc) on a Raspberry Pi 
4B (on vanilla Debian Bookworm, UEFI boot mode). Until some time ago, 
everything worked well with Dom0, one DomU and one bridge.

Then I wanted to actually make use of the virtualization and started to 
set up a second Debian Bookworm DomU (using xen-create-image) for 
monitoring my systems with zabbix (a webserver based system monitoring 
solution). The bridge used for this setup was the device bridging the 
hardware NIC. I installed zabbix, set it up, and everything went well, I 
could access the web interface without any problem.

Then I set up VLANs (initally using VLAN numbers 1 and 2) to separate 
network traffic between the DomUs. I made the existing device bridge 
VLAN 1 (bridge 1) and created a secondary device for bridging VLAN 2 
(bridge 2). Using only bridge 1 / VLAN 1 everything works well, I can 
access the zabbix web interface without any noticeable issue. After 
switching the zabbix DomU to VLAN 2 / bridge 2, everything seemingly 
keeps on working well, I can ping different devices in my network from 
the zabbix DomU and vice versa, I can ssh into the machine.

However, as soon as I remotely access the zabbix web interface, the 
complete system (DomUs and Dom0) becomes unresponsive and reboots after 
some time (usually seconds, sometimes 1-2 minutes). The reboot is 
reliably reproducable.

I didn't see any error message in any log (zabbix, DomU syslog, Dom0 
syslog) except for the following lines immediately before the system 
reboots on the Xen serial console:

(XEN) Watchdog timer fired for domain 0
(XEN) Hardware Dom0 shutdown: watchdog rebooting machine

As soon as I change the bridge to bridge 1 (with or without VLAN setup), 
the web interface is accessible again after booting the zabbix DomU, no 
reboots.

So I assume that causing specific traffic on the virtual NIC when using 
a VLAN setup with more than one VLAN under Xen makes the Dom0 system 
hard crash. Of course, there might be other causes that I'm not aware 
of, but to me, this seems to be the most likely explanation right now.

What I tried:
-------------

1. I changed the VLAN numbers. First to 101, 102, 103 etc. This was when 
I noticed another strange thing: VLANs with numbers >99 simply don't 
work on my Raspberry Pi under Debian, with or without Xen. VLAN 99 
works, VLAN 100 (or everything else >99 that I tried) doesn't work. If I 
choose a number >99, the VLAN is not configured, "ip a" doesn't list it. 
Other Debian systems on x64 architecture don't show this behavior, 
there, it was no problem to set up VLANs > 99. Therefore, I've changed 
the VLANs to 10, 20, 30 etc., which worked. But it didn't solve the 
initial problem of the crashing Dom0 and DomUs.

2. Different bridge options, without noticable effect:
bridge_stp off      # dont use STP (spanning tree proto)
bridge_waitport 0   # dont wait for port to be available
bridge_fd 0         # no forward delay

3. Removing IPv6: No noticable effect.

4. Network traffic analysis: Now, here it becomes _really_ strange. I 
started tcpdumps on Dom0, and depending on on which interface/bridge 
traffic was logged, the problem went away, meaning, the DomU was running 
smoothly for hours, even when accessing the zabbix web interface. 
Stopping the log makes the system crash (as above, after seconds up to 
1-2 minutes) reproducably if I access the zabbix web interface.

Logging enabcm6e4ei0 (NIC): no crashes
Logging enabcm6e4ei0.10 (VLAN 10): instant crash
Logging enabcm6e4ei0.20 (VLAN 20): no crashes
Logging xenbr0 (on VLAN 10): instant crash
Logging xenbr1 (on VLAN 20): no crashes

I am clinging to the thought that there must be a rational explanation 
for why logging the traffic on certain interfaces/bridges should avoid 
the crash of the complete system, while logging other interfaces/bridges 
doesn't. I myself can't think of one.

I checked the dumps of enabcm6e4ei0.10 and xenbr0 (where the system 
crashes) with wireshark, nothing sticks out to me (but I am really no 
expert in analyzing network traffic). Dumps can be provided.

5. Watchdog: I tried to dig deeper into the cause for the watchdog 
triggering. However, I didn't find any useful documentation on the web 
on how the watchdog works or how to enable logging.

6. Eliminating Xen as cause: I booted the Debian system (which in Xen 
setup would be Dom0) without Xen and set it up to use the VLAN 20 bridge 
(the same that leads to a reboot when using it in the DomU) as primary 
network interface. Everything seemed to be working, I could download 
large files from the internet without any problem. Setting up Zabbix on 
the base Debian system showed that the same setup (VLANs 10 and 20, 
bridges 1 and 2, using bridge 2 as interface for Zabbix) without Xen is 
working reliably, no reboots. This points to some Xen related component 
being the root cause, I think.

7. Eliminating Apache as root cause: Reloading the Apache starting page 
hosted on DomU several times per second didn't lead to a reboot.

8. Recompiling Xen: Independent of which Xen master branch version I was 
using (all 4.18), the behavior was the same. I didn't get Xen working on 
ARM64/UEFI in version 4.17.

Current situation:
------------------

I am out of ideas what to do next. Everything that was recommended to me 
on xen-users didn't lead to significant insight or solve the problem.

I'd appreciate any hints how to troubleshoot this and/or how to proceed 
otherwise.

Thanks,

Paul


xl info:

host                   : ***
release                : 6.1.0-13-arm64
version                : #1 SMP Debian 6.1.55-1 (2023-09-29)
machine                : aarch64
nr_cpus                : 4
max_cpu_id             : 3
nr_nodes               : 1
cores_per_socket       : 1
threads_per_core       : 1
cpu_mhz                : 54.000
hw_caps                : 
00000000:00000000:00000000:00000000:00000000:00000000:0
virt_caps              : hvm hap vpmu gnttab-v1
arm_sve_vector_length  : 0
total_memory           : 8043
free_memory            : 4829
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 18
xen_extra              : -rc
xen_version            : 4.18-rc
xen_caps               : xen-3.0-aarch64 xen-3.0-armv7l
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=0x0
xen_changeset          : Tue Sep 19 12:13:50 2023 +0100 git:dc9d9aa62d
xen_commandline        : placeholder dom0_mem=1024M,max:1024M 
console=dtuart dtu
cc_compiler            : gcc (Debian 12.2.0-14) 12.2.0
cc_compile_by          : root
cc_compile_domain      : xxx.onlineschubla.de
cc_compile_date        : Fri Oct 13 16:01:16 CEST 2023
build_id               : 1d92e27e22e82c09edcb6c178cc09c6e390d031d
xend_config_format     : 4




cat /etc/network/interfaces (with VLAN setup, redacted for IPs):

# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto enabcm6e4ei0
iface enabcm6e4ei0 inet manual
iface enabcm6e4ei0 inet6 manual

#VLAN LAN
auto enabcm6e4ei0.10
iface enabcm6e4ei0.10 inet manual

#VLAN DMZ_LAN
auto enabcm6e4ei0.20
iface enabcm6e4ei0.20 inet manual

#Bridge LAN
auto xenbr0
iface xenbr0 inet static
         bridge_ports enabcm6e4ei0.10
         address *.*.*.*/24
         gateway *.*.*.*

iface xenbr0 inet6 static
         bridge_ports enabcm6e4ei0.10
         address *::*/64
         gateway *::*
         # use SLAAC al IPv6 address from the router
         # we may notv6 forwarding, otherwise SLAAC ged
         autoconf 1
         accept_ra 2

#Bridge DMZ_LAN
auto xenbr1
iface xenbr1 inet manual
         bridge_ports enabcm6e4ei0.20

