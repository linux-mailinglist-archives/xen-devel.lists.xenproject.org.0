Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CFE3C882F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 17:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156100.288039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3hHG-0001em-M8; Wed, 14 Jul 2021 15:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156100.288039; Wed, 14 Jul 2021 15:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3hHG-0001cQ-IG; Wed, 14 Jul 2021 15:58:26 +0000
Received: by outflank-mailman (input) for mailman id 156100;
 Wed, 14 Jul 2021 15:58:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM3W=MG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3hHE-0001cG-RE
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 15:58:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f49a29a5-b00b-4eac-9d5a-3acf2b7db095;
 Wed, 14 Jul 2021 15:58:24 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-PFOX2yvGNhCoOBCZ4r9lwg-1; Wed, 14 Jul 2021 17:58:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Wed, 14 Jul
 2021 15:58:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 15:58:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 15:58:19 +0000
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
X-Inumbo-ID: f49a29a5-b00b-4eac-9d5a-3acf2b7db095
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626278303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1m6ND4hpva+SFl8ka49wFiHW505L0CusrABwd3Pz624=;
	b=P4VXwU9t3b2uktd7xjXn6LmXHC5UXo6TlzDPnsGJyUb0/tOQtl6DbaEt170hdON/ULJPev
	hwQhyTTTnZbrlM0m6VMA9LCyiwex1lFO44HYAykMS1FYGpgQKnDHDU4+YmDUfeo/1HTJam
	L5n0GoKyeat0Bu1J7Odz2D/F+1vD/uo=
