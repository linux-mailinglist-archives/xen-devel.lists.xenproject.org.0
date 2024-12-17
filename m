Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB19F4335
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 06:54:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858531.1270765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNQWL-00037Z-CF; Tue, 17 Dec 2024 05:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858531.1270765; Tue, 17 Dec 2024 05:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNQWL-00034t-9G; Tue, 17 Dec 2024 05:53:25 +0000
Received: by outflank-mailman (input) for mailman id 858531;
 Tue, 17 Dec 2024 05:53:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRub=TK=amd.com=Julia.Zhang@srs-se1.protection.inumbo.net>)
 id 1tNQWJ-00034l-S0
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 05:53:24 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20612.outbound.protection.outlook.com
 [2a01:111:f403:2405::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 384ed372-bc3b-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 06:53:21 +0100 (CET)
Received: from IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 by CH3PR12MB9022.namprd12.prod.outlook.com (2603:10b6:610:171::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 05:53:16 +0000
Received: from IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::dc05:a63a:39fa:ff0b]) by IA1PR12MB6532.namprd12.prod.outlook.com
 ([fe80::dc05:a63a:39fa:ff0b%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 05:53:16 +0000
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
X-Inumbo-ID: 384ed372-bc3b-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6n+44GswTyA57dJlTcX/rn8/lKqzQ0SEOEdkJ12GVdwb/PFFgUKXbuQZjJ0yiggG5nqXOryrZo6ZOoP+gUHqXF5WgbQPSww3Q/lZJS73xoA2/JF43yolg9kcKWHK6PCEIYjSiTKiO0vJTg2dP9MjaNlXHauGtRkyNUetU8X7WWUUiGI8xEjVAFc2pF9MGPFImC9Zaxs50vHu6uZYhkTbT8OI218wwucQbhpeFx38JeG6Jks1weZHD/5FDnOgdxAcSwrMa5wvX/dQpyLlBaCHA+AmkwjIfr2wtqCh6zyrQluvIYDp0kSqhJ0zTOQF1LNjqTzrqXvxnjpJBHyxWupWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQjo+foXW4GrxqAlNn9I1avTjrdIPXkP5vixCW4C/ro=;
 b=IcHUGO/vJHOUVJYpUvyRJ4zmzXwjbxhEy/QXpvi/SWpTZtX8b1NsTow0YjA2d8DyoFqsD2Y2sewbz78pk/Dt1AZ+tglSTgOjmxZH/HHvOCYVHPKZRdP+ofWX3+m93pA8rX9ZY6muclmjWRaSOoQEdJ8HqCyN5IE8AaklY0BXx7mlesHROk1+o6J1Ha0vEhKXmuVSDHizdlMYHb36Zlr4vHrDw4/If/NmyaAj95AXhn5WpoqBG4EVisOQPIeEYcDvrN3Vcq/uk4fEfo6a+b3ILSmFDsYjAsV4Fy6xDhzGBuiY6BOzZvFnQA+8bqOnzTiELHl9pKzVij+M6ftw70SGwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQjo+foXW4GrxqAlNn9I1avTjrdIPXkP5vixCW4C/ro=;
 b=iXdHf57FPSsu54/vUIFN99o8c+VjDDbUbYzBaAvB9TZlYP3Q9w0O9CElQdwFBNjVdF/TNEhCKj/guOGcTrKd8sx47A6AqwYJLaYX2no4oLAPBicoinkeTFO9IXnmgoClKVrDxPvI5kLyTvYIqsFY0FoUYfCwZqrjiP6J0+o6/Tw=
From: "Zhang, Julia" <Julia.Zhang@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
	<Christian.Koenig@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Penny,
 Zheng" <penny.zheng@amd.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>, Paul
 Durrant <paul@xen.org>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Juergen Gross <jgross@suse.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: add privcmd ioctl to get p2pdma_distance
Thread-Topic: [PATCH] xen: add privcmd ioctl to get p2pdma_distance
Thread-Index: AQHbSJdDNMdfRsD4vkSvz8Ngpfn4L7LdjBaAgAuOxQD//4svAIAB3fOA
Date: Tue, 17 Dec 2024 05:53:16 +0000
Message-ID:
 <IA1PR12MB65325D9E7C0FA79B1928A646F2042@IA1PR12MB6532.namprd12.prod.outlook.com>
References: <20241207105946.542491-1-julia.zhang@amd.com>
 <03504a1e-c801-47fc-ac66-ab7e10ab6695@suse.com>
 <IA1PR12MB6532F32D012A63000F34823AF23B2@IA1PR12MB6532.namprd12.prod.outlook.com>
 <0284d807-ae85-4d43-93b5-91fb29528d62@suse.com>
In-Reply-To: <0284d807-ae85-4d43-93b5-91fb29528d62@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB6532.namprd12.prod.outlook.com
 (15.20.8251.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6532:EE_|CH3PR12MB9022:EE_
x-ms-office365-filtering-correlation-id: 71e947d3-6300-4dc0-5f86-08dd1e5f1a0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZEgxTTNvUHJSM040ci9DSk9YVVgrZkNCV3d5bmRMdzhkTlExZzBrb2c5ZURz?=
 =?utf-8?B?U25CRW0xVVdlQ210d3Vnb09GS2FZZHg1aG91cGRCT2dYRTVYU1RwQVpTSmNq?=
 =?utf-8?B?bkx2aitHeElsMFZvaUpCSVg0YkE4Z3F5Z1dQSkJ2bVZYdW9vRytEa0hCeTNH?=
 =?utf-8?B?bGNrR1RhQnV1QURFZlZRNTZBeEVNcFJFcnBrZ01TdHhpek1zYzNNZTVKWHNT?=
 =?utf-8?B?NGxpWHRKemlGM05wbjdBbUpkVCtrMDVhRm9iSjBpaFphUUN0Q0Zta21TTXZ1?=
 =?utf-8?B?aCtVeWZaSVpHNlNsdStTdEdSVDJQUjByZUY2ZDl1Rk9RelFBU1NQaUtnakIv?=
 =?utf-8?B?OHplVG5Fa2ltbVB5QUhQTUg0UVJnRHoyNmNKV0lnZ3VaaWFXM1A2V3hLU2Fz?=
 =?utf-8?B?cDJIcVNmWUdVRHRrdWZwYTkvTHl1WHNQTFJBMDhwZmtqR3Y2TTNBT1I4Um5r?=
 =?utf-8?B?SXM0bUNNVFdYbFJSYi9Id0RNeHF3Q3BlZmxGUzdadTByY3dQVEFXSjM1UGNR?=
 =?utf-8?B?YWFzaDR4cVBDcDIyUFcyaVAxZm1mdVZYMG9EY3A1RWNOTVZBdlkySE1FZHBP?=
 =?utf-8?B?WlhLMWlBSXZBRjQvZzdRM2QzaEpJTkpjN2l1TXlHT2w4ZjJqb1NjeEFEOGR5?=
 =?utf-8?B?cmJVTXQ1Y2wxTjZRbVVLaEtyZ3JzTHpvNUNSZ24wZ1FIUHcrOVoxVmxFV3l0?=
 =?utf-8?B?b1JuR3VYUzZwZS9rVnpUNzRsVHhyRUN1cDl4amFxQzl5UnVSTWltZFhnZU5E?=
 =?utf-8?B?OGJVRDFGS241NFk0QmUvbkVwQzNCb3g4R2wzRFNQZDVMSXJFV1lHYkVYYUpE?=
 =?utf-8?B?bk1xRkZOejFmSGdjWHp5NTNIbGl2L2V5M01zVGVJVVN6OHVmZkwrYWgxSy9M?=
 =?utf-8?B?ZXNHWElaeXFQR1lWRGQ4T0FtUDA5YStlWEVlR1RqSnl1L1pBbDg1Q0hGTjNy?=
 =?utf-8?B?VTZYcEV1bGJwTEEyTGQ2OEIrd1FDNmpnQ0F1aE91N243eWpkUFRZeDAwbWh4?=
 =?utf-8?B?ZFFQVHBKWGJZRGxsU3c3Q20yczEvL3pZS3g0VndGM08weTBMK0lJcUZuUUtY?=
 =?utf-8?B?cmpMOGN3dU5SZ20yV1lFdEI0K2cwNlhMYWdRVXRXYjBSa090K1k2cHFIc3Y4?=
 =?utf-8?B?dDRCMWxYZFZGYkpxdEdpMDdjVlRVNUM3RUhCN0h0OUJ2RmV4WVhkY1BIOGNu?=
 =?utf-8?B?UEtMN0RxcXhLbUZGU2Y2Q1VIQnNPd0d6SjJscWV3Z2YrTHg4KzVKM1lqZUdh?=
 =?utf-8?B?K1BQQSt6azZKMU5HZmNhL0tHQm80NDJpQjBvbzM0R2hHTEhGR3JDSElSK0g0?=
 =?utf-8?B?OE5sN0JjaXI2V2FsK3VQRFVDOGZwNlNWKzBWUmR2RVZMdEJBUHljaHFsTkps?=
 =?utf-8?B?NWI5SzlWTnFJWDVtRTgrL2FHZ056a2thQnpxS1ZKakc1V3dEaFh4Sld3WVBz?=
 =?utf-8?B?a2xvd1FmUkh5b3liTlFzbWdzMThyZWQvQ21Tam1PY0I2NDhWRTZKM2owekdo?=
 =?utf-8?B?bU0yenBWUnB4d2JRa2E4RDltT3I4WXFmT1FlSWM3eWc2V1htTnA5OUw4NUVZ?=
 =?utf-8?B?bFMxZVh4cHdmcFF3UnBIL3lJWTNLZ29yNEVoUk82ckxPREpqQ1JuRGRPU0tk?=
 =?utf-8?B?N2RyQnBzbDJNSnYwSkxJN1ROUmlLMnhQaThkMmljb21XeVMwRDQ2bVhlZ1NV?=
 =?utf-8?B?eFFyMmhaVnI1VXhEK3p4UFhBTXBxVkxBU1Z3ZlNxRlNxNjQ4c09NRlJ1MDl0?=
 =?utf-8?B?OCsyTmFyelJqK3pWTXpjU0RwNFg2dmtobmw4cCtRQ0FDQml1RjA3ZmkreEp6?=
 =?utf-8?B?bU5RbjdTUkE5ckZRK2tydVI5bUdxL1ltZ1U5dHdqc0pYOXBVendGRDlyN0Vw?=
 =?utf-8?B?U0Qxd295MXJuOUtRZTRXRkN4aGNsZ2QycXprVEJEb1I0UXQyZHhuSHpNaGRx?=
 =?utf-8?Q?L54UvnLi7Zhqsjw2smPlcU3IZ+VEoJYW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6532.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVBYU2dzeDJYRlJzS3dycVNGSEg0OEdneC9hYUdYYmxjczdGR2JQd2NpWnFI?=
 =?utf-8?B?b2ovQjcrcTYvR1lCSTZ6eU1nZWRKaFVMUFdhWWRXZ0pSaUIybkpsaDI5WVYx?=
 =?utf-8?B?b2t5WmJuejErUWU0eDdpbGtpR3JqVWZoajRSeHg3V1dRa1JpL1Zjd2pEK09H?=
 =?utf-8?B?M1lWODRaRFFyS0lLZ2d1d2JvUUxmS21HQTVQVFVwdFprUURYdldQVWNxTGpQ?=
 =?utf-8?B?cjMxSi9OR1ZxeFcrWC8rSmtUYzBkaGhOSmlnMXRiNjZua2l1V0NWQUl0Z2tQ?=
 =?utf-8?B?MVd4M1hvUlZVcXFVWnduemszRUJsMktQVG92MzhZWkYyQWtSdXpnV3kwVHZv?=
 =?utf-8?B?Q0VHWm9RcklvSWVrR0JtalBDdERRZUlObHJsVURPM1dIOUdacHJVMnJ5R0lI?=
 =?utf-8?B?Vktub3VodVB4dlBKbkVsN3hSWVVSVWNsbDJyRWFsSE12WUV5OXdJS0JESk01?=
 =?utf-8?B?ajF4M3ByVGZRVjZqcFp2SGJ1NEdKczE4ZGZ6dXBvNWF5czUxZGVxaURTVFJB?=
 =?utf-8?B?N0RvSDh1NXZ1TGRhd3Q0SEFpZk1MdittZ0Y3MTljVjR1b3pab0pVZ0NtVG9E?=
 =?utf-8?B?eDN2VXJJRjlWT0dtaEVuWTlocEVBOTdvTE51Z1krTWI4OURCQjNLYUNkUERi?=
 =?utf-8?B?eVZXVm9XOEVtRDU1Zkh6VXBFZlZJY0JTYkYvS0I4bnlnaFNvdzBxS1JXT3J2?=
 =?utf-8?B?bGtPZ3kyTDR6K1Y5QmVlM0xKTHVYc2FyYmNNTlBONGdsb2NYbmY1WjRkcVVp?=
 =?utf-8?B?aGlvV1JpWDg0NmdINXNvQlNZd2hEbjROUnltQ0s4UkFCbEZLNnIrQ0pxRXFQ?=
 =?utf-8?B?NUxPTzY4bEY0RVNaN2ZDQm1oMzREQ1M5SStadGJQdktuSmZZWkdoZGdCQ1Fu?=
 =?utf-8?B?NTZkMWpNSmxJcXFrNlNWdEdHRk1ISkRXdW4vSWxTUUErcUZTRGZ3bEUvNnJa?=
 =?utf-8?B?WFdnSWxEa3hJdjNxR2dLREgzcEo2dU5OSlF1UVc0TXl5VDdVQllHYkJkZHM5?=
 =?utf-8?B?eXlWcTh5MEorV3FCWU5adUd1MllaUTV4TkwyWHZRaTlwajhrRlVaRWY2WmQ2?=
 =?utf-8?B?dDJrT2JrY3prRUtJNG1KcGZNYXhFUW8zNlA2bHpNVjg0S0VlUXJVci9uYU9X?=
 =?utf-8?B?VDBJWE1DK0ZKZ1J5bTJ0T1dPSE5ETnpjZFdYVG1SVlJESXFHZXdtYkJFMi9L?=
 =?utf-8?B?QkJiMngvRWh3OUkwQWtFaGdOL1NFRUdmM0NBU0IvVDh3M093eGovTFFzRFRP?=
 =?utf-8?B?VHJRZlhEKzFkd1ZKbk5GeWFvVEVCUm15cjB2a2hma1hHS2I5RWtnbExCYTFi?=
 =?utf-8?B?MzZrUWpXNmd4cDlmUGZucnJQUHZQbFVhWFk1RFdWU1ZaZDBKSjRBU0ozSlAz?=
 =?utf-8?B?dnVOcnkyWGlNZU5MRlNmVHgrdFM2ck1YMjc0aCtCY243YmttUVpjME5SMnZX?=
 =?utf-8?B?Sm16ZndzOEdSUGc2QWNqL2FmOXBCMElFU3NRSTJOcHU4YWlKalh0aFArYjhF?=
 =?utf-8?B?NjFab2dvUWJ6bFViTTR1UzY2d1JKS3dmYUZJZUpmTXA1SUxwOGxIRnBzUlNS?=
 =?utf-8?B?c2VMTGtJbkkwTlp4REYyNzhjc0hqZFFsS3lWZ3U1V2RYenJYQ0NYWEphTmNm?=
 =?utf-8?B?V0dlRkNVNWl3UmJHVGZCNWlmVzdObnRiWjRVa1BKN1pwTFAzNTZKRUpzUkN0?=
 =?utf-8?B?aTh6cjVnZkZJMFliYytFajk3ZzFXNm9rUmZzM2d5bnltNi9tTVl0blQvQjI2?=
 =?utf-8?B?TVdUUExTelRvcTJSdzBSVGRVQUQyN3JWUU1BS0J3N1d5SUY3cjFSRVRUUnor?=
 =?utf-8?B?WUFtRmluamxnSURQVmc4L3NxSXdUVjNvSXZGMGM3bWxjMWZ4eGlSdzRJWFZ0?=
 =?utf-8?B?N3hGajlTYk13TWN1V09kSE9WenFyeHMzdUp2V1gvS1p3U1Joemp0VmFIN1ZY?=
 =?utf-8?B?K3M0dGcyNFFOSFJLd3IzaEo3UmlQSGhCbUo3NXdyWklobkpWNTd1R08wOXNk?=
 =?utf-8?B?VS9BR1ZuS09Tcnpud1IzOXlIMXZxSk5ETHgvREpOOGdNTEY5QXhzTDliQkNv?=
 =?utf-8?B?NDBUZU4ySTZlejd3eHRUNjJ2YXNqM2ZSd1ZkODFYcTdjcVBwaFdDcTRjSERZ?=
 =?utf-8?Q?9iAI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA920A0760D83646932D12937A5DCEA2@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e947d3-6300-4dc0-5f86-08dd1e5f1a0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 05:53:16.4198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JwvIljXVEZqrb65iCVbdE0/Oj1Zgi5lxIHBnA8cN9y+hrQE0L+1TdTQQm4gb6AEubYnmSrXYAv0Edgpk49pc2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9022

DQoNCk9uIDIwMjQvMTIvMTYgMTc6MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4xMi4y
MDI0IDA5OjE4LCBaaGFuZywgSnVsaWEgd3JvdGU6DQo+PiBPbiAyMDI0LzEyLzkgMTU6NDcsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDcuMTIuMjAyNCAxMTo1OSwgSnVsaWEgWmhhbmcgd3Jv
dGU6DQo+IA0KPiBZZXQgYW5vdGhlciBmb3JtYWxpdHksIHNvcnJ5OiBQbGVhc2Ugc2VuZCBwbGFp
biB0ZXh0IGVtYWlscy4gWW91J2xsIG5vdGUgdGhhdCB3aGF0DQo+IEkgc2FpZCBhbmQgd2h5IHlv
dSBzYWlkIGlzIGluZGlzdGluZ3Vpc2hhYmx5IGludGVybWl4ZWQgYmVsb3cuDQoNClRoYW5rcyBm
b3IgcmVtaW5kaW5nLg0KDQo+IA0KPj4gLS0tIGEvdG9vbHMvaW5jbHVkZS94ZW4tc3lzL0xpbnV4
L3ByaXZjbWQuaA0KPj4NCj4+ICsrKyBiL3Rvb2xzL2luY2x1ZGUveGVuLXN5cy9MaW51eC9wcml2
Y21kLmgNCj4+DQo+PiBAQCAtMTEwLDYgKzExMCwxNiBAQCB0eXBlZGVmIHN0cnVjdCBwcml2Y21k
X21hcF9odmFfdG9fZ3BmbnMgew0KPj4NCj4+ICAgICBpbnQgYWRkX21hcHBpbmc7DQo+Pg0KPj4g
ICB9IHByaXZjbWRfbWFwX2h2YV90b19ncGZuc190Ow0KPj4NCj4+DQo+Pg0KPj4gK3R5cGVkZWYg
c3RydWN0IHByaXZjbWRfcDJwZG1hX2Rpc3RhbmNlIHsNCj4+DQo+PiArICBfX3UzMiBwcm92aWRl
cl9idXM7DQo+Pg0KPj4gKyAgX191MzIgcHJvdmlkZXJfc2xvdDsNCj4+DQo+PiArICBfX3UzMiBw
cm92aWRlcl9mdW5jOw0KPj4NCj4+ICsgIF9fdTMyIGNsaWVudF9idXM7DQo+Pg0KPj4gKyAgX191
MzIgY2xpZW50X3Nsb3Q7DQo+Pg0KPj4gKyAgX191MzIgY2xpZW50X2Z1bmM7DQo+Pg0KPj4gKyAg
X191MzIgZGlzdGFuY2U7DQo+Pg0KPj4gK30gcHJpdmNtZF9wMnBkbWFfZGlzdGFuY2VfdDsNCj4+
DQo+Pg0KPj4NCj4+ICJEaXN0YW5jZSIgdHlwaWNhbGx5IGlzIGEgc3ltbWV0cmljIHRoaW5nLiBX
aHkgdGhlIGFzeW1tZXRyeSBoZXJlPyBBbmQNCj4+DQo+PiB3aHkgX191MzIgd2hlbiBfX3U4IHdp
bGwgYmUgZmluZSBmb3IgbW9zdCBmaWVsZHM/IEFuZCB3aGVyZSdzIHRoZSBzZWdtZW50DQo+Pg0K
Pj4gcGFydCBvZiB0aGUgZGV2aWNlIGNvb3JkaW5hdGVzPyBGaW5hbGx5LCB3aXRoIGl0IGJlaW5n
IG1lcmVseSBzdHViDQo+Pg0KPj4gaW1wbGVtZW50YXRpb25zIHRoYXQgeW91IGFkZCBoZXJlLCBh
bGwgZGV0YWlscyBvbiB3aGVyZSB0aGUgbmVlZGVkIGluZm8NCj4+DQo+PiBpcyB0byBjb21lIGZy
b20gYXJlIG1pc3NpbmcuDQo+Pg0KPj4gIkRpc3RhbmNlIiBpcyBwMnBkbWEtZGlzdGFuY2UgYmV0
d2VlbiB0d28gUENJIGRldmljZXMsIGl0J3MgY2FsY3VsYXRlZCBpbiBrZXJuZWwgZHJpdmVyLkkg
ZG9uJ3QgZ2V0IHdoeSBpdCdzIHN5bW1ldHJpYz8NCj4gDQo+IERpc3RhbmNlIGZyb20gQSB0byBC
IGlzIHVzdWFsbHkgdGhlIHNhbWUgYXMgdGhhdCBmcm9tIEIgdG8gQS4gQnV0IHllcywNCj4gbm90
IG5lY2Vzc2FyaWx5IGFsd2F5cyAodGhpbmtpbmcgb2YgZS5nLiByaW5ncykuIFlldCBzdGlsbCBJ
J20gdW5jbGVhcg0KPiBhYm91dCB0aGUgZGlzdGluY3Rpb24gYmV0d2VlbiBwcm92aWRlIGFuZCBj
bGllbnQuDQoNClByb3ZpZGVyIC0gQSBkcml2ZXIgd2hpY2ggcHJvdmlkZXMgb3IgcHVibGlzaGVz
IFAyUCByZXNvdXJjZXMuDQpDbGllbnQgLSBBIGRyaXZlciB3aGljaCBtYWtlcyB1c2Ugb2YgYSBy
ZXNvdXJjZS4NCg0KSW4gb3VyIGNhc2UsIHdlIHdhbnQgdG8gdXNlIHBhc3N0aHJvdWdoIGRHUFUg
cmVuZGVyIGRhdGEsIGFuZCB2aXJ0aW8gDQppR1BVIGRpc3BsYXkgZGF0YS4gU28gZEdQVSBuZWVk
IHRvIGltcG9ydCBkaXNwbGF5IGJ1ZmZlciBvZiBpR1BVLiBpR1BVIA0KaXMgcHJvdmlkZXIgYW5k
IGRHUFUgaXMgY2xpZW50Lg0KDQo+IA0KPj4gSSB3aWxsIHVzZSBjaGFuZ2UgX191MzIgdG8gX191
OC4NCj4+DQo+PiBCeSB0aGUgc2VnbWVudCBwYXJ0IG9mIHRoZSBkZXZpY2UgY29vcmRpbmF0ZXMs
IGRvIHlvdSBtZWFuIHRoZSBkb21haW4gbnVtYmVyIG9mIHRoZSBkZXZpY2U/DQo+IA0KPiBTb21l
IGNhbGwgaXQgZG9tYWluLCB5ZXMuIFNpbmNlIGRvbWFpbiBoYXMgYW4gaW1wb3J0YW50LWlzaCBk
aWZmZXJlbnQNCj4gbWVhbmluZyBpbiBYZW4sIHdlIHByZWZlciBzZWdtZW50IHRob3VnaC4NCj4g
DQoNCkkgc2VlLCBJIHdpbGwgYWRkIHRoaXMgaW5mbyBpbiB0aGUgc3RydWN0Lg0KDQo+PiBBbGwg
dGhlIG5lZWRlZCBpbmZvKHZpcnR1YWwgYnVzL3Nsb3QvZnVuY3Rpb24gbnVtYmVycykgYXJlIGZy
b20gZ3Vlc3QgVk0sIFFFTVUgY29udmVydCB0aGVtIHRvIHJlYWwgcGh5c2ljYWwgaW5mbyBvZiB0
d28gZGV2aWNlcy4NCj4+DQo+PiBEbyB5b3UgbWVhbiB0aGF0IEkgc2hvdWxkIGFkZCBtb3JlIGRl
dGFpbHMgaW4gY29tbWl0IG1lc3NhZ2Ugb3IgY29tbWVudD8NCj4gDQo+IFBlcmhhcHMuIE9yIGhh
dmUgdGhlIHBhdGNoIGJlIG1vcmUgY29tcGxldGUsIGluIHRoZSBzZW5zZSBvZiBub3Qgb25seQ0K
PiBwdXR0aW5nIGluIHBsYWNlIHN0dWJzLCB0aHVzIGFjdHVhbGx5IG1ha2luZyB2aXNpYmxlIGhv
dyB0aGUgZGF0YSBpcw0KPiBwcm9kdWNlZCAvIHVzZWQuDQo+IA0KDQpTdXJlLCBJIHdpbGwgdHJ5
IHRvIGFkZCBtb3JlIGRldGFpbHMuDQoNCkp1bGlhDQoNCj4gSmFuDQo=

