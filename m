Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE3A749B1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 13:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930544.1333155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty8gJ-0006F5-LU; Fri, 28 Mar 2025 12:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930544.1333155; Fri, 28 Mar 2025 12:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty8gJ-0006CV-I6; Fri, 28 Mar 2025 12:19:27 +0000
Received: by outflank-mailman (input) for mailman id 930544;
 Fri, 28 Mar 2025 12:19:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gne4=WP=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1ty8gH-0006CK-FS
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 12:19:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2614::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e01d2aac-0bce-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 13:19:20 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7313.eurprd03.prod.outlook.com
 (2603:10a6:20b:273::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 12:19:18 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 12:19:18 +0000
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
X-Inumbo-ID: e01d2aac-0bce-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgeOT5+k4fZL2bo7EMZAAGwXoORtRticJVlOT9dVjUiCaDQHlyjwUflljHFQhdnP3qFc/tRJkhFwkshn3oYUUQyCljk0q8yMwJ0qHC7Deoos/GmZPolKInq3iR67LAEh3wv5/F0tvJWVoVvm0Gl5BsBuRB/eAhC/VIbuj+CbmWUhyy3Z8fmM0uu7X4xXIZdVxU0xeL14QxM5ko9xBFMvy4q8K0AvTjazvhjT1AyReAqjtadlIEu/c9MjvudcXBiqe1Q73sI+zNVtT63dIVmbewxUu3qQh6pIsz2qky2k2+JybKtWtwG3ldAXz6f3uBVbaRO36fQLlZAdgQLIZD0JvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DRzRlJHjWJGlq7RFK3uImRpdrIpG2J7us3Oyxd8+Y4=;
 b=v1SQddNMGKeqm5uezPaWpCLAVPWCq7JK9u12Mtv7eBs+PAvdhT7GgJsn0kxo+fpJyYPTrYb920dZTHRdhz3eoib7lQJpaxf62BfV1CuKBuHNUxAZkTOsJfVayNwHw8kuf4ODDqTrnW77Pc3IW1hqRxXHCriNo5uV+PJZ6FlV0279CgK5nmRmOL+Y7YkHYx+QGnzzLiLBEpYq+jTEJBVeReKXFGzpCGqBnDm+84j8po2Cn02xhX9XVszRVYUZzQT0Ph7/mkR18kCrCmD2Dq0se7jVGPmTPX3KrE6iNiiK/rYO1A5keqlLjTZvSHaVXimxfUdV4HQ31cQ4H4zT+9uSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DRzRlJHjWJGlq7RFK3uImRpdrIpG2J7us3Oyxd8+Y4=;
 b=WgGhJRzzdYWeYsi83pqwHzEs22nqWyxjWjQjDYkRwF27WsGZ1nVJtcHsCpgnB0tjGhwF+62ikpxBBVONFG7qPeaXMWm4heauv6b9r1gxcmoCIyq5zpOZ7F5nDnixFxzvGPGV8vWJbzjjRyu9EKO0q0FaBnpe4Y+HD86Otf2snBwe07GulpUULraFsgHU9YBa1YccU+Lhohq646BB59SAMYXnSlkRNIfanYF9M1LIGsO6cJ+f4Pn/tQPCvpjuir4xcu6OtfCdfeWLk8nRuROPvbM2dHjggE+Gl2jfbTXEFlhWpU407aHaW5I1IhTPo/rue9BkpsDWit3NegkAW4GtOQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] Enable MC/DC support for GCOV
