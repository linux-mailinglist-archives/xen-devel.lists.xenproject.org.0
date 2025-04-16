Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1826BA8B01D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 08:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955083.1348921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4w4q-0005LA-SH; Wed, 16 Apr 2025 06:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955083.1348921; Wed, 16 Apr 2025 06:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4w4q-0005JF-PR; Wed, 16 Apr 2025 06:16:52 +0000
Received: by outflank-mailman (input) for mailman id 955083;
 Wed, 16 Apr 2025 06:16:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2j5z=XC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u4w4o-0005J7-Sa
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 06:16:50 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2418::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6013355e-1a8a-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 08:16:47 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS4PR12MB9682.namprd12.prod.outlook.com (2603:10b6:8:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 06:16:43 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 06:16:36 +0000
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
X-Inumbo-ID: 6013355e-1a8a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuMn2//DiBWxtfxOcu0HJlpH6o1uhlaD47sBYU5oy9bASKsBn97lsLeChtpRe4F669FfHnB1UkjcGzuWWYRALWBe5skTiSaf5U/upPfTNJVgjnSP1NRDj3D07iWe+3LVeiCoV0+eG2vTGi1KrOah2LxpPoZSpmAH7KuO+P6rzk39qcBsR+n5bEvP64dCAWZSh6o8R1/rCBMhEC8jNbcvzUwiTrd+ZEOtTFHgJ2d9albKCP8yMdLYmURh6gWfwnBMbyTyde4p2N670QaYo5kt9GEbe/Br2Gvaq91/suo2DYz7tHSvU+9MjTeG8oVdXKdbSVH8EgQt0I47oRqbXb+3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yioAAbvOWBjFc4AAEyG22TXqcpBGflJhFV578mqceqo=;
 b=RAUHKEZKeoziLd5KjFv4CacjyYNiNBcjGWuypPk2ruhi3jUzJwAG41yZfO2+jqPUXBXNSUwUopFb1gqzER3qDyeJumgDDGkHqZQyti84D/tIkYGguRYmGi8LquvQm2/YPGYhBIJHAollub+spG8aiGeZUP9bZQcZ3HvzYoa+rqjnIarpBsxpEq95joBqYfTlL91UFczHs2QV1iGXUWq3aJbEDKN6KbCqtjh5a8w1H/hBP282da7T3FwsAZt6iASen/DKQpQtgOfdpuoiyDaXvpHQ89cGOeWskc3uKA8gUeBrhO9LHWaaiGmP+zRCjbuZIEG4jjKKmBDf+6zfwnTscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yioAAbvOWBjFc4AAEyG22TXqcpBGflJhFV578mqceqo=;
 b=YU/rGb1+dKCjxwIEgiWSCdfIhgCU+Gi/XlK5jk49w784py3i+khFnaAM2Sp+nYv1ioouNfDIARflNinuVro+YoBXLxfsX3g7YuBmCnhM0yTqJhrJ2pAz2MimPOwlDMMTKWXgFkTDUC24SwzOu3h6AYS43yZ2muQZidainvGPRf0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 7/8] vpci/msi: Free MSI resources when init_msi() fails
Thread-Topic: [PATCH v2 7/8] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Index: AQHbqRsgbLaoMHelXkGKdCfvKc+G8rOkwo4AgAGd4IA=
Date: Wed, 16 Apr 2025 06:16:36 +0000
Message-ID:
 <BL1PR12MB584983A5AB0A9D74877F8BA0E7BD2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-8-Jiqian.Chen@amd.com> <Z_5fLB1GoyoxpuOL@macbook.lan>
