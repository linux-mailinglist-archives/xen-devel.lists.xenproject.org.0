Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677936441DA
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454653.712176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VoI-0002u9-Qf; Tue, 06 Dec 2022 11:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454653.712176; Tue, 06 Dec 2022 11:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2VoI-0002rh-Nd; Tue, 06 Dec 2022 11:08:26 +0000
Received: by outflank-mailman (input) for mailman id 454653;
 Tue, 06 Dec 2022 11:08:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2VoH-0002rZ-Ae
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:08:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cad54b3-7556-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 12:08:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7449.eurprd04.prod.outlook.com (2603:10a6:102:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 6 Dec
 2022 11:07:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:07:51 +0000
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
X-Inumbo-ID: 4cad54b3-7556-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPy4QeECFK9X8WV7JSFdFMdcIp0B5KIM2YZoAO6MCv+KluVIxWZKGkjOR28IweuBRraZXWJfgmU5NCH4v4VuEp89oNFTR7R1k1emBA2SiSU5ePTNxxOztOQTUYQB3x3KnXuRaH6nCziqk4f+uctFV236BbvVqyNGuDqPn4RdBNxgk93DicgsDEsFp5w/nqfF2tOmWpBeSKfiOjomuu6kLsl1gSoR4z6jHK5NXAIUO1UHJpXLLuRoO9jAM2r309n6BgNxn8CEAwQ7AT7apOerw1Khgy7KDqFwnIYsnFZEpeFHJq+2vV3RJBBm6SQATcq8S0oQWbGWnx9uHVUUHOeD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f21hIBnvjdpCSssyREkyq4ksAWaZ0ZhSaml5UfIOdmk=;
 b=F8Bd7WUzhQDt2jFiMmuMfHMZqRWpNHcq8cDp7F+XzHvCgv6Xu1J45FvlJZlpSPMw7+gabLtAe5TQYR/rl6BM5YdIP8WZCu9WmYoRfvb+vTA6ihRQW21PFMXrhtSBADm85IT9K0xpV+FeXV+FstXwa6j217UBLws2HuYVQqnKFJ2pRwZfeTs+352HGy45GGycZSaRhzpEdstn1w1NqO4hWoT+p4HtvtQcUq+5DuaV7b7Jlcy0BjggAYzjgzEN3BkDfR/2dmbmmMwOGBRT4CNcO7eUDBnZN0u5qdUnDFtVqJvIG+7Cqs+hYWriMvKdrNfH0f98oMz147J4cZOM3qFDcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f21hIBnvjdpCSssyREkyq4ksAWaZ0ZhSaml5UfIOdmk=;
 b=blJTz9f7Tx554q15l/ofvaO8M9C1rYe0+1fsVtyNgTDEoaL6qcBMYtWwxFbNi9mX649zC5iGiCeoXBvFVwR9S6mjYJ0fPX5psUgwxJaukeDLXgYBVZsMfLC9CD9YxQne1i/t96YxFY+l8XwD2qM7EZFl97Dn8vhuBmioxnPXDlO/rUC3un4aG76yO3awc4mzQH/DoFYfLOg0Yni2Hla1Q8qHnoid+IvwH0hXukr7pGgiMHP6/SzUMor1hfj/7yEvlJKUXq/PACt6Y84dLuGoBdMwZcICLsuIadzxFRKIhW4PIQqk86NrCEZgRElMMcUNRWiukFOQyEj8oud57G9niw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59c3ba9d-2c47-c59e-3dc0-932eaf11782a@suse.com>
Date: Tue, 6 Dec 2022 12:07:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/8] x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <c70f4c4584cf28ff1da8f56e08d61ad0c406a4fd.1670300446.git.demi@invisiblethingslab.com>
 <e66f8611-2df5-31b6-186a-d35ec555c605@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e66f8611-2df5-31b6-186a-d35ec555c605@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: 1936c4ba-5bd8-4afd-a9dd-08dad77a1ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/K7rm99E/6Ckm2v/sPBRJFS1O5WFEszmLuqBz4H1cU7a1FsSbL2TusfZ1Tujn84nXRu2GNmd6CRUg1LNKOvlN2Rx/7SiDy29ZSeUXlIz9u07wkeJAJ+XChGb8RPVYk22H1ukIahqAXtfrNUvb1JNS4B6uMo87S9uqIFSVAh5VWCaDeuF3x+ZldrsySUwCIPm+2PKWMi3kmGHVEUxr4mvsN9afnpuFOIKP7IBZ26yiFT9UpkJNn1dowJDJws7U/1za10lNeu3Ke2aZcKCeqkQ/7g8wxvwyLoBD3voY6rcgX512kFugepUKZrXH+cOFi/d9obifmk/MFsAKfvDahF0eOP3xTjZ1BWymLLQhiAKbi8Y9wXfPJCrAKnlZKPjsvGi0As2Vhv7rNB/uWOwKSrnceUfQ7EZgm6i+DJLFnSpbNLMY1ttSojtC7yKz+4CccDAb450lNvONxdbMJIWpLQdbT6aL6qS2Y3lBekPIrhEzjhv7HSZK+pvSBQtV71OPATSxiPiui5rD06eSYzB/9FUG6e7USUx9YGHW99zcuoEDXmUck/f5VRvifED/Ly9owqprJ1fG8ZThtshCZGU0QPvBNGqgQmwNuNFVzwiAXG65iHhMPcOuswAnUt1mAYS6DnDRvqW3EmBRa+v1/SbA3vgDvszWcxbAiwnR31iEEc+YBmANcRE59j+agdSGmvbwXEYr0KnuUDDbi/Mg6gLag+YwpCBdDIo7IUfmRgCHcnGhKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(83380400001)(86362001)(5660300002)(31696002)(38100700002)(4744005)(4326008)(8936002)(2906002)(41300700001)(8676002)(26005)(6506007)(6512007)(186003)(53546011)(54906003)(2616005)(66556008)(316002)(66946007)(478600001)(66476007)(6486002)(31686004)(6916009)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzBhOXoyY2pEQTc2c0tTeVJzeSt6UDBFcms4RlRSRk14eUxweTRzT0xEdm5m?=
 =?utf-8?B?dG5Ga25lVHdYUlArTFU3WWtCMkNKUGtxUGZkMmJaU1F4WG5FNUJ2ejdycUtQ?=
 =?utf-8?B?Z0tkblZ1TVoyNjBIdTMzUndmTWExZG9DdHR0WWg0U2VYcEk3Q3V2endMSlpo?=
 =?utf-8?B?SEorNno4WnZ2TDlCN3FxTkErbWd3VTQvRmdlb2d5T0JSdEx1M0FONjFBcG9P?=
 =?utf-8?B?NGZZeTFLM0c1V3BtUkpJSUt2Y2F3SFpqWmwzNGg5d0kxLytFVkRxekZqK1pC?=
 =?utf-8?B?NVg1cnNwbHAxSHB1T0w3WEJaVkdCOU4ySlEvN3d3MDhnUUpjNnRvRjJDTzNo?=
 =?utf-8?B?K3dLdjF0SU9KSzREVmdHN1BaM1AzN0E3SHdhOW5xejJmZ0kvaEpuNkVONVhL?=
 =?utf-8?B?S20yYXNhUHhHM1B4Ykphek5BMXg4WXVPdWxYQTJUZmY1cjA4SFI5YytVb3dx?=
 =?utf-8?B?YkVwcC8ydE5uOURQclhTZ1B2eEM3b2o2QmkwcmY0c3puYlFjaWdJU21oVldt?=
 =?utf-8?B?aXBodjQzUHRqTDZ2REpKMGVhZEt4QzFxMG9xbVMwRnRzby9yUWhrOVdrM1Qx?=
 =?utf-8?B?M3RIOU1hTlcvQ3hJL3dzMUM4U1F0SGhiRUFEVDBFS3BpUkNCUDVnUEswS2J5?=
 =?utf-8?B?RTJWYThKRnY5aW9pR2N4NFR5cmJWenQ4dVRxZElOQXQyVWNkbDI3ZlJFOVl0?=
 =?utf-8?B?dlVFTGtxcWRQU3dVYzVBTTNwN0VkMHBLdlRHaGY3N3pUN1ArVmdJTlhydTRh?=
 =?utf-8?B?cGxtSkNndmtyNzdjVEVockx3Ly9Gb1FhNkt5U1p1a1BkMU9zc1kvbldWdHR2?=
 =?utf-8?B?V2grOEQ5SWYwNFZmTW44RzUxbXF5RWh1Y3ZUbjBQODNWYW9GOGltdURRRlVQ?=
 =?utf-8?B?R1ExbFEzdWNoZ3BxcnAvOGQ1QTJtWjVSZlcwOEwrVDU3RXA1OWV2c0FRR3lw?=
 =?utf-8?B?WndpcGZmenB2aXVGRXdGaFpyeGFRQnp3eTVyUzd5M21hNExhTEpZQ2tmeDdQ?=
 =?utf-8?B?SXIwb1FQYmpoaDBhcjNZUzNLdVh5eDhmWENnd1JMelJHWS9xQXRVczJsNFor?=
 =?utf-8?B?Wldzb2p5L0hvaEpXK1dZUkROMTh3RzNYbXdySWRLK0dvNUgrQ2c1QXVXR1Bn?=
 =?utf-8?B?aU1vSVhRMVh5U3JqQlB5aUVVY3ZDN2pYNGltRzliOS9qMHNVVGdUOWIvMWZZ?=
 =?utf-8?B?bkxnTjBrNUNJWWpLRTdzdHJLWDA5ZERiT0MvUk5XRXd6TGMyaEcwNW5GRDh2?=
 =?utf-8?B?KzdCanRBV28xbHRPRDJDTU5EZHJwamtkYm9yQmgwbDNuT0VHbkdZaUNrZDV1?=
 =?utf-8?B?TkJNR3NmeE42bWlSU2hmR25jdlNEOHpZL2wzMTNBRUluWDVqMStaYkt5dDBK?=
 =?utf-8?B?ZlZON1N6eXpGTFR4T1JyMUdac2lqcnYrVDliUW9NUVdZYzUwcUFyQkVYek9r?=
 =?utf-8?B?TDVwclVSYTUrV29nczBDM3huYUdQei94TjRISDlORTd2UHNoTjRwMUsyWHRV?=
 =?utf-8?B?eE8xV3pubTZYWUlaTDRKWHNOczNVZEN3YWtFbXg2Y2p4SEtMU1RJbzhOcENr?=
 =?utf-8?B?YVFxTkdGZCtaUGxmZkxmZmpaOFU4QzJmZ2NoTUREUkh4U3loMHFvb2RSZEJF?=
 =?utf-8?B?L2k0UTgxQis4Yjh5ODNXTVNyeFc5UWFTbCsyNFZUMHdOcFFxOFZVY0pkV25J?=
 =?utf-8?B?RWJReFFQL3lpaWVham1hVUFYaFZqTlF1YzM4NDBsUE1HNHVNMjluNksxNmJC?=
 =?utf-8?B?U2FYYmNiYU9ZYWRzMnAwL1EySGl5ZThkNGRZTTg1MVFmN1A5ankrakpwbGND?=
 =?utf-8?B?RldGUVF2OGRhQnhzclA3QU4rdEhOalVIRWttWjFTTDQrMzVRMk9Gb1RVY21i?=
 =?utf-8?B?dFEwNXRxK0E5U3lmRkwreTZqeEI2bjB2eHFXeU9mYi9UcEVyckxXRitRN3Vq?=
 =?utf-8?B?ZFEzNkt6MnY0bytOVVZjMWQrNlhaWU5jN2pqOGllanhMRVdkY0NONEhoQVE2?=
 =?utf-8?B?Vkg4ZVJQTXpsd3hudzNJZlRLR3U0S3pMNlc2ZFBuZTA5Sk9PUGt4Y0pXamho?=
 =?utf-8?B?eUJ5RFhpTCtnQUVmSlRWclFkSC93QlpSMEhBaW9BWDVlaERWdHZhUDdsbkFo?=
 =?utf-8?Q?rbM9ZtLjh0Qwxf6GGBBm1yLTG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1936c4ba-5bd8-4afd-a9dd-08dad77a1ddd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:07:51.4332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rg8KtU/a7Y42JAYl1qIoBdKPbzOsEwstpfmFqgE0ssS4xXkbd2Gtd3w+4Kp+wzpfNDycMlyzQN83mdF+klPWBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7449

On 06.12.2022 11:42, Andrew Cooper wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -961,13 +961,10 @@ get_page_from_l1e(
>>  
> 
> As you noted that this desperately needs a comment, how about
> 
> /* Force cacheable memtypes to UC, */
> 
> here?

The comment you appear to be missing is actually there, just perhaps a
bit too far ahead:

            /* MMIO pages must not be mapped cachable unless requested so. */

In any event the comment you suggest to add merely re-states in different
words what this earlier one already says.

Jan

