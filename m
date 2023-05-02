Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 354826F3E6C
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 09:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528373.821428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptkWy-0003xf-4D; Tue, 02 May 2023 07:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528373.821428; Tue, 02 May 2023 07:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptkWy-0003vi-15; Tue, 02 May 2023 07:34:36 +0000
Received: by outflank-mailman (input) for mailman id 528373;
 Tue, 02 May 2023 07:34:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptkWw-0003vY-BF
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 07:34:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe02::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c81e4d64-e8bb-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 09:34:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 07:34:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 07:34:31 +0000
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
X-Inumbo-ID: c81e4d64-e8bb-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7l6SR0ZPOs+u3/kb3E0YxSfxQW8inxOhqW6x23N2JC26Lw/DUAOig7CJ0PH+qwSzIhezzm6FhNP4byfIQl/pz4zJ4XrfQ7vIdAueczcRiwYiHlNVKDj9QOlOvDb+thQz45jhdScBYpnNxarEoQiRcAwkX1Hnw4XfQ/mVjib9e19GjUWW1bFK+rK6r9mIbgV+8qq2JbNN7sYdiNgAOlcr8RGY0MFVCyW71f9oU8hVsL6MpFgmbxGTUzV9RIiAgb7s+fXM0KEbPJh7dkDij8CsPWRq+0XQh80xjOFTaztMUr7yVDyQKV35c5TziA9Cnej9vx/Rpyd6+H+rVCpimIOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQnUS/XI/DAbV78nBE3hwMbN1l5XLfaE3ZjQSab4SE0=;
 b=cfJMZsdXRomUyD1lXSGxYqt4y96W7hGV/6QhU2DJA3mKn0Blt2AsMqa/UhdmYlH0/OAIeS5yJzSDRZgrxLjcswlAmnhN3Ohz4A50v6uzMrPseozC/w1C6y5ROsFj/Jf4HIvdWfRh8VdwBjW+V9UTPxn+bSj2PqeuupldlUORARVY17iQizdeMzV9FF/P5tCnvdhzae1ChrCwXgdZTecQyEQQrEv7AIlAfOGxXi/jFkC5AxCSdZm4zVNnP2USB5rnSSlQd303MjGiolbmco+ej9eU78IwLD05XmL0k1AaygmWTX+Ws2lTQqgAXs3V1/bbd3/p418gK7EWVJiJdRq/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQnUS/XI/DAbV78nBE3hwMbN1l5XLfaE3ZjQSab4SE0=;
 b=Uu0nWfQo1KSxFvDXKYFT2OS6/6PA/shbPplEe7ll+SS98GamSgcOIe1cKzi1QuZgLRXCpPg8lnCfp7hPQmwhgciUnr92UZKi9QF2kXYWVORsR2OamEupFdwFvVykvoFYX/vgHGD/hsnHJYwUal8RxgotvyvBoJskuUe0U2H8g+a4lhMWS4bMzsJ0j1Yc+F3NCiMKv10d1/2Gv7nNZOYSigBkMb+oti2H0q6ER0vH0myBPcXOAAfEHwsfPmaMUlVaeaxdxpf0sF6Xzbxh4vm1upWnIf/2LKy70tWrJC0H6LTGLCJlWJPnLTYSJEJ8iTlLrH5elZybhbk4r4F+OSBHRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d58e0b29-3b00-a59f-ac49-a876359a299d@suse.com>
Date: Tue, 2 May 2023 09:34:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: HAS_CC_CET_IBT misdetected
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20230502074853.7cd10ee3.olaf@aepfle.de>
 <43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
