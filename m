Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F6991ED84
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 05:42:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751927.1160031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOUOp-000770-JZ; Tue, 02 Jul 2024 03:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751927.1160031; Tue, 02 Jul 2024 03:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOUOp-00075N-Gu; Tue, 02 Jul 2024 03:41:47 +0000
Received: by outflank-mailman (input) for mailman id 751927;
 Tue, 02 Jul 2024 03:41:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMB5=OC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sOUOo-00075F-2F
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 03:41:46 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffc4008c-3824-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 05:41:44 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 03:41:39 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 03:41:39 +0000
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
X-Inumbo-ID: ffc4008c-3824-11ef-958a-bbd156597b9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+rYbNzbR1LQqo9cYFKXd0Voccs6seUdmtvmi84oXj/CiiVqB1i3iQuYZLD96auRSw7sp4CZ09zXiMt8CpUPY25+/Y5/d0Fqyj4+Zuw8TH5bYBYYE7xMjAhy8rVbwR+LCKV6pzNkp3ilKv+nqubNXFXp2FFUemii0IXdz1MFfDSzZksOVEZGQhivrlpXlA8iNVzJ6PnvODVBwlp/E53Wd3nwBkoQ7Ygdj+XXjqm5Iu1k5jsklfUSMaFgFOlKnMgR91j9Nxofc8PX4Mf68zKg80ZQ29veLhlKNYJf1lBBkisX6HXzrG8crJKxQSVXcPAWme3ZEjpN9EpHBSSGpD5PDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmPT1YJvmPzNg9RBdRHkwJQrmw0IZGZF67Vw17Zr1/8=;
 b=jyp2Ve2rfMCDAtNyjw07s+gEK8L47g6UqizJpF3i9rjcFYFQhh95dIwS8XcydhkzpwpGZzkU6CMXAWjDLKMXYniYTj6JShBy+buwMoibYrqsFVZZRazbkjBNgKfpOdweDva0mvHUsV2uqzXz8J3AEgfdRtEqnKpRnm+zkKYWaavwLOgSfTd4MZANT2aFf7lLB4EGTfPzxOn8ZK5ZFRXWvaQ8krdC+hLlNqYHoRDrw4/YZyYU+FjeLyOCZI55t1upyBjwl/oQ/Bpe6WG9q0DA87fhPEV4cMkDq2zJEuztQrRkeAGU4WbDrHf65FC298aKam4USRaUNhgli5ePE4tnNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmPT1YJvmPzNg9RBdRHkwJQrmw0IZGZF67Vw17Zr1/8=;
 b=m4+7CRr4USk+Ya1dtvZTkb7TySFiO5IgXJ8Wd0SRkEa3MPfSCx3JN9rIrFB9PZSVEyCOs3VtobiuntWZUCpb0hM1OkyYePpbeUXYcSDrr/SG+G0BpdyT9p1U44BBapRlQg8fAGMnu41V5UOUFIlKLXJsJDxfL8Bga2J7hKmpGy4=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v11 6/8] tools/libxc: Allow gsi be mapped into a free
 pirq
Thread-Topic: [XEN PATCH v11 6/8] tools/libxc: Allow gsi be mapped into a free
 pirq
Thread-Index: AQHayunZQYBg9v9t9kyJNwcunL3OKbHhgf6AgAHPpIA=
Date: Tue, 2 Jul 2024 03:41:39 +0000
Message-ID:
 <BL1PR12MB5849674C8CA5675AE53829BAE7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-7-Jiqian.Chen@amd.com>
 <64af8165-2456-48f4-b784-ed3e6eb2c456@suse.com>
