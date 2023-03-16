Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D944B6BD619
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510725.788976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqhJ-0002Fz-BR; Thu, 16 Mar 2023 16:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510725.788976; Thu, 16 Mar 2023 16:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqhJ-0002D2-7Y; Thu, 16 Mar 2023 16:43:25 +0000
Received: by outflank-mailman (input) for mailman id 510725;
 Thu, 16 Mar 2023 16:43:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcqhH-0001vH-7q
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:43:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9cd0bc8-c419-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 17:43:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7452.eurprd04.prod.outlook.com (2603:10a6:102:80::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 16:43:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 16:43:20 +0000
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
X-Inumbo-ID: a9cd0bc8-c419-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hx57RJghJu7slPmUgmjtwmK3u5NM4fA6xv+6QfacyB76X7K4IBWex2PGSx6xF2tcZLei1wgpQHrq0tNqMp0HCg9i75zmC25xTkzuL0KeeZfBegQ7XQmj1a83wTMS6sr2reHtnhIhCz4jsUJHvV0ixS+iME1QOkWgx8rVa8NJv+nK3SZ1kawAXiPyoyeTrYeSr6EwFd8pzDbrbncEcTzaZtd3LDpZbN9t+eG+wfPrwpJfftLgqUBpFJXya6rGwoT5sf3Ihnzw46PGuSQFZp/cveLTnfuXTfStZBg9R1hva/n6B8tooVQhwpBCZ9sgXdzuhdr4T4cWGo7AwEN992QZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEyxj6zpNLrSbvwDiU4yAXhzGGRI7iS52BqpzPdzo78=;
 b=fb88pi9vEIjlXkfPCTmua4S3szukraXfoQ9azBJoYMoa4uvcnS9S0qgvZ7rwmtnob+rnX/JiTNK7DLoGmwNNRVWIn5PcJn8mMu2ku9290UrXfkesTqokzHaicgSIN+rv0YBTaLUdbiyk9vDgAYfZ61xTzxxgZ7C6WrL0g/qnDFXIKubH4EtqLD0zz1xCEV2L20CvHNCwmizVZ/Nemcix0zHnOBtHvnjIChOFlDPTAzT0O+sRSRBt0O4Kgb9ogtZqzd+QVPyTxVO86GwziZB8/mIUHbX8ssPE9C0o5DxdY7Uhd/v0TMO6kjmnfWgMuTSmFpDHySyuDLWvrvc6KY9XXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEyxj6zpNLrSbvwDiU4yAXhzGGRI7iS52BqpzPdzo78=;
 b=cMkQdfomLeT0vCXWp2NSsDh8G+vTFKNv3LVMrwdkVFGBMyDuIOA41mN+NEf2ZnuGo2joWMcqU/NYhPN0RVwLwkhsTH4XRKodHesk2ycfbcvAf4Z5mSjZh6lSk9OUblb8lf1EYhrxAoU4N0FfSneuQ/eGMPagFKbYxg79dOXmDuE4cuwTNq0NuUzPplXcgNK/o9lcexPZo5U2+wjW/9Xc9Wb1ZgIfmp9+Amo9fHzKlwsVP2lfcR4pieznKwIU4oa50ivsWRjj4q8ro20deA/osG6UR1Z2WUroWQh0mw5ohXn0MPmm06XsbnssqjS686U0lbKFmnwWQteKORe+Qe60bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8331a0c4-07fa-0340-20bf-77a5c8661aa1@suse.com>
Date: Thu, 16 Mar 2023 17:43:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <ZBNBhS2I4XWkwXr0@Air-de-Roger>
 <dc31ee54-b6ce-3251-ab0d-487d9a9bfd35@suse.com>
 <ZBNGO7/NY0VQQM/f@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBNGO7/NY0VQQM/f@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e1da56-fe96-48e5-949d-08db263d8ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YKdk4skD1hA+yG16Tk2ZjK4CCQ9UIeP2faSTrXKnilPBWqdzVjqVv9lFovpP2bS0vL5OO5aAuyBfvPNmWY09xWLRl52MLY2/8jkedCqhZYya4RetTs/01/TvQZWyzE2wzQtExKqW3dmY3HI97Z+v/JNiAzh+np1P+jjymeDWh5pNswm9Xm1OiFCsOu2DV0rYotngAGyQGl0+t0fBg4rc6/iD+2oBYmgjgxrykqvTNfsEZ7AakgDdzo26blBmYsQgGLJaIm0BWrkNNWaMduaEwGCSxdklK4/R9BhaPgje6c/nhCeyxwkCziPWgaresobvIDFBOIxX4HGTpicCzdTULAvzUhNln7wBA9npSoV8k66ZNBCZeyavlP7uMxod1nU9cxGtoXNn10MX9tMT1Ve/xa/VOFB0NjKlc3sllN8G9LsQX0LPs/on+8mPeF7n7wN6/j30QAK9l3VxOZ2UJ214qgQzeUGOV4EGNB7d4AlZoqsAIAfcWwJH2ac9E1QCZSg7BxAnJFNDqFksw+CRPCpjYpX/89fsgqYQW77leVuE3Gd4HI6Uuq3X6H1YvubwI84lBO35lp41UCAlQnjC7aREi/UcSBfY5pfOWBve0jiHL5eVc0IjNamprEkCTJN2OsjmcGBgzM9PB+VW6olPm1rEI2sjhsotCGVgvmiFxM2GnknLSAwH5XVkqGupFguTRt2odbUY3t7eBUCzFQUAFBVfoK2MJOHU0f3YhX6bbBjEHLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199018)(86362001)(38100700002)(31696002)(36756003)(2906002)(41300700001)(5660300002)(8936002)(4326008)(478600001)(6506007)(6512007)(2616005)(26005)(186003)(53546011)(54906003)(83380400001)(316002)(66556008)(66476007)(6916009)(6486002)(8676002)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWVRTllFSzJDbnhHUlBrcU5zUGFsckZpcGR2TFpkY2Fsb2I5VHhHdndPOUFl?=
 =?utf-8?B?RThYOGcyaG5uZ0Rka00wSnZhR0tuNm9jbVhZVk9FbE9LaFRNYVVXem9SR2M2?=
 =?utf-8?B?eCtBQ0NkdXhZWldaelFIZFdUQzF3Y1BxRTJad2t1am9rL2N6cjJNOUhmckQ0?=
 =?utf-8?B?Y2xZdHd0eXZaT0c0L2J3RHMxWU0rMWsraTkwclBBdGdWRjVLWWNSOGlVekNv?=
 =?utf-8?B?OGYxUEhFNW42a1dGZkZSSGVxalFGdzh5T2wzczM5dS9SUDJ2RlNheFNMc2pD?=
 =?utf-8?B?UytUazlWZFh0RC9QVUQ0dXBoQ294YUZ2WVZSeGdreHdZRzUxVktVcWRlbks0?=
 =?utf-8?B?UTVDVFlQTERHdWQ3SHVLUVVPWDRYSzJYTU5RaHB2NHBDWmRXQm45WkFsdlRP?=
 =?utf-8?B?VTFuNTF4NGY1dWpuUExtcGxpN0dmMHlXaisrcW51VXVPUWhmNzBQS3FrTTU0?=
 =?utf-8?B?MWpzbHlhbEliZy9Nd2Joc2FMQVFEcHJiSE8yOHJFN3JDTGNWNytsNVpHY3ox?=
 =?utf-8?B?U2Fxb25jOVFnaXpmcFhuZFh1Y1JzVDg3cW1GNFZvcUR0NkVQSW81eUkvNEd5?=
 =?utf-8?B?M1lTVFVlbTY0OXIrcThaN1MzWUxDZ2NqZng4SHphcHY0Z3U0VmRZYkI0T1Mr?=
 =?utf-8?B?eDhLSmFjdGZHalhVV0tvSjdIRmZyRlkrbTQrY2QzNUdqQXJUVkFUSTdYUDNh?=
 =?utf-8?B?V0krTEdhWU92aENlT1lRNGlWTHVyMmxTaE5vczBtQkRyUit1Ymw3UEVDY3Bj?=
 =?utf-8?B?dW1EVjVVcGx4YkEzNUkzcCs5UXIzK0FZYng4cnJhTGpBblJmRCs1TXpSUk13?=
 =?utf-8?B?R0xhT2txTElpQmFrZ1BVLzZDd3VzL2ZLbU8rL2NwcmI0ekF3eHgzUFA2MGpB?=
 =?utf-8?B?eFlJdDhPZE5FdUVETmFpcHJORDJmSGVnb0VRcGJyWnQ5ejJXaGVPVUNNaGxT?=
 =?utf-8?B?Q0FaMEJ2LzY1ekRmZWd5emRzSDlrYmxGQS9uanVhTndoRmtQMkFBWWxUWXpy?=
 =?utf-8?B?M2sxQThWeDd0SE9PckZ1Q0hkSjlKOVRhdklOSU9lckpEWUwxcGNwcm43OCtn?=
 =?utf-8?B?QU4zQy9HUERERC9uMXJibUtvbzUwZG1ZQXQvSFNKOWhDMytCZGNTc0VQM2NX?=
 =?utf-8?B?V2tPZ3lobnNzU3g0OEg3NDBXZ1JCNmdPZ2l2TjlRS1EvS3VFa2tyS1BzWk9x?=
 =?utf-8?B?Y3Y0MmJVK3dYNkI1bmdnNGtaUW1NUDVYTW5CMEFyZXVUTE95STBERjdXaFJw?=
 =?utf-8?B?TC9VTWViRVZMeHk1TGFqS0NlQUU2aWxhcmJzOCs1L0h4aEp5K2NUQklNSTR0?=
 =?utf-8?B?WFBkNjVaTFpKV3N2WkFVdHdGUzF0SGJaSTFNZXlxTEszaXcwK0NWb0VTVmxl?=
 =?utf-8?B?Ti9KZUJ2SkpJM2VqSHFicVd5bXpuL29kVzhJakFOSWNkWUlNVjBDandhcGRE?=
 =?utf-8?B?Q1NvOW42dC81UU9wRXRaNmpVSHZFTmNxdWhsbGc4Tm56U0V0TUYvbmtUU2Jy?=
 =?utf-8?B?ckZXS2ZmWEs2RDNwejBHNkRnUXlsMVdORk1Ra0tFb01FY2NLUUhYSGxkMmZv?=
 =?utf-8?B?NUdFMUl5K3dSVUFaZU9IczFmbUhBMnl3SjlXM3NyQm9JejlVTVVuOWtGaXAz?=
 =?utf-8?B?SUxRV1hha2FET0lwdnFEM2dYbmtsNWFDQ3M1NzZTRE5JKzRjNTdzaHJBb1Jq?=
 =?utf-8?B?cmxDZFl3eUpyM3BTNlNrVjNZRy9yZ3hPUmkwM05ha2psMGU2cy83NUFFZUhN?=
 =?utf-8?B?T1hFaHlsVy9LQnNwbEVEMmx4NFpSbXJDQ1FGT2tJWXY2Tm1aMDhJU2RCMko2?=
 =?utf-8?B?Vjl4RUdKYit0bWhzZGtzd3BXMzBrOGZkSmo4MGFkYzZTelRlMDJoN0NaOW1C?=
 =?utf-8?B?elNGM1ZUZ3ZPUDNZeDMxMDFpZVE4aktHZUdoeE01WHhjTTF4QnBSU0NKaU1i?=
 =?utf-8?B?NHJkcmd0MkpxQi9saXl5em5uUktlcTZWSUlpNHRVYnpmWTd6Q0lwb0U3TUZM?=
 =?utf-8?B?aitLNkNlamNFUlBQeEdleVFISlk2UTJIamVnMlR1Z2ZGUkVKc1NBRlAvVkJq?=
 =?utf-8?B?NnFzY2tsYmZ5QksreEd4RFBNWVFob2tPOWptRFhOQkUyWWQ1Q1MrdG1CVHky?=
 =?utf-8?Q?v0LauF1BQSL1LCpn4eT74nEXR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e1da56-fe96-48e5-949d-08db263d8ccd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:43:20.2388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAlkkIYkdZ/CC9vWxY9JXosF9GwPvlYePVP76tljLvo+JMNVVSqy9wVlnoQktsr0qw4HRI5FcOmeUKYj2mZ/kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7452

