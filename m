Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E99C5952B2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 08:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387969.624462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNqG0-0006K3-ET; Tue, 16 Aug 2022 06:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387969.624462; Tue, 16 Aug 2022 06:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNqG0-0006Ga-BI; Tue, 16 Aug 2022 06:40:56 +0000
Received: by outflank-mailman (input) for mailman id 387969;
 Tue, 16 Aug 2022 06:40:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNqFy-0006GU-RG
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 06:40:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60075.outbound.protection.outlook.com [40.107.6.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ff3d002-1d2e-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 08:40:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5393.eurprd04.prod.outlook.com (2603:10a6:208:114::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 06:40:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Tue, 16 Aug 2022
 06:40:52 +0000
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
X-Inumbo-ID: 5ff3d002-1d2e-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oewf3UwgysH6ZLp+uKfX5FTTAs8hD3JwQhMdNzTei6ExLIMk74WPC7M0u+ECRvqZwYFMydwmUUywvN9f50LgXMjR2eN/658xQZLNJe6ZRN+hBIWetTnO1LvKf4UiyZ2kkQGgKJquhAzcywkUPDgX0yEoujRnpjdOgUs4hEW04tFLXsWP8GZTHTbT1dnwTC/Oi98kkgF0Tc7wbl3Uz3y/009H5DBeOQQSNPdUbIrQwoHyl9UGftf0UbREcEVZaJ/5b+Egau5rKZ1uD8ITCPacVqJgdAwpMaQJpPiOdzRtbI+RIyvQ4ObOK9lWUGGyF1yiZVVFovN/hEyWPhI8/9zhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HZIlDw6oVBNNzAsssQSx18YDkXRqbj57+Fd8gx3mM4=;
 b=dqDMbh5Y+RFebxXMsHqZHaLWV4f0M+pY4S2bvIINLRMCwbOA3Qn6MyhN4bSjFkrPDBQtE58PkbQfeeqmo8gFwRap628jgHi894VX3BLvmdGNpOV5NUVY28qjwTKmPiWm55mgplu28k6lJUWAa6kprFNga1j0QrqzCHPvb7PF97bPs3WjUARiMalwnNGXT6vvhY8saOwVwVsNIUhVlPwVHgJZNTNwlhuBvIf0v75n04QPfJ+DqIE1rXe/gNfL+vruMUKQ4VldRcOSLZRIAwLr+z65muKbkNQh/ZWg+Owqvec3j+Zd72ZeIvNTkDZluYe3euhigLv3U2O+tvLHadSbbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HZIlDw6oVBNNzAsssQSx18YDkXRqbj57+Fd8gx3mM4=;
 b=NSwsK2xBH0ZRu+2b+SCsLlE6M8W9Wa4T9RMYd6kawL5/Ggos/x2NtIWjTevy1ikErc+CLbmkMpmR50+tVtLCGT7OsSjVpBUF7lV2srGDu/TFPlaJWqIToah60gaeNCSQOxTPVFOdrObx4bMQu3rdf34dC1InHlTBAMpMU0Z68pfM5rJlX98fRT1wmj6QhvKsRfecO0x8uGjVDsKqV8a78tJPr0PEvFMe0/1qGpgWYFVtT6M7ZDTzSBhZM6P+0XX88PbqlaLgufmaxLxspiAEMi9ff6r/lF4HXV5FNZgjwbBeK0Va5XL0lU29ifzQRPLVCL5X1+ylVx2E3MjvR65jZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c2d0111-3ac3-83aa-145f-432f5fae0167@suse.com>
Date: Tue, 16 Aug 2022 08:40:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v10 2/9] xen: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-3-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220816023658.3551936-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50b9c0b9-f390-41fd-de53-08da7f524359
X-MS-TrafficTypeDiagnostic: AM0PR04MB5393:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	riwcDBJiB4xuOGGyEuUvLuqPC+t2TsgvjKuphkz+Jx0Z0+2fZys8U0ByaoQS8jTs65CEmeL7iAdgZRdS0R/bwfc0fREdyKyNGK+qU1/KNQJHDIFq/G9CvetRVwi/BhW1BSC+q86j1OB3z8y/Q5x54XREtQE5TBAjSfcLy/E7SQdyhmcWt7dFjiu1+7IILMORhnooa2si8OcLbZuro2S33qxvkZrMzlpAhPEFf+Txp2Orl0fHw1m0yvs16KJ71fmR/REcirGfcPsWagSJM47lVQ6KLvEAV5MGyzR+f5QxIVaAs2FaFfbfCCmeq4TCV5dP5ltCGD27u7kXKu2Hy3gDw23PttblnrFlQG7BKFKWYpcaRVr7QzUgr+GSLyThYsU56JndPngI6A/VPTH1SXFPFKaNUMYwldWrYKBl3pbDvGqFewmufzekROaGRZ1h96xm/C0n9m6eTNdTOJU4KuvRXP4NKsuBKd/fA3doU4YoVGCds8R7GaobwBBVV9f7Bh++SsKeFMjdjHCuyw3m/WJJIgOqUx7ARf54gOf1EFn5uY0u1KCEwz0CnS6rYQ5sIXwmycdMiSqlJxlvit76/7DOtjiVJ8tJyrzF+iwOH0K8OZSxYjQU5eqYqmE7+DnB9PZpCBQ/TLBPt17/ljdVr3YW5XHdaz7qpV4JrXMmQKQaORJWmXERtPlHIl6Y6fI4LQjOM9nLsrktIe3CZZlYInlQ4UHeFMZC3yV4v5Lqyt993IgssxTzFarC4bQhRz1iJKgZ738+uiWhwkFl33sbPiUEw/CkT9pOYuNELoD8A/EH/55PsWYxRQQC7mMXcoZY82kbJzvaSSucvzo6iwL+QIpgrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(376002)(366004)(136003)(54906003)(5660300002)(6916009)(6506007)(53546011)(41300700001)(86362001)(26005)(31696002)(6512007)(8936002)(66946007)(6486002)(66476007)(478600001)(8676002)(316002)(66556008)(36756003)(2906002)(4326008)(83380400001)(7416002)(2616005)(4744005)(31686004)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk1jdllVY2I2VUVrTHhTZG1jcFRFL0IrTUF5WXQvZUJtQjVwczRkdXg4TlUw?=
 =?utf-8?B?MGlQaDNMM0I0ZmtCOUxDSit5WC9jY1MyOGRJaEQ3bGZuMVFaUEpnOXRCRU1h?=
 =?utf-8?B?RU8vMGhsUjRqcVpHeUFQYXcrYWZQYnQ2TmVpUGZpNDRHSjQzei9RQzV2RWRh?=
 =?utf-8?B?RFo1UGhTb0Y4b2MyT1NJUksyZEtsOFdUOWZ4N1hIZGhocDVOc0F1ZDVFeis1?=
 =?utf-8?B?WWRLZnZOQlZCbmhHdS93dWVSVEl5OGQzTXVxMFBWMmJBeUdaSnhWRkwxYjY0?=
 =?utf-8?B?ZW1INERXL2l5dG5kUm1pcWpHMlBGMFR5QThheG5sMUNBeTlUenFOS1hLSXZq?=
 =?utf-8?B?c1Jqd2JiNEhLOU1Gb3JHczVhUmpJOUZwcDJNeGRJVHZZS1VsSWhGdFh6QndF?=
 =?utf-8?B?TkVmQkx4NWJDcnpvYzZTTXhIRU8zZVErMFpjS1BpbDVPQURtOHZIcUc2a1pO?=
 =?utf-8?B?LzlYMjBTU1BXRXlERGZPSENpUWJjUWduY3hSYUtDMVo5b1diTWlHTkVIWjgz?=
 =?utf-8?B?dVJyZ1M5UHBCYmlkZklZMDRQMk1kbnFrQm5sYVdBQjJFaTNJWVZVcEY5UlNk?=
 =?utf-8?B?YW9YR1huQlZnRS8zWUJRZ1ErK3RJazF1eGk0S0RiSkVaWktMVWU5QU4wZEEz?=
 =?utf-8?B?RzNuY3VZSDFEVG00dkVGSWpOQ0t1U2ptK2RUMjFQZ1N2QklaVXlocFd3NWxF?=
 =?utf-8?B?elYxWGJNTkNSNmY5aFgraVM5U2tNTjBuOEJiR015dFFicENMWXczVHpldW5P?=
 =?utf-8?B?aUFReksrTEx1RlRwOUpRRWQxeWFzay9BWTRleG9FUm1XbzJ6UEI0NmtSWUVl?=
 =?utf-8?B?VkpFKytsQ29xUURvdU56Q1M5SW5SeEZoM3dySlI2M24rRG1jVjRZWjhJOWlr?=
 =?utf-8?B?bkJIdHBBdE9UaE5UcmZhQllGS2xzK3M4bVI3ZDNEMmNIeWtjN0xhZ09KT09B?=
 =?utf-8?B?d2h6OFp4eXB4UmJtMHVhdlRtdlFDcjkyNEhacm9BUzBhMGM0U3lPWm01ZkdD?=
 =?utf-8?B?K2xCMGd2Y0JkRlFsZEIzd3dnRDl3aUx1YTFPZzRNODR3bjZ6UGhhaHFkc3Uz?=
 =?utf-8?B?L2FhbUVQUFZiZDJmTFNrR3FKbGp4VWRGZ3NvdW8wY2hzTDN5WGdib2dJbzFy?=
 =?utf-8?B?NXRYS3I1SU1teHpOS1hyeHR5TUcyNWVEVmZkZzJHSFRLUlhTTmIwMDVQSStC?=
 =?utf-8?B?TmFUTm1rVWhhOG1oclNZOG50OVRUTWNxQXB5R3Jxcy82YmJTa1FpbVFEK0pz?=
 =?utf-8?B?c21qcFRtTFVpMVo1WVNWWG54RGlSdlplY00yaHdDT0l1dHhoNmNSNUs0RGZY?=
 =?utf-8?B?cUFFWjlsQjduU29DTzJRbXN4cTVlTXVDRjVqejZJVG1tTVFGWVIzRGU2YVFK?=
 =?utf-8?B?M2JQaSs2SDk0RlkzNHFEYUhZSVdsYzJSOVRXNzdVQ3ZIejY5MVNsV0c1WWZh?=
 =?utf-8?B?SWlybnZjY1pGMHEzYVZZYytIelgyR3lvNG9ZVHFGQVVsQlZ6aVRwOHRPZEVD?=
 =?utf-8?B?Ym43dGtacnhsNkRtV2lCVXlCc0ZvTlg0bVA1aHRxRXR1SG91dXlSOXF4ZDM2?=
 =?utf-8?B?NUt6ak9rYjhzRHRXNHZBa2NQd0RQNXM5OEtJYm5KVVFrS2VGQ0Z1QzM2ajdY?=
 =?utf-8?B?U3lNbEkvZWJpMHFjZmNSZEFHZTVMQ3QraG1Hd21taHUrV3EyS2gxUVN4dmtI?=
 =?utf-8?B?VXE3WGlPR0VHS0kxV0pTK09hMUxtOFZpUkxjY2lQSGZBVXkyVXRyQzIycWFW?=
 =?utf-8?B?QUlDbjJrL3RNa2NDRGhmdGN2YnRwRDRoNzR3Z0x4OVhwZTdST2JoaDhWdVJ1?=
 =?utf-8?B?ek9WQUtmd29hU2J2Ukt1aDRSaFo1THFtUElkdUk3SEgvanovSVZXeDVNZmVs?=
 =?utf-8?B?eWQwdis3eDRJN1pjanE2cnhkQnZTZllWbWhOSC82RFBlSEhhd1JlNWVlZW9i?=
 =?utf-8?B?azU4Y0x1ZFVxbHdwV1NaakZ5UTN5ZnQ1d3k5WEVEMmpJZzNyWTFhVWlUQ1A1?=
 =?utf-8?B?Qk1hMEtDK3hKbWN1WFdIMDZVZkVYNWV6UnFOVUNnV1FxY2VWTzdZdEd1Rklk?=
 =?utf-8?B?WjZQZ3F4THhxbWp4Mm9kTTdPUEtuNWlBdlJMRUxJMVBhVU1sRFpwajVtai9s?=
 =?utf-8?Q?yidWFfo5pzPccmBLfVWIqYX8+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b9c0b9-f390-41fd-de53-08da7f524359
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 06:40:52.2386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4sEONgWn1a42rtYyeE7/Ks+dwtCJd4rAwpWpIjUULUiK+1RxQpOQYXU3tXj5x89ngR3bMqQQdW7ZDMQnjdngw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5393

On 16.08.2022 04:36, Penny Zheng wrote:
> +void free_domstatic_page(struct page_info *page)
> +{
> +    struct domain *d = page_get_owner(page);
> +    bool drop_dom_ref;
> +
> +    if ( unlikely(!d) )
> +    {
> +        ASSERT_UNREACHABLE();
> +        printk("The about-to-free static page %"PRI_mfn" must be owned by a domain\n",
> +               mfn_x(page_to_mfn(page)));
> +        return;
> +    }

For the message to be useful as a hint if the assertion triggers, it
wants printing ahead of the assertion. I also think it wants to be a
XENLOG_G_* kind of log level, so it would be rate limited by default
in release builds. Just to be on the safe side. (I'm not in favor of
the log message in the first place, but I do know that Julien had
asked for one.)

Jan

