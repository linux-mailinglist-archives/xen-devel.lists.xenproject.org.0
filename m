Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDF9442DC4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 13:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220184.381344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhsom-0003Pz-KF; Tue, 02 Nov 2021 12:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220184.381344; Tue, 02 Nov 2021 12:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhsom-0003Mk-GG; Tue, 02 Nov 2021 12:23:08 +0000
Received: by outflank-mailman (input) for mailman id 220184;
 Tue, 02 Nov 2021 12:23:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhsol-0003Me-Es
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 12:23:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a154d628-3bd7-11ec-8556-12813bfff9fa;
 Tue, 02 Nov 2021 12:23:06 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-86zprB5sPb-Hkk_cJmrQIg-1; Tue, 02 Nov 2021 13:23:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 12:23:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 12:23:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR03CA0017.eurprd03.prod.outlook.com (2603:10a6:20b:130::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Tue, 2 Nov 2021 12:23:01 +0000
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
X-Inumbo-ID: a154d628-3bd7-11ec-8556-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635855785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADSqHOqPM78e8QSmzMVdosD/25dj1ceueoTZXVCnNz4=;
	b=UjVNBtlRJIHq7DOLGMwxRrhgqjtvI5fZLbEsk1ajqwXLHNEh0bMSF18y+BA/Ow8gblrprz
	pB837FlG139Y9y//YAnuQFZheEVdJJPzuWj5bN9p05U5Jdin8eqCyu82fRA9OvdKHrfDCc
	q6pLhxYwoC3G73wVRQ+bMXels8eAxV8=
X-MC-Unique: 86zprB5sPb-Hkk_cJmrQIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKV1oUPsFJ6/LIlZ0NO51vouwQHFLY78Bvq8QBUEVlhTJuiW8ExBYm8+pkbqwGvWNYnkg546RNUz/PJQfAXiFc/CcNjBvfCd3wABF88qR7PStO83CTuC7F0qyob8UoQhVIqZKuUqaOKXyeKvs0bRE0eFu7xu6/9S2NUeCBwnien0RQPUTBXbkOc1TCsLIACvC9aPRd6SuQ0b3l9rIDzU24hMwFNf3vNfZoscYeKAk+IY1twaKcfY3eYc0Svm1s8lYx0lbnkb2NPAKFRcfJkZMMhUfdyVrG4ysq7xYtvHUlytBuD6Bp+4phVdCyubAGIz/GsgF47An1n4Whv58Kj4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADSqHOqPM78e8QSmzMVdosD/25dj1ceueoTZXVCnNz4=;
 b=OThu4IThUULmuZvT7wjE3b7tSJvlCAjo/r1NS4Z6pRksgo+IjWTxPVeTbSepCPBmTN2+SS3kAW45yMf1Egrl7weug/kYCpRlkVJh7h/qp3fHW41uDNlIwe9NnaZxtNJ3gVIMXHw6ujomUWAMMWFWUdG/n9vjuB502M89h251LVSXF/RRt1FUtvghbQQoSyhqv1lqU8nP7kQSiP8xdefzMElFPoeE2q00KiJqh8QeD59p0zGii/SUZmWJjuIpOfM806GqzekCh4C1q6sqPFyMLwJGNy5sFKb0+RKvZYOkLbdypi6/f2QWyy/5ZILquU2DDF1eUxOdc0pO9NSb3FOqaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fdcc4adb-c823-2c08-57ed-e4306c1e186e@suse.com>
Date: Tue, 2 Nov 2021 13:23:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/1] xen: update system time immediately when
 VCPUOP_register_vcpu_info
