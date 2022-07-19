Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D994C579420
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 09:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370437.602204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDhco-0006bX-HL; Tue, 19 Jul 2022 07:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370437.602204; Tue, 19 Jul 2022 07:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDhco-0006YB-EM; Tue, 19 Jul 2022 07:26:34 +0000
Received: by outflank-mailman (input) for mailman id 370437;
 Tue, 19 Jul 2022 07:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z3/S=XY=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1oDhcm-0006Xg-F2
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 07:26:33 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 194fc61e-0734-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 09:26:30 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 00:26:16 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 19 Jul 2022 00:26:12 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 19 Jul 2022 00:26:12 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Jul 2022 00:26:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 19 Jul 2022 00:26:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Jul 2022 00:26:11 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CH0PR11MB5250.namprd11.prod.outlook.com (2603:10b6:610:e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Tue, 19 Jul
 2022 07:26:08 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 07:26:08 +0000
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
X-Inumbo-ID: 194fc61e-0734-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658215590; x=1689751590;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=avsFE9lFn77Cqu+w62BqJM80TUs4u6jb51ngpyX/usQ=;
  b=WhUQ7uwhqZSha+hl9b+8qjDoAqSi01UZ1sV1DocJltQtZ5P0++YIZC9f
   FZnJRQath2iXFFPCnOYnd9yLGgjxsiGeAx0+RF6bb5qIPpASnLFyIWxoE
   R4rY0L3Ngd05p7Ejqqw/8IbwGvj0zN/frhpmuLlJjmJW/ilsRR+PNS2J6
   vU1/Pszi/ehY0dF9anQoa30b0gLwjwOR3P8aCASGj+GcMj1ZjAjiNUqS5
   p7UPAawPQ01A4KEojXcGZPLehY38NpIu/nC3MapWm7dQaHy3w5Jchn1BC
   1cmBAmHeNH88x3a5y9q/dZg4x7twJJjwZL/EhJ4jeAGl/o2ft6xSDgT1s
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="372723337"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="372723337"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="630226963"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWdLm7ysOTWfb0BUPfG237GTjVguV+ScUhjuFwQZGO85fpF88BKo3rLAk5HIRYGd8W48StUyJshyShuYvpdUY0apzaXh03PLDjGKjipURUdUXSTRXcWAKMCchiDjCQpfD7GrxSFZH9OU93cng9c3aEXlDC/TBtlCirecU9n8fibQIf58OCtZEgmoCe+G0Ld+G5aZu1FGVBCATghaLdpHs5QZOhg1pxCDF+KFEREdzOifKmzfB1kNBxVOUO9iOoWswt8PwLSRPKf5p2XEpa7n02oka9cGnw9CzxeBfmTm2uMtSE9nTvBW5v6YOFF+kQsORZiVCpaQltSB40G0ENUmnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avsFE9lFn77Cqu+w62BqJM80TUs4u6jb51ngpyX/usQ=;
 b=hlaO9yNdXn3bWZZRE8eZw5Hct4mjwpIJEII2OuWM8XCqXyDc/xfu8TtDZUCVZk99AyrDTJC57iSMqZuuCYVDhyeOZCmCtzC3J5HhU6sUQb3w+sxIeYyfugrLgfKgpCS8rfYFK/yhBsTf0CmdE4+jotyc1CUu8TFGiOrr+hbn8Eub8XVhIXIdyOyXvdDzpq8DwZuGu9V7csOe4VcvBG8qHnJwwoC/yvfSp69Z9JSg6EF4n085fXex9qfXH/q9KH6gsigSbrXdX/lERjtPnUL9Dp8BP54UeYW3nhsYad7Ruw6GO/21N6KBQON539KtwloFUcCdZ6lTlFbne3U5alNYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "Beulich, Jan" <JBeulich@suse.com>, "Cooper,
 Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v3 1/3] x86/vmx: implement VMExit based guest Bus Lock
 detection
Thread-Topic: [PATCH v3 1/3] x86/vmx: implement VMExit based guest Bus Lock
 detection
Thread-Index: AQHYjUzyisX0+ExRGkiFh4Bp+KXF1a2FZhTg
Date: Tue, 19 Jul 2022 07:26:08 +0000
Message-ID: <BN9PR11MB5276F1BD6EF95A7E35534B648C8F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220701131648.34292-1-roger.pau@citrix.com>
 <20220701131648.34292-2-roger.pau@citrix.com>
