Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1A57AD053
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 08:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607616.945865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfF8-0003i7-FF; Mon, 25 Sep 2023 06:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607616.945865; Mon, 25 Sep 2023 06:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfF8-0003en-C0; Mon, 25 Sep 2023 06:38:54 +0000
Received: by outflank-mailman (input) for mailman id 607616;
 Mon, 25 Sep 2023 06:38:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3u+g=FJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qkfF7-0003eh-25
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 06:38:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 301d0378-5b6e-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 08:38:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Mon, 25 Sep
 2023 06:38:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 06:38:49 +0000
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
X-Inumbo-ID: 301d0378-5b6e-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nn8lFl01mAc4AZWzeeHoggn/btoW4PRVZuGXXdJ8u3wYqvFak3P4Y9B6+0KwBTV7+pgsLgliRTGS5YC3TK/r+puHDJYnVl3wgaKlhZConZaoC8SYrBpV1bxoG87ZyXJdcUkjHtnsQfsVsIyJzMut6tBhgvSO/9AtlMUSEj5qKsNpi2MkOkWBzRO6ZN0oevWiHTvkxmY4OYf0DU8UdzXKXt1ZR19V6QRIjzg2xjFn/ygn7iwkYhAYc3wOv0Zv5TH07sPuCu9OJ/BEhD7z+9F01pAENaT+liroswLDBBG+QkOBBhX7XEJvCEs5oybPbeDJnyl3s4jZoadThXNNYzHgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gCYLQmKUgNKczwnqBftjw/LTOOrerQNjXSk63NlhmI=;
 b=l53qC9yxcOXrkcp+AtIOExRsF91IL/j/VfNoED7E+euypZ/EHJ9HgL9VcR6l6pY9dwmClUtyLzKqwaL2bMhMgn4Ra2xC1vDF37nn09C7sOJ1TDNEQiuslCMfUNCqltUn5sLEDOj9dZuLTGbcn16eSfvowKjNex3DGDPCnCtcq+mYe4ba5dfOYFQ6cMX4E5ORgNrPgppVWV6mX6IvUmAAKWzcufNOS+cfRrcwKBqwF7FQBXhKWmelixsYNPnbfDXq7XxkjFVlCZWlVWX0ZW/WA+YKvL4t4KxSdfNJrH5w/GcEFJXu/Cz4439NDI+WY8xsY8s1MBIkyRlI4tnqENAf5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gCYLQmKUgNKczwnqBftjw/LTOOrerQNjXSk63NlhmI=;
 b=Ik6GZFXiHV0iKBiF/oLylwVJJxcpX5KyUcbjsdN9mQdB5LEICsN9Aql7+lVSbVXMdjOkEppis3YQxC9LUlXFx0LpxtoIH3OmFFozEqCueOKDQFLjdVuOdinG5S89SJDrn2GA2HEd3DeM+GQd1Wxkz0rj5ygXAxEFhHZDXLs5eC891tTj/ToecyV7ggjJjvXQB1VNmEXxpL5vp0gEnvlQ96fy84yLnOg++Bk0P9ZP53hMIJao6E/FIBm3tGr6o6vmncVTnZrQusRQBMN1Vs1JLmejQVc199KzGx/psgnZTlyK36lsDw3YquG08UexpUsAo/5eGrXrMJ41x+eclXH0tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e49ae70-5e2e-e87b-f7e6-901f9a689fe1@suse.com>
