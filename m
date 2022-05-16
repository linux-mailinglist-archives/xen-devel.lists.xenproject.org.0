Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2277A528514
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 15:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329854.553123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqaWm-0002SV-67; Mon, 16 May 2022 13:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329854.553123; Mon, 16 May 2022 13:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqaWm-0002P4-2x; Mon, 16 May 2022 13:12:48 +0000
Received: by outflank-mailman (input) for mailman id 329854;
 Mon, 16 May 2022 13:12:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AqC=VY=citrix.com=prvs=12853b261=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nqaWk-0002Oy-8S
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 13:12:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd74a941-d519-11ec-837e-e5687231ffcc;
 Mon, 16 May 2022 15:12:42 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 09:12:34 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by SJ0PR03MB6566.namprd03.prod.outlook.com (2603:10b6:a03:38a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Mon, 16 May
 2022 13:12:28 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082%6]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 13:12:28 +0000
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
X-Inumbo-ID: dd74a941-d519-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652706762;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=LwCAE6ZtINNuQJhbxTZl9B9CXEjmmWn/dfADWQjpWtw=;
  b=eqOwSLh1g9bHi8nqjqVMaicxYKv6St56Pp0WkQ3h8a754D7AMmjOPxnQ
   Imv4Q0hl+G9mqig30H2xyoXhTSuZRkw7d0SkZEIbgXiA5qgEPaRMBb9BK
   GowQzMN+UDwiaIVMJlL7n/v+yy8DSvfFWXEz7pb0kfq/q6dBQ9qLAcQWP
   M=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 71261993
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qlvQsK3cqisx3fqNCPbD5Xpwkn2cJEfYwER7XKvMYbSIYQITYwd3j
 TtIBzjCf73ffDO2KOnCW/228UgPucSBndJmSQU6qHhgFCMV+JWUXY3DdEz5NC2fcZObFEs+t
 5lONdTKJ5s4QyCA9k3ybeOwpnV3j/mGSuKtYAKo1lidYCc9IMt2oU4zy4bV+7JVvOVVIz9hm
 PuurcOBaAD0h2B9aDhMtvPepkk35ayi6GJB4AZgbvkXsQ6CmyEZAqxEKPDqJRMUYGX18s1W5
 Qrn5Ovklo8M1051UrtJqp6iLgtSBOS60TGm0hK6YYD76vR5jnF0g/9T2MY0Mx8N0W3Uxo0pk
 r2hiLTrIesXFvyU8Agie0Ew/xFWZcWqL5eefBBTGeTKp6H3WyOEL8dGVSnaDqVBkgpDOklc9
 ORwFdw4Rkvra9RaYl6MYrIEaswLdKEHNW6E051q5Wmx4f0OGfgvT0hWjDPxMfhZas1mRJ7ji
 8QlhTVHXDvwRAVxHlotNZ8dsuD431rQKGNTkQfAzUY3yzC7IA1Z9pHIaYCQVvnUAMJfkwCfu
 37M+Hn/DlcCLtuDxDGZ83WqwOjSgSf8X4FUH7q9nhJoqATLmipPV1tLBB3i/qTRZk2WArqzL
 2Q79y00oqV02FGtStDldxa5vGSFrlgXXN84/+gSt1jXlPOFsl3x6m4sdR0Cadd3m8gMGTEI3
 F6x2P35WWNEv+jAIZ6a3vLOxd+oAgA3AnUFfjQsVhYe7p/op4RbphDFQ8tnEaW1psboAjy2y
 DePxAAUiq8Pl8cN2+Oe9ErenjO3jpHTS0g+4QC/dmC46gJ0Yqa1aoru7kLUhd5bN5qQRFSFu
 HkCmuCd4foIAJXLkzaCKM0dEbfs6/ubPTn0hV90A4Jn5zmr42Skf41b/Hd5PkgBDyofUTrgY
 UuWtQYP4pZWZSGudfUuPN/3DNk2x6/9E9ijTurTctdFfpl2ckmA4T1qYkmTmWvqlSDAjJ0CB
 HtSSu70ZV5yNEit5GPeqzs1uVPz+h0D+A==
