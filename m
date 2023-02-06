Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F568B959
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 11:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490188.758795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyK9-0004rv-OS; Mon, 06 Feb 2023 10:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490188.758795; Mon, 06 Feb 2023 10:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyK9-0004pE-K2; Mon, 06 Feb 2023 10:02:09 +0000
Received: by outflank-mailman (input) for mailman id 490188;
 Mon, 06 Feb 2023 10:02:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pOyK8-0004p8-87
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 10:02:08 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe13::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f526a44-a605-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 11:02:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9123.eurprd04.prod.outlook.com (2603:10a6:102:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Mon, 6 Feb
 2023 10:02:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 10:02:00 +0000
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
X-Inumbo-ID: 4f526a44-a605-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWXydX5qC8IiUYQgpInE6B9RdwltrROh3QocR2N6H1PNO13QCQzOxDORQOPkdE5MqN8+bwuhLAfRewo9o37rzfiUeg6y7v7QjbW4wgePnMFwpE1RzV203Mx2KT8NMzk1M1hYP3Uigt2uED+mnF3SwyBdWAd8xtQ1MC/Gjn9513RoH6T0GGCj7tN8yjLxBqKtsaaijzh2n+eHAr34mKFuNvYyWg2H0LoLWRmEQyjt48UUeewDq39Rw7GjwVxPD8GCufeEMkSKaFud/NJwC/na9sRBR27SE6kuTdHdX2Kr9ofU6xFkKB+f8zvCshcNMecwKmpttDDemKkBchXGLnoj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLnhGpjDMzRxpoB7RHvVZNt0fte+ucOpHhwACIQ1O1s=;
 b=knMyQXwMX3bBOBF4C1maa+sEXJUic3XixIZzo/R2tBKU5tBFsgvJz16WzTnuaPOf+QiJqAEaDyR/djFVLEkCWnuMkoTbCbg3FX1wWOV6FsMKsNeNvZs0r9SoCT5dWZ/ts7xHiFxQu8ABNkgYk2QpKzY63MdwMgUqp8Y7w2RGH2pgqwNw2ZjFbdUKHpJe2k28q4/Q0d8H/GkRsh8FB3rgO9+a1sgYw1lcOZMk6e2oH4s0Qu11PpwJaDTT6vT5seZg7gvHRyE4hRR58VGIopeFbhWUsjQAr/3Mkqjqbm1Id8TZznrv5gqNZ4rFH9lcdqpvWxlRIWLkxDGgsK2tZBpBcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLnhGpjDMzRxpoB7RHvVZNt0fte+ucOpHhwACIQ1O1s=;
 b=xZSaetmVsPFF4vUQX+v/lxtV5/mxswACzeH78VGWmCvmHYTegiVJpE46EU0ewqO6q5s7Vr/5yiq1FjDbw1usQeZZouiF+lGGI/iQ4rW2KcDh7NXgV6xG1IcaDFD6gPZo6FdsngorNE8zVnjKrgpVhoNnbBfzrg1EEL89IvmVlAgSFDPWc/jVywVEl783enT006G0HfoIv3Tub0shUDJhs1eLA+mXIwTl45jc9+ZoXaKT3HnpaO71NcAKTZ3dX6r2Qbu0dr4BNWFVsrr5p+LKI8OfGoNL/aboGTOhgait57Juhkx2bD4J2z1ea7FOTEiFCIEUN05Bk2erRHZBE0kgTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <005b7fa3-0f64-b15d-38d5-8135b0da06d2@suse.com>
Date: Mon, 6 Feb 2023 11:01:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Proposal: List files in Xen originated from external sources
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <BC3ED7B9-4917-491C-934A-EF112849CBF1@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BC3ED7B9-4917-491C-934A-EF112849CBF1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9123:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d606a22-d7ad-4040-b3d7-08db08293084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	efRxEgD7s7k2/2fs24p03iJ4/Y+/kPnirwGJKp5qqxOdQ0C9eUrS4bF9/Kb7+FRG0xNhlU1tmrN4iLhIRPtpEZwi5rFh6a3o1fSjEyU9CgQwOTfmR019PROOJ8P6mS5En16m2m0hmtmG7KFxDq4jMy5kE4bJow0mwKoqNXxHIdRsjDK02e3PLVufy80jWXacOuEje6h3vyPCg8BE3TmPnRGEDVK6H/LSVnDd0etcIXxPa5jdfPM/BrOhMeWMGCXe0ieb2sgSOUV416oaseu2oQ0JTqkoSvJMOmRHCkHlIOGQYTG7+oAU1ym5ZaBKzeo7UpBJHIfj35Tlkl6z95A+zMA+4AiubhQQEdyhKVOERbqShz8DOIYAPSQ4ciWnh+izj9gADbhwbiB6QrWQlw7BlC7G58uOAvQ/fXM6iHiNG4m+jqkSp4tcpuhJh4gqAlYNPoaFLwk5NU8Wlb5gDbG6naOVp5Lzz+QgOVctFsNb4d2Gu/ZFXJ9awJaud8SGRg+na53NujoQfGM2Ecw+fHb40E/OC2wTZcZePehlrAbjJHGjpii4uJXCzvVBg/CyTx5BSbceMd+eWHPe1dGbGR8NNZGhUqUrf9Ir3BnBiZhnlCh4IvmjGe+MocBlUk6sRvP/dBkTUGaOGKEsn9LHBvxA6nI+eb2HQDwPvQn20pTZrz8wWmKmlUKPpTRxbglBj7noOUwOLKzNQ7aF/NebBpMhWpxLtGukCW4FZ73RuaLC+hzlFpM0iDJ2dl58YU34p1UqW7V1uyOk+ACOXkGymzkz2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199018)(31686004)(38100700002)(36756003)(478600001)(86362001)(31696002)(966005)(6506007)(186003)(6512007)(26005)(83380400001)(2616005)(53546011)(54906003)(66946007)(2906002)(316002)(66556008)(66476007)(6486002)(4326008)(5660300002)(8936002)(41300700001)(6916009)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekVvYUJ3ZU9xRW5XdnMyeHVKQndWTWxzYk9RMTl1aTNoU2QwbkJ0Wlo3bWdx?=
 =?utf-8?B?S1FQQ3l5NllZbUhCVW5jNjdWMmtyODVwWUMrdkNUMERnVUVpZmRHMkIrVTlr?=
 =?utf-8?B?NlZjcTVYSzBlbDdRU2hkNFErN3VUZ2k3dSthRS9OeWpEWXduWEJFbTBWcjR6?=
 =?utf-8?B?MDBURmI5aHVETGdBV2tVVDV1eitsVzdCWkxyL29QL3RMY2pRWnA3WEwvUU9i?=
 =?utf-8?B?WTE1VFBOS3krODRJbmpZYUhxVitzTnF5aVdWYWxoUWhwc0tVVlMxNWdSR0hM?=
 =?utf-8?B?U05GdnViYWNCWlp6cTNaUklJcCtyeElZVmwxQU1PcUdmMVpMTHNnSUlYakkv?=
 =?utf-8?B?Z3lXZkhzUWw4SmVoQnpZSXBabkNnSkRQSlBYMWV2d25TeG81elc3OVpPbXZh?=
 =?utf-8?B?ZDltOXdFRWE2UThIOWJqOVBBUGFET2ptMzBYKzVsWjhwYXN5L1pnQStWNFNQ?=
 =?utf-8?B?bFdIanVuYlhrTHhnREw0bS9OWTVEVDZnZnZUVWYvYjgrM1d1ZGRHMUVIY0dr?=
 =?utf-8?B?QzhEaHoxaWlvSlNJTlVxWkgyWGRYeW5ybS8wRDZDQUtxemg0dnFyRTV4cXNH?=
 =?utf-8?B?T3B3dE9SaEdTVk1lWE90aVF5eTJHa3dsNlBQU2E4ZVVxNDRLWnhvajJldWx1?=
 =?utf-8?B?SGt5TklzUE9pc29Da3M4UkJhSmFzQ2cybXZWNDhYR00yaEdGQSttYm95ZjVN?=
 =?utf-8?B?V3NxRmhpTHJpeXc4Y3ZaWkk0U1B5THYwOWNLbjNVZ2xaZDJ1UCs4ZEVXV0J3?=
 =?utf-8?B?UWdNeDh2dEZLcmppdldWRC9yUHZTblJIL2poZklOSldlVmVOQ2NTQ0ZwdGRi?=
 =?utf-8?B?SS9rUVJMRmVicW1uS1ppYVd4cDdnTmJtVmtYaFhtN1BRWjcyd2Qvd3ViY1pJ?=
 =?utf-8?B?YzVjYzFzdE41ZTYxWFo4Y0VsQmQzdzZIRERxVTM0V3hBdTVhRFZMckdheXVw?=
 =?utf-8?B?dEtWTWZZamlvRjU0dmp6eVJ5ZTkwbUNmcjYxWTJnVDluRmlhNWVPN3lkNkt4?=
 =?utf-8?B?WC9Nbk5UM1NYbVJsWjA4UjhqTDhwRFlFb0I4d2k3STVib1hERHBPV2t6Nk10?=
 =?utf-8?B?ZU94SkpxK0NjTFhxakV0UDc4QWgvVHJOR2ZtRW1mdlBnTkZGajE0UVJGK053?=
 =?utf-8?B?dEVkNGdHa3hrZUFaZCtZWEN1UWFYTzU4eEpoWGUwa1dhazFiUWdXYzlkK1N0?=
 =?utf-8?B?N2svQVFUczU2VmlJL1o0aW9MUTlXaW94TnllVVVzTklkUDlqR0tqSk1BQjNo?=
 =?utf-8?B?YmlhdXJwTUpFdGEzcTFGeEhvN0k3VnIxMHdhSGdONDhpUzI0N3NOUnJjeTVB?=
 =?utf-8?B?NDd2VkQ3djUwUXZKa2dSaVBpM3hILzFybkdJTUxRQkhrcE9VZ0p3MTBCOE0z?=
 =?utf-8?B?cHdQNFp6OW4wMkswdWRyU0hBU3hnZVBmRlVCaWpMeVFpdXhyQjNySlhNekta?=
 =?utf-8?B?Nno4a0VTU2lmYkJBTHJMQ2hpRHBGejFjZ2I4WWQrejhFSi9Db3BtdWUxaWN3?=
 =?utf-8?B?eTlLbitvZXd0YUdhOC93aE1iZE1MQ3A5dGdaM1MyV1B6TW9kSlVtQmw0ZXJi?=
 =?utf-8?B?ZzlaTzc3ZEdBUWFFWXJ5ZWpkUTZRbk5hQm5XZi9kcGs3djAwRzJvVW12eGt0?=
 =?utf-8?B?cTBoMjk3dDNrUkR1TnZmYWtCcUdDaHFrc1JxWlRTZjROZHg3Wm9aMnErVnpW?=
 =?utf-8?B?Um9icnY5eTY3aTU5VVdiQlM1NE8vTmhyNHFaeVArcXFQM1BqSHFzTFNpekk1?=
 =?utf-8?B?YitoWm5zbUhUNHVValBzSkFtWVRsVDJwSld6ZXcybFFoUyttcDUrNDlxeCtt?=
 =?utf-8?B?RjRHbUpORy85Y0YyL3VqOXdueWpBVWNrVUViUVp1bERGMHNpQWZIdG43U1Yx?=
 =?utf-8?B?bExPVDlWcWhMRlFtNzlMQy9MdHpJWWZ6TSsveWFOekp6UVVxSUtKckNISXhz?=
 =?utf-8?B?cXJKK0tycGlNK2xNdlJVdVVBL2lrQW5xczJOWXhaSE0zMHhkKzZIdXFIWlNO?=
 =?utf-8?B?UmRFQnNmbThJenRzTE93RTRnZEVOd3V5V0VQUVpnNUx4bEZ5dE53cVJ2d2NO?=
 =?utf-8?B?eXBDSVAvNTdKZG12Qnd0d09abzU1YzdrUExWWllMRnptRkRkRW90VERsNXpu?=
 =?utf-8?Q?jyNjMTZOSo2/hUOpGf7nrCj7G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d606a22-d7ad-4040-b3d7-08db08293084
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 10:02:00.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B81Hw0SwxIPJzhgd8zPaz1G6Mcj30f5YKvxQTXzG8ZoHeV3ncjrWVf0Yy04ZoLhtYIrdM04mkl9hO4+RRvtktg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9123

