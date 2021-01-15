Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34C2F6FC6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 02:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67574.120704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0DUK-0000jT-3i; Fri, 15 Jan 2021 01:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67574.120704; Fri, 15 Jan 2021 01:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0DUK-0000gJ-0N; Fri, 15 Jan 2021 01:01:16 +0000
Received: by outflank-mailman (input) for mailman id 67574;
 Fri, 15 Jan 2021 01:01:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0DUI-000092-Mn
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 01:01:14 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b086fadf-344d-4dd6-9084-bbb5832c21ca;
 Fri, 15 Jan 2021 01:01:13 +0000 (UTC)
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
X-Inumbo-ID: b086fadf-344d-4dd6-9084-bbb5832c21ca
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610672473;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rBVgMlUWui3F/4NQ2hHLOEg6uDigLfn04dbXgwNMSFo=;
  b=KWUow7BGkErSUuH1sBRTPPxmFbSMBrDF+u66a/nG03K47RINug0+yoKV
   5uLSj0GUPAy4aN8PPwEG3gSgUiQyrjIopwZ3Plcah1yu3S9MZnHodMLwj
   hobE92+HvaktcDVssSNxFq3T7JkCmbJt4vg8bbn4GB+TpLVmRWZNiOdF2
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZGye9Iasm/c3LbFm8t1wU3rlq5TBsPqXk2jDSyyB2FwkwMtP4vDyOlWXVqIP4+vnwL8hxrE3iw
 MqhdZFnPI8rgaRseJop9jjju1RN49GsAQ7GwfUGFtl22lxIJieimLgDJht7Riko2dNaQvtK0tS
 WI+hNrkIiUF4FEyfrNOYAIa3syooXf655y5mYnOtRbT3oeyDdFUickmBaHODFPyS1mPiYKwuQg
 neDqHq4aLsHbVRx8KJ3xv/iu4rZeOR+kqx7hb7NwKwEJGq0obir2cazhKJfrhgpRUHNMw7fdr9
 YAQ=
X-SBRS: 5.2
X-MesageID: 35139137
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35139137"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCrLgwqxw7AawLMwMIgTuNPCw3XgADF79meCVSEDkpTiGw+aF/Sae+RtsT85tyWIHLtkwomrm9pVrsQe134b8QZk+1sSgAmwoiCzxSUSNvelEyu1TF223hspiF3O1e1V6WUN/yTXJbsuUkacBf40pH/ImHigsLDZuYV7iYfluoNn8swAhoi+mMNPYFHwfFL1S6Pyo9mx1bd4qfiRGC4480lfrvwNKqBRexuCoEYAwz03h8Obvz7kLY9NGKfscGnOOK0hW8eKlFA4YAlgra/Px46QWHq6LbI8oWvmpLuihIe2p5Auac+SPewkR961b0245AYojSGLRxLQKPOlDbdBTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEfwcTXZDXygtz6Ix3OzkOwK6AoUCxgb6Ra7TVvpWaY=;
 b=LS3HbDiaTT4QoiYbnWGNgrZPRnhCBYcJkcuZW12fat31D5rKpiS9RQXP90EveHgR8sAAfsecJRAoe+yoogZboJVD//PG4FV+Krp7ijCWgfWj0YYykVV9DREiTwuHRGz8gVJREBsdX+ukdBlN2GT3RSR3G8ZSLtpDA4Wsa/6ZgbkH1Qdzw4jbZkrKbdwXLeg/qCkGbYkURfK2myV4tzjWtQHa3ZxlCf4nnzSwuhnIUy8TkR6atTCdyVIo/JU5ZYKI0aIvKMNtbYItVcNxXH128VETt/zDvJgWkEA4nGlNU14AmyfYlImcrgEYkQFIrkUn6bKy2rsP7SYUP0/6abd4Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEfwcTXZDXygtz6Ix3OzkOwK6AoUCxgb6Ra7TVvpWaY=;
 b=XaGNlpt4ZbBGyPDsJl9U6YVm386VgFuLLsg2CH/5bByxFTcQsEMakwqOYpG4qfBWRgCNYHIi+EJq3dzNEhHJzcA0+xH3f4y8XxZcIVjP8eJ9MqaFWSLk06P0Hj/8iY6Wd/9oLXR1BFwhSE7B/mQzXnu9fMtppk/rP1EjxqokpWU=
