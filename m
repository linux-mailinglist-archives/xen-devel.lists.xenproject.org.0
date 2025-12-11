Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00CCCB5A0A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 12:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183933.1506513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTel1-0004yj-96; Thu, 11 Dec 2025 11:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183933.1506513; Thu, 11 Dec 2025 11:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTel1-0004x6-5t; Thu, 11 Dec 2025 11:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1183933;
 Thu, 11 Dec 2025 11:22:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81ZL=6R=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vTekz-0004x0-Tj
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 11:22:49 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b92723cc-d683-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 12:22:48 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS4PR03MB8256.eurprd03.prod.outlook.com (2603:10a6:20b:4ff::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 11:22:43 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:22:43 +0000
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
X-Inumbo-ID: b92723cc-d683-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgO5tcuV3700cVRck17CoayPwYdTjyTuHbGY65V6oRD09rfY0MGE5ofWHPgLng8uWx9t80K2e0fYoHdPsqmOhNqqpYlRm2DV/kEYZA8+KLq6T/Tg6cHCz0wrx/jgjVV9mt/Gu1YxgTLdmQ2NqCRT04/zjJchcNpiySnCjUmoCYWr5kfk0VMpMn9oAhQduRQuX4iwDB2c+HbPcEWU+7BPpVX8cWbDM+Dor7vHTgEHr+M1BRVCy2LCVcd7N2vThpbbuD9Qj+AGrtJCX7CMYz5us//33ffL19WnXj9N3JpYffg1gt1/y+XLGdQNMGQKhchZS29N5hu6JEP6xCc/MFKvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQbi58JXUzkDen+l0T90nYWviOnUj4sHZjCNCvpXQW8=;
 b=PzMX6dmyegxV6a75zqcRwbvQhbsQQjmiXG+br8AhZMXyI38H/01gJhftXSgeqD9TGuRJRVMR0ii78eQpydmIR3hmh7FUb8XyRv9jcSvuGjlEQvwituykD+B03NiDzGSEI5A3kOTnogI4SPOsLGQ2tZJjd6A4U5GZvlyTIYz0l3MtN9l0FhAGqjaIhf2uEfiMULFbV/605EOohX6rvSqzI8IKemqaAUlj1Ap8YSgzuu+FFZFxz14ZJMqPqgdVxUQpwKAE4l33k4hJ+LTKpkdgwbj2E/Ww1kz1YV9N9dKrELaiuo3TtfLlS8wc5zETccK1I/IZJmp1SaDQ5MdSKlJJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQbi58JXUzkDen+l0T90nYWviOnUj4sHZjCNCvpXQW8=;
 b=pb0gUYje4T3v147LUDXNb2SuioSWyQQV8fn74nsTq1aHJ0iukH+oMYV7CESmEJiVfyMqM0Mp61bwf51OI8hPsvp2+LK9gV71ruWkxjbCFttY4njf3mnF0/qJrWMNUgo7MQ2HvWUjwY4agLMWPj3lwGFZjOAH4ZDYCNfTbiukPHCjf+lNz4D02TXbl8zNcmuF2ZfF4yrObNptL7IujKrfa8MHtb4Z/5yc45EZquRwrdk/oBJh/YlDfc01romMzR+pwwYxJG1RzUo8wS+uz9SvaKCVy8bB9Wm5RoTq3rSy8OOCHF6CqdoUretvpTOq7y+p8ViS5ufvZCeE7dYBmCibrg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] misra: address Rule 11.3 for NextMemoryDescriptor macro
Thread-Topic: [PATCH] misra: address Rule 11.3 for NextMemoryDescriptor macro
Thread-Index: AQHcREbgd161cNZLPEqc4+KUMk5T6LUaVeOAgAAAj4CAAkHvgA==
Date: Thu, 11 Dec 2025 11:22:43 +0000
Message-ID: <9de12f57-e782-4ea7-9ee9-62114e9e709b@epam.com>
References:
 <78112778d6fd5f720f7102db7125c844b747a962.1761242341.git.dmytro_prokopchuk1@epam.com>
 <alpine.DEB.2.22.394.2512091651570.19429@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2512091653450.19429@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2512091653450.19429@ubuntu-linux-20-04-desktop>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS4PR03MB8256:EE_
