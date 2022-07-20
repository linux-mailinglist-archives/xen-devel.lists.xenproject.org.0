Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C8257B79D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 15:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371801.603672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9vD-0001Wl-HM; Wed, 20 Jul 2022 13:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371801.603672; Wed, 20 Jul 2022 13:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9vD-0001UE-EM; Wed, 20 Jul 2022 13:39:27 +0000
Received: by outflank-mailman (input) for mailman id 371801;
 Wed, 20 Jul 2022 13:39:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6Hj=XZ=citrix.com=prvs=193cc1dc0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oE9vC-0001U4-CA
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 13:39:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d0d1558-0831-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 15:39:24 +0200 (CEST)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2022 09:39:21 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 13:39:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 13:39:19 +0000
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
X-Inumbo-ID: 5d0d1558-0831-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658324364;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=K8pypOpu9hgaR5vnUwx2r0HrjGvMH+W17ooc+AAQInY=;
  b=cRCaIeR1nxZmgI3G7e0Bq425KJ0a8Lo03i7T7DIE1HC5uHt3xcaS7qdK
   m2FngKpHVYnW968azHBqGgIx6TyRuyo7uEWhGe54QDfwmvpwiD8VtUPJD
   UgWmHs05NGsIXJC0B0ICz8t3L/ZaiF4KHlFd7MBKeNbrx4k3f+ViTSwBu
   s=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 76658566
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gG6Ng63iQHWqScn6ZvbD5RZwkn2cJEfYwER7XKvMYLTBsI5bpzQCy
 mNKCmGHOPuCNzTxfth+bInipBsEusPSx4QxQVBvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQXNNwJcaDpOsfrc8ks35ZwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj69RCFmwoFo0ew+Z6PFNX+
 8YINwEsSB/W0opawJrjIgVtruIKCZCyea865DRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2ya5KmIFwL6WjfNfD2z75Qp9yrXydvHSfcSHX559lUeEv
 GPWuW/+B3n2MfTAl2TYoi/y2IcjmwvCao4eBbu+88cwp3e64j0tLEQucGaS9KzRZkmWHog3x
 1Yv0igkoLU29UerZsLgRBD+q3mB1jYVXtEBTcUh8gqDjKzZ/26xGWwsXjNHLts8u6ceTjww1
 0Shk9rtCCd0sbrTTmiSnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdszHuMTT5w
 jTPoC1ggbwW1JcPz//iog2BhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHblrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:jwY9uq+OMTAeTklLZktuk+F7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCKlaDPY0LDErXQBeoR8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0XbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9MFlVBw6du/22z6IJyYHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.92,286,1650945600"; 
   d="scan'208";a="76658566"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQx8f0MFGlg5fwJaN7p5tmlyc44qXANekAzNkBu1B5kkGoeUIYcz7tQsfLwbQ3Ug+KKAVf1ozNfSSVLYNCajmdU3SLFK1NA6CIPMtOkSlbzNtjbMLQV7cW8PmKil2cwEmKW/3lC5eWBCxEqLPhArgJIBrQn6TfkgzR5ukKl8Mv4feZT9KpDYOvuB4j641RQoF3exB1C8uKgKMZEcl3mL/qS+ElQNf+USgscANJ+mG1Ptu0MBq9vsvVBegBz9waOLmvwZhjWoIXUEi8qLXELk5hSf0aNbnAQrYp2khogekbJxhmco7mPFHeZj5jaqsfmWVWpGNB+Ci/BPIbYFInISVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8pypOpu9hgaR5vnUwx2r0HrjGvMH+W17ooc+AAQInY=;
 b=gAAJSVjiCRym2eCrignkHUD/GOv/NE33LIjK7y+V+a9VtY1h+tOBnH2tWd8ne+4iGoGpEkvIh0GxorncADEKQXKiOfKrucf/f0TiWM4pvE6IFMSGJFDhtRzEfgG7F/ONIN3oL5fXTli5+UleyQreTW2e/OiO5JrtTzdyQEmR0Z3xYw6uzRMmmVXRmpFwpWZwnrvXYugVMlkOby95i4d4nRx2JYQ7WFUvkxScXYGwy6uePLEFSjNGspDoFsgzEN3A6BCxdMrLugPCHFw3Rs5OKnQya/sBqxZ5k4uhbHVLNVc1zWovxJ5eHpBr4gbgFCeExm5BUB8yRsJQUZTOuqBwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8pypOpu9hgaR5vnUwx2r0HrjGvMH+W17ooc+AAQInY=;
 b=rDvhQq7PNvOxNicTMDUwpOtmRDD2ssye9gBDlqz593FkymFXHSSyvfDgYLMfGyJUHzx6gGfZtIcDeOEuNLLCqVvvqMd2Q9O9NzXC0wgTgXermzl3HMPHmP/s+qBZnrUuloPeOhsP0pWZsf76cIHwHHLneNzwO+s1r7s4xt3A7yU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <amc96@srcf.net>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, ChrisD
	<chris@dalessio.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86: also suppress use of MMX insns
