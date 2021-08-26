Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DEC3F84B5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 11:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172832.315378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJBtw-0001iZ-JI; Thu, 26 Aug 2021 09:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172832.315378; Thu, 26 Aug 2021 09:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJBtw-0001gn-Fd; Thu, 26 Aug 2021 09:42:24 +0000
Received: by outflank-mailman (input) for mailman id 172832;
 Thu, 26 Aug 2021 09:42:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJBtv-0001gh-He
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 09:42:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9574ca2-0651-11ec-a9de-12813bfff9fa;
 Thu, 26 Aug 2021 09:42:22 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-tqZjjrozNcOZHMw24lvrNQ-1; Thu, 26 Aug 2021 11:42:20 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 09:42:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 09:42:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.21 via Frontend Transport; Thu, 26 Aug 2021 09:42:16 +0000
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
X-Inumbo-ID: e9574ca2-0651-11ec-a9de-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629970941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=muvHrwbcbFuZJchQX05pWUyn1T53+b2h+Nd7dKagbjk=;
	b=F3taJBG3qdUvmlpWP4rCcNuhRIqBP5HrfQVPrB95jyd9dYYZ4s+Zs+9l7SnH2HRbLgDEJ9
	UJvfZ6g914pRXTAfoS0XJeLeK7y8C6s0FGLzwXTQxLX7k0mscMpJ5OV9O8nBe90bc7rZHV
	19N05K/GVahw/TbAsF0xplMp73Yo7RY=
X-MC-Unique: tqZjjrozNcOZHMw24lvrNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTeA0++9T8/iDSGhg4y9eD2w16nG5aHJV+MoAxFukR/A6olcCIReRnKUhX0AkMrXk+4Y3wlfGSSUosb86qc0SazUWd8cNui0GZlrv5apWHpFSrYGU9g7hIIawbzEmisVAbh20OH74lGLlIGzmXE/9hXJ0LAAclaUXSxyEjGxlu9ZJCC+RxMeMj5VcR4yPGyazKD324kHzglaYe6W3LLLLRxfEEWvH3kwYk+CaqCvUaXnNWIWKRxQugml3EAwagKQB2qKE6oz1baqzkToc8iWxPI/M5Af63WCqZb6k9CmNJq6c3r/d8E2SJhi9+vGou0//Hdy0lZXk8Uo0DSnCh0TBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muvHrwbcbFuZJchQX05pWUyn1T53+b2h+Nd7dKagbjk=;
 b=NMay5c1ujNILj80opv6bt6T4wVvl65z7jzxVG17/QFsP/T7Qv50jXXTMQHHWZgrE9JvK5AVyNjleniymuwzEky9Y8942BILFzqfMS0jtrbxzGpP7eKkOu7uKfAjaV+pUPkrKxb0DhHKXLqXxxy4u5kvrBlX5bU9ay0DvMcy0JhOLfxg8BLjBxCXAK0/Umy13GqJMS5djeTm37ZW6iHbgZtcWiV6v7vPeUgkJcUl+ZLEPuOtgUF+jL0cf/k2nO3d+orsqYEA9SqatJGlJTL5AIh7pkfYtiYLVT2u3vBeLE4ihVFgmmZOizoA53FgCPXOda5IMmp5zXNBjwU7X1kmhcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: tycho.nsa.gov; dkim=none (message not signed)
 header.d=none;tycho.nsa.gov; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 08/10] xsm: remove xsm_default_t from hook definitions
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-9-dpsmith@apertussolutions.com>
 <24832.3234.356168.227371@mariner.uk.xensource.com>
 <93bcfe0f-2fd6-7177-53f4-8544582df3b8@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <883a5aa8-fe25-3b83-3e07-941cd2609900@suse.com>
