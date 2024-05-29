Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D568D2B03
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 04:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731354.1136781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC9G3-00022A-JD; Wed, 29 May 2024 02:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731354.1136781; Wed, 29 May 2024 02:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sC9G3-0001zq-GT; Wed, 29 May 2024 02:41:43 +0000
Received: by outflank-mailman (input) for mailman id 731354;
 Wed, 29 May 2024 02:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Qc4=NA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sC9G2-0001zk-Ex
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 02:41:42 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f954a231-1d64-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 04:41:39 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA1PR12MB9031.namprd12.prod.outlook.com (2603:10b6:208:3f9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 02:41:35 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 02:41:35 +0000
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
X-Inumbo-ID: f954a231-1d64-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfmOa6Y8+E+p7J7EGWgjbx0mkoU9S+7NSVX5ldBlIxe7IUe9uEAJwmQPDH4uZOmSODm13Wdc3W3jAVjYTqeGJoqPeV2ugYIA04CasHhD1xt5DgEqNpsu2+E9kChXOI6mvkSGY+8Y/hMYt0x5fINr9c7ak0trQBKlB5HFQJ1sOeEkY+XL/I96pwBe7wlCzjR9/R7LfIE9FTqVzjuMMthV4ATDfsADtUuQDPo2cIOFxBIDcQjTye49ZDcrjnr2pDqR/cUGzN04OcG0R3CfM7upImvbIMuyPjh+Tf0DvXmh4sIVIpyOgoCwglTds04RdljTNpcCmezelwtRo7NXsVqtXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDkjhV3rZSLjsIcf85zwMATrC5rqia9SuBxLTHhyLR0=;
 b=i8JPfn3gjp8bICdgTXNBNylPoIu65hGFkvxeMmf37Z54TJ4DA8KwC5e0CA7Oktisoo46Vd+pUMz1+R7I9Hx6HgOKQ6lItGXhU2KXacMXFm9ilZ2YuSeID+jA6UOn/GT1K+U9Vj3GKHsd+UpPfO7luEAAUObBr2FEx2C1EZ/S8YZQ+02LOYJfpB/To0JH6j1HFO/L7PL82j5KEYokZ83RlmGdceZadFyLiZE3a5JYwzc6m7I5n6i4SIlAN6fNPOFb/X061lmIjYrZItbUF00y/P848XMDdecg0sYlqm05gmw/j1NFd0yTZgqofx+SxMvir8wBS8HI0qoPgn1tt+c0Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDkjhV3rZSLjsIcf85zwMATrC5rqia9SuBxLTHhyLR0=;
 b=gWEwO6bbAksZ1uHTYPeIipisL9Sy99vZ0attYYJAit+1GTQBOsP4uE3HYws/lknQPd1u2/UnoougKWthWOm0RzSdvdHvBcCpLyKJmYqwWLEf3B5FMaCp+/62wm9xyI/L2kPTJ/xv0dNE8MCtS0V7wVXw7sh550NeYKkoupM3S4M=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4D//4e1AIAAis+A//+FmgCAEsTugA==
Date: Wed, 29 May 2024 02:41:35 +0000
Message-ID:
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
In-Reply-To: <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7611.030)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA1PR12MB9031:EE_
x-ms-office365-filtering-correlation-id: be91c9b1-43db-40f8-e418-08dc7f88db8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|7416005|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?Sm1uaDJmdWNDMWF3VUFrTEtnWE9MOE02ZGtFMWFqZk12RkxudU1YbWdHNktv?=
 =?utf-8?B?MUZuVjBFVFNZcnYxam9lMkxqZlQ4VEVTOTMzM2k0dElIbkc1eVE0Y2JZdUhJ?=
 =?utf-8?B?QnVseUVFLzIveHBtaGJvM1dHYjdDWjJVWDBzWG5xQTRNWUFLWXV0MnRHZUd1?=
 =?utf-8?B?M2tPUUNGMWtDeUlKNkdZU3dmZTVRelNORkVPa3R4V3FmRWxzTlVndnVXVnJM?=
 =?utf-8?B?ZEJ2SGJ1Ykd4WDZWMXZFZzNiSHZmUHVxK3VDMyszUFZlcDNqb1RaVHhna0Nm?=
 =?utf-8?B?ai9KYWFwRlh3dnNsUlAxd3Rwc01uMXJTODY4d2RXWXZxT0VXMzBVMUFRRTU2?=
 =?utf-8?B?TVpPeDVaQXhxMWJGc2JXVmJuRmVqUm1hL0NXYnJ4YVNVT3FTRzZRNzR0dUVD?=
 =?utf-8?B?SnRFN016aE9Na0c4c3orTE5zVXRqUTQrTUxjYndPTEQvUFFmRUpTbTNkaTVh?=
 =?utf-8?B?ZHBLdlZhbllSZk9vMG5SenRXcFRURWV4dCtKRnZiSG9nQml5TVAwZ2J5U3Rm?=
 =?utf-8?B?SU1RMkswb2dKQlR6ZjNhMkJoV1hDZFdSa0xiVU1aYzhQRmVtZkluTlZRN09J?=
 =?utf-8?B?dytXZkJUeE1FUmEveU9uMk1kZFIvRy8rWERLVnpiUGJWdmFrRStEZVo2dXNp?=
 =?utf-8?B?c2IzOU81TUtNNCtsellFVEpqd2YvOU5jOEx0OTJFdStvbStobVd5bmZ6bERL?=
 =?utf-8?B?TUJoeUg0ZVRXbVZtUkwrc1B1RWYxcHA4cHhrUkdDZXEya1YyTGVjcEYyRU95?=
 =?utf-8?B?THk3T210bXJhV05kbFFqYkltVmdvQWJFSC80Y0wwUXUwL25lb0NmbS9PNy9q?=
 =?utf-8?B?QTlySWJFNEZRZlVoc0c3QUpiNFc4MlJwK3l3NDZydWZrMHJIODdobmpxWW1v?=
 =?utf-8?B?TzZTUHBCRWFUOW9hd0ZhU1VIM0NZcjZWbnhvbTRVUXFmTXdXSHFEUXFQQmVq?=
 =?utf-8?B?ZWNDcFJUaFBmSlRvMGZ1ZW5hMjUrNG9EL0gwcC92dWRDNUhNVS9RaWlWTXRG?=
 =?utf-8?B?UnhEeVBoVVVXT0FoNE9yb0p4MzMvRDF6ZDhaQ01OdmFtbGs0VEg0bDRjcTZw?=
 =?utf-8?B?ZVFmVXJOZlk1b1JsTEd5ZnBMZTNpUUREdWNzWVFUQ0NIa2ljK2VMTVFaalVu?=
 =?utf-8?B?LzMybW90ZTRpV3NMcDNka0hQTWpCU0paZE9qL00wRWhaaDFhNktrRHZ3amQx?=
 =?utf-8?B?QWl0dktvV0hLbFRQOHdXYWkzWmplSUgra0JmdjkwWUx4QlhMREpJY3RLR0ZO?=
 =?utf-8?B?WGZIdEJUOUJsVCswaGpRNE9RdVVab3VLUFNObWgvN3E3ekdFWGdXMzFBVEFy?=
 =?utf-8?B?OHpJRUxqa1ZDSys3a291ejk4NXBZbnBFT2ZmQjlHYzYyZ0R5Y1FXMlJZK1Fs?=
 =?utf-8?B?L1N0NzdIcXVEY0xodHhjbE1MdDM1WXk2V0R2Q2pvaTBmSE43SWhVay9QVXM1?=
 =?utf-8?B?cDI3NS9VUDNPSlJFL1hhRGxjLzdGVFVTOSt3RjI4bkpTNXJvajVTMWhLdXVh?=
 =?utf-8?B?N1FhWmxhZmIxcWRWQkFucHdQdFF3d3JxRzR3cUNaV3RWMlhiMmZHNys5d1RN?=
 =?utf-8?B?dnVzdmhsdjV2VWRPSHRJYWV0R3pEMFlEMC9Ca1FsR1pUa1hsMXhkOHNwZEk5?=
 =?utf-8?B?RkRvcHNQVDh6emRFMVAvYWdvMUlQbmtWY280aUZvcXBUU2wrQzJSZTlOMGY2?=
 =?utf-8?B?MGRNbEVDbXZzRW5rd3hQNFJud1BJMEE5NURHaWN3OWdjMnhEQkpndStKOEpQ?=
 =?utf-8?B?dXgwUVhpWnpqakxkUFo3Y3FSRzBZZVRYQ1kzR21pZWNwdEdsQjNxcUpPU0JL?=
 =?utf-8?B?OGticEdBQ2pEUDFkMVJ2QT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUpFOGxEeUdZd01ZZlVqYXJFMklLZ2xDWFFoRmNyWXZiVGlSTnRPZlZFSlZE?=
 =?utf-8?B?a2dSdkhkemdZZHdhWjZkNTFmbTB2aFNCR2YxUlJDc1FuQXh5OGFqTk9wTUd5?=
 =?utf-8?B?N1BPWW1nNDdiaUYwQmtqNVM4STNVYjN6ZUxrUjFvREU0UHRLWStRZGF2NVZ1?=
 =?utf-8?B?ajNiTm5KQnlENGhOUVAza2xaRnpCcFpJRUtzTkkxS2pUUGlZVEtWOC8ydUR0?=
 =?utf-8?B?N3JxZWl0T2c4UTg4QXhFNlBtcjM3MHVqYlNOdm5yS2hNODNlWFR4TkxJZUNP?=
 =?utf-8?B?S21zUTBCSWtIVVh4eXp6N0duWGtOaXBRdnpmSW94bXE1TmRCUXVrVmQrRE9k?=
 =?utf-8?B?Rmx4dll2L0h4RlBHK1ZKaFVEY3J3S2tMbVhBbjFmLzFtOVNZREsxUy9QV3o0?=
 =?utf-8?B?Sk9KTGM4NkVkemFMSVRyV2h1MGpiZUl5N3ZleW0zN1lGM3ozdnBkWlNncjI2?=
 =?utf-8?B?VnBhRnNKcjg1bzF6b1E5K3pMZFczM29EQXpPVjk2WTA2anlhR1IrL2FoN3Bl?=
 =?utf-8?B?Nm9TV0ZQQlowb0pabXdsMTAzZHRucVV6d2o3UHFBZVNFNHp4V1Rtdm9OTHpo?=
 =?utf-8?B?UTB1cEpKQXRGZ0tpclJhOUxzR0E3cTIvUERqZ29sVUpSVzJaRjk5WlVkTmxV?=
 =?utf-8?B?cVJrV1c5Q0JramM2eDlSOEtFM2tDLzJteTNjODFOZ0lKb3JsMzdPWXNDN1NW?=
 =?utf-8?B?aUFWRDR2R0l5MDdzb2RZVXZkWnZyUnVJdm8wQzM4eWZBVWRkMXZvV04yYW92?=
 =?utf-8?B?TUtaOW1DbHpqZjEyL0JON1U2YTlOS1NlQ05LTmJ3WFUrMS9XSTBoYTVCSWdr?=
 =?utf-8?B?UmwyNFhOY1J1NFpQL2JONU1lY2JmcVdGdzdlRU5YWVcvS0JlbFFIT21Hejlh?=
 =?utf-8?B?c0o4RW0rYlB4b1pPNC9UWUNuaTg1ekZ3MXFBK1FEQmRRVU1ka0MwT3p2bXNw?=
 =?utf-8?B?b0NjNVRDTDJUR0pFYjBPbncwQzNweUR5QmJhL1JhQ3VTZHp6VUNCcWgrV3VU?=
 =?utf-8?B?RjFWeHVFQVVzMThsYzhKRlBYdTNWSDhVeDZtQmg2UUtWTExxL21TU25hdHNR?=
 =?utf-8?B?RDBaNmZrWnZTTGx3dVBsdGN3MTEzWWN4RHJVK1ZjUWNRRlBnMC9Layt5R09D?=
 =?utf-8?B?YVdBOUZXc0RPZk9CK1ZwMHNwdTFxb2ZHdWlDVS9IcFZMVTMvSEV1N3M1Zk9i?=
 =?utf-8?B?ZzZQK005NWk3U0hSa1JMdTJiWGxCY3Z5MTB4dmRUajlpTEp3cUg1RnhhTDI2?=
 =?utf-8?B?VkQ4MDlpTUZjdERmdG1IaTVkcXhXd2tWTW4rNmZiVGh6S3ZMaGU4VzBtbEpQ?=
 =?utf-8?B?azU4RzZFRU5HNkpDZFRaWndKQ200elhTalNjOU9DMHlYN3VkMVlYQjhZQ1VM?=
 =?utf-8?B?MU5qY1RaYnNvL2pNR2cySTN1eTM0OENiem9USjZ6MEhNNE53UmZJcU02a3BN?=
 =?utf-8?B?SFBzMWYycVUwdy9wbWlzaFdaVDB3TiszMXhGVUFGMnJyMmRiT1ZSU1VIdG4r?=
 =?utf-8?B?ZnNzNTc1RVI5cGdnbXlMazdSRWQ1QUVPY2VhRnBxL3hDLzNJKzQ4RUtPYzcy?=
 =?utf-8?B?RGhObTRZYmFQKzhOUjU1aEE5WFdSdU9Xb2pGbVNZeU1vSHpoZjJydGd0Vjll?=
 =?utf-8?B?bnJ1bWdNQ3ZyMDg0Y2UvcnArNGlORlp2WHhPZ25QSnZVSWR5bG56VVhOR1Yw?=
 =?utf-8?B?c1RPQ2tjR0M2QWlEL2NJSXpRSUxwSWNQV3VGWUN5dkx2dFE1VE1jTHIxNzRj?=
 =?utf-8?B?R0ZoL2VqTnpnRFJBTmZJT1AzN290U0dsbktpUjdUckh2ak11QVdCdzdpdkZ0?=
 =?utf-8?B?ZGtlcUZHNVd6YUxZbXQrWkhaUGp0UjNIUjkzWExidkdrMkh4cmx4TGFFc3c4?=
 =?utf-8?B?MEx1OVNoWFhUUDRtdFlsRkpsdE9xamFQdVc4a3p3UWVFRjdOdGpHK0xGS1Nm?=
 =?utf-8?B?TXhEOWsvNnNvWTNHelVPUUlNajF4ZWNVSGZ2QUdyb2w1d1RYWEp2Z3BKMmho?=
 =?utf-8?B?MU91b3UwQ0JNTlVKSjVYZU8vVkR2eUVsNlpoNnMydVVmelVLZnpyeVE1amxE?=
 =?utf-8?B?aWVrY2hLUmt2OXZRY0dwTmFsWUxJZDFWa25RSFIyeHllbXpIZUZHSlFGMW04?=
 =?utf-8?Q?kHGQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5212D35F83E7CB46A35322337E6ECC40@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be91c9b1-43db-40f8-e418-08dc7f88db8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 02:41:35.5531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Rv42bhHKaRxiSnBlvJ7aQm3AlZmuUN0poY1ni73JS4Trfz1Ct0LEF5gQr4Bv6tp5He+wtNHgz0duUZ/3miJpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9031

