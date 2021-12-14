Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42614473DCC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 08:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246407.424944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx2ZS-0005t9-5q; Tue, 14 Dec 2021 07:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246407.424944; Tue, 14 Dec 2021 07:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx2ZS-0005qw-11; Tue, 14 Dec 2021 07:49:58 +0000
Received: by outflank-mailman (input) for mailman id 246407;
 Tue, 14 Dec 2021 07:49:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx2ZQ-0005qq-QP
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 07:49:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d1a9622-5cb2-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 08:49:55 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-7eMg2ccLNUa8O9o7ae_FAQ-1; Tue, 14 Dec 2021 08:49:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Tue, 14 Dec
 2021 07:49:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 07:49:50 +0000
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
X-Inumbo-ID: 6d1a9622-5cb2-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639468194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8+oLCtYggJm4G6Tji4xf0/Xj8/spbfK/kmwNCdTV4D4=;
	b=cq5CnsT0regrMbrTNE+bydkLHeR+gXgCsBu8BXV8peCR4BD4GwQliXi2Vu4MvGPalrApQi
	UOQnwUc19aZHPcSQScLlF4zIwda2ERPAlLfBRAHWkAPcFZQIKvnfFxLmP62yuZYyrTj7ug
	Kv+heraELxEM0vpjlmaIX5ISHwMXm8s=
X-MC-Unique: 7eMg2ccLNUa8O9o7ae_FAQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCBQZ7GDqfVkcCm5dvmsKb5XW/u96h+tEeM9tVgEGv0Oj+2Qx8tXf8+PpsKX1lBtVaOsjARiT99TsWZVlYVtOVLXMOJjg3r6dfF5uyPOZgYNg8gRkaL1x0AJ48pTmBxV0uAWlrl0mu2MiuGtfGHqMAqlhfzfsxDhbELHowc/fUgPL9DgHeGAvbG8r+EQuQIhTNiB7o92MAHijng0cy7ap4jQ8V2fA/CTKlTRF2YMobtF0aUfnjBswVOyg1AJUa9s/MuyD8C/m5ag/aC6hlWjEQJuWfOqusQSgbnCYKj1kzWozFTDVrmwET25NY4LxMKHtjAAfKCE2nu4DjossRrbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+oLCtYggJm4G6Tji4xf0/Xj8/spbfK/kmwNCdTV4D4=;
 b=a/lwlEnp1mUyc9MBJUL35IAjRsUgsJZGNBQmEaJCRC5KFLLutAEq333Hk2fNIN7OBdPX5WeCq0xe6ccS0+MUKzJfdP+zTMTU67utvO0KxWHIiXeWv7RGhPqK5Ya5XnHKrU3cJIrXxjjlmqWCFKImcwrgQlN1ltSfIFyG9JNjj9PT8kV+qsQwyq4rAybl2xuXY08NSWLIAVwxk3KykGlm0vNDHHBfvagxULjPuT/NXjUvFTWwGrlayS3ZdMhdD+m66en7jus/3V0BRuTYVomEut8UZCb4amat1MvKUV4NgfNzR/6XbrsixRIZIQ09SKsH6gVLK0OMZsXGf+SrEXk5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com>
