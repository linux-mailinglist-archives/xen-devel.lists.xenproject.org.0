Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92D64C72F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 11:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462013.720173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5P4N-0008KQ-Ty; Wed, 14 Dec 2022 10:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462013.720173; Wed, 14 Dec 2022 10:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5P4N-0008Hd-Qd; Wed, 14 Dec 2022 10:32:59 +0000
Received: by outflank-mailman (input) for mailman id 462013;
 Wed, 14 Dec 2022 10:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5P4M-0008DW-BB
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 10:32:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac3f14ef-7b9a-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 11:32:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7710.eurprd04.prod.outlook.com (2603:10a6:102:e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 10:32:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 10:32:54 +0000
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
X-Inumbo-ID: ac3f14ef-7b9a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQPZX4TyzvXJIpzxUn0ChCpaP2FL5/0S1ik1Ght3Ttkp3pWqFM02q6KX3nUfgTcrVW2ii3T6ks/rzuxGGHjXfnouxG3r476F1qJvvvaArDZrnfEqgc/kqqJLv8NaO2sPXDFcOf2oqrGCtEjmvQ+hYAvTWS4BNjE67dO7GuuT2oM4Yq+EuqThwbLtJvv8WfyuSBJiCbGFE+A0K0vgUIfLzeXKUZ/QfxggJwb0xQxoWy+fHLalaxfBnkIlOQNj7CiBdQm+g4QaEr4GT4RUnfAAp2jUWcaXG13XAf5tjP+AwNs8Pyymg61RvjhuU6GqLnAtrMTwUyYWkBLWB5yvrF13kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmt5gqVyJRkt4e6qAL0DVscfkdMb7JaZkWZ32j2x7Y0=;
 b=a0njlAPZOCbIYr8wtqMXw9QRBkVPwogS7kWQiyqDPZfnHzFuapfz7sL4fds3Xcbf17IsaH9r5aKlfhDLyExFclXdKJDhV3btIBxfhjNtuyiLmd7LOeTOTP0soJq0XXifKnEpn4fJboH3pckky6CX+5e6GmTy9EJf/mbGAabGXTPK6nlD1QOF5g9DDiNqNgyKldH5DXJGVd4ukCsieJYwdewRY6SVKzdu8lmVok1BrSt7TcDg+h3DmnBB2yQuo96l+rCyjd79KQzoMFqg9jzE5+anL20tusnfYwWtVAEI58opd5fMNyA+eQLUsh6GSmbUc5Xz9ktveLgx49htoKafmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmt5gqVyJRkt4e6qAL0DVscfkdMb7JaZkWZ32j2x7Y0=;
 b=0Ev+dxC4Spm0E8a5zJLfXqBLEKIzHy763Jibxj8uaMPe+ZnoGveg4tBpIFbYh1I7sDeXTUyRQi7gN8AiY9OB4vYXxSZbRh595kixaY+0ga2gxGSGww2Qz/h6eUI4rLtvHIEEKISnFtqrl+PahTPUltb3D+EBHJdue7OEfcQcf9qQ1GFpWkG3DfDS1vOD72556RRIgqt1Z71uhfbOLb131ChlqMzIbZUUtnB8XTIH2snhOx3Cjb0DRpJ5+Kqg3dHJgc5dCf3cCaLppI7dMpMGbjsJGrRcMfcCMH3x99F5vsZrnjO14CmXIpryyCykbBCBEonnGjwp2hXVsCzNdXjuuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03f07de4-400b-941f-0efb-77ff3f76e9f0@suse.com>
Date: Wed, 14 Dec 2022 11:32:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 1/3] xen/spinlock: add explicit non-recursive locking
 functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220910154959.15971-1-jgross@suse.com>
 <20220910154959.15971-2-jgross@suse.com>
 <5a3c8cd5-7f78-aaaa-0338-d063bb04e357@suse.com>
