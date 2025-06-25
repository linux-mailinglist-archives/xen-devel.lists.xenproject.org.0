Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B13AE7CB3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 11:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024532.1400390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMPe-0000zX-L1; Wed, 25 Jun 2025 09:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024532.1400390; Wed, 25 Jun 2025 09:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMPe-0000xw-Hj; Wed, 25 Jun 2025 09:27:26 +0000
Received: by outflank-mailman (input) for mailman id 1024532;
 Wed, 25 Jun 2025 09:27:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PEPZ=ZI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uUMPd-0000xq-Cy
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 09:27:25 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2413::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95ba6797-51a6-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 11:27:18 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH8PR12MB6721.namprd12.prod.outlook.com (2603:10b6:510:1cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 09:27:14 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Wed, 25 Jun 2025
 09:27:14 +0000
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
X-Inumbo-ID: 95ba6797-51a6-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akvj8ZDk1Nfq7fdc4Pv6I8WSJNZEO/OJZZHjOqN/tXhCa7jZWkvfLvedGL4bisrxqDAVPN6bpbFlI/84cWw6MuoK9HwdaPabDn/F39sjBh/YZOWZLoTuCm0zR72tHwtJRdrQSXvxZBjj13padVOdQefq/82vf8tun5JnAxZd5yN7/Lr7GrDiaREIrjQuzHOX1xrvJDsVrK1YlVCkua017AoND8z0toclj5XQIVNCODlruTwf7/q774CvgZQhbMydDKcFvVeaZsQQgz/uRH6Ea4jb9eDCSKyvV7skKmngyS1ZZIh9OIz9B28GmXu63ujHvS+hKH/QJk0Oer2sLJwBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfGqWPB5RHtMg4vAIjdmD6y/U1QN28cGjp7FvHZBi4E=;
 b=NX4IYP/v29VodyFSEb51QPBXk6d48h97z0m7xkC+a+B4Y90juivGMnYHXbs1he9xf1SvPZGT7ZB7Uwz6pdvISqk6njpC03L7oOJrCL2LN1VRvqyZMnBWYVIrn8V4boQ2GVFXBvbVLbwS4B5cf0AvYHfDjXuuPjfLT186oT4zhuS42QKWZFh4+DLU/ZFLHjVksPQqDYkJOuwmptggVZdylCLR72anJPNIgrfIk2H9vBJlFPUiviicArHq2TJYU6BOGZZfAQ3MwF0vFASfCqlWApsrzeKz8EPbsQFk9HYFBBiH9ciTSOTES+VJyfkSXhXzeaflVqCC7DQ7uRATwOFq0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfGqWPB5RHtMg4vAIjdmD6y/U1QN28cGjp7FvHZBi4E=;
 b=2cWp7oLaSMycZR+uVTHvlNWUsZznp2yl8mfqk+5Sq7x4i7roZfFf+MzL4iax/McNbI/4/K8qu9X13SSzzlxsx+LjAXbDnYTRoIvctJuo+C4YFNUdY7LtCEL/CaATCJLlj8m60pHq/1M0XfofRVXlgpWRc1DcP5a6SbOn85LeYIU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QI/QAAgAGa9QCAAQzVgIAG5D6A//99hgCAAJwoAP//hioAgAHew4D//5oCgAASTfCA
Date: Wed, 25 Jun 2025 09:27:13 +0000
Message-ID:
 <BL1PR12MB584988E00D0F4A4330B9B968E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <516a3adc-320d-46ce-b235-8ef91469abcf@suse.com>
 <BL1PR12MB5849F696814E17D20012BAC2E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <227df6d3-a2c3-4576-bde9-d8057c378e7a@suse.com>
 <BL1PR12MB5849C69BD1485B1B98F7D0FDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5c4b186e-686e-4fc8-bcf1-854bc1f5ec8b@suse.com>
 <BL1PR12MB5849DE8416FE549834235780E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <9d5d0e44-66c3-4e3f-8704-2c862c5f5aff@suse.com>
 <BL1PR12MB5849B3C334EF0C5BBCAFB7BAE77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3638e73c-2a83-4164-9a84-839245245727@suse.com>
In-Reply-To: <3638e73c-2a83-4164-9a84-839245245727@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH8PR12MB6721:EE_
x-ms-office365-filtering-correlation-id: dd6e413f-d1e4-47d6-afce-08ddb3ca7851
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N3pHdldVbVc3RVdNT3FZTUVHZmEzK1lieDNNbmREblkycjZKRldzc3ZGRktD?=
 =?utf-8?B?S0Z0QlhxQUI2a2NsZjVMM3BzYjZvYnZTQlNZOGg0enJFdWQ5OUNXZE0xbmty?=
 =?utf-8?B?bWR6MWVNTlQ3SnV0Ti92V2Z0N1VaU3VVWmtOb3M0ZFBMbVBiVFQ4VUgxRndK?=
 =?utf-8?B?UW94WDlGdlNwOEVoV1ZrTjdLU1prS0thZENLNTRqY092cDA4VmZ0ZXoxTWFj?=
 =?utf-8?B?cFpDeGFoRHd0MjhlcHRHWGVidDU4elpTbHFaUnNBUnpZTmFNL1hhRU56a2RR?=
 =?utf-8?B?TDVZWktyeGN1YTY5R08vYll6bk1YQ050SW5Fa010L2gvYVdyQ1hna25oWU5v?=
 =?utf-8?B?NjNkLzhCT1Nnbjd4NmltcnM0a1ZiMWhFL3BzY3g5eCtIYnRjZmhkbHZCRnFO?=
 =?utf-8?B?ZWV6dWFFeld1L0syVWMzYlMzdHordXNVZDNxcENLRzAyenZocVNVNnBhajRz?=
 =?utf-8?B?V2xVbFVaUytCejVwcDgveW4xMkNMOTdlRlVvdFFXWUhpWjFhdjc4dzNwZXJD?=
 =?utf-8?B?MnV6Q1R1M25hY2RSeExWMkVoRWRDUjdJSzJ1ejF5NmFjTTZyQU9pcnJ3TTVw?=
 =?utf-8?B?MUxtMXpCRGNtY3ZyVUFxZHRzWDVIMll6R3JXWTR1eWRqSzB5WUpmTzNlV0JB?=
 =?utf-8?B?ak52U0dyWmQ5d2lBM1U4RXRCbFdpaGpkK2FHdG0rVExQYmRzd0VMRkc5Wkd6?=
 =?utf-8?B?SHNITTRqKzM5S2h3RXMvVFNxdXM3R1JheTYwRVp3dzJHbEVFSHplWHR0YkMv?=
 =?utf-8?B?T0x6bXNNeVEyaHFwMEF3b0hXdXVhd0lNcWkrWktRNlphQVRVTWQwYVdLV1Ur?=
 =?utf-8?B?d3BMYnZEbGJuVU9TUnZDaG13UlBadHdvSWl5MS8vdkozS1dOT2JWelpGdXlQ?=
 =?utf-8?B?bVQxa0JpWS9pcWd2MmFLN0t3MlBBKzJzaVhSYjlITDIvbUQwVk1HUnR4N0Zn?=
 =?utf-8?B?dzFYeE9ScjBsaDVjKzVnY2l3ejBYQk5TNVZrQ1pyb0hJaEs0NjdvRGQ1dUhL?=
 =?utf-8?B?Nm9MdGpHcGpGVzdWM1dZMklLbmZDS0szNEN4OTgybHVQQllyU21GcXZhTU9T?=
 =?utf-8?B?R1g2OXhVdmk0bjNGcW1vQzhqUCtrSE56RFpjTWtOc1lOWnVwTnd3U0NiTXQr?=
 =?utf-8?B?SHdHM1FoeVhjeDJzZXJOUmRQYjZhS2VXNk96akNXbHUxNmd4MU9XUkpkMC9o?=
 =?utf-8?B?a0JyNFpuRTYzRzFVNTM5RW9hRXJuQnRqTzRXSHMxRDlRNFMraVE1VkdaMHQ5?=
 =?utf-8?B?UUREZUN0c3FJdDVETmRFWHFtK044cDNVMzMxVnpaRElmejRyMExyUzB4R1ZQ?=
 =?utf-8?B?WVJPNTNQdFJ3UURCaWdmYzcxYm16dVdxcTc3VXh1SkRQeStUcksyY3d6SVhF?=
 =?utf-8?B?VGMvR1EyVjN0d2owVWZCeW50S0xraDZtK1doL2I1aCtLU1U4eitWV3ZnK0s1?=
 =?utf-8?B?REc0MWZDQVFPOWVLQWlCUzY5b0VBcThkNklWcTZiSDlMWlVpaWZqYzFjUjdr?=
 =?utf-8?B?WFM1RG50WkQ1RWZGeHIySEJhMXlCNEZJaVQ5VG5wVVVDbmg5UktKOEJKNmg3?=
 =?utf-8?B?S0RLQWIycHB2eHFxVTNKUXdacEEvb0FGRFIvTUEzWWM0Nk1tYmhQaitBUUVW?=
 =?utf-8?B?SFgvMCtIY0dtTjNBeHdjR1ZUejRYSmt5a2U5TGw4UU1hbE4zRnFsb3dkTlJ6?=
 =?utf-8?B?S0F1RFY4OFU5M1BtUVMxd3FUS3VQMjBocTl0MHZHblhzbFd2QkNMam45enk5?=
 =?utf-8?B?UGdlUm9YcFNhd0NoU3ZGN2w1TXdUaWpIY1JPTk9lRkcvMmprK0VRbTVhRFZQ?=
 =?utf-8?B?YVFPV3ZjVi8wQmhpeHdPY2tkQVlkU3MycE5qQXZJREVvaWd4azdjSmhiSTdj?=
 =?utf-8?B?cFVNZGoxZ3JEQjdKQkxtYXE0dXJJd28vLzFPc1B0VTh3NDlhMlNiVHpPK0hG?=
 =?utf-8?B?VWx3bnRWV3lKZkZjOFVUNHRkSkhlc1ZCODVXbEg2dmJQL2tuN09lUzQ3Nlh4?=
 =?utf-8?Q?IhCXqzYdDNWsXAZkSQw5zswsOUeJig=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTViOU5NVndsWjNwNzVtallhYjlpdUF1Yjk4bmNJaXk1a2ZjeWxtbDZvQ1BI?=
 =?utf-8?B?OUZFdTZtYTBRNWVBc1A5MkR0RXM5MDFlOG5KVi8xcUxEWFF3dmg3WjF4Vm9O?=
 =?utf-8?B?ZWpYaURpbitFS2lTSVVscGgzb01jVnArQWJKbnlUUnB3d3IwVHdVN2twMEkx?=
 =?utf-8?B?N2Fqd0l1UjluNHVsdG1PaWlINWV3TWtEV0VrOUZlOVFnQUNLeERNeUdXRTBJ?=
 =?utf-8?B?SzRhbVZaV29oS0xQWVQzU3BMN01ZQmg0UERQRHR6S1lub3JibzVadGpvU1lZ?=
 =?utf-8?B?dFpRUWVVdUI0a0RGeWRKanYzNWhUYnE2d0h1aS9JS3JVam1rcU9BWFlyQU9U?=
 =?utf-8?B?Nkw2cVBoZmxCbks3K3lVZ1NXNzVZU0lHOXN6V05CVTRxTVRqR3FNc2M3VEVS?=
 =?utf-8?B?OWtMNVE4QU1HOEw2VzdKamd1WnFrNVdtQkFsMUlMTjdLQkRDd1VvNzkvc0xw?=
 =?utf-8?B?YWQ1OEt5azF2S0FKTEZEWGJmbE1kUU8zM1lYL2o1UmFwQnlFbi9UZ3J4MklQ?=
 =?utf-8?B?dzNHZklhSFhlK05lSXp1M2NXTStjRERJa1EvcjE2UlpSUU40RUlsTXdIUDBS?=
 =?utf-8?B?SXM1RWcwdlFWdEpSamY5SzFka0NaRCtlNnZvVE9qRnE1NzdDQytzNERhVTVk?=
 =?utf-8?B?UitUdWdnUjRRdE5ycmVraFY1cjFZakM3RG5FV2trSjUvVFFXYVpjQ3c0MG1z?=
 =?utf-8?B?NGRZUktYeW95SU5YYWlvdzFEVU5ucVBVU1VPUEs4RWNBK3RnWjNnSTY0R3Yy?=
 =?utf-8?B?eXMwZmVIeTdvWVZ3SWQwWWorbnBmR29nc3NEMktMVENXQ1I5VGZ5aU50U3N3?=
 =?utf-8?B?ZnEzeUhOMXpzUWhaQ1M4clZwQXFpc0s3elRiWU5PYzFyalI0SXZPYWZ3WjZH?=
 =?utf-8?B?M1J4Rmg0YmlTOWpSUk12aUZ0S2kyWUZpcFM5SHRXaURsTVd1TU52RjJlQmpW?=
 =?utf-8?B?Z1RERk9vcUpuY0FPdEVJcHBLaDRWZzBTSkxja2hZcVlES3d4VU5FNFpFcGdx?=
 =?utf-8?B?TlJBUHg3ZFNpVTJZdjI3RWtTckV3dThIRW1yQ2JidjhLSHhTeEFtbG5RdlZw?=
 =?utf-8?B?L0VDVzlNTVVaZkRONUlXQVhEMElPT1R6cXpVUWlsMmU5QmFLNXB1cDU4MXUx?=
 =?utf-8?B?cGMzMXB3RVEySno1anJ5bUwwTnVzZXBJWEVNR1pUNmcya1VHaVFxOGF3ZTdv?=
 =?utf-8?B?K094dWQ3NExrY3U2WjZXdndSdW5xUkhzd3pRNkNtRHlDa29ncVVZSUJwZ0hW?=
 =?utf-8?B?S2F5RkZQYzVDVkRTODl1MVBYalpvQWozNmdCeGJnQmlUNWFmdXp0TXpKNE1V?=
 =?utf-8?B?K3V3akxEclRQKzhWK0hnWmtzTGNBMDdLKzRXOUU2NDRGMHpFNDZueEdibUtI?=
 =?utf-8?B?dzI3TkpKckFVL0QxazZTV0pERktISzhLOUdZZ1c0REdqV01zWmJZSXJ1d0F5?=
 =?utf-8?B?cGROVytXSzdMY3pueHV2am9jUFBuZisvMGE3YjE0S3hwaFJQM1FvczYvL1RL?=
 =?utf-8?B?dzJWcGJCZFFPV0lJQzlOekFlWFZUS243SW1wazRSSy9RNFVFekdkWm9iRCs5?=
 =?utf-8?B?K3hRamdsVkZGSFd3Q0Z5K3R0T3RuK3QxUzBBaUh4K2FTV01nZjZ5bHlIYkNY?=
 =?utf-8?B?eklYSWJmbEd0R1JDejRlZXhsQStzVUk4bUF1aWJVL3JoZWNuaS9rRjBCaURl?=
 =?utf-8?B?dG01TWdYYzFaQjhLdW9rOFVPeHNNMGdGRVNzNjBpNVlGTnpGa2pLaHlSR3hB?=
 =?utf-8?B?dXphQ0tuUXJzTmNrY0pUeWVsdlNHeVZHdGRVWnlZWVFrbnZKOVJhRXVpSEF2?=
 =?utf-8?B?QkNKa3NlWG8xVVJMdkluMURHbVpuQlB0QzlPOXlkWDhWanZrZk4vNStWM21p?=
 =?utf-8?B?NjlUa29qVVFBUVMzR0d1Znh3V24reFJzczkxbWxzV09OTis5S0I5NEdkMDV5?=
 =?utf-8?B?VVhvUFFTb0VzaHRibWw2RXR1K09YTVB0SVlOTVRsTytiQ3djMGU2b0h6L3NU?=
 =?utf-8?B?cUxROVYyMDZXd3oxVDlFbHdLM2NSamlxVjFRUVpUUzQ3L1dnRm9LWSticzlY?=
 =?utf-8?B?cXorV2p0a1JYbWNzZU1ROWZUMkNGbFc1OXZ1MFNBU1RiV2luOWVjMUVNRnNS?=
 =?utf-8?Q?LVYk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <872E33BBEB810C489D2EEC92BD7BFEFA@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6e413f-d1e4-47d6-afce-08ddb3ca7851
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 09:27:13.9722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Cg/sElPb8/TU2TfWR9wY43EhLCkTXInP4cclLJuxMC3IZjPjuq8ZQF0I6GKBIg7vCxFEPqwlvHHVQ08M4+Nnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6721

T24gMjAyNS82LzI1IDE2OjM2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjUuMDYuMjAyNSAw
ODo1MSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzI0IDE4OjA4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyNC4wNi4yMDI1IDExOjI5LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8yNCAxNjowNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAy
NC4wNi4yMDI1IDEwOjAyLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNS82LzIw
IDE0OjM4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMTkuMDYuMjAyNSAwODozOSwg
Q2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMjAyNS82LzE4IDIyOjA1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+Pj4+PiBPbiAxMi4wNi4yMDI1IDExOjI5LCBKaXFpYW4gQ2hlbiB3
cm90ZToNCj4+Pj4+Pj4+Pj4gQEAgLTI5LDkgKzMwLDIyIEBAIHR5cGVkZWYgaW50IHZwY2lfcmVn
aXN0ZXJfaW5pdF90KHN0cnVjdCBwY2lfZGV2ICpkZXYpOw0KPj4+Pj4+Pj4+PiAgICovDQo+Pj4+
Pj4+Pj4+ICAjZGVmaW5lIFZQQ0lfTUFYX1ZJUlRfREVWICAgICAgIChQQ0lfU0xPVCh+MCkgKyAx
KQ0KPj4+Pj4+Pj4+PiAgDQo+Pj4+Pj4+Pj4+IC0jZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfSU5JVCh4
LCBwKSAgICAgICAgICAgICAgICBcDQo+Pj4+Pj4+Pj4+IC0gIHN0YXRpYyB2cGNpX3JlZ2lzdGVy
X2luaXRfdCAqY29uc3QgeCMjX2VudHJ5ICBcDQo+Pj4+Pj4+Pj4+IC0gICAgICAgICAgICAgICBf
X3VzZWRfc2VjdGlvbigiLmRhdGEudnBjaS4iIHApID0gKHgpDQo+Pj4+Pj4+Pj4+ICsjZGVmaW5l
IFJFR0lTVEVSX1ZQQ0lfQ0FQQUJJTElUWShjYXAsIGZpbml0LCBmY2xlYW4sIGV4dCkgXA0KPj4+
Pj4+Pj4+PiArICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCBmaW5pdCMjX3QgPSB7
IFwNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgLmlkID0gKGNhcCksIFwNCj4+Pj4+Pj4+Pj4gKyAgICAg
ICAgLmluaXQgPSAoZmluaXQpLCBcDQo+Pj4+Pj4+Pj4+ICsgICAgICAgIC5jbGVhbnVwID0gKGZj
bGVhbiksIFwNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgLmlzX2V4dCA9IChleHQpLCBcDQo+Pj4+Pj4+
Pj4+ICsgICAgfTsgXA0KPj4+Pj4+Pj4+PiArICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxp
dHlfdCAqY29uc3QgZmluaXQjI19lbnRyeSAgXA0KPj4+Pj4+Pj4+PiArICAgICAgICBfX3VzZWRf
c2VjdGlvbigiLmRhdGEucmVsLnJvLnZwY2kiKSA9ICZmaW5pdCMjX3QNCj4+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4+IENvdWxkIHlvdSByZW1pbmQgbWUgd2h5IHRoZSBleHRyYSBsZXZlbCBvZiBpbmRpcmVj
dGlvbiBpcyBuZWNlc3NhcnkgaGVyZT8NCj4+Pj4+Pj4+PiBUaGF0IGlzLCB3aHkgY2FuJ3QgLmRh
dGEucmVsLnJvLnZwY2kgYmUgYW4gYXJyYXkgb2YgdnBjaV9jYXBhYmlsaXR5X3Q/DQo+Pj4+Pj4+
PiBZb3UgbWVhbiBJIHNob3VsZCBjaGFuZ2UgdG8gYmU6DQo+Pj4+Pj4+PiAjZGVmaW5lIFJFR0lT
VEVSX1ZQQ0lfQ0FQQUJJTElUWShjYXAsIGZpbml0LCBmY2xlYW4sIGV4dCkgXA0KPj4+Pj4+Pj4g
ICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCBmaW5pdCMjX3QgXA0KPj4+Pj4+Pj4g
ICAgICAgICBfX3VzZWRfc2VjdGlvbigiLmRhdGEucmVsLnJvLnZwY2kiKSA9IHsgXA0KPj4+Pj4+
Pj4gICAgICAgICAuaWQgPSAoY2FwKSwgXA0KPj4+Pj4+Pj4gICAgICAgICAuaW5pdCA9IChmaW5p
dCksIFwNCj4+Pj4+Pj4+ICAgICAgICAgLmNsZWFudXAgPSAoZmNsZWFuKSwgXA0KPj4+Pj4+Pj4g
ICAgICAgICAuaXNfZXh0ID0gKGV4dCksIFwNCj4+Pj4+Pj4+ICAgICB9DQo+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4gUmlnaHQ/DQo+Pj4+Pj4+DQo+Pj4+Pj4+IFllcywgc3ViamVjdCB0byB0aGUgZWFybGll
ciBjb21tZW50cyBvbiB0aGUgaWRlbnRpZmllciBjaG9pY2UuDQo+Pj4+Pj4gR290IGl0Lg0KPj4+
Pj4+IE9uZSBtb3JlIHF1ZXN0aW9uLCBpZiBjaGFuZ2UgdG8gYmUgdGhhdCwgdGhlbiBob3cgc2hv
dWxkIEkgbW9kaWZ5IHRoZSBkZWZpbml0aW9uIG9mIFZQQ0lfQVJSQVk/DQo+Pj4+Pj4gSXMgUE9J
TlRFUl9BTElHTiBzdGlsbCByaWdodD8NCj4+Pj4+DQo+Pj4+PiBZZXMuIFRoZSBzdHJ1Y3QgZG9l
c24ndCByZXF1aXJlIGJpZ2dlciBhbGlnbm1lbnQgYWZhaWNzLiAoSW4gZmFjdCBpbiBwcmluY2lw
bGUNCj4+Pj4+IG5vIGFsaWdubWVudCBzaG91bGQgbmVlZCBzcGVjaWZ5aW5nIHRoZXJlLCBleGNl
cHQgdGhhdCB0aGlzIHdvdWxkIHJlcXVpcmUNCj4+Pj4+IGtlZXBpbmcgdGhlIHNlY3Rpb24gc2Vw
YXJhdGUgaW4gdGhlIGZpbmFsIGltYWdlLiBXaGljaCBJIGRvbid0IHRoaW5rIHdlIHdhbnQuKQ0K
Pj4+Pj4NCj4+Pj4+PiBTaW5jZSBJIGVuY291bnRlcmVkIGVycm9ycyB0aGF0IHRoZSB2YWx1ZXMg
b2YgX19zdGFydF92cGNpX2FycmF5IGFyZSBub3QgcmlnaHQgd2hlbiBJIHVzZSB0aGVtIGluIHZw
Y2lfaW5pdF9jYXBhYmlsaXRpZXMoKS4NCj4+Pj4+DQo+Pj4+PiBEZXRhaWxzIHBsZWFzZS4NCj4+
Pj4gQWZ0ZXIgY2hhbmdpbmcgX19zdGFydF92cGNpX2FycmF5IHRvIGJlIHZwY2lfY2FwYWJpbGl0
eV90IGFycmF5LCBjb2RlcyB3aWxsIGJlIChtYXliZSBJIG1vZGlmaWVkIHdyb25nIHNvbWV3aGVy
ZSk6DQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hl
bi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+IGluZGV4IGM1MWJiYjhhYmIxOS4uOWYyZjQzOGI0
ZmRkIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4+PiArKysg
Yi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4+PiBAQCAtMzYsOCArMzYsOCBAQCBzdHJ1Y3Qg
dnBjaV9yZWdpc3RlciB7DQo+Pj4+ICB9Ow0KPj4+Pg0KPj4+PiAgI2lmZGVmIF9fWEVOX18NCj4+
Pj4gLWV4dGVybiBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCAqY29uc3QgX19zdGFydF92cGNpX2Fy
cmF5W107DQo+Pj4+IC1leHRlcm4gY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgKmNvbnN0IF9fZW5k
X3ZwY2lfYXJyYXlbXTsNCj4+Pj4gK2V4dGVybiB2cGNpX2NhcGFiaWxpdHlfdCBfX3N0YXJ0X3Zw
Y2lfYXJyYXlbXTsNCj4+Pj4gK2V4dGVybiB2cGNpX2NhcGFiaWxpdHlfdCBfX2VuZF92cGNpX2Fy
cmF5W107DQo+Pj4NCj4+PiBKdXN0IGZ5aTogWW91IGxvc3QgY29uc3QgaGVyZS4NCj4+Pg0KPj4+
PiBAQCAtMjU1LDcgKzI1NSw3IEBAIHN0YXRpYyBpbnQgdnBjaV9pbml0X2NhcGFiaWxpdGllcyhz
dHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gIHsNCj4+Pj4gICAgICBmb3IgKCB1bnNpZ25lZCBp
bnQgaSA9IDA7IGkgPCBOVU1fVlBDSV9JTklUOyBpKysgKQ0KPj4+PiAgICAgIHsNCj4+Pj4gLSAg
ICAgICAgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgKmNhcGFiaWxpdHkgPSBfX3N0YXJ0X3ZwY2lf
YXJyYXlbaV07DQo+Pj4+ICsgICAgICAgIGNvbnN0IHZwY2lfY2FwYWJpbGl0eV90ICpjYXBhYmls
aXR5ID0gJl9fc3RhcnRfdnBjaV9hcnJheVtpXTsNCj4+Pj4gICAgICAgICAgY29uc3QgdW5zaWdu
ZWQgaW50IGNhcCA9IGNhcGFiaWxpdHktPmlkOw0KPj4+PiAgICAgICAgICBjb25zdCBib29sIGlz
X2V4dCA9IGNhcGFiaWxpdHktPmlzX2V4dDsNCj4+Pj4gICAgICAgICAgaW50IHJjOw0KPj4+PiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3ZwY2kuaCBiL3hlbi9pbmNsdWRlL3hlbi92cGNp
LmgNCj4+Pj4gaW5kZXggZjRlYzFjMjU5MjJkLi43Nzc1MGRkNDEzMWEgMTAwNjQ0DQo+Pj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3Zw
Y2kuaA0KPj4+PiBAQCAtMzEsMTQgKzMxLDEzIEBAIHR5cGVkZWYgc3RydWN0IHsNCj4+Pj4gICNk
ZWZpbmUgVlBDSV9NQVhfVklSVF9ERVYgICAgICAgKFBDSV9TTE9UKH4wKSArIDEpDQo+Pj4+DQo+
Pj4+ICAjZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfQ0FQQUJJTElUWShjYXAsIGZpbml0LCBmY2xlYW4s
IGV4dCkgXA0KPj4+PiAtICAgIHN0YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCBmaW5pdCMj
X3QgPSB7IFwNCj4+Pj4gKyAgICBzdGF0aWMgdnBjaV9jYXBhYmlsaXR5X3QgZmluaXQjI19lbnRy
eSBcDQo+Pj4+ICsgICAgICAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS5yZWwucm8udnBjaSIpID0g
eyBcDQo+Pj4+ICAgICAgICAgIC5pZCA9IChjYXApLCBcDQo+Pj4+ICAgICAgICAgIC5pbml0ID0g
KGZpbml0KSwgXA0KPj4+PiAgICAgICAgICAuY2xlYW51cCA9IChmY2xlYW4pLCBcDQo+Pj4+ICAg
ICAgICAgIC5pc19leHQgPSAoZXh0KSwgXA0KPj4+PiAtICAgIH07IFwNCj4+Pj4gLSAgICBzdGF0
aWMgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3QgKmNvbnN0IGZpbml0IyNfZW50cnkgIFwNCj4+Pj4g
LSAgICAgICAgX191c2VkX3NlY3Rpb24oIi5kYXRhLnJlbC5yby52cGNpIikgPSAmZmluaXQjI190
DQo+Pj4+ICsgICAgfQ0KPj4+Pg0KPj4+PiAgI2RlZmluZSBSRUdJU1RFUl9WUENJX0NBUChjYXAs
IGZpbml0LCBmY2xlYW4pIFwNCj4+Pj4gICAgICBSRUdJU1RFUl9WUENJX0NBUEFCSUxJVFkoY2Fw
LCBmaW5pdCwgZmNsZWFuLCBmYWxzZSkNCj4+Pj4NCj4+Pj4gSSBwcmludCB0aGUgdmFsdWUgb2Yg
TlVNX1ZQQ0lfSU5JVCwgaXQgaXMgYSBzdHJhbmdlIG51bWJlciAoNjE0ODkxNDY5MTIzNjUxNzIw
OSkuDQo+Pj4NCj4+PiBXaGF0IGFyZSB0aGUgYWRkcmVzc2VzIG9mIHRoZSB0d28gc3ltYm9scyBf
X3N0YXJ0X3ZwY2lfYXJyYXkgYW5kIF9fZW5kX3ZwY2lfYXJyYXk/DQo+PiBfX2VuZF92cGNpX2Fy
cmF5IGlzIDB4ZmZmZjgyZDA0MDQyNTFiOA0KPj4gX19zdGFydF92cGNpX2FycmF5IGlzIDB4ZmZm
ZjgyZDA0MDQyNTE2MA0KPj4gTlVNX1ZQQ0lfSU5JVCBpcyAweDU1NTU1NTU1NTU1NTU1NTkNCj4+
IHNpemVvZih2cGNpX2NhcGFiaWxpdHlfdCkgaXMgMHgxOA0KPiANCj4gT2gsIG9mIGNvdXJzZSAt
IHRoZXJlJ3MgYSBwc0FCSSBwZWN1bGlhcml0eSB0aGF0IHlvdSBydW4gaW50byBoZXJlOiBBZ2dy
ZWdhdGVzDQo+IGxhcmdlciB0aGFuIDggYnl0ZXMgYXJlIHJlcXVpcmVkIHRvIGhhdmUgMTYtYnl0
ZSBhbGlnbm1lbnQuIEhlbmNlIHdoaWxlDQo+IHNpemVvZigpID09IDB4MTggYW5kIF9fYWxpZ25v
ZigpID09IDgsIHRoZSBzZWN0aW9uIGNvbnRyaWJ1dGlvbnMgc3RpbGwgYXJlDQo+IGFjY29tcGFu
aWVkIGJ5ICIuYWxpZ24gMTYiLCBhbmQgdGh1cyByZXNwZWN0aXZlIHBhZGRpbmcgaXMgaW5zZXJ0
ZWQgYnkNCj4gYXNzZW1ibGVyIGFuZCBsaW5rZXIuIElPVyB5b3UgZW5kIHVwIHdpdGggdHdvIDMy
LWJ5dGUgZW50cmllcyBhbmQgYSB0cmFpbGluZw0KPiAyNC1ieXRlIG9uZS4gVGhlIGVhc2llc3Qg
KGFuZCBsZWFzdCBwcm9ibGVtYXRpYyBnb2luZyBmb3J3YXJkKSBhcHByb2FjaCB0bw0KPiBkZWFs
IHdpdGggdGhhdCBpcyBwcm9iYWJseSBnb2luZyB0byBiZSB0byBhZGQgX19hbGlnbmVkKDE2KSB0
byB0aGUgc3RydWN0DQo+IGRlY2wuIChXaGV0aGVyIHRvIGxpbWl0IHRoaXMgdG8ganVzdCB4ODYg
SSdtIG5vdCBzdXJlOiBXaGlsZSBvdGhlciBwc0FCSS1zIG1heQ0KPiBiZSBkaWZmZXJlbnQgaW4g
dGhpcyByZWdhcmQsIHdlIG1heSB3YW50IHRvIGJlIG9uIHRoZSBzYWZlIHNpZGUuKQ0KVGhhbmtz
IGZvciB5b3UgZGV0YWlsZWQgZXhwbGFuYXRpb24uDQpJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5
LCBJIG5lZWQgdG8gY2hhbmdlIHRoZSBkZWZpbml0aW9uIG9mIHZwY2lfY2FwYWJpbGl0eV90IHRv
IGJlOg0KDQp0eXBlZGVmIHN0cnVjdCB7DQogICAgdW5zaWduZWQgaW50IGlkOw0KICAgIGJvb2wg
aXNfZXh0Ow0KICAgIGludCAoKiBpbml0KShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQog
ICAgaW50ICgqIGNsZWFudXApKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCn0NCiNpZmRl
ZiBDT05GSUdfWDg2DQpfX2FsaWduZWQoMTYpDQojZW5kaWYNCnZwY2lfY2FwYWJpbGl0eV90Ow0K
DQo+IA0KPiBIb3dldmVyLCB0aGVyZSBsb29rcyB0byBiZSBhbm90aGVyIChnY2MpIGFub21hbHk6
IEJ5IGRlZmF1bHQsIGhhbGYtd2F5IHJlY2VudA0KPiBnY2MgYWxpZ25zIHRoaXMga2luZCBvZiBv
YmplY3QgZXZlbiB0byAzMi1ieXRlIGJvdW5kYXJpZXMsIGR1ZSB0byBkZWZhdWx0aW5nDQo+IHRv
IC1tYWxpZ24tZGF0YT1jb21wYXQuIFdlIHdpbGwgd2FudCB0byBjb25zaWRlciB0byB1c2UgLW1h
bGlnbi1kYXRhPWFiaQ0KPiBpbnN0ZWFkIChzdXBwb3J0ZWQgYnkgZ2NjNSBhbmQgbmV3ZXIpLiBJ
J20gaW4gdGhlIHByb2Nlc3Mgb2YgcHJlcGFyaW5nIGEgcGF0Y2gNCj4gdG8gcHJvcG9zZSB0aGlz
IG1vcmUgZm9ybWFsbHkuDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4g
Q2hlbi4NCg==

