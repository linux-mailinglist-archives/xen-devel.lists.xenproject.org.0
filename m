Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783B35067D9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 11:39:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307964.523397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngkKD-0001Xs-FI; Tue, 19 Apr 2022 09:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307964.523397; Tue, 19 Apr 2022 09:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngkKD-0001Ux-Bt; Tue, 19 Apr 2022 09:39:09 +0000
Received: by outflank-mailman (input) for mailman id 307964;
 Tue, 19 Apr 2022 09:39:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngkKB-0001Ur-Ub
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 09:39:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e5ecdd3-bfc4-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 11:39:06 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-OTSCuYS-NNO6nJgkuH7isA-1; Tue, 19 Apr 2022 11:39:05 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR0402MB3651.eurprd04.prod.outlook.com (2603:10a6:208:5::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:39:03 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 09:39:03 +0000
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
X-Inumbo-ID: 8e5ecdd3-bfc4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650361146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8IB4UsuGr6nOaXGYqGr/XjpHpdc46ZSgT5vo4vAcxZc=;
	b=IdN+qkH4arxPtJ9ChOlSCxwZt8UrFDqxkMq3MZZTrYKG66zX3XRFRgzu8LYuCB6zhizGsu
	YelOhKDjDhY/rqkKzKN1aZNia2dRkULwQx3QzXXiD+GlDG0iFf1Pu70fHsk4Vu1QLd9oUM
	UkyUpbT5TUYZH5BwwIecMlD2g19PFao=
X-MC-Unique: OTSCuYS-NNO6nJgkuH7isA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StD1eZnyjb8BemLR6ngAYb6foIajHvliufCCoquI+mvgBgebV/imiRAQrUfJciXl8RNCr+QN/CkHcWAtsVEdTWITL3euEuFpkCAktEZB4BQgFSBXLuRXV+JcS7WFW3GejnESNnnJeZQzZEE+Eb6shopfw2QEAaMYTbl9Kf7Cb88RME4K6hYFc7L0W/00zt7534w/ZX+/2i/U+mr82WpAKr92cRdMaccqGK+yZ6iXEog2JO1v3Px931LVypPf/Idy+fappN2uuXIBPJnHmVxns9Ilj0Yqd0Gm0Bf4HUNooa3kWv5i/MBoCN9m4PKyDSW30HBPepPW9wFN8LXMyLEmJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IB4UsuGr6nOaXGYqGr/XjpHpdc46ZSgT5vo4vAcxZc=;
 b=aACtUyXWtZJNOSYXjfSUjhhnTdxAzdh8mmA18jDnC2CZNdHDpcdjRqlHGcwlwHvpHBIP0DpObteM4uud3owc1+Uz4f9GmSGDE/hwba2ALsd0aEzB2gcqDYxG/LzpUEnQpjpVzMiZOf2RYwUdzRdap7Srsq8i3fTlKP+WsiRC0oJS4oPjbS6nFbJnKGYPYxuk5ROAbAzdV93YvrRHcA/b11rdZDcve14nIUGDYKETsc5ECya9zJKLMTBoU2QltKuBks66ksAPTZK5qr7ylV52kBHp09mwbtqvP4kr4OSf7NAHYHtYr7bve4cdzoOj9/9j6oLyybZxKaOghRy+hqR0Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
Date: Tue, 19 Apr 2022 11:39:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0038.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f4e531e-6833-4ec8-aea1-08da21e870d4
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3651:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3651532604D2A5D82AE98DB0B3F29@AM0PR0402MB3651.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f8u/jEM1GHsM3cIXqDwtKtZz2fK/i7vkinR+JBadogJaQGoDsiwj0FQyruYpnmCZUQ51BxAFddi31mYMBNP6TywVOxfmTwo5XU4DvVthqRbADMA4DqosTmBSLwgkKZtOPj9a3BIFWBQ+rGyNtyP0h1HnXKU8QtWlKzWPTK+/MbOj7ktNWOzjWm1jJdx+JX5PRRdrpFGR09OeUAtO1caBsFL+mFjmOGVi161761uXtekK52IaAp77GQaw33RenDvC9iOdpjrqlOqilPjiF93YFpzEQltgMexU+IDqPkpR5Jrtnh0qyFxBY5hIRySxnFj3Fv6tt8Ll5bjJHBeKffb+3UvUgIanlQ48xQYwpZUNbH8xnexaJZ2eLgnAfbfyhT9yMdR6eqm1Aj8Xs47KaQfKIRgxKtKSu/I7hu4sx9AKubcpcx+R8i3l2/d3LoBd1aB7IbvPyOp+PuSqtAVPBR0Y6A0gKIBekHLzJYedfLjp0GVa+jBMJMyHGxcnON40HkU79HC5R1yqYC7cyebTdwdOcOlcMP7l6VJ2QgYUFmVcZM7h7fWBjYwzFOYDV/sBJnZ7SJ9ffhCvSRaSqV34BQt+C9ZCo3v9aV8lUNSboeT1QBxPFUdR9PdSHN61vE7Q6GyLDi8tmT/T89giNsMBfQU5Ib47UUo15WND/QgsdvYGzLz01fUIxwZZCLI7/0Bfnd0hpc8Mph4VSqzSdM1F5nrk5SWFGesZGKI6LVFpTZ2zeAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(66476007)(66946007)(6512007)(38100700002)(2906002)(6506007)(508600001)(6486002)(26005)(36756003)(8676002)(66556008)(6916009)(186003)(4326008)(5660300002)(4744005)(86362001)(8936002)(2616005)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWVvRDI1K2FrdVAxOXAyTXZqazFEalJyTkhtUGRKYmpKTFd4MnROWDVyQmpo?=
 =?utf-8?B?OHhEZmRwMWhVeDg1YnE5blpWS1ViK3M3c2NxaGt5aTIvN1RtL2E4NytkSE9M?=
 =?utf-8?B?alpqeStta2toanhKbU9IVysrNlhFeThLbmNRSG9qcXUvVlBxazc0TFo5MEVG?=
 =?utf-8?B?RlhSdzYvMDRuNnVVY0xJRFR3VjN0TXVrbFhvS1RIZllPOW81YUZuNjRMWWY5?=
 =?utf-8?B?UC9LcWx2dWlDQzY4ekFUQ3JzNGMreDBNeE50by9jL0tCUXNVMWJwcVYxVFB0?=
 =?utf-8?B?ZVFHVXVDbEF2MHNoalVOZ1EzMDJIYWdHejZhaU0wcmZyZ2RqRG9FRjY2d0Fu?=
 =?utf-8?B?SVhSR01IMHEzeUJHTFZidU1nSDZuMHlzQlRuTTh3Q2Q5MlV4TGxZb0s5QXlO?=
 =?utf-8?B?SEQyK2ljVCsvNm95WWZ3eTl2Q3lmWHpNMkN5ODFLSTFXMnFqREdqU213Tjlx?=
 =?utf-8?B?UUZnMW5GY2N5eVUxYjc4MEpmdzdCL1ZDalIweUYyOHlNMFRlaEIwUk9rODJm?=
 =?utf-8?B?SkVreGNWV1k2WlBqQm1uclNBYlBwcHdpNFFDdUhJRzlkelN4Ulc5dXNQQUhl?=
 =?utf-8?B?T2M3bzAxYWtnWWQ2VHZ6bmZUMFVoR3R6TEF4RDN6NFdBbFJzZmRUekhObFZ1?=
 =?utf-8?B?eHVDQ3pPSmVGR2k2dnJiUkgwOElGdEs4S3Rvc1lTWVp1NjlYOG9FSld0Z3hu?=
 =?utf-8?B?aWNwTkhIdlh0Z0l3NnRDZ2xVVGlWaDF1bEh0QmNqa25FeCsrSkJGVHNPdU9Y?=
 =?utf-8?B?ZmNEalA3UkFUZkU5cE5qckh6c0RNdTlSeWNSbkR1b0VPY1lXQyszSlI2MmY3?=
 =?utf-8?B?aGNYWHZjZzNFS1kwRFQ4bUM0NDlUazA1YS9GUWZyVmVTZExoR0xXUUZBbkZt?=
 =?utf-8?B?ZUFseHo2ZkUzRWVwSkpaOG51YWE1ZzgrNlB1RGJGRktybnRhdmMzR0VDTDV0?=
 =?utf-8?B?NWsxdGhBWCs3VUxGNms1QnFpTzNaZ3BjSUdtT0JIRlJvZ1BzbkxIREFiK1Rp?=
 =?utf-8?B?T25SYXRLTktZaDYrYklGUjRyRE81MXpyK1gwSG5jbUthcWRMVmx5ZWl1V2t1?=
 =?utf-8?B?c0s2L01INXltMCtNajhOWEE1RWduSktvR2h0SGRmQ3pzSnJyTTZTRFhWNFVI?=
 =?utf-8?B?KzI0OFBJb1dYZDZNU2QvcTRlKzFwVGthUGxkbitzUFJVYWFqc2VqSUFuRUxV?=
 =?utf-8?B?MmNGQldQWmhMd1VVVHV3ay91T2RIWUNPTW82bnBxOFloZnZYTWVIMStZUm9o?=
 =?utf-8?B?alVBaXduSlNSeThkSXZHRVFsR3lnRzN2MXNyYWtoOUZqempEc0s0Ty8rL1Zw?=
 =?utf-8?B?bzZaRmFROFRHNmltU21UQkdOZmY0eWVQaDg3TERwdWRVYUhRUnlFb1pKbktP?=
 =?utf-8?B?RzZ4SGppQ09LSEY2MS9tSVFwVktzdHBvT1BtUmR4ZkxCWGJtTDEyWTg5RzRC?=
 =?utf-8?B?NzY2RnZSNmpiQ0V5TWdzMlJISkVid0pSKytzdEROYmJyd0hMNWxTTVRCTFZL?=
 =?utf-8?B?dDl5SXYyQkdDZG5kbThWRjlSMUxtQnU0bThvalpOOXkrTVZSdGtJQ1Zrb29m?=
 =?utf-8?B?NnVPSnVIQkQrcWZhSm50RmMwUmxDMDE4aDNKa3ErUE9qRXg2WnFyb1JOQXZq?=
 =?utf-8?B?MGF6eEdkbmc1L3NLdjk2UFhJUlJncmd1bUJsZFZsVDI0VU5yTFJIcyt1UG1p?=
 =?utf-8?B?WnZsSTBlYjd4MnRSSlhhWWFra0dIN3RjdXR1eXoySHZnMzVhTU4rTzBOanVz?=
 =?utf-8?B?OVY2K2VwQWVpZjZlblM3eTJLYzNadlRDc01DNTZhZExFeC9lVVlPQ09weFVL?=
 =?utf-8?B?MVNpcGRveVRIdVlJNXRncUdIaVI5b3BEQjk5Tjh3TjlOR1NUenh5eUFKVXZY?=
 =?utf-8?B?and2dzZhV2RlOGxLYndnNDU1UktNekZRdDZpRlEzSkhOTnpxa3J1OXV0VkxS?=
 =?utf-8?B?NXREOXo0RkZnZ3BGSmVnQUNyZS9JSWRiQWk0c2prOTBJY25zL1B5RWx1RFZE?=
 =?utf-8?B?WnhFbnBlUXpvRVQxSkhiRitQZHFkRit6cElScVBWYkFXYkVrVW96K0Y1emp0?=
 =?utf-8?B?Q3RPbTUzSDdxMUNYVXl5K3BVRjFUU1V4VWZpMXhDamdjZGZPbkhzaGlxTXFs?=
 =?utf-8?B?VUJ1VFZ1aU9jdDNoSWFLbTV3K1ZKY1hmeERUMFBBYS90UVlFR1RIRUQrZVJx?=
 =?utf-8?B?Z0lDbEdTd1lQUjNjYk43bkg2emJvSGdjUE4wbUN4Uyt3c0NKM2U2b0pVSjZt?=
 =?utf-8?B?d2ZUdDlZODNoSmIxc3ZxNzRIWHFScktrMjJzNWt6UVM3aXlGR0s3QWM0NDg4?=
 =?utf-8?B?ZndJT0I1VjZEalA0S3p4Y3VjYVQrQlRsQk5TeE5sSmVTL09ZQTNvZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4e531e-6833-4ec8-aea1-08da21e870d4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 09:39:03.7181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SevL1HqaIJCJjpBwBNUpV9UG5HTxPe42h7UGruPtd6gnC7f/dxCO3UPzd215FsOeGNcAN5KIgHd9zRQisjeGAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3651

Besides the reporter's issue of hitting a NULL deref when !CONFIG_GDBSX,
XEN_DOMCTL_test_assign_device can legitimately end up having NULL passed
here, when the domctl was passed DOMID_INVALID.

Fixes: 71e617a6b8f6 ("use is_iommu_enabled() where appropriate...")
Reported-by: Cheyenne Wills <cheyenne.wills@gmail.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -558,7 +558,7 @@ int iommu_do_domctl(
 {
     int ret = -ENODEV;
 
-    if ( !is_iommu_enabled(d) )
+    if ( !(d ? is_iommu_enabled(d) : iommu_enabled) )
         return -EOPNOTSUPP;
 
 #ifdef CONFIG_HAS_PCI


