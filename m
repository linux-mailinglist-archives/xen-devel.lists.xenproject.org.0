Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A70A5A14E6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 16:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393483.632469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oREGm-0002GU-O3; Thu, 25 Aug 2022 14:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393483.632469; Thu, 25 Aug 2022 14:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oREGm-0002DW-Kl; Thu, 25 Aug 2022 14:55:44 +0000
Received: by outflank-mailman (input) for mailman id 393483;
 Thu, 25 Aug 2022 14:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oREGl-0002DQ-HI
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 14:55:43 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2056.outbound.protection.outlook.com [40.107.104.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd6e916f-2485-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 16:55:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6285.eurprd04.prod.outlook.com (2603:10a6:803:fc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 14:55:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:55:40 +0000
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
X-Inumbo-ID: fd6e916f-2485-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4xTZ5+GpfW609YWFF5CFdekAeBQvz2TJbuFQOKHwftjMXucBB9gcH1RSLYZOZt//ztX9Obm43q6cwSiakpf3/YNdHIwQi+6JjVYu2YaB1sXKV9GMLcTPvH8LeCqJRpjQti4JG251AdEiUEM0DuvnlyIncVADG/fFTl7go1kITmHR1Wd7LsTDXvRc+665WHK2yfhOUImjFbanjwAT30A/J2nM9a9NZ5R4z0mEMoT+1aThBpDKeaVzkh/ekA4pjTSNZlYtLL5uq4JMIKN/iByT3JKeMFvynH2NLyjQTcTC0khdxcvtEA+PF8Kn+wsioH1WFBA5AMzXnDpP8XVBQgURQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuTKIXNqDPf21qQmXvGRzRTOuc2XmKPLghP6ySECl14=;
 b=X45/loYs2k3OtQTBpIW0MiONjUhVl+uDDC/W+fgYWSOdq7djPwjoo23CEjv+b9zdwsJ2fpfXdOJrBXNZeYa5F4zM2f8I+jnWEJ+AXIs3JW3v+xiU0stZic3D9fJ8bh7oWjRhyYm/JnAzLCAlhGQ2wbZVaMp45yAOJ4gtDIiG1a4g9EI0GgaCeO9vSh0d/SHy3YqCJhmEej4wYgGQ2b6vyImNleJv38Px0Asa+SMJm5XieGMwj3ZfPQ+2xJszyz1AVZT4W5Ssv/XLnYYunjGuoTPWnrtVbEXfeaqVByS05+7/H5Vy0EgCWin6IsuExF77zrT4CtV7HmAVIBKQqZdTeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuTKIXNqDPf21qQmXvGRzRTOuc2XmKPLghP6ySECl14=;
 b=FhH4c7UytV0QzmcB8PEQBgUYlekZ1cgPRKdpuTjDFO0dLEJHWXvp3JViryXoZwOgJBBgpA+8gkrmd/ypAX3HaeZX0ooQouvSJF8Iz0qUIP4IF1CQTJ2Ccsptsoe/uvbjt9cdI5dKBs6s44h/lb7PoyREn4uFJWO8ZpqAT6scqzTKWI46kqyq0ymoMAqCIcplJmXrZnxn8gtvX+jiQjP1EkeZKC+BMgmErcvH2JjzQfu5WKUdWAd2el4q3tJTAOFjXIP39JmvmEwlKuhbArfFd8RGh4MVrGpCvYJHIOXEBfZLMhyadzXYmOiN9hI2A2PaB8KqowMu+/mks28z5qiFuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <941ccb01-adf6-d2ef-9a8a-ea8fdfe69ceb@suse.com>
Date: Thu, 25 Aug 2022 16:55:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
 <c24c469a-e0e9-6162-b8d3-07c1707fc2d8@citrix.com>
 <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com>
 <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com>
 <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com>
 <7807b9cf-a09e-a393-ee7a-dc220a68e56e@suse.com>
 <Zz_iE6KdPdkQ_TjUf-W2ODPIXo2WwXz0JxF5vgPjVuz8uWfJyto5S_nYRzSNrE0jC3r4ILhjkLH_PtW_fmIeTQIQtI6wTZxnUvOl0pr6ne4=@protonmail.com>
 <3b2ad2ca-3c6c-4dcb-c603-bd5440350f20@suse.com>
 <2dHPPtixTlkUXYEzNPFRI4ezKHSe1A2VaThMjBpd1aM3NFkZQuyRdfmNWCigm1oXfdKhOwDJGoPBBIMLYtYhQlENV2eFVZ0G9EMOMj5e6UE=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2dHPPtixTlkUXYEzNPFRI4ezKHSe1A2VaThMjBpd1aM3NFkZQuyRdfmNWCigm1oXfdKhOwDJGoPBBIMLYtYhQlENV2eFVZ0G9EMOMj5e6UE=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 581244ab-f0f9-43a6-15b0-08da86a9e07d
X-MS-TrafficTypeDiagnostic: VI1PR04MB6285:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mv1Ws71H/Kn1gGTHpIy7GMZed0JFmDKqcXrdgx3CjNoiYTJIMeIJt1zifQWkAp7dqTHz/Fuhb1FSq8sP9oGOHdiNpBz0MIqz11xE0EnFz58RMB8blWFSPtxAxeJe6vzXwjGH0y/Pq4QHeqEt99pFgcy96beuHjA8huY8q5mITCI5agCRGp6YOXyiq4TS2eBsQsFk/+3t8m6xKCH+krvSnP++Ia/YbCqEViGo15nFVoGEYhXJ08GV66aisVLXTRGfSVyETCf5kG+mGoUgiZbW/W45C50KuLm0sQj/aYYUNptRSDkKWKiQeIDcD0NCgeA8Duf66TZjWP4fKHyiBut213XNzRhoCG7ucXCAWIxqn7jmcf3ygsYt4gfh0ZLiabzAvtqsL6mAj1PfVXYzQntS8VBd6fYrRcmKf+oASJUFkpN3VSb4ZRcWG2EcJSr7vOrybHH6R8fRf+a1qtHyPo47k0MTG3EaBlX/6OyVpzZddLwthVt9+X2LvVipBUXoCXKEHwyuG5TPH8H1lqcRaDieUKfmtGtagecEQqJpSLkpUFH+hQWJ8op5cLefiuOUbazxpL3KXiBQpCGh6jlKimGgMaau0TO5oQ6dJx1o41y7XRaucmFxI7NQ3DVLPWVh0b+szoJ3TSNdTlkhWC7TAUdaoGwx3nQJST1M6q7IpM1feXaR+QiSN5/Coxx38SvQI5ypjbMJxEmnN+amROPGd9QomMag9pIOD/u67dlJ812lPMOiK2NFZhPMz62ghuvt0HFN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(366004)(136003)(39860400002)(376002)(86362001)(186003)(2616005)(5660300002)(8936002)(41300700001)(31696002)(26005)(6506007)(53546011)(6512007)(2906002)(38100700002)(83380400001)(6916009)(66946007)(316002)(31686004)(4326008)(6486002)(8676002)(66476007)(66556008)(478600001)(36756003)(84970400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2p1Vm1zbmVQQUhBR2pRNU9XRzZiSHhnV0txdTRpeVowMVVKakhWN3ZUdGxF?=
 =?utf-8?B?R2tYL2dJSTVHZ0V1Z2lvdi9pd21wRDNhMThBQTBmUmh6KzUwbW9QWWhVaktX?=
 =?utf-8?B?UFRubzhTTGdscURsVTloeTNMVWg3ZjlkSUtsNGdjRGl5U0VOTzV3NnAxelFH?=
 =?utf-8?B?YkFDTVM2N0FEWlloTG90T25zblZ5TFhNaXZqdWxvdG10aFhFQ2hEaThXcTBW?=
 =?utf-8?B?WVN6U0U0SFRvblVPWVFxRTBYWTBNTDJISW8wTzZtQzBLL0lRV3VYZjg3b3Er?=
 =?utf-8?B?cnhWVTN5dDBFdDVVaGlwOTNvQzVjcTU2dDhOQWdRdTBkL0Z2ZEtTY21PUVVl?=
 =?utf-8?B?emZkSXFyVUJZc1ZpSmhaUWFhN1JmOUZlSXlwMUIzdE82S0hoVWI0RjJ4Vllq?=
 =?utf-8?B?dis2QXBqaFhRSmttaVhvbkRCWjZGazQxalQ1SjhBMmhnSHVDZjdyZ21oVjhJ?=
 =?utf-8?B?MDgzaG1FNTl2aXVkL1RkaUdoWXFENHREZTNhNXE1eFB3N0l5NDJQSjdRV3dq?=
 =?utf-8?B?Y1g0T0NLNDB6TzcwT0FLbVFhN2pUdTZCN2RlQmNXQnJscUtacW1MekpSVDFY?=
 =?utf-8?B?WHJkbi84N3pCSkVzK1ZxV2hpNE9sKzVyNXZUK1dCSXZ6dmZ4SDExMUVtU0hl?=
 =?utf-8?B?NFpVbG1BRXQ0MytuWC80Y1RrVzQzSno2UFI5QzlWenBERzE5Mnh6Rk1UdTZJ?=
 =?utf-8?B?akRjbHlkUFU1RE9Dd2xRejVYTXJubHBDOVFpREwwdFk4Z1ZWYnh1bG16Qmxv?=
 =?utf-8?B?Sms5akVBNDYwUVAwKzJXc0xxU3hsY1BPTkxzMnV3WFJ0UjB2ckluNXFSeW9P?=
 =?utf-8?B?REZiZng3TjZYbVZHdDBONlpYelVCSTRZVFFIcTR6T2JRUWN0VXFPREFsNzF2?=
 =?utf-8?B?NVhHVGVXUWFTak9Ic0Z2WWVyOXZEMkdGSm55c3BrcmpDYmlRdnRXdUNHcXZ1?=
 =?utf-8?B?M2dSc3pobHZkOFhuSjQwVUo1SUlpRlN3bnlKU3c3Yld4OThXeVdGbnRIK1Yz?=
 =?utf-8?B?WEFzbWFmK0xBVzZtMUl2VEZDM2J6N3hoSVhTcEtDblVISWZUcFgzY0dHTHNw?=
 =?utf-8?B?VFFIa3dIS04yMTVYcTdpTGFnUG1xUFhSMENlWW1yVGtNb3o1N3RXaW1sV05Y?=
 =?utf-8?B?NTRKaW5kTkFEWC81aHZ4UUJGOFBuTXA3dWcxNElPQ01ldThWdjdzUGRDZGNj?=
 =?utf-8?B?NXQxZjM4eGJpdTEvVFoxeVZ3TkIwMWdWSW1WMjJvTVpXaTNPVHRJZ2U5Sllh?=
 =?utf-8?B?dTc5TlBVTDRUVk91MWFVSGJ2d3Q5TVVGcDNVaE9mUFdTZzZ0MHNmWHExV1NN?=
 =?utf-8?B?MG4vMVlSZG5FVHA0U1RlOFRDZXllNmt4ZWpMUFp4NnlqTkNWOUlkUUtHN3Nu?=
 =?utf-8?B?VFQ4NHpBbFh1eWZsT2tHcUwwQThJMUh1Q0l4bHB5cTFSdEtIclM3dDc4UmRB?=
 =?utf-8?B?bE9wMlBKSlFxZjJ6eUJJRkdYcFU2VE41anZzNlFZRGU1aE1rWHh5empINUR3?=
 =?utf-8?B?QWJGLzE3UW9qSGM4QUtuQ3N6RmhvSkI3bi9QOU0xNm42VlNTOHkvazFIdHVz?=
 =?utf-8?B?WTFBZnd4ZXFPeHZZS2F0ZTdtNzh2alNEa29PR0ErSTJDV0dtdVJybDdsbHY3?=
 =?utf-8?B?R2tHb0VObmtWMFpSc2lzb0xUYmJGbWJSSFcyVU1vTndJcGxqNVRuRGJkRUJK?=
 =?utf-8?B?SXhxS0htaFM4Z0VHSEZRVGxYWEZNNU9OVDF1dTF3YUNrT1FZd1ZZeGtvT254?=
 =?utf-8?B?OFlFbzVzWHA4SXJ1azYwbUVFK0xaZUwwdEdaZm8zYXJOWFdhRHJGdEZPaGhp?=
 =?utf-8?B?VnYrWVcvUWlGZVJ2QktabGxEeEFhQjMyTUR2KzZRWFV3bVB2UllScUVtVEVs?=
 =?utf-8?B?LzFBRkJCUFRZNUFPZlJ3ZDV3S3ZuVUVLeGJzY09Ha0FCdUduN3pwZU1WNnJH?=
 =?utf-8?B?eUIzY0RtWFg0VndqbyswV3VMR1dRekFscUtmRU9JdUZ6cFo0RzNXMVRzVlly?=
 =?utf-8?B?N0IvdDVhbWsydnJESWxndS9NNGIwdnpwMTdKUjh1WHJVbURHMUtoblh4WHg2?=
 =?utf-8?B?RU4wbUhyYk9vQzF1TXE0OEFKZnBId0ptWC9MVk9Jeko2RGJFMVFET1hUTkRL?=
 =?utf-8?Q?klT6xyH5wpsd4xCLDAhlZ51yW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581244ab-f0f9-43a6-15b0-08da86a9e07d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:55:40.2422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgEuJR0riyhY12rPo/50jO1AMJyW5bOOthteU6mlxZMfQxwtnlxlAtIiHNmkE1rVwf5n5PengILK29nIJVY0jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6285

On 25.08.2022 13:10, Dylanger Daly wrote:
> Yes please, I have Qubes's Build System setup with sourcehut so I can add patches at will, however please be aware Qubes currently uses Xen 4.14.
> 
> I'll take a look and see if I can access that location
> 
> With the added logging I should be able to trigger the crash and get to the bottom of it

Here's the (trivial) patch. It's against out version of 4.14, but I expect
to apply fine. Further logging would likely need to go in the kernel,
since - if my analysis+guessing is right - we wouldn't even see a mapping
attempt in Xen.

Jan

--- sle15sp3.orig/xen/arch/x86/e820.c
+++ sle15sp3/xen/arch/x86/e820.c
@@ -700,3 +700,15 @@ unsigned long __init init_e820(const cha
 
     return find_max_pfn();
 }
+
+#include <xen/domain_page.h>//temp
+static int __init ryzen6000_init(void) {//temp
+ if(e820_all_mapped(0x7AF67000, 0x7AF68000, E820_NVS)) {
+  const uint32_t*p = map_domain_page(_mfn(0x7AF67));
+  printk("0x7AF67000: %08x %08x %08x %08x\n", p[0], p[1], p[2], p[3]);
+  printk("0x7AF67010: %08x %08x %08x %08x\n", p[4], p[5], p[6], p[7]);
+  unmap_domain_page(p);
+ }
+ return 0;
+}
+__initcall(ryzen6000_init);


