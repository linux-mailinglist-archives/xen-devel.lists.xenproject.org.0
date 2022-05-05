Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467251C267
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 16:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322172.543398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmcOB-00053r-5O; Thu, 05 May 2022 14:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322172.543398; Thu, 05 May 2022 14:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmcOB-00050P-2C; Thu, 05 May 2022 14:23:31 +0000
Received: by outflank-mailman (input) for mailman id 322172;
 Thu, 05 May 2022 14:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmcO9-0004zk-T8
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 14:23:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eedeceaf-cc7e-11ec-a406-831a346695d4;
 Thu, 05 May 2022 16:23:29 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-xbZDc1CjOUKtZ0eXXb4K2w-1; Thu, 05 May 2022 16:23:27 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4359.eurprd04.prod.outlook.com (2603:10a6:209:3f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Thu, 5 May
 2022 14:23:25 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 14:23:25 +0000
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
X-Inumbo-ID: eedeceaf-cc7e-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651760608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWuj8Kbs9RpkWZUyqB+n3G9WZ1g1mL6RXD6kY1HC/sw=;
	b=I/pUT6WCSoEcMTaDvBh4E/Xc/87EzGAdgcfEhvdX05wSIeREH3vcOX1Zrty93y9Fq9d9FY
	mSU3IvnUaLRcbSdqvDL5dRpRYJUiP39AWZgVFNgxH8IaxURpOMiHfyS1use9+DQh/8RvM8
	YEgemZXb272PM6bwhAoTsACxd/fMu78=
X-MC-Unique: xbZDc1CjOUKtZ0eXXb4K2w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjV7hF0hYGaTLZJhQ7pDh4z4n9d26UKOUUtu16KoV89VvOCrPuXXf3h4ENUb3EsMbhRGNtezpxwMGE9i2xopAlRZEuKA2JvPBVeRTe8t80vShz/bvKSZUuPGmUPnxaxz41henNjrGYqRNZE7O9u2Ze7BQaCsbRVaVyj2rTdpXqB+pBvm3jdf1MFrNEM4lde1M6DjgMLLqtbi+vIQJgvM2w71HEvvxF5eCagMCepyJ5/ThG6MZKWXXfj62iyfa5tiM/qmpds3cFVyep5vPAWlo/fJKySyONkq2OpwdSkbeaY82sU8RtjsWc26BVJiQP+eSC1Qo7SnCqpWsyHn60GAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWuj8Kbs9RpkWZUyqB+n3G9WZ1g1mL6RXD6kY1HC/sw=;
 b=ZviE3uj1uYL00E9IaJkY0AOcUI5eQ1eoBcMa1oE/TW7Ekbgq2OpNQPPOrBQcP5iGYOkLdzFnJKw0kK0wmHnr8BOg+NoC9zCtdaeG2A7CmOI5YLx6Iz50rtAEBqHK9e3VoVq4ulZ7qiaSedYzlmdxH34e4cKAcaDxY/p89mokYVYBkgXrdJzDaqTuqL4oz09taLDxWI/cJ0ie0qXXdnRVlA10ogs8Z36sCv38h8s4xl5v7Hc176jwTfjoohsCig2d9Pgghz7OK5rlv3nN2gvM8SLifst4oWGPQWpjd3GAmcnNmq09ROQqg2htEhES881r9WICBmfLFPZMGBFmRNO0pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <306532fc-939d-efdf-047c-7b8556d40738@suse.com>
Date: Thu, 5 May 2022 16:23:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 6/6] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-7-Penny.Zheng@arm.com>
 <f75f174e-9a66-d2c4-53a5-22a50d0cf132@suse.com>
 <DU2PR08MB7325B823DD043304B3F7F1FDF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <a8fb813c-e976-0841-7c3e-96f4990a81d2@suse.com>
 <DU2PR08MB732598D2BB0FC1C1965DEF8CF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <03430522-16cb-5ad3-272a-ca0cee79c7e3@suse.com>
 <DU2PR08MB732544E17B308416A77C97E0F7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <6ee0b5b6-e099-c17f-48df-58ba1deb4066@suse.com>
 <DU2PR08MB7325CBB8EFD65D2BB64E92EBF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325CBB8EFD65D2BB64E92EBF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0098.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::13) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32eacfc0-13fe-412d-9dcd-08da2ea2d0fc