Subject: Re: [PATCH v11 05/27] tools/libxenevtchn: add possibility to not
 close file descriptor on exec
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>
References: <20210114153803.2591-1-jgross@suse.com>
 <20210114153803.2591-6-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <21c113c0-9118-8c22-7c3b-50ffccb4db8c@citrix.com>
Date: Fri, 15 Jan 2021 01:01:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114153803.2591-6-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0041.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::29)
 To BYAPR03MB4728.namprd03.prod.outlook.com (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19daf193-0dba-4387-2f4e-08d8b8f10b87
X-MS-TrafficTypeDiagnostic: BYAPR03MB3413:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3413859051A9D32F77CF4B40BAA70@BYAPR03MB3413.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n5q/JwOxyHX77Z+2lUaV7/FnatcIoFgR39pdXv6mS13vCKe9+8e1quy46s4gcmgXuYilBn6K5wo52hR9MC58E20vIatpfHxOsuUu+pBx3wOwUrr6YjkWdyt+LpQnUaqJrSpwsvjZddIZOx4Emljh75hIQGEVgitQF/l70MGQnuquqvDOrQxgIpMk4KkcMwrqPZSOPQCzRrC0uSdZwoboY2S+uaqdE550YaKXd3GYMceCr3gvY7T2Vl3f6XJTzf+awfxnDtEd4AWZUUmrdKWvbkvGuA7+f+6xKbpI4hbvd+JlcFAXrq5CEI4FcuDYKceOVGMClRh7A/zFq+f6n9aBnsI0oBK8IT7H8c1OVxlGSL7Z56gQPp4XWSyxcmd/aAg8rlYLHjkWvWNmpochJqjEyi4kDaCEtDXZc1p40AhDpa80MJVjaf0VAV41hwvTD8cocOg7LxbyjOtBm6yGQrelDE3NwiRDiCvNn+LaI+fgVOw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(4326008)(956004)(5660300002)(8936002)(2906002)(316002)(2616005)(31696002)(86362001)(53546011)(66946007)(36756003)(186003)(478600001)(6666004)(16526019)(16576012)(31686004)(66556008)(83380400001)(54906003)(26005)(6486002)(8676002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UDVIbzlUbEc1SkRxYlpwUHRrcjYrb2RhNU5PWjJyRFdVRGtabzEwb041S2FP?=
 =?utf-8?B?NVJOcnpSVExKS0VlbVhld1NYeWdZNFBmRU5HYm1TWDRXU21GaFFra1pLOGlm?=
 =?utf-8?B?QVNqZElCWE5malVITldldzNHcmExcmM2WTJKNDFvVTc1OVRxUU9IRUJZSDl5?=
 =?utf-8?B?Z1JBY21yQWtBZnNyWEhuYzF5UlB6bFJBVGlmK2NqWjY3VG94ZitwelFuZnNh?=
 =?utf-8?B?ci9LUmYvZmt1VnZJY0s4Q1JBVStZTWQ4bzNUMi9Md3pER0Y3QmJYVTRkckFq?=
 =?utf-8?B?TUE5ZWNrcUxSSnFZNnhzUS9xd28xR3ZMSE16eDk0Zm5QODI2YTd3MDBSektX?=
 =?utf-8?B?Q0dGSXFtN2FWeXZMd3lXWUlUeU5tNi9YNGxuVG14eE5SMW9DQlE1TEhnNHU0?=
 =?utf-8?B?T0xiWmUvc2U4SGVJYWZFalpnSHBSK09ZUlhqdXM4dFpVaVQ3b1hUZGhqVnEx?=
 =?utf-8?B?YkNlL1R4dVZUdzhseU82NGowSzgwL1pqaFd4OXNWbXphMTlGT3hJVWZCeDJZ?=
 =?utf-8?B?c29lOUs1ckV5OTcwWlBtaEpmNVpPZDNnV2RTb0RMSVQwd3J4Z3ZRdFlPMFEy?=
 =?utf-8?B?MG9HV3dUMGFSMlBLaVRXSENpelRYc2sxRkFxc3pLTE0zcWt5RnZrMHV6dVpi?=
 =?utf-8?B?eTJBK0tUK3AyRldCVHJWc25XT3kyMVNkQVA1Wlcvbko2Mi94cFdhQnhCeS9s?=
 =?utf-8?B?a05FcW8rdGcrV2w3UTB1UWxmY2pOU0FFU2pEaUhoekRYSm5xQkJXdGN4ejN3?=
 =?utf-8?B?VXY5dlJpd0s5SWhWRTdFRjMxcHRYWitRcTlnbm5oMnRiUGdZVDNJd2QwQWZo?=
 =?utf-8?B?ZmJjdU03ZGJuRnY2amUvSnRUNzVpNTZJRzBUUVV0Vks2MVBqSnlwS1JraUE1?=
 =?utf-8?B?a2w5MHZmRzBvQ2dEZk8vM0J3b0pKL1lvS29SVW1laFM2TEM4Ni83SktyZ25l?=
 =?utf-8?B?Sm55THN3V0JBL3hEL0x0YnZmcitjODZDUXVoUnVSMUp3ZzNBT0loSXNYTzNY?=
 =?utf-8?B?SDJld09qZHlxU1J1NGZtWlhWeXlKRHpIbm5GUFV1YzVSZThQTEl1c2RMaUJB?=
 =?utf-8?B?dkoyS2Z4VjRscW1EdHozZFExS2djN3VPT0xLdTZwczNPYWxqWFNBQi9DM3lN?=
 =?utf-8?B?b0VyRnBMeUxDS0ppV0gxdnJ5QTgvRjJVMDZUaFExN2ZwM0RiSXRkbzM0M1J2?=
 =?utf-8?B?cEdYcEpKaXVJQ2lYblcyMldYUWdwOFN3cnZqbGx1MjFXOVhpTDd5a1EzTFc0?=
 =?utf-8?B?aml3TkJBSmJqK3BsZ0R1eGxoYkpSR1ZFVEE4YVA2STBJLzErNmJiMXAxdkRJ?=
 =?utf-8?Q?vVpKkwWoW4Ct2ezgeL+uwNDeQa5qeS+iNT?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 01:01:09.1513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 19daf193-0dba-4387-2f4e-08d8b8f10b87
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFHamle+UJIPMvNOUkPu+fyZl3HT8LC+zdU7qq0iIyjuRdYiOOu/TQm+zDrbexNLRN3PQKsK7Vm2rFfeUqv6iqYK8jjVBWoilnsxnioLLzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3413
X-OriginatorOrg: citrix.com

On 14/01/2021 15:37, Juergen Gross wrote:
> diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
> index 3e9b6e7323..b6dd8f3186 100644
> --- a/tools/include/xenevtchn.h
> +++ b/tools/include/xenevtchn.h
> @@ -64,11 +64,25 @@ struct xentoollog_logger;
>   *
>   * Calling xenevtchn_close() is the only safe operation on a
>   * xenevtchn_handle which has been inherited.
> + *
> + * Setting XENEVTCHN_NO_CLOEXEC allows to keep the file descriptor used
> + * for the event channel driver open across exec(2). In order to be able
> + * to use that file descriptor the new binary activated via exec(2) has
> + * to call xenevtchn_fdopen() with that file descriptor as parameter in
> + * order to associate it with a new handle. The file descriptor can be
> + * obtained via xenevtchn_fd() before calling exec(2).
>   */

Earlier commentary in this block is already wrong (refer to gnttab, and
making what appear to be false claims), and/or made stale by this change.

How about:

/*
 * Opens the evtchn device node.  Return a handle to the event channel
 * driver, or NULL on failure, in which case errno will be set
 * appropriately.
 *
 * On fork(2):
 *
 *   After fork, a child process must not use any opened evtchn handle
 *   inherited from their parent.  This includes operations such as
 *   poll() on the underlying file descriptor.  Calling xenevtchn_close()
 *   is the only safe operation on a xenevtchn_handle which has been
 *   inherited.
 *
 *   The child must open a new handle if they want to interact with
 *   evtchn.
 *
 * On exec(2):
 *
 *   Wherever possible, the device node will be opened with O_CLOEXEC,
 *   so it is not inherited by the subsequent program.
 *
 *   However the XENEVTCHN_NO_CLOEXEC flag may be used to avoid opening
 *   the device node with O_CLOEXEC.  This is intended for use by
 *   daemons which support a self-reexec method of updating themselves.
 *
 *   In this case, the updated daemon should pass the underlying file
 *   descriptor it inherited to xenevtchn_fdopen() to reconstruct the
 *   library handle.
 */

which I think is somewhat more concise?


> -/* Currently no flags are defined */
> +
> +/* Don't set O_CLOEXEC when opening event channel driver node. */
> +#define XENEVTCHN_NO_CLOEXEC 0x01

Do we really want an byte-looking constant?  Wouldn't (1 << 0) be a more
normal way of writing this?

> +
>  xenevtchn_handle *xenevtchn_open(struct xentoollog_logger *logger,
>                                   unsigned int flags);
>  
> +/* Flag XENEVTCHN_NO_CLOEXEC is ignored by xenevtchn_fdopen(). */
> +xenevtchn_handle *xenevtchn_fdopen(struct xentoollog_logger *logger,
> +                                    int fd, unsigned open_flags);

True, but see below...

> +
>  /*
>   * Close a handle previously allocated with xenevtchn_open().

xenevtchn_{,fd}open(), now.

> diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
> index c069d5da71..f2ab27384b 100644
> --- a/tools/libs/evtchn/core.c
> +++ b/tools/libs/evtchn/core.c
>
> +xenevtchn_handle *xenevtchn_fdopen(struct xentoollog_logger *logger,
> +                                   int fd, unsigned int flags)
> +{
> +    xenevtchn_handle *xce;
> +
> +    if ( flags & ~XENEVTCHN_NO_CLOEXEC )
> +    {
> +        errno = EINVAL;
> +        return NULL;
> +    }

Do we really want to tolerate XENEVTCHN_NO_CLOEXEC here?  I'd suggest
rejecting it, because nothing good can come of a caller thinking it has
avoided setting O_CLOEXEC when in fact it hasn't.

> diff --git a/tools/libs/evtchn/freebsd.c b/tools/libs/evtchn/freebsd.c
> index bb601f350f..ed2baf3c95 100644
> --- a/tools/libs/evtchn/freebsd.c
> +++ b/tools/libs/evtchn/freebsd.c
> @@ -33,8 +33,12 @@
>  
>  int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
>  {
> -    int fd = open(EVTCHN_DEV, O_RDWR|O_CLOEXEC);
> +    int open_flags = O_RDWR;
> +    int fd;
>  
> +    if ( !(flags & XENEVTCHN_NO_CLOEXEC) )
> +        open_flags |= O_CLOEXEC;

As we're now consistently using hypervisor style, we ought to have an
extra newline here and in equivalent positions.

If you're happy with the suggestions, I'm happy folding them on commit,
to avoid yet another posting.

~Andrew

