Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A192C458A41
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:00:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228597.395615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4FM-0001Pt-GM; Mon, 22 Nov 2021 08:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228597.395615; Mon, 22 Nov 2021 08:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4FM-0001Mw-Ch; Mon, 22 Nov 2021 08:00:16 +0000
Received: by outflank-mailman (input) for mailman id 228597;
 Mon, 22 Nov 2021 08:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp4FK-00012V-VH
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:00:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 390ed250-4b6a-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 09:00:14 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-6pXexYTeN3mdr2HmYQCuYA-1; Mon, 22 Nov 2021 09:00:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6175.eurprd04.prod.outlook.com (2603:10a6:803:fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 08:00:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 08:00:10 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM3PR04CA0131.eurprd04.prod.outlook.com (2603:10a6:207::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 08:00:09 +0000
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
X-Inumbo-ID: 390ed250-4b6a-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637568013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZ+8gqBAh4gz//9s10pBd6JlnLvZPx68jyw3ESdi6hE=;
	b=C5nAi4AwOY3yXPWJ7fWdZL9Y9C9kjgehCdmt8cApG8dbDMZLSqsPxInYnKkA3Gic1X70Pf
	0xjiS3CRpprcqU34YwnJXVTfPTBDIMwb5dffIZMIIf0oQM64N+7XEO71hvaVhHc16Qr+6K
	g5TMxZUD2G6XF8QBrbU8uUuYRisV8uU=
X-MC-Unique: 6pXexYTeN3mdr2HmYQCuYA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PB1x7K0ANVv5O1lqwS2Jb7H4QFTfhk+FzUY+reWsHLNE1MVDy8BE+I5vLOETF4yH/gyiD9XTHFT7R4m3782kkf5ezY3TnF1u1eWATMtYOVnMQqC/5Xqt03XBBpBDFBMoI4cIMmlsuYD5DHCFQ6Pi1653NamDR+O41cYBz+h7SjCKRj63mDjXNr69BXuDshnixmWlqIrUgSt/Eg73s4wdPQAL5kMS4KbJlWAq3Dca7DY6jJ6zVoQMKHDLJqtK3RYdmZxBfgl16T1jlzR7Ih2HnlGg6s5HHWCpsw41C1AXceBN3yn4M4k3YEH50FJXnPgSBrN+ELJbdPolkoiCqoDB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ+8gqBAh4gz//9s10pBd6JlnLvZPx68jyw3ESdi6hE=;
 b=kLSrdf/G+84bqgB5fPZuztJHTeUz6ACDE1wR38jVpI8708it5gy82voRDNW2+sUf7FbhG6l07O67JCicVXUmJreg7+2KkZafTL0VDyDFFMYF6hanGjNAS9PJfy/AWv9lfoYpsxzYQd3vEt4NGBOMOLagrP57LlAJPKf5uxp3C/omXETsPqL1nqICwhmJ/+N8cyMvDKaol1xvnau1DfmDLZec1Dslppu9qiGMlKmlEpcqkTk7Nh39/R/ElQh+Z7hWWY1Lhi10iHvUCHeOQHH8P+AwsKwSoXC93JLv3z+xhDUpU9wDBPZimy/b9F0XE3mAL/qV6nP+l+GTFVrVwEJ3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f0b4fe2-b3c3-62fb-7713-8ee1da60b587@suse.com>
Date: Mon, 22 Nov 2021 09:00:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16 v3] efi: fix alignment of function parameters in
 compat mode
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>
References: <20211119152403.12069-1-iwj@xenproject.org>
 <40b1a70a-12ed-e059-3bbd-a93b85a96f1d@srcf.net>
 <24983.55866.708476.70068@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24983.55866.708476.70068@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR04CA0131.eurprd04.prod.outlook.com (2603:10a6:207::15)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a9f027d-7432-4136-8806-08d9ad8e1b08
X-MS-TrafficTypeDiagnostic: VI1PR04MB6175:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6175D651EF3D219E6C0A73BEB39F9@VI1PR04MB6175.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	66wrXyXcBhZM/CoEbjUQcnf+A9y6Zy5aOxuZZzY1jZVIE0QOXqX53xX94NWtI9+cBhbfcDGjvb5ezk9dNGF9APN6iuVek/ycGM0fHwrq+ywpI7Ex6AeM5AdsV44pmEFguy1X+VeEDE+hS4sxYT/6ZQ8+Ciu+QfAhejmZlnxOjsHMmWvrS3Aw2wWMD4o6HNfgTZx77nQHBQEsDCBsawqZ3X4ReQ95ux1td88lVWX0utJ6uSnUHpnGOuMXkg+Ypve/yK0LNx296v4ZamDnJkwlrjaD//z+oAMcZp8k9SPkL1GuqHPCuTAxjW8/gAHK9QcHQh0Ld8stok4Kde3WSI0nTP8DbaaiKlcx8eUmcY8aWJ0jto8DAUR8tBWQuHoCrzRqP0KOYqCFH8JTwSQOPq1vvvdsI3Q6yKb9tA4YvyVOejWjjYj3FwJ9hxep02fcq05ryN+kkosNkdYjI9ACuviK0vCMAVbHTKJjOlhDhnLLs93wnt5G3ePhG7hYRLJQK/q/kWR+S3EsqNLbcLmxChVnfBjJSVn01iv/voIIfjSA1uzKv+9N6cml2w7M6QfOPcnHFZEauKpIpL7XUvHLefdV7MnEKx+zWRxaFfINO4qXHn0+LsM2MK9sjV4Awq1Un1V9u6cd5K2QTn+zw5IF2w+OsVsDzUMcMyJN7O54oCZogR0YPGki1DItMvzRfAoYmbeFuKdGE6vXpZFG+1evHZ6Hkf+Jg9HKQNxOyrM/rMU9OjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(4326008)(36756003)(8676002)(31686004)(316002)(53546011)(6486002)(31696002)(66946007)(66476007)(508600001)(2616005)(86362001)(6916009)(2906002)(54906003)(5660300002)(186003)(66556008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0pXaDlOclBvZUxiQWM5aHVocWFWRGlCa1VXMlFqMUg0aW1BRFRmMlgzT1oz?=
 =?utf-8?B?eU5nQ3B0YnVSUFlQQS9LTjBBamkrdVpPK3Q5STdDaWgzaDlHei9hMFAwMzMx?=
 =?utf-8?B?ZzhkdGdQWFRqSGl2OTVzYnd0RkE3SXBiWEw1a2Vqd0FtSExQMzZid1I1MzMr?=
 =?utf-8?B?bzd4VUd1YkV4Tk0xUmhLNzlwTTVlK1hQek9NdVl5bStlK0gvdGtVdm4yaEtP?=
 =?utf-8?B?MTI1Qi95WmIyb3UzS2hMRUkyTDN2SDNoQ2cvS1oydEs3bGNxZ0xHWEpsVytq?=
 =?utf-8?B?TDdwdmVoN2tvcVpRdlBhSWlnRXZNMGVGMGdUTFNSVVBCOVh6NndzdFN5bG5z?=
 =?utf-8?B?SFpkbDdCdUVmYzVZUytQcXRGOEVlQjEvNjFRc2FSM21NQjFRVmZkUEo2cXNY?=
 =?utf-8?B?alRjdCsxVnVab0kvNEIvbDVMQzlSd3VGRzVGbnU4eVY2WjZDYjV2MEZuVnds?=
 =?utf-8?B?MXpCcFhFclRYTFk0L2hIaEJYUjlIdVhjbnhYSWpCR0lPZGxXWEpRTkNuODBq?=
 =?utf-8?B?Z09PQlZRWCtGY0p3NXdrdmdTSUlOek1WNVZIc3FPNTc3U1hYbFREdW02a3Zu?=
 =?utf-8?B?UHpqMFJpVnlBWE9pMjNlR2tGd2tqVlJoSWhCUk5ISG0zV0pZMHBVMDRha2VZ?=
 =?utf-8?B?TWFWLzdJRmNTMzNud1oxWFhEOFF2SWp4R1AyWGxaNDl5elRvUm5Ja056QVRL?=
 =?utf-8?B?eEVLdkhOaXo1bCtJWS9YY0JkKzlodHF5N1N0aWRZUFNoRWJpVjZrazFOV1pq?=
 =?utf-8?B?eXkxdzRtME9XSE1sVU5iN29TSCt0MWI3Ym9tekx1aGZ5WC9oOG9VWXlORXNM?=
 =?utf-8?B?aXVkZEZKZTZHb2ljZ0tIZG5hY2VxN3hSOThnN0J1TGNReWpoUWZVaCt1c01C?=
 =?utf-8?B?T1JNcDRqTStvanN3SUNyQ0VzalVpNXVvMHQwYkNuTks4VXNGSlJGTk1TRCti?=
 =?utf-8?B?T0NoQisrNzErZGRTc2ZKTnZDYUlwOWQyVEk5YXZiSGZBUkNwVjNTUEJ5MHZv?=
 =?utf-8?B?VG9YRjZ6L3BQZjhaWGFjSmEweDZqMUw5Z2p4MG1nTFpXZmFYMW16UlMzbXo4?=
 =?utf-8?B?ZFhobHJoUU9rSm12d0xGUlVYQkxYS3ZabkIwcnExWGZ5cSttaUlibnkybjlr?=
 =?utf-8?B?S29GRjdHRnF4dzJSVEluQm9ia2JaS09VTHAwSDRXRGtrWHVxMmxITjlvR0Ux?=
 =?utf-8?B?WCtSZzFRbUNtSk9SSThzQ01LOHVMT1lkeVNsQlJUa3kzTlR5Q0NTVGJsZ29Q?=
 =?utf-8?B?bVkwUVNJNS9VanNSNThWcFRZK3B2UkxUdjVCQjdrTEVGcGk5UHJpcnFvUEVP?=
 =?utf-8?B?ZlUvdnF6VCtqZk1PVDdsU0t3dThaQzNEV0p2WHk4WnJ3Wmc1N1NLbnMxbTlM?=
 =?utf-8?B?S004UU12a0c5cEg2Zkx0SWtDOENKWXQ2ZEpWMmRPTjBEQm1FOG1jTXB5Wi9G?=
 =?utf-8?B?eGNlS0ZDUCtnRFBxSWh5MXRoQWhjajNrQkZzL3M4bEtoS1dQYm4vODBwK1Vi?=
 =?utf-8?B?ZC9jaXhIY0MxalZuMnZraENsT3AvYzA2ZnowblhhNktrWkJaT2Zka1ZFanlw?=
 =?utf-8?B?dk9WVFVJRDhXMXZDbkkvMFlwYXI0WnRIVVcxYVRSMGdXY1dndTBtbkpjV0gz?=
 =?utf-8?B?Y0tHR1AxSkxteVpwVlJ5Tm1MeXBDakxzeTRRQWJCTXRMeStDeW5uSCtsV3Bm?=
 =?utf-8?B?RWRZSWtaSGhCNjczT3V3Rms3S0FFVGFKMzlJcXJ4NGsyelg5MTIrdk5mdTNE?=
 =?utf-8?B?OVA3YXBScit6RkFuaWtjR1pWRkdkUk1SVFJ1R043T09CaklvQUxTYkpmTUEx?=
 =?utf-8?B?Vkp1R2N5UGhLMU9wVWtDaCtWNkgwYXd6cXFacUxlRUErYjF4VG1CdllQekVZ?=
 =?utf-8?B?QjRZcjVJd2FRR2pLTWpudE90V3RjWTlyK05ZSU14V0Q1RGpHUGpVdy9aekNu?=
 =?utf-8?B?bkdmSFkxUno4UEFQNTVFM3p3QzI0L2d3ZkQvZjB1bnFaQ21PQmFPckNlazR1?=
 =?utf-8?B?S0ZtdmQ5bjdISXlZSDduZzBPWGFrY1Jsbk1maTJkSm1YeU1qeGs4VXdwdkV4?=
 =?utf-8?B?MTBGOXYzMW0wZnFTNXF5WUhPSko1dGsrcExLV3NqSitJRjNhVlpOWTJaRE5K?=
 =?utf-8?B?YjhNT1d6UTNTTm54V0xnbnNSWGhhSGxmRlkzb3ZWRFMwc3FLT0hPRE92NC9F?=
 =?utf-8?B?M3A1REJpZlJ5cnVoMUVoMTRneVVGd3ZtS0RtVjlpNWRoL0tlNjUrc0tITG5s?=
 =?utf-8?Q?Z5Gw0E0LVI98EganyhmclumwaVQbmy/Xh5Pi5wvYuQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9f027d-7432-4136-8806-08d9ad8e1b08
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 08:00:10.1190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KG5ATqAlGNMQEA8yxB8MCoV7aHFZM1o7+4drHIXoBeKSnfR/L+YL6tC46znL71Ys/I/Kt9u4COPCaXjxWRalyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6175

On 19.11.2021 18:09, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH for-4.16 v3] efi: fix alignment of function parameters in compat mode"):
>> Some hardtabs appear to have slipped in.
> 
> Thanks.  Fixed.
> 
>> Jan gave a conditional R-by which permitted a change along these lines,
>> but he's left the office now too, so you'll have to take him up on that
>> offer if you want this committing before Monday.
> 
> Right.
> 
> FTAOD I think I have done what Jan approved, and Andy double checked
> that.  So I am about to push this.  For the record, final version
> below.

Right, thanks. Nevertheless I think for 4.17 we will want to ...

> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -607,6 +607,9 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>      break;
>  
>      case XEN_EFI_query_variable_info:
> +    {
> +        uint64_t max_store_size, remain_store_size, max_size;
> +
>          if ( op->misc & ~XEN_EFI_VARINFO_BOOT_SNAPSHOT )
>              return -EINVAL;
>  
> @@ -638,16 +641,36 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
>  
>          if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
>              return -EOPNOTSUPP;
> +
> +        /*
> +         * Bounce the variables onto the stack to make them 8 byte aligned when
> +         * called from the compat handler, as their placement in
> +         * compat_pf_efi_runtime_call will make them 4 byte aligned instead and
> +         * and compilers may validly complain.
> +         *
> +         * Note that while the function parameters are OUT only, copy the
> +         * values here anyway just in case. This is done regardless of whether
> +         * called from the compat handler or not, as it's not worth the extra
> +         * logic to differentiate.
> +         */
> +        max_store_size = op->u.query_variable_info.max_store_size;
> +        remain_store_size = op->u.query_variable_info.remain_store_size;
> +        max_size = op->u.query_variable_info.max_size;

... eliminate these.

Jan


