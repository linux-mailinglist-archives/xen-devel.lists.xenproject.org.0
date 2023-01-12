Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AC4667C33
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 18:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476340.738455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG13C-000317-NJ; Thu, 12 Jan 2023 17:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476340.738455; Thu, 12 Jan 2023 17:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG13C-0002z0-K2; Thu, 12 Jan 2023 17:07:38 +0000
Received: by outflank-mailman (input) for mailman id 476340;
 Thu, 12 Jan 2023 17:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W0PO=5J=citrix.com=prvs=369126fba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pG13B-0002yu-2q
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 17:07:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a414363-929b-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 18:07:33 +0100 (CET)
Received: from mail-mw2nam04lp2173.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jan 2023 12:07:32 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6530.namprd03.prod.outlook.com (2603:10b6:806:1c5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 17:07:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 17:07:26 +0000
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
X-Inumbo-ID: 9a414363-929b-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673543254;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GsS+vEKyi7Jr/4YI9jEMDy8equIHYDeAWTzYCbpamrY=;
  b=XgXkhdYBuYsjNUbgtwTPoNV0x7c+Ak3PC0HNgfdjMTOrf1J8huBb3UDB
   Sqvo52ejpYZjmISPJux/MUSuzXpkHQA1SfEBkOPSnwmZgXY/bM/Kpqbn9
   B2xhItYUXLASJLxQSXXFnM0t5pYkCITCDoQrlEbiwePIUeHvQUDwAiC27
   I=;
X-IronPort-RemoteIP: 104.47.73.173
X-IronPort-MID: 92390044
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LJ7ZdqOt9IIbmpDvrR2HlsFynXyQoLVcMsEvi/4bfWQNrUp01DYHn
 zMXXWmDOv+IMGSketB2PYyyp0xSupbSxtVnSQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5wZmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rgwKDtS9
 9A6EykIcBqP1+OH5aiFV+Y506zPLOGzVG8ekldJ6GmFSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vFxujeIpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eex3iqANpOSNVU8NZkuEeYm09NOiEnUFe1usuwuEfgVI5Af
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBSBRf5dDm+N03lkiWEY0lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:DDkcS6uK3YRj40v6tAYBsn9w7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.97,211,1669093200"; 
   d="scan'208";a="92390044"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a26L1f1qeZR/LgFNerpF3BvEYpEUmnXN1F+Jk1WYp4Sd7GZ1ySkATuu8Or67O9eGsGbdQjuyWxV8cAJebTYkx5dmxGihZdUgxoWVccwi7qhfbjX2/35AIF8y2m9BgV8p+5MheLr2bYuFa92TZuDdAJ8rwXEDllPQrKn1MU3CYqNoLqNtVuOEu+uqHYFRaOrMzgDgDTfYGg0MnBRCsEN9/436/9RVEqJAT6CPY1G6+Pnox0e6RVRmvbb85zxN7RC2bKMe1NAc2k34JobUe9Rv0Y7iyO1WWwo77vY96ZXMChEzjuSBhnCYTnlwOIDzEVfrq3twRny6LpnvvWEcAIMXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsS+vEKyi7Jr/4YI9jEMDy8equIHYDeAWTzYCbpamrY=;
 b=f/vQtnhDpeCfp0swOI/RDsDsNP7aEyu11Wkq1k1TL42xHIo0Mg0aBAuqRRTeLBXVi7eIhf1CEq0yJpkpy8C8bM1WbFYRlxMCHWBRRIQxcArHm0dlQoNrxnKJvaMql9TrIxsIE84h7NFu/GgoaOgecaLahf4xGaFO83Ylcv3cI8vRrEliMdS1EG2etp9wLmOUMiAEfVopjC9sxlbbraDQZphAaFkSOaguSoHZk5hhAQrkDjPrrdncc9+sm09EkPh7pdCX+2Pg1RcmOwqw7v0isSL+Z5CldCy0CCZhL16cUNaZ6Xw6RYpRhG9/scG9fN25QAqYGLi8x+8pN9GBiSXoew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsS+vEKyi7Jr/4YI9jEMDy8equIHYDeAWTzYCbpamrY=;
 b=X8Fh5+TWYI4ux8pYEXQHwW/q0IkgWrqVqdPkczAFbSo/AEKkZwi95cf2qUQk1ISTLX6QzfjSakpszE3N9niZ/G+bbFdusKzqkCXYmq3y2dKszE5K+Nsy9sm9pde7Ry5521FlgIjLo7Uu7jA/fkEjRCz5csm87jhlD7OopHFuu2I=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/8] x86/boot: Sanitise PKRU on boot
