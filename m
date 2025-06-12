Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE00AD6B6D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 10:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012572.1391059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdfu-0008Op-Nm; Thu, 12 Jun 2025 08:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012572.1391059; Thu, 12 Jun 2025 08:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdfu-0008MS-KI; Thu, 12 Jun 2025 08:52:42 +0000
Received: by outflank-mailman (input) for mailman id 1012572;
 Thu, 12 Jun 2025 08:52:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p7z=Y3=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uPdft-0008MM-JT
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 08:52:41 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2413::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97a4fefc-476a-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 10:52:39 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB7765.namprd12.prod.outlook.com (2603:10b6:8:113::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Thu, 12 Jun 2025 08:52:34 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 08:52:33 +0000
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
X-Inumbo-ID: 97a4fefc-476a-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5Y1P4utXOv0SQyZMcdJcrEXgMIOc+ALbb7QaSSu40P2xV0xTAMFr8JpFX/6nv/DoT/3qaofz5N4veZC0RdVgsq129E3gGlfRLDttAhQEBHCX4kQ4zMZ3rGmVOYuZRBYGu5bxTIndlI7T42x+lsAAqs4ht6j/RzLZ3KrFz2eJMfqh7DSP4nLk6ePkOFPjYm17Nz4jdQ47uSYEAP16whyQlvrlTjHZcqhPaOfPeIQq3r4DL4vlNPCYenotTZaEwloj4ZLoLRieQzC7B9MFQzxkczLyqlDarFjMK6Ju0xStC+QIVbY79/RfIBP/09vFTEglAitEQBo8RpOeOVuh4asRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/4jvNZPuWm3c3d4IO3W2lqiZnh5sZ6CklXP0yytoWI=;
 b=KllRd+gssFMgizH3OuUdUHESs7cr9Rx0AqczFVdz8kWLZ80tzTZUeT61qYIuHlRtSGe5WXVcW5JspMrp5T4DzgvgP9CuyA62IYs9HrRgSO+CoRba5ptRDikWJPNJNFBWsqyuhAuHcNcb12UzHsQl8lyCfn7LlThpapcPyRhW4iDj7DYzCviSDsdP5w50B5XE78gngBcpKd8miI6elRyLqE9iZHVJ0F1CIOmotHxv+ypLutg7LygGdSwlwJixTA8rTb5AZDFyc0s4hq9tbD3pkk0udVbPPMw5/zQq0WipTZMrJWN+QRY1UShHTLp3xCEfriNFy4CorNHhHzxnpbDPdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/4jvNZPuWm3c3d4IO3W2lqiZnh5sZ6CklXP0yytoWI=;
 b=N+hjqRXDKNWUJeafSwhdhWHYraY79o9OEXhC+vWvoW6b6OEdIODkFRboHbDem0OiQw1E6agZvdoixhUKAqRJQZqeHgKmmFT3o4Ha2Tr0s++h0/8aNa659w4fAKApjQhVViChhDIKtx4HbBW5xT6Y/UPdT/Zdz5653syE1ZB3+vE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 03/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Topic: [PATCH v4 03/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Index: AQHbz7Fj+78Jf3bO30Wr1Bk6dRI84bP8b/QAgAJ/5nCAAEBpgIAAEbfA
Date: Thu, 12 Jun 2025 08:52:33 +0000
Message-ID:
 <DM4PR12MB84515FBDE10EDBB14A7EEFA0E174A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-4-Penny.Zheng@amd.com>
 <1a73c720-012a-4795-9f47-f9c23b643de1@suse.com>
 <DM4PR12MB8451B5CBFD6D9DCDDB7040DEE174A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <b692d934-7f0a-427d-99df-2404662333eb@suse.com>
In-Reply-To: <b692d934-7f0a-427d-99df-2404662333eb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-12T08:51:54.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB7765:EE_
x-ms-office365-filtering-correlation-id: daf98ac8-9062-404a-c178-08dda98e790c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eWhBWEdFcjBKS0p0dkY0bi9rakI1SVhabjFhUFN1OHJFWDFDUXZZZE1mWVB1?=
 =?utf-8?B?NzNCWHd3UDREK1B6cVFGV2ZuUHZLWXRVY1FvUUZiL1hyV2F5c0c2cmNvOTNu?=
 =?utf-8?B?aVkyaVNYdnozYjFZalI2TytvQWpBQ0RBVGRjSlNZRGlnTFhUK3ZZVHdNbEVh?=
 =?utf-8?B?Q0xZVUQ4UER2d3l4bUh2ZzgvUzNHSHNlMTU5dW1GUVFMV3Q2U1VqUkE0bENx?=
 =?utf-8?B?dkRQZVZpMk13cisvQVpXYWpaNExhTFN1UENaQThBMkgxMWEwckEyY1p1RFhn?=
 =?utf-8?B?b0NJSlFkaU5ZTmZ4SGloUVYydmtRbVFENFhTLzJxWXZXUDE1QWRyVXNQWmJY?=
 =?utf-8?B?R1UxbEVMUEwwa3oyT0tVR2trZjhZWXNNS0U1RFl1MlJIM25oODR3WU55bUI5?=
 =?utf-8?B?cTJ5dXZiSCswOFkydlQ4alJWWGxzdWc3ZHo2c2NzSzdRZlZHV0FCRm8vTGo5?=
 =?utf-8?B?MGpHczc2UlJuY3czTVNraXpBbXB6YU1jTEFKaEt1UGhPL2NJQk1mWmdpQjJ0?=
 =?utf-8?B?UVREN1pTQ01vSlp5TmQ0OU82NWlnRWQ5dGQ3RTBIQVRsRjdhWDFBMWcwU2Uw?=
 =?utf-8?B?YSs2bUFWVmJ4L0krNkJQMVJsSEFnU3QvRzBqNlV4bDJpeUNYRFI5b0ZqVFFE?=
 =?utf-8?B?MFIzQjJjK2wydnR5SUNaaDVpZUZxOFRaMUJUQ0p3L1hIWS83OS91Slduc3Za?=
 =?utf-8?B?Y3k5algzM2RhdTNmRGdKOTI3bHE0VUR2KzRJVnRJU1o5RFdXODFlUlV2ckU3?=
 =?utf-8?B?WU4xYWE0MXdRZ2lmRDUwV0JiOE5uYldPR0NucTBkU0dxZjlkTWdTbXhiZFUx?=
 =?utf-8?B?VTVuQm51c1U1ZDRZSmdOVlBMM3M3UEdlampJcnpIcHRYTDdkRFl2ZFhzeHhw?=
 =?utf-8?B?WHdIVGJySzFqOHl5VG9pcERjWU9zeDdYZU5FeWZqT2VSaUI5L05sZTRtMkdi?=
 =?utf-8?B?Nk9oVWpZTHBqMWxSUEJlZlRFTGRMUjczZnd4VytHZzAvNS94cmRYRFA2empr?=
 =?utf-8?B?SmpuRGFwSVhkY2dYU05OTnNuRVdqeERVTjYzd0EwSW9VZDk0dkh1L3cySmp1?=
 =?utf-8?B?MUt2bzRWKzY1V3N3R0lWSzZjaFlUOUcrOG9weHVnNWo1VTB0ZU0xWUw0ZldR?=
 =?utf-8?B?V01LbWsxOGc2V2g4UEkxWEdpUWZaWkdSb2c5WHl4aDJwejdKTTJwN3hoei9W?=
 =?utf-8?B?WGFkOTcxcCtQbEVFenpBNU1LSFNVbThQcHZsbk44c0dkMmVMTWgxMStFWTNh?=
 =?utf-8?B?S3dyRlNGaE1lSFBhaDQ2WjlUa1l4RHdRRWoxb29DMXpCQjRXdnhGdWF6Ulh2?=
 =?utf-8?B?KzhqTkh6WHJqMURzWk12d3l1MWhNZEZ5aFpzUDZYSXlEQUdZbjcyTHNiY3g1?=
 =?utf-8?B?T3dKM0lvckQ4aEJRMEpKZTZWT1MvZnQ1eTVsRUlsSGxhVHVBdVh3N0g1bDlT?=
 =?utf-8?B?UnZxaXY3aEZsbWVxUHdZWjVsL1VCRTlPRTVqQmV1K0prYlNYbGFmQVVMWEMr?=
 =?utf-8?B?ZkkvNzFVWDBTTzZwTitLQS8rM2JoeHNvdm1JYjZPKzdkanY0UUlQcE5sQlJw?=
 =?utf-8?B?MUtmZ0Q5cDVFaXg4UDVEd2FJM3NBY0FZZElLWkNIN29sZGxPQXo2S1VMTiti?=
 =?utf-8?B?MjB0QUZuZFIrZXI5d1E3RE1jenJDeXRkRTdCdk9USTUvUS9KWldEZmdZNGto?=
 =?utf-8?B?OUlMOVd6ZWlFazVMSGx4ZjhsM3dWUSthRTVIeW9xN2RxSDFETUFGWjUyZjhH?=
 =?utf-8?B?ZFhtejNpMUV6K2crTzdWbGJZdDV3eTF0WGJQcGFzZjVjelhFc0hlV3M5aHRV?=
 =?utf-8?B?ZUhjTExWa3JFTlcwRUdRM0tweDhoUGhHMHZCaEc0a3FzcW81L2l2T3ByaS9Z?=
 =?utf-8?B?Yy92ZEVZU0orWDl4VUpZNi9ySnhMQW0vZ2ZEanJHQ1A3WW5SaUVsV3FZdnd6?=
 =?utf-8?B?VWRlY25LbkdRYjdtRWduNGFra0JqdVJaano5a2l2QmQ2SWk1blVPUXM5enZX?=
 =?utf-8?Q?nJZHPJ6LSMz6PLQBBvuRp0CnQsKnhA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3Y5RWdTNkRkZDk5N3BncFY3dVRkYWN2U1B6VVRUTVhjUzFVTW41Y3Z1aXlM?=
 =?utf-8?B?cjNCNFM3N1dFMTlrOFlPcVNCWHpZek1kNHd4WlBURTVuekVwWkluUEJXTEFL?=
 =?utf-8?B?d2syZGRtNXJod2NUcTV3U2w0amsrSGZoRWlUaVVNT0NYVWErVFFsNjFPazJP?=
 =?utf-8?B?azFWV0ZNUTRsSnVZTmd4d25yM0lZZ2RuNnNmR290YytTSmRJSVlleVNaeHI3?=
 =?utf-8?B?TFE3QXFsY2MzUkZ2N3FjMHRIZ3U0Mi9GdmdzdlpBdndyVXQ2L3RFK2xTTU40?=
 =?utf-8?B?UkRFaElHbXhwb080VkQvL01IOVJybVBscFd1YnZWeE1pbHV2aERXY1BHNXJM?=
 =?utf-8?B?VU42Q1lkc2Y4a1p1M2lnYXprUi9CRkpQRCtzdFNPUTF0Q1pQdVNaQnNHOXYy?=
 =?utf-8?B?R3hiL0hqMklSV1ZhWXBabU9ZbWVXWXEzMEpHRW1TWmI3VFpBVDYwb1FkMi9p?=
 =?utf-8?B?bHlRajRPa2dqYXF2bDN2ZzVKTGFrNkpVNG42OWs2aEs1NGFIbjEyck9xWkhZ?=
 =?utf-8?B?SWNqNG1XSDZCcnlJclJtTGJTTGYzNTU2ZFdBQjJBL0xCckp3akR3dkpiei9J?=
 =?utf-8?B?U2p3T1ZORi9EYVp2V284a2hxOVdXS2ttZ1ZFMC8vb3pwUk0wUGRtT3plWDM1?=
 =?utf-8?B?ZUlxUmlJa0JwMWNFdzUyeGhUSlRIdTA5Y3hPSjQ0Q3hsUkFQRm9xMmY0ajEr?=
 =?utf-8?B?RFJQMWNFZlBJWnNVNmdoaGFXWGFXU2gzY2EyQjh5RGJiUFBnSFRMUWQ5WmRF?=
 =?utf-8?B?bm5JYnF0YS8rSDNoS0NpWWxUMTdhalR6VjF4bWpXajB6U29uN0JJeUR0dXps?=
 =?utf-8?B?OFlkYUxKaXBSbUlqOGhQRGFRSWw2bGRwRDM1Yzlqamk5SmkzbUJkaWRiVWQw?=
 =?utf-8?B?NHhUMHk0QXhzUlNhNDZuODJ5Wm1tenVJc3hwYzhvdWNUcStaUkNjcDNWRm42?=
 =?utf-8?B?K1FPNkhiazc3ZFhvN28xOXpSNGN0VVZGRXNqQjE5TGd5RDJlTm91bU8zbVd4?=
 =?utf-8?B?bndzRDFRYU9zRkxESWZ1b08yaU1BaXNwR2RZZ1NzaTEzaWR0Y3JiMkY3cnYw?=
 =?utf-8?B?bzZkWWcrbmRYYXI4cXllcnFVVHd4NVprVGJ1bzN6MEwxZXd3V3k5WFZqcGxG?=
 =?utf-8?B?ZXBaNk5GR1Bpc1h3ZTREZTlLQ1ZzNVU2ajhOUS91Y3pKQm5rUzRCMG9pNXB1?=
 =?utf-8?B?b0lLWjY3dURLMG1KM2hvK3NsY2d1TkFacmFsc2Y1aGRHZ3U0TVlRMFl6Rmpo?=
 =?utf-8?B?Y2xRSnNERjhHVWY1TTZuZk1uTHZaTjd4RWV1UjRZeXNvME9sS1hybEdWcThG?=
 =?utf-8?B?aEd5TE0zWXRZUjV3bVhhVVFNdGZLdHhrc09jdWpuR3Z2MkRWM0VTc3diZ0w4?=
 =?utf-8?B?aFMwNm9XY1dJS2VVcDdSbTk2ZzV5ejJZQk1mMDBwV044L0JCWnZkRnRsTVNN?=
 =?utf-8?B?UVNMWWtKNEJxRkFET2NiVkJkZm9FQXJwRWpIMVNoM1hTdWpHcmlySVEzdHFq?=
 =?utf-8?B?WldUQ1JvWi9TZDVhcllJeVhSWGlTNkhka3dVWVpqNEFCTzNKdDBDTU03NXl4?=
 =?utf-8?B?cmZwamRTeUNkcTU3SzE2Tmg4djg1cG9zUmUzOEIzNUJMSjlTd04vcExFdmZI?=
 =?utf-8?B?RWFwd2prd2Vna1Q2b0NWdlZjUkM2SmUvTkZzRGJFbEpRUHpKS3FiWWZDZmNN?=
 =?utf-8?B?UEhXTkwrWmhhZllUQjFxUjN0M0lOS0pBUjRXWkV6djJzWktVM1dJOVU5MWNj?=
 =?utf-8?B?ZnhoSllPR0IrUHk5bjBuUkJCblVob0U2ZkxVYU5OSEVsREpVK0ZKUWkwYzJz?=
 =?utf-8?B?VHZDLzRzYUc5VGw1MXlENmF0aW01NWIwZ21veWNIRkZyRkxBVWlocGZqOFda?=
 =?utf-8?B?Q1gzMHh1S0hLc2xUUGFUT0tLWEhLLzI0emVBMWpDclA3QTd0V1hJSUFsc3Iz?=
 =?utf-8?B?R0N0MXNOS1BIZlc4NDdtcXkzN1JER2hlZmxkbTZYZWxZTVdDN0ltdjZxQmVa?=
 =?utf-8?B?WFlaNDhRaVJWMk03VTc5MllaclBCM1V3Njl0bE03aloxUHdhamdtcTI0eFVl?=
 =?utf-8?B?RDVjdFNQcGRqUjV6Unl4cVgyUlJBVnZ6aUZHK1RaV3lwWW5aODFSYXI5enUy?=
 =?utf-8?Q?TCbo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf98ac8-9062-404a-c178-08dda98e790c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 08:52:33.7762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9iFVGGk/W4aj3zEyLvN5rcxLk19DNSuh6sVDxPgacZrxbToNltTH/R7kr+yGSHqPc/lRQNVdW5ySkKxXBBXOlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7765

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDEyLCAyMDI1
IDM6MDIgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBPcnpl
bCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
NCAwMy8yMF0geGVuL3g4NjogcmVtb3ZlICJkZXBlbmRzDQo+IG9uICFQVl9TSElNX0VYQ0xVU0lW
RSINCj4NCj4gT24gMTIuMDYuMjAyNSAwNjowOSwgUGVubnksIFpoZW5nIHdyb3RlOg0KPiA+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTAsIDIwMjUgOTowMSBQTQ0K
PiA+Pg0KPiA+PiBPbiAyOC4wNS4yMDI1IDExOjE2LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+
IFJlbW92ZSBhbGwgImRlcGVuZHMgb24gIVBWX1NISU1fRVhDTFVTSVZFIiAoYWxzbyB0aGUgZnVu
Y3Rpb25hbGx5DQo+ID4+PiBlcXVpdmFsZW50ICJpZiAhLi4uIikgaW4gS2NvbmZpZyBmaWxlLCBz
aW5jZSBuZWdhdGl2ZSBkZXBlbmRhbmN5DQo+ID4+PiB3aWxsIGJhZGx5IGFmZmVjdCBhbGx5ZXNj
b25maWcuIFRvIG1ha2Ugc3VyZSB1bmNoYW5naW5nIHByb2R1Y2VkDQo+ID4+PiBjb25maWcgZmls
ZSBiYXNlZCBvbiAicHZzaGltX2RlZmNvbmZpZyIsIHdlIHNoYWxsIGV4cGxpY2l0bHkgc3RhdGUN
Cj4gPj4+IGFjY29yZGluZyBLY29uZmlnIGlzIG5vdCBzZXQNCj4gPj4+DQo+ID4+PiBBZGQgImRl
ZmF1bHQgeSIgZm9yIFNIQURPV19QQUdJTkcgYW5kIFRCT09ULCBvdGhlcndpc2Ugd2Ugd2lsbCBo
YXZlDQo+ID4+PiB1bnNldCB2YWx1ZXMgd2hlbiBydW5uaW5nIG1ha2UgZGVmY29uZmlnIGJhc2Vk
IG9uICJ4ODZfNjRfZGVmY29uZmlnIi4NCj4gPj4NCj4gPj4gSSBmZWFyIEkgZG9uJ3QgdW5kZXJz
dGFuZCB0aGlzLCBwZXJoYXBzIHJlbGF0ZWQgdG8gbWUgYWxzbyBub3Qgc2VlaW5nIGhvdyAuLi4N
Cj4gPg0KPiA+IElmIHdlIGp1c3QgcmVtb3ZlZCAiZGVmYXVsdCAhUFZfU0hJTV9FWENMVVNJVkUi
LCAuY29uZmlnIGZpbGUgZ2VuZXJhdGVkIGJ5DQo+ICJtYWtlIGRlZmNvbmZpZyINCj4gPiB3aWxs
IGNoYW5nZSwgaGF2aW5nIHVuc2V0dGluZyB2YWx1ZXMgZm9yIFNIQURPV19QQUdJTkcgKCMNCj4g
PiBDT05GSUdfU0hBRE9XX1BBR0lORyBpcyBub3Qgc2V0KSBJZiBjaGFuZ2luZyBpdCB0byAiZGVm
YXVsdCB5IiBpcyB0b28NCj4gPiBjYXN1YWwsIG1heWJlIHdlIHNoYWxsIGFkZCAiQ09ORklHXyBT
SEFET1dfUEFHSU5HPXkiIGluDQo+IHg4Nl82NF9kZWZjb25maWcsIHRvIGF0IGxlYXN0IHJldGFp
biBjb25zaXN0ZW50IC5jb25maWcgZmlsZS4NCj4gPiBNeSBmYXVsdCwgT25seSBjb25zaWRlcmlu
ZyAiU0hBRE9XX1BBR0lORyIgaXMgZW5vdWdoLCBhcyBUQk9PVCBkZXBlbmRzDQo+ID4gb24gVU5T
VVBQT1JURUQgZmlyc3RseQ0KPiA+DQo+ID4+PiAtLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZw0K
PiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcNCj4gPj4+IEBAIC0xNDMsNyArMTQzLDcg
QEAgY29uZmlnIFhFTl9JQlQNCj4gPj4+DQo+ID4+PiAgY29uZmlnIFNIQURPV19QQUdJTkcNCj4g
Pj4+ICAgICBib29sICJTaGFkb3cgUGFnaW5nIg0KPiA+Pj4gLSAgIGRlZmF1bHQgIVBWX1NISU1f
RVhDTFVTSVZFDQo+ID4+PiArICAgZGVmYXVsdCB5DQo+ID4+PiAgICAgZGVwZW5kcyBvbiBQViB8
fCBIVk0NCj4gPj4+ICAgICBoZWxwDQo+ID4+Pg0KPiA+Pj4gQEAgLTE3NSw3ICsxNzUsNyBAQCBj
b25maWcgQklHTUVNDQo+ID4+PiAgY29uZmlnIFRCT09UDQo+ID4+PiAgICAgYm9vbCAiWGVuIHRi
b290IHN1cHBvcnQgKFVOU1VQUE9SVEVEKSINCj4gPj4+ICAgICBkZXBlbmRzIG9uIElOVEVMICYm
IFVOU1VQUE9SVEVEDQo+ID4+PiAtICAgZGVmYXVsdCAhUFZfU0hJTV9FWENMVVNJVkUNCj4gPj4+
ICsgICBkZWZhdWx0IHkNCj4gPj4+ICAgICBzZWxlY3QgQ1JZUFRPDQo+ID4+PiAgICAgaGVscA0K
PiA+Pj4gICAgICAgQWxsb3dzIHN1cHBvcnQgZm9yIFRydXN0ZWQgQm9vdCB1c2luZyB0aGUgSW50
ZWwoUikgVHJ1c3RlZA0KPiA+Pj4gRXhlY3V0aW9uDQo+ID4+DQo+ID4+IC4uLiB0aGVzZSB0d28g
Zml0IHdpdGggdGl0bGUgYW5kIGRlc2NyaXB0aW9uLiBUaGUganVzdGlmaWNhdGlvbiBmb3INCj4g
Pj4gcmVtb3ZpbmcgdGhlICFQVl9TSElNX0VYQ0xVU0lWRSBoZXJlIGlzIG5vdCAiYnJlYWtzIGFs
bHllc2NvbmZpZyIuDQo+ID4NCj4gPiBIbW1tLCBpdCBpcyB0aGUgY29uc2VxdWVuY2Ugb2YgInJl
bW92aW5nIHRoZSAhUFZfU0hJTV9FWENMVVNJVkUiDQo+ID4gTWF5YmUgSSBzaGFsbCBhZGQgbW9y
ZSBleHBsYW5hdGlvbiBpbiBjb21taXQgbWVzc2FnZT8NCj4NCj4gSnVzdCB0byBjbGFyaWZ5IC0g
bXkgcXVlc3Rpb25zIGhlcmUgd2VyZSBhYm91dCB0aGUgY2hhbmdlcyBhbHRvZ2V0aGVyLCBpLmUu
Og0KPiBXaHkgYXJlIHRoZXNlIHR3byBjaGFuZ2UgLSBhcyBhIHdob2xlIC0gbmVlZGVkLCBnaXZl
biB0aGUgc3ViamVjdD8gQW5kIGp1c3QgdG8gdHJ5DQo+IHRvIGF2b2lkIGFueSBtaXN1bmRlcnN0
YW5kaW5nOiBNeSBwb2ludCBpcyB0aGF0ICJkZXBlbmRzIG9uIC4uLiIgYW5kICJkZWZhdWx0IC4u
LiIgYXJlDQo+IGRpZmZlcmVudCB0aGluZ3MsIHdoZW4gdGhlIGNvbW1pdCBtZXNzYWdlIGRpc2N1
c3NlcyBvbmx5IHRoZSBmb3JtZXIuIFNvIHllcywNCj4gZXh0ZW5kaW5nIHRoZSBjb21taXQgbWVz
c2FnZSBtYXkgYmUgb25lIHdheSB0byBhZGRyZXNzIG15IHJlbWFya3MuIEJ1dCByZWFsbHkNCj4g
SSB0aGluayBjaGFuZ2VzIHRvIGRlZmF1bHRzIChpZiBuZWVkZWQgYXQgYWxsKSB3b3VsZCBiZXR0
ZXIgYmUgc2VwYXJhdGUgZnJvbSBjaGFuZ2VzDQo+IHRvICJkZXBlbmRzIG9uIC4uLiIuDQo+DQoN
ClRoZSByZWFzb24gd2h5IEkgYWRkZWQgYW4gZXh0cmEgZGVmYXVsdCB5IGZvciBDT05GSUdfU0hB
RE9XX1BBR0lORyBpcyB0aGF0DQp0aGUgLmNvbmZpZyBmaWxlIGdlbmVyYXRlZCBmcm9tIHg4Nl82
NF9kZWZjb25maWcgaGFzIGNoYW5nZWQgYWZ0ZXIgcmVtb3ZpbmcgdGhlICJkZWZhdWx0ICFQVl9T
SElNX0VYQ0xVU0lWRSIsIGZyb20gIkNPTkZJR19TSEFET1dfUEFHSU5HPXkiIHRvICIgQ09ORklH
X1NIQURPV19QQUdJTkcgaXMgbm90IHNldCAiLiBUbyBmaXggaXQsIEkgY2FzdWFsbHkgYWRkZWQg
YSAiZGVmYXVsdCB5IiBoZXJlLg0KSSB1bmRlcnN0YW5kIHRoYXQgbGlrZSB5b3Ugc2FpZCwgaXQg
ZG9lc24ndCBmaXQgd2l0aCB0aGUgdGl0bGUgYW5kIGRlc2NyaXB0aW9uLi4uIEknbGwgY3JlYXRl
IGEgbmV3IGNvbW1pdCBmb3IgaXQuIEFuZCBpbnN0ZWFkIG9mIGFkZGluZyAiZGVmYXVsdCB5Iiwg
bWF5YmUganVzdCBhZGRpbmcgIiBDT05GSUdfU0hBRE9XX1BBR0lORz15IiBpbiB4ODZfNjRfZGVm
Y29uZmlnIGlzIGVub3VnaC4NCg0KPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZz
aGltX2RlZmNvbmZpZw0KPiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2Rl
ZmNvbmZpZw0KPiA+Pj4gQEAgLTI2LDMgKzI2LDggQEAgQ09ORklHX0VYUEVSVD15DQo+ID4+PiAg
IyBDT05GSUdfSU5URUxfSU9NTVUgaXMgbm90IHNldA0KPiA+Pj4gICMgQ09ORklHX0RFQlVHIGlz
IG5vdCBzZXQNCj4gPj4+ICAjIENPTkZJR19HREJTWCBpcyBub3Qgc2V0DQo+ID4+PiArIyBDT05G
SUdfU0hBRE9XX1BBR0lORyBpcyBub3Qgc2V0DQo+ID4+PiArIyBDT05GSUdfVEJPT1QgaXMgbm90
IHNldA0KPiA+Pj4gKyMgSFlQRVJWX0hZUEVSVl9HVUVTVCBpcyBub3Qgc2V0DQo+ID4+DQo+ID4+
IFRoaXMgb25lIGRvZXNuJ3QgbG9vayByaWdodCwgc2ltcGx5IGJ5IGl0cyBuYW1lLg0KPiA+Pg0K
PiA+Pj4gKyMgQ09ORklHX0hWTSBpcyBub3Qgc2V0DQo+ID4+PiArIyBDT05GSUdfVkdBIGlzIG5v
dCBzZXQNCj4gPj4NCj4gPj4gSnVzdCB0byBtZW50aW9uIGl0IC0gSSdtIHVuc3VyZSB3aGV0aGVy
IGFkZGluZyBzdWNoIGF0IHRoZSBlbmQgaXNuJ3QNCj4gPj4gZ29pbmcgdG8gY2F1c2UgaXNzdWVz
LiBCdXQgbWF5YmUgSSdtIHBhcmFub2lkIC4uLg0KPiA+Pg0KPiA+DQo+ID4gSXQgY291bGQgYmUg
dG9vIGNhc3VhbC4uDQo+ID4gSSB3aWxsIG9ubHkgbGVhdmUgVkdBIGhlcmUsIGFzIHdlJ3JlIHN1
cmUgdGhhdCB3aXRoIHJlbW92aW5nDQo+ID4gIiFQVl9TSElNX0VYQ0xVU0lWRSIsIENPTkZJR19W
R0EgaXMgc2V0dGluZyBhcyB5IGluIHB2c2hpbV9kZWZjb25maWcNCj4NCj4gSSBkb24ndCBmb2xs
b3c6IFdoeSB3b3VsZCBhIHNoaW0gbmVlZCBWR0Egc3VwcG9ydCBjb21waWxlZCBpbj8NCj4NCg0K
WWVzLCBWR0Egc2hhbGwgbm90IGJlIGNvbXBpbGVkIGZvciBhIHNoaW0uIEFuZCBpdCBpcyB0aGUg
cmVhc29uIHdoeSBJIGFkZGVkICIjIENPTkZJR19WR0EgaXMgbm90IHNldCIgaW4gcHZzaGltX2Rl
ZmNvbmZpZy4gV2l0aG91dCBpdCwgdGhlIGNvbnNlcXVlbmNlIG9mIHJlbW92aW5nICIgaWYgIVBW
X1NISU1fRVhDTFVTSVZFICIgZm9yIFZHQSBpcyB0aGF0IHdoZW4gd2UgcnVuICJtYWtlIGRlZmNv
bmZpZyBwdnNoaW1fZGVmY29uZmlnIiwgd2Ugd2lsbCBnZXQgQ09ORklHX1ZHQT15IGluIC5jb25m
aWcNCkxpa2UgeW91IHNhaWQsIHRoaXMgY2hhbmdlIGJlbG9uZ3MgdG8gdGhlIGdyb3VwIG9mIGNo
YW5naW5nIGtjb25maWcgZGVmYXVsdCB2YWx1ZXMsIGFuZCB3aWxsIGxhdGVyIGJlIGluY2x1ZGVk
IGluIGEgbmV3IGNvbW1pdA0KDQo+ID4+PiAtLS0gYS94ZW4vZHJpdmVycy92aWRlby9LY29uZmln
DQo+ID4+PiArKysgYi94ZW4vZHJpdmVycy92aWRlby9LY29uZmlnDQo+ID4+PiBAQCAtMywxMCAr
MywxMCBAQCBjb25maWcgVklERU8NCj4gPj4+ICAgICBib29sDQo+ID4+Pg0KPiA+Pj4gIGNvbmZp
ZyBWR0ENCj4gPj4+IC0gICBib29sICJWR0Egc3VwcG9ydCIgaWYgIVBWX1NISU1fRVhDTFVTSVZF
DQo+ID4+PiArICAgYm9vbCAiVkdBIHN1cHBvcnQiDQo+ID4+PiAgICAgc2VsZWN0IFZJREVPDQo+
ID4+PiAgICAgZGVwZW5kcyBvbiBYODYNCj4gPj4+IC0gICBkZWZhdWx0IHkgaWYgIVBWX1NISU1f
RVhDTFVTSVZFDQo+ID4+PiArICAgZGVmYXVsdCB5DQo+ID4+PiAgICAgaGVscA0KPiA+Pj4gICAg
ICAgRW5hYmxlIFZHQSBvdXRwdXQgZm9yIHRoZSBYZW4gaHlwZXJ2aXNvci4NCj4gPj4NCj4gPj4g
TGlrZSBhYm92ZSwgdGhpcyBjaGFuZ2UgYWxzbyBkb2Vzbid0IHJlYWxseSBmaXQgd2l0aCB0aXRs
ZSBhbmQgZGVzY3JpcHRpb24uDQo+ID4NCj4gPiBJIGhhdmUgYWRkZWQgIiAoYWxzbyB0aGUgZnVu
Y3Rpb25hbGx5IGVxdWl2YWxlbnQgImlmICEuLi4iKSAiIGluDQo+ID4gY29tbWl0IG1lc3NhZ2Ug
dG8gYWxzbyBjb3ZlciBhYm92ZSBjaGFuZ2UNCj4NCj4gV2VsbC4gVGhlcmUgYXJlIG11bHRpcGxl
IHVzZXMgb2YgImlmIC4uLiIuIFRoZSBvbmUgbWF0Y2hpbmcgImRlcGVuZHMgb24gLi4uIiBpcyBj
b3ZlcmVkDQo+IGluIHRoZSBkZXNjcmlwdGlvbiwgeWVzLiBCdXQgdGhlIHR3byB1c2VzIGhlcmUg
ZG9uJ3QgZmFsbCBpbiB0aGlzIHNhbWUgZ3JvdXAuIE9uZSBpcyBhDQo+IHByb21wdCB2aXNpYmls
aXR5IGNoYW5nZSwgYW5kIHRoZSBvdGhlciBpcyBhIGNoYW5nZSB0byB5ZXQgYW5vdGhlciBkZWZh
dWx0LiBTZWUgYWJvdmUNCj4gZm9yIG15IHJlY29tbWVuZGF0aW9uICh0byBzcGxpdCB0aGluZ3Mg
cHJvcGVybHkpLg0KPg0KDQpDb3JyZWN0IG1lIGlmIEkgdW5kZXJzdGFuZCB3cm9uZ2x5Og0KImlm
IC4uLiIgZm9yIEhZUEVSVl9HVUVTVCBpcyBmYWxsaW5nIHRoZSBncm91cCB3aGVyZSBwcm9tcHQg
dmlzaWJpbGl0eSBjaGFuZ2VzLCBhbmQgZml0cyB3aXRoIHRoZSB0aXRsZSBhbmQgZGVzY3JpcHRp
b24NCiJpZiAuLi4uIiBmb3IgVkdBIGlzIGEgY2hhbmdlIHJlZ2FyZGluZyBrY29uZmlnIGRlZmF1
bHQgdmFsdWUsIGFuZCBzaGFsbCBiZSBjb3ZlcmVkIGluIGEgbmV3IGNvbW1pdC4NCllldCBteSBj
aGFuZ2VzIG9uICBwdnNoaW1fZGVmY29uZmlnIGFuZCB4ODZfNjRfZGVmY29uZmlnIHNoYWxsIGFs
c28gYmUgaW5jbHVkZWQgaW4gdGhlIG5ldyBjb21taXQuIEFzIHRoZXkgYXJlIGFsbA0KdGFsa2lu
ZyBhYm91dCBjaGFuZ2luZyBrY29uZmlnIGRlZmF1bHQgdmFsdWUuDQoNCj4gSmFuDQo=