In-Reply-To: <Z_5fLB1GoyoxpuOL@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8655.018)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS4PR12MB9682:EE_
x-ms-office365-filtering-correlation-id: b1ddb4a3-fa3c-454a-11d8-08dd7cae3e05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZnlGQXdTZ1UwdVpVdGx1MFVVRGdWNW9HeGRBRGlyK09kWHdCYnBSVlhEelM2?=
 =?utf-8?B?T29rdDFOQVNCYkJlNk14T3RVRGRTYlVIZHdwU2lNV0NUVXJxeE5pR0o0Q1dW?=
 =?utf-8?B?MmZLZlFGbVBnSjZ0SmtwZnlWdFJoZGVQZ2VvNFc4TWZraVR5aG16VmphMmFV?=
 =?utf-8?B?eExBRFhCNmxOL09CTmhUUmlrMFFDWWtXUndkZ1pPcElLVzBxMGE1bGNrQ2dR?=
 =?utf-8?B?N1E2bDFSOE5Fa2w2VDVaNXVmdFg2aU5WMUtpU25CRmh4Tytacm90UzlDWitW?=
 =?utf-8?B?Ni9wYU5aSXNxZ1BZZkR1Y09XNVcyd3BpUkRLZ2NCSUUycHN3Z1NxcW1LKzZU?=
 =?utf-8?B?TlArSXVQZ2tDTXdpZWVlY0VHNCs3ejlBMDR3RVNrRitlVjlFSkp0NXRRbUZ5?=
 =?utf-8?B?VDZtQ3FhRHlWRmFWUldPWG05UDZkV2NhbmFWZXpFcGVrLzE4bW9DTHN0S3Iz?=
 =?utf-8?B?L2VySzFPSDNQY0oxd1lmeHQ3Q2xMU0s2dHdla0JUWmQyRG44RkJoblY0Tnh2?=
 =?utf-8?B?M01ZbTNLVTZFOU1YQ0lmU1pIRm44dHh4UmZybnVaOWhPdDFFSEVuZG9XTnlv?=
 =?utf-8?B?MEtEWktTaytydVJHeE5BekphZEFuK0NMV2dGbU92S202T3VYT09GNGMvOGN6?=
 =?utf-8?B?RE83ajhjbnp4Y1htUDRZNmgza2YyMkdLTkd5aE92UTZmYkxaY1JQWEM0YmY1?=
 =?utf-8?B?YThqWThXV2wxTmxqT2NveDRBMnVHK1JmcVp6eUV2UW1qV3hPUjFVWFJpN2hQ?=
 =?utf-8?B?NndQSU42Tkd0T0YvekpibFpIaDYwVHJXdU82V0RMSHEyVGMvLzhNVnZ4RFRh?=
 =?utf-8?B?VFhDS2ZoM1pPcE80R1Zldnc1Vk9Xc1ZaUE1LaFZ0UXdkakZKQ3NLU1A4U0d1?=
 =?utf-8?B?NGN5Tnh6Z0k1YWN3U3ZmVUxxTXBPZ3Z1Q2o3SWllRUpHQm1SSjRyNzg0YkJ1?=
 =?utf-8?B?RnZpaVFWOEJBVS9CbG9hT3F4dVJWRExlQkFWaU52WHV0azhsMzJoVzRYZnpk?=
 =?utf-8?B?L0piWXFZOVhTSisySlArUHIvSmRiOXhqamVLelpCODl0YUhyMDhhaG1ORVhr?=
 =?utf-8?B?NDdVQSs2aTNURlk4MlBPSWRhb09wanJJSmY1SWtBUGhNZTc1V1VSMkhVUWNi?=
 =?utf-8?B?ME9HeThYZWVRRXNkZmM1VXlBV3dnUXVLOXg3d2NTSDlMVkhRMWFPVkR5c3U3?=
 =?utf-8?B?cTlqemxBblZsWDVWSGVJOWROQ2N0NU84YzlQRXV2ek9MRWJNVzlSNEtHaEZV?=
 =?utf-8?B?ZFJGMjRjZ2ZYTlJjZmVBVzRTNnFsSE5IVVRIWm9LQnBnd0dwa1hGcUUza01o?=
 =?utf-8?B?cW4xSHRleTBkWGVnaElVdVZKMUpPQUtFZkx2NVVPdlR4dDBaYzIxSzVJSS9K?=
 =?utf-8?B?WUZCNWlxWWF2M1FoMm4zOHVzOEpQQjFDai9lZGdub29CUzRUMTNVWG5jSlpG?=
 =?utf-8?B?WHpGODJERXVxd1B4dFA1aHJHcUc4Z2pYSVVxQjlIUDFxaVM2eXpRb2xMYkoz?=
 =?utf-8?B?OEtVa2FFSWtqT2tHcHJSWmdId3RDcDNQaXBJK1ZSZXF1WEhaakMrSSs4WkIr?=
 =?utf-8?B?cmsweVR6UlNZS2dUUWUvYlJXQlBSRlBKSlRhb0hLQU82eG1MTTVjbDVuTXlJ?=
 =?utf-8?B?ZmRCd3V1THc4L3VkZkYrTlI0NDB5U0dybS9HMHRXaElCZjZNczJSNlZMTWNS?=
 =?utf-8?B?VCt0N0k2TGtzWUtIU1JhTDc3b21BSmh3MmQ2Tm5GNTNiT1cvcXB2ckZ5cVFT?=
 =?utf-8?B?bnJwKzZVeE9DUDkwRmpvUlF2R3oyWmxUalZaeU1PSHlkVjZDeFZNcm5zdkE1?=
 =?utf-8?B?Zk14UUpndlJ4NDRmQTZVTFJKTS9tanprc1E4L0ZFa0N1N2piVXUxTk5EY1cy?=
 =?utf-8?B?NTdycEF5VEtOdkNpdUxsYWlydXRPdTZrN2w4MkVZcjltaWRKUlU3OUMydU9M?=
 =?utf-8?B?aGx5dW95Q3UwbnIwdndtRmN1cEtIalBWT2wvbWE2YmpwK0I4Nit0L0FyNEZY?=
 =?utf-8?Q?z//nKPwNXpMnGbJbJsUjNaL3F7QOTs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bEljdjFJajBwTFlETkFGYUhrdU1mOEFHY0k0N3hjNVdscnNZbnFsL1JFTzk5?=
 =?utf-8?B?VkQ3djZUcmYxT283dHlFNGNPTnhNbFBuWDdWUXdhOUVac2hxcXllYkRtTlVO?=
 =?utf-8?B?UVNHdzRjOWRwSWEydkk1YVl0ZStmR0xaOHJaNkVRc2Y0a01jelFlYlFGVlJy?=
 =?utf-8?B?OVVaNWwxL2hUa1hJSlFOY0ZHd0Y1dCthdzRZNG01OXRXa3hHdlJoSjRKNVcz?=
 =?utf-8?B?SDg5d293SEc0Tjl0LzFoaEhJYVlHbUh0T1NLUnhJRW1OMkQ4K1BjYU05SHBE?=
 =?utf-8?B?TGJrdmNtV1VvdHQvTlJHL1JzVEtvV0hEdk1Kbkw5cUp3cGJ3YWhYR2JJUHls?=
 =?utf-8?B?aWRnUFRhK3R6Vk0vYVd6NjJNNWZyeDRCUjhCbjZyTU4zVkVua1krY0NnL0VG?=
 =?utf-8?B?eEVHWEtySytPNG84OXJkRzM4aVNVUUlqK25yZlAzRmV6d0o1eld3ZS9neUp6?=
 =?utf-8?B?MERDOERZS21oTFFGcFh1R1VKQ2liMlRpYmttbS9XRDZyS3RuQlJJQTQ5NFgv?=
 =?utf-8?B?aXFRZ21tR1Z1a0cxYjRNYUhmcit0VDZjN2hJOThGSHYyQkVpbmtEM1NUcHBQ?=
 =?utf-8?B?WHd0Qkx1V0hybktHdmN2cTZteG5WcEFzcWsrM1hLMmpJYStpZDRzbWoxakln?=
 =?utf-8?B?MFFKUEFnK3J2eE9uRkRzMlVyM05ZdHNsMTJOQlg5eHB3SFkwUlp3dVVDV3U0?=
 =?utf-8?B?N1ZTSWxvUmVWK29FR3lOSnVUZGliTHBhR0RnVHplWHFTbHJTYlRZRjJZRW9E?=
 =?utf-8?B?VEc4T2tibnloUDE5WW9iVUU5M2huU0k1amxkbnRmZmlQTWZscEw4YjlqdG9S?=
 =?utf-8?B?NG50OW9XcUlxME5oa1UxVGhGbEVhWnlSTStRKzNHTzFZMFVhWk1QOUhjazdu?=
 =?utf-8?B?dzZTa3JFNkNwbjRHaWZmN1hBWXY0dm9rYXBBSFduZ2NMa1hDZ1JZY1ZRS3dw?=
 =?utf-8?B?dEhRTzRhVWNSbVpxaXJyMElaajFQL3lxUWoydVl1R09mbDNUOTZvZVpDZVdl?=
 =?utf-8?B?M1pIbThWcFBQOU9PSnZTN3R6SDR6ZU5PSDMvb0ZTcmlDSWUzOG8ySFBoYjB5?=
 =?utf-8?B?OXk0TFRaWEtYaFRuUXNGcFROYnNUQ29Rak9wZ2tsNGxXNUwzdEZQTDdxajVv?=
 =?utf-8?B?QUx6ODF4UVlJWEdVME1XemxjeFZ5Z3RnMUVSQW43WUhuaksxUWZhZytwdkVP?=
 =?utf-8?B?SXE1c1ZVY0RoQXZMLzlPTit4cFJUVUtTWHNNdWlaVFl5ZmpmQVlUSHcwTkFr?=
 =?utf-8?B?bm85YytGd3IxT3lkMlltM1drdWVXTXFvcUxqNElpaU5BUG9XYVVKRzVtdzV1?=
 =?utf-8?B?dTBveHM4Nk9zUXFXYzIveVhlZm5SM1FKU0lUQlRZZzQ1cDFrRDZmSVBnemRX?=
 =?utf-8?B?RWcwQXNpeW5yMXlGWEtTSlBTMFVETnBPWUFKTXJ1R2F6cFBldWQwTUhOc2lR?=
 =?utf-8?B?S1c2Kyt3WlJIbUM2RHRLaXJaLy9uV3BrQ0FXR1I2RFhURmRSbzMxRi9TaEZG?=
 =?utf-8?B?OTN2eXQwYkpuR0hxNHJiZ0U0bmNsbk1zdjlPN1I3RHZhT2ZHNGQ1UGFHRlEr?=
 =?utf-8?B?SlBwWnY2WFgxQ2pMK2tqYndla1NoTlprQ2xCeUZ4Qkt0U0J2V1ZrUE5jdDZy?=
 =?utf-8?B?dnZhWjZjb01LWDUwUy96YjFEcGdEMTN0S3JBekVaeVk0aUIxL3JUeHF6eDhn?=
 =?utf-8?B?UU13c1ZRVGNvclRJNmUyNG1iQ2grMWQvMWtubHFVZ1FGMjN6UTFHbGMzeUp0?=
 =?utf-8?B?Q2VJUjZwL21QdnlWQ3ZFSThKdUtWUFRtZHJBL05QMTJlTXRNWnV6UW9xOERY?=
 =?utf-8?B?OExoRDR2Z2lpZThwYlNtNlczTEl3eEUrbnRuam1JdHpJWU9PSDVhSHNYcC9p?=
 =?utf-8?B?L1B1R3VOWEpyTHhZamhKTXlMZlU1N0o2dHFuM0trYzZURXo4WlRJSUZkSjlx?=
 =?utf-8?B?K25CMG1TSzNlbzlEdTU2SUhKSTB5d3Niemd4SlF2NExkT21yaW9BRmdEVkZY?=
 =?utf-8?B?VDROR01aODBMK0Z3a3NvUmM2NVlvZm9vQWtCL1kwR0dSWXgyTzMyblVranZT?=
 =?utf-8?B?TWV3aVozeWo3d25xdng1VlB6SURORkNTMFQ1RFdqMWFtZE5HbEp5b1NUR3hz?=
 =?utf-8?Q?uV0U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A961BD402D9E341B1F771F29EA83F42@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ddb4a3-fa3c-454a-11d8-08dd7cae3e05
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 06:16:36.3105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLWDZ08m2gCp9HjqchHd3K+Q0tTz0LY2MZI6rYZ4tdk9AXA2kUstp/RwDzB/L9wEa7vuVcJ4fOVFiFp72DIxDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9682

