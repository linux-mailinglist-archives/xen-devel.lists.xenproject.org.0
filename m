Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE69B298E2E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 14:38:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12323.32109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2gx-0005o4-Fi; Mon, 26 Oct 2020 13:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12323.32109; Mon, 26 Oct 2020 13:37:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2gx-0005nf-CV; Mon, 26 Oct 2020 13:37:43 +0000
Received: by outflank-mailman (input) for mailman id 12323;
 Mon, 26 Oct 2020 13:37:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIL/=EB=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kX2gv-0005na-Ta
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:37:42 +0000
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14e936e6-75fa-4637-9c88-82992d06765f;
 Mon, 26 Oct 2020 13:37:40 +0000 (UTC)
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1603719455384180.41777328470607;
 Mon, 26 Oct 2020 06:37:35 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oIL/=EB=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kX2gv-0005na-Ta
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:37:42 +0000
X-Inumbo-ID: 14e936e6-75fa-4637-9c88-82992d06765f
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 14e936e6-75fa-4637-9c88-82992d06765f;
	Mon, 26 Oct 2020 13:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1603719457; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LUIAeD6RP8AmRGuH0R1yMML5Os89erB7WSpNFqoYqdHaojYnlERI3bgAc4Q1Ta7a1gMebKJaDdMxYW9plCvQg2yeBQOycSM+7sln1uW3yllAgPvifWk9nQ2/EKYUtBd2qZ/BQGHPb9F2h3sawJ9Uh1KxHIJLrX6o8R3aJwUPm58=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1603719457; h=Content-Type:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=SOM/fbpgIIU2RcvSQdpk47HFfpuibk2bDq/06D70Fa4=; 
	b=mwz3672jgAftYmbbSYT9sqqtEv2PUkMvCKEi/v1LuWcNslA+GOkX+oCjik1tVMBn0NR5sns7Q1XmONBxuNCnfvLW+8+c6/RawLJ95VJbYjJMDHB+GE4mK5BnlxlahRnCiAfhb6dYrFSwL12mTPGWaHyY3+7OUnI9bjEfLYFIXkE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1603719457;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=From:To:Subject:Cc:Message-ID:Date:MIME-Version:Content-Type;
	bh=SOM/fbpgIIU2RcvSQdpk47HFfpuibk2bDq/06D70Fa4=;
	b=OiZTWdmdhQeIFUBDpWPCsRcOrcKhzukP+Qb8PygPUw5UWKO/hEr2Soobu/uKEhhg
	0vPUUHKoFtedA+TXRt/S5x5VFaC+XwOP368wnoT7gpEWQCmmSVc9HIBu1nGZ21felB2
	qnAWbcdSHRPufMcRCH/UDIEXbfrq7cyaptLH8TaQ=
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1603719455384180.41777328470607; Mon, 26 Oct 2020 06:37:35 -0700 (PDT)
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Autocrypt: addr=frederic.pierret@qubes-os.org; keydata=
 xsFNBFwkq3EBEADcfyaOkeuf+g96S1ieq05tJ8vTGsQrNXQ5RDE7ffagL0+EpfIP3x73x5Q0
 Dy2rUVQ+oN1DHcueNL70RtNs9BFnoW0KZnskbT4nEJ9wQCQa22lQaIk9kCNVddh2HJKljtd8
 vtovi97sWIjtzxx5Qwc2md0DY9AHhNC4KqKIW3tSPC17UsI8fASoNAHItYtyn2bO67p8pCIv
 ltoBrYnElD1Pyp5IGWiD2/YD325iPl2+qHVkUSWmb92hRRU19Rg+Uds8bVHqhz4cOqIE7jpX
 gYzTN/kq8sxBMh2OrQ/bSxLaccaNApIVSZVSAasVJfdscNDL9fjkHERK/AiSTleHrsgLf4PL
 w5koqPs/6JEIVI+t0pyg+Pa8uwFoeYTPrLSlw0f7bXSmlVfv8g7M7RWmk3T5QIpeHA0j3lEZ
 NbYRXzkI91HCt40X2bTb2jTKgvB9jQjEarpk6euvGs2Ig/U4MlUy3pG5Ehd2Ebn8Rz31JXpa
 A/GPaJ5DjzV0q9mkYkGDLYI3J/J+s2u0Kr0VswLaIN3WJn7kKEDwfc4s2kaAYfblE/p0zVir
 EVBum723MFH4DxhTrOoWgta2nyRHOoi0z0EVhYA+D86mFPWKb9roWvtnmFlssggGmqbJEMvt
 LbYnlSt3v32nfUXh12aQPwU/LCGIzq4oFNVrNp3aWPnSajLPpQARAQABzTxGcsOpZMOpcmlj
 IFBpZXJyZXQgKGZlcGl0cmUpIDxmcmVkZXJpYy5waWVycmV0QHF1YmVzLW9zLm9yZz7CwXgE
 EwECACIFAlwkq3ECGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEEhAELXNxXbiPLkQ
 AI6kEDyLl0TpvRDOanuD5YkVHLEYVuG62CJNwMjFoFRgZJnl+Fb5HBgthU9lBdMqNySg+s8y
 ekM9KRlUHKYjwAsyjPIjRtca4bH3V11/waKpvPBgPsC75CxSZ9uITprfEqX7V2OLbrYW94qw
 R8jX+n/wlEGG3pbfXG7FTnjxQWM0E0aSvO0Yb5EkjiJ7cwEiqvL04Uekt5I2Zc8iRDF9kneI
 NiNhzRtvrR1UN6KtiZNSk2NsLOptrUQ/1AU5jwH4mnQQymtYDsWddlRoDRC/bsAow7cBudj+
 lekM3cNRZOazKZx5UPnN8nqvD7FqeAcZBVyrHZ4hcWqABaJEPv6CCHRiLQnGR9ze2O5Yh+/B
 unrOJdjdsib1ZECH9GtIcj4mmPAN84NO4r8a6Sn9jsXkd2Wj2N5wNrZMPslhfiaW2VHTfLmA
 Ot+wRwLRsFfqLykF8hMlNXXE4frxotwa6+PTd48Ws9H9aalSs0lebsG0623b4mBjy1coxFUw
 eclPInXsPEdu/Yu2r7xrgGouXH8KgDhqlqq60UaA5n/0XhIeZ8tBTYs+1B5/C9TjvNAUsBko
 b1EpfW3J4Gq14GqwK+eodOTL5t2f2PWN/IQyop/j0FMgVU5/PUS0pciz5ybyIJBLhbsJBvKb
 xM/NyxHrmNwGEknpoeq+XT8rEJ+/Ag8Wnjl0zsFNBFwkq3EBEADAPJdyFy4KeYpuGATWwWCN
 He8XNVqBplV0yVlT5pSiCyA3UK34JlGX9YJOj/FlMZGgh61vbiK+piRjm/lyb128wpMjnoOm
 qpbSLbra8NP8Mu5FZMcv8OxrSIr/RHq2heFg1j11QOMGwe6vPC918qpzmiaYj2qpKY/RYsG8
 V+9+dpLEU75+mpHU7GlECfPmHYbnsismL/4+xH+8BG56yg0UFbfrNYonIQFSn5k/w6i7jt7M
 ++ZmWfEV5nCP2qvzeYDGAL6BbWVOjuDhrKsAIKnomCyy+MjcVP955PVdN2+OlPJng07oKtQr
 5aNCaNpv/i4gLO1IScdfDwm6gdfB2Zg/7jTJrKw0kWPFl9rHfN7dLAR28u3uT8Rhicjdd7hg
 YlDWdbImhNL/Z7iL3eayH7T9qAVNU587MhWvIREyE1gj22cs0e1m6qMFpbFYG0709N2UwlpA
 H+Pd35bTi9q2o1pH91xBYH6QvvrwsuVYHwuc3xXLRVRXWXY8xvNFSlY1LB8A46JOtV/ZodYD
 yhxVGbeWp820cb0s1f689XCXqFYAzTfCit+EeboYORN5CGioXzS+z0S9IhPbdUuvqs7xvC24
 8bM7nm84YdgVM7HWybOtpRpWpycwGs73IvbxyLE9aPe/Zw4PTKWvbJlcFioofLwTQE1XvWom
 FPD9LLrBl5NUjQARAQABwsFfBBgBAgAJBQJcJKtxAhsMAAoJEEhAELXNxXbilSkP/2NcazvU
 DGyQLm7tFp4HNqSQfFJ3+chzxfOOdNtdWE+RFetyx9R8DBGrPX8hjITWD9ZA2bbZZ+J+a39v
 yY7bNZkCGbWzPGK//O1cInL4Ecmj7Xm8DXjk3E2Xzv1YrZk/GBz9xK8mWXwhn90SHNadEf28
 ghMXcmUJSqT+KTxQQjUVaEtQDdzQnYQKh/dHxs760QSAnXkWr0YVYxk8q8aa+G8iAkNJcb+W
 x5gWEw4ft3HpKMRq74OQvWayy0fXpTlusdnvZs0VVMeRpCW6iCt9UmsbfG6Nyf2MKKbWRJnt
 jy8mjJiFjiJ2j9s4yNIookRv8IfocULuhnx5FWsvIzX2Vwcd7G5objnY1DlCNQrhJUs/geoC
 UBjBJp7sfbHakWfTKxZjFsuCXT1dCEN7JXX6ABOshzDTwB0kq7Bq/EkOzPDQGfOPoX2h1KjH
 uvGWw5cBe8WLnEuhIyf/DWfMS1LbjFB4JlMUEcood5xvE4owpfZog+0a9gpBS6cg9bMgRUex
 1C+w3fudJdPQwIRAjJgac0jTT6uDY8re9RhBDv83PRSM7AzxqEFvDj8K46dg1XvJcKs7K5PX
 pm5Pw4stVEAxIks5uR62wxygImkdvgjQRzJe4JWwAniBWsZG+cNYj6xcItqkupIb4PeOWgNQ
 QMhGv8DnbAdOOOnumAXWq0+wl5uP
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Recent upgrade of 4.13 -> 4.14 issue
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
Date: Mon, 26 Oct 2020 14:37:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sm3uTXYd50zO7mXrabSd8WUl5TMONZpX9"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sm3uTXYd50zO7mXrabSd8WUl5TMONZpX9
Content-Type: multipart/mixed; boundary="BdKjHxGSDDIoiItuAaMS0Zeu8A2aaIxqN";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
Subject: Recent upgrade of 4.13 -> 4.14 issue

