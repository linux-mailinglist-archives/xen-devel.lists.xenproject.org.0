Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39392E924F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 10:04:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61025.107064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwLm6-0001B1-BB; Mon, 04 Jan 2021 09:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61025.107064; Mon, 04 Jan 2021 09:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwLm6-0001Ac-7v; Mon, 04 Jan 2021 09:03:38 +0000
Received: by outflank-mailman (input) for mailman id 61025;
 Mon, 04 Jan 2021 09:03:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwLm3-0001AV-Us
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 09:03:36 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0d04dbe-8907-4c56-b0f1-c4b38ee619d1;
 Mon, 04 Jan 2021 09:03:34 +0000 (UTC)
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
X-Inumbo-ID: c0d04dbe-8907-4c56-b0f1-c4b38ee619d1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609751014;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ccGX30g3Z0PznG/MkHAft65r6CWfBLh0bhKSqw5e0kc=;
  b=gxypXCJpE3xiQb9RUnqpyWfStMr94xOgBnbz8b/gKbKp3VfpW+1UnRAK
   N80gj2S7usd+ZvXGli8C+835UH+aPDleluKc4gzAqB3v+n1rVuwUxD0ox
   s/EhDQojds4qblqA7ZoCGcY+VUrRP9BfOEbNfzm1G/5IP7+IJigraJja5
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JgEsT9KnaNcS80TmefozrNmcBkmzE007IH6bq0YDB4Clj8BCbRvVtenw5sda3kmB1q6Ou+XDWo
 x4yl/b2mbIvixTGRqRzI8P/QGIbubnkTQYX9MZaNW5l57gr2oYNkdZK99MOyed/Yf7Xw8P1yWv
 Xyd+1mtM5r5K1WVyKwuEh8qvKix0qOVrTlFg7queXpMNP+l/8FzRihKw/WS3ijVlQfDQ1FDLlG
 C/7Sz8DnK6Dn3ln0xzgk1NjJpgpF6O4Gi21rnCpQlqX4/27zT/+zJnvBD2qIMcnEDZfvIy0fvc
 Vhw=
X-SBRS: 5.2
X-MesageID: 34323188
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,473,1599537600"; 
   d="scan'208";a="34323188"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlmOXv9KNDF5l6KTp6QA1BOCq2Bk9AiNTr2aQQbQapckb3H/cmW7UDHqE6+7NSoY9L5VGSc09MWOKIO34bHkK2XTVXwt9/LaOV39x9izx2My3gEjO99maeOpUwwVzVgKZNUGHz6NW0Hso9uZJdjAFrmRtbI/stBTVIUCCcnK0gz/GemdXKAo/97YnnZ+nvnwfS0T1LA/WSyW9EzCRwQ3ch9Hz73uCI+uKugBihmJHyr679pa5g01Vzgjj2FgXaqdl1GYCLBB7aZ7hasM6BNUqEWQtFEf3QBwTq8VX84Izus/dxE43XYxDVIWAU2yNi7nr4HsA+2Q5xkZvPfoicUrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86gGj19mFSPQz58zG69qlbyEUsYmKnYdN6g1371ZxnU=;
 b=ho9yD9ohfh6UTUHAfRjtsRtDZYiWd57juXDCLwvv0kRrZD5mVIz9VGvcsOBYYOZUO0XCnmXjHPc2Ze537vo5jHz6FLVbcEaNhug4MhEUvy5NNrh1AIMfLMpgM6AS6L0DC1DzvErl/DZ8OcfdHJqqBoVibvUfFFPsGvxozVYJiBgUB4zPSM4/R4Tm6J7j7/SN6R+VB4XAW9RGmwB+WyGY3X3p8dC2X4iqkEwE2RaS23ni3+VUTjRHs5KmzhxHxmn1nBsDaS6RqFQwsnMdZEEXe8gBCxDXhzVsCbgQhxCX00fHxFdsvrqBU3oTEbBsRIbSyVURutlcYDWMADKZdi3mfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86gGj19mFSPQz58zG69qlbyEUsYmKnYdN6g1371ZxnU=;
 b=ef2JJP3fhTYxwLghHymkQ8fgcOM1CaYabSXXcCaIhgdeuyrykDF8OHPkH5jUfRFr+EaSF3g85OMz5ug2GWCS/PxIHLT7DmgZBV1yWNLXl2AarwqjswSLUaFs5U/AbUpnf9RFHJfazbB8v3Q8xl15bTYwu0K5P7V8uWmuxmaBi08=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/p2m: fix p2m_add_foreign error path
