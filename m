Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED90A3F605C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171512.312978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXO9-0004uG-8Y; Tue, 24 Aug 2021 14:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171512.312978; Tue, 24 Aug 2021 14:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXO9-0004rD-4r; Tue, 24 Aug 2021 14:26:53 +0000
Received: by outflank-mailman (input) for mailman id 171512;
 Tue, 24 Aug 2021 14:26:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXO7-0004qw-Bz
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:26:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51d0b486-04e7-11ec-a8dd-12813bfff9fa;
 Tue, 24 Aug 2021 14:26:50 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-7zS0o-UiOU-iCUilfnEdTA-1; Tue, 24 Aug 2021 16:26:48 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5586.eurprd04.prod.outlook.com (2603:10a6:208:130::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:26:46 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:26:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 14:26:46 +0000
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
X-Inumbo-ID: 51d0b486-04e7-11ec-a8dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629815209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+chUC9y2Lb1G4vN61QIuBBXsqqC6ILv8f/8geNJpSIk=;
	b=dQDFkgY9/7cCYNmXEXdIIklpsHbzM/hJAbKae/kJwiESuwNcXGWzD3NnNYgxKUXXs5pI3w
	piImhcNCrYjgV7/97Dz306Y1P6zcpandUHDcB9dn3o318VOFWv710hdgWOJOFY1C93kzWF
	LfoBUVqr+BEovFK4V1o2bBTcIktmXIg=
X-MC-Unique: 7zS0o-UiOU-iCUilfnEdTA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0KRIO8eqhFI+9kQygeatb9Kg9FK5Rru0iuKTCFOOV2U2n4N/WokiYeBzy6Q14ZnlkArDes9Kbi7leynJvqrHLrIvp9ElDtW/LeaGMgBPnI2K52M9qH5sSgjdZYRMcW7Jw7QjXUGKDdwAsTrb+EcHXrlHxTlXc7P2Wu2lLYLm3UK7MSQVC4syGx7seMrHnSnz1pvZTw2qWuMeyVf1geJhmXudKT0xmasHQPW/5DcURFdT/wml/8A2iTCLa/6jaLvpQjrgoYZq8UhJ/kqIOra3fNTTp3gaMDFbj0mZHfBsPH68anXRetrNfkkYjnH3TfdEg0J1vZnH+/eSfE6lAUA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+chUC9y2Lb1G4vN61QIuBBXsqqC6ILv8f/8geNJpSIk=;
 b=V+m4gd3hop4Kd6k5SME465aQMkRQ6JfO1OFj8mEC4hyY+mivMHV4Vr9qtXnz3jSIm+a7vVlsMf8Ibl8noifa4v5yYJNGy0nEpoXhLTqRWZPJs+2KAn9F6sbRoc5DZRWBeCS5kH+f3UWlBJYklLXVYD2OpCRZmMCcyFy26SNt5I/sDvnepPFexUhUfONKaCvxuxinBdhb6KVaVzpXvwnvjegtsE225Nk3zpX9jsubZi0+tytvOod4+mJ7GXAEcFH1IMZoH8MrXqBa4WCpdqpzunXgbncYVa39yPf/886wiZtvtDXJUFf5SmSAA0q7mKAn2yXyDTUSQUeHAkwR+F4Emw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 15/17] IOMMU: page table dumping adjustments
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <d6b3d7e4-7ea0-387c-86d1-1fb3c59688fe@suse.com>
Date: Tue, 24 Aug 2021 16:26:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::25) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6246664-69e8-4465-ca4a-08d9670b3406
X-MS-TrafficTypeDiagnostic: AM0PR04MB5586:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5586CA1EE12D12F7176AECB4B3C59@AM0PR04MB5586.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sLu+3AMuZuS8WZtxFu2ETtWjXNMb9sAEkQDBQpXGVtcLJ5gSvP//HXfaMJaVPM2S6rOnn2HDhuDCWtaouaZwDlqNgs4HAF+9HzCFbgFmS2yeTBUMZgGZiE78VKLjBfPx+kqmTCzyIj8i0QuCJc0yC+CfwoSTdngQkpG+Ok4zew7IU+g6SArId8NDiISNDO/fj2j/YFOgsOXUwZbqTH6KVOFCj/BXszW6EZA8JMgeM6zGVFVRlArypBfCcCC5gMNLXWxtUxW3/SzrkyYp+/KZQvvsQy9enJL4lzNCYaoSh4hbd1BTSYiL3YRbDM3n5s8fyH6r5hqMSm2ElHfRMpARJXfAG2vatvi7clrMshdhln62liGBMQvyMpfPDpnvbJJZ81s8grevO8/ZxOTNhGNXHKsPwbNLQyJEQZrVOsyNkfJQAs9M1wMEJncnjlWLpanOYY0w1eiLXA0TNF/URK5fJUM2Z4akDH+AqHO5ZPQFSnHnZLHDeOxBlUI/zw73lRBHHO6DICM99Y2abc/nnsPPXPxp4gA45CabxSQhJAF4eZGBCcmNu2jOVRJcxk3dnr7bWUgI4Y1bLlfvb8CGr2ey6bCjAcTcEDz/gdTLGykKy3B8aZs9gr0v4JLV6114C8qOKKNuwc/VnFKqa+YOfFuAzt8/7amEgXmOQ3/LP256wgmgJ/GndwGaxzzUSTUkBrHnBt9VEbHGmbHfRnPbW61CR62240u1rF1fo1/4lUwefhc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(6486002)(6916009)(478600001)(31696002)(956004)(4326008)(36756003)(2906002)(38100700002)(316002)(66946007)(26005)(8936002)(66476007)(66556008)(5660300002)(31686004)(16576012)(54906003)(8676002)(186003)(2616005)(83380400001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amJ6RVNIY1EzZ0lSc1FIUm4zVTJqV2JZVjFKZ1VsRWpVTzY5cVhvUnNvV09Y?=
 =?utf-8?B?VFdiS0U2YlRNMnRlQ05RTHZ3TEF5N3R5cEJ1M2xOUm9YRzVqZ2xicWV5SnUx?=
 =?utf-8?B?NGwwU1RrQVBzMGNoUWxUR2dybHdhblIvVWFpMzJBK2F6clZ4d3E3dGdvU2h4?=
 =?utf-8?B?QlhyMzhlYlFLeE9tWWttZnhNWm83TmhxU2FtcUliR3dUbVdvMXRWQTJuc0M0?=
 =?utf-8?B?Z0NhaTBLVDY0OFBNdVI1ZnBaem9RK05lNWYrakFTOHAweWlzRTNtT2wxQ2hY?=
 =?utf-8?B?VGtJRnE4SURxdWx4WWFCY1MxTGRRTDJDNUtPZS9kb0pxaTBJak9JRGdJUStu?=
 =?utf-8?B?a0xHdHU2Q3l6bUhnNnZMakNFN2c5c3UxU1g3ZzNzNnZFbG9WUzRtK0U4UDJV?=
 =?utf-8?B?eHdVZiszUmFuYVVtdEJNU21jYllVSmxwM0hJMURTemhiRVh6UUJWVGtOUWFQ?=
 =?utf-8?B?NU5HViszZDA0Tk5sZmdTaFF6c1lTYldqVXN1WURIQnliMHJ3MnVua3NNaHZr?=
 =?utf-8?B?MUpoSTRjK3JIL2RqVTUzdUtnWmlkMnR4VmRGcHZkNEcwVlVvRjRMNTQ1cHNT?=
 =?utf-8?B?eXhFOFhVTCtNTUVJMm85YWQweGgwN3hLRjRzTXg5SGRWRE10bTdqMjZDcjl6?=
 =?utf-8?B?eHJtYnZsa3kxS1hRTW5LYXVhK0g3NVlwa3JqSHB0QTk3UXhlNmphUEhkUUd4?=
 =?utf-8?B?Yzl0U09vVjhHb24rNE8zTi8rMHRmcjJ1blZpVzJYTFU5N2dpc29rNkZDck9U?=
 =?utf-8?B?ODVidUhCNGtTY0ZET0QrQnA5TndMWVg5SkhiYkxkZk1rNmFxYzVTTDZkeklO?=
 =?utf-8?B?aGxra080MFlQd2YyN1oyajRHQlZ2YkQvQ0w4TXo5VXBGVlY2TGZXSDVQWllK?=
 =?utf-8?B?aHJKTVdVMW1Oa1RGR29ibDYzcWtIMmxseUtHZERxVW43dTgrL0xqNERuTFJQ?=
 =?utf-8?B?Q3pKTnNSNCs0N3ovR3Jya2FKTDNSRTMvTDVESTFnaXk1OUxYc3o4eDdZYy9p?=
 =?utf-8?B?Rk0wSHVLek9RamxOV2lkcXQ4b0dqUHNWWFVVKzJESTJGaGR5cEh2UHVlYTNV?=
 =?utf-8?B?RHBIT05OS2JCSEE5dWRoK2VId1FuZGFMd2x0UUpBY0EyNFZnWWduMTdpZWUr?=
 =?utf-8?B?czIyK2puY09vcGlraG1FMGJmZ0d3QWcrZjlzVXQ3blFFdUtUVG9ZajhaZFpw?=
 =?utf-8?B?WmcwdEgydlFVMXhNWkgxeFVvb3A2T1NBTkI3U3Zjc2kzU09aN3o5M2FaYzlD?=
 =?utf-8?B?U3VyOENwalFWYkRmTHFXcnhYcU54SlgxMHpQN3NzNFAwR0tOVHBSTnowdHdi?=
 =?utf-8?B?WlNBWEZzd3NvOGpnQUh3NVJWeVhkZm10aWpwMDhiRmFOOXFVWjJhNmsxUjhK?=
 =?utf-8?B?UEZzYVhyQjFnbEw2NHN3UkpnWk40Qk03ckxWeE1GZmwveTJzcnM4TUNzSVMw?=
 =?utf-8?B?d28zM05OSDJMR2F6bmZHdldVTXVTaWpjL3NJVDc0bUFrUll6V09taEtDQXda?=
 =?utf-8?B?ZzJLUlJ4b2xTYmlkY2ZuMlM1WFJrVXlmc1hZME1rTlBOc0ZWaiszWWl1VFAx?=
 =?utf-8?B?STNGSDlHNEQxZS8zSDE3VThydWRqd3NlT0NKQnQwNW5hU3lKQmFEd3dUdFZl?=
 =?utf-8?B?V01keGw0a0tnVkh3V3ppWm9XQ3QvOU1HY1hYenhWNEgvYlNzcENtVi9iUkNW?=
 =?utf-8?B?UHRjcjBXQmlxeVM5T2lieEJQQ0FJRUN5NVVSVlB4RWZqV0xTQTNtL3diSC9v?=
 =?utf-8?Q?JsncqjB32tpgMMqWCrwN1viPCFydhibzWIIdbsZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6246664-69e8-4465-ca4a-08d9670b3406
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:26:46.6046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1+Ce839BMTongem+xiSfpNoejtAT01mTUlante32TW8N9XstRwTMRIgB+0ENqvO4qhbraN+DYBGiZr3gmaLnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5586

