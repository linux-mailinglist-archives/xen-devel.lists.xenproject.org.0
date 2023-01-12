Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD037667BF3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 17:52:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476326.738433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG0o6-0000Zp-3p; Thu, 12 Jan 2023 16:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476326.738433; Thu, 12 Jan 2023 16:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG0o6-0000Wf-0A; Thu, 12 Jan 2023 16:52:02 +0000
Received: by outflank-mailman (input) for mailman id 476326;
 Thu, 12 Jan 2023 16:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0PO=5J=citrix.com=prvs=369126fba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pG0o4-0000WZ-Lo
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 16:52:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c248aa2-9299-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 17:51:57 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jan 2023 11:51:54 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS0PR03MB7226.namprd03.prod.outlook.com (2603:10b6:8:124::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 16:51:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 16:51:51 +0000
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
X-Inumbo-ID: 6c248aa2-9299-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673542317;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GmFi/8tIrTuLpufoIdU6VzhCivSlsrwgl0zjfNXw22A=;
  b=eLqsoPMquv32WOnG2vp+jeSdw77ntERzrNzqgQsl++n0g4D5U3Ipq628
   neHRnO/lhejaG6L1C9DULEffX9D0wSHY24na79Glo1rk/9Uj/uOCUXesB
   cqkokP+MUqelnziiWUTlDWPD1/sRJ9BiLmlcfYlSQ8LuzJ5uio8nMgAQD
   I=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 92386469
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:x1udWqkMkoXWRaVTuYQDV4ro5gy5J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeWmDUaKqOZWH0fNh3at++/U1Vv5DUn9Y1Twc5qyk9FSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5QWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 c5fEStRMDysvvLsypSbafFI2fwTfda+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDTuboqKI00TV/wEQCJTQzcgfj4sKgg1+/WfxzM
 mE1wgwh+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3Oc1SCIr0
 BmVntrvLT1prLCRD3ma89+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65uAZAhn1y
 jGO6SI417MaiJdS073hpA6WxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTXKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:BN6EqqNXqzyzT8BcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.97,211,1669093200"; 
   d="scan'208";a="92386469"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6lknO3R0S0CPZRGRNpqBK9JXyCGZAgRgUtkr0N/98AQ6FwFOwT5dGwrSMmcFlmyvV3RBxIbtcqDIZhinNQfjsjxO5/XUI7hCA4f5IdS9A0arg3yfGkDg8phTYFG8PuGDa+b0gPJVXgTI5Hqcxz2Vokn1RDxJP3M1jpqhkxYu1is0V/V/IQ9HmoZWRYdkCnJO167I5P1angXOV62m0ZrHhsSweoiU5ERcrKAP6N0YUVQDf44ndG813AvOB1GxMB54osei5vL6gaBFoIfFtpMJa93XCbMe3c1xEXALQKHD1+N+gFUNwgn1hFrzD+Wrl/1QBx4MxcrNdyxt6ZCrD3syw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmFi/8tIrTuLpufoIdU6VzhCivSlsrwgl0zjfNXw22A=;
 b=NtkRN1Ch/LhFVf6ozWbaVMHDcV4J7M/Ll+prlUqPARlvw+Kbttpe7DZtaV3ZH1OuH2QDbiJ2H3jPoZHW96ZkP2ITpM28mVz0yuyOV4XpVQJM4678s2wp1dc3vMOhFliZCu/cslb0i3KZezAS2AaQbnLbwMS9eWO9PhMV5Rg6dAoIiuhxo6v/WY3K7flb0v2cdPz0iNMqetcR2MIm4BaIcmeeHpocJ7D+y8MBZLwboCzNVt9b+eIp7SIXxZ91QzORK/onkopQuY+C6Lj2ykmO8Shff5NfjO1EoAGp2sJVw7weTMqM5Mp1v3aHMybBx6ic8Iv1Mty1H5UBhmGicsHmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmFi/8tIrTuLpufoIdU6VzhCivSlsrwgl0zjfNXw22A=;
 b=Smbl9zC9Pks+qJFJTZrGsD2tl4JRcn3X2hV76LwrL6Mw8969Lw1hq450py5JE+s4vJUo6U3lp7Rnpz/8dwKR8Wb1YmZt5bCRYWKXq4qKeY8y39TzcjgAqIc7dlPqsiBvtAU2Sb8xCdjP0C9d6CeXBBa0mMrw94r7W/r1d3TOJ+s=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/8] x86/hvm: Context switch MSR_PKRS
