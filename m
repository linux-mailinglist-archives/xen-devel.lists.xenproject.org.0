Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21024C68BA0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 11:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164566.1491498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLIgP-0006ep-1u; Tue, 18 Nov 2025 10:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164566.1491498; Tue, 18 Nov 2025 10:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLIgO-0006cL-Ug; Tue, 18 Nov 2025 10:11:32 +0000
Received: by outflank-mailman (input) for mailman id 1164566;
 Tue, 18 Nov 2025 10:11:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+ix=52=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vLIgN-0006av-1A
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 10:11:31 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1d30c08-c466-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 11:11:28 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA0PR12MB8896.namprd12.prod.outlook.com (2603:10b6:208:493::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 10:11:24 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 10:11:24 +0000
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
X-Inumbo-ID: f1d30c08-c466-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBmtf4MWkkmcqmRWIelHnnD7mNNGYurofC6g60Eu9Sa+PAxZmCTmLFfXijMEGFyBiqNnsTl2NyyfxnxCmko/i5G31wgWl1Sf5kG0BEs8xwgZocjnC/gS8qKtJ+9xAJ2yW+OlRNsqzarsytF0VBNo9p5VQyS/7soZT0SQpVRYGeGkeqlT5IW5Jrxp8Cu+i3Sod+1OBvHJPh31RFQJ9LqJ+xBxzyci5dfDueIhUUYA1cq1h6OBxwM1haXU0qqjTbyRZOaIjxQum3uAtCR1bFPeDkzYMfFB9VSowX3WqUzypsAWuIwdET4MLMp+AeV0SuKqcaMetIudO5nGBh5KWSvlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXgZPuWfVNaFcLppfHsSUSWfXImbmJ+XVS1m2BZsvko=;
 b=meRiY5ay7QctgdvjQjrp3qZzTqGXuMpmEdfGRcQSI0aohIvmYn0u3qBm2Zz+v5fsOtDL9mvgpka+szohAPHl40CZT03FQho9zZtvPuxcYfJIDoQZZqBohBqMUeRcjIKN2JUerm4wUTaPY91Us+I9h3w8M5o+iquEtjpLtJpXJCsu9eGGpBuQUNaHIXKvOGwqgI5zmUWub+NwBBkovc/P3FpAtCsH01kOfRkon7AP7rxMGcA4bANi6rsw3l+pANtcFdvgCYyLZ/YT1mLm7X6fhXCdpzctPQ+Z9qNbAWenHcS1H4HB3/J4D1jFPWMCHXo+jO8WYCNH8p2rl7oOLgYIlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXgZPuWfVNaFcLppfHsSUSWfXImbmJ+XVS1m2BZsvko=;
 b=dyrMYdiHrKutiTtGBtbajH4C5MqddUEPDCXKhXfjRsSbKmCeJaHfvtT2tU3o6AskqrppTz0Y+LmT8XZTIa7caRELJydB6MCdcNr1k4QRIZqydqeUxwW1u9yrC3cSUoQY0k6NMUeXahy3qMednU51yC7Cl/datsHYZ3rlB2+4L+k=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, Tamas K Lengyel <tamas@tklengyel.com>, Alexandru
 Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 2/7] xen/vm_event: introduce vm_event_is_enabled()
Thread-Topic: [PATCH v1 2/7] xen/vm_event: introduce vm_event_is_enabled()
Thread-Index: AQHcVEv8xX7X3Fxy9k66rxMQCyTwArTwUwWAgAfo9XA=
Date: Tue, 18 Nov 2025 10:11:24 +0000
Message-ID:
 <DM4PR12MB845153694D28CC23FCF7C7C3E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-3-Penny.Zheng@amd.com>
 <8c74b068-ba9a-4867-8d39-31c77f3cc339@suse.com>
