Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E890FD41
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 09:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744184.1151185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKBpL-0004aN-LO; Thu, 20 Jun 2024 07:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744184.1151185; Thu, 20 Jun 2024 07:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKBpL-0004Ys-GZ; Thu, 20 Jun 2024 07:03:23 +0000
Received: by outflank-mailman (input) for mailman id 744184;
 Thu, 20 Jun 2024 07:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3B6=NW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sKBpJ-0004Yl-Lw
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 07:03:21 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20606.outbound.protection.outlook.com
 [2a01:111:f403:2408::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c6473d5-2ed3-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 09:03:20 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS7PR12MB8231.namprd12.prod.outlook.com (2603:10b6:8:db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 07:03:16 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 07:03:15 +0000
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
X-Inumbo-ID: 2c6473d5-2ed3-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cby54vvKPo6Zh1+0kfsfKTYBl2wEl9EMRu4mny/ICXhyv4yXHPbkHhrzIlCGlAD0yNqnfq4MVj7Os/c56F2cUsq74aFJwRpVclMb7r2At81XiIa2rpVQSPvBzj0e/x22SAqYRr3fYUh+PEFrNKSJ5029eUqVrF+59F8ljlFdklqcJdZw7JPfQsMXrL2T3mv++7p3qFD6vzZCb7DHIT1QxmWu8D8By9bxyblqsSZSSml6Wzhxh1ffPFSIqbMFBmnpAV5qqjXXu1nW/CYCWLE23qLWQKa/XGxmTInw6L7D3pILygxu22nIjYIav7it5MVPCIxDeXBV9jm9g3xHrVtnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynlm9TnUOxuZ8OJUp1x9VljZupy4oxRLKp3UZv/IYSs=;
 b=dI7D0Mrp5niAnemW+05hd6RGdTnLDJ6KZpT14nfGcySmox4RAQ0iBrf8VqdRmN7F72aYuymtunjc3X1UoGl4rsKkkFlk69luojlG6AaUth0jfjkzQxZCJzcQn5/Uxo4j6lchXuO4QBhTJEWz6uz6KiaSce3PgcJzEmPxC9yj5GJsiauzmIjxFoHUj77/8LXpMoAdClvL0wYkgBoMCtD0ED0H3FwQ/ihPGOAD2o48vbXp1q/62oEy7G1NxY++BmCwEKuY4JYENdt+1/gCYlVam8lA3RGOXP64SkwuGH81Bd+s7Bu90YkSkD1mObqgH6HhkRWJnKWkrMAKKGZZW0Uz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynlm9TnUOxuZ8OJUp1x9VljZupy4oxRLKp3UZv/IYSs=;
 b=TWiaAY97AGC8J6Z3X0MYzhFkkF6o2135OLniq2S8ujVMhaugtS1pXy2nZZqykpo4r/CQzhHsOFESs7l4GLtadeOiFI6ZbRg8lBLdaTFfRinr4YNu0Kf1Y6N1hRR2sTbD9dBE+qP+5+ONn1Uw1pvL3Og5yq/EaB1a2XZc3Pc3qDU=
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
Thread-Index: AQHawJToSxHkdXzldkCDZE5kihITT7HMD9QAgAGTOgD//5t7AIADeOiA
Date: Thu, 20 Jun 2024 07:03:15 +0000
Message-ID:
 <BL1PR12MB5849ABD858B72505D83678F9E7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-5-Jiqian.Chen@amd.com>
 <49563a31-d50e-4015-88ee-e0dab9193cd1@suse.com>
 <BL1PR12MB584910D242D9D8B4BA8B15C1E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ab99b766-7bec-4046-beb2-f77a2591a911@suse.com>
In-Reply-To: <ab99b766-7bec-4046-beb2-f77a2591a911@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7698.013)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS7PR12MB8231:EE_
x-ms-office365-filtering-correlation-id: b89f7d3e-7c07-49eb-ad66-08dc90f70e67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|376011|1800799021|7416011|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?OWRaL1ExUkoxWVlWTjZDV3JZb0lZcnhDV1A0ZERFMjVmRkRqaEtnZFoxeHhs?=
 =?utf-8?B?YndwcDNOcFpUUHZoeEc0WE1HSk9sOUtUVmtMM054YTdvdm1lcWx1WGRGdlFp?=
 =?utf-8?B?U2V0V29tM29KTVd6Ni9OM0s3YW5ET0ppT1RCSDNzNzlxcWxielBlczlpNURF?=
 =?utf-8?B?N1lZZTBYM2ZxSXBrUVR0SzJFbWJxVnJGOG9YNE9QR1RMOWtZQkNhWVpic2RK?=
 =?utf-8?B?dnJXdFU1YlU2T1V5SnE0V2RrelIwcmZlZTNZNUxFdHdhaVFCSStqZ2hXTWN5?=
 =?utf-8?B?S1ZkQ1dpRFRobXZUaXE0WDZ5RkZTWUNzTE1xZlRsdUhKd2NTdHVXZUE3bEk1?=
 =?utf-8?B?MWhUN09mcXY0R0VDZkdvbUZEbEU5elhaUVlZNitKYVNiT3d5SkgrUFJXL3hV?=
 =?utf-8?B?VlhlMlpldVlWYVZxOEd2Sk1EWjdvRWhKNHNCZEdjYXlyb1hOS3NKNjRKalZi?=
 =?utf-8?B?SzdaUnZobE1ITWg5SXVHZjFXMFFYQXJDc2dWRU12Uy8xMS9xVjJnQjVpTEFC?=
 =?utf-8?B?L0hwckFMRytNdklUT2Z6L0tsa0IwOEZkY2o0OFJIOXJrQi9udXZDOVk1RDVN?=
 =?utf-8?B?NFl2ME1EdXZyMVovWS9BWlRVWnlTWVV2OTdGZHdMWkV2NGM2MFRZRFYrSG9t?=
 =?utf-8?B?eTdwT3hrbnRsQU0vZTFodVNmRkRhbi91eWNxMmFjMDcvRks0aE1BY1VLT0Ji?=
 =?utf-8?B?TTlvNVZsOFNMdDAzUi95SXloL2hYS2lYcEtJWjlMbmhMYWlTMHFYVWZhRzYr?=
 =?utf-8?B?QjVZWkhSeHpWbjlCSkUzL1FISDdRa2haOS9SbGtCamFsMjBndlNQaDJ5dlVX?=
 =?utf-8?B?aW50enRZUFZmdU9Uc2FwNSt6Qlk5QURNd2svejlVOUUwVkRBMmw4Wjh3MTRy?=
 =?utf-8?B?RmgxVGdVUnQ5RlBsR241bEROV0NSSkFsaHlHY01CblgzcU9jckhielU3L1d6?=
 =?utf-8?B?MFU0M0UxRlZzOXRQQktYZWo3TENzSTJDVUxlOUt6ZG1haUhJUXpGdXM3eFlU?=
 =?utf-8?B?NGx2VHFHZTR3UU5nZ1pOSlR1SGJ6c2pyR2VXVGw3Q3NnUnpuQzNsSG0wQTNT?=
 =?utf-8?B?STN5L3VPK09NQXhPeEo4d2hyZVBCOXRSS1p6enBPdTd0MlNPSjBzZTFaYzYw?=
 =?utf-8?B?V1o0cUM2VFlIWlFPUUZSZ2JkTUxPMEhvZzJDTVJJQzFkMTcxcitOckdMY3hr?=
 =?utf-8?B?dy93SEJ3M3BBcDlVM3RKM1IyMHNTdXpUdGJrUlhYbDlPRjc2VStySUxQQzFE?=
 =?utf-8?B?NWZLZW82cENyTDltdmpNUFpJdzhNYkcxR281VGhiS2ZEK0NpVXpIVmlFalZ4?=
 =?utf-8?B?Ylc4b0RzU0VybkxDVzIrZ09jbUxhWng4STdNUUlVMkFBWXlLQ3VQWk1OZi96?=
 =?utf-8?B?M2NHWmJQajd2Z0VwQW1Rd3BrcHQ5TjA3Yk1IV2VsdW41NWE0a2FXTHhwcmZV?=
 =?utf-8?B?bGVCZU5Ld21NVlY5MzhiWStkUGRwbU9Zc1NCdmd6QlAzL1lOT2tiQmJaZ1Bj?=
 =?utf-8?B?M3RVbmdvRmtMYTlvTUlsc0lrd240eGVsK01qOHJaNkZJTFFmZ0h5dmJIZ0VW?=
 =?utf-8?B?cDlWYjQyTi92N0xuaXE1WWhQaU4ySnRmSDNvR2lhRE12ZFdiQ2RJelp5OG5h?=
 =?utf-8?B?aFlpaXpKRGxId082eFI4SzhlSkpBd1Y2T1pxTUxpSVdJVWZxUUx4S3NUNmNG?=
 =?utf-8?B?alNwalV5Y29KcUpNa21qNTh2TFFiQUdZSjNFRnllNm5ZZUsrZGZkUjFpQ1Zi?=
 =?utf-8?B?d3hYY1J5WUZKTGJNUnp3b0cwR1ZIWFRzNVhIL1ZUUmNOUS9MdW8ybFJaN3pX?=
 =?utf-8?Q?cAQrpWWzDfJGMNmzi/Q1M5wwtumrkTl0PARBA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(7416011)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZE9zZC91Um8ybktMMDR5VmdyTkxoSGNNeFBFM2FYeis1L0oxL1VnOXIxRmow?=
 =?utf-8?B?azdteEcvVzlIcFlaaGhvQzY0VEFqeWF2OE9QYzgrOE82eE5rMXU3eGZuUkxj?=
 =?utf-8?B?dHpNY2ZPRVp1cGJnMEl3THpoVVFwY1NHTWV3T05Hc2R3endMTnZwZmNVbkRY?=
 =?utf-8?B?cVk2UHIrS1BEbEM1dkRGcGFkL3EySFpJMnlHL0JDRUxMUkNZQTQ2YWdwZFlS?=
 =?utf-8?B?bjNseXpCRzVtWlNhU25LL0JJaFZxRE1hWTNYZm94b2FFT1g0aEcyYmxRVHlv?=
 =?utf-8?B?Ym9JR0dpdzVXUkNBLzlCSFJaTXRlcWxDQWUwWGd2aityaUptcVg1cnFPQWw1?=
 =?utf-8?B?enYwSjFUMUloRnJqMWV1QVEyUDJaS1VZK3hoK3lnTHNlbTZkQmJmSGlpVWQ3?=
 =?utf-8?B?Unc3OVhUbDU1eWYvc3NsdXZXVVBMM3M2QTMvL1BJWGE3djJtbmR4K1FNcWgy?=
 =?utf-8?B?QVdmTkM1enZJdEwwREptRlBOR0c2dEliL0pOQVUxWEpJbnRXUXoyZGM5T3N3?=
 =?utf-8?B?LzA4K1RSbHlhMEdmcWxXeG1oWEh1QVRaNmh2TUN6Rk9KK3EzR1liVk5IaWVy?=
 =?utf-8?B?MEJuOTdDMjNQYUliTnpIeUx1RlZQNjB0YzNLR0M1bjdEbm5wSW1PS3dUSjJ1?=
 =?utf-8?B?dnJLOHJaeDlDTDNEdUQwaDVWZGFKZ0c3VmNGZm5jbzBtRldYZjd5emhrVHpn?=
 =?utf-8?B?elVLd211QVRxU3NzN2VtRG9HRGhsQUdhQ21IY09tRElZckxoc1phaXhCQ0Vx?=
 =?utf-8?B?aHV5YUpOemRlMGRJTk0xaWY2ajhvQjNPYURteUVLODExc0ZjRjZTTjl3SEti?=
 =?utf-8?B?MHh1VXN3cW9OOE1tY3BVRnlMUHY0VTViL3dicE42UXpmY2M3YWJhdVBuWnpj?=
 =?utf-8?B?ZHQ5OVFCNUhDZW9QYkQwd05kTllXWkRUU0VqS21SbTNCM2pZY3dXOUJ1K0JI?=
 =?utf-8?B?cXppYytUcks4aWFXMFcxNVRtS2VzRUNzSXJ1RWl3YnhQV2ZtdnBCSXVZYUgz?=
 =?utf-8?B?bGNodGZ4UlNrdndDWUNOL21qVHdSdjVJK3Q0SnBxZWUxNEM3d0xNZlBXWGZK?=
 =?utf-8?B?V2hqQUxRS2RUclEwZmx1YTdmSVo2MUtzOHNpM0oycG5rblZlRXQ3bUFQdHZL?=
 =?utf-8?B?NUk1NnpKVWYzOVl5aXdXZVFuRzNodnZXMmp0UXJTUTREL0V0RHRpU0lFOGU4?=
 =?utf-8?B?YnZES0huRTJ1RkRaQ3dYaEF0MjdlcEpCMU9YK3Y5SE1OY2liNUdKOGZIdTZr?=
 =?utf-8?B?QlVxTEx5aGFVZ3B3WGgrdVZjT2k2UjRsMWNjbzlhOHFsMG01ZmlMeS8rK2lj?=
 =?utf-8?B?Z09EdU9PKzNNYjFVb240L3hUNllTak9YWXRBbi9JVDhsQWVCT3QyQjhHTFBS?=
 =?utf-8?B?ODRQTFdJRzRxOFRjcEpFaEdOdVhtVEliVVMvU2t1SW1YSHkxUnVKYzJIYllw?=
 =?utf-8?B?ajBOMVpmTzAwMHZIVjNqSjQ1UXJMMDJUZ1VjbTVuMnFGSHJzcXdPRTFYc3l5?=
 =?utf-8?B?UzFscUpUUklRaGxoYU9RVWpQYUJqTGJkcVVGakd1QmlhV01HbU5mR21WR2RP?=
 =?utf-8?B?ZXo0UkpiYmNxNThUM0tlamtKOTFBRDRSQWxweUx4YUhtWjMxSjNLb281ODc4?=
 =?utf-8?B?ZWR5K0ZwK1RpaUNSeUJmMjZKejZkVDZDejd1dC8za1QwZlpTZGN3V2FrUXpB?=
 =?utf-8?B?WVMrK0E0cG16c3ovWUdyb2pHR0lGdU5sa1hQUzVBcjFVLzBsTndNdWpzR1RY?=
 =?utf-8?B?bWFUVnBXWFY3YlVGVllhWUJLZ25OMDFQbHFyVzV5YXdZbGlGNk5JZHhZOTc0?=
 =?utf-8?B?ek1SQXU4U2NpeUc4Q0N1ZjYveTM4ZFN1aWZieUZUYi9kNmdVbHpvclphdXNK?=
 =?utf-8?B?eGY4eWVoMXZrODROckh2c3BSL05Sei9vbTRHZWQ3S1pSR3RDaWVEeU5EbGYy?=
 =?utf-8?B?ZHpiQVZXMkEvV1pWQTB2Q1Bad3RYT3BBemtaOUl3TXBOaWNXV3pGVVlxRTZ6?=
 =?utf-8?B?MnVJdm5uS01IRzkzVlNaUGVJUzVZMWRCSnZYTlRWQWhiL3lZcDMvWDBIRkxt?=
 =?utf-8?B?OUE2MkVpOW1UMzl3L1cxbURwQzNOb3A0U2gxM2hZT25EN2htL2h3MGd5cHNs?=
 =?utf-8?Q?hnn0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0C564795D1A4446A21E0550967D455A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b89f7d3e-7c07-49eb-ad66-08dc90f70e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 07:03:15.2278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: satREuysa0aidf1QCVLFrX2L4EN78hcmhVoy5xJ7KX2Gi4nPLC/dnaPvz4+P09wPhmqpfH7QG1R0CqYX4h4naA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8231

T24gMjAyNC82LzE4IDE3OjEzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMDYuMjAyNCAx
MDoxMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzE3IDIzOjEwLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNy4wNi4yMDI0IDExOjAwLCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gLS0tIGEvdG9vbHMvaW5jbHVkZS94ZW4tc3lzL0xpbnV4L3ByaXZjbWQuaA0KPj4+PiAr
KysgYi90b29scy9pbmNsdWRlL3hlbi1zeXMvTGludXgvcHJpdmNtZC5oDQo+Pj4+IEBAIC05NSw2
ICs5NSwxMSBAQCB0eXBlZGVmIHN0cnVjdCBwcml2Y21kX21tYXBfcmVzb3VyY2Ugew0KPj4+PiAg
CV9fdTY0IGFkZHI7DQo+Pj4+ICB9IHByaXZjbWRfbW1hcF9yZXNvdXJjZV90Ow0KPj4+PiAgDQo+
Pj4+ICt0eXBlZGVmIHN0cnVjdCBwcml2Y21kX2dzaV9mcm9tX2RldiB7DQo+Pj4+ICsJX191MzIg
c2JkZjsNCj4+Pg0KPj4+IFRoYXQncyBQQ0ktY2VudHJpYywgd2l0aG91dCBzdHJ1Y3QgYW5kIElP
Q1RMIG5hbWVzIHJlZmxlY3RpbmcgdGhpcyBmYWN0Lg0KPj4gU28sIGNoYW5nZSB0byBwcml2Y21k
X2dzaV9mcm9tX3BjaWRldiA/DQo+IA0KPiBUaGF0J3Mgd2hhdCBJJ2Qgc3VnZ2VzdCwgeWVzLiBC
dXQgcmVtZW1iZXIgdGhhdCBpdCdzIHRoZSBrZXJuZWwgbWFpbnRhaW5lcnMNCj4gd2hvIGhhdmUg
dGhlIHVsdGltYXRlIHNheSBoZXJlLCBhcyBoZXJlIHlvdSdyZSBvbmx5IG1ha2luZyBhIGNvcHkg
b2Ygd2hhdA0KPiB0aGUgY2Fub25pY2FsIGhlYWRlciAoaW4gdGhlIGtlcm5lbCB0cmVlKSBpcyBn
b2luZyB0byBoYXZlLg0KT0ssIHRoZW4gbGV0J3Mgd2FpdCBmb3IgdGhlIGNvcnJlc3BvbmRpbmcg
cGF0Y2ggb24ga2VybmVsIHNpZGUgdG8gYmUgYWNjZXB0ZWQgZmlyc3QuDQo+IA0KPj4+PiArCWlu
dCBnc2k7DQo+Pj4NCj4+PiBJcyAiaW50IiBsZWdpdGltYXRlIHRvIHVzZSBoZXJlPyBEb2Vzbid0
IHRoaXMgd2FudCB0byBzaW1pbGFybHkgYmUgX191MzI/DQo+PiBJIHdhbnQgdG8gc2V0IGdzaSB0
byBuZWdhdGl2ZSBpZiB0aGVyZSBpcyBubyByZWNvcmQgb2YgdGhpcyB0cmFuc2xhdGlvbi4NCj4g
DQo+IFRoZXJlIGFyZSBzdXJlbHkgbW9yZSBleHBsaWNpdCB3YXlzIHRvIHNpZ25hbCB0aGF0IGNh
c2U/DQpNYXliZSwgSSB3aWxsIHRoaW5rIGFib3V0IHRoZSBpbXBsZW1lbnRhdGlvbiBvbiBrZXJu
ZWwgc2lkZSBhZ2Fpbi4NCj4gDQo+Pj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNp
LmMNCj4+Pj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0KPj4+PiBAQCAtMTQw
Niw2ICsxNDA2LDEyIEBAIHN0YXRpYyBib29sIHBjaV9zdXBwX2xlZ2FjeV9pcnEodm9pZCkNCj4+
Pj4gICNlbmRpZg0KPj4+PiAgfQ0KPj4+PiAgDQo+Pj4+ICsjZGVmaW5lIFBDSV9ERVZJRChidXMs
IGRldmZuKVwNCj4+Pj4gKyAgICAgICAgICAgICgoKCh1aW50MTZfdCkoYnVzKSkgPDwgOCkgfCAo
KGRldmZuKSAmIDB4ZmYpKQ0KPj4+PiArDQo+Pj4+ICsjZGVmaW5lIFBDSV9TQkRGKHNlZywgYnVz
LCBkZXZmbikgXA0KPj4+PiArICAgICAgICAgICAgKCgoKHVpbnQzMl90KShzZWcpKSA8PCAxNikg
fCAoUENJX0RFVklEKGJ1cywgZGV2Zm4pKSkNCj4+Pg0KPj4+IEknbSBub3QgYSBtYWludGFpbmVy
IG9mIHRoaXMgZmlsZTsgaWYgSSB3ZXJlLCBJJ2QgYXNrIHRoYXQgZm9yIHJlYWRhYmlsaXR5J3MN
Cj4+PiBzYWtlIGFsbCBleGNlc3MgcGFyZW50aGVzZXMgYmUgZHJvcHBlZCBmcm9tIHRoZXNlLg0K
Pj4gSXNuJ3QgaXQgYSBjb2RpbmcgcmVxdWlyZW1lbnQgdG8gZW5jbG9zZSBlYWNoIGVsZW1lbnQg
aW4gcGFyZW50aGVzZXMgaW4gdGhlIG1hY3JvIGRlZmluaXRpb24/DQo+PiBJdCBzZWVtcyBvdGhl
ciBmaWxlcyBhbHNvIGRvIHRoaXMuIFNlZSB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2ludGVybmFs
LmgNCj4gDQo+IEFzIHNhaWQsIEknbSBub3QgYSBtYWludGFpbmVyIG9mIHRoaXMgY29kZS4gWWV0
IHdoaWxlIEknbSBhd2FyZSB0aGF0IGxpYnhsDQo+IGhhcyBpdHMgb3duIENPRElOR19TVFlMRSwg
SSBjYW4ndCBzcG90IGFueXRoaW5nIHRvd2FyZHMgZXhjZXNzaXZlIHVzZSBvZg0KPiBwYXJlbnRo
ZXNlcyB0aGVyZS4NClNvLCB3aGljaCBwYXJlbnRoZXNlcyBkbyB5b3UgdGhpbmsgYXJlIGV4Y2Vz
c2l2ZSB1c2U/DQo+IA0KPj4+PiBAQCAtMTQ4Niw2ICsxNDk2LDE4IEBAIHN0YXRpYyB2b2lkIHBj
aV9hZGRfZG1fZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+Pj4+ICAgICAgICAgIGdvdG8gb3V0X25v
X2lycTsNCj4+Pj4gICAgICB9DQo+Pj4+ICAgICAgaWYgKChmc2NhbmYoZiwgIiV1IiwgJmlycSkg
PT0gMSkgJiYgaXJxKSB7DQo+Pj4+ICsjaWZkZWYgQ09ORklHX1g4Ng0KPj4+PiArICAgICAgICBz
YmRmID0gUENJX1NCREYocGNpLT5kb21haW4sIHBjaS0+YnVzLA0KPj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgKFBDSV9ERVZGTihwY2ktPmRldiwgcGNpLT5mdW5jKSkpOw0KPj4+PiArICAg
ICAgICBnc2kgPSB4Y19waHlzZGV2X2dzaV9mcm9tX2RldihjdHgtPnhjaCwgc2JkZik7DQo+Pj4+
ICsgICAgICAgIC8qDQo+Pj4+ICsgICAgICAgICAqIE9sZCBrZXJuZWwgdmVyc2lvbiBtYXkgbm90
IHN1cHBvcnQgdGhpcyBmdW5jdGlvbiwNCj4+Pg0KPj4+IEp1c3Qga2VybmVsPw0KPj4gWWVzLCB4
Y19waHlzZGV2X2dzaV9mcm9tX2RldiBkZXBlbmRzIG9uIHRoZSBmdW5jdGlvbiBpbXBsZW1lbnRl
ZCBvbiBsaW51eCBrZXJuZWwgc2lkZS4NCj4gDQo+IE9rYXksIGFuZCB3aGVuIHRoZSBrZXJuZWwg
c3VwcG9ydHMgaXQgYnV0IHRoZSB1bmRlcmx5aW5nIGh5cGVydmlzb3IgZG9lc24ndA0KPiBzdXBw
b3J0IHdoYXQgdGhlIGtlcm5lbCB3YW50cyB0byB1c2UgaW4gb3JkZXIgdG8gZnVsZmlsbCB0aGUg
cmVxdWVzdCwgYWxsDQpJIGRvbid0IGtub3cgd2hhdCB0aGluZ3MgeW91IG1lbnRpb25lZCBoeXBl
cnZpc29yIGRvZXNuJ3Qgc3VwcG9ydCBhcmUsDQpiZWNhdXNlIHhjX3BoeXNkZXZfZ3NpX2Zyb21f
ZGV2IGlzIHRvIGdldCB0aGUgZ3NpIG9mIHBjaWRldiB0aHJvdWdoIHNiZGYgaW5mb3JtYXRpb24s
DQp0aGF0IHJlbGF0aW9uc2hpcCBjYW4gYmUgZ290IG9ubHkgaW4gZG9tMCBpbnN0ZWFkIG9mIFhl
biBoeXBlcnZpc29yLg0KDQo+IGlzIGZpbmU/IChTZWUgYWxzbyBiZWxvdyBmb3Igd2hhdCBtYXkg
YmUgbmVlZGVkIGluIHRoZSBoeXBlcnZpc29yLCBldmVuIGlmDQpZb3UgbWVhbiB4Y19waHlzZGV2
X21hcF9waXJxIG5lZWRzIGdzaT8NCg0KPiB0aGlzIElPQ1RMIHdvdWxkIGJlIHNhdGlzZmllZCBi
eSB0aGUga2VybmVsIHdpdGhvdXQgbmVlZGluZyB0byBpbnRlcmFjdCB3aXRoDQo+IHRoZSBoeXBl
cnZpc29yLikNCj4gDQo+Pj4+ICsgICAgICAgICAqIHNvIGlmIGZhaWwsIGtlZXAgdXNpbmcgaXJx
OyBpZiBzdWNjZXNzLCB1c2UgZ3NpDQo+Pj4+ICsgICAgICAgICAqLw0KPj4+PiArICAgICAgICBp
ZiAoZ3NpID4gMCkgew0KPj4+PiArICAgICAgICAgICAgaXJxID0gZ3NpOw0KPj4+DQo+Pj4gSSdt
IHN0aWxsIHB1enpsZWQgYnkgdGhpcywgd2hlbiBieSBub3cgSSB0aGluayB3ZSd2ZSBzdWZmaWNp
ZW50bHkgY2xhcmlmaWVkDQo+Pj4gdGhhdCBJUlFzIGFuZCBHU0lzIHVzZSB0d28gZGlzdGluY3Qg
bnVtYmVyaW5nIHNwYWNlcy4NCj4+Pg0KPj4+IEFsc28sIGFzIHByZXZpb3VzbHkgaW5kaWNhdGVk
LCB5b3UgY2FsbCB0aGlzIGZvciBQViBEb20wIGFzIHdlbGwuIEFpdWkgb24NCj4+PiB0aGUgYXNz
dW1wdGlvbiB0aGF0IGl0J2xsIGZhaWwuIFdoYXQgaWYgd2UgZGVjaWRlIHRvIG1ha2UgdGhlIGZ1
bmN0aW9uYWxpdHkNCj4+PiBhdmFpbGFibGUgdGhlcmUsIHRvbyAoaWYgb25seSBmb3IgaW5mb3Jt
YXRpb25hbCBwdXJwb3Nlcywgb3IgZm9yDQo+Pj4gY29uc2lzdGVuY3kpPyBTdWRkZW5seSB5b3Un
cmUgZmFsbGJhY2sgbG9naWMgd291bGRuJ3Qgd29yayBhbnltb3JlLCBhbmQNCj4+PiB5b3UnZCBj
YWxsIC4uLg0KPj4+DQo+Pj4+ICsgICAgICAgIH0NCj4+Pj4gKyNlbmRpZg0KPj4+PiAgICAgICAg
ICByID0geGNfcGh5c2Rldl9tYXBfcGlycShjdHgtPnhjaCwgZG9taWQsIGlycSwgJmlycSk7DQo+
Pj4NCj4+PiAuLi4gdGhlIGZ1bmN0aW9uIHdpdGggYSBHU0kgd2hlbiBhIHBJUlEgaXMgbWVhbnQu
IEltbywgYXMgc3VnZ2VzdGVkIGJlZm9yZSwNCj4+PiB5b3Ugc3RyaWN0bHkgd2FudCB0byBhdm9p
ZCB0aGUgY2FsbCBvbiBQViBEb20wLg0KPj4+DQo+Pj4gQWxzbyBmb3IgUFZIIERvbTA6IEkgZG9u
J3QgdGhpbmsgSSd2ZSBzZWVuIGNoYW5nZXMgdG8gdGhlIGh5cGVyY2FsbA0KPj4+IGhhbmRsaW5n
LCB5ZXQuIEhvdyBjYW4gdGhhdCBiZSB3aGVuIEdTSSBhbmQgSVJRIGFyZW4ndCB0aGUgc2FtZSwg
YW5kIGhlbmNlDQo+Pj4gaW5jb21pbmcgR1NJIHdvdWxkIG5lZWQgdHJhbnNsYXRpbmcgdG8gSVJR
IHNvbWV3aGVyZT8gSSBjYW4gb25jZSBhZ2FpbiBvbmx5DQo+Pj4gYXNzdW1lIGFsbCB5b3VyIHRl
c3Rpbmcgd2FzIGRvbmUgd2l0aCBJUlFzIHdob3NlIG51bWJlcnMgaGFwcGVuZWQgdG8gbWF0Y2gN
Cj4+PiB0aGVpciBHU0kgbnVtYmVycy4gKFRoZSBkaWZmZXJlbmNlLCBpbW8sIHdvdWxkIGFsc28g
bmVlZCBjYWxsaW5nIG91dCBpbiB0aGUNCj4+PiBwdWJsaWMgaGVhZGVyLCB3aGVyZSB0aGUgcmVz
cGVjdGl2ZSBpbnRlcmZhY2Ugc3RydWN0KHMpIGlzL2FyZSBkZWZpbmVkLikNCj4+IEkgZmVlbCBs
aWtlIHlvdSBtaXNzZWQgb3V0IG9uIG1hbnkgb2YgdGhlIHByZXZpb3VzIGRpc2N1c3Npb25zLg0K
Pj4gV2l0aG91dCBteSBjaGFuZ2VzLCB0aGUgb3JpZ2luYWwgY29kZXMgdXNlIGlycSAocmVhZCBm
cm9tIGZpbGUgL3N5cy9idXMvcGNpL2RldmljZXMvPHNiZGY+L2lycSkgdG8gZG8geGNfcGh5c2Rl
dl9tYXBfcGlycSwNCj4+IGJ1dCB4Y19waHlzZGV2X21hcF9waXJxIHJlcXVpcmUgcGFzc2luZyBp
bnRvIGdzaSBpbnN0ZWFkIG9mIGlycSwgc28gd2UgbmVlZCB0byB1c2UgZ3NpIHdoZXRoZXIgZG9t
MCBpcyBQViBvciBQVkgsIHNvIGZvciB0aGUgb3JpZ2luYWwgY29kZXMsIHRoZXkgYXJlIHdyb25n
Lg0KPj4gSnVzdCBiZWNhdXNlIGJ5IGNoYW5jZSwgdGhlIGlycSB2YWx1ZSBpbiB0aGUgTGludXgg
a2VybmVsIG9mIHB2IGRvbTAgaXMgZXF1YWwgdG8gdGhlIGdzaSB2YWx1ZSwgc28gdGhlcmUgd2Fz
IG5vIHByb2JsZW0gd2l0aCB0aGUgb3JpZ2luYWwgcHYgcGFzc3Rocm91Z2guDQo+PiBCdXQgbm90
IHdoZW4gdXNpbmcgUFZILCBzbyBwYXNzdGhyb3VnaCBmYWlsZWQuDQo+PiBXaXRoIG15IGNoYW5n
ZXMsIEkgZ290IGdzaSB0aHJvdWdoIGZ1bmN0aW9uIHhjX3BoeXNkZXZfZ3NpX2Zyb21fZGV2IGZp
cnN0bHksIGFuZCB0byBiZSBjb21wYXRpYmxlIHdpdGggb2xkIGtlcm5lbCB2ZXJzaW9ucyhpZiB0
aGUgaW9jdGwNCj4+IElPQ1RMX1BSSVZDTURfR1NJX0ZST01fREVWIGlzIG5vdCBpbXBsZW1lbnRl
ZCksIEkgc3RpbGwgbmVlZCB0byB1c2UgdGhlIGlycSBudW1iZXIsIHNvIEkgbmVlZCB0byBjaGVj
ayB0aGUgcmVzdWx0DQo+PiBvZiBnc2ksIGlmIGdzaSA+IDAgbWVhbnMgSU9DVExfUFJJVkNNRF9H
U0lfRlJPTV9ERVYgaXMgaW1wbGVtZW50ZWQgSSBjYW4gdXNlIHRoZSByaWdodCBvbmUgZ3NpLCBv
dGhlcndpc2Uga2VlcCB1c2luZyB3cm9uZyBvbmUgaXJxLiANCj4gDQo+IEkgdW5kZXJzdGFuZCBh
bGwgb2YgdGhpcywgdG8gYSAoSSB0aGluaykgc3VmZmljaWVudCBkZWdyZWUgYXQgbGVhc3QuIFll
dCB3aGF0DQo+IHlvdSdyZSBlZmZlY3RpdmVseSBwcm9wb3NpbmcgKHdpdGhvdXQgZXhwbGljaXRs
eSBzYXlpbmcgc28pIGlzIHRoYXQgZS5nLg0KPiBzdHJ1Y3QgcGh5c2Rldl9tYXBfcGlycSdzIHBp
cnEgZmllbGQgc3VkZGVubHkgbWF5IG5vIGxvbmdlciBob2xkIGEgcElSUQ0KPiBudW1iZXIsIGJ1
dCAod2hlbiB0aGUgY2FsbGVyIGlzIFBWSCkgYSBHU0kuIFRoaXMgbWF5IGJlIGEgbmVjZXNzYXJ5
IGFkanVzdG1lbnQNCj4gdG8gbWFrZSAoc2ltcGx5IGJlY2F1c2UgdGhlIGNhbGxlciBtYXkgaGF2
ZSBubyB3YXkgdG8gZXhwcmVzcyB0aGluZ3MgaW4gcElSUQ0KPiB0ZXJtcyksIGJ1dCB0aGVuIHN1
aXRhYmxlIGFkanVzdG1lbnRzIHRvIHRoZSBoYW5kbGluZyBvZiBQSFlTREVWT1BfbWFwX3BpcnEN
Cj4gd291bGQgYmUgbmVjZXNzYXJ5LiBJbiBmYWN0IHRoYXQgZmllbGQgaXMgcHJlc2VudGx5IG1h
cmtlZCBhcyAiSU4gb3IgT1VUIjsNCj4gd2hlbiByZS1wdXJwb3NlZCB0byB0YWtlIGEgR1NJIG9u
IGlucHV0LCBpdCBtYXkgZW5kIHVwIGJlaW5nIG5lY2Vzc2FyeSB0byBwYXNzDQo+IGJhY2sgdGhl
IHBJUlEgKGluIHRoZSBzdWJqZWN0IGRvbWFpbidzIG51bWJlcmluZyBzcGFjZSkuIE9yIGFsdGVy
bmF0aXZlbHkgaXQNCj4gbWF5IGJlIG5lY2Vzc2FyeSB0byBhZGQgeWV0IGFub3RoZXIgc3ViLWZ1
bmN0aW9uIHNvIHRoZSBHU0kgY2FuIGJlIHRyYW5zbGF0ZWQNCj4gdG8gdGhlIGNvcnJlc3BvbmRp
bmcgcElSUSBmb3IgdGhlIGRvbWFpbiB0aGF0J3MgZ29pbmcgdG8gdXNlIHRoZSBJUlEsIGZvciB0
aGF0DQo+IHRoZW4gdG8gYmUgcGFzc2VkIGludG8gUEhZU0RFVk9QX21hcF9waXJxLg0KSWYgSSB1
bmRlcnN0b29kIGNvcnJlY3RseSwgeW91ciBjb25jZXJucyBhYm91dCB0aGlzIHBhdGNoIGFyZSB0
d286DQpGaXJzdCwgd2hlbiBkb20wIGlzIFBWLCBJIHNob3VsZCBub3QgdXNlIHhjX3BoeXNkZXZf
Z3NpX2Zyb21fZGV2IHRvIGdldCBnc2kgdG8gZG8geGNfcGh5c2Rldl9tYXBfcGlycSwgSSBzaG91
bGQga2VlcCB0aGUgb3JpZ2luYWwgY29kZSB0aGF0IHVzZSBpcnEuDQpTZWNvbmQsIHdoZW4gZG9t
MCBpcyBQVkgsIEkgZ2V0IHRoZSBnc2ksIGJ1dCBJIHNob3VsZCBub3QgcGFzcyBnc2kgYXMgdGhl
IGZvdXJ0aCBwYXJhbWV0ZXIgb2YgeGNfcGh5c2Rldl9tYXBfcGlycSwgSSBzaG91bGQgY3JlYXRl
IGEgbmV3IGxvY2FsIHBhcmFtZXRlciBwaXJxPS0xLCBhbmQgcGFzcyBpdCBpbi4NCg0KPiANCj4+
IEFuZCByZWdhcmRpbmcgdG8gdGhlIGltcGxlbWVudGF0aW9uIG9mIGlvY3RsIElPQ1RMX1BSSVZD
TURfR1NJX0ZST01fREVWLCBpdCBkb2Vzbid0IGhhdmUgYW55IHhlbiBoZXlwZXJjYWxsIGhhbmRs
aW5nIGNoYW5nZXMsIGFsbCBvZiBpdHMgcHJvY2Vzc2luZyBsb2dpYyBpcyBvbiB0aGUga2VybmVs
IHNpZGUuDQo+PiBJIGtub3csIHNvIHlvdSBtaWdodCB3YW50IHRvIHNheSwgIlRoZW4geW91IHNo
b3VsZG4ndCBwdXQgdGhpcyBpbiB4ZW4ncyBjb2RlLiIgQnV0IHRoaXMgY29uY2VybiB3YXMgZGlz
Y3Vzc2VkIGluIHByZXZpb3VzIHZlcnNpb25zLCBhbmQgc2luY2UgdGhlIHBjaSBtYWludGFpbmVy
IGRpc2FsbG93ZWQgdG8gYWRkDQo+PiBnc2kgc3lzZnMgb24gbGludXgga2VybmVsIHNpZGUsIEkg
aGFkIHRvIGRvIHNvLg0KPiANCj4gUmlnaHQsIGJ1dCB0aGlzIGlzIGEgc2VwYXJhdGUgYXNwZWN0
ICh3aGljaCB3ZSBzaW1wbHkgbmVlZCB0byBsaXZlIHdpdGggb24NCj4gdGhlIFhlbiBzaWRlKS4N
Cj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

