Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94FCAF5A78
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031183.1404924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWy5O-0004w5-3c; Wed, 02 Jul 2025 14:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031183.1404924; Wed, 02 Jul 2025 14:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWy5O-0004tA-0U; Wed, 02 Jul 2025 14:05:18 +0000
Received: by outflank-mailman (input) for mailman id 1031183;
 Wed, 02 Jul 2025 14:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9+Tq=ZP=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uWy5M-0004t1-MC
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:05:16 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90fdd432-574d-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 16:05:10 +0200 (CEST)
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 (2603:10a6:102:32a::16) by DBBPR03MB10510.eurprd03.prod.outlook.com
 (2603:10a6:10:53c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.20; Wed, 2 Jul
 2025 14:05:07 +0000
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673]) by PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673%3]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 14:05:07 +0000
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
X-Inumbo-ID: 90fdd432-574d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKXJVrHb8BJb8rN6vtbtegg8s5b8YUsVF28Ydnvgn2GK6xzHnBIyTkZb1+8Ln7aeiV0NBKSzeVruyGZNo+/JqKMeNmlFZy3RuhN3w8GjGVhm4miZjYIr0VYOdCHDJ26XS7t5BxJJ+U2RY3GyULOAYLzqJqaPSyYVMmpU4/bZPmsYUntKHmF8MBfxVJxSHg2beV2rFcXUAwcPgWrFyFVzBFmNpRLKawImlyBecb86pzGAXsXlEgyTudYlQwELiRVe1CZ9r/hvvW9B/ZlwtEv5tRUcgGZVmQD3U7+vcADQfsGCzN88vbBXC7g1JGnFm+RYeBCb/azexjrEJgD+ORS7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR6Xcx6hSElClwQM5kxB1BR3kYJ0Z3NzmSSAGj4jo+s=;
 b=oyN79NGIbU3WzVHsKjt9BtnUGIRtBxbyYH2/MGF7+/FB45q3DzHE6YyeR+tADOi4h0Cr2DX/Lf2542zuIWtkLS2eYYtf+W+TqzgfoR5Eh1jPMNZ9AAyTfevFHrXTV+703z3XNMPVc6xrZ8GqahW2dcYjIYMsG1tBuieOm7F92shsPasdNFjo7pI7p2XWdiyChe5C8u9PC2CnRqX+oELd/mUeoD/DDtI+BKM9iFb0j3iWPTpn/zdUHvmsv8TWJtiZEYt5nPX84tFnw5ogbpOaZx/ypU36xRoNHYVFJmll3bjM7fOwU43ROzY3EkRCKOFzNcwJxwaxbvDlClGhb9pP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rR6Xcx6hSElClwQM5kxB1BR3kYJ0Z3NzmSSAGj4jo+s=;
 b=ZXzVBg6Uc2bv9IdR+wlREwHJlzI+vQD9L43vIksXjJVRuUuEHEC0yv6eXMkA60nFcKgiFPHH2eCUCEW/2WvPXtFZFKJnTnbMowZynleVj/eLgNWp1D+wD1lPglIeGHxD/xelhAESCcS0fW8PVtL/akz7yMh8TWvsVCFTHNupKFuc3aUqKnBng2YFahN4GoeUzDzE+BfjPNOtsQ3SHlSFSMDZpVQ7TPk1fGS16XB0YNiQ5IVkuSuwSr4St9S74QncNNu9RceHjczhnp6447DXVJnFzx2va1+v8wOFBCNF9c9KDdvZVtInqr8DWGq1tRb7gHEwhxwaqB7oAzdQ63z2Fw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"julien@xen.org" <julien@xen.org>, "roger.pau@citrix.com"
	<roger.pau@citrix.com>, "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>, "federico.serafini@bugseng.com"
	<federico.serafini@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH v6] automation/eclair: update configuration of D4.10
Thread-Topic: [PATCH v6] automation/eclair: update configuration of D4.10
Thread-Index: AQHb61pQiVWFZuQzhEmR/C63uK1zeg==
Date: Wed, 2 Jul 2025 14:05:07 +0000
Message-ID: <1a81c81d-752e-4d54-b35d-7b0ab940a593@epam.com>
References:
 <alpine.DEB.2.22.394.2506231650080.862517@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2506231650080.862517@ubuntu-linux-20-04-desktop>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10142:EE_|DBBPR03MB10510:EE_
