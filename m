Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C022FA966
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 19:57:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69990.125531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Zi0-0001q6-Mn; Mon, 18 Jan 2021 18:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69990.125531; Mon, 18 Jan 2021 18:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Zi0-0001pg-HQ; Mon, 18 Jan 2021 18:57:00 +0000
Received: by outflank-mailman (input) for mailman id 69990;
 Mon, 18 Jan 2021 18:56:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1Zhz-0001pb-9M
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 18:56:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 201c8e21-b1f5-4603-be90-ed6112a808f6;
 Mon, 18 Jan 2021 18:56:57 +0000 (UTC)
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
X-Inumbo-ID: 201c8e21-b1f5-4603-be90-ed6112a808f6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610996217;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+px+RPM59DKlq/b1qJRlLfMZ0slu+eo/Cfct8+oaW7w=;
  b=UG9jT4uLlnOdg1I+/PS/nbDEmb8Cq+Afj8+Qw1idkorKKzrDLvgsuG6X
   iyfewtTR8O2dSZ6x1XQjccc1B3RDQis8E41uzClRkGEpSrsLq7O8M8MZ9
   CoKHdYBK5vhok83hwY/4yBfyFKIWgK/zl21pkirKMSze1aOEBJxzqBM89
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: M/DCuV+jMAoQrBTN+tEX9Qe24qnMFnVFbnGIJrgEXIlki6lerHjA8db+VZ0tD828iZDTFuMM2h
 s7ox6iPVAfw+7Xvo/Ttj8y7o3NbrZE+8MSOhOgFIdBlpka/0tO8jiFzmgLANXwrEW+2AE/oXzn
 FAe6bUV0oQHFQFT0nLRVIC4cNzDfGDg5hd0gEs7LNeWeMzty/AavfsCyjFZuZHHL1a8pAcXTL6
 Ty+ozInI/rf2F2dnELTlLyNVHcSb4ZzTzmB8MR6b8ipigH3K+L/YxV9tI/xLc3zalorEQPoz63
 F2c=
X-SBRS: 5.2
X-MesageID: 35321179
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="35321179"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=at1bi0wjD99xMyFAwB4dGvlUhA+E7lDHNh2R7cAxj5Wrf/x2UydRl+iBNxXBom0gEcvYc+ZQ/+rCfkU+eFHyj/59cx1DZuVoT56n68o76Gi/0eaeiYjomj/KXzF9e7iZ2nH2v+sALtlu/8MJztb1SvC768YJJumRYXPHbyNMZAvuAvGuMMksUUktq/m7qESjam7x7nNecMH/6Juji17ij96Ofrk6xM0aXRmVcL3fGceWHxESkfqkEwLY4oxuQ3ZbfYkIArdtsNk2cULUBawk/AZv56ApAPd0bojjCRFyQSv2NC15GzjsgTs/EeSE/6onqPdzMNlyxfQ/iVhzX2XrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eseyazQVtaBR5ZJlC2132wbCTkzi2fFb+UGttCPJ3vU=;
 b=OadVYi6Rr8G2BEmlgIx0G5lMvLIWgAd95y9g1iTDswpXf7IN8GAPAuDMhE1duVxZePwwGT8JO0sVHSJ00SpsRu1NIPLGOlfgCP+HmmD+byylijC0nGjj12cd0xKMJgZp2ZalKF6MI1Kh3ojrzEs3Y6IgF1aW5jMk+xR52Wk17UKbCpY1yTvMQGOJQWsRGGnxcwaf4r1Ttf6+2ujxl5OMvKeMTOsdYZKvgbh1RiI0Z+mv1VHxgmRu5agKfwpUTf46KmCz2kOzjxIstJSmla/pKBfXHuRh86UfrVN7g8CeXdgN5xXTQCkywkkM5E7eAbwzO7C50LC4UjbJZyuHScZD8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eseyazQVtaBR5ZJlC2132wbCTkzi2fFb+UGttCPJ3vU=;
 b=IxaQYf7m2iFx0uAXgI11kU8pvrquklK0kiZhHCyVkFS3czQWQv3LMvee+n4PA4Gnc44MeTnTgyJAne7MfeX8LWPKzkjCAhgQzhenabsGgQaCEouJ36U8d2VzQ4fQ5TDLloX0tZyAfE6KV4T8XaFgewPN24Sy/cAXTLGZ94Wd+Xs=
