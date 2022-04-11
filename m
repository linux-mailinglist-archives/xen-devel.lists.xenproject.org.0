Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7244FB7C6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302785.516562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqUi-0000fb-Hu; Mon, 11 Apr 2022 09:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302785.516562; Mon, 11 Apr 2022 09:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqUi-0000ca-EL; Mon, 11 Apr 2022 09:38:00 +0000
Received: by outflank-mailman (input) for mailman id 302785;
 Mon, 11 Apr 2022 09:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndqUg-0006iD-QX
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:37:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1213f83d-b97b-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 11:37:58 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-uECLT-hvNZ2WoZAj196Xhw-1; Mon, 11 Apr 2022 11:37:55 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Mon, 11 Apr
 2022 09:37:53 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:37:53 +0000
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
X-Inumbo-ID: 1213f83d-b97b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649669877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WsXEt03rYwGXma+YK8JHkDArPL/VDC+WUTJ5m0TRmbw=;
	b=hVIUVsmxdS5jqAn4HNVMxGTJRkbwTPw/UPcze9YBMJm555VTqYqzHv/d/JvTIitxf1XW4B
	Yxpj340bbDOpR9JI+SMs/1xMBH+/o76Sby0moB+Yitb2ybKwyeqdnCC61JELVJ7+vBPNjf
	0OCekjnTUoaeAyDVUe6y96YEBXz8Opc=
X-MC-Unique: uECLT-hvNZ2WoZAj196Xhw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeVZYMkCRTlqNEVCML3EQNhnreit1Bdg7+jPFsz6D6k90y4uWHkzLigY/D6Ziry/NQVmdRq70Xyeu76UvgISGT4hm7t7vf0LIXWF77iztFDi1dgo5OS8/Coqy7tY5L3hjdxDW19gFY+A0ykZ3xNqEzTwTPwdqo9CMjMr71IbIVb+MBILOdV1aMDrbvp4DZxxo6ztJo6Enn5Ec25gxe9tAFo4CE4guDQssnaS1EdGB9Mf+PLJl1ROwZ8m7/5JXsRUkymvlBmFTYKJhEOVEQ0aBUZgmX2T/Lqk19EDNf/lbG+k41iym+lF7xcj9Gm2N6YUuSkFNWUnkev6iKz6eQVeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsXEt03rYwGXma+YK8JHkDArPL/VDC+WUTJ5m0TRmbw=;
 b=AVMymlQbaxdBSB9aqn2nSGcBw+9TyJrvGdwa/NDN1zPoeBLaSVu/08at62bOegrF6YMK23hHpzopdm7p5bEIFtp7FvN7WRcEvppq+LBbNwrG75hj01kzbGCZ/V5fS/borTlMAhdUYhvAy3GHnQ7RsghryT3iRzjMp7StlqRjDusMRY/4RLLk9ta3xHgWo4zgoDrq8UJe4pPiymKwroE4u4ypcdI0rrLfLS3qFbXO+gaJWfmNojOCLcDLNYekI+4EQ5sUKU4TMcmgNKVHLp9VwmBHM2GZ9OyoavDOnqAGi/MxJIM31ZW0Tjydpu1hq/rPa74m6TwW97DMoQ86YQLJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68a10516-7737-5bbe-e9e5-537031251fcc@suse.com>
