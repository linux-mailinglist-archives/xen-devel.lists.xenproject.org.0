Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B9E662755
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 14:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473637.734348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsNg-000737-LJ; Mon, 09 Jan 2023 13:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473637.734348; Mon, 09 Jan 2023 13:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEsNg-0006y3-I6; Mon, 09 Jan 2023 13:40:04 +0000
Received: by outflank-mailman (input) for mailman id 473637;
 Mon, 09 Jan 2023 13:40:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEsNe-0006U7-QZ
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 13:40:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d298941-9023-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 14:40:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 13:39:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 13:39:58 +0000
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
X-Inumbo-ID: 1d298941-9023-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIhcv3sj7hHMzNyVFwdLe1PWuBigcoIRGMpDC8tsMA/bODvEVSAaL27RqYaMEImUl13K4mpaxLlGbj/rmL52XmaVssCUuUWA/TTZkZb3yFTshLar+yv2ORSjothtefUNEebr4RVkJ5rmju1xgDE0zZUMWGUZaxvGPBttKwp+jkWM8LOPQ1O6cfmXRXYGdNoJwdE/wu/42364wwAj+d3emm0VeeBuxa5uGbxZQqe41ZQijNRkBuev5PqeYiegxtdZVo7vMsFOgSMt6rYyoOO8JRPXiO3x/N8+atwLovccpyQuBmMb2pwxfPlKIh8hJVCFoF9ps8Q/lCSaaY3oUXXA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCeUlm4/DsmO3G3gcntNt7cjbvdyT3iGeg4tOoUssFE=;
 b=Mb28XGvCoXUrcF1+Lw16yDhoZmXYAcfjSlEQK9Q9E9/7QkQ6VL84YzTOuRTmnmxNGgzYx58HTUZcdMdVGw3LK397B4UGXJ0SxAQ1lKxNhYSw1VFxwQEtOVG9sIfQfVKktS5UffBB3HKpuOtY61vkRuRxHn5KuZcMEK63+vqkt/8C2H7rbFNrYQrsakeq/N9EUWjPe2eeHj9XTpOU4znF7W/Ae+PALX26xWXRFs2HyyOFFxWsqfw05bffkg+e+MIOnZFnw7/zRmeJwYFtC17tF4EKzUU1PUgzaH/bdrDGQTgH6d1JILea/upUPDSqUIVsmNQNCj2mwqgS7adLaOzaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCeUlm4/DsmO3G3gcntNt7cjbvdyT3iGeg4tOoUssFE=;
 b=RQLvGu4kdQVpYmpAfMhbQ8clm6tM9gVB2KHZAo+K+VXk+RA0TY1xDLpoIroxA9l7dQY2MgLklH+CL+C4oHerutN92UD+eKaIgYykQ8DXr+tJDc+zaP7gmYUWvkJaGjkffTgPHUtxpDT7V1P8kmKsK75b1Z1jCgNu5Htfqy/Ul35SBCVH/ZLQ52DSwnAzlJ4FkdZamytXuVpSBEkEwJiwzDR8xd/MZFTwwjeBEhe6jZ4556QGBF7fkcVXmvBp5Uu1Tif/LA8xpK5xpoQLTXPsSV5JaL4guXRkoZiOqfOu0FCLi+yOidWbnHRk3+0WniymMsnNMJaPM9j/pLyvn6r1Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99270ce9-39d8-1f3e-f922-afc2c0289205@suse.com>
