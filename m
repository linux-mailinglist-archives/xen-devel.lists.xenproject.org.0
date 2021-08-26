Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F17B3F8A27
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 16:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173131.315879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJGRl-0000he-Hn; Thu, 26 Aug 2021 14:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173131.315879; Thu, 26 Aug 2021 14:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJGRl-0000ft-EW; Thu, 26 Aug 2021 14:33:37 +0000
Received: by outflank-mailman (input) for mailman id 173131;
 Thu, 26 Aug 2021 14:33:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJGRk-0000fn-78
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 14:33:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96fa7e87-067a-11ec-aa16-12813bfff9fa;
 Thu, 26 Aug 2021 14:33:35 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-7mh0eztUP1mQRIUqjcf4EQ-1;
 Thu, 26 Aug 2021 16:33:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 14:33:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 14:33:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 26 Aug 2021 14:33:31 +0000
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
X-Inumbo-ID: 96fa7e87-067a-11ec-aa16-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629988414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FKomc0gOOeog6f4TbOaHv8w1grUrr7hsGPuPJt0oTz8=;
	b=AjzH7KwB49i41HYPaCVxLzdOFbm5BePqQhkG+he8gOskucy0zNzbFu984nJAxvTt8UcjQ1
	9praFyETXQmcqWEDr74So6aOKR3bfLjbU98tru4rEFVzeW6Ss3NVhDOUJEGSzOOLHmEgTr
	DqIShNBX2wfFxuw6s9G+2mRoqc6qDgY=
X-MC-Unique: 7mh0eztUP1mQRIUqjcf4EQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8tJBMNaKkAV0lwlrpT8GaStOMJagWHhDKprmmyw1WendinXY+mDiJDrS6QkC3WPhrdfbKVj12Nmz/oEvAvJoayKhImLm65BnbvLTcu3aIoJlYqMJGRdqS3H0D5E4akqNN2IE74nuXFVgxp/xvc3jkGsTJlfgO1jeVLdssORw/LNveourml6L6giitWhZrcVD5e1ek3bbshMxOeAhupetStCdgxgsOuRtAnpCL9iWh/E01aWbKnt1mBBlKapgrBbJgN2M1cRj6uGKoFhg5aY4a+LD8QLzNHp7GcxBhefWA1SN7Ga542GPFnSuAuLPV0bS8JIN9hlYB7ilUKtsZQyNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKomc0gOOeog6f4TbOaHv8w1grUrr7hsGPuPJt0oTz8=;
 b=fEU2kXZw5dTsmid8a4M4kONb8oSEDfKIjW5r6enghSKnoNYVVesIWLmuRmBKp+ryeWd8D8D4yRG3t89JZW6UE+Bq8hQA08h1Sh2E0WauzEwmEZiosNfc7nscZQtredxHTtgLArSVbuzD6axYPRYK4Gu5Gh8f4aB/8hJCCZz9uJI8dyYVzKsPhacpPBGw6DVUrxgD58JxIaz/GHAzyWV2I7lObdi82X0BZpmi8WpS1WdU3CogsEl69Zgjnu++8uMaQms14WKePpiVyuUVBhdmIzl3WzZcxB+iZOrZIDl4CeYw927cxK0g3wEqS8tevHys1aLlyCSl3CLGSARw6IC3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v7 8/8] AMD/IOMMU: respect AtsDisabled device flag
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <6807e3ab-375c-884c-db01-0c25f76b8f02@suse.com>
 <ef28ee1d-2d29-2e05-634e-89e882426661@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <168e7c6e-fa95-a2dd-08bd-e4c64c03afbb@suse.com>
