Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50166531DD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 14:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467916.727003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7zFM-0007jc-JG; Wed, 21 Dec 2022 13:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467916.727003; Wed, 21 Dec 2022 13:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7zFM-0007cz-G9; Wed, 21 Dec 2022 13:35:00 +0000
Received: by outflank-mailman (input) for mailman id 467916;
 Wed, 21 Dec 2022 13:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7z8P-0003Di-2s
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 13:27:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41eb22e2-8133-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 14:27:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 13:27:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 13:27:46 +0000
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
X-Inumbo-ID: 41eb22e2-8133-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjJmeMp1lzrElVK3f/hVnEarT0JTe5nQ08DWZq9pq4INx0+rKIzPvsWZjU5dbvHfbHd6uDREvUqRkyaVxPHtCyqURUiziX2bJkDCpbKeO0blVlO5JqJ4r4b8zKwSdEDVcluayKo5sVKM3xkf/seCtotM6qBHZuzvSQH8+ZfP7jtuBkN7r7Bz+nNAykdXL6nbtsOXy8D/nOCBPi/KV7Y3UxFoQGVILObvbuUNmVXUZ+p/wdx3ijG3TF92E7NB3j5ZXE97qoPANJrTkvuHTj2rgoX9FbEekf10VdBw8/wAh/81LPUXqgW4y5qpmp5EBgAdQO183EvDXJnAlgh0LM2+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KksW3pwduy9TjDQH+MFwFhDkAzwXMmeF0LkQ/h+RxKI=;
 b=k96KxKfNglSIJqDeAvnet79qcSSsG/EX/+NPkwWGMSSQ/JLmV9JETYjk8Zsxv4xhD44HcNkf1I1ajG+gw9ma+FADNCDjfsrdo/B2uynJ+oP83OAnTeSmWk043uBqnkpeDkNBCxKN9Gkyv+HGbqRmWV5gYBtSKA2Dk34aS44w7JVL1zQvzP4BA01OFy6Zdtu1Y6URR6F+jMj4l/+H4qJ9nscERO61SY/anCMoao2ww5690Sn77Iyz8aGDh8AMgXJg+3X+SFXC9vWeTp5h+MNthCDQiJ4y4DRYjWfGw3Z0UNdoQ1iqbQ3MT/fOSB4UO4f8lTq2YrS5cbGypwTSKdjDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KksW3pwduy9TjDQH+MFwFhDkAzwXMmeF0LkQ/h+RxKI=;
 b=0Dx23uasr8RfffKfTyWghgAyGOo2jayIL2l7NcW6STq2OLBsTSybF99frJP99t3PKvB0RkKx6AwZPYSL/UAQ2YlmCvCbbiZb3XFL5vwhrCLJcFcMj5QGjb+iPUzRcD5N07l0s3HE5zurRtrI5ykZrrgZzW9AWDTGooGVkFsD9qOM080Jl2nhMrhEWseltWWqfwx6sX6hUDVQyBkvdS2qJcfGC7gAkhESNui94WOLHnsxIVNhbDmzqHuOKKIXm98m39vAHK9l0JRNd4mq1WpeTIclRTvcSvl1nbS4rcda5kMh1jVOVTk/kBWkS4z8NyIZqjWKjUIxbkFVuQ+nOAF3Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b218e950-d5fe-8e14-cfdc-dbcbb6a7ebf0@suse.com>
