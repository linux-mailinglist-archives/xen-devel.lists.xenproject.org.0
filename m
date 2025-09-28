Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E87BA714D
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 15:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132355.1470721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2rpT-0000Gu-8q; Sun, 28 Sep 2025 13:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132355.1470721; Sun, 28 Sep 2025 13:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2rpT-0000Ev-68; Sun, 28 Sep 2025 13:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1132355;
 Sun, 28 Sep 2025 13:52:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6py=4H=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1v2rpR-0000Eo-QH
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 13:52:42 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dcdc932-9c72-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 15:52:26 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS4PR03MB8747.eurprd03.prod.outlook.com (2603:10a6:20b:576::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 13:52:22 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9160.014; Sun, 28 Sep 2025
 13:52:22 +0000
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
X-Inumbo-ID: 5dcdc932-9c72-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAGXpCFzDHAdMjRl/h6HLNPPbsU89F3lSBWqYPnhOCjdkBCwuopHhRedmn6urR3TdeuZs+PSmyaHKPYCOfJBM3JIUSeaWma3cjWz60Tt+mty2qn+ti0R+LhaVBHL0xaSGrkDfJODD/ttzJq52DiggbNV5QGmEZxRRdEp424F06jfHtRl7bYaJtVjR1gs6yuqFU9gxbL2mi44dEXGjCwa7MP49bEc5rw6QNh7ARzp0E4reNSDPxAVQqQkZjN9qh0BpG6lPqg1oQRIecdnyo9XGLZYUWBki1IeHOGDcPngJ/Vd0lmpdDJpEFs898A4QanP+df6gd2MA4sUXxKbgazdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vm3h0B2lZdw2WnHnSaF7Rb/RZ1Td/i9c7fzDYnGqY9M=;
 b=xVsczoS+JF31G4yb+YSjY6mjfwQO08aQtKCjdHlSRsr/QEqKzAiYDCB5mpq7VFetUrIHLC7Qwb9HRwGnGek63xQpQI2o1ngXOXh3AL2dRDvN8WX31ZqsXivqmHii1KqvelqCMpYcYzIQGLOOlJ51r3JY7n5cp3Cnyl7okyMoI9tUY1JdwvHHQy189aOuwrTJb0Hbw03MOP23bbFxXXZiNXw/oGAYBABzRlNEXfh/bp546VicE2TGvnGnUujTZTQNuTxqzigEhMhywkFktA6aQnRwE2cNTgXb3klsHZPaV0fmBB3os2H0TY39zPoJQA8JUNbgI5Kb4+6H6ddGVUAWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm3h0B2lZdw2WnHnSaF7Rb/RZ1Td/i9c7fzDYnGqY9M=;
 b=B1VOJj5Q2qMOaFq+DehEM/ZZ4VfcN1WOB4s1IwmZsmK7E3jBqTIzwSdb2Y0QoPmmUjF0Z5SXhLgQa+wX+MAqKCtbp9DGVdKxJoomWJ/ItCQDRytQAUM6l1lCU4FdkjuuC+o1WoSGKTKUfe7GUKXjUj6BoM3qUf7QSaaUJVyj6R7rQg+UQV6Iu+OkQ1uat8NFDrVdOqddIEVNQQ8DvFIHtefsuixbn7KNZuW1FgjSz9+Z32qCQ0GvOA03CtgbhiZwWK3kMyJHa8+9ExFWRw4psVcZIFtlbO1RDlbhgBoTYowfKgUJTh8grHHYpzv4utE3W5UBnceVuofgnSwOBR3Xkg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2] xen/arm: Reorder SCI resource cleanup in domain
 destruction
Thread-Topic: [PATCH v2] xen/arm: Reorder SCI resource cleanup in domain
 destruction
