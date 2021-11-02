Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B817442DB3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 13:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220175.381332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhslo-0002OQ-09; Tue, 02 Nov 2021 12:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220175.381332; Tue, 02 Nov 2021 12:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhsln-0002KT-TC; Tue, 02 Nov 2021 12:20:03 +0000
Received: by outflank-mailman (input) for mailman id 220175;
 Tue, 02 Nov 2021 12:20:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhslm-0002A6-Ph
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 12:20:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71f4697a-cd73-4495-a8a1-b8ba1d4a4519;
 Tue, 02 Nov 2021 12:20:01 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-RzxfRkMRN6uNBdl6TEOIeg-1; Tue, 02 Nov 2021 13:19:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 12:19:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 12:19:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0348.eurprd06.prod.outlook.com (2603:10a6:20b:466::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 12:19:55 +0000
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
X-Inumbo-ID: 71f4697a-cd73-4495-a8a1-b8ba1d4a4519
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635855600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtQpmfpgL7glnOJ5hgOnALk89dpsTVruCYd+W3wr5dU=;
	b=aapctmTKef0urkK3NsfM3CUD4hNCPSTYDEph/x8CBS0OPofm0PKAeHX8qjUm2l+wjP39Op
	8IUvbBQHrxgZym9AxRYyHAYpz3v2ftfFGvs2IxofqhAfNjgeknp/gDK1L5WDZ68lfjuudE
	eDlM5BUgTQuhXMEOPr6+HWh6mY1keLo=
X-MC-Unique: RzxfRkMRN6uNBdl6TEOIeg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJsjj7X9nq15/vi4EFo9giKPgj8KvPkt86hpNSsSTZaTdaNDxtSv6MFPNEaQrekaviaBcfl4OnSbNm5AgQzfchxzSZONV2AbubYjHHPomCdsXfP+rX5d1C7uF/wEVdY006578Uz8ceKLzaOaQ8mFKDIsbKj0isvA1CdhVcM+57ZhA1f7ae3A18WX3mK/SrOHmtBoTaGi07Y4TNuNsru8bFDZtsCvkLdBbbpWTbYeFLgTlwOooIiQAooGgZSQsrtLJZZeCEQZHqqLRe0eD287dmnRvWf3x91u07M1nfab1YNMYvb0Vh/zjxgPYLy3Z0LdM5U02QDbRnsQ2U/o5vmlFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtQpmfpgL7glnOJ5hgOnALk89dpsTVruCYd+W3wr5dU=;
 b=Iq8DXWM57r2lID0QDOT8XYS8a3U6rieavOz+yMU+OVsfgTwl/Gr1UNHLadxIRqEn6ECe5g9UaU+QToswTxUoARc1e1DIuIQ0em4mWGBYS6CBAxp7ks/QL4V4Vq0MwrFxvLdjhNNB+ByKc4EEbj0EJukjHBvpXNabS+ygt75vJMoeRdY3MHHe96X7IBtwPj4N4oMWDjZuIrmzDR8OSgBvG8Z6zvddZ4eiWJ2IsCEmi7lETy/wbO00Ygtydv7Vn4ZnVvJOwpqmWZLkWdINjjU308eeEGyXjyxpsk2qJuybC9cWBu1Xej2bS6syIcTIc7eHGbDzXwlJMMR2CBPt7P+JYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f01f4544-b78b-d7a1-08fc-c966ed3f1515@suse.com>
Date: Tue, 2 Nov 2021 13:19:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211029075956.1260-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211029075956.1260-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0348.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6700596c-5979-4d6a-5c5a-08d99dfb151c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48485B2693B5D3AD25982D2EB38B9@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yul883blgSMlsgSheh7ki7P1GjXaSuY37ssMsLtMTnnvD3S4HScx9vpO5ok2ORCmZch8dj2Ug+S46mLp9boZ2z+pL0rbpFDrWj3U2uC8s2pAS+TJfj0p94ZPKh/TW+07KNNw9QxtdYCIYXd4SBahQM7Jkj4ud3eMu7+q94Vfo64nF+CHfzhQJ2APAQ0amndUb9Bk6+Z116cbe2MAf/b/7mZYK+myacJInmCgakPP1tgCEPh2rI+fYUMpsrjULn9jK7xD8VhTCGBvDAi8oCr1tBmR9U5SpGwFI4nl3nadXAt+KlxUN8Vq7pmA4RP+CWNbGFq7T1AkdwbnsCSpbqvs3Ud1FMgyiVVK6QFCWdQZZ6kI0yGFMB/0a10BwrmUJfWhcvIhy47osY9pvCjNYNEREu2buU+3VFLMU0M7Hv+gLxrbohspQWPa/kVnOGPKreLuiwKQBFiJahQuWSVqmD/EYKyuMQIWUVaaO5bGRrgWmhIWaOg4zito1ZLJyXR6fcGs/vbFEHCSUFghE5meVfzJjcyJsF9QVxdicQwIyjWjQbXFg/JJWvYU/HR35/qOgtsjXBEdPVTfdFeB6qmzDoFI6aXzfkhyVC25q26vSroK5HaH8jLCqpLAvcGdhScw7icgiMqFhfotsbYWOTglvwyyYxGZyqqLzLKrbFO2VrXqJAzszNLj9aOEqJp4qScTWSPmJ0sWraPe3sG7Wzfh/7Gem5Bm6osz6ur6GaB49ho3XYjvmF8s9odcaxIfjcpLsbnC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(7416002)(2906002)(508600001)(31686004)(16576012)(31696002)(6916009)(8676002)(956004)(2616005)(86362001)(38100700002)(54906003)(4326008)(316002)(66476007)(53546011)(26005)(6486002)(36756003)(5660300002)(66946007)(186003)(8936002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG1TdEpZeUtrRXFsd2U2dFhLUDdWWW54cTRTMXRqamxZNExscjIrTVBOQmg2?=
 =?utf-8?B?ajRQSnloM0xuZnNGamovTUlvaUhQVGpjZ29YQ0E4MElyUXpFakFLQmdhejV1?=
 =?utf-8?B?cHQzVC8xN04vR1JUYVdObUtod3d4M0FNQ21uVDhXc3J2Q2V6Smt6cWdjck1V?=
 =?utf-8?B?dEFzdGkrRnBoRmNZWFJKT3A4am1Vb2dxVnNLQmcyYnJYQlFGT3UzbUhoOTVJ?=
 =?utf-8?B?OXllNFcrMzRFampTTU5GOU42Q1NrUTVnQ2YyN3psaEFwbXRoUXdxeTZQRjBV?=
 =?utf-8?B?Z1FMQlVLV0tacHM0RGIxT2M3NnUzSUJkRDlwQlErMzJMTzF1QzVNeHNWRjdk?=
 =?utf-8?B?QnpYQk00ZWNML2VXUFpLelpPUVQ1VU9Ba0xpSENyN3liQWV1M1lnZGtyM1F2?=
 =?utf-8?B?aHIzRVloUDc1MTFLRmszRi91LzJ0VWM4ZlhhTSsrZXVkaUd1UmRCdWJvWHp4?=
 =?utf-8?B?NjA1VGhESTdpbjl3WDVncWNmMHFNakVLWnVFeitFRGZlYUVXVGoySkh3dXUx?=
 =?utf-8?B?UnVQVjdqZVgwbld3VEpvYlJLRlVPWEpUQ2xKNHVxYWNhWDBxNUZXS05VNVJj?=
 =?utf-8?B?dmlPZkNlemVKd3dNUjV6aXFjbUgzUWQzYWJXV052WDhRVHNtbjFmejRpek51?=
 =?utf-8?B?UmhMaTVid2l3dmVkMXlKaUQ5L3dLYVdHSmlvNWQyblQvRytJQm5UenBvU0F4?=
 =?utf-8?B?dEttU01hMU1KWkpwSml0MTZtMkpSNE53eWpzOE9SeWhvVSsyaWpwbmRNYXZI?=
 =?utf-8?B?b2JWTlkxZUpYNGl6bG1aQVAvdFFCWU5OTkg0aUNQamIxMllWZFZkSkY5Zitw?=
 =?utf-8?B?MUxnSVFOMEJWYzZZTmxEWGUzcHYzWHZZbTdqeC9qcFJCb2k1Rko4QVFnMktr?=
 =?utf-8?B?RGJpdVVhdjFreXZPRnhaelFkNUxEVVdjRFJNTUJGeDl2dE03NXoydUw1YSsr?=
 =?utf-8?B?eGdYbHRUNUdCQWhWSjhWZ25lV3ROcERhZi96dmpKVGQvVlNrMW5IQnkzZHdR?=
 =?utf-8?B?TUN3VzVxejVhZFpKSnRhYVhYRGY4YVV3MkQxejh3TnVMdmdsT3lKdDNabENq?=
 =?utf-8?B?Ymd6ajlOdVRCT1J6QkdGZlU2VURHTlNyVFFlQ3VRTUdKWlVNVnRudnAyVzZ3?=
 =?utf-8?B?VXA2NGYwVHVoRWVWcG5Kb1d1WHlLZ3Z2R2N3TjI5eHBHTjNUOG9rN2dseTFp?=
 =?utf-8?B?YjJSNHpTdjRzR01BMmQyaU5hT3V4bUtpRXJPQ25uMjkvOWNMRjZZZ3BSM0xo?=
 =?utf-8?B?aTFuVExnTDZ5Qm5tR1FaOC9IY2RtSUpGQ3piN01KOEE3WGFkWGRpcy9iYTRw?=
 =?utf-8?B?d1ExRU5mZEM0dVNpaEJNdHB2dzNXOVZHRWZwWnhJOXF1VEh2SUV2dHZCL1dI?=
 =?utf-8?B?Yk41QStBVC9XZWNpM3Nza0JQMExwdC9vOUtrL1BqS0h5ckl2enZzZm4rK3JG?=
 =?utf-8?B?TVZvS0RJelE3TTZNdXNYUTRDaTR2Z1B6ZVNvU2ZSN081UThBaEUrOXd2SFNa?=
 =?utf-8?B?emJESitMS2xjWG9IZXBwUTJmSmExd2RrQ0d1VUxubXhpWlFQWFE1cXhSaTZq?=
 =?utf-8?B?YUtJYmE4MlNWWkMzMHV0MlhaZFNGNFMvdXNvK3M3ajJCYXpDcnU0V01UbXZG?=
 =?utf-8?B?OTZFSFhnVmMyVU1wSUJXK2kyL01mNzNlcHI2cHBKQllGUUtOTFJRSXF5VEJ1?=
 =?utf-8?B?RmFIVlIyMGZ5VEJzeStXZ2Ixb1VDNGowNmpvdVYrSU15Y2lXcmg3cjVYZjZD?=
 =?utf-8?B?Tkk3WWZmTW41SFVIb0RBeVZhOHdVaTlodHExQmlCQ2VxWFl0OVlQb0VudkhM?=
 =?utf-8?B?SFVSU3pWQTVTdzlUZXhTOU9ncU45TWFvYjlnc3k5ZGVHcHhUaHVhWVUrd3lQ?=
 =?utf-8?B?VUhYTCszMFdwVTIwZ21heUpCY0g4V2Y4ZUFwSDhaUGxhOEpsVHlyd1h3dGdy?=
 =?utf-8?B?SEZ5YVgxZ3h1aksxS1g5U0VxWFB5amlTNVlHRFA2R3dLUlNtREhuMDRaU1ky?=
 =?utf-8?B?U01ERHowa2hUTTFxVGtXdDF6dGR0c2xlVitkNHQyeUMwUFkvd1FkOW1JdXJO?=
 =?utf-8?B?NlgxQ2F6SEdpQVZFMmh6YnFDNm1JMktya3NHeWxEZzB4dlJMVWJ0ZlVKbjkr?=
 =?utf-8?B?bDZBbG1WaTNUOGNrWUxIZ2h6aVpKMlpRUTRHMmRMc1pVMmZ3eHJQamhBbGNv?=
 =?utf-8?Q?HqZUNTZtc1HO4TiFOOHAfME=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6700596c-5979-4d6a-5c5a-08d99dfb151c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 12:19:56.7957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmG97CoVkaVzDlJ6Fw7XWABd9dgFobUTt2kp+B6+KIZ98wUslHWjDRaHOeIdUoqewe+tRJAjLeWLZfBGnXoAvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 29.10.2021 09:59, Roger Pau Monne wrote:
> @@ -1917,11 +1918,33 @@ active_alloc_failed:
>  }
>  
>  int grant_table_init(struct domain *d, int max_grant_frames,
> -                     int max_maptrack_frames)
> +                     int max_maptrack_frames, unsigned int options)
>  {
>      struct grant_table *gt;
> +    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
>      int ret = -ENOMEM;
>  
> +    if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
> +        max_grant_version = opt_gnttab_max_version;
> +    if ( !max_grant_version )
> +    {
> +        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
> +                d);
> +        return -EINVAL;
> +    }
> +    if ( max_grant_version > opt_gnttab_max_version )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "%pd: requested grant version (%u) greater than supported (%u)\n",
> +                d, max_grant_version, opt_gnttab_max_version);
> +        return -EINVAL;
> +    }
> +    if ( unlikely(max_page >= PFN_DOWN(TB(16))) && is_pv_domain(d) &&

This needs to be >, not >= - the variable's name is inaccurate wrt its
actual use. IOW in the proposed alternative code you'd need to check
(max_page - 1) >> 32 against zero.

Jan


