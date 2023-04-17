Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BE66E4A4E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 15:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522123.811303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPD5-0000QE-I7; Mon, 17 Apr 2023 13:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522123.811303; Mon, 17 Apr 2023 13:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPD5-0000Ns-FP; Mon, 17 Apr 2023 13:47:59 +0000
Received: by outflank-mailman (input) for mailman id 522123;
 Mon, 17 Apr 2023 13:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poPD4-0000Nm-Cs
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 13:47:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 745da973-dd26-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 15:47:56 +0200 (CEST)
Received: from mail-bn8nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 09:47:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 13:47:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 13:47:39 +0000
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
X-Inumbo-ID: 745da973-dd26-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681739276;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NY3JFoJs35jQOCuOpkTH1KXun9Wc5hi94n7FdtZee/o=;
  b=Y63Q8Ko/Z4w8bVpnF4F3O/ZnOXmrcNKQBkVtT6HGwXlx8THkDPGtu7Eq
   YcaH/9Ez+S3BriKCrnVKor45toHw3+c1YuL2lDanE5z+JoL45+330A/8R
   GM+q3gVn+PnqDY7nj7XmrxK97mKFZx5p0sK32uB0+S9bHG0K5xbJbrEEh
   0=;
X-IronPort-RemoteIP: 104.47.74.45
X-IronPort-MID: 104591562
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:e62lTa1jaODdtxOxjPbD5Utwkn2cJEfYwER7XKvMYLTBsI5bp2AOm
 2pKWj+DP/2CZTSjco9wPISypkkOuJ/QzYUyHgdvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBnOqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGWhj/
 8xEEDwxSB2HlsPs24O/E9thmZF2RCXrFNt3VnBI6xj8Vapja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxovy6PkWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHunBdNLSePinhJsqEWI/HUKUB8Sb3ym/+bkunTlUYIBO
 UNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9SnWb7L6Y6yyzPSs9KnULbisJCwAC5rHLu5ovhxjCStJiFq+djdDvHzz0h
 TeQo0AWhagXjMMN/7W2+xbAmT3EjqbOSgk59wDGRFWP5wlyZJOmT4Gw4F2d5vFFRK6TQ0Odp
 nECl46b5foXEJCWvCWXRaMGG7TBz+mBGC3RhxhoBZZJyti203uqfIQV6jcuIk5sapoAYWWxP
 BKVvh5N7phOOnfsdbVwf4+6F8Uty+7nCMjhUffXKNFJZ/CdaTO6wc2nXmbIt0iFraTmufxX1
 UuzGSp0MUsnNA==
IronPort-HdrOrdr: A9a23:0K075aEJ+MzeE86DpLqEI8eALOsnbusQ8zAXPiFKOHlom6mj/P
 xG88526faZslkssQgb6KG90cq7MBHhHPxOgbX5Zo3SODUO0VHAROsO0WKF+VPd8kbFh41gPM
 lbEpSWAueAa2STqq7BkXHIaKdbsaS62ZHtpsPXz3JgVmhRGt5dBn9Ce3qm+pMffng+OXIAfK
 DsmPavDADQCUj/Kv7LYUU4Yw==
