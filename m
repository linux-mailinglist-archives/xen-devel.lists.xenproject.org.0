Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C1533B01
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 12:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337109.561616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntodP-0004iT-Cx; Wed, 25 May 2022 10:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337109.561616; Wed, 25 May 2022 10:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntodP-0004ft-A4; Wed, 25 May 2022 10:52:59 +0000
Received: by outflank-mailman (input) for mailman id 337109;
 Wed, 25 May 2022 10:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PIRJ=WB=citrix.com=prvs=137d214fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ntodO-0004fn-Ei
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 10:52:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4ad8316-dc18-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 12:52:56 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 06:52:51 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN7PR03MB3426.namprd03.prod.outlook.com (2603:10b6:406:c8::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Wed, 25 May
 2022 10:52:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 10:52:49 +0000
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
X-Inumbo-ID: d4ad8316-dc18-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653475976;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=x1btQ+fYTf0FYETmvwAIv7s8JzV+qrhowIJ762Rxuw0=;
  b=VIOmaQQsxxcg3OZlw7oLAQ0blGgtALyaBySOQDbGCWL4E9WMmBjZAT94
   7npPEpgswRXP3M2Flwu9cazJ5qcmZw9m155zm8omltW6k3B7Zw1JrpWgk
   EXFedBe7VyN2tj+5snV+R4L3uPczWzXUSkkZAYPSjjw1Aby3E01shb0Un
   8=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 74656847
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XEI12ag09trqPqPHjqmEvBb7X161ExEKZh0ujC45NGQN5FlHY01je
 htvXGHQM/zbN2WmL98lbtnno0sA7JLVz9YwQAprriAzFigb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlnQ4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQYZFLfhmtg0aTV/Sh9yApdCxLbEJ3fq5KR/z2WeG5ft69NHKRhveKE9pKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIAehWlg7ixNNa+2i
 84xQDxjdhnfJTZIPU8aEskWl+a0nHjvNTZfrTp5oIJovzaOklwtj9ABNvLzSsaxZcpKhX2Ki
 XL34EvHGkkYb4KmnG/tHnWEw7WncTnAcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ8+CAjsKwz/0yDVcTmUluzp3vslgEYc8pdFas98g7l90bPywOQB2xBQjsfbtUj7ZYyXWZzi
 A/PmM71DztytrHTUWia6rqfsTK1P24SMHMGYigHCwAC5rEPvb0Os/4Gdf47eIbdszE/MWiYL
 +yixMTmu4gusA==
IronPort-HdrOrdr: A9a23:2YZZB6iv9QDQdFqWG5w2wQZY/XBQX4N23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8bvYOCUghrTEGgE1/qs/9SAIVyyygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3vpxA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gYsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJ7iJGofy/gzdktvfrGrCo+
 O85CvI+P4DrU85S1vF5CcFHTOQiQrGpUWSkWNwykGT3PARDAhKd/apw7gpMycxonBQwu2Vms
 hwrh2knosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfdsRKEkjTVo+a07bWvHAUEcYZ
 tTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYYit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJOmOPJlbsEr0BJhv22tXKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arEsGK1I0jyGG7fIx8Z0WY9ihz3ekIhlSnfsubDcSqciFcr+Kw5/MCH8bcR/
 G/fJpLHv6LFxqaJbp0
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="scan'208";a="74656847"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRFQTRbHZ8fIwTj0W9sdYptzkebgcfMhGBGSRhVEQBcXMQEqkjjlMowQFcy0vENqrSbPNXgBGvGgTlvrhPunIMibkq+nC5MoT9U8UDhegibpPQd9VlsZ7Hwwyzaitplb+ROi/IKvR+yMi5/E7ntLhDte/6DxAa0TLLxmNXX8LFpEJHsqo7X0T4zyT6eMtHzwcxJXHKSADEFhe6i+/JfKHeEL0Pszyo5gUrEz9bJ7B6GPVQH8vGP82Vg4qpmIogaYLWbDz60UO/GEAE0yHCGokf2mC4DZAkxc49l0bDRxohJujxPbMV+mhGEf28UNo2GXS6JV+4XG8OEfxdEkF163Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1btQ+fYTf0FYETmvwAIv7s8JzV+qrhowIJ762Rxuw0=;
 b=ck7RpdPcD9yvlPqpC7bC+Y2+7WqSh0eOCzFKORSH7NG9K6RVA2jMz8nl6pmEWV6II7HPu3JRYbNPLLiJCOmUFeWiv+qiIbZO9jJA1ggugfU39Lv4taBao2wvv9vp0ERIlWyCf1jYG/cV0pybj6gEOGjT/1h3HIlUtXC0fJTU8cLXHcxiI9WiFf/NiTPKMWX4QCxbDJps32nCnOL/wL9IyPiGI05DG39T4QH0lSNRvONiviTR/smX+ZakWhwtA5nem5EPbXJgO6Hyko5ejdK3DX6tFzQdn6FKfSDD7Yzh/sCJGchXezL4EVIflkYaczP8gYouA2WbTlcysflqBNat6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1btQ+fYTf0FYETmvwAIv7s8JzV+qrhowIJ762Rxuw0=;
 b=TMWCuLkJ5JRT5P3Ee+8tiMI1kGqMEt/5XnQIYSD1iLQNG6Z7RKvmYut3fHvlmQitUou6coqo7ok5Mk43uq6r6BhoDjAXbgxw3ns9aOWnSNLuyziB50EGVoDYsCJ747Rp3Utav3TiAVyQUfTEGjvHF/TiXXE8b46iOmLYkx9RolI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/2] x86/mm: rename FLUSH_FORCE_IPI to FLUSH_NO_ASSIST
