Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7BDB33C96
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 12:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092919.1448519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUP1-0006vR-Ts; Mon, 25 Aug 2025 10:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092919.1448519; Mon, 25 Aug 2025 10:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUP1-0006tQ-R1; Mon, 25 Aug 2025 10:26:15 +0000
Received: by outflank-mailman (input) for mailman id 1092919;
 Mon, 25 Aug 2025 10:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bS3=3F=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqUP0-0006tI-IN
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 10:26:14 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9d02095-819d-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 12:26:08 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS8PR03MB7287.eurprd03.prod.outlook.com (2603:10a6:20b:2e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 10:26:06 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 10:26:06 +0000
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
X-Inumbo-ID: e9d02095-819d-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIADFbdnBhckt3IXFo+KwvLMgtBWDU9hAuvsqhqMQZKLW6MSurWgG1gezz9Nk6jf9Ght/KQaL/NcDfUd+19OGT6tiEkP6YYSlWQ1eEKBWQRAGAjI8ibpeUfdkxHG85XtjCljuex4ViFo8qiOVpQxGETa4NkbB/s3kEW/gD/CadYSpjQ8BUnwyx6QP0i7IhvAS0TgAnzbWmJsiwSkztDpPBwUMjRuB/CopcNEtkGegqOJUZG8U8VGDC0rQdCskz2i6KXcyenRiISFViid4HwVp6iqTtSqLrILExQrjRU/CszBA5RxQ1Fczh1PWXnoKKZwzxRZQ95SA8rWGnsnksqa1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJeUdbutCnf2pXBFpn9waVEwo91W93IlUbP3argF9n4=;
 b=P2tks86qkZ1Lpt2IgXDF4XXo9mvl3viPCBGbxbfUK2tI6BJC3DbJcBv4EPZB5wclkqJ9zFOVXDhoNhlgDhc5C0DN0zrGM2NBiXnVgI5RNUabdjqiuJw+wQcXKTA92fB+VNVuS0WAYIbl0myxWkx0fJNK4fTP4rOzTGa4DNvouO5mQQlVsUsiQZpw9cabap2JtdntNc6oC+zqSI1EPtrIAqxUQbkutUhhfqbnxZMSFAFOiUSesgl8fOdQ3kxfKRIJVnhCLu4LAHgeK7OWDg6HIKhP4+Gtq0ajzupSEaIBfQt4rXwq46PCcUtMzZpMA12CH/ryJe2dOPYgSy7Ma/v8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJeUdbutCnf2pXBFpn9waVEwo91W93IlUbP3argF9n4=;
 b=dqTFC4izNKdOS9coEHPjow73hAEksw5GUfxSKAhQMiMHh6hTypXxxYdQXNBIlkFCNXrsL+ney03MGYMpZp5ImHBbCBn3AOwHdH/MMnrTSKP1Fre7H2w5zvgJ4cGSPznJhs/BxrqcuN/uziGS5Va51BGsWox+Y0AZE4gG8EVxVNfKQRb+UPOiP+4e2x8OXKKRBInRZtgQ4/f8Owx4CHA0nUup6rUOLyWLS4gGMBTLgX9D9G6XP7Wok7eX+ticVFHPs5GWy77JGCkNTtsKyVquY6SEjFmqbptY0ZpXBiwz7E06/BqH6MZed500l16V3OYR8Jj+3I0fcOSHcyVGvVlhJA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Topic: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Index: AQHcFQc77bBOPokbA0m9oV6J6fEgkLRzJgAAgAAFRIA=
Date: Mon, 25 Aug 2025 10:26:05 +0000
Message-ID: <e7f0e84d-4c6f-4176-bb90-18251bf09b47@epam.com>
References:
 <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com>
 <60022d5c-1a9f-4a6d-8df2-bca57cefcf59@suse.com>
In-Reply-To: <60022d5c-1a9f-4a6d-8df2-bca57cefcf59@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS8PR03MB7287:EE_
x-ms-office365-filtering-correlation-id: 4f6a408b-00df-4a2b-d16a-08dde3c1ccc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z3k2TzBCanZjVE5sQ2RlSGtmVlJhMWZ2NDQ1cDVVNnVzYXNNUU1wejlFc3lY?=
 =?utf-8?B?TW1XeVJFbCtFQlAyWU9La3BLQlowNGFNVk42NkFXaFExczBFc1JJaDduV1M1?=
 =?utf-8?B?WDZNcEdQbDhJYTdRaVVibjBQRWRhNldNQjF6TVdGWUZhbitRZHd4ZVR6ZzBQ?=
 =?utf-8?B?bW9rZzRpUG9KYmdrbXZNbWZLRHZrVlF0R1dha2xBN04rRTh5N2x6RWNpSENU?=
 =?utf-8?B?ZExSNHl2ZzEvWWNScUZPZHRTMGUzcE5CUTZGMnF2R29FVlVLQVBtMUppZS9S?=
 =?utf-8?B?UlM1TlZqcTdEMFc1M1p2b1dNUjNGQWRuUDB4aTA1VkdqMVU5R2tHWDhLQm9p?=
 =?utf-8?B?Y2NUeUFXamZVckN3aVpPc3F1TU5xLzRKSWZscUJwQTE5NG5HRDRrTHhqMStF?=
 =?utf-8?B?VWd6MmU2MjhtTmZPU2xPRllQRVBNdG54ZXRKLzRTMXdKaWRTQXgxdWFDNHVG?=
 =?utf-8?B?TGFCM0k5WVMzTks3bHFLakFuQkNWODQybkZCVU1XV1J2RCt2NFFzTGJxVlpR?=
 =?utf-8?B?Q04xa0RWNTl4RFl5L1BlenJqWWxWU3RkSHJvQWFmQk9JMFloVWZZM2g5OFFT?=
 =?utf-8?B?YTdqK2prZ2srTUFDNDRtem1wdWJTZm90c0tKK2JudDRFQmxYdHhtRlJwY3V0?=
 =?utf-8?B?K3IyMjRCV3ljMmtZUFVGcVhFRThWOHM1YW1YYTdoK3NuMHV4MWFweVdQVlph?=
 =?utf-8?B?WlBmY05CZUZRQmZBTDJhYjJaMUJqRVVDOHVwYkZ5WVQ0eEl0Yk1aanFsNkZn?=
 =?utf-8?B?VHVPTWQvWS9CY1ExNTZzWE9PeVM5aUxYZ3dlT2g5RGFyWEt3cnFMeHA1QUxY?=
 =?utf-8?B?R0hTQktnYXl6NGJTdm9aQzJMUG1TUUtkNnlBSXo1TGFPemtWNTlubEJPb3ZW?=
 =?utf-8?B?SHc2dE1aWjJGRy95UGlIcWVZZlF0NktIcEpWNEZxcEoyVG5FZzVUMGlKb3FN?=
 =?utf-8?B?N3hvSGpJejRKdnJYdjhCcnM2dnZWTWpySkpYRGZYdHZVUC9FbmhBdCtIU21B?=
 =?utf-8?B?YzZUUUVXTHVkMGIxQjcyRHpnbGUzbFlGVk51ZGduZlVxL0gyWnkwN29iWEhJ?=
 =?utf-8?B?NDdkanBXZWhJWDZoVHJibG5ZM0dFQ3I0QlY2WDdaMDZPSlRxajNXZVF0V05O?=
 =?utf-8?B?VStVSHRWdWRrMzNnamdIdmF1SVdsUEEyb0xJVmxURCtpWndHNVVHVjNEN1No?=
 =?utf-8?B?MEhSZGRUVWVTd2I0Q0pnTXVLaXhIeGhBdWQydTQxZ3ZGdksyUTQ1QmNDRnp5?=
 =?utf-8?B?NUZmdjMwamF5endUQXprc1VycnFtN1dscXNzOVNCT2d1RnNhRDdzazk4aTlh?=
 =?utf-8?B?ZERZMmptRXVYN1J3eTJKZExNTW5sOFdmMXhTQnhTV0VpRm9LTnRXK3Rhb21G?=
 =?utf-8?B?Si9uVEZXZGNQSVNtL1RHQTRFMTJiSFp6NFJTM0l0V2ZPbGh6OHcvZ0hJc2w1?=
 =?utf-8?B?SllaZFlVWko4Vlc5NitTSjN1dXRnbUJ5WS9sQy9LYlJDK05QankwdHBGS3ZR?=
 =?utf-8?B?cis1TDYrS3kxbGRZUWMzWVVSRkFYSEdIaUlCaU1TR2VxYllYQ2tQTWZiRkVx?=
 =?utf-8?B?bGZHQWFzWkZ1dXlhNlhmUUV0VXE4cm9aWTQ4ZmZ4VytHaUViZ0I5eERkeTBp?=
 =?utf-8?B?SnViVnVYNmVkS3hwSmpNTXEwcG9wemJ2WFExMG9wd0toMkd2bEIrZGFIM2FH?=
 =?utf-8?B?c1RlY3N6NS91MGtpRXVVdzNmajlFYVVNbXZzWFlBVzgvaVZ6L1lqcTNpanlK?=
 =?utf-8?B?UTZoc0VoS01FdFcwK0pNS2RUaFRhblQ2NndLSnpicjdFRU1KWURQTC9aWWZi?=
 =?utf-8?B?Z3A4djBsSzFBYmVtakN5amRnWm90V0IvaHNDZWRXVkhhV2VwMDRlYTVGbW9w?=
 =?utf-8?B?bXlXeFhhU0xQNldKV3NXZS80Z2xIV2dBOUdxTzJ5c3RkUGFiQXU5WGw2TFpk?=
 =?utf-8?B?RThHclRJcVBscEg1OHIzUWNmZldjQWVjOUJBT0V1QUxqY1dQWUxpS1pUOUxq?=
 =?utf-8?B?cEN1emtCYXZ3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0RqdG5yMjd4VDg5NDVSdjA4QlFRQmpDWDZ4dkNVb3VlaFhtT0dueENKRHpV?=
 =?utf-8?B?cUdFdlRSQWRWRGVRcDNMT1dpeG5vSnpEY1lHVDloWGp5YXByK0xmclVITm9F?=
 =?utf-8?B?RnlxbUFlR0g5RDVsWjlUMzVxMk1ab3VRaGd5dVROb1czY1paNmlnNUREQnRv?=
 =?utf-8?B?eVVNUXUrNnQ5VEVpRUQyVTVQTVRERUpxc0VPS2pjckNpdUN2M2hJWDZCbWho?=
 =?utf-8?B?L1dzdjBrQkNpQlFQSlU1L2h4dzg2T2xGbTY5ZEZqV0JoaHg2ZmJXNUp6eGll?=
 =?utf-8?B?K3NETDFmcmlTeWMvVEtzVGhFeVdnSWRvYjZ0UHErWkxHUTRwVEFTeTV4U3FZ?=
 =?utf-8?B?cDBLVlBMaDVGckhIcTNrK3NoWUZ6TERLMzA0YXpNVzRLMnBYNmc3TjZGVThF?=
 =?utf-8?B?My9rZGV2MTNxdjEzVGhhRzdIRHkxNGl1VHBUUFB6V1I5RHBDdWpicHZFM3ZF?=
 =?utf-8?B?S0NsMXpPVTZmZ00yOW8zZlZvOXNmSGhMY2MvTk9SK0Q0K3RKb2VWNHJOUWhK?=
 =?utf-8?B?WkppTVloUEVSQkgvS0E1TUdzNnBmeEIxMmdiTVRKWGJYckk0YTBIZTVQc1gy?=
 =?utf-8?B?Z1Rjcjc1YmVkbkRINUVRSHEwaG1CWlNrMUdMZmhiTjhmbFhwZTZJZFJ5V01K?=
 =?utf-8?B?UDZRbTZHcXhtMHN0OWhaZmgxZ0MwNFEvSXBFckZqbFd4Z0RmRkRFY2J5eVBx?=
 =?utf-8?B?akhmL2JINDZPWmp2ekxTTTNrMHYreEdFZnZmTnNIODlhMjl4TGV1Vkk0bHRZ?=
 =?utf-8?B?MDdHZk91bVJzckJwcm1GSWgwcWlIQ0Yyc0xDVmJ2YnJGOE1SRjl6T2NZWDdt?=
 =?utf-8?B?cDdneWIvdC9sRkd6cGRVNmw2ekY1b2pVeXpTaWlRZ282UzNkNlhzKzNHZFJV?=
 =?utf-8?B?ckVyTjArb0lKb0tWb250anNLc0NmVk9CY3YvM09vS2ZuVHpFcmlvVzkybjAv?=
 =?utf-8?B?aGNmY3NVN2V6ZlcrZ3pabHlGekRwNzB0NnRvdHpLYXRjcENHbnVhY1ZWNUVj?=
 =?utf-8?B?VjNMdlltT1hNQ2JWek5lb2JiNDU5UWRacGtGVWpIeFBFZUVYL0hyM0txb2k1?=
 =?utf-8?B?cHFQYlEzVzBOb1NMc0VzNVhvRFdZWVNFQ1NyUFJOVVMwTzJIbmI2RTFTR0pn?=
 =?utf-8?B?c2J6RTVIVzdnUFQ3emc0eTR5WEFTUVRkZmNwZG4yL3JnamZqOU8vNnNtL3lI?=
 =?utf-8?B?WkJPcjVMZEYxeTV0NVNBb3ZZMjFHSUYwb2tPckRBQ1Z0ZWhUdzdiRDNRNjYv?=
 =?utf-8?B?WllDLy9sc0VtbmxjaFRaemk4ZFRnWmZQalhzVWpDbGdtS1o3WnozY2xGQnlq?=
 =?utf-8?B?MmJaR0ZLSnJqUXBONmJJVVo1WTVGY1pzazFwZVBGNHZaRTZibmJmZElnRzhS?=
 =?utf-8?B?dUZIQmdRdTJ6cEhQMGZyNmdsR3pxUDZsMGNDWm4xb2FxT2V1Wk96bDFFL3h5?=
 =?utf-8?B?Q0IyWktoNG9SNy9EUUUyMXdjRkxFVkRiWnp6UnpSV0NoSnI5ZEpLRmFjQmt4?=
 =?utf-8?B?MEJQQjJrOEwvTjVNY0MrT05yOTFrcjlxQlJEV2tSaXRKQUJ0TXlRNDdRV01Y?=
 =?utf-8?B?NUl0WnFrNGV2U3ROM0RBS1I3OEhnZTJ0NnQ4cXFDV0FtY2dXRzloVktwenox?=
 =?utf-8?B?Y0EwSUNJM1ZRemJNM0dwRStuVVMwQWtySGFFZUpUWFdFTXRLTFpWU3hSc0Yv?=
 =?utf-8?B?aWZzOUI5WHoycUNsTkFTa0NJcWJ6QUUycjFqY1VUQ1pNRE9pZExmSVJ4Yyt4?=
 =?utf-8?B?S3Z1bTJMZSthQVI2RHpRaDJQTXFKT3pwVDJuT1JVQm5RNmsrUkdTZ3VRenp0?=
 =?utf-8?B?U3JQSElqbXEvc0RnV2x6YWRQeG1lZW9ISnVGY0gzNVpxT3hUek9JUy9sSEpn?=
 =?utf-8?B?VGhVVWN6bkJqVUJaT0hJcmU1QTRFSDI0ZTZFWE90TWttVC90MG1MUENTMU9x?=
 =?utf-8?B?WERMemJsSHNkVEpBWWZBc0h3NUdqOHpHNzQxNTluVm1keU5Ec2wwbjgvdmlX?=
 =?utf-8?B?L1dKWXBhcFp2Yk5XejdhVU4vbmUvcXVZVDl4QlR3VzdOMDVVYVpxTktqU2pW?=
 =?utf-8?B?bkp5b1hnTHZDbitLbWFIdjk1eUNoWDZNbGI2bjRKTHN1NHBVenZ2QjA3ZHFI?=
 =?utf-8?B?OWJ3SzZNcnViUWVrcysreHVzMHE0Ylg2eTFucWJwQUNXNnNyMTlYYnJLd1lO?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B68D4C68579C3C499A9D5E6E081A8BB2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6a408b-00df-4a2b-d16a-08dde3c1ccc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 10:26:05.9838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FUuYb3+w5RdG8anT4elnocIsDBFYo1+Qg8gcGwL/j9SOncIAuaK8W42RcefPgChggLDuV0cyYtr/sgFYKMhW/EdBFtlRghs199FTI3SdplE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7287

DQoNCk9uIDgvMjUvMjUgMTM6MDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wOC4yMDI1
IDE2OjU2LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS9kb2NzL21pc3JhL2Rl
dmlhdGlvbnMucnN0DQo+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiBAQCAt
OTcsNiArOTcsMTkgQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoN
Cj4+ICAgICAgICAgIFhlbiBleHBlY3RzIGRldmVsb3BlcnMgdG8gZW5zdXJlIGNvZGUgcmVtYWlu
cyBzYWZlIGFuZCByZWxpYWJsZSBpbiBidWlsZHMsDQo+PiAgICAgICAgICBldmVuIHdoZW4gZGVi
dWctb25seSBhc3NlcnRpb25zIGxpa2UgYEFTU0VSVF9VTlJFQUNIQUJMRSgpIGFyZSByZW1vdmVk
Lg0KPj4gICANCj4+ICsgICAqIC0gUjIuMQ0KPj4gKyAgICAgLSBUaGUgJ0JVRygpJyBtYWNybyBp
cyBpbnRlbnRpb25hbGx5IHVzZWQgaW4gdGhlICdwcmVwYXJlX2FjcGkoKScgZnVuY3Rpb24NCj4+
ICsgICAgICAgaW4gc3BlY2lmaWMgYnVpbGQgY29uZmlndXJhdGlvbiAod2hlbiB0aGUgY29uZmln
IENPTkZJR19BQ1BJIGlzIG5vdA0KPj4gKyAgICAgICBkZWZpbmVkKSB0byB0cmlnZ2VyIGFuIGVy
cm9yIGlmIEFDUEktcmVsYXRlZCBmZWF0dXJlcyBhcmUgdXNlZCBpbmNvcnJlY3RseS4NCj4+ICsg
ICAgIC0gVGFnZ2VkIGFzIGBkZWxpYmVyYXRlYCBmb3IgRUNMQUlSLg0KPiANCj4gV2l0aA0KPiAN
Cj4gI2RlZmluZSBhY3BpX2Rpc2FibGVkIHRydWUNCj4gDQo+IGluIHhlbi9hY3BpLmggSSBkb24n
dCBzZWUgd2h5IHdlIGV2ZW4gaGF2ZSB0aGF0IGlubGluZSBzdHViLiBXaGVuIGl0J3MgZHJvcHBl
ZA0KPiBhbmQgdGhlIGRlY2xhcmF0aW9uIGxlZnQgaW4gcGxhY2Ugd2l0aG91dCAjaWZkZWYgQ09O
RklHX0FDUEkgYXJvdW5kIGl0LCB0aGUNCj4gY29tcGlsZXIgd2lsbCBEQ0UgdGhlIGNvZGUgKG11
Y2ggbGlrZSB3ZSBhcnJhbmdlIGZvciBpbiBtYW55IG90aGVyIHBsYWNlcykuIE5vDQo+IGRldmlh
dGlvbiBuZWVkZWQgdGhlbi4NCj4gDQo+IElmIHN1Y2ggYSBkZXZpYXRpb24gd2FzIHRvIGJlIGFk
ZGVkLCBpdCB3b3VsZCBuZWVkIGRpc2FtYmlndWF0aW5nLiBBIGZ1bmN0aW9uDQo+IG9mIHRoZSBn
aXZlbiBuYW1lIGNvdWxkIGFwcGVhciBpbiB4ODYgYXMgd2VsbC4gVGhhdCB3b3VsZG4ndCBiZSBj
b3ZlcmVkIGJ5IHRoZQ0KPiBFY2xhaXIgY29uZmlnIHRoZW4sIGJ1dCBpdCB3b3VsZCBiZSBjb3Zl
cmVkIGJ5IHRoZSB0ZXh0IGhlcmUuDQo+IA0KPj4gKyAgICogLSBSMi4xDQo+PiArICAgICAtIFRo
ZSAnQlVHKCknIG1hY3JvIGlzIGludGVudGlvbmFsbHkgdXNlZCBpbiAnZ2ljdjNfZG9fTFBJJygp
IGFuZA0KPj4gKyAgICAgICAnZ2ljdjNfaXRzX3NldHVwX2NvbGxlY3Rpb24oKScgZnVuY3Rpb25z
IGluIHNwZWNpZmljIGJ1aWxkIGNvbmZpZ3VyYXRpb24NCj4+ICsgICAgICAgKHdoZW4gdGhlIGNv
bmZpZyBDT05GSUdfSEFTX0lUUyBpcyBub3QgZGVmaW5lZCkgdG8gY2F0Y2ggYW5kIHByZXZlbnQg
YW55DQo+PiArICAgICAgIHVuaW50ZW5kZWQgZXhlY3V0aW9uIG9mIGNvZGUgdGhhdCBzaG91bGQg
b25seSBydW4gd2hlbiBJVFMgaXMgYXZhaWxhYmxlLg0KPj4gKyAgICAgLSBUYWdnZWQgYXMgYGRl
bGliZXJhdGVgIGZvciBFQ0xBSVIuDQo+IA0KPiBJIGRpZG4ndCBsb29rIGF0IHRoaXMsIGJ1dCBJ
IHdvdWxkIHZlcnkgbXVjaCBob3BlIHRoYXQgc29tZXRoaW5nIHNpbWlsYXIgY291bGQNCj4gYmUg
ZG9uZSB0aGVyZSBhcyB3ZWxsLg0KPiANCj4gSmFuDQoNClRoYW5rIHlvdSBmb3IgcmV2aWV3LCBK
YW4uDQpJJ2xsIHBheSBhdHRlbnRpb24gb24gaXQuDQoNCkRteXRyby4=

