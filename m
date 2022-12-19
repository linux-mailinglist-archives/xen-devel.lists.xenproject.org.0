Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7AF65113C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 18:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466269.725145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7K1M-0005Zx-Aw; Mon, 19 Dec 2022 17:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466269.725145; Mon, 19 Dec 2022 17:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7K1M-0005X3-6M; Mon, 19 Dec 2022 17:33:48 +0000
Received: by outflank-mailman (input) for mailman id 466269;
 Mon, 19 Dec 2022 17:33:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8L4=4R=citrix.com=prvs=3457a6caf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p7K1K-0005Wx-VC
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 17:33:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 479c4251-7fc3-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 18:33:45 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Dec 2022 12:33:33 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5358.namprd03.prod.outlook.com (2603:10b6:208:1ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 17:33:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 17:33:30 +0000
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
X-Inumbo-ID: 479c4251-7fc3-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671471224;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=M2udN1iHpUKGLEqKiYaB+6HW4zJdU1K4NBC1oVZO8NA=;
  b=N8MiWus8XLGf+Ws5F9HE3qfK+3D8tkkEUaEDepv8yk5BXCq7ke9kTNUv
   RdJXyO/fn3LdMaLZ+WZej1PLdNFpGfFlYl1nmQPTba9AW7M8ge4b3Bh2T
   BYrDT9su2nxZD5NLW/Gp8TMIGg7XHIhpLWya5351V/mN8bv3kmV+t6WOM
   g=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 89530995
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:odLt/qpe2lqu9dr7iIxub560IX5eBmIlZBIvgKrLsJaIsI4StFCzt
 garIBmBPKqON2X2fdx3bduzoUgHupWBnIdhSgI5+yo8HnkbpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzihNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADEwSzCEoOHt+YCcZ/ZyoP8RDPuyDJxK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXop6Mx2AzCmwT/DjUXRwLmoPW/1HSVfOxSN
 VU20DUEkbQtoRnDot7VGkfQTGS/lhwBX9tdFcUq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/H8pKkjgxSJScxseJNZlfXwEDD0h
 jqM/C43guxKidZRjvvqu1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nRyERhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:9H/PH6FKO3TPOl9qpLqE1ceALOsnbusQ8zAX/mt6Q3VuA6ulfq
 eV8MjztCWatN91YhodcL+7VpVoLUm8yXcW2/hzAV7SZmnbUQKTRekJgLcKqAeQeREWmNQtsZ
 tIQuxTD8DxEEg/reuS2njfLz/4+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.96,257,1665460800"; 
   d="scan'208";a="89530995"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYlxiCFiL6LUjb/4ppWocwxYTQsQNWQhzy1TAY9QQ6WXbYayYZx2FqkQo9LhWJNoFVS0eKSgzdPb6nvN5/scEMLNYJ1jMQ/HwuFb+hY8JVMfvJpujoIy8qaGt37hbfC6ZCTVKeNMci0HSpYNthQbXKDe57sfCHFlPOwzUNrCNhGnqXlMzJO+/Sss29fjzx3BCWFz0Agq7lGoEVLZQd5U83GkRTNEgiz/RTPhQWKmtVq+itXaKdgOA8GuBwnctuPFiGYne62XZHZZMwhGxx8eokE6dWEQYitvw+CytsLFUReVh/IQqv0eldpYTQzkzGRC+wO5FOmvT7gbV2FSlTPrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2udN1iHpUKGLEqKiYaB+6HW4zJdU1K4NBC1oVZO8NA=;
 b=fb2Cmg9v/p8MGJPAg+kuseHHEPjT7b97f1CpDichr4Gl3zE/P/x5yMUgA3F3ZCw0fN7FhkEgsuJfIzRWAlxjHGwd00AVftfZsXW8XsGyPsXkLyTe7UKpYydg50uO+tdtb3kOcfSFiOtvpdFPdLIrmnO0VwtfHaaDBs/7Xh8GoMRWsf/O/J/sR8M73QsQYPuB+9TP/xLF+MyJN2WQkPmtPKPgeGGONFUDgnTiHQel6PkeErmB/3xwhY0THCb8n5mj15ax7zM0+7vmhS128e3nNT1Xbd/jtePINtLGEZJCucDBqhiQvUvIvLk2Q8dR+i4pf1KuvLX0YumLS2qRwhiaZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2udN1iHpUKGLEqKiYaB+6HW4zJdU1K4NBC1oVZO8NA=;
 b=P3sVS7RVYxKv7JH62Los6QKXJatAarfwIIJtz8z++/KX1xQdMLuTT6T9RYxTYbTJr0IA1heVFaIcchoCSHtRGZG7Po3RjByhjtiaLVCJmNgeiCALJ0+NRXAR4sYdgLBSjdZa0vCOKSe9HMgDrFnsdc0LHrTjOiQ27xKNyEKtktQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/3] x86/ucode: load microcode earlier on boot CPU
