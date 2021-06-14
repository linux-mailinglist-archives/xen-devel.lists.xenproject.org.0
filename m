Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B733A673E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 14:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141433.261255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsm9R-0000BM-UX; Mon, 14 Jun 2021 12:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141433.261255; Mon, 14 Jun 2021 12:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsm9R-00007Q-R3; Mon, 14 Jun 2021 12:57:13 +0000
Received: by outflank-mailman (input) for mailman id 141433;
 Mon, 14 Jun 2021 12:57:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsm9Q-000070-Dg
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 12:57:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58b77765-4781-4ac4-82fc-f5560a254cbb;
 Mon, 14 Jun 2021 12:57:11 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-UlbjW3WlP5aZkb8YpkqmCw-1; Mon, 14 Jun 2021 14:57:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Mon, 14 Jun
 2021 12:57:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 12:57:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 12:57:06 +0000
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
X-Inumbo-ID: 58b77765-4781-4ac4-82fc-f5560a254cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623675430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E88rxmzha68DnX7MDCCamoXuD+jSA9NYX9LK2SOH100=;
	b=mEnEHJKdblzuNPHdJB2WjMoi/fpPUBcwC4mqWMn6b0nLOZfFBiv8K+VVu5IyAPh5u+V6Mo
	74sy9ZfvUVDIIhMXKaPfJNgjGHL2HsOdR+SmBA7HsxyHJrzoUTOMc5HnOXXTjaFydLGHPz
	OxwCergDVNz2QuIdViRs4uJl5mVIXOo=
X-MC-Unique: UlbjW3WlP5aZkb8YpkqmCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQIhAwYUQ0++TmX4+yYQGaax+xmgOU8zk6uV+6KOcwhQEFTmT/qiRc2GCEB3I0aJKNmu8dWoM+H+vr+ZhiCCaNQp7MgxTpd4dckIZzCirQiziY5qxHb4BKNflION0gr8taXWmgwa1QoxxdfRI8bNRfdwcriSWGspu1EMAeUxtwHsF2MIVGH+mhteJgfpH05QbTv+6O6YR7R3nu1rPA6Olda1+uGIAGNjMtcrUV7CnZ8P5moLbcLu3hhwtZ+ZGKYEzRncCQx39Z6Y32a1TG4QhsBkh11HCDsNjN9bL+aM+4ugEA8P3CMH2G9z3NYofE+dqoAqlG99DuEp0sCxEytHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E88rxmzha68DnX7MDCCamoXuD+jSA9NYX9LK2SOH100=;
 b=oWU2G/RhwJjCbjUxnTOJJ6v9nvgMijXvwC0SwS35zbMEWA/NYLxXzA0tudZDMVx1m4MW4e7kAY8QwECaDCDxy9x8CWO87Dj8AlpJcU/0tKE3Rnwzq+28kvuWWc1OU5IP6blWCjAtY87QzlLK/0OgJ6mmQRN9cIGF9EqpnfEdgzYBMTlPv+L9sS/JUG6D1b+KxylsWtFlDCq/ZHXZdhpW7IdrfukuPm2PueIz4W78ByFqprryOLqTxeahVRScOa6pyEH+rmPPM2WzR/hHdoK6dBNbzGw3DD1r1YKktcPs50nVzUOF7sEga5McrAI3ifgqyIxLc6mbN6xKKmvmgKqfAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/5] x86/msr: Expose MSR_ARCH_CAPS in the raw and host
 policies
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Edwin Torok <edvin.torok@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
 <20210611163627.4878-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bcb7cacf-f18d-ed74-00b4-854b403bef2e@suse.com>
