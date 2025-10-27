Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D16C117E3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 22:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151787.1482324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDUXA-0000Jl-E0; Mon, 27 Oct 2025 21:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151787.1482324; Mon, 27 Oct 2025 21:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDUXA-0000I1-AX; Mon, 27 Oct 2025 21:13:44 +0000
Received: by outflank-mailman (input) for mailman id 1151787;
 Mon, 27 Oct 2025 21:13:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=de0O=5E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vDUX9-0000Hr-AV
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 21:13:43 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d00c0565-b379-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 22:13:41 +0100 (CET)
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com (2603:10a6:5:34::10) by
 GVXPR03MB10780.eurprd03.prod.outlook.com (2603:10a6:150:226::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Mon, 27 Oct
 2025 21:13:38 +0000
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3]) by DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 21:13:38 +0000
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
X-Inumbo-ID: d00c0565-b379-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQRybI8wXl4d2GV86O9NiZoJsxOni3OR6l81hoXzC6L7Hb8wxSGvM89aJMxKl4JVMVj289iWtxqY1IozoDDHbU5O5xdZs9sbKV3beST00SDcRe6p7dWz9FnRJmcL0JOg/cAAXywD6m5xHSRQfYW/slDKt8nStfa/qG0EPo9/BqxHAgO2ZY5dvSKORRjX0LEF7ajoXCm3GTGyLtpIRT+fYSB6rt3EaEcbWEtabXpwAisvZOOVHmmU7l+MXpxCN/fAJW9+2LFh72O/VU2I5KOG8uDpaHBuA5MmT2RibP3f1q563Biypy3SGgv0qHcnKn52gnKMURi2Nl4g0lo5Jh0asQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcmCZIr32s3TT5kr9ozaZ8XBlM5npTBDs6uG5N73rsM=;
 b=KO10bsCtrc4Da21cqHiZk5bEQHAdlDhpTaiQo3kkYRLAhqpHaAOGAbABgJUsAhEdOe01dnNBAKWouMLHN4o/tSLTEDNtbzfJ2l274CjDJAMNTDdK6Tat8SVyp/F0y+aMnnFlN3szn0Yk6O71y0RM1lC0cnRTIHK9kIiETUGx6tAWjwPrUMmOt4NhZ29h0T+m4+ZCKazMdPPEC1itnl1Fnt/wS4JMpg22AbU8ATxIQnthKG6S0BavWJeyNGvnJ/CBTARDGXKLiYBkH3nv25RoB223fM1kHG4XlvPpXwf0cGD8FU9hN4GhoUGJCJZ8zS0f2GW08w2QwiUGSujSbntHTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcmCZIr32s3TT5kr9ozaZ8XBlM5npTBDs6uG5N73rsM=;
 b=TQW+vLgT5lKbrfGiWWzqJfNN+ktA8b4yQBXxQpSb59mZs0aHS+SXNfDz33fbnW+AwGiRUrQ0MUggKhbvyIBrDwPcx15ijC4h3CIFB6frfaqm/Zqx+Do0RF2x/o2Uyma6hNeV3OoWRyCe1+YhGKovaAtqbsmGkmMn6MEFTXgW6EudwqJOZ3sr6tTypzK6ZZ1rOvAym3n1NZgEe1f+rWuaxrbMlTnWStorWmiKlX1KBlOe8bfWfcKXZ9moAoDI/11Z0w0xk6Zd65vHr6SANP3AlCBT2xy+LPmQL9QI95JeIZF+h8EXd0MJ9lcHQgXCX+ZR+OYLGTzKqjHAMqh61UJ35Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: address Rule 11.3 for NextMemoryDescriptor macro
Thread-Topic: [PATCH] misra: address Rule 11.3 for NextMemoryDescriptor macro
Thread-Index: AQHcREbgd161cNZLPEqc4+KUMk5T6LTQ6yIAgAQN1YCAALvbAIAAz76A
Date: Mon, 27 Oct 2025 21:13:38 +0000
Message-ID: <66c112d7-547c-493a-a1fe-690b198175a7@epam.com>
References:
 <78112778d6fd5f720f7102db7125c844b747a962.1761242341.git.dmytro_prokopchuk1@epam.com>
 <309b29ce-2e32-4f9a-9436-051cf65c0780@suse.com>
 <c64c1733-e2bb-4fff-b969-5b075ce75f04@xen.org>
 <f927e76c-6221-4833-b4ff-2e9cb0673ada@suse.com>
