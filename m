Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6574039BA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 14:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181836.329168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwfm-0000Oj-6y; Wed, 08 Sep 2021 12:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181836.329168; Wed, 08 Sep 2021 12:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwfm-0000Mw-3U; Wed, 08 Sep 2021 12:27:26 +0000
Received: by outflank-mailman (input) for mailman id 181836;
 Wed, 08 Sep 2021 12:27:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNwfl-0000Mq-2A
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 12:27:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dbb416b-10a0-11ec-b150-12813bfff9fa;
 Wed, 08 Sep 2021 12:27:24 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-Kh1UnnC1OVWmZKqCrQgLOw-1;
 Wed, 08 Sep 2021 14:27:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 12:27:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 12:27:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0001.eurprd09.prod.outlook.com (2603:10a6:102:b7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 12:27:18 +0000
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
X-Inumbo-ID: 1dbb416b-10a0-11ec-b150-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631104043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbvvTZjgc6qM9fIxlneSsnWKvnclSGDEy1xCwQbgaNc=;
	b=DWhwdKFnW7t8Bn8C+IDVsG6R51giB0RA54MA0g4zIiVGHexe6Omdmof4Mauc4ubwA6SxFM
	Mr8GQ03h4mLs5slIkP2KPWmOdnmDxQTseqSj6V2U4B4sz1cJLvvyCIgTpBQW78UVJCc38T
	uJPEKAedLEIoWe83f7nt8NIiWsVYfIU=
X-MC-Unique: Kh1UnnC1OVWmZKqCrQgLOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7kjz/k9/vojd9aAtZROHUCRXy4eGpsE2V1LpBQyHrONJy3Hzv99c7BrAEyJgfXOnoQCDX86k9cBw8nzTk4DPZzphDI9g6vGEC4p6KdWGmSTF3JZHQqSx5Lusicy/0KCCHdb9EZVfL2o7HZ/NjQvrd7B384BX+kdonxLs4b8wpQTePwDl2WglukD7f/2CM8mr2WztrArHPj/xvEyT71WAPjx1DRcFifqld1NWtmRmwJwd55Sq+/PS57RdCIUUL3cPeyu4KymFbj449NonxQr4RDCJHP2h8T46ihDk4F1iJ9FZJuirsiBVxJyRPAZGSrzKpuXb345DgaPDlh/CATnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qbvvTZjgc6qM9fIxlneSsnWKvnclSGDEy1xCwQbgaNc=;
 b=czu3gQ1Bg2gV/6QZ5LGsTGiVrR9fQZKtQ7U88Q9awiqB9d/i8JXUB+kEZO2N2p3zc+fBtwfFchjEkIHQXq+Dle2jh7O+SFRjXRGB/3PxQzprs1b1NtyH8Wf5CiEwf8S9CV0E3btlQn2yrAD6X3czydT2wIsBUjTvypxHWFv0S3HczOA0EOPtPHqw+5vSyuD/jvJH4JtVCkc4hq4066I/HRH7LmMT+BpW9LPUgUctD7oCs7QD299Rf3yH0zL46sJHtm2L3xyyy3Gzq2A7ysyRGEX/JyXn6biEnkZmigvfPX+HamI1bQjZibSS1j/4iAjQZIVdESjxWKggujxv81D6Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH 2/2] build: add --full to version.sh to guess
 $(XEN_FULLVERSION)
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210908095422.438324-1-anthony.perard@citrix.com>
 <20210908095422.438324-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be89ae8c-99cf-5385-00a7-d9433e0fc50b@suse.com>