Thread-Index: AQHcJXs1K3LqZ5+aqE65C1kspBdxM7SfhaoAgAKQ8gCABUDTAIABW6aA
Date: Sun, 28 Sep 2025 13:52:22 +0000
Message-ID: <557392fd-f676-4aa0-9107-ee48243c336e@epam.com>
References:
 <20ec9d9a8533417489a95543c1b72f7f55865c9c.1757856381.git.oleksii_moisieiev@epam.com>
 <6476dc12-1f9f-4b37-b569-e994bde6bcdb@xen.org>
 <4b1cab53-e2dc-4cd4-86b5-1d1be974d089@epam.com>
 <88a73261-4c24-465f-93df-6f9770046982@xen.org>
In-Reply-To: <88a73261-4c24-465f-93df-6f9770046982@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS4PR03MB8747:EE_
x-ms-office365-filtering-correlation-id: 65a909dd-7e1e-49d2-2a14-08ddfe963fa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bmVGNFhHZnQ1N1lBbDRWVkdPMEU5bVlMbWhUaDRNSXA0eUZPYUFQODdPZDhN?=
 =?utf-8?B?VjlKYmRJNlJTcVBwL2RLaXAyRzZHckxTeVF3OTY4RzVXY1ppN2xQZHRFV01Y?=
 =?utf-8?B?S0hJNGEveVg3cXZlQlROWGhSRWtmTlJITnlpUWpVOUU4Y2Zrc0F3Smx6dGd0?=
 =?utf-8?B?d3hGUmNBQllocnRUTjVJU0FUeXRTd3NtdkVPK2RZYjJCN2FPNnJtM3RoSkVr?=
 =?utf-8?B?RnJvL0I1NkN0NG9HU3NjZHVJa0ZzNEUyTFR6NWNKUVRTRFBWTFpzR0o0VFJh?=
 =?utf-8?B?c2g2OUkxUE15cHptNXV6MWsvZk15MHpCNFFOQ05uUFo3V0NIbUJUUlFWdmc1?=
 =?utf-8?B?djlyQ2ZPcjRGMW1EYVdUTmZWb1k4SGxYTUpDdUpzVm1lcU96YnpLR1h2NXVU?=
 =?utf-8?B?WFBucFJoRzVhVmtlUXlqMTZJbndqbTgwTGN6anZRTzR6cnB0RnZScWxEV01j?=
 =?utf-8?B?RUc4VXJhSzAvQy84TkcvSkd5R2xWMEQ1R3B5K3ZyckV6RzBFQVB1QWtNRkpB?=
 =?utf-8?B?K1E3VlptNm1kNldiS00zNFZ4cysra2V3eFlmcEZON2lvd2FCSlBkc1d0cWpN?=
 =?utf-8?B?aEN1QWN2VEpNc2xTQnJCMDJsT3FNbWdPeGRFdXN0Nmhzd0ZqemRrc3JhdHBr?=
 =?utf-8?B?TVlVNW5XQUVRU2N6R2wyZmxSSXNiS09FL1dOSkJsL2x5MHliRyt0bTFBTDhs?=
 =?utf-8?B?MWs0N3N0UUJKVFZET1l3NUNOcGZ1RWdXZml5TlB1ZklQZDJHSzJVSUxaV2NZ?=
 =?utf-8?B?cm1scHYyZW9nR1ZzTnBMQzJpUUQ2amNHOG4rWmRQSXFJRWY3WG1XRFVqaGEv?=
 =?utf-8?B?QWp5Vm9lZlYzYi9tRUczQTRkUjMyUTJiYUVJSk9XL1ZnT01TZlhsalFmMW5D?=
 =?utf-8?B?cCtSaE1ROXRtSE1XVVc0SVlqb2RFWFJPMWZNd2hFVVoyZG5hVWpiN1g2eFNm?=
 =?utf-8?B?TmV1TU1qT1Z1eGRPY3hrWlpvSjRIUVpCREhNYmM1TnhLcHdnZjFMaHFqbzQ0?=
 =?utf-8?B?alJ3Sk5pb2lpdTF3K3l0aXdRQnRNOWk3cjFTQXRBZldkdGZWYWlLaEErd2lK?=
 =?utf-8?B?ZlMyQmR0d25ZYzJwaEV6MXJjTEI0UEhPV3RCMmtJK1R2WHdQc1ZUbTY4djkv?=
 =?utf-8?B?UWNxWno5dUJoSHd0VzZCUnNjOEY1R2FuT0NTOHdWeEhqR0Y0Mk1seFpXNG1I?=
 =?utf-8?B?bC9QOU5yQkc2d29ZbmtwREthQVVINEFYZmxCVkdzWjl6cFQzR2ZyZ3FPUnN0?=
 =?utf-8?B?Yk1qR0hBaHJvbGVBUkpGOUxKQ2UvYlpoK2QrMjNNdjFYQmpQZHp0K3RqNXo2?=
 =?utf-8?B?aXVjSmhLd0lXSVVsTTRmN0laV2QreGtmenlMTWlIU1pPWk9UZFJ2NDFyK054?=
 =?utf-8?B?RnJxYkNSSVM2bFQ2NER2MjFoaFBVRTJTUDJsTzFmK1kwMVowQytXUUY2MGZD?=
 =?utf-8?B?WUg1NjQ3ZXRJZkZEU0F4bEJIemZQR0gvNGVLZzNKL284VkpMUVZaTjJ0dGJm?=
 =?utf-8?B?TERqaXVWZDRRaUVHNnZsQTFBS3lEZElEajZ6czRhWnZPN1FvZWZTTnJ4eGd4?=
 =?utf-8?B?L0NtNVQzaFQ1MFZHSWFxMzhRU0tlZGVOWllKL1owVUk2SFpBTVNCQytIUUVS?=
 =?utf-8?B?Z2UxSXZTNXI5WVVpK1dCUE5DOWJpazhyQ0NzMkRqdWNEQ0FNbDdUdlhYSWtV?=
 =?utf-8?B?K2dzNVBVa1ZrR3dYSGJCdlRWaDhSSnNLS1lJUElENU5JbWtxM1hTUFllZE5Z?=
 =?utf-8?B?SkhDQnJsNHBmWXlZSGxLTSs2bHloS3NXdnFSdk1pWUJsR3NLVkFFTElYR0pi?=
 =?utf-8?B?NmRCSVlFK0tWOG1uMEJSVmhxK1lQV2Q5UmJMd09zTXRmekFzWTBtc0pLYkRj?=
 =?utf-8?B?WjVxL0poMm9xZWt2emE1QnJUVERpWTU1VjZOOTd5Z2VGYkZBcHg3UFFweXB2?=
 =?utf-8?B?UlI4eVczTjFLU1hvQ0VqWnFybUdYQXRTcysxcS9iNGpad1FhenhHRlYrRGVE?=
 =?utf-8?B?RitEVlBHM1k0TlpsZDd3ZU5TbHhqK0xkOFdDSytKU3JsWTNDYmpHL25yWWJa?=
 =?utf-8?Q?/+misr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjdUbHNaVHFKYmJXVzdITU9HWVBJdWptMytVVFNjTEY5Q1ZvSENHVDNHOEhh?=
 =?utf-8?B?aFdnQ2R0YUgrNXk4ZktIMTkvRlcvMktKNnp3OXlYYjBpMk5OR0IzMERsV3dY?=
 =?utf-8?B?MVlSTnJhM2kvWkRqdU9sMlkwd1Jla2xkVWxmdytWditxOWtVbUdLS0syYnpL?=
 =?utf-8?B?NjQ4TGpaM0NmNmdIbDAxNVNVOElScUlsb2lyMEE3S05PZEhVbU5nazBybjFC?=
 =?utf-8?B?T0RISXowaE9taE1QRExiREk5amNQUitsN1ZGSjVhY3JuTVZNUkxqSW5zUStv?=
 =?utf-8?B?UEZtS2l4enYvMTA2SUFndjJmUktXV2VYcGg2UXRHTHB5UmFyWFlIRXRkNVEy?=
 =?utf-8?B?U2xaMWVCbkRoNmNMZ1NqZDFZV09hQXV2NFVKSEZYd3hvekFaL0VSdGJUUVFu?=
 =?utf-8?B?eVZTUlpUL2pGVEV0eWdxWmduSld1WEVaRWlWelNmbE0vZlpjWDNqeWY5REFl?=
 =?utf-8?B?REhWeHJZeThRRzQvczh0dkFqRk4wTXRSTEl1TmNUT1dIZXl5S1ZjQVd5eGxE?=
 =?utf-8?B?UmFaNGo1RmFRcXBtZG91MHpxc3p2WVg0VGNKTURBSHZVbTNXYU43WW9qRzFH?=
 =?utf-8?B?QW9SYkgrU0lzdjV0MEhmUVBnd1dYV2lLS2VYU01teDNDWmNBZVI0Tm1MeGFu?=
 =?utf-8?B?Tnk2OEk1bUtYNEFRS0FBRUVVTWlhdm5uRkdYb04xbEV0SXloY2tNNGxIK0hD?=
 =?utf-8?B?aUxKZW1jbVRmN1ovNjZ2WFhjSUVzaGRUWEhnSU4rQytuYm5NNFlCbGYrVzVi?=
 =?utf-8?B?Q21tZ3liMi9MMU90YVlEYWwyNDlhc1FLNkRNYndWKzlKUU02UWFrelpwaWVR?=
 =?utf-8?B?UDYzeFI1NEdjUXhkeEpsVitWOTh5T1dPU0FsWXYyc3N1Tm1uQ0ZPM1FLTWNJ?=
 =?utf-8?B?M1JUSU1Db0xiM1dvYkY0WnZrQk04RFBwbnBMbFF0Mk4vWFNMS1U0dHR2MXRp?=
 =?utf-8?B?eUx0RGFGNFdVNkZoKzZFbis3Mnh0SDg2ZlFHQ0w3ZURuWS9xclhrYVpSRThu?=
 =?utf-8?B?QVNUWlI1aUVhb3IrMXdJSEtGdEwyRkNtd0VYd0dmc2lqR0dHYVhaaGtpUWw4?=
 =?utf-8?B?N0tvWXJzZjFvbGZySXcrcDlzRjV3UFlqQTRZcVlrVnJFREpEUHB1RWtpWlFP?=
 =?utf-8?B?NHlvc2ZmQ0U4eFgyQklWUXVDbGZYbEJRZzcwaG94QlRySHg2dUMzMXp6Y1gv?=
 =?utf-8?B?ZDdoUytUZ2E0d09xQ1JCZE00czFkMTJFb3padHNiaDVWVHVsOHdoWlk1ZnFV?=
 =?utf-8?B?OE5kODhDSzJDWXJLdEtSRlFtSDdwZEcyQmtZQ2ZyYTQyc0JhZExNaEFiWGp4?=
 =?utf-8?B?Um9tNFNRMFN0SjBRTTdEb3BOL2J5Y2JIaVpvbHc5TTJ3OE1SRW5ZcE9HdE15?=
 =?utf-8?B?WXl1REs5NnB3ekk1ZnZiUlNRa3V5N1NubUxJenZXaFJRZXNUaFlFb2wwQTk1?=
 =?utf-8?B?U2RoZFlMOWZvNVdaUk11S1I3Wm0xaGtjZlJBaVQ5VCtwNEk2OVBEVTZuQUk2?=
 =?utf-8?B?MElkTmJ4bWN6bktvcERHQmVTNUV6bGhJUW50bm1aVldqVVUvcm1uNjd4VUpQ?=
 =?utf-8?B?MGxyVFNDa2xEZlN4aHAvTkw3ci9zdGwrdUk1MFhkZE5BY1lBNmNhRWYxRDVP?=
 =?utf-8?B?OEdvVWt6Q3dFMWYvMXMxcFpWMk44cnBnWVRhcmh3cFRMVks4cTJKS3pZUHdv?=
 =?utf-8?B?NHZzN1pyZ093S0RVTEYveHRaSUFQOVRaRnI3UEhjRnZNSXRmQTdvNzJtS0Uz?=
 =?utf-8?B?VkUzdVhIQW1CR09kOE5JTDJLMU1iRnRNTFBRc2dHUlVBRFVJa2ZFc1NMU1pE?=
 =?utf-8?B?bmdweERCaG1FUFk5Y1A0NWFNdGRGZmcva05GMDd4ZWV6MzRtSVJVSm5MTkhF?=
 =?utf-8?B?T3FodEthdmJURzlKU2hpQzhjMHZyQ2pPMXFISlVxUU02b3kvVEFrWE91T0Rs?=
 =?utf-8?B?ekkvMGZLQWF4c0FBend5cGU4M29rcURjb2FyTTV6VnpBbm8rUDd5QUMybmtp?=
 =?utf-8?B?aHlmYnRQR1RoVDNhVTBPdHhvSnMzRlczbTlOZ21pU0RWSzE0L2JZTEtISGdj?=
 =?utf-8?B?SHVKbXdJWnRQcFhIV0lodG1QK0lrdVVudWk5SXJZU2xhb0oyZGJheXNvTWNL?=
 =?utf-8?B?WFVkaVB1bGZCQk5taDNTMnlNZlBnZzd4dFhxakQ1eUJ1c09KUmVXQjNjVGlh?=
 =?utf-8?B?NFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36EE86371ADE6043A17545F7D9BA2355@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a909dd-7e1e-49d2-2a14-08ddfe963fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2025 13:52:22.2365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ZMIStpruTptt0JrKjKss55R8NmDtCIGPuV0tP2eN2FcSqaK3pZ+tVtOfxlfwOLid/aUWOkzXfQKjIZQp3w3xVthldCTrtoYPB/gXvsOV+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8747

