Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABE43F2931
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 11:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169361.309356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0rO-0007FM-Rb; Fri, 20 Aug 2021 09:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169361.309356; Fri, 20 Aug 2021 09:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0rO-0007Cb-N9; Fri, 20 Aug 2021 09:30:46 +0000
Received: by outflank-mailman (input) for mailman id 169361;
 Fri, 20 Aug 2021 09:30:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mH0rM-0007CV-VX
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 09:30:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 731868c1-477d-46e2-b6bf-d1ecd19f5e9d;
 Fri, 20 Aug 2021 09:30:44 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-8c6onWiyM0yS2nEuYivrdw-1; Fri, 20 Aug 2021 11:30:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 09:30:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 09:30:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0059.eurprd03.prod.outlook.com (2603:10a6:208::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 09:30:39 +0000
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
X-Inumbo-ID: 731868c1-477d-46e2-b6bf-d1ecd19f5e9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629451843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M0MqlltUNFLQp2EdPyFeJvvWk7s/5tILNlHM2F1TJWk=;
	b=gE7/tsOLJDUoMhipHW4biJ9T4T9IIST+3Rx/b90PR2bdQS0r2aQYSbgnxyWT0SUxXPhYy9
	etbNOUge20JZD9zH0ju0NOtSmkqKjJVWZn1TjUSEUfXJmdZ2SdKo82FqELT0mJG1uijRXH
	iJ99H+A9lsOMUrac5TiOmO/OufMJ9l0=
X-MC-Unique: 8c6onWiyM0yS2nEuYivrdw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyC7QDYBX/SGEwuf+fM6QlzJ11eg7yFyxZkHL3VfPn9LWxV4Xgx8aKbTpBBvE2h1+au2tAXnhekssB3mJmXP4Fmfiy4BGdrC/je5oJkLnBAFI50TddEXT0Ys6TN2VggZf5WvmC+/fYWy2t03FRFjD6qOfUt2f5kGs7QT1NwPBacVxoLgaj6rSbvUc45bvnmSfC55ZbUjMJz37a6oBbYApU2D54ksrinB5je6Tamj0Cb2DlvaEhs//H1VHS85mPtAnxEH7WPQb/oWcCIfizJFt51endKfpUPMN2I5nGXTsdM5nWL7Y9AwAdki1USuPgxJqlaUVEN3CWVWxHYOneovWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0MqlltUNFLQp2EdPyFeJvvWk7s/5tILNlHM2F1TJWk=;
 b=CwlHtJ2yPtV8ObzuayvyJNlx1F/KvoIYIfhrDhpgJzbqU/oRk64EQ0tcusO7RezOtIixw4UxvsvCbhr3ULDTXb/k1fDs6kft7KfrnXuhsMFVfLFoEsGeTKOKd0LUOoVpZAMp8eDYyu46il2eAHQUnRAsJdtU4UiGS3eSZLk1Y3/+OdsecvBVZB4nVIBQxRYmcqnLg+YGPBwpemP8Pp+CyhKnBXaDvjeX1av/1AoyjrRkGJgBICvB6sZrH/SeXxbr0D7kFnBc06Mhdl83X27tOeFew19xyGQtfY/qb9sMHOwfXDjmTVENVrBfcS4egway9fuHuXDy7Yc3dZip58msng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/PV: account for 32-bit Dom0 in
 mark_pv_pt_pages_rdonly()'s ASSERT()s
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <14ed9a42-981b-da81-9a30-6ff9b3896bfb@suse.com>
 <4f0b9a70-e58c-7005-6eeb-82b9cd295a72@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c74186b-801a-23e5-2e0b-d627e58dc257@suse.com>
Date: Fri, 20 Aug 2021 11:30:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4f0b9a70-e58c-7005-6eeb-82b9cd295a72@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0059.eurprd03.prod.outlook.com (2603:10a6:208::36)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f61729a-1056-44da-793e-08d963bd2cdf
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445A517E6F825BE08687A46B3C19@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q1yzR8NBftymCWXDVNEusuwPmrYD+j7XJUjtODnfehrVCwhU2HG6dyHuLHFTKXHugNuaDMpYZyw5SlLZShPo7ftda6eSzSa6NmsLrcyBc0WgZLly/tqMFbTNoo+6zL/P+w0aoRK9USo3C4kxKbdoynzyU7NJVfs+a/aedJxTRwMQ93/g8T/cxsTzPDp1cirET7dG4Sfg26CYMMSyWV/hIcIYHUiB4eRZHwy/5G3q8DiT7dyNTUQpQaW4YY2DVk6E78MMZh10MlxallXF4Z045M4wtD+BeFpxDvR1kmsqZiLJj8A2jnZSjXFKhkwoWuVXVDJc5Hsxep+VMkGqYxpDEWEl8d4wRhtVAAwEniW2n0bCSsycWa/UC/G7F1r6er7LO2h614kM+/2ClUMfY4di2a7tegijvhzXcH5ozpT3nbg/hVnbotI4y0yMIAbI3Ug9TA6M2ROjwxwpLExcHxHLoXuB0wtM8xFK7duMiP8tYkkNDZ/hDYVuRGjeHZDK+/+rO5IxIHGMfOeX6eq1YEdcsVksn54eJu4mAnlxgXmvhfe41K87Ood4bF/oYbizl4I+oCKjGR//GhtFs9npoEM6514IGTmBvo4l39ARiRBkKxbznh70M027emfWJR/NYyQJNcknidrYDznYNLEGz9EKO/wmmEqEDiZ+sfISZacCt4cIG4+vJ0flUnGGzPkYVTugo8eUu1EQYZYPZd94JLuLly5IROZjPXDTzfOlCQGU5mU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(39860400002)(366004)(136003)(478600001)(316002)(4744005)(6916009)(38100700002)(16576012)(5660300002)(2906002)(8676002)(26005)(956004)(66556008)(6666004)(2616005)(4326008)(31686004)(6486002)(36756003)(66476007)(186003)(53546011)(86362001)(54906003)(8936002)(31696002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVBJcjgybnRzM3M4cjNmYWkyNlZjRlgwMi9qcW9HVE9kMjBRcDhPQksxVFJJ?=
 =?utf-8?B?WjlCWlpSQ0FUcDR6Q2RWWTh0QzVBMm5vamo4cCtCNkNTa1ltNWxJcjAyazdU?=
 =?utf-8?B?L0djcXBwSm0yWmFINDdlanZnVmk5RXJiQnUwR2Z3b01sSkV0aDhMVWliQW9E?=
 =?utf-8?B?ZmhMN1QvRk1VejhxYjlRa0duY0NDRThyNVMvdzF1enNBbVZ6c2Q5ZUM3RDhN?=
 =?utf-8?B?U1pqaTMwSUtqbHFZekdwK2JZeHlHdjVTbkwwVmhGMGtUNmh4WXRuSzd5THB1?=
 =?utf-8?B?MTE1NjF0TDZwNkszMEVRb3UwTlJYSkZEOW95WGh4Qm5TSXM0dmlTdmVaTXlY?=
 =?utf-8?B?Mmk0azVnV1VITC9NU0dXTEM4TkdtQmRJbzdob0tVOGw1QzBIUCtseWRaaGFC?=
 =?utf-8?B?SG1JQ3Rqa2N0eXJTRUlzRTlwVktsVm5CdWtWcEJFclQwTE83dXRPMDdMK2Qr?=
 =?utf-8?B?UWhLN3lYL2p3MTBhOXhrVnV1ZElXSzFVdENVbjBnSnRDRVprTHE3RklmWGRk?=
 =?utf-8?B?djEvTG12Z3Q5akgxZ1g0TGtDZUtzR24rQlBsWTAyTzFjRWttc05iK04zNjhG?=
 =?utf-8?B?LzgzaUVWUGg5RUZoYzRrbU04Z2l4b2l3RjlpNVp5SDZrbDlTdFZDS1laeWE4?=
 =?utf-8?B?Rkpia3pLS2NjcWpjZEJjVk9uZVBtaWRlTDNVRHVmNWxjM1pPZzNUVVNQa0Er?=
 =?utf-8?B?Z3huQS9WL1A2cnpjRHBnRzNtRzZ2TW5YdEVDTEhGTG1SME9Gck9HUHdNTGVw?=
 =?utf-8?B?bkFMTER0QlpEN2MvMXVTbjZOaE5OQnlzelBLdXpHcFl6bEErWmYxWTlvOHY1?=
 =?utf-8?B?b1hXZElSTFVXMk9LVlpZbTFRbTBGbUN2VkZoYTFoWjhyNDliNEhKM2ZtWno1?=
 =?utf-8?B?U0pvK3laZDBTUG5oU3c3dmlwMDVXNXpEMjdWbTc1MnVBa1NLUW5kZS9LSDFr?=
 =?utf-8?B?VkdLeVZtbDNKZDFzTVlhWWJQcVA2NXRyWUpIK0k3ZkxZeWZtZitvVG02UzIr?=
 =?utf-8?B?djcrWE1GbDFpS04vNjQxMk5pZFpSMDBEa0NMd09VN2ZkbVZQOEU2ZmRxY1RK?=
 =?utf-8?B?YXRDekdSWnFvVG40SHd4QTErTlBvV1JreTN5dXpJSzRSa3BNOTBxZXdpNldu?=
 =?utf-8?B?NnlHZlY1SE5XVVVjcjBIQ3BlNzhFYUlQU3I1b3FqZFVoWFlDNWZKQ005ZWYz?=
 =?utf-8?B?cVAzTStTVmVaa3hyVkxwaU4vQ3lMaG5UYy9BZHpTNmh5NzNaZXl3eW1TZ1Zu?=
 =?utf-8?B?eHVVa3dhOGVzT2thS0dHVGd6dE44ck5JZllmVlYwZkFFREsyTVI3UGVhUjBU?=
 =?utf-8?B?YWMzWC9OWXJWL0ZjcUpBU1lkdktEck91M0ovd1NrM1YzQ21WcnFYZE05cVh4?=
 =?utf-8?B?am9YelJNMkFFUTdrY0NReFlYM050M3prcDNta1dZV09nakpuSjFQNVZLaWov?=
 =?utf-8?B?N1hveklBUXhLSUpWcUtqNGVERk9kYWJ1Q3JuSms0Vlgwam10UHRoVUpiZ2pY?=
 =?utf-8?B?ejUxQ2tLUWZVSDR1SVVHRjgxSnRnODBNelNZY0tmN0tFZFFxOUNib3Y5YlFO?=
 =?utf-8?B?cEJxRVlsN2VrOVZlYnJHWGgvTzYzbFJld08rMm1ZNmxzcUU2VWNLMFcvbUNC?=
 =?utf-8?B?ZWRUZnFjRDRMbHJRTTRpcjZFTFJQL2ErZlN5Qzd4ekhMRG5abEJERE04YUMz?=
 =?utf-8?B?Mzl0OGs4SDhqdUw3WDFQeTlpeHNvakpPT3h5SmxlS0JUMVlaUkg3OVlGQjU2?=
 =?utf-8?Q?j0bPgcNI14E+RZs+E/Uc6XPjQFMWvjCVw32t8oU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f61729a-1056-44da-793e-08d963bd2cdf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 09:30:40.4076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQYflo0rBkloTcINPyOK0++Wc5tj41uGRXxLmuBOwC4LyyIF5spocjWcu7f+HwMvbE1TMPz3orkR9KVDgtuBLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 20.08.2021 11:13, Andrew Cooper wrote:
> On 20/08/2021 07:22, Jan Beulich wrote:
>> Clearly I neglected the special needs here, and also failed to test the
>> change with a debug build of Xen.
>>
>> Fixes: 6b1ca51b1a91 ("x86/PV: assert page state in mark_pv_pt_pages_rdonly()")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -67,7 +67,7 @@ static __init void mark_pv_pt_pages_rdon
>>           */
> 
> ^ this comment needs adjusting too.

I didn't precisely because ...

> Presumably this is because PGT_pae_xen_l2 is logically part of the type?

... I would have viewed it this way. But I'll send v2 in a minute.

Jan


