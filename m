Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E51A8B001
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 08:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955057.1348901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4vwF-0002m3-TS; Wed, 16 Apr 2025 06:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955057.1348901; Wed, 16 Apr 2025 06:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4vwF-0002kE-QY; Wed, 16 Apr 2025 06:07:59 +0000
Received: by outflank-mailman (input) for mailman id 955057;
 Wed, 16 Apr 2025 06:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2j5z=XC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u4vwE-0002k5-N0
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 06:07:59 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2408::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21f8ed1d-1a89-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 08:07:54 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ2PR12MB8830.namprd12.prod.outlook.com (2603:10b6:a03:4d0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 06:07:49 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 06:07:49 +0000
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
X-Inumbo-ID: 21f8ed1d-1a89-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrVGKN6DY5xJIK6d5zObO4qDP2HH3nF2zKqsIqIfnB+aUqvfB44TfZBSZk/q4NoN/mKsT4ti2Sphh36s+31LpTphM31DjGPo0miHThSYTISZvEmjhY+vnWMSfAVvVkivi0dA+QIFaYgXE8aOnqacIZG2oxsACxYaPdmaLv19Fels4sVm5mJCcsi8twp6b6Xdu66iA/+q/ohRy5P9kIJ6eVEWiaaMUG6o4mewj2yovzCNBKYigswbLJ+biPofJiObJta2RUsa4/y5O0NQruCON2p1rZ7W5JLWCatbYFgvW8foK7CtU7S8Zj/3dr8stWTuX8ZsQ6oEiYGl6EZGUVebgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUteiydPXc0bjwkCVrvAB/hIWGFMfTaIboo8J4unVQY=;
 b=dHJhA7ydb5Pdv68YC6YVyQda31YKX7HJtyzusTrdewSWdLsm2NZhEv8s8/7kWCo9KjlzWjbqz4SM2vX+5YZb/Y7cEe4XI9RWSO1WdZN5TfaObBVhvPEC1tgLPDajMN1+nnEdkZC4rlePKl9kymp84CAS4ytfw8yXl8LE+pZmwCQSwUgMzO9MR0y4Bz1E2ZNrCjqP/6WVucxIxsSrpQVAEDPJHxxP/t5+1oEB/9cebfWPqk0RzfhboTJt6s2y17lY74IPIipZFemtDUouXnNaAgHAeV4OxruVQxp3HqSGTIjbK5r6KHhJngnnBBtqkfawZy9rbq1DbzW7//c5+oUzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUteiydPXc0bjwkCVrvAB/hIWGFMfTaIboo8J4unVQY=;
 b=vOx4iA9PvgB7g8lUxq5TLonYhM3YdJG68L7VrAI0oweETDtH8c42nvG6DSt9NIUUTjjc99Jmv4mRaHNNeyW6rUnFqqUclj7BWL9xG9xBYvQ03VTXUrfZkpT/teHSRm4IAE/1/1F59ELsEh4nBO5N0NQsTwCwDeXPeK4pUf95LxM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 4/8] vpci: Hide capability when it fails to initialize
Thread-Topic: [PATCH v2 4/8] vpci: Hide capability when it fails to initialize
Thread-Index: AQHbqRsfg3RwMiNXxEOdiN0NH9ACsrOklU6AgAHIwoA=
Date: Wed, 16 Apr 2025 06:07:49 +0000
Message-ID:
 <BL1PR12MB5849CBA474894656DA64CE85E7BD2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-5-Jiqian.Chen@amd.com> <Z_45NzpRLkfLveug@macbook.lan>
