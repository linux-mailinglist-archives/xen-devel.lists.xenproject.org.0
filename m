Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4CB926FFC
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 08:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753537.1161720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPGJQ-0004uG-31; Thu, 04 Jul 2024 06:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753537.1161720; Thu, 04 Jul 2024 06:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPGJQ-0004sk-0D; Thu, 04 Jul 2024 06:51:24 +0000
Received: by outflank-mailman (input) for mailman id 753537;
 Thu, 04 Jul 2024 06:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IA8J=OE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sPGJO-0004se-O9
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 06:51:22 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d168a090-39d1-11ef-bbf9-fd08da9f4363;
 Thu, 04 Jul 2024 08:51:20 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB6608.namprd12.prod.outlook.com (2603:10b6:8:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.26; Thu, 4 Jul
 2024 06:51:16 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 06:51:16 +0000
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
X-Inumbo-ID: d168a090-39d1-11ef-bbf9-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLpsVJ2TCtyrNsoLHg9NsIAhrzCGiiPZjDRKKN1InjVbdT6LB86xqfWJsGYgnVsNI1cUdlcILKIHZZHLv4Rxim0JcvRzNKMFtiuf8qjrBPAxqk6wVZVaHVKM5TUW2uRD3TOvPiUKKy/c3I7iY/UQuO6/v1OOp+svl4Fi2UdeXcnLUqph8HOW6Ol9xMi+/1T/lIpRd9cgbaU5U5UfnFchkEvjTxTKYo6xi7HjE3aiiP4GExEIHKFl1DXDMpL61t9RGTBXH7cjxEjU6YsZSBjV0iPVBu97KbkG1BRjdmHtaVc3tQRpv+jiqUw14ZrhLowC+DXXYLakl4QS9dbg1nE9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKe0UYjYqbi6NU5nU6YnuY/41cFqKiyH4edeqP67hNQ=;
 b=IF1vg2Lcm89G+o9w8E3EyZq4RahhkhC+3iGlTTOMC5xJdi8Mh74VAVbtdiPYNilhV/GdGQBQ/mjwAuUh80EMYFspxRG1GBegwEK++8bWd9YAAq68Y2iRaOiU9/oXbqyXXe4X04XtUId70hU7mjq1KSeqIQQ6D0HXDpRK+UOG00PWxsfeL0q1NwGs1ci6pjaGx+k3Jnldb2Hi5aul0mJI+EwxSxMt8wyzBEuFgccghblINlYAQ/34Efp/9SK4sEC3M/cpMAXUKXfSmdDd9ORLb8YYaApUO/zdTw55jchH5Jhz2iapOVnvXGLj5vlMiHDA2rph0qyLus38FGvjx6/cSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKe0UYjYqbi6NU5nU6YnuY/41cFqKiyH4edeqP67hNQ=;
 b=OhPBShR6yZGxAV3YTp/qTyVqGpcVFcXwVtI6Mt2VhymyCQ0znw1lbI1ak4QhYz5tQskGNA4kaaBIAxRvLappWd4rYSRNq7MraqGVFWbrkgaLCeN9yygAFwZEpxdcNZN6AwmE5p/M8Lj08qMd/GH8ATotHuosi7HFzy4UpKfmJEU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v11 2/8] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v11 2/8] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index:
 AQHayunRhQS+lhfPgk6PWMYxsBafhLHhf0AAgAHJ+4D//9kSgIADSGaA//+49wCAAImYAA==
Date: Thu, 4 Jul 2024 06:51:16 +0000
Message-ID:
 <BL1PR12MB5849BAE95305BDA357FEFB67E7DE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-3-Jiqian.Chen@amd.com>
 <9a311ee0-dcf2-4609-aced-7f57b322da5f@suse.com>
 <BL1PR12MB5849C3882D31620ADAC55ADAE7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <d1b22fa7-870e-4968-ba5d-c5d6fccb0af7@suse.com>
 <BL1PR12MB5849C0E9310A505E95937BDEE7DE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a3721ce4-b474-45d3-b2e7-4f2fd72544bf@suse.com>
