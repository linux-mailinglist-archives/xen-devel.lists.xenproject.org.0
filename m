Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD09B65EA86
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 13:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471896.731933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDP9y-0003rw-Ev; Thu, 05 Jan 2023 12:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471896.731933; Thu, 05 Jan 2023 12:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDP9y-0003q9-Bp; Thu, 05 Jan 2023 12:15:50 +0000
Received: by outflank-mailman (input) for mailman id 471896;
 Thu, 05 Jan 2023 12:15:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDP9x-0003q1-Cq
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 12:15:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adae7a0d-8cf2-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 13:15:46 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 07:15:43 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5834.namprd03.prod.outlook.com (2603:10b6:806:f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 12:15:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 12:15:38 +0000
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
X-Inumbo-ID: adae7a0d-8cf2-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672920946;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=DugpVJyShds+JdKCIeHKaDxrw2o9ohUEHmwSAbO7ieE=;
  b=NEcHbNJ8/0vmiG8jmJQDMU3NV2KU6F2UNRkMkNIEXEyVRj5VtwiJ5adC
   RmPfu+an7KmbMp7LmzM4NejOiTq780v3M8q/0s8EoQdJJh8ahA3fL4rHn
   F3C0sS/s4ej8B5CzClgKkfmxelOmk1gEsTs1vjDhhkPG/r04XhOg5vNRa
   4=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 91299082
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eSW5tK+hLxkHBFkgSSIQDrUDr3+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mEXXG6OMvrcYjSmKdB/O4rloB4B7JaBz9dlHgY/+3o8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AdmPKgW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklHz
 KImGhEwaiuH3bqJwvWZasJ9qpU8eZyD0IM34hmMzBn/JNN/GNXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUvgdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdtIRezgpqQCbFu771NPLh1LSl6AoPi5zQmPBYpuE
 3Ys9X97xUQ13AnxJjXnZDW6vXqFsxg0S9dWVeog52mlw7vd5QWEA2EsRztNLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Ys13hTGS486FLbv14OkXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94aRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:ZUG3m6xl1NPIJAR6A1g3KrPxHegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBZpTgZUJPwC080hqQFmrX5Wo3SETUO2VHYZ72KiLGP/9SOIVybygcw78
 Zdmu1FeaTN5DtB/IrHCWuDYrEdKbC8mcjG69s2jU0dKz2CAJsQjDuRfzzrd3GeMzM2Z6bReq
 D92uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJTIWGhI97wGKrDWwrJr3CQKR0BsyWy5Ghe5Kyx
 mKryXJooGY992rwB7V0GHeq7xQhdva09NGQOCcl8QPLT3oqwCwIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKfQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgodleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfxsRM0kjQFo+aU7bWbHAbMcYa
 5T5QbnlbBrmGahHjXkV69UsYWRtzoIb0+7qwM5y7aoOnBt7Q1EJg0jtY0idz47he0Ao9Mv3Z
 W5Do140L5JVcMYdqR7GaMIRta2EHXERVbWPHuVOkmPLtBwB5vhke+C3FwO3pDcRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo8ERgMy1eJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR/vuN3HnF4pF1xD3H5NSNX4dWssIvctTYSPGnuvbbonx8uDLevfaI7TgVT4iR2PkG3
 MGGCP+Ic1Rh3rbL0MQQCKhKU8FVnaPja6YSpKqgdT74LJ9R7Fko0wSlUmz4N2NJHlLrrE2FX
 EOU4/arg==
X-IronPort-AV: E=Sophos;i="5.96,302,1665460800"; 
   d="scan'208";a="91299082"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEuBtK7R2/dikj5S0egCNpZYTwdYKIaJZhTTqCRGVoMBuJmAOGxWJn84A8TbLEwgmF4rboWN+ZYfsXz8jYuKIVNmIgMRztbDF81zBlWmpkRRyx1ITt8HTBZoiMNDEz3y+nfuC3zlRv31XDp7fagCKTa3dUIDY4oUOTmgTJiXbxUHjqlEyJaQVh7IojblWUS/dbN9AvEnxJ2FX0I87ATj8swjtKoJYxp7fveFuYyiuWgPc8jnzhMQ1NVs8fBDFdMX9iLYce4mVz4xChfYVeuZzU2MPwteIHMuTexftQTxz57R9lWY4spOExu7R8miglXLNHQc53NsFDJ84jcCz7+pew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DugpVJyShds+JdKCIeHKaDxrw2o9ohUEHmwSAbO7ieE=;
 b=FdMuWBcYihPW6GdIBk+kqpBWqP/7n1iSrBI0sn0aDpEopCmhkW7xySzs3g0jHKyvsREOxuHUGgFMimohuEMdIl1+FksC/XweDXrO2tvuy/rt4siTBdIO+ur0Yp3xoWDGK1AwUQTpYySj+S5yiiC2ijAfwUgq+mazthKexjB0a0C3Dmz5cAMTZI0JIzbVNV7nVgliEObDdyNpzwhgyBdQsQpClbAf8tfvqNyveZyo69GdTKFDqIIKrSPvJ79q1SKSmRtZPaCv+Rc+BCVXU5HzD9NaCADpvdAzaXM0ueqEuDzaV8VnJqEHUPN2pQEwK0I3aVEVCUdXIaZINiT4AeRBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DugpVJyShds+JdKCIeHKaDxrw2o9ohUEHmwSAbO7ieE=;
 b=v3kl4IdwuaDP2Bc7P+xtEEJ1zUts3e/jXGfB9ZKx3SnB9oIfc9Kwcq8JJVOw0hapHP2DMshSg9TzmzcGGw7AH7UGN6JHuOUirLgF5hUv/ocTErPhFWjHXWkOEhhvWDVu/bFJv2q6pCjyuU6qdlYSha02gL4wgmagzoRliesQDS4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] xen/arm: Add 0x prefix when printing memory size in
 construct_domU