X-Talos-CUID: 9a23:WhXF+2Fbw73epHWXqmJ//WMeKpwdfkH7wXPBAhWjOGIwerCKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AVlqgyg2VTyn3qEJ75kBKZOWvgjUj+7+UEVlVk5E?=
 =?us-ascii?q?8nNTaKnFAAWyX3GqlTdpy?=
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="104591562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbQbWT7eYiEd9Z2v4EP9D5SknqhP7me/y2s1yIkGTTNKkuG9oJ8Xg5hEccq6KHVykKdGSGzBW9ZIcKWLhnSBtDAUuLJbsuK+rkNHdy3bdg6vmRN7QpHM1/Hi8jMSMOIA3M6krNMdtnEZH6wCtyFmVh3DCkIMurZNJcqpNIbFG+Z1qtBQ2IDdp1Bz38rdjINdfi3X7CcBd+wW5AfjUf6R5Vabpwpmvhca337lc7OVqwIzINH4RgRVFi9CoWhnF8UMwFtHopiKkE683FxKkJtauFCeI7lcJbgkaC4LQDafZIVrTStwmWztdbfFzISW0LpHZU0UAUi1S9lk6cyXo/xwvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQp5LWwPfngv0IeLask3X6cTOeI2qHYy5LfM7Q0wmsI=;
 b=CDlXF/a1AgGoybUfyjbDKzKSduqFEDsFTx7kXZT+0AYuOVMPoDdktMmlGllgUv5VX9sxUS/TbhPykmPiopXx3t5ja4j/QojzsqPNVFGcjAM+HSeQcX6CRlvYmWY57QpCv0S9sWXjyWVtTJhCE1TtGi3L/2rFR1dNQUAh263PkU0XsZqufoHvIjN0nQi27WuXEbsM0dT+eMWRAPP86qJ79IN3SwnTFQN8XDpaf9fYt+n7uQsPZCzSMHQR3clMN7X8IOP3WHeYiPf3T+/cqso/TZ6HBgU4968EpVNtwTzWzKOaLWuPHlFGaN1WB96RcrQn6J5+ubtFi9Ucz0dyJ1oypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQp5LWwPfngv0IeLask3X6cTOeI2qHYy5LfM7Q0wmsI=;
 b=MdF4WEmDViKp5OQaqLToZ1FGN1a3/IqaOu5eAO0LfWWTVq7l4uO/qZVvPF4sgnGyUVwC5aw1MFXWJyEwnqKptsU5VnX2F5zrliKUviKYG0gU6DO9/HMPn3qQoBhlnwZ5bwpR+GWh1oBv1bWIGnfKCKWPPhij/6aIuB5IEYMgDrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <639a5440-8408-d6c8-4d6f-68e5f7857d2c@citrix.com>
Date: Mon, 17 Apr 2023 14:47:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] xen/ELF: Fix ELF32 PRI formatters
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
 <20230417121357.3738919-2-andrew.cooper3@citrix.com>
 <0a94cc73-f99b-a616-d342-8d84e8a274b4@suse.com>
