Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F920621932
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 17:15:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440262.694392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRFP-0001gV-LT; Tue, 08 Nov 2022 16:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440262.694392; Tue, 08 Nov 2022 16:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRFP-0001eZ-Ia; Tue, 08 Nov 2022 16:14:47 +0000
Received: by outflank-mailman (input) for mailman id 440262;
 Tue, 08 Nov 2022 16:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osRFO-0001eT-Kp
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 16:14:46 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 751414b1-5f80-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 17:14:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8858.eurprd04.prod.outlook.com (2603:10a6:20b:409::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Tue, 8 Nov
 2022 16:14:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 16:14:41 +0000
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
X-Inumbo-ID: 751414b1-5f80-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7Qk+FLWdixCM5dhOOTsqBPuaLtB6LubCsWMVFWVZ7k4jfTZDA9kA0wMDniCiQNAfD/xFIAJnXTyvegW9ft8mL2NZ6W4zJPJENHIGGQToADH3157HoCX1jBlX1dzQy6c3JbuArRD+O39oW6bRSPEQkUDVKXBv4ELjUs81sJR2gl7cH5RmHUWTZ9WXfW7jaaXfaLR0GCeuCkQh3q28ujNLBjqoxZS3ArEmuDg5FDCPjCNKuoYWr5ksJDd4CkWQlqQou5ofx0aKCpc25FjswHqPpSsDGeurWkMQry35WYj1pWBiD2M1iSw0WH160nsodZKhS+m/Eu4+V4Szl6u3R6tmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kALdrl24ZbbLJDvnjcTuyysnkpdzbU7BO/GCV74y25o=;
 b=ZBY8anCl8tGBt5FITB+/9LeyS+vptUgiXbPoH5NI1ZAUeLbx5uiG8i5smDa74+UKM2otg3sKQJaOvViu77WT7FastYfSJ1uWSpM0JMWWYpO51NKW8F8sTRzL7kqNbcgH/ZnfgJZkE3VzW73iFsHus63+j3kPro4/Y6Jg0vDysSB3jgu0M+aIPtPtVkL3XI6vbANaBkCPCv0UUDnV9gtDb9E3bq0KgI+nDprBYuj+J2ovQC4GdhXUhWoWn3AFRy2FCjXi0U7gVTEJdLwSnmmoX+ITRM+pXHQ2TwO06hklOfpAZjwpYnnVIEVcdNUoFykmnpr8bUTtNncwwlTrzYs/aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kALdrl24ZbbLJDvnjcTuyysnkpdzbU7BO/GCV74y25o=;
 b=JbVcThniIKv6qEr/d1GBQpAT3QnO4jYpGEmrkBdws51R9AJdtGYJb1fHN7efGH5Igah+1QUQBBzIeIas/NtQ6gb2SR26kRM7gufeTQSz2UPRWgcwgNyWSENm+roTqd5yzlcpfVRLXmCVtxcQC61+1LGt6oP9wFMhUcsLsEC0oVz6mMIns3XkBSPq1Zx6MFHCoMTwnd1zcwrgRJc78d4/ZDrDS7iolh+1cPJkyVQB91s1sTwfMQXluXjdnaH7cUDC09z9FVq9MY+z1KjdPFEJ8F+hhW5DYYtctYxD0ePcDcDe+gZVK9NC2BgzCvb8TN9nVwJXu/VRQhh4mShBXOzaNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
Date: Tue, 8 Nov 2022 17:14:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20221108113850.61619-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221108113850.61619-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 56fbfc0d-d8b2-4147-ef2d-08dac1a457c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Rn7VllR6jKpKGGYF0vlCSQVTde47tBZE6XGPyPtjB7x1FCh6ZJmXvvUfdp6wgc5+eDWA3qHYm6OT1reiUhRqYpZ2y1aGc+riOjCeYiaqj9nM2xeOM/H1qB6LFojUP42Z5bK3OVD+fB31MEh1bGXA1w2vIxeGjWiP+UjtlfpbVUKJbac+1xIFmFlDVoPynpNPBFBTN8NhDKHxSP6sAkTryH3dBHHB6tVknDw0S2OxKRq4b7TibWyzf0E+Tqm0xSLa2QrQIv6sJeoLf0fKv74n0yjEWDB6SfIbc97CjU0fbjzGQ541I3R9iXBsS+7EHH4guHGRhexlKVMZ+7aH/Sxr+c9to6DzdmG2DXpjiFPExuyFX5g8GGi3wNMFc7/Yc39n1LXmE5gzvZMojnyImli1AsDxi+HoreSU/wo23fozRko0iPGCZxFgkXkYwHg48f8NwVHIJL8g0KIhzVlR2cTMwoRf4OrUMxelfHxnsN1MgK5lrJLryLX6AoBXck0SRGPN9FBOtL+sLOb2ViOV2m+lLRQOocV525igo2cbZRoPyctJZfYScwTeOMkgo+aaNF5ZhQuYuApVGyLfjh1eRdC1Ga+SkjXt6OouKc/JZkEcRgdNb8LeiOFsuguJFm0c8g4olU+cZiI5LaljlrvOIJ4wd5HgoPczPg+HJvpGSjto8tINnuXltoO8hl1L5Tp4AVHyHymuu9UH4Qtap/tN3HzR5V6DWM/KMFmG2AIrw0xyVLGSUQavh8TUMC+mMuZZKdggYD8AlobMW+yZfKBsk6ddOqwwICKNQ+WofTT9PVirO4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199015)(31686004)(5660300002)(2906002)(41300700001)(8936002)(8676002)(66946007)(316002)(66556008)(4326008)(66476007)(54906003)(36756003)(478600001)(6486002)(86362001)(6506007)(53546011)(26005)(6512007)(31696002)(83380400001)(6916009)(186003)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU9SYmk0RFhMS0licS9weTZ6ckJRUmZjbm12bGlhMHB3OEV2Ly83VEh6eDIr?=
 =?utf-8?B?NmlwVHJmaU9aV2x4ZWhFVitySE0wbjJ1c1dnYVJ5ZnBiUEFYZ0NFdDJLN0xo?=
 =?utf-8?B?NEEvTEtoUjJwMUZJRmZiNTlmUVBFMVVLa1FRZGVSc01yK2hFd1JuQzkyMkdH?=
 =?utf-8?B?S0RsUStEWVJpNnhVaDN2b3JvRS94THdiRk8vS1kyQ0pReDAzbmhzTVM1T1ZE?=
 =?utf-8?B?alc5UWw1ZnZsajQ4bUo5TGJKMGZYWHhsSkFpeFQzRzFKQTU0ZytCcW1wNkdw?=
 =?utf-8?B?bnZSWnVacFMzOGVxRGxwUEd0emR6amQ0OUlRSG02QStLWStTbllLVE14VjFj?=
 =?utf-8?B?SXo5SmRDUnVyRkYwaHcxb0gxbGVreDkvQWFZWXVUN3VDMDVVb3NYQ0ZONlRO?=
 =?utf-8?B?a3V2blpZUE1aTHgrTC8xSEdDeHdIRVBsVmt3bnJvZlJMblpMMEdkcWdJRnMv?=
 =?utf-8?B?a3YrTzZ5RmxkSzdVU2FBcEs3MThvMngyem1qZ3p2N1VlTVBJRXB5eGZGaTdr?=
 =?utf-8?B?U0RMb1BxREYrMnROdEpnZUF5cnBjUHhQRGxhNmRRUUJCNDYxaHoyMHJUcWhh?=
 =?utf-8?B?a0tpcWNzbURnWXVnVHZTRDNHMXpERG1YTUZ2TkhOYzJLVmFLNjlobnBCbk1V?=
 =?utf-8?B?UEVvMCtNSGk1Rkt3TlZUR0JMOWJRTjd0NGZQMjE4YlVicGFJVlJqcEdJaWhW?=
 =?utf-8?B?QUNLcmk4dWNsWEI2VzBFNTdVU3BzZ3kyODVOakZ1ZkROWVVOVVhqT2dlOWt0?=
 =?utf-8?B?OHRsVnJCVnJNUXpBd2liVm5TRGlSbmlSbS93bnUrdlhNQUh3a3lyM2lBK3pz?=
 =?utf-8?B?VU1OTjI5czN5K285QU5wdDAxaW90VmRXdUthUGwwOG5RRjlCZ2xJcGhGVk5n?=
 =?utf-8?B?cmkwM05OR2RBR2xEaFFuWUhkZU9rN2hkblBWMEg3dU9JTnZnNTlvWWRTZ1dk?=
 =?utf-8?B?cmJnaS9CMzJ3WjE1OWNrK2ljYysycHQ0S1NXejZEWVU3OCthNjNIRzhMeXg0?=
 =?utf-8?B?K2FqbmNzNXQxSmw1QzdTTGY0SWYwb0IrR0RSTWZodVZuK0RXaytPY1ZqWnlZ?=
 =?utf-8?B?Nk9HU3dqVFM0QjMyNmVtTEYxU1oxc25rK1NRc2lqRFhrUkxxQWRQWlhNWnUw?=
 =?utf-8?B?Q2FQcE5xbTVKN2lSQy9vMWZwcGZsTXQraVhFL1Z5aUdMNVNuaWR1aDlPRkNV?=
 =?utf-8?B?c0dNOFhOdlBTSlNzSmIyVS9sZTRHd1kxTGtBVjhEUllyY3cxSlNKd1k0NXhv?=
 =?utf-8?B?NkZVRTBZZ2crS0xtTDJMWGVTWE5Mci9ZK0NJWjV5YXFxR3htcGpvVEl0UGVC?=
 =?utf-8?B?ZG9UcmRlVzd1cWhMTy9jaUZjUXU5K3JLMlJYcDF4eDl1WURvUWRoak5OV0RT?=
 =?utf-8?B?WUpxeFpUaDZEaWppenQxcmt4dzh0N2F4SnMwc0tDVGtBT1kzeEtXRFhPd2wv?=
 =?utf-8?B?blkwM3hFOG90am1wL2RxVVQzYmFENklCdlQrU3VjRU5LVEZ3a1BUeVlaTjJm?=
 =?utf-8?B?bXVZdlFIWkJ5RVp4cUFTT0V1ZWYyQkVHZzdXQXU4bmllcnlCRTNMZW84WWpR?=
 =?utf-8?B?VkhYOExGd0drVnpsaEZUa3I1aVNRY1dUd3QvNW5YeWVvdW9TUktneVp4U0Z0?=
 =?utf-8?B?UDJMdU40Ynl0SUxpRFFJRmdWeUNQM1dydkFJanRrTEcrRFNrUWFBQkVRMmZS?=
 =?utf-8?B?TEw4QmdGVUI1ekFsZ1M1eVFhMlRScFNsT2N1OCtXbllMZ3phRnFHZmhqNnNt?=
 =?utf-8?B?bm5HL1FjWWYxalVKVlgxS2g2cXBzTDBIdlhWcmw2ME9CNkl1ZFFjWGZUdm5r?=
 =?utf-8?B?SzFxR2hnb1lnYVhGbWpXK0FtTFJtaXhabWtMTzlGdmxmMEJYWW9jaUlOdGN4?=
 =?utf-8?B?OGZlWUdYUHVNRjFNVzBDWWNQbHBrS29rOGE2am0zUW9KaFFsUC9uV3dNRVBq?=
 =?utf-8?B?Mno0REVDTlhHZkY2UDk4UnNUby95OThLT0hza2RFZzBCSXhtalNzOWllNzJP?=
 =?utf-8?B?N0prSmZqYlNnbWdaR01IeG91Wnh5UzQ1c3A3ajQyYVFkcFNiUytoVE00dTRY?=
 =?utf-8?B?NFZUVzZXQ2phRjZXeDRSQmhUT3djWHN2VDlRR0N6eCtuZWRsbTNXbEw0MEJX?=
 =?utf-8?Q?cLcf6IJzncbYZiv+6eXwewwYK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fbfc0d-d8b2-4147-ef2d-08dac1a457c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:14:41.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrNqzppsrmBzzSKnZZxOH8ul5hxfIfPdulP74/w5EhH9+G9cO16+9aU6HhmmP0Mhh8xOAl2Wwh3LaGB+T6tP6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8858

