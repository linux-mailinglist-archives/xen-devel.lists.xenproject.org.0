Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA866D197
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 23:15:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479009.742580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHXkg-0003Nn-J8; Mon, 16 Jan 2023 22:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479009.742580; Mon, 16 Jan 2023 22:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHXkg-0003LP-G3; Mon, 16 Jan 2023 22:14:50 +0000
Received: by outflank-mailman (input) for mailman id 479009;
 Mon, 16 Jan 2023 22:14:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbzH=5N=citrix.com=prvs=37389537a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHXke-0003LH-0u
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 22:14:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cc71389-95eb-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 23:14:43 +0100 (CET)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2023 17:14:40 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6019.namprd03.prod.outlook.com (2603:10b6:610:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 22:14:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 22:14:37 +0000
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
X-Inumbo-ID: 2cc71389-95eb-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673907283;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4Blw27gjCINtwT9t9bU6ZoWRv4DCoUYKhqngNd1B9rc=;
  b=LgyWp2kAcrcDxVJKJkcAmwfhIejjhKsOhqXFzEustjjMgfRJ/1/DrA0y
   vG1WolfHEBu+Y1G44Rt+Kk9h99l6UbYSRn3pARH5qbcn3FZycRHdxGqLO
   aTngC95CAxlvrJUPzOG1xxqLQT0ZFRgIBuAHBrrHkc6crvETO0Vpr++AC
   U=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 92863881
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6bKBIalvKDN6M56H5lVUyuLo5gxLJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXWjTafqNZWr0Kdh2Pdjl9kMEuZbWz99nTFQ+qn0zEyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5QGGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aAIERAuLUCFu+G/2by8Rsc3r5wFEOC+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3iea9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDTu3mra462TV/wEQTDBhHfhjkmcCgqV+ZfOx7F
 0oI8S8X+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbRRwtJWFRHTb8a2bxRuwJCwUIGkqdSICCwwf7LHLsIw1yx7CUNtnOKq0lcHuXyH9x
 SiQqyozjKlVitQEv5hX5njCijOo45LPHgg841yNWnr/t10pIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF4n9hx0xZPpbxt3Qw=
IronPort-HdrOrdr: A9a23:/Fw+Iqs2/AqPuC5VqUq5BkKA7skDGNV00zEX/kB9WHVpm62j9v
 xG+c5w6faaslkssR0b9OxoW5PqfZq0z/cc3WB7B9mftWfd1FeVEA==
X-IronPort-AV: E=Sophos;i="5.97,221,1669093200"; 
   d="scan'208";a="92863881"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UL51MTPQcZapoyPOwi5FoWduWTSswy5zEOOBiqiJLg1F+r1Rtc/ydDwFY3px57ttLKy7iXfVMtcOKAQ3+pr9Bwrp4CaKoFXXitm1libifo6e4ocEkxAZi7joLCKq0YjME52dLTivky5sT4tA5+DrxRh6SORBY7huZhafe0WPjzERWSJf1+RUTWMllsHfqHrwf8obot/o8qxBgNjcQJkQLomlbGqcW+VRke4b80gMNepdRSTmZDWhYtmNUziWneTWvAUb4lUL7iP0eTXoUfLi2j7f62O37zmE5TeSIdtZUSDUed6Z2ccWAC0voLO2kPrhjg6I9BNuA46zT4xhffpXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Blw27gjCINtwT9t9bU6ZoWRv4DCoUYKhqngNd1B9rc=;
 b=JZde02OJhUE8DtwgXL5BsK1d7Ds2wE7X7rNUfJW5YR0SYX8hE4tEYByb8HyA5LCAaPocv5Rikz1eKYkUv9v5W/yrUEFPWVDL3CshW0ry90OAHo8lIuhP6wrJdjOdBz5otiJkUXHog+QFVyTfhgPylUS5YRFtvmR3Nw+W98+LQ5LpEmlUqnbXSga9wnBXcwRQQ99URuSTspjfglELUbd7oK0bx3WW+h8dKMqSHrHRp3Y8MtC1DdnFNu+FJPOIo+gbLiVL0DE8+hia10SAJGfBFDWRn03PUW3jBnWb3Bs6JSO1QP/GQ5tlfrxuL6cobQ2kGSpoF0VhLRtEnXbtwZZoBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Blw27gjCINtwT9t9bU6ZoWRv4DCoUYKhqngNd1B9rc=;
 b=uBGwwNY4ASdPiOIP0ZXvjZ4JEbpU/9G0a7ndWO3OfxmoapiinelFc2w0sNv+aGUZvknTxIa0CxakTaplgncEbtJKKej7OyGL4Tk1sTOx5k3tLe0tVq9CiFxjjpO/t58cQWwSTJVo0oCiEf0bNxhFneIBOd4D+/jPFmrsIkA27Uw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/5] xen/version: Fold build_id handling into
 xenver_varbuf_op()
