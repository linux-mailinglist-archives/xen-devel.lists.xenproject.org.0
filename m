Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D789C54C205
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 08:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349718.575872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Mey-0007XS-Ha; Wed, 15 Jun 2022 06:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349718.575872; Wed, 15 Jun 2022 06:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Mey-0007VP-EH; Wed, 15 Jun 2022 06:37:48 +0000
Received: by outflank-mailman (input) for mailman id 349718;
 Wed, 15 Jun 2022 06:37:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1Mex-0007VJ-Gs
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 06:37:47 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe08::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa6e7f6b-ec75-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 08:37:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6847.eurprd04.prod.outlook.com (2603:10a6:803:134::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 06:37:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 06:37:44 +0000
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
X-Inumbo-ID: aa6e7f6b-ec75-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSyA5ZVGzKgV6UifqovkE5NeeDXY1KHn2wKXAUF2OczJDWlRg1z0bDh/YesXrPvXbxsztKK2iJuQ+2kejfZ3z6FRE17ePIckOe82o/Nj1vEgsN5OdSzyZdsxAQRU1YY94pdULz3k9doq6/28lFamwXqohxyOn/rcZBXrMlfq0cjdTxHZdtf/ZI5NrgPTLMVOAxqN7RlERf7FGnZBMdMSDsFg44T4tcujKdVNPz3jYCX90YSg79dbghGe+m/kLEZxcyd1PUIFROkkm/Ud6fir66Ims4+1FsQG1hm4aNyz+Vw8KcKUrCJAAs0cRVuMBFEfRloE7MfVJy77LtcknXq3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQh1eZRoccmbIlRrRVPPkQHkKBonLorlgOIhyZcQf3g=;
 b=iOwIbvgXoFWHlLF+B8JGZqODky0cfA40bRHPBPYFf/UoeZR2EE6zUpsTJENdXzc+EEkuQRP1aWUn3XpACb0syyzMP/hoHaxqHPpuze+dcG9dEbmHSYLw8ME/E83MpOyRiEyXBaaQo25nrNsfiUO/hphLsGG2wL8A680aAtkbXfrDtOZwjBgqYg+hfuez2HRT+0xa6QITSsAA1UdC/QvguedEzusntNfhoKCJ2s+PlNi8zR+LYkxlDBrx37QAbSYSnSOOsVidh1Rojc+FlKL0q4byJPMOAvhkxsbQiGkYKqalHdiADU+kVUqtDWvyoa8roYXU1lKkKX9RY21BDkF3eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQh1eZRoccmbIlRrRVPPkQHkKBonLorlgOIhyZcQf3g=;
 b=l4+qmxfl/xnyZ9kPzigL44zGpwy1M1jXM2dgWPOwCpxj7bmYn7zA6lMmfpJiMDlxi4htQrgz9GQZUvzT0n3Fog1ZCUvO5Lg2nrJWUEjfn/t5NGrnKK03iqeGu09uRlBclJfWa5zDzp+VOcIFQWw7KITd1ppRqXPY1re5XE5eeJ5AuUSZrgyBs8d734ffWlml8ItKmtuUewkKLOX5zAoOKOtvK1RrpGufZjXIT9EEW1+HjPFCipK0XofhXplGGSMxlhYneBnsPmjZ0DPnCpIu3ezy+iSoPaCnseftniYXHvKKnsISXAyHQAmqCMnljovzJXyeCKVKl+sfNVaGOUR2cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09b49900-9215-f2a2-d521-a79cf5ce5f0f@suse.com>
Date: Wed, 15 Jun 2022 08:37:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH v2 1/4] build,include: rework shell script for
 headers++.chk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220614162248.40278-1-anthony.perard@citrix.com>
 <20220614162248.40278-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220614162248.40278-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0090.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a9d836c-4af1-445c-abfd-08da4e998dc1
