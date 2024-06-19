Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAC590E201
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 05:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743385.1150272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJmB0-0006XM-C6; Wed, 19 Jun 2024 03:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743385.1150272; Wed, 19 Jun 2024 03:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJmB0-0006U6-92; Wed, 19 Jun 2024 03:40:02 +0000
Received: by outflank-mailman (input) for mailman id 743385;
 Wed, 19 Jun 2024 03:40:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WeeD=NV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJmAy-0006N9-Tz
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 03:40:01 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99b727c2-2ded-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 05:39:59 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL3PR12MB6641.namprd12.prod.outlook.com (2603:10b6:208:38d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 03:39:55 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 03:39:55 +0000
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
X-Inumbo-ID: 99b727c2-2ded-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PH/4BNwtSh53qtQTA+noW2eYfSU8tMTFPzVy3u2fyHqOJHhC9uZ0T8II3ZTrDGginvILFWHUopaEvqy27z7MxfP7dKyXSqxpfXF8TnhE7sZNtiI4gVyA00Uc7ZIIybIE4tHyBqUCyJZtjwdcX1NpU+2JGG13lppw3HjvlPDyzIVEjMrZnrdU7rogW7JV8uEwpnv2EIB0QIHRxJ9sTdoqMKv2GIOUsMPowAYKWuTaLqPF2BAA3HlnWb3oL1aDmq9MQmt7X4Wk/ZeMehuiykrWJWH56P1+nn20sL3TFaEZs8TqjEH2QWp7eJl2xNZGrjQ6tRRHxJdmEbNc53jghgzu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHwP6RvVoC1Qe2a9MsmnLxvwXeRhc2OA9H5xZ9TTw9c=;
 b=LiNMiaXfbERub4aXsDsCtwaygadXK3x6rxw8ha39LetnBmvKNKsEHezE4Pre5Ys+BjWN4/bSDQfrATzhAf2g6N/C9ZWYjK7/6EL7IHwoHcOSXqov/JHWY7m2xuWCem5kY/z+aWETo5GDSIh4VneRtmo5pSz6NAPTIvHRuU4elzbIpC3obeTPjwNt2bKQnQfBvbT2UY+3fU8KVQT7bhcmtBK1H2FN2UEM+IRFXa1Zks9dtozAbuBqlA+NuJ7vbYwRgY9zlO2XzWVeyLIYErdL1LcerDnAc4cdUuN5k7LS7/qTnxZBHXxnK2e2ETjCx07LIHQMWCC1CFSxgX3YoyZrww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHwP6RvVoC1Qe2a9MsmnLxvwXeRhc2OA9H5xZ9TTw9c=;
 b=MfwP18PyOD4peqWTp5LKXy3m2ipVkVWe7GNibD/QMz8efeGDEcz0JANo8RljWICt//iD5h1m5G9INVuDaxKX+YYUa9eK74i9RHVGUb0BP2xKk5rxPRu0Lt4XNwGQ6zk8T01Y2sDEaxnqI7Zc3Z4uFd8UHVOjjGMsMNy+uZ0JcWg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v10 1/5] xen/vpci: Clear all vpci status of device
Thread-Topic: [XEN PATCH v10 1/5] xen/vpci: Clear all vpci status of device
Thread-Index: AQHawJTga4AgQ2zhd0+hWXdwZesfOrHMAOYAgAGQCAD//6IuAIABxSoA
Date: Wed, 19 Jun 2024 03:39:55 +0000
Message-ID:
 <BL1PR12MB5849E84E58725FB947CCECD8E7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-2-Jiqian.Chen@amd.com>
 <4e2accc2-e81d-450a-af2d-38884455de9c@suse.com>
 <BL1PR12MB58499527CFA36446EAD3FCE0E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f8381d8b-0ad2-4766-8a53-d1ee44ea7e05@suse.com>
In-Reply-To: <f8381d8b-0ad2-4766-8a53-d1ee44ea7e05@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7677.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL3PR12MB6641:EE_
x-ms-office365-filtering-correlation-id: 2cf8d7da-9826-4778-408d-08dc90117c3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|7416011|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?VmNrOURVSDZxakxaTFV5ZTE4c0h2cjVIU0hjSVRYalVwY1NiNkl0aHRxdXdT?=
 =?utf-8?B?YXNuLzJ4OU5JelBqVm9WOHpyTWZFM2UyQjdWbXJnWWdRWXFZTGhhRUJZeU84?=
 =?utf-8?B?MFY3V2xmTjM5bzZSS0YwTmlvUU9HSFpXTG4yZGs4ZmdBRmZhd1V2cjBQOGtj?=
 =?utf-8?B?WDQ0Y0xuNnduNXdaZFplQjhLNzBWVU9ESGFndWRhNmwyT3hRQnlaUnh4WFhX?=
 =?utf-8?B?eVhnWW1vaERFbFpDNFhBYmh1ZnljWEswbkl0dEU1VFNEeU4rNWx0cUZwMWxD?=
 =?utf-8?B?ZDNNOEw0Z1JiQnNQaHVKcGZUV04xK2srLzFSY204ZXU3SC9SUGhtaW0zR3RG?=
 =?utf-8?B?S2ZUMjMyYTR1UWxjWEtqd0tKZVZsU29aRmRHdFRPRUNFcms2VVF0TXJtcFJL?=
 =?utf-8?B?YWo0cXMyOWxqV3NSOER6WjJsVWlGZ2Qxdk1iWHRBOWN0STRMblN2T0l6eHhn?=
 =?utf-8?B?OE44aHA1WVdCd3ZZWnZYSHFvUUdVeGlWYWx3Z2w1SzNHRTdqSnByV1BEeExv?=
 =?utf-8?B?RURRWTJWMUZic25VS1V5LytBRlkvMVN1WWhmOHBwUm5YZ21sSHdpNzQwVkhR?=
 =?utf-8?B?UnVZWFNHdWZ1bDVwZC9ra1pkRTJHWk9FUVl1bnNUWjk4UDcrTlJQcmdaRkth?=
 =?utf-8?B?bm9qU2U0UjVVampsVW9WVGx2amJzV1JYckwxUGN2b1hOUmI3QjdSZS9BUlF3?=
 =?utf-8?B?U2dGcVJMZ1gvZmczSTNzR0VjWUVZM0Q5d1ZpYTZIdFZSUHFCeUhoOTdEQ080?=
 =?utf-8?B?VGxPNjBUS2Y5YitneFlOZHhDTVFFTFNHNW03cmdyVjdrT2ZFYnNMdUtITGdH?=
 =?utf-8?B?cXlGa1FFcFZaOVVPYzJUQWJGSExZN0pvTUdOQXRWSHBpbUxLUi9RdGUrc3lO?=
 =?utf-8?B?MDFDVTB0cHltVlNYbENUQXVhd3V4L09ockpoM1FVaUxVc1dKa1ZnYURSQ0xr?=
 =?utf-8?B?bGpURmU2VHhTMlpDWkkza1B5akpzTGdDdVZhSnJBYVF3K2ZQdkdodmY3ZS81?=
 =?utf-8?B?TG1ydmQ3VG1CcnpyNTBPZmdVVHlhYTRrNGtNQmZpVzFsQ1I5a2ZiZ0pjempF?=
 =?utf-8?B?aURDZzRPQVBFSjV5d0NiT00rZE96ZUIzUlp4UVJWT1U1MFhBS0ozSUxpS3dt?=
 =?utf-8?B?WDAvR2xIaDYzVjM3VVRDR1I1dUkyYjRrSkdTOVZid0RRMElLWG5pS3pLUHZt?=
 =?utf-8?B?SzlFUmNmM2xRWjdXNmVWTkZZODA5QUV3RjhXTkJMams1U0cvRUlqNXNXSTdo?=
 =?utf-8?B?SWJuaWMwQjFkOTJ4SVk3NzdHVHVOQ3V6R0ZpWkdtUUVmRkk1U0d3NDd1ZWZU?=
 =?utf-8?B?Z0twVlVIVlNrUWhkL2hzc1NkTzQvMkMzNGxza2lIU2Nzd2p6UVdHUG5pRm5t?=
 =?utf-8?B?dnVBc0pya0h2V21ZTHl0bmhGdDNaTnVnWFhpaDlQSjBZOFFsaDFnbjFBNHdJ?=
 =?utf-8?B?Sm5EVkt0VFVuQzg2b0dzWnd4QlFhODBoK1ByWmZUMGhTeUNqZDhuSmd1Zmw1?=
 =?utf-8?B?QXZMb2ZwYm9hK3pWUkF1T042TkFpUlJtQmZGSUU5b0hoNDhQVUtyY2c1anV5?=
 =?utf-8?B?TDAydlI1WDQ5L0NBWm5mUnJTV3RJNUxCOGFqQ1J1dG5SRXNZd3FxRStNcnAx?=
 =?utf-8?B?cXhWMlA3ZERUd1VWQ09xd2hvNkV3ZDF5Q0tXOUcreFBIK3lSTXkvN0Nic0RE?=
 =?utf-8?B?NWQzd0RZOTBnK0tKbUZuRGpOQjdEV2NXV0RwZmxXclo3VGM0WG1zYlJUQmJJ?=
 =?utf-8?B?NG5UMDhFcUw0NDNFbnBZaGkxT05raXdRYnR2NWdaVldRSkR2TUUrVjZJZVkx?=
 =?utf-8?Q?UoyLrJqii8utM5y955svnWjU0VXBrMUUskyFQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEF5K3Y2R09DS2RhODVoVjFQRWlJa2htME5LVUxBajVGSjYxN2xtcSt1T0xp?=
 =?utf-8?B?bE5JUDZGYmdZTkhhVkUrcEltd2liMjJRM3BScjhUWCtDcVE5YkVWZUVGZ3hx?=
 =?utf-8?B?QkZsVnlURXFHSmVuRUlrN3NOaEtRU1VFTEtUYWVjYy9EbzFPUzluVE9YeEho?=
 =?utf-8?B?Z0FTVmREV0NFRU8vc2Qwa05hbnpjMTMvT0hGaEI5STdyRlJUOVJrV1JRWCs3?=
 =?utf-8?B?U3BPbXBXSXRjb3pxb0JmbnIyYWt1NWowMkJ4cXd5M2k1RDM5dU1mdHg4TTg1?=
 =?utf-8?B?L2QrUFJSZDE2YTdxUUdxUmRWamxEalp1ejZCdGs3UjdOQXZKUFIrYU1jN1lD?=
 =?utf-8?B?c2Y2MlAwWGtlT3lNUG16NkZvVTVIdmpHWWxsUzkrTzhPUSs0M2VuTFJ6U1I0?=
 =?utf-8?B?YWVZbjdFbDNJMHFhZEhvQUdKZHpwaXppS05YdkE2cE5BRk9uLzQ5MHNJSHNo?=
 =?utf-8?B?U25DdXpEZk1QSmlFcXQ4N3lIZTlFS050YzVmMVR6dnMrUnRhTTNXKzZ4TEFW?=
 =?utf-8?B?QXVJb0RDaGt5NWRwaGVKd0dNdTBFeHE5ZlhYNFRuWkhKOWMyeUd0QnRwOFBa?=
 =?utf-8?B?bzRJQXYrZk0xMDhXTVVzSjltV2xNemowTk10MjJBaW4zRC9SeVVtTktadjJw?=
 =?utf-8?B?WURpN2FtZER3NWJJL2tVRDgwNTFLMEFiMG4rVnJ2UHBWOG5uTGZOZlB5OWtT?=
 =?utf-8?B?NnVRbkJuV2dyYU1KT21TMUd5TzRrQktPNDdJZkhMS09CajJQcDhtVXRWQmp3?=
 =?utf-8?B?ZVU3Y0QrUEIzYW5CTXhaWFJJOGV4SkVGMGZhSy83THIxWlprZlMxV2NqSDdY?=
 =?utf-8?B?bWlLS2VVeTkraEJHVkxhL1NiSGR6dFRCMGc1THNZTEZxMFhFK3RMcHZmMTR0?=
 =?utf-8?B?emlFZ0d0MGpMQ3ErS2Z3eFhJWFZVMDlKTXo4UGQrdys0K1JtVEJxTnZIckVO?=
 =?utf-8?B?b3J2dXBpZkV3NDNpZCs3Um11MlhVbGlWS3Zvb3pjL3FQMWJiMVBLSUVRcStR?=
 =?utf-8?B?dHNFKzM3RUFsaFJhU2x2dHBpUHQzWXcvZTBxTE5FSnlGaGR2aUh0ODB3QytR?=
 =?utf-8?B?VllnOUJqS2c2RU5PYWprei9WT3Z1UEVBcUx1REY0bjF6UEsvb0NhMzk1S3dU?=
 =?utf-8?B?MUlQSXVOdGFPN0txVGtlNUptUGtnc1o2WldybmZBVE82Sm9KMU13aXNERXdU?=
 =?utf-8?B?MjBwSGVva1BGR0xMQlBXdFRSSE12Nlljc0VPR2NUTGFsQkV5dk9wQjExNWtp?=
 =?utf-8?B?VkNkaVRtOWw1b3RSbFBIWEpMSGZsc0V2RzRpQUQ0aWtJUFFEaTRVS2lYeGtW?=
 =?utf-8?B?MUV0cVJhaU1QOGZLeERJWHZEb3NtZWJuRzJIUWlYZTJ0Qk85ckFCQWszUlhC?=
 =?utf-8?B?c1lDdktXaXNVTHZrRnFoRGNTWGZicG1wV3RUMkFFbFRqWXN1RmdzYUVxalBx?=
 =?utf-8?B?Ui9yWS9qaDZSZ1FhaTUveURZQ3FYNE1WZytwK05wN0FyZ0ltcThCMFpTSGFi?=
 =?utf-8?B?TTBjZVFkZEplSVdjMGxCcFNySjUyOUdzYkNpWm05VEkxV0pFdHpCeGV2dExT?=
 =?utf-8?B?T3UvbDFrcE9oRUwyWWdyVzdhUGkwS0lHeE05QVlhNGFCS0JzOXRPaXk2RmJj?=
 =?utf-8?B?dW5MYjNvbVh4a3FLNkxia1JFZTBnRnJqTlM2bDBFVEZMNGV0Q2VPek1jQkVh?=
 =?utf-8?B?ZU1Rb09KQTdOVGh5QkJ2b2FaZnpnZFhsR2RiNS9GMUp5K000V0ZqS1BFSTh5?=
 =?utf-8?B?d1RwUUFTRzdrUGFtbkYrL0lOcjNYYURWZlVLZkhJU1FwU0dXc3p0UlF2MytW?=
 =?utf-8?B?ZnJqNTFqQUZKQWpsTjBrYVFWZFRQT1JRWG5IWGJjNWhmdzhTaXJ6bkx3UDRF?=
 =?utf-8?B?a05SMEtLQTh1Sk1sd2k2bHRhS0lOcFpuU0d4S01iU3Q0SXIvQUdQcklQdjdJ?=
 =?utf-8?B?ZWMwUEJ4NjBoSEpSalc5dUV3cWtJZ05vN1grcE8xanFCUE1BemYrSVc2ekNT?=
 =?utf-8?B?bHJ1aHl3VUVPN0dDR3BxS1VacVRlUXVjL0ZhR1I1emE1Um1BOWhZY1VLd3A0?=
 =?utf-8?B?NXBMdlhZWUxjUkMzeURQeXhnM2xZVk9Zb0l4ZlRwa2lqWjZhK0l4bWRWY203?=
 =?utf-8?Q?xTNU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17B104F7D7CD5D4EAD67D251F96424CD@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf8d7da-9826-4778-408d-08dc90117c3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 03:39:55.2664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rjmfN5GJgBiIvsHsgYILkb1nT0GmjiygD88d6rqKHQPdw9llAQWJnIYowTul2yekU+Qg70wYYxV5SI5YpIerAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6641

T24gMjAyNC82LzE4IDE2OjMzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMDYuMjAyNCAw
ODoyNSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzE3IDIyOjE3LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNy4wNi4yMDI0IDExOjAwLCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGNpL3BoeXNkZXYuYw0KPj4+PiArKysgYi94ZW4vZHJp
dmVycy9wY2kvcGh5c2Rldi5jDQo+Pj4+IEBAIC0yLDExICsyLDE3IEBADQo+Pj4+ICAjaW5jbHVk
ZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPg0KPj4+PiAgI2luY2x1ZGUgPHhlbi9oeXBlcmNhbGwuaD4N
Cj4+Pj4gICNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KPj4+PiArI2luY2x1ZGUgPHhlbi92cGNpLmg+
DQo+Pj4+ICANCj4+Pj4gICNpZm5kZWYgQ09NUEFUDQo+Pj4+ICB0eXBlZGVmIGxvbmcgcmV0X3Q7
DQo+Pj4+ICAjZW5kaWYNCj4+Pj4gIA0KPj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2
aWNlX3N0YXRlX3Jlc2V0X21ldGhvZA0KPj4+PiArICAgICAgICAgICAgICAgICAgICBwY2lfZGV2
aWNlX3N0YXRlX3Jlc2V0X21ldGhvZHNbXSA9IHsNCj4+Pj4gKyAgICBbIERFVklDRV9SRVNFVF9G
TFIgXS5yZXNldF9mbiA9IHZwY2lfcmVzZXRfZGV2aWNlX3N0YXRlLA0KPj4+PiArfTsNCj4+Pg0K
Pj4+IFdoYXQgYWJvdXQgdGhlIG90aGVyIHRocmVlIERFVklDRV9SRVNFVF8qPyBJbiBwYXJ0aWN1
bGFyIC4uLg0KPj4gSSBkb24ndCBrbm93IGhvdyB0byBpbXBsZW1lbnQgdGhlIG90aGVyIHRocmVl
IHR5cGVzIG9mIHJlc2V0Lg0KPj4gVGhpcyBpcyBhIGRlc2lnbiBmb3JtIHNvIHRoYXQgY29ycmVz
cG9uZGluZyBwcm9jZXNzaW5nIGZ1bmN0aW9ucyBjYW4gYmUgYWRkZWQgbGF0ZXIgaWYgbmVjZXNz
YXJ5LiBEbyBJIG5lZWQgdG8gc2V0IHRoZW0gdG8gTlVMTCBwb2ludGVycyBpbiB0aGlzIGFycmF5
Pw0KPiANCj4gTm8uDQo+IA0KPj4gRG9lcyB0aGlzIGZvcm0gY29uZm9ybSB0byB5b3VyIHByZXZp
b3VzIHN1Z2dlc3Rpb24gb2YgdXNpbmcgb25seSBvbmUgaHlwZXJjYWxsIHRvIGhhbmRsZSBhbGwg
dHlwZXMgb2YgcmVzZXRzPw0KPiANCj4gWWVzLCBhdCBsZWFzdCBpbiBwcmluY2lwbGUuIFF1ZXN0
aW9uIGhlcmUgaXM6IFRvIGJlIG9uIHRoZSBzYWZlIHNpZGUsDQo+IHdvdWxkbid0IHdlIGJldHRl
ciByZXNldCBzdGF0ZSBmb3IgYWxsIGZvcm1zIG9mIHJlc2V0LCBsZWF2aW5nIHBvc3NpYmxlDQo+
IHJlbGF4YXRpb24gb2YgdGhhdCBmb3IgbGF0ZXI/IEF0IHdoaWNoIHBvaW50IHRoZSBmdW5jdGlv
biB3b3VsZG4ndCBuZWVkDQo+IGNhbGxpbmcgaW5kaXJlY3RseSwgYW5kIGluc3RlYWQgd291bGQg
YmUgcGFzc2VkIHRoZSByZXNldCB0eXBlIGFzIGFuDQo+IGFyZ3VtZW50Lg0KSWYgSSB1bmRlcnN0
b29kIGNvcnJlY3RseSwgbmV4dCB2ZXJzaW9uIHNob3VsZCBiZT8NClVzZSBtYWNyb3MgdG8gcmVw
cmVzZW50IGRpZmZlcmVudCByZXNldCB0eXBlcy4NCkFkZCBzd2l0Y2ggY2FzZXMgaW4gUEhZU0RF
Vk9QX3BjaV9kZXZpY2Vfc3RhdGVfcmVzZXQgdG8gaGFuZGxlIGRpZmZlcmVudCByZXNldCBmdW5j
dGlvbnMuDQpBZGQgcmVzZXRfdHlwZSBhcyBhIGZ1bmN0aW9uIHBhcmFtZXRlciB0byB2cGNpX3Jl
c2V0X2RldmljZV9zdGF0ZSBmb3IgcG9zc2libGUgZnV0dXJlIHVzZS4NCg0KKyAgICBjYXNlIFBI
WVNERVZPUF9wY2lfZGV2aWNlX3N0YXRlX3Jlc2V0Og0KKyAgICB7DQorICAgICAgICBzdHJ1Y3Qg
cGNpX2RldmljZV9zdGF0ZV9yZXNldCBkZXZfcmVzZXQ7DQorICAgICAgICBzdHJ1Y3QgcGNpX2Rl
diAqcGRldjsNCisgICAgICAgIHBjaV9zYmRmX3Qgc2JkZjsNCisNCisgICAgICAgIGlmICggIWlz
X3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgKQ0KKyAgICAgICAgICAgIHJldHVybiAtRU9QTk9U
U1VQUDsNCisNCisgICAgICAgIHJldCA9IC1FRkFVTFQ7DQorICAgICAgICBpZiAoIGNvcHlfZnJv
bV9ndWVzdCgmZGV2X3Jlc2V0LCBhcmcsIDEpICE9IDAgKQ0KKyAgICAgICAgICAgIGJyZWFrOw0K
Kw0KKyAgICAgICAgc2JkZiA9IFBDSV9TQkRGKGRldl9yZXNldC5kZXYuc2VnLA0KKyAgICAgICAg
ICAgICAgICAgICAgICAgIGRldl9yZXNldC5kZXYuYnVzLA0KKyAgICAgICAgICAgICAgICAgICAg
ICAgIGRldl9yZXNldC5kZXYuZXZmbik7DQorDQorICAgICAgICByZXQgPSB4c21fcmVzb3VyY2Vf
c2V0dXBfcGNpKFhTTV9QUklWLCBzYmRmLnNiZGYpOw0KKyAgICAgICAgaWYgKCByZXQgKQ0KKyAg
ICAgICAgICAgIGJyZWFrOw0KKw0KKyAgICAgICAgcGNpZGV2c19sb2NrKCk7DQorICAgICAgICBw
ZGV2ID0gcGNpX2dldF9wZGV2KE5VTEwsIHNiZGYpOw0KKyAgICAgICAgaWYgKCAhcGRldiApDQor
ICAgICAgICB7DQorICAgICAgICAgICAgcGNpZGV2c191bmxvY2soKTsNCisgICAgICAgICAgICBy
ZXQgPSAtRU5PREVWOw0KKyAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAgfQ0KKw0KKyAgICAg
ICAgd3JpdGVfbG9jaygmcGRldi0+ZG9tYWluLT5wY2lfbG9jayk7DQorICAgICAgICBwY2lkZXZz
X3VubG9jaygpOw0KKyAgICAgICAgLyogSW1wbGVtZW50IEZMUiwgb3RoZXIgcmVzZXQgdHlwZXMg
bWF5IGJlIGltcGxlbWVudGVkIGluIGZ1dHVyZSAqLw0KKyAgICAgICAgc3dpdGNoICggZGV2X3Jl
c2V0LnJlc2V0X3R5cGUgKQ0KKyAgICAgICAgew0KKyAgICAgICAgY2FzZSBQQ0lfREVWSUNFX1NU
QVRFX1JFU0VUX0NPTEQ6DQorICAgICAgICBjYXNlIFBDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfV0FS
TToNCisgICAgICAgIGNhc2UgUENJX0RFVklDRV9TVEFURV9SRVNFVF9IT1Q6DQorICAgICAgICBj
YXNlIFBDSV9ERVZJQ0VfU1RBVEVfUkVTRVRfRkxSOg0KKyAgICAgICAgICAgIHJldCA9IHZwY2lf
cmVzZXRfZGV2aWNlX3N0YXRlKHBkZXYsIGRldl9yZXNldC5yZXNldF90eXBlKTsNCisgICAgICAg
ICAgICBicmVhazsNCisgICAgICAgIH0NCisgICAgICAgIHdyaXRlX3VubG9jaygmcGRldi0+ZG9t
YWluLT5wY2lfbG9jayk7DQorDQorICAgICAgICBpZiAoIHJldCApDQorICAgICAgICAgICAgZHBy
aW50ayhYRU5MT0dfRVJSLA0KKyAgICAgICAgICAgICAgICAgICAgIiVwcDogZmFpbGVkIHRvIHJl
c2V0IHZQQ0kgZGV2aWNlIHN0YXRlXG4iLCAmc2JkZik7DQorICAgICAgICBicmVhazsNCisgICAg
fQ0KDQo+IA0KPj4+IEFsc28sIG5pdCAoZnVydGhlciB1cCk6IE9wZW5pbmcgZmlndXJlIGJyYWNl
cyBmb3IgYSBuZXcgc2NvcGUgZ28gb250byB0aGVpcg0KPj4gT0ssIHdpbGwgY2hhbmdlIGluIG5l
eHQgdmVyc2lvbi4NCj4+PiBvd24gbGluZS4gVGhlbiBhZ2FpbiBJIG5vdGljZSB0aGF0IGFwcGFy
ZW5seSBfYWxsXyBvdGhlciBpbnN0YW5jZXMgaW4gdGhpcw0KPj4+IGZpbGUgYXJlIGRvaW5nIGl0
IHRoZSB3cm9uZyB3YXksIHRvby4NCj4+IERvIEkgbmVlZCB0byBjaGFuZ2UgdGhlbSBpbiB0aGlz
IHBhdGNoPw0KPiANCj4gTm8uDQo+IA0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2ku
Yw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4+PiBAQCAtMTcyLDYgKzE3
MiwxNSBAQCBpbnQgdnBjaV9hc3NpZ25fZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+
PiAgDQo+Pj4+ICAgICAgcmV0dXJuIHJjOw0KPj4+PiAgfQ0KPj4+PiArDQo+Pj4+ICtpbnQgdnBj
aV9yZXNldF9kZXZpY2Vfc3RhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4NCj4+PiBBcyBh
IHRhcmdldCBvZiBhbiBpbmRpcmVjdCBjYWxsIHRoaXMgbmVlZHMgdG8gYmUgYW5ub3RhdGVkIGNm
X2NoZWNrIChib3RoDQo+Pj4gaGVyZSBhbmQgaW4gdGhlIGRlY2xhcmF0aW9uLCB1bmxpa2UgX19t
dXN0X2NoZWNrLCB3aGljaCBpcyBzdWZmaWNpZW50IHRvDQo+Pj4gaGF2ZSBvbiBqdXN0IHRoZSBk
ZWNsYXJhdGlvbikuDQo+PiBPSywgd2lsbCBhZGQgY2ZfY2hlY2sgaW4gbmV4dCB2ZXJzaW9uLg0K
PiANCj4gV2hpY2ggbWF5IG5vdCBiZSBuZWNlc3NhcnkgaWYgeW91IGdvIHRoZSByb3V0ZSBzdWdn
ZXN0ZWQgYWJvdmUuDQo+IA0KPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4+Pj4g
KysrIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+Pj4+IEBAIC0xNTYsNiArMTU2LDIyIEBAIHN0
cnVjdCBwY2lfZGV2IHsNCj4+Pj4gICAgICBzdHJ1Y3QgdnBjaSAqdnBjaTsNCj4+Pj4gIH07DQo+
Pj4+ICANCj4+Pj4gK3N0cnVjdCBwY2lfZGV2aWNlX3N0YXRlX3Jlc2V0X21ldGhvZCB7DQo+Pj4+
ICsgICAgaW50ICgqcmVzZXRfZm4pKHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+Pj4gK307DQo+
Pj4+ICsNCj4+Pj4gK2VudW0gcGNpX2RldmljZV9zdGF0ZV9yZXNldF90eXBlIHsNCj4+Pj4gKyAg
ICBERVZJQ0VfUkVTRVRfRkxSLA0KPj4+PiArICAgIERFVklDRV9SRVNFVF9DT0xELA0KPj4+PiAr
ICAgIERFVklDRV9SRVNFVF9XQVJNLA0KPj4+PiArICAgIERFVklDRV9SRVNFVF9IT1QsDQo+Pj4+
ICt9Ow0KPj4+PiArDQo+Pj4+ICtzdHJ1Y3QgcGNpX2RldmljZV9zdGF0ZV9yZXNldCB7DQo+Pj4+
ICsgICAgc3RydWN0IHBoeXNkZXZfcGNpX2RldmljZSBkZXY7DQo+Pj4+ICsgICAgZW51bSBwY2lf
ZGV2aWNlX3N0YXRlX3Jlc2V0X3R5cGUgcmVzZXRfdHlwZTsNCj4+Pj4gK307DQo+Pj4NCj4+PiBU
aGlzIGlzIHRoZSBzdHJ1Y3QgdG8gdXNlIGFzIGh5cGVyY2FsbCBhcmd1bWVudC4gSG93IGNhbiBp
dCBsaXZlIG91dHNpZGUgb2YNCj4+PiBhbnkgcHVibGljIGhlYWRlcj8gQWxzbywgd2hlbiBtb3Zp
bmcgaXQgdGhlcmUsIGJld2FyZSB0aGF0IHlvdSBzaG91bGQgbm90DQo+Pj4gdXNlIGVudW0tcyB0
aGVyZS4gT25seSBoYW5kbGVzIGFuZCBmaXhlZC13aWR0aCB0eXBlcyBhcmUgcGVybWl0dGVkLnQN
Cj4+IFllcywgSSBwdXQgdGhlbSB0aGVyZSBiZWZvcmUsIGJ1dCBlbnVtIGlzIG5vdCBwZXJtaXR0
ZWQuDQo+PiBUaGVuLCBkbyB5b3UgaGF2ZSBvdGhlciBzdWdnZXN0ZWQgdHlwZSB0byB1c2UgdG8g
ZGlzdGluZ3Vpc2ggZGlmZmVyZW50IHR5cGVzIG9mIHJlc2V0cywgYmVjYXVzZSBlbnVtIGNhbid0
IHdvcmsgaW4gdGhlIHB1YmxpYyBoZWFkZXI/DQo+IA0KPiBEbyBsaWtlIHdlIGRvIGV2ZXJ5d2hl
cmUgZWxzZTogVXNlIGEgc2V0IG9mICNkZWZpbmUtcy4NCj4gDQo+Pj4+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi92cGNpLmgNCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3ZwY2kuaA0KPj4+PiBA
QCAtMzgsNiArMzgsNyBAQCBpbnQgX19tdXN0X2NoZWNrIHZwY2lfYXNzaWduX2RldmljZShzdHJ1
Y3QgcGNpX2RldiAqcGRldik7DQo+Pj4+ICANCj4+Pj4gIC8qIFJlbW92ZSBhbGwgaGFuZGxlcnMg
YW5kIGZyZWUgdnBjaSByZWxhdGVkIHN0cnVjdHVyZXMuICovDQo+Pj4+ICB2b2lkIHZwY2lfZGVh
c3NpZ25fZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+Pj4gK2ludCBfX211c3RfY2hl
Y2sgdnBjaV9yZXNldF9kZXZpY2Vfc3RhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPj4+DQo+
Pj4gV2hhdCdzIHRoZSBwdXJwb3NlIG9mIHRoaXMgX19tdXN0X2NoZWNrLCB3aGVuIHRoZSBzb2xl
IGNhbGxlciBpcyBjYWxsaW5nDQo+Pj4gdGhpcyB0aHJvdWdoIGEgZnVuY3Rpb24gcG9pbnRlciwg
d2hpY2ggaXNuJ3Qgc2ltaWxhcmx5IGFubm90YXRlZD8NCj4+IFRoaXMgaXMgd2hhdCBJIGFkZGVk
IGJlZm9yZSBpbnRyb2R1Y2luZyBmdW5jdGlvbiBwb2ludGVycywgYnV0IGFmdGVyIG1vZGlmeWlu
ZyB0aGUgaW1wbGVtZW50YXRpb24sIGl0IHdhcyBub3QgdGFrZW4gaW50byBhY2NvdW50Lg0KPj4g
SSB3aWxsIHJlbW92ZSBfX211c3RfY2hlY2sNCj4gDQo+IFdoeSByZW1vdmU/IElzIGl0IHJlbGV2
YW50IGZvciB0aGUgcmV0dXJuIHZhbHVlIHRvIGJlIGNoZWNrZWQ/IE9yIGlmIGl0DQo+IGlzbid0
LCB3aHkgd291bGQgdGhlcmUgYmUgYSByZXR1cm4gdmFsdWU/DQo+IA0KPiBKYW4NCj4gDQo+PiBh
bmQgY2hhbmdlIHRvIGNmX2NoZWNrLCBhY2NvcmRpbmcgdG8geW91ciBhYm92ZSBjb21tZW50Lg0K
PiANCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