Date: Tue, 14 Dec 2021 08:49:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <stefano@stabellini.net>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl/PCI: defer backend wait upon attaching to PV guest
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0003.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37747619-7006-4db8-df3f-08d9bed64eb9
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63012DC21F50E1BD3DF431E2B3759@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rYDD0lTYQETvaV210PK/Z5iojtrm0CpsjGJLMkPyfSrZxbetuNIM8U3KbJ2GmTcP51MCtX8y/mQpMUqgamPjri9eVdhX7AG8UJpIoujjPCsLCQ/pS2/uhTrkq++XKGIC7EedgYJJiOFyqWwYu8Zn0rF/tBlEj3qmTrBi7py5+1MQTQtLI9XjDaUJm/e1K61Zw+K976afumGeTHQ/0nLhV0q8m9gj1QAwR+eM6XruRgVkaGn2nhGx4WlOo8WSHKCQeAy/HQhxYcgGkzMQwk5b/iaP3U4esEvN9U0JWMuA3ydw6X95zUxBaWHUf4IKuIBdj+cFsQY+ymGmhjtBoeLkbcSZWTooDWdIKtLsstQiyBvzOkwETzWEPZaRQj8SbWDqgHj0pArPHCOwtZnfVHRoznoToA5nxoKMA/Gs1pCnFU2FZdw8zHBJ/liaP/DRcNvLn7VUWNK9hcAmGVqtAEEvXvCpR3GD/EZ8pUd5Uo9PAJeNgpyouS2WXCbq/XYJ+cBJurLzGw324yJrdHIAXTC1nIAMNQsu/CLldgl5LP2EqUePASM2P3oqBOqsJ6wtDJJvh7A4tJhG1HnP4III5xVSHELk+MbMX43LDuKLhs/sOLSo3con9Yar6z/9776Hi/7VIZB/NQ7jNN80MAZwnBv+/WjKtPEbP9fDmiGsj1WSSaoGrHgNqNWByouy2dorCZSNnizwTvEuutzYsOJ+5SCnNDF70HXOW2kpQaCasEC/yQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(4326008)(6512007)(186003)(8676002)(2906002)(31686004)(2616005)(8936002)(83380400001)(66556008)(31696002)(316002)(5660300002)(508600001)(66476007)(86362001)(6506007)(6486002)(36756003)(54906003)(26005)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWRubmpjL0dmdHVWNHpsSUljbzJsWjBUd01jcC8wRmhUd2w5UTZnTkExbkRp?=
 =?utf-8?B?MGVrSjdQdytxSmVQc2ZGeEdlT2RaekFwaGVyTTBCOVpSc2xSZksya1pkOFNv?=
 =?utf-8?B?V1RUR0dhaGNmV0FYMks0eld2ZG93SnZXQ1BBTFZRNTZnek92Nm1ReE0yeEhQ?=
 =?utf-8?B?d0ViT1hReGVEOTkzaDBEd2RidW90RUU0TnpraXdPVis2UkovSzlnT3dlZnhx?=
 =?utf-8?B?K1pIMTdoYlJHSURIR3VGQjkvSCtPQUphMkZadlE3eE9Mc1RGZk1FSkQzYXhW?=
 =?utf-8?B?WWF6dVpkYVNhLy9mQ1FSN3dVcUg5Kzc4eTBBZXEyMWF6aWFhN0NVYnoxenV1?=
 =?utf-8?B?d1hXNGZXNGo3emZUR3hOQ2pRWWhuTnFTOFdjcUVPWkZ5Nng2TDFoWXVPazZT?=
 =?utf-8?B?S0ZwSGNGV2lqSWIrYTY2UzQ5dVA5dzZpTVhmK3U0R0FkbDVWVmwwRUFEZjNY?=
 =?utf-8?B?ZjJFa1hDUW9qRHROZGo3eW1DbVBtQXR2SGYrS2FpU0xQY0FldytadkN0d05I?=
 =?utf-8?B?dlQ1SXFyT093aVl5M0NhRS85OWUvb3RHemZ4LzN3ci9URXZYbjA2ZWlMVUlp?=
 =?utf-8?B?dVdHazRId0VoeEtRcXJSU0NqMWxIS3lmWDFMTklaM1pmeWc2NmNTd3hQWnZt?=
 =?utf-8?B?YW56eDlGYnhncFdvZ1FZSGNVS095SmQ5d1dXc2hTYmhkRGZrZDZxN2JXWWRE?=
 =?utf-8?B?dGRRVDgrRjFuWVlXWVpmYitqajI5WlJDVXBRb0cxK3pXQkdMR0tlQkNkVkYr?=
 =?utf-8?B?Ni81am5xczBtQVduUVBhL1Qvb1JXSVg4OFQrUXUvL1RRalVIREhqdVdJSEpT?=
 =?utf-8?B?VkNoNmY3ODZjY2FJSkZtRnRDbVB4WUxkRlFSd1FKanhZa1F0cEg4SHpaYVlS?=
 =?utf-8?B?WElmbE9jM3JSaGcraFk3dXpXaS9tWndRNjhTRHpoMmJ6RHhpeEdVUlhLV0hW?=
 =?utf-8?B?RlN2TEIrZmdPeEUwWDE3TngweW1DTHFwSjM5Ry9FSWFMb1FoaGVNazBWZ25S?=
 =?utf-8?B?VjBuODY2ZGpsT0haQldKUjhKdXBFWmF6ODJId2tsTEZzSWRDNWVuMkJzRWVX?=
 =?utf-8?B?TGMvSEoraGk2OHJNbFh3blVqQUU0cFJYbFkzb1hZNjVBUUdQZ0o2cjFEVmth?=
 =?utf-8?B?T0JoZitoejN1dnpmMFhRL0xYU2t5UFJJRDVjRjAzVUlWVlQxTncvV094dlRx?=
 =?utf-8?B?MXF3WHpHREtUMThjbzc0UkswaStld0crZjUvNUhtb0pIZmd1bkVXVmliWnZZ?=
 =?utf-8?B?bGFNZlBjL3RmWVJURmdpMFh2emh4TmJ5NFk5TVREN3VtbUJoQ0VJSEdoSG1j?=
 =?utf-8?B?NkhlTFlaNElBa0NaV3hQWCtoWW44VTN2YkE0YXZ3dUlwY0NsWExzMTNObHhO?=
 =?utf-8?B?cml0ekxBazVFZDZtYXBRYytyZlFEQXd4c2Q4QXJJQnlsMnU2TUxmOWI2bzhn?=
 =?utf-8?B?WUFTRGcyUnFqSzYvM1QwbExMNW9iK3lVaE5yU0V3cU1MM1RMRjNKQ2cxRmVy?=
 =?utf-8?B?K3RyQzJ6SENQZTg1cWEvOXR3RWtMRVg3dHgwZTlIVzA1WEY5eDExbzlzZG9a?=
 =?utf-8?B?R3N2eVF5bEtEQWtkcUhMRjBlTGNocDQ2S3ZQNWxRdmVsQ0RoOUhudzQyckVz?=
 =?utf-8?B?Yll1U1RlaVFDZjBzTVF4T3Q0K0ZZWkNuVjIwRkJEUDRwbTNEVURUc1BpRWdS?=
 =?utf-8?B?RUwxcytrK0NsZ3VvTmdnZG9wa1dXTXdxZFR1eTNwalpIZ1NJbGo3ZVVucW16?=
 =?utf-8?B?MFhJZEZ5RmVZRDRnQitOMGZJcSs3RzZURlM5RndjOUREK1RZdXlGYk9JTGhZ?=
 =?utf-8?B?aFlKMTBic3k2bnpPTWdGeUN4dzNUSmlaODF3by9tb2E2bnVoM3pvRDlUNm1V?=
 =?utf-8?B?ZHRmbEhHWFJSTlhtK2RYT0krSlpVMjBWcFV0RUx1cmtWdnNqTGNHRWJCdUsx?=
 =?utf-8?B?KzA3UFp0b0ZaNmhOVkZjbmJGc1l1eTFLSko2MlJEcCthYWlEbzhtR1ZCYmhk?=
 =?utf-8?B?VTJreWg1RjUxb3RjMHpqSGdjTnF5RUZUTzhndURqVFJaQmx0RDhoZDVORTNW?=
 =?utf-8?B?c21JdEpPQmJITmRrREZLZmhmUW8zb1ZQWDRGZVplbndhQ281RDdhRzBVZFJH?=
 =?utf-8?B?S0FFOGdJd0J3d2xhTEVBV1ViRXJhYWxlRkUvdXBJa2VQV2MwYUZGaDE2Y1Fm?=
 =?utf-8?Q?0SvhXxX7mFgZ0WOiH2wrh38=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37747619-7006-4db8-df3f-08d9bed64eb9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 07:49:50.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILZBAAGXVZoLHs/FLhDWvMy4+nDbIp1Mv7FyGmzBogCk3nbIcnibY3Xq9CAOTxjh83Bc+3lib8SlVMAtOCnDnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

Attempting to wait when the backend hasn't been created yet can't work:
the function will complain "Backend ... does not exist". Move the
waiting past the creation of the backend (and that of other related
nodes), hoping that there are no other dependencies that would now be
broken.

Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are reflected in the config")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Just to make it explicit: I have no idea why the waiting is needed in
the first place. It's been there from the very introduction of PCI
passthrough support (commit b0a1af61678b). I therefore can't exclude
that an even better fix would be to simply omit the 2nd hunk here.

--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -157,11 +157,6 @@ static int libxl__device_pci_add_xenstor
     if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
         return ERROR_FAIL;
 
-    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
-        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
-            return ERROR_FAIL;
-    }
-
     back = flexarray_make(gc, 16, 1);
 
     LOGD(DEBUG, domid, "Adding new pci device to xenstore");
@@ -213,6 +208,9 @@ static int libxl__device_pci_add_xenstor
         if (rc < 0) goto out;
     }
 
+    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV)
+        rc = libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected));
+
 out:
     libxl__xs_transaction_abort(gc, &t);
     if (lock) libxl__unlock_file(lock);