X-MS-TrafficTypeDiagnostic: VI1PR04MB6847:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6847602917803844D10AD25AB3AD9@VI1PR04MB6847.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a0Y8NMRkwLbCRT3ntsGOfbM7aYGRzKYcE/HcBN4j8H2OU9JhgztYiCgRGeZnaH0pdo79j40iyfGnAyEUGUHpCRC6cciYqI/TDqE7m2ISADFmrbFtPf22kjV/0kqlcQ5ewVmYUu6efCSWpdYfJeWy9xS6HM5P/+khNgrtVZOmzb/+VCbekFboQQgv1Gza5KoDimkNmgDDYDknsnfuybxaisaYNYP4ori+TBXdq4yjA3hknA8ve4rOr+20D22yVM5px5fk5rAwY2eGNA3gQ8hevBGK1ZqSbze9wKjyj6ufQdn+nMoGhM6yw2eZYc9OSq2XuMXTPk3BsNPeVA8URInm0gmqUsWuV/+0LwjKQNk2uNgjzyw1D8ujxbBnfQzIv/Yv1Mq3q1TDYcGWx5xZQTko7WrlgWhi2+G01nJ0akN4jQ7gAZ6HutBaqa1ikalIYJviH6eVC9RAf7l3g31Bxu3CEKS7shD8amNA2wW/1+RXI0CEoCaSLzxiR1TzKRruoJQXfAjUt/DPHixDJbBx2Bsg/7JHLQKyhXc6ANrTxR9kC4rPMvp/ZaXV/4PZVSQj9Zt0/IQqgXyJi70ddfPyxjIytVRL1Os+XzinMT+2EW5fHQGh+j/Vs0lz0k6xcz+Ah2TmoegyKQMh075RNky+A3pwCjyvF3OW4ls7tnaXrm747bQa1adXavn4ehD6OINdAyBQa268tG3ts3VeEPL5MVwDAP98fy4KqmlssjofmDZoga9SMBkczhhQ+NqyNFmOQlRZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(66476007)(4326008)(8676002)(66556008)(66946007)(53546011)(6506007)(26005)(6512007)(83380400001)(5660300002)(38100700002)(6916009)(186003)(8936002)(6486002)(86362001)(31696002)(316002)(508600001)(2906002)(2616005)(36756003)(31686004)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUdrQmZzN0RhVUFnVWZXQklqZzA4VU9ZdjQwT0MyMjhVbEQzR1hCRkM5dEhN?=
 =?utf-8?B?WkFRcjhUcy84RG9WdEtwcHQrc1dIQ3l0bHUwWFhlSCtXeWZ6d0prN1hnVllD?=
 =?utf-8?B?QmtTVDBScE5WY2o2TnU1d1EzTTU0WkV5d2Nrelc5eUJ5QVF6SS9BNERBS2xE?=
 =?utf-8?B?bkVKbW9saXJINVFBd3N5MlVITEsrSDlJalZqK3NMdXNwSThFeXMwSmhtcURS?=
 =?utf-8?B?VE1laHhIcDRhc3EyaXQzZjg2NEljQWVvUkNBOXVPTXRTNEh5ZUEvUUtwZEZt?=
 =?utf-8?B?cTlpekZETWs0WkY0VUNzMzM4TE5LWTBteGl2WG5ZbjhmdWxkYzZtS1FkTjJZ?=
 =?utf-8?B?TU43NkVxVzFjR1Z6bHRkaGh5VFJRWnd4dUoveHE1VVFpQ0cwWndXYkNBb2xN?=
 =?utf-8?B?L0lZT1RGbVU3cWZMblRSWlpFMllYWEgvdjV2QmRsSC8zNUFOcXdGV2dKRmVR?=
 =?utf-8?B?clBHYTEyaWJoVXQ1V2NacEUxYk90T0llMXIyNFlpRjNKZzVkQkYybHpQVjhB?=
 =?utf-8?B?ci9ZSUFRV1F6Y3I4aVpobG9ta2VNWWtMY3NuQ0lsVVBIQkoxOEZZYTViY0RL?=
 =?utf-8?B?RG54MDgwQk1RUDl3QU9nMTZOZ1RWOGdzQTBnRjdNMzZiQXE1K2owVWp1bDJi?=
 =?utf-8?B?ZlhJVU5ueFRMRmhDVzRFTVIrelRPS2dOT2UvOHgxbEFMN3dPbTdkc3UrK3dB?=
 =?utf-8?B?Y3FYNFczdWpQaDc0K3B0MDhiR0Q1UENzSlh6c2FMZDRId0pYOVdYa3ZlUDZZ?=
 =?utf-8?B?Z0lSYjlIYTNVWXJXNlp4SnVWei9KcFE4Sy9Nd0NmV3dwSmtWMVVidGhqbHRL?=
 =?utf-8?B?RU93TUcrK1BqME9WZCs4M1BiUTFidHlWMmJYOGVNK0JoVDViN25qYU5xYmF0?=
 =?utf-8?B?Zjd2SEcvOFFYd2lpY29ramdJelFRb2g3NjQvdEpvaEdaNUNYSUlCakk0dDVL?=
 =?utf-8?B?WFB1NlY4dlF4T2Q3WHNaM204VHpRZFZ5eG1oNzhmTmJRYVdWYk0xcHlGaUcv?=
 =?utf-8?B?d1VCQW56VkI1cTJhRS93OG1GcUVIamlQaFlyald3NDNjV0dvVndUbHpoYUVK?=
 =?utf-8?B?SHlmS212cG0wZW9xQVFOOWUvdWd0aytJaFZJYTZRN3o1ZEpMMFR6UUcrQ3pr?=
 =?utf-8?B?bk81cGVGY1NQVVFaTndzVnlueGtyd0VydjY2M2tuRWJtZWNzNGdFTzhIbDVS?=
 =?utf-8?B?U3U1QnZCcVNPNVJWK1F2SVR4WTJZZDRFejVsa29aQWtrRUJrTFh4LzBteklO?=
 =?utf-8?B?N0FXUFhlQ1ZHWG11aHhESmsvODNEU1hLYTdEeG9TUG5Ccm9JWDV4bjdTZkVx?=
 =?utf-8?B?YTB5RXZuQTBDNEZOZzBsMW1KU3Z3N1pXREVKVWtNVCtpYXNUbW11b2s0NTlp?=
 =?utf-8?B?ZUp0ak1UbDdVNHdXSHRNdnU3SVJZUUpjYW5nR29SQkZ4VDJvNXFsWVZaNnl5?=
 =?utf-8?B?YndkVFRzSTQxdlNmS2tlcUxDV2ZERVcvYXFXZWNsZ1c4SWJlSXh2VHdLd0Ro?=
 =?utf-8?B?clhtcHhYY2lKS3ZLNmRFd0MxZlZDNVVWM3RscVRJZmlobWpjNVE2NC8wT3Br?=
 =?utf-8?B?MEtzQytteS9Wbmg3VHFyczJkTVJrK2xlMjUrUkEwd0N1cG9TYUV0cUhGOFA4?=
 =?utf-8?B?ZnNKLytMcFp6cUdQVkdZVnNQWE53Yzh3aEt1VGFOaVFwaGhNbUd0Z2MxTkQw?=
 =?utf-8?B?Slc4ZjVmY0RwcjY2bm5ER2pQSCtXZGozNDYxdXpyUXVPcTNMKzFhcHMvOWlY?=
 =?utf-8?B?RUVsWnRCTlBjZi82TnhmZTc1SnhsSFJBczZMSG5SY3ZQTmhEVGpCbDcxY01m?=
 =?utf-8?B?eVVUZXZuYWZwVW9XMEZnVGI4dEl2SWVTSG5JODl1cXV3Ym94ZjI4d08zZi9L?=
 =?utf-8?B?VFJHcHh4UStmWDNqeXY5TUNJMG5Bb29tTlp4eVJlZS92YVRtS0psNk1WVEEw?=
 =?utf-8?B?bkc3T1JGd2tiNFZvSExPWThrZzV1eVFRQ2JBL3VjTkQ4YytXT1R0QUNBNktC?=
 =?utf-8?B?Q1pKeTBIYzh4YzhyeEVUYWZFa0c4cVZSNmdBeFJjYjZqdUhwWFlibm9wZHJw?=
 =?utf-8?B?SUVlSjRmSmVlWUdlTDlWR0J6dDIwVUM1b2VTWTNIUkEyMWc2NHJIN1RURXY3?=
 =?utf-8?B?TFc2VGVGVkI4OGFrSitOaytzUVkvak5zWjNiQURoUGpYRmVra2NFZG54VUFI?=
 =?utf-8?B?amNRaVZyc2ZSWERXWlFMVmxqaFMwNnNlVk9oaVB1SHNlMHM2QitFanhZWDJq?=
 =?utf-8?B?aEZpeTFNSmxUTkpkVXJnK3laMEpjUkVqN1JoTk1DQUIyUlFhWWpmZzUzZENB?=
 =?utf-8?B?SWFsVksrZUZOSVM2WWozalIwSzRqVm5uQ0lEUEpMZVB2TWRXTFAzQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9d836c-4af1-445c-abfd-08da4e998dc1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 06:37:44.2526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZC0rKaT5SVcFe8DC4HhMmaebcOkZmssgRhUdHNPt68K8mWIjL5q0B/EIMgfhr6fMI1BeJq0XRyR5DqV/T7QTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6847

