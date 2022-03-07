Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77F14D01AF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 15:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286132.485506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREad-0006Gn-Fn; Mon, 07 Mar 2022 14:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286132.485506; Mon, 07 Mar 2022 14:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREad-0006Dw-CM; Mon, 07 Mar 2022 14:43:59 +0000
Received: by outflank-mailman (input) for mailman id 286132;
 Mon, 07 Mar 2022 14:43:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/EJ7=TS=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nREab-0006Dn-2m
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 14:43:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03b29006-9e25-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 15:43:55 +0100 (CET)
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com (2603:10a6:20b:88::11)
 by AM5PR03MB2898.eurprd03.prod.outlook.com (2603:10a6:206:19::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 14:43:53 +0000
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d]) by AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d%3]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:43:53 +0000
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
X-Inumbo-ID: 03b29006-9e25-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrTK3Uz/L6kXO5cmYt5UysZPMhJj3oxo+hdFsJUYyH5mmHGW+oncC1XTxEcPuWBHQfoSjntJOCahLDVF5ehUlpRVVQN1CPg9BoAsret4e5Six3U2ln3Vy5TBvLsyeJboAmn4Ef53oYNLI9T7kFJZ9QGwTJqThgaLFelKUAHFHIktuMVfuc9mJcXNzNzma1Td67J5e3SXjOg124PE6nvyCXQZNImaEwn5pugbmuwPI04fTAzMmLXAjbp4hU5RZJpc0eOf6dlzsAOB2Ioqw/YQ86CRRwbULEAihwkZkc4v5ILAR8hrezIMV4njW8Z/8KWTD/DM57YiFKGi3SuT9byqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BMQLzh96Zx8smPPl/rUox3+iY+cxCT4cwG9pFYH1PM=;
 b=ZuM5IALBV84oIxjQMf6O7+HoPja3THh9zDocEm/tP8Vn9+xPWr15SzkNpgA85BKkqHbJw0HbfE6UdPfqz8NoWNIlkdOIbPfgEG0iJZgq1p/HDuUU67O2FoJ17E084ZVXQX2hPp7BMgwGk2H1rFQoQyf7SpWPNHguXIy2KuBA1UaGu6XnDyCV5BZQ3ZhrhU1aIxecTm6RnkDcRXt+WoEBOPANj9pLIPVTll9c/TSmnPk9o8sxD5xp2Cy1OWW9bx4s1mJOSo4vFZOW1N5y5wf+qjzJedrtQwBDrGwH4fRz7veRZhprlWWjGcthP+a357NOZMM137q0R0mydXPfg+tgYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BMQLzh96Zx8smPPl/rUox3+iY+cxCT4cwG9pFYH1PM=;
 b=lLCGDk88v0W+KFvgcuR1FqmDGMjyX/eGKOkMWUjKKG3QNa/y1EVk2AqWc6cUHoJyoaTK3zusK1NEB4geXUZg2mCc6ozVxDpmFMOk6+hGwdjEVLhgeuZ5aMyz+SAvENTLibnA6mMVduui7sD/3bSMnWwmGMp5vA+2SQRV1fM0Rl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <6028180c-ff1c-5d4f-2cf2-582e4104d888@santannapisa.it>
