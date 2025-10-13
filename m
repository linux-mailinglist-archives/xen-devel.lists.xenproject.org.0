Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8CFBD1FA3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 10:16:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141820.1475981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DjH-0001kj-UR; Mon, 13 Oct 2025 08:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141820.1475981; Mon, 13 Oct 2025 08:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8DjH-0001jM-R0; Mon, 13 Oct 2025 08:16:27 +0000
Received: by outflank-mailman (input) for mailman id 1141820;
 Mon, 13 Oct 2025 08:16:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8DjG-0001jG-6Q
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 08:16:26 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e816a9a3-a80c-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 10:16:23 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH8PR12MB6940.namprd12.prod.outlook.com (2603:10b6:510:1bf::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.11; Mon, 13 Oct 2025 08:16:19 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%3]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 08:16:18 +0000
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
X-Inumbo-ID: e816a9a3-a80c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVOGnqq1WEfwNkIdXgHRO3QDxPTcSeTkoLiB/NZUMS8kg7Bbb6YsYehDyvAauF5Aa0Ecqv43+z/v2isFhPW/jAO105j+inn4DAPkfU0Jhyc2K0rIna8aq55aR0Ro0CpHsbhtzZVyrrrXQmM8fQIbi9X+qTg3qn58yR978SgowFY6SY73ZRTNXCcEfxnf8q3FJWWZkXrQ6T8EZuDFVYst1ASePB9G+L/J2AmNrHK7d6L17E6Rr20nbtaBUBerKSXTIqxDmVW/SKhfyfrpCRMYO2/dpw2A2h/BpFctbzLwhtxsTz8VUHPiBVCGC2c16T6555DXqwlDGKXgnwJTfcA32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h++AllElID1HxjF1HaUrAPJtMNOpcRaOVOLhUh9zV7Q=;
 b=VBfKB5WJAYp2n4VWx4quXeyIc25l2iV5/PhTJa9w24oLDgYdpf+GD9Ne/WIP3DKwP1L0LiGcbmO56CWnWem4dA6Kl5yuSQZVUMuHCsukx8vlWxc3HzPEeIkjwK9LwOesQjQiSvMwFsqKTBoK5o/qUBxjv8QsL3hTuXguFE75I4l2GXIXmwALeuKGf97N+4sKOO5EYiSAKe6p+NBWBsRCY5wVLIGq1T1tqw+mEDNsakulHvxchu7SAAvpX0ybLGlxwFSUK602TOU7CtDbDxVqwNXpDIeqD/9j9H860c7b9Gqdd8/c3blHNdl+bA12IvqMiLvIurTWNi49U4P39RiJ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h++AllElID1HxjF1HaUrAPJtMNOpcRaOVOLhUh9zV7Q=;
 b=SzldPtDKxUa/yjzZ4l+5A8QGkB2i8212873kIQHLgumFSBVvxBDTE28hM4KILxw9AtQDNyKiP6fwbyAluMdzvfXJ8/+vpwh79Ll7mcKQroKQf+g0Jx/bn++OrWaoYEeJBQTi6kKVqRAvYPOhN94aAjTswNXcCSbwri00bHfws9k=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Andryuk, Jason" <Jason.Andryuk@amd.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v10 7/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Topic: [PATCH v10 7/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Index: AQHcLEQGdopGfovwgUWGl4QJnXlfibSg55+AgAATNQCAAnMfgIAcZtaw
Date: Mon, 13 Oct 2025 08:16:18 +0000
Message-ID:
 <DM4PR12MB8451A861703C516E74518B26E1EAA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
 <20250923043826.3831957-8-Penny.Zheng@amd.com>
 <5a2e887f-d6da-42e2-aff0-efe55b041749@suse.com>
 <1106c080-508b-4328-a636-900ca8377d2d@amd.com>
 <83116585-65ef-45fa-9358-586ae46753aa@suse.com>
