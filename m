Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65562318D50
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 15:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83918.157208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lACwi-0002qU-Qr; Thu, 11 Feb 2021 14:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83918.157208; Thu, 11 Feb 2021 14:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lACwi-0002q5-NF; Thu, 11 Feb 2021 14:27:52 +0000
Received: by outflank-mailman (input) for mailman id 83918;
 Thu, 11 Feb 2021 14:27:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MG8K=HN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lACwh-0002q0-7o
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 14:27:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f36006ec-0cd6-4407-a3e8-cfa8154b6dfb;
 Thu, 11 Feb 2021 14:27:49 +0000 (UTC)
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
X-Inumbo-ID: f36006ec-0cd6-4407-a3e8-cfa8154b6dfb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613053669;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=c7iwSsJTOcTGqSZjVHehbQ5NzPp/4ejwmXHlRhTugIk=;
  b=Jk3w5gtYZNTwH9emJUj9G+IyXwF09QGqRPjDxIAEw6Jd+n83zw+Vr7yR
   XNl7wK56hd6Y3r6PqfZJtpvlIXBPJqa4f1nHdFRAAD7mZcIe9HLF54FZT
   vSHPy5BN8+zRD9LsEDPqYlpy/m0979r9lfSLi3lOgfDpVfpMBKLfUHbNZ
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: bZoNhGoIJ5G10Om0Wz5ZoTr8Q4THo4iJWSEF3mu2065qfUOa6OcZ7Z+t2+Rdc/Iw8sCV68tePQ
 ZDQt2fianuNBCjZc4Q/40dPpwdkC0wMPJO3MmKRziRmQ9Yi/5N8FPENez2d1LG9nE6cuFLvSo+
 A+bhn/2xbI+DNvfDh1D+JHAvb9C3kq93BTUXzw4Yl+tH5zvfaysx+e/lFgjz6DdRi5D73jpXTE
 uU6071n1yeLswApBI9sGLRpYZswJ3jMoA0rzlCx44rf9OtngOOJN4vwbCS+ZZxTOdbwXauKwic
 Zbs=
X-SBRS: 5.2
X-MesageID: 37043871
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,170,1610427600"; 
   d="scan'208";a="37043871"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFI5r50LCvHn8Abwu3cUoTPPoG6rGziHkzuwQ3W+zZ9tx4J02tfSFDkzQaDP/r+CPb1OyUopFrV+TJ+a4W95+I6osnEoh2omxul17oGyaEqmziU+6XM8TotkpJBs/7T8Nu8np/kGHd247ddTUPIIiEHa0bfBJeUChLaYZKCOfSakg+UOv7rJth9ZdkjeGdnL+XvbrES8jWAkFlKMqx64gl+jYG5/oC5jJ25AhQ/O0nftqWL5ys23qRQkfIKj+P/OAxhGr9YXjb0teW36XuubfFPc+0kjqR8Hk0FSQ4oJfGnXZXj1H6Au6ZzOufj3U5Quz9ezDkfiPGLl95NByjf3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7iwSsJTOcTGqSZjVHehbQ5NzPp/4ejwmXHlRhTugIk=;
 b=Kf3abLoUhTgfjWzXy2h/yZ5kPyJJnGEBorvtdihEpGjfd3jHhh7tC6Wikzaze8knBMNKYqJd3UaFiuYTLn70deybvnIC5UXCpYcz3pflBv/uGppLZVb0cnVD0jkbLxEl37pyYRT7e5mF82gITE+0x+Owieds82t+5wZ529THLEJOihA+IB1pipWMNHZSlT8x3KWPrlTMyZ+KogCYF0hUh861lsqmivpJCo6lmHl15lkcZjufFd9p9Rog+pxAp4RjZBSikSnYrMoxfbL1/FnoSIEuOltO/TGXJNUtWBQa1mt8HvKX3HbBuWrf8xYaAHzYypDi9z5HzP7M7zGuc98WKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7iwSsJTOcTGqSZjVHehbQ5NzPp/4ejwmXHlRhTugIk=;
 b=LmOsoZKdWJ+mLa85rqA+lNI3AK/SVM/bPtbxPYlq+P70oKjhZ7y9qlxFJCPqUGF5JIXoPsV06kE4Z8Wpgd7Ucc4KkDbgj4usLSF0VEnaKhn8e9Zu8rLKcmZqWD6wkVEMyMaDZt8EJ5sUfq8ETnPUc8H7ZAFfhb9TmjFHSSkZV4w=
