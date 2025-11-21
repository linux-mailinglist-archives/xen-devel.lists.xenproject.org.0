Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBEFC77FAE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 09:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168442.1494450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMMnm-0003IW-BA; Fri, 21 Nov 2025 08:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168442.1494450; Fri, 21 Nov 2025 08:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMMnm-0003GY-8F; Fri, 21 Nov 2025 08:47:34 +0000
Received: by outflank-mailman (input) for mailman id 1168442;
 Fri, 21 Nov 2025 08:47:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMMnl-0003GS-9a
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 08:47:33 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b663549b-c6b6-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 09:47:30 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA1PR12MB8240.namprd12.prod.outlook.com (2603:10b6:208:3f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 08:47:26 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 08:47:26 +0000
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
X-Inumbo-ID: b663549b-c6b6-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOqGXKu9cBriFRXRrQh2eYl+dAbf7/EdWS/r/SCtAzKmaznQq53ZduM2iNmEUvQaAg4j2c3VElHfujuM4+S4cqTN61HY33yH0cYfU3LKQkrN8tA07sIZLFUFUY1qB04Gj0i2TuhkwPi4X2485cYcwD1EU0IaAJRr8rZPOThypKlAu5iRPkWx/f/7ac6bzOBiXVD5YtRi2inXJEu+j75MdaWzJS70plnzhxJt4hzRhehI1lktqMr7ZXpUVnNMv71J5pMfu5EW98HDceMU4wZAmb6I+pmS9rk4O0myaJdq1aYRZEd+O4irFPWTEljs6Hfh3cJMXrZI97t2DxNnynhYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lv3sdbdcPaHTYYZ9qFrZbVCpw+canb6m9/XDHG/H/pA=;
 b=bSQJ9V99Mwz3HE+TQ1onQyo2WCPGAZZCNy5jsJnt8PEp+F3/tuxJHwzYgTFs/955f0OnWMMKNrSFSb2EFIcA3uv1kxfxyEs6hAdtC8htm6g9IzMiadrJ12Kx4CXoNv2HDkCaIVUwaF221BjWPDJFq/7SE6tviaRps1gCxTFKECSCxtPhnG1CYV72qcEvnGDGIeknMeg7yLpYssH84fIM8+WcRQ8gCDa9N4j/rcpttgGmf0COmJ56L8XnVD/Qs/igg8TP2PXM0H8RmgytiMyVlxJ5M8vpv2FJdTS+vhIzNs0zXDTzHhgNgJrdsmiH/PnxT8BYuZ5/NUW72pihrq5piw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lv3sdbdcPaHTYYZ9qFrZbVCpw+canb6m9/XDHG/H/pA=;
 b=XuhDDzSDZfp/0C3QZzdngXXa6NiP2adCfjfheCQHgTTGiOWW5Zdn2jCjk8eemHhxxHC5Dk2RKj0lu/7XwQWifSE22t6PBbdJoV2ClsjMpkFfbGusrFy6e6mqXtL1PBpzi472K2gtVjaISH7IgTDQ14QDHhkwCzpC9x1Bp2sq/qA=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 2/7] xen/xsm: wrap xsm_vm_event_control() with
 CONFIG_VM_EVENT
Thread-Topic: [PATCH v2 2/7] xen/xsm: wrap xsm_vm_event_control() with
 CONFIG_VM_EVENT
Thread-Index: AQHcWrs/qm1DByfUmEiEsQ0KFVhiiLT8wi8AgAAOyqA=
Date: Fri, 21 Nov 2025 08:47:26 +0000
Message-ID:
 <DM4PR12MB8451E73C42835C4F4EE6D65BE1D5A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121074803.312568-1-Penny.Zheng@amd.com>
 <20251121074803.312568-3-Penny.Zheng@amd.com>
 <04570040-beee-4150-907a-20ffacfda689@suse.com>