Thread-Topic: [PATCH] x86: also suppress use of MMX insns
Thread-Index: AQHYnDziwacZadvwmE2/HDJeAtmcAK2HQiYAgAAA5wCAAACxAA==
Date: Wed, 20 Jul 2022 13:39:19 +0000
Message-ID: <e1393725-3bf2-3dbb-b30b-757c5fb1ab21@citrix.com>
References: <c35482f1-f1a2-5326-2ecb-9e97881fab01@suse.com>
 <8fa727c8-3ee8-44e5-74c3-2c9c585f12c0@srcf.net>
 <3d1eb47d-607b-1519-7e38-d0b574dc5d6d@suse.com>
In-Reply-To: <3d1eb47d-607b-1519-7e38-d0b574dc5d6d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95401a53-eb4f-420e-03c5-08da6a553f3b
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 g8eY8F4mtxvptyuFfe+bYGXgQKaHPKnFlTAj6lAKsrXWI+MGCu4k4gVcyqnpLbvRglhGoSCO2JqywIbQO8MJAuEvFFUmsmUJr+paUdJUdMK5Frju2rX9D8vZ2ubalzEwZttOg+EiGgCnBTXkR/QxrAz1e6mtNhEV9viwH+ZRpFbJlXFqjpZ9mJWyZi8RLc3z5H4iOfj+pwzDiRjc/llr8JNKhNJ1iTwYRD5S9lfH8wssa/jOw/zJwHLZUQl7lbDXcq2YhZnXIya4JYFZCfsPtnbsBKj4vFkosm+jqzzK6iA0eK5OoSUURiAIvesIyjzU0pG8oirRg1/CGbwwxdt29J1kVFY6IBAZd9tDPcu8QqtGB4qy+pG39wiUs/cBzId+nU9/L3EV7ufAi4Rnt41QfnFcyc4DWyGleevNeX6ukU/oKddKJtmHXSQNgselpGqiFFHXt4m6AS7wq4lQzNuwRWsGUNcNWLaUxbh8mcSw5uq9BeYV/o69LVJ2N6l/ezNF7ezZyOZ3Rt8kS8XYw4b74cMbOWB50jTZweNWP41mXREchbPD07f7pFWYxYQKUUcdA8oP3JRa/FVUfRofmEAlt2Sy04y+x42drFRvdK93NtCBMOXATIr4QJ1q1nuH3CMydQWpWU1fhluRQdzbXDxHHKGpLqceah9ZNIAzwyTjC25sNTbCcf10hhxspkLSmJUK/PBI8NTtp2BWo6jNlotjaYrB+7FeH/T7QprGmRgF6GnYgQQKY88YeKLd802K3bddMquH4Z0nB72zfZ36aXFYAFOiARSQ6bUqXdpk3GGriZyHCnCmvbvtXD3qlF8IqFfEB6SwBaNSkPzPNdo59x9agEwLCPlbqfZFaoRhtIzCLsI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(6506007)(2906002)(26005)(2616005)(6512007)(53546011)(186003)(38100700002)(86362001)(31696002)(122000001)(82960400001)(38070700005)(41300700001)(36756003)(6486002)(66946007)(76116006)(91956017)(66556008)(71200400001)(66476007)(66446008)(8676002)(4326008)(64756008)(8936002)(5660300002)(31686004)(478600001)(316002)(4744005)(110136005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWN5TlRwMzVkSytVeUJOaXBkOHBXSC9oVkcxVVBDalVmcEtHTFpod05GbTdO?=
 =?utf-8?B?cjByRVZCTnR5aEF5NVRDdXNlUzZsdEN0ZEt3RmFYT3dpVzhiSElFSGFTVkc0?=
 =?utf-8?B?VHBLZlUvenRtVlIwSmpuT0ZqaWRUbWVWTkNWK0puOEtEcEdJblUwUTBJLzh3?=
 =?utf-8?B?ckF1V3YySHZEK3hKRHovRTBVckczRFU2SkJQaHlpWnhOcUxZeGJiV2ExRVBh?=
 =?utf-8?B?Yy9tbXVxbkFxKzdBV1cyOXYza3NwQlNlVDR5b0FtOVpKOFhGUWJ5YUdHQTVm?=
 =?utf-8?B?R2VnVmU5WTFUeU9xdWVPQldpRGRuWFdmZ3p0Qm9vWDI0VjgvaW1JdElka21U?=
 =?utf-8?B?WHlMbWFtdEU5ajJtd0h6V3g1UFdzSVR5U0hHdkdGRnJaeG91SnU5R3RqUi9q?=
 =?utf-8?B?N0xDcGlxWjQ0WE11Z1J2cy9tRjJRZ21Helh2M2p2MGx6SmFnVmkwdEFFS1Nq?=
 =?utf-8?B?VTJObTRHQWxMYVpzRUlDKzJNelJlU09OdUs3K3BCd1BoKzd1ZndBWUxvSnA2?=
 =?utf-8?B?TnQ5clV3SGlrSmk4bHJxM1prRS96QTNOYzBqdnRqSjBLQmJIOVFMcXBRellm?=
 =?utf-8?B?SmFHSWFxb1gxUGp6S25DYkJxYjRCazdPSHBuaFZ4Tm9UNXNldVNLQ3NnSUho?=
 =?utf-8?B?VDB0dHJGSTB0S2NKVXhpc21DTk1URDA1UlJrNm54V2NaQ0VoM1VZc21OalhK?=
 =?utf-8?B?VXBCQkdJd1JZaDJmaFRrd1prVTdIN040Q3B4SE9VbS9kSTJQUVF5a2VCYjk1?=
 =?utf-8?B?WEM0N25aTmlXRUk5QTMwdkZoWmtsZGdDY3M5akpmTlFjUnZzOVIyNXRmbkdM?=
 =?utf-8?B?bkRuU0FiOHJiN1ExajNrcXBUQndqQkhaMHRhTUcydGFqQThWcmI0eTF4N0ww?=
 =?utf-8?B?TU1kNEFUTk1tQWRQWUVoSk9qcXlNK0tPN2hTdFhCaUtlYVBFVFhmdGttUENy?=
 =?utf-8?B?SlQ4VkNFZnhkYnF4clJwTVRwdjlEZ1puYTkrRjVNUFgxRFpzWUdWTjhBN3lj?=
 =?utf-8?B?Qk8vQkx2OTZKV25teEhHL0lxdFhsY2M3U1BNRFlRd2N2TFk1S1VVSXZxLzJC?=
 =?utf-8?B?clFrNU9MZHpOMXU0dlBJcUJFOUhwT2tqcmRVUDRnbUR6K3VRVUdNMlZGeGlh?=
 =?utf-8?B?Qks3cGZVVTJVY2MyczNFUERrMEtkK2ZZU2c4WktJMXVQc1lxbWo1K1NYbkpt?=
 =?utf-8?B?UXAwU0lBdzdvU0ZHRlI2OXVzUGduKzk2VkZndXhkZlU5RVVHTUo1K1RDb29S?=
 =?utf-8?B?amtyMGVGMlNCN0xYQ09UQWJGVlRRVFB5eHh6WVBDRWZ3YllSd2p0Ry95YW1v?=
 =?utf-8?B?ZEVJTWROQjBQTVJTVENBVk9FVDA0VTJkN01jMkovRThGZU1YMjNhbkpDMytz?=
 =?utf-8?B?Y0t2Qy9mdUtCbTZudWRtbEZRQVdYeHBmd0FUWmlsUTQ0dG5hamZQMXY0dFZT?=
 =?utf-8?B?WStIVmtWb1IyYW5QSFF5ME95aVZYSUo5VTdFS2g3cTFhMWZMNmpVcGtaVjBS?=
 =?utf-8?B?dXFidGQ3MENLWHF3N3ptMHFTSGhpcXErdG1JNGdtZEhMcWpQbktwaVh4SDlU?=
 =?utf-8?B?TmhZbXJwaXRDVTZ6SFBEZm5kUkMrOXZyYlc1SGoxT2NIMjl1TWVCWDU0YVBL?=
 =?utf-8?B?aXR6NWtpNStWUGRvSmFOaFJGb3VoKzZ0a2dBZnFpUy9wVGxocmd0Y3ZuYUFH?=
 =?utf-8?B?QXAvZ2JRUlZkUkphMG1tbVhUWGpIcTY3ME5GejNYLzBySTBHVFF2TUZlQ3k2?=
 =?utf-8?B?SDZGcGRPY25rZnJtVlU5cVY1OE5EMGM5V1VVNkowS1p1NVkwVXRTazUxNldu?=
 =?utf-8?B?dmkvemtYQVV2WjRJelcyS3FqWmdLZ1E1ZVV1TVNLWnJBOHFPMTNlMWRkenNa?=
 =?utf-8?B?ZzgvemM2UThNd1VjZEs4MEwyRUszbDRhNkhIY2VEZ3dkZE9jU2x3S1R4MVE5?=
 =?utf-8?B?cUZlbm5qcGMvS2U1QUVFZkhZT2ZQUi9hUFZTR1B2L21pbmQ3VjE0Q05rQjVP?=
 =?utf-8?B?YkJSSDZWejJmUjRTOGRaR0JPYkpQK0RiaVZ5RW45UE9tTTAvNCtYSHIzNndY?=
 =?utf-8?B?eTk0UFcyeXdQUnFnd0ZuVEs1SGpEL0pYSFFmVENZVVJ5L3gxRld3bVZUZWtv?=
 =?utf-8?Q?qglh9zJUSJP6/8aGNezQ6PKDN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47CE96A21B5F734F9C10B96B2F27E982@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95401a53-eb4f-420e-03c5-08da6a553f3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 13:39:19.1318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q1GHD7PP+C4wFhutEauE2WY7HkYhRdSJ2hsOVIow/gJu/HopiPUjHRxb5nEBpbDYTyVMNV2iZ5bXoOtXSCgv2x9G7Rqjwd9YrtksDTlfiCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6351

T24gMjAvMDcvMjAyMiAxNDozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIwLjA3LjIwMjIg
MTU6MzMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMC8wNy8yMDIyIDE0OjMwLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBQYXNzaW5nIC1tbm8tc3NlIGFsb25lIGlzIG5vdCBlbm91Z2g6
IFRoZSBjb21waWxlciBtYXkgc3RpbGwgZmluZA0KPj4+IChxdWVzdGlvbmFibGUpIHJlYXNvbnMg
dG8gdXNlIE1NWCBpbnNucy4gSW4gcGFydGljdWxhciB3aXRoIGdjYzEyIHVzZQ0KPj4+IG9mIE1P
VkQrUFVOUENLTERRK01PVlEgd2FzIG9ic2VydmVkIGluIGFuIGFwcGFyZW50IGF0dGVtcHQgdG8g
YXV0by0NCj4+PiB2ZWN0b3JpemUgdGhlIHN0b3Jpbmcgb2YgdHdvIGFkamFjZW50IHplcm9lcywg
MzIgYml0cyBlYWNoLg0KPj4+DQo+Pj4gUmVwb3J0ZWQtYnk6IENocmlzRCA8Y2hyaXNAZGFsZXNz
aW8ub3JnPg0KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pg0KPiBUaGFua3MuDQo+DQo+PiBCdXQgd2hpbGUgd2UncmUgYXQgaXQsIHdoYXQgZWxzZSBtaWdo
dCB3ZSBoYXZlIHRvIGNsb2JiZXIgdG8gc3RvcA0KPj4gbm9uc2Vuc2UgbGlrZSB0aGlzP8KgIHg4
NyBhbmQgYXZ4IGNvbWUgdG8gbWluZC4NCj4gQVZYIGlzIHRha2luZyBTU0UgYXMgYSBwcmVyZXEg
KHdpdGggLW1uby1zc2UgJXhtbSBldGMgcmVnaXN0ZXJzIHNpbXBseQ0KPiBhcmUgdW5hdmFpbGFi
bGUpLiBBbmQgd2l0aCAtbXNvZnQtZmxvYXQgSSB3b3VsZCB2ZXJ5IG11Y2ggaG9wZSB3ZSBoYXZl
DQo+IGNsZWFybHkgaW5kaWNhdGVkIHRvIHRoZSBjb21waWxlciB0aGF0IHdlIHdhbnQgbm8geDg3
IGluc25zIHdoYXRzb2V2ZXIuDQoNCk9rLsKgIFNvdW5kcyBwbGF1c2libGUuDQoNCn5BbmRyZXcN
Cg==

