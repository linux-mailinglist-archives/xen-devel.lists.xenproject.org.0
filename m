Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A74530BACF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 10:21:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80423.147147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6rr1-0006gj-8G; Tue, 02 Feb 2021 09:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80423.147147; Tue, 02 Feb 2021 09:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6rr1-0006gM-4l; Tue, 02 Feb 2021 09:20:11 +0000
Received: by outflank-mailman (input) for mailman id 80423;
 Tue, 02 Feb 2021 09:20:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4+r=HE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l6rqz-0006gH-AQ
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 09:20:09 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 527fa2dd-1ac9-4881-b439-3491e4bc59dc;
 Tue, 02 Feb 2021 09:20:07 +0000 (UTC)
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
X-Inumbo-ID: 527fa2dd-1ac9-4881-b439-3491e4bc59dc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612257606;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FBi1CK6rYrpxHlFiKbA46nvvpFlcW0fleWlCni9utU8=;
  b=M54BmubbM6P52cnBJe+nATKm6y7gqiY/7lrcFhPNna+Q8gch1Yxaj4ch
   KoF7gqMcSxHWu43NQ8P/jE2weMTHJjLt4awp1E5tGX203okX7J97v9wue
   YVMVPMp/nI8Q0wJlY+YBWIa6pUPD6cgvjQGY1XEqEdUDZlleRswKxlnUL
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4ji27tSKyerhD8pdwJKNEkWpvrlmc1GBAwHSZymylFBw+mAefh3e89drl8HQzhcjcMdYH4lZHl
 tXobT1gqcdqk4OSiXVYswZGOI+AAPsr9tLntVyjWLbaeh+hGJFoSylDdQdTqK7XGpd5neAtujg
 vtURDdh5WhilQdEprGN1XJkAdD1FPdsBSmNgyArz/52JhxJ4+/cgOq6jFq44DwX/suFNuyvI6e
 mql51KvZAGED8RsMxCFuA557rK0+OAAJTig5zsE12Q0FSG7E3YqYPwBepfwfVJ/MA+RO2ar7sO
 6Co=
X-SBRS: 5.2
X-MesageID: 37679449
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,394,1602561600"; 
   d="scan'208";a="37679449"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBoAP88Q+CmLZ/+f60jQeqq2dhFTgzgg2fmRtN18Uc8MOkCR826pUvgH2Cj+dZNWo/MoHKGSPZEPIWTKMhdpcB4yjNHg1rpHdOKMWKZnGI/beDkW/Qxkxl0NfiwIJXmLvDIeNKy2mCbLr0SOx+BAtVXtZ/8BBZUSjmkzYAyszVjmhG3yqyYrfaxEom/AQDFcklmIFhtm+1c0aV3VuLr9pXBn0b10a/ZDgx82l1EyNkND11Q9KMjXOeZxkrDGSkiJO3KIdreR1SSmsd5PIWHawkZlKjYcGoVTOrhBKPObsMJ89niq68oorzs/bGtPnuTEq9i7sOG7U3fsTGDw9whwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/gmgu9GdMiIcGKeSjmPU54VuSLrpAkpme844jmWvr4=;
 b=GBSvQlYn5jbPC/1h5j4nzyd7wbhgPha8g9Ge5g015XjJNYFrrRjBVBffohak3wxFEJNsG9JGT6p/UtWr15zuFG62huBQf252sII6g9ST0wi2uTKTcNGzEDTaqyDZrzIWP4d8Zm4nUT1RMFlBXLag6cBG1OeUT4lurKTR+14oTGEfkI0pfedj5DpE0T6dVvoddMbA2zraDmrW7SXA8Li+Utegm+OSeuK3HT2+xrmBACSEJw3bReTuCs/cYluytSlN8FLjQyUqK5AuuftKZquTyq4zIdAJppJRRiyrKECA0lHgFhxMOqY6KCRiz8nl+MtHZK1Nbt3lsU4g7nFmhhvdtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/gmgu9GdMiIcGKeSjmPU54VuSLrpAkpme844jmWvr4=;
 b=h57Nts5ODTAF3DERXWtR7DvWIe7ndvdJcb6IFA35s1YM3QPwkbWUnGX4cnPzCpKDbyM4jFIiQESMTxmJhdedNfnYD1/i+JHCJVN80KH/uNVXd2cxnm53WlFOE8nvbTCWGgodfbXUeGIHKVIxizGnA6Xt20oNIhFlKctv/bff4Tg=