In-Reply-To: <04570040-beee-4150-907a-20ffacfda689@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-21T08:47:19.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA1PR12MB8240:EE_
x-ms-office365-filtering-correlation-id: d26771ad-78e6-48ec-b87d-08de28da98f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Zng1V3JvbSs3RkJFWDNzaWRSdmlaYm9Ub1lmTWpPMXR5NkxoNFlJYmlaTWMw?=
 =?utf-8?B?WWdDdVFldXdGZHhQMmpNUmxScG0yaVpNelFEWVNnSnRRZHIwN0R6Qkd4M0Qy?=
 =?utf-8?B?US9qTTQ2UjdHemdtQ1RDVFQ4L2Nic3UyUDB6ak56UlNhRWVBd3NocWFFU25O?=
 =?utf-8?B?V2JrQnJjcGpSZUdZbXBYOXR5K2RkU2VXMWp5cDlrQTIzU3k3VzBVd0N3UmFU?=
 =?utf-8?B?aEt0K3dWck5ncGM0elV4Nzd0ZEZuUGVCSnlpeHdBUW95dWczTUE5azBKZWdo?=
 =?utf-8?B?SEpKU2JBOE1Bb2JhclRwLzJ5TGNWbC9lcWlVMFI0SHBmUks3Vno4VXlyZStC?=
 =?utf-8?B?d0Fsa1BzandJbG9HcFlkRVg2bDRCYzJERWF5ZitpTmZsUUtkaExMUWZ6NmUy?=
 =?utf-8?B?ZkdxTDNncGdtV3p2emNMNlp0dW5zSFFZZFJzM1Y3c2xsdXJSU0xqclVKL3FR?=
 =?utf-8?B?WHB0RTFOR1Jkdkp4dFdaMGd1TE9tdWVPdE5xZW9Vd3RBcS9MdStBLzRRTEsr?=
 =?utf-8?B?aDMwQm9GMkcwemc2aHZpOUIrb1FyTnhDalQveXV0ZERPQlREK2YyOVRmNVF2?=
 =?utf-8?B?aUxwRTFEcXRVNGp5bUFmQXJnNjdaSUJWS1dJRHcwNnVXaklCcVdwM2pCRXRm?=
 =?utf-8?B?dUo1S0FmeFc5RzFRY09xa1lwTmpWR0xJUXpjVENaa2RycHRvUmxaRUpkVGQv?=
 =?utf-8?B?Mlh2ZkJBWWdnME1ONCtKRVlDQ1NFYWlmUnZFZGJMZXp4SnJCSlNRMW1xUDBZ?=
 =?utf-8?B?RnlOVWV2S1M4eDJkeENpdGFBTlpmL1FsUG1TMlBhQks1Zm1HWDVVcE5vVk04?=
 =?utf-8?B?c0RVMTBNRjZpbDRtc3NPM0NWbCsya2VSbE9xOUw0bWRqT1RhMUo0SFRIZGdO?=
 =?utf-8?B?Q1U3MTRjQi80amF5RnlDMkRXaGpKdHdoTkVtVlFlSHV2cVg4REhha3d2cVNK?=
 =?utf-8?B?aWdoNnhYdXlWUlRmZUV5QWxpMzdVOXRlSW5VcDhhQkVYeXY4b3hKVzNrM2lI?=
 =?utf-8?B?MzRudXgxczFkUTlmV0FIVWhsRlk4aHlMaFhWbERad0JycDh6K2l4U2U4K2V6?=
 =?utf-8?B?QWpIUllINkJWZG5JWVNvOWxJNUlBUU11d3pUTjNyeEx6T1FBdkI1QU4xdHdz?=
 =?utf-8?B?RGZSZkt4d0NoTldFYWlza080UllkTVVHcHM0V2xYbkh0VllmaWtRQjEvVFBs?=
 =?utf-8?B?QnNlbFdFeDU0Y0NvVy9wVE1FOUdrenY5R2xSdlg5akdnSVFDL0Y3TkQzT0pa?=
 =?utf-8?B?a0dNMytJbnhBSUI0MjZQMG0vMzJGU2VMaXMxbFh0NEJKU0crTDl6UkIweU5h?=
 =?utf-8?B?L2U3eVRxc2xhdzVxZWJJZVoyaWhFOVZCU0NSMjZKcGtub20zNmFVcUl4Ri9D?=
 =?utf-8?B?NzBVSCtpZU44OXVpcVpFbjV2M3Z4UXdtZldORkNrTG9lL04wSWo2ZDBNTmxF?=
 =?utf-8?B?UVVrYmI1TThCK1lpTmZRZjVob3lQanhMS3RIWFd3STlCd1MyaWNqOHhaTnJC?=
 =?utf-8?B?TXoxMWNrQlV4VndVYlNZL2x0dFRhZ1M2RGZHN0FvWTNSMHNWTU02M1EvMWRM?=
 =?utf-8?B?YURUY3EzcERraFkrNHJpTmFYaUZUcmZ6NHZJV0lNYkQ1aEx4TDNFY2xMdldR?=
 =?utf-8?B?eVF0dGJ2MkVKM3lKM2FNRWRLbzczUVZVVHFRYmVwQmZMVktHVE92eDJEckZk?=
 =?utf-8?B?Slk0dWtEQXZsK3Z2VU1ETlA3aDYyclIyT2FIVU9TaDQzMlViVmNMUzhnVmpX?=
 =?utf-8?B?Vzg4dW1EaVYydEE0dDU3M1dNc2EyaktCUDl1aFUxSUhwVjk5Q1pia0t5eHZQ?=
 =?utf-8?B?ZzFxUTk2NHBMajk5NVRVZjhiUm5xODZLYzg4V3F4bHZXbFY4RStvK0Q4aUtJ?=
 =?utf-8?B?MzFXaDFnUk9lVFNYbGllVCszWXgzZnd1SzZjTDFIT2ROemlGdEc1SmhFU1hr?=
 =?utf-8?B?bXpUSXZXZ1hiWnZWcjdHVXplMWl2MC80M0R6ZVA1MTRsWW80OWtKMG5GZHg5?=
 =?utf-8?B?c3BNMGpyKzBMZnVXYkZYU3JTdzRGT05ZNGFEd21yOXRSOWRqVVFJNkNxSFFx?=
 =?utf-8?Q?MEUMIG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dS9Sb0piL05vd1BlbVhjbHpnVEdRMnpoN3JjaDZuSnFZTSs0ci9iV2EwYnhF?=
 =?utf-8?B?eVZ2ckoxcDR2YjA1dC9BdGlhOUI3QVR3ZVNLeHQ3dVZ2Z3lTaGxYdlZPemt0?=
 =?utf-8?B?aEtXbEtraDZTZXUvRFB0NFV6VHRDdGNCcGdpTGVQZnJNWDdyS2wycURjYnds?=
 =?utf-8?B?LzFMZ0gzSzMydFUwbk1ZVzRPa2JxMXFNT0ROaXQ4bnUyb3lXR3NmNUJHZUw2?=
 =?utf-8?B?cWxOY3EzUC8rT1owSjBYT0toYnUzU04zdGlQRUQxTVJtNFRMNHdoWjJkQkRZ?=
 =?utf-8?B?Q2FBeTV4SEdsMWZucGRJV2tpaWJ2MS9mRnVKY2FWS3J1KzI2MXhXTWVSdjdF?=
 =?utf-8?B?ci9peTB3SzdUNjNEa0lFWGJ1RHpmVC9Gb09WRFg5aldlNUIzRUd1b2tSUzU2?=
 =?utf-8?B?bkdtTjlXSDlUUXNYY0tOWHhKM0ovb3BFSktseFBUVjc5NGRwa0Q5QmJjaDN1?=
 =?utf-8?B?S0hPcXBlSjB0VlVxMEEwaUI3MzRDRURyU2ZsTjVjWFpEVmd5TEV1ejQrN1JV?=
 =?utf-8?B?Q3lJVnQwQVE0QXY5bVgwU052Tmg2OHYzRUFQeEIwaFhncmx5THFEWndBVHlT?=
 =?utf-8?B?WDQwWERWVUVtQ1NwLzJKSFA1RzdjSVg3WG4wU0FGRC9GUzgzR0xOeDlSdVdw?=
 =?utf-8?B?V1dJT1o0YTgwcklQNUFDWFZvYUxSbmUwQ1Qza3BSb2dCdU5NYzhXa0NqclYw?=
 =?utf-8?B?SkRvVlZjcmh5R3FlcDFWSDJOQytGM3pGaS9GYzBUWjF3aGNrOE5jRHU4K0Vz?=
 =?utf-8?B?S1BPQXJraGdjMnVFV0J4UytNSkJUVisrTUIxRlVPOWV6aGNCYlM2ZUdUQk5m?=
 =?utf-8?B?ZXljdVJHdUovWUszS253ay9HMWswZTFnQkFlT3BSNi9kalZuQisyckFGby9m?=
 =?utf-8?B?d0RXbFFNNGFyakk1REdEQ3g1dWxWYmhrV3JvS3FYdGFtK3F1cGtVdG1rMXVn?=
 =?utf-8?B?NGVGVFVzSlNQV081Uk5pelUvbnRSVUNoWDhSNTFWbE9aZzI0UUZTelh4UjV1?=
 =?utf-8?B?UXkxSzVBVi9ReEQ2TzNYSS9sZWF3VWwydkFSV2Y0WFdONkpzNk8vakhaU0JR?=
 =?utf-8?B?QVdiNmhxZk00MUNSRnhGekI4VXhBaSt3RmYyRFkwTFpHelJCRDlZayswZHhB?=
 =?utf-8?B?cTJGbE9mam96NFRaY3ZqYTFMd3JHR25QWGFKUjZPNm9LeitERWV4MHV6c3Bu?=
 =?utf-8?B?RDN2NDRGWGNSMUpLdENTUUhNd3p6ZFk3ZkdQakZpSzRlWHUwVEIxUklGbzVT?=
 =?utf-8?B?ZmNHVDlyZ3hCY0hlb1hjQXFXejVMNE1vS1FvSUdjbG1Xd0ErWEczcUpsVUFQ?=
 =?utf-8?B?cXdReVlNcFlhRjNxV1VteEEycTRzbDdaejJhR2tRRGJNTW0xZlpvUXhXUVBo?=
 =?utf-8?B?WUVJWFdxL0RPV2RySUFQZytENXNwdnJlcERObmxOZmJwSjJvWlRjR0NCeVlZ?=
 =?utf-8?B?R3BZN0VSTzM0TmlLV2tMTjd2RHBNNUxVb2xjbHIybW9OU1Q2VUR5WDVqemtq?=
 =?utf-8?B?aUZrZWFER2UxblUzT3pNM21kQXpyZEtBaG5aV2ZYMGhva2ZnU1RLaW5rZVUv?=
 =?utf-8?B?SUs3WHNjemhaYmtlV0JQMktsM3BDWlFhdXF5QXBDQWZtMWljUitPWUx5K2JL?=
 =?utf-8?B?ZlNteGxDM05yN3I5VGN2NDhuWGJ3S0JPeXlKcytjNUovMW5IWk5OM0Z6T29m?=
 =?utf-8?B?U1F3VW1aQzIzZ2tFQWc3ZHRLalkrRE5MK0JPRkUvcWVxUS85NVFmckQyUXIr?=
 =?utf-8?B?WjRRamwzc3NUZmlOMXJPSkE2LzZZWkVsNHpJUm5iVVZNUW5udnpSVVNqV2k5?=
 =?utf-8?B?dW1QMGp6S1crd0xUeU5MWjI1TGhGRmpFdkJZTXo0NjZHUnA4aXlEQ01rTkJL?=
 =?utf-8?B?WkhyeGQrSS9wZXBScFNqVk9XRHJMaTUwaWJkRWNxNVpBRVV4dkRrOVk3WFVU?=
 =?utf-8?B?NUZuYmo5bE9LekcxT1NHMi8veVFRUFJJd2p3cVZ6K2ZkaThTZmZUcGEzUFRN?=
 =?utf-8?B?eGNuekpsaFY4alFRbkwvSS9DOVJIM2crckh6ZUh6TEFJeGhsYXFaMXhZeEVn?=
 =?utf-8?B?Yi9LTjdCekZWWmRzMEdCQWpUQU1jMDJiRzVncThuSURZQmNoVWZWbnp4SzV6?=
 =?utf-8?Q?GQ8k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26771ad-78e6-48ec-b87d-08de28da98f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 08:47:26.6967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b7B8dwcZADTIP8bIc7r3wvtz4AcZZ32AuAgYwLbDKOocSU8bx1SpSpu1aHf1A5p3D7ZNKivsmDJlHIJ4KbZDzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8240

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMjEsIDIw
MjUgMzo1MyBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBncnlnb3JpaV9zdHJhc2hrb0BlcGFt
LmNvbTsgRGFuaWVsIFAuDQo+IFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPjsg
U3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi83XSB4ZW4v
eHNtOiB3cmFwIHhzbV92bV9ldmVudF9jb250cm9sKCkgd2l0aA0KPiBDT05GSUdfVk1fRVZFTlQN
Cj4NCj4gT24gMjEuMTEuMjAyNSAwODo0NywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gRnVuY3Rp
b24geHNtX3ZtX2V2ZW50X2NvbnRyb2woKSBpcyBvbmx5IGludm9rZWQgdW5kZXIgQ09ORklHX1ZN
X0VWRU5ULA0KPiA+IHNvIGl0IHNoYWxsIGJlIHdyYXBwZWQgd2l0aCBpdCwgb3RoZXJ3aWFlIGl0
IHdpbGwgYmVjb21lIHVucmVhY2hhYmxlDQo+ID4gd2hlbiBWTV9FVkVOVD1uIGFuZCBoZW5jZSB2
aW9sYXRpbmcgTWlzcmEgcnVsZSAyLjEuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBa
aGVuZyA8UGVubnkuWmhlbmdAYW1kLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+IC0tLQ0KPiA+IHYxIC0+IHYyOg0K
PiA+IC0gbmV3IGNvbW1pdA0KPg0KPiBJbiB3aGljaCBjYXNlIC0gd2hlcmUncyB0aGUgUi1iIGNv
bWluZyBmcm9tPw0KPg0KDQpBaCwgc29ycnksIEkgbWF5IHNlbmQgdGhlIHdyb25nIGRldiB2ZXJz
aW9uLiBJJ2xsIGltbWVkaWF0ZWx5IHVwZGF0ZSB2My4gUGx6IGlnbm9yZSB2Mi4gQW5kIEknbGwg
ZXhwbGFpbiBpbiB0aGUgY292ZXIgbGV0dGVyLg0KDQo+IEphbg0K