T24gMjAyNS80LzE1IDIxOjI5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQsIEFw
ciAwOSwgMjAyNSBhdCAwMjo0NToyN1BNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdo
ZW4gaW5pdF9tc2koKSBmYWlscywgdGhlIHByZXZpb3VzIG5ldyBjaGFuZ2VzIHdpbGwgaGlkZSBN
U0kNCj4+IGNhcGFiaWxpdHksIGl0IGNhbid0IHJlbHkgb24gdnBjaV9kZWFzc2lnbl9kZXZpY2Uo
KSB0byByZW1vdmUNCj4+IGFsbCBNU0kgcmVsYXRlZCByZXNvdXJjZXMgYW55bW9yZSwgdGhvc2Ug
cmVzb3VyY2VzIG11c3QgYmUNCj4+IGNsZWFuZWQgdXAgaW4gZmFpbHVyZSBwYXRoIG9mIGluaXRf
bXNpLg0KPj4NCj4+IFRvIGRvIHRoYXQsIGFkZCBhIG5ldyBmdW5jdGlvbiB0byBmcmVlIE1TSSBy
ZXNvdXJjZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVu
QGFtZC5jb20+DQo+PiAtLS0NCj4+IGNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KPj4gLS0tDQo+PiB2MS0+djIgY2hhbmdlczoNCj4+ICogQWRkZWQgYSBuZXcg
ZnVuY3Rpb24gZmluaV9tc2kgdG8gZnJlZSBhbGwgTVNJIHJlc291cmNlcyBpbnN0ZWFkIG9mIHVz
aW5nIGFuIGFycmF5IHRvIHJlY29yZCByZWdpc3RlcmVkIHJlZ2lzdGVycy4NCj4+IC0tLQ0KPj4g
IHhlbi9kcml2ZXJzL3ZwY2kvbXNpLmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvbXNpLmMg
Yi94ZW4vZHJpdmVycy92cGNpL21zaS5jDQo+PiBpbmRleCBjYTg5YWU5YjljMjIuLjQ4YTQ2NmRi
YTBlZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvbXNpLmMNCj4+ICsrKyBiL3hl
bi9kcml2ZXJzL3ZwY2kvbXNpLmMNCj4+IEBAIC0xOTMsNiArMTkzLDMzIEBAIHN0YXRpYyB2b2lk
IGNmX2NoZWNrIG1hc2tfd3JpdGUoDQo+PiAgICAgIG1zaS0+bWFzayA9IHZhbDsNCj4+ICB9DQo+
PiAgDQo+PiArLyogMTIgaXMgc2l6ZSBvZiBNU0kgc3RydWN0dXJlIGZvciAzMi1iaXQgTWVzc2Fn
ZSBBZGRyZXNzIHdpdGhvdXQgUFZNICovDQo+PiArI2RlZmluZSBNU0lfU1RSVUNUVVJFX1NJWkVf
MzIgMTINCj4gDQo+IEknbSBjb25mdXNlZCBieSB0aGlzLiAgVGhlIG1pbmltdW0gc2l6ZSBvZiB0
aGUgY2FwYWJpbGl0eSBpcyA0IGJ5dGVzDQo+IGZvciB0aGUgY2FwYWJpbGl0eSBwb2ludGVyLCBw
bHVzIDQgYnl0ZXMgZm9yIHRoZSBtZXNzYWdlIGFkZHJlc3MsDQo+IHBsdXMgMiBieXRlcyBmb3Ig
dGhlIG1lc3NhZ2UgZGF0YS4gIFNvIHRoYXQncyAxMCBieXRlcyBpbiB0b3RhbC4NClRoZSByZW1h
aW4gMiBieXRlcyBpcyBFeHRlbmRlZCBNZXNzYWdlIERhdGEsIFBDSWUgc3BlYyBoYXMgdGhpcyBy
ZWdpc3RlcidzIGRlZmluaXRpb24gZXZlbiB0aG91Z2ggaXQgaXMgb3B0aW9uYWwuDQoNCj4gDQo+
IEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCBpZiB5b3UgY2FsY3VsYXRlIHRoZSBzaXplIGJhc2Vk
IG9uIHRoZQ0KPiBleGlzdGluZyBtc2lfIG1hY3Jvcy4NCj4gDQo+IGlmICggbWFza2luZyApDQo+
ICAgICBlbmQgPSBtc2lfcGVuZGluZ19iaXRzX3JlZyhtc2lfcG9zLCBhZGRyZXNzNjQpOw0KPiBl
bHNlDQo+ICAgICBlbmQgPSBtc2lfbWFza19iaXRzX3JlZyhtc2lfcG9zLCBhZGRyZXNzNjQpIC0g
MjsNCj4gDQo+IHNpemUgPSBlbmQgLSBtc2lfY29udHJvbF9yZWcobXNpX3Bvcyk7DQpUaGFua3Ms
IEkgd2lsbCBjaGFuZ2UgdG8gdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+PiArDQo+PiAr
c3RhdGljIHZvaWQgZmluaV9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAg
ICB1bnNpZ25lZCBpbnQgc2l6ZSA9IE1TSV9TVFJVQ1RVUkVfU0laRV8zMjsNCj4+ICsNCj4+ICsg
ICAgaWYgKCAhcGRldi0+dnBjaS0+bXNpICkNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsNCj4+
ICsgICAgaWYgKCBwZGV2LT52cGNpLT5tc2ktPmFkZHJlc3M2NCApDQo+PiArICAgICAgICBzaXpl
ICs9IDQ7DQo+PiArICAgIGlmICggcGRldi0+dnBjaS0+bXNpLT5tYXNraW5nICkNCj4+ICsgICAg
ICAgIHNpemUgKz0gNDsNCj4+ICsNCj4+ICsgICAgLyoNCj4+ICsgICAgICogUmVtb3ZlIGFsbCBw
b3NzaWJsZSByZWdpc3RlcmVkIHJlZ2lzdGVycyBleGNlcHQgY2FwYWJpbGl0eSBJRA0KPj4gKyAg
ICAgKiByZWdpc3RlciBhbmQgbmV4dCBjYXBhYmlsaXR5IHBvaW50ZXIgcmVnaXN0ZXIsIHdoaWNo
IHdpbGwgYmUNCj4+ICsgICAgICogcmVtb3ZlZCBpbiBtYXNrIGZ1bmN0aW9uLg0KPj4gKyAgICAg
Km1zaV9tYXNrX2JpdHNfcmVnLw0KPj4gKyAgICB2cGNpX3JlbW92ZV9yZWdpc3RlcnMocGRldi0+
dnBjaSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIG1zaV9jb250cm9sX3JlZyhwZGV2
LT5tc2lfcG9zKSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemUgLSBQQ0lfTVNJ
X0ZMQUdTKTsNCj4+ICsgICAgeGZyZWUocGRldi0+dnBjaS0+bXNpKTsNCj4+ICsgICAgcGRldi0+
dnBjaS0+bXNpID0gTlVMTDsNCj4+ICt9DQo+PiArDQo+PiAgc3RhdGljIGludCBjZl9jaGVjayBp
bml0X21zaShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICB7DQo+PiAgICAgIHVuc2lnbmVkIGlu
dCBwb3MgPSBwZGV2LT5tc2lfcG9zOw0KPj4gQEAgLTIwOSwxMiArMjM2LDcgQEAgc3RhdGljIGlu
dCBjZl9jaGVjayBpbml0X21zaShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgcmV0ID0g
dnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwgY29udHJvbF9yZWFkLCBjb250cm9sX3dyaXRl
LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtc2lfY29udHJvbF9yZWcocG9zKSwg
MiwgcGRldi0+dnBjaS0+bXNpKTsNCj4+ICAgICAgaWYgKCByZXQgKQ0KPj4gLSAgICAgICAgLyoN
Cj4+IC0gICAgICAgICAqIE5COiB0aGVyZSdzIG5vIG5lZWQgdG8gZnJlZSB0aGUgbXNpIHN0cnVj
dCBvciByZW1vdmUgdGhlIHJlZ2lzdGVyDQo+PiAtICAgICAgICAgKiBoYW5kbGVycyBmb3JtIHRo
ZSBjb25maWcgc3BhY2UsIHRoZSBjYWxsZXIgd2lsbCB0YWtlIGNhcmUgb2YgdGhlDQo+PiAtICAg
ICAgICAgKiBjbGVhbnVwLg0KPj4gLSAgICAgICAgICovDQo+PiAtICAgICAgICByZXR1cm4gcmV0
Ow0KPj4gKyAgICAgICAgZ290byBmYWlsOw0KPj4gIA0KPj4gICAgICAvKiBHZXQgdGhlIG1heGlt
dW0gbnVtYmVyIG9mIHZlY3RvcnMgdGhlIGRldmljZSBzdXBwb3J0cy4gKi8NCj4+ICAgICAgY29u
dHJvbCA9IHBjaV9jb25mX3JlYWQxNihwZGV2LT5zYmRmLCBtc2lfY29udHJvbF9yZWcocG9zKSk7
DQo+PiBAQCAtMjM3LDIwICsyNTksMjAgQEAgc3RhdGljIGludCBjZl9jaGVjayBpbml0X21zaShz
dHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgcmV0ID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRl
di0+dnBjaSwgYWRkcmVzc19yZWFkLCBhZGRyZXNzX3dyaXRlLA0KPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtc2lfbG93ZXJfYWRkcmVzc19yZWcocG9zKSwgNCwgcGRldi0+dnBjaS0+
bXNpKTsNCj4+ICAgICAgaWYgKCByZXQgKQ0KPj4gLSAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsg
ICAgICAgIGdvdG8gZmFpbDsNCj4+ICANCj4+ICAgICAgcmV0ID0gdnBjaV9hZGRfcmVnaXN0ZXIo
cGRldi0+dnBjaSwgZGF0YV9yZWFkLCBkYXRhX3dyaXRlLA0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtc2lfZGF0YV9yZWcocG9zLCBwZGV2LT52cGNpLT5tc2ktPmFkZHJlc3M2NCks
IDIsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBkZXYtPnZwY2ktPm1zaSk7DQo+
PiAgICAgIGlmICggcmV0ICkNCj4+IC0gICAgICAgIHJldHVybiByZXQ7DQo+PiArICAgICAgICBn
b3RvIGZhaWw7DQo+PiAgDQo+PiAgICAgIGlmICggcGRldi0+dnBjaS0+bXNpLT5hZGRyZXNzNjQg
KQ0KPj4gICAgICB7DQo+PiAgICAgICAgICByZXQgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52
cGNpLCBhZGRyZXNzX2hpX3JlYWQsIGFkZHJlc3NfaGlfd3JpdGUsDQo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtc2lfdXBwZXJfYWRkcmVzc19yZWcocG9zKSwgNCwgcGRldi0+
dnBjaS0+bXNpKTsNCj4+ICAgICAgICAgIGlmICggcmV0ICkNCj4+IC0gICAgICAgICAgICByZXR1
cm4gcmV0Ow0KPj4gKyAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4+ICAgICAgfQ0KPj4gIA0KPj4g
ICAgICBpZiAoIHBkZXYtPnZwY2ktPm1zaS0+bWFza2luZyApDQo+PiBAQCAtMjYwLDcgKzI4Miw3
IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZGV2
LT52cGNpLT5tc2ktPmFkZHJlc3M2NCksDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA0LCBwZGV2LT52cGNpLT5tc2kpOw0KPj4gICAgICAgICAgaWYgKCByZXQgKQ0KPj4gLSAg
ICAgICAgICAgIHJldHVybiByZXQ7DQo+PiArICAgICAgICAgICAgZ290byBmYWlsOw0KPj4gICAg
ICAgICAgLyoNCj4+ICAgICAgICAgICAqIEZJWE1FOiBkbyBub3QgYWRkIGFueSBoYW5kbGVyIGZv
ciB0aGUgcGVuZGluZyBiaXRzIGZvciB0aGUgaGFyZHdhcmUNCj4+ICAgICAgICAgICAqIGRvbWFp
biwgd2hpY2ggbWVhbnMgZGlyZWN0IGFjY2Vzcy4gVGhpcyB3aWxsIGJlIHJldmlzaXRlZCB3aGVu
DQo+PiBAQCAtMjY5LDYgKzI5MSwxMSBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGluaXRfbXNpKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICB9DQo+PiAgDQo+PiAgICAgIHJldHVybiAwOw0K
Pj4gKw0KPj4gKyBmYWlsOg0KPj4gKyAgICBmaW5pX21zaShwZGV2KTsNCj4+ICsNCj4+ICsgICAg
cmV0dXJuIHJldDsNCj4+ICB9DQo+PiAgUkVHSVNURVJfVlBDSV9MRUdBQ1lfQ0FQKFBDSV9DQVBf
SURfTVNJLCBpbml0X21zaSk7DQo+IA0KPiBJIHdvbmRlciBpZiB0aGUgZmluaV9tc2kgc2hvdWxk
IGJlIHJlZmVyZW5jZWQgaW4NCj4gUkVHSVNURVJfVlBDSV97RVhURU5ERUQsTEVHQUNZfV9DQVAo
KSwgc28gdGhhdCB0aGUgY2FsbGVyIG9mDQo+IGluaXRfbXNpKCkgY2FuIGNhbGwgZmluaV9tc2ko
KSBvbiBmYWlsdXJlIGFuZCB0aHVzIGF2b2lkIGFsbCB0aG9zZQ0KPiBmYWlsIGhvb2tzIGFuZCBs
YWJlbHMsIGFzIHRoZSBjYWxsZXIgY2FuIHRha2UgY2FyZSBvZiB0aGUgY2xlYW51cC4NCkdvdCBp
dC4gSSB3aWxsIGFkZCBhIGhvb2sgZm9yIGZpbmlfeCBmdW5jdGlvbi4NCg0KPiANCj4gVGhhbmtz
LCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

