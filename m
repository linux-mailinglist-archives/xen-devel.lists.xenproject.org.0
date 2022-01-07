Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460F948782E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 14:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254451.436283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5pDW-0001pi-10; Fri, 07 Jan 2022 13:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254451.436283; Fri, 07 Jan 2022 13:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5pDV-0001nY-UG; Fri, 07 Jan 2022 13:23:37 +0000
Received: by outflank-mailman (input) for mailman id 254451;
 Fri, 07 Jan 2022 13:23:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Ee=RX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n5pDU-0001nS-4l
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 13:23:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03bd35e3-6fbd-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 14:23:34 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-8vW29QKuM8u2B6MI-FE9Yg-1; Fri, 07 Jan 2022 14:23:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 13:23:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.017; Fri, 7 Jan 2022
 13:23:32 +0000
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
X-Inumbo-ID: 03bd35e3-6fbd-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641561814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fe+K2huaZqxFN9B3DC+LKdeDIJEAzSAn/eqgIgVBUeg=;
	b=BDIZ3YfQWl+VaWFGDefYjc2N6rWpbdahJS7nog/RIdjEawpZDQcl39Ir0CXtOxYoB5L7HH
	a/fNG9f/PNHZxqSpCs4Dp/hKYLLzEcHy0HlApSQx9yr2UW+spibVesfo5qQO2WMoBnYUVK
	UhZBImeILYbe2qMQXX3udT7cTnC82YU=
X-MC-Unique: 8vW29QKuM8u2B6MI-FE9Yg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqSJrkJTVApNVN4hgMGpAYfoEHYbNC1dxddXGxOARpuBJ4QIZfNybyTHq7KhNtXDjmy77H273w2V5sB42SqPUkZaSP/9d94USEXakmA4cRFFG7b1W3cTeYrszoz+geCazf1ah1Q5TrhmSXV4karfCSv2oirEm7SfTIwcrDZQsqF94gta4yII+TnpUcPcHeUU+LkhyzaVpH+KDR/FDl5+SHdgafkZF+DRMf2GM0ufNg+5bEpJO0CWYJxx/toVDN0LX2Yud2hJCbAhUu/uU4gcoZbDrVQlVT3uRvs7x36rbeqt9wTk5aWDcWwPhdZd0ZRnsg6HMOnvS+D1IITuYkXUWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe+K2huaZqxFN9B3DC+LKdeDIJEAzSAn/eqgIgVBUeg=;
 b=IyMK+XplUHMOwH1/rS5HztU4dIv3IZU/ACGuTV1lhrJ4HbcEL66qhxx/1OhZQAocnT3S92aK24cLABSC8M3lj4YaOKJ9vq0VKGKc+K/GgeQi7YeSugUTYqsJ7RVNbsWo73yYX2YJjHHAlWTFcrZtiQ6Qg+LPLZuOHW0DB3tep9n7fL+5RjibHfnoIJ5pYtnY9ycdInCITQtwUlz+p5d3SgCl69srkLbvVuIUwaZcuPGQnTKWlK4USd1B72sAqnQZb3OiB0RE0TZenyChlDloomwkXnSeD3lLfMTimy9taNQrMoMXV+WNWp5i6MyQBjIc1MfoMEjAUuhRZS3ihL1/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f97f4d7-0e94-5bdd-546e-574b8b3db5ac@suse.com>