On 08.11.2022 12:38, Roger Pau Monne wrote:
> Like on the Arm side, return -EINVAL when attempting to do a p2m
> operation on dying domains.
> 
> The current logic returns 0 and leaves the domctl parameter
> uninitialized for any parameter fetching operations (like the
> GET_ALLOCATION operation), which is not helpful from a toolstack point
> of view, because there's no indication that the data hasn't been
> fetched.

While I can see how the present behavior is problematic when it comes
to consuming supposedly returned data, ...

> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -694,9 +694,10 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
>  
>      if ( unlikely(d->is_dying) )
>      {
> -        gdprintk(XENLOG_INFO, "Ignoring paging op on dying domain %u\n",
> +        gdprintk(XENLOG_INFO,
> +                 "Tried to do a paging domctl op on dying domain %u\n",
>                   d->domain_id);
> -        return 0;
> +        return -EINVAL;
>      }

... going from "success" to "failure" here has a meaningful risk of
regressing callers. It is my understanding that it was deliberate to
mimic success in this case (without meaning to assign "good" or "bad"
to that decision). Can you instead fill the data to be returned in
some simple enough way? I assume a mere memset() isn't going to be
good enough, though (albeit public/domctl.h doesn't explicitly name
any input-only fields, so it may not be necessary to preserve
anything). Maybe zeroing ->mb and ->stats would do?

As a minor remark: _If_ you're changing the printk(), then please
also switch to using %pd.

Jan

