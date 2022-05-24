Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71EB53244A
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336219.560573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAv-0005eg-FX; Tue, 24 May 2022 07:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336219.560573; Tue, 24 May 2022 07:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAv-0005bE-AW; Tue, 24 May 2022 07:41:53 +0000
Received: by outflank-mailman (input) for mailman id 336219;
 Tue, 24 May 2022 07:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQM0=WA=citrix.com=prvs=1363f17a3=lin.liu@srs-se1.protection.inumbo.net>)
 id 1ntP6G-0003DA-Qx
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:37:05 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b71cd5b5-db0e-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 05:08:01 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 23:07:55 -0400
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 by DM6PR03MB4697.namprd03.prod.outlook.com (2603:10b6:5:187::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Tue, 24 May
 2022 03:07:52 +0000
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0]) by SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0%4]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 03:07:52 +0000
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
X-Inumbo-ID: b71cd5b5-db0e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653361682;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=hNlEnTzWezV0G3prfGmrmRasyQNBCWKc8lZzdRKhSP8=;
  b=FpXPpfVQIEktU559+EpIwmIoGg+5g5AISz25S75GG7WXyZukpo0zMpPI
   7yuaKEz6ht/KdNaUs+tZVbxK4H2I9OOsPpoaJx/si0uRiNeFeBYZK1b9D
   0ZDlGQTBA2rTkIZ/LQJQkZmg1AEHVGxskE5x5N0tLsWQKIy+SBd47nay6
   M=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 71866064
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IVMPDKxUByCouOxiyYZ6t+f3xyrEfRIJ4+MujC+fZmUNrF6WrkUPz
 jAeC2DTMqvcZmameYp2YY6x9E0H7JKEzdNrG1FppCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY124PhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl9sCCe1t1BvP2h7pMdURhVBFlA6J09+qSSZS/mZT7I0zuVVLJmq0rIGRoeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeE+OTvY4wMDQY36iiGd7aZ
 sxfbTtyRB/BfwdOKhEcD5dWcOKA2SCvLWMA9g79Sawf33bs9R5R3J3UN/2Ee5uFaNdYmXugq
 TeTl4j+KlRAXDCF8hKn83upi+6JrSL2cIsIEfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDTNPwQhm5q36spQMHVpxbFOhSwAOQzqvZ5S6JC25CSSROAPQMudUqXzUs2
 hmslsnwGD10mLSPTDSW8bL8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nZslnOL64iJvyAz6Y/
 tyRhC03hrFWgctV0ay+pAjDm2j1/smPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:7926XqowXS8T8D3+Gisv3WMaV5ueL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXcH2/hqAV7CZnithILMFu1fBOTZslrd8kHFl9K1kJ
 0QC5SWa+eAQGSS7/yKhjVQeuxIqLbozEnrv5am854Hd3AJV0gU1XYcNu/tKDwSeOApP/oEPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+wg+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRhOerRfb8y/T9GA+cyTpAV74RGYFqewpF5d1H3Wxa0O
 UkZS1Qe/ibpUmhOV1d6iGdpjUImAxel0MKj2XozUcL6PaJOw4SGo5Pg5lUfQDe7FdltNZg0L
 hT12bcrJZPCwjc9R6NruQgeisa4XZcm0BS59L7TkYvIrc2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFUgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCfefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzve8PcV
 T6ISZlXEIJCjPT4Je1reN2Gzj2MRWAdCWozN1C7J5kvbC5TKb3MES4OSITr/c=
