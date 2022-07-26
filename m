Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9685580BAF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 08:30:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375056.607338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGE4n-0007Cr-Eh; Tue, 26 Jul 2022 06:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375056.607338; Tue, 26 Jul 2022 06:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGE4n-0007Ae-Ag; Tue, 26 Jul 2022 06:29:53 +0000
Received: by outflank-mailman (input) for mailman id 375056;
 Tue, 26 Jul 2022 06:29:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGE4m-0007AY-9t
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 06:29:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a7cb5d4-0cac-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 08:29:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8155.eurprd04.prod.outlook.com (2603:10a6:10:24d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 06:29:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 06:29:48 +0000
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
X-Inumbo-ID: 5a7cb5d4-0cac-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLtSwTEaJMIGiN9gvNH+ExBgV67FD4+msqFm1xvFKTAoPoGavekLKu1NtTdcWHODm1HLrWNOtUL44DKgqe+mVMApjHgIYpsxQD0GcSlnXSllR/Z/TAV78t5FWeECwY6kNjFIXrFcmN2vw2d43YV6l7K1MoAPsXGFk1j27OviDxn+JXOYUOYZSJUK0dP6uUHc3EFoW94EyBqhngPrrbqzxgfs2vZK+SGEqYWrF9Puj1lgL3PszC75ZkhgTVkq5jhFjpcM9V1smSiCx325U45M6+r1S4gikN7WO5oAglpBOyaap0C+vSzggMrzIP+qtQyJRCfwm34NBapu+CvIH5kVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=st+k8Ys+XWdrzUrpeNQQuwR2aWpv5futUnkxzwVhjNo=;
 b=cm3c+MU3Lpzai/gJjeIyJCTsF85Xx5FNkuLTMWuZIMBoWp//+9Rz3Yho2p20sRSyLFj/Vg/WjQpcnqTjW7eHbhZXB4Zlbi2efHPfd4N8Mfb8s8EUrr3w5twBdyUNbhG7WA7hjdXDS4G5Ii0HiFDyakbEggu8vB9JrAc7sEGF+QVklH+5Yp3YapRR2DQSV5Zi+5D+2ahzubyifMHusbOs3iGu5Qg3R3d9URUe6kNT2Tu9+NKj8F4t4UT3OBAKgA+eGA8h8HMk7gW90p2E9zICU5wGz2moikHguism2tUBUOq2fbmCu2GgpBBdSCP+Qs5JL5e1VuKqLhj7g9ssKZ/lWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=st+k8Ys+XWdrzUrpeNQQuwR2aWpv5futUnkxzwVhjNo=;
 b=UjRsERtUBDyFjvQ3Pl6vLXqDXILDSPdueLrEdRd0XVDYyXd+tqS7SP0J8WQGTh7Fb4jPC4BW1ShXDVfDnFPK2PO5+ZlUAq0E6gmmv8dtfoVcmttHUZ5noHUdJ6BoxE47/jytoZq0B/MIxozWM7a2HmW+hIpjA02YQzCpQPUeR5ZrcnuIRf7jdA4+gT2244Bys6CKgBAkW7+18ZMuFsOr312hcCiRAAiBroxtnhfUbud1ZPsgXsvErH9cDU2+zK14ATxeFsRitRhztG+t/tp6yLwcz2qJDc56IOU9rc1e0afAzt7STyOEP9SnFKOpAx//kljh6XljbzI6sqUBYWMVjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4f1ee8c-d83f-d56f-e72e-d1e0fd4b2228@suse.com>
Date: Tue, 26 Jul 2022 08:29:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86/pv: Inject #GP for implicit grant unmaps
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220725175013.893-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220725175013.893-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1c3bf99-2c81-43f6-86f3-08da6ed03cf6
X-MS-TrafficTypeDiagnostic: DB9PR04MB8155:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	637kRxPOVJIktwixI6sxTeXo7d6RJl0J6kEZ3lWesLLV+dhh/oNMNEivzP6mEwkMCbO8MOlTbrSyeez4QbFlLVhZ2HdPGy6Y9eMaD+dME7QRkzH61jsh+KbldiJmxE9dFPgE1jfRFXMcJ28RKeFImFzRgOdipr5abZqyPtNMt/0Y2osnrirmNGgkjh3LWTInLuHCJCOZhq7ij9ZC/SnyvK1KarlAIQWaYTLK1ORWHydi7PacgWJWPPt+ZE4a94B0FQ6XC8WV15Xyedh/xLYh3HqTwNr09tHh7YWVKvGQYV4ILgwWAFNmMLVokaHyOuCpkIsOEtAvnadAWozkRAcmc+zajrq9+3jvRu8Lpj5ibbdqXSwjBW9R1h+HT+XC9CwzPm/1wEXBSOM9ceMFr0bVmfok9iZvGXcQk3wPgaZOGRkCRDBgKwL8ZOqQsRBhUDvpQKvZSccwFwyeZ04qkv+Jpt+2UbzJYJo6quB5SSGVBqpoeKF3YlpnIMQDy6aHcog82VxKfPiiTYrwXRXgd0m3uYoOmt9kDmFA4U5qiL1lFZBzkTNzM6w1FeI252V9TocBJnrz1Mvu5MebY03mP/9BNghdUPBUgcbhL+voI0Uqe5BqXKrs+TcayjBNYLJdlGmR+WYTO9l/Lr/xkkOc8xSNCNXNHaGCjxcoxVkyN3TeYImDMDIqS84EeDw2o2CG1LbIFIA/NcFXIO/7VkxpqpCN1CHetBb7Qc37RZryxo5D1reI+IyxU/Kf7cgHyFQlN6L6yk3d6EA+rbQPoDsea1Xn6qIJFbxfPjg+Ck0Yyajm+JnKBG2u2quTKELfRWAk3NyJkrmSfNxdMwTNYW/qRN279Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(136003)(39860400002)(366004)(6506007)(4326008)(8676002)(66556008)(66946007)(66476007)(31696002)(2906002)(41300700001)(86362001)(5660300002)(26005)(478600001)(8936002)(6512007)(6486002)(53546011)(83380400001)(31686004)(316002)(36756003)(2616005)(6916009)(54906003)(186003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnFQa3hTbGxUcU1oWStwKzgxNCthcUwzZG50NklIUzVHRHQ1MEZIUjl6QWor?=
 =?utf-8?B?N203SFVLMnZQTEpta1B5Ylk2NHhWelJLVzN2TjZvT1FRZlpDL1VQS05mQkxi?=
 =?utf-8?B?a3VWVGFZZ0lpeWpKOFo5dVhLS01TQkVobTdwRENhRG13ZU5QRG0vZzdycE8y?=
 =?utf-8?B?R004ajBWdnRQWGFyTlZ2a3Zud0RyZ2w0MlJXVzJqZEpGV2dxbWNQNm9pMHM5?=
 =?utf-8?B?REtCZlQ5RWs1dlZxc2NGRUtaZFJ1MzIrWFpQMUZSVks2Z1RkT2JwbGh3UjBm?=
 =?utf-8?B?MHRaMHpidW5iVEc1N1ZPTVNERjQxSHk2bjArZHA4cVA1c0VqbElYMjUvcXdk?=
 =?utf-8?B?eFN2UjJwSWxWWnVxcTYveWd3QkpNaWRSYitoVVRJRlpySjU0RGZwbFZuYlRE?=
 =?utf-8?B?V0JmcEwrQXlTdGtVOTN4VU1YMEdtQy83NEVENUZIS2JJTW45dUEyeWVza2c1?=
 =?utf-8?B?eUowSG1CUUN0WjJxVFU1ODVNNkN1UWVZVnY1YU00ZEJycXZxY1NCM3R3OWhr?=
 =?utf-8?B?dFptMzBZZXZYakd1Z1JlWjNHRHpZU2FZZThPMVJJMWlWZEh6VWtIeXRtVjA0?=
 =?utf-8?B?WERpNTFCY2UwelBFYUhOYzNwVVloT085Vk5abzUyZUlydlBPZXdlZk02VGU1?=
 =?utf-8?B?Umg3bUs3VnRUSTliWkZ0MFB1WDNDUi9qOXRSQUVkN2tYRWNyRGN5K1lmZ3Vs?=
 =?utf-8?B?QjBYbjdjSHZobkt5RUtUMW1MeTRKVXJKR3JCMFQ4T1hFOHpEbWhUcDFXOXEz?=
 =?utf-8?B?VVBpM3ppdzR0VjRJL25USEd0aHJxcFJVV2JBOHdsOW9hNTFDUU5IUk9pZVNZ?=
 =?utf-8?B?dnFnTzhEVFpMWDFNeFY1UUphb2I1ZjBzNVFTRExWWk05aWR0R2Z1VUlpQmZx?=
 =?utf-8?B?QXhUKzNRSUM2eUdiaWRHK0tYYkxqSm12aEt5Y2ttazN3TEhMclhqSUNyUmF4?=
 =?utf-8?B?QVVJYmtmTGNwcGRFS3Z2V1M5YnNWc05xNUJqUVRKa1JrS1g3M3NJWnZyeHBj?=
 =?utf-8?B?c0NWZEtiY2Y4MlB3VmFqQk5GUnYzcCtRbEIrOE5VdkRIaDhLRWxJMHBFNUFT?=
 =?utf-8?B?ZnEwVysyOVpLSFNsK29WdDA2dmpDQzFvSjBUczAwUVhyQm92VTF4YkVZaDlF?=
 =?utf-8?B?MXB5NHZaT0N1bDFabDlOSnNpUG9tZ2JGQWQ1ZTBacHhKWEo4TTVFdTArcW01?=
 =?utf-8?B?bU91VEFoS0lFSDloY1VsRTdTTkdzeHVXbGREdElLREFQbUtNc1d4OW1WNFJT?=
 =?utf-8?B?VkxhdGpEUkM5SU12Qml1WjMyMS9QZGJ4QXlkaFpqb00yOWdmZlhRVDFmVndZ?=
 =?utf-8?B?NzE0OXdQaVhnN2wrbHJXTjZMVmdMcU1yTGlhdkg3eFYvL2hkZUFPcCtSTWdI?=
 =?utf-8?B?T2gvNkFIL1NORUQvTkdrV0Q5NzFNTnlpQk9FcmNDWEZYcFRrSExkQVhKeTRX?=
 =?utf-8?B?TFdsS1VXbWpQQjV4RnVwNjJZZ0F2WElLc244R3FQNXlzd0JJV3FyblVVMDNu?=
 =?utf-8?B?NURJRnIvMWcvUFFIcE9QNDNTS2hXeFdJdmdIalVETjdWamZnL1FtYjM3a1I5?=
 =?utf-8?B?d3lsaDhDeEg1bEVDY05KcTdqaWdIYTFqVWRvMGlNUlBiQlNTQUNiZmtQMVNF?=
 =?utf-8?B?cGIybTN6NmJwN3pxNUZkbElYUUpwZ0F2TlB6WFVsQ1RpdWcvMUFwMXNQM1JQ?=
 =?utf-8?B?a1BSVmpwNlBFaVIyZEp3VmpUSk5pVnNNUXFkbkxqcUdOb05meHNlK0EwZE1T?=
 =?utf-8?B?c0lNZmlKbzNTOThMbkZKTXU2bWtYQ1hDeFBSdTFqandtNG5PQVVyV3FSbVNF?=
 =?utf-8?B?Z3FvejMxZDhUZThka3VEZWpnQ1dNbHJDL3pwaVNVWFBwMDNrbGplOGtMTnEz?=
 =?utf-8?B?bUNFS0JBQmR3RVRvL3FXVUxXVEdwMlhiMzM4RVN3cURHVmUvMGFDRHBTZ3dn?=
 =?utf-8?B?UWRWRTlGelBCQkRFelVJb0JueFJzdDJFd0tOTXZ1Zm0xelZNMlg3QURxTVlF?=
 =?utf-8?B?OXFweUNCR0hTQWkrYnlidjhUUUdibGp1akFwZUlrN0hQeERRa0FUcG44cGhr?=
 =?utf-8?B?R21GMzQwZ0txVGY1MFF4R1puOE5NUVdDR1ZibzFMMG5rR3phcU43UDVmVXlz?=
 =?utf-8?Q?tWla5qp/6jWhWGtZX6k7OR09x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c3bf99-2c81-43f6-86f3-08da6ed03cf6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 06:29:48.2638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GzgYAdq/UZuub893Mok8b/TgJY7wHsblHri4jvDZFiodGzx94mJpsfZb1qukwYdcZ1bvVYiXRUoRQWWfdMOBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8155

On 25.07.2022 19:50, Andrew Cooper wrote:
> This is a debug behaviour to identify buggy kernels.  Crashing the domain is
> the most unhelpful thing to do, because it discards the relevant context.
> 
> Instead, inject #GP[0] like other permission errors in x86.  In particular,
> this lets the kernel provide a backtrace that's actually helpful to a
> developer trying to figure out what's going wrong.
> 
> As a bugfix, this always injects #GP[0] to current, not l1e_owner.  It is not
> l1e_owner's fault if dom0 using superpowers triggers an implicit unmap.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit preferably with ...

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1232,7 +1232,7 @@ void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner)
>          gdprintk(XENLOG_WARNING,
>                   "Attempt to implicitly unmap a granted PTE %" PRIpte "\n",
>                   l1e_get_intpte(l1e));
> -        domain_crash(l1e_owner);
> +        pv_inject_hw_exception(TRAP_gp_fault, 0);
>      }
>  #endif

... the gdprintk() adjusted to also log l1e_owner.

Jan

