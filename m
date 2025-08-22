Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A24B3256B
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 01:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090644.1447769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upbDH-0003cU-9a; Fri, 22 Aug 2025 23:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090644.1447769; Fri, 22 Aug 2025 23:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upbDH-0003aE-6f; Fri, 22 Aug 2025 23:30:27 +0000
Received: by outflank-mailman (input) for mailman id 1090644;
 Fri, 22 Aug 2025 23:30:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HljN=3C=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1upbDF-0003a8-0k
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 23:30:25 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f90026ae-7faf-11f0-b898-0df219b8e170;
 Sat, 23 Aug 2025 01:30:22 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM0PR03MB6129.eurprd03.prod.outlook.com
 (2603:10a6:20b:146::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 23:30:20 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 23:30:20 +0000
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
X-Inumbo-ID: f90026ae-7faf-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1f870HlgQEupDOQiJcKWUdeG6J80k8FUbbVeE8TCI3RpmqClH6CxEcC+Y3f8ZXPgL1vee4G6JmKGhB2WflZ1owiN65NK4IhROIKxoYqLhH2XOZL7V9stpplyt84fk+fkpI+ZQMTP1NF1CWK3JwUSIcY/mr2az10L5ClTENdVeCs6Y5aIQJnAqLthxo/ysVsb5Mg2SE+d4i7O7rf/WyMNi5uQRED49k+STlnrbXZnwQIUbshpxj5TLE3k1NOaVKVt3rf0Q+u1DVmrTSXGfmkz/bqNlHQ4JM8Q0YlQY2vvyb8YDD19rfXnirzXmvCdOfXMlM+AUujOLL6t8Ri0M8gUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KW6zq0HoRO2VR0slwjiAA/4SectRuzoph2OzBWr1A98=;
 b=bY2BDuyXdRVno1vOZgVaWtocDEGw4wtSeUh7+MyVb1uu3uHjGk4DIAyGRwXJYsWc75lXNXr76QbEzGMHfZZsGrU6D9CI4AJ30XUxwgmNm/IvRyb7pFW8gwcM3YAZLOIAqUIFmyYr4T6hxTitZwaTkjcE+9MRDxQg3c2ZWFYjJEdn6v8tHDzDB6D4LIEzUNymV/jqjsVAi+b8qE1vrZYou+/VWtyOVmJr/C90cEBI3WiVPq2Y9A8TIr5WkqJfDMU7PgQn61MAN0qUd1uk7C1xslkIAtuXyzIt5bZu3nIltlJ2qd+2t73f0HbG44XsKvTz6xs7CpXnOviNXIomKI3zqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KW6zq0HoRO2VR0slwjiAA/4SectRuzoph2OzBWr1A98=;
 b=GMGexbr3ypONzh8ELmH1DuIPxqMJgbhZv4Y3Doo/lNT/TojMBo/urIGWX3HH/DjvoD1dC9q/Pti8b4/+HlNvgXrCFnA0ed22rkQXlSshxHWxOkJOzwQ67bOUniaCFEmxCM4VAM7nXs0LFk9ZH0ZdHUqoJt2kvrKZlS0Jhs40ExCTeFG8Kzw6zFR2vWp8Le4l7paN3OhKFbY+BO2suobxZ0DJL1zyD9qeHNhBwgtHMVeXA7vsR2rh2C2iZpO0eX4VCENcHcHH0N1+duWGo7mOpbiWzoxeRybQc1UWVf/pwHoTuHMdZjxCKnHpsQPT5zPYLK6+BgPdlyAN4axh0RAkiQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v9 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Thread-Topic: [PATCH v9 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Thread-Index: AQHcEB0Xn+shUJCmLkyEBRYwomJTeg==
Date: Fri, 22 Aug 2025 23:30:19 +0000
Message-ID: <87jz2vaq9h.fsf@epam.com>
References: <cover.1755506449.git.mykola_kvach@epam.com>
	<205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
In-Reply-To:
 <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Mon, 18 Aug 2025 11:49:24 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM0PR03MB6129:EE_
x-ms-office365-filtering-correlation-id: 44682305-eb99-4ea6-324f-08dde1d3dbcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ePFUtMprjiwhvmIMcrctnDLI7tNNgr9+M+H0vgV0OESj9z1pku59RcpOMG?=
 =?iso-8859-1?Q?APDIqb9d14Kv9VAHWzKLwxtStnmGQpAKLGpYUVM/SmFJxcrH4kV6BVA9BL?=
 =?iso-8859-1?Q?yplCvJTrc95nfiTEikYQcPugmOp2nPlQKB7iM5Rd9XWQJCsExNPkw814B5?=
 =?iso-8859-1?Q?JbB0OmpQLN+uwtqfub/YTjY7A/xJLI0c/QB6ToihmEE7L2yLujrOtc+xAH?=
 =?iso-8859-1?Q?8pvO6sekLkaRY/fjvdtKplt+aqGBD7EiIuUwUBk7W9O8joy6Y86/VnQP1G?=
 =?iso-8859-1?Q?3heV9AYrM9kVJ40Xa4V154dXAvLsttfhOf0bc8pjDk5U4OQAEnMtaFE3gy?=
 =?iso-8859-1?Q?MYD7yTxTQt1qRevf/A48A1AnA4DYDtnsHtpDlAg09oLo8lq1YVLeRnso6Q?=
 =?iso-8859-1?Q?QcFJmC48wSgXkGERg54DI7oCaW4lP6iQ+IRwWGZhCLbebkEk2raKlpus1s?=
 =?iso-8859-1?Q?HfGtGqq6wlsXrij4Cs65hfvjjLkWgr9PQtzJSTogu+m+V+hCSQ3o3+S4F3?=
 =?iso-8859-1?Q?Mq/Tv4ojCtUIyzQaMnJRs1zWEdSLl+BZrhbhM1Nq6J4TIM7UV31kPEWwKm?=
 =?iso-8859-1?Q?c8idgGLHFZanKs2Cpu6PcLOa1Ty7qSa5CT8qdwu991lATcRKB3TA9nAklf?=
 =?iso-8859-1?Q?qlDS6xtgmjxuUaKq0cIrwFeslxOoNnA1P40bWGxLDMC3JF8T7B9cVFycRj?=
 =?iso-8859-1?Q?86WDrtY1VgDj8pgqslaN/l1V1RJ+jMr2kijQyT3UqB7oj6T2dwGnbsgmmu?=
 =?iso-8859-1?Q?D1NJ2iTppecBGJE6MRAWxQ09lzan+QGLL2F1tkL7iSbDQdyum+rSNmFXAS?=
 =?iso-8859-1?Q?W47SRqFLBa2emyjI7UO8jT+CYEisupg8bqgEQS9YhM+ZkRIFFNz0+nQ65l?=
 =?iso-8859-1?Q?/SRwddMg+KCdf+aP8UIgOxvNgoMBnJxPumABRfztavu1MsZivXgl6PJgKa?=
 =?iso-8859-1?Q?OGjK0sl3I0IxGnS/3yKDP3j0aCfsVQGL6bEuvyOp1gt4BurM3jnZ3Iwwc0?=
 =?iso-8859-1?Q?g2hWNk+1PHdD+wjLIENQQeoGuSQ/HPT0vjVDr16PhfAbEbWgCzz4BwtAfi?=
 =?iso-8859-1?Q?qSNza2On/YT3Cledf9n9wHgSxAsVK9ldfQR+ISpIVPvh8ptsREqEIhTfRx?=
 =?iso-8859-1?Q?6eWjpDozZs8v2XtV6tFDxanWmn3/wSqysivu4Z3Akd2248J1am8owakg9h?=
 =?iso-8859-1?Q?tAsdVFT+Wv9gPfh9Ls+U3//rpQp/1Fs1KqfODtBf0STTbDTF/RYaGOtVMR?=
 =?iso-8859-1?Q?r87r29XjncIVcWZ2x9QYoNput0Ee9bqzodZ97T8Ysa5gfyU+rU0srUwumc?=
 =?iso-8859-1?Q?oAV5CNU4CrPFIS0zWcf4/79gSry5QtgFp+jddyzmE2+0EI1hcaJTfL5sS1?=
 =?iso-8859-1?Q?+hhLiBmrQTWXvx9nCj/rZrdunzmUawn7RSUDKOjyhGSBHGbYTIi0AkuS/Z?=
 =?iso-8859-1?Q?puxe0yGc3x49Fl5sbrSGt5QAf5insP0NKSV2f2t9I+JtPyMfEQbbKxKDgB?=
 =?iso-8859-1?Q?BxEObIbogPZMDeUeabGDZB3h6y+1gzH7Q7ysGlYeokWA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IWifQ2gxDLO5RLuiRLtJIGVg1K+BfNIaY4oHQqtI8OT/Yw/FhwKcVJiNHx?=
 =?iso-8859-1?Q?yO4SbljmfOwZG67/1wUpPDNA325NhBCr1od1Ui4kUapEmhQfIbm1xxFrST?=
 =?iso-8859-1?Q?6SeXy3k6NWdL/rodfdotWowSprfS9XrEv/piiVtnLegrUDR0RgjZKbw1ss?=
 =?iso-8859-1?Q?05s8wUrwKvQrWUzxkSK/qKsQINa9lvoYsb+u8KIqJTPqiHv6CGWmRAk5Ab?=
 =?iso-8859-1?Q?OzKXCrM2wcCU6LZEue1iFeI49ZmA47O2T6gYbLdTOCNVab2nqMuvDp14kb?=
 =?iso-8859-1?Q?jx17WKMhLNORE87WfZXQgD5tPErfU4mwhClvf8gHCG+no0R0+2h6vy7PWz?=
 =?iso-8859-1?Q?R+jMhXhai+BHwRl0wu3ncoEmClJ6zmFmKWSIGAc1UxuEl0d1VkD3QlHiFP?=
 =?iso-8859-1?Q?GcZtuA/50ehWy4V1AOm3/L3dMFD7NHjzKEhlmyj7YSGfLYk8DKyT8oy9F2?=
 =?iso-8859-1?Q?RW4gnnvYgLzNNtEijRAvN2eI+GdUq5RvoDXl7aobDnDYyvYQ/ijgySpUm9?=
 =?iso-8859-1?Q?Jio/6sZ0l6pZOEXa5H9OUkoemHe5ieYB7j+poi2yuXKUthtC5U7JCQBRLI?=
 =?iso-8859-1?Q?Hr8LdRVNZCiVz+x1WsubxVA3vUjsTQMoNfYffwxT8CdkS7OgJwUKp5OAwd?=
 =?iso-8859-1?Q?WFoeVxc6Xh2IN5v9YzR5kMycVjoZjQjEQDCJrdWmbhVRYdGdUf1rmjrUVM?=
 =?iso-8859-1?Q?g3Z0QsQLAjhJgLEIrr+yTSMSUW/t5fjlpXx9H4Tn2B7+8n88soXDENri/r?=
 =?iso-8859-1?Q?s4MnnZYHxajCWAtVwsOa63XSFnU/O2TWmtIJpb6ZMjOIb+F4NsfZfNQPnw?=
 =?iso-8859-1?Q?Kx2xhiQJ05tXjAqZz/KkdHlWHvcv65Z06E7ip0fQ0BTbxzHN3vkLXjf33y?=
 =?iso-8859-1?Q?d4VwJlujdMNi+1azxh9/bkGc2JiyFqe8wYAJIcKc6Z4Pv/EU3FEf6nnNIW?=
 =?iso-8859-1?Q?27WcriZPVOZRe+DoZSW9sVgFyOuWkls/rDyxN/3Uy8A2lvzWzF06M0eLvd?=
 =?iso-8859-1?Q?s1O6uelS0N5o2SbNYH72h+DBUoC9xSdHshTU4T7yEfUOE6/RmOSJWB6q/p?=
 =?iso-8859-1?Q?aCz3QUuZSqFdMQH75RVp/3yIBuT+AxNT6/e2S/lyIFi4c90WIsJPNmJw8J?=
 =?iso-8859-1?Q?cB9F4DA7Is3ooc6TYgLKp0cAy4xbOHWbR7SUV8zFjtuCvAOcDe84uTZg4a?=
 =?iso-8859-1?Q?sa3Urz0Y+qBBlCVeOlBc4ratERGSfWvAoHADIfn5nnuJvoLRQ5UgKj0Tlh?=
 =?iso-8859-1?Q?vM+sb9pv1yXlUzoQPNlRFlbTZE94saycZrKzFAusVDLXyZJchurK+u/ynp?=
 =?iso-8859-1?Q?qMKARz+57sexldjjS574Bw6ZCjgN3lL74FdThOkrsEgXDi9ynryBOuqQd+?=
 =?iso-8859-1?Q?nL9OC1QX6KxG6nHoC4OIJnUVqkiuejRhwMxjbPmomIVCTbq/htqCj4qF9P?=
 =?iso-8859-1?Q?ME1wmBrgIsHN6f/nBiKt8UYEr6Olkni/q7YHwBUjoaM/FIl5PkAMuhkG4p?=
 =?iso-8859-1?Q?KljmV1eU5ZUTyUzNW48lKYUcHC2dnFClBcQ4a7izCbjhQgYqtuLXfpCrEt?=
 =?iso-8859-1?Q?5JYbhFNiAx8xCk8abw2puI/T/Ej4DdCGmoSvPeLOR8d7fimy/WP1D1YUP8?=
 =?iso-8859-1?Q?0MAMvxMUbqDpfFEn/oDRn64EIQbN1FhPJMNZJVmrB+o4INn1WNWQ9WNw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44682305-eb99-4ea6-324f-08dde1d3dbcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 23:30:19.8143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SJgFGzOXVK0772hFPE09b6jMrQ1jU3d/72KVh8sAF9xkhZwMRlzAPgWPobu17eDuRmU2fP4p6NxSIw4e0NK/on4VOkcE+9vvyUiM5BCMXKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6129


Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> This patch adds support for the PSCI SYSTEM_SUSPEND function in the vPSCI
> (virtual PSCI) interface, allowing guests to request suspend via the PSCI
> v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).
>
> The implementation:
> - Adds SYSTEM_SUSPEND function IDs to PSCI definitions
> - Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
> - Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
>   hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting the
>   system in hwdom_shutdown() called from domain_shutdown
> - Ensures all secondary VCPUs of the calling domain are offline before
>   allowing suspend due to PSCI spec
>
> GIC and virtual timer context must be saved when the domain suspends.
> This is done by moving the respective code in ctxt_switch_from
> before the return that happens if the domain suspended.
>
> domain_resume_nopause() is introduced to allow resuming a domain from
> SYSTEM_SUSPEND without pausing it first. This avoids problematic
> domain_pause() calls when resuming from suspend on Arm, particularly
> in error paths. The function is only used on Arm; other architectures
> continue to use the original domain_resume().
>
> Usage:
>
> For Linux-based guests, suspend can be initiated with:
>     echo mem > /sys/power/state
> or via:
>     systemctl suspend
>
> Resuming the guest is performed from control domain using:
>       xl resume <domain>
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V9:
> - no functional changes
> - cosmetic chnages after review
> - enhance commit message and add extra comment to the code after review
>
> Changes in V8:
> - GIC and virtual timer context must be saved when the domain suspends
> - rework locking
> - minor changes after code review
>
> Changes in V7:
> - add proper locking
> - minor changes after code review
>
> Changes in V6:
> - skip execution of ctxt_switch_from for vcpu that is in paused domain
> - add implementation of domain_resume without domain_pause
> - add helper function to determine if vcpu is suspended or not
> - ignore upper 32 bits of argument values when the domain is 64-bit
>   and calls the SMC32 SYSTEM_SUSPEND function
> - cosmetic changes after review
>
> Changes in V5:
> - don't use standby mode, restore execution in a provided by guest point
> - move checking that all CPUs, except current one, are offline to after
>   pausing the vCPUs
> - provide ret status from arch_domain_shutdown and handle it in
>   domain_shutdown
> - adjust VPSCI_NR_FUNCS to reflect the number of newly added PSCI functio=
ns
>
> Changes in V4:
> Dropped all changes related to watchdog, domain is marked as shutting
> down in domain_shutdown and watchdog timeout handler won't trigger
> because of it.
>
> Previous versions included code to manage Xen watchdog timers during susp=
end,
> but this was removed. When a guest OS starts the Xen watchdog (either via=
 the
> kernel driver or xenwatchdogd), it is responsible for managing that state
> across suspend/resume. On Linux, the Xen kernel driver properly stops the
> watchdog during suspend. However, when xenwatchdogd is used instead, susp=
end
> handling is incomplete, potentially leading to watchdog-triggered resets =
on
> resume. Xen leaves watchdog handling to the guest OS and its services.
>
> Dropped all changes related to VCPU context, because instead domain_shutd=
own
> is used, so we don't need any extra changes for suspending domain.
>
> Changes in V3:
> Dropped all domain flags and related code (which touched common functions=
 like
> vcpu_unblock), keeping only the necessary changes for Xen suspend/resume,=
 i.e.
> suspend/resume is now fully supported only for the hardware domain.
> Proper support for domU suspend/resume will be added in a future patch.
> This patch does not yet include VCPU context reset or domain context
> restoration in VCPU.
> ---
>  xen/arch/arm/domain.c                 |  17 +++--
>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
>  xen/arch/arm/include/asm/psci.h       |   2 +
>  xen/arch/arm/include/asm/vpsci.h      |   2 +-
>  xen/arch/arm/vpsci.c                  | 101 ++++++++++++++++++++++----
>  xen/common/domain.c                   |  31 ++++++--
>  xen/include/xen/sched.h               |   6 ++
>  7 files changed, 131 insertions(+), 29 deletions(-)
>
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 310c578909..9e9649c4e2 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -90,6 +90,16 @@ static void ctxt_switch_from(struct vcpu *p)
>      if ( is_idle_vcpu(p) )
>          return;
> =20
> +    /* Arch timer */
> +    p->arch.cntkctl =3D READ_SYSREG(CNTKCTL_EL1);
> +    virt_timer_save(p);
> +
> +    /* VGIC */
> +    gic_save_state(p);
> +

I'd like to see comment here on why we don't need to do rest of the
ctx save code. I saw that this is described in the commit message, but
comment there will be very helpful for future contributors.

> +    if ( test_bit(_VPF_suspended, &p->pause_flags) )
> +        return;
> +
>      p2m_save_state(p);
> =20
>      /* CP 15 */
> @@ -106,10 +116,6 @@ static void ctxt_switch_from(struct vcpu *p)
>      p->arch.tpidrro_el0 =3D READ_SYSREG(TPIDRRO_EL0);
>      p->arch.tpidr_el1 =3D READ_SYSREG(TPIDR_EL1);
> =20
> -    /* Arch timer */
> -    p->arch.cntkctl =3D READ_SYSREG(CNTKCTL_EL1);
> -    virt_timer_save(p);
> -
>      if ( is_32bit_domain(p->domain) && cpu_has_thumbee )
>      {
>          p->arch.teecr =3D READ_SYSREG(TEECR32_EL1);
> @@ -158,9 +164,6 @@ static void ctxt_switch_from(struct vcpu *p)
> =20
>      /* XXX MPU */
> =20
> -    /* VGIC */
> -    gic_save_state(p);
> -
>      isb();
>  }
> =20
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include=
/asm/perfc_defn.h
> index effd25b69e..8dfcac7e3b 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_r=
eset")
>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>  PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
> =20
>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
> =20
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index 4780972621..48a93e6b79 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
> =20
>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
> =20
>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/=
vpsci.h
> index 0cca5e6830..69d40f9d7f 100644
> --- a/xen/arch/arm/include/asm/vpsci.h
> +++ b/xen/arch/arm/include/asm/vpsci.h
> @@ -23,7 +23,7 @@
>  #include <asm/psci.h>
> =20
>  /* Number of function implemented by virtual PSCI (only 0.2 or later) */
> -#define VPSCI_NR_FUNCS  12
> +#define VPSCI_NR_FUNCS  14
> =20
>  /* Functions handle PSCI calls from the guests */
>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 7ba9ccd94b..67d369a8a2 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -10,28 +10,18 @@
> =20
>  #include <public/sched.h>
> =20
> -static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> -                            register_t context_id)
> +static int do_setup_vcpu_ctx(struct vcpu *v, register_t entry_point,
> +                      register_t context_id)
>  {
> -    struct vcpu *v;
>      struct domain *d =3D current->domain;
>      struct vcpu_guest_context *ctxt;
>      int rc;
>      bool is_thumb =3D entry_point & 1;
> -    register_t vcpuid;
> -
> -    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> -
> -    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> -        return PSCI_INVALID_PARAMETERS;
> =20
>      /* THUMB set is not allowed with 64-bit domain */
>      if ( is_64bit_domain(d) && is_thumb )
>          return PSCI_INVALID_ADDRESS;
> =20
> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> -        return PSCI_ALREADY_ON;
> -
>      if ( (ctxt =3D alloc_vcpu_guest_context()) =3D=3D NULL )
>          return PSCI_DENIED;
> =20
> @@ -78,11 +68,32 @@ static int do_common_cpu_on(register_t target_cpu, re=
gister_t entry_point,
>      if ( rc < 0 )
>          return PSCI_DENIED;
> =20
> -    vcpu_wake(v);
> -
>      return PSCI_SUCCESS;
>  }
> =20
> +static int do_common_cpu_on(register_t target_cpu, register_t entry_poin=
t,
> +                            register_t context_id)
> +{
> +    int rc;
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +    register_t vcpuid;
> +
> +    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> +
> +    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> +        return PSCI_INVALID_PARAMETERS;
> +
> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> +        return PSCI_ALREADY_ON;
> +
> +    rc =3D do_setup_vcpu_ctx(v, entry_point, context_id);
> +    if ( rc =3D=3D PSCI_SUCCESS )
> +        vcpu_wake(v);
> +
> +    return rc;
> +}
> +
>  static int32_t do_psci_cpu_on(uint32_t vcpuid, register_t entry_point)
>  {
>      int32_t ret;
> @@ -197,6 +208,48 @@ static void do_psci_0_2_system_reset(void)
>      domain_shutdown(d,SHUTDOWN_reboot);
>  }
> =20
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t =
cid)
> +{
> +    int32_t rc;
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +
> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    domain_lock(d);
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v !=3D current && is_vcpu_online(v) )
> +        {
> +            domain_unlock(d);
> +            return PSCI_DENIED;
> +        }
> +    }
> +    domain_unlock(d);
> +
> +    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> +    if ( rc )
> +        return PSCI_DENIED;
> +
> +    rc =3D do_setup_vcpu_ctx(current, epoint, cid);
> +    if ( rc !=3D PSCI_SUCCESS )
> +    {
> +        domain_resume_nopause(d);
> +        return rc;
> +    }
> +
> +    set_bit(_VPF_suspended, &current->pause_flags);
> +
> +    dprintk(XENLOG_DEBUG,
> +            "Dom %u: SYSTEM_SUSPEND requested, epoint=3D%#lx, cid=3D%#lx=
\n",
> +            d->domain_id, epoint, cid);
> +
> +    return rc;
> +}
> +
>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>  {
>      /* /!\ Ordered by function ID and not name */
> @@ -214,6 +267,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_fun=
c_id)
>      case PSCI_0_2_FN32_SYSTEM_OFF:
>      case PSCI_0_2_FN32_SYSTEM_RESET:
>      case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>      case ARM_SMCCC_VERSION_FID:
>          return 0;
>      default:
> @@ -344,6 +399,24 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, u=
int32_t fid)
>          return true;
>      }
> =20
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint =3D PSCI_ARG(regs, 1);
> +        register_t cid =3D PSCI_ARG(regs, 2);
> +
> +        if ( is_64bit_domain(current->domain) &&
> +             fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> +        {
> +            epoint &=3D GENMASK(31, 0);
> +            cid &=3D GENMASK(31, 0);
> +        }
> +
> +        perfc_incr(vpsci_system_suspend);
> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
> +        return true;
> +    }
> +
>      default:
>          return false;
>      }
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 5241a1629e..624c3e2c27 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1343,16 +1343,13 @@ int domain_shutdown(struct domain *d, u8 reason)
>      return 0;
>  }
> =20
> -void domain_resume(struct domain *d)
> +#ifndef CONFIG_ARM
> +static
> +#endif
> +void domain_resume_nopause(struct domain *d)

