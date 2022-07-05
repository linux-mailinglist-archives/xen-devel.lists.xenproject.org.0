Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E692567230
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 17:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361403.590900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kCt-0007cV-7P; Tue, 05 Jul 2022 15:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361403.590900; Tue, 05 Jul 2022 15:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kCt-0007aO-3X; Tue, 05 Jul 2022 15:11:19 +0000
Received: by outflank-mailman (input) for mailman id 361403;
 Tue, 05 Jul 2022 15:11:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8kCr-0007aI-Hi
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 15:11:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b739ccbf-fc74-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 17:11:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 15:11:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 15:11:14 +0000
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
X-Inumbo-ID: b739ccbf-fc74-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9+ZGyeTh+2/tFa1HxQiZFfANxidxlg+z1py2DZn4GzrAQVcliRnewG5xYpPewcLetSNPsvRzJ2KjCItWMpb+KlyS+sFRvqJmpF9F3g97NJwL1cx3QK0p2/yNIqHd+sWg/TcboadENR3VRR3q8N0JJ0TjRZPJmvoOYaXU0XOIiWZ+lfVzjRv10lkTO0LyHUZ/PsXQevIjBPmi1Co5YWHVcWMvZjfDN3+FE7h2TsxUM97mcknujYwVGr9wNA0VXvQvP3cnjkVyhHapedSgbJVRf3r5vEC++LFAK+KRmSFNyQdmJ5WUuWp3s2sFL/NvXL/A2E2z9qhRva7G8soTpPYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7cFpSc752YWFu6Rl59QKu7tT3qs8s+cHdzmIBFCvyg=;
 b=iuKCcGwqK/YHa4YV1XiYqi5RrNOsgkHfYvQG06CrrQpdhyHB/qsw66EjvUOhkv+zFyna74FzJkR9pgcs0ZxLMbPIYxaoX5Pexpm7Cfg+7BdxY5I5gEdnnHca/9CGGCbRqHrm6NX9Ip7euXPzpG/jqVkzPNLur8zEqS7KW5bwAbsabpwsDSWYIoD3Q8IkIOHdUBm7WitnVoIT/BmWc7DrXv1Nwk/gqsIwESFB6xjxG6bV4IEdVmTI7DPUtTi4Q58R2sJ0CRN/qXA4I4fDQZsjObcU6lfidDqrTCb+SYfuqOV6mjpa1SqsIpXvTuq00V7dHVOl8BFY6IkEGANQP+KAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7cFpSc752YWFu6Rl59QKu7tT3qs8s+cHdzmIBFCvyg=;
 b=p1auXpuGnGsVRd2LkZG0girAQExKk9KupAUq9OekYtJkbZWgyqxO/WMw9/yz5A1/pCCGtZICnlM0BDyB0vMSqg4rYSo6EpYBAPYrxw+znF8VagL6JvpzPr3S3PPsXnF9pfofUr/dkNMeKyrPtbU+lJzqROaTew8l8rkoWtE2GmAOgnTy1Y4ZZO0xOWilARRRZhc+bv/QPrT3tIZDdaShiBXaDDEELNKg7JsDwg85PszIOQUOYZU7BfRIM1oEetH16Ji/UxD9wH8giS0Zotmi2vNo0aVCy64cZLClKd7ZOTTkLIynokaspKslBS1kRTbkNZj1TcQcHDpGsFrH6KJH7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9822e10e-ea7e-a39e-1270-14f0e2741325@suse.com>
Date: Tue, 5 Jul 2022 17:11:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/8] xen/evtchn: modify evtchn_bind_interdomain to
 allocate specified port
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1655903088.git.rahul.singh@arm.com>
 <08fab20e71d280396d7b65397339ad9d9ab96d5c.1655903088.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <08fab20e71d280396d7b65397339ad9d9ab96d5c.1655903088.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42d840a4-a77d-47ff-0346-08da5e989a3f