IronPort-HdrOrdr: A9a23:8lDvY6iswfb1rE7TmvQJSXvz+3BQX3Z13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICPoqTM2ftWjdySaVxeRZgbcKrAeQfBEWmtQ96U
 4kSdkHNDSSNyk3sS+Z2njfLz9I+rDun86VbKXlvg5QpGpRGsNdBnJCe2Km+zpNNWx77PQCdK
 a0145inX6NaH4XZsO0Cj0uRO7YveDGk5rgfFovGwMnwBPmt0Ln1JfKVzyjmjsOWTJGxrkvtU
 LflRbi26mlu/anjjfBym7o6YhMkteJ8KoDOCXMsLlUFtzfsHfrWG1TYczGgNnzmpDq1L8eqq
 iOn/7nBbU115qeRBDynfKn4Xic7N9n0Q6f9bbfuwqtnSWxfkNFN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3amBa/n7/nDE3kbKvNRj+UC3a7FuIYO5bLZvjn99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8PC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8e166MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBkPkoLVeLmzNbFwg2DwqT+GLEXQI+lllutEk6y5Qqb3OiueT11rm9e8opwkc7jmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.91,229,1647316800"; 
   d="asc'?scan'208";a="71261993"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bc1NYI+VQNdr5rF8KtGIajotkrn9Jht9UF2xUKB0WCI91EKurTFRqHmUaBwqFZG11j84jBH/R79VlniuIpWoohKggPb46GjMEwEWUNbK86qCo1vTady/mAvW0f0RxVlo2B8sT+rsLtFAlj/UgIoEalfEu6243ITAgte3DSEKowSkXxSEh9sT3IRqQUBVuOEFd0+mVetF5ZKttMeqlTHrzV/pYi3m+zX7uD4QHAPxAljTaCsy5qpw/qqd8/ABh7Qz3S18Hog1K0JiveI5eeTef3FZY+PK0Gb33GqC6dpKBpQmZpq8058sYQAzksNvmxKnBLKEwrCsEuQJ3erGN399rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKXxXWjlAnBX6O9S2wmMAnhdNCGKvYLYpa8g8VZ/jIg=;
 b=fC9FO9aXcLJgmYEkIlr2eXdu70rggOmezAJdB1uo1H8vwzBeEWZUK3yzPVuGJfu1A24h5plZBa0mJQg9wbm8tZZSSJVirMVXEND/rEM8rrZuQIgGGeY3QaNfpTXCArWe1U3eURF5zhbFsRnKEZCNBKpLfH4cJ5tdS7210DH95xnmEaSJIu5UpXTOllKUAhKYWOPvDe4ZAbZYTPA9JTgwFObd/rPviCSzHq4Gx4aKRMrGMHTdXKVq0QoLjTqxUWXAOw6RSfCLZkJpjHSJKILkjOhfzITl0l2KJM25980SgNfPeNxndSQDxVxn0YTZ/mmZAZJKnh+14RaaMibuYO4LEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKXxXWjlAnBX6O9S2wmMAnhdNCGKvYLYpa8g8VZ/jIg=;
 b=JWt3ZHSZerYHeBcWilTAucVpdFc7ZzOG9+NmGC6k5swzuMb+WLPk+lXV5ujYI7BJg+jt95RV5MSU7E7nY0r0HETLxYcHI8Z38fV5uCzHG0t4iEilXqK/RU0CSvkDnnd3KWnBgzhlh1iV57rfd+Sd+Qtwb8fvNkk0U5f3S8dXKxk=
From: George Dunlap <George.Dunlap@citrix.com>
To: Juergen Gross <JGross@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: Process for cherry-picking patches from other projects
Thread-Topic: Process for cherry-picking patches from other projects
Thread-Index: AQHYZtZ1suK3TAKIFU2tuY9R7u+Tcq0c5HqAgASbAoA=
Date: Mon, 16 May 2022 13:12:28 +0000
Message-ID: <F88CECAA-BDBE-40F8-81A8-642F47AEEB62@citrix.com>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
 <2f2f10c1-e0cb-7274-1879-6f88c2517c47@suse.com>
