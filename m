Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645F64BD8B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 20:49:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461108.719146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5BG7-0000zK-IL; Tue, 13 Dec 2022 19:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461108.719146; Tue, 13 Dec 2022 19:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5BG7-0000wI-FF; Tue, 13 Dec 2022 19:48:11 +0000
Received: by outflank-mailman (input) for mailman id 461108;
 Tue, 13 Dec 2022 19:48:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsqc=4L=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1p5BG6-0000wC-GF
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 19:48:10 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0127.outbound.protection.office365.us [23.103.208.127])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fcd62b8-7b1f-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 20:48:07 +0100 (CET)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1144.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 19:48:04 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::81df:6431:7a2d:4610%5]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 19:48:04 +0000
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
X-Inumbo-ID: 0fcd62b8-7b1f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=nsslWmkWArSMGNzKn2zVkbcau8Peri9+vMfpdBdHlycDpQuoYNFHzs+2680ciECO7sRLYc7immKTw0VaX97cirNLPY8+T/lC3nceEgi7DcxxDEuMUjz93kXdEYuBfeu5G9IlB8ZxMgF94RvIxZ3NTt1Lshe9vx047nNrYX3jAuRh3lDmkYFUhjIDjWsYKUAXlR9K70GENP7gfz6JIEpZL9h0wek2S5gLL1WlfFPD4I20c0HHCX5vRklWKgAFxTo3mNydI4s+ERAVY79o5BDDQPgMiKj8S/77eaaL0YZKSUcPGssjaWWlqmJAA3F9vXo5bIDrgrSKFU+JhFj8a+ftSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7cs8Sj6YtftJejRuD+FMBnMFGkvfySrbdQX/bpMOAs=;
 b=U0QO+2tI1SLyVglvfbYH6AosfCpgYQJ62eUKmRi8Ehr7bKR3PewWZC6t/uOFZhnVukgpvhV4NUqoX1xjRBKsHzxdC8d5pckyC5oCcc4PxWEQ0XDig5Rf6h79SreQ49qxeBH8V7eOF5rNAo7snhCNeTaqykFjbeY0FIn6zQnD8o/zLNX1jS++9VowPDFkX+S4FUz7zPX82Mbs96Nu7mA/N/7XiluwmaEcpJai1yNiY9SF/WWIIKf7iph6I1szdAQqvI9tUqahfbpeQT41ljQ00bg+/JX70e3f1Vdj+e78WNPf7ySVnCZpGSSfCfjq8JORPFSDadFTcHpNC8HASsk/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7cs8Sj6YtftJejRuD+FMBnMFGkvfySrbdQX/bpMOAs=;
 b=IlDny066VdOOOXtEZSRvQnwVezw7zZn9oggDT9R83ESFsutwNnJJXKMIzxmBbgsiv5F/dqylrMuWpM9YYp+VrEJSaH71iqGW+TUNECHusRvEaaTbYZEN5vnmD6YQjxe9NepGsJHjtW2j6SLT1o0CFFgXawloadnyJhn7a5UGwjDYLqOZdWuQtN54j45Uz/ar2KsyB+2Wx8INa6lU6mbyiBXEq/990K9/FS/fTuA8a6NMtUJJ/9jr8lq4bF44zS2FcUKELI7psf8LC6gzT/M6zI/QrNHDvlVVHFNR0iqB+1zBYI6HeV0LRQfMjG9+zcg8Saw1bEcbmAA2CWDDVYf+QQ==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: "Smith, Jackson" <rsmith@RiversideResearch.org>
CC: "Brookes, Scott" <sbrookes@RiversideResearch.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, "demi@invisiblethingslab.com"
	<demi@invisiblethingslab.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>
Subject: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Thread-Topic: [RFC 0/4] Adding Virtual Memory Fuses to Xen
Thread-Index: AQHZDyrHUdSstfue4UmxiTJ0hoNsog==
Date: Tue, 13 Dec 2022 19:48:04 +0000
Message-ID:
 <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 02f0e44f-2ae9-b871-7f78-7f3bc069c8a2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1642:EE_|BN0P110MB1144:EE_
