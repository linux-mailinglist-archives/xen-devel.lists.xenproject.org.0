Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5117769DEC4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 12:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498788.769706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQnT-0006o3-GT; Tue, 21 Feb 2023 11:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498788.769706; Tue, 21 Feb 2023 11:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUQnT-0006m1-D3; Tue, 21 Feb 2023 11:26:59 +0000
Received: by outflank-mailman (input) for mailman id 498788;
 Tue, 21 Feb 2023 11:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUQnS-0006lv-HT
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 11:26:58 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6683a15-b1da-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 12:26:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7122.eurprd04.prod.outlook.com (2603:10a6:208:19c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 11:26:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 11:26:55 +0000
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
X-Inumbo-ID: a6683a15-b1da-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNqERMhBMgyPFQyWrMcMQ9yUq809ZciMukTmFWafXtB4lecb0Pq/Yxp07kudmGIJmro/ud30qx/1eClrdACIFrE2X8MrnjFTrlVM/fQathebFD1q9IlFZr/yvVsotJ8IuGlRLIkzRnjh+at7oF9y2xHITqnFCy80ul+7E35OvkTJCVW1m20mi5hfCUMTA92D91UTJCtBsg9rcHrjs1GRjR2sJJwIVkkoqQU7W9JFED8WD6TPL/xRiNjoHf2SW+IzPbojl4X5hYLVzUF1k41FZQj/OvakHZgfb7f8+uFW0/oY55XoiL8PMMAhGC/kOi+SvEZbnuPEZbEjBu9bIKNlvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0F67tXSTHNqaUTkh/QGVMf9NcUn1Xf9/Wcd+ZhxdqeA=;
 b=Gdm/lYWh4QmEhxYxQGBxDOZofKkH2XcaEa+xNNhNNDa1MmPCLwkNAvOl1uNPVWYZcVoajSE5YkgtIcLv4LxpOT08+XduF3ZKjC2b35K9heyX3bsGRQapoSnVbI9niF/a0IOzlmQVnO8wBGpfNYujtieco7aJG/6tdgCUsJmqUDR5pBu9HneZ7f4Kyg+LD6gSrXEXHBkc5Klg5kFKuTfh5YEjLWdkNBQC6/RBp7BHZSHDVsStRIJp3i0euloLTw6YEBqeRZ1CI8AVOHfTflWQCI1LbqU24z4l0U5fDbBhCu6pjoO+GMUx26SLgYiZ+6yWQMClSWWAGqH5k8ln0zqyqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0F67tXSTHNqaUTkh/QGVMf9NcUn1Xf9/Wcd+ZhxdqeA=;
 b=lYMzfo1Ke+CI/dp9Le1gyBwN4eiB7KgkgiuNvI7pHjcurDzesMheFpAZT0koLwPYNlQBBDFapDyJ9B5oEUMZj/v7hTEjJ+xV0PVwKjVwz2RezFS56grlK4sbFhvyklNsPtSo3LMxhlqVoaTmtOQbzL+XN9sWR8S8DDLN3u3Ij7YCiVR+YldSlvatrKL1MgxAw8Vmo56scq1slA5okCnelue+FsKsbajaPfsl31x6nLlmRr5ebXEDtqQ6SCS+RaQBOzSrU6v8WX/RlE+2CuYRzIm8CSNdTQgoXwjoUc7CMmUN6GPOW4BFRMlXkU2RFgKgYKWw2TwY/n+CjdF5MKXYqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3477e48c-e6bc-af9d-65a9-c6c0556318ad@suse.com>
Date: Tue, 21 Feb 2023 12:26:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] x86/vmx: cleanup vmx.c
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-4-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230217184814.1243046-4-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 75bda6d5-fa6b-4cd7-9cf3-08db13fe89ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iyHiKg3eA0niTi6O2J/FMwnk+1Iq/tpH4aCCcpbt7K/of3hNKugHcZafNVMlTxymvMVVTnN9JffzofeMww7n0s7nqDErSrR0V9enevn/jvM9UJmvL0k6gHXEhgQ4WzUSUg7RVCH0y1+X8g0a8eBXLNacEQalwbOpJZgJVDDudotcrs90mCKAoPInIaaQATuYtb0qgCHiiP6R2oVydgYu7da9/HPlNXhwRbtn70MaHSW95SvRHM13JAi4YG18tYTxclKnQi23ZEAvsDaxVZxlkURur7nCmv8x/sEKPyTqK4yhn243Kkw7OHlaLEoLIl/WFGGYgImhq4XdqQf1vLuXYxps+jLGNOwpQ0XVwYyMrC7G0i4lBebW2Y7trwzbgZ6jH7wa4rscDsYQ9RMSLMZ+A7cuAMQO+QZAXoistawFQR2Cz7UMnbRS2M8Oirpa11sQL6At5VdNucWURbfI4e+w2EvuRSZ1M7ffQIhSydyiv9tmx8DS0MF0HR9Xx6rcKlA4WtC0rpQLzZ8hLihmkDmmkX9mPPP9HRQHslepDf2kv0k5FMCPVYqtYjY8wKRAd9fl2eVJ+uyks5JfmpHcGisQXOyOd9IXN4srz4VjuMJLxcyFdWTyfXMaPKC5GOmxRKHG4W5yx/ra3cYVuTJwuT4UgJ5+2sCGuDI/SVdxZ8vSeKKyNru5lNtdZ7wbKBFuhTYjAASlglF0+UnBW/FEqp8FM8uiRb/rj49fGNdF8PwpYwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199018)(83380400001)(31686004)(6486002)(2906002)(2616005)(478600001)(5660300002)(38100700002)(53546011)(4326008)(31696002)(26005)(66476007)(6916009)(186003)(8676002)(8936002)(316002)(54906003)(6506007)(6512007)(66946007)(66556008)(41300700001)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekZYd0NzenlHU1VETnlMMGpWSmxGTlloTlU4WVhNdHBpZkhaQWhOQnBwSWt3?=
 =?utf-8?B?VlhOUnIvUWdxRzc5dHhFN2ZLaHlzM1ltVmtPOXE3bFg0NlZic2NwaE5QZkEz?=
 =?utf-8?B?QllyNFdlbWFVaytVWmJScDBjYnljZnNqb3M0Y3FXaXJDN2lRcUx2RnhhQUdC?=
 =?utf-8?B?MERaaTFHVUVIYWI0Q0t5b2NDVVBuSUQyVGhCbDNtaTVKU0ltU29wK0NBSG8w?=
 =?utf-8?B?Uk1zcjBYMlZjNURlNW1vQ1g5Rm11dG5aT01WVlV5K2MyeGJKQTZOM0lac3pF?=
 =?utf-8?B?YW5hQWZ4ZzlzMkFWeXplSW51TTlPcXFYTEVWOW15ZUh1QVJFZ09iZkh3N3lq?=
 =?utf-8?B?TlU5Qmp6WUs2eGQyMjYvaXVBSndDL2JKckJxZ1ZEZ3k2V2F6bWpwdjNPTFE3?=
 =?utf-8?B?QlRhM1haTDNzRmk1alMxaGJQS3lhTm91eDNKaFlFVGdrMHpOSW9aQzZxQjVU?=
 =?utf-8?B?UWkrczlhQkxxOU80TWNnNHBEVDJ0QThDRVhxNnZVYTNoWGRKcHlMazVoclpj?=
 =?utf-8?B?ZDMvdDlGVjU2UkxrTEVuWU4xM001aFJhc1Rsa3BZN3dnNWRQZXUyelBxNXFV?=
 =?utf-8?B?YVNsNzJHYnpBWDBqemRLSnRQbVBXWGlpcmVDZGdwMUhoZHZnMHdHQjJ3Z1JX?=
 =?utf-8?B?Z2tkWkVIVjNlckFHS1VnY1lyeGFpUkpuUTIwUXB4R3ZOemNiUXpXaDMyV21G?=
 =?utf-8?B?Y05JbzVIWFlJZ0VET1RPNnZNd01oQW5DOHpPNW0xcURxeW9BVEFMd25oVXg3?=
 =?utf-8?B?YXZLTmZoY01jWVlvbGVtcngvVVhzMUhXSkdJR1JCNHhBY2NPMmdNZDdDLzda?=
 =?utf-8?B?RFNmMC9qQnhBOTJ5UHRydVp2Tm4wVFpDSy92VU1qamJxYmJ3cG44dHBRVk85?=
 =?utf-8?B?Vjh0d3BqTGFsMHBSY3FtQ2JrUUFlN2c0cWhtTURSN0I0TkpWdDNNWXhaTnFZ?=
 =?utf-8?B?WVZ0U2xxamRXM2tWLzVmT2ozQUtMUFJ6RjVGMDNhK2dhS1pIZHM0eEd1TjQ1?=
 =?utf-8?B?U09RR3k0Nm0vcDFpU0ZvakJkbVhONGVUcWlqNm5Wc0VzN1ptZHE1RTJkb29j?=
 =?utf-8?B?amNWclQzL0lUSVAxSUphbkR1d3Nld25jbHRZcUJrb2xqblEvVk4rZDd2RGVa?=
 =?utf-8?B?bTdzK1JTWlk3Ymk2WVFrdW01WXRiQ0ZpY2I3WlRrUlFCTFJmRk0yeS9SUDRG?=
 =?utf-8?B?dENzY3NyT09jbzlLbFdZM0QxWkczUktlY0VZK1k3aDhJZkp6SUhuWVI2ZWZk?=
 =?utf-8?B?S3hrRGZCYnUwbCtDaTNuVW9wU1A3SHNDZTFIb1IrVkpua3I2YS9MNnF5SUMw?=
 =?utf-8?B?U0Y0SldzKzkvcG45eXBHWVlXR1EybS8rOTM2cnhmSVM3WklpdXA4LzR1TzRS?=
 =?utf-8?B?M1FtR2JaUUVZOGR3THBUUWlGZitUTG4zd3NveXNnVXBneHpWanprbGg2aWlq?=
 =?utf-8?B?c0F1VUZ1WlFkcFlFU09leVZNSzVvdkF1RFZaODY1eHByZ1M2Tkp4UTV0aVht?=
 =?utf-8?B?anFickl0OEY2OXhtRnNiUlJZYXhBb0Era0NKUGQzNHd0eWdXSi9KdnVFa1d5?=
 =?utf-8?B?ejJDY29mMnhYU0JDaEd5ZStWaWFZbFNicGRSL05FRDhsQVBPQ05UeHJDNDBE?=
 =?utf-8?B?V2RBYlF5MUMrcG9MTFpmL1ZvK2Rvc1ZpZTNPZjZDRDVBMUZDRkJxRG9ZMUF3?=
 =?utf-8?B?aDdkWEt2cXhUc3hXYy9ILzZhQlNyTVVJdEE1MFIzb2lVYStFWDlyZm5mY0Mw?=
 =?utf-8?B?TytmN05vcEl1TXpUcW9Sd2piNHRHalpzMm9iTXIwMFBycERieUxsWEFadzJn?=
 =?utf-8?B?TWhzK2p3QzlSbjNrdUR3VFBtWk0yeERObFdMWEFYWklacHB3N0lRM1ROZWZP?=
 =?utf-8?B?Y283MkNGWmQzNytObjdEN2JjSkZhRjMyWmlFaUV6ZFFQTGpFTEhwbDRqaS9a?=
 =?utf-8?B?V04wdWxxSlVPd3pDZEpKeTUwUURJUFUyWitIUmFXeGQ2Q2JrUGw1NG5iSkp6?=
 =?utf-8?B?bFdFdGtCVGt6aXNSZnF1c2cxYXhnYm5hdit2MHVudGNNejVpQlZBdTg2azBG?=
 =?utf-8?B?MGQ5TDN3RjNQQXVCQ091OFI2eXZzZnZFUDhlNTdyUFc3eGp0bXhia0RpNHN1?=
 =?utf-8?Q?cIp9facb4ewyc/3AW/0qhddGo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75bda6d5-fa6b-4cd7-9cf3-08db13fe89ae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 11:26:55.7006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBGU2asgVzOBFd3a2iHiLP9sDwn2/5G1QQYKSiq6EbRkzGJleqSDn59wB7tOXwpxMxF0U+qkmqcbcO92Wx/eug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7122

