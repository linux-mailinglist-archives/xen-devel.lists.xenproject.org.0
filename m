Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C70975DA3E
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 07:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567589.887302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN5Qa-0008Ea-Q1; Sat, 22 Jul 2023 05:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567589.887302; Sat, 22 Jul 2023 05:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN5Qa-0008CE-Ms; Sat, 22 Jul 2023 05:45:16 +0000
Received: by outflank-mailman (input) for mailman id 567589;
 Fri, 21 Jul 2023 14:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=icXM=DH=nxp.com=george.mocanu@srs-se1.protection.inumbo.net>)
 id 1qMr7f-0003ZE-TE
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 14:28:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e60d798c-27d2-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 16:28:45 +0200 (CEST)
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5)
 by DBBPR04MB7865.eurprd04.prod.outlook.com (2603:10a6:10:1e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 14:28:42 +0000
Received: from PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8090:c99d:36d1:fd0c]) by PA4PR04MB9224.eurprd04.prod.outlook.com
 ([fe80::8090:c99d:36d1:fd0c%4]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 14:28:42 +0000
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
X-Inumbo-ID: e60d798c-27d2-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4BEAsbRhyY14PyJZ2Oxnaindd5Jv6Txpy2PNMT58g3Wu6EngT1LZRFbWsd3VfDxKESengt91CHRDNqk/5TOnhfrPxH+latxi19XlL04VChsSBr1R0lj0W+x1zDZLhmZFZMhO6I/WjfHeZBoXTz6aW4sXdop1qd+UhMOt9Tzy9VTa7jAfhLNCiHXKJHP0apPDWZ+ctin29e4dTSgReHj/3A5okvi3xDK2lYGx/nDHzvgH7QR2h+IzbQju6oFz/Fkb3xtNLr64LPjWo+3Q7y74miUBvYTmF6WBoRSj8DUP++LD4nyN5N+xgWGmk1PROm9KXK8UZ7cz3eImO3/B7CyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fkF1gi4yv1anqQphJwiAe5V5eXV4Q9xEOnZXRJ9f4k=;
 b=fc2+KeaXkQLvxNibkpa2AhDOEubzxW3iZp4TPIRbXZHXR1UCQpXamkHdrTa1iU7FpUvyCkMvsGYFQBjWoyjjm+L5WQvwcfV5absjec4pumaYAQe7MFpzUUm+XqHdeb4nnd3k1FhiwZ4FAbiqclvP+9uLlgWRCo9MtN644JE9zfIBGftSx6oCCqy5V3uh7oAdYp8x746Elko92gFb2xBZdNzQ0ZaKUxys01fsVbefS2uxGqXbjaL7yvim2ZuXyW2oHvyG+e+PjAKn3m+MvLWlZcbku7pB/xGydQDF0pKm3qcthoil/8Tk2tpDH8X+DP7SwgcQQ2ghXgc6r+zhZ3chMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fkF1gi4yv1anqQphJwiAe5V5eXV4Q9xEOnZXRJ9f4k=;
 b=FmcnHrLpuDVLlCZSJ9697Xtk4VopkWgw9lWzfZia1dK+NtssrbcEVb+CJnFvwb3BYXenIpM25/EJ5q6bjqrUcSFDEpst1KpKktWRjb/Q5X1y0EiIlSMAj8vgSC64nOytYNmUTAGAuenWEMef1Z6WcLkz25lxVOEZWbSzQkqZLBs=
From: George Mocanu <george.mocanu@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [ARM][xencons] PV Console hangs due to illegal ring buffer
 accesses
Thread-Topic: [ARM][xencons] PV Console hangs due to illegal ring buffer
 accesses
Thread-Index: AQHZu9+mUGszY5KMlkWI3r1B3a7IQw==
Date: Fri, 21 Jul 2023 14:28:42 +0000
Message-ID:
 <PA4PR04MB9224D6AC1B217212D007D4D0FB3FA@PA4PR04MB9224.eurprd04.prod.outlook.com>
References: <62eeff72-c1fb-6932-6797-1b0058c97b03@oss.nxp.com>
 <048266d6-a32f-5f4e-984a-8b74de01a1fc@xen.org>
 <alpine.DEB.2.22.394.2307201609030.3118466@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2307201609030.3118466@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9224:EE_|DBBPR04MB7865:EE_
x-ms-office365-filtering-correlation-id: 38eeac72-9771-4832-a0c8-08db89f6c8df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qtBMb0qoS7HwsWOe8PI71lKl0UxG1OxAv6LGROmA2mCZ3GzbZJH8BfDzzijvWXK/rn4Nw4nmymmpcmd04cW1HnX/uSqZEl8raUEPHD7k6UrMV1XbgnGw5BPcYsw8PjQdrWr5NjmZFLLU7vUUtAJQ7kW1tPw4Xp6izsB6jAygM6A+bQOUNkVm+qXzN/Nd17EXqhi9uAR5u8yWWRsKl0buIVDlCXizms3Fuid0TJHoBcJ/ENF14JA3v5NTTV8geVOGSJfvqiRx+KOIzb2jxz5I/AtAy7ZMMdPUFbtxDNiejSdPv4FwsvnVRBjXMRTw/NKZB1uqjvv8NQIREGI7CIKrJ0N+FrC0dtI7rZuv+zRMNLBS/yuLNVtvpM61e3Bs/+cTb8sW7vYeFrC0/YciAY4f6NABbxgpIYl2t0CoqDU0M5tvXrNDOeLZJSjTGM+xqLdN+OuWB584asz0+bMdN5oiuY9/EYb4z68nUcWUi+fzmX8CLhkvYU0AXRLohs0pfxMrWj2vwcvUWOK17kuzosliL4fnF0rTbFADVhVDmefiiUPGTiDilmGrJ+5bpShtXxS4QPDhnU2IRdbUT5SpHklepv2Rl2kbxkZuttmpdY5s4RdfjWccGMkBR77D3DDsNSGK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9224.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199021)(55016003)(9686003)(71200400001)(38070700005)(66556008)(64756008)(66446008)(66476007)(4326008)(66946007)(7696005)(2906002)(76116006)(54906003)(110136005)(316002)(478600001)(86362001)(6506007)(53546011)(83380400001)(186003)(122000001)(38100700002)(33656002)(52536014)(5660300002)(8676002)(8936002)(41300700001)(26005)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MpN9fz7A2Nek2gvhxakeKcy2oRM8XHCzpG1kpRMGvKkMC+z1mrmS6nAaQiuD?=
 =?us-ascii?Q?ogAiCOPHs9as5k3OQ0rjb0goWjh2POnR4pBZrboOB835lh505micHozq3ROI?=
 =?us-ascii?Q?l/MLyj4tZeqiVAMtqxnV3t3DaQcYAk3Egzlf9uCZjyOwo3I6BAJhnPXd9t+L?=
 =?us-ascii?Q?biXZonX1q70yv4VL8Z/sn3BgLa3+LrIASl+ZJG/fJ6GdmNBKpbPevX14MZ+z?=
 =?us-ascii?Q?f8+/4cAprWJqcp6/u/p999zTh9LLkETIeDZWxdUtwWHyV5h6tHPjRQI2uiG/?=
 =?us-ascii?Q?krNCDLSdwSSbfr4c2TzAW6Eydz/iA79lmicc/VNwzceGEZMHVTKHKs3wHWXJ?=
 =?us-ascii?Q?SSBVwDe7koY5cy2S9OGJ/fJcsRv6qAF929R7Y4keN8rRlmaC4+88W7ziDwpJ?=
 =?us-ascii?Q?ai5wnO+5Oy88O4M4EDtWiHonOJzs78fTbthb9W2d8Yb4Fcvpc8cDpUjNKilX?=
 =?us-ascii?Q?SzAJMRZtq08SJcHrxyydH+OUmWKE9rLtRiaL64TabrGuVRdaWafmFRhNFelN?=
 =?us-ascii?Q?QRumOaylO0iyRDzmFyKYDzwxTY3ck6qj7fqEpjczSonzTXu2Iemyh0ViOnJt?=
 =?us-ascii?Q?UZZnqwCmxxH+FdgdPlCxtA/tusNJgZenxJYNdjakaGsvaH5mnHPj0R5gOQL5?=
 =?us-ascii?Q?joRxCHaljBUrFXRfChyHrhK/ltHCKDBmY1MtES1Bg6bBMFT+wICMhzfdZybO?=
 =?us-ascii?Q?yBs1t0auN7PoGPWie9oU8ppQgpqz0nspzESkdQr5TUZE+p55aloHaXI1hRA5?=
 =?us-ascii?Q?Cqis5EAkELGAwhsBIsXfkOjtDslwxoXW0sVn97s77cgVEBilxp4QiO7Zf5iG?=
 =?us-ascii?Q?o+wxR2uKfwjUENiBzVWyneYtCa7NP522daYQzoApAB7WCg/lblE3jS8EIpso?=
 =?us-ascii?Q?qYYxQSV2BhSwy6ggBzBzpHLHbF9YA2hxMxGkvz91+Hb6RpBaiEPWwGdIltwP?=
 =?us-ascii?Q?zcP1UCxsQq413PWEOpEa/o38Q7Ibri2Mev2LDm/dd8r8DnJQeZM4a+MlVhPI?=
 =?us-ascii?Q?NHtWD/HdAob8IJpD8g6u919GU3hAg96i3gEw1+kqOBTFdthFH8dxpKZEFKMD?=
 =?us-ascii?Q?tA8vPWrAJU/P7jfZTXJ43RjTI1AlS2UKHFSYRUNEzj56ez9x/FJIAdJMeGAz?=
 =?us-ascii?Q?1aELeYmuRmjODaWEMAMgDXm7ONdblcLARMmzdo2hCXpb2GIQwqgs+rtWXf0G?=
 =?us-ascii?Q?vcjkY93r3L//1PRGMq0RCQK7N8it8Lgx9JiaRwdB9fN89K9gpiY3SH6hald8?=
 =?us-ascii?Q?r5Ln8sINBr5JCV4a+M2Plfyu8G1tBYBA69Mpw8RF8Ytp48KThYOvZ/JrjyKR?=
 =?us-ascii?Q?zLbK8kBeX6yitdcBh9ru0woJWxRoAqUPS2zw278NcqfcMEZB3VREhL1H7lz6?=
 =?us-ascii?Q?a+zIRfA9M8kbgIkisC6IB3smmDbK0cJZx6z0b9x9p1UmaQ+9SPUiwkHWMkC1?=
 =?us-ascii?Q?THey6ZZpT3PxfJfZs4WClHOp8AlWEAou4h9PtTaJMLloEj3ZrwujtWZQsq4H?=
 =?us-ascii?Q?TI9aanbCu02H/gvEL6qcKjCoxIT5RGYA0I4JGWWWBQtqkvDzinsor7zOa3LE?=
 =?us-ascii?Q?q3udo/c8ocBe91LHh4k3Zi3P4X9rBUyyb+6GyFpF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9224.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38eeac72-9771-4832-a0c8-08db89f6c8df
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 14:28:42.7573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5cUwWK5HYfvChn0d6RVqkXi7KLwVmld6RIn7tmVvfpG9LDWKe3ry2H3nRyrQHAasDN8+hr52XxAUaFKVLK76Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7865

