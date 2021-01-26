Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F215B303B1E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74838.134551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MCd-00016u-LY; Tue, 26 Jan 2021 11:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74838.134551; Tue, 26 Jan 2021 11:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MCd-00016V-HI; Tue, 26 Jan 2021 11:08:07 +0000
Received: by outflank-mailman (input) for mailman id 74838;
 Tue, 26 Jan 2021 11:08:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4MCc-00016Q-F7
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:08:06 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67c7d9ed-a01a-434e-a609-a4b0977faa8b;
 Tue, 26 Jan 2021 11:08:03 +0000 (UTC)
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
X-Inumbo-ID: 67c7d9ed-a01a-434e-a609-a4b0977faa8b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611659283;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=3Bjdf7c6T/C8vcbO1X5a2wgXcuVafuH6juWX+juRVfE=;
  b=M69Y0bPQfyf4M4YXxo4zUw73BFWJZi/kMrG7+bqXwGL4GywyJnGF+9do
   mPKOMxYiWM9VvlNrLBPPEaJwAmqmy39nLEM0+JKwTSEAV/OpYF5RRFpSN
   h/yU1ZP9Va+6ogiYOjFVjpvkZuV8ZNsgZX2ysY7ZbSx/bBXyOsV6woojM
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BKSdcZ2iTRQWSy0qgx8LGtmfJ3zRy6U+/Yhs+FpHjOmS8hAPAUGiqvh7w8r/qTzm9xe6AOmY/3
 l7aRUNUaFPGyXHmX53Cl+bG0fNj8HqlHvxxeepCvZkjZkBe4jEAoY0IoyKh7XB9cErgO17nd1t
 /uCenoTOF0Hgy/T0l+Q17SXT9uv8X9SEJHFjcCsXZib7uFRR/1O2I7KZFAp3WWDwCmrga+z2q3
 /NgWAAtGfhYmI0abjxCDNJGiqHn+/1eYsLgjtCXgwfCyXdqR398jrOJywt5f+H8WLzC/WUWMp7
 gGk=
X-SBRS: 5.2
X-MesageID: 35903190
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="35903190"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqpqBTVhxRS6Na6ELYY7jFTpqAVMCS3+7lud24c22MADlf16qDrloE7hZqdoypFUuQHVdSDIcw2qRxQFENz+oDSK2zNQ1loi3kcmrBnzMrKViLZe4HaQaZMrvjQhxTn4ppcV2s/L8WZC3XtOOxHkn2chu2m847ti5UjoHeG47X9kIWvdmcrJH+FRFhTVLVisvIjs/vi94rQK2zCqcEPdpVi6SqCJBpy9HN8Vtu803UtfxPQfzp12Z3q4rSklGQmiDXReqMa3aI5XRkZePzNnHV2WOZmT3H6PwQ6hz8aLhrNH5r8bALl12xJin+KEAT+mmJxkvZ71yefi9m7X2UT85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4BY+k+u1FJS5/nSTNcuCCrghG7rHss5ZnDW7+nDDT8=;
 b=YoKCTPiEN4AOpPZiFzvOJbnFLHSlDCkCLlN6V7ePFAuCTZXxo1DQJDz40Cg5GCvceepDGGHjcDe9cs3vpYpSvFqxHcgtcoGovnwFsC2BdjwMNXE2QOzdEUO8TzkjHmT+dy2vuMtDcxvnCa1GLJCivfhstS7imvLq7k6TKnXr1zYxCGCYZcL3LNdYWDVhGpTq148CvvbaafFf1jcuzjj9nXcSdZVBr4XfUgACEIK+yCZjrozrD/GRf44k/1frXXvmZMyOXfvN2eyn1HJGrdkTHdF7jTf/HxYTaXX1B3SXCrZYWwmEzpVYwXkMKrD0Y8VVSefQTLi0hKpb3Iz9XAF/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4BY+k+u1FJS5/nSTNcuCCrghG7rHss5ZnDW7+nDDT8=;
 b=Ix6VzrLq8Q6iT/efuSXEtvRJAENeoyHKVUmno4kSBLUDJec1l5BqD9pHLWSyQzdhg/ISY1W/HJZ8sQD+Zxw0+NtsqDNbNAeJbj39iWuDfDN/oYDXiwHJeGN9eLkcSUC82w5VvQdjc4sWmm4yw5uAbFBwPC260ZfVcSueRCbgyHY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH 0/3] x86/intr: interrupt related fixes
