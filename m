Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5103666764
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 01:06:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475774.737604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFl65-0002EL-CY; Thu, 12 Jan 2023 00:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475774.737604; Thu, 12 Jan 2023 00:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFl65-0002Bs-8m; Thu, 12 Jan 2023 00:05:33 +0000
Received: by outflank-mailman (input) for mailman id 475774;
 Thu, 12 Jan 2023 00:05:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0PO=5J=citrix.com=prvs=369126fba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFl63-0002Bm-VH
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 00:05:31 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d20d7956-920c-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 01:05:29 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jan 2023 19:05:26 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7048.namprd03.prod.outlook.com (2603:10b6:510:2b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 00:05:23 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 00:05:23 +0000
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
X-Inumbo-ID: d20d7956-920c-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673481929;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IWEE+Uk224L1EzdZRWsnZkazNqZOt00zjoy/L5ND+Ss=;
  b=CaSDizayGBXMEqU8KtvkHK+S5sDwwmxmJeG4z62vSJJAHKjPK8/4Cj3i
   lSQ63w4bNOLHDUp+uYEX0aydS0teQ3HmPzWaFMfLj/gahv9PgkNmqVLT8
   nhayXchpVvfoy1DVP9uQi6roXBvtCggGRu+l0gAGJBlM0mf3KQapDn2rR
   E=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 92208481
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VqW9x6txAoi4ss8uU65vrW5c5OfnVGZfMUV32f8akzHdYApBsoF/q
 tZmKTzVaPbZamL9LdFzaY/n9R8FvMPQzoBkTgA/rnpjQnsU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoQ5AaHziFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwOS0rQ069vPCN8JWHT7Fv2ZQ8LM/xI9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60boq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzirKY63A3KroAVIEYZCHSy8PaJtm23C+NAc
 EkYpW0tq7dnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakcsUQoAy8nupsc0lB2nczp4OKu8j9mwEzegx
 TmP9XE6n+9K055N0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlXZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:ANkL4akOm9tAPXhKeALAYv2MOuvpDfIk3DAbv31ZSRFFG/Fw9v
 re/sjzsCWftN9/YgBGpTntAsm9qBDnhPtICPcqTNOftHGPghrKEGgK1+KLqFCNdBEWndQ96U
 4PScZD4RnLfD5Hsfo=
X-IronPort-AV: E=Sophos;i="5.96,318,1665460800"; 
   d="scan'208";a="92208481"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGgQcJhdVDR5De9i6kLVEzsqntOxozNEr6LuwcT7z7cWNNkRxkW9U+Ge4SRoz0bLLGcjOvFk6+RecfMuqrmuq9tUJQBdqCef9oTUeZTbxNB7zTbZhwIy2IALS/RFPHhdrJJWimq9t3ivIxJeACFD7aFESnt0ue7zeXK6QuJu00n0DfXy4zGzUD/4gQGBsMmopzcbyDotXzg1kRgLwDzbdut6MvUaFFhuSaQYn19QMF5S4gTUjvT8LuOQ9GDtDt3Fg+T1SaVqv56AmyZg2rtGzgKn8jnYnM6/1ZZ1dICZWuj85jsXv3MacmstvX9kQZBA0KJKAM8Lb0iUeI8aj94NZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWEE+Uk224L1EzdZRWsnZkazNqZOt00zjoy/L5ND+Ss=;
 b=ONETdCYH/zQzQVeuYuYR0MmHq+t6FqCFmBPwiJKhxNfwelsWMz9SoQk1Gmgtyn4qJ5ky8qqBTyWeC0jj4pJqx+7icfHb6Br9myEzDsnItJ+Cba8JF2wPUk2ZfHMnjDLS2g8V+QTncEowxisZxqXJvBf2jPSVXuVE7amUJiEBtvF5ql6257wyWGSE9ZdLgm2xUVoEHCxwQd751E8Rf0h9KLbDS+8G0/DLddbMvOIM7QVkhuQ/ADeVYSRJbLXGXnnSy81KEyNA490XXCLM7T1AjrENT3WYqNwdGAbG+LSioCRx8m6X1M349YDTauYEFSp/w6KgMNPeBrc57/TJGUlTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWEE+Uk224L1EzdZRWsnZkazNqZOt00zjoy/L5ND+Ss=;
 b=DNzhJ2sunwxbMbnOk6cUrdd386YhrKp6ZGY/BbHJZLAF1V2nf4XFqeO7knzyEc8Pkew7tAC0mmpkhPoyOZMZ6KR7cjSHOZ+rsFI7o88TAn+83nqGcyFUQGu3WjdSXHRgCRNKYo6YMWUr+10Pzp9NTuM/lKYh0WhlngQrlyNhQVA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2 4/9] x86/shadow: drop a few uses of mfn_valid()
