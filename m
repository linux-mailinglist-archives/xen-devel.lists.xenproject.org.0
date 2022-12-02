Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB8D641074
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 23:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452296.710117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1EHk-0006By-OA; Fri, 02 Dec 2022 22:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452296.710117; Fri, 02 Dec 2022 22:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1EHk-0006A2-LL; Fri, 02 Dec 2022 22:13:32 +0000
Received: by outflank-mailman (input) for mailman id 452296;
 Fri, 02 Dec 2022 22:13:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p1EHi-00069w-HR
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 22:13:30 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b8ec2af-728e-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 23:13:28 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 22:13:23 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb%6]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 22:13:23 +0000
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
X-Inumbo-ID: 8b8ec2af-728e-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWce6T/ck+e1xx/HnE+P2C52Kcl1NVe1Be5aD4edGk6/GbU+CZkF1rg7coGpabe6ESnEIYEQHKeeVEJs1iaQbrTJSo76b7BxgBwh2MvQ+3JyD8Qo0yEIW3CS7pTu3vOfnxz44tpSTxWfndZWv3w90W05Bcd0oCZnzxiEJEOl2a5JjlSFdgQI05CTzUKkdMLqxvoQVnBI9CfoVIB/nvVQ78mUQ28UCbTbrRZKr0l9N19oCNzuOlMHaIpbJezP58eM6s84eBi5R3fXHdRM7wr0Jjw8MX9WeQtiwfNmo1fdMt4QoKLfCA8n9vcRCqFnDpwx3QWlzFAcs7V/hkXTQ+RAoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hdoaK1Y4WhR0W6eKq0T/vXT5F/VaD3TZTJPfCw5HRY=;
 b=CMHr404NjH8c11JNxTs/cqWrFwtNYev1uoBGK7vh4SxPv15D7CFs2rq3IJ/Nyjpv6dqNJLYeVjYkDxySOFGLHwyEeLSkKFejKM2fSCyzHWjmdfbJpDk7oPABt2S28ikv0lH0S3MwCcIOb3YU0vaDBAdyC8OqUL8cD59sJNMvGwiCNy3Ut7FlEgvx/1rB9ZwsDRlG46FXHZ2fJPogDf5UqUqLSbLPR+DSD+uP9fF3aAtibg5+mQWxflHsaKfE+Th9CoVa0Vgk7t4mcpm9FIzOqJ4894LICxHZ65+4FI0m5UjbBW0xrHzs/gF5NYcDb2zgFK/AzcZ67T/+WkdcfyWQNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hdoaK1Y4WhR0W6eKq0T/vXT5F/VaD3TZTJPfCw5HRY=;
 b=RAO529+9C7dDjSSQF7yuNKR5C0Ere6w0p1mCEgxGRBYvpWb4FFnJ6jpDGMQxViOXjM89l6zLPPSXl+V2htLbF5kGvNI9D32XCreOMxQMexf65ioZQvivkjUfTb90eADMXCqfcQtoGXxbwV8Sl7dfc+23gg0XwAjbYB//pEO2z18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ade61d47-f8c0-09cc-1a44-faaaff87d76a@amd.com>