In-Reply-To: <Z_45NzpRLkfLveug@macbook.lan>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ2PR12MB8830:EE_
x-ms-office365-filtering-correlation-id: d9101a7d-d5c1-4e80-7f67-08dd7cad03c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Vm1xZnNnYXFwMmlJSnQ5REQ5Q3NhSVNZZ1hWV05CRnV2MnpoSXhMOUVvYS9W?=
 =?utf-8?B?SnBhamxja3dxdXA4S1pRY3NGRTg4ekFHcUhjU3hucy9mQ3RnT3Y3alJEWkhC?=
 =?utf-8?B?QmUyM2V1dDBSTjc1ektvd01qTEFDRDBMQWF2WWo1NU4yUHQybmE4M0pBV1VP?=
 =?utf-8?B?dEdOSE9HSjZSdjdtcFpxVDQ1bnl0VloyNFdCVzZ3S1RTd2Y3ajlNVXB3cUpz?=
 =?utf-8?B?M2UxM3JaYXBkeHFNQllRNm9JbzRpUUtyMncyMnpHRWtHOWJsSlZTTE9aWUxx?=
 =?utf-8?B?bzNJbHlzL2c3Wk1NSWl1NEY0a0tiRUtsSFhFUnQwcnZsVWxwaCtmVVNVUjZz?=
 =?utf-8?B?Y1dFNXl1NFhxbUNKemszdXlLSE4xNmJZQ3lIYStpY0hDMDZ1UWs3TUY2eGVB?=
 =?utf-8?B?am8rcmdBR01PVlBwM1BjK3hPU091Nk5UK2hMOXc1Ny9SbUVvT21KaFY3OHBO?=
 =?utf-8?B?TjlrV2FldGNXb1VSSE5JSG8wa2ZWc1BON0FrOEp4UHRyZG1ub0xsRDF5aDM4?=
 =?utf-8?B?K1NPOVFkdkpFZ2VsQnljSk12aFo2QWwxeFlBWHdBTTVRRkUyaHJVVG5lQ2pH?=
 =?utf-8?B?TjA2czlFVTlDRVNvY0dsemp0ZDRGV1lRNnJzWTB1NFRiVlQ2L0VJUkNvcnFq?=
 =?utf-8?B?c0R6ci90eU1DVzYwckFvNHcvMDFiTVROSS95Z3B4OHFPQUo5dVVieXZCWDJT?=
 =?utf-8?B?cXQ1cHFyaGEyRzFlQVVpNXBTS3RNK3JZNm5rUUlDajVQaWxENUgxOXV3TGIy?=
 =?utf-8?B?YnVDb1hwOXMwcVg5cGVFWElwS2dKVnRYazhDQTBBV0Q0NFB6THd1M0FtZkhS?=
 =?utf-8?B?a1VKVUpidXgzZitZd3BaZ3I2YU02N0g4dmpaMlVkSFpubHE3SmNJejJ5NmpG?=
 =?utf-8?B?Z0cwZWp0TGZGL3BqaEdrY1ZzeXYzNnhmWHhYQ0xRZTVSYTBxcHFvY3U5d0Yz?=
 =?utf-8?B?b1B3WFVVcUI2QkJpbXJKZVBPdldaeVlscDNEeXdwNEtLenJsT2pMeFFwQktM?=
 =?utf-8?B?blJpWFJncTZ3TGgrTWxPSEZySk1DS1ZqZ1NEUjVWVUZ4QnlSYTYwVEFuWW9h?=
 =?utf-8?B?RE1NdURlSlhDbXp0WUVSVTd1T0FpZG5UMzByTWtadkNDUUdIRUMyKzZkdXFw?=
 =?utf-8?B?M1RaZGxaSmlud3U1R0Q2emZhSUxGMVB3amtsMU9Cc2NMaDJjUWM2bDdsQXR2?=
 =?utf-8?B?eENMYzZYYitaa2IydTdESWE3TytJRER5N1V6bnY3d2x5cWdvRks5QmlERjFP?=
 =?utf-8?B?ZFJnU3NUL1FjdXNoU0FLYWY3NU16NWNvdlBEckl2RUdCNmhXcnhpNnVXL1Vq?=
 =?utf-8?B?RzBmK0FmTlVuTWVGVFExWWVuOGEvb2czdlJTa0tqV0N0OWhkc2Zia0ZBbGpt?=
 =?utf-8?B?N2VsYjVFcHRWU21xdTFtajc4RVhENzZLR3F1ckYvVHZmZHM4WmU1SGFuSVlD?=
 =?utf-8?B?emdjOUlVZjhHV0phQkgxMHNic2hxTXl2T0hUd1VNUmdEam9HR0JjNUhiMGgy?=
 =?utf-8?B?V1FQZDRyN3FKK3J4eEdzVzMvMUhreHUya3BhTXRZbTlFMWRJSTE4OExUMWRs?=
 =?utf-8?B?NGVIdzQ3SUh1L3haM2ZDc2ZMM2VIWjFXQXNDcGJwc1h0NDdSdEFtM3JOaVZ3?=
 =?utf-8?B?QU1aU0ExWTRnaW9Eay9NVERxUTZrL3dySVFVdk9HSXllNXlHL2hBaElMdytD?=
 =?utf-8?B?bGpkQjRQN0x0eU53STBHQW9nSzNQYVpTOVBNbjM5UjVwb0Y1OXp2UFVlRU1Q?=
 =?utf-8?B?Nkc3VWh5cHZaN2xQczZKTnNWZFJVaVFxM3JDeWZ3a3A3QXBzV2JYdVNKUUMv?=
 =?utf-8?B?bU1DeW9nN29UUGhxVENQM1oyT2MzS2xwZDFTVkV3cXg0ZGxYZ2lpUUNkTlEy?=
 =?utf-8?B?TEZuRkMyMDVYQnJoV0czNTJGR05KUGYxc0EwMlg4K1RJNWwrM08rcXFza1RW?=
 =?utf-8?B?VmdxS3NINlZBVzdya21rUWo2MjZEQkk2NVU3ZldlMFhPeWd4Q0g5OTlTRnNo?=
 =?utf-8?Q?TQyqSujF0R2JKcgkdowaMOFG+AbAGU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S0xxdnI3MTd4ZThkbjZnSlY0SGM4ZmZHWWZGTE53b2tFTnJBRWVOQzJpSEpN?=
 =?utf-8?B?K2JPQ1J6cnJ0bXhvSTU4UHBZUEtEUDk4WHdMSG1sMjd5TXVZNUM4QjFPS1Zq?=
 =?utf-8?B?Mlg2NFRHaU5OeEpyeFIxcTcrOUtDSzN5RHkwZStUMzZBL0lRT2xGdlg5a2Rn?=
 =?utf-8?B?NDJTSm1JSmUwSHdWU0tONFNjKytZY3Z5QVpMWm5CbHZvWGM3ZmJGUGg5WHpp?=
 =?utf-8?B?NUdHWmRvNEdSWVl2ZW1BUXI2MTdWeGdreEtTWE1nTWtEaUlTL0FaVVdiODUw?=
 =?utf-8?B?VjNBZmo3aWhyK1pYcnhQb25aOUcvRjlzcC9UdkhTVE1TbmNwRDZBMThqNTha?=
 =?utf-8?B?VjZQMzhlZ25oVlFMcDBCOVN1aHB2Q3hoTVR3YVpwUTRnMTBmN2hZdXJiOTFL?=
 =?utf-8?B?UEtzTW5MbEVSTjZkVmFJcHNFS3lzQkgrTzdLMVUvZTdyWllyOTduTGxlSEh3?=
 =?utf-8?B?MGx6NThiaUZoVVNtVkQ2OTFQM0NLN3RDU3hzWEVKcGp5Qjk4VS9yU2xnNDYz?=
 =?utf-8?B?RUxNMG03K2tSNFNvd3RxWUE5aHlxQlJLWEpCazBHbjZtNW95T1R1VEF1dWI0?=
 =?utf-8?B?dDdjSVJKNEZYQTFlWHM4bllMN05SdGlFL1NVNE1IV0ZkMjY4TXJYNGNpOGNo?=
 =?utf-8?B?dVEyalRiR0N4bjZGYjB6NXA5MWErSitLYUhCbGFXUkllSk9WRi85eFB0RjdQ?=
 =?utf-8?B?ZEh1ZHFuTDhmSkFBSGRQcmpHb0g5dE5NelcyZEFNZzJJVmFUY0l2d29YREhK?=
 =?utf-8?B?dEQvd2FjcGJOYWRrU2pMSGthMHlEVUtDNlBNMGlmaGNoWE1ZM0NGb1JZdFBM?=
 =?utf-8?B?a3ducWU3bjY1QUN3STZuaHpmQWxEdzh0cFBsTk8ydldhNWxYVXI5VE53UmNh?=
 =?utf-8?B?cHgxNlZERnNNWGY1VERMMzdyMEpJWXM4SWRHZmxwazVlS2I0NndELzdFOUc0?=
 =?utf-8?B?V0ZkSjliN3BhZ2dHank4WEM0d3ZaRW82bmRYUmRZM3VvMTNkMDhzVzNxeG0w?=
 =?utf-8?B?VThNMEJCNHYwVERqUWRaME03R0Z1aEZrRzlSZ1ZHa1R0NFVVLzRUcTd2QmZx?=
 =?utf-8?B?Vks5clA4elJWcWlZcmZEbGxyeUxDSXVzY1VGWHhmK0I0SHdOZUlvaXFPc2Rw?=
 =?utf-8?B?TWVEdkVLdlBsWXZWZUJKNHdQbkl1TTg2QmNSRVRWc0Q1TUpnWEpITmdGRnUr?=
 =?utf-8?B?TEpwZkgwc1NkblVqblQyQmw4WW9pS0hXbkplZlg2eFhOaGFlVHBGSWtROW9V?=
 =?utf-8?B?MlBZRkg4cjFFdlNJU1I0YUEydVo1Mi9HUDlQR0daSWdEdHQ3QllOVGM3SXBJ?=
 =?utf-8?B?RlNtQnhTSGY3QUdsTEtWb2RzT3R5c2hjWWpxQXQyUGtFd3dTeUxlY1BjNFVN?=
 =?utf-8?B?ODFycWp2WE5wYTJ3Y0RUL1BESTcyR1N5TGtYWXdCNFQrSUMwQkxRbDV6bE9a?=
 =?utf-8?B?bWYrVEVrUGNVZ2RoT1o2N2VuRkxkNGIxMkV2TGxHSEIwSmN5WkExMDFwcEVj?=
 =?utf-8?B?aEJLM1Rua3lpaW1QNmpLUDRLTzZiNE91WnV3QkpySzFXOUVmdEtzV1JxWG1r?=
 =?utf-8?B?djdoOEo1WWNyY1NKdzhCMllobFZDc29pNjUrZVB0dHB6UEpvaW1UK2NVUTQ5?=
 =?utf-8?B?cFRMR05GOEtiUG10dDVLaDI4Q3V4c0RKbUo0UHdPOHVFMWg5VUdlVVF4cFN2?=
 =?utf-8?B?cC9VaFJTYXQ1Vk1KbHpSY3BLU25qdE9xeUhOTkJaVm1YbmNJZ1NyTTA1MFg0?=
 =?utf-8?B?ejBBSi9ReHNxUjZ0RDA0NmlNMCtXdXNzUDBscVdzUGVhUFZzZE95MjRDeTN2?=
 =?utf-8?B?cWt6N2t4UTNlMWszck1xZ1E5YjNOZ0w3UnpRMTN3Qi80MHpRTUk0aGxqcHgv?=
 =?utf-8?B?RXg1cVJXQVF1cHRvN2hQWnZRbkJIOU9aMUt6TkcrOWovcmMyYUJ6NTdkNVNU?=
 =?utf-8?B?Q0JlYkRNSWt5VHFDcGZ0TlVFWVUzUkpPUG1zaW1tZGNSYU9LRWQ3RVl6LzBl?=
 =?utf-8?B?UXdNUFdCNGtEZWw2cCt5QUtUU0YzeXdQazRTeDdLQmNkSHVvaDBTWHRHRkQy?=
 =?utf-8?B?Z05saUVrc0lia0ZQc1ZDZ2ZqaXRtVjhDMVhxcnlML2gzMEQ2eUU4ckVDOTNI?=
 =?utf-8?Q?YT3A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1FF7E45BC887C4091126D100EB5F2B3@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9101a7d-d5c1-4e80-7f67-08dd7cad03c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 06:07:49.0533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0hAnIHZd46xKsq5z46wJvffBgXi/L9t8wdbg9LB35/C14mrduJwcyJ1JuyMF9OlY2SvB+gDAPpgZtlBLqefsSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8830

