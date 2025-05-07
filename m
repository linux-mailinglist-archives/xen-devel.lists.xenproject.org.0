Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4FAAADA80
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 10:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978364.1365172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCaTW-0004F8-F0; Wed, 07 May 2025 08:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978364.1365172; Wed, 07 May 2025 08:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCaTW-0004CQ-Br; Wed, 07 May 2025 08:49:58 +0000
Received: by outflank-mailman (input) for mailman id 978364;
 Wed, 07 May 2025 08:49:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNVA=XX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uCaTU-0004CK-Ly
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 08:49:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2418::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ea67684-2b20-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 10:49:55 +0200 (CEST)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 08:49:47 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%6]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 08:49:47 +0000
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
X-Inumbo-ID: 3ea67684-2b20-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4/lHclWUrfFajmIKWg8embTS4IcHXTwvF0hLkJl1vQm/VSs9j0aofIiiEEVaFMH28jUdtXovlSqQ1oaZ5eknhq86TJLUhTozx3KEHrDr/KCHiUkpci8uVPQ2vLGsynyrVdc/t5EmyOeoZDLGxqiHAgBBnDHcAHCSBPhdbPSzEQcrz/5hY4gwwstsYM5qNiQQypb8GpbUvO0ZR0tJNe2+ew790rAB2AMAtLm0lxPcc/zkxFecxTANTTVMM2Kw0HMDWShaGukbya1VwNQfNlIhwxxD8RhE6XF5P4bnvlFxR2CEAQ8cmyBlWz2k81FkJgCnaKK17SOe3kPjcGY+qoBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iim4TzIPNNlnuFVtofeZlQ0kuFDBdiBMQmrS36HSZa8=;
 b=lK+/poYpwfoyWde2Us4BZ3V8asd/j4flFvvMYIsYmhvXwou6rj3jiAvua7GbFv6TpRi+WmXm04F3B+qYFdfCFE7W/dt3Li4Rib7FmnfZM3C1kNWTLZWTrJZm/NhaANLiICbiCzpBuMJEOr3w4js4g+ttH7MzKA4ZvhnTuKPMwPxyegdgZFJ1jHDXBKlqQTsdGhrwMGiwb/BSVZbr0a7dNdKs/vPbBnCNhSiZt63pe2mqb2OlDxdMp3yKl4a53lJuoTUl7p2mADhRi1w3pOp9gurpalPDPPluhfGZNW57fGujl4JymT+o34EfW05AqVK0SueUTYMH3LBTsg/3tjihcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iim4TzIPNNlnuFVtofeZlQ0kuFDBdiBMQmrS36HSZa8=;
 b=PbPj17dT5k172pwAneufQgLdjsI2HnQzxZV1qHBdmSMTjAOnlfpr5areRnAj89/XT/uiWYO7HbwBD1MO/xrAoPLO64ppiDKKinYH6jyb8+Pj5NWTb/ojeShhom6pHQiTBuio/vJLZg2XzRSOcgyconzg/MTfrtBsCeW6OBYj7Go=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 07/11] vpci: Hide extended capability when it fails to
 initialize
Thread-Topic: [PATCH v3 07/11] vpci: Hide extended capability when it fails to
 initialize
Thread-Index: AQHbsoVd9OkTHNIeNk69huFsDqzHMLPF4NaAgAGCYAD//4ZbgIAAkPkA
Date: Wed, 7 May 2025 08:49:46 +0000
Message-ID:
 <PH7PR12MB5854A0FE23FA9AA0C364FB28E788A@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-8-Jiqian.Chen@amd.com> <aBo3EfiWJUyWnl_a@macbook.lan>
 <BL1PR12MB58495E4592CA4E80DA34AE04E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aBsVI5ftmUteTaPE@macbook.lan>
