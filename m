Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EBC957DED
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 08:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780035.1189627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgI6z-0007ju-TC; Tue, 20 Aug 2024 06:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780035.1189627; Tue, 20 Aug 2024 06:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgI6z-0007gt-Q1; Tue, 20 Aug 2024 06:12:57 +0000
Received: by outflank-mailman (input) for mailman id 780035;
 Tue, 20 Aug 2024 06:12:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ZGS=PT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sgI6y-0007gn-NU
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 06:12:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2417::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cd33ce0-5ebb-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 08:12:55 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB8593.namprd12.prod.outlook.com (2603:10b6:510:1b1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 06:12:51 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 06:12:51 +0000
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
X-Inumbo-ID: 3cd33ce0-5ebb-11ef-a507-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3FJ5Tyxi6yg7ury7RNBOYClLX/tYsfCFeI7z1tMZocXYaLuSo+TK/MbMisrx8TKhk80le1dSH7ZpMC5/iGwM1hL20C0oArLoiJXD704vWTVVvzDedMXjPGy+Zqd/d+UlVknGNLzvZqGBzdqbo/q4LXdbIOECEaWQm2JHldjnwjc8w45k1xFrcJD60Dq4GbPOjMwqQxlTSbvVLi1COTGKuXte03v/yPFapaGLjpEg5XFQqbnyFXRzr/pLIQAJiIH8YwYt8yxt8DVzzhdlvSDZIp4KhCfEzSZezhpm2y9mhPr0OTbGFGd6+uWwsrowuayRb1vngq14BicyE/6LRRdng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOX85DeANSd3PGl8QdSsA882ADmI/bLRfN2SMsCyVJE=;
 b=Vs+abFIfBxg8k0vVCYaV/u7vAYR7/DhVLJDSkn2EFDBRvjkhyTEk4ABGPEIyUtlLTApCqAhGBci45zoN1NIA03oq8oKf1cEG4Ij/LwjNq07MQPZpF2qWknF1krkClTmEDhbCsHf/JnTHZLqlCuU4MBS4BUZQMlKinws2mziBb1r8GyEUmSwx5ASdGc7wiAW5sSBVxQypIW9Hle8uiB+Rlc9ceV7atykM8blryAg3FsrIro1d4WEqHIY52UZy+kAVlZeRZp1fpdGJZfvSF/aFjB26r18cGvoI/ahI1Rf8F8WTt+W9fj+mTZgG/PawDFQgG3mhnkW2N189tncQwgqUtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOX85DeANSd3PGl8QdSsA882ADmI/bLRfN2SMsCyVJE=;
 b=RHJtfT6+H5YsnXhoYf+RSYd56vOGmf5glTT4Y8jjCbM5boIjsxhjj6c30tr8xNdppoxjy5pjfqeorZQVBq+UebYiqNVBSf5wNU514WolXPOIxexlvB7CQ7AERVtgsx++byVOgDblTHYcyS4cjBCf95G1gorvnB3Ps+8uONmaquI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v13 2/6] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v13 2/6] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHa78ytu3Dw7+A5rUaTPQAvAsIAxbIuTvuAgAHk7QA=
Date: Tue, 20 Aug 2024 06:12:51 +0000
Message-ID:
 <BL1PR12MB58492B55B496755585774CB0E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-3-Jiqian.Chen@amd.com>
 <4a421c07-d8a0-4af9-816f-5d76d39fe31f@suse.com>
