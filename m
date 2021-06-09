Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 908BD3A0FB2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 11:30:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139117.257351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquXg-0004W6-OL; Wed, 09 Jun 2021 09:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139117.257351; Wed, 09 Jun 2021 09:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lquXg-0004Tr-Jn; Wed, 09 Jun 2021 09:30:32 +0000
Received: by outflank-mailman (input) for mailman id 139117;
 Wed, 09 Jun 2021 09:30:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jMcQ=LD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lquXe-0004TW-U3
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 09:30:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73802cb2-9a11-45a0-a412-86b413ab30fc;
 Wed, 09 Jun 2021 09:30:29 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-5M9f1GgPPx2bXU4qQhSa4A-1; Wed, 09 Jun 2021 11:30:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 09:30:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Wed, 9 Jun 2021
 09:30:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0200.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 09:30:26 +0000
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
X-Inumbo-ID: 73802cb2-9a11-45a0-a412-86b413ab30fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623231028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5nH2cLUYwbL9eZj4RVdVH4PyeqIGtsVVYtNIc2+3fhE=;
	b=jPadiLvU9fJcOWVNjaPhJSLgSLsHFJMz3egERGm7bYxhwP+yq3C2xHbl38W/LSUxOjhM0g
	82cWwvl/Cec7ss3OIHGStn23dMQKIYtTOvtO8hAPeiDhw7dB3zGRSBr8ixLGLT3xgtDGB5
	6PCrhGJDsm1FEAOM/pvB+lip6MdYu2I=
