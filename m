Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BCA908403
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 08:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740427.1147523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0o8-0007Xx-L3; Fri, 14 Jun 2024 06:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740427.1147523; Fri, 14 Jun 2024 06:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0o8-0007Va-IL; Fri, 14 Jun 2024 06:53:08 +0000
Received: by outflank-mailman (input) for mailman id 740427;
 Fri, 14 Jun 2024 06:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eLuH=NQ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sI0o7-0007VU-1n
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 06:53:07 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf07ca3c-2a1a-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 08:53:04 +0200 (CEST)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Fri, 14 Jun
 2024 06:53:00 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%5]) with mapi id 15.20.7633.037; Fri, 14 Jun 2024
 06:53:00 +0000
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
X-Inumbo-ID: bf07ca3c-2a1a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7bckpAC8muMYvg6t2KOf6DEvLnu4CpHkVy+0ZE8vyqDr+OmKfmTscOekw70hQ14YxX6DGbly2zyco45FkKHSqCCRIUN8N3zHIWTH6Uz2/cP9ieqYGieacR+Rl6aZbGmX00xHpCIMMH6Gh8AhX4JkhaJ6KuUDkI/OVRoZJyWRmLJ7vQubWlbinK7Z20TxWOyNLWucxlfnYyDChhlimotG/Ye5J2A+yhKsPfyHH5T/XM4sJ6MXdc8NLkoeeViyE34ojNqNdh/WtoWDTd4ZdD2HuR/fH+uzRmASnIa6bnBmM/IfbqpvX7BxpQWFc9/wXX5122+gLJ2mluUZn7+LtICmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egHMo954rEXsb0aCxtZ4+HZhqsooqjiCjJ19VN12AHo=;
 b=MnewoMnV8NPZ4Zsx/iTuDAZHQbTqTjk7EdwK1XmHDwafBf44NsAw0zw4zOmBqVCrt0fhXfzMiNOcb4uncowyDP7G3dguW+PD5gO5MoWaba13g801N4rS9e7GXQRQ8HL63FLqfB/hLdxIi8nf42zBmE8Y/6dGfEvxa5MyOF6gMu0jDOXEKDh3b+dFRwwSLYqHUPSwd/WvsB4dAJDV9eS/BMJ9vBJQ6dc1/ull4myMLgUggyOiGaakvQlnqqObgFu0WElDLkJY76dUCUhQvXXZydtC46QwFC9oDI4DNj17hx16QJIDHz8fgbrrsPtW6oEcQqdb64/VowDMiolJsAtKkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egHMo954rEXsb0aCxtZ4+HZhqsooqjiCjJ19VN12AHo=;
 b=TxQuHKSHFD92qrBdE59SRHBS9hCYKA3hCi5RpMKP88zuAWlyMzfAGOX2ZXF84tHXf4NFe90Glka80NmvKtwr+DcFYQy8Z6Dg9HCk+GQRc8xOcDQWJAU+BX3VCY70n/ITasTGDF+gjTwCMeRQWGBcTWkP8RPNQbKWtFE/prVEr1I=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
	<anthony.perard@vates.tech>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHauLJn3FT0TCW9KkmRq1iRWqwBt7HCqQ8AgAG9m4D//5AdgIAAiWiAgAEvHwCAAW0dgP//veQAgACIjAA=
Date: Fri, 14 Jun 2024 06:53:00 +0000
Message-ID:
 <PH7PR12MB58543888E330570A28DE2466E7C22@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-6-Jiqian.Chen@amd.com>
 <987f5d21-bbb5-4cdb-975b-91949e802921@suse.com>
 <BL1PR12MB5849FF595AEED1112622A98DE7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c2a5b9cd-2a85-4e01-8b8b-31b85726dbd4@suse.com>
 <BL1PR12MB5849652CE3039C8D17CD7FA6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZmrrNvv2sVaOIS5h@l14>
 <BL1PR12MB584926B7F6153287479E4CB4E7C22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3fde1817-72a6-484f-9777-567b062c1913@suse.com>