From: George Dunlap <George.Dunlap@citrix.com>
To: "open list:X86" <xen-devel@lists.xenproject.org>
CC: "xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>,
	Rachel Romoff <rromoff@linuxfoundation.org>
Subject: [ANNOUNCEMENT] XenSummit VIRTUAL 2021 May 25-28
Thread-Topic: [ANNOUNCEMENT] XenSummit VIRTUAL 2021 May 25-28
Thread-Index: AQHXAIIQsLp0dQjn7UyDlp9keXk32A==
Date: Thu, 11 Feb 2021 14:27:45 +0000
Message-ID: <47E402B0-306E-4433-85D2-8471EC82101E@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1e28a49-5eae-4420-4686-08d8ce99336e
x-ms-traffictypediagnostic: PH0PR03MB5927:
x-microsoft-antispam-prvs: <PH0PR03MB59272B2CC9059060E2D73E70998C9@PH0PR03MB5927.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3hal7gFEms/kD8gOeLS0p7byNCqnVuTbrCpeUL8z0Qnj3ivfHo5HxaaazkgYdcXntuFiwhMDmWNsFbexohHbDjcZJs8hxCyJUEI8CiZ80m4dZ7y9SLDOjpm08PyMOYSHrAFggpaM+e4QUUF/BMWsBDKdu2p75Eu/bpoTTM0EzRnw0qJWVX2VM0zBw6lUDmSHnteqq6syxqr81FefvEsp9oE1V3H+kEmHLFC5ceS15XMz95DXqn0eVn75tul1V8r5KDNXNmJigpRXBM89M+N5GsKkfw3WkXpvqkts5hgD+GuMvv+Lgw2hCh4wOvO1FoWznmhhqTisgzvnPsRsdzcFveWE0Omjoe+bz37ii8G9ZzlzV7k6dDHEWnLII0azUP8GNXAF4QwuYCcWE+1StA6IAfnnamnWwgDwOJAACWCHz1njfQX7pu7QHgnppgvBP5b5NoB2Zk2WM75m+5cWreo9gRR9WUoaNm7j8tYA5j8VFe+527uh3DruwU88H9p4pLjYDA+9hjKTjmxJEm6y1pfUqbqdQQLh3Q7kN+ifeu2Yo5GlBllldMJ3O71Dt61BzOtweMihUijESHQrjgm/PZYLOs6EJmGYY18y0Y/RUXT90hhZUBkdNfMwQahasiy2bOo1+UFMyiu1hMro+w5wXvMMwAN1u/5A16Qv5oe/QiXm3wA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(2616005)(83380400001)(5660300002)(4744005)(966005)(91956017)(76116006)(66446008)(86362001)(66946007)(6486002)(64756008)(66556008)(66476007)(478600001)(2906002)(4326008)(6512007)(36756003)(71200400001)(8676002)(33656002)(6916009)(8936002)(26005)(186003)(6506007)(316002)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dI1XBY2y2UGwQkueWIElmydKGJa37z92r211+MlDSYKOjI1Xs7LK0cUQq6y4?=
 =?us-ascii?Q?1SNUwJw0UkuB7ZG/YFHJO3F2Li2wCsKNUiFLibIimJGPriztXmlpWIYVxCp1?=
 =?us-ascii?Q?yGZBa+5IkShzhvHC0c1ei32ZOr5A0KXynx5/4L6CijYLc6IK6h+u+hGnlerQ?=
 =?us-ascii?Q?oK17hrkTsRxKCYBm5a+Y85gi3fadPolhp+DQCgqAz68Ff8j7caek1Mj91I8b?=
 =?us-ascii?Q?wF6pg6YcBWYQOYP/kF3U6NipPJRC7Dq3KQbxrdk46X908guhPr04Y64yvOup?=
 =?us-ascii?Q?RlsR825K0XEp7if/EWEkVCRS5t11+r1SPKY9NqtwlSJZS+GslWWDBHRanLna?=
 =?us-ascii?Q?tsd2YO2D6XlzIN3nlwsiHwwZEBEkUvDFk/L7oDrDkzrmnDo4pSm7Qilx5R69?=
 =?us-ascii?Q?610EQwHlfr067W8MRQ2re6xvPIS9u12/loHqq14aGlo9rn6UHQIIPMknjwsX?=
 =?us-ascii?Q?eBhcmxkq1k8sbxPhB3BRiwmxaHjM/PI2fS1qEWortjEhiWELEp7Hnw0tnLpW?=
 =?us-ascii?Q?trkBsW78+VNmDkXx1DFfyCQQ5RoGpt0x8WQDJCVK5LekfMisdS/7aa4YBQ/M?=
 =?us-ascii?Q?stXydIScn6CBlA479qPrv8Lh+qT2Suel6z0GUF9///TdoUSh88KQy8ZKBY9a?=
 =?us-ascii?Q?3DwNwbPc+n2Q0YAvyd30q4h3HUT8SvpkBxGkcOaWiicxDECOLewiWrgqB/oV?=
 =?us-ascii?Q?slHXNd2gEVcEA4+0kxQXlDIjzOb9ka8qn6Uv/X72pokA5o+dIE19BHD1BlfC?=
 =?us-ascii?Q?hzBe1XQBTrpjsIczl16Dgk2KdZ+mFEEGLp7T6cmdtR6Jl0FIB6xh585ySL8N?=
 =?us-ascii?Q?Gqghm72SVIuCu/JfaWI+jQlZKwL2zPMIJ7+PsqVPDY2paoKm98ChB7jmoIl9?=
 =?us-ascii?Q?zYOIf4H5ZVxx0c4JUeRyNU76wO14dRSoBHo3BugNR7h2YYgpYVerH3mipLwU?=
 =?us-ascii?Q?rohXRAl9ucp5y+Kdl9xXoLy71vRL1zrp4LvvMoMw1VVnTpNhLUmlBuzVbOzG?=
 =?us-ascii?Q?vlNBATyfTHM4/Y0BFpJ8VmOPQ/cwd1qNvCj+H37dmgU5Pvd/xRhx/pga3O7o?=
 =?us-ascii?Q?7lWszdkyMyt9sm/4KayPoWC1yF/miJwNcGHafrfNOpd5V4VO0him1gVEPH7m?=
 =?us-ascii?Q?XLrmplf3/MraHyq8cIh37pxRDpy1KqkHfMlJvP3MfiVZOMhsia40MncsWFJK?=
 =?us-ascii?Q?cwr6WWHNhGEgXmbLSbAHA37dElm0wsjJfROD/rxUZp8zW/qmnNANHUGS+45M?=
 =?us-ascii?Q?orgLH8wvbeyhNEoTl7y8aOkJbMf2qiksySTroq1eGY2x2ZVOzUDchce3n0ov?=
 =?us-ascii?Q?LtcQLJCXwuHx4K9q6MpotAxPCBROZmLlbejDx3EmEp1emQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <02FA38D31C89AC428265570B6F32D8F9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e28a49-5eae-4420-4686-08d8ce99336e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2021 14:27:46.0053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zNvtUKR7d8sAkAbXXxC50B6iAZsP897YPj7nz7ch0nmzZ+7pshugPFiSXP+qnFzpBSVuXhwt6vWB2RK/GfjsfUWXoRWPLJG9HnsxkRBErYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5927
X-OriginatorOrg: citrix.com

Hello everyone!

Submissions are now open for The XenProject Design and Developer Summit, to=
 be held virtually, May 25-28.

CFP closes 11:59pm PST on Friday, April 2, and notifications will be made o=
n 19 April.

As always, a significant chunk of time will be dedicated to attendee-submit=
ted design sessions.

Main event link: https://events.linuxfoundation.org/xen-summit/

CFP Link: https://events.linuxfoundation.org/xen-summit/program/cfp/

 -George Dunlap=

