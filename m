Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180CE4C2CE4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 14:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278258.475451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNE4v-00067X-9h; Thu, 24 Feb 2022 13:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278258.475451; Thu, 24 Feb 2022 13:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNE4v-00065l-5t; Thu, 24 Feb 2022 13:22:41 +0000
Received: by outflank-mailman (input) for mailman id 278258;
 Thu, 24 Feb 2022 13:12:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6aw=TH=intel.com=mateusz.mowka@srs-se1.protection.inumbo.net>)
 id 1nNDuo-0004YD-6f
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 13:12:14 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ef2cfc6-9573-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 14:12:10 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 05:12:08 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 24 Feb 2022 05:12:08 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Feb 2022 05:12:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 24 Feb 2022 05:12:07 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 24 Feb 2022 05:12:07 -0800
Received: from PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20)
 by MWHPR11MB1871.namprd11.prod.outlook.com (2603:10b6:300:111::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 24 Feb
 2022 13:12:05 +0000
Received: from PH0PR11MB5142.namprd11.prod.outlook.com
 ([fe80::6903:ac9a:d1b5:d99f]) by PH0PR11MB5142.namprd11.prod.outlook.com
 ([fe80::6903:ac9a:d1b5:d99f%8]) with mapi id 15.20.5017.023; Thu, 24 Feb 2022
 13:12:05 +0000
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
X-Inumbo-ID: 5ef2cfc6-9573-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645708331; x=1677244331;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-transfer-encoding;
  bh=mNCBq8svLvkZHHn4yMzKpg42ucC+IFFAAbGK4zEBU1Q=;
  b=dCdCxWp1S8gBZS4ViM+nkrQ6WdRt45qXW5WXQqA0BV6XyMC8nQht0hEA
   wluRC1zqpFd3mbi2Q3ZZ5cq6I6CC0BN38lUuBv5XJc69xlwUWZJQ7niNA
   XyqMStk/VOrPRsoppuASCF8wPMtL0srDHjta+t26mHv3qIX3LaK7b6S06
   gBFffhnxdVLSVP/hvlQKhG0KNkS5RnZUPUTbk0HgzLOlsPRw5xYsP1jXY
   muiZMuUXHpjQi1bUE0LTaulC0qZIsrwQwCJztXXlwhGNIuj4JuBZHPhRq
   NzTKnvyIxn+sP5E5dUR7Szsrbe7KV3+rWq5yJ8RbUZSnAGvvdmxVcEs+d
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="232852025"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="232852025"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; 
   d="scan'208";a="777049966"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBqV79Hck6v33rcVw2NudWrjaKInehRHpHwZxL4AXYo8IHt1p4p5/l6l62ks+Mukgp1uZcA1Xez3KO1iBknQDI8XMH7n+t56A0jrFADyeT7b5OCNuvzAcraQumg6Xad44WO7l8xStQJyQ0yMubmqjBdTBdPIPtffkzjf3RStmEJIZLWFjfoRjAHR+gAfAaKB5KGHWdED0a+Vb4+lZW2j3kpIta+Ni/PFNEgHuUEqeu6j5JMrDLn4WjlqbnlFhGqygTd+2Or9puG3wOPNz9gfCQOVfZ9RxrXgMEfwLys1171r/f+C96nD4nRYC/kDQnMmD38cwMfrzUdcBdolYuVVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAu4XZIjHWAr0v7JfXdoXUKgXBHeQOem368qH6nFmTg=;
 b=F7lcVYsxVqNVMEf5gc71YV813HrbNwO/cBGKOTWQrouF7tsUsLcpyZBjghUdNMJn+fnOXmSvMpT/PYwrjzJg3SwqPCG7bNSaMndNGeHZKRkN0B4Fzc8+SbJPZ6Uy0ZKRlasdxgG3V8W8aegd+tysHFPxwQKu9+3tw/UAa0jad+lLGGEX9gtYfIhXhbqpsfZ18xRKfwoXlsn+bJKG+5gDA9HyfKlXyN0bT/oHY+ra9YaACjWDSEd1QXA+DYSBgdVOC9+2ZPah6Q8Nrwd5BFBLfF0T5riEggxbDtwh5T24kWqMI3y5ZQjrZZzIbStsiF5aWpa+YTZmjKQm29fn0GwXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Mowka, Mateusz" <mateusz.mowka@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: Ping: [PATCH v2] MAINTAINERS: update TXT section
Thread-Topic: Ping: [PATCH v2] MAINTAINERS: update TXT section
Thread-Index: AQHYJCBLPiOV2LeuHUWNWAbVtoiwwKyitvWAgAAA0ZA=
Date: Thu, 24 Feb 2022 13:12:04 +0000
Message-ID: <PH0PR11MB51424E3A85B78876690C9D5AFF3D9@PH0PR11MB5142.namprd11.prod.outlook.com>
References: <4f26b785-ae03-34a7-7dfc-d36121a44ac2@suse.com>
 <6270f203-c839-e54a-3f94-7db88759ed0d@suse.com>
In-Reply-To: <6270f203-c839-e54a-3f94-7db88759ed0d@suse.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab6af04d-f58c-405c-4149-08d9f7974120
x-ms-traffictypediagnostic: MWHPR11MB1871:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR11MB18714D3643C6008305914981FF3D9@MWHPR11MB1871.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZyLara71FYk9zfzNOr41Twb3+xyEw+/SlnjknzfsITEv8m66hBpWa0z9NR7+IwbDaEfwSd5pO7j/hUjJVFqgDMUDwNmlpAofNi9pj0d59o5Tg6/HU5aaCf0GesjxdZQUDPRPXgK+cAKuObH7xC3hQLo1th+v/C4F7gS/ComGmSP2FGJGMMBofVCiK2V3wa8YnzD/Ho/Ah8+x0pmj9gNL9obqYGJX4EAYUvA2ilfy6WmbkAv2mAHYms/4j2XBif1gz2Z/xjYRDUH+stSMSOZjsD8UyaqmyDCsfHONAtXrU26XqfnfFpDCzjy4cQfjI2ShrTSmadQ8vFujL8Q/z6umYzBr9y7bkFXpR0ODRwUyaZuYhBo3wn+VeY2Z+5SK8Jhe5cJpKC4uhMO8q25Yu4nvdeiiEXJAYrMj2MpLPh9e5r93qPRJu3SIUVQLc7OfafgdK1ci4T+IRdwLmg/0mpoU78ASxKv1RE/FuGSFL5jlMnxQxgnymlaoqk/l9ow9CTzcLS1j2qd1zE+hEOeiV96957E/lNh0lF2WTH3Ytvp7L7i9bFwNvEKebXgBvusMv2GGRkZKkoKatmbAdub3BbWX4EKsGt/fBtTXyGQ7wZTKV3jAYKnllgVH1eny1BBwCovYFzAYRaa92A9ZP5DjjrqSSKMmePknvLj9cWgCXh769wX+fUXbaQi8Y0HrJeTh3NoUxtYk50AIBLhWiWImueEaqw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5142.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66574015)(5660300002)(122000001)(15650500001)(53546011)(2906002)(52536014)(6506007)(7696005)(4744005)(9686003)(8936002)(82960400001)(55016003)(83380400001)(33656002)(66946007)(66476007)(66446008)(64756008)(8676002)(66556008)(4326008)(71200400001)(76116006)(186003)(38070700005)(316002)(38100700002)(508600001)(86362001)(26005)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjJhd0Mxa3JSY1RnWDM4a2ZJNUkzNHFqWEc0NmVCbjFGY1RrNUxwRkJzOTlN?=
 =?utf-8?B?MnM1L3dIaGxJV3J0bzBITW5OUHM1dG9ic2hua2tRdHg3L3hZWmtOUENoYmJU?=
 =?utf-8?B?dGRoTE5UN2RVMjBrMnB2YkZvNlVMUmNEMC9TSFhIbzVXOG9iZFBFNmhwL3FB?=
 =?utf-8?B?cUFQYUhkc045ZzJaQ2pMVXlRTHFrWnBDNktGNzgzK2p6TmRxcW1jM2xnaWFn?=
 =?utf-8?B?ZW9SaGpmZ3NlNXJpUStMYWpEWUVWNG5Ec3BBT0o3Nmd2UzNVd0JRUFY1NUN6?=
 =?utf-8?B?UHd1dmQ5OUZ2Z2RrQTdBMjlZZG96NHM4QW9ZU21ya3N1OFE4dEhFWUdCWjBl?=
 =?utf-8?B?TWhyVVBFejYrNDhIbTdwL0FVTndXTGVGa0dnaTFBTW1uUSsxVXR4ellIbzRo?=
 =?utf-8?B?MzNsTVB4TEEyZENiaUVlTm9jRlcwUFc4OXBUVHhSYWZobG5EUUpjVDRSbjJS?=
 =?utf-8?B?a2IvUjh2R1l3TjNIN1QvaGRac2ZxZmYvditpWWM5bG5mM1R1T3RWZ0JKSVVQ?=
 =?utf-8?B?TzFFaEU2aG1ROXJSUFdZaDBRYnMzWmVxTzRqNEFlVTNEU01XV2duSUlDd0l4?=
 =?utf-8?B?bHFtcDV3Qk5jdWQwMW5xLzNDMDloSHVJcHJyYmx5eFM2NFFRcHpjNFpaK05w?=
 =?utf-8?B?VWlCTEl4U3pFdFJFc0lKVFAxemFzamJWRjNqY2xFRnFSaHp4UWVYM1FtQUN6?=
 =?utf-8?B?OS81RGY0bDRQRTFKaFdxK2VGSmdFVHlUMVViYXp1bWxnUThsZXNNbm4vUlVN?=
 =?utf-8?B?VllJdlFFV0g4ay96U241WjBrTnVBUk5iTFdoRG9pcWU1WS83OWJGSHAxaTQy?=
 =?utf-8?B?OWdKMnFjcXQxdU9yc0V4Tncxck56MkQ3aTZHWG5MeHp3OSs0ZXdaSXFGKys3?=
 =?utf-8?B?MDVvMVhxMDU0akFVdmpMa3NYa1EranhVTm56Q21MWWtlOU5rdUtCdG91QWtX?=
 =?utf-8?B?YkRYZ1dkZ3lnZGRzTVJJcENodUtBYktUK0RvL3IydEpNbEQycHJGUmZYRTZB?=
 =?utf-8?B?eHM0Vm9IeXBtc2xMKzlKeUJydVV0QmVRTW5NRkt1NHVzQk5kMHVGUlA5cEsy?=
 =?utf-8?B?V3VpR0VXeUZ4Ukk0T3lzcTA3NmJZSEFUSmxmSDVxbEVXUXM4VnFWcUI1SFdU?=
 =?utf-8?B?dmRIOEMzZHpuUDBPekJNWU5HWml1Y013RXZ0Njc3NjE2TWYrTFZVSVhoWXpu?=
 =?utf-8?B?TmUweGJvSGFIRk5DNVBiY1VJNGJJM0dvR2NBRU8wOEZKOVI4QnJtOUhKK0F2?=
 =?utf-8?B?N1lWNi85ZjlMcktNNTJEVnJmWEZGOXNlL083ZWpBUERYNWo1WkkvVTNXL0lJ?=
 =?utf-8?B?RDlqazRETnNYREFiK0l4MWlsTy9Tc0QwOVZIRkcwVWZnRU92cXJrenZxYkV1?=
 =?utf-8?B?ejJKYVVZSlVSbnNpbTVNcHc4cVovblNlTzM3T2lVTUN3cEYzVHI0U0IzNFU3?=
 =?utf-8?B?NU14ZzZaMFp5UWdLN3ZXaHc5YlJheUhSV01nME53L05scElvcno4d25KVEoz?=
 =?utf-8?B?WVhidU45Rzk1dVRDSmpZb1pHWCtXN3U3aElRUmE4VWJNRWloOXZIRW92NWRP?=
 =?utf-8?B?QUxIUUY3b2VHc1Frbjl6Qk5ranYxUUk3ZG1qNkh5RTV6Z0xvREl2eDRpK3RO?=
 =?utf-8?B?cEdVRmgzL25TZENNcytDQTJwRUZrL25Uai9IR0pCZWU0UGdhSkhmOEdyZzNt?=
 =?utf-8?B?TlVZNWpkTGxJUEJoWGFjT1F3UkJLbWZpQnNTcWFjRzBqVjAxWXlhZ2kvR1dp?=
 =?utf-8?B?bXliYTFpMzhqdEtmblRIMGQxZDB3YWZnbVg0NTBmUTZnazJOOFFUaHN6SkR4?=
 =?utf-8?B?d1daZDRSaEIzS1BVT28ycUtjNkhVYnpnc2hvZjBMUFBUM2VnWnVZMW5Ec2ow?=
 =?utf-8?B?aFRDVGM2WEpjMC9kRjJDSHArZ28vL3VCTDFuRkYwbGdlR3BWcmM3alBPcHNK?=
 =?utf-8?B?UUJYMHIzN1JOSmx0UjNoZnNZdDRuWVNQcHk2RVAwSVN6aUJkdjFGZDJaL2pj?=
 =?utf-8?B?eUpkNjFjNnJuTDVWUllET1lwU205UmFzVnRXL1F1MnpTQUtwdXh6ckREOUp0?=
 =?utf-8?B?bW9Yb09WZTNMTEs2Yld0Wjl5ajlTclBSejNiVVZtRkVQc2R1S2tmZno3cWF0?=
 =?utf-8?B?YXNvTW9TejdhaVZXZXRUKzdkOExlaE9tZkVyZWJjdHVlVXJPdkZSYllmZzF1?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5142.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6af04d-f58c-405c-4149-08d9f7974120
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 13:12:04.5161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ynV7QzZ3r0c9c7M7+BBzAjkK05nBmJFVidFqzcb113wEr2Sriw6ryFmo0GQ7May4sljy6NVu1zI8+8dUEUruFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1871
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64