Thread-Topic: [PATCH v2 1/8] x86/boot: Sanitise PKRU on boot
Thread-Index: AQHZJReg9aEubjLXpkqfuIdyn2CTs66avfyAgABIhQA=
Date: Thu, 12 Jan 2023 17:07:26 +0000
Message-ID: <fcfe9344-ceac-aa80-404b-55fb7a75fdeb@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-2-andrew.cooper3@citrix.com>
 <27d830b1-a32b-1368-3c0e-e5de15da5000@suse.com>
In-Reply-To: <27d830b1-a32b-1368-3c0e-e5de15da5000@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA1PR03MB6530:EE_
x-ms-office365-filtering-correlation-id: 384042a8-bb77-4210-585c-08daf4bf7b1b
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3yhO0GWa3ARtbLqVOj9g/ft1D6eK7IoF060aQ1jFgqwUiwWJw6MiZkyi/iKtzB3Ax6WKQKhHFA5U1p7z5rijbNxuBiOu678emPkFzjDs7wE1srm+XLRCgRg35BgQuo3OEu6q2NzNRQ/4A1fzWzh+XTa7mLKmKdoRHnr14zQCH+8S9utdMBpo7QYGtBO591kfD/YL6wofqoSSfVioup1G+xo+UO27AJY/FzxKrNBfCPhL0KRUpUae1TqnXBmyT8plUmpUUUgfGya4Ex1j4wXuR/dR+vwhkyJ2b+j6wdyGFy9DetLiq9h7CWsx0UQZnMeBfGLw1D/TRKFWTyLgyofEIMWr9Rgis82uuolxeA+OM2vsCc1EU2pTTLFz/5ids43GktTdeeAQhrnJVopUQ5AjfrnVFt+n2ikdKLYq3ybC24gVo/PBi1zCBm0T3IO5THmmMRgsBm0KcU7FpLwi/TtDm/LzbAWhNzIu/V5c5qjaW+Y1Y+8hcx6WNHTrRn5aJCuIjC4KHzkvGoVU6VYjtLPUmMTZkTRD+DhoNQf7fXIHCrsgDbVdru7ZN2uJsAF0crwYE2Wq4S3fldn/aiwLaB8wbQrVOw6Eo93KHDNkgl3GEObVSTVfHwE9gM+yNFUU6D9djZWzZSGYEccvRysPJumFBcxVEB1uyKV800KlW3lheAixzALvS4UGEFW1iZo27Ikvzot2u1b5DMdwJFet2Dd2Hcmc4mt7k/JFXGK3EVA7HNTHNAvgPJ2lEO8UkZK/YEMnGDN0mSLci7cUZFdHEvfyAQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199015)(26005)(8936002)(71200400001)(5660300002)(2906002)(41300700001)(66446008)(66556008)(4326008)(8676002)(316002)(6916009)(76116006)(64756008)(66946007)(66476007)(91956017)(54906003)(38070700005)(6512007)(38100700002)(2616005)(122000001)(31686004)(86362001)(186003)(31696002)(53546011)(83380400001)(82960400001)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlNDUE1VRmJTTnpmZS9mN2xyV3duRTRFc3pVTnVvNCt4b0ZnRjhoTDZZSW9F?=
 =?utf-8?B?SzhyekphNFc3YkZZYzNaa1pHY0MvNUh1OCtUV20xRXQ5WkdRVkgraFNvckht?=
 =?utf-8?B?aTIraE1VbjVXZmNlRmNQaXZXaTFYaWhra2FZRzFLMmFjWUlZL0JWUGNZaUlU?=
 =?utf-8?B?TFV4T0tHc2pZR0lhWUNnQzBrL1NRVmIweVdpT2JWZDdOSXdVNWpnRFJ4WkNL?=
 =?utf-8?B?YzBLNnNMY2pSclZuQzdVUzNaUVFQbHovOEp4WVBWVllwcDhWelNFR0NGSUxw?=
 =?utf-8?B?dDRNTTR1TU9TWiswRDlCUEpjN1hIRW5mcXJONklrTkRRRyt4YUNrWjJjSFRu?=
 =?utf-8?B?RktrRzdma253bHNiM0JaS1pFNGYzYUdKS1JMb3FIR3M3elpiMVRDNEJaNHMv?=
 =?utf-8?B?MWNCZnFsSGxaL2ozK2xBWHFRQVZsaWNzTmxzMDV6eGIwQ0RDaFJYa3Z5L01K?=
 =?utf-8?B?bU0weXhMT2YzcENJQmV0dUlXQ0YvNkJjNXVzZ013djNwSE5ORnd4YXpsZS95?=
 =?utf-8?B?NlkzdEtWdGFMaTFHeGJxOTRyVFVwQU1lOXE2OHp2ZnhBTmppQzRBVzN4QlVx?=
 =?utf-8?B?WjR3UG5UeFlhMmdmSUU1dk4xcnJhSUlSVGxQa3U4bndSdkhUSnhGZ1F6Vk9E?=
 =?utf-8?B?RHhpSFNZV1ZCMU1KazRvNlFPU0VLbllEQVFqU290VjA5VnJXeHJTZXJUK1Yr?=
 =?utf-8?B?SVJyKy9uVXUrNmg1TU9UNEpUN29ua3lxZlZMS3VLeW5BeTFPRWowWXVNUmZV?=
 =?utf-8?B?SXNma1QxakxtZkMrbjRISHg5Qlg1dHM1MmtjUCtDRHJBalZOWFk0RzhkbEcr?=
 =?utf-8?B?UHorcTBneFhsVHBmU3RZMnRkUjA1RzVqM2tWK2ViR2pkbUZSOWJrNVAyR2Nz?=
 =?utf-8?B?U0dRRlQxTlRrMTdLend1L2hDcnFTSGpndXJScm5ZQ3BTSGM4RXJOR2hmcmpE?=
 =?utf-8?B?Ry9qVEZhd1YrOTBDU0YraFY4c2xWaG9HRkpYWEx3d3B0bGFITTVZRnVsTmZr?=
 =?utf-8?B?c1FYRUc5K3BIT3RIVDA3RTFIODVvUE9ReFZmZHdzN1llOEVObytrMVRKdWtp?=
 =?utf-8?B?alNwUEl4Y3FndldkSW5OWThCanRqYkxEUkxZYVZsMmo4QVF3MXdFVCtYQmEv?=
 =?utf-8?B?K2I3VGcyeVB1L2tBbzJZMmR5MS95aWd1My9vU1VXYnZxYXBtQjZEMEcrK0pJ?=
 =?utf-8?B?VnVzYTVOMjhtNHZzaCttU2o3eUN3NkVnSmJSSXY3SU5nKzF6UHUrNEcxaHJH?=
 =?utf-8?B?dDZJbzNuTGJKNmpMclZndEgvK0tLdExkT1JjRlI1R3VJRjlyRFRvMldiWEFF?=
 =?utf-8?B?NHgrVlFIK3JuZzh4WXZEM1JlcmNON2o4SlJTaURMa05xOXZCdytNdWszUlJW?=
 =?utf-8?B?Y25QakNvSWxHODV4aUZWOGxSWmNhcHAxZWZJc0ltdWRET25iM2oxWG9nQTkz?=
 =?utf-8?B?dytnamRFWWQ3YVJHUU5heEE2YmhRb3RJcXdKeUw5SGJZR3JMSlRhcmUrdzJ6?=
 =?utf-8?B?dmIzSWZHOXdRVHU4UDRjYXVWR2JIYmF3RkExUVJQbzE2a1YwVlRURzJCZ2Fn?=
 =?utf-8?B?TDdyYnFKanE1V040M2EzTkF2alFMYXMvK2tGWDFDb1BPdmFtK084N2I2cWRB?=
 =?utf-8?B?WGovOVpLYzNSUUZ3L0U4akRHS1hyNkJ1ME1NT253cFF5L0pSemZybnNJV3E2?=
 =?utf-8?B?Q1gzSTM4REEwazNSTkdIRys1RDFkYzFobzlROWtUQjc3Wkt0NWliZE5ONXJ5?=
 =?utf-8?B?VktQM3JxUGtzSWw4dENzRUsyVUc1dmR1NFNTNVdPdnJSSjNCUzUwQS8wZ05z?=
 =?utf-8?B?b3hZUDBJQUFKOVp6VCt2VzhWVUxJZzFLT0ZSVTdVK2QxVEoyRzhKZkVnRzhp?=
 =?utf-8?B?aXg0Z3gyREpkd0J4azQ5YWs5NjZ4Z3I2RE9Lejg4S09Ed1dQYytFVnZJKzZk?=
 =?utf-8?B?QmQyUzVKd2dqK1pyQ3MvRXVIdUNacmRGOTVnQ3dyNzMzb09FTWErdEFSak5V?=
 =?utf-8?B?WFVVcnlJV0IvaGw4Y0RSQzFXZWgyemlNZjN4aWNJSVFKVUVkN1BDNnNHVy9x?=
 =?utf-8?B?aVZENjBGUG9VbjRDTmtiT2FLL0JxN2pCWk1NckJNYXlnUkRxY25OTWcwSVpM?=
 =?utf-8?B?OHN4UXRqckt3SWl3Y2NCTnlpeXZQajBCYy92TzJwb3liRHdieHVXWXFMQWlN?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1725C87D6B4F0B4EB1EFA19C0AE04CAF@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A9yg2KGlOMYw/JVKK6I9/yrSWmAlHb3vX+rKcH3U+s+iWObWDEw7/VWjlwXp8DEIizCDHV2KvneJkVzjcf4ZmeODuiPgegC7thjxX6vSe7aUkfU9YjO+rJZq98nZNQH7TMW7tmDmh4gaBLeSB6Gqv3uSd+9WO8Xe0uy6zSkfr3iA8jIssbCW73UvcWTq5RYlrzqwySeKlrvchUEVodnRIUII2begwYFVzzCyvUbUUke/ihiBI8tbkpExtsv8izJNWjJVJB4VTTp+RX0eEc+yHJI5QeSz8UVfnZemd3+d01MJbkE3apiUItic5q5x5/EU+hiSfbsZKSaV1WPTKKx+S/6Db9pe/cDSzXkb8nPCn/Oi7ul1dkYPmFrzqQGL+wqOM+TDOUtm53SF4ZR1Z9DBO1zRwnDhCDpXY3WlNpukL0WVdmO/51nzozgAoVsSymM5ViN9mrpnrPFLxk3YigkwdULgXNedEWjQSQafN7CVvLzZHBQ32/kD5v7vGRupUh1LYmyoJjXjU6O4nXXw3+8P00eMDx5+O6RA9Qd564DcnQeWhzFc0uNJL017rxpMDAN99zMdtc7cW4H21R+Q8Fw3HE3Qpeu/X24tO9rvz9GhzgNX7QhDqw7FM8Hp19SwZOHaGi9SS1P0ChrjiXVzzNalknonbLoGGUHb9jOx/C8R0c+YiSxDkz55HBaZn41fOigpFXeEIFG2pi9u/OFPMgkPCF1WfczpDkeMbvSVHdoFQ0lQtENvsqfsr6zym23xuyII7SHv4XbbvdhD7RPkYYbmi8atLNUgBgUP/gagSbeq8GubwnACqjmO3+8u5Kr3NyRM
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384042a8-bb77-4210-585c-08daf4bf7b1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 17:07:26.7198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMXvwRffPYagNf/An7YPzszloUCVf8Y8CJxNfXkBhqfzGeuzoGx4p5bsV66E/L9Lsl5/WGSjorOOdscIEjig8gds+GHvB8mQ0KXU1BUoqEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6530

