Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE17A0FFE6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 05:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870901.1281962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXYVG-0007jP-QS; Tue, 14 Jan 2025 04:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870901.1281962; Tue, 14 Jan 2025 04:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXYVG-0007hN-No; Tue, 14 Jan 2025 04:26:10 +0000
Received: by outflank-mailman (input) for mailman id 870901;
 Tue, 14 Jan 2025 04:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sZa5=UG=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tXYVE-0007T1-SF
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 04:26:08 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac958209-d22f-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 05:26:07 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB8PR03MB6300.eurprd03.prod.outlook.com
 (2603:10a6:10:13f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Tue, 14 Jan
 2025 04:25:58 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 04:25:58 +0000
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
X-Inumbo-ID: ac958209-d22f-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l17/z37zEKElYK7zOeWtDOtfKDD2KmUN35OG5ObTUa8FV46PGEj04e4gwhd+ZPcAcQm1yEfUXY9ue7tiHYpkampDoe5spSOdsFx1arurJspQzhVkYI1wLVHkIaFCO8l3v3+p5K6OmCYZW6mN5E1wBOPJSyKRx0WHPQfPbn3TVnDsd3jLqdlHl7S5xT9f2TXFleG36tWr+aV3i7cQ1tRew3zgyDBjKSQ+f3JOjv5S9lwaAls0GUHNGYH7mQdMjz6I54AFTyHKOBURklq44KDdgOlRQAf20WwLCT6vBGJ5XkWH3kdihi1cVhWpPwEj6B9zv3KoP95qnUSO1p5vS+kzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MtrRJxarp34S2JOLx/JyEv2kwrG4QQxCgAgsBhf7Ic=;
 b=ud15TjL/x8/iOHm4aAt9ALDKbZo4uQqyhml9iGsjChfeEiftf7Fb1NnPvDWjT+ql83ATVvKgT1Hc+dn4SRRgVyaeDAhPh2ECoyIje529Pn4QcC17QqDaC3NuWriQxf6GRAuGkSEfVg2QwuOXSR36XcmsSS5pUsVtr+SGHkAky28/EE+fYbn4lHkMNWGe5DdYOkmFdv2Z+TKwIJYwyH3m6NnTA4BYoU+UjkSS7tGpJidRL7gZsNXNjGDO99cjodPBkYp/kFS+1mC7Uq7C46Vy7POORINkqgLylHtLtrYaZu5l1OI/98cIdtrEOeGm3aOD0Htu7KSMD93eQ0NJGC9JVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MtrRJxarp34S2JOLx/JyEv2kwrG4QQxCgAgsBhf7Ic=;
 b=UnMBEl1LEJULDOTFiJerc7iC/1+DxsRUMT+wbVpeQg9Upypk00+UzM/+IRzOSVtNCQ444AdKy1P7PFLLcAUThVCr5Aga5/J03xNvwAuhxnUFdaNrgVwn5T11jPx67z1pswaCHjWKfqplqAHnn4KClHFM7GC+dRcdaGjbBkhzPcnuoDg5bexhIgJN2gwopDOt5+rqSwvCai4XbF8akUZTciciXz5Xqj6IKGkKV2YkIulEed0lMeQiIrhLq+D2Pq+Pxvxedb+P2CO/fd6ZA73Cv3g2UJ884y8O52GSaHKUAJNY43aACjp5WFqoaehe5VTjliK5gSSYci/zuZ1MP+6iuQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/4] xen: common: add ability to enable stack protector
Thread-Topic: [PATCH v4 2/4] xen: common: add ability to enable stack
 protector
