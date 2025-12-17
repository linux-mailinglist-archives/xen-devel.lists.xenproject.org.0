Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B68FCC6758
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 08:59:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188605.1509741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVmR5-0005Rc-QV; Wed, 17 Dec 2025 07:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188605.1509741; Wed, 17 Dec 2025 07:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVmR5-0005PP-Me; Wed, 17 Dec 2025 07:59:03 +0000
Received: by outflank-mailman (input) for mailman id 1188605;
 Wed, 17 Dec 2025 07:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YwQE=6X=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vVmR3-0005PJ-Er
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 07:59:01 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f1bbc75-db1e-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 08:59:00 +0100 (CET)
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by PAWPR03MB8961.eurprd03.prod.outlook.com
 (2603:10a6:102:332::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 07:58:57 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 07:58:57 +0000
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
X-Inumbo-ID: 3f1bbc75-db1e-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSegkBbDeBjRXbSx1uYSK5MxqAAgWTZSLqcup6wv13KlRaJR0avPf3oPgsSDTnCZ/7kEavr6Q7T+ZwphPJp6QFWXH/hrI49zp3LexryCcfqXfDBCPXYERScVaWnRG0pnfa0qP52aq3N2wE8/QEQmgRW3+bC/6/CmcWf+/gcn/F05h5Vpjy3pDbjju6z9/bzBYp8igzYj55DWYBXpmcCHtjxABDIysatSso3T835PaAcSnofgcJj/sBoT6cJxQXiWI5W5XrPrKaBDFTjzWT3kl+9+ohnQixWlIyoQbyEzbgK8nSMFaN0aGXcp2rwE/pbwRyOrRknUbXq6IneypEQedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nX4L2P3jIUXxSRfdYJdUZJvzjzci3G1HfuFHUZitt84=;
 b=GvocWx5d8w2LQFakhsmn6QjA7sKOIuT+ewZ+01aGCAIHcibG56BmbLUusMkL5ilxkxdcNUHEGoy2peJhHovDYNTEHOBmTZhokg80yzlyRCA5uS++N9k9z22jJjAMkGjYSmrHll7V/7xPP4NalekHFJsB+e8EdgcXCR4TixBADhh6AgZFqAhIyt8sN3BXiFNVzGpsXxlWKVu9qql/r+Tunzec6aRO2MbuZw/fPXwsgjQE6CmNAGS2S5am3KNm969NlU8ed71t7aiS6K8KxyBD7Ihxpdf2LASpUjSxT1wfeK0tNjrcfI1j1Byu2OJ1HRdwaFCAqjwxy2kMDLa17Y8lpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX4L2P3jIUXxSRfdYJdUZJvzjzci3G1HfuFHUZitt84=;
 b=IcZL29mLtg4flV42AA8mlRXGJzcVpNzHC5LFcMbBu3qJxskvI4jNp9oUuKSuzZBi/abZr2xZLH6luaKdbG4izizYol7zGLnRJC4XMo+RnSL5RKdlZ7ija/2PXSTY8vGZG05S+Xm9r48GrRe6NfLajax15EaO0xrxRbkLOJdMP3YOHUNZGGLyf3HM4+pBjVHP+sbveJ9PZ9JeLIzHQ2LQ7OpAngZymNTPWk4bOlfHL2c8rogsaElIgw35sG7jh1ycz8IbMoCNj+gSQgjym65QsF21u7DUCLRezQf56Ct6fMeG0YLdF6Ek1yBBMiWCpQIZOnmhrfRvcgyNWWDwySB8EQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Harry Ramsey <harry.ramsey@arm.com>
CC: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Topic: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Index:
 AQHcZIbKZWHMCLfhnk2g+3dibmJCCbUQaX2AgAAU4YCAAKzmgIAAUfkAgBLzMQCAARx8AA==
Date: Wed, 17 Dec 2025 07:58:57 +0000
Message-ID: <9c6cbf93-ea6f-4fff-8ad4-295d0bfe488c@epam.com>
References: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
 <6e83d3bc-c49c-49f4-9dbd-e994e53a62a7@xen.org>
 <44f6cb05-33c3-4937-b508-7616c36d0e4d@epam.com>
 <9FB64A3E-D05F-49B0-B979-25894D25BBD9@arm.com>
 <fc04150e-7f5e-480f-a31b-0eeaee1247b6@epam.com>
 <4954f4f7-d256-4cad-914e-c828c717a9b4@arm.com>
In-Reply-To: <4954f4f7-d256-4cad-914e-c828c717a9b4@arm.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|PAWPR03MB8961:EE_
x-ms-office365-filtering-correlation-id: edacb3b7-63a1-4de7-7a98-08de3d42219a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|366016|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?U0NoTzN4UHp4MWRpRDZRYTZuQjdyZzJXTEtoVkVFYWVMZjlEVHM2d2dPajFZ?=
 =?utf-8?B?enNueWtsU2duZk4xWGl6SXZ1aURMQlhrNjBrM0JZYjFPUGpjcVBlTWE5bHRK?=
 =?utf-8?B?SnA0NjlPS0xYS0s5WGVXY1hQajJGeFNkcGI2TUZIb1hWd24wL1VsZTRhdzl5?=
 =?utf-8?B?dXZyZHl0UDJWR0VwYVpob0JSdVpaYTQxQUVnODBxQVJRZ3ZMeFN4S3BPcUVm?=
 =?utf-8?B?WVBRa2I3bEtwVVBlRkhhcU5lUHpGbVlHWFdma0dEY0pnbUkyRFdNeVliVGZ0?=
 =?utf-8?B?MXdFejBKZkM0ZE9pdndOMmlZWXVYeHJzTUdFTms3dkZTU3FKN0owU3Jac2Ns?=
 =?utf-8?B?NEhNK2VNMVRxcUhzeVVWdm9mbHdPcVNoUk9vRVd2b0ZmV0owV2g0d0tFSTZK?=
 =?utf-8?B?T1gzemc3ejBwa29idjMvYjNuNmVia1JGbFNTcS94ZzFQL0hubFhCMk5CRWov?=
 =?utf-8?B?RWZ1cWUydVlHVmFoT3lQRGFtVGhIVTF6RjFDeXI4b3lHZW5IbHpwQTJBWGxi?=
 =?utf-8?B?ZUFWMkN3VXc0czBqVGVmQTVkaVRGTllPZ3RydnRJTW43WktqUGFzVlpSNzdI?=
 =?utf-8?B?UUN0V3FEcmhFWXVwaHdhN1NZZWlpMzBNVWVWbk1wcTlzSWhsbDkvbXZQUXNI?=
 =?utf-8?B?c0lNL1VCMStyODE4Z1BEVUF0K2tNVmYzb0ljWVZsdjlvZ0xucDA1WlZoZllt?=
 =?utf-8?B?ai82d0FMWG8wdzNCS0JXVW9sQkRNR2k3c09lL0FsREtyNlk5dFhUTFJzMnRl?=
 =?utf-8?B?bXA5SmE4b3lVcGhkbFZhUFJ1MStjTDVvaHVxZk1XR3Y3czBjbkJjMEdZRmow?=
 =?utf-8?B?MUE4dHF2L2puWHNpQlBlRnBCYkxnRC9zdy9YWkE5NVRJdHQvdk13d21mbytO?=
 =?utf-8?B?ajN0eTRjVU9zQ05QL2ZjT0tXek9rOGtvT250SG80QVhVVUcySFgyUGRpYlhZ?=
 =?utf-8?B?ZDVTOVZsUHN5NmRjVldSVzkvTjFEc0ZYamVxRk5TYWl1MjBrSm9pVy9SN0FK?=
 =?utf-8?B?SnphbTBzZWVWZmpoaWNvODF4T24wYWpaUzQ0RjExYTJFZVVVeVdTbDlKeG9a?=
 =?utf-8?B?VUFiYm5vVDhhTVVsTkZVdFZIQ2pEVXV2ZUtva290ai9QUXgxSlkyRG96bHRn?=
 =?utf-8?B?TXRScGk4YU5SQms0Z2k1OFI4M0xmSFBXb0hwVmcvSjBZMFAzMWhTUHh3d0ha?=
 =?utf-8?B?dTdUclY5eTNjNW1ZbjlPa2puZHJDb3ZubjlJY1ZSUUJmMjYrT3RBdmc4MnlR?=
 =?utf-8?B?YU9YWHFtcHpNY3dkdUF0UGpxQk5naVFRbHp4Q1VQY0x5ZXJVbXVTT1cvQ3FI?=
 =?utf-8?B?bmJMZGhzdS8rQ0JJSDFGcGdKYkhDUjh3bGJiZkhJM2o3TUJwZndCM1RkYTJp?=
 =?utf-8?B?TGJZckI3NXBmVzBuTWgvcDlvTEJIVmZ6OXM0ejBYa2I1blhCaDlISG5yWW92?=
 =?utf-8?B?WFFJMzRjSUJ6MFNULzcraU56b1JvK2xMYTZVazIxaCs0UTMvSUxPRFBwVGha?=
 =?utf-8?B?bnUrOTlKdytrZTUvWGh4UG9KOXNOMDhVbXgvaGc4RkZ3T1VJU09yZjVMWlg3?=
 =?utf-8?B?amFmT1Y0ZlJZRjRCaC9ybWtrM0lnWFBvOHorbVRSZU9UbDJHS1FVbWxZcERW?=
 =?utf-8?B?YmZwNUREOWlyS1MwVjE1UDNTSmwyNjRCUlI2YmM4ZFl1UW5xUkQ0RCtXQmxl?=
 =?utf-8?B?RTBEVjVwSFRMajcrU1VtM3JKU0U0S0MvbTBwSUJJS2JaMWtDdUp6ZHdyeGd3?=
 =?utf-8?B?TkNmeVNKL0dGNUM5U2Q2SFN0cDY1MTh5dlVwVVNqa3MxMFhKMXVYNmVQQ09L?=
 =?utf-8?B?ZGdMMXl4amFNZTVFeGFpWVRnYURBRmMxMTZjLzh1MGc3cVUva2xUUERqYy90?=
 =?utf-8?B?SjloakN3R2U0Z3FnUFV1a3JrUzUwTGJxZllCTkVVdHRtVUFZckQyRzRGOUk4?=
 =?utf-8?B?R3dvaXJCS2tkVzdUWkZEa2R4ano0SlJVdWJZT2tzdWdhY1hIQ3B3VExwYjU4?=
 =?utf-8?B?SDJJQ1QzcUY3dmZnUThxaFRoTDVwYVNFc1F4SUtUcFBQNmhTVG1qOHNOZW1J?=
 =?utf-8?Q?YsyDGQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXEvS0JacUJKbW1ObUtHMnNraDk1NXNjY0ZyTEs5ZHFVaHUvQWVrSExwNUlS?=
 =?utf-8?B?dExJMWxiU09EUml5OHRQWUV5VVU2VVVoWitiaFdZOGhnRkVSNVhtbW0vZDQr?=
 =?utf-8?B?VGJycFhWaDg2S0lVOS8wK1JVZ3Mvb0FGWEtyeXpyOEZIeWxzdXZIb1JqcUVE?=
 =?utf-8?B?Ui9oUkFGMERhTHYvWTUraUdEdk1VVW9TZnhldjJKQnlBdHVsNDBTcENnK0Y1?=
 =?utf-8?B?SlB2VDhMbkREL2E1REpQazY1d3ZCVUQxOUl6QUdPMTc2d3JUOHBSQkpaeUp6?=
 =?utf-8?B?SlR2aTJOcm9BaGcwM3cxOTc1NG9PcVNlRTdVbHlOQnQ5VG9RRGdZb21UZjlG?=
 =?utf-8?B?aXVkejhGMFNVd2RtTmdlT1J0RmN0WUdwZzQzUFJHTGlvMEFxYllINVRsNGxo?=
 =?utf-8?B?SVQ5RFRLOSs3RXJLYmVINlJKSEdzZy80K0x3TnI1d3pZazF6YzVtTlNyZzJp?=
 =?utf-8?B?ZGVhQ2lsMi9KbWNVT3RwQWhZZnBKZStuNENmay9qOXBxYVFxcm5jdFpib0k1?=
 =?utf-8?B?czFhZXFiS3lqWUdBZGxmTDVGdk9oQk8reHRWdXRseDVrb1dEQlRKbXBBeVRL?=
 =?utf-8?B?YTVpVU82OG94Vk9iNU9mRVhxV3AvNnIxVmlZTExacUFuRzFHaVlWUEpvTHo2?=
 =?utf-8?B?SmFZVG9xc3ZPbGZWNTU1NFYrcUZXNXdWemxLL3ZjZGgxYW9pbkQ4S2lvdlZp?=
 =?utf-8?B?bzFyeS9KY0g1YjI1Qmx4blVQK0Z6bGYxcWkrdE5Md0lIQkhnWGc0QWtNdWx6?=
 =?utf-8?B?QnpGdDhnVzBIUFFJTk5UcDJQZEk4cnJ5TmtqVXA2RGdEQTdzZHBMTWFMTFh2?=
 =?utf-8?B?WXhjYTZhRlVGTDlnYUtYWmsxeVpZVkVtaWtVT1B1dHZPOXlMbmJSMkNyQU1J?=
 =?utf-8?B?S0ZTR0o1NG9Hc1RTT0NBQ3ppUzdSNXJsVWhVQzNkVGZJWTVkY053KzFWR2xi?=
 =?utf-8?B?UWROdlQyTnZhZ21tc1pucFc1bjIveGhTL1QzY0ZPNG9GY1djak84QXFTZk96?=
 =?utf-8?B?MWNiRjd0aUVobUtxR1pUREVOeDY2K1VzQUkvTGR3UkxDcGg0dWkxdHA0Tmps?=
 =?utf-8?B?YXNzeG9PcHo1YnM2UmsyZVhrNXdmallYaVV5UktWL0ZVS0JXU3k0NThJVUNv?=
 =?utf-8?B?cUp5YTBSVEY5SlQ4SXArclk5WTlkc1VvWVJpMlZtdTBWVlZkbVhMa1Q2eDRu?=
 =?utf-8?B?ekhwdklqS0JJamJqUHFjUGhsK29mYVBZNFJKK0trcjczeGtMaFZkTVEyUVRZ?=
 =?utf-8?B?ZUVlUVNpQ1FJcjNJL3ZiblI5aEM1cm0ya0lGV3FoTUhsR2xKVEVzMDcyc1JS?=
 =?utf-8?B?Q2QvYjQxTGQzMGdSM3o1QnhiOTdzVktaRjk0dEJteHBVTmFzdGlKR3AzU0Y4?=
 =?utf-8?B?WEZBdXVtbmgyVjJ0Vk9BanJtRUt0TTM2Uk1oTFJmcm4yOTVPbnZkSzI1M3Zl?=
 =?utf-8?B?YWpRdW1hQ1pERWtCcXp3ckpQSXYrdm1xYjl3TjVMVjRrRTgvMFlJNU81WEV1?=
 =?utf-8?B?aWxBVDJkK3hDOGhFdXNVTmJndTBwV09hRnZWRVVlbXl0dE9wQStKdFN6M1NN?=
 =?utf-8?B?cVlSQTlyZUFGamE2S2tEUnczczk2VFhPNzJGU3BaTVc1YlhrQ0FWUkorczBD?=
 =?utf-8?B?cXZlUGIwSTNndmN2d1F5N2VHcnJiZXhYV2N1ZFdERjExZEVwaHZrSmNjeXVE?=
 =?utf-8?B?MlNRa2hMWDNJZ2R0bDBvM1orSTVTa3d5MW0rVGQ1bkJqcmppSDFhZjR2MkJ2?=
 =?utf-8?B?NncwOHJLbjR3VW5aRzhPWmIwVGl5UTB3YjIwdjBhZnFXUXdIVUcvWUcrZ21V?=
 =?utf-8?B?eHgvRS9LanJEY1M2QlhuRXkyNWZ3WGxuWnlTa0I5MXcvTEZaSlVoYURITG1h?=
 =?utf-8?B?YXNUUStsR0NEeCtqL0JUOVZONkpTeGtDVDN4eUppa0lGUyt6c2ttMVpTdFdR?=
 =?utf-8?B?RVdyYkVzejFwYldjQkdjS1dCb29nUXNPQnMzTkM1V2dxWDBoQmhwK3A4VWo2?=
 =?utf-8?B?aGlvajBtQ1pHYWdFTHBKVU9UaVVwbGpYSzhoRG5sWE1KcHUzOUdXekEvdnJV?=
 =?utf-8?B?UzhoRm5GN3BrWldtMjVXYjRLVlZibTFaNWx5Q1V6aWFnRjVUd0U0dFlORWhO?=
 =?utf-8?B?WnpmenhkK3B6c2d0Q3UxdGloMnlMNGR4TjdRV253UkMxNVhJMDk3ZnlhdHVP?=
 =?utf-8?Q?krE0ozYg3ape/aaOTHZyxsg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8ED939823DEEAE4F970A643668BE1A44@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edacb3b7-63a1-4de7-7a98-08de3d42219a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 07:58:57.4025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JG9s8PUGX1hNhS+OKGGcPVNo4oyAQhrt6ZX1+DejiUq9HwsfK7z0pXzsBrnt19+j1lRRgUUiu18e2RCG5D4hNm7HnEOsnVgfJqo4Xcx0Oss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB8961

DQoNCk9uIDE2LjEyLjI1IDE3OjAwLCBIYXJyeSBSYW1zZXkgd3JvdGU6DQoNCkhlbGxvIEhhcnJ5
DQoNCj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBoYXJyeS5yYW1zZXlAYXJtLmNv
bS4gTGVhcm4gd2h5IHRoaXMgaXMgDQo+IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFy
bkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gT24gMDQvMTIvMjAyNSAxMzozNywg
T2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+PiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciBv
ZmZlcmluZyB0byB0ZXN0IHRoaXMgb24gQXJtMzIgcGxhdGZvcm1zLg0KPj4NCj4+IFRoZSBwcmlt
YXJ5IGdvYWwgb2YgdGhlIHRlc3QgaXMgdG8gY29uZmlybSB0aGF0IHRoZSBuZXcsIGNhbGN1bGF0
ZWQgRFRCDQo+PiBidWZmZXIgc2l6ZSBvZiAzMDcyIGJ5dGVzIGlzIHN1ZmZpY2llbnQgZm9yIGEg
d29yc3QtY2FzZSBBcm0zMiBkb20wbGVzcw0KPj4gZ3Vlc3QuIFRoZSBleHBlY3RlZCByZXN1bHQg
aXMgdGhhdCBYZW4gYm9vdHMgc3VjY2Vzc2Z1bGx5LCBhbmQgdGhlDQo+PiByZWd1bGFyIGRvbTBs
ZXNzIGd1ZXN0IGlzIGNyZWF0ZWQgd2l0aG91dCBhbnkgcGFuaWNzLg0KPj4NCj4+IFRoZSBpZGVh
bCB0ZXN0IGNvbmZpZ3VyYXRpb24gd291bGQgYmUgYSBkb20wbGVzcyBndWVzdCB3aXRoIHRoZQ0K
Pj4gZm9sbG93aW5nIGNvbmZpZ3VyYXRpb246DQo+PiAtIFRoZSB2Q1BVIGNvdW50IHNldCB0byB0
aGUgbWF4aW11bSBmb3IgQXJtMzIsIHdoaWNoIGlzIDgsIHRoZSB2Q1BVDQo+PiBub2RlcyBzaG91
bGQgaWRlYWxseSBjb250YWluICJjbG9jay1mcmVxdWVuY3kiIHByb3BlcnR5Lg0KPj4gLSBBbnkg
b3RoZXIgZmVhdHVyZXMgdGhhdCBhZGQgbm9kZXMgdG8gdGhlIGd1ZXN0IGRldmljZSB0cmVlIGVu
YWJsZWQNCj4+IChlLmcuLCBoeXBlcnZpc29yLCByZXNlcnZlZC1tZW1vcnksIHBsMDExIG5vZGVz
IGFyZSBwcmVzZW50LCBldGMpLCB0bw0KPj4gY3JlYXRlIHRoZSBsYXJnZXN0IHBvc3NpYmxlICJi
YXNlIiBGRFQgc2l6ZS4NCj4+DQo+PiBUaGUgdGVzdCB3b3VsZCBpbnZvbHZlIGFwcGx5aW5nIHRo
ZSBjdXJyZW50IHBhdGNoLCBhbmQgdGhlIGRpZmYgYmVsb3c6DQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYw0KPj4gYi94ZW4vY29tbW9u
L2RldmljZS10cmVlL2RvbTBsZXNzLWJ1aWxkLmMNCj4+IGluZGV4IDM4YTU4MzA4MTMuLmU5NWY0
MmQxZTEgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vY29tbW9uL2RldmljZS10cmVlL2RvbTBsZXNzLWJ1
aWxkLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYw0K
Pj4gQEAgLTU3Nyw2ICs1NzcsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBwcmVwYXJlX2R0Yl9kb21V
KHN0cnVjdCBkb21haW4gKmQsDQo+PiBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQ0KPj4gwqDC
oMKgwqDCoMKgIGlmICggcmV0IDwgMCApDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVy
cjsNCj4+DQo+PiArwqDCoMKgIHByaW50aygiRmluYWwgY29tcGFjdGVkIEZEVCBzaXplIGlzOiAl
ZCBieXRlc1xuIiwNCj4+IGZkdF90b3RhbHNpemUoa2luZm8tPmZkdCkpOw0KPj4gK8KgwqDCoCBw
cmludGsoIlByZWRlZmluZWQgRkRUIHNpemUgaXM6ICVkIGJ5dGVzXG4iLCBET01VX0RUQl9TSVpF
KTsNCj4+ICsNCj4+IMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+DQo+PiDCoMKgwqDCoCBlcnI6
DQo+Pg0KPj4NCj4+IFBsZWFzZSBsZXQgbWUga25vdyB3aGF0IHlvdSBnZXQuIFRoYW5rcyBhZ2Fp
bi4NCj4gDQo+IEkgaGF2ZSB0ZXN0ZWQgdGhpcyBhbmQgY2FuIGNvbmZpcm0gaXQgYm9vdHMgaW50
byBMaW51eCB3aXRoIGFuIDgtY29yZQ0KPiBzZXR1cC4gSGVyZSBhcmUgdGhlIHZhbHVlcyBJIGdv
dDoNCj4gKFhFTikgRmluYWwgY29tcGFjdGVkIEZEVCBzaXplIGlzOiAxMTI3IGJ5dGVzDQo+IChY
RU4pIFByZWRlZmluZWQgRkRUIHNpemUgaXM6IDMwNzIgYnl0ZXMNCj4gDQo+IFRlc3RlZC1ieTog
SGFycnkgUmFtc2V5IDxoYXJyeS5yYW1zZXlAYXJtLmNvbT4NCg0KVGhhbmsgeW91IHZlcnkgbXVj
aCBmb3IgdGVzdGluZyBvbiB0aGUgQXJtMzIgcGxhdGZvcm0gYW5kIGNvbmZpcm1pbmcgDQp0aGF0
IHRoZSBwcm9wb3NlZCBzaXplIGlzIHN1ZmZpY2llbnQhDQoNCg0KPiANCj4gVGhhbmtzLA0KPiBI
YXJyeSBSYW1zZXkNCg==

