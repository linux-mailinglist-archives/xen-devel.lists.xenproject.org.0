Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C220EB3F607
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 08:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105698.1456551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utKw8-0002w4-T2; Tue, 02 Sep 2025 06:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105698.1456551; Tue, 02 Sep 2025 06:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utKw8-0002ts-QS; Tue, 02 Sep 2025 06:56:12 +0000
Received: by outflank-mailman (input) for mailman id 1105698;
 Tue, 02 Sep 2025 06:56:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V/Ey=3N=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utKw6-0002tl-QY
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 06:56:10 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e64c3fac-87c9-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 08:56:07 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AM7PR03MB6660.eurprd03.prod.outlook.com (2603:10a6:20b:1c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 06:56:04 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 06:56:04 +0000
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
X-Inumbo-ID: e64c3fac-87c9-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/muRC0qsBWt0YjJz7RjPAAEEO4YNRcoU7PGOawaom3l9fWpNs9lAscj8iaM5DhTqTKIki89XqGYmDkLigumHCKNNSsYDYt6cCsLRx5bQEH0A/oqlgS4brFcBdY307k2T3YoektBJ3NRWRkNfCswt9q6A083FGQ2b9hKTuL77crJtcDeGW9hG/mydxuReo28NY/OLIeQUQQOgVSoXsOU3hOJ0LZXEEEg0DTvjJyhNcMkr1FSXQNqAYhMY2IFmt1Uzy70DOLXst7HCkkHGBPVvV0k3F5uZ/hKaspjDLWuc0KSGqEInNdLXe/T5ie1aPJd0v1v+tnTuPw7jpzru/2yfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQ4wlDO2THQCpCtYA09thsa4uK1n5VuFcpGOJhtXlCQ=;
 b=U2T6Dr5vnp2+7Qi5DVdwE/ce3ZncF4M41SxNT3HE/TFOE3Cx/IbcZ1gMlCM4QiF7AiZPfK/T1Nrx6iW+bqIe8d/kP7yJblZ66B3+jyoL899BUFmIR6rXVAGkXwFOu3kMyZPpZHLfoihgrME/fQYLnoDPykEFZqpmtXKNcveFWiMSuJhZmjJyA5EqlaMYzNA0kWYAIxJ+kg1Qn2KMZH9ATGKmhTt1upgQ39FLeru9Zq+IELA0nJatxs0dbnRImXw2fTA1TKZK0xU0JioKfpoCl2LPhkLhIanAQ6rLonz82BIDcHDMwMX628mEy+JElIcGIVxPleKeD4qZdfjlF8DQ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ4wlDO2THQCpCtYA09thsa4uK1n5VuFcpGOJhtXlCQ=;
 b=jlX6zLUnU2GoYix76Mf+AI3JPb6oaLySneIBdloBAumm4OqC1sBClYIt/q8c/nsrpmuJfdrArXZGG/YiHhjwn3TzPRaT0tvxXI+C81Ba+1kROHNE53s300+4dHP0pnrwBF0suTkAS8lEeA24B4fh7pgr19KCeNg93xr0RuiEMV9+a50ceNeIX/9nU/kLD+lkVVTFwj9M9AdMQS2mTs00Em+WBJze3VcPJPUe6W+65K6wgUuWZGJxpdiU4kYIcI32iDGbQQoLmLsRYuWW7Vlr27cUt2BOyyyzS2zWpIjGb98YwdWMQLcRU31UwGaP7D8eiVz4LdKpg2Zj3dQ+MptTbw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v5 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v5 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcGP7bBiDA5fxWR0+DupelLQbe97R8z4uAgAGbqoCAABpjAIAA9bWA
Date: Tue, 2 Sep 2025 06:56:04 +0000
Message-ID: <ed2c1ebb-36c6-4818-8d85-34d5ad6cd8a0@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <e0f76a1533332cef68bfaacbdf57fd05f27764a6.1756481577.git.leonid_komarianskyi@epam.com>
 <87tt1pykqz.fsf@epam.com> <c21ff32a-fc9d-4980-8d26-a3d6c1f2548c@gmail.com>
 <399bdb41-7938-4ed3-887a-c9bf6e0636ec@epam.com>
 <14f057e5-eb1e-4d10-87f9-98619fc30eb1@xen.org>
In-Reply-To: <14f057e5-eb1e-4d10-87f9-98619fc30eb1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AM7PR03MB6660:EE_
x-ms-office365-filtering-correlation-id: c605dd8e-82e4-4225-fd6b-08dde9edc8e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q09yMHNXelZEbU04K0ZsS05WVEZUUTF4MUVpYjNWVU1DMHJuK2x2N0YxSi8z?=
 =?utf-8?B?MFl1NmZRblp1ejhkSDRhWmJjWnU4cWtCOHRvc3pFRUsvekpjRDdQell5UEYy?=
 =?utf-8?B?a21makJURFhwUlZlR2tORlRQYVhSWjdjNDJYVy9JR29QU3V3WUplOWZuN2lN?=
 =?utf-8?B?cXEyWDRWVXZENEQ5RjRJN05hWGFvQXFTVlJuNnJXbzZleExVQityanJ4bEgz?=
 =?utf-8?B?N1poZ0dFbHRxdVJJb0hYaUE5eDFRMkV6aGJuREcxS2hCcGNqcGo5Vm9NQmhR?=
 =?utf-8?B?V0IveG1yWmtWQXIxZTNSR0NNNmZIeDN5STJIa2pBWlNTRlV5MCsraFNveWg4?=
 =?utf-8?B?bS80aDN6aVQwb1h3SW43cjlMS3JWaVBySkU5dTNPMXdHYzQ4bkVoZWhiYWJx?=
 =?utf-8?B?TFppeFpCb3pPNlB4MU1JWlVXMUpqRmJKV3RwcVBXTDA2MjVhV25tVDZvakJq?=
 =?utf-8?B?SDRhaHR6dTYzdGpYUGQ5cE00dG94SWVWMDVkTlAwSlpvSVRoODBqR29ZYkpq?=
 =?utf-8?B?UWNLN3UyTGVNOVlwNVgyMXVSZUg2L2dOai8wZGdHdFJTanFNUmo0dkhBdUZF?=
 =?utf-8?B?UnhsbzlyVkVKbUhSMEtmSWd3YThWQ2IzQUllM285bE82cDYzTVlDamljR2pG?=
 =?utf-8?B?SFVINTRseVpCN04xNmU3cEJEbjErZ2tvbUVtcFE4SjZvMHBsZDIwUkRma3hM?=
 =?utf-8?B?RnBJTE9YUVZCVlAvZmRPSVlVU1ZUY2dKSnVST09yU28rbVVaMHFFL3A5Rkoz?=
 =?utf-8?B?R0RrR2RPVHVkK29SQjdUajBHRXMzSHJuWjBHUUlCRzBrM3F1WEU5L1UxTExS?=
 =?utf-8?B?eHd5RzB1dlNzK1ZXcjlWNkhSZXR4c3FhcExuUHgvVWQ2OXJTVHE3K0djSWpj?=
 =?utf-8?B?cW5KSzg0djE2VU5xYTZNVmo1bUtDeVd3Q2RvT2VVbW5iZXJ2dDg5Ukh5Ynl3?=
 =?utf-8?B?dlQremVUWHNKSWk3eEtLVzk3SFZlb0JVS2FQZzZrWDBnclM1RElvUzNnc1da?=
 =?utf-8?B?c2cwQUhsY3grVG5WcXlDejVFaXpWRERGeC9Id2c2ODQ3SWF0L0N3NXJjeEty?=
 =?utf-8?B?K1BDK2lzMlVvMU1RdGdycXFRMGZxZWNCZHpIK2k1V1NBOVN5SEVIL3BJODBu?=
 =?utf-8?B?RFVZU0tyYS9ERWVaOFZKMFN6WWFSNU51UW8rZ0ZnQzV4QTg4MnRKeDRVTVor?=
 =?utf-8?B?eUVjNW9zQ2Y1Z2xkK05vVFhyTklFS3ZYRWtNQVlXSnpWNU0rWGhaVUYvbC9n?=
 =?utf-8?B?TWVqUlhlb0VIR1JCRC9IczNxVGEzQXFGM3ZkOGlFeHNaaDZrYUtvdEg0ZHZm?=
 =?utf-8?B?QXJ5cWNuQ29KMmg3QlpUQ1dybXhxckp3RW8wa1NGRjZVWXVCeTZ4aWhJTFN0?=
 =?utf-8?B?cStIOEU0YlJ6Q1JxaW5DOWJ1UkdlWk84NDdLVFcrSmNhZG5qMkQyNXNMN0xJ?=
 =?utf-8?B?ZTRZUkQ3SWx4RkRBUzM0OE02NVNuZEV6VXg0OXl5UVlHd2Q1MUQ5UE91VENJ?=
 =?utf-8?B?S3B6dk1XcWxjMmZ0dGJEUmJSSHFhb052K2pFSGlRK1dFTHg4R0ttQTJpSG04?=
 =?utf-8?B?Y3NpU2lLQlo1ektDa2dza3liKzhSdkFVWXVjd0YxbzlDd0k1NlE5UVVCUCtO?=
 =?utf-8?B?NEJGSWV3UXdCaE5NUWxYKzJ5QXVjSW5MZk1LU3U5Wk9LUjQ4T3JyaG52WVVU?=
 =?utf-8?B?WUJXZEo5ZmEwdDVROEZGQVZNSU9Yd3dyTEJxcXZReUo2TG9tR1dnbVB3Vndv?=
 =?utf-8?B?Tm9CYnlHWHRFR3g5bmM4UStDOG1NMk9EL05JWmJiYVN5TXFYN3ZScHNvVk41?=
 =?utf-8?B?UkRZTXhHV1ZJanU5OVB1NkpnZTZ5NENDTlBPOVMvRDFnZzFyZk9pYVh6RU9m?=
 =?utf-8?B?VERuNE01OHR1SEVkWHJyYkdMREJMSG43MHBhQjZ4NnRTSGxUTm1NWUY2Q1Ez?=
 =?utf-8?B?WEM4TWNqM3Jya3N1clZkM3QxZHJHcVlac2VtOTRNVG1DaW1mbUpLMUtEbnU4?=
 =?utf-8?B?ZnhIb0N2djV3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEFMUUFERlpabjY2ZWNYaVIrbTRZeW1xclZZNWszckFFQ3NKN1dDL0Z1QzFx?=
 =?utf-8?B?U1dYTndyNktTb25pRDZPdXhybzNoNUc4YmMyNzA1Q0RiRE1KM0dyNjZLUUIx?=
 =?utf-8?B?cEdwZjd3YXJoQS9wTGpnTXhxU1RLNCtIQmZ0MnI3d3FwSjlwdW9MR3A0VTdM?=
 =?utf-8?B?aExtTjdBb2ZqL1lhd1V6cTVCSlo4aFBnSVNYUDNjQk4vVjhaaGdXWXlSZVg4?=
 =?utf-8?B?SHkyQ3loOU9ldzliN1hGVzBmdWVhSXZVZFVxSEhXM0JrM2M5djlCR3I4a3pt?=
 =?utf-8?B?MVhqbWRrZUZIdDN2NUtTWTh6RHhreTgxVnFjN0pMNXZLczJwbDRMVUpoUFNk?=
 =?utf-8?B?bFFkckFrZ3UrcVdXcFE4TW4xS09mWkNxSHFxdllvTldGRWc0bm0zZjZEaUtT?=
 =?utf-8?B?UVJ0THFhdVlVVnFlOCtpbHU3VGdleWI4V3d4Q0NLenNpK3F6Q3N6UC9HaUx4?=
 =?utf-8?B?UlV1VVZaNlBLUmZ0d3RKYUdKL2ordUtFSFcybUwzQkZCUFpvaC9BUmFPQTJr?=
 =?utf-8?B?STd1N1djRGttSThqK3pMZnh6V3k1Q2wyZjhwM0k5TkptM0NmdnIxekdCMXJN?=
 =?utf-8?B?YnAzampRM2hSTXBkdkV2VFVKcGh5R3NnY1BhbGYzUWc5dUFZRXFQOTYvWkND?=
 =?utf-8?B?V1ZaWFZGbjJsK0M1U0piay9VN25tUFI2Tzd1ZXJCbDJNbEVLamxwZmxCMWwy?=
 =?utf-8?B?cFRjdFdibFdYa2ZwSGJwSDFCUGhBKzJHQXptWkxscDFPMnRNN2tPRkh6NHpK?=
 =?utf-8?B?RHVlMkR3ZGlMblp1d3lqYnNzT2U1eW5IaXViYTZ1Mk1ja21hTHVkZ0lxMU9Y?=
 =?utf-8?B?VGNPeHUxRWZRYXZpdGYxY1htRGx1MGVKbGdmbUU3K2JrNmRxVncxekpSQ2ZI?=
 =?utf-8?B?VWU0d3VHWURxZmU4TDJuUE5PM0wxK3RiR053ZG55R2RqbkhEdW8zODJ2d1cr?=
 =?utf-8?B?S1dKcnpjUHBTOFZNc2dsTG9URlJNQjMvVXdTYXRJdUVKT01XY2RuZVNsakRW?=
 =?utf-8?B?T1BIZjU4Sm9ESmxiNHdBOFNZd2FaQ2xJNWp3Zk4vMlAzOExEYlR3U1ZaRnZO?=
 =?utf-8?B?bGY3T2VWc1lIMFllNmVrZWdrMTFTdjZNU0ptaE5oQTNGV01SS1Z2QkRqaC9t?=
 =?utf-8?B?dEl4Z1BZSnpuYUJzMHJxOC9RQWhPc0NRMnFmVmNlNnRrT3h1cnZnVVZWL3lZ?=
 =?utf-8?B?WUo2WEZyWW5iTkVmZE1jbWxQYVZvVGdQVDVEdGk2WHI4U0duOTFJTkRXbjFM?=
 =?utf-8?B?ei9jK3cyOVM1SDMwVnNzTVdLNmRZcnNjRVVhbWRVaEtvTWs3ZXBoSFFnMGxP?=
 =?utf-8?B?S2dyV3JMeSsyUVY1dlcwOUZKMHg5b1FiQmluU2d2LzQzdkY3ZUZqMGJ3alVP?=
 =?utf-8?B?WFRCWVFFM0dlUjZjK3ViUWVBSjVzcGx6bWdKZ2NNcXZhQVIzRHJVaklKM2V4?=
 =?utf-8?B?ZVY1MkRVcFVwNUpLSWZYUVBzcjdSV2pEUktxZWpUWGhzYlZWWWcxQjFnY05G?=
 =?utf-8?B?MHpPSFN4anFaM3hyVEo1K2JSdXMyU0dFc3FaK2Y5aC9hMGpWVnNQQlRkLzZk?=
 =?utf-8?B?TEJ1NTlXdjNyVHF6ZTFmbVYxdzBISVlUYjBTeGRwakptamlrSkE3WXMxd1dz?=
 =?utf-8?B?WnBxUXEydHJGY29XYlR1OWJCTGNETlNvT0lvUjBKTkl0dDR1Zkt4aXZkeGlY?=
 =?utf-8?B?cHdYUEliekpZdys0L1g3TFVVZ1pudkh2d1MyK3d0T2pSdzE5T0ZOc3lqQ2R1?=
 =?utf-8?B?ZERDZTJhcE9TZjdOckd6ZWp0KzRVK2pwdW1qaWpVQnFQb1pPNHo1WDhjeTBq?=
 =?utf-8?B?bUN2VHZhSzBwVStnQ2ZTdnpFeURQVWV6SlhoMTBVMFFYMlVkY2dDMzVOTVhO?=
 =?utf-8?B?eFlYVXdNb1pPODN2VGpRNlBRd1QreW1HRjRSclltelUxQy9JVzZwa0k0bm1I?=
 =?utf-8?B?VVhET1dzekVkTFAxZGthdFZlRytnckUzaTFEbFpJZkVpcWVPblN6MkZrMzNa?=
 =?utf-8?B?QzRUTXBzSXBtbU9remVGSk5KbjFSQ0NrN0tDVTBoUTRNVWpMdS9CeTcwWDRu?=
 =?utf-8?B?K0JZTXVHa01EZk9MTjhvRGlIazJkc3g0ckdtSGpxMThja3NaaXFyY2p6T3d6?=
 =?utf-8?B?alFYMS9ITTBqQnlxYmlpcGlwTnp4WU5wbDJ1VGFoWFRPZHRwdHJLalhNcTlB?=
 =?utf-8?Q?AGBok2aL1OKS9lcXFsdGul0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9875E6D730E34D4EAB957C9CCEBAB0DD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c605dd8e-82e4-4225-fd6b-08dde9edc8e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 06:56:04.2992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mAEeFbU6hE4nmm1jPifkvEcIeHMDLopDS7T2Kazxtm2mHARRHRGY7SuojloKDKImTZMOaTEalCK0CGqJ8yKTqxTWY5f4d/xxe3ZQAt7PWNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6660

SGVsbG8gSnVsaWVuLCBWb2xvZHlteXIgYW5kIE9sZWtzYW5kciwNCg0KT24gMDEuMDkuMjUgMTk6
MTYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBPbiAwMS8wOS8yMDI1IDE1OjQy
LCBMZW9uaWQgS29tYXJpYW5za3lpIHdyb3RlOg0KPj4+PiBUYWtpbmcgaW50byBhY2NvdW50IHRo
YXQgd2l0aCBDT05GSUdfR0lDVjNfRVNQST1uIHdlIHNob3VsZCBuZXZlciBoYXZlDQo+Pj4+ICJp
cnEiIGluIGVTUEkgcmFuZ2UsIGRvIHlvdSByZWFsbHkgbmVlZCB0aGlzICNpZmRlZj8gSSB0aGlu
ayB0aGF0DQo+Pj4+IEFTU0VSVF9VTlJFQUNIQUJMRSBpbiBlc3BpX3RvX2Rlc2MoKSBpcyBzdWZm
aWNpZW50IGd1YXJkLg0KPj4+Pg0KPj4+PiBBbHNvLCBJUlEgbGluZSBudW1iZXIgYmVsb25ncyB0
byBlU1BJIHJhbmdlIHJlZ2FyZGxlc3Mgb2YNCj4+Pj4gQ09ORklHX0dJQ1YzX0VTUEksDQo+Pj4+
IHZhbHVlLCBzbyBpbiBteSBvcGluaW9uIGlzX2VzcGkoKSBzaG91bGQgYWx3YXlzIHJldHVybiBj
b3JyZWN0IHZhbHVlIA0KPj4+PiBmb3INCj4+Pj4gYSBnaXZlbiAiaXJxIi4NCj4+Pg0KPj4+IMKg
IMKgLi4uIEkgYWdyZWUgd2l0aCBWb2xvZHlteXIncyBzdWdnZXN0aW9uIGZvciBpc19lc3BpKCkg
dG8gYWx3YXlzIA0KPj4+IHJldHVybg0KPj4+IGNvcnJlY3QgdmFsdWUgZm9yIGEgZ2l2ZW4gImly
cSIuDQo+Pj4NCj4+Pg0KPj4NCj4+IEkgd2lsbCBmaXggdGhhdCBpbiBWNi4NCj4gDQo+IEkgYW0g
bm90IHN1cmUgYWJvdXQgdGhpcy4gSWYgaXNfZXNwaSgpIGlzIG5vdCByZXR1cm5pbmcgZmFsc2Ug
d2l0aCANCj4gQ09ORklHX0dJQ1YzX0VQU0ksIHRoZW4gdGhlIGNvbXBpbGVyIHdvdWxkIG5vdCBi
ZSBhYmxlIHRvIG9wdGltaXplIGNvZGUgDQo+IGxpa2U6DQo+IA0KPiBpZiAoaXNfZXNwaSguLi4p
KSB7DQo+ICDCoMKgIHJldHVybiBlc3BpX3RvX2Rlc2MoaXJxKTsNCj4gfQ0KPiANCj4gcmV0dXJu
ICZpcnFfZGVzY1tpcnEtTlJfTE9DQUxfSVJRU107DQo+IA0KPiBpcnFfdG9fZGVzYygpIGlzIGNh
bGxlZCBmYWlybHkgb2Z0ZW4sIHNvIEkgd291bGQgbGlrZSB0byBrZWVwIHRoZSBjb2RlIA0KPiBm
YWlybHkgb3B0aW1pemVkLiBBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byB1c2UgI2lmZGVmIENP
TkZJR18qLiBJIA0KPiBkb24ndCBsaWtlIGl0LCBidXQgaXQgY291bGQgYmUgYSBjb21wcm9taXNl
IGlmIE9sZWtzYW5kciBhbmQgVm9sb2R5bXlyIA0KPiB3YW50cyB0byBwdXNoIHRvIHJlbW92ZSAj
aWZkZWYgZnJvbSBDT05GSUdfSVNfRVNQSS4NCj4gDQo+IENoZWVycywNCj4gDQoNCkkgYW0ganVz
dCB0aGlua2luZyBhYm91dCBhIHBvc3NpYmxlIGNvbXByb21pc2UgYmV0d2VlbiB3cml0aW5nIGxv
Z2ljYWwgDQpjb2RlIHdoZXJlIHRoZSBmdW5jdGlvbiBuYW1lIHJlZmxlY3RzIGl0cyBhY3R1YWwg
ZnVuY3Rpb25hbGl0eSBhbmQgDQphbGxvd2luZyBmb3IgY29tcGlsZXIgb3B0aW1pemF0aW9uLiBQ
ZXJoYXBzIGl0IHdvdWxkIGJlIGJldHRlciB0byBrZWVwIA0KdGhlICNpZmRlZiBidXQgcmVuYW1l
IHRoZSBmdW5jdGlvbiB0byBgaXNfdmFsaWRfZXNwaSgpYCBvciBzb21ldGhpbmcgDQpzaW1pbGFy
Lg0KDQpJbiB0aGF0IGNhc2UsIEkgdGhpbmsgdGhlcmUgd291bGQgYmUgbGVzcyBjb25mdXNpb24s
IGFzIGl0IHNlZW1zIA0KcmVhc29uYWJsZSBmb3IgYSBmdW5jdGlvbiB3aXRoIHN1Y2ggYSBuYW1l
IHRvIHJldHVybiBmYWxzZSB3aGVuIA0KQ09ORklHX0dJQ1YzX0VTUEk9biwgYW5kIGFsc28gdGhl
IGNvbXBpbGVyIHdvdWxkIGJlIGFibGUgdG8gb3B0aW1pemUgdGhlIA0KY29kZS4NCg0KV2hhdCBk
byB5b3UgdGhpbmsgYWJvdXQgdGhpcyBhcHByb2FjaD8NCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlk
DQo=

