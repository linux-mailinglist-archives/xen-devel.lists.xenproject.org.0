Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91911AE7EE0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024628.1400471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNAv-0003FE-3M; Wed, 25 Jun 2025 10:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024628.1400471; Wed, 25 Jun 2025 10:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNAu-0003Ch-Vg; Wed, 25 Jun 2025 10:16:16 +0000
Received: by outflank-mailman (input) for mailman id 1024628;
 Wed, 25 Jun 2025 10:16:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PEPZ=ZI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uUNAt-0003CZ-U5
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:16:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2415::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b50d21b-51ad-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 12:16:13 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL4PR12MB9723.namprd12.prod.outlook.com (2603:10b6:208:4ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 25 Jun
 2025 10:16:09 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Wed, 25 Jun 2025
 10:16:09 +0000
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
X-Inumbo-ID: 6b50d21b-51ad-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7w1oxyOvCWyxj9bLwa1JOsvN48X71Mtkmk1//z6G4RFU/F9WyLbyV6pBhFKao15Mx5xdnpBF7/PPWdpv/tjPpH1hiJnqML1xFKVvC2M5aTONKDpxuylyjbx6+FFAr02/isSgeyfAAOuJqtPrhwCYMi6LaYB1RiL/CXBAHkJJ013DDaZCOQWxt2MXXuriYBdjfA/slogI4DFsHhE/E8qfi10MxKA7BCryMjH/q56AS78/sPKMoglYTQ11lKi2L7r1OKWlVLer+F1XulVF+m7fRLktehhPiAFWddlOoEuo0qx2YIWvGAOa10vHDkmz1OCXB5aIXiXd7SBvt1qPvNkIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRAasRSBI1oSj8pjEJ5i6ho6Luoo8aujRZGoQxaNo/Y=;
 b=Ln7czIQAdds4nIwKLYY3HSuDMsbtw/5HJBLMuxGi8hDaIXdKnLu7pXuKmUpGFqXG3gUZmvRNHOah6c9qZZ3YKv9QrBy1XqigX1iplnMDb6KFcvYvYHeM+eqA2Uo8tkZUtU+riNsKn794G+RCZ+rblLBWUeooHFlta1qqzGyQRMnGr/P2TQXZt7g2HjlVAXfP1X/qaO6/rYACIBX+Y5sNDuDU/CTE1DNr++Hf5XoN8i+/faO/Xdx0Bl/sehR6RYnTNJ3v9YiJd9X86B1NsKElzeCRcwMHCXFtMZBt9YfUfhrww2a9nGMjoi9YGo/skURXW3cN5uH45Pi6VPf8UMGZcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRAasRSBI1oSj8pjEJ5i6ho6Luoo8aujRZGoQxaNo/Y=;
 b=BbXkFc/Au8VJf0BWiuiF2WiPTV3G8mMH/as+tE0hNW/8uRBEeaZTJLJzeGg4rK2ez4TaMkv6/dV9jTgQpUxKOK7CwIO7Sk7uNOR+1voI7+Ijy4eyEAZr9nZxIhNRV24A0ZXNERjDeH9t1cDn1uL3gIhmqUeKpeFs4bLZkXF4cvI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QI/QAAgAGa9QCAAQzVgIAG5D6A//99hgCAAJwoAP//hioAgAHew4D//5oCgAASTfCA//+FrwCAAIi+gA==
Date: Wed, 25 Jun 2025 10:16:09 +0000
Message-ID:
 <BL1PR12MB58492A16BFE80B49045AB936E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
 <BL1PR12MB5849B3C334EF0C5BBCAFB7BAE77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3638e73c-2a83-4164-9a84-839245245727@suse.com>
 <BL1PR12MB584988E00D0F4A4330B9B968E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <771cd5b7-2b89-49b1-9aba-8cd79319d3ce@suse.com>
In-Reply-To: <771cd5b7-2b89-49b1-9aba-8cd79319d3ce@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL4PR12MB9723:EE_
x-ms-office365-filtering-correlation-id: 0367f957-dbfb-415e-f042-08ddb3d14e28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aEtzQWs1RmdyNmg2alNvSkY3bzdPOHJnMWZNT24yVzhHRHFnQmhrQTFnbUZN?=
 =?utf-8?B?bU13UmZ2T3Nrem1jQnlpeDR5cTh2bXN0RE9jelhOTjhXRW1oc1Z5SHRwOTE3?=
 =?utf-8?B?MVJzY1FUelRJNGN0cENkQU9NVDlxMkFxMUpsRzVIWXVZTmF4TjJsVXNwM3BU?=
 =?utf-8?B?UTN0V1FrSHBNNysxeHNmSW5ZWnM0OXlUbmNqWnlxd2RXZFc5NzRSRHFwSUhR?=
 =?utf-8?B?NmRFNThkM2cyVklmV09JUGcvdG9ZdWIzRjhFN0p3UmdlMVAvKzZNWVd0MWhq?=
 =?utf-8?B?T2RVUk5lSDZPcStrTGk2UXU2OXFYVmdMSkNuOFd4bzllR01DekNpTUg3bVdV?=
 =?utf-8?B?S01mdlBPaUcrTVd2K1FGMkpBT2Z1bzgrVG55c2FHdW50azBLR1FrOUFwNytr?=
 =?utf-8?B?TFRmN0Rnd2w2bFpONFVLcklkUVFQVFc5M01RS1pZUkNmK0pnZTFxNmZ1ajlx?=
 =?utf-8?B?K3RmdERBRjFFNVlscGNWdUFXTHdWZnhnalYwb2NMT2FmaEUxbHc4cTlDTVA1?=
 =?utf-8?B?VzRwOEJVWStNUzh4Z0dLRGxzZEdzOG1HempKdDVJbmJNY2t2ZmVacFZjZ2ZI?=
 =?utf-8?B?eXlSTEtuUDdxc3NuRmljSmJmYTJYZ215NkVJU0tUblQ4ZmpJQzVDOTFXeDEr?=
 =?utf-8?B?QXVCZjdqS2c4SWV5MFFlUzdsVjl6T1pnWDUzWVN3UnNFVWw3M3JZN2lvKy9X?=
 =?utf-8?B?ZFF0NHlJYlI4bzM4N1paZmFQWHIvR3JlSTcxWXRGMVEzdDBoS3U5enVldVFp?=
 =?utf-8?B?Y1pvSHlHcHJTSkJFVSsxS29VdXlOU2hFUitVaGtCOTJINGd4dGJtNFkxTG9D?=
 =?utf-8?B?ZVZhMGkwYktPNTZvemRNU1dycHhQTytNcDMvNzlWVUdBN3FGajAwMXIvbzhR?=
 =?utf-8?B?YXk4ZjZCUG4xNjljQ3A2YzNCQnFuTTd6amVzN1VIZkRsSWRzN1BsdUFYUmlO?=
 =?utf-8?B?bGt3bDFTUGpXTUc3a0R0WjJGb3QrNU5qbUdqQklHc2FDNDdDU01jcGxhTGhi?=
 =?utf-8?B?aUFSdS85eEg1eE9jaGd0Z1NyZjIzVkNsOXlnMStlSGRyUlI0YjdSOXZBdXA0?=
 =?utf-8?B?cmdWSU5LY1RJZlgrYlJaTmR3bjhSOGcvSDBUQ3BRNUhPRzl0T2VhMThnU2RR?=
 =?utf-8?B?VFVjZnJFUk5ZeFVGUGJpL205TGdFSGFIS2lvVW9rSnF1WXFvcjVoNFg0VUps?=
 =?utf-8?B?WExlZ04wbFV2ci94NXUvcjFld3pHU1lQTGJGMzFwb1RrQUdjWXZDaE5jb1hF?=
 =?utf-8?B?cFJ4Rzg1YmV2VVZpdVY4TTRDdGNKdUtCR0txWi9ScS9VZG96cXZFVi82OG9W?=
 =?utf-8?B?Z3EyOXVERnpBN3RsRVNkcUREdk9XRk9xc3RkSm9mck1Zay9yajJzdEpDYUU2?=
 =?utf-8?B?TEVUQXhsRTUyeGp2UHdoTWozWUU1R1lNSGxZN0p2cGhXZFZZUlNJekVKTUhu?=
 =?utf-8?B?MTBoazNrb3hTR0R5ck50SHg5VmR0V0YwdVdHTkk1TWMvK2k0M1F4cjRHWjVU?=
 =?utf-8?B?Qmk4eUxlZHBoVTVJRTRaSndWTmwwcERXY211Z1k0TWFwNmY2Y2FQOS9kazlH?=
 =?utf-8?B?ZVJVS1B1cjFLMU9TQW4xRVN1dkRBRmgxVjREVW8yQ1Z6WVY5cGE0eGRFbVVJ?=
 =?utf-8?B?WjBSQitMZld2aHM0dnZYTDRWb3BYY21CZFdNZ21WcWMwR3JYVHdwV2lNTUR0?=
 =?utf-8?B?YXdNek8wbnJpNnd2V2JjMXpzZWNHaGNRaGRlVitxL0NHZHpmRlhNUWVHeS9u?=
 =?utf-8?B?L3N4aVczdFl3MlJYcjE4NVh4N3cvaG4xa3lMUUtPVk0vWkdJMGd4ckYzOGVt?=
 =?utf-8?B?NklJVGc1RW9CaWNnekZSemVaekZtL3BGUElxZFpTTDEwenhuZW1idkdYaFNQ?=
 =?utf-8?B?UFd2WUtpOVdBeHJrWXU0bTl5UUVra3ZHOCtwVnF4WlJ6UnhJQlNiaEZQWWhm?=
 =?utf-8?B?M3pOL3ZheXEzbXVQdTB6L3ZHSmtZbEk0dmkrRDB1VDhNOVpWU2RVd1VnTWp5?=
 =?utf-8?Q?tPQhN5vW4PHnUitNN+wf6cxsQ9B0os=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mi9oU01oU0crSmZQM3AzM3BUMzlPS1dMb1B2cE9ibDFtRGRnQW52dXhZWHpI?=
 =?utf-8?B?WUQxaGZ1UUR5Zi8rV0QwMThNcGkvZklBKzVTRWlBUmxzc2FFZzVYM1U1WUZP?=
 =?utf-8?B?alF4NHNnSVFqbDUvcnprWXhCTTRHR3gwbFRPMlpibStyZ3FpQ0R2b3l5cnhT?=
 =?utf-8?B?RFlYM1pNajRzVkxqVE9kdkFZWUJUZjZCUkRNWWVST2k3bmp5WEg2V2k3cWpU?=
 =?utf-8?B?Vk03Wjc1dkppYkpJRTMxcXVEazFVZURIbHFMTGFLdjl2TE9rSEFrMEJ6dEZw?=
 =?utf-8?B?M3R2OXRQZWNwMkFXVUtBSUw1OHE5aElyQURFc3ppS0tpdTlHVm8wSTVtd0Zt?=
 =?utf-8?B?dVJjdTI1U0xnNys2RGh6eVhmeU0zYWMwWjM3ZmI5THU4OUFnaUZVNXdyWkpj?=
 =?utf-8?B?MTRIOVI0NjlwTityWndjdWRuZ1djR0RpWlZQSHdpZFJtcE5TbzhJeTFoWXVW?=
 =?utf-8?B?dVpaQzJRT0Zjci9RN0JYYUpqbVRPelUydnFCSWRabFVPRlpubzJUNHdxZVpM?=
 =?utf-8?B?VXJuRXJhQlgvblZoQ2NsbXhsTVlFTUp0QnBTZFV6d2hBK3FQNjhuYm55T0ZO?=
 =?utf-8?B?M0hpTzh4NVVLT3FpMjlIVzl2azJ3YmJVOHI5ZVVpbTBrbFBpTHFrdzFqU0sy?=
 =?utf-8?B?aUF6TmF4N2swZlM1WTRJU3ZLL251NWRDeDR4elVoRE5XdHZ3SVMzZDhxSTdk?=
 =?utf-8?B?T3ZuZGNjNWhzdDErNy9zMm9qL0Z1eUdaakRxdVpkY1RVcE81dzk3VWNGT0R3?=
 =?utf-8?B?YkFrM2UyQnNiQVNKZy9UN3JubW51ZTdKSnRiamRlSFV4TUt2SExyKzlOVkFL?=
 =?utf-8?B?cVh2cnZqRnpOS1hsaHF6dEJHK3EwYS9nNm4wQ2huaUNHTjZBcDhZWlJPeGYw?=
 =?utf-8?B?WW5SSWFwTnNXQjZGV3hMLzc1cEhhNUtXTzFJWGFabnFqMmRnRmR6aEEzTHhj?=
 =?utf-8?B?UnFrekZhK0JnQ2JsRXg0Z1VPTTFVS2ZkTmlnN05oWi9OL2pDaE9hRmVIQzgw?=
 =?utf-8?B?YUN5NEJyWEE2SDNwVnU1Q0d4b08yTzBIMUpSTUVwdk9iYVVITjBzcGRnUGRX?=
 =?utf-8?B?ZVdwL0FZSFRTVy9teC8xOCt6akp1MVdZeUZOTlJXdHdZVC9qTXVOMTdldHhH?=
 =?utf-8?B?VFhGVlZJVTNoL0lzajR5WlphYi9Sd1Vadk1EMlEzc1d5SjBzY2svcXJIdmxR?=
 =?utf-8?B?NlVrYjJJM2pjZ0VzbHFPY1AxeXpTcjN1YXZkNkZIaER2cWhuZ1B0a21udDZ4?=
 =?utf-8?B?ZzVaT3ZGb2dYWkZHVmVqczdEUTdpUVFuTDI4Wmx1U3hNWVI4K0dSMXF2WFFM?=
 =?utf-8?B?cTlVM3FhZGF5d0x2ZjRSVzIyeDJ2RVZ3OUFIUTFxK0JNNUZOSVFLTGtRaTR4?=
 =?utf-8?B?RllGdDk0ZmpUVzJnQU5odkZkTmUxTUNVbjgzR1N4QmlsNXFWamxzWm9NL0hB?=
 =?utf-8?B?TlF0aFlHOGhnZlhIcGN5Y1JjR3Q4UU82cDN4WmlKSnlra0pUYlBCUWVHNjU0?=
 =?utf-8?B?QlduS2JVUUlLbXVtSTVaMnNzdkJPbzh5NFNOaUo2WFZQWXA3clhnYXhQQ0s2?=
 =?utf-8?B?YnlHLzBwWjE5cm5kbFlRbEMzRVFoTzUxV0pKQ3RQSXpzQjJzMVdoekhoSCs4?=
 =?utf-8?B?dEZjaHY3ZlpaQXptd0wzdS9ST0E4WWxHT2I3Y3VmVXhRUXVjWlYyMExKTTJx?=
 =?utf-8?B?WE50Q3ZtWEpLYWpDYXg3UUsyOHJlVytPZlVwdXphdS81RVo5R2dhUUI3TGRQ?=
 =?utf-8?B?Q1dVdXgwWTNQK1c0QWhwbVYxdjJCM25jQTZTenp2S1B1T0dSVndIekcxQ1NH?=
 =?utf-8?B?U1h0eHI4Z242Z1Z5ZjJTcThvMS9KM095Q2prbjZXWmFzQUNuck9tWndmSVY1?=
 =?utf-8?B?QkJGY0FUMmJZY0MyT3gzMXp6V2k2eG5UMnB4cTI0amJ0YkRBMktCNDNRcGVP?=
 =?utf-8?B?OHdHVzFDeWt4a1pRZUNjZFd2Wld0WHhKZVN2Wjh3VjN5QnY4M3Q1R3lRd21y?=
 =?utf-8?B?NXJpMTZsRUlPeHI4V082MVRkZ29QTXhKRUpiQ21Bc2hrMjFrU2JCWktTR2Fl?=
 =?utf-8?B?SlFsSHlwZ3I2V05VQmxzaVBjaDBndzVmb1dNekR4aytORjRoc2FMOW9IWXZE?=
 =?utf-8?Q?o/pc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <256A2C7757B089499046157518BF557E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0367f957-dbfb-415e-f042-08ddb3d14e28
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 10:16:09.6756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PRiDQFAT5W1d6cLDwxmYcwCDuDeruVAfTS/2lbiSc5mVVL1EfXjIOu91XYQVxiI2CiULFmSqUtIISaxbvSQirA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9723

T24gMjAyNS82LzI1IDE4OjAzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjUuMDYuMjAyNSAx
MToyNywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzI1IDE2OjM2LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyNS4wNi4yMDI1IDA4OjUxLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8yNCAxODowOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAy
NC4wNi4yMDI1IDExOjI5LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNS82LzI0
IDE2OjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMjQuMDYuMjAyNSAxMDowMiwg
Q2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMjAyNS82LzIwIDE0OjM4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+Pj4+PiBPbiAxOS4wNi4yMDI1IDA4OjM5LCBDaGVuLCBKaXFpYW4g
d3JvdGU6DQo+Pj4+Pj4+Pj4+IE9uIDIwMjUvNi8xOCAyMjowNSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4+Pj4+PiBPbiAxMi4wNi4yMDI1IDExOjI5LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+
Pj4+Pj4+Pj4+PiBAQCAtMjksOSArMzAsMjIgQEAgdHlwZWRlZiBpbnQgdnBjaV9yZWdpc3Rlcl9p
bml0X3Qoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+Pj4+Pj4+Pj4+Pj4gICAqLw0KPj4+Pj4+Pj4+
Pj4+ICAjZGVmaW5lIFZQQ0lfTUFYX1ZJUlRfREVWICAgICAgIChQQ0lfU0xPVCh+MCkgKyAxKQ0K
Pj4+Pj4+Pj4+Pj4+ICANCj4+Pj4+Pj4+Pj4+PiAtI2RlZmluZSBSRUdJU1RFUl9WUENJX0lOSVQo
eCwgcCkgICAgICAgICAgICAgICAgXA0KPj4+Pj4+Pj4+Pj4+IC0gIHN0YXRpYyB2cGNpX3JlZ2lz
dGVyX2luaXRfdCAqY29uc3QgeCMjX2VudHJ5ICBcDQo+Pj4+Pj4+Pj4+Pj4gLSAgICAgICAgICAg
ICAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS52cGNpLiIgcCkgPSAoeCkNCj4+Pj4+Pj4+Pj4+PiAr
I2RlZmluZSBSRUdJU1RFUl9WUENJX0NBUEFCSUxJVFkoY2FwLCBmaW5pdCwgZmNsZWFuLCBleHQp
IFwNCj4+Pj4+Pj4+Pj4+PiArICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCBmaW5p
dCMjX3QgPSB7IFwNCj4+Pj4+Pj4+Pj4+PiArICAgICAgICAuaWQgPSAoY2FwKSwgXA0KPj4+Pj4+
Pj4+Pj4+ICsgICAgICAgIC5pbml0ID0gKGZpbml0KSwgXA0KPj4+Pj4+Pj4+Pj4+ICsgICAgICAg
IC5jbGVhbnVwID0gKGZjbGVhbiksIFwNCj4+Pj4+Pj4+Pj4+PiArICAgICAgICAuaXNfZXh0ID0g
KGV4dCksIFwNCj4+Pj4+Pj4+Pj4+PiArICAgIH07IFwNCj4+Pj4+Pj4+Pj4+PiArICAgIHN0YXRp
YyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCAqY29uc3QgZmluaXQjI19lbnRyeSAgXA0KPj4+Pj4+
Pj4+Pj4+ICsgICAgICAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS5yZWwucm8udnBjaSIpID0gJmZp
bml0IyNfdA0KPj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IENvdWxkIHlvdSByZW1pbmQgbWUgd2h5
IHRoZSBleHRyYSBsZXZlbCBvZiBpbmRpcmVjdGlvbiBpcyBuZWNlc3NhcnkgaGVyZT8NCj4+Pj4+
Pj4+Pj4+IFRoYXQgaXMsIHdoeSBjYW4ndCAuZGF0YS5yZWwucm8udnBjaSBiZSBhbiBhcnJheSBv
ZiB2cGNpX2NhcGFiaWxpdHlfdD8NCj4+Pj4+Pj4+Pj4gWW91IG1lYW4gSSBzaG91bGQgY2hhbmdl
IHRvIGJlOg0KPj4+Pj4+Pj4+PiAjZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfQ0FQQUJJTElUWShjYXAs
IGZpbml0LCBmY2xlYW4sIGV4dCkgXA0KPj4+Pj4+Pj4+PiAgICAgc3RhdGljIGNvbnN0IHZwY2lf
Y2FwYWJpbGl0eV90IGZpbml0IyNfdCBcDQo+Pj4+Pj4+Pj4+ICAgICAgICAgX191c2VkX3NlY3Rp
b24oIi5kYXRhLnJlbC5yby52cGNpIikgPSB7IFwNCj4+Pj4+Pj4+Pj4gICAgICAgICAuaWQgPSAo
Y2FwKSwgXA0KPj4+Pj4+Pj4+PiAgICAgICAgIC5pbml0ID0gKGZpbml0KSwgXA0KPj4+Pj4+Pj4+
PiAgICAgICAgIC5jbGVhbnVwID0gKGZjbGVhbiksIFwNCj4+Pj4+Pj4+Pj4gICAgICAgICAuaXNf
ZXh0ID0gKGV4dCksIFwNCj4+Pj4+Pj4+Pj4gICAgIH0NCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4g
UmlnaHQ/DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBZZXMsIHN1YmplY3QgdG8gdGhlIGVhcmxpZXIg
Y29tbWVudHMgb24gdGhlIGlkZW50aWZpZXIgY2hvaWNlLg0KPj4+Pj4+Pj4gR290IGl0Lg0KPj4+
Pj4+Pj4gT25lIG1vcmUgcXVlc3Rpb24sIGlmIGNoYW5nZSB0byBiZSB0aGF0LCB0aGVuIGhvdyBz
aG91bGQgSSBtb2RpZnkgdGhlIGRlZmluaXRpb24gb2YgVlBDSV9BUlJBWT8NCj4+Pj4+Pj4+IElz
IFBPSU5URVJfQUxJR04gc3RpbGwgcmlnaHQ/DQo+Pj4+Pj4+DQo+Pj4+Pj4+IFllcy4gVGhlIHN0
cnVjdCBkb2Vzbid0IHJlcXVpcmUgYmlnZ2VyIGFsaWdubWVudCBhZmFpY3MuIChJbiBmYWN0IGlu
IHByaW5jaXBsZQ0KPj4+Pj4+PiBubyBhbGlnbm1lbnQgc2hvdWxkIG5lZWQgc3BlY2lmeWluZyB0
aGVyZSwgZXhjZXB0IHRoYXQgdGhpcyB3b3VsZCByZXF1aXJlDQo+Pj4+Pj4+IGtlZXBpbmcgdGhl
IHNlY3Rpb24gc2VwYXJhdGUgaW4gdGhlIGZpbmFsIGltYWdlLiBXaGljaCBJIGRvbid0IHRoaW5r
IHdlIHdhbnQuKQ0KPj4+Pj4+Pg0KPj4+Pj4+Pj4gU2luY2UgSSBlbmNvdW50ZXJlZCBlcnJvcnMg
dGhhdCB0aGUgdmFsdWVzIG9mIF9fc3RhcnRfdnBjaV9hcnJheSBhcmUgbm90IHJpZ2h0IHdoZW4g
SSB1c2UgdGhlbSBpbiB2cGNpX2luaXRfY2FwYWJpbGl0aWVzKCkuDQo+Pj4+Pj4+DQo+Pj4+Pj4+
IERldGFpbHMgcGxlYXNlLg0KPj4+Pj4+IEFmdGVyIGNoYW5naW5nIF9fc3RhcnRfdnBjaV9hcnJh
eSB0byBiZSB2cGNpX2NhcGFiaWxpdHlfdCBhcnJheSwgY29kZXMgd2lsbCBiZSAobWF5YmUgSSBt
b2RpZmllZCB3cm9uZyBzb21ld2hlcmUpOg0KPj4+Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4+PiBp
bmRleCBjNTFiYmI4YWJiMTkuLjlmMmY0MzhiNGZkZCAxMDA2NDQNCj4+Pj4+PiAtLS0gYS94ZW4v
ZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5j
DQo+Pj4+Pj4gQEAgLTM2LDggKzM2LDggQEAgc3RydWN0IHZwY2lfcmVnaXN0ZXIgew0KPj4+Pj4+
ICB9Ow0KPj4+Pj4+DQo+Pj4+Pj4gICNpZmRlZiBfX1hFTl9fDQo+Pj4+Pj4gLWV4dGVybiBjb25z
dCB2cGNpX2NhcGFiaWxpdHlfdCAqY29uc3QgX19zdGFydF92cGNpX2FycmF5W107DQo+Pj4+Pj4g
LWV4dGVybiBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCAqY29uc3QgX19lbmRfdnBjaV9hcnJheVtd
Ow0KPj4+Pj4+ICtleHRlcm4gdnBjaV9jYXBhYmlsaXR5X3QgX19zdGFydF92cGNpX2FycmF5W107
DQo+Pj4+Pj4gK2V4dGVybiB2cGNpX2NhcGFiaWxpdHlfdCBfX2VuZF92cGNpX2FycmF5W107DQo+
Pj4+Pg0KPj4+Pj4gSnVzdCBmeWk6IFlvdSBsb3N0IGNvbnN0IGhlcmUuDQo+Pj4+Pg0KPj4+Pj4+
IEBAIC0yNTUsNyArMjU1LDcgQEAgc3RhdGljIGludCB2cGNpX2luaXRfY2FwYWJpbGl0aWVzKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+Pj4+ICB7DQo+Pj4+Pj4gICAgICBmb3IgKCB1bnNpZ25l
ZCBpbnQgaSA9IDA7IGkgPCBOVU1fVlBDSV9JTklUOyBpKysgKQ0KPj4+Pj4+ICAgICAgew0KPj4+
Pj4+IC0gICAgICAgIGNvbnN0IHZwY2lfY2FwYWJpbGl0eV90ICpjYXBhYmlsaXR5ID0gX19zdGFy
dF92cGNpX2FycmF5W2ldOw0KPj4+Pj4+ICsgICAgICAgIGNvbnN0IHZwY2lfY2FwYWJpbGl0eV90
ICpjYXBhYmlsaXR5ID0gJl9fc3RhcnRfdnBjaV9hcnJheVtpXTsNCj4+Pj4+PiAgICAgICAgICBj
b25zdCB1bnNpZ25lZCBpbnQgY2FwID0gY2FwYWJpbGl0eS0+aWQ7DQo+Pj4+Pj4gICAgICAgICAg
Y29uc3QgYm9vbCBpc19leHQgPSBjYXBhYmlsaXR5LT5pc19leHQ7DQo+Pj4+Pj4gICAgICAgICAg
aW50IHJjOw0KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oIGIveGVu
L2luY2x1ZGUveGVuL3ZwY2kuaA0KPj4+Pj4+IGluZGV4IGY0ZWMxYzI1OTIyZC4uNzc3NTBkZDQx
MzFhIDEwMDY0NA0KPj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+Pj4+PiAr
KysgYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+Pj4+Pj4gQEAgLTMxLDE0ICszMSwxMyBAQCB0
eXBlZGVmIHN0cnVjdCB7DQo+Pj4+Pj4gICNkZWZpbmUgVlBDSV9NQVhfVklSVF9ERVYgICAgICAg
KFBDSV9TTE9UKH4wKSArIDEpDQo+Pj4+Pj4NCj4+Pj4+PiAgI2RlZmluZSBSRUdJU1RFUl9WUENJ
X0NBUEFCSUxJVFkoY2FwLCBmaW5pdCwgZmNsZWFuLCBleHQpIFwNCj4+Pj4+PiAtICAgIHN0YXRp
YyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCBmaW5pdCMjX3QgPSB7IFwNCj4+Pj4+PiArICAgIHN0
YXRpYyB2cGNpX2NhcGFiaWxpdHlfdCBmaW5pdCMjX2VudHJ5IFwNCj4+Pj4+PiArICAgICAgICBf
X3VzZWRfc2VjdGlvbigiLmRhdGEucmVsLnJvLnZwY2kiKSA9IHsgXA0KPj4+Pj4+ICAgICAgICAg
IC5pZCA9IChjYXApLCBcDQo+Pj4+Pj4gICAgICAgICAgLmluaXQgPSAoZmluaXQpLCBcDQo+Pj4+
Pj4gICAgICAgICAgLmNsZWFudXAgPSAoZmNsZWFuKSwgXA0KPj4+Pj4+ICAgICAgICAgIC5pc19l
eHQgPSAoZXh0KSwgXA0KPj4+Pj4+IC0gICAgfTsgXA0KPj4+Pj4+IC0gICAgc3RhdGljIGNvbnN0
IHZwY2lfY2FwYWJpbGl0eV90ICpjb25zdCBmaW5pdCMjX2VudHJ5ICBcDQo+Pj4+Pj4gLSAgICAg
ICAgX191c2VkX3NlY3Rpb24oIi5kYXRhLnJlbC5yby52cGNpIikgPSAmZmluaXQjI190DQo+Pj4+
Pj4gKyAgICB9DQo+Pj4+Pj4NCj4+Pj4+PiAgI2RlZmluZSBSRUdJU1RFUl9WUENJX0NBUChjYXAs
IGZpbml0LCBmY2xlYW4pIFwNCj4+Pj4+PiAgICAgIFJFR0lTVEVSX1ZQQ0lfQ0FQQUJJTElUWShj
YXAsIGZpbml0LCBmY2xlYW4sIGZhbHNlKQ0KPj4+Pj4+DQo+Pj4+Pj4gSSBwcmludCB0aGUgdmFs
dWUgb2YgTlVNX1ZQQ0lfSU5JVCwgaXQgaXMgYSBzdHJhbmdlIG51bWJlciAoNjE0ODkxNDY5MTIz
NjUxNzIwOSkuDQo+Pj4+Pg0KPj4+Pj4gV2hhdCBhcmUgdGhlIGFkZHJlc3NlcyBvZiB0aGUgdHdv
IHN5bWJvbHMgX19zdGFydF92cGNpX2FycmF5IGFuZCBfX2VuZF92cGNpX2FycmF5Pw0KPj4+PiBf
X2VuZF92cGNpX2FycmF5IGlzIDB4ZmZmZjgyZDA0MDQyNTFiOA0KPj4+PiBfX3N0YXJ0X3ZwY2lf
YXJyYXkgaXMgMHhmZmZmODJkMDQwNDI1MTYwDQo+Pj4+IE5VTV9WUENJX0lOSVQgaXMgMHg1NTU1
NTU1NTU1NTU1NTU5DQo+Pj4+IHNpemVvZih2cGNpX2NhcGFiaWxpdHlfdCkgaXMgMHgxOA0KPj4+
DQo+Pj4gT2gsIG9mIGNvdXJzZSAtIHRoZXJlJ3MgYSBwc0FCSSBwZWN1bGlhcml0eSB0aGF0IHlv
dSBydW4gaW50byBoZXJlOiBBZ2dyZWdhdGVzDQo+Pj4gbGFyZ2VyIHRoYW4gOCBieXRlcyBhcmUg
cmVxdWlyZWQgdG8gaGF2ZSAxNi1ieXRlIGFsaWdubWVudC4gSGVuY2Ugd2hpbGUNCj4+PiBzaXpl
b2YoKSA9PSAweDE4IGFuZCBfX2FsaWdub2YoKSA9PSA4LCB0aGUgc2VjdGlvbiBjb250cmlidXRp
b25zIHN0aWxsIGFyZQ0KPj4+IGFjY29tcGFuaWVkIGJ5ICIuYWxpZ24gMTYiLCBhbmQgdGh1cyBy
ZXNwZWN0aXZlIHBhZGRpbmcgaXMgaW5zZXJ0ZWQgYnkNCj4+PiBhc3NlbWJsZXIgYW5kIGxpbmtl
ci4gSU9XIHlvdSBlbmQgdXAgd2l0aCB0d28gMzItYnl0ZSBlbnRyaWVzIGFuZCBhIHRyYWlsaW5n
DQo+Pj4gMjQtYnl0ZSBvbmUuIFRoZSBlYXNpZXN0IChhbmQgbGVhc3QgcHJvYmxlbWF0aWMgZ29p
bmcgZm9yd2FyZCkgYXBwcm9hY2ggdG8NCj4+PiBkZWFsIHdpdGggdGhhdCBpcyBwcm9iYWJseSBn
b2luZyB0byBiZSB0byBhZGQgX19hbGlnbmVkKDE2KSB0byB0aGUgc3RydWN0DQo+Pj4gZGVjbC4g
KFdoZXRoZXIgdG8gbGltaXQgdGhpcyB0byBqdXN0IHg4NiBJJ20gbm90IHN1cmU6IFdoaWxlIG90
aGVyIHBzQUJJLXMgbWF5DQo+Pj4gYmUgZGlmZmVyZW50IGluIHRoaXMgcmVnYXJkLCB3ZSBtYXkg
d2FudCB0byBiZSBvbiB0aGUgc2FmZSBzaWRlLikNCj4+IFRoYW5rcyBmb3IgeW91IGRldGFpbGVk
IGV4cGxhbmF0aW9uLg0KPj4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgSSBuZWVkIHRvIGNo
YW5nZSB0aGUgZGVmaW5pdGlvbiBvZiB2cGNpX2NhcGFiaWxpdHlfdCB0byBiZToNCj4+DQo+PiB0
eXBlZGVmIHN0cnVjdCB7DQo+PiAgICAgdW5zaWduZWQgaW50IGlkOw0KPj4gICAgIGJvb2wgaXNf
ZXh0Ow0KPj4gICAgIGludCAoKiBpbml0KShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+
PiAgICAgaW50ICgqIGNsZWFudXApKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+IH0N
Cj4+ICNpZmRlZiBDT05GSUdfWDg2DQo+PiBfX2FsaWduZWQoMTYpDQo+PiAjZW5kaWYNCj4+IHZw
Y2lfY2FwYWJpbGl0eV90Ow0KPiANCj4gWW91J2xsIG5lZWQgdG8gY2hlY2sgd2hldGhlciB0aGlz
IGhhcyB0aGUgaW50ZW5kZWQgZWZmZWN0LiBUaGVyZSBhcmUgeWV0IG1vcmUNCj4gcGVjdWxpYXJp
dGllcyB3aGVuIGl0IGNvbWVzIHRvIGF0dHJpYnV0ZXMgb24gc3RydWN0cywgdHlwZWRlZnMsIGFu
ZCB0aGUNCj4gY29tYmluYXRpb24gb2YgdGhlIHR3by4gSSB3b25kZXIgdGhvdWdoOiBEbyB3ZSBy
ZWFsbHkgbmVlZCBhIHR5cGVkZWYgaGVyZT8NCj4gR29pbmcgd2l0aCBqdXN0IHN0cnVjdCB2Y3Bp
X2NhcGFiaWxpdHkgd291bGQgZWxpbWluYXRlIGNvbmNlcm5zIG92ZXIgdGhvc2UNCj4gcGVjdWxp
YXJpdGllcy4NClllcywgb24geDg2IHRoaXMgd29ya3Mgbm93Lg0KQXMgZm9yIHRoZSB0eXBlZGVm
LCB0aGF0J3MgZmluZSBmb3IgbWUgdG8ganVzdCB1c2Ugc3RydWN0IHZwY2lfY2FwYWJpbGl0eS4N
Cg0KPiANCj4gQWxzbywgYXMgc2FpZCAtIHlvdSB3aWxsIG5lZWQgdG8gY2hlY2sgd2hldGhlciBv
dGhlciBhcmNoaXRlY3R1cmVzIGFyZQ0KPiBkaWZmZXJlbnQgZnJvbSB4ODYtNjQgaW4gdGhpcyBy
ZWdhcmQuIFdlIGJldHRlciB3b3VsZG4ndCBsZWF2ZSBhIHRyYXAgaGVyZSwNCj4gZm9yIHRoZW0g
dG8gZmFsbCBpbnRvIHdoZW4gdGhleSBlbmFibGUgdlBDSSBzdXBwb3J0LiBJLmUuIG15IHJlY29t
bWVuZGF0aW9uDQo+IHdvdWxkIGJlIHRoYXQgaWYgaW4gZG91YnQsIHdlIHB1dCB0aGUgX19hbGln
bmVkKCkgdGhlcmUgdW5jb25kaXRpb25hbGx5Lg0KVGhhdCdzIGRpZmZpY3VsdCBmb3IgbWUgdG8g
Y2hlY2sgb24gYWxsIGRpZmZlcmVudCBwbGF0Zm9ybXMgc2luY2UgSSBkb24ndCBoYXZlIHRoZW0g
YWxsLg0KU28geW91IG1lYW4gSSBzaG91bGQgcmVtb3ZlICIjaWZkZWYgQ09ORklHX1g4NiI/IEp1
c3QgbGV0IF9fYWxpZ25lZCgxNikgZm9yIGFsbCBwbGF0Zm9ybXM/DQoNCj4gDQo+IEphbg0KDQot
LSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

