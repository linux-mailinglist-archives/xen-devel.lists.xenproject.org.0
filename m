Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACH1NPazb2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C2448156
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208906.1521039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBfV-0005NJ-Bm; Tue, 20 Jan 2026 13:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208906.1521039; Tue, 20 Jan 2026 13:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBfV-0005KE-8d; Tue, 20 Jan 2026 13:21:13 +0000
Received: by outflank-mailman (input) for mailman id 1208906;
 Tue, 20 Jan 2026 13:21:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h83G=7Z=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viBfU-0005K5-Fs
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:21:12 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2d716f3-f602-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 14:21:11 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5149.namprd03.prod.outlook.com (2603:10b6:208:1a4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 13:21:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 13:21:08 +0000
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
X-Inumbo-ID: e2d716f3-f602-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrOIIGCLu2oBRhuelGVdcj8ZMHoQQEgPHTnPsENNQNZcdlduCAz1PWxcq+lghlNWd4fhwXZC+BJeNBNg4ewYE97TuPAY2VMHHPg4B/bHyc+V3YX+2FfxXz0XiMmhI5j1ZCJY0kOAjmW6Vu79CrYRfWyU+8Kk9p2yd1Aki2WOGlcCBD6P25yZe939kV0CSB91T48fTbZTm1Tet7Iv+mXrMDQBcULJ4PvC87RFyoWkG5tCotaUqQpBbyJnuNGjE83Ttp972ZSI8nNu9uD0HiK07U2CyiwI+DB5bqnh1IOZGhL3O48wOvPByLwQbAtWe6UcGABMR8VS8XwFMfnqNYuxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOpw9wumMgg40LcpJzhhw6lrd8Hnq4Geo65K0tCzFkc=;
 b=Va61nO/WmTexJVzw5KNGNVNOedE3ed5Kfm/qU4I5b1Vu9xyaIl5ia8/awu7zvnEa45RLSTPJUBROcljcuHA5vSOi/ZJc8RjDBTh3osxIR+fXZvbjJCC1w7ZpmTzXbCOuFP6WX5yZBRSkvwaUyTgTupl1+JjBEAknqxAzK55eHXqfaWlHXxJ4HSgdCCNZeMGqp6zKIARj6vSwsFCbviCx7kIH1PgoFPbMFs+49G9AJ2wicQxjpyWg5uoMVG/ohqpgtRXD0wkt9rgapL+HRBpoDK2zdslyV9zZjnbKjNBtaDRBu1jWpWqDa/G5s+ys+CZU/dBfa0SYcO+mAOIDUEeNbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOpw9wumMgg40LcpJzhhw6lrd8Hnq4Geo65K0tCzFkc=;
 b=cz+e6ZWuw9By6KawBbOJtxAGc60OUk84XGTUwdC98TW5JGsQDTNhuzN5vbAGcXxfajeIZQBbc1AbvL+wF/Z/+uy8m2M7lbpZrZtHt0bEHJSf8LIwB004SeyanC26H9rXUy57cd7K9NMbcbUKatPtNRZn9liydk+c5VZS4QhDEZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3c87050e-d153-447c-9eaa-b49a7ab1c75d@citrix.com>
Date: Tue, 20 Jan 2026 13:21:04 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/2] x86/svm: Add support for Bus Lock Threshold
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <DFTDLSLZPN6F.3UC4R81DBXYR8@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DFTDLSLZPN6F.3UC4R81DBXYR8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0187.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::31) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: ad91f36a-dcbf-4c21-b076-08de5826c5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHo4OGpIakZ6d21rTm5mVVhtTGxrd1RXMTZDTC9BYW56QUs5S1VGUzNBczBR?=
 =?utf-8?B?Z3prUzRDRHA3eGRRa2p0N0FrNTU4Z28rcDNDczdxb2R6NWhESVpidlcrbEVy?=
 =?utf-8?B?YWRsa2s2TFU4VHRWdnVkUTRxcmRYMlhDRStVWFRyaXU3ZlVmNE8xbWV3S1dN?=
 =?utf-8?B?L3Z6MVg2allFaVVoOXlLTE00OTdGdUgwQjRBTEZmM2hnVVhmbkRZMGRocUNk?=
 =?utf-8?B?K2llTVdZSmpBQXZrRGlZM2hWSTRXZWM3WjNsbS9vVElCbHVBOUFFVTUwZkww?=
 =?utf-8?B?YVVlWnNsVkVQYTVqejllemwwaklWQzl6bUhhSG51d2VEdXRzeHdYNTBpYTNR?=
 =?utf-8?B?aUdwUnplQ2dmYlpRZUhxMHE1T3E5ckN4QVdmNXJNL2dsRUVoTm1uZ1NLQTlz?=
 =?utf-8?B?SzZrTXNRM09VZXM0UFNicnNoZ1JPQ3d1eWRlWm9Mc0hWaitHVmpiUkZMOUxq?=
 =?utf-8?B?U0JSTHE5YitjdUJheEM0WEpoUVRNTGRqZTJpeEwrUjZ4TGdMR2piUGVKOXp2?=
 =?utf-8?B?TzFsZTIzVmQ4TXpkLytGSzRTOHc4Qms3UWlqZ3ZXQzdKK0dRSytKWktkRTgx?=
 =?utf-8?B?WHFpcldtYmhDUXNlSTJPMXVFbDdCeHZWZEtrblZUQit1ZEFOTitvcXphNUlL?=
 =?utf-8?B?R3RPTGRVSGJodWM1SGtMcHJYcnRmTVlyUER6NDRGeVMrcnhqV0NxTjZGN09F?=
 =?utf-8?B?Q1Q2cFNTZXlkYWxtSHVTWjRoeUMza3pqRkRXWnNuK1lEdlorR2RITENpSmc0?=
 =?utf-8?B?cVJEdGZFN0JXak1SSmJMQWtGalBaanRiMVVHUEhRV09iNmpHTXExc3hveG5i?=
 =?utf-8?B?enBqMWFwemNoT25Ib3ZhYkdWUjYwMC9sWCttV3V5LzRQQkRsMXV1cW56eXpx?=
 =?utf-8?B?bmhMWkZQQTg3SDk3YklrTy9sWk5ZR0tUUG1SZEJQZUsydHg0WkFMZHl2eW1t?=
 =?utf-8?B?SHQwcTFtT3NNcitvV0FYL0doSzYwbS9YekRwaW5ZOVRoUWd3dHhXQWRrZ2hC?=
 =?utf-8?B?VmxnWFNWSW9pZ08vaFpqVURlZm9NQjdja28xTXdQcW5LZ0R0NU1UcFlvcUJp?=
 =?utf-8?B?N2c5Z0N3VWVVNDd3QjNLYTVINjl1NEhYUjIxMDRwWmt4TlZGendxdXp0UjB4?=
 =?utf-8?B?dDRsM000SDhxVVhucDljSDVCZ01temhkQlFBTnJBdWlSRTNwL0lLekp2dXk0?=
 =?utf-8?B?Nm5IOU0xVm1VcHdMRUV4YnJHM2tudVNDckpXZkVHVDJSTFphRkM0dEV2OXNB?=
 =?utf-8?B?Q3pmWFlRU2swUzA4RUtYSmlvaDBqSXU3T2tOeTJKZEh6UEMwZytmUk0vMWZF?=
 =?utf-8?B?RkhhakNnK01STmZkTUNleHphSU1kNXJTTDhuVy9aV2ZVQXk2azNsa01HMEpD?=
 =?utf-8?B?LytmYU5RcE9URmxQTEFUTDNOSElEeDJ4emtHcmt6dEFCOFpYYVFtRE5IRkQx?=
 =?utf-8?B?VkpkTVk1QlVKaVgwYkhZQTh6dTR3c2Zyayt2WUNQTnFBcEI3SEtwVEhQVkND?=
 =?utf-8?B?RTZYWU9rT2cyVG5rOWVxRWU4KzA2UmJDZDBDMW1hNFh3dThmVlZFK1VVUnRk?=
 =?utf-8?B?TW4yUTBteUNHd0piWnRWekVzbW5rRTNkQW9aZ0lzRUdoSDd2aDN1cVhBblEw?=
 =?utf-8?B?eS9FMWIrelEzQjVZdFQ5TVpFU2FEUGJtbS9zcnNhK2d0ZmIxclhsUE1HeUto?=
 =?utf-8?B?NkdxeCtNaW5IcmlzY0F2b095MDFTSTNPeG9pNHlhMmtnbUhVY3pDMkprRXhE?=
 =?utf-8?B?R3llMUEvK2RjRFZRZDZwSmptK3NtL1d0TEV3cDZpRmFIWUJSTnJmeURkL0VJ?=
 =?utf-8?B?ODlYckRIRVgzOHVnZEplemdIZGt0clN1V2ljNFo1dVdNTE9vVDhCTGhlczFH?=
 =?utf-8?B?Njlrd3pDbTZZY0RZTmRjb1VmNkk0anhHQ1lyeTdaQ3MrR2VoQnZNMEs0cDdW?=
 =?utf-8?B?ZmJSNmorWEM4MS9mUWtYTER6bVVQSjlkRHBBT0Q2eHpiZG9NbVo2ZXVNUVdH?=
 =?utf-8?B?SjN5c3FVYiszMWJ0U0h1dnBpKzdQRUU3ZmlJU0tIbnZEUC9nWlkzMWZrOXJt?=
 =?utf-8?B?eHdBYm9VUEx4SlZwam5EWVZ1UUplM2FEVVRacFFTV2I5RzVzbGZjY2E2NEVM?=
 =?utf-8?Q?xaTU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkllQzFQVEhYSUdIZzNCUkY2RDhkemo1S0dkcGRuR0ZYcmJWM2w4V2tUMm4r?=
 =?utf-8?B?dTZUeDlJekNCVnJScGowVis0d01mUjhNd1o3RG12blVJN0VNSTRjUTJFeTNa?=
 =?utf-8?B?eW9ZdEZVdlZjUXhCSlE0TDJjRG1NNnNPeG1DMGNVOGIrTHE4L1ltbHRlQnZa?=
 =?utf-8?B?SlNXaSt5WHpzOU1wazZLUHYvd2MycVlVVUd1aFVPOUNBaThkVlpaY3NFc244?=
 =?utf-8?B?dGhGTDMxYWZvSU1iZkFJSlJucVo3dEVneks5dkpUSXUralF2RFozNFpXVGo5?=
 =?utf-8?B?TkUzZW5ndDZicm93ODZFeGN1VDhFU0xvVitRbldqdXRjK281VG5HeXptQVdJ?=
 =?utf-8?B?VnJGMzdJYzBJNnpQbXBwVVJsbWM1cVd4YVFJSDFiY2NUZXlZdG5kb3AzeFFo?=
 =?utf-8?B?dnJDQWFYdkNyVVBpQVdEcTBzenV1dTI4eHhHdERESFg1eEVlbHo3SU9JWTc0?=
 =?utf-8?B?NHNhaXJneHc4dEZZSlc5QW1FZ1JkNmVjZ2wyTTBRY3puSmJIZGJmYnlUaWVw?=
 =?utf-8?B?ejI2cnczYzBDU1RyL2J2eWhZdUZMdmZ4dXM0UzNzRWJ6dWhpdkxWYTZFdmll?=
 =?utf-8?B?RUt4SUpaci9XL25GTjUvdUNFVFM0VE1Kalh2OTR5YkxXcVZYSTdIY21MaHIy?=
 =?utf-8?B?M1VVUUw3VjNoa1J6eE9uc0QvQnZjLzh2ODkzVUhncWtsRitRTytkSjV5cDQ5?=
 =?utf-8?B?cnZ1TzlXYTFJQko0Nmtmc0U2a2cxNDVoU0MvN0pTY2t3WXA0NkR5VGZGWDBs?=
 =?utf-8?B?WkFTZ3FMdFlWNHZTUW9VcXgxamQrQkJzYWV2VURtWld3QXN2QktUYyt1c3A3?=
 =?utf-8?B?T3RLUGRURFEzM3gySm12RGs3d21iUmQ5NkVQRi9QRm1nNU1UNjNrdEdOZXI4?=
 =?utf-8?B?WkZBc1VoY0VIU2drVmtJeFBPVkY5eXZML0xDVjY2SHk3WWNmWVF1N0FPOTM0?=
 =?utf-8?B?LzYwR3ZIcGh2ZjJuQ1E1Rks0NTE2SmVObXpMWU8yamhsUUljdm5OMkhrVGZ3?=
 =?utf-8?B?L0kwR2Z6ZENqL1d0TjNtWDh4U1JTSVZBeTQrejZDRXlPYmVacmNIVnF5WVgv?=
 =?utf-8?B?RUo2WGdRRzRwZThKRVRNTEFrZGRraUFtS2JUeEYwWUI2T0J0WkNGRmxvWEN0?=
 =?utf-8?B?S3Y2ZDVldU96ZUZRRFc0dlpzUDdnR3pQNjlLd3JHcE14WGc4WUlRMU55c1Bk?=
 =?utf-8?B?MzZqNDhUREc5WVlQOEZWOURMalhJc3FidnJPbmlqb3BpeVY5aWNCQVpDMG1Y?=
 =?utf-8?B?MEVSeHQ4c25JUVc3djhkNkJ1Mm9lbERuUERPbG1jVnR6bzRWL2NSVDdST0pX?=
 =?utf-8?B?aGV3cTVmQm9ERFdzZnMrR0w2WlZUQlU5UXNWSmxLbWVuU2pIdkdOdDRmcWFY?=
 =?utf-8?B?Njc3QVplODNuY2p4ZVYzQkRYSFpqNWRnU2ZNVFhiZWlEcEI1WjZhSERtZ3I0?=
 =?utf-8?B?Q3VRTkRaL1Q5NzFaU2QybnVsK2NGY2MrYkU2YTZLWEtwMzlPMy93UWJzd29x?=
 =?utf-8?B?Q3dsRWZ0MWxKU3Uzdy8weDRBcC9yQy8vWkpUdGpGR0pLM3g0alFLckdzTVVG?=
 =?utf-8?B?V2JwMFc2cHhMUnNzOCs4SUo5dFpQYStPVnR5TlZaT1lwL1BWd3NySHAyeXZm?=
 =?utf-8?B?MFZ3SUdEWkhXeUtva1hlMml6azY2djhaQ0ZmMUpIQTEwQk1HM28zK0g5aGR5?=
 =?utf-8?B?RVMzK1lSOFYzN1FmZVR2U2ttaFIyYWZsVkY4Qnhnc0xvUVlocWo1OXo0d0ov?=
 =?utf-8?B?V2VVbW1kYkpWWGNjRWs5UGo5OEI4VWZTWUVYaWQ3eXZkc0xSRElac3hqdjNp?=
 =?utf-8?B?c3VnWkRNSTRCeEZ3WGhydEEzTXpiM1dFVThFcFd6dFA4eUdEV0tsTnMrd3dr?=
 =?utf-8?B?Q2V2OFFaK3NBUW5kSmlyMlV5b0xPb0tIU1VZTTM1c2h5NmVGNmlNNmRVMEtQ?=
 =?utf-8?B?Q2NqVytEOGEvMnpsRC80aWVnbDVUR1dXZ1AyNDhENEVnMmtFcml1OUlKOFRz?=
 =?utf-8?B?RnJRTElWV2VTMml3YXlNZTlmWWFrM0UwWmxPT1VwY0tobVVjMkJkcEw4ODdp?=
 =?utf-8?B?WllWbEVpdHkxQ3lhZnVhU21ORFU0WjN3anFsRUN1TkQ0WmJQSGo1dFdOVDgr?=
 =?utf-8?B?eFVhVklkN3J0YStaUEMvL0JjY1dISW9yT0Q4UmgycEV5UXJDRlBEMlhzSTBo?=
 =?utf-8?B?cXlYV1BDWldtUnpkTGZ1RElYejUyU2xGR0xCNy9icExlVTUybituRDdZSHc3?=
 =?utf-8?B?K3piWUlZcWJmc3VENmpyNWRxVWk4MmdHOVhWb2lOcG56dzFPNEhxcWhGYjF4?=
 =?utf-8?B?Q3R2ME9yQjJSbitiUVF4S2Q2L0JWVW0xWjZLYUVBWEYzSHIvUlFtWHc1TnhV?=
 =?utf-8?Q?QN+iscb/jWlykr1g=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad91f36a-dcbf-4c21-b076-08de5826c5cf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:21:08.4576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOj88jaRbFeOcFz38kfU0lRpLX91BHoQdlo4W9cGs6tbp8T3YnUxdcw2byHzr169NgoeLWXeKqtrHbOOCutu29ETfRKCJobsKyGSPWjyRXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5149
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:mid,citrix.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:sstabellini@kernel.org,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 72C2448156
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/01/2026 11:22 am, Alejandro Vallejo wrote:
> On Tue Jan 20, 2026 at 10:53 AM CET, Alejandro Vallejo wrote:
>> Bus Locks are very costly and a VM left unchecked spamming instructions that
>> lock the memory bus (e.g: unaligned atomic CAS) makes system perf take a
>> nosedive. This patch is similar to BLD of VMX, but for SVM. It configures all
>> VMRUNs so they automatically exit at the first encounter of a buslock event,
>> effectively rate-limiting them.
> Does this warrant an entry in the CHANGELOG?

The Intel side got one (back in 4.18 and in the section about Sapphire
Rapids).

~Andrew

