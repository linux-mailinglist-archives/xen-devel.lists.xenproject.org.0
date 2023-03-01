Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834326A6BBC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 12:32:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503989.776452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXKgS-0000GW-Gd; Wed, 01 Mar 2023 11:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503989.776452; Wed, 01 Mar 2023 11:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXKgS-0000EL-DX; Wed, 01 Mar 2023 11:31:44 +0000
Received: by outflank-mailman (input) for mailman id 503989;
 Wed, 01 Mar 2023 11:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXKgR-0000EF-Ka
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 11:31:43 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a33a270d-b824-11ed-96a3-2f268f93b82a;
 Wed, 01 Mar 2023 12:31:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6957.eurprd04.prod.outlook.com (2603:10a6:803:135::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 11:31:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 11:31:38 +0000
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
X-Inumbo-ID: a33a270d-b824-11ed-96a3-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqtE3VFVRQbVuf1qQiLHJfYvOPnjudz/08eV+DalB2HOqbBk+IYCDgMaQLKZSMBTf8MveVq/xJXIoVxU+VFEZhRQK93W3MLyXEK7WXnuUeKdhmgl6RHXTuSBnvKAKYQL+gglL+qMRC57KlS6Df3Y3IP8hEiUI9IqMnOioTxihICmByHQ1UTzSPVI7txgWcv67/F7WARSozIkKGGRoprqRRxBa/1PPOGHDkrqnbBaaXKpHSAEAuTW3NxroXqFwvfdbzm4SbgPWfZUFzZO+aZjy1OruVZ8HVnbBIRQitOp7p6+qecSfkmNmsFVKDY+8vhjE5x1UevgEGSVt8MyREBDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cRGSWGw5TownVAgAZXte9N6z2rD5qDW3hNoCD4QBlc=;
 b=mdN0I7VoHGRJiCptsoTPEuZkTj5DUT2rc2MWqRc2/dpl4IVwrQCMx9NRNmLu/YrOxjQ4ituYfeiCLLL5gPFoJOzMaKyNFWiddzh+RfZiYQIFSJiIJNTvtzndeeXlhKZV30DJU1oV2778VPcSIyfAo6IYh4ptmjZB/ISEl7VbgiUrpywyhyjocBOVIPpwdFIPYDEr1sM6ecoeU/gvoMKG7lVn23WxnOTTd2/eXBmHcVNX98yhPthXxPPfeG4RuZgHJMFc3QS2LClaUSs0AdWvsrUP6MXBY+V+mFwDhnyNuoa+jAXXC6yJl5rQnoGDMLDAW6BpW9nS0pvG+J7813G0Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cRGSWGw5TownVAgAZXte9N6z2rD5qDW3hNoCD4QBlc=;
 b=4XTGNfbGOoizn7bULgZKmRDe5yPhj43nMFBaNtZUEUI71QoE5ZMO5OzTBwj9pGXDet1UvZZXrkAI/yMkCtKsdRH97+9SleALlfaWluOMJy/WB81DlbaKgovCvaGRvbb3pD9ZrEuwA38pcVF+brd/mmKzWULwT105UM0Xbt6Xkkh3TGJJ8RHK2HPikgA7w4lT9onWa5ng1YZwP5ZgBBo2EEXbjjf3cTOruncKv1pXFdxqvO/wSC5lFfPUe2kxVCyolIyCAuJZtKlf+QKzB2ay4l0Zn+uWXg7dwQXfJoKC+hUftFjGLGfd6uF6dYv4Ako6DSVIxr+zUufIh4J4HahPRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4fee8e81-79d3-eafc-b806-ea061216e072@suse.com>
Date: Wed, 1 Mar 2023 12:31:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/3] tools/xen-ucode: print information about currently
 loaded ucode
