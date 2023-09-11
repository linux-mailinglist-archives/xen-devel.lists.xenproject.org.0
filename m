Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295879AA01
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 17:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599609.935097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjHM-00050z-6i; Mon, 11 Sep 2023 15:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599609.935097; Mon, 11 Sep 2023 15:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfjHM-0004z3-3Q; Mon, 11 Sep 2023 15:56:48 +0000
Received: by outflank-mailman (input) for mailman id 599609;
 Mon, 11 Sep 2023 15:56:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=erTg=E3=nureva.com=anthonychan@srs-se1.protection.inumbo.net>)
 id 1qfjHK-0004yv-Cb
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 15:56:46 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070a.outbound.protection.outlook.com
 [2a01:111:f400:fe59::70a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce0ec9d9-50bb-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 17:56:45 +0200 (CEST)
Received: from DM6PR20MB2779.namprd20.prod.outlook.com (2603:10b6:5:140::30)
 by PH0PR20MB4517.namprd20.prod.outlook.com (2603:10b6:510:147::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 15:56:39 +0000
Received: from DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e]) by DM6PR20MB2779.namprd20.prod.outlook.com
 ([fe80::c3:998a:f69:190e%7]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 15:56:38 +0000
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
X-Inumbo-ID: ce0ec9d9-50bb-11ee-8785-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIPlyATCJ9JthHZuzXUW2GKPblf8OdliJssjNwjetvNF4Y0Uh9ji9ki2eUTiA12FGTqanZygM+btVtgvxgxcFZ/sld3h7zAdJ5DCxf+A/8ZvB7DDPwIr8gB8OwWhgrClWgo4VL1usdKt49CRd2TbrxOlSBYWnykOqK7n6OIr5MbovLYIFKEt+nTfFVIrQ6bQ6VJXKDBgGhJHzVlOqryDg5sY6lCxSDBnVTr4V1d0/J1C0K5ApDrFgaCxinoU8EwxOFvTgm0nXeN0yxpA2RGw/JGA3eQYEG3vBMN0CIc43H9Mbv4P3T/gCPwkoPsbMWCNZSbAh8Aoa5WqX6PU0k2xQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZYzElY3T5DAD2dcgUGFseEmujyc7gzex3NjNjoczEU=;
 b=bl7Zb/of9sxP9jqx5hlvlBJt63sPkzsb/RrbWn1iKRs/K0iFdXYzQtNb+09iWDTJdQQ2FsuLj0ck6y5LJJ1uXY/af6xDsufHUDE+NHlLk1fPjLRgwgWC1hYwm/iJV9pF5HCYKJzSy7H4o6ZQceEqs4LO60R18OI0rGQOKi1ZV7KXOCdz459QIziLE70cRODSKJkmirqfoShM7mVAlfpI0dOIQb9DfqdaWkQATCeewb2ZgvMw+aeYhd/8u0zKhTox7z488HunpBKM/4UJ1X9h9lttFs4CMLiWGkqYmJHMuWaHU++gIq5nLvt9o/oZCLUA1LAEhVANpUuAkB8UMUkp6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nureva.com; dmarc=pass action=none header.from=nureva.com;
 dkim=pass header.d=nureva.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nureva.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZYzElY3T5DAD2dcgUGFseEmujyc7gzex3NjNjoczEU=;
 b=HPp4/yLFnJvvwHOgD4w8qP65/8PDNWjAtYVj/gQHtQn+QWijkGgRcSnR9ZtIAQaJZWmj2rduFO/pQFAk2hef9a22cxOeCSiEl1YVOqJR6nZimbdLLuagnd6KzhAPJpQIAu4CN2a2LksFfkBBcv/8pjRj+kRy/gpUu2kaebeWRSE=
From: Anthony Chan <anthonychan@nureva.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Dan Waqar
	<danwaqar@nureva.com>
Subject: RE: [EXT] Re: xen arm64 low power sleep support
Thread-Topic: [EXT] Re: xen arm64 low power sleep support
Thread-Index:
 AdnanCj70Orzia5aQfSER7H0AUNnzgAKb5uAACL7QIAAFccGAAAoRLpQAQalgwAAJhokEAAI5CkAACis4mA=
Date: Mon, 11 Sep 2023 15:56:38 +0000
Message-ID:
 <DM6PR20MB2779BA8D352E566A350844FCC1F2A@DM6PR20MB2779.namprd20.prod.outlook.com>
References:
 <DM6PR20MB277971712E5415CB231AEB37C1E7A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308291512271.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB27795F4B6C327F7F031BABB0C1E6A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2308301814580.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB2779E6DD63DC5CC9A1FE161AC1E5A@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2309051848590.6458@ubuntu-linux-20-04-desktop>
 <DM6PR20MB2779A22E8CA641F0B2BBF038C1EFA@DM6PR20MB2779.namprd20.prod.outlook.com>
 <alpine.DEB.2.22.394.2309061629460.6458@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309061629460.6458@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nureva.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR20MB2779:EE_|PH0PR20MB4517:EE_
x-ms-office365-filtering-correlation-id: 023f4e8d-1007-4876-0446-08dbb2dfaf1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TMm4YbGUh7HIXkp9Rne/eJiEBrbwlKB3eiRRsTEXCtsSAO/QRUKb1qbG+8RQUsvcFCqPi6UX1zUOke2TWSpyam3TgSybFsd7VmtY1VVTAU90djKMx37igdCwyyUbSgm0tYmjHWS29jo9/TzJbwrmAT4MxKEPOku+ExaerLHHvvspSWVcfmUQaxHI/3PoC/7qCiSCeebAQjEZ70ZIxgmFQbCG6kQlT1k/kmQd4Dit3nBXpxH14KyMCgEC5CMczYpy+GUREeopMHsxxWYnjYCiwU1iRPAuz4yUHXt6fC6iueGnLPLAIP3qd4G0gA14Kp6EdXDjBkOeqi5hxQYKS7H8qfdbvAdF57r4RmDliS7kS0j5POXK9RN+embg6NRf1P0g1HpAKPn7lx1Qe34An0VbWDLDExlpNCMu6Mbb9X5QMDPYZIljN9+9i9C5z0oPkl1RSiVNlhIpaKb611bA+GymNvY5pwWpF6ISUJUzKqsx9dPC8l120fKtluD4yZKx+i7GS8fIrrkZSGJlbRAlZ0uNA2uLvL3WJKWROt2fe5EciTtL7lzQDg4iTJRCkm89QZCRMETSZuV7xn4C11+siQQGX76L+fkwQbX01cN8K3dFLcKcKNHhdtN4jtOeAO9/+7aV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR20MB2779.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39840400004)(396003)(376002)(346002)(366004)(186009)(1800799009)(451199024)(83380400001)(9686003)(52536014)(71200400001)(5660300002)(4326008)(33656002)(6916009)(8676002)(54906003)(8936002)(76116006)(66946007)(64756008)(41300700001)(66476007)(2906002)(66556008)(66446008)(316002)(7696005)(6506007)(55016003)(38100700002)(86362001)(122000001)(38070700005)(478600001)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zzWYQJu8HARaVQ9102KKYBzPF5jqQJ0NCDY9/fIQzd3cFXFL4p2ig35mBrXw?=
 =?us-ascii?Q?T4ID3TmHP2dQratsk/Jj8Lk2Y0LgsgGOk3lumSDGtxIth1Ap9mL8m/qq4Ak2?=
 =?us-ascii?Q?xIXPgHQUsyVfbqLBoXLTAML0S2wLToGo8ZOlqagvq4Rc+jCHAKI7Z7NuhH/V?=
 =?us-ascii?Q?Uplfy0MyEAC/01BjUuy30LKsuR5BM2vtyJEWI713U1bWsaH/gU8X2gGrz98h?=
 =?us-ascii?Q?pJZdJ1yvzJXlNDVthNJ6Y2R8KSlySyw0ozQzVoDINUdvjoYOUrIA1mD+fvlO?=
 =?us-ascii?Q?HyVpGJtEuIKMQkWyE9xmE+2rcdNwmhiC/q1II5CJ3wKFAUtGkfjrRiMNxn7N?=
 =?us-ascii?Q?H+qUh6/sLRA/f37HTRmUXnXO0S+G0WDIcFfU7a076G+ywtSvC+CuueonHlij?=
 =?us-ascii?Q?0rnvxUbnIYPe2//WVTFzmJMj2oOr3+3keM3kVf2V4I27tIR28OG9slR1RDBp?=
 =?us-ascii?Q?xHq4VQQOGTNlEZll5O+vRD2SJKkbyMaoqhz6cP0FIsRfePwm6uNrjaDXyz6z?=
 =?us-ascii?Q?Qb5lryBsz9SimfmL/JEV6jVvnZhre3nWJ+/S/lLmbLTsF9Im6n0zM1AoYyFD?=
 =?us-ascii?Q?juUNgrpm51NZVWWnZw0ltwD5ggUOaHfkjzf7RznRa6F9jEgfGzp3X1G2Bo7I?=
 =?us-ascii?Q?5pVI9mMSZAVCP3Wo1Q9E7jR1YSlV9y5OTzGId9OC8QYGFL/27fl5DKMTkJjH?=
 =?us-ascii?Q?N5DE9sHjLGfVJauHW8OfTm0R4hIqj3YqYX/K/uMvBLTYktUSZMLcPJ6al2Ai?=
 =?us-ascii?Q?t8BlYLTbIG6yuhgtVHMmvoBVSr9RHWtWP/yZx+7raaBqFCjHaFUK/RyzOykJ?=
 =?us-ascii?Q?zUTcqnC6pcZ5Ho/x+Mq6/V1wIQ6N/xVNw/ZNsj4O51mz3km0sYFfa+Wn075n?=
 =?us-ascii?Q?y0ENAHcEmaiaWCE0eeSGjUsgiuuud2RY0Z4jjrheZBjNjAkl3JlQlOnPcg9X?=
 =?us-ascii?Q?7iuHdJUjjSwnM88HmH+/kZeRLQv3RjZDV0vcZHx2puZ0bpc/04PVCjw0dt7s?=
 =?us-ascii?Q?qdrCDuPD+70Lfy/QBESVj6F1JwHQErzHrBtXCEFgvIXKYP4wj2EFhklpPMRo?=
 =?us-ascii?Q?hFXVOCVnFMQ4B2YNvDAzQOngdn3KpdcZRxGC7aLBS2WTjPepkVCY90EmMqyv?=
 =?us-ascii?Q?RXelLbS746KzeyKTxAmByKlt4/F/Zv39eaJghuI5VYU1ExjtgHcZq6UBIa4p?=
 =?us-ascii?Q?L6fcVwoJY/kzds3/4cK6qk6vF0whkAZ8mWMP5pexDIci5zqQixoj1uKHyinf?=
 =?us-ascii?Q?lXuqb74T5/QX9uhTuPd3caj5sZ7Tqw9pUMml9J0ppu3zjNy1si2z3+VsSRhF?=
 =?us-ascii?Q?rR/qy6hRD5kwzhN+2aaBQFzb6yEegNcttckY6+z4o0PMJMTyRLHaQ8ny1M3v?=
 =?us-ascii?Q?f9pwY7j9kdLpy/kDfkWwGt4l1SRWbLtZP2j6dR8IqrGjUDpML5rMKiHODGlH?=
 =?us-ascii?Q?1ClZT/MGBB/BI9YKcqvhhL8StY3G4h4BtrWRjVxEdmOwwSAnQxcf2gNmFXPl?=
 =?us-ascii?Q?5HcGLE6dhJWTEN6wPII+TuzYBfsMsA8VX/PAE8fW0CPXgj/NUA5/QNmTNNZB?=
 =?us-ascii?Q?yYPRGV/JqlHo3mFvZUR0zGNcGjxqTVxExiVitDafFOdMYfDaoXsonA9txgpp?=
 =?us-ascii?Q?Vl9XU3Y30DiQi0+hlisQl211ZAOvKd6VKNMgM1HL03H5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nureva.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR20MB2779.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023f4e8d-1007-4876-0446-08dbb2dfaf1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2023 15:56:38.7903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5aeb77fa-643b-473e-aee0-cb54a11ccba3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvQEaQwoPcCIRlGx6wPbuutIFazwFR/lv1tFHolKNUBTf+9aiA3iYu8m/A0eRxE+43eg0XfHjxM813NRKDdQYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB4517