Hello, Stefano,=20
Hello, Julien,

Thanks for your suggestions. I gave each of them a try, but it doesn't
look like it brings me anywhere at the moment.

On 21/07/2023 02:25, Stefano Stabellini wrote:
>=20
> On Thu, 20 Jul 2023, Julien Grall wrote:
> > (+ Juergen)
> >
> > On 19/07/2023 17:13, Andrei Cherechesu (OSS) wrote:
> > > Hello,
> >
> > Hi Andrei,
> >
> > > As we're running Xen 4.17 (with platform-related support added) on NX=
P
> S32G
> > > SoCs (ARMv8), with a custom Linux distribution built through Yocto, a=
nd
> > > we've set some Xen-based demos up, we encountered some issues which w=
e think
> > > might not be related to our hardware. For additional context, the Lin=
ux
> > > kernel version we're running is 5.15.96-rt (with platform-related sup=
port
> > > added as well).
> > >
> > > The setup to reproduce the problem is fairly simple: after booting a =
Dom0
> > > (can provide configuration details if needed), we're booting a normal=
 PV
> > > DomU with PV Networking. Additionally, the VMs have k3s (Lightweight
> > > Kubernetes - version v1.25.8+k3s1) installed in
> > > their rootfs'es.
> > >
> > > The problem is that the DomU console hangs (no new output is shown, n=
o input
> > > can be sent) some time (non-deterministic, sometimes 5 seconds, other=
 times
> > > like 15-20 seconds) after we run the `k3s server` command. We have th=
is
> > > command running as part of a sysvinit service, and the same behavior =
can be
> > > observed in that case as well. The k3s version we use is the one ment=
ioned
> > > in the paragraph above, but this can be reproduced with other version=
s as
> > > well (i.e., v1.21.11, v1.22.6). If the `k3s server` command is ran in=
 the