--BdKjHxGSDDIoiItuAaMS0Zeu8A2aaIxqN
Content-Type: multipart/mixed;
 boundary="------------355E3F64B4519B719BD94414"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------355E3F64B4519B719BD94414
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm experiencing problem with a HP ProLiant DL360p Gen8 and recent upgrad=
e of 4.13 -> 4.14. dom0 and the entire system becomes unstable and freeze=
 at some point.

I've managed to get three pieces of logs (last one after a reboot and jus=
t before total freeze) by connecting to the serial console with loglvl op=
tions and also redirecting linux kernel output to the serial console:

```
[ 2150.954883] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[ 2150.954934] rcu: 	7-...0: (3 GPs behind) idle=3D842/1/0x40000000000000=
00 softirq=3D64670/64671 fqs=3D14673
[ 2150.954962] 	(detected by 12, t=3D60002 jiffies, g=3D236593, q=3D126)
[ 2150.954984] Sending NMI from CPU 12 to CPUs 7:
[ 2160.968519] rcu: rcu_sched kthread starved for 10008 jiffies! g236593 =
f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D9
[ 2160.968568] rcu: RCU grace-period kthread stack dump:
[ 2160.968586] rcu_sched       R  running task        0    10      2 0x80=
004000
[ 2160.968612] Call Trace:
[ 2160.968634]  ? xen_hypercall_xen_version+0xa/0x20
[ 2160.968658]  ? xen_force_evtchn_callback+0x9/0x10
[ 2160.968918]  ? check_events+0x12/0x20
[ 2160.968946]  ? schedule+0x39/0xa0
[ 2160.968964]  ? schedule_timeout+0x96/0x150
[ 2160.968981]  ? __next_timer_interrupt+0xd0/0xd0
[ 2160.969002]  ? rcu_gp_fqs_loop+0xea/0x2a0
[ 2160.969019]  ? rcu_gp_kthread+0xb5/0x140
[ 2160.969035]  ? rcu_gp_init+0x470/0x470
[ 2160.969052]  ? kthread+0x115/0x140
[ 2160.969067]  ? __kthread_bind_mask+0x60/0x60
[ 2160.969085]  ? ret_from_fork+0x35/0x40
```

