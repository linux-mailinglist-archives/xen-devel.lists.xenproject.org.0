Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BADC94F1083
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 10:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298226.507960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbHm0-0006Um-H7; Mon, 04 Apr 2022 08:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298226.507960; Mon, 04 Apr 2022 08:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbHm0-0006SO-D7; Mon, 04 Apr 2022 08:09:16 +0000
Received: by outflank-mailman (input) for mailman id 298226;
 Mon, 04 Apr 2022 08:09:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Zjy=UO=citrix.com=prvs=08688decb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbHly-0006SI-MN
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 08:09:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81fd16b7-b3ee-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 10:09:12 +0200 (CEST)
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
X-Inumbo-ID: 81fd16b7-b3ee-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649059752;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cdIAPN+nRF5O99z1sn39pPL7CQ56ABTaFP3lE5Tv4eI=;
  b=hi2FhSZwgPzeKcSvRyjLRHl6sDdoUovT6wJ2j4Tez06TT4cyAMiRSm7L
   ycZ/tcLfbsHcMT4hFvN9M6b5yhGVmXiTe4uzDnNRSAkYBxHey7PkTsqVg
   dIkx++XlNwJtDeQ+wl7X6SHptGELSuZnxRMzKncl4D45KcKW0Tw1FBYhJ
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67916570
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mnsItKy9g2QJXdI1jJV6t+fXxirEfRIJ4+MujC+fZmUNrF6WrkVRm
 2YaCj/XM/bYNmDzfI0lYNu280MDvJbRn4dqHgM5+CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02YPhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6pyUVgELF/33qM8EEAN+IjFubKBP5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2J8fRKiDO
 JJxhTxHZjvSTiBjfWcuApMsneeB3UXAfgF8gQfAzUYwyzeKl1EguFT3C/LOcduWWYNZl1iZv
 Urd423jBhgQct2YoRKH+3SgnP7Sngv0XYsTEPuz8fsCqFGcymEcEhQ+SUqwof7/jFW3Hd1YN
 SQ8+DcqrKU03FymSJ/6RRLQiHKcpRsdR9p4GvU38h2Q0bHT5xuFB28CVXhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsFFVfpYO5+cdq00yJHo0L/LOJYsPdRjHU3
 DaohXgFt54KztQt5rWrrF3OnGf5znTWdTId6gLSV2Ojywp2Yo+5eoClgWTmAeZ8wJWxFQfY4
 iVd8ySKxKVXVMzWynTRKAkYNOvxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOxFCbxBUOUS9joYyjP8UQGPY64PhwzRoATCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoG7ZFi+d3m3xlmT+7qXXHI/KPi+f2iJm9E+ltDbdzRrphsPPsTPv9r
 b6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5c/SwJ3GSI/QDtJI6aImdsJItU594wIxrag1
 izsASdwlQug7UAr3C3XMxiPnpu0Bs0hxZ/6VARxVWuVN48LOt3wvP9GJ8JoJdHKNoVLlJZJc
 hXMQO3ZatxnQTXb4TUNK577qY1pbhOwggySeSGiZVACk1RIHlChFgPMFuc3yBQzMw==
