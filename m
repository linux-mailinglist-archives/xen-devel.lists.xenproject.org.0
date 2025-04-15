Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72120A899E0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952585.1347990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dSS-0002fY-SK; Tue, 15 Apr 2025 10:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952585.1347990; Tue, 15 Apr 2025 10:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dSS-0002cb-PM; Tue, 15 Apr 2025 10:24:00 +0000
Received: by outflank-mailman (input) for mailman id 952585;
 Tue, 15 Apr 2025 10:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QN48=XB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u4dSR-0002cV-Ez
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:23:59 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2009::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd310758-19e3-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 12:23:58 +0200 (CEST)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by CH3PR12MB8332.namprd12.prod.outlook.com (2603:10b6:610:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 10:23:54 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 10:23:53 +0000
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
X-Inumbo-ID: bd310758-19e3-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocXSyALyKkipIPDB7Ih5U7zEMPUfNIieCVFtxculrN5qUpubG+zzCCOnnfQMHyHSxNKk/U+7j0gZHhtmShzTXHfPWeI5LvbqFnUOhRkWXHCiYiW2mRPMsaj12XHGwl922zhunpwkvTHIfZA3pzGYfE4rhBqnmGO1D/7TiKjXoYl3iL3UPg/8nyjZZaMVBPniJt5bBRAi8kdd1NnQXlo2VN7S+kV9cS9JCpnUOf7AB8BjUTDPZmF7lKtJALDkxPluJ99JK4kZWY25nb2C+l9BoTZS8z+Wtt5q0XgACBQJAsLU7+Yvt7FyJBPFhol80cLf0bMMtw1QwRsQ7w4EkquW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLC6A8T5ZtkHX5tkyLa2QuC5hT2TVObbHEjLESTidjM=;
 b=g8YqCrjBTSGVDN4IgeSaUFSBD4g9NzMSpUC3/1D1/PKYX8H6UJIhr8ZH+4kBe+Cmjq0LicKzMUC3e0HXOkEPDT9qcKj4Gfi+z3W37to11A8PMy4k/WLYOqSnSVo8bftj2IoH5frWFcIiTDgSKJypZ5b7Y+xrSTk9vAEV3NxMFT1zq7hwzeRjpdHz9sObK/tH0o48NbtXgCRvygLwAk1A8K5X3zInprWO/5YuJ6Si8B37DTrH+qS0xBtQVrIH+AYl/eGOus3ztN6pPVOceY7oIskGCWXwmtBfmO6OE6AYSEZ6UutMyLCGJo3Z1123aFjMptXyv2xcy30D+iX5/pVZPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLC6A8T5ZtkHX5tkyLa2QuC5hT2TVObbHEjLESTidjM=;
 b=x8UEyvwEBiMr5xBIPOo44+MTQ9xxqtNSUNzpmbFuzRZCZre9tc40O3VmjWSb1+6cMnW7Miy7TIOd6CiABLhstt970XH36VBAz0/jtI/OGT8ZRl75BiYFqXD6EMhKon02Q+30FkH4QH5RQDOfLmOYQ5hXYx++miTCeptSth3BNBA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Thread-Topic: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Thread-Index: AQHbqRsaTINnyZcO4ESL6xMBZUfUtLOkfmYAgACPYID//3zKAIAAiTCA
Date: Tue, 15 Apr 2025 10:23:53 +0000
Message-ID:
 <PH7PR12MB5854A3953963F171834CCB28E7B22@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-3-Jiqian.Chen@amd.com> <Z_4mAAm-gCmZTJub@macbook.lan>
 <PH7PR12MB58546CF210C99C8B835FFC4AE7B22@PH7PR12MB5854.namprd12.prod.outlook.com>
 <43993568-030f-4182-9346-162d48099b7b@suse.com>
In-Reply-To: <43993568-030f-4182-9346-162d48099b7b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.8632.030)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|CH3PR12MB8332:EE_
x-ms-office365-filtering-correlation-id: bf24c335-c12a-4ae4-baa1-08dd7c079f80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a0FjbW9ITlpKbVhPd1JuV2lybWMwNEhGK3pSUEZHM3hrdkkrUkdBbHRZWXNa?=
 =?utf-8?B?QUVHLy8zRjRoTStsZVVZZWtqMk9aSEtjeHcrYldLMUIvUkprcTVrU2tsVmtC?=
 =?utf-8?B?dmpvRHV0Ykg5K2xDRk5ab1crU3JtZ2R1S2cwZXlVR0kwcWNIZ2V4ZmN1ZGRU?=
 =?utf-8?B?R2lWS3ZERnFCYklaUXRYVnRjUndaYjlSZVVVVXhqNTE3a1VQQmYzcHcvUVlj?=
 =?utf-8?B?dzhMcnErTEd0WVBXM0J4TXJVdlBkVzBBS2VlQVN4NjZ6K1ZsWit5cUtSVUxB?=
 =?utf-8?B?TUtqU3RiVHY2bFl6WUMvRlVRMzVLMkh0cVJZMWlLRDJIVkhjSHdMZHgrMTVF?=
 =?utf-8?B?Nk53Z3djWUFHSmFmcUlXRStTemVGaERScGhnckxoekNpMXBTVWQ0MnNqaHdi?=
 =?utf-8?B?bWhxSkptUDRuNmlMZjV2M25HMHBGUmJVTWR1cnpOQk5ZaW1UR3JKR0xobUVH?=
 =?utf-8?B?N09TWFFTT3h4cU9YUldCeWVUTmMxSHZXa1NUWUpjYjkvU1FCaDQvWWVLaXlM?=
 =?utf-8?B?STF2N1J3S0JtQ284RHNzOWMwNHRVZnYxc1crT0x2ci9RZU1jVDkrSm9qd3lO?=
 =?utf-8?B?SG9KOGFVMW9pK3FxTlRmUmZpS2FWOGdxNDFBdjFGT0RFUE9CUFJzcllkMm81?=
 =?utf-8?B?b2ZNS2IxWk1DME4zS3JGak5oTmxyMkh5STVNMUZFMXFmSmRUa2hBN0JCQzFI?=
 =?utf-8?B?dmdUdWdlaEtReWs3b0VhQ2Z5STBSbFllYVo5eFJEOE9QZ1d0R21pWGNGN0VN?=
 =?utf-8?B?RmNBTkJma0xncFd0K3IyTUJ2M3l5b2dhUi92QmJibGp0bUV2a3MxUU1pY21U?=
 =?utf-8?B?eVNCcDNoL3lVQlAzTkY5TWJSUkh3eUYyb01lNkZsb0ZPMlRCY3haWWNNYmEz?=
 =?utf-8?B?NTNQTGliS2x4eENQWUV6V3ZSZUhMMGtZanZjdFRuQ3ZCRXdnL2NzUUtSZmsw?=
 =?utf-8?B?ZVk1bVB0aldUM0IydERMVjkyRnM5emdRUWlBVFVSaWNNYlF3Qi94bjZDOHFx?=
 =?utf-8?B?bUVjQmVvblNRWU8rQnY0SFZsN1grSmJ4OXppQ0FnVmVXVnNGazBXdTlUN2FW?=
 =?utf-8?B?S3Z0N3RFclNHUmVUT05DanVJN1ZJZjZHb05uZU9IRG5xVGRQb0FrTnlaMFpR?=
 =?utf-8?B?Y2RNQ1VkWnByV1NweXRCQUE3UVMwaVY2OUVaYlYrOGQ3UjdNVEk4eUJVM3cx?=
 =?utf-8?B?bW1Qb2x5VlRvVktWYndhbjQzVjczeWlGRFBYNVc0eXlaSFhBVmUwZlhCdUNa?=
 =?utf-8?B?UXpLSGJGcU9vSjl5cjlaVFJ4clFzazQ2ckhrMjBndE5kVFA3Yy9XV3VjQXpN?=
 =?utf-8?B?QWIyQ0tEUVdQVFpvUGhDUVdaLzNPelZrWU1Fd0ZqaHJlcXRDVWd2WUxmbGYr?=
 =?utf-8?B?SXpxVnVTODRCL3lTM1ZHV29vVG5jZlI0UjVtTTlId3ZGaWZWRjVJdTA1Mi9L?=
 =?utf-8?B?QkJDUDhuUXhwWUM1K0VEbU9zUEdBRzB0RDF2WXI3R2ZIMERLQ1FrSEc0Q2dX?=
 =?utf-8?B?a09oK0I2emhmRE5US3ZaV09rRENZTWpwSDNzcEFqSTJpT2l0aTl1dGgvb0or?=
 =?utf-8?B?STNDamlFT1BSN3AvQ3d4dExJNlVJRHZxVmJSNUdXQmJNb0p1UDk1QWhBeHhF?=
 =?utf-8?B?TEp6MUw2Z2d3dnd4c2hBY1lmSkNsMmZETU1yUTErbHdncGJxUW9lK0IzL2hz?=
 =?utf-8?B?a0pkaHJ3L1J3WTNNekx6bGhUVVRnZGh4TlJIU2doZ1JWUStBRXJyRnJQTkpx?=
 =?utf-8?B?Q0FaT01EU095cXRJajBwdWhFZStLcTg4MU9hbCsrc0QrM0RzZ25wNzdRNS9R?=
 =?utf-8?B?SVBzaGxnWDhkNHBLQldraEhoSWlCTmZ6VGxKUFJDZ1pZcGhxVlJWYzhJVjN2?=
 =?utf-8?B?SWVQcnZ1UmhLL2xrR1ZUOEoxY0YyNnR6enBCbFFkWk1IRk1UZUdWUlR1OVdD?=
 =?utf-8?B?dkRmY3VsRm9lMkdRS2hXNkc5a2tGNDhlTVVBa05kZjJsaENldzVTM0FFZlBh?=
 =?utf-8?Q?YEUJ0FsE+kDUXVkMXg0EYcptF1eg64=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2QrOFl3OTZHclFFMFJpS1I1QnprS2U4ZGNyanFac1h1ZCs0MElHbXBaZ3Zk?=
 =?utf-8?B?aFBHQThZZWNXazdRMkJOdFFEQXlLVmE1QXlLYkdscEN3cTJLN0VGcEpiQksx?=
 =?utf-8?B?b21ia21rVlJob2loVWxWbW45UHpNL3E2ZUlGVWhZdUF3VDlrVDZvcHlRb2hj?=
 =?utf-8?B?SmdJSFRYNUlIVElnbGJYQlJnNHFyVlVIRlR3RVF6RWF5d3lxSjgrTDE5Szln?=
 =?utf-8?B?VC9xMDZMeHBJeGhERjN3RktTV3NFcjRtMjNCeG02OURnY3YyVFhkSjBaZkRI?=
 =?utf-8?B?VlJkVTFwR1ZuRlR2aGNodzVmTWJ1TlJUbEp5aTBSdzFCWW9TL1Z1VVBOVWM0?=
 =?utf-8?B?YWZjYlptK1lrNHI5RTFWMmVFTUNoRXVUcHc2RFppS1o3ekk1eWh2UFQ0NHZL?=
 =?utf-8?B?b2JkODc3c3FTMjFzcTNQWmQ1OU5ENmlVMTIxTDV2MWp2cVV5dU53YUl6S0xY?=
 =?utf-8?B?MkY5OVJ6R0NZUExlQ3JCbzRYWjhaTXZYQ0N4SFpOMkRvZHRseVlETVU3bHZG?=
 =?utf-8?B?RUxNWURtdzdEMFJlL2pBT0ZZQStXZTVvb25yZnM2b0s4L0pSbGRUUll2ZFJZ?=
 =?utf-8?B?TkptUEZjWHo0d1g1b0owZlNDZ20yYTA3VHU3STZ2MWh1YU9Kc0lXN1J6WEN5?=
 =?utf-8?B?enVXaTMzNGo2V1pydU54MEZIbkduazdrN2lVczBuNmttWXZseE1CdjY2aFo3?=
 =?utf-8?B?eDREdE9odldPQ1RIdXBzYnR0N2F6NGFGaVVIdmwxNS9NZkZJOXVBOWtjd2dS?=
 =?utf-8?B?Y1VKRW1aRUJ2dTY4c1kwRTFVOFBsanF3V0UzMHlXRy8ycHBVbW9ldkJQVFlI?=
 =?utf-8?B?Y1ZRa2k1TEVJMm9LMTViZTNhVTg1WTNvVFJNL3ZWbXE4anBKUjZWaFZBRkxx?=
 =?utf-8?B?Q1dHL0syaERLdG1KRXl6cDFOTjBlVjIvM0UrclpMcTVHSXVpcUhRYjFVSjJm?=
 =?utf-8?B?cGJUZGVNMk5ocjJhZmF5RWVqRzYwSm02cFI2REtsK1p6Y0ZTTUk4bTJJRE40?=
 =?utf-8?B?bkZRR1JYNGRJc1hkU05qUDA5aUNpYUVlYUVmWFNRWlNQTXEzSk5BTFNiN01Y?=
 =?utf-8?B?dEZjYjJYUC9ERjkvbmZ5eGRLMk53aVNSbEF0b1BhWHlSRXhwZERyOWpSVVNo?=
 =?utf-8?B?VldSV3Q5UXo0a0VjZGFlYUsraWdWSmJYbEdQYXBYUFR4Y0dLTVc0QndtdGlz?=
 =?utf-8?B?YklYQVk3NFpaa3JaVkowNGd4VDNQU002dnROUnpsOUdVM293bm5JTlFVWEhZ?=
 =?utf-8?B?T0RsOWlvaVB3c1N3b29RYjI3UWlWLzMrQUljdHpSTzBqelk1VVowamdHb25w?=
 =?utf-8?B?UGdRNHoyOWMvcnR2Z2xnRnRKZnJIcGNjWkJZQXlGaGxrbVRQOHczOUlBdE45?=
 =?utf-8?B?bzJWRzNjdnVWakF5RzhobDBGYWI3dWt3eGtiSlFlRysydS9XUlR2S3MzMWEv?=
 =?utf-8?B?Qk05bFhoak5SWmpCQ2cvbXh5YnRZSkJ3TVp0OXNkMmltRVpZN09zOTM1ZmRJ?=
 =?utf-8?B?RDFIOTF1czR4VC9hNW5XVGtGNmQ5Y0xXNlRoMWdqTzF3OXFOVnBPTXd0Q3U4?=
 =?utf-8?B?emFwTFJrQWo5ZDYyajI2dENBZnI0SlhkVWV2eGNEMHl2N3pzcER5dExZdGRw?=
 =?utf-8?B?QWxzYi9neURrbk9OaGFYUVRKMHJkWVhEUUh3bWxLRGV6RGNtc0FTYXdtRU90?=
 =?utf-8?B?WDNHTlNtMFZQNGxBQjE4VWJTeTl6TlhIT2V5bE5UNmJlQVNNcjk4TWZ5QXZi?=
 =?utf-8?B?SE51Q0ZxYUZlOUZRNW5nNkwvam9oNzloQWtKM3ljNUNGV0dmMlRBNmVZbmJn?=
 =?utf-8?B?d3FtTXdPdlk2cTBTVE9PUlRZcDQvUCtMbktKTXgvRDRjN1NTYmVXTHVncGdw?=
 =?utf-8?B?RnlqMDhUN2Roc0pHU3E4UDhEWlBjMWF6cWxiRWdtT0VPZWNzZ2RuQmp5M3Ba?=
 =?utf-8?B?QUhkREEvM2pvWWpqek45ZjNndFpVclI0RnJQb1RMd1NxS2hzU3RSNUxaMUl6?=
 =?utf-8?B?RGZySnVpK21EUHlHQ1pzU1ZJNnltS1U4WjExRUFtMFRFWFJPQ0pWUUpLUHg1?=
 =?utf-8?B?MDlWYUJjaXE5U3FNdzFrbVFoWjRJV01LeWpwMXN2VkdSRVd1aW1ra0hzM1pL?=
 =?utf-8?Q?FpYQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CECFC32D39E78438EB1A4EAB4D0DDB9@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf24c335-c12a-4ae4-baa1-08dd7c079f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 10:23:53.8480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDgDdrubIAcRfj1+RVkcAvkKIgHSDKoP1/Puz7qTQqr7ghRvwkQvgEk8hWZY6HjyDfPqm52GwaS0mrIztKWfXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8332