In-Reply-To: <aBsVI5ftmUteTaPE@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8699.005)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|BY5PR12MB4243:EE_
x-ms-office365-filtering-correlation-id: 57643e17-c9ef-44ac-f316-08dd8d441ecf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZXZxZ3Y3K3NrWExJOGl6Y2w5NWdvRFJxenpORTh4V0FkZzdWOVMrOXhOZGtT?=
 =?utf-8?B?L3pjTXQzYldYZU9QNyt4c3pOYTA1ZGFiWjByQm9YSTBPZFhSVjgrMmhTaDdw?=
 =?utf-8?B?eUpoT21rc2ZBY0k0MXBnVk9vbVJ6Y0xmbG5YZTJRb0crYk5SNlY2WElvVzY1?=
 =?utf-8?B?azA1K3R6QTMvSU9kd1JWZlRPaHpyTHNXYTROSnE1RVFNYTNJeDkvcnVMQmJI?=
 =?utf-8?B?NGV5cFVlR2VxVjE3ekNFeE5FLzUzSGc2SFNZWlFNcmROQ2dQc0RobnZOVTdo?=
 =?utf-8?B?Z2xUQzNTUDJzM3RCS29sd1pQcWR5dnQ3Mko0WUZoWE11cWMreVhJV1U3b3BU?=
 =?utf-8?B?Q0FxYU1zV2lVT3grV2xhNUJQQ25SYkVTajdTS0lPQ3BtTWtlQTFlcHpESkow?=
 =?utf-8?B?aFhpVjZsZGtoWmZCaWdvajI1Q2ppeElVWkRXVnpiZlA3ejZqcEVjNlFhYjRH?=
 =?utf-8?B?blAxWnBsMnQzMDZ3Z0dJaEFFLzhaSFBpSkVyUEVOVkN6ZTNTMGNxSnRVeDA1?=
 =?utf-8?B?b2pKQkppci9TbVdjOVR0akRMcXBNdkN0KzYvUXdIakdmNVB2WStzNEI5b2JD?=
 =?utf-8?B?SEZPT1AybUpFdEVkUElZcWhNcEI2U2ZLVDhDbWt6aGxnaDhFdlZzVHZUenE5?=
 =?utf-8?B?V2xYbk9KSmZTdkFxQWNiam1pekc1cnlYblE2UzA1eU9HWk9LKzQ1QWJtOFl2?=
 =?utf-8?B?ZDAyTHExV3hwa1RQTFo0UGlhUlZ4b0VneVZHSDBscWNlL2FwdzY0c2VMWmxD?=
 =?utf-8?B?V25LbFZoZWVNRXU2RmFjMktjK3p4d2NacnJ5YS9BL0orTHZOYUg1UkN5M0xS?=
 =?utf-8?B?TU1mS00ydzdzWEJTOXVCeXhwZERqVXZXbXhzcDJQRVVtYmtRT3hFNERXVlor?=
 =?utf-8?B?U1hGUDNXdjdJdVlDM1BVZFZmdGlhdTNkdkNLRDFGTWQ2UjAvUThTVUkvRmVD?=
 =?utf-8?B?ZTB2bTRER2JBZzNkTndkRGtWcFRDbmhWT3BodWZRdFJFMG5Ca29WZEJOWnlV?=
 =?utf-8?B?SElmUWp2MXBBZlBOS1BVS04yNEVjVHkxYXQ2UURaSmY2T3pKK3VHakVzbTZa?=
 =?utf-8?B?dXpqVnRybVIzb3ptaUYxbE5uakYzWFNBTktoNE1CMldKMTg3dWtUR1VHY1Zi?=
 =?utf-8?B?Q2tvL2ZKd1ZlWUx1Rm5VWURramJNSHdmVC9FRjBRY1JnYkljMGpCaHUyV3g2?=
 =?utf-8?B?WS8xOUUwTE50Zys3dTM0WUswOW1iK0JBbjIvUHFYeFB4TW5lNHE0QTE1L3h0?=
 =?utf-8?B?QU9yNGVzR0dvbVpqSlcwbE95bUEyZHlkT3E2aWd2SkhMVHExVGtaZlU0QnNs?=
 =?utf-8?B?dFJFeHEvWEpYQ291SU5qcENsTG9qSjB4UHl2bytOWnVSZFFWSHpLanFiN3hG?=
 =?utf-8?B?d2tvTmRsZWNNdWpoVkNHVWN0cFA0Rjgvb2Jvczk5UjMzdDVCUVVvdG02RTBR?=
 =?utf-8?B?SXlQbWRjajE2eFlDSksvaUtPQlllZENGKy96cHpBZWNQMnI4VFBjRTlBMXhj?=
 =?utf-8?B?L2lpdXAvcTdqbTVFOWVlb1E0TWJkMHZyV0RIT04ySzh6bnpXeE1ERzJ1MDdK?=
 =?utf-8?B?OCtCYmlMMGNRTVN1Tlp0RkpZWlVldlU3U3F3NDlBY253SzN4S0tWeEptSjZX?=
 =?utf-8?B?SU1OY3p2WEh1b2xucmdCOC9EVVRQc3VNeUp0ZjJIdmNDWmVPZ21sSGtoQk5S?=
 =?utf-8?B?Z2JaK2ZGb1Z6ZzExc3Y5UjFkYnhxSVVzN2RKellvQzJ0V0pMOEJ2RzR4RGQ3?=
 =?utf-8?B?U2d1OC9FaDRxVnozdVQ3ZHcySlRWQy96c2o0S3htNzNRNWF5SWZpaWNKU2s5?=
 =?utf-8?B?MTg2YWVHWllSVFBvZmpiZnRFdVNYWUdjaDZzZ3lNOFB2cjd4ZVoweEczZXF0?=
 =?utf-8?B?SHpuZllJUHplSWJzamp6SFJIK0x2bkxZQ3NLZDBVVld5VWwwUjFFMXUzYWcr?=
 =?utf-8?B?OWh1V1FsT3A1Vkp2TUZza1JJS2N3Nk9NYWhHdXZ5TVJCYjFsQ3drbSt6bXB1?=
 =?utf-8?B?UFdHVnp5aG1nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0s4bVFhWnFvU2dNMHIxbVZqSEdldXpENGVIeWZCTkkrTWVuZjBEZTZqV0ho?=
 =?utf-8?B?TlVwVkhUUVJ3eW5FQnhpVnN5L2t3NGc5bVdvcVdKWlA0cGVzN2F4MlUzR1Nt?=
 =?utf-8?B?SHF4QUZjcDV6V2VPRXZRcGc2RER2TEUzcVV6U21RS0xTS1RRbm9vYWpLWEJp?=
 =?utf-8?B?cm9HbTdKYThzODMranQvbDYyQjg2RWJtN0x2WHV2RWhQem1wT29TUno4WmJC?=
 =?utf-8?B?c2JLY2ZEaXR0M3VUeDBOajAwTlRzUlQ1Y0JsSmFGOG1ienJySGdnd1dHVmVu?=
 =?utf-8?B?TUxIWEc4cHBnNEhiSUNRdnlSMTExa2lhbnRDNHJTbTQxWXpaWVZ1YmlpZWVH?=
 =?utf-8?B?cjlvTDZhNjVRYVpheWlEbFllUmJkUHd2aXJ4MlhTcTRPZnYyTWFXTFJrNVVh?=
 =?utf-8?B?Nk91YnhESVV4NTBtS3BUMlVSM2ZPek11bFFqK2JiYldCTElmRTdKd0g2cDZE?=
 =?utf-8?B?eXJ0RWpyNkw4MWgvTVI5S2cxanhScDlEWDgxVjFnMmRHSFp3aCtzSTZzOWF2?=
 =?utf-8?B?dHI3V3lHdHg0UzZWYnN5VWNZaXJyb2d4Qm1yelNoZ3d3aTBKT0I0b3VWekZI?=
 =?utf-8?B?VDZjYXhucld4S0RkTW5xN2M3ZmdzV0pZeE1JZG0vVURoNUltSWJCa3NTbUE4?=
 =?utf-8?B?L0MvVmlGc1gzMGx5c1hHeUlnV1BpS1F6dGZ4OGdvc3RLcVBXMktoZHZZVGUx?=
 =?utf-8?B?ODhKSC8yVHZRRlhUQW9FeFVyUFhWVlFySmJYa2NEckpTSUJ0Vy9IbUJlYkZJ?=
 =?utf-8?B?VFlEQVhKZkF6WnpnVEFPS2ZUTU5CZ0JycnFKS2NoQ3gwZ0pNSHVTL2U1Z0d2?=
 =?utf-8?B?OUpGTnBReGVqcTMzT3lab3lZNVoxRmNwU1h6ZUw4b2NZWmErVVJ4TTZOL0pk?=
 =?utf-8?B?VWJIRkNWRHNYRXVSMWY2Vm1KaWNheGMzUWg1RVRkVjZmc00wV2Z1UGpwc1Y5?=
 =?utf-8?B?eEtZVTU5UUtzQmR4Yk56eUJucG5vUE1aYWZadXpMMUdrWnJodVNkYzcweVVG?=
 =?utf-8?B?Q05zTDN2NWRWWWJ1VG1aOSt6UUVMSThvcGJ3c3J6SGM3aW5iMDlCL0h0d0F1?=
 =?utf-8?B?ZXFQdkNjZ0pZNTcyaEN1d3ZTY2lJSlJFL0xuQWZXeERHaFByZmo3dmEva2Vt?=
 =?utf-8?B?QXBLTnpGQmYwR1BRNk1iNVh1bmkvdVg2eTZDT3llUjF1aVQxcXAwbnN3Z3FL?=
 =?utf-8?B?d0FRd0YyQzh6SFJoZzVxejEwbGo3S1IxVDZFUjlCaDRxM3hPc0JCcks3ZDlU?=
 =?utf-8?B?SFNUMnhTYm5QYkdOSmNiWHAwRTVCUVBnSk4rMFg4WlMxWWdZcHRWc05nMmZm?=
 =?utf-8?B?VnFNSEMzK0o0U0d1MGN2Y2JvQmo3bW9DOFZDVUNBaCtIaWhWV0xzRzNWSkNI?=
 =?utf-8?B?MVJVNVVVRi9Rd3hYL2R0b1hITFhwZGYvaEZObUhQOHdyMG1GZU9KbENkSnBv?=
 =?utf-8?B?aTExOERRRFlDNkZUNlBKNGl4UGdPZ3dMUk1HV1JLeVNBYjRON0Q0cU5xRUpy?=
 =?utf-8?B?Vm8xNEVrU3BUU0FBZUVkMjJEdGxWQWRyT01iWDVYSzBqMHorQzZnM3loUXVE?=
 =?utf-8?B?ZitJUDc3Wk1jV1poZEU3SnY5Ly9hTDhCQnYwS1d1LzJpMHFiYjBJbW9TUVZD?=
 =?utf-8?B?Ri9xNWEzdTNYMGFnbXJNOW8zZGFRUzl5RHNHT2xIQktTbWEreStOVWtCUjBQ?=
 =?utf-8?B?Y3RYVmh4Zk0zVUFvQlF3ZzltNTZQa2pGOENQb3VSRnRlQ05LV3ZyK2pMU0gr?=
 =?utf-8?B?MUh1QklheGpUL1R4S2dFeEtFS3FkTjJNMXM2b3NuUFNOUk1MRWZsckVUVkZP?=
 =?utf-8?B?bmV5OGtIUDJLdlI2NFdjcVZFOXJQbk5jdmdZUGd0aFJPMFR6alFaeSt1TTdC?=
 =?utf-8?B?YTBjbzVheW9XcjNXdUs2SXY2aTg2M2l6eHQ1Zm1QYWcza1RibU5jenMxdU9M?=
 =?utf-8?B?TFRGYm1QZ3YzMk9qYWdFbXJsa0thZDA5TkhUSE12TjNFRUU2YTZsbUFTQnVi?=
 =?utf-8?B?bjhBbFRrNEEvcThWRnJXNk9CRkIrQTZYM0JuMW12VGQyVnQzN1UrMHVCL3cw?=
 =?utf-8?B?SkszQXpoYWxPeTFBY2UzSkpveldSa3pKWnVRdUVvT1RLeFdVWVU3V1N0dndU?=
 =?utf-8?Q?ewB8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AC9AC1BAA1ED44EB6560AD055BFA898@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57643e17-c9ef-44ac-f316-08dd8d441ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 08:49:47.0361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6zYImc0Gnv4pdPkAR43gXOboBgKhlXhe7jt9eUpr9nI6EbZS3lcomg/2Dh91fQCAz85YRj52dRyPogR5quwaDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243

