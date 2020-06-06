Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2440C1F0434
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jun 2020 03:58:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhO5c-0003Ra-7L; Sat, 06 Jun 2020 01:57:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDS1=7T=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1jhO5a-0003RV-Q0
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2020 01:57:38 +0000
X-Inumbo-ID: 18871da2-a799-11ea-9ad7-bc764e2007e4
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.94.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18871da2-a799-11ea-9ad7-bc764e2007e4;
 Sat, 06 Jun 2020 01:57:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5yQDjzeZA2ZW+wNypy1gdacpwbr1reaXhH53PdTTdrlmjH0GN7ZaT86RhEFo6qx34WDjeSuKEpnCe9pNk5zCRH+cNp6Lc0cDBUD40E4OAS1f420j+LwXmDXQb3F7cXNBW7Ry75lHyt181hiJJEv5ZOpRWhKLNcg6JrBArV24WL6jd8rsk4p+rORyfPy32omdaj7EpxSX/M2tXcAZ0bRsx2LjWPuY9dK61adf6ErI5ecY66luXfXtNSL7wAy3pPHJs+PvdLx2DjV70y8ui+65g0YMsdkaVJSgb2EKZVbXJWFlXYMRl1oFJWLUunYq5xXKKChKDTM6yp0qrj2hU9b7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SWa+4wJIr8PRP73/Tk/e3pk3rHG+XUoUaeUkeyzsHY=;
 b=EAsUK8fJs+gDYpTBXhaWeb9jxlyw7KFcWXcSIU1ag/WcRYBF11PYHUOh/DelF5VCUGIG1blreFjdLXhOV/pcM9YP1RbeI6wUawkr4agWMnBBqgKFgzH1XyOF4M3tXGp4VPOwuXFq76Cqbl6ul1XB6y5IREgKWY0ogJebMZ8X3hKV/ysQj6OajXjXFcXp+nC3mqJNaCUPrCxM1jmhGLXzGZ0+NAxbuNu7Yz/U48uacLaUPuqPeGABuoCC1Qq4t3RrnSJyMvYBJdojDVr+FG8h4iOzfA0yF7iVQLyWPn+AxPQsdYjLIgKXtqx+WwkgxWJKtWLziM1HrfICn7WqqwxsCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=tklengyel.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SWa+4wJIr8PRP73/Tk/e3pk3rHG+XUoUaeUkeyzsHY=;
 b=p2ND2FpwOgqySFy26jzXXrcDXbm7CDu2Fjcoj3yDZkrVGcp7Frm5TaIQS/9jdgFtCoxr65rfO33N7nAam6vBmIeuuLAlJfhsMJHZQ+wuGaGEe85mCi1UCHuUusm/HxhEUf33XTUaN58kv17m39MTs3ksDLQcLH8PSiCGFlICn4w=
