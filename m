Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B083A749A44
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 13:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559856.875238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMrX-0004eM-7f; Thu, 06 Jul 2023 11:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559856.875238; Thu, 06 Jul 2023 11:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMrX-0004bQ-4v; Thu, 06 Jul 2023 11:09:27 +0000
Received: by outflank-mailman (input) for mailman id 559856;
 Thu, 06 Jul 2023 11:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHMrV-0004bK-HM
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 11:09:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fbabdc9-1bed-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 13:09:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6956.eurprd04.prod.outlook.com (2603:10a6:10:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 11:09:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 11:09:21 +0000
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
X-Inumbo-ID: 8fbabdc9-1bed-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/fKdRH17+eC4Sad4U+DuECg7Jn3K1u0ef1a2ta/GVbNzHvqxxSMMGvkd4/D2oWy+ohj4SBdqVCr07nnRPYkxm+lbNVzHcLK5wYDo9Eyn78ZjSWRdMB9mA+IXP+fDPRfVNTE6xcDtlbRLqRDcjoObd8Ve2qohLcZX+zMF4aC8RCG85N/+kiSBwkrYhJXG98BECo9sCW2qTk+VuND4aBkCG8aw+XCdwKZCBWeK8JJ1qifC36qts79ri+SOm6VWVgweWYHd9SgiQOSTPYdq+77XvhppXRN1LrQku1tQLUBzzvMIy3T930SYtGnAMLIo5J1kE9/NmG6ZVNbHOBi7Zg54A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EDqj7iwfxfnLB0x6opR63ESaVOE0wZE6U9/F73SJw8=;
 b=VPEdw1Ya9YM/kGFNP4wjW7+b23h53Rd8iHQyBc1omaBx1f0CFJ63FyWFIy1ZoRByxbR+e6ixax1+2cw6Y3+HCTLSHX84nfn/5w454ienAsaIdyFtN+FsPsIIQhebOP9R8KUQl5X2XtldpYa+jjg5snafMoUi3R4r17Tz6DJH+uP5XBHsaRPzQpl/aCHf3MqdIvhv4elgQAkPtsfJSz23OVxfUY4QMqk9uUXt/cW2/HsDGpismmJojXviQk5WyCTZ96GJhmQMga+YlsKdTsM0n0pxDHZpal7iXQmgNSxGQXNx2qtzqUl15ogqVU9sKjYIiy9Kou1jxCop9dXp/MgH0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EDqj7iwfxfnLB0x6opR63ESaVOE0wZE6U9/F73SJw8=;
 b=EHsMZ0053kGHXmFP37TMi16LUSrQL+ejf90nCoyyPnaLCjFzDf0AaEQvhrbsR6pYtsAEu0ArtPPQb9xXM5c/aLOpiD0njfcbJ2JRRwCXBuKhC+ImxRjgvk+SbDxCb2mzftxZAjLthLKZkdjmBL5Kwpn6N3OK3kADcx9fNlBQya7datVeHiqNBlSZFpDn1GnWU/hZIT+XxSuSgTY30MXzxeRew5HtRDVMB0/3Jq0IXkG5P66La0MhQWGDKMu3MZEU5dbxP5gynhQ38XgCi5yn+D3fDKnDTLfByOvHO2Um06D+XSLz5iEmA7q4X+9ULZC/839ILgpBcmNxU9zgWziovQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3484d4e2-4c2e-cbcb-44b4-09252227e1ac@suse.com>
Date: Thu, 6 Jul 2023 13:09:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 11/13] libxl: split logic to parse user provided CPUID
 features
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230616131019.11476-1-roger.pau@citrix.com>
 <20230616131019.11476-12-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230616131019.11476-12-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 0007932a-c089-486e-e36e-08db7e1172d7
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j4uPWcNQGqO/304ZrBJPx37QAkuLXJV3PpR3th6sR3znxThbKF1oxuFKQAyVoEE83CbQX8mftp33gaPnBp48QbOQcvWHEcPjKypbuXn+HoUgP7e2iL2c4pZdTVx2npivhj2XFX1imgtxZKmo8GOvUr4pnDIqClhxYdueIFSPhggCPQJTPEXnJigaFj0iVfXC3fvZ01n6omTAPa/P62E/pYomS2wRkcvZ57Cil+Hx0DEQ2yci39u25bXQbgqhBY7AqHrVYuqTUKo08R0Xz7zNyN5wqrDp7DntoHSnnAPUggX7ZHmMYRfd6T/XcMt6PlTTyIPhqs2Zy4sKIzl9ebiv2AsHrZ5fcUeInSbvkHaecfHA6WOkwHEsPXTY8sggHz+h43FzS2dRd2lVC9EYN1mn1p9W6Z1exIQaPY/y9wnzox1bQH6EpWeME4N7yvVbM1UO9UoiXbqCnIW2abIDxY6USDXqa9XhuX9SKeKhYlW2lhMJMPowLkE/Fby5kSe7SD1TVw9GFSEwaJOpU7IBFEeK0DGZl96KiUTI2mCCm8vl+lJsCP2Zc16eC/lM2QDKZBz1YGP68NjaPT23rZhJ667DXWC+vHhBNiY5Pb1TTddmzFfGF/roJ0WYSRK7bdYlPd2rrviYkmP/AFVvk6wZwDpt4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(478600001)(26005)(6506007)(186003)(53546011)(31686004)(2616005)(6486002)(6512007)(38100700002)(4326008)(6916009)(41300700001)(2906002)(86362001)(8676002)(8936002)(316002)(31696002)(66476007)(66556008)(66946007)(36756003)(54906003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFhUNnRZOGI2UURoS0d4ZmhIakhYNVdWSjBOTGlsNEh5L2pEVlJVY0NoSjhB?=
 =?utf-8?B?SkJhTGpwNDlVTlJPR0RPWFAvM2ppSEI0NnV5N2pOc2lTZDEvUW1Ldk5icG51?=
 =?utf-8?B?ZWlGTFI4SldsVGxQM2oyR1Ywakx1cVNNK2wyZEVnbUo4K3p0WlBvSUsvUWdo?=
 =?utf-8?B?eWRMdjhCK3RTb1FTblkyazlZVnd4aS9sc3hzWk9iaVA5K0FmUWJXV2FCQkFZ?=
 =?utf-8?B?QXVkbm9FWkRaRUdra0dZdHZtMktXbW1rTG43Q245b1NHV2xnSE9tR0w1cTlv?=
 =?utf-8?B?ZFZCUm5uZ2R1OU9RQ05rNjlraVczVHBEd3VGVjAxNmI2VzB5ZXlHMDRtU3Yy?=
 =?utf-8?B?cUVacVN1VEM1d2R1TEJIRmpQNG9hV0gzdXRJQ2EyL0tSb0sreUNjUjFXZDdB?=
 =?utf-8?B?QzdZbk9wMFFLRVRVS2hieEdVQmJhcTlHNG9RWmFWcWFDN3YrdVE2alV1K21C?=
 =?utf-8?B?ZTVlTVJMaDh5ZnhsamRBY1YxZ0p3U29rck5qSWxUM0VxZGpmQ2g0TkVibVJY?=
 =?utf-8?B?Y0k5dklTQ3NGYzF6bzR5V0RYWDZzUmxVbXZac3BLYTRYMFIxRTVNTjVYZDc2?=
 =?utf-8?B?QlI3cVYyQVNVa0FVSnFnWDgrS3VwREVPcGo3cEhIbTc2ZFZNVjdXT3N5VzR1?=
 =?utf-8?B?WWdQbjhRYnRsT2hIRm15YUpPTDR0Vm9Mdjl0SDVUVUN4VXBDeVNSWHJ4MDdE?=
 =?utf-8?B?MTJEaXVNai82VEVsbzFWQUhvRm8vMER0QzFSR0I5NnVSWEljcjlBTWc1OHpu?=
 =?utf-8?B?UVlJWTdUZG1qcGljOURaZ3E5NXoybzh1Q2prUTFUd01md3l5UXlhZmE3UVU5?=
 =?utf-8?B?VFJ2OVNkWURDcCtVc2x6N3lmblFPanZ3Rlo3TE54UU9SNk53K3lMWjZOK2t5?=
 =?utf-8?B?TERKeGF1cWZMc1NVeGNEc3ZTcWhoWGd5TDg2VTVFYXZ4RDFOdEd1TlpKTzlm?=
 =?utf-8?B?OGpqL2xnRzhQRG9MVTFBaE43eC9ja1JxK1Z5M2FWTit6SnBsbnlETUlxQkt0?=
 =?utf-8?B?V0J2aWNFWTRmVmx6cGJuRElmVnN6S0Y5a1UwTGZ0YVV0UjRaTDBIN0NQdUd1?=
 =?utf-8?B?Z29OV3JNQ0Q0c0QwWmdnMDg2dzllZGFFOHBvSGt4WVVDNkxDS0xIdlU2WWxL?=
 =?utf-8?B?eXNFQlBTZ2ttRmlzN3dWWjJPNHdLVTI5dVlvUlpjS3hwc1psN3lLcDh6MEtk?=
 =?utf-8?B?N2hhYTFCL2xUTWlucDU2amowRkRRMmhIait6QjNWNGNJZlZUc29OTEdQMTll?=
 =?utf-8?B?bUNnOTVYNGhueGIyTzZvb3E3WVNQMTBvaFd0U2dPdXd2dE5EY2RVazZMbGJX?=
 =?utf-8?B?ZEZoVzE4eWZpcWJ1U2pIOVY0RkJOZW1laG1PNTE4bnZqQzYzdm9XdUt1d05y?=
 =?utf-8?B?NnM4QmdzdjFzQlJJYmQ5U05NN1FqMk5FRUREU0NvZGNDY0I3cnNtNG9sNmtC?=
 =?utf-8?B?Mml1bzJ2UmpTTGJHOGo3cEtYeEU5MjRQS3NGZldnQm53Zmt6REUrS1JFSDR2?=
 =?utf-8?B?ME5XK3BzQmpieWpFQ1ZwalUzVzJvdGxTQzhENEc3SHBHUkV6SjRmSlh3ZWNL?=
 =?utf-8?B?cDhMS01XUTJRRkRaY0tZNXdqblVVTFJmaTVVMEtnQzBiVkVBcHo1NmQ3N2N4?=
 =?utf-8?B?Wk1HWk1wYTNmZnVMZm5qVGwxS3NzWlMwK25iczNqakE2RklzYWVEYUlkczdD?=
 =?utf-8?B?cjFjTHJ5RTE4YmdDdjhBMVVQaWFoRUF6UWJSM0dJRGpqMVhqTi9ycW9JVy9U?=
 =?utf-8?B?SkhrdXZCSHJmaDNROFFGUFZERlhlaG4xckF3SkNuN1JWNTJyVFlDVmM1dkRq?=
 =?utf-8?B?eCsvcEJvSlYyWTBPbHhiWXFWcXB6ZjArMHk2ZThQRzh6ZDd5MFpLZmZQS2lm?=
 =?utf-8?B?VG5rMXpLRjNKV0l3L2dCT290b3NZR1ZYbXlmN095ODRMeWZBM2RXYkVTaUdG?=
 =?utf-8?B?c1pGVE82eHJrUkpoTGVmTnljSjFvWkZVb0Y3YjYzbUZvbVU3UThtaFl6ZE9h?=
 =?utf-8?B?TmpzSjVlZVlMZ3A0QkM0WEtxRHg4NmFnV0xFQ1RsRkttR0I2THFJclRZNW82?=
 =?utf-8?B?eTZXZkRmeHNLNFVNaWp5NVZGb1RwRU9iTFVMWGdCcXJpSklORVViSituSVJt?=
 =?utf-8?Q?XeOzpnpKF/6/YUFGg+UaOdvIY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0007932a-c089-486e-e36e-08db7e1172d7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 11:09:21.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qm/JXBFbDBn6KLhJFtrH7tOt/k6a2ZwZX1kM+5Eqg94glJGEioF2HShw+yVUUtS2LKhKvvZG0dgSpb1wVPtOAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6956

On 16.06.2023 15:10, Roger Pau Monne wrote:
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -88,6 +88,66 @@ static struct xc_xend_cpuid *cpuid_find_match(libxl_cpuid_policy *policy,
>      return *list + i;
>  }
>  
> +static int cpuid_add(libxl_cpuid_policy *policy, const struct cpuid_flags *flag,
> +                     const char *val)
> +{
> +    struct xc_xend_cpuid *entry = cpuid_find_match(policy, flag->leaf,
> +                                                   flag->subleaf);
> +    unsigned long num;
> +    char flags[33], *resstr, *endptr;
> +    unsigned int i;
> +
> +    resstr = entry->policy[flag->reg - 1];
> +    num = strtoull(val, &endptr, 0);
> +    flags[flag->length] = 0;
> +    if (endptr != val) {
> +        /* if this was a valid number, write the binary form into the string */
> +        for (i = 0; i < flag->length; i++) {
> +            flags[flag->length - 1 - i] = "01"[!!(num & (1 << i))];

I expect you've left this as is because you really only want to move code
here? At the very least the UB should be eliminated imo, by using 1u in
the shift. Even better might be "01"[(num >> i) & 1]. And of course using
strtoull() when num is unsigned long is a little fishy as well ...

Jan