X-MS-TrafficTypeDiagnostic: AM6PR04MB4359:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB43592AC5B0F84B3EFEDF9718B3C29@AM6PR04MB4359.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+UYw6LCSRGli3yam44ROtYuFW37lqUfrMucqdg0IurRwP/fJ/fTErPl6Kw4SRamG5Q+GfQm1PL7bf8hR8Kn3hwVrDKsaYcBoZKGkZNtAc6wERJEgnlvqpJTtMESWOEhIGDi2qdUIG5oRn693/obDAigONEPdzdDXkFoAuwZcrjLo6JSgzk1S5GqESk3hMhiiEnyLFejtkzMX0iZUBcgzHcRyvhxkl370GYZXEZOi0ck1atryE0q1j/0m2PqQHQoXa4usYifDVwqEGzsIqcTBXnGipfLEwGW2Zle1rrKsSyZnm3qI9oJg/lJsbe5E2W4BRuxQmnsjUZHkp4oVR6frKXuhxh72CytmWZQVF04ePZ8DAEU+exJ4ozSX1uq8lWFOEMrKduB8KYXr0OSIE3bgd8S8ULLMbItXtjEiAPcWhIal1J5G4McSa5eWCBnzA7nUvlWCeij6oVX7TEvaTEInRgtxpEyCAf/PbvK3WrhU+J9SNBlsrcK+SQttbzVTwL6QahgKaluy+eOcPx5wTUaCH6QRufUy1mTlW1bNZo0R2Z7Us3C8KuU9ybDE8iG0xg1ySXtCk88ENogvp7zIe1f2xCvviqcfYPTnc971NRPoSwGUHS5PS+4gUxWBVoEV1qyJrS6vUBcS37OBtsf4CLDcqiOAGBLHVNIU/Cs8u1jqXtUsxg72LZArgAuc6QVA+U6jV1+bBFGsQ1Qj2rX70ZqoaYvMVV7qcdIQ9CrPx8ZSoLHSiKSf95/IJ/xcQ072bOmLdYHV+t4hyUawCBNAQuJuCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6512007)(186003)(6486002)(2616005)(26005)(86362001)(31696002)(36756003)(31686004)(54906003)(6916009)(5660300002)(66476007)(4744005)(66946007)(66556008)(8676002)(316002)(38100700002)(2906002)(53546011)(6506007)(8936002)(4326008)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmJ6V0VpV1hkL0doMU5MbGZUbVNpazkxZnFaVWdqVjVwM1cvdmFRZFlSd3V1?=
 =?utf-8?B?ZUhwa1BFbDVLUWV5ZjFBd21iS3FibTNUK0owbWt1RDVoTHVQVE5MVHdGMkFL?=
 =?utf-8?B?TFBRbUx4ekdkWDYyUXVvMHRUazdXUWo1WW1UUGFpczUzeDVtWDAxcmlDUEN0?=
 =?utf-8?B?QXRGZkN1aHVqbGpidGVWN1RVdnFPUE9xU0hyM0VUVldHaXpsNTdsMzJ4bDkw?=
 =?utf-8?B?K21tWG53M3hHZE9ZZmpudGlVdU9CTDlTbm43OUVwZlNRQ05FUjJyb0kyTFJu?=
 =?utf-8?B?T3IzK3FFTWhrYWljcWNML1lOZkJocHpBb1VLanhObDdXdit2TmNSVU9TeDdI?=
 =?utf-8?B?YWlaTEI0ZnlHQ1V4QjdLaHJJS2t4ZTdId1RmQnViVGo2YXQwTXdLTGhqa0Zm?=
 =?utf-8?B?Wk13R2hqT1A5TVhUeEM2djlHcTBkOWFvNnl2N25TSHkrL0hBbTA3MXM2Mmtl?=
 =?utf-8?B?czN1TkdMZ01NeDlTYTJTdVZ0TlZ5djVGNGtyeTNrRlAzb2xqbmNzUzVRNXZF?=
 =?utf-8?B?dy9JRU5pajNLQ3MyVHVmSHpqdk5lcFJXaFFZb01zVVhqeTNQVmlhenhVSFlm?=
 =?utf-8?B?Mnc1SDNlWU1Gdlh2M0I5aTQybHk0NzNZOFYwM0N5SDVnNzd1NGNQSDJWZDFm?=
 =?utf-8?B?ZTZnNWVueW9RTC9aOFphc3pCRU1KOVpkY1BsTTdOcE1GSlp4azBSbFlrVHI2?=
 =?utf-8?B?ZCtVc0U0RjFJUTQvMjZQWThkODNqZm1Fdlo1ZUkxYzRkbmZkcDhQOFlyS0cr?=
 =?utf-8?B?cm5iYlhtamdtVXpHNlV1N3JNekZEcjJWOWFUY3pTSXZJQkdRSE1ROEU5Mkdk?=
 =?utf-8?B?S0wyM0NvMnZpaFhaU0xxWXBhZTE3WmNRNXI2ZWhYSFNQazRKUDYwcm9WUGlK?=
 =?utf-8?B?THltVTNOU051K1RTL0JDaG9URTc1TGkrbll0cTdlci9UZldPSlFJZjEwV2dY?=
 =?utf-8?B?dllvR0dPQ3Rxam5jNTFGNC9EZ2VFWERSaWg4Z0Q4aDZUV05YZWp0aWtyMUM0?=
 =?utf-8?B?OXhYOEFGc0ZoN1loMHFYeE9jOC94cTVKT1dGaWl6MS9PR3pGRXdadThuTlNN?=
 =?utf-8?B?a3AvR2FyVUsvMFczYlZSeTA5TXlJWW8xVjJ1enRHbFVSK1dVS0R0akJuZDVz?=
 =?utf-8?B?QnRHNGc3RFM2OXNLTGRzTzVsMWtjNEpJS2ZQZ2R6Rm5KMUVCQU55ZnZQbjZn?=
 =?utf-8?B?NzA0TGl5NlA4QkgycU0yd25zdHdMaFRXOWVQakdQazNSMTBUUXhWMnR2WGZl?=
 =?utf-8?B?c0hRVUxvSWMzRGVacFpXN0oyUXVoZWIwZHNhSW5zVWJ1Tmp5aFVyN0pYd3Ba?=
 =?utf-8?B?d1NmYm1LdjI3WVVHNDQybW1ybFhTM1FSMTZaV25tcnRtWTl3VDhHd2RYcVI3?=
 =?utf-8?B?SithZVEvSVlIWGFTWTN6LzlENjBrQ1BVVHFrZWpXVEJic2NzVmx5UVRDRzNn?=
 =?utf-8?B?M0J2U2NXdkRFNzBqQ21ncHRqNkhoM0xNaEtWNkQveGtvL2pMekE5MUtTVzFL?=
 =?utf-8?B?NXpib3lMMkdWdkUwazhZbEM2S2NUQVR0bEtQazJWQjc4aWtXUU0wdGhDMDIv?=
 =?utf-8?B?c0pVVzRHL1dNUWdhLzF6TE13blhWZWxFT1FLZEZxbTZIbVZZMzZkK0ZzaHZC?=
 =?utf-8?B?L0Y3bjFsT1FUSDVJZkUydEdjditwTnJtUzNzRTl2SThyVHgySCtwTkNKYVRo?=
 =?utf-8?B?QTFaVXMwVEVoTU0zUTNSRCtIdEM1RXNJRkxBYXJUbFNuUnFzc2xxMHBqNXI1?=
 =?utf-8?B?TU5OeFdDMXZHTTdsNFphTjFXdGNSK2dkbTgyZ3NaTzRBZUd5cEhybnZSODJs?=
 =?utf-8?B?V215N2RWZHBPcWpLVWoxODllamVRRFc5VEZyelhMNXdxZEtmODBISUxCQnpt?=
 =?utf-8?B?VzlUVkVlTFdRb1MyZWI1UVYrekpUM1h0Q1NHRmFHaC9QSnpzdm5TTENRK1Uz?=
 =?utf-8?B?VG4rL1kxUWZHc204SUVSRGE0UHl0YWFRcDB0RGZuWXR1QVVFYTFuOWRPNnRp?=
 =?utf-8?B?UDU2S1NSWmpuNzlSUkdDZWlIdkpFRTBLbnJzam1xQ05vdFRMSlVkQURUUEY1?=
 =?utf-8?B?MXhybkx6czVUcXNXSnF6aHg1bE5BT3BIOUFMQmJmVUNQQ1JnMkc0NUcrdWd3?=
 =?utf-8?B?UHVNSFNlNUJLdGEwcjNiVVZQVy91ZkFGOWpjN3VnaHdPUHA5M1dRTS8rdGhK?=
 =?utf-8?B?Z3pQcVRITkZjUFkrcU1jaGdpVEZ5MHA4aDY1N2tyT0szMGg0SUtnSmNXZ0Nt?=
 =?utf-8?B?b2ZjRmQvR0NmMzVnSEZ2QkU5QXRjKytGcEFpMDhHRjIvUGYrS1RYYURlWTI4?=
 =?utf-8?B?WUxjb0lIZUxJRFZ6c2s4UTJodTVOeVUrUWljWmJqbTZBSjQ4TXgzQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32eacfc0-13fe-412d-9dcd-08da2ea2d0fc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 14:23:25.3704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXF5ykKVcbeVvTW/xRoISZ3fQrjNTKojbFLxf1hcYF6v6YSYoeqMJ+1qXpU6XY4lpa7Wy/gplzOzAty1JQDqtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4359

On 05.05.2022 15:44, Penny Zheng wrote:
> I misunderstand what you suggested here, I thought you were suggesting a way of stub function
> which could bring some optimization.
> The reason I introduced free_staticmem_pages and acquire_reserved_page here is that
> we now used them in common code, and if they are not defined(using stub) on !CONFIG_STATIC_MEMORY,
> we will have " hidden symbol `xxx' isn't defined " compilation error.

This is what I've asked for clarification about: If such errors surface,
I'd like to understand why the respective call sites aren't DCE-ed by
the compiler.

Jan


