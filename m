Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 692F13ACE06
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 16:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144729.266349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFtD-00015H-4D; Fri, 18 Jun 2021 14:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144729.266349; Fri, 18 Jun 2021 14:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luFtD-00013R-16; Fri, 18 Jun 2021 14:54:35 +0000
Received: by outflank-mailman (input) for mailman id 144729;
 Fri, 18 Jun 2021 14:54:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfjP=LM=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1luFtB-00013L-Bp
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 14:54:33 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c3c7c1a-e041-4b69-b63c-b12a99e0c5f9;
 Fri, 18 Jun 2021 14:54:32 +0000 (UTC)
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
X-Inumbo-ID: 2c3c7c1a-e041-4b69-b63c-b12a99e0c5f9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624028072;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gYskcMkifrLBdx7KJpgGJ0ATiNi84lRrFlufKWWJGy8=;
  b=UJmA+vUs6/hMehPAVChDYdi2oncMKnN4uTgZsezPjRgHQ/zFVTeIB9U7
   jm+wBvCIKo3LT09BhQeuWp/uvZBLCGs7U7w9WpdOg1GlRp54Hz7xA2eL+
   m0c6zJvSJ7tRLjGukFAcpilBBQ7OWJQ28cQLsXH2PWocmlHupbArpEEzV
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ChSi7n+Z6mFiTLWKfbq+eIdgA7eajLu28NATQQ6MSBGYYv6L2GdmaCq/tspNA0CnBJrE80UcZ0
 G/91P/jF0MPrjCMvk8hu6yYc3MLYxnyoDFO/mntmACHqW8MGKjS+l6E1b0MHFgRQYkczqlSNqD
 cO+iJuaUe3RDOQYoTB9Q6rWWJzOhRTp+1fMaMcMFiGzhpYu0fNGMjofgiEbNKIzDSd/kAaDLtV
 ctm1DuU7YUpfJkwYFM6uAjWQAYnISoBKw2mnvuM10QRajbApPJYya3lGmOVEAbWN6ZdGJ8IfWB
 hlY=
X-SBRS: 5.1
X-MesageID: 46195058
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:iDZfB6oLhaLUWJJ+u7Cm2X4aV5pIeYIsimQD101hICG9E/b5qy
 nKpp8mPHDP5Qr5NEtLpTniAsi9qA3nmqKdiLN5VYtKNzOLhILHFu9f0bc=
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46195058"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJjQVr28mTWUJtzIHwPgYQlf/klvfK2icKRsiaA/pEdYRe7bTWwfu0nzYOiDtzu/C/TC0THsHxvv7YI43QByzXTuDDprqXSLARQpjG5EYRaGr1AKJwgDfrvB/xwJ3vMpQ3nrPrKrrWIavX826OVKZQoqvmjhiuBHox1EGCyGeOX/J0mkR42df2kh0HWgPOhnhh0ILwt7WFuWG9DK4ycPLhvxjFTgkkERxOffiSMTGQx5+SMpIb1KKKSCa8S2T17AIa9bZQ8z0jPG2mzXO9k7xpmTJGnkLVzskDCvPeYtpMyf3/mEVHxcEIWGUidG6xUQSzfubzHYBqn7PZMOEni1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYskcMkifrLBdx7KJpgGJ0ATiNi84lRrFlufKWWJGy8=;
 b=AxVJWRwGbPgVmMeYa9vgfPu0VuOl0cH3Ku2SzuemtI2G5TUWE9LPFcTZeF3oidwnabiP9fFQSLSPMpj331dISP3CTUwtOhTaJqbYNGd9zB5267YCFaYLLG5gufyPl0a9bioNgWNz9mb9sz0UYgLAMrVvKH3RwF0l6dAHMD/wNMF8pAWcNUOUDBPUugwC1ak+0+kcTQ2VKIt2pFG0jw29O9UmU2OJOXd8wK+0ELPYaDahH1SinPueIW6Y2T0bsA/GKLqbcu+9htmXu4A1vc6HO/swgL+MTx3C7zYGx2Dy1p7bK3ipUuZ6vFz5XVlUZH6P8l9B5RFS+HkcURDHX+tWaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYskcMkifrLBdx7KJpgGJ0ATiNi84lRrFlufKWWJGy8=;
 b=POkMu6pwcN4af5Jw+5AkCvZxCOALkehukQdEG1cR65zOcLNe+BTdzuCsilj8siU9rX7bGmLl0JenWq046lLL+Ldp6zqKsodaCp2jhQzYTfx6UZP02z1owuEvtAYZWD3e3C2xU1KypIcpbMCT/PjfN2vkUc75z9FEORHliJ8+DxE=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Nick Rosbrook
	<rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RESEND PATCH 10/12] golang/xenlight: add SendTrigger wrapper
