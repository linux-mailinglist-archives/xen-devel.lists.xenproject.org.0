Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B603971567
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794229.1203018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbk9-0004xD-4i; Mon, 09 Sep 2024 10:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794229.1203018; Mon, 09 Sep 2024 10:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbk9-0004u5-1P; Mon, 09 Sep 2024 10:35:37 +0000
Received: by outflank-mailman (input) for mailman id 794229;
 Mon, 09 Sep 2024 10:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lJeb=QH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1snbk8-0004tz-7b
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:35:36 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20604.outbound.protection.outlook.com
 [2a01:111:f403:2408::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e4ed56c-6e97-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 12:35:34 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Mon, 9 Sep
 2024 10:35:30 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 10:35:30 +0000
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
X-Inumbo-ID: 3e4ed56c-6e97-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cy/mEXFRowG6uy9kFJ0IIVgK8cmJva0kKvYbAYzi7TVHHVO+TDuwFxzDjJVh3TGz49Ipd+DgTYMoMOm37ASUU/L0XgU3/NWkrGnEuwOXy4mOEAaoGBu8+95M9YumUW9swDo6anrO9l8skIOp4J7eF6JNCjsjz9GDRYcIT/TScqBE198+fQwHr9h8Qv2/hvJ46PKO+35LqclkfiMMFBpPGscWIFaeZu0Ph1pCVerVh6od6UJ3myzSVZvJgBt/YLTa5Ryu2XPtRTXVQZibJsa77xmGh4NCrpXjrk5JqRPzoQQTircnEsWdlWCXPVPsBdaT4QKvO11oH20j5eRdC4b0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fc1Bz4R7o7IFzBLdHbx0GuMbJgYngT0pD9KCT/+YH2I=;
 b=ZcnG4McQYPzfqYYdt6jK6d0uYkPcHlvodBRz1Orby8563Jt2IGwc47QNtqxQMQVtCvWfhPns2Q/iNqylTu72cbnbu8n+9Eel2edZeana+A2wzP6jR5MRV55U2Yz7oZIhvi6gXNmnAENZMyNzaGTOYlYHk2WPzJXk10XSYNETTxwYOEW8Yq0p2+YEOX+y7CjBcA3sC7mwdMhNXtvaw8FfKBAOZX4WKlziVfJroJj5rTaOjR8jxV7oJAEUBw0MtuEMZ2fQIzxOL3qMV9RwQqESWf3P13SPQeZq4/4MNMn8k88ZB8A1OjW3U56EbE+hYAHQJVFHrn2am9ln0Sa1A4r98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fc1Bz4R7o7IFzBLdHbx0GuMbJgYngT0pD9KCT/+YH2I=;
 b=ioptlDe5yygxJoKxZ+rbBpW78x3F8Odg/+Tg/KOClasQLJMC6sARQO76n9tnUvgCOyWtErsogEE8Od0Us38tyjvvpt2cMvU43a7IA4xOftHTyeAo13+g7wDapyZoe15mtCUKYGAxfLzdQuPKSCOpvh7S0axac9hKkO1mfANbYWU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index:
 AQHa/c+T1Q4Qq6O9skmV9EceghcgI7JFrg2AgACIPoD//5R3AIAAnXgA//+zNYCAAMCRAIAASOkAgAIZ9gD//7YJAAAbegIAAA/jkYAAI+iHgAB4L+uAAAJf+IAAEa+RgA==
Date: Mon, 9 Sep 2024 10:35:30 +0000
Message-ID:
 <BL1PR12MB584936A664E044A278B0CB99E7992@BL1PR12MB5849.namprd12.prod.outlook.com>
References:
 <BL1PR12MB58492EE11D404B2E09DA0210E7932@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b2b7b716-974c-4172-ba68-261453a96932@suse.com>
 <alpine.DEB.2.22.394.2409031839550.53815@ubuntu-linux-20-04-desktop>
 <ea41eb5d-f8a1-4120-b5c1-70bdf02d8038@suse.com>
 <BL1PR12MB5849E69A83D4BABAF544C22EE79D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f6a1f021-04cc-4dd3-bcea-97a7343399e1@suse.com>
 <alpine.DEB.2.22.394.2409051521340.53815@ubuntu-linux-20-04-desktop>
 <fb08f1bc-291d-4c97-b20e-7e4ba9f556c9@suse.com>
 <alpine.DEB.2.22.394.2409061500390.53815@ubuntu-linux-20-04-desktop>
 <3ef3295a-705f-4070-a223-774716e1f3a3@suse.com>
 <Zt7IF3orBueNK-NM@macbook.local>
In-Reply-To: <Zt7IF3orBueNK-NM@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7918.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB8501:EE_
x-ms-office365-filtering-correlation-id: 7280ea1f-b5b3-4484-2c0e-08dcd0bb20ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ekZBamNsTGVCbm12YzQ0bTNnUEVSakMrNGJMYzJPaVlWWFBFYW01cEg1NUxE?=
 =?utf-8?B?R1ZOT3RSSEpaUkZTVWhJanV2MzZzVDJRS2txSFZMcHF2eEozaHlxYThmbENl?=
 =?utf-8?B?dDZabnpxQjJmMGwwaTVEMEk2eDZnc1hEaWMzUzROczc2Q0Vvb2JIZE1FeTlN?=
 =?utf-8?B?TmpzNDFTeUswcE9kVEVJVDhncWY4bm9jYy9GckpEaFJHZGNWM2Jnb3lSV0Iz?=
 =?utf-8?B?d1hkRUMrN1JzTHZmcndrRThOV1JBY09FZWdQSmxWWWZSNFhJODhOSHJjbTdT?=
 =?utf-8?B?SFJFaFZuNk1STVByazNKNTZGLzhlakdVM1lPUHZod09CdkRES3cxZzFaTUl0?=
 =?utf-8?B?My9VbTAzRjdMQjgxRzFxa0crNDJ0YjJyckhnWDEvazhBbXBrODQ0Mkt3blBr?=
 =?utf-8?B?Sjd2YmdRNHBOMXJVVVQxMDc5MzJ6VE92THRScDhPb1M3Uk9zV3NITXN6TGdl?=
 =?utf-8?B?M3RCckU1YjB1MSs1aXk1ZjVnZVgzR2h1eWE1ekFWMEM1UVBxMmZ0c0x1T2k2?=
 =?utf-8?B?di84eUhwZkZrTS9EV2FEQUdWRVlMU3EwYjMxdit4VmpNdGJMU1l5WW80OUdy?=
 =?utf-8?B?c0kzTkh3YnkrVE4yZEJxcEhaLytkSkVDQ0d0cWkxaFJSTTlYNXBjNnNlNnVD?=
 =?utf-8?B?WjhGWFJ0dDFHVzZUMlROQkVoSjlnakV5NWIwSStxVWVyazlPT2xJZHVhak5n?=
 =?utf-8?B?TzRPVDdyVUlFWkNLeW9lcFFEdW1ldWdqTk5JakpEczhIWHFDYjNEV2lqbmMv?=
 =?utf-8?B?aEFzYVVDS3ZxOS9Sd3VGMDJYa2lsYVFYT3BNNU1CUllMWUV0VDR5MzFMa0lr?=
 =?utf-8?B?RUhVK1hReGY1OWZTSkQyL0tlV0tqR0hGNlZWbU1KVXFmTC9yQkRYUDhNeHlZ?=
 =?utf-8?B?aFIyK3d4U3FBOW1xT3RGWjgxQnNqOFl0NFVhTE1JNmtTaXgyRjYwbXRFYTBN?=
 =?utf-8?B?YmNFQ0k0Z1g3NzJ6VTgwWFZqMlBFT1BlK0ttbTBwYTdOaGMxOGlOWWhhQk9I?=
 =?utf-8?B?bFpxclBOdXZ0ZTdmQndKLyt1Nk5KdGdLc2dKRGNZR3E4SEl1TE50aEhJcFN4?=
 =?utf-8?B?eFM1MU45MkUwaTI2QURzYStLWkVqZTRyOXlVYWkzbitZMkZ1QXJMYzRBQUdQ?=
 =?utf-8?B?RFpUMEJFbzI5dEtMUml0Z3dPc0k1azdqUzNDVmlJd0VoSDByVzV1Z280NG5q?=
 =?utf-8?B?Zzg2Z0dJbTgxQlJiSFBGbVF3a1hTdDhZVmtxcnc5QXBOZHVralFlelNyREVE?=
 =?utf-8?B?bllQMXRRODR4Z2JJbU5NMTJwQUtyQzVUSThwbmtvdWd4U2JiWXZuU1B4aC9p?=
 =?utf-8?B?bFZrOEw0aFYrWmJXT0VDUENiUytNdVdmOUl5K3R2QlcxekNYV3I1YlRkWDVN?=
 =?utf-8?B?VTBxN1BMcWtWbDhIb1lKZDQyR2J5YlFod25rWEFUYXViVk9ld1VvUnh0RWg5?=
 =?utf-8?B?VkFGUGZVRzJXVlhmL21rZytzVjZqSTJBUllEVjFZb2hUdFdiYW1hOU1xNWpw?=
 =?utf-8?B?T1BXMm45azllVzFBbkFuRWZPYlFBQndCOHVMTmFCMHZOQ1dScXptNzY5T1A2?=
 =?utf-8?B?aGdGZnVXRWtta3ZvRWZiaDk2aWpKY3BRaXZmV1dUZkw3Wkc3NFgvanF1Z2Zp?=
 =?utf-8?B?V2xlSmFDU0dneVU5djFLRTJFTkJRMU1DVVd6d3I1ZVh1QUZWd1JBM3NRc25u?=
 =?utf-8?B?cERHWmNYZkdnTFI4UmZEenhvMVBvcEZyRzl3VXdrUGRCY1U3bnAyVGNoeDhS?=
 =?utf-8?B?S2hGd3pMYXBQNDhNMzRobjZNM0k5MDJJSmFUeWd0ajJtN3o4WU9kSy9mL2th?=
 =?utf-8?B?cE54Skl5UTRRSVluWElmSUlrRmZ3NkVUZTV3M0hJdTY2K1hIc00zelowL20z?=
 =?utf-8?B?Ni9BejBGYmMzTk9QMFY1L21UZ0hhN0Rhdm5kZHFnT3BwaEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0pYSHNrTWFkM0hGUmZSVndIVDJ0Qy9ZV0t3Nm5yd1lyLzQ5cFBaQWVxR2Ry?=
 =?utf-8?B?NHoxU05kRnJUYnlJOVZvTnFjcGphbDRXWFhzN25rRlJoYkRIRUFyR2lmcEJO?=
 =?utf-8?B?TkxOQytzTUJmUk1abHk5TTVrOHhiNkQwMHZDTm5YVlRPbkhxNmhha2ZrdHVP?=
 =?utf-8?B?S2pESXJyZWthQkJzS0s0QytHT0V1TVpzUnhPdWtnMWVMajBLRUFiK0tIL282?=
 =?utf-8?B?a01WZHI1N3FJY2RpaUVjUkh4Z09sTDJnOGZPaVE0M05WZU40dG0vNTFmK0wz?=
 =?utf-8?B?SGxrR2pUZDBuMUNoM0ZmQ3ZUNS9UOFdwV3pDSFp2Sk9GYXJlT1dWUlNyU0k1?=
 =?utf-8?B?UG5kdklkZTkwV3kxSGlQdm1jOFkvR3pndnBRUk1TekpqVEpRWEk4Qkg2OSt1?=
 =?utf-8?B?cndKazFjZzV4QnFMc2VBWmIwSGFZWHpMTzMzVEVPWEtWb0tkb0FsaXFYdGFY?=
 =?utf-8?B?WEJzc21vYWYyRkhjZ2JWVWNhNHZVVHZaQi9FeTVLd0JYN3MxYXlqdEpIU3FX?=
 =?utf-8?B?c05JMzRvK2RVZGlINkNQUmNIL3RtU3A2ajRUVHo4RjRXSFMxaXJzcVZ1STlD?=
 =?utf-8?B?OWdUV1RuYVNuQm1RMWxHZHZJNGdDMkNtUnpsTkhKTGJjVmFqTzQ1ZzZCRXg4?=
 =?utf-8?B?eFhuWGRxUXovT0xtcmVPMGlvYjk1OTVKdUVwYk1jVUZvam5aK1g4VldIS09B?=
 =?utf-8?B?aTNad3ExcmtBSU1PcEJxQWhudkFOalFPNkttVGMrekNHSFNST1BqUTdaUUVX?=
 =?utf-8?B?a1ZyYnNJRGxtTXIxeFhOOXJ0N2V4YkprenVMYnFGby9qVi9BejM1aHFQTFhO?=
 =?utf-8?B?Q1pKT25rSE03V0lDdUxWTzloTHFLaW12SXBrU3J5eTQzZWpYc1JnRlhUSk83?=
 =?utf-8?B?VmE3ZlorRm01UEFJWHNZUHZpYVByQTZva3FEaVAraU1nWVlGZjBIRXo5N21D?=
 =?utf-8?B?ZVYySFhGUno4bmFybGo0ZXVCU1hjTDVjRDlxSkxoWDlYWjFXZC9FTWlNYVRy?=
 =?utf-8?B?eEpGYXJvZ0g4N3BFQytFbTlnRlpGYXV2NDNqZ2EyaVJjU0o3UnQ2cFlDb3N6?=
 =?utf-8?B?bnZzWkRTYW1BMDZwblY0eThiTzN0TnAydWJvdUtpS2hBWWZybW1mY0ZYa2pl?=
 =?utf-8?B?WktmeXJ3ajFMMWcvZC9hMGRlTzZRVitVM1YrOXB0d2UwQm5Wdko5M0V2VmlI?=
 =?utf-8?B?WTQ4ekpkMlUvdWdwSXUvNXdyeDhIUHVCSHZSNktBY294S0FoTHdwb0pOTVFO?=
 =?utf-8?B?d3M2dVJBRmJseENFOFhCRXQ0eDBPMGRVTy9TVHVrSmF4K3MrVHRNRGNFQzBI?=
 =?utf-8?B?amkvbFBEVHR3Lzdyaml1ekIvU0ZsbTBDN1ZIK2xQaCtWV0xlMkgrL2l0WFJo?=
 =?utf-8?B?aGt4cURLS3k0djREUitWSU95Y1gvMlpaaFd1Y3dwdkZjaGRibld1RGJVV3VE?=
 =?utf-8?B?dUpuRUZONEk3UWlnbGxkdmVxa2JiMW5KYkF5RCt3ZXJYT1lSQTBYOXhVQ3Fr?=
 =?utf-8?B?R2tITUhreG9NdTQ4SjRUZjJlY0k2azFCLy9GNTRUM09BZjhwZHN3cGxaV2dM?=
 =?utf-8?B?dGMxcnZBa0VwaVFOVWczWWNKc0lJL2xrc0VwYmdQR0Rqd3ptVDd4ajRyaEh0?=
 =?utf-8?B?cjZyT3ZLSXE3T1pWZVk5T3Fxc2RWNjcyRUxQZi9IN2hsVlRQR21oWFJleUk1?=
 =?utf-8?B?TVp1Z0I4K2hibjZiWUJqeEZhcW4rd3NiSVRIRjNISmkzanBXNmFLZDh6MzZI?=
 =?utf-8?B?NmkwZ0RYRkF4aUJ6cFpDa0dRTHBVK1oxSHloNWNJaWpRV3dab0dIbTY2TU9G?=
 =?utf-8?B?MytVR0FPSHFEY3JXUG0yMnVZTkcvVXFJMys0a2ZwRXJ3TlZlei9NVWFhcnlI?=
 =?utf-8?B?dEZzVklsejBiU2VxZkVhZ3AwVkprdnoySjZLTlFpZUlhMTErV2E0bXdPK3ZQ?=
 =?utf-8?B?ellmaXh2VC9kRE1PR1U1RE8xTElUNys5WXNNS3B0T1NTVE1Nd0ZOWHdKWnl5?=
 =?utf-8?B?UC83OWhqTm91TVgwaXpKOFZtZGp4R1htaU12RTdKUnEwQTdtZExmQllnbVo0?=
 =?utf-8?B?MldtdHlpSmFYT2Zhb2l5NUFNbGNkNE56ZTFZaGhsMUlFV3Q5SlR1NjBzQkg4?=
 =?utf-8?Q?hddQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC90824D4536BD4FA780B5E04C5EFA97@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7280ea1f-b5b3-4484-2c0e-08dcd0bb20ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 10:35:30.7570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3QJWyeYZnj8/lBNf9mjcGckdrtmmn3iQxjPbxNuJHba0nWZcrW4p/VOUIYXn8bHgqZLhXZdwoItLepubgLaiYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501

T24gMjAyNC85LzkgMTg6MDQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgU2Vw
IDA5LCAyMDI0IGF0IDEwOjU2OjA3QU0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24g
MDcuMDkuMjAyNCAwMTozNCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IE9uIEZyaSwg
NiBTZXAgMjAyNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDA2LjA5LjIwMjQgMDA6NTEs
IFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+Pj4+IE9uIFRodSwgNSBTZXAgMjAyNCwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMDUuMDkuMjAyNCAwODo0NSwgQ2hlbiwgSmlxaWFu
IHdyb3RlOg0KPj4+Pj4+PiBISSwNCj4+Pj4+Pj4NCj4+Pj4+Pj4gT24gMjAyNC85LzQgMTQ6MDQs
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMDQuMDkuMjAyNCAwMzo0MywgU3RlZmFu
byBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4+Pj4+IE9uIFR1ZSwgMyBTZXAgMjAyNCwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4+Pj4+Pj4+IE9uIDAzLjA5LjIwMjQgMTI6NTMsIENoZW4sIEppcWlh
biB3cm90ZToNCj4+Pj4+Pj4+Pj4+IE9uIDIwMjQvOS8zIDE3OjI1LCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+Pj4+Pj4+Pj4+PiBPbiAwMy4wOS4yMDI0IDA5OjU4LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+Pj4+Pj4+Pj4+IE9uIDIwMjQvOS8zIDE1OjQyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
Pj4+Pj4+Pj4+Pj4+IE9uIDAzLjA5LjIwMjQgMDk6MDQsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+
Pj4+Pj4+Pj4+Pj4+IFdoZW4gZG9tMCBpcyBQVkggdHlwZSBhbmQgcGFzc3Rocm91Z2ggYSBkZXZp
Y2UgdG8gSFZNIGRvbVUsIFFlbXUgY29kZQ0KPj4+Pj4+Pj4+Pj4+Pj4+IHhlbl9wdF9yZWFsaXpl
LT54Y19waHlzZGV2X21hcF9waXJxIGFuZCBsaWJ4bCBjb2RlIHBjaV9hZGRfZG1fZG9uZS0+DQo+
Pj4+Pj4+Pj4+Pj4+Pj4geGNfcGh5c2Rldl9tYXBfcGlycSBtYXAgYSBwaXJxIGZvciBwYXNzdGhy
b3VnaCBkZXZpY2VzLg0KPj4+Pj4+Pj4+Pj4+Pj4+IEluIHhjX3BoeXNkZXZfbWFwX3BpcnEgY2Fs
bCBzdGFjaywgZnVuY3Rpb24gaHZtX3BoeXNkZXZfb3AgaGFzIGEgY2hlY2sNCj4+Pj4+Pj4+Pj4+
Pj4+PiBoYXNfcGlycShjdXJyZCksIGJ1dCBjdXJyZCBpcyBQVkggZG9tMCwgUFZIIGhhcyBubyBY
ODZfRU1VX1VTRV9QSVJRIGZsYWcsDQo+Pj4+Pj4+Pj4+Pj4+Pj4gc28gaXQgZmFpbHMsIFBIWVNE
RVZPUF9tYXBfcGlycSBpcyBub3QgYWxsb3dlZCBmb3IgUFZIIGRvbTAgaW4gY3VycmVudA0KPj4+
Pj4+Pj4+Pj4+Pj4+IGNvZGVzLg0KPj4+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+Pj4gQnV0
IGl0IGlzIGZpbmUgdG8gbWFwIGludGVycnVwdHMgdGhyb3VnaCBwaXJxIHRvIGEgSFZNIGRvbWFp
biB3aG9zZQ0KPj4+Pj4+Pj4+Pj4+Pj4+IFhFTkZFQVRfaHZtX3BpcnFzIGlzIG5vdCBlbmFibGVk
LiBCZWNhdXNlIHBpcnEgZmllbGQgaXMgdXNlZCBhcyBhIHdheSB0bw0KPj4+Pj4+Pj4+Pj4+Pj4+
IHJlZmVyZW5jZSBpbnRlcnJ1cHRzIGFuZCBpdCBpcyBqdXN0IHRoZSB3YXkgZm9yIHRoZSBkZXZp
Y2UgbW9kZWwgdG8NCj4+Pj4+Pj4+Pj4+Pj4+PiBpZGVudGlmeSB3aGljaCBpbnRlcnJ1cHQgc2hv
dWxkIGJlIG1hcHBlZCB0byB3aGljaCBkb21haW4sIGhvd2V2ZXINCj4+Pj4+Pj4+Pj4+Pj4+PiBo
YXNfcGlycSgpIGlzIGp1c3QgdG8gY2hlY2sgaWYgSFZNIGRvbWFpbnMgcm91dGUgaW50ZXJydXB0
cyBmcm9tDQo+Pj4+Pj4+Pj4+Pj4+Pj4gZGV2aWNlcyhlbXVsYXRlZCBvciBwYXNzdGhyb3VnaCkg
dGhyb3VnaCBldmVudCBjaGFubmVsLCBzbywgdGhlIGhhc19waXJxKCkNCj4+Pj4+Pj4+Pj4+Pj4+
PiBjaGVjayBzaG91bGQgbm90IGJlIGFwcGxpZWQgdG8gdGhlIFBIWVNERVZPUF9tYXBfcGlycSBp
c3N1ZWQgYnkgZG9tMC4NCj4+Pj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+Pj4+IFNvLCBhbGxv
dyBQSFlTREVWT1BfbWFwX3BpcnEgd2hlbiBkb20wIGlzIFBWSCBhbmQgYWxzbyBhbGxvdw0KPj4+
Pj4+Pj4+Pj4+Pj4+IFBIWVNERVZPUF91bm1hcF9waXJxIGZvciB0aGUgcmVtb3ZhbCBkZXZpY2Ug
cGF0aCB0byB1bm1hcCBwaXJxLiBUaGVuIHRoZQ0KPj4+Pj4+Pj4+Pj4+Pj4+IGludGVycnVwdCBv
ZiBhIHBhc3N0aHJvdWdoIGRldmljZSBjYW4gYmUgc3VjY2Vzc2Z1bGx5IG1hcHBlZCB0byBwaXJx
IGZvciBkb21VLg0KPj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4+IEFzIGJlZm9yZTogV2hl
biB5b3UgdGFsayBhYm91dCBqdXN0IERvbTAsIC4uLg0KPj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+
Pj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+Pj4+Pj4+Pj4+Pj4+
Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4+Pj4+Pj4+Pj4+Pj4+IEBA
IC03Myw2ICs3Myw4IEBAIGxvbmcgaHZtX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hB
TkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICB7DQo+Pj4+Pj4+Pj4+
Pj4+Pj4gICAgICBjYXNlIFBIWVNERVZPUF9tYXBfcGlycToNCj4+Pj4+Pj4+Pj4+Pj4+PiAgICAg
IGNhc2UgUEhZU0RFVk9QX3VubWFwX3BpcnE6DQo+Pj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgYnJl
YWs7DQo+Pj4+Pj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgY2FzZSBQSFlTREVW
T1BfZW9pOg0KPj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgY2FzZSBQSFlTREVWT1BfaXJxX3N0YXR1c19x
dWVyeToNCj4+Pj4+Pj4+Pj4+Pj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX2dldF9mcmVlX3BpcnE6
DQo+Pj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+Pj4gLi4uIHRoYXQgb3VnaHQgdG8gbWF0Y2gg
dGhlIGNvZGUuIElPVyB5b3UndmUgYWdhaW4gbG9zdCB3aHkgaXQgaXMgb2theShpc2gpDQo+Pj4+
Pj4+Pj4+Pj4+PiAob3IgZXZlbiBuZWNlc3NhcnkpIHRvIGFsc28gcGVybWl0IHRoZSBvcCBmb3Ig
bm9uLURvbTAgKGUuZy4gYSBQVkggc3R1YmRvbSkuDQo+Pj4+Pj4+Pj4+Pj4+PiBTaW1pbGFybHkg
aW1vIERvbTAgdXNpbmcgdGhpcyBvbiBpdHNlbGYgd2FudHMgZGlzY3Vzc2luZy4NCj4+Pj4+Pj4+
Pj4+Pj4gRG8geW91IG1lYW4gSSBuZWVkIHRvIHRhbGsgYWJvdXQgd2h5IHBlcm1pdCB0aGlzIG9w
IGZvciBhbGwgSFZNDQo+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+PiBZb3UgZG9uJ3QgbmVlZCB0
byBpbnZlbnQgcmVhc29ucywgYnV0IGl0IG5lZWRzIG1ha2luZyBjbGVhciB0aGF0IHdpZGVyIHRo
YW4NCj4+Pj4+Pj4+Pj4+PiBuZWNlc3NhcnkgKGZvciB5b3VyIHB1cnBvc2UpIGV4cG9zdXJlIGlz
IGF0IGxlYXN0IG5vdCBnb2luZyB0byBiZSBhIHByb2JsZW0uDQo+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+
Pj4+Pj4+Pj4gYW5kICB3aGVyZSBjYW4gcHJldmVudCBQVkggZG9tYWluIGNhbGxpbmcgdGhpcyBm
b3Igc2VsZi1tYXBwaW5nLCBub3Qgb25seSBkb20wPw0KPj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+
Pj4gQWl1aSB1c2Ugb24gaXRzZWxmIGlzIGxpbWl0ZWQgdG8gRG9tMCwgc28gb25seSB0aGF0IHdv
dWxkIG5lZWQgY2xhcmlmeWluZw0KPj4+Pj4+Pj4+Pj4+IChhbG9uZyB0aGUgbGluZXMgb2YgdGhl
IGFib3ZlLCBpLmUuIHRoYXQvd2h5IGl0IGlzIG5vdCBhIHByb2JsZW0pLiBGb3INCj4+Pj4+Pj4+
Pj4+PiBoYXNfcGlycSgpIGRvbWFpbnMgdXNlIG9uIG9uZXNlbGYgd2FzIGFscmVhZHkgcGVybWl0
dGVkIGJlZm9yZS4NCj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiBDaGFuZ2VkIGNvbW1pdCBtZXNz
YWdlIHRvIGJlbG93LiBQbGVhc2UgY2hlY2sgYW5kIHRoYXQgd2lsbCBiZSBncmVhdCBoZWxwZnVs
IGlmIHlvdSB3b3VsZCBzaG93IG1lIGhvdyB0byBtb2RpZnkgaXQuDQo+Pj4+Pj4+Pj4+PiB7DQo+
Pj4+Pj4+Pj4+PiB4ODYvcHZoOiBBbGxvdyAodW4pbWFwX3BpcnEgd2hlbiBkb20wIGlzIFBWSA0K
Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IFByb2JsZW06IHdoZW4gZG9tMCBpcyBQVkggdHlwZSBh
bmQgcGFzc3Rocm91Z2ggYSBkZXZpY2UgdG8gSFZNIGRvbVUsIFFlbXUNCj4+Pj4+Pj4+Pj4+IGNv
ZGUgeGVuX3B0X3JlYWxpemUtPnhjX3BoeXNkZXZfbWFwX3BpcnEgYW5kIGxpYnhsIGNvZGUgcGNp
X2FkZF9kbV9kb25lLT4NCj4+Pj4+Pj4+Pj4+IHhjX3BoeXNkZXZfbWFwX3BpcnEgbWFwIGEgcGly
cSBmb3IgcGFzc3Rocm91Z2ggZGV2aWNlcy4NCj4+Pj4+Pj4+Pj4+IEluIHhjX3BoeXNkZXZfbWFw
X3BpcnEgY2FsbCBzdGFjaywgZnVuY3Rpb24gaHZtX3BoeXNkZXZfb3AgaGFzIGEgY2hlY2sNCj4+
Pj4+Pj4+Pj4+IGhhc19waXJxKGN1cnJkKSwgYnV0IGN1cnJkIGlzIFBWSCBkb20wLCBQVkggaGFz
IG5vIFg4Nl9FTVVfVVNFX1BJUlEgZmxhZywNCj4+Pj4+Pj4+Pj4+IHNvIGl0IGZhaWxzLCBQSFlT
REVWT1BfbWFwX3BpcnEgaXMgbm90IGFsbG93ZWQgZm9yIFBWSCBkb20wIGluIGN1cnJlbnQNCj4+
Pj4+Pj4+Pj4+IGNvZGVzLg0KPj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IFRvIHNvbHZlIGFib3Zl
IHByb2JsZW0sIG5lZWQgdG8gcmVtb3ZlIHRoZSBjaGFjayBoYXNfcGlycSgpIGZvciB0aGF0DQo+
Pj4+Pj4+Pj4+PiBzaXR1YXRpb24oUEhZU0RFVk9QX21hcF9waXJxIGlzIGlzc3VlZCBieSBkb20w
IGZvciBkb21VcykuIEJ1dCB3aXRob3V0DQo+Pj4+Pj4+Pj4+PiBhZGRpbmcgb3RoZXIgcmVzdHJp
Y3Rpb25zLCBQSFlTREVWT1BfbWFwX3BpcnEgd2lsbCBiZSBhbGxvd2VkIHdpZGVyIHRoYW4NCj4+
Pj4+Pj4+Pj4+IHdoYXQgdGhlIHByb2JsZW0gbmVlZC4NCj4+Pj4+Pj4+Pj4+IFNvLCBjbGFyaWZ5
IGJlbG93Og0KPj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IEZvciBIVk0gZG9tVXMgd2hvc2UgWEVO
RkVBVF9odm1fcGlycXMgaXMgbm90IGVuYWJsZWQsaXQgaXMgZmluZSB0byBtYXANCj4+Pj4+Pj4+
Pj4+IGludGVycnVwdHMgdGhyb3VnaCBwaXJxIGZvciB0aGVtLiBCZWNhdXNlIHBpcnEgZmllbGQg
aXMgdXNlZCBhcyBhIHdheSB0bw0KPj4+Pj4+Pj4+Pj4gcmVmZXJlbmNlIGludGVycnVwdHMgYW5k
IGl0IGlzIGp1c3QgdGhlIHdheSBmb3IgdGhlIGRldmljZSBtb2RlbCB0bw0KPj4+Pj4+Pj4+Pj4g
aWRlbnRpZnkgd2hpY2ggaW50ZXJydXB0IHNob3VsZCBiZSBtYXBwZWQgdG8gd2hpY2ggZG9tYWlu
LCBob3dldmVyDQo+Pj4+Pj4+Pj4+PiBoYXNfcGlycSgpIGlzIGp1c3QgdG8gY2hlY2sgaWYgSFZN
IGRvbWFpbnMgcm91dGUgaW50ZXJydXB0cyBmcm9tDQo+Pj4+Pj4+Pj4+PiBkZXZpY2VzKGVtdWxh
dGVkIG9yIHBhc3N0aHJvdWdoKSB0aHJvdWdoIGV2ZW50IGNoYW5uZWwsIHNvLCByZW1vdmUNCj4+
Pj4+Pj4+Pj4+IGhhc19waXJxKCkgY2hlY2sgaGFzIG5vIGltcGFjdCBvbiBIVk0gZG9tVXMuDQo+
Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4gRm9yIFBWSCBkb21VcyB0aGF0IHBlcmZvcm1zIHN1Y2gg
YW4gb3BlcmF0aW9uIHdpbGwgZmFpbCBhdCB0aGUgY2hlY2sNCj4+Pj4+Pj4+Pj4+IHhzbV9tYXBf
ZGVkb21haW5fcGlycSgpIGluIHBoeXNkZXZfbWFwLW5pcnEoKS4NCj4+Pj4+Pj4+Pj4+DQo+Pj4+
Pj4+Pj4+PiBGb3IgUFZIIGRvbTAsIGl0IHVzZXMgdnBjaSBhbmQgZG9lc24ndCB1c2UgZXZlbnQg
Y2hhbm5lbCwgYXMgYWJvdmUgdGFsa3MsDQo+Pj4+Pj4+Pj4+PiBpdCBhbHNvIGhhcyBubyBpbXBh
Y3QuDQo+Pj4+Pj4+Pj4+PiB9DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IFRoaXMgaXMgYmV0dGVy
IHRoYW4gd2hhdCB5b3UgaGFkIGJlZm9yZSwgYW5kIEkgZG9uJ3QgcmVhbGx5IGZhbmN5IHJlLQ0K
Pj4+Pj4+Pj4+PiB3cml0aW5nIHRoZSBkZXNjcmlwdGlvbiBlZmZlY3RpdmVseSBmcm9tIHNjcmF0
Y2guIFNvIGxldCdzIGp1c3QgZ28gZnJvbQ0KPj4+Pj4+Pj4+PiB0aGVyZS4gQXMgdG8gdGhlICJl
eGNlc3MiIHBlcm1pc3Npb24gZm9yIHRoZSBzdWItb3BzOiBUaGUgbWFpbiB0aGluZyBJJ20NCj4+
Pj4+Pj4+Pj4gYWZ0ZXIgaXMgdGhhdCBpdCBiZSBjbGFyaWZpZWQgdGhhdCB3ZSdyZSBub3QgZ29p
bmcgdG8gaW50cm9kdWNlIGFueQ0KPj4+Pj4+Pj4+PiBzZWN1cml0eSBpc3N1ZXMgaGVyZS4gVGhh
dCByZXF1aXJlcyBhdWRpdGluZyB0aGUgY29kZSwgYW5kIG1lcmVseSBzYXlpbmcNCj4+Pj4+Pj4+
Pj4gImFsc28gaGFzIG5vIGltcGFjdCIgaXMgYSBsaXR0bGUgdG9vIGxpdHRsZSBmb3IgbXkgdGFz
dGUuIEZvciBEb20wIGFuDQo+Pj4+Pj4+Pj4+IGFyZ3VtZW50IG1heSBiZSB0aGF0IGl0IGlzIG92
ZXJseSBwb3dlcmZ1bCBhbHJlYWR5IGFueXdheSwgZXZlbiBpZiBmb3INCj4+Pj4+Pj4+Pj4gUFZI
IHdlJ3JlIGEgbGl0dGxlIG1vcmUgc3RyaWN0IHRoYW4gZm9yIFBWIChJIHRoaW5rKS4NCj4+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4+IEhpIEphbiwgZm9yIGNsYXJpdHkgYW5kIHRvIG1ha2UgdGhpcyBhY3Rp
b25hYmxlLCBhcmUgeW91IHN1Z2dlc3RpbmcgdG8NCj4+Pj4+Pj4+PiBjbGFyaWZ5IHRoZSBjb21t
aXQgbWVzc2FnZSBieSBhZGRpbmcgd29yZGluZyBhcm91bmQgIkRvbTAgaXMgb3Zlcmx5DQo+Pj4+
Pj4+Pj4gcG93ZXJmdWwgYWxyZWFkeSBhbnl3YXkgc28gaXQgaXMgT0sgc28gdGhpcyBpcyBPSyIg
Pw0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFllcywgcGVyaGFwcyB3aXRoICJkZWVtZWQiIGFkZGVkLiAN
Cj4+Pj4+Pj4gT0ssIGZvciBQVkggZG9tMCwgSSB3aWxsIGNoYW5nZSB0byAiIERvbTAgaXMgZGVl
bWVkIG92ZXJseSBwb3dlcmZ1bCBhbHJlYWR5IGFueXdheSwgc28gaXQgaXMgT0sgIg0KPj4+Pj4+
DQo+Pj4+Pj4gSSBkb24ndCBtaW5kIHRoZSBkZWVtZWQgYXMgeW91IGFkZCBpdCwgYnV0IHRoZSBp
bXBvcnRhbnQgcGxhY2UgdG8gYWRkIGl0DQo+Pj4+Pj4gaGVyZSBpcyBiZWZvcmUgIk9LIi4gSSdt
IHNvcnJ5LCBpdCBkaWRuJ3Qgb2NjdXIgdG8gbWUgdGhhdCBhZnRlciBhbGwgdGhlDQo+Pj4+Pj4g
cHJpb3IgZGlzY3Vzc2lvbiB0aGlzIGVhcmxpZXIgcmVwbHkgb2YgbWluZSBjb3VsZCBzdGlsbCBi
ZSBtaXMtaW50ZXJwcmV0ZWQuDQo+Pj4+Pj4NCj4+Pj4+Pj4+IEFuZCB0ZXh0IGZvciBEb21VLXMg
c2ltaWxhcmx5IGV4dGVuZGVkLCBhcyB0aGUgcG9pbnRpbmcgYXQgdGhlIFhTTSBjaGVjayBpcyBw
cmVzZW50bHkgaW5jb21wbGV0ZSAoc3R1YmRvbS1zIGNhbg0KPj4+Pj4+Pj4gcGFzcyB0aGF0IGNo
ZWNrLCBhZnRlciBhbGwsIGFzIGNhbiBkZS1wcml2IHFlbXUgcnVubmluZyBpbiBEb20wKS4NCj4+
Pj4+Pj4gU28gc29ycnksIEkga25vdyBzbyBsaXR0bGUgYWJvdXQgdGhpcywgSSBjYW4ndCBleHBs
YWluIHRoZXNlIHNpdHVhdGlvbnMsIGNvdWxkIHlvdSB0ZWxsIG1lIGhvdyB0byBkZXNjcmliZSBv
ciBoZWxwIG1lIHdyaXRlIGEgcGFyYWdyYXBoPw0KPj4+Pj4+DQo+Pj4+Pj4gSSdtIGFmcmFpZCB0
aGF0IGluIG9yZGVyIHRvIG1ha2UgKHByb3Bvc2UpIHN1Y2ggYSBjaGFuZ2UgeW91IG5lZWQgdG8g
YmUNCj4+Pj4+PiBhYmxlIHRvIGV4cGxhaW4gd2h5IGl0IGlzIG9rYXkgdG8gZXhwb3NlIGZ1bmN0
aW9uYWxpdHkgYmV5b25kIHdoZXJlIGl0J3MNCj4+Pj4+PiBwcmVzZW50bHkgZXhwb3NlZC4gSXQn
cyBub3QganVzdCB3cml0aW5nIGEgbmV3IHBhcmFncmFwaCB0aGF0J3MgbmVlZGVkDQo+Pj4+Pj4g
aGVyZS4gWW91IGZpcnN0IG5lZWQgdG8gX2NoZWNrXyB0aGF0IHdoYXQgeW91IGRvIGlzIG9rYXku
IEFuZCBvbmNlIHlvdSd2ZQ0KPj4+Pj4+IGRvbmUgdGhhdCBjaGVja2luZywgeW91IHRoZW4gc3Vt
bWFyaXplIHRoYXQgaW4gd3JpdGluZy4NCj4+Pj4+ICANCj4+Pj4+DQo+Pj4+PiBQSFlTREVWT1Bf
bWFwX3BpcnEgZW5kcyB1cCBjYWxsaW5nIHBoeXNkZXZfbWFwX3BpcnEgd2hpY2ggaXMgcHJvdGVj
dGVkDQo+Pj4+PiBieToNCj4+Pj4+DQo+Pj4+PiAgICAgcmV0ID0geHNtX21hcF9kb21haW5fcGly
cShYU01fRE1fUFJJViwgZCk7DQo+Pj4+PiAgICAgaWYgKCByZXQgKQ0KPj4+Pj4gICAgICAgICBy
ZXR1cm4gcmV0Ow0KPj4+Pj4NCj4+Pj4+IERvbTAgaGF2aW5nIHBlcm1pc3Npb24gdG8gZG8gUEhZ
U0RFVk9QX21hcF9waXJxIGV2ZW4gd2l0aG91dCBoYXNfcGlycSBpcw0KPj4+Pj4gZmluZS4gRGV2
aWNlIG1vZGVscyBhcmUgYWxzbyBPSyBiZWNhdXNlIHRoZSBjb2RlIHdlIGFyZSB0cnlpbmcgdG8g
ZW5hYmxlDQo+Pj4+PiBpcyBpbiBmYWN0IHBhcnQgb2YgdGhlIGRldmljZSBtb2RlbC4gSWYgc29t
ZW9uZSB3ZXJlIHRvIHJ1biBhbiBIVk0NCj4+Pj4+IHN0dWJkb20gdGhleSBtaWdodCBuZWVkIHRo
aXMgcGF0Y2ggYXMgd2VsbC4NCj4+Pj4+DQo+Pj4+PiBJZiBQSFlTREVWT1BfbWFwX3BpcnEgaXMg
YWxsb3dlZCwgYWxzbyBQSFlTREVWT1BfdW5tYXBfcGlycSBzaG91bGQgYmUNCj4+Pj4+IGFsbG93
ZWQuDQo+Pj4+Pg0KPj4+Pj4gSXMgdGhpcyBleHBsYW5hdGlvbiBPSz8NCj4+Pj4NCj4+Pj4gVGhp
cyBzdGlsbCBzb2xlbHkgZm9jdXNlcyBvbiB3aHkgdGhlIGZ1bmN0aW9uYWxpdHkgaXMgd2FudGVk
LiBUaGVyZQ0KPj4+PiBjb250aW51ZXMgdG8gYmUgbm90aGluZyBhYm91dCB0aGUgd2lkZXIgZXhw
b3N1cmUgYWN0dWFsbHkgYmVpbmcgc2FmZS4NCj4+Pg0KPj4+IEkgZG9uJ3QgdGhpbmsgSSB1bmRl
cnN0YW5kIHdoYXQgeW91IHdvdWxkIGxpa2UgdG8gYmUgY2hlY2tlZCBvcg0KPj4+IGNsYXJpZmll
ZC4uLg0KPj4+DQo+Pj4gVGhlIG9ubHkgd2lkZXIgZXhwb3N1cmUgaXMgdG8gZGV2aWNlIG1vZGVs
cywgYW5kIGRldmljZSBtb2RlbHMgY2FuIGRvIGENCj4+PiBsb3Qgd29yc2UgdGhhbiBtYXBwaW5n
IHBpcnFzIGFscmVhZHkuIFRoZXJlIGlzIG5vIHdpZGVyIGV4cG9zdXJlIHRvDQo+Pj4gRG9tVXMu
IEFsc28gUFYgZGV2aWNlIG1vZGVscyBjYW4gYWxyZWFkeSBkbyB0aGlzLg0KPj4NCj4+IFdoYXQg
ZG8geW91IG1lYW4gYnkgIndvcnNlIj8gSSBob3BlIG5vdCAiY3Jhc2ggWGVuIj8gQW5kIF90aGF0
J3NfIHdoYXQgSQ0KPj4gd2FudCB0byBoYXZlIGFzc3VyYW5jZSBvZiwgZS5nLiBhIFBWSC9IVk0g
RE0gbm90IHN1ZGRlbmx5IGJyaW5naW5nIFhlbg0KPj4gZG93biwgYmVjYXVzZSB0aGVzZSBwYXRo
cyBwcmV2aW91c2x5IHdlcmVuJ3QgYWNjZXNzaWJsZSB0byB0aGVtLg0KPiANCj4gV2hhdCBhYm91
dCBhIGNvbW1pdCBtZXNzYWdlIGFsb25nIHRoZSBsaW5lcyBvZjoNCj4gDQo+IHg4Ni9odm06IGFs
bG93IHssdW59bWFwX3BpcnEgaHlwZXJjYWxscyB1bmNvbmRpdGlvbmFsbHkNCj4gDQo+IFRoZSBj
dXJyZW50IGh5cGVyY2FsbCBpbnRlcmZhY2VzIHRvIG1hbmFnZSBhbmQgYXNzaWduIGludGVycnVw
dHMgdG8NCj4gZG9tYWlucyBpcyBtb3N0bHkgYmFzZWQgaW4gdXNpbmcgcElSUXMgYXMgaGFuZGxl
cnMuICBTdWNoIHBJUlEgdmFsdWVzDQo+IGFyZSBhYnN0cmFjdCBkb21haW4tc3BlY2lmaWMgcmVm
ZXJlbmNlcyB0byBpbnRlcnJ1cHRzLg0KPiANCj4gQ2xhc3NpYyBIVk0gZG9tYWlucyBjYW4gaGF2
ZSBhY2Nlc3MgdG8geyx1bn1tYXBfcGlycSBoeXBlcmNhbGxzIGlmIHRoZQ0KPiBkb21haW4gaXMg
YWxsb3dlZCB0byByb3V0ZSBwaHlzaWNhbCBpbnRlcnJ1cHRzIG92ZXIgZXZlbnQgY2hhbm5lbHMu
DQo+IFRoYXQncyBob3dldmVyIGEgZGlmZmVyZW50IGludGVyZmFjZSwgbGltaXRlZCB0byBvbmx5
IG1hcHBpbmcNCj4gaW50ZXJydXB0cyB0byBpdHNlbGYuIFBWSCBkb21haW5zIG9uIHRoZSBvdGhl
ciBoYW5kIG5ldmVyIGhhZCBhY2Nlc3MNCj4gdG8gdGhlIGludGVyZmFjZSwgYXMgUFZIIGRvbWFp
bnMgYXJlIG5vdCBhbGxvd2VkIHRvIHJvdXRlIGludGVycnVwdHMNCj4gb3ZlciBldmVudCBjaGFu
bmVscy4NCj4gDQo+IEluIG9yZGVyIHRvIGFsbG93IHNldHRpbmcgdXAgUENJIHBhc3N0aHJvdWdo
IGZyb20gYSBQVkggZG9tYWluIGl0DQo+IG5lZWRzIGFjY2VzcyB0byB0aGUgeyx1bn1tYXBfcGly
cSBoeXBlcmNhbGxzIHNvIGludGVycnVwdHMgY2FuIGJlDQo+IGFzc2lnbmVkIGEgcElSUSBoYW5k
bGVyIHRoYXQgY2FuIHRoZW4gYmUgdXNlZCBieSBmdXJ0aGVyIGh5cGVyY2FsbHMgdG8NCj4gYmlu
ZCB0aGUgaW50ZXJydXB0IHRvIGEgZG9tYWluLg0KPiANCj4gTm90ZSB0aGF0IHRoZSB7LHVufW1h
cF9waXJxIGh5cGVyY2FsbHMgZW5kIHVwIGNhbGxpbmcgaGVscGVycyB0aGF0IGFyZQ0KPiBhbHJl
YWR5IHVzZWQgYWdhaW5zdCBhIFBWSCBkb21haW4gaW4gb3JkZXIgdG8gc2V0dXAgaW50ZXJydXB0
cyBmb3IgdGhlDQo+IGhhcmR3YXJlIGRvbWFpbiB3aGVuIHJ1bm5pbmcgaW4gUFZIIG1vZGUuICBw
aHlzZGV2X21hcF9waXJxKCkgd2lsbA0KPiBjYWxsIGFsbG9jYXRlX2FuZF9tYXBfe2dzaSxtc2l9
X3BpcnEoKSB3aGljaCBpcyBhbHJlYWR5IHVzZWQgYnkgdGhlDQo+IHZJTy1BUElDIG9yIHRoZSB2
UENJIGNvZGUgcmVzcGVjdGl2ZWx5LiAgU28gdGhlIGV4cG9zZWQgY29kZSBwYXRocyBhcmUNCj4g
bm90IG5ldyB3aGVuIHRhcmdldGluZyBhIFBWSCBkb21haW4sIGJ1dCByYXRoZXIgcHJldmlvdXMg
Y2FsbGVycyBhcmUNCj4gbm90IGh5cGVyY2FsbCBidXQgZW11bGF0aW9uIGJhc2VkLg0KDQpUaGFu
ayB5b3UgdGhyZWUgdmVyeSB2ZXJ5IG11Y2ggZm9yIHlvdXIgaGVscC4NCkkgd2lsbCBjaGFuZ2Ug
dG8gdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+IFJlZ2FyZHMsIFJvZ2VyLg0KDQotLSAN
CkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

