Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670B62568F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 10:25:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442383.696500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otQGt-000770-Rs; Fri, 11 Nov 2022 09:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442383.696500; Fri, 11 Nov 2022 09:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otQGt-00074a-Ou; Fri, 11 Nov 2022 09:24:23 +0000
Received: by outflank-mailman (input) for mailman id 442383;
 Fri, 11 Nov 2022 09:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q9GK=3L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1otQGr-00074U-Bz
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 09:24:21 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2072.outbound.protection.outlook.com [40.107.103.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ede3895-61a2-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 10:24:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6948.eurprd04.prod.outlook.com (2603:10a6:208:187::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Fri, 11 Nov
 2022 09:24:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Fri, 11 Nov 2022
 09:24:18 +0000
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
X-Inumbo-ID: 9ede3895-61a2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5WITQSkFKKCeKRQ7+J3/lgVqz4sifvmvSgia8tAgLRbenzGWgU9RVsJgMLsBDhoo7Ah0keLgF3h9G8kCb2ddniOONFJ81QLumo4dxO0kuX61BtpFPHAS71PPEiEBPV3xHYqZVGrVRBT5DCuWczn0ndeZajkrgCwp+tquQGRyig4J6sJdsdvOQKzccpyYiJ+5dNRTEPL+N17wJG1NHhpdYTxWG2VPvDmhVDfjDeo247WvWXlDi+EYhhaOhppDbFRR+kFjwI3NdaILKGtoF7QZtdaTIDHlQuTUCoUdttv3OrTlBJMkkuZWn//2zsbGzQM+/Qtit0ow4kuHQ2x8OASgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzH3s03D4qYTPtNr6CWCV/Oumo1cd+OBTpQQkCBljfM=;
 b=Jqgs74kTQMs3/WDNJpQDXIjOX6uazvDm2SznEEruhupMauQn1DJnKaS0y0h2ow/YnUUmOhFGN5fzQoxTslk2w/gYEmn5Prcd4aZUv3cRuagZ0TlVzpchDejtpZiGoNHoVeVS5R/WELWN5vwQzPeVo54VJvGdfDvr+qd7osmoGHmKXh5i42FU2IyceRBspy01F4vAVG0Pei2RaAmuy+FhH6Gr/4pBAcpN92Dea2QWi/SXcZH0mgmRU5i/j2riRymM0XkLFfnOJVwolkegQj4XsT9jXSHrz3q0oIilcNwyn24IiJ+B66SdpBDv7RkgMHBjy/kzdGWYtjE62HGcrnQv/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzH3s03D4qYTPtNr6CWCV/Oumo1cd+OBTpQQkCBljfM=;
 b=jnoe2zXm6O8DfYzjwMEIaKogBHkNseoVNFDWjsdeqLdR9VFgqozCPp9ETkSTZ6T0iGILtTqFqs4UmvolJ6bs2bcAqYTMabI88cW+TVmOLTibef42pOkruSP8FM0i2q3niTWp4V6MVkduFbLHuO0VeZE+KySi3y9fRSn3iOPXrPiln4327erQIDdeZit3KRc9QjRL27asppFG36bMByW3wSoPSAiAh5grsX5xW0QGlR+tbMd90LK0d/iVHuGhetZAjOBZf1qBuqFhT+7KegbHm4w0S3203ERDbj0Ohbgu3sPHYhWByfe0zFlv2YnZh55TmYgn150cfoCN1Bdovad5Pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <078656a9-4362-5d7a-fbd0-64c739256012@suse.com>
Date: Fri, 11 Nov 2022 10:24:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/3] x86/msi: consistently handle BAR mapping failures in
 MSI-X setup
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20221110165935.106376-1-dvrabel@amazon.co.uk>
 <20221110165935.106376-2-dvrabel@amazon.co.uk>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221110165935.106376-2-dvrabel@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7790bc-06ca-436f-4976-08dac3c68253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/SA9w8yuXQBTzn5HQNd27tYMk3S3KL9nowNR4eQfkLcQboB7AY3RHHTL7zAFoh68WO5TTN+ZQVVASI+3j8dSrG1cg6ph3MeXfHJ2/z/LkOyCy1na0ox2u/YbffIW6apdW9WWeMbR49QieKatqW3jcEI6TrR2EUAn2UlaH+NhNJpBKHN0krBgP/qI8crPD664Mf/eJAo34xlazLaoqikyF+eLizYXGv++jSfz8JwFG4w+V8iFsYmglhaoZbqB67i6mvEDL2HK9311SN51pbxtTiV6abLA8p1TrCk6fjcoVR4Gx8d/U6M8z9XqgBiOglgDlJOXuqo3FivkRjG0k8iBedYRDKgFtzefPGEp2eooHEhBEcUWvrGyz9WpvWiXVZdEvLZQgwb9+XE+ok+32ueJdKxdr/YScYZNJo35uVKYbl4s4i4B5Vq9taO3PFD9kes+818ZndgugLXGFW3eBkwQkNvFlJV9TdiolvCl9Dv3aKRvWXMdq2i/gbkpLie99pd/uaqvU+rq/JPMLhPccv1D2PaxTdADLwrUu04tt1M7XAxniKRl0aTWYIFWcIIMZYJKhzdT37tgIWuUZWsCBQqGrM7j4e5bP8mmnIs1sJFFlH6zaYL1BJaWGU07gbAnJqARITFt1KhgPaRjamCMYkj3QSqK2xeFRnmBo9OuPYMNlH7R3VVLWFdyQsw5rZd5Z+fUPBOYGd7y9FwPcJ9n0jn4Zq8RbOu0uYqQBcGM+p4bZXhuhNPJsC/Wg1BnWI/aQly4T887wmiJrkynJ5mzEvdb+OmMcv5jBKTwhC1AJCQKcMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199015)(8676002)(31696002)(66556008)(86362001)(54906003)(6916009)(6486002)(316002)(2906002)(66476007)(8936002)(4326008)(5660300002)(83380400001)(2616005)(186003)(41300700001)(38100700002)(66946007)(478600001)(53546011)(6512007)(6506007)(36756003)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDlDbUw4ZmxFZ0RwVG5VUm5kUk5nK2RRTTlQVUJuSWIzWjVRNW9pMUo1S014?=
 =?utf-8?B?REZ6Nmg1ZGU5MS8vZFE2MkVzV0s0ZTk3ZTBIREtjS2QxV0hHUFdnSnhVZFRa?=
 =?utf-8?B?bWRoQ1NKcGRpKzN1VlQ4bkFwV0h0TFVYZU4vN2k4SjFMQUhIUVorYUd0R2Fn?=
 =?utf-8?B?MFQ1V2FubU5raVhVOTJuWmNLWXZ2RkZnTVMxNi9XTmFFSkpLUEZBRHJJSWJ2?=
 =?utf-8?B?bmdIV0gwbDFTN3R4UjE0dmZtZTJGTksvTFNLOHp1WVkxN0xrd3lZUnNSeXRl?=
 =?utf-8?B?elBOTDF5RDA2dTF6OWw5T2xGbGpvN0hYWHhKZjkvN0IwZll4U2c0Nm1qN3Yw?=
 =?utf-8?B?OE1leWZNekZkRnl6allJOGc2UHNLSG1CdlhlcHdjQ1FIUlhhNS9aamtaUG13?=
 =?utf-8?B?MGF3Qm9XNmJlc1IrR0Y3ZkJ1eEx3QUJFd256QnpkdGc2TXdNRitzcCtxT0Q1?=
 =?utf-8?B?bHBZcGgvdEFIVkdYVWpPcU5acHFEQWlTUGtVZlpSRFZPdmFBVnJhbkxsQmFH?=
 =?utf-8?B?Njh0UHFFdlUyUzhiUlVwejltdG85Y2lNajNmbDRQQzdUM1lhbTN2RlFoZnRl?=
 =?utf-8?B?c2dPaGQvREpGVXRYRDN6QWVTb1REVDVnL2NqTkpVdS9JT2hPeWJMdkw2Q0FZ?=
 =?utf-8?B?bnV3QkhMQk1qd1NwLytZNnlkZmZyLzdSSXBycVJsV2lLZHloWS82Qi82VllR?=
 =?utf-8?B?bVdGU21CMi9EMmhmVlpLc2hQZ3kwamkrZ0tuTVl0V0VOMmx1ekQwcFA4b1RI?=
 =?utf-8?B?cHNPOG11NTQvTGRaSERUS2k0dkVWYTBlQnZMSE54eXltakRDNE1ObG1GVm1C?=
 =?utf-8?B?UGx3YnV1RXlsQmhrS3Fwa3piTVJxNk1VQWZDZk96L09maE9XdHprcThUd2s5?=
 =?utf-8?B?U1diTmJydnRDa0dVN3pCOGluQzY4aGR4elNYK25aeDZaeVJjS3JGNTdPUzVQ?=
 =?utf-8?B?dm9VNFI3eVlJNXJXUHZpc0lnNkhoejBsSEZTa29yemc0Z0lDV1lYUG9FNlFQ?=
 =?utf-8?B?OFRKOFBFMEdHVDlYckwrS3ovWnpienZBbWRyVEFncmQvblU5TXdwN2U0S3BN?=
 =?utf-8?B?MUxNOUMyRGFlalVzRnBqQ0hHWi9kMStvY3ViR2Y5YTlTYmdZalNpaEtua3d0?=
 =?utf-8?B?ZGtsbkNrWlo5dCs1TllTbDZtZnNGMTZtVjZuV1Fkczh0TjBhcml5NytpR0lq?=
 =?utf-8?B?OElTRlBHdE85WHd0WmRsM2JocXZ0MjhxUG9JY2FlWHRPSUlrTDlTd2czQVAw?=
 =?utf-8?B?a2xtdU9EWTQzUnJZWUhyV2dEYXJMUmtmMnB6bTlvU05WTUNwR3pXS09menhS?=
 =?utf-8?B?VUJkazRvT0IwTHlSblJOSklSb1NnVmhJbjlvVkZqWXdxenYxTGV3QWdnMm5Z?=
 =?utf-8?B?WmQ5ek1BU2prT1pNVE04cVRrbGFYRlE0eDQrQzQxcUQvemUzLzQyNktVczcw?=
 =?utf-8?B?eEM2RGtBZGppa1lQR0tnTzdHK01vSEFXY09hMWpVYXN4KzdUT25sRmNlbXZz?=
 =?utf-8?B?bU5YUFhqRlhQVHlObEhBVzZCLy9jdVc4bDN0YVFPQnRITzN6cXFvN3F3UmpU?=
 =?utf-8?B?VHBINm1QY01pWjVEMFY3VW9lVnZvc1ZWeGM1YzYzdE1PRFo2UHEwdjNSVVRP?=
 =?utf-8?B?cVlDM25tU2lRU0tENjE5QUUwUFJGeVVQU0U4S3VkQ1dlVDlxVzVNdHJFbjNO?=
 =?utf-8?B?cWhRNHU5OVBZRnl1MjJxb0RBTTNBenRSakMvZFgrTms5VjZKRUFwM01WWHRC?=
 =?utf-8?B?eUZaZk1YQ0x6NVo3dTlKeXBwTWtpWnZtMUZWRVhRWVFQL1BURUhUZzdoNHM1?=
 =?utf-8?B?bThaS1JEczNMZ25rSWtPaUZqSzlhWCs5V29RL2NNVkpaQUZhcm1RUndxdEZv?=
 =?utf-8?B?TTVxUFdKR0ZTMHdlclhYSXdnd240dEoyYk43akZhSHRTckhDclN5WjNGdFB5?=
 =?utf-8?B?USs4SC9YalUrVmoxY0Y2ZWltNDhMSDJlZHhNK3RzNlc4SXYvTDR3Uk1QZzV4?=
 =?utf-8?B?WDhQS1R6ME95Unc2WHRqcmJFbXZubzh1ZXN6Ulh3NVhYMm95QW5KN0V4U0JU?=
 =?utf-8?B?aTBCZ016dmhOTzQ1SHE1cG1pL3hwTDByb2twZkVKdUgvdE9jaTlVVklhZkpv?=
 =?utf-8?Q?jcJkMPk5IDZsqRyVhlaE1SByr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7790bc-06ca-436f-4976-08dac3c68253
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 09:24:18.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47SJ+qMeBT24kV5ThPJ8Oq1LnpWlx5emEZIEdrpg5VW6kFWO2bZMBR97ThQOTTH1MkmYSJ+aWzBRXEXK/P3r9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6948

