Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1337AFFE61
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 11:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039267.1411168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZnpc-0006rV-1v; Thu, 10 Jul 2025 09:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039267.1411168; Thu, 10 Jul 2025 09:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZnpb-0006p9-VM; Thu, 10 Jul 2025 09:44:43 +0000
Received: by outflank-mailman (input) for mailman id 1039267;
 Thu, 10 Jul 2025 09:44:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=63eF=ZX=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uZnpa-0006p3-LC
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 09:44:42 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80bb92d3-5d72-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 11:44:41 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DB9PR03MB8445.eurprd03.prod.outlook.com (2603:10a6:10:398::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 09:44:38 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 09:44:38 +0000
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
X-Inumbo-ID: 80bb92d3-5d72-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcTHqQehyUBYMOv7ylUYeG3GiEpWvaKwbIIRtaTiRqYwOA1/eXt8Hh8+SzDL4M3biDvjejwi2kescl4c5DfKTIazm+reeeY6QlTFow4GjTNGv8lSN0R5neLzxIhVn2tz2GUFJveLXh+Ccqk6JjsEMnmGU3M3sQuGhSRteMz8yzZnG/T4juvvn7GoQKIfBkB3VIFZnVAUD5bYZMVgwPDMVe7ROUc7tpx2U3eiGQJ3e3S4cE+5nHdwJVdQ8hmSPGwbVUWV1t8yOhWdTk4bFOCfrzn6O9C+rCor1/k3VfqCyHliG8l+UCULmD6SDF3I3teUFozKbItzZYqjvhd3IYSReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLvzecUAdmF3ynvpfPirnoTjS81nBJorZ0VB1bT9+k0=;
 b=NtwjMJ07L2NR6t5vYGiU4h68TpeAs6yB+6kKKaUVHSiJMx9LCBN+TPsLIGar3HLveXmCi95t2iOiSaJJcc0MLjssaemqIXeg1oyLeyfG0X89ntZGv01GGxxueK4wm0LnKeEtM18Yv4QZYd94RqqDT6UHibSLhFEyVqjiQ4B7o694lRoVJeXYrPVF3O6wFJbVKJBU70q72rgGAXzL4UXoj+VleuaeMzdnegl+yUW7dtZLn/23mKp0PVBcJ5I0G7eqGjLudAqUocxkGw7w7Ui0lXK4mH7zqoOHc43F0SQDQCP8kK6vi2ePqDZ/CGyY23N8CY4ofmVgjRjbrrWk3EOo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLvzecUAdmF3ynvpfPirnoTjS81nBJorZ0VB1bT9+k0=;
 b=KfAhHUKIwvCTOD5q6JucMArLww7pNCXH/+1GMUPR92zvJmr/s7VyfiUn5dJhiIfapEdsozRaXnWTLnoWwD4MOyC632Wdq2myWSuBbYLsryd5DAD7VID/bq5T0gZHse049AfeQZqX/T7dIKcDFiM363WIflyVtsiS2AmHzvV09bw+KDl08T6GiQx9fBP6c2ZA5HxHPb71qUTFr3CVjYJAWnfhjPJqvoE8vUrE55opaxdy8nV9ecQqjmJ6jW7UT1oWlZ8aSdfM7KlVi7swEPXWXBIX7+vroC8x72Wtbtlf2HW9dzVU+zklZubizjaj4b+I8oN/x64Cq1m6uhji6GhW5A==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v2 1/3] iommu: address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 1/3] iommu: address violation of MISRA C Rule 5.5
Thread-Index: AQHb8RnHknh9PmNpckO7ne8U6W29yLQrBRIAgAAXOYA=
Date: Thu, 10 Jul 2025 09:44:38 +0000
Message-ID: <a8d7baae-3b72-4905-bf41-1db79b3202f1@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <0a7a954cdf899845f51427fa6b44915f28b2cb90.1752096263.git.dmytro_prokopchuk1@epam.com>
 <7fde4d6c-eadc-4c17-a88a-80714362bdca@suse.com>
