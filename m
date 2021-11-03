Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF824444C8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 16:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221029.382536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIPD-0001s9-W7; Wed, 03 Nov 2021 15:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221029.382536; Wed, 03 Nov 2021 15:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIPD-0001p1-RI; Wed, 03 Nov 2021 15:42:27 +0000
Received: by outflank-mailman (input) for mailman id 221029;
 Wed, 03 Nov 2021 15:42:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miIPC-0001on-46
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:42:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a430d25e-3cbc-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 16:42:25 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-agJKx_UPPXiVGbiSofJSqQ-1;
 Wed, 03 Nov 2021 16:42:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 15:42:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 15:42:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0602CA0015.eurprd06.prod.outlook.com (2603:10a6:203:a3::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 15:42:21 +0000
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
X-Inumbo-ID: a430d25e-3cbc-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635954144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKQFfsl5CI8qDIa6xA0OpXJ8VjuzoPquD0vSUy66UTo=;
	b=fSZYVaSDP+YMWRmu+9TnvjwIz7SaA54szK8qDdD32e4+w3w9sCec9zp3mlxJcNc7yGUsVj
	JC09h/qpdYzvNc2iX0cOf/gPEiPQbR9xYXA5uT0QmoyDkYM0S0/msxSNDgkJ0vxlBN/w+e
	F9iiWjTytSCNJH+X+2tz18c3sVnKwcE=
X-MC-Unique: agJKx_UPPXiVGbiSofJSqQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSm8ynbCfsy/ktpsU/ulryIVXolmKgvUDwYUuvhwuObfXXi5xtMj+N/A+/2U3/uSJhkQaEmLuUIQvMlpRs+IGuJk8e8+CE/mDjh8KVoozk1iJdo2p0xrQoFPSkfX9Zcfnh2d2xhpICFRdmxSVZ+GIEkPdRhOpUsV72d0jUPEBSVqBniKWctwc3ptIsG38howxnA+SU/7RCUQjPeGwke2+R2ICcJ3hNUYgfNYfkm9hhaWAaZBCfOn0kr9DIZNMkPMqOMUW/6qfzakgi9nn2GxDeOs86cq2HB36nYHwaee80xvbMNy9vpI8jwI72nLIwz3vjGhgm0/nrrPoCDvGgAaOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKQFfsl5CI8qDIa6xA0OpXJ8VjuzoPquD0vSUy66UTo=;
 b=eAi17HhJs3O21ygBAqXGte2yr4y9P/dKVPzVd0P4a5Ztss97QxyOJWBXVC1+KwSTEnFE3xO5Kpfp7fk0DqIgRHhL1k3Fyoi1fajY1uaUeLA0xoMk/oPPgHxkoVR5ToIGg7tycaRawBYwtML1IP4ZI3gJbton2XOmN1ap02ukYpR+weFo89jtoRVAtGErA5FELdEmO5RYa7j5NJ5pZbMr1fILuWBWYVyIPlsPJOHJEtJTuO+/3GkB5t9lRuuOu/peWFWbGBMOwhrfPV6s6ssdPBy3YekR6YYyF9RRu6AENISLwQeMYVw7j5JXvtJmzssfl7JOUYfLYf/x27eNg17eeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <613fa1c2-5292-43b8-0261-2b26d7f65cd8@suse.com>
Date: Wed, 3 Nov 2021 16:42:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2.2 07/15] xen: generate hypercall interface related code
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211103102059.19621-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211103102059.19621-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0015.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 670464f9-351b-4aeb-498f-08d99ee086ab
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6175C8C688EA5D9F5BF48FA0B38C9@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zBQQUdODK6SpPvr3h+GWwBsZyPFl5IdX4lHqv5dEMNBBxSUubY7A8jcrd9CUHXZLnHiemSKJLc18IsyuDwpTMIgFSVrKYXwuYpd3rtYymOmjnO8pJGQFa1MRNOHMpJhAx4fLhfuEZDJb/BuZpm1+fSi+U30TBYF67z7/zKbcJFA8aMp8f2zew+euH9+OkZOzSBRyDZr6n2UZ2KGBoCg/ogwOLRZhdQ7wDaMFr/lXUsj6sGEYHb12ZSCcO/O9F24z/RZvqTt6gfbh/wlg5jsSkT44XvScepKn+P0jKg70AYcm/PPjQtpz06r06/t6Z96cKYU/dQ46s2yAxGs83dZLW7KtbCd0LujbOum4+UHTm0aJ5QhWcgpCbxzOCojkSyHXk71yFzQpSs4fCul+d3pVJaNl0LybxnPTDLX1k+TbnO0C8vt13WBbPHGQRinZUOjd4yyTTnu3J7bifJ7hOdPeP3EH8NL8joMqpzT4rVURrm78sUwONmkSjovimNUriIz1gQP5DqGjqDnSWk11WLWaNnXlx+hCQcLnO0gQPx6kk0jabkc4mM/nSHhjPeCZL6ao988+x+cXWa/YxYdrRr5sxLkRo8No9ygVXBHwl8MztLcPuUbrI7LLemtdjyjfIVQOZ4ZIWZMzLfvzihn8O+HBQkZV8H2jaVsfT6B4e4JVsUKzP75cVEJHK6YYh637qtdIKqZCWPx+bag72QVEhocrUiUyCBvWnQHjqTlDTkgpWq643k8GAgkctGp7qBw0f0cP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6862004)(31686004)(86362001)(5660300002)(53546011)(31696002)(508600001)(316002)(16576012)(2906002)(37006003)(4326008)(8676002)(66556008)(2616005)(54906003)(956004)(38100700002)(26005)(6636002)(83380400001)(66946007)(186003)(8936002)(36756003)(66476007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0tTVTBoZDB3eDZBUytXbTd5bThNYUxmR2k3RGNmQ3psWkZQUVVya1VWUUVC?=
 =?utf-8?B?dUZEYnlxamVZUU1GL2lxZlZPTU4reGc2akJUS3ZUOFhhazlEaFhxWk5kNmtN?=
 =?utf-8?B?NlZhYzFIa0FHcThMNHZ3RUFPNTJHc20vaXQzQ1ZrNVU5dVR0bTJJNTZtdVJk?=
 =?utf-8?B?V2pzb1E3Tkc3cVRLc1pQVVl2ZmtSaUU3bmg3TnBFSXJTeW94WVBxNXN4QjJo?=
 =?utf-8?B?M2dEWllLOUdscExQbklnVURYQTNNeUR4RGMwWHBxYkM4dk0rR1hTamxRbndI?=
 =?utf-8?B?bXVoNDAzVG5Nc0pyV3EvdVVsbldTTWNrYTB0SldnNjRJNWtRWjJaQWp0V0ts?=
 =?utf-8?B?R0JqR0xhSVg1cHlMazV6cS84Z2lNQ2tNTW1DSk8xSFhVV3IwdjJ2eTZaY2Nm?=
 =?utf-8?B?VmNBbGNHQ2NkcjlDbVdVdmw2SkVGL25HL3BoQ3FqT1dhU2lmcHg3b003NGNG?=
 =?utf-8?B?MXdzNDJwU2I1VlF2QUsxRlhMd3pZanBpZS8xTUVaeWNHOEx5UHltNVRtSVNz?=
 =?utf-8?B?aUhIUjdCOGhyUEc4WWs2Y05WbFlScm5RWGNYYnBGQTRBQkZaUGhqNXBHa0lE?=
 =?utf-8?B?b25va2NCVk5OTXZYUDJpRWdQaHlVNzJnWDF2REVudS9Mcm9ITlUyYVJLVThZ?=
 =?utf-8?B?K3p1QlhtSm44NUFrTlJLNUhLU055SlZVMm9YUUY0Tm9DODhOenBIU2pBTENy?=
 =?utf-8?B?QldEc2hTbWZGbTdSaTFvaFI1d1RTMHE0MEJ6YnVDWnRseUJ4TjA4SjV2MGlO?=
 =?utf-8?B?WTh3blduVUszdGVWZU93bmJrdUNsRFRSOGV1WW9xQzEvQ2hzS1FtYTNkNFF0?=
 =?utf-8?B?RlhMREtVL1lZK3Z2b3lWZ2V6Yy9WTEFCSSt3YVhYRkdheEZ6dzZVdUpiVTBX?=
 =?utf-8?B?RGJqNURQSWlCRm1vNGwrUVAzcGpCemFSSnpYZmZRRXc3SEluM1B5d1R1YTJ3?=
 =?utf-8?B?dGttc1BqTkIybWJjUFpKZW1OdlJTUGdob2hXWnVEOXY5aUNndWVRb2Q3bGVo?=
 =?utf-8?B?cE53RlB2dHloN3k2LzM5SS9aMGZzK091YmtQN012R1QvN2xNOW1BWUpVZnVX?=
 =?utf-8?B?azZ0MlJVbEtrNHluY3oxTnNxeTRxVlRvQkxtNWtTMFdIYWlFK3hUaWdsbkVB?=
 =?utf-8?B?OFd0MnIzMU9wTmx5VnJoUEVqRGMwdUs2SXBqZkRkT0prNWJQdGlBNGNveEJY?=
 =?utf-8?B?TmtDQ1lpRlBwMmJjTzRJNHdUYlloK0lZZkhxbGJQU3lmOVZzY2hwZlJuUk5I?=
 =?utf-8?B?VUpocWk0ejRReFN3VDc5S0toLzRhZlRHUjNpYitVdldWSXBpN2QvYUJndXNS?=
 =?utf-8?B?VXk0aVQ0ZXVmODNmSiszZUtLUDVlOUNkNk1EUnZqTHZPbGN5N1FBMGVlSkZn?=
 =?utf-8?B?U3lRUTkvWXFZWmZkN1E5aHh2YTQ5SGFrWjZ6MHBZYlpFN05xRWlNUUlMdVZW?=
 =?utf-8?B?Smw3Snh5OXdSaTQ4TzlObHM4Z0FXL3ZVRXRXTSsrTGxCU3B0d21mVUoxQjAy?=
 =?utf-8?B?VHNqNDI1NzZVVVd3OWd6ZTVtRjJIRUxHaUJxV1BXM0NZTWh1Zm5Ic2JYdHJC?=
 =?utf-8?B?Z1pQN2dMTDFPdUh4TjNjemRRR2p5SzdIeWxtSUM1U2h6bGtpbTRHbFdOY0NG?=
 =?utf-8?B?cjdNSmVHUCtkb28zM05lcnNtclBCWVQrRDc5MnhCLzd4YlRxcXNjOTlna25m?=
 =?utf-8?B?MVRHc1RzSHQxQ2ZpMVppaDVWZlc0M3owRWs2WXhocGtkNlNPc3ZoNUVhWml2?=
 =?utf-8?B?c01vZ1RKVGlsdm1nWlFFMERNbUpIRktmd2I1WmNCK2NNWlFra0dhbWI2R1ZJ?=
 =?utf-8?B?YXEvZHJTVWV5Tk5DMzV1UjYyNVp2QThMWm9MSlhlRVBOQ3RETzJqM3pyRzBz?=
 =?utf-8?B?TDFYdWM3NUlreUtiVThRdDZDVHE3bWlZQUs5NklrZjJUV3lBNmpiTXV3Z1d2?=
 =?utf-8?B?MThOVHN4WkM5WStlRkRQUmVORVViWjR5bXhSQWpaZkoyTXZtUWsyd0dyQWNz?=
 =?utf-8?B?RnZpN0ExSXM5YmJZUjZ5SjRtVGt3aG9acG9PZFhtVmZ2NWhiTlNEU3AwYmRs?=
 =?utf-8?B?T0NjaFFuKy9RSE5Sa1FROWNJNWQ2TnhiM2g1cENOcTBzYnN4dDFJRXJOSVBI?=
 =?utf-8?B?elgzMTBRVXp2dWFYZFlxdXF3dDVEc2wvMHo1SHJZRDZxcXlSMGd4ekFRbnJk?=
 =?utf-8?Q?VOtB3E1iapPY/FB8weVFo1k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670464f9-351b-4aeb-498f-08d99ee086ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:42:22.0220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C82KeUtKr5SV44bIOpHsxEcAL1ujJt7nB9XYjR/SxFfmqScqU/mh226TgxmNhnph0EkvrpeR7gtKwb70SalJ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

On 03.11.2021 11:20, Juergen Gross wrote:
> Instead of repeating similar data multiple times use a single source
> file and a generator script for producing prototypes and call sequences
> of the hypercalls.
> 
> As the script already knows the number of parameters used add generating
> a macro for populating an array with the number of parameters per
> hypercall.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

What's missing here now that you have introduced priorities is how you
did arrive at the chosen values. That's a pretty important aspect,
especially if someone would later want to adjust these.

Just one further remark from looking at the output of the script (thanks
for making that available):

> +# Generate the output
> +END {
> +    # Verbatim generated lines
> +    for (i = 1; i <= e; i++)
> +        printf("%s\n", emit[i]);
> +    printf("\n");
> +    # Generate prototypes
> +    for (i = 1; i <= n; i++) {
> +        for (p = 1; p <= n_pre[i]; p++) {
> +            printf("%s %s_%s(", rettype[pre[i, p]], pre[i, p], fn[i]);
> +            if (n_args[i] == 0)
> +                printf("void");
> +            else
> +                for (j = 1; j <= n_args[i]; j++) {
> +                    if (j > 1)
> +                        printf(", ");
> +                    if (ptr[i, j])
> +                        printf("XEN_GUEST_HANDLE_PARAM(%s)", typ[i, j]);
> +                    else
> +                        printf("%s", typ[i, j]);
> +                    printf(" %s", arg[i, j]);
> +                }
> +            printf(");\n");
> +        }
> +    }
> +    # Generate call sequences and args array contents
> +    for (ca in caller) {
> +        if (caller[ca] != 1)
> +            continue;
> +        need_mask = 0;
> +        for (pl = 1; pl <= n_prios[ca]; pl++) {
> +            for (pll = pl; pll > 1; pll--) {
> +                if (prio_list[ca, pl] > p_list[pll - 1])
> +                    break;
> +                else
> +                    p_list[pll] = p_list[pll - 1];
> +            }
> +            p_list[pll] = prio_list[ca, pl];
> +            # If any prio but the default one has more than 1 entry we need "mask"
> +            if (p_list[pll] != 100 && prios[ca, p_list[pll]] > 1)
> +                need_mask = 1;
> +        }
> +        printf("\n");
> +        printf("#define call_handlers_%s(num, ret, a1, a2, a3, a4, a5) \\\n", ca);
> +        printf("{ \\\n");
> +        if (need_mask)
> +            printf("    uint64_t mask = 1ULL << num; \\\n");
> +        printf("    ");
> +        for (pl = 1; pl <= n_prios[ca]; pl++) {
> +            if (prios[ca, p_list[pl]] > 1) {
> +                if (pl < n_prios[ca]) {
> +                    printf("if ( likely(mask & (%s)) ) \\\n", prio_mask[ca, p_list[pl]]);
> +                    printf("    { \\\n");
> +                }
> +                if (prios[ca, p_list[pl]] == 2) {
> +                    fnd = 0;
> +                    for (i = 1; i <= nc; i++)
> +                        if (call[i] == ca && call_prio[i] == p_list[pl]) {
> +                            fnd++;
> +                            if (fnd == 1)
> +                                printf("        if ( num == __HYPERVISOR_%s ) \\\n", fn[call_fn[i]]);
> +                            else
> +                                printf("        else \\\n");
> +                            do_call(call_fn[i], call_p[i]);
> +                        }
> +                } else {
> +                    do_switch(ca, p_list[pl]);
> +                }
> +                if (pl < n_prios[ca])
> +                    printf("    } \\\n");
> +            } else {
> +                for (i = 1; i <= nc; i++)
> +                    if (call[i] == ca && call_prio[i] == p_list[pl]) {
> +                        printf("if ( likely(num == __HYPERVISOR_%s) ) \\\n", fn[call_fn[i]]);
> +                        do_call(call_fn[i], call_p[i]);
> +                    }
> +            }
> +            if (pl < n_prios[ca] || prios[ca, p_list[pl]] <= 2)
> +                printf("    else ");

I think there's a line continuation escape + newline missing here.

Jan