x-ms-office365-filtering-correlation-id: 9a248d47-c246-4957-1432-08ddb9717330
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|42112799006|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SmtkWHk3cy9QYzFzYnJqRkE0VTZPeXpYcGRBQTdIZlIrWWVXWFJmSXB4cEx0?=
 =?utf-8?B?NTRQUnZmTFZBVGhZNk9lZjcrTlRqK21hMVVDSjFMTWdKRWhJQ0MrM2JzZXBQ?=
 =?utf-8?B?WDRSUGd6bkZTWEZ0VTQzVml2QkJRazdqdG1pSUtRcDB0OUUxUHJESjFvci9J?=
 =?utf-8?B?djByOTNJbjNwVzI2aU15V3UzZVIyQzJoYUZtVDNFYXZxaGhWVnpzbHM1cis1?=
 =?utf-8?B?elhCdTh5ODBXN3I1WElrK09SZEl0RmJQY2dMRUhNeFZNS3FKRlpsZ0tBL1VI?=
 =?utf-8?B?UFBYdFAySnkyaFl3azkwckhCSmx5RkU0bEFONDBkYzNyWWtoUVBJZXFGLzBq?=
 =?utf-8?B?cHpaa3Y0MUpPVEQwK3A5SEI5Z2dUMXBBZk9tTm03dSs2ejNTcGxTeVE4WFRt?=
 =?utf-8?B?Zzg2eDFjaTNjNThkWFJ1YlZpdGp4b21ySXhveUtSQS9TVGdEeTJ0eEl1Q0pn?=
 =?utf-8?B?aUcvOTc0T1JKZHdCWHVEVGhJeWp6YUVubU5LYUVISCtZK3FwdnduSlZoMDQv?=
 =?utf-8?B?SnJ0aktiVmVoSUxRb2s0OWM2a3FldUNQNW1UdmNrMTZFSlNMeEQwNUNubEZo?=
 =?utf-8?B?a3cvY0RWSVlYZm9jWkxhSlJJNk5qWmcrYkZwVlVNYStRM1lhdHFJa0M5MFIw?=
 =?utf-8?B?amhCVWhrenZtd2svK3FxcndHVWJ2K0Jac1FJbWRSZi9WYXFFVGlsYjUwcVNz?=
 =?utf-8?B?R0pNTlN1K3dWMlJjTWRDN0dDTHFJdVI0cFVCbnliM3pUcmdlL0dQdm9RZnU0?=
 =?utf-8?B?VW4wVkhabUE3R3hqYnVKV0NvcWJBUmZTV0VDT1E5N0oxMFZ0ajFZbnhTSXZD?=
 =?utf-8?B?Zzh0UVpMck1ET0YrUDNYc3FDYjJIRWcrWVVLRHJhYlNMN0FFS1hIQ25VS2hH?=
 =?utf-8?B?Y2NpRzlrMkRuR2h5Snh5S3J5bjdNOVRHYTk1K01DTVJVQlh6Y2hZQ3NDa0Nk?=
 =?utf-8?B?aXNMckVkMzJjaGtkdEdHVU5aa3Zwb09QVEZxMkV6SWtPZm5GYWt4UGZqSFdT?=
 =?utf-8?B?Sy9IN1JadGl6WEFMSmU3eFlhWVRuRkFOVC9qS09kNi8rblJwbTZ2S2xKdEVX?=
 =?utf-8?B?V2E1UFpCYWhiSFhCZ1lrUDFwcFZpcWw1RmxXMWM5Q0pDTkFQVzFVZ1BoWnhG?=
 =?utf-8?B?TXRGdjhnbXl0KzQxaTNBSjJrRHRpQmJJYk50cm5GTlVNNXJ4ak9TcU1FU29W?=
 =?utf-8?B?K2tUUTlydUdZWXNnZW1OQlBRS2RSN2hGc0tZT0EzMUpGMXNReXdpY00xN202?=
 =?utf-8?B?bjkyMlJ0VDhGMnA5SE1lWklKMlZValZlUVNwL2UrY25LWGc0cFNKdVJTcTZy?=
 =?utf-8?B?R0U0aTIzRWt4WHc4amNjdStZSlo3aUZONkFwczFrTHp0UDRlQUo2ckJENXh5?=
 =?utf-8?B?dHYzYUZiQXNOTXpFc2RrU2w3MWFtZ0IvR3N5UTRxN0pjQmY1UCs2MEgvMjNF?=
 =?utf-8?B?Ym9ib3lLY0tHZlN2cHpEZ2EyaktPcU44Vk1XcVZ0Z3J0N1BMNUtoQmxBNnRw?=
 =?utf-8?B?V1htdmFQU2xvUzU4dkxyRjdMRXd3Z3krRzNIWGdPWlhMYXhGUThxK3RqMFc5?=
 =?utf-8?B?UUFRTjBoTWE2dlZkMlhvQ0N3bGVkK0dTbTByVU16NGROVDRrMzN2RXZHbzM0?=
 =?utf-8?B?alUwQmJxUldwalU1TlBWU21Yb0g5K2w0V0xXOXUvdCtWZWFEWlhLM2ZQZWxs?=
 =?utf-8?B?ZG12Q0NzR3d0UDByQkc4ZE1oZkk0c3F6RUY0VVZzbnppK280L29XVDBDWHdh?=
 =?utf-8?B?clorTm5zbzhkL25ydU5EZ0FrcjloUVFIQlh1R0RzTmMxZmVVVTAyWm01VVRM?=
 =?utf-8?B?bG1vRDVMZzdDNjNHaFpSNk16RXdESDlRY0lrQ1FMQ3B4MUExUHc3M29RUFlU?=
 =?utf-8?B?VThQQXR1K09rRDRFRFpLMlJpWWtmUm1kNEJVYXFJc0JKeGxsRmpXajlDeEo0?=
 =?utf-8?B?QXZnNEVOZStqRzNvTU0rRzFGTkdidXRkU2k4UWVSTDZWb3NkdDZXOW43ajdF?=
 =?utf-8?Q?wLr2X3AYiuaVkQUuJW0tHzcB5f4ctQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10142.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(42112799006)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QU9xdy9YRXd6L0hEV25Vend5VitWditKUitNcGRzN2pHQlRJMDFLVDJMSnJU?=
 =?utf-8?B?MG5qU25VTCtXNDlqT3lFUitNNGhZakl4YTd0d2dqWHlKdzVJVGtud3FNcUtp?=
 =?utf-8?B?d3FnMUVMWkVXRmllbmNXYSttKzRMZHBLUHlJTjg0dXhVNlFpdHhESFhUeHM2?=
 =?utf-8?B?WlUyNnRpeVpDVW82djNXeE5ucXgybHUrTVc5eno2M2R4VjhmTVE4bVgrV29t?=
 =?utf-8?B?U2lxZmE5T054NlFDZ1ZVQ3QzVTZXampaK0hRT25vUEsyWW9YZHBQQjFWVldk?=
 =?utf-8?B?c09qTmU5MDdyOWZXVis1ekd4dDZKU2ltbEFHeS9tdklBTm8xQUVTOG1nTmE5?=
 =?utf-8?B?TUNrRFB1SmNQTVhCSmE0VG8zWU9JQU52OTNKSWNPTzU5NE5nR296cEt2Zk9p?=
 =?utf-8?B?NmJLT1ZPQUIxT0RZajJuaEpTVUJrU1FlUVdpMWtmcWZuY3h1OG0xVmdaTDFv?=
 =?utf-8?B?Z011cUpTdUZneUdyY3g2ZzlNZWNrc0xZeWVmY1duc0dIcklkNUZ3eTNqSDB4?=
 =?utf-8?B?aGxpNTdTU3RKSzVlMzAzRVp6blgxWkI0ektRUUFPNi9Ta2dTSkpUREtQa0wr?=
 =?utf-8?B?TllEN3JlbXh1ZVcyY3F3Vkx1ZXZ4VG9ZQXNsQjFPMjBub2N4V0kySXJSZ3ZG?=
 =?utf-8?B?eDlwVUZiZC9hNFgyTjBhL09jRmVDM2h5SEl4UnlZNlArdDJqY3MyQTRIbCtK?=
 =?utf-8?B?dkVQWE41NkNvZzhzbGlXaE9KV2ozbEVsWGcwWGJJZjVQNkFRNVJ5bm1rRytE?=
 =?utf-8?B?b1dnZFZOb0Z5Z1JUSkZ3ZzAxZlFsOHNFM1o0UXJSR3hqTlRYQXRORUR4bkhw?=
 =?utf-8?B?RFdGTkd6WGdqdlZKb3NNaEMwMENqTk9jY1d3cFVMQ1NqT3dEOUNJZ1ZjWXpq?=
 =?utf-8?B?ZklZd2YzOHRPRzRFUlFBSXdPVk85RHZjVGxSUGx3SDRUdTRpMndrQ1J5UnVS?=
 =?utf-8?B?bm5kaWRMcUF2ZkcyWkcrWVRiWnQrcWdScy9hSE11M2VSQ0JhS29OMTBkZFZv?=
 =?utf-8?B?TWtjSktDM3V1dTZDNWJyblNnRWl5TnRtWDRUZnppUUpORjNOM3J4MzQvR2Mw?=
 =?utf-8?B?TG16OGJkcGVkTnRFZmFEMDZIQ0FhY3dkSUVLUnBaN1lEdnBoSGNwN3kzMVBD?=
 =?utf-8?B?dUJHaEs3RHRoOEd1by9GeWxSR005ZTV5cVk2dHJVcGJva0svbzFNd3lsWHpO?=
 =?utf-8?B?OGpYNnBhaUY3WVYrVmsyQnZ1Sk1VRkpLbW1TWmREckloa0w0L2VmSHdHbm1o?=
 =?utf-8?B?WXNmc1B0WmJUZVNxZThweTdkbWdVdGk2UzdpQS8weWcxZTdkcFZJeEpJb0wv?=
 =?utf-8?B?UUhyV3k3ZFdvVlFud2JmTkEwRGFQZDhFa1BvRlB0WFMzVENUajhwM090ZlVu?=
 =?utf-8?B?VGR3OUxVUmk4K3E0dWJJZE5qUXlaN1dTUUpRd3FWMnB6L0N3bUJybGZzUjBH?=
 =?utf-8?B?TUVnYXBuMFVKUmphSmxDaVpOMzN4QnVrQ3NoWHZjeE9Nc2VndllpSGtjbjFB?=
 =?utf-8?B?anI1TWlyOUNwYm9jeHlJTnUrTWQvV25SUDVFMzN5ZWh0UktSZjBmdHVyY1VK?=
 =?utf-8?B?bGorZFN1N3o4U2FqMklDNHAxanJxR0ZGbytJMzNQcWNLYUVMY1dneHNRMFBC?=
 =?utf-8?B?Q3J4QmtjZ1RkQStnRTVDZnJBeEpxUGxMZ3VBTTdhMjRWdnZSRDZXQ1c5V3U0?=
 =?utf-8?B?UjJiK0FGditmQzhIR2lBam5haGo3cjlkNVV3bFl0emwrbVZ5ZWFWMkJHS29a?=
 =?utf-8?B?bFE1VG9XcVFlaWZqaTM0ZmpoSVBCZFY2TDIrTUcxTzJZM3hLcFpDaGZ0Qms2?=
 =?utf-8?B?WXdZb2JYSUsvOHRwTzJqWmtPM0szeHpGSXlLelJpRndZcFVWUDUvbFFXSDlo?=
 =?utf-8?B?UjFHbVFsWS9pOFM5eHBZblo3Q29FdVpoMzcrK0d5VWt4RmsveElDYzBjYTUy?=
 =?utf-8?B?RnFSaVFZS1hlN211QXJaTW0yS1JKbnJoKzVOV0haMWJVZzVBSnlkS28rdjM4?=
 =?utf-8?B?WHV1bVJYQnpVRmlIdFlkRG90b2tDTVpCSjMwdlpKNmhReGwrVGxkOW83MWJw?=
 =?utf-8?B?MjExbGRQREpBK3krOTlKN0NqVkxkaTVCUUxvdjBtYzgrenRuNG9yaDl2cllN?=
 =?utf-8?B?bUNoeFpGOUxEamhWNFR2dkhiNHNYUjcvR3locnE4SEZMKzZkcG91UjBGNnVZ?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEF795D14279BA42A552C18322CE063D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10142.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a248d47-c246-4957-1432-08ddb9717330
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 14:05:07.1012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DxYj7c4c9xIAH863SV3sJhoRrxnU47uR7OOeW8AuHzIO8UeU7H1W4x2k8iPEEkhdLn7hF/S27kQ+mI06G9ph/r+XZDT/gln6O2lyIelEof0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10510

