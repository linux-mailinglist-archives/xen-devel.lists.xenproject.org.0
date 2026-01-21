Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIQnJmiVcGlyYgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 09:59:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0434953F78
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 09:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209461.1521451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viU37-0003EK-Ch; Wed, 21 Jan 2026 08:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209461.1521451; Wed, 21 Jan 2026 08:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viU37-0003Cc-9S; Wed, 21 Jan 2026 08:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1209461;
 Wed, 21 Jan 2026 08:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GdGN=72=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viU35-0003Az-KV
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 08:58:47 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 651057e5-f6a7-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 09:58:46 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV4PR03MB8210.namprd03.prod.outlook.com (2603:10b6:408:2de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:58:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 08:58:43 +0000
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
X-Inumbo-ID: 651057e5-f6a7-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEHFnL4gKFIO5QwwTWLZYRkNQjcs6SzrGsV6iTl33he3mRJ+YDhYzVvMyVmOiTj1pvDcEEai1EFD7T6S4++NeRzCsYbeRYdri5rvqRBK+yicRRmemOYaBuV6NEJG9kbNLmSXyqUTbHbzY9zIXSMIdLclBZN7cUGReamY7p68/z7vswrB2o93xdyvdG40nJh7CkclrhZqdgxr9YdCLQG/5eiPXuC9B/rNXKS9kB3PlAqrsCqDfc/C8TSJzl7bGyh1kWxo2n+zUM/K27mqHNXwOTw9B4tkJ9n7c7KpaCHhgIHT3uoKFFpa0TxB5A6IVXvxDao4m26klorBwTF//qPmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMuGCgRmH5MgxUN6mJfbu884doXdknrIKiMb/spnFNY=;
 b=EAqUXfd33DRgk+yYly3vG8lOyYJwPfcK+LRjE4KNaeE96bEQiEppk9Yfa+SzqbvM/Sq2OXr+Zi89Ak2E3iyIvuYC5Fu815dRAV0uxj3BPJCkK2ZWL90iGNRLGm3dCMtISWTICEN74Ju5C/FXVymMwIzrNg5kbW2SLvIiUmbZX/djUO+eXLMtGl3Wf6m3sURX2UAVHOmUwICoCqQqG7WV2DPVp/0JH0Kyek+kdjyQoluk4ldTR04ME66NIuHvKALH7gjMpsySdfWi9nLEhwNJfIt+H27z2uOQWHhYP88G08azigr0cQ3OqEYxNWj/YE8Lbp5ZesM7PYQCvKnphrOoIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMuGCgRmH5MgxUN6mJfbu884doXdknrIKiMb/spnFNY=;
 b=R/Ns7dWyhobDIxoocd3RiAWzN0z9FTf/19ipFF4Rtc7VFr/p41H/c01t5wezDSZoHl7cdiJds+d7Ce7NcZkmkPKAjn4TeNuAD8Hc8guIVvXbScT4rXgN/+I2QgtYfKDfA8gl3nqaSNmQGfk/XDfiNTawclMk84Yjay0U7Ke8oQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <388ef292-d0c5-4942-8760-b3666ebbb991@citrix.com>
Date: Wed, 21 Jan 2026 08:58:39 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/CPU: extend is_forced_cpu_cap()'s "reach"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <df6ce908-4c8e-4ac0-b663-95772d6ff9c9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <df6ce908-4c8e-4ac0-b663-95772d6ff9c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV4PR03MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: c107c157-7833-43bc-fb95-08de58cb4723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXN1YUp4NzBJQnp6OEhpUWVlWEtwclp6cjhWTjhXY0ZrWXRFM3FnVndVUi9u?=
 =?utf-8?B?MEZQdWdrN2hpTlVuWnlkQ3VEbUxPaW5jdVRMOEVJK0NIbWhTM3JIWmRjRFFi?=
 =?utf-8?B?aFJCY09CL2tTYk5SMXZaSFBjUkl2eSsvcGpCVjNzNjlFTlJtaTFNQTU2SUJG?=
 =?utf-8?B?NUpkYS9kdEsrVU5HcmE1b0k3QjFRN1JCN2NKelB1b3VzeXE1ejF4TFpZK2Z4?=
 =?utf-8?B?aVpGYTlMUGllbnFkU1ZQVTFpbUtOMnJpN1JwSWppM2RGZnNNKzMrdURrYWx5?=
 =?utf-8?B?ZllqYzBhYzJGeWp5N2RBZ3NUdnJDK1p3VXpRNlpCTzBQdks5bVR2UyttMUl0?=
 =?utf-8?B?aHFsR0Fqb1ZyUGFFTDNrMk8zQVY0c2s0b1MwSWQvYUVzQVN1NWd1RUUwb3BF?=
 =?utf-8?B?aTNSR3UrUVVNTk5IQnNoV3VZWTJJK2ZjM3RxV2tKblNxSDRZK3RtcDV0SVN1?=
 =?utf-8?B?OHZ4aEpZUTFRSkFxeDlsWHcyM0c1cm5QdnJxSEJWaUlIRk13ZGYveS9SZ1l4?=
 =?utf-8?B?R2ZTWWZBMHBBcFY5SGYrWFl1eTg2V1FpeFRGTGFGa0FZVys4TmtFenVyU0w4?=
 =?utf-8?B?NFYrNThUMlZnNTR3RGdPYzVoQ3d4SWhZcHhyMjFSTUVWZjJhVDRCZi9ob0Js?=
 =?utf-8?B?QVdXUHdKSXVBSDRHbWQ1c1Uxb205WHpFUTdBd3ExMC9uWEFWMzRxVGdYaWFR?=
 =?utf-8?B?OHNLa09nbUZ3dEQ3TlNsM2x1ckRXZUlCSmhMY1NmUXExQmIyWUp3MmgzWjBI?=
 =?utf-8?B?SFZJaHBJbnVURFBFVk9ha2FWVUgwNGR5ZmZrQUtNcWlqUDF6YXRDb2lReFJZ?=
 =?utf-8?B?QUZFMXNBRldIbVRoM2NRL1EySTNxd2tQamhIL3BLbTZwMzJpQUJrdUFLc05X?=
 =?utf-8?B?b1VObEI1RUxXY1I1R1AyWVhtSzlBM3BHQkZzRy85aTF6elpyZnpIWE5renIz?=
 =?utf-8?B?Q0RyV0lYSXV1NFZJM2RkMlBlejEwSTNUMno4Q2ZFc09JRmdaVGppQURLMTN6?=
 =?utf-8?B?N1N6YU9LWUd1ZkpQc1BFVTBjNExheXFHc1ZyOG5rYllSVSttS0FURFdaeVNB?=
 =?utf-8?B?ak5SS3pXakR2RS9MV2xCS1NMamtTekFBYlU5RHFhcE10NzcxS3pldGR3Ujhu?=
 =?utf-8?B?R2tyUUI1WEVZc1R2Sm11dDNXOWxiaWRZLzQyU2hCZUNocElHcnpoN2NFd0xm?=
 =?utf-8?B?U29YOHhDVnZZZGp4VytSM1JWeXdHZHdnUU9LY1U3YXRHT1RoeXNtT21KRFpZ?=
 =?utf-8?B?MXo5T3ZOU3RRTDY1MmMzUWdwK1Y1QkZYdDUyK1RaaTRTR2JwY1ZhYXBEZlpD?=
 =?utf-8?B?Mm44MTY3NUc4UFp1c2R5RCtVZ3RHYU9YQ3E3dzlUS3duRU1hRVFINFc3dnZ4?=
 =?utf-8?B?cUJmS1k1RGdEVmVNQnhPaG5DTHJCdHdMejFQcTZjajNYTCtSOGg0LzlmWVZE?=
 =?utf-8?B?eDJMMVFrWVdUY0Flb2JVR09sYlZSd0RSdUQveEFYWEg2VmlUQ0syTTF6NDdK?=
 =?utf-8?B?a2pWM3N3eGVzVmd2a25hVjErUkl3TS9aaFJpZ3lCRU5MeFQ0RGV1QWlhQW10?=
 =?utf-8?B?MTNGSkZrTzJhM2xWQWpabjBDN21LdGNNUDRQdFJtd0ZpSUZGQXhCdER0Mktw?=
 =?utf-8?B?NGZldVVyTXo4Wlp3Z0ZPRUUzb0N3aGUxaWRlQ3lJR0s5MDB0WEZ5TlB4WlBM?=
 =?utf-8?B?aHpoS0dvYldYNXBhc2FKcVFJY2ZqN0ZCcmlpOGZSQ0xMa2tDeUVIbVdTLy9L?=
 =?utf-8?B?Qko4SUpDZ0N1dkozdkt5UjFuUTI5UXFsUUtHQWV3S2tTWkQzS0Q0cnJic0pZ?=
 =?utf-8?B?OGxURGNuWk85MS9hSjBqUk5IUGtMZ1hhMGtseVpVemsvOVhLY3pVejBIV2w4?=
 =?utf-8?B?VTFmVnhVQ1ZwU2pNRy96b2hFNk5PRldncys1L0ErYncvQk45bjF0R0J5alFk?=
 =?utf-8?B?aXRIN3FKTG5XSWRwSXE5RitGRWtaUWdWQnp0Qy9xNEVrWUl2aGNGMjhna25q?=
 =?utf-8?B?KzJQb0l4VThJaFRLai9UdTh6S0FPbHpDL2dBNWwxNTRGSnM2U3NPMk9TMnJW?=
 =?utf-8?B?YmlmbVhUenpkQUluSVJ1Y0ovV2lucDU2a2poN2s1YTAzNjM0WXQ0RG1JTk9D?=
 =?utf-8?Q?R8M4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVVqMkphc0Z6MmJLKzJPRG9RMW9lUzV4NzhSQUNYVUsyQnlrTk13QVVJZk1p?=
 =?utf-8?B?U2NVWHJtOUdGNkUyeEdscjhsVTlXbnBlTTh3MU9yV1Myd2x3T3VoYllNdEJs?=
 =?utf-8?B?T0ZaSWsrbDFjV0ZiTGFCbER3bmg3a0JpcXFOMzQwRmN3cjB6U0JVZXpaU2VI?=
 =?utf-8?B?Mkw5MVNkOGZPMUhiTnYydHJ6ZndpTmhlVnZpU2V1eERLL0o4QTdIY2xTTUlz?=
 =?utf-8?B?dUJXQlV2Z3FiMkc4WUdKSWZ1dmZYVVlNRW5WMzdJc1Nuc1Y2QW5tSVdNSmdY?=
 =?utf-8?B?QjV4L1JtUkxTZGxMNkNCc1Qyd1R5QzZzY1o0WkVqc203ZXE0a3ZUeXVUNXZC?=
 =?utf-8?B?Q1JTQ21aaUNCemFYeVlRNHh2dlp5eDNkbU1ZaXkweHU2MW5JWURQalZGSjhl?=
 =?utf-8?B?UVpLMGs3QlljbFNCalNiQlp5aEdjMjEra2tRUHU0REtSMHlaK3ZwOGtmZ3lv?=
 =?utf-8?B?RkVXYzJsaFpMUUNkenZ6Z0J2QVZUTEpKcEc1LzdaWkxoeVFETzh6MnJINERB?=
 =?utf-8?B?alMrSzR6U1FtZnM1emRFeHd6QmxiU2dKd2RBcnBRdGMzMmJlSHAyYXVYcjkz?=
 =?utf-8?B?dFdUTVRhR2lVNmJ1T3RmRzF5d0c0V3l2MWFuUisvMU85d1luenJzSmVQcjRF?=
 =?utf-8?B?RzJTeUkwRDRJbHI1ZWRqbEtDNlFYQVVIZEczWml6RytBODNaanc2Y25XOG10?=
 =?utf-8?B?empaS2JTN2t6RHp4K3QzZURTVjFoRC9SWFY5WjFCaVR2VHd4eWlPczFBU1da?=
 =?utf-8?B?SGZLOCtzUUFxMDJ3MnI4Q0lCb0x5K3BxZm9xTkxGblhaNkoxaGRHYWYvUi8w?=
 =?utf-8?B?NVh2SG9sQzArSGJFdUN3RGRKQzFodURGdVRpcVFHNm9jMHUxSmZhV2pPb0w3?=
 =?utf-8?B?clR0Q1dXTC96Yi9GeGEyNzVhK0Q0TkRJR2ZxamVrZHVLdEx1UDgrNXBZR21J?=
 =?utf-8?B?WmxpcDJaekhZTExmM3hxSm5CNDlJdWVMbmpOSmFVYVVBendDTThyY2ZYemlo?=
 =?utf-8?B?L3lLUkFiMUJKU0ljMHNyWDB0WHlqcUd1TmpEd0RrY2w1ZUtTT3FpUXhjS0pW?=
 =?utf-8?B?cmFSM252U1B0Zlp1QmlRYTNraW5iOFVSTkpBbXZnU0dTU003c0l2MkZSelMr?=
 =?utf-8?B?VG1xejk1aFNKZ20xMFlXMjhXc1NVcUtLbVI4eCtra1lxN3NEVFhvMFJpcG9F?=
 =?utf-8?B?L1E0THIvcnF4R3l6S3FvQUNnOXRWbUR3ZXFqdEkwSGNTY3k4Tk5vUkN4WDd3?=
 =?utf-8?B?Y0dMZTIzcStWWlR3RTFpUmNWOFZ6WFpOM0lxMEFvREIxMzltVzl3SmR2YjJ4?=
 =?utf-8?B?Q2VodGp1LzRvdk9KSk0zSzVyZXY1RS9vYW9RanF1NUhta05TL2hPbEVFNW1i?=
 =?utf-8?B?SHpCTTQzaFZBRktlTlg3Sks4SUQyZldCcW0rbGY0UmlLZTZrdkdQN1ViNXAr?=
 =?utf-8?B?Tk9TU0lsMGluekxtcXZBQ2tGeXdmSm4wVjhyeDEydm5iQkhuMDNjcU5KMEVy?=
 =?utf-8?B?VVh0ajFtSjkvT0hMTTRRWFhPcThBWmlmbnZNYktBcGJzQis2aFpzaVlwSlV1?=
 =?utf-8?B?UDRyZ3A4STlNMzVUa0VGamkxN1BRUFk3b1JuOERVeWRxeVZRZnp0b2lyNnBY?=
 =?utf-8?B?R3I5SGpQK21YVGwvNXkvNkhEQU4xNnhNbng0ZmtrUVhiLzVMQTNqM1JQeGw2?=
 =?utf-8?B?VWNVcyt2Rm1kTEkvY21XSm0rWUxtYVN1bTA5NnZRcFNtbklpYWJFRnlqY2N4?=
 =?utf-8?B?VURlYm1pZWFMUHlLcjhwN1pSUkNWakJaQ01SYzAwcXFwOHdSOVhXNW4zZnRN?=
 =?utf-8?B?N1Fxa2pscU9XTkV1cFVnWVZyMHdOREhzR1BkSytNa2JMNFV2M2dRNFU3WXl6?=
 =?utf-8?B?RWQ2T1o1Zk04dU9KR245a3ZoYWh6Nk82NGpKSG9XN0RSVVZRT0oxYnR4dWdV?=
 =?utf-8?B?QnpRSURzUUFPOFBoc21hcDJvUlFlQ0lJYUJjRDYzUGdzSlVud2FIOVFIUnBs?=
 =?utf-8?B?OXZmd0Q2UFhtREl3S0xmTEFqbXFmRHhORk1SQkdhWnIrZ0xVK3d3V1R5L2Vu?=
 =?utf-8?B?QTJlcWxKU2xHQndLSGpSVDg4RjBvSGp6S21IN29JQXVHdzNOSjZXTHNlV0xK?=
 =?utf-8?B?dE1XOUZ2eEliR1c0NCtPRmh2UmlGMnhQdmQyRDdFbERMcU15bnRlQnRzbFpt?=
 =?utf-8?B?YkcrYlNuRmRlMUNYWVMwZnBrTmVKTzhkb2tXSjREZGtVSyttQUJuQk5HRU5G?=
 =?utf-8?B?WGIyMVpFaWZhaGxoQzNEOFB2Ty9Pcm5XZC9vcGNoTnl3bkV5Y3dyZUVRYlhN?=
 =?utf-8?B?RzVVMHVBZy9STjFXQWpaVU5zMFRQZXJWMzB6UWNpVnBwYzlVQzU0M1g1TkNw?=
 =?utf-8?Q?cgX92ykpX9ubaB8M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c107c157-7833-43bc-fb95-08de58cb4723
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:58:43.0380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cehy43vpOdmWF0AhLlNh1vDsLEt61K1j3lAY/yPn2AgYbwnjDHprPX1AMWtavMrMBRYh8puZK3gFG4Xl9c26LlgEC+jqw0e+Rl/scBn7XcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8210
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0434953F78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 04/08/2025 12:28 pm, Jan Beulich wrote:
> "cpuid=no-rdrand" cannot actually be used to suppress the respective
> boot warning on certain AMD hardware. That's because cleared_caps[] are
> only applied after the ->c_init() hooks ran, i.e. cpu_has() still
> returns true in init_amd().
>
> Fixes: 93401e28a84b ("x86: clear RDRAND CPUID bit on AMD family 15h/16h")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

