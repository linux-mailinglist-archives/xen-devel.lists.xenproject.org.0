Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A8E690CEF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492597.762218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8pu-0006Q4-9x; Thu, 09 Feb 2023 15:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492597.762218; Thu, 09 Feb 2023 15:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8pu-0006Nl-6G; Thu, 09 Feb 2023 15:27:46 +0000
Received: by outflank-mailman (input) for mailman id 492597;
 Thu, 09 Feb 2023 15:27:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3QCz=6F=citrix.com=prvs=397b6fb01=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQ8ps-0006Ho-Ni
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:27:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ac0e3e1-a88e-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 16:27:43 +0100 (CET)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2023 10:27:40 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4950.namprd03.prod.outlook.com (2603:10b6:a03:1e1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 15:27:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 15:27:38 +0000
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
X-Inumbo-ID: 4ac0e3e1-a88e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675956463;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gwL1S2wToJj4TH07ojDEZCKN8n8oHN+LSMCKlg5Dj50=;
  b=e0XGoklz39wiGt1kzDS3XziZHvXt66wknXHZcux0cwzgXGfcS2p+Ark3
   fI8NqiFvf9wRM9p9w6YWiOPjBS3RYNhfDhBfoHcsNMzHoNw9ZYaOtkSXX
   6lnrp8TFVe66JdLs1aMnzGJQcan2tfHwGMx7sAxLMARKHsuiYe8gNgagz
   I=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 96380039
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OfX2EaDnnaL3SxVW/8ziw5YqxClBgxIJ4kV8jS/XYbTApDwhhDQOm
 GYeXG6DbqnfYmqjKNtxbIu1p0wHucPQzNVnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlA7wRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/8BrLUtA/
 NgkFg8uKS+DgvC7wbKnY7w57igjBJGD0II3nFhFlGmcKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+Oxuuzm7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6RxnOjANlDfFG+3sxMn1DM+TMLND0Hd2n4k6iUtm6XXfsKf
 iT4/QJr98De7neDTNbnWAajiGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5lvaCRSHmd3qyJtj70Mi8QRUcAeCsFQA0t89Tl5oYpgXrnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqYjyKGT7V3BxTW2qfD0ohUd4wzWWieg8Vl/bYv8P4iwswGDvLBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4ulmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:H6YS66//d0dOWkDhrBduk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-IronPort-AV: E=Sophos;i="5.97,284,1669093200"; 
   d="scan'208";a="96380039"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfsOrpXJM3NK2XlFhy4x+mfDptjtzBy5niC5P1plvVao2T3wfvy02LJkfy9MyucH8Z7qS3XbI4LwWGKU+XBbBDYUc76eRyAq+bj67TiJpP9A65JQzZZvDglZEwadnLk0i71FjZm4xMM/ULyOhWhYWWmbEAEzfOGW/5ZMcE88LIgF2T9cOCByne6TxHAqoh6uxuDhEzCx0k2lroAyVjB1/koDYB+UhKl5rPcESzVbz7LMQTOOH9whEOgXFBSTSUpyCXwEjVfYUu1Pm5ZB8sdBt76C/v1njyya3nvjd0I1YG433j3zCjd0aYqW1sg+/7FrI1kb6aFbO9Qz7l+2D9C/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwL1S2wToJj4TH07ojDEZCKN8n8oHN+LSMCKlg5Dj50=;
 b=I8bbPfqebaMqiH+OoghLEUyVVXms6QGyJwwOMfKJnDWIs1azQBcS3YeQuflMf9Xhaz26iOhx8KwWBIyoOIENsipEk8vlNvy3RgBPh7IhuyV8uNYbFIvzfUpqWL14c47MBlBD/FRXvtBQxli6QkM/v6ATxlscpUkLYLpCn7bWKUwNYO1q42nN/+7B53cpA8iFSGMl7yVOpRLDYFkRS2yJuAUqJyYsUTiKcHkdVVteEcu8TkBP/g64RWK22/+VX7nDpmt9kXw7AWBwNo+O7hpNZl9i5+LIZxSbrpJvdCFnZMVGpOpuuudKdx8TRJuKemyEgBu/drrPY4aYzJdeC4ILiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwL1S2wToJj4TH07ojDEZCKN8n8oHN+LSMCKlg5Dj50=;
 b=WgMJhw+AESG/+K3jhJpdO5Rcz/fKwL7v7/MN+xCvwx2EZxw10d5fnnsTfph85IVMQ4icnCSsn2J4kjggBenEQIPxllJasMKjD+1Ri4qGqIcTb5fCfY2ecr+RekAresvY4Y35aUGBp1oZpQirRGBNPPlh17Ld9B9bfI4Bc1KmBKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <748b07d4-a114-1d5e-70ad-611f66780119@citrix.com>
Date: Thu, 9 Feb 2023 15:27:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] docs: clarify xenstore permission documentation
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Edwin Torok <edvin.torok@citrix.com>
References: <20230209144148.4132-1-jgross@suse.com>
 <201204d9-038b-9edf-8132-fa697ab36175@citrix.com>
 <e0da9d10-9329-550d-2efc-0001e8ec8bf6@suse.com>