In-Reply-To: <43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: adb3385d-2178-4675-b128-08db4adfab75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yi1RI/idzBCe7/bsuVg100wZc4lc0SbeuhPtzMkIQ6WlT1i0+tUdbfZm++G8WH1uFncxkowySqvS3wGJQWsUJfLDM/C3vppALfPv1IywrvR3bvF78hKgCZev2btDyFceDJ37Pc1qutZ3kdPgwCz2aKFcbGPI2TxMf9551/OfVIHADOfw4Tx60jme7Ubop6CRM3Iz297fKaCH101hrixEBWtUJuyzhsDALwADUlbnCnkndMBdQokpZks3xB4efDahWVSLIkHtHBh7B2twUN14192t7N0WZfBgs+/Vzn46TCroqum4lBGxI0RvetqGNgOcfswHLB28z+CfgfA4u9JR7VMyALzUzAFquGRL4ERW9D/89/ibI0yKAzFWYuFxTQ7y9//Zs1/T3Pv1IFLoHn0zpt9WXBbcUhTrL4S7iWXHML4HflIJPd66FNk6nt06ZMaiwJsL6JtTTU8fv9hq2P7SeD371d2WabyD09ek9FFf6bCPMBIsXJbXlUC6nP6K+hWEtV5Z3HEtWAZ6cGwfR+LHz3Sj56tJGyL6LI6A+bZSttRDTyPBv3ZDawPynVmVHZbUe9Lg/9I5wseylGH5mSl9IQcoSdR99wwDooqzA5mLYPFQ99VqS3lmqwdxxhM/xMhGXv5Z/MEo5NufVXmho6c8vA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(136003)(366004)(396003)(376002)(451199021)(2906002)(6506007)(6512007)(26005)(53546011)(186003)(38100700002)(86362001)(31696002)(2616005)(36756003)(83380400001)(478600001)(5660300002)(316002)(6486002)(41300700001)(4326008)(6916009)(66476007)(66556008)(8936002)(8676002)(66946007)(31686004)(7116003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0I1Y0dOYlFnSkRXZmJ4ZlN4L0VPS1RZdERnSndqdlN0ekxzSVhpbVJpdGZI?=
 =?utf-8?B?dm5yL1pvbjd4WkxqSWdPZm9jUzZoMERqMW1uWG82TFlvVnkwQ0t1VDV3eHhI?=
 =?utf-8?B?OUpZanZzMjhUd0UyU1NxYzFReWVFanlGYXFVQk9yR1JTcENSMkJUZ1FBMHEv?=
 =?utf-8?B?dy9Ya0VnOS9KZUFDNnZHSzJkTTNDdEhKeHRuU0hhcmF1TjlDYlhLbnFwQWxB?=
 =?utf-8?B?NzZLWERWZlFjaFpIc24xb0JscVF1TXFZR1Zob0VjNVF6d054S1lhcTRmaVgv?=
 =?utf-8?B?aXcwSUp2aFNNVnpGNU1vTmxPYmE0WkZHWGk2WmhCK1RpdlRwK2xoeUdKOVhT?=
 =?utf-8?B?MHBUTzNIUHdQWTREeTFxRnM5cDdvQ2ZXZ1Zhb1dqY3FKR1Y0RUxwN3VIeFov?=
 =?utf-8?B?R2RweVlyUE54UWJQUWNiYXRTUUN1TmMxTXhlbCsvUzlMWkZKbUExdXF0WjBZ?=
 =?utf-8?B?WHdaQUtvb2F0VWVUVHZURG9EV3NMMGVyOU5FNS9OV3RWM09reXZlV3RraVY2?=
 =?utf-8?B?SGtkTEpnNW5vZWhtZm1wY2pKQUQ3RHR3Y2tKOEJsUURsTjFXU3NhWjNzM2pi?=
 =?utf-8?B?RkZxbUw0TlA0NmNVZU41VGU5QUllRjQzZnVLeElqMWNFcHFIU2puTUl0M0hG?=
 =?utf-8?B?MWQrOFp1RFI3QTdYUHkxekdTS0wxNTAxWGNsQmcreUNlMDlBek5ES3lRTlpa?=
 =?utf-8?B?V1FpU1VLMDJ3REUxaWJQK0RKM1l0aHRxUVNKMUdCSHpNUTR0eWR6MXJneG9u?=
 =?utf-8?B?cExNYktvRklTdGYxSUxjV0VRYUh2aGI1WiswZmZ2UzhYRkd0bHRjSXE3UXYw?=
 =?utf-8?B?K0xIVE9rUUhiNjE0UUxYcG9kNjVMT1pSYjlORDJubTQxZzQvYWFJTHlvVDJD?=
 =?utf-8?B?eHNWOVdUWGNXUUJ6ckZkdkhTcEE4dHdPem8zclZQYmY5Z3Y1QSsweGVGVGV4?=
 =?utf-8?B?Qlg1cWlnVExvNXRVMWJkaEd0QU9SeWtvMFRQdU9OVVZiM2RqSFQ1N2NHRldl?=
 =?utf-8?B?RFVRdkxVc00reFArR0NyRWczeE1yeWFGTDBNUzZRazJOWitKWUh0VHVkbDli?=
 =?utf-8?B?OEhYVDJRTGVybFBEL2JSZ0JIUERPbmZ3VVR5bTlDak5KaHJPamxMc3oyeVZJ?=
 =?utf-8?B?a25mNFlkYis1c2tialdPM3BNVXh1dzMxSFM4YjVabkFlWlFxYVNGTldlSVps?=
 =?utf-8?B?a2Z3UzBNNW4wSU9XOHZuQWdpcjRmTjJJbDRqYkpqajk3TFAvVG5PUTAxdkRm?=
 =?utf-8?B?cVFtbE8walY2MWZSQ1QzN3BSTW8ydmtWZE5zWTR2T1VXUGtMVnIvMUF4K1Jz?=
 =?utf-8?B?emZIcHpQT3ZOYlNjQ3ZKZ0lzdVp5KzNRajRqckdLUTFwb2dQL3BuOWdQSFlZ?=
 =?utf-8?B?TWN3MG5QQ3lvSGdnelF1elR1d1hBVVlqNFFtS3QreHBFRW8xSUd2K3VJVkJH?=
 =?utf-8?B?cTN0MXcxaUlGQ3Y5R3p0RUR2ajYzMHZpeXY0eGxxdEowYmRwcGZrU0orNXQ2?=
 =?utf-8?B?ZTZMTEZyOE9POE1uZGZicmExWnpldjFxbGNaQnBPOGxJWE5yTE5jL2ppT0Jh?=
 =?utf-8?B?SGJiVjdxLzlrQWhFTXNtcldRMCtaSDJrSGU4eUJ3VkdsNGxOKzlFWE9PS1Jw?=
 =?utf-8?B?ZjJSVUgxVDY4ek9IT0ZHMy9Mb1pFWURzS01PVnNrRkZBak9FN3ZtTVNuS01L?=
 =?utf-8?B?Z3JpNlRNWWVSdTRrQXBoeTBoNThhMGNYK2lPNS93WmVCN2FUdkFqeTZUUk1i?=
 =?utf-8?B?QzVuYWZjakZJU3pWRmtKN0VQZTdIZG1uUXpDZFI2Z3FJMi8wYS9ieFhtTmVs?=
 =?utf-8?B?RTVBN29tTDZpSVNEZjgwTGRDN0FrcjVseHpmUDNhN0xhLzdCVjdLSUpZRWFK?=
 =?utf-8?B?SVVzTmZDWnJtRjhSTUhkL2RCQi9QKy9SYmRMWW81MVFObmdaa0p6OVBWTW5t?=
 =?utf-8?B?NlJuM1ZqK1NlSUlOQ3p4T0w5TjcycFdwUlFoSjFhT0k0QnpsNG9ZbWJtNnk3?=
 =?utf-8?B?SDRKQ1ZJTXNNQmJ1UGgyb01aNkNMbGZuTTg4NHM3OTFtZWxBK3NQR2s0OXBo?=
 =?utf-8?B?VFlhUyttU0hpRjExNlNIWWNwZE5CTG9NdmNPTXdtS0JOR3lzanNtRmZwQTF2?=
 =?utf-8?Q?T+IvlYpjtIr8wlIT/ENTaX2dI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb3385d-2178-4675-b128-08db4adfab75
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 07:34:31.9167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IbVXx5nVin7kT0/7bjnAxTDJuU7syFwqzyHEA0TZONLcQDN9iVp4JI3tH6Z6KAw6ki4GjPFRDp4sEGV68Cq4kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

On 02.05.2023 09:31, Jan Beulich wrote:
> On 02.05.2023 07:48, Olaf Hering wrote:
>> The next push to xen.git#staging will trigger a build failure in the refreshed Leap docker image.
>>
>> For some reason HAS_CC_CET_IBT will evaluate to true. I think the significant change is the binutils upgrade from 2.37 to 2.39 in November 2022.
>>
>> The comment indicates the combination of gcc7 and binutils 2.39 is supposed to evaluate HAS_CC_CET_IBT to false.
> 
> How does 2.37 vs 2.39 matter? CET-IBT support is present in gas as of 2.29.
> IOW I think it all ought to be tied to gcc being 7.x when 9.x is the
> supposed minimum. Did you / could you check which of the three options
> (-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern)
> is/are possibly recognized by the (likely also updated) gcc7 there? That
> may provide a hint at what's going wrong ...

Oh, it might further be relevant that Kconfig's cc-option passes -E to the
compiler, yet none of the options actually affect pre-processing (and hence
might not tried to be evaluated with -E).

Jan

