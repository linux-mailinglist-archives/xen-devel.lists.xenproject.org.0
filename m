Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276114293D8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 17:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206278.361811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxcp-000764-5S; Mon, 11 Oct 2021 15:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206278.361811; Mon, 11 Oct 2021 15:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxcp-000747-0z; Mon, 11 Oct 2021 15:54:03 +0000
Received: by outflank-mailman (input) for mailman id 206278;
 Mon, 11 Oct 2021 15:54:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZxcn-00073w-7t
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 15:54:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72bf8b38-2aab-11ec-80e8-12813bfff9fa;
 Mon, 11 Oct 2021 15:54:00 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-V3M5VOYpNrKGKbglODC7ww-1;
 Mon, 11 Oct 2021 17:53:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 15:53:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:53:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0068.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.21 via Frontend Transport; Mon, 11 Oct 2021 15:53:55 +0000
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
X-Inumbo-ID: 72bf8b38-2aab-11ec-80e8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633967639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0JpXKNAMcxTaMcckcI86HQKTf6RhU4lxaGuECTbCZQ=;
	b=Pzhnl8nN1EdurYPKGE2tF4SRocxaxFb/rqmQsS+b76lub0Mn4oaiSSYJFNKu0dUSnV9AcW
	3khKZHWc3/FEhNDR3nzRr8G0ACLNI9PlOQARvd5ecupRei0BRzwTOEsEU/uI54OE8fyjEK
	+0hul4V0V+UE47cx/gDbpviVD/+Besc=
