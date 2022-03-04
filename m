Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B274CD3CE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 12:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284206.483408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ6U5-0002ol-Hs; Fri, 04 Mar 2022 11:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284206.483408; Fri, 04 Mar 2022 11:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ6U5-0002mv-En; Fri, 04 Mar 2022 11:52:33 +0000
Received: by outflank-mailman (input) for mailman id 284206;
 Fri, 04 Mar 2022 11:52:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVQB=TP=citrix.com=prvs=055bc9087=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nQ6U4-0002mp-0V
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 11:52:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fc0d858-9bb1-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 12:52:29 +0100 (CET)
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
X-Inumbo-ID: 8fc0d858-9bb1-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646394750;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=y48Ralyrh3stW0qN99zYGluAAU9Me+EQ6N1k1JQNq20=;
  b=OaXc35lVZy8EJ9TpesPxQUhxq5vSU7Sk+cZWAhiQZw3Lf4AGpCoxctQP
   MtRNU8hKRk9uLmNXFzSeKQ/Bb4VQkzDUVVJL5jrjDhMGiYi9CFHdK+vPr
   7nFKd6roPcm/8V4tTCMUWzchjOPGLyafrSLKanHrcHuym3/nfTuzFD7xR
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65465451
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GRO0a6unCo6M/nSUhLqdxfmtR+fnVGVeMUV32f8akzHdYApBsoF/q
 tZmKWqObPuLZDbzftFxO9nj9x4OvcXVndBhGgdl/ik0RS4T+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV5
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8bJo2d27ktayJVLAYvEpVk8brHE32W5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 pZHNGYyNXwsZTVCal0qBJkh2961oSTEfwZDo2C8pfQOtj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6C7mQ5vNsxlqJyQQ7ChQQWUGqvPqRhUu3WtYZI
 EsRkgInq6Qo+UXtVcXwQRS+qWKDlgUVXcZZFesz8ACWw+zV/26k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHgqW1GDHAxo+voAyVaActD2YHZR0BZF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdj/9tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7YaFUwYnY1RvHNEghBHVb5J+i8BxkkeC9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyKNYEUM8MpKlPclM2LWaJ29zq3+KTLuftiU
 ap3jO72VSpKYUiZ5GDeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313Db2vCgGKoNV7BQ1bchAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/8Nx7eQo
 yrkARcwJZiWrSSvFDhmo0tLMdvHdZ1+sWg6LWorO1Op0GIkeoGh8OEUcJ5fQFXt3LULISJcJ
 xXdR/i9Pw==
IronPort-HdrOrdr: A9a23:236lzqFODS93f7/opLqFCpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9dVfYF1P78rhJ1GdZU8qOuMexrwqEH3QSuvyWqOLtBzB5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.90,155,1643691600"; 
   d="scan'208";a="65465451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmS1WwhK5gqeuYax8EbU1WNZOAcvvc36kgVxsZfaia/LCJ8NY1Yau7bgicuuszeHnFthUzvQ2kYVdiwA/hclWNeORWXJP0ZFPdK6ZgcMpPtGSM4uMQJHOs/tBcaSAToShSfoSm7bMIycgHVZQtlpete5NDvVccShQ1JzeNm64Ed5l2JrdDUgrCun7mzGSWHDsL3/eALw7hy2OfEcaBZwYh0uNjINA/J5diwEgb2mA+XSSbh12h2k0F5E9OqJdLsAFOy/3sotJX/F/ix276B4K5DQ9dSahBn5C+5kq3CZFpi4Pfd1XPtSzrYMB1fKwhBhyBKsv4x5Yfrd9ydNZkrAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5SS1dHuYycuSoYehj7iJaF3D097KEM8AVMqmxjTuLI=;
 b=gqBWJOmOnOVkI/88BehHMfzh0wQ9Y5o4mty9eRN06iPS6U9/gv3mcTr7a3AKmRwOoe1asWUqIG+Sd31lKSfRTkpVwg7rKIcfeceFS3f0uTtj226ZeUAeKBsywW3JXPApbqiPLmtFgefy2w5YpzMP0ek+Ch5lIKw08vhrBf2suL+zn708FolhBKMwcxw9Po6hePJqjVDtDIdNGF8SfE9GW04MN2xCTXO/tOqjevQX5YroTpMUu+yrj8nl6DbEMpXMrDRz/CaY1tYCeObG/O/B/vGMcY/1cPr1u8mplj6IxnMbiyP1RdjZPhn23C3xn9ZzhI+empKhpL7qUVMgl1fCSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5SS1dHuYycuSoYehj7iJaF3D097KEM8AVMqmxjTuLI=;
 b=gpPDb8+ZfMmt/JXmGgbrI8M3WtIZOWFNVmQ93mDjZwEkim4nBGq0+CTR+zZDKl0zqxhdbvZLge8CXLI6Rx8lpFEhnxjhrb6B2AS0vhatyp3JIeDzqigQGPXqASi1hQB1VRKKMQIZk+Na3GO3hNSgbi30oNm7R1ImdsL4HDi8GOo=