X-MC-Unique: 5M9f1GgPPx2bXU4qQhSa4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImIDXGNG9/FmVvN2d7Zi9tdJVASKGOp6Z8qOjElAK9mHDeyD/xYAirt3hChk2b1HC1fU56o8kNtxyIR1cQFZT5PWGZOZSWHlVjJDKS358d6nBx3IjcVzXdtS12HXHZn6xBVMKlnlK+kw0p02ndwadzSDlxjPkAP3Gi+xaQfnhJFiTNTgq1gyKSj5O2M6iUB+ycCiiFunUy1nODv2sjUg47PllUOD+zujU1gKzIOWvlcHX6VbkhgRAzKuNJMX9WRl5xZRQIOPAMhDow4cYgh0+bw7rmQkkyZyRnhU/WIPvSg6cTDBquTUQF1xnXJ5WvrF3uvf74WRXa+nzQqgB5FWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nH2cLUYwbL9eZj4RVdVH4PyeqIGtsVVYtNIc2+3fhE=;
 b=odxcWpgCSjkENwR7lnXWoLrV9nOiObiedgM1IrtPLgIE3uj3CBmqVKes5cpq3v0UQzCp8DvVVcpcyblLEtvwa66tUR9z7pCbJ+JcZ7Uv88vlJGNcNVOIwBmiyoMIwU99ulmIU2rB/3o1UD7FAtGWxABcCzV7a4Fax/IV00XX6ZeBPOSk0m+S+mcdnhYfFU4iS6qcSR5f+PwD4JOjKguicU0IJbrzUC8MwnKl+DvV8moREdQU8BuVUj94Vf6vFT/SronTeURxVBSdI0BKDc7Wq6r3lVkYnl/6yOotXv4CiiC3eui38Saqhng6MZcBcWRD33tYIOiaS+BI/iBse4UlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 9/9] IOMMU/PCI: don't let domain cleanup continue when device
 de-assignment failed
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Message-ID: <1a7b974c-8dee-3422-28fb-4118fe145b4e@suse.com>
Date: Wed, 9 Jun 2021 11:30:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0200.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 028593ed-253f-4c57-0fa8-08d92b2936d4
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48450EBDF1B3E7AF338E0F19B3369@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o+kHryYSSwj5I0KtqDAzspLPbhoVAJxnrSDdtBSLQWSnhjTMP4IUVfqAeIGAFm/D8PNpfKum2xhNaygRm4iFZFPgC5kWLdUiB2vRCR6YwV/O0ejmFU3Y11J5f4+jYvFYxWBNX281BADBJ4WwIlfn9brPiruuhOqD1wFR+q9rlUuxwmwuLIXyMEkwei/c9LTct6xRhGgCPVVx8ILQ+Pfy76kaAplIk2jqGfozTt/DMxBfjBOJ0l+fySWqmUWWljQYTK8kUFo326Q1LtojkpzDDNDHp6vfXG5ljDfVZhxxwmHbwRIzYGfB/T8sYAZoTxKUIN3jS4ApwHsHH3KuFE3OrONuVlJNjFaUClhgufXr1Ec32bg+nhIrUKdKzQygcxUv8mIF9Zy79zHTzfD+BizbFOOMw9VJn8Toam4IbCEofcKPs/osylgy5ljhGetar4+ebcuyuBkcGLEXEZcQohLlxtbGFZ98mVSbgU2qpJa7zWmiGSaF4m93M7VDCI+1ecHhNJ/D79Pt5gcQWWgBLSoOSJ5tV7/2CR6aShmxP6U9fdegHhiU+mSePx7g20AzLE8ipdKtblauE2+WCuyRWfRSaPjS3fKnsqtvXb6dduU7PfLWZAzU/oqAn2+jSmR4xqIkjaMIwotE4LIg4ieMvfs1z60hs5kh1gx7TogLCQS5FaKk+wt0gKh0+kdYqrqcEa9s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(39860400002)(376002)(346002)(316002)(478600001)(86362001)(8676002)(38100700002)(83380400001)(16526019)(26005)(186003)(36756003)(956004)(4326008)(2616005)(8936002)(5660300002)(6486002)(31696002)(6916009)(2906002)(66946007)(54906003)(31686004)(16576012)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?NUwxWjdjOHhQVm5RUGtkdXBNTDBJZjZRMmJMamxvMjZVbzh6QnRWUHFXVUJC?=
 =?utf-8?B?MDBySlh2UmhtZUhwNkg2ci9CNG5GYklzaVFiYStManFmRmY0bFUrYXI0TVNX?=
 =?utf-8?B?QzJ1WUxndTlCM001UnNrYlFMdnN3VXE5UW5mMmJoVGtIRjdZSHZuRmkwUEVl?=
 =?utf-8?B?RHpZLzhxb3pFWjhISDlyeGNqSCtEVkVKTlJPN2VYdkN0anRsRkhpRUpsVkVo?=
 =?utf-8?B?VUFFM2xrM1BPcGlES1hDaERPMThNeHQvNWtudkpRdVFnV3N3ak96ZVBwdVhN?=
 =?utf-8?B?WGpjSTJvVTkzUmU5cytyRnliWCtLQ2hwY1lISHcwYlBwNlVUMU5RcHhwWTc2?=
 =?utf-8?B?bzA4d3d4YzNXNlprNXZEenBTd0ZpZHN6dGxRUmdSSFd4MXlEVXNXM0hQZXZV?=
 =?utf-8?B?b28xYVBuNXh4TXo3TFNEczFzdUpBZHFyN0FCazZTNVMvMndRY2lVUGM0c2lt?=
 =?utf-8?B?ckp6Q3JTdnZaNTBLWXBqZUI1ZVVjdGZ0VGgzY2lwektCTVdrVE9YRHdvcWtw?=
 =?utf-8?B?ZVRrNDBqcTJQWWxsTDJKN09WZGY0dlRuZjFoU2FsMUw2MUVJMEhSZHNIMDda?=
 =?utf-8?B?OGJ3R2hHSW93YzRxaldKK3NDdmc3SnB5TWZnK0duTk1jL29ud3Z6aFpSWTZr?=
 =?utf-8?B?YStGN3ZxMjRML2NUU20wRjltaXlIYlNYeHZkcXBqRTd3TlNzUnNmVjFXYU5B?=
 =?utf-8?B?N0t6bURDN2hPS09vZEFqZUNOUVlvb0lLTm52ZFBwY3UreXhoQmRRNk40UXFw?=
 =?utf-8?B?RVJYSEpseGVSZGlPK05Sd0NsODdaQVhhTjFuV2tKQkJqeWp1UWpFQkYxdEo2?=
 =?utf-8?B?allwU0kvM001anhMb2tlbDIxc1hNdjEwc096cGlhUWhzWTU3N204NVA3RjNK?=
 =?utf-8?B?d3RoeHhLZ0g3ak5WaVo2b0lHMEhVMEgxVHQxcGZCVlpaRUZTYjM2Y0hSVXdy?=
 =?utf-8?B?eDloN29aeFA5OFZYTFI1U1liemJTYmwxQ3VRd2l6U1B0UkxNNEplN1NOKytn?=
 =?utf-8?B?MzErejlXRlJiUHpPc1NoUmIzMmFpNWdVTFVYSFlGcnFXeEpFMUs5VldBbTQr?=
 =?utf-8?B?QXQ0SzNpdTBnL1RYQUFJRmtyZTdYU1hWT1MvV1Z4cWVZR1JwY0FweEhaUzNM?=
 =?utf-8?B?YWRmanJlT3JuKzRWMHcxTFJhSmsvc01WcHZ5bDNNNU1NSEdaR1E2MVcwN2Jk?=
 =?utf-8?B?RGlpODZSTUNpMTN2TzZRd3RaY1hIanFIUnNPRjN1SjNaMVdyQWRyTnVCWjVS?=
 =?utf-8?B?eHp6SGlZdVFOZXdSRGQyLy9KYVJoWTZLZGxSUUh5NWVQajhCQUNaTk9DTGpX?=
 =?utf-8?B?aUMzSEx6ZXUvQkd6N2cya3VWMEptWEkwWXBUOUFQRThlMDlKME1GVUhPdTZU?=
 =?utf-8?B?b1hRVnJSRmY4cE1pcW5lU1dRYXAvKy9YMEp2U2N3NURzKzcxUWt5UGxoaFJj?=
 =?utf-8?B?OXk2N21QUVJidUhobkFmUnUrQTZYWHMzRW1HSHlVMDJLMjk3UUlOMFFxa21v?=
 =?utf-8?B?MnZlbFJwUno5U2kzUnIxaE8yYUIwZHA5WnhXZUVPemNZMDVwbHRvYmFuNjAx?=
 =?utf-8?B?MWE5b2dJMUJ3R3AvczFpQWJXYkRtOEQwc1o0K3pUSTNNd2pJNkl5d3hjZ1R3?=
 =?utf-8?B?VzVaS3VUcEl5eXgySFd4L0IxZzVtdk5JMGlHR1p0T1lqZm55Tkg0MU1YYlVl?=
 =?utf-8?B?OTlPWHNmeXVPbDdMOVZzdER5QlVJZjdqbHJSWDh5LzlWbDdrekl5VnViaGtU?=
 =?utf-8?Q?iP4UyBOCURKaZtXSXlouzAnHoluHPC+lNYxgyrX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 028593ed-253f-4c57-0fa8-08d92b2936d4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:30:26.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25+IPgo9DbnHOUqsj0t9Wx8zdTha7V/acGcbmfFJo0V8SO/9im/FrIN0uUYw2Diku1+RYAqAgFxhRWi7NIMODw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

