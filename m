Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328E64D31B1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 16:25:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287951.488292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRyBK-0000On-8U; Wed, 09 Mar 2022 15:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287951.488292; Wed, 09 Mar 2022 15:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRyBK-0000MQ-5J; Wed, 09 Mar 2022 15:24:54 +0000
Received: by outflank-mailman (input) for mailman id 287951;
 Wed, 09 Mar 2022 15:24:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRyBI-0000MK-Ef
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 15:24:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10399ae3-9fbd-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 16:24:51 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-THauKfE3PoGZxWQvRiQ01g-1; Wed, 09 Mar 2022 16:24:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4906.eurprd04.prod.outlook.com (2603:10a6:10:21::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 15:24:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 15:24:44 +0000
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
X-Inumbo-ID: 10399ae3-9fbd-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646839491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVYz35bClYsU9ZphFPVIdSpwJHiwg4c3hvTJpFc6eJY=;
	b=l0C17H2VDHhFNqn6ud+uLTgUat1lOZA6oSiPgblcYrHPJZRKo44r9uV9Ah0nzyqe8ufj3m
	p9zF8J3C3REOKGrs5pyfcWqLJC02H0g46KcDgiaiCVpYvQ4V0F2PxN3edVCrf644Itg90s
	QEOjVQLnoabi2tDsTxoqbnBCsVp5VgM=
X-MC-Unique: THauKfE3PoGZxWQvRiQ01g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkKv4NZgn7Q08bH6KhWax0+3P56eNC7U/kQU6sBj2TJ3T/0NhPT71edLvDqAb7iSJjtCZH2w5aU/IBI+8Yur6VQLFjdiL34dCKeWS8QARji6y1bFiZz3BGKjJnGjmJjkJG4TSqPVBJMEqlgIqNP0vitvWMm7ANo7/4AQfySAOuHccnvERLQ7LcTp9AEofvr6FmnSWeCCmY9xFNqcpoazVEaWERZYA6blTdLaojPkfdlRhryuSbrt+aCgrUn4fgYe0q8S7iNeo2nBxYyxxnLEksklwa+6CAWBevW4y420bP7bATvU8Pr892NcxDaVnL5ugnHPUhy2snuG7wy69hQDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVYz35bClYsU9ZphFPVIdSpwJHiwg4c3hvTJpFc6eJY=;
 b=oJa15U0z+DWeelbSx/moK4km5Mj31DBWZXGAdbtBdvEYCvCHaxxM6k6rOJYdRC+AvZyivRgBTevOcRV7eErQ5g26asYr5IKbYDAdURYdudna2Ebj4KtYph7bAyC7aALbzwxKpJWi+d4i4OosFbqmMntEI7PaCouvTafQX8eUGLT4bu3gis6XmdRnT1uSEHqFeej05YvjUTHvEx4HA6PZhCOF5/imYMZXexWNT276hxVgilys0Jl/XExaxl3k+B5DTNp+zWh6AJnrK5fS7oGtwlGpJI/fZFb+Jqweduji2TvnYejejWaYf0LQs4ckls6DBbEHBrWRUBDE3WzblAMDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <824225cc-54b4-f07b-21b2-1158e23de773@suse.com>
Date: Wed, 9 Mar 2022 16:24:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] x86/hvm: Annotate hvm_physdev_op() with cf_check
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220309152009.10449-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220309152009.10449-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4c44624-7f29-46ab-3d6f-08da01e0f086
X-MS-TrafficTypeDiagnostic: DB7PR04MB4906:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB490672C782E302CC0CEEED9EB30A9@DB7PR04MB4906.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ImOPqonLu2gKbuwBV3Ejm4j63FRPON3K1qXirmzUzCjfd00TWySEb9VOgCsBkqOFSXrdOfxRvxl7WuTQK0WuEd+u8uKnp7xsV8QmaDPiRggyIyBbatLAPDads7F9Zfl6UOCjqzPeX0UfFswPsiFhuDTF9E6Ameb5kOJf2wXdH6frrEdINZYPOx99En0Ddvzubp/wHaTYubi6/SZcDnX1Ak0h4EHmv11uyZaTWB65QZ3vczxjLELOcGqn5rM6IY+SQA8Eaa/WxfGM8xhtlU/nTNqGE/yBPvMQKU26vuhi+SpPE8+SihUuE1KVPjGQ33pXXCtVkyuhZXh3oyCuroBwH9gSqc83gEerf0LeYAoFnLqenBgwsU6DXj5w7rg8rFMDgqqa+9bMtaMQ2abC0FvvTZwnUv1dVAAx7IhEu6p+SvRnkIoQW3OebMTUIxnGu35LlQSO+Vdx6lLVzDZ8DewvJpc/o4b1vYcBzj2xextyYfBKesOaXqE22UNXsPH1FOaoA5V3mk24hHUhMcy3c0dWDMH2eFtElLnUKBFCwaf3JAjmf/iRJ5ciUM+sMSpjf/usG6K2wULQgWjBUDi/0MfGsNX/J3TzUROGxarCSIJbHf4UiO3BrL88npozb/5dFr0sRWBogq4qpKtXoMMsbNDjhD+Jq9TiIVv2cptiBfqrGltKThB3jlevRxvAK16NTWh5wRGIBvhtYwL4k6IdGBYJQFavfLalHvNq8Lq7PkqnQpGASi6uXiOxJJugpugUiZuA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(54906003)(6916009)(316002)(8936002)(5660300002)(2616005)(31686004)(8676002)(6486002)(86362001)(31696002)(66946007)(36756003)(2906002)(66476007)(66556008)(508600001)(4326008)(53546011)(38100700002)(6512007)(6506007)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajV2aGFnaVZjV25VNXVwQjFxdVN6Z2czclVCZk5iKzNUVUVxL3ROYnVxNnRo?=
 =?utf-8?B?ZVpwbUVGcWpLdlJxa0RzT1hIdHI3ZFg0N3FUZ20zQUI5anlBQ2lDRU9ZUXVR?=
 =?utf-8?B?bkRsRG9aZXpvQzFaL1JlVUREUnlxR2t6ek1vbU8yejBFNU91TGt3bWdHNmdO?=
 =?utf-8?B?aXl0c1lveGRXT3lsZDZDNmIyYjFEK2tHL2UvOGVJZFNJWldPcDMyQXgrYlM4?=
 =?utf-8?B?SnpkN2djMnJjcG9oVkVPWUxZRU5JRWdjLzdUcG16SXBSZ09DQXd1eUMrYmRG?=
 =?utf-8?B?T3I1dVFLdU5GSytNUEFKVmFTT3pEb1FwdEUzcEdWcXBnWXgvS2pRUTc5UmZ0?=
 =?utf-8?B?SHdEaFNFaExYYXhJTUJaV2NmYWZoclJvVjN1cUxkT1FLSVpZSHRBTE80cGdr?=
 =?utf-8?B?d0J2NFg0UXpwNkJISFpoZGxqam1mWHRqWk5KMEltRWtPQk40NTNkS1FCL0FQ?=
 =?utf-8?B?aG1HbUNBWVVIQUE5TkwvTzBkYjk1aU9sUHpwNmVlRVVRMkhJc1B4amFIN1Er?=
 =?utf-8?B?NEM4M1lQVDZkWEZMaENQRlBtSHFQMy83eGZtaUxqSE1nTWZUUzI4YUcwZlVm?=
 =?utf-8?B?MDd6V3hFSWNqMzJOMkh2NnRDVGtKbDUwNWhvcEtiVmJidzF0Wnp5bTFvazFn?=
 =?utf-8?B?NndIdFRaekNseTQ5YWhzV3F1TERiaVA5azRhTHJtby82UTVDNWpTY05uNE45?=
 =?utf-8?B?ZkJtbDdDdTNYSVpzeTFKcjRxZEVnK0g1eU5rbEd3eFlmNXYvMW90U2VmNnNi?=
 =?utf-8?B?N1QyZU1RN255bnpqMmtUSGhHeXk1cmRmdUtpdk5WVFJlcVZRbmpLSVF4TGdR?=
 =?utf-8?B?aisvVmFUTndmdGlyUjN3WWYvNGgyaWtlQVk2N1ltUzJTL3pIcnd4UDFYY3Jr?=
 =?utf-8?B?d1BxUFFFYTU5amowS2h6WDlYa1pBaklwRDBvQ0E1U2VuYWRCOGNKbC83NWRl?=
 =?utf-8?B?OVZMK1ZTY3ZYdWMvbXpLNXFtZ3oydWFxZXVRSzUxbU85UEQzSGJaNWt4ZW1x?=
 =?utf-8?B?R1oybHdiSUJCVGorNEprMEJXMnRZUS8xQVhDekxmKzNuTkFxVy93K0dYSEUv?=
 =?utf-8?B?UGxVS25GVnFYWFhSbWNwVlhQSFlSN0x3elo2ajNSRUJBV3dkNjd1Z1V2NG5k?=
 =?utf-8?B?ditZNlFoY1hVaG9STTJ2Qm1RcXNlMVl0MjAxNkVCT2NKSGVqUTZpSVZYUGY0?=
 =?utf-8?B?eGpGaDBRN1V2Q1pIUDFvVjdpcXdxY0FiU00wRTVMOW52a2dJSVBMbzZwZWhn?=
 =?utf-8?B?cjNyODAyWTE4TUNlQUhkZjAvZDJxOFRMRXZMeTNlcWF5a3FUM2Y4S2Y4b0Y0?=
 =?utf-8?B?V0tldUNsTWlJcVk4a25rTGJoVnZJZS9rMXNIMWxYRG12bUFSaUNYbEpoUTl5?=
 =?utf-8?B?NzlaUlpnakh3RFhScVJVS3F2RGswVXNIV0REaFBzR3g5RDQzN3BXMkpFQ3Ex?=
 =?utf-8?B?QnVtUlNGSmkvUjl2UFd5SngzNmZSenZiWWFleEk2SW1PMHpGWEtSRnBYMHhn?=
 =?utf-8?B?YkFXSjFkQTlVSHBIT01sNXU0YTJCYWlSSERlVDhqRjhwZ1h3SEVDTStZSHo3?=
 =?utf-8?B?dnJibU85b3hxM2grbmdwcGFjdEdIZnhJQ0tBUHhrVXU2MWxqY3A3QUhhU1Fm?=
 =?utf-8?B?bExrYnVxQ1JGZEIyQUFoK1pTdEF3VEduNExCaWdjbjRBVUsyQitFQm5GOVFV?=
 =?utf-8?B?WFNwak5BcndKTDZDTERBTkNlbG1kRm1zVE1LcW84STNBemxiWTJMY3NHeTc1?=
 =?utf-8?B?WW9YS3pteU9qNEtRRW91cjRZamVGTWV5U05CRm9JU1Jwek10NUJydHRRTlp2?=
 =?utf-8?B?d1NPb2VObjlUekczRHlaaThGamFXV252L0ZLc1ZsemxDM3pPZFdrTXpNaGJD?=
 =?utf-8?B?ejF2Zmc0TE5uek5HQlpZNHBHM1ZOdFZmNmxoU3drMFdVbGs5L0Y0eHhiRlRX?=
 =?utf-8?B?MXVDKzI5bDY4WEtHU1VOdFZQdWVpRnI5NWI5YXVkUzVUcTVMa01OYnMxMDNK?=
 =?utf-8?B?V3llTXk5eFBGYUVPeDM4UWxwdWhvbG8vS1FwZWdEZ0hZbExESWQ3S3cwNExG?=
 =?utf-8?B?VVBuUlBJNGt6eFg3SHZWbXJzSHR0V1VJdG1VYngvekkzV1B6YytMem0rUTZL?=
 =?utf-8?B?NVVlTkFqY0MyZGVYT1JrbHlBWmRYeVlqb1dzc2ZVS3ErSk80MFZCMjBUVjB2?=
 =?utf-8?Q?5em61NzgJcH6BEgbCZJGxa0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c44624-7f29-46ab-3d6f-08da01e0f086
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:24:44.7852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gk6/2qDS6PRZNzuYIlY+d5/9oeArxNQGWv4jeOgwFsSaOsptFEuCil9UGK8fB7OVemOSNPoGaCI4flv+NQe8Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4906

On 09.03.2022 16:20, Andrew Cooper wrote:
> This was missed previously, and would yield a fatal #CP for any HVM domain
> which issues a physdevop hypercall.
> 
> Reported-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


