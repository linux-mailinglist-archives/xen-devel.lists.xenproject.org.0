Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9D479A25C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 06:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598988.934194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfYNt-0004yG-5h; Mon, 11 Sep 2023 04:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598988.934194; Mon, 11 Sep 2023 04:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfYNt-0004vx-2w; Mon, 11 Sep 2023 04:18:49 +0000
Received: by outflank-mailman (input) for mailman id 598988;
 Mon, 11 Sep 2023 04:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ExPs=E3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qfYNr-0004vr-KL
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 04:18:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cb8d38f-505a-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 06:18:46 +0200 (CEST)
Received: from DB3PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:8:1::37) by
 AS2PR08MB9428.eurprd08.prod.outlook.com (2603:10a6:20b:5e8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.33; Mon, 11 Sep 2023 04:18:16 +0000
Received: from DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::e5) by DB3PR06CA0024.outlook.office365.com
 (2603:10a6:8:1::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Mon, 11 Sep 2023 04:18:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT050.mail.protection.outlook.com (100.127.142.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.16 via Frontend Transport; Mon, 11 Sep 2023 04:18:16 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Mon, 11 Sep 2023 04:18:15 +0000
Received: from 08ace606f104.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 92106C58-F443-4D9B-A41B-B1A2B9005D10.1; 
 Mon, 11 Sep 2023 04:15:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 08ace606f104.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Sep 2023 04:15:00 +0000
Received: from DB8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:10:110::11)
 by DU0PR08MB7542.eurprd08.prod.outlook.com (2603:10a6:10:321::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 04:14:58 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::71) by DB8PR04CA0001.outlook.office365.com
 (2603:10a6:10:110::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 04:14:58 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.16 via Frontend Transport; Mon, 11 Sep 2023 04:14:58 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 04:14:57 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 04:14:57 +0000
Received: from [10.169.172.145] (10.169.172.145) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Mon, 11 Sep 2023 04:14:54 +0000
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
X-Inumbo-ID: 4cb8d38f-505a-11ee-8784-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1ZJui2Jmux++Nj0HJAVH9Qx/6TLBaErSeyJMq3z8DU=;
 b=38erBBqIiH5CrNABxqHl2BFNg3zCLnJm757DhpLGBSzm+VUn5NZK2WTLebMzzkOXsPt2AjtXQr+T9zGQYYoFtwqB5pg5r3DAjOPy2665PmSvu7uak6uSxcHYMCzez6ZAkD03UTsvOkAZb38Z0AArNy6T36wrxoj0MZOcxnN5AJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5a9e206c34cf8b7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+DLEgDqn950mLUF4Kg5NRzRt8/4ArDrX1a11AIsdfqeT7YSGJ8d9TFd/LUZGGL08uYvgy+FDeuhkxN8QjD/fSHvz2hH51CqjkTq6doooQToDCiFijTF40RpSeQSDRNJdYOtnAnlRYkov+GkmEhA6VGPzacke7QiWfY4UzNAxoNFM0ExDmFkYCvjLbHCQvqDTEb0MaI7QtpGvM6nx8p261Tz3jyTwkGbVdBS4KoOYZ3S0KS7u8VNCSt8938nITzvDQQrzXpLBqA2NlbHZLvqfpZAzJdFdCSgDZnU0WhfoGuSpPieeB0aRjElxAoRLl2Aeha7vQUBjlcf3N2ipQKbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1ZJui2Jmux++Nj0HJAVH9Qx/6TLBaErSeyJMq3z8DU=;
 b=a5WFoAy/s26RXTIe7pXMY7B2XRjGwbbQ8a3hZ949+x/TtyBDyWXVGMHep65o71hQxfM8qqQ7cbJiUGJXZXdx0xvD6yPeiOQ6YcOEG/ep19Vr07xT7sKId2TC1AlkPVFUgvf3XR6a+8Y4IiRNrng7m+vNo5ZPNFrBwSvUDC8ODJsJivocuoCeIFgFve290hmJWuI8O+x1SS0IKTRWIvHGIqX+tptMc6bIGNbJY1E+wyMSY6SOXxok/fi5UeiSHxYj9XoHJgOoCpKYuRy5ZZlLXmFmEjz6ZIKsq+h5BL1bLKrIkKkaXsBDJJd4vxCT5N3NntCkXOi9/s51NPlApgtd/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1ZJui2Jmux++Nj0HJAVH9Qx/6TLBaErSeyJMq3z8DU=;
 b=38erBBqIiH5CrNABxqHl2BFNg3zCLnJm757DhpLGBSzm+VUn5NZK2WTLebMzzkOXsPt2AjtXQr+T9zGQYYoFtwqB5pg5r3DAjOPy2665PmSvu7uak6uSxcHYMCzez6ZAkD03UTsvOkAZb38Z0AArNy6T36wrxoj0MZOcxnN5AJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <561ca37f-0d6e-7dbf-9f62-75020d3865a4@arm.com>
Date: Mon, 11 Sep 2023 12:14:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v3 0/8] Follow-up static shared memory PART I
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230821040046.2965665-1-Penny.Zheng@arm.com>
 <6fcbab6a-7126-21ee-e1bc-aa7ba2b07fc0@amd.com>
 <1fae4dde-f1b5-fa13-d021-3bdde7184fbe@arm.com>
 <c26aeffa-9d41-ad7d-b006-bd4ea8ab7f40@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <c26aeffa-9d41-ad7d-b006-bd4ea8ab7f40@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT043:EE_|DU0PR08MB7542:EE_|DBAEUR03FT050:EE_|AS2PR08MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b57825-9769-4764-635b-08dbb27e1f17
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pfZN4+5g1/qsxReIOgKM1Z9rSEnccv0rIW7pcGXkbMCPgM9ZCu3Dh0cKKvtdaPkcnlDbLzR/OXAkRdqSi19YtZckpjLKxJ6jOezWYFwVc99b8CUJX7zq5OE09eWXx10NRFLD/CEfTU9AJ92pVDAe36KG2Mxt4QCmbwwTOgvwSUhcbYVSBYtjppFUwzlF8iFfPUWaijFWHnw73iDdG8sebUQ9ZaZliWAbm1PBy8ZJ3bIt3gnnXaFDOUvrDCejU4RZnkC3oW7GSWq2vg3fkUw+QoI1b7UstBl7Y9j8UEldIcx2WzeypuAQcKmGmdAwjmEasG6nc+TYNW2J5Xychq6XRf2WsMKQgz15uq7AI06Kw1bK91mzEbhQd+xo0rFpbBu9gisoCBO5BplW++IUikweg0DSizZvG1N8OJCX8J7e+0qJch2ZsKm4nCbI/FHAUWF7JF/wIGrvanJQDE2k6fy3k+x0ixEGTz8HgYQjtPFHXf6C5kOwj+xW4pGfBt2zBsQ97dZ9KgrrHubOUeCPEainHG2qty7rey6EAHusky2RMoYJi7GcwooPUHtEE5uJk0uzER4Ugf0JriQZ/1N1oAtk70+GSz/esuumxjEB74Mpb7mj6VEi5ETlAmsDqEDTdym0oIn+X4gGjQDEPHwXTr5zQFRW140FE+M0rhdco9qemgQlCM3TYnUZSku9chF+aBAbYVYfD5hdOt75mTypQ+/CMiFnfMTsec7jrMAt+cAa4JUZXg+n641957nS/q7sOO4z5U8+anGVJy3JN9TmYpiD7K/0GOVd4bMk8hBim/DwuuSb/YWsXYLtYb7SwHMfIGi6ri+gGH+Bwgu8/5N5qLyDcSwdI85XM1Wxkcg0JAG88Iw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(53546011)(83380400001)(478600001)(966005)(26005)(2616005)(16576012)(70206006)(4326008)(336012)(41300700001)(2906002)(426003)(54906003)(44832011)(316002)(110136005)(5660300002)(8936002)(8676002)(70586007)(31696002)(86362001)(40460700003)(82740400003)(47076005)(40480700001)(36860700001)(36756003)(81166007)(31686004)(356005)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7542
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd33bb66-b624-4a33-7a59-08dbb27da959
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xyVqhtryX2kgZLI6drXCkPbOQ6sHqibBf/8iI3M5kqYuRwuhrOYp++H2+NSclpWRo/pj/IA6wZGZOtuAjCikuMwykQy7E4fwxWkqJaE2MTILhX9LXtQ02s9yn5VbL/Qxduh3ZNHd0uyn6OwrKwOI8zZ3jgcrqC6QAGZOzRsrfkCGKtvfwB1CN3vnNcCJW5VW8dsdgKkXewZ9NB2MX45l3nbSEOBn2//dhbsJ6/8ygGTF6J9TmGfVPxnG/IpQGYfFA50lW0UpJYXXZiiFrfe6mWVJy7LWW6EHKKkEYDIOPFZn3PyPhXnGh020cN/EsQQLX+Es6+0Qbg9PIv6VtE+AmIdZ5jSGa6zxujk1yRyr/utaE75hA8IypfxKcBheGK2m5n5QxEuclhaedt60pS+Lt48OmXkjfAYfvkuDv76D4oUdf/y9+Ps2s9qxr+fM8dQRfghTFFWyEreFyF+scNw6WBp5/OK8FyS5HVuzssam3vfYPgoDR6UvNn0lf7mafVp5qzA5uPnh2T+AcgvddQI0CSIH36MMqvtSpqf/v5AcfVJwxSHwFJTz7sFgxMGVRud0T3uSVbsooVbyFI8/jaaeJEiVcSO9LWztjtYnHZOIbEWICwjOcqqsg6BvCBlzXabhEGFvqBKLoE6UiC4nBn5lUFxEtprFUVrTbSXAxqPUTf5fP443E9Eqjorl/YeNEegIs2UdEWai8fyylh5iIQVehZiBKfVCWJheUYc9KMKPxjFd2WpMndRA27TKLeH6i9Cdw+d8yFmuDTf0JsLqDNm2Ld/ZiHbMs18lA4ysfhZiP8GbrRqlAeLlh5sMrZdwqPOatRxPjhtjABQbi0sfapo/aA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(186009)(451199024)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(8936002)(70206006)(47076005)(966005)(478600001)(316002)(8676002)(83380400001)(40480700001)(41300700001)(4326008)(26005)(54906003)(70586007)(53546011)(16576012)(107886003)(336012)(110136005)(86362001)(40460700003)(44832011)(82740400003)(426003)(5660300002)(2906002)(81166007)(2616005)(31696002)(36860700001)(36756003)(31686004)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 04:18:16.0307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b57825-9769-4764-635b-08dbb27e1f17
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9428

Hi Michal

Sorry for the delayed response, caught up in internal release lately. :\

On 2023/8/22 16:57, Michal Orzel wrote:
> Hi Penny,
> 
> On 22/08/2023 07:32, Penny Zheng wrote:
>>
>>
>> Hi, michal
>>
>> On 2023/8/21 18:49, Michal Orzel wrote:
>>> Hi Penny,
>>>
>>> On 21/08/2023 06:00, Penny Zheng wrote:
>>>>
>>>>
>>>> There are some unsolving issues on current 4.17 static shared memory
>>>> feature[1], including:
>>>> - In order to avoid keeping growing 'membank', having the shared memory
>>>> info in separate structures is preferred.
>>>> - Missing implementation on having the host address optional in
>>>> "xen,shared-mem" property
>>>> - Removing static shared memory from extended regions
>>>> - Missing reference release on foreign superpage
>>>> - Missing "xen,offset" feature, which is introduced in Linux DOC[2]
>>>>
>>>> All above objects have been divided into two parts to complete. And this
>>>> patch serie is PART I.
>>>>
>>>> [1] https://lore.kernel.org/all/20220908135513.1800511-1-Penny.Zheng@arm.com/
>>>> [2] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/xen%2Cshared-memory.txt
>>>
>>> It looks like there is a problem with the changes introduced in this series.
>>> The gitlab static shared memory tests failed:
>>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/973985190
>>> No Xen logs meaning the failure occurred before serial console initialization.
>>>
>>> Now, I would like to share some observations after playing around with the current static shared mem code today.
>>> 1) Static shared memory region is advertised to a domain by creating a child node under reserved-memory.
>>> /reserved-memory is nothing but a way to carve out a region from the normal memory specified in /memory node.
>>> For me, such regions should be described in domain's /memory node as well. This is not the case at the moment
>>> for static shm unlike to other sub-nodes of /reserved-memory (present in host dtb) for which Xen creates separate
>>> /memory nodes.
>>>
>>
>> Hmm, correct me if I'm wrong,
>> If we describe twice in domain's /memory node too, it will be treated as
>> normal memory, then any application could use it. The reason why we put
>> static shm under /reserved-memory is that we only hope special driver,
>> like static shm linux driver, could access it.
>>
>> If you track down in make_memory_node(), only memory range that is
>> reserved for device (or firmware) will be described twice as normal
>> memory in Dom0. Memory like static shm, will get passed.
> 
> Reserved memory is a region of RAM (not MMIO) carved out for a special purpose which can be used by a driver for e.g. shared dma pool.
> Therefore, such region shall be described both under /memory (used to present the total RAM and reserved memory is in RAM)
> and under /reserved-memory. The OS parses /memory and then parses /reserved-memory to exclude the regions from normal usage
> (there is also no-map property to tell OS not to create virtual mapping). So you do not need to worry about OS making use of something we marked as reserved.
> This is exactly what Xen does if there are regions described as reserved in the host dtb:
> 1. Xen parses host dtb, adds reserved regions into bootinfo.reserved_mem so that it will not be used e.g. for allocator
> 2. While copying nodes from host dtb, Xen copies reserved memory nodes to dom0 dtb and only maps the regions in p2m without permitting iomem access
> 3. Xen creates another /memory node to contain the reserved memory ranges
> 
> I guess static shm is not exception to this flow. It is part of RAM suited for memory sharing.
> 

