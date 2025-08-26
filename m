Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F96B371F0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 20:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094908.1450098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqy4n-0002qf-Cp; Tue, 26 Aug 2025 18:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094908.1450098; Tue, 26 Aug 2025 18:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqy4n-0002p0-9y; Tue, 26 Aug 2025 18:07:21 +0000
Received: by outflank-mailman (input) for mailman id 1094908;
 Tue, 26 Aug 2025 18:07:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZJD=3G=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uqy4m-0002ot-FF
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 18:07:20 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e9e4c6c-82a7-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 20:07:14 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DB9PR03MB9709.eurprd03.prod.outlook.com (2603:10a6:10:459::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 18:07:11 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 18:07:10 +0000
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
X-Inumbo-ID: 7e9e4c6c-82a7-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDZ5GiNQjRsIT1AXGl3F6fGwrvgr9tvrz0fNBVc9Lju0SDxKLFTBEk0kzmlg5HfJjDV5Lll5ANWdtAiKxFlWR48RfsKqoKA+WBOUczbPsluC+Uiz3zGg6j1WFUINjdJLP7DmuM1RXeZYw2+UQkL4ifshFueQApKC4Llx0ozp+odM6Ftgzdm0fisFo2BTb3LbycQKENXyKeppYDob0/R94GiuHwWg+XGoVMPjhnVTfjVSwY7LY3E2Ib/au+9eCloVC9xJ2aT7NtaDYIdb4LFWlDNpwuQJRAohJkh01sfiqNx4H9TDjj0Sszb8qM/CSVjekbIPD4OWmNyTBYRb8B5epw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIRdzFRKj2OPMDf0RDq7Ij2/j14ifvdzSED+t/Zmo0M=;
 b=o8sL+VH+kbOYOMF1y0CnZ+NN9m2EOJERm/1cQ4u/J5qklSzkpnwVO2JAPwS18SFXMlkSLSSiHCIXPcC/HTspm0L+5O8V6U+QqrAvaDW+UU8JHQALHmsYUQ9J/YERbc/G5YJJcc51QW4/JPH9tKvG2d91IEHv656N0AYYwknBxQF6+I3I/MN0CTnj/Ewj9itBE0S25+CsZdU1qInsRdnYdvTEa3k6z/0gSdhLmMLPzZaTzDVu5CkqYj+uyjpO0zLcoIz1J3kLTGGsT85+RCO4KMoyRzsXb1Mikfz4AgtqGOtWQI3cWcqu2+N+oB6cj9ZBLnYJwavnIaOnFWKu7VGj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIRdzFRKj2OPMDf0RDq7Ij2/j14ifvdzSED+t/Zmo0M=;
 b=PJ94aZ3jtG67AlGjE7wbk34VPmlDLRKLeD7SPC49yRtmRTK5tErzknNBONtjsEjEAVznUNBumyf0DbSo5/TkEMy2aGY9i49RExLcCLNK+EK6J1vP9EgmTSyYffDZNvXyiVlWfiZYeES/TXCBEONK+iAKoMMKo2EtBs4AsT96Yc3GNmx5cWmaG6ArMVFonM9suW26OQcS6sTg7B38cw2LptvrETyTNPRzKTbEzXKNe6XFC+O/FsfDWIZ8wC6JuWPTs2zcJJ+2VC/gNUvEYPZ9Ra2d8IwJE3+n+QviFBNqdISmdaklZTjr0D1OgHUYH68c/unUyzdOthrxL+SnUFGNUA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Topic: [PATCH] misra: add deviation of Rule 2.1 for BUG() macro
Thread-Index: AQHcFQc77bBOPokbA0m9oV6J6fEgkLRzJgAAgAIYbQA=
Date: Tue, 26 Aug 2025 18:07:10 +0000
Message-ID: <d9e9deaa-fa3e-4f4a-aa70-772af4bc1371@epam.com>
References:
 <f7b4112aad84162c25f96a9d6db43a0c2ba85daa.1756046023.git.dmytro_prokopchuk1@epam.com>
 <60022d5c-1a9f-4a6d-8df2-bca57cefcf59@suse.com>
In-Reply-To: <60022d5c-1a9f-4a6d-8df2-bca57cefcf59@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DB9PR03MB9709:EE_
x-ms-office365-filtering-correlation-id: e85aea69-39d1-42a3-b96b-08dde4cb60b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UjhkdmJIVW9uMUtmbXVwWFQvOG9RN01iTkNtdXY0VmZzbkdnYXJGakFZVjQ2?=
 =?utf-8?B?NmJyYlEvTk51cWJWWU5YZFdHcFVONWN0bHYzbHUzTW5JcGN4eDgwa0wzUDNJ?=
 =?utf-8?B?WlhyM0thRWtaR2NKVlJBZ1RhcjlXeUszdjFUaFNWVTlWYk04K2hJZE8yTHFD?=
 =?utf-8?B?M2pBQ3dPOEVuZUN4aVdEcUxacXBhc3BhWkloRTk2cUtsVGNkOXR0Q0xBSXJT?=
 =?utf-8?B?WUU2WEZzQkNscExlTjBZMVVSdElIMWQ2ZlZzTmFzQlFUU21tMnIycVZBN3dQ?=
 =?utf-8?B?ekRpQXoyWmluekF1d3NubGNNZW5iWEpqNHNjbzZxRHcxaEJqMWdwV3dzZk5w?=
 =?utf-8?B?cmtCUXBMdUQxYzhiSXFSMzU4NC81ZTd4Y1U1eTVPbGFqQXl4WFRMRVFYOGcr?=
 =?utf-8?B?T1F3UGJHbVN5S0w4bWJkVEI4c2dpdFVYSHdmN3BjSXdmTlU0VzN5RHFGU1p2?=
 =?utf-8?B?WHNEU0RjWlZHeCtOTWRrOVNyR2Nlc2lXcVQ0N3dFWE9sR2pqYmFlVFpNaUNJ?=
 =?utf-8?B?K0plZ0Rtc255Qk8wUFpEOUFzNEwzdGM5VzY4ZVRmQ3Z6VjlGcmQxQ2pyU0t4?=
 =?utf-8?B?cHRKQm9tam01SUFCcXREUGpyVFZzakRlamVaOExMeWQwL21HdHpjRnFiME5l?=
 =?utf-8?B?eGRVOWVqUU51Z3g2VUZmdXJ4QlBXRk5MQjVVZGJxZUdRcjV5Q2xTNXYyRnNS?=
 =?utf-8?B?LzNxR05ERC95Ui96Wnp4V0Q5U3YxVWVNbU1KNUoxY0lsVU1zUDUwOVd2aDVh?=
 =?utf-8?B?eVZjbjd3c04wM3h2WGloOUIzT3Q0ZmxIYlBjbEdhcTJSdWp3eExJNUg1MmI0?=
 =?utf-8?B?M2ZMYnYyVW1oanpRRXQ4NGJSa1ZheVpUQzI2dkN2L01WaG51S240NEJoVHdo?=
 =?utf-8?B?bnZhbkdGRWgrZFdEZyt5M2xYVGpKdnRDWk5LRVltR2tGd3YzLzhNMUszb3pz?=
 =?utf-8?B?dWdoWnpHS0FZM05MVnMxaE1CL00zME5RdDM0aDF2bDBpcFFBak1paVpmakxp?=
 =?utf-8?B?SldtZnFHOXNWdDFXWXR5cGVQUmlDWDUwUi80UjJkYXJHSDNUWkRKWk9OZ0RO?=
 =?utf-8?B?VldKYnorNXZaQ2dGbFMzb2J3Ym1FOTQ0ZzRuSU5zUVFzYXlTMGs2d2FwVnpj?=
 =?utf-8?B?SUNnaUJraHRJSmRpejMvcFFqM3VZUnpOS0U1aDNpbkMwWEJtcXRlSVhJZWtI?=
 =?utf-8?B?WFNMSzc2TGpMQmRXVlNpakdOS1c4bHJOQ3FMMVZ0Rmw0T2UrZURVUmwyMkkx?=
 =?utf-8?B?VDJ2Y0daR1RTdjQvdWJZL2lpUkdqNElqSUJ6YW9TeU5ZV2E2c2o0K2VnTm45?=
 =?utf-8?B?eC9sYzVqQ3h5YWVDazBWUUFyTnNZTnN0VWdSQjB2U3ZWWHRFMHNGcVpuUGsr?=
 =?utf-8?B?TVdxVThjM0l0VjVGcW9COFdMRlNyNU5oWEJtNTB6Z0pWYnB1RlRHWnR0eXZC?=
 =?utf-8?B?T3MySU8rVGE0WjR1MnZzSXhnSW5JTmhhU0lZRERKTGdUTXhSY3A2aktNU0Zm?=
 =?utf-8?B?RTZQWDhRMGdDMW01UW1VdUFMVE9wejRqY1BTdEtIRXVobnorRVpINVF2bjNv?=
 =?utf-8?B?OXJjazhPUUJGU3RBWGhSNENnVUx0bC9tOGpLeUIxTnZUWUgzRHUzUlZkNFhL?=
 =?utf-8?B?REp4bHBLdnN5MFBNeWtuaEExeDVEUXR6aWpTTnAvR0ZLQUlDVU8yVEEyU2tD?=
 =?utf-8?B?M0lLVTBUa2JUNlQ5WDh4anhGb212YVpYNXpnUmk1U212cVFMZFNMSTU3bzBW?=
 =?utf-8?B?Y0l0ZVJjRVFXT3l1RzlicW1HUStYTC9vbWdtRkx6UFpsd011ZWMrL1dPMXpH?=
 =?utf-8?B?QkdJMVNJa0xGMVd1akpuZFp2aTFnVTN1WHJxT080cDY2a1lCc3VjN0daM3VG?=
 =?utf-8?B?TmhlTUFtb1FyWkVNSkVWVUdMVlB4V0lnaXVpR3Q1Wmw5bWlLZUh4SnR2NENT?=
 =?utf-8?Q?awwNdSCPLX0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWwvMzVHaURIdTdyTlFZaTc4c0FqczR0WmlyTWVKN0QxV2FYZHJYSjFnNm9u?=
 =?utf-8?B?U2JqUUp0QjlQRUZBTEQrQzBHb0R4WGtZNDBidG5FY1dLdjgvWWdkVkw5ZC9E?=
 =?utf-8?B?cVdsUVgveUFxMnpWSkcrM1BtN1NZUy9tSGt3RGY0c2NzczZMSTFidkc2dzdo?=
 =?utf-8?B?VXNlT24zMHVIb2czZWNKS3BWZkltVlRTczk2WWVocUNRdExYRjFWNW4rVDlO?=
 =?utf-8?B?dlhlOGFkZmpsOEx6U1NQUzRNc2VGWEx3V2R3UUVMamxJdnFnM2o2Vm0rUno5?=
 =?utf-8?B?em5hZHhtTWI5NGkvR09zUDFxK0Y3eitMUXVMUEdDeVhkVUpiQ1ZwRlQ5UnVP?=
 =?utf-8?B?M0NnOVlmQ3haZWNubmV6QW91RGZLQWZNM1JIY1BjUnRsUTQ4V1JyNm4yUjRB?=
 =?utf-8?B?enJUdWhNMXlSSUxKcitnSTB1bW9XVjVCSXV5VURLZUN3d1Q3dEpIR3hqcnlO?=
 =?utf-8?B?c2Q4S2llQVFjRk12Z1hJSThOeVdyQXNPZFVmeXVrUWFDczdadGJhblBoOUhS?=
 =?utf-8?B?K2k4UXVCUVF1S1p4dmxFTHd3R21MbGhYOUZCN3dTeHkzQTBWSlo5MWRQVEhx?=
 =?utf-8?B?SE40ZGJyN2Q5bjA0ZTJkaTJQR3M3YUZTcVlhMUEreVlva01kb0hzNFlMUXNE?=
 =?utf-8?B?cHJnMWFFcC92Z21qeHJNczJVQ0pQTnNvWWp5d01uUmhVczVqb0k0eGNXOFVW?=
 =?utf-8?B?ZGlwODNnVVJxN3JHY1pqdkdmZCt3NTJ5VlU2cVVucmlEUWx0SlF2TStRclVw?=
 =?utf-8?B?U2dYeXVpVG1haWZmN1BkLzNrMEF5MUpTNWJrWUs3Q2N2MWxxbHJKYzJKZDZQ?=
 =?utf-8?B?TDdUL2J5SUhXNzRKdDRRM0JEdWJPaGNSZzRTQ3JHK1Y0eldINlM5bDNsY0hT?=
 =?utf-8?B?eEg5ekJyRWlhY1ZIbUNMYjVDODJISTVxcitJS2NBUVpQaG9KcklpNlNBbHAx?=
 =?utf-8?B?UnY2TFRRMURldEVqczJyM0QyVzZIRTA3czlmaG5Va3RHSUk4S0V3dlJlcUFR?=
 =?utf-8?B?VnVTdGNVNVNiU3Q1K0krWlkvRUd6cW9wVVhpVFFTUVZQQjF1eDhJc21mVXRN?=
 =?utf-8?B?VUUwVVBONHFMV2gxdWpoR1k2QnNYelM3Nnp5RFBSSmFIWDFZVFIyK3hkaDJj?=
 =?utf-8?B?M3lMWExrWWVFeHNSOWVra1I2TjhtTzFtVk5uazdDVnZLZFFJem9FVU5WOTVR?=
 =?utf-8?B?aFRMOUEwYjNPbmNRcG5LRFU1NVA1M0dsVmVNd3FjNWE1Vk8vYTEyY2J3a0F5?=
 =?utf-8?B?NWllVHhWMlBGR3dSbVFFMzh1VGJObm5RNnZaK0hBeXBaTEF4MXZDclZTNnRm?=
 =?utf-8?B?a3NVRWRCQ1pvcFZxZnhPNkVqK29ZbEdnTDhnNWw1NWEzcG41eTBwMmRoaVJr?=
 =?utf-8?B?ODkrSHd0Vm1CSmdsMXp3TklNRzJZZmRuNDMwQnByMFFPVDJzZDZMZ0paTytU?=
 =?utf-8?B?MDU2dHZ6WTVBY0Yra2VMckttSmZ3Sk13bTNMOThSNHZSS3ppTXZqWXZnTHMx?=
 =?utf-8?B?ZHNocnMyTXB0M3NNUDJFYkZOY0lOUTA4blNJRnRIY2FlbDdXZE00bmJBMHd0?=
 =?utf-8?B?NnU5YzREU3p1ZXBwZTRyaFQ3SVVGREFHajg3dFpxUDJ1WjZUR0doQjFUWVRM?=
 =?utf-8?B?Z0d3OXpPd1FxbGNjVFNScERKb1JIZ09veGhuNTEvWUx4SmdHbi9EVFdES0sy?=
 =?utf-8?B?enRHcmJKNFNXSDlRY1ZxRGpnM3V3b2NjcXhoVFk2dG00NFE3ZVgyaW03QVoy?=
 =?utf-8?B?cEI2c3o0SDhwWGY5b3NPTisrMGhuWmNwNFRxTThNdXpoZk1MSjcrMHliK3BM?=
 =?utf-8?B?bURhTG1hVGYzUHc4QnJVTzAxM2NpZGxFMlpERzJWd2o3SXN1RFZtN0hFd2dR?=
 =?utf-8?B?SHRxbFJ2MjZubDZLb3IzWWV1d3VCUndnNTlIMmhFRy9LZUhYVDJOUmg4MGty?=
 =?utf-8?B?OTlBZkhBdWRnNW84M2N4KzB0Wk5qTzR5bUkxNnlYU0FwUUlZMDJKc2UrUVBL?=
 =?utf-8?B?S0ZZMEZHYXlhUlZzcnAwVk9mQzdZUFgvcW5FYW5EU1hBcTJlMzdDMmlVQmlw?=
 =?utf-8?B?a1FoYnI4RFQrMXVFaEhLeHZMRXVwL0NOMHFvVitNckhtQ1VBMXhBWTZ4eWwy?=
 =?utf-8?B?RDhkLzd3MUljbzNWeVpiRzRjaWp2VkdrN2RCbmZuNC9WdzV1d3dpYytlRi9o?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E90316A6C0E088408C0FFD4C37ED0336@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e85aea69-39d1-42a3-b96b-08dde4cb60b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 18:07:10.8100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWRNXweD7KUxp5C6woDLO+kD+mnrLzkMHMhk2xJR9W3l6vx5Upe8swyJgpxIndo2FE4aeIBbdh+yrGjNHtXp0zxHK68R7RPta8/38Gabj34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709

DQoNCk9uIDgvMjUvMjUgMTM6MDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wOC4yMDI1
IDE2OjU2LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS9kb2NzL21pc3JhL2Rl
dmlhdGlvbnMucnN0DQo+PiArKysgYi9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiBAQCAt
OTcsNiArOTcsMTkgQEAgRGV2aWF0aW9ucyByZWxhdGVkIHRvIE1JU1JBIEM6MjAxMiBSdWxlczoN
Cj4+ICAgICAgICAgIFhlbiBleHBlY3RzIGRldmVsb3BlcnMgdG8gZW5zdXJlIGNvZGUgcmVtYWlu
cyBzYWZlIGFuZCByZWxpYWJsZSBpbiBidWlsZHMsDQo+PiAgICAgICAgICBldmVuIHdoZW4gZGVi
dWctb25seSBhc3NlcnRpb25zIGxpa2UgYEFTU0VSVF9VTlJFQUNIQUJMRSgpIGFyZSByZW1vdmVk
Lg0KPj4gICANCj4+ICsgICAqIC0gUjIuMQ0KPj4gKyAgICAgLSBUaGUgJ0JVRygpJyBtYWNybyBp
cyBpbnRlbnRpb25hbGx5IHVzZWQgaW4gdGhlICdwcmVwYXJlX2FjcGkoKScgZnVuY3Rpb24NCj4+
ICsgICAgICAgaW4gc3BlY2lmaWMgYnVpbGQgY29uZmlndXJhdGlvbiAod2hlbiB0aGUgY29uZmln
IENPTkZJR19BQ1BJIGlzIG5vdA0KPj4gKyAgICAgICBkZWZpbmVkKSB0byB0cmlnZ2VyIGFuIGVy
cm9yIGlmIEFDUEktcmVsYXRlZCBmZWF0dXJlcyBhcmUgdXNlZCBpbmNvcnJlY3RseS4NCj4+ICsg
ICAgIC0gVGFnZ2VkIGFzIGBkZWxpYmVyYXRlYCBmb3IgRUNMQUlSLg0KPiANCj4gV2l0aA0KPiAN
Cj4gI2RlZmluZSBhY3BpX2Rpc2FibGVkIHRydWUNCj4gDQo+IGluIHhlbi9hY3BpLmggSSBkb24n
dCBzZWUgd2h5IHdlIGV2ZW4gaGF2ZSB0aGF0IGlubGluZSBzdHViLiBXaGVuIGl0J3MgZHJvcHBl
ZA0KPiBhbmQgdGhlIGRlY2xhcmF0aW9uIGxlZnQgaW4gcGxhY2Ugd2l0aG91dCAjaWZkZWYgQ09O
RklHX0FDUEkgYXJvdW5kIGl0LCB0aGUNCj4gY29tcGlsZXIgd2lsbCBEQ0UgdGhlIGNvZGUgKG11
Y2ggbGlrZSB3ZSBhcnJhbmdlIGZvciBpbiBtYW55IG90aGVyIHBsYWNlcykuIE5vDQo+IGRldmlh
dGlvbiBuZWVkZWQgdGhlbi4NCj4gDQo+IElmIHN1Y2ggYSBkZXZpYXRpb24gd2FzIHRvIGJlIGFk
ZGVkLCBpdCB3b3VsZCBuZWVkIGRpc2FtYmlndWF0aW5nLiBBIGZ1bmN0aW9uDQo+IG9mIHRoZSBn
aXZlbiBuYW1lIGNvdWxkIGFwcGVhciBpbiB4ODYgYXMgd2VsbC4gVGhhdCB3b3VsZG4ndCBiZSBj
b3ZlcmVkIGJ5IHRoZQ0KPiBFY2xhaXIgY29uZmlnIHRoZW4sIGJ1dCBpdCB3b3VsZCBiZSBjb3Zl
cmVkIGJ5IHRoZSB0ZXh0IGhlcmUuDQo+IA0KPj4gKyAgICogLSBSMi4xDQo+PiArICAgICAtIFRo
ZSAnQlVHKCknIG1hY3JvIGlzIGludGVudGlvbmFsbHkgdXNlZCBpbiAnZ2ljdjNfZG9fTFBJJygp
IGFuZA0KPj4gKyAgICAgICAnZ2ljdjNfaXRzX3NldHVwX2NvbGxlY3Rpb24oKScgZnVuY3Rpb25z
IGluIHNwZWNpZmljIGJ1aWxkIGNvbmZpZ3VyYXRpb24NCj4+ICsgICAgICAgKHdoZW4gdGhlIGNv
bmZpZyBDT05GSUdfSEFTX0lUUyBpcyBub3QgZGVmaW5lZCkgdG8gY2F0Y2ggYW5kIHByZXZlbnQg
YW55DQo+PiArICAgICAgIHVuaW50ZW5kZWQgZXhlY3V0aW9uIG9mIGNvZGUgdGhhdCBzaG91bGQg
b25seSBydW4gd2hlbiBJVFMgaXMgYXZhaWxhYmxlLg0KPj4gKyAgICAgLSBUYWdnZWQgYXMgYGRl
bGliZXJhdGVgIGZvciBFQ0xBSVIuDQo+IA0KPiBJIGRpZG4ndCBsb29rIGF0IHRoaXMsIGJ1dCBJ
IHdvdWxkIHZlcnkgbXVjaCBob3BlIHRoYXQgc29tZXRoaW5nIHNpbWlsYXIgY291bGQNCj4gYmUg
ZG9uZSB0aGVyZSBhcyB3ZWxsLg0KPiANCj4gSmFuDQoNCkFmdGVyIHNtYWxsIGNoYW5nZXMgcmVs
YXRlZCB0byBwcmVwYXJlX2FjcGkoKSBmdW5jdGlvbiwgTWlzcmEgUjIuMSANCnZpb2xhdGlvbiBo
YXMgZ29uZS4gVGhlIGNvbXBpbGVyIHJlYWxseSBkb2VzIERDRToNCg0KICAgICBpZiAoIGFjcGlf
ZGlzYWJsZWQgPDw8IHRoaXMgaXMgVFJVRSApDQogICAgIHsNCiAgICAgICAgIHJjID0gcHJlcGFy
ZV9kdGJfaHdkb20oZCwga2luZm8pOw0KICAgICAgICAgaWYgKCByYyA8IDAgKQ0KICAgICAgICAg
ICAgIHJldHVybiByYzsNCiNpZmRlZiBDT05GSUdfSEFTX1BDSQ0KICAgICAgICAgcmMgPSBwY2lf
aG9zdF9icmlkZ2VfbWFwcGluZ3MoZCk7DQojZW5kaWYNCiAgICAgfQ0KICAgICBlbHNlDQogICAg
ICAgICByYyA9IHByZXBhcmVfYWNwaShkLCBraW5mbyk7IDw8PCBEQ0UNCg0KSSB3aWxsIHB1Ymxp
c2ggaXQgYXMgc2VwYXJhdGUgcGF0Y2guDQpUaGFua3MgdG8gSmFuLCBJIHJlYWxseSBhcHByZWNp
YXRlIGhpcyBoZWxwLg0KDQoNClRoZSBzaXR1YXRpb24gd2l0aCBmdW5jdGlvbnMgZ2ljdjNfZG9f
TFBJKCksIA0KZ2ljdjNfaXRzX3NldHVwX2NvbGxlY3Rpb24oKSBhbmQgY29uZmlnIENPTkZJR19I
QVNfSVRTIGlzIGxpdHRsZSBiaXQgDQpkaWZmZXJlbnQuDQpUaGUgY29tcGlsZXIgY2FuIGRvIERD
RSBpbiBjYXNlIHdoZW4gY29uZmlnIENPTkZJR19IQVNfSVRTIGlzICJ5IiwgYW5kIA0KTWlzcmEg
UjIuMSB2aW9sYXRpb24gcmVsYXRlZCB0byB0aGVzZSBmdW5jdGlvbnMgYWxzbyBjYW4gYmUgcmVz
b2x2ZWQuDQpBY3R1YWxseSwgbm8gY2hhbmdlcyBpbiBzb3VyY2UgY29kZSBuZWVkIGZvciB0aGF0
Lg0KQnV0IEVjbGFpciBkZXRlY3RzIHRoZXNlIHZpb2xhdGlvbnMgYmVjYXVzZSBjb25maWcgQ09O
RklHX0hBU19JVFMgaXMgDQoibiIsIGFuZCBzb3VyY2UgY29kZSBpcyByZWFsbHkgY29tcGlsZWQg
d2l0aCBpbmxpbmUgc3R1YiBmdW5jdGlvbnMgKHdpdGggDQpCVUcoKSBtYWNybykuDQpUaGlzIGlz
IGJlY2F1c2UgY29uZmlnIENPTkZJR19IQVNfSVRTIGlzICJleHBlcmltZW50YWwvdW5zdXBwb3J0
ZWQiDQoNCiAgICAgY29uZmlnIEhBU19JVFMNCiAgICAgICAgICAgICBib29sICJHSUN2MyBJVFMg
TVNJIGNvbnRyb2xsZXIgc3VwcG9ydCAoVU5TVVBQT1JURUQpIiBpZiANCiAgVU5TVVBQT1JURUQN
CiAgICAgICAgIGRlcGVuZHMgb24gR0lDVjMgJiYgIU5FV19WR0lDICYmICFBUk1fMzINCg0KYW5k
IHRvIGVuYWJsZSBpdCBuZWVkIHRvIHNldCBhZGRpdGlvbmFsIGNvbmZpZzogIkNPTkZJR19VTlNV
UFBPUlRFRD15Ii4NCg0KSSB0cmllZCB0byB0ZXN0IGl0IChhZGRlZCAiQ09ORklHX1VOU1VQUE9S
VEVEPXkiIGludG8gDQphdXRvbWF0aW9uL2dpdGxhYi1jaS9hbmFseXplLnlhbWwgZmlsZSkuIFlv
dSBjYW4gc2VlIG15IENJIHBpcGVsaW5lOg0KaHR0cHM6Ly9lY2xhaXItYW5hbHlzaXMtbG9ncy54
ZW5wcm9qZWN0Lm9yZy9mcy92YXIvbG9jYWwvZWNsYWlyL3hlbi1wcm9qZWN0LmVjZGYveGVuLXBy
b2plY3QvcGVvcGxlL2RpbWFwcmtwNGsveGVuL0VDTEFJUl9ub3JtYWwvcnVsZV8yLjFfZ2ljdjNf
aXRzX2hvc3RfaGFzX2l0c192Mi9BUk02NC8xMTE0NDg1NDA5Mi9QUk9KRUNULmVjZDsvYnlfc2Vy
dmljZS5odG1sI3NlcnZpY2Uma2luZA0KDQpVbmZvcnR1bmF0ZWx5LCBJIG9ic2VydmVkICs2IG5l
dyB2aW9sYXRpb25zIHdpdGggdGhhdCBhZGRpdGlvbmFsIGNvbmZpZyANCiJDT05GSUdfVU5TVVBQ
T1JURUQ9eSIuDQoNCkkgZG9uJ3Qga25vdyBob3cgYW5kIHdoeSB0aGVzZSBFWFRSQV9YRU5fQ09O
RklHIHdlcmUgc2VsZWN0ZWQgaW4gdGhlIA0KZmlsZSAnYXV0b21hdGlvbi9naXRsYWItY2kvYW5h
bHl6ZS55YW1sJy4gQW5kIGFyZSB3ZSBhYmxlIHRvIGFkZCBuZXcgDQpjb25maWdzIGhlcmUgPy4u
Li4NCg0KU28sIEkgc2VlIHRoZSBuZXh0IHBsYW4gKGp1c3QgZnJvbSBteSBwb2ludCBvZiB2aWV3
KToNCjEuIEFkZCAiQ09ORklHX1VOU1VQUE9SVEVEPXkiIGFuZCByZXNvbHZlIG5ldyB2aW9sYXRp
b25zLg0KMi4gQ29udGludWUgd2l0aCBwcm9wb3NlZCBkZXZpYXRpb24NCjMuIC4uLiA/DQoNClRo
YW5rIHlvdSBpbiBhZHZhbmNlLg0KRG15dHJvLg0K