T24gMTIvMDEvMjAyMyAxMjo0NyBwbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEwLjAxLjIw
MjMgMTg6MTgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBXaGlsZSB0aGUgcmVzZXQgdmFsdWUg
b2YgdGhlIHJlZ2lzdGVyIGlzIDAsIGl0IG1pZ2h0IG5vdCBiZSBhZnRlciBrZXhlYy9ldGMuDQo+
PiBJZiBQS0VZMC57V0QsQUR9IGhhdmUgbGVha2VkIGluIGZyb20gYW4gZWFybGllciBjb250ZXh0
LCBjb25zdHJ1Y3Rpb24gb2YgYSBQVg0KPj4gZG9tMCB3aWxsIGV4cGxvZGUuDQo+Pg0KPj4gU2Vx
dWVuY2luZyB3aXNlLCB0aGlzIG11c3QgY29tZSBhZnRlciBzZXR0aW5nIENSNC5QS0UsIGFuZCBi
ZWZvcmUgd2UgdG91Y2ggYW55DQo+PiB1c2VyIG1hcHBpbmdzLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+
IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+PiBDQzogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4N
Cj4+DQo+PiBGb3Igc2VxdWVuY2luZywgaXQgY291bGQgYWxzbyBjb21lIGFmdGVyIHNldHRpbmcg
WENSMC5QS1JVIHRvbywgYnV0IHRoZW4gd2UnZA0KPj4gbmVlZCB0byBjb25zdHJ1Y3QgYW4gZW1w
dHkgWFNBVkUgYXJlYSB0byBYUlNUT1IgZnJvbSwgYW5kIHRoYXQgd291bGQgYmUgZXZlbg0KPj4g
bW9yZSBob3JyaWJsZSB0byBhcnJhbmdlLg0KPiBUaGF0IHdvdWxkIGJlIHVnbHkgZm9yIG90aGVy
IHJlYXNvbnMgYXMgd2VsbCwgSSB0aGluay4NCg0KWWVhaCAtIEkgYWJzb2x1dGVseSBkb24ndCB3
YW50IHRvIGdvIGRvd24gdGhpcyByb3V0ZS4NCg0KPg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2Nw
dS9jb21tb24uYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYw0KPj4gQEAgLTkz
Niw2ICs5MzYsOSBAQCB2b2lkIGNwdV9pbml0KHZvaWQpDQo+PiAgCXdyaXRlX2RlYnVncmVnKDYs
IFg4Nl9EUjZfREVGQVVMVCk7DQo+PiAgCXdyaXRlX2RlYnVncmVnKDcsIFg4Nl9EUjdfREVGQVVM
VCk7DQo+PiAgDQo+PiArCWlmIChjcHVfaGFzX3BrdSkNCj4+ICsJCXdycGtydSgwKTsNCj4gV2hh
dCBhYm91dCB0aGUgQlNQIGR1cmluZyBTMyByZXN1bWU/IFNob3VsZG4ndCB3ZSBwbGF5IHNhZmUg
dGhlcmUgdG9vLCBqdXN0DQo+IGluIGNhc2U/DQoNCk91dCBvZiBTMywgSSB0aGluayBpdCdzIHJl
YXNvbmFibGUgdG8gcmVseSBvbiBwcm9wZXIgcmVzZXQgdmFsdWVzLCBhbmQNCmZvciBwa3J1LCBh
bmQgYW55IGlzc3VlcyBvZiBpdCBiZWluZyAid3JvbmciIHNob3VsZCBiZSBmaXhlZCB3aGVuIHdl
DQpyZWxvYWQgZDB2MCdzIFhTQVZFIHN0YXRlLg0KDQoNClRoYXQgc2FpZCwgSSdtIHdhbnRpbmcg
dG8gdHJ5IGFuZCBtZXJnZSBwYXJ0cyBvZiB0aGUgYm9vdCBhbmQgUzMgcGF0aHMNCmJlY2F1c2Ug
d2UncmUgZmluZGluZyBubyBlbmQgb2YgZXJyb3JzL292ZXJzaWdodHMsIG5vdCBsZWFzdCBiZWNh
dXNlIHdlDQpoYXZlIG5vIGF1dG9tYXRlZCB0ZXN0aW5nIG9mIFMzIHN1c3BlbmQvcmVzdW1lLsKg
IFNlcnZlcnMgdHlwaWNhbGx5IGRvbid0DQppbXBsZW1lbnQgaXQsIGFuZCBmaXhlcyBlaXRoZXIg
Y29tZSBmcm9tIGNvZGUgaW5zcGVjdGlvbiwgb3IgUXViZXMNCm5vdGljaW5nICh3aGljaCBpcyBh
YnNvbHV0ZWx5IGJldHRlciB0aGFuIG5vdGhpbmcsIGJ1dCBub3QgYSBncmVhdA0KcmVmbGVjdGlv
biBvbiBYZW4pLg0KDQpCdXQgdG8gbWVyZ2UgdGhlc2UgdGhpbmdzLCBJIGZpcnN0IG5lZWQgdG8g
ZmluaXNoIHRoZSB3b3JrIHRvIG1ha2UNCm1pY3JvY29kZSBsb2FkaW5nIHByb3Blcmx5IGVhcmx5
LCBhbmQgdGhlbiBmaXggdXAgc29tZSBvZiB0aGUgZmVhdHVyZQ0KZGV0ZWN0aW9uIHBhdGhzLCBh
bmQgY2xlYW5seSBzZXBhcmF0ZSBmZWF0dXJlIGRldGVjdGlvbiBmcm9tIGFwcGx5aW5nDQp0aGUg
Y2hvc2VuIGNvbmZpZ3VyYXRpb24sIGF0IHdoaWNoIHBvaW50IEkgaG9wZSB0aGUgbGF0dGVyIHBh
cnQgd2lsbCBiZQ0KcmV1c2FibGUgb24gdGhlIFMzIHJlc3VtZSBwYXRoLg0KDQpJIGRvbid0IGV4
cGVjdCB0aGlzIHdvcmsgdG8gaGFwcGVuIGltbWluZW50bHkuLi4NCg0KfkFuZHJldw0K

