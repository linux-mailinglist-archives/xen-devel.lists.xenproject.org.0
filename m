Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C2948D378
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 09:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257019.441391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7vKF-0003kQ-Iu; Thu, 13 Jan 2022 08:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257019.441391; Thu, 13 Jan 2022 08:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7vKF-0003hK-FJ; Thu, 13 Jan 2022 08:19:15 +0000
Received: by outflank-mailman (input) for mailman id 257019;
 Thu, 13 Jan 2022 08:19:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fwfT=R5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7vKE-0003hE-6E
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 08:19:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d280e95-7449-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 09:19:12 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-lwzITUt1Nd6A6WVF1Rkc4A-1; Thu, 13 Jan 2022 09:19:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 13 Jan
 2022 08:19:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 08:19:08 +0000
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
X-Inumbo-ID: 7d280e95-7449-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642061952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KScsDY4LwyagADaLvB1K2RfpptsFjmeM09CnVIYa2dk=;
	b=PnOQZc6EQT1ywILYxIpxahveX70CsC5iPPL17sxLynf3bU+6BftyPqiuGeHiSmVHG+WZDg
	bJPLb3LR4oEOSSHfHP+nfWrGIiHFnB8XJG8ohmi2vrSBSi+392HIkx34/PQ2i480BZUL67
	tcwyj2dyE9gZZ0ByEEyEj7ZYnE1BVeI=
X-MC-Unique: lwzITUt1Nd6A6WVF1Rkc4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnyDFMKe406UsuIyhNgHZEjQQr+0DmWMORBSI2zIiMPep6J86Zhus3E6OgGJW5Y59/n7qdMHPXBENcthPKRbvdml45zI5V4VhlmX24NYcXzEJ/2TCtVF+VvoxxpTPq2PDdR3i5tHhW85Mc/70tA6hdA/W2S20G9aEvkxb6vCqbcPEKvTSQsOrppCLgvDc8QseVe8YdvntCz9bvaQzzrlQCU78VRXuzaUnYQUl4BcxG4MzRZwPwYwxUz5B2MRD5BgVL0PPSWDu8OhEl13RFjhhFqYP+CHTMrhtOarVm5gSTHvB0Lc39tM83Yzgx9LNOc8OHPc8Ef/mPAVfWQJJWmYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KScsDY4LwyagADaLvB1K2RfpptsFjmeM09CnVIYa2dk=;
 b=lUYE3Kp98ku+k2G4555ErvGm4eY0vYOqXMMjRHZnPCKrE23MMmJoBMWolw3uT40Sv770nOs9PX5hyu0EdFcEq5D0YKNMXGDcNQuSKP0M6kR6tabm5ujJE+7JEqneh/raHKaFO1VL09cipYOqAzRvVutzjQIW+6rJYfesfncQT2Gc4wBxQ6ns+xwvBvD1N9sQ8ZigLcR0BK1eEwhvmsPlsbD44n/LnAr/dpzo+s9lH/dj9szpryb988Ey06HlDbO1nhi2uXVNcsrY2C2iQh98thO/EjSiH/vDA3OjV8aLXWN6IxqGBt+tB1vzHzHEaGmv8a3DrxIVQjfsTzUsR8kCCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ac4cdbe-a3bf-2be1-1e1b-789ac5de067f@suse.com>
