Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CFD6CC252
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 16:42:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515907.799253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAWT-0004Xn-W2; Tue, 28 Mar 2023 14:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515907.799253; Tue, 28 Mar 2023 14:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phAWT-0004Ul-S0; Tue, 28 Mar 2023 14:42:05 +0000
Received: by outflank-mailman (input) for mailman id 515907;
 Tue, 28 Mar 2023 14:42:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phAWS-0004UZ-KY
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 14:42:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b37c555c-cd76-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 16:42:02 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB9PR04MB9627.eurprd04.prod.outlook.com (2603:10a6:10:30a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 14:41:59 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 14:41:58 +0000
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
X-Inumbo-ID: b37c555c-cd76-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsQe9cgAiFWBkltW0ArSrCeSy7ezFfR3AkCIRRfr5UaSwEqrdv8+BAA9RFpgqLsnFZYG3CY0Iv+/buBBuPQNF3u8iX0pdVWc7c18bZ4MiaNdVLD5OacO3uwgG4Xt/8yww3bOLqa9x6Exdlv38fX5Q8fMbT+FG/f7PzdYaN2nSKOf0U3M+eu3wQ+ocWcJ+y8Kqraz6v1lY5B6doWoTN0Py48Yh6dPM0XKuFqqL0J95U3X7HBpyqU/pJ1MfSbmBuLdFOUXLdTa9H/u1Ddtq4nPiQ1bs+izBEUuXToJMQXcmFluXdcIb8DOrPlwCjX/kljhKGGrB6oyGY9A8Jb/e5GN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAFdX3Edbtm0Ueq/5t5W9p3vGsbOHCXBspS0C5+tT3c=;
 b=FO6L3Q4b/Yeu/iRTsepDFdtOHvUrkMLyae7zZPvheyBc6B8vnXL1j9crnpVqJMxus2iHRs3B/a9zddir/1aEUZG0NkSLQNBlGswf1p61C004v+Fzg+3OmpwOi+IzQ4vSh5v7BnGl0dd/C7ycXdc8BsTb7eZAFa2P3sbNM234iaqXJSHfWLZVuvSo2uSbrR1fJuu+WVw1R3e4G9HADWcfq2a3ryks648Lu3nlASBj3wZjUXjZZcJKYvCynNMketGEGVHEDMgq/NAhxU9EpaGxZpJ7opeGL8aAasg0FdfS5oEsg6LLiTZZdXBHKOZ9SACPUcjcyrwmGqtBR+CePUMyYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAFdX3Edbtm0Ueq/5t5W9p3vGsbOHCXBspS0C5+tT3c=;
 b=wf/D7NaefolXtFBaUDmKujsbSlqeqhsr7VZnO68kkv8wUojPYl09BZ0wEXnTTRfSh+N27IzK/peA/m+giiVtGAOlExPDCMh7wnGBrnUS+i6Axgyd6OchGVeWngeE7ZS0f+P2rpZhvdeY1qY+NDZkXPXnfMUOFzTDjJePiYBJPSfSmr4kncl8v1KayU9j3beUNULCDRzDocGfHA/kIRkhNSgFfW3G0PkOIfuWGBEtr+Kvsd0XckXXjqKF5gCSvRsOCmO+m2Eilwjg9L+bm0XIbihuIDye3RRWLLEXVWFlX8iROLFBGMWEFnG0dtBhBnkuXt1H9OuHdQWFNI7Tl6lDcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b285e38a-8a9b-dd59-3b24-dccc5236b1ec@suse.com>
Date: Tue, 28 Mar 2023 16:41:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/16] x86/shadow: drop is_hvm_...() where easily possible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <5944a3ea-cddf-7ddb-d167-a0a0aa9b4967@suse.com>
 <97c3fe74-89f3-fd26-f8bf-69113df1dc12@citrix.com>
 <2f148fc2-04c4-5411-2931-8dde4ed9bc97@suse.com>
 <68c0196a-966e-8d87-52ae-367b3c05d107@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <68c0196a-966e-8d87-52ae-367b3c05d107@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DB9PR04MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: c5bfb9d3-95a7-48aa-979c-08db2f9a95c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fvA4fiiplh3kF/2zFfn0yPTUgULey3PuF7B13PTprvmH6D4TRuFLimAwgLAPJjAaCM+mHHm8bGJ+IcY8bnrS4fbpOrUCi+In1gqim80vrJgyRmFvIccx37dIsbH9BdmqUM9Z4nzOSFHsCKPUnF86TALH8tJiCBjxBvDvCZZZqMH8z7OlSMMdY8Wy2JQmpl+kth4hiHFXjkYf6HgDNY/Jfwuw9CXr461c/gwWT8SqKTZQrj6JFVKlkGLwndVme2thaLHLuL75RQkVtX6Iou3wuHkJZLxC6Mj01VCcvU43oNfw61bFxqNyjwad+Unv35OaJD3jQnoDoSVDDYtrXAHVA0/WWAvxQ9l1chnxUzD1dXesqezFSLq/BTyc+XFMQw2yBGCeZOQkRNk19tto8p4rvXx2ZWJ3VI8k3qkvoLusF3GnP6etOHwp99yeei92629whvLwEbdzMvjh/PqIr0nQ4Pl7SjjfbDR3Oyfoky14cS07v4EFVq7MmH86N+yXL69vO0CnBLrc9QzWZsZBKLYLoCeLsCdIVzqIs8Sy+DiCGxpCNO3lRLnxddSvroplnicBEdGLUEfXsqe50YhI5BKAM+N9lB+GUWf/55YS0nZlqgJFJTidZmk805C3SJA06awCkKSrxRO96IebIUJD3PSJqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199021)(6486002)(31686004)(6506007)(41300700001)(186003)(4326008)(5660300002)(8936002)(53546011)(26005)(6512007)(478600001)(2616005)(66556008)(66476007)(66946007)(6916009)(54906003)(83380400001)(8676002)(316002)(2906002)(38100700002)(31696002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjhHZStlaSs2ak15ZDVIb2lYV2Y4bEtJcXJRWTEyMGxwdmdiRUM5RGplY3VR?=
 =?utf-8?B?SlkydS95TkE3b1ZRc0M0T1p0M1M4QVBOQmt2STZJUUw0aUlEd0xac0ZmNWR1?=
 =?utf-8?B?QWZhUGdidnVQblJrN0thZ1QyWU9RR0NJSUsyWURQVjRmcUxxb1VJMlVBZHdx?=
 =?utf-8?B?d0lHRW5NdHB3YnJqcWtnR3EvcnVXRW1nazZnS1dON1JXcHBoejBUWjV4ZFhT?=
 =?utf-8?B?WUxtZVhPSkwzUEtaaXF3T0VPY1Niajh6c1h0VTY5Z1VhU2VraFlDK2gzOTVC?=
 =?utf-8?B?VWpvL1lCOWdkZDUxWjZuTGZId3JYQmZZME4zK2RzeENnM1NhWXZuaitQTUNi?=
 =?utf-8?B?WjNUYm9YWTd4WElXOGY4TEJ0bmtUWjhzK1RzbEZOZnMydndNUExLMmk4Rktt?=
 =?utf-8?B?TWQyWTR5RkI5MDFWbk0vTnM0RU9JaURlQjlEQXBSbGlkdmg5aEI3WVZ0T0Yr?=
 =?utf-8?B?SnFQc29BS2ROL0NJUXNyVFQvOFZLWGo4Y0lyTWJJRGlMdGUwVUVxb3REU1o0?=
 =?utf-8?B?ekwyUkZELzlWdXUrSlFzSndMWm85YUJTdUNXT2pMYlhCTXNWb1psd2ptRSta?=
 =?utf-8?B?YlJmcHVQS2ZpUndWOXlMelV3MEFaUER4dGZtclNvTFgvUFpIUGZQMWhxTnU4?=
 =?utf-8?B?S1RFVHg5MXdCN3ZxQzFhVVBJaVgwRUk1T1ZleVB5ZW83OFVWejVFRlJuR0lS?=
 =?utf-8?B?SHhxV2ZnSFZXc2RoQmxweGF6OHNwVmUyTjMreGE0cWtINHlJWnFjaTlLTDFU?=
 =?utf-8?B?c2dGbC9yOVo4M2tBaHBQYWd0RE1DWXhiajhXZEsyRVBpUDFiWjZ2NGZqbFRE?=
 =?utf-8?B?WDEvTVBCNXFOcUgrMURlWkZDa0lZVlowSCtueExLclRORlMwTEc4cGlxUkgw?=
 =?utf-8?B?cFpxTFhOeEd6M3hVV2VkNjZKTGYwMk1zMHZybWhjbTVTbUszMjZxYTlHTTA5?=
 =?utf-8?B?VWcvK1pqM0xsYjhtN0FVRlFWc2k2OUxiczBLa2hxKzUvc2ZTRW5tRE1qMVNP?=
 =?utf-8?B?YithUDd5WU1QcEhmczVMcytHcThreTdBNzk0TWJCVmJZRlozcVdIYnEyWFdI?=
 =?utf-8?B?Sm9MNXl3YTB3NC9qckFvalExSTNONXAzdWczRmVVMnNFNVdpVVBSSE5Pa0pM?=
 =?utf-8?B?WHl4VXc1eFVBbHB3emxpSk52b0hGVnMwbzFFMEFjbzN1b3dLckc3Zm1rWUZP?=
 =?utf-8?B?bGVIS0NRTU1GbjV0M3ZzTk82b1JKRmdxS0NnZytTclVZSithRFhzd1VudTZk?=
 =?utf-8?B?NkdpRjU0Smk2R0lVMW1WWmVXVzdPZVhNenIwVEdBS3lNTmNZYnpocm9ESnJa?=
 =?utf-8?B?d00wNW16OThRcjd5VzZTY2Q3OS8wd1FHbGxaSGVVTE9HRFl1d3NEdzFZTzNQ?=
 =?utf-8?B?d1dQTU9TOFVPcHFaZEdRZnRHdk5VbkNzRS9iR1Zpd1VYcDNCNXI0a2QyTlB1?=
 =?utf-8?B?NWhRTEdqdC9ZSVZiSGNDWVFOOG1XNU1odkpKM2JON1h6bllET0VoejIvQTJ4?=
 =?utf-8?B?aC9uTTdQSjVJQWJQYW5pWkFqdmhCS0ptS2FQaUZuUUszdEpTdWpGb3VaM1Z1?=
 =?utf-8?B?MFJ0Y29vMWVSK2RReFRGalZCY2JvS3BkdHZVYm9EUks5QXRIb05na3QxdStE?=
 =?utf-8?B?SW9seVNQZW5IVXVDYzBDTTVORFNvdHBhQmFCZW9QSDluTWxzc0hhdk00bzV0?=
 =?utf-8?B?eW55LzFzenFnSWFialVZOEFhZWJUeVlBTjJ0emhiMVRZbERnaWpIMnIxSkpK?=
 =?utf-8?B?VXlSOFhTenVzUUFtUFBnejNZREdwREVEUXkxQUR0OXBTVWV6SnNlbmtUd0lY?=
 =?utf-8?B?cGFkZklFOXVRd0V4UVpCV1NWM0wrMVFFWjlKdzdXVURrYU1UUExZMTlieUZ1?=
 =?utf-8?B?RWFjNnlkeFB0TjZZNHVLNVlmc25mUzVEVzRKM1lDR1pPWERrNmNyVXdmV2pq?=
 =?utf-8?B?OHJldWFrZzNyc0lsZ2szWnd2S2xST2JaL2VGRi9jT3QzTUdtOUE3bjRQZ1lD?=
 =?utf-8?B?RWdGY21EVTlvWHJPZnlqL3hzNUtEMTArYnFNenEvemhlbFBiSTdCUElVK01B?=
 =?utf-8?B?TndIc0h3TEQwS3l1MWVyRG1QS1NRMFZwV0tHcFEwVitJRnRJMDlQZWJkbFJi?=
 =?utf-8?Q?n2C+OXvvnVZw0GATLAUyWtbxS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bfb9d3-95a7-48aa-979c-08db2f9a95c5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 14:41:58.8794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvVbkn7oTrysIOvwtNKFJMXdJeaN1y2hLPNt0+FidW2Vg6K+dSnQSUhhhwkoeY8Rd6ohfZY7c08pjX80IFVhww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9627

On 28.03.2023 15:57, Andrew Cooper wrote:
> On 24/03/2023 7:38 am, Jan Beulich wrote:
>> On 23.03.2023 19:18, Andrew Cooper wrote:
>>> On 22/03/2023 9:35 am, Jan Beulich wrote:
>>>> Emulation related functions are involved in HVM handling only, and in
>>>> some cases they even invoke such checks after having already done things
>>>> which are valid for HVM domains only. OOS active also implies HVM. In
>>>> sh_remove_all_mappings() one of the two checks is redundant with an
>>>> earlier paging_mode_external() one (the other, however, needs to stay).
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/arch/x86/mm/shadow/common.c
>>>> +++ b/xen/arch/x86/mm/shadow/common.c
>>>> @@ -1522,7 +1522,7 @@ int sh_remove_all_mappings(struct domain
>>>>                 && (page->count_info & PGC_count_mask) <= 3
>>>>                 && ((page->u.inuse.type_info & PGT_count_mask)
>>>>                     == (is_special_page(page) ||
>>>> -                       (is_hvm_domain(d) && is_ioreq_server_page(d, page))))) )
>>>> +                       is_ioreq_server_page(d, page)))) )
>>>>              printk(XENLOG_G_ERR "can't find all mappings of mfn %"PRI_mfn
>>>>                     " (gfn %"PRI_gfn"): c=%lx t=%lx s=%d i=%d\n",
>>>>                     mfn_x(gmfn), gfn_x(gfn),
>>> Out of context here needs an equivalent adjustment.
>> I'm afraid I don't seen any further is_hvm_*() in this function.
> 
> Final parameter to the printk(), calculating the i=%d diagnostic.

That one. This needs to stay, as calling is_ioreq_server_page() isn't
safe for PV domains. ioreq_domain_init(), which initializes the involved
spinlock, is called only for HVM domains. This is why I'm insisting ...

>>> But in this case, I'm not sure the commit message covers the relevant
>>> details.  ioreq servers have been made fully common since this code was
>>> written, and *that* is a better reason for dropping the predicates IMO
>>> than the redundancy with paging_mode_external().
>> How does "fully common" matter? It's still a HVM-only thing,
> 
> ioreq server info used to be in d->arch.hvm.ioreq.
> 
> The is_hvm_domain() was guarding against speculative type confusion in
> the HVM union, and should have been removed by the ARM work that made it
> common.
> 
> This isn't really related to the outer paging_mode_external().

... that the dropping that I can safely do here is solely because of
the earlier paging_mode_external(). This is irrespective to what the
check may (also) have been used for before.

>>>> --- a/xen/arch/x86/mm/shadow/oos.c
>>>> +++ b/xen/arch/x86/mm/shadow/oos.c
>>>> @@ -577,7 +577,6 @@ int sh_unsync(struct vcpu *v, mfn_t gmfn
>>>>      if ( pg->shadow_flags &
>>>>           ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)
>>>>           || sh_page_has_multiple_shadows(pg)
>>>> -         || !is_hvm_vcpu(v)
>>>>           || !v->domain->arch.paging.shadow.oos_active )
>>> This is reachable for PV guests as far as I can see.  What am I missing ?
>> Well, the footnote in patch 1 ("x86/shadow: fix and improve
>> sh_page_has_multiple_shadows()") kind of explains this wrt the safety
>> of the sh_page_has_multiple_shadows() use here: Since PV guests can't
>> have OOS pages, there's no way SHF_out_of_sync could be set.
> 
> Hmm, I suppose.  We enter sh_unsync() directly from a demand write, but
> it is only meaningful when OOS is active to begin with.
> 
> Although having looked through this, there ought to be an early exit for
> oos_active even ahead of the SHADOW_PRINTK(), and the single caller of
> this function doesn't check the return value.  (This appears to be a
> common theme...)

Well, of course there's much more cleanup left than done by this series.

Jan

