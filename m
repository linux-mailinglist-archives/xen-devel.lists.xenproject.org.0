Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F243B67531B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 12:12:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481683.746750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIpJ8-00032p-05; Fri, 20 Jan 2023 11:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481683.746750; Fri, 20 Jan 2023 11:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIpJ7-00030E-Sl; Fri, 20 Jan 2023 11:11:41 +0000
Received: by outflank-mailman (input) for mailman id 481683;
 Fri, 20 Jan 2023 11:11:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIpJ5-000306-SH
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 11:11:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34621562-98b3-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 12:11:38 +0100 (CET)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 06:11:34 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6051.namprd03.prod.outlook.com (2603:10b6:610:be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 11:11:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 11:11:30 +0000
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
X-Inumbo-ID: 34621562-98b3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674213098;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sDNUAFSOM9nSmY2tfFtONpjQs+xlaGIexAFJht7PkCs=;
  b=fuDn9FnPhuH8r380lpfJOrzJqvzdoxjZNgQTONNfj4N4PT+IfkiYfQ2q
   VBMpBcxr2/0gLFiF0otBVzjvum5TieYHWucSi9i3rbOt6eXYa4RxGGA1g
   ZKpGL4YKKqqUXjZerHptePnflJqV/kMPGyO+UYutJI2ceyEB/lvenpw/T
   E=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 93537808
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yhoO8agmgAthGrOf5q9RocnlX161KhAKZh0ujC45NGQN5FlHY01je
 htvWTzVafrfZzeme9snPNvk8U0PsZbdm9I1SVc6/CFgHigb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5QWGzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ7djs0TUCJmNmOzY/nFudFrOA7DOPSadZ3VnFIlVk1DN4AaLWaG+Dv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluG1bbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ReblraE62A37Kmo7Bz4tD2bis/aFg2WEQcB5e
 kobpi0+ov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+WsDezNC49PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiisywWl7gVy8kR2M2T913dnyiloJSPSwcv/xjWRUqs9AY/b4mgD6S27lzc4edFPZyuRFCLt
 3gZmOCT9OkLS5qKkUSlSuIHFqCk/PaBPTjVh3ZgGpAg83Km/HvLVYlU4SpiLUZzdMgecDniY
 VT7pg9aopRUOROCZqhxZYWzB800zLPIGtHsV/SSZd1LCqWdbyeC9SBqIEuPhWbklRF0lbllY
 M/GN8GxEXwdFKJriiKsQPsQ2qMqwSZ4wn7PQZf8zFKs1r/2iGOpdIrp+WCmNogRhJ5oai2Mm
 zqDH6NmEylibdA=
IronPort-HdrOrdr: A9a23:KytxV6P4cK36HMBcTsijsMiBIKoaSvp037BL7TETdfUxSKalfq
 +V8cjzuSWZtN9zYhEdcLK7VpVoKEm0nfVICOEqTNKftWLd2VdAQrsM0WOoqweQfxEXnIRmpM
 VdT5Q=
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="93537808"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/fhzSskZ3XL0WE8Ht4Vyg6pzt/dwGRZMLLaG81DbXunVi8ttCPGwFqjiYkm86zD/rTdGZ7t8qwQF1lcoy+v8QBAzAzMLNiX8QO5AmME3b0Z8Y9VIsGQi4T7GaBvVRYD13XQoJD6YSUMBeC7U+RABd3VdnsK5e6CurMFwZbCczWau+XMNbstwkON3yiX6aQHDS2hMdf1SXLMIAWlBtowOfhmLChwUlm5fkPZn1bTeIwwD6sChOiK+FFSrTKZpntxDyw9Pc6ji48V0vKottLlSQ7tougwVAvBbTVs/KpPWTjFA3Se244cMjpTv86EUtcpNr+81DbP3u5Mu+zCj2bPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDNUAFSOM9nSmY2tfFtONpjQs+xlaGIexAFJht7PkCs=;
 b=cbmQvm2tZMG66ymwBj1uqNT+ryAhf3YIudzH/25Gic6YKTJ2uSMLgtHrqH5Z8nKKzD+Be234sFyLQIyKkC+oOue5DFDJfJ6HILApIkE8ry3stBGThBOBfZrr6vVay/ZjjwB2MTxb9tWnokpJCSi9bdX3v+iqHXR4zEE1SJ8bShyeNwNVgcYB6N7f10jnJTvTu7S4YLbfp4TycfFFHcs+XDkz7P/JrRBY+E1bvqDEafmfD1Pcd/80yQgbZ5DXOhmaWFvIeMcoi0ATWVUeNzyVypAK+Od/edQz0Up3BG/gjOYQzjbBMpa7gvC3+phIr0oSov8vlxtnb3UEyyPbZAwBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDNUAFSOM9nSmY2tfFtONpjQs+xlaGIexAFJht7PkCs=;
 b=NzoawmN4Nmgd4KxN8OT4YTZcNFPBjrKvf5zNhUU5GcRyhYME839W8Y9wY1MIDqIhCo+Q8BMz4kab6FIGr40fJbiGIgBzYnV/knLpzkJ01rfs99rv6lxlpmufK1pGibBlOloJbrSKIMQsoStL7wDcemDiKFibfKfOQ7mYRt5GST0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>
Subject: Re: [PATCH] tools/symbols: drop asm/types.h inclusion
Thread-Topic: [PATCH] tools/symbols: drop asm/types.h inclusion
Thread-Index: AQHZLKrc/EwdR9Lkfk2WTSRRJdysna6nJo4A
Date: Fri, 20 Jan 2023 11:11:30 +0000
Message-ID: <9f38be7f-0781-94bf-2444-546897755702@citrix.com>
References: <1eaa4cce-2ef2-ca38-56d2-5d551c9c1ae9@suse.com>
In-Reply-To: <1eaa4cce-2ef2-ca38-56d2-5d551c9c1ae9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH0PR03MB6051:EE_
x-ms-office365-filtering-correlation-id: dc0ba417-bd89-40f5-65eb-08dafad71545
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DtQ7i1+TOkk3qrHLNJszRB6ZxFMwNEmItBRDHsHLnK/vB1STMbVeIeb0VRdKGqrfntHIKYqmXLRGEN1OrBYREOk6zRiCgnvIwTkFhp1f4R9ffTBl0o1kqB+YQUbMpxJokK3+WAxtoX+A9GdWk2PX7ywiuIAQ0QcrS0CJ56wsGihv3VqMiQ/MgUQgxP12nhLi1bMWnSTTeyHpXFvykWjld7AaZWRdl3y/9WW1fWjpLOPUG9SBotZmLvepZB2/ejcgfXYzgQ734zw+QDYg0eXM2jAssTtgJYGbg1qyPrFQN72FycX73j1/06lusFvyGjWfhQxrjS8i0/TGT0UVIzhZreim+cQHDUF5TRAAtSm+9YPYbKF/umEpSWy/NZhHBRD32LI04fPsiFqorohpN7c6KvM6j7Hk9iDV7FCa29P6Iw4/1cbOz03C06vXHixwLohXqB7CNjPzaYPsi/8HTf7YF3s3zCEEYLj0Fx7eDcrLkjwTf6m9fDx5b/3iJBvyJNKr7pJhoX7oNZ3+yDiKQh4AtQ+gJ9FeoPxhSBOQVonc9hpDqPBn6UUoNGwRLJ0KJl7oNk/dE3NHEHbmU1IgbqYlEicqXyF8eCLVBq3rKgDPyxJo/K+fS/hS+6I5Pzwb+6v0d43BzT4NP3h6CWjFjq/7CyRaGdkPehV+mIu18TeS1kMM0R1lJM98XVL5FdE7lBekmZtKuNdtSgIzgPgMti4YfmnCnpCPuNF3vzQUnf3F2vJZcqP3LJ68RcJX2V5w56HanXd5y+4v6LWSaoeR/hPOlw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(31696002)(38070700005)(31686004)(6486002)(6506007)(53546011)(71200400001)(478600001)(86362001)(2906002)(316002)(54906003)(76116006)(110136005)(4326008)(7416002)(5660300002)(82960400001)(2616005)(122000001)(91956017)(66946007)(66476007)(64756008)(4744005)(66446008)(66556008)(38100700002)(41300700001)(8936002)(186003)(8676002)(6512007)(26005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VElieGRNazRuWnJxblJzakJvRTZUVVNBa0tuTUFjZXFWakdGYjJLRkdGcXZK?=
 =?utf-8?B?dko1VjV1Q3h2TUpwQzF6MmpZOWlBbGlIQXFESUY4eHNSZTVRUXJKOXMwSmtr?=
 =?utf-8?B?K29Oay9JeEc4UkNhcDB6TnZOd0ErdFdBUVE1amxGcTBOVFBSaUNpbHhoUkpq?=
 =?utf-8?B?S1piY01yaG84UEN6MzRPMTN3KzJMcnJhNFRyZFlZaE1VdFQ0VDRTZ28rckpo?=
 =?utf-8?B?RDlNOENSWlFHc2Q0eHQ3U0VVVUUxNWdCQkR4UHJQT3FEREt4eStOYVk5V0lq?=
 =?utf-8?B?MjBhRWsxc3lVRzd2WUZ1N0dMOWpQQi90VXhXakNybjJVZGM2bS9hdkM5NGtV?=
 =?utf-8?B?TjBBMUR0Q25nOHhoR2JyemFuNFlsVXQ5d2NGVUlBMVVpdFdYQ2JoY0t1STVI?=
 =?utf-8?B?cTVJbldsaGhVOFBSa3FqNWhHUDlFeGhYcFl6QnQ3b3pmYVNqUGFzUkdTdCtL?=
 =?utf-8?B?Qnl2NlNZb3JDeXFvbFdEZThZVjVFTXcrMnVGdmtrcml1TlQ1UUpSUUF5VmVx?=
 =?utf-8?B?TFZBQ0xiekRNRHZBTDl1Q1pUQmRSYWZiVjdFU0c3NURtV0VRMEdNdEhmSXNo?=
 =?utf-8?B?MWh4TmVLZTRlbFJnTGNwK0tYM01WeTN1dTRDM3R3SlMwSEpQQ3JqVVhMaFM0?=
 =?utf-8?B?VVJLWVluR0xvamRvNEdHSmdQbkxXekhVdFpGQ1hxV08vQlQ2a0dXSkhDRUV1?=
 =?utf-8?B?N1dJT3lHd2lhSGt6cm1td1N1Q0tuWGhweXpkcmNWVFpBdWFNSm9NNFVLTmQ4?=
 =?utf-8?B?dVc3b3JObklLeVpreTY0ZjZobVU1Tk14VXR5dGhtK2FBZ2lkWXNmenY3UjI3?=
 =?utf-8?B?WXVMd3ZsOE01Zjl6MkRxWm9waHNFNW5aWUhXR0ltdS9ZNkpIVTZFRHY5MW55?=
 =?utf-8?B?clJxUDQ0cXJZRGNjYlRUMFk4bWN0SHNmeWNWY0tSUGpjRDNNZ0hud2h4Ukd0?=
 =?utf-8?B?VHRtalZzdGZOb20reGM0NHVHZmVuczh0d2k3VFpQbERXSThjNkxhUkRGTllU?=
 =?utf-8?B?UHhIRVdaZEtPZXZacGNpTnJsaisvVjhxQXJVSGIzTFo1cy9qd0JVVnpyVkUr?=
 =?utf-8?B?anpoRGh4SmVMNjdVSmd1OS9LUzdKV3pPMDVGU0RWcEJHS0kxRzZYemorYVJI?=
 =?utf-8?B?ZzFuU3NxSjcwUENGRGxrdy9DWDB0bUpwamlZZmxZTXZpdDF3bDZpWmNkTlVT?=
 =?utf-8?B?R2pPaXVoT1pKRGY0N2JNTWhrNmFNVHpnU2UxVnk4aWdENE9xdDg0RVlGRmxz?=
 =?utf-8?B?R3pmaHoyVUVreGVDQ1dpWmtlV29lRFJXM0JMck5NRDQ0dFdyN20yRHdQdS9a?=
 =?utf-8?B?SEd4aGVVZTBHOE5VY3BnQ3dtVkFJb3RDSU1YbTZFajMxK3hzcE1YS1J1VnRM?=
 =?utf-8?B?cG5NUU5JTlFsVUlzSEJZeFNWU0JCY1NSMllmeGRIRTdNbEZYV1hSSTlvR0JI?=
 =?utf-8?B?QUM0Qmt3U3lDei94U0s4anpqSTM5UTFGYkJCb082U3V5d0tRbVVzNEllTS9a?=
 =?utf-8?B?UWlWZjFaUEw2RTBLaTRIN1lJWXZDaFZweCsxZnBYNzZNbXpPbDV5d25WbVU1?=
 =?utf-8?B?NzhCYnNTMGtYMFZacGtDWWJGUktjRGh6QzhYb2hTQisyWGVTWS9FNWFKaEVq?=
 =?utf-8?B?VUF6Lzdud2Y3M1k4d1BlVURDRWhqRk5JYkZuRDVIbnRqME1icWNwNXBSNmMv?=
 =?utf-8?B?Y0dDMEx2L1R0bi81eFBhQUxPN2pvUU5LMWwvQi9YUjVQUWxCaXpqMGt1aVls?=
 =?utf-8?B?cnc5REpJdUY2cE9OK1pmQkV6cXRZeEFrcGxQZjFHNkVXUXJGZnNaaW1nQ21N?=
 =?utf-8?B?TGNIMDNGcmxtNlBLWWVhOUFEbVRkTlFhTU5FVllVWTJmMUlpRy8wdmx1ejFX?=
 =?utf-8?B?Z2pqV3NQdk9zemdmUFQxNEVaKzhoNkUzY212MHpVNXJ1dmtJbk9sc1dtbnBI?=
 =?utf-8?B?cm1CcXRZSkgrK0lxMkJSV1VKVFd6a01lTGVwU2NMbGlvNkh3U2RnVW9jak5K?=
 =?utf-8?B?YTFpZ3dqUHl0c2JxSUxUbGE4N3RQUkpXOStTQ2dDeE9IT2Y0QTZZaEdaNzB4?=
 =?utf-8?B?eHpvZUIzeUx2QXVtaWdiWmJIdVh4RW41M29uOHV6a3czWU5DNTFTa2RhcTNF?=
 =?utf-8?Q?yFnC962orKE3V+OPRvGAIdZ7j?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E5800DA94E4004D9D48C4D0703890D7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Y0pTVEJ1bDlJWXJYZGNtTEpkMUJoVEx3Q1FLN240eUdFOUIvemtlU0tXWUtI?=
 =?utf-8?B?RXdPT2lTMWdObiswQlpCOUV1SUgzUHN1dUR4RXN2L0cxUFJ6YWpGanNwQ0Nr?=
 =?utf-8?B?ZTROdFN3SmtzWFRtUmFXemNzaXI1M3F4TW1IS29EWGRKRWJDRjhJTGNHQVMw?=
 =?utf-8?B?R3hSSCtWZkQwVk9pSmtNM0tHaExJSGpCMkd0OFYrRDE2QVlmandzNXM3RzNL?=
 =?utf-8?B?ZVB5NUNaQVB6UHlNQVE5SjcvMnpWMlo4TjVENHh2VDZiMmlZSS9zak11TjBp?=
 =?utf-8?B?aVRqWkhKcFRac3Q5V24rblBhREpGVG1jdTl0ZmNJR1JhRFcwR1JIdWVyNzVo?=
 =?utf-8?B?WXJhOGRZczc0V05VQXNNaHlaSnhzVFhsMVA0TlIrUEdWZFVYWG1iZG9EQiti?=
 =?utf-8?B?RGZ4aFdDeDM3MTZZYUtBZ0ZsQWR5eFJ1QTVlRm95U09NL3RuVE8vdnlRUXp3?=
 =?utf-8?B?bjdvODY3b290VWNUTnBKeDlzd0NEQy83ZUpOMmxUTlZuSXBUZVdFM1A1MFAv?=
 =?utf-8?B?R3p0bkkwZmhlbnhIMGVFV3d4Q2xjMTNEN1UwTWhJMjBLNUpacWovZlV1Rmxp?=
 =?utf-8?B?bEwwT1p0dzFBalpTcTB4Q2puaFBBbWVvditLR2V1b0NCTWMvVUppTzN0UXo2?=
 =?utf-8?B?aG01Qm5TYVhsNHl0UUhiR0VQYkZBbTgyRjRpWkh6dUQxV1ZlRVhIM2xuemtj?=
 =?utf-8?B?WUkrNFEwZVJUWnhFNFo2OHcwa0tycmw5WnllYlJvRHFEL1Y3OWxmS0c5Mkc3?=
 =?utf-8?B?My8vaWMrUFV3VzBDaU9oUVRwYmgrWWI4RGNzWWpmMUx6WFFwWlNXV0FrMmp1?=
 =?utf-8?B?Q0JPR1ZuN1BQM0h2bnR4YVpRMUd6Tnc4Q3JJdnVPVEJhdGh3Rk53MzdiWmhN?=
 =?utf-8?B?dTBGNXI2LytqdURhdjlucy81cVhGUlJQWDZIYVNMN2VtNUxCYWgvR1NKQzZK?=
 =?utf-8?B?YytaUHd6NU9VREhwNUJhMDd3VEx4MDFOOE9FLzR3YzVTTVpPWEUwSnJPbjBS?=
 =?utf-8?B?a3JPVzdHMGtGc3h1azdmYVBiT04vcW9NbGpYYmk2Si9MS3FsazVUcHRCMHFV?=
 =?utf-8?B?ay9qTHQyQkQ5TWZXTUxZTEtSVGg3azR0SHlHS3NLSC9YN1ZQbW1tMWROend5?=
 =?utf-8?B?RmZEQjhjL2lBSVE4UFo3cHYwZXdQaWh3TGhsRXFpaEFjOEgya2lWQlJyQjcy?=
 =?utf-8?B?T2gza2pRc1hYL3BiMTkzR0ZpQlJoc1NQZDZkMTlJU0RFb2poTnlmNEwvR0dQ?=
 =?utf-8?Q?bPjDcTbb6ZAp6xy?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0ba417-bd89-40f5-65eb-08dafad71545
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 11:11:30.7972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e2lGkKwdbbCktWvpREjIpX31YnQG45hEs7qPb9t6sFydk+rCzGBugA/l9dWUUWSg3IiStKMnxHpR9Tf+jUwebozR0lOT80Kuwi8icaCLm4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6051

T24gMjAvMDEvMjAyMyA4OjQwIGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gV2hpbGUgdGhpcyBo
YXMgYmVlbiB0aGVyZSBmb3JldmVyLCBpdCdzIG5vdCBjbGVhciB0byBtZSB3aGF0IGl0IHdhcw0K
PiAodGhvdWdodCB0byBiZSkgbmVlZGVkIGZvci4gSW4gZmFjdCwgYWxsIHRocmVlIGluc3RhbmNl
cyBvZiB0aGUgaGVhZGVyDQo+IGFscmVhZHkgZXhjbHVkZSB0aGVpciBlbnRpcmUgYm9kaWVzIHdo
ZW4gX19BU1NFTUJMWV9fIHdhcyBkZWZpbmVkLg0KPiBIZW5jZSwgd2l0aCBubyBvdGhlciBhc3Nl
bWJseSBmaWxlcyBpbmNsdWRpbmcgdGhpcyBoZWFkZXIsIHdlIGNhbiBhdCB0aGUNCj4gc2FtZSB0
aW1lIGdldCByaWQgb2YgdGhvc2UgY29uZGl0aW9uYWxzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