In-Reply-To: <0a94cc73-f99b-a616-d342-8d84e8a274b4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: 251c67a1-4f43-4424-bf0a-08db3f4a4f1d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oyNx8T+hKeGST/EdLye1JriSAFnKcUROM3/wpWh2k+HY9MOvkGvDVf7/KWcroG3uYgFuFKFezrKI8p63E43IiV8hExToGL5X5BCMfJy7b1ssJiMfYpIKg/mlRHwHMc18B+CxmSHMDQ6UKdWVz+mupQ36qxZEZpVsV+JPWtPKnrW7d9nPjXQTicAT40fzl+sO6euKDlIsk/w/9DjoSVVmjIYDowqMfxvuHMhtzm56EHA9p3Gqy2z7NiglfCSgP/QQp4Ci+bCxo+kW9EtIIWBmVT1usHZMGAOJ0d6t9x9nYp4IfDU5c1PQEXpGHQZf275hinvKlc1g3UoHuk27gDhoCgzYUgWg/A0n+wH2F1Dj/M1JdQFTY6NNUzrC83OA0PYUeRmkGfLzyo/LJGdddjk+wgH2QSy62XMcweatXzesaj1/qOcHyF0B30zKO8SmNKoXxWt31Yq0WQUhnb5nz++SlSZP1FC2Et0iqyiqTErYDVPC9d/eCDoVr4B4CE+JIJt4SzuTSvh0yRUOGu9U1xdmqpA1u/kZp5CG2QDNtHD+Dbe3cLP3R6JrErjzlfFgEYw+UWc/6gVldwTmi3K9z+f9uMkb/KCPCWZI7sfYSPzIjOuXMJPhf7djdJf2vRf43b7wy4ngAx24FeetLQc5vIeHBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(6486002)(6666004)(86362001)(478600001)(31696002)(110136005)(2616005)(36756003)(26005)(6506007)(186003)(53546011)(6512007)(82960400001)(38100700002)(66946007)(66476007)(66556008)(316002)(2906002)(4326008)(8936002)(8676002)(5660300002)(7416002)(31686004)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVkzL2M1ZzBpNlBnMmhWNlIydEFCVGw3VWRGVzhqUG01cUloMTEvL2tRR0FX?=
 =?utf-8?B?UG1jdTUxUS9hNDVZMUdIMHRvb0c2eHBLUmpKRG8zazNibFYyWlRGTk5Kd2JC?=
 =?utf-8?B?SEk2OWpCdWdmNjJDQTNDTjlIc0ViSjNCN2FXd2xqWlRXNDhWRUJNNlgwTllQ?=
 =?utf-8?B?eE9xdkZ1M2R6Zzk3K3N2aU9PdFFodTIzYjhxUEFmRU11MUFQSTNJRDZIVEZv?=
 =?utf-8?B?RlBoZXRiQnNzaHd2cHI2V1BrVk9ybnhGMXVCenFsc0EwSTRHMjJYdDR5aVhi?=
 =?utf-8?B?b0F2b1lSeElyRE4vN1NlWC9UeDc0ckh6WUk4ZzdWYVZKQ1lsV2ovcVZYdVh3?=
 =?utf-8?B?b0Y5a3NaaGo4aE80WU5XTmNraEMwaUVqVEM5aXN0S3AvSHZFN2JMLzlSNi9s?=
 =?utf-8?B?VlpWSnVlQWFiSlVJbEJ5UDY1a044U3V6RjBrMnJxazJ0VGd6M05qTHdlRk5l?=
 =?utf-8?B?SEpzN0pRU0cwaGVrYVhqbEJ2a0JTZE1UekhIWlZnRnd1QUIxc2c2VnlVQU95?=
 =?utf-8?B?R29JUmw3TEhQU3l2TldRZVhiTzdnY0hXSDdVWVZDRFRYVVFjdnk1bTNhY05y?=
 =?utf-8?B?aEYxR0pyRFY5ZUdnTzJOVnZDZ08zSm9VRFpjWE5kQnY0Ky9Uc0tyTkRNRUk5?=
 =?utf-8?B?bWc5TjQydXRTY3h3YVIrTlVEa1RIODB5Ym9KR0swcXdmQ3djOE1TaU9EMitT?=
 =?utf-8?B?eVJpUXZBUEllUE1UT0R6QTA5azhKVW44Q3ZHVmlRQVRDV0k3OWdkaExBd25C?=
 =?utf-8?B?MzVWVVBNYnRTUU1Ha01aKzU0U0o3dnkxcVMwajVGWlJRRVVJRUFGSVhPekxF?=
 =?utf-8?B?cll0dDJEWVg0TWFLVnI3RjQzUURHWXpCNWRmUFhPOHNGR3YrNExOUjVFVGpn?=
 =?utf-8?B?ZFFyUUgrL25iOXZRdmJLRzAwbWVWZFl2eTVjUDlYbzdsUktwQnJqVlNwcFRL?=
 =?utf-8?B?SnFwaGdEc1BlQkNhR2FuMlA0bnNUdmY0enJmWWRodkxCTERRaENjZVlsTGRp?=
 =?utf-8?B?MnBvbUFRKzJma0pQSDVrLzQyWEdyUlNMTUhQLytmczFkUENwdnRLN0tBL1V4?=
 =?utf-8?B?Z0R5c0NJYnljbHk0T1pkSEIvZTVXR3J2VlhpcGZSQWJhbjYxMVc4dUdpZGJK?=
 =?utf-8?B?TFVTaFplRkt3UFBnb004MGx1NnRqU2hnOFN0Z2F1NUZTRkQ1dE1ycmMzMG1w?=
 =?utf-8?B?M3d0SnZLVFpvL1JxVW1QbmhBQ3FzOGMwTzA1U25vSmIvZG1IQ2VYc3EzR2Js?=
 =?utf-8?B?anNjMTFXSDcvSlVvaFRlZkFDQUlEMk9RM0ZBdndyUTFEbkdaZXJRM3AvRjRa?=
 =?utf-8?B?Q2NoNVF4VXFaWW1zZUMzSnJHaVpyNFl3SVF6bjRLd21iQmhXVTRMRC80UmNy?=
 =?utf-8?B?bzdQc25nY2RxUnlIZWxyZmY2L2JBZU8vbm5WS2tna2srcUY0QW5PSnVrU1pl?=
 =?utf-8?B?VUhPNUpLRFNCclQrdnNMeXozR1NSWWtOVm5WOUFJTm1BaURCKzcvcjh5Q3ky?=
 =?utf-8?B?cW5vbUFnYnAyWCtuWVh0SjJTaFJEQzd4MHI4enJXNVJCR0hyNFR2dSs4N3NO?=
 =?utf-8?B?OVVnU0ZMeGVVM2RPVGVIamFxZkJsbldaZnlrVTFPNTRyb1RVcHBGVnNVakV3?=
 =?utf-8?B?WnYxWm1VZzEwYkxUczZwU1UrQzIxNGoweVdvZVFxY2tkeWRnRElmTU5QK0R0?=
 =?utf-8?B?R1JiVy9TRTh2T0drNm5WL2JnSWJ3emJZcW41UjMwam05QVY0cTFZWkdHQnRN?=
 =?utf-8?B?c25KNGhWckFsalNNdjBZSUFDdlVXMEJ3Tm5Tb1BmRGJXZzByb0YyQUM0bkVa?=
 =?utf-8?B?dVhlc1o4VTk5dmMxeFJsWjc3OFRDYm8wUGtPM3Z1TXpEOFpGMjIzcEs2Zmph?=
 =?utf-8?B?a01LT3J1WktNd1BHMG5rQzU5YW1VMEFFZHE2cGNrdGw0YWM5WHcrRmFJT0dP?=
 =?utf-8?B?VUYrWThudFY2TEh6K2k1TGNabWI1NEdVS0x6VnlreDBTU1JGRnZNbjFPTUlG?=
 =?utf-8?B?MndDeGZ5VnNSclc2SFd1RW9WbDhNYTdsRTNKbWdUTjNDZmZGaVQ3R1p5VldU?=
 =?utf-8?B?aGQ3R3hkdjNSaVNXMVUzcTRaS1IyKzFKQnJJaWFnQUpuTWg4dWZNQ3BvaXRL?=
 =?utf-8?B?azdHN25wc2oxVFRFUHdSZ0ZvdTgxU2pmU3NXN05kY2VaUDBOYUhzTFdlQ0VZ?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O7/qvRr1+H9CMzHYxDJPEhZsJSPxHcIaoy9e7Wu5Q9hoPDVzWRRYnpc1U8nXpHg9jLw5pJfeKYzIcf2F1clc5ZZ5NfeCH2rJXKGdSsLboT87hFLDr2ZieyxatV6XUbvHWZT/Ym0reLHBhFXJO+bxeRCQE0w9e3RGyDxSoyIgm2gNU368tgtIF3V3CYNGej6ZrZw7GurItwuGL1344QI0cUA+YhARP1rUpzUanxtoCBcT03Es5S+oCy3iUEq732zvnIrLzQIqMEhTkqLuO1Q93sHi9InEggtJQHvru5t18hzHqtp9QWTvdNXcYBbeflSz2TZ6aDDwO2nhRIcm8aEapwTaZfpvia0yibQWtoPAjSYhiRrEcE8zd31eZF9z2vgedG6zoAlq75dZN6LK6qjoAQV0hPfl4Gco8l6OvKRDQZBmCO0ayvYv9ltxRYf7CVqIKfIy2GJwQsER4AVGFZkAudwt5KjAbbRHeFGyUY648ki7DMh8U2sV5wL84IWLWQY2L2Exsb5OgPf1/fXIziDV6FH4FBsO/hj9wZ88C2zabFTPXN3AThv/+6EDhXrkizU4gTOF7reRHBp8z41ogJ6MF9+XCfnXG0fakckXI3awDz0A8olo0qvq3IntiiUU+XFfCV5toRryqmOCh+s3q/zSaGPTacyPkove/hfFf4ire9oXiULTBkXZZp7MpkCy5B2zbAelRChqs+pknlHb27007H4vhRkSl4jI0lunQ7Xw29ou2tib3TjcXeg2Vw/WMVX8tMymcFN/aInrRLzQVr0mxdI16kK3ObOAT94cOum4o82mGoT7RHTh7YMeeMWfYPNFGYOe31X+lvZDVVR/r/KTrBKpRMYJ/3GlqpFBbXSErJ2cGE4rgJnk0y7GBGIXwxzkAx4gPfadMnuHEdwAsoYgmiZO65OAKA+V96vS5+vyB1k=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251c67a1-4f43-4424-bf0a-08db3f4a4f1d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 13:47:39.2979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffTmkc9Y7X2GyPISrxC1AM+d8wSOr9LtCk9FD5bDXT7vfSUiTJriGUjuSrVdbYbcdESmoN18YyoyJ1kwEHkSBLIRyCtJZWbB8kLfMj95N+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5405

