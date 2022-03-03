Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AD94CBAF2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282891.481732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiKN-0000la-CS; Thu, 03 Mar 2022 10:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282891.481732; Thu, 03 Mar 2022 10:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiKN-0000jR-8g; Thu, 03 Mar 2022 10:04:55 +0000
Received: by outflank-mailman (input) for mailman id 282891;
 Thu, 03 Mar 2022 10:04:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPiKM-0000jF-0D
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:04:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e7c470d-9ad9-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:04:52 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-gLdoUpSfN7SGC5FW8-VIYQ-1; Thu, 03 Mar 2022 11:04:51 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3311.eurprd04.prod.outlook.com (2603:10a6:802:f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Thu, 3 Mar
 2022 10:04:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:04:49 +0000
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
X-Inumbo-ID: 5e7c470d-9ad9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646301892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ScIjlcvytU8BXsKkAKsbjjW3FXOU4vzzSPWi7azT27I=;
	b=H/BzgMs0s60fsQdfPoItMZOqU+BCDol3tfI3qedUlT+pYHKpF/xXJSvNpuzApMBxb0CD4p
	UYtgVNAJTrS/tGurndyhmfQDV13td4AeyLCPIm8+WoVi721i91BSsMYgbbuBG080ErG1j7
	oStce6gINVaTRnoh3f+D4jLgkfmX41I=
X-MC-Unique: gLdoUpSfN7SGC5FW8-VIYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jn0Q6+kkh5PWhepSgu+HS3lFWwfdWbwtG5QlDuvUoXbGqgEBESTMYF/+tkbNXiGP+Oq2ofqIkdC7ko2QuTY/N9sEThX9bghQxV8/ixf8waT9exduw78Neg7e6zOl3iB0Li9ZGygzQvFWKlQj5T1h4zcUxxFuCQBOsPLkwBmOrmtWTvrWI/I/TOativZCkzdnMUMFebNgVcy1i4nubcB8h2KXOtNICUeaOnpibPPqKbTmlia12Y8SJWEt//gimgCOpAcyl2JJZzfoOcB6QDZvXzco/Nwn15TK7kqSfFJSVoXLdwACl16MN9x4LuC9vCR7kB3rSlI3MTTYUAf14FRQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScIjlcvytU8BXsKkAKsbjjW3FXOU4vzzSPWi7azT27I=;
 b=aw+eaf66yAn9qWwR0ayJqyxim9wo36I3WODkuDYa5nnhQ4huSQx3mMIDOqJhu2pRrsVEJ3X5sTqfrzTIyi1/PCGXA6vs+5GX5MSwkYsBnQAI+JcwBHR7JYK6HjZpgWpnTXYe2NYeD1f00PCoZQCXqLnBkQgOtBruIhbRPbcHn+I8kPvLBFC2YJLJ/4VgZX+rAs0drY6XOO6If+evX4YkQWNre6G70GS1lXZWRrylriMW3iWNJcayghrS717JrwY6/EJJtPulL+PogfecCV/CFron6SW7HcICcpXiHjoAQ/zJq/iKjV62edPD4C4jSAniKAvTgqY86DILyc9aPzn14g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f946cbd7-1d9c-a4b9-d938-bc1d13c9425b@suse.com>
Date: Thu, 3 Mar 2022 11:04:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v3 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
In-Reply-To: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0037.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 428027f1-c2b1-447d-2ff1-08d9fcfd40aa
X-MS-TrafficTypeDiagnostic: VI1PR04MB3311:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB33114B38BF3E6070CDA62E9FB3049@VI1PR04MB3311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6hltHTVQI53Lvf0UqAoUtAhlVO29/IoRbSpgeqlo2IuZbumzdmPfKp0CUsj7VTVgQN5eVbPkVi9EBXH5DJ+oMQ9I3oVZFa7+RRxOZTGb9k0NujC2nwk72VacDEBMdXk0d65RNjEPvcC5bSoY0f3DMfz+ob2aVloXblmTZs/5teL8/l2/RMRlyDaIY5ORwr0oVB5sspvCi5tlms47GZ9bxsUR4RDKZzVr6vESXAFYVv5gywWiCl3mfB487z0LdQNsKh8tC8/0dlklSavZ4N7/wlN+tYIvJw5kr9VOilLocIIdpFTQEV9+j6sZyQ3f5UabVt5b3d+S0yHT/iu8oQgaznRSDDk9wLRXxSD6YtSWoxlhTFBSm+UdkdVrAT6fMhRNOeTgaWQFo0ZiBEae382XKQiuXmPntxVwwKSQ/5CdAnx3vtsC5dztFqcXz9wgt/H0Zb6mnpSkJG/AbO2mKeYraVLKC6/o4KSP9dbgxGp0hvI8RR/bpElmU376ZJsN3KLA2de1XdIYnbUmlxkOXjXh5knd8eqwHOPjUSeLfxg91OvXkbvu6bIcyh6Pqt1JAuLil4qzm75gvjUBESYaSbwTqOUYi4rVMJuV55yqTkJO1RFOc/HSe3qtYEBeS+ytQwc6TZxD2o8KWsqZ+FE9VetanG9C6RESjon6VD1RQviy4DkYYBbOmyxsD0CSXKr+cyQ4jsOKWe3buG07spWP/uSMK7p6kNAHTxCT1IyeHqPi/dPKeD+RRtwHCKGQzHtq0N6S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(38100700002)(5660300002)(6916009)(54906003)(66556008)(8676002)(4326008)(66476007)(66946007)(8936002)(316002)(6486002)(2616005)(186003)(26005)(508600001)(2906002)(6512007)(6506007)(31686004)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2hIMnY4TmdSR0sxVzdOUm9uMFlXWkJCL0R1OHJSdmxGQmFRTDQ3TkxleEQ0?=
 =?utf-8?B?WEVyT0YyVjVXWWxuWDZFR1lGZ1UxWU0yN3ZFRzJCU2Q3VldnRTRET0QzMzZN?=
 =?utf-8?B?eHluNDBuV1NxVnZlNEcwdHY5ZGtWQzd4YVJzUVpXZTBrUzkrR1Z3S0JLaVBq?=
 =?utf-8?B?NFdXL085eW1xSTNTN2lBWXkzV1Jkdm9aeEZpNDgzNWZTcTVMa3ptclZDUmVn?=
 =?utf-8?B?NmlBU1hYc2NmOUo2MURPNUNlT2NxdTdXcUtzV290V2xQU0QwMXN6RTlibXpo?=
 =?utf-8?B?NW5aTVQ3RXA1a1F1UDhmKzRqOGdCTDlpVTB0WmFRUTVkbGN1YlMyVVZxK3k0?=
 =?utf-8?B?NS9sSUJ0S2ZpdThzWkFQeW1RME5tcC81bGpIZWljcTJ5S1FrR3dvSmpLRWEr?=
 =?utf-8?B?STBoY0lFWFZ6YytIckxVenVpMFNXdlFYdi9VcW5UQmt0TlVqbjR4dnVxTDJK?=
 =?utf-8?B?UmErTks1bXlxMCtFN0lBcXFtMFBSZlEwRktRQXQ4UWZFMDBkb0dxUXRtaTlL?=
 =?utf-8?B?NXlnWmxwRkNsSW04cHJaUUNkbE1XTzEwbFpJUWRsZGEyKzZaK1FuZjE1bko4?=
 =?utf-8?B?bW5ObEpnTjBobmpKWkhzeXdra1BHZFBUbkJSMlF6c2l3WkdKSmdxUXdDSjRq?=
 =?utf-8?B?eWNxSmY5bitwYU92OGFXZG4zWm1YcUlMZkhJRk9ISW9WcElncEZvOGRKQjc5?=
 =?utf-8?B?YlB0TjlwYy9VeVVSeG9WUjEvYnVHV1Q3TUdSKzBaU2ZFOW1Qc1hzb056aVhS?=
 =?utf-8?B?aG1xbk04TFYwSWt3ZUVvK3NCay9hL1F1TXExdnlTKzhsY0lkdmpzZmhxS2pS?=
 =?utf-8?B?SWc1WE9URzZoVTJSSUlHWVp6Rk5WMkdtR2JsOTRlU3pwWUJyMElWUWk3TVVy?=
 =?utf-8?B?dmZsQ3N3ZVN2enRJb3VaZTc2ZjN1WE5RSjhUM0QzVncxVEpXZWFhb3hlQzN6?=
 =?utf-8?B?NHVUQ0ozQ0xzOUlUZm85bHEzamFxZnFOUG5Fdlh1ZnQxWHhNVjlKRzVZdE8w?=
 =?utf-8?B?NHBBaHdTb1dhandIS0QvaDZDbTJ2VXNldVh6dkFZdHZwTUFveTIrazllUDVk?=
 =?utf-8?B?b3pJVlU5UEdsSlFXWWNxcnUrV0x5b0pmNjJiWk5uWk9HRnp1RFVhQ3hwdTFU?=
 =?utf-8?B?SEE4ZlhkbENUeUJGa0RDOGl4Tm1rRjZRTDFSU09Sc0xSWEt3MVdSVHVQaW1v?=
 =?utf-8?B?UDdyWWwvZTZEZU54RXZSYUV2NkJHdXlzci9UUlVMNlJ3RStoU2poS1VZMS81?=
 =?utf-8?B?TldidnU3K2RQSjVuRlFRUWVyYmxYN3M0eEhQUlI3K1RWWkl2OW1pYVY3Q0hW?=
 =?utf-8?B?MVZCUGlEZDF5SXR4aWRpUkw2RWdoMUt2TndlNUFPbURJd1V0SlJEd2xQYi80?=
 =?utf-8?B?WnZEeDVRUVY0TUo0R0FwOU5rSU9UeDFzeXNqSU0yVThKcitUMlQ4UU5VVGR4?=
 =?utf-8?B?UE9mcWhNVjVxcU5nN0dRZ0g3dnVoR0FDRnNmSHJoMFRzNzJMUUZMN3pRQkh1?=
 =?utf-8?B?b0FsVTNzNHFqWFNCZTlNUVdzL2V6Y3Y5NDVuREFYdjg4NEhNb092TjBJT3lm?=
 =?utf-8?B?bHBVWjNIZmVRL0MyR3ljUkVrb3RSZk5Hci9mN24wQitpc1E4VkxPWXVXWmUv?=
 =?utf-8?B?Z1BQTXJyNjIwSURGRTdwKzlaUExIZ2FHOHU1ckdMSndSVHNVN2VZelM1UHZ1?=
 =?utf-8?B?NHp0Z0xIbkVlQXlMNVNrK2RxWE8yZHZuaHNINVhwa2piblpNODNmTUdPdG4r?=
 =?utf-8?B?L2t0cHpnV1ZIZ1paYStKQzc2Wnd2L3lrSnN6Um1LaFlsVjVrdktZdmFxemNk?=
 =?utf-8?B?UXpxZVdGS0FFeHJMUkVQbkZxbXdGSUJEWktHTmhjS0l3ODlFVWZlUnA0bVIy?=
 =?utf-8?B?LzFtbGQ0R21PNHREd2NUUlk5ejF2Ylpza2w1d1hmbnhscDBvRTJ0VWZrNE4r?=
 =?utf-8?B?bFRRQlh6TlhTRFU4MDM3RUxaTjUrMnd5aHNGbzN3QVpSeEhxQTg3N05qRGlN?=
 =?utf-8?B?cFVFaC8wTFNLZlErTEk4bGlSWmx6VDJ4VkN0alNRSU9aUXBlV2ljUWxSVVJI?=
 =?utf-8?B?c09HWFR4d3dwTy9taDJEcEpSTEdxMURvbms2THV0NVp1NGd2cE1HUTdzd3My?=
 =?utf-8?B?czdtWk4xZVVocFFpcTEzN3pYU01uWXRMNlhLVjE0QkZVZ2p5amdOUzhweFd6?=
 =?utf-8?Q?CctRWwN/JsaQ4T1TQRs5T6U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428027f1-c2b1-447d-2ff1-08d9fcfd40aa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:04:49.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVgtC3j4Bm9DQSuNyLLd6HRNoBBJB4Q/oImdYbFNspCFb8Ee7uLxIrfs8ZwonqlLqpAWGg2SF5MMYPuDclIdkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3311

From: Lasse Collin <lasse.collin@tukaani.org>

It's good style. I was also told that GCC 7 is more strict and might
give a warning when such comments are missing.

Suggested-by: Andrei Borzenkov <arvidjaar@gmail.com>
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
[Linux commit: 5a244f48ecbbd03a11eb84819c5c599db81823ee]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Linux has meanwhile further moved to using the "fallthrough" pseudo-
keyword, but us doing so requires the tool stack to first make this
available for use in at least stubdom builds.
---
v2: Retain the other S-o-b, for lack of mailing list source of the
    original submission.

--- a/xen/common/xz/dec_stream.c
+++ b/xen/common/xz/dec_stream.c
@@ -583,6 +583,8 @@ static enum xz_ret __init dec_main(struc
 			if (ret != XZ_OK)
 				return ret;
 
+		/* Fall through */
+
 		case SEQ_BLOCK_START:
 			/* We need one byte of input to continue. */
 			if (b->in_pos == b->in_size)
@@ -606,6 +608,8 @@ static enum xz_ret __init dec_main(struc
 			s->temp.pos = 0;
 			s->sequence = SEQ_BLOCK_HEADER;
 
+		/* Fall through */
+
 		case SEQ_BLOCK_HEADER:
 			if (!fill_temp(s, b))
 				return XZ_OK;
@@ -616,6 +620,8 @@ static enum xz_ret __init dec_main(struc
 
 			s->sequence = SEQ_BLOCK_UNCOMPRESS;
 
+		/* Fall through */
+
 		case SEQ_BLOCK_UNCOMPRESS:
 			ret = dec_block(s, b);
 			if (ret != XZ_STREAM_END)
@@ -623,6 +629,8 @@ static enum xz_ret __init dec_main(struc
 
 			s->sequence = SEQ_BLOCK_PADDING;
 
+		/* Fall through */
+
 		case SEQ_BLOCK_PADDING:
 			/*
 			 * Size of Compressed Data + Block Padding
@@ -643,6 +651,8 @@ static enum xz_ret __init dec_main(struc
 
 			s->sequence = SEQ_BLOCK_CHECK;
 
+		/* Fall through */
+
 		case SEQ_BLOCK_CHECK:
 			if (s->check_type == XZ_CHECK_CRC32) {
 				ret = crc32_validate(s, b);
@@ -665,6 +675,8 @@ static enum xz_ret __init dec_main(struc
 
 			s->sequence = SEQ_INDEX_PADDING;
 
+		/* Fall through */
+
 		case SEQ_INDEX_PADDING:
 			while ((s->index.size + (b->in_pos - s->in_start))
 					& 3) {
@@ -687,6 +699,8 @@ static enum xz_ret __init dec_main(struc
 
 			s->sequence = SEQ_INDEX_CRC32;
 
+		/* Fall through */
+
 		case SEQ_INDEX_CRC32:
 			ret = crc32_validate(s, b);
 			if (ret != XZ_STREAM_END)
@@ -695,6 +709,8 @@ static enum xz_ret __init dec_main(struc
 			s->temp.size = STREAM_HEADER_SIZE;
 			s->sequence = SEQ_STREAM_FOOTER;
 
+		/* Fall through */
+
 		case SEQ_STREAM_FOOTER:
 			if (!fill_temp(s, b))
 				return XZ_OK;


