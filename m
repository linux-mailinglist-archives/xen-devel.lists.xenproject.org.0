Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F420EB2D7DC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 11:19:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087262.1445357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoeyE-0001aP-RC; Wed, 20 Aug 2025 09:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087262.1445357; Wed, 20 Aug 2025 09:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoeyE-0001Z0-NA; Wed, 20 Aug 2025 09:19:02 +0000
Received: by outflank-mailman (input) for mailman id 1087262;
 Wed, 20 Aug 2025 09:19:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiHc=3A=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uoeyD-0001Yu-Rj
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 09:19:02 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4a9210c-7da6-11f0-a32a-13f23c93f187;
 Wed, 20 Aug 2025 11:19:01 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU5PR03MB10357.eurprd03.prod.outlook.com (2603:10a6:10:51c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 09:18:57 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 09:18:57 +0000
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
X-Inumbo-ID: b4a9210c-7da6-11f0-a32a-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHr9UoR0WdADrh2AM7GcaMNzPIcDrTR61+8JFQwQwArYz4IqfBqNQdljQ0g0kw3F/Xq1mKlN6ZHJ91mAurNtfTWjXFjS7YelQP2QlypTJS/2b8UVezwXG2ABj5vXpXHmhIOThe4N3DDOJJ3Yqm9XKpEw44iIJs7KOR9m2KaQewWdGqkfNwn0Xjt5mWHMqDRS6Tt7FwJv2+lhQcJpNjR5F27cg//kijx/z4GJ29fOUZQ/uCTO0Zj9Aky/QAm9C0U6AoSXCq8iJp3RCkoXWSpMS64Ik30b8u1IEcU7zaTjgQC5W6jPuHikhmE8KaC6ztpw6QxvjHnTV7RSiHmsoWhxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhOfy3Bf/EPcbOOpnsP3Jwqw690bdytu7K8Ke8O78KE=;
 b=SdRUBFLOKeCSm4OiiPLYrZ/r51Uj4/oi3GD7LYcYFxehBuu2V9r0c2mamwPPM+acXuouXgx+l2EEspxEvlgkEgJAnPWpwEE66aPxOI59ULuB7IPUGdjnbS8Ed1bXP/gKTTylbnVs6YqZvUVf4r87j8emQ8Lxrf5DCmdoJSPNuni1pfu8ht5OOdWU9JExgCf1KnvBeCof/nmVz9vWFeAud+rK/8fgQgP+QqfNPxx0ofOeVSXEawjSCymGiSTslfu4hypt5QtGrOHxuVDn74Dg6VcLgbVOj78jTSwXbwy6ukbUZhgzi0geXaOnFazNgf5IINwPHkYH3sUFnUzLg28bsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhOfy3Bf/EPcbOOpnsP3Jwqw690bdytu7K8Ke8O78KE=;
 b=vrfMY9dwsGqzZKPWuv3x8ebBzsjuXuyG6n7ALBNfQqkV0X3aCT/0la78psN1p/lR3DE/+sQiMKWR+3yKGQt9cK4RTyBK+3qzCkOabBeyTshu0sqplt5lJtDoIpcY4D8ifRksXR5zu+ZHoi90zRgGgDRjhjvE4wP+IQ11mzOiYgXWsCsT0f45iiqQBJVjB1PIq6KdUkQF4B3TesYJGg4/ov5fwSjIiNlh5z2ui+NFm+nKYFUsVdSP5Te/oq6gTC/u5vC+7Fch08S7fmgBiOEdUCy2j7Ma6+NYA8zn9h3eD9yBKoFo0AoKN/rd91YCE7jVyDPJnVTdiytE+HzyF+XU/w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: address MISRA C Rule 18.3 compliance
Thread-Topic: [PATCH] misra: address MISRA C Rule 18.3 compliance
Thread-Index: AQHb+7pQeGfsWWy0sUade1ju+9GDKrQ/vEEAgAOkMwCABlLfAIAhvCAA
Date: Wed, 20 Aug 2025 09:18:57 +0000
Message-ID: <e7b30994-3c36-44f8-9d14-4a4a5c0df7f8@epam.com>
References:
 <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com>
 <6c7341a2-fd49-40de-8ad3-e7980d4e9e42@suse.com>
 <36042f23-7795-4717-be4a-cd22e52b3145@epam.com>
 <alpine.DEB.2.22.394.2507291507580.468590@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2507291507580.468590@ubuntu-linux-20-04-desktop>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU5PR03MB10357:EE_
x-ms-office365-filtering-correlation-id: 37a7e4e6-0feb-4afe-5669-08dddfca974f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|42112799006|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VFVHSGJzSStyb2ZFbmE0SUxDUDNWK2VtMnJrMy9jbE5qTjBoWi91N0V1ZGRC?=
 =?utf-8?B?R29HRHdNVTlhUko4UGtUdEltajFmVTN6TjBia1NUdmVLTG9obUY4K2s2ZW9T?=
 =?utf-8?B?N1ZpUitMakt3WWViZzFsZ0JlOHJ0dzJocUlZSXpxbkZmSUlaajJDeDNWcnU5?=
 =?utf-8?B?eGNSZ3lZUVJjUDdIZTFidUorbml5UGtpcUs1SnJSc0RmYWNXbWU2TDRDRkpJ?=
 =?utf-8?B?RHdUeDcwbkQ4N3JzMkVISkhqNGpKTnRmZUUzQXFyVnR6KzRhd3ZIZ1o5MU80?=
 =?utf-8?B?N0Nqa3FZeVI2ZlpQd0hGRDRQNFMvcFBZTG5lS3FGa3lCVmpkRlhaRDJ1aENx?=
 =?utf-8?B?WHU5ZWIrcUhnbVZmZ1VkMjZodm5hdlpuTFRuS2ZjRHZQaDJFSlZNVWdBWHBv?=
 =?utf-8?B?ekgwL21UZTQvRkN3OUVNdFRGc3V6ZjhtaWEyeHdOWWx6SndScTExT1VwazNU?=
 =?utf-8?B?azJnY3dvSW5RaXZlVklqYmRpajRsZXJTOS9FTitrVVJhZ2wzbWR1KzRQUnBN?=
 =?utf-8?B?N1YxaEZoUE5zVFBjcU1vS3pYNWFRcjVPOVpXQ0lDTE54MURxT0VVSFkrZmI3?=
 =?utf-8?B?WG9oTXRzNGNyc2xVcEt4MG5GOHRRZVI0MXFBN1ZueUorYlVKRHRRY2trL1Z2?=
 =?utf-8?B?SWJYZTROZ0FwR2tSalNma2Flbk1QRUIydDRQSW1JeC84WjhkdXQybjJCNk92?=
 =?utf-8?B?alVpSzNnSG1LdlI0Q2ZkYzBZbWNubmNOWVRpM3hRK3VQS0dncU5aUDAxVGhB?=
 =?utf-8?B?K1VCOEVQY1BydndZNlZKeUxlRkg3QXo0dW5Tbk02eHZHYnJBTkxkUjJCMnBQ?=
 =?utf-8?B?dHI1NWVYZUZPRHhielFuK00yVnB4d2FiZDkwbW1LcGVvQ2ZKWWlOc3BRbkRx?=
 =?utf-8?B?azlnS1p4a1krWlBXN3dPd1hLRWNqc2hSUFNUcXBDTm5sdDU5QS9vbERUcFY3?=
 =?utf-8?B?bitzTlZPNFFLZ1cwK0w4VjUxYmhhd0c3bS9XNXdLTlFNOG5BMTV4NUhRQVE2?=
 =?utf-8?B?S3dwbWJZdzhjRndtUmkxZlljKytmNGo5RWtGOXAzYlZyTk9RQUREQXFSUVIz?=
 =?utf-8?B?dWxLNSttcGhIdjdPb3FMeTY5dHBZWnRGY1FISTlOSHBGSTQzajRZaEtkdDZv?=
 =?utf-8?B?V1Y3a1VpcldEcnBybTIwL1RSczUrTlJLT3FGQlg3VmE0b3FMMExIY3pIVVph?=
 =?utf-8?B?SlJCOGFkTWRJbW9iTDRGVnZrUjUvb3J5d0NRcUJON3hGQXdJSjI3THJjcnJN?=
 =?utf-8?B?ZkFlSis3V1FQZVB0VDFRbjdQVUNiQnJzYlAvRklpVnFwSVh3M3Z4YUFZam5y?=
 =?utf-8?B?M0VKbXAxYzlkZGJuQWFPQllpYTdqRldQSDZRY09IUjB6cks2T3VvaVhPVFZ1?=
 =?utf-8?B?cDdsTjF1QVFpaFdMd2xBR0x0elBXV0g4TG5vT1RYSCtIRHVlMDFpMjkvRzMw?=
 =?utf-8?B?MnBIbVNwZ3FaTnpxckxTaU16VnJydTN0eUpnM2I2VGQ3dVNqSHdFbnU1NE5p?=
 =?utf-8?B?dVExZFBlNnV4L2RObytQVndQMkZLWUU4Sk94MHR5NC9pQ0F0bVNXRndHa1pu?=
 =?utf-8?B?QXlRWmwyNy9rYVVRMW95TGs1bUUveEVXYkt5S0I1WVdkeVh0eGFmT0pqY1k2?=
 =?utf-8?B?VHpnMXJPejlGK0IwaWxhNHBSSFFlVVVtc0QrYU9LTy90T055SFBMcWIxcWt6?=
 =?utf-8?B?bXowQ1VPenpRcWVCK2VGK2lxcXNsUkQzaVdJY2Z1VXUwZ1c1Z213TTcxdlBQ?=
 =?utf-8?B?Y3E3ZzRlZ2xhdkZCSDhMY3RNWGFzcE5sbEtRSER3bHpwTHFxQ2Y2Mm00eDJX?=
 =?utf-8?B?RDhsUWZ3MFFvM2k0YWxhUE4yR0NndHpSLzlYVWRJWCs0NDI2SmcyNmFiN0dz?=
 =?utf-8?B?YXdQcjBudlNjTkZlaHlFQjFHQ3MvUGljemxUWXpPRUtkWE9OS09UTFMxWHAx?=
 =?utf-8?B?clZOYUljQThMODhKZDZGRVV6SGV5TTZ1cUlSQnAwQm9QYVdVTURQREtYcE9I?=
 =?utf-8?B?c2JCQU1RYzZ3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWl2REoxZXRnOGF5dXhsaGNxWS9kVDB5VTJSeWJwa3BpUGxFTDRXUklHaGFP?=
 =?utf-8?B?UjlvbU81anc3S0hIVzIvVnovRlo4UjJJVmU4dU44TUN2WFpGNHo3VXI5Z2NZ?=
 =?utf-8?B?MVRyVXNIOWxXUExtajY0S1pTVVQ4bzZsdlFmVWI5SGJOR3U0WUYxQzhDMXpZ?=
 =?utf-8?B?ZEtnOG5MNVNzSS9rdngxcnloL2YzU3ExbEtpN1hqTnV2bG5ZOW5QYnlJYWRU?=
 =?utf-8?B?aWtSZituVkxqcW1VL0Jtd2RiQmRzY0tUZGR1NzhDNFFhYkRHSlhrTEU4bG9t?=
 =?utf-8?B?S2cwcGFzWEFrcDRsL1NRT1A1eHdOUGxUV0Rhak5GZVRkVzNHdlBOZm5uWS8y?=
 =?utf-8?B?MUxETmVaWG8vNGtjNWJ3S3hHYXhOWXZ0SG5xb3VaL0h0K3pXQ0pvVE5xZC9q?=
 =?utf-8?B?d3hZVEhQL2ZoMHdid1NWenEyZmovUk92RVVJYklTOHVacXF5SExnWDU3Z3lm?=
 =?utf-8?B?WGZtQVVxNTIwK042TUZzLzJCNDgzelhXaUtnRkxZRGlTTDBKb2pMb09FWmVu?=
 =?utf-8?B?aldGbllTbGdmRlcyOTg5bWhKdktRUHhZY2VVZm5WL0FyQ1A0eEFNTVhNbzN0?=
 =?utf-8?B?ZTR1d1c2R2gzbEw0RDUxaFArUTI2VmwvSE15d0YrYkxsSG95dElXQkUrVnhs?=
 =?utf-8?B?bG9YZkp4WUpNTXRJMGRmZkhNUXY2WGpFMW00a2lRQVduZFNObTRxWERpVDNC?=
 =?utf-8?B?REd0dFo2Wlo5SWNyQ1hzM2lFS1Nvb3lsVWkxYlRYQmsrenN6UFlqOFVUaWZ4?=
 =?utf-8?B?VFdzYXQzZDVvSkxvU3RPT2NQcXlmeHN6aThBb21yVUJ3TEQyU2RMUmhtUlA5?=
 =?utf-8?B?RlptRzRyc0wvb0J4UkMwZUxoWE5GNkh3aFNuNDEyTHZmbHE1ZzVGTXdFcFhC?=
 =?utf-8?B?OXBsRWg1Y09xSjNSY0JrclB0VFcrMUUyMk9MZ3NrNmViMHhCUkhjQjM5NDZE?=
 =?utf-8?B?RGdtRUFYU01hREZoajV4NHV6Q3U3QVg1SlFEaG5ORWFENUFNNXFxbkYrZ0Z1?=
 =?utf-8?B?Q3Y1dlRzTWhnWkthTmwzb2xxNjd6NHhNYjFOYVlCYlMxZkJjTTJRQTc3YTdL?=
 =?utf-8?B?U3JySGRBVm9VSXc3dWw5K2NEZ3lVL1ZFbkZWSHphNWlJekE3Ykh4UU9mb1hC?=
 =?utf-8?B?ZTgzTVNCa0Q1Z0FhS0V2TllTVTVwNzZKbnFxcWxuQ3BPUitJa1IrNEZGOUtL?=
 =?utf-8?B?eGlsZ1dobzdhcUE2eWZUNVhHQjZlSG5MTEdOZFoxNjQydk5rWndxRzdqL2hX?=
 =?utf-8?B?KytQSXNKV29CeWUwZTdCRDB1cGxKMDJvNWZ6ZkREVGt5T292OWtyQjhXZlc0?=
 =?utf-8?B?YytydVBjT05zb1JJMlpzRlh3K0hLVU5YcVIrOTBkUzh3RURpUXcvb1ZGdnpw?=
 =?utf-8?B?c3hQTFNDOFcwQXpmUFVkSW9WUmtPUmlVeWl5YXQybFFOMVN2cjNOcmloMHZP?=
 =?utf-8?B?YWc2QTVwMFhSb2ZWSWUvRjVFa3dSNzY0NzJUQkhPQXlJeFpKN2s3enY5TXow?=
 =?utf-8?B?Vi9BbXJNTGt4L0pjQ2VrY2s1Mm9rNmxmZUNCVjN2dk03TGsrZXRWa1lYWWt0?=
 =?utf-8?B?THdrOFhlakJWQ3VXbDNZemp3YXZyVUdWaFJRYUFUWGlPaU53ejVoMzAzZURq?=
 =?utf-8?B?blprTXZ0eWpUalg3RExmS2FvU3RDWXdIUmdRQVlnaHJhQnBnU1U1RUZNZzJs?=
 =?utf-8?B?Q2tpRmtsTStSYXhOZFk1eXR4RlhjSkZMMU5vQkdQTGFyRHRhemltemsxU1Q1?=
 =?utf-8?B?RmkwSk95ckltR3RhcDlJMnhqTGxHNHVzNGlVWGVIL0FnaDZJeVNFSldvcFBz?=
 =?utf-8?B?ZzN5MHlrNzk5NnVTOG9TQlhvSmxGajRxRjA5VWlmNC9WOCtPc2RKeVdqc0Ev?=
 =?utf-8?B?aWpzQ2pBdXkwVUFXMVBvVHVCN201cE94c2xGbmRYQTdpa2h4MG1yRjNGYkNU?=
 =?utf-8?B?ZlRublJJSzVvSlBoNFBwUVk2bnBnQWFLaW9GUVUxYmZ3UG5rV0Vxa2lrU0N3?=
 =?utf-8?B?QUxCS1hMSTMzdDh0SVFkdFFPQ28rSmNhS1JsZHlVVE8vd29oU3VvRW1vUmdQ?=
 =?utf-8?B?OUFjbkNZZE5pRVhhRmFpbjJyaXdrMzlHaUQremQxRTZRVkRwYURnS283Zk9O?=
 =?utf-8?B?SlpNTU9Pa3NiWWZyd1FWeDhKaVlISWt6bmlod1RkSmVrNW0xbmNwMUNOTFh1?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD10CE77DD76E2468B8D946E96A549F2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a7e4e6-0feb-4afe-5669-08dddfca974f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 09:18:57.1404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sRPylVqdqv7/zUaWQme9rEyNDtX9JxOh7Z5sMmWat7w00Qv3t5GJzuAvCZmBPf6aY/lQn4QR23Q8PZdwLKNCj+TnsCi39nj6v2XxRKda0Ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10357

DQoNCk9uIDcvMzAvMjUgMDE6MDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gRnJp
LCAyNSBKdWwgMjAyNSwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gT24gNy8yMy8yNSAx
Njo1OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjMuMDcuMjAyNSAxMjoxMiwgRG15dHJv
IFByb2tvcGNodWsxIHdyb3RlOg0KPj4+PiAtLS0gYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNp
cy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4+Pj4gKysrIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5h
bHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsDQo+Pj4+IEBAIC01NjgsNiArNTY4LDE0IEBAIEM5
OSBVbmRlZmluZWQgQmVoYXZpb3VyIDQ1OiBQb2ludGVycyB0aGF0IGRvIG5vdCBwb2ludCBpbnRv
LCBvciBqdXN0IGJleW9uZCwgdGhlDQo+Pj4+ICAgIC1jb25maWc9TUMzQTIuUjE4LjIscmVwb3J0
cys9e3NhZmUsICJhbnlfYXJlYShhbnlfbG9jKGFueV9leHAobWFjcm8oXnBhZ2VfdG9fbWZuJCkp
KSkifQ0KPj4+PiAgICAtZG9jX2VuZA0KPj4+PiAgICANCj4+Pj4gKy1kb2NfYmVnaW49IkNvbnNp
ZGVyIHJlbGF0aW9uYWwgcG9pbnRlciBjb21wYXJpc29ucyBpbiBrZXJuZWwtcmVsYXRlZCBzZWN0
aW9ucyBhcyBzYWZlIGFuZCBjb21wbGlhbnQuIg0KPj4+PiArLWNvbmZpZz1NQzNSMS5SMTguMyxy
ZXBvcnRzKz17c2FmZSwgImFueV9hcmVhKGFueV9sb2MoYW55X2V4cChtYWNybyhuYW1lKGlzX2tl
cm5lbHx8aXNfa2VybmVsX3RleHR8fGlzX2tlcm5lbF9yb2RhdGF8fGlzX2tlcm5lbF9pbml0dGV4
dCkpKSkpIn0NCj4+Pj4gKy1kb2NfZW5kDQo+Pj4+ICsNCj4+Pj4gKy1kb2NfYmVnaW49IkFsbG93
IGRldmlhdGlvbnMgZm9yIHBvaW50ZXIgY29tcGFyaXNvbnMgaW4gQlVHX09OIGFuZCBBU1NFUlQg
bWFjcm9zLCB0cmVhdGluZyB0aGVtIGFzIHNhZmUgZm9yIGRlYnVnZ2luZyBhbmQgdmFsaWRhdGlv
bi4iDQo+Pj4+ICstY29uZmlnPU1DM1IxLlIxOC4zLHJlcG9ydHMrPXtzYWZlLCAiYW55X2FyZWEo
YW55X2xvYyhhbnlfZXhwKG1hY3JvKG5hbWUoQlVHX09OfHxBU1NFUlQpKSkpKSJ9DQo+Pj4+ICst
ZG9jX2VuZA0KPj4+DQo+Pj4gTml0OiBEcm9wICJkZXZpYXRpb25zIGZvciIgZnJvbSB0aGUgdmVy
YmFsIGRlc2NyaXB0aW9uPw0KPj4gT2suDQo+Pg0KPj4+DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9lZmkvZWZpLWJvb3QuaA0KPj4+PiArKysgYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgN
Cj4+Pj4gQEAgLTQ2MSw3ICs0NjEsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfZWRk
KHZvaWQpDQo+Pj4+ICAgICAgICAgICAgICAgICAgICBwYXJhbXMtPmRldmljZV9wYXRoX2luZm9f
bGVuZ3RoID0NCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yoc3RydWN0IGVkZF9k
ZXZpY2VfcGFyYW1zKSAtDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgb2Zmc2V0b2Yoc3Ry
dWN0IGVkZF9kZXZpY2VfcGFyYW1zLCBrZXkpOw0KPj4+PiAtICAgICAgICAgICAgICAgIGZvciAo
IHAgPSAoY29uc3QgdTggKikmcGFyYW1zLT5rZXk7IHAgPCAmcGFyYW1zLT5jaGVja3N1bTsgKytw
ICkNCj4+Pj4gKyAgICAgICAgICAgICAgICBmb3IgKCBwID0gKGNvbnN0IHU4ICopJnBhcmFtcy0+
a2V5Ow0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICh1aW50cHRyX3QpcCA8ICh1aW50cHRy
X3QpJnBhcmFtcy0+Y2hlY2tzdW07ICsrcCApDQo+Pj4NCj4+PiBUaGVyZSBtZXJlIGFkZGl0aW9u
IG9mIHN1Y2ggY2FzdHMgbWFrZXMgY29kZSBtb3JlIGZyYWdpbGUgaW1vLiBXaGF0IGFib3V0IHRo
ZQ0KPj4+IGFsdGVybmF0aXZlIG9mIHVzaW5nICE9IGluc3RlYWQgb2YgPCBoZXJlPyBJIGNlcnRh
aW5seSBwcmVmZXIgPCBpbiBzdWNoIHNpdHVhdGlvbnMsDQo+Pj4gYnV0IGZ1bmN0aW9uYWxseSAh
PSBvdWdodCB0byBiZSBlcXVpdmFsZW50IChhbmQgbGVzcyBjb25zdHJhaW5lZCBieSBDIGFuZCBN
aXNyYSkuDQo+Pj4NCj4+PiBBcyBtZW50aW9uZWQgc2V2ZXJhbCB0aW1lcyB3aGVuIGRpc2N1c3Np
bmcgdGhlc2UgcnVsZXMsIGl0J3MgYWxzbyBub3QgZWFzeSB0byBzZWUNCj4+PiBob3cgInBvaW50
ZXJzIG9mIGRpZmZlcmVudCBvYmplY3RzIiBjb3VsZCBiZSBpbnZvbHZlZCBoZXJlOiBJdCdzIGFs
bCB3aXRoaW4NCj4+PiAqcGFyYW1zLCBpc24ndCBpdD8NCj4+IEhhcmQgdG8gc2F5IHNvbWV0aGlu
Zy4gTGV0J3MgaG9sZCB0aGlzIHNvIGZhci4NCj4+DQo+Pj4NCj4+PiBGaW5hbGx5LCB3aGVuIHRv
dWNoaW5nIHN1Y2ggY29kZSBpdCB3b3VsZCBiZSBuaWNlIGlmIHU8Tj4gd2FzIGNvbnZlcnRlZCB0
bw0KPj4+IHVpbnQ8Tj5fdC4NCj4+Pg0KPj4+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUu
Yw0KPj4+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPj4+PiBAQCAtMzYwLDcgKzM2
MCw3IEBAIHN0YXRpYyBhbHdheXNfaW5saW5lIHZvaWQgc2NoZWRfc3Bpbl9sb2NrX2RvdWJsZSgN
Cj4+Pj4gICAgICAgIHsNCj4+Pj4gICAgICAgICAgICAqZmxhZ3MgPSBfc3Bpbl9sb2NrX2lycXNh
dmUobG9jazEpOw0KPj4+PiAgICAgICAgfQ0KPj4+PiAtICAgIGVsc2UgaWYgKCBsb2NrMSA8IGxv
Y2syICkNCj4+Pj4gKyAgICBlbHNlIGlmICggKHVpbnRwdHJfdClsb2NrMSA8ICh1aW50cHRyX3Qp
bG9jazIgKQ0KDQpDb3VsZCB3ZSBhc3N1bWUgdGhhdCB0aGVzZSAnbG9jazEnIGFuZCAnbG9jazIn
IHBvaW50ZXJzIGJlbG9uZyB0byB0aGUgDQpzYW1lIGFsbG9jYXRpb24gcmVnaW9uIC0gJ3NjaGVk
X3Jlc291cmNlJyA/DQoNCkRteXRyby4NCg0KPj4+DQo+Pj4gU2ltaWxhcmx5LCBubyBtYXR0ZXIg
d2hhdCBDIG9yIE1pc3JhIG1heSBoYXZlIHRvIHNheSBoZXJlLCBpbW8gc3VjaCBjYXN0cyBhcmUN
Cj4+PiBzaW1wbHkgZGFuZ2Vyb3VzLiBFc3BlY2lhbGx5IHdoZW4gb3Blbi1jb2RlZC4NCj4+IFdl
bGwsIHRoaXMgZnVuY3Rpb24gJ3NjaGVkX3NwaW5fbG9ja19kb3VibGUnIGhhcyB0aGUgZm9sbG93
aW5nIGRlc2NyaXB0aW9uOg0KPj4gIklmIGxvY2tzIGFyZSBkaWZmZXJlbnQsIHRha2UgdGhlIG9u
ZSB3aXRoIHRoZSBsb3dlciBhZGRyZXNzIGZpcnN0LiINCj4+DQo+PiBJIHRoaW5rIGl0J3Mgc2F2
ZSB0byBjb21wYXJlIHRoZSBpbnRlZ2VyIHJlcHJlc2VudGF0aW9ucyBvZiAnbG9jazEnIGFuZA0K
Pj4gJ2xvY2syJyBhZGRyZXNzZXMgZXhwbGljaXRseSAoY2FzdGluZyB0aGUgcG9pbnRlcnMgdmFs
dWVzIHRvIGFuIGludGVnZXINCj4+IHR5cGUpLiBXZSBuZWVkIHRvIGZpbmQgdGhlICdsb3dlciBh
ZGRyZXNzJy4NCj4+IEFueSByaXNrcyBoZXJlPw0KPj4NCj4+IERteXRybw0KPj4+DQo+Pj4+IC0t
LSBhL3hlbi9jb21tb24vdmlydHVhbF9yZWdpb24uYw0KPj4+PiArKysgYi94ZW4vY29tbW9uL3Zp
cnR1YWxfcmVnaW9uLmMNCj4+Pj4gQEAgLTgzLDggKzgzLDggQEAgY29uc3Qgc3RydWN0IHZpcnR1
YWxfcmVnaW9uICpmaW5kX3RleHRfcmVnaW9uKHVuc2lnbmVkIGxvbmcgYWRkcikNCj4+Pj4gICAg
ICAgIHJjdV9yZWFkX2xvY2soJnJjdV92aXJ0dWFsX3JlZ2lvbl9sb2NrKTsNCj4+Pj4gICAgICAg
IGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1ICggaXRlciwgJnZpcnR1YWxfcmVnaW9uX2xpc3QsIGxp
c3QgKQ0KPj4+PiAgICAgICAgew0KPj4+PiAtICAgICAgICBpZiAoICh2b2lkICopYWRkciA+PSBp
dGVyLT50ZXh0X3N0YXJ0ICYmDQo+Pj4+IC0gICAgICAgICAgICAgKHZvaWQgKilhZGRyIDwgIGl0
ZXItPnRleHRfZW5kICkNCj4+Pj4gKyAgICAgICAgaWYgKCBhZGRyID49ICh1bnNpZ25lZCBsb25n
KWl0ZXItPnRleHRfc3RhcnQgJiYNCj4+Pj4gKyAgICAgICAgICAgICBhZGRyIDwgICh1bnNpZ25l
ZCBsb25nKWl0ZXItPnRleHRfZW5kICkNCj4+Pg0KPj4+IENvbnNpZGVyaW5nIGZ1cnRoZXIgY2Fz
dHMgdG8gdW5zaWduZWQgbG9uZyBvZiB0aGUgc2FtZSBzdHJ1Y3QgZmllbGRzLCB3YXMgaXQNCj4+
PiBjb25zaWRlcmVkIHRvIGFsdGVyIHRoZSB0eXBlIG9mIHRoZSBzdHJ1Y3QgZmllbGRzIGluc3Rl
YWQ/DQo+PiBUaGVyZSBhcmUgcHJlc2VudCBjYXN0cyBvZiBzdHJ1Y3QgZmllbGRzICd0ZXh0X3N0
YXJ0JyBhbmQgJ3RleHRfZW5kJyBpbg0KPj4gdGhlIGZpbGUgJ3hlbi9jb21tb24vdmlydHVhbF9y
ZWdpb24uYycuDQo+Pg0KPj4gICAgICAgICAgIG1vZGlmeV94ZW5fbWFwcGluZ3NfbGl0ZSgodW5z
aWduZWQgbG9uZylyZWdpb24tPnRleHRfc3RhcnQsDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKXJlZ2lvbi0+dGV4dF9lbmQsDQo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfSFlQRVJWSVNPUl9SV1gpOw0KPj4NCj4+
IENoYW5naW5nIGZpZWxkcyB0eXBlIHRvICd1bnNpZ25lZCBsb25nJyB3aWxsIGdpdmUgdGhlIG9w
cG9ydHVuaXR5IHRvDQo+PiByZW1vdmUgY2FzdHMgZnJvbSBzb3VyY2UgY29kZSAobWVudGlvbmVk
IGJlZm9yZSksDQo+PiBhbmQgcmVtb3ZlICcodm9pZCopJyBjYXN0cyBmcm9tIGhlcmU6DQo+Pg0K
Pj4gICAgICAgICAgIGlmICggKHZvaWQgKilhZGRyID49IGl0ZXItPnRleHRfc3RhcnQgJiYNCj4+
ICAgICAgICAgICAgICAgICh2b2lkICopYWRkciA8ICBpdGVyLT50ZXh0X2VuZCApDQo+Pg0KPj4g
VW5mb3J0dW5hdGVseSB0aGVyZSBhcmUgcGxhY2VzIHdoZXJlIHRoZXNlIGZpZWxkcyBhcmUgaW5p
dGlhbGl6ZWQsIHNvDQo+PiBjYXN0IHRvIHRoZSAndW5zaWduZWQgbG9uZycgc2hvdWxkIGJlIHRo
ZXJlLg0KPj4gRXhhbXBsZToNCj4+ICAgICAgIC50ZXh0X3N0YXJ0ID0gX3Npbml0dGV4dCwNCj4+
ICAgICAgIC50ZXh0X2VuZCA9IF9laW5pdHRleHQsDQo+PiBhbmQNCj4+ICAgICAgIC50ZXh0X3N0
YXJ0ID0gX3Npbml0dGV4dCwNCj4+ICAgICAgIC50ZXh0X2VuZCA9IF9laW5pdHRleHQsDQo+Pg0K
Pj4gd2hlcmUNCj4+ICAgICAgIGV4dGVybiBjaGFyIF9zaW5pdHRleHRbXSwgX2Vpbml0dGV4dFtd
Ow0KPj4gICAgICAgZXh0ZXJuIGNoYXIgX3N0ZXh0W10sIF9ldGV4dFtdOw0KPj4NCj4gDQo+IEV2
ZXJ5dGhpbmcgcmVsYXRlZCB0byBzdGV4dC9ldGV4dCwgc2luaXR0ZXh0L2Vpbml0dGV4dCwgZXRj
IHNob3VsZCBiZQ0KPiBkZXZpYXRlZCBhcyB0aG9zZSBhcmUgbm90IGV2ZW4gcG9pbnRlcnM6IHRo
ZXkgYXJlIGxpbmtlciBzeW1ib2xzLiBBbHNvLA0KPiB0aGV5IGRvIHJlZmVyIHRvIHRoZSBzYW1l
ICJvYmplY3QiOiB0aGUgWGVuIHRleHQuDQo=