On 17/04/2023 1:31 pm, Jan Beulich wrote:
> On 17.04.2023 14:13, Andrew Cooper wrote:
>> --- a/xen/common/livepatch_elf.c
>> +++ b/xen/common/livepatch_elf.c
>> @@ -310,12 +310,12 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>>                      break;
>>                  }
>>              }
>> -            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Undefined symbol resolved: %s => %#"PRIxElfAddr"\n",
>> +            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Undefined symbol resolved: %s => 0x%08"PRIxElfAddr"\n",
> I don't see what's wrong with using %# here (and below); I also don't see
> what value it has to zero-pad to 8 digits when the printed value either
> is far below 4G (when representing just a section offset) or likely far
> above (when representing a real address on 64-bit). But once again I'll
> leave judging to the maintainers.

Hmm - I could be persuaded to drop everything in livepatch_elf.c.  I
guess that makes it more consistent with the 64bit side too.

Ross?

>
>>                      elf->name, elf->sym[i].name, st_value);
>>              break;
>>  
>>          case SHN_ABS:
>> -            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Absolute symbol: %s => %#"PRIxElfAddr"\n",
>> +            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Absolute symbol: %s => 0x%08"PRIxElfAddr"\n",
>>                      elf->name, elf->sym[i].name, sym->st_value);
>>              break;
>>  
>> @@ -344,7 +344,7 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
>>  
>>              st_value += (unsigned long)elf->sec[idx].load_addr;
>>              if ( elf->sym[i].name )
>> -                dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Symbol resolved: %s => %#"PRIxElfAddr" (%s)\n",
>> +                dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Symbol resolved: %s => 0x%08"PRIxElfAddr" (%s)\n",
>>                         elf->name, elf->sym[i].name,
>>                         st_value, elf->sec[idx].name);
>>          }
>> diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
>> index 06e6f87c3d80..3124469faeb4 100644
>> --- a/xen/include/xen/elfstructs.h
>> +++ b/xen/include/xen/elfstructs.h
>> @@ -561,8 +561,8 @@ typedef struct {
>>  #endif
>>  
>>  #if defined(ELFSIZE) && (ELFSIZE == 32)
>> -#define PRIxElfAddr	"08x"
>> -#define PRIuElfWord	"8u"
>> +#define PRIxElfAddr 	PRIx32
>> +#define PRIuElfWord 	PRIu32
>>  
>>  #define Elf_Ehdr	Elf32_Ehdr
>>  #define Elf_Phdr	Elf32_Phdr
> This part certainly
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