and also

```
[ 2495.945931] CPU: 14 PID: 24181 Comm: Xorg Not tainted 5.4.72-2.qubes.x=
86_64 #1
[ 2495.945954] Hardware name: HP ProLiant DL360p Gen8, BIOS P71 05/24/201=
9
[ 2495.945984] RIP: e030:smp_call_function_many+0x20a/0x270
[ 2495.946004] Code: 8a 00 3b 05 4c b5 69 01 89 c7 0f 83 89 fe ff ff 48 6=
3 c7 49 8b 17 48 03 14 c5 80 f9 3d 82 8b 42 18 a8 01 74 09 f3 90 8b 42 18=
 <a8> 01 75 f7 eb c9 48 c7 c2 a0 6f 82 82 4c 89 f6 89 df e8 bf b2
8a
[ 2495.946051] RSP: e02b:ffffc90003aa7cf0 EFLAGS: 00000202
[ 2495.946068] RAX: 0000000000000003 RBX: 0000000000000010 RCX: 000000000=
0000007
[ 2495.946090] RDX: ffff8882413ef640 RSI: 0000000000000010 RDI: 000000000=
0000007
[ 2495.946113] RBP: ffffffff81082fc0 R08: 0000000000000007 R09: 000000000=
0000000
[ 2495.946134] R10: 0000000000000000 R11: ffffffff8265b6a8 R12: 000000000=
0000000
[ 2495.946156] R13: 0000000000000001 R14: 0000000000029ac0 R15: ffff88824=
15a9b00
[ 2495.946211] FS:  00007a0d51a91a40(0000) GS:ffff888241580000(0000) knlG=
S:0000000000000000
[ 2495.946235] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2495.946253] CR2: 000070abab15a000 CR3: 00000001e18ee000 CR4: 000000000=
0040660
[ 2495.946290] Call Trace:
[ 2495.946314]  ? do_kernel_range_flush+0x50/0x50
[ 2495.946334]  on_each_cpu+0x28/0x50
[ 2495.946354]  decrease_reservation+0x22f/0x310
[ 2495.946377]  alloc_xenballooned_pages+0xeb/0x120
[ 2495.946396]  ? __kmalloc+0x183/0x260
[ 2495.946413]  gnttab_alloc_pages+0x11/0x40
[ 2495.946434]  gntdev_alloc_map+0x12f/0x250 [xen_gntdev]
[ 2495.946454]  gntdev_ioctl_map_grant_ref+0x73/0x1d0 [xen_gntdev]
[ 2495.946479]  do_vfs_ioctl+0x2fb/0x490
[ 2495.946500]  ? syscall_trace_enter+0x1d1/0x2c0
[ 2495.946551]  ksys_ioctl+0x5e/0x90
[ 2495.946567]  __x64_sys_ioctl+0x16/0x20
[ 2495.946583]  do_syscall_64+0x5b/0xf0
[ 2495.946601]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 2495.946620] RIP: 0033:0x7a0d51f763bb
[ 2495.946727] Code: 0f 1e fa 48 8b 05 dd aa 0c 00 64 c7 00 26 00 00 00 4=
8 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05=
 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ad aa 0c 00 f7 d8 64 89 01
48
[ 2495.946804] RSP: 002b:00007fffc48d5058 EFLAGS: 00000206 ORIG_RAX: 0000=
000000000010
[ 2495.946863] RAX: ffffffffffffffda RBX: 0000000000001000 RCX: 00007a0d5=
1f763bb
[ 2495.946885] RDX: 00007fffc48d5060 RSI: 0000000000184700 RDI: 000000000=
0000009
[ 2495.946939] RBP: 00007fffc48d5100 R08: 00007fffc48d512c R09: 00007a0d5=
1a30010
[ 2495.946998] R10: 0000000000000000 R11: 0000000000000206 R12: 00007fffc=
48d5060
[ 2495.947020] R13: 0000000000000001 R14: 0000000000000009 R15: 000000000=
0000001
[ 2510.964667] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[ 2510.964716] rcu: 	7-...0: (3 GPs behind) idle=3D842/1/0x40000000000000=
00 softirq=3D64670/64671 fqs=3D96182
[ 2510.964744] 	(detected by 12, t=3D420012 jiffies, g=3D236593, q=3D1140=
4)
[ 2510.964769] Sending NMI from CPU 12 to CPUs 7:
[ 2523.945643] watchdog: BUG: soft lockup - CPU#14 stuck for 22s! [Xorg:2=
4181]
[ 2523.945686] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_s=
eq_device snd_timer snd soundcore br_netfilter xt_physdev xen_netback loo=
p bridge stp llc rfkill ebtable_filter ebtables ip6table_filter ip
6_tables iptable_filter intel_rapl_msr iTCO_wdt ipmi_ssif iTCO_vendor_sup=
port intel_rapl_common sb_edac rapl raid456 async_raid6_recov async_memcp=
y async_pq async_xor async_tx xor raid6_pq pcspkr joydev hpilo lpc
_ich hpwdt ioatdma dca tg3 r8169 ipmi_si ipmi_devintf ipmi_msghandler acp=
i_power_meter xenfs ip_tables dm_thin_pool dm_persistent_data libcrc32c d=
m_bio_prison dm_crypt uas usb_storage uhci_hcd crct10dif_pclmul cr
c32_pclmul crc32c_intel ghash_clmulni_intel mgag200 drm_kms_helper serio_=
raw drm_vram_helper ttm drm ata_generic pata_acpi i2c_algo_bit ehci_pci e=
hci_hcd xhci_pci xhci_hcd hpsa scsi_transport_sas xen_privcmd xen_
pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn uinput pkcs8_key_p=
arser
[ 2523.945934] CPU: 14 PID: 24181 Comm: Xorg Tainted: G             L    =
5.4.72-2.qubes.x86_64 #1
[ 2523.945960] Hardware name: HP ProLiant DL360p Gen8, BIOS P71 05/24/201=
9
[ 2523.945989] RIP: e030:smp_call_function_many+0x20a/0x270
[ 2523.946010] Code: 8a 00 3b 05 4c b5 69 01 89 c7 0f 83 89 fe ff ff 48 6=
3 c7 49 8b 17 48 03 14 c5 80 f9 3d 82 8b 42 18 a8 01 74 09 f3 90 8b 42 18=
 <a8> 01 75 f7 eb c9 48 c7 c2 a0 6f 82 82 4c 89 f6 89 df e8 bf b2
8a
[ 2523.946057] RSP: e02b:ffffc90003aa7cf0 EFLAGS: 00000202
[ 2523.946075] RAX: 0000000000000003 RBX: 0000000000000010 RCX: 000000000=
0000007
[ 2523.946097] RDX: ffff8882413ef640 RSI: 0000000000000010 RDI: 000000000=
0000007
[ 2523.946119] RBP: ffffffff81082fc0 R08: 0000000000000007 R09: 000000000=
0000000
[ 2523.946162] R10: 0000000000000000 R11: ffffffff8265b6a8 R12: 000000000=
0000000
[ 2523.946184] R13: 0000000000000001 R14: 0000000000029ac0 R15: ffff88824=
15a9b00
[ 2523.946233] FS:  00007a0d51a91a40(0000) GS:ffff888241580000(0000) knlG=
S:0000000000000000
[ 2523.946256] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2523.946275] CR2: 000070abab15a000 CR3: 00000001e18ee000 CR4: 000000000=
0040660
[ 2523.946313] Call Trace:
[ 2523.946336]  ? do_kernel_range_flush+0x50/0x50
[ 2523.946356]  on_each_cpu+0x28/0x50
[ 2523.946376]  decrease_reservation+0x22f/0x310
[ 2523.946397]  alloc_xenballooned_pages+0xeb/0x120
[ 2523.946418]  ? __kmalloc+0x183/0x260
[ 2523.946434]  gnttab_alloc_pages+0x11/0x40
[ 2523.946457]  gntdev_alloc_map+0x12f/0x250 [xen_gntdev]
[ 2523.946478]  gntdev_ioctl_map_grant_ref+0x73/0x1d0 [xen_gntdev]
[ 2523.946502]  do_vfs_ioctl+0x2fb/0x490
[ 2523.946559]  ? syscall_trace_enter+0x1d1/0x2c0
[ 2523.946578]  ksys_ioctl+0x5e/0x90
[ 2523.946594]  __x64_sys_ioctl+0x16/0x20
[ 2523.946610]  do_syscall_64+0x5b/0xf0
[ 2523.946713]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 2523.946738] RIP: 0033:0x7a0d51f763bb
[ 2523.946782] Code: 0f 1e fa 48 8b 05 dd aa 0c 00 64 c7 00 26 00 00 00 4=
8 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05=
 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ad aa 0c 00 f7 d8 64 89 01
48
[ 2523.946867] RSP: 002b:00007fffc48d5058 EFLAGS: 00000206 ORIG_RAX: 0000=
000000000010
[ 2523.946927] RAX: ffffffffffffffda RBX: 0000000000001000 RCX: 00007a0d5=
1f763bb
[ 2523.946950] RDX: 00007fffc48d5060 RSI: 0000000000184700 RDI: 000000000=
0000009
[ 2523.946972] RBP: 00007fffc48d5100 R08: 00007fffc48d512c R09: 00007a0d5=
1a30010
[ 2523.947029] R10: 0000000000000000 R11: 0000000000000206 R12: 00007fffc=
48d5060
[ 2523.947051] R13: 0000000000000001 R14: 0000000000000009 R15: 000000000=
0000001
```

