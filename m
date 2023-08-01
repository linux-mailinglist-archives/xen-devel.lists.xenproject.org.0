Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2859776A743
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 05:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573547.898344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQfay-0001VW-TL; Tue, 01 Aug 2023 02:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573547.898344; Tue, 01 Aug 2023 02:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQfay-0001TW-Mq; Tue, 01 Aug 2023 02:58:48 +0000
Received: by outflank-mailman (input) for mailman id 573547;
 Tue, 01 Aug 2023 02:58:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jjcN=DS=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1qQfaw-0001TQ-6O
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 02:58:46 +0000
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5015a7b7-3017-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 04:58:40 +0200 (CEST)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 19:58:36 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Jul 2023 19:58:36 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 19:58:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 19:58:36 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 19:58:36 -0700
Received: from BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 by PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 02:58:32 +0000
Received: from BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::4a3e:51f9:8a29:afe5]) by BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::4a3e:51f9:8a29:afe5%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 02:58:32 +0000
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
X-Inumbo-ID: 5015a7b7-3017-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690858720; x=1722394720;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ltQMYegyRPp06TIFDLMsKOeZJCfiFN4LHFI3kdSFC5A=;
  b=gvd0pNYmVmyY/pPeZ1UmgXZK7hUWr2SiCaOZ2nC62rt6Plf49X+8tvEI
   A7l6+OG/RShmPwIf3Pusi5s9qDz1dXMFg1FHOkryp8kXBlaZm9LEn5CDv
   JNtTF6+go7LGXIwdex/n0qbJ4SBNsDPIA/GIzLnTnrZrMtsyxMwkFR7iq
   ZUIMfn6lEbQU/1GGW7dfoIP5OMBc9Uerjb73mgynLsv4HRry+wg84u3oW
   vW0KVVf1glHmkz4jTZfXSOMJljV8pgSCtXsrNhMEBHISINj8afFJ5pcTt
   vSDGn5y8Ruj6rLneAs+c1hEV9fsvpgmmRZKlKKQbIn9f35/LRUckaaDtP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="348780458"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="348780458"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="818626585"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="818626585"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtRZlBkcxMHZuuXRs91QC3MRpbrlddy6AVHNpBjeLHWBJ/vNovuQzGM4DPyP13NCIffvg9S+M+caJLOFymSRaCibUBZw/EEVNGJHopcNvrMb9dZRjnRUyetkbmQ6eT1LOA+TdynnILrrMpVwB2WeQui/gI4Cz/U4E8XTFdk86IffQUSPslz6RhJ2T+NwSo8d7YdTkjZzHINbS407nVdzE3dAQk/X5sNKNo9+SRkLqTs4pGuNHoYmfAbdjoLlaGOo8A7uXVwbIOORlRw8BDEea9/lggvV3Ybrx+/FtZoxpZnKMPyyi9ZuPFwPWk6x5fk3ode6hUmdmBnzB/IcrnNt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltQMYegyRPp06TIFDLMsKOeZJCfiFN4LHFI3kdSFC5A=;
 b=FF9OCYPIR60+fbvxAKBeB4Ad9DYdAiONGUkG2kJfCGMISBFgK9KMEQVRKKh9uPfW6xE05xphITsZafEMmn31MZAylANRkusl15EzTa0m2Al+LPJ0VjEll3e80shiONV+hZZM11Y6kA2q+DNUUlnqiYIDOgJbnaEBtiHHh7p3ZxUO+TWpDcAIZBVylgVCyxb1/QxraWkC0KHOV5FuYznNBhYGBuIVFnJeMmg/KraAhw5Ox1FrvuPkw5kEFoCtyld7d7V0dEQ2fLwu+9gbvUQit3/K1pgNWAOWINYHTClvdyipMoeuWzlYWgoMETvP0qyU7WhdKyPC6b9orvAhdQIRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Beulich,
 Jan" <JBeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: RE: [PATCH v4 4/4] x86/iommu: pass full IO-APIC RTE for remapping
 table update