X-IronPort-AV: E=Sophos;i="5.91,247,1647316800"; 
   d="scan'208,217";a="71866064"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQtL2KQHw1b1oa4kYclDU6sHhjd8GWYPD6G8687R7rvEfQ73AY23E9biRuCANFu1fbxaj3B/W0uLVibRpCrDAUQOvLjCAgDdvmMG+k1KPlqQimRalPJiQEmWJvE5Kq+ehlB7vvT8SDoKUiD29N3DX6AmWzJjEZySgmNzIkN+cQgl6ZbmEjKTsOstN2UByDUOCq/xxziR4D71QQsOC6Oy+mgiWPiH42bYbDnPuwbypHQMRtMt5a6/jkMcstEozgq6tfghhPsYfeQy3Aj36P+BjVjGHyatzFKxnhbV6BAPlIJb6kqj9ycTUs0g6oq1JheqV3QfYRbFcBm9FIhwsjGyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLrG1aIGjmGm10Nmgd6WP4qWMEf7/3BJnSd3QIT9hCY=;
 b=fgvG7vdgzS3fTd0jY53jFBE9H45PQcx7qc+y+MyBW81CjMOmCKN0VZlVXPprB6dbQZg3slOnMIgJF0LtorTQ4+w1uOLf0Kubf6M3W+iBID3wzaAjy+LeR8+4t3g1HJVzC93YkkWDAZF5sYN2+sxvMiGNE6RcXayvAHnzQ14r9G3XnpIgzqSKxYi6UGOUuQtCM95wiYm2GtoTDjrFKRUTN7/1fwpa/U1+D4IFw+en++KwtpqLz0JPPEGVWjuyX4QrIgAdNAskoc5FvkjL2dtKOtbglNi0ZIo+SrV46qcixKuB8gOP72N9t0NkeBWVWpmzsIPXvGgVzKNq9EK9+xuTig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLrG1aIGjmGm10Nmgd6WP4qWMEf7/3BJnSd3QIT9hCY=;
 b=qjdDD3GYkQo0rK8wTscBeq70yhayj2QXkfAuzntvN/X6K6V5H/MBAp/sgqN7exHO1Eg0Whe9Yhvo/TZxiXORyMpD4AkZMlWkPu2hUVPrbpTS/a5MMxeNBIESZwNh6f2qn/aafYt2HanzcdttdwWfE3cNMizLgAdv6jy1R3gRbuw=
From: =?gb2312?B?TGluIExpdSCjqMH1wdajqQ==?= <lin.liu@citrix.com>
To: Jiamei Xie <Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 6/6] byteorder: Remove byteorder
Thread-Topic: [PATCH v5 6/6] byteorder: Remove byteorder
Thread-Index: AQHYbrSc++uK2cN+REiJWQQiDNiVmq0tVA6AgAAEzpI=
Date: Tue, 24 May 2022 03:07:52 +0000
Message-ID:
 <SJ0PR03MB540555E8E75BECC3E693F0ED9DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
References: <cover.1653314499.git.lin.liu@citrix.com>
 <1b9957326f5018c38ce6c523e3e5ab67f012ac00.1653314499.git.lin.liu@citrix.com>
 <AS8PR08MB76964EE6490531DFADAA07A392D79@AS8PR08MB7696.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB76964EE6490531DFADAA07A392D79@AS8PR08MB7696.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15575864-f835-48ff-6de2-08da3d32976e
