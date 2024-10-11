Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274AE99A00C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 11:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816863.1230964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBpM-0006L1-IG; Fri, 11 Oct 2024 09:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816863.1230964; Fri, 11 Oct 2024 09:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBpM-0006Iu-FS; Fri, 11 Oct 2024 09:20:52 +0000
Received: by outflank-mailman (input) for mailman id 816863;
 Fri, 11 Oct 2024 09:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UIMz=RH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1szBpK-0006Io-PH
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 09:20:51 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2009::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a164306-87b2-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 11:20:49 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY5PR12MB6369.namprd12.prod.outlook.com (2603:10b6:930:21::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 09:20:45 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 09:20:45 +0000
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
X-Inumbo-ID: 1a164306-87b2-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBUMMITfz+myXGzv4ocXm+EsdbWq8DbWGZa67tpu0iO8mBBRy74Pbq/rjGSY1VJE383MFbOqWr/U+c3XHm8SwkibWXl8rI7ahxc7CQseD6dbJB8xQOThwuf4JonWLH7zYI9XH88L3vuc9YpGvYgQcEWaXvYTrTrQPZyyk1NERSvMDz1nKQiEvlVZMXBwBT38N1v7sDGBFdQ/Mn4WN+X7Ys01+r5HiOHcZwtmuuMkZmfinpHYmcinXVVoaD47zoMF9XhtPbpcaRH2neo4faILSlPWqLYNupj86p06wSNZny2ilsT2h0ySeb442kPK2wW7dP76yTIE5TuDpt1YMBRawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAcogLLWuen7SLzeIXetCTwzevRDWH7EtzOuPvFYjIk=;
 b=jdQUg5JuZnvmC3feJAmTn3JOmiMR3s948r04z+lYq6CIU+1WXxltM7+3RwQCmdqsvq7WuTzJhehcwe1dipSIhx0EHIuepd1I+5aisWEpozQ8fk1BSl8gCSqFwoWKJeWhW0rd3ScLXlYxkwTLAfuL8DGmHff1BM31oDyTXxfnICwVQnNGy5xn83hc23VDUfJe7OSDa/VQ/pSdiXHad8FoYtQfh9YDzmtVn/QvKK3v26OyGzcwS6oOzqNWwodgSK9brHobxfPKpUcPlQKtJ70xalRJ6jPXWrCfaLZUiCiXDjxpk6hr5In0RwQuqjQmVMkv9A8ZJIUtZrkYq+dvawuRjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAcogLLWuen7SLzeIXetCTwzevRDWH7EtzOuPvFYjIk=;
 b=uA/Ym3sXSzWHDt2XiWe7gNOO+CAH6/od5xOBrKHZcW2oRD7+gGh/y6zeM2ZPAfPVzQFr824BVdxYY9GzTNYg41vjk79W905gd2WMbqMXdHnasVLekZKRup5F4lf5bi3WNqBKaq5uh4xn7zZFNrVyYCL9WM5mReXMwbdpB1MTYAI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
Thread-Topic: [PATCH v3] xen: Remove dependency between pciback and privcmd
Thread-Index: AQHbG4+3Lfp3cJlJ4UuqoaLQId+ES7KBP0mAgACK34A=
Date: Fri, 11 Oct 2024 09:20:44 +0000
Message-ID:
 <BL1PR12MB5849EFA99B7F0C55D201738AE7792@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
 <318bd8a4-a349-4e7b-8653-6995d5f9f125@suse.com>
In-Reply-To: <318bd8a4-a349-4e7b-8653-6995d5f9f125@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8048.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY5PR12MB6369:EE_
x-ms-office365-filtering-correlation-id: 2fd14600-e7ac-4077-e95d-08dce9d5fc50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZjFDaFZZRWFqOVN3MzdkdDdWcy9ESldyWjBnVWRRU2UrdmxuelM5ZFBXTS9E?=
 =?utf-8?B?eWpvWHBDaWxnZVp6L3o5dHVJVFZING8zb2d1d1BrRGtoSVVzSjhWN1lBSlA4?=
 =?utf-8?B?c0MxYlBrRVlseHBObk5jRXFZSjJMK09WSlJFMkFmN0VDV3ptUGttZk9HaUxt?=
 =?utf-8?B?L29sOTk3SlNBU2VOT1NXV0IzWkY5L0h4M2dRZi9xY2JrbWd4Qm4rN0kyQU83?=
 =?utf-8?B?cTNrc3pWUTVVTkFxaG5VU2hhYlkvSXBSNHZscDV5WkFxRTI0dTIzTVI5a0Zo?=
 =?utf-8?B?MW42QWZYVmRIeitRKzJ3cm90K1VqalB3UExXMjNLbXZFQ25sa1dvZXg0TDRa?=
 =?utf-8?B?UG9FRUhvWXJEM2UyQmdzdEVrNlF5MmhEMUZuTVRsTWJDeXo0bTRJL3drcXpU?=
 =?utf-8?B?UDc0V0lCTmMyQVNndDFGOTY5dUw3eFgyRGl3SHNqWUZrY0k5ek44MTltZUM4?=
 =?utf-8?B?dld5NjBsRHZTNkdwM25XR0VUd2UweEUrY0RZTCsySEhkYnkyZVR1V2VvdnBW?=
 =?utf-8?B?YUwvckFhck9tWUNkQmZzcTUyQjh0VHRtbEh2aVFVZm5Ja2xGS0ZNQjZSbU1V?=
 =?utf-8?B?Z1hmM2g5a1hUWWZqUGZhT2ZCZHEvYmxQQ3ZHN1RENmczNkZpUXVCYmZ6R3d2?=
 =?utf-8?B?MnRkZEVNUGRMbkRkWmJ2UEZ3c3RxeG5oWERKbFJPZGcrUFBmQTdpL0VKcVNv?=
 =?utf-8?B?aW9EeUxpSy8xS3A4VDVxZFBxNytnV3NzK0tJNDVlYUUwT1lKZ2xCNDB1TXF3?=
 =?utf-8?B?My9NakFzeFFCWXFrbVhoamJJYTBWN2tMbWdsQ3U5MDZQWGNDMUJXSUc2Zjdy?=
 =?utf-8?B?SmF2d1lFNEt3ZmFGRjB3VS96bDZoYUtZYzFWOUpBUzgzUUlMMWVaTWtSMGJl?=
 =?utf-8?B?T2N6Y1dSMVJhbklqSzRra3VsNnBsSHVYT3g3ME1la2cyTGgybDUxRHhUN3Ja?=
 =?utf-8?B?RmVKYVR4V2VaQkMvRzVoYkI1d2FrWGlSRGlTUTBpZGZITTFFRndKTXFJR1E4?=
 =?utf-8?B?UXAxK1BWYmFOWG56ZzZmMVBYUVFQdXJTd3BVR3J1UThicFhKSVVFZGJ4SitU?=
 =?utf-8?B?TzVGQWRBQml5UWpvNjNpRUNmbDZjYWVwM1pnZnNTcElQOTdaWEZVR0xlbDBh?=
 =?utf-8?B?dGFnREx4N08vVmlhUG11Nm8ra3ExME83NndvTGhVY1lLaTREaEx1a09sMHhX?=
 =?utf-8?B?UU9MdXFCbEtvekVtY29zbXlHU1B2L1ZIZkR1M0NLaDI0UVJkTExOUUtYZFRl?=
 =?utf-8?B?TGF1RlV5V3hsazRlaVRHUk0ybzhwVXAvaGQwVjF0eEJPZlFCdXpyQnJ1YXZ3?=
 =?utf-8?B?WUw1YXpzeitrZHlnVDY1czFPcTVseEhOb2FlYkRwdUdwYU1vZ0xFdVZCSm9S?=
 =?utf-8?B?RzdkS3I0aHlydlFSeXJEUUxOdjlTSW5lZlI5c2ZVSE9CV1dDUUc5aWVYcWRv?=
 =?utf-8?B?a2NTSEpDb2ZuN2JXdkZjSVp6bEJXdk9YSUFWTS9zaURZMHllb0QyblErYnlj?=
 =?utf-8?B?NEd0cWxjVDNjZ1p2MnY2aUFua0tDajhHRyt6OGRZejh6MDUyUmkySk5YeWRC?=
 =?utf-8?B?d2lyQlBuYjZieGZkQ3FGdWkrcG91MnREVmNIc3dmT0lDSW8zWjRKN245NFZq?=
 =?utf-8?B?aHc4QU5CWElid1dRK01LV1JLR1QvRTV3Uy81VXVjY0tGbWdKMkZ4eE11VjJW?=
 =?utf-8?B?c3E3NDBmbCt2OExIMEVaRE1MR3d0Ynk3RWpKNSt0MmRhSGlpR1ZZcWh6YmVm?=
 =?utf-8?B?NHowVjU5RlR5WW9QUWJCQjZxdTMxVTZBQ2VGTWszU1VoZ0Ird0NCck82Y1pj?=
 =?utf-8?B?cXJrT1RiT01FMlFvS0JQQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFFTeHpjVlZxak5qT2JGQ1EzTEx1WWRTemJCdGRNTVRFcDFaMHQrSktKWDFE?=
 =?utf-8?B?OGljZ3RFWUk3WlYrRHFpSjFRY0QvVXNqOFdpbno0V3A4OTdWZ3RHY3R4TDVE?=
 =?utf-8?B?SUNkK1NmQjhOZ1JpY2JwYitnWEgyWnRHV3hDTE5ScVYxamphRHAxZTdlZlR3?=
 =?utf-8?B?RldjKzZPaVJJL1BaQWlKVjYxK2hudEIrd1BLaTVKSGp1blphRktPUEJrSk9B?=
 =?utf-8?B?Mm1iUFpBZnAzOUozNWRjYXJOZm9zZjVJaXlHN01wRUFmaGtMSDlaSmh1S3pj?=
 =?utf-8?B?QjZxRXAxak56NXNjQVVpL21FNUdDd1hmRzBpRDhYdmVRN3FIQkpDalRNU0I5?=
 =?utf-8?B?b3o1elpWUzdGTXI4ZUIvaXBRM3VrZHVVdXZXKzlCZEMyZ0VxWm05OWtOUG5a?=
 =?utf-8?B?c0FNeTl3REg3Z1ZpcWVUU1hiSnhYL2dxdlF3RHdZV2RsMTRacXhBd2k0OHZF?=
 =?utf-8?B?MEdlRmtxVk1WMVR6REd3Zml6UkRkV2thTHpodGRsUG02cHcwZFRtb3RURVBF?=
 =?utf-8?B?andreGFJRjN5TTlIZlRRVTlwSmZ2cjBmK3lCU1ZBT0tzenNZd3BxaTNISUdE?=
 =?utf-8?B?dWRITVptbVVpSnlOZ0RoWW1aa2l5SzdReFRRR2hxQmNLUk9DR01VcEpwalB2?=
 =?utf-8?B?UTA0ZkpPZ2ZpNnFSaldhU0hOSi8yTTFoNCs0UU53RWFCdEJlUHA1UlBWWE43?=
 =?utf-8?B?Q0V1ZnJDTXNhOXhsSHFSS3FyZ2xTN2tiZlZzekRhckRZNW9ZY2xhb0lINkUw?=
 =?utf-8?B?MTluRkNoZ0pjRmxPc2FscG0xWDM5eWYxbFdnNG9NKzEzQlFSNG9sWmducEdO?=
 =?utf-8?B?Y2ZqdTJGNjBtSUpSMjU5RG05RlBXV29ya2FHTWNqN3FoWWpqWEhxMWlhZSsw?=
 =?utf-8?B?SDVtZlhlRWJtU2tkQm0za2R1WnRycmwwbmpTallLTFIrMlRrdjBBSWVtL05k?=
 =?utf-8?B?U0RZL0V5eWh6UEVPZERFd2Q0aEJIOCtoNXJmWGdjRVkwUkxmZFN2a09iVG9T?=
 =?utf-8?B?R2RKeWdOdEtSUHQwbk5MVzZYNFJabDlITy9rVWV2VGpvUEI0WURNM1l0WmFP?=
 =?utf-8?B?R1pWeTlmaEp6aUFCZ0gxS0huZ1NsRjJiOXh1NDNHc3lJekQwSGh1QTBqVFlW?=
 =?utf-8?B?Rm5DYTViVTc5ZEpUQlQwc1MvYUliTlIrSVoxbGdpVlI5ekQ0OEFKdUVnbXlh?=
 =?utf-8?B?QnpKRTZDMFZZMEZ2R0hKOEZQT3FMNGhMY3ZxbXZUZFN5ZGJHaTJaOEhINlF6?=
 =?utf-8?B?YnlkUDZnWGFPcHRXSUlpOVJzQTVNVzFYSVBYWTdnQjR0MCt4NjJqUFNJTjlX?=
 =?utf-8?B?enk2ektoL1JKVXVTTFRTVzJmV0NTWURZbGFUU3NRUWZwbGZDUXV3U3p0bWl4?=
 =?utf-8?B?SGI2RGZ0V3p3QjFuQ1gzTUw2aHVWbHZ6NjM3RU1NQ3l1ZVR1K3VrczNrL0tZ?=
 =?utf-8?B?R0haUDB4R0VBeXZwdkpIUHFFRGlTcFQ1ZFoyS21IOVRpaWFUNHR0b3ZMaUNZ?=
 =?utf-8?B?MURvNnkrNlkvY1BpRFJucnV2dzcrZUZBMHJlUzRJZ1h5d2hHU3E3YVRBZUtV?=
 =?utf-8?B?T09sK0xhRG5NN0R6RU93RnQzT0xXUG1pRG5sU0pONHhMNTNvSWNZSCsrTnFT?=
 =?utf-8?B?cGFwWi8xajQxVTlsMS9YQzNBQW9kNDNmUzJYT0cxOHNXZURSc3lsN25IR0dk?=
 =?utf-8?B?UU8xejdPV2hZT0E5ZFh2M3J0U1NLT0o2anN6U055NkVSQ1pjQWFmY1BMVEpW?=
 =?utf-8?B?RlR0MUREcXkrMk1GSk0zaGJiWmQ4SDAvK0RiN3hESjFHV1MyQkhMOTFoRnZk?=
 =?utf-8?B?RE82Q1hMa05GVEJRdHRQR3JSc1hOcER3SkFZYWZCam1qbllHUGxIQnNmQUZH?=
 =?utf-8?B?VG91NjE1MmlSZndHWk1HL1NYMkVtQnlEZmx1OFVSZW9nQlZDNUhtcHhhL1NN?=
 =?utf-8?B?Q0lBQlY5UXlVbHdacXVhV2V3RXZzVWl1SDIxOEF3aUYwekJkbDN4U0J3cmRm?=
 =?utf-8?B?NUhpZ3ZtRWhWcjd2aGRPb0hOakNmZjVHOE8yS2ZHQWpjbkp4ZEdoWEpzNFpO?=
 =?utf-8?B?cGJsSGNrcmhYV1BXS0hIb1VwT2xOcFcyaXcxa094b2Q5Vy9uRFdrMDg1OVNl?=
 =?utf-8?Q?iAHs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98956CD51BC42D4391E712040B050B98@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd14600-e7ac-4077-e95d-08dce9d5fc50
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 09:20:45.0062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3r4K6IRR593yG45EW0jF5qBt4Uf2E9qXup9Ks/+Zs5tlcz2UsaqsPlV4mF9ZRG4YWiL1AxYM4gOrsXSotqyMWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6369

T24gMjAyNC8xMC8xMSAxNjo1NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDExLjEwLjIwMjQg
MDU6NDIsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gQEAgLTE3NTcsMTEgKzE3NTYsMTkgQEAgc3Rh
dGljIGludCBfX2luaXQgeGVuX3BjaWJrX2luaXQodm9pZCkNCj4+ICAJCWJ1c19yZWdpc3Rlcl9u
b3RpZmllcigmcGNpX2J1c190eXBlLCAmcGNpX3N0dWJfbmIpOw0KPj4gICNlbmRpZg0KPj4gIA0K
Pj4gKyNpZmRlZiBDT05GSUdfWEVOX0FDUEkNCj4+ICsJeGVuX2FjcGlfcmVnaXN0ZXJfZ2V0X2dz
aV9mdW5jKHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYpOw0KPj4gKyNlbmRpZg0KPj4gKw0KPj4g
IAlyZXR1cm4gZXJyOw0KPj4gIH0NCj4+ICANCj4+ICBzdGF0aWMgdm9pZCBfX2V4aXQgeGVuX3Bj
aWJrX2NsZWFudXAodm9pZCkNCj4+ICB7DQo+PiArI2lmZGVmIENPTkZJR19YRU5fQUNQSQ0KPj4g
Kwl4ZW5fYWNwaV9yZWdpc3Rlcl9nZXRfZ3NpX2Z1bmMoTlVMTCk7DQo+PiArI2VuZGlmDQo+IA0K
PiBKdXN0IHdvbmRlcmluZyAtIGluc3RlYWQgb2YgdGhlc2UgdHdvICNpZmRlZi1zLCAuLi4NCj4g
DQo+PiAtLS0gYS9pbmNsdWRlL3hlbi9hY3BpLmgNCj4+ICsrKyBiL2luY2x1ZGUveGVuL2FjcGku
aA0KPj4gQEAgLTkxLDEzICs5MSw5IEBAIHN0YXRpYyBpbmxpbmUgaW50IHhlbl9hY3BpX2dldF9n
c2lfaW5mbyhzdHJ1Y3QgcGNpX2RldiAqZGV2LA0KPj4gIH0NCj4+ICAjZW5kaWYNCj4+ICANCj4+
IC0jaWZkZWYgQ09ORklHX1hFTl9QQ0lfU1RVQg0KPj4gLWludCBwY2lzdHViX2dldF9nc2lfZnJv
bV9zYmRmKHVuc2lnbmVkIGludCBzYmRmKTsNCj4+IC0jZWxzZQ0KPj4gLXN0YXRpYyBpbmxpbmUg
aW50IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYodW5zaWduZWQgaW50IHNiZGYpDQo+PiAtew0K
Pj4gLQlyZXR1cm4gLTE7DQo+PiAtfQ0KPj4gLSNlbmRpZg0KPj4gK3R5cGVkZWYgaW50ICgqZ2V0
X2dzaV9mcm9tX3NiZGZfdCkodTMyIHNiZGYpOw0KPj4gKw0KPj4gK3ZvaWQgeGVuX2FjcGlfcmVn
aXN0ZXJfZ2V0X2dzaV9mdW5jKGdldF9nc2lfZnJvbV9zYmRmX3QgZnVuYyk7DQo+PiAraW50IHhl
bl9hY3BpX2dldF9nc2lfZnJvbV9zYmRmKHUzMiBzYmRmKTsNCj4gDQo+IC4uLiB3b3VsZG4ndCBh
IHN0YXRpYyBpbmxpbmUgc3R1YiAoZm9yIHRoZSAhWEVOX0FDUEkgY2FzZSkgYWlkIG92ZXJhbGwg
cmVhZGFiaWxpdHk/DQpJJ20gbm90IHN1cmUgaWYgb3RoZXIgZmlsZXMgZG8gdGhpcy4gQnV0IGZv
ciBtZSwgaXQgZmVlbHMgYSBsaXR0bGUgc3RyYW5nZSB0byB1c2UgIiNpZmRlZiBDT05GSUdfWEVO
X0FDUEkgI2Vsc2UiIGluIGFwY2kuaCwgbGlrZSBzZWxmLWNvbnRhaW5tZW50Lg0KQW5kICIjaW5j
bHVkZSBhcGNpLmgiIGluIHBpY19zdHViLmMgaXMgYWxzbyB3cmFwZWQgd2l0aCBDT05GSUdfWEVO
X0FDUEkuDQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

