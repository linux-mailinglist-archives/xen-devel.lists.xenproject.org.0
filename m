Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AE63975D3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 16:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134919.250900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo5mE-0001eK-2p; Tue, 01 Jun 2021 14:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134919.250900; Tue, 01 Jun 2021 14:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo5mD-0001b6-Ua; Tue, 01 Jun 2021 14:53:53 +0000
Received: by outflank-mailman (input) for mailman id 134919;
 Tue, 01 Jun 2021 14:53:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lo5mC-0001b0-M3
 for xen-devel@lists.xen.org; Tue, 01 Jun 2021 14:53:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 790a32e5-4e1f-4cd2-9fa1-e11f5c8d103d;
 Tue, 01 Jun 2021 14:53:51 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-eegdxSP-OS-JSRID5pLCJw-1; Tue, 01 Jun 2021 16:53:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3775.eurprd04.prod.outlook.com (2603:10a6:803:1a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 14:53:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 14:53:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0240.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 14:53:48 +0000
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
X-Inumbo-ID: 790a32e5-4e1f-4cd2-9fa1-e11f5c8d103d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1622559230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piOMuwkBshYty62f8FsiT+C4NIZhl+ittycigmmlPn8=;
	b=jMqFlkI0zTWlJjLApZ9jQGwKV8L1VJUINFI6x44WbdQMnteyb9q37le9aQXOnjE3EtFw+3
	AnN+zi68BbyeOTuZNyPRDNU96PRdwt7iuug1IZfaqWfMqTXj07BfWclL45H+W4ewiFjUZo
	PaWCFOs4aDFXNyAWKG8hyq1QLk000m0=
X-MC-Unique: eegdxSP-OS-JSRID5pLCJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmVxEAj7ajvFRPqYGWEEfEejC3Bt3C6zh+30oaqZOyjvbq/d6S/zndDsGy3LDe19WnMtShagIhKUt9kzk2uEhpxLq0kaDiKviH4ZrwaGxpA/WgMPe00eqE7t0McoVSnAAUHOYqfPSWCOL9poi0BeIFP8oM2p9024WBz5qwcrtIreDCZHfigvs1JFswZno36ArJnGJi3erwuHK3qy5JEjyi+5VZRovqR1RNpIUWVmjPurzq1BNnLK4qWJMFo+ire2Mu0nkELadAXS3TzWfOrg8KWpoXUuy42HwJZVUv1JU+PMJi96KaNlnyf/pK7JqoF9TlYFC8rtmzoioiSoIMDUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piOMuwkBshYty62f8FsiT+C4NIZhl+ittycigmmlPn8=;
 b=N5W+fK7RQXRrkaacV8eH213cNo5Koqhdk6hpQ3ttoCQlCKENr74fB5mpD+6Pubgm8Qoic8xQb7xqjDJERNQaK+oN5Ea6Qt0GN6cLDrhgrQGBsLqFjd0HblMb6hmRQZvjFeLprC02M8G1PoEDeLyipusWGaFyf+RWvdIxGZAbfT/JBD5XCf6SC9J8J3ncaebIF7M3SV18z4XxDFk6DWZT61BaRRreOHHhLnYA65S1bStD/OaUnbL/Bqw5vfbSiKKqe5zTKXqfPzCRE/SefHBfbx2MASLdLSEMbOTU7omMlWJJBw7qB+3X7DrVgTXdotjBl9XJUkR2zEoX8q94F2pRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xen.org; dkim=none (message not signed)
 header.d=none;lists.xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
To: AL13N <alien@rmail.be>
Cc: Xen-devel <xen-devel@lists.xen.org>
References: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
 <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
 <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
 <b5ff15fc-ec3b-6b48-3d15-7de29fa5b2aa@suse.com>
 <175befe0e853565761e51f07b79c49cf@mail.rmail.be>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <552b4348-1c52-ce6b-9001-a144c7147a7c@suse.com>
Date: Tue, 1 Jun 2021 16:53:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <175befe0e853565761e51f07b79c49cf@mail.rmail.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0240.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5517fe34-7895-46b0-3472-08d9250d1062
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3775:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3775124DEA826C9A997B53CBB33E9@VI1PR0402MB3775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lKgjVnqiuGhnCrzHlgddX9w2x84Zf3llh/XSVU9kEeeXuU6fZIWPhXf67hq+ABUvSPnHG2OJkW3Zj+jp1E3odcLjGCTc8FO2njQdHFNPBQTx7JWDIVgqoQZoWu47GiTsoM3f/I8zDK2STR0kMmAiUt6poVhTuqTHA447ggZU2UxwRRQMtUCKh1Stwly+j2epfZvETjN2yv22EH6vXrQGydZuEIPii7zVR1Lshdjh4yIBWui+jfiZCe9/p78HdjxCf4Z5cnKaTapgmA3uaokMLnjaVU+GqUke9VVAv0aXYjfMrH07b/X7LpAW0Xn9i6n9FC/FCEhMDCUkvfwnatzCWZBDuWmYvqo34stlmn+ooK0nYyjVv522WDVSdiphYOAQxT692J5Mlf/QzR3VsJ+iRTf1TYVa8WBhAJARxTUmzY9G4Pu96WrWjnz1RD8Zm3zPtaIutBa5XQiB1Ib6NfF1Rkhk4mwMdEt0nvEcqYVTw4sbQgS6S2KJu6GjOpTifA8o+KmyAHf/+PF/kzpegaYLf/sOwMySDZb0/Im1z2zOQSrXdwxMjKpGfigIFE/nRtjuJgrZ0QmXnL6//3bWOomI0IyPwGv+6b1zvWJcwgQvMEIxN3FV5iQClqdX8Fk1TEW3R8q9kBty2ldNVNdXxzxP+ovoemRtiOJ+oGPi6yr/c1V/03Qm/PS/ZadmAo0KG3xa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(16526019)(36756003)(558084003)(956004)(186003)(2616005)(8936002)(66946007)(31696002)(86362001)(2906002)(8676002)(66476007)(66556008)(6486002)(16576012)(38100700002)(6916009)(498600001)(26005)(31686004)(5660300002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?OTY4MGZBY3Zza0xTSkI1a3d1ZTJuU3JpYzc2dEFXOGdpU2xQUjlqTUMxVXhu?=
 =?utf-8?B?OFJ1NTJtZnJYZ1oxTTBoZlV4VkNyOVRraDB3eXFwdkJEMjdWQ1ZkQmg2ZlFI?=
 =?utf-8?B?VGV4Mm5keTBSaUtudE9XajhubWptOTRGSXRmckY2NnFkUDlzVVpiYkRSSG1u?=
 =?utf-8?B?UHlnbXFyUTlNOVZmMVhNbzVDWkpXNUlZYUtVU1FXTHM2dUlVR0RyVDc4RUs0?=
 =?utf-8?B?cUVlOGZ0cnMzaEVWZk1rVkFZdnlVU1d0TmFBYnRNbCttK3IwM044MjZzTTcx?=
 =?utf-8?B?WUpBUitZZ25oWTNBT1RmN3M0V0xjRzRXekZQK0xxUmVDaFpEazh0WlA4eita?=
 =?utf-8?B?dzB2TXY4ZG9wMnhNY1U2SGp0RHNrZ2tDWjNCc3pld21nWFlkZGhhMXJhT3Br?=
 =?utf-8?B?ZVJnN1d2YmtxWmxnUlluSFp0MXRXdStHdkI1dHdxSHlLLzBoaElWN0RZM3h0?=
 =?utf-8?B?c3J4TkV2eWNMV2xiQnFOVVQrZnNmM0thTHI4Yk1nSjU4YkQvL216Z2VmNnBk?=
 =?utf-8?B?c0wrRmhZTWZ0Mzg5cThXNTFhSm8zTDFicVBoUjlLaGxidXpCbi8wR0FvaHZS?=
 =?utf-8?B?bEsvdSt6V1huV2hIN2tCMjBJdkpyazFpTGQrR25WT1huRFYySTRaUlJETVJs?=
 =?utf-8?B?OVhpU3FGTEEyZTFBV01OeEpnNFk5c2RVSExhODdlemhTdGZ6SXJYVEN1Zndw?=
 =?utf-8?B?Wmx2MnU1czhEZUxReWx0cnNHdWxaRjQ5VEZpWWpPaUUwQXRVR1FQdUJVemd4?=
 =?utf-8?B?ajlaSDhxUlpTS2lTdEVWWU9vZGlidFZrYWF4cTRYR2ZIRW5Va2lxamY2QVBU?=
 =?utf-8?B?YitxVzdZWFM0R21YYnZFQzFFcUdZM1djM1AvNFlqNk9FRGdDVklIcnVPSUIr?=
 =?utf-8?B?bXJDTVVRaWowSlpPeEFkMW4yYUc1NjlzcTVHbWxkeVhiajh2aWhlVVNheDdD?=
 =?utf-8?B?K3dmOUZFWGVPWGFPU1JTTTBjeCtuS25hYk5rTjdWaHN6OC9BZkRqbnVBY2p6?=
 =?utf-8?B?YlZhTzFiK01rT21xc2ZKa1prMmN5aVh4aTM2dG9PVXJ6TkRxOWpZUDQ3T1RV?=
 =?utf-8?B?UUVPL1FhaG9aVFFwaGFlQW0vYTdYVTlzV1RSbjdFQ1NTaXdUa09Gai8xNy9T?=
 =?utf-8?B?SldYcjlOajg1TWt1MFFqRmVvWkpwSEZMWGVmdWNXTlAza1REekxXYUpTUlRG?=
 =?utf-8?B?dmtoV3FLZVQxWXhTdWZ6Z1RrUDNVWWhLUWFnVUNNM00waXFXK0dvazFHRFlU?=
 =?utf-8?B?RFJrUEs0SWlobmdBS2pOb2tjckpNNm55c29ldThpUEtqMjNSeFF5SlRFZFB2?=
 =?utf-8?B?YmtGQlprWld2NkpaR3Y2ZGRFcGYzMUM0ZkpLODhldkdtRWRFZU5mN0phU0k0?=
 =?utf-8?B?MGRuZkFmRlVRY09MZDl4dHJIOGRqT0dsVVRiTndYcytyQUwwUS9SVjg3VE83?=
 =?utf-8?B?aTU3b0doN1FTcGVRK2FiUUhDT0ZBMmFiMUkvWm5Qdm1JdXNqSzk5S2RuYldG?=
 =?utf-8?B?c2oxK3UzNUtyVk9QbnV4QUNKSnJDWCtrNWYvWE9UbldVTXZsdys5cG9uY3Fq?=
 =?utf-8?B?dWZxam1HamwxdTZ0TEZzTVUyTjlDU1VSc2c5Y1dNOC81Rlplb2kyWm90aGNB?=
 =?utf-8?B?cmpJQlRNd1NHZVlNaDNrSFBkdTdiNUpqQ0wzaWs5RSt5aGZSOHpMMGR0M2ZN?=
 =?utf-8?B?M2hhQkhEOGZFMUFhQkdGYWV6VFVKYXM1dmJ6OE1Lc3hUSlBsdzYxMmVOYi93?=
 =?utf-8?Q?jogKB3YjlHb76YygSm4SsZj//UI6XLwCLAGeyj5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5517fe34-7895-46b0-3472-08d9250d1062
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 14:53:49.0539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZyFc6bkVY7k9PYrLYBO8yLy3GmxuhYu+ujRF/ZsLmM6k/BEWM3xYDoEoadSV4+dnrybGB0YgTNUTpR7E9cxzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3775

On 01.06.2021 16:44, AL13N wrote:
> This mailing list is the correct place for the toolstack too? right?

Yes.

Jan


