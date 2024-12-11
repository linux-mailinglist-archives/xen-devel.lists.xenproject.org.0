Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C65C9EC969
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 10:44:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854218.1267478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJGo-0005Tk-CV; Wed, 11 Dec 2024 09:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854218.1267478; Wed, 11 Dec 2024 09:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLJGo-0005Rn-8e; Wed, 11 Dec 2024 09:44:38 +0000
Received: by outflank-mailman (input) for mailman id 854218;
 Wed, 11 Dec 2024 09:44:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqCb=TE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tLJGn-0005Rh-79
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 09:44:37 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2416::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 877dd6c8-b7a4-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 10:44:36 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB9247.namprd12.prod.outlook.com (2603:10b6:806:3af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Wed, 11 Dec
 2024 09:44:31 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 09:44:26 +0000
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
X-Inumbo-ID: 877dd6c8-b7a4-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8XiTdAtYyAKPuipMt4HGbCZ2PKPo92s/2EwtUFDCumDLMgYVCnaATR6P22ETBwXFPfH9yos6nL6+gK0mMjqxgGUVO2TG1Q/MnbT/4zU4CntRp2m22uC3gwt2keg80/wL/EPl0tJTeNN9904fPOw8a5fCSgUD0mf5qbuNA5BMgWMGvV3nqtrr2h17zCh6w0I9AHrvkIJNPbFCBUc3ewXh4Wu+sTOjzCige+Lcd4b13fVx6dFN01xRrklj5bUTT8ZsfVODjsKt9Aw9EqmxQ8H9+nWVCdOtRRNBnGU64AAUmbxfGBeDc/T9xJzV9S48xS0IDA+ZY4qHmeh4zj7C8M1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7x0wzU8pbPNe3Kl4q9awbFtWXBJVc4ESh/0VCrA5QA=;
 b=FCIXdF9TJ0flKte2yCH8WCVXXBZgr510vwWqlvY0vzAWXMSKWq93wF0WwQi2PgYey8UY8F8X8Y4WrViB1XOcIRBvIffoXpEj58kf8VIatmOw9yA3Vj++FnWijuDCtCfxP0ljLR/rjc31q+xG0cS4E+UMWjvxDbZbtOXY2lSVYuKNwk6igD6/GdKvzCkP4kKbWUfkM0tV4kVIHPtuI5HG0oP3NntGcpO1O9uA1y4nqmrKLL35HmwqVwVFO6AczlRV7oFcT2SD3u3oezGWf0Pm09tVbQefgJNGTYvAyme3NE6YlVS+ULxbR2BMZRyVeBuf2IE2ZXoGgCt1npQy3Gn1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7x0wzU8pbPNe3Kl4q9awbFtWXBJVc4ESh/0VCrA5QA=;
 b=2Ws/td/9UJJ+ZNLKXxjr3CDNXveT3b8eNgQzzJDuSEJH4kX/j43aPmsWOL/pcFsCThbXF5BpJJxJVmhcJcDqjx+f+mhlQH/Pwgz+T2zlCOGXTc+MGrTev9Br4fjrrlZh0vzrNorr4VYRiVEkONA0+ZAsrEUdvBuZhMouQgzbHGM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Topic: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Index:
 AQHbRIDgGHZ3ofHO0UuqqXvn+EZCabLd/CGAgAGXh4D//4qBgIAAiieA//+hwICAABlHgIAB3TaA//+HM4AAEuLWgA==
Date: Wed, 11 Dec 2024 09:44:25 +0000
Message-ID:
 <BL1PR12MB584957E4230949C480BE6B04E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
 <BL1PR12MB58492072C5D445052FD056D5E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z1lQEdXy_Njy8wAf@macbook.local>
In-Reply-To: <Z1lQEdXy_Njy8wAf@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8230.010)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB9247:EE_
x-ms-office365-filtering-correlation-id: 272af18f-3c94-419c-2a32-08dd19c8667c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Uy8yV0p3SWJXcnNycW5QaDVaQ2E4bUlNaDRETkhxOXB6S3M1YVlIT0VwYkFC?=
 =?utf-8?B?Vkw1bVFOV0hTQWgvMTA1emV5azYxR1I2aEx6K0lFalF6dkhjaERHamg4dHR2?=
 =?utf-8?B?dURLYkV3S2pJbFNXV0U4K3h4SjdGMTZxcGR5SFZScjl4T3JQWmZZMFdSUXJT?=
 =?utf-8?B?d1l0MWMxRXhvdlIrcStsMjUrRW9WUDBMamVhOWVhV1F1Wjc1Ti91NHZncFhs?=
 =?utf-8?B?ajFNVnJUVXpXdUZ2enlWeTlXaEx3RW5LM1pRU1lOL2tFL3l0b0Uza1RRY0xT?=
 =?utf-8?B?d203SUxVakgrbENmR043ODNQeUYyOUR2UXZvSURLKytMVElJRnBZS2RTTktD?=
 =?utf-8?B?eXBDakZvMHQ3eXFrM0Q3RXdDNEZUVXkxM2FldDJZS3hEUnZxa3dnb3hjMzBD?=
 =?utf-8?B?dzIwQVp6RGFVamxDSFhVV0VLbktDYTRYOXI4ZlZVUVFhRlB5TjA2b3MraFc2?=
 =?utf-8?B?VUpGYzRxd3NjbVozOVRRQURwdDhvcTd6UG5Gc2RKU2J1MEFLMXlldnR5a29n?=
 =?utf-8?B?N2tuL0JhZ1RkQ3Zzc0QxQ1NiQUlPdWhtTXYwR2N4VmNlSTh2STBMdERqOE1y?=
 =?utf-8?B?Y1FUTWptaXcwTWM0YXl6dEg4bCtldXN3U25hRGRJS3BWUU9TR1plS2lydmkv?=
 =?utf-8?B?eUlHOWdkdTh1Mk1oMkhJQVhKRkhGcHpnd3p4UGNvZnhnTDRtSkd0WVd1RzZ5?=
 =?utf-8?B?MWZWZEFVYU5UT0dsK3Bia1A2WnlaVEhHR1FPYnlqM01ZS2JsL2c2c2crWlRE?=
 =?utf-8?B?bWo1djRCcnJSZmNwRGxIWEUxZmltNEJWTGVvaDkvbUhzajhzbENLRXVVVlk3?=
 =?utf-8?B?QTdzVDlmSXhPVHdTV2taclg2ZXA2MVl5am0zeExMREI0WStIM2czNSs0WW1z?=
 =?utf-8?B?THNGbEVCV1RIZThlY0dkME5waFM3b3J0a3FtUWhMM0JMMnNkRGxmZEpiRWlG?=
 =?utf-8?B?R0k1NWc2YWhpUDFNaHhvd3EzVW5WbW9JTCtWazVhMGNpd1JoVmdjVXpNZDlK?=
 =?utf-8?B?RitENXZpaHRtWVVRMDN2eTIrRDcrbGY0dEZEb29SaU9Qc3VFZXpQekpXeHdY?=
 =?utf-8?B?ZDNnaUNvSk9sL1BmSUF0a050bFR2bXZtdnFPcXY0cmZkT2NkRFEydWUwSk1a?=
 =?utf-8?B?cEd1WEtUVWtOS2hDcjJLdk43ZGVxWGhJQjV4RXp4R1l0bUU2L2JTZmNNVG4x?=
 =?utf-8?B?aUxkbmszcDRXMDExQXB3MUloN3FtczB4WCtCMUMwT0ViL3NzMWhpb0tKNVpD?=
 =?utf-8?B?dVRTV1kxbjJtd1JBYXZMcjQ0SVBCK0prT0F1NU9GQ2JGMEJsYytSa0NHZXha?=
 =?utf-8?B?NklOYUVlcnVIK2hzbG9yazVpcGZQMmEyZnc0U0U0VUd6U0RyeEpTekNPMEE3?=
 =?utf-8?B?NmJySkppV1FrZC9XZmNMd05qOFI3NThEcEIyNllTamlOV1dXMVZ6OXYrTFUz?=
 =?utf-8?B?WDhWK0YwYkl2NzJNbzRJN0VBUzBYMHYvVVY5WUN4V0FXR2IzR0llV3RiOUh2?=
 =?utf-8?B?VzFnbDluSW5aY0dTMzgwNEFQRDJQOHBZeVczbGcyTFdrZHIxL0ZraWFLVjRi?=
 =?utf-8?B?Q2lCNi83R2lod2VtT0pad0NrbVV1cy9MWjk4THhxQ08xeEVzcVBFRXdUYkFn?=
 =?utf-8?B?SUtFTG90a1RDM3BKYXNFOVJFTGhtN1RIM3VKYS9TbjFFcGt1Z0lCT0paNWc5?=
 =?utf-8?B?M2tCbjd6bHZKbHladEthazUxU01HL01rU2lseGhkUWFvVTZaZHhFVGx2YVBZ?=
 =?utf-8?B?UmdKb2w3TXQwZVhFTGk4N3J4aEtKbm5FeWhJZ0VMTkpWU2JLaXgrdUhpZi9u?=
 =?utf-8?B?MXVxMmJ3VTNFcW5ISGFRVjB4SjB4OFlqOTRoNkJqRm9PbTRDbFdUTzYxcWZS?=
 =?utf-8?B?MHdoZjQ4OFJsZzVYd0YvbnltczQ4d0tiOCt6dTFqcWZyVkE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WklCNWE1L3JyaXIwcGFaRDBwdmVMdW9CTkRyck1kRGJwbEJtLzZ1WXkwUTZ6?=
 =?utf-8?B?TlV2Y25WaXY4dmxnN082L1dETFJmbXRyUVV1Y1VlUVdPOVJOYVlwN2pFVGVh?=
 =?utf-8?B?a0d2bmxtVi9BcFU3ajRWQlFGcWVxdWNKQ3BETzNQdXdsT3NpRWNYY1JyR2N1?=
 =?utf-8?B?SGVNTjdWSUEvLzdxTDhTRWppSW40cHNMODBURE5sMUMwK09NczJFMXBKQmQx?=
 =?utf-8?B?RGRBQ1dGdndvY3VOT2RrOHNNRXU2blUzNVhoRWJaQm5mZVpPYXRYYnJMNngx?=
 =?utf-8?B?TlBDU0M0QjRtdG5jS0l3NGpOVlA4MmNvR1k1M3lrS3p5Skg0eFNsUWVFQUZq?=
 =?utf-8?B?dUdnUy9YeEhUeWFDVk5oMURzOHR6NDd0T0s4TWIvNGVrUVpGZWt0eDF2eDFC?=
 =?utf-8?B?QS9SWUZGdk5odnRTS3cwamZQNFA0aXQ2Q09YcFE1V1NaeEVDdXllY0p6RFpi?=
 =?utf-8?B?dTJUOVFoNVZ3TmlxMkg4TkZzbzU5TEREYUw4aGhmaXV6L1RWQUR0OWpLZ0xF?=
 =?utf-8?B?YUgvN2Q5VS9JTHBIQ3RTWEdVbUlhelN0akl3YUpsWnBTVWI0ckYwN0FHYVI4?=
 =?utf-8?B?QjlXWEIvWEFiY3E3cGZmRE1TYkNIVmFrTFBUcWhFZTNnVWEzQ045Z3ZoOCtz?=
 =?utf-8?B?Z1BiaTRCSm9SbjN0RHBmTXFOTWNtYUtEZ3piOUlDTW1CRS9xeit1MXRPNVlF?=
 =?utf-8?B?Y1FTSjB0bHNCUkhYM0JxWC9Zc1dVcGRKaTIvNEp0Wnk3Q0RpeFNjWGhtK0FD?=
 =?utf-8?B?ZHNRbjRrYk1QMnlrNU1JQ2trS2w2YUxoMlBIa2FHb01QaFQ0Zm9uRjQ2TTVU?=
 =?utf-8?B?dS9NeW1CbnJyTzBqS3FGejljOXhXaisyWjVwMGI5OWd2d1VsOGZPaEc4SS9v?=
 =?utf-8?B?L1JDeWFsL0R1NG1HOVM4OFdxUUs4cXNKTDBzQXVreHpXWXd1VmFsRVh1V2d1?=
 =?utf-8?B?eVhHenNxOVA2dUdtaVhVUUxOdVFkbi9iQ01IVjhLdUpycWVjMmh2U3JMemMv?=
 =?utf-8?B?V01uVnpQTm5DMk9XZ3dMYTd6VzZDTXhUTXhHcmRxOW8xWE9YMUowaGt4QmFH?=
 =?utf-8?B?VFk2NnphOUFaaWNHaS83dEVCcUJ2NlhkRExyTER2eXIwdXo3U2hhdFRhcUNu?=
 =?utf-8?B?TXhPai8xQnNmTGhRVkRXZUFuanVoWVV0N09pZHF4QTVOanp3emNFVCtQZk0y?=
 =?utf-8?B?d0h0WkwvVWpndW9ZM2szVkllRUk1bDhUaHFiUDBXalRmZ0VzVGtUc1cvOWw2?=
 =?utf-8?B?ZkJYbkpDQzJTZUpHK2FERk4rUWJnYnYyRENYaHF5MjZ5MktVNW9QbGhHc3dE?=
 =?utf-8?B?TElBbkVyK3JOZzViKzhPOEJKOU1RVEpqbjBRVndhbld1UHp3TVJlVk55cXEy?=
 =?utf-8?B?M0dwZ3E4TGhPakhFdzIzQlZUUStqTzZZOStCVEpLdVhBcGxiby9IRmFmcXBN?=
 =?utf-8?B?YnZvRVFBSUlhdDNGL3c3NVZZempzWVdCU0VkVG5ua3B3UnJUL05nTm5DVC8y?=
 =?utf-8?B?WGdSYWtHVUttUm43aG1pdXFzVzd6RnJSSEJPOVlIV09lWTFlU1ZOU1N3c0c5?=
 =?utf-8?B?azF5QUptWXQzWm9aU1RyV1lHek1ZTlEwdTdKMUpMNDdjOW1Jc0szSlE1QjR3?=
 =?utf-8?B?VVcxZC9PM3FiVlZsWGFXY01PeXNKREpib0dEQmM2cCsyZ2N6aHVUUldhcUhU?=
 =?utf-8?B?Z2ozT3MxYmZQendtWVFXNzd4eUo4UUlEZjkyQXdJVEtmcEhqRUthSUpHL09m?=
 =?utf-8?B?Vi9waytnRFp2QXdVZ0prNGQyZExqV3JUczJVcXhnVGhPZ3FKeFQ1QUhsa2pV?=
 =?utf-8?B?SzNjaU5JeGFRVHZ6eExta1RxeWtpZ2RsMnlxeEhZZXFHb2JTZllWdG0rR3JI?=
 =?utf-8?B?VlN5NHVXNURtV0F1S0s5ekRwQzhIL0NUcWFaR1Z2aHdQVFduMkRaTFFQWFZn?=
 =?utf-8?B?N1kwOUxTc0U1bGl3Qm1NSkJ6SjNESzhHcGVkVXJTU1ViNjhFcGFxSTdyU1px?=
 =?utf-8?B?dDM4UmpLeW5YNkdNSHFid01zNXNTYzZzMHd5aVlDVUtpeGlKelFnT0w2WkRY?=
 =?utf-8?B?aklaeHZadVR6anIzV0dMZDlrWGk0WFd0cGxFT0lySnpWVUpTSGFMQjQxQ0py?=
 =?utf-8?Q?ZpM0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD7F906E274F9148B53979DBE4E2B243@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272af18f-3c94-419c-2a32-08dd19c8667c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 09:44:25.9911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nAr34QUkemz/fb43LwOvyVuTGuwFHfIwV5fYOH9G5FTSRVBpadPTUVxm7k5cgxKWwS08Tj+IZvBfD4Lcq4aLIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9247