Date: Mon, 9 Jan 2023 14:39:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 2/5] x86/paging: drop set-allocation from final-teardown
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
In-Reply-To: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: f2aad4a9-77f8-42c4-650d-08daf246fd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m9tBaVBaKZbhgx18EP3tSG9OpEvRjlycY+WpeubIJEdOPBtQPibYDHuzJ1Y2C+gatL/vlWPQde7TAS0PWRY4bD4JrXpMslTtAttWfh384sPLqnvx5Xya3z6bOA3+8Ll2S0RIpRFAyDM8jygW2I4PiEbuL/m6CaMZPfQ5VCeSOOSGpVzgK8joMdowooy9QY1XqhDu0+WOGhoCCjt4KQApghc7SPLraXgUvIGNgzE9UiEENC94tEP0q1m+fMDG2fkct/Lu+38tkIZN5Wn9mZw5opMSCfeIlWSXsxJIF/9JouiBlctiSj6PrJofM1joULwUBkrBPaKobxIbGgzGw85h/ljSXszZHlHDuYGTpOUquNhLQ28Ji6RpMB3usbiEVjLJHOoDkJ+naEavCjZAJLzJRC8J4Le10VfgA1B3jYQHFJX8DBt2eZJERTrpWYf8Q/6oyImPHPTXlIRTxtXtJOsiaBs+/pT9KVLsvB8gAiVVSwzT/N8KT9Isn8Bj+F1ugyo3+SCtyoetSfGu7DoDXfeALfIzE7uAvlMJikajcP/2uoXlYIdTSP/rn/wslHhN1MvnqxkF+okSH40aYrumVy/zfk51IPlfoCFFx5WzwevMPpo3B2APjtP8YYBm51/BmR9K36uwvkugwyQ6qYNSyzmG8reH2c3OIoj7qug89HIFDyjJ9BGbisZLSRc/P5eS82gUplTfRDIPt7X1j79TGU27p/h1eSKbbMLAPk1bEbbY7/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199015)(4326008)(316002)(66476007)(66946007)(8676002)(6916009)(66556008)(54906003)(2906002)(5660300002)(8936002)(41300700001)(86362001)(478600001)(83380400001)(31696002)(6486002)(6666004)(6506007)(186003)(6512007)(38100700002)(26005)(2616005)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXJPTVRlbVA3OVk3VkV0YWdscTJvZVRSWndHUmdHVDQrOEoxWEdrMmRoZ2hZ?=
 =?utf-8?B?MlpMd3VGWTlhV291MXUzcDNSY2lpNjhFN0J0S1V1RzAwcklOV3hUSktzaFlz?=
 =?utf-8?B?L0E4VlpOZkd0ZXluZ0RJNWZvQ0ZzVTh4WVh0V1hsVHk0Y3Mwa2ZlbWxwYXRJ?=
 =?utf-8?B?NUh4c1NVYnVMMCtmemJ0SjFyVG1BTkZEVTRjb0plblpUMndCK0hQbkp2Mm5w?=
 =?utf-8?B?M00xM0lBTlMrbkc4dVR4elROTWlsMVNUN1FoeFJmdUxmZjlHTUFUN040a2ts?=
 =?utf-8?B?UytNNlVzTzJibEtETUpyRmxzSlpMR1ZIdTg4UTc4SkF6b2ZoaHVyN0d2SkVO?=
 =?utf-8?B?bW9WUWNBU1YrWXFRbkZsKy9IeTloT0dDYk1GS2MzbEU1RUs1bjhiRnJQZitZ?=
 =?utf-8?B?QnIxSWh1MTF2cFIyd1dkSEZXVlEyLzNvUDh1aFJKNUloTW40UXhOajhvbzlh?=
 =?utf-8?B?WW82QnlrS0JvQzllMnk0dTQzMEdyQTgrMms2QUdKTXpjclVBWFhyS043YzVG?=
 =?utf-8?B?TzU3aWExalZ4TGtwalh1azhONUlJK05oVTFEbGhMc1llMkFieTVqWXkwdkJG?=
 =?utf-8?B?djZ1SlYzTkNsNmczRERKczd4MnR6MkZHUW9SN1FmWkxLRmk1bzBoVlZLdGRZ?=
 =?utf-8?B?TEJyY2ZpMWNaRVk3ZDNOTytWa0tRaHd4TXNuYVUvTkoyMlJrMWFoaC9ZNnFX?=
 =?utf-8?B?UGJHb1dvdFhVWUxZRTRCcCtoZXV5NG0wdnYrVUJSY2FET2tPdGZxZEh3TDIv?=
 =?utf-8?B?d2M0VWY0cjFJZE1FRzU2WGF1UUpUc2FXaEIyRGxZNFYxNG5IZjRmek43YXY2?=
 =?utf-8?B?RDFaendrQ2dHaXMzS0FHb2s5ZDhBbG1IWjNwNlRpbzZoUjJtay9ITmtVWjJh?=
 =?utf-8?B?RkFRdzQ5SmVveU9GOEdwQmJ1UEpJTnlOcGF3NkhKREN6SEJrSGdnbWd0NDlI?=
 =?utf-8?B?S3BqQzRseHE0bjFUYUUxTEdEdVFKbXEwMGMvU2pmRXZNN2VRUjczQ3FCc1NN?=
 =?utf-8?B?Z3NjSEtDNmtXMWZZYmJnU0tDc0VkeFBTQ3RwSVh3eWdaaE00MDJoL05nNjE5?=
 =?utf-8?B?b3QrZ3UvM0JVcGtER1BDK2h5NWNLTWwraWd4cFZwNXU4WXhyYWoxYzhMOEFM?=
 =?utf-8?B?aFEwclloQ0VqNUkrUHE4U240WTY5OExyZnhKTk5YUDdmaXBmV1IvZUZnZHJn?=
 =?utf-8?B?SEZ6a3Y1dHFXSFI1UlVqRW9va2dlVDhjRG83czVXQlArRlpZYmtXMUN5bCt3?=
 =?utf-8?B?bm1XeG9CZ2tJZENoUWl6Z2c0UDg3RFFzY3RIcjZKL2pMamhPdUJ1WmZ3ZmVI?=
 =?utf-8?B?SHBFaWIrcnhvZGg5Q25GUVJSVWg3QVRxdFVEcG85RmoydmFQODl2UkVGVUN4?=
 =?utf-8?B?YVg4ck5EOS8yZ3hIRWZmTU5na2NDRzNHT256MXhRNEkwKzFFNUtJV3VRUzJ0?=
 =?utf-8?B?Vjl4THM1UVRuOEVGU3A0bFkxQzdwVDhXbEF1RHB3V3l3WHhVd3dBN0dwb1V6?=
 =?utf-8?B?QmZnS01jSWpiQnJIRkxuaVlLckJ5S3FHZC82TiswYXAvUjBFUkFWVHpUdWZt?=
 =?utf-8?B?ZE5BRUFvc2NvenlPdEtDY3lZRW04VmNHU3R4eVppVkU2U3FpakhRTi94akRo?=
 =?utf-8?B?dUh4NHgrRW5Qc2VCbExpMFA0bFdkVGRMbnY3VTVoUGZyZ3kxc0FJWFpPUHVi?=
 =?utf-8?B?ZEpVbzRvSWVVUjFoSUNuS28rcHoyOHA0aHYza20rRGpOdFZhenozK2hjazlC?=
 =?utf-8?B?cll6ZmxsM0hYR3BQOXlSZlRqVFptMWJtV2VSWk1FZnhSMXpEU1VTTUp6Yno3?=
 =?utf-8?B?bzB2NG9LWTlqWDJmdGF3Nms5MU5ZaTA5SWtYMG9ZOFFqaTVyWXVlM0Rsd1RL?=
 =?utf-8?B?dDYwWFNHTEl3eHpyK2UzS1J5Q012UHl1bVJjVFFTV3Zjckk2M2dmZ3I0aUNZ?=
 =?utf-8?B?ZElEZDZQbDBUNUdaNFUxVU0xaCtzRnIvODNFMFFqSU9LTzRnTzNmT3p2VTJR?=
 =?utf-8?B?VlpjdzByNHFNMk03Z1J3RllWUGRndGN6bkJrQTJtbDRwN0hGeUVFeGphQkJE?=
 =?utf-8?B?a2FBMENSL01oZURqV2JaeXh0T25NeHA3c0FYOG1qTXRZR2pYM3J0ZW5rR0l4?=
 =?utf-8?Q?yZONNtxRgBOSOyIQltmDDN5NW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2aad4a9-77f8-42c4-650d-08daf246fd8b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 13:39:58.3309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ko1/NrRBmWHa3rQMRF+oY26kiEWQWNFhraKKk9YOkZnubMeS/nEGTkBpjxHs/sqO8BSa0lkBY7KJk5iTyy0dNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550

