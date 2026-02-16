Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD9yCPxFk2l83AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:29:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D4B146310
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:29:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234395.1537671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1TS-0004Lt-JD; Mon, 16 Feb 2026 16:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234395.1537671; Mon, 16 Feb 2026 16:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1TS-0004JZ-Fq; Mon, 16 Feb 2026 16:29:26 +0000
Received: by outflank-mailman (input) for mailman id 1234395;
 Mon, 16 Feb 2026 16:29:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aABt=AU=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vs1TR-0004JT-AD
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 16:29:25 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a77940b2-0b54-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 17:29:24 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6024.namprd03.prod.outlook.com (2603:10b6:208:316::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 16:29:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 16:29:20 +0000
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
X-Inumbo-ID: a77940b2-0b54-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOk+R92oLmzzB0/P1Mi61GmVu79F5M14KLRqUAyQFi/U7tKVU1hRI5M73IS/bqHVmzIZ4scHoT6+nBrN4ObvGbCs4UdrAUIdfGqm8K6mKilrjnsoN+8BtpEz4fvWLqUIxO+NdhZnSyTTCRb8SW8fgu1loZQxR0/zQh86+d1PbXx8lqzkLrxQ17LMAi06y4Fy6MOMlZUxrFXF73N1JJHAa+yuq3wpGzDZN9xF4bC+Zzh2aqx8KkeB7RMT88nKyiS1tzPhPOSTvOu27wbxun8rohJ+1wragBsduGGDB46a4wQqzSWTX6yJeN5RTu1d7hPxhLfHzKoiwYrUk5rq3ZJGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXMzX5X40VQWza4VCbk3ZN7TzYOwbZqo8WSW4WjSIrA=;
 b=E4+OuqtUxlIHkvPhBfa85vHzAPp1adSMhkGGWPzKVhv2epo4NpDwjVaLqms24K+vH8fs2LRf9CK93iCL66vzHj+7j+hbgJdMzNkyDYfD8jAAlcQlWzuoDLOqdLvSgzqaNvDRU3EMa7fWZhMPdT/gBi//Bqf9oJxCLXPVufavxVgiH0jU1JrJ5QA7rOfEOh8Vs8xoUbLQcxwEGillliN8SKufONsGpvtrSbtl/BIUi2ExD7Yjw4DoqIsOaBEp31BVnBcvAa3HnzaWz2RlfScQhKeufQyeN0d8lHUJTR2cX2GPqPchzbMWDLIvUidlh5bmYnhBZi8T449DnUeHgbj6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXMzX5X40VQWza4VCbk3ZN7TzYOwbZqo8WSW4WjSIrA=;
 b=ngx0PALOqi2glHBrxsmXiVeyc7LO6lI0ndppq5BkNNsUEbcGbi0iFYI6iN890JhskIGXawvcMRPk/GgWr7KF+W/waLzVYD4Txvh+m6BQz0qGLCQNB9rAMNFr9AciuFXWj4i1+5YlExHva5huO2DmWWbHgGKca9NAuGGJkIb9OtY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <50c79874-d07e-479d-80c2-7c0694a0828e@citrix.com>
Date: Mon, 16 Feb 2026 16:29:16 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] domain: move vmtrace_alloc_buffer() invocation in
 vcpu_create()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <528578e1-6374-4fd0-9f67-0769afd2e1c6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <528578e1-6374-4fd0-9f67-0769afd2e1c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0103.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 6767491e-3da4-41ec-de96-08de6d788976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnpac3ZIQkxEYmsrTzJMRytlTnIxbEZJTTFZekxxeUZ5clI5VFhMcWliZ1lp?=
 =?utf-8?B?bjcxbU96RWxpMHJKdEJ6L1pteXFZblZxSzFBN0pTdlhSWkd6V3BVZC9SV3kw?=
 =?utf-8?B?Q0dFbmRVVVRld3o2RXoxczdSTTJjMCsxSEVJbmNzdkUrN0Jpd3gyWVlhZnBT?=
 =?utf-8?B?RDAwcnpiVDgwT3RpOU9UOG04QnFkUVRXak5kSE5QMitTZ1hxc2JtTjBleHJT?=
 =?utf-8?B?dVBYNHplc2RCRWpDcGZWeXVYVS9yTFNmUEJFN2xTdGw4RzB6aW5sWXM3eHR3?=
 =?utf-8?B?TE5CVm81clJrbnIweVFNVVlnOXNWYi9qU25hbVYwa0N4Z2hYT1VMa3hBTFp6?=
 =?utf-8?B?czFOL1ZuRHFkOUF4OVZFQURsNHErNTRlRERTKzdmMXkwbkVGVlcwUzh6TkJP?=
 =?utf-8?B?clQ1YW9tbVl6T3NieENoMmJqSllIMGcvamRHdFJ6TyswNFpIdFpvZkxuOHhz?=
 =?utf-8?B?YTdpcmNrQTRVNDlsUlVIdlRwMWcwR0toRlpTQTd0VWl0cjFYN2NCNHVEcDZX?=
 =?utf-8?B?Y2dyaTJGUkQva3NFNVA1QmdLV1FkbEdVbGxhV3ZBa3QxTHlzeFk4T2wzNHhQ?=
 =?utf-8?B?ei92ZjlETU9aWHZMUml4a012eEJhbS9wTTBiUUwvN21TWWpwWDhHTEhmYU1I?=
 =?utf-8?B?eVRLTnhrbUU5SlhLbHZyVjNqclJHMkZ4ZElFVGhWd2d3YUl4VnRHOEV5OXpP?=
 =?utf-8?B?VUZGVjE2MVdmQkxOU0k0OTBDM1d6OTFkQ0EwcFg2Z1pSVjVJUDBXdGczbFox?=
 =?utf-8?B?dmo4ZkM4dS9qbW9LZHpZWURlUC8zbG44RnFWeUpydWxzTzJ5WWFZN2xBVVNL?=
 =?utf-8?B?VWtpZGNDR3VCbkFHOVlhYkZOaWJBcEF6N2R3cGN5TUtwcnhBcTM0SThvNWgw?=
 =?utf-8?B?bk12b2lBcWxLYlpqc2ZKeU9KVlJabDd5MWNkZWRLSzcwMWpwYW8waVAzc1V4?=
 =?utf-8?B?RHRrUi9IYVRiRjhQSHN1MFlReXo3dVk4WlN0UGdHbmo4NEFYeDhkYllSUVdV?=
 =?utf-8?B?VVNKM09OTE91NGduZUFCUkhZWVd5RnFxOU9RYnZxd2VGZHgyNGk5MGN0V3Zu?=
 =?utf-8?B?cUJIYUN0REUyNzJFOS93ZVpqYnJ1b29qSmRib2taQVZoUHNPbjZvTHpDd3BT?=
 =?utf-8?B?QXdGVFFkZ3VUb216RVhtbFRUdzRYemhVdlBBMUt6ZWVab213M2RhUUpnME5H?=
 =?utf-8?B?bUpuKzQwM3hYM1VxM3ZHb2pmMmlKWXJtakdYblpoeWpEQ0RPdmtONi9qdUND?=
 =?utf-8?B?OTY4MUtFT1FJZzVwcW5qS0pnQkpzU0tWY2w1Uis3dkxCUVc0THpYY04zQzY5?=
 =?utf-8?B?ZUh6ZU9ZNy9VUmZGeE5Vai9IZm13MDFsMmk5QVkzN3JKN2M1WCtWWVA3RWlI?=
 =?utf-8?B?QjBUOWlVY1BqNE4xN3BDQUQ5QldHbE43QVhnRjczWXN6SnRpYmFHbXFqcDBU?=
 =?utf-8?B?WU0rMkZiMzU1T292UUpFOStRWHRtaHVFa3RhRUUrb0M0ajFZaFZzK3F6Nzc1?=
 =?utf-8?B?VmtwdFh5K3lQSTk5ZXErYkhRdFhQMGpDcnQ3d0pZcGJmUmFORm1QNU9saVBh?=
 =?utf-8?B?ekkvZkw5S3hndlNZVEh1amQ3aWNuN2lMampjN0ZvRlZiN1pKaGQ1ZHdMT1NZ?=
 =?utf-8?B?ZVd3eUlINUhBaWlYeGNUc0w5TGN3MEducTNFTUlxZzFZcTNRZ1VZYjBQMklx?=
 =?utf-8?B?emxWMmU5QUFXUVpiQWt6MnFBMERiSWQwWUZaQWlNV0xERmxUVjNtUGJCbld5?=
 =?utf-8?B?cnRWSFF5eFBaRVJpbUhDQTNPcndqZ3NFVGhVSlpIY2xUN0NTS3I5Qk4wY3dZ?=
 =?utf-8?B?VURNYTlucjlCNndPY1lLVXBrWmdnZER0d1R3aitMK3VZNWo3bmc4RG9LR2NH?=
 =?utf-8?B?T1JuRURCQmFWL1lmVUxLaDA0eEFSMUR0UFN4a0RuZzAyNlZ3MDB6U2ZIU2JY?=
 =?utf-8?B?UDdjT243MndkL2lTZXdWaUNNMkpQckVBK2crNzdFdVA3U0h3dlUwc2tWcFJh?=
 =?utf-8?B?VTI5eVpTYWpNSTRvbTRVZjREaFgvWVlWNmw0Qm9QSWNmMVg5cUppNXliL3lB?=
 =?utf-8?B?ZXp2VlhMZHUwS3BQTzBJV0x2WVpzZFQ5S0ViZGViTEE4SUFQTU9xZnlJVHB4?=
 =?utf-8?Q?pAI0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzJuZERWN1RSV2VjY09nbHFMZXFEUXhLQmh5dlZNdzJRTzZUN3ZZUDdydUxU?=
 =?utf-8?B?R0Y1WDVhNlhyZXl1alJqZFg0M2xWSWh6OE5QNmY2VGRPR0JwcitscnN1ekt4?=
 =?utf-8?B?cCtPT3ZMK1hNSDRGalBwak1qZ0Ivc2poK0tGbFJuNVVrMjhOOEJGd1RzQXNH?=
 =?utf-8?B?dGJGUFdyanc5Z0R3OHlVQ3lMQlNWS1E3L0VwaXdEdEZyM09vVnYwRTYrYU8w?=
 =?utf-8?B?aExpbjRrU1V2UlJBQVhVMGVTMlV2YWozUHh1ejQ4dnNsaTRUK2hpQngydEFw?=
 =?utf-8?B?dzcrYlFIOStSUkpRZHA5TkUwRCs0WTNvUmo4Q0dyeElaY0RLaVhiZ0l1dndm?=
 =?utf-8?B?YzFFcGc3RWJ1T2tldEkyYXd3WU1DZXB1RVhQU1lHejQrMnp0SWgyVnZ2T1kw?=
 =?utf-8?B?Wm5PbktSREdMQVBBVTdLbDUzQ3IzVkpoL0FQL0Nzb0E1TG5Rcjg5NndnSHda?=
 =?utf-8?B?ditHd2swUlhxNlJpU20zS1Uxc2psUElMUzUrb1I4SHUvWS94d08wMk1FUTVO?=
 =?utf-8?B?VkNsQTk0dlkrNGhTUTk2Tk9SM1JLYUlKVFp3MDVJeDk5S0N1ems5YzlySUEx?=
 =?utf-8?B?a3RnK3dESUdNRWpENE1RMEtYWWQwNGNLcHZQTEtnYytHZWErZEt5aWRMR1g0?=
 =?utf-8?B?dU5ESTlQODRPUkFjeHlFU3c2RXppc0x6TnJFOSsyakV3SjdqVTRZcXN5b0Fy?=
 =?utf-8?B?Vm51K2dvcHlKdG1WQTE0TnlaSHBpdzN3b1ZpdHIrYlY1WkFzZUFqYkZXV1Mx?=
 =?utf-8?B?a29ETmpEalB2VCtWemxNZkJNeVlxZVBYL0QrOXNCaThZMVhCUWZPVWRpd0hS?=
 =?utf-8?B?N2xiMDVNeDNvZFR1TkNSQTNFRkhINVlOL0EwVXhNcFhkdnVSZStQRGZNc1Yx?=
 =?utf-8?B?UVdGV3U0Q2lVdURaZmhrb0R5bk00ZTRvV1JrdjhTN2R0SGdoN1RXTkk4TUpE?=
 =?utf-8?B?a1JuMldSVlVHaDdiTGZzTkhSVG1sR2E1MjI3RkZVWWdDNThTdVBCOUNrYWRF?=
 =?utf-8?B?VmppSTJjUitUQ1lTR2xEWCt4cTl1bFI2YU96SmI0RXIvOGpPZ2RXM1R6UEZj?=
 =?utf-8?B?TUF6bnZtdzdDU1JONTVVYnFDWG82cWtGSjZnb2ppbFNrRXkwTkJGWkU5aVpI?=
 =?utf-8?B?OXM4czZabWQwOHNobFNkdFlreVJydzJFc1VPVnQrUU1MbDJIMlZFNjBLWHA3?=
 =?utf-8?B?Mjg5anc5NkkxM1JNU3B6b3I3WVVYM252aHpScUNnRFZqNFV4U2NzVlM0Sjcx?=
 =?utf-8?B?dTZGeUtFUFJ4cHRGbGRLNEZ1TGVpTnBOTjB5RVc0VHpiNThoSDBuL3VLMjZ5?=
 =?utf-8?B?emdsNWh6RFRmT0hoRUh5SHNhNnZGc21NUEhDam5PcUVnckUvL09iQW4vOEdE?=
 =?utf-8?B?VHNmd3pwYnY1NWIyeTZDaUZ3VW91UU1mVHdRRWpuQ2FaaUlWR3p6WWEzcDhN?=
 =?utf-8?B?V0tSRmFxYlRQV1lLc1NBd1dTdmVUblMzZXQ0clpzbkcwanJuWUx2VW56L2o5?=
 =?utf-8?B?Szd0V3pMdDBJbXVJckdCVEtjYU1ESjFuYkMzeUo5dVVLanRuYzJnbmNldEEx?=
 =?utf-8?B?MDJoT1V0UUs3cVBGVFcrekc4LzI5blVRdVhVZStBZU9tM1F0OU5ZRHFBc3lm?=
 =?utf-8?B?TEhCM291eHNjNkxIVGxQTGw2VTAxNHpCNVg5Q2NTZEU4eWRuNFExQ0hkVGdv?=
 =?utf-8?B?VmVHakNNaG5BMHh6U1hDR1VZQlErNWVDb3R4Rzg1Vjk3UFMzVkVRaE50MjFG?=
 =?utf-8?B?cE9BQ3Y3N0duNkhvMWRuVWUwNVdPNkxQcXhkTy9ObjluQ2NQRVEwYkJMVXVG?=
 =?utf-8?B?YndteEFsV2EyVFZIYWlKbTBRbkZ1NkVKVFdhRUhEd1FNSHpaYVdxN2tPM1NN?=
 =?utf-8?B?VndJeHozU3B6emwzYlZPeWx0L2xFV2JqV0ZmSXA3T1RzUk45dVBaMksrSmZ2?=
 =?utf-8?B?TFkyWjZ4Sks1RDdmWWhIcnA0aWY4VytrTEJuMXFDN3VlVC9JTnZ0SE5XdEk2?=
 =?utf-8?B?UkNWQ2x4Z0Q3OVU5cFdJcmRBMlM2RW1SaGVON3ptWnMweTh2YkNLdXZkcTRG?=
 =?utf-8?B?cUNmRnhBWm5GS1ZTUTJkQ3pjSjBESWV0aXk1UGEwdjMwRWEwN1ZvM3lzL3I3?=
 =?utf-8?B?RHQrWUZoZTdKRmlPeVNkL1FiWjNsMWNLTnlrUmN0U2lsVjdtYkdIUUxXc3J2?=
 =?utf-8?B?dk5KQ2ZNK2pJNXl5Y3dvWERsRzh1bzE2ckw3N05EMUEwNk5WcVF1bGc4QmNW?=
 =?utf-8?B?MUt5SlJhb2VuM3lJSy9JWHl6U3JDNXpKUEpuVHBwK1dmWkJDZUJleTIyZlJR?=
 =?utf-8?B?VW9JS0lWb25MN1FyYUZrRWFPNkFiK2toUVNETzN6NEJYelZTUHB2dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6767491e-3da4-41ec-de96-08de6d788976
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 16:29:20.3805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLlLbaEnjkKncctrHyUpGcUbAq3/yCyWdPWRstWjS4e8pOZ2mBxVm568mf4WYemqIaLSHioU4OTYVUF7oXKnmWqCzXAzo8g1soDRB6OhcZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 74D4B146310
X-Rspamd-Action: no action