Thread-Topic: [PATCH v4 4/4] x86/iommu: pass full IO-APIC RTE for remapping
 table update
Thread-Index: AQHZwToNmh8G0I7e7EOZhmA6b/SBHq/UxZCw
Date: Tue, 1 Aug 2023 02:58:32 +0000
Message-ID: <BL1PR11MB5271AEE7779815557C4F259C8C0AA@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <20230726125508.78704-5-roger.pau@citrix.com>
 <20230728095716.13779-1-roger.pau@citrix.com>
In-Reply-To: <20230728095716.13779-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5271:EE_|PH7PR11MB8569:EE_
x-ms-office365-filtering-correlation-id: b12bebff-ecfa-4933-a589-08db923b30fd
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KRyowvgFBjygr/HfVSQ5AkqbSJh05ZUJK6LhpJmlG7SO8XPHLqMNTqESEW7eZQJBkKwzwsFG7xqH3B5Mm8WBPUxoUUp22XcfDIj7khZbtMdnHfp5fl7gztMMG4KC3KJ5milFpGNTlbVoktbR1bM2u50rCsXR/iTz5kX7OK5eueom+AwyZHei5UQDpIxqYeYYgqheiacOsCqyN6HCvyTh6ssYal7sbDbD5eM58ORPs6JxXL1dlYMITFzaDZ6HyORAJixAlgRBYEztp7Z2B/Pzv5/sc9/xUIlOfhoVo+GmJguOMAemklXGz3CDOsuCzKvX87x3l+otfJF6jtIrye3f2gmGZlUGSydEuq+Z8IGrouEu5BEH4FzlL46E7KvXwSwCFzzB5zsI8Hu1826sQ0fM7U3eiTDux6TRTSGieCSjIj03sQbXlgYDji9+EZEdwwqVojy0O45SYhrmb+eIwEowbChc3XOUEKelYNDjTJmd45ACfFTj83H49QF0H1LVNMStl2iecndrPSybqCUjtzs/9oeImY8YHabTWhbYVzRz7h2QrKYfCaJk8qo6nalKXSfd25gQXJQRTnIKZhVoHkY6nCxJ4dhLtWa7OmqWZgCHf8Z/Z7Fgl+F7wxOymfT15ESU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5271.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199021)(7696005)(38070700005)(9686003)(86362001)(71200400001)(55016003)(186003)(6506007)(83380400001)(33656002)(38100700002)(82960400001)(52536014)(5660300002)(8676002)(15650500001)(4326008)(41300700001)(8936002)(76116006)(66946007)(64756008)(66446008)(66556008)(66476007)(4744005)(316002)(122000001)(2906002)(478600001)(110136005)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnJvMDJQTmxsVlFCbTlLNkxUWTllazhOamJienJCL3BHSDdseXZNUi9xT0hY?=
 =?utf-8?B?cVZpcHhkTEs1S21Dc0Ewc1VjaGVBNjNQc1ppUDYzOXExenFYUmN2ak1mVXk5?=
 =?utf-8?B?RCtadU5VNEp3ZzBYUWxVdFFIaHMraU1MOXFSVUtWMVZOVStGemtzOENkM3RE?=
 =?utf-8?B?VzkwM3ZhQkxVbE8yQkRNOFp6b0pNbDdpdDhRUmtJWDkwT251bVBWbFVIcS9Y?=
 =?utf-8?B?YlYwbUNpNllKUkFFTnVTWmorRWs3a053dkpwemJiWm56Y3FnYzZyQllyS2JF?=
 =?utf-8?B?cGd5S3hlR0wrY3h4YmJSdkFJRmdiL1dnckpkY0JkaVJkUEkrclZhcnRhSE8r?=
 =?utf-8?B?eUdya3Z4U2oxbnFFa0JYQlJGVE9JcWNMZHBBVWdoRzVkV2VXY29sU2QxTGEr?=
 =?utf-8?B?bmlFOW8zNkFTL0RKWm1PYmt4em5mVEVTQzFiRW9BK2RGMDJOam5FVG9MVENN?=
 =?utf-8?B?NnUzU3ZLZEhLZnBkekR2ZGlqaDY1VjBGNHZZWTdwRlFpM3RrZ3dYWVl2VVN1?=
 =?utf-8?B?RkllMnpQNjZ1S3RyaC9tNWtXNlZqRkFKS3pBOXh5QWJaM3VsbisrdnV1SXdX?=
 =?utf-8?B?cFBKRERySGVtalozYjBHeXh0MGpweWs2UVVuRFRBL0hLNGhXcUFFbzBETDdG?=
 =?utf-8?B?V2h3cTg4aWpDVmdpNjVYSldoTElDNXhLS2lhdXBHYmFMODJPNkI1UGV6RE5y?=
 =?utf-8?B?Y2xqb3I0NVh5Rk01TTdGWG42dzVYM1QzSE41NDI2N2NFMDZWaHExRlpxWFNo?=
 =?utf-8?B?Y0lCRFNMU29rTXB5TGt4Nkx3dUIyVjZNR3RROEt4bXFUd29mS2E3ak93amNi?=
 =?utf-8?B?RjZBR3ZzRTFldXZ2NUVGbW52QldaMTRDUHdCVW5mZUdUWnJVZEtQTUV4OVdK?=
 =?utf-8?B?MUs3aVlVeUYzM1ZiZ0hOemlCbFFGSm9PUVFNd29EUWc5dldFbktad1RqQUtV?=
 =?utf-8?B?eno0QnRzTkNValV6TlZVRmtOWksxVXhkYVJjNkJiY0VydnA5bCtSTUJMOWVX?=
 =?utf-8?B?SHVBZXFyK0hTcTJ0MEw3WDFlTUp3bDRLMC9kaDIzME5ZR1NCNVFjeWVrUWdh?=
 =?utf-8?B?bDd3NjE4RXNmMnJvQncrYXJYdFhGK3RORnRaRW1TZTRuR0YzRXZPZmk3TU85?=
 =?utf-8?B?cHM4c2F3ekFQK043Z3hUQlVtT21kZDQ5enBMZTBoUUtnN3lTQTFwdGc0ZU1W?=
 =?utf-8?B?U1ZWM1VuSTVJeHlIa05zWVlWQXRhVEhCWTN0UVRjNmNwYms5cW5ram9nbnU4?=
 =?utf-8?B?Q0FPQlQwczVHTHhqYkNtdmZSQ1pwRGxLVE4zWnN6ZVMra0dEditTYzJyNHZO?=
 =?utf-8?B?VWlyYW1CdkcvUGhrOExjd2FmcWROd3dNM2ZlaGphSTV3UmRLeFFhWUdEZHBr?=
 =?utf-8?B?VTZjSXlUUGYvb01PYmFvTTRtVkpRMURtZ1lIcnQvNUFqZDh0dXQ5c3hzZThN?=
 =?utf-8?B?K2NoY0hPaXdTYXB4MnJBU0VYazZUM0phQ3p6QWRRLzRNSWtRZXFoczMxd09X?=
 =?utf-8?B?cTFCTHdQTGF5cVUvSUdFNXFYRTUveStrd0tRTVgyOUt1YlljamlkTmp0bytU?=
 =?utf-8?B?NmhWeXpKZjV0b25IVHdCVjhXZUdjalo0TDJBUHZ1WFYvOUhFQVNra3ZteVk0?=
 =?utf-8?B?Ymp0R0dDWWF5eklNMGNvaXJ5dmcvbmh3UndicVhsaUhUSk1hTi9DcGhIRnc0?=
 =?utf-8?B?UnpOcmdkenJwZkppVDB1Mm11QnkyQmRRaUdsWlhFMWd5TEFaT2ppQmhCMzQz?=
 =?utf-8?B?d0ZSS21DRTQ5Q2d2Rklud1YrVEs0aHlCVkJQVVRmTlBPT3BVZmdGMDY0QkFp?=
 =?utf-8?B?dVpLQzZjSEFOS0hNY1hPUmhuWWh6WU5hQVBFcjFmQkVHblJSclo4WmVFd094?=
 =?utf-8?B?dWlqeXBPcmtTQTVyY1hzVllxajRWNDU1VFNoVGd4bXRMMU9YNTJOd3doTzZm?=
 =?utf-8?B?dmJXTXlOTDlTbDJxWGFDRFAvQWd0a2x0R1Zaam5jMmFjbXllcm5Fa0JTcklh?=
 =?utf-8?B?SnBXcGxKWFFsakZub2xBb0J3eEZ1UCt2aVU3V2NDWVROazd4eEk1US9DY1Nz?=
 =?utf-8?B?ZHROa2RFSkZ1WGtPZHBTV1JDdEpPVGtTeUhlWG5Kb2c2SFFNQjZtTk8yeFFv?=
 =?utf-8?Q?OOWg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b12bebff-ecfa-4933-a589-08db923b30fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 02:58:32.5614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ewFgKVjTuyhVXek4NhMqgLtrH5eG1fN6+yrVQ1DthIqYLyykXrrSZBLvauUVBXpr/+T03k6umhR7rZAx17sGEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBG
