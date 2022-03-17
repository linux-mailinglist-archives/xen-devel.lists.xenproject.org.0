Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BB14DC76D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 14:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291558.494916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUq1b-0001Ja-JT; Thu, 17 Mar 2022 13:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291558.494916; Thu, 17 Mar 2022 13:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUq1b-0001HU-GB; Thu, 17 Mar 2022 13:18:43 +0000
Received: by outflank-mailman (input) for mailman id 291558;
 Thu, 17 Mar 2022 13:18:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUq1Z-0001HO-AO
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 13:18:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c24d8afa-a5f4-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 14:18:39 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-1GtdhNg2N5mny6NDDj2l-g-1; Thu, 17 Mar 2022 14:18:38 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB4489.eurprd04.prod.outlook.com (2603:10a6:5:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.29; Thu, 17 Mar
 2022 13:18:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 13:18:36 +0000
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
X-Inumbo-ID: c24d8afa-a5f4-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647523119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gM44/RyxAiy8lgRoFEq02yNHIu42B9zSNU+FDv9ga3A=;
	b=N9BntDHPBhquUasllZYvmusb35iHOtuQW1Js9upj/mfxsoatCivZhX74SUT1xSIyQThLQl
	vFuU4bYOrDQGaJV+vbfWHzBhnrXF0E3U9I8egxJv93IAX208bPX9g4qCTwrAMc75P+B7x/
	Ia/DVCut/p/O2asRf28eq+o7oTsOIu4=
X-MC-Unique: 1GtdhNg2N5mny6NDDj2l-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bq39hOAMEjKG9etZKFuYv5BVtbWXJsLodrfRMFyKfSRAtWAMSr/P21YMx9KrohCIJQTQW7Cz5AF94Zi7UDjkicUVy+7X6MgYi69RpKDNahkSJlSA/+jEcNGYrfOmvJMNIHpk5kPfzDUTCV+ynQ9RcNWicqYRvASwJpBH+TiXSRzF9qDCF2OwJuQ2XBsZ6UX1IXQf0GFlzSwMmzxqDH4uvBFzL4e5IRH3INQJmUhHXqvgUyaOhOmv9BwOxAODv/wsqZjm8TJoz8N9mRRnfm12IYMv9CNBLeA9X0El5c751K6paSCGvzwiYtHf3nbRDHhgL/jTaofsT7thdbKvzNeyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gM44/RyxAiy8lgRoFEq02yNHIu42B9zSNU+FDv9ga3A=;
 b=bNCZAp5IUveKQNa3Yiq0nKV3EGnRgs7rXvbDFjLlkvYXqkCWrR9nP3RQoShM+wDdzTrGjuxPyOFQ8LSWAF6r/Lzmy/DZtInTk7AQkxMRF1o194fgnLU4r+s+VLyJy5ln5QwMcwmYb7Xy0W6vynxnUGhZ+pA4El6lkCWga/nfoxasOKthGCOJSH3u3PRcFFeUMiAn1GH6ScxeUxqp6X5tiep5+PYsq7XNlWWn2KYVZ8iqssn61bWI4CH8Ve0g6fBe3ih4sFazhTUHduuFkJjNSgl4iG6wNPqXNMKA6B+km0q7mk1Xkmwkfj5nS85xu6xPygXr20C8PZu4dKpTyI5yTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f40eafc9-2539-e47e-e3d9-666aaeb79220@suse.com>
Date: Thu, 17 Mar 2022 14:18:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] livepatch: fix handling of (some) relocations
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220317110854.39050-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220317110854.39050-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0230.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2826dc1f-a75a-4ba8-7d2d-08da0818a4b4
X-MS-TrafficTypeDiagnostic: DB7PR04MB4489:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB44890A034D14F0ABAAD26606B3129@DB7PR04MB4489.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7P3F5CXpR0F9sh60lKzofLbTGEvTj7W65ev2G/prDrOZ606PB6Wu2DYyDkNM2TglbJ3+Zq1YP2A+i4fAbS3p799/3uj6ULlpJE4xomJ2j3MHp1jWJaEU2Fpq8S54VjHhAkIdSlaDav3PaYYuKngKGkqNaELFFI9gM+VpfJdABhe1L1ALOQHQVHMiXR9YV/7kyTykXy/by8NZ7UF1qXMmGFN47J8HVy6pGknSxS9GTmIAkkOBXqc/OObhvno2eu2YexhQ1DRG1p1LA62zEbsjOzKcBVWuGPXPRMyHvGjV5wirp31OaRqWL+2T/YOqrpCh/RJrQ3PKOdxXEISY2mjj4jLkBaqtwMT34v11/pezvrSczLjiMpjUPIncJn3QZOQsr2t8vl8raGB8kzQO2Ldx6bZ1ZILqeoZkh2M38fdzn4+Kq8pLaeFwz0CxHXIj64yLkjOCdEtM3G77hcv0WGeOfwfWuF2v1P2CnOO1UksIErVZ1vtQPlmB7zd7ytbNqp8KbmaY+wtzHWE+a1A4/Z5QM01oN5jrLxDO4UsMhLp+YkIm8KpZelXXDshnUxXEq+YtPI12xKxF/DBJGgutH8UyJuUkPig+Gh6aOd4T0Ah6Gwi3D/hAgTdqSuUh+P1sssagnUbf/OvXMBDFaMUxLluvDOD9ql7j0CNPvBhlKELdRDL+jPBzYNCp6AoAGK3lB6SkDlD5Nqb7uZv9NsUg6vC5/dc9cj5atdmMkxCy22n5chI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(86362001)(31696002)(38100700002)(508600001)(6506007)(36756003)(6512007)(6486002)(2616005)(26005)(53546011)(186003)(7416002)(8936002)(4744005)(5660300002)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(4326008)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1hteWUxMEYra1hBaDJWRDc5aFg4TjlLdnltVEtxc0JJSG9lR3VyUlhWOW1Z?=
 =?utf-8?B?Y09kVndpSjJabytEbVkrVXFEbUpuMG1qWE1XdktRVFBQYW1OY2JTRWlTSkNH?=
 =?utf-8?B?ejV5WU4zUmVpZ255TytpSHJVNmFiLzF3V1lsWUZqY3A3NzIxMlhoZitrSXdZ?=
 =?utf-8?B?MlAycXluZUI5RkhiQXk0SnBvVHVFTW5XbU9CODNMQzhZcVZaenlvem9LZFox?=
 =?utf-8?B?Q28zSVZxZ0RWZTd6SzU4dGVMZzdmN0k3MVhURDh6eGIvV2RCS09QY21pQUha?=
 =?utf-8?B?UFVGYlkxMXplUmdRQitTVmY4UTZvclFaU2c0K0t2TnEvbHlUVEs0UDJSYzcv?=
 =?utf-8?B?QXBkN2xTeUZ6VGhmUTV2NkpMdDlVM2ZYRzFnNThnWUEraGZ2T3M5U3NFQmlV?=
 =?utf-8?B?Q01KcWRNV1ZFa2R2ejkrSlFROTdiNFBIeHlkYVdVL01wU2QrWExzT0l0WXdH?=
 =?utf-8?B?SGk0MHdqTTVuTUJoWS95TlIwbUVtOHVQTkdpZjVpT1BiWHRHcHBBUWUvK0px?=
 =?utf-8?B?dy80TzNhSDA3aGVxV0ZZc3UvRHFDbzNxcUJJZ1daQVcxVHpHTVNFSUJBME1y?=
 =?utf-8?B?d0JxSFh3elljZHkrSXprQ0xaVG4ycTZMcnN5c2RsUlRlTThLS1RmVC8vNS9m?=
 =?utf-8?B?dkJ5ampJeWpkNWxKdjBIRTFsVWtTUU5yWmZQbFJueG5EaXNIdTB2MDE4OWVF?=
 =?utf-8?B?RGJ3Ri95M2loVzdieDFoKzNnUEhZSkp1YjlYaHowK1BCVVEvWWlBR0wycVl2?=
 =?utf-8?B?Sk4zKzd2c0UxSzJwTFdRNXVRcHFLV2R2Rm5HbUs1RjZYRGdLK3Q3WlY0M1R1?=
 =?utf-8?B?U2FPWDhWeG1qRnVpbE5ZZ2RVQVR0VFp3Y1M1UUV1aVgvVmNJeUlRcXRUaDQ1?=
 =?utf-8?B?aUpnRG1oSm5SOGtBTnl3d1JEVW40NVpJbXdJL250bnZZVmpaUHdTeGZLZllZ?=
 =?utf-8?B?N3N0aC9OYVlCa05VN0xZVklkV0ZKMElKc1YzeWFsR212Z2Eyc3QxcTAzdDVt?=
 =?utf-8?B?NmtDS0tWaWIzbjU4TFo4NTQvcXRCeFdhc2VZRWpNSUhLSjJJQ01rOWx3UXVY?=
 =?utf-8?B?MDM4Z2RNQVpIb0c1MS9ybkRudWhrdG9Da0Y5cjlxdjhlbGFJL3duaCtHY0JB?=
 =?utf-8?B?eHg2YUd2TWlDYU02UlFJZyt0TldKeGhhQWJ2QS8vSjhJRmp1US9zeHlSYVgw?=
 =?utf-8?B?Vk1lckVDNFFaS2QzdGFsM3ZBNGtISGhCemU3WFl6aE5nV3MyeUNFWXNaK3V1?=
 =?utf-8?B?N3RJQi9nUXBHaWNpRnJKT01tNnJNYlBDREt4MHIvV1dUVkgrOE1NU1IyMmI4?=
 =?utf-8?B?bG5vc3JITFl6d2lmQU1zaVQ1Y0J0dW1yQkhUL3VBdnBkdE9ic2xmTGYxbGdl?=
 =?utf-8?B?b216L1NlanNCekt0dVFLTHZlQnZkNlpHZjBCUEtIeGpOK3IrUGJQaFU2aGxX?=
 =?utf-8?B?STlaSyt4cFpJYkZmS1UwbWVLQ0wvWituRzlOWmFWaDVzWi9FcmsrSHlwdml3?=
 =?utf-8?B?NWZ3c3VETVNPYXVqOEF3eUlORzNIV216K0xPMTNmYzRXWGNibjIzalZaZTFB?=
 =?utf-8?B?S2h4MmdPYVFDRGpVdUZvZ21LTDJleHh2ekpTZnh5TVg0N2tQSndId1VQR0VG?=
 =?utf-8?B?QWhlTTJGR3lEL08zZVlWY0c5RG5JRVVMREZUN2NsaFlQdHRtS2N4SEFoNzJD?=
 =?utf-8?B?RUtLOFRIWWNSU0x1Z3J3WncyRHRBY1V4THB4YTltalVxTEYyNnFuaDZTdUFO?=
 =?utf-8?B?MDJjWlFNZ2FqU1lISUp3RWg1cDFMeWhkZjZFQ0FKa1R3akd3SzBReTZyNko0?=
 =?utf-8?B?OTlkdElwWllkMFRja0QvcWtKdExpZVlkb0hVT2xBMGVHbkpKYzk3RjNOM1c0?=
 =?utf-8?B?ZmNhTG1od3l0SDNBc01aclFEZTFaMXVqM2FPNjcvVFBNZS95VGdET29yV0FJ?=
 =?utf-8?Q?oICO5Phna062qUcF9nifqKCDY0yt/hY1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2826dc1f-a75a-4ba8-7d2d-08da0818a4b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 13:18:36.2969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfUarh6Szz+vRRMXBVvi3GMIbjyg7yaWOZIi0jBujOpwcLPz/L+A7yV8uzIbK66/aFFDqAPOF7phOTFhaLMEDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4489

On 17.03.2022 12:08, Roger Pau Monne wrote:
> I wonder whether it's possible to have unresolved symbols if we only
> ignore non SHF_ALLOC sections, so we could maybe error out earlier if we
> found a symbols that belongs to a non SHF_ALLOC section in
> livepatch_elf_resolve_symbols.  The current approach is more conservative
> as we would only report an error if we have unresolved symbols that are
> referenced in relocations.

I think it's better to remain that way. Symbols appearing in non-alloc
sections isn't wrong in any way, as long - as you say - there's no
relocation using them.

Jan


