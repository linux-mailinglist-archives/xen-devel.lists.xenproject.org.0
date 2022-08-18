Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB2D598576
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389601.626636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgFt-0005BR-5z; Thu, 18 Aug 2022 14:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389601.626636; Thu, 18 Aug 2022 14:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgFt-00058Y-38; Thu, 18 Aug 2022 14:12:17 +0000
Received: by outflank-mailman (input) for mailman id 389601;
 Thu, 18 Aug 2022 14:12:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOgFs-00058S-5m
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:12:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2059.outbound.protection.outlook.com [40.107.104.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c297d1a5-1eff-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 16:12:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4752.eurprd04.prod.outlook.com (2603:10a6:803:5e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 14:12:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 14:12:12 +0000
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
X-Inumbo-ID: c297d1a5-1eff-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJK/YE6L5GOgWlP9IGwWPCmSCKzmsPzafS3Qa7RsnkeVU39GZplVh4UHKFHw9TzAZeHbMa+MD61vQe4/v7eWIJiUg5+8tiMQXUceCk6EOU3wpRGSrBIWCtq8BtLMheL/02CtWu2dLSsDq8E0nAm6Lwd+ieizJZTnV92UWkKmWNYjcUH412UmsR5hcDIctn2Vzw7YQ3IjN+NtAXAtNARzFymlkqgYFzF0++qTKa0qJNqurXzDbclGRut7PTj/PSCOk9rT9EOf/YZkKtdkLboSxSACBOY5EFZJOnPEe8/8NnmNV8SpuEcXnH30AAt30lEbmXPoO+KNt6mQKoG6y2z1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6Uyciml7mRjKwb4uEigthI/E9mN6oKAmwHxwJYuWss=;
 b=WP7NYN1hjDWYToYMAGgRn8bASq3NLiWoI2xa+wW5d8LLmAUTcQwskdZ7J1hFLf5z55o8Nwo9D8yufFFNgdPjYca5jpin6U9R+tlSJP9stXX8MCMVCErA8Ost5bqNVwajeMSnjUxFxa6ak1fGEO8fwRXPWabJyTv2jGVHMgSZNlgkTQTa8p52qgoMK8aBiaiF5EVKQ9bJTjGL0ZWlkyjbxOCh318TE+w8QTsaQK5+1TaUDRg8riAWXSKDK8icMALgUDKnZ13blwNYRqjvQz8rYRptEpmlJEOoPtv+Y4Ly4WyA/VBYSMqy33kLqKvsB3/+CpByRbRumZe679VXprvIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6Uyciml7mRjKwb4uEigthI/E9mN6oKAmwHxwJYuWss=;
 b=3Qwpy9WLjPlaDJ3VkBnNVUgjuiT7qImfWkK4f2hZZ0ZnCnX+3J/hEBQd3m9vvHTKmnNiDmTsFkisIUImYBYvjLXZN8MjHo2+d+FEqT3ROk8kAKxKkQnZ0toGIcky1ic9Lst/HmVto7sSsU3RGhRrf+coaoQ3CBKd0ONJutP6Inil/KJOwlsUP1PE0O5bcoNmu2f2lfEciKkQcCE5AVElib+/TTRzbQV0XAXePDufMxSrsfgNzlYfjImnrJToeTl+sutwA4UlPdzSqciGyV13fDLvtX858NONtRkEzDaG6UZioXq6PrYrX0AncCc1yuE/QempWRBGibcT7gh2oGCRmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7e4433c-a1e2-03d0-20bd-e17ace99f640@suse.com>
Date: Thu, 18 Aug 2022 16:12:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Use direct I/O for loop devices
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <20220817204634.1886-1-demi@invisiblethingslab.com>
 <499daffa-b1c6-3868-c164-65335963922c@suse.com> <Yv5HC/MA2LUHNYKO@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yv5HC/MA2LUHNYKO@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bd22a31-e9fa-4f3c-bbb7-08da8123a583
X-MS-TrafficTypeDiagnostic: VI1PR04MB4752:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rj/y97d9FkPIj/uzRhXuK6J8IKN8TsHOa2L9k+WouFt1CMOIGlmC79HuJk8n63wdVaAAMFI6/wi1zERTum2p4k6j5bK7p3DVl0zjmh6gjZI2bBMHGtQGK/3XomHwnHT/bRr5a/4Z1q40tTa6IJEcURfvd/y4AS5wPmD6Jw+dt6VZ1sOkqf/tOG/l42Pr9Q73s814dalv4KhzqBggto459msLIAG7mMjMo4D/n+nHsqONGdF+LyVk89U2SFcK4rhOgixjuogG8ogBUC2PE6ukKmdWPmPtO3Z3m1VjzxAnX5qnZWhs3GSb4kP2oHKo03u/Mz7Ql3eFNbwS6wie9afQj0cmZpnUvmxqsG/vB3tDQBcOyrARVYjvr9DCEON00F2PC+Yh0Ic/MzTA8ryp0eVu5+X0rE5yAT9HoeeDVzuZl+Wv6VHNFQvoZBQrtyTlkB5yTJ/yeg127eKIk+/kkyVJlv1Ms71UeI5wKSE44h8UyloYIUoDRIxo8k5s1vgo1O8mJAmWjMxc6N9+2DZ8nBusq1Vb2/N4orDXaZ6vtIkrvz2Zu9spx/w7zXxL2zx7w3jXzvXBHqDJVIq/gDrXYDjx9d3AvkNr1l8bR9Xih/K6BWK04op19SYybWmkbxJje4QxkbvrHnJcB5JJ+GJ+MIhD6Tf74WC6i/wte2kGqyKKbWGPhh8y6ao2OlFDLVaX0eW8p93q+v4J7fZzLQSqp7Pjmaqj6gvxu7p6xzQwQTvY8AHTMlG+3QNknPhR4YqNKiPJz+KoS2Yt/j7EUNQ3g8NdUsx4mTkjTzk3wVCPAgY2Wdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(39860400002)(396003)(136003)(346002)(41300700001)(478600001)(2906002)(6486002)(66556008)(66946007)(4326008)(8676002)(66476007)(8936002)(5660300002)(86362001)(186003)(31696002)(83380400001)(2616005)(6512007)(26005)(6506007)(53546011)(38100700002)(316002)(31686004)(36756003)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wnc4N3JvLzR4ME1peitrSVRSTDFMdnY1MHFWRm5kSm4vN1hDV0drd2lPakJQ?=
 =?utf-8?B?N3BpN2VjWEFSVFV5Y2lZLzhVblJqTDlRNzF0SVpwOGVyVmp0MTlxS0VLRm9Z?=
 =?utf-8?B?YXU4RlpZemhHQzRrY0pXSFgxWEJMOG5NQ3IrblpIWFhwTVJVd1pTZ3ZHN2dQ?=
 =?utf-8?B?TnZ0NllqYUd2eHMxNEZ1L2FSMC9ReGNFaUZ0Vnp0dGJadk45UUd3UlQ1eGVM?=
 =?utf-8?B?R0RGUUtza3d6ZEgyMTBlVXp2a1JDL2ZLOGY4ZndPY2xFUnE4UmxMR2MzcTB4?=
 =?utf-8?B?TTd1endlNDhsWEMzSXNHT2pDQzBUbWM3bDdIMThKa1BMeE5SejExL1RaU1Bm?=
 =?utf-8?B?MzI5WlpoYzFNSUpyYzUrc2RCdENmeXNOWDdkMjNMM3BRc1JTV0VCUTFlT2Rm?=
 =?utf-8?B?cFVkdjlQOGZLQ1B6Zlgzd3ByU3JORy9JWVF5a3g1RGdtZURQVDhUVmlJdXY0?=
 =?utf-8?B?TzdSWHI4a0RJN3dwMXRJL2xMdzBWbkR4aGxjZG1OaVlLVHR0VGpkckMwSHh0?=
 =?utf-8?B?WENLUytLaUtGK0lOUDlWZXRQMVpLRXpmMmxSTk5PbUc3N0pSdXR6TWY0Nkxa?=
 =?utf-8?B?bTYrVUZaUkh5aW5tQWgzaCtCSVNZYnZ5QXJ1ZE5JZ0VpRGJoOWtYTXd1UCtI?=
 =?utf-8?B?c0psMGplb01PUW9FbEdKaHJHVUFocGl1aXpUdnBxUVdVSTJmb0lsOGNiU05p?=
 =?utf-8?B?TFNMOC9TR2ZCUGNUN3RoTnRueTNBazROcmhCTGo4NXBJelZpMzl5RkhUTDVU?=
 =?utf-8?B?dVFqc3J6Q2lrTnVOeFNoeFZwSW15dllybWNFOHd2WFQ0MjdOY2hGSjMwbWZz?=
 =?utf-8?B?TzZyR0ppSjBEL0RUdUQ0dW1UK1hUazlpdzdkM2tWZWJrUzM3bDBQdXB1dTQx?=
 =?utf-8?B?NDQ1Q01XVmlpb1NpOWoyNW5Cb1FyU0RlYlFHMkRTaFhXbVBSUlg2ZitoNUVz?=
 =?utf-8?B?VjdkTmJ4Z2ZwSThnOGNXKzYvVkdDNDBwdWNmNDM0dnNyOUlVRCttSEpXbGNR?=
 =?utf-8?B?Y01MdG1iYWtSbk05RHd3d2FtUGZGZEkrQWNtcWhoL3VGZkMrS2VVbE1HQ2Ru?=
 =?utf-8?B?SmcrVDU3TUZDMzNIeklVSWZ2L0pwclhJVVBsSVhlUElJejg1Wlh5anl4WWkz?=
 =?utf-8?B?MVFIK3M5RVB2S2UzUUpYZ2ZzcjhKN1dmTUxib0xvekJZaWRoSjc0YnVCVlQ2?=
 =?utf-8?B?TytiMFpaYTNpOWZUYXN4RXBuelBwV0lTY2syRUt2akhmOFlBbTh3T1czQnpy?=
 =?utf-8?B?MVFPeWFHUC9iTWRxMFhyOHJNbDloSk9leVZ3UVNDcFFlZWJUMTkrSXh5Mkw5?=
 =?utf-8?B?YVh6M0RobGNzVmZ1WW9GNU9DSm9UcEtzaUFDWkFIa2lQVUsvd0kzRzUwTDM5?=
 =?utf-8?B?b3NPMHZlRllHNjVSMnJUSW1NdnJiTVcyUDg2aW05ZWpTV2llSk45NGltUFFm?=
 =?utf-8?B?cU1NbFZZd29EajdmQXhSRTZsTEhiMUtva2ludnZqNmZ0Sm5hNlhVN0sxb1l3?=
 =?utf-8?B?TFN6RTF2aHVBRVZ2d1VPaktTWWNDQWVVMnRVM3FlNDZWMnJBSmxKOW9sS2tT?=
 =?utf-8?B?NXlXQXVjY1BqZDhETUdSaW9HZXRWUVRneDVCRytBdGtHbmVwblVaSGNUdlAr?=
 =?utf-8?B?KzJYWUx3Q0h6bzkycmpGc3NIL3c4RlIwMjFCdDViSmdSU1E5UW9pQXRMZVp0?=
 =?utf-8?B?dk9zT2M1cEpFSGdzODlyaHhwWkFUUFp4OGRqMDQyb2N3WmdTWHlkdUhSdmFS?=
 =?utf-8?B?MDM3a2NSZExrSkd4MHlUMEI3R1kwd2ZrWlZseHVOS3duMWJMMGlnTWVNYUdm?=
 =?utf-8?B?eTZCY2V3R2xXQ3daMEgwYlFmRFJXR2VmUk1ndXdPQjZGb2NSS1U0cTdHM2t6?=
 =?utf-8?B?WGVtTUs5S2NoT2Z5UFE1ampQL2Z5dkVEZUtqR1o5Z2cvYXZPb3U2TmJHTWQx?=
 =?utf-8?B?dzJKaUVFNGVVTnd6R2VneDJNQzI4UGhzRUZ5eDc5VVdRTDM2K08vN1lCckd6?=
 =?utf-8?B?eUtzaXc0UEtWUzNQekNWa0tESi9VNUZpVWFOR1M4bHVuc1o1bThNQXRVVXBm?=
 =?utf-8?B?YlpoQldpdjBMK3phOEladmdHNWZmNUVXcGhBTEtoR3BJY3NaYkVXUEtTK3NH?=
 =?utf-8?Q?lQvFIk1gABsb9rXByzXF5zRrX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd22a31-e9fa-4f3c-bbb7-08da8123a583
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 14:12:12.8152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIVLrsI+KZhodM0gv62jt4ZwAKZgJYaYJsK34ZflYgVceM7aifaBIGaOmWaf9GJRF1LboH8CgO+Xx+S3imvRaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4752

On 18.08.2022 16:04, Demi Marie Obenour wrote:
> On Thu, Aug 18, 2022 at 09:02:11AM +0200, Jan Beulich wrote:
>> On 17.08.2022 22:46, Demi Marie Obenour wrote:
>>> --- a/tools/hotplug/Linux/block
>>> +++ b/tools/hotplug/Linux/block
>>> @@ -330,7 +330,7 @@ mount it read-write in a guest domain."
>>>          else
>>>            roflag=''
>>>          fi
>>> -        do_or_die losetup $roflag "$loopdev" "$file"
>>> +        do_or_die losetup --direct-io=on $roflag "$loopdev" "$file"
>>
>> I guess you want to first check (maybe in tools/configure) that losetup
>> actually supports that option. The old-ish one I'm looking at doesn't,
>> according to its --help output at least.
> 
> What version are you referring to?

The tool itself doesn't recognize --version. It originates from
util-linux 2.19.1 from all I can tell.

> In Qubes OS the current plan is to use a block “script” written in C, to
> improve performance and (when combined with kernel patches) eliminate
> race conditions.  This code could be made a wrapper for the C version.

Is this relevant here in some way I don't recognize, or did you say this
only to provide some further background info?

Jan

