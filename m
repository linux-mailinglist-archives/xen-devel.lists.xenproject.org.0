Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD725B33D64
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 12:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092952.1448549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUuI-0004Ef-TS; Mon, 25 Aug 2025 10:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092952.1448549; Mon, 25 Aug 2025 10:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqUuI-0004CQ-Qc; Mon, 25 Aug 2025 10:58:34 +0000
Received: by outflank-mailman (input) for mailman id 1092952;
 Mon, 25 Aug 2025 10:58:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bS3=3F=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqUuG-0004Bz-Pi
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 10:58:32 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f9cb5b6-81a2-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 12:58:30 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DB9PR03MB7597.eurprd03.prod.outlook.com (2603:10a6:10:2c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 10:58:27 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 10:58:27 +0000
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
X-Inumbo-ID: 6f9cb5b6-81a2-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L50D9NfBaarxoUi5UUifOLCnB9FVRhwCcYGWyYe95I5BZKB/Q4fRCQljFVzgvFe2PiTaEtCDAMSbVqdttqKwlGAxp0eqjTXV8S+h7ca9SO6YI18mBy/wug6aa9WrCqtZZ7ucwwwV3gpgmlRV4rHi7pvltKuuBSEGI4inL7ViDPGCfNLP1cU39BOpRIDmsoAmV8zqpZBmtDI/KvNEJOe3D+Wmxsq2TR0PGmxHNzUN+HP6BSmgD7esXTsj2hIfto2wC97j6JsKUoOLAuKysOYWisaJVakKolplPFv2G6Bs3yHF41PD2ilhAqfdyLSF4u3D6Vo8JLvnE/3MDJfdwbiz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEISZrt/gaYc0myVXduKx+Lmkyab4dXBNrapmompVvM=;
 b=BI7uQ31uyXmXYScU9SVz7j+CcBRxmfFmLKGO88DzkAyKMT9Ca0+SvbnjPEZRX42qfZv2Xid+LDb4sWgI1+MnVIZzKm07pCQDSLD8Y0K8fwUMhkOFlKRFy/F73oX9OtlIDMj8zoiJDgix2peHpKVPTfOOxEd7Zvnm79wKKFwDAjhzlmiN74ZsXBL/AWVYG7xiGroF9Gf9rZ6ISHHm8Vope/vHyuaeaG7KBC4L0f+di/SKq1srCgwkd3S/Zu9fB70F7qwoK8TBQCDfEzZ/2H683W9kNgiH2pxndyN9lZxYwz7CgNNPSn8GsrzUUfC02j9xvinwDIlSedn9gNGA8VpkYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEISZrt/gaYc0myVXduKx+Lmkyab4dXBNrapmompVvM=;
 b=KY+vjSNrG35/Xe0AnbGtYB9cEfxYVJLW+Re2zvT1JM1KdLWYg6dBEADaqnZuaqKoBP3Qnl3TvYuhUUo91+AnMyS3G1NpFSiT+DzV1DC4wsPSh6LFwehEqm7cLVRaPYVj7FIUEIBCWT7NQfGM4EKNwVwdaal7hiF/H+flEgOPjQ+OV0gH5N655p+HsyEfck5a4anWqgAfdPWO6SucriQGpm48K+s6QpyXr4wvFe9JPjpFxA9PiMtA8HpCNqqsYu9JneZ80YjDP+twrYTf20/utfuKuMir32QdQaIsHzWnJwXUvS5CBiObU85jOje5qzYukWgJH1ZJ0xfNQPqCeik6dA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add deviation of Rule 17.7
Thread-Topic: [PATCH] misra: add deviation of Rule 17.7
Thread-Index: AQHcFZ9zsboRH18vd0iLUvum4pfwBbRzK0qAgAAH1AA=
Date: Mon, 25 Aug 2025 10:58:26 +0000
Message-ID: <83267937-938d-43d8-ba2c-a07d6adb93a9@epam.com>
References:
 <ad15582787e675fadf92502f85041c3232749a99.1756112701.git.dmytro_prokopchuk1@epam.com>
 <53d5cee3-9001-49a2-9da2-e56950a77683@suse.com>
In-Reply-To: <53d5cee3-9001-49a2-9da2-e56950a77683@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DB9PR03MB7597:EE_
x-ms-office365-filtering-correlation-id: 48ecc0bc-c3fd-4dcb-078a-08dde3c651a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dWhZY25WNjdKeTBQTkNPM0FEWnlTZVBkUlF1TUZueGJNZlJNQlErL3h2OEFC?=
 =?utf-8?B?YmZ2K3doT2VNZ3pFRkZWNlRNOGNLWlZHNW1mQ0JTZmxHUi9oMHBoN2t0R0sw?=
 =?utf-8?B?Z0ZYdlVwNzltSnlKeEcyejRrR1dzamNLK2RnU1BPODlIV1lZQkJmYmVrMDNU?=
 =?utf-8?B?OCtvTWlCalRQd1BuMVlZdjFrUmVBVFZUOGltOWhNMy9lRUZDY0dGVnMxS293?=
 =?utf-8?B?bjg1UTZZOU1PaEJJNkRidGJVVUJkcCtDMkZNaHRvRmgyMUM1dmRUcnNIcXYx?=
 =?utf-8?B?WDVrcVp4Y05OdjRGTUg5dVdzbUJHeDZLSmxkN2IydGFmNzNjbG5ESElvbEFY?=
 =?utf-8?B?eWk0WXR1MTlvVlFSaXlhdTJQNHBvM1FaaFNsMkYvSHhSVHlvelQ2YVBCUGsy?=
 =?utf-8?B?SmdhSExpR0IvRy9yTmduZ1RDb1hnQUg0UExjdXZ0Ulpia3hVd2E5NHVDZFVU?=
 =?utf-8?B?azBZbGlrZnBhNVZJdWUvcFVpRGVuYlVHR0NtM1p3OUhOdHB2MjN2d2hxZmlV?=
 =?utf-8?B?YzhWWHJ6LzQzaHRuSnBJc3FIV1dtZzhveEowTkp1T0c5dDZud1VIZlF6a29l?=
 =?utf-8?B?M2RiQm5zUDkwSFB0WlFway9wVXg1NjUvQkR2eUt3d0FOR0R1bHhzQS9sQ09s?=
 =?utf-8?B?R2lpaDkzWXNuMHFnSUpWZ0U0RDU0ZHhOVTdNQ2M0aVVwYXBseG5QWkhKMnRU?=
 =?utf-8?B?QXRzSlh3NGlrN1lZd1UrZDBJOW92Um1ncEFLZmtidWkzbUlFZ1ZPZXRGekVX?=
 =?utf-8?B?cUVnMFBJU0RFekdiMmJxWFFJQWtUSDNDME1WTmt4aDZlNS9XR3VkemtYVHZW?=
 =?utf-8?B?bnd2YWtwbGR2YUxBS0JORGwyZmV1bEtNbklzakFIME8wTTRoZ1Y1VFRaNzB4?=
 =?utf-8?B?REwwMTEzOWNIVlpIK1JxUmFHaFlieHVTUXJlYTNNZFhjZlpXdFNSVytlQXUv?=
 =?utf-8?B?R2UvbFVVbFNuMFh6ckRYVmNpRUdESzE4cTVxU21LN0tCUFdsTlRHWWdEMVdB?=
 =?utf-8?B?aWRHN0JIVnQrdFc0RWVKdWhQcW5uRHExSHdxZzdpQlc2Q3lSbWsvdUxBTGxM?=
 =?utf-8?B?Z0owbjdvdEF6VDFDQnN1VXM1UW9oUXNTaitZRklHNHlXbXEvbW1NeGoySlhw?=
 =?utf-8?B?SEo2VGwvblFUYnB0ZlNFb3NhL2p6R1UzTmNkWmprbkdkWW11a3hpcUxWM1M5?=
 =?utf-8?B?aWNBN0Q0WmxTbVdtSU9zTjNTTTJQaEt5b0kvaGZvSmQvd0t2Zk12eFJIdTQ1?=
 =?utf-8?B?VHBxU3FMTWZXaDIrb1h1WGVNQUZTcmRQRThBRjBYdjVaTzhQQW1XZ1I5bG81?=
 =?utf-8?B?Yll2MVpNS0x4RlFOaXRuUUI5WmVTZk1rS2VNTndIV2p2cng3blJOcE53U0gv?=
 =?utf-8?B?QmZzY1lvUmExdVh1bURsM2Zuc1dHM2JrSnNOWjN0d2JGWXpuN1djSFJYVFJm?=
 =?utf-8?B?V2YrNFhIZnE2aTkvSDlvQUlrSU9NTXNRaXB1THRhYzVzUHVDcnpqVlhRbmVN?=
 =?utf-8?B?OTMvRjRtWVR6SjEwODlYdmROemxEU052M3N4NGovckV5elZJdFphK3RiUjEx?=
 =?utf-8?B?T09hTEQ5MUhwNzd5OXBUVGZYdGdYTTAwT0tubjlqVTg3Y3ZDc2Z0dU1ialpS?=
 =?utf-8?B?U0pXSnpXajhPTk9ybnNTMThjR2RseVptVitOUmdYWnJLSjQrYndXajg5eUgy?=
 =?utf-8?B?MHJmRWdpWFRwd09PWGdNVnk3eEZTbWZpOHhodlljS0V5eC9uQVFwSTRBYmJP?=
 =?utf-8?B?MmswVnRnQThnQm9pUkZSUzc1Yjl1RXdhaUE2QXhybHdaczdXZ1dvSlBzNm9l?=
 =?utf-8?B?aEoveXZsNDRkbE9ETmRVeGhMc3Jhc29OY2pYYWJRWkJKZE56UWtwZDl0V0ln?=
 =?utf-8?B?NmVac3FMS3lwNmJYTGtBeUNVV0RvdUY5b2ltUGRVVXlZUUhocTRjZ0RDVU02?=
 =?utf-8?B?UDFOTnFnNUgrUEdpalVoUHo2eklUVzlPcXd0UjVtSUFnZ0ZBSGs4OWtOMEVt?=
 =?utf-8?B?YjhESEVhaE9RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDBlS0tOOHZ1Umg5cElRQXdLL1ZEb2xuV2tTMjVVUFJnMHVOelZwR1ZNUHBL?=
 =?utf-8?B?RFlINFlDTlh6ZCthb1BPaGtkQ0EzaW0ra0NKR20rMFpjWVUxaDlUL3krc1Bx?=
 =?utf-8?B?OGVtb0tOdjh2c3F5WHFqUC9ZOWpVWTJrV1pNdGZQczBMOFpkYk1JWjBzWHhm?=
 =?utf-8?B?cm9KQnJjWXdJTndYa0p5clNKUnlzaCtSL3BSYXBVcFc4YkxFclJkWTl0aHdX?=
 =?utf-8?B?b3lKakV6d3RqclF5RWFNcklFdjhpYnYxWnluTFpxYVEreWNJZVdKaEwrR1ZP?=
 =?utf-8?B?VXByZnorNm01K3J2ZFlyekpMVlkxWUZSeW5yeXFJb1B2TldnNVlLWTRkeHRj?=
 =?utf-8?B?RWpKVW9NNmlNTHNZbFI5V2FleWpPZ2I4MFNYdTUrMFRlbGFOa2VHSFMzWnNW?=
 =?utf-8?B?ZTU5Z0pFN290UFVRZytQYlRBOURuckdLM09Rc2N1RWp4SjVtZHdKeGx6dW5P?=
 =?utf-8?B?MFJMWlUxcTQzeDZMakNlWjFJKzhtdHZUbm9SVzBwUXhSbmpxd3drYWlURURE?=
 =?utf-8?B?UDAwRXRmV20xMUEzZHdBbFRJQm56ajVZeXdkdFpSS2V4aDl5Q0hweWpGWVd6?=
 =?utf-8?B?Um04TE1LZGNEaG9Ka1JpNEJDeXpiRlpqWGtYQTZQWXdlWDV5djBjNXNHbUxV?=
 =?utf-8?B?RFJ3SjdZTzRoWHp3dS8zTldoUHB6dlROSDhTd3RCOXNJd1JCWlA1Wm5CMitp?=
 =?utf-8?B?TXl5UnFYU0tkOEhPK3NkTk8wOXUvMm50aE5nSG5vM1l0a1RjbTJNdEVVZGJD?=
 =?utf-8?B?Z0FjZWRXeW9EeEZrbFBUQ0tKcDkvVW5FcnNBdG5wdkNtT2ZSV1NSK3ZGTDBs?=
 =?utf-8?B?OThSY2pDb2ViaEZQY1hLbE1KS3pldVJJNGJpemw4TUZiY0JqcWdkMlNEYmRU?=
 =?utf-8?B?a1Z4dk9McUh1Wjhlb0NCWXNpb1RpUkQ0NVlMYjZWRDJDdHVQcDR4a2tkVXg3?=
 =?utf-8?B?b0M3dDF6RzM2NEZ4c2xUYjlvU1hqRFN0cjBEMHJscUVUYTRobTN4WUplYU81?=
 =?utf-8?B?TDdXMGVuRzZOYzVKYkNoQjRITS85T1ZnNnpIS093dzlLVE1RSGx3SW13QTNB?=
 =?utf-8?B?c2JRMkVNZndjMDVnZlp2VlJxcHhhd2NSY0xGNXNiWDh3dEVzVFoyYXcybDdP?=
 =?utf-8?B?elYwcXdwYTJXQXFWZTJSUUhIbTM1NXBTWEJrMXYzcDY0dzhtOFZqa1NSMlRG?=
 =?utf-8?B?ZmJWc2J1MjE3cWVSODJleHQvcW9sSGZVZ1MybmxEdFFXWXQwVXNIdjhlM0Zu?=
 =?utf-8?B?VGpkZ3hWZDVVYWY5MFFWdWRUcTVLU3ByUjBNOVBvMHF1MzFFOTZqOTVXQmJo?=
 =?utf-8?B?NjIzd0tiNHFLTGViUWdJNVNiSjVKcU91dExwWVVnVlY0MVBQWUkxUHdEb0Ir?=
 =?utf-8?B?MnBYWkVsdWJEdFlRWS9TM1JSTHdRYW9GZXRkS3h2Z1czTzB0cVBOcTRiRERz?=
 =?utf-8?B?M0kvWStGSzNmUVZGU2plY3ltMko3VkVWVExxNEpxc3BDeTNoQzl5ZytCTW84?=
 =?utf-8?B?dDAxeWF2K000cGNOTmlINkdpb20wRVhxZU9zSjgyNUcra0F0aDRSN0dJaFZk?=
 =?utf-8?B?djN3Q29BUklEUmFQaTd4MTUrRHJLZkZwMkFHcm9kTVdPdG43TzhoZ3BGMnIz?=
 =?utf-8?B?eEhBK2JYOUp0cnVMMnU1anhjMkZNZXU2b3Z0L3Z0RlovcmJrWFFkem8wSThF?=
 =?utf-8?B?Ly9HWE92aUNZNStIa3BzSnF6OGtEclo4S0xaNzZyK0JQcS9VMlorOVVsSHZW?=
 =?utf-8?B?QldYd2ZJd0k1dkp0YmRWcGZpQjdPOSs2Y2w1TGRlbFdiUC9vakVwM003cnlM?=
 =?utf-8?B?S1RhdXh0SUdKR0EzWVpTRGgvU3ExTGxnWmsvRTQzSy9wNi93NTlEc3NlektM?=
 =?utf-8?B?dFk3UWllQWw3TS9qOGs5NEtqV2laVko4dWRzcGUwOEI4ZmoxdmY4SWt6ODV5?=
 =?utf-8?B?ZE0zYWVCY0twOUZVVDZYSUU2RWcvSWRraTVUQVdPNU1MZk1CTThvMFNkZHkv?=
 =?utf-8?B?OExncTZSUzFwNjVYaHdiTjkzOFJwZzlRQUlvZWUydEZzeE9UOWp5ME1SU0tP?=
 =?utf-8?B?L3RVYmJKZVVONkh5bThsRy9kLzBwSTQyUFB2QW1uQnhJTW1ETjVyK3VlaFNr?=
 =?utf-8?B?Y0VLQU51WFlrOVpOWEFDTE9XT2ZHWUlobUFHa3pOVUFMT1lscUpESEN0RFdH?=
 =?utf-8?B?M2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7818AB7EA7E2B84E9AE9289A47B8B07B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ecc0bc-c3fd-4dcb-078a-08dde3c651a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 10:58:26.8662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBLtQxqeMQoGaJU5hgwbAhlCEI30xuU5n+ZypWBt5frx3by55g/jtiI7rDPk9Jo3/BjpfxjSrzJhVVPCiXdiGykr+/e3dBsTkg1ETsS0bg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7597

DQoNCk9uIDgvMjUvMjUgMTM6MzAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNS4wOC4yMDI1
IDExOjA1LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBNSVNSQSBDIFJ1bGUgMTcuNyBz
dGF0ZXM6ICJUaGUgdmFsdWUgcmV0dXJuZWQgYnkgYSBmdW5jdGlvbiBoYXZpbmcNCj4+IG5vbi12
b2lkIHJldHVybiB0eXBlIHNoYWxsIGJlIHVzZWQuIg0KPj4NCj4+IERldmlhdGUgZnVuY3Rpb25z
IGxpa2UgJ21lbWNweSgpJywgJ21lbXNldCgpJywgJ21lbW1vdmUoKScsICdzbnByaW50ZigpJywN
Cj4+ICdzdHJsY3B5KCknLCAnc3RybGNhdCgpJywgYXMgdGhleSByZXR1cm4gYSB2YWx1ZSBwdXJl
bHkgZm9yIGNvbnZlbmllbmNlLA0KPj4gdGhlaXIgcHJpbWFyeSBmdW5jdGlvbmFsaXR5IChlLmcu
LCBtZW1vcnkgb3Igc3RyaW5nIG9wZXJhdGlvbnMpIHJlbWFpbnMNCj4+IHVuYWZmZWN0ZWQsIGFu
ZCB0aGVpciByZXR1cm4gdmFsdWVzIGFyZSBnZW5lcmFsbHkgbm9uLWNyaXRpY2FsIGFuZCBzZWxk
b20NCj4+IHJlbGllZCB1cG9uLiBVcGRhdGUgJ2RldmlhdGlvbnMucnN0JyBmaWxlIGFjY29yZGlu
Z2x5Lg0KPiANCj4gSG93IGNvbWUgc25wcmludGYoKSBpcyBhbW9uZyB0aGlzIHNldD8gSXRzIHJl
dHVybiB2YWx1ZSBpc24ndCBxdWl0ZSBqdXN0DQo+IGZvciBjb252ZW5pZW5jZSwgaW1vLg0KPiAN
Cj4gSmFuDQoNClllcywgc25wcmludGYoKSdzIHJldHVybiB2YWx1ZSBpc24ndCBqdXN0IGZvciBj
b252ZW5pZW5jZS4gVGhlIGRldmlhdGlvbiANCmp1c3RpZmljYXRpb24gaXMgcHJpbWFyaWx5IGJh
c2VkIG9uIHRoZSBmYWN0IHRoYXQgaXRzIHJldHVybiB2YWx1ZSBpcyANCnJhcmVseSB1c2VkIGlu
IHRoZSBYZW4gc291cmNlIGJhc2UuIE1vc3QgY2FsbGVycyBvZiBzbnByaW50ZigpIGRvbid0IA0K
Y2FyZSBhYm91dCByZXR1cm4gdmFsdWUuIFNvLCBzbnByaW50ZigpIGlzIGluIHRoaXMgbGlzdC4N
Cg0KTWF5YmUgc2VwYXJhdGUgd29yZGluZyBpcyByZXF1aXJlZCBmb3IgdGhlIHNucHJpbnRmKCkg
Pw0KDQpEbXl0cm8u