In-Reply-To: <e0da9d10-9329-550d-2efc-0001e8ec8bf6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c50f7ac-ed5b-43f8-d96c-08db0ab22d32
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pqCrILnAJeiieUYPRuaKE/cQG3GQUxzZCR16dMGjYXrw903euL5+LKg27dTJBWXIU39Y1FSpkPyFD9cT3y4dUfiNVrt8BtYpCdCIWthLY2ydYrxHgrwZ5EFFLOSUj1VS7imG7yYsCvknyASpnekzxVvUgpLY1uEkm1PBm8Idt8hz0Qgjxg0nUjCLd+xDf++jxFwC1hc6rxuWgvedQL24Gdt0K53QevOGw0Z58eXeoLpw7BxbUvBPU07qDcJotPsJ4FfQi/AxGIvMwqHS5BwC9OIQc+OsopEzqZDzrblMw/DUxAqD8cXF3TGmqmPIgS+ghc3PSJZC7idlgSTc454YtHRcXdCbrYWq85jgQc1HTpHjyTHn00jW7uQ3DhRr62+lXgc1IBanXUvqu4xqA/4soRF99zU6592zKvkftGrnE1jLF9fPPx7fgOP/KQ9Oxx667vXXblfqVOz1IZa6Pj7mK5tZIW3WI8Nmpra7YIsA3RVrS48MwDtDyjcrYt9hUY9sEIwizHyCCELGoPcHOhW+54wJtfVpnpwNZrpzBuGbeNO217qHxW6gm0eVy5PR2r1pjTiJ8biNe6taLm9DzA+GzA7IY7Xrhtz4IbylhzxbdLecCmAAiSCvokhSABCHuXldCcedOCxsvw9S6IxEm039YX0NnIUMoJ7nGEx7ND+iyNVL47s+Kr5ghv33XYc51VfH/uCyQ52sJIvgQF0wT3e6LL2lWip5bn1sTm8sPETWREsCIa0tT26Qtkwm6156E2yT6HTxLj/fBwiuB/UJJ4SI0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(31686004)(36756003)(82960400001)(38100700002)(31696002)(86362001)(66476007)(66556008)(66946007)(2616005)(83380400001)(6486002)(6506007)(53546011)(478600001)(186003)(966005)(26005)(6512007)(54906003)(107886003)(5660300002)(4326008)(8676002)(316002)(6666004)(2906002)(4744005)(8936002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXVEMWJPYkxGelVVMlRZRTNibzRTOERKNWRKVHRYZ2FUV3k3QkE4eW9xbFEw?=
 =?utf-8?B?dWd5SlJ3RUFZZm94aWhOWTNSNHNCRldKZUhxOG5FTlZyWHVaQUpOTFRqaEtx?=
 =?utf-8?B?ZVBseDgwVDJvVG5MU2pNcm5OSmlPSFNhWGJsTElyUTE2NGQ0TS8zREIrRzlj?=
 =?utf-8?B?dnFSZHIvME5EQ3BEbUFVZmhtdmY4R2tPTUgwNk5LUjhxZk9rbjRuYm5zNWJr?=
 =?utf-8?B?REVvQkI5RHgrSUlDUzJzNGR1WVNLUVBVSkFzNnJ5aDBZaWIxbW1kVVRWT2FV?=
 =?utf-8?B?Zkg2VFhRK1UvTERiRm9ITzJnYVV0cWQrY2x0T1k2VWoxM2V6RVpLdm1IeFRt?=
 =?utf-8?B?N25UTHhIMFlxUUdlVWZveVlwRTRWSTIwdXRZb1YxbEJ5aWtOZUM1c2o4OW5h?=
 =?utf-8?B?anNSSFRWN085Y0FMQndCNVArUFFVblVaNnVDR3JNK1dRWHZPdlord1FsTUx3?=
 =?utf-8?B?T2ZqSnNYR1hBanJGOVB3UTcwSlJFR0VZcmYxYnlHRkVNaWwwdmZkd3pCbHgw?=
 =?utf-8?B?TFZRcEtnZm5zWFpUOC91OTBXaWVGaFNGUjAxeXFJUXdIWlBjbTNBNU5hcDVI?=
 =?utf-8?B?eUc2L0ZXMXFkQjBnODF6WE9hbS9tTUtwdU5EckZIUGgwTEJQV3dwRVFtaE9H?=
 =?utf-8?B?bTMxVG9pR1RXRWRPSk0vYW9JQW5GT1pldGNDelk5bTdaY0tnb1NyU1MwdUJS?=
 =?utf-8?B?c2FxR09OQVY3S0Z4UWpxYTFxVUEvbndUc2RNZ1pualhsMzRyeGlKdWl1ZkVP?=
 =?utf-8?B?SHV1cjlZTnlaemIvWFZkUjE0cjVva0pIT2xwNFBmRUU3NkRxMVZ4aytkYmkz?=
 =?utf-8?B?bjdqR0lVaURnL08zMlB2NWlkRW1pR3dBKzBvclBzUGt1T2k3cXRYTUN4ZUVi?=
 =?utf-8?B?MjJlU1lXOEp2YTUyazZ3QUcwWUtVL29NWEowZXQ3b3BaekJJdFFQM0JGRVVN?=
 =?utf-8?B?ZG9HaUV6OHRHOUxMQlMrQXR3NXUyZUNoQjZmS0tGNng2S0FCdnVMWXViRElq?=
 =?utf-8?B?TXFBczllbzJaaHBBdTVlbjU0dHBXaXJmY0NvVW5QOEpncUcrRGJCYU9XU2hm?=
 =?utf-8?B?SG5YNkJkMmFYUm8rS3pRT3BWMWxjeHd6VUVtRUNKTlNuZTl6Tm9ZMDJ6NHdU?=
 =?utf-8?B?YkszaUd0eFFrUUF6bVZ4UXU3MUQ5UHlBQnlub013bDN0WDVvb0NCZks4dGpm?=
 =?utf-8?B?QVRSSUhESlFxaHZ0WHZ5cUh3Qk4wSXBhYUhUck5pc05FY2xGd3pjR1JlVUpw?=
 =?utf-8?B?anVOOTdXRFpJVTVxYlZuTTRleXlNb2tIMDIvSGdZMFpSOVpBcUgrZUs4aE4r?=
 =?utf-8?B?bVlqK1JiYmhZbWQ3cWRWV2tYUWRBLzhIY0xGNjN0dnk3dGZ1MStaRVc4eTJi?=
 =?utf-8?B?L0Qwa1JyNm5hSTRSUVdWNHE5U1F5WGhVVmlFRGdtZk41QnZzODIvc0ZYMWF1?=
 =?utf-8?B?eStRZ28rMlkyR0dlcjNpMmtucWJkZW90SnVkSmRPa29NMkF6cEo4OVdsc0pG?=
 =?utf-8?B?Y2J3cTNYU0dCdmRzUWUvNzN3Q2tVNzViQW9xYm9UMERYYzhkNnd5QUN6MlVj?=
 =?utf-8?B?bTREaHJ0dFByQ3hQQnNWa0k1MzJzaVNMQ0t2RG9sZ01pWEhmSUpJdGJCTGNr?=
 =?utf-8?B?ZDBkamIvZGhSTEVGVzN4YytTeUdQVTVWSkJJSjlHSE9LUS81Snd0ZWJHOTho?=
 =?utf-8?B?ZGFTY2EyVTdMdGFlU3QrUFIrM3Exc29ld01aOHRPczJ0RVd4bzc5VjJpcitP?=
 =?utf-8?B?M3B4NW91dDFRQ3poL1NZc1dNVjF0c2lLWWRiMTdKUFJ3VTVyU2ZhK0JRQnZ6?=
 =?utf-8?B?dlF5cGd6K1JZTlMyL3hEcWp6bGY4Um12dDFQQjA0QXRYVDIrRFlIM0tsZFYy?=
 =?utf-8?B?WC9lWlJVYythb3NOdWlJbkhkZWdCcHVRbDZuMXJkNFVNbFlyY0dYRnQxZ2xs?=
 =?utf-8?B?ZUJORTdNdVFvUTBDbmlhWlJreWNHdWNRUExMZSs3NnRVTmtWMmFzVlorS1k2?=
 =?utf-8?B?Q0JLbEZyNlVzYmtFL1grUnZSU0ZkNXdLSHB0QjRia0hEZXZEU2hiWnFjdUlu?=
 =?utf-8?B?QnBiZnRkKzVHcjZRTitteStjUm1PQ3h1LzJ1d3hFZmxUVzk1R214WGR4N1BK?=
 =?utf-8?B?dlRQWjAvUTVxQktTclA0TDRvM3V1bUNUaHNSNGQ4R0lrTlJ0SFR6Vy9iOVRY?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qHIfKvdFR2++dZ8y1lC3UJpiDKxQ/W+qYnlGnlNV6q3B3D7YybS/TvelyEfPY3OGN1xBJJ/zHFDDPGAPLMZ/t3wbhkr/2xGkfRVADNcKRYArjAsWxPD2umnMXaNj7sYAUtApQgC9vrh2pqUOUluMgFxsab135IDFTag4suMe1Pwx10k2eJhsADSu/Kg0IOk8//3RepoUVruuKQ6eskVHhe4NYOfEriBO1kNH/1dmhV7JfFA3870DZMMrksbIK0qGCldaDdkOQjf5Gcv53CBMoM5UkvtFab5QuMSt3gjwfHKw7IQa8xWt+qtuGbqpx3C2/Hx0yTMBiBNU9qyGTlgWHFCDvLhQI4RT2/SoSzdufekvf2EpVjGqZdzdGcQOG1umW84970gPMouuX5PodR611QVYU+yMPetSdxLsYH7MLoT92L8zxDifkHW7Zle42QxkMeZHnRu606cZTGTuduEu1IYxRIWI7mPWb4HtdvBmK4Ycc6nHIyNeq4edgmHCzk9TtSCNt/+NIkOIop1vHlT7tPSej4ZCbgK0Oii5F6nUFbaH0W7sZ9Ab5k7G53XM+otcYKipu7fKtQGI44lTAWzDRW+u45Ur6zQvAylVH1/KT/yiBi4SrgOmIFvIk61u2ux1LRCpehnQllmAwnsP+hFweWo3KVQlkIe3YOfP9p9fS4rF9GtvUC1OrqYxdUjZ9SOpcB7OnhdL6Fy2+XqASd2kUHRel5/FwjyVqt3JyUIIcwpnbB+r8bLfJdFeczk8l7K2+wEn1zTV50xPJRpIE6wnJmSGYgd/O7hM1bNLvEthrgEeLMLpvO7gsd91Cf7Vxx4b3zhNTUNyq5L13JCXy6Q4AuOXnyNoyRlMu40hLg7sev0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c50f7ac-ed5b-43f8-d96c-08db0ab22d32
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 15:27:38.4164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gDVXqAevX4h9DTMLsp7y70JBzYRLYuHu/qvMx7xuSeavRKJGwhJxgDZx2GSJld4AgXrry0NL+Re2nePgB0H1tZzLMU85uSA3AbKWX5LwRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4950

On 09/02/2023 3:24 pm, Juergen Gross wrote:
> On 09.02.23 16:15, Andrew Cooper wrote:
>> On 09/02/2023 2:41 pm, Juergen Gross wrote:
>>> In docs/misc/xenstore.txt the description of the Xenstore node access
>>> permissions is missing one important aspect, which can be found only
>>> in the code or in the wiki [1]:
>>>
>>> The first permission entry is defining the owner of the node via the
>>> domid, and the access rights for all domains NOT having a dedicated
>>> permission entry.
>>>
>>> Make that aspect clear in the official documentation.
>>>
>>> [1]: https://wiki.xenproject.org/wiki/XenBus#Permissions
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> I feel as if Edvin deserves some kind of credit here, seeing as it was
>> his observation...
>
> I wouldn't mind. What kind of tag would be appropriate? "Reported-by:"?

Probably.  I can't think of anything better.

(and as usual, can be fixed on commit if that's the only issue)

~Andrew