Date: Thu, 26 Aug 2021 16:33:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ef28ee1d-2d29-2e05-634e-89e882426661@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b709326-9fca-4390-6a49-08d9689e7a8b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4351A52B9F2F84428404F302B3C79@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tee9F5E0tOmQSlj0b7YG9eHSvX8fUZSfEwPUGZkf+gY/PbxSbYTTfw6uCmTwZwVSBaGqMbjeCQFSZnP/vysnUinaQnx1JpSuy1gXOeo/YDOxkAAOFC9saLgqoIL7HZlhbkEvT04c42qrw4xbPaIrNoL0mwu2DnUQNMe2KnxrMBmIS0bV7j7BZJqeVlgz59UOo+OUDR9sQIDRNHCe4U+WoVPf2zouCFCUVljbpbpdBDCe/3fHAuFBhmNcrFz3T9CeX+5pWVnVH1vPjvEDGqXlDtpS74GppkQ/ej2tIe1JsWaSA6v14n9CYPnLWObUw77oBoeg0jtCHoHXxZXIAKWx2BHE7T3IiPjc0DoZOMiZ66gF8KC5umPSnUIM4XH80peg3P19DA6Vhu16IOf0ydEWyHNMBezLkSG2KAN+e7OTC0iOJ+kSCBqsvmXiZNeB/JbpbzSKCotrj7TndPOTcsfEqhvkaQz380wSui0+mFvqm/1WUZSrzWV3DVNMBjvQpk30ZDdkDqFuG7Y43gsJjJ+FrxViHT7lSTbVLFvsMSOuy+y42hTNZxHNfM3BF8EQaIDVCWH/FsT2JJAGoBTL1IoQ44KHWvP9EDyIsMfYXfzR+ezfSmiJ8Sa+KqK1WsjhMQnzrAVf04SrJncMy0U1tlF9z0pwHlmpX8RfBVmyANkPRNBERg+d/CrybgSkORRYIIXaVD35Q1UL5tczw2W05im5njNZTnftKZKMPaNXfy/N0q0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(83380400001)(508600001)(5660300002)(31686004)(36756003)(6486002)(38100700002)(66946007)(6916009)(16576012)(4744005)(316002)(2616005)(956004)(53546011)(8676002)(66556008)(66476007)(4326008)(2906002)(26005)(54906003)(186003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2lObW5FR0tMVzVVU1NsZU5zZXJ1M2cxellXeWF2N2ZDRC9TY0pLcExwMmtj?=
 =?utf-8?B?VkFNcGg2eUExMjB6TmNnbWU3OTFxREZFa1JHTjIvZTJYZDRmaWdOdjYwZmg0?=
 =?utf-8?B?WXJ3Sm1oUUNhYTZBekdNOGpISFFSb091OW9PUW1mK2w0WmlaNktEZzhKUE5H?=
 =?utf-8?B?T1ZyYTNhWDgzMUI4TXcvRUdiU28xbTArOXFLT0lzYTZOaGtMUVlyc3k4MGNp?=
 =?utf-8?B?Sjg4TFJaaGJoU3p0Ykhka2d1bitNdSt5aEFIdnVWaUdsSXJlSUtMNy9nNUVC?=
 =?utf-8?B?djlMbkxyWGdCTENUcmNFMmQzZy81bTFNQ2pHWUREbFcxb2dVa2E4NVhqQXRE?=
 =?utf-8?B?VmZqeGxURWxIVkVIQ0gxN0xOVzRiNmdrQjhPQkI4NmFlZ3BueXNMdWVVTGR1?=
 =?utf-8?B?UHlHSEdqa3JuM0xOZUs4ak5MOWx3OWNHbTZSMitJNzc5Q0xDOHU5eVBQRGc4?=
 =?utf-8?B?V2ZIalB1MWh2S1dYTlUxdHlTT0JtTDNLSmplUmdSK0NLYTl5QU53Y0x4SFBi?=
 =?utf-8?B?UFE3Zi9uWUtGNmcrZUdWdVA1SzdJeHBBUlNqa3kyZUNuWUdyOUtxT085Z3lR?=
 =?utf-8?B?cVpENVVBZFdyTHU0QmppZjJ2QkttTTJjd0NKUGYyTHBYWXVxSERFLzhOSytx?=
 =?utf-8?B?Ryt0MWlwODJlQ3VCS2h1aXU5b1RKY2Y5YTJQRnYyT2ZlQjZSclYydXpUU2cw?=
 =?utf-8?B?RHZURCsxaXFBK2J6VkFVWFBDYkpBQzV2c2diU3RUMi8vOHQ2UU5zaEl3ZTdz?=
 =?utf-8?B?eDJCTU9mUDVteHRaK3dJdm4rQndNTXVnTmtLU1pRWlJPbVJLcTZ5VnhPNUN5?=
 =?utf-8?B?MVJyVGVrMDBlZHp0UHZhQmlrYU8xNWhxUVlwNHQ3V2RmNk9ISklwdzlVOFJl?=
 =?utf-8?B?cWluQUhMcXBwZGNxZ0MvblZURHR2NHZKMEs4TUs4eFZDNVd2RnhsQ05WWWNv?=
 =?utf-8?B?NjRPR2pOQWlOTjYwMmdXNVVGcnE5cjhhU2dMTlhiZDV0VHJzdmx4S29mNzRx?=
 =?utf-8?B?U2FOeklWMFM4SmdwVnd3aU9ZVG1LSStaZ2svU2o2Q2Q4Y21EaURGVktRWEdj?=
 =?utf-8?B?MzNsSGZhdnpyWWdEM2xJUi9vTFE2K25HT2ZZRTRTTjZ2ZXBsUE9rSEZ1c01X?=
 =?utf-8?B?WTlvWDBseVZ2SHhwMHUrR1ROdEN6dUVnaFdPYk0vNnBNcFQ4K3IyTUxFSUdX?=
 =?utf-8?B?R1hGVXZEY3VpSGY1N1gzck5WdTJ2Ni9LbXdYaW5aNlk1Q3I5SHpGYk1wZlox?=
 =?utf-8?B?REIvUWxiZzZJejN4MXJmWGY5NFRKNmt2N1o0azJFdk80cDlWY0pyL3YrK1VU?=
 =?utf-8?B?c0dFK3kycnlpVmdTU0IvS3JxSXdwV0dMdGpQb05ySjVxQ0tsdHpyM1JDOW5I?=
 =?utf-8?B?K1FnZVJhSWhGNndSS3VaUDRnOXdnUVdNYUx1anFsMkIzSVFCaWMyUktNZnp3?=
 =?utf-8?B?Q1RLMjhrR2w1bFAvUnZKc2R5dmdDbjdNWFYveFRJTEF6MDg0S3NOeDU0Uk4v?=
 =?utf-8?B?Y3paNzJrb3E2djU3QThjMEtXVU0zdlN2QmtKTWltdThKSlF3aWlIakpPN1U2?=
 =?utf-8?B?MTBtdnhYWlFrOHhJVytSb0NCUUpibWpqYmRDRm5PemgxWVRQMjJjOHA1VGdV?=
 =?utf-8?B?TlMzWE5yNGREWFRKdHhKNk1DK3J0UFBvZ3RnVVMyZ3BXaEtSZnpGZUdLNkNx?=
 =?utf-8?B?QmRKSXRCZHU3VDdXYXk4QWlmOWo3QUltdTVnK0N1dnMvSDFIWFVja0V2enJP?=
 =?utf-8?Q?IjzY6IcwFhM+EI8Q5+E2+A4oSWfYwbUEC6qSx4F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b709326-9fca-4390-6a49-08d9689e7a8b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 14:33:32.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwlgzByZtNSahBkbuFbjboiav2dqOvdRwLUh2NbsWZui2139YoQgqSCmf7sYLwgAdqF0Q8wA9tH9kkvR3OfOMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 26.08.2021 16:27, Andrew Cooper wrote:
> On 26/08/2021 08:26, Jan Beulich wrote:
>> TBD: I find the ordering in amd_iommu_disable_domain_device()
>>      suspicious: amd_iommu_enable_domain_device() sets up the DTE first
>>      and then enables ATS on the device. It would seem to me that
>>      disabling would better be done the other way around (disable ATS on
>>      device, then adjust DTE).
> 
> I'd hope that the worst which goes wrong, given the problematic order,
> is a master abort.
> 
> But yes - ATS wants disabling on the device first, before the DTE is
> updated.

Okay, I'll add another patch.

Jan


