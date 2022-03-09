Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3AA4D3242
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 16:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287977.488345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRyg7-0005hi-Rd; Wed, 09 Mar 2022 15:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287977.488345; Wed, 09 Mar 2022 15:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRyg7-0005ec-Ny; Wed, 09 Mar 2022 15:56:43 +0000
Received: by outflank-mailman (input) for mailman id 287977;
 Wed, 09 Mar 2022 15:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvXa=TU=citrix.com=prvs=060bf0544=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nRyg6-0005eW-Pj
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 15:56:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81aa096e-9fc1-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 16:56:40 +0100 (CET)
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
X-Inumbo-ID: 81aa096e-9fc1-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646841400;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=n49CLlnGx1Eql7D+zfFAn81RE9wbOo6xdqNpSM7mI4U=;
  b=NSPGSNTOe2llADwOsaVoaVo/xW9ifTJKPSDqlbnGk5z03tKIMn3UkJbw
   KTPvQpctdgrEVhceMFrLTa8W6gzUyK85GYwNJFVOWx3bYKFZUAAriyIRa
   JWSgvI+z3/cVbST5u3A0kkDERKVBII1N+uyTshfeGSiTb/D2PVfiB38mF
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65306413
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OIPwLqhOkinivDxvZo9UCQo8X161mBAKZh0ujC45NGQN5FlHY01je
 htvCGqBPKqCZjSgKdlwYNjg9UMD7Z+BzdJlTFY9/y5mFygb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvc4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSowIrCWvedHahZ/TRAjMJBh4+XYB0Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklNpyzyfKP8iSJTKRaji7t5ExjYgwMtJGJ4yY
 uJHNGE3MkiZOHWjPH80Vq8Rktei10OvUGIGgQ+Ko4gR+TjcmVkZPL/Fb4OOJ43iqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntSHmXIMfEpWo+/gsh0ecrkQtDxkRWUq+sOOOoEe0UNJCK
 GQZ4iMr66M18SSDQtDjUjWirXWDvxpaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5lvaCRSHmd3qyJtj70Mi8QRUcAajUDVhAt+MT4rcc4iRenZslnOL64iJvyAz6Y/
 tyRhHFg3fNJ15dNjvjluwCc696xmnTXZiMs+hiNe2H/1wxeOr/4arGP8gLEy88Vee51UWK9l
 HQDnsGf6sUHApeMiDGBTY0xIV252xqWGGaC2AAyRvHN4xzooif+Jt4IvFmSMW80ap5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2voXkGia24hTmFfK0QfUcXY
 8nznSGEVypyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXSML9nsPnU/FmJr
 b6z0vdmLT0FAIUShQGNreYuwa0idyBnVfgaVeQMHgJ8HuaWMD54UKKAqV/QU4dkg75Uho/1E
 oKVASdlJK7ErSSfc22iMyk7AJu2BMoXhS9rbEQEYAfzs1B+MNnH0UvqX8ZuFVXR3Lc4lqAco
 jhsU5joP8mjvRycomVDN8ah9NI+HPlp7CrXVxeYjPEEV8cIbyTC+8P+fxup8y8LDyGtstA5r
 aHm3QTeKafvjSw7ZCoKQJpDF2+MgEU=