Content-Language: en-US
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230228173932.28510-1-sergey.dyasli@citrix.com>
 <20230228173932.28510-4-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230228173932.28510-4-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba5ccb4-295c-478e-cdf9-08db1a48855b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wzuSFJOyMf92fYTOFruZvqAOMmTbS9Fe2oG3E4GI1gpPGtG3c1bMoVZWboz0k0dGSi5RCGWQtjTacVMZChSmSxJEWtt+j/eYtLm5qErrgJnU92nnpdIPIcTh2oBhB065Go//JI2b0McvjTbv6FKMwSYozB7ZWi+c75mZQVYhLqgm3wUrldvaRk/aZIlYRWJDyHB0QHJqpOfygLjeshd5v+XhiNlSPv0lHtVmgFwpBoCWIuUoKUClGrO4dtg/U2pyNuurzUP414RjpJQORHnnmqT/P5rrK4jQOPqcTUzaYSkma1YeOTnA2IUP1r5BmaB5wjU8SvJ8MqcBRR8g9+qcJexh+3VmxYCZoBABRan3E0thswaDblDK9AUGiXlj5vzub83D1pgmN2OUdFr4ozogvFIGmrJkDC3oAGLl98uT9+PsDWcxn/uJ3Md3+Z3zox9wk5QpZjSokgMDFhUVV0QMGnJ1EWlwKEmVum6Ur5pap130i9G5KhIOta/rPHO9u0rCKLos2VkwlbgD8NJ+UfD+jXDuX7bC2BZQtt/koLEgCwhPX/PLdXHFwnavcjWHx1346qRh6ox6B7vJhkKqUaHTSB4x1tRSV824iZF+BIjnGetTon3qltRGk4cL2ErSAd7Z46BZbumYjheGzYEylmxUHLOjmNTXxU0/wSoJDRkkWWrTCSeqy7Qi0b6R8BC3MUnR73e/5r1oLI+YF0Dk7Cbwki7+m4N7kLtkcvE58mLd2ME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199018)(31686004)(66899018)(83380400001)(478600001)(316002)(54906003)(36756003)(4326008)(38100700002)(6916009)(66476007)(8676002)(53546011)(2616005)(6506007)(6512007)(186003)(26005)(6486002)(5660300002)(31696002)(66946007)(66556008)(41300700001)(8936002)(2906002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUk1b3h0cndDcWh4OVhmS1ZiZG5ZOXZNK0xqNlNYS0NHVkljL0N2TzZQb05W?=
 =?utf-8?B?UGdVQlQ2cHZWZ3lMdzZzdkJRVERnWHRmbUhLNnkvV3VRelpRcGsxQzZWVm5n?=
 =?utf-8?B?MkUzb2JBdm1iTVlrQXp2cnFCTnFmU2YrZCsrUkdYTUZCa3NIeFl1NGZ6SXhH?=
 =?utf-8?B?dEs5UTE5LzdWbmdDNU5CdzZVRy9QWDZCSyt6TmNMdzE2THN0WU4xbUJMMTdM?=
 =?utf-8?B?Sk9VODJXWVJrd0UxS2ltR3VhV0hCWUlFNGwyZkNQUzU4ZVNhbzRtTnJza09C?=
 =?utf-8?B?RzNlOFB2SFBMT2pJRWNoRFVxdE9UK1A1K2x3aEhsalc0Yk9kZ0h4YjhjZlFD?=
 =?utf-8?B?NkRLUHBNM3B0QmI3SnIxU2Jxc09Fa0xWWUhneE5IWGh0NGE3OEVXcnRlOGh4?=
 =?utf-8?B?MWJITXppRkdoZVRpVVQ3QTZNdW1UU0svMHhnemVmTng5alhTYm1pSnUrVWlw?=
 =?utf-8?B?cm9jcld0dE0rTUZVdm1kclViQUlSUXVSQlZDcHRMMVVmWjVrQlFnMkhjMVlS?=
 =?utf-8?B?cjlVSUs5Skt6cHRVRU9JU2g5eWtYRXRXTXN3Y3NUMDBNbUdoY2pMSHdzRmg4?=
 =?utf-8?B?ZGNuRHhjL0tkcXFzSTR0U080S3R3R29EaXF0WWlJZXI5RWpkNXJKVmo1b2ta?=
 =?utf-8?B?SElZQXhTcXZqSHRjVjRTdkUrcndEcVYvV1VVLzR3T0Vlb3V6MDNKL29Kd1Fm?=
 =?utf-8?B?Q0JLMzFGbXdVRkd5RUFuQkZiby8yVllsYjBuM3Y2R0VBNUVDSGJ2WGQ2SzdB?=
 =?utf-8?B?YWZMV0J2ZVZVYjI4LzdsZzhYQ01PUHJRZnh6cVgvSHpHNlQ3NkJLS1F0TXZD?=
 =?utf-8?B?WlY1OEI2cURQUW03L3VoVHNCZHFaMFBTR3EvZElmSG5xM3dXQVdRMjMzaXQ5?=
 =?utf-8?B?TFlyd0daQlBZWmI4ZGtTOVhJejY0NFJpa3o5aHJlQ05acDNuVDV0bjhkNE1j?=
 =?utf-8?B?SHh1NytmdG5qUVdjamV1WFpOWkdLMFFwcFh1QUViNktWYUxOaGU4NHZJK3lD?=
 =?utf-8?B?RHMzbC9iVUw4Tkg0Vm1jNVByYUlVQmdsZDFnRzNGVjRwV25RT2N1Z1FUbWhH?=
 =?utf-8?B?ZjFjWXNhbDFKTmdXMXdFbzd6SjdXcDlhbzVTYnVyQ3htRlBVSkxQR3lYdUQz?=
 =?utf-8?B?WkhLV3JLOHVlRmUreEcwWHVCTlBsSUJlNFdSRFp1eHpxTjhSVEJRU2JCdWlJ?=
 =?utf-8?B?aU1uQ25YbEpuc1RwSHpnc1VibWhHUEF1NXdva0xYMzIzOUlFaHZlaW5sZEVp?=
 =?utf-8?B?OVluWFpIeG5MbE4wZ3l5bGowUFlLdnF3OFV2S1NSZ0lCRjN2SUVmUFBpYXNz?=
 =?utf-8?B?eU5COSt5UDFxQWFnV1BSRlZBOUovaGo3OERPQzlVaVlLaStwSkR0eU9YWVFN?=
 =?utf-8?B?RzZHMUV1VTF3ZkJRNlpNaVdYZTE1ZHRSUHhvbTh0VW1DK2dXWU1GMzE3aFZi?=
 =?utf-8?B?R0hXeW1YK2ZRVG1zYnc4VlJiT1RtSWxQR1g4V1grMjRvdFlZYURSTlJuQXRx?=
 =?utf-8?B?MzlKcmNIc1FjclNjZHpqTU0xYXJxSGlQbHVuMmtwanBoMDhMVzJEdldXeTBp?=
 =?utf-8?B?RnFUUWxqRFBpK3lSa3JXaWk5Z0hRWnhZdk1DUjhXU3VmTEMxOUZ1L3RycmhW?=
 =?utf-8?B?eE5ySElkTVpZSnlvVEhMN3FhSGpMRDZWK0Y0cW13d01WYnJ4V0haQTRZeUZW?=
 =?utf-8?B?RmJvODRUekhIb29SVmxMczJvR0QxWXBYTjhISUp5UzhuMVdtVmZ0VWdGNTNa?=
 =?utf-8?B?Yk1RZCttVFk4WDFXN1gwT3MyMCtYSWQ3Y3owR1AyTHVpOThiM1ZMbU1mTVFt?=
 =?utf-8?B?UjQ4OEdZSXFlWWtCZ0VndGRpdjlSWUhxbkpqa2U1WVJYOEZDck5Wck5obDd4?=
 =?utf-8?B?OEhmL1FqMTc1ZnFIZzVoVzZYS3FWZUNIelBhZjB4L0ZQT1gwR3JIelJCZkZo?=
 =?utf-8?B?b3VwalJUMnZMcEthNU9lakJ6Z09ROTc0ZW9RZVBNRStSTTN3S2J3dEhieERP?=
 =?utf-8?B?dmVhdTF3SmNoYkRNZ0ZxNDdRVUh5MHFsRXIwZE9EZVllbGRtVnhYQkxxRURK?=
 =?utf-8?B?b1ZvUHM5dFJqd0U1WUdkZlFXbXk3elpuRDBDMTFscmZDcmozaTg4a3llYnZt?=
 =?utf-8?Q?/xPz0nZNuiUCqPwQbnx3qnyIm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba5ccb4-295c-478e-cdf9-08db1a48855b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 11:31:38.2285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ipg4GRwQwlNKXIBrifTlWmj3/676hcQREidYBRX8hJJVclgWKr0CQ2gF6jJlgql5Y995XmHL9sk85vsTou4f/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6957

