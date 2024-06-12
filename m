Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAF690490A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 04:35:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738793.1145652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHDoD-0004ML-OM; Wed, 12 Jun 2024 02:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738793.1145652; Wed, 12 Jun 2024 02:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHDoD-0004Km-LT; Wed, 12 Jun 2024 02:33:57 +0000
Received: by outflank-mailman (input) for mailman id 738793;
 Wed, 12 Jun 2024 02:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAc7=NO=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sHDoD-0004Kg-2R
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 02:33:57 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34f53537-2864-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 04:33:53 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB8723.namprd12.prod.outlook.com (2603:10b6:806:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 02:33:48 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 02:33:48 +0000
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
X-Inumbo-ID: 34f53537-2864-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLx4IXGQUDRKVpSyIxXmeaapRYSPUyCs3EPtRcD3/+yvU4eJsk7mYk/XrMuPFeW6zCEKYJ+8RCZ2MucKTl2jbuUb5PB9VQRHTaJQkcbBQCE4qb0nC77BArqNOhulTrpB03CcN8ZL2g63PbZdxsfMD5gCY1ap8/fHjrbKC42/TFDElWtcyshxbHBOH9wHzkBTPQJMYLzPjGoCK0eFTTOU73vKee0rBQezMi8Zxw0YcZse4ySxBqIx9qVOJpGh9pRILb+Xye1m8EFCvdKzact70kci6291lLzAnOxUBGbRpYlOXX7/rhaJZeM0EbVs2PsilXOK5l/3G4sbuZRPW3ydCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KasVo+XhgybeRV6E11VQ8Riy9H2SSGjPWcryqoqwTnw=;
 b=Ak3C5MUfuSZ5s6IyJhZWTTFaIIcIWIDfJy3wmvtk12i+rS1t0d2XctCPxJyIp5bIBt7vbNMbhUk27Nor9LvPrQK4U+Q7EYpjTEaUpsiKOvANYpAOTkK4Ow2Eak26OQd862+eSMHk2DTsPNDGvEH4U793QZYjLpueC10dPiF8CsIIKnIzsS6Z5jPwJNOK3VDK4092BiWFEMn/0FIg1mjoqRU731HEXE4pfa4W/wvqcuUUj4KaEY1fKrd9IiLXzPGIogNMEQWd4UXXama4fuhWkdDmx9YBCrB/ggHZohPAwhMRNgNgbWDyq8/i+twFfeyuBZCc/F30oHCyjhS2VyAkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KasVo+XhgybeRV6E11VQ8Riy9H2SSGjPWcryqoqwTnw=;
 b=g7CnB3Bfh7e2bAFPDzELUQnQu9YiNtbfycAw2wIG2TgllPNNtw3TFF7gnfw9EwYKXQuCfmWwg98RMeislSp77ig48vLH9MsvFLl+o23HmMnzbYhFv9TfgVPEPVxbHL+Mgz0NCDLU86bua+cvybBP9YvvII9jWhlUoBp6g5aLoVI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v9 0/5] Support device passthrough when dom0 is PVH on
 Xen
Thread-Topic: [XEN PATCH v9 0/5] Support device passthrough when dom0 is PVH
 on Xen
Thread-Index: AQHauLJeUet4FsoIl0WzirfdjEDvvLHBLy8AgALGaAA=
Date: Wed, 12 Jun 2024 02:33:48 +0000
Message-ID:
 <BL1PR12MB5849971F44987BA2140DB412E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <e2202691-5ca2-42ad-a360-31761f73d889@suse.com>