In-Reply-To: <5a3c8cd5-7f78-aaaa-0338-d063bb04e357@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c0e736-a835-4c1a-37f5-08daddbe8f45
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vVMH26FKUvKKO/JVkpxRwnDJ8oAiQ2so+mTfPDQMqpsX6bTAfHhxGa6rzmO2SJJ9YQeRBadZSbp5GOPRWTthyKij/hI58pOJKLz03adUzAP8mAii3A7jNvtGyu+xKcjdklvsEUXVUOPOJVtscrnZrcRrv5cNo/aGwCdjqeXt8KZFqrmlVQoldjOTofkQfq9y2+uGdLcxtcJj8C9W0HNaO5w2Es/J4coSpayOhk8pZ1BrI+5dOZILD//Cx0s9/q3Tthl2W/Kqj1/7AqlmiLPxpmO2JSEF5dB2oTt2k5tAqzvqD5akHaq10s12qC/m0c4ujlWg7ftU6lx1wh9JuZJReHw7y2GclM3sfWaOxucVvyERGHfBI5RZXN78APhGFProgg+ob+OFznIueP2haBiFV2h92mqj2TR5mC1ScLM/dWfg1BG2R+bOHh5eMl4AaKlTV2tVvxlae07idR5fcAaeuZRzCcaWwTZUpsFrCAq5E5uYCftNI4Fx+9TUNrJJrTfFta0jzgxgGz+nMoufCRyEKyuPKlZLLZ1DMKMl6/wwUfLyCSbobpIgNN1n38nj+38SLTbACO1jx/dX9judk8Z8brnjEONybanGkvfaX6Aw7Pjt8G+THn0rl7zHbQf8ZXuREcciA4cBesr/GPS1IvXocb7Wj2TBDwfxJTM5ivrP070TXjA8vcLa7nDaPnFFWesAlg/842D+Kh/ODkv2ITRwUGVsXNcbz3k9secNXtflhTdk6SYFQHKRvxDJoLmAyNgQ2ZFsdBsR2jN/KeNAz3IX19We9rhTXR+PCXxtCXM7Byc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(39860400002)(346002)(366004)(376002)(451199015)(83380400001)(31686004)(2616005)(186003)(6512007)(26005)(53546011)(6506007)(478600001)(6486002)(2906002)(66556008)(66476007)(66946007)(8676002)(4326008)(41300700001)(36756003)(38100700002)(6636002)(37006003)(5660300002)(54906003)(316002)(6862004)(8936002)(86362001)(31696002)(7416002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUtSR1F4azF4STg4UTVoRXlQRHMwaVdvWVpiQkhCcUtUQWdNQVRRMUtla3Iv?=
 =?utf-8?B?VmVKN1dzdFJndG1ZSnFoTC9IS3FCR21QYm9jMHAxbk1WSDY4bTNMbEZiRmZQ?=
 =?utf-8?B?M1lnK3UzYjlkYTNrTHdtOXpBWGVuSVl3QmphcmlENDhtZUZMaVk1Z1JoNGdt?=
 =?utf-8?B?Y1JlbUpkT2JPV0d4N2Z4V1F1eTZsQlprOXZ3S1RiamhzRCtTb3dGcGxUaFlM?=
 =?utf-8?B?eVZDd0dObGtWMk43RnNURmN5cUx2ZkhOam1NdjUrZUhvWWxqUWhPK0grc0h0?=
 =?utf-8?B?ZFJaZXdWbnhiZW80UUZjTFZERE00TWMyWG50SzBYUS9QZzBGZXE5RStodGtN?=
 =?utf-8?B?QVpjb3NBTVlmWXpDYzBBUEIyYWVqbHpjdEpMOGFoamtONlB5U2xSb0o4aGdh?=
 =?utf-8?B?QUwyTXVyb2R4UnMxdFg5VVNpVGVsU2grMXlTQ1hZclZLQ2xnUUpFbzFyNys0?=
 =?utf-8?B?aGk3bnJLVFd4MW8wV0tTazQ2RjlER0lZWHlmNnAvUFNBNFg2RzFhSFpmYXhv?=
 =?utf-8?B?N3ZHcUh0NFIzMzY2akc1UWtqbXlmMG54dGFVT1ZiT01XUmhFcW81clF5S2Ru?=
 =?utf-8?B?VVZXMG5GRGNTL2tQRXFxL2tzVnpldjNHNXVHdkRoWjFQSjdoS3oyTVJPMEhu?=
 =?utf-8?B?Y29YZCtkWlFSUVNTMW5zNkVsalFCem9GQVllcG8zZndvcUJpSmx5TVVJREpF?=
 =?utf-8?B?QlpxdTdDamlzYkRTYTRXalpZbGkvSkphWm10NUF5VUduaEt1dU5RQzliMFEw?=
 =?utf-8?B?U2tLZWxWYUFDZnhpU25jbVEyZ05xcXlSRVhxV3YrdVc1OFY5MmQ5c0h5Mm8z?=
 =?utf-8?B?U3ZJaGxQSGtob3FkK3k2U3U4ODUyWnV6Sll1Mnc3czZWd2Q3b0w2WWJYWVFS?=
 =?utf-8?B?Z0h4S3YraHo0STk3cHkydkxHcmdUK090NzNiZjVaVWJkRUVtQnhoak00aW5P?=
 =?utf-8?B?WWtlWHYxaUpNaWlKOEJnbXBjNVdqRWN6NGxVQk8zaWVVaW1ielpqc3N4WVll?=
 =?utf-8?B?a2pPN09NQUkrM3BldzY5S1U4cWhPWjdoVWJSRGIzVGtVdDQ1angvL1MxUWNP?=
 =?utf-8?B?UnhoeitXZ2o4aUxLUmRsM05NUitrU05nRFRmbFE1dXFEUkM2U29rVC9sTkhH?=
 =?utf-8?B?bGdLUDVGbC8zRVdocVIzdU9hMnNLYStNV1VLMTdkTEF3MU9KWVY5Q0s3bFdz?=
 =?utf-8?B?MXpFUnRVTzBLT0tjY0RyVUJLbnd5c29aMVBpTkN2N21vVXVJTVNwUjB6cEVt?=
 =?utf-8?B?SmtvZnNQc09URWFMT0xPaU9DL1Y3ZmFrVVd3a1lNbzAwVHVLbWhQRExpQzVL?=
 =?utf-8?B?SkJaRmdESVFaN0tZZk56WEpYSkpGYy9WVXdxYnNkRlh1VlRtUGo4bDF1bzV3?=
 =?utf-8?B?a1YwT3BrbTgyeUg4UVp5SE5welR2c1h0Z3BWTnRwQ3A2bzF3eE05aFNnN0F4?=
 =?utf-8?B?OE5oWEVqU2FUSFhhWE9LaWJTWUtETTdrWkMwV085cksyc1pDcVQxQlo0UE5N?=
 =?utf-8?B?b2NhY3RybGlDRGlmQ2VwdVBPTzUvQjNFQlMwQTVrckgxZU0rblgxOUlnbmxp?=
 =?utf-8?B?M2ZoZGVGY3BFOTE0SkpTZW1sVXNwcnBheHNxTUlKRjA2dUkzMC8yZXhrQlkv?=
 =?utf-8?B?MzRXdXg2ZkV0dHUzdmwydU9jRjJhUW5ISDZCQ2J1Q0xhMGhGRm9VSUtrTzZv?=
 =?utf-8?B?R25iVnZXcjFMRVhnbUI1WVNzekZkSXZIY0dSL2tiN2pQTi9ORWpJekFmMWlx?=
 =?utf-8?B?UGxVUmVGaU5MWW40L2IvaS85b0dXZVpxQ0svZHdEb2xqOFhxOGpNT1Y5QzdT?=
 =?utf-8?B?MWpLdE9XMlM2MVE5UXVOWVROVDE4d2pndHRYWkdRdGk0ZHhDZTZ0L0tiZmUv?=
 =?utf-8?B?bHZYd1I0MmlnQ3ZlQzlsTUdKUWtVS3ZMOU9kNzdYbDg2cnU0Nm5qNnRSMzBx?=
 =?utf-8?B?YVZwM1pIZkhaV0UwbkVZQVFBRzlrRFQ4eUNycGF5WlBWY000dEdvUDZkbmlx?=
 =?utf-8?B?S1RLU2g4cGVtb0NNQnpQdUFHalNvU0R2QU0xYW1oRzV6aXZTczVXL2xiUnJP?=
 =?utf-8?B?UUxOVzF4WEtUbHhkUHYzMEVxcVh5Ky9WVmN0dVFvQVQyOHdhTWRTVzlsa0pD?=
 =?utf-8?Q?oUGGpmyZyoSgJSL33NXNiR+HW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c0e736-a835-4c1a-37f5-08daddbe8f45
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 10:32:54.4955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0uSgLsqbY6KUVZIn7Ofa4IT1grz3ZM9S5wa9V5lH3IRL/63lq1ApaFgrt80vD4A+DHxBb1pbPjVwbVG2wmF0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7710

On 14.12.2022 11:21, Jan Beulich wrote:
> On 10.09.2022 17:49, Juergen Gross wrote:
>> In order to prepare a type-safe recursive spinlock structure, add
>> explicitly non-recursive locking functions to be used for non-recursive
>> locking of spinlocks, which are use recursively, too.
> 
> While I can see that something needs doing, a function name like
> spin_unlock_nonrecursive_irqrestore() is really unwieldy, imo.

While further looking at patch 2 - how about rspinlock_t and rspin_lock()
etc, and then nrspin_lock() etc here?

Jan

