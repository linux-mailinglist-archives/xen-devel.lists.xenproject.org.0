Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BA87A919B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 08:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606091.943817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjCjU-0002LB-24; Thu, 21 Sep 2023 06:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606091.943817; Thu, 21 Sep 2023 06:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjCjT-0002IP-Uk; Thu, 21 Sep 2023 06:00:11 +0000
Received: by outflank-mailman (input) for mailman id 606091;
 Thu, 21 Sep 2023 06:00:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KrUB=FF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qjCjL-0001mO-Sh
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 06:00:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1af6f5ab-5844-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 08:00:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9459.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Thu, 21 Sep
 2023 06:00:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 06:00:00 +0000
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
X-Inumbo-ID: 1af6f5ab-5844-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhAQqOVna0nDVTXX1MQ9uLP3lXIVLQwbDDN3wuK6zZwAKlPaDHjlGneP/0pnwnkxzdyH3q+EGJ6Q9OVK1JmkC2rW/24ypICBIVzEkdfz+sSWg5WVQkhjek3vkZ/i0yaSjr/S8e6mj3jBKKs68XRiXXXo1VyslaLyQTAmyc/UpXopfHm+PzcBpIBDvb5QWCpQxVnsRv3Oh2A76U3K/hYdu00ahpqicUnK+MOWLgQYGM5c9YSFdNs3fQpePRbO+O+3sLTFfFw/D2d2VamCJ8t+ZAxpDx1QBAb22gfnTJ1w9uDYJRUWtHbobapMDcDi5R/KPHIM7WcKIps4AWcaEhgEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdYFjE6lfyMnuzb7cPNolUuMZ69GngNquA7wT44buaM=;
 b=nEB47hMzGvpJOJOzi8dpCtTdjrXKENFYk00hmnnAMtnT9hHJ7HX191428GT+Uics/ioe+iKao/Aos5DYqaxIN4sRq45LvP/I3uZJdzxwtB20ulTeZoxcOxjJYGGMlZNwnG+doP6itPSY+boRvsA6ARpKl53J2aM6Ey1Bn3ttd/LRReJxZlJ4qRwl3YnfDHu4d76wy/xH4HYagDglsh7wbpk/bj4A/Todo+wKGhxMrCchbo8HRcWZ6dpWu+3/xOqywbeXyIfz+cmuy4x5Bu5tPBmnww+668ZyGLGipooI2uwVMDuw0QVEHphX9G4ojJdx5yeoVWEtBFVwlmXfwbuxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdYFjE6lfyMnuzb7cPNolUuMZ69GngNquA7wT44buaM=;
 b=FH3BQD+JZ0qnSQmFRGV398ATTO2umihsByd40ADLRY3uZIxvMU/GukvHNI1uwYmGm1s9R9cup2MUMA2NzjpF1qBhQsJtu3VWv4Y3S7Uc6tjTaDowgj4erELSEa76pQt/1nwL7vK7WRYIAoMJUOzB8I9mx/wsylwAdLdJJpEZPZWJPr3qyh1tF8XMiO2dWBQebEKyAzMTyFnq4FNX7T8D4SfQxKXAc9dqRECa3JZ7I35CLw9CFzbx04iaihBW9872YUp0C22xP3bEZEBBQ109HcjcotK+DCb3CJbd3JxT40JzINkTz2VyE5zQHUoWPYwfoD8WwoACrVw5afMt/PQv2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9003c40a-a9e9-4552-71c0-b5b6ea50c1d9@suse.com>