In-Reply-To: <f927e76c-6221-4833-b4ff-2e9cb0673ada@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4140:EE_|GVXPR03MB10780:EE_
x-ms-office365-filtering-correlation-id: 9bd73d96-d732-46b2-c6ac-08de159db2da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?T0VzTVN0eWxpWld1ZXlLNzk1ODlNY3VkM1FiSDlhY3prRHE1VVdEMm1TTmV0?=
 =?utf-8?B?NUpUMVFqbEQ2OW8ybkFueTduTDBqSTZ1N3huRWIweHpCOVMwVm5PVGdwM09U?=
 =?utf-8?B?TzBCdXUzR3p6V25kZHNOOUxvVW5hOXVBVFhJbmpnelVYajhsLzk0ejZDQW56?=
 =?utf-8?B?L1kxcFJ5ckt2OWtxNXpzNElKT0V0UzlNeGZhZXVWK2pxcVNMeWpIbE95b01K?=
 =?utf-8?B?MzY3Tlhhdm1lOVh0VlYxMUp4ZDdyRTdNWHE3UlZZN0R5Y3AzKzZyOFA4Sjhm?=
 =?utf-8?B?WlJxUFdwQnR4MWQzejZOc0hJYU1qeWtiTTFjdFgwR3l5b1FFQWNKUlBQM29F?=
 =?utf-8?B?a200bVg3OXUySXlaYVVycVRSTXhRQmpmWms4MWs3d3BPN2dsSllPSnhiRmVU?=
 =?utf-8?B?cU9iL3NuNEUyT3JaamxRNnRYOHBoeDlOLzhjaUZRVWlkTTJPR0FuR3Z3bzBS?=
 =?utf-8?B?aDZJdk0zOHgvRFFYWWJ1WW9wYUZOcmRzOEFxaFpTNmFhTzV6RlVyL2ZwbWlt?=
 =?utf-8?B?c0pJVFZnVDhQZS9Zcm1IT1EwZkpxTlNBd1pJTnZhUHFQREdyMW83NnlwdHJQ?=
 =?utf-8?B?d3pNRVhwdWw5aW9uNGNacXBLVGRFaUxqUXhQang1NHlLWktuUzcvOFF0VEU2?=
 =?utf-8?B?cWptS1VUWnQvRCtPam5hOHl4bU1uVXhXRy8zZXM1MzBaQlhIMmttYWpLbXh3?=
 =?utf-8?B?TG4vQmhDS2VYaVBLZ2NBQlZMaktuNWNmdlp6YVM0ejlsR1dnYWZyL05iNk5v?=
 =?utf-8?B?R00yYUNWak5iUUlLL2FRZVEwRS9lSVdpck1iSms2ZjN6ZnRiaGpBRExmVm9i?=
 =?utf-8?B?THYwbHQ5L2g4Q1A5QlBLMnpNYTZmTUZGQXpKaDNSQnBlcVd2Y1R2R0xOcHpR?=
 =?utf-8?B?VSt4aGJVdkRiYk1lcDJ1M1NWQ3RJcmhpV1ZLRlVRRUFlMHQ3dExac2FPaStX?=
 =?utf-8?B?UUJMWjRIb1hPSEJQNzgrTURUY1NvOFErb2pFR1QzNVcvQW40eDRHVkhUOGkz?=
 =?utf-8?B?NjJ2TzN4cjA4NDZYaVlIOVQxVVVLd2NnQXAweGhmYU1ld3g4ZTRNUmROcTBl?=
 =?utf-8?B?T3ZlN3d0MVBLa2N2L2d1V0ptb0FsOU9Fb0hJMnFOY3VLbzNwRUo3c3luWEFn?=
 =?utf-8?B?eWVjZ0U5NnRhSEJpVXZOdDNOT09VKzhhWkJReWk0Q2hNWlIwRVQvVGlEU0JG?=
 =?utf-8?B?ZWJmQS9PSFU2RFIvOUhjeDE1eG13SVJTbXdsWS91NGNmUHFpMGpyUjZ4Y0wz?=
 =?utf-8?B?RUsyc3V2cEl4K29jaTNFT0VjQmNNbW5PVE9lQmZUUWhOSjZYMnF0ZU1NWmM1?=
 =?utf-8?B?OEl0R0ppdVBjajhVQUNHVU5vZTJFYi9vTkNxTlBqR21PWXhlL2FYSlJyMGdw?=
 =?utf-8?B?UjJHRG1rUXFDelE3WFZvZWpuR2huQWIwRGV3QTdzUmcvZ29tZ1ViZ0Z6a1VU?=
 =?utf-8?B?U1FmQ0UyZkZnaHppZ0tKRGF2Mk9MKzUwVUE1ekViZkRxWjV2ZWV3UTBXQlV5?=
 =?utf-8?B?Sk5DNzc2d0hvdjN6NUtDc0p6Z0t2R1oxdVBRWmkxTzA5VWpVaXRxYWxFMkxz?=
 =?utf-8?B?b1AvSkJPS2M4ZzNYVStVaXZOWVFJUzVHeGI2MVg5N01mS2dUK2JkMkcrUXQz?=
 =?utf-8?B?RmhUNStRNkU0SmhCSzFnTUNiempkcEl3azRRb0JicDhqN0cza05hWk1peXFJ?=
 =?utf-8?B?NXNVazdDVXl3SEJkUmIwWHIyTUVzYjY1Vk1lVytFWG9QYWtmUFRxdDNMaHZN?=
 =?utf-8?B?N1ovS2k5KzB2Q0FmQVpkUzR1bGg0ZjRqNXdtRTZwM1lILzJFVGhFU2hPblZW?=
 =?utf-8?B?YXp1Mkw5NjEvR3Q2azVYejdtcjBkbkZNcm9BOHJpb0l3eWt4ZWVCVlBkZlha?=
 =?utf-8?B?bGZBcUoxZmg5RkdkL2UzbFZMVWJncDZZZUxGV29rd29YR0dSYzlJK004Z1BZ?=
 =?utf-8?B?VVdMQ0xJWDFCMVlHQzgxZkpYOWR6bVNBdVdaYno5Q1FMU1VmTHlUdGR6WnZF?=
 =?utf-8?B?bGFCUlpNd2pUNjZhamNsczRham05cnh0TXlWTXFLM1lySWY5RldzcnRoM2tL?=
 =?utf-8?Q?CYrXcK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4140.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUV2STBFWUNnTksydWVYcGJXN2t6ZW5qaGRhRmJqcEFVT1VvcTJmaGlaWjZE?=
 =?utf-8?B?eU8zRXZicmdndXVkUmxJdVFZT2dLS1duVzNNcDhLbUQycHd0OE9ES0p1MnBa?=
 =?utf-8?B?aFNpZXNTOVY4U0oySG1qTkVvanVoREFKVmVnK29yL05ZYVhsTThyUTFqUjI1?=
 =?utf-8?B?bCt0VlAvaXVBa25UZDJ5bXp6amV6aHZDVW5aQW45ZHBqejZseVZjamhlVlkv?=
 =?utf-8?B?b1M3N1JXNkgzRHVYdVJSaEFmejlIUzJVQlNucGlYekdsaVROSnhBanNycFl2?=
 =?utf-8?B?aDNKUU1MNlZYVHBTVDlpOVdQT2pseTZiVDNzcUxzTDZlUWFLZXUxOWVvVi9p?=
 =?utf-8?B?UVl4MzBmTFdMVEtydDBxU09YK1VMNjc3YTR6NTJQZEFXbzJPUFpKd21YNVhu?=
 =?utf-8?B?VVJhVjZBMlBwSUloMG9OdzVtc0tKUUl2bXFMR3RUNGEzcExpWlgwNTFQOWJK?=
 =?utf-8?B?OElLRXR3K1FpTmp2S0QyM0E3bkxhZVlES1RScHhhT1I3STZGZjNtcU1vQnJK?=
 =?utf-8?B?VzlickJSenVaYVE3NEdwcWs0VlVMa1l5UGdLaW9LV0pIRnVEME9jenJ3OHJ3?=
 =?utf-8?B?TmZ5cHQ4TjBkLzVjTkxES2d3Vkd5eFhBL0ZyVithNFF4cTMwRURsdnZiaHpO?=
 =?utf-8?B?QXNBOGtnZ3Q2cnhHdllkbkhYa1BEZVpSU1E1SjZrNTJ6S2dCZGM5YlBXNVZr?=
 =?utf-8?B?TkdHa2l5Vm5GZnNhMjY4aGlqN2ZsMmJnZ1dXUkN5L2xORWdLTGxxQVZqTUJi?=
 =?utf-8?B?cTNjNzdkT2VlT2JkUVA3b2VjK1UxKzRiWGh1UWEvWFlsQ001d0lETW5IYU9Z?=
 =?utf-8?B?bHJPdnp3MTJDd0RVY2t3a0UwbnhNQmhXblpBaEU4cnFlV3dKeFJaZFErY2lk?=
 =?utf-8?B?MW9vRXUwS256amxaQzZYZjRWdm5TR0FuRVRzcDdOUGk2Tnp1M2lmRFptcFJ5?=
 =?utf-8?B?M0JrYkF4Umo1S2hjMEd1SENUNU1kOHBrbjQvNGp2ajN2eXNYN0Q0ZXMwVUF6?=
 =?utf-8?B?THA3VnRuNXY2d1BhMmQ1Z2d1OGpUTHozR295d1JsbVpIbGhWeDhSSlQxVWdC?=
 =?utf-8?B?TkpXUXNvN2h1eWNVTFVuRTRmcm5ramhKQUpINU84YjBSUVNTWjk5blVZQlVC?=
 =?utf-8?B?K1JHQmNnRmJ1cjFBekVkK3BSUXlpRzFJNkR6UGZLb1hobUhzY1FwQS9kcFlC?=
 =?utf-8?B?VG9iRzFucnhFZFVMV0YrNTdKS25WK2c5R3J3THptcWoxa3FXN2ZXTEhid2Rx?=
 =?utf-8?B?dks4Z0J2cU02TkVxb2h6WnBLT3BBVW4vczZkNjNETDJ3RXVuS0cxYmFZb0dX?=
 =?utf-8?B?NlV1MDFEVk5hRlNnRlJqQlBQMlVEelNmM1lEbWpkZG50Y3FOaGFOaDg5bW5x?=
 =?utf-8?B?VFZZbTJ4QnYyMVhSVVBTdEoxZ0RMcGZTbkxsc1grUUxsdCtmbktHUmFZNy9K?=
 =?utf-8?B?dFg3VC9GZktsOVdQMWJQMGU5RmcwNkRrb1FzOXVNL3FQczJ0bWcwV0tzTXNo?=
 =?utf-8?B?bnVOaE1HWmRldnFieVRuamV3cmRDcGIxcXEzQkM4cno2Nk8zTmJpWU54YVBJ?=
 =?utf-8?B?Qlg2UHg4eUgrU1BYcXNwV2NKeWtHRTZKNVcrREc1RjhIRmtMNUVFbVhjZllR?=
 =?utf-8?B?QkhKcG03Q1puVCtBZEFPT0dURjdqQzFReHByMDRyQ3l5cDczVVVUdlR4ZThn?=
 =?utf-8?B?QzJmWUFualRuYmpFRUpzaEFsSEJCU0t6b3ltVGJXdGJNRi8zeHkyOU1IbGFD?=
 =?utf-8?B?UUVVNU9hZS9UK1hRNi9nMi9CdEFNdXl5Um1ya2VKcEMyMm5sck1OM2wvNUhh?=
 =?utf-8?B?RjZLbmhqVFFPV2JjLytncDlrcnRZcDEzWHJSQWFyWGdadkRsa0VaZ0w3Nmh5?=
 =?utf-8?B?OENXV3BRdzkwYXBmR2tpWEJTdnFMWENwb0xNSURxSHZJOFFCaDVoMlZjakFn?=
 =?utf-8?B?WHhQazIwNnYrUEd2RmtkWWJhZkl4SHFsaEh4M2pLdTllaTZGR2grbHlRb1A4?=
 =?utf-8?B?YjZCWTVwcENoMHZHWEUzWSt6dzZWa2RZa2lReDk2ZC94eGdiamdKek5EWm9T?=
 =?utf-8?B?a0FFeFpXelN5MWdDbDhzWC9GMTJ4bUE4OWxTbUdZSXJKbGdURGhXNGx4eVFa?=
 =?utf-8?B?UnJhbXJ1NmIvUWF3dVVZWlhvK1hWRnczRWFqdm9CMjUwWDdiUVdZdjJhbERC?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3163F908B92BEE438DF29069A804F44F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4140.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd73d96-d732-46b2-c6ac-08de159db2da
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 21:13:38.7287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +jvareGGvNEASMSD04fD/f0TtIkVg6OR0BKEob1iiKWePN9NUlZ55RbO88zdO08lBTkmFOZUvoWsK1npasqFVB5EG3UhwDP7CCqDiIBJSeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10780

