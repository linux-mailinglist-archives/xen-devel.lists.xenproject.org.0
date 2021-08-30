Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C0C3FB6B3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175058.319015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgyE-0001ZT-A2; Mon, 30 Aug 2021 13:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175058.319015; Mon, 30 Aug 2021 13:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKgyE-0001Wo-6W; Mon, 30 Aug 2021 13:05:02 +0000
Received: by outflank-mailman (input) for mailman id 175058;
 Mon, 30 Aug 2021 13:05:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKgyC-0001Wc-Gk
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:05:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27c28371-b1b6-4437-b9a0-b088a6e91e24;
 Mon, 30 Aug 2021 13:04:59 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22--YswkcJNN4arQ58zjFxXPg-1; Mon, 30 Aug 2021 15:04:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 13:04:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:04:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0068.eurprd07.prod.outlook.com (2603:10a6:207:4::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.10 via Frontend Transport; Mon, 30 Aug 2021 13:04:56 +0000
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
X-Inumbo-ID: 27c28371-b1b6-4437-b9a0-b088a6e91e24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630328698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h4jbZC34YKTDxv89AjMP9DMx0JY0uxFi3geIdWtFbDc=;
	b=nCxvjm0Fyb+fGxRvVPYtHzylR46KTuQTXJl2dVc7nSJI0MS2dunzKZwisbeD0enW4qCqet
	trxze4eiID3dcchuZ+nxxapZtXzanGehqxo9ndh5Wl7M0luooA84OM8o9ZQ5b147QUqtVa
	g3LtUpHG9zS2+CqtPPupSteUJih4qjs=
X-MC-Unique: -YswkcJNN4arQ58zjFxXPg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLLH6A4SSwMQtndh5vs074hKGT2ySeQgNe5+hIMSLtKFIbvXYoCy5GWE2Ib6/ug8tCLmaR04uPVhv1zQliYGTHXcBI88+lp4NZwATCpUJw2lEDiYyjG7e4KZkcPu/E6KTYYmk/xvcpWh6Wb+p93QG/RKkeaU/FlB7WijA14cIzPjZt4iVF4jX47WBFO97P4Iy23McRQmTFgtKr8td8fFVP9imqpGUVuEq+WXbr+Vl2Abm9qkSxqKBJjdFsetp7/l6k194ASAR+PioWyQxPhQ4hCjgGWRX3ysfYdb9PWpWsB3Vx7RFpcgS2dRPJd89IuvqIGd5WwzIcY05/NGntP2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4jbZC34YKTDxv89AjMP9DMx0JY0uxFi3geIdWtFbDc=;
 b=QDdoLWIS1SP96qUVUiBbvvJWI//WF50FeBT0ww69wnpfzTWdUsIMQcMQ2ifrMk2GxfY0shtThEMln6d08MZooCgyJKwc5ctgYNHTHxNbjnNzHAxuMJBSzeO9AbUr9qGhXyIYFXrn6wY0vl5DPrUPfsOWjYIijyTwBwKjHaKDdNmErCjt9GJ7tJlsijHqdbJ2UK3KaAxA89EcsNodVS5mN6ufGGKotGpqG27h70SSRuKF/C5kYxOwgB9Ggy1UKZUwmr4slbtvixjeXv4wBYUycZxrxsEimTgsa6yteZgsg2eJcEgH5qEGFBwtuS+sVpp0UZTG9Od9ZC0BbXEGhYHPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
Message-ID: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
Date: Mon, 30 Aug 2021 15:04:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0068.eurprd07.prod.outlook.com
 (2603:10a6:207:4::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51d40157-80a0-4302-6255-08d96bb6c3f2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26081D099D9B619106B00F22B3CB9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+xlZv7TTsDVresUNTkpVK6tlS2XuzNyU5JWMHIl/ExjdGrWcO439vZ7bBOxU3kD3gl6lmEyx9xfmV9jP7JOpijWLvEJ4EeMWOHsWxF5QHgFP61dHvVURuDKpJ+3tD277zQVo0sy6QmetDMHz+UwdVrP9AWO1ylCQJY1mKsBojuccZ9vj+EGOCqO6jvwDm1efh2UM6AUL1TNmHy2rakAimpnTB4edaKQ3x/olom8muT2axBIRRDiYxkJc8vXjmEkzRNqUuMwiahOXsQLOGuImRRQNGsdv2g0nHXEjtXkoePTOsQfn8hntpYCai9t+E9mFDXo4F5zgo0wajDG80aSjazqkuDJh5Xon3UGrd6ZTPBSoVjA0xyEHIXpVnYhpHpgPV6VWk1SmX9mJFLflZ189HGnZP8pYqsXKDCkUAyj9fKY0vWg+RzlF4nQ3tgXo6/UfeHCON8FtMJthWrjoFqiugu8t2e9cuZShiBLULjElComfEERmARmtx8ZROhmkxHRlDyWaagVbFercrl703pojKfdnLZ/IOg5tt/XWJauvckNxMdEf3C00HY+aBwhijAZJQAzBqY7DQTg0/sZXhVWgfQqSSTFOvpbZeiuLUD00SS+AvB+/O4ZIYWvr054aFl87j/2tFWm6kSQrejWF3q4AUNhG0ZjwxJ6vYATpld/d9R3du+83h6X6o2ELzOX1y9mbKmJDl8C2Pec/aYIixEKs1o7VgpIpj5yKdGiutVIDLnY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(31686004)(2616005)(8676002)(8936002)(4326008)(86362001)(2906002)(36756003)(6916009)(16576012)(956004)(38100700002)(508600001)(83380400001)(6486002)(316002)(5660300002)(66556008)(66476007)(31696002)(186003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXVwTUdQcm8vcG1rUnVsbXJWVUlqSi9LcXBGM1M2eUtIbGVSemVsbkIzTlFJ?=
 =?utf-8?B?OVF2NDdIK01Ic1lQY0FjY01ZNTR0bi9hcUVGOTdLQ0JIemozR3B1SUp3OERN?=
 =?utf-8?B?UUVyeEFkeDRoaEd5c2cweU4wenlId1hEZVBSSVAzV2FLa3dNSFlZQ2YrNGtx?=
 =?utf-8?B?MW9ZUzEzdktjdG43V2ZqajAwYVJNekw2cHhIT1Z0dHNPNE1KQm14OXNOQzA0?=
 =?utf-8?B?eFhVV3BaTm1YQWpiZDF2VTBnR0VMRlNOSEVIVEdxdHlhWSt2QjRoVjlGQUVn?=
 =?utf-8?B?Mm90QjNsb2p4b2M1OUswaVhnN0haVkk0bGJ5MXBKbnByZm1xRXhjWVdRUGZp?=
 =?utf-8?B?alc0MW1mTEc4Nk9BVVBXNGMyVU9YV2R1elRHR3dGVUV6R0M5UHRycFQ0d2NW?=
 =?utf-8?B?VTF1ditHTW1TZ01QNUE3OGxXeWlQSlNaZWdYT2ozcGxDRlAxeDJNZE1qMWhV?=
 =?utf-8?B?UGJJdGdJa1FkYWdNaWpZUWp4Wjhnek9IYk5xUmlpTWdWTy83UzROVG9CSGJu?=
 =?utf-8?B?MHU2TzNjTG9wU3ErREY4enUvRVVYWXJDU2FBeFY4aUpqYmlLNWh1ZjZTTElR?=
 =?utf-8?B?TFhxSkx3Z1JLR29BT0tGdkpDckxNenRBN0tWd2kyVWRMcUhlcEIvSUpGWE43?=
 =?utf-8?B?akZuZlVNZ0VNcUtZQmFtV2JQUFc2enZsYW5Hd1NZL1dyYUJGNHJCZTFaLy9L?=
 =?utf-8?B?VGRBNmZLQWFwdTRvWHNzREZtOFp3YlppWjAvTDE3RFRjNWR1cDJsaTFZai9S?=
 =?utf-8?B?aU51MHJVRk9FRzR0NTFsWHdrWkdTQVJmc2E5dDNhcTBoaFVTcmFnNno0YXI4?=
 =?utf-8?B?U2lQWHJhayt4SXJqd3duMTVUTzlHUHFiMGxJM0hpNjk0SkVzejAxN3liK1FU?=
 =?utf-8?B?Nnh4K253LzZ0Zk03MDZsWGdNTVo4T3lSMU55eEM5dkhGbEx1eDRaYml2bERT?=
 =?utf-8?B?WGNONjZqcFhlb25PbVVhZHJ5SHlMMG5WRDlwZkpCMG9PdnhKZTNoZzIraWtU?=
 =?utf-8?B?ZElFNTE5ZTJSVXZkODZxR1dCY3lLU1ZpUFpHSkg3VDVwaW1oOWc2QnBONXg0?=
 =?utf-8?B?ais4eFdOTUlON0pURDZqNjJyQXlGVytob1JTM2lkMzlTWkxzZXBFV0E2bWt2?=
 =?utf-8?B?ek43VklHK1A0S3NqS1I3VkZ0N3lxLzVJNEhXVmZibHlzVC9maVI0QTZBOVl6?=
 =?utf-8?B?MThFeUhCWW5qUG0yVnYxR3J4cVNQN01TOUpXV0VLWjlvY2lWSTYvQ0VibU5K?=
 =?utf-8?B?UEJUc0FodStnOE9TVUhsTU5aQXR6UHRXVmpveVp6Nzh2S3EzZitwcm5VdnpM?=
 =?utf-8?B?VW5IZmNTVytTUHA2UU9yUlp5ckFtclI4V1YxMmNxSzhnWDlPMDRlVVF0Qjcw?=
 =?utf-8?B?TEVYU0tubHlzSm5DUjN1SVZDZWdFb1JRTitHT3laQlgrZ1dBYmttV1Job3BQ?=
 =?utf-8?B?b0MyWENPNDdjTnpDc0xPd3NEa2ZkMUJkcy8zMEVvU1AySEhlcThlNU53Tm0x?=
 =?utf-8?B?MENsSHQxR2VZUzc0Q09keHRrRFBnS3BNVzVTOFdCVGRGYmVlN2k0TFMyTm5E?=
 =?utf-8?B?UGdEeEdKREMySS9hWXRNVFd4NWlCUzg1dDQzYUErem8zV1lrMFVyQVovWnFL?=
 =?utf-8?B?QTJFeTBVRnhGbzRVM1RrdFNOY1NuWU45eVI1akpSOVQ5LzZNTnd0eUZoSkhk?=
 =?utf-8?B?VFBzQ1VrdkhKZlBGZUMrb0NpdGlmMVNTM1E0ZEs2Nml0MmdvSzcvZkxpT0po?=
 =?utf-8?Q?KUVzyqWrqeSOzrdO4tsDZIwyqLFshrcL8+yEiiL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d40157-80a0-4302-6255-08d96bb6c3f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:04:56.6567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O190WbcesQcS1TLsPAAkk4TE8XEruPnikJ8SFaVWJkkFUo8PaBx2befYlsij+ix6nho/GnR38YCO8b8W557CdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
console) are associated with DomXEN, not Dom0. This means that while
looking for overlapping BARs such devices cannot be found on Dom0's
list of devices; DomXEN's list also needs to be scanned.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Patch intentionally mis-formatted, as the necessary re-indentation
     would make the diff difficult to read. At this point I'd merely
     like to gather input towards possible better approaches to solve
     the issue (not the least because quite possibly there are further
     places needing changing).

--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -206,6 +206,7 @@ static int modify_bars(const struct pci_
     struct vpci_header *header = &pdev->vpci->header;
     struct rangeset *mem = rangeset_new(NULL, NULL, 0);
     struct pci_dev *tmp, *dev = NULL;
+    const struct domain *d;
     const struct vpci_msix *msix = pdev->vpci->msix;
     unsigned int i;
     int rc;
@@ -265,7 +266,8 @@ static int modify_bars(const struct pci_
      * Check for overlaps with other BARs. Note that only BARs that are
      * currently mapped (enabled) are checked for overlaps.
      */
-    for_each_pdev ( pdev->domain, tmp )
+for ( d = pdev->domain; ; d = dom_xen ) {//todo
+    for_each_pdev ( d, tmp )
     {
         if ( tmp == pdev )
         {
@@ -282,6 +284,7 @@ static int modify_bars(const struct pci_
                  */
                 continue;
         }
+if ( !tmp->vpci ) { ASSERT(d == dom_xen && system_state < SYS_STATE_active); continue; }//todo
 
         for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
         {
@@ -308,6 +311,7 @@ static int modify_bars(const struct pci_
             }
         }
     }
+if ( !is_hardware_domain(d) ) break; }//todo
 
     ASSERT(dev);
 


