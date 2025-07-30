Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE19B15AE1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 10:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063532.1429255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2Ri-0007lC-Jz; Wed, 30 Jul 2025 08:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063532.1429255; Wed, 30 Jul 2025 08:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh2Ri-0007iX-GE; Wed, 30 Jul 2025 08:45:58 +0000
Received: by outflank-mailman (input) for mailman id 1063532;
 Wed, 30 Jul 2025 08:45:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6hfZ=2L=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uh2Rg-0007SQ-8L
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 08:45:56 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92f43c6e-6d21-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 10:45:41 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM0PR03MB6194.eurprd03.prod.outlook.com (2603:10a6:20b:15a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 08:45:40 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8964.025; Wed, 30 Jul 2025
 08:45:40 +0000
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
X-Inumbo-ID: 92f43c6e-6d21-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPqzOlva2Htl+eHyy26MUGNBIvJUBbzfXaXJAqqetS9kpyE7dFfgbpljxkUQVk1NrhgrIUHI//rcB7Cm2VwDaNHOxhFEl0DuO4l5p8sjoaMueCo8XAUD6u/U/MnVLneJbwEfkj6hYoC5xWmN2Hsun5mVdzIfuYJMrcfo+hQS3It3S2QC58cJq6NoaG0UNlc7PUFMQTJ3hIBgerDIc8AthK6i+Hzcm7M4yhWXDLWaSIOYd2phIzl9sKfYdAicNpEvdGBgg4O+NKzji+PP8uYKGHlHcECDUWHm1Qr9T3soy/v0YdutaaLEagPbBN7H4bi02DfV/8zYUlyRUsCszqstjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1ZjLI47SoEIKGNXKKcCmCc2VfddhClpYpxPr3ELiPY=;
 b=wFGOCusT1oV9MOmgANAmbJsp+fNlx7/+PiXwLAFhZLjs+g3EzaMEunnnmaUWLkhouX+b9xS5DTXRgMy/C16hbAp4hGNyKtsuoUFqGlv18ZJISBOFy2yipRDQgNFjm13kfCG/ZiRWyV58FlpFxr0BEbA7/74l9Fk+Qxa65ZmV8WbxGbvNhamkYl3Zk4m4r7vP51BRCZYQB64T6i05imtbwwLm1vm1/+12BMzjOiVQ1Y7k1NF8yDyiUt9uCp1R4uiBysn67oR0oBIa7EOu6ya93dhX+0T7zk/Rhu8u6V1g3HHhIEp7/mk7bTNwIRqPkjxraa8cM+JMI2LFfQjKlrIvhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1ZjLI47SoEIKGNXKKcCmCc2VfddhClpYpxPr3ELiPY=;
 b=eBF1qmvt1nIZd7QEgF8C+m1Ep5HgE1UG6ulvkP+jSWZJh5vOCI1YbN4VxwIsHQ1kJusYmSrR3QCkbASOTnPLWaYGUKS0LVqWHsqGgU24/nxk2n1yWVzfhVtUpGaWRAw9r4PlfoGZyKIPR4d/54ryQxem4vk9O+LhydIWFqCAcFvuK1zNxyvvyzoNuwPfj0PdR90HZzUaPtgSvCIVYKnUj0UYv1Qu/WIgtbD3CPH1aRABK2HS4UbmXg+fPrVFMNgqOLswRLs5M67zvlPhmdFugaU1JeyrHhQaJgG07SnQl2XlQfIoCP307mJS6fnafB2iDhK7FUR/Ho/keea3ewAfRA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] xen/irq: Delete the pirq_cleanup_check() macro
