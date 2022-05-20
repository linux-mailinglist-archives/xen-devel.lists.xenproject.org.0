Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E5B52EDC1
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 16:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334250.558255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3GC-0005Uo-H5; Fri, 20 May 2022 14:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334250.558255; Fri, 20 May 2022 14:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3GC-0005Rn-Cn; Fri, 20 May 2022 14:05:44 +0000
Received: by outflank-mailman (input) for mailman id 334250;
 Fri, 20 May 2022 14:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6WWC=V4=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1ns3GA-0005Rh-TF
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 14:05:43 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebafcdf1-d845-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 16:05:38 +0200 (CEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 07:05:35 -0700
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 20 May 2022 07:05:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 20 May 2022 07:05:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 20 May 2022 07:05:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 20 May 2022 07:05:34 -0700
Received: from CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30)
 by MN2PR11MB3613.namprd11.prod.outlook.com (2603:10b6:208:ee::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 14:05:30 +0000
Received: from CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::181f:ef86:8705:bd1f]) by CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::181f:ef86:8705:bd1f%7]) with mapi id 15.20.5250.018; Fri, 20 May 2022
 14:05:30 +0000
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
X-Inumbo-ID: ebafcdf1-d845-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653055538; x=1684591538;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JGqMiaNCtiKWopGTCzc8G1mAq76OUlPHlMgwCadM3C0=;
  b=OgRN1Mu9iciGcp2EXgBrsgyxYHTfNFx0r64SN7xqPbtB8tadBd0zmYaG
   Al3azpi9LBWol5bofu7g9Aj/TXPbkflao9G0qsSeBVuXZqQN92gOmygoW
   oOI7D52goki35t/A2Lfji5wd3hOT0gaFWwsMXJ2J9X1SDMN8m/bk2WPve
   YwMMltY6mpeu3Edotm/7JKyjBUdjr/yAuB0DRDb6MHop8mU9DwLFuJv04
   YMI2xp7BlvIX/c4teGV2thFtuvUa8tIYwEc1n+VhxhOshLn8CtxaZYm18
   3+JWdM7z+e8ofRvNw9MzBAhQmWiD9RvSZrYfJjEnO6w1nQ4LNX8HQwgmt
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="253129864"
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="253129864"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="701759726"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWANSao1HXiE5wM2tJ7JujF3L+RLMOYLjd88STtVePfR1YEinISYZyTGYbF2ODlpoQzix39ITfDAGnOP2ahjqA1tyCztM4TgQAqXAVJua3TxvRx7Tnxtqv0KUVlgGjJhbCe3IdXsC+y6Vkj8uBZahhxDW51Y/jx6L7KHbcPTNorEQR1n3/UG8xZmcunX8vuVrxIOztPqtreTHRecigVNYGHuU6coCgQaaVpSHIbHyuwfBGEIpon+UT2n0Rmuc5m2BHJ/q+2MslL0ZQuWpEN/ZZBfm827xkbf2CbPSZXX6idwrdORmFB6+9utMBPriZdUgwW8moaY2lyXnDraULQxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGqMiaNCtiKWopGTCzc8G1mAq76OUlPHlMgwCadM3C0=;
 b=f67OhvpnqQTdJ1w06GsXtvgQUxFr9fcX3wnleJEUHM0lP5ilh66S+usM51nALr89TKUEFZELpRTmkwUriTL2NOj6Q0yv4x8Yt8PGTgVG9P1BNTITDmzAEjKzuNzEvuRnMOpIVeiZiC5B4+XLXmG2xYRquNeq7H4Oc+kpuFFu7OmSt8Vtf3byW3ipy2Ociz+4RF9i+ysAnQtGZoEqbjN3GAm+xsBFqU8UK7F+ecrpWSiW60+4Jn09780VoKlc3uyEknH/9pwvP7wPSCbLFwjwsLBp4+76YmfFABwARnhXBAnbGN5Q0t88xoJmL1lmVdU1gSwoovRnbmvmZuWAIl5GIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Lengyel, Tamas" <tamas.lengyel@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Gross,
 Jurgen" <jgross@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, "Beulich, Jan" <JBeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH 3/3] x86/monitor: Add new monitor event to catch all
 vmexits
