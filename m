Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE5C6693C5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477040.739550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH1T-00038w-5T; Fri, 13 Jan 2023 10:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477040.739550; Fri, 13 Jan 2023 10:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH1T-00036j-2Z; Fri, 13 Jan 2023 10:10:55 +0000
Received: by outflank-mailman (input) for mailman id 477040;
 Fri, 13 Jan 2023 10:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGH1S-00036d-1Z
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:10:54 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2055.outbound.protection.outlook.com [40.107.103.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f0faa43-932a-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 11:10:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9523.eurprd04.prod.outlook.com (2603:10a6:10:2f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 10:10:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 10:10:49 +0000
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
X-Inumbo-ID: 8f0faa43-932a-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMtW6vDs5RTymkdjl8yDRs/w/O7LDNjYjK/8jBtnfwGbIs9zoJk1WV4NiFlFoR2Q+c4iPcmbfwRHTgm9mwTH3kugk9AFkgC6IaA8Edakh15oRMEWeg9DTV7JYOxqiXEqXL3iSgFE0xb0cQe3NMPKCkn+7P+5F8WNbfQHtZNcal+2yVVdWDP30+sLwNsa17dFMecmEGoztTfA2x7BMgw5lxEmgW6gbUle9xv0wNgcAxKLyPPDYMKDYpZlPgE5qcvENUnVHtqOPfcMC+YqW0qgXFNBWn8Q90AnTqvba5Q/RE4D997BbNcQjdvhVexzlh+M+434qe0Lf94pQwwsvHscTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPle0OiTX6gcbg4/T+rGFfpPHXHPkX+AcLreLlEi0Iw=;
 b=DazdDQubrR+lzhX4V/R2ar1hxtwQW3SraFL+3gTzyiFZq5yz+vdmj0+JbWNGe3PYBmYw5JgbzHxQMObN18pYZjbwb4HKF9TuNGqb0uVM88r98qHRX2wMVX+2i8M3NEgI8fPuuCI4IEFxcaTAKSj0PLW6FXBwTVwTTJQtTPFRzar44minLR5K5MvHPeHTZWi1sXslP6i8m5FpuGSeW2D58GZPEZYxKZyL8eyMi6oYqHj/PzyttRFTajAvNbfQJKJT7Oi9+7FIAl0GJUMlgsc81ewJYLcEsN4tvaGTDX2Huoja6YPbdCgf0CVlSVP2KwBeHnt9xwWMAeBS/xzRgZKviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPle0OiTX6gcbg4/T+rGFfpPHXHPkX+AcLreLlEi0Iw=;
 b=FGwisb5M5++3i0C3B+y4c3ac18+K686+uoigFmNx/3sWLGLCZqj+tXpj3Kq+/nOcu/7hnyJbyzwI1fB/Ls/0AMu2mAAANTUQVzpHk/H6KBvCUv39i7E/hp3l9pswBZkXnu9zuihBUHsDP98UxMgJXl9CjGQiBCajgwO5bv4C1z4z3o9Ngr99z8VgrqZe8q3eSgbzBLFtv0j/ccAHEj1s+yUaetONNMKymH2B88vJ1O46l3WtEQ73c2h+sD6y1aTMc87JsglRTDp0Ix5z0FIONaPW+lyeB2CPOhett0O1i5kAlZ+YNetjmb1a64/x40pE3Y8Z2gQfwQcIQnTfPiD41Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a19dba22-1e75-473d-dba8-cc676b6594aa@suse.com>
Date: Fri, 13 Jan 2023 11:10:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 31/40] xen/mpu: disable FIXMAP in MPU system
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-32-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230113052914.3845596-32-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f45cc95-6b3d-471a-47d5-08daf54e71e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gMbOHL7TicYcwr4/9Xh6Y84e0aSoUPmqzDw1tYWt6iTAARK9qWi5NfSN4S0VU7myEaQOqbkVm48KjCBcmqjZOS21nU/CfOYdytUbAA7UeU9XB4X20yBxiMM7nFN3Ione8sSZFV7Ds9NkbsgSEoJws/2iY8UrDri5MBZ4r5NnJVdiTTU7457Q0K8NsPYb4gNR0oe7efyJVW/6T8ra98SZQco6Sgb2nKSNxOTx94Gmo1uKGbqxaqJDl76p1XZqgsunOTs6V0LcyhbgfsiuH1inFMwXyZTdvDBTPoiYQQpPSkkaKtAAT9HwsRmYQ6RcHYMZ0sda3DChc3Rf8qijBFUSjIHcZY8Ay+oZu8dSOmloq5wPsti7XP6cia1dd+8HJ79y9lFicmODEdmfXIDFpgDGwO+4emYAcwFWeK/YO5Ki65dWraeOpY6Z3neMIWt4pZUpmtMDamAdrDAadRjrP8uM4xXQ+tic6zBYIvFWZcqhD2+oInkA/1XgsJMXpzMdNBxBwNFTy4v/l5HYKw5HTjDVY+SfauP1uNuKuS8bm9fNFpUS9Z0R6/7qXShHKxMobrOTWks/xYGmIB0mzD9YRrOYXtd8gmpJVJnI+pRuK6viz1YO94SS9ZQX5LqUvPCWAw5HpyKwjeTomA6+cL8QoHj07HrrGqmvg8E5KVXfZjUrdsx7l6Ls3xIsH8KvDkEHK5OALP8nsVqGuVatc1CyEFWrDwHu2jVGd87uhN2tO+hE7uo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(38100700002)(31696002)(8936002)(8676002)(6916009)(86362001)(5660300002)(7416002)(4744005)(66476007)(2906002)(4326008)(66556008)(66946007)(54906003)(41300700001)(6512007)(6506007)(26005)(2616005)(53546011)(186003)(316002)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmFnTlg1emtrdFo0L0ZuUkZXbnNHSVg4STV0Si94V2tHQkRvYUUwWHl5amhH?=
 =?utf-8?B?dGRqMFdKUExMZy94cWo3VittcEJtOTU4L0FRVFZFY051Nm4ydVNpRkVOeGlY?=
 =?utf-8?B?MytYeWtmUzErczBGTVhJT3U5NUVZblBiVmFkNWRSeGJpSkIrQ3ZDcjZJYmd5?=
 =?utf-8?B?RDVsczZPT1lqdno0V0d4NEk5TjM2cUVFU3BiVFNoMEFTR0hlTWtya3J0SVhM?=
 =?utf-8?B?emVCbkNXQ3dyUE9VL0g2Q1FqM2NFRWtxQ04ya29SMXpDTVlnd1FGa0hxSllh?=
 =?utf-8?B?K2V5djRRd3FuWmNlNDR0UDNEb1RVZ3ovdkM3ZDRiaUNSeHNXMEE5b1J5OXpw?=
 =?utf-8?B?ZGlwWWZMTE5aZWcrdFkzR1RHUTJGYTdYNVdzeUNHdGZjcTZaOExLKzU5M29G?=
 =?utf-8?B?cUpZTTdqOXRQZ1ljdUp5YUt0bERTQ0lEZkNjSWFlL2UwZEZiL1hTZmZQWUZS?=
 =?utf-8?B?aTArdUVEOGZYQWFndmFqSGJCSytCTkRJYWt5VzhSc1Z5SVpnMnNwTDVPeVFs?=
 =?utf-8?B?UGgrOXVlY2RGdVdWZ25VZS9FaWhtR3VhTUlYcDhiNDFkWmxHNHFkdGNPQy9h?=
 =?utf-8?B?TmdCK1lkVVlkaml1dFRObzlIR0tvU2JlTElSeGk3UlF5UnlPYUF4TDYyY1lE?=
 =?utf-8?B?bElVWG9UM3RmRzlqS3JuWlJzK3dBeEJyaVAyKzFjYmM1VDNSdUpDSmJmMGFE?=
 =?utf-8?B?TkpBUGRkdjFQQXJwY3VFbTFzNVV3YTgyMmwwVmdOMDBPYUd0amh2QzVEVzZK?=
 =?utf-8?B?cGxzbCtVNHN3MFFxSDhlUWlTLzhHN2YxVGFBS1NValhkTUptNUN0S1RsTFlC?=
 =?utf-8?B?ZmkwT3AxY0NLVzY5eGxhMWxycFpFWW5JTkRxblFRaThkbEZCeW9zNkFpM2Z1?=
 =?utf-8?B?Zm1HMnZlWDZNOHBOSnIvQzRXeDFqeHZjTzNVSDdPSkdiK1U0YTlqaTJLMTZS?=
 =?utf-8?B?aVNPQTZISFN2RmNyK0UzWkRtcGtwQ3BjdExaOUZiSU41blBBWkl1bkpaMmU2?=
 =?utf-8?B?UVZIM2t6NHFmWitQeVpCbU9RNWt1YzdyNWtjdVI2QThoeHd4K01qNmJNUU0y?=
 =?utf-8?B?MGtEeTJqRTh3NFl3aXFsYjR0YWwrZnpoc0YwdFVMU3pOb1ZsMDZNVzJFQUdw?=
 =?utf-8?B?aWFVcnZ3RmQ3RnJoMkdCWFFrbFU1TFJTS01ETXhmUTYrcEpaWlhQeWxwL0dW?=
 =?utf-8?B?aUNLZFY3N016MkViT3dsakhpZU5BUVJuZENnMGI3eEtQLzNOcEl4OC9NNzNE?=
 =?utf-8?B?Y3VBMlVnRmZlekVJVzVQRjVJZ2VrcXZsN05wdmZmV0RRTHphSlhJMHNSZjR4?=
 =?utf-8?B?RzVvWEZVTzBHMDQ0TVVZTHJxakR5UFJOTEZncmlLWHFHV1VkZHRIMC9HWk50?=
 =?utf-8?B?aGthUVpSQisxa0dEVWxyQnkraDlhelBhM1NoeTNTNjNOWmJQWm1PeEJyWFB0?=
 =?utf-8?B?bEJFZU5oaTNnUmE5NnM2NUF0NE4rZk9PNVg4MzhpZGhYNW05QXRmajFpdXo2?=
 =?utf-8?B?WjY1bEREeDdiTlpabWdFZUMwVGhHbVhoYkZFNFYrQkljUzBrdnZCWFhsSCtN?=
 =?utf-8?B?NzVPSDh2V3JPWVlNME9MV1ZRMnljNXNNUXhOcFQ3T2dwNUppdlk0aWNHc0hC?=
 =?utf-8?B?WDFjMnZtM1J1Q0NQMVQzaWdyVU5yaEU4YXBQVGZqMmhsSUhMNGY5Q04rMVc3?=
 =?utf-8?B?bysvZEVSbzJ0WGVtMUdPRnpielIwNzFvOWdSUU5rWU5jUnJSc2xJempuZjZr?=
 =?utf-8?B?VWJ6UW56emZZR3E1KzhSYkVocm9zdFhVUEd4RVYreUNVS01aaENLaTlLRmlZ?=
 =?utf-8?B?V2JQaDZlTGVBZTZucllTQXViV1RldFJwa04zK2tjY0NqNU1ham96dW9hbHZE?=
 =?utf-8?B?QVBkWW1raFMvRUp0cExZaGFWcU5zMUtCUFpDY2VTREZRbWZuU2ZXb1EvdXpa?=
 =?utf-8?B?OWh2UXR6SXJMS3R5QnMzZSsxUHAvTHJxZ3hpdHBhbkNaV0lUTEpGZFRDVzE4?=
 =?utf-8?B?YUJxZHlCek9UWTV3MnFyMmIxVTRmQW9xd2FOWFV6ODBYdVRtVndBSFhVcWpm?=
 =?utf-8?B?ckdMTFIzeTRZQWxrMVZ1UEdsWnR4ZUE4UVJWRDF3RkxoK01sM3dadWNISDlE?=
 =?utf-8?Q?Y5QW6xGqxqdvwag+flvrsn4wN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f45cc95-6b3d-471a-47d5-08daf54e71e1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 10:10:49.4752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPv/YZ7bspYYllCF3RshEbZ6MgP4v8giNMbkCjsWvbw9JJdCezUiHg4oSBN2M7rvZUzCndKRF1Zvktk9lgI6fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9523

On 13.01.2023 06:29, Penny Zheng wrote:
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -13,9 +13,10 @@ config ARM
>  	def_bool y
>  	select HAS_ALTERNATIVE if !ARM_V8R
>  	select HAS_DEVICE_TREE
> +	select HAS_FIXMAP if !ARM_V8R
>  	select HAS_PASSTHROUGH
>  	select HAS_PDX
> -	select HAS_PMAP
> +	select HAS_PMAP if !ARM_V8R
>  	select IOMMU_FORCE_PT_SHARE
>  	select HAS_VMAP if !ARM_V8R

Thinking about it - wouldn't it make sense to fold HAS_VMAP and HAS_FIXMAP
into a single HAS_MMU?

Jan