X-MC-Unique: V3M5VOYpNrKGKbglODC7ww-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kv0LekyZOTFGcMo6n9g+2a7VrogwB2t9xa2u9NFpyHuAGN3cR9ZPsvEsHOdVjxOZ9zwhNaBIxRMujER73AnSdr/jx7JC4KNVcJKLuBXQhJChEtFsr29xukBDnxZXTHjj9/LfZiS3tTLX5vcOnG1iaY3WTJXn3j+2aVRz/QCJTTPubcwYM7VVgHcbnv/GIMs4ryTVDwHssnmA6XoLhj9KVcaJNdgf5FUYgf+bZmirLr51KUhKkurWesAs85gzGS9MfqfjohfCiuBFBfGWQnYQ0lFGJ1RVRkjP8xNzd3szEFT2LqUk00WU2GNsZy1Ahf6M9hMUXndvLvHAkgl47AzMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0JpXKNAMcxTaMcckcI86HQKTf6RhU4lxaGuECTbCZQ=;
 b=WVlvlfgcyMZufAcBN/jm1fcMdKw+Lc81lgKZBZcFoRXIskII2LOwWYFsxHVFufB/9TIh6g5Pkk2JH6Rayj4tou9aHF2ZbxybibRcKH0DMWapu8Ytn7qRlzpB58tDepTNTXcWKRzz4ppE8pWhan0cHIAIeIHYmK6mfpaqV1xrxEnhf3qhFnCbv/gvjCBj3rQpQpXWOTn0w0Mp3IKJ7akf4APpz9fqLG00mhcPB4sB6Q61/6Ym0iDKXAztp8/ysndZy2SQeVF6FmyJ1Qlzm3pIQF/KKFXa1mCf+ycNd2FuprSOR0ZPmxROj+ZKKoz8s3vkyx5tg6UjwteZe37SbtfVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 37/51] build: clean-up "clean" rules of duplication
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-38-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <312a8a31-196f-a6a3-a337-37594fd6cc65@suse.com>
Date: Mon, 11 Oct 2021 17:53:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-38-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0068.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf02d854-f760-4569-25db-08d98ccf54d6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606643B55099236C4F4F910B3B59@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BoPcR2gHRm5jfRBoluxeCQLsQLCiiGIuZmfZtwfNCBx6RtSCX7zWMbiM5MrMlc6NDcWd6L5XcrrfE07kWzk/rQ5DRdwo5AVZuHFeWB4W64za5BBWl3CT+TtBY2S4QHXn/soTR4tBdNRLuSx3CfSh0DTuKO6ZGWNcEZuZwD83UhV/A1DhR01vMn2EKXWCFam9EmTIAevZd9CUpkYNdlI/xXyk2s3KLtynN+Oc7BFHQlEvL/zDsWmzlLS7oE4WbulnOjAZiffbtHTG8DlyTSAG5iOj0jwL85Bk0zLy/2gFxjzH70THceoA2aE2b5EUXFfwVwByteOcWT/G5pGAUwSOQFRYGSH0OTkdhv8H9thy+F3mHYIQzv5pjsVrC3Q99PxzOAViA5CzJNEplAdgfwRF5ieL3SDI+pKNavmKQNVcDErw+WVbZtHDLuVD74Ts7+fjzdKx7wWCRrl1KUXpXrO9/E/x7CqOYVLK0OB2c4aLaBqZrCYWCXgzkVbtqw5i3wBLO6EXIX2WR1/H3EDd+G0Tz9rwJnrvbpn0nv81uL8pLgBeHmTfT0xcKOldqnLbhCFie9p7QiHQKWC/RzBDbENNRGcZ3ksxLQlHjwxKU2Hlmagp7hwvK9jgbwq3MHDRIUIULJ4CvakyPhF4Ij3JTX5smUcCXxMWCZKHuoKb5v5KCH9QkSIYeeKe9WGlSJD8cBmYCjCAv3UigGTMfXSYouLx6CQpghjEJ0+oSlaHzDtOMxU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(558084003)(31696002)(86362001)(186003)(53546011)(4326008)(36756003)(316002)(16576012)(8936002)(5660300002)(508600001)(26005)(956004)(2616005)(6916009)(54906003)(31686004)(66556008)(66476007)(38100700002)(8676002)(66946007)(2906002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnBHQkkxbUFiYXJMamZzSzBMNkRoYjdiRjJmQUNrZGNtWHFNU1UvSEtvK002?=
 =?utf-8?B?U00vMnc3M2RYc1IyOFBXbzNXbkRNVSswYU9DZnU1MUlLNEZKZXNHZVdxaW10?=
 =?utf-8?B?aFJpcjRlNU1wQVZzUTJhTVUyTzc2ZVdvbWJaaWsyRGFjR1BNczA1TzRCb2Ev?=
 =?utf-8?B?UFZQMFFCbHRMNWQvOFl5Z09XbXhrNnRodTV6YTE0bmd5VHVmTHBXSWVqRlFZ?=
 =?utf-8?B?ak0yR042M2JkM1NSd1ZHYWl3UXN1K251b1g0WDVKdzN0c3Q5V2VHRldKZ2dR?=
 =?utf-8?B?MklKSzhteUtmTW00ZzdONXpMUGRubGhHbkdEajg4OCs1RjhHeWNvcStqMC8v?=
 =?utf-8?B?a0ExYnl3Z01GYW52bEhlL2ZJZ295a1ZITzJqQ0NIR2tnY0s3YVRxalU3MFA0?=
 =?utf-8?B?bjFLWENwMVczekN1ZmNrTGJNZHIrUnNzZW1tTVJxQUJiMElFMUQ0OGJHZDhs?=
 =?utf-8?B?eDh6dDR5c0h6M3NsS3NPZGNQV0RrUktCNVRPV3BLMnRCY2N6dGIyZHM0dGVR?=
 =?utf-8?B?WWE5NG9vS2RWU1c2R053QUwyU0wzSTQ5VVFvcEp4cUlZNkhIQm5KTVFNQmFo?=
 =?utf-8?B?WHNBV1ZHTW40Tm5UVGNGRVBONmhaMDlIbHMxZlhlT01UaHR2SnZBb0ptdm91?=
 =?utf-8?B?MVNzQ3JTS1hKci9jbHQ5Zlc2NUJaclR5RXNteHFQYWtDYXMwVXRzN2VOYjhJ?=
 =?utf-8?B?bDhValJDbjVPOEtPUm1SRjdCWW5XLzByT09wdlZvODVLZTBGbGlFM2YwWldn?=
 =?utf-8?B?QVNwWEhjQUhqYitzcHNUMTc1bWJ2T3BxM2VGM2FvaDMzdUFvSWxHZEh1eDBG?=
 =?utf-8?B?QWErTVVBYmRLclNWcE9udEZaNStYa0svOEg0K1BqSERHVUNZL20xeUNPMXRX?=
 =?utf-8?B?RlkrUXhYRDcrS3E4d1pxbVBoVGF5L0lSRVZjWUN1ZSs3M0pnMis1b1UxL1Ja?=
 =?utf-8?B?T0tyRC9pTGpzKzhFK0ZmL3B4c1gxWmVDeVZrdURaeUJSYWNaWVRiNkttMG84?=
 =?utf-8?B?b1FPT3VldFliWVBuMWJEeDI0VCtnelRzNDBzL3dzQ1B3MlNscTRsZWxESmxB?=
 =?utf-8?B?cXdEV01JVUcydTh0Z3crVzZ4MjBJc2MyMlV0SHFOay9HUG9KZkw1ZCs1bWtZ?=
 =?utf-8?B?NHpxbzlrcmdhdms4MmNsbmgyTVZEZzN0RFF6Wm9NRFNDWkdqeHQwd2FucFJS?=
 =?utf-8?B?SmkxSEdvTHdLekxXMmpZejJhUXpzNXVLL3hudWErV29XdDZEUlVJbC9pekh6?=
 =?utf-8?B?UVRGUENEQSs0U3lBOXpQaWNQV0FkczRxamdqSDBXUE1reWZlejhWQW1kK2Jm?=
 =?utf-8?B?NEREcmI1WkNRYmlPVUVnVVJBT1FYZmViY3RtbXBha0hnZ1R4YU13MHFuWWZG?=
 =?utf-8?B?U2dIWWIzMm9KSzNONWhlcXZXelVCN2xQb0hrZy93ZTJzbTB2cmpmc0Y0NTA3?=
 =?utf-8?B?MWk5cENZYTZ0WkVlUTlWWTJWdDZaYnA1amwvWFphcnp4Q0VSNXhQMnFrUFJi?=
 =?utf-8?B?eWdlZFdpeVpHWjhaRGpLL1FlZ0dmRWx6Z3ZRYjJRdlZoZ3NtaUlaOEJnWlhl?=
 =?utf-8?B?NmYrVnNvKzZtTzdnaXZpTmJxell4RTVmdC81bDlXNDJHZmVRb0hYS0V4THA4?=
 =?utf-8?B?QWZxMzJtblFveGpvV1R3RTJhWGpNemtJK21iaXlBRXlHekFJUS9TQ3h5SVUz?=
 =?utf-8?B?WHFOZ3lLZU9KOHppOHpvclJHRkdyS1pyd09sL2tsQnArY2FGaWw0VGFHb2FT?=
 =?utf-8?Q?KofLirj6UCxrOAjUOwi6Cqiqpayqq8yIsLv9KN8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf02d854-f760-4569-25db-08d98ccf54d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:53:56.0084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Efas8nz/I0Cn1o3mbluf7S8KtF5uglpD4XlUg+7WMsgylkG/GxaSuk4fJQbAGKzekmT1HUqUr3pIH32wQDHDAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 24.08.2021 12:50, Anthony PERARD wrote:
> All those files to be removed are already done in the main Makefile,
> either by the "find" command or directly (for $(TARGET).efi).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