Thread-Topic: [PATCH] xen/irq: Delete the pirq_cleanup_check() macro
Thread-Index: AQHcANiB3YdmHa9oc0manxquZPhnqLRKWvQA
Date: Wed, 30 Jul 2025 08:45:40 +0000
Message-ID: <3f177ab6-584f-4233-a724-02755bc49723@epam.com>
References: <20250729223110.3404441-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250729223110.3404441-1-andrew.cooper3@citrix.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM0PR03MB6194:EE_
x-ms-office365-filtering-correlation-id: a1e5addb-853d-439d-5989-08ddcf457653
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|42112799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eFgxYml2aUd1RE9vYi9LeFVnSE9kd2JwVlovUTBTbThoZ21QQ3FGN1Q1a2hH?=
 =?utf-8?B?UHhVZmwxRG5JWTU2YW5uVUE3OC92MGljSVRWMXk1eFpkTjQ3THM4eWFEb09D?=
 =?utf-8?B?L3B3ODMvVHlhVmU5TmZJVjhJNnEzN3R5ekFVbmN1UDZnYmFqQmJGb1k2LzJ2?=
 =?utf-8?B?VHJ5bjdDeElaZXpVV1Y0cnFIZmk2Q0RyOVlRQ2lTTzYzeFhWSHN0bHpieVRy?=
 =?utf-8?B?T1JlRlNOS0c4K3FoM3BpUGJlVFZWUGxPMVRzcHhDdHQrSjJQWFBmRWpiRWlj?=
 =?utf-8?B?R0FneVA0QXdCNFhONHlsNmxNZy9PSVZHVXFWYk1TN1B4dmRIaVFpODdJSzZy?=
 =?utf-8?B?aU90Y0pHdENqeGJhWnhnUWllM0ZjZUY0OEJyK0Vaa1Z2ZG9YVnVsSll5eVlz?=
 =?utf-8?B?VEdvOXl3NVRLUjd4eFNUQlE2SC9MaHVNeHVhaEQ2TVJybVhHZGpKQm5QRXlN?=
 =?utf-8?B?Ly93UUhCYUY2bEQ3eksvU0xWQnN3cWdYcmZ2SHc0OG9TVDFYeXdPTWtEVEZU?=
 =?utf-8?B?YUpRYktmR0s1WUZDbTZJYnZXMmZZUzNmd0RuYlFzQkpOSDlITTNJbDBjUUdF?=
 =?utf-8?B?ZGxkTXZhWkJJcXhrUGFWcVNvTlRBTXdIOStVTlArV3p1bEdSd1hDanlDK0hW?=
 =?utf-8?B?akpjUVNKbkFDU2ZDUHJNcGVabkJIdmJFeDFlMkV3VFFwRlpBVjdmVFJ6aGcv?=
 =?utf-8?B?V3A0bi9uaFhVSDdIbEwrR1VMQ085amhJQkkvNzExbTlBN0hRMlRmYXJ4ZVQ3?=
 =?utf-8?B?WlBOTnNCbTh4bUladG9vQW1QYXRvcGtjQ2VnV1VEbDBrRDcwQi9ocDNtUHBR?=
 =?utf-8?B?Z1VaMXlIQ0p0dm5aSHlVMFVia0Z1bzNiYnlUbHEvT1g4RGQ3TEpQM2RmQWc5?=
 =?utf-8?B?VnV2MFpRclhHM2t3UmR6T1JwcjFvVTJiNFY3ZksxZUJXcDhOd0JXVTNRMFhm?=
 =?utf-8?B?eU9oRU5iNjR6TUx2elRyRVBqbGx2NEFkR284RlpyQm5FcDRMMjhmaWRiTHA0?=
 =?utf-8?B?VHdpTWgxRFlNSTRtYVhESmNweW9kSEpNWVNndXVDRHdHN3NOdDVFd2FUeXhE?=
 =?utf-8?B?a3hkK1ozV08rdHBZaFF4L0RWV2tGa3ArRjhyUkJyYWh0RUxqNUp3VDU5aytv?=
 =?utf-8?B?WVZFdit1cGUwQVBYM0ZWUTlDRXp5YjIrSXFXWGJrWnVIQUR2NVZ5dTR6blU3?=
 =?utf-8?B?S1RZNUtOUFVnQ2pBVDZMbk1ldFI2TDNOMHhvT01ra3d4MjRDOUpBTDJzNnVX?=
 =?utf-8?B?YVgzbHhxaHI3MG1GM3U2SDBPWDd1WE5kakZUN21NK3JZQzlhRzlDUWVBREh1?=
 =?utf-8?B?aHpiMkZVQTh4RG9pVEpJUENxaUY3TFczSTZYNnY5dm9VQnBIL1haRkc5bCtZ?=
 =?utf-8?B?UWpZaDhZczFOd2g1cjRZQXdVcXpXOUhnaTBSYTFuRno4cmVldm9NR1JpNDFM?=
 =?utf-8?B?SUdscnZjWnc4R3lMRUZURGIwTUc1NUlQdVlqSVJ6VFI0QlF2eWF6cWRSdWM5?=
 =?utf-8?B?dFdSQ1hRYy9OZU5iZXN1d1NNeklRTUtDWEJQRmpuV3hCd1lBVUdwZC9xU3pP?=
 =?utf-8?B?TGZlaStBVFBBbkphSjUxa3hlbVN0Q0ZnYkNndHlFMG80ekhQNjZKZUpBemVQ?=
 =?utf-8?B?S0cwWXZwRHg3NFdZMVNZYmptZ2IwcFNzZ0NIUG5UNW9tRUoxQit1UDU5T3d2?=
 =?utf-8?B?ZDh0Mm96K2Y3TFl4L002dEVxWjRoa3duT0lMcnJuRGVmeGVoK2JFai9xaGlh?=
 =?utf-8?B?VlVFVUZTdTlEcXZKdk5RbkJveGo3eGFQY1NxeEVIZnNCV2tMZWIvR0ZPcFVU?=
 =?utf-8?B?N0FDcFpidHM5Q1BnMFRTdkV2djVRQ1drTUpGRDhLTHdYU3lLTTdKamZ0ZUZY?=
 =?utf-8?B?QXdVSHU5UzJiMnBpUXdCK2xjSldCN1VIVUkzS1FZb3JlVzdrdFA3TkZRY2F3?=
 =?utf-8?B?cHBQSU04d2lFKzcrRlYwNnJ3M2tQNnM4YkplS2hST2pmc3ZDSUtFd2lDYWtY?=
 =?utf-8?B?d0pNZjZIRURnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlBleklIZjRFcks4RHNNc0hBZlFtVUY4ZURZVU9lcS85S3JBMlZYOUpZcmd2?=
 =?utf-8?B?TVBTaDRFdGJjQW8zM0UvT1NhZ2ZRMU5GUHFOK2lWaDhDMWpxbGhnSnlBQW50?=
 =?utf-8?B?enNOcUJ5TTdlWm5YUzNSRHVNVmJGMkNoWEg4Uk0vQ294NHZ2NlBJZ3g2V3p5?=
 =?utf-8?B?QXFLVEc0RWVTaVN4TW9tSCtrRWJlWnVmR1VxcHR4dHg0R2dqc08xc2hzckdL?=
 =?utf-8?B?VnFYdHZMa1VBSUtsRlJLMnFqRWVsdkQ4K3MrcitqTXA5b0ljN01YMjR5WlBR?=
 =?utf-8?B?SVViUUFYRlVoODM1ck5hR2svMnE2cGNEclhlcC9CUVR6OHdvZm5iMVg5aGsw?=
 =?utf-8?B?MFFBSjVxazdVY29SdktMSy90a0thS2J2VEVwUHZnNnFPNWNDK1I2NzV5TXNL?=
 =?utf-8?B?NmtQeFJrbUJFbGd5cjFmZXcrclluZjZhTkZyZDFOMjBqakdDZnpWS0NIRzEr?=
 =?utf-8?B?NnNHYVhZeEJvVEoyOVBqWkFoQzYvNGZhSUdsQjcxYkVEM05UTWgyc0ZoVEJO?=
 =?utf-8?B?OGtEYng4a09MZURsdlgrQmpkb3V6Vm15aUwrWlNHNWRWZFMzWnZkbEdrWEs2?=
 =?utf-8?B?WUdCSWhyaVp5MG1lMWxoWFpHSXF6Z1lYM0t2Ukw3QnBLanVqbFdKNEtJQXRh?=
 =?utf-8?B?Tit0NUdhWWM3WDAxMVJML3J0OWlRUi9JT1p3MUJUc1JlMkEzM1JvTUdqMmNZ?=
 =?utf-8?B?eXcyUHdzdFpxVlhwditZV1FyR2VYckNhSjZFNlN1V2FmVkYvQ1lmK3JIeC93?=
 =?utf-8?B?R2NTaGdCV3dmd1kydGFUYmNoeG5CRE5IYUUwaGlvYkJxQU9zTzVnNzVZYXB6?=
 =?utf-8?B?czVJa3ZBbnp4M2ppelplbVkrQ2FxT08vY0NGL1Z4eUZZcTV0NCtMVTZiMDM0?=
 =?utf-8?B?T1dET21qcUZaZXdtWlIydkIxMUFGdk5PZXQ1aEpCWDVPbmFFbndzdW9YUG5x?=
 =?utf-8?B?UVQ3bk9aT1AySkNHM3E5RDdpeHBXOEtiMHg4ME9KbC9pSTE3RGFNcE9pL3hj?=
 =?utf-8?B?V1dpb2Y4OWFRTHZXSG9LM0RTWGtFWTFBeEVqSGpLMnlDdzZhZVNLWldkSWtj?=
 =?utf-8?B?L3Y1NFVVa1VzTWdHYzE1MVRtS01iU0IrcWlQbGQ4WEVxSmVPcWd0RUdqdHhu?=
 =?utf-8?B?OWdkcitCMFJRQjBIRlYvekYwbm1LRUVMTGM1Ulhrekg1R3NCVDdGWkFHa3pW?=
 =?utf-8?B?OFhyVUxHeVU5NmFWTDZla3E1MW9YZVEvUWtDbVpqclRoR2dGQXVUbFg4TEti?=
 =?utf-8?B?UXBPQ2g0dmlhUDlCVndYbkhJT0FqZEI0enJzU2V6TmgvdjltZVhtb2I1c1lr?=
 =?utf-8?B?ZnNRa0grMDJPaDd0UjlvUGFsR2FMVGthaGUrSzBMY3Y1eU1KcEltUFdnTjNP?=
 =?utf-8?B?OTJqUzdDSms0eDUxUmVGMjVJb200TUpMS2ZuR0daNEZPd0JoVWtQem5hR0tS?=
 =?utf-8?B?azRDZnhxRkVib2RjM3Z6VjlzME1MV1hoT1BZblkrT1NWeERBWmFaVmtJZFBG?=
 =?utf-8?B?dzhFVi80S1UxTndhYzBsdjB0ZE9NNzhiVnUvV2c4QWEyK1hsNzFIZkZEUjhM?=
 =?utf-8?B?OHhuR3BXWXBqSUxGdlBZeWpzcnU1S1lQblBCeE5WTitYYWI0L3BLZDFTQlcx?=
 =?utf-8?B?cE9uMlhVL3pCY0tUZWY1SEZldVVXL3U1YkREV2N6YkhWSVRXckcvMUhWbjFY?=
 =?utf-8?B?YkxIcDFyYzZDcUtRclJhQTBsUmttS2QwUGt5cENqS083RDBwa2VySjNyUlNU?=
 =?utf-8?B?MXpyNWNzenNJenUwb3VTYkYxajdxWThlNlZmWGhuVVVuSWdPSnRBU0FQVHlI?=
 =?utf-8?B?K3RBdUFoTnlxcGhzVzU1aS9PdUh1UlF4aHlHWVhvSTdKZjUyQ1BjeDJkbHo3?=
 =?utf-8?B?VGcyaUlwMVhJRXNHUVo4dStPNnB1THVuMkQvMTBBdmlKOVRGVjNGaXZPSmtP?=
 =?utf-8?B?NjJoYlFHU3RZbGtRTjE5ditJVlh5cktPb3A2NXREQUVIbEltR1hHcUtEa3E1?=
 =?utf-8?B?RFVSTzF2L0JjQ3ZGRmR3QndtbTNVSjU2Vmk5QnRISXZYVUF2THNVOFcxcGY4?=
 =?utf-8?B?MzFoRS9uOUZkMjJ6VE1wQkgzN29MOTNOSk5ZNVFLYThoaDhSS1NsVlVXSmIv?=
 =?utf-8?B?RndmNExaSk5PZUJENG5HNDZ1UENnMCttRFJpTVRhdXdCWDN3c1d2TzJreHg2?=
 =?utf-8?B?UkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DA1D11182314F4387FE801686DFBB3C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e5addb-853d-439d-5989-08ddcf457653
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 08:45:40.0803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ohy3mEQaZhD6eIiWJCLOtETAHgvCCbgJKhFefWjRJnNQ/HKks2kyJyV6+ufX30Os0PVk+5DO0PH+8BFEhqID0W4JWUSwNOlAVris/sOi29M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6194