Date: Wed, 21 Dec 2022 14:27:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH 7/8] x86/shadow: don't open-code copy_domain_page()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
In-Reply-To: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 77352dcf-f3f6-4ae8-fe1b-08dae35725a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jK/BWdiswM6UZ5WiHbFEXiXH1BoBj8i16ZFm0oL0Kt4I1Gd4Wbf5YnThTxoZP5yuYYl2JVHcpRnLJVFmkI0nL4qjJJ0wwqMmhZ18btHRu8A9MvYy9JeMe/VaZei89xH1w8wKeJhP3i2OWNTxwX1ksbUvmWUiDrmZ64UspiPe0/mlBMn1VFKt2H1vUEbTbMImCtJbj0nNnzF/RY1NBX+8X6ebOjDgv8WqQJV+ZkewTYwbJWxat5SHOAEGGKQhnAgzFnHwTI1yASdPRgGhoF/e/dyytpNyiUpz9O+7R4OrJL/AAjYC9BTn7nsgPsFVu/PkJnSETutIpva9EDrk2AS25v+XrQvMcygPtjGoZ6W6yVaafvjvFpJo8ly+yzHM8XvPAHm/Jd4/9pvduiMIJUk3YY6696VyWLy8Or/y47qwQSRUJtykgbDFzbTzedjPojFupZGk+9Pq7ilUlZfHOryZghbw4HjzzN4xUwFDl1z3N2bE0vKQ6+xc0WrXTJqaPt7NyDZS2YhuxmlKt6NM1vND9dFzKgTqMdkIweZW4cj17AnWsRmQTMegjXzcHa+5nOgc3RNna/A/COAXxlgX3o1e2yOsPcjoPCpdGUfvnJDKBgjp1/Rvabmd9uhGmBYDU0haL/aa5P4ZRSM/rTVFS2lgbYGM/6p3p6RH8R9EfX2rqAXuomDiAjb+mKonseDB2TWBQoxwSNEjXzqSf6/I5oYOvfBmm8R82TliyXhhzAoJp4k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199015)(86362001)(31696002)(2616005)(38100700002)(36756003)(478600001)(26005)(186003)(6506007)(6486002)(6512007)(66946007)(66476007)(5660300002)(8676002)(4326008)(316002)(6916009)(31686004)(8936002)(66556008)(41300700001)(2906002)(54906003)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a01kTGtYNm5oRmNPcjJRK2VuTW5USWEyNVdIblg0dGZZUzRhS3RzbVY1S0lH?=
 =?utf-8?B?QnVOVWhCMlBVb1d4R1h2bm4waHBXQXpaY2Nza1ZpSEIrcW9aS1NsaU9SRktT?=
 =?utf-8?B?aVVOUHJaUnVhMDVQL1NGZVlob1RpTXBuVVlaWGNpWlZLYWJLNUhpTWNqM2h4?=
 =?utf-8?B?OTdxVG9TZFFsTU5KY3pya000emRZVWtLK0pzcm8yTFVKSDBqVHpXNHFHT29V?=
 =?utf-8?B?K0IyUSsxLzhNZmdBbEsvRldEb1lpaWhxSndONlpNWDVPKzdLa0dESnZrekhy?=
 =?utf-8?B?cE10dG1ybWwwVHNBSWM1TEJnQnpxZTE4WDJXSHFEVjFiWkozaG5lVU1DTTF4?=
 =?utf-8?B?bDM3TTNsY0RtTHo3ZlZEczBXUG42b09ORWhheEJlMVlzS1c4ellBa0xVdGdj?=
 =?utf-8?B?T294WGg3eWFQRlh2QndDT0dab2Iyb3RnemprRUtvSUdUVzVFS255RFp0R2Rr?=
 =?utf-8?B?WWdNbGNLdHRDRkZKSXc0bTdQSlRvdGVhL1JjMkkrNDd3aDN2d2tjK2tUZGlR?=
 =?utf-8?B?ZXpzKzRicEk5V1phbmtTbWdOTWFKa0FraVg3YTQ2Vk9aRzNBQ2sxNEg1Zmg3?=
 =?utf-8?B?aUpOUEN2a2xGTUNvbGRPV0V3Sm5Sdzk0YjFYUGpZRzRidXJISmk5a2FuUHYy?=
 =?utf-8?B?UXc4TjVDWk9lUjUveTIxTnpLb3c1UzZibXg4cnF0WGJIK21yRWl2RjJuOG1N?=
 =?utf-8?B?aFdmcC9TUXFHRVBKaU80RzJvWWFEb1VvVkp4M1JLWHdZL21uNGdHay9DVGFY?=
 =?utf-8?B?b0g5TFNwcS8zbWh3eExaUkI3RWlVYUorbEVmalU4cUFBdGFBTzE0eGNSSm9r?=
 =?utf-8?B?L29McG14QUJ2eWtkTWh6clVrVjBqeU1TTFFEMi9pZmRlek5ycmlOdGZEQlBu?=
 =?utf-8?B?M1BUQUR3MzV2VFBpVVdiMHh3NlhrcCs5TU9hY1Q0TkFZbUNxOXhpYmI4cGhO?=
 =?utf-8?B?ejF3bzZHRDlNc3kxaERIVjlpWEgwRWNCa3hJejNESlFvQm5OUllsdjhMcXpR?=
 =?utf-8?B?QVl5Sys1SnZ5d2NpcGR5c1BFVzFXMHhjOGtBK00wT3JEVXFWOEd4U29NUCt0?=
 =?utf-8?B?OGR1SkN0SVAvUk5RNzgwMGtmTDFSRkJFT2VsaytlSFIzRW9uYU5vODUyYmpM?=
 =?utf-8?B?L3BxZnovMDlGU2lsWWZBakFZQmlETXNscnlGcFFLdExWcVRkbjlFZTV6T3Ix?=
 =?utf-8?B?cXpMdDdVdGJJSVlka1d3dm9ZODZxakwzSnJBOC96MWNiMDdaNDVydndVSFpY?=
 =?utf-8?B?RmpmRDcwTHllWE56R0NXOXNTYnk3SFpzdkVwWDMxUWRSdWFDUXZWcE1vM1NC?=
 =?utf-8?B?SmErMzV6RlprVnNyQU85SmJXT3ZBZHJmY2FOWlJ0VEJyS1oybGZVVUtVVjRy?=
 =?utf-8?B?VXBpSzVCbkFXeUh4SldENEtjcE1teFFDdnQ5MDhCeWVEdVovUTRmcDgzRVFO?=
 =?utf-8?B?N3NvWlB5aUpvdThQOGVJSkdTcnlsS20ybFlXMzZwS3Y5alkvcFVxdSt0WjV4?=
 =?utf-8?B?MkQ5SXBDNjVFWWpudEVEdDVOc3p0QkI5Kys5cnJPUFczL3B3ZVNqODZsTVpZ?=
 =?utf-8?B?SENqMW1UZnFHSTlYaldOR1plMThUU1diNXM5aWJvTUp1V212TkNaOWFMTjZ4?=
 =?utf-8?B?bTBLSHovRzFld2ZoRWV1REVwRGlocmZ0Ynpla3BjWVNydzZKZnRpdmJqRzhR?=
 =?utf-8?B?aDZQQk5ZWnJPc0hNOXZEaW44Zk8yN3R3WWQxbUhISWlnSkpZay9PT1JYNXYw?=
 =?utf-8?B?TXNqc25ma2g2M3hPSVJzK2x1akY0U3VWS1JRVXVVUE9jODdnb3VEbXhQUVhO?=
 =?utf-8?B?aC9heUZPUkYxb1dObXhnQmlLZW5sOUN2NUU2Wlkra2EwZWF1czB0U2tCYUpo?=
 =?utf-8?B?YWY5M20rbzVpcUJaRGliZ2tBR3pBL1BhaWt6bWh5cEFUWENkYXdyMzEwY2lx?=
 =?utf-8?B?RFRQZFRnQy9jSGhGRG5kWnFtYnBSU1hjMCsrYU5ISjlVN2JBMWNnTW80QU41?=
 =?utf-8?B?N0NIVG4yTmJ5YlIvOUF6T0lLb2JNTHQ3cmFGdXl3djhWTU5Wa1dteUorRnlL?=
 =?utf-8?B?NHcxUFBFaVRoTFFHY3AvenJFU1daRTFYanhoa2k5Zy9qNEh0Nll2M2pLWU5G?=
 =?utf-8?Q?MXW0ieuZ3U4ToOkjk8f3BWTyY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77352dcf-f3f6-4ae8-fe1b-08dae35725a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 13:27:46.1254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQ3+oFk1U2LX0EMKwU+FqB2zx65c/DxH6NnsCcrJdmx6b5X/dbcjTEHNLm+9esY4toL3YXZ7gcqhOlWpYtKlDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8582

Let's use the library-like function that we have.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -455,7 +455,6 @@ static void _sh_resync(struct vcpu *v, m
 static void oos_hash_add(struct vcpu *v, mfn_t gmfn)
 {
     int i, idx, oidx, swap = 0;
-    void *gptr, *gsnpptr;
     mfn_t *oos = v->arch.paging.shadow.oos;
     mfn_t *oos_snapshot = v->arch.paging.shadow.oos_snapshot;
     struct oos_fixup *oos_fixup = v->arch.paging.shadow.oos_fixup;
@@ -488,11 +487,7 @@ static void oos_hash_add(struct vcpu *v,
     if ( swap )
         SWAP(oos_snapshot[idx], oos_snapshot[oidx]);
 
-    gptr = map_domain_page(oos[oidx]);
-    gsnpptr = map_domain_page(oos_snapshot[oidx]);
-    memcpy(gsnpptr, gptr, PAGE_SIZE);
-    unmap_domain_page(gptr);
-    unmap_domain_page(gsnpptr);
+    copy_domain_page(oos_snapshot[oidx], oos[oidx]);
 }
 
 /* Remove an MFN from the list of out-of-sync guest pagetables */


