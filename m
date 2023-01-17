Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96361670E41
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 00:57:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480020.744176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvpY-0005J3-By; Tue, 17 Jan 2023 23:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480020.744176; Tue, 17 Jan 2023 23:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvpY-0005Fq-83; Tue, 17 Jan 2023 23:57:28 +0000
Received: by outflank-mailman (input) for mailman id 480020;
 Tue, 17 Jan 2023 23:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHvpW-0005Fj-HR
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 23:57:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af5c1deb-96c2-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 00:57:24 +0100 (CET)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 18:57:16 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by BN9PR03MB6075.namprd03.prod.outlook.com (2603:10b6:408:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 23:57:14 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::a8de:fe00:94a6:dd09]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::a8de:fe00:94a6:dd09%7]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 23:57:14 +0000
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
X-Inumbo-ID: af5c1deb-96c2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673999844;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KOOzchN/nckgqCP5QYHmWObBV7SJUAVKIFGbdE4icIY=;
  b=SzhS+kJ4pLL56fTPMT+iuOOiamFRhGA4uQv89f+exW7NpAHUFz1qPs/j
   VfQfxp34oenhYQ+DCWTJScNxYe+M++fedtDogofpoXrgKpzt90CegQV/j
   JG14Rf9+lI9a9KllpKko8bujmXXYDhO9air5JOrwDRLeW/O/uO56VTwWq
   E=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 93115561
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hIwbdahGDcsnFbHA07ngruRxX161PxAKZh0ujC45NGQN5FlHY01je
 htvCzqPbPmDMGf2e4h+aoq+9EIG6J7VxoAxT1BppSlgHigb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5QaBzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQFKSEhcFPe1tmG+7m0EPBzoMUyCfjSadZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGyb7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6Rebhr6M33gT7Kmo7NxMMCX+wgNmCrA2gfcIPL
 FYp9AsJsv1nnKCsZpynN/Gim1aDuhMfQNtRVe4n8gaGyqnTywmcD2kACDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcAbyIZSQoO4/H4vZo+yBnIS75LErOxj9DzMSH9x
 XaNtidWr64IkccB2qG//FbGqzGhvJ7ESkgy/Aq/dm2k5wV9eYWsT5ap91/A7PBLao2eSzGpt
 n8OkdmT9+AKAJSEkgSCRewMGPei4PPtGDTYgEVzFpg7sTq38niofJt4/z11YkxuN64scjjvZ
 kjRtQpP5YR7M36jbKsxaIW0Y+wgyqLqBJLoTfDQY99HZLB+cQaG+GdlYkv44oz2uE0lkKV6N
 ZLFd8+pVC8eEf4+k2XwQPoB27g2wCx43XnUWZ3w0xWg1/yZeWKRTrAGdlCJa4jV8Z+5nekcy
 P4HX+Pi9vmVeL2WjvX/mWLLEW03EA==
