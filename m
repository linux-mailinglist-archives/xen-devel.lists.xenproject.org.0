Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDAF7D2129
	for <lists+xen-devel@lfdr.de>; Sun, 22 Oct 2023 07:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620614.966198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quREa-0001mn-6U; Sun, 22 Oct 2023 05:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620614.966198; Sun, 22 Oct 2023 05:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quREa-0001ja-2t; Sun, 22 Oct 2023 05:42:44 +0000
Received: by outflank-mailman (input) for mailman id 620614;
 Sun, 22 Oct 2023 05:42:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p64B=GE=onlineschubla.de=paul@srs-se1.protection.inumbo.net>)
 id 1quREX-0001jU-Hf
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 05:42:41 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.216]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceecae90-709d-11ee-98d5-6d05b1d4d9a1;
 Sun, 22 Oct 2023 07:42:39 +0200 (CEST)
Received: from mail.onlineschubla.de by smtp.strato.de (RZmta 49.9.0 AUTH)
 with ESMTPSA id D2f08ez9M5gbYDS
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Sun, 22 Oct 2023 07:42:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.onlineschubla.de (Postfix) with ESMTP id 9F4602041C
 for <xen-devel@lists.xenproject.org>; Sun, 22 Oct 2023 07:42:36 +0200 (CEST)
Received: from mail.onlineschubla.de ([127.0.0.1])
 by localhost (mail.onlineschubla.de [127.0.0.1]) (amavis, port 10024)
 with ESMTP id UUkbtpFliE-g for <xen-devel@lists.xenproject.org>;
 Sun, 22 Oct 2023 07:42:35 +0200 (CEST)
Received: from [10.0.0.105] (unknown [10.0.0.105])
 by mail.onlineschubla.de (Postfix) with ESMTPA id CDB8A2014E
 for <xen-devel@lists.xenproject.org>; Sun, 22 Oct 2023 07:42:35 +0200 (CEST)
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
X-Inumbo-ID: ceecae90-709d-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; t=1697953357; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OpVNgH2q7GNw4n5UJ5FcToGUb3QsKBeBGpnRG9lErC/4e5b+VqFLFQNbZlWEfYuA7D
    QNDOz98wYApXFW265Hke8RnYCBvCzjs9GERMMuB+bz6jYOWglcc7DHSmv4+hCA6DO4RJ
    MBCtjn1n6y+xfO32A7ghKL40UAiQz6JsF71B3+EB6WesqpsY/ytS4VXNobaIyjipJ2hP
    uNxejU8bR91uMToQaErps0BRv6HcyVeQwFfNV2oHo4+FoYta8vSJbIoB5xzL+CQEGdUd
    w+9MszclM7ioYUyxXcyWUYygUmJ2WslJ5JeSgFSYi3Weo4X4CA1oJNzXlUSUiVaW3KP5
    k4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1697953357;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=FMyl1xyUW4qutqIUs7FKVX7LtYK58Kaave651uAIUiM=;
    b=Rq/ylbBwjnMTFzm4bJSsOcWCSFbI/El8Jjgj53i6llZkeWXvEl9sAwNeGszp7UIlT/
    Bg7GFtKXQp8/RkfCG6oOz709xqITuT4sWRLkwg4Kk8sP8PXyl0pWElufWtg8X2gjTRsn
    Wp+Iqnxic6MSClnq6veOD+m+WtLKd2UkQfuZX6SNv8OOmMHNZWBX1HyzvI7C38rTKe8R
    oZ8mGdY1iFMfLJ0QscgpAfqQEH/saBIk6N0mXd+vymJUE/TlX8S1rkxSyWG9T9uVKGkd
    PIKWlzKataubaI7a2Ji4wOZTFlcxYRCVedwzM8PYhiZk5PDKbM3dk2EsmslUTLKxpa9X
    AoAg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1697953357;
    s=strato-dkim-0002; d=onlineschubla.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=FMyl1xyUW4qutqIUs7FKVX7LtYK58Kaave651uAIUiM=;
    b=QdUbPqhhU50x4GgcqskjQS2999hYaxgySOckGcoYuap0I5zElctXIikFI81AeEWTiL
    JIxu1vcGUCGowqrT+gQsml5RtAnIkcj4LGI1pbuKZMToe16+dcnJ332llFLHIcjI5aoO
    oVKEy5/tsbPsLyqMdCq4xWdPAI/V8njpmppU6S7zfGtNQUd4qwFCfIvhOAhW5oVjfvcb
    xaQvygvzMXuGS6zn87ZZD9t//yOo/xNtuMmsEq8uO5BMBnkxTcGYyFoO5A+jXLwqTZ1J
    ol10+AvnNqyq4+G6j3rosU3a2Unc9+lBxCBrlUSTbHHnmogdbfxR9Ow23WYg+wX4PT3X
    cd0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1697953357;
    s=strato-dkim-0003; d=onlineschubla.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=FMyl1xyUW4qutqIUs7FKVX7LtYK58Kaave651uAIUiM=;
    b=KQcF12Cke/YFs3T9TkOtgD8iFDMxxWUpbuwHmdleBdCtrExZUqZeFP23n/00OPhgRI
    EAPWwzHPt6COBPdRqaCg==
