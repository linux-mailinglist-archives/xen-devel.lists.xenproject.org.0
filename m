Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26383B454BA
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 12:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111645.1460277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTfa-0004h0-8l; Fri, 05 Sep 2025 10:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111645.1460277; Fri, 05 Sep 2025 10:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuTfa-0004fO-5p; Fri, 05 Sep 2025 10:27:50 +0000
Received: by outflank-mailman (input) for mailman id 1111645;
 Fri, 05 Sep 2025 10:27:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bvvL=3Q=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuTfY-0004ek-A3
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 10:27:48 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f533653a-8a42-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 12:27:43 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AM9PR03MB7217.eurprd03.prod.outlook.com (2603:10a6:20b:26d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 10:27:41 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 10:27:41 +0000
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
X-Inumbo-ID: f533653a-8a42-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZbEINSlfnAJR2A8TlseX7rD0GrcvF63FPJ/c58KrW0TqoIL0ksg4Ezwa6X2JpO7/rSHWnldmjRkpVuvPO74I6aKwq47zH/CRsWqHv5dki3KsQ0rr/6v7RMdNI7KHgVNESraTeSERrrAh13AbsOAtBnJ818FtIqaVwD9Aq4BpvliMGHQoCUzqchPhhXeIzFGi1iv9HsUo0Rku+0O0mmIwjLRvjDSzZVsNG+kp+N4NaF5GfAmFm5O0AG5oU+PioP9JqBYYALgomO9qV1DUdII2zrDHVA/6jIXXzo21agE5BAdZrtOQICkry2zkQD6UkHvKBob1578fObp4AVE986BDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyaXlZlue/VSvNKKuFYSywkqSORzXhWatkdZNX0Rm1A=;
 b=Bz+G6QWjzRtGv/bQam+5w0WLk0Md5HOi+zQN849J742A64RxgLXyP8ZRxnX6nsqoZRc2WlgUZXulUClbjiBiVVEfRTFdPAgS1Xo+DO4Mza/o5ZPw1cDb86B2p1y5guUGQDCRwVj1hYjwVI3yXq8kfK0Q7IK4jL5iaHf7llnTP2ByvkWw1VrmJIGt+GIYxFhvLacjxbeBktSvGf3Fs4xnf15mnV88KuFx226yqs1ntr7lwyR62G49R8QHY0vnFinl9MY27NVI+4u4DiGCqSedxrAwgpW0v+QzXOUpdbsq8nxoR260RKvOEHkq8nhM7whHqFexsLdzB8ZwSJSONTxaPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyaXlZlue/VSvNKKuFYSywkqSORzXhWatkdZNX0Rm1A=;
 b=m6OCxWC+kBghuQXwV8EWoBmt06ZmeZpwXyikmKFmrV3j7UXwc7lSp/vakSPdThHHxwQRXXeJwu8/06KbeGu2JJ+RxnN1Q2F0VooPWRMhQpLgNgJxqxvjOowQQlyOUeYDZE7UzZU4GNiLq5l7ADszK/e0mIdCyLZydSk/mNJ2LOvc/8NzQJiKtPVrXEOcilTMXHTHddS1TC1Y6BVXxBvZlbcERKnkHBn0z0NtG20g+rzatuqqSC8OXy7re4NrO4xfCfOL/zVgh4dd9V10nl9NcdCxoI5TAQPukX4Q0P6JyFYoXSJGlnhY3h7G6QeWydheiGtnRY3GLSk1KZRm/lk42Q==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: Re: [PATCH v7 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Topic: [PATCH v7 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Thread-Index: AQHcHdazISYJ96ARO0ihPlIvp7RWE7SEMBaAgAAzpgA=
Date: Fri, 5 Sep 2025 10:27:41 +0000
Message-ID: <0843182f-2299-4942-b8f3-339b1f13db6f@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
 <bdb8b10babad3434347f7ee934e9ac18353653c9.1757015865.git.leonid_komarianskyi@epam.com>
 <820704d0-4047-4f02-a058-01daba2765f1@xen.org>
In-Reply-To: <820704d0-4047-4f02-a058-01daba2765f1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AM9PR03MB7217:EE_
x-ms-office365-filtering-correlation-id: 25b7685d-1c47-4175-c501-08ddec66d804
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NXBzTENqVTdCdFFHdHZpL2hoTHBkSHdYaG03WjJhSzROaXFzbkNyUGVwWk92?=
 =?utf-8?B?RElZckwrODJpN0xZN3hnanl2Umh3M2RkRElYbXZsUFRESGVweHdNbEFqZXhC?=
 =?utf-8?B?WDRLZzZnZGtnUklsTmpoUGpQM0xxZGxhZGZaZk9uVU5QN0RtSXovMlJYaENF?=
 =?utf-8?B?akN4WmJySEQwQVJDT3h6OVpVcnhuc1pZTlJ4dXB2S3pnRTJCdjU3YnU0Unha?=
 =?utf-8?B?YUNCSE5hZ0FrZkhpRHpISXVXaEo2TEVpN0xudm53SFlqU2FDalc5MnJ6ZTlj?=
 =?utf-8?B?OWlGQXZpbVF5WGpHckNNWWpmOHVOSlBGcmhxRmdXZ25zdVZkYWtsckVOU1BK?=
 =?utf-8?B?SW9Ea2VaMDFlNXlaSmhkSHlhSW1ONmVrcGNwcThlMEZEQnl2UTZNdHEyRWZZ?=
 =?utf-8?B?QUtSV2haNHIvRFFMc3M5cXFCSGpjRjZuZ1UwRk9veEhFVURZNnBoNXB5NDRj?=
 =?utf-8?B?L2MwcWQwUXUrd0JSc3JWN2hmaytMUnQyaE9PUW1uQkFub1ovWkNYVUc0a3pa?=
 =?utf-8?B?OTF2cmR5U0tOL2ZOaHZwcUZBQUU0em9pdm82c2ZNZUV4cUhjNUJySVJGTU1V?=
 =?utf-8?B?RzVQNEZIdVUwOHRuUGQ5SGowenFWUWNGdzZONjFPdEg5SWY3M0xXUldDMDhG?=
 =?utf-8?B?a2VINVhuTmlzWnVIY1lHVVVabjltaW02dG9JbStmWmJ4RURWKzVQR01hVUZs?=
 =?utf-8?B?RXN6YmxaclZ0YVJ3akRKMWpkQW1MSlMzZnJFN09Lcys0Z2F1M3dWejBycWRM?=
 =?utf-8?B?Vm05dzZvWmhhTjMzdUMwVkdiSlE3MWVKME1SNzVTWkFzaGZGSlJJRW13M21T?=
 =?utf-8?B?SWdMZ2lDdWRva2hLMmRzSWoxK0RzaW5pSC9nOCt3L0pPa3FJMTZCNFNreUsy?=
 =?utf-8?B?M1RKOXl3eWVtNWlWT09rbVJkbjRrcERXd2hRT2ZXRGozTHdYSytueko2L0Q0?=
 =?utf-8?B?SVAveHVmRHBTZVlCQUxENlR3dGIrYU1NclNFRWR2b1ZGMUJWNUtYMyt5UjRU?=
 =?utf-8?B?Q294UDJuUDEyclhEZWRqY0ZCNDJYTVBHVERscmVhOGxVLzhEb0FUTk9BNnNH?=
 =?utf-8?B?MndJZTFvbERRK2Q5UlRGUVlxNFpQblFNdzIxRVF2U2lOeDVVeUNlMkc0WjRh?=
 =?utf-8?B?SGk0cDZ3azBJTm0wUGVjSHBPWjEzMy9wYzVjZ2szay83dk1yT3lQamhXZSt0?=
 =?utf-8?B?ZzBVSjN5bmhwTE0wcXJuelhIUWVoY243cWo0cUJnTTdVc1ZTd2tPNC80QlhK?=
 =?utf-8?B?eWlpVTM5ZUNieFIzcUxLVEcwdTZOSC85MTBKT2RUUTV4b0srbmRZa2J1c1JD?=
 =?utf-8?B?MWRIbVRhNDU0TEp1T0V2VjVRVUZ5Z3N2R3BQa3c5bEprOEszWWxIZ0IzQmhY?=
 =?utf-8?B?S2ltZHU4Ky9yMXVlYnF2Z096R1VxTGMwOXN4V2dUQ0I0TW5jeU4zOUNtMkw3?=
 =?utf-8?B?bTVzbnR3RkZiVGxVSTBHMzlRdmxoTm9JaUR1VDJ2cVRTcFJWN1Raa25jRUw0?=
 =?utf-8?B?K010VjU3VWVwYTJDbWxWVzNxWDE1ZXFUVDRmSWJFZVR0M0s5NklEcGhTODF0?=
 =?utf-8?B?amtkcU4wZ0FmY05oWXNhV1k3YVdtNW1URVhoVHdWZGFXRG5KSWhQek9QWmFB?=
 =?utf-8?B?M3RUQmZ1bHlaQU5jMEl2Z0ptVE8vTEhCUzVqL3JlWkdUejgwbSsvRG00bHFO?=
 =?utf-8?B?cEhLUXJSczFYZTRselZaWmFyNWNPWForbjZVZGhEMUF0RHVlL2lHTFRiTHM0?=
 =?utf-8?B?RGRVNmhDQVBGQmVYMFFGTGZCcWtPTll5Z1ZkdkRielIrRnlhZFVrb0tCeXNW?=
 =?utf-8?B?UEFBTHNUKzhLUmM2dmsxYmtSTU1RRkp2ZlpKd2dVdmYvdnkrZWU2ZXpqdG5n?=
 =?utf-8?B?NUZ0bTQzYVBtb0w4RklRelJOUUVsYkl3bnJmMlIyNWpBTEg3cXFnYUNZTlhE?=
 =?utf-8?B?SXkyVG53UFltL2RuaENyZXVLaWJiUDNqMmtBaXNOVXBWZlMwTUEvaEVsVkh5?=
 =?utf-8?B?TUJKN3NDeDRRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHBlVHVibEhlcWtCNzZFa0lzSkpzQXZ0TEUwRkt4dUYrOFpkMkRXRTZkc1Z4?=
 =?utf-8?B?eVozeWw1LzRHMURmRkl1UUxHd3Y3RU9CSHlSQzRnOWdNMXZ3WllxUkR1NWJz?=
 =?utf-8?B?dkNQMzZIU3dBdmw0RlUrLy8wQjhoZTBuUXAvZW53anNNNVVJejYrNkRDWnNT?=
 =?utf-8?B?MU1sQW9kc216dTNiczllVDlwZk9DM2RtWjR3RUQrb0tZN2tPeVJLTVRQcEtT?=
 =?utf-8?B?b3NMYWtyQVBRbEhEOUVIN2tKeWF3TllxQ2VZMzVwd1dGSjVvMjNlLzlkblFy?=
 =?utf-8?B?TE1GcUVwaXBqbUhJYmpvVUdLczViUlUvVnJQQ2dYYllBcUJsMjRJcjRBMk9y?=
 =?utf-8?B?VzFnU09PdktGSVN4NUNTS05hYWV6L0ZmSUFGb0VkUW5SWWpLTlNTeDdYREVs?=
 =?utf-8?B?cWtVNUtHRThQOU1iT0lmaFphS2kyaXFNZjgwUDZZZE9qSS9XcGFBa0hqMmd5?=
 =?utf-8?B?OWVmVS9qaDI1ampucVJvQUttVEYzN01nS1lFQnhpRmxCUG41dTNpSlJackRo?=
 =?utf-8?B?VnByWThiN1NMVUdlY1NBRjhreTF1em01a3hma3lheDM1by8wZzJWNnFLcVNt?=
 =?utf-8?B?UGJzRVlkZmVaY05HY2ZsSUk1QmpPZWRLdUhJVm13bWZNUGFQKy9xNHl0cXJ2?=
 =?utf-8?B?eWRYWXEzbDlsVjZRR3FWTGJ4YXp2MmxjcVVuMkpTREVWZGp4YlA2L2NmL01s?=
 =?utf-8?B?ZmxFQjNYc3A4OENqNVVxUHNTSHl0SXdMTmRHRkpuajhUOWJBdWVDdzhDa0Y3?=
 =?utf-8?B?VDJyaXZpakhrR0dUVXZrdUNmYlgrZUZqT3ZxclhYYjJNK1BqMG9vTnI2MWFx?=
 =?utf-8?B?a1hpbGpQQllCWEdKWGNQRURBZWF5YXJTd2EwbFBVZ2ZGcExjaXJBaUVncjhY?=
 =?utf-8?B?ZG5uZlMwZFRvVFMvTDhJeElXSkQxcEpLdXkveVYrbEtBSXJSNU5rMSt4aUhJ?=
 =?utf-8?B?UUlJMTZjYTNGaTdZejZBY1F4eFRhSDQxMitPd0oyaituNGsyRjZlTGc3ZHZ0?=
 =?utf-8?B?MFh6QnVkeDZaZzlYRTY2WFlXR2FyUWxBeTFKcDhsZTJKUTNDRDF6SmlNd254?=
 =?utf-8?B?RVpRWGJvdTdkQTFlUmwvcnZZMXBMVGlUVUx4bG5WRlhQdmFDYnhnUTRqVU1u?=
 =?utf-8?B?VHgybVZOTlNDL25kUXF2R3FqM29lK1M5cVpmRWhTd2R0L3N5QmxFVFdpdkdL?=
 =?utf-8?B?UkFrV0JEUzRDUFhKeHJMenBZOWVCSnNXNnU3QUE2ODlvcnpIRW1Eb0F4RU43?=
 =?utf-8?B?czdWU0FzYWtlWWxOQlo1QkRlOVNiRmdTQUNHVG9CSHhUU3JTWGV2VmVQZmk0?=
 =?utf-8?B?VVpSaDBqdEVHOFlCOGR2Mi9QQkhSYzVXamhyaXFRc0k3a2xyaW5kUG9Oa3JC?=
 =?utf-8?B?L1lzRVl1R3RzSWIvRWVsTmMrb3VRSi9qU2tNNVFxZ1lBWkNFZENqMlpQUjVV?=
 =?utf-8?B?bHF2KzBVSUNFRTM1OUoycHAvYmJ0VXR5c0NocXBNeHJRWDZtRHZ4UFZYUjE3?=
 =?utf-8?B?cEd3dXFZSmlPem5wU244cmRpbnp4VXYxS25zSkNqYWhTUkIyZmk1Vk91Mkw4?=
 =?utf-8?B?SVRpdWNnb1pUbzN1N0g1YkdaZUhHOWlQa0N1WWxhRktEd3pSUFBFUW5PaGlK?=
 =?utf-8?B?YU92eUNaYU41dU1zMnp1T3JsM0N2ZHkwc3NMVGVCa1cwaWVDcjFtMkxRY1Zy?=
 =?utf-8?B?cE5hZzc3NWtlc2lXVmMzOTl6MCtKMnVuK3E5bHY0bkNPbS9pSWFkQUtyTEdR?=
 =?utf-8?B?TWcvSXpOQXpWV3RGanJ6ODhFQ1hHR3lxV2hnZU9MVGZvZ3BRWDJuYWs2MzUw?=
 =?utf-8?B?WWc0cGMvSTIrVHk4ZmM3Y2ZaNjh3VGM4UEU0TVNocVpTSUFKRGVOVzNNeitD?=
 =?utf-8?B?RFhjVkdPNUhWUFA1RW42ZCtSOFVvK2J1YXRGSWQzQzVJVUdGdWl2dHgwNzAr?=
 =?utf-8?B?OS81TFBSVTZRMmd0S1hzUVRhc2JxVmRQVFVlOU9Ec3lvdVUxRXptTDRSU0VW?=
 =?utf-8?B?eDM4Z2FpR3FWVzgrWWJsVWVJVlFDWVQ4TEY1eERSajBnYnpzUWphZFFOTGx4?=
 =?utf-8?B?ZWNRQTFyQkNOU1JFaTVISE83NmQreDFFVFI0QlFJS2xidFZ6STl1MStIc2tu?=
 =?utf-8?B?aDFQRkFQeWxYK0RQUElMeUhKTFRFSTNETmJrL29wL2pIdXl3bFFBZEF0YURD?=
 =?utf-8?Q?okTAeazcvpOYIXgXFNCuDp4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45812AF33532C54E8A7D5D4D399596F2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b7685d-1c47-4175-c501-08ddec66d804
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 10:27:41.1201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xKV1JlmG0f/ZI2rWHU3dRT4ckUZiozu+YrvIYHbejBj7sVg1N7Jam31rU5WkKZ6jaKWYhnrp0pZN3VcWAOyF4+lx3kVB9NSdjk5vfGW0/eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7217

SGkgSnVsaWVuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMgYW5kIEFCLg0KDQpPbiAw
NS4wOS4yNSAxMDoyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBMZW9uaWQsDQo+IA0KPiBP
biAwNC8wOS8yMDI1IDIxOjAxLCBMZW9uaWQgS29tYXJpYW5za3lpIHdyb3RlOg0KPj4gKyNpZmRl
ZiBDT05GSUdfR0lDVjNfRVNQSQ0KPj4gK3Vuc2lnbmVkIGludCBnaWNfbnVtYmVyX2VzcGlzKHZv
aWQpDQo+PiArew0KPj4gK8KgwqDCoCByZXR1cm4gZ2ljX2h3X29wcy0+aW5mby0+bnJfZXNwaTsN
Cj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgX19pbml0IGdpY3YzX2Rpc3RfZXNwaV9jb21t
b25faW5pdCh1aW50MzJfdCB0eXBlKQ0KPj4gK3sNCj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGVz
cGlfbnIsIGk7DQo+PiArDQo+PiArwqDCoMKgIGVzcGlfbnIgPSBtaW4oMTAyNFUsIEdJQ0RfVFlQ
RVJfRVNQSVNfTlVNKHR5cGUpKTsNCj4+ICvCoMKgwqAgZ2ljdjNfaW5mby5ucl9lc3BpID0gZXNw
aV9ucjsNCj4+ICvCoMKgwqAgLyogVGhlIEdJQyBIVyBkb2Vzbid0IHN1cHBvcnQgZVNQSSwgc28g
d2UgY2FuIGxlYXZlIGZyb20gaGVyZSAqLw0KPj4gK8KgwqDCoCBpZiAoIGdpY3YzX2luZm8ubnJf
ZXNwaSA9PSAwICkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+PiArDQo+PiArwqDCoMKg
IHByaW50aygiR0lDdjM6ICVkIGVTUEkgbGluZXNcbiIsIGdpY3YzX2luZm8ubnJfZXNwaSk7DQo+
IA0KPiBTdHlsZTogbnJfZXNwaSBpcyB1bnNpZ25lZC4gU28gaXQgc2hvdWxkIGJlICV1LiBDYW4g
YmUgZml4ZWQgb24gY29tbWl0IA0KPiBpZiB0aGVyZSBpcyBub3RoaW5nIGVsc2UgbWFqb3IgdG8g
Y2hhbmdlLg0KPiANCj4+ICsNCj4+ICvCoMKgwqAgLyogVGhlIGNvbmZpZ3VyYXRpb24gZm9yIGVT
UElzIGlzIHNpbWlsYXIgdG8gdGhhdCBmb3IgcmVndWxhciANCj4+IFNQSXMgKi8NCj4+ICvCoMKg
wqAgZm9yICggaSA9IDA7IGkgPCBlc3BpX25yOyBpICs9IDE2ICkNCj4+ICvCoMKgwqDCoMKgwqDC
oCB3cml0ZWxfcmVsYXhlZCgwLCBHSUNEICsgR0lDRF9JQ0ZHUm5FICsgKGkgLyAxNikgKiA0KTsN
Cj4+ICsNCj4+ICvCoMKgwqAgZm9yICggaSA9IDA7IGkgPCBlc3BpX25yOyBpICs9IDQgKQ0KPj4g
K8KgwqDCoMKgwqDCoMKgIHdyaXRlbF9yZWxheGVkKEdJQ19QUklfSVJRX0FMTCwNCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHSUNEICsgR0lDRF9JUFJJ
T1JJVFlSbkUgKyAoaSAvIDQpICogNCk7DQo+PiArDQo+PiArwqDCoMKgIGZvciAoIGkgPSAwOyBp
IDwgZXNwaV9ucjsgaSArPSAzMiApDQo+PiArwqDCoMKgIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCB3
cml0ZWxfcmVsYXhlZChHRU5NQVNLKDMxLCAwKSwgR0lDRCArIEdJQ0RfSUNFTkFCTEVSbkUgKyAo
aSAvIA0KPj4gMzIpICogNCk7DQo+IA0KPiBTb3JyeSBJIG9ubHkgc3BvdHRlZCBub3cuDQo+IA0K
PiBUaGUgZ29hbCBvZiBnaWN2M19kaXN0X2VzcGlfY29tbW9uX2luaXQoKSBpcyB0byBtYWtlIHN1
cmUgdGhlIEdJQyBpcyBpbiANCj4gYSBzYW5lIHN0YXRlIGZvciBYZW4gKHRoZSBwcmV2aW91cyBP
UyBvciBmaXJtd2FyZSBtYXkgaGF2ZSBsZWZ0IHNvbWUgDQo+IHN0YXRlKS4gTm93IHRoZSBmaXJt
d2FyZSBtYXkgZGVjaWRlIHRvIHVzZSBlU1BJIGJ1dCBub3QgWGVuIChlLmcuIA0KPiBiZWNhdXNl
IENPTkZJR19FU1BJPW4pLg0KPiANCj4gVGhpcyB3b3VsZCBtZWFucyB3ZSBtYXkgaGF2ZSBlU1BJ
IGludGVycnVwdHMgdGhhdCBtYXkgYmUgZW5hYmxlZCBhbmQgDQo+IHBlbmRpbmcuIFNvIGFzIHNv
b24gYXMgd2UgcmUtZW5hYmxlIHRoZSBHSUMgd2UgbWF5IHJlY2VpdmUgaW50ZXJydXB0cyB3ZSAN
Cj4gY2FuJ3QgaGFuZGxlLiBTbyBJIHRoaW5rIHdlIG1heSBuZWVkIHRvIGluaXRpYWxpemUgdGhl
IGVTUEkgcGFydCBvZiB0aGUgDQo+IGRpc3RyaWJ1dG9yIHVuY29uZGl0aW9uYWxseS4gV2hhdCBk
byB5b3UgdGhpbms/DQo+IA0KPiANCj4gVGhpcyBjb3VsZCBiZSBoYW5kbGVkIGFzIGEgZm9sbG93
LXVwIGJ1dCB3aXRoaW4gdGhlIHRpbWVmcmFtZSBvZiBYZW4gDQo+IDQuMjEuIFNvIGZvciB0aGlz
IHBhdGNoOg0KPiANCj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBDaGVlcnMsDQo+IA0KDQpZZXMsIHRoYXQncyBhIHJlYWxseSBnb29kIHBvaW50IGFi
b3V0IGZpcm13YXJlIGluaXRpYWxpemF0aW9uIC0gSSBkaWQgDQpub3QgdGhpbmsgYWJvdXQgdGhh
dC4gSW4gdGhhdCBjYXNlLCB3ZSBqdXN0IG5lZWQgdG8gbW92ZSB0aGUgbnJfZXNwaSANCmZpZWxk
IG91dCBvZiB0aGUgaWZkZWYsIHJlbW92ZSB0aGUgc3R1YnMgZm9yIA0KZ2ljdjNfZGlzdF9lc3Bp
X2NvbW1vbl9pbml0KCkgYW5kIGdpY3YzX2Rpc3RfZXNwaV9pbml0X2FmZigpLCBhbmQgcmVtb3Zl
IA0KdGhlIGlmZGVmIGZvciB0aGVzZSBmdW5jdGlvbnMuIFRoZSB2ZXJpZmljYXRpb25zIGF0IHRo
ZSBiZWdpbm5pbmcgb2YgDQpnaWN2M19kaXN0X2VzcGlfY29tbW9uX2luaXQoKSBzaG91bGQgd29y
ayBjb3JyZWN0bHksIHNpbXBseSByZXR1cm5pbmcgMCANCm9uIHBsYXRmb3JtcyB3aXRob3V0IGVT
UEkuDQoNCkkgd2lsbCBwcmVwYXJlIGEgZm9sbG93LXVwIHBhdGNoIGZvciB0aGlzLg0KDQpCZXN0
IHJlZ2FyZHMsDQpMZW9uaWQNCg==

