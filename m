Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E33F4675D7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237358.411681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6KW-0002Nu-35; Fri, 03 Dec 2021 11:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237358.411681; Fri, 03 Dec 2021 11:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6KV-0002Kd-UX; Fri, 03 Dec 2021 11:02:15 +0000
Received: by outflank-mailman (input) for mailman id 237358;
 Fri, 03 Dec 2021 11:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt6KU-0002KX-MM
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:02:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78562438-5428-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 12:02:13 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-z7fE4Dv8PnSXCePnbj4VhQ-1; Fri, 03 Dec 2021 12:02:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 11:02:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 11:02:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Fri, 3 Dec 2021 11:02:09 +0000
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
X-Inumbo-ID: 78562438-5428-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638529333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gTzUmTFi+bQ85l6C7lOA0QHrHZGSoFzJbGdTk8XU1AA=;
	b=JOY2z7i72sD6TlVE7ORGnxwe39GfsKkUfpjUS44TqUOj4oKGo/5hQtvd/YcccX352vJGF7
	0lrcvw4KHz24AepEKuOLVU7QVzb7ywVwXzGMfHRJ7hTzL+aBn7VH7x7zkX5p0QgyAPrLiL
	Zo54ic3qlJLXEBN7U6UoGPPDRrrwLec=
X-MC-Unique: z7fE4Dv8PnSXCePnbj4VhQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idZ+E++HqI77X5GUvn2i+KnwLc34Ar94GayWB3vhCN6+Kv6lxKWwE46O78lF48rPQmzVUaIpsT6juqzEx8LWYmHP249OefOSZRfN6Pymy79iAq1zO9xwcSmLzmHKq5xOunIAUh53wlDKN0IWdRL7rBibi267boAYQDTKFikZPUb7hnLrsjRNHiH8rQVpQBMYREYlDXFUVgLs26soBBEnkDMTMvIbtuLmAMynyfsN+yeQ82OmJLN0UeIj/nrAeRyTT9z/oNujQ69S7QhQX5BzjGsMRi2DFlvbrrltD5eeXXLv99lOqYqZgZtof1+wmGq4h4TRhuiz5qpc/3dSib5m+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTzUmTFi+bQ85l6C7lOA0QHrHZGSoFzJbGdTk8XU1AA=;
 b=BpDwn1M9uSSKYdbbrYTKO/5iNI7n0tIpJsuiM1i5KBze0y9QlyNVclbEQfDZGZ0dZMlVZyv0I/wh8w9hLre2kFuHaLamYj7dxFVNRa8C0Uktv0yo+ERZBGgZcN0VOHbFYywBiu2eERCuIeNIC8v4nTJzZktnH9WYJexkLBzIDcpD6MMkQJ0LkumTdk5BqgZ9dSPVHqYHh/HzORH1r7AZqp/GCTYID1rM9fbAWR31SUCeecVAmia12upVJU3axDgQEhOE1mUT5Xv5BH9syqbnpV57bg0RRDAL8Y3gZyD4++5ynLL5yv7xJeI11b0bUiXJuMTIaA1j0iM9VeUeRFJLmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e7d9c7a-9884-c3ba-e2b4-1477d01172f6@suse.com>
