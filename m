Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMANCM2ihGmI3wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 15:01:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0FCF3B44
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 15:01:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221994.1530066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnzun-0003V8-9V; Thu, 05 Feb 2026 14:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221994.1530066; Thu, 05 Feb 2026 14:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnzun-0003TA-6g; Thu, 05 Feb 2026 14:01:01 +0000
Received: by outflank-mailman (input) for mailman id 1221994;
 Thu, 05 Feb 2026 14:00:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Xm=AJ=citrix.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1vnzul-0003SQ-P8
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 14:00:59 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 184f1b92-029b-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 15:00:57 +0100 (CET)
Received: from IA1PR03MB8099.namprd03.prod.outlook.com (2603:10b6:208:596::22)
 by SA1PR03MB6371.namprd03.prod.outlook.com (2603:10b6:806:1b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 14:00:51 +0000
Received: from IA1PR03MB8099.namprd03.prod.outlook.com
 ([fe80::4556:a2ee:3c19:2ce2]) by IA1PR03MB8099.namprd03.prod.outlook.com
 ([fe80::4556:a2ee:3c19:2ce2%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 14:00:51 +0000
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
X-Inumbo-ID: 184f1b92-029b-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rD4evPf3y9NFqvpe7fk6/Xn9Epw8oalgH70R5ORAG+QxuFfO8xFhfxx7YUkAIw9HWOyOLfBuEWLU2wGPZlK3YxCftbShut7Mdg6KYydiGUKY1iDplfsMIYTEJm/ykO1rTCU4oSUqHM9tmnaTbnLD+Z4Kbbr2LXNz+UgF8/AutN9iPcwufFXE5W3Z1YFQK+BcAI9EP059Y6YGYiWsZbvCDR6Iq3Zj4smiTHLrDd+xgUmc//0012KUjtk/3pWyTVN7ZuiTOeei7SUjdFDvZyEa2DEqpW3bAx9KvAMYzTN1jurTUG1pNNLDmGZ3gNW2GYeqsS+QUyrMSiQzsd7dq1AIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjYYIh7kcfj4y0kz4QRPgWdm7DZlp413o/MTa1EZDzY=;
 b=oZgBT4W0F+szTq3pY1hnFdSFZteZVcNdRxTggexilSpt7/UEEK/s4gkuYxeHQeDI1RPaUU+eeEPEhv8lGTJSR+TeNe0F74g35tNys7cDBUR2i9FwgEiADo+/XLQNGIXazUBWfiiPJXkY9VAUL4HcODXD3Qwmt+GK/qAHXjv884NTJnxV1ipF6bKvDNPUrpp6CLOrxPq/ICth+B2NO0IXRu34Zja0RkcQy0h07tT6EsTNB1Ts4RpmGorNt5WPKJvItHOJqrPF7+h+xDDRPXJicVEJPobzc44ZUVx9rFEeMOtPZTcVm6XGf5hsvoPcgmKPiNMjZ5/TS05NOKxgWw38RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjYYIh7kcfj4y0kz4QRPgWdm7DZlp413o/MTa1EZDzY=;
 b=hwqEZ/EtGmeyu/L3PYXp6eDgif4OIX4n+Pyyqp87QdKqXroz/9X4Afe1SrhvwYvAC/L8FxDq72VJN+SJO8wAPuus1yA11Vord+KdjSiEgTYVD4ke09dPT7l56O3dldwfaMEYH8/xhk5gVXb5bgxYK924Tpg9yqI/FcSlLwb+FrA=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edwin.torok@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] Xenctrl.domain_setmaxmem: fix 32-bit truncation bug
Thread-Topic: [PATCH] Xenctrl.domain_setmaxmem: fix 32-bit truncation bug
Thread-Index: AQHclqdHSMQLCJJwBEO6hgFHUkkYV7V0IlGA
Date: Thu, 5 Feb 2026 14:00:51 +0000
Message-ID: <C971AF3D-D465-47DF-AF95-FF065A053D9B@citrix.com>
References:
 <7f0c73c140b53cf0777437b46d0a0fda496b48b8.1770299489.git.edwin.torok@citrix.com>
In-Reply-To:
 <7f0c73c140b53cf0777437b46d0a0fda496b48b8.1770299489.git.edwin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.100.1.1.5)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR03MB8099:EE_|SA1PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: b8b7c185-08b6-426f-a713-08de64bef8fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V1Q2Ti9WdmNjanpCRTA3RUZhWFkrckp5T0xZbW55WFU4b3ZoVWRuQlB6N2VJ?=
 =?utf-8?B?ZXBWSk8zUFBrM1hsZ3NFeFFoY1BLSld5WHZ5d3lOcnFoVnM5T3lJZ3NMNXlm?=
 =?utf-8?B?U2dhTWtFT3V6aWZRZzBuSkxHWE9lSFBCcEVtU2o4NFBTOG9mdWo0eFo3RHNi?=
 =?utf-8?B?MFZ2YTFjdHFJZXYxMmszVklGbXQ1L1dHOFVWa0J5czBNWjJHMjJWQ2RYVlNx?=
 =?utf-8?B?cjQ0OTcreVNYck83ang4WEY1ei96TUFKNlczVTFURE9aZDFWbDUwVGx1aVBW?=
 =?utf-8?B?dndVZ0V5Rk84NmduRkFFdXB3SGRhWm0zVDJFM0VwbUtJdmdoamt3anZEWTJs?=
 =?utf-8?B?MTNrbnhJbTM0RTg5VXBscW9KblNMa0pNS3Z5Y0xybjdzYWJyZHRmK3lMZGti?=
 =?utf-8?B?QzFlNFFGVFR3ajRZb09TNkdrK285NEdkTlNvMTM2V3ZBTEsyUmE0VW1qWThw?=
 =?utf-8?B?dmgwZW1CS0dLWktkZUhtbit2VFhKSGtqcnorRk13QmJsR3dJM1VHNXhWckhq?=
 =?utf-8?B?Z0FZNldtRDJjRkVKT2lQN0N3azVzVHV3MkdFMzdndVN4akRUZTdmTkpNYVFz?=
 =?utf-8?B?eFlkdTlveVU1SWlFb3NxYjVCb0kwQ0Jza3BrM2E4dmFlakJVaHNYbUZvbDZw?=
 =?utf-8?B?RUdoY0UyUlZRWVhiL01INmYrWTREZWpJR0h1bk5nWWx2cUpmVzVCRkliczh4?=
 =?utf-8?B?RnByWldqcVNlRFF6alAxaGZGbitZcTU1UXU4NGQycjdOT3J3VUZBM1hlSzhu?=
 =?utf-8?B?amhLOUNmcGJkelduOE9EZFl3YmdKTloyWkU3MDIvRnpLQnUrYndGTVJ1OUZS?=
 =?utf-8?B?NnQvRUtqbnlyUlhrbWErbVE4NndrQ1ZFZjdyMHhxa1ZZN3k2SVNpdXBRSWZJ?=
 =?utf-8?B?d3FWQVcxaU5WTDJkT1lseUlBQ1F5c0VlOTQ5WnBhR3BqZDY0ZURKWGloYS9R?=
 =?utf-8?B?R3BSZG9VQjB3Yng3NElMN0I0VGc5ZGpicUoyTlJDNi8ybE1oQ3N5RDVQcVZG?=
 =?utf-8?B?YkttQ2dvYzA1c200SEJlSlNlYTZrd1hCU0J5OUhmVVB3cEhPeHZZVy9DTXZz?=
 =?utf-8?B?ZzBnTThPQ3lBeDhTSzlNdHRXS2hxSldaOWdHYUs2UVZRSmo0Qkd2enJ0L3NI?=
 =?utf-8?B?am5kM3FnTDdhQ09Tb25lSTFXZmFGeUo3T05rWnpXdzNNdjlYdzUzWThtTmVS?=
 =?utf-8?B?K0N0eWVaNFJZdmVrYjRsNWpVQldUM1NjbzU1eW9HcFQzQTEyMzBUTjlhbDVh?=
 =?utf-8?B?UG9IaE5oMlBKWVdvV0U1UWFaVGdDRkVJQlBSTW5XOVFicHQreFVtV0hKSHQv?=
 =?utf-8?B?WThpSmpDK2pYY0Z5bnBiSzFSQkI2RHY0V05BaXRMT0FRUXZDS3pzUENoVkZB?=
 =?utf-8?B?bzVMR3VTSHJPaXFHTG9VL2FwWXVleHFpeEEwUnU5d0R6T0lFL3l4cklvM00r?=
 =?utf-8?B?TkhYaTZDalgvMitPUmRQUGNjSmVWYjMxU0Y1Z2tBSVdadEVHL0pVTFUwc0Y0?=
 =?utf-8?B?ZkVLN1JWaTlMQVhQZTFWR0Z3ZTd2MjdhYmZmQ2JSNU5xcWZNbjFKWGtZMXFR?=
 =?utf-8?B?N2E3L0x3Y2xVcGNMQTBka0syUHNZeDh2eU5wT1lIdHZIY2dRQ2JJb2o2ZXpr?=
 =?utf-8?B?dEZxM3UyaDFqcEtEZzYvSkV0YkJrSUVhd3kzd05MbCtGVk9Pc1FoMHZsdW1C?=
 =?utf-8?B?TmFkY0UzcXBIdWIrcDlKdVRMSXhXSGlxZFVtTEJqMmRVZlk1NmFCQUF1R254?=
 =?utf-8?B?UTdKQ0JUOEl2Q2lRR0w5NGQzU3lVRW94UmExQXJhTXpRcXJJdERzMlM2dDdW?=
 =?utf-8?B?cGFiWDd1NFR2UmVKWlNXMzdtN3VYTUNOWGNoYVdwWktQQXVnc0pVcXpYLzQ1?=
 =?utf-8?B?YjROMUJJL24yclUvc0pldGpuVzd1a0JoNU5UekNYaVhLZzJ3dVMzOTZjWmxs?=
 =?utf-8?B?VEdFSDBmTDJCUGdyM3QyWWkyekR4ZkFiZkJ2dE94aW1KUkhYcWhldEI2cjRZ?=
 =?utf-8?B?ZUxKMzRkaityMlpwUWhIYUNvazhBMGFrWDlJTlpWK3FCTVF5c1JpTDRNQ0Zp?=
 =?utf-8?B?aGEybHkxQ3JKOE1GREx3azliNFc2QTJWV3IzR2tnL0RJSUoybkRjNkhRUjNL?=
 =?utf-8?B?WWRoaXlFbGdLQ0dYQUVBa1FZcXNmK0pFT1FpekhCZEN2eUdObFNXbWJtNElq?=
 =?utf-8?Q?b6K5k9W2oMJUYdf53GkB22E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8099.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzVVd2pyTklnN1VJZlVoYVByMmRPQkpldUgvNy9KZHVPem1HaW9NL0ovc0Fm?=
 =?utf-8?B?cGZzaGlJdGowbTRnZnUyS3R6clZCanFuVjM3RDhKeHlkaTNVZHBNeVdFT3o1?=
 =?utf-8?B?b3VKa0RSSmQ5ZFFISzQ0S3lncTE2a2hRVWdwbE5HRzhmR0tzSHdQU2lJYnZz?=
 =?utf-8?B?UDJubTVwMEo0RnU5NFo3djRmTXhOYS9DeTFiYVF6cmRYM05ySDRtZ2JKWWtI?=
 =?utf-8?B?VXFuOVVkdmdWNGJ3eWVpdVhaOVRYb3E1VFppZlNZQ2p4L25vWTVjS3RLRUlE?=
 =?utf-8?B?dWRpN041eXB0TGlOMUM0MDlOdWR3QnQ5Q2Y3MGdKNVo2UHh4U1R6UHk5OWdM?=
 =?utf-8?B?NmFyZDVyQ2o3cisrYVVXMWtZTlZnRS9Ob0UxcW9jVXlZMXRFeE92aVVXOWsv?=
 =?utf-8?B?a0FjemxPczF5YmE4U0lzcm5JNFMvdUlneEkwd3REcFB4SUhHaFFmb0FmUFA4?=
 =?utf-8?B?R2dyNWpwWEZqRjBTRnVwdDRSbkNyZTlzQ2l6TDBEajNHM1MxbXZqemU4NHhl?=
 =?utf-8?B?eWJMbnBEeENwWVkvbWtEVFFsRG05ZnNqMUNWWHNleG1HVDNnSDJuQ3puU2lT?=
 =?utf-8?B?WDhXMHk1ekxxK1F3d1VlaVFvRkFSOFROMndiS2dNOTlHOFN0bUZMc00wNWhv?=
 =?utf-8?B?a1RGcEEvYlY3TjlwNFAxMjJpaHM3ZG9uVnBGbzJocGdsTlZNTnIzalV1WVdy?=
 =?utf-8?B?TzNZVXZBaUQwNEh2akhzRENxWDBXcjRveHU3RENmK3pVaTVUMWJRWXV5Vy96?=
 =?utf-8?B?OGNuczcxYmdwa3NycUxQTlVZWUJYTUVKbm1wMVdaRnBOeDlHQU50eEZRKy8z?=
 =?utf-8?B?QTlNcmZ2M3MyY05sdUhNYlVXSStYZWRmbFZibis5bFdnVHV1MCt0TVBUTDM2?=
 =?utf-8?B?MVQ4K1pjSzlDbEZ5MzFjTDlzK3ZKWnBmTGxXMitaYjdlUGJyNWtEd1FEOGlr?=
 =?utf-8?B?V0djWlpOaTRxVGNXRGtLSFJvRmdVbDdySG1RM1I5My9WUmRzZkRHNk45R0VN?=
 =?utf-8?B?cmY4c3pvYzlIYlMxNU54Qk9aREtFQU1XLzdWQ05kQThWOHk3TkhSSnJDMHlD?=
 =?utf-8?B?dDhZSSs3V0NIekMvbVBZSVhaK29nTlliODRjUXYxZENpM3BBY1F4VjB5Uldq?=
 =?utf-8?B?eXB1OE5HOXpEVW9taVhMamJGc1pDcTVWbkhEQ0JiM1NSOFdCZUVhWGFzWjFy?=
 =?utf-8?B?Wk93alpiYmp2d3JnZksvVE42bnlqcURlR3ljM0hjTzI3aFgwbkRHL1pUdzhq?=
 =?utf-8?B?aVVjTDZuNE54SXJidUJBVWFzOHV2R2R0cXMxVW9IdkFhRlBnSDVmdldINHpH?=
 =?utf-8?B?U2JTbFdqL3Z0S1VMcDAvbjN3QnJMVjJlMmFQdllXZ3UvdCtQMjROdUpzdmJC?=
 =?utf-8?B?QlV3V1JzYnBDMGRmeWN2R0hTREdUZUhzMkpJV2crMnI2TWl5cFV5TFFyYmVK?=
 =?utf-8?B?aHdzT3RPYzFJbFhtTmZIbkRPZXdNZktkODN1elVmTjRETDlicFB6NWxxdDdG?=
 =?utf-8?B?dG9jNmJSTmJ2K3JRMFZBU2t3ZlphcXZpRWxVdTVmVkUxV29WMHRUcWF1dE9O?=
 =?utf-8?B?cWRVdHpiclNxczhlV2tkb0NwRUhFdXIwcVg0NTdJSHZydFRDem1wRXp6bnVP?=
 =?utf-8?B?azZpWC9PYTBEdSt3QjJIR1NoU2xMU1RISVJ3RFdjTzZpdEo2dlJXdFFNODVp?=
 =?utf-8?B?eTllM3A1OTlTZzdqRUs5b3h3R0tHU1o2MjZBV3dxWmo5OVFTMXpSeGNRdVJm?=
 =?utf-8?B?dStVSXc1cERxVkx0UWxwUlY1bldqb01VM3h1T2J6d1g3R2xvSnNVOTVUNXY2?=
 =?utf-8?B?VW50ZElObmxyYzFBN1Zyc2NCSEoxMnlUN2ZaUmUwR25rbUloZEVaNlV6ZGpm?=
 =?utf-8?B?R0xKc3FBbVRLWTV2OW9aYkZNbys3TkJncnpxRVFEWXp5NlBXL3FWNG8zOGxS?=
 =?utf-8?B?R1lVczZwR2I5YWxFOVlWMWJyM3A2UzFJb3d3NWdSYnpMSE1CMDQ4U3puK1dK?=
 =?utf-8?B?Ny9BNDgyLys1Ykc5NzJ2RU1Fd0xQeFhQUkRZUm0zMUtVUDBKYUhqcWZyRDNu?=
 =?utf-8?B?TXdKMVFjN1lrRTJuZUNlVS9FZC95WEhFd3VTQWRGbXJvNVF0MWxGeFRqemEy?=
 =?utf-8?B?dmZKOG1JZTZRS1ZSLzF4bEs0TjBaRDdMazZFbThCRXFGOFkxVmxXRVpCcTla?=
 =?utf-8?B?YTlmc1RPMlhvWkYybmJaQ1lkRWZraTBtU2R4dVNqVGNYZ2hHS1diVCtVZVVw?=
 =?utf-8?B?UU4yY2xLd3pwenVuRnZDWVE5WVlWamtSYWRmZlVvTmpUdk5ncFJuSGVmQnhq?=
 =?utf-8?B?aHJVaFNhamFVeXVXV0dxdC9OUUhJZHk5Q0NWNkNXbDdWbEx6STM5UVJqWTlx?=
 =?utf-8?Q?NYXdKEpsTlhLiAmM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A77AB6E48039F42973CAD06A7127585@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8099.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b7c185-08b6-426f-a713-08de64bef8fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 14:00:51.6668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JvK/jYfxDG1PkTFx1UIu6Odc2EANwyfZeyBSn61qSwwWdNg1YiK7FtyxGmBJHY0cRdySFlhCgDRDw9owu5bXudqTa66GEEDpW1I4aEi85hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6371
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[christian.lindig@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:xen-devel@lists.xenproject.org,m:dave@recoil.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.lindig@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5F0FCF3B44
X-Rspamd-Action: no action

DQoNCj4gT24gNSBGZWIgMjAyNiwgYXQgMTM6NTYsIEVkd2luIFTDtnLDtmsgPGVkd2luLnRvcm9r
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT2JzZXJ2ZWQgd2hlbiBhdHRlbXB0aW5nIHRvIGJv
b3QgYSA+NFRpQiBWTToNCj4gDQo+IEFmdGVyIGEgY2FsbCB0byBkb21haW5fc2V0bWF4bWVtIHdp
dGggNjM3MDI1NDg0OCAoS2lCKSwNCj4gdGhlIGRvbWFpbidzIG1heG1lbSBnb3Qgc2V0IHRvIDIw
NzUyODc1NTIsDQo+IHdoaWNoIGlzIGV4YWN0bHkgMl4zMiBzbWFsbGVyLg0KPiANCj4geGNfZG9t
YWluX3NldG1heG1lbSB0YWtlcyBhbiB1aW50NjRfdCBhcyBhIHBhcmFtZXRlciwNCj4gYW5kIHRo
ZSBPQ2FtbCB2YWx1ZSBpcyA2NC1iaXQgYWxyZWFkeSwgc28gZml4IHRoZSBDIHZhcmlhYmxlDQo+
IHRvIG1hdGNoIHRoZSB0eXBlIGFuZCBhdm9pZCB0aGUgdHJ1bmNhdGlvbi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEVkd2luIFTDtnLDtmsgPGVkd2luLnRvcm9rQGNpdHJpeC5jb20+DQo+IC0tLQ0K
PiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyB8IDIgKy0NCj4gMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgYi90b29scy9vY2FtbC9saWJzL3hj
L3hlbmN0cmxfc3R1YnMuYw0KPiBpbmRleCBhYzJhNzUzN2Q2Li5jNTVmNzNiMjY1IDEwMDY0NA0K
PiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPiArKysgYi90b29s
cy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPiBAQCAtOTQ3LDcgKzk0Nyw3IEBAIENB
TUxwcmltIHZhbHVlIHN0dWJfeGNfZG9tYWluX3NldG1heG1lbSh2YWx1ZSB4Y2hfdmFsLCB2YWx1
ZSBkb21pZCwNCj4gaW50IHJldHZhbDsNCj4gDQo+IHVpbnQzMl90IGNfZG9taWQgPSBJbnRfdmFs
KGRvbWlkKTsNCj4gLSB1bnNpZ25lZCBpbnQgY19tYXhfbWVta2IgPSBJbnQ2NF92YWwobWF4X21l
bWtiKTsNCj4gKyB1aW50NjRfdCBjX21heF9tZW1rYiA9IEludDY0X3ZhbChtYXhfbWVta2IpOw0K
PiBjYW1sX2VudGVyX2Jsb2NraW5nX3NlY3Rpb24oKTsNCj4gcmV0dmFsID0geGNfZG9tYWluX3Nl
dG1heG1lbSh4Y2gsIGNfZG9taWQsIGNfbWF4X21lbWtiKTsNCj4gY2FtbF9sZWF2ZV9ibG9ja2lu
Z19zZWN0aW9uKCk7DQo+IC0tIA0KPiAyLjQ3LjMNCj4gDQoNCkFja2VkLWJ5OiBDaHJpc3RpYW4g
TGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNsb3VkLmNvbT4NCg0K

