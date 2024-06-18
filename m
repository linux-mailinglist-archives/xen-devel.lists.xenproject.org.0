Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7C790C4BB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742780.1149640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJTuy-00051Q-UO; Tue, 18 Jun 2024 08:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742780.1149640; Tue, 18 Jun 2024 08:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJTuy-0004yq-RE; Tue, 18 Jun 2024 08:10:16 +0000
Received: by outflank-mailman (input) for mailman id 742780;
 Tue, 18 Jun 2024 08:10:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kZif=NU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJTuw-00046j-Os
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:10:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e88::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fbcacbd-2d4a-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 10:10:13 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW4PR12MB7014.namprd12.prod.outlook.com (2603:10b6:303:218::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 08:10:08 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 08:10:08 +0000
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
X-Inumbo-ID: 2fbcacbd-2d4a-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpGZojTp/Sz3F81NHMOE2Lv6JuqiRUKoVfwoDvT5c/ptt44ky4rrIL5RYcsAd5I1PUqgy1nL9oHcuTjA5tdqOWhtlusbRsWgoNNFJwODX3XJ2gx4Iv6GOQTlz3dHByXKBf/6jmtN8nX+ADesvG4YE92iwGs/WtAmE8WEbzPDcQoa2aHn0PBjLgBRLR9m6XaXE8JjbMcmiNIdsuOQE9yoYM+ZnubksQERxC48/mDrZx3tBZjZIdNJ3zimVhfPsi9akinxcIQcjyYBVv5csK+DiSzfkHXZBXudYhkc0P57O7+hvThANpGc4/xjOqEo9l+bKxFIG5HaUYt36bXd2JMfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4IQjgBn0srP20CSsCsJAOpgijcXG538FJxRv6z0gY0=;
 b=Pf3deRn6Opv3HLUpR4QDZNctfwg4DD9ShNy78baRCHPTOsYynChPx+z7S6EMNcUQ8sbdmP4k78Nk8wbof5HjvMhGB9bsOUQmDvGrgcPPVLJIW/zpL9L95i1wtZbv3Z/wx1aPiMhWeFARFUsmy0+WXnlP99JJh4H8F6MGdE8OSGSbMESU5Jf2WXU/Bh8PCbssPSyt8RwlRFggqz0HmwR5jQR/WeDLjj/aFO9fXOe9Rb/2ByZtGKiZ6r0m9kmeNNshd051K72YHOGUokwAV1OhQFbM2nhcn1QR5sT7EgrlGn9c/HleBAfx1r8J8/+1k0W4aXrKtbdw/sbYJaTa+XlgEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4IQjgBn0srP20CSsCsJAOpgijcXG538FJxRv6z0gY0=;
 b=m+YgyMzAJBbMV3BrG0+sz5y3Ra3ffKzinSCSeC/vlnmeuHvrCCsA3czq3fyUjxnWhqNu59nJHpeAKkqsAHHLccQ8yBb2GsTx/xPic3EPbwV+rhmn5qRq5w9Tk4JbW9XNRkZ5Bxbeo1paw7WqLTamranYR0c3iRolkSNE+DEbEHQ=
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
Subject: Re: [XEN PATCH v10 4/5] tools: Add new function to get gsi from dev
Thread-Topic: [XEN PATCH v10 4/5] tools: Add new function to get gsi from dev
Thread-Index: AQHawJToSxHkdXzldkCDZE5kihITT7HMD9QAgAGTOgA=
Date: Tue, 18 Jun 2024 08:10:08 +0000
Message-ID:
 <BL1PR12MB584910D242D9D8B4BA8B15C1E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-5-Jiqian.Chen@amd.com>
 <49563a31-d50e-4015-88ee-e0dab9193cd1@suse.com>
In-Reply-To: <49563a31-d50e-4015-88ee-e0dab9193cd1@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW4PR12MB7014:EE_
x-ms-office365-filtering-correlation-id: 66d9da63-169a-4974-467c-08dc8f6e11d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|376011|7416011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?c3QrMXYvZ1NTUzNMcW51Q3R6SWUwUERxNVl3RHkvKzFlNWhOOExFb29wT3VD?=
 =?utf-8?B?aE5NTW1xK0V1ZGQrUWZTWWgyWnIrMmZlRXo5WTBQdGxrdW5qWlNOb3lweFdM?=
 =?utf-8?B?TlByWDZrNkxESWoyZ0tpaytvYU84UW1NcU83WmM5RzR3T1BDdUwvUjRVNjhP?=
 =?utf-8?B?UFk0N284S2RDUzJRZXdqTS8xVUZ2ZXJTZ3pUdGNvZUpHUWlTSG5iUCt4NUZO?=
 =?utf-8?B?MjlhR2RaZmptdkFHc3RncERQbWxpcytHOVljWXlnTWVRQ3lvYVpiU3JCRUpr?=
 =?utf-8?B?MjMrQkNrTVBWS1FjTUN4clpvblpDRVd2RjZqK3JVMHZTa0dyNjIxMFhYYnc0?=
 =?utf-8?B?U0JuQmxPV2xiNzVtU2duL3BIRTY5WkdYdTNCQ3lMaHhkQll1V1BMOWJsZDFU?=
 =?utf-8?B?U1dkbVkyaHhRYXlnYmNZUUpxZ1c0T0l6NlpkWldnWlJSWUdGYndxdTdQOWdx?=
 =?utf-8?B?Q3JYOW1wSjVSaXVFZVd0WXFKV2NFS0FlbGYvSFRZTkRjcWh2ZTJPZ3hWWmdh?=
 =?utf-8?B?OGNqeVZVMzZjVGp3MHVxMW1GbS9XM1VmMkthWDJkcStCVGxqMFZxN0ZKU29K?=
 =?utf-8?B?c08raC9kQk96cW5lTVptVjRPQy9uUldvYjJLanJISzhEcWRRZUNHc0xxWE5B?=
 =?utf-8?B?QzE1aHg0STV5MUJ4cWZnMWc3bGF6YjR0TlV5T2NhVDdza3NMN3pHSEpaNWFM?=
 =?utf-8?B?NzVEaVc2MHBNMU13NW9qai9VQ21jcmVOVUkyWkkyaDlOWk5PcnVGbUI0UnYz?=
 =?utf-8?B?WncvMm1IZXR1L0M3WHZ3N2MwTXRnSHhwcVhjRXhQblN2bFBZaFFGc29OS203?=
 =?utf-8?B?WGxpOTBlWllKbDQvRTFYM21NOXRvT3JqeE03Z3FVcVR5ZHA5M21rQXpoZzZL?=
 =?utf-8?B?Vm5Ucytqb2tBd1RmZFdjeGx0ampybWJadFFuVk9QMmVzRFd0Y0d2ZUVramJT?=
 =?utf-8?B?SkgyUEY4T0FOYXBYLzhvOTYrdFM0QThsQkpvWUhXdGdERGpKSjQzVGN1aU5y?=
 =?utf-8?B?STFkK2ZUa05reXpPMjNoRlI1SVdNQ0ZleVMzek9MNjl3ME5KVElpY2JDZnZo?=
 =?utf-8?B?UlJ1UGtENlQ0VjhNdEh2bDhLT0I5ZkU4eWxKZ1FqVTRNQUhLVjVrak5scU9h?=
 =?utf-8?B?WllJd1VCOFppM29BRDIwUlBhcEFKYUV1M2VIOG9maW93TG9KOHB6VVBCSkRi?=
 =?utf-8?B?cjR1cGQwUUV6bXNpb01QYjlRY3Y0QkttQmw1TmpxcHFwcjB2c21CS01kN21B?=
 =?utf-8?B?WnlDb3JZeDlZYjE4N2FjbU1scGs4V0U5dVBXaWxDVjdxTFAyK2J2US9nWDAz?=
 =?utf-8?B?UFhxcEJjRkJwY2lSU3U2NUY2QlpXMFpCdUhjK2xIdnFSRnZxV1lLRmlkTjY3?=
 =?utf-8?B?bHlJVWw3L2ZBS2tLQkRRYVZzakc1V0tyY25iME04SGJDcytSZTNzcE9Cbnl4?=
 =?utf-8?B?ekZvREc0NGRxajRldFNnTGhMcVBORmxIWWtUYk5PMjVPOFhLOFN1cktINU1M?=
 =?utf-8?B?ZU9wRmIreUdFRW9ib1NNb0J0NkpMZlhWK1R0YW5IQlFWdTFNL1VNN3dPUFIy?=
 =?utf-8?B?QkhlN3NGd1FBdEwzRDAzUnMwZzNsN1d2Q3Q1MzVMN2FzcU1KT29zUVFZa09p?=
 =?utf-8?B?bnZNOStzcjZuWFIxVHpCUC9ya3NUbDZuT0pnSVMvK3ByUTNibDZwOTBSSGZD?=
 =?utf-8?B?OVc2QWlHVkFIby80NERZRnUzSmpna2ZGMk1Kc0tRNnFpNEVwc3l1Ykx1VUwy?=
 =?utf-8?B?QUNHYkE4WFZjZjJrWExGMkoyZDF1RE81SE54WjRqV0JyWEJ0bUJZdUVTNU1P?=
 =?utf-8?Q?I8414eMf3tUEnf3myAUyflYwKnln5KDn1uXDM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWRmTEl6R0ZSZlhkY05GbEduL0xjUUI0UGJXc05zaHpNVHhRR1Jzc0pXR0FJ?=
 =?utf-8?B?NHpHaE10Nm5PTDIwWm45a0c3a2J4UTlzRnk5cG4xZms0OU5YQTI1N2NPemNr?=
 =?utf-8?B?V1ZrN21UalNtZGhRVzEvTFh0YWtSM1dqRHl2Y1hidlkza1IwWmFZRW5NdlBr?=
 =?utf-8?B?ejZqcjJzUE5ZWjhJYmVUTDFadmJpLzVCYTQ2V3hmQmkyNlFKbDBYdjBkUFVH?=
 =?utf-8?B?QkdwQkgrdnhFQTNTcDNWMnpPdXk2ZWswU0pNNGNpVjBsdjFLNHI1OFdoRWdU?=
 =?utf-8?B?c2N0WUx5WW90Z3ErYUFPK1V1OERaeUVJeTUyTW5TdzJvWnB4WjVDUHBCak1B?=
 =?utf-8?B?ZStVQ1Q3Z0dpWFM3SkxkSWJNRkJObTlocnkvOTJzZXlQcHVoOVVmamFnTVZC?=
 =?utf-8?B?eXlNYUtWY0JXTEE2d2F6RGhUMWljSHI4ZUV6RjZwS0NNTC9RUUZWbWxSRHhO?=
 =?utf-8?B?Y05hTHE5d1V3Vi8wbjZBWmtaT3ZJT0EzRUIxZzZYQ3JFMVpiQ3dEQzNnQUpT?=
 =?utf-8?B?U3ZhNUhhWTM5Rm14aHprZjA0U3pOQjlBdURGelU2SkRqa1BMakE1aEJLaGth?=
 =?utf-8?B?Ni9yRE5ON1ZmQSs3RWhlSFJXcWFEbHAvUGM4endnbzhuNXJ1QWttellXVVU5?=
 =?utf-8?B?ekhvR3dyeGQ2VGdGVDlFR3hEU28zWkF5YWJTdmVuRkkxTFBNZXF2VGNUN1JE?=
 =?utf-8?B?TXBId29IYWxMTStLS3JGTjBvYlBYeE9sQy91K3RDRzlBZEJDTjVMQmV6Ykor?=
 =?utf-8?B?aHZvQ3Rpb05SQTBCWk1JdklYSGtkcGRDdzZ2WFVoM2pUazFNOVIyVDNXdEw0?=
 =?utf-8?B?WnljWnJYWWZlK2lkaVQvaGR2V1NzTG9KS2pmeWhaYmFVcUY3V0M5NjcxZ2hv?=
 =?utf-8?B?bGxhekJmVW5SS2haOWgzS1VkUEtBbzlQVjltUFl0VE9OTnUzNlFwcUhJOGFm?=
 =?utf-8?B?NGw4TjJnOVFvaVFXUnhrWGJZSHRwRVljS1lrSDk5cHFYZyt6ZkVFUEh6K3Ni?=
 =?utf-8?B?cHlxS0M2dmV0WTRlb2ZPdElhdVNQSDJwMlBkK0ZNV2tUNTBSclI3UkEyV1RH?=
 =?utf-8?B?YTBRZHdUWUhOM2R5aXZSc25CWUpGQUl5NnlYeE9PdksrQmtTeXVnVm5vbGM0?=
 =?utf-8?B?S0FJamUyK1UrVE9TbVZqVWUxYTFXS3ozeFNFRmZQdHdOSzZMVG1JNjlrWkRw?=
 =?utf-8?B?R0hBWnJjSFNkcDlGc2dlMVFvcS8zdVU5SzBNQndMbHpBa2hjLzd6dUVmOXV6?=
 =?utf-8?B?Zk0rV0VZRmNqbnloUkg1ejRvaWxtK2NYVmF1RTN2VmJUT0djN0h2UnVyRUNi?=
 =?utf-8?B?RkhBSTFMcUxDS2IvcExTWmFVakg5UmNvdm43bHdPWlR2QytOOFZWbXdvUkdi?=
 =?utf-8?B?c1VZNExOZXhQY1VMcDJqSS9Tdm5qTzBRMnNVNlJNTzVzUndwdE1RZUk0VG9p?=
 =?utf-8?B?WWx4SnE0cXhPc1V1NlFTRSswSWM5a2lnclV0bVNWb2c5ekphRTdoa1lieFBn?=
 =?utf-8?B?MUd3ZUYyVW1pK2tTT2ZkWmQrZHJnL1NDbERvNmNhdVVqU2FEMmNRbnBNKzA3?=
 =?utf-8?B?TTdSa0ZiQlRCeEN5Rk9LRDU1YnVVRGFaMUxiMVB4dTYyQkdYQ1h1TXlqUWNN?=
 =?utf-8?B?QUVKSDFxNGJ0bllpNk1nVmhqSFg4bHJaNXVMUjNVYXBLQnZEMkhlN2oxQk13?=
 =?utf-8?B?aC94THByUnVRUDNjK3ZLMGRsLzVjbHJwWDRJbjUwVExrMkJUR00xaVZhVk9W?=
 =?utf-8?B?YTRYUU9FWnlNTzhPcTBXRnFid3Jvd2w2VHhZY3BSdUZTRUx0ZzVLSVg1RzZm?=
 =?utf-8?B?QmU3UmdLZ0FyeTkxNVlRUXRJSXJZeG9HRHpiT0QxalV3OVNjUTgyK3hpV1dR?=
 =?utf-8?B?OEVFWHlveU14WE1Ed1R2aWRQR3ZIOWlZZjVKUUV2c0dMMzlnUTQwOC9yYTM4?=
 =?utf-8?B?S1dxUmprLzZIbW9idXJZdjVjc3VaL2dDUklEOHhPUWhRa1habWlQakF5SFBx?=
 =?utf-8?B?ZGRzb3ZQMUQxcklicWdIUUp5YWtCSXZ3VUc5ZERYYWxwYjUrK0QyMmtJbmJ2?=
 =?utf-8?B?UXAzc1VvMzVBUUszcHdtVmVmSE8zL0h5dFR4Q0J4Ly8xRlJPZWdTYnk3cG1P?=
 =?utf-8?Q?As3Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FAAB5392264144B9ED578F409D9B605@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d9da63-169a-4974-467c-08dc8f6e11d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 08:10:08.7909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dPA2Plkjm+8U7Di9Lh6bUp1AqGlKtxUFYyv9ztl15vslcb1Z939y5n9d0aJoLXpoEWZm1jREP+rQLQU+VgcUzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7014

T24gMjAyNC82LzE3IDIzOjEwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDYuMjAyNCAx
MTowMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBJbiBQVkggZG9tMCwgaXQgdXNlcyB0aGUgbGlu
dXggbG9jYWwgaW50ZXJydXB0IG1lY2hhbmlzbSwNCj4+IHdoZW4gaXQgYWxsb2NzIGlycSBmb3Ig
YSBnc2ksIGl0IGlzIGR5bmFtaWMsIGFuZCBmb2xsb3cNCj4+IHRoZSBwcmluY2lwbGUgb2YgYXBw
bHlpbmcgZmlyc3QsIGRpc3RyaWJ1dGluZyBmaXJzdC4gQW5kDQo+PiBpcnEgbnVtYmVyIGlzIGFs
bG9jZWQgZnJvbSBzbWFsbCB0byBsYXJnZSwgYnV0IHRoZSBhcHBseWluZw0KPj4gZ3NpIG51bWJl
ciBpcyBub3QsIG1heSBnc2kgMzggY29tZXMgYmVmb3JlIGdzaSAyOCwgdGhhdA0KPj4gY2F1c2Vz
IHRoZSBpcnEgbnVtYmVyIGlzIG5vdCBlcXVhbCB3aXRoIHRoZSBnc2kgbnVtYmVyLg0KPiANCj4g
SG1tLCBzZWUgbXkgZWFybGllciBleHBsYW5hdGlvbnMgb24gcGF0Y2ggNTogR1NJIGFuZCBJUlEg
Z2VuZXJhbGx5IGFyZW4ndA0KPiB0aGUgc2FtZSBhbnl3YXkuIFRoZXJlZm9yZSB0aGlzIHBhcnQg
b2YgdGhlIGRlc2NyaXB0aW9uLCB3aGlsZSBub3Qgd3JvbmcsDQo+IGlzIGF0IGxlYXN0IGF0IHJp
c2sgb2YgbWlzbGVhZGluZyBwZW9wbGUuDQpPSywgSSB3bGwgY2hhbmdlIHRvIHNheSAiaXJxIGlz
IG5vdCB0aGUgc2FtZSBhcyBnc2kiLg0KPiANCj4+IC0tLSBhL3Rvb2xzL2luY2x1ZGUveGVuLXN5
cy9MaW51eC9wcml2Y21kLmgNCj4+ICsrKyBiL3Rvb2xzL2luY2x1ZGUveGVuLXN5cy9MaW51eC9w
cml2Y21kLmgNCj4+IEBAIC05NSw2ICs5NSwxMSBAQCB0eXBlZGVmIHN0cnVjdCBwcml2Y21kX21t
YXBfcmVzb3VyY2Ugew0KPj4gIAlfX3U2NCBhZGRyOw0KPj4gIH0gcHJpdmNtZF9tbWFwX3Jlc291
cmNlX3Q7DQo+PiAgDQo+PiArdHlwZWRlZiBzdHJ1Y3QgcHJpdmNtZF9nc2lfZnJvbV9kZXYgew0K
Pj4gKwlfX3UzMiBzYmRmOw0KPiANCj4gVGhhdCdzIFBDSS1jZW50cmljLCB3aXRob3V0IHN0cnVj
dCBhbmQgSU9DVEwgbmFtZXMgcmVmbGVjdGluZyB0aGlzIGZhY3QuDQpTbywgY2hhbmdlIHRvIHBy
aXZjbWRfZ3NpX2Zyb21fcGNpZGV2ID8NCg0KPiANCj4+ICsJaW50IGdzaTsNCj4gDQo+IElzICJp
bnQiIGxlZ2l0aW1hdGUgdG8gdXNlIGhlcmU/IERvZXNuJ3QgdGhpcyB3YW50IHRvIHNpbWlsYXJs
eSBiZSBfX3UzMj8NCkkgd2FudCB0byBzZXQgZ3NpIHRvIG5lZ2F0aXZlIGlmIHRoZXJlIGlzIG5v
IHJlY29yZCBvZiB0aGlzIHRyYW5zbGF0aW9uLg0KDQo+IA0KPj4gLS0tIGEvdG9vbHMvaW5jbHVk
ZS94ZW5jYWxsLmgNCj4+ICsrKyBiL3Rvb2xzL2luY2x1ZGUveGVuY2FsbC5oDQo+PiBAQCAtMTEz
LDYgKzExMyw4IEBAIGludCB4ZW5jYWxsNSh4ZW5jYWxsX2hhbmRsZSAqeGNhbGwsIHVuc2lnbmVk
IGludCBvcCwNCj4+ICAgICAgICAgICAgICAgdWludDY0X3QgYXJnMSwgdWludDY0X3QgYXJnMiwg
dWludDY0X3QgYXJnMywNCj4+ICAgICAgICAgICAgICAgdWludDY0X3QgYXJnNCwgdWludDY0X3Qg
YXJnNSk7DQo+PiAgDQo+PiAraW50IHhlbl9vc2NhbGxfZ3NpX2Zyb21fZGV2KHhlbmNhbGxfaGFu
ZGxlICp4Y2FsbCwgdW5zaWduZWQgaW50IHNiZGYpOw0KPiANCj4gSG1tLCBzb21ldGhpbmcgKGJ5
IG5hbWUgYXQgbGVhc3QpIE9TLXNwZWNpZmljIGJlaW5nIGluIHRoZSBwdWJsaWMgaGVhZGVyDQo+
IGFuZCAuLi4NCj4gDQo+PiAtLS0gYS90b29scy9saWJzL2NhbGwvbGlieGVuY2FsbC5tYXANCj4+
ICsrKyBiL3Rvb2xzL2xpYnMvY2FsbC9saWJ4ZW5jYWxsLm1hcA0KPj4gQEAgLTEwLDYgKzEwLDgg
QEAgVkVSU18xLjAgew0KPj4gIAkJeGVuY2FsbDQ7DQo+PiAgCQl4ZW5jYWxsNTsNCj4+ICANCj4+
ICsJCXhlbl9vc2NhbGxfZ3NpX2Zyb21fZGV2Ow0KPiANCj4gLi4uIG1hcCBmaWxlLiBJJ20gbm90
IHN1cmUgdGhpbmdzIGFyZSBpbnRlbmRlZCB0byBiZSB0aGlzIHdheS4NCkxldCdzIHNlZSBvdGhl
ciBtYWludGFpbmVyJ3Mgb3Bpbmlvbi4NCg0KPiANCj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQv
bGlieGxfcGNpLmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+IEBA
IC0xNDA2LDYgKzE0MDYsMTIgQEAgc3RhdGljIGJvb2wgcGNpX3N1cHBfbGVnYWN5X2lycSh2b2lk
KQ0KPj4gICNlbmRpZg0KPj4gIH0NCj4+ICANCj4+ICsjZGVmaW5lIFBDSV9ERVZJRChidXMsIGRl
dmZuKVwNCj4+ICsgICAgICAgICAgICAoKCgodWludDE2X3QpKGJ1cykpIDw8IDgpIHwgKChkZXZm
bikgJiAweGZmKSkNCj4+ICsNCj4+ICsjZGVmaW5lIFBDSV9TQkRGKHNlZywgYnVzLCBkZXZmbikg
XA0KPj4gKyAgICAgICAgICAgICgoKCh1aW50MzJfdCkoc2VnKSkgPDwgMTYpIHwgKFBDSV9ERVZJ
RChidXMsIGRldmZuKSkpDQo+IA0KPiBJJ20gbm90IGEgbWFpbnRhaW5lciBvZiB0aGlzIGZpbGU7
IGlmIEkgd2VyZSwgSSdkIGFzayB0aGF0IGZvciByZWFkYWJpbGl0eSdzDQo+IHNha2UgYWxsIGV4
Y2VzcyBwYXJlbnRoZXNlcyBiZSBkcm9wcGVkIGZyb20gdGhlc2UuDQpJc24ndCBpdCBhIGNvZGlu
ZyByZXF1aXJlbWVudCB0byBlbmNsb3NlIGVhY2ggZWxlbWVudCBpbiBwYXJlbnRoZXNlcyBpbiB0
aGUgbWFjcm8gZGVmaW5pdGlvbj8NCkl0IHNlZW1zIG90aGVyIGZpbGVzIGFsc28gZG8gdGhpcy4g
U2VlIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfaW50ZXJuYWwuaA0KDQo+IA0KPj4gQEAgLTE0ODYs
NiArMTQ5NiwxOCBAQCBzdGF0aWMgdm9pZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdj
LA0KPj4gICAgICAgICAgZ290byBvdXRfbm9faXJxOw0KPj4gICAgICB9DQo+PiAgICAgIGlmICgo
ZnNjYW5mKGYsICIldSIsICZpcnEpID09IDEpICYmIGlycSkgew0KPj4gKyNpZmRlZiBDT05GSUdf
WDg2DQo+PiArICAgICAgICBzYmRmID0gUENJX1NCREYocGNpLT5kb21haW4sIHBjaS0+YnVzLA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgIChQQ0lfREVWRk4ocGNpLT5kZXYsIHBjaS0+ZnVu
YykpKTsNCj4+ICsgICAgICAgIGdzaSA9IHhjX3BoeXNkZXZfZ3NpX2Zyb21fZGV2KGN0eC0+eGNo
LCBzYmRmKTsNCj4+ICsgICAgICAgIC8qDQo+PiArICAgICAgICAgKiBPbGQga2VybmVsIHZlcnNp
b24gbWF5IG5vdCBzdXBwb3J0IHRoaXMgZnVuY3Rpb24sDQo+IA0KPiBKdXN0IGtlcm5lbD8NClll
cywgeGNfcGh5c2Rldl9nc2lfZnJvbV9kZXYgZGVwZW5kcyBvbiB0aGUgZnVuY3Rpb24gaW1wbGVt
ZW50ZWQgb24gbGludXgga2VybmVsIHNpZGUuDQo+IA0KPj4gKyAgICAgICAgICogc28gaWYgZmFp
bCwga2VlcCB1c2luZyBpcnE7IGlmIHN1Y2Nlc3MsIHVzZSBnc2kNCj4+ICsgICAgICAgICAqLw0K
Pj4gKyAgICAgICAgaWYgKGdzaSA+IDApIHsNCj4+ICsgICAgICAgICAgICBpcnEgPSBnc2k7DQo+
IA0KPiBJJ20gc3RpbGwgcHV6emxlZCBieSB0aGlzLCB3aGVuIGJ5IG5vdyBJIHRoaW5rIHdlJ3Zl
IHN1ZmZpY2llbnRseSBjbGFyaWZpZWQNCj4gdGhhdCBJUlFzIGFuZCBHU0lzIHVzZSB0d28gZGlz
dGluY3QgbnVtYmVyaW5nIHNwYWNlcy4NCj4gDQo+IEFsc28sIGFzIHByZXZpb3VzbHkgaW5kaWNh
dGVkLCB5b3UgY2FsbCB0aGlzIGZvciBQViBEb20wIGFzIHdlbGwuIEFpdWkgb24NCj4gdGhlIGFz
c3VtcHRpb24gdGhhdCBpdCdsbCBmYWlsLiBXaGF0IGlmIHdlIGRlY2lkZSB0byBtYWtlIHRoZSBm
dW5jdGlvbmFsaXR5DQo+IGF2YWlsYWJsZSB0aGVyZSwgdG9vIChpZiBvbmx5IGZvciBpbmZvcm1h
dGlvbmFsIHB1cnBvc2VzLCBvciBmb3INCj4gY29uc2lzdGVuY3kpPyBTdWRkZW5seSB5b3UncmUg
ZmFsbGJhY2sgbG9naWMgd291bGRuJ3Qgd29yayBhbnltb3JlLCBhbmQNCj4geW91J2QgY2FsbCAu
Li4NCj4gDQo+PiArICAgICAgICB9DQo+PiArI2VuZGlmDQo+PiAgICAgICAgICByID0geGNfcGh5
c2Rldl9tYXBfcGlycShjdHgtPnhjaCwgZG9taWQsIGlycSwgJmlycSk7DQo+IA0KPiAuLi4gdGhl
IGZ1bmN0aW9uIHdpdGggYSBHU0kgd2hlbiBhIHBJUlEgaXMgbWVhbnQuIEltbywgYXMgc3VnZ2Vz
dGVkIGJlZm9yZSwNCj4geW91IHN0cmljdGx5IHdhbnQgdG8gYXZvaWQgdGhlIGNhbGwgb24gUFYg
RG9tMC4NCj4gDQo+IEFsc28gZm9yIFBWSCBEb20wOiBJIGRvbid0IHRoaW5rIEkndmUgc2VlbiBj
aGFuZ2VzIHRvIHRoZSBoeXBlcmNhbGwNCj4gaGFuZGxpbmcsIHlldC4gSG93IGNhbiB0aGF0IGJl
IHdoZW4gR1NJIGFuZCBJUlEgYXJlbid0IHRoZSBzYW1lLCBhbmQgaGVuY2UNCj4gaW5jb21pbmcg
R1NJIHdvdWxkIG5lZWQgdHJhbnNsYXRpbmcgdG8gSVJRIHNvbWV3aGVyZT8gSSBjYW4gb25jZSBh
Z2FpbiBvbmx5DQo+IGFzc3VtZSBhbGwgeW91ciB0ZXN0aW5nIHdhcyBkb25lIHdpdGggSVJRcyB3
aG9zZSBudW1iZXJzIGhhcHBlbmVkIHRvIG1hdGNoDQo+IHRoZWlyIEdTSSBudW1iZXJzLiAoVGhl
IGRpZmZlcmVuY2UsIGltbywgd291bGQgYWxzbyBuZWVkIGNhbGxpbmcgb3V0IGluIHRoZQ0KPiBw
dWJsaWMgaGVhZGVyLCB3aGVyZSB0aGUgcmVzcGVjdGl2ZSBpbnRlcmZhY2Ugc3RydWN0KHMpIGlz
L2FyZSBkZWZpbmVkLikNCkkgZmVlbCBsaWtlIHlvdSBtaXNzZWQgb3V0IG9uIG1hbnkgb2YgdGhl
IHByZXZpb3VzIGRpc2N1c3Npb25zLg0KV2l0aG91dCBteSBjaGFuZ2VzLCB0aGUgb3JpZ2luYWwg
Y29kZXMgdXNlIGlycSAocmVhZCBmcm9tIGZpbGUgL3N5cy9idXMvcGNpL2RldmljZXMvPHNiZGY+
L2lycSkgdG8gZG8geGNfcGh5c2Rldl9tYXBfcGlycSwNCmJ1dCB4Y19waHlzZGV2X21hcF9waXJx
IHJlcXVpcmUgcGFzc2luZyBpbnRvIGdzaSBpbnN0ZWFkIG9mIGlycSwgc28gd2UgbmVlZCB0byB1
c2UgZ3NpIHdoZXRoZXIgZG9tMCBpcyBQViBvciBQVkgsIHNvIGZvciB0aGUgb3JpZ2luYWwgY29k
ZXMsIHRoZXkgYXJlIHdyb25nLg0KSnVzdCBiZWNhdXNlIGJ5IGNoYW5jZSwgdGhlIGlycSB2YWx1
ZSBpbiB0aGUgTGludXgga2VybmVsIG9mIHB2IGRvbTAgaXMgZXF1YWwgdG8gdGhlIGdzaSB2YWx1
ZSwgc28gdGhlcmUgd2FzIG5vIHByb2JsZW0gd2l0aCB0aGUgb3JpZ2luYWwgcHYgcGFzc3Rocm91
Z2guDQpCdXQgbm90IHdoZW4gdXNpbmcgUFZILCBzbyBwYXNzdGhyb3VnaCBmYWlsZWQuDQpXaXRo
IG15IGNoYW5nZXMsIEkgZ290IGdzaSB0aHJvdWdoIGZ1bmN0aW9uIHhjX3BoeXNkZXZfZ3NpX2Zy
b21fZGV2IGZpcnN0bHksIGFuZCB0byBiZSBjb21wYXRpYmxlIHdpdGggb2xkIGtlcm5lbCB2ZXJz
aW9ucyhpZiB0aGUgaW9jdGwNCklPQ1RMX1BSSVZDTURfR1NJX0ZST01fREVWIGlzIG5vdCBpbXBs
ZW1lbnRlZCksIEkgc3RpbGwgbmVlZCB0byB1c2UgdGhlIGlycSBudW1iZXIsIHNvIEkgbmVlZCB0
byBjaGVjayB0aGUgcmVzdWx0DQpvZiBnc2ksIGlmIGdzaSA+IDAgbWVhbnMgSU9DVExfUFJJVkNN
RF9HU0lfRlJPTV9ERVYgaXMgaW1wbGVtZW50ZWQgSSBjYW4gdXNlIHRoZSByaWdodCBvbmUgZ3Np
LCBvdGhlcndpc2Uga2VlcCB1c2luZyB3cm9uZyBvbmUgaXJxLiANCg0KQW5kIHJlZ2FyZGluZyB0
byB0aGUgaW1wbGVtZW50YXRpb24gb2YgaW9jdGwgSU9DVExfUFJJVkNNRF9HU0lfRlJPTV9ERVYs
IGl0IGRvZXNuJ3QgaGF2ZSBhbnkgeGVuIGhleXBlcmNhbGwgaGFuZGxpbmcgY2hhbmdlcywgYWxs
IG9mIGl0cyBwcm9jZXNzaW5nIGxvZ2ljIGlzIG9uIHRoZSBrZXJuZWwgc2lkZS4NCkkga25vdywg
c28geW91IG1pZ2h0IHdhbnQgdG8gc2F5LCAiVGhlbiB5b3Ugc2hvdWxkbid0IHB1dCB0aGlzIGlu
IHhlbidzIGNvZGUuIiBCdXQgdGhpcyBjb25jZXJuIHdhcyBkaXNjdXNzZWQgaW4gcHJldmlvdXMg
dmVyc2lvbnMsIGFuZCBzaW5jZSB0aGUgcGNpIG1haW50YWluZXIgZGlzYWxsb3dlZCB0byBhZGQN
CmdzaSBzeXNmcyBvbiBsaW51eCBrZXJuZWwgc2lkZSwgSSBoYWQgdG8gZG8gc28uDQpSb2dlciwg
U3RlZmFubyBhbmQgSnVlcmdlbiBtYXkga25vdyBtb3JlIGFib3V0IHRoaXMgcGFydC4NCg0KPiAN
Cj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

