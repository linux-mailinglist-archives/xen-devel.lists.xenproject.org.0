Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A62674D4CF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 13:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561185.877578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIpQw-0007m7-5V; Mon, 10 Jul 2023 11:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561185.877578; Mon, 10 Jul 2023 11:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIpQw-0007j1-1k; Mon, 10 Jul 2023 11:52:02 +0000
Received: by outflank-mailman (input) for mailman id 561185;
 Mon, 10 Jul 2023 11:52:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIpQu-0007iv-Ai
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 11:52:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe02::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cb97f93-1f18-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 13:51:59 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 11:51:56 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 11:51:56 +0000
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
X-Inumbo-ID: 2cb97f93-1f18-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUp1vnPT7Gzw2pffk/oqFMDwfBBHsDupRaOHBAFmjes7++UpwA75OB6SwobokqDGT3C9QmH54CsBonXSiPxJNSfBWHj5+6Y/KG6SW1NcdPlRg6ZbzcAzadW9hu4BzyzhtuczIBYF0qbvWm8S+po/aYUBk4a4sWXOhR+t3WBWAJftJH3V0kvj6plLP+LQWf9fplVde6a/L8YBFWAxa7tSC+tfrfVhLBlwoYggGhgS0Odv6rV7Aay0YY9ltmsMWvnnvNlLdBXWySr7LBaUxHdluHj/GFDQGM5c90zBqZwdXNrkfcbUZGBkoInZiKP7t4XMc3qVDMwIZNjibWzQfF3sYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXqRSPuEn9NmTOcM5BTOAkkX6gjPDFKMEUFikV9xPoA=;
 b=CZwUgcAnhoTZW2vgUnzzl5HNptjDMDh0yY2T9j/GF3JFtUcgPHLaYgtHaOuUP2/FsSX8MLbiV3TMRMGKAxkP87vOzX6F1HgGARmwtZfLV3kqzsmMT+a/u8LggayhVtj6m8ThvKGSSJddC1mNQXN7tv9QBtLM+y/uWBRSvIfjzKFksVEwlEm3U+wIKK5213T7uTUGTYMw9znfINc7S1YHe9Bqj3gwRx1gPXH7FUBUw7lg9RKUxWgpGnWBagKY59g0BiO2m4C6te0++WkcASkdRrE6xjJiXvC/zYY37jbDPl9g7PLQV/SiSZ4zNF3BB78KEvjqBzr3BZN9VAklVQdvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXqRSPuEn9NmTOcM5BTOAkkX6gjPDFKMEUFikV9xPoA=;
 b=PkLb9OhKRr4/pCOrtFkwij6Ym8yvVjiZUC/UErFXNEniYRA0SzetnQFHs5YX5D+1ncVM0sAHGwM0glnJDA/7oOWkMYT7651R4F3reOQhSyyLuZzdOVVDc1JQTVWrmnxHdKddtSXH1Iu3m/WxU1yV060uRm1MVyQuSv7jk/XDoGsjPsWBZtqK3+kI66+JA8+lcTiJsrkm6iAdTZnN9Ehr9yjkHUrjhch675m0UsvxShquYYs4fn/W40ybQcYCa4uZ2ojXunV6uy9BNqmEtXZolQvh4pL3lryU/KuwKafjz6cGTr2ozftYztp6ytG4Sg6vuSoTQ0eD89it/JyVvaLesw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3695b109-f082-7612-f9c9-fae8143f46e3@suse.com>