Date: Mon, 11 Apr 2022 11:37:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 5/8] AMD/IOMMU: replace a few PCI_BDF2()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
In-Reply-To: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0012.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b0986ff-aca0-4f27-bb23-08da1b9ef3d2
X-MS-TrafficTypeDiagnostic: AS4PR04MB9364:EE_
X-Microsoft-Antispam-PRVS:
	<AS4PR04MB9364B7BC1E5DA459670780B3B3EA9@AS4PR04MB9364.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dNKZiZNvjAZZe7HhoBg7ZhOyg2+UvUv56WtdWkXTyMR0Wrt3POpFWRespPN0HH2AlB7Z9N+yanLgw0qnK15BuSY5W05nmduYzt7j+8E3Dq5MffOetZoFOr/qXh6J/YCexELIHgQpOAJf5n6ooXqCvM2avzD7cK3EkNYy9u7FESiWbqOQ7GUaf4tCmtbLA/OPoHSm0si1Ylwc6W/skQR+fiAgYjKRL5ATizTk/APte0JHW0R/tIPAYDjAbhnncLwb4egHJQsO/SQheuiGvOxcknT1jLWXl5I4JYwck8SW/eo6l7G8ZpI+fSGj5RKfJuwC/91dLbap+LXxCITzUXx5+TyR15hpubtqDVpTRPtr82a2Vy2fUArRalGlFMqpHb4GDlWOV/M9CP4zwOHZYXNidJX/So8pY17cnSZsSI7qno0vKhFYCAh9L/EI/qPHRO5nlM7Ytv2XZ9XAvJrb+odtRA9GFU/Y0jKhUTMl7Kf5KNwodPsvBFSQrvMs+O/StB1koc5guNou3uuol680dF3bW/MohZ92Ag0k7VGelIcusloXDTJHPWKAoIRLe6EZGdK8fQhFYkpo9Y3JH6MOHJnFAy2lofKSCchq7fkOWzsfuOP5oICv0iNDsxQ6H8oMueiyJkvB1x2i8XY/MQILz9MGzcIrapV0JQS78xIU+UUlilkFCaoCiu6Ba4W6DW8idJQNZRqPYpCscKbPBq1Ocsngq9sM33NGBIWsCd8cCvW06ibj5HTIKX3jmZUbi6Chyl+C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(66556008)(66946007)(66476007)(4326008)(2906002)(186003)(31686004)(8676002)(36756003)(83380400001)(6506007)(2616005)(5660300002)(6512007)(6486002)(508600001)(86362001)(31696002)(6916009)(316002)(54906003)(8936002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0hpMlBOLzFGN29kaVhTMmlwR2s0UWtndVVXRUpidU92OHVVbVJhQWVCZkNS?=
 =?utf-8?B?SEdNU2xOcnF6UkVTSlFlRld3Z3M0UVR2RGVJYXVSSWV5VUhqN3kyU1l2WFhs?=
 =?utf-8?B?cENiZjdpMUY3VWZueG1uQzFFOTFHQzFRS1RSUS8xTzNGVVBqT0U0ZkIzZkEw?=
 =?utf-8?B?RDVpbURTbkV2VWd3MVZMTVhycDRnTmpBSWVGckppanNrdWdxdVBQOU5vNHlT?=
 =?utf-8?B?aWFHL24veFJYZ2ZCbVdGc1RDdVBWSGlzSUFrTk9nNFJycXRRWDUxbGw4VU9U?=
 =?utf-8?B?dGxuM25SUHJSM253cituVWdDSFBBczY3S2k2S29xR0FkWjVTZjRxM0M1UFBC?=
 =?utf-8?B?R0VITUdrN1dOaU1iSHJ2UDlRYit2K3NXbk9jWVMyZURoWWxNNnp0MjArZ1RC?=
 =?utf-8?B?eEh0cWplemRZN2JTNk03eWVlbVRXY2RyWlM2T1pIZXpRVlBkV28vS2Qyb3Ux?=
 =?utf-8?B?NmJNMU0xTHVrSlNseTRzbC9WcEd6MFBuODFjYnRZUFRXUTBuK1ZFcUxZWVBB?=
 =?utf-8?B?YTA3K2NFU3FJTHE5T1krYmMxZ1lxR05oOTIwbEUwV1hJV3Fvd1F3REhINWtJ?=
 =?utf-8?B?MmRwbURJWWk5dURqL0I5dUlHNjk2VXBMTXo5Z2FxOFJxbjU0TnZTYlBCOFNj?=
 =?utf-8?B?Ukh2OGpEdG5xTFo0U0IzRjNtL29hRElTL29CeVNaSVBTUFovMHBSb2xiYmFx?=
 =?utf-8?B?MU5CZHZIZjJLdjRLdkRYNEhaVE44QUt1WEF4MFZTbmhtaEIwa1ZUT0dFMHV6?=
 =?utf-8?B?a2xwMzlRMEpYNzYybE40d3FlNnU2NDY3a1NFa1ZaaE1Fcml3U1ljNDJ3U2x2?=
 =?utf-8?B?MjdmVmt1eklkWmJYQVV0RzV1WFFXbjFaUnE2dHE4NDAydy9lZTF0YjU2WXdu?=
 =?utf-8?B?cXUrSmU5OXJwdDdyeEdacHBET2lJWEpoYjVOaDRiOEd3L1hzdWlkVFdQTHpx?=
 =?utf-8?B?M0VVN0s1VnV2YTZMZFlHZkpvSThLdFlZNFZxRTN0WjkvamZzTVpuWXRLOWdN?=
 =?utf-8?B?WndmakFXS2FJRmNWOG1zKzZ3Sk1yUjd1Ty9vMXhpcnNraEpKVXdZdWpNY3B3?=
 =?utf-8?B?REMwMlU5WlJwNmtlUVR2Q1pPWEpjVkdUTjJ4TVR6cTZCQmZ5enhtcXVVWmlv?=
 =?utf-8?B?TWgzRkFNQXlCMjhmMm5zYndoOENWY1pqZVBMUTB3NTdFN2tSZHh0ZkplYzJn?=
 =?utf-8?B?RkhvSGpjcnlPbVBDT2wxZWVKNXNpNjk5VUM5SThrWklGdzRHVGxabVJLOEZm?=
 =?utf-8?B?RkYyZjZpOGU2VDd3ME4xd3RqMFB3Y2pCSkgrd1JPUUxUOXF6UjZaVEFTNmdT?=
 =?utf-8?B?K3l5NDdxdk04ekg3THdEeGtuQm5XdE9NM2VRcElpTXFYbTVYbnZRdVoxTWgy?=
 =?utf-8?B?cVJtVVFTenh3d3B5L1IySko5em1hTFdxanFUbDZ1cnd0TG1MbU1qcHZGMndF?=
 =?utf-8?B?T3FiRkw3bWRBR3ZNS3pVY1RUNVNOcHZmbFFacEUrc2hBM0thYlo0M1d2UEVG?=
 =?utf-8?B?Y3lyRTJ5SUdLbWgvd0xiUnFJaUxUaktFM3NCL3gra2d6bFhqczVacFhYOVdo?=
 =?utf-8?B?NzRVTTAvVmlHNDVnOUthOThOUGZVcmhzZmo4TnZraVNSWE9mYXdBbTFXYjNQ?=
 =?utf-8?B?T2pKVmRSeGZoV2dZa1l1QS9CQkpWR2toQWJQbXQ0KzZUMGJDbXlCRWxpeVJh?=
 =?utf-8?B?SVA3OHNMMUQ0TWxYcStDYUN5UGdUcmpvbnFlUE1ybWpxTUJadkxBUEZwR25o?=
 =?utf-8?B?UFlUUGprRHI0TGJQdTdJL2xWMkJtMUFnTStzci9LakVhZ0NLdjJFVXpJWURU?=
 =?utf-8?B?RnVkNDdYMVBPMFd6cUEvMTUzd3BEZjAyRFppUzM3SE9CZk51WXNqcjMwdHR0?=
 =?utf-8?B?ZUJFc25SbFUvdUxjTjF2M0NzQklCcXpiNnhNOGJMM21YKzB1SUNRYVRVZEpH?=
 =?utf-8?B?WFpFY3o1MzUwbkZtTllkZmRpVDJ2UEsyRHBlVW1uSlR2ZjRSanNzQ3B6RzZT?=
 =?utf-8?B?bFJRUUo4RGo0T0xqM1VuQWk1Z2dFbkxwS2NoK3phZER2bkVnWkN3aERUWVRB?=
 =?utf-8?B?aGZESVdhK2dMTVBDQXlwNWFoNGlmUUU2b0pZZ21lQXFzOGdvMFloNzFOY1FP?=
 =?utf-8?B?ZnBhTG5jK3VkcEprS05PeXZDSWlON1VJNGJERWovYlNnUU9rZXhURHdHbFh4?=
 =?utf-8?B?b2NoMFNZRTQrVzVqb0NTNVExUUFtbGlkamZkQzJjamE3aDhoWmE2VXFybnpx?=
 =?utf-8?B?M09RRTIvbHBQdXZjSGNoRVVyNnpIeCtqeTRLbkJ5RHVIMFI3Rlk5cmJlaTZh?=
 =?utf-8?B?cXQxRzVNMUNnYmt1RllDamltaW1jckY0MUdoUTNlcEVwWFJnVWl1Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0986ff-aca0-4f27-bb23-08da1b9ef3d2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:37:53.7052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4Ep4COoCpr0Z4C4d1u2ZryXr055Q2+OdQcaT3SwebcdjhWIRRqgJLk+pz9hNzpvOJ0ZSYnKs8QYorREE7+azg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364

struct pci_dev has the wanted value directly available; use it. Note
that this fixes a - imo benign - mistake in reassign_device(): The unity
map removal ought to be based on the passed in devfn (as is the case on
the establishing side). This is benign because the mappings would be
removed anyway a little later, when the "main" device gets processed.
While there also limit the scope of two variables in that function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -287,7 +287,7 @@ void amd_iommu_flush_iotlb(u8 devfn, con
     if ( !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) )
         return;
 
-    iommu = find_iommu_for_device(pdev->seg, PCI_BDF2(pdev->bus, pdev->devfn));
+    iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
 
     if ( !iommu )
     {
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -617,7 +617,7 @@ int cf_check amd_iommu_msi_msg_update_ir
     unsigned int i, nr = 1;
     u32 data;
 
-    bdf = pdev ? PCI_BDF2(pdev->bus, pdev->devfn) : hpet_sbdf.bdf;
+    bdf = pdev ? pdev->sbdf.bdf : hpet_sbdf.bdf;
     seg = pdev ? pdev->seg : hpet_sbdf.seg;
 
     iommu = _find_iommu_for_device(seg, bdf);
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -455,11 +455,9 @@ static int cf_check reassign_device(
     struct pci_dev *pdev)
 {
     struct amd_iommu *iommu;
-    int bdf, rc;
-    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
+    int rc;
 
-    bdf = PCI_BDF2(pdev->bus, pdev->devfn);
-    iommu = find_iommu_for_device(pdev->seg, bdf);
+    iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be assigned to %pd\n",
@@ -489,6 +487,9 @@ static int cf_check reassign_device(
      */
     if ( !is_hardware_domain(source) )
     {
+        const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
+        unsigned int bdf = PCI_BDF2(pdev->bus, devfn);
+
         rc = amd_iommu_reserve_domain_unity_unmap(
                  source,
                  ivrs_mappings[get_dma_requestor_id(pdev->seg, bdf)].unity_map);
@@ -558,13 +559,11 @@ static int cf_check amd_iommu_add_device
     if ( !pdev->domain )
         return -EINVAL;
 
-    bdf = PCI_BDF2(pdev->bus, pdev->devfn);
-
     for_each_amd_iommu(iommu)
-        if ( pdev->seg == iommu->seg && bdf == iommu->bdf )
+        if ( pdev->seg == iommu->seg && pdev->sbdf.bdf == iommu->bdf )
             return is_hardware_domain(pdev->domain) ? 0 : -ENODEV;
 
-    iommu = find_iommu_for_device(pdev->seg, bdf);
+    iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
     if ( unlikely(!iommu) )
     {
         /* Filter bridge devices. */
@@ -648,8 +647,7 @@ static int cf_check amd_iommu_remove_dev
     if ( !pdev->domain )
         return -EINVAL;
 
-    bdf = PCI_BDF2(pdev->bus, pdev->devfn);
-    iommu = find_iommu_for_device(pdev->seg, bdf);
+    iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be removed from %pd\n",