Thread-Topic: [PATCH v2 4/5] xen/version: Fold build_id handling into
 xenver_varbuf_op()
Thread-Index: AQHZJ6P7YcGbTGh3kUuVUrqx0/v8ha6hO92AgABksoA=
Date: Mon, 16 Jan 2023 22:14:37 +0000
Message-ID: <4639aa6c-cef8-3434-1607-fcb4b563a991@citrix.com>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-5-andrew.cooper3@citrix.com>
 <f92334b1-7819-d638-fabd-91baca711615@suse.com>
In-Reply-To: <f92334b1-7819-d638-fabd-91baca711615@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH0PR03MB6019:EE_
x-ms-office365-filtering-correlation-id: 425dbd16-96a5-4e49-07e8-08daf80f0e7f
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EGUs+URlDpUuB3lz01DBnohmyQUKiabOysNNurUvgzOJoA2DPRbYhWQkjJvZt7oiMB7e0P8BD4a1/7Xvf0dMK24PLFR/lCYEBUlP0cxfZo9PEmERJ/glyjdmx0uvRoXtvPjYLO3XH3plQDMVlYYGjBG7uetvojYu/MbH4V+Jzhdyw3CJJcEPk9U5R6momVMjAfSl7/A4o0zZowH4dURsfdIjbLvduN8P5S6tXLbrar5IcTzfqT/pvevgN+IKe/AG2qY4W7Ps6tB5TL7MnVwziiKqHXjR7jJf10hRj4tgOd4/rk+vfij/y6T26004Mva66SUalMRqnCRMXvxoxuqYyJv9EfAszItQywjSNSN0lDuurJ8T/XBcOwRwV//GT269udX7zjrBsYPzP3ZztVVb5gto3h6fTvWufebN6R8ma1SM01k/AFnrXXfxw2LxEknTut7T2wM4JROgjyBUVvHqixWFeXxCxATGxhzFXGgxyO/qmhJmXpTM+WsvwcB98qOOy+R8Sy6m/dxkRhicOSud1szQMnrZXZ+9tp+9SubFdtL5f8VvZH/sNi7wswi0fHxnt+E2uYAriDUg6/DB4QCyQB9zJGs6ZWaXhgyK+0A6FNZmiCHqXaO2SX+teMEvCsTgW/w9CdNt5abQl5zTap2oyNLp79tZVAjfGWW4rL3GrVNiiw983GCaAWe7gvth5Ta4+PY8iIFf+GPb+8ccheIlu2kYXDNZFtiH1prGCCfYthyNmAhsxnPzIlLDGQE1bKoJLJupPPqE4bnIp3awSuB3+Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199015)(82960400001)(83380400001)(122000001)(38070700005)(86362001)(38100700002)(31696002)(5660300002)(4326008)(2906002)(6916009)(8936002)(8676002)(66946007)(66446008)(66476007)(76116006)(64756008)(66556008)(41300700001)(91956017)(2616005)(186003)(6506007)(26005)(53546011)(6512007)(316002)(54906003)(478600001)(6486002)(71200400001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VnZzVWt1Z1d5cXQ4bkNSK3p2TmluZFB0TStIOEJieUd2Und1dlJibXZhTS8z?=
 =?utf-8?B?QzBMUlBjQ0JWZHdDS3hwenZFWXcxanpFckJ5R1JMSWxLOTVHcE5jaHEvNnk0?=
 =?utf-8?B?Q0pHWnYrQm9JOXlSMkJITkpqOVppZzFLVXJTeWJCTTVULzRrTE9Pc3MwRkFB?=
 =?utf-8?B?TzB0dnVDT1Q1aEtOZ1R3a3ZsdzNBQjJ6ZkM1MjdKSFJTSXZFWStVdUhyMXdl?=
 =?utf-8?B?VlYySTg3b29pTFh4RmRuQldwTFNRbWk2ZWszZ055RDNCbFlQbHBIemgzd1M5?=
 =?utf-8?B?RnNOQWdaQy8wUTVDWUFYbUZ4MmpWME9LQmJWMkNTWnRDMWVQbWIvTytUL2lJ?=
 =?utf-8?B?dWxHYitqZmRuTlFyR01iTlhtNnV5ZmhuNHo4eE45UXpPeC9pOTZVQWxtUFZF?=
 =?utf-8?B?TTJaVk4zdklSRmZXenNuOVBEazQyYkJlU1JlcFZEWnJHUmVJdndjSUJ0UXZ2?=
 =?utf-8?B?cXdLZkcyVk5objBtdDVIVlVlT2IxMFZ3WWxCSVh3dVBhdC85ZXBwR1NuQXA1?=
 =?utf-8?B?MGpRdExiK09HNWorem9UNGUxZU5IalFCYjAyY29uQ0R3ZWpsQnQ1dUhaazh5?=
 =?utf-8?B?SWZ0ZXg1SDRERW1uVlNramhCZzNWMWp1bG00d1JRTjF1azhaNGkrY1NiNm9x?=
 =?utf-8?B?N2h3WDl6SURJKy9kN0NJcHJCSjRweEt6K3JabkYzZ1dScnBtVjR1WndwM0hG?=
 =?utf-8?B?cHg2YWFYVVAvQWYrRGovWGNpbVlqOUR5dlU3WGhYQnpydFcwcXlYMmVZWmdQ?=
 =?utf-8?B?U3pFOGVSWnBoNG5BQXpSdWtPVEt2RnhoMFBLRTNBM3FxODFpMjJlbzlMbjhl?=
 =?utf-8?B?RjRrVVFkRDE3SUlqaTdLK05YbDdFczJtaWRHUTREZFhDQVpHZ3o4bjhEY1h5?=
 =?utf-8?B?empRVkovLyswb0g3VHhDenYrNUs0a2p0dmJwSG13WDVnUjR6QjBYWFFFdDhB?=
 =?utf-8?B?d2ZyVlFrMGZSRmwzNWJiM3lacW9za0ZHSGJGRytzUGRTT1lDSlQveTcrbEJa?=
 =?utf-8?B?RGUwT09uQTEzZG5XcDgycGNWalBXVmIxeEhaY1B2Vkw0N1UxN3FVOFB3NjNp?=
 =?utf-8?B?dE0zRHplL0Y2WFVJVjc1Y3o0ODNQVnk1OHB1b1VjSTZjcDZBK3krSHF3VE9P?=
 =?utf-8?B?L29kcjZ6KzFhdjdUOUErQndMejNONGw4aGlFK0E3RitQdzhPRUJCbGFGMWNk?=
 =?utf-8?B?ekZwVzhPZG5iQlJTVzRRZVROOWlhd0R1TmtHK1NacWVZYUtnMHpNWlJJVE8z?=
 =?utf-8?B?SkdKbm10c2NKSFk5WkZWckNsM2dmZGNvZ0lSNjBKdC9nRlBaZzlBa0xNVEhR?=
 =?utf-8?B?QVpFeGhCYitZVjliaGpsMUpPK1JOd2NyNHpQZnV4Zm1JMnQyb2VEWlNIS25P?=
 =?utf-8?B?YjBmMW1UcUVjM0FER0JnNktIN2NBOGRJMFlsQzVQaDBWcVdnUHZkcnYvZGRl?=
 =?utf-8?B?WGpQOFpLZ0NVcWdDSVdyZVI4V2tqWGt5dHdMVExqWnVTNTI0U2pHeVhGR3hQ?=
 =?utf-8?B?aEZHcHEvSXhlend1eHFLczgyYXhyakRub1NWVjZhS0dhOU9QQ2V2MlBhdkR0?=
 =?utf-8?B?dWliVW9XeW1VdFQ4Yy9YUURVM1pBbVo0TkJ1aUJyRWl1NkEyRmlKb29OK0RX?=
 =?utf-8?B?Y203dXZlY2Nreit0Q2VBaE5EaHFSZis2OGhTeXJJUzIwMUFHWVRVRG1sSzBr?=
 =?utf-8?B?cVd4enZ5U1JkZmVhU0ZKUDhiVWwyUlorRUw3WllPNHF2aUtvM25rT3hDbmF1?=
 =?utf-8?B?MkZSTWVqNWpLaHhFMVAvRkxoMTlEN0s1UERmNnptNVZUMUpVSDNWemdUd3NG?=
 =?utf-8?B?ei9SYWdHWjRxVU9TTm5wdkJLdUtrdmhDN24rQzgzMEFDcUdYakJEWmoveEJl?=
 =?utf-8?B?VHNhY0hUb05TMW5mOEloNllaT0xqZklud3I0NjZWQ0FIaEQ2WUE4MWE5QytC?=
 =?utf-8?B?N2NCa2ZCd3NCN1BNVnFNVEN5aVBjME81OHdkRGFiWHFHNTNvR2p5c1VJaGRk?=
 =?utf-8?B?bGxaZ0duemZTTk5JOFd4SkJlWnN4STlya3lQMjBBRjhMNzFodldaK0ExNnVM?=
 =?utf-8?B?SlcrR1VHRFhxS2haMENHUDJWUXc1N3AxVmhxTFRDR0h5TUF4TnIrK3dkVmdk?=
 =?utf-8?Q?v0RtqP/11SCwyGogDoinC0X58?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2663C71880A7C24381D9959F3EDB6319@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c+QuxNillunIxaBU0eLzIhZGCfBDtukL/mFxaUMoEKuZrxYisTN4YNI4KozaeNs8fkFd8oAuWgvmlsSg0O8JXhEcoUrLNJrCmviHt0GBCUke2dFU8EQ7zdKtdHXUPs38hH9dLinRdD5TcKXlaKRVAcDOtxwIHrGcC37vKrpJsazS/SFnCNWRYFN4Yi0IQC4061LwiFwLh+jP05FHQ8VMkrJ00+N82jZllRNpfNUVm5AIlWR9bzlYJmo+0/4zhh8yR7y7yaNKicmeqhH4B4l/RM694ALgBgPakM14ZSUCBjM2z1VAh8rVky+Ow5zottSZqlOlTTyNQ5i2diW5lwLVFHzpwd+f3WR+ShBBmlyJ6e2kBIVs+KQG8Dii/OihwWnR7Ri6JH5A46EAtHZMQu8kvZw0iJKSpMRyeSOlg5aMF2cX9JYYu+fMeoWLPdYiJnS5D1MnAbhRwAafAJBKeTe8AooCl0QH/cr7EUYe2R8hh6v76WFIR9wlbZlqq1wPU/iaw/LYvKJ/s7iviQFi4rO6bxQnwLIXbn8Wks9bjyroEX3ddjMSbFC4iLLNTQTDU80+oti0nKHbartCSvUlCqhvl/E/0bqOto4t/axhJmFwXGJUowdr1kA27gr4CcMkI9tEksYxIsM8wtd6s+bQh0ecfX/lQLO3iXs29XysyE3CaY2hIfU2g1EQ3JzlBkVHiuJFG7q6oDR1HbX6OKi6MoUM+K+sil8+WqluGhDcDwZgl61VA64yjTm3pZB5cRHhvze9scBtAd+5J44CMNO5fMxu9OrXajYkpQ40KbjmXC6gZK82pbE0AoN/lgj4Cbz6HW4DcLNpwkSYypfZiCH75v682qxd2bhf8PY14C2RT8mdFVA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425dbd16-96a5-4e49-07e8-08daf80f0e7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 22:14:37.7125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6jHOriYa7pyO1uMQO/bZAkxfKE54OTUkWxOv2dyykPqa02T8LCNmyLJvAQ1HhGH8IC5iBrxnwowpRpmi6KkvbNQZMOj6Tdir/eTX38Dewwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6019

