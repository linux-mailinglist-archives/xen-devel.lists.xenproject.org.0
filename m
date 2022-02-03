Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABABA4A8123
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264542.457658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFY8A-0002Fc-Ml; Thu, 03 Feb 2022 09:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264542.457658; Thu, 03 Feb 2022 09:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFY8A-0002D5-JP; Thu, 03 Feb 2022 09:10:18 +0000
Received: by outflank-mailman (input) for mailman id 264542;
 Thu, 03 Feb 2022 09:10:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFY89-0002Cz-3k
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 09:10:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19af28e6-84d1-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 10:10:15 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-NCXI3nVzMH2Tj327H6NRTw-1; Thu, 03 Feb 2022 10:10:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2496.eurprd04.prod.outlook.com (2603:10a6:800:56::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 09:10:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 09:10:13 +0000
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
X-Inumbo-ID: 19af28e6-84d1-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643879415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NmLh7X+2qGQ0pCnHnLln80ApoN23mns1vRmFb2h8Ww=;
	b=UqS56v6ftYjmHt1QDkvSICoBl6hY9NV6I0ghTfvW27mb64GqGOV1EIv/Zdk4Cj/njrtsBS
	2oDl9mrC0JXW8V6uyCENTUzIoH2QqJtquoOLEwQ9eHHUZDWYQmcw7y4It93eUqhvn/e0lC
	ey5v2kAMj4p3M0Ao7qH+7USR5PY01u4=
X-MC-Unique: NCXI3nVzMH2Tj327H6NRTw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itxHsIE9hu8Egw/OVj2gqQAgl3Up5WK6edV3z8N6YoZXxXMliiRMlre/laKWqfea5Fc23an8dCwSv9ESBYkOaSzUlfSsKKaHBqFbBDQ0Y0ZU1JoAtLAaC9QuozSY1I8NG5dNZECNga/n/VA+rllHUDXwqWtClI/pEBtDFN7QQ89qZFeLEm/ImbtGPeKMFXJ8g4PGnet1SRaojvPJ2an8rPBaTElJTYiYqREoRW78y4060T/l6sl9W6+9RmjJ7bBvxU+v1pPUTf2KVDMAXQFwB5vGNEOv4nTliDCVg5IGaZcatY/wi0pag9QJTkWJqJJ1R7VGuVPZQAsBxV9oeqci8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NmLh7X+2qGQ0pCnHnLln80ApoN23mns1vRmFb2h8Ww=;
 b=cTz0BkG9rdegUwcEvfMxn24HFJveRYT7NAjoApfXP6hc64w0+AGG7Z8pSdG2mGKnMk9pedTY+X3aIbTPqXoE3l3W4jbaK1A5l38GKUEIbfo5ou5eop2SNJyY0Phv/L30ubL8xE9O5tPLtjIA3gZ6eZ30gYgO/0hzz/JoiGicoqVu+irBUf7V8g5aWR2zNB4gQ/saA1DSA8sO4wgYQdJGwgzL497H2t87USRicG1UcCBR1BbHN2DNmLFqvcPWdUQNLt7qRlXrr04P/M7za7bC/0OyeqJvdsfOkJpUI27gCRSuuwmW0aEwBtc479sb8Mu4cui7eX0AhiXc8ET8KTWwXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c3c7da6-0239-1999-3cb4-a5f49745c6b5@suse.com>
Date: Thu, 3 Feb 2022 10:10:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen: add option to disable GNTTABOP_transfer
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201090239.32067-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220201090239.32067-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0308.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6013bea-4496-423c-c804-08d9e6f4fc3d
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2496:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2496A0568A6D4D93BA5159C4B3289@VI1PR0401MB2496.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T29kQsARNbbGdtP41vO7YY9gULonlP8nc4Oj2PkbTsnoNp2z9lA+r4yPK88Nk9Dk235O1qsoBQPZquu9UgtcOrS4NiNN1n9TUsqD3fHPvykUMu3K4JOEFt86cRdDmuDa8r6Q1P2c/L4+qbErXz6XHcF7EXLpFygbFXkkY3mZTipUdBNGOwM069ZKQwg3mGyeoPcXaDhrZeKy1SicDJJwH+IXdKQ5zVAzU15+QukqmzL5V5rk19sSXsiTLuVvVZVr8ME/Pi0TZUHtVLHkLYszsQHthOY5Vxur+sjHYCGWK8ZUBuqVvuGzSVNAFU8bJk8Vxt//56X5STAMh0cm2/NK7Qg9OtvgYIDh5HrxFnfsVLGmn+49t41bjqgx10md6JAuTL1f6xAkMSSHarFfHw6DPTE58XLAUHSOZjs4vtD/QM0xhyAY816XY5CjvP4IwFD6EppkHC4GD1oE0AG6cFvLtC37PAYkVuelXRclOMScd5NHOMXSKa6BAG0j7rFzuGR3JIE/8N8jEpc4ky+NuyWp6GN/aq7qx2qjh7hyC5BaFujyAob3wu2zGIkNlMoUlw16MnZuI8FooeUceQoYI0JXf+SvRjBolgOrUW6pPOoljtUJM7O4tGFCjkFot8VCcsTrHwdGoPqWw/kqk0phY3WHcX3mv1QsSo+plOkNU3Sif63WcADei0jDPjrFzP2mv+Twomst3BcLjxWRNAvqTdTxnpsSAajt2KLpS3nMiKOCKRo6Az7PQRIxG+k72oVuDWRY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(31686004)(54906003)(5660300002)(6636002)(37006003)(36756003)(83380400001)(508600001)(2616005)(38100700002)(66946007)(66556008)(186003)(8676002)(26005)(66476007)(86362001)(31696002)(6512007)(6506007)(53546011)(2906002)(6486002)(8936002)(4326008)(6862004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFNOZWgxc3JZSjdaNitmNkR0VHdPMTlJUE4wRXFTL3FoRm13azF0OXBLT3Uy?=
 =?utf-8?B?ckhVVUd3RzdFaW9GdXl5MTdxTnBVQ1NhbVRuVWwwcE8rakZ0QzRyTWJmZDBl?=
 =?utf-8?B?NnNzL1JpTXJIOG1wMDlhKytBVlo3S21PTERyeHNiWXR6bGdoS1JpR0FFS0w1?=
 =?utf-8?B?LzhJampZektFWW01bm90dmt4UkNFY2VrU2piMG9lOGRaamdNL0V3emV0bWRE?=
 =?utf-8?B?bHFNSGp4QzcxODJjTk1VcmJTaE1EZFpUZTdmcVlZc2ZRWXl4SE4xTVdQampW?=
 =?utf-8?B?d2NnbFIyeDFTZzA4cVlUcnNOYmM2QTlQYnEvcFl6cEhpMXhNNVBzNThOSWJZ?=
 =?utf-8?B?VzhDNWh2N1l1WnhIWkhoMlRtckRhZk1wU1Flb0xsTXFabjliZmRtRDF5MzZ3?=
 =?utf-8?B?S2E4bHRsd2dHZVQ4ZlJadENqeXoyV2VPak5DSHhwekU3S2tYejl2bXcxdGVQ?=
 =?utf-8?B?UWk4NEVLVE4yeTBlNldlZzBDNnU2ZGFUU2tzakxaTTZ0bDhHbStzNkszVE93?=
 =?utf-8?B?MVNiVzdabzZtRHVNMTJaWTk0ZVAvUVZKdTFFYVV5bWVXcTJGNmppODRPQTda?=
 =?utf-8?B?cG1sNzlHZDg5MVVnd3RkaTNXOUFhamhFKzVoaGd2ZEJKUzFpeG0wZ0ZsRHd6?=
 =?utf-8?B?QU9LUU5DaU5pYm1mRFduZGtPSkRRR1dvTDBTVHV2L2Jpc1BqRVdpUHNpampW?=
 =?utf-8?B?Y0NhMXRZS0JkTXVQa1d2cWJtVmY2Z0ttcXJNaUpNQS90NFhFa1hCcWRQV1Jt?=
 =?utf-8?B?TzNLZmRoOUpzZnhWYlhTRlVhSDhZM3dNWVdodTgyaEJwRjdNNVBEV3Ftd09x?=
 =?utf-8?B?dzRMS3piRlI3d3VteUJ6NFUwMk5MVkhLRC90OW0rdnU3VVQxejZZd2UvNWxD?=
 =?utf-8?B?dlBhOUgvMDc3dS8yam83cHFXUHpmY1BPckRYcS9JMDhwT2tHeFZWTm04R2xL?=
 =?utf-8?B?b0I4WERhTTJaWkZtYWpkRDhFQjc4ZENWZE1WMHVFaUV5S2RFdGRDeXFqdnFY?=
 =?utf-8?B?ZkRSRStZOUtxSmdOZlU2K2ptSFN0Z3ZydjlabnpkSGh5YlI0WSsxOUoxZWUw?=
 =?utf-8?B?ZDM5ZW4xZTluOTdXUWpTYTFaNFhPTVpkSWxYMWpzWHhVS3NxQWsvR2svZWty?=
 =?utf-8?B?VTJmSGpYUTJhTlI5bFVIbWF5L0xOUGNNcWxJbllJcU1FZ2ZiaGNEZkZUR3E1?=
 =?utf-8?B?aEI4N2RVNUNuMTFSN3ZVbUhiRkxPU29nSmoxNGZ3VzVERHpma1Q2MWY0ajZN?=
 =?utf-8?B?UVE1RFFoVnRhYSsxWUNVUjJIdzBxN3hvMXplS2VuUk9HcXppYjZXTWVqVjR4?=
 =?utf-8?B?VmdxeDEzRlpkaml3WVFTZHptQ3BDN0Q5cDZUeHJCcXNHUC9BL2YvNDlLcjVL?=
 =?utf-8?B?SVp4S25uUUViVGF0VFZOZzZWWlhCWlQrcmJCREFLZDhlNkZuajdUdUpEM2lm?=
 =?utf-8?B?WGlET3dMOStlQUZZdUZjQ0UwbnpYbVpDYzdaVWI4WTlzejE1NlduRUQ2R0U1?=
 =?utf-8?B?ckxpdnR2UEpxSC9VQ2NLaVoxeEhsTjZuMXZSRnR3OEY0ek9WYjBwVXU2ajBr?=
 =?utf-8?B?ZFNwckNkUGt2KzJ6OC9UU1pRZU1vUGRidUZTakxOMis1c25VaVcxTzZRamV5?=
 =?utf-8?B?NzNYQ0E2Qm55SDlsQWRVSGJGdDBuT3Fhei9Mc256cTZLQ2pKdVRFRDgxNzRL?=
 =?utf-8?B?SUxvZUttcDEyTS9aODl1aEVKZ1U2VkhkdlNkKzdZcmd3eHFzamVwZ1V5REww?=
 =?utf-8?B?UnR1R3VIakpteE00QkExRUhoTFlPMGYwOUltNElGSTNjTnVMRmhSR2N3YjBy?=
 =?utf-8?B?ZXVqWFgzemxBOXVQV0dzSVQ1d2liUG1Hby9iUWZ5c3lETGZVMUpnaUdJR0gv?=
 =?utf-8?B?YWMvbmxjU1h1T21idjM1aGlMNlpGaWZHY1kwdnhybm9TSWxMRXcrUXB4bkl6?=
 =?utf-8?B?eW8zVEx2K2pOWGx2ZHlnVktjM1NYbXJzWW1HbDBvWkNTREoyaURubUhGRGdl?=
 =?utf-8?B?Wk5LcFRVL1dEQ09YTzh0azc5czFaOWxtTTZWVFQ2dXZMdjIyd25pWjFYc2Fx?=
 =?utf-8?B?dnR1Vk1JbWxRY21VQjBOZ2x0QkNKWU1zQms1MXhEQ0JzQWxBVmw5VXErUnkz?=
 =?utf-8?B?aTNINkI1Vm1SMEo0d294V3Q4QVZEaDRoWHZXRzVOT09LOGZXOUttVU1xZFpp?=
 =?utf-8?Q?t4JEcQUdwEy9VG8I6hD2S1U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6013bea-4496-423c-c804-08d9e6f4fc3d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:10:12.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6/P+xGivlO4/mvX/Z0VilZn5v7oEYFolyRm428dCW7kynBQannZUedr8wLab9yaPOY7AqP3TQ2dG3gv6Undiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2496

On 01.02.2022 10:02, Juergen Gross wrote:
> The grant table operation GNTTABOP_transfer is meant to be used in
> PV device backends, and it hasn't been used in Linux since the old
> Xen-o-Linux days.

Kind of unusual spelling of XenoLinux ;-)

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -181,6 +181,7 @@ static int parse_gnttab_max_maptrack_frames(const char *arg)
>  
>  unsigned int __read_mostly opt_gnttab_max_version = GNTTAB_MAX_VERSION;
>  static bool __read_mostly opt_transitive_grants = true;
> +static bool __read_mostly opt_grant_transfer = true;

If this was conditional upon PV (with a #define to false in the
opposite case), it could be __ro_after_init right away, while at
the same time allowing the compiler to eliminate gnttab_transfer().

> @@ -204,6 +205,8 @@ static int __init parse_gnttab(const char *s)
>          }
>          else if ( (val = parse_boolean("transitive", s, ss)) >= 0 )
>              opt_transitive_grants = val;
> +        else if ( (val = parse_boolean("transfer", s, ss)) >= 0 )
> +            opt_grant_transfer = val;
>          else
>              rc = -EINVAL;

To possibly save a further roundtrip: If the PV dependency was added
above, I'd like to ask to follow the model of parse_iommu_param()
here and use "#ifndef opt_grant_transfer" around the added code in
favor of "#ifdef CONFIG_PV".

> @@ -2233,6 +2236,9 @@ gnttab_transfer(
>      unsigned int max_bitsize;
>      struct active_grant_entry *act;
>  
> +    if ( !opt_grant_transfer )
> +        return -ENOSYS;

-EOPNOTSUPP please.

Jan