Date: Mon, 25 Sep 2023 08:38:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2] xen/emul-i8254: remove forward declarations and
 re-order functions
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b2877f0e2d867e04e806d70cc2ba175386c30d9c.1695392080.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b2877f0e2d867e04e806d70cc2ba175386c30d9c.1695392080.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 33555d52-cf17-4fec-ea91-08dbbd921363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R/zhAvDxemq+nmRUFLJ677RmaIWP2Jj1dnNOZTVKtxosAY4QJiguFvPk1rZ5aUUJpKQ/EfFRxjC1nBlVtQIW26HmKMceBDHfBJ0ME2tQu5JdrZV1gVXByYNbaffEerh107YuROClewGUpLQ7YmTC4Hy3tuJFAMQCY+4PlGaEU91xhBtEEgZS4m++VOetXwbmL2qzISHkI3vqcc90qBt7crzXY35Oal+AyIB7TcTc5BdwZF/vDM5rpCM4+DkLnFNlh2sny5U0DYicq25O427wCoBoGaC3MNTHZw766P35pDReF606QTfalmkXYPBNdMpDhpBlKFLZGZ5sOlYVJznj29GwXLba/1Uj5OVRU/QV6rsZWbVBeAbiyIu8k7cSa0oOJmdA85LJ45s4achtcpjTypG37Opz+isTtUGH2wyraG3ciDlMmI2Boto2o/4oBapm3X63dwNSgZJsl0ybUXmgRZxXOEaZY1ug5qD0Nsdc506eSrN2sIk33nPsYjjU35l7BHgvoagmtVlZc2rBB3ajFD+ar2vGX+bLPU2jWY4wiCc9MGpPW03fysPj+DaZkOFWmhDGgoc5Wv7AS/DXs40/EDUPiB8v6dOcYAcM0DSHtTjaI06OfpzeIMCGl7Aie6lhCsZukCpM/YwyQYC5zPTVYvF/9lEw8+FNOP1ql00gMQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39850400004)(230922051799003)(186009)(1800799009)(451199024)(31686004)(26005)(53546011)(8676002)(2906002)(41300700001)(8936002)(5660300002)(6916009)(36756003)(86362001)(316002)(4326008)(54906003)(31696002)(478600001)(6486002)(38100700002)(6506007)(66946007)(66476007)(6512007)(66556008)(2616005)(83380400001)(169823001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2NUZjZiVkNXWGdBZDc1VkZoUU1hM3lQWU1vSHQ0QWdOSjlBTTRTSjlsSzQv?=
 =?utf-8?B?WEJ0cFNwQ2swYW84eVV0cFhYWXl4U2ZnakZjY2YyOHpodU5uV0xFcTBuSDlh?=
 =?utf-8?B?K21mY1ZnNUdrYkM4Mjc1NmgvWlVuelpocXpUZWdzZENEUzJweHFBNWJHditJ?=
 =?utf-8?B?dmFpNHJDN3V0VCtqbmlxSWhQVGZFVzN0RWRFS2V4ZEc3bk1kUE5oOCtHcGZF?=
 =?utf-8?B?T0NGcG80VCtkMWFKbVo5RTBNbEFOazJSblh3ZjhCVmxnaGJuUGttbzZONnc1?=
 =?utf-8?B?MmdGdnJKcmVFMUlhclI1UVlGakwyOWJMdXd0Rlpxck5HNXEwU0N6UWk1Wnh1?=
 =?utf-8?B?WVdwQmJyTVJKUVdnS1Q5RlI3SC8ycGhZMHVJUXNETUV2dm5uQXMzckptREpN?=
 =?utf-8?B?UXZTT0ZSbFg5U2RCR0M0MWZsRG9HQzFIeW55d2U5N1RJYmZBOGtFdDE2Vkl3?=
 =?utf-8?B?L0sycUFWbkx2UWVvNUxaVklhZ1cxeVZQdTJGQWpHVDNLVlp1Vm12VVIzQ3o5?=
 =?utf-8?B?c3dySEVaZFNpUzJ0N0dqdDBSU2Fhanl0QU4wSFc0VDZaVmhKblZCTURFWXpL?=
 =?utf-8?B?Ry9zRE85cnI1cnZRVzh3R05ZYlBjc3lLL1lmOXJoalBJSmlOcldzWjhLc3po?=
 =?utf-8?B?ZkF5WndMbVdrRyt5MVJTZjhEZlBUN29HYlp6WmUvME9wY1JIODY0amp0QSti?=
 =?utf-8?B?ZndZWml3ZzRubnorZWs5UjljOTcxSUQyb1d2SzdGem1xV3E1MUUzQTVUV2RH?=
 =?utf-8?B?c3JsQTkvMXJBcXZ5ZjIySVlpR2djMkI4WDlBQXNyMmhoV3VoMlphdlhCNk83?=
 =?utf-8?B?cVQxZmlPS2ppeDkyUmh6SUJRQzlNTWIvZHhqQkRaTWc0SFpwQ25JdkJjcmNV?=
 =?utf-8?B?N2N5T1F5SFVYazMyY0pxZ0ZnclNoTHQ2S3pLcHpIeVAwdFZxSElRUXFvQ2pC?=
 =?utf-8?B?c0dyZDdOM1E3eGl0d0s0cXUxd09RL2tCczhQMUkrdjNKZ0hhUzN5d2FqYlZk?=
 =?utf-8?B?SFY3Z1JLaXFMTzk0VU5wRVgwQ20zVVZ6OStJY09YTHovSEN4ZHdmTEpqVzRH?=
 =?utf-8?B?VFhRekV3SnpRbllUMDJLTEt6dCs2NkFFQURkSk5BaTMyaTNOR3lEK3dLNHFH?=
 =?utf-8?B?TmJNNWE5c1p3MFVRVU1vbEhlcXF1Y0RnWWNDUTg4Wk4wZnVsaE82WWg3Syt6?=
 =?utf-8?B?OE9KaTBZRTA1MFdRMXhQUm9oajdoTzhFblRKNFE5c0k1VEwvZ0IwbmtSRXVX?=
 =?utf-8?B?T29mWDB3cWE2VlpKNXprOUFNTEVndjBoZkM4eXBFSEN6bDNmVWN1YjJvQnQz?=
 =?utf-8?B?aW1TVEQ4TU9tbC9KazQwRnQ4QUJnYlhrMEpNdmxhTHdlUlJ5a01kb0g2UmVm?=
 =?utf-8?B?aVEyVkpEbnNpVHRwd09tK1ExVlhVQnVHSlZjVVZOTzFFRGlFd1pBbUlSdEk2?=
 =?utf-8?B?RkJuTUtDV0JSSkY4VjB6QThkdUZCaXA2Y3ZPTXdZT2dUTytBUklUNW91N3Zk?=
 =?utf-8?B?ZlVrd051REF0NWdxMDdzYlA5WjN3ZlFNeFJTbmZMTTk2L0dId0NoTjZCRkJi?=
 =?utf-8?B?LzJrdVZLZmRaWVRmbExGYmdFNzlvVHlRL2dUa2hBVWpBVTlxclo2VkdtNHli?=
 =?utf-8?B?dXZtZkJBaXdXSWlUTWUrbHh5Z3pUUVRYMUdEV243ZDJHVFRVblpGcWNNSVNz?=
 =?utf-8?B?c3d4U3pwc2pGWlZZT2VMaFhUZ2dMcjBBNjN3aUk5SzY1ajBIYXJGcTlZOWlY?=
 =?utf-8?B?Q2JZVUNKd2hURmFIRXlHTjhpRzBlUjVqTXViaW5vUWdnUzJqbUNuZk0yNnI0?=
 =?utf-8?B?alJ1UHcyanp6SE9vYWZIRTkreGVvSWlPaXJsd0NEWFhVempRSmlRTEVzZ0lI?=
 =?utf-8?B?UTNvaXgyS1VQWWlGQmRwbTQzTi91K3lOS0xEM3BlVzA4Tkc4V1ZKNTZ1ZEFl?=
 =?utf-8?B?bG94SlhIMEJGbndFU0ZVeGxvTUNRZmRXektJRGZ5cUNuZCtxVXI5YkJEUUh5?=
 =?utf-8?B?ZW9OKzhQVktGMTVHUmNGK0YvQlBGb1k2ditETkxBWEZIYkJaUTFOYmdhMERi?=
 =?utf-8?B?U3JUQzlsdXNVV3VJODF6Q3lZWjNBSU9zMFhZSjhuZ0krTU12WGZxU0VFOGVO?=
 =?utf-8?Q?+tOFUb2nYFk/ZiGiVegnF0tqL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33555d52-cf17-4fec-ea91-08dbbd921363
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 06:38:49.2263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsWPraU/GP0Z2Sm8MCTGRhSGwVdhKh/iMc9GvmyJ5afzt6a7D917MmDK3rtz2AGqvxQd8TwrlbA8VhqJcVCG7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101

On 22.09.2023 17:19, Federico Serafini wrote:
> @@ -466,68 +461,7 @@ static int cf_check pit_load(struct domain *d, hvm_domain_context_t *h)
>  HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_load, 1, HVMSR_PER_DOM);
>  #endif
>  
> -void pit_reset(struct domain *d)
> -{
> -    PITState *pit = domain_vpit(d);
> -    struct hvm_hw_pit_channel *s;
> -    int i;
> -
> -    if ( !has_vpit(d) )
> -        return;
> -
> -    if ( is_hvm_domain(d) )
> -    {
> -        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
> -        destroy_periodic_time(&pit->pt0);
> -        pit->pt0.source = PTSRC_isa;
> -    }
> -
> -    spin_lock(&pit->lock);
> -
> -    for ( i = 0; i < 3; i++ )
> -    {
> -        s = &pit->hw.channels[i];
> -        s->mode = 0xff; /* the init mode */
> -        s->gate = (i != 2);
> -        pit_load_count(pit, i, 0);
> -    }
> -
> -    spin_unlock(&pit->lock);
> -}
> -
> -void pit_init(struct domain *d)
> -{
> -    PITState *pit = domain_vpit(d);
> -
> -    if ( !has_vpit(d) )
> -        return;
> -
> -    spin_lock_init(&pit->lock);
> -
> -    if ( is_hvm_domain(d) )
> -    {
> -        register_portio_handler(d, PIT_BASE, 4, handle_pit_io);
> -        register_portio_handler(d, 0x61, 1, handle_speaker_io);
> -    }
> -
> -    pit_reset(d);
> -}
> -
> -void pit_deinit(struct domain *d)
> -{
> -    PITState *pit = domain_vpit(d);
> -
> -    if ( !has_vpit(d) )
> -        return;
> -
> -    if ( is_hvm_domain(d) )
> -    {
> -        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
> -        destroy_periodic_time(&pit->pt0);
> -    }
> -}
> -
> -/* the intercept action for PIT DM retval:0--not handled; 1--handled */  
> +/* the intercept action for PIT DM retval:0--not handled; 1--handled */

If you already touch this comment to remove trailing whitespace, it also
wants its style corrected. Perhaps okay to do while committing, so then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

