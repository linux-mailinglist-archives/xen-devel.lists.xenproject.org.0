Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2EE6BA4FA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 03:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509869.786512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcGSS-0006wL-At; Wed, 15 Mar 2023 02:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509869.786512; Wed, 15 Mar 2023 02:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcGSS-0006uc-55; Wed, 15 Mar 2023 02:01:40 +0000
Received: by outflank-mailman (input) for mailman id 509869;
 Wed, 15 Mar 2023 02:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4g8=7H=cs.rochester.edu=ejohns48@srs-se1.protection.inumbo.net>)
 id 1pcGSQ-0006uW-FR
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 02:01:38 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20706.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::706])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f0f708b-c2d5-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 03:01:34 +0100 (CET)
Received: from MN2PR07MB6045.namprd07.prod.outlook.com (2603:10b6:208:103::14)
 by DM6PR07MB6235.namprd07.prod.outlook.com (2603:10b6:5:158::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 02:01:30 +0000
Received: from MN2PR07MB6045.namprd07.prod.outlook.com
 ([fe80::615e:312b:3b80:5ac2]) by MN2PR07MB6045.namprd07.prod.outlook.com
 ([fe80::615e:312b:3b80:5ac2%4]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 02:01:29 +0000
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
X-Inumbo-ID: 4f0f708b-c2d5-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H83Rndx2svK0WRZCYlY4gSaWSzFcn1BHhMrTGEBncE+o9JPjivpwC4ReOlIuoHshkHnDB8hKJuy/OcNWggmE7tIk59DYb1qbK9RWiVEytV30lRe9VBzZ5EVVBeMTg2JX8XGA6D4gq+qIleBEGDBTBsvCCSVlEB8bBFMMYPaEk/F1inu49XsVm3Hib5MRhG0Q1QF2OgsB929Tj8+zPAXGTTq5juV/CRtVAblZislmc3LU7/StLR4pmGiwHPQHXBd4NAmFbUfIG3xbkG1KVWR7yRXsqdx8X5lNE5VqRbocemVsqspDviN8K2YQEbxxcAct+tDgJX0+yqmlOH7KOo8tsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bS4bqKdaHpKCLCbXaeXVWQzqV3Jo/P6WhYxvLdZVUA=;
 b=HkBSQTVQJYtlm1C88rB26MKP6dmoIwTYgSgthcsCOkORZqqw7+FqoOSovIpP1qxjqHRySaTBx9AQupmaeCMFQEz/Y/H7IXo5CBBHG3WqAt+VloFQESzvfSBn90uAFXydj4nDZlClg08xGraWrcz6q8lmYhbTGrACLEJGWVtnFH5G3abME0fSnBiRudOVrqSGPb3gUEGitKA7JhjWNinlRlVUfdqzjz2KuhqiaDD6FOasBxO/IHEl2xgXti1Ki3woH4Sm5pvGNtRQQkEE3D/5ct0D+hPnjW1TAojkzD4z+SitWKdF2whHyAXqNN1kFHmpLX8UYA47zyjoy9szIC3RDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs.rochester.edu; dmarc=pass action=none
 header.from=cs.rochester.edu; dkim=pass header.d=cs.rochester.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.rochester.edu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bS4bqKdaHpKCLCbXaeXVWQzqV3Jo/P6WhYxvLdZVUA=;
 b=lKjEH6v+3UfT+K7vAwTPu9RmRC1POIX7L2bYFXhurZDHO9DeuL/wSkSXMOSrOgdQ3lHpNd1tTiKUj1hx0yBwDNpX6tSEKlRgqV0iLz6mJ11Jx3jEhRNviB3B77ItUWEvVj09le9nBRxYFHelxtYd+NqgMGOyeKJT0peQ5Su1F4M=
From: "Johnson, Ethan" <ejohns48@cs.rochester.edu>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Best way to use altp2m to support VMFUNC EPT-switching?
Thread-Topic: Best way to use altp2m to support VMFUNC EPT-switching?
Thread-Index: AdlW4ZyKUvgJbymyR8ifY2W3pwWzBw==
Date: Wed, 15 Mar 2023 02:01:29 +0000
Message-ID:
 <MN2PR07MB6045100322F58085DD6B1488E4BF9@MN2PR07MB6045.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs.rochester.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR07MB6045:EE_|DM6PR07MB6235:EE_
x-ms-office365-filtering-correlation-id: 69f69339-3a93-45ff-187b-08db24f93118
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4LF/6FyOxqvPgBgMnrAnNjHuZlGJkw8Y5MXuR+hoWbeCqu9bcX5eHInOXed2oAepbD2y9JIIIL+RfJzKWNOZ+0eQuVR1V8NMnUHRJU5csliCWcPYD48NoHT0FK0PScwJgmVgHWLQaz6O6sg3jCwivktHVHAR3N3VrxWD/9zYYjVX5Su40UbKJu1Dqcea5+qn2oVj6N2WLz4X2brn8oDczyfyvD/pMpeBZsMYT7KkxzQuGjFsomz/lKIeTe/p4yMvoZc3wmfjT3U5TcBNA92gjWY4UVqBuvyotGOpvcjU6/2x+fYu3RTaKmIb8RhM2mKMi/jlffUV0qK2FjIk/zhNsS11oTtGJQmOK9U8OvVuCl1EGW35JbhC3BXqzidKtILkHb+MX+sTwM9CKTPgQAybpfkFbmLnTbUAChT/1VYYzWBsuoS5arUgWo3nk8CTjmYq1fIMQCuzWKC4WS7hA+er6lrEiQIaZsOFBtZPFgxpcWMMLMY9ApaePlOLneGQMtAe5MA0hECdnzlnCmxoB59ETfVB9u8DC7zBPQ2C2nj+7p2hVKSKDexuFNmiEtrfg7UyCJXz9a1CJNS8Q5bmC06uMcRTpYK4ZsVek8R+iWEqM+GYtQEluQUIIp6ELgeYmNp0OkDy9y073gx7wKgURy6FelJGTujBNqW3BZ1qGeTLUf6YcSprkehGX1VWSdBzvCOSPQdOcNR6H7KVaSDbEDNSR+utxsByIpBGchKGtV5eDjg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR07MB6045.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199018)(6506007)(55016003)(316002)(786003)(41300700001)(66446008)(66556008)(8676002)(186003)(66899018)(66476007)(76116006)(64756008)(9686003)(6916009)(66946007)(83380400001)(478600001)(71200400001)(38070700005)(75432002)(7696005)(38100700002)(86362001)(2906002)(122000001)(8936002)(41320700001)(33656002)(52536014)(5660300002)(43043002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LSjd1Y9yZZaIW+ZT81lu07TdKxLUw7Ll3vMnOMl5aBgRxMHw+QZ4qSZZyqyO?=
 =?us-ascii?Q?1phgbUOnDtE7DlTpNoOh61U8R7eGqRL+HFuH4tYHlt4Z2wyX8y774T9AzbkX?=
 =?us-ascii?Q?RRS5KjUlBgXiUYLB4PzgfIa3pMWapgokffnP2xZ0TMKpTlP31mhMVnKNpR+y?=
 =?us-ascii?Q?DGEgwVn98PH+IMLmrA/WsrsWVkuII8S1IpQa2zfLfwnGLJ3/0fd+oNcsHC0R?=
 =?us-ascii?Q?I8PTOY9dU8g1Zk1dntNx9UBRp53f4eW3Ap6+zgFZVNJdqF1xPWm7A1uDzZdC?=
 =?us-ascii?Q?UVXcsTS2ONiG1V1ka6AbwQqc/8Rj4pENcOpMnjDUdmXuJLwuVDeLEsDIy+N7?=
 =?us-ascii?Q?T0w0ZmDyGcvBWhcygJIsIY4d1jkbMpG0BJZG+BQagCflON8eiFORsOBlgnQn?=
 =?us-ascii?Q?xdeRoGJN78gy56iICA7ouSgBDC7OiWTqHM592UfoQThY8uUIt9/qsYvsslac?=
 =?us-ascii?Q?bvix1eiWKh2nzk0d9TE8XDsk4nQLberHakfPgojblw/VO4qLRKME56b1AANp?=
 =?us-ascii?Q?JDkjLEUYYjOqzvI76jSzNig9jBVZfC9OG1RF5qnOwwPNU8w6zq7utIbLeCB6?=
 =?us-ascii?Q?F8TQBkqyAS3Yo8gGW9/qImyTNEOMkLpBPrLMplAa//H9iqIQ9JYrl+abSZ1A?=
 =?us-ascii?Q?C3llSjgtJhSp4P+l2chtzPHB5+VCEwF7aqXZrpClTb0WGcVLn5TqV3ADwNlO?=
 =?us-ascii?Q?Z6z1xXQEfowO/hniwGBMBDj1FXcAe/oIOblXOvEJanVVuiPDHehOGMzkwKVG?=
 =?us-ascii?Q?eb4niZ7CEultlfkiXgXHKdIMTLQByJdq+wz/Dft4HMfD/dwKlbnWw7m5/IVM?=
 =?us-ascii?Q?jRlEr6YnO6BR5PTp7H8/lsuB/CgdR0+67F1txeAqdo+Cdr+YsVfXG8Biq2CJ?=
 =?us-ascii?Q?vISYu+VyqKYvbQIzTYUNcab6r+UFV4qobBFDTDjai144Bt/AW99FrFuTr1qF?=
 =?us-ascii?Q?UQMImYKZ0IkcbXVpkzdj4hbxbtzA0CLp36emuTqsrY+CGf5bV0+Bmka7gNUk?=
 =?us-ascii?Q?TAt0CZ4b1q/RRUXLSvxmi5A3AilxcxDN+09DTgyLvJE4GuvHwwvQihrw4ll+?=
 =?us-ascii?Q?c/rR/6B//LlxYGEHbKCGsdnayHxSvW2dGNjbOvVrytjVcwK3kxevbL2ZXzMS?=
 =?us-ascii?Q?SY5aSYGyfnazbE8N1eVi1K9iUoiFMfv2qqqxypATEC6W8ObXjiFudyiSAvO6?=
 =?us-ascii?Q?+QxQgXh/L/aSQdQWgJnk4Za8AztSPtTkW1BvY2M3+h6WNw+KhBtPK0fYfobW?=
 =?us-ascii?Q?1TEFRfSmj1DBpd4o8xtDw/v2gw4JhVKllnRF/Oq4LCaaEwB3dfiY6bQdvec8?=
 =?us-ascii?Q?B5iIO5R9DDJGCavA09rsIDPYDdUJyVbvzd5eXCcerXbHecCxOJ/wxea8xyMM?=
 =?us-ascii?Q?x2cEuMrkPcGEwM9SeFVk0slB790vutxZPrFermPBNwXJY0zr1BbIe+e2m7SC?=
 =?us-ascii?Q?gAMiYoLCc09156oMMyKvIAQ9159sqA/yjxD8B1oirObiIcp/I18JHtzlCnc5?=
 =?us-ascii?Q?MLth5ejTZ/+8pKwdjmJYW7x3+KIBjcGalykM76CWAZ+Svpq89+hIrXKhpf/C?=
 =?us-ascii?Q?vxVOY4BGYlm9c/JVDF1b77NoEfvGsBiVy8I6iDkgkOBNTpi4n96RIMp/o/sY?=
 =?us-ascii?Q?m4oM3bOe3Tvq1pLha/qDNkoBbAcGYryhO8moWBAVg1ub?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cs.rochester.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR07MB6045.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f69339-3a93-45ff-187b-08db24f93118
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 02:01:29.1707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 374e17f4-cf11-4ce2-b3ef-5de76bf4ce41
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nk8rjZ+wPr/2eWI1Qbkv5yMDRXNz3ER+METztoX6BDQJec7te4lDsk3vOFd1Y/AhPYvk693UTcokj6AvMYT0JNxVzdL9c7QW8t0/EWGJG/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6235

Hi all,

I'm looking for some pointers on how Xen's altp2m system works and how it's=
 meant to be used with Intel's VMFUNC EPT-switching for secure isolation wi=
thin an HVM/PVH guest's kernelspace.

Specifically, I am attempting to modify Xen to create (on request by an alr=
eady-booted, cooperative guest with a duly modified Linux kernel) a second =
set of extended page tables that have access to additional privileged regio=
ns of host-physical memory (specifically, a page or two to store some sensi=
tive data that we don't want the guest kernel to be able to overwrite, plus=
 some host-physical MMIO ranges, specifically the xAPIC region). The idea i=
s that the guest kernel will use VMFUNC to switch to the alternate EPTs and=
 call "secure functions" provided (by the hypervisor) as read-only code to =
be executed in non-root mode on the alternate EPT, allowing certain VM-exit=
 scenarios (namely, sending an IPI to another vCPU of the same domain) to b=
e handled without exiting non-root mode. Hence, these extra privileged page=
s should only be visible to the alternative p2m that the "secure realm" fun=
ctions live in. (Transitions between the secure- and insecure-realm EPTs wi=
ll be through special read-only "trampoline" code pages that ensure the unt=
rusted guest kernel can only enter the secure realm at designated entry poi=
nts.)

Looking at Xen's existing altp2m code, I get the sense that Xen is already =
designed to support something at least vaguely like this. I have not, howev=
er, been able to find much in the way of documentation on altp2m, so I am r=
eaching out to see if anyone can offer pointers on how to best use it.

What is the intended workflow (either in the toolstack or within the hyperv=
isor itself) for creating and configuring an altp2m that should have access=
 to additional host-physical frames that are not present in the guest's mai=
n p2m?

FWIW, once the altp2m has been set up in this fashion, we don't anticipate =
needing to fiddle with its mappings any further as long as the guest is run=
ning (so I'm thinking *maybe* the "external" altp2m mode will suffice for t=
his). In fact, we may not even need to have any "overlap" between the prima=
ry and alternative p2m except the trampoline pages themselves (although thi=
s aspect of our design is still somewhat in flux).

I've noticed a function, do_altp2m_op(), in the hypervisor (xen/arch/x86/hv=
m/hvm.c) that seems to implement a number of altp2m-related hypercalls inte=
nded to be called from the dom0. Do these hypercalls already provide a stra=
ightforward way to achieve my goals described above entirely via (a potenti=
ally modified version of) the dom0 toolstack? Or would I be better off crea=
ting and configuring the altp2m from within the hypervisor itself, since I =
want to map low-level stuff like xAPIC MMIO ranges into the altp2m?

Thank you in advance for your time and assistance!

Sincerely,

Ethan Johnson
Computer Science PhD candidate, Systems group, University of Rochester
mailto:ejohns48@cs.rochester.edu