and finally

```
[ 1597.971380] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[ 1597.971409] rcu: 	0-...0: (5 ticks this GP) idle=3Dcd2/0/0x1 softirq=3D=
59121/59122 fqs=3D14998
[ 1597.971420] rcu: 	7-...0: (2 ticks this GP) idle=3De9e/1/0x40000000000=
00000 softirq=3D49519/49519 fqs=3D14998
[ 1597.971431] 	(detected by 11, t=3D60002 jiffies, g=3D234321, q=3D83)
[ 1597.971441] Sending NMI from CPU 11 to CPUs 0:
[ 1597.972452] NMI backtrace for cpu 0
[ 1597.972453] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.4.72-2.qubes.x=
86_64 #1
[ 1597.972453] Hardware name: HP ProLiant DL360p Gen8, BIOS P71 05/24/201=
9
[ 1597.972454] RIP: e030:xen_hypercall_sched_op+0xa/0x20
[ 1597.972454] Code: 51 41 53 b8 1c 00 00 00 0f 05 41 5b 59 c3 cc cc cc c=
c cc cc cc cc cc cc cc cc cc cc cc cc cc cc 51 41 53 b8 1d 00 00 00 0f 05=
 <41> 5b 59 c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc
cc
[ 1597.972455] RSP: e02b:ffffc90001403d88 EFLAGS: 00000002
[ 1597.972456] RAX: 0000000000000000 RBX: ffff888241215f80 RCX: ffffffff8=
10013aa
[ 1597.972456] RDX: ffff88823c070428 RSI: ffffc90001403da8 RDI: 000000000=
0000003
[ 1597.972456] RBP: ffff8882365d8bf0 R08: ffffffff8265b6a0 R09: 000000000=
0000000
[ 1597.972457] R10: 0000000000000000 R11: 0000000000000202 R12: 000000000=
0000049
[ 1597.972457] R13: 0000000000000100 R14: ffff8882422b6640 R15: 000000000=
0000001
[ 1597.972458] FS:  0000729633b7d700(0000) GS:ffff888241200000(0000) knlG=
S:0000000000000000
[ 1597.972458] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1597.972458] CR2: 000077f6508c47c0 CR3: 000000020d006000 CR4: 000000000=
0040660
[ 1597.972459] Call Trace:
[ 1597.972459]  <IRQ>
[ 1597.972459]  ? xen_poll_irq+0x73/0xa0
[ 1597.972459]  ? xen_qlock_wait+0x7b/0x80
[ 1597.972460]  ? pv_wait_head_or_lock+0x85/0xb0
[ 1597.972460]  ? __pv_queued_spin_lock_slowpath+0xb5/0x1b0
[ 1597.972460]  ? _raw_spin_lock_irqsave+0x32/0x40
[ 1597.972461]  ? bfq_finish_requeue_request+0xb5/0x120
[ 1597.972461]  ? blk_mq_free_request+0x3a/0xf0
[ 1597.972461]  ? scsi_end_request+0x95/0x140
[ 1597.972461]  ? scsi_io_completion+0x74/0x190
[ 1597.972462]  ? blk_done_softirq+0xea/0x180
[ 1597.972462]  ? __do_softirq+0xd9/0x2c8
[ 1597.972462]  ? irq_exit+0xcf/0x110
[ 1597.972462]  ? xen_evtchn_do_upcall+0x2c/0x40
[ 1597.972463]  ? xen_do_hypervisor_callback+0x29/0x40
[ 1597.972463]  </IRQ>
[ 1597.972463]  ? xen_hypercall_sched_op+0xa/0x20
[ 1597.972464]  ? xen_hypercall_sched_op+0xa/0x20
[ 1597.972464]  ? xen_safe_halt+0xc/0x20
[ 1597.972464]  ? default_idle+0x1a/0x140
[ 1597.972465]  ? cpuidle_idle_call+0x139/0x190
[ 1597.972465]  ? do_idle+0x73/0xd0
[ 1597.972465]  ? cpu_startup_entry+0x19/0x20
[ 1597.972466]  ? start_kernel+0x68a/0x6bf
[ 1597.972466]  ? xen_start_kernel+0x6a2/0x6c1
[ 1597.972470] Sending NMI from CPU 11 to CPUs 7:
[ 1607.976873] rcu: rcu_sched kthread starved for 10007 jiffies! g234321 =
f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D11
[ 1607.976924] rcu: RCU grace-period kthread stack dump:
[ 1607.976942] rcu_sched       I    0    10      2 0x80004000
[ 1607.976972] Call Trace:
[ 1607.976999]  __schedule+0x217/0x570
[ 1607.977020]  ? schedule+0x39/0xa0
[ 1607.977038]  ? schedule_timeout+0x96/0x150
[ 1607.977056]  ? __next_timer_interrupt+0xd0/0xd0
[ 1607.977079]  ? rcu_gp_fqs_loop+0xea/0x2a0
[ 1607.977096]  ? rcu_gp_kthread+0xb5/0x140
[ 1607.977112]  ? rcu_gp_init+0x470/0x470
[ 1607.977130]  ? kthread+0x115/0x140
[ 1607.977145]  ? __kthread_bind_mask+0x60/0x60
[ 1607.977164]  ? ret_from_fork+0x35/0x40
```

