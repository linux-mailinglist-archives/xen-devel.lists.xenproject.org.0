Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C791EB0EC8C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:58:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053425.1422228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNG-0006m0-QT; Wed, 23 Jul 2025 07:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053425.1422228; Wed, 23 Jul 2025 07:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUNG-0006i3-It; Wed, 23 Jul 2025 07:58:50 +0000
Received: by outflank-mailman (input) for mailman id 1053425;
 Wed, 23 Jul 2025 07:58:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueUNE-0005y7-9X
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:58:48 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc0be1cc-679a-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 09:58:46 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB8082.eurprd03.prod.outlook.com (2603:10a6:102:231::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 07:58:39 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 07:58:39 +0000
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
X-Inumbo-ID: dc0be1cc-679a-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWJjSePKYLlly4iWimuSb4A4m2g4Dpm0pZQaU4cqblZJqhGJopGL5nrSRJnIeBZLGv9BuVNlDw09M8GWByrlhfqKraFzjwjz8+juqTwz7b15jVqYbYsozJLNcGB950leYEMEu8rUR4sXGGybA+wr2FoE93827HeSYDkE2oE1v60rbIMOSwlXz6dJ9FTtRBxvAWNym2lnZ6U5CNW4EGMOdGH4IN1TqoCubVElFckbLdtYudZtPFQoZGcBA2HprV2bxBPg+PIH539QfBHXcQq4ePfTG43qJWNp3etDzO9jszduhKtK4J3kQ9NlvuMdZIpjdmWwA6wi/hj1TxyMeF09yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVrJepCdK2qeD3Vw4Ym8a5iZ1GJnh4JsmwfYpkDnpno=;
 b=AoJWVMJucv5ugwHA7BIjgTSIFi5C9Gd+J+2jC/hta33a7GOEk0VXK+n/836VTDv9uqx5ptNHx7Mf3qDXr6J3HnsO1lMU8Nl/RRB2qoVEF9N0N0NojVczU58es3LgIoUdJ9tsnDqNy48t2UVCVQsBNHvnCv03FC7HXMbiH+fZMuS/8RLS1zGa7icHA/kAXf0cidnfLJ+R/T9yiE4QaXiUKbse/cJZDlKgM16YyuiWRjNPCeRa3AcHO3e/5oGVVkkx1QVythZ9KTMzKfUqlK+vsbWSByRzMJt60O1hoTw3MIzzWnZs3E4P4E30+dAEk+282ICkEJ3prTba6zhRul19ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVrJepCdK2qeD3Vw4Ym8a5iZ1GJnh4JsmwfYpkDnpno=;
 b=CdjwsEufSfR1gl8XcW9rBJEJTAGTS4/SEZgpINnYdiu4/03tCduNAAr0WPsx77zbXlybUsJsCCsNIhLp9O0ihLpJgWcRLVwrCKp488z0O8aQByTRcQ5QZHiIRIRg/nk6noRVualhLYvmb8Z4/R0r9QVfBoqINDIQRtJgNygDWXklRqs6rUH5OtF5mfVYVmWW1NQs90kv+wwIzcGBu6GmQCkW0YvXfwmT1fmQefT9OYr/edl1rA17fn+MLwaf7ZByvWX6KMvTOpSICxGumaNPqHjsHYdFd7OyCb7X48In29Tpb+uuV3D20S+rHmveLpNQ2sXwsaVy23hKExzxEepZKg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [XEN][PATCH 6/8] xen/arm64: constify is_32/64bit_domain() macro for
 CONFIG_ARM64_AARCH32=n
Thread-Topic: [XEN][PATCH 6/8] xen/arm64: constify is_32/64bit_domain() macro
 for CONFIG_ARM64_AARCH32=n
Thread-Index: AQHb+6eZp7ZaicRQ9U+5GOzzbG4B7A==
Date: Wed, 23 Jul 2025 07:58:39 +0000
Message-ID: <20250723075835.3993182-7-grygorii_strashko@epam.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
In-Reply-To: <20250723075835.3993182-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|PAXPR03MB8082:EE_
x-ms-office365-filtering-correlation-id: 7a66bf8a-a04f-4100-6caa-08ddc9bebc53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVRFMlIyZW0wKzVYZVBxNHZEY2FWWEVFK0E4T2I2ZkllazUwU3ZKRDZ2UDFF?=
 =?utf-8?B?MW5GM1hZaEdReHp6ZWlncEhJUGpsRHY1UzdpUlhQTUhiYTVKZ3J4ZEx2aVBE?=
 =?utf-8?B?QXdyNmt3c1o5dGVvQXhOSHRWdEFEUW5pcWJiaDVOMTZ6SGREb0lOTlpvdmZS?=
 =?utf-8?B?QkF5dlVkMEZOc3R3U1I1SVdXV25ac2ZlSzZ6d3VJbU5FOHgrTDhhcmJKNTlI?=
 =?utf-8?B?ZmhpWlpTcG9EaTBVQUk2S2JIdFJnYU5PL0JrOFBka2VaMVBBUnRvVlNaR3lv?=
 =?utf-8?B?L28wZkVma1dMVi9rdTAxWSsrd1NwY0Fpa3FHRVJ2aDNWOUNMd3YzWEVLbDhF?=
 =?utf-8?B?YkdzNDNnalBJVWtvOGpITHBnandBc0FmdWFVcWJWY09JclpPWEJjMjBjeXJx?=
 =?utf-8?B?SnltWmpybEpFbW9NNVZMSWt1OCszMWw2c1VOS2NEdnFHRnp0cVA3bXVMZHlK?=
 =?utf-8?B?SnVZdFNZSlR2ZTNndi8yRlVxRGhSMkNrdVovQUpObVNmMVNUL2pZWjZ3KzM5?=
 =?utf-8?B?MUpHUmNzc2JMMW5vdzRLcHMvT1VBZnNRVWlXd1hjZW00NXZPTGRacWhtMy9T?=
 =?utf-8?B?UGJPMVU0UEZqQ0x5bWRUSWl6YXlhRm0zWTZXQVROeVJoSjh6bi81b055TGNn?=
 =?utf-8?B?dWs3dVI2WDFMaldBeHcxai9qOWtXcG1EOFVRT2ZYZStsbC9DWnZkdzFSYjl5?=
 =?utf-8?B?aFQzZXI2UEI5SzlEZHc3VjhkVnFCTnRqNEt4bk5aNDMwamtFOEVwTDY0azB2?=
 =?utf-8?B?WmpRcVhxaEw1VkE1MElWeHY4dVorQjRlS3UzV3hsZVpId2ZtMi8rcU9hSStp?=
 =?utf-8?B?aTlmSE9kY0U1cmthbi9weDJ2K3kxR0tjS0lVOVZKdXZZRzVEc0ZrckFWUXY3?=
 =?utf-8?B?K0tBRTh2cEFENllFaE96MlBQTXI5UVk1anhpMWZ2cWtJUkQ1d2tsYSs3aDFK?=
 =?utf-8?B?ZlBCaU5KdkdaM0p1SzVhWERobzFoVXp0MDQ5K1Qxc1pqOHNUcllMaU5XZW9M?=
 =?utf-8?B?Y0NVa0FJSHBYQmxvcFFQc2RCdmFnNXJPMlZqRWsvaFp1ajRJZUp5UlluMEM0?=
 =?utf-8?B?OWNOZTdhSy91M3JxbUtEOU44Q2JZRmNwZktBdW1OZmhMSDU5NEJxUUszb0dI?=
 =?utf-8?B?OTN0cFBFbS9raFpXTGtVV0tOSG5oV2JGYXhvUjROM2EralVxZzBLc1c3YnVY?=
 =?utf-8?B?dFk3c095WS90eURmQk9pRmZnSzVJUFZ6K2tENTMvNEF5R2I2Mk16L1dySVRy?=
 =?utf-8?B?ZER0dy9SdjdDTnIrK3hhN1V1RitpdmJBUUdOTXNZYWhGbUpOR1FwRVdSSURV?=
 =?utf-8?B?QjJQeUpYZ3JuWXBScjhoMXcxRTZOQmFsdmFvTDRseFptbVlWL0J5OVNjK01E?=
 =?utf-8?B?VTAwTHNxekY4WkgrNDBxRXFNNHVJNDlyT3hwK2ppRk9sK1NPQm9hT0NHSHpJ?=
 =?utf-8?B?Z1BiSUNkdXNMdWxTWFFMdkNOSSs0cTBLdTJ5MWVLQ2dEeW9DYjhvbGpEYnZ6?=
 =?utf-8?B?QUFTUWdTR3J3OCswK1VWcWlpODJ3TUR2Rk45MlNRdHdVaXFUbFk5QTAxTFVy?=
 =?utf-8?B?clhCQmdXSWwrUWlyY0lJdXFodVQxdW5RRk80bmh5S0hrMVFtc2tmWlpqL2dm?=
 =?utf-8?B?Ky9rNVAxZVhEWU50M2NDSWNLTVIwUjE0WHZqMlBaZzN5SjZpU1hoZlZ2VFZz?=
 =?utf-8?B?VjVPc2lNUzROdHFvbVVtd3Zjd0VnMGJ4RDdQOTVBRUFna3JLNkx6a2pNUGZj?=
 =?utf-8?B?b2dCYUVrZ29KODdSbFpaZ2x6aWV3QUYwRUNzdzlRMUp0Z0ZydW9GcGpZUkVG?=
 =?utf-8?B?OUdvbUFJWmU4MFdaK0sya28wc2VZZXNXWmpGbTNMcjhuTFVpSGdNdE5HVi9u?=
 =?utf-8?B?cGZTK0FvVDl5UTYrVE5ldHNtOFAxOFNxZjFYK0RFNWk2ZXozaTU5Q2c2c0xU?=
 =?utf-8?B?L3NCand6U1BaYkN6cFlpZG84ak5Ld1p3WXUyVjRRbkpDMzcrTndHT0QwNEc5?=
 =?utf-8?B?Y1JLRmxSTVlBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnhUcWRoWmdxbTFHdGlzcHdDR3h6cWtDN1ZaNm84UzJ1NVRHWDBDVlpmendT?=
 =?utf-8?B?K1RuNnpNRFoxb1YyVmpSV3c2TEhabkk5UUpKKy94UWNDTzF3TVUrNGNqZTBV?=
 =?utf-8?B?VDZ0MzRtVmxkU1d4aFlzaVZXQ2VIY1VqUGt0SU1oZk0zVXczcFZBSEp3Rlgw?=
 =?utf-8?B?VTZJMHlwWDhKcnltOXhVSHV2V1oyWVc0MVdyakdBWXIrYUE1bDZWVkp5VWxV?=
 =?utf-8?B?aS9SbGMwQll1azJUUHEwbml4bmo3MnE0SWxINFJiQmdWQ0I0Nk04d09Nc2lQ?=
 =?utf-8?B?Y3ppUmxsak1aYmw5djRsVVdMUjBhWW9kNjVueDdHY2FYRmt5UUcreDdIRWhC?=
 =?utf-8?B?N0FvMlpQaWxmY3phc3NxRmhMSU9WVURqejk3em50Ly9UZDdNVXFnVHhCMFh1?=
 =?utf-8?B?V1NNNVo3dENFVk4zY2I5QUsxOVdDdXJ5V0Uydys1T05VQlBJR2tJc1RoSTNG?=
 =?utf-8?B?NXNlTStnQWwwYXd1ZVZSSENUMG9pRjV3ZjF6NzFsdWZjZllaTFBUNjZYUXc3?=
 =?utf-8?B?b0ZuTmptV2VqWG45a2lTa3JjZGpiOGJMYXVGMTdvTk5DaElCcW0rUGp0TlIz?=
 =?utf-8?B?RzRhZktON2tQZmNzbWkwdStBU0orbjliNGs3YkFER0UxUU9VK2FxM01zK1U5?=
 =?utf-8?B?ZmVmcm5uNndITUI1bEszK0tzc1k0a3RyZzRyMENQWW90WEVqYytaZG9pYnhs?=
 =?utf-8?B?THFKNkoyY1UrQUJlMXlaRmR6MXN0TnAxeXZVdmFGYUh2bXlWRVBxdzdMREky?=
 =?utf-8?B?OTMwYldTTDlSMG9YWnpHNlpCV3lwZm1HQVpWd2t5OVF1RU1GVGNBTVJFMmNv?=
 =?utf-8?B?dk1NcXU3VUp1cDZmZG10b2VQZVBaV0dESStjY2Jtd01DMkFrWHB5eGo0ZzBv?=
 =?utf-8?B?b2pyVVUrbmtnT1NPK091UWhsME81VkowK1JYN01LYVBIZ042V2RIUVFYVzdO?=
 =?utf-8?B?c01rbmZxYWtNTEhkaUhmdXMzLzZoTHVrMm5wVGhOVWp0ZWlmcUFJS3ZiYnRU?=
 =?utf-8?B?NVVEdXFubWIzS3VnK3NhZ0V1OVphWHFVWE9pb3VRVVdPVFZ3MVFBb2RCVktE?=
 =?utf-8?B?eEhuT21XaHRQdDJvbjlibG5BZlZHalVqMUdBbCtNREJEQXZIM2hpSkh6cUNP?=
 =?utf-8?B?dWpJRmIwSE9sZThCSGtTK2g0czdRd1Y0dDVLRVN6WE4xakZpbzY3TVJBNGdW?=
 =?utf-8?B?NDc0bGYrTG9WeG1HQkZWWmI1b21NZkJOeGtsNjNtSUZCQTlCYm1WRmRmTzNF?=
 =?utf-8?B?a1Nwa1lNZ01kc1RwdEovNno0cnI5Vk1xcHBXUmRveXlaNDJYZ05Lc0NvbXA1?=
 =?utf-8?B?UTM0WEJuc0E4WjFVZlAvb2I4ZWJzbjJjODd4eWRoTFZvWTQ0czZxTkc0OFRZ?=
 =?utf-8?B?WVlHcWR2cTZSbnMwMjJFWjdNOURFRm4rMzRpMVpya0l6T0p2ODRKUkIrenRB?=
 =?utf-8?B?TkovNGZGZW9SL1VIakpoNG41VmVBZ1ZXVWZhelo5bEpoRkxIaEV5SUVzemU5?=
 =?utf-8?B?RjUvMEl6WkJPNjJxRHc1bHExamt5dVFLQ0FlQzlPTERPTzVlTEpoSjVON05E?=
 =?utf-8?B?bmVFTVI0OVV4eEg5YVQzSGN6YkozUkovaDNIOTJuc2lPNVRvRGs5OSsvWk1p?=
 =?utf-8?B?djFQY0pIWkw3MzRYVTVBZXNIYW00STJxQXhJZXdYNXhyYnpzQTYwRTBabktk?=
 =?utf-8?B?WjRSUVlQcDVPZ3pqU0ZybFphaE8yS1pDRjBjQnI5TGtPT0dzaXBLYkNDR0tU?=
 =?utf-8?B?Z3IrSHpBTmVZOURMamJoT2wrdnl1QmRjZ01weVg2RytGZnZHN0N0V0ZNbTNk?=
 =?utf-8?B?RlZKUWt3aE5MeENtaS9pVXlOQTdTa2x2VDdNbmRIVG5iMy9lWndRVFF0d1E3?=
 =?utf-8?B?RTJuMnl5aXZQbmNUdHlkeFEyYTQyZWdpMXdtNU1VTGpMdDZiK0N5M1hELzND?=
 =?utf-8?B?cXczc0NSSU9rZmRWOTh6QWFYa01IWUs3bllkR2x3c1hmUml3bFhuMmtoMjls?=
 =?utf-8?B?NmdCQ01VdnAvQy8zckJEdURCZFV6NFFabXVmZCtUWUFlNFo5cnhaMUMveXFr?=
 =?utf-8?B?WHdnUkprRThKRUVTelRjY2dVYjBYSlhCVCtaWVl3bE5rMVh1TjRsY2hHWm1a?=
 =?utf-8?B?eEYyRDJ2djhqcG9JeXd2dnEvVnViU0w1ZHVXV0NYWVljK0VuUy9aR2hYNHVx?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11176C20BCE47A4D8FEA51672F5565E0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a66bf8a-a04f-4100-6caa-08ddc9bebc53
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 07:58:39.6663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTZvXbJmuy/LwVy+TkEEZ085QXumPQVm4G4+1jfqvYlIEzAJ+xKJYeIQBUH+lsjM8IGH3RWzGDq/1I/u9/I/AtYV1vqtfzffqZCssaVgSXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8082

RnJvbTogR3J5Z29yaWkgU3RyYXNoa28gPGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tPg0KDQpD
b25zdGlmeSBpc18zMi82NGJpdF9kb21haW4oKSBtYWNybyBmb3IgdGhlIGNhc2UgQ09ORklHX0FS
TTY0X0FBUkNIMzI9biBhbmQNCnNvIGFsbG93IGNvbXBpbGVyIHRvIG9wdCBvdXQgQWFyY2gzMiBz
cGVjaWZpYyBjb2RlLg0KDQooQ09ORklHX0FSTTY0X0FBUkNIMzI9eSkNCkJlZm9yZToNCiAgIHRl
eHQJICAgZGF0YQkgICAgYnNzCSAgICBkZWMJICAgIGhleAlmaWxlbmFtZQ0KIDg1NTIzMgkgMzIy
NDA0CSAyNzA4ODAJMTQ0ODUxNgkgMTYxYTQ0CXhlbi1zeW1zDQoNCihDT05GSUdfQVJNNjRfQUFS
Q0gzMj1uLCBDT05GSUdfRVhQRVJUPXkpDQpBZnRlcjoNCiAgIHRleHQJICAgZGF0YQkgICAgYnNz
CSAgICBkZWMJICAgIGhleAlmaWxlbmFtZQ0KIDg1MTU2OAkgMzIyNDA0CSAyNzA4ODAJMTQ0NDg1
MgkgMTYwYmY0CXhlbi1zeW1zDQpkaWZmOiDiiJIzNjY0IChkZWMpDQoNClNpZ25lZC1vZmYtYnk6
IEdyeWdvcmlpIFN0cmFzaGtvIDxncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNvbT4NCi0tLQ0KIHhl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC9kb21haW4uaCB8IDggKysrKysrKysNCiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vYXJtNjQvZG9tYWluLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJt
NjQvZG9tYWluLmgNCmluZGV4IDE4NDAyYWUzY2EwZC4uYTAxNGFiOTk2N2FjIDEwMDY0NA0KLS0t
IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L2RvbWFpbi5oDQorKysgYi94ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvZG9tYWluLmgNCkBAIC0xMiwxNCArMTIsMjIgQEAgc3Ry
dWN0IGtlcm5lbF9pbmZvOw0KICAqDQogICogQGQ6IHBvaW50ZXIgdG8gdGhlIGRvbWFpbiBzdHJ1
Y3R1cmUNCiAgKi8NCisjaWYgZGVmaW5lZChDT05GSUdfQVJNNjRfQUFSQ0gzMikNCiAjZGVmaW5l
IGlzXzMyYml0X2RvbWFpbihkKSAoKGQpLT5hcmNoLnR5cGUgPT0gRE9NQUlOXzMyQklUKQ0KKyNl
bHNlDQorI2RlZmluZSBpc18zMmJpdF9kb21haW4oZCkgKGZhbHNlKQ0KKyNlbmRpZiAvKiBDT05G
SUdfQVJNNjRfQUFSQ0gzMiAqLw0KIA0KIC8qDQogICogUmV0dXJucyB0cnVlIGlmIGd1ZXN0IGV4
ZWN1dGlvbiBzdGF0ZSBpcyBBQXJjaDY0DQogICoNCiAgKiBAZDogcG9pbnRlciB0byB0aGUgZG9t
YWluIHN0cnVjdHVyZQ0KICAqLw0KKyNpZiBkZWZpbmVkKENPTkZJR19BUk02NF9BQVJDSDMyKQ0K
ICNkZWZpbmUgaXNfNjRiaXRfZG9tYWluKGQpICgoZCktPmFyY2gudHlwZSA9PSBET01BSU5fNjRC
SVQpDQorI2Vsc2UNCisjZGVmaW5lIGlzXzY0Yml0X2RvbWFpbihkKSAodHJ1ZSkNCisjZW5kaWYg
LyogQ09ORklHX0FSTTY0X0FBUkNIMzIgKi8NCiANCiAvKg0KICAqIFNldCBndWVzdCBleGVjdXRp
b24gc3RhdGUgdG8gQUFyY2g2NCAoRUwxKSBmb3Igc2VsZWN0ZWQgdmNwdQ0KLS0gDQoyLjM0LjEN
Cg==