Date: Thu, 13 Jan 2022 09:19:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220113005855.1180101-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0018.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c09830-95be-48a3-943b-08d9d66d5ec9
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6479657890518A009E1FFED6B3539@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tm79zw/so9aWZApBZqP0N78GdFnwTaj/qjLt4a9kDYL3tP5HePRGCSbyO1WxsoIlI0CaXfbR4KuJZr/unCi6GyMSu2CCFJcgD9mPoKDCvq8KD/JpKNxOV8kjXFqvE9OlJwl5uyjhV/ifQaUoIQHmT7SUzg1zFe+OsRUEve5njRTRklSiYdQMAUE8VklfvosA5kJY+lnihbZ74oDT83hkNZx2l4kvIllIcXgrVkdgdQ/CRlfKmh2Mi9eAaK7G4NbmTsghSpKGuvPWO831eDcHvlt1RIRQdmOgscW/yGUE8oqHFzLKQdycmz1eLr+L1Lb2KSE5ju6gAqenF2gqjlRHaU/hjZasmtQSDjNZwhQXQHdDxSxGCqOM/JKp+9uCh1NYH7MH2ogdPUnE7/YWzaeXHsEpLZf++65CZn8MDZ8oCtqHiXBdcj+9pmRzMk8czZAnKoi82y4gceXDsOmYdpuzjlK3RUPQAr/aZRCDEpS5+sF7HCwIz5IURO/YSxHXWrxzW/6NrxmKbRBlquW7fuSDXXJNaKosTLu54hetD0R8VLmwsiClHwd5SMMfT3PEAVNryqEKDg+GK81pJEfawYrcT+hRo2I2Tm6dTm03197Sp6cHcDMoXrM5RCbNfIpGMiji08OLq8QKIdm7tU3pOOxSqIwIuO02IxVJBBMf4RzGW2zqM+IHmV59N4d7367K+zgQrqVmsZ6Wv/eG0+19LDTVF7U0scd1xA1tS4ZTtw0drkHx9xxsSuz2cATka5MRUtMB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(38100700002)(31696002)(36756003)(8676002)(186003)(8936002)(31686004)(66476007)(6916009)(54906003)(5660300002)(6512007)(4744005)(26005)(53546011)(2616005)(6486002)(6666004)(66556008)(508600001)(66946007)(6506007)(316002)(4326008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWxmVjgvTEkxWnFSa3FIMFNyMUdmS25DNGdyb3UxdnkreHk4Z3JkbW5URG96?=
 =?utf-8?B?MWpLMVc3Zjg1eGUrRFltU08xOWgrQUxVZE5ySHgvTm1IQXAzTVN0dGcvT3RI?=
 =?utf-8?B?REN2UVQ3Q3huQzl3eXN1VkFOdEVDNXcxYjUvWnNENnFTc29xS3VwS3hLaW1m?=
 =?utf-8?B?ZE5TWFRHaDJ3QmtaUTNYWGZNM0ZtV2RpUkFLeVNoYm1wVGwrVEZ4UzMxTG9w?=
 =?utf-8?B?YVNPK2I4STE3NnRkZ0xld04rblQ4NDNiTXVuZjFZNmUrZzFpandCSVg5UElW?=
 =?utf-8?B?ZFg5S3hkR1g4QWF5OHV1OUVzQ1BQY2ZONHY4YnhRVE8xZ0FJanRWY2dETTBy?=
 =?utf-8?B?b3ZxeXhIL3dNV3hEQjFBaVY2cmprTXN3MUJVUEgrVWlROXlFakloRjNoNCtQ?=
 =?utf-8?B?UEtiUFYxWEVsQjBBQ2xhWUtRZXRoc0pGZ2pqMDFxbHFYV21aY0VTM0w5ZVFS?=
 =?utf-8?B?eHREVlAwYWE0NGNHS2c2WjVGNmU0T25nVDdBS0dTT2ZTOFowYzZqSkx1eGpn?=
 =?utf-8?B?V0x6K3UwWUlxeTdTL3RIRGJRT210bkdTcm5yN1J1RVVVNWZ2aG5mV3BlSkY4?=
 =?utf-8?B?OGhKaTlSaXY3MDBVY0pHRjZqZUlHTzFRYWFJRm1ub0ZsYnZTUCtraVVpTGhz?=
 =?utf-8?B?dEdTam9FWHlCU0RxSTRDZHU3OWtLcFZVamlWOG15eEJxNkV2YVpCMXpnWEJw?=
 =?utf-8?B?NkpPNFZaaUpIZ0thMGpDZ0xEU0tlc3k3bXM3SWQrZkJhM2hMWUt3MlZMdk1V?=
 =?utf-8?B?VUZDZDBHYm5lUDV4WlFNR0l4Qm5DMjkyMHp1NVc1RVkzOFZzeDNJWFdwNGVV?=
 =?utf-8?B?MU53UkZ1a3BsbnVHWUc2YUhIV0VTWCthMmpwYjAxeFMxQnBoaUgwT0xYTG9l?=
 =?utf-8?B?bTB3NGptYm5pRnVnNUZOQlhpekJMR0lhSzVJYXJoem1kcGljWS9JcFdGbVZi?=
 =?utf-8?B?dXVuYUJnVDhsYkhhZHlmZENPQzBad29CeTVtOHh6NC8ybVpWaTBobWduU3l4?=
 =?utf-8?B?b3FzSllPemJsc28zVzl3VWFZMkhwakVLVXhtSkFoL3RCRytzUkJUa29CQjhw?=
 =?utf-8?B?dmxZR1JzMTNUK0RhNVlDQmhrdlZuZ2hrbUIzRWlUQlQzRGl2cEZqc3pwcUly?=
 =?utf-8?B?SWlkRTUyRDFweisvV1BXQmlGTVVLSlhjSXdxOGo4SkpUQXByR1cxREp3Q1Q1?=
 =?utf-8?B?bktjckthSzh0R1FDWEpDVnRLd202TFpCc1dhbEpXMnZNclhWdkVkd0VxMXVI?=
 =?utf-8?B?R0NMdjZDOXp2alBIK0dkZzNOendaQlZ5eFNmK3ZadUQwVVhWY2xzalRlRmM5?=
 =?utf-8?B?RjNXY05rQUFFUytGUWhpdmFwUFZvNkVQRmZLejdLejJLZkJ4aU1jT3F1M0x1?=
 =?utf-8?B?elNTNmF6bE94MHJFM1dmNWkvZmpmbHdRNWlHMXNSN3BXMUpqZDh0UjByZm1w?=
 =?utf-8?B?SktlYVVYVEtQSjBka2ovcFp3ZURzNmRlN0lwZ0tXMVd1eGRxT1NYVWRuMVJo?=
 =?utf-8?B?MFV1VWZQZlFvMXBKbUJlR2hTNnBHY2ZPTFJZalBhbXBlZ3BFRXFwRnVpTkRy?=
 =?utf-8?B?RDJoQ3dmRHF2ZlRyeEY1UldGS1VtUVhWc2NGZ3VvQ201dm9QZHY5Y084LzVD?=
 =?utf-8?B?Z2tiRzZ1eXlyV3FBMWlXSjBXR1NqMVI1ZFA4RjhpNFd4ZFk1Z2N6ZlFTcG5v?=
 =?utf-8?B?UENQbUdPV1ltYk0wMzhxaE5icXRMaFZBYzJLQ3lWTldmSXl4bmVPcmo2TjE0?=
 =?utf-8?B?bWxjTUExQ1hZVUU1ZXM4MDlpdG9SMm9jTzVwc1NlbmxwbmwxbUc5Vmw3T0lk?=
 =?utf-8?B?TkIwQUNXR3NaYnkvRHBBTVRULytMZzVNajlQaTNqNUpjYU1LNzV4RjZKMndk?=
 =?utf-8?B?SXBoa1N2TFJZdWw3RmpLcGs4bDdabG8wTkUzUVUwNjdsY001WjhzWWJhcGZy?=
 =?utf-8?B?dE5ITStTRHB1cDRIc0hGRzdQcXQwNHBxb0VackVmOVJzVGd1RmRzekh1VWFa?=
 =?utf-8?B?alcwZmwvNElKSnQ1QkRoTFRoeXE4TVRJay8zZlZaS2tNVGo3TDBwU2JYZFNj?=
 =?utf-8?B?TllGU0dOUUphYkQxMnlmRE9uT3NYc0RmU05jUDJJcWtvczJ0bFlkNG1NVUpU?=
 =?utf-8?B?aCtrTDBWazg2NndWNVVSNnlaQVhvYis5dHRYN0RFU0E1SEYxMGhRN0FMRlA5?=
 =?utf-8?Q?TXyLUlTjImbIoC8crD8puQI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c09830-95be-48a3-943b-08d9d66d5ec9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 08:19:08.1103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPY/eMPnVfpqUL4FB8J0Tg6hkWnDG4JjIql8qqJ70VVTsVRFZBfmMfugXAsTlENUzka99sVm03FHq9e/Qf/9mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 13.01.2022 01:58, Stefano Stabellini wrote:
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -232,7 +232,7 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
>      return 0;
>  }
>  
> -static int get_free_port(struct domain *d)
> +int get_free_port(struct domain *d)

The name of the function isn't really suitable for being non-static.
Can't we fold its functionality back into evtchn_allocate_port() (or
the other way around, depending on the perspective you want to take)
in case the caller passes in port 0? (Btw., it is imo wrong for the
loop over ports to start at 0, when it is part of the ABI that port
0 is always invalid. evtchn_init() also better wouldn't depend on it
being the only party to successfully invoke the function getting back
port 0.)

Jan