Understood!!! thanks for the detailed explanation.
I've created a new commit "xen/arm: fix duplicate /reserved-memory node 
in Dom0" to fix this problem in v4[1], plz feel free to review.

>>
>>> 2) Domain dtb parsing issue with two /reserved-memory nodes present.
>>> In case there is a /reserved-memory node already present in the host dtb, Xen would create yet another /reserved-memory
>>> node for the static shm (to be observed in case of dom0). This is a bug as there can be only one /reserved-memory node.
>>> This leads to an error when dumping with dtc and leads to a shm node not being visible to a domain (guest OS relies on
>>> a presence of a single /reserved-memory node). The issue is because in make_resv_memory_node(), you are not checking if
>>> such node already exists.
>>
>> Yes, you're true.
>> In Dom0, we could see two /reserved-memory nodes. I think, if there is a
>> /reserved-memory node already present in the host dtb, we shall reserve
>> it in kinfo for make_resv_memory_node().
> This way you will only take the reference of a region but what about all the properties, node names, etc. that you need to copy?
> This is why Xen first copies the reserved memory nodes from host dtb and then adds ranges to /memory.
> In our shm case, we would need to insert the shm node into existing reserved memory node. This is a bit tricky as you can no longer
> make use of fdt_{begin,end}_node and instead use the helpers operating on offsets.
> 

I've also created a new commit "xen/arm: create another /memory node for 
static shm" to fix this problem in v4[1] too, plz feel free to review.

[1] 
https://lore.kernel.org/xen-devel/20230911040442.2541398-1-Penny.Zheng@arm.com/

> ~Michal
> 