Content-Language: en-US
To: Dongli Zhang <dongli.zhang@oracle.com>, iwj@xenproject.org
Cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 joe.jin@oracle.com, xen-devel@lists.xenproject.org
References: <20211025173523.3647-1-dongli.zhang@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211025173523.3647-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0017.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86526810-9279-469c-766f-08d99dfb83c2
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31186A5CFE5087F2237F19F9B38B9@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kLzOUR6X1Ce17kxJSoyNiXrryGtKu4C3xdYALZUrhok1QdigSD1FfCvwGIYBg+QCvQ0WJbxqq/vYrfK3uHl0um9bI5g9w6eCP0k9GeECKUI8no6+2e1fZUqf1i2HHRQa82i0oWRuxhJ3fzzJ671AAnMJ+GPNUuQCk4z6cgIPGvmzjymJ/cCk8MnngRs4MKND2vdKYRYYoeQwwsx6TquI+fbg9oPMvpOcDJ0gH1nVtoL0q7+VvJMDN2dEIOfcda5xfSQ1mwV26XWN9JVlcHmmJX5H+gdQQISQzN8150aRH2D73jjngYRv3V+rnz/Uv0iAQTLfUoXH5wBP+kLbzJy1I/kCAbgMcz6OGilo2HF7UXQqzlzQUYmw4YdiMz9zJBOzm2V8t/4HMFD0955mwBRzFwz+95JKpuEluFDQfuRgZvzasq48I0kRAqetURcDMscImWpEixcUjWpcHibE+Xo8HQFii3ne0aGTil4z+jLXdY9wUADi9tQhqUUd/HQxnY6/KzMab/8fWeUgKLwX5qGEipI2Px6ZdWc38d3w6IOL9IYu+q0D6qbGzNwsrXSf/7TDhAmfwf0ejiaGQD+Jo+WMaT5lH461KCDARJ43Q9oD1HaXUpqW/+HWqf0im1h6WRb+NkbnDgDPjfzJ82sU8fvaVlvBm+rZcoq8Bu9OEyaDIRrKUSG6ZYQXxHCMZmHMLObtzS4m5/aNPFCLpIWijVOv+GYXjlJ8sPuqqmSYlyIYvzhOro9rsuTgQ1npBEv4oV2HeyLZHB7O4ewoyEoPI2D8uU8TtZneuqAs/zIzJDTMFcsFsFgo+UPIRlGsowy9j+B3U5zWm7jG1Ptn/DD8m9+0cg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(4326008)(86362001)(186003)(7416002)(8936002)(38100700002)(83380400001)(26005)(53546011)(2906002)(4744005)(316002)(66476007)(66946007)(16576012)(66556008)(508600001)(31686004)(8676002)(966005)(36756003)(956004)(2616005)(6486002)(31696002)(14773001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzFFVEpGMHhVZldrdkpUaGRzdVUvSXFsYU5MdTZrWUlpWmN1a2VnSnIyOFg2?=
 =?utf-8?B?amR2Tkw5SmZMeWxLSndOcG1vYlFDajJCVFBJakhwRWFmczJBOTMvNGdBZmcy?=
 =?utf-8?B?K0NlbmVJUlhLVWNBekt2WnVxM3J3c1c1OXpLYlVSQzBERGtqTXBhUmVrdU84?=
 =?utf-8?B?L3A1WWgvSXhJRHNHVmk5cElaUUc2VmVMajdWaEdNZ2NIS3k2dzFPcUdPNHF0?=
 =?utf-8?B?eGpIWFpkdlQ3VFRZKy9welpKNGtiL3lGaEpKYzVCQUVFZnBHOWNrZ2hKcUV4?=
 =?utf-8?B?T3VKdXNHMGZpa1hnUDhiaTE1YU1RVS9TVHlFNmxmM0JKbzBxZWNFQTlRSFFT?=
 =?utf-8?B?bDhSRTRqU3M3czhvYmNQdEZiWnBQVi9tSHRvZ0J6SUt0cVVjQTgzTHordjRo?=
 =?utf-8?B?MTVYdStPaGZSMnUrL0hWbThlZWJjVTFVWENqWEJsanIreCt5L1FVQ2FGOWpU?=
 =?utf-8?B?OEt1Q1J0TldlV2E2SG1ETG9ickozNGwvb2txQWlZT3VybXhkKzZDbmhLQjFY?=
 =?utf-8?B?OFpON2JHZTczS0tWN1dqN0hTR3Z1VkY4WEpqc1lFY1NsRGFQcWxkVDZEU0ln?=
 =?utf-8?B?QTU2eEpEY0l6L2JoNWVMMElkcFkrSUFXam5yb1ZBRlBmcE9Bd01hR2x2SE9y?=
 =?utf-8?B?bnJKdzdDUXdqUnFPR3RUbG1zU2Nlc1hWYldkRGd2dUpFNW5xc1Q1aGtDVUxF?=
 =?utf-8?B?QVZFRDl2T1BtN2VkdGJXTWdYbWF1NHV3aEJFQTA4YngyRFp0WVEzQ0lubGhs?=
 =?utf-8?B?ZG1NK2t2VzJzc1JucW5SdjdBdytMRVdVMG9BVWtxdGtydUVQSHZrRXI0R1A1?=
 =?utf-8?B?dGphNHVWYldqR1B0NTZ1UTN2M3l5T09CelJlVFE2Ymp4NmtYM3Frc21XSXpo?=
 =?utf-8?B?cVkwRHhyZWFVU3lMU3FnT0g4OHpFV1hJbDQyMEwwOGpzUTVSMEpXUmZGMzRX?=
 =?utf-8?B?WkhrZ1BtejdrRDFpQjQ3NlpUSWE0NFFzdG5GMXBDY1l4cFhES2dHZ3JRNUVV?=
 =?utf-8?B?NE5QczVGQ2YvUElSQ2tFWFZsK1JTNEZPUU9yZS9JY2hiTU0zZ1dOS2hRSmw3?=
 =?utf-8?B?cERnazgxUUViRTVVM1h3Vk85elhaNDBkWnJ2NEN4MlpTbUpmR3RHcTF1U1B0?=
 =?utf-8?B?bVZ3VFVnWnVTZTB3U0Jrd0tkczc0dEE2WFQ5UVE5WTNzZTF5d2gySnFaYUIx?=
 =?utf-8?B?VEtxeC85S0Nrdkxlby9xdkF0dEJCMG15aWFnc0U3cGtmTjZPNStVZGRyNkJk?=
 =?utf-8?B?ZVRsZmJ2bzFzVmw4YVgvWDdORitnYkNxejFlSXBobUVodVhmc1ErSDRTRmFm?=
 =?utf-8?B?N1NQMEYxWHVVNytTSU5xaWxwOEZFNzdnYXBwSTBWaElUV1hiUzY5Unk1amxO?=
 =?utf-8?B?cUVKRnk2SXg4KzMyVGR5TzdiM3ltTWV5anpBL09hR293R3dxck9qVjYyVnRW?=
 =?utf-8?B?S0MxSXlyNzNxT0JjSkdXWHRTV2dRZnJabGtBVENnUDJYdWp4RkNyQjN2bWZK?=
 =?utf-8?B?Ym1OaHY3d2tiSis3THF5TUZIZkQyamVPTWNYWkRxR0lLU2x3bzg0cVZjVXND?=
 =?utf-8?B?NzF4Zys4MFphVnFTUS9SZHNJZlc2NlphQ3RkOGRuT3lTZWZHNE5tY2kyd3JY?=
 =?utf-8?B?NGo4Sk1Dc0U3cmhQWGlIQm5ZTTNQdEpXbkhERmxFSG00bmtKMWVOeDFwZUEx?=
 =?utf-8?B?L0MwNXpMNDh6K3Y5MnpZUndwOC9RSzBHUjdQUDkyWldrZVJLNEdGQzRVVlBX?=
 =?utf-8?B?WUZsRHdISVgxZFo2b1d0Y0lqdkt6V2NOalF3TWQwVnVQT2Z1bVltdjZVSEJM?=
 =?utf-8?B?ancvZXFXbU82SGhlcWJQeFZURDJjbGdvbDRDRG1OWG53c0lMdUhZYlg5M3ZU?=
 =?utf-8?B?L2ExY1Y2NUhEZ3BuNjhYRzB5YnZmYUN4NzBSazlGWlJGNWhmdzdlSk5rS0dt?=
 =?utf-8?B?bmRpUFFZeHlpS04rRGdkeFBmQzUrM2lQWDJFakYvS3pKZEJIamVTZ0ZOSWVa?=
 =?utf-8?B?ZWdEMmNlZEE2a2ErM2FwaUNmUk9aRWNReGl2MGdIZW1yZHE0ejhieDZxeVgz?=
 =?utf-8?B?RGJtMXYzV3VKOXBFMXc4VFRhT01va2lQWVAzQWxoK2pnVGpuSmcxNE5XLzI0?=
 =?utf-8?B?OHNyTFQxUDJVbERJY2tGdzI5Tjlzd1FDandOTnlyNzBJMHBlcmdlUWQrRjla?=
 =?utf-8?Q?JN2PHDgAgKH9HMdIYU0iV7Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86526810-9279-469c-766f-08d99dfb83c2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 12:23:02.3886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGGmiWwdxV7p2nJ320x0cyX5EhHO8FEhWlgycQRZH+eGamHUdvaIzw9VVoLlpLkSShGsUQLW4dl0wxq7R1fR1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 25.10.2021 19:35, Dongli Zhang wrote:
> The guest may access the pv vcpu_time_info immediately after
> VCPUOP_register_vcpu_info. This is to borrow the idea of
> VCPUOP_register_vcpu_time_memory_area, where the
> force_update_vcpu_system_time() is called immediately when the new memory
> area is registered.
> 
> Otherwise, we may observe clock drift at the VM side if the VM accesses
> the clocksource immediately after VCPUOP_register_vcpu_info().
> 
> Reference:
> https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00571.html
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Ian - any thoughts towards 4.16 here either way?

Jan