T24gMjAyNS80LzE1IDE4OjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTUuMDQuMjAyNSAx
MjowNywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS80LzE1IDE3OjI1LCBSb2dlciBQ
YXUgTW9ubsOpIHdyb3RlOg0KPj4+IE9uIFdlZCwgQXByIDA5LCAyMDI1IGF0IDAyOjQ1OjIyUE0g
KzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hl
YWRlci5jDQo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4gQEAgLTc0
NSw2ICs3NDUsNzYgQEAgc3RhdGljIGludCBiYXJfYWRkX3Jhbmdlc2V0KGNvbnN0IHN0cnVjdCBw
Y2lfZGV2ICpwZGV2LCBzdHJ1Y3QgdnBjaV9iYXIgKmJhciwNCj4+Pj4gICAgICByZXR1cm4gIWJh
ci0+bWVtID8gLUVOT01FTSA6IDA7DQo+Pj4+ICB9DQo+Pj4+ICANCj4+Pj4gKy8qIFRoZXNlIGNh
cGFiaWxpdGllcyBjYW4gYmUgZXhwb3NlZCB0byB0aGUgZ3Vlc3QsIHRoYXQgdlBDSSBjYW4gaGFu
ZGxlLiAqLw0KPj4+PiArc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBndWVzdF9zdXBwb3J0ZWRf
Y2Fwc1tdID0gew0KPj4+PiArICAgIFBDSV9DQVBfSURfTVNJLA0KPj4+PiArICAgIFBDSV9DQVBf
SURfTVNJWCwNCj4+Pj4gK307DQo+Pj4NCj4+PiBJcyB0aGVyZSBhIHJlYXNvbiB0aGlzIG5lZWRz
IHRvIGJlIGRlZmluZWQgb3V0c2lkZSBvZiB0aGUgZnVuY3Rpb24NCj4+PiBzY29wZT8gIFNvIGZh
ciBpdCdzIG9ubHkgdXNlZCBieSB2cGNpX2luaXRfY2FwYWJpbGl0eV9saXN0KCkuDQo+PiBCZWNh
dXNlLCBmb3IgZG9tMCBJIGRvbid0IG5lZWQgdG8gcGFzcyB0aGlzIGFycmF5LCBzbyBJIG5lZWQg
dG8gc2V0IGJlbG93IHBhcmFtZXRlciAiY2FwcyIgdG8gYmUgTlVMTCBvciBndWVzdF9zdXBwb3J0
ZWRfY2FwcyBhY2NvcmRpbmcgdG8gdGhlIHR5cGUgb2YgZG9tYWluLg0KPj4gSWYgaW5zaWRlIHRo
ZSBmdW5jdGlvbiwgSSBjYW4ndCB0byBkbyB0aGF0IHNpbmNlICJjYXBzIiBpcyBjb25zdCwgSSB0
aGluay4NCj4gDQo+IFdoeSB3b3VsZCB0aGUgbW9yZSBuYXJyb3cgc2NvcGUgb2YgdGhlIGFycmF5
IGFmZmVjdCBob3cgaXQgY2FuIGJlIHVzZWQ/DQpTb3JyeSwgSSBoYXZlIHRob3VnaHQgYWJvdXQg
aXQgYWdhaW4gYW5kIGl0IGNhbiBiZSBwdXQgaXQgaW5zaWRlIHRoZSBmdW5jdGlvbi4gSSB3aWxs
IGNoYW5nZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJl
Z2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