X-MC-Unique: PFOX2yvGNhCoOBCZ4r9lwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwPwQValAjWa7LjCEIUz61IgPUmHrA83KgJC59a497q1LscYW704z+xenRa/uA8T1tsCz5RgKUxITMEzznUsTu4efnvWwjlMstA9muqIVJmwXOV/MYTi3Z8R+KiA6zt8Q01mNketNrHoDiXI5OWtnmPHzG8RlwC6KV6gBMPDNdWlc6HXSHA5pfX3FBJZQk+eguODscROfO5tkGBGzAQGNS8umia8crUW7kjPsNzpreDROru7zlRKxt3C+j6vqQMgLbyxZyrxIqhTU4cYfjWW9uO1HUgZT0nC/oTkZvy94OgKGxs0CW9Zbzq3P/31ARD9XmjId0o9r9tc/g4a0hEC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m6ND4hpva+SFl8ka49wFiHW505L0CusrABwd3Pz624=;
 b=JCRcQ4YM/OmlWJ6AuAST5jrCgUIhYi5i4GGLmILstZsMEDAQ6lPPNJvLiTwGM1k/VPpHHkmmMjPO9B6b/jOK/cj61R1WVgtsJ62yI6vykXr9CiUk+hAq20HX4sMK/LqwYpVPxBUaJha5PQKgOGulER6ygTC1Vp2hCnmFIDqloFZ2NxFoV+R1uW54Rs/QE29VOqp7TZ833k/0fgX2vP7bQify5iNKtOArYpOpHJmDNyvYnOXpwXm5CKzOtf0d5gva//fpUTcKoHjes+6v4x8PvUYDTqgz553RBrWK9pv2OTydSKA3pyinEFwGU/RyeInV2/4phXQWNbvLpQfDcFI6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 03/10] xsm: remove the ability to disable flask
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-4-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c938e8fc-e0c7-412b-2285-0ec503f6828c@suse.com>
Date: Wed, 14 Jul 2021 17:58:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210712203233.20289-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36655de6-ca1c-4dcc-ce4c-08d946e03363
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4352338FA55F5C13CDA226BDB3139@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VJLQpDFFgL9qf5rcm61pLGGzzwt7qSuwkDbnYfmu7pifNF3dJgZ5EylrR3PkZBeclb+8sckphb6ZPJ27GKz9xelppkvIIWrt/Pr1NFL8lr0IGqTQs7mMUzqO1IT6By3f0ZNASvMbZNNpP2CFOBdx+LAHqDjD4zhz3nbek32oIkf+D8ZtuNuC/nTQo3q+UNd9sLmNHpDIjFMminI6QL3eCRCiVUX2+YQpGznTWFNuO0ooQI7ysJVqOjTDb+wcrAn8rYzRd2G9BA6vnr6JWuxqcA+t52deUlUyC2tvcuu4xNKw9nw253czV48WHJ3VRwtvdGP0iikfK3fp8X2BEP3qUKwu6JFUlyPfgARab1lXdCmPdvGxKXmOj6i6zmLw7ZWa+g0y79yQy48oE2ebDT7x6SojJwUqOB2sdy7XYLEWp9wFoNpy7J/YVdst8FDQ+wFCTbsK5SeHrcSRyaq5BCHgvlu+csmu9XpJi5IQHEJG6ndZKncGjNn+lvnYaN2vtPcqmIQUdWavRI7WZYMvi7o6sTfzF0efBEPuIr/aqJTDGeEJSJT1JoOTGRJLaQhjBTk2PFYOA0ZvoTuVaBJA84zsDErJEcBU4qu51NHadrbAtCS4qFVRw7HA4mQx56SJGm/p9fQQhMrfN7PZ7Rrx+P7elrcnoe1g4na7dYXCPVL/qOzCtr0ea1h1v7r2U9/C1TxqGvAmuRsO8OdRLINZ+1R+6VdJJDnwm4c9Uwl8vVBu8Sw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(396003)(376002)(39860400002)(6916009)(4326008)(31696002)(2616005)(8936002)(86362001)(316002)(66476007)(478600001)(8676002)(956004)(6486002)(31686004)(66556008)(5660300002)(36756003)(4744005)(16576012)(53546011)(66946007)(2906002)(38100700002)(26005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0ozdXBXTEIrYzBJRFlUd2tDNW83akFrbzRISG5pbTFFOFJ2dkMrVC91UGo3?=
 =?utf-8?B?eWcyS3BFWWZpSFFhMm5sQktoM2t3NDB1aTRSeGFJTWtGMEtOOFpnNk5sOGZL?=
 =?utf-8?B?K2dKbTdtc3gzTWZVdGQ5WHJjOUxrOEFIL0lVS1VPZ01iOEZtN3Z3Q0kzcTZz?=
 =?utf-8?B?M2lUbnNoVndnUC9DRjV2Q21wV1N6dksyRDR5d0tyQzdBcHB3QTMxMXNkZXVV?=
 =?utf-8?B?eEhKUVlsdnp4QjJKQWIzUitOVUl0Y2w3eTB6aGU3ZVU1eFpPRzJXYmFxOGZP?=
 =?utf-8?B?RUpSOGFDVXlPOHFxMXFKNVdBd2Y2U2RnUkoxdTNWNDFjZy8xYWpWcVZoU0tP?=
 =?utf-8?B?TVR2QTRqa0ZObnVhNGZwQmh0Q3BNUFo4aGtsc0g1Rm9tSWZzS2J1WU9QZTRT?=
 =?utf-8?B?NzlPUmdSVWQvaWpHZURyVFBaWjBLNjdRSXZHd29TeFY0QUNhUTI0ZGVVSS9w?=
 =?utf-8?B?YXY4bk1SbmFoT1VSTXBJaFNWNStucWovODdZWkt1cTlJZ0MxcHZUVldaM1hU?=
 =?utf-8?B?TnJ3OXRPTjB0SytGUDdJWlo1QytuVUR6MUVIVnE0WWpsQ05scWdDelNKS3Zr?=
 =?utf-8?B?MjZvaUVGNktMckNTYjdwM3didzZrTHNUSkRpTERUQ2hVK21mSUlnd05qWGpx?=
 =?utf-8?B?QmpmMTA0VDU4NTRWVXJjMEFRbXhoeGxVTTM2VVYxcjFiWjNWK29SdXI4TU1a?=
 =?utf-8?B?UmEra0lFM3NIcFpibTk4b2hJK21hOVZtVXZGa1VUK3lQbWVibU8wRVpQK2cy?=
 =?utf-8?B?cDdKYTlxbVB4NTVMa2tyRFV1SVFkYkVYSzg1L0NURWhMd1lUWmViRUtmSmNn?=
 =?utf-8?B?cGVnWmd1KzRCVnBJajZlVmN3TzNCSlJQYnNtNGNrVVZ2MFBOVzh2UWd5N242?=
 =?utf-8?B?NzJVVzNad0xVT1EwVzFLNFRMTnd6b2V2V1VKTE9sK084bnl3M0NYc09VRy9X?=
 =?utf-8?B?TUw2Q2FQdlNnUkRDZ1lyamFzWDVSYkJueWFtaTV5OEs0YVlPaVdMNWp3YmVv?=
 =?utf-8?B?UzlrOEVsSEorSi9qMVZOQkxWSlVVRHVyRWV0Zkt0VXBHK1VoYVRxeE8xNSt5?=
 =?utf-8?B?ZTFjNm13bDZ1V09Wc2ovTUx5MmUyZ3FuaUxOTkgyOEVzR1luRTRHcFdWSi9V?=
 =?utf-8?B?Z2w2N2Y3OGtMVkE3RDJYc05lRmg4RCtSc1JQc3lQM0xuTkV2SUE3elRUTGV6?=
 =?utf-8?B?akVzL2Vrc29kWEhOQ3hXK0NIbTVmazEwZ3N2Q01BTy83NDM1U29ZRHZRQm5L?=
 =?utf-8?B?YnNNQzZGWkYveERqS2JMWGM5eU1sb09ZOWtrdGtoNkRaMmxsYVExTFkyUEEy?=
 =?utf-8?B?ZlB2aXBKc0prRVErcU5NNUJlYmQraWFBcm1zNFJ5OGd4SDdLNDNRMjZzUzlr?=
 =?utf-8?B?clpFTlB6RDR2cTlpZnRvUHJMS1FhdE9HT3g4QnhWckI1eERHS0g1ekcvT0Mz?=
 =?utf-8?B?RWFDcXVuNlNSdzN1N3JEUTNQVW5PRnE1ZHg1blhXZ0xXNUh0OVZkMVdKV2R3?=
 =?utf-8?B?dXZyRFAvVWMxN1NPQm5EUklWbE5ya2dXRW5xa1dobTFZdVpHYmp4SU4rUllB?=
 =?utf-8?B?enduRlZBcnhpVWd5cU9DMzA1THo0RjdFSUNWM3hXd2Z2Slc4dFhINkUvcFB4?=
 =?utf-8?B?aHd0VUcraUdSazdESGRSUnpKQndQelFpTWQ0MlcxTUQ3TEozUytCT2NPellG?=
 =?utf-8?B?OUxqN29YWHNnSVFtaGFoNk5lRnMvNUp0QUVXWmdTcjFiaStmWDFvbmd0RlJ1?=
 =?utf-8?Q?cj0uKnCngDK6R3cII/U6QK1oEIl5EZAyXTExY1m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36655de6-ca1c-4dcc-ce4c-08d946e03363
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 15:58:20.0252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iggwqYb+opnFBRvoV/We7k3GGBc6vuiK63CEC4Z/dtsZjINUtIaphaOwElscptbvVBiMSJ5ZlRZZoXDNxJCLvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

On 12.07.2021 22:32, Daniel P. Smith wrote:
> The flask XSM module provided the ability to switch from flask back to
> the dummy XSM module during runtime. With this removal the only way to
> switch between XSM modules is at boot time.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Can you please add a statement as to why you/we want this, perhaps
helping clarify why apparently you think no-one is making use of
this?

Jan


