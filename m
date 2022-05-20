Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E7452E139
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 02:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333365.557185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrqbt-0002zt-MT; Fri, 20 May 2022 00:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333365.557185; Fri, 20 May 2022 00:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrqbt-0002wT-JH; Fri, 20 May 2022 00:35:17 +0000
Received: by outflank-mailman (input) for mailman id 333365;
 Fri, 20 May 2022 00:35:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBQL=V4=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nrqbs-0002wN-OE
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 00:35:16 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b35e6168-d7d4-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 02:35:11 +0200 (CEST)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 17:35:06 -0700
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 19 May 2022 17:35:06 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 17:35:06 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 17:35:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 17:35:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 17:35:05 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB4019.namprd11.prod.outlook.com (2603:10b6:405:78::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 00:35:02 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 00:35:02 +0000
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
X-Inumbo-ID: b35e6168-d7d4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653006911; x=1684542911;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HrluVUIA/CwOYLY6YUDhzrkmIhpYwqc707q58L270KY=;
  b=O+YjzGagGjHWscc3Nyfzqiob67u/l0CLFS3ZmiSZ1jOgsgcaabeAyUjh
   ZV8gyfeZ1TTo6Rcpq93xo50r1PtGuSkPSvN4jRphSitZm9/g/1KXLr0s5
   QAZOyK5v7sJFhsrT43hjACJSI2cibIU3uoRWALocd/x3+eMq1DwsNscxP
   nBOGrfZYVZY0dg4rQcmehg4DCgsWlA9ohbWbRT0PgK77fhJ/I44qV6nfF
   9Zk/sPS+dXly39i/s49y/siAEZbLC09b1YVDz7rbm603Lud+JLy5iTfvP
   rXlpxWSIXbIk0EYgi7rQNn0U8Z0GoWWo/DsBxlEo5lJNOgRmyWO7ZfYww
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="272133182"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="272133182"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="606762031"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYcXLFNo+EHEFit04f2W0JNN4uSOFhoiFJIZcCESQU7Vg7SZXZ71/5pvPEtVIlFfbSkH3LTLmCQ8+u5j1qCZTjpSeH/sQ84wmcU7MLeL24+XG7sJdpPP5695Q3CaTkVQ+o/aVLL9+RIUYX9YnMKs1Hbh0J89dyk0mSdkKkdn8tms2jDNssKbzRMSzWrgtT2PsdQStrtlkQCA+djYHKmek7vMqrs8q1dbzrfuqt2OuEpqLsGVQ9BZO6K2mqj/QkyYg46bpnYEHBlA5o3eabt3/28QImyhk2I/62OM+OFEZf00ZNBSzE5M1FVbt6kUzi0n9akHqb0R/Vguo9Hazig2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrluVUIA/CwOYLY6YUDhzrkmIhpYwqc707q58L270KY=;
 b=jsSaAdUNnscUrtBZGIA5P+t+o/SCIt1j0+Yo+/Q5XQbmlWJpB4O0vhSXgrEJMGPI0abjmVR04Ux+LMSXIg6lEiYKOBMP3Yja6o9OUPLeyUT7s3FdaJSTBWd+aZvDRJqo2Cya1XIXTM+lpAWjwD2UEsEyQbTqE3mBOLG24AWoocD6It37TMuRNS+TvdNjD9UB3GCbDRx65Qgp2LqO2UAkd1a2NPb8HNae4ej764okC0kEKXaPFH+3SojWX5SOuCmCYB+L37s/qRBuvynge8r7xLHJ2qIbiRsQRxUHoUyd4zokte5rdWkjjvZRPS8SHQCpU/pcZiIzlHkvcj86DHyfdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Tamas K Lengyel <tamas@tklengyel.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Lengyel, Tamas" <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, "Gross, Jurgen" <jgross@suse.com>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, "Beulich, Jan" <JBeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Alexandru
 Isaila" <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH 3/3] x86/monitor: Add new monitor event to catch all
 vmexits
Thread-Topic: [PATCH 3/3] x86/monitor: Add new monitor event to catch all
 vmexits
Thread-Index: AQHYWkxRftUbU7b5kE+JHC0++cT1y60OvK8AgAycPYCACYL7gIACMivA
Date: Fri, 20 May 2022 00:35:02 +0000
Message-ID: <BN9PR11MB5276FCB1E131A3D72E4A36B68CD39@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <65645a9d2ada525c9ffc07dce594eeff5891b5a7.1651073086.git.tamas.lengyel@intel.com>
 <CABfawhmqnCXBBMsjJ1OUsiZQ2S+bAHXq_cuhi5GqKw8qKMBtGw@mail.gmail.com>
 <CABfawh=pwDVCW9HYNK7+5gAh1+MPzCGxePyzUE7G1JgrOrj1=A@mail.gmail.com>
 <CABfawhm9ZbeXWxc0Gxsg4ztbH-v27gxuQ+PqfeVNyV51tWoK8w@mail.gmail.com>
In-Reply-To: <CABfawhm9ZbeXWxc0Gxsg4ztbH-v27gxuQ+PqfeVNyV51tWoK8w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cb3ac08-f1e0-4202-4cd0-08da39f89425
x-ms-traffictypediagnostic: BN6PR11MB4019:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB40199A9E30127A3D651D0D618CD39@BN6PR11MB4019.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QQEXLJCF8o1i18tkTLJ/EvvCiA/XUV6D59Z4w3CRXo1ZvPW3G9Vbxrrhs/1Q2fyf4QAkTHta+FVf79JilGFN+/lTvdO1AMc2T84GF1cy2o4S7HczIra+vnrMS0Mp5fspBDmCd4N20NRBdnq3dI4moMCh5c+LizMVhl+R9njNjq9YriMJnxvb1J3vHnj1eGHXhc9fDdeDp0SgiXSSd1oM2cj0CEaNhYv98e+OQf4YuvDphMsRzeGjlBhwKI0onLfCcROXQQZpZkkRMc49tCkz+rXQHBtqpN+2rGoqt29zj/VKYMKHJZMcmjA8vKO6/Sem7y4KjukDmKlMEEFkhuUIormwBbJiHBfOzHCDHtQLWa+KbzU4TQg0lfRnnvmVqCVy3pUcXygq+TyWIrQULoj3xhm2agTpTqHEfU98zjH/C438FrGPI9+tbludLFZeVi0KyZvE9wjPNIPPBqqZcMcRkjKbQxvo/bF/8BE+e8caaIIeH6kzdJjFe6T1JhvIOdeWDqsFEoZoquLI/qZDQEXCtoGKg/UevkhZBlvulXp3+qD62X2FwR08K2fCccWqOnU1qppMzzLpVVVXvutSCFSGRImVGJY3EKcbg1AFHbsJs7kYIcM5cvreCXv+Pcc7/nfrjKobT62uz8EJ5TaDS+BgPhXYCJWUEcTrx8CmmTibluGXcT25ThRkyO779FaIznvtojhIWjhloPH4F4EUaBHlWg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(122000001)(8936002)(38070700005)(38100700002)(2906002)(82960400001)(52536014)(7696005)(71200400001)(86362001)(8676002)(53546011)(508600001)(107886003)(6506007)(186003)(316002)(54906003)(66476007)(66556008)(64756008)(66446008)(110136005)(7416002)(76116006)(66946007)(55016003)(33656002)(26005)(9686003)(5660300002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZExzblZGSjdmQjZndlJmc2NtSnpObkllZGpqR3RTRkJNQlUra1VRVTEzdjdu?=
 =?utf-8?B?OVl6bEU0QXBUZUNtb3pwbDBYeWc4Vy8xUHpSdGlGWENuNlc2eFRNeFQrOGFn?=
 =?utf-8?B?MjU1NUpwSU1jQjlBZjhpcWpsQkZHQVlIZGhPVldoOFNRUWIzd3laUGhEWnA4?=
 =?utf-8?B?d2sxbHJhVC81ZVQrUW53T2w3U1BnVkVvU1YwYXRvWHR2dlY5c3M0Q1NiZXpC?=
 =?utf-8?B?TEFtVlNSZzVSM0lhU3R4VnRKUTJFSnR1WWdaSmMvZU5PQnV6TVp0dFhldWVW?=
 =?utf-8?B?R2FpbFhTMW1qNElHZC9lRFB1R0xmWGJHR29TOGdSZDRlV3VXT3FEd1AzTzhF?=
 =?utf-8?B?OFp5NWJWdkZLOUpWeUUwL2UvSHZ4Y2p5VGFNRUhnbFcvUExSMXp1Z3lZdGlH?=
 =?utf-8?B?eitFRmUxdmZ0QWNRS01RQ2ZTMXBVdE9OQkttdXdzWmtNR2o1TFlSWG9JVWpF?=
 =?utf-8?B?Y1ZBbVJ2NEEwVlhob0QyNEhHZU52TzNYc1ZyK2FnTVZSWm8reklncUh3NFBS?=
 =?utf-8?B?QUlKVU1hQjJwcVJsb2ZSd3c3MG95RDN6Y3RYRGlaWUxBekZWN0wwakVpSFE4?=
 =?utf-8?B?cDNlKzR6Y2JuVGIyTy9qZWFFZUVxVVJwRFVwTWtDNWVCbFpSNHpVbkpFWVgr?=
 =?utf-8?B?aDYvTllRWHRncS9wM2M0ekYyME1jbkNDR0VDNFc1R3VnMmFIb1F1NTdZdUo3?=
 =?utf-8?B?MW1qNFNBcUk3TEdmbElpSGtNMzJEc1dXUGIwMEQ4NzBwN0NVRC96bXVHMmxk?=
 =?utf-8?B?K1hDZWM3NlZVV1oxcjFqZGhaTlZxYlBud0RGWTF1N3BZTTQvQWZnMFZIVnpG?=
 =?utf-8?B?U2FWaE41WG5PeWJ2UXRFd1d2bDAyeCtJSTdhTm82ajRRbVh5QXNiYzBzMG9k?=
 =?utf-8?B?b0NZZ2FZVldIUHhidXFlV29SakR6RWsxbzJxUy9JK3NmWVdjV28zcE54QzdV?=
 =?utf-8?B?TE9DVlUvZEdNV0VwN0VIMDMxK2NubVlkbjhZb0NVaThpVGF0RDVXaXMzeUM0?=
 =?utf-8?B?QVNuRHArZzNneUZ5U29LS3NDSjRxRmpBRmkwcTFCaUFhMFpoQ05KcGloQWN4?=
 =?utf-8?B?bkVBb2YyQ0pKdGorOTJaWHRnRWlUTStsT0c2RDRmdTN6b0Z1VGlSb2JseVdy?=
 =?utf-8?B?NFRIK2YyaVRRcmdTUnFnWkV4QXJwSEhwVWpla2dVVWZ2UU5pejRuS2dsZ0Nw?=
 =?utf-8?B?dlluQklETFZidlNHa09ueDdkZEVIYXlSSGNsTW5wRUtLaHVJOVd3UVZycXV3?=
 =?utf-8?B?MTZheUdZSTFJbkdHYkw4L0JhaVl0RHJsczh2Wk51VnBDdlE4bU9TR0hFVjF0?=
 =?utf-8?B?SHc5WWsyU1huckZqSVM5Mi84VHp2cUJVdU9nZU9rR2tDdGZzQTdPSlFRUlhn?=
 =?utf-8?B?Z0JPYUgzYXhnemVYM25SOWF0WFArZ0hUZU5kSU44cXN1ZS9ZWG1zSi9JTGNP?=
 =?utf-8?B?cStqOGdkS3E2d2ZqZlV4ODEzS2d1T2JuTXJ5eFEweW5SN1F4dXhSem4zM3lj?=
 =?utf-8?B?Ykx1NmZjMUJzRGovY1plcm0yRzA3QUhPWHR5Y3pNZFEraDZqQ215QTBFRkw0?=
 =?utf-8?B?b3RBWVA2NDRIS0VpTXl6cG9PME5IaFRuME1BUFlYVUN3MVNRTmZVV3c5V0Zr?=
 =?utf-8?B?NWJVaW9KMnBGa3pRSlk4N1ZsbXhRMlMzK3hBZEwybE9iRmFGRnFxRThRc0Vw?=
 =?utf-8?B?N3VGSy9TL0RKWTB1R24xVzlITldQNnNKdHp2eTJQUVlYN2VWb2w3VHZYTkxx?=
 =?utf-8?B?bVpibjFKWWFxYTBPdG9LTVlab01tQUZ0UVZDclF2Zm0xNEJCaHBXQ3MyaDZt?=
 =?utf-8?B?SU5UUXBXbm5UMTJKY1QzQVorR0tqRks0OWhGOFFmZUJDdjE5OUJrd0FNZHlG?=
 =?utf-8?B?TytUeGRMU3p6Y0gvUXF6T1U4VW1GMzFDd0hkckthbkM5RWRiQ041VGxaVjJ4?=
 =?utf-8?B?SzRlZG1Fdzh1RVFXQis1STlmczI5T0Vyb0FxVHo5Nm1NdnpNZG4rSDkyZXRt?=
 =?utf-8?B?ZXlDakorUEdvWnNnV0NWZThOdlV1dzZWUFo1NVRrQzRuc1BMNDF1VnJJUGRq?=
 =?utf-8?B?TzVVeFZFWW8wQmtlVEpKU3lLNFdYRzg1RVRvTUJrdnRuOG1TSGxLR21vYVhj?=
 =?utf-8?B?azF0SVNDVWZ5NVJJNFY5R09uQm9NdWdXUmpJTUhxbjBXZmFLNjQ0aEFRbnJr?=
 =?utf-8?B?RmV3UEVXRFJVT0cyaWdlajRGVDBJUm41STNXTzFKcXlkK3JBMU5MaHhwYkMx?=
 =?utf-8?B?czJHemJkVmNjdnljanAydGs1endqb0hpTnNBcnpaRGRmWVJWSFU2YUx4bHlF?=
 =?utf-8?B?WjBnZnRaWVpIaGQwek5tRTNCVnowU0JncVk3SlF5SEl6bVBwR01nZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb3ac08-f1e0-4202-4cd0-08da39f89425
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 00:35:02.6179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cc2h7IXHwgITAv39C+77EInWPffUB3QUEPPFv0X4U54y7Xbo+E7G6Y0aH8FLLWjpWWK2T6fCOrVslpdyu1fMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4019
X-OriginatorOrg: intel.com

PiBGcm9tOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgTWF5IDE4LCAyMDIyIDExOjAyIFBNDQo+IA0KPiBPbiBUaHUsIE1heSAxMiwgMjAy
MiBhdCA5OjQ3IEFNIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4NCj4gd3Jv
dGU6DQo+ID4NCj4gPiBPbiBXZWQsIE1heSA0LCAyMDIyIGF0IDk6MTIgQU0gVGFtYXMgSyBMZW5n
eWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPg0KPiB3cm90ZToNCj4gPiA+DQo+ID4gPiBPbiBXZWQs
IEFwciAyNywgMjAyMiBhdCAxMTo1MSBBTSBUYW1hcyBLIExlbmd5ZWwNCj4gPiA+IDx0YW1hcy5s
ZW5neWVsQGludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEFkZCBtb25pdG9yIGV2
ZW50IHRoYXQgaG9va3MgdGhlIHZtZXhpdCBoYW5kbGVyIGFsbG93aW5nIGZvciBib3RoIHN5bmMN
Cj4gYW5kDQo+ID4gPiA+IGFzeW5jIG1vbml0b3Jpbmcgb2YgZXZlbnRzLiBXaXRoIGFzeW5jIG1v
bml0b3JpbmcgYW4gZXZlbnQgaXMgcGxhY2VkDQo+IG9uIHRoZQ0KPiA+ID4gPiBtb25pdG9yIHJp
bmcgZm9yIGVhY2ggZXhpdCBhbmQgdGhlIHJlc3Qgb2YgdGhlIHZtZXhpdCBoYW5kbGVyIHJlc3Vt
ZXMNCj4gbm9ybWFsbHkuDQo+ID4gPiA+IElmIHRoZXJlIGFyZSBhZGRpdGlvbmFsIG1vbml0b3Ig
ZXZlbnRzIGNvbmZpZ3VyZWQgdGhvc2Ugd2lsbCBhbHNvIHBsYWNlDQo+IHRoZWlyDQo+ID4gPiA+
IHJlc3BlY3RpdmUgZXZlbnRzIG9uIHRoZSBtb25pdG9yIHJpbmcuDQo+ID4gPiA+DQo+ID4gPiA+
IFdpdGggdGhlIHN5bmMgdmVyc2lvbiBhbiBldmVudCBpcyBwbGFjZWQgb24gdGhlIG1vbml0b3Ig
cmluZyBidXQgdGhlDQo+IGhhbmRsZXINCj4gPiA+ID4gZG9lcyBub3QgZ2V0IHJlc3VtZWQsIHRo
dXMgdGhlIHN5bmMgdmVyc2lvbiBpcyBvbmx5IHVzZWZ1bCB3aGVuIHRoZSBWTQ0KPiBpcyBub3QN
Cj4gPiA+ID4gZXhwZWN0ZWQgdG8gcmVzdW1lIG5vcm1hbGx5IGFmdGVyIHRoZSB2bWV4aXQuIE91
ciB1c2UtY2FzZSBpcyBwcmltYXJpbHkNCj4gd2l0aA0KPiA+ID4gPiB0aGUgc3luYyB2ZXJzaW9u
IHdpdGggVk0gZm9ya3Mgd2hlcmUgdGhlIGZvcmsgZ2V0cyByZXNldCBhZnRlciBzeW5jDQo+IHZt
ZXhpdA0KPiA+ID4gPiBldmVudCwgdGh1cyB0aGUgcmVzdCBvZiB0aGUgdm1leGl0IGhhbmRsZXIg
Y2FuIGJlIHNhZmVseSBza2lwcGVkLiBUaGlzIGlzDQo+ID4gPiA+IHZlcnkgdXNlZnVsIHdoZW4g
d2Ugd2FudCB0byBhdm9pZCBYZW4gY3Jhc2hpbmcgdGhlIFZNIHVuZGVyIGFueQ0KPiBjaXJjdW1z
dGFuY2UsDQo+ID4gPiA+IGZvciBleGFtcGxlIGR1cmluZyBmdXp6aW5nLiBDb2xsZWN0aW5nIGFs
bCB2bWV4aXQgaW5mb3JtYXRpb24gcmVnYXJkbGVzcw0KPiBvZg0KPiA+ID4gPiB0aGUgcm9vdCBj
YXVzZSBtYWtlcyBpdCBlYXNpZXIgdG8gcmVhc29uIGFib3V0IHRoZSBzdGF0ZSBvZiB0aGUgVk0g
b24NCj4gdGhlDQo+ID4gPiA+IG1vbml0b3Igc2lkZSwgaGVuY2Ugd2Ugb3B0IHRvIHJlY2VpdmUg
YWxsIGV2ZW50cywgZXZlbiBmb3IgZXh0ZXJuYWwNCj4gaW50ZXJydXB0DQo+ID4gPiA+IGFuZCBO
TUkgZXhpdHMgYW5kIGxldCB0aGUgbW9uaXRvciBhZ2VudCBkZWNpZGUgaG93IHRvIHByb2NlZWQu
DQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMu
bGVuZ3llbEBpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2NTogd3JhcCB2bWV4aXQg
ZmllbGRzIGluIGFyY2gudm14IHN0cnVjdHVyZXMgaW4gdGhlIHB1YmxpYyB2bV9ldmVudCBBQkkN
Cj4gPiA+DQo+ID4gPiBQYXRjaCBwaW5nLiBDb3VsZCBhIHRvb2xzdGFjayBtYWludGFpbmVyIHBs
ZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzPw0KPiA+ID4gVGhlIGh5cGVydmlzb3Igc2lkZSBhbHJl
YWR5IGhhcyBhIFJldmlld2VkLWJ5Lg0KPiA+DQo+ID4gUGF0Y2ggcGluZy4NCj4gDQo+IFBhdGNo
IHBpbmcuDQo+IA0KDQpJIGd1ZXNzIHdoYXQgeW91IHJlYWxseSBtaXNzZWQgaXMgYW4gYWNrIGZy
b20gdG9vc3RhY2sgbWFpbnRhaW5lciwgYnV0IGFueXdheToNCg0KUmV2aWV3ZWQtYnk6IEtldmlu
IFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K