Thread-Index: AQHbZjxnv4AIVf4qZ0m9Cu/vUIISVg==
Date: Tue, 14 Jan 2025 04:25:56 +0000
Message-ID: <20250114042553.1624831-3-volodymyr_babchuk@epam.com>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB8PR03MB6300:EE_
x-ms-office365-filtering-correlation-id: 692dc48c-a424-493a-b2c3-08dd34538baf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aVZ2Wk9xMGpEWFoxa3hVYTQxR25jbzVsWGFqcXlpYy9FVEt5ZnpEeHhmN0N2?=
 =?utf-8?B?MUpaamJuU1doSlU2K0dwOG1LZFdxSDI2d0Z3alFlRHA0U2QvNGxYaVVCMGdU?=
 =?utf-8?B?RTVBbDJWTmpwTVpYR2d4WUltQWZDM1A4aE5hT3dEN0puR0xROTNYRUwxSGI0?=
 =?utf-8?B?NW04dDlHd0dSVnZMYzQ4RFNFZytjbEpJYURqeFc1K203Q1lqMzJHb2xaZmxn?=
 =?utf-8?B?ZllhM0NJSVlGNzMzTlQzM0hadm5MQmhPekt0YmZaaTUyOUxIRENQV0RUakQ1?=
 =?utf-8?B?OHpRbzJ3T25BTHpUL1E5cmFLbWtKRzZGL0JWSWs3eTB4T3UwWXJJVnhFN0x0?=
 =?utf-8?B?Z2xCV01ONlY1bUJoVjhXNnArR09yY3JucEtEeWduZTFRMFpWemRVeU44M2d1?=
 =?utf-8?B?Q0luSHh4Z2JoOVNvQW5pSzQwVWtNT2lMZktWT2FLUm9CNlFPaU4yT1RLVDRu?=
 =?utf-8?B?UUlSTlJ4bzJic1NaOHgwQlY2bTk3L2hJTDFWbXFwSmxDSktvbVZvelNFckc0?=
 =?utf-8?B?ZHJ6YUpQcTcvakVGdnJvWmVTVjBUWEdPcUhDUXhwRllRY0lRVFBzL3RhTzR5?=
 =?utf-8?B?VzJ1dmdWN2hlKy9kemtXZmk3MW9EeFhvTk5mTEduQ0xQR0hid3doV3lkREFo?=
 =?utf-8?B?d3A0UTdqWVl5aktlMXBqWEtnNGorM3dEWHVMbVZrbjNtT3JZS0JzV0FTUzBa?=
 =?utf-8?B?ZFI2dHlKU3I4eDJpemRLQVZTRXd2ckUyN2NzbEFBUkkvc1RGYXpNcmt2RFJP?=
 =?utf-8?B?aExqeGdOdnc2VmVSYXNSV05qUGc3K1BZK3Z2N0dCMVVQZWd6TXcrb21Rd0h3?=
 =?utf-8?B?UW9xdFRUTmRxMUNsMXVObUgwNDlwZDBlenE1dmRaMHNUUTRHTDhmZFBwQ3Fw?=
 =?utf-8?B?ZWZ6anRjYlF3VTc5bTY1amxTK2Ivc1R5V3hpbHQwdnJYK0FmNjJxSWVPNDhm?=
 =?utf-8?B?eEhqTnF1c085QlN4N0pGN3k1dHJBTCtvZElVODNUSm96cEYwOE9oVmN2ZFNI?=
 =?utf-8?B?SGNBYzRiREkxV25vSFVUZWZPekxqWEtLVkNVMkZtdkwrREkvWFF5bzhaZEpn?=
 =?utf-8?B?SXR3UnlhdXlvY1I2UjE4ZVA5WlRieitLOE8ycTNEZmlpOVlQUU14RTlZcWVB?=
 =?utf-8?B?Z3V1V2h6ZHpCbEJuZlU5Qk95bWFFeGV0UFd6VXNvMGM2NXVYZnJXQzA0Q2Uw?=
 =?utf-8?B?ckJKNzlkSUN6ekNENkpYclRVR3FwajV2NkQvaXpRNEg1SS9KVzBYZHRhbUtW?=
 =?utf-8?B?Rk1yZGxZMnNZRHR0ekh5akFpNHVNaHFoOTJIeUxIbFZ4MENOSlV5dStrQUc5?=
 =?utf-8?B?cmIrQ01FOVpENHFXTEFzZEZnS3hNU1RRSVhFVjhHNFlvM3hRS0RlN21iS0N0?=
 =?utf-8?B?K1Q4QnYzZFJ0RE5MMWI5eWpVT0hZSURBTkhONU9MRlZiQVhQd3lsYXdpRkR6?=
 =?utf-8?B?cEVUNUVmTnFpTXR2NWRsWHN2TXVFblNoVUNUWmJrblNHcVpvcVRpU3ZXNjBH?=
 =?utf-8?B?OFpyQTVjUDliRDlrdzJ2Zjc5QmIxVG1Ta0Y1aHc5cEtxV3NDY256T0VBWkpa?=
 =?utf-8?B?cFd2UGxIcDNzTHVYRklDL3VXQWdrNWMzTEhhaGJYdVZQdzZTaW1RWkZzU1M5?=
 =?utf-8?B?N3VoMm90cWNqbnBXWFhOWjBnMjFER3FoTXhzRzJVYklUR2ZLN1NVWXMyUDVn?=
 =?utf-8?B?cWRBZHoxSElDZ3dkY1VmbFZ0aTh3Nms1Z0gzc1kyaFZMeDFqY0t2MWRQU3Fs?=
 =?utf-8?B?TFdqd0tnRVI2aktQc2RrdzlPU2hHcWVDY3BZQ3JjcWc4UFdHMGFUQjU1SUov?=
 =?utf-8?B?ZG1OUnZRT2R1ZnpQWEg1UXJsanZhWUZ2ajBqM3R5Q01nQjBIcGxXQmtHUkJD?=
 =?utf-8?B?R2FRajg2L3B0dGRIMDlua0FzbkFNZ0FQc3pwNVZoOTZleUMwcktDUnlyRTRh?=
 =?utf-8?Q?XOXKjP+ZnQcpWvf1nz9lKJuWN2eq69UZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEJuQ1JFQjBBczRjZHVyVmVna25yWGVvTUJBM2VMR1hGcjdPRVROaStGVUEy?=
 =?utf-8?B?NExYRlNEbU9LVEVVZHE2dXZKdmVqTTBTbEhaMlV4NGpwSWZtcmtVQUdxMWxO?=
 =?utf-8?B?aTVrc2RtU013ck9iTkk2K2k4QWozVjkyWHdKdC9vYS95ZHdQTWg4RnhURzdW?=
 =?utf-8?B?VzNmZEJZclpGOFdjc2xMR3NsQk5HQ3hSdlMzeVEzZ3l1NkhwVkpNczJDaWFw?=
 =?utf-8?B?bit4YTVtWmZab1BHbTRwZ2hkU2xEa3dCRElkRVBhS214Vkd6YWh1aUNGUjh6?=
 =?utf-8?B?b2pSLzZ5RFJJUzg0b250Rk5wMFZYQmV0dWoyNE85RHRqYzJjSGV3U2ZFQmlL?=
 =?utf-8?B?V3UyVk5rYkNVYUhYRDdEUDR3bGVDb05EdmRJZnpmUWt5UEJhRWlCeUpCVjRT?=
 =?utf-8?B?TjlyOUxSRlp1L3pDeTBERC9HcDNvbTU2bXpoTWVjUHpVWlVkN3ZmaFY0SnRN?=
 =?utf-8?B?QUF2L3A2UXpyOHVCWmFURy9vMVFuSGpGWktObzdBbmVBZmFlYm4wZkJJbmMz?=
 =?utf-8?B?dXNMZU91Vjd1WXR5RWlzQm12SGdQM3U0WENRUUpITnkvemVaWjZtTFlHUjJ6?=
 =?utf-8?B?bHJTaDQ2MWxTSTFid1VzcG9pVVNOenZla0ZkSlkxZXhxMTFEZG1SQmRRc0VN?=
 =?utf-8?B?UURnYmJPQWlaYzUwYm95SnNEeDZJUUM5cjhnWTRBakMxL0JITXY3QWJMY1RL?=
 =?utf-8?B?eHUzOGN1R3ZRZUZmZ1NFcGYwL29MUDZlR3Q3dFExS29Xa2UrT0tMVDJ5VmNq?=
 =?utf-8?B?UjVOQk1Pd0tnVlZCVkVlUEgrdlBFTkJ0YmtkS0taekdxL1RQY3RaR09yLzlQ?=
 =?utf-8?B?djhMS0YzU05ielBSMmtQVGIxSFFLejAwMzlxaGNWZ0tqMjIyZGgvdVc1c2Ru?=
 =?utf-8?B?d3NlUmRUNGdoZFhlS01DR2FRNU1WWHp2cVhSSGNMYXNFdDJ6VzBqVGZVRjE5?=
 =?utf-8?B?NEhWNWpXUGdNRUNtbWN6WElOTVZBWTkvT25UbmJFV0UvSmFTcFpHL01EdG5K?=
 =?utf-8?B?bDFrcE5GKzRVSlYvc2tNektJNzZYUHpBZVJqaElsU0RZaWNPRVNxUnhWS0dT?=
 =?utf-8?B?azZLVm5MSE01blJEQmo3aERNMzArTUwra2ptVC9FOW1LNzJDOXhHcUIrdVho?=
 =?utf-8?B?S0tjaDlsRWhJUmRkdWpqelVHY2lEMWhMRlc2ZWM1UFVpcS8rVzVKZDljOGsx?=
 =?utf-8?B?d0h5S3R4WlFMSHExTWNrdnJLTVQ2aUp3ZW5NbXdSc2pFVkRoMW1hOGhwL004?=
 =?utf-8?B?RTAwTHJrK0tQc2tIZDhmZ2lYQkxocWgydGg1S003Y0JkcWh3YzhnQVFRdExZ?=
 =?utf-8?B?L3kvNHhaQUk0UmVxdDI5QVVQMWVRRHdnWFAzeE5VK2pyL1h5MTVGRVM2YXQ5?=
 =?utf-8?B?WkNlRWNrSUdZODFFbjlTN1g0RzJkY2RjVUJlL1ZsUkFXMUpvMmxOZWxtemRj?=
 =?utf-8?B?eWJnTG0rV2daZ1ZMQ0MreFRXVFoyU3hKcmYrTUg1VUg0dHB0TTA3bDlsK0Yx?=
 =?utf-8?B?alI0TjZrNVR1ZDZQYWRlem54cWcvOHdXVGlTeUZIUGFDRnZoMVE2TUNaSXc5?=
 =?utf-8?B?TTBSbERmNitLS0d0K2g5YTRVUkcvN0Ercnc4bk9wY1Z5dm0xOVJxODlIZnJo?=
 =?utf-8?B?SmJBNDZtdGFCbWV0V25wWGVpeWNXUGFuNllsTzdNT2xyelZIUHZtU2FqZnlu?=
 =?utf-8?B?WmI2ZG1BaXh1RGRoT0V0b0JWRm9EdnVrUkNzWUlsdjBnckljN3BNM1BLVkNL?=
 =?utf-8?B?NjBZTFFHMmNKSzQ0TEIrMVRwWW1sNmZ2cDVuSjZObE85cVp3MUlRN3Zzd2tn?=
 =?utf-8?B?RzFVbnNqelE1UkZRekpiYkpDZlFDd2Zydk5qKzJjWDFrbmpKQkk1T0ZTN3I5?=
 =?utf-8?B?UjVaOWxFRnFQNHdQanNBazJxaHJtK0Zxd1hvY3kwMDAvak5TMUsxYnRpdndS?=
 =?utf-8?B?cFFYNVlWa053bk9wM0drTHFqK1B4ZlJRbjNySHBhUFdlOWE3QjNNVTZ4Z0FY?=
 =?utf-8?B?Qm1zbjNoa1Q0ejlPL3BOYlFkdVljVks0alg4TlRVUzNDNHhhdTJwUG41eWlC?=
 =?utf-8?B?ZWRBUEE4NDEzVHp3UzRONkZWcjJOaHJsYTNKWWhLWkZNNXJmcmd0RkpBNUNh?=
 =?utf-8?B?VGhmVHQrTEhYRFljMDRXdDB3N3RwaUFoYXZmL3AyVDBJelpCWHBYV1RTOWdh?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC61816ED7386E48BCDEA64E087A93CD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692dc48c-a424-493a-b2c3-08dd34538baf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 04:25:56.3138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOPPHbF1PoRrJIxzKkAceFvrnygGLR1CNJlNvqAXLOd8KCfBIYmjb6lxz3+R/K3GiE7GjPwNAG1E5myl+8p0GmEEiLBF5KAO1QK7t7d81xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6300