In-Reply-To: <20220701131648.34292-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7c97caf-94e1-4521-14e9-08da6957f2e4
x-ms-traffictypediagnostic: CH0PR11MB5250:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zWXBtGcZP+tGZ1E4falRXloSJU0vOkC8t+UX3TocsCfJOxbGjBPi6TDNCLKU2MXdRJ0m3sFGrYI1IBDqzIicJ4abXL+kDfejNpZ6Ihm9MUzDTC7dplTXx9a9MID7YNQCAD4QYbbJu4nn8urrKn+6oNNF20wvTISrWONa+K1HeOoh50Lwc96bv6DOOEK+3aEGj4fmIv2MohRcZpsiphvhwEzpt9h6btA9U9S1Si8uUhTweX2p+oXEi/X8TjxTNZfGpX1HnkBYlZ2n7PYfjJKwnXkCK3+yjBqrJeInKTgE/nhmmP23+4vBo25T/R3GeD5eGLoBlimEvv0P17R3ONe6QGI3Z6BXDYSJtD/vP1yNWf2EqnTxHaBbjnkAxrMKeqhufmIv8tdJprK/gy2z1YjALCA9M3fnBbObxB0XAYrWRNxhNMTf6cP0Aq3cMct7NcxFG2ZDSEM+37JNP2ZBTTGwpvWuYeZF9fXsi4rxOpQu4iehIU47FhCU5+w3bRkkmGxWFdAZ6C6RzT1cuVaqRcNY1jVY8iHxZ8hWDHLMHZEW4l0peTyxC4PtV0oaMh4zOpixAYVhwgdxXsRTTySoxyBTeGj9bgHOQP5P83KmZosuwLjsk8jIkXYJPEALG9JBDj1fnWzc6x8u0b4pJMBN1ickTkxEurc5vGvhRmiID6Y6v9uZ/oUbh4FGsX8raYjulDuEujXJtE7OXSSUSuSQlf25jn79dN7l9vas+vKTPu7FIlnarmgCHEkB3g3Fjfx0K8UvJ3ZtzsFQfms7QRWb4MuNayLZfGNFZcKom2xY22SzAtWLKXsSvL9T7e4Z5pOi1PrA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(136003)(366004)(39860400002)(346002)(52536014)(8936002)(4326008)(5660300002)(55016003)(2906002)(33656002)(8676002)(64756008)(110136005)(54906003)(76116006)(316002)(122000001)(38070700005)(82960400001)(26005)(86362001)(41300700001)(186003)(9686003)(7696005)(478600001)(71200400001)(66446008)(66556008)(6506007)(83380400001)(66476007)(66946007)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3I2eFJZeHFROXhZeWdtVVhXL2p0ak1vREJ2U1Y3S08yVmxHS1dBbUpRVHZR?=
 =?utf-8?B?K3daM1RkZDhrb3dLYzZUN29YT05TYUlxZUwyd2xCRGlEa0Y4RFVKY3krRXdp?=
 =?utf-8?B?dlVWWjB3S0YveG5YNUlqRGtjRmw1Z1kySDk4MFVIOGpFbHBibGg3OUs0eHl6?=
 =?utf-8?B?YXZDaXdNbGdrWXczN3ZzR1VwUm5kWk5HdjREaWs3Wko1M21kSUtWMnhQL1FE?=
 =?utf-8?B?Y0R3U3BDbUpFc2phQXpyOTJYc3pscUFlNXo0WS9zbUxtREx3U3pNYTg4Wmsy?=
 =?utf-8?B?S2pVZHlYZ0xhZzNUZEN1TmM5cDhyWS9lZEVEMk56OENKMmVhcWlZNU5wYkxl?=
 =?utf-8?B?djBtYWVNWUE0ZkRRVXdPTVNabUwrRy9OanJaejdDdWJ6OU13aFNUMEM2NFlF?=
 =?utf-8?B?QThMUEdCWEFCQXIyM1VCWFQ0a2E1bEFzcmlScFlPTE4wQWtWYU5OYWNDTjZW?=
 =?utf-8?B?VkpUVU9FU1BmU01hais5Mm5YdkV6OGNXMVJNb3dtWUlPdm00bDNHQUZXOHU1?=
 =?utf-8?B?eW03MCthNnUzaHBXRW8vclhaamt1VjlnUi9VNzlVQ0pyQ0ppNWsrZjk0NlF5?=
 =?utf-8?B?V3BROHBXTk5PSGhlTmk5cm42SHM4dkZna0RZV3ZYdHdkRTJtQU95V203WERu?=
 =?utf-8?B?cDdXNVlwVlJLSW9iOGlJSG1XaDNVTkVpTHJCTlpEQ3BsM1BsdUZJbEU0VXRF?=
 =?utf-8?B?MjgyT0pzRkkrTS92djdQbmFtdVpmOFFrVkJ3dGhSbVRsaUN4eWU3WTBUbmRK?=
 =?utf-8?B?SmV2dDBta3VGdzk5VFMxRGNNUE1iRkladEtqOWRuL2NSTWJsN1ZDcFRJVmxF?=
 =?utf-8?B?a2tLdXJ5VFp1N1lGRkNOYmhoQXRZWGxuRGM1bURNOWx6eWFJQTJvM3V4NGZm?=
 =?utf-8?B?VjU4Q01odFF2YmJMSjdKcGdkdWhjTndUd2ZZa2h3czgweERwYkdzVUVBUlBa?=
 =?utf-8?B?YWh4VFBCVXBGdFBMcmRLbEU4a0FmREl6Sno0bVppejQ3TmdWUmFQcUR5K3hp?=
 =?utf-8?B?by9aS1N0bEJCNE4zbk5PcllFYXJjcW90ZmdxYVRrYzQxRGJxaW96QlIxN0I5?=
 =?utf-8?B?TFBhZXBjd3JYNnZka1gxdU5zb2NkMTVxdVIwL045emZqYzcwN0ZLZlBDalph?=
 =?utf-8?B?dVh0VU5JcnI2dVdxb3Yray9jNVZDMjVmSzNMblIwdWtsUll2QnU2OWRPbGg1?=
 =?utf-8?B?ZWVnVVE3bGlicFFpNFo0Y0ZDWlVLLzBtdW9wVm1VY0RCcXBRQ0QzT2tYT1hh?=
 =?utf-8?B?OFVoalIxSk9abHdaaThIVGh5SG5NYmVZRXVjMkdnUEU4Z3k5M0RkTEY1NDQ0?=
 =?utf-8?B?SWFTaWcwcnVOL0YxclZYYXFETW4vaktvQkFZMGliSElPTXFQNXZZUEZtV3hj?=
 =?utf-8?B?TUdrTVdhc0pobEdLZHNQMEdrN0NOMFhtenU3Wko1dnVwSnFXeE1kdEhvWU5N?=
 =?utf-8?B?aE04NXd3WW5vSndMcnBMMGRFVVRUWkpYeFhKOW1qWE5FcXR5ckRDVmhqZW01?=
 =?utf-8?B?eENGMzJFVzREelhSRmRGS29ZRnZpSmtjZVViRHRKRzZEZENWWjZwWWZGUWI5?=
 =?utf-8?B?RDNyM2c4NFYrTTlRN1hRcjQ3eWphUFZnMExZMk9VS2Uzd004a1dvRXdkL29Z?=
 =?utf-8?B?M2c0U2FGeGZWZnpKS1daRzJIQzBZS051SjhOTnBJcWtXYTNjcTlvY1d5WWpW?=
 =?utf-8?B?T2pIa2dPcE1lUFlqQURrK3ZObTNLZkd4ZThlT2xWbU9XOWJsaFB4cDhmV2Fr?=
 =?utf-8?B?aGxXamxSWHg4TW9sYy9nNDNwSXJCOTJVV3V4ekM3YTA5SmFlb295MURGZnZk?=
 =?utf-8?B?UjcyZ2E4c3p1dGg2ZWp5cXpkZmxobERBMlBzY1NOeU5pMFNPU2xOR1JPZnZ5?=
 =?utf-8?B?TjZmTkZUNDNzd2x2MUgwcXZDYU8rc0EwM1BBMlBHWndSOGtUSmFBekg0cCs3?=
 =?utf-8?B?VEI0QkFFSm5qNWFZYTJhWnlhb3JrdUplMW5RSkZCQk82aFFLRW1yRnJlVGxM?=
 =?utf-8?B?NGJMdUI5a042MW9QSzhCWjlrUHI1MnI0b0U1cER3Y081bmZ1U3lFSXkxdVh0?=
 =?utf-8?B?cVNORkNhVFdZekFXdVVkNEpjK3g2L1dCZWZYUlFVUDU4VGpnNUovMkdiMFdY?=
 =?utf-8?Q?KO0zUIEKekHTsn3JyCWjvqfgY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c97caf-94e1-4521-14e9-08da6957f2e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 07:26:08.4139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ze96FF6RzUuWFMJbEj5YY8kzueM/kF1VLv4jKnxSXeG9pX9jrmgsCdiDOiIHrXgJB1s2ssIPKCrZ9WNck1QUjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBG
