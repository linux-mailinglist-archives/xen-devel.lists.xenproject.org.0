Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042814B7039
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 17:36:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273442.468632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0oP-0000oS-SN; Tue, 15 Feb 2022 16:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273442.468632; Tue, 15 Feb 2022 16:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0oP-0000lc-PK; Tue, 15 Feb 2022 16:36:21 +0000
Received: by outflank-mailman (input) for mailman id 273442;
 Tue, 15 Feb 2022 16:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nK0oO-0000lW-KU
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 16:36:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 673e13f1-8e7d-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 17:36:19 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-QpAO_WhFP1qVo0YpY8FgqA-1; Tue, 15 Feb 2022 17:36:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB8023.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 16:36:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 16:36:16 +0000
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
X-Inumbo-ID: 673e13f1-8e7d-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644942979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uV3nTGQYjOfjOMMfqv/mHtHSTE3as+B393c9kSW8YQA=;
	b=IZbf5mFhKzopEQKK5xbgNjYIQYPxvndTqk8XnA0s2BBW1HrS10Mxl6pk1ssbtmro3U5Baq
	ok2HephLfpUzhKPy1tODxLhoXxIBkqZtVkb8MxKyqfqgY7V55BHdZ2UMdsVrfmHnRv7MxZ
	5odjcCqsl5zGc1+WkQPV6h4l8AZ/0y4=
X-MC-Unique: QpAO_WhFP1qVo0YpY8FgqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AezeqDoMgXViZFgCdJLAhb8MDQP3LYInokYYbY3PQlgCuYdOC7ZGeS8E21m+AP0oG5Cx+B7+e0DjSo6mo6vRkVmLebJS7utvioyHTFr13uDqDVcWoDAfsTcfuV0Blw3Wt6Gmg17oHkBHmOmW4GcSYeVkocnlgw6ImkPMSuefv96VO5dukp9/uUbtg4SF4Ou24W4fbEyfFSgPtKKdhLulObLRy9x/q/vxEUzNPfJLtfCwqf2lpv+8c8fUoSS3u3txbkiR8lu+CRwOAkOd04kAD619gRisESmctC/kIGdw5D54SnOvzNn+FlXKF6kLNAauW694KUxJh4/oQmiaF2kNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV3nTGQYjOfjOMMfqv/mHtHSTE3as+B393c9kSW8YQA=;
 b=XyPv0UybqaQUYd3Fk5nIbJfJ2t+KIGy66TndWSJ94D/RbARG4tiOKQlGmQJXRMlYcPjTseqI+kALyteQ6wqXt7MXpcDbWNGwA3l3zakw+msr25QaLcKXSkaHltc5ACje7/MsyX06iBZGCx1o68Unl/vUzQDDD6Tr4aRw+vEqLWRszevYyfImOJn4EV/qCOYtvVlReoPjRlvwdfJLbClkNYvBpUHziqNsu8Lzzm0WiLNtFIof37uBB6DsRTSZkbOtf8BRvq5A3PMeOZhXfBNzbFGzfUXe7OkrjXtcfUJ9aobJqKY2mUJIFS7bP+UE/U/epaTv6Al0/qKVoAMobJAcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eda87797-ceb5-29cc-e9c9-612f32b64880@suse.com>
Date: Tue, 15 Feb 2022 17:36:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
 <YguQ8wfhfYFXTWSU@Air-de-Roger>
 <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
 <0d8f01b2-b015-a08e-dd49-e9c688ff7245@suse.com>
 <bbb36ebc-de66-297d-f82f-abc0e63f20a2@epam.com>
 <22d25499-cab0-00c1-3ad3-bddd74c97a55@epam.com>
 <772eb410-be1a-3b5f-3b51-e363c43bc3c6@suse.com>
 <504327d2-0d82-7f88-e155-e6a45ba11a74@epam.com>
 <0c7aa17a-1735-1d9c-9cec-fa3693025256@suse.com>
 <8781c4ad-52c7-2e04-0901-b5b9a36c1904@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8781c4ad-52c7-2e04-0901-b5b9a36c1904@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0018.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9f99f85-eb6c-422a-e619-08d9f0a14956