On 17.02.2023 19:48, Xenia Ragiadakou wrote:
> Do not include the headers:
>   asm/hvm/vpic.h
>   asm/hvm/vpt.h
>   asm/io.h
>   asm/mce.h
>   asm/mem_sharing.h
>   asm/regs.h
>   public/arch-x86/cpuid.h
>   public/hvm/save.h
> because none of the declarations and macro definitions in them is used.
> Sort alphabetically the rest of the headers.
> 
> Rearrange the code to replace all forward declarations with the function
> definitions.
> 
> Replace double new lines with one.
> 
> Reduce scope of nvmx_enqueue_n2_exceptions() to static because it is used
> only in this file.
> 
> Move vmx_update_debug_state() in vmcs.c because it is used only in this file
> and limit its scope to this file by declaring it static and removing its
> declaration from vmx.h.
> 
> Take the opportunity to remove all trailing spaces in vmx.c.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
>  xen/arch/x86/hvm/vmx/vmcs.c            |   12 +
>  xen/arch/x86/hvm/vmx/vmx.c             | 5844 ++++++++++++------------
>  xen/arch/x86/include/asm/hvm/vmx/vmx.h |    1 -
>  3 files changed, 2913 insertions(+), 2944 deletions(-)

I'm afraid this is close to unreviewable and hence absolutely needs splitting.
With this massive amount of re-arrangement (it's half of vmx.c, after all) I'm
also concerned of losing "git blame"-ability for fair parts of the code there.

Jan