In-Reply-To: <2f2f10c1-e0cb-7274-1879-6f88c2517c47@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb368670-05a5-4b8d-b6c8-08da373dba6c
x-ms-traffictypediagnostic: SJ0PR03MB6566:EE_
x-microsoft-antispam-prvs:
 <SJ0PR03MB656697C8BD01F4E5652DD64F99CF9@SJ0PR03MB6566.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FdLaTVTZqBgIHqa1coxqEKkWX6dgTgrqciPurnOkB+agoipz5Pz8ML4TesXoDwOdRd1rN2EOINjq1s3i+uc/ypXDIHlBX+GDvUSZt8yVAf+l3HE21GG2n+YuDwEzi4ix9GBpZ20ddeFuhokXZ3Gf3vuoJj0puz5ccybQ6sav6rvxFAHeGLlysicbBhfOl2LunAKdptRYUJk1N2delcLPIH4YWuSPCS6Fs/4s3zY0So9rFmCEG+x3BOtZt4I6hnYPfOYXQVQiiIdKvaSvlKicsT4zcR8SsQT36YVjbs/CNOlSzQ2kLKLVF1aIkVhL8SaUxPys69KgdgYwdqgLq7LxsdAAEcoPPsRk5LER2bcoNxfmN1oqcuG0qMnaYXST2jKOtxKR1xD7cR2RUTallJAC4rW3sfyaSCFyKCvDdXJH3KWZIDzxjLCRj8nmB54ef7zkj3IoZm5rpMCABwQR0HVN0vPskmqnsnW1X/emmtOl4gPP1U8zLWGstW7bltbpbsvrBpxNV9tNPVGX4uFhjhN+2fZk/4vS9cQRyAv8WMaeO3a77h7vObR1Mr3tw+ZMfbx2pVuUjhP+38us7YL8So4HnTvhY2iLnDzfIfAqZjGPkBsgl2cIf1EPDRW8eCgh/K9Eug6KsSdlXDsyRN9qZvNJOUKavfuzcWCL+VaMVVAoRNdCzo5+LNbYYltvdfVfqe/2E8nuMM96L+qt1SFgl8sqorbDgvlXYDduhNJRi8OXx8g2oXP/JdlK6N8xdVXkNsxhI5lr58/70Eizyb6wPQEM0SQ/jkMK6TAieNl4o7RKQ1kobqsAvzAWaKQ//4cDuT6TJoyadRe8IAq1CBJqz48tnw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(99936003)(122000001)(2906002)(38100700002)(38070700005)(54906003)(82960400001)(316002)(6916009)(6512007)(83380400001)(84970400001)(186003)(5660300002)(508600001)(86362001)(6486002)(71200400001)(8676002)(64756008)(66476007)(66556008)(66946007)(76116006)(4326008)(66446008)(91956017)(8936002)(6506007)(53546011)(26005)(36756003)(2616005)(107886003)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWc1L3AxRlp6R3N0cVFmeUltMHBhNnIzU1NTNUVqQmU4Sk5IUi9OS2ZYRW55?=
 =?utf-8?B?TGZmWkdkdXZzbDdhekxrSFEwQ3ZCdDdRMDN5UHc0UkQzWUVEYnZrMTFOaTEz?=
 =?utf-8?B?WGhjQ0VQNElQR05ZNFoySHRaRWpYUFd0Ly9PRURVNmN3eFkxZktmR0t0MWhI?=
 =?utf-8?B?bW1iMFA0THFQcnFubzMyNDNPSmlDU3B6T2VLWFlabEx4VnBsOWowSm9XbGlu?=
 =?utf-8?B?WVo4bEtSSXlXck1ZcVJaK25GdmE5Z3doMi91UnV5ZTk3VFlYcG1COXdIakpS?=
 =?utf-8?B?UzcwNGhYVnVGVldHZHVURldkT2FWaU4wRm5JeFRUZUVaSWg2b1BVR1ptVkpI?=
 =?utf-8?B?ZVdRTDJaeTNtblhJSENHbE9MZSs4MW9oNG54dSs5NTdoaWw1clB0WHhyRlY5?=
 =?utf-8?B?TFViM241b1l3V0gzMlpLSXlBRlVkQ3pJT2xLZ1YrRjFyZ3VHYWNrdTJvVTFr?=
 =?utf-8?B?Q29RV1J2MTd0NThsZ1gyV0ZDclNwRml3d21ONHR2U3JZMUplN3FMS3N3KzRr?=
 =?utf-8?B?b1NuSVZyd29HcTAvbks1MCtyVGtBL3Y4Q1ErQlh5WHZWUjBPQ3B2aTU2Z0c4?=
 =?utf-8?B?VTMzeEZhbTRVSFVTRlVPVklJQVB2dXBDZE42VmhWdGNuUWNobW9jRFV3aVJo?=
 =?utf-8?B?SW1zZnhmc0Q3QWIzM3RCNk1EdDNzTUVaWTlNcDFHUlp6T25CNWFrRWZaaElP?=
 =?utf-8?B?M0drSDU2OXdmSHI2Y2JWMTB0MmFYYWF1azR5ZGJlNFpnVkRJeUdjYWYzSU5Z?=
 =?utf-8?B?VDhUclIrQWhBN0JKY2N6SlhrbUtZNGx6NnUvbjZ3VW01KzJjUTIxem0yQ0py?=
 =?utf-8?B?eDJCVlRvOWlEb09lN0VqMk5wM1o0UFR1cTlOb0NLTGZ6eVJacnZrbjdlZDRV?=
 =?utf-8?B?ZkoweWdBei9sRjUrL2JaSFlmVnhGU0szS3JYdVZDeFFFYzBoT0p4R09sTlpi?=
 =?utf-8?B?ZEZjWmUxSFcwTXZtT2RncGNLRmlEMm5iTXJDbDJ6N2xUUFFwQzMxc2Z1ODRK?=
 =?utf-8?B?SG5yZXBCak95UEpaOW01d2hGMk5yQmxtOHpYa0ZZdlhDdzV5SlZ1OWplUWdL?=
 =?utf-8?B?SDhqMHFsMlpXNXBMNEo1KzdIWlU3a2ZraWt2aTlYMk5jMkVMamJ3MnVMS1lQ?=
 =?utf-8?B?bFp1MWd6SXNJY0xQNFZ5VHZmRFJIemkzeXNpRUE1QzY0ZUFNL21IbE5BN2E0?=
 =?utf-8?B?UGRrcXBLTzZkRnV3S212SmFaaWNaaVRiQXhEdE0reDIvQnBDRFZIaC9WYlJW?=
 =?utf-8?B?ZXJHak8vNkRSdzJ3Q3diR0lFeWE3Sko4cmRPYWJBYmVVRHI2czV3aFBTVVRn?=
 =?utf-8?B?UUNDcXN2REFzZS9XSHErMm1YZkVIVGdKY09lNjJTMlJHM1NjbTRYTjN2cmsv?=
 =?utf-8?B?TEkrc2dhSE43V3orN0ltbExXVzhZN001aHpMVUo1ZGFQUTdYWEdQRzA5UXFQ?=
 =?utf-8?B?dFU2N0oyaUp1NXlmeFViZzczclFLL09oVEkzc3NyUVZLWmdSRUNxcCt0amtB?=
 =?utf-8?B?N0NyMktzVGVEbGpzNVFuZHFkek45elZCNEt5Yi8rWVRFNkIwRFFGWTg4VDM0?=
 =?utf-8?B?ZjQ0emIyZVNPNERGLzI0QWlISjhwY3FOQjdRcFpFSUE1R1NTekJmT2k2K2wr?=
 =?utf-8?B?T2dncjNoOUtXaHF5S3JqdWs0ZXFkdjlVZk9uV3RzdmZXdVVtMEdvSWZua1J0?=
 =?utf-8?B?R3RWYzZsZkJlL083d3o2d0g3djNjakRzbE1ONW01bU9YbGw2UjBVbHhxN3BF?=
 =?utf-8?B?cEh2OFA5Y0Y3dVNIbnpDZk9IazRCR213TitQbkV2U3VnYlZJbWNGMVQ1ZEMy?=
 =?utf-8?B?aGtqWWFpK3F3K3BDUFJ5Zyt2YkU0cEhUTGxrTVFJYTVGajVQVEg2NGxWQ2tE?=
 =?utf-8?B?eDZKa3hnZHpCYWhFTldtQUFPaXRsU2Zrc1oxL2k5ZVltNi9heUpxcUpuTTZm?=
 =?utf-8?B?aWNHMkdzbWgraGVIaFk2ZCsrL1poYmJHZE5oYldjbVc1Q0VEc3o1SlhaTHp2?=
 =?utf-8?B?MXhuYmlENXYxKzZWQWhTM1dVWExHK0xzK2tNdTBiUUhNMlE2YWx5MGlJbktG?=
 =?utf-8?B?WFdBcHF0THM2OXFsNmwwWE9HZU1memtlY3ZmSDkvOThQUXNRdlJHWWVWYUFp?=
 =?utf-8?B?N1VGaXk1dDRwVnUreXBscis1QUx5SU9UMjJCbGhwTDZFUUR0TGtteXNFRXlH?=
 =?utf-8?B?T283Q0N1UUxVdlBWZEo1Tkx6UU0ybWtzVkRXMExqckQ5eTd4cmtVdE9VL3c4?=
 =?utf-8?B?b0thYTdCcFNIRFh5bElOOWZPRlV3TWdGSllzdHpyR2xGa0xJT3B4MGtMT3l0?=
 =?utf-8?B?ODZsdTQzSG82NXIvdGVKMHJ3QWtBbng2bnllbklac21oZzdkRUZ6MUxwT040?=
 =?utf-8?Q?PImktMdx5Ob5jGes=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_02A39AAB-CDBB-4487-ABF6-0DFCE6BA5628";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb368670-05a5-4b8d-b6c8-08da373dba6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 13:12:28.6253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C4KaD5IYqMgYXSuJIbsb2e6D082Kj7cSoi/RTPWNnp6ACRSFFYaZHBNdZ3hHD997rCdeKsjMu39zb+qN2c8zho9RfPVx3VERdUKhqCpEuyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6566