Date: Fri, 4 Mar 2022 12:52:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Andrea Stevanato <andrea.stevanato@santannapisa.it>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: Network driver domain broken
Message-ID: <YiH9cee6NIKA6MWg@Air-de-Roger>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
X-ClientProxiedBy: MRXP264CA0036.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c90bd553-6729-4377-c9ba-08d9fdd5707d
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54695A2BBE67041324D884EE8F059@SJ0PR03MB5469.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LD0C07foqRo9r/W3LGHpq3LD+x5hx2u/xt961dyDz5SDwI9mDUyN01/c7AgJfIVNWH/E7nRizWz1tbnqxEPjvGhXSVieA15V5qzabkmwxFuE8l33LdPg4liU86HHWXGADt8bGaE6sHZhfa5wURvC/22e/XT28VUXGPONAbq8o1v/M7xwa3R2lP6QMkHSiBIjL+pt6LIfVY9FBmfyQggm9SnNnGK7kNTqJ8L0Gq99nyaOlcy0F1eYzWCfJLHb2ko8+CQpgronR1F1ViAavMohywne53TsGwp+qXeltCwoqQLI5BomA8okLj/2UxypchA2i+VtKJ4dFQ0Oy8v63SCdBV/7G/dtJ3CUNeBA1dzPwTBATs9GYpMygUe0drCPxmYQlmyUZ+QQHHXE1mVFKgWeY/yT1m4FD97mqiU2rqKp4nIOdFADIcVqxtlb7McZ6Co80q9FHCd3rxbbFcRx+goYdCcxm2vEv2RH/eTklR4O3S2lTbyGyc6/f34j4GaDyztKroPSbNtXpZ0yb8VAPqfk1hGCKTG6+v+12hC+0wwy5sFF2Do941YtUJ3TaQ0Umj4CPIwm3wDPKw/Uc0yisJlRNBRBgIE9hZ60BwxJ6HRBFF/tYOchm8jpluid7+P2BrDIaPxwrqe5vAFoGafbYEAuqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(82960400001)(85182001)(86362001)(38100700002)(83380400001)(6666004)(6512007)(9686003)(5660300002)(33716001)(4326008)(26005)(186003)(8676002)(6506007)(53546011)(316002)(6916009)(8936002)(66556008)(66476007)(66946007)(54906003)(508600001)(6486002)(3480700007)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YStQL01RNDFpc2FJMFZqcDdFZC8zb3pjNnN4K0twYURXVG5SbzBPTjdzMzYr?=
 =?utf-8?B?NnVDV2VvTFdScXBuYXlxemo2V2NHRTdpU0tJNHdzL010RE9vNjZBZjM3NDV6?=
 =?utf-8?B?YWI1cGhZamNJY3hCN1NRbnhMbWEyV010RzZUOVkyVU9lK1dVckNuSFBkWVda?=
 =?utf-8?B?eS9aRmM0YnpWOWRkUCsrNmE1YXBEOWpCSkJRYXNoT2NwQ1gxeE85V3RQUTBL?=
 =?utf-8?B?NEh2S2duN3F3NmxnNW0zTE1lSWJUVEZPMlhTdE1qQ3NqZXdFc2ZKWUllcEt0?=
 =?utf-8?B?ZExnSGJFdldXY0k1SXVWcGhqNG5BQWdsUFgwWHkxeGY4YmZnZkpTZWo3VFZG?=
 =?utf-8?B?TEQ3bHA1MFlHVTk1WVBaUlc4aDhUVGtSWXBPT1RKU2h2dHRkdkhPeGlzcC82?=
 =?utf-8?B?dUNSTTBpemFuZWJXU2ZnREpLc254VTV2cmwxak1nZHJoc0hsUEVDOWVUVGxq?=
 =?utf-8?B?ZEkvNEQzSzN5UnVQd29rRGMwMlFJMGx0TnhhcHU3eUhEMVJZUUV2MW5VQVVH?=
 =?utf-8?B?Qm1YTThCVjVId0tld1FZQW8yeUxBbDIxQlA0L2l4eEphZHVKbitJM1FmbXY2?=
 =?utf-8?B?RG8zRUtMUStOUzEveUFKRTMwS2xRbFZaUjF3bnFaS29YS1ZpV3JMYjR6cDdP?=
 =?utf-8?B?REN6TVhGbFB4WG9DVWpSZzFkWW9oeUhyUXBQOVBKVkxBQy8xVjBaaGlYeXJ5?=
 =?utf-8?B?OVZNdk1SbUo3WDBsVkVVdXZlb3c4b290bHVObnlWZVNQeFhaZHhnRGhUZXVQ?=
 =?utf-8?B?b3FoeFV1dHVOOXl1YUY3VG1UdnAxRVJnWnNpR3lXdDZmZVFjR2Fib2JKeEwy?=
 =?utf-8?B?c0tqWGVxRU9TektNaDMvTHpsQWNmNTMwSlNyYkhwRkZuQWM5cTF4WERnM3dH?=
 =?utf-8?B?YzB6SHg3alRNcnBZOHhvdlUwcUsrOW8vZjUraEg3bjhjRHBSR3ppdU5JZkdC?=
 =?utf-8?B?a0U3SlF5RTBCS0lBaTErNWdvWVJCRWRlQmJGWk91MDltSEtVTUs2NjE1UExL?=
 =?utf-8?B?dFVIdWwweC9ObGUzOGM2Z2VOUjhGYkJkemNsNjZHdnhwOEpxR3VwT1ZxR0NB?=
 =?utf-8?B?elhFVzl2V29sOHhQcm4yWmg5bXgxMUN1c0cxRXg1cnZrdmd6c0l4N0U1cUJ4?=
 =?utf-8?B?REN6cngxYWloMkNBREJyeXpROTdRc0w3RUJoakk4OVhNOG8vL204REkraDR6?=
 =?utf-8?B?cXNaUWVNZCtoQThXZzVUZlE5T2lOL0t6elpWY29CSWNIK3V2R1pWb1ozZnQv?=
 =?utf-8?B?aktOZGwyd1ZreE1VcDFrdGhucVp2T3FyRkdneUIvb2VicEhlWTZXVlFoejdj?=
 =?utf-8?B?aHNMcHc0bE1wY3V2aG5yUFBHTnlSckVpU2FlOVJGbGFxaEdSNlBDekRjOFlx?=
 =?utf-8?B?UlFsTy9RRzNsclIybTdyUHgxT08zZ3JzNVAweEFQdzNLQ0xJUmttK3ZuczlJ?=
 =?utf-8?B?SnBuOU9JYXhQMkt5ZWZuZ3NiN0FLd21WSDNRbUYvdnhMYUc4cVZFeXREQUZo?=
 =?utf-8?B?Q0dtdDZNeWF6MHBDaXFBYXZiQWlMalVBcm9rQlFNR0dxUWxhN2lmeGhjY2h1?=
 =?utf-8?B?cDMvZWgrNkgrbENXUDlxSkc5OE1WUC95K3ZYVnlPSVBFQXBvUzd5Ryt2bGpx?=
 =?utf-8?B?WTVQYjA5c2hFM2ZTaS9kVTlHdjNVM2h4WndzWmw2UFNDSnpEeWxLRDlIN2dn?=
 =?utf-8?B?SlVtcmlONDdaYzl4R3BhNWgvT1p1ZlR2aUl0N0ZHdmxTMHpyMHQ0M2FmdFN1?=
 =?utf-8?B?K0VjSlZ5c0RWZ3VueS9kVExSWkQrQXRyRDA5UUkyVU16TEhRU3ViS2M5OEx0?=
 =?utf-8?B?U2dVa3pCUzFCV0ZzRlI4bjRLdk5OcVVISmpJZDFBSlIrWWdNai9GbkNLT0ZF?=
 =?utf-8?B?N3ZrZlBzWmhDMkt6UFUrSUoyOWFjQ2FDOHBVRVVNZkhrSWJVOVRKbEpNZXoy?=
 =?utf-8?B?ZWVKTzIzTHFZL2RVUGdKMk9XdEFMQzlCSWk4R2tXTDRlcWU0WXJaTlF5djd5?=
 =?utf-8?B?dXVaS3QzOEdkK3ViMk4xWjRySzc0SHJ3THlmTDFWMUtRR3dxMnp2bTBvT0VJ?=
 =?utf-8?B?aWxWajFMY3dONkxiQU81S1M4dks0akR0THlZUGZGTGI0S3ZsK3NhMG1ENXB3?=
 =?utf-8?B?aFBTMmd0c0EyQTdCbUNBNzcxK0VTcnpVdjRmbU43S0dKWjRUUUVpLytNQWgr?=
 =?utf-8?Q?g2zMKk29wekR1GvYIpS8wE8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c90bd553-6729-4377-c9ba-08d9fdd5707d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 11:52:20.7896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pc+cz8DKgpL/Wczacuc0uJFSPMEGFYW3r1rbUVc542CEUby2cumJM2l+agazLMQy2YziT4p0XD2OWf4T9WedsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5469
