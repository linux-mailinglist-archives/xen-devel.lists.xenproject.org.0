Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01244A9982
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 13:55:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265492.458876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFy7B-0001Bc-Q0; Fri, 04 Feb 2022 12:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265492.458876; Fri, 04 Feb 2022 12:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFy7B-00019f-Ma; Fri, 04 Feb 2022 12:55:01 +0000
Received: by outflank-mailman (input) for mailman id 265492;
 Fri, 04 Feb 2022 12:55:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFy7A-00019V-3g
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 12:55:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8cc7e05-85b9-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 13:54:59 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-sMrmpkXENg6vjoidA2Kl1w-1; Fri, 04 Feb 2022 13:54:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7798.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 12:54:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 12:54:55 +0000
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
X-Inumbo-ID: a8cc7e05-85b9-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643979298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a6qy4LhzAK0whgBQ1zjKt/DIf7HAvxgfiwFoU6aPCZY=;
	b=BmO3cCV2zQbtcGPNHISgJ9XwUdKBaUmKqtuUllYsHK18bwOY/I8FWWEowDN+e3HsSPWAmf
	Dfz68bFPqFQVsLEx2izAWCn51eH4cs9ZhWbl44hqwx8TiPoIKijvovm9UYsqIwNQWPL3wZ
	MSYxyeOQ2RoJImifNbX58DUvH+yIhqw=
X-MC-Unique: sMrmpkXENg6vjoidA2Kl1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6wYipk8GAXwjEQnPLWa3ZjGUHLBXu8gAgVvzhLF1J+JuJ3/NtQBVQbbpMw4Eq6HZ1J9JJ2baxABW8x5cwdloJS8QNnVBT9bCt2pYsA1bWgBszQbKl0c2SQYVJOxki/aZ0UjhLzE/9cIh/XRIokTExhYH8w6HDV3f8QISwDMwKxPBzx94VXRbvjY5b1DVEBEr1cay452AnpXLiuNbmGLoH0/S7B6gyW10Gl3aYe3QXruhWnp2IKzeq+VMAoATvHMjpgh47DbNXcGQad2ZhGMzYb3Hdd1kJ6YUppX5VB0wLREHPTz7n0r6tCwg62Lt5yzUsw6NX8EWylVaOA9AcTkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6qy4LhzAK0whgBQ1zjKt/DIf7HAvxgfiwFoU6aPCZY=;
 b=DdcTA0SBpYFNnBL5aG5wWrYLcT3Vt/u5XHm50gz9JNjK7w/sHapvXUcUfKeGEUu4039S+jlCjdnKdDqfR4KIQ3ZYXRQeSlPOvsZRJriT+FcvyDJvmoMp3AszhBUAqXaHRFFNOWBRVh8gC/LAUjO6UlIFeuZ3Qo6PcWPbSVkvEEY4bXzksjBcC4tyF1hjLowb1AzIXG6MNMXlA5cgHh8iz0mvMPPRI7jNZ1Mwwm/OgJhakPJiPQa1DFkdU6CvrMlEjBd+CWeQPDFxjX2CLZEdvRe/1nkunL0bCg/pluqf87kzS3i0A4VM8zkPB5pIhw9VTaoeLa2UnmyOYrvWNuEROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11398184-dff2-cbe1-bca3-e2862cfbb104@suse.com>
