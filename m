Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1657EA982B2
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 10:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964125.1354992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VIA-0000Ns-PL; Wed, 23 Apr 2025 08:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964125.1354992; Wed, 23 Apr 2025 08:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7VIA-0000LE-LF; Wed, 23 Apr 2025 08:17:14 +0000
Received: by outflank-mailman (input) for mailman id 964125;
 Wed, 23 Apr 2025 08:17:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EGKH=XJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u7VI9-0000CF-5N
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 08:17:13 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2408::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b6228cf-201b-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 10:17:11 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL4PR12MB9479.namprd12.prod.outlook.com (2603:10b6:208:58e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 08:17:08 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 08:17:08 +0000
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
X-Inumbo-ID: 5b6228cf-201b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zmi75cgcunx8tH4YlpWvAQuDLfgZdaJ7GWGmh1hjJyboe8GkGqn4tx+70XvIg8qIN0WyCkcSmTnPWb2p1RJRH3LO+YsmN6XGKvEa9E8mO9xTJk64dKfctBetHTJ5YOa0XFosUPkP85M/t9akGFw0wL7jjGQLXl20l4YvQQMnmqOVHWyOzhUoU5mmtFN0esntZnGIpK5eb7qrPkH6HOio7g+yQLg70H3/EzPXxdTSlYEjNHrRn+OEX8dn7WZTZLVMlH5DLZXDbXVJWC3sE6f54idcKRxacavmuUPbjDz+6i7clDnJHV+IPA+aJouh3IsVV/p85kKevBSezOR2+GdJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nc+F3V30HICtJD+fuKis/vLS5LOsD92yUD9H9X9QZOA=;
 b=AWyeseuSJn/dUcbQTUdwBNhfgYNiL8mlIlUuFa/foVbVPdnon7MR59jGG5sctYP1tCoWRKSN33PEUCazlh2cYgfDEfYI4GQmB9SKdokxird0eQDtCVnLFdFYhOFJNRWeTX+Mw5kUz+/7KoTH497oHDqlFBrkzus6jEpCQl3VyHcQ/iybk6INDwbUCOaoYORYNX2Nux2aCJZ9/IJCeRDX09wjyqVv85C69iQ/Yo9s0x2HwMbD4Ri2tO+9hWDZjB3QXahzjxW0uyhjt7G/Ae1QCMFJB1Mz9cUt/YnMXLRCTYp+aYorAyNA4PCoScAgqzVwpK5PhqZ9T/RKC7yLpYdijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nc+F3V30HICtJD+fuKis/vLS5LOsD92yUD9H9X9QZOA=;
 b=fM0qedW5rpjXXDWEND7qv4Mh9o/3b3IhpCKjk59DbzwfG5z3TSS0gq+60uEKl1pVyfHDLuTLZSAsdkAnz00wBEBLQV9LSev89QVqUpR++YLSHn62Kzk3lDmR9LSjDS/Bly4Tr9kjiv3cz2S9DJN5JI5HCqnfohBD9hwn9uS7EjU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 05/11] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v3 05/11] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index: AQHbsoVaTdJd8UN3wUOnIdqQLAHMILOv2xuAgAFJegD//7tXgIAAj7oA
Date: Wed, 23 Apr 2025 08:17:08 +0000
Message-ID:
 <BL1PR12MB584987E44701DDF8AA6152DFE7BA2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-6-Jiqian.Chen@amd.com>
 <545079b5-7159-4f47-8100-df387fffe57a@suse.com>
 <PH7PR12MB585404EEEC765754A3DE458FE7BA2@PH7PR12MB5854.namprd12.prod.outlook.com>
 <04289258-7316-4c07-96a3-b74a0089e861@suse.com>
