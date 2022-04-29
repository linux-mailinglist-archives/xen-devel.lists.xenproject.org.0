Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2AE514A38
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 15:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317284.536547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQJa-0008Hd-QT; Fri, 29 Apr 2022 13:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317284.536547; Fri, 29 Apr 2022 13:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQJa-0008EA-NC; Fri, 29 Apr 2022 13:05:42 +0000
Received: by outflank-mailman (input) for mailman id 317284;
 Fri, 29 Apr 2022 13:05:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkQJZ-0008E4-0s
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 13:05:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 115f0688-c7bd-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 15:05:39 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-Ap0OAm-4O7uM4Mx6DFDhbQ-1; Fri, 29 Apr 2022 15:05:36 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Fri, 29 Apr
 2022 13:05:35 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 13:05:34 +0000
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
X-Inumbo-ID: 115f0688-c7bd-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651237539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s5jGIOq+SY8wUKwZIKC3ATH/uVXY4XNucamYnYy/Jyw=;
	b=kfQA+GXCnhRieoLicuf0bReTLwz+92PInd/w2K1HAUlAG6mp5FADEgL5wtuS9iv/XiIk7u
	P5hf0nUi/wzdMiALx/NsCxzqgYa4iXraIyvJCCbQqv8ZdE4rTOy4AKjHzLmqez46xt2esF
	+LXUU3h77Q+90NqnVe76b6sZL+wifrU=
X-MC-Unique: Ap0OAm-4O7uM4Mx6DFDhbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDkcIwaotuPqquktLULUPN2CVzOTdEa3zWbc61kPmRY+W66DkJVzgBkDfP/QMuJLGH9XUnicU4BwyCRqK7sX8Ids6h4eJrroKSudMcWvgtQabAZ09nIP0moFeAof4fKeEaMOvJFIXmubLYXpxUXrf+r8Sn0uNPnz+9XP4MslK2MWihFdQM60DyTKlV/h1MbzK1gsi7aR4DTAe2Mw044kudKbu5hXBm1oH+bXSxw7MjbxSGgUMetzT7eGOyc60Gib3e8ESADFWD7xN3BijTY2QLGM6qAVEbol8/9W5PpZU0l8SmKYgvqfxmbOglnnGDPVTlkKdwI0y+rksF20CMhKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5jGIOq+SY8wUKwZIKC3ATH/uVXY4XNucamYnYy/Jyw=;
 b=lezfqVLYcSQPdxpC/85sWnLoLmUGTXuWzoVWCeMQjUvQe3i7I/wYJPmfl9PiYqJ/CAoLER6C/N7pfJL8/aJFWxvHVsfOw9f9pTCWxJyuLoqE460rS9rHj51/RpJT61xZ0GJ75QBPlsZrrtzsV+NPsKmfd8Co13c5CjsCPtdPKEazuTsuEv4pQfWJGb/hoZAliBP6OXaRdWJcT89xCoF1xtg77cMTOrHOos/k3o4Zo6bqICZDRwo8/4ZBybXwTSYWW+waOv9mRyJYeOeFEkjV0lmO6LXtvMweDLWX6bvGTbgm5hUogSoPHHthG9cGyeA7YBQJ0nzLXB9IUijZAnbcQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02804746-c5e3-aada-7096-fbb9d04ca952@suse.com>
Date: Fri, 29 Apr 2022 15:05:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] PCI: don't allow "pci-phantom=" to mark real devices as
 phantom functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0150.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 120da4a1-03cd-42e4-2af2-08da29e0f29d