IronPort-HdrOrdr: A9a23:bnEiVKDNfp/NjsrlHeiEsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX252oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD6nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZJB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3M4iFQJuYdI99RDBmcca+d
 pVfYfhDTFtAAqnhkXizy1SKRqXLywO91m9MxM/U4euokVrdThCvjclLYok7zc9HdsGOud5D6
 6vCNUWqJheCsARdq5zH+EHXI++DXHMWwvFNCaILU3gD7xvAQOFl3fb2sRD2AiRQu1/8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBGGwRy7kxM1S74Vw/uSUfsuhDQSTDFQ118ewqfQWBcPWH/
 61JZJNGvfmaW/jA5xA0QHyU4RbbXMeTMoWsNAmXE/mmLOCFqT68ujANPrDLrvkFjgpHmv5H3
 sYRTD2YN5N60i6M0WI9CQ5m0mdD3AX0agAY5QypdJjubTlHrc8wjQ9mBC++tyBLyFEv+g/YF
 Z+SYmX4J+GmQ==
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="93115561"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KN8BLxM4Vv6ArNtbC79jr/VAyKmiZuGslT2zbpG2rGTZI71GFjM1jZeVOXahDwssViGcFPhuFhb6seA+5gKV+OxlMHocpLiv27HK8Hoh1SRkv8SytwOsyJo73z4+hv7xbPdzor1Ga/kUgjINopHu8guoFJukTmKgbugSSCe8RRa7/d2wGLiS4m3U4oBZQa984PX/us4oThKKWUw6epnca4e8xnBR+SBZzmzxUC5RhpTFImFPIzQwnUePtgCsu4I1XMI3KhNJPBN2G8CbYc+jaKoO0Fc45ocERWboXdCO6t3Cg2Ge5T9whVs4SV7l6npNDGaNTDj6xC2s8FPQYR5aDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOOzchN/nckgqCP5QYHmWObBV7SJUAVKIFGbdE4icIY=;
 b=a5LiYphTsmYGZtNthb5b1i/0jS7PBZJVYFCOgFAfd1FdsswxADeJLLLzxkV1Z/Ho5M/rm+X7aXjCGDiJ8+ahV2h3Tn7/YxAEliJSEm4aJv4VZdUBTlnesR4uBHjn7tiOKbl4/De81ZjRPN8KgrM1oNjA3q/ubSX7gJiW5Wnyo2DnCKr5eSQjgzh2I+lshdAUdheYxNx1ATXJJ/VWf9QtL7SQOl5LXQtXlB0a+qMIi36B1FS6M1hws6FONz9m4X0y269cHkkj+4Xzmz0SocOIjqhrWRjzake2Nma0RuXV3Vg1rzxqhyBHZtacuhc/W3Jtc870KdZefqfmJqdcCwOIlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOOzchN/nckgqCP5QYHmWObBV7SJUAVKIFGbdE4icIY=;
 b=EWe3VoZZ6kkgbpvA2AGtsikdo/v5MmH6+V5hoym00GCzj6RKWWe678hT7BYxRLObEXXZ6B0bUcy5xuY7O5tGV+cFQDodAtfN1x3LNet9iH6+g0jGpPZ/eojiF0NlU1Ly3pHaEpXUI+RnwfXiKrTSDUYtGSyiJ4I5fB7I9nBhhFk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Bobby
 Eshleman <bobby.eshleman@gmail.com>
Subject: Re: [PATCH v4 3/4] xen/riscv: introduce early_printk basic stuff
Thread-Topic: [PATCH v4 3/4] xen/riscv: introduce early_printk basic stuff
Thread-Index: AQHZKbhjN4vcDNwMek+QkGCbNS8YNK6jS2WA
Date: Tue, 17 Jan 2023 23:57:13 +0000
Message-ID: <d0cabe82-315e-408c-7364-33e2b5093ee6@citrix.com>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
 <915bd184c6648a1a3bf0ac6a79b5274972bb33dd.1673877778.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <915bd184c6648a1a3bf0ac6a79b5274972bb33dd.1673877778.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|BN9PR03MB6075:EE_