T24gMjAyNC8xMi8xMSAxNjo0MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gV2VkLCBE
ZWMgMTEsIDIwMjQgYXQgMDc6NTc6MjlBTSArMDAwMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4g
T24gMjAyNC8xMi8xMCAxOToyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBUdWUs
IERlYyAxMCwgMjAyNCBhdCAxMDo1NDo0M0FNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
Pj4gT24gMTAuMTIuMjAyNCAwODo1NywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4gT24gMjAy
NC8xMi8xMCAxNToxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMTAuMTIuMjAyNCAw
ODowNywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4+PiBPbiAyMDI0LzEyLzkgMjE6NTksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMDIuMTIuMjAyNCAwNzowOSwgSmlxaWFuIENo
ZW4gd3JvdGU6DQo+Pj4+Pj4+Pj4gKyAgICAgICAgaWYgKCByYyApDQo+Pj4+Pj4+Pj4gKyAgICAg
ICAgew0KPj4+Pj4+Pj4+ICsgICAgICAgICAgICBwcmludGsoIiVwcDogYWRkIHJlZ2lzdGVyIGZv
ciBQQ0lfUkVCQVJfQ0FQIGZhaWxlZCAocmM9JWQpXG4iLA0KPj4+Pj4+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgJnBkZXYtPnNiZGYsIHJjKTsNCj4+Pj4+Pj4+PiArICAgICAgICAgICAgYnJlYWs7
DQo+Pj4+Pj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+PiArICAgICAgICBy
YyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDMyLCByZWJhcl9j
dHJsX3dyaXRlLA0KPj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVi
YXJfb2Zmc2V0ICsgUENJX1JFQkFSX0NUUkwsIDQsDQo+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwZGV2LT52cGNpLT5oZWFkZXIuYmFycyk7DQo+Pj4+Pj4+Pj4gKyAg
ICAgICAgaWYgKCByYyApDQo+Pj4+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+Pj4+ICsgICAgICAg
ICAgICBwcmludGsoIiVwcDogYWRkIHJlZ2lzdGVyIGZvciBQQ0lfUkVCQVJfQ1RSTCBmYWlsZWQg
JWRcbiIsDQo+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAmcGRldi0+c2JkZiwgcmMpOw0K
Pj4+Pj4+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJcyBpdCBj
b3JyZWN0IHRvIGtlZXAgdGhlIG90aGVyIGhhbmRsZXIgaW5zdGFsbGVkPyBBZnRlciBhbGwgLi4u
DQo+Pj4+Pj4+IFdpbGwgY2hhbmdlIHRvICJyZXR1cm4gcmM7IiBoZXJlIGFuZCBhYm92ZSBpbiBu
ZXh0IHZlcnNpb24uDQo+Pj4+Pj4NCj4+Pj4+PiBJJ20gbm90IGNvbnZpbmNlZCB0aGlzIGlzIHdo
YXQgd2Ugd2FudCwgYXMgcGVyIC4uLg0KPj4+Pj4+DQo+Pj4+Pj4+Pj4gKyAgICAgICAgfQ0KPj4+
Pj4+Pj4+ICsgICAgfQ0KPj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+PiArICAgIHJldHVybiAwOw0KPj4+
Pj4+Pj4NCj4+Pj4+Pj4+IC4uLiB5b3UgLSBpbW8gc2Vuc2libHkgLSBhcmVuJ3QgY29tbXVuaWNh
dGluZyB0aGUgZXJyb3IgYmFjayB1cCAodG8gYWxsb3cNCj4+Pj4+Pj4+IHRoZSBkZXZpY2UgdG8g
YmUgdXNlZCB3aXRob3V0IEJBUiByZXNpemluZy4NCj4+Pj4+Pg0KPj4+Pj4+IC4uLiB3aGF0IEkg
c2FpZCBoZXJlLg0KPj4+Pj4gU29ycnksIEkgZGlkbuKAmXQgdW5kZXJzdGFuZC4NCj4+Pj4+IERv
IHlvdSBtZWFuIGl0IGlzIG5vdCBlbm91Z2ggdG8gcmV0dXJuIGVycm9yIGNvZGUgb25jZSBhIGhh
bmRsZXIgZmFpbGVkIHRvIGJlIGluc3RhbGxlZCwgSSBuZWVkIHRvIHJlbW92ZSB0aGUgYWxyZWFk
eSBpbnN0YWxsZWQgaGFuZGxlcnM/DQo+Pj4+DQo+Pj4+IE5vLCBpZiB5b3UgcmV0dXJuIGFuIGVy
cm9yIGhlcmUsIG5vdGhpbmcgZWxzZSBuZWVkcyBkb2luZy4gSG93ZXZlciwgSQ0KPj4+PiBxdWVz
dGlvbiB0aGF0IHJldHVybmluZyBhbiBlcnJvciBoZXJlIGlzIGdvb2Qgb3IgZXZlbiBuZWNlc3Nh
cnkuIEluDQo+Pj4+IHRoZSBldmVudCBvZiBhbiBlcnJvciwgdGhlIGRldmljZSBvdWdodCB0byBz
dGlsbCBiZSB1c2FibGUsIGp1c3QNCj4+Pj4gd2l0aG91dCB0aGUgQkFSLXJlc2l6aW5nIGNhcGFi
aWxpdHkuDQo+Pj4NCj4+PiBTbyB5b3Ugc3VnZ2VzdCB0aGF0IHRoZSBjYXBhYmlsaXR5IHNob3Vs
ZCBiZSBoaWRkZW4gaW4gdGhhdCBjYXNlPyAgV2UNCj4+PiBoYXZlIGxvZ2ljIHRvIGhpZGUgY2Fw
YWJpbGl0aWVzLCBqdXN0IG5vdCB1c2VkIGZvciB0aGUgaGFyZHdhcmUNCj4+PiBkb21haW4uICBJ
dCB3b3VsZCBuZWVkIHNvbWUgZXh0cmEgd2lyaW5nIHRvIGJlIGNhcGFibGUgb2YgaGlkaW5nDQo+
Pj4gZmFpbGVkIGNhcGFiaWxpdGllcy4NCj4+IENhbiB5b3UgZ2l2ZSBtZSBhIGd1aWRhbmNlIG9u
IGhvdyB0byBoaWRlIGEgZmFpbGVkIGNhcGFiaWxpdHk/DQo+PiBXaGF0IGNvZGVzIGFyZSBjdXJy
ZW50IGxvZ2ljIHRvIGhpZGUgY2FwYWJpbGl0aWVzPw0KPiANCj4gVGhpcyB3YXMgZG9uZSBieSBT
dGV3YXJ0IGZvciB0aGUgbGVnYWN5IFBDSSBjYXBhYmlsaXRpZXMsIGJ1dCBub3QNCj4gZXhhY3Rs
eSB0byBoaWRlIHRoZSBjYXBhYmlsaXRpZXMgdGhhdCBmYWlsIHRvIGluaXQuICBUYWtlIGEgbG9v
ayBhdA0KPiBjb21taXQ6DQo+IA0KPiBkODMwYjBhN2JjN2UgeGVuL3ZwY2k6IGhlYWRlcjogZmls
dGVyIFBDSSBjYXBhYmlsaXRpZXMNCj4gDQo+IEhvd2V2ZXIgdGhhdCB3YXMgZGVzaWduZWQgdG8g
ZXhwb3NlIGEgZml4ZWQgc2V0IG9mIGNhcGFiaWxpdGllcywNCj4gYWx3YXlzIGtub3duIHdoZW4g
aW5pdF9oZWFkZXIoKSBpcyBleGVjdXRlZC4gIElmIHdlIHdhbnQgdG8gaGlkZQ0KPiBjYXBhYmls
aXRpZXMgb24gZmFpbHVyZSB3ZSB3aWxsIG5lZWQgYSBiaXQgbW9yZSBmbGV4aWJsZSBpbnRlcmZh
Y2UgSQ0KPiB0aGluay4NCj4gDQo+IElkZWFsbHkgd2Ugd291bGQgbGlrZSB0byB0aWUgdGhpcyB0
byBpbml0aWFsaXphdGlvbiBob29rcyB0aGVtc2VsdmVzLA0KPiBzbyB0aGF0IGluIHZwY2lfYXNz
aWduX2RldmljZSgpIGFuIGluaXQgZnVuY3Rpb24gZmFpbGluZyBhdXRvbWF0aWNhbGx5DQo+IHRy
aWdnZXJzIHRoZSBoaWRpbmcgb2YgdGhlIGZhaWxpbmcgY2FwYWJpbGl0eS4gIFRoYXQgd291bGQg
bmVlZCBhbg0KPiBpbnRlcmZhY2Ugc2ltaWxhciB0bzoNCj4gDQo+ICNkZWZpbmUgUkVHSVNURVJf
VlBDSV9JTklUKDxjYXBhYmlsaXR5IGlkPiwgPGZ1bmN0aW9uPiwgPHByaW9yaXR5PiwNCj4gPHBj
aWU/PikNCj4gDQo+IFJFR0lTVEVSX1ZQQ0lfSU5JVChQQ0lfQ0FQX0lEX01TSSwgaW5pdF9tc2ks
IFZQQ0lfUFJJT1JJVFlfTE9XLA0KPiBmYWxzZSk7DQo+IA0KPiBBbmQgdGhlbiBpbiB2cGNpX2Fz
c2lnbl9kZXZpY2UoKSBhbnkgaW5pdCBmdW5jdGlvbiB0aGF0IGhhcyBhDQo+IGNhcGFiaWxpdHkg
SUQgZGlmZmVyZW50IHRoYW4gMCBhbmQgZmFpbHMgdG8gaW5pdGlhbGl6ZSB3b3VsZCBsZWFkIHRv
DQo+IHRoZSBjYXBhYmlsaXR5IGJlaW5nIG1hc2tlZC4NCj4gDQo+IEl0IHdvdWxkIGJlIGdyZWF0
IHRvIGhhdmUgYW4gaW50ZXJmYWNlIGxpa2UgdGhpcyBpbiBwbGFjZSwgYmVjYXVzZSB0aGUNCj4g
Y3VycmVudCBlcnJvciBoYW5kbGluZyBpbiB2UENJIGlzIG5vdCBncmVhdC4gIEZvciB0aGUgaGFy
ZHdhcmUgZG9tYWluDQo+IGluaXQgZnVuY3Rpb25zIGZhaWxpbmcgd2lsbCBqdXN0IGxlYWQgdG8g
dGhlIGRldmljZSBiZWluZyBmdWxseQ0KPiBhY2Nlc3NpYmxlIGJ5IGRvbTAgd2l0aG91dCBhbnkg
bWVkaWF0aW9uLg0KPiANCj4gQW55d2F5LCB3ZSBkb24ndCBkbyBhbnkgb2YgdGhpcyBmb3IgZG9t
MCBhdCB0aGUgbW9tZW50IHdoZW4gTVNJIG9yDQo+IE1TSS1YIGZhaWwgdG8gaW5pdCwgc28gSSdt
IG5vdCBzdXJlIGl0J3MgZmFpciB0byBhc2sgdGhhdCB5b3UgZG8gdGhpcw0KPiBmb3IgUmVCQVIu
ICBJdCB3b3VsZCBiZSBncmVhdCBpZiB5b3Ugd2FudCB0bywgYnV0IGl0J3Mgbm90IGEgdHJpdmlh
bA0KPiBhbW91bnQgb2Ygd29yay4NClRoYW5rcyENCkl0IHNvdW5kcyBsaWtlIG5vdCBlYXN5IHRv
IGRvLg0KQnV0IEkgd2lsbCB0cnkgdG8gaW1wbGVtZW50IHRoaXMgaWYgSSBoYXZlIHRpbWUuDQoN
Cj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4u
DQo=