Date: Fri, 4 Feb 2022 13:54:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen: Modify domain_crash() to take a print string
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220203133829.7913-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220203133829.7913-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69cf52af-ffad-477b-82d1-08d9e7dd8b26
X-MS-TrafficTypeDiagnostic: AS8PR04MB7798:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7798EF01E97B0983351BD40BB3299@AS8PR04MB7798.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SRaghqyAP75iYJgONX1xICtK64UBNMhHsdOekBdRuHXRb4Kk6K8m7DpbJfrFlaTKn6y+azqEEtFkOzPfLDwflwNRSGvmXu6QJB4EqSijuYFvbHA9+fDGp2uWsrPP7DKfZAz++ESvpPu3HqkxBLqWrJfV391keqqqy8IzfpwiOudYU+TP73fyawpV1HT6YCBqjJ88GxctCgc124Ek5cPeZPCCyLXUvyES0mJ/xQPBFRaOpEHWk9/UlA5SzGXJ8MPasLKDy/iXYrE2yQBznmguqeq90YHcBQ1fnfiKut0sVehSULvS4JU7B7o2AXzj//TlcV4IrugNqDN4zkmIJbdpRi8Sx4IzjhWbYjXx4VTKZhkkbSbGBYVYAuL3q2ZyyMJq6p3PxC0zr1Y57WjGh/zf06YOnvrtmLx58xf4ZUR/it30qZrU9calPOWhxmYo2zMDtrAKQeWui+RiNd5RuGVCOMZjzj0KnvQQaUlwGR2aJZNZXyBt2M1FJS/ZZL34GN+n3mmjIN5dmpCo+jAsjVwmn+js1oYXgWVtXTHeDSF1nIWxMCX34tIePTLqkoINYqAaMsyaVGjqogNZi+DRbcu3wgLqtx+UqhXP1xTugjKpIFsf8VEQCDGd6eGbOCPKsdFvOu+xREEQjvlAeI52PGcuYLoN7zIrmnPumAJyf8iCflI/j1cFVcLJn6Da2kaDtdI6dBDMXY3U/6w05XItiFH5l5GjIRNHw4dcG1wIjHGTyslKx526xwMpIydEm8NB8+M9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(53546011)(6506007)(6512007)(2906002)(6916009)(36756003)(26005)(31686004)(6486002)(508600001)(2616005)(186003)(31696002)(86362001)(54906003)(8936002)(66946007)(5660300002)(66476007)(4326008)(38100700002)(8676002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk9XL2o5N3dqNkJmamtzYm1pTGVXelRmVVBvMVB1eHl5NkV3TGZ6eXBFTlQ4?=
 =?utf-8?B?YnFoZ0VVVWhmTkI3bjRQdGljWEE2Rm13WVN1aU5NbHpFZG5wVXUwMW5CQTdB?=
 =?utf-8?B?dkpFWEJ1bDIrWG9Kc1FYSWdZL1NGRWpUdFNDRHliOXFqNUJTRjAzWG9uaFJH?=
 =?utf-8?B?MGF2VGFPdFhkUE9CcW15cmxwTW4wdkh0N094OHlFMzlkeDZqejBpU0VvRGVs?=
 =?utf-8?B?dTJIL3dCRjZwYzlDN0t0cXNJVWRmZk5VUmVmazdGNzFTMnNWZU00Q2o0UTZH?=
 =?utf-8?B?ZGduSEEvNDVVN2lsV2hHTFpJUExWNjNNVXRlWnVvNXVqUzN4SUZjdS9ueGFh?=
 =?utf-8?B?ZnUxd2dwNElTaktVVzk0ck90eVl5Njl3YzBVTWNtdUhqOHc5cHgvaTBSVHdV?=
 =?utf-8?B?ckYweUUyNXdiZ01uTHY5OFVoK0srZXkxMzA5amFVQjRQbk1DT0N5V3pNVEtr?=
 =?utf-8?B?c1UzTG5Yblk1QzI0TndSZWRQcFM2ZCtTclpEWFlqaTF3THlYSW1MVVBGNUI3?=
 =?utf-8?B?dHV6eFRPQkJocGFvSnFUMk41MnhJKzltQVV1TEdpblkxRXhiWi9JS01XbHZq?=
 =?utf-8?B?OHZycHUyRjBmN3RQVFRGb3VxMkphcHhzR01Yc0ZQVWx0NXhDckR2VUtvc0pV?=
 =?utf-8?B?bVFuOHp4bXNwMjJpVEhtQ0JMcHJUR2taZzFYYnp0bzlmRWVnbXkxZnJuUTRt?=
 =?utf-8?B?aFJZbVdQeDVnK1NiQWl3SnJDTXVYQzZxV0s2b1pySEZjS21xVCsxUDd5SEMz?=
 =?utf-8?B?ajZXOTU0dTRMcFBzS2k2eXZyZFEvZldoRFFqTzNYazVNVlM1ZW54TjU2czdv?=
 =?utf-8?B?aXpjVEZYcjEzKys0dDIyRjdIcWpnZnltNnNpa2RuVytSVGZGU3I5b0RpT09O?=
 =?utf-8?B?Nmd2d1pTTldTVnR4R2RQMGRKNDd0VVJPeXR5SGpIdjlLT29jU1F0VjJ2U2JZ?=
 =?utf-8?B?NXR6NC9iR21tM21DREtTOFBUL1k1Z3NqMWhYek5Hakc4U1d2REdSTHIrblNY?=
 =?utf-8?B?eVlDTVJhZEgrVXYzUjBBWDl6bFdNZ25pM29Fbll6b21sTVowMHhRa3VhUnlp?=
 =?utf-8?B?ZnhOWHJoM0dJRVZ6NGlLalJmUVBxMTRvUmNmMStIbEhON3Z1MFRhR2hJd3U0?=
 =?utf-8?B?Y3ZOR25Sd0hhdndhelNXeUJ1RHNCdEk3cm9TQ3RIS0NibVcyc0k5RGRLTms0?=
 =?utf-8?B?VHcwSENwOTcrRUpPak8xbFRnU1p2YnEwNEZoNkMrdXZyVUNLYysrTlBramJR?=
 =?utf-8?B?VWU3UWxkbWZkTUJleDJ4S0NlUmxWYlkwOXZJVmZna2ovSUp6VHpsQjVCMXpw?=
 =?utf-8?B?K2JCa2ZiT3pkTTR0QXFsaHRXSk80Ump0QWRRUzRIQlovQThxYkNHMzRzb0s2?=
 =?utf-8?B?ZGYxWjBKMDV1TUttbGRZdEx3OWkxMTdqaHNhTENTNSt5SThOUWVoSXJsRmNV?=
 =?utf-8?B?MkFjOXduNFY3aEJYRVRXQytyOEpSL0ZnRTBManFON3BpVTVWS3VWWnR0US8v?=
 =?utf-8?B?eWo1dXVYb3JzSElDYVFpbnJxQVRHeERhS0gxRUR5SXJ2aExvZnRwRnp4dVp2?=
 =?utf-8?B?endtQVkxenROTU9vSjMvdGFQZmE0QTQwYmx3MjU5ZGwwTGo1UVZTMUxRZmRM?=
 =?utf-8?B?dG81blJYSmQweklKRWh1MjRpTFJYYUVDeWM1K0RveURSWHdheklFcGdqUEcx?=
 =?utf-8?B?ZHF0R3hkcXBiKy93c3hQWnZ3aG5LRFpEV0NlOHNBdmlmMk9HVllKTFJseDVD?=
 =?utf-8?B?RFR1dG05UnE3Vmk2QVBBd29UTTBSSmRMNnUvUjdQRUV1T2R1SFdMQ1hOL1Jp?=
 =?utf-8?B?Y0tyZnlXSm5jamdOQU9vbGZ4bjJCcWo0TUt2M2R0NVcvWjlLUTBiNEVxT3pU?=
 =?utf-8?B?ejgyeloreThnYnV5WEcyQjZIZkRHVXlnb0h2YkVoLys3N0lJWWVxc2Q1Vy80?=
 =?utf-8?B?QStYZXN4VCtkc3dTUlZTNlhPNXl2cEtzYVcrRlk3ckZRczZCVHVSakNlTkEy?=
 =?utf-8?B?MFJsNE0vZXZsY3dHRExHbnVVREk1V3NHMjVYRkdJRlhxUGg1aW1ReGY0bm1s?=
 =?utf-8?B?alB4alJPY0czTTBrSk16NTZINThLc2FQNi9QbEdEcTR6Qk5BWndHWnRJdCtL?=
 =?utf-8?B?UE5LdDc5U2xCVGl1blY4OEZSK283QWtxM1ZEZm5zMVFaUXg4UEZKOUZNMkp2?=
 =?utf-8?Q?0kYIHs21n3sCp4oWZFttbsU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69cf52af-ffad-477b-82d1-08d9e7dd8b26
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 12:54:55.9075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgYeCfYC4Pav2y3JEduAVwQ2kiUSt6pqhdThFf2hbxT5BWVRrd1xhFQ3tw+sjRZDIhCaQ0DiNYhbzmi2M2Sqng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7798