On 10.11.2022 17:59, David Vrabel wrote:
> When setting up an MSI-X vector in msix_capability_init() the error
> handling after a BAR mapping failure is different depending on whether
> the first page fails or a subsequent page. There's no reason to break
> working vectors so consistently use the later error handling
> behaviour.

"zap_on_error" can only be set when there were no working vectors yet
(msix->used_entries being zero), so I don't see what case this last
sentence describes. In fact it was the intention with "zap_on_error"
to leave previously set up vectors functional.

> The zap_on_error flag was added as part of XSA-337, beb54596cfda
> (x86/MSI-X: restrict reading of table/PBA bases from BARs), but
> appears to be unrelated to XSA-337 and is not useful because:
> 
> 1. table.first and pba.first are not used unless msix->used_vectors > 0.

This isn't true afaics. The condition around their setting up is involving
more than just ->used_vectors:

    if ( !msix->used_entries &&
         (!msi ||
          (is_hardware_domain(current->domain) &&
           (dev->domain == current->domain || dev->domain == dom_io))) )

Hence the associated "else if( !msix->table.first )" can also be taken
if msix->used_entries is zero. And in case of a failure we need to force
the error return there for DomU-s, which is achieved by clearing
msix->table.first on the error handling path you alter.

Furthermore I'd consider it bad practice to leave stale values on record.

> 2. Force disabling MSI-X in this error path is not necessary as the
>    per-vector mask is still still set.

I agree that we might be overly strict there, but to remove that
disabling you'd need to further prove that no other inconsistencies can
(later) result (this being on the safe side is where the connection to
the rest of the XSA-337 changes comes from, along with the desire to
not leave stale values around, as per above). Plus you'd want to justify
why this error path is different from others in the function where we
also disable MSI-X altogether (beyond the path you modify there's exactly
one error path where we don't, and I now wonder why I had done it like
that).

But then I may also be misunderstanding some of your intentions here.
The "consistently" in the title and the associated first sentence of the
description escape me for the moment: You're talking about things in
terms of pages, when the handling really is in terms of entries.

Jan