Thread-Topic: [PATCH 3/3] x86/monitor: Add new monitor event to catch all
 vmexits
Thread-Index: AQHYWkxRLPl0PMiFWESicSOc/TYisq0OvK8AgAycPYCACYL7gIACMmIAgADiI1A=
Date: Fri, 20 May 2022 14:05:30 +0000
Message-ID: <CY4PR11MB005667B8CBB24E8E525F56E7FBD39@CY4PR11MB0056.namprd11.prod.outlook.com>
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <65645a9d2ada525c9ffc07dce594eeff5891b5a7.1651073086.git.tamas.lengyel@intel.com>
 <CABfawhmqnCXBBMsjJ1OUsiZQ2S+bAHXq_cuhi5GqKw8qKMBtGw@mail.gmail.com>
 <CABfawh=pwDVCW9HYNK7+5gAh1+MPzCGxePyzUE7G1JgrOrj1=A@mail.gmail.com>
 <CABfawhm9ZbeXWxc0Gxsg4ztbH-v27gxuQ+PqfeVNyV51tWoK8w@mail.gmail.com>
 <BN9PR11MB5276FCB1E131A3D72E4A36B68CD39@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB5276FCB1E131A3D72E4A36B68CD39@BN9PR11MB5276.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8165255-62b0-41af-2a6a-08da3a69cca5