x-ms-office365-filtering-correlation-id: d2db4263-6a44-4974-c6c6-08dadd42f300
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QCXjn6URE1/80STJqg0PBphadXmccUOdfO13+85VzM26wV2OsBHus6JZf5QqzaQuX81WPIuawJNW9u6db9PACfhYqJNf/8ttR8oDuIrZ0xGmAoe0a0Po4CdQZYtdbAVsx5ARAftlgiwPa6LTQBvZyzNrBs5Cdy72FJaSBQ1cIMbX8nzIdZPdft6pfDyOyWojt+2gLIRFyZa8CwF1MPaYHpDCiqBgvhYXFp8O8b4dO62JqkR53xU7WZeR/tmy+QV0gpJ7PrjW1iTy57hDNY3Yh4LwKQ+iExlMS7IF0OIXVL2S0les4QV2bN5xv8kqdlja0DJPdsE7L6hOgGpLykZTuhmefMqbrs9aFSUC7jDHz14NTf38DZj5S25cDt5Ef4A1RtJ1ztpYbVZlJkNECsiwy2RL2CewqQ9i49WFlXp8SzCj8u/d+exyV6toy/no6O2e0ErafnAjc7pSyAII+v6MfEV0z4Xr4fbduAwgYQGJ6LDrHPS5ksW3jL701kd8doO0vP/8d02Gum0f3mg8POZUbYvc6j8kAxLucRLu86BgnUxrsWMpjbRO5ZTOjI4qJpXjCTBdmZmEgJlBrtwZOKRxHQqhtVwylsDacIrZ1TiYHuwTj0WN2aAug7Uu1x8h0k/eNvFo2uU+bukE5xeNRks5c8YvPi9JT4cffc/291GLeHU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(451199015)(6506007)(83380400001)(7696005)(9686003)(508600001)(2906002)(6200100001)(86362001)(55016003)(33656002)(54906003)(38100700002)(82960400001)(966005)(38070700005)(76116006)(71200400001)(66556008)(66476007)(26005)(4326008)(66946007)(64756008)(8676002)(186003)(66446008)(8936002)(7416002)(6862004)(122000001)(5660300002)(52536014)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 W9nxsQ+CSdGyU3njmC+/327YVZLMNFpF3Gb25rmtmT/XvkwocbWD6qIZ5n6SjAIquvl0HOJ+LZmm2WfUnFR2EUtHMMwlWNwWPmePCbUPgBAmI0gVufayEKooqHQUj0PHg+QaMeQk60LebC7phBO6YuzHKwA7AWBAqGzJ9y95+KpLQeT4vCZDdWKe4BpVHGzEj0+sKMk1jzi0ilVhXO99NhuRKIMCpC38K6ahTX34wiJ1pRbidC7wM3HSm7bbvFuBdBkQKMovIQ73qC9eYB4UzFAfMrpPm3iJ71zirkb5qal4foiJmHumuZsBkPBHkary3k8pFRO2mpwnVYAKt4E2nCDDbsgHypGpBhduYX5g9IoaHltpZF9MOCkeoj3kO27+bALoL8f03B3nSKbA3tPhJ30VSflQI/kS7dNeuAM5uAo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d2db4263-6a44-4974-c6c6-08dadd42f300
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 19:48:04.0684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1144

