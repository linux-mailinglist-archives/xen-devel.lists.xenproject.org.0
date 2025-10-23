Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD5C005F9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 12:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148943.1480760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBs7N-0006mt-5h; Thu, 23 Oct 2025 10:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148943.1480760; Thu, 23 Oct 2025 10:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBs7N-0006jv-2e; Thu, 23 Oct 2025 10:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1148943;
 Thu, 23 Oct 2025 10:00:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBmZ=5A=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vBs7L-0006jn-1d
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 10:00:23 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14950999-aff7-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 12:00:18 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GVXPR03MB8403.eurprd03.prod.outlook.com (2603:10a6:150:7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 10:00:14 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 10:00:14 +0000
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
X-Inumbo-ID: 14950999-aff7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUeDHJCMW7W6IPZKHiF35XcdESvOJCzgJEUc9B64d+sAcaw0lMArrT6YmOICNpEJZQsvmyQxAuIXPcc5EyjFf/7EK0NFrP5kVcAwTzBiLQhrmYLG3jJz0k6++4d7b7OawY3Lf1Gb6ETqp0tf96D0nkk/Wgm9lAY4LB9nrSNzOs8tprt/iv8BNkcluwZuQvmi3UNSQ+pXF5qFbLHJ+IKF1kFIHsGIioBgKgGQc7Cb6eFjna3ddw3bTvPvef9X2fyS9bDbpNog3yW6RkzPhP1Bz6gUQzJYKP6y+blNINyTyEw14CO1wDLTvlHkO2dLonhMWNM4jGID2lJmy9iCPcKHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rabsGKobnCa5JgieRN6iv6k9/C+gcZ/PhdNVSQvyyQk=;
 b=hQzRqaGIp2OvqwFtxaiQupn4Bx9el11TcumHxD3NwYB3jygHWNOgI2qaAP0u+L39t4MeAOyl1HkfVE+0gEEzVF8/rvj8vklWM8LYqfbgUz/cH4aT8RN7ii0QjVZV1KQSBWiL14VVRKQudaW/SJuXOI+JvoFd4vJ8TjQlHkg18EauAnzycwO1BQrvGeIVCNoa/tTNrRA4cmn62zTZt8no0QXnoPHYdjIZXdyWH3aTP9OUW0Pk4a82jHVbUWz4fwbpJNxOKf0uhG1pG+cyCLUZLsbPxjuUyyzmyVD0/yW9ynprfjZcGIDvhDr3RiVkgC4pxvamVyYH/uICfdrwGhYWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rabsGKobnCa5JgieRN6iv6k9/C+gcZ/PhdNVSQvyyQk=;
 b=aAZabOm8WMWMKnNTl20ZV39+kaYQ4QI8GTa902rc+AGVHMjwjhgizApHR5cjWEhPJgPw5ON1OzSEvtFZ2Zi/WOLWMSCTwEf/xdDVfI/67eLdplrB0YFX0XHvvctLYs7BHOvc0Aaz6TjdyQcMuB5EmL8JoLPmakNjqLfJb+B8GEtmAY4cn1x9RGGWjg+/n3DS9YnWQvDqpqOC/ee7Sdg8tek/wNLYdFh4l+XYPtYJwodiozhO66/QOPfTla4rqbpCqTa+jTePxUbxLejIul6M9pp0v7kgl4R434Hbq89fz0h+zQjf/hPci3yul+5xaBww4FdOF+rxgGSKRZLT9sfj9A==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Topic: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
Thread-Index: AQHcPSX2fWa1eZv9x0mRzqs7fz2kjrTCvSwAgAMyXQCACZ3PAA==
Date: Thu, 23 Oct 2025 10:00:13 +0000
Message-ID: <0767a5c4-6a2c-4ed0-92d3-f9f89313ad85@epam.com>
References:
 <0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro_prokopchuk1@epam.com>
 <ceedeefa-c506-41ca-9dfc-76937979caa9@suse.com>
 <321363444f9a3d3471bf1b3b2e020047@bugseng.com>
In-Reply-To: <321363444f9a3d3471bf1b3b2e020047@bugseng.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GVXPR03MB8403:EE_
x-ms-office365-filtering-correlation-id: c20cfe48-f121-4f2a-cca2-08de121af5f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y1JCdUc4ZHNxRjg2OWV2dFZiSTJEc1BmNng3cC9kSDVHYXUvMnlPcXh0OS91?=
 =?utf-8?B?MnZjVjRvd3MxcWJOaGRKbkxIdlpKb1paOTdYN1BDdUtobTczYjh1YkhPaEdR?=
 =?utf-8?B?aS9CcGNLSHk5K3VOc0haVUJFWk9SajNJNVRiaDlBbGpYazQzMFM5T0Njb3dv?=
 =?utf-8?B?eUp5YXNsb1JleWo4ekMxMWE3K0JrQ0FuMFY3d291VDM4U1hwN3Vkdk1Ma3U0?=
 =?utf-8?B?YWcxVUZJdlRKZGNRUTVvOUVkR0hnVVBzcGFvSExSUTMvWGhBM0JxaGRBakJu?=
 =?utf-8?B?NHdka0pVZ3pkUTJTQ0p0NTYzYUdoU0ZSV3R1dCtqK0pMenhrYUEwSEJPNWJD?=
 =?utf-8?B?blpMTjZPYjQ5ZUc5VnhLME9MSmM3cmU4ZnhtN0pBZzgxbzdMQlp3bXR2NWtj?=
 =?utf-8?B?dlNyWEZsK2ZUdVpleE1kbVVOSWFUWVJDK2R3NncyWmxZTEU3b25GWFhjVSt4?=
 =?utf-8?B?VHY2NndHMVV4anVHOTJrK29QeENkRlZ2OGRIVEFTYnBJcXl5QUdjdG9PZ1RJ?=
 =?utf-8?B?aFQ5Vnh5eE8xRWFERGxkSUxPU2ZxMVpWanA2SVdmVHljTmJ0Z0tqOTl2Uk1p?=
 =?utf-8?B?NWVwQmFlSHJ2RENVN2R5NjJqK3l0TExwN3lMVmVUMnEvU0l6U2VKa0FwSE8r?=
 =?utf-8?B?OFlYd1ZsWU9PMlR6ck5iRVdWQi9aSlU3S25qMDVSVHh3bDBPNHFQN2FMQzQw?=
 =?utf-8?B?bXVobDhGN0hIblBYWkJTN0xKMXFZRTBra1BDQ0VOemtTcVRuZFNPangrRGcv?=
 =?utf-8?B?Q3Z5S2E2VlFaRFczVi9EWVNoTm1sSFlzT1FNNVpqZVQ5OFJkcCtmbm1RMlRF?=
 =?utf-8?B?ZW5UbUppMXdqbEs1dGxtQTkvcEduSUlUV1dnYmk2REVwTjhTZlNNcGVxYnZR?=
 =?utf-8?B?eUN2MitZU0lWL2pVd08zZVIxcVJQWkd6a1cwUVBUaGRRc1U5eWg4VXB3MVcx?=
 =?utf-8?B?TnJaRnRRNFBMc2JKTEhpdHhUOVdwSXpjalJIeW4vcFE2YXZpKy9YcmJ6K3pH?=
 =?utf-8?B?THFwODNGQXAvKzVGemVaejVMRmc2RVRCV2JuNEpLRjVRTHU2bjgwSXJnODNR?=
 =?utf-8?B?dEZ3bVB6RjRGV3VvdmIrMUdoQ1g1cCtOczJ2Wmp4aEpTcnd6bUV3ZHkzWkV1?=
 =?utf-8?B?ZWJrQXdtNlM3enpUQjFQaFNvcTZWeUZuMDZJRXVudnNodkhpTXFZeWJoV1pv?=
 =?utf-8?B?WnhJRFZpSXJuTDFSMDJreUYyVHVqTWNCWU5lYnEzSjVwdGhtQnJNWGJibGp5?=
 =?utf-8?B?OXJjSU82TlgzWkNES0NPQzZQdE9QM2pWbE1XbHhoTXE3N2ZaMDZOZm5sYVNw?=
 =?utf-8?B?bkd5eWVHNllsTmV0STQyV3hQV3EzajBDVGRuMHlKdkR5M0lNY3N1T1YyV1hI?=
 =?utf-8?B?Zi9yRTMxaStLMDQ0RWdHYWVaY0kyMEprcGl1bm9WWkZYc2U4WlJUVTJrcUwr?=
 =?utf-8?B?OVlpWUNQK2tiSVljanBFYm40ejhTcldIeG05YjdCakg2MTZZSWNUVVB2VXhB?=
 =?utf-8?B?T2dIcVZwdlpWVE11RDk1UHBHS0VDV1E5YytVM2tsVnJDSURrTkFyR3c0ODgz?=
 =?utf-8?B?NE5vcXNTUExWT0hIYWlpU0NkZFRRSnN4bks2MnMwVlIvSCtwVUJ4Q3VKOUVF?=
 =?utf-8?B?OVlyWDgwaVQ3ZmtqR0N6ZlAyM2FoNGtuVTJlWW8yUmh4S2MyZkVBS2QrSFZm?=
 =?utf-8?B?K2NMd1BnbS9lTE1obGE3eFlzVCtSV1hSTUU2RkxkckR4cnVrc1lRc1BraXpQ?=
 =?utf-8?B?MTllZ1ZQanVoaVRPekd4QWZnZ3RqYWFNSkFWV0RvMnV6a3RQN1F2dGJEYUJt?=
 =?utf-8?B?TEpiLzA3WmVuRU1qK2NFZGhaRGk5RVMwYjlGbjFFajZwcGhtcTVjcmQ0UU9x?=
 =?utf-8?B?RzlXaU5HR0xtM2ZsNU5UbE9ZckUra1ZXWmR3R0RwODhaakFMcHZUdThGV3Jy?=
 =?utf-8?B?bXc0ZDRpdm1Jd1NEbHJIOEpKNDR0OFUrQjZpVGhOMHR6SkdkenozKytIa0R0?=
 =?utf-8?B?QjlIeUZuS2hjSzFndTlzWFZkZDNrZHJEUHJBQVBZQzkrQms2WUI2cC9qSmxO?=
 =?utf-8?Q?QSYLWI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUNMditDdXRSN1FOUlZ3a0dkK3B0VkdkMG9tT09JK1JKcy9GWVVOd2tXd3Fz?=
 =?utf-8?B?VDlUbWd2ZHU2cmQwTUE4dmNjZkc0TWszMVFCcStEdzU2aFRLN0dPT0k3MER0?=
 =?utf-8?B?TmNEYy84L25tS1RIamtxb1NrOFJ4TzZGRVdlUjkxL2ppczZyQUdxSWdNNkJL?=
 =?utf-8?B?Z3l2TmtCSUNveGJEZlhqYUd3VVU0MlZUK0Y2MmpiRGthcXJ5cTZVWmEzZ1o4?=
 =?utf-8?B?SGgxYnNGcm05NWg0clpOWkZySU5mZUJ1ODEwUjVsM3lqUFJIV2hCNFZyK0hP?=
 =?utf-8?B?UzNjVEU5NkZ0bEk2VGUxRklXVkhFRkMyTGlWZ3Z1bE9xTGJ0UDV4YThwTVlZ?=
 =?utf-8?B?WHIwWFNaelh1VWpkQTQ0WGxWSTllK2pSY3VxMGZ2K2x2eTloa3prZDJxNkRZ?=
 =?utf-8?B?MHBmNFcrVU53OXNYdVpudzNtUmRGd0J2STl0S1JYb2ZjOXBqcll1bmpFNmtl?=
 =?utf-8?B?bW1qV0ZuNXViMG5COW4yamhzaEU4c1hUQTlLTkZxcVMzUXdoampzaVhJeVJj?=
 =?utf-8?B?UzVWWW5wWktkNGEyRW5KeHowVlBycTY0THh4MzB0ekhQUldML3RMUEMzcllQ?=
 =?utf-8?B?dW8rNXg0elBuZ2R3NGRRVzVwcGRVREhVaEhmM2t0dm9UUHVwczFWNlE2WVlw?=
 =?utf-8?B?NHBTYzBpTG16NzRlTC84ZGFzWGFxdTdHVnZRMldWcXlNSG8wWFhjbnNjRytI?=
 =?utf-8?B?SVN1WWpMMFV1YjU4NWx0ZlhESGtwSnlCeVo1dmhYOEZ2clBlbzZrZGx6YjBv?=
 =?utf-8?B?MllwbHlDbUFSM09CUnZ1YVllWjEzdHJzclRDL252NEJpTFpTQnJWZ0wxMzZD?=
 =?utf-8?B?cyswdFZiVlNCZTBTTVVKRkhobkJIeDcrVE5odmxDWE16QVBRemVSajB4N0tN?=
 =?utf-8?B?V3Rib01jbEROOTg2aC9CSnVUNXd2QS9LYWxsbndrcXJkSTR3dDAwYnJXcmxo?=
 =?utf-8?B?QXJqWTFzbmhSS1VjdmQyWHFwdHYvVG1XNVRzcWFYS3lwTHJTdGYwbTNSd2VF?=
 =?utf-8?B?Sm1jQmFjQ3FoWk42eFNlMjFvdnpMcW1yQnRpd2twdE5jeE1OeTJ1eGRTbVd4?=
 =?utf-8?B?dXE0R0Z4cStsaVArWmVGMWp0WnJxQkpsWkttYnAyUWlVZ2NHNXNMVXpDTVRR?=
 =?utf-8?B?UzE5MjVBcEhSK0pUU2phdzNDaTlyK3ZtVjdIclV3clBNdStIdzdLZTZ1aGlZ?=
 =?utf-8?B?VnpDVWpiak5xKzllZk43T29YOG04YTZRWXJoU09wUk45Mlphc2N4Yy9zcjFJ?=
 =?utf-8?B?aWVTOHdEcU41LzVwc0RzQlp5ZnA1Qm9WOVFKRnlhNzFlMmhvWGV2dkozQ2RU?=
 =?utf-8?B?K0p3eGNTdktKQjBzNXZOdjg0Q0VNTWFXQUlOa2s0Vnl0cVJhVk9ua3ZrWUwy?=
 =?utf-8?B?T2pva3BDUWYzUmxKQTR6SkwwaGxlVnBKWE5iN0xra0Z1QVRyNGQ0dWx0UExz?=
 =?utf-8?B?aFNudUhCaEF2QkNxWHcwOExZUHQwYnhNYWFvV2lYMUk2cWxmM3BRbFVsSzFk?=
 =?utf-8?B?MC9CWlgyNnhZblJMaXE1R0J4T0d5MSs5YWNqNmhQb0ROclZwR2ZRazRLVzNW?=
 =?utf-8?B?Unc5T0h2cEMwa1IyWHBubTV4OTRjcm1yLytPQ2ViT29rSXRjUkNyOS9QclRE?=
 =?utf-8?B?WlBodjJmMW14TjVPQmlIak1kR1hYYVVTL0krYjUzVXZxUTVlN0lOK1U5WWRF?=
 =?utf-8?B?dmUxMDBrN3o0c0NRZitkYmRZVXI0OFdTZ2o2NHoyUCt2dmphalU2WWxucnd3?=
 =?utf-8?B?RCtpc3VzRnBhRUUvSHpUb0JnR3JMdmFPajA5cmpNRDFSSHRMempldkl6bk0y?=
 =?utf-8?B?djdkZ1kzT1VqRWZnV29oZjJtUkVZTVlmeEVNNUh4alhOd05UazhHdUxicnk4?=
 =?utf-8?B?RDlJZ3NCZHk3c1NEd3FGRTdiMCtYOE1ybFM5VUtJNXFpN2lEOEhIVTJ1Wlgw?=
 =?utf-8?B?R3JMaGk0enhadVJLYW1tMXI1c3VUdGdLcXVZZDYyNzhqVmlyUmxsYU1aN215?=
 =?utf-8?B?U1BtbmZFbFBNNUZQT3FPanVYS1dqdk04bWpzYnVWMFZlYjZkdkErb0VjS1Rw?=
 =?utf-8?B?S1FOWVZPa0pzdnNmU2ZsRlF2bkR5SnVieHYyZVhSVGdYbTRZOVgwcnpZemN6?=
 =?utf-8?B?T3pLL3pYenVRUVBFcHI2YVFzVnQ4WStxUlAwTXZnNTFnSlhPQW1tS2hsbTBP?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1272E8E32EADD547AD62D7A137B7B912@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20cfe48-f121-4f2a-cca2-08de121af5f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 10:00:13.7788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Z6dk6aKM5zng+w2oOOS5PWHX74kpaVORXYmhAhG8aZLYl6tjddDPl+/MzDPa9CNTJX2YbexUneS3o+O7bs/MTjBvBnT8WiW2tbPuDFwH4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8403

DQoNCk9uIDEwLzE3LzI1IDEwOjA5LCBOaWNvbGEgVmV0cmluaSB3cm90ZToNCj4gT24gMjAyNS0x
MC0xNSAwODoyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxNC4xMC4yMDI1IDE4OjE2LCBE
bXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+Pj4gLS0tIGEveGVuL2NvbW1vbi92ZXJzaW9uLmMN
Cj4+PiArKysgYi94ZW4vY29tbW9uL3ZlcnNpb24uYw0KPj4+IEBAIC0yMTcsNiArMjE3LDIwIEBA
IHZvaWQgX19pbml0IHhlbl9idWlsZF9pbml0KHZvaWQpDQo+Pj4gwqAjZW5kaWYgLyogQ09ORklH
X1g4NiAqLw0KPj4+IMKgfQ0KPj4+IMKgI2VuZGlmIC8qIEJVSUxEX0lEICovDQo+Pj4gKw0KPj4+
ICsjaWYgZGVmaW5lZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBkZWZpbmVk
KF9fYXJtX18pIHx8IA0KPj4+IGRlZmluZWQoX19hYXJjaDY0X18pDQo+Pg0KPj4gV2h5IF9faTM4
Nl9fPyBBbHNvIChuaXQpOiBMaW5lIHRvbyBsb25nLg0KDQpXZWxsLCBJIGNvcGllZCB0aGlzIGxp
bmUgZnJvbSBYZW4gY29kZWJhc2UsDQpidXQgeWVhaCwgX19pMzg2X18gaXMgb3V0ZGF0ZWQgbm93
Lg0KSSdsbCByZW1vdmUgaXQuDQoNCj4+DQo+PiBBbmQgd2h5IHRoaXMgcmVzdHJpY3Rpb24gd2l0
aG91dCBhbnkgY29tbWVudCBoZXJlIG9yIC4uLg0KPj4NCj4+PiArc3RhdGljIHZvaWQgX19pbml0
IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlvbnModm9pZCkNCj4+PiArew0KPj4+ICvCoMKg
wqAgLyoNCj4+PiArwqDCoMKgwqAgKiBUbyBjb25maXJtIGNvbnZlcnNpb24gY29tcGF0aWJpbGl0
eSBiZXR3ZWVuIHVuc2lnbmVkIGxvbmcsIA0KPj4+ICh2b2lkICopDQo+Pj4gK8KgwqDCoMKgICog
YW5kIGZ1bmN0aW9uIHBvaW50ZXJzIGZvciBYODYgYW5kIEFSTSBhcmNoaXRlY3R1cmVzIG9ubHku
DQo+Pg0KPj4gLi4uIGV4cGxhbmF0aW9uIGhlcmU/IE1vcmUgZ2VuZXJhbGx5IC0gaG93IHdvdWxk
IHBlb3BsZSBrbm93IHRvIHVwZGF0ZQ0KPj4gdGhlIGNvbmRpdGlvbiBpZiBhbm90aGVyIHBvcnQg
d2FzIHRvIGJlIGNlcnRpZmllZD8NCj4+DQo+PiBGaW5hbGx5LCB3aXRoIHRoZSB2MyBhZGRpdGlv
biBoZXJlLCBpcyBOaWNvbGEncyBSLWIgcmVhbGx5IHN0aWxsIA0KPj4gYXBwbGljYWJsZT8NCj4+
DQo+IA0KPiBJIGFncmVlIHdpdGggdGhlIHBvaW50IHlvdSBtYWtlIGFib3V0IGkzODYgKGUuZy4s
IEMtbGFuZ3VhZ2UtIA0KPiB0b29sY2hhaW4ucnN0IG1heSBiZSBtZW50aW9uZWQgdG8gcHJvdmlk
ZSBzb21lIGNvbnRleHQgYWJvdXQgdGhlIA0KPiBwcmVwcm9jZXNzb3IgZ3VhcmQpOyB0aGF0IHNh
aWQsIG15IFItYnkgY2FuIGJlIHJldGFpbmVkDQo+IA0KPj4gSmFuDQo+Pg0KPj4+ICvCoMKgwqDC
oCAqLw0KPj4+ICsNCj4+PiArwqDCoMKgIEJVSUxEX0JVR19PTihzaXplb2YodW5zaWduZWQgbG9u
ZykgIT0gc2l6ZW9mKHZvaWQgKCopKHZvaWQpKSk7DQo+Pj4gK8KgwqDCoCBCVUlMRF9CVUdfT04o
c2l6ZW9mKHZvaWQgKikgIT0gc2l6ZW9mKHZvaWQgKCopKHZvaWQpKSk7DQo+Pj4gK30NCj4+PiAr
I2VuZGlmDQo+Pj4gKw0KPj4+IMKgLyoNCj4+PiDCoCAqIExvY2FsIHZhcmlhYmxlczoNCj4+PiDC
oCAqIG1vZGU6IEMNCj4gDQoNCkFuZCBwcm9iYWJseSB2NCBjYW4gaGF2ZSB0aGUgZm9sbG93aW5n
IHdvcmRpbmc6DQoNCi8qDQogICogVGhpcyBhc3NlcnRpb24gY2hlY2tzIGNvbXBhdGliaWxpdHkg
YmV0d2VlbiAndW5zaWduZWQgbG9uZycsICd2b2lkIConLA0KICAqIGFuZCBmdW5jdGlvbiBwb2lu
dGVycy4gVGhpcyBpcyB0cnVlIGZvciBYODYgKHg4Nl82NCkgYW5kIEFSTSAoYXJtLCANCmFhcmNo
NjQpDQogICogYXJjaGl0ZWN0dXJlcywgd2hpY2ggaXMgd2h5IHRoZSBjaGVjayBpcyByZXN0cmlj
dGVkIHRvIHRoZXNlLg0KICAqDQogICogRm9yIG1vcmUgY29udGV4dCBvbiBhcmNoaXRlY3R1cmUt
c3BlY2lmaWMgcHJlcHJvY2Vzc29yIGd1YXJkcywgc2VlDQogICogZG9jcy9taXNjL0MtbGFuZ3Vh
Z2UtdG9vbGNoYWluLnJzdC4NCiAgKg0KICAqIElmIFhlbiBpcyBwb3J0ZWQgdG8gYSBuZXcgYXJj
aGl0ZWN0dXJlLCB2ZXJpZnkgdGhhdCB0aGlzIA0KY29tcGF0aWJpbGl0eSBob2xkcw0KICAqIGJl
Zm9yZSBhZGRpbmcgaXRzIG1hY3JvIHRvIHRoZSBjb25kaXRpb24gYmVsb3cuIElmIHRoZSBjb21w
YXRpYmlsaXR5IA0KZG9lcyBub3QNCiAgKiBob2xkLCB0aGlzIGFzc2VydGlvbiBtYXkgbmVlZCB0
byBiZSByZXZpc2VkIG9yIHJlbW92ZWQgZm9yIHRoYXQgDQphcmNoaXRlY3R1cmUuDQogICovDQoN
CkJSLCBEbXl0cm8u

