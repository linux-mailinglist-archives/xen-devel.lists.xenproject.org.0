Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D6AB95E4
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 08:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986302.1371880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFoQc-00022S-IG; Fri, 16 May 2025 06:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986302.1371880; Fri, 16 May 2025 06:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFoQc-00020V-Ed; Fri, 16 May 2025 06:20:18 +0000
Received: by outflank-mailman (input) for mailman id 986302;
 Fri, 16 May 2025 06:20:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q1iX=YA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uFoQa-00020P-7t
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 06:20:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2412::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d29f7d5d-321d-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 08:20:13 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB8904.namprd12.prod.outlook.com (2603:10b6:610:167::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.23; Fri, 16 May 2025 06:20:08 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 06:20:08 +0000
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
X-Inumbo-ID: d29f7d5d-321d-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2Np5no9uGuDHcutzpApYfO9LiyoriaQK3q+HG57l8ubOtbVmuCq5Q1nAmzlKV6Cxf4nIMFME8m0PQIcBM9EUZ5YPkFvtIFv7qcESdowKfP7LDnx492CwuxFlKYA0YlGyLoRxJ3davSTuq2QU4vaKSTMENRM3Wmeyk5rX74IsPwbAYxp0+jG4pmAXbD+FS0bnXiaBEWcR4hTUQOosD4FEQ9BFtE3XdNcvbA3bc89zptxep5iGqNLf1qnOOR0pzS9HEHT7Um6/qrJ/XeJITwsDJqkBwc5GLSvgxCXNKC1JyKnRHGLwIxwEEcVYrcE6X7pDY/tm9oFzLGdXP8Io3m6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1gER049XH5tfAxH57l+8H5nqgqxlb0iHbjwo8NwD00=;
 b=Ysca3WoFgJOJMMLQ33Gfzb7VOlsqfMWm4n1TULd1sje9otvXDUuxRzd+Y/g4icyUZbhqyOzFB6uOKJnTQP4+loYlBklD4C9DHFS/xoWqRec01pjo+0Os8IMLVs4TeVFg2pvOeYooFyuPossUFwowBfF5GyUf8aF+NVZiGGsCNvbXcXac1B42wiv+YWu7ZKa63PR8uTOIC6TNb1CutnPNrQ/10V52s4zbhdDKPTlWIdXFJV8TilUUnZxgrtwOlMgFgAMdZp3Q7izkflHK0buuH5+ga53fKgvZK9gXC/g/NevrD9eyChy4l5j4lTpt4rkck6t/bZ+bm46q7hG82m0qRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1gER049XH5tfAxH57l+8H5nqgqxlb0iHbjwo8NwD00=;
 b=ynbWbbY9OaRn2VRPkoddqQIX5XopuoEvAezZRZHv+pe4ZXmEvj9KjkT5SfbyFb/HZ4xkf2z+M+HIk4AQJG/KY4xPAx26iLIS2aPYBjD6ma6kdcohU1HZGhYt0mgYmxyuY9RheecYEiUEaDjcEMyyLJJnlD4shdfjXk+QVf1Q90Y=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Topic: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
Thread-Index: AQHbrRCjQUXzVZg75kKZW3IeVU/v2LO5SzoAgAv/ooCACgTDgIAFqcOw
Date: Fri, 16 May 2025 06:20:07 +0000
Message-ID:
 <DM4PR12MB84510F1B6BA0127E6BCDC7C8E193A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-3-Penny.Zheng@amd.com>
 <829e710d-d257-455a-b4fc-1746119609ef@suse.com>
 <DM4PR12MB8451CF34EE2A52B8D8A42369E1892@DM4PR12MB8451.namprd12.prod.outlook.com>
 <e79f6143-e8c3-490f-9f01-f4c99134c318@suse.com>
In-Reply-To: <e79f6143-e8c3-490f-9f01-f4c99134c318@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=26c142fd-afdb-428e-8017-6090b17d9672;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-16T06:18:47Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB8904:EE_
x-ms-office365-filtering-correlation-id: 71a60421-204c-4c67-f967-08dd9441b49c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M1pNdTFnbnU4UnptOVBMNmZEYndVZ1Q4dDVRcXJiUmk0R2dZMmw1Q0huK3ln?=
 =?utf-8?B?OHZ1U1FIUWdHRDNURzJmc0NHYnhZMlFGTXR5TmhYY1hCb1lHcWFCYkZ2NEtl?=
 =?utf-8?B?dDRUNjA1eGw4ejdJV0lvQyt0dlpxb0IzUFJMbENNc2Y5aUdVRlZGNmdJTm1M?=
 =?utf-8?B?ZnY0RHMwTWpKTlpobUJ0YmltL0tiS2poUXEwZDM3NENwNGQ2UHUxbkkxR3Uz?=
 =?utf-8?B?TGdYL3hCOUl2dHZLN3ZnUmR5dU1Bb3dDS3BvWmp2bUJOYWtyYUlveEZuRm9H?=
 =?utf-8?B?dFJNOVVTTDBIL2dVNjZOUnBkR0JVY1lvS1M1MUJScCtWaTg2N211aHJIS2dh?=
 =?utf-8?B?MzJXdlRUTWpKemlOL1VQbFQwdVR2NXl3VXAyZk1tTi8wQW12Mm5acE5OazEv?=
 =?utf-8?B?L1pYVmlnQnY0TGxRbVRJRUxmY0ZPeVA0SHFMUjlOeks3UlpZSzJhRDdjOE80?=
 =?utf-8?B?TlpPWjlYa1kvdVRyekRXYmNOZlgzcWpxZjBsSTBTMFJLQ3BSd1VIRllpTWdK?=
 =?utf-8?B?dkhVN05idUN4VFFSV1NuRktsSlI0Vkxzcyt4L3JEeld0cFBPck5oOWpmeGRW?=
 =?utf-8?B?VGk2QzV1VmNMV2JEK0R3d3RZWGFtS1JYcGg2SlpVckw4Q0pnSVZ3Yjh1eWF2?=
 =?utf-8?B?YSs3ZitOeFZvR1pOY21mVURVeWhOZWpJUkFuUnEzeXYxWUV3YUNjNmVQOWhY?=
 =?utf-8?B?bFQvUmtJSFB4aVBOSk9FUHZpbFhtUFJpd09nUUZURVh4cmRnSHU4MGhMNjZx?=
 =?utf-8?B?SlEvUTV0d3dFQVpoeTFUTUxOY2V2M1VOZ3NhY20vTU92T0I3ZXZ3SzhaV1pr?=
 =?utf-8?B?OFZEQnZHbzBvUW1QaUtOektNZ0hlNXc1ZURpdUFRc0daUzdnVjFQVnAydDRt?=
 =?utf-8?B?UkF1MnJxNDVtbXpzcERTY3htNFRrc0hLUkE1RDY0a0R3MkRYMmgwUERiZ3pz?=
 =?utf-8?B?bXdySmJGMm9rRjk0NjgrRkhXZ21ubmwyQlJ1dG14VHB2c1ZFb1N3WnVIbUpv?=
 =?utf-8?B?Tjg5WDQvK2pHQnZpWEk3ZVFCYVpZdFpGcXVUODJSN0hJM2Uza2RjOHJmWGZ6?=
 =?utf-8?B?UWtuM2tLeUxiSjJ3a0d6bUJPQ1JEN3ExQ01OZWlsbXgvbGNhSUcwalBwU2Iv?=
 =?utf-8?B?SEVNenNmUmRVOUN3WStxRjhqY1V5Slh4QkpoQzcvbCtXSFc2YkZzSUZMZ3JZ?=
 =?utf-8?B?aEVFK05WRm9McE4wS3Q1akZtRU44OWVTaGVIN2FRekwyMHk3dkp2bWh0VTQ2?=
 =?utf-8?B?OGJVUVFXdzM2U0VZMGc2Y29uQ1N4TTlaRU52SFZWdmxibytxMTF4SUZWRXU0?=
 =?utf-8?B?bXA2VjFscUE3eU9ZT3ZwUE1IWWE4SzNnQWQvdCtNUGJrNkp1cGZhVERXQkcz?=
 =?utf-8?B?YU5IQjNZMHJqZDE2cUp2cWorNnRIbHUyaUtid1dzZzU0VzR4SXh6bklLd1Vz?=
 =?utf-8?B?V0ZySzlId3psMll1UTZFOVlxN2FzM1p4eGYvT3U5NlZTRFE1anpZWDhMTTQy?=
 =?utf-8?B?NjFPcFpWOXJlV3R1b0twcC9zaFhzQWEwdDhaZHJQakNZQVRaVmI4L0hlN1p4?=
 =?utf-8?B?UmlVdXk0WlNMTFI2N0JOVk1tbjhCQ0pjNVVSZXB1UkFtSC80QzFEc296NTFx?=
 =?utf-8?B?NFdZR0FDNngzL2MrUmhFd2FhN2dxUm5DcjYrSmhjaGx0dVcyQ2IyTERaODRD?=
 =?utf-8?B?ODlYQkRSMWo0ZDlGMVJTQUphRzBnMDlrYjVNbUw2VDdsOTIvb3YrNnJjZHlw?=
 =?utf-8?B?a0VSZnJzbXhLbkl0Sk1DcENEcXNKRWhyVVMzdmRjVkFXWFplYjZDWnZhSUMr?=
 =?utf-8?B?d3ZlMUd1UXVqOTJweWpJZ0dnZEJvNjB0YkFONHM3YUhDclg2b0JuclIwRjVJ?=
 =?utf-8?B?ZW5BemNiejdlbm5BOE1jOFhUYzFpcGNzOWpFWWlqbWx5UHhsV21BRmg2RXhJ?=
 =?utf-8?B?YzVLUVZHMjRLS3IyVFZDVzA2dWgybUFyeXNFOHhGUEtmUHd5dkx0OWtFVGtw?=
 =?utf-8?B?OFEzQnhWMTVBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHlsbElUSkY2Vjl0YnNFbHVoUVdYZU56UjlITVBINGNIbHlOMzVvbVVONGk4?=
 =?utf-8?B?ZnpFNG1lVGdHL3Z5bEZkVUFIdHZsdUxyamN4QnZDbWdCZ3E4UWVhQzFLcWh6?=
 =?utf-8?B?N2NhSzhjSDl4MjBMbUwxT3Qzc2hrTkJhR1BBL0JGWllQRHVia2N0dzdQV2p5?=
 =?utf-8?B?eE10dTlkem1JMTQ0aWo4S0VoVjNsNGR2aEJBR3NHdXp2WCtQTW90b254MitY?=
 =?utf-8?B?Q0JXUTVRcGZSSm5JOFFhQW4xbW81OXVYcVFlWGVkWU5jalA5WDJzZUtZbTdM?=
 =?utf-8?B?OUlIYlVNaHlJNFNUdVVyQmpVaHBQcXJnNWg3ZzNzSGtUOUJqb0FuaFlFbDg0?=
 =?utf-8?B?UDFnWXhmdlk2OEtGOFlHM2ltZ2RDRTkvS0c0Vmk1dU1KcndxNDhpMGFERmdC?=
 =?utf-8?B?Y0RPc3plWW9aUUVRZXlEZ00vWWVDZjNHMTJwZnhVekFNS0ZkTW0yVlFkZXZr?=
 =?utf-8?B?WXJTb25vOXNJMVd5cHF3NU1qZHVUSjZpSXJ0YSt0ekFVdXdlNVhhTkRQdllB?=
 =?utf-8?B?cHJibGNxTUw5cTJPb3pGQ1FCUkNOVUNkaU1ORmtPa0lSazA2UGNXcGNwWE5j?=
 =?utf-8?B?akhYRjRmZlVoZG1ydjhvUHAvbUw3cVU0YW9PZGtMSDdSc0E5enlPQ2QzeEF2?=
 =?utf-8?B?QXJEeENZb3UzR1F5aWFRcUFMTUtRLzgrcm5NblFhRFlpWmhwZHlOZUdTRU00?=
 =?utf-8?B?L016SlN0eUNPMU91RS9VYUFDeCtpR005ajZtOFhqRlM1KzVOZDIvTlY5SThD?=
 =?utf-8?B?cVh1aTNoWEROWXBiUzA2aU41Z0V0MFhBLzIwV011QXhaSkJPT3NScGdOcmJ5?=
 =?utf-8?B?a1NOcVpaRENucWVRaGtoYi9sWFppVFVvVEpzNlNrMjNGcGNJZWtVU1lxMUdB?=
 =?utf-8?B?bzd5bHNPYTRYbEN3RXd6UVN2M0VTWmJkUmhjRUpoYWZuMXMzMHF1RU94aGFL?=
 =?utf-8?B?VUVESWMraHJEV3FKVnBEUjBmNUo3eGFrMGlnL28wQmUvN0d4MllpWWdxWU9k?=
 =?utf-8?B?U1UxUGEzZUo5bm5CYkFhTFZvcjlZN1BOK2YzV1M2RHBxZmdBTFFvNzB3a0pN?=
 =?utf-8?B?aisvc2xnWUpWRkowSCt5Q2JNMmNYWS8xZEtBb1kyRnY3OWdPK3RkS0xLT3Rz?=
 =?utf-8?B?RWllNmUySXRibFdqR2R4TSsxM1lDR0oxYjZQTTFzeHZ2VGs2cjBZTDhkRFow?=
 =?utf-8?B?T2cwQUpFNHpQOHhpdG1kYnFlelMvWXRzOTNoNy9tUUNtd0hPVHpZdE8vNUVu?=
 =?utf-8?B?blRTK3Q4Z0NaZ2VEdWJaK0U0MGFzay94aEVQUEZpUnBlSkZpazcxZnM5TmdU?=
 =?utf-8?B?ZlFTbjFva0ZKcGJBdW1wc2lrTStWY3FXN1MvZ0kxWng5QmlmOVZpSnBLMW9v?=
 =?utf-8?B?S2NsTlVia0JxYjlkdE51WHAzTVFSUjJZWUE5S1FuRmNsMzU1bTdNZTM5UUY2?=
 =?utf-8?B?cXQ2ck81Z2FOczNZUCtmNVJhZWdxZ3NQV21OTzVpK3lYM25lRy9ndDlFREkv?=
 =?utf-8?B?RTE4RXp1a1p4elM4U0RSYlJGaHVyaVNsTFJjK3ZITjlOblNQV2VWeXV4Lzd3?=
 =?utf-8?B?UTRaTkc5VURtOVNtQ1dpYUxJcFludE1mSlpBZkJXNnIyMWxFZm83MUFBQXIx?=
 =?utf-8?B?TGZROU5qWUppWHF6bXQvTDU0ZGY0cEoxVm1LOHdwbVIzT1NYZm8rQXFSbjM3?=
 =?utf-8?B?M3NodHExVU9Pa0QvY21wdlZhdzRpNHFmRTdWV3ZyU2cxKzFaaisyZXVnRE5C?=
 =?utf-8?B?NGNsUmY0UzNYRnpHT2J1ZEYrOExFbm5LbEMrN0cwdmtjT2R0aG1iME9MM05T?=
 =?utf-8?B?MWtpeVltMnlSbkluKzRaSXpTdlRGeVhoNVZubFNZZURaQzNaZWtxUlpMRkh4?=
 =?utf-8?B?ZDIwcjVCVUUwd1ZVcXpsVWJvbmdxRzhiN2lKV21FdHdzcWRsSUhzcE9jYnA1?=
 =?utf-8?B?NjkvZWVzKzI0Y0ErZFVXWGczMlc3ZEtxR1pjVVk5SzF1Q1UxeGpJbmNTU2R4?=
 =?utf-8?B?ZXpFRHlrWnFiTndGL29GRWpCay9RelYyV3h4dUwzNy9WMmJIV01wdUxmT3dM?=
 =?utf-8?B?WnVhRW9rZWQ1V3U0UHgvKzVqZCs4T3FjcmJ5QVRRYTAzZitRU2YwcEh3aE9j?=
 =?utf-8?Q?lwoY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a60421-204c-4c67-f967-08dd9441b49c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 06:20:08.0204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hvan8mZXu0Ka+XYSxiA2pSJsTN7Ec5qx+o1XMVerNk8Cgxvc2Wv00qnZbqdHM+uugN6mClW2yP5m50BbcdzLHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8904

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWF5IDEyLCAyMDI1IDEx
OjQ1IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENjOiBI
dWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMu
dGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdQ0KPiBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVu
LQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0
IDAyLzE1XSB4ZW4vY3B1ZnJlcTogZXh0cmFjdCBfUFNEIGluZm8gZnJvbSAic3RydWN0DQo+IHhl
bl9wcm9jZXNzb3JfcGVyZm9ybWFuY2UiDQo+DQo+IE9uIDA2LjA1LjIwMjUgMDk6MjIsIFBlbm55
LCBaaGVuZyB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJv
bTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBNb25kYXksIEFw
cmlsIDI4LCAyMDI1IDExOjMyIFBNDQo+ID4+DQo+ID4+IE9uIDE0LjA0LjIwMjUgMDk6NDAsIFBl
bm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gLS0tIGEveGVuL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVx
LmMNCj4gPj4+ICsrKyBiL3hlbi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jDQo+ID4+PiArICAg
IHsNCj4gPj4+ICsgICAgY2FzZSBYRU5fUFhfSU5JVDoNCj4gPj4+ICsgICAgICAgIGlmICggc2hh
cmVkX3R5cGUgKQ0KPiA+Pj4gKyAgICAgICAgICAgICpzaGFyZWRfdHlwZSA9IHByb2Nlc3Nvcl9w
bWluZm9bY3B1XS0+cGVyZi5zaGFyZWRfdHlwZTsNCj4gPj4+ICsgICAgICAgIGlmICggZG9tYWlu
X2luZm8gKQ0KPiA+Pj4gKyAgICAgICAgICAgICpkb21haW5faW5mbyA9IHByb2Nlc3Nvcl9wbWlu
Zm9bY3B1XS0+cGVyZi5kb21haW5faW5mbzsNCj4gPj4NCj4gPj4gRG9lcyB0aGlzIG5lZWQgdG8g
YmUgYSBzdHJ1Y3R1cmUgY29weT8gQ2FuJ3QgeW91IGhhbmQgYmFjayBqdXN0IGENCj4gPj4gcG9p
bnRlciwgd2l0aCB0aGUgZnVuY3Rpb24gcGFyYW1ldGVyIGJlaW5nIGNvbnN0IHN0cnVjdCB4ZW5f
cHNkX3BhY2thZ2UgKio/DQo+ID4+DQo+ID4NCj4gPiBJJ3ZlIGNvbnNpZGVyZWQgaGFuZGluZyBi
YWNraW5nIGEgcG9pbnRlciwgdGhlbiBtYXliZSB3ZSBuZWVkIHRvDQo+ID4gYWxsb2NhdGUgc3Bh
Y2UgZm9yICJzdHJ1Y3QgeGVuX3BzZF9wYWNrYWdlICoqZG9tYWluX2luZm8gPQ0KPiA+IHh2emFs
bG9jKHN0cnVjdCB4ZW5fcHNkX3BhY2thZ2UgKik7IiwgYW5kIFhWRlJFRSh4eHgpIGl0IGluIGVh
Y2ggZXhpdCwNCj4gZXNwZWNpYWxseSBjcHVmcmVxX2FkZF9jcHUoKSBoYXMgYSBsb3QgZXhpdHMs
IHdoaWNoIGNvdWxkIGJlIGEgZmV3IGNvZGUgY2h1cm4uDQo+ID4gU28gSSBjaG9zZSB0aGUgc3Ry
dWN0IGNvcHkgdG8gaGF2ZSB0aGUgc21hbGxlc3QgY2hhbmdlLg0KPg0KPiBJIGZlYXIgSSBkb24n
dCBzZWUgd2h5IHN1Y2ggYWxsb2NhdGlvbnMgKG9mIHNwYWNlIGhvbGRpbmcgYSBzaW5nbGUgcG9p
bnRlcikgd291bGQgYmUNCj4gbmVjZXNzYXJ5LiBBZmFpY3QgYWxsIHlvdSBuZWVkIGlzIGEgbG9j
YWwgdmFyaWFibGUgb2YgdGhlIHNwZWNpZmljDQo+IChwb2ludGVyKSB0eXBlLCB0aGUgYWRkcmVz
cyBvZiB3aGljaCB5b3UgcGFzcyBpbnRvIGhlcmUuDQo+DQoNCg0KYGBgDQogICAgICAgIHN0cnVj
dCB4ZW5fcHNkX3BhY2thZ2UgKmRvbWFpbl9pbmZvOw0KICAgICAgICBzdHJ1Y3QgeGVuX3BzZF9w
YWNrYWdlICoqZG9tYWluX2luZm9fcHRyID0gJmRvbWFpbl9pbmZvOw0KYGBgDQpPaCwgcmlnaHQs
IEkgY291bGQgY3JlYXRlIGEgbG9jYWwgdmFyaWFibGUgdG8gYXZvaWQgbnVsbHB0ciBpbml0aWFs
aXphdGlvbi4NCg0KPiBKYW4NCg==

