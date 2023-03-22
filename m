Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B06C467B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513223.793935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peup7-0007tq-7W; Wed, 22 Mar 2023 09:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513223.793935; Wed, 22 Mar 2023 09:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peup7-0007rn-3f; Wed, 22 Mar 2023 09:32:01 +0000
Received: by outflank-mailman (input) for mailman id 513223;
 Wed, 22 Mar 2023 09:32:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peup6-0004un-HO
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:32:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6534e422-c894-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:32:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7042.eurprd04.prod.outlook.com (2603:10a6:208:1a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:31:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:31:58 +0000
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
X-Inumbo-ID: 6534e422-c894-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eawRySaNBs4vSIrHtUbDc7smNJcFO6XQAWGtQiHm6vwEHg3cKdYPLNfYCfD39oTi8X8dgviTv3rsdDfTuW7SYOFMy9DjjmCLF9MFoaCfCzCCxP6770G96qrWKjTT4UL53SO6xU3rkbn6UgsrOOMOcfjUL0cigASaKLPTWbFdM55sAM9GoxWfpEGWB/KomaQyW6MIKqM0zkXtjFOw45UYBQ5ay+5LMILrrY6vkg0ExBSMw/WNyp98ns7ycOmjQ+h1iQWPQBC8KYiDR6UdwdfMD7BJKkI6mpSiMuuvC/SdH4loT6qxWH0FtowPahsybVqe9pv5YpGfbcH78FaFY+pE9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o37qmZQGz0dUPVarEE5M4F8gAAfRaPl7Obs64dcS6gQ=;
 b=g547sFG6TVthbvW3UmsnIygLUVurjYvLE05IGH57lneXb1+wHWMpHoti4mNH/6esgOxIKVjHNJcWZ4XnO7Rh5qv1PvIdIlBWHxORWClwz5Wp+LnM68Vv+bEE2EBCevSnXh6yoDaeNxW4Lq1WHZTxy4dxFh1ZWDk2SQfq1ELetEUfmDZeR9O8fIPv4N2cuN6lsKv7vpCF3I+SFGARWdRPM41iOA1tcaWqi1FzhD6QmGqPRGvPD3dOIe3VdHRVAjHzDAEJ4lRKTesFq8TJZ2QTrdsC9J0Pwt85hgJWqAeAvJHa71f3jFqJJu5rBHAMm9Wfs33QO+lP0H5uZmXBLE1Gjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o37qmZQGz0dUPVarEE5M4F8gAAfRaPl7Obs64dcS6gQ=;
 b=H2JUrtVDKzGDVlh+nanVz5A8hnUn8e8jJq/N7wDQC2z2Ra6UcdTfoBOV1lKY5B2zWvAnY3ubDWHxPXDPDjKQIvPtjUemx1b/PZ7+HnrLnTM1sIDr163aUzfzxKzct9T3erI6tq9+Hxhx/xSGhW4TZ48w4CnTOBwFdMCk++qEwZ8WC7iwOFOYj0V9iXcpUrvK6WEi+scyK2d7+vabggszpg3AHlTnoZpEbBdiv3CUzLD5Dq+ud2eKky1ilQD1j1bxTePRzOkRG3wHxrb1Brk3iNXkz7ID3MzM5yAA1B5YzUKvR9AM7qUoO5m8FlX0KXMGwIfg9tFeufCTmZFO9pxJcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bff1cd1b-b2cd-0ffa-992d-74583a78ea0a@suse.com>
Date: Wed, 22 Mar 2023 10:31:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 05/16] x86/shadow: reduce explicit log-dirty recording for HVM
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8add92-f6e5-47de-6741-08db2ab848c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ADWDrIRM1I9GPodO8xTVzfqsoVFKnlcdrgX134O6LDNHjPvtRYKCchl4YDAXWE89MH/NyTKoXkkIl5IIE+5AJ93e3tMy6kV79BQ6kNWkDRSwMX3JqOw3YDVaWSo0vyC8oLVoLiHWQSHBqxabByrQmmFKW656lMjI4Z6iF3rbBbsLHGC6XcSM1Yf/xfSxFeEIB0EHG2XF2Y2L85XDTYXEDSprLRWoIJDrGAxJLrQiacjmMXNUTWYfA0IxwtiXcSoXiAsUXNLOzu6lntZYIZNhWUJ7VwVrkF69JEGgRTDSohhiqDjDQIpsMaZVryvgQBnB05/BPLBCIn0jPfYwxqvNXYtpHmNqqgOFurkJOw6XguYiwUuDujW1s3HQ9wRsP8FAwBIw85XU/1jkcZc07/V5MaD2BHxK2dc7ord7h0aRakAAMkK9gRmn6MqBaHqbHDit1kyHo15IKNYDLvDqcYg9S/vmht20Zvg3NCIlAMNSdosiOUMbwApfVOAIVjUY5ttLMAD130/h5TDMMqfkYtJ+15jaYfbD8fjLSMnsZAphU8NXQtEdWDJ8cdRCIrh8lEeKmiRgWftqHBZ+EmIAqC4GEKmc82ns9axTByQ0NGwjOuemVXYwzIr8n4Zc6lUeL8316uWCoEhlkEHQDQunEPsZ6PPVk/YOXpU295yFPheskbDZ8y7iqBhcyKhremjnxHCkLsRWzaFqazJGusowvrScXh2oYqYe6ITfJhZVq9RXdpKiBvvLW4BmqD2OJe7dmV4V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199018)(2616005)(6512007)(54906003)(86362001)(38100700002)(31696002)(66476007)(8676002)(36756003)(2906002)(8936002)(4326008)(66556008)(66946007)(6916009)(41300700001)(5660300002)(6486002)(6506007)(26005)(316002)(478600001)(186003)(83380400001)(31686004)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1JvTG50Rk05L0JtK1VqOURJc3hCZjVqT1lOa1Z2cjFZNUxCY0pWaytZcUR5?=
 =?utf-8?B?Q0ttOGpENXRHajd1aFlwSzBNTXNQRXUrcTlpQzNOQmd5RTFlUVFoTm9PdUhU?=
 =?utf-8?B?MEE4M25IYnFhSE56a05uRXZwMmtHcnhwdUNMUHlNM1NtMVMreTVIa25DeXZq?=
 =?utf-8?B?bGhqZHRjU3kwdmhmVmMvSm5INDdxK3hLbjVjRGZ2ZExuRGxYenZRWE8vZ0tr?=
 =?utf-8?B?dGdCVDl1WjNkRWxHY3dQaEZUSWE1ejJVUWU4YmNoUktCUE1vQzIvU2w1czFY?=
 =?utf-8?B?WnhpWDF1cFVrelkvMHA3cnRxMm5IM2g2ZTJxQnJUc2ZCVGpDRE1RK2dxYkFr?=
 =?utf-8?B?QVlwd1Z6WmlqZG1zaTJTVEE4ODBXT205bWFnc3lFUGJ0eUt2MVdnSlhqWGZi?=
 =?utf-8?B?U3c3VDJ0TWFnTW55RkUvbllWMnFQeWRGeFlLREtUMlBVbWZDMDdWZGNweW5N?=
 =?utf-8?B?SEkxbnlnYWN1LzFySW9OYjBrWDNMMFkyUHhPSmVkTUpGemY3b3BuTjI1UzV3?=
 =?utf-8?B?eXFBdWV2bXloZ0lHRHpzdWZxUEphNi9pdGFmSVUzRmt3WklsUGFla0RQWG5I?=
 =?utf-8?B?YnNhd2lTSDV4dmdEQkhCS3hhOHNsYmNBT0dFTW9NY0djSk5uNjdDWGdjSzhn?=
 =?utf-8?B?b0JqWmNpbkdIVXgrbWFFQmZrQWh2WEtKRVpjWUk1ckJlSUx0MTArSjZNOHRJ?=
 =?utf-8?B?cEcyZGR0VXpkK1p0dndKSlN2YXJzMUxUYmEyQ1dGR2I5dDhZVmNTWnBjSWZG?=
 =?utf-8?B?L3FYQnU5MXFqZ3E0Ump0S2UzMnFQTkNzRXMxbzFZL2U4R05zdmhFQUJrbXQx?=
 =?utf-8?B?dko1WU4zVUNrRXJ0OFdqZENOdE9VY0JteXo2ZXhBdHhEdWpjRnZqSlpOeVky?=
 =?utf-8?B?dm12U3IycVRsbDRLSzZ5eWdtZE5kcHU0YkY2dUc3Yzg3d29pQ3NOLyt3eURp?=
 =?utf-8?B?UEdoSndGdzFkOE1aRTNwaHh5QzM5QUZjN2pBR2hBNzNDd1VobWVDekVlQzVw?=
 =?utf-8?B?eXFkTXRJQlhOY3p4VU5Hb2NheGoxODl0MlJ2NzVpdjZ6eWxyN0Z2bEJ0MGJZ?=
 =?utf-8?B?SzA5Z0xJZ3QrcTlGMkprYzNBV2FCQzNNZjFPamwwY3oyN2VQQzVnZjFaeW5n?=
 =?utf-8?B?TU9FWlVFcXlQYlBJVTR4aTlrdGZKdHRlZWRYN1dYQW0rME82T0RkNDFodnZj?=
 =?utf-8?B?TEVBMkFNV0xVd0NReFlTMmFwRGgra3hBUWRQbThidEtrS2hqc1hqdFBiM2Nh?=
 =?utf-8?B?THVNTldMRG9jZ0tCc2dXdGFiVzUzOUlMclJaNFUvVThLZDMrQm5jOE5zaTZp?=
 =?utf-8?B?MmZNN3pRR29CaXhlenEzODl0MFZSSXpqVEwzbHhmVWplNjRINjdnL3crU1NS?=
 =?utf-8?B?dWFGYVdpUWQ4cDIvbHllWmh3M1JWQkZNWkxVWUtWQk1ZWjFveUE5M04yYnFj?=
 =?utf-8?B?YmRmcmVEMEVDdGc0QldTRGxSQngydDR5M2VNbjI0QUczNEwwQ3o4VHZoZmFk?=
 =?utf-8?B?d0dNbTRCUnp3aURVaDVMY1BWYmxOYVVRQTNING5vN0ZEQzk5MzVKWmFwN1NH?=
 =?utf-8?B?TVVIMmg1c2xyUU1XUkNlT3RHb21yRktreUw0NWJTMW52TFA3aVRyWXBPYkRj?=
 =?utf-8?B?TC9WOHdOQzd3aDdhZVg1WTU0Ty9ReklSRVd1SWRkOEMwS0U4a2U1S0tHSGRj?=
 =?utf-8?B?L0Q5MWVsUFUzV3ViajY5cnZlL0ZKQlp5MzBsUEsvWUo3clp2TkNmMTNaUmhW?=
 =?utf-8?B?b2tEZ3FFZDRmeGZhdGJ0djJuMjlxUWJtQ1RoV0FHUlNxVWNwNHRHcmtCa0lZ?=
 =?utf-8?B?QUtkVkt2WHVVZVoxU1VwZnViTDd1VkNCKytzblE5TExZeVVTaGdTUWhDLzJI?=
 =?utf-8?B?cllKajFsR3B5a2ZaaEFMS08vc2VnazZFQkdRT2hueUY3d3k4cmtqQ2pXUFZz?=
 =?utf-8?B?OVpuLzR5LytkMmpENmlPNnByalFnZUsyWVJySzdPcWtWUlhJL0lNS2hZQ2gy?=
 =?utf-8?B?WFBzUTNnMU5WQjBJZDE0U1lRa0Y2Ui93azcvY1Q5ZlJYeFJYaGdWS0poRVU4?=
 =?utf-8?B?QUwyT3dGR1RoNG5hbmgzdlg1TW5qYytTeTVnNHBMZG4xOThNaG9Tc3B3THZW?=
 =?utf-8?Q?cyw2vesPGaKpTLxJMLON3iTKC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8add92-f6e5-47de-6741-08db2ab848c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:31:58.7109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsUMzQuLOZzCHzYMPDEdlNoQ5VX5sYasWWl9k/ie1dRF+O0MgjyPfCtFOSBFHWm3L78E8Bhpm6ZNBfx5Ac8PgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7042