On 16/02/2026 3:51 pm, Jan Beulich wrote:
> The label used upon the function failing is wrong.

Is it?  Which label do you think it ought to be?

>  Instead of correcting
> the label, move the invocation up a little, to also avoid it altogether
> for the idle domain (where ->vmtrace_size would be zero, and hence the
> function would bail right away anyway).
>
> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -493,14 +493,14 @@ struct vcpu *vcpu_create(struct domain *
>          set_bit(_VPF_down, &v->pause_flags);
>          vcpu_info_reset(v);
>          init_waitqueue_vcpu(v);
> +
> +        if ( vmtrace_alloc_buffer(v) != 0 )
> +            goto fail_wq;
>      }
>  
>      if ( sched_init_vcpu(v) != 0 )
>          goto fail_wq;
>  
> -    if ( vmtrace_alloc_buffer(v) != 0 )
> -        goto fail_wq;
> -
>      if ( arch_vcpu_create(v) != 0 )
>          goto fail_sched;
>  

The positioning was intentional.  I just didn't get to wiring up Intel
PT for Xen context yet, and tying the buffer to the idle vCPU would be
the obvious choice there.

The chances of getting around to that are admittedly low, so I don't
mind moving the call in principle (noting that this is a wish that
likely won't materialise), but the claim over the label needs resolving.

~Andrew

