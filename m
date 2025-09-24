Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E740B98689
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 08:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128983.1469125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1JAB-0005YD-31; Wed, 24 Sep 2025 06:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128983.1469125; Wed, 24 Sep 2025 06:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1JAA-0005Vn-WD; Wed, 24 Sep 2025 06:39:39 +0000
Received: by outflank-mailman (input) for mailman id 1128983;
 Wed, 24 Sep 2025 06:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abgr=4D=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v1JA9-0005Vg-IV
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 06:39:37 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bd1afd1-9911-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 08:39:35 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Wed, 24 Sep 2025 06:39:31 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 06:39:31 +0000
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
X-Inumbo-ID: 3bd1afd1-9911-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KK359Zcq1bLL8rCrslV8sVs1H23zML6iUVS8YOfVa7fZsWTysCUXilJz3bOGNX3oAf4gOPFB08sE2gvYZyEP/d4CaoLwrcxvj7iiVrS5gIP0L4mY3IryFBOQEwyO7sdFl/RvMm/gbGhoDcImmt3nJIoUsNSL2pb8q3Eu4FCNlSqej4DZpD48tty1p6hj18SFo9OGQtq5pdLZiQCr+K075AuVBZLKVKEDr8SaoW52DcvqsrA8A4L2+SiohZ8XDVrXSJD5fw7CBOJ1MDRpBr19NtziDZihkcj9UwACFYeo4DPP0CHTdAQaNraBfil0xVUTOrmjwVtBn0YW3wUiDCL49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lptSSdVNYZRu2s6aCMuWaga4bKrS3C8zZyyGgUczNx4=;
 b=CIRQkeaUf3KvZUvRaBZ0+e01fovmmLlVN8UZNtODoqnJrWAbmuSB5wX5Tf1zhZPGtjCy1jqrzCxXBtqAj+HC4uDTBlrJmiVMXv+oRZJ8YzE4fbOpamaobAi+Ngem+t64T2ijW80EByeA1U3U61mI3DwvAeXAGP1KNKf50wXrcHlMPeulfSC0ndeYRvOm6zEyg+gVSBcSs863VVSxXF1M04wyH02iaYrQG5xChXTjb6LBLznION4Ofk72k2N3DLzYBvIQDSLaIandzLz28xKU2ZBTbBBl1GuKxbjfxvAOc1lNPwgI9hahjg2QUXFTWxmBLnlxyXXQw+uA8Dxs6r1WXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lptSSdVNYZRu2s6aCMuWaga4bKrS3C8zZyyGgUczNx4=;
 b=P2J9k2S+Hmg09qNViW9D6Al4/vWeNqVfcsWZP4oWvb5ckOHB34b8xz26YVSHwQdGoNri/b/hZ6k+A1AuFG5HMaIQDRTCxx9u5D4s7AdRFf74Uji3+0HuBD6KQKgcvmmm7P3hEZ6AcdFVq7Yc184wnheQaDFC+5q8kuZ6OyWgSDY=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 04/26] xen: consolidate CONFIG_VM_EVENT
Thread-Topic: [PATCH v2 04/26] xen: consolidate CONFIG_VM_EVENT
Thread-Index: AQHcIiYDHxl9uXccpkex+vWb0p4h67SMggMAgAVG3ICAAPOvgIAPObqA
Date: Wed, 24 Sep 2025 06:39:31 +0000
Message-ID:
 <DM4PR12MB8451FB860756DCE542F02BCAE11CA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-5-Penny.Zheng@amd.com>
 <b8430631-f857-426a-a144-c6b8fbf94ee9@suse.com>
 <CABfawhnzoDwo7vbFNN8wAnmEELoQND6snSE8m_VZnS0LWErMGQ@mail.gmail.com>
 <bbafea99-7f78-48e6-aa26-2e498e526f29@suse.com>