X-MS-TrafficTypeDiagnostic: AS4PR04MB9362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q4soOqu4qMwqduCFdKTbfDeF88friKOxpWEuEE/4TT4geWiLjKOk4+iPbX6DoQHsZ1aTD2lRDTv4hv2FbR9i2Akc1Lowt14JAhkduluPnj1VPlYeE43U1/L+9EjtxUZEzjgBMtAQsmbUuyhlcnO6ZyNIkyPbjmH/Kps80d0gGhAWXz5o83CLJ4iXtFIqIE1/65RxeT6QxwxhuXSnAbTV05DQBLtoU1d1gNTnVOfeM+522ngLnvLl9AXPvD0bpUuLatvZLe47O9gmtQaEh4GgjQfGTe5H8QTpz5Nf9DRh7IH0hX4WL9heDXtXljUr+wahugCQ0WecoJtDD07mTZPFo1XPN6vuzmoxJmmqJVkiG6HJfhvhyYrOZFuY9f99xF/9owqTIutPcokBcRHSZ8AFIIjyfBszl/b7W8Ie5uFhZfwHm5F0+7xLSxvTzYpCTmvODZQuwaIimTtAwcGKqj3XvDUOKB7KREjH0SCm9K6aZPBXJsJ/gPgrZo0djN1webmsqhBOe4aExt3NdyVAs3849dchgDBuiXZCXCL9is73aXL64wnle8Q5PJoL/E3qmVjUORI/sCMxzJXk8CQEYlYaJBAboBrYlM4EEBMRUKFT7j/rIGg6M0+KuURpwmXgGw0Vp4uRkXjLQKEu0w5Exma0bnFos4LnFyCAL0JM0gP5W/Qs8nzp5GwitsG0PXBYwh6vvlZDqn57Ig2bLoPKQ5dnQ2i9qLrNNcFCNw+HQ0WxTdsP2W6pTMMYDEXT1Nagkm53ZSQQrkU27YxVOef8rT4+3FRMHBOS7oHM6BDBe0otP/oZ8D5bwhptk5x+2BMhTNIHAoFeTrxuE2IHZTg/a31sz+ZBb8iAwhObg9kILJUlC+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(136003)(39860400002)(366004)(346002)(66476007)(66946007)(38100700002)(66556008)(54906003)(5660300002)(6916009)(4326008)(8936002)(2906002)(4744005)(8676002)(316002)(53546011)(6506007)(186003)(2616005)(478600001)(26005)(83380400001)(6512007)(6486002)(31696002)(86362001)(36756003)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0t2Q0U0T0ZzMndwQ0YwYTI4Q3BoS3BsYWhKeDZUU200Z1hkcjZtQ3lVODFa?=
 =?utf-8?B?dm1MVXRacFJjUmorVTl0Q2w5ekZ1SWVvMENDK3FTMzBaWUE1Vkg3aGNkZUtL?=
 =?utf-8?B?STZveVRQUUVLb29GSzVxWDFxS3MybXBhZVN2UUFieThCZE5xOTlwam5vdk9R?=
 =?utf-8?B?Qm8zTW1lZWJnV3Yra0ZtY3hNWTBNOFBLT212QVNYZ1pyRllRZmFrYWt0SDZq?=
 =?utf-8?B?dnZadkhFTTNpMXd6VGxOMTZGcWRpUGY1UzROblVXRVNIVGhMbkNYRXZoT3FP?=
 =?utf-8?B?ZDNOdlpNT0dpSnF6MloxRTV6ak02VXFUa3JJQ0NmN2ovTTJ6TWxZMjVweFkx?=
 =?utf-8?B?QnV2eDAzcDdrNUl4MjlTUlBoYjRpUysyYlFEakxzWm82WDFPSm1GUWdhM3Zp?=
 =?utf-8?B?YzNPc0xqc2VqNXpRUkZ4UVFEc2N3Y1lCcFMrOXFiUnVabkhxWktzRUhieHUr?=
 =?utf-8?B?Q2J5TjR0cmh0MERXU0RCSlBBT3JrUDVuWGNBNGsvL2grV2IvZlA3OWIwSWN3?=
 =?utf-8?B?WU9XSkR2ekloR1NSN21lR08zRktWUUM5M1pPNWlwb0NwckRYZDhISVluMUI2?=
 =?utf-8?B?d3FiRW8rZVNEVDIvL1Z5SXdjNFRaTi9wOVFWMlBTeUNJQk1kUnVtNEFxMGpu?=
 =?utf-8?B?TUlQWWh4bmd1MXBNVnFNUzA4T2I2S0tLVmtaeUUySEFza2VCaTBldFFXdHh6?=
 =?utf-8?B?U3pMS1dGWUxmZkFWeVJFOFlKallvREdHMDlBWHN5VVBHQURaczhQWk02a0Zj?=
 =?utf-8?B?MzZqazFPTXNuaENSNVV4QlQxRHhkbnp4TlVQMnp6Vjl5cW43ZmpINlZ4aFlQ?=
 =?utf-8?B?WGMzNTZvKzFRZFhVSFo0R2pZalM3Sm5BYk5xMHpBSTZmeFErQWl5dWJVVmlv?=
 =?utf-8?B?WWE4enl6NDZ5L1loM2VyNGhLcWc2WUpvN25RbmZvYW1EU29FUFlwSDRtcHR0?=
 =?utf-8?B?WTExZDJHY2poM01LUG1WQ3pFc3FYN2NYc21IcGFFMFZTek9qRnNFOTZsd0Ju?=
 =?utf-8?B?SW0zb2hteERhdGJCeXR3NmtCQmc3U1BOUHJzUS9NK1dXbGZrSm5RbW1JeWdV?=
 =?utf-8?B?RW9RWGxlT2JnSk9OTE5qMFNrbkhJTURrZWZHMFgrY1U1TThuM3ZmazJTbENw?=
 =?utf-8?B?NEF4MDNHaXNLTkVIMGVieTh6OUtrY3BxeFlVeUxJWFBlRHFqaVIzNjdLdUY0?=
 =?utf-8?B?Qmc4QWl0aU92S0ZNT1pOK2xOK0w4UEVzWEF6MlhPRlhJVTU0a3FCeGFSRGJL?=
 =?utf-8?B?eHFVV1V3dU80TWZnL0cyS2p6OXo1S3hmSUlTVmFhMlJTKzZQaTUwSTZkMkVG?=
 =?utf-8?B?ZG5RUTg2UHdXblFLTEhkbldaV3dkVERjODd3ek1BbDdnUlhJWHJ1RmxKSWZy?=
 =?utf-8?B?S0ZEWGlJaVRSaE53SUtmZTR4MGRtUkxEaDYvK2hSMGh4WWZkQWp6Wi83a0Ro?=
 =?utf-8?B?YVBGQlQxeXVWOFJGUGwwc2V5OUV2S2VIUGRyTTZhN1d5V3dibENNVCtHL2xU?=
 =?utf-8?B?ZzJTNFhPVkJuU3Ryb0UyeEJtSUxDVjgwMGkyc1ZZNitHRW5TTlBacDJXZG1P?=
 =?utf-8?B?cytOMThxZS9iUEZyMEtpT2ZMdkV5ZUx1eU5seVZoR0NnaTdKQXhXbllUaisv?=
 =?utf-8?B?N2J5WVJ3R0I3N3RKaDU0M3RPai94aGlhc1NoVG5iSy85aERoVmR1TCtDRFV0?=
 =?utf-8?B?dWhKbEx4UnhrSVVlR0ZSUWVtWm5Fang0WU9VdG8ySDBaS3hwWWFtNXBoY1Jt?=
 =?utf-8?B?WW95aDNWODZtRm9PVkpaOXppdE5waFpEQ1ovcWkyTWh6Y2c2MmdHUXlxMnNl?=
 =?utf-8?B?VzhBZjFEMVpBalZDZFhKQlN4bG44MWRUZDhtVnNra0puOHhkUXdvUWIvVytD?=
 =?utf-8?B?dWFFMmkwai9ra0ZvZTFsOUtBYlJnaFV6ZkNNZzdta3YweUlHTlhnMkVYRW84?=
 =?utf-8?B?VnEwSm9YRFZNY29UQ3JZNm5jOGxrVHNJTkJORWlnV0hGQTdpczBaYTB2RkRO?=
 =?utf-8?B?OTArOEZnV3dJOTBNZXlhTmVjZ2RGYWpEVURlR0xrUzRRTDE5b3k5clVtMllt?=
 =?utf-8?B?cjlRTzZsRTFjeG04dVNtUU9RME1jbndpWlVua0FhNENPWWFNYVU3OWdtN25Q?=
 =?utf-8?Q?OQMq5V4WUpchg+/K2Z0M/RsD5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d840a4-a77d-47ff-0346-08da5e989a3f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 15:11:14.3613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoDDudWehcaLFpKH4fU1zEDYT/DjCg738yHs7K+mRZ5JKRekqy38VtQ3fre58GVp5fHfmLnpkdUdsJ76yMX1Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9362

On 22.06.2022 16:38, Rahul Singh wrote:
> @@ -387,8 +392,19 @@ int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind)
>          spin_lock(&ld->event_lock);
>      }
>  
> -    if ( (lport = get_free_port(ld)) < 0 )
> -        ERROR_EXIT(lport);
> +    if ( lport != 0 )
> +    {
> +        if ( (rc = evtchn_allocate_port(ld, lport)) != 0 )
> +            ERROR_EXIT_DOM(rc, ld);
> +    }
> +    else
> +    {
> +        int alloc_port = get_free_port(ld);
> +
> +        if ( alloc_port < 0 )
> +            ERROR_EXIT_DOM(alloc_port, ld);
> +        lport = alloc_port;
> +    }

This is then the 3rd instance of this pattern. I think the logic
wants moving into get_free_port() (perhaps with a name change).

And of course like in the earlier patch the issue with sparse port
numbers needs to be resolved.

Jan

