Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE25179FFC9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 11:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602156.938555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgiOI-0000fZ-43; Thu, 14 Sep 2023 09:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602156.938555; Thu, 14 Sep 2023 09:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgiOI-0000cs-17; Thu, 14 Sep 2023 09:12:02 +0000
Received: by outflank-mailman (input) for mailman id 602156;
 Thu, 14 Sep 2023 09:12:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgiOG-0000bW-Ru
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 09:12:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c26dee85-52de-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 11:11:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9405.eurprd04.prod.outlook.com (2603:10a6:20b:4db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 09:11:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 09:11:57 +0000
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
X-Inumbo-ID: c26dee85-52de-11ee-8787-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRGocca2kMzcQJIuJuaa1T+SECyjQ1AMdonFGmZ/cQ67Itlqh5exAThouUkyRSypRK06DvqtxLOIoQhAwrWe2ypXNYzwao6SQ1wuTGXJvBg4BFSDPxMI2i6Ri6gKQYX/c1Dqvi5aW8QdXPARrH2H73mqQVGghb75aKbnolwdPs8zd2OYsu/F1zBajtb69rK9BPyXdlR483d9A7AVgYEMI8f1nPvSiuaH/m8LUoxlW707HOgA2Ed1FNvJGVlMYxXuZ2bMjmrcBXFHKG5ya6lzfrrR3ho8sWrUd2ToEv6qlBvCzkF4r4noEORghrrLlkQZ+ack1D/bwlh20b5P82ip2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3LwRDQtpGSEx9FAiKDj4lCnsEe6TJoAjF/G0jCM2SM=;
 b=Kbe1k0woR396Cc3XSKG/C5qap06b+j8/OTiD2TCaPncTY1W21gjU0GYLPlGqhAo39MnR08d/Cutcu2QZKSkpfjq8r2pEMXptRQGDgIXqc6dVtqJXCF/RsBqjRxW8r0Nt2ahfPtkFpGqrQQB8nvgVZoKtC/wgcn7SolSt4l6yQVex8LO/fcCOyMIxfBcMShLVE6ItNGPPEL0sCBDzjCgYWiydiEH5OBVqk2nW7hc/5HSZ3nBcwKrATAa/MV3sVq33M91dyG8hahm0mrOtLYipUMf29NLmYO3Pd8hBmu0BsS6x7iKTvltqsnHb9kiHmwfS0ein5wTvNxtvSVm6t3at6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3LwRDQtpGSEx9FAiKDj4lCnsEe6TJoAjF/G0jCM2SM=;
 b=yWxjBpsOPRTyh+8S8Wdi5xT646a9Rppout6qn14f764Tlt+0eVtixSSbWM49jpZ8U70U559pmyARwV376KHbyXJMigprLDysjMbMWqOyn42SskvgvQhdar7kKpMO6+ClCnQg21tCYld1iI/bdRqdDS6q4L/F3/TJTUoTWZS2Ha3FZhICzWT2TvVmddnmt5dJkujIpj2ztoewlIHmrnnhdIxyQ58y3SzdAWuS5eshYGLve13Tg5NIJna/kE5P3Jefg43f+X6RpAeN7zFVZEYNbsxQi5swHOsbMy8cw+jnR+kyyEisalnsb6GC9ycm5ye0IbLH4ThSD5Kj2l/nN3dhgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e7618567-0108-ce7a-de78-df14f13740fc@suse.com>
Date: Thu, 14 Sep 2023 11:11:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent timing
 mode
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
 <e4ab7415-cf72-4c04-93dd-fd393f49f6f5@xen.org>
 <dfbbf38c-8651-5396-c966-365fe954df48@suse.com>
 <bfe3a681-7dbd-462c-9a8c-969d5a99aaa1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bfe3a681-7dbd-462c-9a8c-969d5a99aaa1@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f1bc50-e064-4d60-32b1-08dbb502a54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v6QTDlmkNeC8cO+O//bfhShnVpVs4cjNI61QO6OwV3AwKFGrv8ze8t2IBWxL0oE2boQ4e4/GAu0atCw+e1oRhgObhuqmBWd1FqgalYGE9kSRsu2IdcrgDw/MZn4lB5V3cy3wvaeHVpRcTha0VGLBKHS+RQNolMjY+UlxThTfYHsVD+J0MOoWfYhSLFwYGRD47w+c9uySjtmY1QtO+5iqsJSQCglAqIuOpVb74XbNG5TAkWhUE1oPod5zSbWj21moWue0q1X5LpYkGYgyYfcwmrLutc1c8gFIzqOrxrCJif9NbriVzWkv02WvnwA/UG95hIjJ7TXE3U4onZ4LVFG7xrQPBwFetVF63Sm478r+PALWYvEGGI3t/GihUb8hFa/+MsCTDRT4u+zi9XRUkp0xwkZKjTYF9RFbFKPPm5Knd63mfOYXSI5sW3HE6i+oNIEBPCGxMMLCNE28fOWyCTCrHfF06MI4rbtgL9hsOy9gMWwC1PeR1psQb+PRgMTfU0zb5KSsUX7ruwR7QcXe8G0V4FQtW1v9rd6t3dt4pH2vMvJyGe4oGD3ep4CudDhSdHfWxYetIOiWt84mTXo93bURFEGW19WKmoHPRikUrqFfuEg2qvPeRkv6u+nFEZDd6c2iYrkY/yo03g8t1IWwCU1NT233OLzZVZp5j9lOBM9M2P8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(31686004)(2906002)(5660300002)(8676002)(41300700001)(8936002)(4326008)(66556008)(66476007)(6916009)(26005)(54906003)(66946007)(316002)(966005)(478600001)(53546011)(6506007)(6486002)(6666004)(6512007)(83380400001)(2616005)(36756003)(86362001)(31696002)(38100700002)(60764002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3JsUmxEZC9ncGtvaTRRVEtTaWdYNzFMNkpQQy9vOUZ2T3R0ZnoreGJMdjZ4?=
 =?utf-8?B?S0d3MkpkS1RORmFGRUt3RmVBMTA4UUpxVlhaNDhYS3J0R0thT0k3cFR6WXI2?=
 =?utf-8?B?VmtPdVcvb2lmbXNEUUIvbGh4SnFxNWwxMnJxK1FtSWs2ZTljREd1TTI3R21S?=
 =?utf-8?B?Q1Z5M1o5QlhGVEl4REIrYUVrYVZJVzJKRnNhSmFRcGNzM2pHMnMxZWVkLzVT?=
 =?utf-8?B?RlJKNE91aGF5VWVzaVhtK1FKbXNZdytoazZkcndDUVBNREZrTHgva0tBQnNY?=
 =?utf-8?B?eTlHR3J6V09KclJPbXcybzdQRzBiMlhLWkR4a2lPNGhIcjN0OHkyZGRPcGFq?=
 =?utf-8?B?cnJ1YWFYMUpSOFNlTEY0YTZTamk5RlVQVVJzcVZEdkNYcTllVnNwbGtoUzBl?=
 =?utf-8?B?dWdseTB5NUdid2ZVWW04R0dUN09NTFRTQVQ4Q1VxV2tDUStpTmx3RU9jWjcw?=
 =?utf-8?B?NDhoTC8vRFVEdjVLVUJ1TUxUcG5MU1R6a01IczRtVTNJY1dhQytzZjZrZ3p6?=
 =?utf-8?B?RXhnVURoSld4SFlXMGZwTXZ6Q1BhMmdTZjNEVXFoY3RUR2EzSVVIQ1ZSYW5M?=
 =?utf-8?B?QXF2RFF0dDRsMXFBSGhZVXZyUkI3cXBiRDd2bGJvcGRYUlVwK3lubVdzUG9l?=
 =?utf-8?B?Mi9QZCtXODJIOXpIWVhUaDd3MXdDRWRVU3lQa09RWEptNFpuSnlvYkxPSlRK?=
 =?utf-8?B?QWxWUHh2dUQ5L1R4YnNQSkcyWUQzb3ZCWVdja1hrNC9abmZYTTZKdVcrS2xB?=
 =?utf-8?B?VTJOY2U4ZG56YVdQZEVuQjY1MUYzdS9lMWF4b0NIWnduSEFiWUtSNjJvZTlx?=
 =?utf-8?B?U0YvZTgzenh3TzkwZVVVV1BTWmd6VXR3cHhMWkFOUmJ4VGdTZklTWHpUMG5i?=
 =?utf-8?B?RFVRdlcyY25sdnBDM2xXY3FjMXZsVDVBWHNRMjRaQ2FpSlAxaXJOaHkwMk5C?=
 =?utf-8?B?NXo4OGtFRy9vVTYvaHNsVGpUdEJaamxoSVlzdjBCOXFCbFgxOStsRTdobWRy?=
 =?utf-8?B?R042REUvWVEwOTNRNWdvR0d3cHFnUmpDdHh2UWVlWXFKb3dScGo5N05TV0hV?=
 =?utf-8?B?eWJTUTluQURJbXYzVk1sU01kQ1BqdG11L2xmQUdScERUM3lzZS9aOTBEYVZj?=
 =?utf-8?B?U3d6WXJwNTNUa3B5TlNKUXZ2QXZyS21Ka0N0dkY3RnRvcHNaZUl1aFVEZGlV?=
 =?utf-8?B?VDE4TGlDT1FacmRkRTNHa2k3VWg3UjFYdm5mU0ttenZqRXVpL1lucGs0bTRF?=
 =?utf-8?B?amFtV3QvN3NpajdDM0JZbnRpTERua2ZaTit5aDBxb1RzSkN0cVpnYWNKNlVV?=
 =?utf-8?B?T1VjUC9EczJpZEdDV0dpeU94SnhSQ1htMEFxcldrdmg1NW95TEhkTG9iVmtC?=
 =?utf-8?B?ckRRekRLWjhIUGhpV2dJNTJpZEt1a2FXbjMvTWhoZHFxTXl3RUlwUVRaSlRD?=
 =?utf-8?B?a25KWGg3OGFQd1R5QmU2UmpYazRHREdhVkVnanZmR3FEUFFiUU5ER0JSRHF6?=
 =?utf-8?B?cjFBWnNkOVozTis5Rks1K2M0NEV1d2JCQlZPOWtFOTlQWlJNR3NqbWVmbkox?=
 =?utf-8?B?ZTl1OVBkYmFydytVbWZmOWVXVXVaMmFIVkpFN3dQZ0p4d2x1ckdBWk4wUVZS?=
 =?utf-8?B?RGJRUkhMcmt3aG5MNFBxM0Q3QzJQOU9YbE9UQlhQR05qN283MVd1NHR4Yzhn?=
 =?utf-8?B?d1VwamFqdytyZkNZVGpJVU5NdHdnNlR6ZlphZ1hkMHdEOFBlcWVVcWRjQUY2?=
 =?utf-8?B?T2Iyb0RNVUNpb1crRHFVbmpQRjk5TkdNNTJhTU9GM1BSa3ZxSStxaTRJNXdP?=
 =?utf-8?B?eHRScEZaOEtWVTl4UTdWalYyTmVHMFB1TGhsNGU5a0dVZU9DNnlZdktOWHdF?=
 =?utf-8?B?UnExTEVlRGVUTHN4SlBxSWNlS3dsUUpHYk5zY05WL1Y4TGRqNzhYeU5OelNi?=
 =?utf-8?B?YWtJMFR4a0RHZTBsdnlOKzR0SjFMQ2ZQV2F2MUlaRHNleENPbmJLYzNlandC?=
 =?utf-8?B?anZZdktiOGptRTlPcWhSZnlOVWUvVllXNnNrT1U0NXgzd1c4ZGIyT1Fta2hh?=
 =?utf-8?B?elhIZEpObmQ4K1B3OXplUjNidldRcWt5OFQrWUhibkhDZVVqYk1hSFRleEcr?=
 =?utf-8?Q?QiCjaBskBj0+PyEooXFRuqmhJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f1bc50-e064-4d60-32b1-08dbb502a54b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 09:11:57.2036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yy40/JZRSE3CDpIpljuaUZVNV+31wtkioCCKkFeYJM3odG9yFH6I5fSbngk3IO4MABP+5MVeUBAL4M5r5Q/ciA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9405

On 14.09.2023 11:04, Julien Grall wrote:
> On 14/09/2023 07:32, Jan Beulich wrote:
>> On 13.09.2023 19:56, Julien Grall wrote:
>>> On 11/09/2023 16:01, Jan Beulich wrote:
>>>> [1] specifies a long list of instructions which are intended to exhibit
>>>> timing behavior independent of the data they operate on. On certain
>>>> hardware this independence is optional, controlled by a bit in a new
>>>> MSR. Provide a command line option to control the mode Xen and its
>>>> guests are to operate in, with a build time control over the default.
>>>> Longer term we may want to allow guests to control this.
>>>
>>> If I read correctly the discussion on the previous version. There was
>>> some concern with this version of patch. I can't find anything public
>>> suggesting that the concerned were dismissed. Do you have any pointer?
>>
>> Well, I can point to the XenServer patch queue, which since then has
>> gained a patch of similar (less flexible) functionality (and seeing
>> the similarity I was puzzled by this patch, which was posted late
>> for 4.17, not having gone in quite some time ago). This to me
>> demonstrates that the original concerns were "downgraded". It would
>> of course still be desirable to have guests control the behavior for
>> themselves, but that's a more intrusive change left for the future.
>>
>> Beyond that I guess I need to have Andrew speak for himself.
>>
>>>> Since Arm64 supposedly also has such a control, put command line option
>>>> and Kconfig control in common files.
>>>>
>>>> [1] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html
>>>>
>>>> Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> This may be viewed as a new feature, and hence be too late for 4.18. It
>>>> may, however, also be viewed as security relevant, which is why I'd like
>>>> to propose to at least consider it.
>>>>
>>>> Slightly RFC, in particular for whether the Kconfig option should
>>>> default to Y or N.
>>>
>>> I am not entirely sure. I understand that DIT will help in the
>>> cryptographic case but it is not clear to me what is the performance impact.
>>
>> The entire purpose of the bit is to have a performance impact, slowing
>> down execution when fastpaths could be taken, but shouldn't to achieve
>> the named goal. 
> 
> I understood that. My question was more related to how much it will 
> degrade the performance. This will help to know whether the default 
> should be yes or no.

Well, as said - I have no information beyond that to be found at the
provided URL.

>>>> --- a/xen/arch/x86/cpu/common.c
>>>> +++ b/xen/arch/x86/cpu/common.c
>>>> @@ -204,6 +204,28 @@ void ctxt_switch_levelling(const struct
>>>>    		alternative_vcall(ctxt_switch_masking, next);
>>>>    }
>>>>    
>>>> +static void setup_doitm(void)
>>>> +{
>>>> +    uint64_t msr;
>>>> +
>>>> +    if ( !cpu_has_doitm )
>>>
>>> I am not very familiar with the feature. If it is not present, then can
>>> we guarantee that the instructions will be executed in constant time?
>>
>> _We_ cannot guarantee anything. It is only hardware vendors who can. As a
>> result I can only again refer you to the referenced documentation. It
>> claims that without the bit being supported in hardware, an extensive
>> list of insns is going to expose data operand independent performance.
> 
> Right. So ...
> 
>>
>>> If not, I think we should taint Xen and/or print a message if the admin
>>> requested to use DIT. This would make clear that the admin is trying to
>>> do something that doesn't work.
>>
>> Tainting Xen on all hardware not exposing the bit would seem entirely
>> unreasonable to me. If we learned of specific cases where the vendor
>> promises are broken, we could taint there, sure. I guess that would be
>> individual XSAs / CVEs then for each instance.
> 
> ... we need to somehow let the user know that the HW it is running on 
> may not honor DIT. Tainting might be a bit too harsh, but I think 
> printing a
> message with warning_add() is necessary.

But Intel's claim is that with the bit unavailable hardware behaves as
if DIT was in effect. Therefore you're still suggesting to emit a
warning on most of Intel's hardware and on all non-Intel one. That's
going too far, imo.

Jan

