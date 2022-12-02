Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B881A64027C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 09:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451562.709330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11jK-0005dE-U4; Fri, 02 Dec 2022 08:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451562.709330; Fri, 02 Dec 2022 08:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p11jK-0005av-RI; Fri, 02 Dec 2022 08:49:10 +0000
Received: by outflank-mailman (input) for mailman id 451562;
 Fri, 02 Dec 2022 08:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFaq=4A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p11jJ-0005ap-0g
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 08:49:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ea9241d-721e-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 09:49:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8419.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 08:49:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 08:49:05 +0000
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
X-Inumbo-ID: 2ea9241d-721e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkw/xK5q7mjZV06xgs4LvHTZ1uU0g0t9HOe5wbbd9zGE+5CdT/pqPJfcijouoYaS7xLfkcfV4JfViTOj6De/qIYkq/mDvinKjb3/9hix2rGnn/Fh232pjMi9RMbnMKKJOQUjNRM3iOqiNukEDUOJGM/vWxHB4KRE9uUF/bj4+yDOK+ygeopnRx9wVsZx+vghKlaHDo1+AS+nvJR5MbEGi9PaPGhkNDkr5pnyHRPmcSjlpO7PDdJITpFZLZw67Rr4H0GUA8mXN5uNjcwP9k6aJq+4qtKYU+R+uGSohyqxacWrDyaIA0BUNcHo94aYStcPr/D7LQ0ggtrG2Pj5+qq+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuGsu/DXvbNn5QE6Me3Qc6VNL6RE9kDwHA5Lkf+bjz0=;
 b=hWEBuXBeVJ8DRUbK/xDetS3ikd163PcUixzpfe+aQpUHrnWdvco3363z38rqT3jG5ohdV2/dKtiCeeLHRrOaFl9J5JLaS8uz9eAmvI+5etpPlKlIDFjCQOcq7O6xwIM+wjq8zm6oP8yJBvovAdrBwfNLqAKOcXx+We6BSQhmCEpuX7ILxY5hM6b5H6Hfwoprt306Vtruzjc+tjn0nC2BScCA3z0TUIVmNz/LTC2d+en2qulveHVP4aujOPWINZy2xT31aJ7mUf/NJoQxpimhhJlRABus9jLxJ2FfWPkbh2aOUQVDd09H+xJDqMO410K4cwZxeVhj6/48FiVwKoP/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuGsu/DXvbNn5QE6Me3Qc6VNL6RE9kDwHA5Lkf+bjz0=;
 b=i+sSBIfIxeHiyFB7l39vxZPS1TbNl2N6DArXfp1muWNeaKHOH9Se9zktD+Y41sYVhMTjDi3tHzKUUIRTQzkHlpxXMktmRn+wjjeHB6vEr/O+yh8qJdME74qPGnxgsYA7AlhGzF+gYaKawh2N0e5lcfRVDIuf+0AikRFwC2Oz/d9TVuICDjMSnl4zkycr+55q/PiRmCw5SpxYaj5+gz0J04MYIwP7dWOhbF4V6JdFi51vBt5gz50Y+OCe1yWKqHh0VO6BsFULVElIsEp9risV+Gnki2iY2/edd2CxY/hb8fzkA05kj1AEzpEuce3jwMV9MDqCav0coeRhqLcaQsTdKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <21aeecf8-82a4-fb9a-e167-10a0cc397239@suse.com>