In-Reply-To: <a3721ce4-b474-45d3-b2e7-4f2fd72544bf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7719.007)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB6608:EE_
x-ms-office365-filtering-correlation-id: 9d0937b8-0cf3-42e9-26ea-08dc9bf5b3a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bzJJNjRTQjVlcGJ0aEZBZGhWbWhKc3ZjS3RYT0VXaDUveTIrT2hUczNpOXdl?=
 =?utf-8?B?MFVDYncvRkhhemQ2M214WlpiemdqYkFSeHY4NitCeXIyeStuQmdjN2ZtSU4r?=
 =?utf-8?B?MlJyTUpxaTJKb0hCRklHUUFLdXZveTZjT1J4azg0Z3NkSENwTXNLb0MyUHdq?=
 =?utf-8?B?Wlc3MFNCQ2VMRmF1dDdzRmtpN1hOMEt4QXJpT3JNdTBZeWEvRjZobXdWNjhF?=
 =?utf-8?B?UDFPZHVMZDdvTVliVTZjNWFTakdQL2lnNHl2My9Eenl6OFBkd0tSUEsxQXhj?=
 =?utf-8?B?ZHYxaHAwM2VkN2NjRWp6N1RCdHdwY0c5WWdreW1GSHMvRjNUcE04Z0F1RU1N?=
 =?utf-8?B?MVZhL1lQUWNrcWJHcTNMUnNiZ2tPVmtJWlpTdEZJaWJRV3lMbTl6U1FFUTJD?=
 =?utf-8?B?U25PZ2hVTWpxMWxpRXkxYTNNSU9GT2U2ZzBXZ2VlUGhJYmdHVVZBaTFYNnl5?=
 =?utf-8?B?Q2cralpMaFhTdDBra01WdzBYRHVObm9kS0xQcEE5RlVrYkRuUHhFcEZtazJy?=
 =?utf-8?B?U1ZRWEc5Y3BBRC9qVHI2S0dobUYzcnY1am5VL0ozbEJjV056S2tiOTl4OXlV?=
 =?utf-8?B?em04c2ZtakRwQ29UYnhGV0N5eEhpdlBocXVpRk1BakxXRVVEQzlrdDBBUklh?=
 =?utf-8?B?UmgzUXBncXY3Q1NwR1JoS3hYUWh0SmgyN0Y3NFAwMGlVSXAwUnU3UWVqN3Er?=
 =?utf-8?B?TkFidjBacXphc3ZNbTVhN0RiN2owbmhLbjRUNGJSUjFUTEhWVElWT0owQnd5?=
 =?utf-8?B?dFZ1aHYrNWtzcHphT1hwN0RySjA1YWpZUElxR28wdk4vK1RxOFh0OTVrQm5B?=
 =?utf-8?B?MC9MNFE4U053NUYwdWkxdUpYU1FYSGZXY0lHYW43eDAvT3BDVWJoRHRoZnE1?=
 =?utf-8?B?UmVjT3RXelVhQklsQlRIeUh4Q3Yya0ZBOWI0aFoyZHNweHVvaWdvL1VVbTRm?=
 =?utf-8?B?UzdWK1d3UFZqNHhzSVY0dU52cG05VnlCRFlib2hFdkdOQktRaG9IdmxCOVd6?=
 =?utf-8?B?UEFLMUc2dUM1dE83MHlac0w1bHFEUG12UmpwTkRoa2w0S2Foc1JWVG1hcTZo?=
 =?utf-8?B?QXNPTWQzNVcvQ2d2ZXJRb1c1Znh1b1NxUm5jMC9YQXFOMUhYbHFQbTVhQzNi?=
 =?utf-8?B?b29oK2JOVzFhL0VlZkNsTHAzVWNSSUNoYjU2aDR5RDR3UXJWSWJxZC9QSzNs?=
 =?utf-8?B?a0RBQk53QUg0akQvVXZhWnVkWXVlQlFHTktMK1hnVkVYNjBvM0xodVlhc1Nu?=
 =?utf-8?B?QXI1UGhkb0hLdUlyeTBzMzkvcFl1RjhMajk1QnRac05ONDBGT3F0MWVoQ0xo?=
 =?utf-8?B?Y1Z6d0t5dXBlWEpIQkI5S3NhSVpGbjd5VWE4TW5QQytYbzlNRFpUd2JXU3pS?=
 =?utf-8?B?bS9yYU5IZ2VwdTNYSWFmVENZYmRuVDh4L3JUZmY3VUN3ZlNmUnJEM2xpMW5T?=
 =?utf-8?B?ZDBUeU0ydU5Qa3Y2eU5hNzhWTFdMUW9TSjZ1N3RLTzZBZHowaEF0TnEzVVVy?=
 =?utf-8?B?TG12U1pQSzlKYjdqNnRWV1RNMFltNGRVaWpQYmo5aER4VnBVVmdFNWx2VTBM?=
 =?utf-8?B?THBVU2YvSStFTkpsdVUxdmhIdi9IT2s4TTN1V0VwdXRFajJXY2JFMHp1cFVR?=
 =?utf-8?B?NDJTOHpycWtRaWxLcUQyZ3piNmE3dDlIVEwyaVI4SjkwWjBZNCs1MW9zYlBo?=
 =?utf-8?B?L0hyM1IxWGdhSGhvZFp2bmlYNHcydTE5SmxIelpLVktiQ0RXc2UzMyt0ZS9M?=
 =?utf-8?B?anA4Zk9FZ2lLV2ZQQUxNYWl1YkxPTEZMaWVyNjVYK3M4dEZDWG5pWDZ4SU5T?=
 =?utf-8?B?dmtONTVKL2RtWDRkcGJ4Y1M1Y25SQ2NCeXhCK3JtRUNpc3ZCL0JCWWhYMDZX?=
 =?utf-8?B?eUtQeFNYcnJDbGFQZURqSEk4aHJIdDZtYkdGclZBcnJONHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFZOZHhqaThFL21zOUlVeG9BK2VqOXg5Q1VEYTVoQ3hPQk50djVSZi9tVFIw?=
 =?utf-8?B?aVRlUy92ZFZuQit2U1JYUEJ5WmhyS2ZBcU43MEtBT2pJa3JFcGpibEdLaVJQ?=
 =?utf-8?B?TTZYZC9Qemx4Ykg4aHBkekNKZjNvU3JPY2dpVGZmUDNETEFxUlRFcm9IUXQ3?=
 =?utf-8?B?MnlqWDBIZDljWXpmMFpjVDJUVnBuTVc2WVUyN0lFWkllVFM0QlowS2ZVR3Yv?=
 =?utf-8?B?RUpnQW5ZRkpOK2tHOUlORFhUYUdzR0RtWnlGUm5tUDZyZ2tyNDR5N1FiZy9X?=
 =?utf-8?B?VU1OSGVST0w4dnlmWmliWTJ1VXQ1TGlCU1BpYXd4WWVZRlExaUw3T2JnTzVB?=
 =?utf-8?B?dGQwMjhjKzJUdkZZaENKeUlyRnZSL1haUzJUdktpekFOWWN2QVdod29xeFRy?=
 =?utf-8?B?OXlWTGJ5UE5odDlPaGpoNWZuYjZ1TFQrTmtQWGtCVGxXZGpnTGgra2RuZmdX?=
 =?utf-8?B?NUhyNnEyMTNuMjNuUHpsOHRPUDFGdTV0bVFVRytWb0VTSmJ4cnJKNGRBMCtv?=
 =?utf-8?B?YmJCNUF5OS9uYXZobFdRUWxNNTJqelN1dTZ6VHU3YlBxYzdzR2R2c21zTytj?=
 =?utf-8?B?TldwSXRvS0J4YzJPWHQ0QXY0Nm1PTFJSWDRvd0tjU243U1Ivck5qWmRCMGRS?=
 =?utf-8?B?UlJvSjhmVXVWRWlLL040STBSY1hIUHc2NTBaVXZIaUJ0bUw3ekRiYXdFU2Zr?=
 =?utf-8?B?L0ZuRVhrYjNPWjZZZUtTemEvRVY0bTBxeGdrNk50YzlOUWZjSnlDNTAzMTIw?=
 =?utf-8?B?QmZDeWRvaVdZOHdQakVhcUZtdmhOaXpqVk0xb2FXTmpaSGlxcUw1Wm9sbmJw?=
 =?utf-8?B?UDBrTC9hL2JQcHdqL2s2b2NrbnkwcUdOOC9BNlBiSXdUU294TjRRaTFjNlYx?=
 =?utf-8?B?UEJDOFdjMXlpSHI5N01pQ1RRRDN6NUlDK0ZaYWxlVldEQ3pYQjE0UDhKczNj?=
 =?utf-8?B?bENDdlJqOUNQRGI4OXFlNE85NGdpY2tVN3pQRzdzbDFKTnNKN0pwWSttUHgz?=
 =?utf-8?B?RlgxQjhYU29QRGZhb2tDSW95MVhrSExRUGI4a1ZxcHlVY0ljNDVmK0grUkNW?=
 =?utf-8?B?aENaT2pNdklKd00rc0VlQ3c5N3VkQmVuMS90MUNpSUY0MmdmY01UK3VEcVNM?=
 =?utf-8?B?dUpIV0pSVU96SGhKeE1LUGxWZE4xMTVkNlVqRVA1KzZKZFlWWU11RE8vcGQ4?=
 =?utf-8?B?VFZZdEZHWk5ZU0ppVlUvRXBrTEVrSW5uRmMzNDNNdVEyNWJpUlRjRDZKa2RW?=
 =?utf-8?B?K21DY1oxaHRsY0w4WEU5RzZ2a0lFTnNDUjZnaTNwclBDMWUzeVBGN1VJd3NW?=
 =?utf-8?B?M1RuSXVnbHRIZ3lqeUpWbDhPZEJ0Tmh3WXlwVDJGNW9CNEFJclhVNDhRakUr?=
 =?utf-8?B?UzcrbkkvTXQzbUVseis5NlNPU0JuTmZVc2cwUkxkc2s0NEZ5OXJVQy8xUmxG?=
 =?utf-8?B?aWtXd2JWZlIweDZWK0RBL1RxejFIbUUyV0JrM0RJejVwWmtyckF3OGU3aUQ1?=
 =?utf-8?B?a2pyM0ZubCszL2daTjB0NmgrSWUxSXRsTGUvYlJicG04aGNGVnBuVjVTcXlm?=
 =?utf-8?B?UDVlN2llTVlQV3JUbmJaMEhRbEg1Y3hsTWF3M1kxZkZlMG5QVzhlZjMzaFN0?=
 =?utf-8?B?MUxJQ0c3ZFVOTERtU0pubGdWSHJUaVY3OXdGNGtpeVd3Q2pxOXNlSFVjWEJu?=
 =?utf-8?B?bk81SjdQbmd6QlViS1dmQmJQaUR3VXFiV2xSU3hLcjU4cmo0MjljSHB5ckVS?=
 =?utf-8?B?VVJpSzgxMUR4NXlldDZVZzV1QnYvbno5VjBZRGcxRS9uWTd2ano4bysvTWRz?=
 =?utf-8?B?Q21lSE95bWFGcGtlb1ZIK1h6M0QvbTV6dmZ1K2ZtMnFPbXV5QWpPMmtybXlP?=
 =?utf-8?B?YktNaEZ1T0FLeElqVnR2NDlHZXVZWUU5bzNqK3NPVWlEUWVpUnZ3d2ZvL29F?=
 =?utf-8?B?Q1NDRXQ5a3dLS001R3QzdmJILzJxYjVESmpsbmN3L29GTE9RQ2FqSE4zb1g1?=
 =?utf-8?B?M016TGxhRy9WKzhHMXMyN0pHRU1xVisrZnJVMlVWbGVZQ2l2Z1d2UHhyWUxB?=
 =?utf-8?B?UHJKZVhMK28zNjR0KysveVZZc1h1ZW1sWkpjNFA0K0l6Mk5zQVFnVTZId1B5?=
 =?utf-8?Q?ksQc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B744E6A1066DFC4BA533370F3C21C54E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0937b8-0cf3-42e9-26ea-08dc9bf5b3a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 06:51:16.2669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: poixtiMEMH/atkY7Bz24vO+6qsSOgNO477f+dB1UTgT2iSH7zh/OgFq6e3KvyCTgUbH74yqTNLjURIKv19woIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6608

