Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC444698DE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:27:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239091.414428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muExP-0002Jz-J5; Mon, 06 Dec 2021 14:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239091.414428; Mon, 06 Dec 2021 14:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muExP-0002FM-AW; Mon, 06 Dec 2021 14:27:07 +0000
Received: by outflank-mailman (input) for mailman id 239091;
 Mon, 06 Dec 2021 14:27:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEr3-0004et-IH
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:20:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abf877bd-569f-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 15:20:32 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-EXMgWJVFN6al_o42eC66nA-1; Mon, 06 Dec 2021 15:20:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 14:20:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:20:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0044.eurprd04.prod.outlook.com (2603:10a6:20b:312::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Mon, 6 Dec 2021 14:20:30 +0000
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
X-Inumbo-ID: abf877bd-569f-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638800432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KNU533Nas71KGaxkrjt8Y4qhfH0SyWRPA/lY3YgjMd0=;
	b=HJ2vg5iAb+UVWo7C3erMEG2We4go+ub2MlUSm3MWI8ggDBS+hfapHSEo+JwJTxFmCupPm7
	g15U+I1aN11wviQSgm7pOshfevFcOwhJOTNwJE2y3e2MIzjL3fF9Bm76BE9HGI9cjClsVF
	y6DiTZO0NrHLf6MkbfNgw2tW/Nnn/6M=
X-MC-Unique: EXMgWJVFN6al_o42eC66nA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzAArQcSkhr1ruc0LADmNaN3rCMlbvb5x20QU2Ed8IU+5/n2kYJ9dPYBTxuGohQBwCBsoEbm5HeinNwfsE9UY4A27QCYKIHSj2LhUUMS5ieDq/Uwfk8cBmGcxOElyvxS+ZKbfSqNPWSP5LwbelaR0xNChN0c8XUakJ5I0C83ND/tqSNxnh0H3dqRdo0BfJT0fFGM3nUVd6zQT1I+F6LCvGewJ61FSPDjm8cF3C83QyXLMOWFp61Z7UGUmqTrlL+3xjiR2GFQ4s9/2ioCYYH0Qmhn8zoTP3qhMmaeQxZ4NX6FUwRcLNzAfqJoWRfi3QLPKo39TX9EG8cmB8RRFWO8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNU533Nas71KGaxkrjt8Y4qhfH0SyWRPA/lY3YgjMd0=;
 b=SQGkW7LfnzCTjVVMeQQDcJzRhEL01zWPITCzXdh3afniwy+SSEglYO4lLvxy0U1KijfZed2oAytXKX0eGsv9ZGIvxTdu3jloRPU699icW19NPsfb9Oo+CmxQAN2z/lMKcf0iGTkRoVKE4UCyG5CO9eIMnltaxGpXFedaZmCOyTwDrBOaXHgq5PsndK3SNnhVb8vVclPxAoi+772pdh4bsRSqSk6fbuniYDqIzYI0fOcXp5aCbF+lg0nerSqjFtlhL8c9UZeCl9AVUVZk2n7Kh95oJp65v/js2kDamw5t8u4UJpVpaPuLVBBIayhtDHZl360QEIxPH+5hNyNEBNulWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <905a1d43-9f35-21b4-fdec-97c592f59afc@suse.com>
Date: Mon, 6 Dec 2021 15:20:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v3 7/7] x86/boot: fold two MOVs into an ADD
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
In-Reply-To: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0044.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48b1df6d-2759-47a5-495c-08d9b8c38ed1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23338C4196BFED1E95E57BC1B36D9@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sEst+LtSrESXJbSMKLk+6JvrbflMca+Z4VxXFVmg3a+xUNNLMvNmowwx6YQmAGU10i9+LVZojhz5d77pmZiTYFxQeI+30nAP13NWC64c5r4fcBsbNsBdWe8ZDWokBG91ke1MfuZ/vIawqBHiuS63ToSz4R0HyK0lTEFqHM0BbYlveZxGvwDxRQR1n5bGLJHJqbUatpj+Cs73Dcz/tu4k1UVVBcFhIfiicE1OmAiFsy1mQoRxWwavY+DiiRE7rawuux0UymF+zSbcmY5AN1NsRzuZMPNHPoBZ+/sDqXHMvAuaQqxPd258N5aaZNC4c0zIBPu/h0QUMmOvZBt+nEvQiSZY5pJlDS540T7e1V7yrIVLfG+sKk+rlnOjaGIpJ3+GR0IcFb9UDGqbuFvTrpMDfJrGAEqLo8gqUCsGis04AvJ2Rs56OB+8AnB5NO9nPH7oORPjtsqGikcpu0bqcIwtkxdwkIov2Sz0BN7nLUU4vKbbBX9NMgnk/0B733+GdEZrOfm/uZXFenlAPr4AWtmsVrO0gPYcMr8OLa1ZtR0KCa87BXFlYaT3BadRlCnnu1daaZP9xXUQ5sGoPGtIl0ewC9ELv6hK4MootBEXZlq7PcPq+8xPkgBTxGQVtc+4EDELmMUue/oGnCALuRNAZLeBVDwSjF0HfOy9LTQIIlHboqnlSwcX1us+ro+upQIrqFAhdex9TePjhetaQk7eN36LccbzUwKTlsrQGatW+ncX7js=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(54906003)(316002)(16576012)(86362001)(31696002)(66476007)(66556008)(4744005)(66946007)(5660300002)(2906002)(508600001)(8936002)(4326008)(8676002)(186003)(6486002)(2616005)(956004)(38100700002)(6916009)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzI4cTIwdWpaS3lyTkovaXZjRHlpMlZnVzlGRTVCUjcxSjM0SjdFQlJmVnVT?=
 =?utf-8?B?UmpVRUFrL0w2aWVkT3VmZHZpVXJrQ252WUw1ay9TRENkNlFUcStBQmRBSkFO?=
 =?utf-8?B?UHdTVVoyWmJuZ0Y5NGJYbzI0OTAxZXl3ZWxQQTR5VXhCRDc1VDVocWlyMUFm?=
 =?utf-8?B?cng1NHgzdXVHOEdEc0QyZUlBaWlrVEttTzVMM0g1eW5XL0gxQWY0Qnh2azIz?=
 =?utf-8?B?NkdoZW9JUnUrOThCb1pnM2lJa285ZUNXenhHVnNZa0NWZXRyd0pZUkNSQjlk?=
 =?utf-8?B?UDVrN1lwamhwcTZtVDM3Z0c2c2g3cFJQVVozWkFtaVc2T3Z0ZEFzWHg2djVu?=
 =?utf-8?B?eGlQOWZXQ3NUOEFuci84R0F1VDR3Q04vTnlKQk0rNW5IdGFzYW14TzFmTTdi?=
 =?utf-8?B?aXF4a3VuemoxdjdIRmtMSkMzdkt1ZTdLbkswblVaOEdaWXBaS0RGWWtkRzRP?=
 =?utf-8?B?MVZRM1JlTlVZWkVxVTdyT0cvSkp6MXdtNHRoQVJqNzNxdlY5UDE4a291dFdn?=
 =?utf-8?B?czBEVEJWUEtGc0JsZGdqRFdLR0thaVZ2SUpZYW9ZNHFFcXBSaEZKZjJzWnky?=
 =?utf-8?B?K0twUUYyejdZT0ZZajFTaWwyOHROdkFFWkVDUytTVGpsSTZOS0FNaHkvazI3?=
 =?utf-8?B?MEEvL0lrMHBmVDlBT0lFQmFTSFZJdHMrNGo1MEl4R0FiQ083Rk9ObVJ3bHhF?=
 =?utf-8?B?TWIzL1Zyc0puM05LOEUrMmt4ZXV0T1NKQUIvSmRqMlhOeUpJNTU5aXhaYmZ0?=
 =?utf-8?B?Rzk3ZTJlNTJPOTRtMUFKVjNZazhyN01BQmhIbzE1QWFzcEtNRVNZRE1vQzdw?=
 =?utf-8?B?WnZrTHYrZTc5V3NkWE5wOThlRFpXVS9HTVpQcG8yV04xbXdnaXhLRVFDRit1?=
 =?utf-8?B?Ti9FQVE1UEtUS0VVWmFPWFBQa1hXVHVCWkV1Y3luNGVVUVBpUE9DeEZPdVhi?=
 =?utf-8?B?MkRjTE9GL25seHowQmczMXNMWDRBbkNNQ3FXUmdET2FFVWtHYmlsdzVXemhG?=
 =?utf-8?B?RzEyUGQySU9KZFdJY1E3TjdsZVRNcXdEU3VUMWFwZ0d4bVJraUExL2F6S0NV?=
 =?utf-8?B?SXRjUmh5WUpmZGkyMnlPQnpINmVRS2crZGhoYW4zbXZPWmNabHM1SXVDV3ZZ?=
 =?utf-8?B?SlVldmUzcUNCSnQwY1VpTUJOSUlhYWhCaGpTSDN1Wi9QZUp4RTJKR2RzRURL?=
 =?utf-8?B?dC9ZZW8xV1NLNUFtczh4cm5xMlFZam8xeG5FNDI1VDBOZGxCb1hlZG5BRTVa?=
 =?utf-8?B?bHVaeWhPbUMxNWkrQkN4cW9DdlEvQU1nY1BySFA1bTVvS2w1SnhIa1VWWXlO?=
 =?utf-8?B?NTJtRmV3UlJwS0hhM0Jld2N2OUpLVzZ1T0Fqam1TN1FDME5uSUx5ZlhPWVRp?=
 =?utf-8?B?a0ZQcHRWek0wUGxXdVlJdXk2cDl3cWRoVEd6Q2cwNTVPMXl1TmxkK0R3WFNI?=
 =?utf-8?B?WVd6ZThIY1JaTDY5enlwcmVCTS9MYkZLYUxEZU5DeXpWaDVQQWVPdGNyQ05T?=
 =?utf-8?B?dEgxL0ZPRFlVTDI4MWQ3SVo0L3JEM3Y1NkRMOXQwVFcrK1NFNHRBZlZkRHFr?=
 =?utf-8?B?d3BtcklEbXI1Tk9DZzJDZndjdHNkc1ZPc2pQWS8zbHlsUTU0ZDhDNzdSK216?=
 =?utf-8?B?Znh1WThjUmx5YXgwd0xubVVza1BuQXhOd2tuaDJUR3N2dmQzcDQzbDZITXJs?=
 =?utf-8?B?clVyRndiRTJackJnaEJYSDlMY21zZElrMVRhekk3ZFNBNnhzRFM4eGx3VWky?=
 =?utf-8?B?dndBcHIweENRaWpiRnQxK0cvN0V4YUJSK3hnM2hqM1Bka3JLOW85S282SUk3?=
 =?utf-8?B?Q0ZuVTRLb3U2T3VjTnpYc3hkb3FBSFhvNjgwaXRJMnJtakFXaGY1ckp2OVNT?=
 =?utf-8?B?SEkwRnFXUE85ZHdkYnJuRU9pM0ZDZlZwK25tZVJkaEU3YmdrQXFTVXp2Zm9n?=
 =?utf-8?B?RGR1K1FmaTk3eWpWRTJoczhWM2ozRzNwRFhCdU1TN0Q2ZjY3S0x1a292QzdC?=
 =?utf-8?B?UUhUVEZBTTN2R0VncXZXQVBpNVI4OTFuNWEveVpBb1Q3Ym9maXZ1TG1pVVRH?=
 =?utf-8?B?M29OdDFoWDFzeWdySmtWK1hUbWJjVVlBeFVhZ0FUdUN5UG5PcUNEQXk3d3I4?=
 =?utf-8?B?VjFEc01jU2FWZnhGN2Q3QUE3NGM2TjlpeTlZTVpKTFNFemh0WXJTZkR0dGlM?=
 =?utf-8?Q?hoYalOwCXjJFeByH1sIJMH4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b1df6d-2759-47a5-495c-08d9b8c38ed1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:20:30.5498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfxdOZpd6vHHsU2FBC8TmXhkOgno80co6s9UtLgbHjgOvr0K4bhd2xHv2tY/Y8BNvR4Rv39msPWlLYG+7ZEi7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

There's no point going through %ax; the addition can be done directly in
%di.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/boot/mem.S
+++ b/xen/arch/x86/boot/mem.S
@@ -24,9 +24,7 @@ get_memory_map:
         cmpw    $E820_BIOS_MAX, bootsym(bios_e820nr) # up to this many entries
         jae     .Ldone
 
-        movw    %di,%ax
-        addw    $20,%ax
-        movw    %ax,%di
+        addw    $20,%di
         testl   %ebx,%ebx                       # check to see if
         jnz     1b                              # %ebx is set to EOF
 