Qm90aCBHQ0MgYW5kIENsYW5nIHN1cHBvcnQgLWZzdGFjay1wcm90ZWN0b3IgZmVhdHVyZSwgd2hp
Y2ggYWRkIHN0YWNrDQpjYW5hcmllcyB0byBmdW5jdGlvbnMgd2hlcmUgc3RhY2sgY29ycnVwdGlv
biBpcyBwb3NzaWJsZS4gVGhpcyBwYXRjaA0KbWFrZXMgZ2VuZXJhbCBwcmVwYXJhdGlvbnMgdG8g
ZW5hYmxlIHRoaXMgZmVhdHVyZSBvbiBkaWZmZXJlbnQNCnN1cHBvcnRlZCBhcmNoaXRlY3R1cmVz
Og0KDQogLSBBZGRlZCBDT05GSUdfSEFTX1NUQUNLX1BST1RFQ1RPUiBvcHRpb24gc28gZWFjaCBh
cmNoaXRlY3R1cmUNCiAgIGNhbiBlbmFibGUgdGhpcyBmZWF0dXJlIGluZGl2aWR1YWxseQ0KIC0g
QWRkZWQgdXNlci1zZWxlY3RhYmxlIENPTkZJR19TVEFDS19QUk9URUNUT1Igb3B0aW9uDQogLSBJ
bXBsZW1lbnRlZCBjb2RlIHRoYXQgc2V0cyB1cCByYW5kb20gc3RhY2sgY2FuYXJ5IGFuZCBhIGJh
c2ljDQogICBoYW5kbGVyIGZvciBzdGFjayBwcm90ZWN0b3IgZmFpbHVyZXMNCg0KU3RhY2sgZ3Vh
cmQgdmFsdWUgaXMgaW5pdGlhbGl6ZWQgaW4gdHdvIHBoYXNlczoNCg0KMS4gUHJlLWRlZmluZWQg
cmFuZG9tbHktc2VsZWN0ZWQgdmFsdWUuDQoNCjIuIE93biBpbXBsZW1lbnRhdGlvbiBsaW5lYXIg
Y29uZ3J1ZW50IHJhbmRvbSBudW1iZXIgZ2VuZXJhdG9yLiBJdA0KcmVsaWVzIG9uIGdldF9jeWNs
ZXMoKSBiZWluZyBhdmFpbGFibGUgdmVyeSBlYXJseS4gSWYgZ2V0X2N5Y2xlcygpDQpyZXR1cm5z
IHplcm8sIGl0IHdvdWxkIGxlYXZlIHByZS1kZWZpbmVkIHZhbHVlIGZyb20gdGhlIHByZXZpb3Vz
DQpzdGVwLg0KDQpTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2Jh
YmNodWtAZXBhbS5jb20+DQoNCi0tLQ0KDQpDaGFuZ2VzIGluIHY0Og0KIC0gUmVtb3ZlZCB0aGly
ZCBwaGFzZSBvZiBpbml0aWFsaXphdGlvbiAoaXQgd2FzIHVzaW5nIFhlbidzIFJORykNCiAtIHJl
bW92ZSBzdGFjay1wcm90ZWN0b3IuaCBiZWNhdXNlIGl0IGlzIG5vdCByZXF1aXJlZCBhbnltb3Jl
DQogLSBSZXdvcmRlZCBjb21tZW50cw0KIC0gX19zdGFja19jaGtfZmFpbCgpIG5vdyBkdW1wcyBl
eGVjdXRpb24gc3RhdGUgYmVmb3JlIGNhbGxpbmcgcGFuaWMoKQ0KIC0gIkNvbXBpbGVyIG9wdGlv
biIgS2NvbmZpZyBlbnRyeSByZW5hbWVkIHRvICJPdGhlciBoYXJkZW5pbmciDQoNCkNoYW5nZXMg
aW4gdjM6DQogLSBGaXhlZCBjb2Rpbmcgc3R5bGUgaW4gc3RhY2stcHJvdGVjdG9yLmgNCiAtIEV4
dGVuZGVkIHBhbmljKCkgbWVzc2FnZQ0KIC0gSW5jbHVkZWQgbWlzc2VkIHJhbmRvbS5oDQogLSBS
ZW5hbWVkIEtjb25maWcgb3B0aW9uDQogLSBVc2VkIEFuZHJldydzIHN1Z2dlc3Rpb24gZm9yIHRo
ZSBLY29uZmlnIGhlbHAgdGV4dA0KIC0gQWRkZWQgImFzbWxpbmthZ2UiIGF0dHJpYnV0ZSB0byBf
X3N0YWNrX2Noa19mYWlsKCkgdG8gbWFrZSBFY2xhaXINCiBoYXBweQ0KIC0gSW5pdGlhbCBzdGFj
ayBndWFyZCB2YWx1ZSBpcyByYW5kb20NCiAtIEFkZGVkIExDRyB0byBnZW5lcmF0ZSBzdGFjayBn
dWFyZCB2YWx1ZSBhdCBlYXJseSBib290IHN0YWdlcw0KIC0gQWRkZWQgY29tbWVudCB0byBhc20t
Z2VuZXJpYy9yYW5kb20uaCBhYm91dCBkZXBlbmRlbmNpZXMNCiAtIEV4dGVuZGVkIHRoZSBjb21t
aXQgbWVzc2FnZQ0KDQpDaGFuZ2VzIGluIHYyOg0KIC0gTW92ZWQgY2hhbmdlcyB0byBFTUJFRERF
RF9FWFRSQV9DRkxBR1MgaW50byBzZXBhcmF0ZSBwYXRjaA0KIC0gUmVuYW1lZCBzdGFja19wcm90
ZWN0b3IuYyB0byBzdGFjay1wcm90ZWN0b3IuYw0KIC0gUmVuYW1lZCBzdGFja19wcm90ZWN0b3Iu
aCB0byBzdGFjay1wcm90ZWN0b3IuaA0KIC0gUmVtb3ZlZCAjaWZkZWYgQ09ORklHX1g4NiBpbiBz
dGFjay1wcm90ZWN0b3IuaA0KIC0gVXBkYXRlZCBjb21tZW50IGluIHN0YWNrLXByb3RlY3Rvci5o
DQogICAoYWxzbywgd2UgY2FuJ3QgY2FsbCBib290X3N0YWNrX2Noa19ndWFyZF9zZXR1cCgpIGZy
b20gYXNtIGNvZGUgaW4NCiAgIGdlbmVyYWwgY2FzZSwgYmVjYXVzZSBpdCBjYWxscyBnZXRfcmFu
ZG9tKCkgYW5kIGdldF9yYW5kb20oKSBtYXkNCiAgIGRlcGVuZCBpbiBwZXJfY3B1IGluZnJhc3Ry
dWN0dXJlLCB3aGljaCBpcyBpbml0aWFsaXplZCBsYXRlcikNCiAtIEZpeGVkIGNvZGluZyBzdHls
ZQ0KIC0gTW92ZWQgQ09ORklHX1NUQUNLX1BST1RFQ1RPUiBpbnRvIG5ld2x5IGFkZGVkICJDb21w
aWxlciBvcHRpb25zIg0KIHN1Ym1lbnUNCiAtIE1hcmtlZCBfX3N0YWNrX2Noa19ndWFyZCBhcyBf
X3JvX2FmdGVyX2luaXQNCi0tLQ0KIHhlbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgNCAr
KysNCiB4ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAgIHwgMTUgKysrKysrKysrKysNCiB4ZW4v
Y29tbW9uL01ha2VmaWxlICAgICAgICAgIHwgIDEgKw0KIHhlbi9jb21tb24vc3RhY2stcHJvdGVj
dG9yLmMgfCA1MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiA0IGZpbGVz
IGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2NvbW1v
bi9zdGFjay1wcm90ZWN0b3IuYw0KDQpkaWZmIC0tZ2l0IGEveGVuL01ha2VmaWxlIGIveGVuL01h
a2VmaWxlDQppbmRleCBhMGM3NzRhYjdkLi40OGJjMTdjNDE4IDEwMDY0NA0KLS0tIGEveGVuL01h
a2VmaWxlDQorKysgYi94ZW4vTWFrZWZpbGUNCkBAIC00MzUsNyArNDM1LDExIEBAIGVsc2UNCiBD
RkxBR1NfVUJTQU4gOj0NCiBlbmRpZg0KIA0KK2lmZXEgKCQoQ09ORklHX1NUQUNLX1BST1RFQ1RP
UikseSkNCitDRkxBR1MgKz0gLWZzdGFjay1wcm90ZWN0b3INCitlbHNlDQogQ0ZMQUdTICs9IC1m
bm8tc3RhY2stcHJvdGVjdG9yDQorZW5kaWYNCiANCiBpZmVxICgkKENPTkZJR19MVE8pLHkpDQog
Q0ZMQUdTICs9IC1mbHRvDQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVuL2Nv
bW1vbi9LY29uZmlnDQppbmRleCA2MTY2MzI3ZjRkLi5iZDUzZGFlNDNjIDEwMDY0NA0KLS0tIGEv
eGVuL2NvbW1vbi9LY29uZmlnDQorKysgYi94ZW4vY29tbW9uL0tjb25maWcNCkBAIC04Myw2ICs4
Myw5IEBAIGNvbmZpZyBIQVNfUE1BUA0KIGNvbmZpZyBIQVNfU0NIRURfR1JBTlVMQVJJVFkNCiAJ
Ym9vbA0KIA0KK2NvbmZpZyBIQVNfU1RBQ0tfUFJPVEVDVE9SDQorCWJvb2wNCisNCiBjb25maWcg
SEFTX1VCU0FODQogCWJvb2wNCiANCkBAIC0yMTYsNiArMjE5LDE4IEBAIGNvbmZpZyBTUEVDVUxB
VElWRV9IQVJERU5fTE9DSw0KIA0KIGVuZG1lbnUNCiANCittZW51ICJPdGhlciBoYXJkZW5pbmci
DQorDQorY29uZmlnIFNUQUNLX1BST1RFQ1RPUg0KKwlib29sICJTdGFjayBwcm90ZWN0b3IiDQor
CWRlcGVuZHMgb24gSEFTX1NUQUNLX1BST1RFQ1RPUg0KKwloZWxwDQorCSAgRW5hYmxlIHRoZSBT
dGFjayBQcm90ZWN0b3IgY29tcGlsZXIgaGFyZGVuaW5nIG9wdGlvbi4gVGhpcyBpbnNlcnRzIGEN
CisJICBjYW5hcnkgdmFsdWUgaW4gdGhlIHN0YWNrIGZyYW1lIG9mIGZ1bmN0aW9ucywgYW5kIHBl
cmZvcm1zIGFuIGludGVncml0eQ0KKwkgIGNoZWNrIG9uIGZ1bmN0aW9uIGV4aXQuDQorDQorZW5k
bWVudQ0KKw0KIGNvbmZpZyBESVRfREVGQVVMVA0KIAlib29sICJEYXRhIEluZGVwZW5kZW50IFRp
bWluZyBkZWZhdWx0Ig0KIAlkZXBlbmRzIG9uIEhBU19ESVQNCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL01ha2VmaWxlIGIveGVuL2NvbW1vbi9NYWtlZmlsZQ0KaW5kZXggY2JhM2IzMjczMy4uOGFk
YmY2YTNiNSAxMDA2NDQNCi0tLSBhL3hlbi9jb21tb24vTWFrZWZpbGUNCisrKyBiL3hlbi9jb21t
b24vTWFrZWZpbGUNCkBAIC00Niw2ICs0Niw3IEBAIG9iai15ICs9IHNodXRkb3duLm8NCiBvYmot
eSArPSBzb2Z0aXJxLm8NCiBvYmoteSArPSBzbXAubw0KIG9iai15ICs9IHNwaW5sb2NrLm8NCitv
YmotJChDT05GSUdfU1RBQ0tfUFJPVEVDVE9SKSArPSBzdGFjay1wcm90ZWN0b3Iubw0KIG9iai15
ICs9IHN0b3BfbWFjaGluZS5vDQogb2JqLXkgKz0gc3ltYm9scy5vDQogb2JqLXkgKz0gdGFza2xl
dC5vDQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zdGFjay1wcm90ZWN0b3IuYyBiL3hlbi9jb21t
b24vc3RhY2stcHJvdGVjdG9yLmMNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAw
MDAwLi44ZmE5ZjYxNDdmDQotLS0gL2Rldi9udWxsDQorKysgYi94ZW4vY29tbW9uL3N0YWNrLXBy
b3RlY3Rvci5jDQpAQCAtMCwwICsxLDUxIEBADQorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seSAqLw0KKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KKyNpbmNsdWRlIDx4ZW4v
bGliLmg+DQorI2luY2x1ZGUgPHhlbi9yYW5kb20uaD4NCisjaW5jbHVkZSA8eGVuL3RpbWUuaD4N
CisNCisvKg0KKyAqIEluaXRpYWwgdmFsdWUgaXMgY2hvc2VuIGJ5IGEgZmFpciBkaWNlIHJvbGwu
DQorICogSXQgd2lsbCBiZSB1cGRhdGVkIGR1cmluZyBib290IHByb2Nlc3MuDQorICovDQorI2lm
IEJJVFNfUEVSX0xPTkcgPT0gMzINCit1bnNpZ25lZCBsb25nIF9fcm9fYWZ0ZXJfaW5pdCBfX3N0
YWNrX2Noa19ndWFyZCA9IDB4ZGQyY2M5MjdVTDsNCisjZWxzZQ0KK3Vuc2lnbmVkIGxvbmcgX19y
b19hZnRlcl9pbml0IF9fc3RhY2tfY2hrX2d1YXJkID0gMHgyZDg1MzYwNWE0ZDlhMDljVUw7DQor
I2VuZGlmDQorDQorLyoNCisgKiBUaGlzIGZ1bmN0aW9uIHNob3VsZCBiZSBjYWxsZWQgZnJvbSBl
YXJseSBhc20gb3IgZnJvbSBhIEMgZnVuY3Rpb24NCisgKiB0aGF0IGVzY2FwZXMgc3RhY2sgY2Fu
YXJ5IHRyYWNraW5nIChieSBjYWxsaW5nDQorICogcmVzZXRfc3RhY2tfYW5kX2p1bXAoKSBmb3Ig
ZXhhbXBsZSkuDQorICovDQordm9pZCBfX2luaXQgYXNtbGlua2FnZSBib290X3N0YWNrX2Noa19n
dWFyZF9zZXR1cCh2b2lkKQ0KK3sNCisgICAgLyoNCisgICAgICogTGluZWFyIGNvbmdydWVudCBn
ZW5lcmF0b3IgKFhfbisxID0gWF9uICogYSArIGMpLg0KKyAgICAgKg0KKyAgICAgKiBDb25zdGFu
dCBpcyB0YWtlbiBmcm9tICJUYWJsZXMgT2YgTGluZWFyIENvbmdydWVudGlhbA0KKyAgICAgKiBH
ZW5lcmF0b3JzIE9mIERpZmZlcmVudCBTaXplcyBBbmQgR29vZCBMYXR0aWNlIFN0cnVjdHVyZSIg
YnkNCisgICAgICogUGllcnJlIEzigJlFY3V5ZXIuDQorICAgICAqLw0KKyNpZiBCSVRTX1BFUl9M
T05HID09IDMyDQorICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgYSA9IDI4OTEzMzY0NTNVTDsNCisj
ZWxzZQ0KKyAgICBjb25zdCB1bnNpZ25lZCBsb25nIGEgPSAyODYyOTMzNTU1Nzc3OTQxNzU3VUw7
DQorI2VuZGlmDQorICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgYyA9IDE7DQorDQorICAgIHVuc2ln
bmVkIGxvbmcgY3ljbGVzID0gZ2V0X2N5Y2xlcygpOw0KKw0KKyAgICAvKiBVc2UgdGhlIGluaXRp
YWwgdmFsdWUgaWYgd2UgY2FuJ3QgZ2VuZXJhdGUgcmFuZG9tIG9uZSAqLw0KKyAgICBpZiAoICFj
eWNsZXMgKQ0KKyAgICAgICAgICAgIHJldHVybjsNCisNCisgICAgX19zdGFja19jaGtfZ3VhcmQg
PSBjeWNsZXMgKiBhICsgYzsNCit9DQorDQordm9pZCBhc21saW5rYWdlIF9fc3RhY2tfY2hrX2Zh
aWwodm9pZCkNCit7DQorICAgIGR1bXBfZXhlY3V0aW9uX3N0YXRlKCk7DQorICAgIHBhbmljKCJT
dGFjayBQcm90ZWN0b3IgaW50ZWdyaXR5IHZpb2xhdGlvbiBpZGVudGlmaWVkXG4iKTsNCit9DQot
LSANCjIuNDcuMQ0K