On 16.03.2023 17:39, Roger Pau Monné wrote:
> On Thu, Mar 16, 2023 at 05:32:38PM +0100, Jan Beulich wrote:
>> On 16.03.2023 17:19, Roger Pau Monné wrote:
>>> On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
>>>> +static inline void refcnt_get(refcnt_t *refcnt)
>>>> +{
>>>> +    int old = atomic_add_unless(&refcnt->refcnt, 1, 0);
>>>
>>> Occurred to me while looking at the next patch:
>>>
>>> Don't you also need to print a warning (and saturate the counter
>>> maybe?) if old == 0, as that would imply the caller is attempting
>>> to take a reference of an object that should be destroyed? IOW: it
>>> would point to some kind of memory leak.
>>
>> Hmm, I notice the function presently returns void. I think what to do
>> when the counter is zero needs leaving to the caller. See e.g.
>> get_page() which will simply indicate failure to the caller in case
>> the refcnt is zero. (There overflow handling also is left to the
>> caller ... All that matters is whether a ref can be acquired.)
> 
> Hm, likely.  I guess pages never go away even when it's refcount
> reaches 0.
> 
> For the pdev case attempting to take a refcount on an object that has
> 0 refcounts implies that the caller is using leaked memory, as the
> point an object reaches 0 it supposed to be destroyed.

Hmm, my thinking was that a device would remain at refcnt 0 until it is
actually removed, i.e. refcnt == 0 being a prereq for pci_remove_device()
to be willing to do anything at all. But maybe that's not a viable model.

Jan


