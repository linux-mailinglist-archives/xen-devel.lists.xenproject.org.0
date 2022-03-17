Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7454DBED8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 06:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291373.494485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUj9E-0007Gm-NC; Thu, 17 Mar 2022 05:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291373.494485; Thu, 17 Mar 2022 05:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUj9E-0007Eg-Jn; Thu, 17 Mar 2022 05:58:08 +0000
Received: by outflank-mailman (input) for mailman id 291373;
 Thu, 17 Mar 2022 05:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VDd=T4=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nUj9C-0006eS-Hn
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 05:58:06 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3434aa6e-a5b7-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 06:58:03 +0100 (CET)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 22:58:00 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2022 22:58:00 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 22:57:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 16 Mar 2022 22:57:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 16 Mar 2022 22:57:59 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (13.101.156.242) by
 MN2PR11MB3597.namprd11.prod.outlook.com (20.178.251.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Thu, 17 Mar 2022 05:57:57 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5081.014; Thu, 17 Mar 2022
 05:57:57 +0000
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
X-Inumbo-ID: 3434aa6e-a5b7-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647496683; x=1679032683;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=smKKZUagFrMqDo1NtoNicuK9dofLgfAbLKYfHZGANkU=;
  b=ijuFoTFdJrRHvAyWkv9rp0vN1F397BZtFG5n2RIee08WepeKMLYf3Y1X
   5NY6P/l2nonwfsxWRdUOk/ccorTBL+GCZyWqqr9N6C8Q8QLP90x+VCRuo
   MYqyRMGxuSH+rGtUNpYlv/thATuIeq3zPeHdXTSkzkWUnB+zGIai+NhcW
   5gCxYrKlp8RNSGmCN1qcC5Wx/S4dqPaMjxPi8rdwhcHxToBIL2PiW0+me
   yGMl04SfgJmrUf3gNYt+smV7JWrffEZtNyyMHYMHFc2XybQI11jFkt1on
   q+umoK3g6MRsB2JuF+cp83kDg4CrEIfUdpt/FM5PAc3RxIsiw5G+K6ATM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="244242979"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="244242979"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="690837895"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjbiFmJPW/w3a4VE5zy69IExqH5Pul4QqYtObGxaWUZ98yNdnEHkmqUoFmNW108V7/WyC8Z26wI23yOZL9pNSwkXCzexNw4Y4tStmQApzhy6ccnGS77DIvKj43zz+V31Wm417ntQRXT/PcQx6t1FWeVuUyDE6DwP8ges/0UCiByDt6/GfUe7eyVmjXTxI29eXHF3llF8o5OSFPeL0Cx0V6UcOtJret+LBKPKZcdH8k4TmSXy54qu63pd2Q2E9Syvs2wGmjOEiLGGcDwdEuNnz+FB0WM3ztRUCcHh+v9qkftZMqMHA0RzDBF7ZhEdsSTmxkOWN6zYcHG72cU2uvXlSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smKKZUagFrMqDo1NtoNicuK9dofLgfAbLKYfHZGANkU=;
 b=On8s5Ep7tKtDTwOYab80Hu1hy6hW2/1ltWtM+nPE2+cqNmu4FETgBQslRNBuaukOzsBZH3ZNEan/vn5gvIHbEZCK/nGJVcUDP6LsDL7QsaqgNsZIDKqo4E3ZnsVeg+wBzhVATKVWyvk9ZqxgbY0KNV7MKudaISMve0MtjiVceCjkMMgmzYBZ+jgUdL4YXFFs81IVCPhJhhhnfGzSatI3RtrPAqBeB+iOHK/Tr3qOoH0sUwha//6Dvgl7J9bYvtALKiC16afb6LfaHjeC0o2q9PAcjULXeDbVnS1tA4bhgxoMqy2Hpqz1ZPuxZFyvks8DRJTo32jbjUKDV5/uS2oJOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>, Thiner Logoer
	<logoerthiner1@163.com>, "Marczykowski, Marek"
	<marmarek@invisiblethingslab.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>
Subject: RE: x86/vmx: Don't spuriously crash the domain when INIT is received
Thread-Topic: x86/vmx: Don't spuriously crash the domain when INIT is received
Thread-Index: AQHYKbevPQACrsDTpUmflGdlWuTEmayj9FgAgAA+nwCAAA5IgIAAQNmAgAQWIgCAFe3v8IAAFMoAgASY4xA=
Date: Thu, 17 Mar 2022 05:57:57 +0000
Message-ID: <BN9PR11MB527622D1D0881131EA3241588C129@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-3-andrew.cooper3@citrix.com>
 <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
 <51ef6bd1-bcd9-9a3a-e902-887d42d7dd7e@citrix.com>
 <bb4b4106-f49d-2b50-1eb9-eb450f6b24fa@suse.com>
 <965e91fa-1f1e-7c57-5a71-a09b170a7d9f@citrix.com>
 <2e1dcfb8-20ae-26b2-427d-9c19bd8c8add@suse.com>
 <BN9PR11MB52767BF5573E31241734F2A28C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <cdbd90a7-bf4e-4ff6-0e95-0671ad553b83@suse.com>
In-Reply-To: <cdbd90a7-bf4e-4ff6-0e95-0671ad553b83@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5db99e39-742e-4d32-e27c-08da07db15e6
x-ms-traffictypediagnostic: MN2PR11MB3597:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB35974803795B5DAF780571DE8C129@MN2PR11MB3597.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rstQkiytc2z+F7dmFFXVgGKOtqZG+vilMB3wahvfXoWW8H0a9/EEkyTZyOEwwWQ7GIuTVUEBJNawtpIlsN3xxacakdD5xBwDYVwwbB7M6iksqJwNKWSIFxd/LelH+ZeUCKyb63FCMN4w6+1g2C+6vkQhDuWCo1nLiLLp199R+fPhJ5SQXLdjROAS2BYgXTD8hcWQZUMwSHvL1rU53lztxsnlVugMNO+AiBo7C08dsYOXOVXBorZDo9pXvNOfggTldJd3zTZlBgdpz8cSw8jaNy1sU4RYc9SO3v5fEXOIGPdsB+pRKApBqEjYZl2bdTVMbpNQIylfoH10gJysAIjXx4loIlUnhDt/V2gP5AQOymIevmgWNMFpzMEJxi/5D3kGBuiPsaIKVBVq0Q982SxhBAhtq2sh0dup0JlRtwBWVgbU32UztaC4fS8LcfUYcfj0aprwqL9PjM+pLIsGChN9dzxDjFR/PWPyZ6e188vcxK3Hr3WHd0V2RtxXCsd9rQtUWiumNQFL6XpwPNVgqlujMldM3S/qrkulPEGLCFr2uSqv42RxRD6AY1Dkku2wELmnRWtTWo4fSlg50ty1b2jmEjNmp0SSyHELS4cdtsSQBq/ClMJ4N4Lnkc/QWPYARx8Ww9NFAUFzsCNcHxgKa6s+30xPt1TVstQ6lj/hsx/HmPgBjDKePzApElwPWI6i+7CcuV2yxRM7/3cTnEDmF3y1hg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(9686003)(82960400001)(122000001)(66476007)(66946007)(66446008)(64756008)(33656002)(76116006)(66556008)(5660300002)(8676002)(4326008)(86362001)(71200400001)(38070700005)(508600001)(7696005)(316002)(53546011)(6506007)(38100700002)(55016003)(54906003)(6916009)(2906002)(52536014)(8936002)(26005)(186003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STRCdHVVdVZiSXVmZkhZeXpIWnk2c0daN2ZEaTdHQ3BtNnZiVFdCWTYwWUI3?=
 =?utf-8?B?RXBaQmJJUUNBbmJYWlBzbmdsSXEzdkJrU2JLUm5YZHp0em5qaytueHhkbXVS?=
 =?utf-8?B?MTNyMkIxQ1pWblBnWXBPVDJKYlU1UkxPa0FaUUdxQmdKbmtMNzFsNXY0OUpF?=
 =?utf-8?B?aVJ6RGlxeE9wLzk1c2swcmZEc3JncFN0YzIyb2lWYkNyN1ZaZUZsdVN2QS9t?=
 =?utf-8?B?TUM5eFhXZjlFYUkxSEFsYk12MS9lbEgyc3lxVldMZWtsSzhvbEJWa2lMMnhh?=
 =?utf-8?B?RW4zQWpacXRjdVM2TXNkemJHWkI2emtvMzd2M3BnaitBaENJbCtzY3lScEVy?=
 =?utf-8?B?anpHUHhvY0ErcStTM3NVWHhWRXkvZU54U25SL1JqenlzcC91THhtVEx0V0Vo?=
 =?utf-8?B?WVg5aktQSWpUWVlKV3RIM1gvb2hkaFVVNDllTDQ4MHpQWVNReHdlV2dSbHFT?=
 =?utf-8?B?ZmQvMmNXcUV0UVhRSWU0L2NERFdnMDQ0aXgrMS9zZGl1Mkg5elQ5cDRiUGQv?=
 =?utf-8?B?czRaWDJyc05WR2Z3N2pzR0hRYjZCTjVPRXkvRmtud2FYLzcwTjR3VGhIaytZ?=
 =?utf-8?B?aFc5RVlJSUtNWE1DdU9hdjdTck40dElkdjR4Nm5tZHdNL3B0cy9NR2doTGcy?=
 =?utf-8?B?MTdZcUwzYUhOalFiWitWVDM5RDNwTEtOcXBhZXJlWkNjdXVVTzJFYmdDcC9i?=
 =?utf-8?B?MHZGbm1GaUp1c2ZlQUdoWVR1SDExQms5UEdYM0I4SldxL2JTdyswalZVMXpr?=
 =?utf-8?B?MmE4a1BSUEg5eFl4eTFBZVBCQzUvWW02a3NqYWpWalkzNk5HK21kdmFUNmlw?=
 =?utf-8?B?SWY3TXpiZkhUTHYrNUdMdkdTN1lmZ3FWZ2ZrQW4zSUxpc3dieDhveE9OMGIx?=
 =?utf-8?B?TEswM1N1eDhKdW52NHpCNmtxTDBJWUhoSmZEb1ZpQmVQTFFqQnJYUmpmLzhk?=
 =?utf-8?B?SVZkVHNHTXc4cU1LOC9yUFFVc2tXZkdlcHpoOWFEUFpLMXU2czVnbmZLeElC?=
 =?utf-8?B?a3kzT3VkdkFRRkUyUnlaRHZ5Rk1BZDZpQzF4dWd5a25MdTRjM05QWE0zd2Zj?=
 =?utf-8?B?OEhwdTdUaVVhUHM1NWhVQkhLaDlWdDl6L1dROHMrdHNyZGthdGMzdEVVaEpH?=
 =?utf-8?B?OXRsbDUwckVrSzVmdWdCU3o5VENzUmh0bXh0bVA2QnV2UERMYldzdG1tYzNF?=
 =?utf-8?B?Q2pYZGMyQU1Wa1VTektjQThva3lhMTJEUjFTOVRYN3NtaFJpR25XWkt0bi9X?=
 =?utf-8?B?YW84SzJsSWdRQ1BHTC9MdWJOQ0p5TlhnK0ZsZndhNlNNTDlhZVAweCtndWkx?=
 =?utf-8?B?QmQ0TExyZHVZaWZxb1JKOWF6K09wRUJXNVZSUVdhTXo5RzJtclFaU1NDTGpR?=
 =?utf-8?B?QWw1YSsyYlRKZUgrQS9sOHlIZkJEUm9kU2wzWnFCNjl3S0x6Z0FxTXRYMldC?=
 =?utf-8?B?d01RMXc1TWhoYW9qWXpEcy81YmZhT1dvcEx5YjlUa1FkUUMwVnBnSENIMjhK?=
 =?utf-8?B?OXppdWRkam5DNGNJMUhEMU0zdVpzejJuTzRCblByenNXVmlJOWR1a0RjUjV1?=
 =?utf-8?B?Tmh3R2pkSlFJTER2VDBSRHZpNmozaS9OM0dERlFhejVYMjc1a2ZSVHA3aWVy?=
 =?utf-8?B?UDJCWWFodmR0VktsdjJjKzdtcks4Y1hDdytQZmJPdHZTcFdJWWRzbzBBUUFJ?=
 =?utf-8?B?eUpmTTdLelpwQWlMOEl5YjN2UVlGdmgxWmk4SVJrSkNKL0ZTK2UyWU9EWGVU?=
 =?utf-8?B?QmM2NG5WVmJZb1VXeGpQVmJKVEgvZ2tTRFl6TGMxVVMrMGhWcW5NN2hYaDBX?=
 =?utf-8?B?UVowcnBiOW5qSUVVZGFZMTV6MFUyNEdYM3ZZWFNReUR6dGFJQ045Y2NYaVRv?=
 =?utf-8?B?YlNhd05oa1R5OXZIM3ZsVTBESVdKK05vNlFBZ09WTUpLTXJBdjcvMWFWMHFp?=
 =?utf-8?Q?atnYu7sonl7GvABmeghGYDCU1DH4RWnv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db99e39-742e-4d32-e27c-08da07db15e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 05:57:57.1313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WDRCfNCZpYCsSKrXtVvGKCth2kR2IzTYDYclyx4JEahWLSH27f2hjFjrOpUl/fgB0rLORv3jHa6LX5GdMi2T4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3597
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
TWFyY2ggMTQsIDIwMjIgMzo0MyBQTQ0KPiANCj4gT24gMTQuMDMuMjAyMiAwNzozNSwgVGlhbiwg
S2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gPj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAyOCwgMjAyMiAzOjM2IFBNDQo+ID4+DQo+ID4+
IE9uIDI1LjAyLjIwMjIgMTg6MTEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+ID4+PiBPbiAyNS8w
Mi8yMDIyIDEzOjE5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+PiBPbiAyNS4wMi4yMDIyIDEz
OjI4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiA+Pj4+PiBPbiAyNS8wMi8yMDIyIDA4OjQ0LCBK
YW4gQmV1bGljaCB3cm90ZToNCj4gPj4+Pj4+IE9uIDI0LjAyLjIwMjIgMjA6NDgsIEFuZHJldyBD
b29wZXIgd3JvdGU6DQo+ID4+Pj4+Pj4gSW4gVk1YIG9wZXJhdGlvbiwgdGhlIGhhbmRsaW5nIG9m
IElOSVQgSVBJcyBpcyBjaGFuZ2VkLg0KPiA+PiBFWElUX1JFQVNPTl9JTklUIGhhcw0KPiA+Pj4+
Pj4+IG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgZ3Vlc3QgaW4gcXVlc3Rpb24sIHNpbXBseSBzaWdu
YWxzIHRoYXQgYW4gSU5JVA0KPiA+PiB3YXMNCj4gPj4+Pj4+PiByZWNlaXZlZC4NCj4gPj4+Pj4+
Pg0KPiA+Pj4+Pj4+IElnbm9yaW5nIHRoZSBJTklUIGlzIHByb2JhYmx5IHRoZSB3cm9uZyB0aGlu
ZyB0byBkbywgYnV0IGlzIGhlbHBmdWwgZm9yDQo+ID4+Pj4+Pj4gZGVidWdnaW5nLiAgQ3Jhc2hp
bmcgdGhlIGRvbWFpbiB3aGljaCBoYXBwZW5zIHRvIGJlIGluIGNvbnRleHQgaXMNCj4gPj4gZGVm
aW5pdGVseQ0KPiA+Pj4+Pj4+IHdyb25nLiAgUHJpbnQgYW4gZXJyb3IgbWVzc2FnZSBhbmQgY29u
dGludWUuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBEaXNjb3ZlcmVkIGFzIGNvbGxhdGVyYWwgZGFt
YWdlIGZyb20gd2hlbiBhbiBBUCB0cmlwbGUgZmF1bHRzIG9uIFMzDQo+ID4+IHJlc3VtZSBvbg0K
PiA+Pj4+Pj4+IEludGVsIFRpZ2VyTGFrZSBwbGF0Zm9ybXMuDQo+ID4+Pj4+PiBJJ20gYWZyYWlk
IEkgZG9uJ3QgZm9sbG93IHRoZSBzY2VuYXJpbywgd2hpY2ggd2FzIChvbmx5KSBvdXRsaW5lZCBp
bg0KPiA+Pj4+Pj4gcGF0Y2ggMTogV2h5IHdvdWxkIHRoZSBCU1AgcmVjZWl2ZSBJTklUIGluIHRo
aXMgY2FzZT8NCj4gPj4+Pj4gU0hVVERPV04gaXMgYSBzaWduYWwgZW1pdHRlZCBieSBhIGNvcmUg
d2hlbiBpdCBjYW4ndCBjb250aW51ZS7CoCBUcmlwbGUNCj4gPj4+Pj4gZmF1bHQgaXMgb25lIGNh
dXNlLCBidXQgb3RoZXIgc291cmNlcyBpbmNsdWRlIGEgZG91YmxlICNNQywgZXRjLg0KPiA+Pj4+
Pg0KPiA+Pj4+PiBTb21lIGV4dGVybmFsIGNvbXBvbmVudCwgaW4gdGhlIFBDSCBJIGV4cGVjdCwg
bmVlZHMgdG8gdHVybiB0aGlzIGludG8NCj4gYQ0KPiA+Pj4+PiBwbGF0Zm9ybSByZXNldCwgYmVj
YXVzZSBvbmUgbWFsZnVuY3Rpb25pbmcgY29yZSBjYW4ndC7CoCBJdCBpcyB3aHkgYQ0KPiA+Pj4+
PiB0cmlwbGUgZmF1bHQgb24gYW55IGxvZ2ljYWwgcHJvY2Vzc29yIGJyaW5ncyB0aGUgd2hvbGUg
c3lzdGVtIGRvd24uDQo+ID4+Pj4gSSdtIGFmcmFpZCB0aGlzIGRvZXNuJ3QgYW5zd2VyIG15IHF1
ZXN0aW9uLiBDbGVhcmx5IHRoZSBzeXN0ZW0gZGlkbid0DQo+ID4+Pj4gc2h1dCBkb3duLg0KPiA+
Pj4NCj4gPj4+IEluZGVlZCwgKmJlY2F1c2UqIFhlbiBjYXVnaHQgYW5kIGlnbm9yZWQgdGhlIElO
SVQgd2hpY2ggd2FzIG90aGVyd2lzZQ0KPiA+Pj4gc3VwcG9zZWQgdG8gZG8gaXQuDQo+ID4+Pg0K
PiA+Pj4+ICBIZW5jZSBJIHN0aWxsIGRvbid0IHNlZSB3aHkgdGhlIEJTUCB3b3VsZCBzZWUgSU5J
VCBpbiB0aGUNCj4gPj4+PiBmaXJzdCBwbGFjZS4NCj4gPj4+Pg0KPiA+Pj4+Pj4gQW5kIGl0IGFs
c28gY2Fubm90IGJlIHRoYXQgdGhlIElOSVQgd2FzIHJlY2VpdmVkIGJ5IHRoZSB2Q1BVIHdoaWxl
DQo+ID4+IHJ1bm5pbmcgb24NCj4gPj4+Pj4+IGFub3RoZXIgQ1BVOg0KPiA+Pj4+PiBJdCdzIG5v
dGhpbmcgKHJlYWxseSkgdG8gZG8gd2l0aCB0aGUgdkNQVS7CoCBJTklUIGlzIGEgZXh0ZXJuYWwg
c2lnbmFsIHRvDQo+ID4+Pj4+IHRoZSAocmVhbCkgQVBJQywganVzdCBsaWtlIE5NSS9ldGMuDQo+
ID4+Pj4+DQo+ID4+Pj4+IEl0IGlzIHRoZSBuZXh0IFZNRW50cnkgb24gYSBDUFUgd2hpY2ggcmVj
ZWl2ZWQgSU5JVCB0aGF0IHN1ZmZlcnMgYQ0KPiA+Pj4+PiBWTUVudHJ5IGZhaWx1cmUsIGFuZCB0
aGUgVk1FbnRyeSBmYWlsdXJlIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdGhlDQo+ID4+Pj4+IGNv
bnRlbnRzIG9mIHRoZSBWTUNTLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBJbXBvcnRhbnRseSBmb3IgWGVu
IGhvd2V2ZXIsIHRoaXMgaXNuJ3QgYXBwbGljYWJsZSBmb3Igc2NoZWR1bGluZyBQVg0KPiA+Pj4+
PiB2Q1BVcywgd2hpY2ggaXMgd2h5IGRvbTAgd2Fzbid0IHRoZSBvbmUgdGhhdCBjcmFzaGVkLsKg
IFRoaXMgYWN0dWFsbHkNCj4gPj4+Pj4gbWVhbnQgdGhhdCBkb20wIHdhcyBhbGl2ZSBhbiB1c2Fi
bGUsIGFsYmVpdCBpdCBzaGFyaW5nIGFsbCB2Q1BVcyBvbiBhDQo+ID4+Pj4+IHNpbmdsZSBDUFUu
DQo+ID4+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+IFRoZSBjaGFuZ2UgaW4gSU5JVCBiZWhhdmlvdXIg
ZXhpc3RzIGZvciBUWFQsIHdoZXJlIGlzIGl0IGNyaXRpY2FsIHRoYXQNCj4gPj4+Pj4gc29mdHdh
cmUgY2FuIGNsZWFyIHNlY3JldHMgZnJvbSBSQU0gYmVmb3JlIHJlc2V0dGluZy7CoCBJJ20gbm90
IHdhbnRpbmcNCj4gPj4+Pj4gdG8gZ2V0IGludG8gYW55IG9mIHRoYXQgYmVjYXVzZSBpdCdzIGZh
ciBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gSSBoYXZlDQo+ID4+Pj4+IHRpbWUgdG8gZml4Lg0KPiA+
Pj4+IEkgZ3Vlc3MgdGhlcmUncyBzb21ldGhpbmcgaGlkZGVuIGJlaGluZCB3aGF0IHlvdSBzYXkg
aGVyZSwgbGlrZSBJTklUDQo+ID4+Pj4gb25seSBiZWluZyBsYXRjaGVkLCBidXQgdGhpcyBsYXRj
aGVkIHN0YXRlIHRoZW4gY2F1c2luZyB0aGUgVk0gZW50cnkNCj4gPj4+PiBmYWlsdXJlLiBXaGlj
aCB3b3VsZCBtZWFuIHRoYXQgcmVhbGx5IHRoZSBJTklUIHdhcyBhIHNpZ25hbCBmb3IgdGhlDQo+
ID4+Pj4gc3lzdGVtIHRvIHNodXQgZG93biAvIHNodXR0aW5nIGRvd24uDQo+ID4+Pg0KPiA+Pj4g
WWVzLg0KPiA+DQo+ID4gd2h5IGlzIElOSVQgbGF0Y2hlZCBpbiByb290IG1vZGUgKHRha2UgZWZm
ZWN0IHVudGlsIHZtZW50cnkpIGluc3RlYWQgb2YNCj4gPiBkaXJlY3RseSBjYXVzaW5nIHRoZSBD
UFUgdG8gcmVzZXQ/DQo+ID4NCj4gPj4+DQo+ID4+Pj4gSW4gd2hpY2ggY2FzZSBhcnJhbmdpbmcg
dG8NCj4gPj4+PiBjb250aW51ZSBieSBpZ25vcmluZyB0aGUgZXZlbnQgaW4gVk1YIGxvb2tzIHdy
b25nLiBTaW1wbHkgY3Jhc2hpbmcNCj4gPj4+PiB0aGUgZ3Vlc3Qgd291bGQgdGhlbiBiZSB3cm9u
ZyBhcyB3ZWxsLCBvZiBjb3Vyc2UuIFdlIHNob3VsZCBzaHV0DQo+ID4+Pj4gZG93biBpbnN0ZWFk
Lg0KPiA+Pj4NCj4gPj4+IEl0IGlzIHNvZnR3YXJlJ3MgZGlzY3JldGlvbiB3aGF0IHRvIGRvIHdo
ZW4gYW4gSU5JVCBpcyBjYXVnaHQsIGV2ZW4gaWYNCj4gPj4+IHRoZSBleHBlY3RhdGlvbiBpcyB0
byBob25vdXIgaXQgZmFpcmx5IHByb21wdGx5Lg0KPiA+Pj4NCj4gPj4+PiBCdXQgSSBkb24ndCB0
aGluayBJIHNlZSB0aGUgZnVsbCBwaWN0dXJlIGhlcmUgeWV0LCB1bmxlc3MgeW91cg0KPiA+Pj4+
IG1lbnRpb25pbmcgb2YgVFhUIHdhcyBhY3R1YWxseSBpbXBseWluZyB0aGF0IFRYVCB3YXMgYWN0
aXZlIGF0IHRoZQ0KPiA+Pj4+IHBvaW50IG9mIHRoZSBjcmFzaCAod2hpY2ggSSBkb24ndCB0aGlu
ayB3YXMgc2FpZCBhbnl3aGVyZSkuDQo+ID4+Pg0KPiA+Pj4gVGhpcyBkaWQgY2F1c2UgY29uZnVz
aW9uIGR1cmluZyBkZWJ1Z2dpbmcuwqAgQXMgZmFyIGFzIHdlIGNhbiB0ZWxsLCBUWFQNCj4gPj4+
IGlzIG5vdCBhY3RpdmUsIGJ1dCB0aGUgb2JzZXJ2ZWQgYmVoYXZpb3VyIGNlcnRhaW5seSBsb29r
cyBsaWtlIFRYVCBpcw0KPiA+Pj4gYWN0aXZlLg0KPiA+Pj4NCj4gPj4+IFRoZW4gYWdhaW4sIHJl
c2V0IGlzIGEgcGxhdGZvcm0gYmVoYXZpb3VyLCBub3QgYXJjaGl0ZWN0dXJhbC7CoCBBbHNvLA0K
PiA+Pj4gaXQncyBteSB1bmRlcnN0YW5kaW5nIHRoYXQgSW50ZWwgZG9lcyBub3Qgc3VwcG9ydCBT
MyBvbiBUaWdlckxha2UNCj4gPj4+IChvcHRpbmcgdG8gb25seSBzdXBwb3J0IFMwaXggaW5zdGVh
ZCksIHNvIEknbSBndWVzc2luZyB0aGF0ICJMaW51eCBTMyINCj4gPj4+IGFzIGl0J3MgY2FsbGVk
IGluIHRoZSBtZW51IGlzIHNvbWV0aGluZyByZXRyb2ZpdHRlZCBieSB0aGUgT0VNLg0KPiA+Pj4N
Cj4gPj4+IEJ1dCBvdmVyYWxsLCB0aGUgcG9pbnQgaXNuJ3QgcmVhbGx5IGFib3V0IHdoYXQgdHJp
Z2dlcmVkIHRoZSBJTklULsKgIFdlDQo+ID4+PiBhbHNvIHNob3VsZG4ndCBudWtlIGFuIGlubm9j
ZW50IFZNIGlmIGFuIElOSVQgSVBJIHNsaXBzIHRocm91Z2gNCj4gPj4+IGludGVycnVwdCByZW1h
cHBpbmcuDQo+ID4+DQo+ID4+IEJ1dCB3ZSBhbHNvIHNob3VsZG4ndCBjb250aW51ZSBpbiBzdWNo
IGEgY2FzZSBhcyBpZiBub3RoaW5nIGhhZCBoYXBwZW5lZA0KPiA+PiBhdCBhbGwsIHNob3VsZCB3
ZT8NCj4gPj4NCj4gPg0KPiA+IE5vdyB0aGVyZSBhcmUgdHdvIHByb2JsZW1zOg0KPiA+DQo+ID4g
MSkgQW4gaW5ub2NlbnQgVk0gaXMga2lsbGVkOw0KPiA+IDIpIFRoZSBzeXN0ZW0gY29udGludWVz
IGFzIGlmIG5vdGhpbmcgaGFkIGhhcHBlbmVkOw0KPiA+DQo+ID4gQW5kcmV3J3MgcGF0Y2ggZml4
ZXMgMSkgd2hpY2ggaW1vIGlzIHdlbGNvbWVkIGFueXdheS4NCj4gPg0KPiA+IDIpIGNlcnRhaW5s
eSBuZWVkcyBtb3JlIHdvcmsgYnV0IGNvdWxkIGNvbWUgYWZ0ZXIgMSkuDQo+IA0KPiBUaGF0J3Mg
b25lIHdheSB0byBsb29rIGF0IHRoaW5ncywgc3VyZSwgYW5kIGlmIHlvdSBhZ3JlZSBpdCBtYWtl
cyBzZW5zZQ0KPiB0byBhZGRyZXNzIDEpLCBJIHdvbid0IGdvIGFzIGZhciBhcyB0cnlpbmcgdG8g
YmxvY2sgc3VjaCBhIGNoYW5nZS4gQnV0DQo+IGl0IGZlZWxzIHdyb25nIHRvIG1lIC0gMikgd29y
a2luZyBwcm9wZXJseSByZWFsbHkgaW5jbHVkZXMgMSkgcGx1cyB0aGUNCj4ga2lsbGluZyBvZiBh
bGwgb3RoZXIgaW5ub2NlbnQgVk1zIHRoYXQgd2VyZSBydW5uaW5nIGF0IHRoZSB0aW1lLg0KPiAN
Cg0KSSBmZWVsIHRoYXQgMikgd2lsbCBiZSBkb25lIGluIGEgd2F5IHRoYXQgdGhlIGFkbWluIGNh
biBjaG9vc2UgdGhlDQpwb2xpY3kuIEl0IGNvdWxkIGJlIGtpbGxpbmcgYWxsIFZNcyBvciBpbiBh
IG1vZGUgd2hlcmUgZnVydGhlciANCmRpYWdub3NlIGlzIGFsbG93ZWQuIEdpdmVuIHRoYXQgcGFy
dCBpcyB1bmNsZWFyIGF0IHRoaXMgcG9pbnQsIEknbQ0KaW5jbGluZWQgdG8gYWNrIDEpIGZpcnN0
Og0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNClRo
YW5rcw0KS2V2aW4NCg==