Date: Mon, 7 Mar 2022 15:43:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger>
 <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
 <YiXwhUnZL8bcJvH2@Air-de-Roger>
 <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
 <e5c4c591-8ef4-f8d7-aa2a-b196a5a9749c@suse.com>
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
In-Reply-To: <e5c4c591-8ef4-f8d7-aa2a-b196a5a9749c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::27) To AM6PR03MB5000.eurprd03.prod.outlook.com
 (2603:10a6:20b:88::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25f3777e-373d-4989-cc1b-08da0048e6d2
X-MS-TrafficTypeDiagnostic: AM5PR03MB2898:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR03MB2898078EB9316F463C7EB0D498089@AM5PR03MB2898.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	06TL8Rt4LM2N540gyObXzmYf0F2Axt+4ZrvWslYFfpUB7o7/Dlnt/rWnaov4smDs+u1du37V7x+ufsARUjtMbClw1eYBN+aTOlIZwKTuG04O82+lJWDQi/BwOlCxFf7SYlV8trQgNfi7w3O4isaflJ8MrFh6/81iWIctDZNqA8miDnpDqZOnXP29j9oSBBNAN7+laKuu7F1vKGCoW6jQcLvHFJ2xGzbhKFWo/cSRBcl517jqPS1y3oGO25Sq4FMT/M8/q19DS1LhWAurrilZwA51+/3le/AqLiF4IRVTmQq/Xe5aBWUy2lUZd5/PXfyacbA9Djc9Uv9VcgRX+g4U526lTDmr62rJonauDUKWlOvYGCRYM611kTd7XjoPjXl5I4hhycDvUxCtnCnK9/9KTNCqaNW31rY6z/BGceAeV5V0tNBycRWJHqQpXK0JL1PkfewN75sI29N++v9hD/kUYFxQtV72tRqhAGzimeqn1UyGD8Fpqikv1L6+MguQ7MYUlm+god7jJfSoFtgdbkU2arzTspbk3AE5dO5hZCObC0jtjdAuS6Zai8gDOTqAdtucW9Z7duPR0uPNgzoednWk5oYdthCtBGMMUFiv4dq75hrYpwzC2dtgnMFbGHsyjq4Bcdn4/3lPCqoY6XGjS5neAy3IR6j7upK+oHprDyLXdD6uROIodD0+T6/wQolyn4hfxg7SfidRTu3gM3kLalIxG+zpyHs/oXpI790m/14wBk+1hqiDi+mX4DBpuZMccs1uNvnImLPT3R8yLf85d+Wp5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB5000.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(8936002)(38100700002)(508600001)(86362001)(3480700007)(6486002)(54906003)(83380400001)(6916009)(786003)(38350700002)(6512007)(186003)(26005)(31686004)(316002)(44832011)(36756003)(2616005)(66476007)(52116002)(53546011)(4326008)(8676002)(6506007)(66556008)(66946007)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnFvSnp1bnZHWGpUQVFsKzk2c3pzbVBVODNNNnh3dGJ0QUk4ZlVFNXErZFlX?=
 =?utf-8?B?ZTYrU2hWVGhiQ2txMnNLLzZ5ZFovbTlNWDh0ZGdEVHFscG1PY1ppbmczTnVY?=
 =?utf-8?B?NXdRanFxMjFpSno3UVJFcFY1MGxDSWdOUXQwSzkvazAvQlY4SHRiVFRCREZi?=
 =?utf-8?B?WFprYm54Q1M3YVdRa2s3STd6ZVBHam9zUUo3Ykp0MWg3M05nVFRSQWNsbFZQ?=
 =?utf-8?B?OGtJc1FxZUNOYXUycEIrLzkvd1ZRa0VMc1BDZEw1bCs3Q2lWcjJRazROM3ky?=
 =?utf-8?B?cjlEa0llZS9NdzhYc1VWL0dDNHpQb0pxN2Q4d2RaWWtvZWczblBybDY3NmtD?=
 =?utf-8?B?VjhpT0RjdUlzKzluR1czUGpDbS9TK3pmd0lsYjllcHhFTkJqWEhGQUhLejFs?=
 =?utf-8?B?Rm1aQXNoYXBjWlBicXp5ZElabEkxWjA5eDBMd2tSc3VTc3dOUTNYY1dJWCt3?=
 =?utf-8?B?UkFON1NkRmRHRitLUzFKNGdTcDRpRXhMS2pnSjhpcXRUQzNqeG1KVHRHRXRx?=
 =?utf-8?B?YVVxS1N1SkU1S3o5V3BLY2trZVhSeWFJM0xINnlkT0owSzJpT3hXMDBPSUdP?=
 =?utf-8?B?TzBsY2pBVEhtTFBwY1dkM2hKSFBkL3ptcVVFQ3lRZXJhZlBFbHU3V3huQllI?=
 =?utf-8?B?a2Jpa3pJYlY1STlhNnRQbE5SOGZNYjJ2Z2d3WmZUKysxS1Z5L0dnWGNkVk1L?=
 =?utf-8?B?Wk9WRHNUQVBiNWpKMUdNMVlIYlpoTEpIVy9ZRHY0T1FhUjIvMnFYalJpSHhU?=
 =?utf-8?B?cWlwNjE0SnBzL001MitMaDZ0MHZKQnNTVjAwTStaRjd1Z3pPd1k2TCswdFY3?=
 =?utf-8?B?cmpiVGVaSlpnZG9YdU1DcHJBSDBQeTFnSnQ0TnhEQm5NR1lia2Z1amEwQmp4?=
 =?utf-8?B?VGFEMkJnc24ydjVQTWwwam9VRjMyY3hUMDRrbE1TN2FXN092YWZXakppTXdO?=
 =?utf-8?B?UXVsLy9kTFBmRkNKMHZqYkpMbFR1R3dZV2YzMXB5WnlsT3I1eHdRUmQ2WW8z?=
 =?utf-8?B?QzArWTN4cUc4VUozTUd1RVYwSnZhY1Z4M1lRNFNxVXY0bXJVMDBMOUJSWlBu?=
 =?utf-8?B?Wk5HK2x1bTMyRTc3VlJqanVuMFZ3MTdTSzd1V3RIQ01Cc2xNWkw2L1U0clNt?=
 =?utf-8?B?ZmRobTJIOHpxZ2VKWVFtK09ONU5UL1l0WHVNbGloaG1XaHhWcktGOFNleldM?=
 =?utf-8?B?azFQeVdWWExBbFJHVnBLRmcvUW1HTUVwN0pUMVFpM3F4VlRMa1l6RFE5S3NO?=
 =?utf-8?B?Rk5jWmVzeWM1aEJLUG1ORytFT1lFeEpjb1BmaFVQTm95cElJcTZFMENMbHZo?=
 =?utf-8?B?UmN2VW9ZS3lHRG1iVTJsaU5vcXRrZ1ZwMTZPQ1FFeXk2WXlxbVlFMHN2TkVx?=
 =?utf-8?B?M3ZyUUlIdGZVVXR6WDJqazRYWG5HVTkvY3RhQUxZdmRMU2k5ei90cE5pQzVy?=
 =?utf-8?B?eVc0RzZlOVpMbFlWNnpTTGdNVTltcFdQYnNUV2R6MkhWcUN2K1dIeVdHSUZB?=
 =?utf-8?B?MVo2R3ZaRGdjYTZnMmVxaW9ncUpBM0NTbHd4T3JzY3ptZWRpWlp2OTZTZ20z?=
 =?utf-8?B?VlJWK0IxeElkK0pnNTdXQnMrbWNKWXBnSmZsYjRFa0RCUjJwVXZHc3duK29J?=
 =?utf-8?B?SWVzMGluejRGSG9TMnlUaTVQazBqUG1VL1Vha2swVVlUNFp3U1RNUEM3ZHN2?=
 =?utf-8?B?NXdILzdnTG1XVGNsL2pJTlZLTjhCMWk0djdrU0ExNm9TWGFJTk9xbUxKSVNX?=
 =?utf-8?B?YzZ2bnE4OVJVaVJJSGFiZkE4K2xQOEdZVk1hN1FmRGt0NmZPTXJJOU5RdTkz?=
 =?utf-8?B?ZExOZGVERFVTNlFIU0U1VnlJczFESGUyZTVFUDlUMHBIK3docEtpSnNVNi92?=
 =?utf-8?B?NHhSSjl5bjZNcTdMUWlTQ1NjMnVJWnN3MS9Nekx3L3lTTlRDN3pQalgrRXJG?=
 =?utf-8?B?R3hXYXhuSFk2blFpdUVmV0tzQThEeDNteGtzT0t0eG11WlRZUmZqZDJtYklI?=
 =?utf-8?B?aEtNY2oxVk5JZTFma3pwTlVaQ0hPN1FLenFyNDBlNlNzZjZINFVjZi9HbDl3?=
 =?utf-8?B?dVF3alBOSFVRazMvQkhoWWYyNmN6cVdIT0JEak0yRGM5SXdyOFp3VVlFa2dF?=
 =?utf-8?B?dVZlMmRlQ1JSUVJEOWJBSy9JYWZCdGJLOVNzVFB6U1pRK3VnMFBpS09nYWI1?=
 =?utf-8?B?T3RISzBIWHQvMzhNWVhaRWRqenAxQ3liKzhxY01IeDJ4cnFxM2xPMzJKTmFk?=
 =?utf-8?B?OUxuaWFSbkhFekljcjltN2huT0JDaGxsSjJuVVRHRFBNYjZTTll6Y2xhUkhm?=
 =?utf-8?B?RmNNUDRpWnBlL2dwS25JUmZnRHNkODhUSEsvSWQ1QW9TZXY5b0l1Zz09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f3777e-373d-4989-cc1b-08da0048e6d2
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5000.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:43:53.7972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +acSZdNHqH+37Wq86zvc0n/8zOkhL3ObnR/DYJXSqS4UCN0gksOBZzdbzESjj8aK1US8AlHorlcine7JfZEcYAu6RJmH3UZUYQvgKUtuwYcD+Gsb5hNRn9en1dwizvid
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR03MB2898

On 3/7/2022 3:36 PM, Jan Beulich wrote:
> On 07.03.2022 15:20, Andrea Stevanato wrote:
>> On 3/7/2022 12:46 PM, Roger Pau Monné wrote:
>>> On Mon, Mar 07, 2022 at 12:39:22PM +0100, Andrea Stevanato wrote:
>>>> /local/domain/2 = ""   (n0,r2)
>>>> /local/domain/2/vm = "/vm/f6dca20a-54bb-43af-9a62-67c55cb75708"   (n0,r2)
>>>> /local/domain/2/name = "guest1"   (n0,r2)
>>>> /local/domain/2/cpu = ""   (n0,r2)
>>>> /local/domain/2/cpu/0 = ""   (n0,r2)
>>>> /local/domain/2/cpu/0/availability = "online"   (n0,r2)
>>>> /local/domain/2/cpu/1 = ""   (n0,r2)
>>>> /local/domain/2/cpu/1/availability = "online"   (n0,r2)
>>>> /local/domain/2/memory = ""   (n0,r2)
>>>> /local/domain/2/memory/static-max = "1048576"   (n0,r2)
>>>> /local/domain/2/memory/target = "1048577"   (n0,r2)
>>>> /local/domain/2/memory/videoram = "-1"   (n0,r2)
>>>> /local/domain/2/device = ""   (n0,r2)
>>>> /local/domain/2/device/suspend = ""   (n0,r2)
>>>> /local/domain/2/device/suspend/event-channel = ""   (n2)
>>>> /local/domain/2/device/vif = ""   (n0,r2)
>>>> /local/domain/2/device/vif/0 = ""   (n2,r1)
>>>> /local/domain/2/device/vif/0/backend = "/local/domain/1/backend/vif/2/0"
>>>> (n2,r1)
>>>> /local/domain/2/device/vif/0/backend-id = "1"   (n2,r1)
>>>> /local/domain/2/device/vif/0/state = "6"   (n2,r1)
>>>> /local/domain/2/device/vif/0/handle = "0"   (n2,r1)
>>>> /local/domain/2/device/vif/0/mac = "00:16:3e:07:df:91"   (n2,r1)
>>>> /local/domain/2/device/vif/0/xdp-headroom = "0"   (n2,r1)
>>>> /local/domain/2/control = ""   (n0,r2)
>>>> /local/domain/2/control/shutdown = ""   (n2)
>>>> /local/domain/2/control/feature-poweroff = "1"   (n2)
>>>> /local/domain/2/control/feature-reboot = "1"   (n2)
>>>> /local/domain/2/control/feature-suspend = ""   (n2)
>>>> /local/domain/2/control/sysrq = ""   (n2)
>>>> /local/domain/2/control/platform-feature-multiprocessor-suspend = "1"
>>>> (n0,r2)
>>>> /local/domain/2/control/platform-feature-xs_reset_watches = "1"   (n0,r2)
>>>> /local/domain/2/data = ""   (n2)
>>>> /local/domain/2/drivers = ""   (n2)
>>>> /local/domain/2/feature = ""   (n2)
>>>> /local/domain/2/attr = ""   (n2)
>>>> /local/domain/2/error = ""   (n2)
>>>> /local/domain/2/error/device = ""   (n2)
>>>> /local/domain/2/error/device/vif = ""   (n2)
>>>> /local/domain/2/error/device/vif/0 = ""   (n2)
>>>> /local/domain/2/error/device/vif/0/error = "1 allocating event channel"
>>>> (n2)
>>>
>>> That's the real error. Your guest netfront fails to allocate the event
>>> channel. Do you get any messages in the guest dmesg after trying to
>>> attach the network interface?
>>
>> Just these two lines:
>>
>> [  389.453390] vif vif-0: 1 allocating event channel
>> [  389.804135] vif vif-0: 1 allocating event channel
> 
> Well, these are the error messages, from xenbus_alloc_evtchn().
> What's a little odd is that the error code is positive, but that's
> how -EPERM is logged. Is there perhaps a strange or broken XSM
> policy in use? I ask because evtchn_alloc_unbound() itself
> wouldn't return -EPERM afaics.

As you can see I'm pretty new to Xen. Furthermore, it is the first
time that I heard about XSM, so since I did not change anything I
do not know what to answer! The only thing that I can tell is that
for both dom0 and guests I'm using the same exact kernel and rootfs.
 
> Jan

Cheers,
Andrea

