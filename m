Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A1F4A337C
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jan 2022 04:22:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262378.454584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE0nV-0008Ud-7l; Sun, 30 Jan 2022 03:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262378.454584; Sun, 30 Jan 2022 03:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE0nV-0008S0-4I; Sun, 30 Jan 2022 03:22:37 +0000
Received: by outflank-mailman (input) for mailman id 262378;
 Sun, 30 Jan 2022 03:22:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lkCg=SO=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nE0nU-0008Ru-1A
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 03:22:36 +0000
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc0796c3-817b-11ec-8eb8-a37418f5ba1a;
 Sun, 30 Jan 2022 04:22:33 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 19:22:30 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 29 Jan 2022 19:22:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 29 Jan 2022 19:22:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 29 Jan 2022 19:22:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sat, 29 Jan 2022 19:22:29 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sat, 29 Jan 2022 19:22:29 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY4PR11MB1352.namprd11.prod.outlook.com (2603:10b6:903:2a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Sun, 30 Jan
 2022 03:22:28 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4930.020; Sun, 30 Jan 2022
 03:22:27 +0000
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
X-Inumbo-ID: dc0796c3-817b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643512953; x=1675048953;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GAAfQ0t/HB+jujHSoqjwpqGbPka1aX/PcRlsxw7z8UM=;
  b=M9Jg6IPd0BqRYGJTPS3Nfl0qz1BXRv8vMPtzEjt/jQB8rN+ddlGJNBvu
   BbGljKYe7I2h2EtsTyrGCXITM6Fk6Ad8JrNoEkMk/bheshQ2qqPZoGOlB
   TTEzfYyUogaKnfL5uW7koyUtkEx+rLLxCr0rabsR/HZj70KS96p0HrqGD
   jhdkTPCm6Tq1j0btGaNNIQhITnXK1xjil8HXcepuwbn+9kWgkNC1dV0pF
   OHADNmXRC0FAdvuKfk9XTFRbk18AM2ppLvfbwSTptnl8o0vppjRWlyByo
   rICW4SK0Q7EuBc+jkyKyLFc8PrV3l/A+jFBg7Wy1fy6OKPR9dlOy++X8T
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="247534220"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="247534220"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="697511518"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXlFCLxN13uO2uSsI2KpG1/vf2P8VLGdS1g/ObACYGzr25/gSFHCmMC+w0tBgPpn/Abws49/93SeaaBbp4woT3bZ8fDWMgdcxetBYZqz1fsVlKSbgLmFkoPp56yixkmbkoFLIEGYnSS7x9hNkDw74lI+cf8F/bTWd3Di3APGhuZRmUI61gREjCqHB3LB7L1C4x3GbRWnaknwy/uM9WFeB0VUjdpSvNh2G0T6nzRgL45TNBjwPS/M9XbRkIkHbqoSf332D99f9GVs0zcBQHNWoTwrCc/1PwEJEs/MpDMaJXtrupQXUg6OPXi3Qi6xwzyOFpcO5561zzajz2SkLbw7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAAfQ0t/HB+jujHSoqjwpqGbPka1aX/PcRlsxw7z8UM=;
 b=eEflyqEzkftedTogs7WIAFdt3fLQCe9SrEViy3i7JA4aZQqVAWy1kSegFwgC6xwnniCmo9K70V46NtR7VoUOnfBykQXAUYaqCk1M24NrACp7lgCuadTPgC7mEU4zdMNY74SWuDwJCXZrTq4juO4qBi2Y0hjTlkf+I/HqIg6p/+qAgR29GQwSD4d6hwkQ9rYJUgJKaWpm0O/AhJ/eu0rjDctK4UbRtRKxxnfQZ4g0EiLQ9LIYZRhJF5IpiiuabKnIhJ7Y9DI/dy8dVlOiLEsFXTGs/NXA2XltiBulheIWWHmv2ji7czqTyHslpqzkYWG9NLZ0ISg4OpdkLBDE8E+9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v3 03/23] VT-d: limit page table population in
 domain_pgd_maddr()
Thread-Topic: [PATCH v3 03/23] VT-d: limit page table population in
 domain_pgd_maddr()