Failure here could in principle mean the device may still be issuing DMA
requests, which would continue to be translated by the page tables the
device entry currently points at. With this we cannot allow the
subsequent cleanup step of freeing the page tables to occur, to prevent
use-after-free issues. We would need to accept, for the time being, that
in such a case the remaining domain resources will all be leaked, and
the domain will continue to exist as a zombie.

However, with flushes no longer timing out (and with proper timeout
detection for device I/O TLB flushing yet to be implemented), there's no
way anymore for failures to occur, except due to bugs elsewhere. Hence
the change here is merely a "just in case" one.

In order to continue the loop in spite of an error, we can't use
pci_get_pdev_by_domain() anymore. I have no idea why it was used here in
the first place, instead of the cheaper list iteration.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
A first step beyond this could be to have the backing functions of
deassign_device() allow the caller to tell whether the failure was from
removing the device from the domain being cleaned up, or from re-setup
in wherever the device was supposed to get moved to. In the latter case
we could allow domain cleanup to continue. I wonder whether we could
simply make those functions return "success" anyway, overriding their
returning of an error when ->is_dying is set.

A next step then might be to figure whether there's any "emergency"
adjustment that could be done instead of the full-fledged (and failed)
de-assign, to allow at least recovering all the memory from the guest.

--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -894,7 +894,7 @@ static int deassign_device(struct domain
 
 int pci_release_devices(struct domain *d)
 {
-    struct pci_dev *pdev;
+    struct pci_dev *pdev, *tmp;
     u8 bus, devfn;
     int ret;
 
@@ -905,15 +905,15 @@ int pci_release_devices(struct domain *d
         pcidevs_unlock();
         return ret;
     }
-    while ( (pdev = pci_get_pdev_by_domain(d, -1, -1, -1)) )
+    list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
     {
         bus = pdev->bus;
         devfn = pdev->devfn;
-        deassign_device(d, pdev->seg, bus, devfn);
+        ret = deassign_device(d, pdev->seg, bus, devfn) ?: ret;
     }
     pcidevs_unlock();
 
-    return 0;
+    return ret;
 }
 
 #define PCI_CLASS_BRIDGE_HOST    0x0600