Date: Fri, 2 Dec 2022 14:13:20 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-dev@xilinx.com, stefano.stabellini@amd.com,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com> <871qphc0p3.fsf@linaro.org>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <871qphc0p3.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7fb148-9d35-4bf6-0f55-08dad4b26d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v6K/y18UQTF8Ekwruw6SBehGb1wMo+NqorqoXUP/Uxt0t1VApkV7fBz/I5KcRbK5eGmvD3htSPMucdhwlaKl1c8UAinaxL9OhZbJpgTx9+SuTpjybWEZx2Qx/pXwOJINn8JytSxwt0rQMyacrhq99RzYU7RTrbCeVExIoFI18dKxmm06hna3NwfiVgeCa3s9WwQSDAqpCG/tsJN9PwtzDMZy1wjl153U92o5HxX4BLHhNzRmRnWeS5cOgEnCoYKcSEjkaPrcy0mPUVb7NtI79cw0NWyOVK0x27Viu8F8tZxcVxE/kWu8667HdnO/Y6gn+V2ju57CjfdzgUx7piZAHBJBS+R75UMFQUwo5QeOIg9DgDcN/KVXJahMZYegCWES5+nXLtC5OxEXCyAs3dMuNXLk5arooEFG5lf0SKMs3JfjMzlcII9mqdPR/GkzWG7nk8VjDbC/M00hthFD2xgd969vBuvuolRXjnZLzaaDITQd5Fhoi8urNRl3iVioUQDBG/uEVCzNifADatk2gIZU6HDlZLEAshNSzVqVHg313qZTBzdGvBsTrNgowAQKIDXIm+hkuQuZdzgQCSurPp/a5tmWCggYgv3xVPNOI/VjqIEMuSEISTdXnShwCE3jrcg0Dw3kf2FzDKUacWnZogJoKUoGltxMg82SlWLlP68Y3/TMlq5CJENO+l5ji1QjOxBekAjIe7zbcRIIgm/CQkEt8GnbNXZQvFxGqA1wO9TOEWJeXqGiOmzMDvYSo8b6odYPxvCm3XBIcfHiAkWUfMBzTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(83380400001)(86362001)(2906002)(38100700002)(44832011)(4326008)(41300700001)(5660300002)(8936002)(8676002)(53546011)(26005)(6506007)(186003)(66574015)(6512007)(2616005)(54906003)(316002)(6916009)(66476007)(478600001)(66556008)(66946007)(6486002)(966005)(31696002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXFCUUltbFdGd3k4alAwejM4WFFsZ2hGOWFGNWovOFhaTlNpNDNkckhqMGcw?=
 =?utf-8?B?N0l0UWNBNWVJN3FMcDAzMjJFSE43Q3IxRE9BQUw4RURwVnpGbUtaOTFVTGZh?=
 =?utf-8?B?ZkpCaXNabjFycDM3L3lIVUdDUE5pbHYvK0hkZXlaSjJnV2lYUzluMkZiT2Jj?=
 =?utf-8?B?ZlNDMzNibkNPaGkxUFBEY0NXVXhBZ0dNMFJTZGNhQXJYcE1LR0xLYnBIemVj?=
 =?utf-8?B?elBEZjh6STR3YjdJcG5NcGdVOEM2MHZheEFGNlZjYVdTQ09UU0cxeW1sdEw2?=
 =?utf-8?B?cFVHQzM1dDlrT1BwNUlRSEJneERwM2JtSGJ5YmRYcHRISUhCZ1o3eUUyY3Bo?=
 =?utf-8?B?aGlJR3pLUVg5RGN5eFREN001TzR4a3dGZWNGcnJvZUZLand6RW5LZENDTXEv?=
 =?utf-8?B?RitvSE8zb3pQOEZJYk1uNGlpMmQ3TXpGVnRiK1BYc3VJOXc1cGRWTWg1V3lQ?=
 =?utf-8?B?UmxPMHhxaVFFNmphSmlabE8rTVVqandBU1pQMEFyWEhGT05jeGpLWFFuUkli?=
 =?utf-8?B?bVFYcnQ1LzFKN09aVm5LdVgyMDhLSkJudVdxWEM2ZndDY0hMSTFlbFB5dDFj?=
 =?utf-8?B?WG5oYmdGUE10RC9mQVY3UFpnVkY5bG1mNWFWcU1MNmttdjRmNHo4N0Zka1hz?=
 =?utf-8?B?ZElFTjlMaE14NFlocUtCRW1WTElwSk9lOGRRdnIwcklCQVRpRnhHRk5yais3?=
 =?utf-8?B?S05WUkZNQlY4ckhCeFZnMGlVeDBVT1l5L2ZlOEVmRFIxU2UzVUhKcEhUdWpV?=
 =?utf-8?B?S1p4a3FxTmxWM1IvV0tSYUZCUUFCQndJbWpPdmFCZzJXMzRYakliUEtMcnhJ?=
 =?utf-8?B?WmRTYVRlVWdqKzJRWjhralBBNDhBQVhSY1ZtQ0h6V2JKcHVuQ1RxUW41NkxF?=
 =?utf-8?B?d0xleXBTVGVuS1JaR1lCcWJmQ1c0c2MwVWhnVkJQTVVnR3JxaFlGVzhNL0N6?=
 =?utf-8?B?TVY0Q2YrcXIreVNNUlUwVHdCb3ZMb0NSbGV0SnNsQlJLcUIvUzRQRnpmTENW?=
 =?utf-8?B?eDArVlp3VEYzd1JSazV1dkNwTEVidnFXWmNKZXJSZURVTGg0N1Bod0kyZFVl?=
 =?utf-8?B?UHJ0WVhDd05pQ21sbXIrZ1MybXl4cjFwZWpEazJHSGRVVDZxNzE1Ukp6UEV0?=
 =?utf-8?B?SGFCUVBlUjhYTlFHSUVabzF3RTBoRDVXK1dqMzNMb3I5OVRiUFpwOUx0dTV3?=
 =?utf-8?B?c3hGZ2JKdHVNU0NJaTA0amhzMFVtOWtVbldBbDRJWmxPOHlBaHRTYmJERjdq?=
 =?utf-8?B?SnFvOFFTZEpHZmUrZ0xJMjZkMnNpVVF0S1BYU3Q5R3EzcUVveXVvLzVsUHcy?=
 =?utf-8?B?OW9EQ2d3alVidDNrZWh3RlU3ZmZsdi9mUkJScFJweVc0QzVmUVZQQkxZbzJk?=
 =?utf-8?B?K3J0M1RyQzIxdGJ0Mzh0VGMxZFYxSDIxc3U1bXNDNjFrdXFxZ1VtcklJbVJM?=
 =?utf-8?B?S2xUcUdOTkhCNzB6azMrY2NQekJlMW1scFEwNGh4QW9XUHZWYlF4ODQ2WUFR?=
 =?utf-8?B?NEl2R3piYnluUkc1cUM0aHRLSmVXTSs5aDBGbFRkQ3NpZ3F0a1Q3TWNPcG01?=
 =?utf-8?B?S21FdDBqUEczQzc2M2NMTXVVeVlhSTV4NzJWc1MrRlVCbWxYc25mNWtMMUpG?=
 =?utf-8?B?WStETjhNZklkMFBlb3JpZXhKYTJ1MDJEeGhSb3BZRGhqSVBOSVBTeWlLT09D?=
 =?utf-8?B?SlpreFJ5VzZNK1FZR0JuaUpTQ0FxOVUyUDZpbW51TitwSDhhWXBKTVNLR1Aw?=
 =?utf-8?B?WFAxYTgxOTNYRXBKUmdUVUdJR2cyeDBiVDNtNHBhSk9ZU3J1ZFdmZVpUc0Vx?=
 =?utf-8?B?YnFkRlE5eE5sVGZPODlDNDl5YW9HaHEwYXNzTms1M1BtY2xsN1dPTDc1TDdE?=
 =?utf-8?B?NmVacnBENlZ3QzBXenRXU0phS3Yyckh0blN2eTRzUzBkd1JGZFBLc2NLQWZh?=
 =?utf-8?B?RjZXV0hYMDZnZ0pVL2c3Y3U2TEpDY3R6OGVMNWNnb1h4cmlSb1NZeC8zWDFz?=
 =?utf-8?B?WDdqOC9qWURHeUpGOGlFblUyZjliQlJGVVVaZ0Q1OFlFeDdKZzRuV2owdDBT?=
 =?utf-8?B?a3hiZUZYTUE5ZkUyK1I4RzZpL0ZuZ0hEdE16a1ZFRTEyOEFhelBSOXlMWUE4?=
 =?utf-8?Q?rDNLXY8are7VBW0DIR92suyEQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7fb148-9d35-4bf6-0f55-08dad4b26d53
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 22:13:23.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3O28Zo9XFDPc3+JwUBkK19zQ9lDj2itcyCKK3KXksEtXIXJ3QBgjSmezJf5vW+0Gmm6JripWbx0OCa5XwTorw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255

SGkgQWxleCwNCg0KT24gMTIvMi8yMiA2OjUyIEFNLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+IFZp
a3JhbSBHYXJod2FsIDx2aWtyYW0uZ2FyaHdhbEBhbWQuY29tPiB3cml0ZXM6DQo+DQo+PiBBZGQg
YSBuZXcgbWFjaGluZSB4ZW5wdiB3aGljaCBjcmVhdGVzIGEgSU9SRVEgc2VydmVyIHRvIHJlZ2lz
dGVyL2Nvbm5lY3Qgd2l0aA0KPj4gWGVuIEh5cGVydmlzb3IuDQo+Pg0KPj4gT3B0aW9uYWw6IFdo
ZW4gQ09ORklHX1RQTSBpcyBlbmFibGVkLCBpdCBhbHNvIGNyZWF0ZXMgYSB0cG0tdGlzLWRldmlj
ZSwgYWRkcyBhDQo+PiBUUE0gZW11bGF0b3IgYW5kIGNvbm5lY3RzIHRvIHN3dHBtIHJ1bm5pbmcg
b24gaG9zdCBtYWNoaW5lIHZpYSBjaGFyZGV2IHNvY2tldA0KPj4gYW5kIHN1cHBvcnQgVFBNIGZ1
bmN0aW9uYWxpdGllcyBmb3IgYSBndWVzdCBkb21haW4uDQo+Pg0KPj4gRXh0cmEgY29tbWFuZCBs
aW5lIGZvciBhYXJjaDY0IHhlbnB2IFFFTVUgdG8gY29ubmVjdCB0byBzd3RwbToNCj4+ICAgICAg
LWNoYXJkZXYgc29ja2V0LGlkPWNocnRwbSxwYXRoPS90bXAvbXl2dHBtMi9zd3RwbS1zb2NrIFwN
Cj4+ICAgICAgLXRwbWRldiBlbXVsYXRvcixpZD10cG0wLGNoYXJkZXY9Y2hydHBtIFwNCj4+DQo+
PiBzd3RwbSBpbXBsZW1lbnRzIGEgVFBNIHNvZnR3YXJlIGVtdWxhdG9yKFRQTSAxLjIgJiBUUE0g
MikgYnVpbHQgb24gbGlidHBtcyBhbmQNCj4+IHByb3ZpZGVzIGFjY2VzcyB0byBUUE0gZnVuY3Rp
b25hbGl0eSBvdmVyIHNvY2tldCwgY2hhcmRldiBhbmQgQ1VTRSBpbnRlcmZhY2UuDQo+PiBHaXRo
dWIgcmVwbzogaHR0cHM6Ly9naXRodWIuY29tL3N0ZWZhbmJlcmdlci9zd3RwbQ0KPj4gRXhhbXBs
ZSBmb3Igc3RhcnRpbmcgc3d0cG0gb24gaG9zdCBtYWNoaW5lOg0KPj4gICAgICBta2RpciAvdG1w
L3Z0cG0yDQo+PiAgICAgIHN3dHBtIHNvY2tldCAtLXRwbXN0YXRlIGRpcj0vdG1wL3Z0cG0yIFwN
Cj4+ICAgICAgLS1jdHJsIHR5cGU9dW5peGlvLHBhdGg9L3RtcC92dHBtMi9zd3RwbS1zb2NrICYN
Cj4gPHNuaXA+DQo+PiArDQo+PiArc3RhdGljIHZvaWQgeGVuX2VuYWJsZV90cG0odm9pZCkNCj4+
ICt7DQo+PiArLyogcWVtdV9maW5kX3RwbV9iZSBpcyBvbmx5IGF2YWlsYWJsZSB3aGVuIENPTkZJ
R19UUE0gaXMgZW5hYmxlZC4gKi8NCj4+ICsjaWZkZWYgQ09ORklHX1RQTQ0KPj4gKyAgICBFcnJv
ciAqZXJycCA9IE5VTEw7DQo+PiArICAgIERldmljZVN0YXRlICpkZXY7DQo+PiArICAgIFN5c0J1
c0RldmljZSAqYnVzZGV2Ow0KPj4gKw0KPj4gKyAgICBUUE1CYWNrZW5kICpiZSA9IHFlbXVfZmlu
ZF90cG1fYmUoInRwbTAiKTsNCj4+ICsgICAgaWYgKGJlID09IE5VTEwpIHsNCj4+ICsgICAgICAg
IERQUklOVEYoIkNvdWxkbid0IGZpbmUgdGhlIGJhY2tlbmQgZm9yIHRwbTBcbiIpOw0KPj4gKyAg
ICAgICAgcmV0dXJuOw0KPj4gKyAgICB9DQo+PiArICAgIGRldiA9IHFkZXZfbmV3KFRZUEVfVFBN
X1RJU19TWVNCVVMpOw0KPj4gKyAgICBvYmplY3RfcHJvcGVydHlfc2V0X2xpbmsoT0JKRUNUKGRl
diksICJ0cG1kZXYiLCBPQkpFQ1QoYmUpLCAmZXJycCk7DQo+PiArICAgIG9iamVjdF9wcm9wZXJ0
eV9zZXRfc3RyKE9CSkVDVChkZXYpLCAidHBtZGV2IiwgYmUtPmlkLCAmZXJycCk7DQo+PiArICAg
IGJ1c2RldiA9IFNZU19CVVNfREVWSUNFKGRldik7DQo+PiArICAgIHN5c2J1c19yZWFsaXplX2Fu
ZF91bnJlZihidXNkZXYsICZlcnJvcl9mYXRhbCk7DQo+PiArICAgIHN5c2J1c19tbWlvX21hcChi
dXNkZXYsIDAsIEdVRVNUX1RQTV9CQVNFKTsNCj4gU3RpbGwgZmFpbHMgb24gbXkgYWFyY2g2NCBE
ZWJpYW4gbWFjaGluZToNCj4NCj4gICAgRkFJTEVEOiBsaWJxZW11LWFhcmNoNjQtc29mdG1tdS5m
YS5wL2h3X2FybV94ZW5fYXJtLmMubw0KPiAgICBjYyAtSWxpYnFlbXUtYWFyY2g2NC1zb2Z0bW11
LmZhLnAgLUkuIC1JLi4vLi4gLUl0YXJnZXQvYXJtIC1JLi4vLi4vdGFyZ2V0L2FybSAtSXFhcGkg
LUl0cmFjZSAtSXVpIC1JdWkvc2hhZGVyIC1JL3Vzci9pbmNsdWRlL3BpeG1hbi0xIC1JL3Vzci9s
b2NhbC9pbmNsdWRlIC1JL3Vzci9pbmNsdWRlL2NhcHN0b25lIC1JL3Vzci9pbmNsdWRlL3NwaWNl
LXNlcnZlciAtSS91c3IvaW5jbHVkZS9zcGljZS0xIC1JL3Vzci9pbmNsdWRlL2dsaWItMi4wIC1J
L3Vzci9saWIvYWFyY2g2NC1saW51eC1nbnUvZ2xpYi0yLjAvaW5jbHVkZSAtZmRpYWdub3N0aWNz
LWNvbG9yPWF1dG8gLVdhbGwgLVdpbnZhbGlkLXBjaCAtV2Vycm9yIC1zdGQ9Z251MTEgLU8yIC1n
IC1pc3lzdGVtIC9ob21lL2FsZXgvbHNyYy9xZW11LmdpdC9saW51eC1oZWFkZXJzIC1pc3lzdGVt
IGxpbnV4LWhlYWRlcnMgLWlxdW90ZSAuIC1pcXVvdGUgL2hvbWUvYWxleC9sc3JjL3FlbXUuZ2l0
IC1pcXVvdGUgL2hvbWUvYWxleC9sc3JjL3FlbXUuZ2l0L2luY2x1ZGUgLWlxdW90ZSAvaG9tZS9h
bGV4L2xzcmMvcWVtdS5naXQvdGNnL2FhcmNoNjQgLXB0aHJlYWQgLVVfRk9SVElGWV9TT1VSQ0Ug
LURfRk9SVElGWV9TT1VSQ0U9MiAtRF9HTlVfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQg
LURfTEFSR0VGSUxFX1NPVVJDRSAtV3N0cmljdC1wcm90b3R5cGVzIC1XcmVkdW5kYW50LWRlY2xz
IC1XdW5kZWYgLVd3cml0ZS1zdHJpbmdzIC1XbWlzc2luZy1wcm90b3R5cGVzIC1mbm8tc3RyaWN0
LWFsaWFzaW5nIC1mbm8tY29tbW9uIC1md3JhcHYgLVdvbGQtc3R5bGUtZGVjbGFyYXRpb24gLVdv
bGQtc3R5bGUtZGVmaW5pdGlvbiAtV3R5cGUtbGltaXRzIC1XZm9ybWF0LXNlY3VyaXR5IC1XZm9y
bWF0LXkyayAtV2luaXQtc2VsZiAtV2lnbm9yZWQtcXVhbGlmaWVycyAtV2VtcHR5LWJvZHkgLVdu
ZXN0ZWQtZXh0ZXJucyAtV2VuZGlmLWxhYmVscyAtV2V4cGFuc2lvbi10by1kZWZpbmVkIC1XaW1w
bGljaXQtZmFsbHRocm91Z2g9MiAtV25vLW1pc3NpbmctaW5jbHVkZS1kaXJzIC1Xbm8tc2hpZnQt
bmVnYXRpdmUtdmFsdWUgLVduby1wc2FiaSAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcgLWZQSUUg
LWlzeXN0ZW0uLi8uLi9saW51eC1oZWFkZXJzIC1pc3lzdGVtbGludXgtaGVhZGVycyAtRE5FRURf
Q1BVX0ggJy1EQ09ORklHX1RBUkdFVD0iYWFyY2g2NC1zb2Z0bW11LWNvbmZpZy10YXJnZXQuaCIn
ICctRENPTkZJR19ERVZJQ0VTPSJhYXJjaDY0LXNvZnRtbXUtY29uZmlnLWRldmljZXMuaCInIC1N
RCAtTVEgbGlicWVtdS1hYXJjaDY0LXNvZnRtbXUuZmEucC9od19hcm1feGVuX2FybS5jLm8gLU1G
IGxpYnFlbXUtYWFyY2g2NC1zb2Z0bW11LmZhLnAvaHdfYXJtX3hlbl9hcm0uYy5vLmQgLW8gbGli
cWVtdS1hYXJjaDY0LXNvZnRtbXUuZmEucC9od19hcm1feGVuX2FybS5jLm8gLWMgLi4vLi4vaHcv
YXJtL3hlbl9hcm0uYw0KPiAgICAuLi8uLi9ody9hcm0veGVuX2FybS5jOiBJbiBmdW5jdGlvbiDi
gJh4ZW5fZW5hYmxlX3RwbeKAmToNCj4gICAgLi4vLi4vaHcvYXJtL3hlbl9hcm0uYzoxMjY6MzI6
IGVycm9yOiDigJhHVUVTVF9UUE1fQkFTReKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhHVUVTVF9SQU1fQkFTReKAmT8NCj4gICAgICAx
MjYgfCAgICAgc3lzYnVzX21taW9fbWFwKGJ1c2RldiwgMCwgR1VFU1RfVFBNX0JBU0UpOw0KPiAg
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fg0K
PiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHVUVTVF9SQU1fQkFT
RQ0KPiAgICAuLi8uLi9ody9hcm0veGVuX2FybS5jOjEyNjozMjogbm90ZTogZWFjaCB1bmRlY2xh
cmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0
IGFwcGVhcnMgaW4NCj4gICAgWzIwODIvMzI0Nl0gQ29tcGlsaW5nIEMgb2JqZWN0IGxpYnFlbXUt
YWFyY2g2NC1zb2Z0bW11LmZhLnAvaHdfeGVuX3hlbi1tYXBjYWNoZS5jLm8NCj4gICAgWzIwODMv
MzI0Nl0gQ29tcGlsaW5nIEMgb2JqZWN0IGxpYnFlbXUtYWFyY2g2NC1zb2Z0bW11LmZhLnAvaHdf
eGVuX3hlbi1odm0tY29tbW9uLmMubw0KPiAgICBuaW5qYTogYnVpbGQgc3RvcHBlZDogc3ViY29t
bWFuZCBmYWlsZWQuDQo+ICAgIG1ha2U6ICoqKiBbTWFrZWZpbGU6MTY1OiBydW4tbmluamFdIEVy
cm9yIDENCj4NCkRvIHlvdSBrbm93IHdoYXQgWGVuIHZlcnNpb24geW91ciBidWlsZCBlbnYgaGFz
Pw0KDQpBbm90aGVyIHdheSB0byBmaXggdGhpcyhhcyBKdWxpZW4gc3VnZ2VzdGVkKSBpcyBieSBz
ZXR0aW5nIHRoaXMgDQpHVUVTVF9UUE1fQkFTRSB2YWx1ZSB2aWEgYSBwcm9wZXJ0eSBvciBzb21l
dGhpbmcgYW5kIHVzZXIgY2FuIHNldCBpdCB2aWEgDQpjb21tYW5kIGxpbmUuDQoNCkBzc3RhYmVs
bGluaUBrZXJuZWwub3JnLCBkbyB5b3UgdGhpbmsgb2YgYW55IG90aGVyIGZpeD8NCj4+ICsNCj4+
ICsgICAgRFBSSU5URigiQ29ubmVjdGVkIHRwbWRldiBhdCBhZGRyZXNzIDB4JWx4XG4iLCBHVUVT
VF9UUE1fQkFTRSk7DQo+PiArI2VuZGlmDQo+PiArfQ0KPiBJZiB0aGVyZSBpcyBhIG1pbmltdW0g
cmVxdWlyZWQgdmVyc2lvbiBmb3IgVFBNIHRoZW4gaXQgbmVlZHMgdG8gYmUNCj4gcGlja2VkIHVw
IGJ5IGNvbmZpZ3VyZS4NCj4NCg==

