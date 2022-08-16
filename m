Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1568B5955B8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 11:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388100.624668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNsQL-0001Vc-Mu; Tue, 16 Aug 2022 08:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388100.624668; Tue, 16 Aug 2022 08:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNsQL-0001S9-K6; Tue, 16 Aug 2022 08:59:45 +0000
Received: by outflank-mailman (input) for mailman id 388100;
 Tue, 16 Aug 2022 08:59:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNsQJ-0001S0-Tl
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 08:59:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4023317-1d41-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 10:59:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8914.eurprd04.prod.outlook.com (2603:10a6:20b:42d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 16 Aug
 2022 08:59:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Tue, 16 Aug 2022
 08:59:40 +0000
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
X-Inumbo-ID: c4023317-1d41-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZHZP8hKg/yWGD0x84CbdJlY9iKPusVTzYCa5xZoV/rKIcMPELhilbA5xExCbT45id50fAOS/1R8Navc20ap8BmhA9tXJXukb3EypHqjLymXFPYL+mJBXFPcsfbFus8++DJGwPX4TJgTOsuDt0X8TwNzBdn2W55a+a9d8mDGO0JCL+VL5E3jwjbjmssq3md9cT8IaP5cPMICAJeZXIVqYfEx3NOOmiy4cO/1sJMAaVig9D62v109ocivQONNyden19UUQgOE+tnhHJ8vu/fxjXRq+PkglA4Bvpv5FOKnSE9y4Rpfze8WXxm1DJcFa5nOyllMyPUuZMY+LUBN7vFaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EygQqwm9cbi5rFtal9Y7ekSUN6Z8KDQF2oCnJZQYRY=;
 b=esJjjKslFo/9IYpxyx2W6oEUhsZZPCs1K6hcNQTextkRIwu1bWDsQyVf5q7UWQtG80BBOUQ3vjsBcSlJq4hv09npg9f/TE8jx030oLGTbAPKSaDOaxGWgI8bkk4/Y1Z3RkG2MK8WQEq32hb7RwNiF/urBCHupjbGyAlopqEGhxpyP/4VVCm0CYM4xaPUXgC+PbBYhbnh61fnMdGbxEfsMJeuFxeTZtInh+ocDdnRcvygznFUwT/WM1xhU/9/iRVIpsi/C4L2NF24o0yGHZNfKv+3LUpReTpjiGBdOq8x+iz4h270hphWT4GBvQPEGphTpwPDpmpk2rsjBBzuvJ7IzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EygQqwm9cbi5rFtal9Y7ekSUN6Z8KDQF2oCnJZQYRY=;
 b=GKbSLnAYS33qMU8jwTzvxNXWqEJbSg7/s1RIVv6yldiCIK7YVKoseJ6QFGmNB+dJ3OelkoI4FQQM/MvolBdOy1drYhNpA/66xCt5xfb9Vn4IfslgQdtwlCUb3tOjht9PLOoWVfDykUpcGH4Be+Sr1cYoSsLZMjeQGonv7Or7+T6Jbw68CI3atxk0S9WJCVoe05DplRmpc8Ra6uBOTL6E+5maKQ5nSC7trsVFiwnpnn1RhCIC6XAyu8DIQfPhmKcRwwdhhO0lUL0k2q7gYJsTXVT/4tM3qTfVLBqZzPRfWtzpEtB/4qaCK9qnc475jjLwzN2OIJqrIpyfFDJNMp4/1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <94c4df02-37db-f722-3644-bf26a278107b@suse.com>
Date: Tue, 16 Aug 2022 10:59:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com>
 <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com>
 <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
 <c24c469a-e0e9-6162-b8d3-07c1707fc2d8@citrix.com>
 <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com>
 <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com>
 <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com>
 <2d844e18-c1f0-ddf3-6e6c-28b3ba09b427@suse.com>
 <2Z9txJ9x0dRfAKKDGhv-bzsLzhaGr2eIXMpUtMOqXCaXVobm_mL_fjQ87VfcB3pSc4bOntsOG_aYCmL4CBgJFqwOI23OFyZ67KiKnK-MIP4=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2Z9txJ9x0dRfAKKDGhv-bzsLzhaGr2eIXMpUtMOqXCaXVobm_mL_fjQ87VfcB3pSc4bOntsOG_aYCmL4CBgJFqwOI23OFyZ67KiKnK-MIP4=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cec2ec49-46b4-4db6-ca4c-08da7f65a74c
X-MS-TrafficTypeDiagnostic: AS8PR04MB8914:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w8laZy6njgJmIa1u4HksZ0iAPFELbLsfkF3J/vdqtBU0p+286kHv6d20LvA9j0KGjH71wwKFgWIihpQPmae57SKikPgSzMvVgVGVY1XSeANBr6oUIiA8EXHjaCnsR2VnK9Tv4oqW2ubjGL/J0mVXkxqCvPSwamFSKxl6BIKAAnz9e95lc4kr7ePQubu+K1WWTQh5Lo4crQWMa5gD0i3nNcn85g0JezYo8ZtsG3/qZHAQUH7gA+YGyVBFxxHdhMUCjTz54zkaCCbK9dMAUQ/+mEkxK6/P0oRk2oPQ3WyMr30MOLRJnXzVpNQqb+awlzxnw6vJtu9gcmfTsdrcgVZ10nESBzmpy/DJWUn8rUvPp/8o9yVkscB0gQZfR8LEhPse6F/h2Qit/FfYu5bo2MAhU0B4kI3wCPLPI3ZZbWjl/mxnrO7CLnescDv2e+0pLppxt3wH1+FnIU5UdjREfbE+cHaSGR8RNn+fHO+7WOn2G9aYCecfthr8dah6pzxT3xOBpzJ5K+R92AFyIRypce0oQREAqVu5jsft82kSctYzLWuP2+pkzUWHycVfmIwIDZU0E4R2wTEv68o4bgZspIVw3VZ9PLkKnhb3Ji+dEE0bHykavYPqLNkpFmNVLacj3X99PrMX14ZOAdprCq+RUmZEkSJJP63os/kSDoXzHnLHqTpxrX5DuoojNqUk5JTd5thGdr4KRDu+hfls0Pen4g+/2DchAa++IfUmUipxdUV3r1sewAeYI+5upEUhpIkTltrpn8RRBUY/qbQwCEUw9hPdnwEi+mBezA2IKgYDj7Hg9wTx1ATASY8wB7Cx0nvmONoVC3SRimBLoxY53ypQ81D8Hg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(136003)(376002)(366004)(346002)(83380400001)(5660300002)(38100700002)(66946007)(66476007)(8676002)(186003)(66556008)(316002)(6512007)(31696002)(6916009)(2906002)(4326008)(2616005)(26005)(31686004)(478600001)(36756003)(6486002)(41300700001)(86362001)(53546011)(8936002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2hyeFhudnduSnFlZkZqRjNsQ1JvT0REeU1INk1uSjdKcUpvL09LcVVEb0ZJ?=
 =?utf-8?B?UnBXV1hkRTc5eGtLR1BFQ3BqQ1lhbUQrYlkvQUd2Mm8ybHNEYTQzNUpWTGgz?=
 =?utf-8?B?UkxYbzdjam1vVk8xQTJpSDJhMmNHN1oxOVBXMUxqRTVIalB5TE15Skk4aitI?=
 =?utf-8?B?MGxVOGUyNnZ1R2V6WTR1NkVzL2ZsekJTc0FBbWgrR2gxS3pxRFp5cG1wcmp1?=
 =?utf-8?B?TCtHSk5aQ0YvS0hNSloxdkpaYkpuS1lhb0d6N1FjN3BMcGNxY2xFTU5kVnFq?=
 =?utf-8?B?Z2dRVVJmeGN2bWJZVDRpL3BXNklRaUp3R0tOU3BhV05FUHNNdWFBdXJkMndP?=
 =?utf-8?B?REkyOENkcUYyc3pSYlN5UVVVdVM5TkxxZEVxSXRzcXdNVHNYeCtKaC96YkZy?=
 =?utf-8?B?YU00YXJwd3J5d0JXNVc2dWI4bzk4R25jVmxnY3JSejI5WmZlZVlpQkdKV1RN?=
 =?utf-8?B?dWhKYWJ5YlB2RjRONzNGMmRaR2h1QWpoQTB5WGtEUmRua1NCQlJKYTJONjFM?=
 =?utf-8?B?SUFWNjliaVhxRHcrbWxsMWxZMzUyZDhERHVJNlVSMUIrUFRlNWp1bkdPd08r?=
 =?utf-8?B?bUdsWkVJSFdYY01XcVBSZXpiYndSMG93VE96OXpZMmtlOVk0dVA5WGZLLzBx?=
 =?utf-8?B?TU1JU01odDI0S2VxUUN4MnNqVGZCbXFDQ3k4dzhTNThpamhmTjRyTVBoOHlM?=
 =?utf-8?B?RjZzcHE1dGZnSkhCWUo1cFRHU09CUU53S1ZSOHdMQUJoN01KaFpZeUpTeWdx?=
 =?utf-8?B?a3VFdk1icnJYTzllcDFEdTNSMEs4Z1FkSmtZZ01IUWNGVHpXaE83WWZxQU1P?=
 =?utf-8?B?elF2bU5sVDdIQnZEbVo2bzg3MDNmNFBMZFBrbVhyMTlNaklQcmVPNFh0bVhu?=
 =?utf-8?B?SlVsTGpRUGwzQUpyY3VDcnRuZlAreG5jRnBuT2JlbS81M2M5SG92ZkVJcTRp?=
 =?utf-8?B?c3hENTFIK1FYcWllejRMQ0E4Z2M0OGJ4bStvK2lHOW1UWVc1NWtudWxydEs5?=
 =?utf-8?B?VDNMZlE4S2cxUitGN1RpMkpjZWxFcFluMUF0NExBY3BLUFNmK21CeDUrM2E5?=
 =?utf-8?B?MWs3VDd4dVFFL3l2dUplTHplWUF1OVJqOU5LbmsxeTFCdVhOVm5xRGswYmMy?=
 =?utf-8?B?TzErNFFjQ2ZHS2UxUWkvWGRqSldoNXZqNS8yVXg2T2dvTEpjbnRCUGZCeGJ4?=
 =?utf-8?B?SVR3bjd5VmVUelFHdk5qeEFCdWU0dHljL0lFVkMrYnc4MEozMWpscnJrT0pP?=
 =?utf-8?B?R3dKeVNranJIUVE5U1FpeVQ0Nm1VWE8wWERnK3pPZ3dLYmNadVYyVmxrSEMr?=
 =?utf-8?B?L1AvcER5Um9PWkRMTnJOc2w2YjM4clEwbk5zOXlPUVcrbVpzdjc0OWZQVVRl?=
 =?utf-8?B?TFlVeU5hVzFldGtUK1pPVUtTK2tmSVVkY0pEOFUxTUdOMXVISEtsWG03em93?=
 =?utf-8?B?ZC9YL1czaGRsTzJFaU9Va1Rub3ZwdHZvMjhFdy93QTErVFZkV1EzWnY4Q3lh?=
 =?utf-8?B?aGNhbHJMZVcyZ0FyUWRRRlRIN2Mzd2c2cUQwaG5zTDdkbzRQZDcxb0VBaW5H?=
 =?utf-8?B?bExkY3ozZDQ2ZlI0TitoNGlZaFIzNUlCZVZ3Z1Y1U0doSTFyWG5mbTFpMlZW?=
 =?utf-8?B?eE5CbjlrT3NlQU5MdE9NczU5cjI2Mk45SmJqbXR3MWg4UWsyMUxDNVA1VU95?=
 =?utf-8?B?WWtseXFqVjlGZGI5TFpSUU5WR1gyMkl3K3JDcjRIN1RXQ1h0UzRrbFZCUkZO?=
 =?utf-8?B?MU1JUlRBSFlYNXBZU2tqSmpwdEEveHFYSDJ1TGc4TktjckFibFFnendQSmFY?=
 =?utf-8?B?RmZwRHU3MGY2TFc2VlJqeksxZjNoeXI4eTZZa01QWUpxaTZDeGdNRUgrT01j?=
 =?utf-8?B?amRxZmxtMFNEd3FIS3FZeWFLenhQYjVVRDVKQ2Fwb0dKNFhXSURYNEsxQ2lP?=
 =?utf-8?B?bDNueWdPWWcrOUN4OEZMQmFiMFJhQ2lYZEtPT3RILzJScmFKMEF5Z3k4R3Bn?=
 =?utf-8?B?RnEzQkNhR3NRUmdZVkhkYlRrN3NEZHNUQkdGWWt2T0hIT0NjZ3FkamtmWUdX?=
 =?utf-8?B?bk15UU1oU3BzY2lUVVR1OVdXdnBSZE5LY2xRU1ZPcitkUDVBK240NmN6VlU5?=
 =?utf-8?Q?y8q3hFO8WH5nggHAA4b4Vos9n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec2ec49-46b4-4db6-ca4c-08da7f65a74c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 08:59:40.3317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwO9rj0agmMOr3bLfGYJ8ZvZ1HmQl3GS7a4nSFM7+5qPYhHNWlhdNZRRKBpREId02MgtljaCr4CiNlSdCL6Xmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8914

On 16.08.2022 10:34, Dylanger Daly wrote:
> Indeed no devices are being passed into the domU, I'm simply trying to start a vanilla VM with no PCIe devices attached.

Hmm, looking more closely it's the sound device which is being opened by
some ALSA process. I have no clue at all why this would happen while
starting a VM. If the firmware setup allows you to, you may want to try
turning off that device and see if then the VM starts successfully.

> Could it be a misconfiguration with ACPI tables? I originally thought it could be AMD's SEV but I think it might just be that Xen is attempting to use a memory region that it shouldn't

No, it's clearly ACPI which tries to evaluate / modify something. That's not
initiated by Xen at all. It's merely likely that under Xen something works
differently than under native. As said, since now you're able to see log
output on the screen, quite likely you would also see an earlier message
about some mapping operation having failed. Whether that would be a Xen or
kernel message (or both) is uncertain, as it would depend on the specific
operation that is being attempted.

Jan

