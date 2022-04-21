Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA230509DD4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 12:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310013.526588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhUEN-0008Cf-IK; Thu, 21 Apr 2022 10:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310013.526588; Thu, 21 Apr 2022 10:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhUEN-00089p-FE; Thu, 21 Apr 2022 10:40:11 +0000
Received: by outflank-mailman (input) for mailman id 310013;
 Thu, 21 Apr 2022 10:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhUEM-00089j-9U
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 10:40:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a4c62e2-c15f-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 12:40:09 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-ESgn8edSMpiQh-sI6cFV9A-1; Thu, 21 Apr 2022 12:40:06 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8789.eurprd04.prod.outlook.com (2603:10a6:10:2e0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 10:40:04 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 10:40:04 +0000
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
X-Inumbo-ID: 6a4c62e2-c15f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650537609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZPRI9TBpt7NqvcTDTjDO9kvTzuTJer701WOTHuYIYd4=;
	b=CL2YUmew2hko9etCuBtuDNmBrjlUX+/WZ/+8w4OkTuKNbLnsoPOtifepxvG4KeQO0Ub5rc
	5YXUeMLjIINRXJA0NFxPNaXm3SzPxf1QW9Lb2Y5acvNyTB941By1nVXUUmXrpuVgW0dEes
	HphcZdAcLAtoy7gipPUI7RiIUAR7CFw=
X-MC-Unique: ESgn8edSMpiQh-sI6cFV9A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxqgaOJVIqKd7gvt/mc2X9GbxGYWnp+4pv2nOeh/fgqJqFlENhdQ2QTr6UqQXE88cVmiqZBNFVNM25qVc2raA2nrYVEX976TTGyhP8ZIHWNx7AOcN1VxVPxxb1XqEHrI5uOZws5QY3NIhKl1qRrydPpo4LjzzPDhAunAIwM/kVJTDn2/EDm/D+rEB4EiWfT5U++iEi7eE9go/7WgvN633dnP0s3kJ/5icgM93N0f0Q2O2P7NsAL4mbHwk0Ioahe/Z+Ig4Bh4iPi58PgzfIY0umI1MZFvrEqaSLeGjaUXJFbkYQhFaUvabYmvqT1atUI+9nvUvzY0mWx0huIPUZaBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPRI9TBpt7NqvcTDTjDO9kvTzuTJer701WOTHuYIYd4=;
 b=TRSbRNAKEexT0U3RHsj4llRA0vpDM79rMERKmqQB2l7G2Gdw7Vpa9Zx+fzr+fw+cFtxYZwcTvF9/mJRKQ78CiU3jeV7iYkLqLDtkYJko2jQ1SSDaGmapApMyY68VUYt+04V3Ozo/A2vqBct/6E8iaP831xjMoIoKdrctl5a3pQVPg/7i1jBMZU6MQXcdKqqG9Xe7EZEX/fb3A9hpb7kI8Z2jrAwVBctEFh84wSWCFRIpr9qQdNO2VAhpHlLHTYSViFMeHuPcqN+8oM4V1j8Wuikjil2dBCz26xE/N4H5eBOtX3gfOp+1cU9n/a+GXR2l1N/4T2s2YHu2y4JcEoh6uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <971a1a9a-ab4a-38cd-2c20-534846b440f6@suse.com>
Date: Thu, 21 Apr 2022 12:40:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/build: make linking work again with ld incapable of
 generating build ID
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0121.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed2ee7c5-be7f-4eb1-7bf0-08da23834bd8
X-MS-TrafficTypeDiagnostic: DU2PR04MB8789:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB878905FD533844A216E255F9B3F49@DU2PR04MB8789.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FLES9CT8AK7JAOHnSrVdHebjlAMoqE34wyXVvCQgDd7dzgUNSatmUL8cbhr6at6okBOxLE2vBTkOCRBgcMLgbSU7zERBi16Zq3Or65vAvmsJLZVS+0BHuLknjcQvZfBb/Y3HIDR8mqi33vpfnVmklJNO/gqXzJZWxn17rsYgfasAT6yneIaXG90qjSC65w7N5PU9y/qAOyXF6Tln8M4VVwOFRcN1j+lbr+WZEEHlwGRtdSyMU3fMENf1jb7+vXMJM7M9eXmGcglOe4Uhyuu41Bm/M63BCL2UAzzKyI4REOlEhA7osiPoEINZHI1SSjN1AiOx/deA6GNyU7SMm6AYMrkP//DS4ME6GbFat9CrQC/PRFHpTnoQpZpwl8OREz36k66Fcl1xTmsWzOw59DJPKgiv2DlsFMl+DA9sjSYm0UkjZOuy9H9QaBthpri+PBefQLAclSkL8yK6aporAxWuMCB18urrXCrZeU3poIAQtFt0TLBgyV7dp37jerwQmof3ETSvE1aNDYAWUlc3N+iRbhoks/WQdJE2FQ9sc8hIPhWqQznwrQXNSPMvyXnzabqNTAJYXJFlqLD7/ZivZDRRwcJ5Rhbhmnt2z8I2d7CQOd7E/zQbZ7ag2AYqBVrTH27dthddHIJjPGFixTLYrcPthye6O4MGx/HA+MLZtwP8Wyp79AjDcjjLqBDHdO27Y/DQD3tFilcxgurSxWEMdRDLclsuU9OWTAmBr3ywlEjdUhhJbxxY/YTHXCln3h+2L3au
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(4326008)(508600001)(31686004)(38100700002)(8676002)(66946007)(5660300002)(186003)(26005)(2616005)(36756003)(316002)(8936002)(66476007)(6486002)(2906002)(31696002)(86362001)(66556008)(6916009)(6512007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEdCTEJxT0o2STRzQzFUU2lzY2d5cGFtVVp0ZVdidWhTcUZZUHpHN0hLKzFt?=
 =?utf-8?B?TmxBYk51K3FiQ3VzMUl4cHUwa2M3OG1xNVJmTmZSRFdEU1lmQmNtNXE2MXpS?=
 =?utf-8?B?ZnBMS3BmK1c4aTlPZlhyOW9FRmhtNlJmZzJTRDdWNy9xZWZkaW5KUFBQTnda?=
 =?utf-8?B?ejNqZm83N0Vya09MU0NVNkw0RXlablFKbDJwMXEvNkVkNDBnb0NMOWwrcWQ1?=
 =?utf-8?B?eFVvOUt5aGNHL0FBb2RuNDQrMGlJZCtwMnczZEVWSzVXZ2MwVHNTVjR5b3Zq?=
 =?utf-8?B?c0tialFYOC9jWjhjdkxjeExmTlR5a3JTSkc2RnFsckZ2WFdWdWJXNmVYYmty?=
 =?utf-8?B?eGJWWWd0czBwdU9TaWFBd1JNSFlCS3ZxekNNU1NiYVpGSUNuRmJiczlqWlAr?=
 =?utf-8?B?MG1Kb1d5bXh3NGFMQW85Wk9taklvenQvS1lDaFBrQlpHNmpUbnRwZWhXS3Br?=
 =?utf-8?B?dFdXZi9wSFNxWjN3bUpGRVQyc1M5WGdMUnMzelZmWUV4MzhVaTJDcGV4L3BY?=
 =?utf-8?B?SEp3angxYjJMZWtqdytxaWVQdlllNXhNTVE5OE9vVDBMRmd3R1IvR0xCTHI2?=
 =?utf-8?B?SHVWNHVmM0xhc2xGc1kwYVNjVy9KVU9KWk1hVDdRUEF0SG5seEtobkVXeHBV?=
 =?utf-8?B?dDVvd0s1aUs0NFJCRU1URUZwMERxMU5pK3Z0bVlZVHVJeU9JaGtQTGhFWlpl?=
 =?utf-8?B?Vkdpejd0RmN1NzNzZGFGU0JGR1BGbjVxV3hjU1RtMDlCYTBKNW5xeW9wdDV4?=
 =?utf-8?B?YWppMlJiRFZCdFl3VW13TFBkcUZtbFM2TENzU0thMkdGMjBjUi9Ld0F6NG01?=
 =?utf-8?B?ZnJIQWNnZE1vKzhaTEloODdOK0w2U1Y5aGtvSWU4d1NSTUtSTC9rQ2dVTlNp?=
 =?utf-8?B?OXhCRlhDK21lOERGZnFvZmhBVnVtUm5zOHZqYlVtaS9vaEc4bEZyY01qQm5S?=
 =?utf-8?B?S3NNcU9LLzRTVlpsUTBtZi9uVUczWWxUKzJ2bW1YaDJQRDBQRXYybW9FRXhU?=
 =?utf-8?B?eGxvajVQWk1KYmZ3VjdnQkhGMDVNVDdNZVhnc3BsRzZtYklxckdCUWEwdnhh?=
 =?utf-8?B?eGM0U2JtdDR6YXFkSzFPcWFqTU9laUxwcS9tN3JKT1lrSzR3NHV1UXc2eSts?=
 =?utf-8?B?YlNNc2puS000TisydXc3YkZLM2IzRUpZMjVVK1JGY0UwVldXTUE5UEFFNVJV?=
 =?utf-8?B?Rkg0a2djKzNGekFRWng3a0JSZXFzSlQ3RzRDN1NxUXEvclVIaEd2YzhTVW1D?=
 =?utf-8?B?dFF4d3loLzRIQndkcDdjME90UjRjTytDOWFLN2xZYkx2Wk1wb0Z4Zk95SmUx?=
 =?utf-8?B?U3h0dkpQRGxmQVhUZ1RpK3o5aHZHbUxTbHhIRU4vMTFJR05TTlJma2YyT05y?=
 =?utf-8?B?b1NPLzVFbkt3bFBUL0FwaGdNRHJrTDQ3R1VoSDVLb3QxRXdwbDQ0b0FSd1Iv?=
 =?utf-8?B?SEUrNDFDUUU4Ri83cXRnMHU2Q1hXd3hmSS9hZWhrQTF1eXlDQUdaWi9QUDM5?=
 =?utf-8?B?MVFwa05DaU1WdDVoOTdKZzUrMDFWeVFmVWFFOHR0UVVvNE05MGp0RGVmcmVO?=
 =?utf-8?B?ZEVVQ1Nab1g0c3h5d3I1NUY3K1gzbHpDM3FsSTYrVkplVVpGeXFFd1pDZDBi?=
 =?utf-8?B?M3BCNzVML1VnTDZKSklhTmVpb1NUclJDRklpc05ic0JoWDZvTXFhUmVEc29W?=
 =?utf-8?B?b2ZDZThyWElSVGlocENjalkzVmZUU0lEdEgyczdQOXRIaEt3a3NhaHgyOWNG?=
 =?utf-8?B?emVvaDBIRjJqWmJJc3JSbkFJWGd4eVFabHdZNm00SzJCVndOYk1pZ3hKZWxY?=
 =?utf-8?B?WDdXY3g2aG5wYjZmVVNNY3RWaDhGWmpaV1VGV3RFSjdXa0pFL0h1SndFV1Uy?=
 =?utf-8?B?MCtBdVdGblhWMmEvYm5RYW5IcmxGbjBGaVgvT2RLWnFyR21MOGFOd0paUFpt?=
 =?utf-8?B?cVVaWVA0d0RvSTlMSmNWOHhmZVdEZldaRTlpbW9tb1FLMG9nVE1IMDhRUndG?=
 =?utf-8?B?QzlWblpBZFZHMktTNFNjUGJxcmFVZmZrTDVIblBoM2NKRFVYZ280K3VBb2V3?=
 =?utf-8?B?MklqZDVYZm5HL3V1Vk9RZ08wSFRwb3RXYnl1bS9LWHNJVU5NZDVyc2tWdG44?=
 =?utf-8?B?MDJNWElQUzNWdTZWSWtXQ0JXYVBRMk1oUXZwL3BMRW0xVW1ubXFUeU1lZW91?=
 =?utf-8?B?OEw5TVdDaU5UNytDU1krRllFQ0FUSGZNK3dVVGI0Z3Q4Y0swSnk2VU1acTlC?=
 =?utf-8?B?WkMwS3pRV2pUUGIxbTB6QUdtM1BJODFRRHNSV1R5Ynp4WEhSU2FpSHdrWWJp?=
 =?utf-8?B?ZXZ3NnZUMCtFK2RBQ3RlaTlwUDRTK29Vd0xHQU5WRWxhWlZrc0pJUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2ee7c5-be7f-4eb1-7bf0-08da23834bd8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 10:40:04.8544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5HliHGpybZi9K/rViXoIqQSJ5L/Ud/XqFhN+pqMb4cXgprJCuBomJXbfhEWF8aOSF0tGhGMybT5nSSA+DFfMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8789

The retaining of .note.* in a PT_NOTE segment requires a matching
program header to be present in the first place. Drop the respective
conditional and adjust mkelf32 to deal with (ignore) the potentially
present but empty extra segment (but have the new code be generic by
dropping any excess trailing entirely empty segments).

Fixes: dedb0aa42c6d ("x86/build: use --orphan-handling linker option if available")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/mkelf32.c
+++ b/xen/arch/x86/boot/mkelf32.c
@@ -320,6 +320,19 @@ int main(int argc, char **argv)
                 (int)in64_ehdr.e_phentsize, (int)sizeof(in64_phdr));
         return 1;
     }
+
+    /* Ignore entirely empty trailing program headers. */
+    while ( in64_ehdr.e_phnum > num_phdrs )
+    {
+        (void)lseek(infd,
+                    in64_ehdr.e_phoff + in64_ehdr.e_phnum * sizeof(in64_phdr),
+                    SEEK_SET);
+        do_read(infd, &in64_phdr, sizeof(in64_phdr));
+        endianadjust_phdr64(&in64_phdr);
+        if ( in64_phdr.p_memsz )
+            break;
+        --in64_ehdr.e_phnum;
+    }
     if ( in64_ehdr.e_phnum != num_phdrs )
     {
         fprintf(stderr, "Expect precisly %d program header; found %d.\n",
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -40,9 +40,7 @@ OUTPUT_ARCH(i386:x86-64)
 PHDRS
 {
   text PT_LOAD ;
-#if defined(BUILD_ID) || defined(CONFIG_PVH_GUEST)
   note PT_NOTE ;
-#endif
 }
 #define PHDR(x) :x
 #else