In-Reply-To: <3fde1817-72a6-484f-9777-567b062c1913@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.7633.034)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|MW6PR12MB8865:EE_
x-ms-office365-filtering-correlation-id: 06d656cc-1df3-41aa-0c92-08dc8c3ea145
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230035|376009|7416009|1800799019|366011|38070700013;
x-microsoft-antispam-message-info:
 =?utf-8?B?VDJ1czB3M2I0MUg5SDJ5a3l3UElVOFJFc3l6R1p3dmhuTjIwdXRERzZySmlJ?=
 =?utf-8?B?OXRmZUxWK3ArV1piQ0xSUVN3dUJJdXFYa3BkU3lmNis5NEZRc0VULzRKSzhZ?=
 =?utf-8?B?ZGt1UXJNOFJHNUFhdU5DYzRvMVhSUnNsWWJqOVdhTStiK1FzdytUQlpPZlRY?=
 =?utf-8?B?bWZHaU9aYzUzYlc1NDJBdGMrU29xN1kyZm1sYWNoamRBMW1MQXJwbFlnUlVk?=
 =?utf-8?B?QUhFMlIzWlpHeTFhU1A4ckNsVDkzZFE4SXFYbzU3ZHhoa1haUUw4WnhZZzR2?=
 =?utf-8?B?amNGdHRGbFM0akZPbTZCbVhVUEt0S3pucktXLzg5b3Myd3IrK1ZUSzF5ak1T?=
 =?utf-8?B?eml4Q0xDNjJwTS9Sc3V5R1JEdFVrdVF6bE9WZGpTMHo2K0tKVjBja2R2MHp0?=
 =?utf-8?B?REpUMGhodTlWcGxBWlM3aWdaMmkybVdNL0tWUzFGTTF1U3lsdkdlbjZ5UjlF?=
 =?utf-8?B?ZG5yS2ltRE1KdStIUXJtZHBSdHE5MVRORnZKcHAwYUpDclpGODFCOGlMNVk0?=
 =?utf-8?B?UnovejgrbmlSeTkyN2QvekFnZlMvS0Y4K0xvRmtydWEvWXhkeWdMSCtLUElF?=
 =?utf-8?B?WkMyNUg2ZFpWdjh0OFlsYW8vWExRbFZSdEluaFhDM3VubFNHdEJJZ1J4b0NB?=
 =?utf-8?B?V05nV2E0eWJQVnJoNGp1NXg0WGFFcE5qcVdCVEhhVUJKdWJWRlpoemtYK0JW?=
 =?utf-8?B?L2VaRW9tMXdTYXFBVUdadnVDNDBsMDN2NjhDK2I1d0E4UHJhUm5qaEdVcTY0?=
 =?utf-8?B?Ny9Ld1N4bDc2SzBCMGdHOFJHY2ZsWlhXMXE2N2FkM2FIdGVwQnBJaWlIRXNx?=
 =?utf-8?B?R1dZREozQkFKendxUEk0N0NHODArb1JBQ0dmNC8weTQrYkU2N3l4WUU5TWhT?=
 =?utf-8?B?YVNLWTVwT2IzWnJjSFJreWRTc3ZuTHAxbXh3UXJPNTIzNU92dithVzhheEM1?=
 =?utf-8?B?OWdPSkkyb3JNb2JWSk00ckFzVUVJQi9VUWRYTk5aYjNVQzBQTm1YbUZ3eXJz?=
 =?utf-8?B?R0FCTjFIK2lZUWRDK3Blc2dzYjZXQVNaT0pPSDRIdThZN3dBZDR6QTIzak9m?=
 =?utf-8?B?NlFNQVViRW1VU2RqcGZwTFVZUVJrTEx4UjJiZnppS1Zzd2dNdVUza09RQmZF?=
 =?utf-8?B?ZHQrNDJzY0pSSkFCTzhzQmJzVytHODhqeVJSZFgvRi9KVXBwdGk4SXpMV0Rt?=
 =?utf-8?B?ZDFvVnJ5MFZTR1c4UHpBY2ZEOFIzZ1hiT042bnhDQkFHMm1nMHN4YVFsb3FH?=
 =?utf-8?B?Y29iOVdXYko3bk1jWHI3SVpFaGh2aGVPOWZ6Ly9UOUpIVUZVN2V2TmRsZ2dB?=
 =?utf-8?B?YWs4YVByN1pLUitIdVlVdlltaUVHWlI0c2dSdEw4MUxKekRUNDJ2RG9MblR0?=
 =?utf-8?B?ZW1iTEhIZExGQ3dIbjduYVlnekF4UnkyMm1vQVIvTFZzYTdzWlMwN0lBem1K?=
 =?utf-8?B?d2cxUUlFNjVXK2ZUWFdhM3NKcDdJQ1RYWW8wSDM3R2QwK2xxL3JOSVlJVGNy?=
 =?utf-8?B?eCtDZUQzQVJYSkdJOXpDRnRyajBGWHJFbEhZcFh1U3VNaytiMlVjSHFucy9X?=
 =?utf-8?B?QjVGcEYvTFFuQUsxdDRidW1mWmc1NW5CWDFiMzI1NTRXWEVobUVGeDhIeUZX?=
 =?utf-8?B?aERxdVI0endiR2FBVWk5Kys2VG1ISE9zSVNvRWFBODIvR0laWDdCK0RoVjh4?=
 =?utf-8?B?Z2FFbENZT3dmc0M5eGg5R01mRUFmZ1NUNmlHT3JzYW5wRk9CcHlMV01sT1Zv?=
 =?utf-8?B?ZjNnOThjYURRMGp6T0hUUmljWURHYkF2OGRFb0F3VkV4QVlLVkJMVnQ5eWpo?=
 =?utf-8?Q?8UcdCJrf9gW14++vHv43umAVwuNSIDaspeth4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(7416009)(1800799019)(366011)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTRFaTVwcmVFY3QzRGdJRmZxUjRsT2l5Z0RkOHJDUG1heTIvK1Y3TnkxTHFi?=
 =?utf-8?B?SUdmdldKQitQUDRNeU9Nd3B3Tjdaclg3OUs5d0VRbURLWWk5Z3dxN0tyQ2tx?=
 =?utf-8?B?WUtqYUJyYjhLbVJrNUJ4YXFmb3hvMVRsTU1wVkZPbmlSU0E0bjBnMTN5U3Zt?=
 =?utf-8?B?N3Z0L0JtbzBFU0VLRHMxWFc5OE91WVdyWXlBTzlPcWhzM0JyTGlnbXRmVWZE?=
 =?utf-8?B?N0xjM1VvUG0wekhUNjNPY3R5djJXK1BFcjkrUTdSOW1Nak5wY3d4bGdMNEpR?=
 =?utf-8?B?RUhISlJ6NXNyYnNzanlrVnpiMG0yVlk1aGExWGpiQjJIbDFOWTJxTTU2am9p?=
 =?utf-8?B?cDFXKzRwRkV4Rjk3SUx3b0JieGlQMXNtSk4xMVhqQjlsZjEvS0Jyd0FLOTM4?=
 =?utf-8?B?cUJlT3dvOFBJZHdrYTlhMVl4SWViYU5sUVkzYXg1QkNEY0xaSjJpbVlwQ2Qz?=
 =?utf-8?B?YjNybWdPdWlmZkhSNnYyYXdRWUllQ2xaakQ0aVFuTDJJcnA4N29KL1U4MzRs?=
 =?utf-8?B?RVlwNzB6N3dneWp4YVQwK2thL0xvdk5rM3NxTDNQM282RUFOcWl2cC9qTTl0?=
 =?utf-8?B?SlJtUFQ0S0NHVURCd3RNN0pGRjNaTU1HUTFFV3VXWUpJTEMzRDJGY3ovY0o0?=
 =?utf-8?B?cHdCT1ZGMXlPamU3Nk5YeGJuTDRzZTViMlRoNjJmZ2trdVIwUEVZMlpZRjc0?=
 =?utf-8?B?SExtN3JtMU04QU1BMTNFTlp4VzNtK241UUU1S0xST3RLT0ZCcmxJTkNWSXdi?=
 =?utf-8?B?UWFhdUZYekZEcStsMzZ0d01XU29QMWNhSU83TWlBT21LVXkvMUdLMHlMWkkv?=
 =?utf-8?B?MnJCdCtrb0laRkg3bzloUjk0WFRyWDBSbFExZnpsY0w3ZTl1TGFHMHkwN0JZ?=
 =?utf-8?B?TTZ4Ynp0c2hrU0RKWmg2Y3FEbXNnSHhXN2owZ295YXlCMTRGczR5MkI5Y0ZW?=
 =?utf-8?B?dzh0STU3d2ZaaGZ2dUNzbWZQeXlrV0VqS0xxUUVVS0s2RWhPWlNaam1yTGtq?=
 =?utf-8?B?NGxSeUQ3N25RUlF4dHRuY1NCY1hJR0JwRCtFMTVkZ1kyd2VBem1XQ2w2bFpK?=
 =?utf-8?B?elRqUlIwOGJWSnF4UWxnb2xrRUhiS0xJNkJGbmdTSmY4b0pEdXpyb3plVTRO?=
 =?utf-8?B?eEpsS0gxR1ZGcmF5SjUxRitQU1A4Q1ozN3RRempQUXdkUXFDN1dVYk1ndkhR?=
 =?utf-8?B?dDNrWll0RWJPZmV5aDc2d1FEMERSOEhQc0tLTmtPNU1VejVtbEYwbDZRTGVE?=
 =?utf-8?B?cnBBazRyL1FBa05uSWdLdFIxdWlhUkFjelo1N3VCbkhKVm5Uak5hVVNwNSta?=
 =?utf-8?B?am9zUkh0VFRKVFA3S2FIRVJJL0hRVnBqbE0vRkt0blEwYm5Ublg2dXptVTNo?=
 =?utf-8?B?dkJiTURVemxpK0xNM2VOSFBxOWdMQ0t3a0xYY3lVM1JPRDJSVG5ZSG4wTUlR?=
 =?utf-8?B?T1h2WUN0TWZ2Y0dWM1BJbkZWYVpaeXdPcHIvOXp6Y09RVTJXdW1VR2FBR2hu?=
 =?utf-8?B?ZlBRMHVnc0swQTFOWDRRc05iVW5Nc00vQ01MVzRWRWgvd3dpaUp3L2I3UDE3?=
 =?utf-8?B?bnErbjdhNzlCZFJKTGZ1Rk1WOFM4RGtyakhyaXQxRUo4ZklWUlBXTDNNTnlN?=
 =?utf-8?B?KzBhcHhRQjVQQll6TngybVhJUUI4R2Rrb3MwbU5SQTlacUIrc1JRMFBPVGZo?=
 =?utf-8?B?emxXTHRWU0c1VzVqM0pLSTF1VHVxd0F3bDZGUHVyYVBNcW9hYmdrQmVwaUpR?=
 =?utf-8?B?ZHA3djRyc3JlTUdCTFJOK29JYUl3RnlPdkZsRmwxSC8zUTFlS2Z6QVN1ejBp?=
 =?utf-8?B?VW5zVG9kUDJaWjlkTEIyeHdwb1pLb1Vmb3pyQUIrVURuZGQ1Q2NIUG9WSFlP?=
 =?utf-8?B?bzI1WjVEN1cxWmdaOHN4eXVKOW5HM1BLVHNBcjBOSU5yL2pER3JkQ2lLRVE1?=
 =?utf-8?B?VnZjWjBCZ0pPc0YrVTFjcDFRZ1JndXVNV0dWUnRweWVlMlpIRXJQbFNYeW9B?=
 =?utf-8?B?MDFiZjBXeGxTb2VYT2ZVUytBd1FzR1I2aHVXTm5ySVNaYjhDb2dXbFl4b3hK?=
 =?utf-8?B?QVRES2YxMUk2UVFsVGMvTmVNMlYybFJhNEJyZ2h1d3p6YmhZTitmZmh5NWU0?=
 =?utf-8?Q?Jq0w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D76B493CA71BD74E82FEB103EB28F525@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d656cc-1df3-41aa-0c92-08dc8c3ea145
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 06:53:00.0775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i3kEB1DPxbGxiXSHV6vTsFoS4B4Fkg4bp606+GHEgvudLiB7kiSAF6XXyaGc8bWf/9axDClyg09OispwISk75Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865