Date: Fri, 2 Dec 2022 09:49:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 07/21] xen/arm: vIOMMU: Add cmdline boot option
 "viommu = <boolean>"
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1669888522.git.rahul.singh@arm.com>
 <11ad0192b1dfe5f90bc980a09894eb6ff7c5ba1f.1669888522.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <11ad0192b1dfe5f90bc980a09894eb6ff7c5ba1f.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e72041a-a7fa-48bb-4f98-08dad44211a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qMMlYFqYXMLMtWtnT2RR+SMNrhSMTUTIAmixeGqGNIPFkWa7FWHC5A1SglYIEDwLwaio5+B+FiNCEVzE0aVH5KxM98z2Y15l3HfoTTORNRTjt8B0re9sQaMW/+w2o79W0JQE2IAVHbM87icodpLk7jGym5WIa1kbnzU3n03Wp19rm3K6rMzarYxZGgit+TRmkg4KUAzz4gzxOmUgKsVNaPjf2ssEdB24oy/6Saehnv3QWduapSeGkGyFioVH6bf2XouVBdiic8MkG7nC45GEw/Llm5YMYoXXHt6gXoxbH1O2K3FI/VFUA/D8+A6gphMD69EtSpu/dF9ZhnALhAlI5OQ285ubaVKNgxaOfWhzCzM6vDGtoby2r2rr5yLAgW3XrgQ+ontA6W8aBzWgMydnJOSmd+Su8wz4odwKjg/EmKH9efj5lmVx4dvfYDxJSH0vquz84DJcKwJb5hXG1d6Q6BKYoS/9UevVq6C0g7Bbez8l+/veGXdhx4SDnTFGa7G2MO9qvbsWz/LSfRbn0B3SX4OI7y2SPdJLXgZsEq+CUVEPZbJxKunGlinoNBCzgf43qX2Wr5ecGkxRX6+0eq3ccL94GCfvKO/srrDnbnBBmKeZr2JzuoOmDafDrGtdCG6MUunxC/sAmEjM+SCQExTr4NZky1c0WxgowhhXNy1+anHVYcGnkcFlyjc3qer0L48zDr2BWFSd0rXM0W2kgQKaXE7Hrs+Bjmsvw5SBJGTQdU0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199015)(6506007)(53546011)(6486002)(54906003)(186003)(6512007)(26005)(478600001)(316002)(6916009)(4326008)(66476007)(8676002)(31686004)(66946007)(66556008)(2616005)(4744005)(5660300002)(8936002)(2906002)(36756003)(41300700001)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3NaUUZUTnljMnk4NE9rOC8rS0xPdUlZa3h4T211Z0xnTHJFZTFTWmE2RE9X?=
 =?utf-8?B?UmdmVGpaUWVxaTB3T0pRS0J0VGdneGdWaWVscTN1Q3FBM2lCNlJ6bEwxSTdi?=
 =?utf-8?B?M1hzdVEyZ2ZsZkNOZTRjNU9jb2laZVFqWDJUczN1b3k1T01uYlN0T0pTKzFx?=
 =?utf-8?B?Snc0dm5lSkJmTkpTL1RZdC9SSlpVMmRZSjFnK1VzMDhrSkVoVUczemdZN2Yx?=
 =?utf-8?B?U3B2TjF0dzFjVXZnSUhCMjgyOVBadUhhdk9DWi9vZ3ZwL20reENIazVRY1ly?=
 =?utf-8?B?UmJ5cnRKbHN5a0JmaU94NFU2eWVGcSt1YmVsbDIrMkJ4TUh5YkVqcG1nRDgr?=
 =?utf-8?B?anBhV1d0MzQzR2Q0MXpmNzdMNGZUNDRIQXNLQ0l3b29UWmtIUCtRSzh6UGlN?=
 =?utf-8?B?a242WkpaT2JaTUVUbUhMY0pRemo0Ykw2OHpVdlY0eDdReDdqRjJuQmE1bFRn?=
 =?utf-8?B?SkFORURjWUF2bS9RcnZLOWJ1K0tWR2lhSkRKUUtyL1VRTmY5QmlsTVlJWVha?=
 =?utf-8?B?cVQ1dnFkOVNNWTYyd1JyVGVZU1lNejVCUnZmeGFRUFBNdGY2MnhwVmRSdkI3?=
 =?utf-8?B?N1dNck1jOEYxeTA2cUhhL0J3c1cvWFBNcUNTWUtnTDE0KytoSGl0SmtiRVE5?=
 =?utf-8?B?Mlh5b1pzMlNEVlp3Q0dUa1Z4R0RnNjh4TWlPb1FvenFEcXpPanErYk5KTGRB?=
 =?utf-8?B?QjJjN0ZDUTRNemVVNzM1dm4waDhDRUNIMW9Ca3R5M0l3L2FPbjlUUVpqdzk4?=
 =?utf-8?B?RDQ0YkNPdHZlQzUrc3pxWWJ1WlMvKzFYK2d4dDdyMUViazJPUit2cFBDcWwv?=
 =?utf-8?B?ZmxQRkZSSUJLNE9vVWR3TG1BdWtQelp5Z3VXUXpQS1dJVDJjZ3gyVkgvbnkr?=
 =?utf-8?B?bXpVVFE1N2lWUEEvRkV4VUl0K2ZNazlVcVpiZGtGdUdTdmF4VmRzbFNEdFlq?=
 =?utf-8?B?cUI2V1F3ZWxTYXhJSGJmSVZTWlRFaWpBT0lXZnF2THJ4SHd3blRZcmUzZ05T?=
 =?utf-8?B?RzRsUEpCMTFYWHMxU3N1NnI0TVFpcXN1RnBiRVBuaEt6eXVJNFJ1aUV2aGQy?=
 =?utf-8?B?NGl0Sk9acnd4RGxTMDZzYm5QR0MzTU1jbW1udEtWU1p1RmdvWE1YT056emZN?=
 =?utf-8?B?d0RKb3RESVVkVVJvNnRRTThyQTNiREk4WEpNUGxEWGtseER6MjBqbGJ4MW9S?=
 =?utf-8?B?SURHbzFUSDJPY0pGV2lNOHd0bjJBSzFrWFJseTJBUkxkTWJYNzczcHVKSjFj?=
 =?utf-8?B?NE5WVlozdFh1UUI3Rm54dXh0eW1CNnAxOFFzS2RnTWtISUVkSXdFdWxUNUpv?=
 =?utf-8?B?OWc3eFBKODIyN3RHNWpyOVJ2WkRwNzVlUmhEVnIrbHRSRFZ3ekVlR3k2SUFv?=
 =?utf-8?B?MG9kZ1hldUF6VkFmT1VmbCtaWVpBSjIyUTFNU1NzU1NKaDVQS09pcTFTa21K?=
 =?utf-8?B?eGw2V3RFcmpINlVVOCtocjNvQTlPb2ZHZTFwYjRnOWdhZGM5c1U5OTgxVXFa?=
 =?utf-8?B?Mm9wZFFUbHVhK2wySllXdnZxODlTb0s2b0Z3MnZkWkYzbTBDNURFcXo1eFp6?=
 =?utf-8?B?TFB5Qm9yeGsxVUNxcEVpbGRwUUpGUzV2VFJ6MlJrT0Rqb2s3RnEzd2lRWTBY?=
 =?utf-8?B?L0p0R05sZkdtby9nRjdwcVBFN0p1NUJDeXliOEc5eXNMNFZhTmZNenJYb2pN?=
 =?utf-8?B?VTl1M2l6OVlWbkR0blJMZDRiNnJnQVpXODdFZ1RpZENtMU4yaXhveUxacHN3?=
 =?utf-8?B?R0VKZTN0Z1BGWGhtaE1tOWJGYTJyYkcvQkJtRTQrbmFNeEhJQVU2NHQ1VGRt?=
 =?utf-8?B?SjBpWnhpZjlMaXNTelpmTGdSRjdTTFNFaFNOTG9MSFhUOHdBcDZSUFhiRjh3?=
 =?utf-8?B?UlJSRG93MlVtaFpuV1cyM1o3L3RZTnB5MWlKUUppQUcxVkd1M1lCUVVJa2Qx?=
 =?utf-8?B?WnlZWmg1VWo1UnlhMDFtQWJXWWJoNmRtOGd4R3Z0bmE4TXplRVlkOHByQTk4?=
 =?utf-8?B?RzEzMUtJeHo2aWsyV0x5eE5mbFhUSi8raUd6WGlwSXVpR3JoN2dyOWRwb29k?=
 =?utf-8?B?S25UOVQ2NHR1WGV4eS91L3hjRkN6Nld4aytsNjlkUlkyZTNjU2NqWmZVb1Uw?=
 =?utf-8?Q?zerXP9Zwrqq2mUAamGCs7tdY2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e72041a-a7fa-48bb-4f98-08dad44211a9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 08:49:05.6678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCKvAHTuyCv9yOal9OEcNdGpi3XtQGBFfobD+gl6RPwLiI3UnPs8RwUGhQ15rj0xNxUI5GktOVGFPvymBqqGCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8419

On 01.12.2022 17:02, Rahul Singh wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1896,6 +1896,13 @@ This option can be specified more than once (up to 8 times at present).
>  
>  Flag to enable or disable support for PCI passthrough
>  
> +### viommu (arm)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable support for Virtual IOMMU for guests.
> +
>  ### pcid (x86)
>  > `= <boolean> | xpti=<bool>`

I'm sorry for being blunt, but how did you select this particular slot
for insertion, when the whole file clearly at least tries to have options
sorted alphabetically.

Apart from that I wonder whether this actually needs a command line
control, when supposedly this is controlled on a per-domain basis anyway.

Jan

