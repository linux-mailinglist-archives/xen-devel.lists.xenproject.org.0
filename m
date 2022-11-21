Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14B2631EC0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 11:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446501.702098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox4NW-0004xd-14; Mon, 21 Nov 2022 10:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446501.702098; Mon, 21 Nov 2022 10:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox4NV-0004v2-U3; Mon, 21 Nov 2022 10:50:17 +0000
Received: by outflank-mailman (input) for mailman id 446501;
 Mon, 21 Nov 2022 10:50:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5PF=3V=citrix.com=prvs=31798088b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ox4NU-0004uw-MD
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 10:50:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 464810b9-698a-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 11:50:14 +0100 (CET)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2022 05:50:11 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by DM6PR03MB5129.namprd03.prod.outlook.com (2603:10b6:5:1eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Mon, 21 Nov
 2022 10:50:07 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 10:50:07 +0000
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
X-Inumbo-ID: 464810b9-698a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669027814;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EVVapN5AyFBIbz8p+YHaAbuk84v6u4IHoGC2r3i8diI=;
  b=gOX5wd+G1Vz5kg7KbIZ7Z9Gh23FlbnSKJsKsQUpCQ6j7rmt+N9K3M92U
   8NhSMF1Vkc+YWPbjgtFI0WtOUPRD2mQDMkyBelM5TBegyWtPo9mJdlH6p
   1Vp3fhK1FqC9kkngmF7bcCCPFONy3trwev0plk/IqHefDbHfIPNt1WSfd
   Q=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 85659536
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:X+OSIK/+4Jk5dvqj7SizDrUDmX+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 DdLCmmOMv/eNjekL4p1b4u1oE0DuMDRz9dgGVBoryg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKoS5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklX8
 /8hdSBKZSuz2cSqzuqbRrZOt+MKeZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCN9MSezlraACbFu73DwKJAUcWH2AodK62k2RC89Zc
 kpOw397xUQ13AnxJjXnZDWYrXier1gjUtxfO+Qg7UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhqgGqy8qDqzPW0QMjUEbCpdFQ8duYC7/8c0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:MnGa5a5T3M/Se8b9lwPXweCCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FXQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMk5
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvvn+9Ua1wWR4S2rpXV9
 WGP/usosq+tmnqNkwxi1MfhOBEmE5DRituDHJy4fB9mAIm4UyRh3FouPD32E1wtK7VAqM0md
 gteM5T5c5zZ95TYqRnCOgbR8yrTmTLXBLXKWqXZU/qDacdJhv22tfKCZgOlZaXkaYzve0PsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4WTj20MlR65Vwp7W5HdPQQGa+YUFrl9Hlr+QUA8XdVf
 r2MJVKA+X7JW+rHYpSxQXxV5RbNHFbWswIvdQwXU6Iv6vwW8XXn/2edOyWKKvmED4iVG+6Cn
 wfXCLrLMEF9UyvUm+QummkZ5osQD2LwXtdKtmowwFI8vl9CmRliHlktX2poseWNDZFrqs6OE
 NjPbKPqNLImVWL
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="85659536"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cq6NRp2ZcVtostVA6SCpynJPIrclFt2ZQUKHBB7NL6PuAMN37+RMsspFnVEGt7q0HUjsR8u70ylgWhhczHtl76tr1JyXGIeXHO8Czi5Lh0HybbTiVZpGxENHFQwMw22Vy1i3uxmvwe5ZClGihEcXJOz/mXOH1PwlfkjI+rdHNPTxnfQD6lyXZNxJgE/4ptKENvwy3EkO0TT3kzrpaFFRJo0pTccRu3ZH5L9OQ7CUZGHO/bNhGmhDOrmYKYVDOBC9h+NEB9ONUkYrqVCmpnM+kcdGmFSTPbcSgfypH2JNHtB+N+hyz+wABD99J3/k4snwq0wV6H46QF7y8RjAp9eZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVVapN5AyFBIbz8p+YHaAbuk84v6u4IHoGC2r3i8diI=;
 b=K6gUz4VcHOthYQm69t5W9Wx5EQjNEv09XOK6QX6yt7Zz93lnEnoVwEx4L5mHmiEh4/tkpzZnlT3JC778g32plQj6YQEsK5IFZ7TK+nCj1eiDxQsKUTH6GAhiNXtaR9FmSSTsfzXsb2Vo5JIVtAX0iD4V33l4IbUWfRHdfmgidydSR8UllvMhr4siqAk2VIeIdCTog8DqoxRzMoiCf/0hwM0iDhEO3I8vmPbBKQhRjYNzgmtE74boiD3KyBLQX/BPqTW24fIqv4FinHAhnZiH1haF2o2XxwquikjnlYyKkWdxHpZlhgGPYjyFAzQUBjc9PTiBdTZk+e9PA4i+SyZPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVVapN5AyFBIbz8p+YHaAbuk84v6u4IHoGC2r3i8diI=;
 b=FjZO691pWrkPnWcSIxs+xOgbQunk+MIlR7U/qVSdj7ctDzNRE8IVioQ56M7W9Ca1q5x0Xlx3WQ125Yz3gbivp+/qEN8MBkm6hnakt562TOCzWbT1tutryuNg+ox5tB/nezPvX4wm3O52R/nS1MOyRR/v+xcZIxPloTNIy0y5aQc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>, Anthony Perard
	<anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17] tools/libxl: Correct error message units in
 libxl__domain_set_paging_mempool_size()