Thread-Topic: [PATCH v2 0/3] Enable MC/DC support for GCOV
Thread-Index: AQHbn9ugAFJGRLwMF0+KrTTxxLbOJw==
Date: Fri, 28 Mar 2025 12:19:17 +0000
Message-ID: <20250328121902.2134020-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7313:EE_
x-ms-office365-filtering-correlation-id: 236b569d-1d04-417e-a583-08dd6df2c32a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WGUzeENsdGJUMFVJSmtiMWx4VjBsVDdJMEpYVjZRV3F6Tk9yOEU4eXNrNGZU?=
 =?utf-8?B?T2Nna2pZbVlRajhkdFVSMHZDcUt6VjBQQkowTHo4K3VnYVdGY0dGZXRXNDBX?=
 =?utf-8?B?MXl3VEZXMWhzbDRlZitOMHNubDJxS01yTndLYzdMb0tPYUZDZWIyY0FTK1Qy?=
 =?utf-8?B?SWVGdi9xb2tBOGVjL3NORGJSQnlMRmFwbG1Ud3JGQlhpMnRXdTNFYlRaejBl?=
 =?utf-8?B?eFJHMzdOM1gzc3d4ZXVJSDdDTUpyckNVdjJidmZjZWkwdmxndU82L3AzaFRq?=
 =?utf-8?B?ZnBvUGo2VjBZQlZRNll1cStuRTFGMHNLTGxQM3BUK2VtZURjd1RJZUdjZGly?=
 =?utf-8?B?alhFS3lzd3pMMUdhNGNtanc1Y2wySzRaNzlYa0liWjFPZnpKV1d0VmlUVDFq?=
 =?utf-8?B?WUh6bWJrUTYzNzlKNXIzenRMZTRUa24rRHpvR0srcDRmMUIwbnZNUmlWV0Ez?=
 =?utf-8?B?ZisyYVQ2ZnlNT2haM09HSmZaclo1NWdvYkg1c3l5WCtvUWIySHk1V0pmNmwv?=
 =?utf-8?B?dkVFUXVXZVR6ZHNESHpZYjBSSFdHT1g3L0VnY0dtQy80S0ZlVjVyQVdweDhB?=
 =?utf-8?B?ODhNVmxEUTdFMXNaQkN0MERIT2NKLzBmT0F5b1VNcVpZZFpYQjdVYVRtNXBH?=
 =?utf-8?B?TU84SEhvRmRXNjFpTElZQldNcUhzTmthRDhoUDhQZXNVRTlHRUVWVFVJSVR5?=
 =?utf-8?B?SzROVC93ZHFmanBsWEl6SlRtK0RxUjhaMlg0UHRJVWVra1dSRUs5Z3RKdm9B?=
 =?utf-8?B?UGpXOUYyQ3JzWUszU3RVeXJTK2NYeVJaVjFjUVZ1NW1KdEJPc01saEhRek9u?=
 =?utf-8?B?QnlhdUc4K1FhRnJuTTZQSUNjNlNxRmNqMllaTVhDazM1ZjhoTlJ3a2FCdlJ2?=
 =?utf-8?B?cENNMWdrZFp3OTRwNlMxVGxXRUp1UDB6WE1Pa1ZFU0NURUlZdFAvSEpOcjRB?=
 =?utf-8?B?RFMzWGNnblUyeTRxUGZaY0hndzBsTnRHMWI4QTl6R1p6R0RObndnUFBGWFNU?=
 =?utf-8?B?bGJ6YnJRZlFlRU5mTWVsWHZ1WGM5dHBFTFBONnVVUTk4aEx5YnpIRVdyNU9s?=
 =?utf-8?B?eEpoc1VHU2h1Z1QranEzcVNrSkN0ODNkendWV1NCYVF1QWJ2NGVPZXg3Q0Vi?=
 =?utf-8?B?cjhzY0hvTkpoOFpTbHR3d0NBTVh3MGh1QlNSUjN3eWNDYS9XdTFBRzBIdG9s?=
 =?utf-8?B?dDMwN25jVFEzcDI5UkRxTkVPMUdWYnRmdExya21TTnpqTkNCS1U1eHhqQjlq?=
 =?utf-8?B?OHkyYVd6MGJxNlk4OHZQQzNQOHFrTU5sRnQrTkZCcnA1WTNqY2ZOQlp1cTdo?=
 =?utf-8?B?VW5OTWpleGRuRTk4RXhCTUhDSWRvM0ZmLzlXVm94SkVPM1FOYXhTU0hhNENZ?=
 =?utf-8?B?RytJYWVmOGVOd1Z6MjZ6bkJGSmpPUUh0amtQWEUxZHUweWJqekNGZkt0dEZr?=
 =?utf-8?B?WXJVQklGNmo5b29na1FjdnpzR1RWLzdXYzdYdTR5empRekVRZ2lkNVF3WlJy?=
 =?utf-8?B?NE5aOFlPSHJ1M1N3UDdsMytKNmFyMXBJOW15OVNlLzJFdC9KNy96Z2lFY2Vy?=
 =?utf-8?B?RDl6RjE0ZmgweGtSejUzc3JKMzVpSXlEdmJVZjNiUi9hMU5iQlBWY25DYnJi?=
 =?utf-8?B?dEFRVENJMjNPTVRteTRXZlBLa2h4bjhVRWxvWkg0S1puaE9uQkFxaGpPWTFs?=
 =?utf-8?B?V3labEdsdGtUdGRKQ0FHN1dmSXRwMDgvYkNpWEJyTzNZM0Y3clJjd2NYdmVr?=
 =?utf-8?B?d2IxaDEwZnB0U1ArVE5rclJKc3RMUXdTcys3QVM3SForU2RzTlhmdU93ZGkx?=
 =?utf-8?B?UFR5azJGZ2dQNmUraHBvVnFjWVc3L1Jqb3Q5T3lLdEVyR1psQkhadllHYUVN?=
 =?utf-8?B?N3ozd2R4V1U5dGF6VUg5VWU0Y0NUUFFFekVaTlhjM1AvWE5rS1B0a3hjbjJK?=
 =?utf-8?Q?Eshr01WGbe77ExqJyr+N5Xwx1Knc2MUR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0hrZyt1VXVVaEs5akxud2d0L3JnbUJJcTh1QWFsbTc1NjZPdFNMdkl0Wm5i?=
 =?utf-8?B?WC8xVWVCNlBENkdPNHRKbnJZNXZkdkRiSWdtcUpGczIzbGpxNlJUZDZNNFVC?=
 =?utf-8?B?Z1NzczJ2UU5UWjhQVEt4a3dsU3VXWUpMWXdaUnNFRk5qWVdIMGpxVHBHUDhy?=
 =?utf-8?B?c0YvV29WdUgydkUzVWd0TXUzQ1dTc3d2UzNiZ0hsZEh5L1J0SWdJa0dBdU1N?=
 =?utf-8?B?V0l2by9IWUFvQ2JieFVIYjZucXVBYTl0RENrV3U4Y3YxdjdObVZOMGRDOXFN?=
 =?utf-8?B?cStkNWpRVE4xVHFPMnZiNy9YNzdRRmM2ZjlSUnBvYUdPK3JwVDZqTEM1VDFx?=
 =?utf-8?B?dktYZU9iR2dDRG5YcXpSUERUU0ZNK2VXdTNrSUM2QjFHSVZpM3o1RHdBTC9s?=
 =?utf-8?B?Z0lDZHl4RnBaMURvWmRCYXc4bTFmdlBrc0tyVFhKb05QV2NWeThLWEMzL2NC?=
 =?utf-8?B?SGp2MUxrOHBPOG9WK01GNHhKcmZqVEpXUkxhb3NkakFSeHZUUVc3OFRSZG1p?=
 =?utf-8?B?Vzk1bGFjK1ovaVdQSHF4alNGblpQdU1ESDNzSXRwZjMrb3RpRzBmWHdZUWNI?=
 =?utf-8?B?NkdidEtTbmkwRmhDN3hLK3JKRDBhRG1vblZ5eUxkM1RSbkVUWUtvRnJETG1x?=
 =?utf-8?B?WHdvNjU5alQ3KzBlSHdkK2J0a2hEaVR3ckFDM3VQV2I0N0FBNzlEeUtEazVt?=
 =?utf-8?B?a0FFYndjWTB2Wi9UT0xycGdpL2tYUDVRKzRTWTRWdU9sTUJvZFNScFJHNHlN?=
 =?utf-8?B?L1BHb1FCNkxWYVlHMVhMWlBGdXdFb3ZwcTNwZ3o4ekZWbFRqalNIei9SYnJa?=
 =?utf-8?B?WFJhQS9SQW5HT2lyOW9KMEViMnNPY0s1a29VRit4WHBtVCtZVXRWaXg4ZlJh?=
 =?utf-8?B?d0xDRjFtd29WNnR3S1F2dWRGNHhlQjhzaGs3dnFKTmJwN0cyc2JPWW93ZVpD?=
 =?utf-8?B?SEpkWE1GL3NFTlJwMTZGem9USVVPbFhLSERFTjkwUjN1am5zRlRxa1Q2Q1Rq?=
 =?utf-8?B?NmhOZzNkT2wxdUFOeFQzOWlNOVpMZnRVdmJMU0EwZ2JJUTBjd1RlZzltSkhM?=
 =?utf-8?B?M0htVWxYY3BDamt4MG1TK2ZxZTN6QVRtdXJkc0xGNzFOOCtCYlFvUnpvYTVk?=
 =?utf-8?B?dStlZmlpTjRSbWtJb29CdkhDQko3dGRVZE9Db0diWFZZMHlkbER2eWhoVnMv?=
 =?utf-8?B?MVB1RjV2SU1nanVqVk1yWE0yMG9nL1JFUVBTS0xGa3A0dlBUQVhKbWZ1UFFH?=
 =?utf-8?B?bzNTZm9pNmhaUXZNUmw3MUp5RHpINjE5QVZ3eGZ6Y2plSmtHVzJhbmxsR2xw?=
 =?utf-8?B?TTdLWWI5Mm1Db2dSUzJpUXp5VTkya2FHN1pZSTZkVWg2eVlUYjlNSjY4WlRJ?=
 =?utf-8?B?UjgzajkrZDBKQ0JWam9LdHdpNTVSR1VQbk80T0RTVFczTHl1c0RiRGt6TW9T?=
 =?utf-8?B?empHd0puWC9xOFdMbHU4cVJGRVdjN1pWN3pRUG0xdkl2a29xN25Jc2pvQzQy?=
 =?utf-8?B?VkN3dE0yays2bEc2MjZoRlk1d1JzWXdrL0pPa1lGcXVwMk9XY0crcXRFR1Zy?=
 =?utf-8?B?N2JrUUk0U1JvVzg3MUV3blkrUWNIeGMzUGxCS0EwaS82SGo3dDdtQUhEaks2?=
 =?utf-8?B?WW1NTUxpYTZDS0h3cFVYMEV3ZnZHWXJmaEhmMWJiczkwVnNHUG5yTWxUK2JT?=
 =?utf-8?B?OEN6Qkl6YXdRZVFTU3V5eHNDNVdDUDY4YngvbGdaZ3F2N1N3aEM4ZGd5enZY?=
 =?utf-8?B?UlI1VzNKdDZPZDJ3RDY5Y2J0a2gwdWFrSEhaVEtPMEdERWFKOEhMVHpzLzZj?=
 =?utf-8?B?UC9XcE5VSnRIcmh2cXFIT2hPK0M3TXY3cG1xZXlYb1JJOGZvdkZQdmh1aEJo?=
 =?utf-8?B?WnMvdGFIM09JNkp2SUJ0MWM1THhRVDhqTFNhQ05jZFFmUVpueDlrMy8vOVVR?=
 =?utf-8?B?am5XWlZNdm03SHZYRDlMZ2NqcWFHR2NMVHVOcGl5WWtPNnlhWnloc2RnLzJF?=
 =?utf-8?B?eWlyRWtLbVZTazJ6N0RMMjlhUEVlRDBweFhZVC8zeE1FMEh0d2RYc08rZEdE?=
 =?utf-8?B?SmU3NWNVZHYzbmI2a3BLU2poNHl3WTZObGZGRFhwV1NhOUVNL1lueTFhY1k5?=
 =?utf-8?B?c1V2TTR5bXREdTRuc3pSYXBjU3JPSmFQcHVpV05hWGoyYTdWakh6QVlDT3Bm?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <027F2446440806408E5A50F1AE9188F0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236b569d-1d04-417e-a583-08dd6df2c32a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 12:19:17.9724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UpW9/m7a4G1J7XtcPQInq7TzfSAyx4DY0YYN4MyKVeuAz8w/a4USc/pNA7RwxWnqoklKNRG8zmhJF7E3cbQIZt9hAEyG9QYXn6LkeZE6CwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7313