x-ms-traffictypediagnostic: DM6PR03MB4697:EE_
x-microsoft-antispam-prvs:
 <DM6PR03MB469733DC63D6FFF704930A359DD79@DM6PR03MB4697.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 52L4F7qU++IIbg8p1fVY8UqKHYGVO91ngVJt7/ijmCEUfzhAZ5O9l3zHJWvMpYMssF7q2HMWIcEE0zmfCtWcNdaqnUGPWYOJ6ZI10sgXARUVkSP14Hp/bAxc+2GpjPXA7wqrEGvHhg9QcEu4dwja38z9OfStf/nJNIMFtA0AamczBbSWjmdbSPM2IZISXFvL2Fs2pU9WyFpp1aHWszqs6c9xZ0qWOxeQoZUaGCVgk8dAAVxKz6dJpFkn452XtnVgI6j51taL2dt/z9lP+wLH5pR5oO9oR0FijGmokom+KMpFA15ttDu3SqsRQ/22MJJl3VC0vbX2LUck6qw8FI6AOWketbArOZ6H4YDSI0JvBoXUDazxSICZ3m1ygfjIqEdscaVuit8YLfmcDzZRYf/c8m0MOuHXtobLYMN2MMEO1Qi6tAVaFw2xHTIm2Bp2ig2lSIWnhBwSUFyIJpEwDjVPIurEiGJv7Y9ULTVB0Elm3WBhaA5bEFG+uM6ch8bttIc2BTvrvmwSlJdGQ3dnPuZ5nlCBVzD3BvDroXAnkRmJxNQXDXEpSCLcwt68edxiTUxo/RJMmE0bHbGcCLl947mPE/NoQJDitpGTjsMpt27UcghylrVIEPTD3YN8X068uvSqKKeR5JxHDl38Eac7BvBhrEjWv+IybWig/gWd5cECVBIDF/tRSR+z+rI8rATd4pcQUOTeBdlcfU29uaAe5+1tvw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5405.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(316002)(5660300002)(55016003)(83380400001)(7696005)(33656002)(38070700005)(38100700002)(8936002)(54906003)(186003)(52536014)(110136005)(2906002)(66476007)(26005)(66556008)(82960400001)(64756008)(66446008)(86362001)(4326008)(76116006)(8676002)(85182001)(66946007)(91956017)(9686003)(122000001)(558084003)(6506007)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?cVVLWlhxOVZkTzVyL1ZrRExZdDhJYURYL1BkOFQrWWoveFFOMEdHbnczRkNh?=
 =?gb2312?B?K3o5cEFtRFdIbGRHTk9TajBCdmpJcmFqNmg2QXROd3Bhd1hycUZGRDhSWnEz?=
 =?gb2312?B?MmxIbklXNFJRSGtYc0hUTmQyNGQ1MHZNd0Q0Q1VhNFNjME1qZ3QrUEFxWVNJ?=
 =?gb2312?B?WmVpbElvU01pTWx0ejk4dDFXTG9mYlZtL0wyR3lrSnduYk55V1JhM0lhNGdw?=
 =?gb2312?B?anpwaEFYVTJIY1krYVNQMktIa0pDdWY5SmJGeTRzWmdNcW5IbDNSQ21iQWRj?=
 =?gb2312?B?Y0hBZHR2TWtCSnFPNkR6cTRlUkVmZXpiRzhZbnNwTm9mK2NScFNseFJiRW8y?=
 =?gb2312?B?QlRXOXJEanVsVHlTQU9iV0h5Y0pLWFU0NHJjM3RwWEowVVdQTWlPNHoxUnIy?=
 =?gb2312?B?c1NBNUxCa09rWHVjVE1nMkcxVWwyWTNTMlRWSXJod3NHVjlUcXJLM2xFUkJ0?=
 =?gb2312?B?STNFR1RoalVCd0EySGQrZ0diQnlzRzdoellYemdTYlNRN3RuWkd0MXE5d1FF?=
 =?gb2312?B?VVdzRks2OTBmcjNIRXRSdENyRlF6VDhtM0ZmT0lNeExNUEFzaUZEc2pvNE9P?=
 =?gb2312?B?Q0NmOFgwdVdiaGNFc2pHZDA5YVJqQ0dyZjJ0cTNEQmJFWklFMC9QVHVRSkhI?=
 =?gb2312?B?dnR4YklUQWNUUEdEODdxdmxWZHhvaFBpZ2RNM1R1OFl1VXV1eDFlMTFXVzZp?=
 =?gb2312?B?Tjc1aU5ZYmdjMVMza1RPWnErZ1dqcmFkZmpoZGJ5ZTl1UFJqaVVpZEEzUUxj?=
 =?gb2312?B?V2RqTmp2K1MxV04zS0ppNGlDZWpYdmxOZUtJc1g1U1U2OXArOXVyNHBMU0dW?=
 =?gb2312?B?c3dzQnZSSjJzSkhyMGROcjdhNCsxQ0hGQ1drWkdtMlVZbkpHN0pQUVBjQjNC?=
 =?gb2312?B?L2UvNzNUTGo4cy9Ca2M3RFUyMFQwQ3pBME9iRHhjc21PaUZia3dxenJaUk1I?=
 =?gb2312?B?R3JhK0QrV3BHR1lTbmNMY0dSZWlBQ0lBbWtSVGpDUDcvQVNQZ0RodHduYnRk?=
 =?gb2312?B?RHA4WXNTTTZldTVlNXFoU0R3R2o4N3J3aDlwUTZ2TSsrOCtOR2c3Nkd6WEdi?=
 =?gb2312?B?KzRXMzZENDc0TDU5Q1BFYjh6NXRxT08zOUlTRDhFRUhEejI5bGo4ZGNPaFND?=
 =?gb2312?B?bzJCV3RDSDdpSFMwUEFaZmpaSyt3eURKeFFRYnRKb2dlTEdmUjBCVlVPSVkz?=
 =?gb2312?B?WXVoMERnOXMyejJWbk9ZRnpON1J0emVHQmJxa2VVcUYxWnZDY2tDV0w0alRU?=
 =?gb2312?B?YXVRZHZoVmV6emsyY0NZRmc4TFpGWDIxVlU2cjR1TjhZYTJ0WFFraGZJYW1G?=
 =?gb2312?B?UkIwRnR2L0lWOCtqc3JoeXNiUVhQZ0tBamtvdGk5QmxQUlpEdThlOWJjUDcy?=
 =?gb2312?B?QkVTakFibzZLRXdNK0RLdFluNm1RbGtQWXNzT0VOZkp1akJUY003REo4YlpH?=
 =?gb2312?B?ZmZMOVhoSmFISEFFY0FUakxPVDFzdC9WRWkzNXdzYW53akJhRTRmQ0NCME9k?=
 =?gb2312?B?eGZuUjR1cjZnMVd4djBCQXZqR1ZGRDZRLzNmdlQxY2ZsV2VDek5JVmcvY0tM?=
 =?gb2312?B?aWs2ZnVxbWgwSnNBc1MwS092TzdwdW4xbTBIOTlRU2NlZzZtWCtaWS94ZXll?=
 =?gb2312?B?cENHVGFwaG1ERlo3ZmxsY3VBZkdzU0h4N1BqL2Y0cHBtNHh3Q0pEM2lJTFU1?=
 =?gb2312?B?TUZQNHFDR283S1JSUmtuSzZkbzlKT0NzK01QVDQ2QktYNENBbU9GczB3cVJH?=
 =?gb2312?B?YkY2STNmYzhZRytKMWlPSTM2VEhFSFJaOUFreEFJZkoxL2tObWhuWU9xQmUr?=
 =?gb2312?B?N0lKMTZGaS9MdERQUjh5Um85dVBmOWVoOGRtcVVhWmQrY3JLUFRQdjgvWlJQ?=
 =?gb2312?B?dCtvQlR0d1g0alorWlduVUdXQmtiajQyejZ0dGxGTTU0UElRK1pUUnF4NXU1?=
 =?gb2312?B?QjJSY3EwWmd3cWpDcTlYeHZMYkJkclhkRWVHMUU0WDR6MlRTbVhFNC9vU25L?=
 =?gb2312?B?S0plaGhvcWMwLytLbWptSWtwUHlKNk9lSkdHSEpLamtSbG50dHR2czNJczFx?=
 =?gb2312?B?SFJVcTdaQytmbGk5cXk4MVlVTEw5cEFxbjI4cXd1S2dqY3NSUG02SDZFNU03?=
 =?gb2312?B?bzk5UmdqbUs4TGZBSjh4T3ZDS3RZNG5jMlJwbGFZR3BsVHNOU3JEb2FJTEZK?=
 =?gb2312?B?K25CSVBSYXI5QUJGZ0VtcWF2SGpGWEdaTVlvNHBaZW9qSjA4cW9BOXVXV0VF?=
 =?gb2312?B?L0xUQTJ1LytVTExZTVhDaTRxUDFpQkdWT0FaUzZFRWJrbEVOVXd2NXFpTE4x?=
 =?gb2312?B?OTVRZmJwMy96dFBlYVVONUl4ZHE0RGNwNi8zNjZibTBoWmMwM3QvY0I0SFBI?=
 =?gb2312?Q?BIPh5N/6AogdvASg=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR03MB540555E8E75BECC3E693F0ED9DD79SJ0PR03MB5405namp_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5405.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15575864-f835-48ff-6de2-08da3d32976e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 03:07:52.4133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5gD+7uCyMVFFLTfqTrB4dhZgxJck1GEBj7hV1vsWK+x+3ke4IYxgiT/2Ww4CuHXVyuzMmd8yyxNbtiMLV8KOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4697

