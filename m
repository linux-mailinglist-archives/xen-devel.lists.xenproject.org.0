Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6271BA566
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 15:51:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT4AE-0004ru-HF; Mon, 27 Apr 2020 13:51:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X1yy=6L=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jT4AC-0004rp-NR
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 13:51:12 +0000
X-Inumbo-ID: 26f5ef64-888e-11ea-b9cf-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26f5ef64-888e-11ea-b9cf-bc764e2007e4;
 Mon, 27 Apr 2020 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587995471;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=UcWnhtSZ6cC6QO5mr6qFRlLEE54J/LZMNHSoYiv0dwM=;
 b=g4b+SkqIvwsf/2FlAmLK3hh042BAywa1rlLxntLq9CGnNmcHuPen21xn
 VG5ghL9MLuM0F8duhp0OVCEqxunxXEDp1wKwhad+8D053LPlKzdVM9WLx
 Dl7nnIded5nceEATTWE287iR24he68EVbQcp3xkEAqvMl1XhdmYAyZwZD A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: URtzDiMgmtSMA4aYWDr6tyjtUQnvWNKUzq4tQrxlpfupUqhI/kMqD3+4njZcP6PhNzGAALmk5S
 pGCfTgJi0xXElycLM7tOwAlkmqAVt89mYAHGNsPp0bBwkbcA7TXMB62p8dSK3wGQv/ePIRK0jy
 t1KeGScbkq6J0XfURM42Xu1Cd+y7RmR0JWGgCjzVOn5WFZKhbFAMW/BfSuzDQUs5hQjepQBuYr
 Ndwv5bIXZdDRSO4sqRGNZ+68r1OYqD9IrOCsCr6BaKM2XMf5V8J15BmstH5PDjGwrz+5ZXp8X5
 rdc=
X-SBRS: 2.7
X-MesageID: 16618100
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16618100"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: Juergen Gross <jgross@suse.com>
Subject: Cpu on/offlining crash with core scheduling
Thread-Topic: Cpu on/offlining crash with core scheduling
Thread-Index: AQHWHJp8dUHIzvCapEuuomD+efJ+EQ==
Date: Mon, 27 Apr 2020 13:49:37 +0000
Message-ID: <1587995374653.73805@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: AMSPEX02CL03.citrite.net (15.00.1497.006)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2E1EC7D64281F04492A83B8A7C2ABA48@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Sergey
 Dyasli <sergey.dyasli@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,=0A=
=0A=
When I'm testing vcpu pinning with something like:=0A=
=0A=
     # xl vcpu-pin 0 0 2=0A=
     # xen-hptool cpu-offline 3=0A=
=0A=
     (offline / online CPUs {2,3} if the above is successful)=0A=
