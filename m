Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6032F9BBB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 10:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69462.124319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QVZ-0002uQ-R8; Mon, 18 Jan 2021 09:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69462.124319; Mon, 18 Jan 2021 09:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QVZ-0002u1-Nc; Mon, 18 Jan 2021 09:07:33 +0000
Received: by outflank-mailman (input) for mailman id 69462;
 Mon, 18 Jan 2021 09:07:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1QVY-0002tw-FL
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 09:07:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c40ba2d0-d06a-4030-82ae-fa66016c229c;
 Mon, 18 Jan 2021 09:07:31 +0000 (UTC)
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
X-Inumbo-ID: c40ba2d0-d06a-4030-82ae-fa66016c229c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610960851;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jHt8U7qf5SMQ4BklnX1gK3zkZP74s1eTYfczpi7/cOE=;
  b=Xr5FYLIyVjVDycb6lI8ffw4k2V8XVp/WeugqPwmmLEkxPt2V878poIUC
   +K289N89gnK9dZ70wyLmWeg6/ig7BCiu5xU0mcpVU5Gw1AiS/pj3nfhF7
   HNRGROHPN0Ipma+I2Tj1LzZ9mWkz+DzlUQEznDg20LYIPjX44YV9ccD6p
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sX27heeV+rQIuwATNrfgnByHsl2q5VXVCXMouYN5UabeO/i+aGMHqtqlvfGsRXqbzthQQORFPc
 ldotuo88pKjSOP9e0/AijEHzo3PoEJi5RWPgeCbZDy2+7JemZYILCnguALhGkPl1qCePbfjK+E
 7N2neVQ9K2WoywXkxpvtWDEZxcIu+0rE7upmHlzcqmPO8dDJF9KqHg7B9OU0Ivq3wIfhvi3Xa9
 YseufnGNdEOpd/sfDnXE8bi9hmOs2bADUcGnuRj6z31NYZqV+9/r3K2UM+LitIM+zGCahBzwI0
 fMw=
X-SBRS: 5.2
X-MesageID: 35274945
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,355,1602561600"; 
   d="scan'208";a="35274945"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGCboW7OyCMhf8bVWgbigoOtCvm/gPiQUDMibXCc3Zww+UmLDCS9uOksSEFBVUb+ULvvhAM4VVNcVtbL0SVzPPfaWh5VCrPSOkRdTtZZkN7iIsM3ASVliW1NNWXeV7Cxz2CaHj8F2O/sy/5TjWlOy8C2Ezeh16tp+SaDlsnuLpDVnzUHdt14Y2RXOboRd40Nc4B0ps6DxCWXlQIbX5JoOjp1NWZsFpgBQdmsjFX3w14SSWntRbaXpiF1Zf26HVg2Whto/kvMtvaSf4iWHFuCgzB9U3vC7fqn9OZ7WUoKesrlPicGMTSUXDGro5fSgeKxgwuvs1VSIpZl95uPyRQaWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WmOAjiuRo6BbvLSI1vLEeRt3o6TXNvDVW6l6Ymi6Qw=;
 b=YzMSj+iVmJMw6RGJE0G4SYSV9U/G1rf1kHaZL1lZ6OQe2SRVIJj1jCL9O1NaOJsZRxFNiINsYVrPAgh7eaPMaJRiIfiJHNUFG8o6+E27U/ok8Rk1waOm+aJ+VJNmWeVg9C7IAVaqwLPkDzRNho8vOQhmpgqnfhUpNpGN/kt+zchEGZDl+6mWAdO/MDJEj9MQCFEDJtaIuxE6MqREkaqlJeg/4ahj5wF/YU9Axwmeu0ZDHtBR+XDuCT/fzXCwMk23N9nsghQcw/dMHIjVUk95zpK4HAkw6eikuHwtaPApk+s53k6lMMEy7LMVS5ce2Ny+ktXRKWhKs9PgFVNmJRROXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WmOAjiuRo6BbvLSI1vLEeRt3o6TXNvDVW6l6Ymi6Qw=;
 b=N3rVIBEu6+bIQXDckbcqykkPdYvmdiDx6rxDtwip/tRxuGTfjPmQmLd6CXz6Kfr6oWDcujP2BG/Y9Og1nWexVjJTStNiWaCpph2+mPPVnXKNroXfOoVqDhrUHbOSh5lI0/8aB/4m4i8acRjli7uekjZOgywl0uDdrQqjxjwnxBY=
