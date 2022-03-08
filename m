Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B6C4D1AA2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 15:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287000.486754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRasH-00047R-WB; Tue, 08 Mar 2022 14:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287000.486754; Tue, 08 Mar 2022 14:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRasH-00045Y-Sw; Tue, 08 Mar 2022 14:31:41 +0000
Received: by outflank-mailman (input) for mailman id 287000;
 Tue, 08 Mar 2022 14:31:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibIM=TT=citrix.com=prvs=059cca470=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nRasG-00045S-9g
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 14:31:40 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 763c1fe5-9eec-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 15:31:38 +0100 (CET)
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
X-Inumbo-ID: 763c1fe5-9eec-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646749898;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5fPvnwHyyFCD4wNyDl2CbyychIUceVDLqAVs7pZXZ1A=;
  b=N+oTJM0qYPTjFLNNZhwYgD8ii7w0VG6qdjYkBEsPhcv4lxqMHBXhJE1J
   TMnz++KO2iZVTAerELsMNaW6pb/zM/ABRBg4BUD2gGhuPJf0Mew5WCjqT
   cr9RU/srAgEwX4QLdcA7qF+daqfYlY2QLVkRTMm/sh2MAds08Z4O3T/of
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65641485
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2GvGFaivVyoPXlr+J/7ZhqhqX161mBAKZh0ujC45NGQN5FlHY01je
 htvUGiDM6zYZ2DzLtEgaYy38RhUu8Pcz9YwTFNuqi8wEnwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvd4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQQgF4LUqOUtaEgCMChDHJVh1/zNPEHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklNpyzyfKP8iSJTKRaji7t5ExjYgwMtJGJ4yY
 uJHNGQzNUiQPnWjPH8VLpUVncKmmEPhficBhmypu5o+s3nMmVkZPL/Fb4OOJ43iqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntSHmXIMfEpWo+/gsh0ecrkQtDxkRWUq+sOOOoEe0UNJCK
 GQZ4iMr66M18SSDQtDjUjWirXWDvxpaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5lvaCRSHmd3qyJtj70Mi8QRUcAajUDVhAt+MT4rcc4iRenZslnOL64iJvyAz6Y/
 tyRhHFg3fNJ15dNjvjluwCc696xmnTXZg08zyrPbmOV1VIjR4eYRrSPxhvR8M8Vee51UWK9l
 HQDnsGf6sUHApeMiDGBTY0xIV252xqWGGaC2AAyRvHN4xzooif+Jt4IvFmSMW80ap5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmO2voXkGia24hTmFfK0QfUcXY
 8/znSGEVypyNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXSML5mvP7f+VWIq
 L6z0vdmLT0FC4UShQGNreYuwa0idyBnVfgaVeQNHgJ8HuaWMD54UKKAqV/QU4dkg75Uho/1E
 oKVASdlJK7ErSSfc22iMyk7AJu2BMoXhS9rbEQEYAfzs1B+MNnH0UvqX8ZuFVXR3Lc4lqAco
 jhsU5joP8mjvRybo2RNN8es9tc+HPlp7CrXVxeYjPEEV8cIbyTC+8P+fxup8y8LDyGtstA5r
 aHm3QTeKafvjSw7ZCoKQJpDF2+MgEU=