--_000_SJ0PR03MB540555E8E75BECC3E693F0ED9DD79SJ0PR03MB5405namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pj4gU3ViamVjdDogW1BBVENIIHY1IDYvNl0gYnl0ZW9yZGVyOiBSZW1vdmUgYnl0ZW9yZGVyDQo+
Pg0KPj4gaW5jbHVkZS94ZW4vYnl0ZXN3YXAuaCBoYXMgc2ltcGxpZnkgdGhlIGludGVyZmFjZSwg
anVzdCBjbGVhbg0KPj4gdGhlIG9sZCBpbnRlcmZhY2UNCj5UaGVyZSBpcyBhICB0eXBvLiAgIHMv
IHNpbXBsaWZ5L3NpbXBsaWZpZWQgLy4NCg0KVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dCwg
d2lsbCB1cGRhdGUgaW4gbmV4dCBwYXRjaA0KDQpDaGVycnMsDQotLS0NCkxpbg0K

--_000_SJ0PR03MB540555E8E75BECC3E693F0ED9DD79SJ0PR03MB5405namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; Subject: [=
PATCH v5 6/6] byteorder: Remove byteorder<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; include/xe=
n/byteswap.h has simplify the interface, just clean<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;&gt; the old in=
terface<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt;There is a&nbsp=
; typo.&nbsp;&nbsp; s/ simplify/simplified /.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks for pointing=
 this out, will update in next patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Cherrs, <o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">---<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Lin<o:p></o:p></spa=
n></p>
</div>
</div>
</body>
</html>

--_000_SJ0PR03MB540555E8E75BECC3E693F0ED9DD79SJ0PR03MB5405namp_--