Thread-Topic: [PATCH v2 5/8] x86/hvm: Context switch MSR_PKRS
Thread-Index: AQHZJRefeExwWeppzE65VXS63DgRAq6axG6AgAA9twA=
Date: Thu, 12 Jan 2023 16:51:51 +0000
Message-ID: <3ac6a4d6-44db-d248-4440-6e71aa14ad93@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-6-andrew.cooper3@citrix.com>
 <af2b74b2-8f37-223c-b830-c2bb3bc6d467@suse.com>
In-Reply-To: <af2b74b2-8f37-223c-b830-c2bb3bc6d467@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS0PR03MB7226:EE_
x-ms-office365-filtering-correlation-id: 1c4ba72c-4215-4673-a710-08daf4bd4daa
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 o6VQOUNFCRCLZQxUUIrgc/g5vrVEPoPRfRqwJv3uG/FoFxZ2RgaqrRdGVi4U4MRsoITL0N9Kf9qBI8Dmcs8d7P+D+ORCqF2EOzOymhedzfd920ZWvN2bszCc009b5XXQFqtUanCAl+qgNy8MMe/xhe9PJeS+QfZtPcJYfMkF1D9gASh33rZQ4XjJwfq9UAx4CO4PyD3rbVrYZy6WumbEU//uNSEJkUdiHBs87TiCWGX86FFuH7LMRvsvW1v53VtAkwz+i1VJd8uCdhbm5uk5DMSKxDjohGjo5tSbiPgEhQ9nbhFJoKglF3bfqt/GepCgwKE8kl7M3OXtIzf/RIeibJ8wjGOjGfrxRqs2irstJLPAZmqhFUdwBqUvjtdAF74rs1odvltalx5JZmweQefzIGpP33GDfYi6gOkSD9YNi6ZjV7l30Hyjonk+KAi4sN7NTJhsqUpZyxFGRvkvQipmDvLQEG457UP735sY4YYhA2wMJN69503ulaJIvSyJaO2GrjEaCaVVCOLPZfqaXHtTXQUG6+nRLSBtEQgIt3lgiJCj5SWKoI9xXaIGylqSZ5eISOa6WZiXkG5mIegbzKH4z8TaO1gsP0Szytw4vVJSbe9uQFYcZSBvqejUh4HVrIOrZ538uG5Y/99xWfFrFowY9jRrgcYtvBjU37MCUO3lBZ1zpwL2fJ1VFgfebApg2OtVeHU++LNjhBmSAIiRjtAKqzOX2sSe3gDM6gANfntK3+xePh015lXhLHmvqspZC9I3IwCXdWN7QgW2XD/kr7DWhQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199015)(6916009)(66476007)(76116006)(4326008)(64756008)(66446008)(66946007)(66556008)(8676002)(31696002)(8936002)(36756003)(41300700001)(5660300002)(478600001)(6486002)(83380400001)(26005)(186003)(6512007)(6506007)(91956017)(2616005)(53546011)(316002)(86362001)(54906003)(71200400001)(38070700005)(82960400001)(38100700002)(2906002)(122000001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0pPRUJFQ2s2NGVLOHVYcW9USUJNWllWYnpPSE0yR2VjUzVOUHpuYnBCZVlJ?=
 =?utf-8?B?NEU0eWtNaFllZnJxaWlvRmZXcWl4NnRremNoZ0tiNWVOaytlRjYrYjRucGgv?=
 =?utf-8?B?dGlveWFqeFU1a1FKUnFwK3k4QXJEeFkxb0dEalFrRVgxVzVhbU80QXdUeXFv?=
 =?utf-8?B?WDdBUW5EK1FWcnIxR013Zm15N0dhMDZ0QytzN3puT3kyZkxzQWhPR3QzQnNn?=
 =?utf-8?B?VHZEeW04a3ZQOFY1SS80Mk1DYk5EdVN3SnNJT25jeHEzN0RJU0loRmYwZERa?=
 =?utf-8?B?US9qcDJ2WnlOZXZWTld5NUJTK1ZUSEJIRWhDNmFsOVFJa1dTa0lRSlNpdGow?=
 =?utf-8?B?cGFVbXBCMmtDWFJuS0VIMWVOVVJNUlN3NVZRdklhZ1gyNlFRWjF0cWJXSCt1?=
 =?utf-8?B?RFdEa0FiTVo5ZUpqMEM5QzNwdEJjQ083ZmY5NFJVN1ZFYktaK2xXZ2NoNE9S?=
 =?utf-8?B?empJZkVPMlJRdzlVWVEwMVBnb0s4UVVMV05IbEt3NjE0UktjR0VrYkNZWUZp?=
 =?utf-8?B?Wjd6NUYrOXFHUUhtbE5ZQ0hNQnc1NmZ2Uk8rM1ZkSWZOV2FnSzJESmRRNlUr?=
 =?utf-8?B?RHpoZjBmd2FuaW5MVXBobkxRemY5cVlCQ3Z1U29XcjFtY3hBelB5d1dubXNh?=
 =?utf-8?B?RHlDL1MyRjBEM1ZpSUd5YXlZNSs5eUR0eExOU1JveHFxc01Fbk8yaUdkK0Vr?=
 =?utf-8?B?MDUwelBuMlc2VWQxOGZVK3VTUUlxQS8wYzhBZ3o2c0VNbEh5SnBiMms3SVRt?=
 =?utf-8?B?ejh3T1Bpa0N2QVprSnJ0NEZ0UDlraytQZFJwYTdqbTNNZTJwcUN1ZHRWb0Er?=
 =?utf-8?B?RFZKTmw5aDdCdnpZRzJRak1lUTRsRHFSeEFBWWR3d2VFMTc5aldEQ0FZZVQv?=
 =?utf-8?B?c0l1QlcrYVJtQ1JkUWdMQ0FMci9YY0o5OS9oa3BtWDZQRnRiWXU4RnR3Zk8r?=
 =?utf-8?B?dlZPT056OEtlYWh2TWVMUHZkblZjUDljODVvQnk4aVBKNkoxbUZReU1rZkFP?=
 =?utf-8?B?eHZMWEoycy9PSnVWbHI0SlhZWUNUaVhhMkN3amZJeFlod3BsRVRBRjJ0N1FP?=
 =?utf-8?B?Mk5yNWpiWHJUU2pzK21qQ0F3QVFoTng3RkZUYjFwQnpPRlY4MEdMVmMxV0ta?=
 =?utf-8?B?Q0NudHoydER4bmRleGYyOUJzSzFpbm5TZmFiMEVkTkJoVnZBNDJRMWhZWlZD?=
 =?utf-8?B?aElJQUlQcUNzNVZBTlJ2Qm0xVmJ2alNaVjdLbjdndE1ZNndCZGw1ZHhDTEtB?=
 =?utf-8?B?TlRVdC8xUG13MEJMNEJkQk9DNzFvQnNPVUpDY2VHUzdIbEhkc3FVcmFHUm5u?=
 =?utf-8?B?RGk3eXY3eHBBOVF1LysvOEZXWFlWQk5YZ1JwRG84ZmIyeGxZc0d1aFNBTXhJ?=
 =?utf-8?B?Z3p0RlhDY0pvOE1JSWhxdWE4cnFjR1dweWtxYjFqMmFoWmpWNktEMGtKdS9R?=
 =?utf-8?B?UytjYXFiclFjaUt2THFzYUZBSjluYWZ1b2Z2SkM4Rkw4aGpmcDNzUHQydXFq?=
 =?utf-8?B?Y2xBQkRtNXBHbFkxSk1HQnBIRTRFNnNySGpPb0toUmlISGsra1dxOUlyaStN?=
 =?utf-8?B?YTVsaElMVkVJeWl4blgrV3EwMTlGL21udGdXdWtKdDM5ODlMZm1BdlY4ZnU4?=
 =?utf-8?B?Rm5Tdk0zWWN6ZzduMzZWaW5BMDU3VW1pTktQMTdmRkJZRDVuVVI5V0Q3QkZD?=
 =?utf-8?B?WUFDdVdBMUZFeThMOGFaSDRnWVpNZ29JU05PRXlxL21raytDbkQ4YllUVmt1?=
 =?utf-8?B?SHFXUGw2TUdpaFlSRWphblZTcWxjbnpNdXIwbEd2UnVSdXhiTFlzQ2NsR2s1?=
 =?utf-8?B?RGVLNmtseUNUR3dDYlVqTVozR2p3MzdiWVNWdVFQRU9CMENFVzBxRUtBcnlP?=
 =?utf-8?B?d0w0bjRYOS9UVXBLcXVHeVR3VkdRYkVTNWZkWFBTQjVIaVRSUTNNUUtIUDZs?=
 =?utf-8?B?WHNlSFZGRnkvNGxJOW9QM2ZOUmpJNVZIbTFRV3JLU2FoZ0VtNUlIOGt1dEFZ?=
 =?utf-8?B?ek00bmsvSjZZUHJvVXEvM1pPaWphMU02djI4RlQyc2NTZHNja1dtRGZpRU1o?=
 =?utf-8?B?L1dDMnEvL09tdFR3dVN5OHUrNHl1OTh2YzZaeis1NTBveTNnMGxYd1NYbjlP?=
 =?utf-8?B?dlhSelA2V0tZRFZMZytwdFF3TnpJWVhvTG03ZWFRWk5LLzFrTnh1djdRQnFn?=
 =?utf-8?B?TEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F860553EB376E94F92F6D69BCBA2E5CE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jKN08GRVUHqjfRjuR597wb4oDyZjM55V0gBN1ff7oSGtq2fkX+rJyPAnU/JBZqcmo9FUMTkfOUTj4hKIWgrfDIUEUBzl8b2ymVvstAHzqFdmJT9hq5aNiY2gjROgOfFfdQ5lOtXMbVrFS8ogJkS04NIPSEADR65jZ5hikFwJtNCyA/UBH4ORv6WOeN/P69ALvyTpjMeeNZNZD40zFP5gFdkyE3wBg7wSOn9OVWn1pWbyEu2XEltAZWQl1AuYmU8AkFyLNky8FJs7thAtv/ljTkmiVwZQcxbNFhkgruIIBlJ3ny1ybLrgIrvF3g56m4VU1MVMeVh5tPa4uX8KPkJ9vpFPb4nJT68XkpfH2293tLPrq/NjKH/85mpncoyT+8ItrDhiX5Mu/YdITzoKf28J7QaUXYaDp7cHT3AX49/u/HPvt8tMT9OoT36jISyICbC1xl5KKytg8f9JsZF058LYMELWdljGS35RD8mky0vTNeQQP+D77+zuo4iJB/3Do5KlBuCtZ452INl2/HSQ46nxrkXWFLLZU3RLLyvcKUPCqDLHf9zFLFn5ODLKWjpfZIjxEFDqMzGiY5dSL44dZrbC1tjjXUasL+AOgPZFKFlAGV1peQdfOUU5dd4Y29B42cPyEotTOL/0yAs7khcdWPBXQcGQVa4+ozGEkbWfUNPvfLEcIIkZejoHEt6UC3Ct4hnMPX8WID2TLfLmZ7VWb4pz1U0EXgiglsbOels1bYQ5lJGsfKOo75Sr3+uMTjwUNucSqL1uyWVKdKiKJuTmwTKcFvMry/FpJRSu8ibf55QkV107Lof+Mpzle8LwWXxDcR8YBGmXzJ2fSlFHfpz37wRU5YEMXkZaERqut/oKsdWp8J4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4ba72c-4215-4673-a710-08daf4bd4daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 16:51:51.5059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: suBcyvBShP+hk106jepOHOdKwKuh6rvOnv1/51pGvlWNawwWUhLsIjY+lMZfJ8QfTJfNTdpY8qPX9MA3Un+1vsthJWsHfSnu2vhcaBChTo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7226