In-Reply-To: <e2202691-5ca2-42ad-a360-31761f73d889@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7633.034)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB8723:EE_
x-ms-office365-filtering-correlation-id: 7185f01c-3bde-4f3c-3dde-08dc8a88171a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230032|376006|7416006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?NU1OSXpIVThubkdYUThnMU1rT2lTZWhCaGU5ZzdLazZlcHYzTlduNWN6dTFw?=
 =?utf-8?B?allJTUNsTi8yZUhvWjNGRk02ZjhDQ2pNeVVua2JrWENKK1lmZlFIKzlYMzhI?=
 =?utf-8?B?aC8rSm5EOXRBN3pFSTFENCtNY0xST2ZaYmxYeXJ0L0sxWEZuSUxZdlE2eGx4?=
 =?utf-8?B?dXY3dHJRbnlTSmxRdUpXNk5RU2ZsUDRjM0NNVWlOai95bVloVVBTaXZWZzlv?=
 =?utf-8?B?ZE1kQkJYNGgxVG40Y1BvcmNqT0I5dkgrMGlCVmIzdlZEM2M4WEpMZnNGUmtV?=
 =?utf-8?B?YzJXcjVkQy9mNFB5VjlEelpiQXB5Y3YzL3V1VUQwRDJXQ3VnWmRFUEZrMjIx?=
 =?utf-8?B?ZVVXNXV1RElYeWtNeXR1bGdySjBzdzQ5ZjRQbEVtaTFYWjZ1R3BzeTVuSHVa?=
 =?utf-8?B?ZHlWY2ZZbzFKVVFGSXdjbEpUQXVCTHBMazk3czBiQmtTODgrV0hBUkJJdUZw?=
 =?utf-8?B?elNRZ2liYWRwS2JWeGZQVzU5clgydjJqR09oU2JXM1psNW1ucXNFU1Z1aHdR?=
 =?utf-8?B?VGRzWGZMZTEwSEo0MFc1MmZEMzNZaGhsMW0ybHlVUklmRkJYL0JjZXczU3F2?=
 =?utf-8?B?RkVheWt2Znk3a0hTanZ0NmtWNGEwYzZqclNUcU51dzcvNjIxQ0srVlplcStN?=
 =?utf-8?B?NWtNYnBWdGRuUmVic2wzWnAzNjQ0UmdkNW5xbklvb0xEK0Rzallmc2szcWFo?=
 =?utf-8?B?TUZkZ0xVeEcvYkVOWWw1TkVCd3BBeVlCZnFNcFNnTm1pVC9NZ1R4MlVrVFJM?=
 =?utf-8?B?dlN6NndsS3pzSDZuRnNjdDJpelpxR0NMZElNaHUvdk9MN1VJOEhWQTUwZW5C?=
 =?utf-8?B?b0RkdFhiR1FIUHJJdWJGSU1Vak5CR1N4R1phODVKQ0xYWFpXMHNmbDVGdnda?=
 =?utf-8?B?Z2d4SUt4WW4rUnNsN3hBTTlCOEF1L3hMWGhvTUFpUFJoQmgzWDVWUkhCQ3dF?=
 =?utf-8?B?N3F5cE5Sc0RzSHVxU051UEZiYnovMkloMUZZUWJXYUMrL2l1T0RZak93cmpB?=
 =?utf-8?B?WldGdGdKamxCRjNzZjdMRkZvMGRZQnFVbHdmMnBZd2dFWjBRaFpiRnJ1Ym5o?=
 =?utf-8?B?cy9rWUlXNXdUYXBIUkwveE9vQ1hGNE1KbmRBeHBuMk5kQVFPRDZHZTZSNUZH?=
 =?utf-8?B?RnJpRGtBd3BkcEFEb0QyeHdtb2l4OWV6d2R2MjNzYXp5RFk0T2NZQkNBLzhG?=
 =?utf-8?B?RVliSVNVUGZqQnYyNGU5YTRabVhKZkJqWE5PSmJNckZlUHlFRDNXUStIRklI?=
 =?utf-8?B?UDhuNm9LWEEvM2F2RjVWNGUrUHEwcUp1VmdZMzUrRFBQQU05aDArS2pIamlz?=
 =?utf-8?B?ZU1seEpna29YakdPbERjdmd4WDU4R0pyTnE4bkZPM1lSa2EvM1g5QzhWMWQ5?=
 =?utf-8?B?S0NwOGtNYjdFcllEZEVoeVBMdnZwMmFpK3FIVlg0YnAvNDg2RHVyTFAwNjlw?=
 =?utf-8?B?dkFQOTNIbHkrV01WUGJkZzViOUQxdDZCMFRyTUNTZ2xndWNYS2ttRG9mZXJj?=
 =?utf-8?B?UGhrMEZXSm9HQlU4a2VMdFdCelZWTzF0dE5HWWtaMCt2VjBBYVlvakU0T2ZE?=
 =?utf-8?B?RzFteUNvVHFxOTB6ZVJrZXI3ZnJzNWcwYVFOQmVxM1NDRUVxZFBaQTRWRkJa?=
 =?utf-8?B?VXAvYUNyUmFoeFBjZlIyeC82bWMrTGxxdGdlN1RmSDF3aE8yRktGMVBkYWQr?=
 =?utf-8?B?c0szd3lpbUtSdFlTYW1oa0dpeWFITFp5dERWNHprRkdDSGFUSEdzNStFL05r?=
 =?utf-8?B?MGtyWFE2enh2T0IzRGxTZEE5N1BZcXNqL0pLSHUyeTkxTTdLZWhYUzRxZUZX?=
 =?utf-8?Q?V30BbrXZwQ8wPzlBpiTb8JMyhxllWHNOc6P7w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(7416006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N0RzTUNWR0JzY25GWS93OUZTS0pqZjFsWkR3VnhzV3JWc1RINUFZRXJoc1l0?=
 =?utf-8?B?a2tWYlUyelcrZGphQVVtVEFqN1RDSkNYN2RzSHJOZ1hwNFFDVHFCTldyTEZ6?=
 =?utf-8?B?cGkxTHUzNWVqK2tuNGQ5MjdmaXJ1Z3FYL1d5ODlETDF6TTd4cmR5eXBVK2Qr?=
 =?utf-8?B?TGRjQk5QMXE5bkJpTDZ2UnBmSmVOSFlWbDN6a09rN2VwOUw0QTN4OWlBOXNw?=
 =?utf-8?B?YnZQUE1oblBsdjAyR09neU1QYnlKTUVwVzdVeU9QQXo1YTRUOTQxZTRoSlI0?=
 =?utf-8?B?ZEx4S2QxaDNuUFlDbmpnckVrS3U3akNucjk3UUx2Z24rVjJvaGp5dTVhTzMr?=
 =?utf-8?B?cEdvWGFFM05rQ3dJOU1HQTJnbHFIbDZNaXdDTitPWmNYSGtHdm11c0dyT3lM?=
 =?utf-8?B?dlFCOHBPZ0ZaSXBPaHljRVNBL2FEcnRCN0V3ZXJGRlRDbXJqd3pXYmVHd0Ew?=
 =?utf-8?B?eVlnTERFcWVLZVhZMHlSNXRJNDVWZHBxbnVpRzYxTVgwNW14dDRVS1pFYjZO?=
 =?utf-8?B?U3hwOW9vMWZvaG9jejlrai92U0ExUnhqUSs0NzVDNHZxWXRweVpSNkpHcEM1?=
 =?utf-8?B?ajlOeWhyU2RhV1dzTDhIMWRKZ3V1dkwwNUIzdzlFeWN0USswRXY5ME5KNm5H?=
 =?utf-8?B?LzErRnZhNTNpNmp5S3ZWMElQeENjY2pXYk1BMGxnUTRkRVd3YmRncVgvZlNU?=
 =?utf-8?B?QjJJa0kwZlorcG1ROTkyS1BCc01Qa2pPUDJpenp3T1EwbEJpdWVDbmVWdEY5?=
 =?utf-8?B?aTFCZVdXRWFpdG8rdnQyMVVIOUNnTE85Y2NNUzVVdytLZlNQRDhOV0pJeXVa?=
 =?utf-8?B?RFhzSkIrSStzb1dTSGpDZUxBdXltbXFPazVPWkU1M2xLTytnTytoN3VQY3dl?=
 =?utf-8?B?endpWUhvQi9pc2JCYWxCQ3BxSVlwMklQWk0wUSs3UUcvUEJRN09oSHlVVzAz?=
 =?utf-8?B?QldySWliVjJETWZBK0N5aG50NXdpZjh3MG91K2lhMXRtV0tBdEpSMS94SW5X?=
 =?utf-8?B?aVZjemJnalhTNDZCVTRXN3NSc0xzYzB6aVBVQklxSGU2TXoyb3FRa083TXVE?=
 =?utf-8?B?VmFNQ1FESVV0REtOd01tOHhHSWM4NjVzR3pIWDVqYjNrSm5DU2tIdmZGVjIr?=
 =?utf-8?B?d0FYYitxM0NPZEU1bDBJQS9XVXg0UXBXcnpLK0FRNGJPZXhHR0Q0VWwxUDJX?=
 =?utf-8?B?cXp1a2VBdUZVZDk2MmRWNjh2UkU5TUpTTHZaNzVLR05BQkZnT3ovTUJZblBw?=
 =?utf-8?B?Zy9zOUcwZXowaVR0YjVwZGtHR2MxdXVNbkFJcGhFTjl2YUk3bzVnSllYU2l6?=
 =?utf-8?B?OEpMTi9JSVpCLzlyU1RTOUJ6cE4yZHNRVFQvN2kyOHR2Qk9LRmJxUi9Zb3FR?=
 =?utf-8?B?eHdrTFZlRjVPcHJqZmFCTGQwU3pMV1FIMldUdnZHOUNKTzdGR2pTbzUrUDY2?=
 =?utf-8?B?STZtVzlPNUhXN2hvTnFOM3BYVSs5UkpoMExEbHo3L1haYW5VZHUxTklMRDQ5?=
 =?utf-8?B?NVp2ZUl3YTh2QjVBYlZYOXRrM0Z0a3hHTjJqbDJVV2Y0WjExNitUK0JGTFpj?=
 =?utf-8?B?dlZmMFl3K1hlWXpkSk5WcEZDdVErSmJjU2pCRkMzTlhFTEttSWJVTjdTbEkv?=
 =?utf-8?B?aDhBNlRTS0dob2prUEY0a3dOTFJ6cWtBZzljYTBrZHdKUHZFQmZaVGVCeTVx?=
 =?utf-8?B?N0NGalc3Umh6a1A2WktkZjFuclA1ZHRodmtVb0FCUUlQNmZMWk9tZE40SmJo?=
 =?utf-8?B?NnJLRTRkUGZhY0dPYy9RQXN0Y1FBOE5paTNld3hPbTlQL1RFUkxBcm5tYVJQ?=
 =?utf-8?B?MXN6TGZwU0R6MXkrSTEwdGs0dVlkbkpnUEkyQ25UUjlOVU5DV2wwdWo0MFBz?=
 =?utf-8?B?ZnRCRVgvZXdJRG5BeHdPTnU2d3F1eFA5ZGhkR0dBNUhuSmJYVm8wTVVId0g0?=
 =?utf-8?B?VjVhR3VTUStmdEYrcGdmMUNpVXpZRW81ZEZoKy92RXVZK1ZublBLQkVZalNP?=
 =?utf-8?B?L3dKSk1reHBreWNSQWZkR3J5aGlra0k4T1J4K0dGdDVpUTFERUZ4QzFYc2da?=
 =?utf-8?B?NGhQRFhCZzZZVFIycGhvbGtwMG0vVktOQjk3UmtZL1hHLy9BY0N6c3JyRGVa?=
 =?utf-8?Q?Nfw0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <620EC99086C844468B30BA8FD52F9721@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7185f01c-3bde-4f3c-3dde-08dc8a88171a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 02:33:48.7493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /A8UCMS5D0p8UDLiET3JQheBdtdyhOfDAmqjmCZg9oWJrKL/lBm74bfFclafW/RJQ6dAAWohtdNO7w4YZuS9XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8723

T24gMjAyNC82LzExIDAwOjA3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDYuMjAyNCAx
MDoxMSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBIaSBBbGwsDQo+PiBUaGlzIGlzIHY5IHNlcmll
cyB0byBzdXBwb3J0IHBhc3N0aHJvdWdoIHdoZW4gZG9tMCBpcyBQVkgNCj4+IHY4LT52OSBjaGFu
Z2VzOg0KPj4gKiBwYXRjaCMxOiBNb3ZlIHBjaWRldnNfdW5sb2NrIGJlbG93IHdyaXRlX2xvY2ss
IGFuZCByZW1vdmUgIkFTU0VSVChwY2lkZXZzX2xvY2tlZCgpKTsiIGZyb20gdnBjaV9yZXNldF9k
ZXZpY2Vfc3RhdGU7DQo+PiAgICAgICAgICAgIEFkZCBwY2lfZGV2aWNlX3N0YXRlX3Jlc2V0X3R5
cGUgdG8gZGlzdGluZ3Vpc2ggdGhlIHJlc2V0IHR5cGVzLg0KPj4gKiBwYXRjaCMyOiBBZGQgYSBj
b21tZW50IGFib3ZlIFBIWVNERVZPUF9tYXBfcGlycSB0byBkZXNjcmliZSB3aHkgbmVlZCB0aGlz
IGh5cGVyY2FsbC4NCj4+ICAgICAgICAgICAgQ2hhbmdlICIhaXNfcHZfZG9tYWluKGQpIiB0byAi
aXNfaHZtX2RvbWFpbihkKSIsIGFuZCAibWFwLmRvbWlkID09IERPTUlEX1NFTEYiIHRvICJkID09
IGN1cnJlbnQtPmRvbWlhbiIuDQo+PiAqIHBhdGNoIzM6IFJlbW92ZSB0aGUgY2hlY2sgb2YgUEhZ
U0RFVk9QX3NldHVwX2dzaSwgc2luY2UgdGhlcmUgaXMgc2FtZSBjaGVja2UgaW4gYmVsb3cuDQo+
IA0KPiBIYXZpbmcgbG9va2VkIGF0IHBhdGNoIDMsIHdoYXQgY2hlY2socykgaXMgKGFyZSkgYmVp
bmcgdGFsa2VkIGFib3V0IGhlcmU/DQo+IEl0IGZlZWxzIGFzIGlmIHRvIHVuZGVyc3RhbmQgdGhp
cyByZXZpc2lvbiBsb2cgZW50cnksIG9uZSB3b3VsZCBzdGlsbCBuZWVkDQo+IHRvIGdvIGJhY2sg
dG8gdGhlIGVhcmxpZXIgdmVyc2lvbi4gWWV0IHRoZSBwdXJwb3NlIG9mIHRoZXNlIGlzIHRoYXQg
b25lDQo+IChwcmVmZXJhYmx5KSB3b3VsZG4ndCBuZWVkIHRvIGRvIHNvLg0KU29ycnksIGl0IHNo
b3VsZCBiZToNCnBhdGNoIzM6IFJlbW92ZSB0aGUgY2hlY2sgb2YgUEhZU0RFVk9QX3NldHVwX2dz
aSwgc2luY2UgdGhlcmUgaXMgc2FtZSBjaGVjayBpbiBiZWxvdy4gQWx0aG91Z2ggdGhlaXIgcmV0
dXJuIHZhbHVlcyBhcmUgZGlmZmVyZW50LCB0aGlzIGRpZmZlcmVuY2UgaXMgYWNjZXB0YWJsZSBm
b3IgdGhlIHNha2Ugb2YgY29kZSBjb25zaXN0ZW5jeQ0KICAgICAgICAgICAgICAgICBpZiAoICFp
c19oYXJkd2FyZV9kb21haW4oY3VycmQpICkNCgkgICAgICAgICAgICAgcmV0dXJuIC1FTk9TWVM7
DQogICAgICAgICAgICAgICAgIGJyZWFrOw0KSSB3aWxsIGNoYW5nZSBpbiBuZXh0IHZlcnNpb24u
DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