Thread-Topic: [PATCH for-4.17] tools/libxl: Correct error message units in
 libxl__domain_set_paging_mempool_size()
Thread-Index: AQHY+2+HxzzdtfVo7EqtEeJLb7BMnq5E7LOAgACNwgCAA7y1gA==
Date: Mon, 21 Nov 2022 10:50:07 +0000
Message-ID: <0d19dd94-7396-476b-b29c-a13d6f339f10@citrix.com>
References: <20221118170213.2872-1-andrew.cooper3@citrix.com>
 <Y3e+aWizTFL2HUvZ@perard.uk.xensource.com>
 <AS8PR08MB79914F454FE85E15AE24B67592089@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79914F454FE85E15AE24B67592089@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|DM6PR03MB5129:EE_
x-ms-office365-filtering-correlation-id: 01e14e0d-6ba3-4b6d-6e40-08dacbae27b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Og7FKTobAQzQYO4b3Otz9cA1qKznwB+2688fFcM0WS1sMcWQKvCx9L/zV2SDafZAAOJs0wuNuJZ4z0j52I8++ini4j37RR13bmwLIMAgvZYd2NPGwM5kdB63e6t43zrkadERAAoSROsMH5uP5SXRoxUAiLvbTOC42DTSTaAeBje14fshOjtOHbYOGsEc32VJiWzUihdnT0c537M1GEiKkmBtUKqtaIMg4+vuBITA30rGkvk2RjxE1NRR07QaYJ++qoI0eeFyJhaCy0egKpMXAoPudjr46+mDXuQqWIjZG+CHAcyjISpaZOIWbuHf8lbmjJX/6L3OPo4SvJgjLL2DwWY7S5CrY+/oduS3yfeu6MnZY1+AAf04+xpw3VzA+AK0Xt24TS01F+YfRHQ6ii2WoPuNya+Aw85ZM2ewHX9M/nEDKNixHD1DS/+YNPzNTXyD1K4oqG/581V3I8lMJC5NSlQVODH0hWfNa/ALkDCMu5bBSv+NGBjGA1NUsbtRrppC2JertXnCXcM20RSF/BPKFgDjtOdQASo/zVwym8uK024p13ZUVk4Myr207hVWYxYtB9RbsCmCt1c5d9OGDi1lf9znFEy4h4zKnNOZMGnk7ZzIErDbTOIAzYAgauH77IhgkdK7bfH/ffMZQK8ZNbRP47V5nRmAzkONA5bjJgcIE2PcwPzM2kbbP+/8ghAiDzJr0gsov96ZdG7+7BKj2koypeZQ56lqAiL1w6oiWiPR5q08uHdNtcBwB9h8LA5LiDudUF6qq1X4UTgMrDWd77sFHIAAw63Lvg6ogHDOobLtx3g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199015)(82960400001)(31686004)(38100700002)(5660300002)(122000001)(31696002)(83380400001)(86362001)(316002)(6636002)(6486002)(478600001)(38070700005)(110136005)(71200400001)(15650500001)(2906002)(8936002)(66446008)(8676002)(64756008)(66476007)(91956017)(76116006)(41300700001)(66556008)(4326008)(26005)(66946007)(186003)(6512007)(2616005)(6506007)(53546011)(36756003)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnZhQ2VTcVRkRmh5V1hhMFNZOTZ3ZkhDRnp2SHk3T3RFZkRPWlNnOEQ2cWJk?=
 =?utf-8?B?NDFYamhpZlQ3Y09ZS2ZKbW54dk9tTjFhRFY3V2p3YnBIMHpiNW9RSTR1eDA5?=
 =?utf-8?B?b3FmZDJCSFlkTjgxc2dQL0VESkFiL1lKbWlzZ1lJc0RNbWY1NDJiMlVDdjBC?=
 =?utf-8?B?TUI1RnhJMmRQaFlWYXI2MmQ5cSswMXN5Q2t2Vi9UeENZZjBlZlgrbVh1RjM0?=
 =?utf-8?B?aW5IZHNkZmIzNnZJclNIZHgzbnp5VzNzeDJLa3RROUNQQUVOWnF5eTZBVW9Q?=
 =?utf-8?B?Y290RVoxMVBOYXhEYkVHSXRGSEtoMkE1d0JwZGc5aFMzSnNmdDhhU1N0KzBF?=
 =?utf-8?B?UzVseXoxdXZYakc3eUZJRDhsSDFUV2I5OVVtMEcwT3ZPNlVFQXg3b25LWGJZ?=
 =?utf-8?B?cThsdm1kb0t3UEd3RTNYRkovUkw2THhQR3dGZkpkaDhQWnloeU1JZUhHQzh6?=
 =?utf-8?B?c05Zc25EaWVGZnA1TWxaNUVadDZMVXNNZWp3ekRPMmhyT1c4ZXRwVjR1Ynl4?=
 =?utf-8?B?Z0hXSjVWZU91aitqTTU2aENEbitiQi93OEN0TUYrNWVsRTZQWW9hbDA4K0RW?=
 =?utf-8?B?RmE4clVOTmNhaGNZSVN0c01KdDJSWjF0S2FlM3VSa3hXMnU3SVVBTnNtUDJS?=
 =?utf-8?B?R1ozdkZsM0lDREMyaHhlTXFqcXBBT0Nzek5yYS9HRm9SeW5IOEdUMk1oV0Rt?=
 =?utf-8?B?ck1WdERzKzVGd2UydUxENUd5SUtuUW1nOWFhbHRWdzVLT0tmdlFYNE9EVTd3?=
 =?utf-8?B?dFhGaHF6cERFTUpuOG1NVElWTEdRSVFWdWV0QnVFMW5jZjU4aWlMRGRoaCth?=
 =?utf-8?B?THpJYlpCenpOelFrZ0ZZaU9LSDR1NUExenlvQ1hsWm5XVE5kRUVDTkV1Sndn?=
 =?utf-8?B?akVPU1FXS0hXV2tFdGhXR1F2WjlsN2NMUURMbE15MkZDLzI1Y3ZqYlFIYkxv?=
 =?utf-8?B?TzZNUmFJRCtNTG5wWGVyYjBtZ0FIa0k5d1hLL1pzak5OcCtHWWh6UTBtTTRy?=
 =?utf-8?B?a2Q3bGc0eWJUekZqTmpFNHdTRmx2cy9iTmpPcmNJSFlsOTdkaTVMLy9nTFhQ?=
 =?utf-8?B?WGk2TTlQS20vTGc2WmJ5akhoZ3VoK1o5dnJlMC9oUkJjREpaUTQvdUltcC9o?=
 =?utf-8?B?Myt0U1VTbndPRE0xdFJEMHBhRG04ZzloZXUxK041NVNGeHJJcnVxSWdmbVdQ?=
 =?utf-8?B?UFZ0aG55MWZvOHQrcGdLM042SjllN1FaMm5JelJtdnRmTWwzc3cweWhDNzNq?=
 =?utf-8?B?VE9yUUFKZVZxalVRV3JTNmJBSm90anlNMFJSZlNsT2tkOFMrVmFWT0o3N0FN?=
 =?utf-8?B?RWFEaEp0amJZSVV4VDI0MWdDb254eVMzR2ZpMndjcUIvNEpUVjlORU1xZjFF?=
 =?utf-8?B?SE94Rjk0a3dsUFBoa1hEZFludUk0UFM1UnlBOFF4TCtONjk3MFVvdmZNc3B0?=
 =?utf-8?B?dkFNNm5NL2wrMG5JZmg1elZnMDZyV2dReWhyNlhMZmsrRUFYNEpVSnp6NUlL?=
 =?utf-8?B?K3ZOaGpzYjBubDVSZlA1OW10WGlFYityOFdiQldCTnJ6dXViL3lBcUlrclRR?=
 =?utf-8?B?V0RFbStPa0VkVkFoNzJQUmtJZnkwR1prMHdBdDh6eEN0VjRqSGlDdHhLYTd3?=
 =?utf-8?B?cSt4R1lrTEFMQ2VqdW8yLzA5YmhOTU9VdVFrc1B4M2hCcDNOVUxHQjhsNFpa?=
 =?utf-8?B?R011NFBDQndJTUJkQU43MGI5KzVDc29YTjBKQnhub281NzN5b0ZmOGErVmhE?=
 =?utf-8?B?VHB3VmZNeUt0eC80a2xKT3hKWFNiMHZzUEw4d3E4d2dSaStDVnF5ZTloS2tS?=
 =?utf-8?B?czFId2o5OHdHdHV0Z3FMUU52aEZ6cWc5elAyMm1FbjhsWEZZL1BlQUJyUHli?=
 =?utf-8?B?M203dVRzWVA3d3VtVWdQOGphb21wOUowS2FGazI2QVBueHpCS2FrZUxsQjI5?=
 =?utf-8?B?clRhTUtVa05qQjF3b2JVQUlCajMyYUZVNHVPK2xEdTJhNVVPMzl1OWlacWls?=
 =?utf-8?B?Vk91czFVbVZPbDlTWVpHTGIwT3JCamkxS1VXV1pjd04vWXIrUTBUSDJxMzJj?=
 =?utf-8?B?OWpDc1VzMXZUbFp2b04vZjI3Y1N2V1pKTGcxdWJWODc1Sjc0YVRBSE5zK0xV?=
 =?utf-8?Q?Sg1q7lm+AWSW8kPzgbr2ICRCz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21CEFE25A3B44F4DAF943CB3CDA5F338@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DmqWWAH3oqyIAz3jjTmp6ZRoq8RbEOOYUhLwdBOKVr98RyNIOZFR1+nZtDyTxrbeFEmqA2115rJ47OGa3Uu/AEpsAqg+r8WluSJM7rVA1fppHj+fWt1+Piz7quYqH6rMPem5wyCc/9viweD73VUx2C49wFhW7KP8MIzGl+dLuDm/YhZ/LP2jkxf0KdOnqICAc4jqv/aYO04RQ6+4TGLzskFU751Eg80W7GcSVHIkaBq0ADQwdswL1kEuqGnmlAXzu0NkyttOo2vtra0Q7Qdg281CS5Vo1SKXer25olh18N84Q+SgGp5Mt1TZuIwYiYx5TgfFoHOIUqf9OpLHXMwLYHOetc+vLGyZ9PP0kZRNnzGLMg9lrU/1DNKYW18I+UIX2vxazOB/G6RNWey+8ljwtIRQ/L2oAhiBMysX9oIsaOPwEqLoneISS+K6YpngM5DoEwv4e+6zaUGML5EEK+Fa+39qYjur9gEsc8T/5GRn2Rxil6EcIJojMQZerjDYTLy3Qne6ys/P2x/OUaXyfLSR0TI4vaz3uaMuPZdaHslrycRt9OTvSbO6CWipeIlH4pZ14u3CwRub2hvy0zD+JuV5w/3tVncok0RnJ0jjHv1wiBi/CB/jNHfVX6tWyk9pQSipjPIwODJhDuCj6hRkjQxH7f6MP/bhDViuBOqqk5oslwrjHmYidjzpz6+2kHD9jv03qFuQbyPEkkQfXQT6JSw67HGLgOF71DaOWt7zKuW6PfXWpX3zegoSWGgWZbDXhzdiSmF1YUV/kxiTNLT+kIm0gi6+JxFdLHXVOZWu/swA3k1+swbCNtiN2Qo15UimvbzY
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e14e0d-6ba3-4b6d-6e40-08dacbae27b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 10:50:07.7049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6+npF7xMC0miNHJiprP4NIuPMFwDcvQp9GuTsQF24h882zPBizFG7bpjtaaluTdU3gAc2pCCW+fykQyTvoYDm32LjheuJuCaKPFFoDOhlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5129

