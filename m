Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD45446367
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 13:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222277.384390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyQy-0002W1-V3; Fri, 05 Nov 2021 12:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222277.384390; Fri, 05 Nov 2021 12:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyQy-0002U4-Rc; Fri, 05 Nov 2021 12:35:04 +0000
Received: by outflank-mailman (input) for mailman id 222277;
 Fri, 05 Nov 2021 12:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miyQx-0001oS-PY
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 12:35:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb4327ec-3e34-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 13:35:01 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-XtlarPb2OJSLhouHKRnBTA-1; Fri, 05 Nov 2021 13:34:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 12:34:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 12:34:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0004.eurprd03.prod.outlook.com (2603:10a6:206:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19 via Frontend
 Transport; Fri, 5 Nov 2021 12:34:58 +0000
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
X-Inumbo-ID: cb4327ec-3e34-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636115701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eRkmeCDY9qmOnl/LgdTXyOV/AKSNeWTq/aTjmmt073o=;
	b=kg9DXIdJQQoYnk66qxpCWctoxYbcjGpCwuXUHu2RTgxBHJ1i8Epjpz5vW17w8At79Ott0x
	T4uc3TbBOdzC2XzKqDy8NawWbRPPbnGC4ySYyRd7SvY2q7mO8R+id9DLo/QW2gRoautObP
	VtHR/4RIiBsXLIWYwezRC+XtRq5rJB0=
X-MC-Unique: XtlarPb2OJSLhouHKRnBTA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLYriAh8JmamKWYSHB8x6DaO9zEd2sXtCa1j/cErARPRS9i1MIL1KOyWzIHWLgwhGLll4mwUPSBdHfer0vWL87mYifkd6ypdMmObMtyQIXAAtZKFhopGBG5iNI9+aDOD4m9rU6UqF6JcXzCgQZDfuUhNdpb0NqLTBLdK/3BX3zL5lKUbXv5T1du1k8A2J1bikJ6iWccekJpwYgrQ4bLvX3uxNDZDwa98DXn7Ej332JXeZDoi0YsxBbIFg7CYNwYjiDXHwxs7rPd1pE2ceT/4wrNonjXT5tNTzQZCplU7VrCO1narfUudz09WeAYHNcU59C2VtmnTACNP7EiZ9xjZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRkmeCDY9qmOnl/LgdTXyOV/AKSNeWTq/aTjmmt073o=;
 b=KfU1I9KEEihNtulQuXPDwfjE2CYQf3caDD7gtsAVMnXQZ729Pr5WuydNGaXnBYrRnnEekXfELpCY01uoC4Ac/MMqNe4UDHVZ6iAgIpBVdD1CAjAnHCjRY2JScFRT3eTGxXHZmJnwvrVFr1mttTSRCozCHLj2rw8vgGWj4piO4ic6HOXR/FL3tdHUbGPs0kpjAFPxBwiAlGmzKdr4IRD+3QCP4tpiZ7V5YQqEBk9KJdH54OPwZKkBvG1kWEnUj391cwynqPMyT7JAH/eZ41+i4ZQrJJ3kHob+tC6JO8XmNJk0E2n2CTLvNd1PKL+ESwBU8bybA/+BxHMB5XEr069A/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <38e0ef5b-0cef-9fd3-ea5d-8cf76005c689@suse.com>
Date: Fri, 5 Nov 2021 13:34:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH v2 4/6] x86/APIC: drop probe_default()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
In-Reply-To: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0004.eurprd03.prod.outlook.com
 (2603:10a6:206:14::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09bd1a6f-b8b6-4ee2-b3ea-08d9a058ae3e
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70377A269FCAB8A32ABFC3FCB38E9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TAeIZ0doTKpMEknzpKYkr6OaIIeXsI6sCNwY/iLeF5qnYgbkvRYCcF+K4ySlRQEQaytUv2Tw95okM3sPjqbRDDruuL32Wrcvc4yuT02ZwRS1S6QHtZ7jwGX4ON+e/aEvD4epWqYasQJrkY7yj59TbU4HzjGmlKWblkVGXFtLrX91O6i2LZ/la9ymjKwc7JxGZEnnm1oAMIhchCmL2rHeIvJ77e6tiMBAYcOVPxJQRXGQEp1A01KrKah5e3UCCE09mtjjWFCzHIVqH5yaWvWAjItm2yK2Zyu7+1iHzStyG0WrjFIP35v42mYNmdgstuJEqLkyfcSnZVdwhJjcURDrcltiCy0+cdi6t2duxl2iSarminO3RdQreXS5s42UedPPsb1UjczAQeyAxsya15IuBF/Vh2bF4/leYzte7sPZtC4rAykUflqEj03CLb7ZluUqvA2B8gVSgvoJl/DElw2suur6CT03XZH+28zh7xAUqFckYvtS2LCPeqUwD5txf7QqP3TFrwKuFsZPIJkROGN2ft2Bma8nzC+DlHa3M4Y9w582dH5k3CYhfFZaFdk2V3kca1pqERepr/CcXUA4kjDq+Umw7C4IyGWYeau01Jwl/XD06pcsALSYcfdCGsHy8ktTf5gGF6GRlV98y6J5oG6sIF+IS9uU4JERFNbbKBUPhS2i3IeimTwRsAezQNnFnVLao33x1l/R8uya1Ud8ryVflgRF+ke/9Ga3kAqpoUu30eR0rTxgYQD7hS/fiillhd/yGvvtqlF8MbIbwBxDjfBp6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(26005)(8676002)(956004)(66476007)(186003)(38100700002)(6916009)(36756003)(86362001)(31696002)(31686004)(83380400001)(4326008)(316002)(2616005)(6486002)(5660300002)(508600001)(54906003)(16576012)(66556008)(66946007)(2906002)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVg4aGNxbTZkSDZCRDhudlg5M3NVWlNnOXNBaFlRNHdQcGNERUZtRTJLd2pr?=
 =?utf-8?B?Um5USnQ0c01BcGJrVWlTWHRXaVVJa2xsV2MvZzN0Y3UrMGdIQXZIN0wxL2ZQ?=
 =?utf-8?B?ayttdkRBZG5Xd3VLTFdHejM1bjQ4aldhRjdUOVVRaU5Ec1JtSFdtYWFJM00r?=
 =?utf-8?B?Vm1oYzFyMWR0enRjekVzZldYWkZEeFlNblVCMTdwTDFOTEE5STQrVjJDcE8x?=
 =?utf-8?B?b3pVYXAyMHlRQjRLQk1ibHZtTGdCSkRWTEpwQ293RS90ZlVlYkwwUGNnZk8x?=
 =?utf-8?B?QjFoQ0pPb2tBSDNENWV6Z1h1dmdLYklmczhEZExFK0ZMMzd6blVmdTdoaUtU?=
 =?utf-8?B?QXpxVTNPM21oR24vVWJYYlJuQ1hxd25sek5vR20vd254TjhlSW1zK0lySTlr?=
 =?utf-8?B?YWZRVFA5b2dWWDFlU1IyU0hBVmdZKzFEcEc2MldhamR3TUVsdnU0RXF1VjlK?=
 =?utf-8?B?d1Y3S1hKRjZqS1NTdHZzYTAzdFBhR0w1Vk1oVzVwNnZsVWRUY1NzN1BCMklp?=
 =?utf-8?B?aEFlUGRGM2NGcFdMd1hyUXlybzlOU0ZDMzEzWjE1UWkwWCtHUkhRbEtLcHFJ?=
 =?utf-8?B?N1hqSEFMRUY5cTdQZXd0SHBKWXprWjBNNXgvMmJ0UUJLTVYwZkFiWjAxWk1P?=
 =?utf-8?B?MGxPdS9KVVVKeGdYbXZEanpmd2JCK1YxUUxQRUxuNG5NSnNrVml0Y2tYKzlz?=
 =?utf-8?B?cmFKeU1XanBoQjk1aUUwM2RoZjJhdnY0eU9jUGVTYkR5aTlRelZKMU1FcVdt?=
 =?utf-8?B?TEZSVUxyaWZubUc5LzNhakU3RGpON1FjN2dIdkwwTHVaQ2JjWVE1M2RSRVZz?=
 =?utf-8?B?WEdMVDQ3RTcvNHdyQytXblFmUWEyWi9vU01kdy9TR2x4clY1RG9qbTRSbDN6?=
 =?utf-8?B?MFJ3YjJLd05IajRxOVB4MlBiNWM3WFlvNVZ2UkNOWis3UVdXY3BIMlF3ejVU?=
 =?utf-8?B?bjhtWVEyNndXWUpsTXREcVZhOGlsZVFjTXdOL3FSQ0FsWWRhMGRZeThCK0Va?=
 =?utf-8?B?RnV3Rzc3Y0VJREM1aEVwemVqa3BUUXFlU2lpeEhjdHJSRmlmVDd0UHAzTE9B?=
 =?utf-8?B?dmoyRTNVNmZranh0RXRPSmViYnJZbkJ2dUE5UE9sOXpDcEFKNzgxMTRBMVNu?=
 =?utf-8?B?MTlMaW1tMGNtYXUxTEcveUlDL2VtZ2NiVmIyL05ENEpwdGlwVWhxUmRhNUJi?=
 =?utf-8?B?Y0pBa0pMNFh1Q3BKaisyU0p0ZmR5RWZLL3k2UlQ1RFFRRlZBNVo2elZkdkZI?=
 =?utf-8?B?VHNmcDVwbmVFSW1BUE4xdmVVZ3VidVJCUTJka2tDeXZBRjR5ZVZMRzN2akNt?=
 =?utf-8?B?cVhBTGwvcks4MFUwamhWay9Gb2JXMVpCb3k5NlYyMHBWUHFuRVdnaVB5Y3RX?=
 =?utf-8?B?Tk1CZGZEaUMyNzRVckRSZ0JCSzY4bkdHUVAzb28vd0ZlQm8yVDdLeVJKR0dx?=
 =?utf-8?B?RU8yU05NS3NJOFNUN0xWenVLWUFHM25rbzM5SzFaQXRqRlVML1RlWUpIMTI2?=
 =?utf-8?B?ZGxuclRCUWE3Y0R1OWJwZ1BuRy9ZNGpDc1NmUzgweWpOa2dzb3NCMG8wcUxl?=
 =?utf-8?B?ZUlEWEJiVk50SmZNbFVHNWxySnZXV3k5azM0LzAycWFYRjBZMWQxeTZkdzBj?=
 =?utf-8?B?Ylo5RlVMeEFaSzNncENiUlJraktPMHpZWHEwcHA4ak1iK3g0a0c2cE1saitl?=
 =?utf-8?B?V2RhM2tWcEx5cmVSR1ViYXZMTkR6UDhJMk1Icm1EYzdsa3JQb3d1TDYwLzJi?=
 =?utf-8?B?c2E5Zm9iODFrOUxIZkszT2JBclBOcFRhYU8wS3FVUUZkN3FpVVhGZzkrQzhz?=
 =?utf-8?B?VFN4RTUwcFJnTk1MeEFNZDF5ZkhBUnk0ekdobitkT3QrK2pEK1hiU0Rlc3hU?=
 =?utf-8?B?STBvVlVFUlpXVnFIdU5aRjVpN3Z6b1dnUkllY3hqZkF4cVc3UnV1M1l4WXVZ?=
 =?utf-8?B?VDFQVDR6R2dQZytUVHZBY0ozMXFOUlNKWmV1dktnQWppOS9aS0puOWtDbFNT?=
 =?utf-8?B?T2FRdVVJZDJIeVIvcUo3dHUzVHgycGdHL0VZRmY3RVczVVloYURFdmI4ZUtU?=
 =?utf-8?B?NGtyK3hSN24yeTk3NWExRC8xYm5Fa1RmeGVrNFFZLy9RL29keFA2VnNYSnA3?=
 =?utf-8?B?SFAyOFhUQW1BM3dpM0g1Zml0ZHNEVkhFc1NjUkhFVENCNnFzVUx0bnRFR0k4?=
 =?utf-8?Q?3Zc817f5O+vQ2A+MduKPvYY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bd1a6f-b8b6-4ee2-b3ea-08d9a058ae3e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:34:59.1706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPdCG/r2kVeBvLubSL2s27IN2tE4329x3G56+0z6pg9PjMpii2l6NRhYQO89oFMUY9x2J9Kzj+bzoL2B+xaK9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

The function does nothing but return success. Simply treat absence of a
probe hook to mean just this. This then eliminates the (purely
theoretical at this point) risk of trying to call through
apic_x2apic_{cluster,phys}'s respective NULL pointers.

While doing this also eliminate generic_apic_probe()'s "changed"
variable: apic_probe[]'s default entry will now be used unconditionally
in yet more obvious a way, such that separately setting genapic from
apic_default is (hopefully) no longer justified. Yet that was the main
purpose of the variable.

To help prove that apic_default's probe() hook doesn't get used
elsewhere, further make apic_probe[] static at this occasion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/genapic/default.c
+++ b/xen/arch/x86/genapic/default.c
@@ -14,12 +14,7 @@
 #include <asm/io_apic.h>
 
 /* should be called last. */
-static __init int probe_default(void)
-{ 
-	return 1;
-} 
-
 const struct genapic __initconstrel apic_default = {
-	APIC_INIT("default", probe_default),
+	APIC_INIT("default", NULL),
 	GENAPIC_FLAT
 };
--- a/xen/arch/x86/genapic/probe.c
+++ b/xen/arch/x86/genapic/probe.c
@@ -18,7 +18,7 @@
 
 struct genapic __read_mostly genapic;
 
-const struct genapic *const __initconstrel apic_probe[] = {
+static const struct genapic *const __initconstrel apic_probe[] = {
 	&apic_bigsmp, 
 	&apic_default,	/* must be last */
 	NULL,
@@ -59,22 +59,20 @@ custom_param("apic", genapic_apic_force)
 
 void __init generic_apic_probe(void) 
 { 
-	bool changed;
 	int i;
 
 	record_boot_APIC_mode();
 
 	check_x2apic_preenabled();
-	cmdline_apic = changed = !!genapic.name;
 
-	for (i = 0; !changed && apic_probe[i]; i++) { 
-		if (apic_probe[i]->probe()) {
-			changed = 1;
+	cmdline_apic = genapic.name;
+
+	for (i = 0; !genapic.name && apic_probe[i]; i++) {
+		if (!apic_probe[i]->probe || apic_probe[i]->probe())
 			genapic = *apic_probe[i];
-		} 
 	}
-	if (!changed) 
-		genapic = apic_default;
+
+	BUG_ON(!genapic.name);
 
 	printk(KERN_INFO "Using APIC driver %s\n", genapic.name);
 } 


