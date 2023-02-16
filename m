Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B47E69922A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 11:49:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496453.767209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSbp6-0008Pp-84; Thu, 16 Feb 2023 10:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496453.767209; Thu, 16 Feb 2023 10:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSbp6-0008NA-52; Thu, 16 Feb 2023 10:49:08 +0000
Received: by outflank-mailman (input) for mailman id 496453;
 Thu, 16 Feb 2023 10:49:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSbp5-0008M6-0H
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 10:49:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86f83e5d-ade7-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 11:49:04 +0100 (CET)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 05:49:01 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5743.namprd03.prod.outlook.com (2603:10b6:a03:2d1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 10:48:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 10:48:59 +0000
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
X-Inumbo-ID: 86f83e5d-ade7-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676544544;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WXk6Uur3p3AJ4j14EfUFnYdVKCbXYla0NYaz1xwPtFQ=;
  b=cItaGQVUw4gLSlZEcEfE/hgJI6JbVtqOB5Uxpy84ow4w4lnwiuFnClbl
   ocUF+rXOKmIVvVz4Mj4jH/wcZsV78a0cs9c45xOuM/4tnvfuxT76PqSLP
   fXW4xu4KzT07xC+Zdl2Kj00tiTP1aIxknVpxosTx7xyDjsbfS/qUJ6dzN
   s=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 97289149
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pKaLKKgbVdVHP4Fll3ULIFlMX161jhEKZh0ujC45NGQN5FlHY01je
 htvCDuEPavfZ2D8KY8kaY6z8U0B6pOEmIAwSwRvrys2EiIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gaAzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQbGBpTUzGbt9ukxfXqVtBM3Z8ELOTSadZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGyaLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ReLipq8z3Az7Kmo7LE1PRWCakNCClRS+ecJRB
 BA69hZ2sv1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xAWwJTSVAaZolqdUxTjwp0
 XeGmtroAXpkt7j9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRnvx
 xiaoS54gK8c5eYb2qP+8V3ZjjaEopnSUhVz9gjRRnii7A5yeMiifYPA1LTAxfNJLYLcQlzfu
 nEBwpGa9LpXUsnLkzGRSuIQGr3v/+yCLDDXnV9oGd8m6iip/HmgO4tX5VmSOXtUDyrNQhexC
 Ge7hO+bzMQ70KeCBUOvX7+MNg==
IronPort-HdrOrdr: A9a23:r2VtRaiOK+esZ0OfEa7EiLVCvHBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="97289149"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgMsw6pv6ggkG5VZAUnHRc7JjkB45gN8gtuBL7gHqTG9ko5Ciqs3vAlu2OEVWyk1xVauTym4gvG/RhtOSobltZrm0wX34VL0QSa53xqFzekjcpKtA7CMkAeC7J7iK8ZEF7aAZWy2xvwbqWafF3UK03toiidmlu9fxIL4Lvutk+bsMxhAZc5GJM0STJ7fsBbLo2e8t9pROnJlc+ROCh4yN6vQjJUzO/NUGkTluIk+XA8g+bHYMQ0ARNsBMovqMOYJLkzLvYulWqIFhp2RyuuePRN25NSCveEIOcSiZp1KPjEAWNnMgSHvRtPwmf6tTo6GCGBfACT31mlfKwzjXdL4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qACx1sSZULQN2eFk3PB9pvE75HPEj9a8g9ahs0ba3sE=;
 b=bT1T5FvvUmuzSCKm/Vh4ysmlSSOqqtvnyENx81M4cPu6tFRA3y54L5t7ISBRrgzgbgiyt2vRYDNPNTMRbCRz9h3lA7YggTFnSYDDrCu5X8dXY4IwZ+ZFOfs8LHUQ7hcnR+Lq9yTPkoHYVuFfbUIZnVCsO6qaghPLltNVXADULW5tvjyg/WUaIGTl9sp13Gi6rRbwzL/fOUmI84wE3nO+aJSwaCs0iuBN/ZVfkzP/mOK17oQlOeeU8XA738hLZX/eCDS22TUxcYKUT0kzvO9RNZxaMsA3z2kOs21DENQI7Zd59aQQts0uJqSiTCKhXGL2xI04H0d5CYMnp+44IQdIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qACx1sSZULQN2eFk3PB9pvE75HPEj9a8g9ahs0ba3sE=;
 b=P2CenKQLk+96462o89uaZLTfco581aMS8eicluYaUxXqyvPEeHmlNXbVrCLR8cuKvD8kz22/xzmc28M/HiYjmNxYX8R2CMreDGjIOxCZwB8Rf2bwCOfEZapR7vAZH3PazOkK9BmXQ08yoRfIztfEAvVeTlWKWfvF+JPx/QWqFYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <068340c3-2a2f-4bd0-20e9-f1dd6fe4bc2b@citrix.com>
Date: Thu, 16 Feb 2023 10:48:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
 <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
 <00abbda808239ab74cb6c954b33e34380ac4e41e.camel@gmail.com>
 <5f6d7b8e-907b-d3eb-335c-8d4a77edf526@suse.com>
In-Reply-To: <5f6d7b8e-907b-d3eb-335c-8d4a77edf526@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0626.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5743:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf8ebe2-3aeb-4673-6932-08db100b68a5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BmNYVA5Frr6l7z57KjHS/5XyolL/39p90V7ddIBOWOKqIFa6xkPg/QC3A8HRjx7PSaV55319EfBdNmTtBT9G6GtXJtlISfoViyTz+LHD3x5VFYfhO5KXoy2FRZVlGETy//xUz+cSueclkCzbZsfoCeMrOzRk9/ushAmGzy2OD2K6yxPYx4CaVVcmsX1DI3ZArSY8SY6fVMRoOkjWEidWKUdYUaygMbn9hZ05k4FMEY4seLpS+zYnoCmPdaOmGjpMTDI6W5MbqXuAf482QwkRDHumQrePxWRYQhInl+OFuZ2VXuYUgW6Uyepw3slnQ/br7i7nRxu7jQbvyXvU7oiynu0rPzNRaC/ECLVRTGaVHGSjzp7Oc0ipMNizDkxUxhaUuCaX4ONc3r5ubuIkMOYpwWobg7H8UEMRiTexD65M0++DlchdNIvG84x6IZmctW3jFmZu6DE0oUiP7PA9SwTxC+Ucl/KuuaWGAyJbPlaK0ilNWd7lrkzpoE2mhEjuLst3x4BWO+smuVMRp/ysCfstYGn/DERDf7zpgnK85K4O33dS5O1F7OsEcJVgoUZ/TEXGiuRhrHd6zlcKCxiJIIFtRBiUIkEGQcNSHG6nY3lXqXmpF+pnHEE5d4+ZxwbTXF3nr1AWumvUEp3XSlgEMCpB6ERF2yQtKApmE1hI8Lc/2/ADWe/jWdkBq1AVzuOeRaaD9sKn46JcfpPVVNn3UszvYDB90biCJMoQDCfUU4WZgaudhtRD4QkdNK8avemOn6eZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199018)(31686004)(31696002)(36756003)(86362001)(2906002)(5660300002)(8936002)(82960400001)(38100700002)(4326008)(8676002)(66946007)(66556008)(66476007)(110136005)(54906003)(6486002)(6512007)(186003)(26005)(41300700001)(53546011)(6506007)(478600001)(2616005)(316002)(6666004)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWE5dzdEbEhEMVFmWjNjdUlCZGFqZkVlR0ZEQTV2UEcrY053QTVwTkRPbGNj?=
 =?utf-8?B?Mkg5S1I3NkdzRitSTlFpcnZxWTFIVENPdGVWazBISGs5ZEpkZXE5YWdySzRT?=
 =?utf-8?B?bXhaQWRsRjdCSzUxZlJmeHFkTUhuMkJOKzFUM0MzYWxCOG83MzZzeDZiU3Fo?=
 =?utf-8?B?N3J5anRySHVnMFJtS0diZ3k2cXV2OCtsSlIxemlFR3RtVERJVys4R1FQOVEy?=
 =?utf-8?B?UkdjcFMwenllMExOU1ZCSGZlSUM5TTVOME5ZcE95RUFQK20xUDZBdjZpRzFV?=
 =?utf-8?B?ZXFobzRxRVBKRlFEV1g5UFh5YVVVZmVRZENuMUhzbFk5aElvVG9BOU1GS2pB?=
 =?utf-8?B?aHVkRFVwVFJwaEZUZVV1SkU5d2xINExvaHhveXpNVzdDSEVIUEpxQnN2ckhn?=
 =?utf-8?B?WU9nR295M0VDSmtsaHVQcnoxVkl0NmhqNDNuVEw4VWhzVnQ5NXF1OGFOMndJ?=
 =?utf-8?B?dmZGbTdGMUJ0bnB0Zng5S1NDNkc0aUNlRFdqWkhldEFpcGhjNENHcWZReU9n?=
 =?utf-8?B?d1licGlrMS9iQ3F5RDhvUUdEcHdSRzhXak9KeTNGMlZNYitNNklpYTV6STZP?=
 =?utf-8?B?UGU2elVYOVZnWmFWL3Nvb1RCZC9sK0VOV0hlOHROb25ia1g5RjhyakdRZkw5?=
 =?utf-8?B?MmttQ2JCMFVuUkkxTGIzTlF2ckwxYXZTZE90Q09maDdHdU1lUkx3VFo3Tkxa?=
 =?utf-8?B?aWZITmJDTmhTVjA4cENrenAzaDQ5TmR2cjdOdTRsVno1RTJZS3VHbnkvZ2NH?=
 =?utf-8?B?NVlvckFSOHlOQTV4Y2xPckF2by9odjk3aGg3c3ZwMHA3TXlJSjR1R1RJaWlU?=
 =?utf-8?B?Zmljdjc0UG53blhSa3ZCaFRxN05GWHZoNnVXNmRjb2tsWHNhK2YyMjJMQWhn?=
 =?utf-8?B?REYraHN5TTNuZ1JWdEpnbWkzMUZiNmlYaGtSbGVXV1A3VGxpSVNpMkE3QlVo?=
 =?utf-8?B?V2hqeFJDTVVDbGlzYWh5WEt5RzlyTWl6MWM1Vm9CN1NOOGI2VkFlUjJtYzNE?=
 =?utf-8?B?RzBudktkOUJ5bEZlOU0wUFFBVGxOWGkxWTJEQWYwODNyUFVTVnpvUERCd084?=
 =?utf-8?B?UEFyMm5yWGF3OEJVc0dOTUhzaDRBWG5UMmRZYmRQTXBFMEZ4VyttYU1TbTJn?=
 =?utf-8?B?dnUxOHFvYWdtVll2MUJjNVBhQ3ROcXpRcGt3L3RHL3dxRjBEKy9oVG5xMmlH?=
 =?utf-8?B?Rjd5c2g2Zys1eXMySFdpZDVVamhvRmtHdGV4TWVaZFNVY0toMzIvR2E1SDEr?=
 =?utf-8?B?UTVPU3JVc1pJOUpOT0JaaU5xRVR3c2pFZGNra1ZQYjMyYlEyYTJONXgrclN0?=
 =?utf-8?B?bDRobCtsajB6elJ0Z0dOS2lqZjhGamxOdjVQWUx3U28vOEFDalF0Y0NGZ1FX?=
 =?utf-8?B?OXlWV3d1RG8yeTc4cE5JWStOV3krYXVqTzFkemFNT3VlendyQWduZlAvK09O?=
 =?utf-8?B?ZmVreVgvSHdldnFGOVJoNTBCUkJBcWphTmVHRVR3MHZLZ0lSNEJPdzlhYVZa?=
 =?utf-8?B?VHFRMDF4a0xYSnZ6a2I0MjU0VVg4SE1vTmRZcFdVWWJFanVSWWpBQnBRQWtE?=
 =?utf-8?B?bk1IWFNheFZZQW0yQ01Wb050eERUYmxweHlPKzJHcGFSbmJCMGVXZ0lNMURR?=
 =?utf-8?B?T2tLZFN4Z2p2cDFSc016TG1EbDFqM3BkT1VxZnFjWDE4RzNSc09aRjBDcW9N?=
 =?utf-8?B?c2hHL1hGWGNHY1RhUGtreUdScVY5SDNHU2VCTm44VlkxSzRXVStCUzJKM3Zs?=
 =?utf-8?B?YU9BR2VJblJkUC8wR3plWWptVHQxQkY1WHpSUndkUzlwQ1NudmRGOElsSWV1?=
 =?utf-8?B?K2Q4OW1LcnBhY2xFVHd1T3FJcktINWtFeWRqNjEzaW00S3psMjFlaEZkblVw?=
 =?utf-8?B?NUpaL3AwK0wwaW9UVXY5UmRLalBTQVpMRGluemplYnRSazZ0SU0wUEtQWGJa?=
 =?utf-8?B?aXQvOTBaVlRNL1hTeUhlcFJDY0ZUUFNHeUdWWWR5QmNLci9hWmM1SWZzZEpy?=
 =?utf-8?B?N0U4OFdvUUV5bENIZVpUSitvOG9qU2lnUHI1c01WcW9pYS9TaFh0YnRMQ3oy?=
 =?utf-8?B?U0xtc1FVTE96Ny9LN2xLZU5IOXp5QnhXYXQ0VkQ1amJsa3ZPQkFJYlFacWlZ?=
 =?utf-8?B?Q0NvcVk4STdsQjJXUjVWSWtrMmF2ZmIxdGVGMnBxMFh6TTViODZaVFNLUWJU?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lTYIfUjohZG8TOG8xOXAPDxvFIyGKDjPiCWnFPtc3X8QEMyRVW6wsdsaE04QcoWtNOSoQsKdcEq8zxtk5kmFUlYKnKBzeDR2yhsJq7uBh0lNrz0OgWvbliEWRyynKqDtUSW2pXCgzR2TaJ4WhaX4/l3xfNd/KMhrCNHfd6vIC3nKgewcohILfYubrgFSqY5fEHMYtYCS9n952vI1wApyc81RDfrwBEKSlKY/bEIpsI1+RVg/RtwVFyvKPO8mlYGcPozKCVJ7YDq/clpR+d9am6LIm0lGZRP9s75UdgG2+IEH0VjmD3qSqzg7Vm6GbKOEobc3LcelBFg1Ekv2ZCqkS5qMXl1U2qwZy5pmb6qoji/yjiWTKil80INcAbDyRo+kjA3vpFxJLYoS/YLxN4ZRB63TG4OE4MMtQwlQdY6YEhi2bNORb0HlmezKyhNkEbn3bG+6aNvqyKuVCEu6yPR6uhlOBSdZjHcIFNFTwREy5B+y7enZIrzpitA7x1kDk6yill8lsSryDaGuwMoVXdtJKSxhExBzFEyfTzDdrRFci6domSe0l74HuCGvLe38zIN4LwhAN99nP7aEvPLC5BTt3DSEuQL9nfPBdHlpZDmZvEHXfPTYWCdT9tOrkudmvt5L13InkchRUDRtVyZqbe6B3w41auMX9Q/oanq7feYxvlstyMa+18TZZCIaMcytSI8/ZdnrHOG8ohRbJOe0QXe16lUmK9nXAao8hff83Qo4hWnwwC6iEf6AnMEklmDd3JgmC7Hl15RTILOzW+2RqUE09+7NDAlQ22FjmpS3C8ftiIrGyMsZ2IzNCzVAVdFiQ5MZF7Mat3WzcGW0cgWO+DcHUGKHfhoNg2dsxe00BApbwp059bHKnBzWLfLzdMguNMxw
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf8ebe2-3aeb-4673-6932-08db100b68a5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 10:48:59.2224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7v6dm0WTkT1OQ3XwP57SpTaPg7bal+wSMgn7RkojAw+dHntVudW63DxjnZjXNB4DbhDRwNFTP1jIbFih8tWpIwF4Q4M53FTv6plYeGMVbuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5743

On 16/02/2023 7:31 am, Jan Beulich wrote:
> On 15.02.2023 18:59, Oleksii wrote:
>> Hello Jan and community,
>>
>> I experimented and switched RISC-V to x86 implementation. All that I
>> changed in x86 implementation for RISC-V was _ASM_BUGFRAME_TEXT. Other
>> things are the same as for x86.
>>
>> For RISC-V it is fine to skip '%c' modifier so _ASM_BUGFRAME_TEXT will
>> look like:
>>
>> #define _ASM_BUGFRAME_TEXT(second_frame) \
>>     ".Lbug%=: ebreak\n"   
>>     ".pushsection .bug_frames.%[bf_type], \"a\", @progbits\n"
>>     ".p2align 2\n"
>>     ".Lfrm%=:\n"
>>     ".long (.Lbug%= - .Lfrm%=) + %[bf_line_hi]\n"
>>     ".long (%[bf_ptr] - .Lfrm%=) + %[bf_line_lo]\n"
>>     ".if " #second_frame "\n"
>>     ".long 0, %[bf_msg] - .Lfrm%=\n"
>>     ".endif\n"
>>     ".popsection\n"
> I expect this could be further abstracted such that only the actual
> instruction is arch-specific.
>
>> The only thing I am worried about is:
>>
>> #define _ASM_BUGFRAME_INFO(type, line, ptr, msg) \
>>   [bf_type] "i" (type), ...
>> because as I understand it can be an issue with 'i' modifier in case of
>> PIE. I am not sure that Xen enables PIE somewhere but still...
>> If it is not an issue then we can use x86 implementation as a generic
>> one.
> "i" is not generally an issue with PIE, it only is when the value is the
> address of a symbol. Here "type" is a constant in all cases. (Or else
> how would you express an immediate operand of an instruction in an
> asm()?)

At a guess, the problem isn't type.  It's the line number, which ends up
in a relocation.

That said, I'm not sure an architecture could reasonably function
without a generic 4-byte PC-relative relocation...

~Andrew

