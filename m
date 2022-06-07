Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788E553FFDF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 15:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343264.568563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZ9G-0002AU-1g; Tue, 07 Jun 2022 13:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343264.568563; Tue, 07 Jun 2022 13:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZ9F-00027n-Ul; Tue, 07 Jun 2022 13:21:29 +0000
Received: by outflank-mailman (input) for mailman id 343264;
 Tue, 07 Jun 2022 13:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyZ9D-00027h-UZ
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 13:21:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc1246a3-e664-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 15:21:27 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-q9sVxRYWOwylh4HX9I03Tw-1; Tue, 07 Jun 2022 15:21:23 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB5865.eurprd04.prod.outlook.com (2603:10a6:10:a6::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 13:21:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 13:21:21 +0000
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
X-Inumbo-ID: bc1246a3-e664-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654608086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LoKlRfCzoBq5luuz09Ka/Zz1sWvP7iEM7NgBl5PN9qc=;
	b=ExX/KUjr3zAnZd1HvFFYhj+BXRvbD5wPxa89fu78kxT01ZqE+0yuNg3awLkj+4jdaoSf5V
	buVyY9CWgtXeuV9+2/B85HeI4XhnLAEq587J18K88znhXm3bI35CwsPDlLeqUsBY20+bjt
	0hLxdipm89UEKWUQD1lN/uMwKq1SEn4=
X-MC-Unique: q9sVxRYWOwylh4HX9I03Tw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqPzMrZ7M2vwh++Q4FCnKJcLGwZN7bhhKCkHWbLLADoouFdRVewXZoXXm9HW1mWecyGL7pps3dcumKNKG59enICEsqYoZ2PDo1Uvb1/ejO2ib5HxEHtb/p1xnKgDvuQFWYRE/74MygYTFqYpXpa6kRoBh3WvQtffzBtA2KiD8/pNiZvkhy2bskno7dLMopYK1hkQ7WpQte+ZLKzvQO9171CudwiXKF77B0brjIQ0Nv8s6+am17q7RPZR6kgzxbVfpvXsi8WCn4fLimvD359rzs06+/LWHcBdenih8z/K22vRkdjCUwZpTuW5NFHMExH9TERUc9rq8dO1XjoDp0GBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoKlRfCzoBq5luuz09Ka/Zz1sWvP7iEM7NgBl5PN9qc=;
 b=QXcLTpAqOimKVs1A5g5WbTkkNUuZ2Q59FdohFBIg7H01wNLD9ueWfupUXb+mSU28diX93TIgoDi9ElGZ53mH276yflzkW8xavudWjfHY6iHzZLfr4VrpQgoatCiWrtm9oYLVruYakJs0iUgFrCyayslFhp2jMMLIHQ0I3UwM2BCY0ASU08kS3wsoc03Az5jCnuqspDjtxXvvkddYLHCneAcYacAXvhj+ZX+dX4lkot63iZKM9aJkwhTw3+GNhbrN6JhKSEHj8Ob3Ony/mKal7vNu4epzOmub2LiKONdh3GmRROoHaMX75rEurbWPzPPd5Q8mCp1pYnb6U81fb2DMuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoKlRfCzoBq5luuz09Ka/Zz1sWvP7iEM7NgBl5PN9qc=;
 b=BhU2IJe3Dyfog7XihWLAZXimbRIBWEQP1YGPo3DXLB6nF6kV0g/tdNdH5P14YO5+6t8LoF3s3Jz4Lnc6fBLbNeea3MeS0XzElpILFUuhNqKo7WXmns989eDgvC2ht6HPLQeAfQEFsdpHeEhQKKTVKVKb8vK/x1S+1+0fZXzGjxxR7/ndq153QX2znMBv6N+FvVGkMohfxwxqu4A7kAVKmBCKWVvX3bSi++coBCtwluVe5x4k1ELyYczJL+Gj/wf4jxb342jXdw849EISM/nnWxFQxp7wtzD6TrujKWS8anekXLAFEsFoQghx4UEYpYYSvQFtLD21siRzZCVg9CgXJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <021d1c9e-7989-ed9b-0fc8-1e522e75a12a@suse.com>
Date: Tue, 7 Jun 2022 15:21:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 3/3] xsm: properly handle error from XSM init
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220531150857.19727-1-dpsmith@apertussolutions.com>
 <20220531150857.19727-4-dpsmith@apertussolutions.com>
 <e7582bd3-1a3b-49e9-7d3f-f86ae3d4ab2b@suse.com>
 <a1f633c1-f494-e59d-d5eb-f84c478e5b53@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a1f633c1-f494-e59d-d5eb-f84c478e5b53@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1e2f61b-09ff-4986-65ba-08da48889cac