IronPort-HdrOrdr: A9a23:VIqMg6jBXAKUFR93I1YHGQqa4HBQX2113DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwRZVpQRvnhPtICRF4B8bvYOCUghrVEGgE1/qs/9SAIVyyygc578
 ldmsdFeaTN5DRB/KXHCUyDYqwdKbq8ge6VbIXlvg9QpGhRAskKhWYYNu/YKDwMeOAvP+tgKH
 P23Lsim9PUQwVwUi3NPAhjYwGsnayoqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+SemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aGSARcR4Z
 rxSiUbToFOAkDqDyWISNzWqk7dOQMVmj3fIJmj8D3eSILCNWsH4oF69P1km1PimjQdVZdHof
 l2NiuixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MQiFW5uYeE99RjBmcka+S
 hVfbThzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7z093YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf4IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTLYd0s8LAr23FUgMyOeFOwC1zydLkHqbrTn8ki
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65306413"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njteJXv6B+x81+B8VW0eUtx29Pj5aPMOonsS+Tecbt9X0G6vUTH52XMD6ixsB0SSd4tGDhKDEGUN7LBwdDovyBS41NbuOdUAYxKFP7q76P4Y0TpeMxHCXMtqB5aXmTPF/LSYlJedraq+3uF4k9U9WhlzBcO7oGN4Dtks+tRxmU/ypcOFsmEFzQeMyhpTtkgmAHBHyZTnryGTvXIvTlMvSjw3k2AeU9ehU89kgfg/nR53pxBsHHwaixb06aXJgjgfIwtVAzldP9ece6cDyo6UXUr7Sn2DJwpNBSMXxWnUgdZ5Gqh2Y6zsr1SsyS/ItCJjFvRIMM9lrpn8A+9La/2Mdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n49CLlnGx1Eql7D+zfFAn81RE9wbOo6xdqNpSM7mI4U=;
 b=QgFQ1F9p4Yq+sPkPFjTiBmXt5Yg7iWBxiUsBMkj0T0BHdZJ8kbdfehrDa1Eqd/ZCT63rWJIhlpNzMIa9yjOtyuRp7ywiNnfuEazmTTV/BpexIK2n5pDXUd7D1pQNX3cgnWrC7kWk1F0jo8eD+wMNGj6zFRJIXg8FM1xkIlI9X3+i6y2yoCk6y5lbUXE8tuH5hS3O20k60y+iM6wgCY0hLKEXOLDjAb/a2f+JTJ358yCAsvFZMzgPQsaxFEMg05hAc+NbPTUTXeML5XNtj/cre5fmgap6cO5OhmRuYHUC4wDLPV22kAhQiK9d+OTzKKVd6iPmPVc+HpvzGTas2sgM8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n49CLlnGx1Eql7D+zfFAn81RE9wbOo6xdqNpSM7mI4U=;
 b=FfIfZwI8WDZEBpYAcNHi3qV5kv/K5CsLTzKkHRb/B3tp/nZd3ugyYtCiB2jpOgAvp2ORmbzCuMcWarSTQ5XcKblH0NJtMUnoP3wTbi5cN0FwE946roM5/OtVwvoFuOupG1BSQRsGFT5ZTEGGl0ZCgurxKHiwotlrpo91MeSvjmM=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Roger Pau Monne" <roger.pau@citrix.com>
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYMjUEaMoAwzVpzE69n4F8Ciyydqy1XcmAgAAMr4CAAAJqgIAAIRgAgAAC1QCAAadGgA==
Date: Wed, 9 Mar 2022 15:56:35 +0000
Message-ID: <8ac6ad1f-de2d-be1b-3639-34effe85bd88@citrix.com>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
 <YidAU63TsVO/X1Q+@Air-de-Roger>
 <b633f92a-151f-c7ca-0d91-cfad8d2edcbe@suse.com>
 <YidM/Wu5lqF48zg2@Air-de-Roger>
 <81dc2758-accc-25a3-7b3c-d9988757dd0c@citrix.com>
 <6a0f4d8f-581d-20cc-07bc-ffbf9a04cfe0@suse.com>