Thread-Topic: [PATCH v2 4/9] x86/shadow: drop a few uses of mfn_valid()
Thread-Index: AQHZJcQqh5dhxv4yjUqRQKHvfuBGaa6Z55gA
Date: Thu, 12 Jan 2023 00:05:22 +0000
Message-ID: <54297677-c176-9358-f101-3939d133c254@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <cd8028ec-3188-3422-881e-28a3a6d8451c@suse.com>
In-Reply-To: <cd8028ec-3188-3422-881e-28a3a6d8451c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH7PR03MB7048:EE_
x-ms-office365-filtering-correlation-id: 9da74b7d-e2d3-4220-5d77-08daf430b345
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dXLL6J3ces1ImAJjiDwL2HkrU43WUGQe1liXhcG6Kgi6ImY0Zn8QUlsUEVUVODEwoTExWmw8t+D15dBeQ1bGIMxHcJdAl1i2C1ejqcKU6qbBPC3VK7rwWApimgpOHc8NeJJ+WV6x9XWXfq2gFYJVmVzwvTzKoR7TJBkxr45onbPWNHtYn28K8gh8QQVbcMdGEy6L5OUHs0FOjXjBY26zEGIwntGiXLwL6EyFm4GEDBrrL6b3clG2uevf5lfwZ5TU9m4pR9nfy6iJpNDy8zREEjfaNfAMS1dV6YLKMhRbsv/tw3KtM51Poicj491TkwJSJX2G5mQu1QdRDGzqYWRAY64gabqhQlzsk5+KnkOOcm/6A+92UwyeyYcHyuoaF+ckbtp0nxgYMGlqMXUZifYJ/9usl4HPKaChAjcU9EYvAz6HQdVhHLY3M72o4XGX8S+YT7fwQOu5iK9ksdV6LE6fDBTsKnEbFN/jrSPXSDyCRoq42f/Wl1D91mBQBZcgDH6KTwgO7+EFC4UsASkHcOxpnarMi0dL/Jz85qj5O02eIL0QTtwoVWi6s5DJGRfSDfyPxfX8a7SKGjcyX3nwBaJFlVeA4hmx+cIqsYu+JPBK4a1iosf3XhorJgbSbuqP+VTzhsPtDUOTDcP8gHy33HZ77ZrixqFOJbnXMNR147WaVelDCmJgBpZClzL6vybPcyz7Dm1b4cX/XD4c6xHSYUTDfwAFjxGrvoSVc/HX6q9XXAyvkEo0AVBw9Ss6dt7eVcfPv14Fhr0T7bnvvC53jQ+kUQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199015)(53546011)(31686004)(2906002)(71200400001)(6506007)(6486002)(508600001)(186003)(26005)(107886003)(6512007)(8676002)(2616005)(110136005)(66446008)(66946007)(36756003)(76116006)(64756008)(54906003)(316002)(66556008)(66476007)(4326008)(41300700001)(4744005)(82960400001)(122000001)(38100700002)(38070700005)(91956017)(86362001)(31696002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SzFhQi9mNFMvdGdKK0drdFduWGZ5NDk5d28weEJKa2R2SUkxckF2NjdqODNS?=
 =?utf-8?B?djVtMjNuVktsYjBGcVdMME5iMnNNZ3pmRGplUTBEN1ptTm01Y0pDZFI5ZE51?=
 =?utf-8?B?anVIUThPVTIwWFFoKzVZL2dSVmcxZi9SYUd3dzVwVGsvazlrK1BqejlHNFhl?=
 =?utf-8?B?eFFHczNOZlhxVHFxaEl4S2hYVTg5aUlId0dDcXdualp3elg2cVg3cWJSK1pG?=
 =?utf-8?B?TEtqdmJPaGdpR05WQlVteThaV3c3Ri81U3JtOTBYV0lub2tKV3RXdE1HSEto?=
 =?utf-8?B?aTBpdDJlUFVDSm1BRlpqWkc0UXJ3K2djTUI3b2pMTUNEQ3hlSGdHd0RPdDhm?=
 =?utf-8?B?TDBCTFJWM0ZzMk1nSFFBUmpFUVUrQ0xlVGl4QzZ3RVUxTGJkUHdZdVZMWnFY?=
 =?utf-8?B?U0xkYURJeEp6aVk2NXQxc1IzSlhhTDdlOFNKSUN6TVVKMEZkbFkrTURXakdO?=
 =?utf-8?B?bDlQZnNxNjhTaHFrSG1ScUUxcXdFQjVXTTBPbmRMc0dDL3I3MXpVaWZGRHhu?=
 =?utf-8?B?ZVZpempoTys4clBmT3ZXRXlhU1FuZ0xVeFB0a0I2bTBpd3R4TUZ0cmhLUkMx?=
 =?utf-8?B?dld1QlVNb1VvNFE4ZnVGa2lPV05mb3c2Vlg4NEpRK3BNU1pVQ2hOenN0VDRz?=
 =?utf-8?B?YjFqeDFwVnJMREwxbVRzR0Rac0hwZXRHeTJjb05ZMVpwWFhkWlpHbjNVVVhE?=
 =?utf-8?B?a3RETk9SZWVCWVRROGpTWENUVWFHOWhUNnRrUmF1SVFTT2MwN054Y1FocWZH?=
 =?utf-8?B?WnJac3FkR2U5Z0ozb0F4V3hOdVNhNFF5eFk5NzVtcTZEMWZZUVFWWDN4NEZl?=
 =?utf-8?B?eEQxY1Bzd2VwVHpoUzl4c2hWS1orTU1DeW9JR3dndWJib28xYXRSWkhhRHNa?=
 =?utf-8?B?eDhtRG9wcjZNOWhENm1QS3hac3lnSFVSNENscFFNQkNQRWxIYzFrQXAyNmli?=
 =?utf-8?B?SkhoU3RzUkRxTHFVSUJjdThQQlE3WlJVUkg4LzJwN1BTY1ZMR1d4MnN5cEJI?=
 =?utf-8?B?dlEzRFg2L3lUMDlFc1FGYjUrcUdHb3hQY1VrdkpzbTkydTBDdXdGM29tT1RJ?=
 =?utf-8?B?a3hMREl3K25WZ2NyaGpSdkZSSHNpQ2lxT3dsTENKSXRvaUwyd3ZEdFg3N0Ru?=
 =?utf-8?B?elNvQzVPcHNpcnh3dGRpaUFmQmhMT0kzTGxDNG9CLzNtWmlnSzQvMkVBS3l0?=
 =?utf-8?B?Z3BYb3cxemx2S3pILy9ZSDhKQ1BxSzN1MDJiVXJmKy92UWNyUEhyQU1xcmVF?=
 =?utf-8?B?N3l3YTdOallHZkpGYUZRU0dxdmYyYUhhNUNXVURhVzJFdTZMWGJtQjhMajZI?=
 =?utf-8?B?cE5GMHJsTUwyNVNVV3dlcVY4Y0ZHS3J1cnpqUWJYMzc3d3BKVWIyVEx1UjU4?=
 =?utf-8?B?TUNSWThnMEhLSXNMaGdZd3cwVlhyTVZNbkNVOHhFdUhFd0p3Ty96TXRmVkJT?=
 =?utf-8?B?R29NWmgzM0hHbW9YeG9NR1ViRnVLaU44Nmg4K2VyTVpMTk02VUJ2NlNOWTFU?=
 =?utf-8?B?U1drY2FVWWdwRXl0Rm4xTlBjZVJVeG1sZ0YxdmxnVTdJcm9tN3VCaitkaTJi?=
 =?utf-8?B?TklaZ1A4R2tOY3c0NnZHNnVkSllGdGxLNDJOSC9VcUkwdnVTbEovR3BLMVIx?=
 =?utf-8?B?MW9ISGlXZVcva0pPd09GYUxRL1ROUnZrckRhWGlzSk1FSmdHY2RJTm5xdnJM?=
 =?utf-8?B?YWwzL04rc01YaVBJUHZXRjlTdUdvNS9IejBrZzhzckRNRFJqU2FOWXpXUVA4?=
 =?utf-8?B?ZmVna0ZrYVlMdTA2Yk5JNFV0U3p3RWpsaVVtbFJRNnBmdktUMWoxcmxWRU40?=
 =?utf-8?B?eHgwWnVRMUhvVG1vUEl2ZUN3T0E0VFlTTHRYQnBnZUR3Q2YzZU9LbnlVZ0pN?=
 =?utf-8?B?UVNHeFpiclpVZEFqM1hDY2JadjhOSTNpN2JxZWl0RmlaclRHRlJmWnVQd2tQ?=
 =?utf-8?B?ZURGaXRzMXl0Z05USHVrMHJxSmtRbEs3TlRMd256eThzN3pKQ1BaV0l3WFZa?=
 =?utf-8?B?QlY2Zko2U0NQcitmczZIMHBjNUhnTlZiN2ppalRpU0dtQ3B3T1FJcldCaXVY?=
 =?utf-8?B?dmRMZTdBRE44WXE0OWs1K09GQXh5MFpwQys0V0V0OVUxMzRkWDcwc25WWFdz?=
 =?utf-8?B?c0wrV2hRSi83cHdjd1c4cTVoVmNuWnlyWjlibnRid3lvR0NsUUZ6cU9sbTl6?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <99616A2CEAE0984CB0EDA9B505FFC4C6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HY8PUg39IC33BYbryx3f72q04sy6yzrzQYHMwOXQLjci107s8xlDj89f6GwlF9mEiEolxUuOhQCJMAoD27z27XejahpA0ihQ61y536xgceU3eZ7M2T8zWIKnbP7kqyGCLQjh8n99S0Rc/L25BmYMwy3wg6ckPvitFd+IC77XPF42UhHXh/NYbMKv6zHiZXqO9mO/TJXMna/S3wfttPf/haGA80+/cCB6l9ArxhhnShR6P580nKCBAOYtUhBgzKZRgg5jTVexs668ZTuOD4UTnWBD8MsB+AAED8JrU/lvI1mNlRcpAPOhoOu/mlLyhSoFhHAG6p039nRpmrOAdMEbOL01X4bA7jFn7ZBw6/51DnR0X9jldH7nlE7pYgJ/SAzxt9HRvjiejky0u0yurYj9syl0tF6rM/xtNq9ZcPWLxESCli0vp8EP97pRc601LXZh+Po9s9YhoQhbO0CZK9CBMww7C5tRlAfCNWhHjOVXEUVYXVFm/REmN6GvmpKZdUXy+rdgAsdxkRKfLZxbSfOVNOcUv21k0CEIg09n4kjHPgKcC3OloGTag3GreydPkCxXsa3KsUBNb4DIKI+h9I3ttk8yEOlQZ0/YpxH7GXfnmoSssI9xmLsK448llwOm5Bm9iaQ+vEDB4grF/9IAgYfacFpHcL99aghgVWx9N61HdjM+R03/3G50/s7qtCAi2+WgjqbFQ+PtihUt9rikvPg9e58jrakOADHb0jjT8CDLJJYuuCFSYNbFMRxdrLAqgMYcsXT+jtZRaz7J0czVsIim4/J2zGmOhH9qXa/0C6wsnEfzGNm4//RpYYzx0wF3CwsC/uvv5aN22MNc/poY9jplcg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da74b7d-e2d3-4220-5d77-08daf430b345
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 00:05:22.9465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t/SlHUtCidQLA//ATRHkx5rduOojoFnAhcLR/NGMiux50K+1yj4Ou/VetzZqPUxxd6UE1X5p/ax3/ph1la11WNddUczbJkarV39oUPqi8SA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7048

T24gMTEvMDEvMjAyMyAxOjUzIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gdi0+YXJjaC5wYWdp
bmcuc2hhZG93LnNoYWRvd190YWJsZVtdLCB2LT5hcmNoLnBhZ2luZy5zaGFkb3cub29zW10sDQo+
IHYtPmFyY2gucGFnaW5nLnNoYWRvdy5vb3Nfe3NuYXBzaG90W10sZml4dXBbXS5zbWZuW119IGFz
IHdlbGwgYXMgdGhlDQo+IGhhc2ggdGFibGUgYXJlIGFsbCBvbmx5IGV2ZXIgd3JpdHRlbiB3aXRo
IHZhbGlkIE1GTnMgb3IgSU5WQUxJRF9NRk4uDQo+IEF2b2lkIHRoZSBzb21ld2hhdCBleHBlbnNp
dmUgbWZuX3ZhbGlkKCkgd2hlbiBjaGVja2luZyBNRk5zIGNvbWluZyBmcm9tDQo+IHRoZXNlIGFy
cmF5cy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KDQpUZWNobmljYWxseSBJIGFja2VkIHRoaXMgaW4gdjEgYmVjYXVzZSB0aGUgY29tbWVudCB3
YXNuJ3QgYSBjb2RlDQpjb21tZW50LCBidXQgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+DQpuZXZlcnRoZWxlc3MNCg==

