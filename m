Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50794F8CEF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 06:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301111.513837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncfuC-0003NN-5X; Fri, 08 Apr 2022 04:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301111.513837; Fri, 08 Apr 2022 04:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncfuC-0003Kg-2Z; Fri, 08 Apr 2022 04:07:28 +0000
Received: by outflank-mailman (input) for mailman id 301111;
 Fri, 08 Apr 2022 04:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XiXL=US=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1ncfuA-0003KV-7S
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 04:07:26 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62dad44e-b6f1-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 06:07:23 +0200 (CEST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 21:06:14 -0700
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2022 21:06:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Apr 2022 21:06:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Apr 2022 21:06:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Apr 2022 21:06:13 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB2572.namprd11.prod.outlook.com (2603:10b6:5:c8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Fri, 8 Apr
 2022 04:06:05 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%9]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 04:06:05 +0000
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
X-Inumbo-ID: 62dad44e-b6f1-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649390843; x=1680926843;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qe7eB1djGRTbiZBQklyx6HOMWFXUF8ac3wdWaK7mOYQ=;
  b=UbuKFdt4WAEu4MYIlBnoSEjOM67LhapnLmGwKbeNaajgWm/1vRCc1Np7
   AU8+cnYOWFGJqGfbKQ/GGv1kfDkCFsRJJUOYXVJZxQy8QkeRn/2RL+Cr5
   U4s8advA3VKTN/huFYAZ6AzhSrEliJmTbfOTqYTA6fT4uddpxwQo+IJMd
   ykar2iepbFkMPE3gEkyYsL/+ADTPEZ8CuWqYCRYzpOmZ9NFPHAFXRojf+
   fMMvD64+TTidHZEgQqFftyin8VdlPdfRThm+LMg6mz7WSMnFA9Bo18+jO
   RwyUCdSi5DhWBw8RIojQAbsiUl6dXhUeISdwiunpYKyPEwhW0L+Xx5lyG
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="243636948"
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400"; 
   d="scan'208";a="243636948"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400"; 
   d="scan'208";a="698045946"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiJfb7eUXE+jauO0ee182LfEzLsK1XSECnituG/+z6HLiHIqJRQmtlQbqjzFPCVTXZAUfRlxNAFqqSx4g+2gaTWIXerkgNwtKrQktD1b+w+/Ig+8W/IIs0OeTKDxAW/w3VokL6eEUXTB8b078f/2r1HVT0/hRsmITHeqQ58tq8XLFl5bCwz5wbxujdCDeWs4XuTQPFhAHv7aO/klY+G3MtpqRHJR/svdGou8pjSgT5zY+ji2oL89XG5l8BUKTIvdcrA5hapmX+k+5kU9ZcDzlQj2pPwNH0xovv/4xCXST62oiOYXXHozBL1Yhu2RbbVcT52KWMm8vpD7ci5gPa+I8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qe7eB1djGRTbiZBQklyx6HOMWFXUF8ac3wdWaK7mOYQ=;
 b=PpoP046jMEY+k/r4vkZp40paB2kXZsfkTvoYBcHzTALAthVJDFNgGQAmpcHTLW5h5x1K19H00okOtZpJeMY7n1SZJzbYNgbRCNE6APe+D5J8vM1/VV75zbli/pbd0CBtfieetFhDdjKbyPD01V78uqEaUdBMugaD370nNN54ln3/zLIxdU6sIVU/kUT7TEb/bgxPOcJUi4WrQYFhz3oK748i8Fzkvq6La5rGbyDIE8aIeSpHdmbNRqhfT8RHFg4keDfRQc8mWKFz5n7gAfXlt1C+oZazzCKvDYhKyDv86JgCv37w/kBGFApJYdQlJiSCFkh4Li0RZ9rsXIE+Z/ENzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Cooper,
 Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH v2 2/2] VT-d: avoid infinite recursion on
 domain_context_mapping_one() error path
Thread-Topic: [PATCH v2 2/2] VT-d: avoid infinite recursion on
 domain_context_mapping_one() error path
