Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D958FF00
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 17:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384686.620116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM9tV-0005Fe-Kx; Thu, 11 Aug 2022 15:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384686.620116; Thu, 11 Aug 2022 15:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM9tV-0005CX-Ho; Thu, 11 Aug 2022 15:14:45 +0000
Received: by outflank-mailman (input) for mailman id 384686;
 Thu, 11 Aug 2022 15:14:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oM9tT-0005CR-Tp
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 15:14:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52b308a3-1988-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 17:14:42 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 11:14:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5476.namprd03.prod.outlook.com (2603:10b6:208:29b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 15:14:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 15:14:30 +0000
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
X-Inumbo-ID: 52b308a3-1988-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660230882;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=F8QbVStJbbXhNlRh1IYjoMyM2nlhFITFfeMmdDXnPLk=;
  b=cX0Gdo8XR1fPZIRJgSa5VwRkiYsfQihybhq3Sra2Yd0Zt8nzgXdlT8wJ
   j1lSlBhcsdBQkcAS4mSW3zty9CSubT7x4YMS32xYMauA0ymMn0AE6MhbO
   hQijlHBusW4nrxZ3E6LlewndSxKvIUI90TGjCj7pgr90payL9HjMm+Trc
   I=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 80439421
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:C2cImKtKMNqn0LKl7vXNaI8aHufnVE9fMUV32f8akzHdYApBsoF/q
 tZmKW7VaPnYMGakeoogbY7j/U5S7JTXndNkTlNrqi88RStG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyi4WpA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FbNCodZvUVtgy
 fkdbxQMTROqu/22/73uH4GAhux7RCXqFKU2nyg4iB38U7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9QLT/PJti4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91r83rOUzH+hAer+EpWB5NV7mWKq/1c4UjwNCF2dnMaczWyhDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHaSpaSwIAuoHnuNtq1kiJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:njNd/aMXseDnL8BcT+n255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4k3Ez5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy+IiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ/+1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh77D3vXklVavoLhiKr7zPI9
 MeSv00I8wmKG9yWkqp+lWHBubcBkjbUC32GXTq8fblrgS+1EoJs3fwgvZv3kvovahNNaWtrY
 7/Q9tVvaALQckMYa1nAuAdBcOxF2zWWBrJdHmfOFL9Ccg8SjvwQrPMkcIIDduRCeo15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA849THNfHWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXI3gDV88evMo9Rju104r2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2P8lE5lDDYA6NvPEQYQKZRqXSx+MBLEGBxZlj9GEkDPw+jiEFzVKk+8qMNTpO9qQrYU
 oWGsKUrp+G
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="80439421"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhN5if/v2K9L5NNbUA8neIaAEsjzYeEhpqKLNKfGvBPDy+Tqt8bB6HPRertIXeDv3qWd2pTp1AhxcNcaDdHdMMkBJxeRaCZlmoug6eFONDBONY2HdCP39I8cjRA/hUoM9DCT+AC23rxHbQW8URhOTLO5NaUg7x1mJ814/HHO/kP00tgy32XJhCcfeTNBP845ysXaIpRLXJJafOeDks2PreCpX7fY8rxVPju/n/Z0uJZU4aFbZ+tR3P6UUb6koBgrOOayowlJDdSCSo0ejtD4Xb52jJjdBsl5RYcwo2d2dbJOIIs06WN0WN6ZQJ1Ou9msiquwBLZLOhSeVEdlpLTtGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8QbVStJbbXhNlRh1IYjoMyM2nlhFITFfeMmdDXnPLk=;
 b=ZAfGR6kddviCj3xcgT4jUg+iWbXFFX8hsjIET1Kqkp7IlknLl8crQsDYTbgyx4SWB6kvFaYa53VDofAhkjebsJIWXBtgeyE67YL1lpFNEY0Eld5fey2OWG/6e0mrl25UBdO43zgVW1qL+PMzrIlio5AH9JqS1/H5dstBCuaEifMzL0bLxFsIOIPX+VJZ3kwcf0sE0UQSUp3JEyhjP1hVboJNXY18VFyePCzqIwZI2A4rsCUuv+qBFv9yq3vzBbNFxGE+KHor04eWKeAFzvJ/+5kgcfyx5pkOn49bbGKejEfSy3Okn/J3Yr5GNGdwAHJ8RorLj5oAuJW/nSB6Z5/NDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8QbVStJbbXhNlRh1IYjoMyM2nlhFITFfeMmdDXnPLk=;
 b=Lez3y4gULUe2j72JPBMUVJPjDOtxQPCCkm7tucAETy+DX57WpuV0AoKig41adZmAEsb6wXYXR2hrvfEqtACqAFBehjGZCtWtIr/zKc4pD3d9jDdZv0ofpFG79Lh+q5eJVxpCuwW8OC1JIp601ho5IiGIO/IlI+CQ+jOdhh6oGs0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] build/x86: suppress GNU ld 2.39 warning about RWX load
 segments
