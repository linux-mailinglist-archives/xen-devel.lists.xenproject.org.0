Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A393CA3D80
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 14:39:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177667.1501889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR9Wo-0007W5-SW; Thu, 04 Dec 2025 13:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177667.1501889; Thu, 04 Dec 2025 13:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR9Wo-0007Ue-Pm; Thu, 04 Dec 2025 13:37:50 +0000
Received: by outflank-mailman (input) for mailman id 1177667;
 Thu, 04 Dec 2025 13:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMpe=6K=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vR9Wn-0007UW-AG
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 13:37:49 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b076a7e-d116-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 14:37:46 +0100 (CET)
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by AS8PR03MB9142.eurprd03.prod.outlook.com
 (2603:10a6:20b:5b3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 13:37:43 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 13:37:43 +0000
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
X-Inumbo-ID: 6b076a7e-d116-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2L7HwsUJ60cSBKcm72bm3zB5ZrOKfZmfa4USEW1HMdVPXApmezgdINuXlK2qmSmh9MdeWYJL0ooBeUYRlKc/tBYWCiSLQlijz6ELpnN212TLW3tp6wGGWJk78a11/QusLfNmRXUBIu/Z8HYp7uVUZUhQzVBCcUIzH775/Wf4fbHXy/YAw/6lbk7ZBCL2o5s/JNyR43ID30H+GS4GwHh5O09GvJRiKamtpOXnFF3DX52Azxl9FcF+DUniOkLusDkhqrJima0NeOhFryRBkAdCkaWS9p//jARFzVDKoKnyhnNlM7irO3F/tUQA+2uTWFDpxmwb/UExG3NESBaN4TISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3Cpl2Njm+16AbmkUzbGKa8erpfHguylhpV/OHVyB98=;
 b=wNvaESbYGbNp30UyV3l/UiRjPwVtqIj1fMIqpuAi6fRn6WJCx+aJSyZRNbFQmexQEGlhV5baArUL9AeGzXnmILiYkodWCLuHWuiRuYy8RGjoJOGCwNo+n89iYQR3D2tvlD9DHOfM4qM8UIQ9SKQRTp+S3Cichdr6677Iho7RKQlleXyA5KO5oOAe5rXYleSlqpS3+IhFNhjnC5Rc2synl6+BzXtXCWeVjjEx4MIze2+2bjf8cvG6jJWYqNqBfAAWmnlMU3tG33aq3OCGgE5kvi+FRkjz1ebwIzxFKWAR5N19aPK2xI7m5rEq9CpDmhNpmjZvITZGyCC79PAI3RqSUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3Cpl2Njm+16AbmkUzbGKa8erpfHguylhpV/OHVyB98=;
 b=QEsv0YeH8V5n0Y3hSJCyrGJ7ndk9igxIuY3E/Oueo3xd3HNJQVt+S7dp0PwrnNEjrYfCvkyHvfWy4OHEpUF4FuerrDcenrjrf00MCLIPL0VfsppyBbkvXrvQo60z6czBE3B7y+YJKM+ynGNRn4XCtn+2wn9I9AZiokq7SR12TMHpwIL6Lt+mM9opTQySAlLxRWzVK23fXXLHEjr6BLYvVHmMFdAtXJ82NNqUSKMov/+2BpSBruuiBrMN6oxQR7z2MXRrORbj86qnxBkDNryIAShKUkjm4rEQJIAQC4Wjs209Q4HifVMLzulmxq/p2YJkhcSd/61+vdEMI2LbCwRxEg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Topic: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Index: AQHcZIbKZWHMCLfhnk2g+3dibmJCCbUQaX2AgAAU4YCAAKzmgIAAUfkA
Date: Thu, 4 Dec 2025 13:37:42 +0000
Message-ID: <fc04150e-7f5e-480f-a31b-0eeaee1247b6@epam.com>
References: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
 <6e83d3bc-c49c-49f4-9dbd-e994e53a62a7@xen.org>
 <44f6cb05-33c3-4937-b508-7616c36d0e4d@epam.com>
 <9FB64A3E-D05F-49B0-B979-25894D25BBD9@arm.com>
In-Reply-To: <9FB64A3E-D05F-49B0-B979-25894D25BBD9@arm.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|AS8PR03MB9142:EE_
x-ms-office365-filtering-correlation-id: 5dd71ddb-006d-4168-b491-08de333a4d35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|366016|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aUVwTGJYVG5HZmV3NmhJVUZHelpxYlhXSXZPZ1hyUTYwbnl3b0ZSN3lUWFdi?=
 =?utf-8?B?K3NMSmlHL3VwY2owUnJsK29Fai9HSnZwZXNBeHZndUsrM1ZxVWhQQWR1ejZl?=
 =?utf-8?B?dEMrMk5hSVJiaExrMitQbDI4d3dWaGVrckxYdHhUK1ZYK3NyQW1WQ0ZrTnoz?=
 =?utf-8?B?RHRKdE1nRTl2WEhMMXU3UXZXTUovS2hVMVlaeWVsc2ZQbWczSWg4cWNXKzAz?=
 =?utf-8?B?a21HY0FRZ3JvZjA1emM1bmF2KzZnVndKVDFub2ZSSy85c0ZuSHpWNmVvOHNm?=
 =?utf-8?B?dEdzWUNEZFp3L2QyclNLU2lpTy9jZEE2MlRHQ3J4OU1tZ3dHUjVXYW9reFpH?=
 =?utf-8?B?WThhN3hPa29kK296a21sWk1KZ2RlaXk4N1NHU29sWWJYZDhjdVRnZlNFVGJJ?=
 =?utf-8?B?TGVmVG1BRU5IY1VMWngyNnBEbW10TFVDZ2ZuWVVLbWx5ZWpuUXlxKzg5dlJn?=
 =?utf-8?B?VUpFT2VCS3VPRmhEbDRhRm00c1BlSURwU2hGZG41MDEwNUZFVkFHRE1VQTFD?=
 =?utf-8?B?U3Z6NFhZd2hBNDBrSDNNbGZJN1FDMkpQOTZpQWJVc3R2NWQxdDA2dWhKV21D?=
 =?utf-8?B?Mjg0MXNDWm9qTEVGS0o1Zm5CS3ZZYy9obmZOQUNMalFrOENhMk42bXIrdUlN?=
 =?utf-8?B?ZWI4MGlLZ2ZwaWtjRERDQXR2MnlKWmt0ZnFvR2dBWnU4R1NER0c3UmJTUjRx?=
 =?utf-8?B?S1c2TVFRZjR1S3NHZTdsVjRPMmVYd2pjZDVadnNYLzlMVmx0dFp4V0VNSzlI?=
 =?utf-8?B?ZytWRVF2THJtTmVNTWtHRkRpV0JaTzJ5TFJKSC9ydEJkTHVZNkc5WkROQ2Y5?=
 =?utf-8?B?V2VuWCtqSk5aZkRNdzJtdkpGam53R1Z4a0RCUGQvRFJJZFMwMWV3ZUtBYjJ1?=
 =?utf-8?B?eXNWZ0pKUDVadDhJOWs3aG9aUUtFSEFZblFaei9qcnhUSGZpRm4rb2h0eFY4?=
 =?utf-8?B?ak1vbVpRTE1GSG1nTEl4TmZKZGF6b21NL3JNZFovUHJvUlEzcmNVL2gxc3Nt?=
 =?utf-8?B?R2hERHlFaDh0QnE4aTUvbnNxNHVueE55cDdwMlYrSVNJditrYkpwVGVEdCsz?=
 =?utf-8?B?dHRWM2puQ2hud3pMdkQ4K3p0VVZsSkxVa2JuaE05YTkzempEQXdXdjQzMVdJ?=
 =?utf-8?B?WCtSVHZZeXMvellTMi9ZOVpCVmNScmdRa1J0R1d0MmxqYkhzMjJQcFZtdTZt?=
 =?utf-8?B?bFBUNEVSdjkrVEIzSlZOY1I2WlRXdW1PUStldUhBMHdPTW1wcXdXRCtZTUV0?=
 =?utf-8?B?NWJLV2M0Q1lreHIveGZyalV3SDQ3Z1I0cmZzWFlpQkE2RmMvYXVINXpTL2NI?=
 =?utf-8?B?VFhyZlEyUSttYUJ0UTB5SDZCNy93WDlUalE2NEFhb3dHUUdyTWU5TVpVRWZ2?=
 =?utf-8?B?SXNIbzZycm1vQWFJUnI1ajZwVUsxcG5FZjduR3BaK3IyNFNRSU5oWGlzcTVw?=
 =?utf-8?B?T1Z3K0dnVURWUS85RUkxckFud21jUlZlZWxtVGxBMjNOanNSa3ZxYjNLRGV3?=
 =?utf-8?B?Y0ZrT2lvTGY0UGVVS1lTZkpTdjN3WGlLdGtvY0toSkErKzdvZW9vSnVsQTFo?=
 =?utf-8?B?bTJJcGNjZDlrR0RtSkRiUWRxaW5lR3dHejlCSTZsV3MwTktVYVpUZkFybHV3?=
 =?utf-8?B?NGc4YWVFZXFMYlpQYXZqRUhuVGRYMzYvRE0xYkowdTJLS0xjT3VKcGhlbklo?=
 =?utf-8?B?SW1obHFzVTVPVUt3QlVtY0tYeTYycGtwbEkvTkJVSkZtdk9KK3ppdHptOHZC?=
 =?utf-8?B?RHExYUZIazQrYkFMbTBvU1h2UlNUY0I5a3lIcGE3YkFTYjM2Q3FkaFRSTDg1?=
 =?utf-8?B?bU1UL1FHMmZiSmgvaHlHVENuaEg0eS9oclZPcnBHSXhHL3Vxb1VWbSt3Q0p2?=
 =?utf-8?B?dzFmQmV5cjcveVlSRUJrU0VYcjZEY2JCRzNETkFLTFBrdEZFTjJxalJpb2Zw?=
 =?utf-8?B?dHdaK0trTE1OVnFhVWtWWnlHZ2djKzBmUGQrSkRtQXVsdTRaZDRJR1dQOFBh?=
 =?utf-8?B?OGhoNzVWNit1S28vU0JMU3Z6c0JZV3ZJMnN4S2huNEYveGN6Z2xjNk1YNVd5?=
 =?utf-8?Q?HpcSq9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUllWERJVll2dDh5UE55YUhSYm9TZS9tRkh3NWF5YVdHR1dUV1FNR0wwZUdo?=
 =?utf-8?B?NjdNVndXNEU3YzBIdmdqYUl2S1FnamRzNlR0Z09VK2ZGRytZeGxVNU5vUWZu?=
 =?utf-8?B?TVdYcEt4TlI2TjJWVE02MHc4NU5yanBnSG1SREQxMDlyLzVYcVdORi9LWExP?=
 =?utf-8?B?NW8vS0xzaGFYNlZIcnlEZ2RaWVVVNHhmYWIyaFBmTlh4N3gyMHBtMkFMZTE4?=
 =?utf-8?B?MklsWWFhYndXdjNPb2pyYmFhWlRSRGJLRWUzUHEzRVNSYW1SUGZMeU0vYnpF?=
 =?utf-8?B?VlF1SWpmUmxQMjh4Z0ZEZGFTWlZTZlk5SUNDZ2ZtRkVBRGtyQktaUmxjNkhC?=
 =?utf-8?B?ZmhWOWVzZjlSRlc4Nmp2akRmYlhaajl0U2JYWTRnbUpFSGNCNUs1dGNsN2Ew?=
 =?utf-8?B?YjV6TTU1b0FaaklhRHNtZUVRUytVTjVQWVZlZWVlbFM3RHNYREZjOFB1aUhk?=
 =?utf-8?B?YVErR1l5YTh0RGJxZFd5Y3B1VGUydkRKTnhxSm9MYk5ydFYrdWw0ZG9mWHkx?=
 =?utf-8?B?a2VPL0orbkRNL29EallMTUptZ0ZqSHB0SGZxbVJ4Nm1vVEZyU1QvbTdoSzAy?=
 =?utf-8?B?cGwxRytpa1JmUVpTTzBWcmdCOGpZbXF2SHg3YVJ1N1ZQR05VTUxmTHoxbGFI?=
 =?utf-8?B?OTVJNW5tYjNLa2RQNGxhRzNtSXB1NmVwRWRRVElLTWtzRks0SHBCLys0eEZV?=
 =?utf-8?B?QjhoYUIxNlY5Z2RzRERlVTNVQ05tTzh5UDl0dXQrZ1pZbVp2T2lSektGaGZY?=
 =?utf-8?B?K3UveVNFOUhSWWJHOS81ZjBhKzB3V05idXNCZkVubmkzL1p6VDAzV2RxWHd0?=
 =?utf-8?B?cVhqT2ZaRVZXaTBITGlLdFZMNU5WNkE2eXhkYlBKSlNNL1ZsanROSS9Pc0VZ?=
 =?utf-8?B?Y3F6a1MyZ2pKZ3N6eDl6TU53QkZ2SGNGR1ZJUHVnSExRTmpoa3dOSUV1eXcy?=
 =?utf-8?B?NThxaytIMFNZYXR2K010KzhRYWl2RkJQMmtsTjM4NWpjQ05pU1hGa0pVUnNy?=
 =?utf-8?B?K0NSNFdGSDdtb2V0Q1MwU3VvT1VoWEVKbWx4dzZxbWxPM1QxKzRSb3hGZkM3?=
 =?utf-8?B?bW5idlF2Sm83K2ttRS9HeWpQQysvMzlUR2VQOS9YODI1dHpIUEFjSHBGNGxn?=
 =?utf-8?B?SnVGREFnWE5uRlNxYTZtRkxCVmc1TmpLTit5dmdieFEya2dQbjNwY25xNEho?=
 =?utf-8?B?U0pYRHhKYy9pRUM4OUErYkhqbVFVRi9HdUtTUGNPMXIvdEt5SnFsVGY0RDQ5?=
 =?utf-8?B?NWNVaDNFbGptdmlKNVdrVjFwcVNVTTd1Q0xlMStmZnpiV2xKMkhDWXBLc2ow?=
 =?utf-8?B?b2diY1p4V2dHNDFyUk00enU3SlBHeUNSMmY0Z3NkZWVWNy82VmhUcTRCQTFa?=
 =?utf-8?B?Mk1kZUNMZlZwTWlLb2JHZGNPTDZUYm81bENyNnAxbTJqZDVLU3o4RzVMbWJB?=
 =?utf-8?B?elFaZG9MNHh3TXB3OXZQaVUrcnNDNXh3c3FWaE1RZnFZYU91V2cvUFN6U2tD?=
 =?utf-8?B?MEZReWNzSVRmUlY1SjF0Q2tvQ0NtQUxsRWJUNHJJQys4c1BXR3Aya2g1U0RO?=
 =?utf-8?B?clZ0SlBMUUx6YVcwWUlWUEo0YjhMQitlVGlSbTdrclBKZStUTW5GYXZkeTlW?=
 =?utf-8?B?Z0FZLy9HUmQ4eTJFMXc1MkFld1g5SjdncVR4eDgwVmNmdjkrRTVoY3V6MlVK?=
 =?utf-8?B?OWM1M2hoMHJ5dVFqRXJXK0pCOTZIb3hNei8zVVEwL1VyZjlobDFTU0hsNmpo?=
 =?utf-8?B?R2ZkdE9zMTcyamoveG9NNFBiMFpzMWFmTXFTV0RQSWh4VnNFeVpEY1VNNUhu?=
 =?utf-8?B?aUhEVUdvS3V3UHBQWFZqZ3d0b3c2YXhyKzFvRVBGaEZLL3FDRlJiUWZJWE9m?=
 =?utf-8?B?RWlOWXB6OThtbHk2QmpLTXcyeTNRako1T2VsVmE3R2lFbGhXOTBrWThLWjhz?=
 =?utf-8?B?ZGZFUDRXZHNNM05QTmdmRUlPNkRFUWFZRlBaSU92azRmYXYxYVNKcnlkblhs?=
 =?utf-8?B?YVdxUGtoRVBtSW9ZcjB1MmJ1UXZTcHBabWxYN2hsaTlXeGNQOGhnUDUxYUt5?=
 =?utf-8?B?Q3JPWnZGbFlrOG1OcVVVc2RZSDJ5b1dHZ3lLV25GKzF5S0EzaGJUOHdDZUJo?=
 =?utf-8?B?ZGFIZ0pHMEQvVEdnOVlzRURtNG1SeUdmQ2ZuZ3RlWkVUK3hpSzFZVUV5a1dG?=
 =?utf-8?Q?is7pbudLlB1iH5VNDny/oZY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81F0A43BD13FD54286BF298F3185778A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd71ddb-006d-4168-b491-08de333a4d35
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 13:37:42.9052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlCgGZPAuSQ7dwulTiz/BAazHTs5p2IsZ9KDvyy7FjOa7OES4tacNBr0y5zo+hlkLucB9o0pRwRKPLGILsGowecZ4m6feSL3YUKYplIdWGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9142

DQoNCk9uIDA0LjEyLjI1IDEwOjQ0LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPiBbWW91IGRvbid0
IG9mdGVuIGdldCBlbWFpbCBmcm9tIGx1Y2EuZmFuY2VsbHVAYXJtLmNvbS4gTGVhcm4gd2h5IHRo
aXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlm
aWNhdGlvbiBdDQo+IA0KPiBIaSBPbGVrc2FuZHIsDQoNCkhlbGxvIEx1Y2ENCg0KPiANCj4+DQo+
Pj4NCj4+Pj4gICAgICovDQo+Pj4+IC0jZGVmaW5lIERPTVVfRFRCX1NJWkUgNDA5Ng0KPj4+PiAr
I2RlZmluZSBET01VX0RUQl9TSVpFICgyMDQ4ICsgKE1BWF9WSVJUX0NQVVMgKiAxMjgpKQ0KPj4+
DQo+Pj4gT24gQXJtMzIsIE1BWF9WSVJUX0NQVVMgaXMgOC4gVGhpcyBtZWFucyB0aGUgbmV3IERP
TVVfRFRCX1NJWkUgaXMgZ29pbmcNCj4+PiB0byBiZSBzbWFsbGVyIHRoYW4gNDA5Ni4gV2h5IGlz
IGl0IG9rPw0KPj4NCj4+IFlvdSBhcmUgY29ycmVjdCB0byBxdWVzdGlvbiB0aGUgaW1wYWN0IG9u
IEFybTMyLCB3aGVyZSBNQVhfVklSVF9DUFVTIGlzDQo+PiBzbWFsbGVyLCBsZWFkaW5nIHRvIGEg
Y2FsY3VsYXRlZCBidWZmZXIgc2l6ZSBvZiAzMDcyIGJ5dGVzLCB3aGljaCBpcw0KPj4gbGVzcyB0
aGFuIHRoZSBvcmlnaW5hbCA0MDk2IGJ5dGVzLg0KPj4NCj4+IFVuZm9ydHVuYXRlbHksIEkgaGF2
ZSBubyBwb3NzaWJpbGl0eSB0byB0ZXN0IG9uIEFybTMyLiBCdXQsIEkgZG8gbm90IHNlZQ0KPj4g
bXVjaCBkaWZmZXJlbmNlIGJldHdlZW4gQXJtNjQgYW5kIEFybTMyIGluIHRoZSBjb250ZXh0IG9m
IERvbVUgZGV2aWNlDQo+PiB0cmVlIGdlbmVyYXRpb24gYnkgbG9va2luZyBpbnRvIHRoZSBjb2Rl
Lg0KPiANCj4gTGV0IG1lIGtub3cgd2hhdCBraW5kIG9mIHRlc3QgeW91IG5lZWQsIHdlIGhhdmUg
c29tZSBhcm0zMiBzZXR1cCBoZXJlIChub3QgSFcsIHZpcnR1YWwgcGxhdGZvcm1zKS4NCg0KDQpU
aGFuayB5b3UgdmVyeSBtdWNoIGZvciBvZmZlcmluZyB0byB0ZXN0IHRoaXMgb24gQXJtMzIgcGxh
dGZvcm1zLg0KDQpUaGUgcHJpbWFyeSBnb2FsIG9mIHRoZSB0ZXN0IGlzIHRvIGNvbmZpcm0gdGhh
dCB0aGUgbmV3LCBjYWxjdWxhdGVkIERUQiANCmJ1ZmZlciBzaXplIG9mIDMwNzIgYnl0ZXMgaXMg
c3VmZmljaWVudCBmb3IgYSB3b3JzdC1jYXNlIEFybTMyIGRvbTBsZXNzIA0KZ3Vlc3QuIFRoZSBl
eHBlY3RlZCByZXN1bHQgaXMgdGhhdCBYZW4gYm9vdHMgc3VjY2Vzc2Z1bGx5LCBhbmQgdGhlIA0K
cmVndWxhciBkb20wbGVzcyBndWVzdCBpcyBjcmVhdGVkIHdpdGhvdXQgYW55IHBhbmljcy4NCg0K
VGhlIGlkZWFsIHRlc3QgY29uZmlndXJhdGlvbiB3b3VsZCBiZSBhIGRvbTBsZXNzIGd1ZXN0IHdp
dGggdGhlIA0KZm9sbG93aW5nIGNvbmZpZ3VyYXRpb246DQotIFRoZSB2Q1BVIGNvdW50IHNldCB0
byB0aGUgbWF4aW11bSBmb3IgQXJtMzIsIHdoaWNoIGlzIDgsIHRoZSB2Q1BVIA0Kbm9kZXMgc2hv
dWxkIGlkZWFsbHkgY29udGFpbiAiY2xvY2stZnJlcXVlbmN5IiBwcm9wZXJ0eS4NCi0gQW55IG90
aGVyIGZlYXR1cmVzIHRoYXQgYWRkIG5vZGVzIHRvIHRoZSBndWVzdCBkZXZpY2UgdHJlZSBlbmFi
bGVkIA0KKGUuZy4sIGh5cGVydmlzb3IsIHJlc2VydmVkLW1lbW9yeSwgcGwwMTEgbm9kZXMgYXJl
IHByZXNlbnQsIGV0YyksIHRvIA0KY3JlYXRlIHRoZSBsYXJnZXN0IHBvc3NpYmxlICJiYXNlIiBG
RFQgc2l6ZS4NCg0KVGhlIHRlc3Qgd291bGQgaW52b2x2ZSBhcHBseWluZyB0aGUgY3VycmVudCBw
YXRjaCwgYW5kIHRoZSBkaWZmIGJlbG93Og0KDQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZp
Y2UtdHJlZS9kb20wbGVzcy1idWlsZC5jIA0KYi94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBs
ZXNzLWJ1aWxkLmMNCmluZGV4IDM4YTU4MzA4MTMuLmU5NWY0MmQxZTEgMTAwNjQ0DQotLS0gYS94
ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCisrKyBiL3hlbi9jb21tb24v
ZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYw0KQEAgLTU3Nyw2ICs1NzcsOSBAQCBzdGF0aWMg
aW50IF9faW5pdCBwcmVwYXJlX2R0Yl9kb21VKHN0cnVjdCBkb21haW4gKmQsIA0Kc3RydWN0IGtl
cm5lbF9pbmZvICpraW5mbykNCiAgICAgIGlmICggcmV0IDwgMCApDQogICAgICAgICAgZ290byBl
cnI7DQoNCisgICAgcHJpbnRrKCJGaW5hbCBjb21wYWN0ZWQgRkRUIHNpemUgaXM6ICVkIGJ5dGVz
XG4iLCANCmZkdF90b3RhbHNpemUoa2luZm8tPmZkdCkpOw0KKyAgICBwcmludGsoIlByZWRlZmlu
ZWQgRkRUIHNpemUgaXM6ICVkIGJ5dGVzXG4iLCBET01VX0RUQl9TSVpFKTsNCisNCiAgICAgIHJl
dHVybiAwOw0KDQogICAgZXJyOg0KDQoNClBsZWFzZSBsZXQgbWUga25vdyB3aGF0IHlvdSBnZXQu
IFRoYW5rcyBhZ2Fpbi4NCg0KDQo+IA0KPiBDaGVlcnMsDQo+IEx1Y2ENCj4gDQo=