x-ms-office365-filtering-correlation-id: 0e17ed4f-fb67-4343-ceea-08de38a79a9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NXNVakRrb2JVQ1pFMmNkUWdXN0hZanlkMHNFK25UWjNHakFoUGJXOHJMUVA2?=
 =?utf-8?B?L0Y1OHZOTVNmNnF3d0NmWEYvd0RFRXJhQjQ4M2hiTzEzK0ZkWWZCTGJNQTI4?=
 =?utf-8?B?ZXpxaDFnRHZXd1o3NGF6WUdXY1hNNEZwWXNTS2ExMVFLcmc3OTZMTGgyU1p4?=
 =?utf-8?B?T1VkWGNCUWhuV2NYbTkvQXJDd3BnWmdQNldRRXpqSW4vbVNhVXIyTk41QVdE?=
 =?utf-8?B?Y2w1NW4yUVRsZ3VXTlJHUDRtNHhXcm43Wkg4L0dRcmxRcjQ2RnBRaXZOZWJY?=
 =?utf-8?B?bmRnUW90enZOUzFsVFNBSXdTUlNxYVZ4bkJzdGtheWZQcklnNktBVjFHNmxB?=
 =?utf-8?B?TjJpTDR6Q0RQNmk2QjIzV3FoS0I2QjBYR00zL0IvNnA4QldqVXQyb1Vkdk9N?=
 =?utf-8?B?eXJHblRMTGw3RmxGM2plbkgyNnhaVVJvLy9tV0xtQVRieElpcVJYbjEwbjJG?=
 =?utf-8?B?ZTVxR3FwQ3lDZnNFbWpFS3dmZUJHanRscE1KNUlCbk1NcjF5YmZPOUUxQ0w5?=
 =?utf-8?B?QmI1dFB4WkZsVW5ud1VnRUJLRWRqKzN1QWxwUWMzWUozZ0J3NmdDWDJEbWw5?=
 =?utf-8?B?aDN4NmNDd0xyQ2ZiZjJpdThKckxmK0J3WUlYc0xFMzdYa05lYXI0SDIyWjZV?=
 =?utf-8?B?T3VuVnJyUTNiUlhGeDJkajhiY0ZJRWlGaVJ0dnBRSm1IM0JFWm5sZmNWM0Rz?=
 =?utf-8?B?SGx6NXowZi9ZaU5ubHZwdXFEVVNwRTlVdkpqcVVRTVJQZGJMWUl3Y0Jpa2tO?=
 =?utf-8?B?WllXTzN4d051S0JPRldrMVJPOWhKZ0pRK1J1NnMzK1VHNjdHeGhvYkdMWkJN?=
 =?utf-8?B?dTV4b1dsdVFYVFNucjJtdlQvTDV3NDRMUXZYaFYwdmU3OGU1SEM3dWRrNlVK?=
 =?utf-8?B?TFg5Tit3bUJiUlQwOTFWblpvSENzVHBTQ0tkUzVOakkwZllyY29xUzNqZWVp?=
 =?utf-8?B?QVpSVnBnSEVUZzE2Qjk0US9VYi94VzVhWnd0SFB6SEFBeTkvMFJjSkkwUHIx?=
 =?utf-8?B?ajNsT3QrNkt2a3lNaFE3S0dBSnhwSTFtbWJmWWdSV04rMkJsVC9HRUdYNDlR?=
 =?utf-8?B?MTh5ZjFHVVlSMFFOcHV4MzZKaHBVNWVYbDRVSXlXYWNjQ1owK29hUDhlVGt3?=
 =?utf-8?B?M3ZPQzlUdXVEbGIxazJCZDRCVXdLVGRmU0gwV0tNY3lJZGJ5ZHVCcU1KRm9U?=
 =?utf-8?B?b1BESzRERDFJZzFPUnVjY0ptYk5RWG5BS2RCakxJd1ppdzQwSHkwMW9aWHBy?=
 =?utf-8?B?Y1JWYm5ybm5LaThjR1dpQ3BhbjdDQWI4c0xxaWVYcnNBYnhWcG5IUXlkYk9q?=
 =?utf-8?B?bjIxa1lxMTBxdkRiaUN2eXJxVG9VbFFqbHFqbmwvTTRhRCtvY0c3OW4yNHQ2?=
 =?utf-8?B?SVNQeHZWL0IzaU1sNEI5RStVdDc5V0NnZXN6YTZtc1BFSmp3UksrYyt6UXc0?=
 =?utf-8?B?eXVFekhqdHp5aFpHQ05hWTVIekxEZzZpSGxnaEtsSXRQY2VGMm1pakNPOHBD?=
 =?utf-8?B?UmFyQitkUGx4UlJaV1lFbEZuWkdNTHBNSWl0REJOaGNMVjdaUUVLVUlBNHFX?=
 =?utf-8?B?dlY1TFhYVEFVOWJ0dE9VM1oyajY2cGh1Zm9lcnBwUVR2a1RGMmhxcWN0K2hT?=
 =?utf-8?B?ZEpuMnVKVk5JZTNJdGErZVE0VGpOM3NjQlNTRnIwdldmWFEydFUzc3NJM29r?=
 =?utf-8?B?bnBtLzZwbVNyeitFdWYyMGxhTTByWVljeE5qbDRLTkxyYk1PMVVTWTgzRngy?=
 =?utf-8?B?b1BnYm9JbjUvcktWVDFHRXRDNVlZMjhlTnRiV2lWS3JJRFhrYitEOXlJNjRk?=
 =?utf-8?B?MXpLZURuZVVjLzdNN2oyL0pqL09Bc05UcVo4UWRqd1NPMTlLUmNKRFFBc1Vm?=
 =?utf-8?B?T3NtaDV2eVovQ21PUGhneFNXaHVhZWpvUGZiblR1Z2N5c0pDUXRETDlWeTFh?=
 =?utf-8?B?T0N4dkh6Q0p0VnVOVjBaa1dhRTdOa2FiK3RsYmlpck5EcUF4Umd4WE9td000?=
 =?utf-8?B?TDRBVTI0Rm53PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWNpdzBCeE44K20rakR2ZmtpZXNheFAvM05sc1dFZ3lwSnhHYy9NZTJoYmJ4?=
 =?utf-8?B?Q1BZbmN6VnZ1dWllVXZaNy9PeVBCMTV5OHF6b3c3NGlIWjRHbjQwU0tFNlpn?=
 =?utf-8?B?TmFMaXd2QUl5M0RYakY1UHY0Q1JzOGo4Zi9qWER3Z00zMFFkZmo5QVpnL1E0?=
 =?utf-8?B?T0VXSmMrd1d5a3lUd1FubTZyOFYwVmxVd2RPdFhkOWdYSmVQa2Npa3pTSnVm?=
 =?utf-8?B?d1YxN0xnaWJDSThvOXMreUc1ZkZHMDhhQWN0SW1XdEJtVE9SSHNJTlQ2clA5?=
 =?utf-8?B?MmlGbEw4ZXpVd1ExNUl2enkwWVRnZnMyY2Foc1lyMExLc2I1ZnlmQVZnY3Iz?=
 =?utf-8?B?Umt6Z2RmbFZSRys3L2ZGaEthamVVR2g4c2pnSE1xZndOUmZpbE4rS0tuNkxm?=
 =?utf-8?B?KzlXVzgySFRMQ2t3QUx5NzYyUHhWbEc5NExVand4Nkp4QmtlSHhRVlBFbWtY?=
 =?utf-8?B?c01hemJ0VG9obzl0eWFGVzZXRmJrNDdvWUxYYnpSV0o1N1p4YWFTNjRIWkVs?=
 =?utf-8?B?eFc3TWV0TU1aMjVERm55UUZFK0hPaEFOYWpmYk9HWTE5cEVERTI0Rzd1NUkz?=
 =?utf-8?B?WXNTcU5NZm5yNGRpOVZBd0JoK25KQ2tMc3NJcDZRL0hESDFMSEc3Y1VIeGgz?=
 =?utf-8?B?ZzhCYy91MXlWMHpnWmZteG5DeGh0NDlTZElVRk9IOGZHVU5JdUF2T2xQdGs1?=
 =?utf-8?B?VWJWa0Q1VDNLayt3UmYwT1VkMElGVzhoV0creCt5NnR1bFFsMU0veFJOMHZ6?=
 =?utf-8?B?TGMreFlsMFZvQjVtd3gwUTVnUFMyblNJRmpJSHpURVV6SElTdGdpK3J5SDdN?=
 =?utf-8?B?czZ3OFR2NE1qVFovVlNYam9BdDZRRTBBbWpDU2NSUXYrOCtCR0VER2hLWVM4?=
 =?utf-8?B?dHR0a3lqVm1aRk9TSWV1bCtFLzVJT3VMTExTWnlZbEo4Mm1XZ1E4cFlOZkIx?=
 =?utf-8?B?ektoOTFmcmRGTi96ODFKYzBEaDVYaVI4SWpCQ0lrd1ZmcmRxS0lXRWlKaVRY?=
 =?utf-8?B?Y1VJeUVQcCszTzdJbmtacXgvUHlSdmlBV1dGRmQxdW9EWkJSdmJsZWFpOWdm?=
 =?utf-8?B?V1liQlBBcVBLVnpVYi9uZ3QvQzBmR0ZpbDhOY1BDdis3UU5FN2xVUW96cDcv?=
 =?utf-8?B?cDR3Y3ptNDJlTTBZcjBjcm8rNnphR0p5alAwNk1ybDZxWi9JS2c2RllSOHVt?=
 =?utf-8?B?UGxpOVAvUllEUzA1MUNiWExNdWZZRUNwM0hQdENvenMvSWh4OUVoTHRSYmV1?=
 =?utf-8?B?cmE4emZzM2k0aXZvNW5uRSs5R01xTlUxVEZNWlg2NVFjMmZOQjE4ekpqV3Vr?=
 =?utf-8?B?S3pPMEZsMjdiTk1WUmNLMXNWOWdRTFNlYXZ4QlFSd2NaNmhsR25kK1p0SEM0?=
 =?utf-8?B?RTJkdEc4Ukp2dmg0NGFBSk1QcnJ3OWlack1LLzY0TmJlazVoc2liMXZBN0JG?=
 =?utf-8?B?V3ptZkFSZWxxMXhBb3BEOTY2MkRZMWgyM014bDR2WVR2N3FkWDZmT3QxSWNm?=
 =?utf-8?B?cS9NeTFEeGdVN0VzTE9Danc0cHpmZnQ5WnUzTzFjVmgwYmhVRTNqS3IwNURT?=
 =?utf-8?B?NEN4RU1LZUsrU2g0ZENUS3RhNnl4OGVpbTBONS9ieTdMU0FHY1gzd1JQbUk2?=
 =?utf-8?B?ZEhUcGJiOUxRbkQvWnFRZDJnVmhkZHE1RjJDZWZaSDIya0pUQ0NiVVN3QkNK?=
 =?utf-8?B?OUJqZHprQW04eG5DTm5DSkNIZ2gzWHJ4Rm81bkthS0pXRCtUQnM1TTNwN1Zy?=
 =?utf-8?B?RjZ5N1J4R2VqVmlybUN3NmtsNUdETUxQamtoaDdtMGlKRVE4S25venRvNXVm?=
 =?utf-8?B?bEduWFE2Qi84MHVBQ0pETzM1YXJnMWlTbWNCb0lVcEFadGFvTG12K0dpZUNN?=
 =?utf-8?B?Y1ZhVjJDSEdnTHRnRnlTUXM0OG1lMk4wWDZuQ2F1SW5aNUEyeTd1QlRwcndJ?=
 =?utf-8?B?T0pzVVA0citDT2ZGbUo1TUlsY3laelJzcDVwLzV3ZENHZjNKNmtuaUJFV3NC?=
 =?utf-8?B?Uk80OXFrVWFKR2txTEd5Mk9wamdxVk85MTZlM2JlOHpKK0RrSGZYMGozWjJv?=
 =?utf-8?B?cUpjcWt0cTkybTVYSG0wdnJjMGlLd0JnMG10bmlLaW1mMHJOWlRnNDJTM1Fo?=
 =?utf-8?B?bXJ0ZUN4S2NGTWRVVGVuQXFNcmpQRHhGa05lVWlzVDNTVGtOblBoenVmY3Bv?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAA5BCCCBF935C4087B53AF90FC6BC4F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e17ed4f-fb67-4343-ceea-08de38a79a9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 11:22:43.7555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VX0eG5L3vqkU15jjzYlXVDjxshELT8XXzsNQ07njGnag5W9VmNY+8urZMmm2kXIPWqjnoms21XiOs4GswVezRnMa3d1/IFsDhbA1LRS8/4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8256