> > > Dom0 VM, everything works fine. Using DomU as an agent node is also w=
orking
> > > fine, only when it is run as a server the console problem occurs.
> > >
> > > Immediately after the serial console hangs, we can still log in on Do=
mU
> > > using SSH, and we can observe the following messages its dmesg:
> > > [   57.905806] xencons: Illegal ring page indices
> >
> > Looking at Linux code, this message is printed in a couple of place in =
the
> > xenconsole driver.
> >
> > I would assume that this is printed when reading from the buffer (other=
wise
> > you would not see any message). Can you confirm it?
> >
> > Also, can you provide the indices that Linux considers buggy?

Adding to what Andrei said previously, we login into the DomU console
to observe its state, and send some input keys to confirm whether it is
in the buggy state. Considering this flow, it looks like this message
comes from the write_console() call. In one instance I started the k3s
server process in the console (disabled the sysvinit service beforehand),
then proceeded to kill it after some time - a message from read_console()
was displayed in that instance. As for the indices, I've dumped them in
a separate message, and they are different always:

[   45.303520] xencons: Illegal ring page indices -- write_console()
[   45.303529] xencons: prod 4289880869, cons 2015782840, intf->out size 20=
48

[   59.203570] xencons: Illegal ring page indices -- write_console()
[   59.203576] xencons: prod 1735287148, cons 1869033263, intf->out size 20=
48

