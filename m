Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C557CAD15
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617742.960667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPIF-00072Z-Vv; Mon, 16 Oct 2023 15:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617742.960667; Mon, 16 Oct 2023 15:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPIF-00070p-T2; Mon, 16 Oct 2023 15:14:07 +0000
Received: by outflank-mailman (input) for mailman id 617742;
 Mon, 16 Oct 2023 15:14:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPIE-00070S-CA
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:14:06 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4cdfe80-6c36-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:14:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:14:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:14:02 +0000
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
X-Inumbo-ID: a4cdfe80-6c36-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGEKpBqgXU/vVP5InRcGidgh5u0/2avUZ0YhULaBg5kU4V4vc7riw/o3bh4RJmbUc24m55Zt+3cd3aeukt+9HJBsvuevgJK98Yxe64AbesUoVP7WfgeYtY76RP1pQY/kL1BeAGGA3s6L2ycfS2kJ+f4hph2yh3LPVHpPdP9TZs3gAOB+FTrKmcy1hBSS91b1C67Zrms4e5ifm/tlQQxKPVIT/HU+oOqZuxeeLLqRdBVDw2BaYUvxejv0YHSx3cY2KubDwr3tQkgCKCuREAjAbeNMsV7VVlogzuiIWAH+319I5qbMOG3fvxsn9pfsvz2H8azeMphA5toAdkzwyXoPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esvbYXdXlsUNSbbhTQJDoQCN+nuL2FE9x9BB5udDphA=;
 b=BNa9WRyGZiaJ8KeA5GRu5wi2HZst0M3REKv0avK6qTXbOwP1BYXa9QEZTh+BZLroL0fOxi0xOpJ5ll1H4tGin8Gf3Gx+qKNqZzOUQVxh6/o5p2yhGmL65eE0EKG3Uhe4D9n9asV2A6WBXKnYvkfExMhPYz+OOuRKY4sm0AeuVDmIBLx8Gpo08Uk+lpepvDmeOoKiZ+PeS9gXjyjPzL16ztypsbAeF2gtuyDvqEFXHs7AZ/9CMpKxhtaX1DT/N+RqBY2Ji9q3euKQAV3UEDELlKozLnI/spxzs+45FtjLJHOAwwIGl4VeJB/IxTkMgBKvrdsfqFevrao1xV6EPgG8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esvbYXdXlsUNSbbhTQJDoQCN+nuL2FE9x9BB5udDphA=;
 b=wjCMfXmoXt1aDFeHA/jq6uQYLG6tnENdo+6Qg6MEM0BS+43zIw3Zq/PW2MI66mk16bvqHKKb4Ht1XHbrsq448SXheRQFIJfAlMSUuPgFZXSMA2bcy8aHDoKfQuQwu4qMrsfEuVQlKy15y/Pu1ccH1fvCpdKlvGR/+kccMbKHS2SB2J6Sl5e5vCrjEoNr47Aw96Ak13zVnpTEOm4oPGO/R5+2mjLuVPKFm4Dn71+Y0SZ9OFbclBDK5cWvNdRv0LTQHlwxBTjjsMOWnV3Fuuu4MWuu/tt992VOxMRb42B268Pj1I/LndVS2kyLCgBLRcdbuzfcoxARqCeakgh15t5P1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4889bda-49b0-eaee-46c5-22668d8e2485@suse.com>