In-Reply-To: <bbafea99-7f78-48e6-aa26-2e498e526f29@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-24T06:39:17.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB8523:EE_
x-ms-office365-filtering-correlation-id: 1a6fbac4-2311-44b5-99c6-08ddfb351e3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VUNUT2I3VWwvc1Ava2FNWWtiQm5nWldhTHpJa09ET1p1TlNKUXpMamNUQ3E2?=
 =?utf-8?B?ajhwZU01dzQwQ0M1QnVIRVVnVFVxbDhZclhvUmRQYTFjbTIwQS8vcVhkNEZj?=
 =?utf-8?B?UWcxcXF2cklEbUpmbU5DYnpYNFJsU2U2NDlCOWVLUHpxQmVJK3oybXkrUTdB?=
 =?utf-8?B?LzU5WXN6ZHVDRGpDeXVrQUtQQ3pla1VOalkrZVJvWEE2QnRzTkhpSFVFOS9Q?=
 =?utf-8?B?eTY4aFBWTC9lTW9SancvU2JGQkxpV3JuZ0g4b1dNQW42a2ZjRXVvNEpLZS9Z?=
 =?utf-8?B?dU9sL1o2U3BRL29qOHk3S1prSTF0L3h3a3N0OFJhNnpocW10ckU0aUFocGRI?=
 =?utf-8?B?TGx6Ym1VQjF1L1VBcmRVb1VvcUtHOHBKUEFhcFhxZEZFUmFGRGdjQkpGMFds?=
 =?utf-8?B?SGhDMHcvclJxaVRjSXdyOStjTmphb05tZW16TXA0YVFjZGxtMGRlMmFiWWQw?=
 =?utf-8?B?TWZDdWk0RXpXWVZnSS9OY2xWY0dlSkNjd3lqOXphMGtHaHZHc1J2dkJXVHJ4?=
 =?utf-8?B?Yk1pQlZIUnAzZEtrNHl5ZzNNVGhLY2s2ZmY3YW1uejk3TDhSSjFvODlWMFFQ?=
 =?utf-8?B?UFVkbTVTOVZ6V3FwNG1RVHkrdHRUb1huYjVaV0ozRW01WmlWaS83QTFRN3pH?=
 =?utf-8?B?VWpnZWwwcXZQTXJ4U1pjMUYxeUdWY1ZaN084RmJ2VmREdmJWRU9xMm9pNjhu?=
 =?utf-8?B?blFhemVqdEovUHJ1Wm9mS08rTmt1TmJSdFJjTFhWMk81aHE1c0Z3QlFWbkxr?=
 =?utf-8?B?N0Z1elMxZW9kNUpUK0lmQit5VS9wV2M1OUc4TGRsUEdpUEVBelVrRFdjQmZi?=
 =?utf-8?B?MHlGSm5XejVCR09UOGNremxYV1NhUkRiMkRuN3d5QTlqN28zRmFMczFzSElO?=
 =?utf-8?B?QTNkenMyQlNmeEs5Wk1HZ0xSN2YramF1d0NOdVVjdS96YzVPNk1QRVpBZHgv?=
 =?utf-8?B?OUZudjNuTVBYUEl6TS9RSWhVWVJISmRVeUw4cGlIUXUweTV5QklDY0lzdFZU?=
 =?utf-8?B?YkdkM1pRVFFSSXArdnc4WGtUajA5a2t1UDhDRUtpY2s1bU5GVjhxejhmT2VJ?=
 =?utf-8?B?dUtyTW9ielVSTmNMaDN1YTFXall6OGwzQ0tHODVWNXJ5U2JsRGFwN3pYWUFj?=
 =?utf-8?B?Smc3SFkxTCtLWEZRYUk4czZoQVpicU1ra2tXbnk0OXdUT09CZU5UaXBtT2VX?=
 =?utf-8?B?aHl5S2t0ZWRPWThlOFIrcUNvRkFHZGhNWnZkWmF2Q2xTQ3Zmb3VDTFJPZk9m?=
 =?utf-8?B?c2FJbWlpdkNjQWhzVXJ4TW9id2krd0Y4THdGUXdwM01YNGNtTW1sSmZJNWVR?=
 =?utf-8?B?TUZDVkQ5S0lhR1crR1oyZElMNE9TTGQzZWZDN0hxQVZ6MDc3OEd1ZFJmRzBO?=
 =?utf-8?B?WjNiQ09QOGpzYk1MM21GMkZCMDhYSGo2bDZTTlFKZFVIdzBMVlZDTzBrbHc0?=
 =?utf-8?B?ZU81OU9vZFAveDVpanU4TUIxcW96dHdhakpKY0VMR1VsbGZObGVyZDEvRk84?=
 =?utf-8?B?bGFHQmtXVzZHbnNwekdVWWVOQUlqZGVKOGprVHc0MWpheTNlYU1PUWJWZmg1?=
 =?utf-8?B?cjVaeC9BUGljS3BRalUrWGpNenU4djFDMkErY3lQVWJzdmRpNWNmOUdDMDlZ?=
 =?utf-8?B?SkpoT2dsR2loWHA0Q1lpMUtndERsamtpQnFLdGI0U2tNckhicGlWdkRPT3Z6?=
 =?utf-8?B?bjVmc2VoYms4a2hiVS9ONG9JenFzbUFUOVZ1bFhoUWpTRjA5Z0UwZktzY1Fn?=
 =?utf-8?B?aXZROW5RWHFYaUdoalNvRmQ3TE9zMFpEL0lXeFpteFRQSlBBd0Z3ZWVUbnBy?=
 =?utf-8?B?M1QwWHRXcm5UMS9sSlRDaVByanhjVUFzZW8xb0xyQTBtU2I3enpIMjJUZFpv?=
 =?utf-8?B?dnVEMk0wVGpDSXhtSkNQVVgrcThDNy9GOE0rKzFETlhzTmkwRDVvUUpraHNZ?=
 =?utf-8?B?cDd4VlhsYkc1VTZvQ29LMDc3dkFQYWt3Z0xSY0pNVlpPeE5tOUdFUktTU0lI?=
 =?utf-8?Q?U5G7axBGjD9VX5IOQAcg3Rcy0p+UgA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RHA2ZVBicCtMQkJIcTgxblRHYVY0NHFQelY3Q2VCOVkzTmI5VytXa2UrL055?=
 =?utf-8?B?VllJQVROL2J3enZxeVRmZTJZSG5tVUp2Q1BTUkRNRzg2N0FHbXROUVBmT0Jo?=
 =?utf-8?B?VElxQVhhMmFmb2RMSldMNFBtTGpqcExOeDVjMUJ3RldmYzlTbGVvYUJodVZ0?=
 =?utf-8?B?QjdveEtFZE1UeXo4dzdpYk4zV0dPckQ2aUxnekVzUFZITHZBVHNlRCtSSldv?=
 =?utf-8?B?VzVYOElmTy9VOTBrRUtGWnZ0cVhBanpEZWUzYnU4bkQrVHVWSHlscm9aenpB?=
 =?utf-8?B?KzI3OTFQN3E1b2d3dW5FK01UNU1hOWRnQmdOMEY3QVQwY3ZOc1U4MGtxTUVZ?=
 =?utf-8?B?VDUyN3F5bW5iRXlNYVVGcWF1QmJkeEEzeGRTa0pwUndPRjAwY0V3VVYzbTd6?=
 =?utf-8?B?QWQzQ2ljdjdsZE9YclVidHJ6SDlKOEgwcVdIZUhlQW1CU0M4aU5UcWN5czJ5?=
 =?utf-8?B?ZWgxaWRkb1E2S0NhSWNEYTZubWNNT2svRGpzUGhsUCtUTUc3bnRuVXBDaUY1?=
 =?utf-8?B?RXFPT3VEWTlqeVgwOGZxN2NRSDhmbFVGdjVxL3pvNjJPck42NzJHcG5OOHdW?=
 =?utf-8?B?NlJlOXZMZURaRVg1TjgzamFwWklVRGI0RmpuejU5MmZ0eXZ5dkpUd1BVTGhY?=
 =?utf-8?B?Mmx3SDFiZ3RSVFp6Y2dVcS9SU1Rkd0wyMm8wRExKek1jbDFCR0dmWmwyL1RT?=
 =?utf-8?B?Smk1UjJNYml4MFhvSVNPZUYyMVdIQ2ZyakM4TXNKWEhnNTd5WkRITFFsdHFl?=
 =?utf-8?B?dFd4a3ZWNkdIck5oRjJEUlVleHdwQThrOXBrcjlNeTZnYlhIUmNCTHZzbGlF?=
 =?utf-8?B?QzZJUzl3T2FoRkVRVkJlMDJOeXRVL0Vyd1RibnVyNFhkM3lVRXF2R0pTYzZZ?=
 =?utf-8?B?UGVBaXZUY21HWm9iTktITlBpeFZpb1JRckNRcVJuUUhsYmEwbFNES3EyYjlw?=
 =?utf-8?B?Qmdmdy9sM1JyWlMyNng2ZGVFclRNREltUmtQRWFkS0Y3NklYNHpVc1I3eTdi?=
 =?utf-8?B?bFNVVHBYcDJwejRlSzBCYit1ZU1MR21KR2ZCbVI5SjRRV2JLWlFLb3I0UGpJ?=
 =?utf-8?B?TFl0MEtyMDVWOTBvaEErTVdhY2V1WkVyUlp2cXFOaWJ1VWl5eS9WV3hTdERy?=
 =?utf-8?B?eTA4TUNlSmxUNzdPaWpwYXNmbGo5WHN0enIzdmZtS09QM1FPZVFoT3JZYVE0?=
 =?utf-8?B?aEkrQU5BbUo4R01lSUxxQmNRdkl1RFJWWTliNjREZDllczg0K0FmcnJnUVpx?=
 =?utf-8?B?ek1BeFExU0dYSmRpQWxPUWE4YzlqMUM4ZUwzV0pJaDdxMkVmNnRWY0RWajlw?=
 =?utf-8?B?cmRYbzlxZkxJdWxIU3VvNEVWb01jWE9WMnR2QkNocHJtVjFnNjBURTR2YlRx?=
 =?utf-8?B?NCtjNW10TFBuVXdWcy9sK1RDNEJyMlVtWlJKSTg5bzBHUFZXd2Q1SjE1TlQ4?=
 =?utf-8?B?K0lTT3IrSzdLZ0dmeDM5S1NoWWtIRTlCeDd3Vlp3NDc4citxUksyYmVvcHRw?=
 =?utf-8?B?cGZ1czdOeHphOVUwT3JOS28vQi9RZzVkbDJhVjlJbW52eU85Q1IvTTBKY1Jv?=
 =?utf-8?B?RmtJUWdGNVRPeTAwUmhYdlc5M0grdGxVRm5KSjBJcDNrOW1jWjlQT1RrL3RY?=
 =?utf-8?B?bVRiMEdDZXB3ZC9rbDNSS0lFUzZ4Unk4SXpMcm1nRVN4NUhWSFUzUHVLMXBV?=
 =?utf-8?B?RWxMRkNyTTMyUGpJWHltMzVjYlFUaXRrSkQzV2lncFhFSVVyOTZnT01STDF5?=
 =?utf-8?B?ZFpLNzlNcmtyaEMwMGhnUWJIdi9CcW51OExteG10L1E4aGhQTkJwTnNtM0Rh?=
 =?utf-8?B?UnN1TXpYVTl6b0h5Q2t6QmdQMTByRXMwSmhRQnRtUjdLRG9TOHFqbnRiaDF4?=
 =?utf-8?B?bGl2RjNkZE9RTGNEcGZoYlpoZTRWT0FjeTlPUzg0YXhHSmRwZWhQejVmNXpP?=
 =?utf-8?B?b2hWUXZ2UW5EMUZyY2x6S3orU284dDk2QW53QURYQ2dzZzRKWGMrTVlESzJq?=
 =?utf-8?B?RXpsbDZnRXp1aFg1UDlSL1orZ2R5ODc4N0xMUURtdVU4dEN5bGNnT0J3dllv?=
 =?utf-8?B?RVlaMENmdis4U2piMmFLWFozSGlUSHRXQ2owWmZhSnVPRFZ1TzBWdDNJdnk4?=
 =?utf-8?Q?tvHo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6fbac4-2311-44b5-99c6-08ddfb351e3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 06:39:31.5232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eSOWZxPlEdgDytiOsMW8cNKRKIz4Mfe7HyT2h6SQ7xPX2RsLbIgRMatTP+9Rh9bM8f4o47oWlyQtoY1IfbJQaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBTdW5kYXksIFNlcHRlbWJl
