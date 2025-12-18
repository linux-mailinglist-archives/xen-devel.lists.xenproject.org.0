Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC31CCAB89
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 08:45:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189261.1510075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW8gc-0001nX-MW; Thu, 18 Dec 2025 07:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189261.1510075; Thu, 18 Dec 2025 07:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW8gc-0001kT-JP; Thu, 18 Dec 2025 07:44:34 +0000
Received: by outflank-mailman (input) for mailman id 1189261;
 Thu, 18 Dec 2025 07:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X7AO=6Y=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vW8ga-0001jw-Fz
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 07:44:32 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63741a14-dbe5-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 08:44:31 +0100 (CET)
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by AM9PR03MB8010.eurprd03.prod.outlook.com
 (2603:10a6:20b:43d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 07:44:29 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 07:44:29 +0000
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
X-Inumbo-ID: 63741a14-dbe5-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wI1pTkwpq/KsRTbt7gh8JCw5IrEDIVpgr0mXvoLSBaxd9OfzzyzzB11gjZXvoNcrsltVV3Ow7DpeyCTIyG69l3oHM9NMSWJMjLcu178edKDor+binQ4CWmWmLfVNmLh6LxU51+LfQuMoKXYWurpowCUgcwBDTdyRKR51qIbCk4DXZNNx6Gj2rG1rIZ34S1sAxEC0pQqhr8eU+DWK1/oJ6f/oxSjNSGuP48k/aZCORf+Ld4pqQG+L44rFwfmeyHcaz1Gsc3PJRbVTCTmJ7GFAvdalY+Juu0K0CLUxdFikCknjm9VQzqZVSZ6WwB1eSEWWwkarA1jroVQmVR63jh5ihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fs5tmpPkVnWW5zOsZaYv92t0dGewCuP8Ows97lyxbOc=;
 b=Q+n9Dfxs4afpvKqP7/Wb4F6G5Tt6yt8peAUDe4venhmkgzaBoplIBu2tnqUD2YMN+FcJYFeLBhiVEN+9NoFm0FlFqpsDKJvjQrcs6Vn2XkZaYkDwthNkjZfGB+9oPXB9UvBUuR6xZr1UJpSlIWVRc9MpkCl+q3kJ5uNz+52H0cjFjkIC0ImdU0MBGMn2ItleDcHkR398UUT1J+ZLv5wBzbYuPI+f2n/+SNye0MYAEXueiar0/1r7qoRubuuekGCRG6LoyHM7whxgTKB4kVWXt79medH7jKMztwvOSUmktMKSy47hp9BkUzUvgTEQhT3N2XYnhjlTeQXxTD+N/wlJVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fs5tmpPkVnWW5zOsZaYv92t0dGewCuP8Ows97lyxbOc=;
 b=vnB8loyvlqvaBelNlzsx7CvpQx/A2wnwjzG4WIJBZ/JIhC2b8FVMOgS2PjhPzEM+gcd9xrR43uRXOtRGyUNobdv1NuZ4GVu+By3k04Ze4nXG1PU/5gDByn2xoLzvqRPfDRozhWFyAFfR232vfKObqsDrTFAgHmt8j7WxEqCqVn9WnTWKuKTKqmL10QNPhYUewj5shcVwGfFcQNq3+Lm2MUpjz9h8gphU23kyCdMoO/3yQYF/UaKv63pPPQvHmdMNkFeDIOpNhwRyg/i0dRu7pW2PypTafXoLt48MRoyM8K6E6zpM+F9Ej5YkMHzJi+JnuOIq9znHtCF7fPiD/2PHfA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Grygorii Strashko <grygorii_strashko@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Harry Ramsey
	<harry.ramsey@arm.com>
Subject: Re: [PATCH V3] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Topic: [PATCH V3] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Index: AQHcbyzuH15G1NdORkmDpo6kbgtlK7UmhcQAgACAJAA=
Date: Thu, 18 Dec 2025 07:44:29 +0000
Message-ID: <a23716aa-cae1-4636-b027-2344e2b08f10@epam.com>
References: <20251217081248.2807849-1-oleksandr_tyshchenko@epam.com>
 <alpine.DEB.2.22.394.2512171605420.21522@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2512171605420.21522@ubuntu-linux-20-04-desktop>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|AM9PR03MB8010:EE_
x-ms-office365-filtering-correlation-id: b74160ff-0c6f-4d6f-7f6b-08de3e094679
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZTg3NFlOR21XZmsxRFJVZGY0aTJoY3NZTlcvclcwNTI0TWUrUFFuaEZ6QytG?=
 =?utf-8?B?OS9iU1lEOFlaQU5qZS9adWtydTljb1VXak51czdqRElqSlJIdUw3SmV6MkFI?=
 =?utf-8?B?SVVsbXZURkJacStIQXdqTjNOTGpJMytUV0ZmMGpRM3J0R2lxSldEcTViNmxn?=
 =?utf-8?B?R1pMcXJ1anRQN1VVL2xaK1Z4K0E2bUlFbzdSSDNrTXJzd1R6WnIyNVIraDdE?=
 =?utf-8?B?V1pLZXI5ZkIrSytGYUorMDA1RXdDUVRJWm5mSVhsQllYUjd3KzFFdWlmYndt?=
 =?utf-8?B?NWVjQmxqZ0U0WjJIdTg4bUdWWlovOUM5aFJma1pWbEFFRkpmMjZHYURwUHNB?=
 =?utf-8?B?VkE1aGc4N2R5NFF3NldvNGNRT1M0UktkM1NRNjhuRzI4YWQramIzRVp3MVU4?=
 =?utf-8?B?NnZUZFdXOGRjSjgzMUtuaEUzaG5IalAvUStFL1NYUStQOTFsRjd4cGRRU2dZ?=
 =?utf-8?B?QTY3L3hTT0xWcmtjSXErY3VLenVjd201UG9vVjc1aE5VaGU0YXdCT3MydXpE?=
 =?utf-8?B?dktrbjdDTzNQRDlzMm1Fb2phV3MrbXhoZ0FGbXJBdU5SQ2lrQ2JlZzAzaHht?=
 =?utf-8?B?OTFPTTg1cXoySVM0UDdjVWpUU2I2bjk4YldIbHJLalJzY2FmRlBaa0MzWmh0?=
 =?utf-8?B?dFJvcEUvUVZzbXU4MGdjNXkxOFJ1dEU0YUFCZWlGUDZseTBtVzAveGNTdCtl?=
 =?utf-8?B?ZXF2dHlvbXlLMUw3eUZYdFRvUDFYcS9sczVvK0xRVkVRNG9nVFVuUmtpMnk1?=
 =?utf-8?B?UTNXQ2MxZVRsWkV2UEhvL3lNYklZbTVjY0wrWjVMYWZlTnlRTUFRdHFHR0hK?=
 =?utf-8?B?UmtYYktKK2h1ZzdPakJMLzd6MzB4Tnl2Z3duNkVzeVNibE5SYmRDSmhLamQ0?=
 =?utf-8?B?RURRUEppSS9lcXI0VUtHN1ZuVU5DSHlNZ3RwbE9TNWdTVldMOW5GVDNJekI0?=
 =?utf-8?B?TUg3a0Iwei8zd0NWTlRPUkdmY1JMQlhDY1laN1ZVZTI1T0JJZ2UvTGpRYU0z?=
 =?utf-8?B?bHBxTWhRQnBuUFNWWUE3eDZ1ZmJrc2p0RkNYWDlSQ09McG9iL2ZXdVRrNnUz?=
 =?utf-8?B?eUs5M1NnS1Z2cHBJV211aS9qN3VXRHV1aC9UVVpVaGF1NUNYNGhVWFYrNERL?=
 =?utf-8?B?a3diSStPWU04ZWEwbnUrblhNOUYrbER3U2c0WkloWStlU2NFWmU5SFAwWHZH?=
 =?utf-8?B?aUtxcUVkV1RZU05CZzBtQXhEQW5UZVovMURQZjdPaC9tQjdSYmVFN0dlSjhS?=
 =?utf-8?B?NmxIa201djRMdXhXVTZlNmcrZ3d0dzFrcTV4OThKbzVSeFltK05OYnBCRzFX?=
 =?utf-8?B?ektLSmIwZ25HS3JFSUxsZ1N0am1kVkJwQUNmWGZuaUdVRC95UWFsMHhkSDJj?=
 =?utf-8?B?RG43QlBrMXo5S1R5aTdzNHV0T3dVMDh4aGl0Rml3UUY4bmVGS3F6UXZkbVFq?=
 =?utf-8?B?L1QxSzF2aFFYTHZ4MFFQN3oyVWxkYkdHYlh2cXQ4T0dqNWl3dGdLdHNNdStN?=
 =?utf-8?B?QnBuMm1yaXI4ZnhRdER4dFNQS2xqK0NvRjdpMkIydHh3NlYwMEdjMjhVSjd0?=
 =?utf-8?B?RkxFZ01xR1ptM05sdnJmdXVqdG15OXh1L0pGM3RJWXZCa25Vdm9yZmRDTjFn?=
 =?utf-8?B?U1lIOXVrYkxxbWY1QS9tVWdzMDB5YTJ5em5qTUhFVVc2NFRWL0ZGYXp0ZjA2?=
 =?utf-8?B?VmNGUlBGc21Bd3FKU3dYUzNxelYvbHQ4ZmJLZG1rejYxNlNUajRPQ09DT3pL?=
 =?utf-8?B?WjlKbExTejc1VW9Nc0JxYVhLKytMbDJ2M2J5dGg3Tk5mcm02NmhqWkFwOWsr?=
 =?utf-8?B?RGlvaXdPQ0ZkNngvd2VUZ0t6V3VyVTRxaVJVUXVlc0VnMXZ2RDhiTXhyRTdC?=
 =?utf-8?B?VktDSEpCMVArdWtSc1VNTUVsa1N3dnJXMG01Q3dnanpBelkzeEwyaGhXaGEv?=
 =?utf-8?B?aHo3RHpEOUFJdWRTNFkwTi9mSEJEbm9BOHlyb0tZOEQrbnhKMmZXRmlJZjZm?=
 =?utf-8?B?L1c4UkJBTUwyVXF1WEZYLzZKaU10emNtR3N2UkNOV1RaV0UycUNQMVBOMWtq?=
 =?utf-8?Q?nmaZbr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ni8rbnBOaUxoVmc3UjErQldyYzhSYnBmVFRwZS8yWTI5akUzeldFaHI4T0pH?=
 =?utf-8?B?QXl2QTZPZGlRM3N3dVJGazlGdVlDMmtFMER3WWlIWHI2ZGJKQVFYUk9odkdw?=
 =?utf-8?B?eW0wN2V1ZWFsWjlXUTNrU0VaZTVQRTVzZFhXSXNBVHF6bWdxQ2FQTWZhbU83?=
 =?utf-8?B?aVZrQ3cyVFI5UVJka05QU3hsenNmb2V5cXNnK0FPZ2Y3d0I4TUU1MUhCNFBR?=
 =?utf-8?B?TVVoc3BNQ1p5VkZ3eGU5UDNzVTE2TFRtNmVFbkVaRzNkUW00bnZ0Q0tJRjNE?=
 =?utf-8?B?ejkrbWNoSVNRZjhQWmF3MUg2VVNXaE9ldDN5L3owTWs4RlovUFJZMnhNcHp5?=
 =?utf-8?B?cE9jTHdXQTVUQURwblVzQzVnMHpvRHROa29NeWRTSHVIVGs4YzhPdTM4OWlR?=
 =?utf-8?B?YUlTUW95TW9mYjVCWWI4dkpYeng3R0FsWVJvSUxYWnZqMDc3TTJBMkdIN3Fy?=
 =?utf-8?B?REFKQVRpMkg5RHh6a01wTkdPSUZBR1p6TTY1bUp4RURNeGxpcWxzM2RQMFNU?=
 =?utf-8?B?aWhYSU5BK1ZhUnVZZDgvNGVOMXpkQ1ZrNi9nR1p4aTZUdEpYUWZ3SkJuVGs0?=
 =?utf-8?B?VVJzNjNvK2hnMkY0cGZpNFFsWVFvcllnS05jL0l6U3NJbFY2ZEdZd1Z0RnVM?=
 =?utf-8?B?RFJ3ZmtZdVMxcG50VElKa2VPcEpVUERzQmpnV0J2bW84MlVCbDlXUWwxQ01w?=
 =?utf-8?B?Qm5SL1pxSjdBbFBLeHlaMzJHTGRwaEhHZ0lRUG5aRVUraUU1RndMbFRwcGNX?=
 =?utf-8?B?cG5JSThjRkViT2RWTzJ2QzVlNHZRSUdieWN2Uk1yMHAxanRvODhVY1FDS2FU?=
 =?utf-8?B?VUd6UHpCdlBTNEZwbDN0eXpNMlF5MUxPengxN0ExaDB2YStRcVlPOGh5dTJt?=
 =?utf-8?B?TXBkY0hLbWpsWE1kM0kwTFZvN3NwdWRWV0xkSVdTZC9rZ2hPeVhadFE0RTJk?=
 =?utf-8?B?MVJ0eWJhMWYyWFZMWVR1ZkRTZllvM1VWaUhrWk1JVnNrU1loSW1HdEJ6dERR?=
 =?utf-8?B?MktDOUZ4OGszQzlkc0tiMTQxaTdULzN3RzZvNDIzekFsbnJJeGNST1cwQWlm?=
 =?utf-8?B?a0MzcUNTb2Z5ZnpTYTAxdTZVUE92eXVJQzRaWjZwVlZxRlFiTitrVXEvdHNi?=
 =?utf-8?B?K2JtYk5odWZVVkxXYldoaldLbEh1Rkh6MmVzS09OWXRnSFJJVFE1NmxyMTRC?=
 =?utf-8?B?S2JXcUNoRFVQaU5YZHJ5L25jOUczUCtWM2paRkFEdjZqNUQ5RFZUbnkvaS9C?=
 =?utf-8?B?dWVmdzRTeHl0U1kya0M4Y2tpY3FmMXdjU0cvaUxSd2pZVmpXUnJ6dVg2SHB4?=
 =?utf-8?B?cHUxTDB1VmJQZ0RyM2V1b1B3ZkpwdTRwbVdOY0JpbzZvcTVsN241bE5HY1Y0?=
 =?utf-8?B?b3BkVDJQeDllZ0t6LzlJbjdHNVoyNTBJRjk1Y1Q0NTFHaWdNTmEzN0JoVGRh?=
 =?utf-8?B?YVczakdlczA4QTJWbWRSU0YwZnVoTnEwV3pGd1drK0N4bnRGc2JWem80ck5O?=
 =?utf-8?B?c0srWmdxdHNmeTd4US9KbXVDYkJHbTJZV2RtWmVqZEIwRjROSG9aMU1LQUY0?=
 =?utf-8?B?ejFNeGtzQ2J0d2tFRnEremhLNDNSUVMybzVDMjlTUzZHMFoyQTJGTDlOb0xO?=
 =?utf-8?B?cC9aM1c3WHlkZE9NSWI1S1VpSWpjVVluV0hDUWh6bkNHRUZpVVZIdnQrcFhY?=
 =?utf-8?B?eVVWQU5WZ3dqK3N1ZUN2Z3Rnc1lVL2gwT1Era1l4WFhKZjZFODcvUHR4T2tY?=
 =?utf-8?B?ejFGaG9XVTc1SGo4eHpTcEpteERyUXhEODZTeTc2UnhIdjVtank2Ni9OYnZi?=
 =?utf-8?B?c0pVclJsaVQvY211cWNZQ3oraGRQZm9EVS9BWno3TmF4d25qU09Ma3hEQ0tV?=
 =?utf-8?B?SG1melB4WDNGTjdwL1hOejdxdWNmbldPbWdlSlhTRXkyNDdINXpaOEYwWmVs?=
 =?utf-8?B?SGZ2a2MwTU5GbERqaU5NZVB6SXpnT3p2UitoS21ZL1R1WnR2eWZuYmF5NTBQ?=
 =?utf-8?B?WEk5MnowU09la21YRUY4dno0eTcxTFhsdWpjdFRXTnpMN0htNFVDMTR3Y2RK?=
 =?utf-8?B?eFJmWHNIWjRBdS93LzZXNWtISzZVMGJCSnJuMzlyUmxUdnd2T0dmdG5uVXQx?=
 =?utf-8?B?QXNTc3YyQ0FrN3VHZ0lmOStwYnFJdi9UTVZMTnk4YjdzQVEvSitEZHA0NnYy?=
 =?utf-8?Q?TC0nzbql+raNwa8tPYGP2nE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62AB181BC4A2EE4C833261A05BCF97A8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74160ff-0c6f-4d6f-7f6b-08de3e094679
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 07:44:29.0981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BANY7FTBnJYoaUuIuPLaQNteTNLwuel3LNllWJ9MqEpgDOl3YDNincFkNXyTCVjVIkVx5guwHIqEFIg6j7gBXCHR+xopr8SuV3FnG7N/uBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8010

DQoNCk9uIDE4LjEyLjI1IDAyOjA1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQoNCkhlbGxv
IFN0ZWZhbm8NCg0KPiBPbiBXZWQsIDE3IERlYyAyMDI1LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToNCj4+IENyZWF0aW5nIGEgZG9tMGxlc3MgZ3Vlc3Qgd2l0aCBhIGhpZ2ggdkNQVSBjb3Vu
dCAoZS5nLiwgPjMyKSBmYWlscw0KPj4gYmVjYXVzZSB0aGUgZml4ZWQgNEtpQiBkZXZpY2UgdHJl
ZSBidWZmZXIgKERPTVVfRFRCX1NJWkUpIG92ZXJmbG93cw0KPj4gZHVyaW5nIGNyZWF0aW9uLg0K
Pj4NCj4+IFRoZSBGRFQgbm9kZXMgZm9yIGVhY2ggdkNQVSBhcmUgdGhlIHByaW1hcnkgY29uc3Vt
ZXIgb2Ygc3BhY2UsDQo+PiBhbmQgdGhlIHByZXZpb3VzIGZpeGVkLXNpemUgYnVmZmVyIHdhcyBp
bnN1ZmZpY2llbnQuDQo+Pg0KPj4gVGhpcyBwYXRjaCByZXBsYWNlcyB0aGUgZml4ZWQgc2l6ZSB3
aXRoIGEgZm9ybXVsYSB0aGF0IGNhbGN1bGF0ZXMNCj4+IHRoZSByZXF1aXJlZCBidWZmZXIgc2l6
ZSBiYXNlZCBvbiBhIGZpeGVkIGJhc2VsaW5lIHBsdXMgYSBzY2FsYWJsZQ0KPj4gcG9ydGlvbiBm
b3IgZWFjaCBwb3RlbnRpYWwgdkNQVSB1cCB0byB0aGUgTUFYX1ZJUlRfQ1BVUyBsaW1pdC4NCj4+
DQo+PiBQbGVhc2Ugbm90ZSwgdGhlIGNoYW5nZSB0byBET01VX0RUQl9TSVpFIGZvcm11bGEgd291
bGQgcmVzdWx0IGluDQo+PiBhIHNtYWxsZXIgYnVmZmVyIHNpemUgb2YgMzA3MiBieXRlcyBjb21w
YXJlZCB0byB0aGUgb3JpZ2luYWwgNDA5NiBieXRlcw0KPj4gb24gQXJtMzIgcGxhdGZvcm1zIHdo
ZXJlIE1BWF9WSVJUX0NQVVMgaXMgOC4NCj4gDQo+IEkgYW0gT0sgd2l0aCB0aGlzIHBhdGNoIEkg
d291bGQgb25seSBhc2sgdG8gcmV0YWluIHRoZSBtaW5pbXVtIHNpemUgb2YNCj4gNEtCIGR1ZSB0
byB0aGUgcG9zc2libGUgcHJlc2VuY2Ugb2YgcGFzc3Rocm91Z2ggZGV2aWNlIG5vZGVzLg0KDQpJ
IHRoaW5rIHRoZXJlIG1pZ2h0IGJlIGNhc2VzIHdoZW4gZXZlbiA0S0Igd291bGQgbm90IGJlIGVu
b3VnaCB0byBjb3ZlciANCnRoZSB3aG9sZSBkdGIgd2l0aCBwYXNzdGhyb3VnaCBkZXZpY2Ugbm9k
ZXMuIEJ1dCB0aGUgZXhpc3RpbmcgY29kZSANCnNob3VsZCBhbHJlYWR5IGhhbmRsZSB0aGF0LCBz
byBpZiBhIHBhcnRpYWwgZGV2aWNlIHRyZWUgaXMgcHJvdmlkZWQsIA0KdGhlbiBpdCB3aWxsIGJl
IGFjY291bnRlZCBzZXBhcmF0ZWx5Og0KDQogICAgICAvKiBBY2NvdW50IGZvciBkb21VIHBhc3N0
aHJvdWdoIERUIHNpemUgKi8NCiAgICAgIGlmICgga2luZm8tPmR0YiApDQogICAgICAgICAgZmR0
X3NpemUgKz0ga2luZm8tPmR0Yi0+c2l6ZTsNCg0KDQpbc25pcF0=