DQoNCk9uIDcvMzAvMjUgMDE6MzEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE1JU1JBIFJ1bGUg
NS41IG9iamVjdHMgdG8gYSBtYWNybyBhbGlhc2luZyBhIGZ1bmN0aW9uLCB3aGljaCBpcyB3aGF0
DQo+IHBpcnFfY2xlYW51cF9jaGVjaygpIGRvZXMuICBUaGUgbWFjcm8gaXMgYW4gb3Zlcmx5LWNv
bXBsaWNhdGVkIHdheSBvZiB3cml0aW5nOg0KPiANCj4gICAgICBpZiAoICFwaXJxLT5ldnRjaG4g
KQ0KPiAgICAgICAgICBwaXJxX2NsZWFudXBfY2hlY2socGlycSwgZCk7DQo+IA0KPiBUaGVyZSBh
cmUgb25seSBhIGhhbmRmdWwgb2YgdXNlcnMsIHNvIGV4cGFuZCBpdCBpbmxpbmUgdG8gYmUgcGxh
aW4gcmVndWxhciBDLg0KPiANCj4gRG9pbmcgdGhpcyBzaG93cyBvbmUgcGF0aCBub3cgbmVlZGlu
ZyBicmFjZXMsIGFuZCBvbmUgcGF0aCBpbg0KPiBldnRjaG5fYmluZF9waXJxKCkgd2hlcmUgdGhl
IGV4cGFuZGVkIGZvcm0gc2ltcGxpZXMgYmFjayB0byBubyBkZWx0YSwgYXMgaXQNCj4gZm9sbG93
cyBhbiB1bmNvbmRpdGlvbmFsIGNsZWFyIG9mIGluZm8tPmV2dGNobi4NCj4gDQo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlOyBUaGUgY29tcGlsZWQgaHlwZXJ2aXNvcnMgYXJlIHRoZSBzYW1lLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IERteXRybyBQcm9rb3BjaHVrMSA8ZG15dHJvX3Byb2tvcGNodWsx
QGVwYW0uY29tPg0KDQo+IC0tLQ0KPiBDQzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QHZhdGVzLnRlY2g+DQo+IENDOiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0K
PiBDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDQzogSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4NCj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pg0KPiBDQzogRG15dHJvIFByb2tvcGNodWsxIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+
DQo+IENDOiBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20+DQo+IA0K
PiBDbGVhcmx5IHRoZSBjb21waWxlciBoYWQgYWxyZWFkeSBmb3VuZCB0aGUgc2ltcGxpZmljYXRp
b24gaW4NCj4gZXZ0Y2huX2JpbmRfcGlycSgpLg0KPiANCj4gWWVzLCBJIGtub3cgSSBjb3VsZCBp
bnRlZ3JhdGUgdGhlICFpbmZvLT5ldnRjaG4gaW50byB0aGUgb3V0ZXIgaWYoKSBjb25kaXRpb24s
DQo+IGJ1dCB0aGF0J3MgYW4gZXZlbiBiaWdnZXIgbWVzcy4NCj4gLS0tDQo+ICAgeGVuL2FyY2gv
eDg2L2lycS5jICAgICAgICAgICAgICAgIHwgMTEgKysrKysrKy0tLS0NCj4gICB4ZW4vY29tbW9u
L2V2ZW50X2NoYW5uZWwuYyAgICAgICAgfCAgNSArKysrLQ0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3g4Ni9odm0uYyB8ICA5ICsrKysrKy0tLQ0KPiAgIHhlbi9pbmNsdWRlL3hlbi9pcnEu
aCAgICAgICAgICAgICB8ICAzIC0tLQ0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2ly
cS5jIGIveGVuL2FyY2gveDg2L2lycS5jDQo+IGluZGV4IDU1NjEzNGY4NWFhMC4uMWVkODVjMGMx
MTRlIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMNCj4gKysrIGIveGVuL2FyY2gv
eDg2L2lycS5jDQo+IEBAIC0xMzI1LDcgKzEzMjUsOCBAQCBzdGF0aWMgdm9pZCBjbGVhcl9kb21h
aW5faXJxX3BpcnEoc3RydWN0IGRvbWFpbiAqZCwgaW50IGlycSwgc3RydWN0IHBpcnEgKnBpcnEp
DQo+ICAgc3RhdGljIHZvaWQgY2xlYW51cF9kb21haW5faXJxX3BpcnEoc3RydWN0IGRvbWFpbiAq
ZCwgaW50IGlycSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgcGlycSAqcGlycSkNCj4gICB7DQo+IC0gICAgcGlycV9jbGVhbnVwX2NoZWNrKHBpcnEsIGQp
Ow0KPiArICAgIGlmICggIXBpcnEtPmV2dGNobiApDQo+ICsgICAgICAgIHBpcnFfY2xlYW51cF9j
aGVjayhwaXJxLCBkKTsNCj4gICAgICAgcmFkaXhfdHJlZV9kZWxldGUoJmQtPmFyY2guaXJxX3Bp
cnEsIGlycSk7DQo+ICAgfQ0KPiAgIA0KPiBAQCAtMTM4Myw3ICsxMzg0LDcgQEAgc3RydWN0IHBp
cnEgKmFsbG9jX3BpcnFfc3RydWN0KHN0cnVjdCBkb21haW4gKmQpDQo+ICAgICAgIHJldHVybiBw
aXJxOw0KPiAgIH0NCj4gICANCj4gLXZvaWQgKHBpcnFfY2xlYW51cF9jaGVjaykoc3RydWN0IHBp
cnEgKnBpcnEsIHN0cnVjdCBkb21haW4gKmQpDQo+ICt2b2lkIHBpcnFfY2xlYW51cF9jaGVjayhz
dHJ1Y3QgcGlycSAqcGlycSwgc3RydWN0IGRvbWFpbiAqZCkNCj4gICB7DQo+ICAgICAgIC8qDQo+
ICAgICAgICAqIENoZWNrIHdoZXRoZXIgYWxsIGZpZWxkcyBoYXZlIHRoZWlyIGRlZmF1bHQgdmFs
dWVzLCBhbmQgZGVsZXRlDQo+IEBAIC0yODIzLDcgKzI4MjQsOCBAQCBpbnQgbWFwX2RvbWFpbl9l
bXVpcnFfcGlycShzdHJ1Y3QgZG9tYWluICpkLCBpbnQgcGlycSwgaW50IGVtdWlycSkNCj4gICAg
ICAgICAgICAgICAgICAgcmFkaXhfdHJlZV9pbnRfdG9fcHRyKHBpcnEpKTsNCj4gICAgICAgICAg
ICAgICBicmVhazsNCj4gICAgICAgICAgIGRlZmF1bHQ6DQo+IC0gICAgICAgICAgICBwaXJxX2Ns
ZWFudXBfY2hlY2soaW5mbywgZCk7DQo+ICsgICAgICAgICAgICBpZiAoICFpbmZvLT5ldnRjaG4g
KQ0KPiArICAgICAgICAgICAgICAgIHBpcnFfY2xlYW51cF9jaGVjayhpbmZvLCBkKTsNCj4gICAg
ICAgICAgICAgICByZXR1cm4gZXJyOw0KPiAgICAgICAgICAgfQ0KPiAgICAgICB9DQo+IEBAIC0y
ODU4LDcgKzI4NjAsOCBAQCBpbnQgdW5tYXBfZG9tYWluX3BpcnFfZW11aXJxKHN0cnVjdCBkb21h
aW4gKmQsIGludCBwaXJxKQ0KPiAgICAgICBpZiAoIGluZm8gKQ0KPiAgICAgICB7DQo+ICAgICAg
ICAgICBpbmZvLT5hcmNoLmh2bS5lbXVpcnEgPSBJUlFfVU5CT1VORDsNCj4gLSAgICAgICAgcGly
cV9jbGVhbnVwX2NoZWNrKGluZm8sIGQpOw0KPiArICAgICAgICBpZiAoICFpbmZvLT5ldnRjaG4g
KQ0KPiArICAgICAgICAgICAgcGlycV9jbGVhbnVwX2NoZWNrKGluZm8sIGQpOw0KPiAgICAgICB9
DQo+ICAgICAgIGlmICggZW11aXJxICE9IElSUV9QVCApDQo+ICAgICAgICAgICByYWRpeF90cmVl
X2RlbGV0ZSgmZC0+YXJjaC5odm0uZW11aXJxX3BpcnEsIGVtdWlycSk7DQo+IGRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYyBiL3hlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5j
DQo+IGluZGV4IGM4YzFiZmE2MTVkZi4uZWQ0OGZiYjU1ZDY3IDEwMDY0NA0KPiAtLS0gYS94ZW4v
Y29tbW9uL2V2ZW50X2NoYW5uZWwuYw0KPiArKysgYi94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwu
Yw0KPiBAQCAtNzQxLDExICs3NDEsMTQgQEAgaW50IGV2dGNobl9jbG9zZShzdHJ1Y3QgZG9tYWlu
ICpkMSwgaW50IHBvcnQxLCBib29sIGd1ZXN0KQ0KPiAgICAgICAgICAgICAgIGlmICggIWlzX2h2
bV9kb21haW4oZDEpIHx8DQo+ICAgICAgICAgICAgICAgICAgICBkb21haW5fcGlycV90b19pcnEo
ZDEsIHBpcnEtPnBpcnEpIDw9IDAgfHwNCj4gICAgICAgICAgICAgICAgICAgIHVubWFwX2RvbWFp
bl9waXJxX2VtdWlycShkMSwgcGlycS0+cGlycSkgPCAwICkNCj4gKyAgICAgICAgICAgIHsNCj4g
ICAgICAgICAgICAgICAgICAgLyoNCj4gICAgICAgICAgICAgICAgICAgICogVGhlIHN1Y2Nlc3Nm
dWwgcGF0aCBvZiB1bm1hcF9kb21haW5fcGlycV9lbXVpcnEoKSB3aWxsIGhhdmUNCj4gICAgICAg
ICAgICAgICAgICAgICogY2FsbGVkIHBpcnFfY2xlYW51cF9jaGVjaygpIGFscmVhZHkuDQo+ICAg
ICAgICAgICAgICAgICAgICAqLw0KPiAtICAgICAgICAgICAgICAgIHBpcnFfY2xlYW51cF9jaGVj
ayhwaXJxLCBkMSk7DQo+ICsgICAgICAgICAgICAgICAgaWYgKCAhcGlycS0+ZXZ0Y2huICkNCj4g
KyAgICAgICAgICAgICAgICAgICAgcGlycV9jbGVhbnVwX2NoZWNrKHBpcnEsIGQxKTsNCj4gKyAg
ICAgICAgICAgIH0NCj4gICAgICAgICAgIH0NCj4gICAgICAgICAgIHVubGlua19waXJxX3BvcnQo
Y2huMSwgZDEtPnZjcHVbY2huMS0+bm90aWZ5X3ZjcHVfaWRdKTsNCj4gICAgICAgICAgIGJyZWFr
Ow0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2h2bS5jIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2h2bS5jDQo+IGluZGV4IGEyY2E3ZTBlNTcwYy4uYjcz
YmI1NTA1NTRkIDEwMDY0NA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaHZt
LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2h2bS5jDQo+IEBAIC0zMjks
NyArMzI5LDggQEAgaW50IHB0X2lycV9jcmVhdGVfYmluZCgNCj4gICAgICAgICAgICAgICAgICAg
cGlycV9kcGNpLT5nbXNpLmd2ZWMgPSAwOw0KPiAgICAgICAgICAgICAgICAgICBwaXJxX2RwY2kt
PmRvbSA9IE5VTEw7DQo+ICAgICAgICAgICAgICAgICAgIHBpcnFfZHBjaS0+ZmxhZ3MgPSAwOw0K
PiAtICAgICAgICAgICAgICAgIHBpcnFfY2xlYW51cF9jaGVjayhpbmZvLCBkKTsNCj4gKyAgICAg
ICAgICAgICAgICBpZiAoICFpbmZvLT5ldnRjaG4gKQ0KPiArICAgICAgICAgICAgICAgICAgICBw
aXJxX2NsZWFudXBfY2hlY2soaW5mbywgZCk7DQo+ICAgICAgICAgICAgICAgICAgIHdyaXRlX3Vu
bG9jaygmZC0+ZXZlbnRfbG9jayk7DQo+ICAgICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4g
ICAgICAgICAgICAgICB9DQo+IEBAIC01MzYsNyArNTM3LDggQEAgaW50IHB0X2lycV9jcmVhdGVf
YmluZCgNCj4gICAgICAgICAgICAgICAgICAgICAgIGh2bV9pcnFfZHBjaS0+bGlua19jbnRbbGlu
a10tLTsNCj4gICAgICAgICAgICAgICAgICAgfQ0KPiAgICAgICAgICAgICAgICAgICBwaXJxX2Rw
Y2ktPmZsYWdzID0gMDsNCj4gLSAgICAgICAgICAgICAgICBwaXJxX2NsZWFudXBfY2hlY2soaW5m
bywgZCk7DQo+ICsgICAgICAgICAgICAgICAgaWYgKCAhaW5mby0+ZXZ0Y2huICkNCj4gKyAgICAg
ICAgICAgICAgICAgICAgcGlycV9jbGVhbnVwX2NoZWNrKGluZm8sIGQpOw0KPiAgICAgICAgICAg
ICAgICAgICB3cml0ZV91bmxvY2soJmQtPmV2ZW50X2xvY2spOw0KPiAgICAgICAgICAgICAgICAg
ICB4ZnJlZShnaXJxKTsNCj4gICAgICAgICAgICAgICAgICAgeGZyZWUoZGlnbCk7DQo+IEBAIC02
OTMsNyArNjk1LDggQEAgaW50IHB0X2lycV9kZXN0cm95X2JpbmQoDQo+ICAgICAgICAgICAgKi8N
Cj4gICAgICAgICAgIHB0X3BpcnFfc29mdGlycV9yZXNldChwaXJxX2RwY2kpOw0KPiAgIA0KPiAt
ICAgICAgICBwaXJxX2NsZWFudXBfY2hlY2socGlycSwgZCk7DQo+ICsgICAgICAgIGlmICggIXBp
cnEtPmV2dGNobiApDQo+ICsgICAgICAgICAgICBwaXJxX2NsZWFudXBfY2hlY2socGlycSwgZCk7
DQo+ICAgICAgIH0NCj4gICANCj4gICAgICAgd3JpdGVfdW5sb2NrKCZkLT5ldmVudF9sb2NrKTsN
Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pcnEuaCBiL3hlbi9pbmNsdWRlL3hlbi9p
cnEuaA0KPiBpbmRleCA5NTAzNGMwZDZiYjUuLjYwNzFiMDBmNjIxZSAxMDA2NDQNCj4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL2lycS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pcnEuaA0KPiBA
QCAtMTg1LDkgKzE4NSw2IEBAIGV4dGVybiBzdHJ1Y3QgcGlycSAqcGlycV9nZXRfaW5mbyhzdHJ1
Y3QgZG9tYWluICpkLCBpbnQgcGlycSk7DQo+ICAgDQo+ICAgdm9pZCBwaXJxX2NsZWFudXBfY2hl
Y2soc3RydWN0IHBpcnEgKnBpcnEsIHN0cnVjdCBkb21haW4gKmQpOw0KPiAgIA0KPiAtI2RlZmlu
ZSBwaXJxX2NsZWFudXBfY2hlY2socGlycSwgZCkgXA0KPiAtICAgICghKHBpcnEpLT5ldnRjaG4g
PyBwaXJxX2NsZWFudXBfY2hlY2socGlycSwgZCkgOiAodm9pZCkwKQ0KPiAtDQo+ICAgZXh0ZXJu
IHZvaWQgcGlycV9ndWVzdF9lb2koc3RydWN0IHBpcnEgKnBpcnEpOw0KPiAgIGV4dGVybiB2b2lk
IGRlc2NfZ3Vlc3RfZW9pKHN0cnVjdCBpcnFfZGVzYyAqZGVzYywgc3RydWN0IHBpcnEgKnBpcnEp
Ow0KPiAgIGV4dGVybiBpbnQgcGlycV9ndWVzdF91bm1hc2soc3RydWN0IGRvbWFpbiAqZCk7DQo+
IA0KPiBiYXNlLWNvbW1pdDogYjUwNzBhOTU5NjY3ZDYwZTYyNzAxN2Q0NGZjNWI1YjFjNWU5ODc3
Nw0K

