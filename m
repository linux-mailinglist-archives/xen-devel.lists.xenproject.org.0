Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039987E6440
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 08:19:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629476.981742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0zJL-00036N-Gj; Thu, 09 Nov 2023 07:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629476.981742; Thu, 09 Nov 2023 07:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0zJL-00033d-DP; Thu, 09 Nov 2023 07:18:43 +0000
Received: by outflank-mailman (input) for mailman id 629476;
 Thu, 09 Nov 2023 07:18:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r0zJJ-00033X-VY
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 07:18:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34f1bd09-7ed0-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 08:18:40 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8752.eurprd04.prod.outlook.com (2603:10a6:102:20e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 07:18:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 07:18:37 +0000
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
X-Inumbo-ID: 34f1bd09-7ed0-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxYmXNhQXrCJAMc+prRvuQUDyqZo0uoVhi5Z7lJz2HVBjtQ4sbqtTSe17w5wQ1EgqqhFg0ouCbGrgfb3osId8hpRa/nt66HGPTDJz2dicAlCH57XDJS2+aJcM2cOZXKwWcS5+N8gMG9qnRxPk7FdMr6+bbtP8LXIW+pm9ivNX5bHK0judHYH5b7bfyl7gvcDbceoxedfGyS19SfXhzP1A1dnct9gZ0pMzbC0A5px5TfgfpITi50Ct96NndleKmarleFjqWIJJ8rV5lPcyBkZL8Xga3uuM5Fchk3ayFjv9/vaTmibnZrrAs5fxNcgMSIwpZrONeoOQz0t1mfwcEThGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHMegOyc5KC6FzEYtcVAiM5rl9M+ifYbRtz7GxTXUQw=;
 b=dtwfLDtl41ITMyvAHJT+JQwSf7WmuKBxiP9sbvJwXOWYYeG63KTwYpPxa4cOw3o/7T/A1oNsmRziPfzsXaPlylfmulE1CSzK+cCWmCzr4UN6Wzqz9tay+NRuzgN7jXuYw/fS+xatU+KRCCAwU1vQICOop+HQuepqd3B/2UZlFJewnp3HNvy48yeFz6GG1PRP0bm1jrWlzOsgC1ZkT+tzbahgTZzC2UAEocJfkkYkhAb1Mr6KhVqX1w6ifMxWSP7uSsG3qOkr96MRS4vu4CGdvNCRbl4Hkeh18NqhKZ7aBppIrMLjJKNfU/bLJoyOOJse99ZoDnl5ThAvuAWqlXIn3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHMegOyc5KC6FzEYtcVAiM5rl9M+ifYbRtz7GxTXUQw=;
 b=3zZH4+GSpSTWnMpVwDsoHIBJDHMCoYn7BGtzmE/1Et0Ujb2CJ/JuKYFGijvekl+TChuu0s2UHuUBNpQjkKGe3HKr3nbPsxzhjhfQgEIDJm49hbJ7fX3+B8Nj3lcdE8tG8EBp5grdpKOHXam8M9IV8OrMw4l54ZTHNrhtMhnmkHicgI+7TXE01tiK8MEidn5lzXi3TefrNc/rmN8Ek4pqhFiyVj6kWz0OmCRGu8bx2cnicXock/TPXOOVzvxHu4AiZfdcEsYAvFDQ4JHPE0jahU/Tq6kH9HjPMDTx1ffreASFMCMSeg+6huOiwkvQ6HofSVcZ4vjCqV2LDQcMyWLAQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7600c39-b2da-f1e0-7f89-8546f69bafa7@suse.com>
Date: Thu, 9 Nov 2023 08:18:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
 <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
 <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com>
 <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
 <7c26fb70-6a8c-58a3-6a1d-300dd57b5827@suse.com>
In-Reply-To: <7c26fb70-6a8c-58a3-6a1d-300dd57b5827@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1ef480-a80e-410c-8f9b-08dbe0f41763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5BunTm7wikva4TENF+x2cMum3CTykQWjamfzolBfW00/YP/+f0sFTfhufr3cxgkGmQo5oml01YodWA630WG2vza6T9ev2LpDzGgQPN38CRf2TPbebJy1hb2LSQ13so5lTQ1VfbaRaNtmuU+K58j3e/IjZPMVVDSq+wN/wNuRlKh8NWwgqEixyHf8Q7tiYJw8ZwQzSpW5GEtsP95nKLyAYlT2h/octrtkH6bBcAXA3wZ3jQTtQ1Dlrn/QAhcsXUhcYd+8Ph8nG3HAB13kv0t8LRfrt3y6xJldGOODHhxAeFjtlYiEBr5IW7jlCGezujsS0O7o4PWxLFI1iR9RtuQiD7/TBL3WaDRwYDgYue5N8N/ujcy0ssJb7WJvDfRkvonWOboSbJawCI0H/opFI4j4TcnU4l0UnHmZYfblL+g62ZYvdDtSuciPQwydiazkUr2dT8n9WAvzv+xVwhpWV7UZ2VDAjjXl+TcsS8kHlHhs1Qa758uxkdfBTpDGoGuCLnh+5/PWrq5y1DaVjp0nBtj1yeV0jaCPFAhp5LUroS414x1jUqibHz80J8oNxwXqazmUWmJ5SjIE4C2VCbWkyNZcjzZrh0kAQmOAG7dvlIEmve6W4gcoRp0jVh/X6zoApN0X7EZQ03umG2e0mk/DbUwkxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6506007)(6512007)(53546011)(38100700002)(478600001)(2616005)(6486002)(6666004)(7416002)(83380400001)(26005)(316002)(4744005)(2906002)(66476007)(5660300002)(41300700001)(4326008)(66946007)(66556008)(54906003)(110136005)(8676002)(8936002)(36756003)(86362001)(31696002)(66899024)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enFVUGdtWUgreDQxbFl1Vi9oMk5qdGtjK1h3T0UxWE5UT2dxdUU5ZHU5Ulov?=
 =?utf-8?B?UWxvNkdCSUU4enp6ZUJ0Yk96S25iUlJoS1htUzlZblZYVHdMazQ4UmU5dDQy?=
 =?utf-8?B?M3pDSkdCUHJPR1VNSmFHOXdJS2FWWDZZTFNyUHc2ZEdKK2V6V2RaREtkUGVj?=
 =?utf-8?B?WEVkYUVneW1YNXZhOVJ3eWdxVUpCNDBSN2pvL2x3dEN2QUx2eFNjSXpseVpZ?=
 =?utf-8?B?M24zM29HVXdUMmJpeXhseWM4OC9rSjB4MU1WQUttUCswMGxWdFQ0SUU5Z1lv?=
 =?utf-8?B?Q3M4S1ZORVhqWHY0SHVVTGRIL3JJcVhrbFNIYUdsQ2liNUI4bnB6NTh0ZlVI?=
 =?utf-8?B?ZEQxcGNvVDkzQlgxL2RqaVJxRERDNXhkdmd2emZGeTNxTE1uZEI2TUQvRjRw?=
 =?utf-8?B?VzJ0eXIzWEVOZ3ZWei9lSDZMbmV1ak1ZaUxneXdGTGZ2NkhtazZBSGtsMW5l?=
 =?utf-8?B?bjNrY1doMnFNYzVRWi9pMXNzVEJkcm01TS9IRTBWRWRjcU1wOS9FTGRiTkdL?=
 =?utf-8?B?cGx1QkF3NXk0TGtBR1I4VTlVYXB4TkE0dnFrc0JyTnhkazlWZENNQ2dWa0Fl?=
 =?utf-8?B?NEFOeXU3U3ZCaEZKaDhmUmFVNGNieEE0alBqTXB0OU9qeExHSWZra1NtbTFx?=
 =?utf-8?B?a0NXejV2MGg2R1VybjUyeDZISFVLd3RkbHpWTWJrazZ4ZkJVaWNPREFMcFMy?=
 =?utf-8?B?MzkzZW45cHpvZ0ZFRHpMUTdXNk4yc2svOEtScGF4WVRBaUIrQ25IQzZCUVRR?=
 =?utf-8?B?YkZDMUg5bmtRK1lmTDRyS3JTaE5XNXBNcjdyQzhQM2NtMTd0L3cvcHV3L29k?=
 =?utf-8?B?M2VPaFFtVHkwOHVMU2Q3Z29OSmtWb1VYc0hrdWplOWFpVGF0MmZCdDlQd2J4?=
 =?utf-8?B?OFJqcGVucmYzZFE1TUtVbDRSeDRaS0NwRGdhVGEwQUJ0YkhMVXJ5Vy9pK0ty?=
 =?utf-8?B?eERXRy9LNXBSSkEvUEh3aEtqcUdLeUhnV3JkbkQ2dmwxYkdqaTdNeTJyMGYw?=
 =?utf-8?B?T0dSWWxjdjlnbVlNbGtDa2tMTzg0RG9TZ2srZjZ5Q1F5Zi95Mk5aZWNKd0VE?=
 =?utf-8?B?MXp2M1pSQXBoczFHZ1RObGl4bldvdmVBa2kzbVczS0M0QWFweXhJenlFMit5?=
 =?utf-8?B?aU1wdWNzZ1V2QVkxUXU2aGlnOHpqdVd1Y0NRTVpqMGFkTFN1Q09KMjI5dXhL?=
 =?utf-8?B?OXVZMnRHTFNXZU9naG14ZWY5WEFYQkZ0SGJwUXd3UUZhbEoxOTJDKzF4b1FI?=
 =?utf-8?B?K0JmQ2hBSm5DN2oydVpjcW1oTlJLREpkZDZGam9pL0xyc1U5U1pGTE1NTmFo?=
 =?utf-8?B?eS82a1NsQ0RqRjVGb1JWYUc4SjNCdnRmWG8wUC9JUnB1M0tON25EVFIvc0Ir?=
 =?utf-8?B?aE5aZXNkK3A1eUpLbU5uSGRqSFlFVXNiMzBOSFROci83RTNrNjNiYnVnTE10?=
 =?utf-8?B?aEdvVmpmakgvbWdiYmNZdy9mMjdFeHhmb1RUek1XRGtGS1krZitKQUU5UWRv?=
 =?utf-8?B?WFpYNGdQV1R3WE00RVg0RGhZTnZvTk1aOUhCb1l2SnF5TlRZM1BDd3Rab21p?=
 =?utf-8?B?L24xZDAyQTZnb0JOeU9kOVEzTXRhVGRpZEhzSGtWVU9acWVhbXhPRVAwQmVQ?=
 =?utf-8?B?dTFleUtFd0Zuc3NtZXg0Z0dTc040VjcxTityT1ZQM1o4d1JzdzJvM1VCVEFn?=
 =?utf-8?B?OVUyTVZ0dWFZTHFOUlNEaFBKakdXcFYxQy9OVXdnUVpRRHpoTnNheDZsdUpP?=
 =?utf-8?B?Y1Z6K0hjVVE5NXpxSHFvWEVEOCtKbE1XWTAwTkp0Z2FvUDVmTXlMcndxY2li?=
 =?utf-8?B?SkQ5V0cxUmpVdW5sc3VrcWVtWkQzZlplRXNqaVljbVFXRWp3VG5rWWZmaE1L?=
 =?utf-8?B?UjJNbkVJTk5vME9iZFkrQkxPUEV0bFcyUEM0Q1FZSkdaTnJndXMyR2FvTjBQ?=
 =?utf-8?B?eDk0eGJKRnUxd0ZHSElPT1dMUVVPWVh4YklOYWJCdEtvK2FjSmFtSlltUUNR?=
 =?utf-8?B?L3dMWU5DcXNDU2tpaXRSQUN4cVdQUVRXaDlEdHVOVEt6dEExVURWOHIzQ0tT?=
 =?utf-8?B?TStZazhsWW1iZTRoZVI1K1R0cWloczZmRkoyVEhhdUc5SzVCVW5xWHpFTUUv?=
 =?utf-8?Q?2kF1EUXnhw/tOdmy8HxE1JFPL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1ef480-a80e-410c-8f9b-08dbe0f41763
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 07:18:37.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVCrGPzUVix6jBlHq4EiXHpstdxWaOZx9wZpD7yXThfEN1ilrPMkGAj4fgRHgGZnIswXdehdQx/bHQK801/0Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8752

On 31.10.2023 08:43, Jan Beulich wrote:
> What I would consider scope creep I
> specifically didn't even ask for: I'd like this macro to be overridable
> by an arch. Specifically (see my earlier naming hint) I'd like to use
> x86's BMI insn BLSI in the context of "x86: allow Kconfig control over
> psABI level", when ABI v2 or higher is in use.

Actually I need to withdraw that. It meanwhile occurred to me that the
compiler ought to recognize this pattern. And indeed gcc doesn't even
have a builtin for it; its BMI intrinsic for BLSI (on x86 that is)
specifically expands to x & -x, which the backend then is expected to
deal with as appropriate. And indeed it can be observed to, with my
"x86: allow Kconfig control over psABI level" in place.

Just as a reminder: I'd still like to see the further renaming done
(to ISOLATE_LSB()). If I was to commit this patch, I'd be fine doing
so while committing.

Jan