validate_guest_pt_write(), by calling sh_validate_guest_entry(), already
guarantees the needed update of log-dirty information. Move the
operation into the sole code path needing it (when SHOPT_SKIP_VERIFY is
enabled), making clear that only one such call is needed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -656,6 +656,7 @@ static void sh_emulate_unmap_dest(struct
     {
         /* Writes with this alignment constraint can't possibly cross pages. */
         ASSERT(!mfn_valid(sh_ctxt->mfn[1]));
+        paging_mark_dirty(v->domain, sh_ctxt->mfn[0]);
     }
     else
 #endif /* SHADOW_OPTIMIZATIONS & SHOPT_SKIP_VERIFY */
@@ -673,12 +674,10 @@ static void sh_emulate_unmap_dest(struct
             validate_guest_pt_write(v, sh_ctxt->mfn[1], addr + b1, b2);
     }
 
-    paging_mark_dirty(v->domain, sh_ctxt->mfn[0]);
     put_page(mfn_to_page(sh_ctxt->mfn[0]));
 
     if ( unlikely(mfn_valid(sh_ctxt->mfn[1])) )
     {
-        paging_mark_dirty(v->domain, sh_ctxt->mfn[1]);
         put_page(mfn_to_page(sh_ctxt->mfn[1]));
         vunmap((void *)((unsigned long)addr & PAGE_MASK));
     }


