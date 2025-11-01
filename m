Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB55C27D34
	for <lists+xen-devel@lfdr.de>; Sat, 01 Nov 2025 12:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154892.1484537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEC-0002I4-Uv; Sat, 01 Nov 2025 11:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154892.1484537; Sat, 01 Nov 2025 11:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFAEC-0002Dc-R8; Sat, 01 Nov 2025 11:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1154892;
 Sat, 01 Nov 2025 11:57:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLmn=5J=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vFAEB-0002Ar-GQ
 for xen-devel@lists.xenproject.org; Sat, 01 Nov 2025 11:57:03 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e03494b5-b719-11f0-980a-7dc792cee155;
 Sat, 01 Nov 2025 12:57:01 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AM9PR03MB7297.eurprd03.prod.outlook.com (2603:10a6:20b:268::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 11:56:55 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 11:56:55 +0000
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
X-Inumbo-ID: e03494b5-b719-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/D6z+iBLwAPMdmENmpKI71HEkX0lPSfRwspuL8apFUigXrU6Qu4wm5ftf3wxUDQX+PUQJqFAtUeWY74/5fwj2+ojt/fEj7K9X4wqvR/dIhJL7liyEgyNLtfiE0YG5c+esv+oZMswB/530Z79vuCXf8T5Rz8kE4L2EwiBJJsru+pMaJbGpAc1ESdVQ1FPmveS3baKvnO1HvlVyG+er4BIRB8OewBCMnX/TZEWBADoBiTvN++uRj+CSa/lQvgG+D4UlA79VlWyjW1VB9n3pjGY82c/Fy40YXa/mDbA7JHGNajh4wygPwNua+g1KM3EzERgkxm5EWQhckmeb6vqKox9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6EcK1VWBBRi1b3e/lovbXBmnfONGoWiHfaVA7kccdM=;
 b=LOBftpDJL1fojTw6YoNtsjDGneNn+h5CLMZ4R7gSTPlu2GvbPA9HTmloiv4YOj54kRkZjl/eiXj1xWIA/6ggNUaF9J31OTODT2rWsnVz/rkpmd34HsIxnexlEHtsKkw4IfLXB0lCSpXs1AjeYmizRDhoJdgTKhp541A7iOa+HTr91pwXxUbi0OnCz5GWvGJvhHZvCSkmJLubZIzjSTaxBOkqDj4vHW9Pbaf4F7xBLfQl3c1Gqan0lrWJNSVTg6IszG/TV2SZ7WkGuslHWikV3fGCNZDc9KGNfWLo7KdScNSEbGH0WnVqvLRdWaayQmL9tlJ7NtEqVdHFASTUdxGA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6EcK1VWBBRi1b3e/lovbXBmnfONGoWiHfaVA7kccdM=;
 b=gqcgtTzzASLcVWGzLLMbGkFgApuj3aCq3TUatsWWeiJrCbUb3Zd1Ma4e3EIvlFR/gVewAMQtkSrWkk7RTYS8Q/ozxibLk6TQeL1ew/MqSStUZEeaVJ8UxM+K/YhLbvyncta/ScJqhERr9dmrHcTmH+0gtbab7L63FnpoGFEyj0cHp9nYNMC6HNKW/WjcmPoOOc0OOfoaU10sOGt4oBjnSMoSUCJy8FxY3A+NAuOHpyWW+82nfrqdAcLk75hQOMidSFA6xKCa6wLfa9mi//IuTUdWOCeOgd8mjpOzvwi6cidiLrz345NZDMX0uSi02voGQWRKcuiFs6RGC4tP420qVg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v6 0/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 support
Thread-Topic: [PATCH v6 0/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 support
Thread-Index: AQHcSyaej3MdbzIHW0yl8V/tuA4r3g==
Date: Sat, 1 Nov 2025 11:56:55 +0000
Message-ID: <cover.1761998077.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AM9PR03MB7297:EE_
x-ms-office365-filtering-correlation-id: d8360ca3-fa3a-4c98-9bca-08de193dc11e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CSwtQqOvuvsJXAySMhwxTaKQ/M4FBXfFZvZzucBpDALkzn+EfBHXYwZB7s?=
 =?iso-8859-1?Q?Tivgb34i7BRHVbtebMZFlcR3PjPJ2xoDtvFcOYA5tQerdwKV2rvpjR1me7?=
 =?iso-8859-1?Q?7P0S28ZhrSa+Ax/ArjqWbSDPB+EM+xWkR1gf5V6gOU3gQGDJDkATAc5v5c?=
 =?iso-8859-1?Q?Q3pSXwbXZJNnSZjORKqmw1Cb0cCLAvE879v3eoC4FSrMM9Rrxm4fyLZh4Q?=
 =?iso-8859-1?Q?TfZdhBjuQ7fjD7gH3kbtlEd7Oco6rH6WfSHoxbYFgPBi+z+f9/70ExUdtS?=
 =?iso-8859-1?Q?NztHsA7IFVrjmJCGIpQMKdxnNpuyKxX+fHsVVv7Y0oGGnBHek81rnxQXLi?=
 =?iso-8859-1?Q?P2YPFx+rwart0oJOMdsDpZZOD4FaZwLc1h7MPZCEMp23TH36zjinDjhWOs?=
 =?iso-8859-1?Q?py2kpaNcWX5DGHjA5OEdF+7JI7dZZ1rhup1eHOK4t2peO22duQxCKptA/E?=
 =?iso-8859-1?Q?9AKW48XSEHW6RPAvIcRPvYE5hjd+Quv2Obmp3qgEZSwZPDNc7xs9Fc0+73?=
 =?iso-8859-1?Q?4MUpHSdwLZZe53PNO3YxVjNDxCXIYlclwo/1HliO7+bG9AjOSeNwQiugKX?=
 =?iso-8859-1?Q?cnFkIvysOHeZzCf2MtA9z5thWHucTpIRvlVkyk0uIe7yyvO0PuctFkR2KX?=
 =?iso-8859-1?Q?mnRFhl6yP+rLLAY4lFgvf/qJI7AhqGpcVzHuzb8OnTXNpjrTcFsW2rGpAg?=
 =?iso-8859-1?Q?hZkrF2078TsaimHnXKnEJI/xSbIBv5PrIZz5ofgdAY40Ls4y73/ftR9FSs?=
 =?iso-8859-1?Q?jPBxsgFfKOCl6EEjIoMi3nwjUW92L0Lal/Tu5BnY0/Ely00qeDdjza8/rq?=
 =?iso-8859-1?Q?LccpNrf68gDcusgdVDCWFPH8n0w7DLtbgh7eesboZj5aDSwEmuQ9+mabyW?=
 =?iso-8859-1?Q?XPgraW29ZJykjYORpa6kvsFA3+Qa07IcwiCANxhE0gu2hXi9vr5SsCBmn8?=
 =?iso-8859-1?Q?JBzAqwQQ4L/g8mE1cprIYzoTdgKu0ZpspMwEqGTVPRhz8xW/yDE77GoVl/?=
 =?iso-8859-1?Q?SCV9nEAgEIdkMra8QexeX4fonFf7qDDu1NYgjIyNXHM1GidI0M8QH7WAWf?=
 =?iso-8859-1?Q?XfvXaqVtLO5kJCHsntBfvv9lR3Xn3Qc0Kq062PtVCLopvRWk12xajkaDL6?=
 =?iso-8859-1?Q?+5HYtNFQs4ZirCVQ/9/7460+6pEycf9bIJ1s/nMe/1Is89E/yrAd8Wvouh?=
 =?iso-8859-1?Q?zYM2fKrgOgLyFbTkdCPJ5f0OxxsRNnjpi+eJK5h6SfWvaBmmq4Pjy/4Xp0?=
 =?iso-8859-1?Q?2R2Au4XdbCX+AHlE6KR4MriAFmDLYGQYrSTIKL+6i/ULWlJt11OS8SsgBB?=
 =?iso-8859-1?Q?v3RUH7SSnyXAiKK7ZhAW4N9GhvF/ksB2HLL9opozJAoIZGtOXJzNPqbstl?=
 =?iso-8859-1?Q?hrJao6gH/FOpT8iU9riX5mvlwLwH4ESRjR0KZb0w5Zo1zrHzs4QFmgUunW?=
 =?iso-8859-1?Q?RJtntQHmib7m/XimkTbCEm/vRHCuCbVlUQSA8X1LKy9KbPevbhRRR8XirV?=
 =?iso-8859-1?Q?e0uYm4g6sDaYAaCPxJt2+TXvojMUk2+gJZSY5719gJ2AYSFT997NrN5gHk?=
 =?iso-8859-1?Q?LzdADPxoe5cTAl16heKGkVFqQnzP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?emHAEQeRyOYvTTZCtag9ElWs9BlV4S7Y7SDpLbgJ4TnP2/0soupRvuUUAu?=
 =?iso-8859-1?Q?wI6hyKuYaXwHAb6C2Va26RTJUE2VbYcgA6kTMlBkuKpndNcZlr8W6xNtQl?=
 =?iso-8859-1?Q?2WN6bGeR9CdGTGIQk8E4pOvbCRphtAiuAL5SCk7cOWFymecJXkLkdCIup2?=
 =?iso-8859-1?Q?QNeR4Xf5qYrUoqE3b3e3wh8YHQsKOs9Vx2PCaR0guzaPmSCGuYRsWfMxiw?=
 =?iso-8859-1?Q?8PUhp9oeRzJiomlueeDIGhpTnVK93QvEQNV2QAu5iun2dz+SCML0+/PqjU?=
 =?iso-8859-1?Q?8gj9VqLtv0fIEHRBDedGbLJPDNDdk2ksvnPsWzA/8fh2YwFD8RseuTu4mW?=
 =?iso-8859-1?Q?M4c//nh/HBffXihgz0ZkvZnVwTTqGgXitGdp7pEpCsi847ATcqcxTlwbw9?=
 =?iso-8859-1?Q?GCL1+mRRBcpTq6nXYqSnNvj0xuf5xwzUpadzDv+nyZ1ynIhpirOGTGEKNu?=
 =?iso-8859-1?Q?UCnYF7lxsAHFwu5+6hfameJQ2YzpEEG8JPgaUWj7qbznWmUQhiL3+4WYNp?=
 =?iso-8859-1?Q?IDxX4oj6nwcaggdZkFb92WqqwbSkjG+NE7ZMYMF8iauZBAA8UsEmcUqSr0?=
 =?iso-8859-1?Q?n7QSuIqjxMMviEiHg84piQziOLvRhSiWazjMS6/tAjfu8/qzGuVxeS2DIE?=
 =?iso-8859-1?Q?5Q/a/R606h9KU8lizqBOCZ+33jUkBujlSb9lOZRqyM4S/3vFS0quugmkgp?=
 =?iso-8859-1?Q?59rdPHl5cvtUrXhZwooYyXKvC56iEgixahdTfx/mgTGVCE5L8+RcJGj1DG?=
 =?iso-8859-1?Q?SJOvgs8YVMAEShjAfSuZjKIPyRmrF/fvvDoW/ywnGOY+RBhwRKtw7CU05o?=
 =?iso-8859-1?Q?wi17laRFpkogIkCtiuAXprUnRHRJmkGMwvbmOwnl889mwYt0By89Y3crWS?=
 =?iso-8859-1?Q?jjl0cp6t9zvFjzvGjTAtN3fXBVrf2EADXF5G2Wp41KJzE4lUVy5bv46o6p?=
 =?iso-8859-1?Q?pk1mybZ/3hNIOO4kwCenNpwRkBtRAzVrzzwdm+lwg+GSWPX/+3vU13lLkX?=
 =?iso-8859-1?Q?mB0S1BcK34LaMKYh2FtBDJFujQkO4HmuBx1kuKtTkZFayX6Nl48o8m79ZQ?=
 =?iso-8859-1?Q?YHBYS+WIeUiGz1mN11HRfc1SZPHjJ2TORnuugoHaV/8KCelAN5llqXgANX?=
 =?iso-8859-1?Q?nhS+06sSC8VFfpUwpevYk5N1trlS50vOAAuDplEXvuUh6OOPyPBZ8gNngJ?=
 =?iso-8859-1?Q?SUKbcFNkp8SAPyvPA4rvjDYXOXQcnBV26qzjkEK9SU0l2tNtc6ul6Prhd0?=
 =?iso-8859-1?Q?Q8hvvpYy+3wdbySsXCdLj+8T8T0ut9MIDoGVDsNNhd9tj4LHG00FfFJGl2?=
 =?iso-8859-1?Q?9BkTgsE5mI3pXgurm4xnNFYBSyIWIpWFLWrDoOh5Jzmyllpz+dh+75eiQm?=
 =?iso-8859-1?Q?YlTce/zROQS7Mx2cZCDMVlUeBhDPhOUOcGc8PT1Cps9MoKHeCnbrKjJai0?=
 =?iso-8859-1?Q?gVx1FGE23n5iBzx+Go38vTRkM81cqUJl66gtZCOPWDrkUImqnnlNg4DY75?=
 =?iso-8859-1?Q?V4lQ7NBenfY2mVqOIPjMSg3Xa9xn8iyNzh6bzMBKMg9Kh/To6x6Iz+vZjQ?=
 =?iso-8859-1?Q?Or/yOO9Y8Y+L1kQJ6bo62FA7leQK7eaj9ma2WOxTkX/a/x5t8jiqAQYlNP?=
 =?iso-8859-1?Q?piH6BudtV+wymbtA1CWkVwzhfFwiY/8aLAcJp3f79NszmtJqTHUKtQMw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8360ca3-fa3a-4c98-9bca-08de193dc11e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2025 11:56:55.6269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GP0agEoatQKSqL/ZrA0c3iTIJsZ1vBsgbRzYxmvmLl0L42l1+ig8x5Gu0bfnqGN1GHf/A3QODhgIknMdZbQ/OBXv2DE+WZk7gB2s6bGBqGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7297

Inroducing patch series which includes implementation of the SCI SCMI
SMC multi-agent support.
This patch series follows RFC v5 [3] series which was introducing both
SCMI single-agent and multi-agent support. After the discussion it was
decided to split features and upstream singe-agent support first. This
feature is merged for now to v4.21-rc2.
I'm starting this patch series from v6 to save the discussion history
and don't break changes log.

Patch 0 - xen/domctl: extend XEN_DOMCTL_assign_device to handle not
only iommu
- add chainged handling of assigned DT devices to support
access-controller functionality through SCI framework.
Change was done in two parts:
 - update iommu_do_dt_domctl() to check for dt_device_is_protected()
 and not fail if DT device is not protected by IOMMU
 -add chained call to sci_do_domctl() to do_domctl()

Patch 3 - xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
- added "scmi-secondary-agents" and "#scmi-secondary-agent-cells"
  property to "xen,config" node in "chosen" to inform SCI SCMI
  multi-agent driver about available agents and their
  configuration. It defines <agent_id> to <smc-id,scmi_shm> map.
  This option is Xen specific as Xen is the only one entry in the
  system which need to know about SCMI multi-agent support and configuratio=
n.
- each guest using SCMI should be configured with SCMI agent_id, so SCMI
  FW can implement Agent-specific permission policy.
  -- dom0: dom0_scmi_agent_id=3D<agent_id> in Xen command line option
  -- toolstack: arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D<agent_i=
d>"
  -- dom0less: "xen,sci_type", "xen,sci_agent_id" properties in
"xen,domain" nodes.
- factored out SCMI generic definitions (re-usable)
- factored out SCMI shmem code (re-usable)
- the SCMI passthrough configuration for guest domains is similar to any ot=
her
HW passthrough cfg.

Patch 4 - docs: arm: add SCI SCMI SMC multi-agent driver docs
- add SCI SCMI SMC multi-agent driver documentation.

Add separate SCMI DT node for Xen management agent under "xen,config"
node under chosen.

All Xen-specific configuration provided under "/chosen" node. This
approach allows to isolate modifications to Host DT only under
"/chosen" node.

This approach provides the following device tree (DT)
parameters (placed under xen,config node):

- "scmi-secondary-agents": A Xen-specific parameter under the
  "/chosen" node, which describes the SCMI agent configuration for
  the domains.
- the SCMI configuration for Xen (privileged agent) and the shared
  memory configuration for all agents are provided under the "/chosen"
  node and are used strictly by Xen for its initial configuration.
- the scmi_shm and SCMI configuration for Dom0 are placed in the
  "/firmware/scmi" node so that they can be moved to Dom0 without
  any changes.

This configuration allows the use of Xen-specific nodes to provide
information strictly needed by Xen while using the default SCMI
configuration for Dom0 and other domains. As a result, no additional
bindings need to be introduced to the device tree.
This simplifies the Xen SCMI multi-agent configuration and utilizes
generic device tree bindings for the domains.

Code can be found at:
https://github.com/oleksiimoisieiev/xen/tree/scmi_ma_upstrv6

[1] RFC v2:
http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.ol=
eksii_moisieiev@epam.com/
[2] RFC v3:
https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927=
-1-grygorii_strashko@epam.com
[3] RFC v5:
https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@ep=
am.com/
[4] SCMI single-agent:
https://lore.kernel.org/xen-devel/cover.1756995595.git.oleksii_moisieiev@ep=
am.com/
SCMI spec:
https://developer.arm.com/documentation/den0056/e/?lang=3Den

SCMI bindings:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/access-controllers/access-controllers.ya=
ml

Reference EL3 FW:
RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
Renesas v4h:
https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4=
x-scmi_upd/

base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)

Changes in v6:
- change iommu_do_domctl and sci_do_domctl command order and
call sci_do_domctl first which will produce cleaner code path.
Also dropped changing return code when iommu was disabled in
iommu_do_domctl.
- sorted objs in Makefile alhabetically
- added newline at the end of Makefile
- used uint{N}_t intead of u{N}
- add comment about why 32 bit IO operations were used
- updated cast opertaions to avoid dropping constness which is wrong
- move function definitions to generic place so the could be reused by
other arch
- add SPDX tag to io.c
- updated scmi-shmem to use io.h from generic location
- update scmi_agent_id parameter to be provided inside dom0=3D parameter
list and have the following format "dom0=3Dsci-agent-id=3D0"
This change was done as a response for Stefano comment and
requires a lot of code changes, but produces much cleaner solution
that's why I've added it to the code.
- fix file comments and return codes
- fix lenght checks in shmem_{get,put}_message to use offsetof
- remove len member from scmi_channel structure as it is not used
- set scmi-secondary-agents property to be mandatory since if no
secondary agents were provided then there is no sence to enable scmi
when no secondary agents are populated to the Domains
- update documentation in booting.txt, added xen_scmi node to the
example
- adjust d->arch.sci_enabled value in scmi_domain_destroy
- fix lock management in smc_create_channel call
- avoid extra map_channel_memory command for Xen management channel
because collect_agent_id call unmaps memory if DOMID_XEN is not
set. So for Xen management channel we can init domain_id ad DOMID_XEN
before calling collect_agent_id so memory shouldn't be unmapped.
- remove all HVC mentions from the multi-agent doc
- update sci-agent-id parameter description in the documentation
- add missing Sign-of
- minor fixes across the document

Changes in v5:
- return -EINVAL if mediator without assign_dt_device was provided
- invert return code check for iommu_do_domctl in
XEN_DOMCTL_assign_device domctl processing to make cleaner code
- change -ENOTSUPP error code to -ENXIO in sci_do_domctl
- handle -ENXIO return comde of iommu_do_domctl
- leave !dt_device_is_protected check in iommu_do_dt_domctl to make
code work the same way it's done in "handle_device" call while
creating hwdom(dom0) and "handle_passthrough_prop" call for dom0less
creation
- drop return check from sci_assign_dt_device call as not needed
- do not return EINVAL when addign_dt_device is not set. That is
because this callback is optional and not implemented in single-agent drive=
r
- move memcpy_toio/fromio to the generic place
- fix device-tree example format in booting.txt, added ";" after "}".
- update define in scmi-proto.h
- update define in scmi-shmem.h file
- scmi_assign_device - do not ignore -EOPNOTSUPP return
code of the do_smc_xfer
- remove overwriting agent_channel->agent_id after
SCMI_BASE_DISCOVER_AGENT call
- add multi-agent files to the MAINTAINERS
- add SCMI multi-agent description to the SUPPORT.md
- handle ARM_SMCCC_INVALID_PARAMETER return code and return -EINVAL
for smc call
- updated collect_agents function. Set agent_id parameter as optional
in scmi-secondary-agents device-tree property
- introduce "#scmi-secondary-agents-cells" parameter to set if
agent_id was provided
- reanme xen,scmi-secondary-agents property to scmi-secondary-agents
- move memcpu_toio/fromio for the generic place
- update Xen to get management channel from /chosen/xen,config node
- get hypervisor channnel from node instead of using hardcoded
- update handling scmi and shmem nodes for the domain
- Set multi-agent driver to support only Arm64
- rework multi-agent driver to leave Host Device-tree unmodified

Changes in v4:
- toolstack comments from Anthony PERARD
- added dom0less support
- added doc for "xen,scmi-secondary-agents"

Grygorii Strashko (2):
  xen/domctl: extend XEN_DOMCTL_assign_device to handle not only iommu
  docs: arm: add SCI SCMI SMC multi-agent driver docs

Oleksii Moisieiev (3):
  xen: arm: smccc: add INVALID_PARAMETER error code
  lib/arm: Add I/O memory copy helpers
  xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver

 MAINTAINERS                                   |   4 +
 SUPPORT.md                                    |  11 +
 .../arm/firmware/arm-scmi.rst                 | 341 ++++++++
 docs/man/xl.cfg.5.pod.in                      |  13 +
 docs/misc/arm/device-tree/booting.txt         | 103 +++
 docs/misc/xen-command-line.pandoc             |  19 +-
 tools/libs/light/libxl_arm.c                  |   4 +
 tools/libs/light/libxl_types.idl              |   4 +-
 tools/xl/xl_parse.c                           |  12 +
 xen/arch/arm/dom0less-build.c                 |  11 +
 xen/arch/arm/domain_build.c                   |  26 +-
 xen/arch/arm/firmware/Kconfig                 |  12 +
 xen/arch/arm/firmware/Makefile                |   1 +
 xen/arch/arm/firmware/sci.c                   |  35 +
 xen/arch/arm/firmware/scmi-proto.h            | 164 ++++
 xen/arch/arm/firmware/scmi-shmem.c            | 115 +++
 xen/arch/arm/firmware/scmi-shmem.h            |  45 +
 xen/arch/arm/firmware/scmi-smc-multiagent.c   | 794 ++++++++++++++++++
 xen/arch/arm/include/asm/firmware/sci.h       |  14 +
 xen/arch/arm/include/asm/smccc.h              |   1 +
 xen/common/domctl.c                           |  26 +
 xen/drivers/passthrough/device_tree.c         |   6 +
 xen/include/public/arch-arm.h                 |   3 +
 xen/include/xen/lib/io.h                      |  83 ++
 xen/lib/Makefile                              |   1 +
 xen/lib/arm/Makefile                          |   1 +
 xen/lib/arm/io.c                              | 102 +++
 27 files changed, 1948 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/firmware/scmi-proto.h
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
 create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
 create mode 100644 xen/include/xen/lib/io.h
 create mode 100644 xen/lib/arm/Makefile
 create mode 100644 xen/lib/arm/io.c

--=20
2.34.1