Date: Tue, 2 Feb 2021 10:19:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH] xenstore: Fix all builds
Message-ID: <YBkZO9rV4rT3yzUI@Air-de-Roger>
References: <20210201233513.30923-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210201233513.30923-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MRXP264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8407496-de13-4952-30a9-08d8c75bb8bd
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB296918A8B15F22128B8FC4748FB59@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xNSP+B7BrPgJcS6wKXVCZtLp5AyXz8z9vtae8H5M8L2pZd9wPhbXZlgkE3arOXQ8bqrfYVuOeumqDG0dQ4Mvfs3soCcqgyStZ0c86sskHju0RVo1b0fJd4FN4jCOSGpfoSi7dEgmaUQMi2/8R36+5froW3EVs+Cm7NCz4vYMYrqBKm25IgtB4Ixv2/YXlLln/Ol+d78qIHqVrE75sRaumnoYSeRpxcai5RvC9VAhSnlz3jAmm2+DeQ/TIaRB38BXXcHAoSnJhBuwWbgmfVRNsv+xyE2NMXD4vNzt8/P0bO1ommbOyHB2uMZTXiP9mfKZty2RC78W0/rVG/4uB88ZVujM/eex2+HwkQce8nXhb16jZf7XvICWzF/EBGsj3h1Cpv8B0DsCejQyHiLjFPc8OPtj3Whp4XOuhlLQp2oinwhT9kQ6VH64x2uUOCbXA3iclzhOTGHn5ZSUWVdTtdShMNZcaYV/KiqsA8nc7wOnSbovnbNEsuAiKNQ2sgaMqP0p9puIoQtYT8yGn5YNBFsD1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(136003)(346002)(366004)(396003)(9686003)(6486002)(6636002)(6862004)(4744005)(66946007)(2906002)(66476007)(66556008)(5660300002)(6666004)(54906003)(26005)(16526019)(186003)(956004)(316002)(85182001)(8936002)(33716001)(478600001)(4326008)(6496006)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?STJZUldzeUVjNXYxNHJvZlc3N1FLWHVKWVVKSWtCMmdHZjJlSGZHbHVpSEY3?=
 =?utf-8?B?VXpmWUVHWHIzSHRqZ3ZuWHdPTnFjWE15ZnprckY3TjlDaVQyU2JmVlJ3c3Jp?=
 =?utf-8?B?MlB2M0ljZ1d3YUZGKzZ0VU1ZekQ2UWV3eUFjZmJnUmFvTW5BR3pVdXlLZ2VF?=
 =?utf-8?B?VjRlTUV4YzVxcy9GR05VK3BKOVBWOHBybFg3UjhySmQrMTNYQVJHckU2QTRy?=
 =?utf-8?B?NktPdG5wcW5FaUF5L3ZiMGdlekRMWkpDdCszZUJYdk1GOGJ5NXJtNGNYcXJP?=
 =?utf-8?B?Z2J4dDlSYkhSUGRYb2VnWmJHRVJKYnZsdDhuRkxLVEYvRVNuOTZDZFN4V2NS?=
 =?utf-8?B?YnlLeW1SMlJGVG1tM0RRYkRtMk1mZ01QeUhHZW9oN0REOVdTQzdFRXZNZXhk?=
 =?utf-8?B?ZWMzVm5DZTRtcmNwVlhzVEVFWEM5alBtTmY1MTVNdE5KOTRrUHMwbkRKdXZD?=
 =?utf-8?B?ZTlNR0t5U1FBY2I4Q1p1elBiZDdhQXBBYy9Oa0w5T3RmUjFFNVNrckEvcU5x?=
 =?utf-8?B?MXpSandlY1E5V2UzVDBnYk11dkJpV0JQWm9rcnZCNTZSd0tUeWZ0UVFQU2c3?=
 =?utf-8?B?MWlpRVVyOWh3UWtoL0hDWCt6dkJUU0N0WnFIR1k0VlRDdHlDQTYxODcvTmds?=
 =?utf-8?B?ZGRnbGtBZkUzM3hRbFAzVkhYSDdTc3h6TW0xVzdnNDZxUXRKbDExOUtncVZY?=
 =?utf-8?B?am9TSmpSbk9ySW5qekdoSjQ3TnVxSkdmbEEzbkNJRWNiZzZBcjI4OWkybXlJ?=
 =?utf-8?B?SzJJZGtCdlNKaE42aHhSMTZCMjhtcFRycC96WHowa1lQOEZIT3NUSGRIM3do?=
 =?utf-8?B?eFFTTFFjQlF5WjhqQ1hvQmowaTM0YVJTclFHb051dEZTS1FJbGVzUTJHMXo5?=
 =?utf-8?B?bzBaYjBKRWx5dEtiZXJIUXdkdzByQVcvN1ZhTWcyQS8zVkxjbituYURXMkp4?=
 =?utf-8?B?TnE3bWduYzR1OG81b01kVEtiZGJOYk4zK3JKRkV2ck96Q2hEVzhjSElWV0tV?=
 =?utf-8?B?WW0wOUdlNEVHc3dCamdsc043U2JjdzlyaUlqSysySjNBdWxORDE4ZngvTC9Z?=
 =?utf-8?B?cUhKT2NVam5LMlZkYmt3M1M4T1FTTGJXMzJKYSsxL1JtYm1lb3RwNDY1SjdG?=
 =?utf-8?B?Y2ZlTzgrY0pyOW9abkEzUVVBWGpodktpUlNZL0VTNFJUUlNrV3dzOTNTT3Ux?=
 =?utf-8?B?aTY5RmwzL2ttTmtkNTV3ZlhjSG5CVmF4dm5qTGlSb2hGbFk5ZWRkMDZDeUJN?=
 =?utf-8?B?eWVwTjVXZXl3cXZkRHlTdDBDMUExT0FiWFptNmNQMFprTmJYV2FWTE9va004?=
 =?utf-8?B?cXZQZWRRdFU5bEdiQjVOYTJmVU1oK2VCNGRFVkNUSWsrU3E5UUZtNURrWVpC?=
 =?utf-8?B?NWY0RXhCUHRYbmtxTG9hb2o1TVdFLzZhM3dVd2dpSFdZemhwRGJjeFR5SHJG?=
 =?utf-8?B?N2UwWGprcXpISFhKRWI0TEpjWUxNTVQ0K2J6aTZBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8407496-de13-4952-30a9-08d8c75bb8bd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 09:20:03.1409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvjqxs/pwczaWxYrHKJNRaXQV6doVBli04t9Hn44nlcHqnEMOF8cfk28ZqeuUDdRnLp0221EHhMLPOzND6SC7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

On Mon, Feb 01, 2021 at 11:35:13PM +0000, Andrew Cooper wrote:
> This diff is easier viewed through `cat -A`
> 
>   diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/include/xenstore_state.h$
>   index 1bd443f61a..f7e4da2b2c 100644$
>   --- a/tools/xenstore/include/xenstore_state.h$
>   +++ b/tools/xenstore/include/xenstore_state.h$
>   @@ -21,7 +21,7 @@$
>    #ifndef XENSTORE_STATE_H$
>    #define XENSTORE_STATE_H$
>    $
>   -#if defined(__FreeBSD__) ||M-BM- defined(__NetBSD__)$
>   +#if defined(__FreeBSD__) || defined(__NetBSD__)$
>    #include <sys/endian.h>$
>    #else$
>    #include <endian.h>$
> 
> A non-breaking space isn't a valid C preprocessor token.
> 
> Fixes: ffbb8aa282de ("xenstore: fix build on {Net/Free}BSD")

Sorry. I fixed this locally but forgot to refresh the patch and ended
up sending the broken version. I need to figure a way to make
format-patch fail if there are uncommitted changes in the repository.

Thanks, Roger.