T24gMjAyNS81LzcgMTY6MDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdlZCwgTWF5
IDA3LCAyMDI1IGF0IDA3OjI2OjIxQU0gKzAwMDAsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9u
IDIwMjUvNS83IDAwOjIxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIE1vbiwgQXBy
IDIxLCAyMDI1IGF0IDAyOjE4OjU5UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+PiBX
aGVuIHZwY2kgZmFpbHMgdG8gaW5pdGlhbGl6ZSBhIGV4dGVuZGVkIGNhcGFiaWxpdHkgb2YgZGV2
aWNlIGZvciBkb20wLA0KPj4+PiBpdCBqdXN0IHJldHVybiBlcnJvciBpbnN0ZWFkIG9mIGNhdGNo
aW5nIGFuZCBwcm9jZXNzaW5nIGV4Y2VwdGlvbi4gVGhhdA0KPj4+PiBtYWtlcyB0aGUgZW50aXJl
IGRldmljZSB1bnVzYWJsZS4NCj4+Pj4NCj4+Pj4gU28sIGFkZCBuZXcgYSBmdW5jdGlvbiB0byBo
aWRlIGV4dGVuZGVkIGNhcGFiaWxpdHkgd2hlbiBpbml0aWFsaXphdGlvbg0KPj4+PiBmYWlscy4g
QW5kIHJlbW92ZSB0aGUgZmFpbGVkIGV4dGVuZGVkIGNhcGFiaWxpdHkgaGFuZGxlciBmcm9tIHZw
Y2kNCj4+Pj4gZXh0ZW5kZWQgY2FwYWJpbGl0eSBsaXN0Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IGNj
OiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+PiAtLS0NCj4+
Pj4gdjItPnYzIGNoYW5nZXM6DQo+Pj4+ICogU2VwYXJhdGVkIGZyb20gdGhlIGxhc3QgdmVyc2lv
biBwYXRjaCAidnBjaTogSGlkZSBjYXBhYmlsaXR5IHdoZW4gaXQgZmFpbHMgdG8gaW5pdGlhbGl6
ZSIuDQo+Pj4+ICogV2hvbGUgaW1wbGVtZW50YXRpb24gY2hhbmdlZCBiZWNhdXNlIGxhc3QgdmVy
c2lvbiBpcyB3cm9uZy4NCj4+Pj4gICBUaGlzIHZlcnNpb24gZ2V0cyB0YXJnZXQgaGFuZGxlciBh
bmQgcHJldmlvdXMgaGFuZGxlciBmcm9tIHZwY2ktPmhhbmRsZXJzLCB0aGVuIHJlbW92ZSB0aGUg
dGFyZ2V0Lg0KPj4+PiAqIE5vdGU6IGEgY2FzZSBpbiBmdW5jdGlvbiB2cGNpX2V4dF9jYXBhYmls
aXR5X21hc2soKSBuZWVkcyB0byBiZSBkaXNjdXNzZWQsDQo+Pj4+ICAgYmVjYXVzZSBpdCBtYXkg
Y2hhbmdlIHRoZSBvZmZzZXQgb2YgbmV4dCBjYXBhYmlsaXR5IHdoZW4gdGhlIG9mZnNldCBvZiB0
YXJnZXQNCj4+Pj4gICBjYXBhYmlsaXR5IGlzIDB4MTAwVSh0aGUgZmlyc3QgZXh0ZW5kZWQgY2Fw
YWJpbGl0eSksIG15IGltcGxlbWVudGF0aW9uIGlzIGp1c3QgdG8NCj4+Pj4gICBpZ25vcmUgYW5k
IGxldCBoYXJkd2FyZSB0byBoYW5kbGUgdGhlIHRhcmdldCBjYXBhYmlsaXR5Lg0KPj4+Pg0KPj4+
PiB2MS0+djIgY2hhbmdlczoNCj4+Pj4gKiBSZW1vdmVkIHRoZSAicHJpb3JpdGllcyIgb2YgaW5p
dGlhbGl6aW5nIGNhcGFiaWxpdGllcyBzaW5jZSBpdCBpc24ndCB1c2VkIGFueW1vcmUuDQo+Pj4+
ICogQWRkZWQgbmV3IGZ1bmN0aW9uIHZwY2lfY2FwYWJpbGl0eV9tYXNrKCkgYW5kIHZwY2lfZXh0
X2NhcGFiaWxpdHlfbWFzaygpIHRvDQo+Pj4+ICAgcmVtb3ZlIGZhaWxlZCBjYXBhYmlsaXR5IGZy
b20gbGlzdC4NCj4+Pj4gKiBDYWxsZWQgdnBjaV9tYWtlX21zaXhfaG9sZSgpIGluIHRoZSBlbmQg
b2YgaW5pdF9tc2l4KCkuDQo+Pj4+DQo+Pj4+IEJlc3QgcmVnYXJkcywNCj4+Pj4gSmlxaWFuIENo
ZW4uDQo+Pj4+IC0tLQ0KPj4+PiAgeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgICAgfCA3OSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+PiAgeGVuL2luY2x1ZGUveGVu
L3BjaV9yZWdzLmggfCAgMSArDQo+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMo
KykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVu
L2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4gaW5kZXggZjk3YzdjYzQ2MGEwLi44ZmY1MTY5YmRk
MTggMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+ICsrKyBi
L3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+IEBAIC0xODMsNiArMTgzLDgzIEBAIHN0YXRp
YyB2b2lkIHZwY2lfY2FwYWJpbGl0eV9tYXNrKHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4+PiAg
ICAgIHhmcmVlKG5leHRfcik7DQo+Pj4+ICB9DQo+Pj4+ICANCj4+Pj4gK3N0YXRpYyBzdHJ1Y3Qg
dnBjaV9yZWdpc3RlciAqdnBjaV9nZXRfcHJldmlvdXNfZXh0X2NhcF9yZWdpc3Rlcg0KPj4+PiAr
ICAgICAgICAgICAgICAgIChzdHJ1Y3QgdnBjaSAqdnBjaSwgY29uc3QgdW5zaWduZWQgaW50IG9m
ZnNldCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICB1aW50MzJfdCBoZWFkZXI7DQo+Pj4+ICsgICAgdW5z
aWduZWQgaW50IHBvcyA9IFBDSV9DRkdfU1BBQ0VfU0laRTsNCj4+Pj4gKyAgICBzdHJ1Y3QgdnBj
aV9yZWdpc3RlciAqcjsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICggb2Zmc2V0IDw9IFBDSV9DRkdf
U1BBQ0VfU0laRSApDQo+Pj4+ICsgICAgICAgIHJldHVybiBOVUxMOw0KPj4+PiArDQo+Pj4+ICsg
ICAgciA9IHZwY2lfZ2V0X3JlZ2lzdGVyKHZwY2ksIHBvcywgNCk7DQo+Pj4+ICsgICAgQVNTRVJU
KHIpOw0KPj4+PiArDQo+Pj4+ICsgICAgaGVhZGVyID0gKHVpbnQzMl90KSh1aW50cHRyX3Qpci0+
cHJpdmF0ZTsNCj4+Pj4gKyAgICBwb3MgPSBQQ0lfRVhUX0NBUF9ORVhUKGhlYWRlcik7DQo+Pj4+
ICsgICAgd2hpbGUgKCBwb3MgPiBQQ0lfQ0ZHX1NQQUNFX1NJWkUgJiYgcG9zICE9IG9mZnNldCAp
DQo+Pj4+ICsgICAgew0KPj4+PiArICAgICAgICByID0gdnBjaV9nZXRfcmVnaXN0ZXIodnBjaSwg
cG9zLCA0KTsNCj4+Pj4gKyAgICAgICAgQVNTRVJUKHIpOw0KPj4+PiArICAgICAgICBoZWFkZXIg
PSAodWludDMyX3QpKHVpbnRwdHJfdClyLT5wcml2YXRlOw0KPj4+PiArICAgICAgICBwb3MgPSBQ
Q0lfRVhUX0NBUF9ORVhUKGhlYWRlcik7DQo+Pj4+ICsgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAg
aWYgKCBwb3MgPD0gUENJX0NGR19TUEFDRV9TSVpFICkNCj4+Pj4gKyAgICAgICAgcmV0dXJuIE5V
TEw7DQo+Pj4+ICsNCj4+Pj4gKyAgICByZXR1cm4gcjsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiAr
c3RhdGljIHZvaWQgdnBjaV9leHRfY2FwYWJpbGl0eV9tYXNrKHN0cnVjdCBwY2lfZGV2ICpwZGV2
LA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2ln
bmVkIGludCBjYXApDQo+Pj4+ICt7DQo+Pj4+ICsgICAgY29uc3QgdW5zaWduZWQgaW50IG9mZnNl
dCA9IHBjaV9maW5kX2V4dF9jYXBhYmlsaXR5KHBkZXYtPnNiZGYsIGNhcCk7DQo+Pj4+ICsgICAg
c3RydWN0IHZwY2lfcmVnaXN0ZXIgKnJtLCAqcHJldl9yOw0KPj4+PiArICAgIHN0cnVjdCB2cGNp
ICp2cGNpID0gcGRldi0+dnBjaTsNCj4+Pj4gKyAgICB1aW50MzJfdCBoZWFkZXIsIHByZV9oZWFk
ZXI7DQo+Pj4NCj4+PiBNYXliZSBzYW5pdHkgY2hlY2sgdGhhdCBvZmZzZXQgaXMgY29ycmVjdD8N
Cj4+IFdoYXQgZG8geW91IG1lYW4gc2FuaXR5IGNoZWNrPw0KPj4gRG8gSSBuZWVkIHRvIGFkZCBz
b21ldGhpbmc/DQo+IA0KPiBJIHdvdWxkIHByb2JhYmx5IGRvIHNvbWV0aGluZyBsaWtlOg0KPiAN
Cj4gaWYgKCAhb2Zmc2V0ICkNCj4gew0KPiAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+ICAg
ICByZXR1cm47DQo+IH0NCkhvdyBhYm91dCBhZGRpbmcgY2hlY2s/DQoNCiAgICBpZiAoIG9mZnNl
dCA8IFBDSV9DRkdfU1BBQ0VfU0laRSApDQogICAgew0KICAgICAgICBBU1NFUlRfVU5SRUFDSEFC
TEUoKTsNCiAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQogICAgfQ0KDQpEbyBJIG5lZWQgdG8gYWRk
IHNpbWlsYXIgY2hlY2sgaW4gdnBjaV9jYXBhYmlsaXR5X21hc2soKT8NCg0KPiANCj4gVGhhbmtz
LCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