I've tried to increase memory, set maximum of dom0 vcps to 1 or 4, pin vc=
pus too, multiple 5.4 kernels tool...no luck.

I've also observed that some (never the same) VM (PVH or HVM) fail to sta=
rt randomly because of being stuck at boot time with analog stack trace a=
s the first piece of log provided above. Those VM are impossible to desro=
y and then it "propagates" though dom0 with the two latest piece of codes=
=2E

If anyone would have any idea of what's going on, that would be very appr=
eciated. Thank you.

Fr=C3=A9d=C3=A9ric

--------------355E3F64B4519B719BD94414
Content-Type: application/pgp-keys;
 name="OpenPGP_0x484010B5CDC576E2.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x484010B5CDC576E2.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFwkq3EBEADcfyaOkeuf+g96S1ieq05tJ8vTGsQrNXQ5RDE7ffagL0+EpfIP3x73x5Q0D=
y2r
UVQ+oN1DHcueNL70RtNs9BFnoW0KZnskbT4nEJ9wQCQa22lQaIk9kCNVddh2HJKljtd8vtovi=
97s
WIjtzxx5Qwc2md0DY9AHhNC4KqKIW3tSPC17UsI8fASoNAHItYtyn2bO67p8pCIvltoBrYnEl=
D1P
yp5IGWiD2/YD325iPl2+qHVkUSWmb92hRRU19Rg+Uds8bVHqhz4cOqIE7jpXgYzTN/kq8sxBM=
h2O
rQ/bSxLaccaNApIVSZVSAasVJfdscNDL9fjkHERK/AiSTleHrsgLf4PLw5koqPs/6JEIVI+t0=
pyg
+Pa8uwFoeYTPrLSlw0f7bXSmlVfv8g7M7RWmk3T5QIpeHA0j3lEZNbYRXzkI91HCt40X2bTb2=
jTK
gvB9jQjEarpk6euvGs2Ig/U4MlUy3pG5Ehd2Ebn8Rz31JXpaA/GPaJ5DjzV0q9mkYkGDLYI3J=
/J+
s2u0Kr0VswLaIN3WJn7kKEDwfc4s2kaAYfblE/p0zVirEVBum723MFH4DxhTrOoWgta2nyRHO=
oi0
z0EVhYA+D86mFPWKb9roWvtnmFlssggGmqbJEMvtLbYnlSt3v32nfUXh12aQPwU/LCGIzq4oF=
NVr
Np3aWPnSajLPpQARAQABzTxGcsOpZMOpcmljIFBpZXJyZXQgKGZlcGl0cmUpIDxmcmVkZXJpY=
y5w
aWVycmV0QHF1YmVzLW9zLm9yZz7CwXgEEwECACIFAlwkq3ECGwMGCwkIBwMCBhUIAgkKCwQWA=
gMB
Ah4BAheAAAoJEEhAELXNxXbiPLkQAI6kEDyLl0TpvRDOanuD5YkVHLEYVuG62CJNwMjFoFRgZ=
Jnl
+Fb5HBgthU9lBdMqNySg+s8yekM9KRlUHKYjwAsyjPIjRtca4bH3V11/waKpvPBgPsC75CxSZ=
9uI
TprfEqX7V2OLbrYW94qwR8jX+n/wlEGG3pbfXG7FTnjxQWM0E0aSvO0Yb5EkjiJ7cwEiqvL04=
Uek
t5I2Zc8iRDF9kneINiNhzRtvrR1UN6KtiZNSk2NsLOptrUQ/1AU5jwH4mnQQymtYDsWddlRoD=
RC/
bsAow7cBudj+lekM3cNRZOazKZx5UPnN8nqvD7FqeAcZBVyrHZ4hcWqABaJEPv6CCHRiLQnGR=
9ze
2O5Yh+/BunrOJdjdsib1ZECH9GtIcj4mmPAN84NO4r8a6Sn9jsXkd2Wj2N5wNrZMPslhfiaW2=
VHT
fLmAOt+wRwLRsFfqLykF8hMlNXXE4frxotwa6+PTd48Ws9H9aalSs0lebsG0623b4mBjy1cox=
FUw
eclPInXsPEdu/Yu2r7xrgGouXH8KgDhqlqq60UaA5n/0XhIeZ8tBTYs+1B5/C9TjvNAUsBkob=
1Ep
fW3J4Gq14GqwK+eodOTL5t2f2PWN/IQyop/j0FMgVU5/PUS0pciz5ybyIJBLhbsJBvKbxM/Ny=
xHr
mNwGEknpoeq+XT8rEJ+/Ag8Wnjl0zsFNBFwkq3EBEADAPJdyFy4KeYpuGATWwWCNHe8XNVqBp=
lV0
yVlT5pSiCyA3UK34JlGX9YJOj/FlMZGgh61vbiK+piRjm/lyb128wpMjnoOmqpbSLbra8NP8M=
u5F
ZMcv8OxrSIr/RHq2heFg1j11QOMGwe6vPC918qpzmiaYj2qpKY/RYsG8V+9+dpLEU75+mpHU7=
GlE
CfPmHYbnsismL/4+xH+8BG56yg0UFbfrNYonIQFSn5k/w6i7jt7M++ZmWfEV5nCP2qvzeYDGA=
L6B
bWVOjuDhrKsAIKnomCyy+MjcVP955PVdN2+OlPJng07oKtQr5aNCaNpv/i4gLO1IScdfDwm6g=
dfB
2Zg/7jTJrKw0kWPFl9rHfN7dLAR28u3uT8Rhicjdd7hgYlDWdbImhNL/Z7iL3eayH7T9qAVNU=
587
MhWvIREyE1gj22cs0e1m6qMFpbFYG0709N2UwlpAH+Pd35bTi9q2o1pH91xBYH6QvvrwsuVYH=
wuc
3xXLRVRXWXY8xvNFSlY1LB8A46JOtV/ZodYDyhxVGbeWp820cb0s1f689XCXqFYAzTfCit+Ee=
boY
ORN5CGioXzS+z0S9IhPbdUuvqs7xvC248bM7nm84YdgVM7HWybOtpRpWpycwGs73IvbxyLE9a=
Pe/
Zw4PTKWvbJlcFioofLwTQE1XvWomFPD9LLrBl5NUjQARAQABwsFfBBgBAgAJBQJcJKtxAhsMA=
AoJ
EEhAELXNxXbilSkP/2NcazvUDGyQLm7tFp4HNqSQfFJ3+chzxfOOdNtdWE+RFetyx9R8DBGrP=
X8h
jITWD9ZA2bbZZ+J+a39vyY7bNZkCGbWzPGK//O1cInL4Ecmj7Xm8DXjk3E2Xzv1YrZk/GBz9x=
K8m
WXwhn90SHNadEf28ghMXcmUJSqT+KTxQQjUVaEtQDdzQnYQKh/dHxs760QSAnXkWr0YVYxk8q=
8aa
+G8iAkNJcb+Wx5gWEw4ft3HpKMRq74OQvWayy0fXpTlusdnvZs0VVMeRpCW6iCt9UmsbfG6Ny=
f2M
KKbWRJntjy8mjJiFjiJ2j9s4yNIookRv8IfocULuhnx5FWsvIzX2Vwcd7G5objnY1DlCNQrhJ=
Us/
geoCUBjBJp7sfbHakWfTKxZjFsuCXT1dCEN7JXX6ABOshzDTwB0kq7Bq/EkOzPDQGfOPoX2h1=
KjH
uvGWw5cBe8WLnEuhIyf/DWfMS1LbjFB4JlMUEcood5xvE4owpfZog+0a9gpBS6cg9bMgRUex1=
C+w
3fudJdPQwIRAjJgac0jTT6uDY8re9RhBDv83PRSM7AzxqEFvDj8K46dg1XvJcKs7K5PXpm5Pw=
4st
VEAxIks5uR62wxygImkdvgjQRzJe4JWwAniBWsZG+cNYj6xcItqkupIb4PeOWgNQQMhGv8Dnb=
AdO
OOnumAXWq0+wl5uP
=3DRWX1
-----END PGP PUBLIC KEY BLOCK-----