Date: Mon, 14 Jun 2021 14:57:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210611163627.4878-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR10CA0100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2c7c21c-6493-4e7e-fae9-08d92f33e9ef
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233528F7B46E203A6D7B9507B3319@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	42KPm/14Xk1TUJgx6zlOsyQiCn8gAXtv33+BCggpCzbQy95J9bdHWDzrzCSQCD9R474gYYVYIcUDmPZFNlI5zbd000q3sXdjYUaPDMkvsTDXE5TgeaJmkLEf3jtQm5yD5Cg8qLPXfsZ6XVO32w6Q3Rx5aDznbGEAUUCRX7TYVvZ3rnMoA8hFVbQonRmClG9kUWFq8I2jXK23Ml4w+UzpduQeYRdUbJzG2bOFgrHEsVfPTlyueTATlZYVm5jy7MD6A8sL5NpUeFbJgN82/qMhb+45jYNcX7OtiWpHtyXy740WdnXW16zHmX3q3j9zwTJTHHIzLQLIqlvrqS8/+J9YhSUwtfs8CHytdMsP6dk+v7YPChQbjhvVF51EVkGV8QPyZ5gSxJxM65qCWK0w5oPj9hWPZ/3uwH+gY+duMG0nTPTfwypMt31U0A1i84wogR6PUTTF0evuBQelG9kituiddc8N4/EHYFSymL1yk+cJjnyS5SvjWWgftQARButAU+kL2TeGxOCM9XJWOBcg85e1U936d85buPgIJmugdGa82s0ocu6IJQWdrNCyxUilU/WUfM0YzsoHGncPYzCD2WMZ9NSvKnUPMC5tyUCOuaDxlXlRPsNEhMbd7tz7Qr8EjZTmZoNymIwlrS10d60lAHSIx1C7lXasum2DR99ykiifQ7HglMsbkfzt3LCYs6BjL43G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39840400004)(376002)(346002)(366004)(478600001)(6916009)(4326008)(83380400001)(36756003)(6486002)(31686004)(2616005)(956004)(8676002)(2906002)(8936002)(186003)(38100700002)(53546011)(5660300002)(54906003)(6666004)(16576012)(31696002)(316002)(86362001)(16526019)(26005)(66476007)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWQrVjJaVmZCQjBOVnZJcE5rNFg2QktGbGh4cFVkSzZsWWZDMXc0dnR6T0Uz?=
 =?utf-8?B?cDdPdm9FNDdvM0pJR2YyYzl0SEI2ZXZIaTVmT3JLUTRTTlhZY1BFQ1cyT3gz?=
 =?utf-8?B?V1J1S0N6eUthYkx0YkN4WmFNbWttMDRWZ0dVc0I5RGErV2ZtZXZNdnZiZjFO?=
 =?utf-8?B?R0pSY0VUZkN1aUZ5TTlQYUF4NUN6Q01GMlN6b2Q2RDBWMHVUdkJ4dmFTUU52?=
 =?utf-8?B?Zi83N2Z4RmpaUGd1blFlWHlKbGxDSHdoS3dLbWJLcGhLODNubTVQeW5zWnJ5?=
 =?utf-8?B?eWdZVWNzeFRaRmtPL0d4cDBCQituSURSMWl2NVFUbEpDb2VHV2RiSG5EQ2I5?=
 =?utf-8?B?SmMwTDArR254enZkUlErV1oreFpaUlNad1VSQjVNL21tdE1scUNyVWJIaG9F?=
 =?utf-8?B?OUVkeDZ6Z0dVeCtjZWRWaGYza2E4dUVFY2IrdllhMGNHamljWXJpaWVkSWpx?=
 =?utf-8?B?THh5YVN6bGZtYjhkN3V5VjJ0V00ybGxuWU5tZmRBeUNvZFlmdXVLc2pNZlJh?=
 =?utf-8?B?bHVRaUEwYmZDR3IwUWo2eXl5VzcwN0V4dWRvK3AweWRTRENHY3AydFA0cHJO?=
 =?utf-8?B?TVF6My96YlFnczUvY3d6MlVrcmFhRWNUcENWbnVtYzVYdkxqZks3bk43Y2pV?=
 =?utf-8?B?RFpSUWRONFBLT0FNOXJDdGF1TzRiWlZWQXV4QlhXa05FQmNkUVdpUXJBcmFG?=
 =?utf-8?B?OWdWbTVhU1NsSTlZTkM2UzhzL0d5dVE4WDc0RDNpSkdxQTVlLzFYVzJjNUdo?=
 =?utf-8?B?c1ZxV3JQeUpTaUNBblpISzJwMWRJR2RNaFlMOGRSTFN5dkFZOWhqMzVxMDFK?=
 =?utf-8?B?eEdJbGpNMnpkMWhUUi9YUkNWb21VeUwvRmxlSmtySkI3dWw0Ynl5YzF2MU84?=
 =?utf-8?B?cU5RK0h0T05QQ21ldjZweWlGZzAyYlM4WWdsWno4dC9scW5aeElLQXhnMWZk?=
 =?utf-8?B?RGpoSkdVUGtpd1RGMnJpUEZJbmFFZlpmdCtNb0laRzJRVUJ5U2ZWUUhMaHNH?=
 =?utf-8?B?Y1NzVk9WYko3ZG1MVXNWMlZCNzRubzBIcklHMGtBWkdEZTM0SGNxTHY1SWZl?=
 =?utf-8?B?MllQNGNibHpQSlZISHFDMGRheDBWRnFMOVVvL1Q5N3lKNENnQVBXRFY2QzI1?=
 =?utf-8?B?SktKbi9yWVQvTG5KcExyM2FTVS9VSTdRZG1uODkxdkdsUGh4SGVEY2Y3cVJF?=
 =?utf-8?B?ejhCMmtjWlJ4ajdUUWtxMGU0c2ZIQzRuWlBjeVJOOVljYTlUZStYY2Q4bkU4?=
 =?utf-8?B?eEZsbXQrdHNYSHd6bkRncUd5OVZuM1p3b1pTa0xhSDI5K0dNN2wzeTRZLytl?=
 =?utf-8?B?ZXVZTVYxVUNQOWd4WnVuYnRXVkc2ZElFUk5DVER4bWRuS1BqMTFya0srUFpV?=
 =?utf-8?B?L3pwdFRocklzc2t2UExtRnhLak91alRCdHI0YU04b3BUd1p1a3FoaGZ1QklK?=
 =?utf-8?B?RW9NczhIYUUrWU5TYmx5N1gvQTcwaUdSdzcrWFZzMm9FK1hJUHlLRHA3WHI3?=
 =?utf-8?B?TnBqeC9Xd3kzSU5kQ204UWUxUGxZb2lNRDlxNU1wQW1nVERjQlJwT1k0bVcy?=
 =?utf-8?B?WkxWeHk2MEF3aWlrUVlpRnNoZXY2UFQxdjRZNjhIODVHbWozZTl1TWpxMmo4?=
 =?utf-8?B?bGFiem11RGczNnJxcHNnb2lINVpZUXRGMzJDb21JUU9odzF3NGFLVy9zcnQ5?=
 =?utf-8?B?Z1JOcnVKbENkWVc4MWVlT0NyT1I1VHlkbjI3cnYvZUp2WGVUZk1qMzR0d0wz?=
 =?utf-8?Q?FOOiuXqr0/CFRKymZNAR2IJcRJBwMn/trMs0lIt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c7c21c-6493-4e7e-fae9-08d92f33e9ef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 12:57:06.5251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phbzAA+QL8aHQRJt7+OQToV/00TcbwHYyNLZiyk2uTZyahC69DFfYWXBXZVtu9VDwdiJ9pwJa63REmCQEtWWxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 11.06.2021 18:36, Andrew Cooper wrote:
> @@ -60,6 +65,11 @@ static void __init calculate_host_policy(void)
>      /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
>      /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
>      mp->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
> +
> +    mp->arch_caps.raw &=
> +        (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
> +         ARCH_CAPS_SKIP_L1DFL | ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO |
> +         ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_TAA_NO);
>  }

Isn't this a little too simple? For CPUID we consider the host policy
to be what Xen is using. Taking ARCH_CAPS_SKIP_L1DFL as an example,
we're not using it unconditionally (depending on opt_md_clear_hvm and
opt_l1d_flush), i.e. there's command line control over its use just
like there is over the CPUID bits. Or take ARCH_CAPS_RDCL_NO, which
we set unilaterally for AMD/Hygon.

I don't mind it remaining this simple for the moment, but then at
least the commit message should state that this is currently over-
simplifying things. If you agree, then with suitable wording added:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