SGksDQoNClllcyBJIHdpbGwgYmUgYWN0aW5nIGFzIHRoZSBjb250YWN0IHBvaW50IGZvciB0Ym9v
dC4NCg0KQmVzdCByZWdhcmRzLA0KTWF0ZXVzeg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiANClNlbnQ6IFRodXJzZGF5
LCBGZWJydWFyeSAyNCwgMjAyMiAyOjA4IFBNDQpUbzogQ29vcGVyLCBBbmRyZXcgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IE1vd2thLCBNYXRl
dXN6IDxtYXRldXN6Lm1vd2thQGludGVsLmNvbT4NCkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNClN1YmplY3Q6IFBpbmc6IFtQQVRDSCB2Ml0gTUFJTlRBSU5FUlM6IHVwZGF0ZSBU
WFQgc2VjdGlvbg0KDQpPbiAxNy4wMi4yMDIyIDE4OjAyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
U2luY2UgTHVrYXN6IGhhcyBsZWZ0IEludGVsLCB0aGV5IGhhdmUgc3VnZ2VzdGVkIGEgcmVwbGFj
ZW1lbnQgY29udGFjdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCg0KTWF5IEkgYXNrIGZvciBhbiBhY2sgaGVyZSBwbGVhc2U/DQoNCk1hdGV1
c3osIGl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSB5b3VyIGFjayB0b28sIGNvbnNpZGVyaW5nIGl0
IHdhc24ndCB5b3Ugd2hvIHByb3Bvc2VkIHRoZSBhZGRpdGlvbi4NCg0KSmFuDQoNCj4gLS0tDQo+
IHYyOiBPbmx5IGFkZCBNYXRldXN6LCBhbmQgb25seSBhcyByZXZpZXdlci4NCj4gDQo+IC0tLSBh
L01BSU5UQUlORVJTDQo+ICsrKyBiL01BSU5UQUlORVJTDQo+IEBAIC0zMTgsNiArMzE4LDcgQEAg
RjoJeGVuL2NvbW1vbi9oeXBmcy5jDQo+ICBJTlRFTChSKSBUUlVTVEVEIEVYRUNVVElPTiBURUNI
Tk9MT0dZIChUWFQpDQo+ICBSOglMdWthc3ogSGF3cnlsa28gPGx1a2FzekBoYXdyeWxrby5wbD4N
Cj4gIFI6CURhbmllbCBQLiBTbWl0aCA8ZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbT4NCj4g
K1I6CU1hdGV1c3ogTcOzd2thIDxtYXRldXN6Lm1vd2thQGludGVsLmNvbT4NCj4gIFM6CU9kZCBG
aXhlcw0KPiAgRjoJeGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Rib290LmgNCj4gIEY6CXhlbi9h
cmNoL3g4Ni90Ym9vdC5jDQo+IA0KPiANCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIFRlY2hub2xvZ3kg
UG9sYW5kIHNwLiB6IG8uby4KdWwuIFNsb3dhY2tpZWdvIDE3MyB8IDgwLTI5OCBHZGFuc2sgfCBT
YWQgUmVqb25vd3kgR2RhbnNrIFBvbG5vYyB8IFZJSSBXeWR6aWFsIEdvc3BvZGFyY3p5IEtyYWpv
d2VnbyBSZWplc3RydSBTYWRvd2VnbyAtIEtSUyAxMDE4ODIgfCBOSVAgOTU3LTA3LTUyLTMxNiB8
IEthcGl0YWwgemFrbGFkb3d5IDIwMC4wMDAgUExOLgpUYSB3aWFkb21vc2Mgd3JheiB6IHphbGFj
em5pa2FtaSBqZXN0IHByemV6bmFjem9uYSBkbGEgb2tyZXNsb25lZ28gYWRyZXNhdGEgaSBtb3pl
IHphd2llcmFjIGluZm9ybWFjamUgcG91Zm5lLiBXIHJhemllIHByenlwYWRrb3dlZ28gb3Ryenlt
YW5pYSB0ZWogd2lhZG9tb3NjaSwgcHJvc2lteSBvIHBvd2lhZG9taWVuaWUgbmFkYXdjeSBvcmF6
IHRyd2FsZSBqZWogdXN1bmllY2llOyBqYWtpZWtvbHdpZWsgcHJ6ZWdsYWRhbmllIGx1YiByb3pw
b3dzemVjaG5pYW5pZSBqZXN0IHphYnJvbmlvbmUuClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNo
bWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvciB0aGUgc29sZSB1c2Ug
b2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVk
IHJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3Bp
ZXM7IGFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uIGJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkLgo=