IronPort-HdrOrdr: A9a23:ln87/qsCbU8Jnn4d+QsrXPK77skCkoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmH56VNN1xMvdfNVa9NC4kEFjiaGgPR5t3c04klfbMkcEIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.90,233,1643691600"; 
   d="scan'208";a="67916570"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aa45ssHW/oFA8rrzpDvfb4+mLQQ/FmHNuIvLXgBTKmBJLQ6dhMznN4nm2uCkO58MoX/lk/w3abnTU9V2XOX2wcD82xOaDOY4B8Gog42NnlBRQN5YdOU5YUPdn/7AGRMDqf1jK5r/Z+jrpWNqkxVCLuj3BWTO55nDlvjpaXUT535ZhG2/4Z2TSsnR3TIvQs9bI4ivnp8POWpH5VlQacLU9JqYQXQIKStdYLLZexDEUA2NzqFYTUGlKrpQ0P0UDR0muSzq4j15jhvAZ8ecYHG5rBm/3wmrK2mV650XQBZ1RX+YtxNk35zefgq1RsjYmC7iBnrpc1LYcR3y8GVP/4abnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPHxqm4vhRWgFvqFN43iPqVfvXcxfZjq+Puv8C3Oo60=;
 b=iLrf0hXhC+3AMgud0T5Ms4rA/inP6UXZ0OVphgX4vrA7ZUT3hsGCiXgm4H32CYyPPvVt0vYn08eMCvTE7wmaaLS1yPD9rpRXiJ9wBsoiUbY95Uuc522vdKlHCSnIGysKQOD2pyaBw4D0FfF0Bh4vflHhgwUDeyv4mE4j/0S3mggxqisDRJ7iCB2agEtNoM2dtl4Hpd0yN1Yv6XgVfkJ9zxNUFTInWhb0UnJZ3a12zlfklXT59Q1KZ7Q/5Uq6n4xtFl6HRy2ssIPJB35n27eDRqEF9rDV3v+W/7Kfrpy3g988UmUptK0ApwKrdNMCxt84Tamj8jSMZ9ttfqfFlb4Puw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPHxqm4vhRWgFvqFN43iPqVfvXcxfZjq+Puv8C3Oo60=;
 b=QDNnzlGS0VFf2ar0rHz7Jk3X5KSLeTky4Ee327tQAYrWepnkk1eKOomJcYRXMg1xHKuxw39Q6Zl9PE4xFWDvt5EHbsIKSlqcPdXe7elCop/H2JM2VF/Zd1387KuJuJ4ViI+LuHDPOrhLBHHVegJ6L9OL98WUX3ujSulXC3m5IPo=
Date: Mon, 4 Apr 2022 10:08:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>, <scott.davis@starlab.io>,
	<jandryuk@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Message-ID: <Ykqnj/7gEc8Omsvr@Air-de-Roger>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <YkWgXhFVq/fD72CB@Air-de-Roger>
 <90fd48a1-446b-fb7d-a732-d2c1ede0921b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90fd48a1-446b-fb7d-a732-d2c1ede0921b@xen.org>