On Wed, 6 Sep 2023, Stefano Stabellini wrote:
> On Wed, 6 Sep 2023, Anthony Chan wrote:
> > Thanks, I've tried patches that stemmed from that discussion but
> > unfortunately, doesn't resolve the issue.  In fact, the s2idle_loop
> > branch might not be the problem at all.  I experimented with Xen to all=
ow the
> > 'idle-states' into the FDT and prevented xen_guest_init on Linux from d=
isabling
> > the 'cpuidle' driver (arch/arm/xen/enlighten.c).  When I trigger a susp=
end, I
> > can see now another thread (believe it's the idle thread) call into
> > drivers/firmware/psci/psci.c:__psci_cpu_suspend and then the Xen
> > counterpart at xen/arch/arm/vpsci.c:do_psci_0_2_cpu_suspend.
>
> OK but remember that Xen is not implementing do_psci_0_2_cpu_suspend
> correctly at the moment. Either we need to fix the Xen implementation, or=
 we
> need to configure Linux so that it calls WFI instead of __psci_cpu_suspen=
d.
>
> As a test, can you try to apply the attached patch to Xen as a tenative f=
ix?  Or
> you could change drivers/firmware/psci/psci.c:__psci_cpu_suspend to call
> WFI instead of the PSCI operation (making sure to go to the entry_point
> instead of returning).

Tried the patch and substituting a WFI for a PSCI op, but Xen still watchdo=
gs on the VMs in both cases.  I noticed the other Linux generic arm 'cpu-id=
le' driver which used to do issue a WFI/cpu_do_idle isn't useable anymore e=
ither.  I'm not sure if Xen may have used to rely on this generic driver to=
 get the WFI.

CONFIDENTIALITY NOTICE: This e-mail, including any attachments, may contain=
 information that is confidential and privileged. Any unauthorized disclosu=
re, reproduction or use of this e-mail is prohibited. If you are not the in=
tended recipient, please notify the sender by reply e-mail or telephone and=
 permanently delete this e-mail and any reproductions immediately.