Thread-Topic: [PATCH v3 1/2] x86/mm: rename FLUSH_FORCE_IPI to FLUSH_NO_ASSIST
Thread-Index: AQHYcA9OnQ9W6lKd/EmmrY4D8odolq0vawYA
Date: Wed, 25 May 2022 10:52:48 +0000
Message-ID: <58aa1cc1-3a67-60d4-6f8e-6c5746b05614@citrix.com>
References: <20220525081311.13416-1-roger.pau@citrix.com>
 <20220525081311.13416-2-roger.pau@citrix.com>
In-Reply-To: <20220525081311.13416-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9aea7e4d-821d-4bf2-33d5-08da3e3cb583
x-ms-traffictypediagnostic: BN7PR03MB3426:EE_
x-microsoft-antispam-prvs:
 <BN7PR03MB3426CFC0E202A5A47F64034CBAD69@BN7PR03MB3426.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mdZLqld/+eMA41E1izC858Ue5CJP6cRjpmelFtGYd2hZty907jU/8kPXpf2fORr8BUlxc28vwe1DmTNRpkrdddKfyz0qq/nNRlMEF0Bzf0C5WV0VdlB78stUq6GxfKk2SCxXHry6GLC81a5X/nz7wrZJJNyPne4nwnStmjce2vr3rb10ixdagmgjSgvWlvbLYhocA/pL+hNgQyeHToB8VGFXSKH34K99Ws2yIhtFeIWGntm+x9KDOTAtbXWMfJ/uVxWCkJasnGFeZy/ykhpuXQgfVdzhJiyvqTqNWTHLUtVRFWZY8fQ1OJryVgaIXO+4Ac8CVfZnERI2AE35McOtJr7bW71eRWmHa2KMQIFu1OhYg5/0v2KDSENemghTjAqQ+ct/FtOOF7ljaW2mPKv4ZD4p3onfl72c8+2i+RqMUBQQGalPZWAGTLopkSL8I2dEFzayxDKSdKqBkUDpqkdRxakkfDvh9nEO+M+ve7eZsSRjjDGiI6tE4FMbWozS0gKRrMZAE90pIXm0N2oKyrAsEraF5HBr5ButI6+zBg6LLurGWgAZGa0GZBeXHNHvyy0T/Shc+5ghhjCliLPWb77Uep1FJxHvE4TPM1E1cheTgPZw6+tC2tw31t+2kdjNKaQAxUHmCfaBQDSlrPAWJxJl7lrwPEufhe74HYrCYPWRNjl4hc1JePmScPcH1W4HXouOQDLSWAJiJ2ZEkZJj0X/ljcDUToWQMSaRJjEfVdfJ30OQ13oBg7BEzP7ZXdloy7LifbGaHa7reBSvlbdX+fNm6Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(6506007)(6512007)(31686004)(53546011)(6486002)(38100700002)(66446008)(26005)(508600001)(36756003)(82960400001)(38070700005)(2906002)(83380400001)(64756008)(186003)(8936002)(2616005)(5660300002)(86362001)(54906003)(316002)(71200400001)(76116006)(31696002)(91956017)(66476007)(110136005)(4326008)(66946007)(8676002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R01XR0tHRWdCa3FEWlBId2JrRVBpY1B5T1Y3WEJtcXVXbTBFWmk2S0hFb1dR?=
 =?utf-8?B?dERYcWYzRlFveGZKV0pSdEVCY010N3lkMXBwRFphWVBwNmRyeHFFT1puZ3VP?=
 =?utf-8?B?SzA4UVdCZzZjMnpwVzhkNm5SSTJ5NTZuV2ZCLzNJZ1RxMTQrSnF5ejZGL1lz?=
 =?utf-8?B?S1M5U2xjRyt0N1ArRU1JZFFPZHZudWFjMFhtbUVRZTZCaVNKbkozNkNhdCtk?=
 =?utf-8?B?eTlTYjRQY3B0YUF6WkFXWnZqZTQwOE1JaDdYUG9aRjlzMXNaOGpuMDd1Wk8r?=
 =?utf-8?B?bHRNUElNVmFQcHU3cFZnNDIyYUhqckxnNGs1Y21OVldXNnF6bWJwZVBnYkJT?=
 =?utf-8?B?WmExTk1oMW1vVDBWTGpUbEJTb2xiUU4ySkY4UUErd0xDdE1GTTRXZEZBVzEv?=
 =?utf-8?B?Y3gzbzFsdnNyMkpxT0ZjOFNaWDRDVUJ6Um42TTV0dlJOaWUrcjRxV3lVaFFO?=
 =?utf-8?B?cE9KWjh2MERrWDZmQzFHWFBYK2dmMkMvbERid3dxbjFQUC9TeHUrS0FPNUU1?=
 =?utf-8?B?dllJZElNbGZpZmt2NXRwenRGM1FwS0N2K0plV1dsT0pCNldOa0NCSk01MWs4?=
 =?utf-8?B?SGlJZjFBUjE3Q0RzNVdyK3hJSFIzRWdMS1BuVjdUNFQxcDQ0M1JKS1V6Rzl5?=
 =?utf-8?B?ZW5jQXlGekIvRE50V0s2dTRrRXZFTlVDekI3M1VLajlIVUNFV21jL01NcHEx?=
 =?utf-8?B?MEVheE1JdmppMDVYOXZFMTgzTjIyT3pVQkUyamRnK3BRc0JkbTgxNU9PR2lP?=
 =?utf-8?B?eFNyc05iN3FiczU1V3FQRVRrV254Wjd3OGNRSFF4eWRBeVp1SU0xMklVbm43?=
 =?utf-8?B?amdtWWFZeXNTUmJ3NE1Samk3OUU5dThvaGM3WFlMUCsvN01PTXRmazVISzBD?=
 =?utf-8?B?UE0xUGVVMmZEMnM4WjEvbjVwSUVCLzBqSjA4d3ZYVjdCbDZKK3BoQVkxVnhN?=
 =?utf-8?B?TUhWYW5vbVN0SXBDOTJFRmduUWYzVEg0OWVIWGlMdlV1aDJxQmFQd1lwbHFC?=
 =?utf-8?B?akRGenJnMTFTY2FBQ3dYajQyRjBDUVB1dmNMcmFrS2NCRmFtRWwzZHpIcVl5?=
 =?utf-8?B?aHdvVVlnb0w5YnhIVmNHSWoyVWE1Sk9EN0d4aFh2OU5hQ1hFTnNxSWFLN2tG?=
 =?utf-8?B?MDJlT2pjd0t2Q1RaL3VFNmJxV3h6RnFtNk1WanlkajJzUjBnZ1RON0V2NjUv?=
 =?utf-8?B?OGpmU09sZjg0ellMUTZrMUJueFJSMkRveVFES2cvOEFUNW1leTFXODNNSFAy?=
 =?utf-8?B?UUdKU1BpSmtWaVNXdW9jcU9zZFJNMUNvVnZnUys0Q05zcnhjOWNWcFU1UzZl?=
 =?utf-8?B?QlFVby92KzJDckd4YUlodEpZMW5XUkxsdmJwMHI4OVMzNGFKWEVpaUJQUGFz?=
 =?utf-8?B?cGVXUzhrdFZTdFhkMTRwQVowSjdjU2VIVlowczF4Qm9IUDdYOUIrbmtzOVhr?=
 =?utf-8?B?VjZIVW82YnovS2tHNUhNcVBSaWhNUk1raURzV3JhdDNpWURtdHpPcnVXdzI0?=
 =?utf-8?B?Mjd5NG1tMjV6WndMN3k1dStCQTlyMGY0Sjh6RENVbFp0ZGxVWlJVYjh6Rk05?=
 =?utf-8?B?Vld5RzFTMEhpZS9vR2pYR0FQeWFMdXZlM2N5RVM0RjNjQWEzOUtNTlBIbDlZ?=
 =?utf-8?B?UnJEK0U5b0U2R1RXMWVTanVJVzJkaE9lYzhnT2o1OWNjbE4yQXdyQzRkUE1p?=
 =?utf-8?B?eXdkL3BEL2ZkOFBHYUdOdWN2VzJoaUJRZGNJMkdma3pmUVNobVpkQmd0V3NQ?=
 =?utf-8?B?MWZqcURLSGFuY25DQklFcy9JNVNUd0tuRGl6c3ExamdmalpObkQvYkFka1pw?=
 =?utf-8?B?bGZTSVpzbFdnOC82dlhHL3d3dEJRUzBvaXk2WStsT0cyVHpTM2ZVOVp2Rm40?=
 =?utf-8?B?MDVTUVhUc3ArOTI4azJWL1dya3NKYXNidG9qeVdQL2I0QXRLZ1JDR1pSWjdx?=
 =?utf-8?B?VUJlc2RwbjRWTDB4T256d0RmZUl3eU05cmFBN0hWdEt0cTBIL0lSeU5iN05h?=
 =?utf-8?B?QzAwaTdaWVRndnlEU3FtbUZKd1hXMlE5MGRzTWNVbWlmMHhvdWpEQ1ZpelpU?=
 =?utf-8?B?VnJpeXRHV2xwY1VPd0FSc0xKSzhwcnI2OHNXZE9Gd2xnR3Z3Vm1jT0orbE93?=
 =?utf-8?B?WUVrNXFPWkZNbWhMQmt4MWR3WndjdkpucGlBSlZtV1dnNTFMc0xNQVp3ZFhS?=
 =?utf-8?B?ZVBadDdxSU5EV2NLZ2lOTmJCK1lMZW11RFA1eDVOVnhVTHpEbUR5N3F3Vzdn?=
 =?utf-8?B?WU83L2l1NnY3Uy9WN0ZsdFphZ0REMStBT253bjRzR3E0ZkhOeFFjamRVcFZK?=
 =?utf-8?B?RXUxSWJVY2NMVGl0ZnJuMkRUUTBCZVFoeUV0QlBTbkYvamlXbHRwYk1aYmRG?=
 =?utf-8?Q?cnFvkXEkZ5iuZal4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C12444471F2064DB1F23B591496EAAB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aea7e4d-821d-4bf2-33d5-08da3e3cb583
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 10:52:49.0112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 162Fnqt/icP9vk/LkZf1GODP5sa3LdPj7wRvkO0RB9NWI6KaSXqZH+6x4Sbezgl6diREPPzyFAOYS28fyS9Qme7ww/sOxRJW9ojJ7NMLZ40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3426

T24gMjUvMDUvMjAyMiAwOToxMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBSZW5hbWUgdGhl
IGZsYWcgdG8gYmV0dGVyIG5vdGUgdGhhdCBpdCdzIG5vdCBhY3R1YWxseSBmb3JjaW5nIGFueSBJ
UElzDQo+IHRvIGJlIGlzc3VlZCBpZiBub25lIGlzIHJlcXVpcmVkLCBidXQgbWVyZWx5IGF2b2lk
aW5nIHRoZSB1c2FnZSBvZiBUTEINCj4gZmx1c2ggYXNzaXN0YW5jZSAod2hpY2ggaXRzZWxmIGNh
biBhdm9pZCB0aGUgc2VuZGluZyBvZiBJUElzIHRvIHJlbW90ZQ0KPiBwcm9jZXNzb3JzKS4NCj4N
Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgZXhwZWN0ZWQuDQo+DQo+IFJlcXVlc3RlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgc2luY2UgdjI6
DQo+ICAtIE5ldyBpbiB0aGlzIHZlcnNpb24uDQoNCjoowqAgVGhpcyBuZWVkcyByZXZlcnRpbmcu
DQoNCkl0IGlzIHNwZWNpZmljIHRvIElQSXMsIGJlY2F1c2Ugb2Ygb3VyIGN1cnJlbnQgY2hvaWNl
IG9mIGFsZ29yaXRobSBmb3INCmZyZWVpbmcgcGFnZXRhYmxlcy4NCg0KIm5vIGFzc2lzdCIgZXhj
bHVkZXMgaXBpLWhlbHBlciBoeXBlcmNhbGxzIHdoaWNoIGludm9rZQ0KSU5WQUxJREFURV9UTEJf
VkVDVE9SLsKgIFN1Y2ggaHlwZXJjYWxscyBkbyBleGlzdCBhbmQgc3BlY2lmaWNhbGx5IHdvdWxk
DQpiZSBpbXByb3ZlbWVudCB0aGF0IHdlIG91Z2h0IHRvIHVzZS4NCg0KRnVydGhlcm1vcmUsIHdl
IGRvIHdhbnQgdG8gd29yayBhcm91bmQgdGhlIGxpbWl0YXRpb24gdGhhdCBjcmVhdGVkDQpGTFVT
SF9GT1JDRV9JUEksIGJlY2F1c2Ugd2UgYWJzb2x1dGVseSBkbyB3YW50IHRvIGJlIGFibGUgdG8g
dXNlDQpoeXBlcmNhbGxzL3JlbW90ZSBUTEIgZmx1c2hpbmcgY2FwYWJpbGl0aWVzIHdoZW4gYXZh
aWxhYmxlLg0KDQpJIGFjY2VwdCB0aGF0IEZPUkNFX0lQSSBwZXJoYXBzIGlzbid0IGEgcGVyZmVj
dCBuYW1lLCBidXQgaXQncyBhIHdob2xlDQpsb3QgbGVzcyBiYWQgdGhhbiBOT19BU1NJU1QuDQoN
Cn5BbmRyZXcNCg==