In-Reply-To: <7fde4d6c-eadc-4c17-a88a-80714362bdca@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DB9PR03MB8445:EE_
x-ms-office365-filtering-correlation-id: 19deb4bd-3780-4c42-c071-08ddbf9662ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M25WZGU4eXhFYklnRnViNStCK0RTK1QwRk1YQzRkVDdtcnVKRkt5TjFmdkV6?=
 =?utf-8?B?a0lzQitYZlQxSUlPQklOOWRndVl2Y1hlZUtqaHhKRlo1bXg0NkxLSzVSc1JD?=
 =?utf-8?B?d3gzTWd2NEFwRm9wTXVUSW5YTE9wN3kwdTNzdmVrNGI5dk5Gd0pCMldOQjlL?=
 =?utf-8?B?dFhmMUdiZDhweHBTT1pKTDA4dXd0Qm9CZnpHN3NVeVB4SDBRT3AzMHZLcXFl?=
 =?utf-8?B?WThrM0p5TmFFeHFHWXNCRnVnRGRsTzZVL2JzNkhpVzJvRGRuZ3hweGNXSEli?=
 =?utf-8?B?YzZXcE9rcHlERVVtNkFDeCtqYjFSdmpGeWovVDZyWDREdVVocjZOMlB3YWJC?=
 =?utf-8?B?Z0tmTlpJYkhObHZKT3VpQ05yODNOZmxiRW5XbzZNSGRZRlVXZC83K1U1a0Y2?=
 =?utf-8?B?TWN3am1SMFNQM0Vyd0hySEp3MDR1ajQ2U3R2ZjFoZS9UVnQyaFNUSHJsNjZC?=
 =?utf-8?B?WEQvQnZoNGsyNTVkaTZoK0o4Y1hXeWFpYmR4WTdZbTNlcGRIRFZmeVhKdUpH?=
 =?utf-8?B?czBtUEhiNkxJOVhoSjRkR1NUK3Z0bmdwRXJ5cXFNOStwSno1R2dCeXVJam1C?=
 =?utf-8?B?ODRHWGJ3TndIR3ZoM0RnR3d4aFRTNFdmUFkxQVplYlE4ZWtlaE5SUjJHRm02?=
 =?utf-8?B?eVBSS2V5ZTUvazhGd3Y1RUg0TC9yYTlTaTZYdUQ3TmllNGYyQzZIYjArZkFR?=
 =?utf-8?B?ejBPK1ZwNVZFWlF5T1oyT0p5S05pcWZ2eXY4SlFzSEh3Szd2MTUzNkVnaHNy?=
 =?utf-8?B?blJtYisvc2JZUmtXYzJ4WXcvMTVyb2NXZk01WHozRGJKUHRtS05rOCtPOGM4?=
 =?utf-8?B?NGVIaHI4QW5RMWFkeDdBMUVRL0YrbUF2Rkw2dFRSSmg1blA4UGZDdTBRUW96?=
 =?utf-8?B?NjYvWE80YlRncFNPdmxZMi9udFlmQWlHNFprQWNEbFowQ2tkQ2Z3MXZYeEhw?=
 =?utf-8?B?MDFraWFWV3ZMVFJBRGdkUjFEVlZGSjRaOVZQMDRZUUFjYW01NFNJN1VBcW9I?=
 =?utf-8?B?dmxlR2FtcndTNkZBdTRHQUdmdHdFeUdYbENtVkJiY2d1WnRYMWtwNFo2WlVD?=
 =?utf-8?B?SEd3YlliRjBiUmlDRVBNRWovR0ZybnVGdWlncUExSFYvOGY5UGxMSmhIdjlJ?=
 =?utf-8?B?cFdPWHVGMDkvWDUwVUorN0xKNGRpVWJuL2MrTHVMUGFDd0lhM01iMXl4dlVK?=
 =?utf-8?B?b2JqQzRKVHNhcktjUmhNT3RxL082M3pwV0tjS1pRZWxrKytyUWF6TEpBU3Fm?=
 =?utf-8?B?cHh5bTNaSjZlMXdQMzc4SWMxQjhhSThjTHU3bEVBcTdtTFU1STFnTkhFWG9r?=
 =?utf-8?B?aThRQ0tCSEd4Q21XTlNrNUNmZXhoY0x5US9URi9RNDBiUVkvMzllYzhTalRY?=
 =?utf-8?B?OGtXSXhqQUZ6T0JjS0JoNGtydENxMU5ZMjRWNGlDdnAwcy95aHJjUjFuckM2?=
 =?utf-8?B?VlNpM3RXNW1HV2FHK1F3SVBtbE5wRUdXdEdjRTZtZHNxK1BpcmIvMU5xNW84?=
 =?utf-8?B?SkJ5RjdXNUFRek92eE0wblE5NGFIRWZIRWlxa0xnM1VNaHVUd1dwWnl0a0N3?=
 =?utf-8?B?MVBlMHBvSHY3NDc0VTVMc09ZRTJPUWNIdlJQdlVLOUJ0N2JwcWtFanhwenRW?=
 =?utf-8?B?NHc4TTgzODV3V2FRU21GSnZDUm5IQmVzU1ZJcTFTellqZnY0cUlJZGM1Mktn?=
 =?utf-8?B?aVNNMG80WjFHbTlCZzNNOW5BT2syLy8zMEhZS2h5dnczaTB1a1h1QjJxcGp5?=
 =?utf-8?B?V0wwR2VYeWEzZ3lnMHcxWnpzRjRWY1l6RmhzVXpVcXVkeUtvSzMwakZkNzlk?=
 =?utf-8?B?UWxUbWRtWUVzQkxPdUF4NjF3MDhac0JFQVpyU0xJdzcwMDVUZUZCOTZoZXRu?=
 =?utf-8?B?My9rRnNReTlhcGxZRmRhelUwcjJ2Z2poK3ZKTzdPcHFhMXZ6TUJaT3lTaUdX?=
 =?utf-8?B?R2JBMnB6SGxZK3hFbTFUMWVrMTF1K2xWTlA2K3hCeUwwa3JtWnVTVlp1dHlj?=
 =?utf-8?B?andaRXh1OW1nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SVEzMXhhek5qL3UzOUVXUVBvZlhzTlErNTRkRS9tNEQ1ZDdmZTl3TVFJeGww?=
 =?utf-8?B?aHNQdWxWSXNSTkhLazhkbWErUW5lU0lhQ01mb1ZzTXRGMnFHVE9UNjhjeGdZ?=
 =?utf-8?B?dkxBaEFxdVV5OXlBSzFIeEE1Um1qaUpTbzhoTm1PYUtObWJtWWMrVC9xRTk0?=
 =?utf-8?B?bk1TWGlWbm5VTlV3Q3EraHQyZ1VYcm9acEc2WnpnUGZuQTRVMGU2MDZKQVlo?=
 =?utf-8?B?dTlkYUd6Nld2c2ErR0hnUURPNGtUZXJwWkZtQ1k3MHhOdkNham5nWXlEZDBG?=
 =?utf-8?B?WDJPMlRrU2loaTNCOWxzM2VUSmRXWHIzTUtQVzJwN3pGbVd5MUhQQldwWXh6?=
 =?utf-8?B?WWtvYnZGSDVyV21pYk5lUWdXNXZZYTBaQ25ZbStzY2J5Y3hEYWExaDVaTm5p?=
 =?utf-8?B?bDM0OUg1eWx0bWZzQlhYbGp4NWdDWmlDQkZDWlRHeE1OUFdPUjFKTVlCTmFZ?=
 =?utf-8?B?ZW94RU8xS0RNdkt6SmIrdVhxR3lORlJVWExTNGtQM2l4MFFyaDcvcXoyNW1U?=
 =?utf-8?B?UFZ5MVd1OHRrYjVDNDVIV1pVUDViS3oxajlycjQraTAzdkxzNUdrTWhkdzlj?=
 =?utf-8?B?bTVlUk91REJCSHI2UE40bkdSWS83TTZaclQrTks3Wk9maGhsSzdoR2JyV3Ir?=
 =?utf-8?B?K24zeHdUR2dwY1QvMVdoQ1BuRk93OFJsTWZjMVppQ0IxMTdmUU9nRVFLRGJK?=
 =?utf-8?B?Vm9WUkp6TWhaMDZaOE9vSnE3eSt4M0pRMDFDVDFaOFRSZENxRFB6ODB0b1Yv?=
 =?utf-8?B?SUZORXN4aHdEMk4ySEdDaUVMcThKdDI2UE1BcmVtVXJxL2ZyMElVUVpFNDdY?=
 =?utf-8?B?WkhsbHh1QUkzTE5WRnFXVXYwLzdDcm85MElLOUQxcGhoM0tzeFNZR0ZMYWVV?=
 =?utf-8?B?NDBQcys1YndUNnUweUpyMzhNM3BOSHhVSmZhME9xb0NXZlNPdE4rb294VEJ5?=
 =?utf-8?B?MGZGcnkvc0tXanFuaWVUUktOaFRUYlllMjNrYjAwNzRtYVpOV1QvODZtZlBM?=
 =?utf-8?B?S1pVRGM3eGw0R0QreVkzdHhwZll3VG5VUlRMRWE4L1NZbUllenZRMjB0WGFP?=
 =?utf-8?B?ZitmeElpRzU4cVhxMjVLb01RQUpDTHR6Q2J4NFM2bzNUdnVFcGl0RXB4bmlF?=
 =?utf-8?B?NG1qMnJZTVF5YUd2YTlKNVJWb0VPbkRLd2dqK3JPRk1udFNYMUJSYkRlV3lM?=
 =?utf-8?B?Z1FhZXdpU0VVM1ZLK1pac1FrdStZSERwTTJDcWMrV0ZiSVYxVnZ2WnliUFY0?=
 =?utf-8?B?azFIN0Z1QktsMnBieVovZHYyRzlsRktRcHhoNDZBWklPTkNxQTZxVDRka1Z1?=
 =?utf-8?B?Y3I5bis1SE11SWl1MWg4U3RWejhLekxOdWFCUU9sT2N0cTRiMEZiZWZvYnoy?=
 =?utf-8?B?TlhUK0pacDV4QzhxS2h3QUIvMjVScFVXMDg5NjhMVEN2bHdITldmN1VueGE5?=
 =?utf-8?B?QUIrUHU5cSsvTmhKa2JOTzVQZHJYVGVWUDNkTWpXb0EwbENwSVROKzA1aVl2?=
 =?utf-8?B?dFJCOVdzWWxtNU5KU3BBaDlhc0VOWXVIbC9oWnkzSHcrb05rK2gzZzBQa0k1?=
 =?utf-8?B?RS9xMXJQYzN2blNBYS9LMGZFcms3NHlPWC9OWEVPSW1kVTkrNU82YjBMVFhG?=
 =?utf-8?B?T2NnTXpQQksrbExxaVQvdCt4cDQzbDczY2dsVGZrZm5NUWNHc0RLQnFEQW1j?=
 =?utf-8?B?cHBLdG5pclhDZTZQMURKcTZWcWo3OVd3U0ZIaVlSdjVBZXpYWVhsYUIzbGY0?=
 =?utf-8?B?aHhKWWdmVDc3a3ljM2Fjek1OMUh2enl2VEtPbnR1ZUhDU0k4QkpKOFFiOTRV?=
 =?utf-8?B?S1hOeHhMc1ZZMkFEaDNCQWlzZHJqTWVjakVsSXZucmp5QzJBcjJxNnplTlZY?=
 =?utf-8?B?bE9rbUgzL2lBSnFNMGVJMDMzOWh4MjdOSjlZU0FnbmR3d2ZEVm9aYmhSNTJk?=
 =?utf-8?B?SnM5cGRhUDhkazlldmNWSmY2Qy9KamYwcFBJdXNTODcyVTNXSllGd2toZ2E4?=
 =?utf-8?B?TmFabmduV0orOTl4S056VXVEM2RrVTJ0dXhFZ3ZVampURkZGcXNZRnd1SUNF?=
 =?utf-8?B?SkdHMVJEK3hSRXNIZTFHR1lnRzJDMUlYUVgyaWxFWFE2OTZPUlJKN0tTRndD?=
 =?utf-8?B?RGJuZWtHODlKaEVYM2VZaWJlcFc0bkxOdjR4dFJGZ3BFcHBJQW9lOUNOd1Rl?=
 =?utf-8?B?eWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BB83C53AE50E14B9B3332C370E080B0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19deb4bd-3780-4c42-c071-08ddbf9662ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 09:44:38.3137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xKhRf5zB7MLA6/IFIerdBLQYQ6btfUbw4q6K5ozfb73TiDSGZbUEV4ixUDtRdHhmePSF4pwH/F6rMhH36tOdLBxib9G2eigNoUaSAxAvd9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8445

