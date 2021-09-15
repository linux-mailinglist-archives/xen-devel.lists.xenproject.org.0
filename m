Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7340C282
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 11:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187362.336193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQwp-0007Mg-IH; Wed, 15 Sep 2021 09:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187362.336193; Wed, 15 Sep 2021 09:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQwp-0007Kt-F0; Wed, 15 Sep 2021 09:11:19 +0000
Received: by outflank-mailman (input) for mailman id 187362;
 Wed, 15 Sep 2021 09:11:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQQwo-0007Ki-Jf
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 09:11:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f00e41d-fca5-4e3d-a136-9f313cba18be;
 Wed, 15 Sep 2021 09:11:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-SsfKgIQ6M0q1Vlnzgn8GlQ-1; Wed, 15 Sep 2021 11:11:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 09:11:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 09:11:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0112.eurprd02.prod.outlook.com (2603:10a6:20b:28c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 09:11:14 +0000
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
X-Inumbo-ID: 9f00e41d-fca5-4e3d-a136-9f313cba18be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631697076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=itTu3oZc5MzNRF0hPw+x0ZHFualAlO0fWetEbSE/YRM=;
	b=fMfiRHa3C+H+Ts7MAvs3p2s02JtHlchllv+czA/TMfMh5AAvX61qKeuRp7B0zBjRJDm3dK
	0JLnn+w3jSCI+ZjchKCKTH2l5fF4rAooR4uUnpI9U+WUREjwWPiTvzlu8MmbmYEwLeN3en
	miSG2X9Nmbyh+x0D+Jt18G1DgWNnpb4=
X-MC-Unique: SsfKgIQ6M0q1Vlnzgn8GlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUc0YNJeZy1VJNO/GICQqgMVsntCw60nlJAF5r41cbCbj9aTmpGeBh8mt491AlTeYhm0dIPt+oME0BLIgPCVAC2WmayTQgH9spLY85i5/0QdutOimLqQoKNQJ2qjkEALVaFblrnFzq4k7+ZndGNdoSw14Xhqg4P967vpaMy5NFLd+CC6cLJ60SWfjv65ZSxC8FGbnLoXK3JR2/2FBmv1C+96p25jQRAyv644k0YvuWbhvjT+Jw2Q/RHhhP3eUNlqR7g3mZjjfcfg7elRZ09ACeMOZuJx4X99FSVT4Nzoqq9uAmljiBcanW36Hrp5mBmVr7nAyR9a7c+l0gN8RhrxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=itTu3oZc5MzNRF0hPw+x0ZHFualAlO0fWetEbSE/YRM=;
 b=S30ghGvivsQP+PT8AZ8BqF62/hZM3ab6K3JB7GA91DVfbYKJ5B/5Bni/nIlAhbpctz+ATeOx9PCKKRlXCAW0I/uYurHbBZwZV5Vcly2PiLCnl2dAFG+btuBUq0dQAoJtycvkvKQ1BKPkzprbDBIJuPSt29trtmm7vcf1+9SlOQ1ALLPsqp8g9mIRErRT1s8Ez6XcFh6oQ0updPxArr0M4LFlgnSai6LttYy364SutWQanFwojebtD5dd8dWYnByynZVYtkM02tiVZUJKLIbZwj2CcEpqDCTXQKWavwLnCizQPFT8VZWhxgjgcsw+M4uRLEgCauHlb0R4mo5yM1XMlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] IOMMU/PCI: respect device specifics
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
Date: Wed, 15 Sep 2021 11:11:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0112.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32e84125-85bd-4f90-4d1c-08d97828c4f4
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6862D08096D78431C82656DAB3DB9@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hw9ItL3XIFX+3/13ifd5/MzUgdvgtumoT5oznJLF8fHF8Y3+561/Z+ZG9vnzJ/NHT2gIUL7SvJTc5kaMcu1wZmVhB6rTz25QFj5zWP4LQHJKpjl9RkQ7MTjy+FZa/SMS1N2T2f4r9yuWn+meZSKrurA4GJLBE64YWEQbxMi0T7hKTvwvQBGXK6oZhvshVsVm2BS75vpKv3gTrhPD67hFok/dI/0XkiOHI3RsQ441fPYAxxCd8Xfo5FIjXsK7xZEDc25SBPKw/MHcNMUA6UoBD6pc1c7YvpFa8PI/C9fM6ktnqdiGaK65ZF++a57JsvUvlCkyYncDLb8jFsNdlemfcI9QmLylvOzdPFWDF87N/C+YY8/hFpyueG8KX3yvT9QHHFJXpwIDof+t71+gg4OFYxPRh81V/puANFIs0YNnS4tGcj/smGiaYGIz9JqAlTmRJBvvIfMFM5eIT0/2h+QNg7OtdEA/TKschp1ad4lWjEhdF24OuY16g7wY/1boIVcIHB3gI/gkqB7j4shX8THmXNTD+/AS+LeeOi3kXxhahoXpYx710xoNzTsjo+Cg6VJW3bcBVngtBuLCNYftolWbwBc3vc12bZH6szccmNfu17121J15JioPAeDKHv+bZWKzU170iSjWUCmQy6asoiRUG4KiUZTSWb/ySqHOxEre/Tg/twNv705HrLMFJIBB7vga/8df4fu4OnB28xI9VRIxnyc6K7DFa3rmpSYtQ6bmQIXhDTiiGIctFK9/3RnJdXvV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(36756003)(956004)(2616005)(86362001)(83380400001)(8936002)(31696002)(2906002)(31686004)(4744005)(66946007)(66476007)(4326008)(66556008)(26005)(5660300002)(186003)(8676002)(478600001)(6486002)(38100700002)(54906003)(16576012)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUhVY0ZVc2ovdk5sUGo0eHJHcCtTaEVKQVJ0dEdLazNCN1R2eWw3Z0hRRWxZ?=
 =?utf-8?B?U3U5c2NsTUZXclZaRzBCQ3RSRFA5VnpWWlkvaWcrRHdqWURCdlpXd1p4bTBq?=
 =?utf-8?B?eUdkcDF3N1o0U2FRSGJRd2hxRkMxUEVPc2ZCZktWaFJUQktSQ1hRVWwyaG8z?=
 =?utf-8?B?TG5XZFUyTkduL3pCbHhOM3lzTllPTm41cVo3Wk01RzA4U212VUtaZUlNbXNL?=
 =?utf-8?B?SFo5eGIzUDE3SXR0RDN0LzFaMG9kQ25ES0tVT1pnNGhvVExwM1lsZENOM0pR?=
 =?utf-8?B?alVLMVVVc04wRmJBendRZHJOVGRhWWVzNE42R1A3cmRQeXRHQXVvTG01OFd2?=
 =?utf-8?B?VkVlU3N5bGpaclZmZ2t1d3d3Mit5UlNuQ0wzSkR3bmRFMk84ZiswK0ZBOTh2?=
 =?utf-8?B?MnU2NmNtU25wOG92cUV4Mzd6eEpmZ1dhclh0ZVZFeHAzbzJBYUZ2TFdwVDRh?=
 =?utf-8?B?YXZ1NVo2ckhFSlc5OFFqSGE0WlkvOXpxek5YR3kzOE5ISHRtam5vOFF2Nm8r?=
 =?utf-8?B?bHBmaGlzU2JxaGZGMHJsd25CY2dsaThZSCtYTUVLdUtpckxMZVF3eDRhK2lO?=
 =?utf-8?B?UzRaemVkUFNOSC8rUHRmaWsvQjdiNXBZL2pIWlp5UHJMT3RHWWNHaDJqVHpY?=
 =?utf-8?B?dmM3dVZYUk5tdUVzZkwyaUtOUnZMMloraVY2TmlWVnp4T3c3T0RHRE83SE1V?=
 =?utf-8?B?SXhpVTVUelNZZ29LRklvKzIvNC9Ya3c5aE9nUkhZODQrbWlETENMM2tiZDU2?=
 =?utf-8?B?c1UySUJQSENiRk5NSVpJa0hpTkNvQ0Vwai9hZllGOWJReHMxWDJQZjR1SWli?=
 =?utf-8?B?SzlvN1lCK3FOQm4xSTR5VGRpVklEd2RORGFxQ3VYZXpMU1ZjbGRCbmUrOU85?=
 =?utf-8?B?WHR0dzQrUUNsb29KT3hHZmRvdHZ2TTJoQ0xoWHp0OEtpN1ptU0luakRzbVNK?=
 =?utf-8?B?ZnBQQUdjSVhwV0NFTWNWTHV5Zi8rUlJVKzJHNTduSmZOaUtGQ3NyRlhtREIx?=
 =?utf-8?B?Y1ZvLzBkUkhaRUNoelJ2TXJYYkxPVkNNNU1qZDZuUjdWdXZxRm4zNTNjZW9a?=
 =?utf-8?B?eHpYNDF3Y2JtWjdFL2I4ejhLelNQd0Q0dlJucGF3bWtKUUxDWHpTaEVMZXdS?=
 =?utf-8?B?YVAvbVk0UHFtYWlYN1NJKzJMVGFHSDE3ai93bGkyNGhlZTJCV0tEY0hxeFFS?=
 =?utf-8?B?d1FtR3ErYktGblJmU0xrVlVicGlGZkVheGgxZUFrMVQvbS9EV0ZjWnl5M0Jh?=
 =?utf-8?B?d1N2ZHNpeVZiaWlWMjJKblUweTVsYW1DUzRucHJjdUhKVkdUYmZ4eFltSHFO?=
 =?utf-8?B?MTd6ZklDQVJzQ2dITEVmWmhIUFNLckNmV0YxZXdSVnVjUXhSSjRrcStJSzJy?=
 =?utf-8?B?QzZIM2FkTld5K0xPS3NLMENJcmNrTmI0QVd1Y2t1MjVGNi9Wc1RtRm10NzZG?=
 =?utf-8?B?M09qYWN0QzBWbzBEUDhudzlpTm93V05qMGozSlRIRkhqVE1kWTVQUkRGZjdV?=
 =?utf-8?B?NnBmbXhscHQ4ck9pTkFya244ZHZoTjNBbWZLbk4zQ1JIbFdySGtzRGV5YjZJ?=
 =?utf-8?B?S3hvWEVqVmlWQnNJUWtSZjRKKys3ZTByVUp0SEhzc1p0WTJ4RWRac0pGRkJ0?=
 =?utf-8?B?eExSdDZlb2hDZzhvajZKUnl4TXBmbE9VdkkzT0dOemZDSVllRmJvUlhKc2Ji?=
 =?utf-8?B?Um5KZk9SUWNEKytXeDFNT21FKzZEbDAvOFIyODJlRnBHRHdHWU5yREdXc0l1?=
 =?utf-8?Q?8vCgsv65zcE4KmMWBsFCt0dp7dtSSjEjeAU/MHA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e84125-85bd-4f90-4d1c-08d97828c4f4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 09:11:14.9264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jitjNEf0jHX26jCAGbr3medho67ZEnfq9Nf0MPt/qxkTG+uIqrzBRXd2WnwBJZpUrg542JDUtns7Z26F+3iFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

While making the first change here it occurred to me that the recent
vPCI-related discussion about hidden devices has some relevance also
elsewhere. In the course I then came to also notice a phantom device
related quirk.

1: VT-d: defer "no DRHD" check when (un)mapping devices
2: VT-d: consider hidden devices when unmapping
3: VT-d: skip IOMMU bitmap cleanup for phantom devices
4: AMD/IOMMU: consider hidden devices when flushing device I/O TLBs

Jan

(I'm sorry for the resend, but I thought I would better add the
previously missing tag.)