Date: Mon,  4 Jan 2021 10:03:23 +0100
Message-ID: <20210104090323.67465-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0182.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::21)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe2c559c-d72c-4b78-a087-08d8b08f9b23
X-MS-TrafficTypeDiagnostic: DM5PR03MB2491:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB24912E3B46ED27FE17DB81158FD20@DM5PR03MB2491.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kK+BMVNUi0RtvaT5n/ZP4ADQDo9pJJhq7HeXGmQSpu7MnZb9z09W3CVqV60Xb8kXCJMKzQ3Hf17hao0zWSOBJecCb6yNF6sr+Sg1jC85H45QCjD81GAr/dhTggR8WEYJaWBYIPV/SK8wWdpWoXQcVw2V/Fial4qTmlqHKnyagglOBhLGYFbtnA8ACVS/JLOrALgrz6CdXeNiZVn7JR8oOFzDBd4jInKNXjynCvtmCV+VHay6gHOrc930UdF9HemIh3XU6Mizg972SM0B+v+pKzifFEwUhrM1ng5wsdGl1dQAUJ4M286cEvlYrZk64LcnaDglN7CXFPqblnJl6D+uS9rsOk0Tb0n4jtAqj3eGmzZOQeaB3Zy/pWxOfLDfmL/weuukmcyBpkLUWM3p7rxGCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39850400004)(6666004)(83380400001)(36756003)(316002)(26005)(8936002)(86362001)(2906002)(4326008)(8676002)(6916009)(16526019)(4744005)(186003)(66556008)(5660300002)(478600001)(6496006)(66476007)(956004)(66946007)(2616005)(6486002)(54906003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c0RQcEYyOHZaTkpQZFYxeGFES25jSnBkQ2ZBUlprbzJnT0FoVFVFSVBYa3hQ?=
 =?utf-8?B?NUY3Q1hmNWlIdjJXNCtzUEUxTzUxUndUeithd2ZURVdMV3hFd0JzQVBFdlB4?=
 =?utf-8?B?bjFkbTRhSGJuVHB5RjROQUJWUndoWGZvYTRiTDZCVTRMd1Z6VEJtNldySTh2?=
 =?utf-8?B?T1dPeHNEbEVzN2IwNjVzTDNmZnpyN0g4ZHBiNHdFd1JEZmxFQm5uSWNrNmFE?=
 =?utf-8?B?aGhSZWlEeklpN096R0lCc1h4SDFhLzdtUHRXNmtRcjhUT1c2VFZ4eVdMYmVh?=
 =?utf-8?B?WExWSktja1NHQ0hXYy9KQUthT2FhY1JRSi94VFhBc2VyL1dnKzZEbk5mb0FN?=
 =?utf-8?B?SERkalI1NmFMRzBJeXpnTzd1dm5yMXlYN0pEamxncXlZOU9QK0xIMUdQUkU5?=
 =?utf-8?B?QkcxQjFrK2FTaXVzL1FYSWpvZE4vWVJMeHY5T3VUNjV3TGlTc2RnTGlUOG1Q?=
 =?utf-8?B?cEZNTnZ4a3U3Qnc2WUZ1aytSbVQ4ak44eHp4Skt0bDJOczU0QWkxT3ZOcDRj?=
 =?utf-8?B?aUEzUm9XN1N0UUdDNUJXUFZ2Q0pZMXdJL2J0OU9QbU1jWXFma3drNDVWS2Q4?=
 =?utf-8?B?K01vUDhYajA1eTdTbFc1dzd4SzRhTXB1cnhFSDhlMEFZWFJYTTA2Wk94RUdO?=
 =?utf-8?B?MWVWdHcwME8zRkswcG40d1JnVlZGMENHU2loQnE5NitJVGIrY1cya2ZRZU5x?=
 =?utf-8?B?dlFRMlpXanM3WC8zUDF4RmsrR0lHN2Vud2R2TC83Mldid3N6R2pVREtOZ2hm?=
 =?utf-8?B?clBQa3BiYVI4dmVKdklycTBLQ1FBL3dIdk1CT0RlSW9iVktyb2lOeTdRQnNj?=
 =?utf-8?B?TXF5UkhkTjRZTGxxd2F4MitLR2d6c3JvRnhYcWRjTml0Ti9ralM2OElSeUhT?=
 =?utf-8?B?c2VuekxwbHpIL0lycFNqY1B3UEJ3bldySnlyTzk2b0ViSld3VnZYOXZYZW9Y?=
 =?utf-8?B?MTB2RWxrZlNpUm1ESER0Y2V5Z2dRRzNCYkFpUVB4VitvNlVlYnA3MGI2N05h?=
 =?utf-8?B?aThVQVc3UkFxRk5RNTZkRUpkemxKRTNlNUw2OWhTUVlqYnV0RUgzY1RXTDJQ?=
 =?utf-8?B?ZE92UVhxVGhQSzhSYnRCdUxrRmU1YXAzTUNXaGw5aE1tcUhEeE5jcEx2QVgv?=
 =?utf-8?B?bnlrU0NvUlkyQnhpWXVtdy9RSHExbVRNSFlGVEpJM0IwM2ZibmVZaVYzQ3pO?=
 =?utf-8?B?RzROeE9KRE5YSVhVYWtIVE9KUWdjMllYVHdlZThwdkszaWE0aFJhZFlXNjd0?=
 =?utf-8?B?RVUzaGZkY0cxUG9sUlhzS0tuejcrclRPNXZZTzZic3Y3Y3ZYNkcrQmtIMWNv?=
 =?utf-8?Q?7OQqrTtQ/x8AHXIJc3X7uaS2BmE4qTUubT?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 09:03:30.1554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2c559c-d72c-4b78-a087-08d8b08f9b23
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKfSOqjXsxz9qB377KG/L1c2YEaWibA8UP31EADop6FVvQNZKnsyFsi1m2TBxhl7cpoAh+AQSHy2fXq1Dt8RxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2491
X-OriginatorOrg: citrix.com

One of the error paths in p2m_add_foreign could call put_page with a
NULL page, thus triggering a fault.

Split the checks into two different if statements, so the appropriate
error path can be taken.

Fixes: 173ae325026bd ('x86/p2m: tidy p2m_add_foreign() a little')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm/p2m.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 487959b121..a4ebfc9b21 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2601,8 +2601,13 @@ static int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
      *     ram_rw | ram_logdirty | ram_ro | paging_out.
      */
     page = get_page_from_gfn(fdom, fgfn, &p2mt, P2M_ALLOC);
-    if ( !page ||
-         !p2m_is_ram(p2mt) || p2m_is_shared(p2mt) || p2m_is_hole(p2mt) )
+    if ( !page )
+    {
+        rc = -EINVAL;
+        goto out;
+    }
+
+    if ( !p2m_is_ram(p2mt) || p2m_is_shared(p2mt) || p2m_is_hole(p2mt) )
     {
         rc = -EINVAL;
         goto put_one;
-- 
2.29.2