Date: Wed, 8 Sep 2021 14:27:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210908095422.438324-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0001.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 336202a8-151b-42e1-0f1c-08d972c4006b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4382F527A677FA604EAFF252B3D49@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qu/IjHFTD5aPZyr578Yt9XUCJVKvwz1pVsicF2lH6LGJyE65WJJElI5elr1AMgbHGYHQLanTcW4Cluo5iCHnOWWfMX9E2gpNC6+KpMRGroWwqVXmZNDNMDmlzMuHkB+qijVVFYasfwcc/osjy2DDEmsKpUkh4OBywzufAvXYNMOuq+IkjPagFnMGMHEXHybPVJSbQqAJ+v6+5vKVCKrn4668OV+Fgguc9TmaV1WDiTWjKHJkR70Xg+dVOGsfETbjB4FNOy/GaWWSMCBpr1iVdhwHT+OVAN4GtJIPowIrho8XWClwG/rdQMG+DyaMCkQhqbHiW0frAmWXO238EQTlnIZaZzOCTQg8VxlMrPIUDa0jC7RMOb93XNSwwfKkhLKErA//RfnGQRQYmjsV3v26x+jNcut6UMEMwmA8fujG8K0xKKAK96NSL9XWcTU8I4csHVE3GTqyYFtcUss1/6rMQuRXfow5gqtaKOTMKTosPTZrE6UGPB0Nwwv1mmEDcQUmTFEyet6uINvfdeqqyIsW3d1kDpzY9jzcU3PaSM6hZLNNrW6w71ktswsKcAaz+VVVvyf9ucSGRfme0+cC12o+Z2bEVLueuJfT4dgSEzIXVM1FZoZdEUkncmbBFohQ3EyDnXDDqNAqJV1c5G6rYAle75gq6oiB0HtZL7NvvX22H3naf5eIRu2wFciGo6Xcns7DCyk2mVkAL5wmY6hPOouWAI95JcSJmDk+ZDbLyfRdZDjPxDDHTWblfcMST+CK99LU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(39860400002)(346002)(376002)(5660300002)(38100700002)(66946007)(26005)(956004)(7416002)(8936002)(8676002)(31686004)(66476007)(66556008)(31696002)(6486002)(86362001)(2906002)(54906003)(36756003)(16576012)(6916009)(316002)(4326008)(53546011)(186003)(478600001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXhndE1hRnVzNktkZ09qbTJUb1JRTHBuRklKbEV5Rnh6K2lnWExDMnNUdG1o?=
 =?utf-8?B?eSswN215TlRvaXNXdTMwRjJDRnZhUFpRWGVwOCsxVVhJL0lLbWNmWTNxYUlD?=
 =?utf-8?B?VE9IT0xoZ21aYTk2RkYrK25RM2ZWZG0zRzhxTWtGZVBXM21FeUdMb3pSSkw5?=
 =?utf-8?B?VGtyOWpGZHlHNnlCRGsxQmthY01PTXFJY2FsTUI4b3hxNSt3a0xMaENlakZs?=
 =?utf-8?B?L2hURnJrV1Q5blpHZGNVNkQ2ZDFmSThleUVxbzFDZldIUWJORnhiUWR6aW4v?=
 =?utf-8?B?V3Z2dUVMUGVBVEw0azVHUmV6M2VMWVMzbUdLZW1Ra1pFUWk0Tnc1T2wreFhE?=
 =?utf-8?B?Qk1qQVMzSURZcXQ1Nm1iSWVsSDc4UGgrdjFXK2F2SENKVzd3T3owL2RTZVNz?=
 =?utf-8?B?TldLSE52WWJwRTJXTGFjd25JYkVpSGhrMWxjc2hPdko0a2JEMnBFU3BEblZw?=
 =?utf-8?B?YjcxQlErcmJaeGRSQzFENFhXdjR0M0ZkMnRzdnJOell2a2xuL0JPdk9aMW1p?=
 =?utf-8?B?QWZXSHhvVU85Z0I3dFFOSWxmT2xBMko0T090VUtTaG82cklkWWZ1N0tiY2JU?=
 =?utf-8?B?UWVKY2JmWG5sRkI4b2d6MW1QRVROUE13bDNtZFZRSXpzNHB1ZS9CeDhzWkQ1?=
 =?utf-8?B?WXJzaXNpNFM3M1NGSStsUVBoQ0JsRWNvSVMybGhjUVNRYjlSUkhJSWw3Mk1O?=
 =?utf-8?B?b2FnMEk5UnlLRDIwTlF2RmpVZjAyUVJZMVpRcGJwa0R4emd4a2swZUMxS2tw?=
 =?utf-8?B?UkMzM2lONVhFdzFvbXdlbVhlYW96Sm9wajJ4TkhKSTc2dlJKMkVrK0xpR2to?=
 =?utf-8?B?RjVmL01NUGRTcTdJaVo2cjJHUE5uTWpvd3RnamNrOXpIT0NGUGU5RC80Si9i?=
 =?utf-8?B?eDFOaCt3NkVic1JyZVVhdHpBOUJhVzlKTmhob24zamRORG9Gd2xyaHpxL3dk?=
 =?utf-8?B?UFNzcDdxZ1FHZ3lKUEd2SVJkTDFWSGRLMFZUVml6dmNvYjZHYVE3UXZmMUFD?=
 =?utf-8?B?SSthWTNMZWlkeWJwSHR1bnpUVGxUT3dPb1BtMlVjdlFrRHpnMmgyelBTQmxF?=
 =?utf-8?B?dW0xYk8wSkNiTE45VWdjOHM3Rys1L3Fqb0FhSDhaZk5aWjA5WkN6RzFtQjhp?=
 =?utf-8?B?dzZGTFFRLzZJQmVvb3dzT3VqWlY3SGttMlJkUm5TY3h3VW1YVzhXVXBKYWty?=
 =?utf-8?B?MkVLanFDQm1yaEpoNGZJOHlVMy9rSVlOei9MVTNWcTdsMmJaVEVneGIvQUtS?=
 =?utf-8?B?WjRHcmRKZlNia2JUbm0xZW41RzYxL0xKNnZncUZ0cVBKaml1S0lBRlRuNzYy?=
 =?utf-8?B?UnJ5bUZYbDhmOW9jM1c0emxGcW9iVFBleGRrTEF5L1NDRGpxS0c3VDk5cENa?=
 =?utf-8?B?OGVFQWZNNU1Sa0hUUG1DNjZ5aEVZRlRFcnhqMjd6cU92VHo0Z0JFNU5BUmxX?=
 =?utf-8?B?bmxVOExpWnA1VTBvbDdtbjVNb3BRQzQvMXNlZk4rc29XOHRSdHljWmp5dmZI?=
 =?utf-8?B?WWQ1R3BvVkhFeXJuRFo3dklIVTZSd0pFaXFlSDNkNmFPakdleFU5Qkp1akdt?=
 =?utf-8?B?S21ZQStyeGgwdWxoU1N5RG9RK1duc3ViQURCaHFGR2cwVEZzRjB0aHpOQ3VQ?=
 =?utf-8?B?SUxiMDBZYjZ1cDM3ZUNRbm5pWWVxdUE3VU5RTmxESm03eHdSYTZDMVlEQXBE?=
 =?utf-8?B?RHpyT2xyOHBNMnlqYytXbW1CMzNJbk9iaVdjekR2bTRyc2VnYmswSks5azNv?=
 =?utf-8?Q?nE8IShgj3hLleFOWlmx5uTvn6AVx8N6sQ4DPZoX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336202a8-151b-42e1-0f1c-08d972c4006b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 12:27:19.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BeABeOqFPw4yVoALlTKj5icqiHdIsbRFI/sliTitETLgCFl2lq2T5jloEwIM4sCVZ6+oibgCjyEI5/8eTD4NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

