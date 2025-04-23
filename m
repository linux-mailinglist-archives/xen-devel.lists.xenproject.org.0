Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FFBA97D60
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 05:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963899.1354801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7QYB-0007iw-Qp; Wed, 23 Apr 2025 03:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963899.1354801; Wed, 23 Apr 2025 03:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7QYB-0007fo-Ns; Wed, 23 Apr 2025 03:13:27 +0000
Received: by outflank-mailman (input) for mailman id 963899;
 Wed, 23 Apr 2025 03:13:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EGKH=XJ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u7QY9-0007fh-P5
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 03:13:25 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20629.outbound.protection.outlook.com
 [2a01:111:f403:2409::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e83f4b5b-1ff0-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 05:13:21 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA1PR12MB8520.namprd12.prod.outlook.com (2603:10b6:208:44d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 03:13:16 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 03:13:16 +0000
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
X-Inumbo-ID: e83f4b5b-1ff0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qxe/ajEW+lQHF5qeajhhs4QCRXJ5BcTa8o/ZoC4/fFDj8ptdDvSqCM3UhKle7TpcfjK0WUVSaHpWIZ2+Qev7NmQYEJCZghlqaz+fV+qYZFVWJNsJsIAjwTJM0jE4e4anDLetk4OeIQm2SxUFMOygGHKrfBBbhI2w9jlllymyDZmGJPeBf4FPnXITNgVZo1LwvMbBV1LN1E0FPPZFogy8ZKkNlGxkRWh7Mmd4iLqJXC0+BCXoAode1nepIxyFrvgIEbs1bX7gownPksbv0GtIrcGafGtOtF7S+NnR4toLTxAk7Zx2F307miS5l07hszDsaJBQSSja37NbbHK3JsiKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ed1HVcjbl+EBoNKSdFW/uFiWpW7xV/VA8EAMeFrwaz8=;
 b=SBTyB/d6EFj3KK85IldRmSUNQ+PXK/jajkQdoDhoHnzf7E6SlVIecsw1TCEr5BmT5RmCGBdCuBg5eGsyp1sN4a+C3BkiT4of7AftZpA24NieVtoXRDkG0K7J0jfB6JnnxcW18uNdEH6E44zQhfRp5HIKMtaAidbmJ9C+fbu4xyrOa6T/JZAZ3aVu4HmYssTod4aaYYSJDJizyhcmCLdMuEp3FHvJeV70ZdgRLXgP7rl0pzNJ3EMySA2oTyCeWmwShGYM/t2jJ+DZTCzAVxNyo0dN9r+9W2jl3PIol2p6QezuZLtWNT7PhWlFktLliLUZWmouXZznV9v+73EqW6eWNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ed1HVcjbl+EBoNKSdFW/uFiWpW7xV/VA8EAMeFrwaz8=;
 b=jGQbJSZA4hV6m6OE8yHJkv9IzqNCJd7bP7MiZZ/74MGr26PaCFTorzvUzIvRj2ypE0UorZFuLRCXGLfHY3hMDshMaZPVAJX/2qBKrtmESnAHCHNnG7mQfJlTwN2pTTkynNV1+7lNoEr91nRbfa3/diMoWkkpM8APIrehl31J7DE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3 02/11] driver/pci: Get next capability without passing
 caps
Thread-Topic: [PATCH v3 02/11] driver/pci: Get next capability without passing
 caps
Thread-Index: AQHbsoVXQBbkP7I+H0O+xO6/Zu2wRbOv2fGAgAE+FAA=
Date: Wed, 23 Apr 2025 03:13:16 +0000
Message-ID:
 <BL1PR12MB58496CCFC316FCEC2A3B09C6E7BA2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-3-Jiqian.Chen@amd.com>
 <a0ede35c-ca58-4d0f-893c-f498052682b4@suse.com>
In-Reply-To: <a0ede35c-ca58-4d0f-893c-f498052682b4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8655.031)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA1PR12MB8520:EE_
x-ms-office365-filtering-correlation-id: c1c931d4-dcb2-4644-cbfe-08dd8214caad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a0dROUg4YllrdzgzMTVqWVF4bVQ1allyUTVGWmRBYmdqcWJjdlRyUmVYWkQ1?=
 =?utf-8?B?Ym9XVUlDMGo1K3FDeThtc25VbGMyM0h1d1RNN0h6T212YkRFdFFsSkZmRVln?=
 =?utf-8?B?QlRnM0ZtaVk4UkltS0tZV01Cb3RmUGIyR09YYU9paFJUQ21IenZvdGdCY1Rk?=
 =?utf-8?B?ZE1jczNDTytYcEwvNFU3bFlmTjZsMEpCdStNbnM5cmJRalJwMUc2TlY1R0h3?=
 =?utf-8?B?K0NTUHhVT3RrbHgvV1AybDM2UXJxc0NPQXFxR1ZtZm9OcC8zMU40dms2dnZO?=
 =?utf-8?B?eEVEYzFNQnN0T3ZGeEw0cEsrQmVGOEFhUFpBRjV5Ry96WVIzSStvNzZ5VHZX?=
 =?utf-8?B?T3lDZFRDVWs4RkNUOFpZbWZDYlk5Vk1BSkpYMEgwd1BURnFjY0hQZ3hZeWoz?=
 =?utf-8?B?V1Z2Zlh3dlg3YzRyUXlLbzhQKzh2RlJadWZ3S3JjczBBaVIrUzM5aVROL1pC?=
 =?utf-8?B?MHdISFBmaWtiazdXa3E5ZXY0SkY1bE9pOWpSSjFiUEZDSmxkenZZZlVSeFIw?=
 =?utf-8?B?ZjBkMURBOW1yWGMvdVJ3VGlDRDdEcDE0WHg4RFFZMVYzclZXRUgzYmV1QlRa?=
 =?utf-8?B?VmtneHJzTzJsTDREcXUyWjVsL3h0eGJPZmJHOVVrSzhiT3EyWFFaRXVkQ0lC?=
 =?utf-8?B?Q2ozSUZ4aTBvRGZxMzhMWWlIbE5OcU95czhiQ1FOT09XSFV0RWVIZHgrUkhP?=
 =?utf-8?B?R3BSbXJMc2lGQUZhUDBVS2VDbDJFRFB4QkQxQXZqWkZ5WmZ1aWJoSXd5RXlB?=
 =?utf-8?B?aXBsNSt4YmluUGdQZ0JrVjQxUjhkdTlFc0RxZXRuM2EvSnZzZmZEUmRvbFRI?=
 =?utf-8?B?YS9vc3pVQW4vdG9TeE95czRCSmZ3djJQWGhOV3BMaldHbXN2QjlrNEJUMTBH?=
 =?utf-8?B?eFptVndpUFlpQXRtNDVJcmdnbktSbDFlMGh4bWhNVEFhVHl1bDUrakhzR3Bi?=
 =?utf-8?B?Mk9KV0NJRGFEV09uVlFhSzlsNnUwY205L3pJMkh3QVJaSUYxS3pKZFVZUjFw?=
 =?utf-8?B?U1o3b3JGVlp4cjBibk50UVBMYXRqdEltVTdnZnNIdllVU0NxeDUvckY3WjJw?=
 =?utf-8?B?UnBhM0FvV3hTamx6SWE0cVJzNDZBeGRnTDEydlc0K3NPeGtBeEplaTNOaVFP?=
 =?utf-8?B?S0Uvd2hGY0hNSHVZWGtkNkFETUNwTkpmYzRaeXd5Z1pvblRvZXpoN3BRTFhI?=
 =?utf-8?B?c1B0TDJFTGpIdGs3dFJVbnVubmxHY0NrT0FzS1ZSa3o1T3AxWDN2NkU2aGtV?=
 =?utf-8?B?U3czMDRCUFpNWGpacngralc2ODZiU1hOSUpQYXVuczFsZGtWTlZWdEJJRnRa?=
 =?utf-8?B?WHJJNXpscnptTWp3RGtHVTdXSEFSY3hRU21PVU44MGpYYnFmNFRLTDRkSTNi?=
 =?utf-8?B?VlFWWmFZYW1vakJUTU5BQ0ZlYjV6bkh5bFJlZnVWQmE4TWdFbURZc3E1cDVV?=
 =?utf-8?B?QnY1RldsQ1Q4Y2UweExOK2RCTXdrL2NTZVlpVDAwdjZYdnRKY0lUOTVGU0dm?=
 =?utf-8?B?TytSSW1MUjJEVjhENStBem1ZUVNJUEViVnAvMThxQkkySHIwK3M5djA3TzZX?=
 =?utf-8?B?MVhUVDA5b09ITHpiSzI0T0pDZVp1bWVyalV3ZTdrWGZKM1pJeGUwY1k3bW5G?=
 =?utf-8?B?dmV3M09qRnZ1THl5OXJ3bjdSVGExOG5SVnkvMFNlNThJYVdlMGNRcFRMOTlH?=
 =?utf-8?B?ZWFTSFJTY0FBTy9IRWtqSWQ1UEQvSlFYN3NZbVlIN1RsUzVmeXg0MGd0T0V5?=
 =?utf-8?B?UHpnV0RCRkRXUGVLSHo1Z1ZpbnRjYjhOUHdIb1IwVDV2aDhvQjB0THBsMlJm?=
 =?utf-8?B?RnBYS1lUOS8xQmxQZ0ozdHBpcms5ZEIvUWNnZzI1TTBTM3B3MkJjanZ3OUVP?=
 =?utf-8?B?TUFTaVdzeVFZYmxQRkRxNXpBQXk1UGhoNE1GVUVIQ2l2V2JwTUx3WittQW1w?=
 =?utf-8?B?MldKWVlWUnUrTnBTUEc5ZVg2cTM2bEQ0MU42OGluN2xKZGZBNm8xbTJKdnZj?=
 =?utf-8?Q?RTwUQG/ZYitqIeUldVVUpr40/aLivc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NW5wRStzcWRuWitXTHEycGZuOEd1NklnWklmQ1hiUEdUaENIT3VYUUZQb2hR?=
 =?utf-8?B?ci84WHMxMG4zSW5LcGtGcSt4eUNsSk8xcGpUbXJqbU1LWEUwRkIzZ3BmRWhK?=
 =?utf-8?B?UUxJWkcyeWd1a3JlMTdEeWdFQ2J1RmtzU01sclhBQkt3ckxqWlRGZ1JGSjVI?=
 =?utf-8?B?YkJjUW9VMXlnWTlqMnhPaEJBaVZQOURFSUxhc3ZPMVdPdkl1Z09HdEsrendP?=
 =?utf-8?B?eFFXaWRhZnRJT2tDN3Q3eDR4ejdCRGI4amd4SnJiRFVlM2RZaHh5dnkrWllQ?=
 =?utf-8?B?bE9IUTh6Q25GK3lzMjJ1N2pRVFRRMXovWE80YXA5MDdFVUxYT2doK21uU3Zs?=
 =?utf-8?B?SEo1RmJIOUJnVUozd0xudnFGUFNYczd0bmhMdFNxeUk3ejBFSUhOemFsRWp4?=
 =?utf-8?B?MldvQldhK01FYVdOV0xHNytqdDJVSzI3aEp0TlcrTlNoZnpMZDB6VHM0enVa?=
 =?utf-8?B?YktQdkRHTHpOc0V5RXJJZnFhYThSN1hUZnFsMzlxSnRpOXduRGlNVXpWQWxP?=
 =?utf-8?B?Q05Bb25lU3RSOHlOZktFWUxMR1c5TjJHUHEvZGNySGViVXlJemVJN2FTdlI5?=
 =?utf-8?B?dDg4QmdxTnZTb2NvTU0yVEZpZXdibDc5K3ZISWtONW1CRENXa0JON1J6ZHpm?=
 =?utf-8?B?TE8zeitIYlJIOXJrZkNiQlFjdG1vTUw1a1JqcndMdU5DUy9FWUNtL1ladUc0?=
 =?utf-8?B?bXltMUpHOVJmcnlkMVhTeUJYbmtyd1lQRHlwUE1kV0NDSTdFWC83ZEJHQkg3?=
 =?utf-8?B?c0o4Yk93QlNkMFY5ekdsV2g3RnZiVy9mS3hRVjl3bGExME1oUmtHTGFORnI4?=
 =?utf-8?B?dTJ5bGtxZXB3UFFxRnZJN0dYMk81Q1dEVDB4L2tjRHZKcDRES0c1S1pkT1Ju?=
 =?utf-8?B?WUgrVUJuYXplTkp4aU52dkJkcEZnZ21qY01xQ1JOZWJybjlRckMwazY2N1Y3?=
 =?utf-8?B?M3gwbDBIQzRRTlY0QTRrYk1STytyeXhxajhkelZ1N3hId0E2WGZYR29wejhm?=
 =?utf-8?B?ZGlRRkRxWTNWUDg5cXh5TzJaMzY5MFpVeE9MREVGQjQxQ3lLRjF2ajgwamg0?=
 =?utf-8?B?NVBHZ1VvdTcwNEh5S29scHczR1JuRDRJa3BKc1M5TjJOUnZsdXdMbFZoZG9L?=
 =?utf-8?B?MWNkdElTT3o4NG8wd1IyWXZZVGpsNklWQVM2eEJKQjJZbFRNUTA3cmYxVldu?=
 =?utf-8?B?MnA5TmdGYWRQOHhyUEdsV2JRTEFiOHgxWDA2V2xWSy9JTFJFbERNYklvZElN?=
 =?utf-8?B?SExxcmlUMmdybHhxQW5XdGYwLzB3MUNyV0VYeG04TTVucEZhcjBrL0p4V1VB?=
 =?utf-8?B?RTJkSHNxSHV2bGtyK2JuSXBtYUVldUNQYkZCNWVWVTRJWVhxdHN6M3JRQVVy?=
 =?utf-8?B?UWp6NWthV05LTHZGVERnNThVZjBJWG1LLzZVblVqREEzZVA4cExIME1HSUNR?=
 =?utf-8?B?VnpQV1dvZnFlRGhUci9DMkRlNnMzUi9FMzRQUWJtTzhTYmx4TEZqREVvSkFW?=
 =?utf-8?B?eGlUdTdNekRteE5VNkU4bVdFMDJVcDU4Z04vZmlXQUo3SDMvYlFudkNnR0Zk?=
 =?utf-8?B?aFhEbTAxUGE1VWNRbnFYVmhtclBiZmNVTmNLaE1oZ25IQ095ZDU2a1cyTU56?=
 =?utf-8?B?RVFtSHZ5bjU0c0pGZ0FXVE03NGFmWnErNDBaZnFSS0JMaUJGakFKOUMrcFlP?=
 =?utf-8?B?bTFkbmpDSGkxNE11OHRqRHB4MWpDdlpoNXRQRWFIaXNXWUpJRjRnYWY1WHhP?=
 =?utf-8?B?Q3hlR3kyeXVyK1VOUjE3WEJSQ29zWVhCTHhmNEVOQ1pjTXVpKzdCRmFVczJs?=
 =?utf-8?B?Q3dtWWVJMVB5LzFSTE45alAyZ3ExQlFXOVROYzFzOFo0VmQ2bWtjSmpXWFZ5?=
 =?utf-8?B?NzUySUFLSnRNNEJWNkczMGlXNnVQVGs4QWNuL0tiRmowSUhUTVphczZPMXVR?=
 =?utf-8?B?WDZPd2YzZGZpZVhsZEZvV01ieE1DQzV5b0lXMHhTQ21xcnMrd2FUSlErUnNX?=
 =?utf-8?B?WkN1S1BIcnBPUEIxQ0tIakQyaWcxVXBrZ0tsQUkxeVU3eGovUlExSzhneW9F?=
 =?utf-8?B?T0wvVHRWdWtib3FaSFFyOHJ0b0oxekR6THFtRFIzZDRPTTgrU1BLTjRsZGFt?=
 =?utf-8?Q?vqpQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CBA37A0DD2F5848BAA479761A1D0AE4@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c931d4-dcb2-4644-cbfe-08dd8214caad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 03:13:16.7235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jn8/4gvJ9LdlXlyNiDP8PkaSXfsij1Bg/eV1sbD2mdgR9fR6Mjum6wO1fTArw2ARe9WtMFQyjpHo5yPAYYQUYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8520

