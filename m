Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5374AE60D7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 11:30:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023470.1399446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzyh-0002Vh-Rf; Tue, 24 Jun 2025 09:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023470.1399446; Tue, 24 Jun 2025 09:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTzyh-0002UF-Oh; Tue, 24 Jun 2025 09:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1023470;
 Tue, 24 Jun 2025 09:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vj6t=ZH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uTzyg-0002Od-FC
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 09:30:06 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2408::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccd589f4-50dd-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 11:30:01 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH0PR12MB8151.namprd12.prod.outlook.com (2603:10b6:510:299::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 09:29:55 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 09:29:54 +0000
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
X-Inumbo-ID: ccd589f4-50dd-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reeW1U3OgHgPw+ZVaRvalU2JNm7tf7N/b6d7jQys6Jac4iOXnzyfxL21MwE3JQ2YPptWlWXIhdwyQrVPsXEjgKrrieTz0nyt9NhKLVjWQywGT3xaaM4tO1EHb6Mm6hvoZThHeaR/Z2mft4UWMqITCwFfcYH3ONNutFmx1u8mAbkIOVl+WP47OFXrdg53THHutI56vbHr0jlDZnvtXFrOzuXx1evN1IVcMaZfzdXczcib4xZfgDfrZqtV6qyKJMxMQg1I/6ANGF2AliJOYcGpAB4O9zBkFcePxy/sfcSSofkPj/vs5G0YwG15nJrVWKoZXhnEBcFUnMaugqaA+HPlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OSqX8TPdt+TwcOTXS9Rjh7LbVBuChZINYEOQvnZ0ag=;
 b=seaRE2srG21BAI3gFKKRoBSzapTBDO7vgqkK4j5UINxSlgbd8reDWfHN41GuopOOY5JF/wdAaF5oJX/+YBpUA8amZri9tC5D7zzG7kaeghcTXLitcd28HsJa3eF69+xcAkW/dpwTcg5vAaAf6RtkTlnbBWrdo4i5zO7WQVE/oy34wDwT2xXwc0su3Z3NTkLjJWWe4tITVktNCiAUkiOrsfMJiLX/HYZ/BliIpEE1pascvlLft9Qj1n967whS5wj+Busjm8ED2usb7c9RUe+paWAnDr3Vx9QY0NCS9OE2WnXhpFhR5PEmaVp6g8ZQX+3W5+z2dgRIg8ASmW7SGiYYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OSqX8TPdt+TwcOTXS9Rjh7LbVBuChZINYEOQvnZ0ag=;
 b=vKq0RBBWIq3uro61dBNzINSU6flfWtRKv0N/e0vIwkiMIXHAC5KR61juiofMgnYUXR1Qx98BR7U9GfZR56gIp2nTYKBwyEBtON2tFsRBlQzB2jUCOneWqx8bIJ1+gCFsTNy3P4upSXMw6CYJfOV90fIhQJLydaw2W/wRI3zE9Xg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QI/QAAgAGa9QCAAQzVgIAG5D6A//99hgCAAJwoAA==
Date: Tue, 24 Jun 2025 09:29:54 +0000
Message-ID:
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
In-Reply-To: <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH0PR12MB8151:EE_
x-ms-office365-filtering-correlation-id: a906a839-ea94-4312-2e72-08ddb301adb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dVlvRDk0dENqSzMxUWdOaFZjR3RIQ2hFcTZyM1JsTldrRXR0b3A2RlNpL2Ju?=
 =?utf-8?B?MVVsbUtUS1c4dUQ1L2VPL1BhdE90dFlGUVc0ZUtlS3RSbUFCeTJxdktHakRJ?=
 =?utf-8?B?UGxVQ09qUzN1aW0xNXZyRHgvTkFhWU9saXZ5UXJYc2EwSEZLRkk4Qmh1YWJE?=
 =?utf-8?B?bWxIYXl6THRocHZDVzNKN2luM2VtRzNVUm1xNnIrcEtXQjFwZzBkdnFyYVh4?=
 =?utf-8?B?bFR0Vkx6ZlJBNkF6MzJ0d1ErUUJXYy95L0tUK3BIRXhzTnc0UGF5emlkckpt?=
 =?utf-8?B?MzVUNThGREZ3dCtLNGxDL1RtWlVvTEh2Z3FJUmd6akVBSU9qdXJpbXo2dmU0?=
 =?utf-8?B?cnNtS0U3bFE3SEJEQkp3QlV4ZitiNnJBeGFURUU2Rm5VaU9zWDJPb0lTNk5q?=
 =?utf-8?B?RTBDVW9XVHV4aThXM1YraWd1OGltQ1lXMUUrS2ZFbm9yOCtEMVo2ekkrQVd5?=
 =?utf-8?B?ZkY4VUdtcEhDWGRyWEFudGJxMzlsYk5GQXliYXBpOFRsOFhRMGc0cnVBb3ZC?=
 =?utf-8?B?QU41WWdrbmRoeW9XRGUyM3hNU0xTTGtuZm0xdGFENnJQR0ZkcHkvYmlpMW5T?=
 =?utf-8?B?SElwZlZVTTN3MDJIczFpKy9CT1NjRDhqNjBMT05UVlU0VVFlbGtHcWlPQmxR?=
 =?utf-8?B?eHZsa2VEZUJTSG5sK0VETEdrSkdNbTI1M3JsMzkzK0FpR0VZVm5OOFNjTjlE?=
 =?utf-8?B?QTM2MGgzZk1Pbm1TQXNwMUhTTEN4azMrOG9YbTVHa3FuSk9GUlhSK2k5NHR0?=
 =?utf-8?B?NnkrNHh6QkNUUWg0UGdydmRNc2o2disyaEwvUm5yZFNaQVVzbDNxMERaZndB?=
 =?utf-8?B?QnE5aXJTRGxVd2tQZTBFWnVpM0ljak4vbTB1ZGQ5TUlnc0wzc1R0cStTaHFa?=
 =?utf-8?B?TGorNlVBak82QnpLZ3BtQ3o0L096ejJ5NlRtb3ZFUlQ1QnZza3l5ZUJJWHJi?=
 =?utf-8?B?SnFxeE1hbE84eVlKRkt2T0tNNXRMN1lwWWdGRGJEUUxTNk8xNTJlS0U2REJ1?=
 =?utf-8?B?K1NJSy92UC90ZEoxaU1yTDhkWDZadjh0Nk9pNGNrMC93Q2gvY01WRUFFQjRn?=
 =?utf-8?B?d012dHN6ejBoNUlyOXI2NnhaQU1uamwxR1BTWklBRDRZQnhacWt5QnRhUzd0?=
 =?utf-8?B?bTNjMGo0ekxNdFdXRk9PZGJHTnZXRWVmNHFjR2g1SkNiUDJBOTJKR1dtRUxU?=
 =?utf-8?B?cjVXZFM0aDJTZ2Z5V0xaWEhmOUtMS2l6NU9kYlZFcWdyRUd0d2JTV0FiQjFK?=
 =?utf-8?B?Z0R1NWNoUU5QTk12WnBtV21iWU56elRiWlRmNk50djROZGFzZUZObkFCV3Fn?=
 =?utf-8?B?TUhtOE9UTVE4bXhRWjNWaExzZTl2RjViUzFYTmFlQy9YeVJJN2VRdUZTUi9j?=
 =?utf-8?B?VUNtWUZQM3YvTHFUK0xkQkpUd1ZkUTlIbVFDYy9JS3ZiN3B2Qmw1b0s3UEFD?=
 =?utf-8?B?V1dEZ0VoTHc3aGdCVEoxalZaR0hOQVNUeGI1VTFBZG9ZUDVLanoxNGJoRUU5?=
 =?utf-8?B?RVVRWXArKzlLNHFiL0JObTRvUERnSUlKdGMwaGNoeEdhbW8ybmlScTJ1em5C?=
 =?utf-8?B?bVVta3lYRCtlQlV3SW8xSjlHTXcwcS9NY0llR2RMY25lS3Eyd25qbTRJQVVs?=
 =?utf-8?B?QWRRQUlwV0prbkFWWmpQckp6ZHNiSHhCb1NQUzRjVVRHY2FDTG53RklCYnVk?=
 =?utf-8?B?L2dONWhRalF3Nzh5cXFQZkcwMlJzNlgwREV1NVY5NDRyd0VUUEpTL1A3d2xr?=
 =?utf-8?B?NCthL1RLMzhRSnI2djdaUkV2TitwOWdNWlBYU25NcENrV1JabFhEZytHcHNM?=
 =?utf-8?B?dkkvMnlnVmFWN2ZJeU5KNkthRjVOTUpEN1R2VkpYSm9KYXBtVWhwUGFheDNv?=
 =?utf-8?B?bXMvalFqay91cE05SVU5bmlYelB6aEdTZG00SjZmMFE3Y1JDMVE2THplbXdw?=
 =?utf-8?B?MWl1RlVzZ2ZhV3RYKzExQ3hwVWV2dkYwek4zNE9sRXg3TEoxRlpEMi81Z2Rp?=
 =?utf-8?Q?MDs+sxCISLZsuy9p8wOnIHX8hBj6u4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SldROXlzTTEvYzVMY3AwQkt2WDU4L2NtRFJ2d2poaXByazFRb2pRTEFrVjBR?=
 =?utf-8?B?SUZrZHhoTG5YdHRwQ25rTDlEVFFMZURwbHZVZk85S0tuQTJPcGYyU2tSVnlo?=
 =?utf-8?B?TmIzTW5EWUdIRENEbVNkZXVRWlVOSjRtd2d2bEhMbmxyUUdJMVhtcFRRcnd0?=
 =?utf-8?B?anZaRU5xa3J0TllGNmFNZnMrWUc4bS9yKzNva0I1bnoyZTRhUno2NHlwSTV0?=
 =?utf-8?B?WmtLVUo4YlEvN1NzN25oSDZIdi9pcWpVUEUvOEJmdlk5RlZHeG5GbG12dndC?=
 =?utf-8?B?ZVNBM3dFUjkzNlRHcmdaak1KWEpuVUNoVS9YR1JXVmM4VmJ5bFkwUStMdXNl?=
 =?utf-8?B?UUZMaTAwb2JMeWE1Q2dldDhBMGhuby9YbVhFeWN2MGcwL0RiWUkzRkhENWFV?=
 =?utf-8?B?TU0rWlRscFVWSkprL0N3MlFORzlSbjJnRWM2K3BZaXloMkF6VTYzWUF5M2Fi?=
 =?utf-8?B?eWtGZHRMZlhKeDltM0RITE5nbjJrOVZXSFZvYjRaM3Ruc2JvdVV0L2FmV0hp?=
 =?utf-8?B?Ui9jVEhWNnFzTlNlRUx2K2NlaEhOaEtOWTBpR1pvVDlDemlYVExSVmdOblBr?=
 =?utf-8?B?NzVqRWMvN1h4c0gzY0s4VU9XanR5NVpMclVIY1dFL3h1aExKOVM2dlpiaVBZ?=
 =?utf-8?B?TWd1bUFqK20rbzIwdHZwdlpISUJUM0hrdlFUUERDSy9pNTBEMWwySGl0MXhE?=
 =?utf-8?B?VjIydHdEMUlmbGlpTnRudm54RWFQcHBSUGpEcnZlTk9CcXdFZ0lvWm8ycWFE?=
 =?utf-8?B?a3htaXZwbzBtVVl6TzcrRjdxT3VRa1J3Tzl0ekFxVVl2OWhKc2pud3lvZFRF?=
 =?utf-8?B?MWczb0xIb2hBa3ZORmxLSjNobTAzZFZmekFhWTJMYVlvWGRkeVNsVFdCN0xG?=
 =?utf-8?B?SVRFMHBDbUYyWGtuaDJEM21GdXNxYkpYYTJESys2NXk0M08wNlFaVGttcmJQ?=
 =?utf-8?B?LzVCcFg5N21hNDVaZHh4TkYrYjgzWWlaQnA0eVd6MlhtV2prUDZUbTNFSXBT?=
 =?utf-8?B?ZEttSnBXVGVRbVhVcHNiTmcxYzBJQkpWWTkzZk1vMkIxMmdKcmYxSmtueFVL?=
 =?utf-8?B?Vm9PSU8vNnRKaXpMbjlZTmdTM3QvNzFpaXdIampHcU5ZdWZQQ01YQjQ1djBk?=
 =?utf-8?B?K0JvZi9INmRudUhTTkpjT3Yxdk51Z05wa0RZZjUyd042bG8vaHlEaVhub3Vn?=
 =?utf-8?B?VUI0Q1FZRnBhMTdrcXRjZ2RTUzlYTVNoSEYwelNrWmUvbVQrdUN3cU5UT29D?=
 =?utf-8?B?UFdNOE53b24raG9VbDdmaWJ1Sk1uOU5tZUcyL2FxOE9jVzlSNy93d3lPYWdw?=
 =?utf-8?B?c3RRVFRwTElZMjFGLzRPK0Y4MzdFR0Y5Vmdmb3A5aEIrb3hnZE5tL055WFBx?=
 =?utf-8?B?NlFseUg0WldXNndvTHhEeDFPcm5IU0hBRm96Qy9QckttYzFUZ3NtQVhveE9O?=
 =?utf-8?B?bE1rZkNGQ0NnbHpSZGRwVlF3dGw1R1lOekNDYUZaNGtXcUNGNDFwajIvTVIz?=
 =?utf-8?B?Nk5CQXNSQ2JkMU1aZE02Q2hqWW9NcGF0VG14RlZvdE5rSDVXUCt4MUc4VlRJ?=
 =?utf-8?B?TEVWTDB1ZisxbllZWXljRDg0ay9hbVVDakJvMzVYREE5b3hVaVkzTWZZVkFE?=
 =?utf-8?B?Ry9KUUtnc2pnTkg1TE1MYktsSHg3VmtjMnBtRm43Z2M2eXlxL1VER0ZGZGZp?=
 =?utf-8?B?cWdvbmtVSjJjZEhHbVh3cE9NMm5VOW4rUC9UZHBOTVNUZXBZamlMSG9LUllI?=
 =?utf-8?B?WFh2TUxMSUtyS3RpV3hvRmdLUTVPVk91alI1MjJyMDBUa2M3S1ozWmc0OURo?=
 =?utf-8?B?MXMrYzRDaCsxWTlGZW1pQWNYbVpXcjVibjhQYW9uWGhYVWVzVjA0L0JHOUpW?=
 =?utf-8?B?bTFnKzFKei9abTdpcG9DTVR0V3kyZTJDeUYyalZua0pjNnhqQlRxZkRqYkJS?=
 =?utf-8?B?aDY5TFc0MUEvVXhGaVE4d0wyQ3RxNHk4aW9jcm1sRnl2ODhjdUxibzdiSTd0?=
 =?utf-8?B?VkpzVTdRTUI4WHZTcmNHanVBdVNEN3cxK2N1UVZEaWVEQVNqZHVwTjcweS9Q?=
 =?utf-8?B?OTZwejVaNWZqU0l3NUQ2ZlJpUk52RjdGQkZhVmFIVEJMWmpFM09NYyt0TTI4?=
 =?utf-8?Q?HMX8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61E853331BECFF4FB42AB6E5030E5219@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a906a839-ea94-4312-2e72-08ddb301adb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 09:29:54.6880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WbjKV0LF9FM9fDTGB49oodpatObz+WycY5gbSYeNEyCSvaIAkI0BVLV959P4uwvbUyySnxwJqfBn3bnxHj60DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8151

T24gMjAyNS82LzI0IDE2OjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjQuMDYuMjAyNSAx
MDowMiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzIwIDE0OjM4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxOS4wNi4yMDI1IDA4OjM5LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8xOCAyMjowNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
Mi4wNi4yMDI1IDExOjI5LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4vZHJp
dmVycy92cGNpL21zaXguYw0KPj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jDQo+
Pj4+Pj4gQEAgLTcwMyw5ICs3MDMsMTMgQEAgc3RhdGljIGludCBjZl9jaGVjayBpbml0X21zaXgo
c3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+Pj4gICAgICBwZGV2LT52cGNpLT5tc2l4ID0gbXNp
eDsNCj4+Pj4+PiAgICAgIGxpc3RfYWRkKCZtc2l4LT5uZXh0LCAmZC0+YXJjaC5odm0ubXNpeF90
YWJsZXMpOw0KPj4+Pj4+ICANCj4+Pj4+PiAtICAgIHJldHVybiAwOw0KPj4+Pj4+ICsgICAgc3Bp
bl9sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+Pj4+PiArICAgIHJjID0gdnBjaV9tYWtlX21z
aXhfaG9sZShwZGV2KTsNCj4+Pj4+PiArICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2Nr
KTsNCj4+Pj4+DQo+Pj4+PiBJZiB5b3UgYWRkIGEgY2FsbCB0byB2cGNpX21ha2VfbXNpeF9ob2xl
KCkgaGVyZSwgZG9lc24ndCBpdCBuZWVkIChvciBhdA0KPj4+Pj4gbGVhc3Qgd2FudCkgcmVtb3Zp
bmcgc29tZXdoZXJlIGVsc2U/IE90aGVyd2lzZSBtYXliZSBhIGNvZGUgY29tbWVudCBpcw0KPj4+
Pj4gd2FycmFudGVkIG5leHQgdG8gdGhlIG5ldyBjYWxsIHNpdGU/DQo+PiBTb3JyeSwgSSBtaXN1
bmRlcnN0b29kIHlvdSBpbiBteSBsYXN0IGVtYWlsLg0KPj4gQWZ0ZXIgaGVyZSdzIGNoYW5nZSwg
aXQgc2VlbXMgdGhlIGNhbGwgaW4gbW9kaWZ5X2RlY29kaW5nKCkgaXMgcmVkdW5kYW50Lg0KPj4g
V2hhdCdzIHlvdXIgdGFzdGU/IFJlbW92aW5nIHRoZSBjYWxsIGluIG1vZGlmeV9kZWNvZGluZygp
IG9yIGFkZGluZyBhIGNvZGUgY29tbWVudD8NCj4gDQo+IEknZCBwcmVmZXIgdGhlIG90aGVyIGNh
bGwgdG8gYmUgZHJvcHBlZCBpZiBpdCdzIHByb3ZhYmx5IHJlZHVuZGFudC4gQnV0IFJvZ2VyDQo+
IGhhcyB0aGUgZmluYWwgc2F5IGhlcmUgYW55d2F5Lg0KT0ssIGxldCdzIHdhaXQgUm9nZXIncyBp
bnB1dC4NCg0KPiANCj4+Pj4gVGhlIHJlbW92aW5nIG9wZXJhdGlvbiBpbiBtb2RpZnlfYmFycygp
IGFuZCB2cGNpX2RlYXNzaWduX2RldmljZSgpIGlzIG5vdCBlbm91Z2g/DQo+Pj4NCj4+PiBJIGZl
YXIgSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcmVwbHkgb2YgeW91cnMuIFdoaWNoIHN1Z2dlc3Rz
IHRoYXQgdGhlIHBhdGNoDQo+Pj4gZGVzY3JpcHRpb24gbWF5IHdhbnQgZXh0ZW5kaW5nIGFzIHRv
IHRoaXMgcGFydCBvZiB0aGUgY2hhbmdlLg0KPj4+DQo+Pj4+Pj4gQEAgLTI5LDkgKzMwLDIyIEBA
IHR5cGVkZWYgaW50IHZwY2lfcmVnaXN0ZXJfaW5pdF90KHN0cnVjdCBwY2lfZGV2ICpkZXYpOw0K
Pj4+Pj4+ICAgKi8NCj4+Pj4+PiAgI2RlZmluZSBWUENJX01BWF9WSVJUX0RFViAgICAgICAoUENJ
X1NMT1QofjApICsgMSkNCj4+Pj4+PiAgDQo+Pj4+Pj4gLSNkZWZpbmUgUkVHSVNURVJfVlBDSV9J
TklUKHgsIHApICAgICAgICAgICAgICAgIFwNCj4+Pj4+PiAtICBzdGF0aWMgdnBjaV9yZWdpc3Rl
cl9pbml0X3QgKmNvbnN0IHgjI19lbnRyeSAgXA0KPj4+Pj4+IC0gICAgICAgICAgICAgICBfX3Vz
ZWRfc2VjdGlvbigiLmRhdGEudnBjaS4iIHApID0gKHgpDQo+Pj4+Pj4gKyNkZWZpbmUgUkVHSVNU
RVJfVlBDSV9DQVBBQklMSVRZKGNhcCwgZmluaXQsIGZjbGVhbiwgZXh0KSBcDQo+Pj4+Pj4gKyAg
ICBzdGF0aWMgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgZmluaXQjI190ID0geyBcDQo+Pj4+Pj4g
KyAgICAgICAgLmlkID0gKGNhcCksIFwNCj4+Pj4+PiArICAgICAgICAuaW5pdCA9IChmaW5pdCks
IFwNCj4+Pj4+PiArICAgICAgICAuY2xlYW51cCA9IChmY2xlYW4pLCBcDQo+Pj4+Pj4gKyAgICAg
ICAgLmlzX2V4dCA9IChleHQpLCBcDQo+Pj4+Pj4gKyAgICB9OyBcDQo+Pj4+Pj4gKyAgICBzdGF0
aWMgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgKmNvbnN0IGZpbml0IyNfZW50cnkgIFwNCj4+Pj4+
PiArICAgICAgICBfX3VzZWRfc2VjdGlvbigiLmRhdGEucmVsLnJvLnZwY2kiKSA9ICZmaW5pdCMj
X3QNCj4+Pj4+DQo+Pj4+PiBDb3VsZCB5b3UgcmVtaW5kIG1lIHdoeSB0aGUgZXh0cmEgbGV2ZWwg
b2YgaW5kaXJlY3Rpb24gaXMgbmVjZXNzYXJ5IGhlcmU/DQo+Pj4+PiBUaGF0IGlzLCB3aHkgY2Fu
J3QgLmRhdGEucmVsLnJvLnZwY2kgYmUgYW4gYXJyYXkgb2YgdnBjaV9jYXBhYmlsaXR5X3Q/DQo+
Pj4+IFlvdSBtZWFuIEkgc2hvdWxkIGNoYW5nZSB0byBiZToNCj4+Pj4gI2RlZmluZSBSRUdJU1RF
Ul9WUENJX0NBUEFCSUxJVFkoY2FwLCBmaW5pdCwgZmNsZWFuLCBleHQpIFwNCj4+Pj4gICAgIHN0
YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCBmaW5pdCMjX3QgXA0KPj4+PiAgICAgICAgIF9f
dXNlZF9zZWN0aW9uKCIuZGF0YS5yZWwucm8udnBjaSIpID0geyBcDQo+Pj4+ICAgICAgICAgLmlk
ID0gKGNhcCksIFwNCj4+Pj4gICAgICAgICAuaW5pdCA9IChmaW5pdCksIFwNCj4+Pj4gICAgICAg
ICAuY2xlYW51cCA9IChmY2xlYW4pLCBcDQo+Pj4+ICAgICAgICAgLmlzX2V4dCA9IChleHQpLCBc
DQo+Pj4+ICAgICB9DQo+Pj4+DQo+Pj4+IFJpZ2h0Pw0KPj4+DQo+Pj4gWWVzLCBzdWJqZWN0IHRv
IHRoZSBlYXJsaWVyIGNvbW1lbnRzIG9uIHRoZSBpZGVudGlmaWVyIGNob2ljZS4NCj4+IEdvdCBp
dC4NCj4+IE9uZSBtb3JlIHF1ZXN0aW9uLCBpZiBjaGFuZ2UgdG8gYmUgdGhhdCwgdGhlbiBob3cg
c2hvdWxkIEkgbW9kaWZ5IHRoZSBkZWZpbml0aW9uIG9mIFZQQ0lfQVJSQVk/DQo+PiBJcyBQT0lO
VEVSX0FMSUdOIHN0aWxsIHJpZ2h0Pw0KPiANCj4gWWVzLiBUaGUgc3RydWN0IGRvZXNuJ3QgcmVx
dWlyZSBiaWdnZXIgYWxpZ25tZW50IGFmYWljcy4gKEluIGZhY3QgaW4gcHJpbmNpcGxlDQo+IG5v
IGFsaWdubWVudCBzaG91bGQgbmVlZCBzcGVjaWZ5aW5nIHRoZXJlLCBleGNlcHQgdGhhdCB0aGlz
IHdvdWxkIHJlcXVpcmUNCj4ga2VlcGluZyB0aGUgc2VjdGlvbiBzZXBhcmF0ZSBpbiB0aGUgZmlu
YWwgaW1hZ2UuIFdoaWNoIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudC4pDQo+IA0KPj4gU2luY2UgSSBl
bmNvdW50ZXJlZCBlcnJvcnMgdGhhdCB0aGUgdmFsdWVzIG9mIF9fc3RhcnRfdnBjaV9hcnJheSBh
cmUgbm90IHJpZ2h0IHdoZW4gSSB1c2UgdGhlbSBpbiB2cGNpX2luaXRfY2FwYWJpbGl0aWVzKCku
DQo+IA0KPiBEZXRhaWxzIHBsZWFzZS4NCkFmdGVyIGNoYW5naW5nIF9fc3RhcnRfdnBjaV9hcnJh
eSB0byBiZSB2cGNpX2NhcGFiaWxpdHlfdCBhcnJheSwgY29kZXMgd2lsbCBiZSAobWF5YmUgSSBt
b2RpZmllZCB3cm9uZyBzb21ld2hlcmUpOg0KDQpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KaW5kZXggYzUxYmJiOGFiYjE5Li45
ZjJmNDM4YjRmZGQgMTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KKysrIGIv
eGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCkBAIC0zNiw4ICszNiw4IEBAIHN0cnVjdCB2cGNpX3Jl
Z2lzdGVyIHsNCiB9Ow0KDQogI2lmZGVmIF9fWEVOX18NCi1leHRlcm4gY29uc3QgdnBjaV9jYXBh
YmlsaXR5X3QgKmNvbnN0IF9fc3RhcnRfdnBjaV9hcnJheVtdOw0KLWV4dGVybiBjb25zdCB2cGNp
X2NhcGFiaWxpdHlfdCAqY29uc3QgX19lbmRfdnBjaV9hcnJheVtdOw0KK2V4dGVybiB2cGNpX2Nh
cGFiaWxpdHlfdCBfX3N0YXJ0X3ZwY2lfYXJyYXlbXTsNCitleHRlcm4gdnBjaV9jYXBhYmlsaXR5
X3QgX19lbmRfdnBjaV9hcnJheVtdOw0KICNkZWZpbmUgTlVNX1ZQQ0lfSU5JVCAoX19lbmRfdnBj
aV9hcnJheSAtIF9fc3RhcnRfdnBjaV9hcnJheSkNCg0KICNpZmRlZiBDT05GSUdfSEFTX1ZQQ0lf
R1VFU1RfU1VQUE9SVA0KQEAgLTI1NSw3ICsyNTUsNyBAQCBzdGF0aWMgaW50IHZwY2lfaW5pdF9j
YXBhYmlsaXRpZXMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQogew0KICAgICBmb3IgKCB1bnNpZ25l
ZCBpbnQgaSA9IDA7IGkgPCBOVU1fVlBDSV9JTklUOyBpKysgKQ0KICAgICB7DQotICAgICAgICBj
b25zdCB2cGNpX2NhcGFiaWxpdHlfdCAqY2FwYWJpbGl0eSA9IF9fc3RhcnRfdnBjaV9hcnJheVtp
XTsNCisgICAgICAgIGNvbnN0IHZwY2lfY2FwYWJpbGl0eV90ICpjYXBhYmlsaXR5ID0gJl9fc3Rh
cnRfdnBjaV9hcnJheVtpXTsNCiAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBjYXAgPSBjYXBh
YmlsaXR5LT5pZDsNCiAgICAgICAgIGNvbnN0IGJvb2wgaXNfZXh0ID0gY2FwYWJpbGl0eS0+aXNf
ZXh0Ow0KICAgICAgICAgaW50IHJjOw0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi92cGNp
LmggYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQppbmRleCBmNGVjMWMyNTkyMmQuLjc3NzUwZGQ0
MTMxYSAxMDA2NDQNCi0tLSBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCisrKyBiL3hlbi9pbmNs
dWRlL3hlbi92cGNpLmgNCkBAIC0zMSwxNCArMzEsMTMgQEAgdHlwZWRlZiBzdHJ1Y3Qgew0KICNk
ZWZpbmUgVlBDSV9NQVhfVklSVF9ERVYgICAgICAgKFBDSV9TTE9UKH4wKSArIDEpDQoNCiAjZGVm
aW5lIFJFR0lTVEVSX1ZQQ0lfQ0FQQUJJTElUWShjYXAsIGZpbml0LCBmY2xlYW4sIGV4dCkgXA0K
LSAgICBzdGF0aWMgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgZmluaXQjI190ID0geyBcDQorICAg
IHN0YXRpYyB2cGNpX2NhcGFiaWxpdHlfdCBmaW5pdCMjX2VudHJ5IFwNCisgICAgICAgIF9fdXNl
ZF9zZWN0aW9uKCIuZGF0YS5yZWwucm8udnBjaSIpID0geyBcDQogICAgICAgICAuaWQgPSAoY2Fw
KSwgXA0KICAgICAgICAgLmluaXQgPSAoZmluaXQpLCBcDQogICAgICAgICAuY2xlYW51cCA9IChm
Y2xlYW4pLCBcDQogICAgICAgICAuaXNfZXh0ID0gKGV4dCksIFwNCi0gICAgfTsgXA0KLSAgICBz
dGF0aWMgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgKmNvbnN0IGZpbml0IyNfZW50cnkgIFwNCi0g
ICAgICAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS5yZWwucm8udnBjaSIpID0gJmZpbml0IyNfdA0K
KyAgICB9DQoNCiAjZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfQ0FQKGNhcCwgZmluaXQsIGZjbGVhbikg
XA0KICAgICBSRUdJU1RFUl9WUENJX0NBUEFCSUxJVFkoY2FwLCBmaW5pdCwgZmNsZWFuLCBmYWxz
ZSkNCg0KSSBwcmludCB0aGUgdmFsdWUgb2YgTlVNX1ZQQ0lfSU5JVCwgaXQgaXMgYSBzdHJhbmdl
IG51bWJlciAoNjE0ODkxNDY5MTIzNjUxNzIwOSkuDQoNCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVz
dCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