Date: Mon, 16 Oct 2023 17:14:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/irq: address violations of MISRA C:2012 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <henry.wang@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <fc077d4dba9c37d9d81cea5d184e59f00c3cdcd4.1696242264.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310021545060.2348112@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310021545060.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c2c60e-0fef-4bab-ffc9-08dbce5a87fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vyl++GrCJLLCvri4PMZPHnRETQGxLREnwF79vpq79qc/6d8NyvdzikGNY47zbkdpk80yNv9Efml8jR3XQ/bYeU4b6+sreWALuMhFg4EMNw7zgp6FoGrD5S/+d82YspScN6aAyNA/5Y1G7+AlR6WlSe0e/CWDm0MZxPUaKVwNz2yxOv5SuTa8er2DJyaMH5xrqV5Uexj0bKT3X3RXymRCauMZYivXY0951K6tjqN0WocvcvxwLBcSpXopp6xBkQ1/wSIheP2P+JUtzOf8QHYvlhT70x41xoHzjApVVBiim/5zyX0nAmH377Th+IHu+RyTlLM0dWQr+B1POW04VRo0Wnr4Tm524n4YCZS/uG2IefbBlZxXEC/aDD20oAAb38InpUSNFoZn0WPkxMxWF/g3cX6T5VzqU53Y7V+J086IM/cE8hHMVINVMAZIx5prGPDEeMRNdGTAnmHo2D7uiINAxi0U7o1VO2oxvuhuyMUaPPzzH1RX+fw4bMlt1x1jKqozRFSbBQYW2tmw+359qTrNg12UZSq/714zILyx9EkGMR0s5Pw6Efa3cSxPoIrKaEDizDREncoLZQBC6BaYu4UHEwuOJ4tIgkcOW0/BukZj2Odcqq3N8rz2qBd1nnljajV4Nf0AkBmhliSlOoHBNy6ClQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(396003)(366004)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(7416002)(4744005)(41300700001)(6486002)(86362001)(478600001)(31696002)(66476007)(66556008)(36756003)(54906003)(53546011)(66946007)(6916009)(6512007)(6506007)(316002)(8936002)(8676002)(26005)(2616005)(31686004)(4326008)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDQxU3p5a285MFZMUFkzSkxRRkJmN3FkQnZFYjlMWW1zRkU0U1p5OHZDemRE?=
 =?utf-8?B?dGhlQml4T05nNkZiQTZ5aGJjSjAreEE2QlR2R2Z1NTF4ckhZRUI3d0ZGT1BM?=
 =?utf-8?B?S3NzV1U3ZTg5N2xtaXNwdlorQnpBbHBvV25mVnpVVW9SbDRrbVhJMis0c01Y?=
 =?utf-8?B?ZHFhQkpPRkxrUjJHWnR6emlDeElha1JIbG8zRTd4Y3VCZDJMQVBDbHJ6TUlU?=
 =?utf-8?B?a1J6Yjh5THAwU0VUZlJuYUxKNkZwZ3BEMUMvbFdTeVBjdHRVbjF6cjBON2J3?=
 =?utf-8?B?QlpUNG1Ea2FFNU9TcnpTb1F6OXZuUDhwN3FYb2RuQnpxbHRpUnZXeTlpdkpY?=
 =?utf-8?B?bnB2RHFkY1lBcXdDakIvTXdpUzVGRFVLVDJNSXNIT3lYbFh0MVdJdlBzRTV2?=
 =?utf-8?B?a25odVpyOVNONk5pdTBYY0JqZVhISy9zZi9xSkYvaHFLZFRPdCtGOGhES3Vh?=
 =?utf-8?B?QkF2cjZ4L2FWMno0bjcxZVpESjhEbVkwZmNheVpRRFd1aXhIUzB3aWlTZG43?=
 =?utf-8?B?cHh2eWpZVUg0YmRaQWV1R2dYZDduRmdGSThHUy82czF2dVF1QnBVUm12Yzc4?=
 =?utf-8?B?Njk2RmhUa1VKbit5VnBNUXM0SnpEd3JEZ2xYMFhlNGJPQlRES2RzdGdpdmRT?=
 =?utf-8?B?YitZVnljK21BRDFoVjNPVFc0Q1JLM0gvNnFYa0MzZHoxR2Z3cHIxQTdEaXE0?=
 =?utf-8?B?a01vOUdrQS9zTUl0N2xvY0dkNSsvQkF3ZG1IQ2M0dUNRYU9LaDdTTWdBcit1?=
 =?utf-8?B?M0huRlRpNld3WkR1QWdQWHJ6a3BYc3pzWU5hV2NueSt5UE9aSzFHbnFnekti?=
 =?utf-8?B?SmVsVjF2K1d6ZExaeWRtSjhvR09RSy9IWC9vQ2JLV2FQRVd4WmVBaUJ6Yyt1?=
 =?utf-8?B?L004bXgra1FMYzBQQ0tEZVZrMDJXQy9HMEJGN2wvTVZDZ3hHNitLZGR0eEI0?=
 =?utf-8?B?bzR0QXhROVBUWFlQbEljV3R3K0JiOUg4N1NSL1pDbGhrYUF6TkI2MzdJRGFz?=
 =?utf-8?B?OFgvdU50ZzZqbVYrYzhvcmNvSWxhaW0rMFFtSXJzM09xTjgveHR5YnBhRHcr?=
 =?utf-8?B?NXlhcmpwcFJzZldYUU9rdndrcDlJZURHSmxzc0p0d1ZHSE9KOUpoSHlpTEFv?=
 =?utf-8?B?SzZwSWRTUkhibERHVFZMVFdEMjIxK2ZNclNTRWdibXNFWUNYWVh5cngrN1dB?=
 =?utf-8?B?M1BSNVRtSFRzenltYVhVUUYraGRZelhydXpJNU11L0J0VzBpWVlkK25GNXBF?=
 =?utf-8?B?SmZ0cmhPUVJrVUsrM05PbnJPdWcrU29YWG9keGh5SjE4UEI4a2lEQWZBc2Q5?=
 =?utf-8?B?c1VnK01iYzRqMDg3OXhaMElBM0gwM1NBSk5yaVQzOTFSZG1YMVhPL3BKNHJN?=
 =?utf-8?B?cTFTL08rZXpBUTF6ZmdaVHVkSHZnL0pYZGRlSjJmQTNUaTVmY0tTQ0IxYVRP?=
 =?utf-8?B?MldWVXFWZ3crNzhEbFYzaWZrbkJxSlc5MWdvU1lPZmV1K0F2ZlRwUEc2MHNT?=
 =?utf-8?B?eGNyTHBLK01MUDJ1amVOc094Z01UbGl1cThOSlcrK3N4R2p2V29LN2U1aUdC?=
 =?utf-8?B?eEV1T2pQV3ZuVUsyZlFWdENsUmRXMnY0MlRUSjR4bEFTb3l0cGFlUlZ2bHRi?=
 =?utf-8?B?SVoxMFhISGdkRFZoR0lMVU02d2dJNzZWNTNCeUNxZ2hzSWZZUTNaNGhIVlQ4?=
 =?utf-8?B?WUtIVERFd3V1Q00vNEpPYU1mdURqZ1Qwa3N2dGdpbnd6SldSMWRrOWVHZWhX?=
 =?utf-8?B?cHk5VXgzWlhwRmlRZU5kczhVNFZvOXd2M2hSSEZqQkNTZFhQV1hkbytyYTZ4?=
 =?utf-8?B?MjRSRURMYWNQUGMyWXR5MFNwanZJVHRTRUJad3BhVFdWSEhaMWp0NnlLeDZN?=
 =?utf-8?B?bkFGQVN0c1JwRzNIOGJCelFZMVlaYTMrakRFS3dEeEtuMmhvdXpEeWdmMXIw?=
 =?utf-8?B?NmcrODIzMW44VDRTbGhEeUZ5TFB4YWV2S1NDZkZKcXkxVXRlTWdQWGFIN2Nr?=
 =?utf-8?B?ZW12VkVaQUZhQWdVUGZ6cDRNV3R4djRWcU9yd013Q0ZsWFd6SmQxcUpJbE16?=
 =?utf-8?B?NTV3VEpmZzVyRkZHeHJXRVFBcElRcXpPRGVpZWp1ZzNTU3YwRGJxbURKNjl5?=
 =?utf-8?Q?5HkMoAieCDiyJjy909oqIVKWP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c2c60e-0fef-4bab-ffc9-08dbce5a87fd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:14:02.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ermBoKHqv64WG3eqAAsgqAKV+83oaWg3w2dUye5X4/bzVM+Wju+s8CYKypVtk1q8tKGvfvqiZ0Ceasr4MccEPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9424

On 03.10.2023 00:45, Stefano Stabellini wrote:
> On Mon, 2 Oct 2023, Federico Serafini wrote:
>> Add missing parameter names. No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