On 03.02.2023 10:30, Luca Fancellu wrote:
> I’m starting a proposal for the external files that needs to be removed from the MISRA scan,
> the work was originally started by Michal here:
> https://patchwork.kernel.org/project/xen-devel/patch/20221116092032.4423-1-michal.orzel@amd.com/
> so I started by that thread, the aim of this work is to have an initial format to start as soon as possible to
> exclude the external files from the MISRA scan (at least initially from cppcheck).
> 
> I think we can use the JSON format because it’s easy to integrate it with python and it’s easy to add/remove
> fields from the structure without interfering with the other elements during time, so we can define a structure
> now but if in the future we see the needs for additional field, we can just add them without changes to the
> analysis script.
> 
> In my opinion many of these fields can be left empty in a first push, to let the script exclude the files and during
> time with the contributions of the community we can add the missing informations.

I'm having trouble making a connection between a file having an entry here
and the need/desire to include it in scanning. Can you clarify please why
you see an implication from one to the other here?

> I think it’s easier for the community to pick an entry, do some research to fill the gaps and push, instead to wait
> until having all the informations before adding the entry.

Maybe it's easier, but it's then also less useful. For example I view
it as quite relevant what the origin of a file is. That may, for
example, have an implication on whether "backport" is sensible to set
to "true" (origin projects could, after all, be largely unmaintained,
and hence it may be difficult to get any changes into there).