=0A=
I'm reliably seeing the following crash on the latest staging:=0A=
=0A=
(XEN) Watchdog timer detects that CPU1 is stuck!=0A=
(XEN) ----[ Xen-4.14-unstable  x86_64  debug=3Dy   Not tainted ]----=0A=
(XEN) CPU:    1=0A=
(XEN) RIP:    e008:[<ffff82d08025266d>] common/sched/core.c#sched_wait_rend=
ezvous_in+0x16c/0x385=0A=
(XEN) RFLAGS: 0000000000000002   CONTEXT: hypervisor=0A=
(XEN) rax: 000000000000f001   rbx: ffff82d0805c9118   rcx: ffff83085e750301=
=0A=
(XEN) rdx: 0000000000000001   rsi: ffff83086499b972   rdi: ffff83085e7503a6=
=0A=
(XEN) rbp: ffff83085e7dfe28   rsp: ffff83085e7dfdd8   r8:  ffff830864985440=
=0A=
(XEN) r9:  ffff83085e714068   r10: 0000000000000014   r11: 00000056b6a1aab2=
=0A=
(XEN) r12: ffff83086499e490   r13: ffff82d0805f26e0   r14: ffff83085e7503a0=
=0A=
(XEN) r15: 0000000000000001   cr0: 0000000080050033   cr4: 0000000000362660=
=0A=
(XEN) cr3: 0000000823a8e000   cr2: 00006026000f6fc0=0A=
(XEN) fsb: 0000000000000000   gsb: ffff888138dc0000   gss: 0000000000000000=
=0A=
(XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008=0A=
(XEN) Xen code around <ffff82d08025266d> (common/sched/core.c#sched_wait_re=
ndezvous_in+0x16c/0x385):=0A=
(XEN)  4c 89 f7 e8 dc a5 fd ff <4b> 8b 44 fd 00 48 8b 04 18 4c 3b 70 10 0f =
85 3f=0A=
(XEN) Xen stack trace from rsp=3Dffff83085e7dfdd8:=0A=
(XEN)    00000056b42128a6 ffff83086499ff30 ffff83086498a000 ffff83085e7dfe4=
8=0A=
(XEN)    0000000100000001 00000056b42128a6 ffff83086499e490 000000000000000=
0=0A=
(XEN)    0000000000000001 0000000000000001 ffff83085e7dfe78 ffff82d080252ae=
8=0A=
(XEN)    ffff83086498a000 0000000180230434 ffff83085e7503a0 ffff82d0805ceb0=
0=0A=
(XEN)    ffffffffffffffff ffff82d0805cea80 0000000000000000 ffff82d0805dea8=
0=0A=
(XEN)    ffff83085e7dfeb0 ffff82d08022c232 0000000000000001 ffff82d0805ceb0=
0=0A=
(XEN)    0000000000000001 0000000000000001 0000000000000001 ffff83085e7dfec=
0=0A=
(XEN)    ffff82d08022c2cd ffff83085e7dfef0 ffff82d08031cae9 ffff83086498a00=
0=0A=
(XEN)    ffff83086498a000 0000000000000001 0000000000000001 ffff83085e7dfde=
8=0A=
(XEN)    ffff88813021d700 ffff88813021d700 0000000000000000 000000000000000=
0=0A=
(XEN)    0000000000000007 ffff88813021d700 0000000000000246 0000000000007ff=
0=0A=
(XEN)    0000000000000000 000000000001ca00 0000000000000000 ffffffff810013a=
a=0A=
(XEN)    ffffffff8203d210 deadbeefdeadf00d deadbeefdeadf00d 000001000000000=
0=0A=
(XEN)    ffffffff810013aa 000000000000e033 0000000000000246 ffffc900400dfeb=
0=0A=
(XEN)    000000000000e02b 0000000000000000 0000000000000000 000000000000000=
0=0A=
(XEN)    0000000000000000 0000e01000000001 ffff83086498a000 00000037e43bd00=
0=0A=
(XEN)    0000000000362660 0000000000000000 8000000864980002 000006010000000=
0=0A=
(XEN)    0000000000000000=0A=
(XEN) Xen call trace:=0A=
(XEN)    [<ffff82d08025266d>] R common/sched/core.c#sched_wait_rendezvous_i=
n+0x16c/0x385=0A=
(XEN)    [<ffff82d080252ae8>] F common/sched/core.c#sched_slave+0x262/0x31e=
=0A=
(XEN)    [<ffff82d08022c232>] F common/softirq.c#__do_softirq+0x8a/0xbc=0A=
(XEN)    [<ffff82d08022c2cd>] F do_softirq+0x13/0x15=0A=
(XEN)    [<ffff82d08031cae9>] F arch/x86/domain.c#idle_loop+0x57/0xa7=0A=
(XEN)=0A=
(XEN) CPU0 @ e008:ffff82d08022c2b7 (process_pending_softirqs+0x53/0x56)=0A=
(XEN) CPU4 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callbacks=
+0x22e/0x24b)=0A=
(XEN) CPU2 @ e008:ffff82d08022c26f (process_pending_softirqs+0xb/0x56)=0A=
(XEN) CPU7 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callbacks=
+0x22e/0x24b)=0A=
(XEN) CPU3 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callbacks=
+0x22e/0x24b)=0A=
(XEN) CPU5 @ e008:ffff82d08022cc34 (_spin_lock+0x4d/0x62)=0A=
(XEN) CPU6 @ e008:ffff82d08022c264 (process_pending_softirqs+0/0x56)=0A=
(XEN)=0A=
(XEN) ****************************************=0A=
(XEN) Panic on CPU 1:=0A=
(XEN) FATAL TRAP: vector =3D 2 (nmi)=0A=
(XEN) [error_code=3D0000] , IN INTERRUPT CONTEXT=0A=
(XEN) ****************************************=0A=
(XEN)=0A=
(XEN) Reboot in five seconds...=0A=
(XEN) Executing kexec image on cpu1=0A=
(XEN) Shot down all CPUs=0A=
=0A=
=0A=
Is this something you can reproduce?=0A=
=0A=
--=0A=
Thanks,=0A=
Sergey=0A=

