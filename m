Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A1564635D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 22:43:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456631.714408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p32Bp-0004Mc-FE; Wed, 07 Dec 2022 21:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456631.714408; Wed, 07 Dec 2022 21:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p32Bp-0004Jk-Bf; Wed, 07 Dec 2022 21:42:53 +0000
Received: by outflank-mailman (input) for mailman id 456631;
 Wed, 07 Dec 2022 21:42:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q5L1=4F=eikelenboom.it=linux@srs-se1.protection.inumbo.net>)
 id 1p32Bn-0004Je-Lx
 for xen-devel@lists.xen.org; Wed, 07 Dec 2022 21:42:51 +0000
Received: from server.eikelenboom.it (server.eikelenboom.it [91.121.65.215])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1834a3c2-7678-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 22:42:49 +0100 (CET)
Received: from 131-195-250-62.ftth.glasoperator.nl ([62.250.195.131]:37498
 helo=[172.16.1.50])
 by server.eikelenboom.it with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <linux@eikelenboom.it>)
 id 1p32Cr-00080a-64; Wed, 07 Dec 2022 22:43:57 +0100
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
X-Inumbo-ID: 1834a3c2-7678-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	Subject:Cc:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pnyuZgFg+xcx2S/BcdnBd13596bj5i02+Xe9V15Zwwk=; b=hPSvu2SMPFMrCBWzQxVSPHyrXR
	0bDNGNoTgJbGkbcTTvEzH6E1G0lfO16Yi9l4Pu1UAyfXKNjKUGwi+gxPSEAs8RgH0p0BGOuoEQhq3
	Yg1bbRfT/3PuhUcgBo6WwVIZnTWEyWlbI9wpAcvoq9H8erI44n8bUlV6sNHRwP2vd8tA=;
Message-ID: <2f364567-3598-2d86-ae3d-e0fabad4704a@eikelenboom.it>
Date: Wed, 7 Dec 2022 22:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: nl-NL, en-US
From: Sander Eikelenboom <linux@eikelenboom.it>
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>,
 Paul Durrant <paul@xen.org>
Cc: linux-kernel@vger.kernel.org, netdev <netdev@vger.kernel.org>
Subject: Xen + linux 6.1.0-rc8, network to guest VM not working after commit
 ad7f402ae4f466647c3a669b8a6f3e5d4271c84a fixing XSA-423
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross / Juergen,

I just updated my linux kernel to the latest of Linus his tree which included commit ad7f402ae4f466647c3a669b8a6f3e5d4271c84a fixing XSA-423.

Unfortunately when using this kernel I can't SSH anymore into the Xen guest I start, but I don't see any apparent failures either.
A straight revert of the commit ad7f402ae4f466647c3a669b8a6f3e5d4271c84a makes networking function normally again.

I have added some of the logging below, perhaps it at gives some idea off the state around the Xen network front and backend.

Any ideas or a test patch that I could run to shed some more light on what is going on ?

--
Sander




Some of the logging from dom0 dmesg:

[  149.520585] xen_bridge: port 1(vif1.0) entered blocking state
[  149.520594] xen_bridge: port 1(vif1.0) entered disabled state
[  149.520678] device vif1.0 entered promiscuous mode
[  151.221975] xen-blkback: backend/vbd/1/51712: using 1 queues, protocol 1 (x86_64-abi) persistent grants
[  151.601458] vif vif-1-0 vif1.0: Guest Rx ready
[  151.601476] xen_bridge: port 1(vif1.0) entered blocking state
[  151.601478] xen_bridge: port 1(vif1.0) entered forwarding state


output xenstore-ls regarding vif for the Guest:

     vif = ""
      1 = ""
       0 = ""
        bridge = "xen_bridge"
        feature-ctrl-ring = "1"
        feature-dynamic-multicast-control = "1"
        feature-gso-tcpv4 = "1"
        feature-gso-tcpv6 = "1"
        feature-ipv6-csum-offload = "1"
        feature-multicast-control = "1"
        feature-rx-copy = "1"
        feature-rx-flip = "0"
        feature-sg = "1"
        feature-split-event-channels = "1"
        feature-xdp-headroom = "1"
        frontend = "/local/domain/1/device/vif/0"
        frontend-id = "1"
        handle = "0"
        hotplug-status = "connected"
        ip = "192.168.1.6"
        mac = "00:16:3e:49:0e:fa"
        multi-queue-max-queues = "8"
        online = "1"
        script = "/etc/xen/scripts/vif-bridge"
        state = "4"
        type = "vif"

     vif = ""
      0 = ""
       backend = "/local/domain/0/backend/vif/1/0"
       backend-id = "0"
       event-channel-rx = "9"
       event-channel-tx = "8"
       feature-gso-tcpv4 = "1"
       feature-gso-tcpv6 = "1"
       feature-ipv6-csum-offload = "1"
       feature-rx-notify = "1"
       feature-sg = "1"
       handle = "0"
       mac = "00:16:3e:49:0e:fa"
       mtu = "1500"
       multi-queue-num-queues = "1"
       request-rx-copy = "1"
       rx-ring-ref = "524"
       state = "4"
       trusted = "1"
       tx-ring-ref = "523"
       xdp-headroom = "0"


ifconfig output for the guest interface on dom0 side:

vif1.0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
         ether fe:ff:ff:ff:ff:ff  txqueuelen 32  (Ethernet)
         RX packets 0  bytes 0 (0.0 B)
         RX errors 0  dropped 0  overruns 0  frame 0
         TX packets 49  bytes 2058 (2.0 KiB)
         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

