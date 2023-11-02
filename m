Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E27DF3F4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 14:38:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626911.977619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyXtp-00060p-DS; Thu, 02 Nov 2023 13:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626911.977619; Thu, 02 Nov 2023 13:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyXtp-0005yu-Aa; Thu, 02 Nov 2023 13:38:17 +0000
Received: by outflank-mailman (input) for mailman id 626911;
 Thu, 02 Nov 2023 13:38:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyXto-0005yo-P5
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 13:38:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 126f2cf7-7985-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 14:38:14 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7885.eurprd04.prod.outlook.com (2603:10a6:102:ce::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 13:38:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 13:38:12 +0000
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
X-Inumbo-ID: 126f2cf7-7985-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fV5rhPBX68eiYu282YqkgOAdYCLrkRWvmHkLpqmlwsh90QP+e1SNsOgMFjai2NNCuvzpQskRWQpTmD6Y53/3TBNrBGRkCJya+dKMG5rwUnrPRgaTAgjM4Jb3MAQpTwMH7E5VEcAcbbe8G5WGFsjWplN+ZHsnM2GGAqX62+gBskO7Y3aIY6w+dq94EHA2Ou846SYSKbLE1aXTdw6ZbrVq+Kbm0FzqLFUbLRXqtkVzwE8YZjgKh3lW911RP5CwQTwvVwGCPQN2R0KTz2lY2d276HYIyv1Z0z1KlAxpAHb3ACLQdD2YnVv9VALk0yCxzWk0RxujPnsbGctpeS+UxPrz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DShagFbYufQ7iJ59NqINy6XQkDydi3xSk7ddZkstnQw=;
 b=c1dto9v1M3V91pNzbpMxOkN6mcfKmdAmLChs+RTqRO5RJr8i7fzfDl3jrOHy929GruZp7ExCUhz97hxtXACkMWjDYvIcpRiSLTeHWQGXRwaPiIkszqVPd5YYhDPeUYOjBshwOla8zM8pVqj6RLOgEbMOTX16WkvTiwe4cYBsAWF6KcCBh38k7S2wAAdMEs5AUM7vjCi6H6SC5RAKFk6GFALZnI57d2LLAn6WFeCdW9Q7iPTt8b65Mq0Ry/TpseWZwM4MiQPtYaMe4H3OPwOOE+RW2XifNSC3JYYXSGx/3z/B4MZn1igJvdIB4NMdn7A+v4IPgvB7Xl3NHQM7vqoQ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DShagFbYufQ7iJ59NqINy6XQkDydi3xSk7ddZkstnQw=;
 b=Ry3RRAzl7i/BzV8HPOJVFvHOqFRcIBjEPqFodSO2uIJIm4BBc9H41TINv95Yuf4XycKCVgA7DmARV+B8ejBoet0RNixVuvTMEBYB//ZBuDtDMM956+LGceX7tEb9YijX0HyjSJmVR/gsOHxs2HsoYMhvklJrE8zZIng58juBz029BW0EfE2ZcOkU63JGhC7/If9FMfCIV3t2AHIAEN7hRvPjDvn64+lo1XIbvth1pOdlKFDWNGw8IYF8LTaHjVufp+OthEB9aemcC2YE2e7mWq2r6iQeiiN4FoTlCEYmsaexG1Hvp4ty6MZ+EOl4G8R14geR8E/8162VfKI/i/8BBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6ec9635-4856-6f3b-88f6-d1baddad4741@suse.com>
Date: Thu, 2 Nov 2023 14:38:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231031145259.77199-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231031145259.77199-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd1d504-e6cc-453e-9c1e-08dbdba8f539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	seH3w3QFGZ1AsX07RrIgluH168e4iTBU213DwO26tfDylL9ggXNHlyGLt//xQrUnoSe6SPKLMCBGP4ZP6/fVsc3nQ5pjamPpAPjL9GeboArQ7p60qxYFbzmCUDhupKENLHgJ1+tz9VMwjCYFaDL+eR09c0mjl8zpUfz9i126p2lQXvDPdi921M0v1h7mlk3U2asdVDdRqk0sFXGzwEyqBk3yILbBw0ilac1IVj5O7u5VboadATMlqtses+6li0RmfOp/d7mln9I2b22uN7gOmKlL8gpdVduMzeMBSgGXdaCN3yAWjwbSlnFh70vWd8eryzZNCU6+4lcSfeBh1/1Fgv+mm25yBldY3DHLOf5HQBO/1oCnHsoC/+UkQRYjenCpa8ZW8C+1a8dNcE6LFRtFskE2nHRRFHVzrkYfevLQF1oKb608N98Kz8vhuEkumsCrgQzpyxNCE0U7Z1GZ6VQVa0YDqi4uV99ygqHk2zuDkdWTNg7X82STQmaeP6XI1/+UdCQB0As6QqpiI6t7uv6GB7RhvZN5yxxa5D7U+PDKM66QGNGZ5xzU9T3TATvH1pJVohpr1VCE27/PdDZ2K6aZryA57FumvQCSaRqaKV9Pv1DrsU5V1xKgtCH2mDeGRLMk9QOQgJKi3RnPaxf0vXVavFY8F7Mzrqnn4nWvYqoD/CSd4m2t702XxIVhHMwwxVAH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(376002)(396003)(230173577357003)(230922051799003)(230273577357003)(1800799009)(186009)(451199024)(64100799003)(478600001)(4326008)(53546011)(6506007)(6486002)(54906003)(26005)(316002)(6916009)(86362001)(66476007)(66946007)(36756003)(31696002)(2616005)(66556008)(5660300002)(38100700002)(41300700001)(8936002)(8676002)(2906002)(6512007)(31686004)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW9EdWFwUHlmRlVHc2Y2YVJlOG05SnVJaGFydmFqVy9NWmo3T09EQjFwT1Qz?=
 =?utf-8?B?bUYwY1pZbzh3Z1QwbS9uWVh0Y3FyRWJvS3Zxcjg5L2g3NWZsN0hZc3VwTGtt?=
 =?utf-8?B?bWU2cTVXZWFEQklxZVVWUllsQmZiTGttQkJJUVhwT1RlRVBpU0tkb1VzNlVO?=
 =?utf-8?B?RXMzVUdDT3pBbTNsbHJ2eGVNa1lZeVRwb3pNTStUd0NZbExmTEZrbG9qMFVY?=
 =?utf-8?B?SThoTDd1TDRVNUxtekV3MnpUOU9adkUvVXVVblRudUZJUVdTVXFJK3psSUhJ?=
 =?utf-8?B?OFUvVWRRV0lWSGgycDNOMXY4bXdPekdLV2hsRjlVdk5ZRVNvclhSN0gxUnNV?=
 =?utf-8?B?MXR3RXZiVHQvckNPZDFRRUMvTzR3ZklhZWdhOW1wbWtPOFZwRzhpMjBIeitE?=
 =?utf-8?B?TFhBbUE0QXU4QzNJbmowekovV2ZTVHVZc1BHbG1jQmhzTXZINk5OZGw3Z01a?=
 =?utf-8?B?ZUVWemVJdlRRMnhDaTMzSFppUnRqSkV2Zkk4dEh4K0htdlJiSTFEaEtlTFFP?=
 =?utf-8?B?cy8vTVE5VEtiTjFFQ3JrcUhQTXQ4NWRUZ2p2VDg5aHZSemp1S1hSRldYQkFz?=
 =?utf-8?B?RHF0dHVvdmdNOHUxc1BWZG9GS2U0dzRTQ0xlc09NMlNJdmM1ZGlsV2xOd3M2?=
 =?utf-8?B?cjZjd3JYc3pBV3RPNnF3MkJxM3l4M0pycjc0ajFpbmhJQm03UnFGYjZxZjFF?=
 =?utf-8?B?OTI5a0Y0MkJVZFJVRWdCa1FOZUM2TXlPNGxjVkM1VHg2eGg1NFZxZzVZU1E4?=
 =?utf-8?B?N3BzYXd5MURUZmpDdHVzaTNhYVdmOWtRUld4TGVVV3lLT3hLVnpUbVRQZXhC?=
 =?utf-8?B?YlY0ajl1MnBPZ3I4Qm1aUmc5enNZTTB1c2kvbDMrT0F1RVdlNUhJWmJVWXNX?=
 =?utf-8?B?eVVYendUY0VBSlBNQkV6WXp3L1ZlbkJqNmpnem1JS3lDNmx1VHhsV0FOc0pC?=
 =?utf-8?B?V25nSUQ4Y0pRTUhiWVhpbXhqbUhMeVNtcXF1MGdyMUR5ZmhxSTZuZ0pXREZa?=
 =?utf-8?B?Wm9HZmxaSkJUQ0luMXZjRGVCd3VPcS9KVlZWMy9KRUEweE9YcGtKTTJQZ3JR?=
 =?utf-8?B?YkpvQ3BPdEVXZGNBMU1tdCt6NmJGRkFpWkF5OFQ2eDB1MkNBTjk0cXR6SGJw?=
 =?utf-8?B?aXluT0ZCeFVFNkhkWlN4MFArS3plQTRYb3ZKR3JmS01sdm9xKzc4YmtBOFdM?=
 =?utf-8?B?UG1FMjNORlBJbVl6VE9HbGVLWWVleXZhZXNGaW0zLzNXaEhUdEJqalVrWVhX?=
 =?utf-8?B?N3VIM0Y0Q2EzcHdPN2pOV1VRYjBubSt6WHN3Z3liWU5Yd1BPTytiM2d3T0Fa?=
 =?utf-8?B?YXlTYmthd01QNTRldTRhbmp4SmNYRFlsc2NJaTFuR3lXK0ZKdXNyaGF6cXVI?=
 =?utf-8?B?dHR2QWRxVGJkZTI5Tzl3RTBtRGxXSFJTV1BacUJPeGZwc0doWjdCeVZab3RZ?=
 =?utf-8?B?MnRIRnpTYVlIVTNIeHcvU1JjRFBtdDR6bU5WZ1RnK0FtY1JlVnJjS05ES2lV?=
 =?utf-8?B?Tk00cjkvTmlKZVB3azZwSWNWdU1DT3JmWU9ubUZRdmIrL0tyS29DTHRFdEl5?=
 =?utf-8?B?YUdqTkJpek9LeDBKRUxzVzloVGpPR05ia0l1S0k0TXZ1dUNFbFB3TjdzbzZh?=
 =?utf-8?B?cWYyRW9VTTg3SGVzN2c5ZHNKZ204cUs2YXZwdHBvSFp5dmxKWjJhT0RVL1Fm?=
 =?utf-8?B?NG1YaWlUNHNmVjNld2J2SUM1THhrdWIvMmR1OE8xMGNCZ0FhQXdTZnlQa2FB?=
 =?utf-8?B?Y3JVQVFVOTZrdERhY2UyWU00eG9obEQ1MUhHMDMzclRnSlJuc2JPaTN5N2J4?=
 =?utf-8?B?RVpNRDdkaEd0UDJrTTlYZmVBVXNTZzVOVW9GeXFKUElDQXJMQ0R4SWhQNHEv?=
 =?utf-8?B?cVhtMlEwbERGaGRUNlI4akJieEM5TkUyK1p6ZnJveCs1dzlPM1YwZUFTNFU3?=
 =?utf-8?B?NHI2QkNCNWN1YWNpK0NmeDkrem1JOG9XWjM0OExJOFluck43UjgyNUFYRk9q?=
 =?utf-8?B?ZzZSWFIrTkZvQlpNVU8ySllESTdEZTVqRHZvTlRLcWZDZHY0S1Y3YmlZSTQy?=
 =?utf-8?B?Q3RsalJDNUNXVk9jVXU0eStOM3IzL3dLbEROdnJhZFBmZTNLWitXanRUcnk4?=
 =?utf-8?Q?zQvsyR4u6DphWAmWvauvPWibt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd1d504-e6cc-453e-9c1e-08dbdba8f539
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:38:12.0012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcFB+uCSXlb2SkY+6s9ZXqVTy9VAgTP0ivGpo0ljiybqnc6nU0/K6qAOcZDJo1O3tEnzyGL/MxIlBZvVvWgSJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7885

On 31.10.2023 15:52, Roger Pau Monne wrote:
> --- a/xen/arch/x86/genapic/x2apic.c
> +++ b/xen/arch/x86/genapic/x2apic.c
> @@ -180,6 +180,29 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
>      .send_IPI_self = send_IPI_self_x2apic
>  };
>  
> +/*
> + * Mixed x2APIC mode: use physical for external (device) interrupts, and
> + * cluster for inter processor interrupts.  Such mode has the benefits of not
> + * sharing the vector space with all CPUs on the cluster, while still allowing
> + * IPIs to be more efficiently delivered by not having to perform an ICR write
> + * for each target CPU.
> + */
> +static const struct genapic __initconstrel apic_x2apic_mixed = {
> +    APIC_INIT("x2apic_mixed", NULL),
> +    /*
> +     * NB: IPIs use the send_IPI_{mask,self} hooks only, other fields are
> +     * exclusively used by external interrupts and hence are set to use
> +     * Physical destination mode handlers.
> +     */
> +    .int_delivery_mode = dest_Fixed,
> +    .int_dest_mode = 0 /* physical delivery */,
> +    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
> +    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
> +    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> +    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
> +    .send_IPI_self = send_IPI_self_x2apic
> +};

I'm afraid the comment is still misleading in one respect: The .init_apic_ldr
hook is also set to its Clustered mode handler (and validly so). As before my
suggestion would be to leverage that we're using dedicated initializers here
and have a Physical mode portion and a Clustered mode one, each clarifying in
a brief leading comment where/how the handlers are used.

Jan