--Apple-Mail=_02A39AAB-CDBB-4487-ABF6-0DFCE6BA5628
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On May 13, 2022, at 3:52 PM, Juergen Gross <JGross@suse.com> wrote:
>=20
> On 13.05.22 16:33, George Dunlap wrote:
>> Starting a new thread to make it clear that we=E2=80=99re discussing =
a wider policy here.
>> This question is aimed at Jan and Andy in particular, as I think =
they=E2=80=99ve probably done the most of this; so I=E2=80=99m looking =
to them to find out what our =E2=80=9Cstandard practice=E2=80=9D is.
>> There have recently been some patches that Bertrand has submitted =
which pull in code from Linux ("[PATCH 1/3] xen/arm: Sync sysregs and =
cpuinfo with Linux 5.18-rc3=E2=80=9D), which has caused a discussion =
between him, Julien, and Stefano about the proper way to do such =
patches.
>> The =E2=80=9COrigin:=E2=80=9D tag section of =
xen.git/docs/process/sending-patches.pandoc suggests that there are some =
standards, but doesn=E2=80=99t spell them out.
>> The questions seem to be:
>> 1) When doing this kind of update, is it permissible to send a single =
patch which =E2=80=9Cbatches=E2=80=9D several upstream commits together, =
or should each patch be backported individually?
>> 2) If =E2=80=9Cbatches=E2=80=9D are permissible, when? When would =
individual patches be preferred?
>> 3) For =E2=80=9Cbatch updates=E2=80=9D, what tags are necessary? Do =
we need to note the changesets of all the commits, and if so, do we need =
multiple =E2=80=9COrigin=E2=80=9D tags? Do we need to include anything =
from the original commits =E2=80=94 commit messages? Signed-off-by=E2=80=99=
s?
>> And a related question:
>> 4) When importing an entire file from an upstream like Linux, what =
tags do we need?
>> My recollection is that we often to a =E2=80=9Caccumulated patch=E2=80=9D=
 to update, say, the Kconfig tooling; so it seems like the answer to =