In-Reply-To: <6a0f4d8f-581d-20cc-07bc-ffbf9a04cfe0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2602feac-98bb-462b-9bbc-08da01e56399
x-ms-traffictypediagnostic: MWHPR03MB2879:EE_
x-microsoft-antispam-prvs: <MWHPR03MB2879503A0B24893635CD143F810A9@MWHPR03MB2879.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bZrYeoflWUFrIAbHnNQr99Wi8Qnu7ZsI4F/CoC3f2pXlw8mPeVHyOW1yJHI8uCTRGBtBokwgl6pexsy603Yf512wyHXOwqaRnwRv9PjDNW4QOEWfXT+kWmXE1oLAsVi1YSNU4dhyYXVt4Nb0VVN8qliKSx72YPrC56PkUw6bzQhNI601/QgJsud8HImuLWda7a3trBtiVtjYItItf5ODYT207+0wJMVRbc3hzpYFUpwSnEY25sHcBjhiz+muD3iMclg7rjrxWi2CNOpAFzR7qf8E3rC5+r29O7lWaoq1HN67mgas/4z1FfZgS/pm2c6d2yxNtH47MSqU1x+vBMUx9E07L32lWhkzR4bHPZp6nZaL+QKSTgBX0EKgmPZZ0cOj65cBtSCABmbVbSQ2g3znY0Fv6umnDehNg/HapYfs/Ej9vSK+820R7Tm0+IzLtkRutABEhTjo0rufZe/+MrUI/dvEDOJFAJaOH5rXLfpgwBVt71Auozuyube84Oyul23baAV6f+kTEkmMXh3hJfP2mZnHhaD3+Iyt6uoU4yrEBAqwwykuJdHcZvvBugWo3yXA1mgaXlSwwDAqtVkA2k7ZTD4WDVE2Me1tXFQymWjpywYHiYhNQ+o8w9iIzeclT+s0aLmTtKECdWFKu+IFvL1H91VPbRgNDxEISlYI0+CQSsyVmQotg5icWDBb5MVT4xp6uc9GJng3d1UiWZPsowQHFtuRxuXTn/mYkb82k//7PMJtuBg/nAZ0QA8MkTCkvnJC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(122000001)(82960400001)(38070700005)(38100700002)(36756003)(54906003)(6916009)(66946007)(316002)(71200400001)(31686004)(66556008)(83380400001)(5660300002)(66446008)(6506007)(508600001)(53546011)(86362001)(8936002)(26005)(186003)(6512007)(107886003)(2906002)(31696002)(64756008)(91956017)(8676002)(66476007)(4326008)(76116006)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkVJbDA4SmRlQTd4NjRGQkVMWkd3aUh1cHREYWg0S2Nqc2kweW1jRXE4cXM3?=
 =?utf-8?B?NHF1Y2NVaFBPNUplSTFDMHI1YVN5SGp0eGJPa1JPWFpUQzJhc2VlVzk0Qm1G?=
 =?utf-8?B?ZzhKamQrQlVKVjhsMHJreUNkWThzdmFKbzVONmFocDRnbEYySW1jQkpWdXRX?=
 =?utf-8?B?eUQxQ0lvVEhRMVBoNUxrRTAvdWVKaGhXUENrdCtQYWtCM05NbTdTZDkxN1pt?=
 =?utf-8?B?V3dybmtmSWdHbDR5VU80a1lrMjMxdWJrY0pxZlhCRUExdE9rNmMrVHdKZXQr?=
 =?utf-8?B?Q1dOREpqK0k2WWxwaTUwSjlTbzJCWklIczZWQ3lzSjNLNEVzRjZhZUdYSUJi?=
 =?utf-8?B?clJPZlYzMk9VeGV6b25vMWd0bHFXSi9JRTAvR1BIZ0hxQzducXFadzFVbENr?=
 =?utf-8?B?Q0ovSWVUZ1V6eUZEUWtmOVNSQWJFNEN1cUVMUnVUTmhSbUUyTUdQMXc2dXpt?=
 =?utf-8?B?ZGN5Q0psLzhmNTgzOCtEV3RMcm5GeGNKSk1kYklGZ3NIOUkwOXNGbUV6TDdj?=
 =?utf-8?B?VDBkMDlaU21rZ2ZXRUY2ZmEyZTZ0cFQzWGVMVUlOdjduaXpmYXp5WTh4U3Q3?=
 =?utf-8?B?U0p1SUR0N2FhbW5LbGJJODd3b2lpMHBDbDkrQ2NNNmxmbC9ZRlhhUjBHQU9s?=
 =?utf-8?B?TFZiSjZKQUFZTWR6QlU4WFNzamRFVW5PUmJ5TjMzbElPdDVYdnY3VS9VMTcw?=
 =?utf-8?B?Z3ZhVWlaZmRkc1RYV1YyUmk5QXEvOCtMaWdvVkd3ekZDMEFJRllLdHp5RVZJ?=
 =?utf-8?B?alVPTUNLa2RYRHRhWWdha1ZUaHNuUlkvOXFPMzAwM05EZkhLR0sxWGFZdkEz?=
 =?utf-8?B?WWNGU2xQdWd4UzYrNnhSZFhoSjdteUpQWnVBb2loTjIwWG96UGFkQ3g0TU9l?=
 =?utf-8?B?b3E4Q2JIWE00aitaSSt6QUNNOHp1dVlRR1FEL1RBdlNYV3M3YlYxMUgveUpD?=
 =?utf-8?B?MHA0VngxKzZZWnhZcEthZ284ZlNHWWJGUmlxNS9tcEJSUElzajJpc1RCSFM5?=
 =?utf-8?B?YVdwSm5WbGQ3TWd1Ui9HTEhKOXV0dHJEbHpBczNCc1Irb2ZxeWZ2blIxTjk3?=
 =?utf-8?B?UmFobHVtL1BPSFZqblRBWllJT3dMQmx1TmhJNTNhbDJGVGt3eVQvYmY5WHRi?=
 =?utf-8?B?Rnhha0NjM0R3b084UmYrYWx3VG9MQTZQaHl3TS9ObXRDTVBydzBuZkljSVJr?=
 =?utf-8?B?MDBXOGtjeHVTQktab3hsRHc5T0J4YTBiazJJczVoZmNPbWt0a2IyRHYvaDBx?=
 =?utf-8?B?U3hZZllrM3A0ZHlvcnF3ZW42STRXR1Nad2g4UTNHeUoxbGl4elhOK0NubEJr?=
 =?utf-8?B?TEljZ0k0eGhZNTk5NXdoM3JxT0hjeWdzVWxuRlRYZFJHSjNBSEdVMkxYTmky?=
 =?utf-8?B?YXgrYWx1RkFSeFJJQmcrWlZDNStYdmRFa3VlZ1E4cGNSd0hSSWljQVBqM1ZS?=
 =?utf-8?B?ck41dWlFSkpSa3lJTWU3ZXpDdW44K0dwWFlPK2VPRjAyemtxRWdjK1FQc1Fu?=
 =?utf-8?B?NW9UcnljTUQzSFdYSFJtRnJjNlRkVEJtVEx3MXB1OUZBanZLRno4WitMVUZq?=
 =?utf-8?B?Q3kvM0NpQ3J2d0hWWndJU3hZNGtvZmtYWVg3MjN0ZFZnTGlHRmRpK2RrTkFJ?=
 =?utf-8?B?cXpldy9lSFJlbE9uWkp3QkxiWmY2QWR3cWJweWVLaHdXcGR0ZkVEdCtKallj?=
 =?utf-8?B?ZU56QUc5QzBEZzRsb3l1d0NyaTVzeHRuNXlBS0lVbW5keG0zTWpGcytwcUZX?=
 =?utf-8?B?RUw1OXVKU1pXRTVxMFRKb0xCRUh3RkJOYXI3TEZFYVRxVEZyMGJHdDZHTjRL?=
 =?utf-8?B?UWhYcGc0QW1YUkFoeGJNSk5nYUJnbmhJRVFuaWw5bURqa3dxb292VnJvd2Yw?=
 =?utf-8?B?QXpLQTJ4eW9kNkc4QjRIemVTRXlPZzdrVVZOMU1UcVFEMmpKbGZKU3VNN1Rq?=
 =?utf-8?B?VG9mLzFmN2gzdE01YlZ5MW5NeDNMNDFtY2t2Z3cxMmE4NVNIS1JUekN4Q203?=
 =?utf-8?B?WDA5SlRrcGYybzYxUmtDaWVyNXhJS05FcHVuSi83dzJiOUJwUkZQQ3R0amNW?=
 =?utf-8?B?ZWM2TThjSnkwdXp1YlI3aE81QUluc3hkd2NWZi92T2YwZHcrMU9wMVpYYkRR?=
 =?utf-8?B?eXp1a2VRU0IwYlYycWFLdGdkbzViMFJObXVvR1RlNUlsNEJzM25TRWdDUENG?=
 =?utf-8?B?VlpCZjhTaTJKTnZCdTBTSmpmUjN1Z0pIUUcxQ0hycHBQajZZSmMwTjVYVjVq?=
 =?utf-8?Q?0ZvI087YNjN6GhOE4rb1U84XOSf3fmp9h9D8LEFMV4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14E5EB453FDB4348871D64F4B9D4D45C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2602feac-98bb-462b-9bbc-08da01e56399
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 15:56:35.5558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJwO1ZO25jOfunw3gz+0hZ13YTkVsqa4X1Pic4QOqqxnul//wYBpYuPzQWmxYmtrR34vBbn+jhx74mMMgWLmz6VrtvLGlSz+kWwia4o8vIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2879
X-OriginatorOrg: citrix.com

