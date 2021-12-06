Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E38146970F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238920.414085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE56-0003hZ-TP; Mon, 06 Dec 2021 13:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238920.414085; Mon, 06 Dec 2021 13:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE56-0003fR-Pd; Mon, 06 Dec 2021 13:31:00 +0000
Received: by outflank-mailman (input) for mailman id 238920;
 Mon, 06 Dec 2021 13:30:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muE54-0002vN-Go
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:30:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beb659bb-5698-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 14:30:57 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-E_ekhWD0NRKdcgcUKKBhbg-1; Mon, 06 Dec 2021 14:30:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 13:30:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:30:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:20b:46a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Mon, 6 Dec 2021 13:30:54 +0000
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
X-Inumbo-ID: beb659bb-5698-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2L7R3Ro54o4RSNjLVMfI6YXuaCvbMiNR4YzG+3Qu/4Y=;
	b=HifjjfJ2Sn35CA3gWZLDNRIXvjtQXScTK7Xj3jS6RbuBduDnhsAZ1P7JKchgJihCFr+O72
	31UJ0MiL6dC7YmxgfNPzufi8JOaKvSkvFG8t/OnndLC+RWVUOekRCeYL30CssaMjL5ViuQ
	ABawaSVg5jwAXOgYONxc/Bm2rj2RGxQ=
X-MC-Unique: E_ekhWD0NRKdcgcUKKBhbg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAxBncdaWK6FyM/gnxo9MZV4Kq+VfpwWF65JQ2s5yDNcCBk6Bq/nrSnKXw0ymjMBKLzoj19i1m2cjgV25mUjSGh4i09E3YRMOlbdafLq+NeDDg+cfg5p7Tgb2ULzk3vttDULkuHWk6m4HpqaR2eVSw4hFwNJW1sbUPDElIrPkxMpFFDQ9qi5QDWF720naSm1ZeQUdFLqu2GloTpzkJA7Gk/qz5BAApHpcbBjgO6dauuqTN3YpwpIqDVDh+7DmYLrvE+rpZlbdAd6C16ZP+ic3uBEneAqiKi+xInnYeqU6tHqkD3FStrjZ1SsX5ely43C315m+knKbOOGqwUiXQDd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2L7R3Ro54o4RSNjLVMfI6YXuaCvbMiNR4YzG+3Qu/4Y=;
 b=Wx2phLVvCFQqzRqOFUhuK+KXW3qOFEG9D4f0DCrIjtWbOkFgh4VDQ42Yc4iCFBKOwMBBwuWhZX8trX6c+AnO5Z/im8zTzHjgQ+/bMa1PlA9I7MfpH7TlFl8/10L6Fk8ehBJreLMzIIreWcB5XSDJlp1L2GFiaba0nHR6DoAWFeqx0zuWO7w9Gi0pVksHT6++hT8CYTLqL445I7dbCb1Vx4Xj7adDLml3nLRHDZEHH2esxlKJGzSrcgaqOPft7h3MUMr4gYeElXP7Vtj9fgRsea2bvxQuec61Mx4VEXEf1QEyy/MnF3N88Thht+v1U1BV9GSpGxuYXwWl8BA5nNzyNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9666b3cc-d4c7-1a51-3a23-419d16232465@suse.com>