this is sometimes =E2=80=9Cyes=E2=80=9D.
>> It seems to me that in a case where you=E2=80=99re importing a =
handful of patches =E2=80=94 say 5-10 =E2=80=94 that importing them =
one-by-one might be preferred; but in this case, since the submission =
was already made as a batch, I=E2=80=99d accept having it as a batch.
>> I think if I were writing this patch, I=E2=80=99d make a separate =
=E2=80=9COrigin=E2=80=9D tag for each commit.
>> I wouldn=E2=80=99t include the upstream commit messages or S-o-b=E2=80=99=
s; I would write my own commit message summarizing why I=E2=80=99m =
importing the commits, then have the =E2=80=98origin=E2=80=99 tags, then =
my own S-o-b to indicate that I am attesting that it comes from an =
open-source project (and for whatever copyright can be asserted on the =
commit message and the patch as a collection).
>> And for #4, I would do something similar: I would write my own commit =
message describing what the file is for and why we=E2=80=99re importing =
it; have the Origin tag point to the commit at the point I took the =
file; and my own S-o-b.
>=20
> IMO we should add another tag for that purpose, e.g.:
>=20
> File-origin: <repository> <tag> <path> [# <local-path>]
>=20
> Specifying the repository the file(s) are coming from, the tag (e.g. a
> tagged version, or the top git commit), and the path of the original
> file(s) in that repository (<path> could either be a common directory
> of multiple files, or a single file; multiple "File-origin:" tags =
should
> be possible). In case the file is being renamed locally, its new name
> can be added as <local-path>.
>=20
> This variant should be used to add _new_ files to Xen. In case of
> updating a file which has seem lots of commits since its last update =
or
> introduction, it might be easier to just use the "File-origin:" tag,
> probably with a note below the "---" marker that listing more than <x>
> patches (x > 10?) or splitting into more than <x> patches would be
> just useless work (common sense should apply here, especially =
regarding
> the readability of the patch and the related review effort).

You don=E2=80=99t mention what to do about SoB=E2=80=99s =E2=80=94 I =
assume you agree with my assessment above, that a single  SoB from the =
submitter of the patch to Xen, asserting that they=E2=80=99re satisfied =
that all of the code has been asserted by other people as having a =
suitable license, is sufficient.

In which case, barring a contradiction from Andy or Jan as to our =
standard practice, I think that we don=E2=80=99t need to collect SoBs =
from the original commits; a single SoB by Bertrand (or whomever) that =
it all comes from Linux and that suitable SoBs can be tracked down =
should it become necessary, will be sufficient.

That should be enough to get the specific patch currently under =
discussion from the ARM maintainers un-stuck.

 -George

--Apple-Mail=_02A39AAB-CDBB-4487-ABF6-0DFCE6BA5628
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKCTbcACgkQshXHp8eE
G+313gf/Q6EK6H6hzG+C6gu1rBzgDa9NNdB39v9XoE6EWKkmSEB+WRoYvRb1jmHT
xo1VxJgn9QoiyCawQx5DR+8ys9j1guzrjMjn36W7kvrgSEBFks7waM05NTIVfFO7
XXFagf6ka8w8pSzV96qFyNaGElwDb5YN8vchMK0wXlygpjZuflQm2GkNRhm78jc4
01uD/a6nmpUIDRSWnHWh6y/iJ/3sCbUQg/aRBYPugThy4aVzdQXcb9AWOLciR68P
1FbvXNSv4N1ul6syUmuoae62avBIgS5oZsnzNE1tIpvW6fm3DIf6R24aPR/IuyGH
8KWc2HLCGm0UJM9LqI1jxeWGT90NSQ==
=fbtN
-----END PGP SIGNATURE-----

--Apple-Mail=_02A39AAB-CDBB-4487-ABF6-0DFCE6BA5628--

