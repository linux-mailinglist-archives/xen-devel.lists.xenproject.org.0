Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB27B49AB0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 22:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115506.1462067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvi8W-0007Qa-Hh; Mon, 08 Sep 2025 20:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115506.1462067; Mon, 08 Sep 2025 20:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvi8W-0007NT-Ep; Mon, 08 Sep 2025 20:06:48 +0000
Received: by outflank-mailman (input) for mailman id 1115506;
 Mon, 08 Sep 2025 20:06:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfiH=3T=amd.com=Soham.Dandapat@srs-se1.protection.inumbo.net>)
 id 1uvi8V-0007NL-9Z
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 20:06:47 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2009::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 571dce00-8cef-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 22:06:44 +0200 (CEST)
Received: from CH2PR12MB4022.namprd12.prod.outlook.com (2603:10b6:610:22::13)
 by CY8PR12MB7684.namprd12.prod.outlook.com (2603:10b6:930:87::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 20:06:41 +0000
Received: from CH2PR12MB4022.namprd12.prod.outlook.com
 ([fe80::2f2b:54c8:a3e2:bf72]) by CH2PR12MB4022.namprd12.prod.outlook.com
 ([fe80::2f2b:54c8:a3e2:bf72%4]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 20:06:40 +0000
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
X-Inumbo-ID: 571dce00-8cef-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrurOpLctZ6fAFy9jnrkkiT0yPm9pS2ce5GZeyi/MAAVo1H+jxU9OeqVmm01iZzZh2lcUWLrpm7G4wVjmvtvZ2im2FLCzD2/fL4grAyfiyi7aEmUh+ZgmfIKyO3DJ8EbFAA96IIFyppAs1Ab5OEo2A0vaPnqRoge1lqVwpLPkTtyGtowGd0i8aEyUHH+vvC1vnRnZMuDcFgcPQT/CC/7CXtjca314koicYOxSe9pU3/o+dZVYpB96wgK7ny6Hj7Al0cMJGcr4WED+vIKlObr2lzWbCrcG+mz35kKG9e1HKgxq/0NJxJnSb0d1h4J6cRb/PqZoX0gom+QIze66KxCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m98ee3vJ1r7l9MHJtQV/bgza4sKMbM4tmf/7OOM8wvI=;
 b=X5kjlXUYNLlpIj2BjN1c17fAv1FslerAxENx9KTF+LH+cqLqQWS14cQPEskKVL8QER68mwfoUa9B9j3OjCFP/2vAtvLfEXieX0Xo/pffEGFwiajiFXChkupZmLF0LsZdmUn1bl+kQ6L5be56Y2ClhfmwdteTmd++jAvrZSbuYMzQ8Rd1/MzHPad86IZnvF9bpulrQIYnKpEAibkZYB59WaNGQQKpr0TPytBsa8oK3Y1N2sPN9GNgHKgLA0RI3jvRrtO5gr8bwroyl5ojJem9uKix/yskuFowI5BJLacocoqRSvLCea0tBFXnaN+ck9h6OZhAFd1F/15lEW5c7KafDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m98ee3vJ1r7l9MHJtQV/bgza4sKMbM4tmf/7OOM8wvI=;
 b=UE2hi7f20LYznRh9f8b1+bzmJ6+uBOp6hWEsN5PPOk/fRGi16z2cO0fin9Xxt8jgJrhP36PGZloi1fuoiDt6g+0KQ2CFneuMztV9genqgpV+ilc/++ANsM4Lgaejn93n9ZLdOE1DXByxsMBeRtTCPxpU9QPL12dPaRvkIbPIOEE=
From: "Dandapat, Soham" <Soham.Dandapat@amd.com>
To: "Andryuk, Jason" <Jason.Andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] x86/mcheck: allow varying bank counts per CPU
Thread-Topic: [PATCH] x86/mcheck: allow varying bank counts per CPU
Thread-Index: AQHcHoXdH9CZOm3Bdk+HDpewzgmH0bSE0JqAgAQyqwCAAEu9gIAAaWVg
Date: Mon, 8 Sep 2025 20:06:40 +0000
Message-ID:
 <CH2PR12MB4022B977035B950E64DA059A800CA@CH2PR12MB4022.namprd12.prod.outlook.com>
References: <20250905165212.96843-1-Soham.Dandapat@amd.com>
 <32f89ab8-9742-4bc8-a5ef-848b66e788b2@amd.com>
 <89d0b668-537b-4ee4-8cda-e0d95d9eed90@suse.com>
 <b4a86a0c-0e4d-4aea-aac4-1c12f7062ca1@amd.com>
In-Reply-To: <b4a86a0c-0e4d-4aea-aac4-1c12f7062ca1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-08T20:04:27.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4022:EE_|CY8PR12MB7684:EE_
x-ms-office365-filtering-correlation-id: f735a736-2e57-4f5a-df16-08ddef133992
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a1V1bHZLTGVQRHJIRmlGYmQ3SmJLY2dyZW5pZ0ZuaG9VUTNXSUpKZ3RXaUE0?=
 =?utf-8?B?azVHSkVwTHZjQXkrRFJvbDFZZThVb2NHUzFMZDZiU2pFb3E2d0hYdDNUckp1?=
 =?utf-8?B?ZHBkZGlRanBHTTh1OFhEUVZaSGgwdmF4OHdXdmxZcWNaY3lmRXZIZEN5ajMz?=
 =?utf-8?B?L3UyaFFIdmRDa0Y0WGpWdjRFbWh5SEJqc3VQUjRBZ09KUlhvSVRDT1RJOENK?=
 =?utf-8?B?MjVmekVRL205YTEySEhyUjJOM3REYzhOSkpmSE1LVlNjdUcxUk1VUnlYYlIw?=
 =?utf-8?B?VU5YeUVGWkNtd0F5U1pEd0QzaERkWDJXUmZFVVRrMWkvS3h0NnBOQkw3OTN5?=
 =?utf-8?B?VTFtZkJZczA2eDgzQkRMUVlGZ3kyR1Q3czc2SDgvaEFpWkdwU2tMVVZyZDQv?=
 =?utf-8?B?N0phUU91NWc5TWpReExMaDZhNm94TWIrOVFHNFhxL01kdUxxaC8rcGdDYlFu?=
 =?utf-8?B?T1J3TEYyN2IrOE05R1Y3MThvT2dmUkUxUE1nYTg2c2E1eWVzcS9JVzMvaHZ6?=
 =?utf-8?B?SjRpM2c1ZGVTTllGZzEvYWJ3ck5OQy9mL0NlbkFkS1RuNEVmUnlqMUtDVmRs?=
 =?utf-8?B?MnNQM3FJSUxDZEpFenE0TEc0ZG9BOXVBMFU1NFdMbTJhTXdvUXc1dW9yOUY5?=
 =?utf-8?B?cTZxaWxIWExxdy9YVTIzOWsxZFpvRDd3eUVJbFJkcURnZmVyTDV0Y2FOa1pj?=
 =?utf-8?B?bHp5U1VSMEc4bnhidW50Q1BGTG14WU5peHJpN1ExNzNMNldJQ2JTY0VZcDdh?=
 =?utf-8?B?SzlKeWh3WklXVVdUNmRHVHBGS2szQ1hWcHpDdDVWMnNXdWk3YUt6STJNZG8y?=
 =?utf-8?B?bmUrdlVrZUI3eUp4bC85TFBpajJOTHFKOHVhN3NBZDB4c1JQcHljNEhUeFJh?=
 =?utf-8?B?a1IrU2QzN1gwb2YrY0d4d2ovSDNOYUMrZFlDZjJWT21EREdNTzB2RmZ0Y01K?=
 =?utf-8?B?N1RSazB5TVpYTjFQWlNmWWhqWGFRSzB0YnNTMmdZbHMvZWNmMjF4dktOZU8z?=
 =?utf-8?B?ek1aRE5IaHBDYStOUmphemxMbElmN0JISHZZZ0lGNEVSNFFxdEYvR2x0c2FP?=
 =?utf-8?B?YTZ4Z0tVYkNqMlg0Q0k3TEZFdW93eW1XVmZPcFo2ay9CK3hoRnNscU5HOWov?=
 =?utf-8?B?T1J4V0hSaXdYUmtKTm4vOWpCMWJwKzlVRXJ3RjFiOG1IcDBUay9hZTZyM24x?=
 =?utf-8?B?NnZ4SC9hUzBqYnc1bVg5czJMaldxdCtYN2pqVzUveDNTd3VhbzdDbTErcG9B?=
 =?utf-8?B?dzdOQ0FtN0h1NjdUb0txTXQ0MkU2NkVjYnArc0pxV05JMmVTSTdVeUpWVnFs?=
 =?utf-8?B?dldaV0o1LzhQTENSZ3hUNE9iR2lMT0l4REM0QldrYjJuaDhFQjVhbndvVGtj?=
 =?utf-8?B?SUx4a2JkRmhaVldRejZ0SkZ2alFiM1dWeS9xbHRmK3ZQVXQ1TS8waUJ0a3Ay?=
 =?utf-8?B?R1BmNzkvVkRqY3Z1YU9MT05QTWFKVVdNMzVWUUVmV0k4K1R5cjN6cFp1WHgx?=
 =?utf-8?B?cVIrZ0hvNXJWWHBoanZKSFA3bERFRWovODlmdEdvUzB4VGd4WU5TdlRmUU44?=
 =?utf-8?B?L3FRNjZzdHAwVHVVdmNDMmZ1cUsvdTZwT0hyMFhPZFN5eFV6N01ZL200M3Jv?=
 =?utf-8?B?VUdKMVFYMjVrc1o2Z29ZOUhZRDErQTRmQjhXeUNFdXVhMmkwb3pKYTZWVHBI?=
 =?utf-8?B?TFF0b1h4alRPZEx0b2dSQU5UZWhES2tLbnQ1aEtXbFFoRGMzVUhHZFdHK1pz?=
 =?utf-8?B?R0hVY2RVS012b2VFVlNNRFlTL3pqN0FSM2tBYXc0U29EMnNaMy9LNmR5Mkhu?=
 =?utf-8?B?a1kvQ3RlNVBFVDN4WG4vaThkSGttTUxqckpnWEpJZGNmS1RrR25nU2xiWTlM?=
 =?utf-8?B?aTJGVlBXc2NGeGgrWW14ZlNvc3kvN3RVUy9FU0FlR09yNUo4aTI4SGJSc1BE?=
 =?utf-8?B?SncyUjlETS9sVFUzbEE1dmhJd1J5ZDFXZjlSWjdtcXhrU04zZGluWFRGZzJz?=
 =?utf-8?B?TDMzWk9pSS9BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4022.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TTF2WUdXS2hmYStHczNXSHFxdk1jLzZlTWhqRUQ0L0JSQVBMbmxQeFhlZ2Nz?=
 =?utf-8?B?K2haVGR1U1VyZUVyMTM5Y01xOGViOFd5RXBoSHBCdFFPSEFYV21PaVlRdWE1?=
 =?utf-8?B?RDJUd1pKbkxhOWtzWHVYbzNMYnZzVU9ETzJtbGh5S1R2TmprTFdtVmZLUXdK?=
 =?utf-8?B?M1paa0QzSzMzNXZLVnFScVBrQnljWFR3RTQ1cDJSOVRtdjNEc2hUNzk5Q2tB?=
 =?utf-8?B?TUlKdG83bWp5bDkwMlFTQ2c3M0VrK0hweGJ3U2tDcVVudWNEYmtKVG1LdVM5?=
 =?utf-8?B?TFJvV1JBQWYrMDVMOEVJWkFhWGdQVDBFYjVOVWtyRVZ3eEs5MVhORFBtakRD?=
 =?utf-8?B?TlY3ckhkZ0pycTJRVW1RV3dYcHJuVkZ1a0Q4SUxxbXFBcE9OOEg5N0hEdis0?=
 =?utf-8?B?SCtRNUlaZk8wMUNVTTJ2dC9TT3MyVk1Wa2lFWVBsc3ZRN0M4cWt6QVpKc0Mw?=
 =?utf-8?B?a0Rmc1BJS0Fyb1ZzQUU5blM3UlFBMzY3VGsvMTVHMElobDIvQXFjbmN1TERh?=
 =?utf-8?B?Q0xheGd0K09yMU1sYm50WHoxODZBTENxMVZkZEtBTlFTdU85NFQ3eHg1N0tt?=
 =?utf-8?B?UzFLZk9Nd0JPZkttNmdlVk85NWswTUlQSW1yYXY4eHZvWnoxTmZWY0lWRzl5?=
 =?utf-8?B?SzVUSWFiaVBRQmhhMCttWEJBRENUNzdPY0FaVEVWY2dSQmtTbk1CZ2dXVngy?=
 =?utf-8?B?VWtxZVVSM0hreDd6aWtEamxZQUFTZVNSSDJpeWEvclQ2REw1TXlkbUtWSjFh?=
 =?utf-8?B?OTZFaFV4VXB5SWNhRXFEd1BRWEhWbGZnV1hPL3RNN1NlMFVaQk5heTB6am10?=
 =?utf-8?B?Vkk4VE9FK2hwRjhYQ1ZSL3drUDRHM2phYnRTYS9SRlBkdDQ0UkFCWUswSkFT?=
 =?utf-8?B?VkNDMzMycEc4L2xna3RJcENHbGhROXpSc21kckYrUHhpTjNPaVY4NkJiSWNt?=
 =?utf-8?B?OFFsMUxDbjIrSGxQRmJ4SFVkUW5jUzdWRkNCdFNndm83N0YwdEloalBwbGtW?=
 =?utf-8?B?b1J4d1c1Q1hYUHpCWWNHQjA1bTNRZDJPOVZBamVoVzN2Z0ttN0NKQUVveHJl?=
 =?utf-8?B?SXpBbkk3dXpqbVhINFZtRmZsa3dQZjhrZ0Q3OEg0dnY1ODVvLzAwOFg4SEZB?=
 =?utf-8?B?M3NpRkNDdXRZckZnRDRNQitERUFWbDlxczRhTUZVdFdvSlluZ2hhYWlpTHlj?=
 =?utf-8?B?SFNtZDV4aytEbkZiTkdzSmdDY2h0YnduZnJodG9jL2N5ZDBFODFaclhSRTM2?=
 =?utf-8?B?dVBQa2ZIdHZ2NDQzY1JodzN3d1dhK28yMXdUVTgyVUZLN0FYdmlHNUQzYkx1?=
 =?utf-8?B?UjhCNUNuU0JkMmVJL0h3TnVRRWsvZEpYWEhWcVJEQ0VteGdDeEZnQ21NdFRS?=
 =?utf-8?B?VURHWk9PWXd2QldqRjYxakdVb3dhaTM4VXhCV25BUkVGYWZIemhrckNQR2FP?=
 =?utf-8?B?alJLWVBLYkluN1dkNmp4bnhOYWZKYVpZTTlBVDNEMW9tVk9nSE5kU0NSZTd2?=
 =?utf-8?B?aStUemY3UldHbXJ6c1pZMGJCak1YeUF1bUhxQXBIUUdLMXA5OTJvSHFZaE1Y?=
 =?utf-8?B?YVB1dUNsZ1RJYW1MWU1FdWxORXpuUTNxQThxNmtvVm5KWmV0QUxMM0xyaTJZ?=
 =?utf-8?B?Si9pZEJBR09lVGFSdmdqaVQ4djFxZ1dOWENRSytzQlNjWDhUTWNXY1lHQitI?=
 =?utf-8?B?SjllWjNibkJpMGNURnFuNkcwcU80TmZhaEtwSm9aSDJoYVRpaVExbnQreVMz?=
 =?utf-8?B?YVNjRE5IY1JBNTU3eWpHRzdUclBHUGhjeHQwUTlhVDJQUnVJRm5lNzFPNXoz?=
 =?utf-8?B?WkNoTDRROHVkWDhJNWhuTFdRS1FNYlRLbXErOUVXNEthdzAzZEFyd2JBd2JS?=
 =?utf-8?B?V0Uyd3B3UTU4dUVGWTFNcytIY2NkanVmMzlTa3ExL1RxZkF1WEFTSHB6Wm5r?=
 =?utf-8?B?SmVSYlFKUGYvSlBOTjhQbGkxTW9BRWxZckRqMllXQU1DYW54dVFOUnFFeXVi?=
 =?utf-8?B?U3RZdHlGQWNQdmJNd0wwS3dhRFpacjdsdHJEU0NWNGVwNXR2d2tNSS83eTRz?=
 =?utf-8?B?YmdmWkNEbzlGOFhMaHBOVVZ2RktjUXRXeTI3VHM0N2FlQnJ3VW0vQ1lLZ29s?=
 =?utf-8?Q?4oL8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4022.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f735a736-2e57-4f5a-df16-08ddef133992
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 20:06:40.5479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZN6x0Y6YWWFmeykkO2mwhRXlz6xveT34gz/YIWV5AU2kHTkO8NyVzvFGT/GbovNhpxTOULKQtUu0Rt2/lzwk1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7684

W1B1YmxpY10NCg0KSGkgSmFuICwgSmFzb24gLA0KDQpTdWdnZXN0aW9uIHNvdW5kcyBnb29kIHRv
IG1lIC4gSSBhbSBvayB3aXRoIHRoYXQgLg0KDQpUaGFua3MsDQpTb2hhbQ0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQu
Y29tPg0KU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgOCwgMjAyNSA3OjEwIFBNDQpUbzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgRGFuZGFwYXQsIFNvaGFtIDxTb2hhbS5EYW5kYXBh
dEBhbWQuY29tPg0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSF0geDg2L21jaGVjazogYWxsb3cg
dmFyeWluZyBiYW5rIGNvdW50cyBwZXIgQ1BVDQoNCk9uIDIwMjUtMDktMDggMDU6MDgsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wOS4yMDI1IDE5OjAyLCBKYXNvbiBBbmRyeXVrIHdyb3Rl
Og0KPj4NCj4+DQo+PiBPbiAyMDI1LTA5LTA1IDEyOjUyLCBTb2hhbSBEYW5kYXBhdCB3cm90ZToN
Cj4+PiBJbiBtY2FfY2FwX2luaXQgZnVuY3Rpb24sdGhlIG1jYWJhbmtzX2FsbG9jIGFsbG9jYXRl
cyBhbmQNCj4+PiBpbml0aWFsaXplcyBhbiBtY2FfYmFua3Mgc3RydWN0dXJlIGZvciBtYW5hZ2lu
ZyBNQ0EgYmFua3MsIHNldHRpbmcNCj4+PiB1cCBhIGJhbmsgbWFwIGFuZCBzdG9yaW5nIHRoZSBz
cGVjaWZpZWQgb3IgZGVmYXVsdCBudW1iZXIgb2YgYmFua3MuDQo+Pj4NCj4+PiBBZnRlciB0aGlz
IHdlIHdpbGwgY2FsbCBtY2FiYW5rc19zZXQoaSwgbWNhX2FsbGJhbmtzKTsgVGhlDQo+Pj4gbWNh
YmFua3Nfc2V0IGZ1bmN0aW9uIHNldHMgYSBzcGVjaWZpYyBiaXQgaW4gdGhlIGJhbmtfbWFwIG9m
IGFuDQo+Pj4gbWNhX2JhbmtzIHN0cnVjdHVyZSwgcHJvdmlkZWQgdGhlIHN0cnVjdHVyZSwgaXRz
IGJhbmtfbWFwLCBhbmQgdGhlDQo+Pj4gYml0IGluZGV4IGFyZSB2YWxpZC4NCj4+Pg0KPj4+IEF0
IHRoZSBlbmQsIHdlIHdpbGwgY2FsbA0KPj4+IG1jYWJhbmtzX2ZyZWUoeGNoZygmbWNhX2FsbGJh
bmtzLCBhbGwpKTsgVGhpcyBmdW5jdGlvbiBpcyB0aHJlYWQNCj4+PiBzYWZlIGFuZCBkb2VzIGJl
bG93Og0KPj4+ICAgICAgMS4gQXRvbWljYWxseSBleGNoYW5nZXMgdGhlIHZhbHVlIG9mICJtY2Ff
YWxsYmFua3MiIHdpdGggImFsbCINCj4+PiAgICAgIDIuIFJldHVybnMgdGhlIG9sZCB2YWx1ZSB0
aGF0IHdhcyBwcmV2aW91c2x5IGluICJtY2FfYWxsYmFua3MiDQo+Pj4gU28sIHdoZW4gd2Ugd2ls
bCBjYWxsIG1jYWJhbmtzX2ZyZWUgLCB0aGF0IHdpbGwgZnJlZSB0aGUgbWVtb3J5Lg0KPj4+DQo+
Pj4gVGhlIHByb2JsZW0gaXMgdGhhdCBtY2FiYW5rc19zZXQoaSwgbWNhX2FsbGJhbmtzKSBmdW5j
dGlvbiBpcw0KPj4+IHVwZGF0aW5nIG1jYV9hbGxiYW5rcyB3aGljaCB3aWxsIGJlIGZyZWVkIHZp
YSBtY2FiYW5rc19mcmVlIGxhdGVyLg0KPj4+IFRoaXMgbWVhbnMgbmV3IG1jYV9hbGxiYW5rcyBp
bnN0YW5jZSgiYWxsIikgd2lsbCBuZXZlciBnZXQgY2hhbmNlIHRvDQo+Pj4gdXBkYXRlIGl0J3Mg
YmFua19tYXAuDQo+Pj4NCj4+PiBEdWUgdG8gdGhpcyB3aGVuIHdlIHdpbGwgY29sbGVjdCBsb2cg
ZnJvbSBtY2hlY2tfbWNhX2xvZ291dCBmdW5jdGlvbg0KPj4+ICwgdGhlIGNvbmRpdGlvbiAiaWYg
KCAhbWNhYmFua3NfdGVzdChpLCBiYW5rbWFzaykgKSIgd2lsbCBhbHdheXMNCj4+PiBmYWlscyBh
bmQgTUNBIGxvZ3Mgd2lsbCBub3QgYmUgY29sbGVjdGVkIGZvciBhbnkgYmFuay4NCj4+Pg0KPj4+
IFRoZSBmaXggaXMgdG8gc29sdmUgdGhpcyBwcm9ibGVtLg0KPj4+DQo+Pj4gRml4ZXM6IDU2MGNm
NDE4Yzg0NSAoIng4Ni9tY2hlY2s6IGFsbG93IHZhcnlpbmcgYmFuayBjb3VudHMgcGVyDQo+Pj4g
Q1BVIikNCj4+PiBTaWduZWQtb2ZmLWJ5OiBTb2hhbSBEYW5kYXBhdCA8c29oYW0uZGFuZGFwYXRA
YW1kLmNvbT4NCj4+DQo+PiBSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1
a0BhbWQuY29tPg0KPj4NCj4+IE1heWJlIHRoZSBwYXRjaCBzdWJqZWN0IHNob3VsZCBiZSAieDg2
L21jaGVjazogRml4IG1jYSBiYW5rDQo+PiBpbml0aWFsaXphdGlvbiIgdG8gZGlmZmVyZW50aWF0
ZSBmcm9tIHRoZSBGaXhlcyBjb21taXQ/DQo+DQo+IFRoYXQncyBzdGlsbCBtb3JlIGdlbmVyaWMg
dGhhbiB3YW50ZWQuIEhvdyBhYm91dCAieDg2L21jaGVjazogZml4DQo+IG1jYV9hbGxiYW5rcyB1
cGRhdGluZyI/IFdpdGggYSBtb3JlIGNvbmNpc2UgdGl0bGUgKHdoaWNoIGNhbiBiZQ0KPiBhZGp1
c3RlZCB3aGlsZSBjb21taXR0aW5nLCBzbyBsb25nIGFzIHRoZXJlJ3MgYWdyZWVtZW50KToNCj4g
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KWW91ciBzdWdn
ZXN0aW9uIHNvdW5kcyBnb29kIHRvIG1lLg0KDQpUaGFua3MsDQpKYXNvbg0K