IronPort-HdrOrdr: A9a23:rSIPWqMf0urFJcBcT2j155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjzjSWE9Ar4WBkb6LS90DHpewKSyXcH2/hvAV7EZniphILIFvAv0WKG+Vzd8kLFh5ZgPM
 tbAspD4ZjLfCVHZKXBkUiF+rQbsaK6GcmT7I+0pRoMPGJXguNbnn1E426gYxZLrWJ9dP0E/e
 +nl7N6Tk2bCBIqh6qAdxw4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1SsV
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGIFq/QpF4t1H2mxa1O
 UkkC1QePibLEmhOF1dlCGdnjUIFgxeskMKh2Xo2UcL6vaJOg7SQ/Ax9L6xNCGpsXbI9esMoJ
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGrf2RYUh5LD3xnklWKvo3RiKnLwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJgncw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cU7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1ret2G9D2MRKAtBjWu7NjDsJCy87BrZLQQFi+dGw=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65641485"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yi5HuH5UMk6s3usnOeHigcQu+FNB3kyptKhYH3eZrAIOXRFBXfWqMwdumwwkFGqRt8l+nbo2MRLA4GCTmAjK2yAIVmhXaCdO5/AbUWGnPEEudCxxrPKiL0xI3ABuvSuUZnLGkwSsMyQM7lJt3vw+oSOkPjo+dLK4OFjmm0arNFnreyZnvEq/CxdBgndYgdYAGSd1ga3Q8NvvgX6T2d93tyKKQQqFxPMfRHJMoXNgL4lEzU8WZqChI3dyUIoqi3tM9hkYIWlr6lNDQqBfmhDJK7SSF3b7FcMEx8PhsvW47pCKAYaVD/QqRtrTjUq9FZtrNOICVc3UQWjJCX1jY1MNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fPvnwHyyFCD4wNyDl2CbyychIUceVDLqAVs7pZXZ1A=;
 b=NYskjZ+T21KYuJ9dG1va/uJCmrcVaWoSAeGLIbWwR83dcQTOF1BmWNjkl1n9pmYVjWLA7L5B8I8p4pkjuzFrYSm7voUJfiq90xPPX4hW+17jth9ehia/sDpOK4c0M0Gy9e3kDmBAFiRLE+qHd8b49GXcTIHEmVduH3sZlvLOj5IY87zJ9IiMiemrw0hgmsm5J0TCSDs/RyPpGxadL9RSOmWVTSSBkYlog+FjxFXJJAYEtHI4ePb+Yitf1fT8RPtuq+NRoSRn9D8c14oSWUy8TYfUx3ib7VTKqsHQSjV0w0BYqm4ystzY7FSdksxddhtIx8nhTjeUim2feWSqYassyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fPvnwHyyFCD4wNyDl2CbyychIUceVDLqAVs7pZXZ1A=;
 b=BcxoU4b/T2DgUE7ETwwMUxj9nop/QfwKvCYLhsYt3dmunAWT1w88OcoBFjRJL7c8GQpi0oF+CXIwwEK40FwvO6/d7mxcijGr0CuoZEQK9u+91WKM+ZaaQGHzQmYm6rY0DAbCwiuSZtBajKRkQvwhFiM9h39kzH1F08zM4hwAs00=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYMjUEaMoAwzVpzE69n4F8Ciyydqy1XcmAgAAMr4CAAAJqgIAAIRgA
Date: Tue, 8 Mar 2022 14:31:31 +0000
Message-ID: <81dc2758-accc-25a3-7b3c-d9988757dd0c@citrix.com>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
 <YidAU63TsVO/X1Q+@Air-de-Roger>
 <b633f92a-151f-c7ca-0d91-cfad8d2edcbe@suse.com>
 <YidM/Wu5lqF48zg2@Air-de-Roger>
