Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFC0685EB8
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 06:08:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488097.755995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN5LW-0002Wo-Kt; Wed, 01 Feb 2023 05:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488097.755995; Wed, 01 Feb 2023 05:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN5LW-0002U3-Hb; Wed, 01 Feb 2023 05:07:46 +0000
Received: by outflank-mailman (input) for mailman id 488097;
 Wed, 01 Feb 2023 05:07:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rT7Y=55=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pN5LU-0002Tt-TP
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 05:07:45 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a23eb06-a1ee-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 06:07:42 +0100 (CET)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 21:07:39 -0800
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 31 Jan 2023 21:07:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 21:07:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 21:07:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 21:07:36 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ1PR11MB6180.namprd11.prod.outlook.com (2603:10b6:a03:459::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 05:07:34 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 05:07:34 +0000
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
X-Inumbo-ID: 5a23eb06-a1ee-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675228062; x=1706764062;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SyOIbm9Tko8Y6FhaRs8AOgk8lWyPeSs6F//NeVjr2/U=;
  b=WnNVWlJgmo+N5A4u5HFA5MFZnM0JxUr5MH3EHREA6nvzLi+kOi3tuSuJ
   kczMlPfVWtxk476MHeKornTCMKwMGbrCN8xQTsiTE+fKu1Pm8E1HPd7EF
   D7/tJS0eC3rWu6AuJF7EsMDwvlkBUprY4N4Lq/CxVJHmUBJ+bH50CHVfG
   LBj+O0mxS7n84buzpt/UGtsXsf7iTnxrxPAu9kIAlZTLkKu3HBBpnGk3x
   ecb4AVJxm8tGgWsQMHLCBbhAcv7OfWB4b3/sZ5czfM3WiVHv6sGo8JyUe
   iGTAcgfoeIG2G9Thlv90OmkeM5Ue7bSSsuU7+cLZqvxkkcp5pRUW+4jwT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="330154157"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="330154157"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="614718406"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="614718406"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxDw4H8jSF6flxmkd2RMiSqa55zJXe8Qu3Dm7a792MdRju/SwfbO5sMk7JlN5MzniYbxsWqMQRyugnAqrK0DsAfKpMAGeWOLXbWNTS0BgC4j3RG8g7ptE3Ta6l9CFUP6d44Ui0QVYQmrZ19F7rNWM8HbbrfdYptxXagozOvARi5bqoHhg6h3m3qCYFWSnP32X8M6mKh+AETXfF/kKgoZyoEqugplxsXwT27BcNBgwH2NQUZPk7UeWS7T0HCRXtc2V8ASp30L2eRNr+vtgUznLEI0zvS866NSqxJbaaeVAw8g8VxEctef5hwBlFePGj597JRRbzkchGHBea4Qh+Nf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyOIbm9Tko8Y6FhaRs8AOgk8lWyPeSs6F//NeVjr2/U=;
 b=mCHJDWKIuSND0JNzK07bScKmm+dCMhM/1iZktezkIbRtu9nulNxYRWHlMDE0cMHrat0tOFU6aK0EmJJpZS7/b796KxbMGepMT7w7se/fHiLhWF8lJ7RlXJ4fY4866oejmW+ZBrmmJmlZQoCotSOVroeaRm0pN17t3SBLfQ3Vu3Y79dqc2YQ1G7QLSCbr5Kr/m3GTyDsGIhhOwbuMX5RKrRnWCIuqJc7HmbLpjCpYcTka2TXrzqkKnlMuN0oek4755BoXbFhyVoP+seU3YipQp4q73opSKXD3Mqx6b36KwFt2ie1rwbEBwRj/hh2oJAvgRSAGh7YxF8xoq/+i82JbkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Beulich, Jan" <JBeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Pau_Monn=E9=2C_Roger?= <roger.pau@citrix.com>
Subject: RE: [PATCH v4 2/5] x86/iommu: make code addressing CVE-2011-1898 no
 VT-d specific
Thread-Topic: [PATCH v4 2/5] x86/iommu: make code addressing CVE-2011-1898 no
 VT-d specific
Thread-Index: AQHZL/FVJOdom3IWD0Wag5ryo7ERT665k35w
Date: Wed, 1 Feb 2023 05:07:34 +0000
Message-ID: <BN9PR11MB5276023EB640F1CE9DD72BEE8CD19@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230124124142.38500-1-burzalodowa@gmail.com>
 <20230124124142.38500-3-burzalodowa@gmail.com>
In-Reply-To: <20230124124142.38500-3-burzalodowa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ1PR11MB6180:EE_
x-ms-office365-filtering-correlation-id: 9e9bba5e-4387-44f4-9819-08db04123aa1
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2vtiLBIMX2Zcq5e7IcFB+BWkJDzzzqb9Qkc1HzUbm2eheQhAVMn3lrqc7N7tBYAYB0gWpazKcGcmWhSL9jyBb1Y9LPA12bs/aS8zNCexAqzEzoV9kz1tZG/TNKVhYBYUXcj2maTQZ9oY7h8obmLkBjoiAlisjLDslDf3p5QN6Hd+bE5OCAmp69q94c487zV256ItrtEmoAzEoPgwfcjKqimnAjOY74caxXNx1fxHj8FzRExmxYTBEtJ/buA3OKCVfMEvpikuIu1IsP6c6APWbmJz54RMSEIGGXZhczNAsQzUN1agTRnCL9V5P32Pi49Le0z8Zb5muyMi2erOWMY8Qp2Nqpkn7txAXjahiZnT7sQQlWDI6KIRFvyT0krMbP37X25xd7qBNAaylsBRqwv/eQVewcq/QbIIr6+FX+VYZSOFcQfPNk5Dn1vew1fhOogaQCsFWbgmxvNL7BOzSCiV3cYkGQi4GAsxcCKvzNOuHr8CSViMizo0iy8v/FLRE+qkaKpqRsmRbdIROprFWlFyoHs7Bl+DT9PgB4OASht9PaWza0YWTYWVLizzXfiMPSuV7Asg4WYV4kyzrtie0Atd9bFJ0FiD4b9y+ZrW7/NFy2eVR8bycoq03ano773znXRNV6ScAdadcyFEzVJ2bUlJisArZAkweCanKVNtltCjXyqkqrRyy9bD9s5XX4YfkaAXKme1+0hyTlMIB67DMVTR7rP1QDRi8AehYMJhyu5hAwM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199018)(8676002)(64756008)(66556008)(66476007)(66946007)(66446008)(76116006)(83380400001)(110136005)(316002)(54906003)(6506007)(966005)(26005)(9686003)(186003)(478600001)(33656002)(71200400001)(122000001)(7696005)(38100700002)(86362001)(38070700005)(2906002)(55016003)(4326008)(82960400001)(5660300002)(52536014)(8936002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6NmcPFXxqiNr9mReET9I09Lljt3DPeCE3N/Qx9uZgqv93bnC54U7Njz7Rc?=
 =?iso-8859-1?Q?bFYy9piyylEBPICsHunbb+rPGZFgXReGeplBnfAz3YBAVqAVuNWKaNl03u?=
 =?iso-8859-1?Q?m4WqYercR1Xc7xGUhKAqbgUEf45pGKALTU76E/BBciGZOdT86uQILZekWa?=
 =?iso-8859-1?Q?+JPr2XxGR3w9K/d2yjOEujZCUAgdRheX7wemWitvsrwKxD28q05kfEpqEh?=
 =?iso-8859-1?Q?vta0maHl/vRkjKzKNyX3qLk/+h18F0l9VDmQyLC3lE1+3qLyCQjxD4EF+r?=
 =?iso-8859-1?Q?NrYlHu/6lQ1Rov42k+9fxmuNECjhXQ8PLFA3mc362aze6GzfUTPE+RvjEz?=
 =?iso-8859-1?Q?E2JRS1B6y5uqRKSKCTKekasbA2Z7giS92My3UaRJRUM5AEHmjtSe9qxn6g?=
 =?iso-8859-1?Q?NHxkZipaXL1pJkMxCyQsnYsVaSd0QcEvxGmr46YOSV7Msuh6m71mGRLai3?=
 =?iso-8859-1?Q?ljjG+VvLfNi4TuoQFnVKxb+7twXp33SLnqojKCYcsumuigx+O41Lnrl8sO?=
 =?iso-8859-1?Q?0e3liAMFsoEm5Uf5Aov0xr6vsfik52fX2NSlbqJpXtLNsV+rCk0DjR6Jbb?=
 =?iso-8859-1?Q?miLX/HpNLJnzUNK1xVywluwlwrVJZpZSsVhaAk45AibzPnCPd6FQwiNA9r?=
 =?iso-8859-1?Q?5TIReIPLf7O5BomUItsPynlIFUliLQkxeCsRhbgUHgXl7JSqGbAA+lbrcF?=
 =?iso-8859-1?Q?oDPPC8r0AuW2K/ZlaELKaj/ag6RV1DXl2AWkAsF22IHTrwYRAT7Br+Db/F?=
 =?iso-8859-1?Q?FQ1Lx/Ja6vL3ymDzEoNyhUe4GNihvfYn/whGcIQ59MZtkvoBGvkbMVPOgh?=
 =?iso-8859-1?Q?FkiU7JdyXYMsC35VadDy9Yca4HZ3d+saV7ViV/I6QCbI+HmBt8ypFgZppu?=
 =?iso-8859-1?Q?w8Rjwu2zAb9Q72wUudtSp/lKAxVIAcoEdiMtISXNTq1LW0R0jVJF6xk4Cm?=
 =?iso-8859-1?Q?UjkJc58O+uD3UyZOMzQqhZM+ZXGwe23YkU+mrf2TgQFMTjCU2JyR29sfXk?=
 =?iso-8859-1?Q?ejrVuF6ey4K4dlJOvySSOtSPMAoJ0X+C3ISllu0vQ10AxvYO9BEqaWFYcj?=
 =?iso-8859-1?Q?/6q/35mKI8c6DDU18Ra6sR6naWh2oY3aKJkxf5CLTZp5J2BOIwGhJNOqCR?=
 =?iso-8859-1?Q?jlqGhEyaY/Er/jQKdnx2lxnw2LUxhAqGwBqCD3hVx63uHTilfa5mUnv0au?=
 =?iso-8859-1?Q?e6fIHgVnxHn7WNASHpikySU92CppjMlzvCfsebKvdoxjOaS61zG2QWW0QT?=
 =?iso-8859-1?Q?S1YkbDS2FOTtKVo40fGl9wJUx8hky8+/aeP8RjutNi+zxdO7VP+MDKiPNs?=
 =?iso-8859-1?Q?CSJm55BhkCsFkOPe+fNrUeN91QghGvmrJcHIDWDJlbfofKmvJr73b3udw8?=
 =?iso-8859-1?Q?7TOHBGTJuZzaWzVhHgcnzoeXfxL4GWdOMJimBU9Jr2NKL91xNH8SsjjyVa?=
 =?iso-8859-1?Q?PMotpzM7JTMf3Ij3XEvKFw+69bBzl5+TqMl+LBR1QfIBU/5y1UFDQQlqzU?=
 =?iso-8859-1?Q?AN1Sks9X5+qOvu5LQ4fKvWWtVYIcovgKHCUdz4neBLP/6lLQsltBZwYvxg?=
 =?iso-8859-1?Q?te0eU78AnBIajd6Ina2auWTLycdYXh9dkD29Lfzygh0stN6sKUTlZ6lRRy?=
 =?iso-8859-1?Q?2yc1B2ui7N+Yoff6nd1vKqu9c854SpWESm?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9bba5e-4387-44f4-9819-08db04123aa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 05:07:34.2179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ka1CFagxje9Ign07ggGQBjKXYaPpaqj3OA6vu1Jzbp4FIAoX8r157+V5UTiPptLE8+tX2asu/Z2Ox/uIHOM2gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6180
X-OriginatorOrg: intel.com

> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> Sent: Tuesday, January 24, 2023 8:42 PM
>=20
> The variable untrusted_msi indicates whether the system is vulnerable to
> CVE-2011-1898 due to the absence of interrupt remapping support.
> Although AMD iommus with interrupt remapping disabled are also affected,
> this case is not handled yet. Given that the issue is not VT-d specific,
> and to accommodate future use of the flag for covering also the AMD iommu
> case, move the definition of the flag out of the VT-d specific code to th=
e
> common x86 iommu code.
>=20
> Also, since the current implementation assumes that only PV guests are
> prone
> to this attack, take the opportunity to define untrusted_msi only when PV=
 is
> enabled.
>=20

I'm fine with this change given no functional change.

But I'm curious about the statement here that the current code only
applies to PV guest. I didn't see such statement in original mail [1]
and in concept a HVM guest with passthrough device can also do such
attack w/o interrupt remapping.

Any more context?

[1] http://old-list-archives.xenproject.org/archives/html/xen-devel/2011-05=
/msg00687.html