On 28.02.2023 18:39, Sergey Dyasli wrote:
> Add an option to xen-ucode tool to print the currently loaded ucode
> version and also print it during usage info.  Print CPU signature and
> processor flags as well.  The raw data comes from cpuinfo directory in
> xenhypfs and from XENPF_get_cpu_version platform op.

While I don't mind the use of the platform-op, I'm little puzzled by the
mix. If CPU information is to be exposed in hypfs, can't we expose there
everything that's needed here?

Then again, perhaps in a different context, Andrew pointed out that hypfs
is an optional component, so relying on its presence in the underlying
hypervisor will need weighing against the alternative of adding a new
platform-op for the ucode-related data (as you had it in v1). Since I'm
unaware of a request to switch, are there specific reasons you did?

> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -11,6 +11,96 @@
>  #include <sys/stat.h>
>  #include <fcntl.h>
>  #include <xenctrl.h>
> +#include <xenhypfs.h>
> +
> +static const char intel_id[] = "GenuineIntel";
> +static const char   amd_id[] = "AuthenticAMD";
> +
> +static const char sig_path[] = "/cpuinfo/cpu-signature";
> +static const char rev_path[] = "/cpuinfo/microcode-revision";
> +static const char  pf_path[] = "/cpuinfo/processor-flags";