On 14.06.2022 18:22, Anthony PERARD wrote:
> The command line generated for headers++.chk by make is quite long,
> and in some environment it is too long. This issue have been seen in
> Yocto build environment.
> 
> Error messages:
>     make[9]: execvp: /bin/sh: Argument list too long
>     make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
> 
> Rework so that we do the foreach loop in shell rather that make to
> reduce the command line size by a lot. We also need a way to get
> headers prerequisite for some public headers so we use a switch "case"
> in shell to be able to do some simple pattern matching. Variables
> alone in POSIX shell don't allow to work with associative array or
> variables with "/".
> 
> Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Fixes: 28e13c7f43 ("build: xen/include: use if_changed")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> 
> Notes:
>     v2:
>     - fix typo in commit message
>     - fix out-of-tree build
>     
>     v1:
>     - was sent as a reply to v1 of the series
> 
>  xen/include/Makefile | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/include/Makefile b/xen/include/Makefile
> index 6d9bcc19b0..49c75a78f9 100644
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -158,13 +158,22 @@ define cmd_headerscxx_chk
>  	    touch $@.new;                                                     \
>  	    exit 0;                                                           \
>  	fi;                                                                   \
> -	$(foreach i, $(filter %.h,$^),                                        \
> -	    echo "#include "\"$(i)\"                                          \
> +	get_prereq() {                                                        \
> +	    case $$1 in                                                       \
> +	    $(foreach i, $(filter %.h,$^),                                    \
> +	    $(if $($(patsubst $(srctree)/%,%,$(i))-prereq),                   \
> +		$(i)$(close)                                                  \
> +		echo "$(foreach j, $($(patsubst $(srctree)/%,%,$(i))-prereq), \
> +			-include c$(j))";;))                                  \
> +	    esac;                                                             \

If I'm reading this right (indentation looks to be a little misleading
and hence one needs to count parentheses) the case statement could (in
theory) remain without any "body". As per the command language spec I'm
looking at this (if it works in the first place) is an extension, and
formally there's always at least one label required. Since we aim to be
portable in such regards, I'd like to request that there be a final
otherwise empty *) line.

> +	};                                                                    \
> +	for i in $(filter %.h,$^); do                                         \
> +	    echo "#include "\"$$i\"                                           \
>  	    | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__        \
>  	      -include stdint.h -include $(srcdir)/public/xen.h               \
> -	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$(j)) \
> +	      `get_prereq $$i`                                                \

While I know we use back-ticked quoting elsewhere, I'd generally
recommend to use $() for readability. But maybe others view this
exactly the other way around ...

And a question without good context to put at: Isn't headers99.chk in
similar need of converting? It looks only slightly less involved than
the C++ one.

Jan

>  	      -S -o /dev/null -                                               \
> -	    || exit $$?; echo $(i) >> $@.new;) \
> +	    || exit $$?; echo $$i >> $@.new; done;                            \
>  	mv $@.new $@
>  endef
>  