On 08.09.2021 11:54, Anthony PERARD wrote:
> --- a/tools/flask/policy/Makefile.common
> +++ b/tools/flask/policy/Makefile.common
> @@ -35,7 +35,7 @@ OUTPUT_POLICY ?= $(BEST_POLICY_VER)
>  #
>  ########################################
>  
> -POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(MAKE) -C $(XEN_ROOT)/xen xenversion --no-print-directory)
> +POLICY_FILENAME = $(FLASK_BUILD_DIR)/xenpolicy-$(shell $(XEN_ROOT)/version.sh --full $(XEN_ROOT)/xen/Makefile)

Shell scripts better get invoked by "$(SHELL) <script>", to avoid
depending on the script actually being marked as executable (which is
impossible on some file systems).

> --- a/version.sh
> +++ b/version.sh
> @@ -1,5 +1,18 @@
>  #!/bin/sh
>  
> +opt_full=false
> +while [ $# -gt 1 ]; do
> +    case "$1" in
> +        --full) opt_full=true ;;
> +        *) break ;;
> +    esac
> +    shift
> +done
> +
>  MAJOR=`grep "export XEN_VERSION" $1 | sed 's/.*=//g' | tr -s " "`
>  MINOR=`grep "export XEN_SUBVERSION" $1 | sed 's/.*=//g' | tr -s " "`
> -printf "%d.%d" $MAJOR $MINOR
> +
> +if $opt_full; then
> +    EXTRAVERSION=$(grep "export XEN_EXTRAVERSION" $1 | sed 's/^.* ?=\s\+//; s/\$([^)]*)//g; s/ //g')
> +fi
> +printf "%d.%d%s" $MAJOR $MINOR $EXTRAVERSION

I guess you want to clear EXTRAVERSION either prior to the "if" or
in an "else".

With these addressed:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


