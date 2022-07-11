Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E771E56D4C6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 08:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364833.594771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAmy4-0007GQ-DS; Mon, 11 Jul 2022 06:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364833.594771; Mon, 11 Jul 2022 06:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAmy4-0007EM-Ac; Mon, 11 Jul 2022 06:32:28 +0000
Received: by outflank-mailman (input) for mailman id 364833;
 Mon, 11 Jul 2022 06:32:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAmy3-0007EG-L1
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 06:32:27 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50057.outbound.protection.outlook.com [40.107.5.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aa83b68-00e3-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 08:32:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3694.eurprd04.prod.outlook.com (2603:10a6:803:1c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 06:32:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 06:32:23 +0000
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
X-Inumbo-ID: 3aa83b68-00e3-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COuPCYtfXJk3AEbDobTkJmFpM5jjZRFOOr642elFGP+8bx1AJm0D7+ZHZPDFsc3ABKLWQXsBTJiU7MGaJUE43PUs2kA0gj7C7w4P+TCXwITbnw18TVPpfCLk91Zi1cHuxiK/RzjVRiv8tkcNgKujuRl++1S0zzDYH1avaFfgWysNCo1KWvIw/Nc/2UBGAi16BbkQuveioY0YyPKMnSrsN6s/ZSLHxwnTMpc+n0nlmnIL8UFHgCgPLVzBg2Wrz5tAxdPdnJZooPeb7Rz4IMVRSGQOJ64OULxg3bEW7A3qBIqbLIu7uh9mHm3ywrlSukOlMo2vbz7VlkhZL8S8ocRzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5v0hQa6b7GiCLPmZm5YtHqd20yvQvIonetEoOetWwQ=;
 b=bB6rQF5T3y198fTkT1mHsWd/KGacxu4RPHcstWdgMb9qH8y5NZVeyOjUidlobhs0avtLf9GPh3nJoPKIzg9wrwOknRNm7uroT6DJ/y6kRUDUfRYcToGQJeAyCDql3P1xWD9Ns+i2KsMFWSvEQC54IfdUq3YzuFw1XSqaSCJ/ldG6arAiVyh7vffANRppgpAQGBwHV4THAxfn0C1+fMn5hrbBqkjAzqPQZMvOH8hfDwDgiDiz5mSE7Zaeheaor+Qpu3DdvtiMVvOdCHsQuPP1MFkOCoAhYylW3HsrLVWg17qxxo2tMHFjkHsXGeo5wX3BLjhcTeBXCumn4RrQE754Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5v0hQa6b7GiCLPmZm5YtHqd20yvQvIonetEoOetWwQ=;
 b=uRzWrRgYj0894A71lRHM6G2/uBQRZeZiHIe8/+fFsnVlQnOKNTk2I0wQFqavSGAEoTv7mYf7h9s3JAKRQ5Wgt2YhO44ZQhDshd3PrnuEp7pXTgfSN66T/k58qmODEe9HpgZU1o3JV7z6v82Xs/jk6sALs0Q6CPSIGuwIsGg5z3rUGaUPK0uQcIOcEpUmFXIgHl7nArI+XB9X+wnfx92YAE9VQshBs5Oyvthx1HKoG9B2SA8rWMNrEzEEDggQn7hAtElLApqFHxq5LiVeYeWHjtb2Hy5hm/HLALbvAVmHlPPhcXI6gTcYPWnbxVXQlAdFLtA7gRtZVAGaRNdqhp6pgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b1b2694-d46a-7713-6109-99c98fdf6b8e@suse.com>
Date: Mon, 11 Jul 2022 08:32:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/9] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
 phys_to_nid
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-5-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708145424.1848572-5-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0013.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72466888-c4e1-4cd6-7246-08da63071d33
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3694:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K7grbAP7A4bvrZaCfVifFKpuw+LsZd4Q06IKjJsOBD4L25LiltdcKyIt8vWexS7XaCvZwHREgXhbnctJMQil2P01PF+cxSn7w2XZndnJs0wIBOI8U6FmCGLZKOmAqWV9THLzwRbBM7DFc8QMKSM32WbQ3d6WYb69R0vflIj5IsZ+BW81ZIvgTlsHxhcdNsAOA4crYGeY6Hz0aGYK9is8IWVb6JirHuj/+xACkLWZT3hMD/+z1lg1fmdaKF6at86y8zX07jYYsMnuDDGQlFmR8QI86LolZlztkBMCsXUTQE46FM1ipRN3mWA7HIeCtcaN/au91Jj3zlEq0qxvuls40OrXBT598s5BZKRC56bAXG96GGao1s5zwA5dztkfSr+TQqcy373aLsN65KZrBD+EX+0lmGl7XtaSXLy3QYu774hEFf9UNldPdvLOShrg589o1O5BP2P4ifl24+eqXOQM+P6Qhh2bZMrx4easCxIlnHlveS5+ecktrCDi0NQmvzSn5S46VkVJagXWA3lrZvPToNcvFJaLKEeNvXoQKnbjq0THxif9oMUvDU4WWnGeNuzzSQRl51ZxYI/O0kPhA+0sc6rXP5pWYOsMi6h+6IpkrEE8tWFnhhtS9YDRB4PYg7W6cdfI3SM86QUBSK6iEceyxETClVudRqIoFaqLvNkorI0IZ6Q85VxeO9kDOTBMZ/iSk6TQvWOnqyTJLkcS29HTmqbyTDsC3JEzIvgyiW3j46XHenTqXKIrNgWkQcigt4FXf05h6KHVoCzFQwVf1+2AJSSQBbfUwMwJNW17VbDRuU5+H6+C1OQa/yw2msTa1EvNxOwf3F7QjBXucp1Qlikg+4/BOtN74JK1SMscBjzTp64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(396003)(366004)(346002)(39850400004)(5660300002)(6506007)(2906002)(54906003)(316002)(53546011)(6486002)(6916009)(31686004)(478600001)(36756003)(6512007)(26005)(41300700001)(2616005)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(86362001)(38100700002)(31696002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mlpac3pVL1JKZVM5YXQ5VStSczdWVnkwREY1c08wQmlsSWV4cDRNRXBMM2Ey?=
 =?utf-8?B?aVpEd0FjTUoycSt1U2FBL09tM2FIa3dTbU5tYy9ObHhVTG82MTBVd3JYdUNL?=
 =?utf-8?B?aDVLWVhManBLMy96SlIyeE5RM1hDaUZXcGlxWXo5TVZvZkZMMC8zM0Y1N2RJ?=
 =?utf-8?B?dFk2QmdIaE9jcEFxc3RzU0xGRlJONXdPRlVWa3JOckNlS2svb2lWYlpEOSt0?=
 =?utf-8?B?V1ZFS2J6T2M3UTFMelpsbVpHNWk2djBkU3pwcFpDWmRuOEM2eHcxbFJ5cFVy?=
 =?utf-8?B?UVRuSzFScjFkRlBpWC96ZExHSnI3OTNaMU1zeXFRTnlrcUVCemRqUnBuZUEw?=
 =?utf-8?B?V20zeEpINzg5VHBHL1MxajNBMXpHcUlMNFBxZmpmYWM4RWFiK1F6b1pRSWZY?=
 =?utf-8?B?TU1xNm9scVlDMTlYSTRRZXpyUWJkeHY3a2dJOHF2eCs4Q21Hb1Y5MzEvSjI5?=
 =?utf-8?B?YktXbTVLNi9ETnR4QVE2dHVMUWhOMzFHSC8xQUg1ME53VFZIdkR4ZWViYld2?=
 =?utf-8?B?ZEZXSGJiakg4aElZalJiK01HbGthVDNOUjg0ZDFKejRIUHYxR0lCcWRxVFpK?=
 =?utf-8?B?SDN1VHRmM0piZThjT1Z0eGtrSENFS0duSG03bW1qaHVWK0IyVWpweStva0ZY?=
 =?utf-8?B?bUl6d0QyVzBNdGpKTmdiMlEvV2NoeVNjWkVIWWcybGJNRC96QXh3aS9kTU1p?=
 =?utf-8?B?YzRLNDViTlZ2WmI4T05oZmFFaFZvM0hMYUM4Uk9DVHR3b1EvWXJ4djA1RFhL?=
 =?utf-8?B?SkQyV1pCeWZpYloycExETUQvZk5HYmhCYzlOamNoTjlxUnBIV0hJSThMK3Yr?=
 =?utf-8?B?T2FOV3NFMityaVRjKzBSUElKVjZ2U3J3MXhlQ051WVYzaXpDa2FMYXBlUHE2?=
 =?utf-8?B?Q3NFUlgreGkxY1plN3BhdkNHSGd2Z2RvZmVvVlU1ZjBSUFpROVU0VFJTaDFK?=
 =?utf-8?B?R2RDOFVTNkxaeExNazB5YnhiLzdubWZhbHdWTmtUeWhabDZhK3FUbTJWMHFi?=
 =?utf-8?B?WnNpSUNzUzJVZ0pXemJzQWNNekZ6c3lRRFo5cGpYU05sSXhUbXlpUG96T3ha?=
 =?utf-8?B?bkVPYlFPMWVZYW13MHUreFRTd1BsK2lMMk9LZXNVVW54SHMrTWNlQkF5bVIx?=
 =?utf-8?B?WWt6Y0Nld3drenBUSzcxRno1S0locXRCdUZRcW0rZ0hQd2ZscCtrWTJHSmF4?=
 =?utf-8?B?OVQzU3h6Ui9DVG9OOU1UaVBmRWcyRFRFaGZaYURzQ0lIK3lQSllyWmowakNx?=
 =?utf-8?B?ZlJqdXUyY01QRmtJV3lONzk3ODJFNVNLaTlGaU9jY2Vkbm02Q3ZsSitzaW9r?=
 =?utf-8?B?L3p5RmxuaG9yL0tHMkJPU1NrZGhWWWwwOFNvK1NJQlp3dklrK1NrcTFnQzdi?=
 =?utf-8?B?alRaRjh6V1k0V2NoNWszdXJDTlJvSzI0UVdNUXlGbFJNSWpxNkllNmNuSUNS?=
 =?utf-8?B?NmtPZEl6dGxNUHNNTXBUc3NTeDBraGxTeGdyZGNFTzBCUXRQOTllcTE4Ylh4?=
 =?utf-8?B?eEh0eTJWVXBIWUhUenE1WHczN2s2cnJFK1hEalBmYWhaeTMxbnN1NU9LYkl2?=
 =?utf-8?B?ODNDMDZRUGhrbmd6alhCYmM5WkNCcGtINE1JYklsQThXRkFTZWZtbU9nS2Yv?=
 =?utf-8?B?dFkrNnd0amxhN0F5bmJsWlJrb0pKT1BTcUl2VG05Wk04U2FsbFd4SFVRQllJ?=
 =?utf-8?B?RCsxd2hCNjB3ZFRKRm9WdjFpalBIOTh0VjNUc3hQVVVrcHk0THphQ0s5cS9Q?=
 =?utf-8?B?bFV0b3JKd0J1QXlIWFcrY0p0WGwxRVB1OEplVUMvMnpadXBKZXJDWDVsK1RT?=
 =?utf-8?B?alJsaFVYdlh0Tmt6S1hidFVTUzh0VUNqSHFOMVMwRWVJZkxJOGllVWVrQWRH?=
 =?utf-8?B?SUlFM2tZSGM1YWNHZXE5a3hpY3dqUTVTVll5b2Q3L0lpTjlQMnhkOHcybGsv?=
 =?utf-8?B?bk1rT0J0YXF2a3lvRVdCNjF1enhTNTUzOXRqK0cvMkFVcXg5MTRONU1oTGta?=
 =?utf-8?B?cDVmVkVDc21sMzZicUhqdUxOVUFqcjZ5MUFpbE5hT1B5amlSWFE3Y24vdzk2?=
 =?utf-8?B?K2d1bkdUeWxFUnppMkxQOE00RERxVjVsRW1VeUM3S2RXcHFXeFVOalVIOFlq?=
 =?utf-8?Q?0PME7hZTI/I+roPXlc6RAn2E7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72466888-c4e1-4cd6-7246-08da63071d33
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 06:32:23.3584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nupFVctiS18Jub/ZTsuQPGXADI7l4cPUlpTM2cclrDjwJ7jsh1PatV/rhv4ZHWBKUMm8omnkOL025+87i6j98Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3694

On 08.07.2022 16:54, Wei Chen wrote:
> VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
> results in two lines of error-checking code in phys_to_nid
> that is not actually working and causing two compilation
> errors:
> 1. error: "MAX_NUMNODES" undeclared (first use in this function).
>    This is because in the common header file, "MAX_NUMNODES" is
>    defined after the common header file includes the ARCH header
>    file, where phys_to_nid has attempted to use "MAX_NUMNODES".
>    This error was resolved after we moved the phys_to_nid from
>    x86 ARCH header file to common header file.
> 2. error: wrong type argument to unary exclamation mark.
>    This is because, the error-checking code contains !node_data[nid].
>    But node_data is a data structure variable, it's not a pointer.
> 
> So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
> enable the two lines of error-checking code. And fix the left
> compilation errors by replacing !node_data[nid] to
> !node_data[nid].node_spanned_pages. Although NUMA allows one node
> can only have CPUs but without any memory. And node with 0 bytes
> of memory might have an entry in memnodemap[] theoretically. But
> that doesn't mean phys_to_nid can find any valid address from a
> node with 0 bytes memory.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Tested-by: Jiamei Xie <jiamei.xie@arm.com>
> ---
> v1 -> v2:
> 1. Move from part#1 to part#2. (Comment from NUMA part1 series)
> 2. Refine the justification of using
>    !node_data[nid].node_spanned_pages. (From NUMA part1 series)
> 3. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
> 4. Adjust the conditional express for ASSERT.
> 5. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
> 6. Use conditional macro to gate MAX_NUMNODES for other architectures.

The change looks okay, but can you please clarify what these last two
points describe? They don't seem to match any change ...

> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -36,8 +36,6 @@ struct node {
>  extern int compute_hash_shift(struct node *nodes, int numnodes,
>                                nodeid_t *nodeids);
>  
> -#define VIRTUAL_BUG_ON(x)
> -
>  /* Enumerations for NUMA status. */
>  enum numa_mode {
>      numa_on = 0,
> @@ -77,9 +75,9 @@ extern struct node_data node_data[];
>  static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
>  {
>      nodeid_t nid;
> -    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
> +    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
>      nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
> -    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
> +    ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
>      return nid;
>  }
>  

... in the entire patch.

Jan

