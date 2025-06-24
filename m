Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAC8AE5E9E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023283.1399247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTybb-0008Pr-8v; Tue, 24 Jun 2025 08:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023283.1399247; Tue, 24 Jun 2025 08:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTybb-0008Na-5n; Tue, 24 Jun 2025 08:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1023283;
 Tue, 24 Jun 2025 08:02:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vj6t=ZH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uTybZ-00088I-L1
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:02:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2418::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85da26df-50d1-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:02:08 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ1PR12MB6266.namprd12.prod.outlook.com (2603:10b6:a03:457::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 24 Jun
 2025 08:02:03 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 08:02:03 +0000
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
X-Inumbo-ID: 85da26df-50d1-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkwrc2+hn7NpB/bakSmizquOmrGecjwmp4gSXUwbWXw1GEmHbyMkvNSKq/bm1sz0Lh3WFkza2Kkg5LIbb3L4EmRf3n5mhhG7IM71zhCZx3DXhd4UiAJWeBfvSBPL17iCJ9PJFXrzwGLAg4MwlhpvLHdahj4lAIOM5+zhyKHETToz4prMR9ZKOquRmoc5AQpl9d56CoFFDH7qyzmTtDQ4eFWuRX2IPCuRxqj9kGMXOQVQi3N9SU39qdVAPR8w+gUalWhSbo3LgJ5dsWmv33ItUt3NoqjK0xI+/T2+pBG0M/wlER08f6lM6tm6t3BljgZzRTx63TbuPzXhPMz3vypQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4H55WUnEx4Z2Q3LTWJ1157yEqKV64s+HISe0A4fU8I=;
 b=b6FJDEWR/rfKysvIXdNWlvAsPB4yOhjkjDyRgNiy2UXUnbDJAT8p+07c5SrTzb0AcP5nvUPV4rGQRzsmTgN+wRlYhj+dXxYT1KNtwH5fgjhJQtxGQ7yBPW/eaBxK3+iuz8DdvmVtL5odD1Iso2yJke176jFN78mddi6nJ47ShoWwNjXjEYgkIB+dLaBroTSshv5q/rf6OLdZXOjIgbssOD5p8tlbOukSOGJl7g/REuIeajRfGPzYufn+vc+B2eOqVLAgMTdI9/xyexGqsYtzOjaGLQG6JFLetaX8KVzCVs4S1hxS1LZovYl751nJlSjFsftnDpisCRkYDrcR4yjlAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4H55WUnEx4Z2Q3LTWJ1157yEqKV64s+HISe0A4fU8I=;
 b=Ea2l6cyaxBIHBMvQzvvBYvYwiWMw/eq+SCte4nUNXFijKj7qcjmuECSVeYlhuT3ndqzJMI40JBeOxdH6HvZaoA8s4FIT29mchn/RSc0nJq6WDpa0GRbkRdWJX43R6nbsq6ECvIy6g9EQ7tnJgiqL85SAQEqIz64M7LV/kJRBr50=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index: AQHb23yakGdVC9XxvEWnYcnp8zrTt7QI/QAAgAGa9QCAAQzVgIAG5D6A
Date: Tue, 24 Jun 2025 08:02:03 +0000
Message-ID:
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
In-Reply-To: <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ1PR12MB6266:EE_
x-ms-office365-filtering-correlation-id: 7f9fc2e4-393e-4215-bea8-08ddb2f567e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1dIbGkvWnhiSWN5SkcxZWhXdmFxZ2lNeUZNVTFqdGJyZGx0bjgzUlFIOURl?=
 =?utf-8?B?dVZaYk8rZW9zTVNQVXNwem1jeUoxdzF6d3poL1dZUFN6ZGxTS0NyRGVJdDFD?=
 =?utf-8?B?eEhNcWR0Wml4STF2RmFCaW5FN3hYYzlUM2R4WU9vS0srdXMvZmYwQ0RLM1Vx?=
 =?utf-8?B?c2xqZFpTcHVFNkFPY3BRdlRpQWVUMVo0T0dObHc1VnA2WjFzRmRMQWMwK0JM?=
 =?utf-8?B?dXZuZUtvOW5IeFRNL09jd0pNbWJvdEYrRzdsY0RlSTd0K2g3M1pHNENwWUVp?=
 =?utf-8?B?ck16UGl3TU9vakJKMlZvL1B3OVhKbWVhNEpIV1dqdGJIS2Z5bUVpNC81SGtE?=
 =?utf-8?B?S3RGYWFJWnVOVGgwMG8weGtKc1FsQ3JId1REMk5NYnFGMEZNaU1NQjQzVkc0?=
 =?utf-8?B?bTFUcGlVMUFJekoyN0VpWmhPSzJmRmkzUUIvK0oyMm9zVVJiL3RUV2VFTmZL?=
 =?utf-8?B?WlhtZjFXOUJvSTBFQXlWazF2Z29LV2NMZVVINUVpQy9yeFZjdXRGUEhmK3JZ?=
 =?utf-8?B?MDNvREFOZ3JES3pGdWtlMmZNQ2IxajRBQS9xckpYRTFrVzlKRStGY1VxeWw3?=
 =?utf-8?B?bHp2aFQ5UTY4cUFTbWVpc2Y1RURXSVVXVzhsZm1zMjJZaXJlUXYrRGtjMGsv?=
 =?utf-8?B?R1pVd0t2U1ZYNDdDL2tUeUlHZVVSWXZycnp6UlNtSGxQWTdDN3o1Z1VMRmhV?=
 =?utf-8?B?R0ljRk9NdE1JMGdoRlptcjR2eHVJMzluTDRWd3prWlJOemxuZVVRYUE4dkVN?=
 =?utf-8?B?ZkpJNW42eUt5enlsZ0xKU3RmTDlaV0ZBSzMwWlNIQzNKQ3BBMEtqODQzbW8x?=
 =?utf-8?B?VjlYWUl1OGVGdW90TG44dXBValJ2cUZtQS9VMDN2U1NwWUdNZklNK1RuSlRT?=
 =?utf-8?B?VUZiczFzL2hHcWFIRjMwUHNQT0UvL2JveGJKZ3ByU3JnSkwwZzdybFZXWFVq?=
 =?utf-8?B?N1NxZWtTNXJ2SlNDcHkvSU1pTnkrcHEzbFdvcnc0MldpOXZIWkpTQmRFTjJQ?=
 =?utf-8?B?c1Q1cS84NWRVZHpuWWVPNU5TcVh4NS94YmJvVFo5RzRuL05JemFGMEdmZUUy?=
 =?utf-8?B?clJiT0NGRUlEMEFOMENNVHA0SXFNV1BPNzRPL2tZR3pIRjluWWwxUTMvT1hp?=
 =?utf-8?B?bUF5OHNLTWlTYzAwRzZicTBBbVFmRVp2Z1dBK0dvVzZlMGQyajJOY2FwU1VJ?=
 =?utf-8?B?d0hEVG4vRzl5dm44NUlSWmpwSDc0SWpLUC8rcHlGZFNUbndnVTNVWk04VUY5?=
 =?utf-8?B?V1NIUHZuZWs4OXVTb2JjQ2lpYUs5WEhqOHAycVNhd1loSTBucmRxWWhtcUVp?=
 =?utf-8?B?UFVZSFgzdjY5NzFyYmtITzhSZkc3Q0hUbnJDdGozaVl1M0lwUTZPNGJMRU9n?=
 =?utf-8?B?eURxSjVxakpYRzZHaGlDRTl6VUlERWlDRm90TFBPSSs4RVdXaE5BYWU3ME0y?=
 =?utf-8?B?b01DeDhac2EvRWxOcmJkTFlQMDNadGRhZ0toMzloazJvQTFybDB4RGd3SnZa?=
 =?utf-8?B?VXpnZkJRV3pVMlRRUFpvQVZabGliTHlMZ21LK3h6ZEtTSzhmU1gxTXdzbHlM?=
 =?utf-8?B?WjMyQThjSjRFb1kraFBMY0pYejdCM2d5eWpLK2Z3ZXRrRHNqS0RkQk9vK2sr?=
 =?utf-8?B?NEJJcjFKTURUTEIySDNXcUF6citsWVUxQjhlS2ExWmtFQ215Mmk5MUw0S2Iy?=
 =?utf-8?B?ZU40Q0ovTlNyNVdDaDh2NW8zaFJuQjg4bUdqcnZXT3E2UG9vUi9CajhFbVJs?=
 =?utf-8?B?elgwY0VlOXFldm4wT2c0bkhFLzMxcVJoNmY4Uk54aEJGdmtQQ3FiZzdVaXpY?=
 =?utf-8?B?VEUxUS9FZjlrR0g1ZWt4OTNLcmJ1dmZyOXZNbW9BOXUrZVQxdE5KTVlLUDVm?=
 =?utf-8?B?QWtxN2pnMFlRektMVnVzbENLVDB5UGpMbHlScFhrRDlIZ294ZlF2dHloTFhi?=
 =?utf-8?B?QXZ4Rk9LcGpHZVZMK1I2UG5kbDFaTy9rSzNyNmNkM3JseWcwWFl4ZzlCMjZx?=
 =?utf-8?Q?gPBQ35iqLSi3X9gj5rLyq+m1BSx6Oo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2lVZjZETng3dXNBcWRnY1JBU25WY2dhRkFQMU51cWJWMjQvNGRVdG9DZEdu?=
 =?utf-8?B?eE9mQWhXZXE1U1BZYWI2ci9QbU5jZmtOR0ZCVG15QjRCT3NDSkt2Qy9TNlc5?=
 =?utf-8?B?YkJhU3dLV0pMTDhNRisxdEFsNjQvUUpkUURVMlFQZG50TytudDFTR2ljSzBH?=
 =?utf-8?B?Uk5DSnhjdnBHYktlZTNYbUkrWXgyNWZBNjUya1dGOWtHUjVmdjdnbVNqVW5u?=
 =?utf-8?B?VU5zc21Sd0p2M2Iyd3gyN0tYSUFZZjF4T1FlbjY1UEhyZFFhSTlReGwxN0Jl?=
 =?utf-8?B?ZWtkTHB3NjFScVlyMzQvYWhTQUJSVk1QbDJHVWNGZGM4VjhIVWNqTXpRTFdT?=
 =?utf-8?B?Y1lDemxsQWVlbXBMN1h4dm1aTCs2Q3FCeGsxMjZLQVZxOTY3K3FyN1I2NGF6?=
 =?utf-8?B?VWtZM043eGVKYS9XOEdPYXJKWFVjb1p0SityczZsN2JCOHJKNGRNajNnT3pz?=
 =?utf-8?B?SWxoTDlLVTZzRTVVVEwzeDdPZmhadU5NRXMrT09LRWE5TVdYTXJ3c3UxMnA4?=
 =?utf-8?B?S3RBZ0lRazUxMkFVaTV3RXF0Y2xzbk4rYjhVVEhqd0JZTzA2MExULzZmaUFq?=
 =?utf-8?B?M3I5VytGNWd2UUpuZnZGS3ZQTko1c21FbHhqWWNNNUtwM1VLZFpsWEErNktC?=
 =?utf-8?B?Vmk0cWVCK1B1TS9nOUJ6LzFnWURnekRtZFFlUlNXaExUK0FjM044aXVhT0tj?=
 =?utf-8?B?ekdjUWFQemtlRTF5cnVsR1YzTEwvL3FMMjR0aXcweWkyNmM4ZDIzY1FYeENX?=
 =?utf-8?B?d2VYRXBhZmZIdDM5NU1WdzJ4YTZqek9lYS9WenNMbXR5cWlVR2szN0tVbXNo?=
 =?utf-8?B?QldFczQ2STJBNWJwaW5lOWZwWks2TnU0Um5uU3A2c0g2bTZzVGJPVXY4R3Jv?=
 =?utf-8?B?dTZqMWlOWlFwRUUrYzZXQVlzaXdFZVVaZnJVcHNDNzJsdHJIMzE3c2ExOHVy?=
 =?utf-8?B?L1B5UWFMakIzZ3YzZXlsdkxyZlhwT3ZDcFpDc1czSGFQa1BWdkxBd2daTlhI?=
 =?utf-8?B?L0c4VThnN3BnTGE0UFFGdERGQUdDZEdSSDJRdDYybFQ1K2hWM2xHUWtJcWZX?=
 =?utf-8?B?R3dwdlh4Y1AzSjBlWDVEcWNSN0NVY1VaVmV1Sm55SEg0bHZrcjNwOVBrdkZY?=
 =?utf-8?B?UW9xREF1MXVMcVltY3JDeGJHTElJRmo1bktGdU1KS2hpTk5nYXg1N0lKdW0w?=
 =?utf-8?B?YXc4bHljQ21OVjBocXgzSHZqTXdzZDdTQmdXZjRaOWRJMnBmbWVoU1hpbkVQ?=
 =?utf-8?B?ZEtrSVU5UWpEQ2p4bVhnRGRnMkJUVXozcWZFUkZaMFh6QVNnbW9xaGxIaDZ3?=
 =?utf-8?B?YzgvV2xzalA3ZzdISzAyL0RzUkVEQml5alpYZUJGQzJBQzZBS1luV2VwanV4?=
 =?utf-8?B?cVBuTUl5bXVNQk01V2tEUFc3VERUZnBZK2pyeWp0NUJPNDI0SzQ2VmZDUS9R?=
 =?utf-8?B?TnBRVmkyRmFxaFBFU240OWpuSzhJVnlrdzJtT1g4OXVyRVhxTUdTckQvbzdK?=
 =?utf-8?B?ZFJnS1JLODhUOEMrMWRPRHl4WXdZZ0tiSHpVRjR3dlpKODY0VUo0b2kvR1J5?=
 =?utf-8?B?LzhMMjNTK3VzZlJlT0d3QytneHhueFcyVmJhU0tWTGRPNklrRXBwRU41YVlS?=
 =?utf-8?B?c1F2bzdtQ29WQkhleUQyQ0owVDFla1pFa0Z0d2RQTXpWKzVNOERBeUdVS0l1?=
 =?utf-8?B?WDQ0T0c1a2NKMW51WGFRejlxQkJQNDBxZXlsZStKUUNKVjFKNDc4bGkwdmNS?=
 =?utf-8?B?Y2NOb1grQ1hmMnJhZ0tBUlBKZ051MHcrcDZyVW9sb3Y5c3RSMW5POUJ0TTR2?=
 =?utf-8?B?TnI1RlgvaFNGTXVKcVl4RzFxMzZGeVJPL05aNUZLOEFZVWpicnREd1UwODdW?=
 =?utf-8?B?OGxrdFdNc3g3dVNwNUcrNnREM2lrRURVTGtCTlhnZGhsZlZ2ZDYwYm5scUda?=
 =?utf-8?B?a0FqZFZtdmgzLzlSSmNzeVEvcjhmRm5xNzBTbzNPUDlDb2ZwejE0SEdOVktk?=
 =?utf-8?B?aGVlZnJmMFFKY0dhbVFhV0dtYjZLc01DWlhRSVRnbkwzNEI3WU8waUF3MFpo?=
 =?utf-8?B?ZlBpVDRSZFNjYngvQS93d1N0VW1SUzNFYUNXMmZYODJnS0I0NUFBTWlCTFpJ?=
 =?utf-8?Q?WGyA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DCD6F8435720F4EB433C8E9EFEAF274@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9fc2e4-393e-4215-bea8-08ddb2f567e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 08:02:03.6087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SOMlJY4QqdMOjPyIhrKMBGWTX4oFaier48tQ6MqljdeErtN+RH+Ezx2rm9eqkkD1SSdfQFBgVC+Mh8rIJRDbMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6266

T24gMjAyNS82LzIwIDE0OjM4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTkuMDYuMjAyNSAw
ODozOSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzE4IDIyOjA1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxMi4wNi4yMDI1IDExOjI5LCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMNCj4+Pj4gKysrIGIveGVuL2RyaXZl
cnMvdnBjaS9tc2l4LmMNCj4+Pj4gQEAgLTcwMyw5ICs3MDMsMTMgQEAgc3RhdGljIGludCBjZl9j
aGVjayBpbml0X21zaXgoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+ICAgICAgcGRldi0+dnBj
aS0+bXNpeCA9IG1zaXg7DQo+Pj4+ICAgICAgbGlzdF9hZGQoJm1zaXgtPm5leHQsICZkLT5hcmNo
Lmh2bS5tc2l4X3RhYmxlcyk7DQo+Pj4+ICANCj4+Pj4gLSAgICByZXR1cm4gMDsNCj4+Pj4gKyAg
ICBzcGluX2xvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4+PiArICAgIHJjID0gdnBjaV9tYWtl
X21zaXhfaG9sZShwZGV2KTsNCj4+Pj4gKyAgICBzcGluX3VubG9jaygmcGRldi0+dnBjaS0+bG9j
ayk7DQo+Pj4NCj4+PiBJZiB5b3UgYWRkIGEgY2FsbCB0byB2cGNpX21ha2VfbXNpeF9ob2xlKCkg
aGVyZSwgZG9lc24ndCBpdCBuZWVkIChvciBhdA0KPj4+IGxlYXN0IHdhbnQpIHJlbW92aW5nIHNv
bWV3aGVyZSBlbHNlPyBPdGhlcndpc2UgbWF5YmUgYSBjb2RlIGNvbW1lbnQgaXMNCj4+PiB3YXJy
YW50ZWQgbmV4dCB0byB0aGUgbmV3IGNhbGwgc2l0ZT8NClNvcnJ5LCBJIG1pc3VuZGVyc3Rvb2Qg
eW91IGluIG15IGxhc3QgZW1haWwuDQpBZnRlciBoZXJlJ3MgY2hhbmdlLCBpdCBzZWVtcyB0aGUg
Y2FsbCBpbiBtb2RpZnlfZGVjb2RpbmcoKSBpcyByZWR1bmRhbnQuDQpXaGF0J3MgeW91ciB0YXN0
ZT8gUmVtb3ZpbmcgdGhlIGNhbGwgaW4gbW9kaWZ5X2RlY29kaW5nKCkgb3IgYWRkaW5nIGEgY29k
ZSBjb21tZW50Pw0KDQo+PiBUaGUgcmVtb3Zpbmcgb3BlcmF0aW9uIGluIG1vZGlmeV9iYXJzKCkg
YW5kIHZwY2lfZGVhc3NpZ25fZGV2aWNlKCkgaXMgbm90IGVub3VnaD8NCj4gDQo+IEkgZmVhciBJ
IGRvbid0IHVuZGVyc3RhbmQgdGhpcyByZXBseSBvZiB5b3Vycy4gV2hpY2ggc3VnZ2VzdHMgdGhh
dCB0aGUgcGF0Y2gNCj4gZGVzY3JpcHRpb24gbWF5IHdhbnQgZXh0ZW5kaW5nIGFzIHRvIHRoaXMg
cGFydCBvZiB0aGUgY2hhbmdlLg0KPiANCj4+Pj4gQEAgLTI5LDkgKzMwLDIyIEBAIHR5cGVkZWYg
aW50IHZwY2lfcmVnaXN0ZXJfaW5pdF90KHN0cnVjdCBwY2lfZGV2ICpkZXYpOw0KPj4+PiAgICov
DQo+Pj4+ICAjZGVmaW5lIFZQQ0lfTUFYX1ZJUlRfREVWICAgICAgIChQQ0lfU0xPVCh+MCkgKyAx
KQ0KPj4+PiAgDQo+Pj4+IC0jZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfSU5JVCh4LCBwKSAgICAgICAg
ICAgICAgICBcDQo+Pj4+IC0gIHN0YXRpYyB2cGNpX3JlZ2lzdGVyX2luaXRfdCAqY29uc3QgeCMj
X2VudHJ5ICBcDQo+Pj4+IC0gICAgICAgICAgICAgICBfX3VzZWRfc2VjdGlvbigiLmRhdGEudnBj
aS4iIHApID0gKHgpDQo+Pj4+ICsjZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfQ0FQQUJJTElUWShjYXAs
IGZpbml0LCBmY2xlYW4sIGV4dCkgXA0KPj4+PiArICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFi
aWxpdHlfdCBmaW5pdCMjX3QgPSB7IFwNCj4+Pj4gKyAgICAgICAgLmlkID0gKGNhcCksIFwNCj4+
Pj4gKyAgICAgICAgLmluaXQgPSAoZmluaXQpLCBcDQo+Pj4+ICsgICAgICAgIC5jbGVhbnVwID0g
KGZjbGVhbiksIFwNCj4+Pj4gKyAgICAgICAgLmlzX2V4dCA9IChleHQpLCBcDQo+Pj4+ICsgICAg
fTsgXA0KPj4+PiArICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCAqY29uc3QgZmlu
aXQjI19lbnRyeSAgXA0KPj4+PiArICAgICAgICBfX3VzZWRfc2VjdGlvbigiLmRhdGEucmVsLnJv
LnZwY2kiKSA9ICZmaW5pdCMjX3QNCj4+Pg0KPj4+IENvdWxkIHlvdSByZW1pbmQgbWUgd2h5IHRo
ZSBleHRyYSBsZXZlbCBvZiBpbmRpcmVjdGlvbiBpcyBuZWNlc3NhcnkgaGVyZT8NCj4+PiBUaGF0
IGlzLCB3aHkgY2FuJ3QgLmRhdGEucmVsLnJvLnZwY2kgYmUgYW4gYXJyYXkgb2YgdnBjaV9jYXBh
YmlsaXR5X3Q/DQo+PiBZb3UgbWVhbiBJIHNob3VsZCBjaGFuZ2UgdG8gYmU6DQo+PiAjZGVmaW5l
IFJFR0lTVEVSX1ZQQ0lfQ0FQQUJJTElUWShjYXAsIGZpbml0LCBmY2xlYW4sIGV4dCkgXA0KPj4g
ICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCBmaW5pdCMjX3QgXA0KPj4gICAgICAg
ICBfX3VzZWRfc2VjdGlvbigiLmRhdGEucmVsLnJvLnZwY2kiKSA9IHsgXA0KPj4gICAgICAgICAu
aWQgPSAoY2FwKSwgXA0KPj4gICAgICAgICAuaW5pdCA9IChmaW5pdCksIFwNCj4+ICAgICAgICAg
LmNsZWFudXAgPSAoZmNsZWFuKSwgXA0KPj4gICAgICAgICAuaXNfZXh0ID0gKGV4dCksIFwNCj4+
ICAgICB9DQo+Pg0KPj4gUmlnaHQ/DQo+IA0KPiBZZXMsIHN1YmplY3QgdG8gdGhlIGVhcmxpZXIg
Y29tbWVudHMgb24gdGhlIGlkZW50aWZpZXIgY2hvaWNlLg0KR290IGl0Lg0KT25lIG1vcmUgcXVl
c3Rpb24sIGlmIGNoYW5nZSB0byBiZSB0aGF0LCB0aGVuIGhvdyBzaG91bGQgSSBtb2RpZnkgdGhl
IGRlZmluaXRpb24gb2YgVlBDSV9BUlJBWT8NCklzIFBPSU5URVJfQUxJR04gc3RpbGwgcmlnaHQ/
DQpTaW5jZSBJIGVuY291bnRlcmVkIGVycm9ycyB0aGF0IHRoZSB2YWx1ZXMgb2YgX19zdGFydF92
cGNpX2FycmF5IGFyZSBub3QgcmlnaHQgd2hlbiBJIHVzZSB0aGVtIGluIHZwY2lfaW5pdF9jYXBh
YmlsaXRpZXMoKS4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENo
ZW4uDQo=