T24gMTYvMDEvMjAyMyA0OjE0IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTQuMDEuMjAy
MyAwMDowOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IHN0cnVjdCB4ZW5fYnVpbGRfaWQgYW5k
IHN0cnVjdCB4ZW5fdmFyYnVmIGFyZSBpZGVudGljYWwgZnJvbSBhbiBBQkkgcG9pbnQgb2YNCj4+
IHZpZXcsIHNvIFhFTlZFUl9idWlsZF9pZCBjYW4gcmV1c2UgeGVudmVyX3ZhcmJ1Zl9vcCgpIHJh
dGhlciB0aGFuIGhhdmluZyBpdCdzDQo+PiBvd24gYWxtb3N0IGlkZW50aWNhbCBjb3B5IG9mIHRo
ZSBsb2dpYy4NCj4+DQo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuDQoNCj4+IC0t
LSBhL3hlbi9jb21tb24va2VybmVsLmMNCj4+ICsrKyBiL3hlbi9jb21tb24va2VybmVsLmMNCj4+
IEBAIC00NzYsOSArNDc2LDIyIEBAIHN0YXRpYyBsb25nIHhlbnZlcl92YXJidWZfb3AoaW50IGNt
ZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgIHN0cnVjdCB4ZW5f
dmFyYnVmIHVzZXJfc3RyOw0KPj4gICAgICBjb25zdCBjaGFyICpzdHIgPSBOVUxMOw0KPj4gICAg
ICBzaXplX3Qgc3o7DQo+PiArICAgIGludCByYzsNCj4gV2h5IGlzIHRoaXMgZGVjbGFyZWQgaGVy
ZSwgeWV0IC4uLg0KPg0KPj4gICAgICBzd2l0Y2ggKCBjbWQgKQ0KPj4gICAgICB7DQo+PiArICAg
IGNhc2UgWEVOVkVSX2J1aWxkX2lkOg0KPj4gKyAgICB7DQo+PiArICAgICAgICB1bnNpZ25lZCBp
bnQgbG9jYWxfc3o7DQo+IC4uLiB0aGlzIGRlY2xhcmVkIGhlcmU/DQoNCkJlY2F1c2UgcmMgaXMg
bW9yZSBsaWtlbHkgdG8gYmUgdXNlZCBvdXRzaWRlIGluIHRoZSBmdXR1cmUsIGFuZC4uLg0KDQo+
ICBCb3RoIGNvdWxkIGxpdmUgaW4gc3dpdGNoKCkncyBzY29wZSwNCg0KLi4uIHRoaXMgd291bGQg
aGF2ZSB0byBiZSByZXZlcnRlZCB0cmVlLXdpZGUgdG8gdXNlDQp0cml2aWFsLWluaXRpYWxpc2F0
aW9uIGhhcmRlbmluZywgd2hpY2ggd2UgYWJzb2x1dGVseSBzaG91bGQgYmUgZG9pbmcgYnkNCmRl
ZmF1bHQgYWxyZWFkeS4NCg0KDQpJIHdhcyBzb3JlbHkgdGVtcHRlZCB0byBjb3JyZWN0IHhlbl9i
dWlsZF9pZCgpIHRvIHVzZSBzaXplX3QsIGJ1dCBJDQpkb24ndCBoYXZlIHRpbWUgdG8gY29ycmVj
dCBldmVyeXRoaW5nIHdoaWNoIGlzIHdyb25nIGhlcmUuwqAgVGhhdCBjYW4NCndhaXQgdW50aWwg
bGF0ZXIgY2xlYW4tdXAuDQoNCkFsdGVybmF0aXZlbHksIHRoaXMgaXMgYSBwYXR0ZXJuIHdlIGhh
dmUgaW4gcXVpdGUgYSBmZXcgcGxhY2VzLA0KcmV0dXJuaW5nIGEge3B0ciwgc3p9IHBhaXIuwqAg
QWxsIGFyY2hpdGVjdHVyZXMgd2UgY29tcGlsZSBmb3IgKGFuZCBldmVuDQp4ODYgMzJiaXQgZ2l2
ZW4gYSBzdWl0YWJsZSBjb2RlLWdlbiBmbGFnKSBhcmUgY2FwYWJsZSBvZiByZXR1cm5pbmcgYXQN
CmxlYXN0IDIgR1BScyB3b3J0aCBvZiBkYXRhIChBUk0gY2FuIGRvIDQpLCBzbyBzd2l0Y2hpbmcg
dG8gc29tZSBraW5kIG9mDQoNCnN0cnVjdCBwYWlyIHsNCsKgwqDCoCB2b2lkICpwdHI7DQrCoMKg
wqAgc2l6ZV90IHN6Ow0KfTsNCg0KcmV0dXJuIHZhbHVlIHdvdWxkIGltcHJvdmUgdGhlIGNvZGUg
Z2VuZXJhdGlvbiAoYW5kIHBlcmZvcm1hbmNlIGZvciB0aGF0DQptYXR0ZXIpIGFjcm9zcyB0aGUg
Ym9hcmQgYnkgYXZvaWRpbmcgdW5uZWNlc3Nhcnkgc3BpbGxzIG9mDQpwb2ludGVycy9zaXplcy9z
ZWNvbmRhcnkgZXJyb3IgaW5mb3JtYXRpb24gdG8gdGhlIHN0YWNrLg0KDQpUaGUgd2lucyBmb3Ig
aHZtIGdldC9zZXRfc2VnbWVudF9yZWdpc3RlcigpIG1vZGVzdCBidWcgYWJzb2x1dGVseQ0Kd29y
dGh3aGlsZSAoYW5kIEkgbm90aWNlIEkgc3RpbGwgaGF2ZW4ndCBnb3QgdGhvc2UgcGF0Y2hlcyBw
dWJsaXNoZWQuwqANCi9zaWdoKS4NCg0KPj4gKyAgICAgICAgcmMgPSB4ZW5fYnVpbGRfaWQoKGNv
bnN0IHZvaWQgKiopJnN0ciwgJmxvY2FsX3N6KTsNCj4+ICsgICAgICAgIGlmICggcmMgKQ0KPj4g
KyAgICAgICAgICAgIHJldHVybiByYzsNCj4+ICsNCj4+ICsgICAgICAgIHN6ID0gbG9jYWxfc3o7
DQo+PiArICAgICAgICBnb3RvIGhhdmVfbGVuOw0KPiBQZXJzb25hbGx5IEkgY2VydGFpbmx5IGRp
c2xpa2UgImdvdG8iIGluIGdlbmVyYWwsIGFuZCBJIHRob3VnaHQgdGhlDQo+IGNvbW1vbiBncm91
bmRzIHdlcmUgdG8gcGVybWl0IGl0cyB1c2UgaW4gZXJyb3IgaGFuZGxpbmcgKG9ubHkpLg0KDQpU
aGF0J3Mgbm90IHdyaXR0ZW4gaW4gQ09ESU5HX1NUWUxFLCBub3IgaGFzIGl0ICh0byBteSBrbm93
bGVkZ2UpIGV2ZXINCmJlZW4gYW4gZXhwcmVzc2VkIHZpZXcgb24geGVuLWRldmVsLg0KDQpJIGRv
bid0IHVzZSBnb3RvJ3MgZ3JhdHVpdG91c2x5LCBhbmQgdGhpcyBvbmUgaXNuJ3QuwqAgSnVzdCB0
cnkgYW5kIHdyaXRlDQp0aGlzIHBhdGNoIHdpdGhvdXQgYSBnb3RvIGFuZCB0aGVuIGp1ZGdlIHdo
aWNoIHZlcnNpb24gaXMgY2xlYW5lci9lYXNpZXINCnRvIGZvbGxvdy4NCg0KfkFuZHJldw0K