Date: Mon, 10 Jul 2023 13:51:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 04/15] xen/sysctl: Nest cpufreq scaling options
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230706185440.48333-1-jandryuk@gmail.com>
 <20230706185440.48333-5-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230706185440.48333-5-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS4PR04MB9621:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e41f69-cfd2-4943-3b99-08db813c0fde
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aO0mZmGH96kj10bxTc7GUVt49GUFd8VePLHN2Cwy0Er2gFjGOWgEdJOeBT15huUsJ4TOJkEG3KD5kWaPvWhYNUozYlyQw75o2dfZaD9gmBq99qJkrUmSyTgIgukerDlBvSowZCijnz9gDqYUd5GXLOMyQEpQiDumQ7Fv8P8SXN8hYaG6R53zS/Lfubd4Q6c4ldBprkxPnyMlg+90G+dGkkbLuV4L9WWuosxreCUN8Goqd8xQLVcdIFeyCNgaCeSuASKyUrHNuUTfsAqh8rTNglqoeN2EwRFPAA+pR7t0guJfbbAoFMDmiBVjDD96PVxTIxN9z7AkzQ85Cuwssn0xWNeQfFQVldWXdGU7yKL/tROQ44CGZHQMvjUu3GGuY3wY3/yzPxsaezmVdEwP81Eglkacgb0VeAAWqSGs/2zB7R2wprWu7kEOkga0KkekbJakxpwRkUsAHIH2pRb04q4IGmbXYgmUMELAqP//ty8knjJ8EWaaJjO18JN+6sprqo/VV9YGhtGlDwOXF2KiJ8A6+gz3z/K/sibOlyoJ5LS9r25+q2iY8riqCmFWpbl1i05KQTU12rzq0ZfYdo3FZ2IbA/jS/vmewA/9VB2JRkqMVwbgCnaq/a7cTR7l3BFP4rnZWD3F1L0FxBZ69CEhv3yPwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(6486002)(478600001)(54906003)(6506007)(26005)(53546011)(186003)(6512007)(66946007)(2906002)(66476007)(41300700001)(6916009)(4326008)(316002)(5660300002)(66556008)(8936002)(8676002)(38100700002)(2616005)(86362001)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTFLZHB3VUthVGhEYXlNVDlXMmJFRy9xeGhUSUVHdDlvKzJQUmNGdldSbHRk?=
 =?utf-8?B?V2FyTTM3czY4TkxNZW5vSEhad09uU1RMRHY4RHJQc0FFWFpmV1JGZmpueEJk?=
 =?utf-8?B?cU5xYkhYbWg2WkZ5R1VxTWhaZ25NTnNPNDZxdlZCRnF0UDBwc3lOYVNXcDlr?=
 =?utf-8?B?emdKbVV1T3hIdjFaNU4vS01OOHFnVDQwQUVLakZXdXk0ejFPNjErbWFmRXlS?=
 =?utf-8?B?NXc0Q2ZNREZYT01GNGdYU1E3RjdvekxTQXptaUdLTjY0aGlxQ3JSUW1NNGR5?=
 =?utf-8?B?N1F2T0grRWZoSWdnWWpuSENReUJrb3JlWlErQ1JIOUFkQndSYkFvdVR4RTNk?=
 =?utf-8?B?S0JzcXA0SlFMOG1tVFc0c1NJajJWQ3BTVGoyd1lMOUhzVGthdDRMNTRzWGR5?=
 =?utf-8?B?anVHWk93VjNETUJEMVMrZXRiQTFXUkc1a0FzdHVadnFqNGhDdERNYi9OUlBw?=
 =?utf-8?B?bkRZWi80OC9KbVdra0JuOERMTzBZcGFHR05VcXF6UG1XVUJJVEw1QWh1Umtv?=
 =?utf-8?B?L0pBbmd1V3NRUWFXUlRQZ2pLcVZya0QzMEFORWZZc2lWVlg3YmF6QlFaS0RO?=
 =?utf-8?B?UzFaL3hjVzFHTE9jUmtSbys3TlJ2dmVWY25NMDd0a0ZXbFRjei80RFZQeDkw?=
 =?utf-8?B?akl5MGRQcHowUUxkRkRZS09yNkprZ1NnZmRQb1N0clVzSi9qOFJBWVBoSUZ0?=
 =?utf-8?B?WjJFOWF1SXY3dlJKV0JPSkxuY200cFlhbEVYRDd3RDJmQ3ZHblhTc1RDaDBz?=
 =?utf-8?B?QnQycnBIcnU2eEdJSTE3TWZyTzZEalByODZjWlRMV2Q1Q2FhcVZrVURqV09u?=
 =?utf-8?B?VzJ0YUdCamwrZTFvRDF0QldTdzhNNTdjV2Y5UkpFeFhHTjdRL3Z0L1BFdExS?=
 =?utf-8?B?YTA1L3RWcDUrdEhITUhkTnVsR0l2cjF1MkptT2VUMDR4d2hqN2I5M1hoNjJR?=
 =?utf-8?B?d0lUUEZ3VTN4bUFUTmJHVGYxSE9QbWI4cEMwZ1Y1NzZhYURHMzU2Rm1pWldj?=
 =?utf-8?B?K3Q1KzE3T2szenJENnQzeXlUbXQvd2F4VjFpb21PWm0xQTB6eVVFWTlpajFr?=
 =?utf-8?B?RFdhSFJuQis1VHVNV3J0azd0citqaWxwVmRjaWtHeHVvRmVUTDhKakxYRHFm?=
 =?utf-8?B?dmNIVUhFZnVOMEhmSVludDg3U21WaVFOSXVjWGI1bnF0S2VUTzA3WFUyWWgz?=
 =?utf-8?B?N2RBTmlJT0crMytIY3FZOGtVZ25hTHFtOFo0b0lIT0U1bWlra2ZwVEFzenBw?=
 =?utf-8?B?L0dIeExCUnhCbVd6ZkxxL0NDNGVKVkw0NjdYaDljU1BkTEttM1ZCZnhTVzIv?=
 =?utf-8?B?bEw0REFGY2dHRFJtS2NzdkcvRXpRcUJiYWozZFJ2eTMyNiswT0xYK1BqQzU0?=
 =?utf-8?B?VGZWTitTZStCZC9lVi9NaWNNdm52RG5UUmRSaWlXU1g1Ty9NWXROTDNKSGkw?=
 =?utf-8?B?L1pxU2M1UTFaQk5Cd2x4Yk9MMG91NEZ2MGtkdHVCMTFQSGJVbG82bDRLVkY1?=
 =?utf-8?B?UXdHWStWcXI3cWlyWkUvWC9NRGllMFJTaENaWWNxM3NKN29Ldm9mbjhCaGwy?=
 =?utf-8?B?TDFtU0svbmNaWmd4RlAwWXRQM0l2RHl5eFNUTVVBR2k0ZU5CNmdvNlIxZU1t?=
 =?utf-8?B?N3lvM3Y0RTNDbUY0SlFTSEhNK1ZKbDlIZUxZNmNEOURsbWVBVFIwcGlmNFh1?=
 =?utf-8?B?bzB3RTZiT0xuTmo4RHFlY3RZTFBOWW44aFVCOElmeTg4d3lLOXUxd1c2TGRw?=
 =?utf-8?B?ZjVkQ0xLV1lXY2UvYWpYMWNlMkRQVUlUL01haTZudFNGa1JmM2QyNW16NFhq?=
 =?utf-8?B?LzU2ZlNma01abklsRmFybmdnTm9xa2NmVEYvSjgraTVUbEpYQTNPVnBraElM?=
 =?utf-8?B?aml6T3kwUDgxQjhRUndmdUxNRy9uN01FQXFVbUsxajc1a2JVZXlSR0w4c0N0?=
 =?utf-8?B?Z0ZUY0dOMXRnaldJenZkdlRQUTRhRldhV3hMWmVSK2l6bEd3cUVqNDVHdE8v?=
 =?utf-8?B?eWxUbWJVd1VjOTVMNDdNWjY2M1dIeEd3S1VXSkl2OVlZSG12VWZIZHlKOGVn?=
 =?utf-8?B?YWFJQmZPckV3dWxpZEpYbmtNcGFLODJTTzc5aFJseHAvQkN2MXZmaWNGTnJj?=
 =?utf-8?Q?jXJ8ReAjeEb3YYlvhdc1HPE+A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e41f69-cfd2-4943-3b99-08db813c0fde
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 11:51:56.8176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NKjI2hKzEronkVOl5oi4PUY6fYhVnJZ4eYqwSvjeoMJXsNpZvfJSxpO8jHviIYRexBHPapCLbWEcsz5231N0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9621