DQoNCk9uIDI3LzA5LzIwMjUgMjA6MDcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4NCj4NCj4gT24g
MjQvMDkvMjAyNSAwOTo1NCwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiBIaSBKdWxpZW4s
DQo+Pg0KPj4gT24gMjIvMDkvMjAyNSAyMDo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+ICgr
IFJlbGVhc2UgbWFuYWdlcikNCj4+Pg0KPj4+IEhpLA0KPj4+DQo+Pj4gT24gMTQvMDkvMjAyNSAx
NDoyNiwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+Pj4+IE1vdmUgdGhlIFNDSSAoU3lzdGVt
IENvbnRyb2wgYW5kIE1hbmFnZW1lbnQgSW50ZXJmYWNlKSByZXNvdXJjZSANCj4+Pj4gY2xlYW51
cA0KPj4+PiBlYXJsaWVyIGluIHRoZSBkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBzZXF1
ZW5jZSB0byBlbnN1cmUgcHJvcGVyDQo+Pj4+IGNsZWFudXAgb3JkZXJpbmcgZHVyaW5nIGRvbWFp
biBkZXN0cnVjdGlvbi4NCj4+Pj4NCj4+Pj4gVGhlIFNDSSBjbGVhbnVwIGlzIG5vdyBwZXJmb3Jt
ZWQgYmVmb3JlIFRFRSAoVHJ1c3RlZCBFeGVjdXRpb24NCj4+Pj4gRW52aXJvbm1lbnQpDQo+Pj4+
IGNsZWFudXAgcmF0aGVyIHRoYW4gYWZ0ZXIgUDJNIG1hcHBpbmcgY2xlYW51cC4gVGhpcyByZW9y
ZGVyaW5nDQo+Pj4+IGVuc3VyZXMgdGhhdA0KPj4+PiBTQ0kgcmVzb3VyY2VzIGFyZSBwcm9wZXJs
eSByZWxlYXNlZCBiZWZvcmUgb3RoZXIgc3Vic3lzdGVtcyB0aGF0IG1pZ2h0DQo+Pj4+IGRlcGVu
ZCBvbiB0aGVtIGFyZSB0b3JuIGRvd24uDQo+Pj4+DQo+Pj4+IFRoaXMgY2hhbmdlIGFkZHJlc3Nl
cyBwb3RlbnRpYWwgcmVzb3VyY2UgY2xlYW51cCBkZXBlbmRlbmNpZXMgd2hlcmUgDQo+Pj4+IFND
SQ0KPj4+PiByZXNvdXJjZXMgbmVlZCB0byBiZSByZWxlYXNlZCBiZWZvcmUgUDJNIG1hcHBpbmdz
IGFyZSBjbGVhbmVkIHVwLA0KPj4+PiBwcmV2ZW50aW5nDQo+Pj4+IHBvdGVudGlhbCBpc3N1ZXMg
ZHVyaW5nIGRvbWFpbiBkZXN0cnVjdGlvbiBvbiBBUk0gcGxhdGZvcm1zIHdpdGggU0NJDQo+Pj4+
IHN1cHBvcnQuDQo+Pj4+DQo+Pj4+IEZpeGVzOiBlMmNjMTA4NjdiICh4ZW4vYXJtOiBhZGQgZ2Vu
ZXJpYyBTQ0kgc3Vic3lzdGVtLCAyMDI1LTA5LTA0KQ0KPj4+DQo+Pj4gSSBhbSBub3Qgc3VyZSB3
aGVyZSB5b3UgZm91bmQgdGhpcyBzeW50YXguIFRoaXMgaXMgbm90IHRoZSBvbmUgd2UgdXNlDQo+
Pj4gZm9yIFhlbi4gSXQgc2hvdWxkIGJlOg0KPj4+DQo+Pj4gRml4ZXM6IDxjb21taXQtaWQ+ICgi
PHBhdGNoLXN1YmplY3Q+IikNCj4+Pg0KPj4+IFdoZXJlIHRoZSBjb21taXQtaWQgaXMgMTIgY2hh
cmFjdGVycy4gRm9yIHRoaXMgcGF0Y2ggaXQgc2hvdWxkIGJlOg0KPj4+DQo+Pj4gRml4ZXM6IGUy
Y2MxMDg2N2I2MyAoInhlbi9hcm06IGFkZCBnZW5lcmljIFNDSSBzdWJzeXN0ZW0iKQ0KPj4+DQo+
PiBHb3QgdGhpcyBieSB1c2luZyBjb21tYW5kIGdpdCBzaG93IC1zIC0tcHJldHR5PXJlZmVyZW5j
ZSA8c2hhPg0KPj4gV2lsbCBmaXguDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkg
TW9pc2llaWV2IDxvbGVrc2lpX21vaXNpZWlldkBlcGFtLmNvbT4NCj4+Pj4gLS0tPg0KPj4+PiBD
aGFuZ2VzIGluIHYyOg0KPj4+PiAtIHJlYXJyYW5nZSBlbnVtIGJ5IHBsYWNpbmcgUFJPR19zY2kg
YmVmb3JlIFBST0dfdGVlDQo+Pj4+IC0gYWRkICJGaXhlczoiIHRhZw0KPj4+Pg0KPj4+PiDCoMKg
IHhlbi9hcmNoL2FybS9kb21haW4uYyB8IDExICsrKysrKy0tLS0tDQo+Pj4+IMKgwqAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0K
Pj4+PiBpbmRleCAxYTg1ODVkMDJiLi5lMzY3MTliY2U0IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vZG9tYWluLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+Pj4+
IEBAIC0xMDQyLDYgKzEwNDIsNyBAQCBzdGF0aWMgaW50IHJlbGlucXVpc2hfbWVtb3J5KHN0cnVj
dCBkb21haW4gKmQsDQo+Pj4+IHN0cnVjdCBwYWdlX2xpc3RfaGVhZCAqbGlzdCkNCj4+Pj4gwqDC
oMKgICovDQo+Pj4+IMKgwqAgZW51bSB7DQo+Pj4+IMKgwqDCoMKgwqDCoCBQUk9HX3BjaSA9IDEs
DQo+Pj4+ICvCoMKgwqAgUFJPR19zY2ksDQo+Pj4NCj4+PiBDYW4geW91IGNvbmZpcm0gdGhpcyBp
cyBmaW5lIHRvIHJlbGVhc2UgdGhlIFNDSSByZXNvdXJjZXMgKmFmdGVyKiB3ZQ0KPj4+IHJlbGVh
c2VzIHRoZSBkZXZpY2VzPyBEb2VzIHRoaXMgbWVhbiB0aGV5IGFyZSBub3QgbGlua2VkIHNvbWVo
b3c/IEZvcg0KPj4+IGluc3RhbmNlLCBpZiBhIGRldmljZSBpcyByZS1hc3NpZ25lZCB0byBhbm90
aGVyIFZNLCBjb3VsZCBpdCBmYWlsDQo+Pj4gYmVjYXVzZSB0aGUgYXNzb2NpYXRlZCAoPykgU0NJ
IHJlc291cmNlcyB3ZXJlIG5vdCB5ZXQgcmVsZWFzZWQ/DQo+Pj4NCj4+PiBDaGVlcnMsDQo+Pj4N
Cj4+IFRoaXMgaXMgbm90IGFuIGlzc3VlIGZvciBhIHNpbmdsZS1hZ2VudC4gVGhpcyBpcyBiZWNh
dXNlIHNpbmdsZS1hZ2VudA0KPj4gZG9lc24ndCBpbXBsZW1lbnQgcmVsaW5xdWlzaF9yZXNvdXJj
ZXMgY2FsbGJhY2suDQo+PiBGb3IgbXVsdGlhZ2VudCBpbXBsZW1lbnRhdGlvbiByZWxpbnF1aXNo
X3Jlc291cmNlcyBpcyBkb25lIGJ5IHNlbmRpbmcNCj4+IFNDTUlfQkFTRV9SRVNFVF9BR0VOVF9D
T05GSUdVUkFUSU9OIG1lc3NhZ2UgdG8gdGhlIGZpcm13YXJlIHdoaWNoIHNob3VsZA0KPj4gZHJv
cCBhbGwgYWdlbnQgY29uZmlndXJhdGlvbiBwcmV2aW91c2x5IGRvbmUuDQo+PiBJZiB3ZSBzdGFy
dCBhbm90aGVyIFZNIHdpdGggYXNzaWduZWQgZGV2aWNlIHN5c3RlbSB3aWxsIGFzayBkZXZpY2UN
Cj4+IHBlcm1pc3Npb24gZnJvbSB0aGUgZmlybXdhcmUuIEFuZCBpZiBkZXZpY2UgaXMgYXNzaWdu
ZWQgdG8gYW5vdGhlciBhZ2VudA0KPj4gLSBlcnJvciBzaG91bGQgYmUgcmV0dXJuZWQuDQo+DQo+
IFRoYW5rcyBmb3IgdGhlIGRldGFpbHMuIEZyb20gd2hhdCB5b3Ugd3JvdGUsIEkgc3VzcGVjdCB3
ZSBtYXkgbmVlZCB0byANCj4gbW92ZSByZWxpbnF1aXNoaW5nIFNDSSByZXNvdXJjZXMgZWFybGll
ci4gQnV0IGFzIHdlIGRvbid0IGhhdmUgDQo+IG11bHRpLWFnZW50IHJpZ2h0IG5vdywgSSB3aWxs
IGNvbW1pdCBhcy1pcyBhbmQgd2UgY2FuIHJldmlzaXQuDQo+DQo+IEFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPg0KVGhhbmtzLiBJJ20gcHJlcGFyaW5nIHBhdGNo
LXNlcmllcyB3aXRoIG11bHRpLWFnZW50IHN1cHBvcnQgYW5kIHdpbGwgc2VlIA0Kd2hlcmUgaXQg
Y291bGQgYmUgbW92ZWQuDQpTaG91bGQgSSBzZW5kIGEgbmV3IHBhdGNoIHdpdGgNCiJGaXhlczog
PGNvbW1pdC1pZD4gKCI8cGF0Y2gtc3ViamVjdD4iKSINCnN5bnRheCBvciBpdCBjYW4gYmUgZml4
ZWQgaW5wbGFjZSBkdXJpbmcgY29tbWl0Pw0KPiBDaGVlcnMsDQo+DQo=