--------------355E3F64B4519B719BD94414--

--BdKjHxGSDDIoiItuAaMS0Zeu8A2aaIxqN--

--sm3uTXYd50zO7mXrabSd8WUl5TMONZpX9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl+W0RwACgkQSEAQtc3F
duKP2BAAuYxkjd+Qj0yZeylhZtcDTjFVaa5/5yisq3wz3ECYcy2tLGgpsvalU9ja
2FfBGXyf575GkW10gk20G5GhtxRDT0Y/bjUx39t7LDMXWGOD94WTr9F/GLFcXc7+
HCSki/3fiVv2sFAUxOBg4ATo0hWT/jzCLJKlpXEVP8mV2hz68nkozyJ5XdiFdyOj
/uEjHRk4wLUi2yK++kmvMYygDxs/0VWEHTZO76IyzJf5s+BLDdWFeI84KqMRL7YL
FAlSaTEUVnbes4jOmsYLV1DPJkpuz5PnX2v4gC40B0ndiPduyMGSZHLeds1rp9y4
FRfruIVGdUA4ffjLncRpMmulu0FvFdjEQNTEf7b6OD7kZ90oGlCvV2ps6VIuYych
yuw/5kyo3pCQvGP+SuBF5WC1a5AZ6JfKaQha1k8cVWBUs1KOvaGYoaUFETGx0w6a
/o2xrEcB0+RrtLFsmozGJ26RqQHdojuZwbuQHV86fyCOoHg38Vh2n14Xu+TdRTF5
ReZjnudn1ecyE0wczIzSORF1mSjv6DffOtQh2ij9CmOLJNd1lPKwHFefLJ0ATkE9
Gxxh4akWRXL4eBjPpakab7Xj8TxMqyzKiJL6Uz9D1vJhFQemcfo6PyxgYG0548Rs
lUwhDGFPwM0SIPO9aT7QZHy/hKSKh2bFew6BQWf59CS0UrSDf3k=
=DJLH
-----END PGP SIGNATURE-----

--sm3uTXYd50zO7mXrabSd8WUl5TMONZpX9--