[   40.838740] xencons: Illegal ring page indices -- write_console()
[   40.838753] xencons: prod 1647211507, cons 2923534489, intf->out size 20=
48
[...]
[  126.184299] xencons: Illegal ring page indices -- read_console()
[  126.184317] xencons: prod 127, cons 1815732224, intf->int size 1024

> >
> > Lastly, it seems like the barrier used are incorrect. It should be the
> > virt_*() version rather than a plain mb()/wmb(). I don't think it matte=
r for
> > arm64 though (I am assuming you are not running 32-bit).
> >

Replaced them with the virt_*() relatives, but I couldn't notice any change
in the behavior.

> > > [   59.399620] xenbus: error -5 while reading message
> >
> > So this message is coming from the xenbus driver (used to read the xens=
tore
> > ring). This is -EIO, and AFAICT returned when the indices are also inco=
rrect.
> >
> > For this driver, I think there is also a TOCTOU because a compiler is f=
ree to
> > reload intf->rsp_cons after the check. Moving virt_mb() is probably not
> > sufficient. You would also want to use ACCESS_ONCE().
> >
> > What I find odd is you have two distinct rings (xenconsole and xenbus) =
with
> > similar issues. Above, you said you are using Linux RT. I wonder if thi=
s has a
> > play into the issue because if I am not mistaken, the two functions wou=
ld now
> > be fully preemptible.
> >
> > This could expose some races. For instance, there are some missing
> > ACCESS_ONCE() (as mentioned above).
> >
> > In particular, Xenstored (I haven't checked xenconsoled) is using +=3D =
to update
> > intf->rsp_cons. There is no guarantee that the update will be atomic.
> >
> > Overall, I am not 100% sure what I wrote is related. But that's probabl=
y a
> > good start of things that can be exacerbated with Linux RT.

Added memory barriers wherever I saw the corresponding ring indexes used in
both the xenconsole and xenbus drivers, but nothing changed.

> >
> > > [   59.399649] xenbus: error -5 while writing message
> >
> > This is in xenbus as well. But this time in the write part. The analysi=
s I
> > wrote above for the read part can be applied here.
>=20
> This is really strange. What is also strange is that somehow the indexes
> recover after 10-15 seconds? How is that even possible. Let's say there
> is a memory corruption of some sort, maybe due to missing barriers like
> Julien suggested, how can it go back to normal after a while?
>=20
> I am really confused. I would try with regular Linux instead of Linux RT
> and also would try to replace all the barriers in
> drivers/tty/hvc/hvc_xen.c with their virt_* version to see if we can
> narrow down the problem a bit.
>=20
>=20
> Keep in mind that during PV network operations grants are used, which
> involve mapping pages at the backend and changing the MMU/IOMMU
> pagetables to introduce the new mapping. After the DMA operation,
> typically the page is unmapped and removed from the pagetable.
>=20
> Is it possible that the pagetable change is causing the problem, and
> when the mapping is removed everything goes back to normal?
>=20
> I don't know how that could happen, but the mapping and unmapping of the
> page is something ongoing which could break things then go back to
> normal. One thing you could try is to force all DMA operations to go via
> swiotlb-xen in Linux:
>=20
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index 3d826c0b5fee..f78d86f1bb9c 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -112,8 +112,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
>          * require a bounce buffer because the device doesn't support coh=
erent
>          * memory and we are not able to flush the cache.
>          */
> -       return (!hypercall_cflush && (xen_pfn !=3D bfn) &&
> -               !dev_is_dma_coherent(dev));
> +       return true;
>  }
>=20
>  static int __init xen_mm_init(void)
>=20
>=20
> Then you can remove any iommu pagetable flushes in Xen:
>=20
>=20
> diff --git a/xen/arch/arm/include/asm/grant_table.h
> b/xen/arch/arm/include/asm/grant_table.h
> index d3c518a926..b72f8391bd 100644
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -74,7 +74,7 @@ int replace_grant_host_mapping(uint64_t gpaddr, mfn_t
> frame,
>      page_get_xenheap_gfn(gnttab_status_page(t, i))
>=20
>  #define gnttab_need_iommu_mapping(d)                    \
> -    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
> +    (0)
>=20
>  #endif /* __ASM_GRANT_TABLE_H__ */
>  /*
>=20
>=20
> I don't know how this could be related but it might help narrow down the
> problem.

Applied your suggestion regarding DMA operations, but we observe the same
behavior (the serial console would hang after some time), besides some new
issues with some other drivers.

We will continue to look into this issue, but if you have some new ideas,
please let us know.

Thank you,
George Mocanu


