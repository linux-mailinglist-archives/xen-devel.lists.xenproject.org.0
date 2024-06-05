Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6AA8FC419
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 09:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735563.1141678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEkhE-0002w9-CJ; Wed, 05 Jun 2024 07:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735563.1141678; Wed, 05 Jun 2024 07:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEkhE-0002tw-9W; Wed, 05 Jun 2024 07:04:32 +0000
Received: by outflank-mailman (input) for mailman id 735563;
 Wed, 05 Jun 2024 07:04:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rKp1=NH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sEkhD-0002tq-Io
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 07:04:31 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8a52bc8-2309-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 09:04:27 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB7889.namprd12.prod.outlook.com (2603:10b6:510:27f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 07:04:25 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 07:04:25 +0000
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
X-Inumbo-ID: d8a52bc8-2309-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBkbzcXTfZcd+DpZYEbMK/1sWFISfZx2twejFsOefMmrDwtN2EAqiZZUgp9jA+BAySf/AmbF5b32n1tAL5778JuEi8Yu71+EJn//yG7yt9tyPPDTV84mCH60YKGxiNxPbFJrSvRY7Z3Ngvkrq2m1Kc1bh8j0hVS8tAs8AxsxS4lwyp9vbStKSFxlXQQR+mo496cqBZnLYmEnDVhCD6jKLI+aybcc8tmamp8wvf6oGPNpLxaxUy36UwHY4lwm8J5es2+eedfor4J47VkFmA3P3gnv14D9/7ZDXorVtOx6EaUhC9wqh1r6rxJWFyMYjzIPIwFibjk2uyjAE2cEn7wwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fu7b7tl2h7dyysQNC99E+j+9mSwNg2MYy7Xk6wiuH6s=;
 b=UuwICIp/tBjapc/TEU0KOgbWpevgKXqOMc77MKUjyzVvCRBRgHOJcs37JstgapzUenq2ZZvIR4MeBgCJ/c6dxxptQshZUwgUSNqbQbKTNaXvmqeePO6L+kqyc/Onh/2Q18czWCYo2wUV0WOHboNKBolncCLQxL8FcvYZY36vBhdZ5CYSHCENh/5lXQsS+UcYhMMfmXbdWC0M3dglYA2jwlvCVkBc7B9gx0la9W6upI0sXnOTeTrgGtKt3NTbw5Y2ayMnDBVInC4DYx2VIg32w3bVaTxBjPhdI5T8hXTmucNlnDBPcufY9lEkBT/H8yJNziJd7sSRocGQyFszQOpXLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fu7b7tl2h7dyysQNC99E+j+9mSwNg2MYy7Xk6wiuH6s=;
 b=lPGIkPoyWpmEAm2l39UxCnKsKmsBg/6eMFLDEh+7JYqtVrKzx2K1NzgAXbz/Wv3/WL8Q5bSTrm3Ie1PSDni+TJgNdMUFqKBwieBz+AEVigEbwkCRFdMSrgJxrWbq4KFTLRFUpdVBc0XifCyWgxMHTzKJFMzWt2B52hG5ZV0PCZ8=
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
 AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4D//4e1AIAAis+A//+FmgCAEsTugP//viAAABEhvwD//4GYgIAAoyuA//+0FICAAgSCAP//yCWAgAeLLwD//6n2gAAQ1XyAABA5GQAADz4pgAAu2vkAAEmxvAAAkQD4gAD05PGA
Date: Wed, 5 Jun 2024 07:04:25 +0000
Message-ID:
 <BL1PR12MB5849C1D40FCF9861BFE7B208E7F92@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
 <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4a421aa5-b4c5-43f3-85cb-68c2021f13dd@suse.com>
 <BL1PR12MB58492BA224EBCE98549A0349E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f125e2e3-b579-410f-b6ab-93d008bf9a9e@suse.com>
 <BL1PR12MB58494B2DD0CD75CCDF1F5CA1E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <67960b60-3108-4920-8bf1-68a00e117569@suse.com>
 <BL1PR12MB58490E8F1F26532B0FDFFFD6E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <46b884e2-cbec-46f0-9070-7013307a310f@suse.com>
In-Reply-To: <46b884e2-cbec-46f0-9070-7013307a310f@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB7889:EE_
x-ms-office365-filtering-correlation-id: 7ee4a8bf-f293-425f-1c37-08dc852dbbe0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|1800799015|7416005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZUV2MGE0NkpPcFM3a01vSnlWRGxQbnZ1OUNSYU81YjdFSGdEanBFNmxEak9Z?=
 =?utf-8?B?cHpLazVEcUtpbGVFNXpER1ZpUXk5MGx1ejQ1SlV6SVVDUGNXNWdCUmtJVGlk?=
 =?utf-8?B?QWxrRVpsVU4xRHZaeWtvNlNYOUhTRDBQaWNMMTFtbzQ4UDhXdm0xTGZCcHpV?=
 =?utf-8?B?RDlBY0VVZnZESWpjRDNtVzk0eWZvSmJKWUZCTjhHS2RZdkN4Z0FYYlJMWExi?=
 =?utf-8?B?Q0JIeE1VWG1wVEtEZC9lUmNQK1NuV0JxTFVQeXpvR3pUVlhWZ0ZJdVVoWDh5?=
 =?utf-8?B?akFibG9kYzdKaHJHTVA2eDZRM0NBWXJFb1RXcytQRkVGdHByV2hRVFcrNjhp?=
 =?utf-8?B?d1RrNXZtWmhPdUEzQllHcTJGbDlYdGlFRHdIRjlaMTF1YXdJSEQ0TUdsTHIv?=
 =?utf-8?B?aUZsWW5qODNrV3J1Sjd2R2NleFppejNGUzNjTVQ0ZER0b3M1Q3RRd1d2dFps?=
 =?utf-8?B?cGQ5SmtDTTFNN283TGVYQ2VMUXhLTFRwTk1paThQVlVKbWRaSWhXTU5BUi9X?=
 =?utf-8?B?ZEV2cUcrL0lNSzdtcVZ0eEZHM2MyUTQ5eGs3SHV5eW5tR0RKK3QyWWdPS0tM?=
 =?utf-8?B?ODlneCthcUdOcThXNzBlQVduVzJsSWwvb0dGWG9SQTVVV3RURStXb3I5Nyt4?=
 =?utf-8?B?MTFybkszcnEyZ2tBQUJBUUc1M3h0d2xnWmFZMy8yUzlIaTZPUWhWOUZFQ0xF?=
 =?utf-8?B?TXk3b3ljMDN3RVkyUUt3WDJMNjRxeDIxMjVDMk5mT0dBT2FPNkU4N0haeGwx?=
 =?utf-8?B?SHlyem41YURvczZFQ0trZFpqUW9rWm5hT2I3R21xSEZpZk5kejE1ZXUzbHBB?=
 =?utf-8?B?cWRrVFcvM1JRT1VRRGZVditNWkdrcXQ0VmtkaUsrd1l2U01tMm1PbVB3TW03?=
 =?utf-8?B?YXpQeHRmMzQxMlFqQWsxcVhBcDBzdXpuMGd4dWFJLzA2dUV5SjFqa1QwQjZZ?=
 =?utf-8?B?VlNVekRpUUU4WERCMEJHV3FPMXFLdkpxKzN6UHNxOGJnNHJNMW9VbjN1bjhs?=
 =?utf-8?B?d09EQk4yM3BXUmgzZk9kTVdQWEQyb3NlK05oVmdTOFpTeVYyR0Y2WjU2V2dr?=
 =?utf-8?B?NHJlRXh3UFRFaXhFWjVLdnRqcFgweEpmejVIMUNxdW1hSFo4c1NPeVZuOG5I?=
 =?utf-8?B?ZkJSYktkZlc1YTZLUG5aNGgxMlNtNFZUNU1WRUkyU2pDYWZWOGZTNkxQUTgr?=
 =?utf-8?B?QlMrNEU2RXlrY25ROWpSdWdhT2MvcUZjZkVYZU1YZFhMWThhU2U2TytDK3Er?=
 =?utf-8?B?S3BQUzhadHpKNk1vR01oS3lxcDN5V0hhc1lnSlJ1cHUwMnZ4ME9HSTRYekxK?=
 =?utf-8?B?VW5LNGZNcUJHbkdOY1luS0hpeTh6TTZtY0FGY3NlRWZDL1hQcG1mY0s2cUow?=
 =?utf-8?B?TEJJNE5WRmtrSnVJRS9QU1hEaUxWZGZMOEl6bnpMQm41Zjc1R0JEODB5Tjc5?=
 =?utf-8?B?SVJBVHNOOHV6czFPLzRTRWgrSzJHa0lPK3lWUUZPbU00Z253RkYzRmI2VVV3?=
 =?utf-8?B?OHhhbjdOUm1DNnlUWitsVlRMekwreUdPWUw2QmRIM1ZHNzJGaHVvUzNteXhy?=
 =?utf-8?B?VENRbVVoTHZ1N1dlNStWb2RQNlhZTkFXa3lhRHZ4MDFNYy9zZE94TTZTaitm?=
 =?utf-8?B?TTZLODNWdTdSMTdoT1FBMHNFYU4yT1VTUWtRNnRvSHBFa3M0aUZLbkhxbnBH?=
 =?utf-8?B?bHpXbTV3aG1qekVCZW03elNQL0tHWGNIdFl0OHFFWm05ZFZlc0NYS3o1V1BI?=
 =?utf-8?B?eVJMd2VEWUg2bU5iRk1EZkkzWWJMMXJOVVg4ZGZMVWFuRm1nMVJlenpsazRq?=
 =?utf-8?B?b1FLR0NpaXIyNGcrM0Mxdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VnNRdEYwSWxweERFd2FHUzJxRms0cnVTdzM1MlVhcXYzbWpUWGRObGZSQ3h4?=
 =?utf-8?B?dHRrcW42bktnRG5lUGNyd0JxT2hvc1hLc2VnMkh0Y1hjVk1kbWM4c292UEhO?=
 =?utf-8?B?LzhmZVQ2WHRDL08wSGEwRmtsQmYwN2ZsYk9BL0t4RW1ocklzcTVFRTdtOVVs?=
 =?utf-8?B?QVFvUzI0YmIzN1hxWjBjSUgzMVZ4TWdsRVRpcVRUcXFNUzRURnM1RVNRc1NZ?=
 =?utf-8?B?Mjd2eDJVOEtKc1l4MXdZczA5bHBaSTkrN3VaVGpuOUYxd1RKTW1CL01JeUZn?=
 =?utf-8?B?Q3A3MGk2SUVnT1VmOWdIRmlPUEI2S2RxSnhYaDIzTXJxb1BYZGhvWDBRMUJr?=
 =?utf-8?B?a1l0MzlaRFdWRGU2aFEwblNJZUZMUzQvSnZMTUxVQjNwUlFlN09CWk1VOXhw?=
 =?utf-8?B?RkE1UVUvTXdFNHhHeFpBSFU5N2dYQ0ZhS1lWdDNXbi9TczRlSWs1YjVWNFQ0?=
 =?utf-8?B?QitPTmlZM3ZnRnlTa1hKL2tUOEs3ODN3R05IaThnMXpXYVZWMVU5SXhWbmpt?=
 =?utf-8?B?c05wdGt0ZU1ISDRaU0d3cU9PZFVxVE1mS1ZrL3FxMEdtOGJoWml2T3l6Ujk0?=
 =?utf-8?B?ZWYzaDZISVZBNWc4OXVyVUQvM2cydXRjd1VIQkVLQ0JsZWRyUlQwWWJiRG03?=
 =?utf-8?B?VUE3bGd2ekhCWjJpbmEyZlQ3bE9WbEFWT3dRWFFVbk1wRDdyNklYN0c5cFpn?=
 =?utf-8?B?cGZyWk8rVFF5QThzajJIZFJQZ0pXYndXaG5lQm9reXFUUGE3K3hZN3NYQzZH?=
 =?utf-8?B?UlowNGg4VVE2b0F4aU16MGFUcHBta090a2xOcFd6akc3aGVsMTdzSjBJKzJ1?=
 =?utf-8?B?QnBhM2hETXRwNjBXeVkxTGVhdlNiemFud1M4aE93SHJOQlRpQXlQRFo2aUF4?=
 =?utf-8?B?blZqbFJ6aDNaV21ZTTl4Y0x5d3AwU3hBL3N0ZFlqMG5BZW81blU0SmRrWHNu?=
 =?utf-8?B?WkhqSVpqK2h4S3Zta083Rk1iOEJuZ0hic0x4bjdVelYvTStLdlJTbEtzZTE2?=
 =?utf-8?B?Z2Z3N2hacW9hNHEvd0N3N0IrUEppbFRidHpXSmlBZUVxNENHWDlvZFZ6Wmsw?=
 =?utf-8?B?c0h3cGdpRmF5ejAzbVFZNlM2YmxZejU0b05ZU3ZScFgxaTFSYjBUSGl2MkJy?=
 =?utf-8?B?ZVhQd1JQb01tbXl2cnhLUDdyVUtLSEtNVTdpRGtISXArUndWbG1nL3VwOGJz?=
 =?utf-8?B?UVZNRkhGbXIrbzFJeEJjQytmT3hIc2g4Z25NcGUrRFpIRjBsTHFIYjZ1QkU1?=
 =?utf-8?B?TVNzMFJTMkZNVkdaZmZha3gwd29DYzJYNmlVbmF1UzI0cGw1YjllUklwbmRw?=
 =?utf-8?B?ak5vdWlMTXBvZ2V2Z0swc2ZiQ1JoazBLeE5PdzVIT25Cd0o0OWFPOU9vblVs?=
 =?utf-8?B?WmI5TTlKS3NnUFJFQmUvRUlQRjd0NEFCT0tuMTJsS3RxL1d3Y0xqVWpvY212?=
 =?utf-8?B?cHRaMVpnVGl5TWRCcENxNFgyeDdLT2FGcm5ndC9zS2FURWg1elE3QlgwdDY0?=
 =?utf-8?B?YVV4eEh5alJyZEtudHBkK3E5Tks5aExZNzVrN1I2ZjNVcGw2dWZDemVGcWUz?=
 =?utf-8?B?enBCQzZMcDBJaTIvTkJkODFBcW1DTzUvbVQxbWlhcVMvYXAyNHF2WGJjRXU2?=
 =?utf-8?B?UXlRazdSUVNRTGl3R1V2Ymh1ZkN4TmVLZTFvNW51eHZ1eGhPUTNmRStzOTZu?=
 =?utf-8?B?blFvZG14ZkxPb2NxWm9NdUxZM0paYkgxNmRHeklOU3RMYit5VFp5OU4xRk9L?=
 =?utf-8?B?ZkNjM0c5K1p0cWhRdVlhcXFjbzNpcTNLUTFuRmtzSTdkUCttbFdLVGJ3VDVH?=
 =?utf-8?B?VkkyTk4vT1JtVmZCd3puZ2dBNEtwczdlcTV0S1NKMk1Na3orUXg3Z3M3WU9G?=
 =?utf-8?B?UjRHOWY4NEVUVGgwNk1RR285WHBLZitlcWY4a2NadHFFSHZ6dms1ZVY4d2FS?=
 =?utf-8?B?dzNoK1VoMC84ZW5nOTBaMDhCUkRDTFhzWVZzT2RIQzdZbSsxNDQvSE5HQnhh?=
 =?utf-8?B?N0diN3NzblRHK0htclNwa2xuR3VQakRNV3d3MlJrck05bTBpeTl1SlJJaWZ1?=
 =?utf-8?B?TGFsRUJDakZoWXVhR0pPVzlIamlib045UlkyZVhTQ1NJRDgzM0xHVWU2MFBj?=
 =?utf-8?Q?mgoA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <747383FDB446BA4EBF98B7D12131A215@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee4a8bf-f293-425f-1c37-08dc852dbbe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 07:04:25.1634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6h7WtNurZzoL9c4mmw9MoJqEVLSpewmOmW1t5Rt9+oeKrRDkP+kvig/sUGSEf2DEPbynPw7sa6DP/trX11Iukg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7889

T24gMjAyNC82LzUgMDE6MTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wNi4yMDI0IDEw
OjE4LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBJIHRyaWVkIHRvIGdldCBtb3JlIGRlYnVnIGlu
Zm9ybWF0aW9uIGZyb20gbXkgZW52aXJvbm1lbnQuIEFuZCBJIGF0dGFjaCB0aGVtIGhlcmUsIG1h
eWJlIHlvdSBjYW4gZmluZCBzb21lIHByb2JsZW1zLg0KPj4gYWNwaV9wYXJzZV9tYWR0X2lvYXBp
Y19lbnRyaWVzDQo+PiAJYWNwaV90YWJsZV9wYXJzZV9tYWR0KEFDUElfTUFEVF9UWVBFX0lOVEVS
UlVQVF9PVkVSUklERSwgYWNwaV9wYXJzZV9pbnRfc3JjX292ciwgTUFYX0lSUV9TT1VSQ0VTKTsN
Cj4+IAkJYWNwaV9wYXJzZV9pbnRfc3JjX292cg0KPj4gCQkJbXBfb3ZlcnJpZGVfbGVnYWN5X2ly
cQ0KPj4gCQkJCW9ubHkgcHJvY2VzcyB0d28gZW50cmllcywgaXJxIDAgZ3NpIDIgYW5kIGlycSA5
IGdzaSA5DQo+PiBUaGVyZSBhcmUgb25seSB0d28gZW50cmllcyB3aG9zZSB0eXBlIGlzIEFDUElf
TUFEVF9UWVBFX0lOVEVSUlVQVF9PVkVSUklERSBpbiBNQURUIHRhYmxlLiBJcyBpdCBub3JtYWw/
DQo+IA0KPiBZZXMsIHRoYXQncyB3aGF0IHlvdSdkIHR5cGljYWxseSBzZWUgKG9yIGp1c3Qgb25l
IHN1Y2ggZW50cnkpLg0KT2ssIGxldCBtZSBjb25jbHVkZSB0aGF0IGFjcGlfcGFyc2VfaW50X3Ny
Y19vdnIgZ2V0IHR3byBlbnRyaWVzIGZyb20gTUFEVCB0YWJsZSBhbmQgYWRkIHRoZW0gaW50byBt
cF9pcnFzLiBUaGV5IGFyZSBbaXJxLCBnc2ldWzAsIDJdIGFuZCBbaXJxLCBnc2ldWzksIDldLg0K
VGhlbiBpbiB0aGUgZm9sbG93aW5nIGZ1bmN0aW9uIG1wX2NvbmZpZ19hY3BpX2xlZ2FjeV9pcnFz
IGluaXRpYWxpemVzIHRoZSAxOjEgbWFwcGluZyBvZiBpcnEgYW5kIGdzaSBbMH4xNSBleGNlcHQg
MiBhbmQgOV0sIGFuZCBhZGQgdGhlbSBpbnRvIG1wX2lycXMuDQpCdXQgZm9yIGhpZ2ggR1NJcyg+
PSAxNiksIG5vIG1hcHBpbmcgcHJvY2Vzc2luZy4NClJpZ2h0Pw0KDQpJcyBpdCB0aGF0IHRoZSBY
ZW4gaHlwZXJ2aXNvciBsYWNrcyBzb21lIGhhbmRsaW5nIG9mIGhpZ2ggR1NJcz8NCkZvciBub3cs
IGlmIGh5cGVydmlzb3IgZ2V0cyBhIGhpZ2ggR1NJcywgaXQgY2FuJ3QgYmUgdHJhbnNmb3JtZWQg
dG8gaXJxLCBiZWNhdXNlIHRoZXJlIGlzIG5vIG1hcHBpbmcgYmV0d2VlbiB0aGVtLg0KDQo+IA0K
PiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