X-RZG-AUTH: ":PG0ReWCndfO3rCSML4AvNaDxJ7WJyilEI/NMX3IPsStZLbcZC9mNZx0oO9uVFQeS3s1LjmLVPhrpXKQbsRW8lhx0FIeSG/QvumcK+dsPUA=="
X-Virus-Scanned: Debian amavis at onlineschubla.de
Message-ID: <4cddfd89-f195-4a50-a14d-b86121414e56@onlineschubla.de>
Date: Sun, 22 Oct 2023 07:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18rc/ARM64 on Raspberry Pi 4B: Traffic in DomU crashing
 Dom0 when using VLANs
Content-Language: en-US
From: Paul Leiber <paul@onlineschubla.de>
To: xen-devel@lists.xenproject.org
References: <838ff75f-1352-4d3c-9bc1-c7a57c828231@onlineschubla.de>
In-Reply-To: <838ff75f-1352-4d3c-9bc1-c7a57c828231@onlineschubla.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.10.2023 um 20:56 schrieb Paul Leiber:
> Hi Xen developers list,
> 
> TL;DR:
> ------
> 
> Causing certain web server traffic on a secondary VLAN on Raspberry Pi 
> under vanilla Debian/UEFI in combination with Xen leads to complete 
> system reboot (watchdog triggering for Dom0). Other strange things are 
> happening.
> 
> Description:
> ----------
> 
> I recently set up Xen (self compiled, Version 4.18-rc) on a Raspberry Pi 
> 4B (on vanilla Debian Bookworm, UEFI boot mode). Until some time ago, 
> everything worked well with Dom0, one DomU and one bridge.
> 
> Then I wanted to actually make use of the virtualization and started to 
> set up a second Debian Bookworm DomU (using xen-create-image) for 
> monitoring my systems with zabbix (a webserver based system monitoring 
> solution). The bridge used for this setup was the device bridging the 
> hardware NIC. I installed zabbix, set it up, and everything went well, I 
> could access the web interface without any problem.
> 
> Then I set up VLANs (initally using VLAN numbers 1 and 2) to separate 
> network traffic between the DomUs. I made the existing device bridge 
> VLAN 1 (bridge 1) and created a secondary device for bridging VLAN 2 
> (bridge 2). Using only bridge 1 / VLAN 1 everything works well, I can 
> access the zabbix web interface without any noticeable issue. After 
> switching the zabbix DomU to VLAN 2 / bridge 2, everything seemingly 
> keeps on working well, I can ping different devices in my network from 
> the zabbix DomU and vice versa, I can ssh into the machine.
> 
> However, as soon as I remotely access the zabbix web interface, the 
> complete system (DomUs and Dom0) becomes unresponsive and reboots after 
> some time (usually seconds, sometimes 1-2 minutes). The reboot is 
> reliably reproducable.
> 
> I didn't see any error message in any log (zabbix, DomU syslog, Dom0 
> syslog) except for the following lines immediately before the system 
> reboots on the Xen serial console:
> 
> (XEN) Watchdog timer fired for domain 0
> (XEN) Hardware Dom0 shutdown: watchdog rebooting machine
> 
> As soon as I change the bridge to bridge 1 (with or without VLAN setup), 
> the web interface is accessible again after booting the zabbix DomU, no 
> reboots.
> 
> So I assume that causing specific traffic on the virtual NIC when using 
> a VLAN setup with more than one VLAN under Xen makes the Dom0 system 
> hard crash. Of course, there might be other causes that I'm not aware 
> of, but to me, this seems to be the most likely explanation right now.
> 
> What I tried:
> -------------
> 
> 1. I changed the VLAN numbers. First to 101, 102, 103 etc. This was when 
> I noticed another strange thing: VLANs with numbers >99 simply don't 
> work on my Raspberry Pi under Debian, with or without Xen. VLAN 99 
> works, VLAN 100 (or everything else >99 that I tried) doesn't work. If I 
> choose a number >99, the VLAN is not configured, "ip a" doesn't list it. 
> Other Debian systems on x64 architecture don't show this behavior, 
> there, it was no problem to set up VLANs > 99. Therefore, I've changed 
> the VLANs to 10, 20, 30 etc., which worked. But it didn't solve the 
> initial problem of the crashing Dom0 and DomUs.
> 
> 2. Different bridge options, without noticable effect:
> bridge_stp off      # dont use STP (spanning tree proto)
> bridge_waitport 0   # dont wait for port to be available
> bridge_fd 0         # no forward delay
> 
> 3. Removing IPv6: No noticable effect.
> 
> 4. Network traffic analysis: Now, here it becomes _really_ strange. I 
> started tcpdumps on Dom0, and depending on on which interface/bridge 
> traffic was logged, the problem went away, meaning, the DomU was running 
> smoothly for hours, even when accessing the zabbix web interface. 
> Stopping the log makes the system crash (as above, after seconds up to 
> 1-2 minutes) reproducably if I access the zabbix web interface.
> 
> Logging enabcm6e4ei0 (NIC): no crashes
> Logging enabcm6e4ei0.10 (VLAN 10): instant crash
> Logging enabcm6e4ei0.20 (VLAN 20): no crashes
> Logging xenbr0 (on VLAN 10): instant crash
> Logging xenbr1 (on VLAN 20): no crashes
> 
> I am clinging to the thought that there must be a rational explanation 
> for why logging the traffic on certain interfaces/bridges should avoid 
> the crash of the complete system, while logging other interfaces/bridges 
> doesn't. I myself can't think of one.
> 
> I checked the dumps of enabcm6e4ei0.10 and xenbr0 (where the system 
> crashes) with wireshark, nothing sticks out to me (but I am really no 
> expert in analyzing network traffic). Dumps can be provided.
> 
> 5. Watchdog: I tried to dig deeper into the cause for the watchdog 
> triggering. However, I didn't find any useful documentation on the web 
> on how the watchdog works or how to enable logging.
> 
> 6. Eliminating Xen as cause: I booted the Debian system (which in Xen 
> setup would be Dom0) without Xen and set it up to use the VLAN 20 bridge 
> (the same that leads to a reboot when using it in the DomU) as primary 
> network interface. Everything seemed to be working, I could download 
> large files from the internet without any problem. Setting up Zabbix on 
> the base Debian system showed that the same setup (VLANs 10 and 20, 
> bridges 1 and 2, using bridge 2 as interface for Zabbix) without Xen is 
> working reliably, no reboots. This points to some Xen related component 
> being the root cause, I think.
> 
> 7. Eliminating Apache as root cause: Reloading the Apache starting page 
> hosted on DomU several times per second didn't lead to a reboot.
> 
> 8. Recompiling Xen: Independent of which Xen master branch version I was 
> using (all 4.18), the behavior was the same. I didn't get Xen working on 
> ARM64/UEFI in version 4.17.
> 
> Current situation:
> ------------------
> 
> I am out of ideas what to do next. Everything that was recommended to me 
> on xen-users didn't lead to significant insight or solve the problem.
> 
> I'd appreciate any hints how to troubleshoot this and/or how to proceed 
> otherwise.

O.k., let's try to break that issue down.

Firstly, how can I get more information on why the Xen watchdog 
triggers? Is there documentation? Are there any logs? I couldn't find 
anything useful with my search skills.

Thanks,

Paul

