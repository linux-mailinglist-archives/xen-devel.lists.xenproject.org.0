Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F563A3D9E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 09:55:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140264.259201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrc0c-00008y-JT; Fri, 11 Jun 2021 07:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140264.259201; Fri, 11 Jun 2021 07:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrc0c-00006S-GF; Fri, 11 Jun 2021 07:55:18 +0000
Received: by outflank-mailman (input) for mailman id 140264;
 Fri, 11 Jun 2021 07:55:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0bEB=LF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrc0b-00006K-4f
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 07:55:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ed82467-1ec1-48e2-8505-df0d566e4a89;
 Fri, 11 Jun 2021 07:55:16 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-isM2scMtNW-eUyjKO_g1Yw-1; Fri, 11 Jun 2021 09:55:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Fri, 11 Jun
 2021 07:55:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 07:55:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0198.eurprd02.prod.outlook.com (2603:10a6:20b:28e::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Fri, 11 Jun 2021 07:55:11 +0000
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
X-Inumbo-ID: 2ed82467-1ec1-48e2-8505-df0d566e4a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623398115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3yP0rvJv+Nzvyw8VKF6zz1e403fV6kW3ee23UwS+wE4=;
	b=Lz8APM6OUzafGhszYjfOPub01OCJY3htscK81DGsS9s3ofIccomD30WhD9AAzYYUzleZZe
	llmaXdb5DlcFhURHyO7CikWM0p0so0fAGr4heYY9GW6o8ggrdQ2ZlIvNIyf0oisg3v0ISm
	d5Ul9VSueQYlLxa113oAwZqDG1Kow78=
X-MC-Unique: isM2scMtNW-eUyjKO_g1Yw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcAPQnLESlCO0VkmGp3KPMEuDyvHFFdPCWqmkMFMk0mZnnfnVx/teHZaKj7c7OeB6Qf8GCVQUhoAwf/9yMZG9/9ECQMBAgqM5P/e96UUNV6gFkl5suotz0pQ8+XkupNmE90HUT5RPjeToaSyWfaP2JaLXlEtoq+pDlL79PJErUvxCBk3/ib8TxRTbHA/r0SztrcryEf0LHz8OhCFpHDaGkv/qGI4skc7xjzzkzZWbNkfyB3X35Tl4BLwOTVWgxCeSWvPKSbub46RR7AUAsk2p2c3UEB2oy7+SiGIFcUBZyuJGHJStq+RgfSBqXG6G+B4NOX75erJ72FbfVh4wzGpBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yP0rvJv+Nzvyw8VKF6zz1e403fV6kW3ee23UwS+wE4=;
 b=oT/FVskDScveZc98vg02ufDYbt0f3DBk0bcC4b7wwFHZKbCEqUPwNIeXZrHAdyc1wphOmqHtp+GR1Gz9tqqd3GWNsd5/Y1VsXXky10Pemd89NjaWB9Onhm26DtFwg8+DKptXoHDmlAtuQtuWw3v28czNP6rrb5RtBR9jhPdu4axWSR4J32BWDa2lgtJALyC8oi6n9oZbTmaXf1P1zHaEjLg0PGBV3c52Yw/ioN1xK7AlfV5GuOm35I69WDQm0fAoeJREv6OKQDhbNXpD9MWGFouOHaSjk3VpX0Gm4Xw8UTahngV2595RAmwKwbvFVKzpPI1VSw2aGbqD/DIPgIkGCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm32: MSR to SPSR needs qualification
Message-ID: <e4946a69-bc1a-d54c-dadf-e71feecd99ab@suse.com>
Date: Fri, 11 Jun 2021 09:55:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR02CA0198.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb702eed-55e2-473e-3fe5-08d92cae3d61
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5600B4A35155415E8F0F59A9B3349@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A2/fax+4MTWwT1qNJMIO8aBg/2CCIpJ3C/vvJwSiQvxftvtmdQ/C+l7aVxgRUOFETj268S4MxfoRe4cORoiIASH8mtG0rYQfF9b2hnQknAFz9eo7idZe4emqi/0+qBjvmWFZqnNRJRGIOwMI0UDpkx4FMHF6DRXOQdHEhMgWCKJ61d2zZJxNVpOQ7W3wklkUXOBrd9mJCAEVs+uz9NOAgtAqZ31qL5nO9bWVuxlPMyRoeiwjuAXF1SxSXpQmJAa5u4Aam4Gc/DTgO50Uys+nG7eAGaXaFTU87WZXpy5I8l+93sjd+X/HWyXx6zgx4jQk7GCOQ23rjbnqI02iggQNF02EoQD02QLrwW0Y/geZ6SAjLQZeRJSn1MMkvhDbxoQSXr/2js3QnRVekuzwnCLWl3wIn9SMW7i6cvVLY3LsstFzD2qPFpUcCNPidPmcAMIGRbfn3PMHE61tqMsdAom+uapgwQMlghG6YuDTKuK9PGyp2ToC7Fr5xTGxeztysrBDbEh39R7uuAmYcR4iYBbbXewkcmnFnw7K0zLtyMs1Aai6Rul8euQ4Wkmv8yN+t5Ntjb+gGs+XsJaaoEVYPH7upPQTOt+DRcMjyiqbVw5TD348ejGAbQDKW1x1rYU4YetiIU7EOKBOxUufnWQVPnJEVyqA9aDvCNMB0LTp+H5TA0Rwbcoi2ZnXX1xf5BiOCMjl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(366004)(136003)(39860400002)(38100700002)(2906002)(8936002)(66476007)(16576012)(5660300002)(478600001)(316002)(2616005)(86362001)(186003)(8676002)(6486002)(66946007)(36756003)(26005)(16526019)(4744005)(4326008)(31696002)(54906003)(956004)(31686004)(6916009)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dy9UYXFZMC9JNjgzUTNJVXpmYXJXT3d0L1NzNDgweDUrVjBMOVJyYjM2Wkp2?=
 =?utf-8?B?OUIzdmlrN0NpU1Q5ay9WRjgveDRwQ3oyeG1VUDh0bkhrcUlaYXFRNlVjQW4r?=
 =?utf-8?B?dmJhY1dwT1RvNSttZXdkNE16MzRjc1Q3RjRJSXJoc3VweXpqNndmbE1wK3pv?=
 =?utf-8?B?VjZFVVQrN0NlcGsrSXNIdlBoblRkQ3l5b1FxUUFvKzQzNGx3d0crUXdCMXlS?=
 =?utf-8?B?NnBEMW90NmNMeXdmbTBJSXhKYm01clhkWWNDdmY2eDFJOEtXYXpZSjM3bnE2?=
 =?utf-8?B?THNUL0JkUi9PSk1WY3BydHN6OC9JUVgxdndDSVFNb3JLVFMzRzFreWtnWDVQ?=
 =?utf-8?B?bDNSMDFiSElKQUUzTk9zaUMrMFhiUGRZZStDTFZVTW9FWWhQZ2FzaFRqc2cw?=
 =?utf-8?B?OUVidkV3UFYzSW43VTNraWxtbHMxbXMxRVFGRk9MalNJeE5Eazh1NGFCQ3dH?=
 =?utf-8?B?cFNhU3hmN20xZVlZWkgwNkdkVXM5YWQ3a2FKUUFEVjhrSHlQVUs5NVRmMG9R?=
 =?utf-8?B?OXBSUnp0NkxkSUZObXV3WUNPSE9QSnk3MHo3aWxvL1pIZlVZQ0IveGlwYXhB?=
 =?utf-8?B?SG10akxoai9PUzVhVHRTWC90cXA4UGYzYk5kZ3BQN0pGc2lxV2ZmYnEwUlBY?=
 =?utf-8?B?WGRnMDRORGxTUjdDb0p6KzdsOWsrWEp1N0wzN3ZSQzllTVppOTNrVFhNQnBx?=
 =?utf-8?B?ZVJSQUxVcjlWMVhsRFI0K0ZCQnh4Rm5BWUJNVEpicS9DV01rcnowYnI4RGY4?=
 =?utf-8?B?dGYxbjBGRTF2dVpvMVAySENHZUNWNEh2RHA3M2s3b2lMNFZ2NlF4RkkwZGlS?=
 =?utf-8?B?SXFHS1R6U0ZsRERPWkJqKzVaelNObXFaT1dvZFNTVDVDcDJPUFJ3eE41YzEx?=
 =?utf-8?B?Q2hScmk2cG5pMUxBVXlaS2JWZVFaTXQ3amZleHFTcmtnVVNCejloMGYwOHJa?=
 =?utf-8?B?STdsQ0t5bnFtK3YwSmgvSTNOVVNoVWZxbWpROXlnQUhvVFVBTWxjelROUjNp?=
 =?utf-8?B?dE13OFZEV2V5cWQ2cjhsWnp4UHdTbUFFaWh0dFl3eDNKUW44UUZCV25HcUxF?=
 =?utf-8?B?UzZuczJ5UFFleWVKekRKUmxaNnc3K3BYNDduWWxTSUZ6RWh5c0NCcHMyekRu?=
 =?utf-8?B?VG82Wll3bmx3RjlOTHNvQ0NPL0ZmSUZySW95R0kwNnI4VDdHeU1Id0hVZ3VY?=
 =?utf-8?B?c05sRkNXd1dlMUp5SDdtN0ZJbXJxZC9Sc2Q3OE9qdUdPdEFKbkd3U1ptODlT?=
 =?utf-8?B?dG9iTXhiaHNDZldFNFF4bzU4U245MlBYTkt0K3dLRW1mOFdXL1o3NU9uTmV5?=
 =?utf-8?B?RmhGMUNCTGdBSTBlYmpUdVFDdW1KRmlBTnBPbURLajcyU0cyUy9XTkJ3eVN0?=
 =?utf-8?B?d0h1cnNKSXZkZm9LOWxLTjZWbG54TTBQYnFTVGZiTEpEem9HNVQ2ZjRCSkJC?=
 =?utf-8?B?c1QraFE1WnBVemJnWkVlejB3NmF6T0E2WEZPL3RTdlN4VFJDdEhTYlF2Qk5r?=
 =?utf-8?B?bzAzWEprVG1nWmttZEtqaWFmNW5OUG1tenJ6TktRRHV4WlljT3krK0Yva3BJ?=
 =?utf-8?B?Zi9zcHpUMXJUNytqcHhyL2RQdFlZTTJrWEJzSkVRTlZrbFlOVE9jMmZiQTY2?=
 =?utf-8?B?S0lacThieU5zRWdRTUplOWZsSXBCOWJYRkUwVzNIZXNKNG9GNUMvT0hCOUw0?=
 =?utf-8?B?aGMwMm9SUSthOTZJcUNXazRVSDdrNUNyc1JUYkJ6ak5nQVEzdEpyQkxPQXQw?=
 =?utf-8?Q?FbVSb2gT0EC7TvUn6ardeFRJDCymfC84bUruSd6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb702eed-55e2-473e-3fe5-08d92cae3d61
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 07:55:11.6610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+mRKdhl6f4Ar2msW6SwLMGGnFGqthtYjn7SzIRM9Vp3OfdwYbBIQooOXXULrdODKeSwlNorTD11WzBFrHy3oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

The Arm ARM's description of MSR doesn't even allow for plain "SPSR"
here, and while gas accepts this, it takes it to mean SPSR_cf. Yet
surely all of SPSR wants updating on this path, not just the lowest and
highest 8 bits.

Fixes: dfcffb128be4 ("xen/arm32: SPSR_hyp/SPSR")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/arm32/entry.S
+++ b/xen/arch/arm/arm32/entry.S
@@ -395,7 +395,7 @@ return_to_hypervisor:
         ldr r11, [sp, #UREGS_pc]
         msr ELR_hyp, r11
         ldr r11, [sp, #UREGS_cpsr]
-        msr SPSR, r11
+        msr SPSR_cxsf, r11
 #ifdef CONFIG_ARM32_HARDEN_BRANCH_PREDICTOR
         /*
          * Hardening branch predictor may require to setup a different