> This is my first though for the fields, let me know yours:
> 
> docs/misra/external-files.json:
> {
>  "version": "1.0”,
>  "content": [
>    {
>      "path": "relative/path/from/xen/“,
>      "backport": True/False,
>      "origin_project": "URL to origin project",
>      "origin_path": "relative path in the original project",
>      "origin_revision": "revision in original project”
>    }
>  ]
> }
> 
> 
> Maybe, documentation for this file and the fields can reside in docs/misra/external-files.rst.

Couldn't documentation of the fields live at the top of the file itself?

> Here follows the explanation for the fields:
> 
> path: is a relative path from the xen base folder, it can refer to a file or it can be a path to an entire folder
>          (Taking as example libfdt)
> 
> backport: it’s a boolean flag that says if the file is subject to backport, so every file where this field is true
>                 won’t be included in the analysis. A file is subject to backport when it’s external and it doesn’t
>                 accept direct changes (changes needs to be made in the original project and then backported
>                 to Xen)
> 
> origin_project: url of the repository where this file was originated

Personally I'd drop "url of" - the specification of the origin needs to be
precise, but I'm not convinced it absolutely needs to come in the form of
a URL. What would imo be more important to mandate is that the reference
be to the "canonical" copy of the project, not e.g. some github clone.

> origin_path: relative path in the original project, mostly linked to the original_revision field
> 
> origin_revision: revision of the changes in the repository when this file was taken.

I guess this needs clarifying: What revision is meant here? The one originally
imported, the one last updated from, or yet something else? Keep in mind that
we may also be selectively importing changes, in which case any particular
"revision" can easily end up misleading. The format likely also wants
specifying, e.g. (like we do for Fixes: tags) the first 12 digits of a commit
hash. For said selective updating this might then allow for something like
<base-hash>+<cherry-pick>+...

Jan