Thread-Topic: [PATCH v2] xen/arm: Add 0x prefix when printing memory size in
 construct_domU
Thread-Index: AQHZH13GXnua+lhJCkOWuIi1KAI8E66O7vgAgACh3ICAAAlTgIAAFk6AgAAPpYA=
Date: Thu, 5 Jan 2023 12:15:38 +0000
Message-ID: <35d590fb-4b96-70dd-a60b-1c8d7cc8f2d6@citrix.com>
References: <20230103102519.26224-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2301041546230.4079@ubuntu-linux-20-04-desktop>
 <1264e5cc-1960-95d3-5ecb-d6f23d194aa4@xen.org>
 <29460d07-cd43-7415-7125-6ed01f3c2920@amd.com>
 <c80f90d7-d3b5-1b13-d809-9506ff5414e4@xen.org>
In-Reply-To: <c80f90d7-d3b5-1b13-d809-9506ff5414e4@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA2PR03MB5834:EE_
x-ms-office365-filtering-correlation-id: 561bfbb8-daa3-4e30-4ebf-08daef168e5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xyPw9xg5TWfMdiMi313HlIzUHVp9FMOyIBzaV7KVuPrv5//apseEdadhYTWNK7J8fiV1zwlfuZX5rLZ69FeZzywqrFXw6TZCcTI8b8isskpYmGwpzVilqVvAMV0MH3/xhqiGbyUkq3+2yVinyg2uLyF3DLsH27JVP4HEmdU6p6ZgMDv59I2QQmELH8e5yDknPm0/NMb0W8XUX2v+oN21VgiCkvinQ8O2IsKCMkZbUV9UGG3LDEbo/zSfz+g/DS74g/ekH2D5F/NMA6BeOT++NKemgby8vz0JNckAEVj92s2XmqAsJKufT6KJWl4xzPX9mUOFfct8zRuvzLjQZC9vi4mvaGcHf/wQPjp74HbZgpNJ/OSJO6t+Oi9HtykVDyfI+eHNE43cNnZTg2ZX+sFsRCQmiqp/5U555qzXyQ4BuQvYR2iqGPvdS0m66IA/DZvXw5jqJJbJ5ZDInYr7/ZAmBsQDwd8VhHNklTzWxoGZPhsS4b7gMxaUCE2ZCYOWOcC1YD6agmBIGhOFKnIK2C91+wdOOYXHjhUzlhLY1F8cRbbwmDl4V/oQPt09XPJnONREKeOfTYXFP2PSE6W0+ENPayxRLdNpmWQcu0n1pQsXptEAbj8VzBqHWTn4PrYDvasowJj+rBnxo7dTdijrdcDBG2KEts22OUwF8hu5fOxXEFjux5KrcmUrbD5TsTvZtLxIvrGiCmtnoIIrM0rYel9dHHHU5gNfIaBscp9kCVDijFq0qHZyWlVBFovBHSII9jxD4B/AnKwFnu0eHM7NNvV0gA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199015)(316002)(2616005)(186003)(38070700005)(6512007)(26005)(6486002)(478600001)(71200400001)(36756003)(86362001)(6506007)(31696002)(53546011)(110136005)(41300700001)(8936002)(2906002)(66476007)(83380400001)(8676002)(91956017)(82960400001)(64756008)(66446008)(76116006)(66946007)(31686004)(66556008)(5660300002)(122000001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlZMRDZTMWZMTm9taW1GYjVleDdwY0tRQWlLNnUxbTVpSnJUOUlGUFR3UUdN?=
 =?utf-8?B?M25aQk9ObXJBeTAvVmZHc0ZmckM1UC8yb01uL1EzNzNPUGRYU0JDWjFxcVM3?=
 =?utf-8?B?ZW9yWVI2OG80bGd1WFlxSmF6bHJQdFkzVTNmTlA1aWdFWkQyUHZyN2Q2dEpJ?=
 =?utf-8?B?d0psUThsYi9uSXU3MndvNGtvVUhJTlVNVGV5b25kd3JYWGxlWnpZby9LVkxm?=
 =?utf-8?B?RkNMNDFqMUp5SHIxaVJvbFV2Tzk2RlhyU0VBZHJWODBtTHVlSDdPdDFPcEFo?=
 =?utf-8?B?M1I1a21uZ2JBckVHSklsVVVLblh1SFBPbEhMeGYxTHRDZzRubE1PbDVxTHpJ?=
 =?utf-8?B?UVdmbCtBWmZ0U0JyYjBaSHA0djUrTDluMEVxa3ZCT0tXOC9hYnVseFIzNnFT?=
 =?utf-8?B?N3FSZ1pWWHRGYmRwWE1Ma0hwSTIwN1VXZ2FFM2Q4VjZQSEEvRFdCenAvSVJx?=
 =?utf-8?B?bXhyeDhxd1AzYm1IdW5hNVlOOSsveUI0TXFoR0oxNE1aSkREdVF3d2x4amgw?=
 =?utf-8?B?Vzc2SkJIUTFINkNuMk1IOWVlRGZZZXF4K0J6Wjc5S0RhK0RLVG1rdXp0V0wv?=
 =?utf-8?B?T0JhY29OWkhXOGVMTHRJZmJiSitIaER2b0xzY01ZNzNydWxwUUNreVZnc0Qr?=
 =?utf-8?B?SDNQKzdLU2NMcEVHSVA5UlZuckdnbzgvOWIvOEF4SHlSU2h1TUxQck9pblBC?=
 =?utf-8?B?K3NmY01zSjREdFFZWTRxVXZpNHd1MU9JZUZ4bmtYRkp1K2VyV3J2b3lmaERo?=
 =?utf-8?B?UmFMNW0rZnZEcUhONkNoNlJJZWVsUUxlS0lreDRCZWdnU2xDbERPZmY3VDVY?=
 =?utf-8?B?RTAwU3U1bTBCTS9CZmhhb0NmREk4WXB4cDBEUXIyU3VJNk8yQVBoQW1WZXhH?=
 =?utf-8?B?T2M4MmQvZXNhVE9BRitncEZoUXF5MGRrWXpxbk9GbGxVbHcwMm1DWDZ0Y2hI?=
 =?utf-8?B?eDByeTZIbkFpUUZxVDdXT2NjZ2pFYnhxQ1hMekltYnBkZ3VxR2hGQXVJeHNi?=
 =?utf-8?B?Nnh3SWp2anVsdko1T2JaM3RVcmsvWDR4WmdZb2s1MWN6eE13cGcxSWlsM2JU?=
 =?utf-8?B?anczU0RaWEVMT1UrOXR6c3FPQ0JleE9Nd1J5UEQ4NUkwQU1QZlQ3STZDSEM2?=
 =?utf-8?B?dnNoS3NxUWdNZjBuUisvcXBHVWYrdmJxSFJXT1hiREhWSUt4R1JQWWl2eFBh?=
 =?utf-8?B?azEyMHFIM3NLZHdzcS9yOFNyL290L1QzR0FRUE82bjhST3pzT1R3ejBibEt0?=
 =?utf-8?B?M1FrS0J6QlROSVlHS0N4T0pkWVU0TXFjNkFlTkVRbHo3OCtmNGl3bzB0eXVZ?=
 =?utf-8?B?ZmlmVldhYUd0L1N5a2gzSmN0YlA3R0ZOdHJpZkd4UENFdStLVXF4YnpzNEFv?=
 =?utf-8?B?R1N5VTQzRGJ4TER4eHo5Z0hBbWxzOU4valJiNDU4MlhRUXMwclZuclYvZlVk?=
 =?utf-8?B?N0pqN2t6cVJ1UlFoako3OVM5ZkgxLzEwWGp3aGZNTVVPRjVnK09Hbm9sZ3BR?=
 =?utf-8?B?VWM4Mmxib3d5MmdKYkh3OFNQQ21QSzhGOVlhSzVldWkwOXovazdsYlROSFR0?=
 =?utf-8?B?OGxtMmVBbWNsM2o4bkFDd0RKZy9MWUFKeTNoU3pmVG9KT0wzMGhXNFF0MzFY?=
 =?utf-8?B?cmQ3RnlWbWYvOFRmYk1jTE96dDNtdTQ3ZU93VnpXUThxSDlXRmwzbkx6bGMy?=
 =?utf-8?B?Q1R4ZEZiNUp6RXE2VE1KWXVNVnlFOHdMdzF2OVRTMkN2YVFMaHZKVE9jSnNC?=
 =?utf-8?B?YVozRFNrTHVUbXphakNhb1c1MEN2Y1lFMEI3Skk1b3pNcDdpU3FoRThSU2VM?=
 =?utf-8?B?bzN0MWNieGpQcThyMUZQTm9OTG42azg5SS85NExaSGlYS3NVZy8xUnphSkhz?=
 =?utf-8?B?L2JOL3F1cm5PVjlhVEhXQjVtYkNnTVNEQ1A4SlhobTBGV2x3b0pyaHZ6U1Jw?=
 =?utf-8?B?Wmovc2pIMmY2ODNpSDJSNWt2RU5XSWRDUFZqakM5bjJLZCtnRW5oQnBCMXpS?=
 =?utf-8?B?TTd0dFdEQ3VVbkpZTG92bjZ5QUd4SGVVRGhqZml1bTd1NHl6ZjArT3VsZVFy?=
 =?utf-8?B?NDRGVzVDcDByYk04UGlaM0ZnSHdBWWZkZjVYdmladFpvTG41c1N4OUFQMXNw?=
 =?utf-8?Q?mEPJ2sIOV7e6GNcJy7xYSTsXD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <963D43C4BD8960498316A574EAAE293B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n3ajyhzCRMcmmqKew02VHWJEnMDogo8YCgir4BvtzKgx4Rs6RYHSEP7KiGPjdf2u2agLRHVH+/gH0A7eojzr9qidInBwTHRpDR4JbKGafwNObMDC6wLEinI/Sr8etu5YZD1tL9DQd7FXHa3K9wTnDGZU60vSm11vpCjjToyS8I8OnLVW1Nx8vT5mTHwHAyyGVktwMBT2pu3hZ2fNaXDdnc5oGTQi7s7J7Z640dbmNk57jzmx/e4v6wBPdgsFrR0HyJz+OgyRkehCSGDWLw3fjXCEGKJAq91cTHyvzqWPVUzsM3vqP2Md9Pa+HvG5h+UDtLMNneWAgh9H3xRPCV25YnDf2Wdia6xk1ZGZM5t84wp23b6ZtIIPP7LrEqxCv7UW6/yluHsI8eaqouXYClZRXhpD4RLDInK2NbMs0xPYwYGYui2dY9VPfIldeMWLfln/lAVYCYEYWy8BLJsMKAaB17pp+5HDe92+kz473FIye7I5jl1e4ruJH2kaGWftH99J6NjKWqEn9p/Bgc3AQsDnBWilbe4J37RFkNhrtdfjs4UHQk94qz3y2XlSOa6pT4hKtu7g7LvcsJ2Ox79Wt6eXB23cHa47vEVBexQPJ0pvSChBc2oQa3M4IEd0eZgEkkvJSYG4ZlaWKJF6XrO8U972NXtdog95DCxTaWM409DcyNDTmLNZvUwSwZkgJj3DKl0/6dcvp6HxqTMWzZUG5TUCemb46duAr8gvTUvq9EcqRjmK9qk7bDuja1QXF8XpOL5xBQIMuAQWtU112LqNRH/ZouxEhIJPa8C3/poArb0xB2aArhAqp8mFu80W4wDTRhw9
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561bfbb8-daa3-4e30-4ebf-08daef168e5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 12:15:38.2701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nUp7YfNB8YGBVquC/yvFiTlwUa3RqWMPfg5o7aT4kTvuJlk6LYeL7iFUJIKVwNXJTMLVIFwp42S3hP0ENM5PtwZz0S2yCcVx75ghJwysMQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5834

