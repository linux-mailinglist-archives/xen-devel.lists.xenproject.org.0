Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC8CB37B4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 17:33:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183059.1505845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTN7Q-0002no-CK; Wed, 10 Dec 2025 16:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183059.1505845; Wed, 10 Dec 2025 16:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTN7Q-0002mH-8t; Wed, 10 Dec 2025 16:32:48 +0000
Received: by outflank-mailman (input) for mailman id 1183059;
 Wed, 10 Dec 2025 16:32:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyob=6Q=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTN7P-0002mB-5d
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 16:32:47 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db2c25ba-d5e5-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 17:32:46 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5566.namprd03.prod.outlook.com (2603:10b6:a03:280::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.15; Wed, 10 Dec
 2025 16:32:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 16:32:42 +0000
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
X-Inumbo-ID: db2c25ba-d5e5-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJtXwlBh5x0Go0aXs2A4kg1CqibOL5nuYzW2djEy4fUDCLHRFaDyApZ//S5qtCTy/v8bh620NSW1T+h+q9m3CcWVS9zSgAmTD/0itYG5bCoI3TMYO2prKL3UcZ1RmvBn5B4O/n7h2aPQGDjF3uuKEl4hTyxvFjSXpcd4wUdxXDiusOJhHsmeFIoKBBo/6zbe0iFlT/LbKf3JGRxGgP84KSSql+wRRzWzwTxHRiuZvrxcXP0YKQzxcGLU+OABmaSYSpuHclmU09DhFe6DRxuBOBMgP5nzH+nHkq47x6tB0DzOHTF9fAd6GJpxX2Bn9zK+YYQUtt9QLi4YnqXhUHygFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80APy/Q6P1tgxbZs/fBHK9IV82q93Hp9MtbGhEDy+p0=;
 b=UHz1lMOBj3l6I/ptN8LeyZ4yp651yMlfN7XPWXAbf4jWNANRs4THzEmrK6IKkB7xTRCfaUs7GV9mgftKAMjEwQWRO9yY4xGD90Q1wRQVjg87T8GwqoAXl/uKWO2f9xAsYaIdA5FNIW42K+930OvqaSZSmcmUOPnwIUrEUORNTXq0Qx0N5dH3Kfu1n6qH3TpuKHYVYUrmZ4fPMwu8vVJXpWhwHf85qP5m5f+vGF9jKxJYGSQWKKgWa5kjSPTiInlg2W4sui9DTbgXoHtebSdsn95OKXp4TRfnz2YJVmqeuiMIQ/4siWO7vRX/448NYnXuGNTh1MZRGuSZC4LqP8TZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80APy/Q6P1tgxbZs/fBHK9IV82q93Hp9MtbGhEDy+p0=;
 b=hRxmVgsNtk+2Rc//k9w+n7emNalMKsRL7IONlUzdOI0uzO+1eUm+ZF231gsC5RgXMjCPOFZ94o82YjT/wIb9poQaya+i9JIlYeM+1O9zB46xJ+/4t5x/J8Nt4xg4e8rRQurvhhw/EjjugOahgfgo9pyqpKLK2UtbbKV1DxnvJck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a3651fde-77e1-4233-a1f0-e4a5b2cff3d6@citrix.com>
Date: Wed, 10 Dec 2025 16:32:36 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Victor Lira <victorm.lira@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] xen: Centralize scheduler linker definition
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-2-jason.andryuk@amd.com>
 <be7e41df-992a-408e-ad45-c29b4666cb9e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <be7e41df-992a-408e-ad45-c29b4666cb9e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::31) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5566:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5065d5-e88f-4b3c-e5e0-08de3809bd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3pMcmNyaTBjUHB4NTFzUTcybFZTajdhSGZFbnR6bzB0VTk1T25aY1JjMlZ0?=
 =?utf-8?B?cllLMis0eWthTDdKVEk0WEdFWFBIT0trMEQ1bkpHdTJ3SjN0amNwa1dWajk2?=
 =?utf-8?B?L2JhNkJCNjg4U3lWSFY4L1lZa1YxM3BxcmlBbDJnVCtFdGVkcXBocXlpZ0t1?=
 =?utf-8?B?RXlzTE1ncStjOGRueHF0djFramxPQUZuZk05OW5odDNOVzg0SjNKYTV4ZTJ3?=
 =?utf-8?B?Q3N2bU5QS2o2TTN2bGYreWtJSkg3OXUrNUEvZjJ6QmFEZFYyY2tQYmowaEV6?=
 =?utf-8?B?alRIT3FBaHJkeFpOZGtzZ2RNbUlpTEd0N2l2SjNnL29VY3NVZmVNM1Ezd0NG?=
 =?utf-8?B?bHhGQllaL3Rqb0VGbWl4dFhIUU9QZlh1S1BBZ2h6Y200WGxIUnRyaElBeFNp?=
 =?utf-8?B?TnVNSU1yU0lBN0tOb1hOSUlRUkRML2JMVTBlU1Rjai9PZDR2VGxuSUQ1MkZv?=
 =?utf-8?B?enJvK3VoazB6ZTlOMGRzbFhsclZYcTFJcXZUL3ZPd0pMMFRtNTZBQndZWVFm?=
 =?utf-8?B?ZDExSjJEZW85U3g1MlJhZU80UGUvdnZseWJ0ajVTMVRGQmsyZ1luQ2E4V1J2?=
 =?utf-8?B?T0xUT0lpV1l6aUZISTNWQ01WRGw5Q2VvVDltZXRVYWxrNndrUHpUbEJVR0Jp?=
 =?utf-8?B?YlFxZjZmQkhOd25BY0k0TWRXa1BwaEUwaUlWeStiL1RUQWlqSUV0b2RnT21O?=
 =?utf-8?B?b05Dbm9CT3ptSVluRGlta0xTbHVaeC9ZODFpN013S3FBQWRoNVVvV0lSSHJJ?=
 =?utf-8?B?c2lZbjk0KzhydUx6OTBIQlpodURqbWhwN0JRWUIrd2xtTkx5K1Nwelc0bGpH?=
 =?utf-8?B?QkF2K0ZvR1YzZEZUVVFUUmw5NHY0eTJsTjBrTUxqRWZDeEFvSzhJZE5nUFJi?=
 =?utf-8?B?T1hxV1dwVytnYkQrQ1dBLzN0cG0xT0Q4OTFCTmRSYkkzTkFESWRxc05lMGZa?=
 =?utf-8?B?MmV6RFIvVUFiOTM5UWFHSVRIdW9FTENqdTFSNFlpSVlPR0lmT25tY1VPQ1Vq?=
 =?utf-8?B?ZGd5NVZzSTN4SUszQm0vc1E0bkpvR0ttcXZzTFo3YUx6cGhtVFpYeUhteXZq?=
 =?utf-8?B?aDdmS2lZbUZDOWtMYXlWOVN5ZUdWSnBQOEJ0TWpqTDlCZVFaaG5OQ3lGNG9y?=
 =?utf-8?B?T2JZQjVYWlhMTGx0ejcwcTRCS05JUmxBaURkSUJPb1VpS3RyQTRKa2E0bzJ0?=
 =?utf-8?B?a1hrVlVrRENTcytnUitpMVc2S2ZrZGtPWk03YU1YMjlsKzgrcDdLQ0laRUZo?=
 =?utf-8?B?RHlHbEpOZThaQUF3bldjdzJGTG9qT1BMdGJXNEdSd1AyaGQweHlTQkxGekVP?=
 =?utf-8?B?bkNzK3MyRkhjVUVNbmN0emoza1N4ek9kUjVVUGdWQk5MUDdJZm40eWR1Tkdp?=
 =?utf-8?B?eTBLc3Z5cVduWWp6WU8rVzNoRjNtK0dBTEtJc2pBRU9qQWJvYjVXZUdGQzRh?=
 =?utf-8?B?bk0vUHJQSnZ4bVZuc2d4SzVxTTBUSlJVU1BQRzAvL0xCem1yMUw3VDlXbmZJ?=
 =?utf-8?B?NnVQN2lHTndJSTZxeG5XNVpLS0JmWVpMazB1TG9WcExFWno1NjZIT1NDVHlG?=
 =?utf-8?B?bW11cGhxeVJJUThjNWovaWM5Tm5DOWJXakxGbEtwN2VXbDZoRjNWVmJlSWVo?=
 =?utf-8?B?bEhiSkZXZVQvMFhrMHo1MStVWTNWdGMzYjBUb09NR3BzRWFQSDJNbG5uSEtn?=
 =?utf-8?B?K3VCUk8wRitUdTZCUHZOZklKUDRaemN4SnVBTVAreGpiZ2RwVHBRNnJ3dksx?=
 =?utf-8?B?TGFhaXRaV2dqNytxSnBQRGthL2Jjb2E0R0t5cUIwUVlmVHBNOGdYcCtTU1dQ?=
 =?utf-8?B?SytCRlREVVdCSFIwSGlGWWV4QWFzMy9veFlSVjdvR21yd1V0WHRKZit6bGNC?=
 =?utf-8?B?RTJpSTJWdEdsTkkxeS9ZOGc3bjk3STBYUDRRMmpvaGZ6TXdEV0UxZUJtcXVi?=
 =?utf-8?Q?o1qB3EJ0gmoypj+Iieaarhlv0IhDtfIz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnNMSDZtMTgzb0huTjZUVEEzU0hvaDV5OEZna3BuUU1aQmN1djNNalpWQm5W?=
 =?utf-8?B?emFwNHRKUjBCcnpPYUJ3Nm8rWEFBNHlaMnBPM1BLUTNXcHFKTktUWElBNEkv?=
 =?utf-8?B?RmR0TXNTVzlReXFCK2YveWNXQ0h0OGpDcE02Zjk2S2l3dFZzaE9JQ0N1ODZ3?=
 =?utf-8?B?NGJEQmMyMXVIczFWREcza1BRVHQ4a0V5NjhRWVpURXVueGp0Sy9FT3VZdTM1?=
 =?utf-8?B?M1RZWjJ3LzhNb21DTkpwUnZiVU93VEFjZjJRMTljRlRWNmxaRzEwNW9SVmNp?=
 =?utf-8?B?azFtOTQ5S2orSUU1NmtiQUxnbkZRTjlGRGF3L2JoMlFrSmxFSyt5VEdyOVVY?=
 =?utf-8?B?SmZHWFV6TGRQQWhhd3NtS2xaaGhJVlFzV1pWU05hY09ZZjRYRmZES0daMTQ1?=
 =?utf-8?B?bFQzbWtrRU5PZ0ZkdmNVWlEzelFZbXl5c1pyV1ZpcWpRYk5aMEVZUnFjazI3?=
 =?utf-8?B?MEh6U1M4TjN1MGFnQlBTd0lNbW1vU1pZandkcDQ2NnRYMGplaHpoa1ZFMFRW?=
 =?utf-8?B?eHB6ZUVYREpBa01GdVRoTEhUK05JNVZ4S0M5Y1BjU1BYb2FKRmxWWEljS2U0?=
 =?utf-8?B?QVd4aTRiV0Zna1RLZlFvNno0VWl4UXdwblBpMDVjRXhJTDIyd0dSSUxma0hH?=
 =?utf-8?B?Vmk1Q2VEY1AxMDUrS0x0Vk4wbnpMUDQrdWorUFlzOXVacWlKcUJxWVhlMUtE?=
 =?utf-8?B?RExGTW41VE9MN0NnODR6WFppYlJ0T3dsYlhWMFVrYlRvNjJTM1ZqYUM0S3dZ?=
 =?utf-8?B?ZG85RHJJODl3RTlHSndOaEVzdVBJbFpGUGwrN2wzWWM1QzJ4S3RUQ1hTaytL?=
 =?utf-8?B?L2Z1Q1pzb0ZFaTBLd0xZMC90RFU4T2lvNStCNmdBbDFjNUpwaUdzZFg0N1ls?=
 =?utf-8?B?U1NicUNiaHRiaE9pTG02UlhnSWlob3BXZmRIT3VUTmhWV1dSd1VjeVBkMVVi?=
 =?utf-8?B?YmZHNGU0Q0VramxKZWJlU1gzTko1TC9INmozN2E3d1Q4L3YwTWh3NklVOW1O?=
 =?utf-8?B?VC9BdWlPMWJHTTRXUndrUENrdjUzdGlKZWNoYWFJUlcveGRtaXNYcmlzTktC?=
 =?utf-8?B?N2lIMXM3THg4aWxOajE5YTFteDNyZXdOTGE1c2VSUDNHNTRvczJIZ3Exbk1H?=
 =?utf-8?B?ZlFVbVU5M241ZjdibHk2bnZ1YVh1SndMTXNXRTJ6a3RFZnd5NXdyZVFOc3NO?=
 =?utf-8?B?TXJZQzJvUmNoU0ZYRHNkY1ljMGZVS2o4dWtCeURTVkJNOWhwWm1PdUJtUU1T?=
 =?utf-8?B?N0lwOHg3SzR5TnZnYjd5bitwckxyK2pXRG9lWG9mWXlvRlJHSHJhWUNNN1R6?=
 =?utf-8?B?eG5CTEgvc3VSYm0rekhlZWVyQVMxbkN2bk9Ib0hHdHBtOWdrTUoxaDlPZWht?=
 =?utf-8?B?NzhQb3ljeFYrbHpMWlBFdXoyTjREOWdzOGpOd1RPRG1CVGRMdGZVVlU5ODdF?=
 =?utf-8?B?UkZINHN2UlF6UVM2dGFvZ2ZQNWpHc3YwMTNvNXlvbDdoSWhhckIzeGJtYk5m?=
 =?utf-8?B?dXQwelEvSHNKeVYvbzhKNDJpZG5ENFhMMEhNc2c1RzhGanFmaVBWaEJyZDZG?=
 =?utf-8?B?VjdXRGU4dExoMTNyVXlMUTM5UklpelNiL2hxb3FTYTdKbEpiS1llN3lva2gv?=
 =?utf-8?B?eUJ1ZENRVm9zN25KSWNuSXBiVnRSQjdIeENjMTVIZHhmenFkM29nMEFWRStW?=
 =?utf-8?B?YXRSWXlad2s0V2pydEpmbXNIZ0wwVmRaRkw0bldhdlJQaUFnYzA4emZDa2ZE?=
 =?utf-8?B?MmxrZlJoZFMyeG4vQmM4S2FNeStBcGplWWNTTlZ0YVQ5RmZDbDJEcHZJa3l0?=
 =?utf-8?B?cW45Y01YMzl5ekhtZGJBM0M5WlZqUlp3MEZuNWw2clEwVDlPb25oS1lUL2t2?=
 =?utf-8?B?ck84ME5zNUplcEpqQmJhUW9KV2xpelpFNGdnV2pMSlNGSy9pUWFHSkxuWGRj?=
 =?utf-8?B?d2I3TzhYTHVucE4vNXBUQVZDVGFPNmlaak9nSGphdFBoVFpjTVhtS2pGM3Jt?=
 =?utf-8?B?NFVhNEx1R3g4eXdjZXpHRlF1SUtLbUtDZnRQOHNlUDZqRmx2dHZuNmdqcUVK?=
 =?utf-8?B?eWRVSnk5dktXZzl3L0ZXUVdsWHZFRmtDTjdlU1h2OWlIR1dSL3R4Y3FsS0RV?=
 =?utf-8?B?RHg5anh6VjlGYWdTU0tBMkZhMDZRanl4T1ZCaFBwVncvTnY4M3hWb3hwOFli?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5065d5-e88f-4b3c-e5e0-08de3809bd7b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 16:32:41.9733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPBWCCFjL2ysZNM4tfgYc6jGd7jKsH43Yx0lg/rXeo2Z2gzfigMCgLXFMORbTTyV/PWSh1MxmhST+IRpGWGFLlPi9PBbyq8kIVBelffFfzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5566

On 10/12/2025 8:08 am, Jan Beulich wrote:
> On 09.12.2025 22:47, Jason Andryuk wrote:
>> --- a/xen/include/xen/xen.lds.h
>> +++ b/xen/include/xen/xen.lds.h
>> @@ -173,6 +173,12 @@
>>         _edevice = .;        \
>>    } :text
>>  
>> +#define SCHEDULER_ARRAY              \
>> +       . = ALIGN(8);                 \
> While indeed it was 8 in all original locations, I question that for Arm32
> (and a possible future RV32, for example); imo it wants to be ...
>
>> +       __start_schedulers_array = .; \
>> +       *(.data.schedulers)           \
>> +       __end_schedulers_array = .;
>> +
>>  #ifdef CONFIG_HYPFS
>>  #define HYPFS_PARAM              \
>>         . = ALIGN(POINTER_ALIGN); \
> ... exactly like this. Preferably with that change (happy to carry out while
> committing, alongside a respective addition to the description, so long as
> there's agreement):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I thought the same.  struct scheduler is entirely pointers, and one
unsigned int.

I'm pretty sure that this "array" predates the introduction of
POINTER_ALIGN.

So yes, with it converted to POINTER_ALIGN, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