In-Reply-To: <4a421c07-d8a0-4af9-816f-5d76d39fe31f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7875.019)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB8593:EE_
x-ms-office365-filtering-correlation-id: 8042cfd4-fbb7-4afb-321e-08dcc0df1f43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WkRONnJiN0pYcUk3NVZWeDBUVFpBSVZiZWdpaGNlanVhaW9YVndMblYwaU5s?=
 =?utf-8?B?VEFQRnByWnVMUTJmb09VM1JINGd6S3ZwVEVmT2RMZGdBZDIzbW45TERESy90?=
 =?utf-8?B?YmdYeVNpMlhuQzJWTjAxWUx1Y0JkSGorcjVFaEFhVW1JUjZVSXg1Yy9IaUhm?=
 =?utf-8?B?eEdkU282Y3YrMUN2VWNNOXpvYS9NU25semxXOHAzYlpaUDV2N3RBb1J3WG1M?=
 =?utf-8?B?MHFjQUxuSlhadlpuR0I5M2hqaFJPd1puK0YwTnZ6T1RNRHNLOGNyTkFCOTYx?=
 =?utf-8?B?cmNFN2l1QkR5bnByaEdrc0ZvY2dWQjcxOWQ4ZWlIQlRoYlNIdFZFU3oyK2lF?=
 =?utf-8?B?cFkzOTZmTmxVQ1hPYlltZXhFb0hlcEpwZm9uR3pvditZV0FnYnpheWZicXAw?=
 =?utf-8?B?WDJwS1JQaDUxalZTR1duTFNLLzhPN3c2WlVTYnBZblREK1dBbFc3dVpZUTky?=
 =?utf-8?B?cVRJS3BXQ2VEWWpRYU9iSmduYjdWbE1Ic3diK0VGY09zbGxpTVAvWDlkaVZJ?=
 =?utf-8?B?eWExR3dNdURwQUNnY2xseS9XSk1sL2xvMDBIZlVQSFl0ZUdIQzhoS2hOMXIv?=
 =?utf-8?B?Wks3N2g0Tkg4ZlFhQ1VPcjIvR0lKaU1oT3NQUXB4aUhKSzZkYm9sdmsxOGhY?=
 =?utf-8?B?d1hxblVSdTNBcjBqWGNpYkNhdnlEclZJNEtMbHBHVXNWUnlHL1NIbEptVTd4?=
 =?utf-8?B?bjk0Rlljdm01c1MzYzg3YTBZbnNvR0xYOWZOcDBZVFU1NEM0cUEvZGFvYmh5?=
 =?utf-8?B?dFNFcFlhV25CSHkvOGUyaCtwMXBZVURZcGF2MUJRZ1B4UUZxTlZKVlZKZFNJ?=
 =?utf-8?B?NHordWJqK0tIY2JiMFJuUmJzUzJNTmk3TUo1TzFDTWVWeFFyN1Z1RTQrTXl3?=
 =?utf-8?B?dTA1WTZsYU1HR0F1azdEazZiQkV4NFlmdGg0Z0M3QVRLRVpYRVVyaWQvYmp6?=
 =?utf-8?B?RWY3eGxZLzBTRys3bHhJaDBsR1pQVE5tMjdob0FLcUw0NmJqNVpjWngwZ3Np?=
 =?utf-8?B?UEZHL1B1MVZUZ1pwUEx5NEx0TVVEcXV6T2Q0OU1PR2dyeWxuY3BCaDVCN0k5?=
 =?utf-8?B?RW9zRU82eG5zNmNZVDd5SDFoUmtqUDUvQ1NjLzFWNzJyL3NQVUgwV2xad0pS?=
 =?utf-8?B?RnU4cG9VMXRRdy9sOHhsdlhWTk9USVRxSjc0YVVUTU9zblllNUZ6VFIxNUgv?=
 =?utf-8?B?dFpnM1h3N1BZMU55NzZWaUw0SlRaSDdrcmF3b28rNW9FM0JVVXFadGpjR0pZ?=
 =?utf-8?B?MzlFK0lPOXdSVG04ODNDbG51SFlMODEySFd5azQzcTJlempMcDFET2xSNjNi?=
 =?utf-8?B?cVZIK3VSU0JVVFA2eEtwYUFhMnFGajhibklueXBUWU5aRkwrdHk5RVRqVTJp?=
 =?utf-8?B?dFR6ZHZ1THFQTXlNaVM0QVdhOCtZUkcwbjZqdy93SFRvdG9PWGFFampMT0h5?=
 =?utf-8?B?SEdQNEVlOEJzNXpRV1hOajhKRldRQ3hqTzJuc1BLT3ErWVhBNFdqei82L2dN?=
 =?utf-8?B?c1dVOWRxdFYyZjB2R3lsR0wza1BVNmdWMzB2V0Y4Z2xQTWdlOCthc2UySXdC?=
 =?utf-8?B?R3VMT2RWSVBhNEpkR2RFN0NKVlhRMVFYeUl1Z3FoOFZsTGxnUmpUQ2FwTmtZ?=
 =?utf-8?B?ZTNheXpDVEp0OFFyem9MZXozMTkrcUt0VkQ0bVZLUDlKT3ZHbWo3TzJ0NlJ6?=
 =?utf-8?B?ZEkxNWJGelNjbEJYTXk3Q3QvV3d1QmM3VmFxaGtlTFNXOHRCeENxU1ppcE1o?=
 =?utf-8?B?alhzakhLQzd4aUpOZHVUTFFCVk9EQzZqUy9DUEQvTzZMb0x2SzdyNTlkWFVO?=
 =?utf-8?B?cU9zVTdMSVNWSzZPQjFXM0gzRDRiRktiN2YrTWdDTktVb1NVY2VZd1QxQ2Q5?=
 =?utf-8?B?d2VmUU9vTkRYZCs3bTV6bWgzS3lYS0krelRqU28vRDl0Tmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXFEbHJSek5wbHFFeTN1a2JoajZDVHg3elZzMURMbmRManhzTjkyVTRDcmph?=
 =?utf-8?B?TFdRajEzc1dXZEZnTlBaRkJOZ0FwUUZWMXRFT1ZRVzVRZ0FXSk9ZL1Ywb2xJ?=
 =?utf-8?B?RUtBN0pFTWN5S2JOWVJRdS9vTi9jZy9ZeHljRmpjL3FteXhZRUtKYWtiYy9u?=
 =?utf-8?B?bHJDZ2NNQ0ZMUGkyQzh6b0hKUElobkFCZTRhMjl5TzNCcitsemgxNHJMSGJk?=
 =?utf-8?B?TFhFNDEyRVpVcEdjVjE1Smw5YkxRWUF4ejBaZkVKMlgxNEx3SGtvV1p0bkIw?=
 =?utf-8?B?N3VjbW1HVFdNTzZrQ1E1bU5TOHBCdVBzVU9ZRHVOazArLytYS2pjd2R1a3ND?=
 =?utf-8?B?aWdqNUhDOFRMb3VaTlAvUDJVenE4dnErT3l6QzcxTDVWVjJtN0p4RjBINjlk?=
 =?utf-8?B?MlpMNjFSRGQ0SlNTTWtRb3lEN3FiWk5oNFJpM3ora1JpdHJ4Mys5S2NIdEUw?=
 =?utf-8?B?OFREdFBMeklMQUNxeWZxZ2Z1MVFoLzBpVkU3cFZtTXlHaVhvQzVVRUFlWUNr?=
 =?utf-8?B?UDFKdzl3M3UvOEVia0NuTjdIQld5eTBGWlJOOXJyc1ExRXhGdlBDUkhWMWQy?=
 =?utf-8?B?dExxc2pNa3NTMTBkdlQva3JwTFBSamRmbHdZZ2cwanEvdDN5OUNOQ1dWZXVX?=
 =?utf-8?B?aHI5SHNlcnErSW40U2JRcksxRFAyejNZRUsyWXdzRUtFRzBEc1ZEaGZmQjl5?=
 =?utf-8?B?ZDNNS2FPYS82bkMrWVNEL2JvVWs0TjY3MDNTdFR5WXJuRmwweFFPRGlnVDVs?=
 =?utf-8?B?N0xpRFF2dHRFamx2MC9wL1FyMy83Mk9UYVA2VFd6cjBDNDNObDNSL0hKZHVR?=
 =?utf-8?B?T2Z5M0hmNUFUMnNQOTltcjBLTVVFcTRtajVrR0xjTWVicVpGa2tXRWlCU3lx?=
 =?utf-8?B?Z1puYVVMYlRwdlFvQW9YUXdOOHRwakl1RG1UbjZ2a1lnWjhJOHZ5S0l0bU1G?=
 =?utf-8?B?c0QrcjN1dDB0NXlFbnpXdTd0MWNwMThLWXlpbmtRbVo4NDVQelJFRmR3dHpt?=
 =?utf-8?B?dUp3S1l6ZVdXY1J0NE9ONlR5S25YWGxsbnF3QUFBMDlJK29PVzJyTVNQN1pw?=
 =?utf-8?B?T2lJdjJsM2tqa3c3QnBBeXRsK1VYWEIvbTFIYjBUTlhmSVhpSmtsa1k0U2Fk?=
 =?utf-8?B?U3l0VjRXTEhQclBkME1wdHc4VlNBakRUb0RHSHgwem14M2owYmhDeFZzWGdy?=
 =?utf-8?B?VUpHOWxqc1RIUHhoV3VaR1o4RDRMMDRZRlQ4anpFWG81R2xzR1lHT0lWVXJq?=
 =?utf-8?B?TXMwRnE4cnZGbi9MdDViazdlK3RscUlVb2FKSjNUMnNoMy95cGZ4WXNKWUgw?=
 =?utf-8?B?TXlTZzlpMDNEUzZ3Um1OMERCYlQzUUtLOFVraUd6TW5hcUZaVC9iZEljcEQ2?=
 =?utf-8?B?NFIzUXdUL2JYa1NRZlBqVG92VDBpWTFKR0xURHYydkpQa1lLYkkzWlg0cUV1?=
 =?utf-8?B?VktVN0N2dEltSGpTdERKNGZlYWtFL2VuSkwvWE15K01GdTYyWWVhOUJtWWpn?=
 =?utf-8?B?QVkyamV0bVJTcUM1clJBVXcwQ01HVmdUaGt1bVp1Si9PYUZDb0psaDFTU0NI?=
 =?utf-8?B?R3RTeXgzR2c1Uml3QnMycEpEWlZjMTd0aE5FU1pObGR4anJKZGlDVWJteDRV?=
 =?utf-8?B?VitBTFpLOGphVllYSzVab2JwT3VXTzhncVhtVmI5SDA3ZjhmYTVvZEo4N1dH?=
 =?utf-8?B?TlNYOXhTeFBnZW5qRDZGM29RaGVuNjA3SGc1Tk5TRXVQdFV3Mmc3ZXRhTWVV?=
 =?utf-8?B?MENscDFMYzNaY2JsTVVoYlVZdHZ3TWhrcnozQm5NY0ZiNC9TZTE1a0lYK3pX?=
 =?utf-8?B?MnBYRzlvM0dnNHFySXdva0krL09aUXNoWE93YU1HMkZuY3N2cXI0dFJ0Z2Vs?=
 =?utf-8?B?OHpXRXY0T3cwNkc0a0I4WVltZHo4QklhdHhtTXI2RWl6c0JycFRCcnRqU1E5?=
 =?utf-8?B?T3V2TTJRRXdLVUJOcE13NVF5QWdHOXA5SG1rSis0VmFZSkUzb3RTcGdya1NS?=
 =?utf-8?B?TDhNRk41aitUbWVMWktZRXI2M1JxdWx1Tjh2eDBpQ1UybFluTUpnVDRoeEJC?=
 =?utf-8?B?RDZBakIvYlZYMXArQmhvZzV0Ukp1Z2hFSHRLd1ZWdGRWOUs5cVlodVB4OTNY?=
 =?utf-8?Q?ZsFA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C5F9B67C0E6F3438F733F1EB6678121@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8042cfd4-fbb7-4afb-321e-08dcc0df1f43
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 06:12:51.4320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RsdqZ6mjK/xzrLtDRDQSPSXelXCJO5b4xEn12GV5dGGauqn0T47NI6cIcH5vEwbsW9C0F6WUPBhHYf9UPaaXeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8593

