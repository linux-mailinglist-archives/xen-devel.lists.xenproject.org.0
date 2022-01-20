Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E063494FC9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 15:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259078.446848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAY3z-00089r-H4; Thu, 20 Jan 2022 14:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259078.446848; Thu, 20 Jan 2022 14:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAY3z-00086y-DJ; Thu, 20 Jan 2022 14:05:19 +0000
Received: by outflank-mailman (input) for mailman id 259078;
 Thu, 20 Jan 2022 14:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAY3x-00086o-Be
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 14:05:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe5a1628-79f9-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 15:05:16 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-h-UCJEbNMF-Q3noT29XyHw-1; Thu, 20 Jan 2022 15:05:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 20 Jan
 2022 14:05:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 14:05:14 +0000
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
X-Inumbo-ID: fe5a1628-79f9-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642687516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ki88Bt745Kcm6s6wmFvsK/mpmFMQIsi3fvdnsTbkCRg=;
	b=D67rw/gdZiBrrX3ho+xcRyr4J+XfrgrxKZR9CzvbXVDflhe+N3+Dx9hXzlfEm5Y3itsMZy
	dpLi5Jpt/MbeXMOqNr08FRDYkvNowc9hNjV1kVASSGQ/Lfl32TcrIraBAUbizWqTE5aWuc
	BDvmitxJgrngUdNgLvXpwfKHtXRqI3M=
X-MC-Unique: h-UCJEbNMF-Q3noT29XyHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HILrtr//VkJcVq2upy2lyOAv+/g4fS+ydQ8UvgpnXIUwDbaTb5290o0iBQ2l69v1NCl/4ejW9+3ZKOjMdo5EDm6IvPOuWJw10XjGd16yNPS60HFyhONlWDsUGkT/yEOJApqdVoXO+NEIUavqyl6Kz3uV7HNG9BEcFmJB9t+cXKp+485Tua61yTTo8tFa/saw1cQLm69HXlwKb36BSLd9Cvm6ZbERpTfmoI1sxeD6PlCsIBokzaFiXoCExS6MsMaOoIcW9q/GAJkBMp/nFJzmnbum7kbKVzs2VcQtyOs0Mo8QNPHJgP2/43TKBUYnulOYMO51ju+byfhaZtOUZ9OgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ki88Bt745Kcm6s6wmFvsK/mpmFMQIsi3fvdnsTbkCRg=;
 b=EOCJhFgg2rW6AkWMHGepmDM2SDmuUSGpShByA78TBO2ByoDPWISzDz4MW2BBIgLal1+PWY4h7gsWHTbxF+9CcTd4mC5LzK1L0L6nHRAo8Wk2J5wTyfOYMAxnyD1fmfGHpuYT2Jvf8ApkEePqXnkxlP0cBI/D2phea7EKYEEcRe78ibZIV458YAHOqRpyS1IWA26M9/IPDt16z3Ff1ZxINKXf295bwUlc/6QgkvDDxrEdSDr5N1dBQRY3v7Df64etjumMozwop06TNZB7V8rUKToSKn5NpABIOmIFaZuN65CUjHzp85UAxG4MmloVodYy0MyKLel/IVytz7QC0vdRVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9270896-efea-3e81-99fb-685fc5b708be@suse.com>