Thread-Topic: [RESEND PATCH 10/12] golang/xenlight: add SendTrigger wrapper
Thread-Index: AQHXUNyv7x+9IkGe00u122PbmAOg8qsaAfAA
Date: Fri, 18 Jun 2021 14:54:27 +0000
Message-ID: <6396CE24-4BFE-4AE7-94D4-5EF970FDB861@citrix.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
 <7788e3f5f1af622782ede1b879f4f02ec63fa546.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <7788e3f5f1af622782ede1b879f4f02ec63fa546.1621887506.git.rosbrookn@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d16f9ca-5e1d-4a6c-60b9-08d93268f86d
x-ms-traffictypediagnostic: PH0PR03MB5736:
x-microsoft-antispam-prvs: <PH0PR03MB573694657EAC8405B5683D5D990D9@PH0PR03MB5736.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n8Hw/kQnJfsbzSyQH3yx5oi1ldnKECZFyXA48d7ahXUANdadA9peNYM8q0tYOaWnMW6oawMeVYNPs8c3R5mpOSc07RPvYNsuimMxP4LeNuLx2sry2xExC7i8uV1bmbUIqnjCPRIgj2mMY7q+iZhrWdGR/EROD+T4yK0RcoNd4/GbZE/oyJ6jZsNScF5hOEPnMXZSN9a2d2gkb6JsuxXhd+uhBxvhcKAM5Spq8x7PlWdZLp27tAlXNUjsVxkKrkOVhpmyiLOIEJal21MARKLiUzfMFCr8YIqWqHVBtB5Yl94qix1pX04d66hDKmIN4ozCIRStLCT3yIbKaCCtiGmrTHdoNz31u2qfTIuFp1mgdMN7YS3ObAoWzRmiaBHTwwMpeQcMZpU6k6VaMZBkqq1q6jN8OBkSPIsnSM3MWdsZNo3jSOjKkghpq9DSgCN8gLypEtIL7e5TMOdNG2L/IpoLKU35yrj1VCDJbxcHgfvFcOCL+UPs9LTr8O+VA0BptBblQQhOAwBi/XdXnxAM7kQnJZZ/G5YhEu4VY8Lvw4ppuezAVcJDCnaY5cNTQJlhytkjU0+yYj05fUiq9ywGWOhM2MylRzyA6x6g5nIJFDFcc3YRP9vrjjoK1WOBtCqbdf5aUX91EcuZOlNAHRt9YFFfUgZlEsQX4/PNvuHeNfv+ziQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(4326008)(558084003)(8676002)(36756003)(33656002)(53546011)(8936002)(478600001)(66476007)(186003)(64756008)(6506007)(122000001)(66946007)(91956017)(86362001)(5660300002)(38100700002)(66446008)(76116006)(2906002)(6916009)(316002)(71200400001)(66556008)(54906003)(26005)(6512007)(6486002)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6UN/A3+CqiDB2HCHkzQGK/PdDMeY+linMvHhCL0eWkaa/h22NTfDJzn62sxu?=
 =?us-ascii?Q?J+u9z3p6ZzlQMV6AUiTrWTqV6GDSFIynRCnkD5YfY4jOCBXPgIQKpx4C+yqq?=
 =?us-ascii?Q?VXpu29KAOZmu9i9Wzfl6kAZT7Yo1SvxVDCKPtz6dYqEQchtGgeFDDMwEhk94?=
 =?us-ascii?Q?VNKwSYlOxpAGdylukBj4/7lZHwNnxxK097Ak6TAEfjVKbtTV/s5Sn8+70M7g?=
 =?us-ascii?Q?dJRbif+ZFVkQB9uEBaeF4QCuw67zdMewacCchQz3gom73+RRatvtA8ikyVnF?=
 =?us-ascii?Q?cVQxZWbQCMJmjOL013Dk4BBg0VO2n2cIIugIoeePGip7ybFzN0Ck0ah97snU?=
 =?us-ascii?Q?DO/VvQR2cPrNHJml0wfyLPxbFz66ExM41NAkvApauQ3ULPthDif/IEsx/7b4?=
 =?us-ascii?Q?n4zE414gCZ74X0At8TzwNTjDSy/+UG0sDS1ol3fyHNFijHhfpvTRiPYxGpoC?=
 =?us-ascii?Q?s43k53TELzQugfqm2ramMHnz62vZXTN2NBFARkA7NQqU3vz/NRqyEsArX0A6?=
 =?us-ascii?Q?aDFNhsPKCfJoN7ZzS3tYqiiu2u46NZ19jh0Rn50Xza8u83MOTmK7WWOuuAbY?=
 =?us-ascii?Q?XAH6TurFATW51JU1XNrToYfXvU9so46YBuK7oJaQIAX8NMCjTa4Ocm60cYpp?=
 =?us-ascii?Q?Qs5UByNvNfR1SgQbYGJbMvNbCAanUJ3ab+R7RGajhqSK9I3rVbvRXITHAE8h?=
 =?us-ascii?Q?oFDSvNNAqT6891YmvCSRyQ8hqpamODaIiH4STGiiMrzQEp6eRfEgVld+LZEX?=
 =?us-ascii?Q?LcOn9rV/ML7oL69tXevPqupgeQR7ESgNJAIihJ2K2miDm5IFEXt4qPjf6wEo?=
 =?us-ascii?Q?cppAa50Itv9cS/X7i+YdB0GVpSfjujPPEdvFUWYSpMoni6asAhuuw7SZxbje?=
 =?us-ascii?Q?R575+I0WNM8z9i4gnTvzrekBeG+iVR8Z4+qJGJKttUIxz5jqnqCfTCnRs2OM?=
 =?us-ascii?Q?Zmldxd2jFQ3bRqC5va7+53M2Ui/sqKO6bJWHK0f+WTayZHu7/xhWVlKNOKM0?=
 =?us-ascii?Q?MqHDUMq94o5Df6tn/mMlHW8SGZz61/Snqkq9KAoCVFQHrAtrtBBfSM2DEoE1?=
 =?us-ascii?Q?wf3OWTXFFSt6waCQOuaBslRIYGEL8xF/mInzGtsoT9hQASrUUdOZ0NSx8Uxr?=
 =?us-ascii?Q?ekiH9mVc869R7iZDm2UAiFhHAbGiNd9fKrKUIFYHxEswvtYfllMMEWhNpvRu?=
 =?us-ascii?Q?Fv8GvfoTdTfnsBQmiTfYYQ4WUMGBAik/5JL3ewiSHte/Vtr4ZFy7knp2jqek?=
 =?us-ascii?Q?MAkDGD2EWZoVRAuCN4fLOoUTR4q4prTLCBP2wUWBefXDGNjCYAx4O0YQc0eG?=
 =?us-ascii?Q?psd2tZCNu5r6Z8Fs33TxmlJK?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <80C5ADEB13BB684C85FD91332AA76024@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d16f9ca-5e1d-4a6c-60b9-08d93268f86d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2021 14:54:27.4266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHSvLU3QuF6NGR3EMq417hfD2qFBpghJfLPnCqMszYnDZ3JFtAR62cX6PJVzYI0kfCRObPY19j+Z0QdCJErWP9SLvDMdZ5wpOM2uym79akg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5736
X-OriginatorOrg: citrix.com



> On May 24, 2021, at 9:36 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
>=20
> Add a warpper around libxl_send_trigger.
>=20
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