X-MS-TrafficTypeDiagnostic: AS8PR04MB8023:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8023C0BD0B56E430987ABF47B3349@AS8PR04MB8023.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6qCncbf4nJmkER0o0Cd1eLeAzfXZAJINsyMuaEXx5X3GZq/9kQ8zUTGPjhjXDYz6PIUWO1cD/jmSyfYVUgl+ILGaEsV96hnd8y4mBmgCBLu1B1+REnOgj7fNGRMdHKPx3kskg4BwXPSU3GFTBpwytqWdscsU2gFt433SlLgp1gpApkyG8OpfSRoU69tV82Npdf1/uvh1PfVQ1oHRBLuB1hZZozSjn51hYfPcCjPrhofy9wfPbIF0qx0U5o5ieB2ytlaWlUk8Ac88EYWViXU2SB/AGc29lAgbR8kV0+/ekt+skWzgQaD9fU1WTwAE5evLcjoZnKEABX5YnSgqLjidhxmdJUaXnssmxgN4gCIXtgsN5nT6atvnJ53oC4qtJLAtgmysR1SHvhiW+bMWFg+BVkZUS2slz7oaOZzAoVzJfelh6NgK3n612shKl9aSdFvDzal8GsNu17QuBQ5UNzEpx1ycljKjaXDvvZEVZ6KRgnXRakQim/uFLKc59QwN5kJHQhF+R0IapRGIz66a4eYP8vQxY89B4VdDnywKya6H45oInBH7LmtPmvzsKRH+Ozhf02y7kkB2RhtWECJyENvkaRg0W2JcyvLN+W+tdWDWX0Wg7ufjjSbMQGsa5YsTORKwyqlicUwSKGEoQbskZ2r3Uc2iLL6ttLnGEoqAYXQvIpVsZZFvGA80HNexZFwm6cEa3w9i/Q5aV9OS2L5q7ar73oSqioGBtktuTPwJGybAuDFFM8QRgfLZ3Bxmc8Ep9WqW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(31696002)(508600001)(316002)(2906002)(38100700002)(6916009)(6486002)(54906003)(66556008)(66476007)(8676002)(66946007)(86362001)(4326008)(26005)(36756003)(31686004)(8936002)(83380400001)(6512007)(53546011)(6506007)(7416002)(5660300002)(2616005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OSs5S3QxSDRYelVJanZFb25EV0RJbEp1VzBLbm5mOG9DM0ZEM0k4MnZjeHU4?=
 =?utf-8?B?WWZHT2xZT2VRV1g4MG5JZmtKNzFFZUtmMmgxLzZhUkRQd21EcWFOV3RLNGY1?=
 =?utf-8?B?Z0g0b3gzRWtJZ0tsOEdBQUlYeVRETkhUTlJlL01Qc21TdHdxL1NtL2h1WktC?=
 =?utf-8?B?YktFdVEyK1oxVkVxZG8vakVrZjNVcDdRZjRZNVBwU1l6eGJ5R291aXliNFRS?=
 =?utf-8?B?V2dzeTh3VWM1emtkZUY1SlZhUjRrZ0VhSkppSDB5NFA3QzZLY2Qydzc4MUtK?=
 =?utf-8?B?aHNPeGQrTVlrYWM2eUtUYXlFRnh0NEJxRE8yYVNFTE5SWmpDZVQ5SVV6VGF4?=
 =?utf-8?B?ekN2Z3V2RVhBVGxlRW1RbVFoeFgwQVZRUmNyWHFpZ1hrMDRjNk93M3hsZ29w?=
 =?utf-8?B?Tytrb2V6d0dvV25pWURPaFFzZmk3NndmenkzVWEyaUdIbktVSFV6Y3VjWThT?=
 =?utf-8?B?bjZ6L3pqTVM1TEdUTitHTEdOaUd1cFJnUVppV1A3LzdDVm5Ndm9hYm84YWtk?=
 =?utf-8?B?OTJFNFFSZ05jcUlSdkRrT3d0dUlabWxSUHRYNlluUjV6RkdLb2tjSEM1YTFw?=
 =?utf-8?B?NGdrbUxSdmdTWGV6bHlOOG5YZm84RXZobGdaMGpGM2hEaFE1Z0N2MUJBekpo?=
 =?utf-8?B?ZzMvdGlVYVRKY3BGWHdOZi9GOUhVaTBidEZyR3d6QTVxdTE3MEhIVXpza01L?=
 =?utf-8?B?eWtjNUNta1NYOHd1cHo0cGkxYVFoNHRIditaT2ZUSmlDdUJRQ0p5RUEvbDdx?=
 =?utf-8?B?dkdYSW11K0ZwVm9lU2Jia0NhY1ZBaFgycEpqNk5GSno5dTlPK3BZUHcyS0JI?=
 =?utf-8?B?N2J2N0E2QXdiUUdKZ2JEbzFscEtETC93QUd5eFdSdkxUb2JseXJ0M1lML0NU?=
 =?utf-8?B?V0R0enZibEJUdHlEbTlTVHllTlFQeWtXaFhSSnJ5RktDS0tvaFlRem15aHda?=
 =?utf-8?B?R2MrbXZNd2xWMUVTUkFTcHdoaXg3b0M4b2VNTFMyMFdIYktBWnJMRUl5SThN?=
 =?utf-8?B?UUl6a3E3bFRPZzZ4RS8xbFpyanZRSzNkbERaMFVsRnQ5WGFBT2dtSC95TDVX?=
 =?utf-8?B?MXg5WG1Eb3JIZnBvQTk2MTY0S2ZtZkNCUTBVZlpENWZ2YUUwbDd4cnlqb2xs?=
 =?utf-8?B?K0M5WXBZMmx2Z0thT0xRMGFNODk5Y3htd245dVJxbng4Y3ROSXR4SVhMZmtG?=
 =?utf-8?B?UkhpK1FQbGczK093c24wUDMwVndUdkdUVzJtSXNudG1UbUQrekVwV29oKzJ0?=
 =?utf-8?B?U3JWNkt6OWp1UnFCaUtaSVZxcENXQmlXZnBjUGhKNUNiNXZKTEpWOXhXd0lI?=
 =?utf-8?B?bktQQzNROG91YjJCMUM4NnNzVDdRdXQ4WE53WCt5N1IvdUxuZExRTHVPUEJy?=
 =?utf-8?B?dlpkZDVQZndrUFk3MHhXamJrOUdhNkhUL0duYzgwdkFBVU84WmF3d3dyZVJJ?=
 =?utf-8?B?K0NoNWVtaGk2STFZSlgxL1V2YnpmdVZvM1Z1VFhRRHpkaGljb0l2d1VEaEVl?=
 =?utf-8?B?cStGdE5salhHenZSMFVCYWxNUmlSZGlOTEx4NnJDemJoV3JNS0txQVdQYUN2?=
 =?utf-8?B?c1FrMWpIVXUzWnpzU01FQjN1QWQ3Sk54ZnY2MlE2NStwY0pJZFI3WmVJRnor?=
 =?utf-8?B?aHJ5bkNBQmY0aXdvcVROUDRHOXVlR05JQk9tM29TRjRvbWU2bEgyZU5UbkxW?=
 =?utf-8?B?WDJtVy8wMk5jTW93WWVYNFU0V0lNVWd2YmkvcTE1S21NaXFQRHJPV05FdWxs?=
 =?utf-8?B?dnlJMDJkWDhyUEFldWtkUlphQUNpa1Q2a3Rqb1JvdWlseHFMM05IMGJHUW03?=
 =?utf-8?B?UGNlN2lZQXI5MVgrdE8rd25RYmR5eE5oRHFzcmNWbXZpbys0ZTVHMGlHNEQx?=
 =?utf-8?B?bC8yayt4UzFDNW1nSlBtMWZKR1dpN1ZPaEY3cm91cnJUZ29JZWNJWGRsakdo?=
 =?utf-8?B?cVRSOG0yMEF3UHNxQ2xDYW5ibU1iWnY0WUd1Z3BlVlIxS3k1TU9peEZTZ2hy?=
 =?utf-8?B?TEN5eWNpMlFUcWM0SHZqS2dLSVJxSkZtejZQQkNjeWt1U2EycXRDTjl0elky?=
 =?utf-8?B?cHFHWlZHakRFR09DV3BRMFV4ZXhobzdpQTR0UlJrZGdmUzlIVGtnam5ZMjlk?=
 =?utf-8?B?WXB2aWZ5cEI2SVJlait6MkQ5eFJMdTVrcXVMTytTM21paFd6ejN0NjdhcldL?=
 =?utf-8?Q?LwEZanymKxjX0V4iqZPoHMA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f99f85-eb6c-422a-e619-08d9f0a14956
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 16:36:16.1562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBrcLkLiLp+Lfq/x8M4+jqQSR01pV9euWT97xVxKPed83CUB6qImGhBJfR/42jNJErGFGO82ijD1bImZ4q8zRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8023

On 15.02.2022 17:28, Oleksandr Andrushchenko wrote:
> On 15.02.22 18:18, Jan Beulich wrote:
>> On 15.02.2022 16:46, Oleksandr Andrushchenko wrote:
>>> Question: can anyone please explain why pcidevs is a recursive lock?
>> Well, assuming you did look at the change making it so, can you be a
>> little more specific with your question? Are you perhaps suggesting
>> the original reason has disappeared, and no new one has appeared? I'm
>> afraid I have to repeat what I did say before: If you want to remove
>> the recursive nature of the lock, then it is all on you to prove that
>> there's no code path where the lock is taken recursively. IOW even if
>> no-one knew of a reason, you'd still need to provide this proof.
>> Unless of course we'd all agree we're okay to take the risk; I don't
>> see us doing so, though.
> The question was exactly as asked: I don't understand why it is
> recursive and for what reason. I am not suggesting we blindly
> change it to a normal spinlock.

But the reason for changing it to be recursive is stated in the
description of the respective commit bfa493f52e89:

IOMMU: make the pcidevs_lock a recursive one

The pcidevs_lock is going to be recursively taken for hiding ATS
device, when VT-d Device-TLB flush timed out.

Before asking such a question, I would have assumed that you looked
up that very commit. Hence my asking to be more specific.

Jan


