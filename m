Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C96851DA6B
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 16:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323295.544877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmypS-0007BH-Of; Fri, 06 May 2022 14:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323295.544877; Fri, 06 May 2022 14:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmypS-000789-Lr; Fri, 06 May 2022 14:21:10 +0000
Received: by outflank-mailman (input) for mailman id 323295;
 Fri, 06 May 2022 14:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmAY=VO=citrix.com=prvs=11886748f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nmypQ-000783-Gd
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 14:21:08 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3f4ce52-cd47-11ec-a406-831a346695d4;
 Fri, 06 May 2022 16:21:07 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 May 2022 10:21:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6223.namprd03.prod.outlook.com (2603:10b6:a03:37f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 14:21:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 14:21:02 +0000
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
X-Inumbo-ID: c3f4ce52-cd47-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651846867;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=B9InUODRWQcDoXS0uKJOpw+7KpM44wE34j9qY1bUAr4=;
  b=GxgG0++qrW/6ZfL9pCkmDP6TpKO14D9nUpxErTTfjgLNhgS5wBr7IvwD
   fAAEqfWQUw5+QwrWEcc4lZ2qBXFlYMnUlFhrVoTZy0WUtN+hvP83IV7ON
   lfpj9iii6AuzrCyJ7wiE6s86b192e89aVR6Z34vZ5Y6hbLPm+QuqMCfU0
   w=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 70740489
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Dc7z76mlxjEa6TstxpkvYsXo5gyaJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWWTyFM/aDYGCkL4wgOdy1p0ICsJGBnYJkSlBuriEyRSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkW13V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYSjcOOIPDnuUmWlp2TAVsI655/7bYGC3q2SCT5xWun3rE5dxLVRhzEahGv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXupkBg2tYasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfVvvDSLkFwguFTrGIXfY8GpS85vp3/Cg
 TrL5mL2HBdGBtPKnFJp9Vrp3IcjhxjTWogfCbm5/f5Cm0CIyyoYDxh+fVmmpfi0jGauVtQZL
 FYbkgI1trQ7/kGvStj7XjW7rWSCsxpaXMBfe8Ul7Cmdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHaSpaSwIAuoDnuNtq0U6JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNXNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:NFx6fau8z9b4lWnNUzOyk6fn7skCL4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPuftXrdyRGVxeZZnMTfKlzbamDDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjIzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIO/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfqWG0hYczBgNkGmpDq1L8Yqq
 iKn/7mBbU015rlRBDxnfIq4Xi47N9h0Q679bbSuwqfnSWwfkNHNyMGv/MZTvKR0TtfgDk3up
 g7oF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuIIO5gLZvin+9Kq1wVR4SKbpXYt
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDQhpnFojvA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVbHMX6UI17gCKYbUki94KLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwb0BciHzPRwg2fwqaWGLEDQI+1lluhEU+fHNcvW2AW4OSMTutrlpekDCcvGXP
 v2MI5KApbYXB7TJbo=
X-IronPort-AV: E=Sophos;i="5.91,203,1647316800"; 
   d="scan'208";a="70740489"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSNJ3+nleJTjM5lOtt/CAauEzXHvBR/15wsQG66sprAYW/C7t/iJK3Zs1IzMVEjveFP+ZV5MDIgBHcM19C+mnw7YL9FSqrD2aFW6zdQcClk5+DgNQKoJJRECT2EIgyE8ULxPLrU58IrzLR1yQahIsgVyWQrQh4dexmgS3QKXUhGddLwrlye7FR2JDq2O5r8Rs1vB1Z91TGiBFvFh5d4F5Bh0lt+0SOSkNJUSDiGnMO6kUE05JSV0z86+OmgC30kIuweZ1UDLNoIfgRRWiU4Vy9Zr1ouB/Fz8yQCsa3z6wuIUMhFi05eXlccPzJWkaSQa4yIaWu1AcoODAlKRJK5L5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9InUODRWQcDoXS0uKJOpw+7KpM44wE34j9qY1bUAr4=;
 b=U6sKfSLzjIHuMwhRl/A8AX2zKllbbMbz04CrR6nLCrsq75L2buleZb83itsQsLC4QxMoJ2UZcOMEYz6+lHPuHvd6MbzG3AcxZnANF+Lsmkc++LpZ6xm0Dz95wKAXhmerLBqoY9hc3bZCM2ThH2HYaExPPc9S8Wr2dyFq8NbLTyOlonr4Jkf21zQpf/r2vr+vM588XSKbydUODMjT8rLy8SQAhEGkyKPeTDK7pPpF+a+QOIlXJHam0m+dAUMyWCYuDey5hR1eOvNEfOd67p7E9bsNkRJLxZ7MBdiZPMLxVtND8TB+gDadQP/+CyjTRMznfUYdSN2vS/FWycnpHs4Dkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9InUODRWQcDoXS0uKJOpw+7KpM44wE34j9qY1bUAr4=;
 b=FF+s/FzmpUrqjZBaOefMnqePTodUZSeudsjqYML0qQ85WS+XD9wPGkAxj01ydjKKpkZjLpaYJoeugxyGc4jdLU7IAdqAko00MSVxVY3gHdTk/HndodzT0pDJvrx0LYBhrZkNJn3Mfe14bg0UjYw0DeZatZklk2N971HKNJ/s8Fo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] build: suppress future GNU ld warning about RWX load
 segments
