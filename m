Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200876A05DF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 11:20:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500160.771401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8hc-0003AR-FE; Thu, 23 Feb 2023 10:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500160.771401; Thu, 23 Feb 2023 10:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8hc-00038C-CS; Thu, 23 Feb 2023 10:19:52 +0000
Received: by outflank-mailman (input) for mailman id 500160;
 Thu, 23 Feb 2023 10:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pV8hb-000386-SD
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 10:19:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aaffa7b-b363-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 11:19:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7903.eurprd04.prod.outlook.com (2603:10a6:102:b9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 10:19:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 10:19:47 +0000
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
X-Inumbo-ID: 9aaffa7b-b363-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InuWAKqMbEklGKurheqPu+KcvUSgiPsMzIUENj0QjnC1LOGOnwPjqC4w4GVCb0i/U8WSXDYQIV2FDf67HAaO2JXCn3xzUuZBLy2+ZI9JHBqZEC1I+T3lEg79cIIy7n0ky64ZlXfwVWjFP7PAS33ZFMZI6LvnpWBAOzsX5b+VB3YaOcdB1rUQ7Tvy0AVsP1xEMX14uBxCufTfco7ga0AZbnies696YNdTB1lliLt2yLSXldArtO4dKDWNY/NawUf1y5IUBQ0OgPtDpaIBo8FfGaXJ58gcZltYYdMVvydcupS1FYynVUDvQyEXp1/+SNEJxrTtyqfr4FSP4V/UpOzjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hq5Wpl9CQv4lKNmZI4cnOtusXGPTnGZnwcZ+7Z2tDYc=;
 b=HGt2XrhQlglUmAPKSs479UDPSXNn+lvuhWEP/vGrNY110UQaNRhwVQXccLlRWxjwdzgVcFogqkuH2f4IbO/KsD5SQtmV3ym8b/NO5Xj3J4o+7e+MyH7g9wnaM2x7vUNlWtQDdKOWEHr7N+J0OyiJJfAtiav81+cy1HrF6gTwyswAVkhkUaEP2gV1KKsaCxF77VXV5hLphm42QenCH8PEi6SIz9YdA/CRpY/J4qWaknZp/bFSCdRzTPatpd+FWMnHigJ2/VW+ebHQn2pVz3LLkCd5zZpSyQb5aGG1j5T+/MXua30pEPfqdxLZX8MN/v6ChMvLMroaeUVmXm2LxRj5iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hq5Wpl9CQv4lKNmZI4cnOtusXGPTnGZnwcZ+7Z2tDYc=;
 b=lupOnMI0t5bmVd8zSwzF+QzmfKwJY5EiMdXd5r//2kYrT5FGN9HbnBHrUaeLlo3/ilyi0OwNZK9n88uO8hzAg64mjlnZ9KQrKLmAGe9lSPlFY9CuYRzqDb3kY5W4a+OJ1fNnOJmr6Tcr9YyiBskRC5CgkR2OBMjp2AelLJ0mRDTPpRuwOmDzZo5x4DIl+ANp/0IGvdhyWqr1b/Jk/aU+ol/lNUnlJKFMxywRANESowrkvAXcHaRIr1SiLOxXATjiNrefgCAflX3CXEvJCJ2IVMZvgSCxCOH9lYd2NCbRbN3kA9jXiF4KuOcJRVaYUFboG+M4ihH5O1KomgKigwTX0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07d3a74c-18a3-825e-4d4a-a9d0cdee92e7@suse.com>
Date: Thu, 23 Feb 2023 11:19:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/9] x86/svm: opencode SVM_PAUSE{FILTER,THRESH}_INIT
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-3-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230222120023.3004624-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: d22696d8-c18b-4472-5387-08db15877daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Do2P1Xr4zFSpOzZsnySwI95A4Ck+dKDSPo4VLwlLI3bJUzB4+FUVIkkjR4nh2OhymOViPe1z2QKAPJFFt5+o7KVkYry/h7I8Z9Owr9MWyOvmL/TKC0trztjT7gCrGnFl4SuDRYwaqapVjWA7gdAWafBSGVWJLoaU5J3YuY6+HjlNiAx8lju0a1Y4GlajMTnUsyvfrrcaIiw95NVklyViuJQ86E7WoePoj4cSO1nHT3dhm5OFd35fqRQoKblF6rhO8/DPPh0UlIPmcYObe91gxJVPvhhhjYTN1ZK9KpvOFGFBLG5ic6EWtCj5ZQF9Nx3selI7JXJGCTWRPR2fRfMsHe3gYGl+V11fFHfVz+orF1XHsNaIb6jm7TV+MucY11U3jEhN4ddxGOIIUAqiGNpuPsPaJfYdZj2PM5Dg3rkTjNUvGdzunORKGo50hmdD++XUNKKtymptwEnQpio90SrVEM+8i/LHp38Hr1dDuaMou0OHOeEXD0ds8ib/OkTcLkzeDegMDkpzXeWII3LyiHeBka4MFru2nYuKOqPf6wZ/yHyO7hwUlluqAWzVzNGeWRp2wBTEcIr5ijEHQ6pEGfF9pEx6rRRrjf+iRvv7kLIWWqppPXPJqVWmEj2AnwQfh2sT/Ijl3oRe0x6SUl9dBCd+Tptk53ciHsu6mOD+w7W5ibTu4KEWg9zRvDPsKgaFelMXe2yMATP2t6k5eHFi587jFuHa3Wj5vk9AMFijSVujPcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199018)(31696002)(86362001)(36756003)(38100700002)(478600001)(316002)(54906003)(6486002)(8936002)(4744005)(5660300002)(41300700001)(2906002)(66476007)(66946007)(4326008)(6916009)(8676002)(66556008)(83380400001)(6512007)(6506007)(53546011)(2616005)(26005)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFJrb1BjQUEvaklvWlRoSzJtL0xCRkNUclRYZGQyenRXWFFFUWhHQ1I2dURI?=
 =?utf-8?B?Zm8zK1N6aXJhbElWR2xxWjVNWkVrMk5SR0dsWWoxcXZPdVFlUFR6SUpucG44?=
 =?utf-8?B?L2V1a0VFRzZVS1lCdmlWOUhMMzg0WU1XRUM2QktKdWl1SkkzUEpIUWFDVktD?=
 =?utf-8?B?VzNGak9UdFRMTFBIOVBqR3hYKzhxSnZabVZLRjJhOVNNMFVocXRFZE94QXE0?=
 =?utf-8?B?N2cveXBlMXJZa0xzaDFYOGh5QkJzQ1NyRkFqQ1o2V00rSGkxNExZNmNCenJh?=
 =?utf-8?B?SW9zcW5qOW5FM3QvRlNPNEE5ZFpqQThVd2hkVzJZMTNoaEhPV2gzZTBxZjc2?=
 =?utf-8?B?c0R1ZmNXQ1JscFNhL0h0ZytWald2RnFWSC80b0hNa0djc1QveE9hdWNzYmF2?=
 =?utf-8?B?TGFzYlJxejBsZmRmNFJnV1I2K0NDbVZQa1BpcmVOUUM4VTZlQ2NmT21UQi96?=
 =?utf-8?B?TGpyYnhLMUUyWS9SQ0UvT3FHSGgrZGl5Qm02cFJmdDVGaEprQmJNTFZPU0Vp?=
 =?utf-8?B?WC9mOE9HT0tUOXVwNHprZm1nelppdXo4WnhPNmJEZDZlMGNkQnZlczljODMr?=
 =?utf-8?B?YVRCY2J2MjdYdW5uZy84QnppNXpnMmdaRDFEWlJuQTlyNTdTTElpaUlnMVht?=
 =?utf-8?B?ci9EL3pwOFBCRHA5OE8yeFlSMUVQbEo1Q1U4SnFaYVpRRXc4VFlBazR0c1BJ?=
 =?utf-8?B?SmdyNEFSaS91Skc0ZVR6N0lMRWR1WlE3ZU95Q2JLVzBnWll2T3pwNXBlU1R1?=
 =?utf-8?B?bnlneHhJdklYN2ZKdHA5Q0xBT2RiVitic0xseGNVcWpzaE1WbVB1emVJcmtX?=
 =?utf-8?B?cUdlelhxT2pVbXlUUjZHWjdDR01kd0o1YVFSQVpmL00vSkkwOUUrUThvRXZ6?=
 =?utf-8?B?SXdoeUZIRGJpSytic3gxK2RXUHE4MmlkdXFYaExJenpkdGxXZWxJaXFqNmZ1?=
 =?utf-8?B?b2h5SG92Wm1WMnhmUnBFWitxT285U3Z4VVFwRnovR3JycFRCdkovVHpqZy9t?=
 =?utf-8?B?RStJZ00wekdOWnVyRFY2TTE2VWNWVmgyTGZ1NFc0Q1A1NFZmdlFvejBydC8y?=
 =?utf-8?B?TGVHN2hHa20yRVA4VTN2b1RGRVgwN0Y4VEtDd2I2WndnNk4wSFVkMFpuVS94?=
 =?utf-8?B?T3FsRFFRUzZyTU0rbDJydldvUU9zTDFYNkFHUkJCNlpmVSs0UmovcEc0TW5v?=
 =?utf-8?B?eGsvNDhBRDJ5alFPQTVHaWhpZ0tOS1g5aVRkeVhOdXdjRHZ4OVBRNTBZR2tx?=
 =?utf-8?B?OVVEOWJ0R2krL2ErNVd0aUdMQXMrMnNabUZmY0paVngrck1vU0pScEdUWGRU?=
 =?utf-8?B?SUwwZ0xqK1ZjQy8zMTkzZkN1SFdvOVF4M1pjRmRDQmdNeWlrNTJENGFwNzMv?=
 =?utf-8?B?RXpZUTdJQTRqQ3YyVGNweGcwbnErekkyWUNVR3RtOU1GdGFqWkZiZElYTFNK?=
 =?utf-8?B?WUJTRFd0Q2dDMjNFblU4K2M5WXdsQTQ4M1FXak9JT3JxWWNwUlloSDRmNHlX?=
 =?utf-8?B?Q1ZRT2preFhHUTZibW45cnlrQmhyaTRKRnJhVHdOWnhiODNqcVpWMzJJaEFo?=
 =?utf-8?B?bGtoMm5zL0RlQXhQK0VtUUY5VWxmVFV5bE0zbFIwamFsRDBYUVJQN3ZCNUo1?=
 =?utf-8?B?eUdmRXpjZlk1WE53dDVVZVQ2QWRRb0wvbUhpV0R0dk5GVTFTMXNhc0x2Q1lX?=
 =?utf-8?B?bDJsall5ZkxvSzFTVzZqQlIvUlc1azJzM25MTmQ1WHUxRjBWUWRQc2lYZlRm?=
 =?utf-8?B?UFNEdGJRb1ZoL29Kb3hCVTd4cXJ3Tmx3UERya3Q3dXY2eForQlovWFFuVzlR?=
 =?utf-8?B?WEFSMFpMN01ScU9jQkROZEdJaE9tWUpSVWl6ODJjOUNqNEM1czI0dUFPZUtD?=
 =?utf-8?B?eTFmcE9WOUpsWnNJRkQwVEtpODJkcjRmdU1NR2ROZlVKK3MwQk9BTDFXTEVn?=
 =?utf-8?B?dFNURHQrajkydksyZW04dzdpVU9qS3poSlFHVlF3N1pOMG5EZWJBRktUSkk4?=
 =?utf-8?B?YzlzTDdDdkFWaEM5WHFXZExHOGlEUHByUGZUbHJIdkxYbnRFT0llTHVxUjRE?=
 =?utf-8?B?SFZiN2lxWFZkQlA5clArTHNOR2ViVWUybnZFZG9iRlFzdGFrS0tqTS9rTjVC?=
 =?utf-8?Q?D4cba74M5bPG4JK9DXlhYJNxI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d22696d8-c18b-4472-5387-08db15877daf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 10:19:47.8186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hK6eJBaHcMTGNS6Dr70hi4aAiS8xgna5VSqAib90J+ymXJ27pyX8VevPRUTLxi1XDTmqb1EENTcYW+fVSMAkfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7903

On 22.02.2023 13:00, Xenia Ragiadakou wrote:
> Delete the macros SVM_PAUSE{FILTER,THRESH}_INIT from svm.h and opencode
> their values, since they are used in a single place and using macros is
> just unnecessary obfuscation.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> Changes in v2:
>   - opencode instead of moving the macros in vmcs.c, suggested by Andrew

Which hence probably wants expressing via a Suggested-by: tag. I guess this
can be transformed while committing.

Jan