T24gMTkvMTEvMjAyMiAwMTo0NSwgSGVucnkgV2FuZyB3cm90ZToNCj4gSGkgQW50aG9ueSBhbmQg
QW5kcmV3LA0KPg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPj4gU3ViamVjdDogUmU6IFtQ
QVRDSCBmb3ItNC4xN10gdG9vbHMvbGlieGw6IENvcnJlY3QgZXJyb3IgbWVzc2FnZSB1bml0cyBp
bg0KPj4gbGlieGxfX2RvbWFpbl9zZXRfcGFnaW5nX21lbXBvb2xfc2l6ZSgpDQo+Pg0KPj4gT24g
RnJpLCBOb3YgMTgsIDIwMjIgYXQgMDU6MDI6MTNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90
ZToNCj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9kb20uYyBiL3Rvb2xz
L2xpYnMvbGlnaHQvbGlieGxfZG9tLmMNCj4+PiBpbmRleCBiNTliYmUwMGJiMzAuLjY4YWQ5NzYz
YjZiYSAxMDA2NDQNCj4+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2RvbS5jDQo+Pj4g
KysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9kb20uYw0KPj4+IEBAIC0xNDU5LDcgKzE0NTks
OCBAQCBpbnQgbGlieGxfX2RvbWFpbl9zZXRfcGFnaW5nX21lbXBvb2xfc2l6ZSgNCj4+PiAgICAg
IGludCByID0geGNfc2V0X3BhZ2luZ19tZW1wb29sX3NpemUoQ1RYLT54Y2gsIGRvbWlkLCBzaGFk
b3dfbWVtKTsNCj4+PiAgICAgIGlmIChyKSB7DQo+Pj4gICAgICAgICAgTE9HRUQoRVJST1IsIGRv
bWlkLA0KPj4+IC0gICAgICAgICAgICAgICJGYWlsZWQgdG8gc2V0IHBhZ2luZyBtZW1wb29sIHNp
emUgdG8gJSJQUkl1NjQia0IiLA0KPj4gc2hhZG93X21lbSk7DQo+Pj4gKyAgICAgICAgICAgICAg
IkZhaWxlZCB0byBzZXQgcGFnaW5nIG1lbXBvb2wgc2l6ZSB0byAlbHVrQiIsDQo+Pj4gKyAgICAg
ICAgICAgICAgZF9jb25maWctPmJfaW5mby5zaGFkb3dfbWVta2IpOw0KPj4gVW5sZXNzIEkgbWlz
cyByZWFkLCBgc2hhZG93X21lbWtiYCBpcyBhbHNvICJ1aW50NjRfdCIsIHNvIEknbSBwcmV0dHkN
Cj4+IHN1cmUgdGhlIGZvcm1hdCBkb2Vzbid0IG5lZWQgdG8gYmUgY2hhbmdlZCwgYW5kIHdlIHNo
b3VsZCBrZWVwIHVzaW5nDQo+PiBQUkl1NjQuDQo+IEkgZGlkIGEgZ3JlcCBpbiBjdXJyZW50IGNv
ZGUsIGFuZDoNCj4gSW4gbGlicy9saWdodC9saWJ4bF90eXBlcy5pZGwsICJzaGFkb3dfbWVta2Ii
IGlzIGRlZmluZWQgYXMgTWVtS0IsIHdoaWNoDQo+IGlzIE1lbUtCID0gVUludCg2NCwgaW5pdF92
YWwgPSAiTElCWExfTUVNS0JfREVGQVVMVCIsIGpzb25fZ2VuX2ZuID0gImxpYnhsX191aW50NjRf
Z2VuX2pzb24iKQ0KPiBzbyB5ZXMgaXQgaXMgNjRiaXQgaW5kZWVkLiBVc2luZyBQUkl1NjQgc2Vl
bXMgY29ycmVjdC4NCg0KSXQgaGlnaGxpZ2h0cyB0aGF0IHRoZXJlJ3MgeWV0IGFub3RoZXIgb3Zl
cmZsb3cgYnVnLCBwcmUtZXhpc3RpbmcgZnJvbQ0KdGhlIG9sZCBpbXBsZW1lbnRhdGlvbi4NCg0K
fkFuZHJldw0K

