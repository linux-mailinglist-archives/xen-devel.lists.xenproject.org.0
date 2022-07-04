Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E7D56554C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 14:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360293.589650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8LC6-0004W9-Pf; Mon, 04 Jul 2022 12:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360293.589650; Mon, 04 Jul 2022 12:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8LC6-0004PZ-IK; Mon, 04 Jul 2022 12:28:50 +0000
Received: by outflank-mailman (input) for mailman id 360293;
 Mon, 04 Jul 2022 12:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8LC5-0004M3-4r
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 12:28:49 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50068.outbound.protection.outlook.com [40.107.5.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d91dc2cd-fb94-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 14:28:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4584.eurprd04.prod.outlook.com (2603:10a6:20b:1e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 12:28:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 12:28:43 +0000
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
X-Inumbo-ID: d91dc2cd-fb94-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nh1Q1Z8w1K1Ut7LQEIVzHCfAcU3HtJYeYnAkr/Fpd7nwIL2Ejzbo66FibI031d4JCkV8Qw1SMLiEJtsjdaV4TV2qAZNx886JwAuK6so6yjWemR0gRGKA+DQawjXYnTdH02Vjqa1oYL/9MGHc1OnElsbFqOFTZSLjDGht6Vb+EaxldLnDPGai+arrR+7RSV+6RSXOR7/AM5+05daly04UFboQXcxGF1/TLKEBzLO92LOwweSvWi8vDLlj6sTWzFTXhYfiqex8PscTaD3kNMYxWmg90iAl+lGLiwEzgJ3v+z0aCGem2fq+uIWnPDcDsXPxP5cTyp6LHanyManr+HS9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LMQryx6+Vqw5VBJ427jcXgxoq/JE/VqVcEIiUlQt9w=;
 b=eENYFcfRUdj0g2aXHxG5Nz+yDpfpKSRgLF7DSTDBQJkkZenELPw/mdDazmIbgQx2La2ZQvTbFuKYUyoOpHEh1ENVYfcA+ABZ/ZZytEJdVMr82X/1ZZs6+aJqWlChEB1Ft4Uiz2PxhylkXh39I99/v+zUtkrErnFUTDDS/gmtNy4IF83cTcUWyhABXDWg687Sl2uiIbDWPshjhOo3w7X85tE4jd1K3PYIjxlM9NMVIkRszXajEafSE6xsn/kpsSNVVc0cJM4LigJGeKPVoI5+VpM7w90dPkBc19cjNv2ce8PDj9MfSSwahlJAlxwz5ZTt77AfML5fwkFkKHe/pK5kQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LMQryx6+Vqw5VBJ427jcXgxoq/JE/VqVcEIiUlQt9w=;
 b=ri+aY4IVNzWO9fzqUliW0h9N06O6kdhkdId3UKfeNrD4a17KoqHcw+D9Qi7HMtbg1FHZNwCg9XsRaDB0nKlEI8DwdqzN8r+rIWEqoCzb6nY5gio3OwDHcGOoLXhLVh68uerVVzgBBj+pQex1gvgMWFDp9UILZGFAJNEGqWGOBc7doDz3xRfsF+Vrqra6b5c83IVdu0+0EXJZ1kItlUHc2Qa5ndYK8yy4qpU/thv9JtwPTVhruwImxR42DlERUf9nQrP5Bi7QwiR9iLPC4tEYgvoVlQuybS4P2ne5ol9FrCHPOz24oDve73r5icXQqv7lmCZzwtZLypJT48Kt56qtcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e18d0bd-cc82-9fb9-f106-ca06a152d2cb@suse.com>
Date: Mon, 4 Jul 2022 14:28:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.15.3 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0136.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9bc45de-c20e-441c-b7be-08da5db8bbf6
X-MS-TrafficTypeDiagnostic: AM6PR04MB4584:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I1rAbtXAxvM8j6YaFbbUVmKU1u7vKjhMre9J9djhoHA0+byU6H0VIiOlRoe/DASX8ilklxpDZrg1X/qwVuxNvBYWCWBL/RTOBbgij4v3wcNN6kACDK89qrfGUIeQeIHG4Nscm0vCnIRAN+Sab0TX0Lsud9XKLfm5Nmuocg1jsdaFq5QZs8BFWg6Ri9ahXUrdm5JPUQ2iDmDhSv2VOUsA9NLrVYNRdmPitXR0DCcTXfk2BdOu2VNZl+8d6U0mztiCynbY0y3TuBtw8ZPafSO0Ur6lKcneFJZh8DAxulxDB2nsfECvTZ/vAZMe8YmzsV1gqM/xJnAxsx2Gpzt9H7vePT/3Sbx9fhtPejFthWcGBTwmuucxLX0FyUSQ9GsTm1w1A1z4BfdGqPe2iLodnyV0L67JOa2dAC4gp49UpuwVa2wXa45A1eJ8ukD7bCwbTC4QI3aYcjJFrj/L9cCb+PT4OI2o+cTHGHwos6MqJ16947pcgQh03FHIstZ30L5Ef9t1Wf6djeLOARB8xKgPTljda0fSkj6uvBagqwHdwXUZj/XUP/1Q6nOApZjg7nBrFaSrZ6ZEp0Om1ccMgbrzpsFa2FNKmrsL0ibWDn6T83i1ebWkGnUL8yKOgv2nAN3Cmnr9UuP3Zn+xwdF616wmlY3URO7N9ZzqHJBaBpW9FO0YwGEpYfSUt0KHPAxwZtZwHcoWI+5mLRiMOc/tjFZPtmCieIbu5YW6uxzqpG2Cd9pN2Imp6EF8kgF3yTTMnIL9rTbwjQmclX1rGNgu9ptqIYkd5sQVpyCGTbpylnolKvtEsq9XqnqqMaSvmfazKLVpT00RRhXLiQFt5ZmxTMdlxWMdIfJ7vI+fEjxFXESFUx2El7vk7kK7DHQK0KMkE6iOAVzI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(346002)(39860400002)(396003)(376002)(38100700002)(7116003)(66556008)(66476007)(8676002)(4326008)(66946007)(450100002)(316002)(86362001)(31696002)(6916009)(5660300002)(31686004)(2616005)(966005)(6486002)(41300700001)(2906002)(478600001)(8936002)(36756003)(4744005)(6506007)(186003)(83380400001)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkpWMUFIa0lXRGI3bDhQanpoVjhvVGhWcWRPNWhDTGV6em1sZ2VVN3lsMExC?=
 =?utf-8?B?ZVBTMHB1UWJ6eHB5WEEwdXZSNUhNT2pNNHZ5djhFMlRTSXZWVlV5L2Z5Y3M3?=
 =?utf-8?B?QzRwLzRWQ0pMU2hrRCtrQVhPK0RXbUUzWER3L2svcytwZEZZcmVBU3hLdEtl?=
 =?utf-8?B?cVdXcmIvWHdFNGU3VUpnWk9QYnd5UDNnUEJQSkwzbUh1N1hwZEI2ajVhUlFj?=
 =?utf-8?B?aGdBaUpXZVhaSlVvYmZQMmxMVTAwWHlBbzdwN3N1R28rT29mSzFiTHkyWGdh?=
 =?utf-8?B?TlA0RkdHOWhaREhmUzB4UVBNa1RMZm9ucUtKRWUrR1ZkM1BnZDY2MXpuR3hp?=
 =?utf-8?B?VmliYWZ1di9aZEpqVTBTcmU0RC9iNHpCZXA3cGQwQml5WmxRNFRmOHBBTVFv?=
 =?utf-8?B?WGNOcTJzNWdrWUlDWC9nM1dndGtxc24xMmM3aCtlUmFRcHJUVVI2bDF5ZkRq?=
 =?utf-8?B?ZnFIeHY4V2ZHc3k1RXc4c3FxN21jd3hEeFZGL3JHdjdQTXdURk5tNExVZTh6?=
 =?utf-8?B?SnhyYXRkMHpPQWEyeW8xY3Z5ZE9JTUhGaE1waHROMWRjRHUyT3lMUEVyR3I0?=
 =?utf-8?B?TGJQeXFHb3V5aTNyVWd0NXZVdElYSVN1bGVxQWx6ZGpsblpFVUd0aEpZSFdS?=
 =?utf-8?B?QWpESHFoWmFxZmJaaTZNNldjTkdsVVJFSG50amZSRFlFb0VkUDFpbllEUVJD?=
 =?utf-8?B?bG5haHc1V1lHSFNncEtEMjlNWTZRTFZsVkxzb2VFRFEwZSt3aXlJN0c3OGNY?=
 =?utf-8?B?VUFCaTJIMExxZHpBNlc3M09MU05RR1VOUTNyUlV0UEdxYmVReVBMMEtSQ0hv?=
 =?utf-8?B?bzhCZWFaQ0FPdFhMNThHTFRrTnZ5bGFYalMvcldpV2xhOTM2RmZYYm5uTGhG?=
 =?utf-8?B?cU1KVmcySlZCS1hpWHVOU2ZTOThPaXVUL1hqcnlFUjcyQ1dqVFVycml0VUFs?=
 =?utf-8?B?V3dKbmhnZnpQam4yY2s2bUMrOE1mK0JPRUxSd3NaazQ3K3EycGxpcW1HNlJE?=
 =?utf-8?B?SWlGd3VJVm1nL3EyUm51YnJZbVN5RXJaRWdLeHUySlBodkxWSEJwdUZKNnpK?=
 =?utf-8?B?b3RVYUlHS24raGEzNlBLMVkrVURLVFRqRG5Qa1RFVi83MWFQLzUxRVRzZmIw?=
 =?utf-8?B?ZE55WWZwVXRjUDkzUTFuZ2s3LzRYMzYzUFpPME5YTW9UdGtnT3AvRHRxOGUy?=
 =?utf-8?B?RFBtNTBiMjdxeTJjSnE5ZzlnelJnL1Y1SXpiYVlCc1ZXU3FncEN3N3hJUEpj?=
 =?utf-8?B?VkQ5eUdZWmM3bEQ1NTJwMUV2cjIwU3Y2NDl0MVVGaHFYTVR1YnhIclBTRUxS?=
 =?utf-8?B?VUIvSHdrNll3ZFo2cEJKbU5qRDdMTjlPRlpuMldOZUp4b1E3ZUNwMmMwZ3pN?=
 =?utf-8?B?WjQyYzVuVzhMYTFxUTVCaThrZWdlbkJQdElIKzdRVFVYdndrNllhdFd0SnVx?=
 =?utf-8?B?cVlsZ052OHdJMlZndkpaMkNoN0RlbWJDWExPY2tXWlA5NmtieUh1S0pEa1No?=
 =?utf-8?B?VmdBUlFBS25jeHlHK3c2NSsvM3I4UW9jNGtzWVcyOGtLb296NGw1QXJQRmE0?=
 =?utf-8?B?ZXcvcGo3SkZiZ1VwOU52bHJscHRaWUVYMzJoRE5MWFJyYmVhUGhJTlRxN25U?=
 =?utf-8?B?YU1aa1dqenRicldkOU13SXlua0ZKMVBhaWc5RERPZHRYNmdtZk16YXVldEpy?=
 =?utf-8?B?TkVxZGI0UmMxY3cwekxRcEcwNGE3MEtDUVRydnpLZmc5ZEovMTV3OFhHSEor?=
 =?utf-8?B?MUtHM2pTQlNQZExXREV1S3lEYlVkM1NldFpCV01HNkZZbDhENDFUd3JPMFho?=
 =?utf-8?B?bXNrK0NyY0xIQ08yM2Fxd0FqN01CVXkwNXNsWG0vemxQVnNQL3M2MWlJOHVt?=
 =?utf-8?B?ZUNhay9tYU5ZY2lqLzNOWGZ6clZIVXdiVTBCVFRkejFoVTJ4dVJiVzVwRTRH?=
 =?utf-8?B?WHFyNzJKU1NtRXNlMCs1c3ZrcS9RT2grMndtY0svMFhCYWhBM2FncnM0UTdh?=
 =?utf-8?B?bVFtbndNSnN5M1VMWWZXdnpoQjJUYmovcXQ4d0ZpTUtBc1RTVWV0aTY4cVJs?=
 =?utf-8?B?TXpqTm1FTmsrOUJYNlpmeXBQakVUYjlob0RwejBKNVdicnVrd3JnYWxDYytD?=
 =?utf-8?Q?jntfKzre5w0T8v14CkvZqObDT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bc45de-c20e-441c-b7be-08da5db8bbf6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 12:28:43.6939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqNRbUJA7jsHG2Ne5z2vC0TwavXyGHuyymjok82Odb6GfpZV2jFCZjHMR3cWvMNyCB2LZzvBnApJoEQGTTLVnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4584

All,

we're pleased to announce the release of Xen 4.15.3. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.15
(tag RELEASE-4.15.3) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-15-series/xen-project-4-15-3/
(where a list of changes can also be found).

We recommend all users of the 4.15 stable series to update to this
latest point release.

Regards, Jan

