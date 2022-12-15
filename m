Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1564E181
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:04:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463720.721964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tW0-0001RQ-Ro; Thu, 15 Dec 2022 19:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463720.721964; Thu, 15 Dec 2022 19:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tW0-0001Os-O3; Thu, 15 Dec 2022 19:03:32 +0000
Received: by outflank-mailman (input) for mailman id 463720;
 Thu, 15 Dec 2022 19:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cY1j=4N=citrix.com=prvs=3418b2cde=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p5tVz-0001Om-TL
 for xen-devel@lists.xen.org; Thu, 15 Dec 2022 19:03:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2808b271-7cab-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 20:03:29 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Dec 2022 14:01:57 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 19:01:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Thu, 15 Dec 2022
 19:01:53 +0000
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
X-Inumbo-ID: 2808b271-7cab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671131009;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=V3VKcMjIRGEKJPNQ+6p7LEBzYz+1/d2gpKP1yVXlq+o=;
  b=WunkK9WOvrOZB4V69RJB4hWDLavdE4TxSSnknSAqRQBs1L0Bm+iz1MFC
   WppBM+0mAl7PLUYKGEOJ1fHTtg0eTMAglvRkXjLJOtshJYxvygufPNj96
   YoZUmZLNFXodW0eikddtWhLJgiFgDXEmOugQvpciu6e5+7hb8+e/jCWPW
   w=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 89010806
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cKBSjqwGu74CqouuyQR6t+cWxirEfRIJ4+MujC+fZmUNrF6WrkVRm
 jBKXGiGa/yPMTf1f9l0aY3ioB5XuMLRz4I3TVFlqCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPK0T4TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWwe+
 swJFgsWVyCKrLip2+j8RtY2mdt2eaEHPKtH0p1h5RfwKK9+BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVQtuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAurCdpLTO3gqJaGhnWB5zcCUz4QfGLmiuOUkW+Oe+gED
 HQLr39GQa8asRbDosPGdwO5unOfvlgfRt9ZCcU+6QeE0K2S5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vQzt1v9W9S32H8ayPhSivIiVTJmgHDQcGUA8E7t/LsIw1yBXVQb5LF7WuktDuBXT5z
 zWLqgAuirMLl8kJ2q6nu1fdjFqEuJnPRQMz+kPYQ2O58gRlTIqkYYWy7h7c9/koBJ2FVFCdu
 2NBl8WAxOcWSJWMjzCWBuEMGriz4LCCKjK0qVdrEoln/Tmr/XOuVYRR5jhkIwFuKMlsUST1b
 UHavwQX/4NaNnauaa5xYqqhCsAry7imHtPgPtjRZ8ZOY5VsMheA/TtvaFS422HrmVIr16o4P
 P+zdMevADAaDqBiwSGeQ+Yb2KUsgCckygv7QpT2zA+7wKGeTHGQQLYBdlCJa4gR86essAjTt
 dFFOKO3Jw53VeT/ZmzS7tQVJFVTdXwjX8mu94pQa/KJJRdgFCc5EfjNzLg9eotj2aNIiuPP+
 XL7UUhdoLbiuUD6xcyxQigLQNvSsVxX8S1rVcDwFT5EA0QeXLs=
IronPort-HdrOrdr: A9a23:+TIrJqmZ7R6X23mS3KbZrpbuhBDpDfIc3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBED4ewK4yXcW2+ks1MaZPTUO0VHAROsO0WKF+UyDJ8SUzJ8/6U
 4PSdkZNPTASXR8kMbm8E2ZPr8bsaC6GXmT9IPjJqFWPGZXV50=
