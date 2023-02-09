Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A506902E9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 10:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492253.761708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ2vc-0004qy-SH; Thu, 09 Feb 2023 09:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492253.761708; Thu, 09 Feb 2023 09:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ2vc-0004p0-PP; Thu, 09 Feb 2023 09:09:16 +0000
Received: by outflank-mailman (input) for mailman id 492253;
 Thu, 09 Feb 2023 09:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ2va-0004ou-Jf
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 09:09:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6aa8ad96-a859-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 10:09:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8762.eurprd04.prod.outlook.com (2603:10a6:20b:409::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 09:09:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 09:09:10 +0000
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
X-Inumbo-ID: 6aa8ad96-a859-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jlpy2UW0V74PEDUcEVggCZsmGr1o7YipxAiWWluV4ahsV5GzD9BrkrJ55PSULgxmuH20N4E5hbAGv6k7S1x0dKcJJpEB6FcG135xwt8s1g3FP4DsCk73/eDirp9qZjFyYu0PxLy4YG8k6plbaeE/WV5bR1aPxb5FDHzMUIdJFpf+zsyBnCF7B3bJk5LxV+joDSGSnH23V08Wk4npQxNOrv5Hyju4ZT7SlXHDYDpUkyvmmKbdmWgzCkk4AzquWjNFxdNMChkHqXuyUW49RtXt4Oxr+qwGjP72mX9i5RGru9fPvLeKfFkLWTCxtPUVdGsyccfGNvD4zmN9SHo+KhZO0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYYg6cPBjseN5jLs9fYWcCE6w8K3jMwizwZEyylffCk=;
 b=dSK4Siz12Nb7lqKEe3VyZbHgvsW58vyXWe13hdif0Zf8guyNAruUYjVebT5Gka12Z4oqhjRq/SxAMqsxwAqFc3GOX5VK133In7LEbdlnB+UpY4T9wXt8MZ214nZhRNOK5MoIhyZB3pzh+YWWHxDsSSJFykED3ZCmZSQ+T6pfdOqKW2gGN6UIubuuFavFROc4JVSUBfD0EGRmh3Trm3i5V4OHxpM1MS4mtXnY/tI4YEfrTJXzz+xU/pcd70inhjmR7TpUkhsgPJxj0m7NuRzyf0C1R1EVFRpGQbnswhqebx2skHHZNVJeNL7H6q5BT9+zrsfam1gi2Nv+EJmzr07cbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYYg6cPBjseN5jLs9fYWcCE6w8K3jMwizwZEyylffCk=;
 b=m1DsN5A5LP4zyuuDvzCWD2IqKuvFkyO9h87WTDgfWjBuLB496K6FHh28QNeWrBbZZuHBSWnQ6kwR9YtulBfsOILpux3+V2xknY7N3RUXYRqZ9lhM13FSyE4VvCfTHo74kP3MQqA8lfEV2rfdvm/KOh2EUpqVeaUzAP68/TV9fsHJIIWFLvzXjo1LwfU2oF4wTMjkkHPx1D5AB0aEVR+DN87cMlpRp0B30YKIL2ZnLBKBss9VjqRLiLiJHZtlg2eyUcMxppfNrXGuE2Oe3Q24dA98YV2M+WRutDDHtUJluRWaiy/vPstEz81q3nIvYg5kApmdSaFPd2aDEXDJSkwXkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dfc2d1ae-5e44-0aca-09cd-43b90351b248@suse.com>
Date: Thu, 9 Feb 2023 10:09:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/4] Stop using insecure transports
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Paul Durrant <paul@xen.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Tim Deegan <tim@xen.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Rahul Singh <rahul.singh@arm.com>
References: <cover.1675889601.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1675889601.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: 60c6fd4a-8267-4a72-622e-08db0a7d4e17
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/EkvlEgglDGJied0vUEW8rSmxYhZpAt8Ls70Ym5lrqXgvWulA/3vvVQ6WDHKIjSLHkEzi7MRGdXX5dwjAf+AbbuHOjqwXUtEtTlPnvmnvNY2DNuYfoiPZlutPIvOyLMUDDoNtzJ1KnunIXyJdmCR4YQ5R7E/fWaU20WdP6S0A+Kr9Ok1M7lEkO6O3+kYbCpgT8HRVNY2+Z5eBZdYNMSBnjHx02xKMm+BT+H6OuAFls6qnlct4qp8m5nZKczRTozCpNi/PmIYfz/vRzWGnJEtGHT1J2b9E6/4kvdDq++k+4Oq+QVMpoQvJDTzw0oCNxI6OfRyaHB0KEdBS8rz+Jz4IN/+L5LoJXYadj6VERu+sMpnAM1qnC0+CgfGo9X8EScSPxnLOhvdvjpGSN+49xYJgsF0LH9+xuS7DIzPyR/Uollk7zfmd23/j87Opw3yR9h01yc1HQE8B/fP7He1mWkFJyewby3VIQnKoKTYslKTX1S+63J0aDHF20oPFoy4m9lAvpQaE3SlvbjWZ+q9dt2SOa8KO2Uc4QdgBpnHh+e5soo3Lwnqfp0NSnb7XTg0ODfmOTHIAj9TRRxMQ45R5KwDVJvbBuWgPADsJDTdgxwmR/yI0BitMk8dHOy1SmQ7WCkmloQ2ES4m5RqH5vEh17hyto0MfY7nByOktfd3Iiutllmc8xZey/lDkAg7CbUGB9g1I3otUBHGxAj1CZZEUYR0PLj9DKhbAXC1G/nWDXUfiLsRltvvEOgZfBKESL3ra2gbMychZYSDDTNxGYbzZ49WZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199018)(478600001)(54906003)(316002)(2906002)(7406005)(5660300002)(8936002)(86362001)(7416002)(26005)(31696002)(4744005)(41300700001)(66946007)(4326008)(66556008)(8676002)(6506007)(6916009)(53546011)(66476007)(6666004)(186003)(6512007)(38100700002)(36756003)(6486002)(966005)(31686004)(2616005)(45980500001)(43740500002)(376185003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T28zV3ZIZkVTaXU4NTRCSXdWdGZveXdNaEdVRWI3SGs0SDZFS0RUQks4d1Zl?=
 =?utf-8?B?a1puVHFmQ0QzeTVpeEl6bVVFTUhhd09IdjdzbUtNL2Y5VEo3b0g5d0wvRnV4?=
 =?utf-8?B?Um1UdmN5NktFWFkxUEJaK3dCUEpTckFBcHROc1Z0RjAwbjRMQ3Vaa0NiVTlw?=
 =?utf-8?B?WEdVN3BkVVRFZHh1Vkh2NDJpc1dxK3dBOWMrbUcyWEFQclg3SVFWNkVnNUJW?=
 =?utf-8?B?M1dJVXlsQ05BbTBQTDVUTEdCQTJBeGZLSHYwUnZWRjYramhPdGRmTm14ZGR5?=
 =?utf-8?B?Wko5ZmM3VjdTUFhyRm5BREQ5MnRHeTdmbjhvcVJYaDVaR3dsRFB2bk54ZmJW?=
 =?utf-8?B?RTF6S0ZQazZZNG9wS09sVEhjK1FlclRCOUM5clg0TjZZMVBtdWlGMzVaL2xX?=
 =?utf-8?B?emh5VUJ2ay9RNUlDT05jUkowVVU3RCt5ODgwaGFSYTZ3ekt2MndXTkFuZU8w?=
 =?utf-8?B?NkphTGpMOHl6Q3F2QUZtYllVTklOVE11WWxLUWFXYjlFY0N2UmFTaEo5UGp0?=
 =?utf-8?B?b2JVSlkxeGt2czFiMEdNdHNoU2p0eDJONDRzcFBMeWNkWjdVbHFYK05Cd2Q2?=
 =?utf-8?B?Rmx5LzU3ZnNseWpDb1AzQjhMUG5iS1ZYcWxOSXJUNVVrOHhnOGNJTDBOQ2hM?=
 =?utf-8?B?SXJ2ZGpvRHpoZ1BnUUYvZjBHejk3cnR4WlVTUkxubUUxSDJiTS9zbk9MSUlR?=
 =?utf-8?B?ZSt0L3d3UkFHRFFicHVpMVkraytmazZWSm14YjV4dXF0VS9Pck42Vmptck42?=
 =?utf-8?B?OFFVSU4rSEFxSDhVTWNzbjlaTWlJbm41TUZSNjB4enYyZnlnS3FMeDlkc3Ri?=
 =?utf-8?B?a2dLZmVVUWZ1bTdXdnAyUk5Wc3dwTHpVRGtYcmowSzVhVkN6OGJUb3RzY203?=
 =?utf-8?B?d3ZXUVhBM0pJMTVZQlgwUGlCcDZ3enZDMHpVUTFTcExZVlovV3JxWXFKbTRi?=
 =?utf-8?B?V3V0WjUvbXE5TWpPcDY5eWJrTDFCZUZYdldNVFpib3VVc21EZTJKb1RKOUFO?=
 =?utf-8?B?TXNVSnVnQUNiUWx4Z1REelNCVkRPWFdGSXBKMDlDYS8xZEsreVVabE9iM0tI?=
 =?utf-8?B?NHFqMDR3Ukd6STlmY0FPbkNoMEMwemdrb2Y5ck5EZkVnV3hXc1M4UC90VVFo?=
 =?utf-8?B?Q2g0aEphdHJLczl1Y1UrVzdTdFR4d2s2TEdmRmdqdlVrRjM5OFJZRXMrdmFV?=
 =?utf-8?B?WTl1UEJhK2N6TzZ2S0h5ZUZZN0F0dmRQU2tSQkpTaCtFbEVmdGVQZFVNNXhO?=
 =?utf-8?B?UjM3MUFHUTdZYXlkaExQUmtzOUh5NTA3OGJ4TTB6QW1zYVJJOFc5K3FQbDAr?=
 =?utf-8?B?ZlRDd2ZKWFlKakFoVTNTdThPQmtuUUdyUmpEWVBZNjZ0YTMrS0h6VnF6dGRp?=
 =?utf-8?B?ME9IT1VmKzM3K052UEZhSEI0NXV5ZGg0TndFbkZTYWhkSnJWL0M5SmVkNThG?=
 =?utf-8?B?ZzhPaE1xWmQwVTkvOU93bFlIU2lReTVycW5lM2xGZVU0SU15M1B3b0haWDU4?=
 =?utf-8?B?QS9qWm14TW90SVBzTXRpWDduU1pJWHJ0TE0rU3dTQUdwWG9lVVMvcUF3QXBt?=
 =?utf-8?B?SWpJcVo2S1BHM2Q4SDVpK0JqejVYNCtxbTBlV243VkczK3JuYXVvVFlhNGUw?=
 =?utf-8?B?Y1hVUEl5T1RVK2tKZS9XM3BOZVMxNm9PL3U4SDdNU3pucG94cnBRUUJVM3ZX?=
 =?utf-8?B?STQyY1psNnVxWENlYnJFQXRPZW5SS25tckVLVVUwUGVCdExKaDliVXEvOXBE?=
 =?utf-8?B?bm1iQmw2TUh2ZFBER1JHdm1wekJac0dVZDF0RW4yZ0NvajBPeXBUWjR0NHJ4?=
 =?utf-8?B?emh6NXhUQkVZMFF3MTVmdVJqV2hrMTRSQVAwVklHWk1wME0rbURUTnFTTFhM?=
 =?utf-8?B?cE8zQVQ1TW1JZ1JxRS9RLzNlSzl6Um8zdFZVbmVSbEpLcXJhQStHaUhlTG5O?=
 =?utf-8?B?YzBaOU50dVlyUThybXhYa09pcVNFaUZOZ1VYYXdORlBHaE9jQ2RDZVlkbEE4?=
 =?utf-8?B?ZVFYZEw4bEpxRmF0b3FlbnhCTldGMFBXQzZWeWd5MFlSemQzUzY3VEI4c0Yv?=
 =?utf-8?B?clZoTnBwVVVBaVc0VHUrUGVlODAvUmsydTJzb2RENmhnQUowcEJ2bE5zY1RR?=
 =?utf-8?Q?373yB6rcMj9btIdG2t0JZZNjQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c6fd4a-8267-4a72-622e-08db0a7d4e17
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 09:09:10.2589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Es7gVGhEYjYxAyLNn/hoX0RhkaEuzVAL9IBddntUuKjelj4oOb2WDTEPROgZgx6z47eBkm3l/G0eZb57vT+Wxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8762

On 08.02.2023 21:58, Demi Marie Obenour wrote:
> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.
> 
> Demi Marie Obenour (4):
>   Build system: Replace git:// and http:// with https://
>   Automation and CI: Replace git:// and http:// with https://
>   Miscellaneous and documentation: Only use TLS-protected transports
>   GPL License Boilerplate: Switch from HTTP to HTTPS

Mind me asking what changed from v1? Neither here nor in the individual
patches there's any information about that. Yet especially for the
voluminous patches it would be quite relevant, to avoid reviewers needing
to go through everything again that they may have checked already.

Furthermore I'd like to ask that in submissions of new versions you drop
recipients whose email addresses bounce. Like I did get bounces from
Quan Xu's, I'd expect you did as well.

Thanks, Jan

