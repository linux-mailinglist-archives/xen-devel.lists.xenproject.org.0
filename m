Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800B73FC8A9
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175786.320123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL47V-0001Ap-N1; Tue, 31 Aug 2021 13:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175786.320123; Tue, 31 Aug 2021 13:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL47V-00018n-Jm; Tue, 31 Aug 2021 13:48:09 +0000
Received: by outflank-mailman (input) for mailman id 175786;
 Tue, 31 Aug 2021 13:48:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kH2E=NW=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mL47U-00018h-LL
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:48:08 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cbb083d-16fa-443d-9aa1-4a903e73ab7b;
 Tue, 31 Aug 2021 13:48:07 +0000 (UTC)
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
X-Inumbo-ID: 8cbb083d-16fa-443d-9aa1-4a903e73ab7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630417687;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=24phHelAWTxwR43GIVyTNRF1ligxzWiVLDhhWPmcE6Q=;
  b=Jgi8W92hld87fPm95nrsUARdmyNsoc1Wy22hmX+gUKxEqe3/wvb63Rrh
   TY0kqfau2swKOfPzLxo6ISVnLg02Y4VhVAx+Q6g+i9AXaP5lvTJ+7iZlw
   hqb1L48+VCA+YSfz8D2B1qqaFitvUOJTIiSvMUXZ3QsY4/mROdd5nNRFT
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lKPNTWGDp/4zRPzvj/3EHckDt8k4i1UWAz0D0g40tDvWgDWblaoEHrAx5iPfU02vt4XgHUTXbI
 xJZnMVSLAw4lKw1z1fAzLquu97sMkYNgVSCBK/LaMnp68jM6TBPy/zQrbYyiax0rszzwudcnEg
 eU0EqvvYOdJGw/VFHZ5GPklt3ILEZehddde1goZZotEgAcyQgmsUGO7HuuwNefJEoDHqiwG5zp
 6o0ijnJrOj7BVXivmyBl+ezHZSpY04SLBY9WqGUnKLEAdaK7l4Fv+EiLGML6IMKBbvDLovbPWZ
 lR4Eb8+JJlEwarGkoZPa+q6E
X-SBRS: 5.1
X-MesageID: 52083418
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gskrDK7uVq8rQTn5sQPXwU+BI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXJVoMkmsi6KdhrNhQotKPTOWxFdASbsC0WKM+UyaJ8STzJ866U
 4kSdkCNDSSNykIsS+Z2njBLz9I+rDum8rE9ISurQYZcegpUdAG0+4QMHfqLqQcfng+OXNWLu
 v42iMKnUvbRZxBBf7Ld0XtEtKz5uEi0/ndEFc7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+k3bnpizuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyGIiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/MMZFjZIxSGqU12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsLi4co/jhieLpbTIUUgZ0U/UtTHptFNjn98pobHO
 5nC9yZzOpKcGmdc2vSsgBUsZmRt0wIb1G7q3U5y5WoO2A8pgEg86JY/r1cop44zuN7d3EejN
 60aZiB/dp1P70rhaEUPpZNfSL4MB2WffpgWFjiaWgPL5t3TE4lnaSHqond1NvaDKDg86FC7q
 gpcGko+lLaKHieR/Fn4vVwg1vwqSOGLGnQ9v0=
X-IronPort-AV: E=Sophos;i="5.84,366,1620705600"; 
   d="scan'208";a="52083418"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dbd8bmQfbeuJa+/MqrifrbdW7R993va4u/VEKhg2PFkLZjrzR8RxzZlM6rYgSDddMdJtUsIvfXyBsnwFfnRAPnnEAXHkpC1kmo7tcYjfUsFc/K89FYvJiXRx0qoaG5jQyRfiZ+7Dd6aBgl1Bw2fgc/NucVsb+eB+CRbm/MFG9sugW0NvfL43L9Q5Wq1wnVHIS4RrOvZv0kkXoXuI4eyUM5p6IzigSOK6wuuNkt9IlDzYgLKsGg6PWmKaBzpMxoPcJObwTZ6jm9Eb1V3VS/Zry9txgVrKahKVEaDhFh0uBq11WZ3qSHjQG0P0TJBqZ222Tzdyf8hyA9oUoheXU/9phw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrKz2jbG+mT5dOp9dPkuwq1ucx1hJ1Abwlehka9EUmI=;
 b=SKUGtXqb8j8S6ZENf4J0UmYscHhi4h41Pei4h21HX00mqRpPDtRjwWxc7BH65X7s9s29ubB7AhV6yhAastt6VN7uv2qTAi4uVh7CZTopFEN51MNgfYYwtkzRTJlxQ9u/ROyok0y/0duPFg8dRQyd3WL3falPBgDTMVJzpGtWAl94QZaiYCJxapo2Jo/+NOoJHsXQtRXSmlKHUvaIqz+djtz0LZ7m2vHKIRghWAYZzQB2SGgLsQsK9WnAFJ2ZT9FURbd1X4PZmkUf80RjGdti6iv2rtlNPBQj18+r724JSNYG4+aPwH+YUy5bT+SxbDqW+CQ7uBg6WGfRn2M1GwUn3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrKz2jbG+mT5dOp9dPkuwq1ucx1hJ1Abwlehka9EUmI=;
 b=mjBsQeQkPh+38ydIPAdGuKH79xV8A097bBw7OiEgR9pgm7zWvyH5ocAp8F6vZY7rL3IgP10lLSKXLHuC66WQrOoltB7TqV4MNe+mjEt294boLoSd+acEUnZhaQYAUXZw0gJO3P++Gfo2fN4CjW4qEAqKisUj8rap/sbKqPG3sD0=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Tim Deegan <tim@xen.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <35864b86-ae6c-f8ee-99df-cf78751d275d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] x86/PV: properly set shadow allocation for Dom0