X-IronPort-AV: E=Sophos;i="5.96,248,1665460800"; 
   d="scan'208";a="89010806"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drF4pW9k7T5PE2i+hP4+P9gDpcUe0a538AirmpLvlJ6m9IeX6zSiXETQJ0uGrXqNyqyFxxaaAWsRNSaDs0I0Uv3gcchAHFbfGHP+zXSnwX9otCmdnftZmBNAbzyh2MtAFZpbnOeSSvFJicB3WmEqp5fWmoME1rHz+g2Pb/et4p2eHGZ7592BgolfDFHw+o320yoFpVuPxnbNnhRCxAW4PVgg1JyEDUipHA1x8mHNHunDpGru1c/3vqFxB1ClYvwTp3AKxSDMOtGcfM/KnAGSL6wxMdZRJNOpHXjYHWY2agSpqembUPa0ZIutOMejXULSWvjy8owS7wb9lUds/1fKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3VKcMjIRGEKJPNQ+6p7LEBzYz+1/d2gpKP1yVXlq+o=;
 b=JrNj/hYrw5PPNJxDEBLYBi74mnA3hoRcK6joq/TgDJBdT7Nj4BN9YtQDUItVlDGXlyF+JMxCvxhIKyzKnu6gOoHP9W+nttcg3NWiiQHZ01I9uIty15EHDtuDNldeiMVxsr0iFkIRKbSHlVLwqiodVumNJFdfCh6DP1zUAA8PH7SgMvxoR70pF+EmZVVdhXVP39BgSWPTeh1nAbU6kYgCoR7ju/9TKakdMSXvqOypTEbcYBDEOieE4Ri1hW3tb74RREYx9P39Yw7ewtEdeNOu5WxqeGi+Y5pIvc4a+OQyAZH/GSwwqQq41RG4H6dvVtJdHWGaK80Jvh6wemyAV/i9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3VKcMjIRGEKJPNQ+6p7LEBzYz+1/d2gpKP1yVXlq+o=;
 b=FqeMScFEaPKg/9ZBR3+dMkKgaUSKA4Y+a88BlzcmRZbQNv6QzI97xSqrXcSD6L3gFIUOXhHV57uYIBjzksOYd48aO+qOxn5VQBmqrMMAxFmYRlGOPFSG6ftXZDwLXnBafP4WxMFOQ/deLO8bPxhzxTXb3aF60R2aEgCpMXE6uMM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, "xen-devel@lists.xen.org"
	<xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
	"osstest-admin@xenproject.org" <osstest-admin@xenproject.org>
CC: Vincent Guittot <vincent.guittot@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	=?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Mathieu Poirier
	<mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>, Oleksandr
 Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Thread-Topic: [PATCH] libxl: virtio: Fix build error for 32-bit platforms
Thread-Index: AQHZEIm2pBLpcrFxWUiesl94gtQKma5vTk+A
Date: Thu, 15 Dec 2022 19:01:53 +0000
Message-ID: <56f0e148-0e9c-aac7-ce22-7d2fd1158de2@citrix.com>
References: <aab5f13a-782b-cb4f-ac8d-321f865c8281@xen.org>
 <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>
In-Reply-To:
 <d4cf6539ff179e7ade820feadd8088f33da49196.1671111056.git.viresh.kumar@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN9PR03MB6201:EE_