T24gMjAyNS80LzE1IDE4OjQ3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQsIEFw
ciAwOSwgMjAyNSBhdCAwMjo0NToyNFBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdo
ZW4gdnBjaSBmYWlscyB0byBpbml0aWFsaXplIGEgY2FwYWJpbGl0eSBvZiBhIGRldmljZSwgaXQg
anVzdA0KPj4gcmV0dXJuIGVycm9yIGluc3RlYWQgb2YgY2F0Y2hpbmcgYW5kIHByb2Nlc3Npbmcg
ZXhjZXB0aW9uLiBUaGF0DQo+PiBtYWtlcyB0aGUgZW50aXJlIGRldmljZSB1bnVzYWJsZS4NCj4+
DQo+PiBTbywgcmVmYWN0b3IgUkVHSVNURVJfVlBDSV9JTklUIHRvIGNvbnRhaW4gbW9yZSBjYXBh
YmlsaXR5IHNwZWNpZmljDQo+PiBpbmZvcm1hdGlvbiwgYW5kIHVzZSBuZXcgZnVuY3Rpb25zIHRv
IGhpZGUgY2FwYWJpbGl0eSB3aGVuDQo+PiBpbml0aWFsaXphdGlvbiBmYWlscyBpbiB2cGNpX2Fz
c2lnbl9kZXZpY2UoKS4NCj4+DQo+PiBUaG9zZSBuZXcgZnVuY3Rpb25zIHJlbW92ZSB0aGUgZmFp
bGVkIGxlZ2FjeS9leHRlbmRlZCBjYXBhYmlsaXR5DQo+PiBmcm9tIHRoZSBlbXVsYXRlZCBsZWdh
Y3kvZXh0ZW5kZWQgY2FwYWJpbGl0eSBsaXN0Lg0KPiANCj4gSSB0aGluayB0aGlzIG5lZWRzIHRv
IGJlIGF0IGxlYXN0IDIgZGlmZmVyZW50IGNoYW5nZXMuDQo+IA0KPiBGaXJzdCBjaGFuZ2UgYWRk
cyB0aGUgdXNhZ2Ugb2YgUkVHSVNURVJfVlBDSV97TEVHQUNZLEVYVEVOREVEfV9DQVAoKQ0KPiBo
ZWxwZXJzLCB3aGlsZSBzZWNvbmQgY2hhbmdlIGludHJvZHVjZXMgdGhlIG1hc2tpbmcgb2YgY2Fw
YWJpbGl0aWVzIG9uDQo+IGluaXRpYWxpemF0aW9uIGZhaWx1cmUuDQo+IA0KPiBPdGhlcndpc2Ug
cmV2aWV3IGlzIGEgYml0IGNvbXBsaWNhdGVkLg0KPiANCj4+IFdoYXQncyBtb3JlLCBjaGFuZ2Ug
dGhlIGRlZmluaXRpb24gb2YgaW5pdF9oZWFkZXIoKSBzaW5jZSBpdCBpcw0KPj4gbm90IGEgY2Fw
YWJpbGl0eSBhbmQgaXQgaXMgbmVlZGVkIGZvciBhbGwgZGV2aWNlcycgUENJIGNvbmZpZyBzcGFj
ZS4NCj4+DQo+PiBOb3RlOiBjYWxsIHZwY2lfbWFrZV9tc2l4X2hvbGUoKSBpbiB0aGUgZW5kIG9m
IGluaXRfbXNpeCgpIHNpbmNlIHRoZQ0KPj4gY2hhbmdlIG9mIHNlcXVlbmNlIG9mIGluaXRfaGVh
ZGVyKCkgYW5kIGluaXRfbXNpeCgpLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVu
IDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gLS0tDQo+PiBjYzogIlJvZ2VyIFBhdSBNb25uw6ki
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+IGNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPg0KPj4gY2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2
YXRlcy50ZWNoPg0KPj4gY2M6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+
PiBjYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gY2M6IEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+DQo+PiBjYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPg0KPj4gLS0tDQo+PiB2MS0+djIgY2hhbmdlczoNCj4+ICogUmVtb3ZlZCB0
aGUgInByaW9yaXRpZXMiIG9mIGluaXRpYWxpemluZyBjYXBhYmlsaXRpZXMgc2luY2UgaXQgaXNu
J3QgdXNlZCBhbnltb3JlLg0KPj4gKiBBZGRlZCBuZXcgZnVuY3Rpb24gdnBjaV9jYXBhYmlsaXR5
X21hc2soKSBhbmQgdnBjaV9leHRfY2FwYWJpbGl0eV9tYXNrKCkgdG8gcmVtb3ZlIGZhaWxlZCBj
YXBhYmlsaXR5IGZyb20gbGlzdC4NCj4+ICogQ2FsbGVkIHZwY2lfbWFrZV9tc2l4X2hvbGUoKSBp
biB0aGUgZW5kIG9mIGluaXRfbXNpeCgpLg0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+IEppcWlh
biBDaGVuLg0KPj4gLS0tDQo+PiAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyAgfCAgIDMgKy0N
Cj4+ICB4ZW4vZHJpdmVycy92cGNpL21zaS5jICAgICB8ICAgMiArLQ0KPj4gIHhlbi9kcml2ZXJz
L3ZwY2kvbXNpeC5jICAgIHwgICA4ICstDQo+PiAgeGVuL2RyaXZlcnMvdnBjaS9yZWJhci5jICAg
fCAgIDIgKy0NCj4+ICB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyAgICB8IDE3NSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+PiAgeGVuL2luY2x1ZGUveGVuL3BjaV9yZWdz
LmggfCAgIDEgKw0KPj4gIHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAgIHwgIDI2ICsrKystLQ0K
Pj4gIHhlbi9pbmNsdWRlL3hlbi94ZW4ubGRzLmggIHwgICAyICstDQo+PiAgOCBmaWxlcyBjaGFu
Z2VkLCAxNzkgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5j
DQo+PiBpbmRleCA2ODMzZDQ1NjU2NmIuLjUxYTY3ZDc2YWQ4YSAxMDA2NDQNCj4+IC0tLSBhL3hl
bi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVy
LmMNCj4+IEBAIC04NDgsNyArODQ4LDcgQEAgc3RhdGljIGludCB2cGNpX2luaXRfZXh0X2NhcGFi
aWxpdHlfbGlzdChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgcmV0dXJuIDA7DQo+PiAg
fQ0KPj4gIA0KPj4gLXN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9oZWFkZXIoc3RydWN0IHBjaV9k
ZXYgKnBkZXYpDQo+PiAraW50IHZwY2lfaW5pdF9oZWFkZXIoc3RydWN0IHBjaV9kZXYgKnBkZXYp
DQo+PiAgew0KPj4gICAgICB1aW50MTZfdCBjbWQ7DQo+PiAgICAgIHVpbnQ2NF90IGFkZHIsIHNp
emU7DQo+PiBAQCAtMTA0NCw3ICsxMDQ0LDYgQEAgc3RhdGljIGludCBjZl9jaGVjayBpbml0X2hl
YWRlcihzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgcGNpX2NvbmZfd3JpdGUxNihwZGV2
LT5zYmRmLCBQQ0lfQ09NTUFORCwgY21kKTsNCj4+ICAgICAgcmV0dXJuIHJjOw0KPj4gIH0NCj4+
IC1SRUdJU1RFUl9WUENJX0lOSVQoaW5pdF9oZWFkZXIsIFZQQ0lfUFJJT1JJVFlfTUlERExFKTsN
Cj4+ICANCj4+ICAvKg0KPj4gICAqIExvY2FsIHZhcmlhYmxlczoNCj4+IGRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy92cGNpL21zaS5jIGIveGVuL2RyaXZlcnMvdnBjaS9tc2kuYw0KPj4gaW5kZXgg
NjZlNWE4YTExNmJlLi5jYTg5YWU5YjljMjIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92
cGNpL21zaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL21zaS5jDQo+PiBAQCAtMjcwLDcg
KzI3MCw3IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9tc2koc3RydWN0IHBjaV9kZXYgKnBk
ZXYpDQo+PiAgDQo+PiAgICAgIHJldHVybiAwOw0KPj4gIH0NCj4+IC1SRUdJU1RFUl9WUENJX0lO
SVQoaW5pdF9tc2ksIFZQQ0lfUFJJT1JJVFlfTE9XKTsNCj4+ICtSRUdJU1RFUl9WUENJX0xFR0FD
WV9DQVAoUENJX0NBUF9JRF9NU0ksIGluaXRfbXNpKTsNCj4+ICANCj4+ICB2b2lkIHZwY2lfZHVt
cF9tc2kodm9pZCkNCj4+ICB7DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9tc2l4
LmMgYi94ZW4vZHJpdmVycy92cGNpL21zaXguYw0KPj4gaW5kZXggNmJkOGM1NWJiNDhlLi42NTM3
Mzc0Yzc5YTAgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL21zaXguYw0KPj4gKysr
IGIveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMNCj4+IEBAIC03NTEsOSArNzUxLDEzIEBAIHN0YXRp
YyBpbnQgY2ZfY2hlY2sgaW5pdF9tc2l4KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICBw
ZGV2LT52cGNpLT5tc2l4ID0gbXNpeDsNCj4+ICAgICAgbGlzdF9hZGQoJm1zaXgtPm5leHQsICZk
LT5hcmNoLmh2bS5tc2l4X3RhYmxlcyk7DQo+PiAgDQo+PiAtICAgIHJldHVybiAwOw0KPj4gKyAg
ICBzcGluX2xvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4gKyAgICByYyA9IHZwY2lfbWFrZV9t
c2l4X2hvbGUocGRldik7DQo+PiArICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsN
Cj4+ICsNCj4+ICsgICAgcmV0dXJuIHJjDQo+PiAgfQ0KPj4gLVJFR0lTVEVSX1ZQQ0lfSU5JVChp
bml0X21zaXgsIFZQQ0lfUFJJT1JJVFlfSElHSCk7DQo+PiArUkVHSVNURVJfVlBDSV9MRUdBQ1lf
Q0FQKFBDSV9DQVBfSURfTVNJWCwgaW5pdF9tc2l4KTsNCj4+ICANCj4+ICAvKg0KPj4gICAqIExv
Y2FsIHZhcmlhYmxlczoNCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3JlYmFyLmMg
Yi94ZW4vZHJpdmVycy92cGNpL3JlYmFyLmMNCj4+IGluZGV4IDc5MzkzNzQ0OWFmNy4uNzk4NThl
NWRjOTJmIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9yZWJhci5jDQo+PiArKysg
Yi94ZW4vZHJpdmVycy92cGNpL3JlYmFyLmMNCj4+IEBAIC0xMTgsNyArMTE4LDcgQEAgc3RhdGlj
IGludCBjZl9jaGVjayBpbml0X3JlYmFyKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gIA0KPj4g
ICAgICByZXR1cm4gMDsNCj4+ICB9DQo+PiAtUkVHSVNURVJfVlBDSV9JTklUKGluaXRfcmViYXIs
IFZQQ0lfUFJJT1JJVFlfTE9XKTsNCj4+ICtSRUdJU1RFUl9WUENJX0VYVEVORF9DQVAoUENJX0VY
VF9DQVBfSURfUkVCQVIsIGluaXRfcmViYXIpOw0KPj4gIA0KPj4gIC8qDQo+PiAgICogTG9jYWwg
dmFyaWFibGVzOg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVu
L2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+IGluZGV4IDFlNmFhNWQ3OTliOS4uZjFmMTI1YmZkYWIx
IDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+ICsrKyBiL3hlbi9k
cml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiBAQCAtMzUsOSArMzUsMjUgQEAgc3RydWN0IHZwY2lfcmVn
aXN0ZXIgew0KPj4gICAgICB1aW50MzJfdCByc3Zkel9tYXNrOw0KPj4gIH07DQo+PiAgDQo+PiAr
c3RhdGljIGludCB2cGNpX3JlZ2lzdGVyX2NtcChjb25zdCBzdHJ1Y3QgdnBjaV9yZWdpc3RlciAq
cjEsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdnBjaV9y
ZWdpc3RlciAqcjIpDQo+PiArew0KPj4gKyAgICAvKiBSZXR1cm4gMCBpZiByZWdpc3RlcnMgb3Zl
cmxhcC4gKi8NCj4+ICsgICAgaWYgKCByMS0+b2Zmc2V0IDwgcjItPm9mZnNldCArIHIyLT5zaXpl
ICYmDQo+PiArICAgICAgICAgcjItPm9mZnNldCA8IHIxLT5vZmZzZXQgKyByMS0+c2l6ZSApDQo+
PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsgICAgaWYgKCByMS0+b2Zmc2V0IDwgcjItPm9mZnNl
dCApDQo+PiArICAgICAgICByZXR1cm4gLTE7DQo+PiArICAgIGlmICggcjEtPm9mZnNldCA+IHIy
LT5vZmZzZXQgKQ0KPj4gKyAgICAgICAgcmV0dXJuIDE7DQo+PiArDQo+PiArICAgIEFTU0VSVF9V
TlJFQUNIQUJMRSgpOw0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiAgI2lmZGVm
IF9fWEVOX18NCj4+IC1leHRlcm4gdnBjaV9yZWdpc3Rlcl9pbml0X3QgKmNvbnN0IF9fc3RhcnRf
dnBjaV9hcnJheVtdOw0KPj4gLWV4dGVybiB2cGNpX3JlZ2lzdGVyX2luaXRfdCAqY29uc3QgX19l
bmRfdnBjaV9hcnJheVtdOw0KPj4gK2V4dGVybiB2cGNpX2NhcGFiaWxpdHlfdCAqY29uc3QgX19z
dGFydF92cGNpX2FycmF5W107DQo+PiArZXh0ZXJuIHZwY2lfY2FwYWJpbGl0eV90ICpjb25zdCBf
X2VuZF92cGNpX2FycmF5W107DQo+PiAgI2RlZmluZSBOVU1fVlBDSV9JTklUIChfX2VuZF92cGNp
X2FycmF5IC0gX19zdGFydF92cGNpX2FycmF5KQ0KPj4gIA0KPj4gICNpZmRlZiBDT05GSUdfSEFT
X1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPj4gQEAgLTgzLDYgKzk5LDEzMyBAQCBzdGF0aWMgaW50IGFz
c2lnbl92aXJ0dWFsX3NiZGYoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgDQo+PiAgI2VuZGlm
IC8qIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUICovDQo+PiAgDQo+PiArc3RhdGljIHZv
aWQgdnBjaV9jYXBhYmlsaXR5X21hc2soc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQgaW50IGNhcCkNCj4+ICt7
DQo+PiArICAgIGNvbnN0IHVuc2lnbmVkIGludCBzaXplID0gMTsNCj4+ICsgICAgY29uc3QgdW5z
aWduZWQgaW50IG9mZnNldCA9IHBjaV9maW5kX2NhcF9vZmZzZXQocGRldi0+c2JkZiwgY2FwKTsN
Cj4+ICsgICAgY29uc3Qgc3RydWN0IHZwY2lfcmVnaXN0ZXIgciA9IHsgLm9mZnNldCA9IG9mZnNl
dCwgLnNpemUgPSBzaXplIH07DQo+PiArICAgIHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpybTsNCj4+
ICsgICAgc3RydWN0IHZwY2kgKnZwY2kgPSBwZGV2LT52cGNpOw0KPj4gKw0KPj4gKyAgICBzcGlu
X2xvY2soJnZwY2ktPmxvY2spOw0KPj4gKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggcm0sICZ2
cGNpLT5oYW5kbGVycywgbm9kZSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGludCBjbXAgPSB2
cGNpX3JlZ2lzdGVyX2NtcCgmciwgcm0pOw0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCAhY21wICYm
IHJtLT5vZmZzZXQgPT0gb2Zmc2V0ICYmIHJtLT5zaXplID09IHNpemUgKQ0KPj4gKyAgICAgICAg
ew0KPj4gKyAgICAgICAgICAgIHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpwcmUgPSBsaXN0X2VudHJ5
KHJtLT5ub2RlLnByZXYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHZwY2lfcmVnaXN0ZXIsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm9kZSk7DQo+PiArICAgICAgICAg
ICAgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKm5leHQgPSBsaXN0X2VudHJ5KHJtLT5ub2RlLm5leHQs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCB2cGNpX3JlZ2lzdGVyLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBub2RlKTsNCj4+ICsNCj4+ICsgICAgICAgICAgICBwcmUt
PnByaXZhdGUgPSBuZXh0LT5wcml2YXRlOw0KPj4gKw0KPj4gKyAgICAgICAgICAgIC8qIFBDSV9D
QVBfTElTVF9JRCByZWdpc3RlciBvZiBjdXJyZW50IGNhcGFiaWxpdHkgKi8NCj4+ICsgICAgICAg
ICAgICBsaXN0X2RlbCgmcm0tPm5vZGUpOw0KPj4gKyAgICAgICAgICAgIC8qIFBDSV9DQVBfTElT
VF9ORVhUIHJlZ2lzdGVyIG9mIGN1cnJlbnQgY2FwYWJpbGl0eSAqLw0KPj4gKyAgICAgICAgICAg
IGxpc3RfZGVsKCZuZXh0LT5ub2RlKTsNCj4+ICsgICAgICAgICAgICBzcGluX3VubG9jaygmdnBj
aS0+bG9jayk7DQo+IA0KPiBBcmUgeW91IHN1cmUgdGhpcyB3b3JrcyBhcyBpbnRlbmRlZD8gIFRo
ZSBsaXN0IGlzIHNvcnRlZCwgc28gaWYgdGhlcmUNCj4gZnVydGhlciBoYW5kbGVycyBpbiBiZXR3
ZWVuIHRoZSB0d28gY2FwYWJpbGl0aWVzLCBsaWtlIHdoZW4gaGFuZGxpbmcNCj4gTVNJIGNhcGFi
aWxpdHksIHRoZSBuZXh0IGhhbmRsZXIgaW4gdGhlIGxpc3Qgd29uJ3QgcG9pbnQgdG8gdGhlIG5l
eHQNCj4gY2FwYWJpbGl0eSBsaXN0IGhhbmRsZXIuDQoNCk9oLCBJIHRob3VnaHQgdGhlIGNhcGFi
aWxpdHkgbGlzdCBpcyBhbHNvIHNvcnRlZCBpbiB0aGUgaGFyZHdhcmUuDQpTaW5jZSBpdCBpcyBu
b3QgdGhhdCBjYXNlLiBNeSBtZXRob2Qgd291bGQgbm90IHdvcmsgYXMgaW50ZW5kZWQuDQpJIHdp
bGwgY2hhbmdlIHRvIGdldCB0aGUgY2FwYWJpbGl0eSBwb3NpdGlvbiBhbmQgdGhlIHByZXZpb3Vz
IGNhcGFiaWxpdHkgcG9zaXRpb24gZnJvbSB0aGUgaGFyZHdhcmUsDQphbmQgdGhlbiBhY2NvcmRp
bmcgdG8gdGhlIHR3byBwb3NpdGlvbiB0byBnZXQgaGFuZGxlcnMgZnJvbSB2cGNpIGhhbmRsZXJz
Lg0KDQpBbmQgSSB3aWxsIGNoYW5nZSBteSBwYXRjaCBhY2NvcmRpbmcgdG8geW91ciBvdGhlciBj
b21tZW50cyBpbiB0aGlzIGVtYWlsLg0KVGhhbmsgeW91IGZvciBkZXRhaWwgcmV2aWV3Lg0KDQo+
IA0KPj4gKw0KPj4gKyAgICAgICAgICAgIHhmcmVlKHJtKTsNCj4+ICsgICAgICAgICAgICB4ZnJl
ZShuZXh0KTsNCj4+ICsgICAgICAgICAgICByZXR1cm47DQo+PiArICAgICAgICB9DQo+PiArICAg
ICAgICBpZiAoIGNtcCA8PSAwICkNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgfQ0K
Pj4gKyAgICBzcGluX3VubG9jaygmdnBjaS0+bG9jayk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRp
YyB2b2lkIHZwY2lfZXh0X2NhcGFiaWxpdHlfbWFzayhzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQgaW50
IGNhcCkNCj4+ICt7DQo+PiArICAgIGNvbnN0IHVuc2lnbmVkIGludCBzaXplID0gNDsNCj4+ICsg
ICAgY29uc3QgdW5zaWduZWQgaW50IG9mZnNldCA9IHBjaV9maW5kX2V4dF9jYXBhYmlsaXR5KHBk
ZXYtPnNiZGYsIGNhcCk7DQo+PiArICAgIGNvbnN0IHN0cnVjdCB2cGNpX3JlZ2lzdGVyIHIgPSB7
IC5vZmZzZXQgPSBvZmZzZXQsIC5zaXplID0gc2l6ZSB9Ow0KPj4gKyAgICBzdHJ1Y3QgdnBjaV9y
ZWdpc3RlciAqcm07DQo+PiArICAgIHN0cnVjdCB2cGNpICp2cGNpID0gcGRldi0+dnBjaTsNCj4+
ICsNCj4+ICsgICAgc3Bpbl9sb2NrKCZ2cGNpLT5sb2NrKTsNCj4+ICsgICAgbGlzdF9mb3JfZWFj
aF9lbnRyeSAoIHJtLCAmdnBjaS0+aGFuZGxlcnMsIG5vZGUgKQ0KPj4gKyAgICB7DQo+PiArICAg
ICAgICBpbnQgY21wID0gdnBjaV9yZWdpc3Rlcl9jbXAoJnIsIHJtKTsNCj4+ICsNCj4+ICsgICAg
ICAgIGlmICggIWNtcCAmJiBybS0+b2Zmc2V0ID09IG9mZnNldCAmJiBybS0+c2l6ZSA9PSBzaXpl
ICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBzdHJ1Y3QgdnBjaV9yZWdpc3RlciAq
cHJlOw0KPj4gKyAgICAgICAgICAgIHUzMiBwcmVfaGVhZGVyLCBoZWFkZXIgPSAodTMyKSh1aW50
cHRyX3Qpcm0tPnByaXZhdGU7DQo+PiArDQo+PiArICAgICAgICAgICAgaWYgKCBvZmZzZXQgPT0g
MHgxMDBVICYmIFBDSV9FWFRfQ0FQX05FWFQoaGVhZGVyKSA9PSAwICkNCj4gDQo+IEl0IHdvdWxk
IGJlIHNhZmVyIHRvIGNoZWNrIGZvciBuZXh0IDwgMHgxMDAgcmF0aGVyIHRoYW4gZXhwbGljaXRs
eQ0KPiAwLg0KPiANCj4+ICsgICAgICAgICAgICB7DQo+PiArICAgICAgICAgICAgICAgIHJtLT5w
cml2YXRlID0gKHZvaWQgKikodWludHB0cl90KTA7DQo+PiArICAgICAgICAgICAgICAgIHNwaW5f
dW5sb2NrKCZ2cGNpLT5sb2NrKTsNCj4+ICsgICAgICAgICAgICAgICAgcmV0dXJuOw0KPj4gKyAg
ICAgICAgICAgIH0NCj4+ICsgICAgICAgICAgICBlbHNlIGlmICggb2Zmc2V0ID09IDB4MTAwVSAp
DQo+IA0KPiBUaGVyZSdzIG5vIG5lZWQgZm9yIHRoZSBlbHNlIGJyYW5jaCwgYXMgdGhlIHByZXZp
b3VzIGlmIGhhcyBhIHJldHVybi4NCj4gDQo+PiArICAgICAgICAgICAgew0KPj4gKyAgICAgICAg
ICAgICAgICBwcmUgPSBybTsNCj4+ICsgICAgICAgICAgICAgICAgcm0gPSBsaXN0X2VudHJ5KHJt
LT5ub2RlLm5leHQsIHN0cnVjdCB2cGNpX3JlZ2lzdGVyLCBub2RlKTsNCj4+ICsgICAgICAgICAg
ICAgICAgcHJlLT5wcml2YXRlID0gcm0tPnByaXZhdGU7DQo+PiArICAgICAgICAgICAgfQ0KPj4g
KyAgICAgICAgICAgIGVsc2UNCj4+ICsgICAgICAgICAgICB7DQo+PiArICAgICAgICAgICAgICAg
IHByZSA9IGxpc3RfZW50cnkocm0tPm5vZGUucHJldiwgc3RydWN0IHZwY2lfcmVnaXN0ZXIsIG5v
ZGUpOw0KPj4gKyAgICAgICAgICAgICAgICBwcmVfaGVhZGVyID0gKHUzMikodWludHB0cl90KXBy
ZS0+cHJpdmF0ZTsNCj4+ICsgICAgICAgICAgICAgICAgcHJlLT5wcml2YXRlID0NCj4+ICsgICAg
ICAgICAgICAgICAgICAgICh2b2lkICopKHVpbnRwdHJfdCkoKHByZV9oZWFkZXIgJiAhUENJX0VY
VF9DQVBfTkVYVF9NQVNLKSB8DQo+IA0KPiBJIHRoaW5rIHlvdSB3YW50IH5QQ0lfRVhUX0NBUF9O
RVhUX01BU0sgcmF0aGVyIHRoYW4gIVBDSV9FWFRfQ0FQX05FWFRfTUFTSz8NCj4gDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChoZWFkZXIgJiBQQ0lfRVhUX0NB
UF9ORVhUX01BU0spKTsNCj4+ICsgICAgICAgICAgICB9DQo+PiArICAgICAgICAgICAgbGlzdF9k
ZWwoJnJtLT5ub2RlKTsNCj4+ICsgICAgICAgICAgICBzcGluX3VubG9jaygmdnBjaS0+bG9jayk7
DQo+PiArICAgICAgICAgICAgeGZyZWUocm0pOw0KPj4gKyAgICAgICAgICAgIHJldHVybjsNCj4g
DQo+IEtpbmQgb2YgdGhlIHNhbWUgY29tcGxhaW50IEkgaGFkIG9uIHRoZSBwcmV2aW91cyBwYXRj
aCwgdGhpcyBzZWVtcyB0bw0KPiBhc3N1bWUgdGhhdCBjYXBhYmlsaXR5IGhhbmRsZXJzIGFyZSBh
bHdheXMgY29uc2VjdXRpdmUgaW4gdGhlIGxpc3Qgb2YNCj4gaGFuZGxlcnMsIHdoaWNoIEkgZG9u
J3QgdGhpbmsgaXQncyB0aGUgY2FzZS4NCj4gDQo+PiArICAgICAgICB9DQo+PiArICAgICAgICBp
ZiAoIGNtcCA8PSAwICkNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgfQ0KPj4gKyAg
ICBzcGluX3VubG9jaygmdnBjaS0+bG9jayk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lk
IHZwY2lfaW5pdF9jYXBhYmlsaXRpZXMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4g
KyAgICBmb3IgKCB1bnNpZ25lZCBpbnQgaSA9IDA7IGkgPCBOVU1fVlBDSV9JTklUOyBpKysgKQ0K
Pj4gKyAgICB7DQo+PiArICAgICAgICBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCAqY2FwYWJpbGl0
eSA9IF9fc3RhcnRfdnBjaV9hcnJheVtpXTsNCj4+ICsgICAgICAgIGNvbnN0IHVuc2lnbmVkIGlu
dCBjYXAgPSBjYXBhYmlsaXR5LT5pZDsNCj4+ICsgICAgICAgIGNvbnN0IGJvb2wgaXNfZXh0ID0g
Y2FwYWJpbGl0eS0+aXNfZXh0Ow0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IHBvczsNCj4+ICsg
ICAgICAgIGludCByYzsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFp
bihwZGV2LT5kb21haW4pICYmIGlzX2V4dCApDQo+PiArICAgICAgICAgICAgY29udGludWU7DQo+
PiArDQo+PiArICAgICAgICBpZiAoIGlzX2V4dCApDQo+PiArICAgICAgICAgICAgcG9zID0gcGNp
X2ZpbmRfZXh0X2NhcGFiaWxpdHkocGRldi0+c2JkZiwgY2FwKTsNCj4+ICsgICAgICAgIGVsc2UN
Cj4+ICsgICAgICAgICAgICBwb3MgPSBwY2lfZmluZF9jYXBfb2Zmc2V0KHBkZXYtPnNiZGYsIGNh
cCk7DQo+PiArDQo+PiArICAgICAgICBpZiAoICFwb3MgKQ0KPj4gKyAgICAgICAgICAgIGNvbnRp
bnVlOw0KPj4gKw0KPj4gKyAgICAgICAgcmMgPSBjYXBhYmlsaXR5LT5pbml0KHBkZXYpOw0KPj4g
Kw0KPj4gKyAgICAgICAgaWYgKCByYyApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAg
cHJpbnRrKFhFTkxPR19XQVJOSU5HICIlcGQgJXBwOiAlcyBjYXAgJXUgaW5pdCBmYWlsIHJjPSVk
LCBtYXNrIGl0XG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21haW4sICZwZGV2
LT5zYmRmLA0KPj4gKyAgICAgICAgICAgICAgICAgICBpc19leHQgPyAiZXh0ZW5kZWQiIDogImxl
Z2FjeSIsIGNhcCwgcmMpOw0KPj4gKyAgICAgICAgICAgIGlmICggaXNfZXh0ICkNCj4+ICsgICAg
ICAgICAgICAgICAgdnBjaV9leHRfY2FwYWJpbGl0eV9tYXNrKHBkZXYsIGNhcCk7DQo+PiArICAg
ICAgICAgICAgZWxzZQ0KPj4gKyAgICAgICAgICAgICAgICB2cGNpX2NhcGFiaWxpdHlfbWFzayhw
ZGV2LCBjYXApOw0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICB9DQo+PiArfQ0KPj4gKw0KPj4gIHZv
aWQgdnBjaV9kZWFzc2lnbl9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgew0KPj4g
ICAgICB1bnNpZ25lZCBpbnQgaTsNCj4+IEBAIC0xMjgsNyArMjcxLDYgQEAgdm9pZCB2cGNpX2Rl
YXNzaWduX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICANCj4+ICBpbnQgdnBjaV9h
c3NpZ25fZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gIHsNCj4+IC0gICAgdW5zaWdu
ZWQgaW50IGk7DQo+PiAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKnJvX21hcDsNCj4+ICAgICAg
aW50IHJjID0gMDsNCj4+ICANCj4+IEBAIC0xNTksMTIgKzMwMSwxMSBAQCBpbnQgdnBjaV9hc3Np
Z25fZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICAgICAgZ290byBvdXQ7DQo+
PiAgI2VuZGlmDQo+PiAgDQo+PiAtICAgIGZvciAoIGkgPSAwOyBpIDwgTlVNX1ZQQ0lfSU5JVDsg
aSsrICkNCj4+IC0gICAgew0KPj4gLSAgICAgICAgcmMgPSBfX3N0YXJ0X3ZwY2lfYXJyYXlbaV0o
cGRldik7DQo+PiAtICAgICAgICBpZiAoIHJjICkNCj4+IC0gICAgICAgICAgICBicmVhazsNCj4+
IC0gICAgfQ0KPj4gKyAgICByYyA9IHZwY2lfaW5pdF9oZWFkZXIocGRldik7DQo+PiArICAgIGlm
ICggcmMgKQ0KPj4gKyAgICAgICAgZ290byBvdXQ7DQo+IA0KPiBJZiB5b3UgdXNlIHRoZSBvdXQg
bGFiZWwgaGVyZSB5b3UgY2FuIHJlbW92ZSB0aGUgX19tYXliZV91bnVzZWQNCj4gYXR0cmlidXRl
IGZyb20gaXQuDQo+IA0KPj4gKw0KPj4gKyAgICB2cGNpX2luaXRfY2FwYWJpbGl0aWVzKHBkZXYp
Ow0KPj4gIA0KPj4gICBvdXQ6IF9fbWF5YmVfdW51c2VkOw0KPj4gICAgICBpZiAoIHJjICkNCj4+
IEBAIC0xNzQsMjIgKzMxNSw2IEBAIGludCB2cGNpX2Fzc2lnbl9kZXZpY2Uoc3RydWN0IHBjaV9k
ZXYgKnBkZXYpDQo+PiAgfQ0KPj4gICNlbmRpZiAvKiBfX1hFTl9fICovDQo+PiAgDQo+PiAtc3Rh
dGljIGludCB2cGNpX3JlZ2lzdGVyX2NtcChjb25zdCBzdHJ1Y3QgdnBjaV9yZWdpc3RlciAqcjEs
DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdnBjaV9yZWdp
c3RlciAqcjIpDQo+PiAtew0KPj4gLSAgICAvKiBSZXR1cm4gMCBpZiByZWdpc3RlcnMgb3Zlcmxh
cC4gKi8NCj4+IC0gICAgaWYgKCByMS0+b2Zmc2V0IDwgcjItPm9mZnNldCArIHIyLT5zaXplICYm
DQo+PiAtICAgICAgICAgcjItPm9mZnNldCA8IHIxLT5vZmZzZXQgKyByMS0+c2l6ZSApDQo+PiAt
ICAgICAgICByZXR1cm4gMDsNCj4+IC0gICAgaWYgKCByMS0+b2Zmc2V0IDwgcjItPm9mZnNldCAp
DQo+PiAtICAgICAgICByZXR1cm4gLTE7DQo+PiAtICAgIGlmICggcjEtPm9mZnNldCA+IHIyLT5v
ZmZzZXQgKQ0KPj4gLSAgICAgICAgcmV0dXJuIDE7DQo+PiAtDQo+PiAtICAgIEFTU0VSVF9VTlJF
QUNIQUJMRSgpOw0KPj4gLSAgICByZXR1cm4gMDsNCj4+IC19DQo+PiAtDQo+PiAgLyogRHVtbXkg
aG9va3MsIHdyaXRlcyBhcmUgaWdub3JlZCwgcmVhZHMgcmV0dXJuIDEncyAqLw0KPj4gIHN0YXRp
YyB1aW50MzJfdCBjZl9jaGVjayB2cGNpX2lnbm9yZWRfcmVhZCgNCj4+ICAgICAgY29uc3Qgc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsIHZvaWQgKmRhdGEpDQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3BjaV9yZWdzLmggYi94ZW4vaW5jbHVkZS94ZW4vcGNp
X3JlZ3MuaA0KPj4gaW5kZXggMjdiNGY0NGVlZGYzLi41ZmU2NjUzZmRlZDQgMTAwNjQ0DQo+PiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpX3JlZ3MuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L3BjaV9yZWdzLmgNCj4+IEBAIC00NDksNiArNDQ5LDcgQEANCj4+ICAjZGVmaW5lIFBDSV9FWFRf
Q0FQX0lEKGhlYWRlcikJCSgoaGVhZGVyKSAmIDB4MDAwMGZmZmYpDQo+PiAgI2RlZmluZSBQQ0lf
RVhUX0NBUF9WRVIoaGVhZGVyKQkJKCgoaGVhZGVyKSA+PiAxNikgJiAweGYpDQo+PiAgI2RlZmlu
ZSBQQ0lfRVhUX0NBUF9ORVhUKGhlYWRlcikJKCgoaGVhZGVyKSA+PiAyMCkgJiAweGZmYykNCj4+
ICsjZGVmaW5lIFBDSV9FWFRfQ0FQX05FWFRfTUFTSwkJMHhGRkMwMDAwMFUNCj4+ICANCj4+ICAj
ZGVmaW5lIFBDSV9FWFRfQ0FQX0lEX0VSUgkxDQo+PiAgI2RlZmluZSBQQ0lfRVhUX0NBUF9JRF9W
QwkyDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3ZwY2kuaCBiL3hlbi9pbmNsdWRl
L3hlbi92cGNpLmgNCj4+IGluZGV4IDgwNzQwMWIyZWFhMi4uNTAxNmRlZDY0ZDg5IDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L3ZwY2kuaA0KPj4gQEAgLTEzLDExICsxMywxMSBAQCB0eXBlZGVmIHVpbnQzMl90IHZwY2lfcmVh
ZF90KGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4gIHR5
cGVkZWYgdm9pZCB2cGNpX3dyaXRlX3QoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2ln
bmVkIGludCByZWcsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWws
IHZvaWQgKmRhdGEpOw0KPj4gIA0KPj4gLXR5cGVkZWYgaW50IHZwY2lfcmVnaXN0ZXJfaW5pdF90
KHN0cnVjdCBwY2lfZGV2ICpkZXYpOw0KPj4gLQ0KPj4gLSNkZWZpbmUgVlBDSV9QUklPUklUWV9I
SUdIICAgICAgIjEiDQo+PiAtI2RlZmluZSBWUENJX1BSSU9SSVRZX01JRERMRSAgICAiNSINCj4+
IC0jZGVmaW5lIFZQQ0lfUFJJT1JJVFlfTE9XICAgICAgICI5Ig0KPj4gK3R5cGVkZWYgc3RydWN0
IHsNCj4+ICsgICAgdW5zaWduZWQgaW50IGlkOw0KPj4gKyAgICBib29sIGlzX2V4dDsNCj4+ICsg
ICAgaW50ICgqaW5pdCkoc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPj4gK30gdnBjaV9jYXBhYmls
aXR5X3Q7DQo+PiAgDQo+PiAgI2RlZmluZSBWUENJX0VDQU1fQkRGKGFkZHIpICAgICAoKChhZGRy
KSAmIDB4MGZmZmYwMDApID4+IDEyKQ0KPj4gIA0KPj4gQEAgLTI5LDkgKzI5LDE5IEBAIHR5cGVk
ZWYgaW50IHZwY2lfcmVnaXN0ZXJfaW5pdF90KHN0cnVjdCBwY2lfZGV2ICpkZXYpOw0KPj4gICAq
Lw0KPj4gICNkZWZpbmUgVlBDSV9NQVhfVklSVF9ERVYgICAgICAgKFBDSV9TTE9UKH4wKSArIDEp
DQo+PiAgDQo+PiAtI2RlZmluZSBSRUdJU1RFUl9WUENJX0lOSVQoeCwgcCkgICAgICAgICAgICAg
ICAgXA0KPj4gLSAgc3RhdGljIHZwY2lfcmVnaXN0ZXJfaW5pdF90ICpjb25zdCB4IyNfZW50cnkg
IFwNCj4+IC0gICAgICAgICAgICAgICBfX3VzZWRfc2VjdGlvbigiLmRhdGEudnBjaS4iIHApID0g
KHgpDQo+PiArI2RlZmluZSBSRUdJU1RFUl9WUENJX0NBUChjYXAsIHgsIGV4dCkgXA0KPj4gKyAg
c3RhdGljIHZwY2lfY2FwYWJpbGl0eV90IHgjI190ID0geyBcDQo+PiArICAgICAgICAuaWQgPSAo
Y2FwKSwgXA0KPj4gKyAgICAgICAgLmluaXQgPSAoeCksIFwNCj4+ICsgICAgICAgIC5pc19leHQg
PSAoZXh0KSwgXA0KPj4gKyAgfTsgXA0KPj4gKyAgc3RhdGljIHZwY2lfY2FwYWJpbGl0eV90ICpj
b25zdCB4IyNfZW50cnkgIFwNCj4+ICsgICAgICAgICAgICAgICBfX3VzZWRfc2VjdGlvbigiLmRh
dGEudnBjaS4iKSA9ICYoeCMjX3QpDQo+PiArDQo+PiArI2RlZmluZSBSRUdJU1RFUl9WUENJX0xF
R0FDWV9DQVAoY2FwLCB4KSBSRUdJU1RFUl9WUENJX0NBUChjYXAsIHgsIGZhbHNlKQ0KPj4gKyNk
ZWZpbmUgUkVHSVNURVJfVlBDSV9FWFRFTkRfQ0FQKGNhcCwgeCkgUkVHSVNURVJfVlBDSV9DQVAo
Y2FwLCB4LCB0cnVlKQ0KPiANCj4gTml0OiBJIHdvdWxkIHVzZSBFWFRFTkRFRCBoZXJlLCB0aGVy
ZSdzIG5vIG5lZWQgdG8ga2VlcCBib3RoIGRlZmluZXMNCj4gdGhlIHNhbWUgbGVuZ3RoLg0KPiAN
Cj4gVGhhbmtzLCBSb2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

