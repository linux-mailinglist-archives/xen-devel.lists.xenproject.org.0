Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B105A4F61FD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 16:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299935.511286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6tg-00080f-Cf; Wed, 06 Apr 2022 14:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299935.511286; Wed, 06 Apr 2022 14:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc6tg-0007yD-9X; Wed, 06 Apr 2022 14:44:36 +0000
Received: by outflank-mailman (input) for mailman id 299935;
 Wed, 06 Apr 2022 14:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc6tf-0007y7-Os
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 14:44:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 135ae4fc-b5b8-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 16:44:34 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-O-OgIMrePVmZKnMezWAYVA-1; Wed, 06 Apr 2022 16:44:33 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4560.eurprd04.prod.outlook.com (2603:10a6:803:6d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 14:44:32 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 14:44:32 +0000
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
X-Inumbo-ID: 135ae4fc-b5b8-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649256274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0bgJSju+vdmXtXwH09gQNY2F0IdkUhfF3FPg22gDVs8=;
	b=YB4w3WkPmuJn7Tku5ki5mAgCrDkT21klYVmNKpNda+3icWYcBHXVB+ZDNa9uD9gHsf3owM
	q8c0pREzJS/wDXz8T1Fq1Ek/QIUcC8lxHC9bFEwAQi4K4pNbwZbgMy6tr2jNKiESOtBbXb
	jAZDQZ9ATaE+0rB59PXGAOHUPh5Q57o=
X-MC-Unique: O-OgIMrePVmZKnMezWAYVA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGF7manSXHSfOWjP/vLdYJmqWCZWfx77J0Xix7ken5zgYZt5d5dq47/7oga+unAZcFJBU6QmN+S/EwaKbhJh8VMgH9UGQ9r1AMiZL+3h6etZy0ppqnnko3fyAM+YbpITIKiAjO6Q2EqxCwbA/EnSM3Tcw8WP/rhLRjIb//JgDfdr08zUn0yEzMkSRg48IIa7w+0Zd7qJDCUCEaarSjgV3DNObUvOxsuQpY7uuRsqOMNoQPA2YblHIN+i0hVwQPJJfqXRGcOAwm6LeqRYkanAx/MzCcANNI78cQhLUJxkg1m5MpI6SD5zUYa6rgod658SlwLQE7za7uQ8FdpK1R0zDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bgJSju+vdmXtXwH09gQNY2F0IdkUhfF3FPg22gDVs8=;
 b=BOkxYeHn1TnOWsd9b5R8m9wxl7lReAXJzVkA0riihBa74xIUg3N1CZu2cU7ObWg5BzYB442eaE6XO8G86J0Stk/SamST7O5BrVHehRJS1ZaIphxeA7qu68JJ0FyRgWix5be0o9tGsPEQSPNzqAMpJN3NIB7UQG5Cym3FKVfthVgML4Kqj+3MfsFvnk1KX4AfxtxAX3jmWbFoTAw2JmXYVixHJ2WLn0OQqnXAJpNq/gBX/8lRyCLD0wcHNy4edDIrnWp5TCiwY3+93dIR87uui0EsFI0mQpWNaiKJGP6Djm5LCpUTjhOyEi1w0xTHEM9iPGzLiAUtdUqklVv7wY8Z8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c49e4cf-9d86-e630-a1bb-37afdf091c99@suse.com>
Date: Wed, 6 Apr 2022 16:44:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] SUPPORT.md: extend security support for hosts to 12 TiB of
 memory
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0196.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40d9a057-a3c0-4014-00ad-08da17dbf639
X-MS-TrafficTypeDiagnostic: VI1PR04MB4560:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB45601CCE50E9C1B16D19F477B3E79@VI1PR04MB4560.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BiefOBBboYpNSfMitqsuBuO8tmCnauCn+Yw29t5FlRcaUtHb6IKa6gxBvXgKKM0IerTw0SWQTHSiPeHhRkte2HjnLLVa0zRAonmh1qhJSbu9XgjiWtvZh8Hk2PpiiRI5kT918wN7OghD63pnphbL/t+LPkQTcMc5TH6G27ZZSZ4ql/lnUsD1AuaQkRZJYkow+spohn1EQPSmOJKu5XEkkEeKOKOdLC2m3bCQLKeqUzeILyPmX2DY7q98Vj1hbo3gLV/PwawqNGwawq5S4340WFgugg1zx7oxvIgHmxrL6MMW06/WeVSWw2qU0xDU8hQrMmVJWDVLn6NtMfbQEwKriGghuX7UcuOHUcn8PujJhJ1FPeSToylunM8VAfwRYTtb/eCZhTATzsmASbnuUorehWoNr5xqD30oo367R8FNcZQHz4tPHqF2mUNOe8Ep934XaUbjpz3YuulD2O3TnL77B5e4WhL+LUJx7Ssr9RRi2wZQ+9Umz+xd/62r5dUZNZAulFDaHo5h9k6Sa9lhEOQP/S2q2BivctIi/hE3nA9OqQkewgGfEzc9DBNlpqtuiYLe//29MgtY73rBrz9H/bBYvaxrfUTqA/jnYmpepKKA0d7hF2AQj6y7Lp8cgw5a4hCMbHSLtDq08sr+di84BKuxU09/q/TWZCM+83QFiEttvDvSktVc88/3ZFRQt6gGbJc0RdmadXLYoIeaaHCHyyxoz4aCm0q+QbdIEyU5VpD8AN3ZRqqSjn2Dv0Xdn6Fx/DfsBiJo9KZAk1NigqfoD/4qVgG27A+G+aYMQdleuHUcz82gkxCOcBbA4ZZKvhKrjNjR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6506007)(508600001)(966005)(86362001)(66476007)(6486002)(6916009)(316002)(66946007)(4326008)(31696002)(8676002)(66556008)(186003)(6512007)(26005)(2616005)(38100700002)(83380400001)(15650500001)(36756003)(31686004)(5660300002)(8936002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHBPdWxhUWNOOHRqRUtVUVJkZUlGM2VUWWRxVEw0V2VBK1lOZjFZRCtseW1i?=
 =?utf-8?B?YmZUWEMzem1JNEE3OEZzajhWNEVoeHltdGRpdVQ4QmJTbW04akdRWFRGUjN3?=
 =?utf-8?B?MDlzbXNuVUFVQ2ttcTZBb1laR09heXJqYWtabEtjQmg5QmVoQU9SUTZFUXM4?=
 =?utf-8?B?SkdtMG92LzNGSHlMMUI4MWNhL25uVEhYM3h5aytpU3I3T1BVN2QzQWFZbHJJ?=
 =?utf-8?B?aEQyUjZ4RS9nYUNhMDhlUXpDbjBSVnNLMUxjUHdWaUw3dmZjSG4rTUFuSTlJ?=
 =?utf-8?B?a0hmQjNkTVRvV0Y0R1lzUG5ZeFd6RDliRnpzU0RQM2pJYUI0RERneEl0djVK?=
 =?utf-8?B?cDlvL0kxZmpwUkxtMWNjNmNPTFRiV0lCS2lJTm9JZ1Z0UE0zRkJPbFlzU2Na?=
 =?utf-8?B?SVVQM0tXZFpxVXVreWNseTJyK1MzL2IxaFhtZTJkWjV2RmtGNlYwNFRHS1pj?=
 =?utf-8?B?emR0M0RXZExlcE12Y3BKNGNVYlFmaTFHa2FRVGVLN3UyU3g4aEpObW5kM1Qx?=
 =?utf-8?B?RE9qTDhxVGN4VWtabWZUYURHeE5iQjQ5bEtLTytwekxFajVVcVJOdWlCYXZj?=
 =?utf-8?B?MEs3dWI5RHNNSXd4UjJZNjhkZHg5UW5jc3Q3UXBCVkdlamV5Y3c1UjZoTzV3?=
 =?utf-8?B?d0VteEZUcGtVVnJjb3FzbktyVzdSQ0o4QWtlYXR4Mnp6K1JQWHJGN3FyMk9V?=
 =?utf-8?B?d05jTm05YUlHSHY5TlVQWEZYcWJuUXZ0WWlVWkxEaDFDblorR0pqR1VGRmNF?=
 =?utf-8?B?VkxTcHdiK3gzMmdsdEJlb0FFQ0Rac0ViM1ZkWXR2UFdISTJqUm9PN1FTVVIr?=
 =?utf-8?B?ZnJ3K3NIbHlRaWNVSnRRMlhPR1NucWVxYzdzRDJISGpIMmhqWkltUHFmUkp1?=
 =?utf-8?B?RGNNbExDK242Sy93TE56VFA2ZHNneTFlNC8wMXBaY3dWL2JzZDhFM1c0NU1H?=
 =?utf-8?B?UWlMTWpwNzQvRXhYd0g2bXVvbXZnTEdXaEJJdlU4Sjhib1FFazVyL3N2TUVx?=
 =?utf-8?B?a2l6MWpKQXZsVEMveGo0azJrUCtvM3A5SkY1RDB0WTJtVFdMU2FOSEJjcUFu?=
 =?utf-8?B?SWU1akJ0R2xnc0MzQjNjQ2JmcXBhRUhpZ1RKVXJ5OXFaN0lmS3pRQ1hqd0FX?=
 =?utf-8?B?TXNPSmQzdzJYb0VrU0ZJbHNPZmJmUlM2VnJyOW04ZkVZSlFJUGc3a1VGeHBM?=
 =?utf-8?B?QkRJVHVYL0JMQW9MYy9hN0w1Q0EwcW9WT0toUEtZVUhvcndsNDRucmp6aWtZ?=
 =?utf-8?B?Q00rUTEzbTRxS095TnlKY09ZV3hMWlQyc21Udm85YlFsUi9TQmNYYnJHaDEz?=
 =?utf-8?B?eC85TlJnYXhlT0dweDFCMXBENU50b041UUN2UHZGUE9pM0ovOGZTcjRjck5E?=
 =?utf-8?B?RUNRTUhlbERtV0lYckZMR3lPeEgySGhtM3JYeWFFNVl1OExQL210K2FHdFBO?=
 =?utf-8?B?eEg3VTRuajJQR3NtRnZ1TUFVN1dKUVE5SHd3amtGSFB5dnNDalVXUjd1cm5T?=
 =?utf-8?B?NElwVXZpblgzN0R2dFNwSDU3S1N1YW5aMWZQZzJJckZ5RFhwSGtKYVQrazNF?=
 =?utf-8?B?Q0dCR3djOVFabTRHcVVOZXowZkQrTlpHSUtDWnZVSTNYNnIrSVVHRzNjdkYz?=
 =?utf-8?B?SUMybUZtbGp1R1BiRjRVb21oS1l6MVRURitiM3RRdDF2UEd3QkZwcnZYdGVY?=
 =?utf-8?B?ZkxpNzFkNXFaYU1mZm9qaUJDSERkSmZkVHJVMTNEYStady9sN0x2bUlwY0hQ?=
 =?utf-8?B?R3BDLy9lS29lMXdxTUNobmdtbnp1ZkN5alZIVFZFMS93eU5NVnZhREN1UDhB?=
 =?utf-8?B?dXkybEZ2end6Nzdwd092VW5qQlFzMVkvNDlPNlZDL1NTRnVvdDZPZDVvNFJx?=
 =?utf-8?B?RHdJTzdmYmp6dEJ1TWlCVTZhS2drc0ZVdkJIUXlTOW8yREJubTd1ZWVFN0lj?=
 =?utf-8?B?WURpS1dMK1dEK3JFVlFVVVZ5dzBydS9hZHMyaWE5VVdObndTd0ZGczU4azFB?=
 =?utf-8?B?MWNGR3JhS1JsaVFHdGQ5eWpEa1d1alVFYlBMUHl0SlZxSlBsT3B1Rm5GdDcw?=
 =?utf-8?B?c3FqM2RWbUxnQzhCeGpKZFdwWGh5ZkdHcHVVWkdsSzBpTkVLbm9aSVZ5Uk9P?=
 =?utf-8?B?MkZybVJUU245ZmZMUlJ5bCtXUVRmb2M3MmxxZ2kzTU92WUlnZVB6Z1MxN3BO?=
 =?utf-8?B?d2JFS2VPS3RoSUdZVnVFUkFxVkhHYTBZYy9mRzhOM1JUSDVZZGlKT3Z6Snl5?=
 =?utf-8?B?bVdxVCs3clYrSkFvTyt0aW02ejlUNUZIbk5yaXBBRnBhbTR6SUxwQk8rRGhQ?=
 =?utf-8?B?TXh5Um43UHRVS0RsZUExVXJVb2FNUUNkY2pSUWQzN2FNVklIcXlCUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d9a057-a3c0-4014-00ad-08da17dbf639
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 14:44:32.3960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7dQvxpCXoJGz/WjHR+wzHswkjJQHKLEwWhbc548r2J6/u4wl/vMDsD1EdPKvYzoxRxw00A/YhMb5su9joS4nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4560

c49ee0329ff3 ("SUPPORT.md: limit security support for hosts with very
much memory"), as a result of XSA-385, restricted security support to
8 TiB of host memory. Extend this to 12 TiB, putting in place a guest
restriction to 8 TiB in exchange.

A 12 TiB host was certified successfully for use with Xen 4.14 as per
https://www.suse.com/nbswebapp/yesBulletin.jsp?bulletinNumber=150753.
This in particular included running as many guests (2 TiB each) as
possible in parallel, to actually prove that all the memory can be used
like this. It may be relevant to note that the Optane memory there was
used in memory-only mode, with DRAM acting as cache.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -50,7 +50,7 @@ For the Cortex A57 r0p0 - r1p1, see Erra
 
 ### Physical Memory
 
-    Status: Supported up to 8 TiB
+    Status: Supported up to 12 TiB
 
 Hosts with more memory are supported, but not security supported.
 
@@ -121,6 +121,14 @@ ARM only has one guest type at the momen
 
     Status: Supported
 
+## Guest Limits
+
+### Memory
+
+    Status: Supported up to 8 TiB
+
+Guests with more memory are supported, but not security supported.
+
 ## Hypervisor file system
 
 ### Build info


