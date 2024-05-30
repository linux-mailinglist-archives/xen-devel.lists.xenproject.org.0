Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199CA8D4A50
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 13:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732674.1138699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCdoj-0006t4-Vy; Thu, 30 May 2024 11:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732674.1138699; Thu, 30 May 2024 11:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCdoj-0006rR-RF; Thu, 30 May 2024 11:19:33 +0000
Received: by outflank-mailman (input) for mailman id 732674;
 Thu, 30 May 2024 11:19:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPWJ=NB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sCdoi-0006rL-3O
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 11:19:32 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20607.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ad562d3-1e76-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 13:19:29 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB7899.namprd12.prod.outlook.com (2603:10b6:8:149::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 11:19:23 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.021; Thu, 30 May 2024
 11:19:23 +0000
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
X-Inumbo-ID: 7ad562d3-1e76-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIrxbhBXVsmZr2JjFEcTbi5BMaThgc7COYQrn80UVTWgjFCy5m8Cla9CR3v5ocEjTRe+2WTTgt/yfkd7fMqdvSo7HcCGiPMPmWBqtSILjYVBmHUmBJKxBcJu9E9sKnj1lVg0Bgo328gcrdZPB3JnOV6JKQsfCWRuNi2pAwf2gaVtNJlMO2b4RSgB0jE0AhNbO55FQJdRFUbI+aUXNgaJKStftKsr5Pi4ZaZRdHgo9kkBUsSrhyuO5xM04TJLS/f6T/79fiQ8zsXvm3tLHQ7p4CN5YwgNSO9Te7Ew0Hi577ZQ2oEgrE0YKeVA0bqTQOs31lHPJbdd44tVNY6oBN82ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/bsaiOlmnOP24VqNb9Ma4aPIn679EPHR0zSu94KM2w=;
 b=kXWSi8bVXLQK/iZYgaAnbutwTEyQJz3Lkl0YyUx4iP8xXtFCj6QDSn9MtgGMpO5wPfdZwXB39ETNcDBqdscT8oQCYLQyaFzDDYvo7Lpd0RLM9rndeYGw22AqqImul6FQC+BpZM4KG75HSyU+RmrRFSw9adVJDQgHqTTH+08srp9g3Q/wdEG2rdYKeMhoPikKpjylAlp3xELiOrupecf/y4pjKUyYHcy6y6bslguTzvNEQF7fxHObWTG+Pg7ZztqgEDAtUvvKXfI9Eq6a8fth3AXBJ6E3Pp+7C52G6X+jLyFLtPsRxHu9lrSctieTy8WbVR90TN5aGyksUshmFTF2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/bsaiOlmnOP24VqNb9Ma4aPIn679EPHR0zSu94KM2w=;
 b=h2sMPUQK5T602Coh+tWJTqm9Huv4wbh0GjsoffbYEVEkeAfc+ldhZbZyxoQKy976U4/iINB9WBiNRTTWbVutDDRBUAI3oDKPbc1tUccFsX3Psxknr7v2sf8oTYyCgXhnnyyVM5Ge4P96CYSoiEAvr3ig906sHvvdXoTyc6pfjQk=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4D//4e1AIAAis+A//+FmgCAEsTugP//viAAABEhvwD//4GYgIAAoyuA//+0FICAAgSCAA==
Date: Thu, 30 May 2024 11:19:22 +0000
Message-ID:
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
In-Reply-To: <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7633.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB7899:EE_
x-ms-office365-filtering-correlation-id: e566d5c5-d7e5-4bf3-6362-08dc809a5b91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|1800799015|7416005|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?UUhOZkNqUElFSnUxQmdUZ2I1ZlVjZ2RZbU0zbTUvOW9TcEhYNVd4WkJ2M3lx?=
 =?utf-8?B?Vm10Z0JjWGxRSGN3a3BjUFNWSGRGUGh2Z0ZhczZJclNsTmVIcnYyZG5rcThO?=
 =?utf-8?B?TlRxMnh1aUNLSXl6eXlOWmlJZThCVTZXRUkwaUZTaGZPWkRIWnRnZk5UK3NN?=
 =?utf-8?B?eTRFeXFiQ3hyaXphZnVvVEhHZU04aU1hRndTQVVYelZQVzBtRkl5TFBUd3lR?=
 =?utf-8?B?ZDlBNTBmQXlkNFRNajNrWTVUWkV3d1lGTzMxYVo4T3hmc3Z2VU8yRzdkSmJr?=
 =?utf-8?B?bjlCZXBkK0NmTmw5aW9WY2YzRU5EdWc2YndocnhDQU5VM1FWMzFsL2pUVzF0?=
 =?utf-8?B?VVpMRmtHZHRlZEhwbk44RC9VVUZmTXhJOHZBZkJKS2pkNi8vY20rVXNERFhy?=
 =?utf-8?B?YVR2ZW9yZHJwNHQwZGJZVExPdkVScmE2VXBKNThpSlMrb0Z3bUxndFlnc2xw?=
 =?utf-8?B?aFUwSlZ0cWhjcEZ5bEdLQTBUMnVwRFBwaDM0bkdyYVh1RVNqcEtJYURHWlcv?=
 =?utf-8?B?SXhsQXdHM2E3T29xWUtBcDA2TmhlR2pSZEtteUEwamZZZEhiLzBnd2FWejVC?=
 =?utf-8?B?VldRbzk2MWpFZDVONU4zbG9FV0FzM2lFQ2taYjZjR0RKUHBiZlA3VjY4U1RV?=
 =?utf-8?B?dXZWYXBDdXdhM0ptaHluVkRXV3ZwaElOa0pRYnc5R2VzOEhETWF4U2IyMnlr?=
 =?utf-8?B?TER3QjBGeFYyWVZHSUJKWFloQkhsY3dPeXBQVlhxdk1KSG00VHFEbitFQzIx?=
 =?utf-8?B?TkJkUUY5aFB6azRCeGl1QTBWVU5BVTVmdSt2QWxFMnF4bXNMci9acGdCbGNX?=
 =?utf-8?B?K0NwMTZKYjh1S3grcU5wT0hYUUk2WFlQT0d6UFhYMDdNUTdzTndwV2tWUW11?=
 =?utf-8?B?dnpwcEF3RGp5RENvZ1Q3MFplSlNuUTE1Z3RWZ0U5N2pKQTZUYzNvbHNpUEg1?=
 =?utf-8?B?L0ZQbHNJQ2cyRURzUmhONzllWTR5REEyMXZmUS9KZjdiWFZHZVJERVljMGtu?=
 =?utf-8?B?WUUzY2VOTDJ5MjE4d2xZZVdRNzhONzR1R2JYM2p6dkk2VnlsQkEvWjdDZHpZ?=
 =?utf-8?B?b242bkY3QklvOW55UnFGYUpaNU1YSUdTQTczeWNRYnl1S0haZFF3bjg2M1R3?=
 =?utf-8?B?WExyVFpMUEl3a3IzQ09qY3plekV6VTd2NkM1U3h3V2xySFczYUh5L0thTzNv?=
 =?utf-8?B?THp6S01xamYrYkl1cDBEZmxwcGJpdlUxSXVtcXJRcEtrQk5CVDNJR1I4NVZE?=
 =?utf-8?B?R25LY0NGT1ZvMkJoaXdCaXNNWEplV2c4Zk4yWWxzVWFGcC9LbkZDWWV2Y2NF?=
 =?utf-8?B?Qi9xTGpyTGl2MmgwV0hyemtNRTdGRklZTTFBdnNsYk9XbFhXajZOcXdaUS9M?=
 =?utf-8?B?Qm50bndZQ0gvWnFFcWtVVXYycDFlSFc5L0ozUU1BQTh5MmhtOEk3bysreHJF?=
 =?utf-8?B?S0FqWWxjdVFFS1p6dDVXUWpOZ1F6WHVIUFpLYXdkZHhqVFFZUnRPQUlsRjJM?=
 =?utf-8?B?Q0ZMTUtReDh1MCszRStyUWh5cW5QS3haZXFLYklBSzAyV0pBWWVYT2RJZjg2?=
 =?utf-8?B?NkFXcEczU2pCeDBOSEFXemgxNmp2SlhRdnZRV0xyeGtLTFcxUWVKckFQRk4z?=
 =?utf-8?B?UEkwUEQzME1qZXpyV1NPSkZNbXNqSUU1TTF2aGsvZHAxSE9Pa3k0bU9kUGpR?=
 =?utf-8?B?T3haM3BsSXJ0REU1bVBCTmYwSGlGZGJaSUYybWM0V2tzbHdmSXZENE1HZStX?=
 =?utf-8?B?ZGl2TVNlemtyK0xFUTNkM2dMbHJVMVlycEVBMnRsYVI0SmliblhNTklKVmtt?=
 =?utf-8?B?bWRtUVlZeTR6Q2FkbzVaZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXZ3d3Bhd3JpVnpjWFhYVFZTc3plQWkyYzVnTko4OEp0NmFWMUJ4SGRkOVpF?=
 =?utf-8?B?cU9yQVQydWNaZmhCZ3pUS3Z2Rk56T2RDVUptQmFrN3F1UU56WnJjUzA1SzNw?=
 =?utf-8?B?bE9icDFaR2t4TE9VWkExc0h0MzAxZjZTNVJTSTdNT2laRHJuUEZFL1RBNmlR?=
 =?utf-8?B?RkR5bEk5NDVFSUoxeUN2YVlCMlpyWG5nM1JaV2RXNlhTeUY5dHRROVYxTXVB?=
 =?utf-8?B?U1J0WkU3MWNVS2ZEQ3Y1WGlPeVlKTFY1U2w1bzY1cWJWN1BGOGJnUGtIVS92?=
 =?utf-8?B?Um5wNVJUZlQvY0dXUm1aWXdLbUIreXB5Y3NnSE14WnY4K2dDSjFrOFptMTJX?=
 =?utf-8?B?c0lTck94K3NsTGZ6a2ZBRnZNZDRiTnE5RjlUTDNkRkREd1d1N1pRcy9rN3do?=
 =?utf-8?B?S00vbjFzYXo4MHg4SFQ2Z2h0QnU2ZkZjSVE0ZXFnTktBM1lBYjRuYXcrSWll?=
 =?utf-8?B?emd2OTNOVXVibVljdEEvUXNieE1rK0d2aEVZQ0JBQmdhNHI3a1F0clc0dTE1?=
 =?utf-8?B?YjlsUHRodEp1b0Jqamk0TDBMMzE4SnNGeTRsOGFJa0JSTWI0ZUNsQ2R0ZDVT?=
 =?utf-8?B?czgyMHBWcWZZRGdkcmZNV0dQdEtwWjFSVlViUTRGYnppRkRWbWZ4WWwvWjRs?=
 =?utf-8?B?b0UyVi9xb09mbUxwZ0lXbXN1YXJUaG1QTGVxK2dYQmVuUVY3NmlWNEx4VWhP?=
 =?utf-8?B?QnA3TEtMMGM3VEw0Rmg1eXpCV1YxRHdCVjJQaE51VTlwMnhwcmRqenB6SUdM?=
 =?utf-8?B?ZEs5Q1dxK1c4UHQzdXhMYmtDRit6azlOblczMlZCVlpmamtaV3pLbnlUOHFR?=
 =?utf-8?B?NGMzWERoQ1Vsak4wREppY2F4ajVZSkZnY3d0bkd0amlGLzMveXZGUWo3a0wy?=
 =?utf-8?B?Qk93emNsZU1rYmx1R3hDVUtUVTlhRXB5OTNDWlY0VWZ3clc1a0J2UzZUZGky?=
 =?utf-8?B?Mk1ibkpYLzdwV2VmTEJkMktqdjFSVW92TmdId2tFTUEvR1d6YmIyQ0FJd1VC?=
 =?utf-8?B?ZFU5YlluREtkUGVYOUNxZUlhNEtmWGYyK2ZJelNLSERNMFY3UjM2dk42RTlT?=
 =?utf-8?B?Y3d3bGlZOTRyMUNpTEhrTndqVFQ2Q3pMMENVZEYxM3RmbHBVNFREQndIVlh1?=
 =?utf-8?B?NGZ0bUpEQmVzTkdyaDFieTJNN2l1RDZscktuWEFDbnpiRDJ5Z2JXZ3BlQ1JI?=
 =?utf-8?B?cjUzMXBhNTl2RUNGdGhzd2FZanpSeFVwcDlGYXRzWGRPeTluanJMaC9aRW1h?=
 =?utf-8?B?Mi9LZkJWRTJiWmNKREhSUFhBL1FLUjNuQThQQ1NwZjZRZUNMM20yZzNOL3Bx?=
 =?utf-8?B?ZzRNMnVKNFVnTHZ0MnVta2lDWklaV2Y5UTNUdVBjbitmb0wzQlRldGttQVNJ?=
 =?utf-8?B?amk1dVFSR3hOS2dNT0w4YzdVL0I4OVh3ZnBNTkZRcGxHNU1ONVNQTmN5ZlpI?=
 =?utf-8?B?bmNNZE1TTmxsYkx4dEt0RzBYMnNoRE0zMXhHaTRCdWdNKzlZL1JhRlBRTHNj?=
 =?utf-8?B?S3F1R0ZRZHJyRThBdzhaU255OHlwTG42TVNEUVh4alFyaDRnNVZHUDBFbGJ1?=
 =?utf-8?B?Q3lHN1p2OGxtd0wrM05nUTVMK2M3MURwMklxNSttNzZkcG5mNTF0aUJocHdO?=
 =?utf-8?B?cGUyQUZRcUs0OEwwQW5neENoM0NLRU5yYVY0SUluWWNrVmh1Q1NtZFo3WUsz?=
 =?utf-8?B?Wk9ZK3Jsa1NYQ1R6ZGltRGtuc3M4WVh3dkcwWjJZUjFucmdiYzV3NzloM0N0?=
 =?utf-8?B?TUxLeUFkM0NoT0JGUXJ2RVcxT01Nc3g0MzhRaStDQU5ROVNoV1BRNnVYVExD?=
 =?utf-8?B?bXpqdGNPcWU5NWlxa1NuQm5ib0JlOEJ6Wk9PelA5TG1lZjMzdlVGcW1Wa0hL?=
 =?utf-8?B?QVk1THZwWFJ5djY0L2laalNYWDM4ajRDcGdsbnQ1cnVqb0NWNXdRa1d3ZStD?=
 =?utf-8?B?Yi9TOHhoVU1hRHpHS3l2N3ZGNzJWbFIvQm94dHBJSUE2ZlhTVmtYeHFYRDVT?=
 =?utf-8?B?ZjdJRER4QU0rdjUwaWJRVGlKa0NsaGdoZXkxNmY1dzJCQlJlVnB5WloyaGlr?=
 =?utf-8?B?OE9QTmxzbEJIMmJzM2lUVVB6Z21UQ2NiaFllYTdqZXFUeHk4Qmg4VnVnYzZh?=
 =?utf-8?Q?7djk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <047F22B4717A79479AB8B3DD4E816F5F@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e566d5c5-d7e5-4bf3-6362-08dc809a5b91
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 11:19:22.8903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kj2S3RmLRpRWBVQ2sAR2sQshquuRVaM3WDg6DS1yeOwToTnWjiXco4pCMcofVgsp0lmJOxeobzJVFSWUXqYKOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7899

T24gMjAyNC81LzI5IDIwOjIyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjkuMDUuMjAyNCAx
MzoxMywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC81LzI5IDE1OjEwLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyOS4wNS4yMDI0IDA4OjU2LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjQvNS8yOSAxNDozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAy
OS4wNS4yMDI0IDA0OjQxLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gQnV0IEkgZm91bmQg
aW4gZnVuY3Rpb24gaW5pdF9pcnFfZGF0YToNCj4+Pj4+PiAgICAgZm9yICggaXJxID0gMDsgaXJx
IDwgbnJfaXJxc19nc2k7IGlycSsrICkNCj4+Pj4+PiAgICAgew0KPj4+Pj4+ICAgICAgICAgaW50
IHJjOw0KPj4+Pj4+DQo+Pj4+Pj4gICAgICAgICBkZXNjID0gaXJxX3RvX2Rlc2MoaXJxKTsNCj4+
Pj4+PiAgICAgICAgIGRlc2MtPmlycSA9IGlycTsNCj4+Pj4+Pg0KPj4+Pj4+ICAgICAgICAgcmMg
PSBpbml0X29uZV9pcnFfZGVzYyhkZXNjKTsNCj4+Pj4+PiAgICAgICAgIGlmICggcmMgKQ0KPj4+
Pj4+ICAgICAgICAgICAgIHJldHVybiByYzsNCj4+Pj4+PiAgICAgfQ0KPj4+Pj4+IERvZXMgaXQg
bWVhbiB0aGF0IHdoZW4gaXJxIDwgbnJfaXJxc19nc2ksIHRoZSBnc2kgYW5kIGlycSBpcyBhIDE6
MSBtYXBwaW5nPw0KPj4+Pj4NCj4+Pj4+IE5vLCBhcyBleHBsYWluZWQgYmVmb3JlLiBJIGFsc28g
ZG9uJ3Qgc2VlIGhvdyB5b3Ugd291bGQgZGVyaXZlIHRoYXQgZnJvbSB0aGUgY29kZSBhYm92ZS4N
Cj4+Pj4gQmVjYXVzZSBoZXJlIHNldCBkZXNjLT5pcnEgPSBpcnEsIGFuZCBpdCBzZWVtcyB0aGVy
ZSBpcyBubyBvdGhlciBwbGFjZSB0byBjaGFuZ2UgdGhpcyBkZXNjLT5pcnEsIHNvLCBnc2kgMSBp
cyBjb25zaWRlcmVkIHRvIGlycSAxLg0KPj4+DQo+Pj4gV2hhdCBhcmUgeW91IHRha2luZyB0aGlz
IGZyb20/IFRoZSBsb29wIGJvdW5kIGlzbid0IG5yX2dzaXMsIGFuZCB0aGUgaXRlcmF0aW9uDQo+
Pj4gdmFyaWFibGUgaXNuJ3QgaW4gR1NJIHNwYWNlIGVpdGhlcjsgaXQncyBpbiBJUlEgbnVtYmVy
aW5nIHNwYWNlLiBJbiB0aGlzIGxvb3ANCj4+PiB3ZSdyZSBtZXJlbHkgbGV2ZXJhZ2luZyB0aGF0
IGV2ZXJ5IEdTSSBoYXMgYSBjb3JyZXNwb25kaW5nIElSUTsNCj4+PiB0aGVyZSBhcmUgbm8gYXNz
dW1wdGlvbnMgbWFkZSBhYm91dCB0aGUgbWFwcGluZyBiZXR3ZWVuIHRoZSB0d28uIEFmYWljcyBh
dCBsZWFzdC4NCj4+Pg0KPj4+Pj4gIm5yX2lycXNfZ3NpIiBkZXNjcmliZXMgd2hhdCBpdHMgbmFt
ZSBzYXlzOiBUaGUgbnVtYmVyIG9mDQo+Pj4+PiBJUlFzIG1hcHBpbmcgdG8gYSAoX3NvbWVfKSBH
U0kuIFRoYXQncyB0byB0ZWxsIHRoZW0gZnJvbSB0aGUgbm9uLUdTSSAoaS5lLg0KPj4+Pj4gbWFp
bmx5IE1TSSkgb25lcy4gVGhlcmUncyBubyBpbXBsaWNhdGlvbiB3aGF0c29ldmVyIG9uIHRoZSBJ
UlEgPC0+IEdTSQ0KPj4+Pj4gbWFwcGluZy4NCj4+Pj4+DQo+Pj4+Pj4gV2hhdCdzIG1vcmUsIHdo
ZW4gdXNpbmcgUEhZU0RFVk9QX3NldHVwX2dzaSwgaXQgY2FsbHMgbXBfcmVnaXN0ZXJfZ3NpLA0K
Pj4+Pj4+IGFuZCBpbiBtcF9yZWdpc3Rlcl9nc2ksIGl0IHVzZXMgIiBkZXNjID0gaXJxX3RvX2Rl
c2MoZ3NpKTsgIiB0byBnZXQgaXJxX2Rlc2MgZGlyZWN0bHkuDQo+Pj4+Pg0KPj4+Pj4gV2hpY2gg
bWF5IGJlIHdyb25nLCB3aGlsZSB0aGF0IHdyb25nLW5lc3MgbWF5IG5vdCBoYXZlIGhpdCBhbnlv
bmUgaW4NCj4+Pj4+IHByYWN0aWNlIChmb3IgcmVhc29ucyB0aGF0IHdvdWxkIG5lZWQgd29ya2lu
ZyBvdXQpLg0KPj4+Pj4NCj4+Pj4+PiBDb21iaW5pbmcgYWJvdmUsIGNhbiB3ZSBjb25zaWRlciAi
Z3NpID09IGlycSIgd2hlbiBpcnEgPCBucl9pcnFzX2dzaSA/DQo+Pj4+Pg0KPj4+Pj4gQWdhaW4g
LSBuby4NCj4+Pj4gU2luY2UgeW91IGFyZSBjZXJ0YWluIHRoYXQgdGhleSBhcmUgbm90IGVxdWFs
LCBjb3VsZCB5b3UgdGVsbCBtZSB3aGVyZSBzaG93IHRoZXkgYXJlIG5vdCBlcXVhbCBvciB3aGVy
ZSBidWlsZCB0aGVpciBtYXBwaW5ncywNCj4+Pj4gc28gdGhhdCBJIGNhbiBrbm93IGhvdyB0byBk
byBhIGNvbnZlcnNpb24gZ3NpIGZyb20gaXJxLg0KPj4+DQo+Pj4gSSBkaWQgcG9pbnQgeW91IGF0
IHRoZSBBQ1BJIEludGVycnVwdCBTb3VyY2UgT3ZlcnJpZGUgc3RydWN0dXJlIGJlZm9yZS4NCj4+
PiBXZSdyZSBwYXJzaW5nIHRob3NlIGluIGFjcGlfcGFyc2VfaW50X3NyY19vdnIoKSwgdG8gZ2l2
ZSB5b3UgYSBwbGFjZSB0bw0KPj4+IHN0YXJ0IGdvaW5nIGZyb20uDQo+PiBPaCEgSSB0aGluayBJ
IGtub3cuDQo+PiBJZiBJIHdhbnQgdG8gdHJhbnNmb3JtIGdzaSB0byBpcnEsIEkgbmVlZCB0byBk
byBiZWxvdzoNCj4+IAlpbnQgaXJxLCBlbnRyeSwgaW9hcGljLCBwaW47DQo+Pg0KPj4gCWlvYXBp
YyA9IG1wX2ZpbmRfaW9hcGljKGdzaSk7DQo+PiAJcGluID0gZ3NpIC0gbXBfaW9hcGljX3JvdXRp
bmdbaW9hcGljXS5nc2lfYmFzZTsNCj4+IAllbnRyeSA9IGZpbmRfaXJxX2VudHJ5KGlvYXBpYywg
cGluLCBtcF9JTlQpOw0KPj4gCWlycSA9IHBpbl8yX2lycShlbnRyeSwgaW9hcGljLCBwaW4pOw0K
Pj4NCj4+IEFtIEkgcmlnaHQ/DQo+IA0KPiBUaGlzIGxvb2tzIHBsYXVzaWJsZSwgeWVzLg0KSSBk
dW1wIGFsbCBtcGNfY29uZmlnX2ludHNyYyBvZiBhcnJheSBtcF9pcnFzLCBpdCBzaG93czoNCihY
RU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNy
Y2J1c2lycSAwIGRzdGFwaWMgMzMgZHN0aXJxIDINCihYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUg
MyBpcnF0eXBlIDAgaXJxZmxhZyAxNSBzcmNidXMgMCBzcmNidXNpcnEgOSBkc3RhcGljIDMzIGRz
dGlycSA5DQooWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBz
cmNidXMgMCBzcmNidXNpcnEgMSBkc3RhcGljIDMzIGRzdGlycSAxDQooWEVOKSBmaW5kX2lycV9l
bnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgMyBkc3Rh
cGljIDMzIGRzdGlycSAzDQooWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGly
cWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgNCBkc3RhcGljIDMzIGRzdGlycSA0DQooWEVOKSBm
aW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNp
cnEgNSBkc3RhcGljIDMzIGRzdGlycSA1DQooWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJx
dHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgNiBkc3RhcGljIDMzIGRzdGlycSA2
DQooWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMg
MCBzcmNidXNpcnEgNyBkc3RhcGljIDMzIGRzdGlycSA3DQooWEVOKSBmaW5kX2lycV9lbnRyeSB0
eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgOCBkc3RhcGljIDMz
IGRzdGlycSA4DQooWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcg
MCBzcmNidXMgMCBzcmNidXNpcnEgMTAgZHN0YXBpYyAzMyBkc3RpcnEgMTANCihYRU4pIGZpbmRf
aXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNyY2J1c2lycSAx
MSBkc3RhcGljIDMzIGRzdGlycSAxMQ0KKFhFTikgZmluZF9pcnFfZW50cnkgdHlwZSAzIGlycXR5
cGUgMCBpcnFmbGFnIDAgc3JjYnVzIDAgc3JjYnVzaXJxIDEyIGRzdGFwaWMgMzMgZHN0aXJxIDEy
DQooWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMg
MCBzcmNidXNpcnEgMTMgZHN0YXBpYyAzMyBkc3RpcnEgMTMNCihYRU4pIGZpbmRfaXJxX2VudHJ5
IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNyY2J1c2lycSAxNCBkc3RhcGlj
IDMzIGRzdGlycSAxNA0KKFhFTikgZmluZF9pcnFfZW50cnkgdHlwZSAzIGlycXR5cGUgMCBpcnFm
bGFnIDAgc3JjYnVzIDAgc3JjYnVzaXJxIDE1IGRzdGFwaWMgMzMgZHN0aXJxIDE1DQoNCkl0IHNl
ZW1zIG9ubHkgTGVnYWN5IGlycSBhbmQgZ3NpWzA6MTVdIGhhcyBhIG1hcHBpbmcgaW4gbXBfaXJx
cy4NCk90aGVyIGdzaSBjYW4gYmUgY29uc2lkZXJlZCAxOjEgbWFwcGluZyB3aXRoIGlycT8gT3Ig
YXJlIHRoZXJlIG90aGVyIHBsYWNlcyByZWZsZWN0IHRoZSBtYXBwaW5nIGJldHdlZW4gaXJxIGFu
ZCBnc2k/DQpBbmQgbXkgY29kZSB3aWxsIGJlOg0KICAgIGNhc2UgWEVOX0RPTUNUTF9nc2lfcGVy
bWlzc2lvbjoNCiAgICB7DQogICAgICAgIHVuc2lnbmVkIGludCBnc2kgPSBkb21jdGwtPnUuZ3Np
X3Blcm1pc3Npb24uZ3NpOw0KICAgICAgICBpbnQgaXJxOw0KICAgICAgICBib29sIGFsbG93ID0g
ZG9tY3RsLT51LmdzaV9wZXJtaXNzaW9uLmFsbG93X2FjY2VzczsNCg0KICAgICAgICAvKg0KICAg
ICAgICAgKiBnc2lbMCwxNV0gaXMgbm90IDE6MSBtYXBwaW5nIHRvIGxlZ2FjeSBpcnFbMCwxNV0s
IGl0IG5lZWQgYQ0KICAgICAgICAgKiB0cmFuc2Zvcm1hdGlvbi4gT3RoZXIgZ3NpIGlzIGNvbnNp
ZGVyZWQgYmUgMToxIG1hcHBpbmcgdG8gaXJxDQogICAgICAgICAqLw0KICAgICAgICBpZiAoIGdz
aSA8IDE2ICkNCiAgICAgICAgICAgIGlycSA9IGdzaV8yX2lycShnc2kpOw0KICAgICAgICBlbHNl
DQogICAgICAgICAgICBpcnEgPSBnc2k7DQoNCiAgICAgICAgLyoNCiAgICAgICAgICogSWYgY3Vy
cmVudCBkb21haW4gaXMgUFYgb3IgaXQgaGFzIFBJUlEgZmxhZywgaXQgaGFzIGEgbWFwcGluZw0K
ICAgICAgICAgKiBvZiBnc2ksIHBpcnEgYW5kIGlycSwgc28gaXQgc2hvdWxkIHVzZSBYRU5fRE9N
Q1RMX2lycV9wZXJtaXNzaW9uDQogICAgICAgICAqIHRvIGdyYW50IGlycSBwZXJtaXNzaW9uLg0K
ICAgICAgICAgKi8NCiAgICAgICAgaWYgKCBpc19wdl9kb21haW4oY3VycmVudC0+ZG9tYWluKSB8
fCBoYXNfcGlycShjdXJyZW50LT5kb21haW4pICkNCiAgICAgICAgew0KICAgICAgICAgICAgcmV0
ID0gLUVPUE5PVFNVUFA7DQogICAgICAgICAgICBicmVhazsNCiAgICAgICAgfQ0KDQogICAgICAg
IGlmICggZ3NpID49IG5yX2lycXNfZ3NpIHx8IGlycSA8IDAgKQ0KICAgICAgICB7DQogICAgICAg
ICAgICByZXQgPSAtRUlOVkFMOw0KICAgICAgICAgICAgYnJlYWs7DQogICAgICAgIH0NCg0KICAg
ICAgICBpZiAoICFpcnFfYWNjZXNzX3Blcm1pdHRlZChjdXJyZW50LT5kb21haW4sIGlycSkgfHwN
CiAgICAgICAgICAgICB4c21faXJxX3Blcm1pc3Npb24oWFNNX0hPT0ssIGQsIGlycSwgYWxsb3cp
ICkNCiAgICAgICAgew0KICAgICAgICAgICAgcmV0ID0gLUVQRVJNOw0KICAgICAgICAgICAgYnJl
YWs7DQogICAgICAgIH0NCg0KICAgICAgICBpZiAoIGFsbG93ICkNCiAgICAgICAgICAgIHJldCA9
IGlycV9wZXJtaXRfYWNjZXNzKGQsIGlycSk7DQogICAgICAgIGVsc2UNCiAgICAgICAgICAgIHJl
dCA9IGlycV9kZW55X2FjY2VzcyhkLCBpcnEpOw0KICAgICAgICBicmVhazsNCiAgICB9DQoNCklz
IGFib3ZlIGFjY2VwdGFibGU/DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkpp
cWlhbiBDaGVuLg0K

