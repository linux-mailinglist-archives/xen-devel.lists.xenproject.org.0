Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B321B7FA5D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 16:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125189.1467205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uysgy-0003tl-T5; Wed, 17 Sep 2025 13:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125189.1467205; Wed, 17 Sep 2025 13:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uysgy-0003rL-QD; Wed, 17 Sep 2025 13:59:28 +0000
Received: by outflank-mailman (input) for mailman id 1125189;
 Wed, 17 Sep 2025 13:59:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0jLE=34=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uysgw-0003rF-T9
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 13:59:26 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83828a8f-93ce-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 15:59:24 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DU0PR03MB9708.eurprd03.prod.outlook.com (2603:10a6:10:44c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 13:59:19 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 13:59:19 +0000
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
X-Inumbo-ID: 83828a8f-93ce-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU9eCQUgmUXO+AkBJwRzbaU4TkKWmoQNsLoR+v1HvBmiz4hZLqEmEuL9sYAzxisbCbWEujJdq8pJJjcv+TMABA5RzhpQ3MfKWRBytm0oAB4OJdrQE16q/QhRNkaxhtPZMlJulgy7BYC+877zHI6D+Jb8Svlj99AccTixU6LbT4xx0uVPjS7VPKfz+AbHXeOw88QU6zJXNPzXEt8S/OjdaBNxGaTJ+Iz5RZQOa4B824lzdPZLM1CQcFNgj0uowVCLrf939Xq7vqYTb4W3pKOf+UfxtqBqO54TAWNMdsnUBv6Y1pAgfUlyS2ReGwqt1fG+FQFh1f2WvETPX9kyOH3Xsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXPHv0eiWB6fWamkDKEiVENzRxdZ90Y2Irf6aq8NUXQ=;
 b=uTqHZAGPiSprcJcBKNltA1lRmakOwJPfwy06YEu8EDjlyH7pzstZpitTxLCrsN0MwsA4cVm9PliQWDofpt5TPVmUnXwHLC5vPwi8e423jo2U9ckalHztqktHdji5sLyCgESA2p0uv9ZgcrwCLqfjpBfdiXGwvHKy2QDUQ4+PWhrB2oz21Gzf9EXJN4JX+3nN3rgWpvlvl5teiFMe9e9NJVHKej7FHNkfb6ewaQD2sawZBdFrnzrgqJnH8t3KPMBRcfSWapYDFC0HyTUjc+C1qPCJnyIw0HgmAw777rb+T3Q2nVmMD782pCCQoMkthVHl3L8C9qiXuPofx0vIhKFxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXPHv0eiWB6fWamkDKEiVENzRxdZ90Y2Irf6aq8NUXQ=;
 b=azVpY4x89briIXhAu+0HmHmpqjLi+ewu+bmSP1BOptWGkGzZGywFhL7yNZSJ1kAf0vFay7JFwKAQSs1FlJrk71pr+mfC1koFkB7ASGkd4qd16vtOJuumd6yGhRuv5DEKRurDRXVt4iQWPUe7aPwQD9Nh54aj6J87LLUwgFvuSC/SuyVMHgWzcuRL9IPNEs8idemrYXy8wuVGORlBGph5mxZTjCXQa2kQYGHbWj0kdXJJE74Jkoovq/p5Ts+1XNlavy0giWStYwSSqCDWDaRdmr19jknY6uJJPp+crr8Qzy3EWsQYuMmOGbPY0Mc0EFmBWjYTou9g2kNQfebp08ZDrA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Topic: [PATCH v2] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Index: AQHcJwfEWjVU7vF+102YDgRq9OEY77SV3fSAgABWKoCAAAe4AIABLJwA
Date: Wed, 17 Sep 2025 13:59:18 +0000
Message-ID: <d812a470-0ced-4585-827a-16d1ab7ec6b1@epam.com>
References:
 <0adc0a8f75cb88b0b26d38289d1dd5823386290d.1758024454.git.dmytro_prokopchuk1@epam.com>
 <b20b152d-cc51-491a-ac2b-148ece34efd4@suse.com>
 <adb1c46b-aa6f-4412-863c-96e95c10b85b@epam.com>
 <e6199dc4-be32-4d02-86a3-1548b8aacc73@suse.com>
In-Reply-To: <e6199dc4-be32-4d02-86a3-1548b8aacc73@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DU0PR03MB9708:EE_
x-ms-office365-filtering-correlation-id: fb6c898b-a3fb-470e-69af-08ddf5f26572
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bjV2MFRwclc4UGdrYjN6bEVLaDZRMWNUaFRXQUVFZERiYjB3SjFzZGRPeVFE?=
 =?utf-8?B?b0JSVjRCc1N2TnZyNHhnVmJlUlpsNXNjQmJOVTlGbVpvZmhSSDBLT2w4b0di?=
 =?utf-8?B?clk3Q0JaM2U4cXVkcW5rV3VMRmlWaXlJODh1dHJMbS9UNVR1TGVBMlpGRmhB?=
 =?utf-8?B?U3ZLSXUzMVZWWUgyTHVvam85cWJWT2sxSUcrd2QxVXNOb0hJMFFTdFBMOCt6?=
 =?utf-8?B?Qm5mVXlIZTlSRXlIS1ZrcUZadVpJUlhDTHRGNnJHOVFTNDR2Y1BOd1hFMzE4?=
 =?utf-8?B?T3RLZk0vTXB4OFRwdVA2TVhlb0U5K3g4Myt1VWp1VXVnUHdPR0hINVJJREJV?=
 =?utf-8?B?TFE2V2E4aElBek14a01mS0dQQ2FDWEJnN2x1Zk5Fd3NMdEpUdG1yYkp4K3pX?=
 =?utf-8?B?cUhCVUYzV0Uvb21YVEZudzlzQUc1bE8wbTNkNDFkNUNHNEVaZDNTUUNKcHht?=
 =?utf-8?B?SDdCamphall6WlhBOW5KUnk0YmpOYW9VaDVacE5kMG9kNmI2bDFCSTNYSkdU?=
 =?utf-8?B?TDJYaEVtS1NlYW1GaHBRRXVNRmM2dUdDZE0rVkQzOWI5N1BDSWl0cVJQdG9U?=
 =?utf-8?B?YktLOURZczFJWGY0SmErYjJpQzZWdGJKQTVFTEt0dGRUSWhEc09ENDAzZFR0?=
 =?utf-8?B?Yk8rcWE2UkFOMFR6aE5tVGw0QzlNVkNQWVgvWCtxeWVVMEkvUWdscWpsZEdt?=
 =?utf-8?B?MEoyMmdrekEzUTI5cms0OVQzNW1LY2lYSUlGQmZWSHViZkN5SDZxU3Y1RTJT?=
 =?utf-8?B?OFZMVWFvUk1LZHRwYjV0b0lNK2JLOUw1cEh3TGs3QzlKVGJQZTlsQ3phWCto?=
 =?utf-8?B?R1gwTVlCTm1VQWpRRmJFRnpuckFDL1g1c3pQcEhrL2MrczZMSFR2NWp4aU5z?=
 =?utf-8?B?azNUN1VFVDZvYk8vdEdmVGtIa2pjSkZXRFBYRWdlN0xzRUJSeXU1b2xVQlZy?=
 =?utf-8?B?cGJKdVp5MkRqRk9wZDdMUkhaMFFqbmo3WWxnS3FMSHA1bFovaVlsemYraS95?=
 =?utf-8?B?YmhybWtJaE1XMnlNV1AzTDZXdXJIVGtYVDBwcEpncnNJb0x0WitrM0p1QS9x?=
 =?utf-8?B?bnFtN3hoTysvdTRCZ1NvMEsrUENnTHJnR1NHbGZoUXhSckhPY3lJNDNQMUZB?=
 =?utf-8?B?ckg4T21HNUwrNjVtVnBYcDZrVmpBVWcxSUJOTFgzYjB4cmlxUTVDZnBLMFZJ?=
 =?utf-8?B?bHZWeC84U1F2N0o4dmtWaUVzOFFkQVcrcW1EUHNTdUI4WXRpSkpDQ1FkZG94?=
 =?utf-8?B?cnhNQlczbkhMZEwvTEUwK0RYYXlkcXhCaXR0anBDZWNuK0hYVGhvNzJZMEFF?=
 =?utf-8?B?TG93ZVBQeXMxQ2wvTktYc0xkNDRoakhOdEsvYXh0UUxhb1AwT2kvS21BcUcy?=
 =?utf-8?B?YnRCYnJGWjYvcXFsRmFZQklCOFVCUkFQenpoM0VNRjYzb1dxcVA4cXZVL0lK?=
 =?utf-8?B?Qm1lTUxkbmxDbzJhaEl4WHArSVJvdFVMb0RML09KQlY0YTlXSi9VL0l5NlFH?=
 =?utf-8?B?L2VlNWc3eEh1R3ZraFBiOGgyTGNWWVZNVkI4dU1xTE1WNjYwYzhrQUJraWx0?=
 =?utf-8?B?VE9McEJDS2FGQVVKQXpMQ2RyWUVqajVGdEllb0lMbGFVR2VsMmhpR1Vmbmtu?=
 =?utf-8?B?Y1RSeHVYa3EzVm9YanQzeFpNZDlqeVd2YWt1ejZuVzFvZW9yUHlXZE10UzZ5?=
 =?utf-8?B?K2ROZXFtb2ZES3RkY3dDRStsUFhiM2hqa05YSEcvV1RaS2I1YjBhMjlDaDhW?=
 =?utf-8?B?L3J2VHh6dldSZVpDL1R5NXhSM3g1RjVmV1AyWjcxSzFBUFUzWHQyTVZxdlll?=
 =?utf-8?B?RjNTZ2I1NzN3bHFXYjZUajBnQVI5MnVJdWpuMThaUFNlRVJYVTR2SURRNkgz?=
 =?utf-8?B?ck01MTJjTnc1YVV0eGxxYlZmZmdvVTdkMHZSM2FFdHhDVzdJblZtdVYxRmV6?=
 =?utf-8?B?Q2JKMnJXVk14c0x0aFIzTGhkQS83eFlDMlFCaGF4YWlQc1VoZkRqVlV5UTNl?=
 =?utf-8?B?L2pZZEZFS3dnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFJJRGJUeDQ0VlhiWm5LYWxBa2J5NHBhSEYxM1RWUVUxRVpkUDF3bVZPTit2?=
 =?utf-8?B?ekdnZmcrUGFJRXgwRkMrNE5xQUxVbk5JeHhBTzQ2VHpiT2pNNXRBa2xlTzN5?=
 =?utf-8?B?NUVLdUFqRDdwZnBUZlJnOElkdlpWRmpRRFNHYU5wTkZuc3c1MjZIeXIwN3Bz?=
 =?utf-8?B?WjJGSG8vYWhndnp4RnVycDl1NjRDQ3FjRjRqc2o0bjRra3ZzWHFBdVloRVZn?=
 =?utf-8?B?ZEdLNUtoK1k5VU5XczhSSnlPbTNVNXYybVozaWlVdCtSM2RBUXlNcDhZYnZT?=
 =?utf-8?B?OWNyZGw1M0xhUEdmWVpXM3hUY1VqeHp5WWRxbmlMOVgwd1ZWNmNudUN0NkVl?=
 =?utf-8?B?aUkyYWdzUEJLSXpoVkJxdXRobWcrSlhvZlR1eTFKUk0yb093THliVHl0b3BP?=
 =?utf-8?B?Z1BLMm05TjIzb1NOczNxNlYwbTlwUU5wN05uZDNVSjFxbnZXK0RLdW0zUkdV?=
 =?utf-8?B?dDBqbzJLZUhHUEV5TUNNLzNrS3YwSlU0YmFwRFgvNVFtSGt2dEJLU2J3aDl6?=
 =?utf-8?B?VFR1ZDlGbjZoSS9FZ2NNdG1ReHQzUmtWTzRNclFXT1ZjQjNFZHk4MG4zditv?=
 =?utf-8?B?VWxhRzZhRm0wZENwcHllY3NGWWNETTNVeHlVZkdWeWdwK0djdjZvbVNzcE1L?=
 =?utf-8?B?bnNUVGc0Y3JwZ2xweHVCSEFzRVVVMzdrTG9UTXVDVHVWUFVRbGsxTUQyU3Br?=
 =?utf-8?B?VzZnWHBlMmc0OEtKTXd1Q3RwMEJFWmVDN1RBV0NSU0Mydm1FZ1liV0VnMVdl?=
 =?utf-8?B?OU93NEdPVFAzRjkxVmMzQ0RWRFNVSTBWekhlbzNQeFEwY2dNaDZvdTE3akdr?=
 =?utf-8?B?N1NjaTNDYjRrRmo1dWQ2aExPM3VRa2J3dlRrUE14T3Q3M1I2SmNMRDl4SGdv?=
 =?utf-8?B?QnA2UUtndFZyWlBrNVZUNEdaWGg3bm5CMWFDY3JYK3g3SmlrK1pwRTkrVlJv?=
 =?utf-8?B?WGNoU01DMnJaR3NFN0c5STM3aVloRStVWG5FQU43bXNXNnhVaUxFMGRFT3Zt?=
 =?utf-8?B?Mk94ZitGenlTQVBMZnJqYkNPdE82bWlTd0F0VEsyNm0yVUFxc0Z0QStsbGts?=
 =?utf-8?B?TUlZcTRNb0lzUWNDVHZlaDBmc0hGZytmUXdrRlk0emZoK2dLRXUrY3BPdFBm?=
 =?utf-8?B?RGgxZ0g3ZVhkZ3VwbVRsZENubzgwRlVPN2traGJ0MVJQNjArREdjdVlNaDN5?=
 =?utf-8?B?b2N5T3p5VTFxNXVha0hPaDJBU1kwN0srUG5rY1hHRDlqQXV4Q0x5VDNQbzFW?=
 =?utf-8?B?akxLOTlsT2FadTFJeXhPK2RQRHMzaHltczRnMCtNNXZrajU3UFhnQ2ZHdmVr?=
 =?utf-8?B?b0lyaXg5dmRDai9uTXVQWmZDcjBPS21KSTB4bVFzdTAvaVM0N05WeGlYSmJ6?=
 =?utf-8?B?a0k3WUU5RXVtYTJZZTVuaEFCZjE3Z0tXYjVFcS9PUVhwdmp3eVJ4YysvOWQz?=
 =?utf-8?B?VDJmVkx6bGZzbUE5RUVMVEwzUW1oMXVyZmdWUzRNcVBqZGJFbGlKMnhTakFs?=
 =?utf-8?B?VzZqS2haQzRyc2ZobE9VNEVVSGtFQ3F5MGxCNjgvYVQwMmJWVEhlQnovcEdP?=
 =?utf-8?B?R08vcHUyVmdrMjRmUEFkaFRoaCtmbVJ0VmpEMGJNcUFHb3VaYytwVU5vM1hF?=
 =?utf-8?B?TkNUWm9najcrVFY0WTdqUHFxRmNjb2xFbU9XMGk5dWFvanYvdEErdFVxdzF5?=
 =?utf-8?B?bG9tUGN5SlF0YmFVcC9LcmZIYm5QOFhYcjc0OW41R2h1OStDalEvZUkwMEw5?=
 =?utf-8?B?aGw3UzN5R3VPa1dnMDJPOFJyKzd6aGJoMkZKeDlWSEQ5Z01raDlzcXoxdGRG?=
 =?utf-8?B?VERHU2x0NDNJeFRPblZFd3c0VmtxVVhpdE1EakI3Yk5xdkRWemdoSkNzczF2?=
 =?utf-8?B?Zi92S1REZGFuaFJ1T3NUaU9NeXhTMDh1V2JUdC9GTjFjc2ZCZWRYNlRCaktY?=
 =?utf-8?B?WnBhcmdxeGxFamdQdXRQeXBoTlo0Wm9SZWZxS3ZxSFFWeWluZnNJOWt4RzA1?=
 =?utf-8?B?U0N0dFNsRWI4dWFaWHBvQmc1a1BRUGZzaUFON0d2N3ZoRXpXVDdBdDZDcEdH?=
 =?utf-8?B?Q00rQUZHSzlEUkVici8rWHE5RDRsd3FuU3V0bG92c2wySlRqbVJITzNPaFRR?=
 =?utf-8?B?V3ZOcFZLVmdZTDdzc0lPb2ZhdUM0S3QranB0aTYrRUsxQko1cm9wc2ltdWVw?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EAFDF7CFA156742AAF752ED94AB9AD0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6c898b-a3fb-470e-69af-08ddf5f26572
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 13:59:18.9218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UuqJKGuz2pY1fo8PcwLdag2fRUtL8YlUmyYcSDVgGvcIDKwE9WFWYfHBczdb2Pj3QyeIlNNo7MCJRYS0YM21blY22wll6+Aa8P54emwcxxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9708

DQoNCk9uIDkvMTYvMjUgMjM6MDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4wOS4yMDI1
IDIxOjM1LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+Pg0KPj4NCj4+IE9uIDkvMTYvMjUg
MTc6MjcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE2LjA5LjIwMjUgMTQ6NDUsIERteXRy
byBQcm9rb3BjaHVrMSB3cm90ZToNCj4+Pj4gLS0tIGEvZG9jcy9taXNyYS9kZXZpYXRpb25zLnJz
dA0KPj4+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+Pj4+IEBAIC05OCw2ICs5
OCwyMyBAQCBEZXZpYXRpb25zIHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0KPj4+PiAg
ICAgICAgICAgZXZlbiB3aGVuIGRlYnVnLW9ubHkgYXNzZXJ0aW9ucyBsaWtlIGBBU1NFUlRfVU5S
RUFDSEFCTEUoKWAgYXJlIHJlbW92ZWQuDQo+Pj4+ICAgICAgICAgLSBFQ0xBSVIgaGFzIGJlZW4g
Y29uZmlndXJlZCB0byBpZ25vcmUgdGhvc2Ugc3RhdGVtZW50cy4NCj4+Pj4NCj4+Pj4gKyAgICog
LSBSMi4xDQo+Pj4+ICsgICAgIC0gSW4gdGhlIHNwZWNpZmljIGJ1aWxkIGNvbmZpZ3VyYXRpb24g
KHdoZW4gdGhlIGNvbmZpZyBDT05GSUdfQUNQSSBpcyBub3QNCj4+Pj4gKyAgICAgICBkZWZpbmVk
KSB0aGUgJ0JVRygpJyBtYWNybyBpcyBpbnRlbnRpb25hbGx5IHVzZWQgaW4gdGhlICdwcmVwYXJl
X2FjcGkoKScNCj4+Pj4gKyAgICAgICBmdW5jdGlvbiBpbiB0aGUgaGVhZGVyIGZpbGUgJ3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW5fYnVpbGQuaCcNCj4+Pj4gKyAgICAgICBkZWZpbmVk
IGFzICdzdGF0aWMgaW5saW5lJyB0byB0cmlnZ2VyIGEgcnVudGltZSBlcnJvciBpZiBBQ1BJLXJl
bGF0ZWQNCj4+Pj4gKyAgICAgICBmZWF0dXJlcyBhcmUgdXNlZCBpbmNvcnJlY3RseS4NCj4+Pj4g
KyAgICAgLSBUYWdnZWQgYXMgYGRlbGliZXJhdGVgIGZvciBFQ0xBSVIuDQo+Pj4NCj4+PiBJIHJl
c3BvbnNlIHRvIG1lIG91dGxpbmluZyBhIGRldmlhdGlvbi1sZXNzIGFsdGVybmF0aXZlIHlvdSB0
cmllZCBpdCBvdXQNCj4+PiBhbmQgc2FpZCBpdCB3b3Jrcy4gVGhlbiB3aHkgaXMgdGhlIGRldmlh
dGlvbiBzdGlsbCBiZWluZyBwdXQgaW4gcGxhY2U/DQo+Pg0KPj4gWWVzLCB0aGF0J3MgdHJ1ZS4N
Cj4+IEkgc3RhcnRlZCB3aXRoIHRoYXQgcHJlcGFyZV9hY3BpKCkgZnVuY3Rpb24gYW5kIEkgdHJp
ZWQgdG8gbW92ZSBpdCBpbnRvDQo+PiB4ZW4vaW5jbHVkZS94ZW4vYWNwaS5oIGhlYWRlciBmaWxl
IHVuZGVyIGFwcHJvcHJpYXRlICNpZmRlZjoNCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJv
amVjdC9wZW9wbGUvZGltYXBya3A0ay94ZW4vLS9jb21taXQvZDE1Y2Y5MWRlOTJmMWY4ZWM2Nzkx
MWM1MWExM2U3ZjA5NWMxYmNkZA0KPg0KPiBCdXQgYW4gaW1wb3J0YW50IHBhcnQgb2YgbXkgcHJv
cG9zYWwgd2FzIHRvIGhhdmUgbm8gI2lmZGVmIGFyb3VuZA0KPiB0aGUgZGVjbGFyYXRpb24sIGlp
cmMuIFdpdGggdGhhdCwgbm8gdmlvbGF0aW9uIHNob3VsZCByZXN1bHQuDQpJIGRvbid0IHVuZGVy
c3RhbmQsIGhvdyBpdCBjYW4gaGVscCB0byBhdm9pZCBzY2FubmluZyBieSB0aGUgRWNsYWlyPw0K
SW4gcGFydGljdWxhciBidWlsZCBjb25maWd1cmF0aW9uIHRoZSAic3RhdGljIGlubGluZSIgdmVy
c2lvbiBvZiB0aGUNCmZ1bmN0aW9uIHdpbGwgYmUgcHJlc2VudCBhZnRlciBwcmVwcm9jY2Vzb3Is
IGFuZCBFY2xhaXIgd2lsbCBzY2FuIGl0Lg0KDQpKYW4sIHBsZWFzZSwgZXhwbGFpbiB5b3VyIHRo
b3VnaHQuIEkgdGhpbmssIEkgbWlzc2VkIHNvbWV0aGluZy4NCg0KPiBXaGV0aGVyIChvciB3aHkp
IG1vdmluZyB3b3VsZCBiZSByZXF1aXJlZCBJIGRvbid0IGtub3cuDQpJdCBzaG91bGRuJ3QgYmUg
bW92ZWQuIE5ldmVybWluZC4+DQo+IEphbg0KRG15dHJvLg0K