Date: Mon, 6 Dec 2021 14:30:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 1/7] xz: add fall-through comments to a switch statement
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
In-Reply-To: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79d074b7-9d3e-41f8-712a-08d9b8bca110
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB28294D8E2E234A3E3614AF93B36D9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PtnM4Zt9DpTwyc1kxM0AMkgjADKPHuLwqrTEO3VZdaoKvGniGtP3g97QXfyggIip5Vq+ba2a6Qvb49o1nKliEFtpxGhX5VyewbxCwiVjZrvpxCQ8JHUbNiQvpVruz2Z6QHnxF//i0SJXqxq1E9g+FvJZDV7m3GKq4Jk+Z2UMH90INkcSCZFeSOOxjeLIXDHtWc2sxknU5YzhlBO+kP4BouGaql8eopG/s8x7sw74MLImTefXqZYTtVHSS8tCWMSyIoRUnbUIEo28h0OVerlkkALr8Rw0seJ7HFJw/HJTB1IMzKktuHi8nwxxUwBMA2N24RK63so39ofdCfzaV344iQuJcyhj/MP3oga5gq5FjmhIpOO2VLAoNbFzHbJxCo5BJUcjlQo4BBGtGFbYZpnYY2y+iWN8HWHNxfNsNnx1+1l8sXwT57W7gu501kLBmLoa8C/KEBfNp0NEQNw1jzEmXMD4kxTcPvWKcc6Bzzf/rIhN9MQPYZqMi+J49eOlgH+VTvx2qcFXjKBNigXMDTfjdRi9ALhgJsSvVGbfd3SuRIuOGq7yX7xkHOfzHKaW5ay8hi7OfRZfeXEWTOfLL9VK9LrUGbyH26A7ffXLtwv3sE41w66VqMFEL45AWrPdgQLZaAYb8CHPTBMnBkhxKhjbWjRx30pw85CSiXkeMjg96+icclgJQnz7cW/CbOTNk7NZuNG1Aw3yCSj9L10CjRMvdMktZXdC/qT7u/cFfjO4qGk6vOdCV1wllKkZkIufh2bW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(956004)(2616005)(8936002)(186003)(31686004)(8676002)(36756003)(6486002)(66476007)(316002)(6916009)(5660300002)(86362001)(31696002)(83380400001)(2906002)(26005)(4326008)(54906003)(66946007)(16576012)(508600001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkRNRHIrNnNsaXVvOVpLZHUrNHNHTVRHd3lJUmxWK0FWZ0JmeU1zQjhCQmti?=
 =?utf-8?B?SjlZUC9xQVdqSTVzMUxHRjhVZ2ZIclFLdEZEb1FlVjJobzdlUXJ6K0RSVTVI?=
 =?utf-8?B?aHNRY2FWU0Q3K3dDeE9WQmZ2Q2w0Wi9iTHlzbDBUVkZVanJFcVNVZHQ0VUlw?=
 =?utf-8?B?MFIvWER1cnhrVkQ1NHA2N1BkMGdaNjFiM21YYmhMZVdJVElEUTVCcUZpY1NW?=
 =?utf-8?B?RDFtRktxNjF0dVZ5dFRia0JFb2JGcFJlTmRhTWUzdHh6YzZxTUFJWEQ1eTQx?=
 =?utf-8?B?ZHpOS09RMnlsZ2JrYzN3dHgydVRDRkJGQlF6NXdYTDdmaUpYWEtEVGl3RXdZ?=
 =?utf-8?B?Q2JsRXNRWXVXZm13aUhrZE9KbUdqbG53UGZDT1lqVllFdSswbXYyQzZOUTVt?=
 =?utf-8?B?RDhKSWJKdndlNThxR3gxMGdZRENXRXpoZmpvSU1FNldHRVFpUXVSTVN4UXly?=
 =?utf-8?B?bWFOTHJHczZ2bkNOclB4WTZsbFpWT2pmRFV2aXI0Sll2U2tYNzNOV2p0K3VI?=
 =?utf-8?B?U3FQMG5sSFJoUm5UWHY4UTBOQTNwWCs5SU9lWml4d0Nia0F2UHBPdnptdzBi?=
 =?utf-8?B?OHZSa2hsN2JSMWJWYVpmRVM2cldjbVQ5N2tlaXRjdGNxMHNCbEJWblhtaWtE?=
 =?utf-8?B?S3FraWlqdVdjY3dGY2h2eDl5b2NXVE9ScEc3L2h4Y2I2bWFIYml2U1c5cnh2?=
 =?utf-8?B?cWxJMXhtSktGL3I4Ty8wZWV5b2REWThnT1BKb3lSQU51Z3RzT3ljQXpiYmMv?=
 =?utf-8?B?ak1VOHJJZFNCamxLSDY4c3pvdW0rNFNxSVVxRUYybktCNjRsc2NaOUU5M21r?=
 =?utf-8?B?bWFIOTh5V0VSSkkvck9rNWJJWUE3QnZXVytRZ1BEVWM0ZER1T2JWY0xQVGh2?=
 =?utf-8?B?NlZEUUZMdTFUTFNFZWZsQzdDOGNDb1VzN2ZMQVpMLzJZTmJNaW91aFlqTExJ?=
 =?utf-8?B?RituMTV1Qmp5Qmo5QXE4S0d1T0VuRXpXTGNxdDRLcnNsY3hvcHF0R2t2UWMy?=
 =?utf-8?B?Mnd5WDVrR3VrY1NoM0hxV1B2SW1yaXJLbHczSUY0cGZxV0ZXVXlVNXZXM2Qr?=
 =?utf-8?B?TzJ4VXVDcmNlQ2svS2VQYWxWT3JqTU5Vd3IwcFN1UnkvRmRibHAyYWI0U2x5?=
 =?utf-8?B?bGpscU9HU2l0MXVkTlY1SEo5MmlwdjFtYXVIMElEYnlOYzVPblR2dGZZalZH?=
 =?utf-8?B?NWV2dzk1OU9uQVhITC9zcmt1cUFIeW04aDF1YzZJQVpMbHQwKzZ0TndoaHhs?=
 =?utf-8?B?MkhKVTBSUjE2aGl6cFJTYjhveWxGM0RUNVB2NWl4bzIvZElYdy9UOFlRZmly?=
 =?utf-8?B?V3NQOWhzMEFqYksvTHBFeDhCM0t2Mjc2aVRSZEcwL1dvVmlHQml5bjM5blpS?=
 =?utf-8?B?dTV1VjFsY3VNL3hBSUJoUHkzbVdKaUM3MUpROXdkZXJpbDRLYkpjS255cVFa?=
 =?utf-8?B?NXBCeGdHZ0dQcmlId21lRUlCQzZDWXZxaklWV3VmWTRndW8yWkFnSXJMRGdW?=
 =?utf-8?B?ZWh6RFliTVlGNEtuc3FzRHNyT3UwdmlmNnFSUEpkOVZSUGt2TUZpSFU0M2Nj?=
 =?utf-8?B?TkQ2YmRIY2xDY2pDTzRxaWpWSWVLdDdacS8yd3daL1o3WE12V0pPaGovY2ll?=
 =?utf-8?B?dVdTMHhpMnlLQ2MvZ2owbmVhRTJqNGxScUNCRGFhYm1IS05lcDk3ZDg4ZVc4?=
 =?utf-8?B?eDIvUHVHQmF0WFBDMzUvaTViY2JGQzA2eGxZRnZGZlVoOFVDTUZLWmtXa3hX?=
 =?utf-8?B?TjJoUkVnVVo5clhBNGZZNkJUanRZN0JKaGhsOFJTRDN5ZTNCUGdRUy9oZ01M?=
 =?utf-8?B?dkFRNzl0S2k0ckVWNVV0WHNDeEloR0dDclNPQlpzZVhlNlowTEpUalZVZk83?=
 =?utf-8?B?N1QySjB6ZHpXM0hoYWxiYnNJeEY4OERQTjdFTUZ0Z3dLcUZ4ZlRVeUlvZmJp?=
 =?utf-8?B?THFkUTdZVGpwVVdnVC8wRW9kR1pOVkJCWjRZRkN1d3ZSMS9nNmw2aFF2T2Jq?=
 =?utf-8?B?QkpWL3JIb1R0VTgwSDNsMmNQcERha01pZFUyQjBmdkNpVFBtY2JnWHhFL014?=
 =?utf-8?B?NFZZUFdYMDVheHhtSXIxTzJrcTRaUFd4YjE0dTZHUkVpOXRMTk1HN2dheGxv?=
 =?utf-8?B?ZFhPRWtHVTQ3Z1VJU1F6RFR0aXE2eEI1YU5DcWJzemlFZmxMbVNVWkZxaE1v?=
 =?utf-8?Q?99nNW0y9w1eDSV7w05n0P08=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d074b7-9d3e-41f8-712a-08d9b8bca110
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:30:54.6406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVru0BmsaqEEy1jCrM9Tj9SJc4Wx6nrhUfxxfw4hlQh7NkYtD3gtc52P8lu7ghAJQcK7EPPJGexejQTWjNQQVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

From: Lasse Collin <lasse.collin@tukaani.org>

It's good style. I was also told that GCC 7 is more strict and might
give a warning when such comments are missing.

Suggested-by: Andrei Borzenkov <arvidjaar@gmail.com>
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
[Linux commit: 5a244f48ecbbd03a11eb84819c5c599db81823ee]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
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