X-ClientProxiedBy: MR2P264CA0151.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1916376c-d78f-4f8e-c871-08da16125c17
X-MS-TrafficTypeDiagnostic: BN7PR03MB3713:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3713571790CC049D47652D478FE59@BN7PR03MB3713.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LfEe9UFzCyAESBUvrjFSTrd52t+fhY+6PtwpG0HXThF9ncQIrIwXU7qM2Yxe1i1thBdylfOazBFfB/Z4iD62qw48rxWoF9RZzatLIDrWzQKDnu3stSWm8PdA01Mq1WjsIl3HcuY7cPVn6xz706xx01FceobjJuw0w1Au7gOwUnz9gSfieM3sXo2LNA8XmKfQ3eHq7MteMX5lU+zfv3drCcOg87lRlk9hXVzLDYaI0W7yylTYysFQZFORQ8QfM/9QvYyFB8cgqz7HFSOXp+rVGcZnyiPFGkvCyo8nCgsa/8hNbF6ozPKy0wCIWQjVMvBiHGaYa2DPIEufe7UFks9S0QydqD4o1WQPWbJs5JmHUSNKBvrCTBGtMQPk22qrgiCONGt41OasQA+oB8PEwSviv8k059aq4/EVrkb96N5dQ2hlyk/JKXt8B3AQUejj3nZEkuDEC4bbAdPDZhr/azApVExYEJdOkD/O/tcvxK0no+pmKz5iDkty3FyZ1qLj7OCecUQ5ab1bCG72H+xKUe3C4moWCYDc7KcGhvjqpcLHaSuDkIrU7FZHXOEdMdSBCEBEVmQu0foAhJsyQU886TCJRx1RItP/oUWC9svA5mXJ7WXBCTmEVr/o3YFXiZ4BLH+rAVwwH68VhYpjZ3ePaRR9rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(186003)(26005)(86362001)(9686003)(6512007)(82960400001)(6506007)(53546011)(6666004)(38100700002)(83380400001)(4326008)(66946007)(8936002)(33716001)(8676002)(5660300002)(85182001)(66476007)(66556008)(316002)(6916009)(54906003)(508600001)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkMzeTYvMUljS3N3WGRtUG11T3Fmc05VS3hyaDljcHdRVHJHY0gyNzQxQ2Qw?=
 =?utf-8?B?WENJcUNlZXVzTHJBTWNZekxMWUw0WDdURCtDQWw1S2lLMTY0RXF4eTIrRGsr?=
 =?utf-8?B?OUFEUnpGbHBubFNUT2lmUzFXcThyOGxOWTd5Vjg5eDREVWVqbjdGczVjdms2?=
 =?utf-8?B?Rlg1QVlUMGZPMUpBY0lwckcvcG9MOVY0ZUQrbE9lVVFyMTFmTUNlL0FiRmE1?=
 =?utf-8?B?Ni9KRXVoL2pIelllZW9MdURhRVFqcm9VaUlYUnRVK2dOYTB5eWUxUEREdzBH?=
 =?utf-8?B?QmdURHRPaTNhS0c0ekpCUjI3RFB1bnovZkNVTk1oZEJtckNZVXBOaCt0d09q?=
 =?utf-8?B?M3V3KzFkQ1lEZ2xpWmJnaGtDbTQvYnFDMmVXTXc2MnZPN1NpemVXTTJGYmFv?=
 =?utf-8?B?b0FJdHgyUkZXNmpDRStXZXpwU1VYa0RHc2NSMk1Tcyt2V0RpRlNqc042dm5S?=
 =?utf-8?B?VllmcUIyRXBJdS9HbHl1VUl0K25XWmlPUVBaZGtCWHU2cWVsRm04MEkyM01m?=
 =?utf-8?B?cmNhM1lOR3puY0RMajErenc3dWxYcEpHQXVQYWZoTjV3c0xKVEdwVGQ0T0Nn?=
 =?utf-8?B?M212NnpSVHFVVE9rckFMa2dMSVZGaVpTTVNaT2pIRjgxV0dXSWJxdGNoZVBp?=
 =?utf-8?B?czVJbGhEc0VNY1hySkkva3A0UmdDTGNZRzM4cTRxTmFoQ1Q0S0tkYVdUbHdv?=
 =?utf-8?B?aWVVdDNyYmJ0c2d6M0hxQ2ROcFFvUHlzNmkrK0NuQ1NCZmF4VnFwZTh4SFNN?=
 =?utf-8?B?SjFGRUsrN0N1V3lTSzh2M2dXSDNmcUtBZHFCd2hLOXArMXl2Ymh2NHhma2Ry?=
 =?utf-8?B?MFRrVUFvc3J1K0ZQNGM0TFc0VEZ2OVFldWlQZUMwNzBjY2FYWFBOaVpSakM1?=
 =?utf-8?B?bWJQdlpPWlVTdWlMWW4rU2laSEdVUGJjTUtMc0VkeFZoQjI3YlJpOUNlaitj?=
 =?utf-8?B?NXFTQTdYZ0d0eVdCRUtHZEFYWlJJWHhiTnRYbUxCZkxSSFcrcndyOUxJTmtE?=
 =?utf-8?B?T290ME5INDQ1YXE1M2J5L3UyV3BOdHE5a3BmWFdMbFVUdkllbVJVVjhnb05k?=
 =?utf-8?B?WXJUKzhJYXlFb0hiVTc1c0xDVFU2cE00RHhZZS9CVnZ2dU5tMEdpWkVBdUtw?=
 =?utf-8?B?UjFGMFRVdVFBTUxUTVVTeDZaZE1naVJ6ZGk5VnQraXhZSHJWNHF1VThHMTVJ?=
 =?utf-8?B?MzdLcGduOXNXTnpsSVVDeHJHMExlTVVHNzZESjNweDI4eFFOMk84T0NyU2Z3?=
 =?utf-8?B?NWQ4TkFFUTJtQlFGek01T1E1Q3J4U0JJSlBBZnRVd3pUdFZWQkdiZVF6Nld2?=
 =?utf-8?B?czVyUXk2ZnZDYlRwY0NURTRyc1pTSmRFNlpGd0sxSFQzWVB3bFJNUC9abHZj?=
 =?utf-8?B?RTVFNDNWekJZc0JTbWR4SVNXQzhTaHJhYmpjUXRKZFg5QU1kUm9DNHFjZTVE?=
 =?utf-8?B?Y01EM3J0dUpMOHNZTmN6WVQrZHpPckVSRThqM1JvL1NrdFl1RnNXYnBOWnha?=
 =?utf-8?B?NTNQMmpScnAwWDQ1N3RINzFTR3VtcU9SemRZWDNpOUs1R0VrM1VvN05CV1c4?=
 =?utf-8?B?V05ha0Q5ZjZDODZRVEFuTUVXRnBMTGFHcXJ1bmZ6U1BtS1lhNXpJV3I3ZkJ5?=
 =?utf-8?B?QlU1R0M0R3RZcVcrUFJpL0NDTUlEVi9ib3J3RHF0UGNGRUpzTTNGYmRFeDly?=
 =?utf-8?B?dXZlanZYbGF6eXNxeEJWV0RXSGdXekRTblREd2RablVnOHdvcDkxaG1DdXVB?=
 =?utf-8?B?My95eE5JOU15WlB3dFM0b1Jua3hvWDd1eVU4OW9HRWd6MExUSDdyYXNyOS91?=
 =?utf-8?B?NEFkUThxUnBYNHJ4dmc1TFV5RHE4UXIzUlU5VzhQTDZCMStFaEhQTXJLdjZk?=
 =?utf-8?B?WjRQUWNkelhpVk1tNGwyRmlLU01oTjVSL0paOXA2SFJyTFZsU28zRjVDdWVr?=
 =?utf-8?B?U244T1diUUtpRzdaUUUwbzVkamhpTEVZczNGR2k1ZEtHcExGZG85enNhcVpH?=
 =?utf-8?B?bnIrM0dROU1vOGZKN3k0T3ltMmYrREc2MTl1ei91UVN0dnlIVDZUa3p6bkZW?=
 =?utf-8?B?VEErS2o4dTFMNXFtQ20xQXJXUjRVenhEaCtrcCticUxYQXpOMUhHWXVKWU94?=
 =?utf-8?B?WVdOeW81YnVCUzVEZ2dsZmNqK0xDYjQ0OE1ycHEzbnZ4eGZBdjhIVmVnNjYr?=
 =?utf-8?B?a1lJS25HODdYUDdwSk9sSHhIL1NsTDdPVjlRTUlWZ2hPcXpYNjJQRmcxTkhG?=
 =?utf-8?B?dStYSTJOSW1IVFZaL3VuU2orRTJzRUFHNmxkWHRmZmpLdU8zeXB4cFkwQVZz?=
 =?utf-8?B?THp0cEh2a0lvV0FlcldWS1pGNGhWR0lwWDExTnVtY0hYTi9CU2Y3Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1916376c-d78f-4f8e-c871-08da16125c17
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 08:08:53.9286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: za/Ieshjyqso5v7QIKbNDHoH9JKPGhE8tDlM36k2BmWqCknKcMv3FN2Eo1lmShAwQ1Ij3+2CwrFWLTCgiiAM4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3713
X-OriginatorOrg: citrix.com