Date: Mon, 18 Jan 2021 10:07:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: pass some infos to qemu
Message-ID: <20210118090722.jlf5j324mfeylp6t@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-17-bouyer@antioche.eu.org>
 <20210116101606.sogfpgzg7upunua7@Air-de-Roger>
 <20210116112502.GA1133@antioche.eu.org>
 <20210118083642.deozyeo5o6yziba7@Air-de-Roger>
 <20210118085214.GB859@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210118085214.GB859@antioche.eu.org>
X-ClientProxiedBy: PR2P264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8293002-817c-404d-d63f-08d8bb90799c
X-MS-TrafficTypeDiagnostic: DM5PR03MB2553:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB25534877B71E14F4970CA1E08FA40@DM5PR03MB2553.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: //qropyopBcRoRrPZ6Q+bFflz/VG6Qb3AANUBri2CLFyki1zK8N5+NEnSHX84frowDKgnEnjRg0xPUvhR5yv/DnEELB8NidtiWKZCIN/hgTVETKtU2SGLhNWtTcyCytsXt4zFtNeKmVvBZYmDiUxsArOLnzFml8TH4ix/GeVVK/V/ON1SWxAwqoDDnc0MAhalSS+3qVkB5MU1je8ZFf2fDCSjZ0hFovdVN86Se8sOilO3ttIb8F2OScoinzKBn9Hi0IBHC9ZwC7rTFM0LoBWpnxRxYo82Yds8GAKdM54jV/Inl0n5o1IYSgr67XnLqoNBqteFMCDPxCKqmay2OstaTBCi+eTli9yLyPyyu0me/DkTNnm6amdW1lmEd0wtQdZuhoSv2aq/P6Z8Vy+IvVhuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39850400004)(396003)(366004)(376002)(346002)(136003)(8936002)(33716001)(16526019)(6496006)(316002)(186003)(66946007)(9686003)(26005)(2906002)(478600001)(107886003)(86362001)(4326008)(8676002)(6666004)(85182001)(6486002)(5660300002)(1076003)(83380400001)(66476007)(54906003)(956004)(66556008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NlhvN2pCMlQ3ZHJ6eEVsQUpXMnYzL3J6SDNQcnFDMHpLTlcyOUNBeXlHcU85?=
 =?utf-8?B?YUtkQ3E5WkpvVi80UlBTMXJiZjQ4b1FPbEFQc2RtMExNMko0Q3ZHZU9WSzlX?=
 =?utf-8?B?cFpFeTVuRDNKU0NUdUpHQUxyeDlXNHI0ZTc0NGttK1JFdVhEYmxwU1hxcTky?=
 =?utf-8?B?cDRmdDlUbnNCaFFHaHN5TkdqcGtzcU93QWV5MWR6YXJsczlVakJTdkhCUy95?=
 =?utf-8?B?d3R0QjJjWThQa1RBcWlQT0V4OGRKQlJyYVVjZVZ1ZHpLdnRGWlBvK1VXeDU0?=
 =?utf-8?B?cHFFRFJJUXR1cUVEQ3ExVm90bERPand4NFhqRlpDeDNOYUZlckVTQkJtUzdq?=
 =?utf-8?B?V1pKdk5LSjM0dVV5TUNFYi9VaEFrNTMwdUFJWVVvd2VWR3hsaG1ZbGJXeG94?=
 =?utf-8?B?N3g2YVpvNmIycmVRVDVNejhVQzZTTXl1Ull4QlBEWnduRG4wSC9obHJLR3Zj?=
 =?utf-8?B?VmRvKzVrYkxsRFRIYVAzTFI2Wm9zZklUQmZZeUpXWVNNd2FueTJzRExoOGts?=
 =?utf-8?B?eTdzOW1nZHozK3NOQ0hUMlZjazJIVzZ3Qzl4UjA5cU5iTkIrKytSSjRUSnlp?=
 =?utf-8?B?MHQxZk00bndNNzk3d20xcUpuOVBnVkwxaFBtakdRbVZsMG00bHE0T21zUGN5?=
 =?utf-8?B?RTlOUWhJNmF2TjlrUTVTbTlTOUxWaHVUZzdINGdoekNZRkUzODZOVEorM1p4?=
 =?utf-8?B?SkFydDAyQUpSbmNQdkhPdVlGcUFwcjZubmRtOGR3ekxGNW5SZkxtVzl2UnhF?=
 =?utf-8?B?eHNNSFVadUF2S0Jjd05kR0NLUDBEa2FZTlVGQXRabXZmcFUzL1hzZFBNdGND?=
 =?utf-8?B?QUlZVlJDUTRWUU1Pa2ZYbStuOGpqc0pRZzZJTnNmVStIRDRlVmh4U0pXdi9h?=
 =?utf-8?B?M1lXcTlJbTVtdGMranJWcjZiOXhZTXpjT2ZFaGQ5dExBb2JMK1A4TWRiQkt4?=
 =?utf-8?B?ZDYyM2VYM3U3RVR6bEE4WC9aaXE1ZWJ3ZWU2NjdpeVIxbkxiNnU2Vys1akxY?=
 =?utf-8?B?ZWpvelJaRmtqS09XZGQvZXpXLzRleWhWK04rdkZPVTV1TDNhcWlOQjc2dzNI?=
 =?utf-8?B?L0wvWDhCcTZwdWM2NC9hSlFkTU1aN1hlNTgrYnBBaGdEeEVpdjJyTnQ2NGR2?=
 =?utf-8?B?Q3QrbVZjazZRUThWOWYrdC9rSGc0WUFuOTZsUXMrZTFINHFrMGpGczl6bUt0?=
 =?utf-8?B?QWNKSmZpL0hqaXhtRVJ6VlRWZ1VsUmNpTlRmbGsxV2pDaGYvTUR0M0tld0ls?=
 =?utf-8?B?Q3JaelZ2L056ekI5OGJZNGQ3L0xxLzNaZ1JGdVM0NGZQbWJkR09Ybk5aSmR3?=
 =?utf-8?Q?9kb098HiaKxOE3MA6S+hzBbYRwwea1cXgw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8293002-817c-404d-d63f-08d8bb90799c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 09:07:26.5022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4U6beycQn93XoJceRphLd53AS6vy+IYaPm93N81oVIvqhUcvGsDMtIv+RSBGsZzw2b3rGr6Kgd5PXIysUmPQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2553
X-OriginatorOrg: citrix.com

On Mon, Jan 18, 2021 at 09:52:14AM +0100, Manuel Bouyer wrote:
> On Mon, Jan 18, 2021 at 09:36:42AM +0100, Roger Pau Monné wrote:
> > I also wonder why NetBSD needs to add the tap interface to the bridge
> > in the QEMU script instead of doing it from the hotplug script called
> > by libxl, like Linux and FreeBSD do.
> 
> the tap interface is created by qemu itself, its name is not known outside
> of qemu. Also, is there guarantee that qemu has created the tap before
> the hotplug script is called ?

Yes, the toolstack will wait for QEMU to be initialized at which point
the tap interface has been created.

I think I remember now why this didn't work on NetBSD. We ask QEMU to
create the tap interface with a specific name (using the vifname=
parameter), but NetBSD doesn't have the ioctl to rename network
interfaces implemented, and thus cannot rename the interface from tapX
to vifX.Y-emu, and hence you need to use the QEMU script from QEMU
itself because it's the only entity that knows the name of the tap
interface created.

If you agree, can you add something along the lines to the commit
message? So that we remember why NetBSD needs to use the QEMU scripts.

Thanks, Roger.