Thread-Topic: [PATCH v2 3/3] x86/ucode: load microcode earlier on boot CPU
Thread-Index: AQHZE7iZ8bzRRxQprkqqSa5cEoE/Mq51bpuAgAAJ94A=
Date: Mon, 19 Dec 2022 17:33:30 +0000
Message-ID: <8c71f078-2f09-35a1-3ba4-37aaa4631d01@citrix.com>
References: <20221219144533.19836-1-sergey.dyasli@citrix.com>
 <20221219144533.19836-4-sergey.dyasli@citrix.com>
 <78f8b94f-7a60-8739-cd3b-e2ce28ca9e3d@xen.org>
In-Reply-To: <78f8b94f-7a60-8739-cd3b-e2ce28ca9e3d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5358:EE_
x-ms-office365-filtering-correlation-id: d0be4691-f187-4a18-e238-08dae1e7254d
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8FmCfkfTjHb4gPCVQC+9IW7Wb+38C+Uskjc+Nofm2j9Tm9NFThmlUew38fTCOH/yMx7Ks6zVHJLbx8/dXRJug/b3gZYcR1/39/UWeTT3j5pe3kQZN1YjPsAmnyGdr08gH1By1FPeWwTnabudLtbNRwPj2dnWPj2WXFZ7Qbmj2AKm5yefYt4Uhv3/NGOtXfBTkZdW3T8Hmokt+vbfTlewA9PdXJFYDDpGmtAVDHEG562gTGOWHHUNv7/sn5ThMVcVd/ZOslVh3xLrB4uY29Z8ecCmz+4IQlrq8RHogeQ19TiAwQIXpDjfNWFC/U4Vn0fU7ymtvV0zxhffK1OED+Dj4/oklbvbTnqyrLNXTjLN4cYrOK6FNEp582mc16liUp74uyuAt8lgvtuUZ/nIjdypS177WeqlDFLMHTvfxuEUbV4nMikzkV4wZWQRXZfK2qmNOoFZHrZFeQg9p184Fni6iusJ5HcevEcDI00bOuwsDn/4y2fElSEo/7WMGcOwrGOm1LV804B11rb6mEERYNiNdKBpuKo+G0QvVEmD7zAH1fI888+eVEWV/W9umZgft6sxmy+cVXjSwucbsq4njT3Emk8CyIvohVTdMVqwvBdw8xoiv+a5UviRz1tVc13Py1wy1lmwYmHd9nfLutlSIZlpHEMnTV8Y+1tQDGW32kipCmNGe/eGTGFmDIZdovt/V2Cmf3Zz85932DXGuGjhVhbR25e2lTO9HdPCn5xldlxyMqDQDpWoxqEtm4GmHyFlrjRo5Dg9K9mUvGmWqgaKB7D0tw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199015)(66946007)(91956017)(86362001)(66476007)(76116006)(66446008)(64756008)(31696002)(4326008)(8676002)(316002)(66556008)(5660300002)(36756003)(8936002)(2616005)(41300700001)(6506007)(6512007)(53546011)(186003)(26005)(71200400001)(38070700005)(83380400001)(122000001)(54906003)(38100700002)(82960400001)(6486002)(110136005)(478600001)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFJzdDlOMmVRelpNTEwvZmJ5eXNxazJLaXA0b0hxVVhuZDlXa0dxVWFrOTRh?=
 =?utf-8?B?K0xFU0dwL3ZScUZPY1R5R1VGekdsTkNrZ3FaZzJ0TEdSK0J2bWxpaFZIYXoz?=
 =?utf-8?B?ejFWVCtTTzhNMlVhSkg5Q0FvTWpXTFdqekNPMDJRUUw5T3lBQ3hDTmo3dSsy?=
 =?utf-8?B?MUJmaGhXaTVZOWJTdE96UFE3UGZIYXhTdEZIcHlKU2VDVmt4a2NDUGFwMGZ2?=
 =?utf-8?B?NjZYRHR6T1pFVTVzRGNHMUN5L2NGQzRTSkRNZ0VDRUxZeEZUS3A4Vm5yQzM5?=
 =?utf-8?B?ZE5ISk85VnZOU2grQktvWGRXaTlnV1dLdlZSc3U4T1JsVUdZeVNUK1J0bGZy?=
 =?utf-8?B?YkR3YUp3M0J3Nkp0K2VwT3VyNWVrSld6V2pkazZZWUZ1M3NHN2VyVEc3aG1i?=
 =?utf-8?B?UXJIUWlwQU5tQW5ndU44YW5GK3gzWGFDc1VoOWpsSnNYaHFkemhCSDFYcTV4?=
 =?utf-8?B?MDZxdEpNanFyZVBhSTFTc01qSERnK3MwNG1DOS9oMm03QXdUekhqTWZCSzFy?=
 =?utf-8?B?b1I0YVlFVHJRQm5sSlpXa0VyaktmcFptMGwyOU9hNnU3eXlOcmhjcjBEUk96?=
 =?utf-8?B?NEMzM2xuTytXK1RyVCtMYStVbUlHZlYvbXhxbEMxVG8vdlhxOU85SDBlUUlt?=
 =?utf-8?B?WnpXL1hwTjBtbTRtcmZBdkNLdmN6K09mNTFvOE11aHlTa3VXNFhnSkhWKzY1?=
 =?utf-8?B?ZG5sWmdNWGMydERkYWQvM0ZoRlhOY0lsSEFxSUxLR3NCM2hZTVR1eERvZEUx?=
 =?utf-8?B?bkM2Z2IvZ0JWbllVU3Yyc2M3ckRtN2xDekl6NTZZclVFVTRrY1gzRlYvT0Ro?=
 =?utf-8?B?ZGVjRGFVRWE5ZUNGVUMwM3hNS2E2R0diZ1Mra0pDQTJZWW9ONjdHbzRGdUxz?=
 =?utf-8?B?N0ZWNEJhZG9BUUdQMHE2TmFXVTN4cXJBZHBqMWNYbnFCZlhNRW8xMnFHSy9N?=
 =?utf-8?B?SFdSaUQyQWFPZDgzb081bUFWVHBuVFkvSUtjVWV2djlmN2IxNWpjaHNmcytV?=
 =?utf-8?B?QzJZajA2SFFYejNzTVNrbHU3UnVHeTIzSHAzTDN0MHdxWUk2aUZsOGJ4ZWFP?=
 =?utf-8?B?MlJFUVJWOVpla0xON0tDQTdCMFFqS0w1VjF5bjh4UFVQdUdkUzJsd3BZbG55?=
 =?utf-8?B?dFlhTWVtamxBS3IySVQyMjZ1V01BaVBLbFkvOGFWR2E2eTI5T1RSZlRILzRs?=
 =?utf-8?B?eWx4UHhxS1FkTmhRdWl4YXo4OUw5Vlk3TE1NMHoxNkpzVzQyb2FxSHZLS0ZM?=
 =?utf-8?B?OElNRDhXY3EzR0ZpRHB3emlGMUtDVXEwc213cy9nRVJRMUtYaTJwd3pnK29L?=
 =?utf-8?B?TGF6OThqOFlqRmZuekMrZVZIL1IzbUR2ODgrd29BR1YyL2hDcWh3RHZPanE0?=
 =?utf-8?B?MVNwR3R5OUI2WXhmTXlyVzBweFlvK0hKZFZ2TjVEV1U1cHUxZ1JHUGlMa00r?=
 =?utf-8?B?RGhtaUhFcDNyd243ZjcvTUtvUjlSMzBEb0xZVWRrVnhqemorRndwb2J0WTF3?=
 =?utf-8?B?UUp5U2RFNXFRcUowM2taQXMwdTVFZVRwNkdVcjhrNko0Rm5qN0tPOGJ2S21K?=
 =?utf-8?B?OFhPeWZJQVBUUlRsM2pmSVBUbi9SM2FJYjlGRXkrLzZKb3AxcHdlVkFTejR6?=
 =?utf-8?B?UHE1a003YXh6UXczeGxiSU1kOUh1YTFYYWVSZW96TjZhZUMzSFNHOGw4K0xr?=
 =?utf-8?B?b2p2U29tWVRXZkVPZXlESnFOamI0enBmWjNOWUx3Z2dvRjRIMW80UU9HUTU0?=
 =?utf-8?B?TEcvajJwZC9QeCs0MVNTUkcxdHpjZkR0dHRWVDJPZXRuZHVUcFVaZWRHTUxz?=
 =?utf-8?B?RGhUVWx2NGpxRk0yVkZWTzJra01nRjVLSi9yVnFRVUVoSmxORlJjYm9yb3BB?=
 =?utf-8?B?NU9zQW56aERsbmpmT0ZkYmpLS2dvWUFLUjF5YU1sRUNFV0d1aStlR0pob1A3?=
 =?utf-8?B?S3BhcER0MmJ2VUVWZDZpa3NpOEV5SVVXeUx2dlVuQWZVY3FLeEZCV2lCbWRW?=
 =?utf-8?B?U3JaTFpINFM5dHN6T0VsQVNnM09QaGZOZXZ5dEY4eGRKRFlVZWZBWE52Qm5a?=
 =?utf-8?B?b2N0UGVKSStJNzhvQnJ2SDJva0xzWFVvQ2ltUDN2TDJWQW40SElPTXc3T2pl?=
 =?utf-8?Q?VPhxP379U7aDjLuD3lgiX+oR2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78245C9EAA1D4B4EAD1A428C732DF0CE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0be4691-f187-4a18-e238-08dae1e7254d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 17:33:30.5746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q8VbglnrbBLu3bIGHbZ500pfCvT9jcxH2vd9hXzNtvGls/emA+RQEwc4rDI7ZlZiK7lMQOj5laj7V2/Yo94PA+ZghL/CEbyOj7AMelK+Jhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5358