In-Reply-To: <YidM/Wu5lqF48zg2@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c32fd340-9e8b-44e2-106f-08da011056e0
x-ms-traffictypediagnostic: BYAPR03MB3525:EE_
x-microsoft-antispam-prvs: <BYAPR03MB352569688CFF85C8763EEE9981099@BYAPR03MB3525.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wDBVFGZPbudurFsxr/qfKlEagWke2mYlZ5hX5zoc3kesrY+we/BjUbFou4O6JP6+qXK3PduRVUSsGcTIt6L5p3SRR4XNqnhkDqVITz+17gc7ivtdJiNgdNuVXejGxMN7XvJdg3PxQn4RnlbKZrYLWlcrjNQaJ5KAGdKhxqSKir8T53kY8zMsuAvi+84lDTkUS1tn56YmWumc3wEbwGnkSfo+Gp5FWXjlJeu9XWCInOz/y6gYfwL4NPr8WzANb8l6VmePsIJMSaGiKr46LFFkd0IS58qGjn/zRyL39sj2501GlaCDiaakBLNxQwm4E2cIwVqRsjbsExDcjBH2Knnt8sG65CvbVj0HXOGxIKHa1sFz2ALE3tXFqKbgqZs+XEwYGZtWQrwljILYOPPsBBC1LdCpWt/iMzUCyk8fpf4EQg9YhQJlB0cEkOHqDjI4ZHox+1cTmmLNO9hoY7jhjqTML03aL9Hl2mchzxdx0JWFhr6HL/EMrvSCUMktemMFiDrAWuPfHN92iotCr1PC0R0Pb6Ds965Mo53lRiTbRZWrP7vtuqdzmscFqjBVylxpHKofDvp3uhWu97lxSEEBqMmL58g4xCUd+s3LniI4jzYC5w4+H+85+JuMNzxpg3Azrk7MSbc3ZnaP7MhFdnXCyhbIkuYmi+ky9bbHxe5DvVTnFNASzJ7VSjgbANWuBTkhcu22QOHhE/S8svRJrf6wpZzGPMb7vt5ZvYCNZuz6+zlPNDTbhL1IUZ46qmXUNeD/7h/3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(86362001)(6486002)(31696002)(2906002)(508600001)(2616005)(71200400001)(82960400001)(55236004)(6512007)(6506007)(53546011)(83380400001)(26005)(4326008)(5660300002)(186003)(91956017)(76116006)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(54906003)(110136005)(31686004)(122000001)(38100700002)(316002)(8936002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ylk1V3RsUW0vdXN6QVhCVUp4WnFVb3FYR0drTnBXS3ZpaE16am43SThCaWx3?=
 =?utf-8?B?ZDg4OEVpMUtzeGRabklPNGNCQ1grUGRzMDFsemtNb0ZXNUpnaG02Y1lmTC9w?=
 =?utf-8?B?R1BYQnkyQ21SaXNDN0tEOEgrL0lPeTJ6aXpHVG9tVFRZWG5aR3drejV2UHRX?=
 =?utf-8?B?UE5VcWdud2s3S2NwZm94aVZtOUdCbHhEVzExckdLaDJ3Z0Q3dXowUWlhMkE1?=
 =?utf-8?B?aHYxTnkxbEdLbXI3N3ZJYzBaTk9mSmpHWVVaRFJLMDVZVXROY0VYQjc5ZHlF?=
 =?utf-8?B?dDZRTmhSNUsvdTBXN1NKTnNXMVB3NXdvSnVLVUNMM3crdk1OWkRyanpmYlF4?=
 =?utf-8?B?WWIzanREY0ZJckFhZ1FUQlNpUXNOelArVzRXdDRKTDRwR3MxaDJqRk42clJO?=
 =?utf-8?B?dnpqN3Z5SWRkZFA2MTlNT0ZJb3RpMWI4eSs1NWphZzZzTjlTNkdHdTUrS0Q3?=
 =?utf-8?B?TkhRaVFJSnRSQkZrcjR1Nk5ua00zbkthQi9GS0owRnNRd01zYnJoTGlBajJB?=
 =?utf-8?B?OUZoOWh0VlhRWVRmMkFNNXk2d0lXT1B6cFZUV1QybURzeTBYR1owN1l5M2Mr?=
 =?utf-8?B?Z1dzV1kxdkp6MHIwdUd6TUd5N0sxek1FL2lRUmV0MFVFV1NWd0d6U0p3S3Z2?=
 =?utf-8?B?TGVnaXVNckF1bmM5QmY5eWRsS2dJNEQwT01WRU5OVTFmSWFmdlpjdERQTkFv?=
 =?utf-8?B?NVZ6MHJZUFJEWUk2YnZ5RHZleW9IWjlKNzNIVjNlQlNvTFA3OGlFUzRXWldW?=
 =?utf-8?B?RXVSTTFDYjEzc3M3S3NhY09Bd0Q1VTVGU0RpWTNaSkVJT1QrRS9STVZ6bmk0?=
 =?utf-8?B?alFMc3BNWEpnaEg5WkVwQmlsSWhMSy9HbFhJQkJ5dlBFVEJCTzNZczFqK2Rj?=
 =?utf-8?B?WE5oMERWSmlsVWovYVFOM3BhMGtBY1BNMkFZTkRzbDB0K0drZEFEUnpiOHFO?=
 =?utf-8?B?ejhNTlI2Z1A2VXBOdmdzbi9mVGxONFc3bzZ0UG1uVEhONTN1V1BBQ1FGZ0JS?=
 =?utf-8?B?Qkd0NEU3UnlnNU1QRHp4V0pkbXg1Q3RKQVZ5U0ZBOTBYVFBGSkUvMmJFcDM5?=
 =?utf-8?B?M3M3WGVyYmpBUkdnaHVnczdzM3hHeGhKVGtyQlBISGFUS0l2WFRmZDc5dGVH?=
 =?utf-8?B?TmUyZ2ZaRi9ORStyWThTWXZjSWxHSFpKbkFMcm10OW5WM3E0N0NrWjZqSERL?=
 =?utf-8?B?VG5kTGxOU2k5TlVRQmJRcVJjL1lBQWZoVnI2RDVCUXBVSU5aZXBUcXpRWm9O?=
 =?utf-8?B?MTBTSUJoaFpRaWhXWTBMcm1LemJWUnh1ckQ0MXlMMW0zQ3V2ZDNucWF6UG42?=
 =?utf-8?B?OFl4ait5TXFnR0t6L2FEYUJVU3lOaVBMU1VzYnBXNGFZWG5MWGhQOStFNWg1?=
 =?utf-8?B?cWdJSlB1NjVuNXVjMUQ3bmQwYVJaZkZWdFZLV2Z4SVQ3Wk84MXY0NE5Tbnd0?=
 =?utf-8?B?bWQ3K1UxNU9jVzZ6RG53Y2FRV1NGajFMUHZIam16RDRtSkIyY3E0VDNwQVpY?=
 =?utf-8?B?NytWVllyKzJvNGRyVnNhZzVBSjQ3L3lvSU5WM3BjU0hUNml2RjZHUWd2KzZX?=
 =?utf-8?B?eHJYTExkWkJMbXRYanphcjF3anZxUEZ3OTE5Uk5BWEs0bG5kZmpKYmt1cTBE?=
 =?utf-8?B?SWV4bnM2NW5OM0tvSkxSNXBxSm5TSTNGSDV2elU0V2prUW9MbnhqVmdvUW5N?=
 =?utf-8?B?RTl0aXBBWW93cERaTjFrMyt2czd1R01RZnpEa1RqRzRoZUxXSjhqenhvNEZn?=
 =?utf-8?B?RmF6ZjF3elhER0JRNUU1ZW1sT3doQU94Y0tHS2tFSjUxaXBDbCtzUkhJZnNK?=
 =?utf-8?B?ZHA5NFBVWWZxU2U2T3RsL1JSazluSUdOd3ZXWEhmRkRRMk1FTVNERUc5Q3A0?=
 =?utf-8?B?MHgyYUpwbGExS2IrQ2lhNWR0MEMzaDQwN0NyMHdUdzIxK1ZpM1lGMW9LYlIw?=
 =?utf-8?B?SEEyZWRTVVo0b0wvM3UxUmZBMFFOVUpsVm9IKy9JUVNId2ROV1N6U3QrYnla?=
 =?utf-8?B?Ry9WVHkwdS9wRndZRW9TQUh4MTJmbXVhalVKUTM5ZUlvQnRVNkhpblU4NUNi?=
 =?utf-8?B?T2NCOXdMSUJ4VXhyUmFLbldlUUNYVnpKM0VIcjBGa0RqSVViY3N4UWcyMUlv?=
 =?utf-8?B?SHdEbzdlWGxwR1dId2J1MmFtMWZPSDc4TEpYQUZaU3N3dmF4Y25qOXVZVDBy?=
 =?utf-8?B?S0NJSWp2SzMyTnRsMENSMEdTVklhVHZEZWZwM2xiL0dmcDFqUUhTSEc5M2dm?=
 =?utf-8?Q?o+yZnHdgo2wT+D1LIK+fsG7SEsSQqLNHcnb7b9uSiU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0981809DB8C3A849A753F2F795A92581@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32fd340-9e8b-44e2-106f-08da011056e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 14:31:31.4194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCfQSOSDWlSguSX/SyaRGnv7SbtN6DhIqS51LzEfh/lYr+dyO3Vr4c8zgoIeq4ZkMLluCqL9q+E4Eq13zW4PuZL9ud/zo4H4jKzHMKO+NkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3525
X-OriginatorOrg: citrix.com

T24gMDgvMDMvMjAyMiAxMjozMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVHVlLCBN
YXIgMDgsIDIwMjIgYXQgMDE6MjQ6MjNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBP
biAwOC4wMy4yMDIyIDEyOjM4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIE1vbiwg
TWFyIDA3LCAyMDIyIGF0IDAzOjA2OjA5UE0gKzAwMDAsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+
Pj4+IEBAIC02ODUsMTMgKzY4NywzMSBAQCBpbnQgYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmln
KHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmlnKQ0KPj4+PiAgICAgICAgICAg
fQ0KPj4+PiAgICAgICB9DQo+Pj4+ICAgDQo+Pj4+IC0gICAgaWYgKCBjb25maWctPmFyY2gubWlz
Y19mbGFncyAmIH5YRU5fWDg2X01TUl9SRUxBWEVEICkNCj4+Pj4gKyAgICBpZiAoIGNvbmZpZy0+
YXJjaC5taXNjX2ZsYWdzICYgfihYRU5fWDg2X01TUl9SRUxBWEVEIHwNCj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fWDg2X0FTU0lTVEVEX1hBUElDIHwNCj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fWDg2X0FTU0lTVEVE
X1gyQVBJQykgKQ0KPj4+PiAgICAgICB7DQo+Pj4+ICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19J
TkZPLCAiSW52YWxpZCBhcmNoIG1pc2MgZmxhZ3MgJSN4XG4iLA0KPj4+PiAgICAgICAgICAgICAg
ICAgICBjb25maWctPmFyY2gubWlzY19mbGFncyk7DQo+Pj4+ICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4+Pj4gICAgICAgfQ0KPj4+PiAgIA0KPj4+PiArICAgIGlmICggKGFzc2lzdGVkX3hh
cGljIHx8IGFzc2lzdGVkX3gyYXBpYykgJiYgIWh2bSApDQo+Pj4+ICsgICAgew0KPj4+PiArICAg
ICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLA0KPj4+PiArICAgICAgICAgICAgICAgICJJbnRlcnJ1
cHQgQ29udHJvbGxlciBWaXJ0dWFsaXphdGlvbiBub3Qgc3VwcG9ydGVkIGZvciBQVlxuIik7DQo+
Pj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+PiArICAgIH0NCj4+Pj4gKw0KPj4+PiAr
ICAgIGlmICggKGFzc2lzdGVkX3hhcGljICYmICFhc3Npc3RlZF94YXBpY19hdmFpbGFibGUpIHx8
DQo+Pj4+ICsgICAgICAgICAoYXNzaXN0ZWRfeDJhcGljICYmICFhc3Npc3RlZF94MmFwaWNfYXZh
aWxhYmxlKSApDQo+Pj4+ICsgICAgew0KPj4+PiArICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZP
LA0KPj4+PiArICAgICAgICAgICAgICAgICJIYXJkd2FyZSBhc3Npc3RlZCB4JXNBUElDIHJlcXVl
c3RlZCBidXQgbm90IGF2YWlsYWJsZVxuIiwNCj4+Pj4gKyAgICAgICAgICAgICAgICBhc3Npc3Rl
ZF94YXBpYyAmJiAhYXNzaXN0ZWRfeGFwaWNfYXZhaWxhYmxlID8gIiIgOiAiMiIpOw0KPj4+PiAr
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pg0KPj4+IEkgdGhpbmsgZm9yIHRob3NlIHR3byB5
b3UgY291bGQgcmV0dXJuIC1FTk9ERVYgaWYgb3RoZXJzIGFncmVlLg0KPj4NCj4+IElmIGJ5ICJ0
d28iIHlvdSBtZWFuIHRoZSB4QVBJQyBhbmQgeDJBUElDIGFzcGVjdHMgaGVyZSAoYW5kIG5vdCBl
LmcuIHRoaXMNCj4+IGFuZCB0aGUgZWFybGllciBpZigpKSwgdGhlbiBJIGFncmVlLiBJJ20gYWx3
YXlzIGluIGZhdm9yIG9mIHVzaW5nIGRpc3RpbmN0DQo+PiBlcnJvciBjb2RlcyB3aGVuIHBvc3Np
YmxlIGFuZCBhdCBsZWFzdCBoYWxmd2F5IHNlbnNpYmxlLg0KPiANCj4gSSB3b3VsZCBiZSBmaW5l
IGJ5IHVzaW5nIGl0IGZvciB0aGUgIWh2bSBpZiBhbHNvLiBJTU8gaXQgbWFrZXMgc2Vuc2UNCj4g
YXMgUFYgZG9lc24ndCBoYXZlIGFuIEFQSUMgJ2RldmljZScgYXQgYWxsLCBzbyBFTk9ERVYgd291
bGQgc2VlbQ0KPiBmaXR0aW5nLiBFSU5WQUwgaXMgYWxzbyBmaW5lIGFzIHRoZSBjYWxsZXIgc2hv
dWxkbid0IGV2ZW4gYXR0ZW1wdCB0aGF0DQo+IGluIHRoZSBmaXJzdCBwbGFjZS4NCj4gDQo+IFNv
IGxldCdzIHVzZSBpdCBmb3IgdGhlIGxhc3QgaWYgb25seS4NCldvdWxkbid0IGl0IG1ha2UgbW9y
ZSBzZW5zZSB0byB1c2UgLUVOT0RFViBwYXJ0aWN1bGFybHkgZm9yIHRoZSBmaXJzdD8gSSANCmFn
cmVlIHRoYXQgLUVOT0RFViBzaG91bGQgYmUgcmVwb3J0ZWQgaW4gdGhlIGZpcnN0IGNhc2UgYmVj
YXVzZSBpdCANCmRvZXNuJ3QgbWFrZSBzZW5zZSB0byByZXF1ZXN0IGFjY2VsZXJhdGlvbiBvZiBz
b21ldGhpbmcgdGhhdCBkb2Vzbid0IA0KZXhpc3QgYW5kIEkgc2hvdWxkIGhhdmUgcHV0IHRoYXQu
IEJ1dCBoYXZpbmcgYSBsb29rIGF0IHRoZSBoYXAgY29kZSANCihzaW5jZSBpdCByZXNlbWJsZXMg
dGhlIHNlY29uZCBjYXNlKSwgaXQgcmV0dXJucyAtRUlOVkFMIHdoZW4gaXQgaXMgbm90IA0KYXZh
aWxhYmxlLCB1bmxlc3MgeW91IGRlZW0gdGhpcyB0byBiZSBkaWZmZXJlbnQgb3IsIGluIHJldHJv
c3BlY3RpdmUsIA0KdGhhdCB0aGUgaGFwIGNvZGUgc2hvdWxkIHRvbyBoYXZlIGJlZW4gY29kZWQg
dG8gcmV0dXJuIC1FTk9ERVYuDQoNCmlmICggaGFwICYmICFodm1faGFwX3N1cHBvcnRlZCgpICkN
CiAgICAgew0KICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIkhBUCByZXF1ZXN0ZWQgYnV0
IG5vdCBhdmFpbGFibGVcbiIpOw0KICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQogICAgIH0NCg0K
SSBhZ3JlZSB3aXRoIGFsbCB0aGUgb3RoZXIgY29tbWVudHMgYW5kIGhhdmUgbWFkZSB0aGUgYXBw
cm9wIGNoYW5nZXMgZm9yIA0KdjYuIFRoYW5rcyBhIGxvdC4NCg0KSmFuZS4=