Message-ID: <0f00a4fd-47c2-8ba0-13b2-2210d8b4e0e2@citrix.com>
Date: Tue, 31 Aug 2021 14:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <35864b86-ae6c-f8ee-99df-cf78751d275d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0483.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdacb457-45f8-4bbf-4d74-08d96c85f4e9
X-MS-TrafficTypeDiagnostic: BY5PR03MB4998:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4998AB3119C495EA6E2E5C8DBACC9@BY5PR03MB4998.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SkRrl3BkOn8kTWP5aTfz5QHijWWEsMUYOwqSAqGJFsnRPMIgtcYGsDh+Tzq3F3XNVth1vdy9KAyfKPbj0vynlgrBIFDt7inv+9JWO+kvEgTTrKtEEZ4VSZtNHB3j15PAgTsnZn5liVh/mYqUddS+EoADIw+W7/WzgLDUg6iin4FaEGgecBRq3Wpq6o+3nqnl39TeniN6zJTeCN0a/csVfy+IJ1TimNppUuBqGQv0MEQ5IMKK3D14D3yNDhTCHaWi0rA/fguSQOZNX6AwqpnDwdOM485qt5lb8h74v45RauzFe5w82Pq3GFz1vGG9aat904sjlSLj+XwwgFmBq46g6mYngTsDAUDBveF8V1arjHJKat1ib/+/eCpxdYPPK1FVfkGCuM8LiIJC/HQ/wc5FHzCxyYTFFJ7186QzqOKCPleTfhI8sUHK0l53ycHAaJ3kd/vE4zq18qo9zu0K6fbue+lsrzjZH1Npfh3+Mpp4HRpPLc/xnIpUStmsYWSkC5LBmf3ZsFZG+4/VC8UVMb55Lwd2uoHocVjjzq7Hf0uHtT79DxAjbznQqq7LkcGS2h6bVaZ118el3VisGdGy1Bu4DVfjFfHgEhOwptXkvZjrUMa6/dQ4FYSDYU7H3FbE87VTSP/HRafSkc15+eAmnpiOFRARDs+0rRAzRxLFvEdu+OvlVz0Q08z75IR4VE2yH8F0wSiwF52rOy5tRMiucnLpcUIZl4TY47Va4aHidPWn0l0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(6666004)(38100700002)(8676002)(6486002)(16576012)(478600001)(66556008)(186003)(5660300002)(2906002)(8936002)(54906003)(26005)(4744005)(31686004)(316002)(53546011)(86362001)(2616005)(55236004)(83380400001)(36756003)(31696002)(956004)(66476007)(4326008)(66946007)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk1ia0RHZUV4OXVod2d6enF3RmxqTWZnYURQblNmWXQ0d01xL1hHNnpRQmZx?=
 =?utf-8?B?S2tpQTBGM2d3M3cxcm1pRVNZOTFUQmVidi9mVzc0VTdWc2lWVDl0ZkthQWp2?=
 =?utf-8?B?ckluVjkyMTFFMlo3SHo1azZhRWF0Nm83QmlqY0FRUCtobjNNNDBPQmxqTEU3?=
 =?utf-8?B?RjFGNnMvd21nQk9jKy9BSGV5bWxNY0RxNHNGMlNKWjN3MWdRQkwvSjRzSVd4?=
 =?utf-8?B?aGNURHRMMCtEMnd6N3FYeFJhbnNEdHNyNjg1eDNabWVxNTVoZ002eTI3TG0w?=
 =?utf-8?B?OVA4QzRmUWI1RThGYkwraWpLdis0blhOcG5iNEovZ0pNSmx1TG9DeUpPenp2?=
 =?utf-8?B?M3BmK3lQaFI4cXdLZlJxaDV4V0FoZTlUTHlvNnNReFJZMGZZaEtOa3dnMXRp?=
 =?utf-8?B?UXF6QVRETTU5RWdTdDB0c2kyL0U2RGRKbUhCTVc3Vm5CdmNkT0h4N1h5cXJy?=
 =?utf-8?B?THpicE42OEZBMzZYbHFXcldrRXNyOG8rWGJCQlI2K2pxL3VBYmJtb2MwbHpN?=
 =?utf-8?B?S2cveXdBNndKaXJwS2dYUzFkVTJaVFNXWjlOeEVuMUdFUjduYkxCc0piNHJk?=
 =?utf-8?B?bnk3WXc2UWNPV2VtTTN3NDFtd2Q2em5LN1NXL1VjNmtNSUNNaUNpUTA0VkI3?=
 =?utf-8?B?TFRTai81NTdoSUwzYVBtNDdPRFBxaVB5MTZ6V1B4Z29yQ1hrRnpCYTVoUWU5?=
 =?utf-8?B?VTJOSnNCV1pJeEw3SlRLVU1TdnJpZGtqbDFjK2RmWWRjS0FVc3VHY3dZVldX?=
 =?utf-8?B?SGlyaVVaK0ZLWVBvRWhGcGs5WndaellNV1BRVUVDNXNVRlduSEhuUVFaNklX?=
 =?utf-8?B?emgySDVmeXlYR1JxZmdQd2dyNDlyWFlveVg1WitCQmlyYi9waVRXUVZELytJ?=
 =?utf-8?B?UzduOFo0UXI1UlpwOFg2VVFrWUpMZlkyd3IvRHozV2VyUWZtOVV3QVJ2T2wr?=
 =?utf-8?B?UXVneXlvOUsrbHFRYnlYUEIydlIvR2NUaUJIQlBLTGk4Z2s5L2x4NXBxcGFQ?=
 =?utf-8?B?UUlCdnBrODBBdS9IYldrQVRVSzhnQUdjblNka3pMbUxsdEduZ1dia1pQa1la?=
 =?utf-8?B?bjJGSFRPS1lzNzFxcEZEZHJIdEQyZS90YUpueDM4Z3hEY0NIbXRLMkl1M2J3?=
 =?utf-8?B?MUZVRllXTFc4TDRhWTcrc21FQnhlazBTTllGKzRBSUlYM25uL01ZM2puZU9q?=
 =?utf-8?B?a3hFc1M4L3BUN3lwTE40MUVlSzJJdk1TaVh1NFdNbWJvVXE2OWtoQkc0ZE9k?=
 =?utf-8?B?QWtKZHFFS2FkbXlsNXQ2NlBuNytzeXFkMW1Gak5QMHN6UkNlSjV2VXlzR3d6?=
 =?utf-8?B?bEl5YjdoVlZhZjRpeXZvQ2poQnFUMjdWMFhMZTVvT3c2UzlNQm40Mm5pOFpn?=
 =?utf-8?B?dEN5S3Myc0NERjNyTDczZ2JYM3U2cWp6YkJ1MVZrMzl2VlF1T085Zmt2cWtP?=
 =?utf-8?B?ajZHaXJCWi9Od2Q1NFE5WnR0QitBRVpOWHZUNDI3cjUxVC9IN09ac1FlVE9o?=
 =?utf-8?B?cFcyOW5RZy9XTjd2SEZGU1VJa3UvZDhBRmhQTmdIMmRCR0Izd3JyQmcwYVl0?=
 =?utf-8?B?UHIzV3ovdGVxV0NSMEl1Z0o5NTRldFFRSFhpNis4b1NaV1VMVzB6M1lRUXZR?=
 =?utf-8?B?cTFIbFBoMmE5RE9FMzlNQkFMZ04zQmV0dkRLZ2Y5TWtTbUNzYUEwSDR2WDh4?=
 =?utf-8?B?Q0tmSWxsTFRTS04vc0RYVkkwbnFjeFNVV2dqRnl3UngrOXpxVk1jdGcxSkJV?=
 =?utf-8?Q?r5lJUDtZTkjsXI3f8ieInD//fXBQ6p639xr9n7d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdacb457-45f8-4bbf-4d74-08d96c85f4e9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:48:04.7584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cj/T6lGB54uzYcjlwBrCAF5axNeT1sQOND+BglrDBnCiltrpGNSqtMxiNuL7VghC998Aj5ACQpgyTXnNi96YqC9aRzZxmXcViMZg2iGXRzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4998
X-OriginatorOrg: citrix.com

On 30/08/2021 14:03, Jan Beulich wrote:
> @@ -933,7 +934,17 @@ int __init dom0_construct_pv(struct doma
>  #ifdef CONFIG_SHADOW_PAGING
>      if ( opt_dom0_shadow )
>      {
> +        bool preempted;
> +
>          printk("Switching dom0 to using shadow paging\n");
> +
> +        do {
> +            preempted =3D false;
> +            shadow_set_allocation(d, dom0_paging_pages(d, nr_pages),
> +                                  &preempted);
> +            process_pending_softirqs();
> +        } while ( preempted );

This isn't correct.=C2=A0 The shadow pool is needed even without
opt_dom0_shadow, because some downstreams have elected not to retain
upstream's security vulnerability in default setting of opt_pv_l1tf_hwdom.

Also, dom0_paging_pages() isn't a trivial calculation, so should be
called once and cached.

~Andrew