DQoNCk9uIDEyLzEwLzI1IDAyOjU0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIFR1
ZSwgOSBEZWMgMjAyNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4gT24gVGh1LCAyMyBP
Y3QgMjAyNSwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4+IEdpdmVuICdOZXh0TWVtb3J5
RGVzY3JpcHRvcigpJyBtYWNybyBpcyBjYXN0aW5nIChVSU5UOCAqKSBwb2ludGVyIHRvIHRoZQ0K
Pj4+IChFRklfTUVNT1JZX0RFU0NSSVBUT1IgKikgcG9pbnRlciwgd2hpY2ggaXMgbm90IGFsbG93
ZWQgYnkgdGhlIE1JU1JBIEMNCj4+PiBSdWxlIDExLjMgYXMgdGhleSBwb2ludGVkIHRvIHRoZSBk
aWZmZXJlbnQgb2JqZWN0cyB0eXBlcy4NCj4+Pg0KPj4+IFRoaXMgbWFjcm8gaXMgYSBwYXJ0IG9m
IHRoZSBFRkkgaW1wb3J0ZWQgY29kZSAoJ3hlbi9pbmNsdWRlL2VmaS8nKSBhbmQNCj4+PiBpcyBk
ZXZpYXRlZCB3aXRoIGEgU0FGIGNvbW1lbnQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0
cm8gUHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPj4NCj4+IFJldmll
d2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pg0K
Pj4gSSBzYXcgSmFuJ3MgY29tbWVudCBidXQgSSB0aGluayB0aGlzIGlzIE9LDQo+IA0KPiBJIHRh
a2UgaXQgYmFjayBJIHNhdyBEbXl0cm8gbWFuYWdlZCB0byBtYWtlIGEgbmV3ZXIgYW5kIGJldHRl
ciB2ZXJzaW9uDQo+IG9mIHRoaXMgZm9sbG93aW5nIEphbidzIGNvbW1lbnQuIEFsbCBnb29kLg0K
DQpZZXMsIHlvdSBhcmUgcmlnaHQuDQpUaGUgdjIgaXMgaGVyZToNCmh0dHBzOi8vcGF0Y2hldy5v
cmcvWGVuLzIxMmExYWM0ZWU1NjhmMDI3ZjZjYjdmOTQzN2FhNDJkMmYwYjZjNDEuMTc2MTU5OTIy
MS5naXQuZG15dHJvLl81RnByb2tvcGNodWsxQGVwYW0uY29tLw0KDQpEbXl0cm8uDQo=