In-Reply-To: <04289258-7316-4c07-96a3-b74a0089e861@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8678.021)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL4PR12MB9479:EE_
x-ms-office365-filtering-correlation-id: be322a1e-0fca-4893-98d9-08dd823f3d91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RWFlcEhVMkJWUll1a0FGMkxmaENMVmJDQVpCMnVyYU9PdFlNWTdUNHBIYVl1?=
 =?utf-8?B?LzVGdVlmM3pGNnB5N0U3Wm5kY1JJcG1ROVVwOXZESEwzdTIrMlRDOWc4ZHZC?=
 =?utf-8?B?Zjc4Qy9rc0VHQkhDRWRZQVdHSGU4NnpaTFlNajAwMmFCYkZFVUJTSE1qSk1U?=
 =?utf-8?B?RmVjVGVsR3N6elZHUThzS1VPZFVqN01tOTNWMGI3a0cxNDNTalAxaXVmNHhz?=
 =?utf-8?B?eTVEMHp2UzlZVDJnVVQ0WHdva1ZEZmIvdlAxZW1xL0lVUUt0N01LMSs4dXU2?=
 =?utf-8?B?ZUE3V0phRXNGbWZDWkw5blVYMTVMLzR5em94Z0lFMFMyY1J4cFMxbFJwa1JP?=
 =?utf-8?B?eUhKTGlWdWhDZkhMamZlN3Y3S1ByNmJSakdlMHgyMGE3WmEyVm9vUTU5SDlz?=
 =?utf-8?B?TjQzdVV6ZDR1Sy9NSjdhK1plYXRaUGQraXY0T3NOWTN2MmRrU0JIQlNjeHBR?=
 =?utf-8?B?OEFIc0lkRlpxVDdZS3ZBRmFpeW5DMXluVGhMVHZNbFNPZlE1VXg2MjdGSUdU?=
 =?utf-8?B?RVZYMW5oODhpdWg1YThzeVp6aUUvNmxmelVxWGNiWjFYZW9yZ2hlY1d6SU9T?=
 =?utf-8?B?azRFM2VUMGpnaGE5RjgzL1REWU9naFp6ejVsQyt3VlVYMzA2RXV4Sm9ORWVY?=
 =?utf-8?B?c2hyQmFGeUNZN250OTk0bkEwclUzd0VmSUdTZmMrdDlhdGxMRE9iVDZTUzFI?=
 =?utf-8?B?b3JFTEhwdm1NdUxjRmN5amNGV0paMUlVd25uVlhFbHFKVnZDV2RSTnpscG85?=
 =?utf-8?B?cWtDWDFUVzBPQkt6RXZ2K3J1SkR2eUJ3R2w0eTFhWW9yaG1jZ2s2dnZET0Fs?=
 =?utf-8?B?Q0NVMmdGTzZCOTlIRi8zeXpaRTN6VmlRZWxUamhLN2lGMkFZcGd2K2RWTlA0?=
 =?utf-8?B?VHdmZjdxM0h0R3Z6WGFlTWNESkgxaXFaKzhteE96SUpYSFhyWTVGZ2xvand2?=
 =?utf-8?B?QysyRkh1d0VObmpaSzlJdmpPUWNiUWQzbElDV0JtazhEVzVoWWMrc2t5bnpZ?=
 =?utf-8?B?RDdjVzAyZW9jOUMxVHBUQUFGY3liVHBCeFhLSC9RaEJPMTlVV1VRaXhVOVRT?=
 =?utf-8?B?OGhvQ0hwcXNSbWd1TW9UUFVXb1J4bjBJL2I4aTYrb0dHZDc2VENhL2V6TVRz?=
 =?utf-8?B?ekFzSk9wdy9ISE1CU1g2ZWhIUTdjVHZwTWpUaklqL3BwT3ZaMFdvd3FTbFBJ?=
 =?utf-8?B?TE5NbjcvQ09vTWk2bE5GN2pBbGN5eGVsNkQ2dmRJblNsVmFRUnRuZDhNaklN?=
 =?utf-8?B?QU0vVFJRY1FpaXAxcTcwYjdTQ0hrdUJxaEd6SnA3dmszWkFtWE9MUjgvMUxO?=
 =?utf-8?B?SExKbjhsMi8wanFHVWNkcjU0OWZ2aFJWNDhZditLT25WK0tUL3A1TkM2QUh6?=
 =?utf-8?B?bm1OKzViZXNDOElVSEpPZFJmaHVybnVMOEJrRzN3NXNkWVRvK2x2NmgxL2Rs?=
 =?utf-8?B?NE82OENmOXVMdDJ2OEJRMlU3UjVOeGxHaWxNSlplc2xqZDBvUnMva3JKRlNq?=
 =?utf-8?B?NHUxMU9VRUlIVXlCQWVWN0RvclBCU0FjZmR6Mi9CeVZYak9zbm9mRVlMeUhh?=
 =?utf-8?B?bVJFVUtvM1ZFNGM4WEJLU0RURENDamhuU2J6Smp2a2dXWk90VndlUlFJYXVZ?=
 =?utf-8?B?THpwYmZTaTN3bjlqUkxQdVpQUzVUNnVoUGZkRDdqYVkxZm9IckcrUFRPdFFV?=
 =?utf-8?B?TTkxUFRpRUxqbEJCdVNuUytxb1RxSnRzdjFMVVhqd1BvaHlWc2x3aUtBUVdP?=
 =?utf-8?B?SGVodE4zeVMvOG83L3hXTWRoWjg5aUVJREZnQTEvb01WY1k0NzIvd1ppeXRE?=
 =?utf-8?B?Zmh4dDVYNDQzVldaR1FhK2lFaURsZm8xektHck01N3RrYzdCeG1obTBrSG5R?=
 =?utf-8?B?UWV2L0VxYjR4eHB6YktvczFLMVlpdzdPNFd5eHhPUnIzQ0tuNWVrd3hWUjVG?=
 =?utf-8?B?d2FQQkhiTUI3MUZpN1BKVTZsMGxodnI0ZWpRNFJYRTdZdTkyZUNQWEhnNWJG?=
 =?utf-8?Q?SRG3CouWxLS9Mb2uJ7f8qYTwxyjLac=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTVaNWFtQjlUTDJ2RW52Y3hsNGNXMkRnQ2RudjJ2Ymh0Z3NCVXU4OXl2b2RE?=
 =?utf-8?B?VCt3QWw2YVZsK3RjeW04VE1HQTlPWmRyN3dFSWRkNUJXZ2R1OHFidzhSUkxp?=
 =?utf-8?B?VFhTSi9KalQ0RFdOcUJoZ1dYay9nTERyTDdKSXhrOGNFUkI3dDF0c1pDN1h1?=
 =?utf-8?B?a0EvdlU0OVl4aDZaQ1RNYnE0Yk85Uk9Ib2hKT0pHZWRzMTNWRnlyem8wWUJU?=
 =?utf-8?B?aE43MDRtYjhVQ2tFZ1EvRDF1ZWsxWEVvU1J2aUI1SE9id2YxYWp5amNJQVQ1?=
 =?utf-8?B?bFowVGMxSmpGYUwxclNKclp3ZWxJeDA4UVRpdjlHZzNXWEZZdEo0b3ZIdTFt?=
 =?utf-8?B?di91WS9ieGVLWHkremJFcTNZWStvMFNRN3dmQnl1VG1sbEkzalFpUDAyNlcz?=
 =?utf-8?B?VU5NYXE3MXFlMmdLaHYwRElwZEZ2Tlk1MHlocGNlalg4T3duYU1jdzRzeUQw?=
 =?utf-8?B?VUY2a2tpZW9pbzFBNzJzaVZOcWIyOHNJZVhPdC81emp5SkQxckNLWkRXV0FL?=
 =?utf-8?B?VnBiSEI0OE1wQ0ovVkhjNHhPWWNra1d1U1RhaXUrbTlUQ3Q4a25BVDZRZ1lw?=
 =?utf-8?B?Q2FXUEJocis5eGg4YUNDSERRWkIzdW5tOFpGNVg4c28vMFlDRFNZR2I0allr?=
 =?utf-8?B?VFJWRXlOMUlOaWVYbWcrTVN2OHVncmF2VHdqVm8zYTdkdGk1eW80alB2bnpW?=
 =?utf-8?B?YXU3bmNUbEpZalc2TG5GUWViQmp5OXJaMUxCUGdiUkNsOFY0dUtKb0lKUVlV?=
 =?utf-8?B?cXVNQzlQNUN5T2s1Q2tSRzU2dGs0RmdCMW9IeTRaVWVnZU9iMDkvTU02K2s3?=
 =?utf-8?B?ZkxGYzU3WktnbHdkMW0wZzVUekwzMmZxc2ZNeU9yVTAxOFNWdVlKZlpjak9q?=
 =?utf-8?B?ZytTT1BPR0dXaWhaaC9HNERKcmY3QmFkazNBdFVZWmxwanFuZXFsd1dSczlX?=
 =?utf-8?B?RGpWNUpGLzZMRTRSbk4yYUtrMmw3SEZ6ZWd6SXUxK2xtQlhpR1N0Skk4dmF3?=
 =?utf-8?B?S0pHR1FJRzFqK08vaWNwVFQvRUQvMlRrRkVkZ0Q4YlNnWDBvd3dXSUEyT0Z5?=
 =?utf-8?B?empZZE9qL1lkZE9Wd250WERmNHhpaW8vK0E0Qllrekd6UDN4MGNGTzFaeGlk?=
 =?utf-8?B?RTM4RXNYcGl5RFNHbmZHS2JIdXJ1RWdTMG10anlMSlVUQmt5WUtIOW9GcUw4?=
 =?utf-8?B?bitQSERsTWl4NVc4VGhwUm84R2xpWW16NDduWTh0cjJ2S0NXTk1tYVZQaGFy?=
 =?utf-8?B?YmRkYUZPdkJhYTNQcDZDRlptUmNiWGZwZW1QTTdzdWFtSmRvYTU3NktJcEZs?=
 =?utf-8?B?Tlc4Uk9IdGZEcXc0eFE5aG1WY05mMXArbTZDS244ZnZZLzJmL3hYY3o5UFZn?=
 =?utf-8?B?aGFGQzE4UTJPb1J0aUJiTjkyaVFrdU1zRzdzbkcyMXQvSC9mem1nT1lReGpT?=
 =?utf-8?B?aU1lakJuM0NnaGdDZ0c5amhBc2h6c1pBaXB5TGRXWEtYSFdZeUIvbDRSSnQ1?=
 =?utf-8?B?dWVzZkx6QkQ0d2UwektDL3VqYTFFbTNQYzhsODJxNWNVd05seDgzMk5OL3Zx?=
 =?utf-8?B?Q1Z0L3lBYTlxM1d4UkVWM1ZEQ0doK3NOd1dwbzJxZUxZdDNaeHZ1N0RQWGJG?=
 =?utf-8?B?TFE1MjRxWEdTNE5ISXdVYnNTblZYWEw1Mml5SGMwbitLbHA3TVVyRU1MeUh2?=
 =?utf-8?B?UU9lTkRLUGswTTRRclFPNXNHYUNxWlZWaW1WNGxLQ3Nsa0doeXJpNE5VRUMr?=
 =?utf-8?B?OWt2ZUFpUC81K0dHYXNQR2RCNVVDSnI1N3BINzVXM1JmcW44ZEkzbEUyV2ow?=
 =?utf-8?B?eFVxVWhoTURlTFZpRTRlbmZrOTdpUVk3NklONUt4Njlhallha1RZNlR4dnRh?=
 =?utf-8?B?M0ptek9WUUl3MWV0RWpOTTNFUG9RZDE5ZUtpR1FZdnBkclg0NTQ3VE54OTBh?=
 =?utf-8?B?cUl2Qk1aNWlMd0NQMjVkYkJTOXB6V245VjBaS3Z6WnM3Y0crTDJ0QTJrWDA1?=
 =?utf-8?B?dzg4eGtNVHNhdEphWldBcDc2Y3ZIeGpiaVFnQktZLzlsQkxESVJSSm5FTGdz?=
 =?utf-8?B?dWtOejBFRDJtd2orZmZ3TmJPMTVRdDViK2VWejlwd1dWZ1cyY09lYmxocnZL?=
 =?utf-8?Q?0q9U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CFF185F2C561C4B8F797121A93A7B63@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be322a1e-0fca-4893-98d9-08dd823f3d91
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 08:17:08.3334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZysZQujr3DvuCr4OcQ5bp9YgvG/6/pB217FsDlV+doSeW4UHBHa8kylC7LqsAZMPfbv7BhWSnhbyGdEbiQPQLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9479