It took me some time to understand that this function makes assumption
that domain is already paused. As it behaves like *_unlocked()
functions, maybe it is better to call it something like domain_resume_pause=
d() ?

>  {
>      struct vcpu *v;
> =20
> -    /*
> -     * Some code paths assume that shutdown status does not get reset un=
der
> -     * their feet (e.g., some assertions make this assumption).
> -     */
> -    domain_pause(d);
> -
>      spin_lock(&d->shutdown_lock);
> =20
>      d->is_shutting_down =3D d->is_shut_down =3D 0;
> @@ -1360,13 +1357,33 @@ void domain_resume(struct domain *d)
> =20
>      for_each_vcpu ( d, v )
>      {
> +        /*
> +         * No need to conditionally clear _VPF_suspended here:
> +         * - This bit is only set on Arm64, and only after a successful =
suspend.
> +         * - domain_resume_nopause() may also be called from paths other=
 than
> +         *   the suspend/resume flow, such as "soft-reset" actions (e.g.=
,
> +         *   on_poweroff), as part of the Xenstore control/shutdown prot=
ocol.
> +         *   These require guest acknowledgement to complete the operati=
on.
> +         * So clearing the bit unconditionally is safe.
> +         */
> +        clear_bit(_VPF_suspended, &v->pause_flags);
> +
>          if ( v->paused_for_shutdown )
>              vcpu_unpause(v);
>          v->paused_for_shutdown =3D 0;
>      }
> =20
>      spin_unlock(&d->shutdown_lock);
> +}
> =20
> +void domain_resume(struct domain *d)
> +{
> +    /*
> +     * Some code paths assume that shutdown status does not get reset un=
der
> +     * their feet (e.g., some assertions make this assumption).
> +     */
> +    domain_pause(d);
> +    domain_resume_nopause(d);
>      domain_unpause(d);
>  }
> =20
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index fd5c9f9333..c1848d8ea6 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -814,6 +814,9 @@ void domain_destroy(struct domain *d);
>  int domain_kill(struct domain *d);
>  int domain_shutdown(struct domain *d, u8 reason);
>  void domain_resume(struct domain *d);
> +#ifdef CONFIG_ARM
> +void domain_resume_nopause(struct domain *d);
> +#endif

Probably I need comment from other reviewers here. Do we really need to
make this ARM-specific? I understand that right now it will be used only
by ARM, but still... Also, I am not big fan of that

> +#ifndef CONFIG_ARM
> +static
> +#endif

in the function definition.


--=20
WBR, Volodymyr=

