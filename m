Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5642A0CBF
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 18:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16092.39377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYYU8-0003V0-C7; Fri, 30 Oct 2020 17:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16092.39377; Fri, 30 Oct 2020 17:46:44 +0000
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
	id 1kYYU8-0003Uc-7X; Fri, 30 Oct 2020 17:46:44 +0000
Received: by outflank-mailman (input) for mailman id 16092;
 Fri, 30 Oct 2020 17:46:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAhc=EF=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1kYYU6-0003UX-T7
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 17:46:43 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.94.59]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddd00798-58a8-4010-ae04-2bda79ae93fa;
 Fri, 30 Oct 2020 17:46:41 +0000 (UTC)
Received: from SN4PR0801CA0001.namprd08.prod.outlook.com
 (2603:10b6:803:29::11) by CY4PR02MB2181.namprd02.prod.outlook.com
 (2603:10b6:903:e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 30 Oct
 2020 17:46:39 +0000
Received: from SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:29:cafe::e2) by SN4PR0801CA0001.outlook.office365.com
 (2603:10b6:803:29::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 17:46:39 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT005.mail.protection.outlook.com (10.152.72.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 17:46:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 30 Oct 2020 10:46:38 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Fri, 30 Oct 2020 10:46:38 -0700
Received: from [10.23.121.44] (port=49713 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1kYYU2-0003DE-8m; Fri, 30 Oct 2020 10:46:38 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KAhc=EF=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
	id 1kYYU6-0003UX-T7
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 17:46:43 +0000
X-Inumbo-ID: ddd00798-58a8-4010-ae04-2bda79ae93fa
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (unknown [40.107.94.59])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ddd00798-58a8-4010-ae04-2bda79ae93fa;
	Fri, 30 Oct 2020 17:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRKbVBZJHnzzV+1EKop2FCGsodcGW8aJtBc/W8yJq11ay25EVzxRpt0RBskUzxmWWjqXNGLJNUNVwIfrbbXrQSu9zO9CD64ADWOygKaYAEi2hbCQbYtf2p1FAIjKxpw2sDK9VNh8nW1kspfIwbf1DmaqaT7FDjjH/21itXBQONGMkG/qFyW5H8cdCtKxVhwSc4G9ZLz40maUPBOODgpI+SjxbLVgCyrQsDvLkXSh3jmL6TyI57w1CVmur2YLzN4daSKRxO5IA6GRWj0vgdyNsAWMB4tet1kDYIz4J8KPXFDg7CbrUHakUrx94osR2h1sSma/jTE2oI7hRp7val6H3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Y5rIkKO3U+ca+MQTaMeN8Vh2Q1LZv3NMpqdJBybCrk=;
 b=YEWTAbGrs+1DzZEPrBuBV1wnFVfVgOY3/6f8Gp80y115sZWTAYagl3A6h+f9Wjqt+iKlAoNaAHW4tfuPF/qslP2/1AZcrLYVNTwKcYi2nPLZOgb0F0xK4fyHjkMXJkDPfb6GxrN9YmAOyFof4pg/dtnEn4blIewhHs8unLVPxjfWGzrCWZjba6Ef0FaATy/9cUFN71SQNqKiGgBcXLSEk6opJVyyxxTBFBd2T6JGLH2Fp4AWf4iGzDvBVBvzmw1+UiYSZLwhQC2UHIfUC2PdDKmGpAjKgNpXm39mbKxOqruNpr1PFEio1Ualp92q/DkR89alvDiqIe87IiBxo0cMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Y5rIkKO3U+ca+MQTaMeN8Vh2Q1LZv3NMpqdJBybCrk=;
 b=FSHUQjCMASOELaGJLgzGGLQHpVqucSGvIqR8rJLdwZptucZXHE0DcTyuzxamPNCAPVOIJlY6cQaMpTvvNniLNM9lRgWWLT21rmz3j/7tqP/CcBNresEbPzdMO0s3p839J4VJozJFVA+tIcRvU2rQxwZTjxpotheQ/YHpu/OMaSo=
Received: from SN4PR0801CA0001.namprd08.prod.outlook.com
 (2603:10b6:803:29::11) by CY4PR02MB2181.namprd02.prod.outlook.com
 (2603:10b6:903:e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 30 Oct
 2020 17:46:39 +0000
Received: from SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:29:cafe::e2) by SN4PR0801CA0001.outlook.office365.com
 (2603:10b6:803:29::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 17:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT005.mail.protection.outlook.com (10.152.72.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 17:46:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 30 Oct 2020 10:46:38 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Fri, 30 Oct 2020 10:46:38 -0700
Received: from [10.23.121.44] (port=49713 helo=localhost)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <stefano.stabellini@xilinx.com>)
	id 1kYYU2-0003DE-8m; Fri, 30 Oct 2020 10:46:38 -0700
Date: Fri, 30 Oct 2020 10:46:37 -0700
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Takahiro Akashi <takahiro.akashi@linaro.org>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>, Alex Benn??e
	<alex.bennee@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
	<ian.jackson@eu.citrix.com>, <wl@xen.org>, <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: BUG: libxl vuart build order
In-Reply-To: <20201030025157.GA18567@laputa>
Message-ID: <alpine.DEB.2.21.2010301045250.12247@sstabellini-ThinkPad-T480s>
References: <CAB5YjtCwbvYMVg-9YXjSFtC8KvjkJuYhJFSCHrJaRUKfg4NHYA@mail.gmail.com> <alpine.DEB.2.21.2010261634000.12247@sstabellini-ThinkPad-T480s> <20201027000214.GA14449@laputa> <20201028014105.GA11856@laputa> <alpine.DEB.2.21.2010281437010.12247@sstabellini-ThinkPad-T480s>
 <20201029114705.GA291577@laputa> <alpine.DEB.2.21.2010291704180.12247@sstabellini-ThinkPad-T480s> <20201030025157.GA18567@laputa>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-903762955-1604079993=:12247"
Content-ID: <alpine.DEB.2.21.2010301046340.12247@sstabellini-ThinkPad-T480s>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbea643a-e3e1-4fc6-8f35-08d87cfbc10b
X-MS-TrafficTypeDiagnostic: CY4PR02MB2181:
X-Microsoft-Antispam-PRVS:
	<CY4PR02MB2181702DDA8E8EF9ECEC27D5A0150@CY4PR02MB2181.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MsY5NurbGIguzYwh4+77ieSNB/xM29WEGLG/oIWQUWb7DzsnWdIL6IbTJPSvcpg/8T1oPiiuaEgEl5bF+sKYkq22BzAnVr6jC8WUDfsUKHbd+P8UDePX+D2L7hxM87Y9nxQoMv58CVhPFIJIOaYFm0t439L7oIZNO6YsvITRa+jAz3OWGzeqVYP35e4d6Ff4eGWuBDWyA2Hbx9x5zqWyvDRW6JIboVKRBGNozf7cGRTyXodNKgJAuSP+UA6uYEzsimzaHqm92rjAcOdZr2mBdZ0kL+JIj0L0XLVVjwR+K8aMKgyvrOTBartTYWiwKGGrqALgOQdyOocxyjfWRDqM3U0s/vQN3TEsE514GtpR1m8oguYbjYf69A/fMT3pAeteO7vT0Ep0xY6wE3Zs4uoNCw==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(47076004)(7636003)(70206006)(426003)(5660300002)(33964004)(9686003)(2906002)(44832011)(33716001)(26005)(4326008)(54906003)(478600001)(356005)(186003)(9786002)(36906005)(70586007)(336012)(8676002)(6916009)(82740400003)(8936002)(316002)(82310400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 17:46:38.9521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbea643a-e3e1-4fc6-8f35-08d87cfbc10b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2181

--8323329-903762955-1604079993=:12247
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2010301046341.12247@sstabellini-ThinkPad-T480s>

On Fri, 30 Oct 2020, Takahiro Akashi wrote:
> Hi Stefano,
> 
> On Thu, Oct 29, 2020 at 07:03:28PM -0700, Stefano Stabellini wrote:
> > + xen-devel and libxl maintainers
> > 
> > In short, there is a regression in libxl with the ARM vuart introduced
> > by moving ARM guests to the PVH build.
> > 
> > 
> > On Thu, 29 Oct 2020, Takahiro Akashi wrote:
> > > On Wed, Oct 28, 2020 at 02:44:16PM -0700, Stefano Stabellini wrote:
> > > > On Wed, 28 Oct 2020, Takahiro Akashi wrote:
> > > > > On Tue, Oct 27, 2020 at 09:02:14AM +0900, Takahiro Akashi wrote:
> > > > > > On Mon, Oct 26, 2020 at 04:37:30PM -0700, Stefano Stabellini wrote:
> > > > > > > 
> > > > > > > On Mon, 26 Oct 2020, Takahiro Akashi wrote:
> > > > > > > > Stefano,
> > > > > > > > 
> > > > > > > > # I'm afraid that I have already bothered you with a lot of questions.
> > > > > > > > 
> > > > > > > > When I looked at Xen's vpl011 implementation, I found
> > > > > > > > CR (and LCHR) register is not supported. (trap may cause a data abort).
> > > > > > > > On the other hand, for example, linux's pl011 driver surely
> > > > > > > > accesses CR (and LCHR) register.
> > > > > > > > So I guess that linux won't be able to use pl011 on a Xen guest vm
> > > > > > > > if vuart = "sbsa_uart".
> > > > > > > > 
> > > > > > > > Is this a known issue or do I miss anything?
> > > > > > > 
> > > > > > > Linux should definitely be able to use it, and in fact, I am using it
> > > > > > > with Linux in my test environment.
> > > > > > > 
> > > > > > > I think the confusion comes from the name "vpl011": it is in fact not a
> > > > > > > full PL011 UART, but an SBSA UART.
> > > > > > 
> > > > > > Yeah, I have noticed it.
> > > > > > 
> > > > > > > SBSA UART only implements a subset of
> > > > > > > the PL011 registers. The compatible string is "arm,sbsa-uart", also see
> > > > > > > drivers/tty/serial/amba-pl011.c:sbsa_uart_probe.
> > > > > > 
> > > > > > Looking closely into the details of implementation, I found
> > > > > > that all the accesses to unimplemented registers, including
> > > > > > CR, are deliberately avoided in sbsa part of linux driver.
> > > > > 
> > > > > So I'm now trying to implement "sbsa-uart" driver on U-Boot
> > > > > by modifying the existing pl011 driver.
> > > > > (Please note the current xen'ized U-Boot utilises a para-virtualized
> > > > > console, i.e. with HVM_PARAM_CONSOLE_PFN.)
> > > > > 
> > > > > So far my all attempts have failed.
> > > > > 
> > > > > There are a couple of problems, and one of them is how we can
> > > > > access vpl011 port (from dom0).
> > > > > What I did is:
> > > > > - modify U-Boot's pl011 driver
> > > > >   (I'm sure that the driver correctly handle a vpl011 device
> > > > >   with regard of accessing a proper set of registers.)
> > > > > - start U-Boot guest with "vuart=sbsa_uart" by
> > > > >     xl create uboot.cfg -c
> > > > > 
> > > > > Then I have seen almost nothing on the screen.
> > > > > Digging into vpl011 implementation, I found that all the characters
> > > > > written DR register will be directed to a "backend domain" if a guest
> > > > > vm is launched by xl command.
> > > > > (In case of dom0less, the backend seems to be Xen itself.)
> > > > > 
> > > > > As a silly experiment, I modified domain_vpl011_init() to always create
> > > > > a vpl011 device with "backend_in_domain == false".
> > > > > Then, I could see more boot messages from U-Boot, but still fails
> > > > > to use the device as a console, I mean, we will lose all the outputs
> > > > > after at some point and won't be able to type any keys (at a command prompt).
> > > > > (This will be another problem on U-Boot side.)
> > > > > 
> > > > > My first question here is how we can configure and connect a console
> > > > > in this case?
> > > > > Should "xl create -c" or "xl console -t vuart" simply work?
> > > > 
> > > > "xl create -c" creates a guest and connect to the primary console which
> > > > is the PV console (i.e. HVM_PARAM_CONSOLE_PFN.)
> > > 
> > > So in case of vuart, it (console) doesn't work?
> > > (Apparently, "xl create" doesn't take '-t' option.)
> > > 
> > > > To connect to the emulated sbsa uart you need to pass -t vuart. So yes,
> > > > "xl console -t vuart domain_name" should get you access to the emulated
> > > > sbsa uart. The sbsa uart can also be exposed to dom0less guests; you get
> > > > their output by using CTRL-AAA to switch to right domU console.
> > > > 
> > > > You can add printks to xen/arch/arm/vpl011.c in Xen to see what's
> > > > happening on the Xen side. vpl011.c is the emulator.
> > > 
> > > I'm sure that write to "REG_DR" register is caught by Xen.
> > > What I don't understand is
> > > if back_in_domain -> no outputs
> > > if !back_in_domain -> can see outputs
> > > 
> > > (As you know, if a guest is created by xl command, back_in_domain
> > > is forcedly set to true.)
> > > 
> > > I looked into xenstore and found that "vuart/0/tty" does not exist,
> > > but "console/tty" does.
> > > How can this happen for vuart?
> > > (I clearly specified, vuart = "sbsa_uart" in Xen config.)
> > 
> > It looks like we have a bug :-(
> > 
> > I managed to reproduce the issue. The problem is a race in libxl.
> > 
> > tools/libxc/xc_dom_arm.c:alloc_magic_pages is called first, setting
> > dom->vuart_gfn.  Then, libxl__build_hvm should be setting
> > state->vuart_gfn to dom->vuart_gfn (like libxl__build_pv does) but it
> > doesn't.
> 
> Thank you for the patch.
> I confirmed that sbsa-uart driver on U-Boot now works.

Excellent!


> === after "xl console -t vuart" ===
> U-Boot 2020.10-00777-g10cf956a26ba (Oct 29 2020 - 19:31:29 +0900) xenguest
> 
> Xen virtual CPU
> Model: XENVM-4.15
> DRAM:  128 MiB
> 
> In:    sbsa-pl011
> Out:   sbsa-pl011
> Err:   sbsa-pl011
> xenguest# dm tree
>  Class     Index  Probed  Driver                Name
> -----------------------------------------------------------
>  root          0  [ + ]   root_driver           root_driver
>  firmware      0  [   ]   psci                  |-- psci
>  serial        0  [ + ]   serial_pl01x          |-- sbsa-pl011
>  pvblock       0  [   ]   pvblock               `-- pvblock
> ===
> 
> If possible, I hope that "xl create -c" command would accept "-t vuart"
> option (or it should automatically selects uart type from the config).

I think a patch to add the "-t" option to "xl create" would be
acceptable, right Anthony?


> > 
> > ---
> > 
> > libxl: set vuart_gfn in libxl__build_hvm
> > 
> > Setting vuart_gfn was missed when switching ARM guests to the PVH build.
> > Like libxl__build_pv, libxl__build_hvm should set state->vuart_gfn to
> > dom->vuart_gfn.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
> > index f8661e90d4..36fe8915e7 100644
> > --- a/tools/libxl/libxl_dom.c
> > +++ b/tools/libxl/libxl_dom.c
> > @@ -1184,6 +1184,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
> >          LOG(ERROR, "hvm build set params failed");
> >          goto out;
> >      }
> > +    state->vuart_gfn = dom->vuart_gfn;
> >  
> >      rc = hvm_build_set_xs_values(gc, domid, dom, info);
> >      if (rc != 0) {
> 
--8323329-903762955-1604079993=:12247--