T24gMDUvMDEvMjAyMyAxMToxOSBhbSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBPbiAwNS8wMS8y
MDIzIDA5OjU5LCBBeWFuIEt1bWFyIEhhbGRlciB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4NCj4g
SGksDQo+DQo+PiBJIGhhdmUgYSBjbGFyaWZpY2F0aW9uLg0KPj4NCj4+IE9uIDA1LzAxLzIwMjMg
MDk6MjYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBDQVVUSU9OOiBUaGlzIG1lc3NhZ2UgaGFz
IG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFBsZWFzZQ0KPj4+IHVzZSBwcm9w
ZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2lu
Zw0KPj4+IGxpbmtzLCBvciByZXNwb25kaW5nIHRvIHRoaXMgZW1haWwuDQo+Pj4NCj4+Pg0KPj4+
IEhpIFN0ZWZhbm8sDQo+Pj4NCj4+PiBPbiAwNC8wMS8yMDIzIDIzOjQ3LCBTdGVmYW5vIFN0YWJl
bGxpbmkgd3JvdGU6DQo+Pj4+IE9uIFR1ZSwgMyBKYW4gMjAyMywgTWljaGFsIE9yemVsIHdyb3Rl
Og0KPj4+Pj4gUHJpbnRpbmcgbWVtb3J5IHNpemUgaW4gaGV4IHdpdGhvdXQgMHggcHJlZml4IGNh
biBiZSBtaXNsZWFkaW5nLCBzbw0KPj4+Pj4gYWRkIGl0LiBBbHNvLCB0YWtlIHRoZSBvcHBvcnR1
bml0eSB0byBhZGhlcmUgdG8gODAgY2hhcnMgbGluZSBsZW5ndGgNCj4+Pj4+IGxpbWl0IGJ5IG1v
dmluZyB0aGUgcHJpbnRrIGFyZ3VtZW50cyB0byB0aGUgbmV4dCBsaW5lLg0KPj4+Pj4NCj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+Pj4+
PiAtLS0NCj4+Pj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4+PiDCoCAtIHdhczogIlByaW50IG1lbW9y
eSBzaXplIGluIGRlY2ltYWwgaW4gY29uc3RydWN0X2RvbVUiDQo+Pj4+PiDCoCAtIHN0aWNrIHRv
IGhleCBidXQgYWRkIGEgMHggcHJlZml4DQo+Pj4+PiDCoCAtIGFkaGVyZSB0byA4MCBjaGFycyBs
aW5lIGxlbmd0aCBsaW1pdA0KPj4+Pg0KPj4+PiBIb25lc3RseSBJIHByZWZlciBkZWNpbWFsIGJ1
dCBhbHNvIGhleCBpcyBmaW5lLg0KPj4+DQo+Pj4gZGVjaW1hbCBpcyBwZXJmZWN0IGZvciB2ZXJ5
IHNtYWxsIHZhbHVlcywgYnV0IGFzIHdlIHByaW50IHRoZSBhbW91bnQgaW4NCj4+PiBLQiBpdCB3
aWxsIGJlY29tZSBhIGJpZyBtZXNzLiBIZXJlIHNvbWUgZXhhbXBsZXMgKGRlY2ltYWwgZmlyc3Qs
IHRoZW4NCj4+PiBoZXhhZGVjaW1hbCk6DQo+Pj4NCj4+PiDCoCA1MTJNQjogNTI0Mjg4IHZzIDB4
ODAwMDANCj4+PiDCoCA1NTVNQjogNTY4MzIwIHZzIDB4OGFjMDANCj4+PiDCoCAxR0I6IDEwNDg1
NzYgdnMgMHgxMDAwMDANCj4+PiDCoCA1MTJHQjogNTM2ODcwOTEyIHZzIDB4MjAwMDAwMDANCj4+
PiDCoCAxVEI6IDEwNzM3NDE4MjQgdnMgMHg0MDAwMDAwMA0KPj4+DQo+Pj4gRm9yIHBvd2VyIG9m
IHR3byB2YWx1ZXMsIHlvdSBtaWdodCBiZSBhYmxlIHRvIGZpbmQgeW91ciB3YXkgd2l0aA0KPj4+
IGRlY2ltYWwuIEl0IGlzIG1vcmUgZGlmZmljdWx0IGZvciBub24gcG93ZXIgb2YgdHdvIHVubGVz
cyB5b3UgaGF2ZSBhDQo+Pj4gY2FsY3VsYXRvciBpbiBoYW5kLg0KPj4+DQo+Pj4gVGhlIG90aGVy
IG9wdGlvbiBJIHN1Z2dlc3RlZCBpbiB2MSBpcyB0byBwcmludCB0aGUgYW1vdW50IGluIEtCL0dC
L01CLg0KPj4+IFdvdWxkIHRoYXQgYmUgYmV0dGVyPw0KPj4+DQo+Pj4gVGhhdCBzYWlkLCB0byBi
ZSBob25lc3QsIEkgYW0gbm90IGVudGlyZWx5IHN1cmUgd2h5IHdlIGFyZSBhY3R1YWxseQ0KPj4+
IHByaW50aW5nIGluIEtCLiBJdCB3b3VsZCBzZWVtcyBzdHJhbmdlIHRoYXQgc29tZW9uZSB3b3Vs
ZCBjcmVhdGUgYQ0KPj4+IGd1ZXN0DQo+Pj4gd2l0aCBtZW1vcnkgbm90IGFsaWduZWQgdG8gMU1C
Lg0KPj4NCj4+IEZvciBSVE9TIChaZXBoeXIgYW5kIEZyZWVSVE9TKSwgaXQgc2hvdWxkIGJlIHBv
c3NpYmxlIGZvciBndWVzdHMgdG8NCj4+IGhhdmUgbWVtb3J5IGxlc3MgdGhhbiAxIE1CLCBpc24n
dCBpdCA/DQo+DQo+IFllcy4gU28gZG9lcyBYVEYuIEJ1dCBtb3N0IG9mIHRoZSB1c2VycyBhcmUg
bGlrZWx5IGdvaW5nIGFsbG9jYXRlIGF0DQo+IGxlYXN0IDFNQiAob3IgZXZlbiAyTUIgdG8gcmVk
dWNlIHRoZSBUTEIgcHJlc3N1cmUpLg0KPg0KPiBTbyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gcHJp
bnQgdGhlIHZhbHVlIGluIGEgd2F5IHRoYXQgaXMgbW9yZQ0KPiBtZWFuaW5nZnVsIGZvciB0aGUg
bWFqb3JpdHkgb2YgdGhlIHVzZXJzLg0KPg0KPj4+IFNvIEkgd291bGQgY29uc2lkZXIgdG8gY2hl
Y2sgdGhlIHNpemUgaXMgMU1CLWFsaWduZWQgYW5kIHRoZW4gcHJpbnQgdGhlDQo+DQo+IEkgd2ls
bCByZXRyYWN0IG15IHN1Z2dlc3Rpb24gdG8gY2hlY2sgdGhlIHNpemUuIFRoZXJlIGFyZSB0ZWNo
bmljYWxseQ0KPiBubyByZXN0cmljdGlvbiB0byBydW4gYSBndWVzdCB3aXRoIGEgc2l6ZSBub3Qg
YWxpZ25lZCB0byAxTUIuDQo+IEFsdGhvdWdoLCBpdCB3b3VsZCBzdGlsbCBzZWVtIHN0cmFuZ2Uu
DQoNCkkgaGF2ZSBhIG5lZWQgdG8gZXh0ZW5kIHRvb2xzL3Rlc3RzL3RzeCB3aXRoIGEgVk0gdGhh
dCBpcyBhIHNpbmdsZSA0aw0KcGFnZS7CoCBTb21ldGhpbmcgd2hpY2ggY2FuIGV4ZWN1dGUgQ1BV
SUQgaW4gdGhlIGNvbnRleHQgb2YgYSBWTSBhbmQNCmNyb3NzLWNoZWNrIHRoZSByZXN1bHRzIHdp
dGggd2hhdCB0aGUgInRvb2xzdGFjayIgKHRlc3QpIHRyaWVkIHRvIGNvbmZpZ3VyZS4NCg0KWGVu
IGlzIGJ1Z2d5IGlmIGl0IGNhbm5vdCBvcGVyYXRlIGEgVk0gd2hpY2ggbG9va3MgbGlrZSB0aGF0
LCBhbmQgYQ0KYm9udXMgb2YgZXhwbGljaXRseSB0ZXN0aW5nIGxpa2UgdGhpcyBpcyB0aGF0IGl0
IGhlbHBzIHRvIHJlbW92ZQ0KaW5hcHByb3ByaWF0ZSBjaGVja3MuDQoNCn5BbmRyZXcNCg==