Together with the use below I conclude (without having looked at patch 1
yet) that you only expose perhaps the BSP's data, rather than such for
all CPUs. (And I was actually going to put up the question whether data
like the one presented here might not also be of interest for parked
CPUs.)

> +static int hypfs_read_uint(struct xenhypfs_handle *hdl, const char *path,
> +                           unsigned int *var)
> +{
> +    char *result;
> +    result = xenhypfs_read(hdl, path);
> +    if ( !result )
> +        return -1;
> +
> +    errno = 0;
> +    *var = strtol(result, NULL, 10);

Better use strtoul() (as you're after an unsigned quantity), and perhaps
also better to not assume 10 as the radix (neither signature nor ucode
revision are very useful to expose as decimal numbers in hypfs)? Plus
perhaps deal with the result not fitting in "unsigned int"?

> +    if ( errno )
> +        return -1;
> +
> +    return 0;
> +}
> +
> +static void show_curr_cpu(FILE *f)
> +{
> +    int ret;
> +    struct xenhypfs_handle *hdl;
> +    xc_interface *xch;
> +    struct xenpf_pcpu_version cpu_ver = {0};
> +    bool intel = false, amd = false;
> +    unsigned int cpu_signature, pf, ucode_revision;
> +
> +    hdl = xenhypfs_open(NULL, 0);
> +    if ( !hdl )
> +        return;
> +
> +    xch = xc_interface_open(0, 0, 0);
> +    if ( xch == NULL )
> +        return;
> +
> +    ret = xc_get_cpu_version(xch, &cpu_ver);
> +    if ( ret )
> +        return;
> +
> +    if ( memcmp(cpu_ver.vendor_id, intel_id,
> +                sizeof(cpu_ver.vendor_id)) == 0 )
> +        intel = true;
> +    else if ( memcmp(cpu_ver.vendor_id, amd_id,
> +                     sizeof(cpu_ver.vendor_id)) == 0 )
> +        amd = true;
> +
> +    if ( hypfs_read_uint(hdl, sig_path, &cpu_signature) != 0 )
> +        return;
> +
> +    if ( hypfs_read_uint(hdl, rev_path, &ucode_revision) != 0 )
> +        return;

You consume these two fields only when "intel || amd"; without having
looked at patch 1 yet I'd also assume the node might not be present for
other vendors, and hence no output would be produced at all then, due
to the failure here.

> +    if ( intel && hypfs_read_uint(hdl, pf_path,  &pf) != 0 )

Nit: Stray double blank before "&pf".

> +        return;
> +
> +    /*
> +     * Print signature in a form that allows to quickly identify which ucode
> +     * blob to load, e.g.:
> +     *
> +     *      Intel:   /lib/firmware/intel-ucode/06-55-04
> +     *      AMD:     /lib/firmware/amd-ucode/microcode_amd_fam19h.bin
> +     */
> +    if ( intel )
> +    {
> +        fprintf(f, "Current CPU signature is: %02x-%02x-%02x (raw %#x)\n",
> +                   cpu_ver.family, cpu_ver.model, cpu_ver.stepping,
> +                   cpu_signature);
> +    }
> +    else if ( amd )
> +    {
> +        fprintf(f, "Current CPU signature is: fam%xh (raw %#x)\n",
> +                   cpu_ver.family, cpu_signature);
> +    }

    else
        fprintf("...", cpu_ver.vendor_id,
                cpu_ver.family, cpu_ver.model, cpu_ver.stepping);

? Otherwise some kind of error message would imo be needed, such that the
tool won't exit successfully without providing any output at all. Recall
that we consider Hygon an alive target CPU, just with (at present) no
ucode support.

> +    if ( intel || amd )
> +        fprintf(f, "Current CPU microcode revision is: %#x\n", ucode_revision);
> +
> +    if ( intel )
> +        fprintf(f, "Current CPU processor flags are: %#x\n", pf);
> +
> +    xc_interface_close(xch);
> +    xenhypfs_close(hdl);

Maybe do these earlier, as soon as you're done with each of the two items?

Jan