Thread-Index: AQHYSkZlky/MvMCmm0mF/2MIXKQq76zlZ0YQ
Date: Fri, 8 Apr 2022 04:06:05 +0000
Message-ID: <BN9PR11MB527603919C5C8C7906E8B6B98CE99@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
 <fcc51df9-0896-247b-d4ad-0de4db6c2a9c@suse.com>
In-Reply-To: <fcc51df9-0896-247b-d4ad-0de4db6c2a9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24234e8b-1d7d-4b37-d566-08da19151a67
x-ms-traffictypediagnostic: DM6PR11MB2572:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB257292F277720700C7414C458CE99@DM6PR11MB2572.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ke4nwXZXxUuIb4qkwPe2nUSQ/wJj9NAAtCjcNZ/ica9uyAsxEOXJifj+IlB1IfM6dd4C6WxdKlFC3yBzd5UPtDN71ZLvG/8+Cieg4FiN4vggattlKC3zj3fwivfQgH7+u6BaqpP7kjj6BpaiualnvWOGxn72ZFkY18cFWCBBsYAuNdtuxMn2OGld7pPmwdpOCONwBNLc7/nArDNBwUDRl2f0XKBkLdb+5IDz7jhr+vGFT1N8wMWzF9lL4t27q2Es0kKS7DMoX+hTdKiQAdZCev2/v0KqyAVUCnxnW9h4r0wplkHmcs51FyJ9tqZ8lcNZn6XOcvf+0HE4lRneUd7IKAjmZrp7Di/ZQOoLi+86WbovlGq8vNzwYKsahDDzJRUsgBu9qf6fqVJfPLeQD6KZiPCu1u2amtouGWnftAkQ7Ih1ZlDjIhf+x2Xc6lx7beXHCQuxAcGO0S3GbBLkp8PzvybyDe3MM8umX9oW6cz8qXm6GYxKewqo6thkQyCpH6xi5Bc6/SpwMqSldavbTJ5YhlsYrq+01IfUi83vnqwtrnfoTzu7xo1ZGtVVMqrMuvUkqnsG7Dbhv1OJ11YcQDaj69bTaGxWE3g73YJsp0rkhOP2ca0hqEx4UvRdbmBRtlZp8kgdV0LoVY6R6psi5b0YTveXqPY4LnT00ZV6EvJAb5ew7PJLj8dusNDD/0gXlvu8gCNCrNW3ETyk7XzC7OgDwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(33656002)(9686003)(86362001)(508600001)(83380400001)(7696005)(52536014)(2906002)(5660300002)(8936002)(186003)(26005)(66476007)(71200400001)(66446008)(66946007)(66556008)(38070700005)(38100700002)(122000001)(82960400001)(55016003)(64756008)(54906003)(4326008)(8676002)(110136005)(76116006)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVNNQVZxZVBrQ2hCUEh5R0Y3dGVMb2psQ21wbXU5ZlRDbUJoZzJ0THpxNHgz?=
 =?utf-8?B?QTlwcGNnUzcvL0Vzb1FkUmhuekhuYThoZXlLTThYSWZGTEVtRzFzQzdpZC9R?=
 =?utf-8?B?cnpvOEkxOEtyRWx1UXp6ZG5xb3Q5SGs5NUgyeTVMcmVmT1pWNy8yM3VnSlMy?=
 =?utf-8?B?UWNmbUxIUENaTzJvc25JOUMvcm5nL0FYYjFUejFFbjRGYWhzajE0aytCT3NT?=
 =?utf-8?B?QTBsc2hFemFtdzNQNU8wVzNXOGF3VFVYWElyanZ1SklGQy9tOTN0SkpuUDZy?=
 =?utf-8?B?SEFFckRTNUxFNDNyZE1oS0tSYkQvZFAwNk82c0t4QW1WU1hhT29LRnYwR1FR?=
 =?utf-8?B?RlFOSGJZL2N1cTZYc3l4cTlkTVlJOXNYaWFqMlFyRlBWYnpyTHdtTFJJV01R?=
 =?utf-8?B?YVhSdDI0bGhHcFVyN1pjcDZ6UmFERHIwNnVtWWQ1U2pKeFBGTW4xeW5HUVRr?=
 =?utf-8?B?WFIxN0lYd0p1a2R6Y0tMbktydEJCZEtjU0IyeG9VQlNMK09ha2hMQ1gvbGtu?=
 =?utf-8?B?U0NoODF4WGdkSnE0aHZtTFhoY1Q5K3dEQ3c3RHhITHYzSjkrL04wdEE1THlC?=
 =?utf-8?B?VC9oNzZibzM3dlhGRXNvaWgrSUxjNEE5ODRQWnU3M3dhcWtyYWxONW1pYXUz?=
 =?utf-8?B?bXpmZ05QYXROMjY5V2pVOGNXN2M5cFBicjliTGNmYzYwa3A3NmhjMzRVQ2F4?=
 =?utf-8?B?dU56YjlDVDJJdlRibXB1bDl2cjVEelJ3SGxtQ0IzRVlZa0FSdnVsZHF2TXN5?=
 =?utf-8?B?V2x1aGN4V0lMZFZwWkk5QUQ5a1BTRCtwYmJJaFhpQXBqbGpWOFF6UXZlNUw2?=
 =?utf-8?B?Zk83Si9SajVkb1hCOHFpRGRDWFlGUkg0YmdscitDT3dUS2drdFVEa0dQOFBT?=
 =?utf-8?B?a3lLY21xQW5BbC9HbVVKUzg4eG5Yb1M1a1JCYmQ5R0J6cENFemZQbDczVUN2?=
 =?utf-8?B?WThDT0hUT2hxT1pZTG1XWUNPY3Jaam16Y0ZKZlp6NHVvR0xIdDlnR1BIVlFx?=
 =?utf-8?B?a2s4Rm4yNU9OTGdycUdrMzBxNVg4N0FVVzdlcW9xWHBmZkZWbnRuNFM2eUh3?=
 =?utf-8?B?UjlJcXVncUFsSTFuZWVMbExaMGdqZEpFNm1xbWVvVlNrdW1sajlEeWYyTnI4?=
 =?utf-8?B?WndMd0ZKSHFSZWZEQnRDVElKSkllcHRjT3dacFdWQ0doNVNyQW12UDZ6U2s3?=
 =?utf-8?B?MHhBVmRyM0xhYkRFK0xUalVFeFpNUDFOSXpmaWFNNlZZM3g4WElQM3V4SCtw?=
 =?utf-8?B?V2puSkxQSkppZGZrdTM2VE5CK05BOXp1R084MUxHemxiSjlIM2cxZ2dtdzhx?=
 =?utf-8?B?MjV5Y0ZkR3FIZ0FWTkNVNU9TaWhjd0xmTW5FZURkWEc2YThpS1psMHd5a2h4?=
 =?utf-8?B?V3kzRlRkcHU3NGZoQmJ4aE1reFNrS2ZNUjVRSDI0V0pvNG1VNllpakF3cDJS?=
 =?utf-8?B?azJnUTdHSm5EYWVLRE4xM3QwSCszZmtvYUN6YmVCbTQ5MEZNazJmZWYyVUQz?=
 =?utf-8?B?Mk1NY0tTU3dPLzJpVnRkb0REeE9YeG5lVU5aLzNudi9aZXhMT0lRSUtMYTA3?=
 =?utf-8?B?U3NpL1B1YkN6ajRUUUM3Uk81aVhVSUxia0tRcGdtNXlnWVJvbHBLR2JkRmpI?=
 =?utf-8?B?anE5K2N2OFJCK0h5d2x4ayt2c0M3TGlBRVFyTVo0ZkQwNkNtZGZWdlF0cGNM?=
 =?utf-8?B?SVgvWUFYMURiRWV6SExaSHBaaFhSVCtDQTNmZ2RXVGQ4c1ZyTXdrWWxsbWNT?=
 =?utf-8?B?MnAwcnJrNExxZkZTNmtsa2pmUVczME45Z0doSnk0azNxMzBwTXpzR0UxWVlX?=
 =?utf-8?B?YWNHc1JqNEh3eUVHb2MwWThOVmZyOUdML1FJMTVRanpnY0JpQlVid2FBZkhv?=
 =?utf-8?B?L0lnZm45SHExVTZwTURLdTQ3S2pzTTZOU0hYRjl2eVpONUxNY1dEek1nWkZr?=
 =?utf-8?B?QkxUZjFYYUl0Qjh4SzNTUFJiVVRnaE81czZwS081NnZIK2d3YWR3UWdvVHEw?=
 =?utf-8?B?Wndtc3p1ZS9LWGpCaGw0bkFoMzdiZWlndmpadTVrZmdnUTdMN3g3bHhTTkw1?=
 =?utf-8?B?eHNNUVFHditZVkVuVkRaUWpCbUlzTDcrVk9UYnZXZ2liQTRjYlU0cFMxOVlk?=
 =?utf-8?B?aGNVRCtzeFBSajdMcXVHcW9NTmx5OVh3Z2tsdS9pbVA0bk96c1NOb2JTTXZy?=
 =?utf-8?B?NVNrVHR0dVdFOXIvQWlvK0U3REgxWWFjd3dOd2pqZFM2V2F5WlZuQnpGRUEx?=
 =?utf-8?B?ZitWR0ZtK1llQ3R1UjVJYk5MTkh4bDJsb0JtcWF1N0V3VWh2azQ5RWV5dmtx?=
 =?utf-8?B?UlI3ZFBpTGlIaFI0bzY3c250MUFiQ2JGd2NaeVcyMTJva1BNcnQ5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24234e8b-1d7d-4b37-d566-08da19151a67
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 04:06:05.3429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2JTpeSfGInN709cVJC3VbfFqZG3GCTSmRlk56s7rRlq/5C/9B0CO9qJkt/CJtwAJHDDvIjAjy/ij+1bz3Bxzyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2572
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBBcHJpbCA3LCAyMDIyIDI6MTIgUE0NCj4gDQo+IERlc3BpdGUgdGhlIGNvbW1lbnQgdGhlcmUg
aW5maW5pdGUgcmVjdXJzaW9uIHdhcyBzdGlsbCBwb3NzaWJsZSwgYnkNCj4gZmxpcC1mbG9wcGlu
ZyBiZXR3ZWVuIHR3byBkb21haW5zLiBUaGlzIGlzIGJlY2F1c2UgcHJldl9kb20gaXMgZGVyaXZl
ZA0KPiBmcm9tIHRoZSBESUQgZm91bmQgaW4gdGhlIGNvbnRleHQgZW50cnksIHdoaWNoIHdhcyBh
bHJlYWR5IHVwZGF0ZWQgYnkNCj4gdGhlIHRpbWUgZXJyb3IgcmVjb3ZlcnkgaXMgaW52b2tlZC4g
U2ltcGx5IGludHJvZHVjZSB5ZXQgYW5vdGhlciBtb2RlDQo+IGZsYWcgdG8gcHJldmVudCByb2xs
aW5nIGJhY2sgYW4gaW4tcHJvZ3Jlc3Mgcm9sbC1iYWNrIG9mIGEgcHJpb3INCj4gbWFwcGluZyBh
dHRlbXB0Lg0KPiANCj4gQWxzbyBkcm9wIHRoZSBleGlzdGluZyByZWN1cnNpb24gcHJldmVudGlv
biBmb3IgaGF2aW5nIGJlZW4gZGVhZCBhbnl3YXk6DQo+IEVhcmxpZXIgaW4gdGhlIGZ1bmN0aW9u
IHdlIGFscmVhZHkgYmFpbCB3aGVuIHByZXZfZG9tID09IGRvbWFpbi4NCj4gDQo+IEZpeGVzOiA4
ZjQxZTQ4MWI0ODUgKCJWVC1kOiByZS1hc3NpZ24gZGV2aWNlcyBkaXJlY3RseSIpDQo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiB2MjogRXh0ZW5k
IHNjb3BlIG9mIHRoZSBhcHByb2FjaCB0YWtlbi4gTGV2ZXJhZ2UgZm9yIHNvbWUgY2xlYW51cC4N
Cj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBAIC0xNTk5LDcgKzE1OTks
NyBAQCBpbnQgZG9tYWluX2NvbnRleHRfbWFwcGluZ19vbmUoDQo+ICAgICAgaWYgKCAhc2VnICYm
ICFyYyApDQo+ICAgICAgICAgIHJjID0gbWVfd2lmaV9xdWlyayhkb21haW4sIGJ1cywgZGV2Zm4s
IGRvbWlkLCBwZ2RfbWFkZHIsIG1vZGUpOw0KPiANCj4gLSAgICBpZiAoIHJjICkNCj4gKyAgICBp
ZiAoIHJjICYmICEobW9kZSAmIE1BUF9FUlJPUl9SRUNPVkVSWSkgKQ0KPiAgICAgIHsNCj4gICAg
ICAgICAgaWYgKCAhcHJldl9kb20gfHwNCj4gICAgICAgICAgICAgICAvKg0KPiBAQCAtMTYwOSwx
MyArMTYwOSwxMiBAQCBpbnQgZG9tYWluX2NvbnRleHRfbWFwcGluZ19vbmUoDQo+ICAgICAgICAg
ICAgICAgICovDQo+ICAgICAgICAgICAgICAgKHByZXZfZG9tID09IGRvbV9pbyAmJiAhcGRldikg
KQ0KPiAgICAgICAgICAgICAgcmV0ID0gZG9tYWluX2NvbnRleHRfdW5tYXBfb25lKGRvbWFpbiwg
aW9tbXUsIGJ1cywgZGV2Zm4pOw0KPiAtICAgICAgICBlbHNlIGlmICggcHJldl9kb20gIT0gZG9t
YWluICkgLyogQXZvaWQgaW5maW5pdGUgcmVjdXJzaW9uLiAqLw0KPiArICAgICAgICBlbHNlDQo+
ICAgICAgICAgICAgICByZXQgPSBkb21haW5fY29udGV4dF9tYXBwaW5nX29uZShwcmV2X2RvbSwg
aW9tbXUsIGJ1cywgZGV2Zm4sDQo+IHBkZXYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBERVZJQ0VfRE9NSUQocHJldl9kb20sIHBkZXYpLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREVWSUNFX1BHVEFCTEUo
cHJldl9kb20sIHBkZXYpLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbW9kZSAmIE1BUF9XSVRIX1JNUlIpIDwgMDsNCj4gLSAgICAgICAgZWxzZQ0KPiAt
ICAgICAgICAgICAgcmV0ID0gMTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChtb2RlICYgTUFQX1dJVEhfUk1SUikgfA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFQX0VSUk9SX1JFQ09WRVJZKSA8IDA7DQo+
IA0KPiAgICAgICAgICBpZiAoICFyZXQgJiYgcGRldiAmJiBwZGV2LT5kZXZmbiA9PSBkZXZmbiAp
DQo+ICAgICAgICAgICAgICBjaGVja19jbGVhbnVwX2RvbWlkX21hcChkb21haW4sIHBkZXYsIGlv
bW11KTsNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3Z0ZC5oDQo+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC92dGQuaA0KPiBAQCAtMjksNyArMjksOCBAQA0K
PiAgI2RlZmluZSBNQVBfV0lUSF9STVJSICAgICAgICAgKDF1IDw8IDApDQo+ICAjZGVmaW5lIE1B
UF9PV05FUl9EWUlORyAgICAgICAoMXUgPDwgMSkNCj4gICNkZWZpbmUgTUFQX1NJTkdMRV9ERVZJ
Q0UgICAgICgxdSA8PCAyKQ0KPiAtI2RlZmluZSBVTk1BUF9NRV9QSEFOVE9NX0ZVTkMgKDF1IDw8
IDMpDQo+ICsjZGVmaW5lIE1BUF9FUlJPUl9SRUNPVkVSWSAgICAoMXUgPDwgMykNCj4gKyNkZWZp
bmUgVU5NQVBfTUVfUEhBTlRPTV9GVU5DICgxdSA8PCA0KQ0KPiANCj4gIC8qIEFsbG93IGZvciBi
b3RoIElPQVBJQyBhbmQgSU9TQVBJQy4gKi8NCj4gICNkZWZpbmUgSU9feEFQSUNfcm91dGVfZW50
cnkgSU9fQVBJQ19yb3V0ZV9lbnRyeQ0KDQo=