On 06.07.2023 20:54, Jason Andryuk wrote:
> Add a union and struct so that most of the scaling variables of struct
> xen_get_cpufreq_para are within in a binary-compatible layout.  This
> allows cppc_para to live in the larger union and use uint32_ts - struct
> xen_cppc_para will be 10 uint32_t's.
> 
> The new scaling struct is 3 * uint32_t + 16 bytes CPUFREQ_NAME_LEN + 4 *
> uint32_t for xen_ondemand = 11 uint32_t.  That means the old size is
> retained, int32_t turbo_enabled doesn't move and it's binary compatible.
> 
> The out-of-context memcpy() in xc_get_cpufreq_para() now handles the
> copying of the fields removed there.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless I continue to be uncertain about ...

> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1909,16 +1909,20 @@ struct xc_get_cpufreq_para {
>      uint32_t cpuinfo_cur_freq;
>      uint32_t cpuinfo_max_freq;
>      uint32_t cpuinfo_min_freq;
> -    uint32_t scaling_cur_freq;
> -
> -    char scaling_governor[CPUFREQ_NAME_LEN];
> -    uint32_t scaling_max_freq;
> -    uint32_t scaling_min_freq;
> -
> -    /* for specific governor */
>      union {
> -        xc_userspace_t userspace;
> -        xc_ondemand_t ondemand;
> +        struct {
> +            uint32_t scaling_cur_freq;
> +
> +            char scaling_governor[CPUFREQ_NAME_LEN];
> +            uint32_t scaling_max_freq;
> +            uint32_t scaling_min_freq;
> +
> +            /* for specific governor */
> +            union {
> +                xc_userspace_t userspace;
> +                xc_ondemand_t ondemand;
> +            } u;
> +        } s;
>      } u;
>  
>      int32_t turbo_enabled;

... all of this: Parts of the struct can apparently go out of sync with
the sysctl struct, but other parts have to remain in sync without there
being an appropriate build-time check (checking merely sizes clearly
isn't enough). Therefore I'd really like to have a toolstack side
review / ack here as well.

Jan