WWVzLCBzdXJlLiBJJ2xsIHVwZGF0ZSBjb21taXQgbWVzc2FnZS4NClRoYW5rcyENCg0KT24gNy8x
MC8yNSAxMToyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA3LjIwMjUgMjM6MzgsIERt
eXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+IEFkZHJlc3MgYSB2aW9sYXRpb24gb2YgTUlTUkEg
QzoyMDEyIFJ1bGUgNS41Og0KPj4gIklkZW50aWZpZXJzIHNoYWxsIGJlIGRpc3RpbmN0IGZyb20g
bWFjcm8gbmFtZXMiLg0KPj4NCj4+IFJlcG9ydHMgZm9yIHNlcnZpY2UgTUMzQTIuUjUuNToNCj4+
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmM6IG5vbi1jb21wbGlhbnQgbWFjcm8gJ2lv
bW11X3F1YXJhbnRpbmUnDQo+PiB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaDogbm9uLWNvbXBsaWFu
dCB2YXJpYWJsZSAnaW9tbXVfcXVhcmFudGluZScNCj4+DQo+PiBUaGVyZSBpcyBhIGNsYXNoIGJl
dHdlZW4gZnVuY3Rpb24gbmFtZSBhbmQgbWFjcm8uDQo+PiBBZGQgYW4gJ2V4dGVybicgZGVjbGFy
YXRpb24gZm9yICdpb21tdV9xdWFyYW50aW5lJw0KPj4gdW5kZXIgdGhlIHNhbWUgcHJlcHJvY2Vz
c29yIGNvbmRpdGlvbiAoI2lmZGVmIENPTkZJR19IQVNfUENJKS4NCj4gDQo+IFBlcmhhcHMgcy9B
ZGQgYW4vUHV0IHRoZS8gb3Igc29tZSBzdWNoPyBZb3UgZG9uJ3QgYWRkIGFueSBkZWNsYXJhdGlv
biwNCj4gYWZ0ZXIgYWxsLg0KPiANCj4+IFRoaXMgZW5zdXJlcyB0aGF0IHRoZSBkZWNsYXJhdGlv
biBpcyBjb25zaXN0ZW50DQo+PiBhbmQgb25seSBleHBvc2VkIHdoZW4gQ09ORklHX0hBU19QQ0kg
aXMgZGVmaW5lZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gUHJva29wY2h1ayA8ZG15
dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPiANCj4gV2l0aCBzb21lIHN1aXRhYmxlIGFkanVz
dG1lbnQgKGhhcHB5IHRvIG1ha2Ugd2hpbGUgY29tbWl0dGluZyBhcyBsb25nIGFzDQo+IHlvdSBh
Z3JlZSk6DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
IA0KPiBKYW4NCg==