For one none of the three IOMMU implementations on Arm specify a dumping
hook. Generalize VT-d's "don't dump shared page tables" to cover for
this.

Further in the past I was told that on Arm in principle there could be
multiple different IOMMUs, and hence different domains' platform_ops
pointers could differ. Use each domain's ops for calling the dump hook.
(In the long run all uses of iommu_get_ops() would likely need to
disappear for this reason.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -640,12 +640,9 @@ bool_t iommu_has_feature(struct domain *
 static void iommu_dump_page_tables(unsigned char key)
 {
     struct domain *d;
-    const struct iommu_ops *ops;
 
     ASSERT(iommu_enabled);
 
-    ops = iommu_get_ops();
-
     rcu_read_lock(&domlist_read_lock);
 
     for_each_domain(d)
@@ -653,7 +650,13 @@ static void iommu_dump_page_tables(unsig
         if ( is_hardware_domain(d) || !is_iommu_enabled(d) )
             continue;
 
-        ops->dump_page_tables(d);
+        if ( iommu_use_hap_pt(d) )
+        {
+            printk("%pd sharing page tables\n", d);
+            continue;
+        }
+
+        dom_iommu(d)->platform_ops->dump_page_tables(d);
     }
 
     rcu_read_unlock(&domlist_read_lock);
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2835,12 +2835,6 @@ static void vtd_dump_page_tables(struct
 {
     const struct domain_iommu *hd = dom_iommu(d);
 
-    if ( iommu_use_hap_pt(d) )
-    {
-        printk(VTDPREFIX " %pd sharing EPT table\n", d);
-        return;
-    }
-
     printk(VTDPREFIX" %pd table has %d levels\n", d,
            agaw_to_level(hd->arch.vtd.agaw));
     vtd_dump_page_table_level(hd->arch.vtd.pgd_maddr,