Thread-Topic: [PATCH] build/x86: suppress GNU ld 2.39 warning about RWX load
 segments
Thread-Index: AQHYrXu4RMwCOoYLpUac/1qeB10tCq2pzyQA
Date: Thu, 11 Aug 2022 15:14:30 +0000
Message-ID: <f99169ee-e6b0-5c67-bf5e-e61e7cc31113@citrix.com>
References: <98c7b73e-0ef2-05ff-e150-cfc2f5506bd2@suse.com>
In-Reply-To: <98c7b73e-0ef2-05ff-e150-cfc2f5506bd2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf63ceb6-7adc-4454-cfd2-08da7bac307b
x-ms-traffictypediagnostic: BLAPR03MB5476:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dmB2lTmXHlgsYlz3RVi2zEIcEL4RNWj5rjfBp96h3uyZvulmgmuEANf+TFY/G4xOMMf9j7rE6tIj2p6Jd0UzOKtfgUognFHeVBJEAvsxjO70pFJlrB9sOLkeCmVFKeVVFBi5SAtms4lkOWcgJrW6FLJFXxeNwEjNqTJ6w0kUBkavLuWgR4qifXPRn6Bo+1r4tYAPijT7qQxtZ2mglF+dH8lBbwzrZiuwdOkxMpkZcn5AlPDWtZZ58wluF764yAKNgnEuNewi6nHl245RpYRlCRmmuNw8crLCJL6cIDxbh3KTf5t7vx5L/ZypxFbhHBDxr/HH0R/fncFO13wmYTrUG09tiHc5F3PbMyCBnT8SQzpL9CYjESROWc8bfAh2ftyMzfIzP0x2/8jVS2vbipRIEUiB3aqtVdR8jc7u4Y7epz4sVE7QlNmzU4B9bdYI8+H++ae6MArxJq5zFHs86gQz56hSrZ1mgnpGd01geCtiloMVrDIa7stCywLZy4NmvsL2k62vKwiq/rN9zwEtPaGvMfZmrReznpF/dT8AAs5o3FZjagffS/94/xziYIDo8t9a2DcQ7vEu24AjznqyJFREaUFW72yzct4YUuUBegdb1Usm6nVmZbSrZpwdvsaD2PdEQkUCipukMMVfX+92Bfs3UTOduX7OXsKcG3vVRIZ/GwAPO5kyZdtIK4FqlZeiEoEw01m5BT+1Wf1nELu5mCFekyI4ufmiEq1RGjQW+wrITD4y7MJFf0kHncVWTGfU3iDDRmKQE+00IwWbrvNpoD4brnTi09/bmA8b6jKi3nviJ4YKrgiDHudqmJU7ZtMe8SX26aLib4lAdWikNYty3yyywCnLIVNSqljAVJ143FLw9q0jsvPtFG59pU1BdOb4BuSr
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(6512007)(38100700002)(122000001)(31696002)(26005)(38070700005)(4326008)(66946007)(76116006)(91956017)(64756008)(66556008)(8676002)(53546011)(66446008)(6506007)(478600001)(82960400001)(71200400001)(6486002)(66476007)(316002)(41300700001)(54906003)(110136005)(107886003)(36756003)(2906002)(2616005)(186003)(4744005)(5660300002)(8936002)(31686004)(86362001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmcvTnFmRnE1Wk9DRzJKM0NsWnhNTEZuZ2xmTHd1NGc0Ym9NZVJEbGtPT1c1?=
 =?utf-8?B?d25KSXM0U015bUpMZU9Na29BRDh6ekV3YkxZMitZdHM3U1QwRE9aS2tHNFdx?=
 =?utf-8?B?QkgzT2xOazdMSlRvS2lDQTU1bDhtaUJJVVo0MVNtTFF3RVBLMTV1M1N1SWJ0?=
 =?utf-8?B?L3FWVHVoeTl4ajh5VGdLNURjT0FQN3JqVDZxVEh6YitxVUF0Njk4NHcyMVlr?=
 =?utf-8?B?UU1LU09SQVpWMUpiNjI5V25RNEROdXhSRXJCa2lkT3RtdVIyRzE4Z2RObG5D?=
 =?utf-8?B?R3NBMmF4cUIrcDdmMGR6b09JVlFwNWlXS2hmc2JWL2VhMU9nSVZHTUhOdHk4?=
 =?utf-8?B?eW5iVXZLbnZyL0VXbThaekhMK0U4Z0wrSW9GbGZCVjZJaGVhdzF0SjVxUzVa?=
 =?utf-8?B?elJVb1NwR1hHSzlRdlpHdkxGYmlxMVhKcVBpSFQzc2o2Sm5QU3hHeVM3Z2d1?=
 =?utf-8?B?VTIxOHA4UzNZSE94ZFJZUE82M0ZtbU9KTFlJTGdqSFJ0L25yNVNSZ1c5ZHNK?=
 =?utf-8?B?Sm1sbVB4cHhTb0FOKzZJWjV6aSt1Z3hVeEUvY2lJRXJYWkUxUUdsWUhpYmpk?=
 =?utf-8?B?ZG5CQlhRSHBnSjJQby9adUtwNDVHNERmdFpGY0ZwVU9vK045SWQxeXJDUEs2?=
 =?utf-8?B?a3VUdzdjZGl0bWd3aDY3T0dYeVpFWlExUXhYdWErMHIzZS9ZUnNnVHJGd1dl?=
 =?utf-8?B?TW1UQ1ZDNzBqUWdwR0R2TG9QMkJTc0Fld2M3VFdObEdtaVcxY2tnLzUxWk5w?=
 =?utf-8?B?VGVzOFRNNlRmS2orMW1zY0Radm9VcW91b3JySTFCRWlIL0xUaE9PY0h0bVZR?=
 =?utf-8?B?cEJuUkg4ankrWVlmSEd5WERqQWx4aVUyZUJyeEVsYXhxTFU3MGlYNXFlUFhx?=
 =?utf-8?B?ZkFwRTJTb3BCOXVLaksyaGRGTGI3YmhuNTRIci9VRGRkYzdzYXZ1L0trSmN5?=
 =?utf-8?B?bDRkaTFDSjNONHFZUmlWeVZUODlLRVFNLzNnc0lUeDByTFN0dkFodmFRZEZU?=
 =?utf-8?B?eWR5WnQ2anZ6QkFCWUhKOFBoa3I5QktZV2VId1pmSXhMK2x4Qm9GcVJNUXBP?=
 =?utf-8?B?S2VtbmZjR29jbXM5aFI3L1lvbWhyNzBmSFlRYzNpRkRIM2ZDV3FzaHR2a0R4?=
 =?utf-8?B?ejd6NkJLbWJaaGlJMkxYRVc5azFZdWZMUDl5dWlDTVN2TC9ya3lRcEdLQ2h0?=
 =?utf-8?B?TFMwbEFpaXRFSFEzTm9FRSsrTllFL0FGZ1BzVG5JSVoweWdKR2l1RUNvTHcy?=
 =?utf-8?B?bGx6eE9Cb2NZYlNOZkRvTDVLQnY0aGZpS2VCOTlvQTlqQlhHK2VpOFlQbUUv?=
 =?utf-8?B?MklPcGhPeGY0bXNhTGpySGJ0VTZiZkVHOTdaV29wdk4vVk9vVm1kSC84RDUw?=
 =?utf-8?B?WHp5c09rcFUzZHBuN0hBYUtkbEhUc3JKdUt1bDJvS0hwMEgzSEFyazVFOWRw?=
 =?utf-8?B?bmJrR3o0eFpEbjNJdXczN0MzbG9ZWE1LaFdiWGIrcmdXVWZqYnhsclkxenFr?=
 =?utf-8?B?NnZsY2RxVEJRNnU2NXJtWEFrdEVCWHlJcWdFU0JCYWtNVFc4b3Rra3h6MldS?=
 =?utf-8?B?SmpUQjhSbkdDNDN1M3pkUjN5Q1dxLzJ1ckIyVWIzS21KMk83YWZHL3F3dHZw?=
 =?utf-8?B?UEgycnk4Y3VkOXBMOUE1dXIxQVRiaytTYVZOczRsRGV4RlhCbFNqTE1jeGdW?=
 =?utf-8?B?TGtmcUlsNEFjdE11UE5EOWJyajQyYlovSG5vQjZ4WVdVV0JDbzd6dFFFTXN1?=
 =?utf-8?B?OFBDamFsOEs4aDlTZkFVYk9xMHFubnlGMXFTaW1qUThyL3YwNlJycVVCbDhu?=
 =?utf-8?B?K2xHZ1ZYNXlFTEkzM2o0TGV3UUVxeXp1RGVWVnNJdVZJbEZoTlBTMjlvZFdj?=
 =?utf-8?B?dzhyTndrZjhPa1RDbjA2NUxUaFZta1p4YllVQVp2dGRwOFMyWklyd0ZhcDFP?=
 =?utf-8?B?MEdzbDRsTjZWeVRXc3hhN0VnQkR4MEhVRUdYU2lGQ1NZdTNvME44OGxtVXZR?=
 =?utf-8?B?MDM4RHpMQUxnSldOT25uVVl4Ylg0S0x3b1Q2OHlwTkZtSHBvcGUyaE0reFIr?=
 =?utf-8?B?RlBRWXN5SEZMWExBNDRTUGZ2YmE2YmxrZW1xeEZwUTVVWGlFZXlhTTlHNENZ?=
 =?utf-8?B?cHE5VFdnKzB3K1B1MVF3bENaWU1XelZsV2NEVWVvSDhWdVF2Y2I0YWtESlZB?=
 =?utf-8?B?ZFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24D3336CD4320840B5C998410404F5D8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UV//9YggB5MSxZZfNh69tmB8qotQXN4KVLLn2O2OUnlIW/S/bPWaio8D95FYqzt8GiNwFC8Wrl1oNWANZnvYKktw2ZXY10LYRBnTOS6EMH1M1phcpp8uFtjYsWh3ssgAvFGV8YqgT0ozOi2ekVYrNyvaZ6l9pznyWATym6Pg61fDHGhmmE7gWB5U/adHv8XI/LPnixg5xCLh4o+FWe5zu3ODyLRgJE0CpkAEU38QZ9uMfIiuTAs0WcMWX5keSEypJ/ALny4xtH3U7BK8rZzanjLAItMyJtgErgbvEUWWPMaAASXmoIjyUVN3jBJedueUF4Fb4/2cYpIEnu7hTSDN9sHdJegen9sJoPpNT8EqlXPgZ8tewWFmi9zWYfII8jInmE2MeH4yIszulawb4YePC9XbGS6v0t50TWBXilG++r+vtb6fY0GUIs+tpQNPf4n25BxXzpCE76XBYK/fpl+xE5Ktpw04nin+NWoqP+V1k6jdjaYB2UWQKdyJnT6egmfN/guoyuJF0ktQq/6SBXD0EIwhpMxOlJtI/jcSucFjKeJ79hB6+JkpuuSX7F4c+6SYcvsI5YLgjD9YnkJxn1WxV+/pY9CacGSeeEYhX6Mcei0cybEs1ecNIKI8RVTPGV5pMlTvdr/spddiNd6quF/sMIKQPk3PZtGNcA1p2MpmpCBi1gx/I34w6U+Kt8OVnyu6eOQGgfxBklnLzQMj3/U8AhzsTjFCKpC/IXwNgiItoeqYODXrAkvJlFA7/fvUnJQV98G+GwjNyYLgb1Jv5kQCaWP0nM8P6eXxZy8BF+6IYj0cV1qBFKVuQI1reRRRoboX
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf63ceb6-7adc-4454-cfd2-08da7bac307b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 15:14:30.4045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: piU81p1OFWDzDEOCquw+m9yTu3Fgw65xYMbwrd6mL6xYFR3cFSRV2cFulLnwxGzokmwFZem/bMGKWy7NUBzWaF4njOg4KTP/miE8XD1D7pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5476

T24gMTEvMDgvMjAyMiAxMzoxMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IENvbW1pdCA2OGY1YWFj
MDEyYjkgKCJidWlsZDogc3VwcHJlc3MgZnV0dXJlIEdOVSBsZCB3YXJuaW5nIGFib3V0IFJXWA0K
PiBsb2FkIHNlZ21lbnRzIikgZGlkbid0IHF1aXRlIGNvdmVyIGFsbCB0aGUgY2FzZXM6IEFwcGFy
ZW50bHkgSSBtaXNzZWQNCj4gb25lcyBpbiB0aGUgYnVpbGRpbmcgb2YgMzItYml0IGhlbHBlciBv
YmplY3RzIGJlY2F1c2Ugb2Ygb25seSBsb29raW5nIGF0DQo+IGluY3JlbWVudGFsIGJ1aWxkcyAo
d2hlcmUgdGhvc2Ugd291bGRuJ3Qgbm9ybWFsbHkgYmUgcmUtYnVpbHQpLiBDbG9uZQ0KPiB0aGUg
d29ya2Fyb3VuZCB0aGVyZSB0byB0aGUgc3BlY2lmaWMgTWFrZWZpbGUgaW4gcXVlc3Rpb24uDQo+
DQo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkFj
a2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQo+IC0t
LQ0KPiBCZWNhdXNlIG9mIHRoZSB1c2Ugb2YgTERGTEFHU19ESVJFQ1QgKGNvbWluZyBkaXJlY3Rs
eSBmcm9tIHRoZSBDb25maWcubWsNCj4gaGVscGVycyBpbiBjb25maWcvKSBoYXZpbmcgYSBjZW50
cmFsIHBsYWNlIHRvIHNldCB0aGlzIG9uY2UgaXNuJ3QgdmVyeQ0KPiBlYXN5OiBBbiBvcHRpb24g
bWlnaHQgYmUgdG8gaW50cm9kdWNlIFhFTl9MREZMQUdTX0RJUkVDVCBhbmQgZXhwb3J0IHRoYXQN
Cj4gZnJvbSB3aGVyZSB0aGUgb3RoZXIgWEVOXypGTEFHUyBhcmUgYWxzbyBleHBvcnRlZC4gVGhl
IHdheSBpdCdzIGRvbmUNCj4gaGVyZSBpcyB0aGUgbGVzcyBpbnRydXNpdmUgdmFyaWFudCwgdGhv
dWdoLg0KDQpJIHRoaW5rIHRoaXMgaXMgZ29vZCBlbm91Z2ggZm9yIG5vdy7CoCBUaGlzIG1ha2Vm
aWxlIGlzIGZ1bGwgb2YgbWFnaWMgYW55d2F5Lg0K

