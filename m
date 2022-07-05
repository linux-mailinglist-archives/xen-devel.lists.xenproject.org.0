Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424F56728B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 17:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361431.590955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kRY-0003EU-Ho; Tue, 05 Jul 2022 15:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361431.590955; Tue, 05 Jul 2022 15:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kRY-0003Bi-EW; Tue, 05 Jul 2022 15:26:28 +0000
Received: by outflank-mailman (input) for mailman id 361431;
 Tue, 05 Jul 2022 15:26:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8kRW-0003BW-Tl
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 15:26:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d50e0ec3-fc76-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 17:26:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3384.eurprd04.prod.outlook.com (2603:10a6:209:6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 15:26:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 15:26:23 +0000
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
X-Inumbo-ID: d50e0ec3-fc76-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJ28TGfPqxth5vtV3hw2byKK9ukTOcyQUj1wysb4JF67fVFK92ZrkAFKKOUAkcsudoqxeEXU5YBrzVejFy75hKmnzu+hwLST9WCRvTNx4J1oUdazyNPdXeuAb4/FpG6tIGdbc+heE2HafhZw0HorQRAvwY+oHMtqZVVl5cZR3hXeoFrZtgIaCJArwTk+Oy9T47os1Hq9oFw/1lREwPyYPppERskI46SLbKqlHXPEwKytcWm/h+zV6M9PX4AWIGeAtrAb3NPHzsA8IHLM2v5YDbNkOa9lY+iXb6nmiCzbQzuwWxxIe4L2ibo5oCr7YQQunCL/RzqUxsCQSL+4WSuT5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9Fum4iO+jl06LBYo1mVpIcFvFCt32NSuWlXNSILZq8=;
 b=GE8NIm3LXyi6Y8vKFx3cicRiMWcL9R2wkFvMqadBbGEaE8W/Pc0KYoojep4/8JkV2eZcnAyojiO2L8/R+2A3MSNmJYsKT4BiD5qTva+RpdKjoRAJeeUZ5eco8lv0hifNr5qmtiG5zf4XPEcd/uoG/A6tUci+A+3NHZ/qgYmZYjNNSkjlEvoWm2klZfH9Ow8YXkOzVLBckbN9G3QX2MFwodyno3tocAs7f6cUiG/Wps9S31iN+/sQue96coiFBGJlAJHSgJXOVp48gC26dik0wgjArROnyRVIavDJAaZv0mkdfS3XUC1hDDA+v1R5t6T6haido2H2kyF5W5fSKAGlFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9Fum4iO+jl06LBYo1mVpIcFvFCt32NSuWlXNSILZq8=;
 b=LnQQZ6ncmm0ub7ap25CLjYtanQEuYWIjCY8UCIDkJD6sCAcpAHlwivVR8LtJ2c9G8x70Pf9xT9cnl25KEP05vOonm/AFZ2j2gAyMLvl7VS9VXeWdDrxDiyqZwv8pUNd8rAVEQqBT3K6V4DxNbwTz3tx1GjG6gVflG5VQE3M0Y9GHoklK6/ZkCNkobAju0TOhaO93fl0N1uRp2qgeISVo+AuP+kO4+Ph4yLHimRe5u4bI44r55JmOkT+1qm5wf1M0Pr89bG9Wi0QdwfcDxRDcty8bobdkx2wGXKPPC7uSz84s/xzTIJXNG+ssEmkbB8Zp8avVCiFWjX+k8xwI9V8Oug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <164283fe-9623-b2e4-3c2a-13aecae5a638@suse.com>
Date: Tue, 5 Jul 2022 17:26:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0138.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abd88571-1095-4ff5-c1bb-08da5e9ab849
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3384:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sbsn2TurDOs4raPtrmd1IFS9sQaOX+BxdfvOZ9a5hs17Niai2Nf+c6ZzBkXRuu6fG2cN6VwpWHVZF2oUuJaWKhLurOb0KdviNfQP0T0yGDUjZFlkM7/xawc409qY4uVkAQY+yawPq7YLiMXJZS8It6JMULhJ1cF7c0Wrgh89GM2EXOri2HRitBUsIZH8IMvpXvMnlVfXNl+7jyubCLYQ3brxLyftCZT2HgANfyEdjYxBd4mAf+1CK8w3r2r2orYMR8FxORBtPiIsKUcQ4vr46ph81H9IzMnarFNB6nd1UDL2GXOUzXdRwkFQ3xNepJKnVghucp2e9mWVKozjWmlhWeJNiOG4gol40umDtUa9U7qUH1qVO1jtvpoCs/HaomNw+7ShB7f33N5mF7Dd6bwJQ1LeKDWg+qt7GsiiVm2RoKuppxMJ6+8K2sk6MkpWn7crt8UKX9TrGyzUM63W6WmUPHvlNYIfFHR+2L/Lg0s//+XXeHMkOU4eTOmTp8//VoEta+5WYsJk4Ijp8asiVH/NuYFHVFTX1xzpwWFnXo/OxUDuaYDWwdeB7A6K+SePCiUJ5QXXnI9RpKo2cYlI1ksfv3GwrkGWWDagykws8Wf4UHx2WspXAdyiO6mDUN/C/0UAVP/Gv/yDHrG2h4bzXKvAv/AmK3dLtROWA88cP9ufFNuUua2moJhW4WJiLNmhrzNkvU7lr4MfYe6vJYLoYNrNa/UKLWEbeyXfuNAlqhXuRmPES9gLURIilgDrFuvZg/yQNZpEcf2N9cL+GW/SaUvnSFF/7TY7G9/Vh0faKMTX9PBMpTZ5HH/UDrGcgW4vmlE1e9bLtxheytyAvLIDG2vD31QK2mEIwQAPc5QUcIFaXLk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(376002)(136003)(39860400002)(396003)(478600001)(5660300002)(4744005)(66556008)(8936002)(6916009)(54906003)(8676002)(31696002)(316002)(6486002)(4326008)(66946007)(66476007)(86362001)(2616005)(186003)(53546011)(6512007)(26005)(38100700002)(6506007)(31686004)(2906002)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzhPN041NStkRkxSQU8vSkFoenAvMDZmenhQZmJjT2pYWHljMTNNM0VRa2w4?=
 =?utf-8?B?Z1M0VUxVRHFmaFlpc1FmUG9uaXdjSEx2bEVIeS9meWJ0TE5CU1l3Uy9uUEEr?=
 =?utf-8?B?RVJ5N0NqaWFiZnRBMG5WTG5ySThIU0N3OFdxT0xTTVlMVzlhUm9IUzZRcmdh?=
 =?utf-8?B?ZzR0eThiODJPb1NqVjJQc2kwejhMcFpza0FCbmNtb1NsMGZiRG1jN0NaSTEr?=
 =?utf-8?B?SzA1MWpNUHp6UUl6OWg4OU5wNGJpOGQrVTM5Q2hTdTE0bEhzbC9VamRCNGEz?=
 =?utf-8?B?MndMS2NDNU51aE5qOGlIN0gxOU56Q2dvejMzZVd4cVVsaFcyem1BZ08wM2Fl?=
 =?utf-8?B?WG5QVXNXYUhPRWFtUElDcWVOTTBuWGVyUlRHdkY4a2ZZTko4OUdWaWFyZm1o?=
 =?utf-8?B?dmtWWjlLYjUvRlN3SlozWk1wQ2o4WkwyQ01NU3VMZnpReURjbDlNQi85UUpQ?=
 =?utf-8?B?REFxNEo4MUNXbWNHM3dnODVIbU9zZUIxemVsRUtleXo0bFdEV2l3bTdpbDZr?=
 =?utf-8?B?R00vV01aazJCOFBxNXh6dEhZOGNtcUt2MGVUMmVkQVNMTmljZnZ0dWZnOHdG?=
 =?utf-8?B?UWUwZlhUWDY3TnRyMnJxakVBbjJrbUwzUTR1c2RXWGpDQXhkcDNubmRWRFE2?=
 =?utf-8?B?Vks0dUV2UzlhU3NhM2lMV0NyMDJqMENRM2RNMDBhdUVhTE9JQnNwcjdjN25I?=
 =?utf-8?B?SG8xckFHRzBrWFR5WldJYXpLYlNHazQ0QW4wQXJzeW1qT1pEbnVZOTFIYi8x?=
 =?utf-8?B?YlBiUVYyVUxOcmErRkc1aS9zaCtRQkJzN0ptRVlER04xYkxHUlMzL0R3L1VQ?=
 =?utf-8?B?YjVwdW9jOEp3dXhzQ3lla2NzeFZkMGlmdWQyVGxvUzB6cUFFVVZhM1NwLzJC?=
 =?utf-8?B?VXFhUzNRY1NwTFh0WmxSSmJBRkpqLzhCRzF6Rld1VWFkc3NtelVVMHJvbHRu?=
 =?utf-8?B?VDlWaDhtZE5sb2dRek1PMWs4SWVyN1YxUXJzSTRoNkwzV3pnSVhCL1RSVVp6?=
 =?utf-8?B?VmMvUk1YM2d3Zk5lcjZ3bFp1b29iUS9tdDYvcUt5TXdjMDllMkRXaWFvZ1Y1?=
 =?utf-8?B?WS91U2RBcVdoZmkzZUIrdnRrVnNuM21QVFlINjQ0amdwOWsyU0dFM3RKajJZ?=
 =?utf-8?B?SjY3ei9QRHNyYTZ4QVJDbjI4bTZMdUxRY2ZRYml2VlhCK0s5dys2QlovdTFL?=
 =?utf-8?B?SXhzcUgyYzZQYmo1YVBTNm1lRHQxTXo3eElKZlBjaHkrbHJQaGpaNHh4bWZ2?=
 =?utf-8?B?cDdkSDB4WUxmRjhOYWVvZDB6VUEwUk4rU28zRitlQzQzZDFYUVBtMjA2aVla?=
 =?utf-8?B?WjBoKzRMSlorUnN5OXhDSHE5Z0tHT3F3RUVRUzArcXpkMnBHNEVKNXMrSGo4?=
 =?utf-8?B?VXdFUFVHbVFSTTc5Wmp5am1oaFRERFhIS3lHWGp0NVpyNW5NQjBhbzhIMkw5?=
 =?utf-8?B?NEZHWS9lUVJsRUFLNUF4ZHNXdXA5aTUvSmVuRnpLUm5HNlpXNHJKREorWlpN?=
 =?utf-8?B?ZVQ2N3Exb3NoK1AvamNuZ1Vmd1VJekh2cjB5NzBJdXdDbnR4Q2JGZnBpeFNl?=
 =?utf-8?B?dHRzZVZIcFBKMG5PQWh5K0NmK1ZIT0xWaFBxU2FIQll6ck9jWmFsUjVxNXdJ?=
 =?utf-8?B?WHdhMTRNaVE4T1R0QkNzdDhZcURQN2xiVGNkaWNmUnFCYmxWd0o3UGxwUSt1?=
 =?utf-8?B?ZU1uMUtsVDgvRHBOMEJsUzlFVjNpTWs3dSt0Wk1YSmZRNWFLTEhVZnZFd0lK?=
 =?utf-8?B?NThCS1RxZTRHRHkzUS9hcm9FR0hkUktGSW9vckZOczlWcWtIUW96eXRXb1lh?=
 =?utf-8?B?dm54M1NwL1lqbTV3WFlYTWc0bnJ6aWtHRFFicFJlalg3eWdyK0FrbmlnTTdJ?=
 =?utf-8?B?bk9TSFd3ZWhUVk4wUWxwREt2THNqT2s2WmJCKzR6LytXd1NQaHhOa2dzVXpu?=
 =?utf-8?B?aGhuTlFyQ0M5VVRFZ2F6UER3TTh2U0MxNUhUSG1NQzdkMFdydVo2ODQyMHpI?=
 =?utf-8?B?SkZtbG9xUi92ejVhdzh1UG4rK1E5ZGpqV3lHVkZJb0dSMjlRY1R2R1FxMEFi?=
 =?utf-8?B?L1BFdHdsaExXZFhyK2hGM1FSSlpMa3N0Z3lyaFZBVDJRUjRqUzhXMWNjeGRp?=
 =?utf-8?Q?RAqPcYS7g2ub3ZPQKbAyLq5KL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd88571-1095-4ff5-c1bb-08da5e9ab849
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 15:26:23.7724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAjUA5v84D3MCOWi1B1G4YX0sZUo6evHyYTiI1Ay2CyFWK5GFxAJmVhaH3haO5oTLQRq89oFOqvoDvP84iGUlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3384

On 22.06.2022 16:38, Rahul Singh wrote:
> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -73,12 +73,12 @@ int evtchn_allocate_port(struct domain *d, unsigned int port);
>  
>  /* Allocate a new event channel */
>  int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc,
> -                                      evtchn_port_t port);
> +                                      evtchn_port_t port, bool is_static);
>  
>  /* Bind an event channel port to interdomain */
>  int __must_check evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind,
>                                           struct domain *ld,
> -                                         evtchn_port_t port);
> +                                         evtchn_port_t port, bool is_static);

Didn't even pay attention to this the first time through: You're
again touching functions you did alter already in earlier patches,
and with them their pre-existing call sites. This is not only
unnecessary code churn but also makes it harder to follow where a
change came from when (perhaps much later) using "git blame" or
alike. Please bring these functions into their intended shape in
a single step (each).

Jan