T24gMjAyNC82LzE0IDE0OjQxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTQuMDYuMjAyNCAw
NToxMSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzEzIDIwOjUxLCBBbnRob255
IFBFUkFSRCB3cm90ZToNCj4+PiBPbiBXZWQsIEp1biAxMiwgMjAyNCBhdCAxMDo1NToxNEFNICsw
MDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+IE9uIDIwMjQvNi8xMiAxODozNCwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxMi4wNi4yMDI0IDEyOjEyLCBDaGVuLCBKaXFpYW4gd3Jv
dGU6DQo+Pj4+Pj4gT24gMjAyNC82LzExIDIyOjM5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
Pj4gT24gMDcuMDYuMjAyNCAxMDoxMSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+Pj4+PiArICAg
IHIgPSB4Y19kb21haW5fZ3NpX3Blcm1pc3Npb24oY3R4LT54Y2gsIGRvbWlkLCBnc2ksIG1hcCk7
DQo+Pj4+Pj4+DQo+Pj4+Pj4+IExvb2tpbmcgYXQgdGhlIGh5cGVydmlzb3Igc2lkZSwgdGhpcyB3
aWxsIGZhaWwgZm9yIFBWIERvbTAuIEluIHdoaWNoIGNhc2UgaW1vDQo+Pj4+Pj4+IHlvdSBiZXR0
ZXIgd291bGQgYXZvaWQgbWFraW5nIHRoZSBjYWxsIGluIHRoZSBmaXJzdCBwbGFjZS4NCj4+Pj4+
PiBZZXMsIGZvciBQViBkb20wLCB0aGUgZXJybm8gaXMgRU9QTk9UU1VQUCwgdGhlbiBpdCB3aWxs
IGRvIGJlbG93IHhjX2RvbWFpbl9pcnFfcGVybWlzc2lvbi4NCj4+Pj4+DQo+Pj4+PiBIZW5jZSB3
aHkgY2FsbCB4Y19kb21haW5fZ3NpX3Blcm1pc3Npb24oKSBhdCBhbGwgb24gYSBQViBEb20wPw0K
Pj4+PiBJcyB0aGVyZSBhIGZ1bmN0aW9uIHRvIGRpc3Rpbmd1aXNoIHRoYXQgY3VycmVudCBkb20w
IGlzIFBWIG9yIFBWSCBkb20wIGluIHRvb2xzL2xpYnM/DQo+Pj4NCj4+PiBUaGF0IG1pZ2h0IGhh
dmUgbmV2ZXIgYmVlbiBuZWVkZWQgYmVmb3JlLCBzbyBwcm9iYWJseSBub3QuIFRoZXJlJ3MNCj4+
PiBsaWJ4bF9fZG9tYWluX3R5cGUoKSBidXQgaWYgdGhhdCB3b3JrcyB3aXRoIGRvbTAgaXQgbWln
aHQgcmV0dXJuICJIVk0iDQo+Pj4gZm9yIFBWSCBkb20wLiBTbyBpZiB4Y19kb21haW5fZ2V0aW5m
b19zaW5nbGUoKSB3b3JrcyBhbmQgZ2l2ZSB0aGUgcmlnaHQNCj4+PiBpbmZvIGFib3V0IGRvbTAs
IGxpYnhsX19kb21haW5fdHlwZSgpIGNvdWxkIGJlIGV4dGVuZGVkIHRvIGRlYWwgd2l0aA0KPj4+
IGRvbTAgSSBndWVzcy4gSSBkb24ndCBrbm93IGlmIHRoZXJlJ3MgYSBnb29kIHdheSB0byBmaW5k
IG91dCB3aGljaA0KPj4+IGZsYXZvciBvZiBkb20wIGlzIHJ1bm5pbmcuDQo+PiBUaGFua3MgQW50
aG9ueSENCj4+IEkgdGhpbmsgaGVyZSB3ZSByZWFsbHkgbmVlZCB0byBjaGVjayBpcyB0aGF0IHdo
ZXRoZXIgY3VycmVudCBkb21haW4gaGFzIFBJUlEgZmxhZyhYODZfRU1VX1VTRV9QSVJRKSBvciBu
b3QuDQo+PiBBbmQgaXQgc2VlbXMgeGNfZG9tYWluX2dzaV9wZXJtaXNzaW9uIGFscmVhZHkgcmV0
dXJuIHRoZSBpbmZvcm1hdGlvbi4NCj4gDQo+IEJ5IHdheSBvZiBmYWlsaW5nLCBpZiBJJ20gbm90
IG1pc3Rha2VuPyBBcyBpbmRpY2F0ZWQgYmVmb3JlLCBJIGRvbid0DQo+IHRoaW5rIHlvdSBzaG91
bGQgaW52b2tlIHRoZSBmdW5jdGlvbiB3aGVuIGl0J3MgY2xlYXIgaXQncyBnb2luZyB0byBmYWls
Lg0KU29ycnksIEkgd3JvdGUgd3JvbmcgaGVyZSwgaXQgc2hvdWxkIGJlICIgQW5kIGl0IHNlZW1z
IHhjX2RvbWFpbl9nZXRpbmZvX3NpbmdsZSBhbHJlYWR5IHJldHVybiB0aGUgaW5mb3JtYXRpb24u
Ig0KQW5kIG5leHQgdmVyc2lvbiB3aWxsIGJlIGxpa2U6DQp4Y19kb21haW5pbmZvX3QgeGNpbmZv
Ow0KeGNfZG9tYWluX2dldGluZm9fc2luZ2xlKHhjX2hhbmRsZSwgZG9taWQsICZ4Y2luZm8pOw0K
aWYoIHhjaW5mby5hcmNoX2NvbmZpZy5lbXVsYXRpb25fZmxhZ3MgJiBYRU5fWDg2X0VNVV9VU0Vf
UElSUSApDQoJeGNfZG9tYWluX2lycV9wZXJtaXNzaW9uDQplbHNlDQoJeGNfZG9tYWluX2dzaV9w
ZXJtaXNzaW9uDQoNCj4gDQo+IEphbg0KPiANCj4+IElmIGN1cnJlbnQgZG9tYWluIGhhcyBubyBQ
SVJRcywgdGhlbiBJIHNob3VsZCB1c2UgeGNfZG9tYWluX2dzaV9wZXJtaXNzaW9uIHRvIGdyYW50
IHBlcm1pc3Npb24sIG90aGVyd2lzZSBJIHNob3VsZA0KPj4ga2VlcCB0aGUgb3JpZ2luYWwgZnVu
Y3Rpb24geGNfZG9tYWluX2lycV9wZXJtaXNzaW9uLg0KPj4NCj4+Pg0KPj4+IENoZWVycywNCj4+
Pg0KPj4NCj4gDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