In-Reply-To: <8c74b068-ba9a-4867-8d39-31c77f3cc339@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-18T10:11:16.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA0PR12MB8896:EE_
x-ms-office365-filtering-correlation-id: bd79ccfc-fcd6-44a3-0a56-08de268ad468
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z0QzYXZlUUNTc2lmMTRDVG5ldUptZGJKSlRieFNvYzNLK1VQRFFYa3dsUHcw?=
 =?utf-8?B?NlFzTHlyc2NPY0pHRGxyaUxaRHB3aW1UVWZDSjE0aXpLanZFeVpoYjRuMERY?=
 =?utf-8?B?enhHRlMwaG04YkJJMzlvQ2h1NWphZjJrd0pvelNFSlVqNlNpMXlhYU14VW5U?=
 =?utf-8?B?YWE0QlBJVklMYTlyZU9KazhaclpsN1JTbmp4WElaRlFVbW5vRnR0d3Y5L3FC?=
 =?utf-8?B?WElHOHBRaStuZWV1VDFHM2FneGZSY2YzRitsUUVJWFVSN042YWQ3Y1dLTDhk?=
 =?utf-8?B?N25yREx2T2RJbTY0YkpZZ2JmdXJTbVhpRjdLYkdOcFdIenFVVGY4Q01ra05J?=
 =?utf-8?B?Z0tTdHZRWmRzMERteXNSUXNsMDN0dWVsWjhDYUdvWi9vZnNzVUJpMU9iSm1l?=
 =?utf-8?B?cEtNVkJNQmhFanU4TWtiQXd5bFJDemRvVmJ1aGFFRlVEaU45WjRSNUd5MEg5?=
 =?utf-8?B?ZU5EaVJuV2V1TXErcHdqQkhmWU5BYW5NZ3ZLVVN1ZjAvWExONXVhMXBMZkwr?=
 =?utf-8?B?RjhEeGlWeWpUdGdvV1dzdEdsbjNqZVdiNXdKQXplRzdYMEs4ZzJkVjNUSGha?=
 =?utf-8?B?UjE2dHdRaW5MNmhuL2FxejExZWlhbWpvcWNPM004ejhwZjZldXBTeG9mQ0ND?=
 =?utf-8?B?em1UVCtHNWViVEI3S0dBdkkzV2tZRkFRdC91ZUpGMzNlM2VKQjA1QmVuZklu?=
 =?utf-8?B?TTFwNS9lZnVsbzVyblRyaDNZZ29xQklnOWhKZTA4Q0J5SXdEa3ZlZStNUjJG?=
 =?utf-8?B?ekl2dHdYSXRWVVRLbVlHYW4vVjdENWNTVWZjQXlkcmFtRkNndlJBNXl0T3ZL?=
 =?utf-8?B?bDdsa0JhZDhTSVlIN2RIVy80aDllT2I5b1hDd3ZTbkdySFhzMm1idExIZEhP?=
 =?utf-8?B?T1VyQU12ZlUrZnd2eGF1QTZWa3hvL29CVnZjV1ZKcDAyTy9mQ3R6VENTalFa?=
 =?utf-8?B?QytrZ0dHY3hFYXdLTnZaY2tKYmthZ01mTjRyaUYrSVJkMkVHcFg1NUgyaHky?=
 =?utf-8?B?T3hNZTlQcmx0Uk5tcWZ6MGlzRFpEdklJeFZHWHJ0V0t4enlRQmppd2tOZmJ2?=
 =?utf-8?B?Zkk1NmRDTEpsUHBZcmJvR1hHMUtxMy9VUDNONVpETEpLcGo4amZhdVB3emRY?=
 =?utf-8?B?M05vVkhBbWtWNU9XVUFSbUZYemhIbG9hT1cxdDVSbVV0L0todmphOGUrNWZz?=
 =?utf-8?B?eFFDaEVoL2VLQkVxSXliTWdmaXM0T044NFh6TjNzUEJ6MG5aWG5meVlnYXlF?=
 =?utf-8?B?Vm1GSzlHZEw0cFcvZkhiYU5US2x2MDBOb0VMMmc1Sk5EU0VXWWllWk5xS0Jr?=
 =?utf-8?B?VVMxWTBwN2hOVmgzckNsV09ubjVvWjlXWm1MYzV2WDl0WjFMTFNsZHllUWkr?=
 =?utf-8?B?ZmtjeHFjNTRkWjJYTXNGK3BaWFFKcjVlN2gxelVFQUxrUHZMZldqNHBEbGJx?=
 =?utf-8?B?b09KdjB6RWc3R0VIbW8vcGZUbTR0Nm82TXdnU3BENGdiMzJDTGdJTVVFazE0?=
 =?utf-8?B?V3lwd2lMdDAvMU1NVE9DeHdzZHlTUmxjU3NjUEFuYVJQT0dvaDNhbk1Ham9h?=
 =?utf-8?B?RjNZbjRyYU9QUmRZblltOFpKTDNRSm1ISmFBTEcxeENLSUIrSXRSTnpBbW4z?=
 =?utf-8?B?VVlaRGx6b3J4ODZjbWl2ZnB6Zy9TOU9DVHd3RTZjajQ0ZTdDcGFRZXJGYXBL?=
 =?utf-8?B?VHNnYnNxcXJRMjdZZDJMMDRmNWpZUmtMMWF4K3d0ZkxjT2R0b2VzOFhaUzRn?=
 =?utf-8?B?VEFLOG83UVluWkRiNUFScnlQY1MxN2RrL2o5RkNidThXV3R6dzFVTUdtUDVs?=
 =?utf-8?B?TzBlQkpZUnJxYVBPWlJFdDFVQmZ1dWVSb2ZLRXhBSUJUSkZxRWpmYWgwN3Nr?=
 =?utf-8?B?ZnVDNHFIWmhmYUVIRXFZcC9oSTlBanlkRnBRZUtvbWc1RmxwcVZXUVVRd0J2?=
 =?utf-8?B?TVJyOUo5NXFSdEpjczdPb3R2NjZWNnJBSzJQK29VRm1Mb2luT3FJNXd3bisy?=
 =?utf-8?B?SVhjZjV5QjNYZHJMeUtZWk9pTFVwMWlQOUdQNjJOUzRNR2hWNlBySVRISzdI?=
 =?utf-8?Q?MQLu8W?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MjBocmFkbnlEOTBJbXVONHhBUmk2R2VIQ1BPZklDcm85U1U1Z0IvcUJQclZp?=
 =?utf-8?B?Yy9zZHRXUnRqdy9aUjRLMnZ1b25kVVNLQ0tOaU5LaTEzSmlZUUZHZUphbGFL?=
 =?utf-8?B?aENpZk5mMTBMQlU3bFlCekRvbFcyTHExWFJ0bjBUaHYzZHFPVUhQaS93Y3la?=
 =?utf-8?B?N2xvV2ZsbHBRWVlMd3lMTXN1UE9yemhDNXBtZWx2MW94d2ltVHV0QUFES1dh?=
 =?utf-8?B?Y2NPQkdiQWZQRkI0ZmVIMXFFMWFiL2MrM3NXYnhVRDYrV0xYazkxR095SFNr?=
 =?utf-8?B?eUhzUkdGSTU3RlkrQllRSnR3cTVTYTVTT0FhSzZWNmtFUFFrMDc3b1JVTVk1?=
 =?utf-8?B?NGIvbXBEMS9NVjdWTEY3dWxvYk8zUFhHeS9WS2NmL3VnUUdMK2Zwa0pzTjFB?=
 =?utf-8?B?YWIxOTh0YTFGNW5IbTdhTkFwSTErMDJtRCtJMlNQNmlMaldJOGhHR2ZTSDF6?=
 =?utf-8?B?ZGNqRm8wQTJuK1BEbVN4V3pOZkpIMkJyM3VVUC9HUjUvWVdQT20vV2I3NXhq?=
 =?utf-8?B?S2hHNnNGSzk3RVNTYWNxVFpLQmsrUjNOckg5YXVGTU5ibWE3ZWNrVysyUTJa?=
 =?utf-8?B?dFlJd2tqQlQ1VFVsMCtqOWEyU1Zqa1FtRGhsZGtzbE1ia2I2VXNKMC91THdX?=
 =?utf-8?B?TEhsUzF6TWFEMk1iU2RIVEFwd2xpUTVUN04yNFU1MHpuTTVqWjBVemdkY0lK?=
 =?utf-8?B?NCtxRUlFMStPUndMUjZrcmZFdDhaaHRJYkh0T082bTZDclNsVTBMalA3SEg1?=
 =?utf-8?B?RklMRjZsaVVKMVRoVlpsaWN3RG4vOEdieTNoN1QwZC9aVUJzek9qZG1CV2V2?=
 =?utf-8?B?clZTblRNa0h5eXZVQjNMSTZxNHl2K3ppaHc2QmFKem9rQkNtVkJiMG5XNlJX?=
 =?utf-8?B?TmNXQ09ibmlCV2JoR2EwWEppQVlxR21QaU1vSGJXS29Kd0UzZ3lVL1hFZkh6?=
 =?utf-8?B?Wm1KaHhvNmprYWdTbWpFa0Ewb2t2RndJM090cE1HWjdLa2FUODdMdnh4OStC?=
 =?utf-8?B?Tk1ocXVoaVRqSFZSYUVLd05UaTlmVDB0N2c2VXBZVW5SeEthVytlcHNUODdG?=
 =?utf-8?B?VUlrWHJVNkhVQmE1RGg1MEVrR0VxZFptMVNTTzdrVzR6eFcwOXA5bEdWZVND?=
 =?utf-8?B?ZzVwaXllcSt2a2haRG8zQ3U3bEhIWnhlTTViMXRzemxYcE04OHRpSk1CYm5m?=
 =?utf-8?B?b2hFYXhJM2dCK1BlRUJGYXdMU0c0dFZwTkV1OUZtRm9YUUo0UDJEZGx1ZXgv?=
 =?utf-8?B?SlZQZTZlZEJENkxFTkYyWkRnK2J2bmEyUElnbzlkcStxdzg4dWczZTMzUGlm?=
 =?utf-8?B?aTErbld2RTJmWHIrdGJoUHpBazJlRVBDSmlIRzgrNHJtZjJ5ejc1OTNJNGdi?=
 =?utf-8?B?WGZrRWh4dWtpOEpIT0hGVHRDNkFzSFZNM0lEWmFZeHYyalhONS96SWdydmsy?=
 =?utf-8?B?aitHa0FWQytFdE5ac3lraTdKeXNkM3ZHL1lNdFdSeG1BR1hTS1d2VStIaFBi?=
 =?utf-8?B?QnNIQTZQQmVPcGpLUnJVRjBUQlVXaXRRSG9PeGs5aFlvRG1jdWdQcndOU2hz?=
 =?utf-8?B?TGlBMW5TdXphS1kvUm94Q0padnphK01admw2clFpcWtBTmMzbWcxWVhqUTRh?=
 =?utf-8?B?YWgvd0c4Q2xRckV6VEZ1ZGNiZXRDb0pzVTNHQXhmbVc3VjNlYzhrb2dTVy90?=
 =?utf-8?B?d1RteXY3U2Y3SEJ4b2N1R3VHQ3R6T2p1cW54bVI5L3UvZnBjeStIUlJuN2NE?=
 =?utf-8?B?K1I0c1pYUEJCM0xuaEZOT0dLYVFEV0cxS3VBRXRTTHUvejZqZFBnbFRWZVo0?=
 =?utf-8?B?aUt6STNUcWJYVG9KZmwxWHEyWHc5bmdmYjVJVlZFdUtEdmh1eHZBSzc5ekdJ?=
 =?utf-8?B?VWRiTU9HakpORHNmN1RlakJKcGZvd21jMjFpWWdQOHNpNkY5K2gxRHhlanFh?=
 =?utf-8?B?MzYxNXM3bVh4ZE5DcDMrSFJnVElPaWRScEpkcHRvd29QT0FQcEhqUTdJbTQz?=
 =?utf-8?B?WTRuUERXU0tvM1V4ZjEzMEVzMlRjMUQ5aE9ScVlQU3hFaFFKeFdKU294T1pj?=
 =?utf-8?B?cXg2ajZKa3d4NE1hVXp3dGFFdXBkZnhlRXJENmh1T1M0czUzMFBPUGREY0Nh?=
 =?utf-8?Q?DpH0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd79ccfc-fcd6-44a3-0a56-08de268ad468
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 10:11:24.3932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hOKIJYRsRjuQi+OJGnlE1LxxklOLUqjqlTchEqibTUi0NocA1au0XoQEmXbgwjnHRstf3c6bpdKqRKguOxkE9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8896

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxMywg
MjAyNSA1OjE0IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+
IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1
IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBBbmRyeXVrLCBKYXNvbiA8SmFzb24u
QW5kcnl1a0BhbWQuY29tPjsgVGFtYXMgSw0KPiBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29t
PjsgQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Ow0KPiBQZXRyZSBQ
aXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPjsgR3J5Z29yaWkgU3RyYXNoa28N
Cj4gPGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMi83XSB4ZW4vdm1fZXZlbnQ6IGludHJv
ZHVjZSB2bV9ldmVudF9pc19lbmFibGVkKCkNCj4NCj4gT24gMTMuMTEuMjAyNSAwNDoxNiwgUGVu
bnkgWmhlbmcgd3JvdGU6DQo+ID4gRnVuY3Rpb24gdm1fZXZlbnRfaXNfZW5hYmxlZCgpIGlzIGlu
dHJvZHVjZWQgdG8gY2hlY2sgaWYgdm0gZXZlbnQgaXMNCj4gPiBlbmFibGVkLCBhbmQgYWxzbyBt
YWtlIHRoZSBjaGVja2luZyBjb25kaXRpb25hbCB1cG9uIENPTkZJR19WTV9FVkVOVCwNCj4gPiB3
aGljaCBjb3VsZCBoZWxwIERDRSBhIGxvdCB1bnJlYWNoYWJsZSBjYWxscy9jb2Rlcywgc3VjaCBh
cw0KPiA+IGh2bV9tb25pdG9yX2lvKCksIGV0Yywgd2hlbiBoYXZpbmcgVk1fRVZFTlQ9bi4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0BhbWQuY29tPg0K
PiA+IC0tLQ0KPiA+IHYyIC0+IHYzOg0KPiA+IC0gbW92ZSBhc3NpZ25tZW50ICh0byBldikgcGFz
dCB0aGUgY2hlY2suDQo+ID4gLSByZW1vdmUgcmVkdW5kYW50IGNoZWNrDQo+ID4gLSBtYWtlICJt
YXlfZGVmZXIiICYgd2l0aCB2bV9ldmVudF9pc19lbmFibGVkKCkgYW5kIGhhdmUgYXNzZXJ0aW9u
DQo+ID4gYmFjaw0KPiA+IC0gYWRkIHZtX2V2ZW50X2lzX2VuYWJsZWQoKSBmb3IgaHZtX21vbml0
b3JfeHh4KCkgaW4NCj4gPiBzdm0uYy92bXguYy9tZW1fc2hhcmluZy5jLCB0aGVuIGxhdGVyIHRo
ZXJlIGlzIG5vIG5lZWQgdG8gYWRkIHN0dWJzDQo+ID4gZm9yIHRoZW0NCj4gPiAtLS0NCj4gPiB2
MyAtPiB2NDoNCj4gPiAtIG1vdmUgIm1heV9kZWZlciIgJiB3aXRoIHZtX2V2ZW50X2lzX2VuYWJs
ZWQoKSB0byB0aGUgdmVyeSB0b3Agb2YgdGhlDQo+ID4gZnVuY3Rpb24NCj4gPiAtIHVzZSA/OiB0
byBhdm9pZCBpbnRyb2R1Y2luZyBhIG5ldyBsb2NhbCB2YXJpYWJsZQ0KPiA+IC0gZml4IHRoZSB3
cm9uZyBvcmRlcg0KPiA+IC0gdXNlIHBvaW50ZXItdG8tY29uc3Qgd2hlbiBwb3NzaWJsZQ0KPiA+
IC0gdXNlIElTX0VOQUJMRUQoeHh4KSBpbnN0ZWFkIG9mICNpZmRlZi1ibG9jaw0KPg0KPiBUaGlz
IGlzIGlycml0YXRpbmcsIGFzIHRoZSBzdWJqZWN0IChib2d1c2x5KSBzYXlzIHYxLg0KPg0KDQpJ
J20gbm90IHN1cmUgd2hldGhlciBJIG5lZWQgdG8gYnJpbmcgcHJldmlvdXMgZGlmZiBvciBub3Qu
DQoNCj4gPiAtLS0NCj4gPiArc3RhdGljIGlubGluZSBib29sIHZtX2V2ZW50X2lzX2VuYWJsZWQo
Y29uc3Qgc3RydWN0IHZjcHUgKnYpIHsNCj4gPiArICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdf
Vk1fRVZFTlQpICkNCj4gPiArICAgICAgICByZXR1cm4gdi0+YXJjaC52bV9ldmVudCAhPSBOVUxM
Ow0KPiA+ICsNCj4gPiArICAgIHJldHVybiBmYWxzZTsNCj4gPiArfQ0KPg0KPiBTaW1wbHkNCj4N
Cj4gICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19WTV9FVkVOVCkgJiYgdi0+YXJjaC52bV9l
dmVudCAhPSBOVUxMOw0KPg0KPiA/DQo+DQo+IEkgZ3Vlc3MgSSBtaWdodCBhcyB3ZWxsIGRvIHRo
ZSBhZGp1c3RtZW50cyB3aGlsZSBjb21taXR0aW5nLCBldmVuIGlmIGl0J3MgcXVpdGUgYSBmZXcN
Cj4gb2YgdGhlbS4gSW4gYW55IGV2ZW50LCB3aXRoIHRoZSBhZGp1c3RtZW50cw0KPiBBY2tlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpNYW50IHRoYW5rcw0KDQo+IEph
bg0K

