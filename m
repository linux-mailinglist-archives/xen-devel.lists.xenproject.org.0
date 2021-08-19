Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA553F1BBE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 16:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168887.308422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGjCM-0004wV-RS; Thu, 19 Aug 2021 14:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168887.308422; Thu, 19 Aug 2021 14:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGjCM-0004uB-Ny; Thu, 19 Aug 2021 14:39:14 +0000
Received: by outflank-mailman (input) for mailman id 168887;
 Thu, 19 Aug 2021 14:39:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGjCK-0004tQ-Oq
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 14:39:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 377926b2-00fb-11ec-a627-12813bfff9fa;
 Thu, 19 Aug 2021 14:39:11 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-_RZQ8qCEPIKFb4EARbpMgA-1; Thu, 19 Aug 2021 16:39:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Thu, 19 Aug
 2021 14:39:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 14:39:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0302CA0001.eurprd03.prod.outlook.com (2603:10a6:205:2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 14:39:06 +0000
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
X-Inumbo-ID: 377926b2-00fb-11ec-a627-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629383950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piQFJEwYN8aTQq5BcODBpOIW9jmbEtxFltx0I56fXZg=;
	b=HluBhHdD7K1Ox9rGEUH6Re4j8IwhsPfEmKlf8qv1RpVpNUISqNStFNpvz0lAiD2UaSCdwJ
	hJyttd4U+78Z4mvSZHDjQGL5aLsgj5MBXId2xcs250qPxkSSUW7I4kooimntQ9cKgQh121
	tszfiatg2deXuWmqWXFSOb68A/Ikg5E=
X-MC-Unique: _RZQ8qCEPIKFb4EARbpMgA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ivm21X4/NLYZWMfGm9gJ+NywhIfDd14uJVLLaGHTFa0fT6Krq7wTa4HGO+TJdN2XgwoqR0kVLSPBex4XqGUjPneNWhY1JjaZy0CgM0SEEijMHPInXXvZDlkZl3fkBBk0K2SonHR3H5QShriWcaQJ9x0Bv3lOdLQNCUFIimyjeaGbNB4DxT0ywlf+MHPt3CM9ZaFC6L77rjFf4kVrd5xhvV2/dIJynnYrjo9nkVowbh6YL7LTs6imLE5+otnvX5sIuP/X8vxxh2UGMR2nDXdmceHhs+DQ6kKKyWadz6VXrIh07Uh2+VqRpa3oEsDqlswuTRD9B4Ae86Z1asWiTTtXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piQFJEwYN8aTQq5BcODBpOIW9jmbEtxFltx0I56fXZg=;
 b=ecRZ/4LSXcXoV0Q31zN9CUfQQK/IepYhK4l4glYtB12pPyLtaH19XeJSINc6AdUDl4Xy69X1LSI7nwWQy4coFjY4epZ1kyDG2ka8xq8l+RAIlDMRPs2+M1m3tTnSomUb3KbrgrCtgGgycQOEWefNLpcV2pdUnYgoAuBLt4lYJbDZvLYK2QITljUfCJOCoX35Le4pH0ZX8kFqAbw1/8ieqZ4gcdOImEsl/84LbkTUqG2jxC8V0sLeT1jVUhF9VaFjjAiPlOljMVXO8fIjMFPdpSx4wx097mihskJ/zvuA/GpqzVunDnPPbZPY8pbrDe9yobOZMD4l+Vis9ShDirfFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/3] x86/spec-ctrl: Split the "Hardware features"
 diagnostic line
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
 <20210817143006.2821-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1ba952b1-ad26-79e1-7aa9-af7df28774f6@suse.com>
