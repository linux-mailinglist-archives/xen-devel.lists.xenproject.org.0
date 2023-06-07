Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9243972546A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 08:38:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544393.850143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6mnf-0006zm-H9; Wed, 07 Jun 2023 06:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544393.850143; Wed, 07 Jun 2023 06:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6mnf-0006xB-EU; Wed, 07 Jun 2023 06:37:43 +0000
Received: by outflank-mailman (input) for mailman id 544393;
 Wed, 07 Jun 2023 06:37:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6mnd-0006x3-O3
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 06:37:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc004c52-04fd-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 08:37:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8202.eurprd04.prod.outlook.com (2603:10a6:10:24f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 06:37:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 06:37:36 +0000
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
X-Inumbo-ID: cc004c52-04fd-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGTKGULwAfkjdwLlSb3x20oOim0c5zelQ/GVMw/WAbB8IvhZeA1AN5D6AIULe8bd8+Z2VhsmoH9SEIY9GW0QfM7EV+5OMgYrksfL7AXLKPTdZVRV09gHlUO05h58UeO++QDXJuu7aFlsxNwsJot+qM6tBY1ozhXiVWaYMgeKtwvti9d8/lLOrzFF0WnO4esW1LizPAfxHF8t1NB88JpQQIDXr/er2whf7eEPOiifkknqkTf27NJSqs0fLpuuSp23jaP35x/O3GWU9ESVdZWUnOAq6B/f/ELwLuyAJ0AQOFJYg3D88Sbr6pH8IFJY56VH0ydQoSTPMgyb5ucq40/a+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIvmbZ8QvtyV75kzqiZdh3kZ1MQSdNcSZP1FKdpQBnA=;
 b=GrhsQuHSzI6VdF1ecB4UyVcfUcCI0zTO8ZNO2WEYhXv3ZyFiEkafNa+/HoRrY1A3+VuSWvjjncq3o5qH7yJlbkQJjqRMPnMR9fclll3FDEL5UwSsCVub6U7xt39olcr220FRWZJd+4Ugb1vW5lsntF77964QNJ2WXymgm1Qs4x6Kq7hkylN3wbOXlfeL+8NFN+ojlAPFfiDxxoLqL2SX6Rzgx7toORg+M8DN7OF28RHRj3ENDzg0ys4EnHTkELVW569fCxtOnPWzwoUHb5kQtOh+spFH9PRjoJeOP/f4m8gKuMaGeRYUdbe56WC9LUKpNjKez22KkResKFt7te0chg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIvmbZ8QvtyV75kzqiZdh3kZ1MQSdNcSZP1FKdpQBnA=;
 b=MqNShdpL3bpOqIkOPGdcCNcOb1qLs3bRfmMWBP3Jum4WHbpFJm6rrNKDzO3evUcf/YXfpqexfSV/J5tea5JTJNCTBLKqHLRlv4Qbogfjryiq3sX4hrAyMiaz6H5b4psWZoZ6RIfONLqRMDGCCIEkXorQnH3+tjGH1oPH1io/aWgK4N20lPqv0j23yPJ2/A6NedxpCkB7ARaABFC5uRmoTD6j3loA4VYb6g79vrUxZkEmx63NTvk+gJqEFZJ5hQ1VplfJiO3WN6kd6F0kZAbF0k4x6PaFWUxg5WI7CDmOpM953c+71ZOD/QVp/fprYpQYkRlLxQ3N8hAvRx31Lb2uWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8ed507c-ad8f-f84e-8793-eaf6cace0e80@suse.com>
Date: Wed, 7 Jun 2023 08:37:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
 <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
 <alpine.DEB.2.22.394.2306051430370.3080090@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2306051430370.3080090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ebc0ca2-7100-43f9-c43f-08db6721ae7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IlMk9u3pjhFg1Z3qDpngF1y94jwKKldl6A2dRjmoWafPtDG3LCZ83Unjlgw0vuYFtUhEXKi+QsmThqLtp8CbmpgOZY1KAFtMUtIojpiaR0DhMu0LV6SfA3ZTvcEZJnQSbhpwsggoJSeyt+gf/SdG786xRrgnIxL749iq1JM3+FKCdwd5qqiEko/LEp3clFphIaauizNEoj4doGJPHr2RZK9v1SByI2DlVpkDo2K8MZuw6wRqjL9RZgPXlwJRKuUA+azZViBgVwT8ZT7TSvI6t+shZSliCBIzGB1xgAoPOcXsjbbFo13h287l1lPhwJ0nEJzZc76qynt8acbbQt6Qe1d0o31tJiqKrOMaGFKDgCc59/dP378VQkaaYLyi6WWdnW+d/Ecv7ngJSGbcaOfR1KQfVj2wtBgyDjuapJr5yun8DVdW54OelarO3un6o2JEejJkk0rrRyuoSG9TX/FRSZCI4kS1n7A2gLJpzUGT8aJ2mADIHD6iMRALn7cGWNYxaBgNIzREswxINi9dmSBMNXgG2vtNF2+oN+HAWYekmSoAyF6veclL8gdwClVOMjlfN+2+9Rj3ggAveg43ljohIgSGMMOJSKDnU6/5V5/y2PcOH9NvEVvsnxqwqL3VsQm9CW3y5suPKp9YLOybgyH4Cg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(83380400001)(8676002)(8936002)(66556008)(4326008)(66476007)(66946007)(6916009)(316002)(5660300002)(31686004)(41300700001)(54906003)(2906002)(478600001)(38100700002)(6512007)(31696002)(26005)(86362001)(53546011)(186003)(6506007)(36756003)(6486002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3NjNnVqV2tkVHFKRUFva0QyeFZtdDF3NFpoUStYZGhXTGZxa2pVV3RWWko1?=
 =?utf-8?B?RTJRdEVnVEg0M0NTZEZEbDRzaExjUmdjMGZDN05idFBMNVZuejkwanVMYk5B?=
 =?utf-8?B?b3ZVbHFFeGMrTFBtUVB5NDlNWXYwQkNGNHJnNXN3QUNMRStrWlBaUzZIZTlX?=
 =?utf-8?B?TndFL2s4TTA0K2RWUWNVYkthYlFzTnllUG8zNURkQnVZZ3hSSmtjRnVYNElz?=
 =?utf-8?B?OC9US1J6eG9ubGY5b3NRbzMzRVhoY2lvV2FXa0JGdys0UldvRE1IVjlPbXkz?=
 =?utf-8?B?VFZwWGNwSGlmNk43UC9VRXZzSDN0b3JRM25WYVdXaTlqY3hWWTBFYUNIQ3RF?=
 =?utf-8?B?RFlXdy9sSUxOdmpMK2pQckNIL0lFZnpvaXorUVlsVmpGMS9hYTNGbytDL3I0?=
 =?utf-8?B?STlsWDNVSGwxR2xtOVE3QUVPVHZaenNORzA4cC9qY1NsTkFaYkZtZU1XQm16?=
 =?utf-8?B?WDBMUDFiQmxBRlg0Y1hIUWM3WHNhcG5PN0drK21IeXc1Ym9xdm44QndiclVY?=
 =?utf-8?B?REJIMTJleUFyZnhWWWJKR296cGFnaVQxQ0h1Ym1JMXFodUROZDB4YnNZanlE?=
 =?utf-8?B?T1BVY3d5NTRyZXp1Z1NTalRFRjQyMVZIRGtCUXk4UTlOb1dRNzZsc3VmY281?=
 =?utf-8?B?T1k2Z2lvdGRIUkJiUU82VVhFeXFaYnJhcHVaZ3BGUC9BTDlORUlGSlZOUWpl?=
 =?utf-8?B?ZVBkbCt3a3pVc0k3L2Y2enQwRzhWMSsyWGloRWxJRElRdisrUGdmMEFhajlR?=
 =?utf-8?B?dlpKT0wvdG5OTmJOeXh6OVg3elVjeERuSUIvMFFEaWpUMll3SWJJSkVOTWtY?=
 =?utf-8?B?elA3WW1qUUdOM0JxMDVUaDB2QjhlL1BEY3pMYnNFSXBYelAwY3pVeGNWRmov?=
 =?utf-8?B?MXFPdHhoSzBlem4zQkJGbFF5M3BBd3VSS2JCYkdHN3FMYXBuaUFWTzA1bllV?=
 =?utf-8?B?VnlzbGVjR051RnkvMFppbTlnVFBOZFIwYXpwaU9ER0JSNTVkUTl1NHV5MlNK?=
 =?utf-8?B?cEVSSCszd0UzWHpwZU16bXB1RnFqc2p4SDZpT1VlT3hpNTRWR1FkZkZUaUR4?=
 =?utf-8?B?NE1Gb3Q2Z0lNV0hERWM0czd0b1BMTjJzR1loaW5iNTlBVTNWZ2Q5b1Y2Q1hU?=
 =?utf-8?B?UUxRWEFpaUZRaHJJTFVuOXE3SS9jcXMxUWYraXZpdlNoMU1CSDI5VzlaRllj?=
 =?utf-8?B?Smw1MnY2ZkxHYVlmeFMwalp2eWk1dDN3YmZsYkUxcXFkamVnZVNaVnI4U1dQ?=
 =?utf-8?B?cHA3Z05JS3ZVbCsrRE9kdXBock5CZ25CbGFGYnJuV25tRjVpWUVPVmFzM0Vr?=
 =?utf-8?B?VWd5MTVLRXNZSnZmZ05oV2tWSUM0bW1jd3d3MXIrLzJtTy9VdWx1RXdzbHZo?=
 =?utf-8?B?amEwV1Z6cHFoTlRrcHZWSGhLRlJkcEdGL05XMUg2ZmlsbkJEU1A2V2crSlRx?=
 =?utf-8?B?R04vVkl0THBIYmZSWmhOUVNrVXdVc3JlaFhZb2lTckUyakZjQ2xWeXRvRElL?=
 =?utf-8?B?S1BpK09yTnB1N2syNE5EUStQNmp5dGxTckw4UTJVK0RlRERHeU5kQzdHeFNX?=
 =?utf-8?B?REJ3M0FVMGhDUVJFZHFxZzFxc3lrMzRJYU9vaFZXVkhlS2NDYVVyaGVKdVRa?=
 =?utf-8?B?UFAwU2h2a3ZpdkE5bW5LZmdMaXFZalRxTHNFb1QzU0hPTHlWZEwrdTE5MTVD?=
 =?utf-8?B?TjFwaDhma21UL3kyeEtRbGZoeDRVZVo5Qy9RanpVbVRCUTk5Zk1tdkIxbm5v?=
 =?utf-8?B?aTlnK0F5SWowL1d5MzBZYVBNWnRCL2ZOYk5abkl3SGhLYzBVVlNpTnRLdkZ3?=
 =?utf-8?B?Rmp6bXZ4SmVyMmpUSTBHVFNzb0lUZ1l0VkhUakhyY2h2S3Jid2llQndweW13?=
 =?utf-8?B?ankwQ0FDN1dISVI4TjdmTEpDYXBjYnJCT1ptSmkrZ0lhcnJwenMwSWQ3NThL?=
 =?utf-8?B?SzRFM213aFNqWUdtZFBaV0xLRnVnRVJyY243TFRMWWFFcU5oeVVVMThZb1RQ?=
 =?utf-8?B?c0VZR0Q2cHk5TE5WMHo5N1ZkYzlXSWZ4RDR3cnZtTXlpQWVaakxqRlRWU25H?=
 =?utf-8?B?TDQ5S24xc1czT01kR2Y4ME1Rdksxa2cxRVVmMVRrMGVOcmRCTDJzKzZ3NmVO?=
 =?utf-8?Q?nzaCXCFvaD6gUFHTP45jeElv/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebc0ca2-7100-43f9-c43f-08db6721ae7d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 06:37:36.3913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jDEAKtvZPOGFkk6yZFTWU8vr5s+s2CKWRyjX2a/8x1SoJ5hOSOtWPpcQGEvZ845JNrloOilLyaIsRQjLsIswA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8202

On 05.06.2023 23:39, Stefano Stabellini wrote:
> On Mon, 5 Jun 2023, Roberto Bagnara wrote:
>>>> Here is a list of extensions that are documented in the GCC manual:
>>>
>>> I suppose that this list wasn't meant to be complete? The most
>>> prominent example is probably asm().
>>
>> As far as I can tell the list was almost complete (I realize now
>> that the use of the keyword __signed__ was omitted because
>> investigation was not completed).  But I am probably misunderstanding
>> you.
> 
> We also make use of the following extensions (please correct me if I am
> wrong and these are not extensions):
> 
> xen/include/xen/compiler.h:#define always_inline __inline__ __attribute__ ((__always_inline__))
> xen/include/xen/compiler.h:#define gnu_inline    __inline__ __attribute__ ((__gnu_inline__))
> xen/include/xen/compiler.h:#define noinline      __attribute__((__noinline__))
> xen/include/xen/compiler.h:#define noreturn      __attribute__((__noreturn__))
> xen/include/xen/compiler.h:#define __packed      __attribute__((__packed__))
> xen/include/xen/compiler.h:#define __weak        __attribute__((__weak__))
> xen/include/xen/compiler.h:# define nocall       __attribute__((__error__("Nonstandard ABI")))
> xen/include/xen/compiler.h:# define cf_check     __attribute__((__cf_check__))
> xen/include/xen/compiler.h:# define fallthrough        __attribute__((__fallthrough__))
> xen/include/xen/compiler.h:#define __aligned(a) __attribute__((__aligned__(a)))
> xen/include/xen/compiler.h:#define __attribute_pure__  __attribute__((__pure__))
> xen/include/xen/compiler.h:#define __attribute_const__ __attribute__((__const__))
> xen/include/xen/compiler.h:#define __transparent__     __attribute__((__transparent_union__))
> xen/include/xen/compiler.h:#define __used         __attribute__((__used__))
> xen/include/xen/compiler.h:#define __maybe_unused __attribute__((__unused__))
> xen/include/xen/compiler.h:#define __must_check __attribute__((__warn_unused_result__))
> xen/include/xen/compiler.h:#define __nonnull(...) __attribute__((__nonnull__(__VA_ARGS__)))
> 
> It is possible that some of these don't show up in any of the relevant
> code build as part of the minimal configuration for safety so you won't
> see any errors/warnings in Eclair.
> 
> Also, some of these extensions are probably no longer necessary, such as
> __gnu_inline__.

gnu_inline was already noticed as in use - see bsearch() and sort(). Iirc
Andrew in particular wants it used in further places.

Jan

