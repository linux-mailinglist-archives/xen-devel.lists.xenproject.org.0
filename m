Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB829FB06
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 03:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15365.38342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYJlP-00064f-11; Fri, 30 Oct 2020 02:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15365.38342; Fri, 30 Oct 2020 02:03:34 +0000
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
	id 1kYJlO-00064J-TJ; Fri, 30 Oct 2020 02:03:34 +0000
Received: by outflank-mailman (input) for mailman id 15365;
 Fri, 30 Oct 2020 02:03:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAhc=EF=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1kYJlM-00064E-L0
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 02:03:32 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.100.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9897ae22-8e30-4c8c-b37d-bed0f9262847;
 Fri, 30 Oct 2020 02:03:31 +0000 (UTC)
Received: from DM5PR15CA0067.namprd15.prod.outlook.com (2603:10b6:3:ae::29) by
 MN2PR02MB6621.namprd02.prod.outlook.com (2603:10b6:208:1db::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.27; Fri, 30 Oct 2020 02:03:30 +0000
Received: from CY1NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::d2) by DM5PR15CA0067.outlook.office365.com
 (2603:10b6:3:ae::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 02:03:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT026.mail.protection.outlook.com (10.152.75.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 02:03:29 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 29 Oct 2020 19:03:29 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 29 Oct 2020 19:03:29 -0700
Received: from [10.23.121.44] (port=52670 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1kYJlJ-0000Fa-9k; Thu, 29 Oct 2020 19:03:29 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KAhc=EF=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
	id 1kYJlM-00064E-L0
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 02:03:32 +0000
X-Inumbo-ID: 9897ae22-8e30-4c8c-b37d-bed0f9262847
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (unknown [40.107.100.50])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9897ae22-8e30-4c8c-b37d-bed0f9262847;
	Fri, 30 Oct 2020 02:03:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy1vxGeLtwFWqXLgPxuPexD2Ewy/oGlDFA39pNgaecaKe/Rqf+byUZeoZGPjvej0R6tLkiRlkwKNjeqQ7tqMzUAw3rJjKWQ2HNgY/81PAvKnYtJtXLXY0iRwWdeXWGmJUwNbfZUhy7vsLoUy2ZTLOsUI9KU1jdnQFR2u6srvpX1xuKN3pUP2AiUQsIlX7suqSQASmlLvhAtMT6AUHmmYs/VCW1JASapIFaXx+Wv78KVXxgEohRJz2ds05r6OZ7THjXED6aNZenS/zOLhitLMKeCMq0+tWlWw8rfUA8359h8xpucTUBgt5P1yofkxa6ORGTBjtAv1/7kNl07BHU65cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEwLjDXhqthcRC8OE0t4vbwooUOBz3m3pMD02xKVBHE=;
 b=lGfELAjqab4ZiAVO/4x/mQ2MwU0p+moPn42nTMwlg/hgwgCuvkEfcrI1onGtPUiSB3TJB1SfwdSNdIEv6A2ZltyJ9qOt2yLp5mMbg9hapzqZdWI2PDsZy/p0N+9OWeKKoP2fnwArrKXIskSCVQzBTbE0FrTxP6nRvQu+DHBoNRawlxD3c+3LGrb5cCOSCl2nCxzdD6cblueOHaZG+56/0x2HiBQRmCMuQbohfW7wac/exzt2L4RWgjBSOUW3K4/PTDZAD3lpGRm15i/PcutQaja5gO4ZCTVC/1WYmSHBJ6n3b1X5kd4EIWXPHUgky2JyaHt4d1SfwCfiXZ8/RrFHEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEwLjDXhqthcRC8OE0t4vbwooUOBz3m3pMD02xKVBHE=;
 b=QtHoVDeNxWKlGvWo8tOlH29fF92TpkIQZefbXrOg6dwuReHQwZuk8iO2qLwFtH/ZruyQMstwV84wyHkLLC1krac4uOSk5247EJR2a8dYaZ/NNEJ4l2mTvc5ZrxEXFppk2Ma7DE1aDEnJgrMSmPrZwt3A2l0qT09Bii87xwvW3b4=
Received: from DM5PR15CA0067.namprd15.prod.outlook.com (2603:10b6:3:ae::29) by
 MN2PR02MB6621.namprd02.prod.outlook.com (2603:10b6:208:1db::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.27; Fri, 30 Oct 2020 02:03:30 +0000
Received: from CY1NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::d2) by DM5PR15CA0067.outlook.office365.com
 (2603:10b6:3:ae::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 02:03:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT026.mail.protection.outlook.com (10.152.75.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 02:03:29 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 29 Oct 2020 19:03:29 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 29 Oct 2020 19:03:29 -0700
Received: from [10.23.121.44] (port=52670 helo=localhost)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <stefano.stabellini@xilinx.com>)
	id 1kYJlJ-0000Fa-9k; Thu, 29 Oct 2020 19:03:29 -0700
Date: Thu, 29 Oct 2020 19:03:28 -0700
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Takahiro Akashi <takahiro.akashi@linaro.org>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>, Alex Benn??e
	<alex.bennee@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
	<ian.jackson@eu.citrix.com>, <wl@xen.org>, <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: BUG: libxl vuart build order
In-Reply-To: <20201029114705.GA291577@laputa>
Message-ID: <alpine.DEB.2.21.2010291704180.12247@sstabellini-ThinkPad-T480s>
References: <CAB5YjtCwbvYMVg-9YXjSFtC8KvjkJuYhJFSCHrJaRUKfg4NHYA@mail.gmail.com> <alpine.DEB.2.21.2010261634000.12247@sstabellini-ThinkPad-T480s> <20201027000214.GA14449@laputa> <20201028014105.GA11856@laputa> <alpine.DEB.2.21.2010281437010.12247@sstabellini-ThinkPad-T480s>
 <20201029114705.GA291577@laputa>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-1085550638-1604016260=:12247"
Content-ID: <alpine.DEB.2.21.2010291704210.12247@sstabellini-ThinkPad-T480s>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57497799-52af-4a52-71da-08d87c77ff60
X-MS-TrafficTypeDiagnostic: MN2PR02MB6621:
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB6621BCE34063850120841BBAA0150@MN2PR02MB6621.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vkxJvW8v2I4fckR2tgVVqkNrd99NkDVBaaDB+ZsWYBY1R5b+4Z2ScBm/h/0STschP+EIcY4Gzreq1sisjAmU6Do4tBLEQAVjxHKycpmMWrrCcunL3bk4kLEXuxKak/s6GI9KVHGnUc4iH7fVIBCOzouwPunfz3aKGYBWUdgl4c84mH5WXuK7yfmqo8CSguUcy099jJOg7EJ7PL5PpI3qtSAw6zzWFGDM2R3ep5GdGwJylA8stcEOWXno6mTFV972TxAK8fQNrfcUN7zzDBVLkE4QWP9yiKIbLY1laPA01Us41zp8Xn1ixSqBYJ79cZH6bJE9djWE6+GcLc3keEb55S51LTauQAfeyWmJFxGiXsCWKwOJTUwUTvsNM2iMA2hr0FleeNNbA8AYtYJrddiI8Q==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(136003)(346002)(39860400002)(46966005)(426003)(7636003)(33964004)(44832011)(26005)(82740400003)(186003)(47076004)(478600001)(70206006)(70586007)(336012)(83380400001)(5660300002)(54906003)(36906005)(82310400003)(316002)(8676002)(8936002)(2906002)(4326008)(356005)(6916009)(9786002)(9686003)(33716001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 02:03:29.9749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57497799-52af-4a52-71da-08d87c77ff60
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY1NAM02FT026.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6621

--8323329-1085550638-1604016260=:12247
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2010291704211.12247@sstabellini-ThinkPad-T480s>

+ xen-devel and libxl maintainers

In short, there is a regression in libxl with the ARM vuart introduced
by moving ARM guests to the PVH build.


On Thu, 29 Oct 2020, Takahiro Akashi wrote:
> On Wed, Oct 28, 2020 at 02:44:16PM -0700, Stefano Stabellini wrote:
> > On Wed, 28 Oct 2020, Takahiro Akashi wrote:
> > > On Tue, Oct 27, 2020 at 09:02:14AM +0900, Takahiro Akashi wrote:
> > > > On Mon, Oct 26, 2020 at 04:37:30PM -0700, Stefano Stabellini wrote:
> > > > > 
> > > > > On Mon, 26 Oct 2020, Takahiro Akashi wrote:
> > > > > > Stefano,
> > > > > > 
> > > > > > # I'm afraid that I have already bothered you with a lot of questions.
> > > > > > 
> > > > > > When I looked at Xen's vpl011 implementation, I found
> > > > > > CR (and LCHR) register is not supported. (trap may cause a data abort).
> > > > > > On the other hand, for example, linux's pl011 driver surely
> > > > > > accesses CR (and LCHR) register.
> > > > > > So I guess that linux won't be able to use pl011 on a Xen guest vm
> > > > > > if vuart = "sbsa_uart".
> > > > > > 
> > > > > > Is this a known issue or do I miss anything?
> > > > > 
> > > > > Linux should definitely be able to use it, and in fact, I am using it
> > > > > with Linux in my test environment.
> > > > > 
> > > > > I think the confusion comes from the name "vpl011": it is in fact not a
> > > > > full PL011 UART, but an SBSA UART.
> > > > 
> > > > Yeah, I have noticed it.
> > > > 
> > > > > SBSA UART only implements a subset of
> > > > > the PL011 registers. The compatible string is "arm,sbsa-uart", also see
> > > > > drivers/tty/serial/amba-pl011.c:sbsa_uart_probe.
> > > > 
> > > > Looking closely into the details of implementation, I found
> > > > that all the accesses to unimplemented registers, including
> > > > CR, are deliberately avoided in sbsa part of linux driver.
> > > 
> > > So I'm now trying to implement "sbsa-uart" driver on U-Boot
> > > by modifying the existing pl011 driver.
> > > (Please note the current xen'ized U-Boot utilises a para-virtualized
> > > console, i.e. with HVM_PARAM_CONSOLE_PFN.)
> > > 
> > > So far my all attempts have failed.
> > > 
> > > There are a couple of problems, and one of them is how we can
> > > access vpl011 port (from dom0).
> > > What I did is:
> > > - modify U-Boot's pl011 driver
> > >   (I'm sure that the driver correctly handle a vpl011 device
> > >   with regard of accessing a proper set of registers.)
> > > - start U-Boot guest with "vuart=sbsa_uart" by
> > >     xl create uboot.cfg -c
> > > 
> > > Then I have seen almost nothing on the screen.
> > > Digging into vpl011 implementation, I found that all the characters
> > > written DR register will be directed to a "backend domain" if a guest
> > > vm is launched by xl command.
> > > (In case of dom0less, the backend seems to be Xen itself.)
> > > 
> > > As a silly experiment, I modified domain_vpl011_init() to always create
> > > a vpl011 device with "backend_in_domain == false".
> > > Then, I could see more boot messages from U-Boot, but still fails
> > > to use the device as a console, I mean, we will lose all the outputs
> > > after at some point and won't be able to type any keys (at a command prompt).
> > > (This will be another problem on U-Boot side.)
> > > 
> > > My first question here is how we can configure and connect a console
> > > in this case?
> > > Should "xl create -c" or "xl console -t vuart" simply work?
> > 
> > "xl create -c" creates a guest and connect to the primary console which
> > is the PV console (i.e. HVM_PARAM_CONSOLE_PFN.)
> 
> So in case of vuart, it (console) doesn't work?
> (Apparently, "xl create" doesn't take '-t' option.)
> 
> > To connect to the emulated sbsa uart you need to pass -t vuart. So yes,
> > "xl console -t vuart domain_name" should get you access to the emulated
> > sbsa uart. The sbsa uart can also be exposed to dom0less guests; you get
> > their output by using CTRL-AAA to switch to right domU console.
> > 
> > You can add printks to xen/arch/arm/vpl011.c in Xen to see what's
> > happening on the Xen side. vpl011.c is the emulator.
> 
> I'm sure that write to "REG_DR" register is caught by Xen.
> What I don't understand is
> if back_in_domain -> no outputs
> if !back_in_domain -> can see outputs
> 
> (As you know, if a guest is created by xl command, back_in_domain
> is forcedly set to true.)
> 
> I looked into xenstore and found that "vuart/0/tty" does not exist,
> but "console/tty" does.
> How can this happen for vuart?
> (I clearly specified, vuart = "sbsa_uart" in Xen config.)

It looks like we have a bug :-(

I managed to reproduce the issue. The problem is a race in libxl.

tools/libxc/xc_dom_arm.c:alloc_magic_pages is called first, setting
dom->vuart_gfn.  Then, libxl__build_hvm should be setting
state->vuart_gfn to dom->vuart_gfn (like libxl__build_pv does) but it
doesn't.


---

libxl: set vuart_gfn in libxl__build_hvm

Setting vuart_gfn was missed when switching ARM guests to the PVH build.
Like libxl__build_pv, libxl__build_hvm should set state->vuart_gfn to
dom->vuart_gfn.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
index f8661e90d4..36fe8915e7 100644
--- a/tools/libxl/libxl_dom.c
+++ b/tools/libxl/libxl_dom.c
@@ -1184,6 +1184,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
         LOG(ERROR, "hvm build set params failed");
         goto out;
     }
+    state->vuart_gfn = dom->vuart_gfn;
 
     rc = hvm_build_set_xs_values(gc, domid, dom, info);
     if (rc != 0) {
--8323329-1085550638-1604016260=:12247--