The fixes for XSA-410 have arranged for P2M pages being freed by P2M
code to be properly freed directly, rather than being put back on the
paging pool list. Therefore whatever p2m_teardown() may return will no
longer need taking care of here. Drop the code, leaving the assertions
in place and adding "total" back to the PAGING_PRINTK() message.

With merely the (optional) log message and the assertions left, there's
really no point anymore to hold the paging lock there, so drop that too.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The remaining parts of hap_final_teardown() could be moved as well, at
the price of a CONFIG_HVM conditional. I wasn't sure whether that was
deemed reasonable.
---
v2: New.

--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -866,22 +866,13 @@ void paging_final_teardown(struct domain
     /* It is now safe to pull down the p2m map. */
     p2m_teardown(p2m_get_hostp2m(d), true, NULL);
 
-    /* Free any paging memory that the p2m teardown released. */
-    paging_lock(d);
-
-    if ( hap )
-        hap_set_allocation(d, 0, NULL);
-    else
-        shadow_set_allocation(d, 0, NULL);
-
-    PAGING_PRINTK("%pd done: free = %u, p2m = %u\n",
-                  d, d->arch.paging.free_pages, d->arch.paging.p2m_pages);
+    PAGING_PRINTK("%pd done: total = %u, free = %u, p2m = %u\n",
+                  d, d->arch.paging.total_pages,
+                  d->arch.paging.free_pages, d->arch.paging.p2m_pages);
     ASSERT(!d->arch.paging.p2m_pages);
     ASSERT(!d->arch.paging.free_pages);
     ASSERT(!d->arch.paging.total_pages);
 
-    paging_unlock(d);
-
     p2m_final_teardown(d);
 }
 