x-ms-office365-filtering-correlation-id: d275dd68-d38a-4971-16ac-08dadeced4b3
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 83fv9Uxv+ujT5O6ECuZPh2sNtbTuaOyGi4yfuhTBeiVOwB7uxhsQCqsxKDfuLcuLYF9dFoeJ/0VCcQG4ASPen7LWrsZZziPtAoLua9OqziXIhqQDGOn5M0KQmSKe0gAFodjnHdw8LVeGcfWxovaSfH9qcBafuCR0nvkiqcAwHI9UUeZUCA94SaeHrraGMpybwL218dlzCcEupbqKLyCWYsasr1wY8CG0KT5XdxcxE02pjQvXDEncbXSgB1DhTgoCzPqUz8KoqXu8h1lgVXjQ1ou1CLdr9MOG+y0liXnm8Ziogf4Uw/I+k+7KUXu74qyGXrVLLz5sMj8KiM36OkN7IFph7LIy99jq3nuKELfaP69CFK2G4L7+Eb4aIcms6AleiK0ntnJwkcJ7Ol2uHyr86eN0FUuRemnOFyySmQYNRUNpOS7xhlS3Yz/Cto1ZNWeAbYK8epZrPMRpmtAxhfaZtSYFFauAI254NYHiNDZoYE7IpCVqHF60KDfutmVapdelT+5Q/rlPXlmamMZWJvGA4nrIA9K1Inx1Q4k1EwTwnNNT/7lu1e3KPUxKwg9jXGa9OCP63VsP8FFfMvSvp0fqF+AB5HIpSDGHAo1rQTYafs9iJ8rD1AHc5nibUN/rbQQ/087kzVzQGLKzZPvzI3Y3dQIAh2HsHSd/4z2XceH8KzxvqiX6Q5StCnpPq+IxGggSiwqKd95Q1R0LnNTdOtsuMHslLjpP8BQ0o8n7CthGi9Mvqdaf8vGVSl+RI5rvH7zM/VQ6W0jPGN0W13fYiTGDnA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(31686004)(71200400001)(6486002)(478600001)(53546011)(41300700001)(2906002)(86362001)(6512007)(31696002)(6506007)(36756003)(5660300002)(186003)(26005)(8936002)(38070700005)(7416002)(38100700002)(2616005)(82960400001)(316002)(122000001)(8676002)(4744005)(83380400001)(4326008)(66446008)(66476007)(110136005)(64756008)(66946007)(66556008)(76116006)(54906003)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWpZSUNOeUl1a3BWODBoU1VNUE1lRndTM1ZscWQ5c3JtMXJUNHRCSHh6MkJ4?=
 =?utf-8?B?ejBpYlNpT0FKTE5YZ1lXeWRiTk16Uy9oangvazNaR3ZrUldRalVILzRPS3E5?=
 =?utf-8?B?bVFEb3o1dUV3bVFla1BZOWNBallZZ2tpTDUrVmRZRTgvODRYa016T1hpN2xw?=
 =?utf-8?B?UUtSdzdLZm9kTFhIVWtZTDdsbXByQ01wdW80SFVkcGNpb0Z2bVlDWndBdWZF?=
 =?utf-8?B?Z1pwTmNEeVdSTFgxcGwzbkp5Q1ZiTXM0QXdxNEpEcElNeFBJSE9WNXhXQkRp?=
 =?utf-8?B?MVV5eXhCM2oyTno5aTNkUGpINWVzNFpBVFcvbU5iV2doQVM1K0VXRE5iQzNm?=
 =?utf-8?B?Ni9YaWg3TmZiTnJzcGM4U3pWWENqT2tURHp6M0hWVEVZdTRzOHpQZFBScGwv?=
 =?utf-8?B?V0ZlTDdocGdxTktVR21yQ0xxWFl4VVNLR2RDN1RLZytIdE5xNGxqVEp2bWVT?=
 =?utf-8?B?YkZqUUVUYzVVc3lPRDRZMXpITTUrbDZBZnZZTzJSWjg0RVhlZ3FoakluYTlI?=
 =?utf-8?B?Q1drdUJLMkplZG95d2hiQ05qSVlFN1pGcG4rZCtuWGJZVldNNlJ4TkhoM1pC?=
 =?utf-8?B?azcwOVBmdWxLWkVBWHo4VWxmZFdzWCtRcUpPYUw1ZVk1S1dnejVuWHgrUFU4?=
 =?utf-8?B?dGVKeHlWN0p1QkVyUEpQMGZTZnVuNGxrdjJmdSsyZkVseDd2NnhtZnlkMlhL?=
 =?utf-8?B?VU1hUFYweWVXWXIxOWxuYkpHQTNGYVZmdE9idm94c3dURm1UbitWdkJ6eXhs?=
 =?utf-8?B?RkJqUGFVUjV1V08xN01JY2RCTWQwYWFRTU9xTmpONGNJL3FnTVhYZlZYS3Vn?=
 =?utf-8?B?OTlvMDdGUyt2YXBQdUZNemtITE96UDAzYjlhcDkyZUc5VFB2aDNwUnBLYlBK?=
 =?utf-8?B?V0hpUFlhWlZiYTVQWFRjdUtaRWZGZHRWdUZpUUk0NGVSd2lCQXYwanIycVll?=
 =?utf-8?B?Tng4clk4bzB6V2JlRmNGV2NsVFJESUxueVQzR0FFVFlPLzFoMXBwdjZZcXZm?=
 =?utf-8?B?N0VOT3lKTktFUWt0M2Nldndud3BnbUtMN05VTnZzeTQyc3g2QS9rRHN1QVBB?=
 =?utf-8?B?TTl1S3pDUU1UZlVUZWxNdm9kbTJGci9QYTRmaitHQmpiL1U5RDByR2N4c1Rz?=
 =?utf-8?B?cDlEbUplUTh1NkowaGEyT3JacnEvSUxSUFZjQXRtK1Rtd01WbnRqcExSbWhN?=
 =?utf-8?B?Q3BQK1V0R3JpdDVVMzNTdEp0dEJTbDZQNnZDMTZXTzRRQUxMaGVrOTk3ZTZm?=
 =?utf-8?B?Nkg2R0VWRkIyRzlnbEV5cVhINmNMbG5ZNnJhYjRyNTlzY2dpN1dOV0hzaFB1?=
 =?utf-8?B?eE14N2pqRlIxR0ZneHE0di9iVjdRd28wcUthT1l6NVdTK01vNCs4SWpPUi9C?=
 =?utf-8?B?YmNpUVphSEZYVXMwVXZRSmdHT3VXZkpBazIzbG00RlJCMk1LdVJNYWlqRnZG?=
 =?utf-8?B?MGRVVjdCaWx2TzJnNUVGUHBNNFA3QzdXdi9XelhkSmZDOW4rRTM0VXhrbUZ1?=
 =?utf-8?B?UktBYmlabDIxZHpPVGlVczgwNi9IejZjSkkzNHdDdFQvR2Z0b0NGV24yS01w?=
 =?utf-8?B?cnorZElZY3FSMjlIMGF4QytKSm5nbmNPQmJIT1NaZ1hRUGFjUkZETllqeDhx?=
 =?utf-8?B?VzJJNGFaZlduSVYxZjRieW8zY2hhRENhWGFrbFVyZXJjd2VobCtXZW1neDZR?=
 =?utf-8?B?Z21zRWZURmk4cFNtcGlIVDJqYnp4NE1YYjM3dFdycnJ2R25pd2FpNzRyQTJq?=
 =?utf-8?B?Rjl5WU56ZUVaZC8vekJpMmwwWU1nNUhGRXN4VHhucWVLYzJEVU5mRW4rNnhJ?=
 =?utf-8?B?dnI3cElkc2lVUUI0eWMybklwWDN0anFweEIwVm1aQ0dXcTFsY2hvNXBxY0s1?=
 =?utf-8?B?b2hHZmd4MmtUaCtvS0JUUU53OU9FUmJFQ2VtN0hWejdtZjhlT2NMSnhOS0JQ?=
 =?utf-8?B?YkRuOVErd0NvOEk1bWlOdmE1WEFVRWgvZHhzY25lNm1XKzNCWHlwSmhGdGdY?=
 =?utf-8?B?OXdqOCtCMkxDK0hTbEd1V3ZISWp4Z0J5QUR5UW1ObG9NcjJlK25ISXg1dmxB?=
 =?utf-8?B?U3RUZVRQSDNMaEFUYTE3djJ0TWFUMmVQcElyOGNvZCsvOHUyT2tyOGIzNkdt?=
 =?utf-8?Q?Q1ZHWMFcrbmJ4Wao85m8LXJHT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6318BAF61830E54B8039522209C0EF3B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d275dd68-d38a-4971-16ac-08dadeced4b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 19:01:53.9013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pic6fsjJtlsX38j+C4kMP6VPOojXbBUrVTVGnvnYujulcxbzyxegheTc6oFK4U0j1yBaJGudhn6pd3G5o6X1mGtvLluhwVi50KYgs3xhzNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6201