Date: Thu, 26 Aug 2021 11:42:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <93bcfe0f-2fd6-7177-53f4-8544582df3b8@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0011.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0d84ea8-aa27-46bf-3ad7-08d96875cb42
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5597997357ADC0F097DF67FDB3C79@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YmAw+82rd4OwfdIhX0x22LcvEZ4q8hpbXj3CUwTkbdXDpC0+BcNkLyIA9BWIYvMNg5C3jSWXO4kGb7bbNZtEfjfmzpW7EEVN0azuvnOPXMqVV5yZ97O7eJLjuRrHgDARjIcABNUm9g96I2bGyS3kTdbsXfCRE6ZviTjx7BHo7Hl60xO0u3VUrjpF/XB2gffoUeYxSIvXp8LNSpQr2Urf6qts1XvTdgkz9JZzvkRw+5Cl0hmAzg012jBjID1xXNsZiwh2NC6AjmWuLKr2PCAt8Z71VgKhJmGgsQ2YgPG4eUP3KiTvu5mZUysz23EngcAM1Qr5McErwLs6YOCcPc5i5Do4O1GQFz1lYKfNo7Jj3ZEplhyvt2fLciy26m3H64UD/5vX5rDI/4w1sd0ZBiRxuvzDNF9h+x6iqxieiMQnQ5a7wADAWvuF13+1H0Iix7iFPkNFJjUYdcXC2yPR/IrFTXVAFI5ZMFf13834/hzV/9N0jRJtTzkTeyYLoSnV8jV9OkqbmnioK+Cjl0Allpw8XRtvoBtTLzUTNFZG7hpoPxYcauPIyJFYMmrnT4iOKCFeVGvoadmlz0bQzF8nHmn9+6+cRWhLT8zB+0WXAPH3Uk+4h/UbGlFYNogwV/QX4l4TJoEwmTWdxVlBCr4nm52wJHP6zuAxcb/5Q3sTZlsX1T0KW0vdxW/KV/sGYj7Lw8pIH4k6apXo9qGPxqH9ctT4sKdn8UpxPFKzarqItEkkjr4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(39850400004)(366004)(376002)(31686004)(66476007)(6486002)(54906003)(66556008)(186003)(38100700002)(31696002)(8936002)(26005)(83380400001)(5660300002)(66946007)(2906002)(36756003)(4326008)(110136005)(2616005)(16576012)(956004)(316002)(53546011)(7416002)(4744005)(8676002)(86362001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlJ0K3RXV0s0ck5EMWFTN3VUL1FLODJ3aUdWbkNUMXdTdldGdXFqNlFwZy9x?=
 =?utf-8?B?Y2o5VEFlRjJ5VFNVUVcrWG0xQW90WTZuZi82TFFhbDlQREtHeGNERTJPMHJO?=
 =?utf-8?B?dVpra2pBTkw4LzZmVlNXcnZxMVkzSStjRnRJZlBtN0padVgwUUZScDkyQXNy?=
 =?utf-8?B?b0xMU2xlY1h6VjQzL2pMT3RlRm5KSEk1TnFaWmVwZVIwazVDQnBuSzJrZ20v?=
 =?utf-8?B?Q1BkdFJpcHpTY3U1WG5SMzk0azA2cmZUY2JudFNpWmo2WVJ3R3E0eVpNVWpN?=
 =?utf-8?B?UEhkeXBsOHFKTnhaZWpRRHdFK0VQN0JKNW9HcktjNFYrem9JMHRhKys0cm5J?=
 =?utf-8?B?UWIyTjY0cmZvM3FRdmRQYW51aFp3TTAxcEhHRDQwdVZ3ZXhxMFJuNGZCandM?=
 =?utf-8?B?YjY3b05NTEs5a00yYnpqRW15REtNQ3dLM1Z3cTQ1SzY4d05BeW9sditKbmZT?=
 =?utf-8?B?Zm1aY01SUXlPTVdaTjNubGtIdWlReTFOa3o4YTUxTHVKVXpFWnpOUm9XbUp4?=
 =?utf-8?B?aDFzNExsbW1UTGpDOVhCczZsZTVrL2o5a1NJTjdNU0lFRy9hM0tsKzRma25W?=
 =?utf-8?B?Yk9FcUlzS0pHcHFsWGN5RlZqVHJ3SGFKSmpTajNua3g1YkpqbWN1RzJtclhN?=
 =?utf-8?B?eVJXODM0UUpyMC9vblBucGVlY2txcnNtcUJvNmNnMGZsK1J5UmJsR2dmaity?=
 =?utf-8?B?d09vcUVkeS9LNW9EQmE0Tjh2cWFtbThUWEtYand2TG56UHhpUTlZeWswVmpi?=
 =?utf-8?B?TDFYb3k0REw5bSsrREtJR25lNVdlRUR6eWJ5NGFxb0U0cmthNzZyQ1VvNnh2?=
 =?utf-8?B?dDE5emFucUZvdDlTU3NWYS9iOEdDWWZrTlQ3Tll3RzB3S2NnTFRRckJvN2Y4?=
 =?utf-8?B?UEdZa3dVUnFCdytKNkw3ODdYUy9raWtTVERTTFVMa0tjM0hHR2JqYXNuRzh2?=
 =?utf-8?B?NnZncmp5b3lVb1RQWStvK1VNRi9WLzVrc1dCQVY3ZGVERjRzZE9LOE5ZZE9a?=
 =?utf-8?B?T0M2UTJVVlk3TUdxYzVicFlpOVRpNlNZZFdCa3VBdmlQTGRjamZ3OWhuWFZk?=
 =?utf-8?B?bThvdFZLdFVoUHZVbUozWXRBODBPVzhneHY4bHFnRHlxY3p2TGdPUnFZemNG?=
 =?utf-8?B?RmpOdVNRcm8wZ3BvNmRJRVg1eVpwRWlPenkwM0dPbVNjVVRkcXVnSEtNTWF4?=
 =?utf-8?B?R1NRMDZBRzVXUUVRelI5SFhrNFlDVThZeXk5Q1dDWTg2RndybzlKdWdJTGxZ?=
 =?utf-8?B?bk5oWTNpbko0Ymt6MndlRUJqLzA5dDZta3hUcmVrWCtHWkZ1L0N5cDM4d1Uv?=
 =?utf-8?B?QmMxdlVVWldZZjcyTXRQQ2l1N2lTYUVWSW9CaUdkSTJwTkRNSzZqaisvb3Vj?=
 =?utf-8?B?K2RjWE04blNMbGdSWERlYTNnT3hsNFRSZzcrSkJobVBjWHZwNFowbGd3a0Vi?=
 =?utf-8?B?b0lNQmd4MHdmRDBSQWtxSnFRRzkwWkc4QUpETFhVUktMRFFNVE9tV2Zic2k0?=
 =?utf-8?B?K2dJOXkyZURyR2hINkRmVEhxNmprVVBRWks2TnV4aVZyNUdpNGkwTVFzUThR?=
 =?utf-8?B?OUlDdGFYMUt3TThCM0FpOFhOYnVYWXNMNEhBNXQ0UVdWa3JNNHoyOUVBaWFr?=
 =?utf-8?B?bUxTTlBnY1phOGF3QVpUanJxcm5IdG5BSHlqUHN4c1BQa2pqV0FjcnB6dm1F?=
 =?utf-8?B?V2E1UjYrN3YrN0hETzVpQW9yTVV4aHVKUUpQaVZ4cU9ZalA2QUYxSnNqRlc5?=
 =?utf-8?Q?K8kxmK9LOsgpnUhayOvEbIf5A4O6d0TnQ5Li92h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d84ea8-aa27-46bf-3ad7-08d96875cb42
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 09:42:18.4411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSoiqr5gSiR8RBHFb+V+3R+HQgXpGlqteRhlgY+xK9YS23rRcZvY5V9CBBR4uvQLq8RFwosRfIHxvjnB7h9rRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 06.08.2021 23:41, Daniel P. Smith wrote:
> While not all of the points of contentions nor all of my concerns are
> all addressed, I would like to hope that v3 is seen as an attempt
> compromise, those compromises are acceptable, and that I can begin to
> bring the next patch set forward. Thank you and looking forward to
> responses.

Having gone through the series I've been happy to see the adjustments
that have been made. There are still further requests I have spelled
out, but I think (hope) those aren't as controversial anymore.

Jan


