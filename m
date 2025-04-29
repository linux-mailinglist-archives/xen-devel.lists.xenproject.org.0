Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D5FAA0A85
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972109.1360544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jRb-0005qY-IQ; Tue, 29 Apr 2025 11:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972109.1360544; Tue, 29 Apr 2025 11:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jRb-0005nU-Eu; Tue, 29 Apr 2025 11:48:11 +0000
Received: by outflank-mailman (input) for mailman id 972109;
 Tue, 29 Apr 2025 11:48:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zRN=XP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9jRZ-0005Fs-Fn
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:48:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2612::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf76c316-24ef-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 13:48:04 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by AS2PR03MB9148.eurprd03.prod.outlook.com
 (2603:10a6:20b:5fd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 11:48:02 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 11:48:02 +0000
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
X-Inumbo-ID: cf76c316-24ef-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaBsdXn9ZsG61+tNXAmi7rwAG+xiMCb5Wl8tXjoPTZ/alBrRQIbCLHVVkpA1UvI+tLQsc1HS1PXsyEXrAZfm2aCTjD3XJEs4nJEGSDj/j131kmix7AntZ+ma05ANku7rFUB9WP4hwfgemRoqXPuxEbaRamWskk+v9aPp7uf+7O8wlfwZf9QDwWxRs7XlZlusJKm2lUlwWDiaRJ9gKWepjHu6pRGUT+ISnDsSe73Yx2dCH30p8eIvRO1++0uJ3N7Rsy6MLQzsiYilhYmfQumPuTexn7/sof+/ae93XTIStLTJrIFyhlSVj62X4hVI1/HXoEzOJwRbk+6Zbju0JjKF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlxYyYip9nHA2X/fXv4hmMQLPbM9ZDnOdi/2QG00vsc=;
 b=Gx1PNNadkGJGsy6F2hGzqBSCWwNwFTVOIekwmqCAtDNmIgQFMQsWX4e36pDaFQVjVwFDzfeyu82hZ4MRfoyMcWlp+WeJFr8o8uBVLECkifR6JTi2+UPM1OtJUky4SUwSfDrr/lc9SefTjyccwJSpw6u++e48p6Qv7Q0x8BuJKodVzAlxhxiIkNR7CLtrk7Pddb610I63b5feV0sXnSjgGsmFLThvrlrzrgXIYETJj7UECnWSy5mY9A6DLeRpfAmEbigjzegcuwAe2YaTFr78t+KCf/GYTGZ1WWPqLo54lclQ0jMfX1q8gMMZgeXV/MVmLQHwr6eVNtbT7OOQowWSTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlxYyYip9nHA2X/fXv4hmMQLPbM9ZDnOdi/2QG00vsc=;
 b=iTzc839oJzKid9R0qVVP5RzLg5MPkmls91Frl3nK92BNb+HnHamA2ykO6DY8f2khp/BSkpoqishp5Jbx0zS76KBBCUN9WzUMVOHdofMGqP0Rmx5SfSNhYoFkQFioq3BV+AR+0PwaQbZnjJkDH2yZhhjgDvUi2BgPXoaJInRZVTyrolvQmAw9bE0Gu1Dl3QBTgeStfzwzi5U/A5d38aU5g86u0ZyVHIF1cj3UgrcMbAJA2LaQvrEu8PmoGeb3zomlHRuHyssE57yKA6+DRpRKquDC/h1XHb6DkZFPL+BP/yfDAl8YxSIqQmZOfe30TFDlO5FKLrK/sM+ayFaGpKwxMA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index:
 AQHblOXdxbIbbkNtn0WSg/9tW2OJ47O5DGKAgAA8u4CAAAbVAIAAGfaAgAA/NwCAASYyAA==
Date: Tue, 29 Apr 2025 11:48:02 +0000
Message-ID: <b0f2e456-4fd1-4f95-935c-7f4fe154bf82@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7d376741-ff23-4618-83bd-415c8d8fa24e@xen.org>
 <ae2c8d37-e350-4125-921f-3d320c28d6cd@epam.com>
 <a1715315-f4c8-4062-89db-e2df7b22865b@xen.org>
 <c61acb06-4770-434d-8158-d7e0b4b32f04@epam.com>
 <ac7fe0d4-dc3b-4322-9df6-01adac02de4a@xen.org>
In-Reply-To: <ac7fe0d4-dc3b-4322-9df6-01adac02de4a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|AS2PR03MB9148:EE_
x-ms-office365-filtering-correlation-id: f2549836-4abf-4f98-130c-08dd8713b256
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXVrbGFFWXZUbWdIRVlSUXBhVjFjRzVvMXR3OVE5L25sSnRjT0pvdVhBRFd6?=
 =?utf-8?B?d21HUEtiOWhpcGVxdFBINlZ1aCtYQ05Vc0FwdHVVUUtsa3JVK1BXNDF6Mmc4?=
 =?utf-8?B?TzJ3RTJxYjhmUTlyRThxalRZUUgrZmExNDBQOTduNDRyRHdubG1HS0FVWmM3?=
 =?utf-8?B?aE02ZUhBeVJMQUlRckpXdnFYZW03N0hSek5ZRm5TY24vUGdpU3A2WGZIb2tR?=
 =?utf-8?B?MmpmSUI1ZTZVbTlxLzZYdWp5UnY2V1VGdm0wOGtWUGhVejJ3ekZONUZCMitC?=
 =?utf-8?B?Y2p2REgrSHJ6M3lCUEEyQkJMM01zRTdDdnRaRjI3SWlxbE83WDcvbSsybUwv?=
 =?utf-8?B?WllrdStWVnRnMXUxVk9XU0NSTVd2L2VNMHJQT1U2TktldVVoSkdRTUNpYTd3?=
 =?utf-8?B?am1NWHMzTURaZUl3TlljZm1pWWhLNTAvSDhVWnptdys2UlBQSC9KNDFoZy9m?=
 =?utf-8?B?cjRDK1RtQjE2WTZ4ZHFiVWo1Tnc2Y3RIZEVHQko2MUkwMzU1ejlSb0VJU1Ez?=
 =?utf-8?B?Z1dSaDdWcFFxRzhITlBwUlFycVVKTTFLd2xFQkc3QlpsOENPTWNtZUxnelhH?=
 =?utf-8?B?V0ZsTTNET2tZK1hrdURRWENXcmJFMUZWRStZODVnSDRPMFlORDlaRE4yNmsw?=
 =?utf-8?B?UThHT3RmT0FhV3VKaFp2MGJmNWlaUDNlY2ptUExCOW8wRlRqZmJMT1pKRGsx?=
 =?utf-8?B?c0RmSURzRWk3K3dqcG15cDB1M3NFL1FrOTFBaFJNaG5DTnZpTW11QWhZN0I0?=
 =?utf-8?B?ZkJ0NUlJQVM5ZEZKakpoYk8xNDdzWlRTajZtTGhSc0p2YUNPUlBsV0NSblRi?=
 =?utf-8?B?c0w4akZEWmVjMkczd2RLUGJRMGVLUU9WS0xneDZFUWttaGczM25SOXdLaCt1?=
 =?utf-8?B?N1QrYzlucEFIemZYM3dkcUo3Y0lDWnRqamxCMWxma1I5L2ZKWlhhREdxOFZU?=
 =?utf-8?B?ZnlUL1ZmN2FyMWVDcnBrZmt1b0toYmVLOUgrbnkxRld3dU56cmRIcEl4Lzdp?=
 =?utf-8?B?a2pRVTRLMzJuN29ua2JqOTQrUXhZMjZlYUQxZ1Z6M1NLR3pUeFFZQklBdk9S?=
 =?utf-8?B?eG9LVW5hYjArQnkwVmpUZ3ZSM3dRdUZUS0FZalYxMXRablNKSmdmRkwzV0Fn?=
 =?utf-8?B?ZlNpOCsrOGZNWGhCckhhVlZ6Q08wK1VmRHNDY1NJWTVSYzdGTGdTYkd5OWZO?=
 =?utf-8?B?WkhlZlF0bW0vc0tKRmg5SGJWc0l6YmlRWFNWZndKY2ZTNDhLaVlzVWVDM2tr?=
 =?utf-8?B?Q05ZUzVXSzNCZ2ZaTk11TlNYUU5rWVNZaUdsUEVQeUpSWkFHL1N1TjVRVGpt?=
 =?utf-8?B?UHpLVFM4T3BkcHNWQWQvbEZHRW1oRXc5ZzQ2MUhSSjIzUUFSR2xLRWswTFla?=
 =?utf-8?B?cHNjOWdLMVFRY2NiYUh2eS9teGtndDBNWVg4dG1EdEw0M1hNTHY0eDM4aG1Q?=
 =?utf-8?B?c2ppdHdoTGtTbkhMU25kbzcyZXlJVzNGQmxKa2h5ZHJNU2JjU1B3bUZ3ZytD?=
 =?utf-8?B?eTFuMXhhRGpZTjZUUVZSakNsYU50V3A2UDZiK0w5MDRKeEZxVjBJM0FQblpX?=
 =?utf-8?B?R1FrdE95eE01eTNjTDVIQno5MkVTMGtVam1hN0grZ3JmK2NVVDVvNFU4SjJz?=
 =?utf-8?B?UXYyMjRDUFlxUzA4cXpmQzkxTUl3dlJGMjFjM1YvcFZjSGRSK1cvMld6RDEz?=
 =?utf-8?B?ZXprYm5nRHY3YXpNVDd1ZmlJQlZCT1E5OFkwWUx6blBUVWlKbysrVE4vZS93?=
 =?utf-8?B?bzZ1Vy8zcDRFZDBBVExGNTd0YWVZVU5VSnNKMWt2cHgvSDJtVHRLdWZBdWxm?=
 =?utf-8?B?MTdESGpsTlRyaWtBVnRxOS8xaFFDaXNySDhhVi94ajQ3MU9PSENwKzNpbXVo?=
 =?utf-8?B?dXAwK2ErUGtwcmJCYVZPMkFiWXN4bWRySVdzOXJ1OWVEVFoxcGpWS01PYW4x?=
 =?utf-8?Q?Ximgl4/JTcOAajTc5Pj3GfaIMGqHYtYr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWZuN3k3cThlNzFrbXRVVVcwOFBBVUlBZkFCSEpMNHhBYm8yNjcybkVWZHZW?=
 =?utf-8?B?YnlhWTZTeUV2c1RSSFpvSWovNys4Q0xZMUl0UTVyYWZHcHhCTFJPU3Rnb01a?=
 =?utf-8?B?TzNWckhkS1M3bGQrL0JEZ20wTjQ2WFlXaWhPWmVFUElHQ292dU1ZREQ0amhT?=
 =?utf-8?B?WVdJME9FYUsxUndGZGhjaWRlWm1YNFBMTHlWVldpVyt2eldCamlncUpGTDky?=
 =?utf-8?B?djU4MzVkbDEvaWxPb2xnTVhoQUcxamFQQUxJazQ0cXpidlhXcjlQSjRGbVRj?=
 =?utf-8?B?UkhZVmZBYnd6ZFNaT3VwQkFxS2dicnNTS2RGK0xHbTFQY05ha0VUSG81a1BU?=
 =?utf-8?B?MXkxWjlEU2grK3psSC8xdFdqcW1JYlVKMDlMV1QxSjhnMU5JM01zK0VOQS9I?=
 =?utf-8?B?MncyZWlKZVRLTzB0dWZCd2pwTlFpc3o5dmg5UnhYUzAvUU9ZUDJRYnJjdWVh?=
 =?utf-8?B?TTc4aXozNVVtdEdCbHB5OFNNS003aVErMk92M3Vsb3p2M09oTSt5NFI0RkRC?=
 =?utf-8?B?aXFFQ09LREE5WW41dWMxLzlUTFJ3NU9IZUxGSVVZZkYwNm9TVitZNW9jejJj?=
 =?utf-8?B?RUhiWWpmR3ozWGxEeWpCUmFPTU8xWm1SWk16dnNTZTlPeWtyUmI3aXNKRnJa?=
 =?utf-8?B?V3pPeGJsK29EZC9aWnRiTWMvdjFjdVNsR2Y2aVNXL1IzOTk0b0NLLzRsb2dF?=
 =?utf-8?B?czVXUURrY3pXcUJCRnhWNmRLWWxObk1yOTFmUmdjbzJTUm56cWc2cTBXQTNs?=
 =?utf-8?B?aTBTVGRkMVl1YkpZNzNNWjdpSnFaYW10TmJqT1VpbU5aS1djd2NqKzBmNXJX?=
 =?utf-8?B?UUI1bUFNOFBMRE5DdGgvOWEvc25PUkhKMGJoejE4RGxpdHhoa2ViUHJmNU9m?=
 =?utf-8?B?OTZTNmU4YlNXMk80RGpmZHFBUTVmTzRGK0lNRyt4K0lCRTBqNWFndVF2QWNP?=
 =?utf-8?B?bllNZ3pZai9NVUVCbjZHMTVjbTVGeHdjdHlVNlBwdjgySFljWWlXUmVJSVRz?=
 =?utf-8?B?dUJzOURaLzRGOFFIZTVLSE5DM2Y2MGpTT1dNQ3dYY2I1MzJUenhDbnNTN0lq?=
 =?utf-8?B?WEhIa1VkTjFtMTd4c0hDY3pNOVg1eXp0a0RHQTJMTlVMa0o0Z3NaQTRMNW5o?=
 =?utf-8?B?MTE2ejVxOEFBbmR5QVZhSlBmNDduZUtVRzJNdmQ5dURrYktlRldHNTd1WGtD?=
 =?utf-8?B?cDNVSjB3elI3UlpiUkpJUGYvQ3hnejF0OHI4YTA2M25neW9icm1FRlkzVUtJ?=
 =?utf-8?B?VzA0d1pKbFJhT0VLNzgwYzZkU2VYREVPZjd0Wjd0T2tDMi9qZ3A4d1k2TldX?=
 =?utf-8?B?UmdrOXBlRmVvcGI0T3VhcEd6VlVRN2lvM05Ocm9oYWZhQzJMcEdsUVplOGhU?=
 =?utf-8?B?ZnBLblRrZjZMYm9wdnpiZ1IrakRPbzZyQW4wZkpPcG5MMGt2dVc5K2tha0Ro?=
 =?utf-8?B?Nnh5bDBFbVdTK0RodUVlZW45R09QQndMUEZWWWdQS1BSY3plVThScE1NWEJm?=
 =?utf-8?B?WExCSGhtR0ZPcGx6RHlRS2pRNmVzOEROVCtIREM1alh2TFoyQ25pTVlISDBJ?=
 =?utf-8?B?dDFDVEJMT2JtN29nbDRnaE9RYjVjNktjaEhLOHplaFpUV1BudndiYldzLy8y?=
 =?utf-8?B?ZTBmU1ZBM2NGQ1Budkp5YngzSGRNamdLUlNvUlYzM1FRL09HVHRpZXBXeWpW?=
 =?utf-8?B?V05CRDkyMlFycWJ5MXUxb2tLV3JHYVpsWE5MV2hIajJHSi9sbVAwN2x2UGRn?=
 =?utf-8?B?aXg4QUhXRnQvSHlqWUFpZWw5Z1BhcURRVHVrUnZ3d1k0eFhNSms5eHd4cXBJ?=
 =?utf-8?B?SnUvdm53TFozUjN3aUl1SHk0WVhpdzhwaG0rSlRId1k1RXFGMEZXZWV4RnI3?=
 =?utf-8?B?bDdYQnVYUmFXd3JxWlFrWkh3S1duTEVPTVpKSUR0a0lldWpMaVo5S1pBZm5F?=
 =?utf-8?B?V1BXSEI3eklDTXdsc09rL3dZeHk4cjlraTFEYzI1QnRVeUxtd2VpTTZiRVd1?=
 =?utf-8?B?d09EdXM0YnRYT3p1enFlMFh0ZWN3SExkcWJKWm0yNHd3RGtSNGlOMURqUGUv?=
 =?utf-8?B?R20zZU1CaXB2cmd2anlPc042eEVCZ1JqV2ZuTkNMZysyTUF6OEF3eWxObTFS?=
 =?utf-8?B?QzNRVTA4Z0o3SFd3UmdWSUF3THZjOFNOSjM5d2tOTUF4eHBsVVFEeFE1WDZO?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E8934ED3BBD994CBAD19C3E87DA5B26@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2549836-4abf-4f98-130c-08dd8713b256
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 11:48:02.2031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /eG2YNKPF1aHSeLajX7/Z+YxGJInAb8d4eliiaXN2ELE/Id6MjZAexP9ww+naWvcU5UhdGx6SnpYF8lbFKDtaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9148

T24gMjguMDQuMjUgMjE6MTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgTXlreXRhLA0KPiAN
Cj4gT24gMjgvMDQvMjAyNSAxNToyOCwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+PiBPbiAyOC4w
NC4yNSAxNTo1NSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+Pj4gT24gMjgv
MDQvMjAyNSAxMzozMSwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+Pj4+IE9uIDI4LjA0LjI1IDEx
OjU0LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBIaSBNeWt5dGEsDQo+Pj4+Pg0KPj4+Pj4g
T24gMTQvMDMvMjAyNSAxMzozNCwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+Pj4+Pj4gRnJvbTog
U3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCj4+Pj4+Pg0K
Pj4+Pj4+IEVuYWJsZSB0aGUgdXNlIG9mIElPTU1VICsgUENJIGluIGRvbTAgd2l0aG91dCBoYXZp
bmcgdG8gc3BlY2lmeQ0KPj4+Pj4+ICJwY2ktcGFzc3Rocm91Z2g9eWVzIi4gV2UgcmVseSBvbiBk
b20wIHRvIGluaXRpYWxpemUgdGhlIFBDSSANCj4+Pj4+PiBjb250cm9sbGVyDQo+Pj4+Pj4gYW5k
IHBlcmZvcm0gYSBQSFlTREVWT1BfcGNpX2RldmljZV9hZGQgY2FsbCB0byBhZGQgZWFjaCBkZXZp
Y2UgdG8gDQo+Pj4+Pj4gU01NVS4NCj4+Pj4+DQo+Pj4+PiBJdCB3b3VsZCBiZSBnb29kIHRvIGV4
cGxhaW4gd2h5IFhlbiBjYW5ub3QgaW5pdGlhbGl6ZSB0aGUgUENJDQo+Pj4+PiBjb250cm9sbGVy
LiBBc2tpbmcsIGJlY2F1c2UgdGhlIHJlYXNvbiBpcyB0aGUgUENJIGNvbnRyb2xsZXIgaXMgdG9v
DQo+Pj4+PiBjb21wbGV4LCB0aGVuIHlvdSB3aWxsIGxpa2VseSBuZWVkIHRoZSBzYW1lIGFwcHJv
YWNoIGZvciBQQ0kNCj4+Pj4+IHBhc3N0aHJvdWdoLi4uDQo+Pj4+DQo+Pj4+IEkgdGhpbmsgdGhl
IG1haW4gcmVhc29uIGZvciB0aGlzIGlzIGNvbXBsZXhpdHkgYW5kIHRoZSBwb3NzaWJpbGl0eSBv
Zg0KPj4+PiBhZGRpdGlvbmFsIGRlcGVuZGVuY2llczogdGhlcmUgY291bGQgYmUgZXh0ZXJuYWwg
Y2xvY2tzIG9yIHJlc2V0IHBpbnMNCj4+Pj4gdGhhdCB0aGUgUENJIGhvc3QgZGVwZW5kcyBvbiBm
b3Igd29ya2luZyBjb3JyZWN0bHkuIEkgd2lsbCBhZGQgdGhpcyB0bw0KPj4+PiB0aGUgY29tbWl0
IG1lc3NhZ2UuIFJlZ2FyZGluZyBQQ0kgcGFzc3Rocm91Z2gsIGl0IGlzIGFscmVhZHkgdXNpbmcg
dGhlDQo+Pj4+IHNhbWUgYXBwcm9hY2ggKGF0IGxlYXN0IG9uIEFybSkuIFRoZXJlIGFyZSBwYXRj
aGVzIGZvciBlbmFibGluZyBYZW4gb24NCj4+Pj4gQXJtIHRvIHBlcmZvcm0gYnVzIGVudW1lcmF0
aW9uIGJ5IGl0c2VsZiBieSBMdWNhIEZhbmNlbGx1LCBidXQgSSANCj4+Pj4gaGF2ZW4ndA0KPj4+
PiB5ZXQgZ290IHRvIHRlc3QgdGhlbSBpbiBhIG1lYW5pbmdmdWwgd2F5Lg0KPj4+DQo+Pj4gQ2Fu
IHlvdSBwcm92aWRlIGEgbGluayB0byB0aGUgc2VyaWVzPyBJIHdvdWxkIGxpa2UgdG8gbWFrZSBz
dXJlIHdlIGhhdmUNCj4+PiBhIGNvaGVyZW50IGFwcHJvYWNoLiBJbiBwYXJ0aWN1bGFyLCBpdCBp
cyBub3QgY2xlYXIgdG8gbWUgaG93IERvbTAgYW5kDQo+Pj4gWGVuIHdpbGwgYmUgYWJsZSB0byBj
b29yZGluYXRlIHRoZSBhY2Nlc3MgdG8gdGhlIFBDSSBjb250cm9sbGVyLiBBcmUgd2UNCj4+PiBn
b2luZyB0byBoYXZlIGEgbWVkaWF0b3I/DQo+Pj4NCj4+DQo+PiBIZXJlIGlzIGEgbGluayB0byBt
eSBXSVAgYnJhbmNoDQo+PiBodHRwczovL2dpdGh1Yi5jb20vRGVlZG9uZS94ZW4vdHJlZS9wY2lf
cGFzc3Rocm91Z2hfd2lwDQo+PiBBbHRob3VnaCBpdCBpcyBzbGlnaHRseSBvdXRkYXRlZCBkdWUg
dG8gcmVjZW50IHJldmlldyBhY3Rpdml0eSwgSSB3aWxsDQo+PiB1cGRhdGVkIGl0IHNvb24gd2l0
aCBhbGwgb2YgdGhlIHJlY2VudCBjaGFuZ2VzLg0KPj4NCj4+IEx1Y2EncyBjb21taXRzIGJlZ2lu
IGZyb20gYzY4YTVjYmIxYTdkMTc5MDc1NTExNTljOTlhYjVjODdjZTBkZWRmOQ0KPj4NCj4+IEkg
d2Fzbid0IGFibGUgdG8gZmluZCB0aGVtIHNlbnQgdG8gYW55IG1haWxpbmcgbGlzdHMsIGJ1dCBJ
IHBsYW4gdG8gYWxzbw0KPj4gc2VuZCB0aGVtIGFmdGVyIHRoZSBiYXNlIGNhc2Ugd2l0aCBEb20w
IGVudW1lcmF0aW9uIHN0YWJpbGl6ZXMuDQo+IA0KPiBJIGRvbid0IHRoaW5rIHlvdSBjYW4gc3Rh
YmlsaXplIG9uZSB3aXRob3V0IHRoZSBvdGhlci4gSSBhbSB3b3JyeSB0aGUgDQo+IGludGVyZmFj
ZSBtYXkgbm90IHdvcmsgcHJvcGVybHkgZm9yIFBDSSBwYXNzdGhyb3VnaC4gU28gdW50aWwgdGhl
biwgSSANCj4gd291bGQgc2F5IHRoaXMgc2hvdWxkIGJlIG1hcmtlZCBhcyB1bnN1cHBvcnRlZCAo
bWF5YmUgcHJvdGVjdGVkIGJ5IA0KPiBDT05GSUdfVU5TVVBQT1JURUQpLg0KDQpJdCBpcyBjdXJy
ZW50bHkgbm90IHBvc3NpYmxlIHRvIGVuYWJsZSBIQVNfUENJIG9uIEFybSBhdCBhbGwuIEkgd2ls
bCBhZGQgDQp0aGUgVU5TVVBQT1JURUQgZ3VhcmQgYWxvbmcgd2l0aCB0aGUgZnV0dXJlIGNoYW5n
ZXMgdG8gS2NvbmZpZyB0aGF0IHdpbGwgDQptYWtlIGVuYWJsaW5nIEhBU19QQ0kgb24gQXJtIHBv
c3NpYmxlLg0KDQo+Pg0KPj4gVGhlcmUgaXMgbm8gbWVkaWF0b3IsIERvbTAgY29uZmlndXJlcyB0
aGUgaG9zdCBjb250cm9sbGVyLCBlbnVtZXJhdGVzDQo+PiBjaGlsZCBkZXZpY2VzLCBhbmQgdGhl
biBnaXZlcyBjb21wbGV0ZSBhY2Nlc3MgdG8gc29tZSBvZiB0aGVtIHRvIFhlbi4NCj4+IFhlbiBv
bmx5IGRvZXMgImxvZ2ljYWwiIG9wZXJhdGlvbnMgd2l0aCBjaGlsZCBkZXZpY2VzIGFuZCBkb2Vz
IG5vdA0KPj4gY2hhbmdlIGFueSBvZiB0aGUgaG9zdCBjb250cm9sbGVyIGJhc2Ugc2V0dGluZ3Mu
DQo+IA0KPiBJIGFtIG5vdCBzdXJlIEkgZnVsbHkgdW5kZXJzdGFuZGluZyB0aGlzLiBCb3RoIGRv
bTAgd2lsbCBuZWVkIHRvIGFjY2VzcyANCj4gdGhlIGNvbmZpZ3VyYXRpb24gc3BhY2UuIFNvIHlv
dSB3b3VsZCBuZWVkIHRvIGVuc3VyZSB0aGVyZSBpcyBvbmx5IG9uZSANCj4gYWNjZXNzaW5nIHRo
ZSBjb25maWd1cmF0aW9uIHNwYWNlIGF0IGEgZ2l2ZSB0aW1lLg0KPiANCg0KSWYgYSBjb250cm9s
bGVyIGRvZXNuJ3QgcmVxdWlyZSBzcGVjaWZpYyBjb25maWd1cmF0aW9uIGZvciBtYXBwaW5nIGNo
aWxkIA0KYnVzIHRoZW4gWGVuIHNob3VsZCBhY2Nlc3Mgb25seSBjaGlsZCdzIGNvbmZpZyBzcGFj
ZSBhbmQgaWYgRG9tMCBpZ25vcmVzIA0KdGhpcyBkZXZpY2UgdGhlcmUgd2lsbCBiZSBubyBjb25m
bGljdHMuIEZvciBtb3JlIGNvbXBsZXggY29udHJvbGxlcnMgDQpsaWtlIHRoZSBvbmVzIG9uIFIt
Q2FyIGJvYXJkcyBpdCBpcyBwb3NzaWJsZSB0byBpbXBsZW1lbnQgc2FmZXIgd2F5cyBvZiANCm1h
cHBpbmcgY29uZmlnIHNwYWNlIHZpYSBYZW4sIGV4YW1wbGUgcGF0Y2ggaGVyZVsxXSBhcyB0ZW1w
b3Jhcnkgc29sdXRpb24uDQoNCj4+IFRvIGVuc3VyZSB0aGF0IERvbTANCj4+IHdpbGwgbm90IG1l
c3Mgd2l0aCB0aGUgY2hpbGQgZGV2aWNlcywgdG9vbHMgYmluZCB0aGVtIHRvIHRoZSBzdHViDQo+
PiBkcml2ZXIuIFRoZW9yZXRpY2FsbHksIERvbTAgY2FuIGJpbmQgdG8gdGhvc2UgZGV2aWNlcyBh
Z2FpbiBhbmQgYnJlYWsNCj4+IHNvbWV0aGluZywgYnV0IGl0IGNhbiBhbHNvIGRvIGEgbG90IG9m
IG90aGVyIGJyZWFraW5nIHN0dWZmIHNvIEkgZG9uJ3QNCj4+IHRoaW5rIHRoZXJlIGlzIGEgZ29v
ZCByZWFzb24gdG8gaW52ZW50IHNvbWUgZm9ybXMgb2YgcHJvdGVjdGlvbiBmcm9tIGl0Lg0KPiAN
Cj4gV2Ugc2hvdWxkIG5vdCB0cnVzdCBkb20wIHRvIGRvIHRoZSByaWdodCB0aGluZy4gQnV0IHJl
YWRpbmcgLi4uDQo+IA0KPj4NCj4+IEFmdGVyIHNvbWUgdGltZSB3aXRoIHBjaS1zY2FuIGNoYW5n
ZXMgbWVyZ2VkIGl0IHNob3VsZCBiZWNvbWUgcG9zc2libGUNCj4+IHRvIG1ha2UgWGVuIGRvIHRo
ZSBlbnVtZXJhdGlvbiwgYW5kIG9ubHkgZ2l2ZSBEb20wIHRoZSB2aXJ0dWFsIFBDSSBidXMsDQo+
PiB3aGljaCB3b3VsZCBwcmV2ZW50IGl0IGZyb20gYWNjZXNzaW5nIG5vbi1vd25lZCBkZXZpY2Vz
Lg0KPiANCj4gLi4uIHRoaXMgaXQgc291bmRzIGxpa2UgdGhpcyB3b3VsZCBiZSB0ZW1wb3Jhcnku
IERvIHlvdSBoYXZlIHBhdGNoZXMgDQo+IGFscmVhZHkgb24gdGhlIG1haWxpbmcgbGlzdD8NCj4g
ID4gQ2hlZXJzLA0KPiANCg0KTm90IHlldCwgSSBhbSBwbGFubmluZyB0byBzdGFydCB3b3JraW5n
IG9uIHRoZW0gYWZ0ZXIgZGVhbGluZyB3aXRoIE1TSSANCnN1cHBvcnQgb24gQXJtLg0KDQpbMV06
IA0KaHR0cHM6Ly9naXRodWIuY29tL3hlbi10cm9vcHMvbWV0YS14dC1wcm9kLWRldmVsLXJjYXIt
Z2VuNC9ibG9iL21hc3Rlci9sYXllcnMvbWV0YS14dC1kb21kLWdlbjQvcmVjaXBlcy1rZXJuZWwv
bGludXgvbGludXgtcmVuZXNhcy8wMDA1LUhBQ0stcGNpZS1yZW5lc2FzLWVtdWxhdGUtcmVhZGlu
Zy1mcm9tLUVDQU0tdW5kZXItWGUucGF0Y2gNCi0tIA0KTXlreXRh