cmlkYXksIEp1bHkgMSwgMjAyMiA5OjE3IFBNDQo+IA0KPiBAQCAtNDA2NSw2ICs0MDY1LDExIEBA
IHZvaWQgdm14X3ZtZXhpdF9oYW5kbGVyKHN0cnVjdCBjcHVfdXNlcl9yZWdzDQo+ICpyZWdzKQ0K
PiANCj4gICAgICBpZiAoIHVubGlrZWx5KGV4aXRfcmVhc29uICYgVk1YX0VYSVRfUkVBU09OU19G
QUlMRURfVk1FTlRSWSkgKQ0KPiAgICAgICAgICByZXR1cm4gdm14X2ZhaWxlZF92bWVudHJ5KGV4
aXRfcmVhc29uLCByZWdzKTsNCg0KQWRkIGEgYmxhbmsgbGluZS4NCg0KPiArICAgIGlmICggdW5s
aWtlbHkoZXhpdF9yZWFzb24gJiBWTVhfRVhJVF9SRUFTT05TX0JVU19MT0NLKSApDQo+ICsgICAg
ew0KPiArICAgICAgICBwZXJmY19pbmNyKGJ1c2xvY2spOw0KPiArICAgICAgICBleGl0X3JlYXNv
biAmPSB+Vk1YX0VYSVRfUkVBU09OU19CVVNfTE9DSzsNCj4gKyAgICB9DQo+IA0KPiAgICAgIGlm
ICggdi0+YXJjaC5odm0udm14LnZteF9yZWFsbW9kZSApDQo+ICAgICAgew0KPiBAQCAtNDU2MSw2
ICs0NTY2LDE1IEBAIHZvaWQgdm14X3ZtZXhpdF9oYW5kbGVyKHN0cnVjdCBjcHVfdXNlcl9yZWdz
DQo+ICpyZWdzKQ0KPiAgICAgICAgICB2bXhfaGFuZGxlX2Rlc2NyaXB0b3JfYWNjZXNzKGV4aXRf
cmVhc29uKTsNCj4gICAgICAgICAgYnJlYWs7DQo+IA0KPiArICAgIGNhc2UgRVhJVF9SRUFTT05f
QlVTX0xPQ0s6DQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIE5vdGhpbmcgdG8gZG86IGp1
c3QgdGFraW5nIGEgdm1leGl0IHNob3VsZCBiZSBlbm91Z2ggb2YgYSBwYXVzZSB0bw0KPiArICAg
ICAgICAgKiBwcmV2ZW50IGEgVk0gZnJvbSBjcmlwcGxpbmcgdGhlIGhvc3Qgd2l0aCBidXMgbG9j
a3MuICBOb3RlDQo+ICsgICAgICAgICAqIEVYSVRfUkVBU09OX0JVU19MT0NLIHdpbGwgYWx3YXlz
IGhhdmUgYml0IDI2IHNldCBpbiBleGl0X3JlYXNvbiwNCj4gYW5kDQo+ICsgICAgICAgICAqIGhl
bmNlIHRoZSBwZXJmIGNvdW50ZXIgaXMgYWxyZWFkeSBpbmNyZWFzZWQuDQo+ICsgICAgICAgICAq
Lw0KPiArICAgICAgICBicmVhazsNCj4gKw0KDQpXb3VsZCBpdCBiZSBoZWxwZnVsIGZyb20gZGlh
Z25vc3RpYyBhbmdsZSBieSB0aHJvd2luZyBvdXQgYSB3YXJuaW5nLA0Kb25jZSBwZXIgdGhlIGN1
bHByaXQgZG9tYWluPw0K