Thread-Topic: [PATCH 1/2] build: suppress future GNU ld warning about RWX load
 segments
Thread-Index: AQHYYU55+oh7RWMLI0OTKLhiZzDiLK0R29oAgAAA1wCAAAkkgIAAAJUA
Date: Fri, 6 May 2022 14:21:02 +0000
Message-ID: <5cd22d0d-768c-a0fb-b75b-0eb2c92b8c33@citrix.com>
References: <b3e9750f-4dd6-342e-b550-21bec8da49e6@suse.com>
 <15350fcc-86ad-d42a-27a9-c0cbab091559@suse.com>
 <93722fdc-550b-bc08-3115-e92a299973a3@xen.org>
 <b0208cc5-55c0-003b-1b1f-ead2349ac9e7@suse.com>
 <15d44a31-853a-5f61-2632-6e3faa7083d0@citrix.com>
In-Reply-To: <15d44a31-853a-5f61-2632-6e3faa7083d0@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e18a8eb-5b52-434c-c1ee-08da2f6ba65b
x-ms-traffictypediagnostic: SJ0PR03MB6223:EE_
x-microsoft-antispam-prvs:
 <SJ0PR03MB62238D177126569E597262C5BAC59@SJ0PR03MB6223.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wnUMNkKsn/KvEGU8xCvwXxWbIppM/YXHJPCxUUTv3sT/jBp9P+p8wK0lpzw+yureKirh+dBZBkD8JNOII01KCUErbvt/3uCzdq0i4i2q2AtpNq9PTI6cmHlNtNvSSbfPDOLInA13KzL7JXay+zLJcHoRjeXV2B7aFilwW0eehX4inSk0CwGP7LrSK+TBmYH/YBHvvVbrjg+qk4WY0aAqoDl2OqQFuYZpqnno4KVY9c09pQquu8GxPuHDeejZLOPl8q+210xBb6G6/k777K2QA2QbT/5KEZFqsEI8HLEGhPc00e1a9D5sUqQzuf4NmafYYbA2wi+UVyb5Ww3RSILqnV1PQMlE604mEqO2vOXHPZaxSj70Z1aYB/daaKt3d3M2MnBxkFZScyGs4N6PSVgUBW/IeEJrn/3b+QbK2PdqsP9rqQzj2dAjuaAdpGNo1lrGMXxpLO2DTyupK8K3Wg1aeFmjTrorQ1On8EWtxXo5Dl6/5oBwPR14xI7jnJK8kPnOz/E9b9kvDiHevwMGYpqVHh/pfjBqN4KWbXQZ9511+PieKZZptYcYU5YBsLiTtkPmxgEdxqCQR4Q6+YONRhhmdC78mDtXC1AuHtYLOry8m7vW/ihmOnr6L2t4mlSSRGeLwG+E71pHkSXr2lnkT6KjI9vQiP3H0rttcJKFWDu0KUSTDWRHjUNU2Zfs9Fj1YPwdLPaBSRGe5YLt8ckUvUav16G5YhN+sXJCSb5viVy6DEmyoJHT2GrXQPzmc/LOoAS7PqYr2wnZpfNu3cJDvpBF2A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(38100700002)(38070700005)(508600001)(83380400001)(2616005)(82960400001)(122000001)(31696002)(4326008)(64756008)(66446008)(66476007)(66946007)(66556008)(91956017)(110136005)(8936002)(76116006)(4744005)(86362001)(8676002)(26005)(186003)(36756003)(71200400001)(6512007)(54906003)(6506007)(53546011)(316002)(6486002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDNmNGw2SWwrZU1yR3lIY0dGdyt2Qlk1MUhJTit5YTUwMVFvRTE1WW9TQkx5?=
 =?utf-8?B?YlVEc1d5Y1NJTXRCZjdxVk04Z0FUcmJpQmZNSVNHUXF0ZUttbW1BcG1FR1g1?=
 =?utf-8?B?K3pJM09ocm9NVkZEZzlwQ3A2VnA5SHNxVlpRNUpWUTUxSjZHZHBzV3ZCK3o5?=
 =?utf-8?B?TnpSSnoySTVWc3NPbjE4U1pVV1BVYkxZeGtKQ3Z2SENWMlZINDBlNTFDR3Qy?=
 =?utf-8?B?SUc2U3dURElNbW1TUm5CZEJIUnpNMTJWQi9lYzNDZGduVU5aMmRXaHhmWWo1?=
 =?utf-8?B?ZVllQzFuSzE2OFRDaUxLRUtIbG9VMDdFNUxkUW84ZWFsOHg2SVlrMktYRHR2?=
 =?utf-8?B?eVp3UTJua3ROc3d5aFNhbnczcFhRRCtnQU5iSEVKM25hMlVha2V4S0xWdkcz?=
 =?utf-8?B?bm5mVTZjNHBQamZMaGsvNWxBbjRFRVpOZTVHU0JKbVh4dkQwWHh4NU1IeUhx?=
 =?utf-8?B?djcvdGlkeGEwUWh2a0w2bUFDankyS1J0eitjTGp6Tjh4bm5BV05nQSs4WThF?=
 =?utf-8?B?SC91QXJxRkFDSmhiQ3ZRczJmSGtaclhvQUtjOVk1QU5OY1U4UmtxaHlab0V5?=
 =?utf-8?B?VTdiQUYybTN3Q1pEVXQ1VUpzdFFHd1A5T2pZRjJ3Vkd6VzMyU3paVHhJWVlI?=
 =?utf-8?B?aEw0ODNzVldyZ1lTRnIzbUVuZUVzcDlaODVxOGlxRWdocUgrc2JrSnlOMENO?=
 =?utf-8?B?MHRXSHRJVkprendzcW0vNSsyTDRMK1Q2Tjgyc3crbXdQazdicVhBY0tnTGp2?=
 =?utf-8?B?aFRKeTNYRkxGWWRtZHphZDlhRUU4VTU3a2o0TWhnQzlOYnRRSW1SaHozQVZI?=
 =?utf-8?B?aDR0V2pKcjJ0UlR2Y0pxYWs1SnNZN08xMytRSEpueVEvNFdYM2Z5bmVqSi95?=
 =?utf-8?B?WHo2V1ZGVDYxbC9ialp4MUJBSkZBWTRIUExxUVNJZGljRmUvYzB6Q3JaU05U?=
 =?utf-8?B?UmhLOVNlVXY5NGRLZk9pd1NlMVM2aWRjVGE4MjJFeUZqVGE1MXo2aDhqZ1h1?=
 =?utf-8?B?eDVheTBSQkVYcGk3Z3BRNWRiMG1wbk9tNkQxUlJDOUdsNEZBZWZla245SmdL?=
 =?utf-8?B?MUZVNmJWY2hFdVh3S2RMa3RmT0gwLyswSTl2R2loK1Jxc3MzbGoyaXM0NUln?=
 =?utf-8?B?WnVnWm1zUmVoUm5vb0V1UWt5b1pMVHNWdzRKVWJTdmYyS0RydDhUYjNDTzlQ?=
 =?utf-8?B?ajNNR3JaQUFYc0dUMlRKVlNRbVZnTkVJeDI5ZGtHTGo2cU9aY1RvbmZuTURu?=
 =?utf-8?B?T05lam95TkFUQzlaakdnUXFaV0o3d2dBU2xWQVJJM1JYejZXcVVEQnZJQmRq?=
 =?utf-8?B?bk9sbUNoWnYrUktiYXhpWDJNWjlxRXF3RE9TSXhKNVY3S2ZkWTlabStNKzJr?=
 =?utf-8?B?bWMrempPTVBBdm5lc0c0TnBxU1pSZ1Mybm5sNS8xQ2pOd3U1N0ppQ05aYjZT?=
 =?utf-8?B?Nk11Q1Bwbld0OEQycFVkMUcyZGJCellzMmVESTQ5bDVBQWU4UU9YSDE1OXNS?=
 =?utf-8?B?Q1luQkZTZDNxMnF0c2xZaDJvUXVielV6d1V2Y2lBVVpnekJLYTVuN2EvOU0v?=
 =?utf-8?B?MzJuQkhIcmU3cElHREkwd1drVnE1dzNPWlZMYktjaDZybTJTUWowVkd6M0hE?=
 =?utf-8?B?WVpUUkpTYlZVNldWaTE3ZEFWVE56cnFzcTdxK1BzMWFmWFJmbTFVOE9VdjI3?=
 =?utf-8?B?TXhIUlZVUDhobm15eUYxbXJwaEs4ZTI3aytDY1B0encrYlduekV6d2p3NzF6?=
 =?utf-8?B?SXZKSnJTbVpwVll4ZjZQT3dJT3M2RkRNVkJYdHpSOFgzQVk4VHJTdjBVSDhw?=
 =?utf-8?B?K2VGQkRmZE80Q0FUaE5jTkZtMGVtUVNqU2h1VnNpM3ViUUNoNkZuazhsSlZQ?=
 =?utf-8?B?RWt6aWhoZ0ptK2NnbzZTRVlOYXJzZFdJYkFoWXJnRWxYSUFrd1ZrVlN5Ylk2?=
 =?utf-8?B?czNDYUYzdm1CT0FvVEcvaUVHSTZ6Q1pjeG1FNjIyMnJCMWo1SGJDZGZSVWpG?=
 =?utf-8?B?R0o5QkRPYmMxTnRvWmVvYk5LZCt2YXlIU0VWTTVXcnBybUNhd2pvd2k5WE51?=
 =?utf-8?B?RVFJWDhMSHptd3dDdkgrY2ZrQURLQWRnMy9pRUsvSUx2MTEwbXF1VGtuOE9l?=
 =?utf-8?B?MWtrOHpZaWpIV3htcllyOEN3MDhLZVc5bndhYnp5VFV1T2hjS1RCeVBOUHRZ?=
 =?utf-8?B?aWhOcmRsandDQzdyaHBRRWwwYm5TZnI4T09sb0prZ2ZJOXlleWFjSEJIOXdi?=
 =?utf-8?B?WktkOGtMTXkrV2JNMEMreUZhWkdaMko2TnBTRVhQUnBZWXpxN2VCelJPZytQ?=
 =?utf-8?B?cnFiZlhXY0FCR2p0N0MyREM5RVJpMU9jK0ZDTTFhTzBUK2U4NmJTek90aVF2?=
 =?utf-8?Q?CMyDAfcArZeOlrPE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B9E21A608F0B947B986A27D0C1B7338@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e18a8eb-5b52-434c-c1ee-08da2f6ba65b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 14:21:02.4915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WuJ9I1ryQmsA3QxRael5ZPxmNRlU5StPGTAFz7/UanUzR3Gd2HELxpLf+3pC9o4gyVhKrxVvkWrFzsQxlr9QqOlDASQYvezc7Sp3Ujkid+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6223

T24gMDYvMDUvMjAyMiAxNToxOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDYvMDUvMjAy
MiAxNDo0NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwNi4wNS4yMDIyIDE1OjQzLCBKdWxp
ZW4gR3JhbGwgd3JvdGU6DQo+Pj4gWW91IHNheSBmdXR1cmUsIGhhcyB0aGlzIG9wdGlvbiBiZWVu
IG1lcmdlZCBvciBzdGlsbCBpbiBkaXNjdXNzaW9uIG9uIA0KPj4+IHRoZSBNTD8NCj4+ICJmdXR1
cmUiIGFzIGluICJubyByZWxlYXNlZCB2ZXJzaW9uIHlldCIuIFRoZSBjaGFuZ2UgaXMgcHJlc2Vu
dCBvbiB0aGUNCj4+IGJpbnV0aWxzIG1hc3RlciBicmFuY2guDQo+IEluIHdoaWNoIGNhc2UsIEkn
ZCByZWNvbW1lbmQgc2F5aW5nICJidWlsZDogc3VwcHJlc3MgR05VIGxkIHdhcm5pbmcNCj4gYWJv
dXQgUldYIGxvYWQgc2VnbWVudHMiIGluIHRoZSBzdWJqZWN0LCBhbmQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlDQo+IHNheWluZyAid2FybmluZyBwcmVzZW50IGluIG1hc3RlciwgYW50aWNpcGF0ZWQg
dG8gYmUgaW5jbHVkZWQgaW4gcmVsZWFzZQ0KPiAyLiR3aGF0ZXZlciIuDQo+DQo+IFRoYXQsIGNv
bWJpbmVkIHdpdGggdGhlIGRhdGUsIGlzIGVub3VnaCBpbmZvcm1hdGlvbiBmb3IgcGVvcGxlIHRv
IHRyYWNrDQo+IHRoaW5ncyBkb3duIGV2ZW4gaWYgdXBzdHJlYW0gYmludXRpbHMgY2hhbmdlIHRo
ZWlyIHZlcnNpb25pbmcgc2NoZW1lLg0KDQpPbmUgb3RoZXIgdGhpbmcuwqAgV2l0aCBzb21ldGhp
bmcgdG8gXiBlZmZlY3QsIGJvdGggcGF0Y2hlcyBBY2tlZC1ieToNCkFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCn5BbmRyZXcNCg==