Date: Tue, 26 Jan 2021 12:06:03 +0100
Message-ID: <20210126110606.21741-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44e47477-52cf-4404-5322-08d8c1eaa454
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB405950E92DAEDB1561B036248FBC9@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fB+Weq7GWK3OIeumSF6XxHOxgMfvyOqFpiwPpWUOfHoeb5O3u3IqZ4NzTWSzCtilctNZjF3JGjzZjfqWfl84KoTA2jN9tMEsRoftwGVrKGK+0r0jNt5hoog1xE+en8EMRq1rr0X6UAZ96QLpU6Z+jraTQSFw09YVz7CGsYUlAiwZTIHi6ugNuRwvMevIES/1aE2xtaS6CQXj7fOW1kfXaayazp6M2RwYVgakKnUqmGkwOP0KS5/grmQcSkwTc3v1xaxrF5/AGa1E6EyOJWMR7o5TrPSXz6WAIBKaAjYd3JwRdPfHoTJjJHqxWQm3zXa9MTISmqn+ITX2QZNWBEVFPGOFGmqSqGDV2yPPuPXi2rWz56PMssZVHyYuy3YhLeAUCGGrmxHaOVaI1kIgfrWv5H3nOovwkZ5o9s4DjlFQzGptj8Cvg68CeJLbXFL3ABa46dnAMRbLPuC26NuVMtJKiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(4326008)(186003)(83380400001)(478600001)(26005)(5660300002)(2906002)(966005)(66476007)(54906003)(16526019)(6496006)(6486002)(4744005)(6666004)(956004)(8676002)(2616005)(86362001)(8936002)(36756003)(66946007)(6916009)(66556008)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QnFmVGdxeTFYQVNyNmw5dW42S2FrOXJNb1Nublp2UEZhOGlCbkJSenJCV1Rj?=
 =?utf-8?B?UEE4N3N4TzVkWFhCM0toa1VjcFhGWTFwOWVJUDl6MG1rdUYyTk1pUno5MDIz?=
 =?utf-8?B?clhCbGFRdG9kZVR2UUJ6dUNFRHJ4Ym1vRFNsU1htNlBqK1FrU0VoTGJGQXVK?=
 =?utf-8?B?TXREdExITTZwdGlXV2M4YW1PZUJ3MWlML0ZtTWdjNWRqN1hjUFlUUkZFcFdB?=
 =?utf-8?B?YTY0Y2FiU2tvOGpaVWNHQmcrY09UQzM5Mm9HalpMcHY2WXlYQXJIUktENGdV?=
 =?utf-8?B?c2haOUl1TW4wNCtENGwrc2ovRFA4QnJmU0ZkeU40aFBXRW9Nc3l1WmZXQXhK?=
 =?utf-8?B?U3lwenpIM245bWp4VURtWGg1REVTVlhvbU1reEhSZXV4bmxjalQ2OS9FQ1JK?=
 =?utf-8?B?a0ZrSm5ocWE0UmpyTHllNlpHa2UvWTRVelBpN0FjU2gySDcyK3pZZWlzcGds?=
 =?utf-8?B?VWhtcC9CdWd6eDJoSHRPeDltdXlIMDI0WllrWktKVEFBYnZzaDU0SFhjUmVS?=
 =?utf-8?B?R1BQVklzVEUxNlJuRjJqZHN5Q0toWXJVdDhNOVU4a0xCQ2x6enRtTGdQcDhy?=
 =?utf-8?B?TnY4WTRNUy9mT3hkUXY2dTVpSTBxcHRYMW8yWW1sRGdkWGVaR0hpanV6U0g3?=
 =?utf-8?B?cDlVWEVoVXdVMEZ6b3VQQnl5d3JMbndRUnVpYWU5YkkzWHRscXdXSkYyd1BC?=
 =?utf-8?B?bHlUNXI4NUJjSmdDQjd0QWt0UFd1K3JrK2E3MU9CTU5xQnZJYXh0QkFhYlFk?=
 =?utf-8?B?b2QxTHZuR2Q1bmZjeVZGVjQxN2NyWlVQVkt6K1l2TzljMGZIbmVFUThQbnhL?=
 =?utf-8?B?Z1VJZzYwVVBENVcvOXdOV0szKys1Wk9UV0xLZ3VzUEZkR1RXU2NidEg5eGt0?=
 =?utf-8?B?S0pqV2tuMWVvSGRZRjVMcFc1TThxMWFVa3V4L3Q2YWplTWZnREg5N0grekda?=
 =?utf-8?B?MzcvSDk3a2R4NnpMN0RBRzRzV09yR24rdUdudjVTeUJybFpqVFIvOUtDMkZS?=
 =?utf-8?B?citPY1pOdmtNS20rbFJyYWw0S0lnbmJLV1lSK2NLbHZmdk5uK1FET0pDMjUx?=
 =?utf-8?B?SmcwNG0wcDNLSThXWURUSnRvR2d0c2c3NnM5Y2tNS05IL0lvZG55RThpaFNZ?=
 =?utf-8?B?SktwbFpsY0xWYldzcnl0SElrZ2lva01ocEU4R0VIR2NpR1J1S2dadzF2OFU0?=
 =?utf-8?B?Vk02MzFFb1BGK2J0UEYyOThKR212Ujk1TWhTb0phNkdPWGJhNnViNUVwTitu?=
 =?utf-8?B?akVoaS8xM2dHam5rbzdiMm5YenR5ak9RbnF0OXpMbWNMQk9MVFF2eCt1Smhu?=
 =?utf-8?B?SitWQzd4Z0wzd1M2TndyMW41OUY5L0hCcGxDOHhNU0piTzFWUGNTRUZRd2VL?=
 =?utf-8?B?Y2h1TlVNN1g4SFdyT2g3bGJMUkl3RlVpd0V3VG1helZoaFJaWnRzem5IK05X?=
 =?utf-8?Q?Ao5cS+pV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e47477-52cf-4404-5322-08d8c1eaa454
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 11:07:59.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbEnksj5NM3pdcnDCNrDcj7oB/XCAFOeyYfjvKW92SAnXT1A/GsPwgTBBb4gYG4AXjfz1HCGtRbaVd9xU67CDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

Hello,

This series has originated from the failure discovered by osstest in:

https://lore.kernel.org/xen-devel/E1l1vyr-00074y-8j@osstest.test-lab.xenproject.org/

The commit pointed by osstest is correct, but it triggers an underlying
shortcoming of the vPCI MSI handling which is fixed in patch 3.
Patches 1 and 2 are small bugfixes found in the process of diagnosing
the issue.

Thanks, Roger.

Roger Pau Monne (3):
  x86/irq: remove duplicated clear_domain_irq_pirq calls
  x86/irq: don't disable domain MSI IRQ on force unbind
  x86/vmsi: tolerate unsupported MSI address/data fields

 xen/arch/x86/hvm/vmsi.c      | 93 +++++++++++++++++++-----------------
 xen/arch/x86/irq.c           |  8 +---
 xen/drivers/vpci/msi.c       |  3 +-
 xen/include/asm-x86/hvm/io.h |  1 +
 xen/include/xen/vpci.h       |  3 +-
 5 files changed, 52 insertions(+), 56 deletions(-)

-- 
2.29.2