T24gMjAyNC84LzE5IDE3OjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMDguMjAyNCAx
MzowOCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBJZiBydW4gWGVuIHdpdGggUFZIIGRvbTAgYW5k
IGh2bSBkb21VLCBodm0gd2lsbCBtYXAgYSBwaXJxIGZvcg0KPj4gYSBwYXNzdGhyb3VnaCBkZXZp
Y2UgYnkgdXNpbmcgZ3NpLCBzZWUgcWVtdSBjb2RlDQo+PiB4ZW5fcHRfcmVhbGl6ZS0+eGNfcGh5
c2Rldl9tYXBfcGlycSBhbmQgbGlieGwgY29kZQ0KPj4gcGNpX2FkZF9kbV9kb25lLT54Y19waHlz
ZGV2X21hcF9waXJxLiBUaGVuIHhjX3BoeXNkZXZfbWFwX3BpcnENCj4+IHdpbGwgY2FsbCBpbnRv
IFhlbiwgYnV0IGluIGh2bV9waHlzZGV2X29wLCBQSFlTREVWT1BfbWFwX3BpcnENCj4+IGlzIG5v
dCBhbGxvd2VkIGJlY2F1c2UgY3VycmQgaXMgUFZIIGRvbTAgYW5kIFBWSCBoYXMgbm8NCj4+IFg4
Nl9FTVVfVVNFX1BJUlEgZmxhZywgaXQgd2lsbCBmYWlsIGF0IGhhc19waXJxIGNoZWNrLg0KPj4N
Cj4+IFNvLCBhbGxvdyBQSFlTREVWT1BfbWFwX3BpcnEgd2hlbiBkb20wIGlzIFBWSCBhbmQgYWxz
byBhbGxvdw0KPj4gaVBIWVNERVZPUF91bm1hcF9waXJxIGZvciB0aGUgcmVtb3ZhbCBkZXZpY2Ug
cGF0aCB0byB1bm1hcCBwaXJxLg0KPj4gU28gdGhhdCB0aGUgaW50ZXJydXB0IG9mIGEgcGFzc3Ro
cm91Z2ggZGV2aWNlIGNhbiBiZSBzdWNjZXNzZnVsbHkNCj4+IG1hcHBlZCB0byBwaXJxIGZvciBk
b21VIHdpdGggYSBub3Rpb24gb2YgUElSUSB3aGVuIGRvbTAgaXMgUFZILg0KPj4NCj4+IFRvIGV4
cG9zaW5nIHRoZSBmdW5jdGlvbmFsaXR5IHRvIHdpZGVyIHRoYW4gKHByZXNlbnRseSkgbmVjZXNz
YXJ5DQo+PiBhdWRpZW5jZShsaWtlIFBWSCBkb21VKSwgc28gaXQgZG9lc24ndCBhZGQgYW55IGZ1
dGhlciByZXN0cmljdGlvbnMuDQo+IA0KPiBUaGUgY29kZSBjaGFuZ2UgaXMgZmluZSwgYnV0IEkn
bSBzdHJ1Z2dsaW5nIHdpdGggdGhpcyBzZW50ZW5jZS4gSSBjYW4ndA0KPiByZWFsbHkgZGVyaXZl
IHdoYXQgeW91J3JlIHRyeWluZyB0byBzYXkuDQpBaCwgSSB3YW50ZWQgdG8gZXhwbGFpbiB3aHkg
dGhpcyBwYXRoIG5vdCBhZGQgYW55IGZ1cnRoZXIgcmVzdHJpY3Rpb25zLCB0aGVuIHVzZWQgeW91
ciBjb21tZW50cyBvZiBsYXN0IHZlcnNpb24uDQpIb3cgZG8gSSBuZWVkIHRvIGNoYW5nZSB0aGlz
IGV4cGxhbmF0aW9uPw0KDQo+IA0KPj4gQW5kIHRoZXJlIGFscmVhZHkgYXJlIHNvbWUgc2VuYXJp
b3MgZm9yIGRvbWFpbnMgd2l0aG91dA0KPj4gWDg2X0VNVV9VU0VfUElSUSB0byB1c2UgdGhlc2Ug
ZnVuY3Rpb25zLg0KPiANCj4gQXJlIHRoZXJlPyBJZiBzbywgcG9pbnRpbmcgb3V0IGFuIGV4YW1w
bGUgbWF5IGhlbHAuDQpJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBSb2dlciBtZW50aW9uZWQg
dGhhdCBQSVJRcyBpcyBkaXNhYmxlIGJ5IGRlZmF1bHQgZm9yIEhWTSBndWVzdCgiaHZtX3BpcnE9
MCIpIGFuZCBwYXNzdGhyb3VnaCBkZXZpY2UgdG8gZ3Vlc3QuDQpJbiB0aGlzIHNjZW5lLCBndWVz
dCBkb2Vzbid0IGhhdmUgUElSUXMsIGJ1dCBpdCBzdGlsbCBuZWVkcyB0aGlzIGh5cGVyY2FsbC4N
Cg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