In-Reply-To: <64af8165-2456-48f4-b784-ed3e6eb2c456@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7719.007)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB9079:EE_
x-ms-office365-filtering-correlation-id: 2044e853-f63f-4a15-552a-08dc9a48e1c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MitiT01mZkZSeG15Z0tUa3VsMnRlZEtEK2lZZ0YxaFdmd1pHdDZkQjhtSDYv?=
 =?utf-8?B?eUFrRlF1QVRiOWcvUTNFTkpWTWkzb21UV09rOVdpV0NYUXRPUXYxSCtuckxp?=
 =?utf-8?B?am8xWmtadnpxWUh4S0NFcDJNa3dOa29XNmpFSExYZW05Wmltd3hSMFdDTVVr?=
 =?utf-8?B?RE9OZndWWkpjVFF0RW9nejhuZzRvdzZtelZnN3h1K3h5YmppZHN2QjNBVnU2?=
 =?utf-8?B?emxkeXBFRWtYQ3dVWUZsRUhJdjVNSDFJT1o0UFBtQUZPWk82V2VtTDNUYlRz?=
 =?utf-8?B?d0dUNHhKd3JwYTVuOG5Da0RsM0ZWTlphUGxZRmNWQlM1RVBQZEFZQXNUYm0v?=
 =?utf-8?B?eEdlR2IrQnpLZEFaNGlIdVJNZlY3bkh4TFc3NzJqOE92amNrb29SV0NNWWRk?=
 =?utf-8?B?TGErbHpjTnYxaUVDbE0rNzN1aGZVRFdGem9vcGdvUm80bVpFeWFlWUR3dzJq?=
 =?utf-8?B?bHNTazJjakVXUGpvakxaaEYweTJZV2NUQTBhZ1B2OTRtNVM1UEk3RDBLSU9s?=
 =?utf-8?B?NXR0WXk0MjJ3RGxFV0VjbHc4dzdoUzUwSGVvZVhlaE5HL2VMT2ZWRVhTeTZB?=
 =?utf-8?B?WTdpb0lhNE9EVDBPYThzQ3BRYmplVlNFeGdOZWRmS1RtYzBRd3hHc3lkbjg1?=
 =?utf-8?B?bXRGQjJhZERYN1hnWWo1cEhZWlQxdklUS2c3cVlqU0dsMWJqUjY3aG1JVTZT?=
 =?utf-8?B?ZjdTcHUwSFZUMFNpZ2ZPZWlsVmdDUGx6TUxwQ0RoaE1ieWo4WERpQXpBakZL?=
 =?utf-8?B?cjNudGRreTlDSkk5V2NzZFltc0JFbWQ3NmQveHFJSUlubkhrczRpNzREbVRG?=
 =?utf-8?B?Q2FDZE8zQWZuU0Y2NC81MzMwNE5pYTc3dXpPR3JacVV3Z2dYdWw5ZnRRYkQx?=
 =?utf-8?B?aGFPbEthUVdIS0dCNkhqMEY0YUlBZDVsK3F4Q096YnB6ZmJzaUpSWXRXQk5L?=
 =?utf-8?B?c25OaDhoYWljcFhVSGpMVk5mUlo1TWFzZzV5RUkrc0xCYytMY1M0OTZIT0FW?=
 =?utf-8?B?amZlOXBRQ0FuKzZYSHl0R2o3YlU3ODZHSDFlK2FOQy9sRzZlQWZ6c3lrR3ha?=
 =?utf-8?B?NEJ5U0Q4TXlSYmtFd3l0eC9xRzlqbG83Smt3YktYQ2xKZXk4OWcrUEgvK1ZS?=
 =?utf-8?B?WVNrcTdrak1wYmdUdUFUR2E4SzRINXpkV1BlbklxZ3BneWtON1Y2d3JteTB2?=
 =?utf-8?B?enpGb1pSeUpMWGY4cWM1cmR4ZldYZ25vRWVCUTNuZ29lbm52TVZ6bmdrLzRK?=
 =?utf-8?B?L2dUREtDVG41alAwam9MVkpZckhVbExvMHBtN0hScG5kdXJ2VUZVRWdiVXAv?=
 =?utf-8?B?dDdMaTlUS0tJamN2NjlVR3Z2d1F0bkprQWljSVRudzA4aVVhbnk3eVdVUENK?=
 =?utf-8?B?MW9pU21rQUh6RXh5SU5Da3hVVEYzRWIwaU1IUlVKL3BNUmVTRGNFeHR6N21T?=
 =?utf-8?B?R1dYTmgyK1p2ckQyUWIyTWNBQm9ZNEJseFFpTVgva0pQSHVxb2dab0VLT3l2?=
 =?utf-8?B?Qy83SkQ3SVhxNU1acGh6UWI4SlJIb3FuVTNMVTc3djNaaWg5eXRhZ3Z3OHVF?=
 =?utf-8?B?dmx4WnlxdkNoVU1xM2VtZjFJUTdnZ04yQ0txQng0RTlGeUVUVmRLbHB4enhv?=
 =?utf-8?B?c2Fra2gyWmlmSWtIZTV3YnQ4dHVsQnhZRGNCbmxldHRmZFVrQ1RDL0pXdmFm?=
 =?utf-8?B?bUxuQzlxWHB2dFZRbGxteVJLUTVzUHNwL2xLdStwTlUzTGdnRUg1ZmFNc0kz?=
 =?utf-8?B?dTZQVldVQ3VOS1d4OEpOOU8zWkxKVk1PMVNZakpOY0hxdSttbzBWU2dQU3lY?=
 =?utf-8?B?d3BXaFA2RGZIQjBEcURzS3dJNFlKT0NZUTc1TFNNZGY3RUNHU3J1YzZ1a1VS?=
 =?utf-8?B?U3ptV0ZlUFMvNExWR0grNnpqMkNZc1ZDVHBvYjRwT0Rpdmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzQyT25rZXRjWTgvZWNTOUtma3ljL3dFSm92ZXJIVEFPZlBLZ003bnZEMXpy?=
 =?utf-8?B?NTI5UTBZYXViSExvaExQQTl1OTE1bWM0RFRtbWp5enF4dHhib3dvSXRha2Vk?=
 =?utf-8?B?QUt6Nlc2VmZsbDhvbVh3dGRaRG04Zmp3VldTejBlSE1lOUcxT2YzYUQrWk1X?=
 =?utf-8?B?a2tHZmJUV0haMU1QRVlkaDV0TmRsOE5VRVg2dzNDU2ZRTWZHNkxSczZKeU44?=
 =?utf-8?B?aVN5WkJmMkhidFY2MWlzdTluclBpY0tDUWNBUW9JeHEyL1hLT2hnRnZ3U2wr?=
 =?utf-8?B?MmFKbnNMaVRiZ1BEdXFwNlRDVVp5ME1lKyt4VkgxazVQTm9UR1RERFN0QXZN?=
 =?utf-8?B?a2pSd0UvRWdKVFozSnlKMjg0WldRSGFOZFJwL1RMVmtBWDNIcEwvVlhEOVVu?=
 =?utf-8?B?UUNGS0E4REZLK0ExdVJxUHpqWHZKckNYN0JJUWtseForajhMeS94cGpCd3Ex?=
 =?utf-8?B?dGpHZWljTm5rNHpxbUQraVVLc0JXdGkyMEhzUTF5TUtIbkYrZHRkTlpvQTln?=
 =?utf-8?B?ZHhMYjFGam5LZ2tzRmNQQXdMcDdOTUdwZkQ3MVBFMTQ5RDdIcG5TT2cwVXJF?=
 =?utf-8?B?Qzd5SFhPUTlYNmFWa3liLzRUYmVlWUFHaEgxMGdsQWlpeXI2T2JlbVNRMit5?=
 =?utf-8?B?NW9zNjlqV3VqWDFIWGRkeHZUTjNpaWNjRXEwUUZucUdFa3p6bDc3SzNySmk5?=
 =?utf-8?B?cHJKb3djZERqWVIzNjEvSDY2UElTTDRYSFVzM1FQaDlOZi9xWnRQbTNIVEp2?=
 =?utf-8?B?UFNLNHcyd2VSSnhNWWRXYlZTeFdJem9rcTVyWDNjMFhJem5GdVIwaWFoaFdx?=
 =?utf-8?B?TVROd2xuMUxta2R3VXJJZkpNTU13R0pIOGVzVzduZFJZbk5tRkRLeEhwcTNB?=
 =?utf-8?B?MmhqVDBVRVNkVCtrdGpQL1JXOWMya3pPY0lwRUE1OHRqdGRCVG10WUw5R250?=
 =?utf-8?B?WG5ybU1DNEFCNVhvaDdpdWg5d3hlakRuWGJKMTNXNFZHdzhiNDRWQTBCU054?=
 =?utf-8?B?MjYxZFhuTTJKTE4xbW44ZHRwTk9YYjh5VmNXY0FOd1NrdHl5am91SlcraElo?=
 =?utf-8?B?eFJRL0RPUGNLZUp0R1ZvakFkeXlRdkhpTlBFNk4vclowL2lWcGt0d3ZMWU9K?=
 =?utf-8?B?cTJGNjR5TkNDSSsrc2ZMSmFQQ1JEMWFOUFNCa1FlOXFFVy9ZY0xTd25Bc1Uz?=
 =?utf-8?B?UWxvbVBwUDg2UWdhSC9uQTk3THV2QXA0ZnU4TXV3N1loU2NYd1NobWE4eWJF?=
 =?utf-8?B?cTZPNHJoa1JzcTMvOTE3NGZrbXBDelhudVhiWkdMK29ld1lhVVdlS1BXeng3?=
 =?utf-8?B?WlIya1preld5QmM2U3Q4OUQ4MUFBTXc1Yml0NnUrT1pxRWRKK2VwU0U4cThy?=
 =?utf-8?B?bjYwcmJWVmp3bFFEVDc4L05SVVBMMFVKaEJoQWhBOEE4cEhNV1NDK28xeDBD?=
 =?utf-8?B?bnlWRmpXVk5KSEV3QnZEZFd1SXdheFlaVzlIT25MQ1JlMzVidk4yK1V3MFBJ?=
 =?utf-8?B?RkpQaHo2Sm5xblNlOEhLcmhQNk1DY0t1SnJPQnVtaWhZcTNHM09xdkFuTi81?=
 =?utf-8?B?R1plNjJsMDZRczV5RGthWDdjK3RuaGVFcmNCNnZtY1R5ZHcrcWwzTlo0R2lF?=
 =?utf-8?B?QnV1b3J6VGs5UWMwWEkxTEcrZHVPOGlJT28yY3JXYko0WWJ4aXNTSWdVbEs1?=
 =?utf-8?B?clk3cXdueFBacklZbERjZStiMy9paEZETTZCUnRsZ2R6OVpRc3pTVGRZL2tw?=
 =?utf-8?B?TEdRckJ1b3dYbWVzeklrR2QxMlo1UDkvWDdDc20vOHllZUVCOGhER09GcVVv?=
 =?utf-8?B?bFZUNE5JS081RW5nZDhJaFVocTJlNzZyQytnSWtoS3dqNDRRNFBmSzBkY00w?=
 =?utf-8?B?eVZCVktXUGVQWTYxNHdvc2tLMGFuK0hqblJROTRXWVMzeldQYS9EdkFjdmlI?=
 =?utf-8?B?YU5qNmRMZytkNllHaWlxcDVTaGdNYjBSR3RKMklScjhNSTA0ZGFkaCtPeUF6?=
 =?utf-8?B?UzkzbmNZTjJPREV3Y2x6dG9aNFk2TzIwNDZnOFYwL25ETlVGbXBvNXFxWEgr?=
 =?utf-8?B?M3BWeUM4ZkNvRkcvcnMxbkNJQzlpT3JFNnVxL0ZxM2ZWN3pzTHdlU2xXL3lF?=
 =?utf-8?Q?begQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25D22CFC0677B648A39F091923A2B780@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2044e853-f63f-4a15-552a-08dc9a48e1c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 03:41:39.5759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fpC0ffbjPqA/ZadVEC/nFKucfvk4Rz3pNB1KrRiKwMG/08NJgWkwL8W6CS968+e/xGqnI5T/Fe7CojEzLCIIYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079