T24gMjAyNC83LzQgMTQ6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wNy4yMDI0IDA0
OjU2LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzcvMiAxNjo0NCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4gT24gMDIuMDcuMjAyNCAwNToxNSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0K
Pj4+PiBPbiAyMDI0LzcvMSAxNTo0NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAzMC4w
Ni4yMDI0IDE0OjMzLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvcGh5c2Rldi5jDQo+Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L3BoeXNkZXYuYw0KPj4+Pj4+
IEBAIC0zMjMsNiArMzIzLDEzIEBAIHJldF90IGRvX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dV
RVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+Pj4+Pj4gICAgICAgICAgaWYgKCAhZCApDQo+
Pj4+Pj4gICAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+ICANCj4+Pj4+PiArICAgICAgICAvKiBQ
cmV2ZW50IG1hcHBpbmcgd2hlbiB0aGUgc3ViamVjdCBkb21haW4gaGFzIG5vIFg4Nl9FTVVfVVNF
X1BJUlEgKi8NCj4+Pj4+PiArICAgICAgICBpZiAoIGlzX2h2bV9kb21haW4oZCkgJiYgIWhhc19w
aXJxKGQpICkNCj4+Pj4+PiArICAgICAgICB7DQo+Pj4+Pj4gKyAgICAgICAgICAgIHJjdV91bmxv
Y2tfZG9tYWluKGQpOw0KPj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+
Pj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiAgICAgICAgICByZXQgPSBwaHlzZGV2
X21hcF9waXJxKGQsIG1hcC50eXBlLCAmbWFwLmluZGV4LCAmbWFwLnBpcnEsICZtc2kpOw0KPj4+
Pj4+ICANCj4+Pj4+PiAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihkKTsNCj4+Pj4+PiBAQCAt
MzQ2LDYgKzM1MywxMyBAQCByZXRfdCBkb19waHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVTVF9I
QU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPj4+Pj4+ICAgICAgICAgIGlmICggIWQgKQ0KPj4+Pj4+
ICAgICAgICAgICAgICBicmVhazsNCj4+Pj4+PiAgDQo+Pj4+Pj4gKyAgICAgICAgLyogUHJldmVu
dCB1bm1hcHBpbmcgd2hlbiB0aGUgc3ViamVjdCBkb21haW4gaGFzIG5vIFg4Nl9FTVVfVVNFX1BJ
UlEgKi8NCj4+Pj4+PiArICAgICAgICBpZiAoIGlzX2h2bV9kb21haW4oZCkgJiYgIWhhc19waXJx
KGQpICkNCj4+Pj4+PiArICAgICAgICB7DQo+Pj4+Pj4gKyAgICAgICAgICAgIHJjdV91bmxvY2tf
ZG9tYWluKGQpOw0KPj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+Pj4+
Pj4gKyAgICAgICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiAgICAgICAgICByZXQgPSBwaHlzZGV2X3Vu
bWFwX3BpcnEoZCwgdW5tYXAucGlycSk7DQo+Pj4+Pj4gIA0KPj4+Pj4+ICAgICAgICAgIHJjdV91
bmxvY2tfZG9tYWluKGQpOw0KPj4+Pj4NCj4+Pj4+IElmIHlvdSBkaWQgZ28gbG9vaywgeW91IHdp
bGwgaGF2ZSBub3RpY2VkIHRoYXQgd2UgdXNlICJyZXR1cm4iIGluIHRoZSBtaWRkbGUNCj4+Pj4+
IG9mIHRoaXMgZnVuY3Rpb24gb25seSB2ZXJ5IHNwYXJpbmdseSAod2hlbiBhbHRlcm5hdGl2ZXMg
d291bGQgcmVzdWx0IGluIG1vcmUNCj4+Pj4+IGNvbXBsaWNhdGVkIGNvZGUgZWxzZXdoZXJlKS4g
SSB0aGluayB5b3Ugd2FudCB0byBhdm9pZCAicmV0dXJuIiBoZXJlLCB0b28sDQo+Pj4+PiBhbmQg
cHJvYmFibHkgZ28gZXZlbiBmdXJ0aGVyIGFuZCBhdm9pZCB0aGUgZXh0cmEgcmN1X3VubG9ja19k
b21haW4oKSBhcyB3ZWxsLg0KPj4+Pj4gVGhhdCdzIGVhc2lseSBwb3NzaWJsZSB0byBhcnJhbmdl
IGZvciAodGFraW5nIHRoZSBsYXR0ZXIgY2FzZSBhcyBleGFtcGxlKToNCj4+Pj4+DQo+Pj4+PiAg
ICAgICAgIC8qIFByZXZlbnQgdW5tYXBwaW5nIHdoZW4gdGhlIHN1YmplY3QgZG9tYWluIGhhcyBu
byBYODZfRU1VX1VTRV9QSVJRICovDQo+Pj4+PiAgICAgICAgIGlmICggIWlzX2h2bV9kb21haW4o
ZCkgfHwgaGFzX3BpcnEoZCkgKQ0KPj4+Pj4gICAgICAgICAgICAgcmV0ID0gcGh5c2Rldl91bm1h
cF9waXJxKGQsIHVubWFwLnBpcnEpOw0KPj4+Pj4gICAgICAgICBlbHNlDQo+Pj4+PiAgICAgICAg
ICAgICByZXQgPSAtRU9QTk9UU1VQUDsNCj4+Pj4+DQo+Pj4+PiAgICAgICAgIHJjdV91bmxvY2tf
ZG9tYWluKGQpOw0KPj4+Pj4NCj4+Pj4+IFBlcnNvbmFsbHkgSSB3b3VsZCBldmVuIHVzZSBhIGNv
bmRpdGlvbmFsIG9wZXJhdG9yIGhlcmUsIGJ1dCBJIGJlbGlldmUNCj4+Pj4+IG90aGVycyBtaWdo
dCBkaXNsaWtlIGl0cyB1c2UgaW4gc2l0dWF0aW9ucyBsaWtlIHRoaXMgb25lLg0KPj4+Pj4NCj4+
Pj4+IFRoZSByZS1hcnJhbmdlbWVudCBtYWtlIGEgbGl0dGxlIG1vcmUgbm90aWNlYWJsZSB0aG91
Z2ggdGhhdCB0aGUgY29tbWVudA0KPj4+Pj4gaXNuJ3QgcXVpdGUgcmlnaHQgZWl0aGVyOiBQViBk
b21haW5zIG5lY2Vzc2FyaWx5IGhhdmUgbm8NCj4+Pj4+IFg4Nl9FTVVfVVNFX1BJUlEuIE1heWJl
ICIuLi4gaGFzIG5vIG5vdGlvbiBvZiBwSVJRIj8NCj4+Pj4NCj4+Pj4gT3IganVzdCBsaWtlIGJl
bG93Pw0KPj4+Pg0KPj4+PiAgICAgICAgIC8qDQo+Pj4+ICAgICAgICAgICogUHJldmVudCB1bm1h
cHBpbmcgd2hlbiB0aGUgc3ViamVjdCBodm0gZG9tYWluIGhhcyBubw0KPj4+PiAgICAgICAgICAq
IFg4Nl9FTVVfVVNFX1BJUlENCj4+Pj4gICAgICAgICAgKi8NCj4+Pj4gICAgICAgICBpZiAoIGlz
X2h2bV9kb21haW4oZCkgJiYgIWhhc19waXJxKGQpICkNCj4+Pj4gICAgICAgICAgICAgcmV0ID0g
LUVPUE5PVFNVUFA7DQo+Pj4+ICAgICAgICAgZWxzZQ0KPj4+PiAgICAgICAgICAgICByZXQgPSBw
aHlzZGV2X3VubWFwX3BpcnEoZCwgdW5tYXAucGlycSk7DQo+Pj4NCj4+PiBObyBvYmplY3Rpb24g
dG8gdGhlIHNsaWdodGx5IGNoYW5nZWQgY29tbWVudC4gVGhlIGNvZGUgYWx0ZXJuYXRpdmUgeW91
DQo+Pj4gcHJlc2VudCBpcyBvZiBjb3Vyc2UgZnVuY3Rpb25hbGx5IGlkZW50aWNhbCwgeWV0IHBl
cnNvbmFsbHkgSSBwcmVmZXIgdG8NCj4+PiBoYXZlIHRoZSAiZ29vZCIgY2FzZSBvbiB0aGUgImlm
IiBicmFuY2ggYW5kIHRoZSAiYmFkIiBvbmUgZm9sbG93aW5nDQo+Pj4gImVsc2UiLiBJIHdvdWxk
bid0IGluc2lzdCwgdGhvdWdoLg0KPj4gT0ssIHdpbGwgY2hhbmdlICJnb29kIiBjYXNlIG9uIHRo
ZSAiaWYiIGJyYW5jaC4NCj4+IERvIEkgbmVlZCB0byBjaGFuZ2UgIiFpc19odm1fZG9tYWluKGQp
IiB0byAiaXNfcHZfZG9tYWluKGQpIiA/DQo+PiBBbmQgdGhlbiBoYXZlOg0KPj4NCj4+ICAgICAg
ICAgLyogT25seSB1bm1hcHBpbmcgd2hlbiB0aGUgc3ViamVjdCBkb21haW4gaGFzIGEgbm90aW9u
IG9mIFBJUlEgKi8NCj4+ICAgICAgICAgaWYgKCBpc19wdl9kb21haW4oZCkgfHwgaGFzX3BpcnEo
ZCkgKQ0KPj4gICAgICAgICAgICAgcmV0ID0gcGh5c2Rldl91bm1hcF9waXJxKGQsIHVubWFwLnBp
cnEpOw0KPj4gICAgICAgICBlbHNlDQo+PiAgICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsN
Cj4gDQo+IEkgZm9yIG9uZSB3b3VsZCBwcmVmZXIgaWYgeW91IGtlcHQgdXNpbmcgaXNfaHZtX2Rv
bWFpbigpLCBmb3IgYmVpbmcgbW9yZQ0KPiBwcmVjaXNlIGluIHRoaXMgc2l0dWF0aW9uLg0KT0ss
IHRoYW5rcy4gV2lsbCBjaGFuZ2UgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiBKYW4NCg0KLS0g
DQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