Subject: Re: [PATCH] libs/store: make build without PTHREAD_STACK_MIN
To: Manuel Bouyer <bouyer@antioche.eu.org>, <xen-devel@lists.xenproject.org>
CC: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-18-bouyer@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <00483a69-0c93-96dd-2ea7-60c91c050a88@citrix.com>
Date: Mon, 18 Jan 2021 18:56:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210112181242.1570-18-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::30) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ae15da5-b4e7-4958-8e7d-08d8bbe2d1a1
X-MS-TrafficTypeDiagnostic: BY5PR03MB5266:
X-Microsoft-Antispam-PRVS: <BY5PR03MB526669EBBAC92630EA7B3094BAA40@BY5PR03MB5266.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AtCUucyoVBcByFMqZONV6ks6210TctNcoprGE6lhAZQuOrF/kRNf0Q+hlol3njwmHyKP2f79POu+j1Vr8RdTgT/HtldlqdXimns3utKR9qJ7AetbOIHSivO+4aBWQMD6XiVvkipODNG4ga9UdsrlI1hvWgZf4nRrjnZBRNPatkp3i9xs9JfEdERMU9Pn5kh7FGagyOeudGOalz88MEwaLvnRL0R2vVpprXiL/obq5l3S7xhBTcqu0K1lciZEqRgs+FEf7dYBeTpU+1qHKFtBvXb/tC5kPtZIpyAmzcVdgTmBRa3yQlNPOcokUHjWiT+oW/x+WCSAXmT6B73rombVPQzKduOlXkPhmfGRoFEq9CmRyJMrw7riPOhH9woGE7YhTPPoZjtYEAKYmaVwBDacjGDm1bQ06fL4nazl3pVjaWIN6NRnPS5cY/tJpq5E2ZPTrq3ZJmEilRemJIwj5dvNJsrtkvBkx1hsX2PQuVxeT/7UmMjhLnuUQTiHVLIbAgUrcfLnsDSxGspKdhnO5Q5JQRpIVWMjd7/IhF2x3ychV+Rh03QoiGlZ+aT9DinoJ114QFXSzEIyn0kZxy7JTxcqmN1rVBgcrS+IPk2j9pN/ZsA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(2616005)(66476007)(956004)(36756003)(31686004)(83380400001)(8936002)(53546011)(66946007)(6486002)(86362001)(8676002)(316002)(26005)(478600001)(2906002)(54906003)(16576012)(4326008)(16526019)(186003)(66556008)(5660300002)(31696002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y2Vhak00dTdUUkJxUmxodW9XS0JRNmNJK0hKYzdtWmVpZ2l2T1pHMGh2RFFa?=
 =?utf-8?B?U1RsOTZiS1RnM0ttNmxmNENhbEFnK24yY09VbGFobU92MFhFbjBuYjBrUUJw?=
 =?utf-8?B?N2Z4UXNON01nT0QxR0V1WWZYUStENFVGQlJnQmV5SEZnS1EvdWtPTzVZVGhD?=
 =?utf-8?B?YmNPMHVxNVpYTmEwdk5Ea0FuWlF4dlVOanJCMEprQ1o3QzdOVVJDS0t4TzJU?=
 =?utf-8?B?T1hXZkxoN0dObVU1Ym5YWjFiNnZUUjNnS2R1K0cxVXpnbDIrQmVsNCthdUo1?=
 =?utf-8?B?cXBTRU5ibEkrNWxlaHZGdW1pcndzQnRsTEkyZnNMZ01NOVBsTWlBaTUxM3BF?=
 =?utf-8?B?aWVmQnBIZEhMS0tqTmNiVWo0OG5yTisrMDIwdWVxYlkxN1B5c1U2SmYvY3pl?=
 =?utf-8?B?bUVKZ3NTTXMrZVpIK1NaZ05xdHI2NjlvbUFxcGhNU2tYMVhCQmc5MXZIQXpy?=
 =?utf-8?B?T2Z0Z2xrU2VZNXhHKzNXVUQrR3dRRWJWeVR4TlRSOVd1a3lZbTFST3NOSkZ2?=
 =?utf-8?B?U09IWmlDZVVoaU84RktBM3FuYjd6WlNJaE1qZW5TRVFYaVJ1dUhQdXhldmtW?=
 =?utf-8?B?alNPenFZNGdrTUFwRTdLV2lOTnVtdFA4OVluQlpDaHcvUEtTcWsxcmtqQzlY?=
 =?utf-8?B?elpzRXNEUWdOL0R1SW9DcUJ0NGNLYm9KUW42aWJmbG1Od2crS0w0eE51dmJ0?=
 =?utf-8?B?OXFtU2oxeUVrZUlvRUpnVk0wWEN4d2p5OW1hblhpQWdtT1M5ekFYZnNUdkla?=
 =?utf-8?B?ZklHTVdwUTNXQllOVWdVNWtIY0ZZNEdxL01VRUZXdWh3Y0NWeG5xeUJveVZi?=
 =?utf-8?B?NnFrVmNyanBvcm5hTE1tNGlPWDY2ZzAySGpjMWtaVkpXNmlYeHo5YWZrdndK?=
 =?utf-8?B?Rkg4SEg4d2ZraGorYnlVY0R5NGlhcmx4cGVGcS9wTDFON1VmRmNKY3VqVUIw?=
 =?utf-8?B?RXYvUXczeUsvV2RoT0Y2LzN0OUZON3k2YjVTbW1JM1hFb3lOR2xJbnhReStv?=
 =?utf-8?B?NTFJajhTYWpkUDJid041T09zYVRwa3lIVHV5SEtvVFlnYkdrU3ZEcDFGb0tv?=
 =?utf-8?B?ek8vaEd2bkNvdk11THUxN1c3a2VSUjB3bUcwS1NSM3g2dFlaaHJxdnEybEdN?=
 =?utf-8?B?Z2xWZWpFVC9tR1daMURhcnc4am9JbEw4c1cwaEVCc3VvRVVleis0Qjlibmx5?=
 =?utf-8?B?WTBTbVhYSUtJVThGM1Z6VTlpSUErTjAyUkVSOWZVNFkvSXNkVyt4blNZS2Rx?=
 =?utf-8?B?N1VvZjhTYk1FWVJ5SWxhNVZVclhDSVJvaUU0YitPa1Fpb25tbm9wd1JVMFdr?=
 =?utf-8?Q?/IjaqY5+4KioyxBtJ3YSHIKGf5OkOs0jNk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae15da5-b4e7-4958-8e7d-08d8bbe2d1a1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 18:56:53.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vY/PJWvLw3Ez9j9BABUBWRIzz9qCZjgY9ti/BHpy2QKy4EU5VhfH2c4bBsdzzbZuzXgcs/Uj2uvaFYYA7ph7bCC/eJGZYmejddd2D28Oe3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5266
X-OriginatorOrg: citrix.com

On 12/01/2021 18:12, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
>
> On NetBSD, PTHREAD_STACK_MIN is not available.
> Just use DEFAULT_THREAD_STACKSIZE if PTHREAD_STACK_MIN is not available.
>
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> ---
>  tools/libs/store/xs.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index 4ac73ec317..8e646b98d6 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -811,9 +811,13 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
>  
>  #ifdef USE_PTHREAD
>  #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
> +#ifndef PTHREAD_STACK_MIN
> +#define READ_THREAD_STACKSIZE DEFAULT_THREAD_STACKSIZE
> +#else
>  #define READ_THREAD_STACKSIZE 					\
>  	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
>  	PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
> +#endif

How about this:

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 4ac73ec317..3fa3abdeca 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -811,9 +811,14 @@ bool xs_watch(struct xs_handle *h, const char
*path, const char *token)
 
 #ifdef USE_PTHREAD
 #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
-#define READ_THREAD_STACKSIZE                                  \
-       ((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ?       \
-       PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
+
+/* NetBSD doesn't have PTHREAD_STACK_MIN. */
+#ifndef PTHREAD_STACK_MIN
+# define PTHREAD_STACK_MIN 0
+#endif
+
+#define READ_THREAD_STACKSIZE \
+       MAX(PTHREAD_STACK_MIN, DEFAULT_THREAD_STACKSIZE)
 
        /* We dynamically create a reader thread on demand. */
        mutex_lock(&h->request_mutex);

which makes things rather clearer IMO.

~Andrew