T24gMDgvMDMvMjAyMiAxNDo0MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDA4LjAzLjIwMjIgMTU6MzEsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBPbiAwOC8wMy8yMDIyIDEyOjMzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+
IE9uIFR1ZSwgTWFyIDA4LCAyMDIyIGF0IDAxOjI0OjIzUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiBPbiAwOC4wMy4yMDIyIDEyOjM4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0K
Pj4+Pj4gT24gTW9uLCBNYXIgMDcsIDIwMjIgYXQgMDM6MDY6MDlQTSArMDAwMCwgSmFuZSBNYWxh
bGFuZSB3cm90ZToNCj4+Pj4+PiBAQCAtNjg1LDEzICs2ODcsMzEgQEAgaW50IGFyY2hfc2FuaXRp
c2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZykN
Cj4+Pj4+PiAgICAgICAgICAgIH0NCj4+Pj4+PiAgICAgICAgfQ0KPj4+Pj4+ICAgIA0KPj4+Pj4+
IC0gICAgaWYgKCBjb25maWctPmFyY2gubWlzY19mbGFncyAmIH5YRU5fWDg2X01TUl9SRUxBWEVE
ICkNCj4+Pj4+PiArICAgIGlmICggY29uZmlnLT5hcmNoLm1pc2NfZmxhZ3MgJiB+KFhFTl9YODZf
TVNSX1JFTEFYRUQgfA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgWEVOX1g4Nl9BU1NJU1RFRF9YQVBJQyB8DQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBYRU5fWDg2X0FTU0lTVEVEX1gyQVBJQykgKQ0KPj4+Pj4+ICAgICAg
ICB7DQo+Pj4+Pj4gICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLCAiSW52YWxpZCBhcmNo
IG1pc2MgZmxhZ3MgJSN4XG4iLA0KPj4+Pj4+ICAgICAgICAgICAgICAgICAgICBjb25maWctPmFy
Y2gubWlzY19mbGFncyk7DQo+Pj4+Pj4gICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4+
PiAgICAgICAgfQ0KPj4+Pj4+ICAgIA0KPj4+Pj4+ICsgICAgaWYgKCAoYXNzaXN0ZWRfeGFwaWMg
fHwgYXNzaXN0ZWRfeDJhcGljKSAmJiAhaHZtICkNCj4+Pj4+PiArICAgIHsNCj4+Pj4+PiArICAg
ICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgIkludGVy
cnVwdCBDb250cm9sbGVyIFZpcnR1YWxpemF0aW9uIG5vdCBzdXBwb3J0ZWQgZm9yIFBWXG4iKTsN
Cj4+Pj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4+PiArICAgIH0NCj4+Pj4+PiAr
DQo+Pj4+Pj4gKyAgICBpZiAoIChhc3Npc3RlZF94YXBpYyAmJiAhYXNzaXN0ZWRfeGFwaWNfYXZh
aWxhYmxlKSB8fA0KPj4+Pj4+ICsgICAgICAgICAoYXNzaXN0ZWRfeDJhcGljICYmICFhc3Npc3Rl
ZF94MmFwaWNfYXZhaWxhYmxlKSApDQo+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4gKyAgICAgICAgZHBy
aW50ayhYRU5MT0dfSU5GTywNCj4+Pj4+PiArICAgICAgICAgICAgICAgICJIYXJkd2FyZSBhc3Np
c3RlZCB4JXNBUElDIHJlcXVlc3RlZCBidXQgbm90IGF2YWlsYWJsZVxuIiwNCj4+Pj4+PiArICAg
ICAgICAgICAgICAgIGFzc2lzdGVkX3hhcGljICYmICFhc3Npc3RlZF94YXBpY19hdmFpbGFibGUg
PyAiIiA6ICIyIik7DQo+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+Pg0KPj4+
Pj4gSSB0aGluayBmb3IgdGhvc2UgdHdvIHlvdSBjb3VsZCByZXR1cm4gLUVOT0RFViBpZiBvdGhl
cnMgYWdyZWUuDQo+Pj4+DQo+Pj4+IElmIGJ5ICJ0d28iIHlvdSBtZWFuIHRoZSB4QVBJQyBhbmQg
eDJBUElDIGFzcGVjdHMgaGVyZSAoYW5kIG5vdCBlLmcuIHRoaXMNCj4+Pj4gYW5kIHRoZSBlYXJs
aWVyIGlmKCkpLCB0aGVuIEkgYWdyZWUuIEknbSBhbHdheXMgaW4gZmF2b3Igb2YgdXNpbmcgZGlz
dGluY3QNCj4+Pj4gZXJyb3IgY29kZXMgd2hlbiBwb3NzaWJsZSBhbmQgYXQgbGVhc3QgaGFsZndh
eSBzZW5zaWJsZS4NCj4+Pg0KPj4+IEkgd291bGQgYmUgZmluZSBieSB1c2luZyBpdCBmb3IgdGhl
ICFodm0gaWYgYWxzby4gSU1PIGl0IG1ha2VzIHNlbnNlDQo+Pj4gYXMgUFYgZG9lc24ndCBoYXZl
IGFuIEFQSUMgJ2RldmljZScgYXQgYWxsLCBzbyBFTk9ERVYgd291bGQgc2VlbQ0KPj4+IGZpdHRp
bmcuIEVJTlZBTCBpcyBhbHNvIGZpbmUgYXMgdGhlIGNhbGxlciBzaG91bGRuJ3QgZXZlbiBhdHRl
bXB0IHRoYXQNCj4+PiBpbiB0aGUgZmlyc3QgcGxhY2UuDQo+Pj4NCj4+PiBTbyBsZXQncyB1c2Ug
aXQgZm9yIHRoZSBsYXN0IGlmIG9ubHkuDQo+PiBXb3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2Ug
dG8gdXNlIC1FTk9ERVYgcGFydGljdWxhcmx5IGZvciB0aGUgZmlyc3Q/IEkNCj4+IGFncmVlIHRo
YXQgLUVOT0RFViBzaG91bGQgYmUgcmVwb3J0ZWQgaW4gdGhlIGZpcnN0IGNhc2UgYmVjYXVzZSBp
dA0KPj4gZG9lc24ndCBtYWtlIHNlbnNlIHRvIHJlcXVlc3QgYWNjZWxlcmF0aW9uIG9mIHNvbWV0
aGluZyB0aGF0IGRvZXNuJ3QNCj4+IGV4aXN0IGFuZCBJIHNob3VsZCBoYXZlIHB1dCB0aGF0LiBC
dXQgaGF2aW5nIGEgbG9vayBhdCB0aGUgaGFwIGNvZGUNCj4+IChzaW5jZSBpdCByZXNlbWJsZXMg
dGhlIHNlY29uZCBjYXNlKSwgaXQgcmV0dXJucyAtRUlOVkFMIHdoZW4gaXQgaXMgbm90DQo+PiBh
dmFpbGFibGUsIHVubGVzcyB5b3UgZGVlbSB0aGlzIHRvIGJlIGRpZmZlcmVudCBvciwgaW4gcmV0
cm9zcGVjdGl2ZSwNCj4+IHRoYXQgdGhlIGhhcCBjb2RlIHNob3VsZCB0b28gaGF2ZSBiZWVuIGNv
ZGVkIHRvIHJldHVybiAtRU5PREVWLg0KPj4NCj4+IGlmICggaGFwICYmICFodm1faGFwX3N1cHBv
cnRlZCgpICkNCj4+ICAgICAgIHsNCj4+ICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLCAi
SEFQIHJlcXVlc3RlZCBidXQgbm90IGF2YWlsYWJsZVxuIik7DQo+PiAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+PiAgICAgICB9DQo+IA0KPiBUaGlzIGlzIGp1c3Qgb25lIG9mIHRoZSBleGFt
cGxlcyB3aGVyZSB1c2luZyAtRU5PREVWIGFzIHlvdSBzdWdnZXN0DQo+IHdvdWxkIGludHJvZHVj
ZSBhbiBpbmNvbnNpc3RlbmN5LiBXZSB1c2UgLUVJTlZBTCBhbHNvIGZvciBvdGhlcg0KPiBwdXJl
bHkgZ3Vlc3QtdHlwZSBkZXBlbmRlbnQgY2hlY2tzLg0KPiANCj4gSmFuDQpIaSBKYW4sIHNvIGhl
cmUgSSB3YXMgY29tcGFyaW5nIHRoZSBoYXAgaW1wbGVtZW50YXRpb24gd2l0aCB0aGUgc2Vjb25k
IA0KY2FzZSwgaS5lLg0KDQppZiAoIChhc3Npc3RlZF94YXBpYyAmJiAhYXNzaXN0ZWRfeGFwaWNf
YXZhaWxhYmxlKSB8fA0KICAgICAgKGFzc2lzdGVkX3gyYXBpYyAmJiAhYXNzaXN0ZWRfeDJhcGlj
X2F2YWlsYWJsZSkgKQ0KDQphbmQgeW91IHNlZW0gdG8gYWdyZWUgdGhhdCB1c2luZyAtRU5PREVW
IHdvdWxkIGJlIGluY29uc2lzdGVudD8gSGF2ZSBJIA0KbWlzaW50ZXJwcmV0ZWQgdGhpcz8NCg0K
VGhhbmtzLA0KDQpKYW5lLg==

