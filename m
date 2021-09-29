Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372F41C547
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199060.352886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZNQ-000848-7B; Wed, 29 Sep 2021 13:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199060.352886; Wed, 29 Sep 2021 13:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZNQ-00082J-3S; Wed, 29 Sep 2021 13:12:00 +0000
Received: by outflank-mailman (input) for mailman id 199060;
 Wed, 29 Sep 2021 13:11:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVZNO-00082D-8S
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:11:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d23241c0-2126-11ec-bcfe-12813bfff9fa;
 Wed, 29 Sep 2021 13:11:56 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-7RCA3DEfOsiLzOM7fYah2Q-1; Wed, 29 Sep 2021 15:11:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 13:11:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 13:11:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0049.eurprd02.prod.outlook.com (2603:10a6:20b:3a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 13:11:52 +0000
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
X-Inumbo-ID: d23241c0-2126-11ec-bcfe-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632921115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WtmTa1abaYwRr4a1lAGNRAUiwhSXtLQOad3omEWetMo=;
	b=XNXEvTq39iNruoZK3lXwXpfx6B/sOXeL+nhZNu0zoBMVEhel+kb5AMfGmcNQUpU0rtMcCC
	L2hxvjFu/5MIWWiql+Q5/9L/5QjgKLhBzZq4Y2otw/4fXxXt/MlNjLjzh6O62AmvxiCP0S
	ss6XPefHDESO3I0oKUK7UqnnU1crzAM=
X-MC-Unique: 7RCA3DEfOsiLzOM7fYah2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMvw07FLyHLvJr4UIjnunBwuLQ7DsBsJFdyh+YDnCQJhVMgZx8xH43MPujj6O/EyBAr9oEujsat6Rdo/eSRGfqHNPZZTAYVk5EXnIX0uYOvNHctOEpfHgL2k0oOlGRpm4KIlAXpxhW6peReJWNQKjRFMa14LnmCS6LAePw5uFeMtPVC9xn9rba2dHsGTNQQEY11rT0Nu3XKsak6shu5Kf4pPxsCzrT5QfDlUkK7qXzDW7h4aFJQDsvS/q8ISmFLHPuOdUS1ioHtDVspIAIa9d9npEJ2FLWBWqNF/r8YMrBSoAYzAL7Zf7y5+VZ61P96JGX4VsDBYQN7vVTh6XcNn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=WtmTa1abaYwRr4a1lAGNRAUiwhSXtLQOad3omEWetMo=;
 b=nGtE5Hd9JPTYQslYULPTTwa9C5g9Tcz/Wox26+YbjbWgaScgE7s+ZRD3/8g3+YWQlOKF+uUfuTwXMq2rIJdIYLbPGdaU6PADkvArX6w+0Jp37gw5/Me3YcG8WN4l4F3vrWZcuVKI7m9O+74jd0FrTE8pQkLvtj2NyC+Mj1BnWy1lMvBVQqHNQtURfd6qGqIWBo0RQiD0r1avqYG1NeZ8Lk75OL2+3SzmbvcbGxEzSJ75ZQW+zfVeOQKYSE/4k1FRbv3mJah4dS5U7vKN670QRvFO4+jwYaW6Q75/zL61dOfXsXY9A4tnlhIMoCry9VOie45C4mpGm8PrHkB+JX+XRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/6] x86/PVH: Dom0 building adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Date: Wed, 29 Sep 2021 15:11:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0049.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49aae4ac-647c-487f-8834-08d9834ab475
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB435253C16CCCFC48CD31FF41B3A99@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XhEErkFVYiwxfGRNQwGVfxtFykZ1o2h47Ic/i7lqqmMxbb5gGYvv06iVApPKp5zwVeGB2eDcACqaC6wwPKDDIXbIwakTwldHM1nVBEkpEv56n/lCeBFUx+9jbaqHnz02eksZlKTrqGIFH1acSuaHXkNSMKNx64GS542ZZPFf14LZ9n/PIGW+fdfzNmkfV2vjDTpbpDkuFdMK9d0yJ+6dweClxQXfqAej7BVDQOk2jYCxECLKyoyhy+mO6WvZDthwBMHareJQsHlHBexpLppHLWIzS6kPQA99xzDb3NtmtW/bW3BXq9iOGc1Lt7LNhizD13lS6uhCwLoLPu0OO4rKKQCtt97IoH1CLGB4T7t9wkRFPGvqj9z1caY5E+QbP3lGKGtJsGUsICKvX9IvLV4v2ACX8aLYFkZ3iahpqOApLU5RQpjQiVJ/Nax3h22IhyKYfA5gjcCDyyTwgoiE71m+Q2NWEOgw90TDcrYNv2+SyMj+2904gRan58a2A20CExXiF/uFw0z65Q65g9jITDcF/i8ZfiR3J4d/+w4A61Hjr84VjY4+i94lw8mMcGJCfQiv3oe83Yg5jkt89ky9/KNf5VgZfHl+HlPVX8DNKcMHX4+0+MfIWppMQru/5lkZ7an5NS5Z1F+Ljr4FX7H4HLIU04X8ky+3RSG+FFqP2SDlU2Yorb2sOhBzmoTG2rsdoLrDDdsjAoZgoiKe28PAbd+hBM+quFOOTbDUJlzYfNbqrXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(6916009)(5660300002)(38100700002)(54906003)(8676002)(956004)(8936002)(186003)(26005)(31696002)(316002)(86362001)(66946007)(31686004)(4326008)(2906002)(36756003)(16576012)(66476007)(66556008)(508600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEE1WXN2V2FOK1daQm9WM3d1OHo2NU1yYVJDVlFMM3Jxc1NabWlVa1NvNXp6?=
 =?utf-8?B?MnF1Zmd2ckt0clNyV2xHZlgyT2tsUVJlaUpOS2U0V0t4VUZlamJxUXlzRWVG?=
 =?utf-8?B?Y1dacUZGejlReFJvSkhsd2NzcEc4c1ZoNURZK1lnSkc5OTJNNmxRUlZGZWQx?=
 =?utf-8?B?ZHI2TkFwVWFEZjd2QXdVMzBWSlMvSTJkR1ZuUUZ5WGJCV2xNeUw4SmUvK24r?=
 =?utf-8?B?R01GVjlzRDB2UjErRG5yaDlrR29qTGV0NVFPdFdtcE9pcXUwL1RhRzF6bTdj?=
 =?utf-8?B?UFZBdTBIWk44eEZLVElFNnFKQWhWbkE5QkFnSUhpTzVWVjFINzZrUkdUWWlB?=
 =?utf-8?B?ck9IdDhpYnpBUENYaEdDQU1vUVh1TTFSTHk0ZlRSSmg2WE9mTmw4SnU0alNR?=
 =?utf-8?B?Rit2SzRuSVhEKzZ6MVJJSVJWSWM3U3VYeG1yeldqM0N5T0gxam40L2pMQ3J4?=
 =?utf-8?B?RE91N1luUWIrWklQd0lpWjVTaEJTdWJ5d0trSEtiZnZHa2NBWGlPZ2syL2Vh?=
 =?utf-8?B?MlVwckZNckhINEIwT3M1NFpxSzIxVUc2WkNET2tqZGZ0RlNkR0tLTnZBek9h?=
 =?utf-8?B?Y0lpcWtIeVVralhqVmtTc1YwbjcvTit4eFZPLzJpNzBvdmJpNW82ZDFSeWZS?=
 =?utf-8?B?VVlhUGE3UEZDSWtERnNvaEdSVm5VRGtzV29yQXBLaGhmamJxWVROUDVwUis0?=
 =?utf-8?B?VWI1eVh6b1JJNFFjaExnYTc3NTdya3BuZWpzSEZhSzZKKy9RYmpRUE12b3Fk?=
 =?utf-8?B?V2I2akdBWXIrTjRrY1ZOWi8vMm1NQ3hiWDQ4SUxvQ002MGZCRkR3U2k0c0h0?=
 =?utf-8?B?OFFvc0NWWHV0OS9NakNOSzduRkM2RFpmVjBxUG9Jc3pJQ3B3OXd1WjlWVTg4?=
 =?utf-8?B?Q1o5bDl1T0ZkdlFDOVZ6aWZMOHVrc2RQb1BhTHlNbmR5cXBrdkoya2g1bjZ6?=
 =?utf-8?B?UytueU8vL3ZkazJZcDk0QlE5ZlNtZGtERC8wY254ZndjbzlnNmdSaWtJa21o?=
 =?utf-8?B?RDNRWFg0aHFXVTB5OHFFWFFrd3RnRU03Z0tna0xZcHE0bmExS3BCY1hISzFu?=
 =?utf-8?B?Ri8vQWNjd0dDdGlnamd2bVg2QjZEc3RnTDFuWEs2cDFzaUNQaWY3Y1UwelJB?=
 =?utf-8?B?ckdzakJ4ZEY2bjF1clNMaGhjV1lWdTFna2NCa2k3Rko3TWtUUDNaU2NzbjMy?=
 =?utf-8?B?azRmRWw1ckFRLzZLUEw4MGNHVHlNZXdJQW9mMnRUSVFuQXdvTDducjFjeWdq?=
 =?utf-8?B?STZOVVVEUXJRNDV5M0pwUU9PSU9WS1BvTkV4bDQ5MSswK21FbnlyU3BIazV1?=
 =?utf-8?B?WkttYU5pZVZMNGgycmJnb1RRcHFMbURWOWYySGhBWkJldEZQNFFwY2RWVlVr?=
 =?utf-8?B?bnFRKzRCN294Vll3cVNnT3RGajhGV2xJTHA4UFdweHFKN1VUZXZIZ2grc3pO?=
 =?utf-8?B?NHlQZTJXT0sxWDZJTGx3aTR0eUdVTXN6eEpDVmpqZFNjSXVEQlhYMXhKZG5n?=
 =?utf-8?B?V09IaHhidXRIMnBoRVY2S3Q3Qy9rRjZzRzU1cjB5Y1B2T0xUaWU5MmQ3bVlN?=
 =?utf-8?B?OWs3NUYreTVkOUJNbWl3dGd0VUNBWmh1UDZtZWZMakNJVTFSdGFkVGVxNU53?=
 =?utf-8?B?R1A3d1JZQTJYd0xBWjkzOTErQnNmY1FiSHRJSFg3aHVKSHZzbThXaTZoblR2?=
 =?utf-8?B?NGxOU1RKRTFRdko5K3YyakhaVnNiemhXb3MvQ2NuKzVUbVJxV1g4Vk5YTnJn?=
 =?utf-8?Q?lHbsyGwx7OV+PJeKlv9XGrRBmbJwNBePhjbaGMW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49aae4ac-647c-487f-8834-08d9834ab475
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:11:52.8815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIux4VuSnYpMfxro35gXxbaCs3s2b2/sormgCp5huhlo/Xi5jO0LUBGRL4tXFYVUQPyQSPA0MwF2SOHVnGBkrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

In the course of fixing XSA-378 fallout I ran into a number of
issues, the remaining parts of which this series is trying to deal
with. The majority of the changes is pretty much independent of
one another.

There was another rather basic issue to fight first (patch
was submitted separately as RFC): vPCI wasn't aware of hidden PCI
devices, hitting an ASSERT(). Obviously I couldn't afford not
having a functioning serial console.

Compared to v3 there is one new patch here, and the video mode
propagation one has been dropped for effectively having got
rejected. I realize that discussion on what exactly to include in
patch 3 has not settled yet; that patch is deliberately unchanged.
See individual patches for details.

1: PVH: improve Dom0 memory size calculation
2: PV: properly set shadow allocation for Dom0
3: PVH: permit more physdevop-s to be used by Dom0
4: HVM: also dump stacks from show_execution_state()
5: HVM: skip offline vCPU-s when dumping VMCBs/VMCSes
6: P2M: relax permissions of PVH Dom0's MMIO entries

Jan