Received: from MN2PR14CA0005.namprd14.prod.outlook.com (2603:10b6:208:23e::10)
 by BY5PR02MB6771.namprd02.prod.outlook.com (2603:10b6:a03:200::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Sat, 6 Jun
 2020 01:57:35 +0000
Received: from BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23e:cafe::bc) by MN2PR14CA0005.outlook.office365.com
 (2603:10b6:208:23e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Sat, 6 Jun 2020 01:57:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; tklengyel.com; dkim=none (message not signed)
 header.d=none;tklengyel.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT032.mail.protection.outlook.com (10.152.77.169) with Microsoft SMTP
 Server id 15.20.3066.18 via Frontend Transport; Sat, 6 Jun 2020 01:57:35
 +0000
Received: from [149.199.38.66] (port=48896 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jhO4k-0007JX-0W; Fri, 05 Jun 2020 18:56:46 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jhO5X-0004eT-5w; Fri, 05 Jun 2020 18:57:35 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 0561vUWZ013636; 
 Fri, 5 Jun 2020 18:57:30 -0700
Received: from [172.19.2.220] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <stefanos@xilinx.com>)
 id 1jhO5S-0004e6-H9; Fri, 05 Jun 2020 18:57:30 -0700
Date: Fri, 5 Jun 2020 18:57:30 -0700 (PDT)
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
In-Reply-To: <d0e9dec8-40c6-13c3-724f-aa05e1ec3063@xen.org>
Message-ID: <alpine.DEB.2.21.2006041027570.6774@sstabellini-ThinkPad-T480s>
References: <20200603223156.12767-1-sstabellini@kernel.org>
 <3b3fa1cd-e50a-66f7-f5ac-eebc6f1d0953@xen.org>
 <24026a53-044b-843c-e548-22bb8325e5a7@arm.com>
 <alpine.DEB.2.21.2006040916370.6774@sstabellini-ThinkPad-T480s>
 <fb58e72b-2731-9d1b-5fb1-1fc14e3ef31f@arm.com>
 <alpine.DEB.2.21.2006040940140.6774@sstabellini-ThinkPad-T480s>
 <d0e9dec8-40c6-13c3-724f-aa05e1ec3063@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1812385704-1591291830=:6774"
Content-ID: <alpine.DEB.2.21.2006041030360.6774@sstabellini-ThinkPad-T480s>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(7916004)(136003)(346002)(39860400002)(396003)(376002)(46966005)(8676002)(6916009)(4326008)(426003)(478600001)(336012)(9786002)(8936002)(9686003)(70206006)(70586007)(107886003)(966005)(44832011)(33964004)(54906003)(316002)(33716001)(186003)(47076004)(53546011)(356005)(26005)(83380400001)(82310400002)(82740400003)(81166007)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fbc4ad1-dfbf-404d-c81c-08d809bcfbc9
X-MS-TrafficTypeDiagnostic: BY5PR02MB6771:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6771AE778811BEC2908F529FA0870@BY5PR02MB6771.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04267075BD
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h8QWAo4jIw2wENYKKfCy2TfV886s4+trn1RbGEsiuWng0CUmpX0v6nCkCner8XUGUGhcJihr95a9AYPvSgUWklqPF1Zjcu04brmwY3kOgtwtCjLERBRqpNPOKV0Mi0fHBmNRdKBrHi8lEQ9j7l30Q2gGvrra5igy2TDhrJ9MmzJxVtMbPVucc2BN43RSxm/9PurZgKhy2ea9ZFYnbIiL4/YJ1DaZDtZz5snkLLiX3xHbL+KW7MciQH5TA3dw2HwtZm3jtkbm6AvRViJwUJTyMbvASr8keCDZ6PaZbsGJet7gKjjRwhOjgz0QXyWAfzQK3qlLX5nwXiCSehj9NIHQ0HQlMdIRU3K3MsxjvB+y4sTm5xH4WM7AVJ0i60c0S+DJ48EYbs/q8DOwBwk9xS2tevlyE73Mr942Zgo1RUsD8k3GGuEryd4PDLstHCX5nmYONdtpkQ2mmvMzxxyTNgP6tTQ4TNsTDX9cYtOTjNmR9aI=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2020 01:57:35.5622 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbc4ad1-dfbf-404d-c81c-08d809bcfbc9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6771
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
Cc: cminyard@mvista.com, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>, roman@zededa.com,
 tamas@tklengyel.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1812385704-1591291830=:6774
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.DEB.2.21.2006041030361.6774@sstabellini-ThinkPad-T480s>

On Thu, 4 Jun 2020, Julien Grall wrote:
> On 04/06/2020 17:46, Stefano Stabellini wrote:
> > On Thu, 4 Jun 2020, Andr=C3=A9 Przywara wrote:
> > > On 04/06/2020 17:24, Stefano Stabellini wrote:
> > > > On Thu, 4 Jun 2020, Andr=C3=A9 Przywara wrote:
> > > > > On 04/06/2020 09:48, Julien Grall wrote:
> > > > >=20
> > > > > Hi,
> > > > >=20
> > > > > > On 03/06/2020 23:31, Stefano Stabellini wrote:
> > > > > > > Touching the watchdog is required to be able to reboot the bo=
ard.
> > > > > >=20
> > > > > > In general the preferred method is PSCI. Does it mean RPI 4 doe=
sn't
> > > > > > support PSCI at all?
> > > > >=20
> > > > > There is mainline Trusted Firmware (TF-A) support for the RPi4 fo=
r a
> > > > > few
> > > > > months now, which includes proper PSCI support (both for SMP brin=
gup
> > > > > and
> > > > > system reset/shutdown). At least that should work, if not, it's a=
 bug.
> > > > > An EDK-2 build for RPi4 bundles TF-A automatically, but you can u=
se
> > > > > TF-A
> > > > > without it, with or without U-Boot: It works as a drop-in replace=
ment
> > > > > for armstub.bin. Instruction for building it (one line!) are here=
:
> > > > > https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/=
docs/plat/rpi4.rst
> > > > >=20
> > > > > > >=20
> > > > > > > The implementation is based on
> > > > > > > drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
> > > > > >=20
> > > > > > Can you give the baseline? This would allow us to track an issu=
e and
> > > > > > port them.
> > > > >=20
> > > > > Given the above I don't think it's a good idea to add extra platf=
orm
> > > > > specific code to Xen.
> > > >=20
> > > > The RPi4, at least the one I have, doesn't come with any TF, and it
> > >=20
> > > My RPi4 didn't come with anything, actually ;-) It's just a matter of
> > > what you put in the uSD card slot.
> > >=20
> > > > doesn't come with PSCI in device tree.
> > >=20
> > > TF-A patches the PSCI nodes in:
> > > https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/pl=
at/rpi/rpi4?id=3Df67fa69cb6937a7fc559bbec4a7acce5edefa888
> > >=20
> > > > As a user, I would rather have
> > > > this patch (even downstream) than having to introduce TF in my buil=
d and
> > > > deployment just to be able to reboot.
> > >=20
> > > I get your point, but would rather put more pressure on people using
> > > TF-A. After all you run without CPU hotplug, A72 errata workarounds a=
nd
> > > without Spectre/Meltdown fixes. What was the IP address of your board
> > > again? ;-)
> >=20
> > Please send a pull request to remove __bcm2835_restart from the Linux
> > kernel, once it is removed from there I'd be happy to take it away from
> > Xen too ;-)
>=20
> Xen is not a slave of Linux. We make our own informed decision ;).
>=20
> >=20
> > I know I am being cheeky but we have enough battles to fight and enough
> > problems with Xen -- I don't think we should use the hypervisor as a
> > leverage to get people to use or upgrade TF. We just need to get good
> > functionalities to our users with the less amount of friction possible.
>=20
> Well it is nice to have functionality but you also need to have Xen runni=
ng
> reliably and safely. No-one wants to drive in car with no brake on a wind=
y
> road. Or maybe I am wrong? ;)
>=20
> >=20
> > Everything you mentioned are good reason to use TF, and this patch does
> > not take anything away from it. My suggestion would be to work with
> > raspberrypi.org to have TF installed by default by the =09.
>=20
> We actually did use the hypervisor as a leverage in the past. A pretty go=
od
> example is RPI 3.
>=20
> Anyway, the patch is pretty simple and limited to the platform. So I woul=
d be
> inclined to accept it.

OK, thank you, that it also what I think.


> Although this is just sweeping stability concern under the carpet and hop=
ing
> for the best. What are the odds this is going to be used in production li=
ke
> that?

We are writing a wikipage to explain how to boot Xen on RPi4, because of
the unique firmware/bootloader and the non-upstream patches. We can add
a recommandation to use TF for production to the wikipage.
--8323329-1812385704-1591291830=:6774--