In-Reply-To: <83116585-65ef-45fa-9358-586ae46753aa@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-10-13T08:16:12.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH8PR12MB6940:EE_
x-ms-office365-filtering-correlation-id: 37ccd564-becd-4ec4-60fb-08de0a30c960
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZmZwRnovVEl4ektIbVc1NG1hMnQxbFk2ekpSWlVVMnhsTHlQUjB5UkU3YjZh?=
 =?utf-8?B?cEFURk9KQ3ZyYVdseWRWTjVRWEorVElrNDByYzZITVNOaDFMN3lUUXBHV1Mw?=
 =?utf-8?B?MHNkK2VPTWg3MTZjTnNVdzRBVE53NEJDQzhvTFNEMS9uQ1EzVUduWHFIeE05?=
 =?utf-8?B?UkFPU3Jhc2pmUlRLV3VGWW10d0NrUEFjdTFickFIYS9EOWo3M2ZsK2hVbzFC?=
 =?utf-8?B?NFdjaWQ5SDZZVkloQm1nR2FEYW9Mc3JJdEpsOEI5Q0MzRmpRVDdCYzNYaWVH?=
 =?utf-8?B?UnZQWXhsUjRaaWZFYktQQ3ZXTHJjQUJTQWdSWmlhdTJveDJlR01DUG15Z25W?=
 =?utf-8?B?Wlhtb1lYajdYVVhBTElBb1Bjc3pobkE4a1c3cE1ueFJNRi81YkxwUGJldTVU?=
 =?utf-8?B?YWJFem81STBweGgvNlZpeXRLck5aRzl5TW5odkdqVU95ZVRVU3I0NWxoQzRv?=
 =?utf-8?B?ZEdGRC9JRG1IZ1o2QXg5RU5uWkV3SDlkajVHOXYzSnFMMXcwb1lSV2E2RlU5?=
 =?utf-8?B?dXNwYlV3UkZQdjdMVTVXdzUyTng4UWIzL2xmODN3QkVmZktZdUJqUkpNejg1?=
 =?utf-8?B?N1h5OHdYQldzZHM5YUkySTYyd2ZoMTh5d2lTQXZwMXlMc1pZSmUzSVVQZzAy?=
 =?utf-8?B?a1JJQ0dnN2RWK0ViZnhQVXJhdTE5cmsxUmRPak5ibnU0QTVEYXRhN3BmZVYx?=
 =?utf-8?B?SjJJU3ZDeExZSitGd3dHOGFIWlZoeGlxb0ZPNURkbVBNai91bWVyOXViSndw?=
 =?utf-8?B?SjJ6eFBPK0FlclBDa0YzeGhGUWNWRXh6RFQwQUcxbzlCZnhBSm9ZUjZ4U2dx?=
 =?utf-8?B?OGVCSVptTkdXbE14S3ZyZTBSczRtZGRsRmJpY1Arc3VoU3dXLy9XOXFxNTlw?=
 =?utf-8?B?NVRMZUVJQnRGclA2VHBlMkFob2tPT08xUS93Qmk1NFJPc21pQ3h6cVdtVnNp?=
 =?utf-8?B?VFF3MlphQkVlVXJ5S3NmSUhTRCtKNHFtd0NlOElrZHhNdS9hbGx3NnlEMit6?=
 =?utf-8?B?M1lnOHo5cG9sYkkwdkIzR1owVC9lTWpNSGc3dU5iUm5GdFR2a09QTFdPSStF?=
 =?utf-8?B?VFNsLzRBRzdONk1zR3FnRzc5WFRvRXhkb21pejdlUGZtY2hFMnptN0xqT0tm?=
 =?utf-8?B?c2g4Uml3Ly9ZZ210M3FaVU5QMlY1SUFzSXFPa0lTeVJiUVFTNEdySFc1b283?=
 =?utf-8?B?UXRUejlxUEJMT1poQ1JySXdkRUZhcVphY1FNTUo3VElpMWVTdHFhYmNKbjI2?=
 =?utf-8?B?b2E2c0pZZVBOZ0xDc291TXBSSmFJR1dJakZnM042WlEwQ3dNYXBETVlPY0N0?=
 =?utf-8?B?OTA5N3NuYVZra1pST016dmJFOWkrSUFmc1B0THhFT3VVVFpsaWtsVUhlSTMz?=
 =?utf-8?B?ZDB0RFNTMVRxNm5IYmlETVYvM1BLa09vWEdId0ZWQ1R1YmV2MUhoZC94N0ZX?=
 =?utf-8?B?OVowcnZwWEZreU02UDdIL1BCcVlTSk1EZ1dFTEFsSjUrcStObFBVUHp3aTdw?=
 =?utf-8?B?YlpJd3BXS0xOckVNaTFqSnptZkcwVURJY3ZKbGo1Nkg2UjQ2VDN3VFRPRTVZ?=
 =?utf-8?B?emZxTmxiZi81SG9HRkRGQjNpWFpxM3NtVHlOdi9BZWh6L2M5WmRpWnVRVFZz?=
 =?utf-8?B?cnI0SHNueUpMaXlPbkZBRXBSdGN5VDFtdCtDMjRBVTdiY0h1bWRJZFBNUG1s?=
 =?utf-8?B?QWpWakN0RVlFQzJQNkw0QXAwYjVESExqRGZmdm1wZldmUWliWjBPSnJGTUl0?=
 =?utf-8?B?UGFRcEFoTjlPME4vUUtFbGdMSjhsNFZ6endsSUhvZHk5b2RBQjVTcnkyaHoz?=
 =?utf-8?B?aEh6NFB1YnhqTFpnZXVLdnl4WU80VStTeGhFYU9WT3Z2ampHSWdnVkgzNGcz?=
 =?utf-8?B?WXg1QVNxYzAxTyt6eU4rK0lKVG1qQ2h2VjR6TlhxZlJoUFZ0RnlFMEpBR0VP?=
 =?utf-8?B?VVJqSzZqNjczTVh2am1CMkFGSy9DdUZ1ZitUdUMvM2pmUngzSUxkUHBwYTVm?=
 =?utf-8?B?dEdGN0M2MWt3VFViZ1B2Mk1XR081Q1pobGEzMVNnZ0NhdFRsWkxraGRudmV6?=
 =?utf-8?Q?YLae7q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDNBZW1wb1dlbVZQUitaNTJjelFraG9uOU9lUVJXZG5yd2Exb0Q4blNRMkNE?=
 =?utf-8?B?N3VYbE93cytzTWJtZUxVeCtVWG9objZQZjRHQkRMQ2dyTHlNYTN0ZlAzS1NR?=
 =?utf-8?B?a3hVVzlzRnFYbTg1dW9DZG9uVGdxM1U0Q2tWRWY1T0RSNkp2VVlyUnhJYldk?=
 =?utf-8?B?TE53Tm5YZ1g0eTlxWGV6K3JwNmRNSG9kd2p1T25hd1pwa09iRm83b1hiU21i?=
 =?utf-8?B?THZyKzRsSzhoSHJZOE9yamJ2b3dQK3hudXdhamoveTQ4NXEybmxjZVJ6b1Qw?=
 =?utf-8?B?RktzT2czdUVjZEl2aHB3Mmc5SnR5a1UxR3NQNFEycXEzdElOK2dvL1IycE5v?=
 =?utf-8?B?TWdCNUlZbFFJL1RpZlBkbkFQbTZ2OWZ4NG1RNnBJVWJMN0xJOGRiOTlHNldZ?=
 =?utf-8?B?RDVQZEE3Zk1zbS9Xd2I5WWE4bHY1a1Q0d01SWGtZOHdRVEZmSzNvcGJkSURE?=
 =?utf-8?B?eHNGaEEwcjBzU0VjczJBeUdYbytMWXNQdXB0VWplQnJKZWoyUTd3RU8rdXA5?=
 =?utf-8?B?UzdKbFRKYUwxT0dnY2VxSTZVMDUrWDhOYUhlNEptRS9ieDhpc1RmZmJmdVdB?=
 =?utf-8?B?Y3dBczkzajZNeStqOXRkcm10bDQ4dmd6Qzd5d2I3ajRPNTNIbVlrMCt4THN2?=
 =?utf-8?B?SzBuaCtpVHdJNmdlSDZQVGpTTjIrUXQ3bUhNS2FWZXNhcnROQUdDZ3piRXpJ?=
 =?utf-8?B?SzdScEdER0drZGNyTVFWOFB1TjJ6NSt2cEdkOHdwWEdFTEduQkZXNUN3NE50?=
 =?utf-8?B?NjFhU0k4T1hIUEZRQml6Q1hFQ3Bwd1Z6aVJybUNhTHlSR2xxQU5CK2R4U1B0?=
 =?utf-8?B?ZWhWMHFwSjFBTWlqdG1nUDRiZFR5bnJkUTdNYUNibnpZRGVzUm9ES1VtVi9Q?=
 =?utf-8?B?T0Q5eXRkMWZJcWN6NjFGMGhTdzh2VTJabklibjBnWEI2d3R5MFNUT2NlK3Zz?=
 =?utf-8?B?bWlMaGU5TjRWcFh6bitqYVBUV1BZN2h2aWplaWpXdk5BYWFMUkJUUlROUVNV?=
 =?utf-8?B?eVh2U0Zkb0o2alZ3dTBXSDlZUDRZUnIxaEJ0RHFGbnl4MEl0T0NJeU9WMmJU?=
 =?utf-8?B?U1YwcDdlYXg5QTZ0TjYwWEI1UURjeUdVT1RhUkg5UGFaUmVySTF5Z2IzUmQz?=
 =?utf-8?B?OWVPd0ZTTU4rWHU4bFJraVVFTllPa3d2TEJqVFhKRmFiekJPU0tzOFZac01r?=
 =?utf-8?B?d0N2dE81UE01MXJ6YWF4bUs2UEE4VVduSTI0SU5qN1BPc0hwNUpRVW11amNj?=
 =?utf-8?B?aTJ1bG5uVW1IQlhaUW0wOVkvRnhVd2JSWWw3anNFS010QlFkenZ3dU1KMlEy?=
 =?utf-8?B?N3NVdlkvRW5jRWYzNXJ0TFNrWDBZeGljOUtkVDF5cjFpQkNPSm9weHN4UHhZ?=
 =?utf-8?B?NWFhSVZoZTgxR1BqelNkUTBCT3RoY3Y3a2NLdkNmMTNocktkaUhyM1JmaVlX?=
 =?utf-8?B?ekxaSTMranR3Q0dXVGtIREF3NkZSY3doa0xFYnlGTDgwc1duQWRBY1BoVE9B?=
 =?utf-8?B?bkUvWnlUcGNENVMyUWREc3UvcXhGMGYvOE03emU0ZzU2U2F0K1FLL3B0SjJw?=
 =?utf-8?B?anhHRmFielQ2MnJ3RmF0ejVPTGRNc1pISkRRalFkK0tBSjZPOGVOTkQ1TGxj?=
 =?utf-8?B?LzRmajRBVUtoWnA1RmVFWnJEMTN5dGNic2VHS214cXVRRFhaZDcvZTQ0SUFn?=
 =?utf-8?B?Vm9iS2V6WGozci9mSk55S3hxeHBTWlcvSFZoYU9PaWd3MXhEZkVRMzNZRDd4?=
 =?utf-8?B?MjRKa0F1ZFlRR1RJWDFqUDFtc1BzT2J4SHJKZklyM2lPL0w0NDdRQy8rVmFD?=
 =?utf-8?B?dEZHL3Z4dTZaa2hJNXV5NEo0K0RrVVU3dm41UWVpeVBNVU1BdHdDdVJZbFR4?=
 =?utf-8?B?bmFOTkk3OGhHOWtCRlVsMmV2bHQ5ZTJwNFRJb0U0WUlPSWRyZ2ZERFJFUEFU?=
 =?utf-8?B?UVFrVXJKUWpBcU1HZEpsZHBMTDVTdXhDZkVCTithTGdCZW9qdk9NclNzbUQy?=
 =?utf-8?B?aHVQUlpybW9VcHNNMWFFa3VCRVJBVjVWVmtQZHJHdmFIa01FaGk5WGZ6bHJt?=
 =?utf-8?B?eGF0cEJkcTd3ZFpOVXMwN213N094YVJFTVhyc2FQRnVUQTFIM2docGp5WEZ6?=
 =?utf-8?Q?JnO8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ccd564-becd-4ec4-60fb-08de0a30c960
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 08:16:18.6177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+RqN4ak0M8RN/N0e9pntS2saPuxJhy5D+N6G+Jv5erWG/YLwcghkZfIpPGr5Z1ti3zR7acdXsZ/h3vL/hkAZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6940

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjUs
IDIwMjUgMjoxMiBQTQ0KPiBUbzogQW5kcnl1aywgSmFzb24gPEphc29uLkFuZHJ5dWtAYW1kLmNv
bT47IFBlbm55LCBaaGVuZw0KPiA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6IEh1YW5nLCBS
YXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW50aG9ueSBQRVJBUkQNCj4gPGFudGhvbnkucGVyYXJk
QHZhdGVzLnRlY2g+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsN
Cj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTAgNy84XSB4ZW4vY3B1
ZnJlcTogQWRhcHQgU0VUL0dFVF9DUFVGUkVRX0NQUEMNCj4geGVuX3N5c2N0bF9wbV9vcCBmb3Ig
YW1kLWNwcGMgZHJpdmVyDQo+DQo+IE9uIDIzLjA5LjIwMjUgMTg6NDcsIEphc29uIEFuZHJ5dWsg
d3JvdGU6DQo+ID4gT24gMjAyNS0wOS0yMyAxMTozOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+
IE9uIDIzLjA5LjIwMjUgMDY6MzgsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4gQEAgLTE1NCw2
ICsxNTYsMTcgQEAgc3RhdGljIGludCBnZXRfY3B1ZnJlcV9wYXJhKHN0cnVjdCB4ZW5fc3lzY3Rs
X3BtX29wDQo+ICpvcCkNCj4gPj4+ICAgICAgIGVsc2UNCj4gPj4+ICAgICAgICAgICBzdHJsY3B5
KG9wLT51LmdldF9wYXJhLnNjYWxpbmdfZHJpdmVyLCAiVW5rbm93biIsDQo+ID4+PiBDUFVGUkVR
X05BTUVfTEVOKTsNCj4gPj4+DQo+ID4+PiArICAgIC8qDQo+ID4+PiArICAgICAqIEluIENQUEMg
YWN0aXZlIG1vZGUsIHdlIGFyZSBib3Jyb3dpbmcgZ292ZXJub3IgZmllbGQgdG8gaW5kaWNhdGUN
Cj4gPj4+ICsgICAgICogcG9saWN5IGluZm8uDQo+ID4+PiArICAgICAqLw0KPiA+Pj4gKyAgICBp
ZiAoIHBvbGljeS0+Z292ZXJub3ItPm5hbWVbMF0gKQ0KPiA+Pg0KPiA+PiBhbWRfY3BwY19wcmVw
YXJlX3BvbGljeSgpIG1heSBsZWF2ZSAtPmdvdmVybm9yIHNldCB0byBOVUxMIGFmYWljcywgc28N
Cj4gPj4gSSB0aGluayB5b3UgbmVlZCB0byBhZGQgYSBOVUxMIGNoZWNrIGhlcmUgYWxvbmdzaWRl
IHdpdGggcHVsbGluZyB0aGlzDQo+ID4+IG91dCBvZiAuLi4NCj4gPj4NCj4gPj4+ICsgICAgICAg
IHN0cmxjcHkob3AtPnUuZ2V0X3BhcmEucy5zY2FsaW5nX2dvdmVybm9yLA0KPiA+Pj4gKyAgICAg
ICAgICAgICAgICBwb2xpY3ktPmdvdmVybm9yLT5uYW1lLCBDUFVGUkVRX05BTUVfTEVOKTsNCj4g
Pj4+ICsgICAgZWxzZQ0KPiA+Pj4gKyAgICAgICAgc3RybGNweShvcC0+dS5nZXRfcGFyYS5zLnNj
YWxpbmdfZ292ZXJub3IsICJVbmtub3duIiwNCj4gPj4+ICsgICAgICAgICAgICAgICAgQ1BVRlJF
UV9OQU1FX0xFTik7DQo+ID4+PiArDQo+ID4+PiAgICAgICBpZiAoICFjcHVmcmVxX2lzX2dvdmVy
bm9ybGVzcyhvcC0+Y3B1aWQpICkNCj4gPj4+ICAgICAgIHsNCj4gPj4NCj4gPj4gLi4uIHRoaXMg
Y29uZGl0aW9uYWwuDQo+ID4+DQo+ID4+IFRoZSBkZXNjcmlwdGlvbiBhbHNvIGNvbnRpbnVlcyB0
byBub3QgbWVudGlvbiB0aGUgZWZmZWN0IGZvciBIV1AuIEknbQ0KPiA+PiBhY3R1YWxseSBzb21l
d2hhdCBjb25mdXNlZCwgSSBzdXBwb3NlIChKYXNvbiwgcXVlc3Rpb24gbWFpbmx5IHRvIHlvdSk6
DQo+ID4+IEhXUCBmYWxscyBpbiB0aGUgZ292ZXJub3ItbGVzcyBjYXRlZ29yeSwgaWlyYy4gWWV0
IGl0IGRvZXNuJ3Qgc3VwcGx5DQo+ID4+IGEgLnNldHBvbGljeSBob29rLCBoZW5jZSBfX2NwdWZy
ZXFfc2V0X3BvbGljeSgpIGdvZXMgdGhyb3VnaCB0aGUNCj4gPj4gbm9ybWFsIGdvdmVybm9yIHNl
dHRpbmcgbG9naWMuIFdoYXQncyB0aGUgZGVhbCBoZXJlPyBUaGUgYW5zd2VyIG1heQ0KPiA+PiBh
ZmZlY3Qgd2hldGhlciBJJ2QgZGVlbSB0aGUgcHVsbGluZyBvdXQgb2YgdGhlIGNvbmRpdGlvbmFs
IGNvcnJlY3QNCj4gPj4gKG9yIGF0IGxlYXN0DQo+ID4+IGJlbmlnbikgaGVyZSBhcyB0byBIV1Au
DQo+ID4NCj4gPiBIaSwNCj4gPg0KPiA+IFdoZW4gSSB3cm90ZSBIV1AsIEkgZGlkbid0IHJlYWxp
emUgdXNpbmcgLnNldHBvbGljeSB3b3VsZCBieXBhc3MgdGhlDQo+ID4gZ292ZXJub3IgY29kZS4g
IEluc3RlYWQsIEkgaW1wbGVtZW50ZWQgdGhlIG5vLW9wIEhXUCBnb3Zlcm5vciwgc2luY2UgSQ0K
PiA+IHRob3VnaHQgSSBuZWVkZWQgc29tZXRoaW5nIGFzIGEgZ292ZXJub3IuDQo+ID4NCj4gPiBz
ZXRfaHdwX3BhcmEoKSBhY3R1YWxseSBjaGFuZ2VzIHRoZSBjb25maWd1cmF0aW9uLiAgSFdQIG9u
bHkNCj4gPiBpbXBsZW1lbnRzIHRoZSBlcXVpdmFsZW50IG9mIGFtZC1jcHBjLWVwcCBhdXRvbm9t
b3VzIChhY3RpdmUpIG1vZGUuDQo+ID4NCj4gPiBTbyBJIHRoaW5rIEhXUCBjb3VsZCBzd2l0Y2gg
dG8gLnNldHBvbGljeSBhbmQgZHJvcCBpdHMgZ292ZXJub3IuDQo+ID4NCj4gPiBCdXQgbG9va2lu
ZyBhdCB0aGlzIGh1bms6DQo+ID4NCj4gPiAgPiBAQCAtMzIxLDEwICszMjcsMTIgQEAgc3RhdGlj
IGludCBzZXRfY3B1ZnJlcV9jcHBjKHN0cnVjdCAgPg0KPiA+IHhlbl9zeXNjdGxfcG1fb3AgKm9w
KQ0KPiA+ICA+ICAgICAgaWYgKCAhcG9saWN5IHx8ICFwb2xpY3ktPmdvdmVybm9yICkNCj4gPg0K
PiA+IERvZXNuJ3QgdGhpcyAhcG9saWN5LT5nb3Zlcm5vciBwcmV2ZW50IGFtZC1jcHBjLWVwcCBm
cm9tIHNldHRpbmcNCj4gPiBwYXJhbWV0ZXJzPw0KPg0KPiBPbmx5IGlmIGFtZF9jcHBjX3ByZXBh
cmVfcG9saWN5KCkgdG9vayB0aGUgZGVmYXVsdCBjYXNlIHBhdGggb2YgaXRzIHN3aXRjaCgpLCBh
aXVpLg0KPiBQZW5ueT8NCj4NCg0KSG1tbSwgSSBzaGFsbCBhZG1pdCB0aGF0IEkgb21pdHRlZCB0
aGUgZGVmYXVsdCBjYXNlLg0KQWN0dWFsbHksIGluIGN1cnJlbnQgY29kZXMsIG5vIG1hdHRlciBp
dCBpcyBhbWQtY3BwYyBvciBhbWQtY3BwYy1lcHAsIG9yIGFueSBvdGhlciBjcHVmcmVxIGRyaXZl
cihleGNlcHQgaHdwKSwgaW4gaXRzIC5pbml0KCksIHdlIGhhdmU6DQpgYGANCnBvbGljeS0+Z292
ZXJub3IgPSBjcHVmcmVxX29wdF9nb3Zlcm5vciA/IDogQ1BVRlJFUV9ERUZBVUxUX0dPVkVSTk9S
Ow0KYGBgDQpTbyB3ZSBoYXZlIENQVUZSRVFfREVGQVVMVF9HT1ZFUk5PUiB3aGVuIG5vIHNwZWNp
ZmllZCBnb3Zlcm5vciBzZXQgdGhyb3VnaCBjbWZsaW5lLCBhbmQgaXQgaXMgb25kZW1hbmQuLi4g
QXMgbG9uZyBhcyAuaW5pdCgpIGlzIGV4ZWN1dGVkIHN1Y2Nlc3NmdWxseSwgd2Ugd2lsbCBuZXZl
ciBoYXZlIE5VTEwgZ292ZXJub3IgZmllbGQgcmlnaHQgbm93Lg0KDQo+IEphbg0KPg0KPiA+ICA+
ICAgICAgICAgIHJldHVybiAtRU5PRU5UOw0KPiA+ICA+DQo+ID4gID4gLSAgICBpZiAoICFod3Bf
YWN0aXZlKCkgKQ0KPiA+ICA+IC0gICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4gPiAgPiAr
ICAgIGlmICggaHdwX2FjdGl2ZSgpICkNCj4gPiAgPiArICAgICAgICByZXR1cm4gc2V0X2h3cF9w
YXJhKHBvbGljeSwgJm9wLT51LnNldF9jcHBjKTsNCj4gPiAgPiArICAgIGlmICggcHJvY2Vzc29y
X3BtaW5mb1tvcC0+Y3B1aWRdLT5pbml0ICYgWEVOX0NQUENfSU5JVCApDQo+ID4gID4gKyAgICAg
ICAgcmV0dXJuIGFtZF9jcHBjX3NldF9wYXJhKHBvbGljeSwgJm9wLT51LnNldF9jcHBjKTsNCj4g
PiAgPg0KPiA+ICA+IC0gICAgcmV0dXJuIHNldF9od3BfcGFyYShwb2xpY3ksICZvcC0+dS5zZXRf
Y3BwYyk7DQo+ID4gID4gKyAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4gID4gIH0NCj4gPg0K
PiA+IFNvIHRoZXJlIG1heSBiZSBvdGhlciBjaGVja3MgdGhhdCB3b3VsZCBuZWVkIGRyb3BwaW5n
IG9yIGFkanVzdGluZyB0bw0KPiA+IHN1cHBvcnQgSFdQIHdpdGhvdXQgYSBnb3Zlcm5vci4NCj4g
Pg0KPiA+IFRoYW5rcywNCj4gPiBKYXNvbg0KDQo=