Date: Fri, 3 Dec 2021 12:02:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Ping: [PATCH 0/2] x86/vMCE: address handling related adjustments
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b16904ec-0302-4094-7d89-f484cbf0f8a5@suse.com>
In-Reply-To: <b16904ec-0302-4094-7d89-f484cbf0f8a5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0011.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d54e9ba7-bdb4-4ea6-67d8-08d9b64c5a95
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB338974D2C520ECA51C902B29B36A9@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sgGoJo2Z92IqtFVAv7N7cEx2Yy5ILJM4Q+cUt7d10S9KpSFU1c1nwh5Eke+cd2EOSTU/OWVlY5uY0kxLEXEJoAfWods32BKV0nR7TSRsiKzetkflHhm5pNnAArn/AHxPNSQQFcnlte3OjPfW8o3xknMDr1eXZ/vk58/LVRTW2oamKLCv6lhPNKD8IWPFy/X49KixyLcwspe7p2YT4TKwStdZRGD8pdvPbD0U3v/8BmomZqRxbt6TE5G6//4uJR318NYUGBOkbhDQ7wJWXdDQ12iWveI4AmGGuhOWKNn1Ex3ncIypA+z6zWhpkSJ2f5kbt/0c2SM5Kon+sJf7Jg9DMPWpPVixK8JHTDkFgXzY/uaM61nl/mMaAf7dA4JkNop7lxMx3iMspVuJe1bj4M17O3KoVMJaRqsAC8mT4VGUIr9rYusljyBwsYaOdLYimfSp57azSXztAABCp5MAy0wo8cPXzVRUjCm1akCItIC6kW17XRvTd4aY3yj8h1XiRDOMIZumiRlFntNMWE4ARCuvsECfBoUKrJu0ZtqsNZ2/8cI/0XyrKTK4YxNi4KKCi3XbcaL5UlGtBLGooLBb/4cUlCLMu2GHyou0vl2Jzr0o1pOOaboevA9nK6FbtHDpcysYkVjK9W0hnzu2hLdGTewXEAOlepJ3Ss6UMKQAl8p654lm8dAYd7Nyiygdn0lkgNHNJ4OSxQNfs1ReQYQkKxrdV5qtLUQl1iKkKwV2YQo85Lg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(66946007)(110136005)(8676002)(508600001)(316002)(38100700002)(5660300002)(186003)(53546011)(26005)(16576012)(8936002)(2616005)(83380400001)(956004)(31686004)(31696002)(4326008)(86362001)(2906002)(36756003)(6486002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUZXTDhRSUd3SEwxUUpRYThoUDkva3haWTNjeTltU1p6eXJxV2NaeEpQbFJm?=
 =?utf-8?B?enl6SEk4SFhkeEZ0bGdIY3FpZEF5RXVBTEVlL0RYVFVJSVJUYmh6U2pGeE5Q?=
 =?utf-8?B?Y1dscFVFMFg1OWpKQ0ZlNEM2RWN4cFNxOTROME1lSmtEczRVSEVaOFVZb3M3?=
 =?utf-8?B?Q1Q1VzVwaWtiMzZUVHowM2phZWF2YnlJTVNsZUh2azVPM0dPbmtMSU1SNEJN?=
 =?utf-8?B?WHladzM5YjJxZjNqUmdCYktkU1lkQ3JLK0pTMTlnM0Y5aC8zOGxmaUxFM2Mv?=
 =?utf-8?B?eEdLdUduVGtQa25hWjNGRlNWQTdLTElTU2FOd1h0VndZOHhmcHRJeW44MVJH?=
 =?utf-8?B?NndvckUrRllLTU41cm95UyszcEQ5amdmSThxUDNNdXJYK1VHMWExSU9hbURT?=
 =?utf-8?B?SlRMeml1SWV1L2xNUVlyZEQ3TUo2MUdZaEpIWU5lUE02Mkg5QVFkT2JMeUdE?=
 =?utf-8?B?MElmajZrWFU3RUtPbGxxZytOalR2NWgzZmQ2V0MyQVFMTHptWTY2cHNxNklz?=
 =?utf-8?B?aHFQaDVVb01XRktoWDRqbm1hRDRMeXBlNTR5aGg2UmVRdTNIRU9ROWpHdXIz?=
 =?utf-8?B?cm5OWm1Td2JOR3Rsd0tyay9kdi9LTHI5bEdqRENCTklUMWZueGlzMk1rOU9x?=
 =?utf-8?B?MCtzdXF6OUNZSkVtdXZPVXZFamZjaHBUSWNjeDlPeWFRTFQzaXJIVHF5WmlE?=
 =?utf-8?B?bGtFTlYrY2k0WjJyQk16V01ROWFDRHdzSkc5angySTU4eFJja3lzbndGTFI2?=
 =?utf-8?B?cStJd3owU2NFMlV3WVR0dDIvRHltMnhRY3N2SUdRcGxRZUVxeXNkeGw1UnZY?=
 =?utf-8?B?RzcrUWZoMXJNSEhJWG1maTN4bUN4TGRJODFEd09JMmdIc2dNYjFvRzRYK2lY?=
 =?utf-8?B?ZGY3R1JmekQ4ODJEOFJBM3E4VHFwSnc4aGhyZy9CbUhIbW14SUlLSnUrZGl0?=
 =?utf-8?B?amJIVE9mNGlXT3BlL3B0Vk56eUxmRjJnbTc0K084K21CWHVCb3RtT3N6elgx?=
 =?utf-8?B?bGx2VFR1dU9qZXZnV1d1YnIwM0EzSG1XK3ZaTlZYWDZNT003ZHIvYm16RnRq?=
 =?utf-8?B?emd6UFBSNTFaUHhIb0doOS9lSVZYejJYazhLdjVSY081ODJpY0JjMktsSUtD?=
 =?utf-8?B?cU9XRmZTNk1hTXhua0VyVFM0YW9mNGVuZXZyckM5NW0xbDhRZFNGa0JwQ2F2?=
 =?utf-8?B?Y2FRQzNJd0djUVFmMWlOQnR1N1NzbkdMaU5mTW1NVWthZjFndFF6K3IydXFl?=
 =?utf-8?B?K2pLWXJEZ3VFNXBKMTNPTStGRnplT0t6cFFmMWpKUDFNN2I5OXpyWmVEOXRH?=
 =?utf-8?B?OEw5QTJMbk41bTRyN2RFSVJVTFJvRkZ0NkYxcndhSDdYc01qSVNBU1AvUVdm?=
 =?utf-8?B?TjcrSFV3U0RySE9LNTQ3OEJqV053RlZFQkZjeWZyZXZ6YmdzMHhHS2NTK2dh?=
 =?utf-8?B?UFJieFRuS2ZCT1JqcHNFU2tudS9SV1lrRVZ4YVBsWlNWRDBuVFNhRU85Q2JB?=
 =?utf-8?B?aTBzdDRFMWZjZjhraGZQNXhxWkwxS3RkN00veHc4TUJYeXY3UDU4eG1oZlN4?=
 =?utf-8?B?Mm5NY09tRCtWcmxKNWYwdUZjR1FMdnM0OGNzSkFnaFFZY285MHVJUmcwejhW?=
 =?utf-8?B?cEEwMnhqbTk2cVlpcVpURDNlUHJOTWRYQXM4a3lXNk5HaDU1VWpZQXEvdGc2?=
 =?utf-8?B?V255MXpiWHNYM0NBVWM3YStvcXBwc1g2eG9vZVJsanQzak1ISGNvcDdSUjBU?=
 =?utf-8?B?a3NuYjFDVDVKbE01dVhPZVZjdnQyNUt6V2tqQ0hVcE1sdEUrZjlDZFR0Tkg5?=
 =?utf-8?B?eDdUZkV0KzhpdmxEOTM2QUNwakpqekJvWjJ6T1VnTTV2QnlVek9xRXdQRkVq?=
 =?utf-8?B?R1Y1c3NSTzlmeHR0MnE3cS95UnZRR0pQcERzWmsyYTdWSGVqVlJjSWdwQk41?=
 =?utf-8?B?WFkyS0pLYTd4MnA4L3BXK2VXT2NtZjNhdnFSWmd0ZDhxS3daL2gwd1FZZmV5?=
 =?utf-8?B?Q3c4RXhib2xrU1VWSGhPb0dudHZBSVVMNURwTGRtNXd0T093VWFSWkRmZ3F5?=
 =?utf-8?B?K1RobG1Ha3VrYlQyNVRZeHFGTlliRVp4Q2gxOEFNQ29BR0FQOU5XTFYvYm9E?=
 =?utf-8?B?cmhZQXlldXNqUWpCcjdYdkdOeittY0tjdDMweCtZRnA4d1pacVhNc0k5MXpK?=
 =?utf-8?Q?c9YX83fGqV1obi4YhI6YhMM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54e9ba7-bdb4-4ea6-67d8-08d9b64c5a95
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 11:02:10.5525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxH/kMQtB51LmX9BI50oDbj9xzKxX3tt0tMewEKxfXnolrPgoA5LqgV2Ld3W1xC4HoGi+r0Oel7SfNbo1WCkoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 28.06.2021 13:56, Jan Beulich wrote:
> While going through uses of get_gpfn_from_mfn(), I've noticed
> some anomalies here (but of course there are more left). Patch
> 2 is specifically RFC, for altering the public interface.
> 
> 1: adjustments to unmmap_broken_page()
> 2: change address space for incident reporting

Anyone?

Thanks, Jan