T24gMjAyNC83LzEgMTU6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wNi4yMDI0IDE0
OjMzLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IEh5cGVyY2FsbCBQSFlTREVWT1BfbWFwX3BpcnEg
c3VwcG9ydCB0byBtYXAgYSBnc2kgaW50byBhIHNwZWNpZmljDQo+PiBwaXJxIG9yIGEgZnJlZSBw
aXJxLCBpdCBkZXBlbmRzIG9uIHRoZSBwYXJhbWV0ZXIgcGlycSg+MCBvciA8MCkuDQo+PiBCdXQg
aW4gY3VycmVudCB4Y19waHlzZGV2X21hcF9waXJxLCBpdCBzZXQgKnBpcnE9aW5kZXggd2hlbg0K
Pj4gcGFyYW1ldGVyIHBpcnEgaXMgPDAsIGl0IGNhdXNlcyB0byBmb3JjZSBhbGwgY2FzZXMgdG8g
YmUgbWFwcGVkDQo+PiB0byBhIHNwZWNpZmljIHBpcnEuIFRoYXQgaGFzIHNvbWUgcHJvYmxlbXMs
IG9uZSBpcyBjYWxsZXIgY2FuJ3QNCj4+IGdldCBhIGZyZWUgcGlycSB2YWx1ZSwgYW5vdGhlciBp
cyB0aGF0IG9uY2UgdGhlIHBlY2lmaWMgcGlycSB3YXMNCj4+IGFscmVhZHkgbWFwcGVkIHRvIG90
aGVyIGdzaSwgdGhlbiBpdCB3aWxsIGZhaWwuDQo+Pg0KPj4gU28sIGNoYW5nZSB4Y19waHlzZGV2
X21hcF9waXJxIHRvIGFsbG93IHRvIHBhc3MgbmVnYXRpdmUgcGFyYW1ldGVyDQo+PiBpbiBhbmQg
dGhlbiBnZXQgYSBmcmVlIHBpcnEuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4g
PEppcWlhbi5DaGVuQGFtZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5o
dWFuZ0BhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVu
QGFtZC5jb20+DQo+PiAtLS0NCj4+ICB0b29scy9saWJzL2N0cmwveGNfcGh5c2Rldi5jIHwgMiAr
LQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2N0cmwveGNfcGh5c2Rldi5jIGIvdG9vbHMvbGli
cy9jdHJsL3hjX3BoeXNkZXYuYw0KPj4gaW5kZXggNDYwYThlNzc5Y2U4Li5lOWZjZDc1NWZhNjIg
MTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2N0cmwveGNfcGh5c2Rldi5jDQo+PiArKysgYi90
b29scy9saWJzL2N0cmwveGNfcGh5c2Rldi5jDQo+PiBAQCAtNTAsNyArNTAsNyBAQCBpbnQgeGNf
cGh5c2Rldl9tYXBfcGlycSh4Y19pbnRlcmZhY2UgKnhjaCwNCj4+ICAgICAgbWFwLmRvbWlkID0g
ZG9taWQ7DQo+PiAgICAgIG1hcC50eXBlID0gTUFQX1BJUlFfVFlQRV9HU0k7DQo+PiAgICAgIG1h
cC5pbmRleCA9IGluZGV4Ow0KPj4gLSAgICBtYXAucGlycSA9ICpwaXJxIDwgMCA/IGluZGV4IDog
KnBpcnE7DQo+PiArICAgIG1hcC5waXJxID0gKnBpcnE7DQo+PiAgDQo+PiAgICAgIHJjID0gZG9f
cGh5c2Rldl9vcCh4Y2gsIFBIWVNERVZPUF9tYXBfcGlycSwgJm1hcCwgc2l6ZW9mKG1hcCkpOw0K
Pj4gIA0KPiANCj4gVGhpcyBpcyBhIGZ1bmN0aW9uYWwgY2hhbmdlIHRvIGV4aXN0aW5nIGNhbGxl
cnMsIHdpdGhvdXQgYW55IGtpbmQgb2YNCj4gY2xhcmlmaWNhdGlvbiB3aGV0aGVyIHRoaXMgY2hh
bmdlZCBiZWhhdmlvciBpcyBhY3R1YWxseSBva2F5IGZvciB0aGVtLg0KTWFrZSBzZW5zZS4NClRo
ZXJlIGFyZSB0aHJlZSBjYWxsZXJzIHBjaV9hZGRfZG1fZG9uZSwgbGlieGxfX2FyY2hfZG9tYWlu
X21hcF9pcnEgYW5kIHB5eGNfcGh5c2Rldl9tYXBfcGlycSwNCkkga25vdyBob3cgdG8gY2xhcmlm
eSB0aGUgZmlyc3QgdHdvLCBidXQgdGhlIGxhc3Qgb25lLCBJIGhhdmUgbm8gaWRlYS4NCg0KSGkg
TWFyZWssDQpXaWxsIHRoaXMgcGF0Y2ggYnJlYWsgdGhlIGV4aXN0aW5nIGJlaGF2aW9yIG9mIHB5
eGNfcGh5c2Rldl9tYXBfcGlycSwgYW5kIHdoeT8NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCBy
ZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