SGVsbG8sIEFsbCENCg0KRG8geW91IGhhdmUgYW55IGNvbW1lbnRzIG9uIHRoaXMgcGF0Y2g/DQrQ
km9lcyBpdCBuZWVkIGFueSBpbXByb3ZlbWVudD8NCg0KQlIsIERteXRyby4NCg0KT24gNi8yNC8y
NSAwNDoxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBNSVNSQSBDIERpcmVjdGl2ZSA0
LjEwIHN0YXRlcyB0aGF0ICJQcmVjYXV0aW9ucyBzaGFsbCBiZSB0YWtlbiBpbiBvcmRlcg0KPiB0
byBwcmV2ZW50IHRoZSBjb250ZW50cyBvZiBhIGhlYWRlciBmaWxlIGJlaW5nIGluY2x1ZGVkIG1v
cmUgdGhhbg0KPiBvbmNlIi4NCj4gDQo+IEFkZCBhIFNBRiB0YWcgYW5kIHVwZGF0ZSB0aGUgY29t
bWVudCBvbiB0b3Agb2YgY3B1ZmVhdHVyZXMuaC4NCj4gQWRkIGEgaGVhZGVyIGluY2x1c2lvbiBn
dWFyZCB0byBjb21waWxlLmguDQo+IEdlbmVyYXRlIGhlYWRlciBndWFyZHMgZm9yIGh5cGVyY2Fs
bC1kZWZzLmgNCj4gDQo+IFVwZGF0ZSBFQ0xBSVIgY29uZmlndXJhdGlvbiB0bzoNCj4gLSBleHRl
bmQgZXhpc3RpbmcgZGV2aWF0aW9uIHRvIG90aGVyIGNvbW1lbnRzIGV4cGxpY2l0bHkgc2F5aW5n
IGEgZmlsZQ0KPiAgICBpcyBpbnRlbmRlZCBmb3IgbXVsdGlwbGUgaW5jbHVzaW9uOw0KPiAtIGV4
dGVuZCBleGlzdGluZyBkZXZpYXRpb24gdG8gb3RoZXIgYXV0b2dlbmVyYXRlZCBmaWxlczsNCj4g
LSB0YWcgdGhlIGd1aWRlbGluZXMgYXMgY2xlYW4uDQo+IA0KPiBVcGRhdGUgZGV2aWF0aW9ucy5y
c3QgYWNjb3JkaW5nbHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGZWRlcmljbyBTZXJhZmluaSA8
ZmVkZXJpY28uc2VyYWZpbmlAYnVnc2VuZy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQo+IEFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ICMgeDg2DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHY2
Og0KPiAtIHJlbW92ZSBpbi1jb2RlIGNvbW1lbnQgYW5kIHVzZSBTQUYtOC1zYWZlIGluc3RlYWQN
Cj4gLSBhZGQgaGVhZGVyIGd1YXJkcyBmb3IgaHlwZXJjYWxsLWRlZnMuaA0KPiANCj4gU3VjY2Vz
c2Z1bCBwaXBlbGluZToNCj4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9z
c3RhYmVsbGluaS94ZW4vLS9waXBlbGluZXMvMTg4NTU2MTA0MA0KPiAtLS0NCj4gDQo+IGRpZmYg
LS1naXQgYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wg
Yi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4gaW5k
ZXggOWM2NzM1OGQ0Ni4uM2I1YmM4N2UxZCAxMDA2NDQNCj4gLS0tIGEvYXV0b21hdGlvbi9lY2xh
aXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlvbnMuZWNsDQo+ICsrKyBiL2F1dG9tYXRpb24vZWNs
YWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPiBAQCAtNzIsMTEgKzcyLDE0IEBA
IHRoZXkgYXJlIG5vdCBpbnN0YW5jZXMgb2YgY29tbWVudGVkLW91dCBjb2RlLiINCj4gICAtY29u
ZmlnPU1DM0EyLkQ0LjMscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbnlfYXJlYShhbnlfbG9jKGZp
bGUoYXJtNjRfYml0b3BzKSkmJmNvbnRleHQobmFtZShpbnRfY2xlYXJfbWFzazE2KSkpIn0NCj4g
ICAtZG9jX2VuZA0KPiAgIA0KPiAtLWRvY19iZWdpbj0iRmlsZXMgdGhhdCBhcmUgaW50ZW5kZWQg
dG8gYmUgaW5jbHVkZWQgbW9yZSB0aGFuIG9uY2UgZG8gbm90IG5lZWQgdG8NCj4gLWNvbmZvcm0g
dG8gdGhlIGRpcmVjdGl2ZS4iDQo+ICstZG9jX2JlZ2luPSJGaWxlcyB0aGF0IGFyZSBpbnRlbmRl
ZCB0byBiZSBpbmNsdWRlZCBtb3JlIHRoYW4gb25jZSAoYW5kIGhhdmUNCj4gK2EgY29tbWVudCB0
aGF0IHNheXMgdGhpcyBleHBsaWNpdGx5KSBkbyBub3QgbmVlZCB0byBjb25mb3JtIHRvIHRoZSBk
aXJlY3RpdmUuIg0KPiAgIC1jb25maWc9TUMzQTIuRDQuMTAscmVwb3J0cys9e3NhZmUsICJmaXJz
dF9hcmVhKHRleHQoXi9cXCogVGhpcyBmaWxlIGlzIGludGVuZGVkIHRvIGJlIGluY2x1ZGVkIG11
bHRpcGxlIHRpbWVzXFwuIFxcKi8kLCBiZWdpbi00KSkifQ0KPiAtLWNvbmZpZz1NQzNBMi5ENC4x
MCxyZXBvcnRzKz17c2FmZSwgImZpcnN0X2FyZWEodGV4dCheL1xcKiBHZW5lcmF0ZWQgZmlsZSwg
ZG8gbm90IGVkaXQhIFxcKi8kLCBiZWdpbi0zKSkifQ0KPiAtLWNvbmZpZz1NQzNBMi5ENC4xMCxy
ZXBvcnRzKz17c2FmZSwgImFsbF9hcmVhKGFsbF9sb2MoZmlsZSheeGVuL2luY2x1ZGUvZ2VuZXJh
dGVkL2F1dG9jb25mLmgkKSkpIn0NCj4gKy1jb25maWc9TUMzQTIuRDQuMTAscmVwb3J0cys9e3Nh
ZmUsICJmaXJzdF9hcmVhKHRleHQoXi9cXCogR2VuZXJhdGVkIGZpbGUsIGRvIG5vdCBlZGl0ISBc
XCovJCwgYmVnaW4tMy4uLmJlZ2luLTIpKSJ9DQo+ICstZG9jX2VuZA0KPiArDQo+ICstZG9jX2Jl
Z2luPSJBdXRvZ2VuZXJhdGVkIGZpbGVzIHRoYXQgZG8gbm90IG5lZWQgdG8gY29uZm9ybSB0byB0
aGUgZGlyZWN0aXZlLiINCj4gKy1jb25maWc9TUMzQTIuRDQuMTAscmVwb3J0cys9e3NhZmUsICJh
bGxfYXJlYShhbGxfbG9jKGZpbGUoXnhlbi9pbmNsdWRlL2dlbmVyYXRlZC9hdXRvY29uZlxcLmgk
KSkpIn0NCj4gICAtZG9jX2VuZA0KPiAgIA0KPiAgIC1kb2NfYmVnaW49IkluY2x1ZGluZyBtdWx0
aXBsZSB0aW1lcyBhIC5jIGZpbGUgaXMgc2FmZSBiZWNhdXNlIGV2ZXJ5IGZ1bmN0aW9uIG9yIGRh
dGEgaXRlbQ0KPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlS
L3RhZ2dpbmcuZWNsIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL3RhZ2dpbmcu
ZWNsDQo+IGluZGV4IGY5ZGE1ZDVmNGQuLmI5NWYwN2ZlYjAgMTAwNjQ0DQo+IC0tLSBhL2F1dG9t
YXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi90YWdnaW5nLmVjbA0KPiArKysgYi9hdXRvbWF0
aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvdGFnZ2luZy5lY2wNCj4gQEAgLTIzLDYgKzIzLDcg
QEANCj4gICAiTUMzQTIuRDEuMXx8DQo+ICAgTUMzQTIuRDIuMXx8DQo+ICAgTUMzQTIuRDQuMXx8
DQo+ICtNQzNBMi5ENC4xMHx8DQo+ICAgTUMzQTIuRDQuMTF8fA0KPiAgIE1DM0EyLkQ0LjE0fHwN
Cj4gICBNQzNBMi5SMS4xfHwNCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5y
c3QgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+IGluZGV4IGZlMGIxZTEwYTIuLjYzY2Fh
OGY0YTIgMTAwNjQ0DQo+IC0tLSBhL2RvY3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QNCj4gKysrIGIv
ZG9jcy9taXNyYS9kZXZpYXRpb25zLnJzdA0KPiBAQCAtMzAsNiArMzAsMTggQEAgRGV2aWF0aW9u
cyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBEaXJlY3RpdmVzOg0KPiAgICAgICAgICBub3QgdG8g
YWRkIGFuIGFkZGl0aW9uYWwgZW5jYXBzdWxhdGlvbiBsYXllci4NCj4gICAgICAgIC0gVGFnZ2Vk
IGFzIGBkZWxpYmVyYXRlYCBmb3IgRUNMQUlSLg0KPiAgIA0KPiArICAgKiAtIEQ0LjEwDQo+ICsg
ICAgIC0gRmlsZXMgdGhhdCBhcmUgaW50ZW5kZWQgdG8gYmUgaW5jbHVkZWQgbW9yZSB0aGFuIG9u
Y2UgKGFuZCBoYXZlDQo+ICsgICAgICAgYSBjb21tZW50IHRoYXQgc2F5cyB0aGlzIGV4cGxpY2l0
bHkpIGRvIG5vdCBuZWVkIHRvIGNvbmZvcm0gdG8gdGhlDQo+ICsgICAgICAgZGlyZWN0aXZlLg0K
PiArICAgICAtIFRhZ2dlZCBhcyBgc2FmZWAgZm9yIEVDTEFJUi4NCj4gKw0KPiArICAgKiAtIEQ0
LjEwDQo+ICsgICAgIC0gVGhlcmUgYXJlIGF1dG9nZW5lcmF0ZWQgZmlsZXMgdGhhdCBkbyBub3Qg
bmVlZCB0byBjb21wbHkgdG8gdGhlDQo+ICsgICAgICAgZGlyZWN0aXZlLg0KPiArICAgICAtIFRh
Z2dlZCBhcyBgc2FmZWAgZm9yIEVDTEFJUi4gU3VjaCBmaWxlcyBhcmU6DQo+ICsgICAgICAgIC0g
eGVuL2luY2x1ZGUvZ2VuZXJhdGVkL2F1dG9jb25mLmgNCj4gKw0KPiAgICAgICogLSBENC4xMA0K
PiAgICAgICAgLSBJbmNsdWRpbmcgbXVsdGlwbGUgdGltZXMgYSAuYyBmaWxlIGlzIHNhZmUgYmVj
YXVzZSBldmVyeSBmdW5jdGlvbiBvciBkYXRhIGl0ZW0NCj4gICAgICAgICAgaXQgZGVmaW5lcyB3
b3VsZCBpbiAodGhlIGNvbW1vbiBjYXNlKSBiZSBhbHJlYWR5IGRlZmluZWQuDQo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZXMuaCBiL3hlbi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlcy5oDQo+IGluZGV4IDllM2VkMjFjMDIuLmRjZTA3MTNh
ZGYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlcy5o
DQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlcy5oDQo+IEBAIC0x
LDcgKzEsNiBAQA0KPiAtLyoNCj4gLSAqIEV4cGxpY2l0bHkgaW50ZW5kZWQgZm9yIG11bHRpcGxl
IGluY2x1c2lvbi4NCj4gLSAqLw0KPiArLyogVGhpcyBmaWxlIGlzIGludGVuZGVkIHRvIGJlIGlu
Y2x1ZGVkIG11bHRpcGxlIHRpbWVzLiAqLw0KPiAgIA0KPiArLyogU0FGLTgtc2FmZSAqLw0KPiAg
ICNpbmNsdWRlIDx4ZW4vbGliL3g4Ni9jcHVpZC1hdXRvZ2VuLmg+DQo+ICAgDQo+ICAgLyogTnVt
YmVyIG9mIGNhcGFiaWxpdHkgd29yZHMgY292ZXJlZCBieSB0aGUgZmVhdHVyZXNldCB3b3Jkcy4g
Ki8NCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9jb21waWxlLmguaW4gYi94ZW4vaW5j
bHVkZS94ZW4vY29tcGlsZS5oLmluDQo+IGluZGV4IDMxNTFkMWU3ZDEuLjkyMDYzNDFiYTYgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9jb21waWxlLmguaW4NCj4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL2NvbXBpbGUuaC5pbg0KPiBAQCAtMSwzICsxLDYgQEANCj4gKyNpZm5kZWYgWEVO
X0NPTVBJTEVfSA0KPiArI2RlZmluZSBYRU5fQ09NUElMRV9IDQo+ICsNCj4gICAjZGVmaW5lIFhF
Tl9DT01QSUxFX0RBVEUJIkBAZGF0ZUBAIg0KPiAgICNkZWZpbmUgWEVOX0NPTVBJTEVfVElNRQki
QEB0aW1lQEAiDQo+ICAgI2RlZmluZSBYRU5fQ09NUElMRV9CWQkJIkBAd2hvYW1pQEAiDQo+IGRp
ZmYgLS1naXQgYS94ZW4vc2NyaXB0cy9nZW5faHlwZXJjYWxsLmF3ayBiL3hlbi9zY3JpcHRzL2dl
bl9oeXBlcmNhbGwuYXdrDQo+IGluZGV4IDFhN2UwNTFmZGUuLjQ3YTE4Y2Q3NWUgMTAwNjQ0DQo+
IC0tLSBhL3hlbi9zY3JpcHRzL2dlbl9oeXBlcmNhbGwuYXdrDQo+ICsrKyBiL3hlbi9zY3JpcHRz
L2dlbl9oeXBlcmNhbGwuYXdrDQo+IEBAIC0yLDYgKzIsOCBAQA0KPiAgICMgdGhlIGNhbGxzIG9m
IHRoZSBoYW5kbGVycyBpbnNpZGUgYSBzd2l0Y2goKSBzdGF0ZW1lbnQuDQo+ICAgDQo+ICAgQkVH
SU4gew0KPiArICAgIHByaW50ZigiI2lmbmRlZiBYRU5fSFlQRVJDQUxMX0RFRlNfSFxuIik7DQo+
ICsgICAgcHJpbnRmKCIjZGVmaW5lIFhFTl9IWVBFUkNBTExfREVGU19IXG5cbiIpOw0KPiAgICAg
ICBwcmludGYoIi8qIEdlbmVyYXRlZCBmaWxlLCBkbyBub3QgZWRpdCEgKi9cblxuIik7DQo+ICAg
ICAgIGUgPSAwOw0KPiAgICAgICBuID0gMDsNCj4gQEAgLTMxMSw0ICszMTMsNSBAQCBFTkQgew0K
PiAgICAgICAgICAgICAgICAgICBwcmludGYoIltfX0hZUEVSVklTT1JfJXNdID0gJWQsIFxcXG4i
LCBmbltjYWxsX2ZuW2ldXSwgbl9hcmdzW2NhbGxfZm5baV1dKTsNCj4gICAgICAgICAgIHByaW50
ZigifVxuIik7DQo+ICAgICAgIH0NCj4gKyAgICBwcmludGYoIlxuI2VuZGlmIC8qIFhFTl9IWVBF
UkNBTExfREVGU19IICovXG4iKTsNCj4gICB9DQo+IGRpZmYgLS1naXQgYS94ZW4vdG9vbHMvcHJv
Y2Vzcy1iYW5uZXIuc2VkIGIveGVuL3Rvb2xzL3Byb2Nlc3MtYmFubmVyLnNlZA0KPiBpbmRleCA1
NmM3NjU1OGJjLi40Y2YzZjlhMTE2IDEwMDc1NQ0KPiAtLS0gYS94ZW4vdG9vbHMvcHJvY2Vzcy1i
YW5uZXIuc2VkDQo+ICsrKyBiL3hlbi90b29scy9wcm9jZXNzLWJhbm5lci5zZWQNCj4gQEAgLTEy
LDMgKzEyLDggQEAgc18oLiopXyJcMVxcbiJfDQo+ICAgDQo+ICAgIyBUcmFpbGluZyBcIG9uIGFs
bCBidXQgdGhlIGZpbmFsIGxpbmUuDQo+ICAgJCFzXyRfIFxcXw0KPiArDQo+ICsjIEFwcGVuZCBj
bG9zaW5nIGhlYWRlciBndWFyZA0KPiArJGFcDQo+ICtcDQo+ICsjZW5kaWYgLyogWEVOX0NPTVBJ
TEVfSCAqLw0K