T24gMjAyNS80LzIyIDIzOjU5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjEuMDQuMjAyNSAw
ODoxOCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBNb2RpZnkgZnVuY3Rpb24gcGNpX2ZpbmRfbmV4
dF9jYXBfdHRsIHRvIHN1cHBvcnQgcmV0dXJuaW5nIHBvc2l0aW9uDQo+PiBvZiBuZXh0IGNhcGFi
aWxpdHkgd2hlbiBzaXplICJuIiBpcyB6ZXJvLg0KPj4NCj4+IFRoYXQgY2FuIGhlbHAgY2FsbGVy
IHRvIGdldCBuZXh0IGNhcGFiaWxpdHkgb2Zmc2V0IGlmIGNhbGxlciBqdXN0DQo+PiBoYXMgYSBp
bmZvcm1hdGlvbiBvZiBjdXJyZW50IGNhcGFiaWxpdHkgb2Zmc2V0Lg0KPj4NCj4+IFRoYXQgd2ls
bCBiZSB1c2VkIGluIGEgZm9sbG93LW9uIGNoYW5nZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
aXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpUaGFuayB5b3UuDQoNCj4gYWxiZWl0IC4uLg0KPiAN
Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL3BjaS9wY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGNp
L3BjaS5jDQo+PiBAQCAtNTUsNiArNTUsOSBAQCB1bnNpZ25lZCBpbnQgcGNpX2ZpbmRfbmV4dF9j
YXBfdHRsKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHBvcywNCj4+ICANCj4+ICAgICAg
ICAgIGlmICggaWQgPT0gMHhmZiApDQo+PiAgICAgICAgICAgICAgYnJlYWs7DQo+PiArICAgICAg
ICBpZiAoIG4gPT0gMCApDQo+PiArICAgICAgICAgICAgcmV0dXJuIHBvczsNCj4+ICsgICAgICAg
IEFTU0VSVChjYXBzKTsNCj4+ICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbjsgaSsrICkNCj4+
ICAgICAgICAgIHsNCj4+ICAgICAgICAgICAgICBpZiAoIGlkID09IGNhcHNbaV0gKQ0KPiANCj4g
Li4uIGJsYW5rIGxpbmVzIGFyb3VuZCB5b3UgaW5zZXJ0aW9uIG1pZ2h0IGhhdmUgYmVlbiBuaWNl
LiBJIG1heSB0YWtlIHRoZQ0KPiBsaWJlcnR5IG9mIGFkZGluZyB0aGVtIHdoaWxlIGNvbW1pdHRp
bmcuDQpUaGF0J3MgZmluZSwgcGxlYXNlIGFkZC4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCBy
ZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