x-ms-traffictypediagnostic: MN2PR11MB3613:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB3613031933123823587912B5FBD39@MN2PR11MB3613.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X3rVgUWUs2B5kcRk4r2xt9CeM1gaTXhgYT47p9nvbRpHVia1dT15TDipcNyeVSu95M88G4kGU3LsaFYGe1kRA783ci1sgcwj3Nm4egv8RVndW3i7tO3kpNgkj5lHiYs+240LbHW3dEb6WQBEyP3TGFs2yQbmIi+vILrSx3mhiWGJ/T5wZPJqxoSRTNpe98CXoPdNH7K93lcOamfS1qIALDc+3Rew+X6AqNmun2rB6LHF01C7h7XG7HpDe9vIR+re8Wp+J9WbAUQt5tv5TnAiFx81f4Sqd8JGV0dwcWNZfqZU20nqNbiRV+rGLqDFIDyVD4pKp+ierfkWn5/4b7KP6To1rgBarjV3f31zA5n+8BRCiCKW6gwM6eNds+6LgnEmkJLoS8Aw8rL6Bv60SxmjopJEn2JGd5pbPiwY+OeZFfdBV9+xqnfc5KQ0opNWM4lSUNiNVkS/h6mqsB3+xrhm6gOp4hTBowFbbARSFRsXVTtdfv2hriPmWtKKh7MIxsJRvPbV6sBU4yRb9NdAHR2RCEllFULJ1DVVGAteesH/J/8gS+sL1d/aaBqL1ocsRhFBHjPBVxdDKs7E+HdjUultItsVRljTZS+5PRPMCR3sUpt56UWHX6zM5M5AMOQ3zKLkO8tsk02jLNciKIMGdb6LKeQllVyBFzIjXlAYgHQioJUNWNIUbZQheHaaL0xNHEdUEil5KsaD3iXO3CjnBgacuw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0056.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(53546011)(54906003)(186003)(107886003)(110136005)(316002)(9686003)(26005)(86362001)(6506007)(71200400001)(2906002)(508600001)(4326008)(8676002)(122000001)(38070700005)(8936002)(82960400001)(38100700002)(7416002)(33656002)(76116006)(66946007)(7696005)(66476007)(66556008)(66446008)(64756008)(55016003)(52536014)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVNXdy9MSjVjcmlNUzFtNGh0ZFhTWXJNUUdCa0RLRXN0dEVyMkQwUHVwWGxU?=
 =?utf-8?B?aGU0OFhXN29PdnRCSEpueUF6ck9oMWZsMHhwVEVVelRkZjViS2ttbWtLQXBR?=
 =?utf-8?B?MStmK0VVZThEOGdiMTlOd1JuMmpSMnNIczBxdk1JSDZNdG9tWkZodWtmd1Uy?=
 =?utf-8?B?YnpMQ296cmJVRHJpcENVMnpuVFdHQkt6aTNGcXRSUlludjZpTTdxUmJDZnVD?=
 =?utf-8?B?amJkRUNiRTQ5UXl6NzVGVkJTSzJhWjArSUpKZUZMbEpWaVRrYUxibU1hNHdW?=
 =?utf-8?B?VlhFQ2lKdWFPeHFwd0ZJSWtCZk5WMGdmaVFEUHFzREJKQmVyandnTWIySWlJ?=
 =?utf-8?B?SWhvNXJWbTZUQ0hxUm5NZ3F2Y29LUkFLL25LWTRKUlV4OS9KYkVxTXRRNmZE?=
 =?utf-8?B?c1lNQ2lzZllmK1VSczBWallQcDBTSmtTZjBSTlJZMlRzY3MyQ09XOE1NSUJL?=
 =?utf-8?B?OVlES2o4eGxjUms3cUlYWmZEY0tmWkVuMitIVkxhUlNVWVViSUF2UmVvOFIv?=
 =?utf-8?B?RUJUNjAwVFN2bjNrSEFCSjVHZkJCNFhnMWo5dG5WNDA1WG96RUMxS25nWXBY?=
 =?utf-8?B?YlBSOFY0MS94ZnVXdTN0SU9wNnhCMnFwQi81VXB5OUx4ZDF6bzFsYkZmL3dZ?=
 =?utf-8?B?WnpsN1dWR3owcHBxMnBXSzIvaE9HeFJmYWhBVVVYcWkvOWNKVGw5SUFiczZy?=
 =?utf-8?B?ZlN2WFI0bVFzNkJleFRKL3N4ZkZkMUlnUTROR1hMcFpzeXZWbiszVFQ0Tmhj?=
 =?utf-8?B?NVV5ZmxqbmJ3RjhmMGhZckFyZmZEamYreE1PaWEyZ2w3MTJieWFPL2t4Mzk1?=
 =?utf-8?B?ZmkyWEJLblE1V2syUFRkVnhGZmFubnZmQ1VFZmpBaWtOblhRdFlxVW5ZZXl2?=
 =?utf-8?B?bTRjSWZKekVISGRCNFA5Rlk2dGhHNWdPWWlrdURKNzF4RlhyZlo5RUlYd1Yz?=
 =?utf-8?B?ZDdjZzgvdVBtd1Rid3dIY0FEeG80WnVQamd6MjAvUWdmL1dFeXN6ZFNrWlg1?=
 =?utf-8?B?Y2JXYTFFTWtEenFFbWtWM24xam4zSDN1VWNOaE5ZRjhrY3dvZTJJKzZreUJ0?=
 =?utf-8?B?Zk11UGNiMUlNa25VREUvZU9aZUUzSEwrSTh1RUtMazdocEV2ZHhKbVRVUXJJ?=
 =?utf-8?B?R2ZVdnk3bTl5YWhhUHM0YW1neTYyKzdQUEZJNHJuT1JrZTJlNlFPMmloTXov?=
 =?utf-8?B?OHB6bi9XTno2MVR5YmpFT241blhmWnpFYVRVRlRjdjQ5RVhqbExUZG40WUZT?=
 =?utf-8?B?bHk2c2RpYndaRTgzaGdvN3FDZlR4Yk9JZHIxKytyYmg3Z2RYWHFmc0lFZmlt?=
 =?utf-8?B?TDRUWkxvMFhKdXliL0lQUytVQnhqTW9nUUJFbnUrYUNVQ3lDM052TEhpQ3F5?=
 =?utf-8?B?T21IbTQyUzhtbUJpQVdkM0xsY1AycGNEb2h1d2k4aWNvWFVucG5xNE5WeDIx?=
 =?utf-8?B?ZVZJTFdhdlliOUhVWjFHQXpNUnpjVXZ2NzUvTk9tS29EUng4TXBLaTNoK3d4?=
 =?utf-8?B?WmlsMUZKTkF4Y0syT0xONlN3VXZLZHVGZG5vM3NSZS9QRW5FYm9RUTVvekhU?=
 =?utf-8?B?djFPRWxZck9QbHVOTEk3YXM3RG5ONWpoRUQrV3VHcVpOVzNMOWZSNXV5R0h0?=
 =?utf-8?B?Y25Dc1BMbHhNcFFPb0tIcXh3a0FzUmtrRHdRSTQ2OTdTdzlpL0hFb3hEb0lo?=
 =?utf-8?B?VHRpVklEUFFaa005b3VIbmZJU0xvVEVGY21yNlNnUHNDRTBUNC9zZ3pmWmJX?=
 =?utf-8?B?OGczQ2pzSWxVb1paNnNHWEpReE1HTlFFSms5Y25XZzhDbytQbVlOMDhqVnoz?=
 =?utf-8?B?ODgwSFNjWlI1a2c2b2NaOE12VXNpVVJoM0xWU3lBbnZZZ3V4cXF5SDdOcmFq?=
 =?utf-8?B?U0wwYUo2ZmJDTG1SK0w0RTRQSnlUdjZRR1B5WUNycFU1Nk1JMEphTmJqbWRn?=
 =?utf-8?B?ZjZDbmdTa2xkczRnaWFSaUZnMnJpREZlQitGTkk4bHJRL1dLMDMvZFAyQTY4?=
 =?utf-8?B?REg5VktnRlpzR1pCeGlvSWRmWVJORDZmL0c0SzBYTkx0RjFJc0VQSWJpQzhJ?=
 =?utf-8?B?dGpGMTh1MXFnQkFNdWpiUHBRVG1WTkpVR1NQZ1g5Ni9LK2FQdGZ1R2doa2Nt?=
 =?utf-8?B?TlFPdDZUQ1gzRDRYMmtGbE84YUJQVkJIWjJLazdtMVZQQVVkVXNqT2NTcnQ3?=
 =?utf-8?B?b0kwTStIdHBhR3hDOW9uazU0QURaZzhNWDNVTnMzeXhJL00zdzBzOEkzZ1FW?=
 =?utf-8?B?dXlEaFVFcmhtR3NDcWNkWjZtRFhYdHlmbG5YQ1psRTBDRnRoNVByVEl0NXcx?=
 =?utf-8?B?RDNHVnl3ZUhpNkdtS0t3cVpqR3B2M3JJR2J6QXpCb1RlTmZVNDJ5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8165255-62b0-41af-2a6a-08da3a69cca5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 14:05:30.5387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G71nxVHAJt8Td0/rig01Y+FY5og79/inQxUut3VT34q7BXYrjEkHnR/2SBAoY/Lm9rcQ2vN4HMWzIDrPO7HO0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3613
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGlhbiwgS2V2aW4gPGtl
dmluLnRpYW5AaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDE5LCAyMDIyIDg6MzUg
UE0NCj4gVG86IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IHhlbi0NCj4g
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IExlbmd5ZWwsIFRhbWFzIDx0YW1hcy5s
ZW5neWVsQGludGVsLmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ow0KPiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IEdyb3NzLCBKdXJnZW4NCj4gPGpncm9zc0Bz
dXNlLmNvbT47IENvb3BlciwgQW5kcmV3IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsNCj4g
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgQmV1bGljaCwgSmFuDQo+
IDxKQmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVm
YW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBBbGV4YW5kcnUgSXNh
aWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT47IFBldHJlDQo+IFBpcmNhbGFidSA8cHBpcmNh
bGFidUBiaXRkZWZlbmRlci5jb20+OyBQYXUgTW9ubsOpLCBSb2dlcg0KPiA8cm9nZXIucGF1QGNp
dHJpeC5jb20+OyBOYWthamltYSwgSnVuIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPg0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIIDMvM10geDg2L21vbml0b3I6IEFkZCBuZXcgbW9uaXRvciBldmVudCB0
byBjYXRjaCBhbGwNCj4gdm1leGl0cw0KPiANCj4gPiBGcm9tOiBUYW1hcyBLIExlbmd5ZWwgPHRh
bWFzQHRrbGVuZ3llbC5jb20+DQo+ID4gU2VudDogV2VkbmVzZGF5LCBNYXkgMTgsIDIwMjIgMTE6
MDIgUE0NCj4gPg0KPiA+IE9uIFRodSwgTWF5IDEyLCAyMDIyIGF0IDk6NDcgQU0gVGFtYXMgSyBM
ZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPg0KPiA+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IE9u
IFdlZCwgTWF5IDQsIDIwMjIgYXQgOToxMiBBTSBUYW1hcyBLIExlbmd5ZWwNCj4gPHRhbWFzQHRr
bGVuZ3llbC5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IE9uIFdlZCwgQXByIDI3
LCAyMDIyIGF0IDExOjUxIEFNIFRhbWFzIEsgTGVuZ3llbA0KPiA+ID4gPiA8dGFtYXMubGVuZ3ll
bEBpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQWRkIG1vbml0b3IgZXZl
bnQgdGhhdCBob29rcyB0aGUgdm1leGl0IGhhbmRsZXIgYWxsb3dpbmcgZm9yDQo+ID4gPiA+ID4g
Ym90aCBzeW5jDQo+ID4gYW5kDQo+ID4gPiA+ID4gYXN5bmMgbW9uaXRvcmluZyBvZiBldmVudHMu
IFdpdGggYXN5bmMgbW9uaXRvcmluZyBhbiBldmVudCBpcw0KPiA+ID4gPiA+IHBsYWNlZA0KPiA+
IG9uIHRoZQ0KPiA+ID4gPiA+IG1vbml0b3IgcmluZyBmb3IgZWFjaCBleGl0IGFuZCB0aGUgcmVz
dCBvZiB0aGUgdm1leGl0IGhhbmRsZXINCj4gPiA+ID4gPiByZXN1bWVzDQo+ID4gbm9ybWFsbHku
DQo+ID4gPiA+ID4gSWYgdGhlcmUgYXJlIGFkZGl0aW9uYWwgbW9uaXRvciBldmVudHMgY29uZmln
dXJlZCB0aG9zZSB3aWxsDQo+ID4gPiA+ID4gYWxzbyBwbGFjZQ0KPiA+IHRoZWlyDQo+ID4gPiA+
ID4gcmVzcGVjdGl2ZSBldmVudHMgb24gdGhlIG1vbml0b3IgcmluZy4NCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IFdpdGggdGhlIHN5bmMgdmVyc2lvbiBhbiBldmVudCBpcyBwbGFjZWQgb24gdGhlIG1v
bml0b3IgcmluZyBidXQNCj4gPiA+ID4gPiB0aGUNCj4gPiBoYW5kbGVyDQo+ID4gPiA+ID4gZG9l
cyBub3QgZ2V0IHJlc3VtZWQsIHRodXMgdGhlIHN5bmMgdmVyc2lvbiBpcyBvbmx5IHVzZWZ1bCB3
aGVuDQo+ID4gPiA+ID4gdGhlIFZNDQo+ID4gaXMgbm90DQo+ID4gPiA+ID4gZXhwZWN0ZWQgdG8g
cmVzdW1lIG5vcm1hbGx5IGFmdGVyIHRoZSB2bWV4aXQuIE91ciB1c2UtY2FzZSBpcw0KPiA+ID4g
PiA+IHByaW1hcmlseQ0KPiA+IHdpdGgNCj4gPiA+ID4gPiB0aGUgc3luYyB2ZXJzaW9uIHdpdGgg
Vk0gZm9ya3Mgd2hlcmUgdGhlIGZvcmsgZ2V0cyByZXNldCBhZnRlcg0KPiA+ID4gPiA+IHN5bmMN
Cj4gPiB2bWV4aXQNCj4gPiA+ID4gPiBldmVudCwgdGh1cyB0aGUgcmVzdCBvZiB0aGUgdm1leGl0
IGhhbmRsZXIgY2FuIGJlIHNhZmVseQ0KPiA+ID4gPiA+IHNraXBwZWQuIFRoaXMgaXMgdmVyeSB1
c2VmdWwgd2hlbiB3ZSB3YW50IHRvIGF2b2lkIFhlbiBjcmFzaGluZw0KPiA+ID4gPiA+IHRoZSBW
TSB1bmRlciBhbnkNCj4gPiBjaXJjdW1zdGFuY2UsDQo+ID4gPiA+ID4gZm9yIGV4YW1wbGUgZHVy
aW5nIGZ1enppbmcuIENvbGxlY3RpbmcgYWxsIHZtZXhpdCBpbmZvcm1hdGlvbg0KPiA+ID4gPiA+
IHJlZ2FyZGxlc3MNCj4gPiBvZg0KPiA+ID4gPiA+IHRoZSByb290IGNhdXNlIG1ha2VzIGl0IGVh
c2llciB0byByZWFzb24gYWJvdXQgdGhlIHN0YXRlIG9mIHRoZQ0KPiA+ID4gPiA+IFZNIG9uDQo+
ID4gdGhlDQo+ID4gPiA+ID4gbW9uaXRvciBzaWRlLCBoZW5jZSB3ZSBvcHQgdG8gcmVjZWl2ZSBh
bGwgZXZlbnRzLCBldmVuIGZvcg0KPiA+ID4gPiA+IGV4dGVybmFsDQo+ID4gaW50ZXJydXB0DQo+
ID4gPiA+ID4gYW5kIE5NSSBleGl0cyBhbmQgbGV0IHRoZSBtb25pdG9yIGFnZW50IGRlY2lkZSBo
b3cgdG8gcHJvY2VlZC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFRhbWFz
IEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+DQo+ID4gPiA+ID4gLS0tDQo+ID4g
PiA+ID4gdjU6IHdyYXAgdm1leGl0IGZpZWxkcyBpbiBhcmNoLnZteCBzdHJ1Y3R1cmVzIGluIHRo
ZSBwdWJsaWMNCj4gPiA+ID4gPiB2bV9ldmVudCBBQkkNCj4gPiA+ID4NCj4gPiA+ID4gUGF0Y2gg
cGluZy4gQ291bGQgYSB0b29sc3RhY2sgbWFpbnRhaW5lciBwbGVhc2UgdGFrZSBhIGxvb2sgYXQg
dGhpcz8NCj4gPiA+ID4gVGhlIGh5cGVydmlzb3Igc2lkZSBhbHJlYWR5IGhhcyBhIFJldmlld2Vk
LWJ5Lg0KPiA+ID4NCj4gPiA+IFBhdGNoIHBpbmcuDQo+ID4NCj4gPiBQYXRjaCBwaW5nLg0KPiA+
DQo+IA0KPiBJIGd1ZXNzIHdoYXQgeW91IHJlYWxseSBtaXNzZWQgaXMgYW4gYWNrIGZyb20gdG9v
c3RhY2sgbWFpbnRhaW5lciwgYnV0DQo+IGFueXdheToNCj4gDQo+IFJldmlld2VkLWJ5OiBLZXZp
biBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KVGhhbmtzLCB0aGUgcmV2aWV3IGlzIHN0
aWxsIGFwcHJlY2lhdGVkIQ0KVGFtYXMNCg==