Date: Thu, 20 Jan 2022 15:05:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH RFC v2 5/5] x86/mwait-idle: squash stats update when not
 actually entering C-state
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
In-Reply-To: <568cb6dc-127a-9c8f-0073-2df173d4677b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e45165f2-d0bf-478b-d03d-08d9dc1de113
X-MS-TrafficTypeDiagnostic: DBBPR04MB7643:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB76433093A7C436194CDD76DBB35A9@DBBPR04MB7643.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ADc6HcxE6dFwD9vo7mpglQoi5RkNPccye5ZbVnLGfrAttZtDpQMQ0yvbt6sXpQVoxjIQTEQaqHaCIW0JLXi7ozbZtzohnh/chlEa3nMK7ByAeXHMYVbju0C7al/1U3PIcAcXkWXkKElwCRHam/97Hn3dxymupZUnjzlAVpc0TQsSGtUgGPUD461ISiCPh+nooDVYPbelfnIuEJeLWy94GzwCBOp8Ytz9jwH9jrzvmfZHoXvmJcUkuDHiywMuypf5wdGfFVtCRImFTu7ccJTEUfzDcqyd6nJ7eE8S0Nbaaxj8A3KeNs0lvaXXHroX+UXYHJ7RIF2x75uy7ZFp3ZkyHg1BKATz5Cfwlwe6YotsHZjdUB/3ju+MdzBls9P7MURI70oelWw0hJN8pbWlUq0PzoyiUyl6z4vEpC6zpiXM3rEwSmT7SEDpUL7Ptw/lECMyj9CoauWV1xL9l3IYeoh/SS0uvCJYMUr7FsMfTmEtsm57CGSPdtB0NeSgIPjcjzACmjZEaC4tuD3SbCa91ny4uNx5omjsYbIxc9ehUfAv1abV6D4nnTtxnG83786eWoCL3FG696Wqk5vndEtMNrTJayyC8mQSVwCvk+ff7tth1HGGfHbxCUJeFD9VaTpN2OkKkWq/jpRJeggLN1hBuYQ6j1PlHuY6RqNT7r5U3b6kJ6DQSFtdVb6WUjq7DG3sMObU2H1eUoDnUL00/sowm4cFDa0OVYAVTRsXGO1NGu8jEQAL1wsDX1uNds+eD3cosEpo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(31686004)(36756003)(66476007)(508600001)(8676002)(31696002)(8936002)(38100700002)(6486002)(86362001)(186003)(2616005)(83380400001)(6916009)(66556008)(66946007)(4744005)(316002)(2906002)(15650500001)(5660300002)(26005)(6512007)(54906003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0IrMkYyOGR1VGJyOHh6WkxYUVYzTWxiaDd5dVhCV2VPdStHRWlNMWpYSFQ3?=
 =?utf-8?B?T0xHSFFaMUUvYnIyaWhWUXA3WkgwYXZnbWxhVVVuRlRrWUNPdWNnejQ0ellJ?=
 =?utf-8?B?Qi9nNEM2SjNqNEFFUmhybUhxK2RGUnFBdnRRUTU3aklLKzBXK2l1WkRoV3RE?=
 =?utf-8?B?Y2Q0Zi9oMHl1aGJiR09ZUXV3VDlWL2U4RWs5NzVrcTZEaFg3czZvOTZVeFFX?=
 =?utf-8?B?QWUyZklyVFZzcGF5ejhSZE56WGlyVU9YVkM2ZHh5R1pYRC96d3FMUXpremZH?=
 =?utf-8?B?Y2wzbkd4K0xXYXBkZlBaTmdGenlIejJZV29CMlV2MW5jakNUZTFaaTAxZlBk?=
 =?utf-8?B?N3IzTTM4RG1nRTJkeGFLMWc0MndpWU9YdTBDU3V0TnRidzI4L2FIendHckIv?=
 =?utf-8?B?M250ZEpRaDhTQXlGbWpEbHdnTERkcUE5d09WVzdrTmtCb0lDWWt0Zkxhdlor?=
 =?utf-8?B?LzUxL3Vra3B3VDBLK0dhaCs4T0p3UDJBdWF5MndFY1A2aXBXQUtlNDhmRDAx?=
 =?utf-8?B?T3B6OHEwaVVoRDJZYVRYbktHMy8yWlBTTDdXZGQ5UGMwaU83enZ4b3VYZkJa?=
 =?utf-8?B?YkxORFZhZG1FUFlsdnlTZ1JRbDFjdnFFVmNWTkkyU3VNQUtucTd0alRQajVl?=
 =?utf-8?B?SHArTUtIWmpJSnZva2VQdjVySFlNaGtwWjIzU3ViSE9CZkkvVVNUWFZjVUY0?=
 =?utf-8?B?azB3UnBCZVIwUE9haDY3dlNSeWpvbUYrTHl4Z2VDOTgvTFlhYkQ2a2FBVjV5?=
 =?utf-8?B?Z28rZHAydFB4dzhKRVlGQ1gwc2pSZDIyWXQzSkltZThvNGQwVjZ0bnRYalZm?=
 =?utf-8?B?STI2Skp6YS9DdjlLbUNrWnYzOTN3QlUwZUQvV01GaXhBeWtCd2VSVTFOcURN?=
 =?utf-8?B?N2JqRGU3dnhHbmhwRnhMSEJkMlpGRXg3cjkrNUpXWUJMcVhWWm4vOXp0OWlk?=
 =?utf-8?B?ZGZRdGlYUENVQ3hhNUw4dDNCbjFBYXFqMmpGOXB0OVNud0oxNnphcEZKQVNL?=
 =?utf-8?B?N3B0UllzQ0ZsbDlRZGxkQ0ZpV0NNRE1YTnNreEFNYkdhaGJ3MHlzSkRjSjdy?=
 =?utf-8?B?aDcrY0s3N0N5L1c3MzF4UVI4NnlaaGo0SURvOHdzUUU4M3V6cmllUFFJVGZX?=
 =?utf-8?B?Y3NjODBtSjVrUW45MVpiWkQyNE83SDc1Z3c0eHdIYlFvbHFDM1ZpcjBockIx?=
 =?utf-8?B?WUtSTDB4OG01LzRWUFRtMDNvVkN6cUtOUlJpT2M5VnhvZUI3clVzUGhYSzQ4?=
 =?utf-8?B?S3ZYY2xBL3R6YjhSdzFqc2tyU2N3SjdmdHJscDFDY0RqOTM0U3YrQ3RFZ2wv?=
 =?utf-8?B?czhPZ2tFRE5WM2JtMkY5ZHJzVmFjdUk5enMreVFST1ZrVXhPN2cyRFg2WHZu?=
 =?utf-8?B?MGswN2ZEcXc3Tmx1MFl3dTZDT0RXODVTQ1RGS25zaUhVZEt6L0dYN3NURTJH?=
 =?utf-8?B?UlkwZENHdlo5Nys2TUxIMTh1VGNINDZWTEEwUzduc0h2SytnWXEwM0xxVUxn?=
 =?utf-8?B?ek1GckpHK2xpN1BoYWlrNjdRVGttTG1lR3NiZ1hFUENNSVFHM0VxVzVYOXVI?=
 =?utf-8?B?a2pzZWZRTTgzWTJkQ2FiNFByVXBNSVpDUE9HY2s4MmxIZ0RmdDB2bGduMHNs?=
 =?utf-8?B?WXhTV0w1S0I2WWpBWHFBNkFjMFBwbmRzTkNBTTZmWkhyRFlRb3AxNmtBc2lF?=
 =?utf-8?B?SmlBV1EyMVVRV1ZCTklDc3lsQVFHemVoQTFtM3dsWS91T3R2cXg3MnFZaEFB?=
 =?utf-8?B?T3BtSmw1czdwc05qNXd1REpEMUsrbFJUancwa3BWdWlQS0Z0UXhZMGsxblRM?=
 =?utf-8?B?V211ZGV5djN6M1d6NSs3a2VYK1NHVVVBUUFvaW1oOW5rT0ZWVlRKQUE4aXVq?=
 =?utf-8?B?ekJIanJySEJYdGdkNTJHOEkvd1ZOK3dQWEVBcGJBNzJWRnV1RTd6RXVaQ0Yw?=
 =?utf-8?B?d1BBN1N6OURNMVgxai84eTRDanordWtJQnhsa0pEdnZZVWoxdW1CMjFNdjZt?=
 =?utf-8?B?MENHYkJST3NsaUw4Z1FBUHBCUXZGejFrNnI0dEpjRy9ia2ZDZ08xdkZQRUl2?=
 =?utf-8?B?OGJ0K2tGVTJUK21kNDJYMldnNHVSYlZ3VURMYWxnNlNJS2tSSlNCSnBtUlI3?=
 =?utf-8?B?MWFmYnJwb3BGejNwQ0tpTzRwTFlNNEdaY28rS2lrNG5aNFFuSnBWck9yWS9K?=
 =?utf-8?Q?C9ft9QYN9rZ8R/PE6MAi41Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45165f2-d0bf-478b-d03d-08d9dc1de113
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 14:05:13.9319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rf3PEFF4rBQXN5aMVIWqBIesyxgdQlUo7RQCYq4qiz4ZyCgqS+ejZb9NUMixc+XsusJ4YT+FKQ1k0i/Z1CutIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643

While we don't want to skip calling update_idle_stats(), arrange for it
to not increment the overall time spent in the state we didn't really
enter.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Arguably more of what follows could be moved into the if() -
     thoughts?
---
v2: New.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -861,9 +861,11 @@ static void mwait_idle(void)
 		mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
 
 		local_irq_disable();
-	}
 
-	after = alternative_call(cpuidle_get_tick);
+		after = alternative_call(cpuidle_get_tick);
+	}
+	else
+		before = after = alternative_call(cpuidle_get_tick);
 
 	cstate_restore_tsc();
 	trace_exit_reason(irq_traced);