X-OriginatorOrg: citrix.com

On Thu, Mar 03, 2022 at 01:08:31PM -0500, Jason Andryuk wrote:
> On Thu, Mar 3, 2022 at 11:34 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Thu, Mar 03, 2022 at 05:01:23PM +0100, Andrea Stevanato wrote:
> > > On 03/03/2022 15:54, Andrea Stevanato wrote:
> > > > Hi all,
> > > >
> > > > according to the conversation that I had with royger, aa67b97ed34  broke the driver domain support.
> > > >
> > > > What I'm trying to do is to setup networking between guests using driver domain. Therefore, the guest (driver) has been started with the following cfg.
> > > >
> > > > name    = "guest0"
> > > > kernel  = "/media/sd-mmcblk0p1/Image"
> > > > ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> > > > extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
> > > > memory  = 1024 vcpus   = 2
> > > > driver_domain = 1
> > > >
> > > > On guest0 I created the bridge, assigned a static IP and started the udhcpd on xenbr0 interface.
> > > > While the second guest has been started with the following cfg:
> > > >
> > > > name    = "guest1"
> > > > kernel  = "/media/sd-mmcblk0p1/Image"
> > > > ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> > > > extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
> > > > memory  = 1024 vcpus   = 2
> > > > vcpus   = 2
> > > > vif = [ 'bridge=xenbr0, backend=guest0' ]
> > > >
> > > > Follows the result of strace xl devd:
> > > >
> > > > # strace xl devd
> > > > execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) = 0
> 
> > > > ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
> > > > write(2, "libxl: ", 7libxl: )                  = 7
> > > > write(2, "error: ", 7error: )                  = 7
> > > > write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
> > > > write(2, "\n", 1
> > > > )                       = 1
> > > > clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xffff9ee7a0e0) = 814
> > > > wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 814
> > > > --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=814, si_uid=0, si_status=0, si_utime=2, si_stime=2} ---
> 
> xl devd is daemonizing, but strace is only following the first
> process.  Use `strace xl devd -F` to prevent the daemonizing (or
> `strace -f xl devd` to follow children).

Or as a first step try to see what kind of messages you get from `xl
devd -F` when trying to attach a device using the driver domain.

> > > > close(6)                                = 0
> > > > close(5)                                = 0
> > > > munmap(0xffff9f45f000, 4096)            = 0
> > > > close(7)                                = 0
> > > > close(10)                               = 0
> > > > close(9)                                = 0
> > > > close(8)                                = 0
> > > > close(11)                               = 0
> > > > close(3)                                = 0
> > > > close(4)                                = 0
> > > > exit_group(0)                           = ?
> > > > +++ exited with 0 +++
> > > >
> > > > royger told me that it is a BUG and not an issue with my setup. Therefore here I am.
> >
> > Just a bit more context: AFAICT the calls to libxl_cpu_bitmap_alloc in
> > parse_global_config will prevent xl from being usable on anything
> > different than the control domain (due to sysctl only available to
> > privileged domains). This is an issue for 'xl devd', as it won't
> > start anymore.
> 
> These look non-fatal at first glance?

Indeed. I was too quick reading the trace and assumed `xl devd` exited
due to the errors, but those are non fatal, the process just
daemonized.

Thanks, Roger.