Date: Thu, 21 Sep 2023 07:59:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v3 4/4] README: remove old note about the build
 system's python expectation
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Javi Merino <javi.merino@cloud.com>
References: <cover.1695104399.git.javi.merino@cloud.com>
 <83e6857f16eb000f8368fcd9995e0411f0177c2e.1695104399.git.javi.merino@cloud.com>
 <dff889ef-ec24-2cac-5565-18376f5e331b@suse.com>
 <e878bca9-74cc-d16a-134e-e4728ad0212d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e878bca9-74cc-d16a-134e-e4728ad0212d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6a64fc-37d3-420e-69a8-08dbba67fd7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Q+HMdbMOgeG7Rygt2WTl0yKXoVMIqz4bS1y9i7bwo/f7ETovNRqkWzisOzJ4IjtLd5F1VuT5aQiPkpKO6R6TDHAUTndhW9W9rJ5Ir+3nf5flyjlBf2FyDhjuAhrkjj5pa+67pzVJ52RsmJHcV6qcXXm3iaIcHjd5qHv3tEyf8+YwOiO5Z14P4lc9hLLKxflKV9SipVOjnvoyW6riA0WRGa6c3mttm4WpyWXn8bsjAZdJEDE4/GK+TbIo5sRhEn7yxYNe0knE9QLdFbTlLG2reQk3EkLMyGcO53rDrF/2QWzFPCQtJPtmge37INTUxokN6UcE5KaEeX2BQ+pEHRonArQADp2Q9eBioA07K7bHYkxEadSzM6o5hC44RsFe7jsrZpopxzXagTqzrSwiEE+nZ52lQFU+/C+BILxbbREoA5Zt3TXq0lDaFtlNfDP1aV5de+oxWGxIywDrmFUQGS2z+pS5YbAlPQ7ldRYbzC1ftlG9+3wA33pwNN5g/QW+88uF7YeqqhRfMbzBqm3lHxBKXIOMGWnplFmnnDYtBosOeLx4l8at/0uHvf2fXBypw3BdXThd+LKdz6p1krFlRYBJbdBidTxOaslu6pM5dL7WnIU1ggsgI5tlkrPt9+uI2tvh9sqKV12uqKJybi0e58CaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39860400002)(186009)(451199024)(1800799009)(2616005)(5660300002)(26005)(4001150100001)(41300700001)(4744005)(2906002)(31696002)(86362001)(36756003)(4326008)(38100700002)(8936002)(8676002)(53546011)(478600001)(6486002)(6506007)(6666004)(6512007)(83380400001)(6916009)(316002)(66556008)(66946007)(31686004)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3QwdWFUd096alMvQnRmQUozcS9QVm9QcFhCSy96V2JIOTZSNloxamRNT1VT?=
 =?utf-8?B?QUdzZnR3bUthOWE4SWp2M2V2a3BCQU5heWNHbWJCN1ZmUGZraW90MUlJd1Zi?=
 =?utf-8?B?TjRmZXhWMlFWNmlYK0c1VzNpRGNVVlRwQ1FnUHVESXM1NUpWbGt1VnlUdXpi?=
 =?utf-8?B?MkVKdzlFS2E2UFdsWHBoTUJrcUhldk1MRk9Pck84WEFsbFhna3NzQlhsbnpI?=
 =?utf-8?B?TUtuaEM5SHVPMkswdGN1emxXQXdsZ2lwMkNURjN2WHplYm52dmJjcGlQcEUz?=
 =?utf-8?B?WGlCNWJJaWY5cHc0aHpoWmlxdmk3V0hNd3V2R2lyNldobkc5QnI0UGl3NVhJ?=
 =?utf-8?B?SnU0djMzSmp1SHJucEdveEFPV29Cd2FHdmtjQ1dtQ2FDUWNwNUVXZ3psQkYx?=
 =?utf-8?B?UkZTV0pCQ3J4a1FFdWxDcHhnNHI4Vkt3RWMwOTlHOUlmWW54cjZtZUxFbWdV?=
 =?utf-8?B?SmNBb0tkRjJ1SEtBSGJ1TThvSWdUSW5CeGtuUVdOb0lkQkc5Sm11QmMyZFpl?=
 =?utf-8?B?YXhMS0Z2STY4eDVjVmUvZjk1aGVmZjE4VkNPd1FzblFQSkxBd3ByOUZHWXNt?=
 =?utf-8?B?S1hnOS82QnlTdXB2UGtYb1pMV3hDeFU3d0hWNlRVM2pQNkpVRWM1cG43TGs5?=
 =?utf-8?B?eSszeWlSQWVmSXpObENMZjRmZmRYeFlHc1dCU1dPd0E5ZXU0ZHVrRHJZdlUv?=
 =?utf-8?B?SlZNdlppdFlrRnUwcjhvMFhVdVI3SzNBR3FEb3U0d0tuTm00bWRKdC9ML1VP?=
 =?utf-8?B?bUZ4dzMvc2FYalVwSmRaWEhMczRxR2c2blZYb1pIbE5FcUdOcUxSTVJ4SWgr?=
 =?utf-8?B?NzQxelc4a2I0YjZDaEErNVFZWFVVK1R5anBpbDQ4RjV4MW44aVMwOUJWVlNx?=
 =?utf-8?B?KzZ3MDBYYnc2VHkzd1hJeFRiWjNSeTc0ZUcrNnRHMlJkUDREcEwyT2tYNFBX?=
 =?utf-8?B?N0Z6dnZLVHhqeVQ5Ukl3Zm5KSmZmY0M1TnVUc3IzbG93MGlxazVlbzFiaEJR?=
 =?utf-8?B?ejJBdUwvQ3dKMVlod0ZkYVhHb1FyeVNVOUxGQkZPd0s3TUc0MUNnckNhVXNw?=
 =?utf-8?B?U0xvZVZOYko2cWtyL3JHSlpPVENmbSt4aDd5STlIOFhBeFlHZzVQdVV1Q2hU?=
 =?utf-8?B?STB5U25XdzhDdjhjVTIwUTE2M0JUVE9uTlpkdTZCUXJHNlQvL1JCQ1lXQlN6?=
 =?utf-8?B?Z2NMMGxOVjZCeDRQTkZaV0grQ25ickVNWnVYWFV5Y0grS3VKYVB4ZVZMeDI3?=
 =?utf-8?B?YjY1S2YxMHhsaEdkaVU2eWRxanFpa29oYVF6eUE2cXdGM1ZGRTBxZ1lQQmtS?=
 =?utf-8?B?MWhlUDJTN0NlcFJNdmpzNjlsbVBheENDb0tvSWhyZytaR0ZFSXAraTZjN0Fj?=
 =?utf-8?B?K0ZzdlRDdkozdHlWZDF5cmNZVDhqWHkzT2VRbjlydTExWkU0OEVTK2NoN3I5?=
 =?utf-8?B?YUE3aGdQS1laMnJLbHBLMFhHaFAvZ0xLd0phaTRxUHhESHFBRDU1cmMvS3V3?=
 =?utf-8?B?OGRBVkJEVjAvU2FJdWsvOG1uS0VyczhiOHRKQUhhbmNkelU5M05NSm02TGZV?=
 =?utf-8?B?QitFTTU0RDJPVkZKMkViR2w2UnB5V2hod3hTVmFxb3gzd3NaanJmM0s0OXZH?=
 =?utf-8?B?ZlNLeC92emJtMmlPdUNwVm42dUpwb1NjaUVCT29QLytYNDliZmNxSFBNblNX?=
 =?utf-8?B?VEtSd3JnaDBtK2xlbzd4TGJzc1pVLzJ4aUVzRDgyOXpFdU1aREpLRnpyWERK?=
 =?utf-8?B?R0szb2UwK0lkMGpWTSszd3l6QWtUZ2w0eW9JTkpmTXRWeWZGSTlmenk3WUpN?=
 =?utf-8?B?cGVOTXdyb0NLWnhvVHNRaTBMMlBxbXlCWmZKUEZvcVcvdjY1dmUreEhNUTNu?=
 =?utf-8?B?TUpQUWpYT1FQY3hyTEQ5dVd1OXhiUEprYkxzYUZwTGo1TXI5ejE3V3NGVHpl?=
 =?utf-8?B?cDcxU0J2UzJDNlBZcStsekJVdEh3OUZCRnlNM3Fmb2VCWTJYa0pKM0kyb1Ux?=
 =?utf-8?B?bGlFQ0RpVFBLWTVodUR6UWFTUjIyamJzdjJBcFp3YmFFcDVxYnhhOXNwVjl6?=
 =?utf-8?B?Vk5hV1RxaS9pVmhpSWozWFlTQWhpZ0lqYk16K21TWW5DZ2JmRVBaRWc4NjVT?=
 =?utf-8?Q?M7SqbcgOrtdqrQGgbSUr1NqKZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6a64fc-37d3-420e-69a8-08dbba67fd7c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 06:00:00.6546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOY9UObEg6lij6sKf16X0iLoJPTejUczfYZ+jIcgrh4n3Yjuptex8XT9hWRCFNVFLSxqQ8mPZl2qToyaJypt1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9459

On 20.09.2023 21:40, Andrew Cooper wrote:
> On 19/09/2023 7:50 am, Jan Beulich wrote:
>> On 19.09.2023 08:30, Javi Merino wrote:
>>> 5852ca485263 (build: fix tools/configure in case only python3 exists,
>>> 2019-12-11) changed the configure script to test for the availability
>>> of python3, python and python2 in that order.  It sets PYTHON to the
>>> first one found in path.  You don't need to have a symlink to python.
>>>
>>> Remove the outdated note from the README.
>> But that note also covers the hypervisor build, which isn't affected by
>> ./configure, and even less so by tools/configure.
> 
> The hypervisor build equally doesn't python= specifying.

I'm pretty sure that on at least one of my systems I need PYTHON=python3
when building the hypervisor.

Jan