X-MS-TrafficTypeDiagnostic: AM7PR04MB6824:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB6824C1B6043E015F66BC30B2B3FC9@AM7PR04MB6824.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p2HgWZ88yGxEM4bAYKIYhDO/acDKnc3FMo5GEFb0jjVd3IEfEkIGRtOWI8n6nLf/GlJkEO2DqdEaj04f9+qxDQSHwXK6Ie+SOLcdW1RrWFKIU+uYfAyFbMvyLrvnIKL2zVYqNskDzWURmLhJGK8Qs0RhYVrHDJc4i2P9VLukNgtKbnjBRGDwK0M8zT+SBC3QsBIUFSmp9DZ+BJMYdbvyWeg3GruvN5+XwzhMVcwJtZGT+h69Jt2FHpbYlkpvtWlF/M86hvML+oIg/c3BZtweEFPJww0TyU2fdRrbL/lWrM98EO9owmQ71s/AfQFyaKInIEJ2Q27giXOBKjFbPS0aC39uZ1PFd+KH42qV/eANvULZ+f+CKZp/6N9nqgEau2MzhTqiSV/OJfQhG3sG35xcUrJHKVs2rp67bGlaCslDVlA78kQdQoxqLM8co0Gprr34pKv18U30IZrAO0cN2ceW8W4MxWgW95c4JO1wnEV89fJom9EAJ1t8iFUSN964fAdqOjczOmGnMNtuMtZqBVpq3m9bMfUBK4kDPzWIq3RV6S9XIFdSnCGpuSm11TtId2bLIZMmV/rRO2CIGA96GcITNaXzo2l6vwGRtkpGm76jFWWkNymrTFbs2i2ZQQDkpINQ+v8nO52QOWF867jedQQX33OEesC9TufUiYi32F7xP1gQNA+g7MBJrpbhwGXPdcCiPl2lG7Zs/L98KdOZ+2xqyVtlJuCj4kHwYLVTMnb/e4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(316002)(5660300002)(54906003)(6916009)(26005)(31686004)(83380400001)(8936002)(6486002)(36756003)(508600001)(6512007)(86362001)(31696002)(186003)(2906002)(8676002)(66476007)(4326008)(66556008)(66946007)(6506007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDZ1b0xMT2NLeUdEeFQxWmt4TU16TjgvNU5HS0x3MFZKcTRoY2xYOWJZejBr?=
 =?utf-8?B?LzVNQnpjSElzTmVxVGRQOWg4cGxJUXQzZkRuZXN6SkhhcDdENkVuMnBtTElS?=
 =?utf-8?B?WkVpMlVyalB1cXNJdVZmcnNPd1ZHekpPUmhKbzBMMG9pUmlXMHZFK1pVUGdz?=
 =?utf-8?B?SFZFTGt1bWRZTy80b0RHYXJDWWEvdm9iOEFvNjBLc0F6Qm1BcmVGajVUbGh5?=
 =?utf-8?B?NDY1SG1NSGhhVnI0OFQ2N2JVZzgzQUJPd1ljdkVvSGFWSzZydXd4TndSb0pY?=
 =?utf-8?B?R1prNEFkcWNNK1ZYL2E5ekN4aU5ZeDhka1Azbk9USUovdW44dE1hQSs3R244?=
 =?utf-8?B?QnRrbGI2TEFabmRUR2p0ak91NXhSVmtTUVR3T3BWTTYvbm9DVzlXUDhwczVQ?=
 =?utf-8?B?djY3N2tSS3h5aEVOY1dmVCtkOXZGaTFFSlBPSVRUckZxYjByRHBsMFdnak5o?=
 =?utf-8?B?OW55S3JwNHV3NTRwM1Q1OTlyUTFFQjJyMUJVNmRzWDIxd0dwdzRXd2I5VzZJ?=
 =?utf-8?B?UXBOZzZSb2dpODhCT2tMdEM2VDE0V3dDRlBSV3M2T2c2cG9vd2dTZzlBZnls?=
 =?utf-8?B?RXRqWExRcGUwVUxMVzFPWlR5b2ZwTE5tOVdjdkRMdXowS3Q3S3o4ZjVuWEdO?=
 =?utf-8?B?ZG0zTTRrMEk4enJzeDltMGRCZkNCUkpJM01FQ240OWxXUG9VcVZ4VElSZXM1?=
 =?utf-8?B?cHdVVysvQzZhaUtyMlN4SnRWM2d2QVliZGw0dzJCUzltdWg2dE5xdVB2N296?=
 =?utf-8?B?b3VaMStKT0ZER0VZOUQ5VWUzbGVGS0VqbUEraUJpcnhnbFNFTWVuS3FMUUty?=
 =?utf-8?B?dVE2NDhMazg3K2NnWWpQamNPQzlmRXNzelhyWElKVklyZExFVnBFZkF3M3FK?=
 =?utf-8?B?QTMyQ0gvWUR4UVp5eDRrRHYyWGpXWml5N1FIaTFnU2RTY1JNSG0wM3lQQnlr?=
 =?utf-8?B?cEoybEkwaVhZRVFVbnViZWNaMytvRzJaU2hId1NxYWpNejZtZmJKSFVGK3Qv?=
 =?utf-8?B?aVlmZGF5OTFLYUVPMmo3NUdTQnlXYklyWnBtcThTTVM4V1Z6QjRkeklCb2tp?=
 =?utf-8?B?aE5STWU1MkhSeDFIQUVIWmNubjhCc2lJQ21NTnNHUW1xT2ZZNzN6L2I1NjM5?=
 =?utf-8?B?T1d5VFN4Zk92UElGVm81Qk11dlpnY3EvTjNrenltQTd3VStFemZDcDJtZWw1?=
 =?utf-8?B?WmpNY3pYYVlqbDdCRDFvbnFMSnJOQjdoZGdmUWtrUFhLemVaZlo4RFpCSGdU?=
 =?utf-8?B?UFR2cStlVDRyanZtV0xaVWtiNnpUeDI0U1dQekRoNW9sbEk4Z2plVi96bXZH?=
 =?utf-8?B?RlR2UmVHTzlncUk3bkNIaS93dWxqRENTWUM4RG83by9ZakNaQU5FSzhPMFVP?=
 =?utf-8?B?Um1LV0pGUUg1elRlbFBsMWhFUS9HemJJUlp3dG5PaXYvVUxCQ2I5dC9Rc2dk?=
 =?utf-8?B?TFBXRGFyS0NadEc1S3pOYmlaYWZ2bmlFZnRwQkYxbUlqUmJodkh2S0VXeU9I?=
 =?utf-8?B?ZTR3K1lJc3NMY3ZDWWtadjdMeSt4MTRFUHlMOGFoNHBCaVJRSGI5WGZ2VVhP?=
 =?utf-8?B?emhyUXdWbENCSjY0Q1JjdWlxSkYzL00raWZOYjlrVkoyd1hVVDJMMjdHVnRu?=
 =?utf-8?B?MXM3cHBMeE55S2xlQzM2VnN0K0hDMUNqQWZ2WU9XZHlMSk5uR1Bnd05tcXg4?=
 =?utf-8?B?bEVrRm1oL0dXcmM0WTVXdHhvTHcrUUhXb1VGaWtWekRmZTdBcmd0ejF6bUlG?=
 =?utf-8?B?ZHFuRWZ5OWtRSFdzTG9Mbmt6U2VPdTI0dUZKaUtwK1VnSlR0cm84OXl1MWt6?=
 =?utf-8?B?dkZFUXBwRTF3RXFsZ3NVbnZwS1lobEdCK2xpUVF2THphL3JsbGhPNXFBQmll?=
 =?utf-8?B?QVY4NmxMeFp6dUNMNHYwSXhWUmRBQWZjblUrdURLaEg1dVRwWUNvcGNDbnJJ?=
 =?utf-8?B?RFhsQy90Y0oyZEw1clQxbjVSTWdvV1BVR29SN1R5L2lZV3RmUU5vSmVDeXNC?=
 =?utf-8?B?ampqbVBtMFRuWGJhUUJYQ05qN01vQnpVTmJPdUZkRUFXRVFMNkhCMzdIZm4r?=
 =?utf-8?B?eS81a0dvR2RxR2htS1ZCNVRqMlZPQUlqalR3ejBnQ0I4RUtpRm12dEswcisr?=
 =?utf-8?B?TlY2NTI1d3hsa3VsOGVST1JROGF2ZXBSdEZmTEsxM2NKRUVXVzMwa05Va3lO?=
 =?utf-8?B?U2pkSkJlakFSRHlqUGVJMloyUVhDdHF3ZVV4OW9VV0o0MUQvY050QWhqai92?=
 =?utf-8?B?cXIyb2p5cjBlNFZtcW92bmY3dThPTW1MS1NkeTZzTnEwUlJDSytrSHcwMGxC?=
 =?utf-8?B?eEhoQnhqRE9LdlF2SGlEZkhRM2R5RE5YdURtTFJaWmNjbFd1TnQ2QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120da4a1-03cd-42e4-2af2-08da29e0f29d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 13:05:34.7552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHfugmuCghoARn+PJYgX1iKyzyEIkCnpIVcqExC1ywRz3e5M92H0WH72T707N8OOc7ifo72U/a17WlzTtGMtNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824

IOMMU code mapping / unmapping devices and interrupts will misbehave if
a wrong command line option declared a function "phantom" when there's a
real device at that position. Warn about this and adjust the specified
stride (in the worst case ignoring the option altogether).

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -451,7 +451,24 @@ static struct pci_dev *alloc_pdev(struct
                          phantom_devs[i].slot == PCI_SLOT(devfn) &&
                          phantom_devs[i].stride > PCI_FUNC(devfn) )
                     {
-                        pdev->phantom_stride = phantom_devs[i].stride;
+                        pci_sbdf_t sbdf = pdev->sbdf;
+                        unsigned int stride = phantom_devs[i].stride;
+
+                        while ( (sbdf.fn += stride) > PCI_FUNC(devfn) )
+                        {
+                            if ( pci_conf_read16(sbdf, PCI_VENDOR_ID) == 0xffff &&
+                                 pci_conf_read16(sbdf, PCI_DEVICE_ID) == 0xffff )
+                                continue;
+                            stride <<= 1;
+                            printk(XENLOG_WARNING
+                                   "%pp looks to be a real device; bumping %04x:%02x:%02x stride to %u\n",
+                                   &sbdf, phantom_devs[i].seg,
+                                   phantom_devs[i].bus, phantom_devs[i].slot,
+                                   stride);
+                            sbdf = pdev->sbdf;
+                        }
+                        if ( PCI_FUNC(stride) )
+                           pdev->phantom_stride = stride;
                         break;
                     }
             }