T24gMTUvMTIvMjAyMiAxOjMxIHBtLCBWaXJlc2ggS3VtYXIgd3JvdGU6DQo+IFRoZSBmaWVsZCAn
YmFzZScgaW4gJ3N0cnVjdCBsaWJ4bF9kZXZpY2VfdmlydGlvJyBpcyBkZWZpbmVkIGFzIHVpbnQ2
NCwNCj4gd2hpbGUgd2UgYXJlIHByaW50aW5nIGl0IHdpdGggJyVsdScsIHdoaWNoIGlzIDMyYml0
IG9ubHkgMzItYml0DQo+IHBsYXRmb3Jtcy4gQW5kIHNvIGdlbmVyYXRlcyBhIGVycm9yIGxpa2U6
DQo+DQo+ICAgbGlieGxfaW50ZXJuYWwuaDo0Mzg4OjUxOiBlcnJvcjogZm9ybWF0ICclbHUnIGV4
cGVjdHMgYXJndW1lbnQgb2YgdHlwZSAnbG9uZw0KPiAgIHVuc2lnbmVkIGludCcsIGJ1dCBhcmd1
bWVudCAzIGhhcyB0eXBlICd1aW50NjRfdCcge2FrYSAnbG9uZyBsb25nIHVuc2lnbmVkDQo+ICAg
aW50J30gWy1XZXJyb3I9Zm9ybWF0PV0NCj4NCj4gRml4IHRoZSBzYW1lIGJ5IHVzaW5nIFBSSXg2
NCBpbnN0ZWFkLg0KPg0KPiBOb3cgdGhhdCB0aGUgYmFzZSBuYW1lIGlzIGF2YWlsYWJsZSBpbiBo
ZXhhZGVjaW1hbCBmb3JtYXQsIHByZWZpeCBpdA0KPiB3aXRoICcweCcgYXMgd2VsbCwgd2hpY2gg
c3RydG91bCgpIGFsc28gZGVwZW5kcyB1cG9uIHNpbmNlIGJhc2UgcGFzc2VkDQo+IGlzIDAuDQo+
DQo+IEZpeGVzOiA0M2JhNTIwMmUyZWUgKCJsaWJ4bDogYWRkIHN1cHBvcnQgZm9yIGdlbmVyaWMg
dmlydGlvIGRldmljZSIpDQo+IFNpZ25lZC1vZmYtYnk6IFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1
bWFyQGxpbmFyby5vcmc+DQoNCkluIG9yZGVyIHRvIHVuYmxvY2sgT1NTVGVzdCwgSSd2ZSBjb21t
aXR0ZWQgdGhpcyB3aXRoIGFuIGFkanVzdGVkIGNvbW1pdA0KbWVzc2FnZSwgd2l0aCB0aGUgYWdy
ZWVtZW50IG9uIEFudGhvbnkgb24gSVJDLg0KDQp+QW5kcmV3DQo=

