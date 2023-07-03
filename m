Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1277454B7
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 07:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557996.871748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGBs4-0001lR-Fa; Mon, 03 Jul 2023 05:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557996.871748; Mon, 03 Jul 2023 05:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGBs4-0001im-Cw; Mon, 03 Jul 2023 05:13:08 +0000
Received: by outflank-mailman (input) for mailman id 557996;
 Mon, 03 Jul 2023 05:13:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hCK=CV=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGBs2-0001id-NF
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 05:13:06 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49340db7-1960-11ee-b237-6b7b168915f2;
 Mon, 03 Jul 2023 07:13:03 +0200 (CEST)
Received: from AS9PR06CA0775.eurprd06.prod.outlook.com (2603:10a6:20b:484::30)
 by PA4PR08MB6111.eurprd08.prod.outlook.com (2603:10a6:102:e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 05:12:55 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::c7) by AS9PR06CA0775.outlook.office365.com
 (2603:10a6:20b:484::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.26 via Frontend
 Transport; Mon, 3 Jul 2023 05:12:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.17 via Frontend Transport; Mon, 3 Jul 2023 05:12:55 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Mon, 03 Jul 2023 05:12:54 +0000
Received: from 0ee6d2e92890.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D577E4A-520E-4358-9E83-EDA5E301BCBF.1; 
 Mon, 03 Jul 2023 05:12:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ee6d2e92890.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 03 Jul 2023 05:12:48 +0000
Received: from AM0PR02CA0168.eurprd02.prod.outlook.com (2603:10a6:20b:28d::35)
 by PA4PR08MB7409.eurprd08.prod.outlook.com (2603:10a6:102:2a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 05:12:44 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:28d:cafe::dc) by AM0PR02CA0168.outlook.office365.com
 (2603:10a6:20b:28d::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Mon, 3 Jul 2023 05:12:44 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.17 via Frontend Transport; Mon, 3 Jul 2023 05:12:43 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 3 Jul
 2023 05:12:43 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Mon, 3 Jul 2023 05:12:41 +0000
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
X-Inumbo-ID: 49340db7-1960-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axvEImVGxii6NhLjRL7WGbueaxr5sezn9TuDmMDurvc=;
 b=v0TnHkEOSXYPI0iGw1EZFq43Lk1gWtF6Bb86WreZErSx6AFd5udKFeaDcndf3jVHwEmlS0vATsR2k2jR7Yyzz5Gpy1rizAb0SBcPMesHvR69wMQhT1VSdRvqhLaCWFBfxRwJGQPOOkeLJi7dj7r68Gf4jvGNpzo9yLk5R8uk+EQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 27f3d11d83933588
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZM7sA2nkkPkd+ajtJxfezYOMnUWnT5c1QLd112bSzR7/iTx1xTYcEiywZ+kvSe0B8QyhMdrWNT90tkQcSbErcq7wuOV2mcycSjGZYKDrDBRcheAuYq1ZqEVcvYclnlJQFyY0Sekdux15sH98srguy85DTdXvWml8Cq0WHmnJEzOwEGP9ye1KgaByVifqYeCg2roGR2xcOpVw5Cx5yWTEVjXsL7YY0DgVbYZ6gne86mc4h2iHZtpwq++JO1YKAW3qIPe+Y60UvTjsM+TjdO0VHE61eyCTTZkvK9wZWpROTbiSlXjL4dzhzFYoPimUeyWOhxxugsklnpznnvkFvhaN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axvEImVGxii6NhLjRL7WGbueaxr5sezn9TuDmMDurvc=;
 b=kk7J9q0E1I2wM/NxlbiGZbAHYfciw9mrb/hZGvgaWaLkyNTQP1iG8lNGghnGqpMqwCKyEWo4WrJo/Xx9P3i2rmqk9ozdmfoQG3/vX01WZa83kkXSeLVcQVEBZA63PSXqAQcEBJJLPFrGfbg7n/zAlf7E6e2Rw8v4i+C6ihdrdkfFXuu6+F2BkLI62RterA4/zEKiG7CtXdwPAVMNcPmpqP+8yOVMw3G6+3ubhGcLgC9ixmV55K6lKdmifglNe1pAR5zqqfZPHX1L3EmUh9RBmiCemE2d307wPQsYtct3RawZOlqn35hbohKPAhRObbAQT9WwQWerpdEQv0aJ2QJOVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axvEImVGxii6NhLjRL7WGbueaxr5sezn9TuDmMDurvc=;
 b=v0TnHkEOSXYPI0iGw1EZFq43Lk1gWtF6Bb86WreZErSx6AFd5udKFeaDcndf3jVHwEmlS0vATsR2k2jR7Yyzz5Gpy1rizAb0SBcPMesHvR69wMQhT1VSdRvqhLaCWFBfxRwJGQPOOkeLJi7dj7r68Gf4jvGNpzo9yLk5R8uk+EQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <bd6d9646-f0a8-5341-b4ce-7eca1d6153dc@arm.com>
Date: Mon, 3 Jul 2023 13:12:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 31/52] xen/mpu: make early_fdt_map support in MPU
 systems
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-32-Penny.Zheng@arm.com>
 <c2a779e5-51a9-f0c8-4c00-a568ff4bde83@amd.com>
 <a381b1b0-d18a-8fea-56a4-d88c65bd3cea@arm.com>
 <9530f9f8-795b-783a-bc74-e30a3c5c2fd3@amd.com>
 <baed1eac-0f9a-a85a-d4cc-feef772870db@xen.org>
 <c070054d-3f92-ecd2-4f04-a97c5a84d3d7@amd.com>
 <c05ac82d-f9bb-5d52-8b7d-df44d9043a66@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <c05ac82d-f9bb-5d52-8b7d-df44d9043a66@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT039:EE_|PA4PR08MB7409:EE_|AM7EUR03FT022:EE_|PA4PR08MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 95618774-3ce8-4307-f8af-08db7b8428ae
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1JuUhXCYSyrJK0QL2s+J/rFLJabzub8bJyZLv6Bu0+ooAfuZa0Cxy6Pp40dPwn08/6IE6HP1QAXFNceNfSjmVKo+Zb/qVBtW9SLrwf6RFF2RbWQSG34wRygQ432L8a60nvJ2nG6YTxLYA81buXUGSs4U8DDaC//nsDUgbibiryf/EMJQ+J4Y1EbrCxloBfjCkVRSLo8wXV28Fkmq4uZUO3xtgEN/j/r1PLO9SPBYcSjz06TeoWAHzKqU6mnQb2zMp8xW22G8Xgyfi4WM4AR3exzm3aNqk/WNqaBJREHsbsJEMhReaesVD28wPttEaSRXkkZoouw6jm8DOd2lGpIIHPq/mPDkQlWP8tU77gWAvwdWq6auEvfXEz6oC4JzF/RX2mcoKllt6pl+dsnxAe7CY/vEa6QZ0XCc2G/XhJ/io1KCw4jYS70nXogF0O/xeR1dY8GOTwzZZU8yVoxsxDt1hYktW3G0tZzBs3U9SGaQZxF/gMsYRwTBaW74OCwnyGABFFIV9guRWqd4GvB/RvpTumtA404MRmyAbnA8NQmsJKKpGXo3Zx+rCqz9Vh/cqx24hss/12q0CMLnPCCN8zL7HWuUyOI8eAO/qN9Nqu50vmdt/aEIVi7cBsLkZEP4Ho/8srJ4CeC6UtVS6B1iBO26PbnbQELStoHvaFow7Tkb04OVcANgSDNEBMTRl2IIlko9ZN9RqgS5a4RhfbLGvgSASTOef/O5/B6dgaMxY0Pa3wGeVv6hgq8nkt6PfmlPpPByzA2TESJejeuux7NlnWSJrdwVpdcgnkV2v6qz9/Yx/9D7M4c/xpje+47e2/3EBAwoeOFDfCFMbs1VXMedQ2WlQ2VuZrgzV8JmHg0G1khTnAA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(26005)(31686004)(478600001)(82740400003)(86362001)(31696002)(2616005)(186003)(36860700001)(81166007)(16576012)(54906003)(70586007)(4326008)(83380400001)(356005)(336012)(110136005)(426003)(53546011)(70206006)(316002)(47076005)(5660300002)(8676002)(8936002)(44832011)(40460700003)(41300700001)(2906002)(40480700001)(82310400005)(36756003)(21314003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7409
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c6671a5a-144d-43a8-5b8a-08db7b84220e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hmVKibyuUERV3nzI8/mNG6ZDI5Cdt+rCgTV+QBrkmOQ81CVm2N85Y2ZRDnJ8zgm1cOA1KsMI/wNxpsRlcEGABSqjLO55PauO/dqQNnlgGawBf+Gtoi96mJ+wwTHm5YwnKo1Gd3Dw6/zAIosSOPFQqpU9Z/RNYvHl4S25vGuaD01XY66a5FCM8PVxqWsmqKDPtGkeU3Tn0auYuylvrKKu1hoh003Q5bKPMRmj29uu8Xbbn0GwsWjOEYVwEqoVVWmbQwncWsjiFCluwUrqtCQBcwIhn0ou0CmLoaR4PxINktJY2TowI+cSohrPooS4dUJRFpyriYJB1a/fW9TlYXAxYBlRopCuun3UDoxdpxdZe0ArCeN8s7fja63zgS3jyctiq1wtC7DMROpS3T2V5kiK/7vR3t1NfkkFMC/o+9/L5dok9tk1yTG+hhKzXwFBOB/f9Gm6dv9JCPGyuDhP7lnSeQau+Wzy04BFGK2dNO8T+AfSFMN8/5yqi6QySmfg4oa9aNPZHFdu6yYAAHtgwBQ+6P2LO1adPqNk89/Sj5OPMNNgfoG3/BTcMwuXJljOpcE2bOrLuqQya29BermPTD3+Kmd9kwJxxjP747LeS41PdxuddQxOyWmZC0ezMTzq/gxj4Ldre54hrS8PytF/AqswEgQJVPeFYCbGwSw8WbJimPPjw18Mnuk3tIAUw9Bg3sOHUMxxAlWRTow2tyahP/tw7+ivqtrBNlYdUa0odZTX/gmqCeb5fG/SFKGNJ4lRPaOoA2oT0XBxUv/IrvEPVpBNM9hpAE1t6UPyppB05UIpc0As5bc50J9BGVrJN8uY1h0nw2NQjPALYQM+7SJXWGkD9A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(46966006)(40470700004)(36840700001)(54906003)(16576012)(26005)(44832011)(53546011)(186003)(8936002)(36756003)(31696002)(86362001)(8676002)(2906002)(110136005)(31686004)(5660300002)(40460700003)(41300700001)(478600001)(107886003)(81166007)(40480700001)(4326008)(70586007)(82740400003)(70206006)(47076005)(2616005)(336012)(82310400005)(83380400001)(316002)(36860700001)(426003)(21314003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 05:12:55.0730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95618774-3ce8-4307-f8af-08db7b8428ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111

Hi,


On 2023/6/30 23:02, Julien Grall wrote:
> Hi,
> 
> On 30/06/2023 15:42, Ayan Kumar Halder wrote:
>> Hi Julien,
>>
>> On 30/06/2023 12:22, Julien Grall wrote:
>>>
>>>
>>> On 30/06/2023 11:49, Ayan Kumar Halder wrote:
>>>>
>>>> On 30/06/2023 05:07, Penny Zheng wrote:
>>>>> Hi,
>>>> Hi Penny,
>>>>>
>>>>>
>>>>> On 2023/6/30 01:22, Ayan Kumar Halder wrote:
>>>>>>
>>>>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>>>>> CAUTION: This message has originated from an External Source. 
>>>>>>> Please use proper judgment and caution when opening attachments, 
>>>>>>> clicking links, or responding to this email.
>>>>>>>
>>>>>>>
>>>>>>> In MPU system, MPU memory region is always mapped PAGE_ALIGN, so 
>>>>>>> in order to
>>>>>>> not access unexpected memory area, dtb section in xen.lds.S 
>>>>>>> should be made
>>>>>>> page-aligned too.
>>>>>>> We add . = ALIGN(PAGE_SIZE); in the head of dtb section to make 
>>>>>>> it happen.
>>>>>>>
>>>>>>> In this commit, we map early FDT with a transient MPU memory 
>>>>>>> region, as
>>>>>>> it will be relocated into heap and unmapped at the end of boot.
>>>>>>>
>>>>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>>>>> ---
>>>>>>> v3:
>>>>>>> - map the first 2MB. Check the size and then re-map with an extra 
>>>>>>> 2MB if needed
>>>>>>> ---
>>>>>>>   xen/arch/arm/include/asm/arm64/mpu.h |  3 ++-
>>>>>>>   xen/arch/arm/include/asm/page.h      |  5 +++++
>>>>>>>   xen/arch/arm/mm.c                    | 26 
>>>>>>> ++++++++++++++++++++------
>>>>>>>   xen/arch/arm/mpu/mm.c                |  1 +
>>>>>>>   xen/arch/arm/xen.lds.S               |  5 ++++-
>>>>>>>   5 files changed, 32 insertions(+), 8 deletions(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>>>>>>> b/xen/arch/arm/include/asm/arm64/mpu.h
>>>>>>> index a6b07bab02..715ea69884 100644
>>>>>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>>>>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>>>>>> @@ -72,7 +72,8 @@ typedef union {
>>>>>>>           unsigned long ns:1;     /* Not-Secure */
>>>>>>>           unsigned long res:1;    /* Reserved 0 by hardware */
>>>>>>>           unsigned long limit:42; /* Limit Address */
>>>>>>> -        unsigned long pad:16;
>>>>>>> +        unsigned long pad:15;
>>>>>>> +        unsigned long tran:1;   /* Transient region */
>>>>>>>       } reg;
>>>>>>>       uint64_t bits;
>>>>>>>   } prlar_t;
>>>>>>> diff --git a/xen/arch/arm/include/asm/page.h 
>>>>>>> b/xen/arch/arm/include/asm/page.h
>>>>>>> index 85ecd5e4de..a434e2205a 100644
>>>>>>> --- a/xen/arch/arm/include/asm/page.h
>>>>>>> +++ b/xen/arch/arm/include/asm/page.h
>>>>>>> @@ -97,19 +97,24 @@
>>>>>>>    * [3:4] Execute Never
>>>>>>>    * [5:6] Access Permission
>>>>>>>    * [7]   Region Present
>>>>>>> + * [8]   Transient Region, e.g. MPU memory region is temproraily
>>>>>>> + *                              mapped for a short time
>>>>>>>    */
>>>>>>>   #define _PAGE_AI_BIT            0
>>>>>>>   #define _PAGE_XN_BIT            3
>>>>>>>   #define _PAGE_AP_BIT            5
>>>>>>>   #define _PAGE_PRESENT_BIT       7
>>>>>>> +#define _PAGE_TRANSIENT_BIT     8
>>>>>> I don't think this is related to MPU. At least when I look at the 
>>>>>> bit representation of PRBAR_EL1/2,
>>>>>
>>>>> This set of _PAGE_xxx flags aren't compliant with PRBAR_EL1/2 
>>>>> register map.
>>>>> It is a flag passed to function map_pages_to_xen() to indicate memory
>>>>> attributes and permission.
>>>>
>>>> But aren't you writing these flags to PRBAR_EL1/EL2 when you call 
>>>> xen_mpumap_update_entry().
>>>>
>>>> In the below snippet of xen_mpumap_update_entry(), IIUC, you are 
>>>> writing these flags.
>>>>
>>>>          xen_mpumap[idx].prbar.reg.ap = PAGE_AP_MASK(flags);
>>>>          xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
>>>>
>>>>          write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);
>>>>
>>>> Please clarify here.
>>>>
>>>> In this case, I don't prefer mixing hardware specific bits with 
>>>> software only representation for these reasons :-
>>>>
>>>> 1. It makes it confusing and hard to differentiate the hardware 
>>>> specific attrbutes from software only.
>>>
>>> Penny's approach matches what we are doing in the MMU code. We want 
>>> to have a way for the caller to pass just set of flags and let the 
>>> callee to decide what to do with them.
>>>
>>> This may be flags converted for HW fields or just used by the logic.
>>>
>>> If you disagree with this approach, then can you propose a different 
>>> way that we can discuss?

Thanks ayan for pointing out that RES0 is not suitable for storing 
software-only flags, agreed.

Then, maybe we should refine the existing "struct pr_t" to store these
sw bits, like:
```
typedef union {
     struct {
        uint8_t tran:1; /* Transient region */
        uint8_t p2m_type:4; /* Used to store p2m types.*/
     };
     uint8_t bits;
} pr_flags;

/* MPU Protection Region */
typedef struct {
     	prbar_t prbar;
     	prlar_t prlar;
	pr_flags flags;	
} pr_t;
```
The drawback is that, considering the padding, "struct pr_t" expands 
from 16 bytes to 24 bytes.

Wdyt?

>>
>> In MMU, I could see "struct lpae_pt_t{ .avail }" is used for reference 
>> count.
>>
>> Something like this might look better (where the hardware specific 
>> bits are not reused for sw logic)
>>
>> struct {
>>
>>            struct __packed {
>>
>>                   ... /* the existing bits as they are */
>>
>>            } lpae_pt_t;
>>
>>            unsigned int ref_count;
>>
>> } p2m_entry
>>  > And use "p2m_entry.ref_count" for the reference counting.
> 
> So where would you store 'ref_count'? In the existing approach, this is 
> store in the PTE and that's fine because the bits 58:55 are reserved for 
> software use.
> 
> This is right in the middle of the PTE. So we have no other choice other 
> than describing right in the middle of lpae_pt_t.
> 
> Cheers,
> 