Hi Xen Developers,=0A=
=0A=
My team at Riverside Research is currently spending IRAD funding=0A=
to prototype next-generation secure hypervisor design ideas=0A=
on Xen. In particular, we are prototyping the idea of Virtual=0A=
Memory Fuses for Software Enclaves, as described in this paper:=0A=
https://www.nspw.org/papers/2020/nspw2020-brookes.pdf. Note that=0A=
that paper talks about OS/Process while we have implemented the idea=0A=
for Hypervisor/VM.=0A=
=0A=
Our goal is to emulate something akin to Intel SGX or AMD SEV,=0A=
but using only existing virtual memory features common in all=0A=
processors. The basic idea is not to map guest memory into the=0A=
hypervisor so that a compromised hypervisor cannot compromise=0A=
(e.g. read/write) the guest. This idea has been proposed before,=0A=
however, Virtual Memory Fuses go one step further; they delete the=0A=
hypervisor's mappings to its own page tables, essentially locking=0A=
the virtual memory configuration for the lifetime of the system. This=0A=
creates what we call "Software Enclaves", ensuring that an adversary=0A=
with arbitrary code execution in the hypervisor STILL cannot read/write=0A=
guest memory.=0A=
=0A=
With this technique, we protect the integrity and confidentiality of=0A=
guest memory. However, a compromised hypervisor can still read/write=0A=
register state during traps, or refuse to schedule a guest, denying=0A=
service. We also recognize that because this technique precludes=0A=
modifying Xen's page tables after startup, it may not be compatible=0A=
with all of Xen's potential use cases. On the other hand, there are=0A=
some uses cases (in particular statically defined embedded systems)=0A=
where our technique could be adopted with minimal friction.=0A=
=0A=
With this in mind our goal is to work with the Xen community to=0A=
upstream this work as an optional feature. At this point, we have=0A=
a prototype implementation of VMF on Xen (the contents of this RFC=0A=
patch series) that supports dom0less guests on arm 64. By sharing=0A=
our prototype, we hope to socialize our idea, gauge interest, and=0A=
hopefully gain useful feedback as we work toward upstreaming.=0A=
=0A=
** IMPLEMENTATION **=0A=
In our current setup we have a static configuration with dom0 and=0A=
one or two domUs. Soon after boot, Dom0 issues a hypercall through=0A=
the xenctrl interface to blow the fuse for the domU. In the future,=0A=
we could also add code to support blowing the fuse automatically on=0A=
startup, before any domains are un-paused.=0A=
=0A=
Our Xen/arm64 prototype creates Software Enclaves in two steps,=0A=
represented by these two functions defined in xen/vmf.h:=0A=
void vmf_unmap_guest(struct domain *d);=0A=
void vmf_lock_xen_pgtables(void);=0A=
=0A=
In the first, the Xen removes mappings to the guest(s) On arm64, Xen=0A=
keeps a reference to all of guest memory in the directmap. Right now,=0A=
we simply walk all of the guest second stage tables and remove them=0A=
from the directmap, although there is probably a more elegant method=0A=
for this.=0A=
=0A=
Second, the Xen removes mappings to its own page tables.=0A=
On arm64, this also involves manipulating the directmap. One challenge=0A=
here is that as we start to unmap our tables from the directmap,=0A=
we can't use the directmap to walk them. Our solution here is also=0A=
bit less elegant, we temporarily insert a recursive mapping and use=0A=
that to remove page table entries.=0A=
=0A=
** LIMITATIONS and other closing thoughts **=0A=
The current Xen code has obviously been implemented under the=0A=
assumption that new pages can be mapped, and that guest virtual=0A=
addresses can be read, so this technique will break some Xen=0A=
features. However, in the general case (in particular for static=0A=
workloads where the number of guest's is not changed after boot)=0A=
we've seen that Xen rarely needs to access guest memory or adjust=0A=
its page tables.=0A=
=0A=
We see a lot of potential synergy with other Xen initiatives like=0A=
Hyperlaunch for static domain allocation, or SEV support driving new=0A=
hypercall interfaces that don't require reading guest memory. These=0A=
features would allow VMF (Virtual Memory Fuses) to work with more=0A=
configurations and architectures than our current prototype, which=0A=
only supports static configurations on ARM 64.=0A=
=0A=
We have not yet studied how the prototype VMF implementation impacts=0A=
performance. On the surface, there should be no significant changes.=0A=
However, cache effects from splitting the directmap superpages could=0A=
introduce a performance cost.=0A=
=0A=
Additionally, there is additional latency introduced by walking all the=0A=
tables to retroactively remove guest memory. This could be optimized=0A=
by reworking the Xen code to remove the directmap. We've toyed with=0A=
the idea, but haven't attempted it yet.=0A=
=0A=
Finally, our initial testing suggests that Xen never reads guest memory=0A=
(in a static, non-dom0-enchanced configuration), but have not really=0A=
explored this thoroughly.=0A=
We know at least these things work:=0A=
	Dom0less virtual serial terminal=0A=
	Domain scheduling=0A=
We are aware that these things currently depend on accessible guest=0A=
memory:=0A=
	Some hypercalls take guest pointers as arguments=0A=
	Virtualized MMIO on arm needs to decode certain load/store=0A=
	instructions=0A=
=0A=
It's likely that other Xen features require guest memory access.=0A=
=0A=
Also, there is currently a lot of debug code that isn't needed for=0A=
normal operation, but assumes the ability to read guest memory or=0A=
walk page tables in an exceptional case. The xen codebase will need=0A=
to be audited for these cases, and proper guards inserted so this=0A=
code doesn't pagefault.=0A=
=0A=
Thanks for allowing us to share our work with you. We are really=0A=
excited about it, and we look forward to hearing your feedback. We=0A=
figure those working with Xen on a day to day basis will likely=0A=
uncover details we have overlooked.=0A=
=0A=
Jackson=0A=