DQoNCk9uIDEwLzI3LzI1IDEwOjUwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjYuMTAuMjAy
NSAyMjozNywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gSGkgSmFuLA0KPj4NCj4+IE9uIDI0LzEw
LzIwMjUgMDg6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIzLjEwLjIwMjUgMjA6MDAs
IERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2VmaS9l
ZmktYm9vdC5oDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaA0KPj4+PiBA
QCAtMjI3LDYgKzIyNyw3IEBAIHN0YXRpYyBFRklfU1RBVFVTIF9faW5pdCBlZmlfcHJvY2Vzc19t
ZW1vcnlfbWFwX2Jvb3RpbmZvKEVGSV9NRU1PUllfREVTQ1JJUFRPUiAqDQo+Pj4+ICAgICAgICAg
ICAgICAgIH0NCj4+Pj4gICAgICAgICAgICB9DQo+Pj4+ICAgICNlbmRpZg0KPj4+PiArICAgICAg
ICAvKiBTQUYtMTUtc2FmZSBjYXN0aW5nIGEgcG9pbnRlciAqLw0KPj4+PiAgICAgICAgICAgIGRl
c2NfcHRyID0gTmV4dE1lbW9yeURlc2NyaXB0b3IoZGVzY19wdHIsIGRlc2Nfc2l6ZSk7DQo+Pj4+
ICAgICAgICB9DQo+Pj4+ICAgIA0KPj4+DQo+Pj4gV2hpbGUgYXQgcHJlc2VudCB3ZSBoYXZlIG9u
bHkgb25lIHVzZSBzaXRlLCBuZWVkaW5nIHBlci11c2Utc2l0ZSBjb21tZW50cw0KPj4+IGlzbid0
IHZlcnkgbmljZS4gUHV0dGluZyBpdCBpbnRvIHRoZSBpbXBvcnRlZCBoZWFkZXIgaXNuJ3Qgbmlj
ZSBlaXRoZXIuDQo+Pj4gQ291bGQgQXJtIHBlcmhhcHMgZ2V0IGF3YXkgd2l0aG91dCB1c2luZyB0
aGUgbWFjcm8sIGp1c3QgbGlrZSB4ODYgbWFuYWdlcw0KPj4+IHRvPw0KPj4NCj4+DQo+PiBJSVVD
LCB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZToNCj4+DQo+PiBFRklfTUVNT1JZX0RFU0NSSVBUT1Ig
KmRlc2MgPSBlZmlfbWVtbWFwICsgaTsNCj4+DQo+PiBJZiBzbywgdGhpcyB3b3VsZCB3b3JrIGZv
ciBtZS4NCj4gDQo+IFJpZ2h0LCBwcm92aWRlZCB0aGF0IGVmaV9tZW1tYXAgaXMgb2YgdHlwZSB2
b2lkICogb3IgY29uc3Qgdm9pZCAqLg0KPiANCj4gSmFuDQoNClRoYW5rIHlvdSBmb3IgdGhlIGFk
dmljZS4gSSdsbCBwcmVwYXJlIHYyLg0KRG15dHJvLg==