X-MS-TrafficTypeDiagnostic: DB8PR04MB5865:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB586509E23BCFB45393672509B3A59@DB8PR04MB5865.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZtoXEV/eDoG4q7Rbr9xQwzFCRw7XTSWavZc16VFRrNxY70bVIfjjGnH1yhxAdtzSdAcGhFqjyFOvB6pBTJaEN0V7TEwq9uy9Zhc32aiPH9AI+jOIZKknRVPr59X3Wgu29eRtKYNIcOPwj85M3YghDNwtzFnUIPV3vIz10B1/NV0W78z5WmnKdlcMhotqPF8UeNV0TQzDua9hIGJ6jf4FUAdvFMK716/xjuzt8Gm3BaJDnfV68T5TP0gjYnuHCWgu0S18PIEDil8AfZxbtst2LJWTONn+C+66d3Bybb6b2D93Q1RYebUS5myQVeMV34IjAZjjLMJeP15XXGNslGDcB5hVSUZgnKFk4lA2pOpj3GLxuQ/0fE6bFWNFCijvCrzmWTZ/JM7PK4NRqHlDUs9Urmdn5wKkJ+KGkl7H4whSFi0nsvjJhf6loyFwgu/jb3sntlGkYkZwCiPtnAvh9ojMHwlJpyNlsJBpzQ2wceQv6m+ewtIfvHDL7xu6S1oMCD/TMRhxly3XSuMLV0gZ6BasLV5J/fLTJ3A678qVnNpZU4AhI1XuDkyxfcX0Rvp1D/ChElAvllEy9hoMAvSF7P0A6bSOBqNHKrVHSdbZ/mx6sUZGk9/fl7opu3cq7UgWYWvPThkxKccUkQjhOo/BYLnYyUZsY9Smlh90B6zdwHZ3Qt6SNUg2p/kQyUNaNsOktTmUXA49GzqOwpqL9IxJAxy+dclS3nQeLnwHs1a2FgMmlTqGBui/xyVVseYPbiGhOiZH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(8936002)(316002)(26005)(186003)(53546011)(6916009)(6512007)(54906003)(2616005)(508600001)(36756003)(2906002)(31696002)(6486002)(38100700002)(86362001)(4744005)(6506007)(5660300002)(31686004)(8676002)(4326008)(66556008)(66946007)(66476007)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cURMb1ZuM00wd1FnYkZaVTBvSEJYaXdBUktkZXZ1bytaVnp1ZGJGcVFOL3lR?=
 =?utf-8?B?L2dlc1N0UEpydWJGNUhpSENDdlAxcUtaZVhWWndpVGFnYnZHVU5pTlptazgr?=
 =?utf-8?B?Zjk4OVBIVE1oV1orYUY0b3B4UDJqcG9pZ09zbmlYZThnSnZQbUhGeVh4YW5n?=
 =?utf-8?B?bHFaWUJiMk42V0dvMW1pdXdNN2QvVFoxN1EwcHA0MGJVZXpORkRDZlBRVjlK?=
 =?utf-8?B?NURUWmx5ZHlQU0tBMkRFK2kvdm4zM0QyY3Z5M1JtdFR6bk9VZzkxN3ZkZk5z?=
 =?utf-8?B?RzZlbHN6eXBTTDFXb3lkWEd6elBsMGc2b3A1TkRlSitoVHN3b1NjTkxEZjg4?=
 =?utf-8?B?WURGbzZockRPaG9CcUF1YXd4UTI4eXlwYUxTeHpCdFdDOVFPcmhsRG1DdWg3?=
 =?utf-8?B?ZHl2ZGc4L2dvdjM2aHg1THVsY0c0dHhBb2dPVFR1L01vUEp6VkFSLzV0M0RM?=
 =?utf-8?B?Zi81cU9ZYjFLbnEyUDlTQ0V0amJuTGxqKzJOOWE3ZWc3L2g2V2ZCT252QUh5?=
 =?utf-8?B?NTBwT1BRc2FQQVdJSUNhdzdSTGJ6L3lUTVNKUTlKVmdZSmpZTUdJUG1wY1F5?=
 =?utf-8?B?dGFJNzVxclh0NWlTblhPOS85OUxJalgybHQ4dW5NY0F0NXV6aEFUQkhpdmZ4?=
 =?utf-8?B?eEhWSFdLOE42cU1ibFJ2ODAwVVhLM3hxdUd5cmRRdVZFQmRNNDVMczBLQTll?=
 =?utf-8?B?bTBNMm5CNVdjTVhBNFlxWlA5VStsS0t6SjBFMVlkNUFOZUF0UitSaTEyUjli?=
 =?utf-8?B?YnVCdDN2Qmx0L3pYdVlNY3pSNVJSbEFzL2RMWkZqak9LSnZPLzl1ektJYkNZ?=
 =?utf-8?B?RVpCWVRlMk1KdlFMKzhjQmlmMzhhUDNCMy9XWTlQekkrL0RMVHk3c3M0dG84?=
 =?utf-8?B?b0lrcVpsUFhjd2VDeUExMENSdXBYZEhmUDgwTDludFBiSTJta3YrQVgzL3BR?=
 =?utf-8?B?YWEwQmhTU2U5RFY4L3MySE1NVG1MalZ5NjJBYkRoSnlwaTJDc2UxODY0N2M4?=
 =?utf-8?B?NTNYZFhiUjgvZ2dtR3h6RHNoSElwSjNzUUx5Q3NQUDd1RFk5Z3k0VWs0RHJo?=
 =?utf-8?B?bGZjRzI5TUxEUXQ1RG4rTU1LQXhBQ2ZsZDZqekI2YWlvb0lQaFdWSklwcnp2?=
 =?utf-8?B?WVRGVG9rOU10YVZETzNjaXIrakJYaVVZbmdTdnlNSUxQNmllZFlUeHd1Wm4v?=
 =?utf-8?B?TjZGQmJNVFlPSlZIQTNDRkMwSC9tOXlXREM3b3liL3dRenB1RU5VRzNFb3li?=
 =?utf-8?B?VEVBcVUwK2dVRWZISlpOczY4akdOMFF3a1VwK2ZBc0RQUjNoMWh2c1hXbTlB?=
 =?utf-8?B?Y3o1OVFsOWl4L085KzdLYXpMN1JlUU1FTHVjVHhQWEluOE1kZEszcUNzQ21Q?=
 =?utf-8?B?Y0FxYUVtK0U3TVpuK0d6R0RHSGVDaUx1d0EyelRiV3pQcTdONEh0aTRrZHV0?=
 =?utf-8?B?UHFTVjFtbnR6bnJDZXU5NUJrVS94V2dHMFlvNllDbWJ2WVNEZlFJL0xLaDkx?=
 =?utf-8?B?Yzd2Q2R0RjczbjFBNUt6b2pVTWsyOU9LS3lZQnFmUVR3Ti9PNndMVGZxdVJh?=
 =?utf-8?B?TkY5V1RUZXl2SEptQjRJcFJ6Z1dHOVJkbzQ3ZjJ3d083LytOclh4bnpaUXZp?=
 =?utf-8?B?NU8vV1NXREtwaC9kYnhpK0pQRk1MRkFObk5ma2NCMFFIZDJwbWdINDJyS1Qx?=
 =?utf-8?B?TVV2TmRQNEhiTERFR0hLVy9QR29mQXZwSjhZSmsvRWQ4NkNHN0hxd2lLY2pB?=
 =?utf-8?B?QVEvN0ZLZFNVNVlKdlI0R2QwWGtZK0dyZnJXOXB2UWpiQ0lrL3FTbkVoRkZ0?=
 =?utf-8?B?QkFlbmJJMmw3RlhsS091c0tpQ0VzY3lvTG5hYjg0SEtaeUhtZXFadmNzNmUz?=
 =?utf-8?B?cmxSY2hISE5qcjgrV2JmOThoY1E2Rkl3eWZWRlF5VEx1b2ZmYnRDYUFOdDdF?=
 =?utf-8?B?WFI0N1dPR1U5cUtrOVJXdUcxUXNEd0laQWM3b0MvSGg4Vk1kdlNldUVlUDVZ?=
 =?utf-8?B?UVhRUnRid0hJZ3gyRDVrZno3NHRGYWJTc0dFR3k5SFJod2xJYjd2QlhvL25m?=
 =?utf-8?B?ZnlUYTcvWnhibWlFZk13elVBK1BaUUpVYWtDbWFDeG1UTzBTSmc0andoakNE?=
 =?utf-8?B?OU81UlQ2RENtN1dvVmNxeElKTDFHRUt6SittUlRDdUlPZy9iWWY0U1pYYkx5?=
 =?utf-8?B?SmtSU0Nmbi9EM0JTK3g0bmJwNmkxdmgrN2dnWVVUd3U2QytqeEFOdzZtc0RR?=
 =?utf-8?B?TlpZUkxmRktoL3lJTS9KVmxZSlBWOHpPUFlHZFhNYXpXejJrc2s0aGVCaEJN?=
 =?utf-8?B?VWFLdlhpeVdQZ3dEYjM5R3ZCWXV0SGgyVkxTUGVNZ0NkR0VpUklhQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e2f61b-09ff-4986-65ba-08da48889cac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 13:21:20.9204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81bqv7dk64hk9x7WIcVWGhr14f5abjQo9FDLuUHza6PUQyRp0td5LlfTOxoZqd5SsnpJqnqyuAwgpwjcdM+cBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5865

On 07.06.2022 14:14, Daniel P. Smith wrote:
> On 6/1/22 02:14, Jan Beulich wrote:
>> Now that return values are checked, I think that in addition to what
>> you already do the two function declarations may want decorating with
>> __must_check.
> 
> Understood but likely not necessary based on Andy's review suggestion to
> move these functions to void.

Of course - once they return void, they cannot be __must_check.

Jan


