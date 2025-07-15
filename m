Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B55B0581B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 12:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043987.1414046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubd9u-0005jA-H8; Tue, 15 Jul 2025 10:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043987.1414046; Tue, 15 Jul 2025 10:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubd9u-0005g8-Dd; Tue, 15 Jul 2025 10:45:14 +0000
Received: by outflank-mailman (input) for mailman id 1043987;
 Tue, 15 Jul 2025 10:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXV7=Z4=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ubd9s-0005g2-4D
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 10:45:12 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c77af9a7-6168-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 12:45:10 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PAXPR03MB7746.eurprd03.prod.outlook.com (2603:10a6:102:208::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 10:45:07 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Tue, 15 Jul 2025
 10:45:07 +0000
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
X-Inumbo-ID: c77af9a7-6168-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiG0Omcgt3dCaMvk4Ozf4DJQpoH5kpnqLW5Mtcg1ZxhPTz1WUzcLYZfIrR1JOudnqh8AXNZh5/hTp86ZK/lqy8v4pNlYuQ04qxDmfODcOqmPSgYvg7j58nHsdKdjwWMK/1BG7Z3LKaEFop73t0FgaIuziKA5khhBEYUG/fIkB8Gu4MSaFaWUFpkqPRXkIW8KQWYzXi/gG6wpw+bdQb7jK6n+WIPRCFwEpdwr3ZvnqQBX+u4E3NseUKvrH2HWWwLHew7mC5iB0nmq2Y/aPB3E8dU/FPgpmvK1KARLPPmTq7IqrASlIELJJEZWCt09XVz8nPj5kBY6T9Gn5Z6ImgVXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOSg7/mUicxHHUXuBoM/4ygU6P5DTwrItqE4AbWQddI=;
 b=TeuT/LtJ8ruynE7LgQ4Y1SB7Y7hCJo2VoAI43iadRIFrwZrgezOSd+CybIG9Boskv4el7q0Cdlz9HJSWQKaXONGdlqUaPxA9WHD08cq05mrpu2UbyfFH+6CFwLrm5iy6MjQqFF1giabWHWw53J0viZtTNAyS898GlYQ2Mlt32lRDaWtutGBAd+9jqBwYQXO09U9zoWJp6bWlJ/lYkRYSkMeYYEQ/DZuNLXxkbC24+3spzQhWfh163RhKhDFReHW2LhIQRQdogaXHCcxblMRP9xGvc3ryXlSkGParJqSnm25W7MMtz6GpSfiXH1NdIQeQuEuecHrwVca+nzBgWArM4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOSg7/mUicxHHUXuBoM/4ygU6P5DTwrItqE4AbWQddI=;
 b=novVNr/L83YkDxfv40rmin1ni3jrSp28cI4Od5hApuRDvhF1G3WnyMq34cRglRs/JpAIhRA8+kal731pXTt3DC965pkBraee6a0WRQ06iPqMnEd08olpO2B37IBaYm68Kkb1rfovAeYi6vV1f7LeOBgyqfUU3yhl4TmlNRgTBMCX9yY8sv1Exot3UZq7RvhW+fI4WsVSEmfHJwcGlTsDPaaaKKGKroXi+iOVcHJEDO1IBgeQW4IJ3NkGRO7VAlERSQOGJ3hJNTJIAMyuMPzihduEzdYtA4HP6LvD590zx+liRDhqVSF1pMopRaATMwPEuGHbaubbXtZqCWDl6FtHAQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Index:
 AQHb8RnNNQ6jd6+ExkWCWY/+NTwtQ7QsmXCAgAEYpgCAA5T3AIABsXIAgAAERYCAAAGLAIAACNYAgAABtQA=
Date: Tue, 15 Jul 2025 10:45:07 +0000
Message-ID: <791b65fe-7691-4872-8b7f-34b4a16b6648@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
 <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
 <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
 <bd89ecfe-83b3-471b-8455-83b9974bdaf2@suse.com>
 <d8e714ad-e1a9-4d9d-9a2b-8eb796f21e04@epam.com>
 <a8fe1fc0-8dba-4a58-ba1f-0851dcc21e9d@suse.com>
 <ef86b7e7-1d3b-46fe-9d75-f55077c9f32a@epam.com>
 <5b7f2a0f-9840-400a-8a01-e43e1ee20056@suse.com>
In-Reply-To: <5b7f2a0f-9840-400a-8a01-e43e1ee20056@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PAXPR03MB7746:EE_
x-ms-office365-filtering-correlation-id: 245934ba-497c-49e6-5975-08ddc38caa18
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eUl2TG8xS2ZtbVh2bmhuVjVMaVJKVzN4cTZ6V0hHUkZIWUY0WndnbVdRdjcy?=
 =?utf-8?B?R0RjSWlldEhLNTBzUWJGTlhWdDhTcGpjVVl1QzgrQ2ZCbGsvbnlESEk5enI0?=
 =?utf-8?B?Uk9HNC9rVDcvUVZUQmhuMHQ3cGdxc2ZGWm5OMUxKNndXaER6ZVBiSW9QWFhD?=
 =?utf-8?B?UzJmQ3FCSnZsSUM0WnpwYXdwMGd4cE5KZHBaRFVpMFkwNk1GQXA5NldabG9j?=
 =?utf-8?B?RkdXSEhacXBtYVVoNTM5YklVbE1mNWJrN3NHb0lYWlE3c0lRby9Da2FHUUZl?=
 =?utf-8?B?Q1JOQUZOM3VCSWVVa0NaZ3F0WHV0UHVvY1dlWWh6aWQ4QkoraEZNN3FZTmJD?=
 =?utf-8?B?ZitmZE9KNG9VZkU1N1hhc0FDRkE2MllGcWFWOEE1SWVwcGk5WS9NR0xESTRD?=
 =?utf-8?B?eVBTSnBmWEFtTktkTUI5T3pZVFlPYVB4QnlZbzRiNVVDWmpSSnZWL2lFZVlN?=
 =?utf-8?B?TVZ6YUJLOTZySm9jM0VabHVBUWJRa1FNVDY2NGU1NDRqODJFbWRhMXJnTHBQ?=
 =?utf-8?B?WURzN1NwNjhZMzRUSEFSSWc2b2lBcSsrZ2c1bFpMSldPSkxFSDIzUjhyb0hV?=
 =?utf-8?B?MHJqd1RmZk1BUEFTMGdNVUg5bXc3eTNISUllV0xDSkdBaFFNQ2s4MGg4eU8x?=
 =?utf-8?B?NHgyRFV3dng3eHRQdDJSdW91RjBHaU9tYkpWUHVxbnNBc2R5bU41ZTJIMW5t?=
 =?utf-8?B?ZVRYZy9mY0RSSzB4WGt6b2pVVFpjeWFEQ29zMG5BeHR3Mm5mZUF5TGFQNnNQ?=
 =?utf-8?B?YVpxSksxYWZjVU13aElyOWQ5SW94Ym82NkVRb0Z2LzdjQ2xkcitEbU50QitN?=
 =?utf-8?B?emRKZXFmbmV2MlVsRlUzVG1ENStXWElielFuN0xaKzFRWkY5SFNnaWlYdUlY?=
 =?utf-8?B?NFFrNDl5TjA5eVo1K1ZwRE56a0toMkZhTW03cWorTERaQ2xYQmhqenNmWmFw?=
 =?utf-8?B?S2ZrdUlhNTNpT25FSy9zcW1namJsRVdhYWdKc3dydnozMkZmWUdIem5Eczdw?=
 =?utf-8?B?NVlNdkRZMVBvSHptdk1wZUxBTGdPSDYwaVRFOGd1OEFRWGpKdHV0dUg3VXIx?=
 =?utf-8?B?aXNOclM2YzlMbUs0SGNBUkgyU3BVYit4V3VZL1A5ajV3T3RYVkVXTWs2cHdV?=
 =?utf-8?B?bFNhVDUvMmErejJ2eGh4dUtaaVdYeC9ONFZQNDI4bzR6M1B1SUxNcldaYTVU?=
 =?utf-8?B?THZ0bDV3anpad0hDWEJsNTQwTDl3ZE9iaVZuUkh5MzRlQlJWNUpZWVY0VVY1?=
 =?utf-8?B?R0dsbzgxWGt4aW9hV0kvZy9xdUo2VnpjOGFTM1ZDRS9RQys5dkdpRHFSVTBj?=
 =?utf-8?B?OHdVc3hUcktESm9hMmhVY2pKTHRWZEhFMmRZTDdoUk1yY2VwMTlVQ0JYeVJv?=
 =?utf-8?B?dk42SmlmcDJab2UyZFQraXM1dXlGa0d0YzJyRFZnOXU2ZlBITkVid25SekpY?=
 =?utf-8?B?MkdTUURKRklsM3hIb0tFcGhVVFFJZ2hFVm8rUElhaUtiTndPNDhQeUhXbmxK?=
 =?utf-8?B?cmRRZUU2S2lOUk1NUHRDZlZQMVpER2RFTGViWldzOWw1bG11REhHU2lyNEQ2?=
 =?utf-8?B?OUpNckVVRWpxVnlNb1BSNUNVRnFlcHJXV0c1Um16NUxOTFJBa0VwamkybCsr?=
 =?utf-8?B?U3F2bjhhVFZWUWxUcm03OW1VS2VqRTBsOG5YbDgzb3BCa1VqT0pRa1dYRitU?=
 =?utf-8?B?bDhpUWRjUDVRdHM3anZQcWNtVTFCZ1VhZjRXOElYTm5sMFprdkZpdURWRExp?=
 =?utf-8?B?M0VHN0lhUFFRWWo3K2h3Y1VDaUpZeFdKUmFkc1ZHSUIxUUQzYzJQbE9MQ3Ra?=
 =?utf-8?B?SCt5QTdILzZSSXllejN1Y2dqclJINXF6WUhJd0dNK1MwUDNuUEV1QWwvUU5j?=
 =?utf-8?B?Y2h2NmZKRmFOUkgwY0hGTGx0aXNjbU1CaDhrb3ZSQzVvRDZwTlYrRS9WKzRV?=
 =?utf-8?B?NjBoSW16M2R3UUZNOHpaODVlU0NqeHZUdlNqWmxvUFA2MXZZRnlKdU1hamFp?=
 =?utf-8?B?R3cxb3Z3SGh3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGpiVVhpblExWTduSW9lTjhhUGtHTTREZU1OUlNVcjhxMG10WFdmQ0o1a0gx?=
 =?utf-8?B?cGJIaUM4MkZ0VFdoZHpUMzl1RTFRUDRtWXljQ3BnS0E5VzdQZUtralU1VDhH?=
 =?utf-8?B?WlptLzgxbWdacVFXRjV3dU9NbThiSGNsbGdRWjh6S0g2M2pNNXQ4WUNHd2tV?=
 =?utf-8?B?RGhBaDAwVUZBSVdFVXNDL1kyTnU1S0l1MDVvT0NSVGJvRVlEU3I2U0hxZDh6?=
 =?utf-8?B?amJqVjE3UkJsbW5VYkxySnQvMTVrYVF2b3F3ZzhjY3VBQ0NXK05tSDZXUEd6?=
 =?utf-8?B?TnRDeHF3cG54UmhQcXIrKzRiaEJSbFAzVGF4dVZtU0czN09hbUZJbU5IQlM0?=
 =?utf-8?B?RDZjYnJFU0dGVnZQdGRRTkxBVWNtckRRQ0tyVG1Ud3JWcXZyQis1ZDJVR2VX?=
 =?utf-8?B?WEtmcC94RlVvZFJwcDRhRW82eHR0MmxqVFltS253U2srWWhXNGkzR3pRazJz?=
 =?utf-8?B?TjZHcGxVaWRzcmZTM28zQVdML2xybXRoMWV0ajJLaXVJWHJDQUUrL2tvYi90?=
 =?utf-8?B?cjl2Y1NpNFRra0VYcU96NnVSb1JUbExVTU1ubEdxVHBUZURuVTdvM1krV1F2?=
 =?utf-8?B?N3JEUi9mck1YY3dmblFKd1pPM3FqSkxmNTJESE9OeStZUC9nSHBSc2xnaFN3?=
 =?utf-8?B?QUFvNmhPMkY4bUJVUkV3UnJUcmQ0MlRSVDcvQTI1Z3pNUFBSMWVHN005Q1Zu?=
 =?utf-8?B?YlVQUW5yaFNWZmRveXJCQXpjblU3eGVoRmxkVEQwdmc3Nm16YTRwOGRLL3hk?=
 =?utf-8?B?OEZxUjBXTlNSWHg0MlA1QkY4cGVsR2N6SFIzNzlPR0trK1dWQjE3U0E2TXNU?=
 =?utf-8?B?MnA4Vjlic1F5bFpBV1plSGxLMUZacnlVd1FkclBSR2ZJSUZFRGxmekYwQzJl?=
 =?utf-8?B?Zm13MEhHTml3RXZ3Q3ZtSUdhRzdtcVhHVDMzenVjb0JnY3dxaVg5RG5UVmwz?=
 =?utf-8?B?a3FRbDNwU3F1VnZ3ak40bjA4ZENuTXhqY2ZOb2JFY3dtdmViSTgvUU5yU0JS?=
 =?utf-8?B?UHdPY3ZMLzNxVTBUcVE5QkVHUUU3cjNvTG9vSy9oeVRyZ1Rpdms3K2p0L3k3?=
 =?utf-8?B?b3RlbS93REl1Q1l2SGtpb1RodjNpalRYeW1tYUtYTXI3WVdhU2dGZi9tbTl5?=
 =?utf-8?B?RXBTUEw2bnBxNllWZnlNc2JmTHJWUkR3UnFlcVd5QjhiWURnK3FNYjJVeTFu?=
 =?utf-8?B?Z29BV0U3ZUJWS1EyZUJSL1JyOHJFZklaaHMxUVNLTFNtMk8yUzIvTjBKNC85?=
 =?utf-8?B?NEZnT3lxU0NEZzhWeHk2T2NBcXNXV1JyWEVmOEtOR1Uzdmh0SVRSZ0RsMGt3?=
 =?utf-8?B?aUttTEZ1NEIxbzAzejNobVhlL25JVkp5Vmh3WE5haWxiZnNoMi9SSVlFWkdX?=
 =?utf-8?B?UXVTVisxdUlIMEhGYlQxT0FMdVN4d0RZWHFIdzFDcHZhdUVVWklDSHczVzVj?=
 =?utf-8?B?T2lNU05pdGtLRzdLRzZYa3FGOThPNUFUMENLT05hT1gzTkxsbDBnMWlpU25p?=
 =?utf-8?B?S3FjdE5XTWRGYTNjaDJvSU85YUYyWmc4SDN5bHNDSUMwU0U2Z3owUnQwaVZY?=
 =?utf-8?B?VTJZT3h4N1Nud2JYcVJRRXh4bkxCekR6RG5uN0FVdlMrck13bEFZYUtTQm5t?=
 =?utf-8?B?T2xBeGZKeTRENkVhczVnSm91VCtXUUlBVW93cWdxblZtZ282N3pNdFZyeUYw?=
 =?utf-8?B?SjN6Z3hIVDdBd1pncHdpVStnYUZ3d3M3VDBMS3Y4RjRFR24ycnJoNVRzZjc1?=
 =?utf-8?B?UlBSWU9oYitQMlJJWXlkWGVUOE9TOFJ3Z1hxbHBySGJTYzdoRmxvQlh6UjMv?=
 =?utf-8?B?Y25yQ1huVEdPTzh6WmxEajUxTTV6Tk5XTUI0L1Bocjl1dnhQVVBGQlY3amZx?=
 =?utf-8?B?L0g5cGtzOUpLWDBCZnNWT0MyUHRLbGFRZkdybGhjMVFvamhTajVSek9sZm02?=
 =?utf-8?B?V1JSbE9CcjV1Sk5EQ1huWmlLWlBBMjB4ZEduSUg4NDNwamM5TkhyTzErN0xu?=
 =?utf-8?B?MEtrZkJ0dXVTQlp5enRCZ1ZtSjV1a21XOFMyYmZzRDJTM3NGWUdueGVuQ3NZ?=
 =?utf-8?B?N3dMbUtValNtVHZsMmh4RFRxUkQ5aHYxaHNCdk1IK1pxYzZqbUt0NUxncWF3?=
 =?utf-8?B?Q3JvZUVGQ1NmSEkvY3RTd045MlZlSE0zL0luODNXdVY5TExRRFR0Z2ZjS0pH?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4A8DF3AD2AB8E468EB17C7BEBE20EE6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245934ba-497c-49e6-5975-08ddc38caa18
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 10:45:07.2815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZqoUzYLUuqVt/5wBCeFIrF7AJsbRTrNiYpxkIdp5HFduCxIXc8ueKqCMEjy1ftJDmxQ3GPxbBthezOAl980ArnlAhlkMmL4RNb6ALw5wEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7746

DQoNCk9uIDcvMTUvMjUgMTM6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wNy4yMDI1
IDEyOjA3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBBUk0gb25seSBhcmU6DQo+PiAt
Y29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsDQo+PiAiYW55X2FyZWEoYWxs
X2xvYyhmaWxlKF54ZW4vaW5jbHVkZS94ZW4vYml0b3BzXFwuaCQpKSkifQ0KPj4gLWNvbmZpZz1N
QzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLA0KPj4gImFsbF9hcmVhKGRlY2wobmFtZShw
YXJzZV9nbnR0YWJfbGltaXQpKXx8bWFjcm8obmFtZShwYXJzZV9nbnR0YWJfbGltaXQpKSkifQ0K
Pj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLA0KPj4gImFsbF9hcmVh
KGRlY2wobmFtZSh1cGRhdGVfZ250dGFiX3BhcikpfHxtYWNybyhuYW1lKHVwZGF0ZV9nbnR0YWJf
cGFyKSkpIn0NCj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwNCj4+
ICJhbGxfYXJlYShkZWNsKG5hbWUocGlycV9jbGVhbnVwX2NoZWNrKSl8fG1hY3JvKG5hbWUocGly
cV9jbGVhbnVwX2NoZWNrKSkpIn0NCj4gDQo+IEhtbSwgSSdkIGNhbGwgdGhlc2UgImNvbW1vbiBj
b2RlIiBvbmVzLCBidXQgSSBndWVzcyB5b3UgbWVhbnQgImFueXRoaW5nIHRoYXQNCj4gd291bGQg
bWFrZSBBcm0gY2xlYW4iLg0KPiANCj4gQXMgYW4gYXNpZGUgLSBwbGVhc2UgZG9uJ3QgdG9wLXBv
c3QuDQo+IA0KPiBKYW4NCj4gDQpZZXMsIHlvdSBhcmUgcmlnaHQuIEkgbWVhbnQgIm1ha2UgQVJN
IGNsZWFuIi4NClNvcnJ5IGZvciBpbmNvbnZlbmllbmNlLg0KDQpEbXl0cm8uDQoNCj4+IE9uIDcv
MTUvMjUgMTM6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE1LjA3LjIwMjUgMTE6NDYs
IERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+Pj4gQ291bGQgd2UgcHJvY2VlZCB3aXRoIEFS
TSBkZXZpYXRpb25zIG9ubHkgc28gZmFyPw0KPj4+PiBJIHVuZGVyc3RhbmQgU3RlZmFubydzIHBy
ZWZlcmVuY2VzLCBidXQgaXQgY2FuIHVuYmxvY2sgbWUgdG8gYWRkcmVzcw0KPj4+PiBuZXh0IEFS
TSB2aW9sYXRpb25zLg0KPj4+DQo+Pj4gSG1tLCAuLi4NCj4+Pg0KPj4+PiBPbiA3LzE0LzI1IDEw
OjU1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDEyLjA3LjIwMjUgMDM6MTMsIFN0ZWZh
bm8gU3RhYmVsbGluaSB3cm90ZToNCj4+Pj4+PiBPbiBGcmksIDExIEp1bCAyMDI1LCBOaWNvbGEg
VmV0cmluaSB3cm90ZToNCj4+Pj4+Pj4gT24gMjAyNS0wNy0wOSAyMzozOCwgRG15dHJvIFByb2tv
cGNodWsxIHdyb3RlOg0KPj4+Pj4+Pj4gTUlTUkEgQyBSdWxlIDUuNSBzdGF0ZXMgdGhhdDogIklk
ZW50aWZpZXJzIHNoYWxsDQo+Pj4+Pj4+PiBiZSBkaXN0aW5jdCBmcm9tIG1hY3JvIG5hbWVzIi4N
Cj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBVcGRhdGUgRUNMQUlSIGNvbmZpZ3VyYXRpb24gdG8gZGV2aWF0
ZToNCj4+Pj4+Pj4+IC0gY2xhc2hlcyBpbiAneGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oJzsNCj4+
Pj4+Pj4+IC0gY2xhc2hlcyBpbiAneGVuL2luY2x1ZGUveGVuL2lycS5oJzsNCj4+Pj4+Pj4+IC0g
Y2xhc2hlcyBpbiAneGVuL2NvbW1vbi9ncmFudF90YWJsZS5jJy4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVw
YW0uY29tPg0KPj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+PiAgICAgYXV0b21hdGlvbi9lY2xhaXJfYW5h
bHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsIHwgOCArKysrKysrKw0KPj4+Pj4+Pj4gICAgIGRv
Y3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QgICAgICAgICAgICAgICAgICAgICAgICB8IDggKysrKysr
KysNCj4+Pj4+Pj4+ICAgICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4+Pj4+
Pj4+DQo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNM
QUlSL2RldmlhdGlvbnMuZWNsDQo+Pj4+Pj4+PiBiL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lz
L0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPj4+Pj4+Pj4gaW5kZXggZThmNTEzZmJjNS4uYTVkN2Iw
MDA5NCAxMDA2NDQNCj4+Pj4+Pj4+IC0tLSBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VD
TEFJUi9kZXZpYXRpb25zLmVjbA0KPj4+Pj4+Pj4gKysrIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5h
bHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsDQo+Pj4+Pj4+PiBAQCAtMTE3LDYgKzExNywxNCBA
QCBpdCBkZWZpbmVzIHdvdWxkIChpbiB0aGUgY29tbW9uIGNhc2UpIGJlIGFscmVhZHkNCj4+Pj4+
Pj4+IGRlZmluZWQuIFBlZXIgcmV2aWV3ZWQgYnkgdGhlIGMNCj4+Pj4+Pj4+ICAgICAtY29uZmln
PU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsDQo+Pj4+Pj4+PiAiYW55X2FyZWEoZGVj
bChraW5kKGZ1bmN0aW9uKSl8fGFueV9sb2MobWFjcm8obmFtZShtZW1jcHl8fG1lbXNldHx8bWVt
bW92ZSkpKSkmJmFueV9hcmVhKGFueV9sb2MoZmlsZSheeGVuL2NvbW1vbi9saWJlbGYvbGliZWxm
LXByaXZhdGVcXC5oJCkpKSJ9DQo+Pj4+Pj4+PiAgICAgLWRvY19lbmQNCj4+Pj4+Pj4+DQo+Pj4+
Pj4+PiArLWRvY19iZWdpbj0iQ2xhc2hlcyBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWVzIGFuZCBtYWNy
b3MgYXJlIGRlbGliZXJhdGUgZm9yDQo+Pj4+Pj4+PiBiaXRvcHMgZnVuY3Rpb25zLCBwaXJxX2Ns
ZWFudXBfY2hlY2ssIHVwZGF0ZV9nbnR0YWJfcGFyIGFuZA0KPj4+Pj4+Pj4gcGFyc2VfZ250dGFi
X2xpbWl0IGZ1bmN0aW9ucw0KPj4+Pj4+Pj4gK2FuZCBuZWVkZWQgdG8gaGF2ZSBhIGZ1bmN0aW9u
LWxpa2UgbWFjcm8gdGhhdCBhY3RzIGFzIGEgd3JhcHBlciBmb3IgdGhlDQo+Pj4+Pj4+PiBmdW5j
dGlvbiB0byBiZSBjYWxsZWQuIEJlZm9yZSBjYWxsaW5nIHRoZSBmdW5jdGlvbiwNCj4+Pj4+Pj4+
ICt0aGUgbWFjcm8gYWRkcyBhZGRpdGlvbmFsIGNoZWNrcyBvciBhZGp1c3RzIHRoZSBudW1iZXIg
b2YgcGFyYW1ldGVycw0KPj4+Pj4+Pj4gZGVwZW5kaW5nIG9uIHRoZSBjb25maWd1cmF0aW9uLiIN
Cj4+Pj4+Pj4+ICstY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsDQo+Pj4+
Pj4+PiAiYW55X2FyZWEoYWxsX2xvYyhmaWxlKF54ZW4vaW5jbHVkZS94ZW4vYml0b3BzXFwuaCQp
KSkifQ0KPj4+Pj4+Pg0KPj4+Pj4+PiBCaXRvcHMgdmlvbGF0aW9ucyBhcmUgbm90IGluc2lkZSAi
eGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oIiwgYnV0IHJhdGhlcg0KPj4+Pj4+PiAieGVuL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2JpdG9wcy5oIg0KPj4+Pj4+Pg0KPj4+Pj4+Pj4gKy1jb25maWc9TUMz
QTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwNCj4+Pj4+Pj4+ICJhbnlfYXJlYShhbGxfbG9j
KGZpbGUoXnhlbi9pbmNsdWRlL3hlbi9pcnFcXC5oJCkpJiZjb250ZXh0KG5hbWUocGlycV9jbGVh
bnVwX2NoZWNrKSYma2luZChmdW5jdGlvbikpKSJ9DQo+Pj4+Pj4+DQo+Pj4+Pj4+IEkgd291bGQg
cmF0aGVyIGRvICh1bnRlc3RlZCkNCj4+Pj4+Pj4NCj4+Pj4+Pj4gLWNvbmZpZz1NQzNBMi5SNS41
LHJlcG9ydHMrPXtkZWxpYmVyYXRlLA0KPj4+Pj4+PiAiYWxsX2FyZWEoZGVjbChuYW1lKHBpcnFf
Y2xlYW51cF9jaGVjaykpfHxtYWNybyhuYW1lKHBpcnFfY2xlYW51cF9jaGVjaykpKSJ9DQo+Pj4+
Pj4+DQo+Pj4+Pj4+PiArLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLA0K
Pj4+Pj4+Pj4gImFueV9hcmVhKGFsbF9sb2MoZmlsZSheeGVuL2NvbW1vbi9ncmFudF90YWJsZVxc
LmMkKSkmJmNvbnRleHQobmFtZSh1cGRhdGVfZ250dGFiX3Bhcnx8cGFyc2VfZ250dGFiX2xpbWl0
KSYma2luZChmdW5jdGlvbikpKSJ9DQo+Pj4+Pj4+PiArLWRvY19lbmQNCj4+Pj4+Pj4+ICsNCj4+
Pj4+Pj4NCj4+Pj4+Pj4gc2FtZSBhcyBhYm92ZQ0KPj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gVGhh
bmtzIE5pY29sYSEgVGhlIGZvbGxvd2luZyBkZXZpYXRpb25zIGFyZSBlbm91Z2ggYW5kIHN1ZmZp
Y2llbnQgdG8NCj4+Pj4+PiB6ZXJvIHZpb2xhdGlvbnMgb24gYm90aCBBUk0gYW5kIHg4NjoNCj4+
Pj4+Pg0KPj4+Pj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFu
eV9hcmVhKGFsbF9sb2MoZmlsZSheeGVuL2luY2x1ZGUveGVuL2JpdG9wc1xcLmgkKSkpIn0NCj4+
Pj4+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbnlfYXJlYShh
bGxfbG9jKGZpbGUoXnhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9iaXRvcHNcXC5oJCkpKSJ9DQo+
Pj4+Pj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYW55X2FyZWEo
YWxsX2xvYyhmaWxlKF4uKi9jb21wYXRcXC5jJCkpKSJ9DQo+Pj4+Pj4gLWNvbmZpZz1NQzNBMi5S
NS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYW55X2FyZWEoYWxsX2xvYyhmaWxlKF4uKi9jb21w
YXQvLiokKSkpIn0NCj4+Pj4+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJh
dGUsICJhbnlfYXJlYShhbGxfbG9jKGZpbGUoXnhlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS8uKiQp
KSkifQ0KPj4+Pj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFu
eV9hcmVhKGFsbF9sb2MoZmlsZSheeGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2dlbmFwaWNcXC5o
JCkpKSJ9DQo+Pj4+Pj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAi
YWxsX2FyZWEoZGVjbChuYW1lKHBhcnNlX2dudHRhYl9saW1pdCkpfHxtYWNybyhuYW1lKHBhcnNl
X2dudHRhYl9saW1pdCkpKSJ9DQo+Pj4+Pj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtk
ZWxpYmVyYXRlLCAiYWxsX2FyZWEoZGVjbChuYW1lKHVwZGF0ZV9nbnR0YWJfcGFyKSl8fG1hY3Jv
KG5hbWUodXBkYXRlX2dudHRhYl9wYXIpKSkifQ0KPj4+Pj4+IC1jb25maWc9TUMzQTIuUjUuNSxy
ZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFsbF9hcmVhKGRlY2wobmFtZShwaXJxX2NsZWFudXBfY2hl
Y2spKXx8bWFjcm8obmFtZShwaXJxX2NsZWFudXBfY2hlY2spKSkifQ0KPj4+Pj4+IC1jb25maWc9
TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFsbF9hcmVhKGRlY2wobmFtZSh2aXJ0
X3RvX21hZGRyKSl8fG1hY3JvKG5hbWUodmlydF90b19tYWRkcikpKSJ9DQo+Pj4+Pj4gLWNvbmZp
Zz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYWxsX2FyZWEoZGVjbChuYW1lKHNl
dF9weF9wbWluZm8pKXx8bWFjcm8obmFtZShzZXRfcHhfcG1pbmZvKSkpIn0NCj4+Pj4+PiAtY29u
ZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbGxfYXJlYShkZWNsKG5hbWUo
c2V0X2N4X3BtaW5mbykpfHxtYWNybyhuYW1lKHNldF9jeF9wbWluZm8pKSkifQ0KPj4+Pj4+IC1j
b25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFsbF9hcmVhKGRlY2wobmFt
ZShjcHVfaGFzX2FtZF9lcnJhdHVtKSl8fG1hY3JvKG5hbWUoY3B1X2hhc19hbWRfZXJyYXR1bSkp
KSJ9DQo+Pj4+Pj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYWxs
X2FyZWEoZGVjbChuYW1lKGNvcHlfdG9fZ3Vlc3RfbGwpKXx8bWFjcm8obmFtZShjb3B5X3RvX2d1
ZXN0X2xsKSkpIn0NCj4+Pj4+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJh
dGUsICJhbGxfYXJlYShkZWNsKG5hbWUoY29weV9mcm9tX2d1ZXN0X2xsKSl8fG1hY3JvKG5hbWUo
Y29weV9mcm9tX2d1ZXN0X2xsKSkpIn0NCj4+Pj4+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0
cys9e2RlbGliZXJhdGUsICJhbGxfYXJlYShkZWNsKG5hbWUoZWRkX3B1dF9zdHJpbmcpKXx8bWFj
cm8obmFtZShlZGRfcHV0X3N0cmluZykpKSJ9DQo+Pj4+Pj4gLWNvbmZpZz1NQzNBMi5SNS41LHJl
cG9ydHMrPXtkZWxpYmVyYXRlLCAiYWxsX2FyZWEoZGVjbChuYW1lKGNwdV9oYXNfYW1kX2VycmF0
dW0pKXx8bWFjcm8obmFtZShjcHVfaGFzX2FtZF9lcnJhdHVtKSkpIn0NCj4+Pj4+PiAtY29uZmln
PU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbGxfYXJlYShkZWNsKG5hbWUocGFn
ZV9saXN0X2VudHJ5KSl8fG1hY3JvKG5hbWUocGFnZV9saXN0X2VudHJ5KSkpIn0NCj4+Pj4+PiAt
Y29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbGxfYXJlYShkZWNsKG5h
bWUoZG9fcGh5c2Rldl9vcCkpfHxtYWNybyhuYW1lKGRvX3BoeXNkZXZfb3ApKSkifQ0KPj4+Pj4+
IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFsbF9hcmVhKGRlY2wo
bmFtZShkb19wbGF0Zm9ybV9vcCkpfHxtYWNybyhuYW1lKGRvX3BsYXRmb3JtX29wKSkpIn0NCj4+
Pg0KPj4+IC4uLiBpbiBoZXJlLCB3aGljaCBvZiB0aGVtIGFyZSBBcm0tb25seT8NCj4+Pg0KPj4+
IEphbg0KPiANCg==