Date: Fri, 7 Jan 2022 14:23:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCHv2] x86/hvm: add more callback/upcall info to 'I' debug key
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220107125523.212649-1-dvrabel@amazon.co.uk>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220107125523.212649-1-dvrabel@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0017.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b057305e-4ac2-4e9f-fd20-08d9d1e0e667
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260804633CBDD6EA16773CABB34D9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LfaAB9JGcZQrYyN3MoG1ldTFP19dmkYVbA8EhN0BzJvhR41zMD72QGwMv8GgF1CdS3uVwp3Poeq+uNcbK+5WzrdQDAL81IwQMwg5V0JJDWOEVGD1HWgOE2xdgCgV/aHHHwIh7FunA8XUrBg+EJd59GyHycfzKNQT8vBnEgT1pG7tAFzrbRz7UEKEf7arxjOxTAveiQKsDZ1iC1t90gAQXscsz/FUMhRI75Ha9YXS803U7CjSvN6aTXE7ll54XRwtDbSs03MVPd6CeW92lArEIN+Z3CMK+O5EWw1OQ4PN/C7uMhyUtoyALLRQMOZkqLge3iLx3ouFu3dN8QigTKh/vUSpfCnQ6ryCmuJbyCjva8gq7laW9KXD1+PFJ81DKVdVjqHgm0lO22BKWrUeOvLNK9xY6Oae/SElXhAV7Nln5h9eRRhWqkwzPkNCljRULiGc+VHgYLVxVnDBIldjvbq/JdWW9jtpdGFSiZJg96TQMvS7huXMmwtb0SNm7U6JSgTKBSqsa2H1Ur1AMjZuaO+R3HTemaS8sGlrz+9yuf84QdmXWNeIn4ogkhbKtA4/Pc53gRSrcbFtpopZa/zO1+ZgkI+4p6xnWsSk6c9tgoxpxgfKcEJxtWdyh1yQZFyPP2PAhwRznQrVmxxDRRfH4ffQG9hp3KzjoK7JBhapw4MX/uVBpkTyTPf/tmUDvOCeTNunIOB1k00Q+5QGCCaY5vgwIUN5xRCknGGIvc8DuXry5f8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(186003)(36756003)(26005)(53546011)(8936002)(6916009)(5660300002)(86362001)(6666004)(6506007)(2616005)(4326008)(31686004)(558084003)(2906002)(66946007)(6512007)(6486002)(66476007)(316002)(38100700002)(66556008)(31696002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVYxL0h4ZFRIR3BGZElQNDNFM25LbFZENlhJZzVZREJMRncwakYwNlkrZTlG?=
 =?utf-8?B?ZVVwL3FtQnBQTS8zTUZuK2M5MDhUbmZFWFFSTU9NSGROay9rWEV4MW9qVEI2?=
 =?utf-8?B?bTI4cno4cGxldlhiYjBlSzMvTEFBTS9jS3NsQ0dPcENxRGZwUkYxcEtLK0Rw?=
 =?utf-8?B?ZVpoT0gvMnQyUk1ydHBFdDJhK2NJbzhEdG1WTGtIVG1JSXMvL2V2RjZsVzZP?=
 =?utf-8?B?Z0ZNM1QvVmY0ZitmNitsYStHNGplb1NoUUdTVHU3ZE5sL25FNGl4NTdZUFhv?=
 =?utf-8?B?eXdJZnlpa2lYcjh4WnBFbEZHRyt6SzB3Nkx4WXBIVSswOUlOOWNuYWFyLzh4?=
 =?utf-8?B?RC9CdndCSnhpd1NCOXRyWkFWUXlzMzNnbTRFelMrb3ladUpyQWY3TlBCNk13?=
 =?utf-8?B?dFdYTnMwTTlaV1UvU1gwaDA5d2MrZEorNnE5NitnTEJzVlBQekhzb1RZMGhS?=
 =?utf-8?B?b3BVTUpuc2NkZnVqK3IxaXpqSWFmQlc4TkNXYU9TTVpJaXkvcEthZ05EcWo0?=
 =?utf-8?B?RVQrL3ZIVG5vcXllVkdZZ0I4WHQveEpUcHlYdGxwcVUyaVRtbStPWERLUWNs?=
 =?utf-8?B?MGZLdnJPYWo5ekgycmF5a08yV25nN1lsNjBBVVJJQ1UvWnd5RWRKTlBrMDR1?=
 =?utf-8?B?ZEV0Mjl6dkl5TmltLzM5ZzNlUjN0VlRtS1F5dFptVVJWY1poWFFqcmJVYWhS?=
 =?utf-8?B?YlUwWXQ2L0pqajdQTTVOVDRRQmYyT2o3cG1HWFN3QmVxaFdjN21NTWU2NnE2?=
 =?utf-8?B?Ty9sVU5LRTFmbDl4dmFUYUxjMUt2NUNBdnkwYmlUSkJBN2ZoUDVKanRHclRv?=
 =?utf-8?B?ajA2L0xsbmJobHJxWHozdVFCc3E1cThaK2d2RDNiOGFQbHQ0dExLMDVvck5l?=
 =?utf-8?B?TmFON1FJeGFzUWdiYW9pb0JQa01LUGZTeFI4RkJHQWYxeVgwUGtVb3IzSllz?=
 =?utf-8?B?cXhUK28xcW1YSS9XRXkyNjgvODZNSjM5bUdmTVovUENGN1Q4ZWQ4YWYzeDhr?=
 =?utf-8?B?bVBHTUhueit4aXYxWmlpSEd4MEM5TUVoemIxWDlBOGNwVEFPZFZNQWlyNHpL?=
 =?utf-8?B?bmdONWFubTFPWS96eTBVOE16NVI3c2FNRUF3WEdNNk5sVVA1dWZlY3dhZ3JP?=
 =?utf-8?B?N0JFQzhNTW4xWSt5dUVlcU1oZ1h6YzRlQ0JaVWtxRWdhVjNSaVFaUWpqM2Yr?=
 =?utf-8?B?VDBUdW9LYTNtYlpramZCWGltU1NYMGhBWUloU3BxWVA0ekFLQmNnb3dZU1Vu?=
 =?utf-8?B?a3NCWWpvcEFtZFI1c05nY2ZJMkVqOG5JZzV1K1ZBRWd5a3NIbEpFZkVDcDlC?=
 =?utf-8?B?OHhBL05IUzRsc04vRnBpQUovOHdRZUZKdW8rclEwQTlKR1dZNjJpL3Flbll6?=
 =?utf-8?B?T1hlMjBmenppZ05XMDlNaXhGdFJxTDB2MXljY2o5WWpHYXRES2VvMEhUbUxW?=
 =?utf-8?B?WmUzWmxjSDd4ZG1LL1VzL1JTTmh3U3YvMm1KZloxc1o3cDNVVTBrc2NGbGh6?=
 =?utf-8?B?Z1dVM0dQVGlZeXVWVjZDR0hKZGRTOGVQRTNHdTkremdlS3NTOEtQTEVqc3BF?=
 =?utf-8?B?RENRTGdHZURydEZQUXBHSWM2NDVjS1h5YnEvL2JpTVhZN0lNYjBBOHhRdnRO?=
 =?utf-8?B?R2t5UGZiZmpabmhsaE12Tk80RitFWGNnSUgvSzlneWczQWVZQ2I5dXFpNko3?=
 =?utf-8?B?NGk1QUwwUjBjQjRtTHVhVkhReDk1akJYNERHdHF1dVJLTTUxN2w1RklZQmdY?=
 =?utf-8?B?a1J2cE1RRjZzWWxlMDJieEozdnFzbVVVTk1XdXhzT0FWQ0ZGdGhnMzl2ZXls?=
 =?utf-8?B?MFZrR2NXQUUzaDdXa01FSVZFTmI4eWtMWDE0MXNxNVZuSmVTSmtNYUtjdE8r?=
 =?utf-8?B?Y0FhUCsrUSt6ak9qWTRvRCs0T0RVLzYwTEFMZzNMQ2Y1Z0JiRkFWT0hvTmZz?=
 =?utf-8?B?VjdZNFpTOHc3bTc3WmZDcDBtcytnenRRb0hNR3FWVTVSSUNVVnpHcXdTL1R1?=
 =?utf-8?B?UHB6ejFnNmZQVDExbWI4TUlFYlprZEFDdkFOc3ZxK0taQ1pkSStXdlgrSS9E?=
 =?utf-8?B?aUpqWkVjZnVmWUM4YWt5Y0hhL09VRDFZT3R0YlRheUhYZGVza1pVYW40M0VF?=
 =?utf-8?B?L01HcTNoWG1BTDZKdW1xRTVBaE1yS3owcExxVGQ0dmhHWEJTemxreGI5MGRT?=
 =?utf-8?Q?rbMXkNFMwUacbMd33Od92xM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b057305e-4ac2-4e9f-fd20-08d9d1e0e667
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 13:23:32.0448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIvZ1srAH3QbNunwv30FCjCaM2nc4SDU+VYzkSJNJO80IQ/uIyiHZOhk+Gpzmrqf272P9RIvkCYV1zEChiu/8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 07.01.2022 13:55, David Vrabel wrote:
> Include the type of the callback via and the per-VCPU upcall vector.
> 
> Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