VGhpcyBzZXJpZXMgZW5hYmxlcyBNQy9EQyBmb3IgWGVuIHdoZW4gYnVpbGRpbmcgd2l0aCBHQ0Mu
DQoNCkNvbmRpdGlvbiBjb3ZlcmFnZSwgYWxzbyBrbm93biBhcyBNQy9EQyAobW9kaWZpZWQgY29u
ZGl0aW9uL2RlY2lzaW9uDQpjb3ZlcmFnZSkgaXMgYSBjb3ZlcmFnZSBtZXRyaWMgdGhhdCB0cmFj
a3Mgc2VwYXJhdGUgb3V0Y29tZXMgaW4NCmJvb2xlYW4gZXhwcmVzc2lvbnMuIFRoaXMgbWV0cmlj
IGlzIHVzZWQgaW4gY3JpdGljYWwgc29mdHdhcmUNCmNvbXBvbmVudHMsIHNvIGl0IG5hdHVyYWwg
dG8gY29sbGVjdCBpdCBmb3IgWGVuLg0KDQpTZWNvbmQgcGF0Y2ggaW4gdGhlIHNlcmllcyAoInhl
bjogeDg2OiBpcnE6IHVzZSBkby13aGlsZSBsb29wIGluDQpjcmVhdGVfaXJxKCkiKSBkZWFscyB3
aXRoIHVuZXhwZWN0ZWQgR0NDIGlzc3VlLiBBcyB3YXMgZGlzY3Vzc2VkIGluDQp0aGUgcHJldmlv
dXMgdmVyc2lvbiwgSSBjaGFuZ2VkICJmb3IiIGxvb3AgdG8gImRvIHt9IHdoaWxlIi4NCg0KVGhp
cyBzZXJpZXMgc3VwcG9ydCBvbmx5IEdDQywgYWx0aG91Z2ggQ2xhbmcsIHN0YXJ0aW5nIHdpdGgg
Y2xhbmcgMTguDQpzdXBwb3J0cyBzaW1pbGFyIGZlYXR1cmUuIEJ1dCBDbGFuZyAxOCB1c2VzIHJh
dyBwcm9maWxpbmcgZm9ybWF0DQp2ZXJzaW9uIDEwLCB3aGlsZSBYZW4gc3VwcG9ydHMgb25seSB2
ZXJzaW9uIDQsIGFuZCB0aGVyZSBhcmUgcXVpdGUNCnN1YnN0YW50aWFsIGNoYW5nZXMgaW4gaGVh
ZGVycyBhbmQgc3RydWN0dXJlcywgc28gYWRkaW5nIG5ldyB2ZXJzaW9uDQpmb3JtYXQgaXMgbm9u
LXRyaXZpYWwuIEFsc28sIFhlbiBidWlsdCBmb3IgYWFyY2g2NCB3aXRoIGNsYW5nIDE5LjEuMTcN
CmFuZCBjb2RlIGNvdmVyYWdlIGVuYWJsZWQsIGNvbXBsZXRlbHkgaGFuZ3MgdXAgZHVyaW5nIGJv
b3QsIHNvIHRoZXJlDQppcyBjbGVhcmx5IG1vcmUgd29yayByZXF1aXJlZC4NCg0KQW5vdGhlciBw
cm9ibGVtIHdpdGggY2xhbmctYmFzZWQgTUMvREMgc3VwcG9ydCBpcyB0aGF0IGl0IGhhcyBtdWx0
aXBsZQ0KaXNzdWVzIHdoaWNoIHdpbGwgcHJldmVudCB1c2UgaXQgaW4gYSBtZWFuaW5nZnVsbCB3
YXk6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9pc3N1ZXM/cT1pcyUz
QWlzc3VlJTIwc3RhdGUlM0FvcGVuJTIwTUMlMkZEQw0KDQpCdXQgYXQgbGVhc3Qgd2UgY2FuIGhh
dmUgTUMvREMgd2l0aCBHQ09WLg0KDQpDaGFuZ2VzIGluIHYyOg0KIC0gQ2hlY2sgZm9yIGdjYyAx
NCwgbm90IGdjYyAxNC4xDQogLSBSZXdvcmtlZCBpcnEuYyBwYXRjaA0KDQpWb2xvZHlteXIgQmFi
Y2h1ayAoMyk6DQogIHhlbjogZ2NvdjogYWRkIHN1cHBvcnQgZm9yIGdjYyAxNA0KICB4ZW46IHg4
NjogaXJxOiB1c2UgZG8td2hpbGUgbG9vcCBpbiBjcmVhdGVfaXJxKCkNCiAgeGVuOiBkZWJ1Zzog
Z2NvdjogYWRkIGNvbmRpdGlvbiBjb3ZlcmFnZSBzdXBwb3J0DQoNCiB4ZW4vS2NvbmZpZy5kZWJ1
ZyAgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrDQogeGVuL1J1bGVzLm1rICAgICAgICAgICAg
ICAgICAgICB8ICA3ICsrKysrKysNCiB4ZW4vYXJjaC94ODYvaXJxLmMgICAgICAgICAgICAgIHwg
MTAgKysrKysrKy0tLQ0KIHhlbi9jb21tb24vY292ZXJhZ2UvZ2NjXzRfNy5jICAgfCAgNCArKyst
DQogeGVuL2NvbW1vbi9jb3ZlcmFnZS9nY292X2Jhc2UuYyB8ICA1ICsrKysrDQogNSBmaWxlcyBj
aGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQotLSANCjIuNDguMQ0K

