Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E4060E12A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 14:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430548.682345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfpy-0006U8-Hn; Wed, 26 Oct 2022 12:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430548.682345; Wed, 26 Oct 2022 12:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfpy-0006RE-E6; Wed, 26 Oct 2022 12:48:50 +0000
Received: by outflank-mailman (input) for mailman id 430548;
 Wed, 26 Oct 2022 12:48:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onfpw-0005qk-1f
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 12:48:48 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2058.outbound.protection.outlook.com [40.107.247.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 884ec12d-552c-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 14:48:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8939.eurprd04.prod.outlook.com (2603:10a6:20b:40a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 12:48:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Wed, 26 Oct 2022
 12:48:45 +0000
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
X-Inumbo-ID: 884ec12d-552c-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDHH/4WWMXAp1B+SB+HbTPWEgESb7Yp4dRA99eykvSGQePdJyYX72jzfYu3boVUClIJ58QURWaCLHS/AigvlJSdHRBSCTsrizOlxF3lqvH/A2tslCx/VV8dGsXY2sdGuQM3hO7WRFAIuZHfgEycyV6k9BjBuJ5KbcCTgGZzhvcSkMdcIk6U5ve1PBlYzFqDWmM9fvtn6ePvmIuEZlPo1MkdIwS9zLHLN0AiLyCgSJnaeFLmEWhRb/ZSd4WXgRKhE7c5cPPxmXqw6hAPSk0VzjZt0BRLsuzUbat9d+DPvWAeqVm65QSOCXUja+tw5YxyzAXL1rEMW5NYyxj2UCMlU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EMIls/P8zRUMJ2taZP2fTjAv1f6gT1A7iuI3RxRK4I=;
 b=Gy/pjOBlIolbXSfZjrKtuM8cFquuY4hnvxUtw9Q2LrRwicTm4ukV80zRlWvfT1RsAbSi/f2XF+aWymzwsTIMyrhtsUWi41neGRz/VOWK2GDpv7GyeT3/fBv3oUmFUtAP0/MIzDIFUajppsKqBJIOOWJyYzWN6eD4ParNzk6DdGbntk+GUqQl7O60Nf0wLXZfOYPWCMXA/9htDsCM3HeXZKMEKXCfoEZK28LQH0KmdVGtAoXo8wiEBgMn8HpCkq0LQ5OUltmhDe4ItXvmvqFN6ucqNQ1JkXB5al8LB/ImSt5kJbcg3jeCq443SUxIR+mqjsbQ2Rho7I8RPDcJlmWCLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EMIls/P8zRUMJ2taZP2fTjAv1f6gT1A7iuI3RxRK4I=;
 b=0IaB6KaY0QyTVzfwwOgJmnQmEHG5mti5U7fVGDAVEwquwDpvRt2LH9FQvaaLNfw/eChAt5MfNqnlOMeqiFyqBS42qc5V1wOpWBTD9JqiOAFr+5Ny7NSPTaKMdtoTeEQknGiFr0df7SQLwdUcfG+0xU3iLVBEomm7WcizNREezZouNAdHsczXwcyekQL98VTx6MiFBT9aNQweh8KIfCvSF+79ono43rlMExbiz1PJ94SEQnGlpjMV8RMt++/c5CB+dFxI3koaHaWdP03B4sIfFyKmeKX69kYvuTOGEbBQbKhscP/qIJBhT32Pg/UWLnndTGxpTYKQD9BADpk0pqsmuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <141dd739-153c-6d72-d1cd-3dce579b7e7b@suse.com>
Date: Wed, 26 Oct 2022 14:48:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] CI: Drop more TravisCI remnants
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221026123906.10421-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221026123906.10421-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf946e7-5ab9-428f-0ccf-08dab7506b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/TXFBEAry/ynim/3EbBw+Yk0sqdyI95oTySS7FjP0lQJxWNBEh5lzFcXkczt0gMMOl7GD59OImkEtPb3zdaaspDiT9RbW0i3Ey/cFKlUY6rLz3N/QFN+CJcrH9hE5zYYxCwJXuPYvfXLSpf3IMyOQrNhmvhyN9qC/CF0gDUem2L3Q4T/BNBnYgfx06SahybUKkVlFtl0+RtH2BxqRWY0U+7+UpbLLtscS6Oix5OebkxBhnJHdf+zk/KeQVWcBtvLN9fjEyG92aeVU1Xj4yZzcl4iiUS2zgtyH7aK0GzRhiHXjkJx24VMrMbF/GhRRVLX83HBYiY1DvaYoBM75kNOcrYcLxzUKSyGLoowFVClNomYTaeVweHiapKqWBQqxIuap91J56xlvGVsWwLIgIEiIpIEzVhQQ5yb+S43Iv3JUz0GD+C5LKtZxwemALCzZZ9whprU/1Jj/BbfhRu5PQfA9Xhh9vQt6oLjaKym3U8Eo7KqDs6/HwUlQDd7CGGS0R6hGWLTAJAMrvf/G8QYilsSV/cFQVb1E6GNteLB4mkhatmk+d06h9Rkbs7zFq/GaznMrFXkfL8rMD10VynyjzGesPRgvAMcmktoP9gWTWefsD8ul6/JNVvn9psxBusaLSzoDSvVIDNYivmJDJVzbZQVvTsMLRXVCEVCSSzwHnx0WDiXRnoGxZKyDRRz1AfobB7FLQqVdaVofrSrtD7lpvN4mJBABbjNioei0ts7HBZ7NVgk8Sh8gsx97nZXJx6TBeD4zZ15tyyF83Jx9715hXN3MH6QrPmKAnTkXx7aazPNaM4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199015)(36756003)(31686004)(558084003)(86362001)(2906002)(38100700002)(2616005)(6512007)(186003)(66946007)(31696002)(6506007)(53546011)(4326008)(6486002)(26005)(6916009)(5660300002)(54906003)(316002)(66556008)(66476007)(8676002)(8936002)(41300700001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1E1MjZjZSt6MjJlOUVGZmhTM0Vnb2dPN21vdHQ3cWM3SXdUa2FYOHlNTlh6?=
 =?utf-8?B?VTJpRkhtTW9jdnRrWEtXSzljbzNMRWlNdmZaZjhIMk9YK2FIRXdZVzJGQkN1?=
 =?utf-8?B?UWNDQ3U5ZGY1MVVxQWptZTVPSGs2R2Y2blhjdXNOWXBreDNYOFYyT2owTWtK?=
 =?utf-8?B?OFk2RklHWnVLTmZzbUdQUUJDK2l2azVtYUtLWmxRQ3hhWFo5MEYyOTR5UG5J?=
 =?utf-8?B?V3k1Yk1FUXZzVWM4QTRXSkJ5bnhiYnlsOHBHU2FZOUZBZUFYdWRmdmx6NXVp?=
 =?utf-8?B?OEY4NHJyd1ZNNHYrSXA5aTRBUW9Hek5meVJHWmpsck56MmIrUUs3UUhkU0tq?=
 =?utf-8?B?NHQ4RERqeGp5aUpTM0dqcmtxRkJsWWFDeVhBTXFRYmczOWppRlI2RzZJTmRM?=
 =?utf-8?B?T0orOG9YUG1XV2x6OGdzTmo4eHY3QlBMTXhrTmVkem00a0ZlVm00UjZsb1lF?=
 =?utf-8?B?YStjdlpBUTVjWVUwMWZLUzFmSHowQVEydUhmb21Vemg5M3g4akVHZTErVE9P?=
 =?utf-8?B?TnkxWU9GLzJFZzc5RTZOQnVNdkJQQm1nd2wwOU1TUkMxank0djhIYndRVnRp?=
 =?utf-8?B?eDZXQlVSd2FER0Q1TmMrLzRFUjRRV3BBenVUcWd4OGttYktQTmFXdXRVVFhl?=
 =?utf-8?B?UzlTQUxpcmR5UWc4RG5QL3Q3OUdQMXJqZlZUVFprQnlwZWhvUjlQWDFGaEgz?=
 =?utf-8?B?OXd6SnQwK0ZqbTZSWktpZWVhaFFCSHdCL2tSRS9ON2hsby9MdW9RSXVUaUNT?=
 =?utf-8?B?Z2RpRVZXWVNZOHZ0Z3RzUnlvVk5NUURMazFpZGRJRG1oZ1hyTWhYaHRndER5?=
 =?utf-8?B?bk9MeEhhQndhY2thMjdQbkR0bmhLTk5BR1pyemw2Wk1FMkFSTDhQV091MDBu?=
 =?utf-8?B?U0hhQ0Qwb3ZJZlQxVHF6bXROS21PVW1lcWhWbUJuWnJ0NzZkU0E0ZlhiTWRm?=
 =?utf-8?B?WmJ1RmdackxaQjdWL3FuNkhWVjhlSVBzdmU5Y2ZjYWtmQ0VpZUNOS2t6SENh?=
 =?utf-8?B?UDVSNk5Sa3JuS3I0Sk5IcEVMTlB4TUxGcTdRenNRTUllTnFCWmg1T1dMa0R3?=
 =?utf-8?B?NWlEcFZiL1pnSTQxTUJ4WE5UMTVHU2x4Tld1d2hFajlRemYwZ05BQ0pyd2Fl?=
 =?utf-8?B?VUdNUFFwNU9KSjZwVjQybGV1cU9OMEROUXgzVDZFa0xqTVlRajFDYjNtSCsr?=
 =?utf-8?B?cENHY1lEVmxOTXpjL25iNjZNQVFIWnBTNXZwdDhTOXJ3NEMvOTF5VWk2SG9F?=
 =?utf-8?B?Mjc5NDBBODVFMWtaTXJVYW95bVN3aE8zUGk0YXdwWk5vcjRzL0ZWQ3B3Wkl2?=
 =?utf-8?B?SjJDREtDNDJnWFpsVXYwZmJiYWE0a0hFSStVTENQTTVKd3I2Y2h1MzZCTFYy?=
 =?utf-8?B?RFJ1Skc4SlkwSDQvYncwMzFqY3BJNitJR2hROUE5SlhSa3hnL0lIM2pLajdp?=
 =?utf-8?B?M052RHp1SFJUa29VUXFTNlVIWkJ3UFRJdC9xVllEaExDU1I0djl1alZkbkFo?=
 =?utf-8?B?Qk9PUmorQ0tsZTZCcHB4QmQ3bmh4aThLTkt5QXNCcTFTZ2cySGt3VGRjZXli?=
 =?utf-8?B?VzZPWDFsclRaUnQ5Y3pTUkt2Z1FZc3luT01mbFoyQTRRZ2pxN2YxYm1GTzZo?=
 =?utf-8?B?akZMOEtJQzhrYWFtWUx0bTk3UW4rcjNvQlBSd0xRRkVaWVIzdEZ6R2gvejIy?=
 =?utf-8?B?MEhkTzRxa1U4Q21PUTYwVVc0QTRiUnNISXdHalN1NUhYYktSRi9waWp4aUlp?=
 =?utf-8?B?dFVQb0hOM21vNVpzR293VE5ZZFp1TlRmQlFmOFNzVER3NkJQSlRZaWVUWUhv?=
 =?utf-8?B?cUFPSFpSbzdFaFl2THN1WXJsdjZaRnNmcjg1NW1rc1dlc3lRUFFNbzZndHFN?=
 =?utf-8?B?MlNyZGdKTlFuZ1JnQkNBQjIvT3ZtTGZrdldoazlrTzFVREFwVldhcm5LQlRQ?=
 =?utf-8?B?YVh0QVZxMVZNaEVIM0g5WmhjMkpPcUk4RFdKN25MMkdYOExEMmw1UUZ3bFlJ?=
 =?utf-8?B?ZnZMU3FTOUsyc0dqOUNBZWhOZXNmU0lIZzN6TE5obzRiUU9MQXM2Y3JCc3pH?=
 =?utf-8?B?UzVicld2aEFLV3YxcWo0WDQ4YlJlaWptMmtZTStic3U3MVhrOFFiT2lvV24r?=
 =?utf-8?Q?jV2bcEB7LMEUCamdGQ01hYDG9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf946e7-5ab9-428f-0ccf-08dab7506b14
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 12:48:44.9339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzYABfYZMVWFoHOuQ1CpkUImGGgfjp4L95ksaKfQLY8cGoT3UC6h3yX2Zv4KQsi1IlmBHkYdJn2KUJV5kcjqZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8939

On 26.10.2022 14:39, Andrew Cooper wrote:
> This was missed from previous attempts to remove Travis.
> 
> Fixes: e0dc9b095e7c ("CI: Drop TravisCI")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