On Fri, Apr 01, 2022 at 06:52:46PM +0100, Julien Grall wrote:
> Hi,
> 
> On 31/03/2022 13:36, Roger Pau Monné wrote:
> > On Wed, Mar 30, 2022 at 07:05:48PM -0400, Daniel P. Smith wrote:
> > > There are now instances where internal hypervisor logic needs to make resource
> > > allocation calls that are protected by XSM checks. The internal hypervisor logic
> > > is represented a number of system domains which by designed are represented by
> > > non-privileged struct domain instances. To enable these logic blocks to
> > > function correctly but in a controlled manner, this commit introduces a pair
> > > of privilege escalation and demotion functions that will make a system domain
> > > privileged and then remove that privilege.
> > > 
> > > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> > > ---
> > >   xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++
> > 
> > I'm not sure this needs to be in xsm code, AFAICT it could live in a
> > more generic file.
> > 
> > >   1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> > > index e22d6160b5..157e57151e 100644
> > > --- a/xen/include/xsm/xsm.h
> > > +++ b/xen/include/xsm/xsm.h
> > > @@ -189,6 +189,28 @@ struct xsm_operations {
> > >   #endif
> > >   };
> > > +static always_inline int xsm_elevate_priv(struct domain *d)
> > 
> > I don't think it needs to be always_inline, using just inline would be
> > fine IMO.
> > 
> > Also this needs to be __init.
> 
> Hmmm.... I thought adding __init on function defined in header was
> pointless. In particular, if the compiler decides to inline it.

Indeed, I didn't realize, thanks for pointing this out.

> In any case, I think it would be good to check that the system_state <
> SYS_state_active (could potentially be an ASSERT()) to prevent any misuse.

My preference would be to make those non-inline then I think, we could
place them in common/domain.c maybe? There's no performance reason to
have those helpers as inline.

Another option would be what Jason suggested about creating the idle
domain as privileged and then dropping the privileges before starting
any domains (ie: before setting the system as ACTIVE).

This expands the duration the idle domain context is marked as
privileged, but OTOH we don't need to add a hook to set
is_privileged.

Thanks, Roger.