Date: Thu, 19 Aug 2021 16:38:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210817143006.2821-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0302CA0001.eurprd03.prod.outlook.com
 (2603:10a6:205:2::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01407923-8e1f-4b40-df4f-08d9631f1990
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3119E079B3A5546E3FEDBE41B3C09@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BzO/GgwN7gsO9EsTcq+oKwWZujwgnAMsGaN2WX8fx4WI4mBKEVnH7AsicIgXEX3v3D3MEUTWOdKN7w1C3FCcFuzpimwsJ1/U4zg1lLRKnHBynNrpV7Q1P47THNNaMLL1l2Togu+umy2lXrNCD99kv6RvMwIZ94FplUimalofb0X3ita4wyflgonXZTHdu6836e/wC3EYxayjBKk8jloSdIyVzRgv3nf4dd712PHnnXv83egYonxjvOGRz4euBh8fm9CDYT4F4UJH6T6SzGC6/r3QjUAfPkQM34auvup8caB5Lw+M7d5HRBsYEGK72nIhzFWNtio6gHFQMlhdM6FeJ/BGgErp1udxOIVguYdbuKwxl3JDy24TL8KaHFPhgc46j+F1514AG0OK6z7GfTAL0C7g3L+1GJ6fbIgyUxr4Ba06qjBTbViItb+2ul/A2yyErHu9TaLmgJt6y+bnWgCvg9KiB74CwH41M2nNfj08u4C5SoZqad2POG693SnqiwCZ1eS5HvsWdpbgUO+NC+HuLh55XdHv7cK24lpgXhHxWCBzS5voFBaGvLgQPRiRuUHcYAAt9GjAjLk7f9J/DIWhYCExKoXdqVziKyfJhak2I8fImevlxf8oDUIn8CIZGhmSTRWihGBbmlCAy/CcTkNgUIw1gbLpRuQg9AmXYAdfWMo73YSMAq481yLVUvG3sJTL/ZnX9wZM2/8PygiMHqZvNsfJv3uaF/9Wy7431lsjjb4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(508600001)(38100700002)(66476007)(2616005)(956004)(8676002)(66946007)(66556008)(5660300002)(31686004)(26005)(6486002)(186003)(53546011)(4326008)(2906002)(36756003)(54906003)(6666004)(86362001)(16576012)(31696002)(316002)(8936002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXVPc1UrYnluVTdsb1VoT2hKT1Q1UG5jODFlVzhzT1l2dHJ1WkxiS3J0eFR6?=
 =?utf-8?B?bVFqdnNyZFYyM2tiYnE3eHhndVNYWW5qNWFNSnBpV3N4MjMxRTc3SXdGeG4x?=
 =?utf-8?B?bnZzQ1h3NUw4MzZUalZyaW9uZE9SaXlMdk4yMWx0MzBQaUErdUprM1FyT1hI?=
 =?utf-8?B?MG9iMHN1MERSa1dTZ0REMDArSllhN3JvWjkxQ09nOFA1NzhETE81enJGQjgz?=
 =?utf-8?B?K2J0cStzNjhtRE5XcGhFMXYxR2EzOWJuUGdUN1RXdTFucWVEVmhiWjR1U24y?=
 =?utf-8?B?OG44YWxSMGNDMVdLRFZOT3U4c3BTTFJXazZBYzVnU2JOcVNJZzFWU2QvWklK?=
 =?utf-8?B?UmFYMVJvN0tJZzhsWkhJbFAzdkZxd1B5WUVzS05ESjJqQ0xyKzA4c3hTZGFv?=
 =?utf-8?B?QXRMZ0ZtcU50LzRIY0xidVZoa2FWbkFZTXFYUXA0K1ZRYm1Nb0xHVEo1ZVJr?=
 =?utf-8?B?UlBycDhYZ0J4T25WZ3hYQzBxTHdtSXUrUWpvN1dpVit5Mk95RmE5SFZVbjFv?=
 =?utf-8?B?aFBkeHJyOTIxSHhXU0p1YmR0RndnU0hNbW80eUpsRlNJT1Yyd3BRelhiT2R2?=
 =?utf-8?B?Vnl2N01mNmQxblJJWTAzQ250c0ZWYitCSTZza0lxNmRNL0hDOTBRcGxjeTNY?=
 =?utf-8?B?THhvWFJNSVlxM0owMnRuQVQyVkRXeVJ3QXdTcmJkRllyeVcvOTFWWUlRSDV3?=
 =?utf-8?B?RUNHaDBLb2F6b0tDd1l2aE9ZUVFiWE92a0JmTmlBcThzcFU5UDBVQ0FRME1P?=
 =?utf-8?B?ekR4TzJOeGZQU2gxSDRLRkxKK1lPUzhIMDVtU3RuZXQxVUhXQ1Y0ZU51eTFJ?=
 =?utf-8?B?Z2hMZ0ZHNS9PaG9DYThGNmprVUszVWt0Q0tNTHJDS2lqd2pXT3Y0bVhpVkJ1?=
 =?utf-8?B?NFpqaVgrdldpMVNOYzhtaFA5SFVheVlMRC8xdGc0dGw4ejBGZWdqRDRoKzJC?=
 =?utf-8?B?bXFZTVN6RVk5OHNyRm52NDVOalFzRXN1ZFVwQlF4bmxZVGd3Qm56cmVRbGNK?=
 =?utf-8?B?NDNjeUVueWJJbDZESU9FdTBsQTluS3RJU2hDZ0c2TlRhNjlRcVRjSXZaS0VP?=
 =?utf-8?B?cEsrVVBwaWlmNW9YTWtIVGVQY1dlN25NOVlsbTdLNVcvbStFOXo1NEtCclUy?=
 =?utf-8?B?dDVvemFsKzJJd21yem8xcGxxTU53bmM3dThoQjlPWE80M0RrcVBsMngyUTNp?=
 =?utf-8?B?KzhuZ3J5bmk3SnlORlJ1L0hKOHNGWWpQQlJYK0xKM3ovRGhXU05NUnQ5c0dU?=
 =?utf-8?B?QmowbjArcWwyQkFuMXoybDBqTm5uVncwWDZtT1hQVWRZL2pDYjFkTXphVlh3?=
 =?utf-8?B?RDZpT1IyVXJFUkpVbWh5Q0JLQTJrMTNncmEwTGxUT2c0ZUlLNlR5WHpKYkVF?=
 =?utf-8?B?T0Z4UVJ2ZHdBYTN6MTJwVlBOMHRjaGxQNHk4UFdxZFJBZzloOXVGRktZTlFU?=
 =?utf-8?B?Z0Nscm1GUTd6TWxKSkxWcGRSWGFVbC8yV0NKSW9qaFFPdWJiOGkwcTcvWjdF?=
 =?utf-8?B?TCtYZURtTXlhMFdYWk1zTUcwVVdUaVd6ZStEMTI0VFZ5TVVOYVpncjhhQ0Yy?=
 =?utf-8?B?Ukh2K2dQRzBheHMzU25pY3dmc3dzQVFJeU1qMGExWlViRnZOVWpoelo1bGxv?=
 =?utf-8?B?QU0wODZSMmdiMGR0VkI5VFNGckRXenRRb3dEbzFRdzYyU3dZVVZZQmNSMWgr?=
 =?utf-8?B?b1BXZmE3Wi9KbWlmVkZIdUxDQjdmb0NldHdVSmxLTXRWK3VSS3VwaytKYVp3?=
 =?utf-8?Q?NblPusSHv6lTU0ekmu28I77KkhgRpnS/J6tjjBT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01407923-8e1f-4b40-df4f-08d9631f1990
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 14:39:07.4526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9D0HANTTwMH5F/SPfwXGF0aPisSQkOGWilYcUqcAMKMK6UWgcA3EYJsXja6bYN2VoPv+dO/+eEgho+N1X/sXzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

On 17.08.2021 16:30, Andrew Cooper wrote:
> Separate the read-only hints from the features requiring active actions on
> Xen's behalf.
> 
> Also take the opportunity split the IBRS/IBPB and IBPB mess.  More features
> with overlapping enumeration are on the way, and and it is not useful to split
> them like this.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a remark and a question:

> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -317,23 +317,30 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
>  
>      printk("Speculative mitigation facilities:\n");
>  
> -    /* Hardware features which pertain to speculative mitigations. */
> -    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
> -           (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB)) ? " IBRS/IBPB" : "",
> -           (_7d0 & cpufeat_mask(X86_FEATURE_STIBP)) ? " STIBP"     : "",
> -           (_7d0 & cpufeat_mask(X86_FEATURE_L1D_FLUSH)) ? " L1D_FLUSH" : "",
> -           (_7d0 & cpufeat_mask(X86_FEATURE_SSBD))  ? " SSBD"      : "",
> -           (_7d0 & cpufeat_mask(X86_FEATURE_MD_CLEAR)) ? " MD_CLEAR" : "",
> -           (_7d0 & cpufeat_mask(X86_FEATURE_SRBDS_CTRL)) ? " SRBDS_CTRL" : "",
> -           (e8b  & cpufeat_mask(X86_FEATURE_IBPB))  ? " IBPB"      : "",
> -           (caps & ARCH_CAPS_IBRS_ALL)              ? " IBRS_ALL"  : "",
> -           (caps & ARCH_CAPS_RDCL_NO)               ? " RDCL_NO"   : "",
> -           (caps & ARCH_CAPS_RSBA)                  ? " RSBA"      : "",
> -           (caps & ARCH_CAPS_SKIP_L1DFL)            ? " SKIP_L1DFL": "",
> -           (caps & ARCH_CAPS_SSB_NO)                ? " SSB_NO"    : "",
> -           (caps & ARCH_CAPS_MDS_NO)                ? " MDS_NO"    : "",
> -           (caps & ARCH_CAPS_TSX_CTRL)              ? " TSX_CTRL"  : "",
> -           (caps & ARCH_CAPS_TAA_NO)                ? " TAA_NO"    : "");
> +    /*
> +     * Hardware read-only information, stating immunity to certain issues, or
> +     * suggestions of which mitigation to use.
> +     */
> +    printk("  Hardware hints:%s%s%s%s%s%s%s\n",
> +           (caps & ARCH_CAPS_RDCL_NO)                        ? " RDCL_NO"        : "",
> +           (caps & ARCH_CAPS_IBRS_ALL)                       ? " IBRS_ALL"       : "",

I take it you flipped the order of these two to match the ordering
of their bit numbers? I'm slightly inclined to ask whether we
wouldn't better stay with what we had, as I could imagine users
having not sufficiently flexible text matching in place somewhere.
But I'm not going to insist. It only occurred to me and is, unlike
for the IBRS/IBPB re-arrangement of the other part, easily possible
here.

> +           (caps & ARCH_CAPS_RSBA)                           ? " RSBA"           : "",
> +           (caps & ARCH_CAPS_SKIP_L1DFL)                     ? " SKIP_L1DFL"     : "",
> +           (caps & ARCH_CAPS_SSB_NO)                         ? " SSB_NO"         : "",
> +           (caps & ARCH_CAPS_MDS_NO)                         ? " MDS_NO"         : "",
> +           (caps & ARCH_CAPS_TAA_NO)                         ? " TAA_NO"         : "");

I'm curious why we do not report IF_PSCHANGE_MC_NO here.

Jan