T24gMjAyNS80LzIzIDE1OjM2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjMuMDQuMjAyNSAw
NTo0OSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS80LzIzIDAwOjAzLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyMS4wNC4yMDI1IDA4OjE4LCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gUmVmYWN0b3IgUkVHSVNURVJfVlBDSV9JTklUIHRvIGNvbnRhaW4gbW9yZSBjYXBhYmls
aXR5IHNwZWNpZmljDQo+Pj4+IGluZm9ybWF0aW9uLCB0aGlzIGlzIGJlbmlmaXQgZm9yIGZvbGxv
dy1vbiBjaGFuZ2VzIHRvIGhpZGUgY2FwYWJpbGl0eQ0KPj4+PiB3aGljaCBpbml0aWFsaXphdGlv
biBmYWlscy4NCj4+Pj4NCj4+Pj4gV2hhdCdzIG1vcmUsIGNoYW5nZSB0aGUgZGVmaW5pdGlvbiBv
ZiBpbml0X2hlYWRlcigpIHNpbmNlIGl0IGlzDQo+Pj4+IG5vdCBhIGNhcGFiaWxpdHkgYW5kIGl0
IGlzIG5lZWRlZCBmb3IgYWxsIGRldmljZXMnIFBDSSBjb25maWcgc3BhY2UuDQo+Pj4+DQo+Pj4+
IE5vdGU6DQo+Pj4+IENhbGwgdnBjaV9tYWtlX21zaXhfaG9sZSgpIGluIHRoZSBlbmQgb2YgaW5p
dF9tc2l4KCkgc2luY2UgdGhlDQo+Pj4+IGNoYW5nZSBvZiBzZXF1ZW5jZSBvZiBpbml0X2hlYWRl
cigpIGFuZCBpbml0X21zaXgoKS4NCj4+Pj4gVGhlIGZpbmkgaG9vayB3aWxsIGJlIGltcGxlbWVu
dGVkIGluIGZvbGxvdy1vbiBjaGFuZ2VzLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKaXFp
YW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+Pg0KPj4+IEZyb20gdGhlIGRlc2NyaXB0
aW9uIEkgY2FuJ3QgZGVyaXZlIHRoZSBuZWVkIGZvciAuLi4NCj4+Pg0KPj4+PiAtLS0gYS94ZW4v
aW5jbHVkZS94ZW4veGVuLmxkcy5oDQo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi94ZW4ubGRz
LmgNCj4+Pj4gQEAgLTE4Nyw3ICsxODcsNyBAQA0KPj4+PiAgI2RlZmluZSBWUENJX0FSUkFZICAg
ICAgICAgICAgICAgXA0KPj4+PiAgICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsgXA0K
Pj4+PiAgICAgICAgIF9fc3RhcnRfdnBjaV9hcnJheSA9IC47ICAgXA0KPj4+PiAtICAgICAgICoo
U09SVCguZGF0YS52cGNpLiopKSAgICAgXA0KPj4+PiArICAgICAgICooLmRhdGEudnBjaS4qKSAg
ICAgXA0KPj4+PiAgICAgICAgIF9fZW5kX3ZwY2lfYXJyYXkgPSAuOw0KPj4+PiAgI2Vsc2UNCj4+
Pj4gICNkZWZpbmUgVlBDSV9BUlJBWQ0KPj4+DQo+Pj4gLi4uIHRoaXMgY2hhbmdlLg0KPj4gQXMg
SSB1bmRlcnN0YW5kIHRoaXMsIHRoaXMgaXMgdXNlZCBmb3IgaW5pdGlhbGl6aW5nIGFsbCBjYXBh
YmlsaXRpZXMgYWNjb3JkaW5nIHRvIHByaW9yaXR5IGJlZm9yZS4NCj4+IFRoYXQgaXMgbXNpeCA+
IGhlYWRlciA+IG90aGVyIGNhcGFiaWxpdGllcy4NCj4+IE15IHBhdGNoIHJlbW92ZXMgdGhlIHBy
aW9yaXR5IGFuZCBpbml0aWFsaXppbmcgYWxsIGNhcGFiaWxpdGllcyBkb2Vzbid0IGRlcGVuZCBv
biBwcmlvcml0eSBhbnltb3JlLg0KPj4gU28gSSB0aGluayB0aGlzIGlzIG5vdCBuZWVkZWQgYW55
bW9yZS4NCj4gDQo+IFBlcmhhcHMsIGJ1dCB0aGUgd29yZCAicHJpb3JpdHkiIGRvZXNuJ3QgZXZl
biBhcHBlYXIgaW4gdGhlIGRlc2NyaXB0aW9uLiBTbw0KPiB5ZXMsIC4uLg0KSSB3aWxsIGFkZCBk
ZXNjcmlwdGlvbiBhYm91dCAicHJpb3JpdHkiIHJlbW92YWwgaW4gY29tbWl0IG1lc3NhZ2UgaW4g
bmV4dCB2ZXJzaW9uLg0KDQo+IA0KPj4gRG8geW91IG1lYW4gSSBzaG91bGQgYWRkIHNvbWUgZXhw
bGFuYXRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlPw0KPiANCj4gLi4uIHRoZXJlJ3Mgc29tZXRo
aW5nIHRvIGFkZCB0aGVyZS4gQnV0IHRoZXJlJ3MgYWxzbyB0aGUgcXVlc3Rpb24gb2Ygd2h5IHRo
ZQ0KPiBjaGFuZ2UgZG9lc24ndCBnbyBmdXJ0aGVyOiBXaXRoIHRoZSBTT1JUKCkgZHJvcHBlZCwg
d2hhdCdzIHRoZSB0cmFpbGluZyAuKg0KPiBpbiB0aGUgc2VjdGlvbiBuYW1lIGZvcj8gVGhhdCdz
IGFwcGFyZW50bHkgY29ubmVjdGVkIHRvIHRoZSBwdXp6bGluZw0KPiANCj4gKyAgc3RhdGljIHZw
Y2lfY2FwYWJpbGl0eV90ICpjb25zdCB4IyNfZW50cnkgIFwNCj4gKyAgICAgICAgICAgICAgIF9f
dXNlZF9zZWN0aW9uKCIuZGF0YS52cGNpLiIpID0gJih4IyNfdCkNCj4gDQo+IFdoYXQncyB0aGUg
dHJhaWxpbmcgZG90IGZvciBoZXJlPw0KVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzIHByb2JsZW0u
DQpJIGZvcmdvdCB0byBkZWxldGUgdGhlIGRvdCBhbmQgIi4qIiwgd2lsbCBkZWxldGUgdGhlbSBp
biBuZXh0IHZlcnNpb24uDQoNCj4gDQo+IChBcyBhIG5pdCAtIEkgYWxzbyBkb24ndCBzZWUgd2h5
IHgjI190IHdvdWxkIG5lZWQgcGFyZW50aGVzaXppbmcgd2hlbg0KPiB4IyNfZW50cnkgZG9lc24n
dC4gSXMgdGhlcmUgYW5vdGhlciBNaXNyYSBnZW0gd2hpY2ggbWFrZXMgdGhpcyBuZWNlc3Nhcnk/
KQ0KT2gsIEkgd2lsbCBkZWxldGUgdGhlIHBhcmVudGhlc2VzIGluIG5leHQgdmVyc2lvbi4NCg0K
PiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