Thread-Index: AQHYBj5sbc5z/CaOZk2avXhw1+QTnqx7BJ4g
Date: Sun, 30 Jan 2022 03:22:27 +0000
Message-ID: <BN9PR11MB5276E2D21CD645086A7ECD8C8C249@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <10d6b416-1a20-4b1b-d39a-1bf17b2e174a@suse.com>
In-Reply-To: <10d6b416-1a20-4b1b-d39a-1bf17b2e174a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24f6e22c-fa71-4b67-556a-08d9e39fbe24
x-ms-traffictypediagnostic: CY4PR11MB1352:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB13529317B6AC506727C3A7428C249@CY4PR11MB1352.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WdKqWmakYTbNMNnSBkndpR1dYKdEVkAChwQziBsgEWrCMDMJe+H3hwkzDGoX0vLZMA61JpFu0wCBK+htp0wy/4PA3VwNla+ZthQQO10em04G5S4lYlXae3+5IxtsuS93G2vNTHZin8LtHek7Y4SWEiq0hCYUVa4+TRyV5w69b82TktjFEg24V3/GA+5TyGl5azbYkvGFAdV3XxdTJ9D8BaJZlEKd2QECrzditOqSVIqo54Bk33ygAnuHNvMyXB19GWMBxyG5kCwn6JwfRvXejeK3ochHtjKYxMJWDKCSnl4fnLr+s2eQpVXy67xAgP7DBBsSGwREoA9qE+ZnLy4WrwI804cGg9yUIO3bBDRHw3gS05j1I5OKbwWnoaBhWxBiKE1nX6LMeerJs+pXt4uk+KgnqJErpK1V52k58j/E/DG84q7fesck/a5Sd6dutYJXSkkn5q2kCFL3dB16IF6KObQSLU/+uxj4xbB+BcLGzJShfcFYobCc+sWp5S/ETl5QK3zP04YgqQ3KHc5zqszewwARt+qypkhkQNChs6ep4Mqdk4OXOx6Pshzc6lsUbjM5SSL6zX9HNKQCrs8cZUArr6L3ZujNO4uiVwedeV2X2ixfaMh83i4x43+wauam/wf5RjOzUEIkWauc+goFnv7aXsdEaGclbYgcJ9XD/92zpe5f4e8qC+ThIw9V9xQM3+U/kOVK4LSWBkPzd9yW22KkgQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(33656002)(508600001)(186003)(38070700005)(55016003)(122000001)(52536014)(5660300002)(82960400001)(9686003)(86362001)(7696005)(66476007)(66946007)(76116006)(2906002)(66556008)(64756008)(4326008)(8676002)(38100700002)(54906003)(8936002)(66446008)(110136005)(316002)(71200400001)(6506007)(20210929001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUZKMTVUUmhQQm9QUnJhWjFHVmpsL1RLcXU4NnNjSVk4TDdPN09FaFFZZkpE?=
 =?utf-8?B?OXBvYWRpRmNMSkhoYUs0VUNzVDg3enZqU1c2a0dPTklzdlNhZHJrY0dUNE1k?=
 =?utf-8?B?RkJKNWNRQWpFMVpEMTQrVU1tOXF2YktybTVyT0p4cWRoVTZQdGhaMnVjelI5?=
 =?utf-8?B?SFpZeDlzM0NVd2lYM2pRb1JCVFRaaisrazR0OWF5emhGU1I1QlN2YU1kWHBB?=
 =?utf-8?B?ZmkvWDNTQ2VIbTNGaElaekNDNG42ZFIzaEZUUm1vUzUraHp5WGs5elJHMGRN?=
 =?utf-8?B?cWlZSFdqK3owZjNWTlNlbVlxTkVtUC9rak9Nc2ptWmdSYVByS1FlQnJVV0Y0?=
 =?utf-8?B?SVlMN0FVTUEzVFNVcThWaU5zUzVoa3c0alc2RVQxOXdGS093UFFPM2JJTXVs?=
 =?utf-8?B?bWk5NFdPRzJ5MDNnaHlzNHJjNmxSRWs0SlhKaXVMcFFpQ3RibUYrSnFEbGNr?=
 =?utf-8?B?K1ZZWE4xRUs4dXlwVTh0YzhMWG83VjJzd25vZTdrZS9OOUJXbmVLcFlqOWdC?=
 =?utf-8?B?ZWcxU2Y4ZzBhbU9QQ29zQXFGNlNFTEQ4N1k1TlJiRkhLQWNtODVnckQrUFBN?=
 =?utf-8?B?K05TU2RKdUlGZUY2OU5hT3hPVXhGWWFHK0xoZkQrcWxUNDk5THZINUhnREdu?=
 =?utf-8?B?dzN1L2VkVlF3WWlaNDJDRFc1QTRoY1pIYVhFVXl0OHBPU0dMNTRMRitqa05v?=
 =?utf-8?B?bGV1K2VPL2E4S21INTY5UUIwWGowS3VzcXU1M3dyY3h5TzR0Mk1iemJvcHF0?=
 =?utf-8?B?cEgvSDlaNG5DM2ttM2lOZW5oUElJUzdzcHFTSk9ucUc5UkcvNC9pZHNScDQ4?=
 =?utf-8?B?a3NIT2Y1aW9mcHA4RXZpWmcrTXU3ZmNjNWxqQTU4MStZeTl2R3BYWmlmS2E0?=
 =?utf-8?B?KzFSSW50QW5XQkhabC95aVBzZjRmbEZFWmZKZnhlamE0T0NieXI3SWkwbjRT?=
 =?utf-8?B?NTY0Yy9Mc3o3MVVsT2RzcUVoYloraENCQVBBcEJTTGtjOFo5WjR4N2FzN1dG?=
 =?utf-8?B?V1UzL2FrOTF3RWVYZDZsdFdvb1R5ekhJRHA1YVhENFJKTU5PbkYwY3Z5USs2?=
 =?utf-8?B?dFArYzNMMDVvU0tmV2ZTaEU1SjFSbVhSUkY4SXMvcTdsNzh4c1A1UU5zbE5J?=
 =?utf-8?B?alBZTFlEMzg3MmRqbTQ3SGlXNzM4TkNSNDRic2R6TzJJaHUycFl6TVYrc0ht?=
 =?utf-8?B?eXJra3lqTC9jekNuTlpla0lPMFR2VlJQYnU0RFVid3hjWThUcnloMTBYanZD?=
 =?utf-8?B?YXl6akxmTm93cUpTZi9tZEQ0RjZyZ2RuT21pd1NVYW5McjduZGI5UERvYW9L?=
 =?utf-8?B?OG1LNDZnbjJ6ZWMwQy93R243S0JpTERsekR6QWd6TjlFNG4yL3JLazBjRHlJ?=
 =?utf-8?B?cjg2SEVMRnRyT1VsbEdtcDlZZ3pKRVUxNkEvZEd0N0JWQ0ZMVVBKcmxEdjFH?=
 =?utf-8?B?UWpiK09vYVVpa1NPdVUxdndWS3dvOFhDekltMUxEV2dwcHNzL21XYkhpQlVB?=
 =?utf-8?B?cmZYZ1cyR1Q5a0FDSnpCbFZuWmhyckx5N3VKY1A0dDBSRDNEOGNkUW1ZNVcz?=
 =?utf-8?B?OE4xTENkamJlVlF3d1lDUkxGd0hWaHRBU0JrK0grREJoY3kwNFNsWnR4NEd5?=
 =?utf-8?B?ajdLY2JCYnE0cDY4enVsUzF2M2xwS2dWTk5SNTdZb1dsVmNqR3U2SWNzaWVm?=
 =?utf-8?B?c0hDNjExdExITEdrY29vR0w1dUJVQmJJT3ZpRWRObVJ1OUxXMWJ3ZjJDck5R?=
 =?utf-8?B?VytwWFZidzNHeWszYUVPT2JMTys5VnZhUjVvV3ZSSytVZllIZjJ5LzkrT0xX?=
 =?utf-8?B?ZDRNcU5VMmJvSVgvUy9qVEZGanNMamF3WnJHRXR4SmpLa1IycURleHRKZkVW?=
 =?utf-8?B?N01ZenVhQS9odTBRbjQxNGN2bVNINnE0NWxINnB2QXI1MWN5R1d4UUxIbmox?=
 =?utf-8?B?OHhwY0xjYWIya3NMWE1uVGZNYjZYbENiOFBXTFd1TjVOaktXKzFhN28vbHQr?=
 =?utf-8?B?eHRBb0pzek5pQ3dJcUV4eFYrWXdYeENxV3VReTlJWnpEQ3BraDE5ZnpKUGZu?=
 =?utf-8?B?SG40Rm13YmNESkVkQ2dxQUI1dkp0VTZZZnFYT1U1TVhsQmZ4Rm13NFVUTGJj?=
 =?utf-8?B?KzZETUVBb0dMS3c3M3kzUEhuclpDR2RUYlFrYkF0Kzd5RkJHdjA3NER2QXBw?=
 =?utf-8?Q?4RycOacQQFMEC3sBqq4YsA8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f6e22c-fa71-4b67-556a-08d9e39fbe24
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2022 03:22:27.8680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8d4e8FyuxNEqnAj/dvpOeShiuoIo41pjGnUI9LClJdk9Io//STcv3cDHUnDSjF4A84nfyMKZSnLxuPl4ixDQ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1352
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEphbnVhcnkgMTEsIDIwMjIgMTI6MjMgQU0NCj4gDQo+IEkgaGF2ZSB0byBhZG1pdCB0aGF0IEkg
bmV2ZXIgdW5kZXJzdG9vZCB3aHkgZG9tYWluX3BnZF9tYWRkcigpIHdhbnRzIHRvDQo+IHBvcHVs
YXRlIGFsbCBwYWdlIHRhYmxlIGxldmVscyBmb3IgREZOIDAuIEkgY2FuIG9ubHkgYXNzdW1lIHRo
YXQgZGVzcGl0ZQ0KPiB0aGUgY29tbWVudCB0aGVyZSB3aGF0IGlzIG5lZWRlZCBpcyBwb3B1bGF0
aW9uIGp1c3QgZG93biB0byB0aGUgc21hbGxlc3QNCj4gcG9zc2libGUgbnJfcHRfbGV2ZWxzIHRo
YXQgdGhlIGxvb3AgbGF0ZXIgaW4gdGhlIGZ1bmN0aW9uIG1heSBuZWVkIHRvDQo+IHJ1biB0by4g
SGVuY2Ugd2hhdCBpcyBuZWVkZWQgaXMgdGhlIG1pbmltdW0gb2YgYWxsIHBvc3NpYmxlDQo+IGlv
bW11LT5ucl9wdF9sZXZlbHMsIHRvIHRoZW4gYmUgcGFzc2VkIGludG8gYWRkcl90b19kbWFfcGFn
ZV9tYWRkcigpDQo+IGluc3RlYWQgb2YgbGl0ZXJhbCAxLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlh
biA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IHYzOiBOZXcuDQo+IA0KPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtNTUsNiArNTUsNyBAQCBib29sIF9fcmVh
ZF9tb3N0bHkgaW9tbXVfc25vb3AgPSB0cnVlOw0KPiAgI2VuZGlmDQo+IA0KPiAgc3RhdGljIHVu
c2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IG5yX2lvbW11czsNCj4gK3N0YXRpYyB1bnNpZ25lZCBp
bnQgX19yZWFkX21vc3RseSBtaW5fcHRfbGV2ZWxzID0gVUlOVF9NQVg7DQo+IA0KPiAgc3RhdGlj
IHN0cnVjdCBpb21tdV9vcHMgdnRkX29wczsNCj4gIHN0YXRpYyBzdHJ1Y3QgdGFza2xldCB2dGRf
ZmF1bHRfdGFza2xldDsNCj4gQEAgLTQ4Miw4ICs0ODMsMTEgQEAgc3RhdGljIHVpbnQ2NF90IGRv
bWFpbl9wZ2RfbWFkZHIoc3RydWN0DQo+ICAgICAgew0KPiAgICAgICAgICBpZiAoICFoZC0+YXJj
aC52dGQucGdkX21hZGRyICkNCj4gICAgICAgICAgew0KPiAtICAgICAgICAgICAgLyogRW5zdXJl
IHdlIGhhdmUgcGFnZXRhYmxlcyBhbGxvY2F0ZWQgZG93biB0byBsZWFmIFBURS4gKi8NCj4gLSAg
ICAgICAgICAgIGFkZHJfdG9fZG1hX3BhZ2VfbWFkZHIoZCwgMCwgMSwgTlVMTCwgdHJ1ZSk7DQo+
ICsgICAgICAgICAgICAvKg0KPiArICAgICAgICAgICAgICogRW5zdXJlIHdlIGhhdmUgcGFnZXRh
YmxlcyBhbGxvY2F0ZWQgZG93biB0byB0aGUgc21hbGxlc3QNCj4gKyAgICAgICAgICAgICAqIGxl
dmVsIHRoZSBsb29wIGJlbG93IG1heSBuZWVkIHRvIHJ1biB0by4NCj4gKyAgICAgICAgICAgICAq
Lw0KPiArICAgICAgICAgICAgYWRkcl90b19kbWFfcGFnZV9tYWRkcihkLCAwLCBtaW5fcHRfbGV2
ZWxzLCBOVUxMLCB0cnVlKTsNCj4gDQo+ICAgICAgICAgICAgICBpZiAoICFoZC0+YXJjaC52dGQu
cGdkX21hZGRyICkNCj4gICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gQEAgLTEzODEsNiAr
MTM4NSw4IEBAIGludCBfX2luaXQgaW9tbXVfYWxsb2Moc3RydWN0IGFjcGlfZHJoZF8NCj4gICAg
ICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ICAgICAgfQ0KPiAgICAgIGlvbW11LT5ucl9wdF9sZXZl
bHMgPSBhZ2F3X3RvX2xldmVsKGFnYXcpOw0KPiArICAgIGlmICggbWluX3B0X2xldmVscyA+IGlv
bW11LT5ucl9wdF9sZXZlbHMgKQ0KPiArICAgICAgICBtaW5fcHRfbGV2ZWxzID0gaW9tbXUtPm5y
X3B0X2xldmVsczsNCj4gDQo+ICAgICAgaWYgKCAhZWNhcF9jb2hlcmVudChpb21tdS0+ZWNhcCkg
KQ0KPiAgICAgICAgICB2dGRfb3BzLnN5bmNfY2FjaGUgPSBzeW5jX2NhY2hlOw0KDQo=