x-ms-office365-filtering-correlation-id: 4c84a96d-2436-4e88-157c-08daf8e68e49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ddSVq4IT6r2b9PswcPW7q9iHxpC+IMGMJrmmH3+3rqCRUgOIfBCNGIuIEuYickGhkoDi5kN5IHN0hAvwt+rZ/M0V88jzWWGNRp0Ks8thoiZkqOVsIwzlSBZ9AooqY/xcGKuVGLVsjmL3+xiVnxDHT5YDYrfI8cpiVv9FX14+A/Ta0q8rvDXHV/p8fGtVcIvVh+jVS7bPqY+E3k9tSL9raJ4QbZxFq5xGzunofLkpJ7YXhKhMwo1DCOrgNjp9SQ/Z0jwk2ylebVlOOElgpat3tRp/qHfYIe+fxMgKXU252B+yYElAIbG70LPhu5IOs2Di8vLOEjnfbtg3PX1r5bCXL5pub368tJEesfwk7anlQaoqDeeBmCI1lBRhqefN4Yru6t4wnWDwVUmabFaFjY3a+7qZL1vsYMmsjH3Jp07PrrijV+gCmX/BirUZA/oDQmg268H5m6Cr6Z4bqGDAB1Z7QIBUb/9EPqhYYStIkyP+IcDXcGrue8eEswGsoH8VsoBvfWYnBGxhFbTQ6Fx/7v/V8HrlIJZkz/cPcdabPuFJY/BirLXqLbFOwIrpHF1JcuoZaCA9SwRPZTKRqQEkrV1kNPztpOcBM4QjG+l8qLCQaQSZWQecONQqJbmVBiIMtH+PhGkq6HDmBqDpjn248LyA+QX0jV8ZLlMWR1p8Ws6HJiog10zueEhmlbVNIjowW1L7KQDhwfhzcICi3/1wfxpDAziiht9FX899IS4ikLNI62sKj/bF3H4kohZhmELPQ6+oJIoU7guvVTkvCu/gRuN4Uw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199015)(54906003)(71200400001)(2616005)(110136005)(91956017)(4326008)(8676002)(66556008)(6512007)(66446008)(26005)(76116006)(64756008)(66476007)(186003)(66946007)(478600001)(31686004)(41300700001)(6506007)(8936002)(83380400001)(5660300002)(7416002)(2906002)(53546011)(122000001)(316002)(38070700005)(82960400001)(38100700002)(31696002)(86362001)(6486002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXRyS2tBSVk4SzFGS0h2NzgxaFVSUXBrd1VpWlR4dnBPbmhNVGRjRGg3SXlU?=
 =?utf-8?B?Z2JDS05JaHlmRkRObTdJc1BXS3pPTjBuU3dtbzY3M0RWM2lnRm84SitMejZm?=
 =?utf-8?B?SGtDUjRzNTZwZldHczVrbHpseUQzUmFHUnU0N1dwV3hlbzJpemxOSzlyZWVx?=
 =?utf-8?B?RVdsQWxNN3NlTXdXMlFTWjRHcUxrNmhOeW1SMzdPUWFPZFFaNStSZnlOdXVk?=
 =?utf-8?B?K2xScGYzMmdaSVBJRWp3Lzh0WXRIRGMwS25tMFFXWFljRWxydFJWK2FGQmtV?=
 =?utf-8?B?eW14R1VVZ1M1aGpwRWxTa3ZMdGhOcEhNS0FTL3NvYWhEWFE2Yy9RNlUwUWxu?=
 =?utf-8?B?Nkp1L2h1UWh0VUxQNU13RldRS1l3UDJsVEFLWjFQY0tqb2tUZnVMdDVreTRT?=
 =?utf-8?B?R3JjMDFPaVcybStkZlF5SmNsR09vMHBqa1FYRzJ0K01oMHpMa016UnYvNFJQ?=
 =?utf-8?B?SzJFNHBVeEtka1F5SnpnWDRVdHl1YkhhRjJWMi9sQ3kxQm9SRVZ6V1E5UHZ3?=
 =?utf-8?B?dWdGMURGS1dlMGVOTEd2Zmd1QXVnQlpQamtyU29HR1ZCT0d5Zy9zaXhtR3V1?=
 =?utf-8?B?L2NqbDhId0NDZndNN1FrRVlsc2dNNG9MZEVMcXdFdk9hWG1LLzZ1S3FaVWZi?=
 =?utf-8?B?OWRINVBiSHJDZlMzQ2Q3SklBcU80c29RaFdZZlJEd0dod3FMd2hVTWVacDFV?=
 =?utf-8?B?UjBpcngyWHVzQTFWVWdqT00xVlZjQ25VdTdVL0ptUHQ5Q2w5TTlxY1M5OGpH?=
 =?utf-8?B?WE5Ia1hnNFN0cE05d0tBR3luRUs2bFdic3UrOUZzcDBzbVBLRlExckovM0Nn?=
 =?utf-8?B?U21RZ0UxSHlPN1gybk84MU9pNGlVUjI1T3F5YWpOZWt3S2VQUk95L1NGRERW?=
 =?utf-8?B?WnBtblU0VFBjbVhRMm1pOTdKa1JOU3NQWW9GenZ3eTZ4amt4Q2FPODF0alpC?=
 =?utf-8?B?Qkk2amltMWo2R3Fad1JlUzZzWEM3VmVoZ1UxelpHZCtodXU3N2N4aHNIeGFs?=
 =?utf-8?B?a09hZnFpNzFOcGwvWTJiM3BQTVdTem1lWW9zSm93aHNTTUprVG5lRXlIbXZT?=
 =?utf-8?B?amkvLzBYUDEvOUVvNEt6NXRWQXRPQ0VqZHZ0SGRwOUNxQU5BdWt3UnVHME0y?=
 =?utf-8?B?Wko3bytwOFBTenB2aFB5QVhoRWpoVW9rSUJ1ZTZtK0pFZytXTnVTZm5wdXpL?=
 =?utf-8?B?TEQvMloyalVCdmVUV3hWM1VUeW5hMVNzUGg5TUdaUmowK1FmeHhrbzY3SGRS?=
 =?utf-8?B?RVpXMlhBcmZ2ajcvMzRvcnJROHdTMGwrZXdiVnp6eXRLa1pNTWY3QmRPdUIr?=
 =?utf-8?B?dGhNdFA2Nzk4REdRSHlKK3dHMU9QQ1NTY1FrTFQ5QW4zT0dPU0Z1OVkyMFNM?=
 =?utf-8?B?SEdnbEFpcW5saGJKRGk1WXFYeVNvQlJuMGpobFNEQTBOOGxqdmR2UXhtY01s?=
 =?utf-8?B?M21DWCtkZEpHK3lmOEFuNzgwdFlrWXRwVFV1a2oveVQzaGlFUlZtS2pVaXV3?=
 =?utf-8?B?N25TOTdmdUd3L25XV3J1Y1UycnZrY1JLam55SW1OUXdJUWwydC9EWFlYL0Z0?=
 =?utf-8?B?cXd3N0JsNTVycEpCWnNjSUdENUpTNEd1WEFBazE4Z1h5dkl0NlZ1blc2V0NK?=
 =?utf-8?B?QU1VSWhnWGxQK3orVkxEemhZVEcyZnhWZ3RGOTY1NjQxYkxCdzdKNGp1SDBy?=
 =?utf-8?B?ZkZ4ell6VFFlOE9Dd284VjNFZmc2OTNCQ0REQlgyd2xreDUrM2xzTlRsYlRZ?=
 =?utf-8?B?UStvbktpVFREb2VFY3FtTHg3cmgzRUpJZFJtVHpOWDY3QlBHWDRlUVFwaVVS?=
 =?utf-8?B?Mk1hSmhoQUhRL1ZuU3VJTGxLNDJnV0l6VzJYV3FKUjhra0s3ZjRDL21rbmY1?=
 =?utf-8?B?djlyWWp3VStKUnZMNlIyQ2w2dmpaWlFrczdSQmZBK0ZieUM0WEF5Zm9JODkz?=
 =?utf-8?B?RTBzd2ppUVZoQVVEd1Z5RU5jTEptbnRZNjNJMzNta0tram1UZkcyS2dxbTc1?=
 =?utf-8?B?TlB4Qy9zQ0NsQlZ4b2U2SFpzN1JwZXllOTNVZktTUUF2TWdiaXRaaVVMSTNY?=
 =?utf-8?B?QzBOQytweTlBaGxnVGd0YzMrVVkwUlJhRFd0TkdWdnliKzgzb3NUMkErZnpT?=
 =?utf-8?Q?SZvsLxLbWUNTmTmr22Y/Lls6H?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11AAC1C925A2174BAB645FC82B543494@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?bkptWW5EWkRiVGpjaUtFb05GWDIvMkE4clhIOU5yb2xZWE1Db1hERmtGN2tF?=
 =?utf-8?B?VytGbklGUXFKYWQvZFQ4UjFNdFlydzQ3SW4rSVN5TnNZT3pKOVp2WlpWSkpT?=
 =?utf-8?B?cElwZi90ZWVwZXozR1g0NjF4NVMzcUhxV3hPYVVDaXZaSnpheVg2bEdnS3Q2?=
 =?utf-8?B?WGJubUhrRCtOZUZXb0ZscENsam9OMnJDQkJTZktPUER2b3JsNVlXUmxWc2g2?=
 =?utf-8?B?MFdieVZaakh3cFhJK1JEUURJM2NEcjZUa2w1Uklhc2VmaGZyMXYwU2VMQ1Fa?=
 =?utf-8?B?dUtXZDM2NENxRjUrekpuK2Q3RWVyKzNVclpwTm13WVVxOVBBMXl1Zm96cTNi?=
 =?utf-8?B?cFArODBtUklWVCtweFphaDVXT3E5REx0enhodWFKdEtKZWZsQ0c0L2x3SmJm?=
 =?utf-8?B?a1c5dW84bHZNeVNPNVYzRXJkc0lTRzhyY2VYUzZiUXhjMUQ5cUNKMFRYVFBs?=
 =?utf-8?B?dE1sdTJzZTBpRW4xQjAzSVpLa1dxZGtIZGZhZXhLN3JWdG5SektUMkZpYjNa?=
 =?utf-8?B?UDlKb1NMZ2xhTnRyZ3ltTFJoN1B0djVpekp5cC83eDg5QWt4Q0wzMGlBWkhp?=
 =?utf-8?B?OWRTQmNXZ2JSMnpkZjFKYzdRcVFxZU9GSE5LRGZiaFhKSk1TZFRjUStDbEYw?=
 =?utf-8?B?WllMNHRqMG9sWG9mVEFmclg3RFVObiswZy9BMUg1L2dIUHVvOWxtUXpjV1dq?=
 =?utf-8?B?YnE4UkV3TjZYbVBGcCszazRCM1k5VnduM2tSalZlb0lpdmJVRFBqOGNQNmdI?=
 =?utf-8?B?VnNhRWR4cGRBVndSQ1hJWFNZOE5ReUVSQ0Q5MXhLNkxuYmE1djZHZ2YxcXJ0?=
 =?utf-8?B?anQrbXJnTTR6Zk50bW9UZWRMalgrNmFEQ3RUUWtBN240dVZuY1J0OWpZY28r?=
 =?utf-8?B?Syt5NnBId1IxWlVtRlJmeVZVa2wvWkZlaXc2M0ExQUQ5MXBzKy9lS04zdDU5?=
 =?utf-8?B?V240ZXhWSllQSHVMajAyYTNWUFlQdy9mRmJjQXQzVVdSUUsrYVhybkpLWFc0?=
 =?utf-8?B?K0g3L3NNaHZMT1BRY3Z5NXM1UTdIZlpwcDN4Wi9iOERTdDVQNXdyR0l4Zmk2?=
 =?utf-8?B?RjRUODdHekxmNWZiR1RFR0plUTJhaCttNENpNnRhRFhmT05hRjAralJlbEpu?=
 =?utf-8?B?Rmc0L0pJR0sxSXM3RnNBUTJRMy84dlN3VEg3QVRIR3EyZnhpSVJtemMwY2ha?=
 =?utf-8?B?L0RiSmZlWUtHVm4vL2RpRWdLYVcyVkFBT1doNkYxYkkzRklJOGxrTWx6R05E?=
 =?utf-8?Q?8XDdFVVgybZjjTi?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c84a96d-2436-4e88-157c-08daf8e68e49
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 23:57:13.9042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Q1euHeT+FzkPxgKtOiBkiY1Otmu6qsdyKkEupdksh6JDd/geaSBt0SJH8ZfQYqQwzKPN9CY8es1i/UkLXN4GuPOUkpQ8rGNjTc8ay9ikbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6075

T24gMTYvMDEvMjAyMyAyOjM5IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvcmlzY3YvS2NvbmZpZy5kZWJ1ZyBiL3hlbi9hcmNoL3Jpc2N2L0tjb25m
aWcuZGVidWcNCj4gaW5kZXggZTY5ZGUyOWJiMi4uZTEzOWU0NDg3MyAxMDA2NDQNCj4gLS0tIGEv
eGVuL2FyY2gvcmlzY3YvS2NvbmZpZy5kZWJ1Zw0KPiArKysgYi94ZW4vYXJjaC9yaXNjdi9LY29u
ZmlnLmRlYnVnDQo+IEBAIC0wLDAgKzEsNiBAQA0KPiArY29uZmlnIEVBUkxZX1BSSU5USw0KPiAr
ICAgIGJvb2wgIkVuYWJsZSBlYXJseSBwcmludGsiDQo+ICsgICAgZGVmYXVsdCBERUJVRw0KPiAr
ICAgIGhlbHANCj4gKw0KPiArICAgICAgRW5hYmxlcyBlYXJseSBwcmludGsgZGVidWcgbWVzc2Fn
ZXMNCg0KS2NvbmZpZyBpbmRlbnRhdGlvbiBpcyBhIGxpdHRsZSBoYXJkIHRvIGdldCB1c2VkIHRv
Lg0KDQpJdCdzIG9uZSB0YWIgZm9yIHRoZSBtYWluIGJsb2NrLCBhbmQgb25lIHRhYiArIDIgc3Bh
Y2VzIGZvciB0aGUgaGVscCB0ZXh0Lg0KDQpBbHNvLCBkcm9wIHRoZSBibGFuayBsaW5lIGFmdGVy
IGhlbHAuDQoNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3Jpc2N2L01ha2VmaWxlIGIveGVuL2Fy
Y2gvcmlzY3YvTWFrZWZpbGUNCj4gaW5kZXggZmQ5MTZlMTAwNC4uMWE0ZjFhNjAxNSAxMDA2NDQN
Cj4gLS0tIGEveGVuL2FyY2gvcmlzY3YvTWFrZWZpbGUNCj4gKysrIGIveGVuL2FyY2gvcmlzY3Yv
TWFrZWZpbGUNCj4gQEAgLTEsMyArMSw0IEBADQo+ICtvYmotJChDT05GSUdfRUFSTFlfUFJJTlRL
KSArPSBlYXJseV9wcmludGsubw0KPiAgb2JqLSQoQ09ORklHX1JJU0NWXzY0KSArPSByaXNjdjY0
Lw0KPiAgb2JqLXkgKz0gc2JpLm8NCj4gIG9iai15ICs9IHNldHVwLm8NCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3Jpc2N2L2Vhcmx5X3ByaW50ay5jIGIveGVuL2FyY2gvcmlzY3YvZWFybHlfcHJp
bnRrLmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uNmJjMjlh
MTk0Mg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2L2Vhcmx5X3ByaW50
ay5jDQo+IEBAIC0wLDAgKzEsNDUgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wICovDQo+ICsvKg0KPiArICogUklTQy1WIGVhcmx5IHByaW50ayB1c2luZyBTQkkNCj4g
KyAqDQo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjEgQm9iYnkgRXNobGVtYW4gPGJvYmJ5ZXNobGVt
YW5AZ21haWwuY29tPg0KPiArICovDQo+ICsjaW5jbHVkZSA8YXNtL2Vhcmx5X3ByaW50ay5oPg0K
PiArI2luY2x1ZGUgPGFzbS9zYmkuaD4NCj4gKw0KPiArLyoNCj4gKyAqIGVhcmx5XyooKSBjYW4g
YmUgY2FsbGVkIGZyb20gaGVhZC5TIHdpdGggTU1VLW9mZi4NCj4gKyAqDQo+ICsgKiBUaGUgZm9s
bG93aW5nIHJlcXVpcmVtZXRzIHNob3VsZCBiZSBob25vdXJlZCBmb3IgZWFybHlfKigpIHRvDQo+
ICsgKiB3b3JrIGNvcnJlY3RseToNCj4gKyAqICAgIEl0IHNob3VsZCB1c2UgUEMtcmVsYXRpdmUg
YWRkcmVzc2luZyBmb3IgYWNjZXNzaW5nIHN5bWJvbHMuDQo+ICsgKiAgICBUbyBhY2hpZXZlIHRo
YXQgR0NDIGNtb2RlbD1tZWRhbnkgc2hvdWxkIGJlIHVzZWQuDQo+ICsgKi8NCj4gKyNpZm5kZWYg
X19yaXNjdl9jbW9kZWxfbWVkYW55DQo+ICsjZXJyb3IgImVhcmx5XyooKSBjYW4gYmUgY2FsbGVk
IGZyb20gaGVhZC5TIGJlZm9yZSByZWxvY2F0ZSBzbyBpdCBzaG91bGQgbm90IHVzZSBhYnNvbHV0
ZSBhZGRyZXNzaW5nLiINCj4gKyNlbmRpZg0KDQpUaGlzIGlzIGluY29ycmVjdC4NCg0KV2hhdCAq
dGhpcyogZmlsZSBpcyBjb21waWxlZCB3aXRoIGhhcyBubyBiZWFyaW5nIG9uIGhvdyBoZWFkLlMg
Y2FsbHMNCnVzLsKgIFRoZSBSSVNDLVYgZG9jdW1lbnRhdGlvbiBleHBsYWluaW5nIF9fcmlzY3Zf
Y21vZGVsX21lZGFueSB2cw0KX19yaXNjdl9jbW9kZWxfbWVkbG93IGNhbGxzIHRoaXMgcG9pbnQg
b3V0IHNwZWNpZmljYWxseS7CoCBUaGVyZSdzDQpub3RoaW5nIHlvdSBjYW4gcHV0IGhlcmUgdG8g
Y2hlY2sgdGhhdCBoZWFkLlMgZ2V0cyBjb21waWxlZCB3aXRoIG1lZGFueS4NCg0KUmlnaHQgbm93
LCB0aGVyZSdzIG5vdGhpbmcgaW4gdGhpcyBmaWxlIGRlcGVuZGVudCBvbiBlaXRoZXIgbW9kZSwg
YW5kDQppdCdzIG5vdCBsaWFibGUgdG8gY2hhbmdlIGluIHRoZSBzaG9ydCB0ZXJtLsKgIEZ1cnRo
ZXJtb3JlLCBYZW4gaXNuJ3QNCmRvaW5nIGFueSByZWxvY2F0aW9uIGluIHRoZSBmaXJzdCBwbGFj
ZS4NCg0KV2Ugd2lsbCB3YW50IHRvIHN1cHBvcnQgWElQIGluIGR1ZSBjb3Vyc2UsIGFuZCB0aGF0
IHdpbGwgYmUgY29tcGlsZWQNCl9fcmlzY3ZfY21vZGVsX21lZGxvdywgd2hpY2ggaXMgYSBmaW5l
IGFuZCBsZWdpdGltYXRlIHVzZWNhc2UuDQoNCg0KVGhlIGJ1aWxkIHN5c3RlbSBzZXRzIHRoZSBt
b2RlbCB1cCBjb25zaXN0ZW50bHkuwqAgQWxsIHlvdSBhcmUgZG9pbmcgYnkNCnB1dHRpbmcgdGhp
cyBpbiBpcyBjcmVhdGluZyB3b3JrIHRoYXQgc29tZW9uZSBpcyBnb2luZyB0byBoYXZlIHRvIGRl
bGV0ZQ0KZm9yIGxlZ2l0aW1hdGUgcmVhc29ucyBpbiB0aGUgZnV0dXJlLg0KDQo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9yaXNjdi9zZXR1cC5jIGIveGVuL2FyY2gvcmlzY3Yvc2V0dXAuYw0KPiBp
bmRleCAxM2UyNGUyZmUxLi45Yzk0MTIxNTJhIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9yaXNj
di9zZXR1cC5jDQo+ICsrKyBiL3hlbi9hcmNoL3Jpc2N2L3NldHVwLmMNCj4gQEAgLTEsMTMgKzEs
MTcgQEANCj4gICNpbmNsdWRlIDx4ZW4vY29tcGlsZS5oPg0KPiAgI2luY2x1ZGUgPHhlbi9pbml0
Lmg+DQo+ICANCj4gKyNpbmNsdWRlIDxhc20vZWFybHlfcHJpbnRrLmg+DQo+ICsNCj4gIC8qIFhl
biBzdGFjayBmb3IgYnJpbmdpbmcgdXAgdGhlIGZpcnN0IENQVS4gKi8NCj4gIHVuc2lnbmVkIGNo
YXIgX19pbml0ZGF0YSBjcHUwX2Jvb3Rfc3RhY2tbU1RBQ0tfU0laRV0NCj4gICAgICBfX2FsaWdu
ZWQoU1RBQ0tfU0laRSk7DQo+ICANCj4gIHZvaWQgX19pbml0IG5vcmV0dXJuIHN0YXJ0X3hlbih2
b2lkKQ0KPiAgew0KPiAtICAgIGZvciAoIDs7ICkNCj4gKyAgICBlYXJseV9wcmludGsoIkhlbGxv
IGZyb20gQyBlbnZcbiIpOw0KPiArDQo+ICsgICAgZm9yICggOyA7ICkNCg0KUmViYXNpbmcgZXJy
b3I/DQoNCn5BbmRyZXcNCg==