SGksDQpPbiAyMDI0LzUvMTcgMTk6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wNS4y
MDI0IDEzOjE0LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzUvMTcgMTg6NTEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE3LjA1LjIwMjQgMTI6NDUsIENoZW4sIEppcWlhbiB3
cm90ZToNCj4+Pj4gT24gMjAyNC81LzE2IDIyOjAxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
IE9uIDE2LjA1LjIwMjQgMTE6NTIsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pj4+ICsgICAgICAg
IGlmICggZ3NpID49IG5yX2lycXNfZ3NpICkNCj4+Pj4+PiArICAgICAgICB7DQo+Pj4+Pj4gKyAg
ICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+Pj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+
Pj4+ICsgICAgICAgIH0NCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICAgICAgaWYgKCAhaXJxX2FjY2Vz
c19wZXJtaXR0ZWQoY3VycmVudC0+ZG9tYWluLCBnc2kpIHx8DQo+Pj4+Pg0KPj4+Pj4gSS5lLiBh
c3N1bWluZyBJUlEgPT0gR1NJPyBJcyB0aGF0IGEgdmFsaWQgYXNzdW1wdGlvbiB3aGVuIGFueSBu
dW1iZXIgb2YNCj4+Pj4+IHNvdXJjZSBvdmVycmlkZXMgbWF5IGJlIHN1cmZhY2VkIGJ5IEFDUEk/
DQo+Pj4+IEFsbCBpcnFzIHNtYWxsZXIgdGhhbiBucl9pcnFzX2dzaSBhcmUgZ3NpLCBhcmVuJ3Qg
dGhleT8NCj4+Pg0KPj4+IFRoZXkgYXJlLCBidXQgdGhlcmUncyBub3QgbmVjZXNzYXJpbHkgYSAx
OjEgbWFwcGluZy4NCj4+IE9oLCBzbyBkbyBJIG5lZWQgdG8gYWRkIGEgbmV3IGdzaV9jYXBzIHRv
IHN0b3JlIGdyYW50ZWQgZ3NpPw0KPiANCj4gUHJvYmFibHkgbm90LiBZb3Ugb3VnaHQgdG8gYmUg
YWJsZSB0byB0cmFuc2xhdGUgYmV0d2VlbiBHU0kgYW5kIElSUSwNCj4gYW5kIHRoZW4gY29udGlu
dWUgdG8gcmVjb3JkIGluIC8gY2hlY2sgYWdhaW5zdCBJUlEgcGVybWlzc2lvbnMuDQpCdXQgSSBm
b3VuZCBpbiBmdW5jdGlvbiBpbml0X2lycV9kYXRhOg0KICAgIGZvciAoIGlycSA9IDA7IGlycSA8
IG5yX2lycXNfZ3NpOyBpcnErKyApDQogICAgew0KICAgICAgICBpbnQgcmM7DQoNCiAgICAgICAg
ZGVzYyA9IGlycV90b19kZXNjKGlycSk7DQogICAgICAgIGRlc2MtPmlycSA9IGlycTsNCg0KICAg
ICAgICByYyA9IGluaXRfb25lX2lycV9kZXNjKGRlc2MpOw0KICAgICAgICBpZiAoIHJjICkNCiAg
ICAgICAgICAgIHJldHVybiByYzsNCiAgICB9DQpEb2VzIGl0IG1lYW4gdGhhdCB3aGVuIGlycSA8
IG5yX2lycXNfZ3NpLCB0aGUgZ3NpIGFuZCBpcnEgaXMgYSAxOjEgbWFwcGluZz8NCldoYXQncyBt
b3JlLCB3aGVuIHVzaW5nIFBIWVNERVZPUF9zZXR1cF9nc2ksIGl0IGNhbGxzIG1wX3JlZ2lzdGVy
X2dzaSwNCmFuZCBpbiBtcF9yZWdpc3Rlcl9nc2ksIGl0IHVzZXMgIiBkZXNjID0gaXJxX3RvX2Rl
c2MoZ3NpKTsgIiB0byBnZXQgaXJxX2Rlc2MgZGlyZWN0bHkuDQoNCkNvbWJpbmluZyBhYm92ZSwg
Y2FuIHdlIGNvbnNpZGVyICJnc2kgPT0gaXJxIiB3aGVuIGlycSA8IG5yX2lycXNfZ3NpID8NCj4g
DQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