cmlkYXksIEp1bHkgMjgsIDIwMjMgNTo1NyBQTQ0KPiANCj4gU28gdGhhdCB0aGUgcmVtYXBwaW5n
IGVudHJ5IGNhbiBiZSB1cGRhdGVkIGF0b21pY2FsbHkgd2hlbiBwb3NzaWJsZS4NCj4gDQo+IERv
aW5nIHN1Y2ggdXBkYXRlIGF0b21pY2FsbHkgd2lsbCBhdm9pZCBYZW4gaGF2aW5nIHRvIG1hc2sg
dGhlIElPLUFQSUMNCj4gcGluIHByaW9yIHRvIHBlcmZvcm1pbmcgYW55IGludGVycnVwdCBtb3Zl
bWVudHMgKGllOiBjaGFuZ2luZyB0aGUNCj4gZGVzdGluYXRpb24gYW5kIHZlY3RvciBmaWVsZHMp
LCBhcyB0aGUgaW50ZXJydXB0IHJlbWFwcGluZyBlbnRyeSBpcw0KPiBhbHdheXMgY29uc2lzdGVu
dC4NCj4gDQo+IFRoaXMgYWxzbyBzaW1wbGlmaWVzIHNvbWUgb2YgdGhlIGxvZ2ljIG9uIGJvdGgg
VlQtZCBhbmQgQU1ELVZpDQo+IGltcGxlbWVudGF0aW9ucywgYXMgaGF2aW5nIHRoZSBmdWxsIFJU
RSBhdmFpbGFibGUgaW5zdGVhZCBvZiBoYWxmIG9mDQo+IGl0IGF2b2lkcyB0byBwb3NzaWJseSBy
ZWFkIGFuZCB1cGRhdGUgdGhlIG1pc3Npbmcgb3RoZXIgaGFsZiBmcm9tDQo+IGhhcmR3YXJlLg0K
PiANCj4gV2hpbGUgdGhlcmUgcmVtb3ZlIHRoZSBleHBsaWNpdCB6ZXJvaW5nIG9mIG5ld19pcmUg
ZmllbGRzIGluDQo+IGlvYXBpY19ydGVfdG9fcmVtYXBfZW50cnkoKSBhbmQgaW5pdGlhbGl6ZSB0
aGUgdmFyaWFibGUgYXQgZGVmaW5pdGlvbg0KPiBzbyBhbGwgZmllbGRzIGFyZSB6ZXJvZWQuICBO
b3RlIGZpZWxkcyBjb3VsZCBiZSBhbHNvIGluaXRpYWxpemVkIHdpdGgNCj4gZmluYWwgdmFsdWVz
IGF0IGRlZmluaXRpb24sIGJ1dCBJIGZvdW5kIHRoYXQgbGlrZWx5IHRvbyBtdWNoIHRvIGJlDQo+
IGRvbmUgYXQgdGhpcyB0aW1lLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4NCg==