On 03.02.2022 14:38, Andrew Cooper wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1693,11 +1693,8 @@ static void load_segments(struct vcpu *n)
>                   put_guest(uregs->fs,   esp - 5) |
>                   put_guest(uregs->es,   esp - 6) |
>                   put_guest(uregs->ds,   esp - 7) )
> -            {
> -                gprintk(XENLOG_ERR,
> -                        "error while creating compat failsafe callback frame\n");
> -                domain_crash(n->domain);
> -            }
> +                domain_crash(n->domain,
> +                             "Error creating compat failsafe callback frame\n");
>  
>              if ( n->arch.pv.vgc_flags & VGCF_failsafe_disables_events )
>                  vcpu_info(n, evtchn_upcall_mask) = 1;
> @@ -1732,11 +1729,8 @@ static void load_segments(struct vcpu *n)
>               put_guest(uregs->ds,   rsp -  9) |
>               put_guest(regs->r11,   rsp - 10) |
>               put_guest(regs->rcx,   rsp - 11) )
> -        {
> -            gprintk(XENLOG_ERR,
> -                    "error while creating failsafe callback frame\n");
> -            domain_crash(n->domain);
> -        }
> +            domain_crash(n->domain,
> +                         "Error creating failsafe callback frame\n");

I assume it wasn't really intended to hide potentially relevant information
(the subject vCPU) by this change, which - by way of gprintk() - did get
logged before (since we already have n == current at this point)?

Jan