T24gMTkvMTIvMjAyMiA0OjU3IHBtLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIFNlcmdleSwN
Cj4NCj4gT24gMTkvMTIvMjAyMiAxNDo0NSwgU2VyZ2V5IER5YXNsaSB3cm90ZToNCj4+IENhbGwg
ZWFybHlfbWljcm9jb2RlX2luaXQoKSBzdHJhaWdodCBhZnRlciBtdWx0aWJvb3QgbW9kdWxlcyBi
ZWNvbWUNCj4+IGFjY2Vzc2libGUuIE1vZGlmeSBpdCB0byBsb2FkIHRoZSB1Y29kZSBkaXJlY3Rs
eSBmcm9tIHRoZSBibG9iIGJ5cGFzc2luZw0KPj4gcG9wdWxhdGluZyBtaWNyb2NvZGVfY2FjaGUg
YmVjYXVzZSB4bWFsbG9jIGlzIHN0aWxsIG5vdCBhdmFpbGFibGUgYXQNCj4+IHRoYXQgcG9pbnQg
ZHVyaW5nIFhlbiBib290Lg0KPj4NCj4+IEludHJvZHVjZSBlYXJseV9taWNyb2NvZGVfaW5pdF9j
YWNoZSgpIGZvciBwb3B1bGF0aW5nIG1pY3JvY29kZV9jYWNoZS4NCj4+IEl0IG5lZWRzIHRvIHJl
c2NhbiB0aGUgbW9kdWxlcyBpbiBvcmRlciB0byBmaW5kIHRoZSBuZXcgdmlydHVhbCBhZGRyZXNz
DQo+PiBvZiB0aGUgdWNvZGUgYmxvYiBiZWNhdXNlIGl0IGNoYW5nZXMgZHVyaW5nIHRoZSBib290
IHByb2Nlc3MsIGUuZy4NCj4+IGZyb20gMHgwMDAwMDAwMDAxMDgwMmZjIHRvIDB4ZmZmZjgzMjA0
ZGFjNTJmYy4NCj4+DQo+PiBXaGlsZSBhdCBpdCwgZHJvcCBhbHRlcm5hdGl2ZV92Y2FsbCgpIGZy
b20gZWFybHlfbWljcm9jb2RlX2luaXQoKSBzaW5jZQ0KPj4gaXQncyBub3QgdXNlZnVsIGluIGFu
IF9faW5pdCBmdWN0aW9uLg0KPg0KPiBDYW4geW91IGV4cGxhaW4gaW4gdGhlIGNvbW1pdCBtZXNz
YWdlIHdoeSB5b3UgbmVlZCB0byBsb2FkIHRoZQ0KPiBtaWNyb2NvZGUgZWFybHk/IEUuZy4gaXMg
aXQgYSBuaWNlIGZlYXR1cmUgdG8gaGF2ZSBvciBhIHJlYWwgaXNzdWU/DQo+DQo+IElmIHRoZSBs
YXR0ZXIsIHRoZW4gSSB0aGluayB3ZSB3aWxsIG5lZWQgdG8gY29uc2lkZXIgdGhlIHBhdGNoZXMg
Zm9yDQo+IGJhY2twb3J0Lg0KDQpNaWNyb2NvZGUgbG9hZGluZyBzaG91bGQgYmUgYXMgZWFybHkg
YXMgcG9zc2libGUuwqAgTGludXggZG9lcyBpdCBldmVuDQpiZWZvcmUgc2V0dGluZyB1cCB0aGUg
Y29uc29sZSAod2hpY2ggaXMgYSBiaXQgdG9vIGVhcmx5IElNTykuDQoNClhlbiBjdXJyZW50bHkg
bG9hZHMgbWljcm9jb2RlIGhhbGYgd2F5IHRocm91Z2ggQlNQIGJvb3QsIGJlY2F1c2UgdGhlcmUn
cw0KYSBpbmFwcHJvcHJpYXRlIGRlcGVuZGVuY3kgb24gbmVlZGluZyB4bWFsbG9jKCkuwqAgVGhp
cyBpcyB3aGF0IFNlcmdleSBpcw0KYWRkcmVzc2luZyB3aXRoIHRoaXMgc2VyaWVzLg0KDQpJJ20g
d29ya2luZyBvbiBhZGRyZXNzaW5nIHRoZSBUT0RPIGluIHRoZSBwZW51bHRpbWF0ZSBodW5rIG9m
IHRoaXMgcGF0Y2gNCihyZXNvbHZpbmcgc29tZSBtYWpvciBhYnVzZSB3aXRoIHdpdGggdGhlIG11
bHRpYm9vdCBtb2R1bGUgc3RydWN0dXJlcyksDQp3aGljaCB3aWxsIGxldCB1cyBsb2FkIG1pY3Jv
Y29kZSBldmVuIGVhcmxpZXIuDQoNCkEgY29uc2VxdWVuY2Ugb2YgdGhpcyAocmVsYXRpdmVseSkg
bGF0ZSBsb2FkaW5nIGlzIHRoYXQgd2UndmUgZ290IGENCnRhbmdsZSBvZiBmZWF0dXJlIGVudW1l
cmF0aW9uIGxvZ2ljIHdoZXJlIGNwdV9oYXNfKiBkb2Vzbid0IGZ1bGx5IHdvcmsNCmJlZm9yZSB1
Y29kZSBsb2FkLCBhbmQgd2UndmUgZ290IGEgbG90IG9mIGFkLWhvYyBsb2dpYyB3aGljaCBpcyBm
cmFnaWxlLg0KDQoNClNvIG5vIC0gdGhlcmUncyBub3QgYSBzcGVjaWZpYyBidWcgZHJpdmluZyB0
aGlzLCBidXQgYSBsb3Qgb2YgY2xlYW51cA0KdGhhdCBJJ3ZlIGJlZW4gd2FudGluZyB0byBkbyBz
aW5jZSBiZWZvcmUgc3BlY3VsYXRpb24gY2FtZSBhbG9uZy4NCg0KfkFuZHJldw0K