T24gMTIvMDEvMjAyMyAxOjEwIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTAuMDEuMjAy
MyAxODoxOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgd3Jw
a3JzKHVpbnQzMl90IHBrcnMpDQo+PiArew0KPj4gKyAgICB1aW50MzJfdCAqdGhpc19wa3JzID0g
JnRoaXNfY3B1KHBrcnMpOw0KPj4gKw0KPj4gKyAgICBpZiAoICp0aGlzX3BrcnMgIT0gcGtycyAp
DQo+PiArICAgIHsNCj4+ICsgICAgICAgICp0aGlzX3BrcnMgPSBwa3JzOw0KPj4gKw0KPj4gKyAg
ICAgICAgd3Jtc3JfbnMoTVNSX1BLUlMsIHBrcnMsIDApOw0KPj4gKyAgICB9DQo+PiArfQ0KPj4g
Kw0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB3cnBrcnNfYW5kX2NhY2hlKHVpbnQzMl90IHBrcnMp
DQo+PiArew0KPj4gKyAgICB0aGlzX2NwdShwa3JzKSA9IHBrcnM7DQo+PiArICAgIHdybXNyX25z
KE1TUl9QS1JTLCBwa3JzLCAwKTsNCj4+ICt9DQo+IEp1c3QgdG8gY29uZmlybSAtIHRoZXJlJ3Mg
bm8gYW50aWNpcGF0aW9uIG9mIHVzZXMgb2YgdGhpcyBpbiBhc3luYw0KPiBjb250ZXh0cywgaS5l
LiB0aGVyZSdzIG5vIGNvbmNlcm4gYWJvdXQgdGhlIG9yZGVyaW5nIG9mIGNhY2hlIHZzIGhhcmR3
YXJlDQo+IHdyaXRlcz8NCg0KTm8uwqAgVGhlIG9ubHkgdGhpbmcgbW9kaWZ5aW5nIE1TUl9QS1JT
IGRvZXMgaXMgY2hhbmdlIGhvdyB0aGUgcGFnZXdhbGsNCndvcmtzIGZvciB0aGUgY3VycmVudCB0
aHJlYWQgKHNwZWNpZmljYWxseSwgdGhlIGRldGVybWluYXRpb24gb2YgQWNjZXNzDQpSaWdodHMp
LsKgIFRoZWlyIGlzIG5vIHJlbGV2YW5jZSBvdXRzaWRlIG9mIHRoZSBjb3JlLCBlc3BlY2lhbGx5
IGZvcg0KWGVuJ3MgbG9jYWwgY29weSBvZiB0aGUgcmVnaXN0ZXIgdmFsdWUuDQoNCldoYXQgV1JN
U1JOUyBkb2VzIGd1YXJhbnRlZSBpcyB0aGF0IG9sZGVyIGluc3RydWN0aW9ucyB3aWxsIGNvbXBs
ZXRlDQpiZWZvcmUgdGhlIE1TUiBnZXRzIHVwZGF0ZWQsIGFuZCB0aGF0IHN1YnNlcXVlbnQgaW5z
dHJ1Y3Rpb25zIHdvbid0DQpzdGFydCwgc28gV1JNU1JOUyBhY3RzICJhdG9taWNhbGx5IiB3aXRo
IHJlc3BlY3QgdG8gaW5zdHJ1Y3Rpb24gb3JkZXIuDQoNCkFsc28gcmVtZW1iZXIgdGhhdCBub3Qg
YWxsIFdSTVNScyBhcmUgc2VyaWFsaXNpbmcuwqAgZS5nLiB0aGUgWDJBUElDIE1TUnMNCmFyZSBl
eHBsaWNpdGx5IG5vdCwgYW5kIHRoaXMgaXMgYW4gb3ZlcnNpZ2h0IGluIHByYWN0aWNlIGZvcg0K
TVNSX1gyQVBJQ19JQ1IgYXQgbGVhc3QuDQoNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5j
DQo+PiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYw0KPj4gQEAgLTU0LDYgKzU0LDcgQEANCj4+
ICAjaW5jbHVkZSA8YXNtL3NwZWNfY3RybC5oPg0KPj4gICNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4N
Cj4+ICAjaW5jbHVkZSA8YXNtL21pY3JvY29kZS5oPg0KPj4gKyNpbmNsdWRlIDxhc20vcHJvdC1r
ZXkuaD4NCj4+ICAjaW5jbHVkZSA8YXNtL3B2L2RvbWFpbi5oPg0KPj4gIA0KPj4gIC8qIG9wdF9u
b3NtcDogSWYgdHJ1ZSwgc2Vjb25kYXJ5IHByb2Nlc3NvcnMgYXJlIGlnbm9yZWQuICovDQo+PiBA
QCAtMTgwNCw2ICsxODA1LDkgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5z
aWduZWQgbG9uZyBtYmlfcCkNCj4+ICAgICAgaWYgKCBvcHRfaW52cGNpZCAmJiBjcHVfaGFzX2lu
dnBjaWQgKQ0KPj4gICAgICAgICAgdXNlX2ludnBjaWQgPSB0cnVlOw0KPj4gIA0KPj4gKyAgICBp
ZiAoIGNwdV9oYXNfcGtzICkNCj4+ICsgICAgICAgIHdycGtyc19hbmRfY2FjaGUoMCk7IC8qIE11
c3QgYmUgYmVmb3JlIHNldHRpbmcgQ1I0LlBLUyAqLw0KPiBTYW1lIHF1ZXN0aW9uIGhlcmUgYXMg
Zm9yIFBLUlUgd3J0IHRoZSBCU1AgZHVyaW5nIFMzIHJlc3VtZS4NCg0KSSBoYWQgcmVhc29uZWQg
bm90LCBidXQgaXQgdHVybnMgb3V0IHRoYXQgSSdtIHdyb25nLg0KDQpJdCdzIGltcG9ydGFudCB0
byByZXNldCB0aGUgY2FjaGUgYmFjayB0byAwIGhlcmUuwqAgKEhhbmRsaW5nIFBLUlUgaXMNCmRp
ZmZlcmVudCAtIEknbGwgZm9sbG93IHVwIG9uIHRoZSBvdGhlciBlbWFpbC4uKQ0KDQp+QW5kcmV3
DQo=