ciAxNCwgMjAyNSAxMDowNCBQTQ0KPiBUbzogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPjsgUGVubnksIFpoZW5nDQo+IDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzogSHVh
bmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Ow0KPiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT47IFBldHJlIFBp
cmNhbGFidQ0KPiA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+OyBEYW5pZWwgUC4gU21pdGgg
PGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+Ow0KPiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwNC8yNl0geGVuOiBjb25zb2xpZGF0
ZSBDT05GSUdfVk1fRVZFTlQNCj4NCj4gT24gMTQuMDkuMjAyNSAwMTozMSwgVGFtYXMgSyBMZW5n
eWVsIHdyb3RlOg0KPiA+Pj4gQEAgLTk5LDEwICs5OCw0MCBAQCBsb25nIHAybV9zZXRfbWVtX2Fj
Y2Vzc19tdWx0aShzdHJ1Y3QgZG9tYWluICpkLA0KPiA+Pj4gaW50IHAybV9nZXRfbWVtX2FjY2Vz
cyhzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIHhlbm1lbV9hY2Nlc3NfdA0KPiAqYWNjZXNz
LA0KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGFsdHAybV9pZHgp
Ow0KPiA+Pj4NCj4gPj4+IC0jaWZkZWYgQ09ORklHX1ZNX0VWRU5UDQo+ID4+PiAgaW50IG1lbV9h
Y2Nlc3NfbWVtb3AodW5zaWduZWQgbG9uZyBjbWQsDQo+ID4+PiAgICAgICAgICAgICAgICAgICAg
ICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fbWVtX2FjY2Vzc19vcF90KQ0KPiA+Pj4gYXJn
KTsgICNlbHNlDQo+ID4+PiArc3RhdGljIGlubGluZSBib29sIHhlbm1lbV9hY2Nlc3NfdG9fcDJt
X2FjY2Vzcyhjb25zdCBzdHJ1Y3QgcDJtX2RvbWFpbg0KPiAqcDJtLA0KPiA+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGVubWVtX2FjY2Vzc190IHhh
Y2Nlc3MsDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwMm1fYWNjZXNzX3QNCj4gPj4+ICsqcGFjY2Vzcykgew0KPiA+Pj4gKyAgICByZXR1cm4g
ZmFsc2U7DQo+ID4+PiArfQ0KPiA+Pg0KPiA+PiBTbyB0aGlzIGlzIG5lZWRlZCB3aGVuIFZNX0VW
RU5UPW4gYW5kIEFMVFAyTT15LiBUYW1hcywgaXMgdGhpcyBhDQo+ID4+IGNvbmZpZ3VyYXRpb24g
d2hpY2ggbWFrZXMgc2Vuc2U/DQo+ID4NCj4gPiBZZXMsIGFsdHAybSBzaG91bGQgYmUgZnVuY3Rp
b25hbCB3aXRob3V0IHZtX2V2ZW50IGJlaW5nIGVuYWJsZWQuIFRoZXJlDQo+ID4gY291bGQgdmVy
eSB3ZWxsIGJlIGluLWd1ZXN0IG9ubHkgdXNlIG9mIGFsdHAybSB2aWEgI1ZFLiBUaGlzIGZ1bmN0
aW9uDQo+ID4gaXMgdXNlZCBpbiBwMm1faW5pdF9uZXh0X2FsdHAybSB3aGljaCBtZWFucyBpdCBi
ZWluZyBzdHViYmVkIG91dCBsaWtlDQo+ID4gdGhpcyB3aGVuIHZtX2V2ZW50IGlzIGRpc2FibGVk
IGJyZWFrcyBhbHRwMm0uDQo+DQo+IE9oLCBpbmRlZWQgLSB0aGUgc3R1YiBzdGlsbCBuZWVkcyB0
byBoYW5kbGUgWEVOTUVNX2FjY2Vzc19kZWZhdWx0LiBPZiBjb3Vyc2UNCj4gd2l0aCBNRU1fQUND
RVNTPW4gaXQncyBub3QgcXVpdGUgY2xlYXIgdG8gbWUgd2hhdCBwMm0tPmRlZmF1bHRfYWNjZXNz
IG91Z2h0DQo+IHRvIGJlOyBpbW8gaW4gcHJpbmNpcGxlIHRoYXQgZmllbGQgb3VnaHQgdG8gYWxz
byBnbyBhd2F5IGluIHRoYXQgY2FzZSAoYmVjb21pbmcgaGFyZC0NCj4gY29kZWQgcDJtX2FjY2Vz
c19yd3gpLiBXaGlsZSBkb2luZyB0aGF0IHdpbGwgYmUgYSBsYXJnZXIgcGF0Y2gsIHBlcmhhcHMg
dXNpbmcgdGhlDQo+IGhhcmQtY29kZWQgdmFsdWUgaGVyZSBzaG91bGQgYmUgZG9uZSByaWdodCBh
d2F5Lg0KPg0KPiBPbmNlIHRoZSBjb2RlIGNvcnJlY3RseSBoYW5kbGVzIE1FTV9BQ0NFU1M9biBh
cyBhbiBpbXBsaWNhdGlvbiBmcm9tDQo+IFZNX0VWRU5UPW4sIGl0J3MgYWxzbyBxdWVzdGlvbmFi
bGUgd2hldGhlciBNRU1fQUNDRVNTX0FMV0FZU19PTg0KPiBzaG91bGQgYmUgcmV0YWluZWQuDQo+
DQoNCklmIHdlIGludGVuZCB0byByZW1vdmUgTUVNX0FDQ0VTU19BTFdBWVNfT04sIEkgc3VnZ2Vz
dCB0byBkbyB0aGUgZm9sbG93aW5nIG1vZGlmaWNhdGlvbiBvbiBWTV9FVkVOVCB0byBzdGlsbCBr
ZWVwIHkgb24gZGVmYXVsdCBvbiB4ODY6DQpgYGANCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tj
b25maWcgYi94ZW4vY29tbW9uL0tjb25maWcNCmluZGV4IDdiZDhhMDQ3MzAuLjYxZDQ4YTUxMjAg
MTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL0tjb25maWcNCisrKyBiL3hlbi9jb21tb24vS2NvbmZp
Zw0KQEAgLTE3MCwxMyArMTcwLDEwIEBAIGNvbmZpZyBIQVNfVk1BUA0KIGNvbmZpZyBMSUJGRFQN
CiAgICAgICAgYm9vbA0KDQotY29uZmlnIE1FTV9BQ0NFU1NfQUxXQVlTX09ODQotICAgICAgIGJv
b2wNCi0NCiBjb25maWcgVk1fRVZFTlQNCi0gICAgICAgZGVmX2Jvb2wgTUVNX0FDQ0VTU19BTFdB
WVNfT04NCi0gICAgICAgcHJvbXB0ICJNZW1vcnkgQWNjZXNzIGFuZCBWTSBldmVudHMiIGlmICFN
RU1fQUNDRVNTX0FMV0FZU19PTg0KKyAgICAgICBib29sICJNZW1vcnkgQWNjZXNzIGFuZCBWTSBl
dmVudHMiDQogICAgICAgIGRlcGVuZHMgb24gSFZNDQorICAgICAgIGRlZmF1bHQgWDg2DQogICAg
ICAgIGhlbHANCg0KICAgICAgICAgIEZyYW1ld29yayB0byBjb25maWd1cmUgbWVtb3J5IGFjY2Vz
cyB0eXBlcyBmb3IgZ3Vlc3RzIGFuZCByZWNlaXZlDQpgYGANCg0KDQo+IEphbg0K

